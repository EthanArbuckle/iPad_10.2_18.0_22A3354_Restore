@implementation ICPencilKitAttachmentResizeHandleAccessibilityElement

- (ICPencilKitAttachmentResizeHandleAccessibilityElement)initWithAttachmentAccessibilityElement:(id)a3 drawingResizeView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  ICPencilKitAttachmentResizeHandleAccessibilityElement *v11;
  ICPencilKitAttachmentResizeHandleAccessibilityElement *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "textView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessibilityContainer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  ICAccessibilityFindReparentingTarget(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v14.receiver = self;
  v14.super_class = (Class)ICPencilKitAttachmentResizeHandleAccessibilityElement;
  v11 = -[ICPencilKitAttachmentResizeHandleAccessibilityElement initWithAccessibilityContainer:](&v14, sel_initWithAccessibilityContainer_, v10);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_attachmentElement, v6);
    objc_storeWeak((id *)&v12->_drawingResizeView, v7);
  }

  return v12;
}

- (BOOL)top
{
  void *v3;
  double MidY;
  void *v5;
  BOOL v6;
  CGRect v8;
  CGRect v9;

  -[ICPencilKitAttachmentResizeHandleAccessibilityElement drawingResizeView](self, "drawingResizeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityFrame");
  MidY = CGRectGetMidY(v8);
  -[ICPencilKitAttachmentResizeHandleAccessibilityElement attachmentElement](self, "attachmentElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityFrame");
  v6 = MidY < CGRectGetMidY(v9);

  return v6;
}

- (BOOL)isEnabled
{
  void *v2;
  char v3;

  -[ICPencilKitAttachmentResizeHandleAccessibilityElement drawingResizeView](self, "drawingResizeView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("enabled"));

  return v3;
}

- (BOOL)isAccessibilityElement
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  double v7;

  -[ICPencilKitAttachmentResizeHandleAccessibilityElement drawingResizeView](self, "drawingResizeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "safeBoolForKey:", CFSTR("shown")))
  {
    -[ICPencilKitAttachmentResizeHandleAccessibilityElement drawingResizeView](self, "drawingResizeView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isHidden") & 1) != 0)
    {
      v5 = 0;
    }
    else
    {
      -[ICPencilKitAttachmentResizeHandleAccessibilityElement drawingResizeView](self, "drawingResizeView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "alpha");
      v5 = v7 > 0.0;

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  _BOOL4 v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICPencilKitAttachmentResizeHandleAccessibilityElement;
  v3 = -[ICPencilKitAttachmentResizeHandleAccessibilityElement accessibilityTraits](&v7, sel_accessibilityTraits);
  v4 = -[ICPencilKitAttachmentResizeHandleAccessibilityElement isEnabled](self, "isEnabled");
  v5 = *MEMORY[0x1E0DC4698];
  if (v4)
    v5 = 0;
  return v5 | v3;
}

- (id)accessibilityLabel
{
  _BOOL4 v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v2 = -[ICPencilKitAttachmentResizeHandleAccessibilityElement top](self, "top");
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
    v5 = CFSTR("Handwriting area top resize handle");
  else
    v5 = CFSTR("Handwriting area bottom resize handle");
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1EA7E9860, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)accessibilityHint
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Double tap and hold, then drag to resize handwriting area."), &stru_1EA7E9860, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CGRect)accessibilityFrame
{
  CGFloat v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  uint64_t i;
  void *v16;
  BOOL v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;
  CGRect v32;
  CGRect result;
  CGRect v34;
  CGRect v35;

  v31 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0C9D628];
  v3 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[ICPencilKitAttachmentResizeHandleAccessibilityElement drawingResizeView](self, "drawingResizeView", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subviews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v27;
    v11 = v5;
    v12 = v4;
    v13 = v3;
    v14 = v2;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(v7);
        v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v32.origin.x = v14;
        v32.origin.y = v13;
        v32.size.width = v12;
        v32.size.height = v11;
        v34.origin.x = v2;
        v34.origin.y = v3;
        v34.size.width = v4;
        v34.size.height = v5;
        v17 = CGRectEqualToRect(v32, v34);
        objc_msgSend(v16, "accessibilityFrame");
        if (!v17)
        {
          v35.origin.x = v14;
          v35.origin.y = v13;
          v35.size.width = v12;
          v35.size.height = v11;
          *(CGRect *)&v18 = CGRectUnion(*(CGRect *)&v18, v35);
        }
        v14 = v18;
        v13 = v19;
        v12 = v20;
        v11 = v21;
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v9);
  }
  else
  {
    v11 = v5;
    v12 = v4;
    v13 = v3;
    v14 = v2;
  }

  v22 = v14;
  v23 = v13;
  v24 = v12;
  v25 = v11;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (CGPoint)accessibilityActivationPoint
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  -[ICPencilKitAttachmentResizeHandleAccessibilityElement drawingResizeView](self, "drawingResizeView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("knobView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "accessibilityActivationPoint");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (id)accessibilityContainer
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICPencilKitAttachmentResizeHandleAccessibilityElement;
  -[ICPencilKitAttachmentResizeHandleAccessibilityElement accessibilityContainer](&v5, sel_accessibilityContainer);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  ICAccessibilityFindReparentingTarget(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ICPencilKitAttachmentAccessibilityElement)attachmentElement
{
  return (ICPencilKitAttachmentAccessibilityElement *)objc_loadWeakRetained((id *)&self->_attachmentElement);
}

- (void)setAttachmentElement:(id)a3
{
  objc_storeWeak((id *)&self->_attachmentElement, a3);
}

- (UIView)drawingResizeView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_drawingResizeView);
}

- (void)setDrawingResizeView:(id)a3
{
  objc_storeWeak((id *)&self->_drawingResizeView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_drawingResizeView);
  objc_destroyWeak((id *)&self->_attachmentElement);
}

@end
