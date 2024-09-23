@implementation ICAudioPlayPauseView

- (ICAudioPlayPauseView)initWithFrame:(CGRect)a3
{
  ICAudioPlayPauseView *v3;
  ICAudioPlayPauseView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICAudioPlayPauseView;
  v3 = -[ICAudioPlayPauseView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[ICAudioPlayPauseView sharedInit](v3, "sharedInit");
  return v4;
}

- (ICAudioPlayPauseView)initWithCoder:(id)a3
{
  ICAudioPlayPauseView *v3;
  ICAudioPlayPauseView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICAudioPlayPauseView;
  v3 = -[ICAudioPlayPauseView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[ICAudioPlayPauseView sharedInit](v3, "sharedInit");
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ICAudioPlayPauseView;
  -[ICAudioPlayPauseView dealloc](&v4, sel_dealloc);
}

- (void)setAudioAttachment:(id)a3
{
  ICAttachment *v5;
  ICAttachment *v6;

  v5 = (ICAttachment *)a3;
  if (self->_audioAttachment != v5)
  {
    v6 = v5;
    -[ICAudioPlayPauseView audioWillChange](self, "audioWillChange");
    objc_storeStrong((id *)&self->_audioAttachment, a3);
    -[ICAudioPlayPauseView audioDidChange](self, "audioDidChange");
    v5 = v6;
  }

}

- (AVAsset)audio
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;

  +[ICAudioController sharedAudioController](ICAudioController, "sharedAudioController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentAttachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAudioPlayPauseView audioAttachment](self, "audioAttachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
  {
    +[ICAudioController sharedAudioController](ICAudioController, "sharedAudioController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentAsset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return (AVAsset *)v8;
}

- (BOOL)isPlaying
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  char v8;

  +[ICAudioController sharedAudioController](ICAudioController, "sharedAudioController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentAttachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAudioPlayPauseView audioAttachment](self, "audioAttachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (!v6)
    return 0;
  +[ICAudioController sharedAudioController](ICAudioController, "sharedAudioController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isPlaying");

  return v8;
}

- (void)play
{
  void *v3;
  id v4;

  +[ICAudioController sharedAudioController](ICAudioController, "sharedAudioController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ICAudioPlayPauseView audioAttachment](self, "audioAttachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "play:", v3);

}

- (void)pause
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  id v7;

  +[ICAudioController sharedAudioController](ICAudioController, "sharedAudioController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentAttachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAudioPlayPauseView audioAttachment](self, "audioAttachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
  {
    +[ICAudioController sharedAudioController](ICAudioController, "sharedAudioController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pause");

  }
}

- (void)togglePlayPause
{
  if (-[ICAudioPlayPauseView isPlaying](self, "isPlaying"))
    -[ICAudioPlayPauseView pause](self, "pause");
  else
    -[ICAudioPlayPauseView play](self, "play");
}

- (void)sharedInit
{
  double v2;
  double v4;
  double v5;
  double v6;
  void *v7;
  id v8;

  LODWORD(v2) = 1144750080;
  -[ICAudioPlayPauseView setContentHuggingPriority:forAxis:](self, "setContentHuggingPriority:forAxis:", 0, v2);
  LODWORD(v4) = 1144750080;
  -[ICAudioPlayPauseView setContentHuggingPriority:forAxis:](self, "setContentHuggingPriority:forAxis:", 1, v4);
  LODWORD(v5) = 1148846080;
  -[ICAudioPlayPauseView setContentCompressionResistancePriority:forAxis:](self, "setContentCompressionResistancePriority:forAxis:", 0, v5);
  LODWORD(v6) = 1148846080;
  -[ICAudioPlayPauseView setContentCompressionResistancePriority:forAxis:](self, "setContentCompressionResistancePriority:forAxis:", 1, v6);
  -[ICAudioPlayPauseView createBackgroundLayer](self, "createBackgroundLayer");
  -[ICAudioPlayPauseView createPlayPauseViews](self, "createPlayPauseViews");
  -[ICAudioPlayPauseView showStopped](self, "showStopped");
  v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_tapGesture_);
  -[ICAudioPlayPauseView addGestureRecognizer:](self, "addGestureRecognizer:", v8);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_didPlayToEndNotification_, *MEMORY[0x1E0C8AC48], 0);

}

- (id)addSubImageViewForImage:(id)a3
{
  id v4;
  ICNoteEditorIconImageView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(ICNoteEditorIconImageView);
  -[ICNoteEditorIconImageView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3870], "ic_largeSystemImageNamed:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICNoteEditorIconImageView setImage:](v5, "setImage:", v6);
  -[ICAudioPlayPauseView addSubview:](self, "addSubview:", v5);
  v7 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, 9, 0, self, 9, 1.0, 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v8;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, 10, 0, self, 10, 1.0, 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activateConstraints:", v10);

  -[ICNoteEditorIconImageView image](v5, "image");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "size");
  v13 = v12;
  -[ICNoteEditorIconImageView image](v5, "image");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "size");
  -[ICNoteEditorIconImageView setFrame:](v5, "setFrame:", 0.0, 0.0, v13, v15);

  return v5;
}

- (void)createPlayPauseViews
{
  void *v3;
  id v4;

  -[ICAudioPlayPauseView addSubImageViewForImage:](self, "addSubImageViewForImage:", CFSTR("play.fill"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAudioPlayPauseView setPlayView:](self, "setPlayView:", v3);

  -[ICAudioPlayPauseView addSubImageViewForImage:](self, "addSubImageViewForImage:", CFSTR("pause.fill"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ICAudioPlayPauseView setPauseView:](self, "setPauseView:", v4);

}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ICAudioPlayPauseView;
  -[ICAudioPlayPauseView didMoveToWindow](&v10, sel_didMoveToWindow);
  -[ICAudioPlayPauseView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setValue:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD3160]);
    -[ICAudioPlayPauseView window](self, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "screen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scale");
    v8 = v7;
    -[ICAudioPlayPauseView backgroundLayer](self, "backgroundLayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setContentsScale:", v8);

    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  }
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  -[ICAudioPlayPauseView playView](self, "playView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  -[ICAudioPlayPauseView pauseView](self, "pauseView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;

  if (v5 < v8)
    v5 = v8;
  -[ICAudioPlayPauseView playView](self, "playView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v11 = v10;

  -[ICAudioPlayPauseView pauseView](self, "pauseView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v14 = v13;

  if (v11 >= v14)
    v15 = v11;
  else
    v15 = v14;
  v16 = v5;
  result.height = v15;
  result.width = v16;
  return result;
}

- (void)tintColorDidChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICAudioPlayPauseView;
  -[ICAudioPlayPauseView tintColorDidChange](&v7, sel_tintColorDidChange);
  -[ICAudioPlayPauseView tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAudioPlayPauseView playView](self, "playView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTintColor:", v3);

  -[ICAudioPlayPauseView tintColor](self, "tintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAudioPlayPauseView pauseView](self, "pauseView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTintColor:", v5);

}

- (void)tapGesture:(id)a3
{
  if (objc_msgSend(a3, "state") == 3)
    -[ICAudioPlayPauseView togglePlayPause](self, "togglePlayPause");
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICAudioPlayPauseView;
  -[ICAudioPlayPauseView touchesBegan:withEvent:](&v5, sel_touchesBegan_withEvent_, a3, a4);
  -[ICAudioPlayPauseView showPressed:](self, "showPressed:", 1);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICAudioPlayPauseView;
  -[ICAudioPlayPauseView touchesEnded:withEvent:](&v5, sel_touchesEnded_withEvent_, a3, a4);
  -[ICAudioPlayPauseView showPressed:](self, "showPressed:", 0);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICAudioPlayPauseView;
  -[ICAudioPlayPauseView touchesCancelled:withEvent:](&v5, sel_touchesCancelled_withEvent_, a3, a4);
  -[ICAudioPlayPauseView showPressed:](self, "showPressed:", 0);
}

- (void)setImageNamed:(id)a3 onLayer:(id)a4 adjustLayerSize:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;

  v5 = a5;
  v14 = a4;
  objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:", a3);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v14, "setContents:", objc_msgSend(v7, "CGImage"));
  if (v5)
  {
    objc_msgSend(v14, "bounds");
    v9 = v8;
    v11 = v10;
    objc_msgSend(v7, "size");
    objc_msgSend(v14, "setBounds:", v9, v11, v12, v13);
  }

}

- (void)audioWillChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[ICAudioPlayPauseView audioAttachment](self, "audioAttachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAudioPlayPauseView audioAttachment](self, "audioAttachment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("ICAudioPlaybackPlayNotification"), v5);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAudioPlayPauseView audioAttachment](self, "audioAttachment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("ICAudioPlaybackPauseNotification"), v7);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAudioPlayPauseView audioAttachment](self, "audioAttachment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObserver:name:object:", self, CFSTR("ICAudioPlaybackStopNotification"), v9);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[ICAudioPlayPauseView audioAttachment](self, "audioAttachment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObserver:name:object:", self, CFSTR("ICAudioPlaybackTimeChangedNotification"), v10);

  }
}

- (void)audioDidChange
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;

  -[ICAudioPlayPauseView audioAttachment](self, "audioAttachment");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_3;
  v4 = (void *)v3;
  +[ICAudioController sharedAudioController](ICAudioController, "sharedAudioController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentAttachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAudioPlayPauseView audioAttachment](self, "audioAttachment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v7)
  {
    +[ICAudioController sharedAudioController](ICAudioController, "sharedAudioController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isPlaying");

    if (v16)
      -[ICAudioPlayPauseView showPlaying](self, "showPlaying");
    else
      -[ICAudioPlayPauseView showPaused](self, "showPaused");
  }
  else
  {
LABEL_3:
    -[ICAudioPlayPauseView showStopped](self, "showStopped");
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAudioPlayPauseView audioAttachment](self, "audioAttachment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_audioPlaybackPlayNotification_, CFSTR("ICAudioPlaybackPlayNotification"), v9);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAudioPlayPauseView audioAttachment](self, "audioAttachment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_audioPlaybackPauseNotification_, CFSTR("ICAudioPlaybackPauseNotification"), v11);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAudioPlayPauseView audioAttachment](self, "audioAttachment");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObserver:selector:name:object:", self, sel_audioPlaybackStopNotification_, CFSTR("ICAudioPlaybackStopNotification"), v13);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[ICAudioPlayPauseView audioAttachment](self, "audioAttachment");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObserver:selector:name:object:", self, sel_audioPlaybackTimeChangedNotification_, CFSTR("ICAudioPlaybackTimeChangedNotification"), v14);

}

- (void)showPlaying
{
  void *v3;
  id v4;

  -[ICAudioPlayPauseView playView](self, "playView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  -[ICAudioPlayPauseView pauseView](self, "pauseView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 0);

}

- (void)showPaused
{
  void *v3;
  id v4;

  -[ICAudioPlayPauseView playView](self, "playView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 0);

  -[ICAudioPlayPauseView pauseView](self, "pauseView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

}

- (void)audioPlaybackPlayNotification:(id)a3
{
  id v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "object");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ICAudioPlayPauseView audioAttachment](self, "audioAttachment");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v6 == v4)
  {
    -[ICAudioPlayPauseView showPlaying](self, "showPlaying");
    v5 = v6;
  }

}

- (void)audioPlaybackPauseNotification:(id)a3
{
  id v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "object");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ICAudioPlayPauseView audioAttachment](self, "audioAttachment");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v6 == v4)
  {
    -[ICAudioPlayPauseView showPaused](self, "showPaused");
    v5 = v6;
  }

}

- (void)audioPlaybackStopNotification:(id)a3
{
  id v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "object");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ICAudioPlayPauseView audioAttachment](self, "audioAttachment");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v6 == v4)
  {
    -[ICAudioPlayPauseView showStopped](self, "showStopped");
    v5 = v6;
  }

}

- (void)audioPlaybackTimeChangedNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAudioPlayPauseView audioAttachment](self, "audioAttachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
  {
    objc_msgSend(v13, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ICAudioPlaybackNotificationTimeKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ICAudioPlaybackNotificationDurationKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "doubleValue");
    v11 = v10;
    objc_msgSend(v9, "doubleValue");
    -[ICAudioPlayPauseView updateTime:duration:](self, "updateTime:duration:", v11, v12);

  }
}

- (void)didPlayToEndNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  +[ICAudioController sharedAudioController](ICAudioController, "sharedAudioController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentAttachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAudioPlayPauseView audioAttachment](self, "audioAttachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
    -[ICAudioPlayPauseView showStopped](self, "showStopped");
}

- (id)foregroundStrokeColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0, 0.478431373, 1.0, 1.0);
}

- (ICAttachment)audioAttachment
{
  return self->_audioAttachment;
}

- (CALayer)backgroundLayer
{
  return self->_backgroundLayer;
}

- (void)setBackgroundLayer:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundLayer, a3);
}

- (ICNoteEditorIconImageView)playView
{
  return self->_playView;
}

- (void)setPlayView:(id)a3
{
  objc_storeStrong((id *)&self->_playView, a3);
}

- (ICNoteEditorIconImageView)pauseView
{
  return self->_pauseView;
}

- (void)setPauseView:(id)a3
{
  objc_storeStrong((id *)&self->_pauseView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pauseView, 0);
  objc_storeStrong((id *)&self->_playView, 0);
  objc_storeStrong((id *)&self->_backgroundLayer, 0);
  objc_storeStrong((id *)&self->_audioAttachment, 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  const __CFString *v2;

  if (-[ICAudioPlayPauseView isPlaying](self, "isPlaying"))
    v2 = CFSTR("Pause");
  else
    v2 = CFSTR("Play");
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", v2, v2, 0, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
