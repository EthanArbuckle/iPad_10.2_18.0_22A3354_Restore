@implementation _WKPreviewControllerDelegate

- (_WKPreviewControllerDelegate)initWithSystemPreviewController:(void *)a3
{
  _WKPreviewControllerDelegate *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_WKPreviewControllerDelegate;
  result = -[_WKPreviewControllerDelegate init](&v5, sel_init);
  if (result)
    result->_previewController = a3;
  return result;
}

- (void)previewControllerDidDismiss:(id)a3
{
  _QWORD *previewController;
  NSObject *v4;
  uint64_t v5;
  const void *v6;
  const void *v7;
  const void *v8;
  const void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  previewController = self->_previewController;
  if (previewController)
  {
    v4 = qword_1ECE71938;
    if (os_log_type_enabled((os_log_t)qword_1ECE71938, OS_LOG_TYPE_DEFAULT))
    {
      v5 = previewController[12];
      v10 = 134217984;
      v11 = v5;
      _os_log_impl(&dword_196BCC000, v4, OS_LOG_TYPE_DEFAULT, "SystemPreview ended on %lld", (uint8_t *)&v10, 0xCu);
    }
    v6 = (const void *)previewController[30];
    previewController[30] = 0;
    if (v6)
      CFRelease(v6);
    v7 = (const void *)previewController[31];
    previewController[31] = 0;
    if (v7)
      CFRelease(v7);
    v8 = (const void *)previewController[29];
    previewController[29] = 0;
    if (v8)
      CFRelease(v8);
    v9 = (const void *)previewController[32];
    previewController[32] = 0;
    if (v9)
      CFRelease(v9);
    *((_BYTE *)previewController + 8) = 0;
  }
}

- (id)presentingViewController
{
  _QWORD *previewController;

  previewController = self->_previewController;
  if (previewController)
    return (id)(*(uint64_t (**)(_QWORD))(**(_QWORD **)(previewController[2] + 104) + 488))(*(_QWORD *)(previewController[2] + 104));
  else
    return 0;
}

- (CGRect)previewController:(id)a3 frameForPreviewItem:(id)a4 inSourceView:(id *)a5
{
  id v7;
  void *v8;
  _QWORD *previewController;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect result;

  v7 = -[_WKPreviewControllerDelegate presentingViewController](self, "presentingViewController", a3, a4);
  if (v7)
  {
    v8 = (void *)objc_msgSend(v7, "view");
    *a5 = v8;
    previewController = self->_previewController;
    if (*((int *)previewController + 30) < 1 || *((int *)previewController + 31) < 1)
    {
      objc_msgSend(v8, "frame");
      v15 = v17 * 0.5;
      objc_msgSend(*a5, "frame");
      v16 = v18 * 0.5;
      objc_msgSend(*a5, "frame");
      v14 = (v19 - v15) * 0.5;
      objc_msgSend(*a5, "frame");
      v13 = (v20 - v16) * 0.5;
    }
    else
    {
      v10 = (char *)(previewController + 14);
      v11 = *(_QWORD *)(previewController[2] + 40);
      if (v11)
        v12 = *(_QWORD *)(v11 + 8);
      else
        v12 = 0;
      (*(void (**)(uint64_t))(*(_QWORD *)v12 + 1584))(v12);
      (*(void (**)(uint64_t, char *))(*(_QWORD *)v12 + 504))(v12, v10);
      (*(void (**)(uint64_t))(*(_QWORD *)v12 + 1592))(v12);
      WebCore::IntRect::operator CGRect();
      v14 = v21;
      v15 = v22;
      v16 = v23;
    }
  }
  else
  {
    v14 = *MEMORY[0x1E0C9D648];
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v15 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v16 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  v24 = v14;
  v25 = v15;
  v26 = v16;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v13;
  result.origin.x = v24;
  return result;
}

- (id)previewController:(id)a3 transitionImageForPreviewItem:(id)a4 contentRect:(CGRect *)a5
{
  CGSize v7;
  id v8;
  void *v9;
  IntRect *p_linkRect;
  uint64_t v11;
  uint64_t v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  const void *v19;
  CGPoint v21;

  v7 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  a5->origin = (CGPoint)*MEMORY[0x1E0C9D648];
  a5->size = v7;
  v8 = -[_WKPreviewControllerDelegate presentingViewController](self, "presentingViewController", a3, a4);
  if (v8)
  {
    v9 = v8;
    if (self->_linkRect.m_size.m_width < 1 || self->_linkRect.m_size.m_height <= 0)
    {
      objc_msgSend((id)objc_msgSend(v8, "view", *MEMORY[0x1E0C9D538], *(_QWORD *)(MEMORY[0x1E0C9D538] + 8)), "frame");
      v14 = v13 * 0.5;
      objc_msgSend((id)objc_msgSend(v9, "view"), "frame");
      v16 = v15 * 0.5;
      a5->origin = v21;
      a5->size.width = v14;
    }
    else
    {
      p_linkRect = &self->_linkRect;
      v11 = *(_QWORD *)(*((_QWORD *)self->_previewController + 2) + 40);
      if (v11)
        v12 = *(_QWORD *)(v11 + 8);
      else
        v12 = 0;
      (*(void (**)(uint64_t))(*(_QWORD *)v12 + 1584))(v12);
      (*(void (**)(uint64_t, IntRect *))(*(_QWORD *)v12 + 504))(v12, p_linkRect);
      v18 = v17;
      (*(void (**)(uint64_t))(*(_QWORD *)v12 + 1592))(v12);
      v16 = (double)SHIDWORD(v18);
      a5->origin = (CGPoint)*MEMORY[0x1E0C9D538];
      a5->size.width = (double)(int)v18;
    }
    a5->size.height = v16;
  }
  v19 = (const void *)objc_opt_new();
  return (id)(id)CFMakeCollectable(v19);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
