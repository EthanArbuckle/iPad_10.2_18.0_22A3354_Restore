@implementation HUPosterFrameView

+ (id)posterFrameViewForWidth:(double)a3
{
  return -[HUPosterFrameView initWithFrame:]([HUPosterFrameView alloc], "initWithFrame:", 0.0, 0.0, a3, 33.0);
}

- (HUPosterFrameView)initWithFrame:(CGRect)a3
{
  HUPosterFrameView *v3;
  CALayer *v4;
  CALayer *posterFrameLayer;
  void *v6;
  double y;
  double height;
  CGFloat v9;
  CALayer *v10;
  CALayer *lineSeparator;
  id v12;
  void *v13;
  objc_super v15;
  CGRect v16;

  v15.receiver = self;
  v15.super_class = (Class)HUPosterFrameView;
  v3 = -[HUPosterFrameView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
    posterFrameLayer = v3->_posterFrameLayer;
    v3->_posterFrameLayer = v4;

    -[HUPosterFrameView bounds](v3, "bounds");
    -[CALayer setFrame:](v3->_posterFrameLayer, "setFrame:");
    -[HUPosterFrameView layer](v3, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "insertSublayer:atIndex:", v3->_posterFrameLayer, 0);

    -[HUPosterFrameView bounds](v3, "bounds");
    y = v16.origin.y;
    height = v16.size.height;
    v9 = CGRectGetMaxX(v16) + -1.0;
    v10 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
    lineSeparator = v3->_lineSeparator;
    v3->_lineSeparator = v10;

    -[CALayer setFrame:](v3->_lineSeparator, "setFrame:", v9, y, 1.0, height);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CALayer setBackgroundColor:](v3->_lineSeparator, "setBackgroundColor:", objc_msgSend(v12, "CGColor"));

    -[CALayer setHidden:](v3->_lineSeparator, "setHidden:", 1);
    -[HUPosterFrameView layer](v3, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSublayer:", v3->_lineSeparator);

  }
  return v3;
}

- (void)setShouldShowLineSeparator:(BOOL)a3
{
  _BOOL8 v5;
  void *v6;

  if (self->_shouldShowLineSeparator != a3)
  {
    v5 = !a3;
    -[HUPosterFrameView lineSeparator](self, "lineSeparator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", v5);

    self->_shouldShowLineSeparator = a3;
  }
}

- (void)displayImageForClip:(id)a3 atTimeOffset:(double)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[HUPosterFrameView setClip:](self, "setClip:");
  -[HUPosterFrameView setTimeOffset:](self, "setTimeOffset:", a4);
  objc_msgSend(MEMORY[0x1E0D31220], "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0D319D0], "isPressDemoModeEnabled"))
  {
    -[HUPosterFrameView clip](self, "clip");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addDemoPosterFrameImageObserver:forClip:atOffset:", self, v7, a4);
  }
  else
  {
    objc_msgSend(v6, "cachedPosterFrameImageForClip:offset:requestor:", v8, self, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      -[HUPosterFrameView displayImage:opacity:](self, "displayImage:opacity:", v7, 1.0);
    else
      -[HUPosterFrameView loadPosterFrameImageForClip:atOffset:](self, "loadPosterFrameImageForClip:atOffset:", v8, a4);
  }

}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D31220], "sharedManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (-[HUPosterFrameView loadingHeroFrame](self, "loadingHeroFrame"))
  {
    -[HUPosterFrameView clip](self, "clip");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeHeroFrameImageObserver:forClip:", self, v3);

  }
  if (-[HUPosterFrameView loadingPosterFrame](self, "loadingPosterFrame"))
  {
    -[HUPosterFrameView clip](self, "clip");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUPosterFrameView timeOffset](self, "timeOffset");
    objc_msgSend(v5, "removePosterFrameImageObserver:forClip:atOffset:", self, v4);

  }
  -[HUPosterFrameView setLoadingHeroFrame:](self, "setLoadingHeroFrame:", 0);
  -[HUPosterFrameView setLoadingPosterFrame:](self, "setLoadingPosterFrame:", 0);
  -[HUPosterFrameView setPosterFrameLoadingState:](self, "setPosterFrameLoadingState:", 0);
  -[HUPosterFrameView displayImage:opacity:](self, "displayImage:opacity:", 0, 1.0);

}

- (void)displayImage:(id)a3 opacity:(double)a4
{
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;

  v6 = (void *)MEMORY[0x1E0CD28B0];
  v7 = a3;
  objc_msgSend(v6, "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setValue:forKey:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CD3160]);
  v8 = objc_retainAutorelease(v7);
  v9 = objc_msgSend(v8, "CGImage");

  -[HUPosterFrameView posterFrameLayer](self, "posterFrameLayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setContents:", v9);

  -[HUPosterFrameView posterFrameLayer](self, "posterFrameLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&a4 = a4;
  LODWORD(v12) = LODWORD(a4);
  objc_msgSend(v11, "setOpacity:", v12);

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)loadPlaceholderHeroFrameImageForClip:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0D31220], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "heroFrameImageForClip:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[HUPosterFrameView displayImage:opacity:](self, "displayImage:opacity:", v5, 0.5);
  }
  else
  {
    -[HUPosterFrameView setLoadingHeroFrame:](self, "setLoadingHeroFrame:", 1);
    objc_msgSend(v4, "addHeroFrameImageObserver:forClip:", self, v6);
  }

}

- (void)loadPosterFrameImageForClip:(id)a3 atOffset:(double)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[HUPosterFrameView setLoadingPosterFrame:](self, "setLoadingPosterFrame:", 1);
  -[HUPosterFrameView setPosterFrameLoadingState:](self, "setPosterFrameLoadingState:", 1);
  -[HUPosterFrameView loadPlaceholderHeroFrameImageForClip:](self, "loadPlaceholderHeroFrameImageForClip:", v6);
  objc_msgSend(MEMORY[0x1E0D31220], "sharedManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getPosterFrameImage:forClip:atOffset:", self, v6, a4);

}

- (void)didFindPosterFrame:(id)a3 atOffset:(double)a4 forClip:(id)a5
{
  void *v8;
  void *v9;
  void *v10;
  int v11;
  double v12;
  id v13;

  v13 = a3;
  objc_msgSend(a5, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPosterFrameView clip](self, "clip");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "hmf_isEqualToUUID:", v10);

  if (v11)
  {
    -[HUPosterFrameView timeOffset](self, "timeOffset");
    if (vabdd_f64(v12, a4) < 0.00000011920929)
    {
      -[HUPosterFrameView setLoadingPosterFrame:](self, "setLoadingPosterFrame:", 0);
      -[HUPosterFrameView setPosterFrameLoadingState:](self, "setPosterFrameLoadingState:", 2);
      -[HUPosterFrameView displayImage:opacity:](self, "displayImage:opacity:", v13, 1.0);
    }
  }

}

- (void)failedToFindPosterFrameAtOffset:(double)a3 forClip:(id)a4
{
  -[HUPosterFrameView setLoadingPosterFrame:](self, "setLoadingPosterFrame:", 0, a3);
  -[HUPosterFrameView setPosterFrameLoadingState:](self, "setPosterFrameLoadingState:", 3);
}

- (void)manager:(id)a3 didFindImage:(id)a4 atTimeOffset:(double)a5 forClip:(id)a6
{
  id v7;

  v7 = a4;
  -[HUPosterFrameView setLoadingPosterFrame:](self, "setLoadingPosterFrame:", 0);
  -[HUPosterFrameView displayImage:opacity:](self, "displayImage:opacity:", v7, 1.0);

}

- (void)manager:(id)a3 didGenerateImage:(id)a4 atOffset:(double)a5 forClip:(id)a6
{
  id v7;

  v7 = a4;
  -[HUPosterFrameView setLoadingPosterFrame:](self, "setLoadingPosterFrame:", 0);
  -[HUPosterFrameView displayImage:opacity:](self, "displayImage:opacity:", v7, 1.0);

}

- (void)manager:(id)a3 failedToGenerateImageAtOffset:(double)a4 forClip:(id)a5
{
  -[HUPosterFrameView setLoadingPosterFrame:](self, "setLoadingPosterFrame:", 0, a5, a4);
}

- (void)manager:(id)a3 didFindHeroFrame:(id)a4 forClip:(id)a5
{
  double v6;
  BOOL v7;
  double v8;
  id v9;

  v9 = a4;
  -[HUPosterFrameView setLoadingHeroFrame:](self, "setLoadingHeroFrame:", 0);
  if (-[HUPosterFrameView posterFrameLoadingState](self, "posterFrameLoadingState") != 2)
  {
    -[HUPosterFrameView timeOffset](self, "timeOffset");
    v7 = v6 < 0.00000011920929;
    v8 = 0.5;
    if (v7)
      v8 = 1.0;
    -[HUPosterFrameView displayImage:opacity:](self, "displayImage:opacity:", v9, v8);
  }

}

- (void)manager:(id)a3 failedToFindHeroFrameforClip:(id)a4
{
  -[HUPosterFrameView setLoadingHeroFrame:](self, "setLoadingHeroFrame:", 0, a4);
}

- (BOOL)shouldShowLineSeparator
{
  return self->_shouldShowLineSeparator;
}

- (BOOL)loadingHeroFrame
{
  return self->_loadingHeroFrame;
}

- (void)setLoadingHeroFrame:(BOOL)a3
{
  self->_loadingHeroFrame = a3;
}

- (BOOL)loadingPosterFrame
{
  return self->_loadingPosterFrame;
}

- (void)setLoadingPosterFrame:(BOOL)a3
{
  self->_loadingPosterFrame = a3;
}

- (unint64_t)posterFrameLoadingState
{
  return self->_posterFrameLoadingState;
}

- (void)setPosterFrameLoadingState:(unint64_t)a3
{
  self->_posterFrameLoadingState = a3;
}

- (CALayer)posterFrameLayer
{
  return self->_posterFrameLayer;
}

- (void)setPosterFrameLayer:(id)a3
{
  objc_storeStrong((id *)&self->_posterFrameLayer, a3);
}

- (CALayer)lineSeparator
{
  return self->_lineSeparator;
}

- (void)setLineSeparator:(id)a3
{
  objc_storeStrong((id *)&self->_lineSeparator, a3);
}

- (HMCameraClip)clip
{
  return (HMCameraClip *)objc_loadWeakRetained((id *)&self->_clip);
}

- (void)setClip:(id)a3
{
  objc_storeWeak((id *)&self->_clip, a3);
}

- (double)timeOffset
{
  return self->_timeOffset;
}

- (void)setTimeOffset:(double)a3
{
  self->_timeOffset = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_clip);
  objc_storeStrong((id *)&self->_lineSeparator, 0);
  objc_storeStrong((id *)&self->_posterFrameLayer, 0);
}

@end
