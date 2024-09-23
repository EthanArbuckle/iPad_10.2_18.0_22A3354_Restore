@implementation CNPhotoPickerPreviewView

- (CNPhotoPickerPreviewView)initWithFrame:(CGRect)a3
{
  CNPhotoPickerPreviewView *v3;
  CNPhotoPickerPreviewView *v4;
  CNPhotoPickerPreviewView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNPhotoPickerPreviewView;
  v3 = -[CNPhotoPickerPreviewView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CNPhotoPickerPreviewView setupPreview](v3, "setupPreview");
    v5 = v4;
  }

  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CNPhotoPickerPreviewView;
  -[CNPhotoPickerPreviewView layoutSubviews](&v8, sel_layoutSubviews);
  v3 = (void *)MEMORY[0x1E0DC3508];
  -[CNPhotoPickerPreviewView previewView](self, "previewView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "bezierPathWithOvalInRect:");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = objc_msgSend(v5, "CGPath");
  -[CNPhotoPickerPreviewView clippingLayer](self, "clippingLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPath:", v6);

}

- (void)setupPreview
{
  double v3;
  double v4;
  double v5;
  UIView *v6;
  UIView *previewView;
  void *v8;
  CAShapeLayer *v9;
  CAShapeLayer *clippingLayer;
  CAShapeLayer *v11;
  id v12;

  -[CNPhotoPickerPreviewView frame](self, "frame");
  v4 = v3;
  -[CNPhotoPickerPreviewView frame](self, "frame");
  v6 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", 0.0, 0.0, v4, v5);
  previewView = self->_previewView;
  self->_previewView = v6;

  -[UIView setAutoresizingMask:](self->_previewView, "setAutoresizingMask:", 18);
  +[CNUIColorRepository photoPickerAvatarBackgroundDefaultColor](CNUIColorRepository, "photoPickerAvatarBackgroundDefaultColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_previewView, "setBackgroundColor:", v8);

  -[CNPhotoPickerPreviewView addSubview:](self, "addSubview:", self->_previewView);
  v9 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
  clippingLayer = self->_clippingLayer;
  self->_clippingLayer = v9;

  v11 = self->_clippingLayer;
  -[UIView layer](self->_previewView, "layer");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMask:", v11);

}

- (void)updatePreviewWithItem:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];

  v4 = a3;
  -[CNPhotoPickerPreviewView thumbnailContentView](self, "thumbnailContentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperview");

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__CNPhotoPickerPreviewView_updatePreviewWithItem___block_invoke;
  v6[3] = &unk_1E204D958;
  v6[4] = self;
  objc_msgSend(v4, "thumbnailViewWithCompletion:", v6);

}

- (UIView)previewView
{
  return self->_previewView;
}

- (UIView)thumbnailContentView
{
  return self->_thumbnailContentView;
}

- (void)setThumbnailContentView:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailContentView, a3);
}

- (CAShapeLayer)clippingLayer
{
  return self->_clippingLayer;
}

- (void)setClippingLayer:(id)a3
{
  objc_storeStrong((id *)&self->_clippingLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clippingLayer, 0);
  objc_storeStrong((id *)&self->_thumbnailContentView, 0);
  objc_storeStrong((id *)&self->_previewView, 0);
}

void __50__CNPhotoPickerPreviewView_updatePreviewWithItem___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "setThumbnailContentView:", v4);
  objc_msgSend(*(id *)(a1 + 32), "previewView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v4);

  objc_msgSend(*(id *)(a1 + 32), "previewView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  objc_msgSend(v4, "setFrame:");

}

+ (id)pickerPreviewWithFrame:(CGRect)a3 forItem:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  char isKindOfClass;
  __objc2_class **v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  v10 = off_1E203F358;
  if ((isKindOfClass & 1) == 0)
    v10 = off_1E203F360;
  return (id)objc_msgSend(objc_alloc(*v10), "initWithFrame:", x, y, width, height);
}

@end
