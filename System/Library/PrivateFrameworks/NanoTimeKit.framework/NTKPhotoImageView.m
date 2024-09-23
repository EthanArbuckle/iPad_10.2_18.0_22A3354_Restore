@implementation NTKPhotoImageView

- (NTKPhotoImageView)initWithFrame:(CGRect)a3 forDevice:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  NTKPhotoImageView *v11;
  NTKPhotoImageView *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NTKPhotoImageView;
  v11 = -[NTKPhotoImageView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    -[NTKPhotoImageView setClipsToBounds:](v11, "setClipsToBounds:", 1);
    objc_storeStrong((id *)&v12->_device, a4);
    -[NTKPhotoImageView _loadMediaAssetView](v12, "_loadMediaAssetView");
  }

  return v12;
}

- (void)_loadMediaAssetView
{
  id v3;
  CLKMediaAssetView *v4;
  CLKMediaAssetView *mediaAssetView;

  v3 = objc_alloc(MEMORY[0x1E0C944F8]);
  -[NTKPhotoImageView bounds](self, "bounds");
  v4 = (CLKMediaAssetView *)objc_msgSend(v3, "initWithFrame:forDevice:", self->_device);
  mediaAssetView = self->_mediaAssetView;
  self->_mediaAssetView = v4;

  -[CLKMediaAssetView setDelegate:](self->_mediaAssetView, "setDelegate:", self);
  -[NTKPhotoImageView addSubview:](self, "addSubview:", self->_mediaAssetView);
}

- (void)_unloadMediaAssetView
{
  CLKMediaAssetView *mediaAssetView;

  -[CLKMediaAssetView setDelegate:](self->_mediaAssetView, "setDelegate:", 0);
  -[CLKMediaAssetView removeFromSuperview](self->_mediaAssetView, "removeFromSuperview");
  mediaAssetView = self->_mediaAssetView;
  self->_mediaAssetView = 0;

}

- (void)reset
{
  NTKCachedPhoto *cachedPhoto;
  NTKPhoto *photo;

  cachedPhoto = self->_cachedPhoto;
  self->_cachedPhoto = 0;

  photo = self->_photo;
  self->_photo = 0;

  -[NTKPhotoImageView _unloadMediaAssetView](self, "_unloadMediaAssetView");
  -[NTKPhotoImageView _loadMediaAssetView](self, "_loadMediaAssetView");
}

- (void)setPhoto:(id)a3 allowIris:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v16;
  double v17;
  double v18;
  double v19;
  NTKPhoto *v20;
  NTKPhoto *photo;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  BOOL v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  void *v62;
  id v63;

  v4 = a4;
  v7 = a3;
  if (v7)
  {
    v63 = v7;
    objc_msgSend(v7, "photo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v63;
    if (v8)
    {
      objc_msgSend(v63, "image");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "scale");
      v11 = v10;
      objc_msgSend(v9, "size");
      if (!v9)
        goto LABEL_26;
      v14 = v11 * v13;
      if (v11 * v12 < 1.0 || v14 < 1.0)
        goto LABEL_26;
      -[NTKPhotoImageView bounds](self, "bounds");
      if (v16 < 1.0)
        goto LABEL_26;
      v18 = v17;
      if (v17 < 1.0)
        goto LABEL_26;
      v19 = v16;
      objc_msgSend(v63, "photo");
      v20 = (NTKPhoto *)objc_claimAutoreleasedReturnValue();
      photo = self->_photo;
      self->_photo = v20;

      objc_storeStrong((id *)&self->_cachedPhoto, a3);
      v22 = 0;
      v23 = 0.0;
      v24 = 0.0;
      if (-[NTKPhoto isIris](self->_photo, "isIris") && v4)
      {
        -[NTKPhoto irisVideoURL](self->_photo, "irisVideoURL");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[NTKPhoto irisDuration](self->_photo, "irisDuration");
        v24 = v25;
        -[NTKPhoto irisStillDisplayTime](self->_photo, "irisStillDisplayTime");
        v23 = v26;
      }
      -[CLKMediaAssetView mediaAsset](self->_mediaAssetView, "mediaAsset");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "image");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "image");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28 == v29)
      {
        -[CLKMediaAssetView mediaAsset](self->_mediaAssetView, "mediaAsset");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "video");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "url");
        v32 = v22;
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        v34 = v33 == v32;
        v22 = v32;
        if (v34)
        {
LABEL_25:

LABEL_26:
          v7 = v63;
          goto LABEL_27;
        }
      }
      else
      {

      }
      v35 = (void *)MEMORY[0x1E0C944F0];
      if (v22)
      {
        v36 = (void *)MEMORY[0x1E0C94568];
        objc_msgSend(v63, "photo");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "localIdentifier");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "videoWithName:forDevice:url:", v62, self->_device, v22);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "image");
        v39 = v22;
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "mediaAssetWithVideo:image:videoDuration:stillDisplayTime:forDevice:", v38, v40, self->_device, v24, v23);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = v39;
      }
      else
      {
        objc_msgSend(v63, "image");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "mediaAssetWithImage:forDevice:", v37, self->_device);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
      }

      -[CLKMediaAssetView changeMediaAsset:](self->_mediaAssetView, "changeMediaAsset:", v41);
      -[CLKMediaAssetView mediaAsset](self->_mediaAssetView, "mediaAsset");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "image");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "scale");
      v45 = v44;

      -[CLKDevice screenScale](self->_device, "screenScale");
      if (v46 >= 1.0)
        v47 = v46;
      else
        v47 = 1.0;
      -[CLKMediaAssetView mediaAsset](self->_mediaAssetView, "mediaAsset");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "image");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "size");
      v51 = v50;
      v53 = v52;

      v54 = v45 * v51 / v47;
      v55 = v45 * v53 / v47;
      -[NTKPhoto crop](self->_photo, "crop");
      v58 = v19 / (v57 / v47);
      if (v58 < v18 / (v56 / v47))
        v58 = v18 / (v56 / v47);
      -[CLKMediaAssetView setBounds:](self->_mediaAssetView, "setBounds:", 0.0, 0.0, v54 * v58, v55 * v58);
      -[NTKPhotoImageView bounds](self, "bounds");
      v60 = v59 * 0.5;
      -[NTKPhotoImageView bounds](self, "bounds");
      -[CLKMediaAssetView setCenter:](self->_mediaAssetView, "setCenter:", v60, v61 * 0.5);
      -[NTKPhotoImageView setNeedsLayout](self, "setNeedsLayout");

      goto LABEL_25;
    }
  }
LABEL_27:

}

- (void)prepareToPlayWithMode:(int64_t)a3
{
  -[CLKMediaAssetView prepareToPlayWithOperation:](self->_mediaAssetView, "prepareToPlayWithOperation:", a3);
}

- (void)playWithMode:(int64_t)a3
{
  -[CLKMediaAssetView playWithOperation:](self->_mediaAssetView, "playWithOperation:", a3);
}

- (void)pauseWithMode:(int64_t)a3
{
  -[CLKMediaAssetView pauseWithOperation:](self->_mediaAssetView, "pauseWithOperation:", a3);
}

- (BOOL)isPlaying
{
  return -[CLKMediaAssetView isPlaying](self->_mediaAssetView, "isPlaying");
}

- (void)interruptPlayback
{
  -[CLKMediaAssetView interruptPlayback](self->_mediaAssetView, "interruptPlayback");
}

- (void)resumeInterruptedPlayback
{
  -[CLKMediaAssetView resumeInterruptedPlayback](self->_mediaAssetView, "resumeInterruptedPlayback");
}

- (BOOL)isPhotoIris
{
  return -[NTKPhoto isIris](self->_photo, "isIris");
}

- (NSURL)irisURL
{
  return -[NTKPhoto irisVideoURL](self->_photo, "irisVideoURL");
}

- (NSString)localIdentifier
{
  return -[NTKPhoto localIdentifier](self->_photo, "localIdentifier");
}

- (void)mediaAssetViewDidBeginPlaying:(id)a3
{
  id v4;

  -[NTKPhotoImageView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageViewDidBeginPlaying:", self);

}

- (void)mediaAssetViewDidEndPlaying:(id)a3
{
  id v4;

  -[NTKPhotoImageView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageViewDidEndPlaying:", self);

}

- (NTKPhotoImageViewDelegate)delegate
{
  return (NTKPhotoImageViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NTKCachedPhoto)cachedPhoto
{
  return self->_cachedPhoto;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedPhoto, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_photo, 0);
  objc_storeStrong((id *)&self->_mediaAssetView, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
