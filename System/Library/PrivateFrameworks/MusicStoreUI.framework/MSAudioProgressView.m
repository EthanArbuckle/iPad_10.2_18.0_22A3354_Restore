@implementation MSAudioProgressView

- (MSAudioProgressView)initWithFrame:(CGRect)a3
{
  MSAudioProgressView *v3;
  MSAudioProgressView *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  UIImageView *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MSAudioProgressView;
  v3 = -[MSAudioProgressView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = -[MSAudioProgressView _newProgressView](v3, "_newProgressView");
    v4->_progressView = (MSPieImageView *)v5;
    -[MSAudioProgressView addSubview:](v4, "addSubview:", v5);
    v6 = objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = objc_alloc(MEMORY[0x24BDF6AE8]);
    v8 = objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("StopButton"), v6);
    v9 = (UIImageView *)objc_msgSend(v7, "initWithImage:highlightedImage:", v8, objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("StopButtonPressed"), v6));
    v4->_stopImageView = v9;
    -[UIImageView setContentMode:](v9, "setContentMode:", 4);
    -[MSAudioProgressView addSubview:](v4, "addSubview:", v4->_stopImageView);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[MSAudioProgressView _cancelBufferingTimer](self, "_cancelBufferingTimer");

  v3.receiver = self;
  v3.super_class = (Class)MSAudioProgressView;
  -[MSAudioProgressView dealloc](&v3, sel_dealloc);
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    -[UIImageView setHighlighted:](self->_stopImageView, "setHighlighted:");
  }
}

- (void)setPlayerStatus:(id)a3
{
  SUPlayerStatus *playerStatus;
  SUPlayerStatus *v6;
  uint64_t v7;
  OS_dispatch_source *v8;
  dispatch_time_t v9;
  NSObject *bufferingTimer;
  MSPieImageView *v11;
  double v12;
  double v13;
  MSPieImageView *progressView;
  double v15;
  double v16;
  _QWORD handler[5];

  playerStatus = self->_playerStatus;
  if (playerStatus != a3)
  {

    v6 = (SUPlayerStatus *)objc_msgSend(a3, "copy");
    self->_playerStatus = v6;
    if (-[SUPlayerStatus playerState](v6, "playerState") == 1)
    {
      if (!self->_bufferingTimer && !self->_bufferingImageView)
      {
        v7 = objc_msgSend(MEMORY[0x24BEB20C0], "weakReferenceWithObject:", self);
        v8 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, MEMORY[0x24BDAC9B8]);
        self->_bufferingTimer = v8;
        v9 = dispatch_time(0, 500000000);
        dispatch_source_set_timer((dispatch_source_t)v8, v9, 0, 0);
        bufferingTimer = self->_bufferingTimer;
        handler[0] = MEMORY[0x24BDAC760];
        handler[1] = 3221225472;
        handler[2] = __39__MSAudioProgressView_setPlayerStatus___block_invoke;
        handler[3] = &unk_24F1F2C50;
        handler[4] = v7;
        dispatch_source_set_event_handler(bufferingTimer, handler);
        dispatch_resume((dispatch_object_t)self->_bufferingTimer);
      }
    }
    else
    {
      -[MSAudioProgressView _cancelBufferingTimer](self, "_cancelBufferingTimer");
      -[UIImageView stopAnimating](self->_bufferingImageView, "stopAnimating");
      -[UIImageView removeFromSuperview](self->_bufferingImageView, "removeFromSuperview");

      self->_bufferingImageView = 0;
      if (!self->_progressView)
      {
        v11 = -[MSAudioProgressView _newProgressView](self, "_newProgressView");
        self->_progressView = v11;
        -[MSAudioProgressView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v11, self->_stopImageView);
      }
      -[SUPlayerStatus duration](self->_playerStatus, "duration");
      v13 = v12;
      if (v12 < 0.00000011920929)
      {
        progressView = self->_progressView;
        v15 = 0.0;
      }
      else
      {
        -[SUPlayerStatus currentTime](self->_playerStatus, "currentTime");
        if (v16 < 0.00000011920929)
          v16 = 0.0;
        progressView = self->_progressView;
        v15 = v16 / v13;
      }
      -[MSPieImageView setPieFraction:](progressView, "setPieFraction:", v15);
    }
    -[MSAudioProgressView setNeedsLayout](self, "setNeedsLayout");
  }
}

uint64_t __39__MSAudioProgressView_setPlayerStatus___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "object"), "_showBufferingImageView");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIImageView *bufferingImageView;
  double v8;
  float v9;
  double v10;
  float v11;
  MSPieImageView *progressView;
  double v13;
  float v14;
  double v15;
  float v16;

  -[MSAudioProgressView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  bufferingImageView = self->_bufferingImageView;
  if (bufferingImageView)
  {
    -[UIImageView frame](bufferingImageView, "frame");
    v9 = (v4 - v8) * 0.5;
    v11 = (v6 - v10) * 0.5;
    -[UIImageView setFrame:](self->_bufferingImageView, "setFrame:", floorf(v9), floorf(v11));
  }
  progressView = self->_progressView;
  if (progressView)
  {
    -[MSPieImageView frame](progressView, "frame");
    v14 = (v4 - v13) * 0.5;
    v16 = (v6 - v15) * 0.5;
    -[MSPieImageView setFrame:](self->_progressView, "setFrame:", floorf(v14), floorf(v16));
  }
  -[UIImageView frame](self->_stopImageView, "frame");
  -[UIImageView setFrame:](self->_stopImageView, "setFrame:");
}

- (void)_cancelBufferingTimer
{
  NSObject *bufferingTimer;

  bufferingTimer = self->_bufferingTimer;
  if (bufferingTimer)
  {
    dispatch_source_cancel(bufferingTimer);
    dispatch_release((dispatch_object_t)self->_bufferingTimer);
    self->_bufferingTimer = 0;
  }
}

- (id)_newBufferingImageView
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v2 = objc_alloc_init(MEMORY[0x24BDF6AE8]);
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v4 = objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  for (i = 1; i != 13; ++i)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("PreviewLoading%ld"), i);
    v7 = objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", v6, v4);
    if (v7)
      objc_msgSend(v3, "addObject:", v7);

  }
  objc_msgSend(v2, "setAnimationDuration:", (double)(unint64_t)objc_msgSend(v3, "count") / 15.0);
  objc_msgSend(v2, "setAnimationImages:", v3);
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v2, "frame");
    v9 = v8;
    v11 = v10;
    objc_msgSend((id)objc_msgSend(v3, "lastObject"), "size");
    objc_msgSend(v2, "setFrame:", v9, v11, v12, v13);
  }

  return v2;
}

- (id)_newProgressView
{
  MSPieImageView *v2;
  uint64_t v3;

  v2 = objc_alloc_init(MSPieImageView);
  v3 = objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  -[MSPieImageView setBackgroundColor:](v2, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "clearColor"));
  -[MSPieImageView setBackgroundImage:](v2, "setBackgroundImage:", objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("PreviewProgressBackground"), v3));
  -[MSPieImageView setForegroundImage:](v2, "setForegroundImage:", objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("PreviewProgressForeground"), v3));
  -[MSPieImageView setPieRadius:](v2, "setPieRadius:", 24.5);
  -[MSPieImageView sizeToFit](v2, "sizeToFit");
  return v2;
}

- (void)_showBufferingImageView
{
  UIImageView *bufferingImageView;
  UIImageView *v4;

  if (-[SUPlayerStatus playerState](self->_playerStatus, "playerState") == 1)
  {
    -[MSPieImageView removeFromSuperview](self->_progressView, "removeFromSuperview");

    self->_progressView = 0;
    bufferingImageView = self->_bufferingImageView;
    if (!bufferingImageView)
    {
      v4 = -[MSAudioProgressView _newBufferingImageView](self, "_newBufferingImageView");
      self->_bufferingImageView = v4;
      -[MSAudioProgressView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v4, self->_stopImageView);
      bufferingImageView = self->_bufferingImageView;
    }
    -[UIImageView startAnimating](bufferingImageView, "startAnimating");
  }
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (SUPlayerStatus)playerStatus
{
  return self->_playerStatus;
}

@end
