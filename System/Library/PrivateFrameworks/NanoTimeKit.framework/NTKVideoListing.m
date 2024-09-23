@implementation NTKVideoListing

- (id)initForDevice:(id)a3 withName:(id)a4 videoName:(id)a5 transitionImageName:(id)a6 overlayColor:(id)a7 theme:(unint64_t)a8 variant:(int64_t)a9 clip:(int64_t)a10 tags:(unint64_t)a11
{
  id v18;
  id v19;
  id v20;
  NTKVideoListing *v21;
  NTKVideoListing *v22;
  NTKVideoListing *v23;
  id v25;
  id v26;
  objc_super v27;

  v18 = a3;
  v19 = a4;
  v20 = a5;
  v26 = a6;
  v25 = a7;
  v27.receiver = self;
  v27.super_class = (Class)NTKVideoListing;
  v21 = -[NTKVideoListing init](&v27, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_device, a3);
    objc_storeStrong((id *)&v22->_name, a4);
    objc_storeStrong((id *)&v22->_videoName, a5);
    objc_storeStrong((id *)&v22->_transitionImageName, a6);
    objc_storeStrong((id *)&v22->_overlayColor, a7);
    v22->_theme = a8;
    v22->_variant = a9;
    v22->_clip = a10;
    v22->_tags = a11;
    v23 = v22;
  }

  return v22;
}

- (void)_setHasAssets
{
  id v3;

  +[NTKVideoListingFactory sharedInstanceForDevice:](NTKVideoListingFactory, "sharedInstanceForDevice:", self->_device);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setVideoListingHasAssets:", self);

}

- (CLKVideo)video
{
  CLKVideo *video;
  void *v4;
  NSString *videoName;
  CLKDevice *device;
  void *v7;
  CLKVideo *v8;
  CLKVideo *v9;

  video = self->_video;
  if (!video)
  {
    v4 = (void *)MEMORY[0x1E0C94568];
    videoName = self->_videoName;
    device = self->_device;
    NTKAssetsBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "videoNamed:forDevice:inBundle:", videoName, device, v7);
    v8 = (CLKVideo *)objc_claimAutoreleasedReturnValue();
    v9 = self->_video;
    self->_video = v8;

    -[NTKVideoListing _setHasAssets](self, "_setHasAssets");
    video = self->_video;
  }
  return video;
}

- (BOOL)snapshotDiffers:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = objc_msgSend(v5, "theme");
    if (v6 == -[NTKVideoListing theme](self, "theme"))
    {
      v7 = objc_msgSend(v5, "variant");
      v8 = v7 != -[NTKVideoListing variant](self, "variant");
    }
    else
    {
      v8 = 1;
    }

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initForDevice:withName:videoName:transitionImageName:overlayColor:theme:variant:clip:tags:", self->_device, self->_name, self->_videoName, self->_transitionImageName, self->_overlayColor, self->_theme, self->_variant, self->_clip, self->_tags);
}

- (BOOL)hasTag:(unint64_t)a3
{
  return (a3 & ~self->_tags) == 0;
}

- (void)discardAssets
{
  CLKVideo *video;

  video = self->_video;
  self->_video = 0;

}

- (UIColor)overlayColor
{
  return self->_overlayColor;
}

- (unint64_t)theme
{
  return self->_theme;
}

- (int64_t)variant
{
  return self->_variant;
}

- (int64_t)clip
{
  return self->_clip;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayColor, 0);
  objc_storeStrong((id *)&self->_transitionImageName, 0);
  objc_storeStrong((id *)&self->_videoName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_video, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
