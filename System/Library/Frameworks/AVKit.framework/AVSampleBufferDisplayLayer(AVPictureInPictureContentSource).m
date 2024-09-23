@implementation AVSampleBufferDisplayLayer(AVPictureInPictureContentSource)

- (void)avkit_startRoutingVideoToPictureInPictureViewController:()AVPictureInPictureContentSource
{
  id v3;

  objc_msgSend(a3, "pictureInPicturePlayerLayerView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPIPModeEnabled:", 1);

}

- (void)avkit_stopRoutingVideoToPictureInPictureViewController:()AVPictureInPictureContentSource
{
  id v3;

  objc_msgSend(a3, "pictureInPicturePlayerLayerView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPIPModeEnabled:", 0);

}

- (BOOL)avkit_isVisible
{
  CGRect v2;

  objc_msgSend(a1, "bounds");
  return !CGRectIsEmpty(v2);
}

- (id)avkit_window
{
  id v1;
  void *v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  void *v7;

  v1 = a1;
  if (v1)
  {
    v2 = v1;
    do
    {
      objc_msgSend(v2, "delegate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v2, "delegate");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "window");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v6 = 0;
      }
      objc_msgSend(v2, "superlayer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
        break;
      v2 = v7;
    }
    while (v7);
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }

  return v6;
}

- (double)avkit_videoRectInWindow
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double x;
  double v7;
  double y;
  double v9;
  double width;
  double v11;
  double height;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  _BOOL4 v22;
  BOOL v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  void *v37;
  void *v38;
  double v39;
  CGSize v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  objc_msgSend(a1, "avkit_window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "bounds");
  v4 = v3;
  objc_msgSend(a1, "bounds");
  x = v5;
  y = v7;
  width = v9;
  height = v11;
  objc_msgSend(a1, "videoGravity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0C8A6D8]))
    goto LABEL_20;
  objc_msgSend(a1, "avkit_sampleBufferDisplayLayerPlayerController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "contentDimensions");
  v17 = v16;
  v18 = v16 - 1;
  v19 = ((v16 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53;
  v22 = ((v15 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 < 0x3FF && v15 >= 0
     || (unint64_t)(v15 - 1) < 0xFFFFFFFFFFFFFLL;

  v24 = (v17 < 0 || v19 > 0x3FE) && v18 > 0xFFFFFFFFFFFFELL;
  if (!v24 && v22)
  {
    objc_msgSend(a1, "avkit_sampleBufferDisplayLayerPlayerController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "contentDimensions");
    v26 = v25;
    v28 = v27;
    objc_msgSend(a1, "bounds");
    v30 = v29;
    v32 = v31;
    v34 = v33;
    v36 = v35;
    v41.width = v26;
    v41.height = v28;
    v43.origin.x = v30;
    v43.origin.y = v32;
    v43.size.width = v34;
    v43.size.height = v36;
    v42 = AVMakeRectWithAspectRatioInsideRect(v41, v43);
    x = v42.origin.x;
    y = v42.origin.y;
    width = v42.size.width;
    height = v42.size.height;
LABEL_20:

  }
  if (v2)
  {
    v44.origin.x = x;
    v44.origin.y = y;
    v44.size.width = width;
    v44.size.height = height;
    if (!CGRectEqualToRect(*MEMORY[0x1E0C9D648], v44))
    {
      objc_msgSend(v2, "layer");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v37;
      if (v37)
      {
        objc_msgSend(v37, "convertRect:fromLayer:", a1, x, y, width, height);
        objc_msgSend(a1, "avkit_visibleRectForRect:inLayer:", v38);
        v4 = v39;
      }

    }
  }

  return v4;
}

- (AVPictureInPictureViewController)avkit_pictureInPictureViewController
{
  AVPictureInPictureSampleBufferDisplayLayerView *v2;
  void *v3;
  AVPictureInPictureSampleBufferDisplayLayerView *v4;
  AVPictureInPictureViewController *v5;

  v2 = [AVPictureInPictureSampleBufferDisplayLayerView alloc];
  objc_msgSend(a1, "avkit_sampleBufferDisplayLayerPlayerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[AVPictureInPictureSampleBufferDisplayLayerView initWithSourceLayer:playerController:](v2, "initWithSourceLayer:playerController:", a1, v3);

  v5 = -[AVPictureInPictureViewController initWithPictureInPicturePlayerLayerView:]([AVPictureInPictureViewController alloc], "initWithPictureInPicturePlayerLayerView:", v4);
  return v5;
}

- (uint64_t)avkit_contentSourceType
{
  return 1;
}

- (uint64_t)avkit_wantsManagedSecondScreenPlayback
{
  return 0;
}

@end
