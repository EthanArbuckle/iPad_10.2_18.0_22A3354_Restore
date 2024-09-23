@implementation CKLivePhotoBalloonView

- (void)configureForMediaObject:(id)a3 previewWidth:(double)a4 orientation:(char)a5 hasInvisibleInkEffect:(BOOL)a6
{
  _BOOL8 v6;
  uint64_t v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  objc_super v14;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CKLivePhotoBalloonView;
  -[CKImageBalloonView configureForMediaObject:previewWidth:orientation:hasInvisibleInkEffect:](&v14, sel_configureForMediaObject_previewWidth_orientation_hasInvisibleInkEffect_, v10, v7, v6, a4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v10;
    -[CKLivePhotoBalloonView livePhotoView](self, "livePhotoView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "livePhoto");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setLivePhoto:", v13);
  }

}

- (CKLivePhotoBalloonView)initWithFrame:(CGRect)a3
{
  CKLivePhotoBalloonView *v3;
  PHLivePhotoView *v4;
  PHLivePhotoView *livePhotoView;
  PHLivePhotoView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKLivePhotoBalloonView;
  v3 = -[CKImageBalloonView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (PHLivePhotoView *)objc_alloc_init((Class)MEMORY[0x193FF3C18](CFSTR("PHLivePhotoView"), CFSTR("PhotosUI")));
    livePhotoView = v3->_livePhotoView;
    v3->_livePhotoView = v4;

    v6 = v3->_livePhotoView;
    -[CKLivePhotoBalloonView bounds](v3, "bounds");
    -[PHLivePhotoView setFrame:](v6, "setFrame:");
    -[CKLivePhotoBalloonView addSubview:](v3, "addSubview:", v3->_livePhotoView);
  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CKLivePhotoBalloonView;
  -[CKImageBalloonView layoutSubviews](&v12, sel_layoutSubviews);
  -[CKLivePhotoBalloonView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CKLivePhotoBalloonView livePhotoView](self, "livePhotoView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (void)setIsIrisAsset:(BOOL)a3
{
  self->_isIrisAsset = a3;
}

- (void)setIsMonoskiAsset:(BOOL)a3
{
  self->_isMonoskiAsset = a3;
}

- (BOOL)isIrisAsset
{
  return self->_isIrisAsset;
}

- (BOOL)isMonoskiAsset
{
  return self->_isMonoskiAsset;
}

- (PHLivePhotoView)livePhotoView
{
  return self->_livePhotoView;
}

- (void)setLivePhotoView:(id)a3
{
  objc_storeStrong((id *)&self->_livePhotoView, a3);
}

- (PHLivePhoto)livePhoto
{
  return self->_livePhoto;
}

- (void)setLivePhoto:(id)a3
{
  objc_storeStrong((id *)&self->_livePhoto, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_livePhoto, 0);
  objc_storeStrong((id *)&self->_livePhotoView, 0);
}

@end
