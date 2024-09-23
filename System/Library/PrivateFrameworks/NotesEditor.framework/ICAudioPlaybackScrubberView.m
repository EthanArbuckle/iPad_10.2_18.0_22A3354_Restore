@implementation ICAudioPlaybackScrubberView

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Playback progress"), &stru_1EA7E9860, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ICAudioPlaybackScrubberView)initWithFrame:(CGRect)a3
{
  ICAudioPlaybackScrubberView *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ICAudioPlaybackScrubberView;
  v3 = -[ICAudioPlaybackScrubberView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = 1132068864;
    -[ICAudioPlaybackScrubberView setContentHuggingPriority:forAxis:](v3, "setContentHuggingPriority:forAxis:", 0, v5);
    if ((objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:withConfiguration:", CFSTR("audio_scrubber_thumb"), v4, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAudioPlaybackScrubberView setThumbImage:forState:](v3, "setThumbImage:forState:", v6, 0);

      objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:withConfiguration:", CFSTR("audio_scrubber_track"), v4, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAudioPlaybackScrubberView setMinimumTrackImage:forState:](v3, "setMinimumTrackImage:forState:", v7, 0);

      objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:withConfiguration:", CFSTR("audio_scrubber_track"), v4, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAudioPlaybackScrubberView setMaximumTrackImage:forState:](v3, "setMaximumTrackImage:forState:", v8, 0);

    }
    -[ICAudioPlaybackScrubberView setSemanticContentAttribute:](v3, "setSemanticContentAttribute:", 1);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ICAudioPlaybackScrubberView;
  -[ICAudioPlaybackScrubberView dealloc](&v4, sel_dealloc);
}

- (void)setAudioAttachment:(id)a3
{
  ICAttachment *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  ICAttachment *v11;

  v5 = (ICAttachment *)a3;
  if (self->_audioAttachment != v5)
  {
    v11 = v5;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x1E0D648D0];
    -[ICAudioPlaybackScrubberView audioAttachment](self, "audioAttachment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:name:object:", self, v7, v8);

    objc_storeStrong((id *)&self->_audioAttachment, a3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAudioPlaybackScrubberView audioAttachment](self, "audioAttachment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", self, sel_audioPlaybackTimeChangedNotification_, v7, v10);

    v5 = v11;
  }

}

- (ICAttachment)audioAttachment
{
  return self->_audioAttachment;
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
  -[ICAudioPlaybackScrubberView audioAttachment](self, "audioAttachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
  {
    objc_msgSend(v13, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D648B0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D648A8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "doubleValue");
    v11 = v10;
    objc_msgSend(v9, "doubleValue");
    -[ICAudioPlaybackScrubberView updateTime:duration:](self, "updateTime:duration:", v11, v12);

  }
}

- (void)updateTime:(double)a3 duration:(double)a4
{
  double v4;
  double v6;

  v4 = a3;
  *(float *)&a3 = a4;
  -[ICAudioPlaybackScrubberView setMaximumValue:](self, "setMaximumValue:", a3);
  *(float *)&v6 = v4;
  -[ICAudioPlaybackScrubberView setValue:animated:](self, "setValue:animated:", 1, v6);
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  BOOL v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ICAudioPlaybackScrubberView;
  v5 = -[ICAudioPlaybackScrubberView beginTrackingWithTouch:withEvent:](&v9, sel_beginTrackingWithTouch_withEvent_, a3, a4);
  objc_msgSend(MEMORY[0x1E0D64B10], "sharedAudioController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAudioPlaybackScrubberView setWasPlaying:](self, "setWasPlaying:", objc_msgSend(v6, "isPlaying"));

  if (-[ICAudioPlaybackScrubberView wasPlaying](self, "wasPlaying"))
  {
    objc_msgSend(MEMORY[0x1E0D64B10], "sharedAudioController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pause");

  }
  return v5;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v5;
  int v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  float v14;
  float v15;
  float v16;
  double v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  double v24;
  CGRect v26;
  CGRect v27;

  v5 = a3;
  v6 = -[ICAudioPlaybackScrubberView isTracking](self, "isTracking");
  if (v6)
  {
    objc_msgSend(v5, "locationInView:", self);
    v8 = v7;
    v10 = v9;
    objc_msgSend(v5, "previousLocationInView:", self);
    v12 = v11;
    -[ICAudioPlaybackScrubberView frame](self, "frame");
    v13 = v10 + CGRectGetHeight(v26) * -0.5;
    if (v13 < 0.0)
      v13 = -v13;
    v14 = 0.25;
    v15 = 1.0;
    if (v13 > 50.0)
      v15 = 0.5;
    if (v13 <= 120.0)
      v14 = v15;
    if (v13 <= 170.0)
      v16 = v14;
    else
      v16 = 0.1;
    -[ICAudioPlaybackScrubberView frame](self, "frame");
    v17 = (v8 - v12) / CGRectGetWidth(v27);
    -[ICAudioPlaybackScrubberView maximumValue](self, "maximumValue");
    v19 = v18;
    -[ICAudioPlaybackScrubberView minimumValue](self, "minimumValue");
    v21 = v17 * (float)(v19 - v20);
    v22 = v16 * v21;
    -[ICAudioPlaybackScrubberView value](self, "value");
    *(float *)&v24 = v23 + v22;
    -[ICAudioPlaybackScrubberView setValue:](self, "setValue:", v24);
    if (-[ICAudioPlaybackScrubberView isContinuous](self, "isContinuous"))
      -[ICAudioPlaybackScrubberView sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
  }

  return v6;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  int v8;
  int v9;
  double v10;
  void *v11;
  float v12;
  void *v13;
  objc_super v14;

  v6 = a4;
  v7 = a3;
  -[ICAudioPlaybackScrubberView value](self, "value");
  v9 = v8;
  v14.receiver = self;
  v14.super_class = (Class)ICAudioPlaybackScrubberView;
  -[ICAudioPlaybackScrubberView endTrackingWithTouch:withEvent:](&v14, sel_endTrackingWithTouch_withEvent_, v7, v6);

  LODWORD(v10) = v9;
  -[ICAudioPlaybackScrubberView setValue:](self, "setValue:", v10);
  objc_msgSend(MEMORY[0x1E0D64B10], "sharedAudioController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAudioPlaybackScrubberView value](self, "value");
  objc_msgSend(v11, "seekToTime:completion:", 0, v12);

  if (-[ICAudioPlaybackScrubberView wasPlaying](self, "wasPlaying"))
  {
    objc_msgSend(MEMORY[0x1E0D64B10], "sharedAudioController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "play");

  }
}

- (BOOL)wasPlaying
{
  return self->_wasPlaying;
}

- (void)setWasPlaying:(BOOL)a3
{
  self->_wasPlaying = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioAttachment, 0);
}

@end
