@implementation WKImagePreviewViewController

- (void)loadView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WKImagePreviewViewController;
  -[WKImagePreviewViewController loadView](&v3, sel_loadView);
  objc_msgSend((id)-[WKImagePreviewViewController view](self, "view"), "setBackgroundColor:", objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor"));
  objc_msgSend((id)-[WKImagePreviewViewController view](self, "view"), "addSubview:", self->_imageView.m_ptr);
}

- (WKImagePreviewViewController)initWithCGImage:(RetainPtr<CGImage *>)a3 defaultActions:(RetainPtr<NSArray>)a4 elementInfo:(RetainPtr<_WKActivatedElementInfo>)a5
{
  id v8;
  const void *v9;
  const void *v10;
  id v11;
  void *v12;
  const void *v13;
  const void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  size_t Width;
  size_t Height;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  const void *v27;
  const void *v28;
  const void *v29;
  const void *v30;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)WKImagePreviewViewController;
  v8 = -[WKImagePreviewViewController initWithNibName:bundle:](&v32, sel_initWithNibName_bundle_, 0, 0);
  if (v8)
  {
    v9 = *(const void **)a3.m_ptr;
    if (v9)
      CFRetain(v9);
    v10 = (const void *)*((_QWORD *)v8 + 123);
    *((_QWORD *)v8 + 123) = v9;
    if (v10)
      CFRelease(v10);
    v11 = objc_alloc(MEMORY[0x1E0CEA658]);
    v12 = (void *)objc_msgSend(v11, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v13 = (const void *)*((_QWORD *)v8 + 124);
    *((_QWORD *)v8 + 124) = v12;
    if (v13)
    {
      CFRelease(v13);
      v12 = (void *)*((_QWORD *)v8 + 124);
    }
    objc_msgSend(v12, "setContentMode:", 2);
    v14 = (const void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithCGImage:", *((_QWORD *)v8 + 123));
    objc_msgSend(*((id *)v8 + 124), "setImage:", v14);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen"), "bounds");
    v16 = v15;
    v18 = v17;
    Width = CGImageGetWidth(*((CGImageRef *)v8 + 123));
    Height = CGImageGetHeight(*((CGImageRef *)v8 + 123));
    v21 = (double)Width;
    v22 = (double)Height;
    v23 = (double)Width / (double)Height;
    if (v23 <= v16 / v18)
    {
      if (v23 < v16 / v18)
        v16 = v18 / v22 * v21;
    }
    else
    {
      v18 = v16 / v21 * v22;
    }
    v24 = (void *)*((_QWORD *)v8 + 124);
    objc_msgSend(v24, "frame");
    v26 = v25;
    objc_msgSend(*((id *)v8 + 124), "frame");
    objc_msgSend(v24, "setFrame:", v26);
    objc_msgSend(v8, "setPreferredContentSize:", v16, v18);
    v27 = *(const void **)a4.m_ptr;
    if (v27)
      CFRetain(v27);
    v28 = (const void *)*((_QWORD *)v8 + 121);
    *((_QWORD *)v8 + 121) = v27;
    if (v28)
      CFRelease(v28);
    v29 = *(const void **)a5.m_ptr;
    if (v29)
      CFRetain(v29);
    v30 = (const void *)*((_QWORD *)v8 + 122);
    *((_QWORD *)v8 + 122) = v29;
    if (v30)
      CFRelease(v30);
    if (v14)
      CFRelease(v14);
  }
  return (WKImagePreviewViewController *)v8;
}

- (void)viewDidLayoutSubviews
{
  void *m_ptr;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WKImagePreviewViewController;
  -[WKImagePreviewViewController viewDidLayoutSubviews](&v4, sel_viewDidLayoutSubviews);
  m_ptr = self->_imageView.m_ptr;
  objc_msgSend((id)-[WKImagePreviewViewController view](self, "view"), "bounds");
  objc_msgSend(m_ptr, "setFrame:");
}

- (id)previewActionItems
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id obj;
  _QWORD v14[6];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = self->_imageActions.m_ptr;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v9 = (void *)MEMORY[0x1E0CEA898];
        v10 = objc_msgSend(v8, "title");
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __50__WKImagePreviewViewController_previewActionItems__block_invoke;
        v14[3] = &unk_1E34BA030;
        v14[4] = v8;
        v14[5] = self;
        v11 = (void *)objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 0, v14);
        objc_msgSend(v11, "setImage:", +[_WKElementAction imageForElementActionType:](_WKElementAction, "imageForElementActionType:", objc_msgSend(v8, "type")));
        objc_msgSend(v3, "addObject:", v11);
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }
  return v3;
}

uint64_t __50__WKImagePreviewViewController_previewActionItems__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "runActionWithElementInfo:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 976));
}

- (void).cxx_destruct
{
  void *m_ptr;
  void *v4;
  void *v5;
  void *v6;

  m_ptr = self->_imageView.m_ptr;
  self->_imageView.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = self->_image.m_ptr;
  self->_image.m_ptr = 0;
  if (v4)
    CFRelease(v4);
  v5 = self->_activatedElementInfo.m_ptr;
  self->_activatedElementInfo.m_ptr = 0;
  if (v5)
    CFRelease(v5);
  v6 = self->_imageActions.m_ptr;
  self->_imageActions.m_ptr = 0;
  if (v6)
    CFRelease(v6);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 121) = 0;
  *((_QWORD *)self + 122) = 0;
  *((_QWORD *)self + 123) = 0;
  *((_QWORD *)self + 124) = 0;
  return self;
}

@end
