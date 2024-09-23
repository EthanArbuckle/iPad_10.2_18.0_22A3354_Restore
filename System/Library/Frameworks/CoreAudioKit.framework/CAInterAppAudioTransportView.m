@implementation CAInterAppAudioTransportView

- (void)initialize
{
  double v3;
  float v4;
  double v5;
  CAUITransportButton *v6;
  double v7;
  float v8;
  CAUITransportButton *v9;
  double v10;
  CAUITransportButton *v11;
  double v12;
  UIColor *v13;
  UIColor *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;

  -[CAInterAppAudioTransportView setBackgroundColor:](self, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor"));
  -[CAInterAppAudioTransportView frame](self, "frame");
  v4 = v3;
  v5 = floorf(v4);
  v6 = [CAUITransportButton alloc];
  -[CAInterAppAudioTransportView frame](self, "frame");
  v8 = v7 - v5;
  self->playPauseButton = -[CAUITransportButton initWithFrame:](v6, "initWithFrame:", (float)(floorf(v8) * 0.5), 0.0, v5, v5);
  v9 = [CAUITransportButton alloc];
  -[CAUITransportButton frame](self->playPauseButton, "frame");
  self->rewindButton = -[CAUITransportButton initWithFrame:](v9, "initWithFrame:", v10 - v5 + -35.0, 0.0, v5, v5);
  v11 = [CAUITransportButton alloc];
  -[CAUITransportButton frame](self->playPauseButton, "frame");
  self->recordButton = -[CAUITransportButton initWithFrame:](v11, "initWithFrame:", v12 + v5 + 35.0, 0.0, v5, v5);
  -[CAUITransportButton setDrawingStyle:](self->rewindButton, "setDrawingStyle:", 1);
  -[CAUITransportButton setDrawingStyle:](self->playPauseButton, "setDrawingStyle:", 2);
  -[CAUITransportButton setDrawingStyle:](self->recordButton, "setDrawingStyle:", 4);
  -[CAUITransportButton setFillColor:](self->rewindButton, "setFillColor:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.063000001, 1.0), "CGColor"));
  v13 = (UIColor *)(id)objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.063000001, 1.0);
  self->pauseButtonColor = v13;
  v14 = v13;
  self->playButtonColor = v14;
  -[CAUITransportButton setFillColor:](self->playPauseButton, "setFillColor:", -[UIColor CGColor](v14, "CGColor"));
  -[CAUITransportButton setFillColor:](self->recordButton, "setFillColor:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.984000027, 0.250999987, 0.172999993, 1.0), "CGColor"));
  -[CAUITransportButton addTarget:action:forControlEvents:](self->rewindButton, "addTarget:action:forControlEvents:", self, sel_rewindAction_, 64);
  -[CAUITransportButton addTarget:action:forControlEvents:](self->playPauseButton, "addTarget:action:forControlEvents:", self, sel_togglePlayback_, 64);
  -[CAUITransportButton addTarget:action:forControlEvents:](self->recordButton, "addTarget:action:forControlEvents:", self, sel_toggleRecording_, 64);
  -[CAInterAppAudioTransportView addSubview:](self, "addSubview:", self->rewindButton);
  -[CAInterAppAudioTransportView addSubview:](self, "addSubview:", self->playPauseButton);
  -[CAInterAppAudioTransportView addSubview:](self, "addSubview:", self->recordButton);
  v15 = objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 12.0);
  v16 = objc_alloc(MEMORY[0x24BEBD708]);
  self->currentTimeLabel = (UILabel *)objc_msgSend(v16, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[CAInterAppAudioTransportView setLabelColor:](self, "setLabelColor:", objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor"));
  -[UILabel setText:](self->currentTimeLabel, "setText:", CFSTR("00:00:00"));
  -[UILabel setFont:](self->currentTimeLabel, "setFont:", -[CAInterAppAudioTransportView currentTimeLabelFont](self, "currentTimeLabelFont"));
  -[UILabel setTextColor:](self->currentTimeLabel, "setTextColor:", -[CAInterAppAudioTransportView labelColor](self, "labelColor"));
  -[UILabel setBackgroundColor:](self->currentTimeLabel, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor"));
  -[UILabel setTextAlignment:](self->currentTimeLabel, "setTextAlignment:", 0);
  -[CAInterAppAudioTransportView setCurrentTimeLabelFont:](self, "setCurrentTimeLabelFont:", v15);
  -[CAInterAppAudioTransportView addSubview:](self, "addSubview:", self->currentTimeLabel);
  self->_playing = 0;
  self->_recording = 0;
  self->_connected = 0;
  v17 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v17, "addObserver:selector:name:object:", self, sel_appHasGoneInBackground, *MEMORY[0x24BEBDF98], 0);
  v18 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v18, "addObserver:selector:name:object:", self, sel_appHasGoneForeground, *MEMORY[0x24BEBE008], 0);
  self->inForeground = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication"), "applicationState") != 2;
  -[CAInterAppAudioTransportView updateTransportControls](self, "updateTransportControls");
}

- (CAInterAppAudioTransportView)initWithFrame:(CGRect)a3
{
  CAInterAppAudioTransportView *v3;
  CAInterAppAudioTransportView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAInterAppAudioTransportView;
  v3 = -[CAInterAppAudioTransportView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[CAInterAppAudioTransportView initialize](v3, "initialize");
  return v4;
}

- (CAInterAppAudioTransportView)initWithCoder:(id)a3
{
  CAInterAppAudioTransportView *v3;
  CAInterAppAudioTransportView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAInterAppAudioTransportView;
  v3 = -[CAInterAppAudioTransportView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[CAInterAppAudioTransportView initialize](v3, "initialize");
  return v4;
}

- (void)dealloc
{
  HostCallbackInfo *callBackInfo;
  objc_super v4;

  callBackInfo = self->callBackInfo;
  if (callBackInfo)
    free(callBackInfo);

  v4.receiver = self;
  v4.super_class = (Class)CAInterAppAudioTransportView;
  -[CAInterAppAudioTransportView dealloc](&v4, sel_dealloc);
}

- (BOOL)isEnabled
{
  return self->enabled;
}

- (void)setEnabled:(BOOL)enabled
{
  _BOOL8 v3;

  if (self->enabled != enabled)
  {
    v3 = enabled;
    -[CAUITransportButton setEnabled:](self->recordButton, "setEnabled:");
    -[CAUITransportButton setEnabled:](self->playPauseButton, "setEnabled:", v3);
    -[CAUITransportButton setEnabled:](self->rewindButton, "setEnabled:", v3);
  }
}

- (UIColor)labelColor
{
  return -[UILabel textColor](self->currentTimeLabel, "textColor");
}

- (void)setLabelColor:(UIColor *)labelColor
{
  -[UILabel setTextColor:](self->currentTimeLabel, "setTextColor:", labelColor);
}

- (void)setCurrentTimeLabelFont:(UIFont *)currentTimeLabelFont
{
  NSString *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  -[UILabel setFont:](self->currentTimeLabel, "setFont:");
  v5 = -[UILabel text](self->currentTimeLabel, "text");
  v13 = *MEMORY[0x24BEBB360];
  v14[0] = currentTimeLabelFont;
  -[NSString sizeWithAttributes:](v5, "sizeWithAttributes:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1));
  v7 = v6;
  v9 = v8;
  -[CAInterAppAudioTransportView frame](self, "frame");
  v11 = v10 - v7;
  -[CAInterAppAudioTransportView frame](self, "frame");
  -[UILabel setFrame:](self->currentTimeLabel, "setFrame:", v11, (v12 - v9) * 0.5, v7, v9);
}

- (UIColor)rewindButtonColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithCGColor:", -[CAUITransportButton fillColor](self->rewindButton, "fillColor"));
}

- (void)setRewindButtonColor:(UIColor *)rewindButtonColor
{
  -[CAUITransportButton setFillColor:](self->rewindButton, "setFillColor:", -[UIColor CGColor](rewindButtonColor, "CGColor"));
}

- (UIColor)playButtonColor
{
  return self->playButtonColor;
}

- (void)setPlayButtonColor:(UIColor *)playButtonColor
{
  UIColor *v5;

  v5 = playButtonColor;

  self->playButtonColor = playButtonColor;
  if (-[CAUITransportButton drawingStyle](self->playPauseButton, "drawingStyle") == 3)
    -[CAUITransportButton setFillColor:](self->playPauseButton, "setFillColor:", -[UIColor CGColor](self->playButtonColor, "CGColor"));
}

- (UIColor)pauseButtonColor
{
  return self->pauseButtonColor;
}

- (void)setPauseButtonColor:(UIColor *)pauseButtonColor
{
  UIColor *v5;

  v5 = pauseButtonColor;

  self->pauseButtonColor = pauseButtonColor;
  if (-[CAUITransportButton drawingStyle](self->playPauseButton, "drawingStyle") == 2)
    -[CAUITransportButton setFillColor:](self->playPauseButton, "setFillColor:", -[UIColor CGColor](self->pauseButtonColor, "CGColor"));
}

- (UIColor)recordButtonColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithCGColor:", -[CAUITransportButton fillColor](self->recordButton, "fillColor"));
}

- (void)setRecordButtonColor:(UIColor *)recordButtonColor
{
  -[CAUITransportButton setFillColor:](self->recordButton, "setFillColor:", -[UIColor CGColor](recordButtonColor, "CGColor"));
}

- (void)setOutputAudioUnit:(AudioUnit)au
{
  OpaqueAudioComponentInstance *outputUnit;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  outputUnit = self->outputUnit;
  if (outputUnit != au)
  {
    if (outputUnit)
    {
      v6 = AudioUnitRemovePropertyListenerWithUserData(outputUnit, 0x65u, (AudioUnitPropertyListenerProc)_CAIAAAUTransportPropertyChangeDispatcher, self);
      if ((_DWORD)v6)
        NSLog(CFSTR("error removing property listener for IsInterAppConnected: %d"), v6);
      v7 = AudioUnitRemovePropertyListenerWithUserData(self->outputUnit, 0x7DDu, (AudioUnitPropertyListenerProc)_CAIAAAUTransportPropertyChangeDispatcher, self);
      if ((_DWORD)v7)
        NSLog(CFSTR("error removing property listener for HostTransportState: %d"), v7);
    }
    self->outputUnit = au;
    if (au)
    {
      v8 = AudioUnitAddPropertyListener(au, 0x65u, (AudioUnitPropertyListenerProc)_CAIAAAUTransportPropertyChangeDispatcher, self);
      if ((_DWORD)v8)
        NSLog(CFSTR("error adding property listener for IsInterAppConnected: %d"), v8);
      v9 = AudioUnitAddPropertyListener(self->outputUnit, 0x7DDu, (AudioUnitPropertyListenerProc)_CAIAAAUTransportPropertyChangeDispatcher, self);
      if ((_DWORD)v9)
        NSLog(CFSTR("error adding property listener for HostTransportState: %d"), v9);
    }
  }
}

- (void)startPollingPlayer
{
  if (-[CAInterAppAudioTransportView isHostConnected](self, "isHostConnected")
    && self->inForeground
    && !self->pollingPlayerTimer)
  {
    self->pollingPlayerTimer = (NSTimer *)objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_pollHost, 0, 1, 0.05);
  }
}

- (void)stopPollingPlayer
{
  NSTimer *pollingPlayerTimer;

  pollingPlayerTimer = self->pollingPlayerTimer;
  if (pollingPlayerTimer)
  {
    -[NSTimer invalidate](pollingPlayerTimer, "invalidate");
    self->pollingPlayerTimer = 0;
  }
}

- (void)pollHost
{
  if (-[CAInterAppAudioTransportView isHostConnected](self, "isHostConnected"))
    -[UILabel setText:](self->currentTimeLabel, "setText:", -[CAInterAppAudioTransportView getPlayTimeString](self, "getPlayTimeString"));
}

- (id)getPlayTimeString
{
  unint64_t playTime;
  double v4;

  -[CAInterAppAudioTransportView updateStatefromTransportCallBack](self, "updateStatefromTransportCallBack");
  playTime = (unint64_t)self->_playTime;
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDB1858], "sharedInstance"), "sampleRate");
  return (id)formattedTimeStringForFrameCountAndSampleRate(playTime, v4, 0);
}

- (void)appHasGoneInBackground
{
  self->inForeground = 0;
  -[CAInterAppAudioTransportView stopPollingPlayer](self, "stopPollingPlayer");
}

- (void)appHasGoneForeground
{
  self->inForeground = 1;
  if (-[CAInterAppAudioTransportView isHostConnected](self, "isHostConnected"))
    -[CAInterAppAudioTransportView startPollingPlayer](self, "startPollingPlayer");
  else
    -[CAInterAppAudioTransportView stopPollingPlayer](self, "stopPollingPlayer");
  -[CAInterAppAudioTransportView updateStatefromTransportCallBack](self, "updateStatefromTransportCallBack");
  -[CAInterAppAudioTransportView updateTransportControls](self, "updateTransportControls");
}

- (void)getHostCallbackInfo
{
  HostCallbackInfo *callBackInfo;
  HostCallbackInfo *v4;
  uint64_t Property;
  UInt32 ioDataSize;

  if (-[CAInterAppAudioTransportView isConnected](self, "isConnected"))
  {
    callBackInfo = self->callBackInfo;
    if (callBackInfo)
      free(callBackInfo);
    ioDataSize = 40;
    v4 = (HostCallbackInfo *)malloc_type_malloc(0x28uLL, 0xF66B2F95uLL);
    self->callBackInfo = v4;
    Property = AudioUnitGetProperty(self->outputUnit, 0x1Bu, 0, 0, v4, &ioDataSize);
    if ((_DWORD)Property)
    {
      NSLog(CFSTR("Error occured fetching kAudioUnitProperty_HostCallbacks : %d"), Property);
      free(self->callBackInfo);
      self->callBackInfo = 0;
    }
  }
}

- (void)updateStatefromTransportCallBack
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  double v7;
  BOOL v8;
  BOOL v9;

  if (-[CAInterAppAudioTransportView isHostConnected](self, "isHostConnected"))
  {
    if (self->inForeground)
    {
      if (self->callBackInfo
        || (-[CAInterAppAudioTransportView getHostCallbackInfo](self, "getHostCallbackInfo"), self->callBackInfo))
      {
        v9 = -[CAInterAppAudioTransportView isPlaying](self, "isPlaying");
        v8 = -[CAInterAppAudioTransportView isRecording](self, "isRecording");
        v7 = 0.0;
        v6 = 0;
        v4 = 0;
        v5 = 0;
        v3 = ((uint64_t (*)(void *, BOOL *, BOOL *, _QWORD, double *, char *, uint64_t *, uint64_t *))self->callBackInfo->transportStateProc2)(self->callBackInfo->hostUserData, &v9, &v8, 0, &v7, &v6, &v5, &v4);
        if ((_DWORD)v3)
        {
          NSLog(CFSTR("Error occured fetching callBackInfo->transportStateProc2 : %d"), v3);
        }
        else
        {
          self->_playing = v9;
          self->_recording = v8;
          self->_playTime = v7;
        }
      }
    }
  }
}

- (BOOL)isHostConnected
{
  OpaqueAudioComponentInstance *outputUnit;
  _BOOL4 v4;
  UInt32 ioDataSize;
  int outData;

  outputUnit = self->outputUnit;
  if (outputUnit)
  {
    ioDataSize = 4;
    outData = 0;
    if (!AudioUnitGetProperty(outputUnit, 0x65u, 0, 0, &outData, &ioDataSize))
    {
      v4 = outData == 0;
      if (((v4 ^ -[CAInterAppAudioTransportView isConnected](self, "isConnected")) & 1) == 0)
      {
        self->_connected = outData != 0;
        if (-[CAInterAppAudioTransportView isConnected](self, "isConnected"))
          -[CAInterAppAudioTransportView getHostCallbackInfo](self, "getHostCallbackInfo");
      }
    }
  }
  return -[CAInterAppAudioTransportView isConnected](self, "isConnected");
}

- (void)rewindAction:(id)a3
{
  -[CAInterAppAudioTransportView sendStateToRemoteHost:](self, "sendStateToRemoteHost:", 3);
  -[CAInterAppAudioTransportView updateStatefromTransportCallBack](self, "updateStatefromTransportCallBack");
  -[CAInterAppAudioTransportView updateTransportControls](self, "updateTransportControls");
}

- (void)togglePlayback:(id)a3
{
  int v4;
  int *v5;

  v4 = -[CAUITransportButton drawingStyle](self->playPauseButton, "drawingStyle", a3);
  v5 = &OBJC_IVAR___CAInterAppAudioTransportView_pauseButtonColor;
  if (v4 == 3)
    v5 = &OBJC_IVAR___CAInterAppAudioTransportView_playButtonColor;
  -[CAUITransportButton setFillColor:](self->playPauseButton, "setFillColor:", objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v5), "CGColor"));
  -[CAInterAppAudioTransportView sendStateToRemoteHost:](self, "sendStateToRemoteHost:", 1);
  -[CAInterAppAudioTransportView startPollingPlayer](self, "startPollingPlayer");
}

- (void)toggleRecording:(id)a3
{
  -[CAInterAppAudioTransportView sendStateToRemoteHost:](self, "sendStateToRemoteHost:", 2);
}

- (void)sendStateToRemoteHost:(unsigned int)a3
{
  OpaqueAudioComponentInstance *outputUnit;
  uint64_t v4;
  uint64_t v5;
  unsigned int inData;

  outputUnit = self->outputUnit;
  if (outputUnit)
  {
    v4 = *(_QWORD *)&a3;
    inData = a3;
    v5 = AudioUnitSetProperty(outputUnit, 0x7DCu, 0, 0, &inData, 4u);
    if ((_DWORD)v5)
      NSLog(CFSTR("Error updating remote host state to %d: %d"), v4, v5);
  }
}

- (void)layoutSubviews
{
  double v3;
  float v4;
  double v5;
  double v6;
  float v7;
  double v8;
  double v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CAInterAppAudioTransportView;
  -[CAInterAppAudioTransportView layoutSubviews](&v10, sel_layoutSubviews);
  -[CAInterAppAudioTransportView frame](self, "frame");
  v4 = v3;
  v5 = floorf(v4);
  -[CAInterAppAudioTransportView frame](self, "frame");
  v7 = v6 - v5;
  -[CAUITransportButton setFrame:](self->playPauseButton, "setFrame:", (float)(floorf(v7) * 0.5), 0.0, v5, v5);
  -[CAUITransportButton frame](self->playPauseButton, "frame");
  -[CAUITransportButton setFrame:](self->rewindButton, "setFrame:", v8 - v5 + -35.0, 0.0, v5, v5);
  -[CAUITransportButton frame](self->playPauseButton, "frame");
  -[CAUITransportButton setFrame:](self->recordButton, "setFrame:", v9 + v5 + 35.0, 0.0, v5, v5);
}

- (void)updateTransportControls
{
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  _BOOL4 v8;
  double v9;

  if (-[CAInterAppAudioTransportView isRecording](self, "isRecording"))
    v3 = 5;
  else
    v3 = 4;
  -[CAUITransportButton setDrawingStyle:](self->recordButton, "setDrawingStyle:", v3);
  v4 = 2;
  if (!-[CAInterAppAudioTransportView isPlaying](self, "isPlaying"))
  {
    if (-[CAInterAppAudioTransportView isRecording](self, "isRecording"))
      v4 = 2;
    else
      v4 = 3;
  }
  -[CAUITransportButton setDrawingStyle:](self->playPauseButton, "setDrawingStyle:", v4);
  -[CAUITransportButton setEnabled:](self->recordButton, "setEnabled:", -[CAInterAppAudioTransportView canRecord](self, "canRecord"));
  -[CAUITransportButton setUserInteractionEnabled:](self->recordButton, "setUserInteractionEnabled:", -[CAUITransportButton isEnabled](self->recordButton, "isEnabled"));
  if (-[CAUITransportButton isEnabled](self->recordButton, "isEnabled"))
    v5 = 1.0;
  else
    v5 = 0.25;
  -[CAUITransportButton setAlpha:](self->recordButton, "setAlpha:", v5);
  -[CAUITransportButton setEnabled:](self->playPauseButton, "setEnabled:", -[CAInterAppAudioTransportView canPlay](self, "canPlay"));
  -[CAUITransportButton setUserInteractionEnabled:](self->playPauseButton, "setUserInteractionEnabled:", -[CAUITransportButton isEnabled](self->playPauseButton, "isEnabled"));
  if (-[CAUITransportButton isEnabled](self->playPauseButton, "isEnabled"))
    v6 = 1.0;
  else
    v6 = 0.25;
  -[CAUITransportButton setAlpha:](self->playPauseButton, "setAlpha:", v6);
  -[CAUITransportButton setEnabled:](self->rewindButton, "setEnabled:", -[CAInterAppAudioTransportView canRewind](self, "canRewind"));
  -[CAUITransportButton setUserInteractionEnabled:](self->rewindButton, "setUserInteractionEnabled:", -[CAUITransportButton isEnabled](self->rewindButton, "isEnabled"));
  if (-[CAUITransportButton isEnabled](self->rewindButton, "isEnabled"))
    v7 = 1.0;
  else
    v7 = 0.25;
  -[CAUITransportButton setAlpha:](self->rewindButton, "setAlpha:", v7);
  -[UILabel setEnabled:](self->currentTimeLabel, "setEnabled:", -[CAInterAppAudioTransportView canPlay](self, "canPlay"));
  v8 = -[UILabel isEnabled](self->currentTimeLabel, "isEnabled");
  v9 = 0.5;
  if (v8)
    v9 = 1.0;
  -[UILabel setAlpha:](self->currentTimeLabel, "setAlpha:", v9);
  -[CAInterAppAudioTransportView setNeedsDisplay](self, "setNeedsDisplay");
}

- (BOOL)isPlaying
{
  return self->_playing;
}

- (BOOL)isRecording
{
  return self->_recording;
}

- (BOOL)isConnected
{
  return self->_connected;
}

- (UIFont)currentTimeLabelFont
{
  return self->_currentTimeLabelFont;
}

- (void)audioUnitPropertyChangedListener:(void *)a3 unit:(OpaqueAudioComponentInstance *)a4 propID:(unsigned int)a5 scope:(unsigned int)a6 element:(unsigned int)a7
{
  if (a5 == 2013)
  {
    -[CAInterAppAudioTransportView updateStatefromTransportCallBack](self, "updateStatefromTransportCallBack", a3, a4, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7);
    -[CAInterAppAudioTransportView performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_updateTransportControls, 0, 0);
  }
  else if (a5 == 101)
  {
    -[CAInterAppAudioTransportView isHostConnected](self, "isHostConnected", a3, a4, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7);
  }
}

@end
