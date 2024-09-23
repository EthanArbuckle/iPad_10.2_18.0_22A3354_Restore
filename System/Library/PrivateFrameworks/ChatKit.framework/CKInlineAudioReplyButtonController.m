@implementation CKInlineAudioReplyButtonController

- (CKInlineAudioReplyButtonController)initWithStartButton:(id)a3 stopButton:(id)a4
{
  id v6;
  id v7;
  CKInlineAudioReplyButtonController *v8;
  CKInlineAudioReplyButtonController *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CKInlineAudioReplyButtonController;
  v8 = -[CKInlineAudioReplyButtonController init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[CKInlineAudioReplyButtonController setHoldThreshold:](v8, "setHoldThreshold:", 0.255);
    objc_msgSend(v6, "addTarget:action:forControlEvents:", v9, sel_touchDownInStartButton_event_, 1);
    objc_msgSend(v6, "addTarget:action:forControlEvents:", v9, sel_touchUpInStartButton_event_, 64);
    objc_msgSend(v6, "addTarget:action:forControlEvents:", v9, sel_touchUpOutsideStartButton_event_, 128);
    objc_msgSend(v7, "addTarget:action:forControlEvents:", v9, sel_touchUpInStopButton_, 64);
    objc_msgSend(v6, "addTarget:action:forControlEvents:", v9, sel_touchDragEnter_, 16);
    objc_msgSend(v7, "addTarget:action:forControlEvents:", v9, sel_touchDragEnter_, 16);
    objc_msgSend(v6, "addTarget:action:forControlEvents:", v9, sel_touchDragExit_, 32);
    objc_msgSend(v7, "addTarget:action:forControlEvents:", v9, sel_touchDragExit_, 32);
    -[CKInlineAudioReplyButtonController setStartButton:](v9, "setStartButton:", v6);
    -[CKInlineAudioReplyButtonController setStopButton:](v9, "setStopButton:", v7);
    -[CKInlineAudioReplyButtonController setStarted:](v9, "setStarted:", 0);
  }

  return v9;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CEA6C8], "activeKeyboard");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDisableInteraction:", 0);

  -[UIButton removeTarget:action:forControlEvents:](self->_startButton, "removeTarget:action:forControlEvents:", self, 0, 0);
  -[UIButton removeTarget:action:forControlEvents:](self->_stopButton, "removeTarget:action:forControlEvents:", self, 0, 0);
  v4.receiver = self;
  v4.super_class = (Class)CKInlineAudioReplyButtonController;
  -[CKInlineAudioReplyButtonController dealloc](&v4, sel_dealloc);
}

- (void)setStarted:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v3 = a3;
  self->_started = a3;
  -[CKInlineAudioReplyButtonController startButton](self, "startButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    objc_msgSend(v5, "setAlpha:", 0.0);

    -[CKInlineAudioReplyButtonController stopButton](self, "stopButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAlpha:", 1.0);

    objc_msgSend(MEMORY[0x1E0CEA6C8], "activeKeyboard");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v8;
    v9 = 1;
  }
  else
  {
    objc_msgSend(v5, "setAlpha:", 1.0);

    -[CKInlineAudioReplyButtonController stopButton](self, "stopButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAlpha:", 0.0);

    objc_msgSend(MEMORY[0x1E0CEA6C8], "activeKeyboard");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v8;
    v9 = 0;
  }
  objc_msgSend(v8, "setDisableInteraction:", v9);

}

- (void)touchDownInStartButton:(id)a3 event:(id)a4
{
  void *v5;
  id v6;

  objc_msgSend(a4, "timestamp", a3);
  -[CKInlineAudioReplyButtonController setTouchDownTime:](self, "setTouchDownTime:");
  if (-[CKInlineAudioReplyButtonController isStarted](self, "isStarted"))
  {
    -[CKInlineAudioReplyButtonController setStarted:](self, "setStarted:", 0);
    -[CKInlineAudioReplyButtonController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "audioReplyButtonStop:", self);
  }
  else
  {
    -[CKInlineAudioReplyButtonController setStarted:](self, "setStarted:", 1);
    -[CKInlineAudioReplyButtonController stopButton](self, "stopButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHighlighted:", 1);

    -[CKInlineAudioReplyButtonController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "audioReplyButtonStart:", self);
  }

}

- (void)touchUpInStartButton:(id)a3 event:(id)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  objc_msgSend(a4, "timestamp", a3);
  v6 = v5;
  -[CKInlineAudioReplyButtonController touchDownTime](self, "touchDownTime");
  v8 = v6 - v7;
  -[CKInlineAudioReplyButtonController holdThreshold](self, "holdThreshold");
  if (v8 > v9 && -[CKInlineAudioReplyButtonController isStarted](self, "isStarted"))
  {
    -[CKInlineAudioReplyButtonController setStarted:](self, "setStarted:", 0);
    -[CKInlineAudioReplyButtonController delegate](self, "delegate");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "audioReplyButtonStop:", self);
  }
  else
  {
    -[CKInlineAudioReplyButtonController stopButton](self, "stopButton");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHighlighted:", 0);
  }

}

- (void)touchUpOutsideStartButton:(id)a3 event:(id)a4
{
  id v5;

  -[CKInlineAudioReplyButtonController setStarted:](self, "setStarted:", 0, a4);
  -[CKInlineAudioReplyButtonController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "audioReplyButtonCancel:", self);

}

- (void)touchUpInStopButton:(id)a3
{
  id v4;

  if (-[CKInlineAudioReplyButtonController isStarted](self, "isStarted", a3))
  {
    -[CKInlineAudioReplyButtonController setStarted:](self, "setStarted:", 0);
    -[CKInlineAudioReplyButtonController delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioReplyButtonStop:", self);

  }
}

- (void)touchDragEnter:(id)a3
{
  id v3;

  -[CKInlineAudioReplyButtonController stopButton](self, "stopButton", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHighlighted:", 1);

}

- (void)touchDragExit:(id)a3
{
  id v3;

  -[CKInlineAudioReplyButtonController stopButton](self, "stopButton", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHighlighted:", 0);

}

- (BOOL)isStarted
{
  return self->_started;
}

- (CKInlineAudioReplyButtonDelegate)delegate
{
  return (CKInlineAudioReplyButtonDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIButton)startButton
{
  return self->_startButton;
}

- (void)setStartButton:(id)a3
{
  objc_storeStrong((id *)&self->_startButton, a3);
}

- (UIButton)stopButton
{
  return self->_stopButton;
}

- (void)setStopButton:(id)a3
{
  objc_storeStrong((id *)&self->_stopButton, a3);
}

- (double)holdThreshold
{
  return self->_holdThreshold;
}

- (void)setHoldThreshold:(double)a3
{
  self->_holdThreshold = a3;
}

- (double)touchDownTime
{
  return self->_touchDownTime;
}

- (void)setTouchDownTime:(double)a3
{
  self->_touchDownTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stopButton, 0);
  objc_storeStrong((id *)&self->_startButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
