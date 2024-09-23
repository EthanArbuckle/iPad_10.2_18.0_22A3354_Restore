@implementation WKTargetedPreviewContainer

- (WKTargetedPreviewContainer)initWithContentView:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  WKTargetedPreviewContainer *v8;
  WKTargetedPreviewContainer *v9;
  objc_super v11;

  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v11.receiver = self;
  v11.super_class = (Class)WKTargetedPreviewContainer;
  v8 = -[WKTargetedPreviewContainer initWithFrame:](&v11, sel_initWithFrame_, v4, v5, v6, v7);
  v9 = v8;
  if (v8)
    objc_storeWeak((id *)&v8->_contentView, a3);
  return v9;
}

- (void)_didRemoveSubview:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WKTargetedPreviewContainer;
  -[WKTargetedPreviewContainer _didRemoveSubview:](&v4, sel__didRemoveSubview_, a3);
  if (!objc_msgSend((id)-[WKTargetedPreviewContainer subviews](self, "subviews"), "count"))
    objc_msgSend(objc_loadWeak((id *)&self->_contentView), "_targetedPreviewContainerDidRemoveLastSubview:", self);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contentView);
}

@end
