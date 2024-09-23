@implementation BKUIFingerPrintPosedVideoPlayerView

- (BKUIFingerPrintPosedVideoPlayerView)initWithAssetName:(id)a3 subdirectory:(id)a4
{
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  BKUIFingerPrintPosedVideoPlayerView *v13;
  BKUIFingerPrintPosedVideoPlayerView *v14;
  uint64_t v15;
  UIImageView *portraitImageView;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  UIImage *horizontalPosedImage;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  UIImage *verticalPosedImage;
  uint64_t v38;
  AVPlayerLayer *playerLayer;
  void *v40;
  NSDictionary *assetnameForAssetLengthDict;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  objc_super v50;
  _QWORD v51[5];

  v51[4] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v50.receiver = self;
  v50.super_class = (Class)BKUIFingerPrintPosedVideoPlayerView;
  v9 = *MEMORY[0x1E0C9D648];
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v11 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v12 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v13 = -[BKUIFingerPrintPosedVideoPlayerView initWithFrame:](&v50, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v10, v11, v12);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_assetName, a3);
    objc_storeStrong((id *)&v14->_subDirectory, a4);
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithFrame:", v9, v10, v11, v12);
    v49 = v7;
    portraitImageView = v14->_portraitImageView;
    v14->_portraitImageView = (UIImageView *)v15;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v14->_portraitImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setAlpha:](v14->_portraitImageView, "setAlpha:", 0.0);
    -[BKUIFingerPrintPosedVideoPlayerView addSubview:](v14, "addSubview:", v14->_portraitImageView);
    v43 = (void *)MEMORY[0x1E0CB3718];
    -[UIImageView leadingAnchor](v14->_portraitImageView, "leadingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIFingerPrintPosedVideoPlayerView leadingAnchor](v14, "leadingAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:", v46);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = v45;
    -[UIImageView trailingAnchor](v14->_portraitImageView, "trailingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIFingerPrintPosedVideoPlayerView trailingAnchor](v14, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v51[1] = v18;
    -[UIImageView topAnchor](v14->_portraitImageView, "topAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIFingerPrintPosedVideoPlayerView topAnchor](v14, "topAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v51[2] = v21;
    -[UIImageView bottomAnchor](v14->_portraitImageView, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIFingerPrintPosedVideoPlayerView bottomAnchor](v14, "bottomAnchor");
    v48 = v8;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v51[3] = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "activateConstraints:", v25);

    v26 = (void *)MEMORY[0x1E0CEA638];
    -[BKUIFingerPrintPosedVideoPlayerView _devicePrefix](v14, "_devicePrefix");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringByAppendingString:", CFSTR("_H"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "imageNamed:inBundle:withConfiguration:", v28, v29, 0);
    v30 = objc_claimAutoreleasedReturnValue();
    horizontalPosedImage = v14->_horizontalPosedImage;
    v14->_horizontalPosedImage = (UIImage *)v30;

    v32 = (void *)MEMORY[0x1E0CEA638];
    -[BKUIFingerPrintPosedVideoPlayerView _devicePrefix](v14, "_devicePrefix");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "stringByAppendingString:", CFSTR("_V"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "imageNamed:inBundle:withConfiguration:", v34, v35, 0);
    v36 = objc_claimAutoreleasedReturnValue();
    verticalPosedImage = v14->_verticalPosedImage;
    v14->_verticalPosedImage = (UIImage *)v36;

    v8 = v48;
    v7 = v49;

    objc_msgSend(MEMORY[0x1E0C8B330], "playerLayerWithPlayer:", 0);
    v38 = objc_claimAutoreleasedReturnValue();
    playerLayer = v14->_playerLayer;
    v14->_playerLayer = (AVPlayerLayer *)v38;

    -[BKUIFingerPrintPosedVideoPlayerView layer](v14, "layer");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addSublayer:", v14->_playerLayer);

    assetnameForAssetLengthDict = v14->_assetnameForAssetLengthDict;
    v14->_assetnameForAssetLengthDict = (NSDictionary *)&unk_1EA298CD8;

  }
  return v14;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)_setFilters:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BKUIFingerPrintPosedVideoPlayerView layer](self, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFilters:", v4);

}

- (void)load
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "assetName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_fault_impl(&dword_1DB281000, a2, OS_LOG_TYPE_FAULT, "Defaulting to no tutorial video; unable to find one for %@",
    (uint8_t *)&v4,
    0xCu);

}

- (void)itemDidFinishPlaying:(id)a3
{
  void *v4;
  id v5;

  -[BKUIFingerPrintPosedVideoPlayerView videoPlayer](self, "videoPlayer", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActionAtItemEnd:", 1);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

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
  uint64_t v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)BKUIFingerPrintPosedVideoPlayerView;
  -[BKUIFingerPrintPosedVideoPlayerView layoutSubviews](&v14, sel_layoutSubviews);
  -[BKUIFingerPrintPosedVideoPlayerView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[BKUIFingerPrintPosedVideoPlayerView playerLayer](self, "playerLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  v12 = *MEMORY[0x1E0C8A6E0];
  -[BKUIFingerPrintPosedVideoPlayerView playerLayer](self, "playerLayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setVideoGravity:", v12);

}

- (id)_filters
{
  void *v2;
  uint64_t v3;
  float v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  float v10;
  __int128 v11;
  int v12;
  float v13;
  __int128 v14;
  int v15;
  float v16;
  _BYTE v17[28];
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  -[BKUIFingerPrintPosedVideoPlayerView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceStyle");

  if (v3 == 2)
    v4 = 0.9;
  else
    v4 = 1.0;
  v5 = objc_alloc(MEMORY[0x1E0CD2780]);
  v6 = (void *)objc_msgSend(v5, "initWithType:", *MEMORY[0x1E0CD2BF0]);
  v10 = v4;
  v11 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 4);
  v12 = *(_DWORD *)(MEMORY[0x1E0CD2338] + 20);
  v13 = v4;
  v14 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 28);
  v15 = *(_DWORD *)(MEMORY[0x1E0CD2338] + 44);
  v16 = v4;
  *(_OWORD *)v17 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 52);
  *(_OWORD *)&v17[12] = *(_OWORD *)(MEMORY[0x1E0CD2338] + 64);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAColorMatrix:", &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v7, CFSTR("inputColorMatrix"));

  v18[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)showVideoPlayer
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __54__BKUIFingerPrintPosedVideoPlayerView_showVideoPlayer__block_invoke;
  v2[3] = &unk_1EA27FB98;
  v2[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v2, 0.15);
}

void __54__BKUIFingerPrintPosedVideoPlayerView_showVideoPlayer__block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "portraitImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "playerLayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = 1.0;
  objc_msgSend(v4, "setOpacity:", v3);

}

- (void)hideVideoPlayer
{
  void *v3;
  _QWORD v4[5];

  -[BKUIFingerPrintPosedVideoPlayerView portraitImageView](self, "portraitImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__BKUIFingerPrintPosedVideoPlayerView_hideVideoPlayer__block_invoke;
  v4[3] = &unk_1EA27FB98;
  v4[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v4, 0.15);
}

void __54__BKUIFingerPrintPosedVideoPlayerView_hideVideoPlayer__block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "portraitImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "playerLayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = 0;
  objc_msgSend(v4, "setOpacity:", v3);

}

- (void)_updateImageForOrientation:(int64_t)a3
{
  void *v4;
  id v5;

  if ((unint64_t)(a3 - 3) > 1)
    -[BKUIFingerPrintPosedVideoPlayerView verticalPosedImage](self, "verticalPosedImage");
  else
    -[BKUIFingerPrintPosedVideoPlayerView horizontalPosedImage](self, "horizontalPosedImage");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[BKUIFingerPrintPosedVideoPlayerView portraitImageView](self, "portraitImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:", v5);

}

- (void)transitionToOrientation:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  unint64_t v12;

  -[BKUIFingerPrintPosedVideoPlayerView assetName](self, "assetName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIFingerPrintPosedVideoPlayerView _devicePrefix](self, "_devicePrefix");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingString:", CFSTR("_H"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v7))
  {

LABEL_4:
    v12 = a3 - 1;
    goto LABEL_6;
  }
  -[BKUIFingerPrintPosedVideoPlayerView assetName](self, "assetName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIFingerPrintPosedVideoPlayerView _devicePrefix](self, "_devicePrefix");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingString:", CFSTR("_V_rotate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "isEqualToString:", v10);

  if (v11)
    goto LABEL_4;
  v12 = a3 - 3;
LABEL_6:
  if (v12 > 1)
  {
    -[BKUIFingerPrintPosedVideoPlayerView showVideoPlayer](self, "showVideoPlayer");
  }
  else
  {
    -[BKUIFingerPrintPosedVideoPlayerView _updateImageForOrientation:](self, "_updateImageForOrientation:", a3);
    -[BKUIFingerPrintPosedVideoPlayerView hideVideoPlayer](self, "hideVideoPlayer");
  }
}

- (id)_devicePrefix
{
  const __CFString *v2;
  uint64_t v3;

  v2 = CFSTR("iPadMini2021");
  v3 = MGGetProductType();
  if (v3 > 2903084587)
  {
    if (v3 == 2903084588)
      return (id)v2;
    if (v3 != 4242862982)
      return CFSTR("J307");
    return CFSTR("iPadEDU2022");
  }
  if (v3 == 1878257790)
    return CFSTR("iPadEDU2022");
  if (v3 != 1895344378)
    return CFSTR("J307");
  return (id)v2;
}

- (NSString)assetName
{
  return self->_assetName;
}

- (void)setAssetName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (NSString)subDirectory
{
  return self->_subDirectory;
}

- (void)setSubDirectory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (AVQueuePlayer)videoPlayer
{
  return self->_videoPlayer;
}

- (void)setVideoPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_videoPlayer, a3);
}

- (UIImageView)portraitImageView
{
  return self->_portraitImageView;
}

- (void)setPortraitImageView:(id)a3
{
  objc_storeStrong((id *)&self->_portraitImageView, a3);
}

- (UIImage)horizontalPosedImage
{
  return self->_horizontalPosedImage;
}

- (void)setHorizontalPosedImage:(id)a3
{
  objc_storeStrong((id *)&self->_horizontalPosedImage, a3);
}

- (UIImage)verticalPosedImage
{
  return self->_verticalPosedImage;
}

- (void)setVerticalPosedImage:(id)a3
{
  objc_storeStrong((id *)&self->_verticalPosedImage, a3);
}

- (AVPlayerLayer)playerLayer
{
  return self->_playerLayer;
}

- (void)setPlayerLayer:(id)a3
{
  objc_storeStrong((id *)&self->_playerLayer, a3);
}

- (NSDictionary)assetnameForAssetLengthDict
{
  return self->_assetnameForAssetLengthDict;
}

- (void)setAssetnameForAssetLengthDict:(id)a3
{
  objc_storeStrong((id *)&self->_assetnameForAssetLengthDict, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetnameForAssetLengthDict, 0);
  objc_storeStrong((id *)&self->_playerLayer, 0);
  objc_storeStrong((id *)&self->_verticalPosedImage, 0);
  objc_storeStrong((id *)&self->_horizontalPosedImage, 0);
  objc_storeStrong((id *)&self->_portraitImageView, 0);
  objc_storeStrong((id *)&self->_videoPlayer, 0);
  objc_storeStrong((id *)&self->_subDirectory, 0);
  objc_storeStrong((id *)&self->_assetName, 0);
}

@end
