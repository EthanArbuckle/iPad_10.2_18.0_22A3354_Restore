@implementation AXMDataSonifier

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__AXMDataSonifier_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[AXMDataSonifier sharedInstance]::onceToken != -1)
    dispatch_once(&+[AXMDataSonifier sharedInstance]::onceToken, block);
  return (id)+[AXMDataSonifier sharedInstance]::singleton;
}

void __33__AXMDataSonifier_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)+[AXMDataSonifier sharedInstance]::singleton;
  +[AXMDataSonifier sharedInstance]::singleton = (uint64_t)v1;

}

- (AXMDataSonifier)init
{
  AXMDataSonifier *v2;
  AXMDataSonifier *v3;
  uint64_t v4;
  NSPointerArray *playbackObservers;
  AXMAudioDataSourceMixer *v6;
  AXMAudioDataSourceMixer *playbackMixerDataSource;
  AXMAudioDataSource *v8;
  AXMAudioDataSource *playbackChartDataAudioDataSource;
  AXMAudioDataSource *v10;
  AXMAudioDataSource *playbackTrendlineAudioDataSource;
  AXMAudioDataSourceMixer *v12;
  AXMAudioDataSourceMixer *scrubbingMixerDataSource;
  AXMAudioDataSource *v14;
  AXMAudioDataSource *scrubbingDiscreteAudioDataSource;
  AXMAudioDataSource *v16;
  AXMAudioDataSource *scrubbingContinuousAudioDataSource;
  AXMAudioDataSource *v18;
  AXMAudioDataSource *scrubbingTrendlineAudioDataSource;
  AXMAudioDataSourceMixer *v20;
  AXMAudioDataSourceMixer *liveContinuousMixerDataSource;
  AXMAudioDataSource *v22;
  AXMAudioDataSource *liveContinuousAudioDataSource;
  _QWORD *v24;
  std::vector<int> *v25;
  std::vector<int> *v26;
  NSMutableOrderedSet *v27;
  NSMutableOrderedSet *dataCategories;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)AXMDataSonifier;
  v2 = -[AXMDataSonifier init](&v30, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_OWORD *)&v2->_minimumPlaybackFrequency = xmmword_1B0EFFE40;
    v2->_usesBinauralPanning = 1;
    objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
    v4 = objc_claimAutoreleasedReturnValue();
    playbackObservers = v3->_playbackObservers;
    v3->_playbackObservers = (NSPointerArray *)v4;

    v6 = -[AXMAudioDataSourceMixer initWithName:sampleRate:circular:]([AXMAudioDataSourceMixer alloc], "initWithName:sampleRate:circular:", CFSTR("PlaybackMixer"), 0, 44100.0);
    playbackMixerDataSource = v3->_playbackMixerDataSource;
    v3->_playbackMixerDataSource = v6;

    v8 = -[AXMAudioDataSource initWithName:sampleRate:circular:]([AXMAudioDataSource alloc], "initWithName:sampleRate:circular:", CFSTR("PlaybackChartData"), 0, 44100.0);
    playbackChartDataAudioDataSource = v3->_playbackChartDataAudioDataSource;
    v3->_playbackChartDataAudioDataSource = v8;

    v10 = -[AXMAudioDataSource initWithName:sampleRate:circular:]([AXMAudioDataSource alloc], "initWithName:sampleRate:circular:", CFSTR("PlaybackTrendline"), 0, 44100.0);
    playbackTrendlineAudioDataSource = v3->_playbackTrendlineAudioDataSource;
    v3->_playbackTrendlineAudioDataSource = v10;

    -[AXMAudioDataSourceMixer addDataSource:](v3->_playbackMixerDataSource, "addDataSource:", v3->_playbackChartDataAudioDataSource);
    v12 = -[AXMAudioDataSourceMixer initWithName:sampleRate:circular:]([AXMAudioDataSourceMixer alloc], "initWithName:sampleRate:circular:", CFSTR("ScrubbingMixer"), 1, 44100.0);
    scrubbingMixerDataSource = v3->_scrubbingMixerDataSource;
    v3->_scrubbingMixerDataSource = v12;

    v14 = -[AXMAudioDataSource initWithName:sampleRate:circular:]([AXMAudioDataSource alloc], "initWithName:sampleRate:circular:", CFSTR("ScrubbingDiscreteData"), 1, 44100.0);
    scrubbingDiscreteAudioDataSource = v3->_scrubbingDiscreteAudioDataSource;
    v3->_scrubbingDiscreteAudioDataSource = v14;

    v16 = -[AXMAudioDataSource initWithName:sampleRate:circular:]([AXMAudioDataSource alloc], "initWithName:sampleRate:circular:", CFSTR("ScrubbingContinuousData"), 1, 44100.0);
    scrubbingContinuousAudioDataSource = v3->_scrubbingContinuousAudioDataSource;
    v3->_scrubbingContinuousAudioDataSource = v16;

    v18 = -[AXMAudioDataSource initWithName:sampleRate:circular:]([AXMAudioDataSource alloc], "initWithName:sampleRate:circular:", CFSTR("ScrubbingTrendline"), 1, 44100.0);
    scrubbingTrendlineAudioDataSource = v3->_scrubbingTrendlineAudioDataSource;
    v3->_scrubbingTrendlineAudioDataSource = v18;

    -[AXMAudioDataSourceMixer addDataSource:](v3->_scrubbingMixerDataSource, "addDataSource:", v3->_scrubbingContinuousAudioDataSource);
    v20 = -[AXMAudioDataSourceMixer initWithName:sampleRate:circular:]([AXMAudioDataSourceMixer alloc], "initWithName:sampleRate:circular:", CFSTR("LiveToneMixer"), 1, 44100.0);
    liveContinuousMixerDataSource = v3->_liveContinuousMixerDataSource;
    v3->_liveContinuousMixerDataSource = v20;

    v22 = -[AXMAudioDataSource initWithName:sampleRate:circular:]([AXMAudioDataSource alloc], "initWithName:sampleRate:circular:", CFSTR("LiveContinuousData"), 1, 44100.0);
    liveContinuousAudioDataSource = v3->_liveContinuousAudioDataSource;
    v3->_liveContinuousAudioDataSource = v22;

    -[AXMAudioDataSourceMixer addDataSource:](v3->_liveContinuousMixerDataSource, "addDataSource:", v3->_liveContinuousAudioDataSource);
    v24 = (_QWORD *)operator new();
    *v24 = 0;
    v24[1] = 0;
    v24[2] = 0;
    v3->_scrubbingDiscreteDataRenderingContext = v24;
    v25 = (std::vector<int> *)operator new();
    v25->__begin_ = 0;
    v25->__end_ = 0;
    v25->__end_cap_.__value_ = 0;
    v3->_scrubbingPlaybackCallbackRenderingContext = v25;
    std::vector<int>::resize(v25, 0x400uLL);
    v26 = (std::vector<int> *)operator new();
    v26->__begin_ = 0;
    v26->__end_ = 0;
    v26->__end_cap_.__value_ = 0;
    v3->_liveTonePlaybackCallbackRenderingContext = v26;
    std::vector<int>::resize(v26, 0x400uLL);
    v3->_currentSeriesIndex = 0;
    v27 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    dataCategories = v3->_dataCategories;
    v3->_dataCategories = v27;

    v3->_minimumDiscreteToneLength = 0.1;
    *(_OWORD *)&v3->_maximumDiscreteToneLength = xmmword_1B0EFFE50;
    v3->_maximumToneVolume = 1.0;
    -[AXMDataSonifier _initializeAudioChain](v3, "_initializeAudioChain");
  }
  return v3;
}

- (void)dealloc
{
  void **scrubbingDiscreteDataRenderingContext;
  void *v4;
  void **scrubbingPlaybackCallbackRenderingContext;
  void *v6;
  void **liveTonePlaybackCallbackRenderingContext;
  void *v8;
  objc_super v9;

  scrubbingDiscreteDataRenderingContext = (void **)self->_scrubbingDiscreteDataRenderingContext;
  if (scrubbingDiscreteDataRenderingContext)
  {
    v4 = *scrubbingDiscreteDataRenderingContext;
    if (*scrubbingDiscreteDataRenderingContext)
    {
      scrubbingDiscreteDataRenderingContext[1] = v4;
      operator delete(v4);
    }
    MEMORY[0x1B5E1250C](scrubbingDiscreteDataRenderingContext, 0x10C402FEFCB83);
  }
  scrubbingPlaybackCallbackRenderingContext = (void **)self->_scrubbingPlaybackCallbackRenderingContext;
  if (scrubbingPlaybackCallbackRenderingContext)
  {
    v6 = *scrubbingPlaybackCallbackRenderingContext;
    if (*scrubbingPlaybackCallbackRenderingContext)
    {
      scrubbingPlaybackCallbackRenderingContext[1] = v6;
      operator delete(v6);
    }
    MEMORY[0x1B5E1250C](scrubbingPlaybackCallbackRenderingContext, 0x10C402FEFCB83);
  }
  liveTonePlaybackCallbackRenderingContext = (void **)self->_liveTonePlaybackCallbackRenderingContext;
  if (liveTonePlaybackCallbackRenderingContext)
  {
    v8 = *liveTonePlaybackCallbackRenderingContext;
    if (*liveTonePlaybackCallbackRenderingContext)
    {
      liveTonePlaybackCallbackRenderingContext[1] = v8;
      operator delete(v8);
    }
    MEMORY[0x1B5E1250C](liveTonePlaybackCallbackRenderingContext, 0x10C402FEFCB83);
  }
  v9.receiver = self;
  v9.super_class = (Class)AXMDataSonifier;
  -[AXMDataSonifier dealloc](&v9, sel_dealloc);
}

- (void)_initializeAXMAudioDataSources
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  uint64_t v13;

  -[AXMDataSonifier stopPlaying](self, "stopPlaying");
  -[AXMDataSonifier playbackDuration](self, "playbackDuration");
  self->_playbackSampleCount = (unint64_t)((v3 + 200.0) * 44100.0 / 1000.0);
  -[AXMDataSonifier playbackMixerDataSource](self, "playbackMixerDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLength:", -[AXMDataSonifier playbackSampleCount](self, "playbackSampleCount"));

  -[AXMDataSonifier playbackChartDataAudioDataSource](self, "playbackChartDataAudioDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLength:", -[AXMDataSonifier playbackSampleCount](self, "playbackSampleCount"));

  -[AXMDataSonifier playbackTrendlineAudioDataSource](self, "playbackTrendlineAudioDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLength:", -[AXMDataSonifier playbackSampleCount](self, "playbackSampleCount"));

  -[AXMDataSonifier scrubbingMixerDataSource](self, "scrubbingMixerDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLength:", 88200);

  -[AXMDataSonifier scrubbingDiscreteAudioDataSource](self, "scrubbingDiscreteAudioDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLength:", 88200);

  -[AXMDataSonifier scrubbingContinuousAudioDataSource](self, "scrubbingContinuousAudioDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLength:", 88200);

  -[AXMDataSonifier scrubbingTrendlineAudioDataSource](self, "scrubbingTrendlineAudioDataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLength:", 88200);

  v11 = -[AXMDataSonifier scrubbingDiscreteDataRenderingContext](self, "scrubbingDiscreteDataRenderingContext");
  v11[1] = *v11;
  std::vector<int>::resize((std::vector<int> *)-[AXMDataSonifier scrubbingDiscreteDataRenderingContext](self, "scrubbingDiscreteDataRenderingContext"), 0x15888uLL);
  v12 = *(void **)-[AXMDataSonifier scrubbingDiscreteDataRenderingContext](self, "scrubbingDiscreteDataRenderingContext");
  v13 = *(_QWORD *)(-[AXMDataSonifier scrubbingDiscreteDataRenderingContext](self, "scrubbingDiscreteDataRenderingContext")+ 8)- (_QWORD)v12;
  if (v13 >= 1)
    bzero(v12, 4 * (((unint64_t)v13 >> 2) - ((unint64_t)v13 > 3)) + 4);
}

- (void)_initializeLiveToneDataSource
{
  id v3;
  id v4;

  -[AXMDataSonifier stopPlaying](self, "stopPlaying");
  -[AXMDataSonifier liveContinuousMixerDataSource](self, "liveContinuousMixerDataSource");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLength:", 88200);

  -[AXMDataSonifier liveContinuousAudioDataSource](self, "liveContinuousAudioDataSource");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLength:", 88200);

}

- (double)currentPlaybackPosition
{
  void *v3;
  double v4;
  double v5;

  -[AXMDataSonifier currentSeries](self, "currentSeries");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isContinuous"))
    -[AXMDataSonifier currentContinuousPlaybackPosition](self, "currentContinuousPlaybackPosition");
  else
    -[AXMDataSonifier currentDiscretePlaybackPosition](self, "currentDiscretePlaybackPosition");
  v5 = v4;

  return v5;
}

- (double)currentDiscretePlaybackPosition
{
  void *v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;
  double v7;
  void *v8;

  -[AXMDataSonifier playbackMixerDataSource](self, "playbackMixerDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  -[AXMDataSonifier playbackMixerDataSource](self, "playbackMixerDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "currentSampleIndex");

  v7 = 0.0;
  if (v4 && v6 <= v4)
  {
    -[AXMDataSonifier playbackMixerDataSource](self, "playbackMixerDataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (double)(unint64_t)objc_msgSend(v8, "currentSampleIndex") / (double)v4;

  }
  return v7;
}

- (double)currentContinuousPlaybackPosition
{
  double currentPlaybackTime;
  double audiographPlaybackDuration;
  BOOL v4;
  double result;

  currentPlaybackTime = self->_currentPlaybackTime;
  audiographPlaybackDuration = self->audiographPlaybackDuration;
  v4 = audiographPlaybackDuration <= 0.0 || currentPlaybackTime > audiographPlaybackDuration;
  result = currentPlaybackTime / audiographPlaybackDuration;
  if (v4)
    return 0.0;
  return result;
}

- (void)setMasterVolume:(double)a3
{
  double v4;
  double v5;
  id v6;
  id v7;
  id v8;
  id v9;

  if (a3 > 1.0)
    a3 = 1.0;
  v4 = fmax(a3, 0.0);
  -[AXMDataSonifier playbackMixerDataSource](self, "playbackMixerDataSource");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLevel:", v4);

  -[AXMDataSonifier scrubbingMixerDataSource](self, "scrubbingMixerDataSource");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLevel:", v4);

  -[AXMDataSonifier liveContinuousMixerDataSource](self, "liveContinuousMixerDataSource");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLevel:", v4);

  -[AXMDataSonifier player](self, "player");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = v4;
  LODWORD(v5) = LODWORD(v4);
  objc_msgSend(v9, "setVolume:", v5);

}

- (double)masterVolume
{
  void *v2;
  double v3;
  double v4;

  -[AXMDataSonifier playbackMixerDataSource](self, "playbackMixerDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "level");
  v4 = v3;

  return v4;
}

- (void)setMasterVolume:(double)a3 fadeDuration:(double)a4
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];

  -[AXMDataSonifier setMasterVolume:fadeDuration:]::fadeDuration = *(_QWORD *)&a4;
  -[AXMDataSonifier setMasterVolume:fadeDuration:]::fadeStart = CFAbsoluteTimeGetCurrent();
  -[AXMDataSonifier masterVolume](self, "masterVolume");
  -[AXMDataSonifier setMasterVolume:fadeDuration:]::startVolume = v6;
  -[AXMDataSonifier setMasterVolume:fadeDuration:]::targetVolume = *(_QWORD *)&a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__AXMDataSonifier_setMasterVolume_fadeDuration___block_invoke;
  v9[3] = &unk_1E625E7E0;
  v9[4] = self;
  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:repeats:block:", 1, v9, 0.0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)-[AXMDataSonifier setMasterVolume:fadeDuration:]::fadeTimer;
  -[AXMDataSonifier setMasterVolume:fadeDuration:]::fadeTimer = v7;

}

void __48__AXMDataSonifier_setMasterVolume_fadeDuration___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;

  v2 = (CFAbsoluteTimeGetCurrent() - *(double *)&-[AXMDataSonifier setMasterVolume:fadeDuration:]::fadeStart)
     / *(double *)&-[AXMDataSonifier setMasterVolume:fadeDuration:]::fadeDuration;
  if (v2 < 1.0)
    v2 = 1.0;
  v3 = *(double *)&-[AXMDataSonifier setMasterVolume:fadeDuration:]::startVolume
     + (*(double *)&-[AXMDataSonifier setMasterVolume:fadeDuration:]::targetVolume
      - *(double *)&-[AXMDataSonifier setMasterVolume:fadeDuration:]::startVolume)
     * v2;
  objc_msgSend(*(id *)(a1 + 32), "setMasterVolume:", v3);
  if (v3 == *(double *)&-[AXMDataSonifier setMasterVolume:fadeDuration:]::targetVolume)
  {
    objc_msgSend((id)-[AXMDataSonifier setMasterVolume:fadeDuration:]::fadeTimer, "invalidate");
    v4 = (void *)-[AXMDataSonifier setMasterVolume:fadeDuration:]::fadeTimer;
    -[AXMDataSonifier setMasterVolume:fadeDuration:]::fadeTimer = 0;

  }
}

- (void)play
{
  AVAudioEngine *engine;
  BOOL v4;
  id v5;
  BOOL v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t j;
  uint64_t v23;
  void *v24;
  id v25;
  _QWORD v26[5];
  _QWORD block[6];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[6];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[16];
  id v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (!-[AXMDataSonifier isPlaying](self, "isPlaying"))
  {
    -[AXMDataSonifier _initializeAudioChain](self, "_initializeAudioChain");
    self->_playing = 1;
    engine = self->_engine;
    v38 = 0;
    v4 = -[AVAudioEngine startAndReturnError:](engine, "startAndReturnError:", &v38);
    v5 = v38;
    if (v5)
      v6 = 0;
    else
      v6 = v4;
    if (!v6)
    {
      AXMediaLogCommon();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B0E3B000, v7, OS_LOG_TYPE_DEFAULT, "failed to start audio engine", buf, 2u);
      }

      if (v5)
      {
        AXMediaLogCommon();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B0E3B000, v8, OS_LOG_TYPE_DEFAULT, "failed to render audio buffer", buf, 2u);
        }

      }
    }
    -[AXMDataSonifier currentSeries](self, "currentSeries");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isContinuous"))
    {
      v10 = -[AXMDataSonifier playAudioPlayer](self, "playAudioPlayer");

      if (v10)
        -[AXMDataSonifier beginContinuousPlayback](self, "beginContinuousPlayback");
    }
    else
    {

    }
    if (-[AXMDataSonifier isPaused](self, "isPaused"))
    {
      v31 = 0uLL;
      v29 = 0uLL;
      v30 = 0uLL;
      v28 = 0uLL;
      -[AXMDataSonifier playbackObservers](self, "playbackObservers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "allObjects");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v39, 16);
      if (v13)
      {
        v25 = v5;
        v14 = *(_QWORD *)v29;
        v15 = MEMORY[0x1E0C80D38];
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v29 != v14)
              objc_enumerationMutation(v12);
            v17 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              block[0] = MEMORY[0x1E0C809B0];
              block[1] = 3221225472;
              block[2] = __23__AXMDataSonifier_play__block_invoke_2;
              block[3] = &unk_1E625E808;
              block[4] = v17;
              block[5] = self;
              dispatch_async(v15, block);
              self->_paused = 0;
            }
          }
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v39, 16);
        }
        while (v13);
LABEL_36:
        v5 = v25;
      }
    }
    else
    {
      v35 = 0uLL;
      v36 = 0uLL;
      v33 = 0uLL;
      v34 = 0uLL;
      -[AXMDataSonifier playbackObservers](self, "playbackObservers");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "allObjects");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
      if (v19)
      {
        v25 = v5;
        v20 = *(_QWORD *)v34;
        v21 = MEMORY[0x1E0C80D38];
        do
        {
          for (j = 0; j != v19; ++j)
          {
            if (*(_QWORD *)v34 != v20)
              objc_enumerationMutation(v12);
            v23 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j);
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              v32[0] = MEMORY[0x1E0C809B0];
              v32[1] = 3221225472;
              v32[2] = __23__AXMDataSonifier_play__block_invoke;
              v32[3] = &unk_1E625E808;
              v32[4] = v23;
              v32[5] = self;
              dispatch_async(v21, v32);
            }
          }
          v19 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
        }
        while (v19);
        goto LABEL_36;
      }
    }

    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __23__AXMDataSonifier_play__block_invoke_3;
    v26[3] = &unk_1E625E7E0;
    v26[4] = self;
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:repeats:block:", 1, v26, 0.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMDataSonifier setPlaybackObserverUpdateTimer:](self, "setPlaybackObserverUpdateTimer:", v24);

  }
}

uint64_t __23__AXMDataSonifier_play__block_invoke(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "currentPlaybackPosition");
  return objc_msgSend(v1, "dataSonifierPlaybackDidBeginAtPosition:");
}

uint64_t __23__AXMDataSonifier_play__block_invoke_2(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "currentPlaybackPosition");
  return objc_msgSend(v1, "dataSonifierPlaybackDidResumeAtPosition:");
}

void __23__AXMDataSonifier_play__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[6];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "playbackObservers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v12;
    v6 = MEMORY[0x1E0C80D38];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v10[0] = MEMORY[0x1E0C809B0];
          v10[1] = 3221225472;
          v10[2] = __23__AXMDataSonifier_play__block_invoke_4;
          v10[3] = &unk_1E625E808;
          v9 = *(_QWORD *)(a1 + 32);
          v10[4] = v8;
          v10[5] = v9;
          dispatch_async(v6, v10);
        }
        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

}

uint64_t __23__AXMDataSonifier_play__block_invoke_4(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "currentPlaybackPosition");
  return objc_msgSend(v1, "dataSonifierPlaybackProgressDidChange:");
}

- (void)pause
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[6];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[AVAudioEngine pause](self->_engine, "pause");
  *(_WORD *)&self->_playing = 256;
  -[AXMDataSonifier playbackObserverUpdateTimer](self, "playbackObserverUpdateTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[AXMDataSonifier keyPitchUpdateTimer](self, "keyPitchUpdateTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[AXMDataSonifier playbackObservers](self, "playbackObservers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    v9 = MEMORY[0x1E0C80D38];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v12[0] = MEMORY[0x1E0C809B0];
          v12[1] = 3221225472;
          v12[2] = __24__AXMDataSonifier_pause__block_invoke;
          v12[3] = &unk_1E625E808;
          v12[4] = v11;
          v12[5] = self;
          dispatch_async(v9, v12);
        }
        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

uint64_t __24__AXMDataSonifier_pause__block_invoke(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "currentPlaybackPosition");
  return objc_msgSend(v1, "dataSonifierPlaybackDidPauseAtPosition:");
}

- (void)stopPlaying
{
  _BOOL4 playing;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t i;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint8_t v13[16];
  _QWORD block[6];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[AVAudioEngine stop](self->_engine, "stop");
  -[AVAudioPlayerNode stop](self->_player, "stop");
  playing = self->_playing;
  *(_WORD *)&self->_playing = 0;
  if (playing)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[AXMDataSonifier playbackObservers](self, "playbackObservers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v16;
      v8 = MEMORY[0x1E0C80D38];
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v16 != v7)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __30__AXMDataSonifier_stopPlaying__block_invoke;
            block[3] = &unk_1E625E808;
            block[4] = v10;
            block[5] = self;
            dispatch_async(v8, block);
          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v6);
    }

    -[AXMDataSonifier playbackObserverUpdateTimer](self, "playbackObserverUpdateTimer");
    v11 = objc_claimAutoreleasedReturnValue();
    -[NSObject invalidate](v11, "invalidate");
  }
  else
  {
    AXMediaLogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1B0E3B000, v11, OS_LOG_TYPE_DEFAULT, "Error stopping audio playback", v13, 2u);
    }
  }

  -[AXMDataSonifier playbackMixerDataSource](self, "playbackMixerDataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCurrentSampleIndex:", 0);

}

uint64_t __30__AXMDataSonifier_stopPlaying__block_invoke(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "currentPlaybackPosition");
  return objc_msgSend(v1, "dataSonifierPlaybackDidEndAtPosition:");
}

- (void)beginContinuousPlayback
{
  AVAudioUnitTimePitch *pitchShifter;
  double v4;
  CFTimeInterval v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  NSTimer *v10;
  NSTimer *keyPitchUpdateTimer;
  _QWORD v12[7];
  id v13[3];
  _QWORD v14[4];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  id location;

  if (-[NSArray count](self->_keyPitches, "count"))
  {
    objc_initWeak(&location, self);
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__8;
    v25 = __Block_byref_object_dispose__8;
    v26 = (id)-[NSArray mutableCopy](self->_keyPitches, "mutableCopy");
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__8;
    v19 = __Block_byref_object_dispose__8;
    objc_msgSend((id)v22[5], "firstObject");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x2020000000;
    v14[3] = 0;
    pitchShifter = self->_pitchShifter;
    objc_msgSend((id)v16[5], "frequency");
    -[AXMDataSonifier _centsForFrequency:](self, "_centsForFrequency:");
    *(float *)&v4 = v4;
    -[AVAudioUnitTimePitch setPitch:](pitchShifter, "setPitch:", v4);
    v5 = CACurrentMediaTime();
    -[NSArray lastObject](self->_keyPitches, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeOffsetMS");
    v8 = v7 / 1000.0;

    v9 = (void *)MEMORY[0x1E0C99E88];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __42__AXMDataSonifier_beginContinuousPlayback__block_invoke;
    v12[3] = &unk_1E625E830;
    v12[4] = &v21;
    objc_copyWeak(v13, &location);
    v13[1] = *(id *)&v5;
    v13[2] = *(id *)&v8;
    v12[5] = &v15;
    v12[6] = v14;
    objc_msgSend(v9, "scheduledTimerWithTimeInterval:repeats:block:", 1, v12, 0.0);
    v10 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    keyPitchUpdateTimer = self->_keyPitchUpdateTimer;
    self->_keyPitchUpdateTimer = v10;

    objc_destroyWeak(v13);
    _Block_object_dispose(v14, 8);
    _Block_object_dispose(&v15, 8);

    _Block_object_dispose(&v21, 8);
    objc_destroyWeak(&location);
  }
  else
  {
    -[AXMDataSonifier stopPlaying](self, "stopPlaying");
  }
}

void __42__AXMDataSonifier_beginContinuousPlayback__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  id WeakRetained;
  id v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t i;
  void *v21;
  _BOOL4 v22;
  id v23;
  int v24;
  float v25;
  float v26;
  id v27;
  double v28;
  id v29;
  double v30;
  double v31;
  double v32;
  _BOOL4 v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  double v39;
  double v40;
  id v41;
  void *v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  double v49;
  id v50;
  void *v51;
  double v52;
  double v53;
  id v54;
  id v55;
  void *v56;
  double v57;
  double v58;
  id v59;
  id v60;
  void *v61;
  uint64_t v62;
  float v63;
  double v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "count"))
  {
    v4 = CACurrentMediaTime() - *(double *)(a1 + 64);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "setCurrentPlaybackTime:", v4);

    v6 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v6, "currentPlaybackTime");
    v8 = v7;
    v9 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v9, "playbackMixerDataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCurrentSampleIndex:", (unint64_t)v8);

    v11 = *(double *)(a1 + 72);
    objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "currentRoute");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "outputs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v15 = v14;
    v16 = 0;
    v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v66;
      v19 = (void *)*MEMORY[0x1E0C89840];
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v66 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * i), "portType", (_QWORD)v65);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v21 == v19;

          v16 |= v22;
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
      }
      while (v17);
    }

    v23 = objc_loadWeakRetained((id *)(a1 + 56));
    v24 = objc_msgSend(v23, "usesBinauralPanning");

    if ((v24 & v16) != 0)
    {
      v25 = v4 / v11 * 2.0 + -1.0;
      v26 = v25;
    }
    else
    {
      v26 = 0.0;
    }
    v27 = objc_loadWeakRetained((id *)(a1 + 56));
    *(float *)&v28 = v26;
    objc_msgSend(v27, "_setPanning:", v28);

    v29 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v29, "currentPlaybackTime");
    v31 = v30;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "timeOffsetMS");
    v33 = v31 > v32 / 1000.0;

    v34 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    if (v33)
    {
      objc_msgSend(v34, "removeObjectAtIndex:", 0);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "firstObject");
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v37 = *(void **)(v36 + 40);
      *(_QWORD *)(v36 + 40) = v35;

      v38 = objc_loadWeakRetained((id *)(a1 + 56));
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "frequency");
      objc_msgSend(v38, "_centsForFrequency:");
      v40 = v39;

      v41 = objc_loadWeakRetained((id *)(a1 + 56));
      objc_msgSend(v41, "pitchShifter");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v43 = v40;
      objc_msgSend(v42, "setPitch:", v43);

      if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "count") >= 2)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectAtIndexedSubscript:", 1);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "timeOffsetMS");
        v46 = v45;
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectAtIndexedSubscript:", 0);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "timeOffsetMS");
        v49 = v48;

        v50 = objc_loadWeakRetained((id *)(a1 + 56));
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectAtIndexedSubscript:", 1);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "frequency");
        objc_msgSend(v50, "_centsForFrequency:");
        v53 = v52;

        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (v53 - v40) / (v46 - v49);
      }
    }
    else if ((unint64_t)objc_msgSend(v34, "count") >= 2)
    {
      v55 = objc_loadWeakRetained((id *)(a1 + 56));
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectAtIndexedSubscript:", 1);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "frequency");
      objc_msgSend(v55, "_centsForFrequency:");
      v58 = v57;

      v59 = objc_loadWeakRetained((id *)(a1 + 56));
      LODWORD(v56) = objc_msgSend(v59, "shouldIncrementToPitch:by:", v58, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));

      if ((_DWORD)v56)
      {
        v60 = objc_loadWeakRetained((id *)(a1 + 56));
        objc_msgSend(v60, "pitchShifter");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        objc_msgSend(v61, "pitch");
        v64 = *(double *)(v62 + 24) + v63;
        *(float *)&v64 = v64;
        objc_msgSend(v61, "setPitch:", v64);

      }
    }

  }
  else
  {
    objc_msgSend(v3, "invalidate");
    v54 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v54, "stopPlaying");

  }
}

- (void)setPlaybackDuration:(double)a3
{
  self->_userDefinedPlaybackDuration = a3;
  -[AXMDataSonifier _regenerateTimeEncodingValuesForDataPoints](self, "_regenerateTimeEncodingValuesForDataPoints");
}

- (double)playbackDuration
{
  double userDefinedPlaybackDuration;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  void *v10;

  userDefinedPlaybackDuration = self->_userDefinedPlaybackDuration;
  if (userDefinedPlaybackDuration <= 0.0)
  {
    -[AXMDataSonifier currentChartDescriptor](self, "currentChartDescriptor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "xAxis");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[AXMDataSonifier currentSeries](self, "currentSeries");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isCategoricalAxis");
    if (v6)
      v8 = v7;
    else
      v8 = 0;
    if (v8 == 1)
    {
      objc_msgSend(v6, "dataPoints");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      userDefinedPlaybackDuration = 10000.0;
      if ((double)(unint64_t)objc_msgSend(v9, "count") * 800.0 <= 10000.0)
      {
        objc_msgSend(v6, "dataPoints");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        userDefinedPlaybackDuration = (double)(unint64_t)objc_msgSend(v10, "count") * 800.0;

      }
    }
    else
    {
      userDefinedPlaybackDuration = 10000.0;
    }

  }
  return userDefinedPlaybackDuration;
}

- (void)addPlaybackObserver:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[AXMDataSonifier playbackObservers](self, "playbackObservers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addPointer:", v5);

}

- (void)removePlaybackObserver:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  -[AXMDataSonifier playbackObservers](self, "playbackObservers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v8);

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[AXMDataSonifier playbackObservers](self, "playbackObservers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removePointerAtIndex:", v6);

  }
}

- (void)setPlaybackPosition:(double)a3
{
  id v5;

  -[AXMDataSonifier currentSeries](self, "currentSeries");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isContinuous"))
    -[AXMDataSonifier setContinuousPlaybackPosition:](self, "setContinuousPlaybackPosition:", a3);
  else
    -[AXMDataSonifier setDiscretePlaybackPosition:](self, "setDiscretePlaybackPosition:", a3);

}

- (void)setDiscretePlaybackPosition:(double)a3
{
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t i;
  uint64_t v16;
  _QWORD v17[6];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a3 >= 0.0 && a3 <= 1.0)
  {
    -[AXMDataSonifier playbackMixerDataSource](self, "playbackMixerDataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (unint64_t)((double)(unint64_t)objc_msgSend(v6, "length") * a3);

    if (-[AXMDataSonifier isScrubbing](self, "isScrubbing"))
    {
      -[AXMDataSonifier scrubToPlaybackFrame:](self, "scrubToPlaybackFrame:", v7);
    }
    else
    {
      -[AXMDataSonifier playbackMixerDataSource](self, "playbackMixerDataSource");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setCurrentSampleIndex:", v7);

      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      -[AXMDataSonifier playbackObservers](self, "playbackObservers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "allObjects");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v19;
        v13 = MEMORY[0x1E0C809B0];
        v14 = MEMORY[0x1E0C80D38];
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v19 != v12)
              objc_enumerationMutation(v10);
            v16 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              v17[0] = v13;
              v17[1] = 3221225472;
              v17[2] = __47__AXMDataSonifier_setDiscretePlaybackPosition___block_invoke;
              v17[3] = &unk_1E625E858;
              v17[4] = v16;
              *(double *)&v17[5] = a3;
              dispatch_async(v14, v17);
            }
          }
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v11);
      }

    }
  }
}

uint64_t __47__AXMDataSonifier_setDiscretePlaybackPosition___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dataSonifierPlaybackProgressDidChange:", *(double *)(a1 + 40));
}

- (void)setContinuousPlaybackPosition:(double)a3
{
  double v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t i;
  uint64_t v15;
  _QWORD v16[6];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a3 >= 0.0 && a3 <= 1.0)
  {
    v6 = self->audiographPlaybackDuration * a3;
    if (-[AXMDataSonifier isScrubbing](self, "isScrubbing"))
    {
      -[AXMDataSonifier playFrequencyAtTime:](self, "playFrequencyAtTime:", v6);
    }
    else
    {
      -[AXMDataSonifier playbackMixerDataSource](self, "playbackMixerDataSource");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setCurrentSampleIndex:", (unint64_t)v6);

      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      -[AXMDataSonifier playbackObservers](self, "playbackObservers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "allObjects");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v18;
        v12 = MEMORY[0x1E0C809B0];
        v13 = MEMORY[0x1E0C80D38];
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v18 != v11)
              objc_enumerationMutation(v9);
            v15 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              v16[0] = v12;
              v16[1] = 3221225472;
              v16[2] = __49__AXMDataSonifier_setContinuousPlaybackPosition___block_invoke;
              v16[3] = &unk_1E625E858;
              v16[4] = v15;
              *(double *)&v16[5] = a3;
              dispatch_async(v13, v16);
            }
          }
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v10);
      }

    }
  }
}

uint64_t __49__AXMDataSonifier_setContinuousPlaybackPosition___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dataSonifierPlaybackProgressDidChange:", *(double *)(a1 + 40));
}

- (void)beginScrubbing
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  AXMLiveContinuousSynth *v9;
  id v10;
  AXMLiveContinuousSynth *v11;
  AXMLiveContinuousSynth *continuousScrubbingTone;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  AXMLiveContinuousSynth *v17;
  id v18;
  AXMLiveContinuousSynth *v19;
  AXMLiveContinuousSynth *trendlineScrubbingTone;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[6];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[AXMDataSonifier trendlineFunction](self, "trendlineFunction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXMDataSonifier scrubbingDiscreteAudioDataSource](self, "scrubbingDiscreteAudioDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLevel:", dbl_1B0EFFE60[v3 == 0]);

  -[AXMDataSonifier scrubbingMixerDataSource](self, "scrubbingMixerDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMDataSonifier scrubbingDiscreteAudioDataSource](self, "scrubbingDiscreteAudioDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addDataSource:", v6);
  v7 = v3 == 0;

  -[AXMDataSonifier scrubbingContinuousAudioDataSource](self, "scrubbingContinuousAudioDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLevel:", dbl_1B0EFFE70[v7]);

  v9 = [AXMLiveContinuousSynth alloc];
  v10 = -[AXMDataSonifier _newContinuousToneEnvelope](self, "_newContinuousToneEnvelope");
  v11 = -[AXMSynth initWithSampleRate:envelope:](v9, "initWithSampleRate:envelope:", v10, 44100.0);
  continuousScrubbingTone = self->_continuousScrubbingTone;
  self->_continuousScrubbingTone = v11;

  -[AXMDataSonifier scrubbingMixerDataSource](self, "scrubbingMixerDataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMDataSonifier scrubbingContinuousAudioDataSource](self, "scrubbingContinuousAudioDataSource");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addDataSource:", v14);

  -[AXMDataSonifier trendlineFunction](self, "trendlineFunction");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[AXMDataSonifier scrubbingTrendlineAudioDataSource](self, "scrubbingTrendlineAudioDataSource");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setLevel:", 0.354813389);

    v17 = [AXMLiveContinuousSynth alloc];
    v18 = -[AXMDataSonifier _newContinuousToneEnvelope](self, "_newContinuousToneEnvelope");
    v19 = -[AXMSynth initWithSampleRate:envelope:](v17, "initWithSampleRate:envelope:", v18, 44100.0);
    trendlineScrubbingTone = self->_trendlineScrubbingTone;
    self->_trendlineScrubbingTone = v19;

    -[AXMDataSonifier scrubbingMixerDataSource](self, "scrubbingMixerDataSource");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMDataSonifier scrubbingTrendlineAudioDataSource](self, "scrubbingTrendlineAudioDataSource");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addDataSource:", v22);

  }
  if (-[AXMDataSonifier isPlaying](self, "isPlaying"))
    -[AXMDataSonifier pause](self, "pause");
  if (-[AXMDataSonifier isEndingScrubbing](self, "isEndingScrubbing"))
    -[AXMDataSonifier stopScrubbing](self, "stopScrubbing");
  -[AVAudioEngine startAndReturnError:](self->_engine, "startAndReturnError:", 0);
  self->_scrubbing = 1;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[AXMDataSonifier playbackObservers](self, "playbackObservers");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "allObjects");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v25)
  {
    v26 = *(_QWORD *)v32;
    v27 = MEMORY[0x1E0C80D38];
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v32 != v26)
          objc_enumerationMutation(v24);
        v29 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v28);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v30[0] = MEMORY[0x1E0C809B0];
          v30[1] = 3221225472;
          v30[2] = __33__AXMDataSonifier_beginScrubbing__block_invoke;
          v30[3] = &unk_1E625E808;
          v30[4] = v29;
          v30[5] = self;
          dispatch_async(v27, v30);
        }
        ++v28;
      }
      while (v25 != v28);
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v25);
  }

}

uint64_t __33__AXMDataSonifier_beginScrubbing__block_invoke(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "currentPlaybackPosition");
  return objc_msgSend(v1, "dataSonifierScrubbingDidBeginAtPosition:");
}

- (id)keyPitchForTime:(double)a3
{
  int v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  int v10;
  double v11;
  id v12;

  v5 = -[NSArray count](self->_keyPitches, "count");
  if (v5 < 1)
  {
    v6 = 0;
  }
  else
  {
    v6 = 0;
    v7 = 0;
    do
    {
      if (v5 + v7 < 0 != __OFADD__(v5, v7))
        v8 = v5 + v7 + 1;
      else
        v8 = v5 + v7;
      -[NSArray objectAtIndexedSubscript:](self->_keyPitches, "objectAtIndexedSubscript:", (uint64_t)v8 >> 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "timeOffsetMS");
      v10 = v8 >> 1;
      if (v11 <= a3)
      {
        v12 = v9;

        v7 = v10 + 1;
        v6 = v12;
      }
      else
      {
        v5 = v8 >> 1;
      }

    }
    while (v7 < v5);
  }
  return v6;
}

- (void)endScrubbing
{
  void *v3;
  void *v4;
  dispatch_time_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[6];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD block[5];
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  self->_isEndingScrubbing = 1;
  -[AXMDataSonifier continuousScrubbingTone](self, "continuousScrubbingTone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startRelease");

  -[AXMDataSonifier trendlineScrubbingTone](self, "trendlineScrubbingTone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startRelease");

  v5 = dispatch_time(0, 60000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__AXMDataSonifier_endScrubbing__block_invoke;
  block[3] = &unk_1E625E880;
  block[4] = self;
  dispatch_after(v5, MEMORY[0x1E0C80D38], block);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[AXMDataSonifier playbackObservers](self, "playbackObservers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    v10 = MEMORY[0x1E0C80D38];
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v13[0] = MEMORY[0x1E0C809B0];
          v13[1] = 3221225472;
          v13[2] = __31__AXMDataSonifier_endScrubbing__block_invoke_2;
          v13[3] = &unk_1E625E808;
          v13[4] = v12;
          v13[5] = self;
          dispatch_async(v10, v13);

        }
        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v8);
  }

}

uint64_t __31__AXMDataSonifier_endScrubbing__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopScrubbing");
}

uint64_t __31__AXMDataSonifier_endScrubbing__block_invoke_2(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "currentPlaybackPosition");
  return objc_msgSend(v1, "dataSonifierScrubbingDidEndAtPosition:");
}

- (void)stopScrubbing
{
  void *v3;
  AXMLiveContinuousSynth *continuousScrubbingTone;

  -[AXMDataSonifier scrubbingMixerDataSource](self, "scrubbingMixerDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllDataSources");

  self->_scrubbing = 0;
  continuousScrubbingTone = self->_continuousScrubbingTone;
  self->_continuousScrubbingTone = 0;

  self->_isEndingScrubbing = 0;
  -[AVAudioEngine stop](self->_engine, "stop");
  -[AVAudioPlayerNode stop](self->_player, "stop");
}

- (void)playFrequencyAtTime:(double)a3
{
  AVAudioUnitTimePitch *pitchShifter;
  double v5;
  id v6;

  if (vabdd_f64(self->_currentPlaybackTime, a3) >= 0.025)
  {
    self->_currentPlaybackTime = a3;
    -[AXMDataSonifier keyPitchForTime:](self, "keyPitchForTime:");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (!-[AVAudioEngine isRunning](self->_engine, "isRunning"))
      -[AVAudioEngine startAndReturnError:](self->_engine, "startAndReturnError:", 0);
    if (!-[AVAudioPlayerNode isPlaying](self->_player, "isPlaying"))
      -[AXMDataSonifier playAudioPlayer](self, "playAudioPlayer");
    pitchShifter = self->_pitchShifter;
    objc_msgSend(v6, "frequency");
    *(float *)&v5 = v5;
    -[AVAudioUnitTimePitch setPitch:](pitchShifter, "setPitch:", v5);

  }
}

- (BOOL)playAudioPlayer
{
  -[AVAudioPlayerNode scheduleBuffer:atTime:options:completionHandler:](self->_player, "scheduleBuffer:atTime:options:completionHandler:", self->buffer, 0, 1, 0);
  -[AVAudioPlayerNode play](self->_player, "play");
  return 1;
}

- (void)scrubToPlaybackFrame:(unint64_t)a3
{
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  double v15;
  double v16;
  id v17;
  void *v18;
  unint64_t v19;
  void *v20;
  unint64_t v21;
  double v22;
  double v23;
  unint64_t v24;
  double v25;
  void *v26;
  BOOL v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void **v34;
  AXMADSREnvelope *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  AXMADSREnvelope *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  AXMSinglePitchSynth *v52;
  double v53;
  double v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  double v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  _DWORD *v66;
  void *v67;
  BOOL v68;
  void *v69;
  unint64_t v70;
  void *v71;
  void *v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double (**v78)(double);
  double v79;
  double v80;
  double v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t j;
  uint64_t v88;
  void *v89;
  unint64_t v90;
  void *v91;
  unint64_t v92;
  double v93;
  double v94;
  unint64_t v95;
  id obj;
  uint64_t v98;
  uint64_t v99;
  uint64_t i;
  id v101;
  id v102;
  _QWORD block[6];
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  _BYTE v116[128];
  _BYTE v117[128];
  _BYTE v118[128];
  _QWORD v119[3];

  v119[1] = *MEMORY[0x1E0C80C00];
  -[AXMDataSonifier playbackMixerDataSource](self, "playbackMixerDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = objc_msgSend(v4, "currentSampleIndex");

  v5 = -[AXMDataSonifier currentSeriesIndex](self, "currentSeriesIndex") == 0;
  -[AXMDataSonifier currentChartDescriptor](self, "currentChartDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "series");
  if (v5)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", -[AXMDataSonifier currentSeriesIndex](self, "currentSeriesIndex") - 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v119[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v119, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v114 = 0u;
  v115 = 0u;
  v112 = 0u;
  v113 = 0u;
  obj = v9;
  v99 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v112, v118, 16);
  if (v99)
  {
    v98 = *(_QWORD *)v113;
    v10 = (double)a3;
    v94 = 1000.0;
    v93 = 0.01;
    do
    {
      for (i = 0; i != v99; ++i)
      {
        if (*(_QWORD *)v113 != v98)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * i);
        if ((objc_msgSend(v11, "isContinuous", *(_QWORD *)&v93, *(_QWORD *)&v94) & 1) != 0)
        {
          -[AXMDataSonifier playbackMixerDataSource](self, "playbackMixerDataSource");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "length");

          if (-[AXMDataSonifier series:hasContinuousPitchDataForTimePosition:](self, "series:hasContinuousPitchDataForTimePosition:", v11, v10 / (double)v13))
          {
            -[AXMDataSonifier continuousScrubbingTone](self, "continuousScrubbingTone");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setMuted:", 0);

            -[AXMDataSonifier interpolatedPitchValueForNormalizedTimePosition:inSeries:](self, "interpolatedPitchValueForNormalizedTimePosition:inSeries:", v11, v10 / (double)v13);
            -[AXMDataSonifier frequencyForPitchEncodingValue:](self, "frequencyForPitchEncodingValue:");
            v16 = v15;
            -[AXMDataSonifier continuousScrubbingTone](self, "continuousScrubbingTone");
            v17 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setBaseFrequency:", v16);
          }
          else
          {
            -[AXMDataSonifier continuousScrubbingTone](self, "continuousScrubbingTone");
            v17 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setMuted:", 1);
          }
        }
        else
        {
          -[AXMDataSonifier playbackMixerDataSource](self, "playbackMixerDataSource");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "length");

          -[AXMDataSonifier playbackMixerDataSource](self, "playbackMixerDataSource");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "length");
          if (v95 <= a3)
          {
            v22 = (double)v95 / (double)v19;
            v23 = (double)a3;
          }
          else
          {
            v22 = v10 / (double)v19;
            v23 = (double)v95;
          }

          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v101 = (id)objc_claimAutoreleasedReturnValue();
          v24 = 0;
          v25 = v23 / (double)v21;
          while (1)
          {
            objc_msgSend(v11, "dataPoints");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = v24 < objc_msgSend(v26, "count");

            if (!v27)
              break;
            objc_msgSend(v11, "dataPoints");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "objectAtIndexedSubscript:", v24);
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v29, "timeEncodingValue");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            -[AXMDataSonifier normalizedTimeEncodingValueForValue:](self, "normalizedTimeEncodingValueForValue:", v30);
            v32 = v31;

            if (v22 <= v32 && v32 < v25)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v24);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v101, "addObject:", v33);

            }
            ++v24;
          }
          v34 = -[AXMDataSonifier scrubbingDiscreteDataRenderingContext](self, "scrubbingDiscreteDataRenderingContext");
          v110 = 0u;
          v111 = 0u;
          v108 = 0u;
          v109 = 0u;
          v17 = v101;
          v35 = 0;
          v36 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v108, v117, 16);
          if (v36)
          {
            v37 = *(_QWORD *)v109;
            do
            {
              v38 = 0;
              v39 = v35;
              do
              {
                if (*(_QWORD *)v109 != v37)
                  objc_enumerationMutation(v17);
                v40 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * v38);
                objc_msgSend(v11, "dataPoints");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "objectAtIndexedSubscript:", (int)objc_msgSend(v40, "intValue"));
                v42 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v42, "pitchEncodingValue");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "doubleValue");
                -[AXMDataSonifier frequencyForPitchEncodingValue:](self, "frequencyForPitchEncodingValue:");
                v45 = v44;

                objc_msgSend(v42, "durationEncodingValue");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v46, "doubleValue");
                -[AXMDataSonifier durationForDurationEncodingValue:](self, "durationForDurationEncodingValue:");
                v48 = v47;

                objc_msgSend(v42, "volumeEncodingValue");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v49, "doubleValue");
                -[AXMDataSonifier volumeForVolumeEncodingValue:](self, "volumeForVolumeEncodingValue:");
                v51 = v50;

                v35 = -[AXMADSREnvelope initWithAttackDuration:attackLevel:decayDuration:sustainDuration:sustainLevel:releaseDuration:]([AXMADSREnvelope alloc], "initWithAttackDuration:attackLevel:decayDuration:sustainDuration:sustainLevel:releaseDuration:", 20.0, v51, v48 / 5.0, 0.0, 0.0, 10.0);
                v52 = -[AXMSinglePitchSynth initWithFrequency:sampleRate:envelope:]([AXMSinglePitchSynth alloc], "initWithFrequency:sampleRate:envelope:", v35, v45, 44100.0);
                -[AXMSinglePitchSynth renderInBuffer:atFrame:](v52, "renderInBuffer:atFrame:", v34, 0);

                ++v38;
                v39 = v35;
              }
              while (v36 != v38);
              v36 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v108, v117, 16);
            }
            while (v36);
          }

          if (objc_msgSend(v17, "count"))
          {
            -[AXMADSREnvelope lengthMS](v35, "lengthMS");
            v54 = v53;
            v55 = objc_msgSend(v17, "count");
            v56 = objc_msgSend(v17, "count");
            v57 = (unint64_t)((double)(unint64_t)(v55 - 1) + v54 / v94 * 44100.0);
            v58 = v93 / vabdd_f64(v25, v22);
            if (v58 > 1.0)
              v58 = 1.0;
            -[AXMDataSonifier _peakNormalizeBuffer:length:level:](self, "_peakNormalizeBuffer:length:level:", v34, v57, v58 * (1.0 / (double)v56));
            -[AXMDataSonifier scrubbingDiscreteAudioDataSource](self, "scrubbingDiscreteAudioDataSource");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            v60 = objc_msgSend(v59, "currentSampleIndex");

            -[AXMDataSonifier scrubbingDiscreteAudioDataSource](self, "scrubbingDiscreteAudioDataSource");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            v62 = (uint64_t *)objc_msgSend(v61, "sampleBuffer");

            if (v57)
            {
              v63 = 0;
              v64 = *v62;
              v65 = (v62[1] - *v62) >> 2;
              v66 = *v34;
              do
              {
                *(_DWORD *)(v64 + 4 * ((v60 + 882 + v63) % v65)) += v66[v63];
                ++v63;
              }
              while (v57 != v63);
              if (v57 >= 1)
                bzero(*v34, 4 * (v57 - ((v57 & 0x3FFFFFFFFFFFFFFFLL) != 0)) + 4);
            }
          }

        }
      }
      v99 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v112, v118, 16);
    }
    while (v99);
  }

  -[AXMDataSonifier trendlineFunction](self, "trendlineFunction");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = v67 == 0;

  if (!v68)
  {
    -[AXMDataSonifier playbackMixerDataSource](self, "playbackMixerDataSource");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = objc_msgSend(v69, "length");

    -[AXMDataSonifier currentChartDescriptor](self, "currentChartDescriptor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "timeAxisDescriptor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v72, "lowerBound");
    v74 = v73;
    objc_msgSend(v72, "upperBound");
    -[AXMDataSonifier valueFromNormalizedValue:min:max:](self, "valueFromNormalizedValue:min:max:", (double)a3 / (double)v70, v74, v75);
    v77 = v76;
    -[AXMDataSonifier trendlineFunction](self, "trendlineFunction");
    v78 = (double (**)(double))objc_claimAutoreleasedReturnValue();
    v79 = v78[2](v77);

    -[AXMDataSonifier frequencyForPitchEncodingValue:](self, "frequencyForPitchEncodingValue:", v79);
    v81 = v80;
    -[AXMDataSonifier trendlineScrubbingTone](self, "trendlineScrubbingTone");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "setBaseFrequency:", v81);

  }
  -[AXMDataSonifier playbackMixerDataSource](self, "playbackMixerDataSource");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "setCurrentSampleIndex:", a3);

  v106 = 0u;
  v107 = 0u;
  v104 = 0u;
  v105 = 0u;
  -[AXMDataSonifier playbackObservers](self, "playbackObservers");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "allObjects");
  v102 = (id)objc_claimAutoreleasedReturnValue();

  v85 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v104, v116, 16);
  if (v85)
  {
    v86 = *(_QWORD *)v105;
    do
    {
      for (j = 0; j != v85; ++j)
      {
        if (*(_QWORD *)v105 != v86)
          objc_enumerationMutation(v102);
        v88 = *(_QWORD *)(*((_QWORD *)&v104 + 1) + 8 * j);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[AXMDataSonifier playbackMixerDataSource](self, "playbackMixerDataSource");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          v90 = objc_msgSend(v89, "currentSampleIndex");
          -[AXMDataSonifier playbackMixerDataSource](self, "playbackMixerDataSource");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          v92 = objc_msgSend(v91, "length");

          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __40__AXMDataSonifier_scrubToPlaybackFrame___block_invoke;
          block[3] = &unk_1E625E858;
          block[4] = v88;
          *(double *)&block[5] = (double)v90 / (double)v92;
          dispatch_async(MEMORY[0x1E0C80D38], block);
        }
      }
      v85 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v104, v116, 16);
    }
    while (v85);
  }

}

uint64_t __40__AXMDataSonifier_scrubToPlaybackFrame___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dataSonifierScrubbingPositionDidChange:", *(double *)(a1 + 40));
}

- (void)setCurrentChartDescriptor:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  id v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  objc_storeStrong((id *)&self->_currentChartDescriptor, a3);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v18, "series");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v25 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        objc_msgSend(v8, "dataPoints", v18);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v10)
        {
          v11 = *(_QWORD *)v21;
          do
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v21 != v11)
                objc_enumerationMutation(v9);
              v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * j);
              objc_msgSend(v13, "zCategoryAxisValue");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = v14 == 0;

              if (!v15)
              {
                -[AXMDataSonifier dataCategories](self, "dataCategories");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "zCategoryAxisValue");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "addObject:", v17);

              }
            }
            v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          }
          while (v10);
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v5);
  }

  -[AXMDataSonifier renderSonification](self, "renderSonification");
}

- (void)setCurrentSeriesIndex:(int64_t)a3
{
  void *v5;
  void *v6;

  -[AXMDataSonifier stopPlaying](self, "stopPlaying");
  -[AXMDataSonifier stopScrubbing](self, "stopScrubbing");
  self->_currentSeriesIndex = a3;
  if (a3)
  {
    -[AXMDataSonifier currentChartDescriptor](self, "currentChartDescriptor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "series");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    self->_currentSeriesIndex = a3 % (unint64_t)(objc_msgSend(v6, "count") + 1);

  }
  -[AXMDataSonifier renderSonification](self, "renderSonification");
}

- (void)renderSonification
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B0E3B000, log, OS_LOG_TYPE_ERROR, "Chart descriptor has no series, can't render sonification", v1, 2u);
}

- (void)_renderSeries:(id)a3
{
  NSArray *v4;
  NSArray *keyPitches;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  id v12;

  v12 = a3;
  if (objc_msgSend(v12, "isContinuous"))
  {
    -[AXMDataSonifier _keyPitchesForContinuousSeries:](self, "_keyPitchesForContinuousSeries:", v12);
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    keyPitches = self->_keyPitches;
    self->_keyPitches = v4;

    if (-[NSArray count](self->_keyPitches, "count"))
    {
      -[NSArray firstObject](self->_keyPitches, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "timeOffsetMS");
      v8 = v7;

      -[NSArray lastObject](self->_keyPitches, "lastObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "timeOffsetMS");
      v11 = v10;

      self->audiographPlaybackDuration = v11 - v8;
    }
  }
  else
  {
    -[AXMDataSonifier _renderDiscreteAudioForSeries:](self, "_renderDiscreteAudioForSeries:", v12);
  }

}

- (void)_renderDiscreteAudioForSeries:(id)a3
{
  unint64_t i;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  AXMADSREnvelope *v19;
  AXMSinglePitchSynth *v20;
  void *v21;
  id v22;

  v22 = a3;
  for (i = 0; ; ++i)
  {
    objc_msgSend(v22, "dataPoints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (i >= v6)
      break;
    objc_msgSend(v22, "dataPoints");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", i);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "playbackTimeOffsetMS");
    v9 = -[AXMDataSonifier sampleIndexForTimeOffset:](self, "sampleIndexForTimeOffset:");
    objc_msgSend(v8, "pitchEncodingValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    -[AXMDataSonifier frequencyForPitchEncodingValue:](self, "frequencyForPitchEncodingValue:");
    v12 = v11;

    objc_msgSend(v8, "durationEncodingValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValue");
    -[AXMDataSonifier durationForDurationEncodingValue:](self, "durationForDurationEncodingValue:");
    v15 = v14;

    objc_msgSend(v8, "volumeEncodingValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValue");
    -[AXMDataSonifier volumeForVolumeEncodingValue:](self, "volumeForVolumeEncodingValue:");
    v18 = v17;

    v19 = -[AXMADSREnvelope initWithAttackDuration:attackLevel:decayDuration:sustainDuration:sustainLevel:releaseDuration:]([AXMADSREnvelope alloc], "initWithAttackDuration:attackLevel:decayDuration:sustainDuration:sustainLevel:releaseDuration:", 20.0, v18, v15 / 5.0, 20.0, 0.3, 10.0);
    v20 = -[AXMSinglePitchSynth initWithFrequency:sampleRate:envelope:]([AXMSinglePitchSynth alloc], "initWithFrequency:sampleRate:envelope:", v19, v12, 44100.0);
    -[AXMDataSonifier playbackChartDataAudioDataSource](self, "playbackChartDataAudioDataSource");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMSinglePitchSynth renderInBuffer:atFrame:](v20, "renderInBuffer:atFrame:", objc_msgSend(v21, "sampleBuffer"), v9);

  }
}

- (id)_keyPitchesForContinuousSeries:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  KeyPitch *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;

  v4 = a3;
  -[AXMDataSonifier currentChartDescriptor](self, "currentChartDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "series");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexOfObject:", v4);

  if (objc_msgSend(v4, "isContinuous"))
  {
    objc_msgSend(v4, "dataPoints");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    v10 = 0;
    if (v9 && v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "dataPoints");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "playbackTimeOffsetMS");
      v14 = v13;

      -[AXMDataSonifier sampleIndexForTimeOffset:](self, "sampleIndexForTimeOffset:", v14);
      v15 = 0;
      *(_OWORD *)&self->maxFrequency = xmmword_1B0EFFE80;
      while (1)
      {
        objc_msgSend(v4, "dataPoints");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "count");

        if (v15 >= v17)
          break;
        objc_msgSend(v4, "dataPoints");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectAtIndexedSubscript:", v15);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v19, "playbackTimeOffsetMS");
        v21 = v20;
        objc_msgSend(v19, "pitchEncodingValue");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "doubleValue");
        -[AXMDataSonifier frequencyForPitchEncodingValue:](self, "frequencyForPitchEncodingValue:");
        v24 = v23;

        objc_msgSend(v19, "volumeEncodingValue");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "doubleValue");
        -[AXMDataSonifier volumeForVolumeEncodingValue:](self, "volumeForVolumeEncodingValue:");
        v27 = v26;

        v28 = -[KeyPitch initWithFrequency:volume:timeOffset:]([KeyPitch alloc], "initWithFrequency:volume:timeOffset:", v24, v27, v21 - v14);
        if (!objc_msgSend(v10, "count")
          || (objc_msgSend(v10, "lastObject"),
              v29 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v29, "timeOffsetMS"),
              v31 = v30,
              -[KeyPitch timeOffsetMS](v28, "timeOffsetMS"),
              v33 = v32,
              v29,
              v31 < v33))
        {
          objc_msgSend(v10, "addObject:", v28);
          v34 = fmin(self->minFrequency, v24);
          self->maxFrequency = fmax(self->maxFrequency, v24);
          self->minFrequency = v34;
        }

        ++v15;
      }
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (double)_centsForFrequency:(double)a3
{
  double v3;

  -[AXMDataSonifier _normalizedKeyPitchForFrequency:](self, "_normalizedKeyPitchForFrequency:", a3);
  return v3 * 4800.0 + -2400.0;
}

- (double)_normalizedKeyPitchForFrequency:(double)a3
{
  return a3 / self->maxFrequency;
}

- (void)_initializeAudioChain
{
  void *v3;
  double v4;
  id v5;
  id v6;
  id v7;

  v5 = objc_alloc_init(MEMORY[0x1E0C89A88]);
  -[AXMDataSonifier setEngine:](self, "setEngine:");

  -[AXMDataSonifier currentSeries](self, "currentSeries");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isContinuous"))
    -[AXMDataSonifier _setupContinuousAudioChain](self, "_setupContinuousAudioChain");
  else
    -[AXMDataSonifier _setupDiscreteAudioChain](self, "_setupDiscreteAudioChain");

  -[AVAudioEngine mainMixerNode](self->_engine, "mainMixerNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = 0.5;
  v7 = v3;
  objc_msgSend(v3, "setOutputVolume:", v4);

}

- (void)_setupContinuousAudioChain
{
  void *v3;
  id v4;

  -[AXMDataSonifier _initializePitchShifter](self, "_initializePitchShifter");
  -[AXMDataSonifier _initializeAudioPlayerNode](self, "_initializeAudioPlayerNode");
  -[AXMDataSonifier _initializeStereoPanner](self, "_initializeStereoPanner");
  -[AVAudioEngine mainMixerNode](self->_engine, "mainMixerNode");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C89AA8]), "initStandardFormatWithSampleRate:channels:", 2, 44100.0);
  -[AVAudioEngine connect:to:fromBus:toBus:format:](self->_engine, "connect:to:fromBus:toBus:format:", self->_player, self->_pitchShifter, 0, 0, v3);
  -[AVAudioEngine connect:to:fromBus:toBus:format:](self->_engine, "connect:to:fromBus:toBus:format:", self->_pitchShifter, self->_stereoPanner, 0, 0, v3);
  -[AVAudioEngine connect:to:fromBus:toBus:format:](self->_engine, "connect:to:fromBus:toBus:format:", self->_stereoPanner, v4, 0, objc_msgSend(v4, "nextAvailableInputBus"), v3);

}

- (void)_setupDiscreteAudioChain
{
  void *v3;
  id v4;

  -[AXMDataSonifier _initializeAudioSourceNode](self, "_initializeAudioSourceNode");
  -[AXMDataSonifier _initializeLimiter](self, "_initializeLimiter");
  -[AVAudioEngine mainMixerNode](self->_engine, "mainMixerNode");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C89AA8]), "initStandardFormatWithSampleRate:channels:", 2, 44100.0);
  -[AVAudioEngine connect:to:fromBus:toBus:format:](self->_engine, "connect:to:fromBus:toBus:format:", self->_audioSourceNode, self->_limiter, 0, 0, v3);
  -[AVAudioEngine connect:to:fromBus:toBus:format:](self->_engine, "connect:to:fromBus:toBus:format:", self->_limiter, v4, 0, objc_msgSend(v4, "nextAvailableInputBus"), v3);

}

- (void)_initializeAudioPlayerNode
{
  AVAudioPlayerNode *v3;
  AVAudioPlayerNode *player;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  AVAudioPCMBuffer *v12;
  AVAudioPCMBuffer *buffer;
  AVAudioPCMBuffer *v14;
  id v15;
  id v16;

  v3 = (AVAudioPlayerNode *)objc_alloc_init(MEMORY[0x1E0C89AD8]);
  player = self->_player;
  self->_player = v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathForResource:ofType:", CFSTR("bassTone"), CFSTR("wav"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc(MEMORY[0x1E0C89A98]);
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initForReading:error:", v8, 0);

  v10 = objc_alloc(MEMORY[0x1E0C89AC0]);
  objc_msgSend(v9, "processingFormat");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (AVAudioPCMBuffer *)objc_msgSend(v10, "initWithPCMFormat:frameCapacity:", v11, objc_msgSend(v9, "length"));
  buffer = self->buffer;
  self->buffer = v12;

  v14 = self->buffer;
  v16 = 0;
  objc_msgSend(v9, "readIntoBuffer:error:", v14, &v16);
  v15 = v16;
  -[AVAudioEngine attachNode:](self->_engine, "attachNode:", self->_player);

}

- (void)_initializePitchShifter
{
  AVAudioUnitTimePitch *v3;
  AVAudioUnitTimePitch *pitchShifter;
  double v5;

  v3 = (AVAudioUnitTimePitch *)objc_alloc_init(MEMORY[0x1E0C89B48]);
  pitchShifter = self->_pitchShifter;
  self->_pitchShifter = v3;

  LODWORD(v5) = 0;
  -[AVAudioUnitTimePitch setPitch:](self->_pitchShifter, "setPitch:", v5);
  -[AVAudioUnitTimePitch setOverlap:](self->_pitchShifter, "setOverlap:", 8589936700.0);
  -[AVAudioUnitTimePitch setBypass:](self->_pitchShifter, "setBypass:", 0);
  -[AVAudioEngine attachNode:](self->_engine, "attachNode:", self->_pitchShifter);
}

- (void)_initializeAudioSourceNode
{
  void *v3;
  id v4;
  AVAudioSourceNode *v5;
  AVAudioSourceNode *audioSourceNode;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t, uint64_t, _DWORD *);
  void *v10;
  id v11;
  id location;
  _OWORD v13[2];
  uint64_t v14;

  v14 = 0;
  memset(v13, 0, sizeof(v13));
  -[AXMDataSonifier _audioFormat](self, "_audioFormat");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C89AA8]), "initWithStreamDescription:", v13);
  objc_initWeak(&location, self);
  v4 = objc_alloc(MEMORY[0x1E0C89B00]);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __45__AXMDataSonifier__initializeAudioSourceNode__block_invoke;
  v10 = &unk_1E625E8D0;
  objc_copyWeak(&v11, &location);
  v5 = (AVAudioSourceNode *)objc_msgSend(v4, "initWithFormat:renderBlock:", v3, &v7);
  audioSourceNode = self->_audioSourceNode;
  self->_audioSourceNode = v5;

  -[AVAudioEngine attachNode:](self->_engine, "attachNode:", self->_audioSourceNode, v7, v8, v9, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

uint64_t __45__AXMDataSonifier__initializeAudioSourceNode__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _DWORD *a5)
{
  id *v5;
  id WeakRetained;
  void *v7;
  unint64_t v8;
  id v9;
  void *v10;
  unint64_t v11;
  id v12;
  double v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void **i;
  id v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  id v23;
  int v24;
  id v25;
  void *v26;
  void *v27;
  double v28;
  id v29;
  void *v30;
  unint64_t v31;
  id v32;
  void *v33;
  uint64_t v34;
  unint64_t v35;
  char *v36;
  size_t v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  int v47;
  id v48;
  void *v49;
  void *v50;
  _QWORD *v51;
  id v52;
  void *v53;
  _DWORD *v54;
  std::vector<int>::size_type v55;
  unint64_t v56;
  id v57;
  void *v58;
  unint64_t v59;
  id v60;
  std::vector<int> *v61;
  unint64_t v62;
  id v63;
  void *v64;
  int v65;
  id v66;
  void *v67;
  void *v68;
  id v69;
  int v70;
  id v71;
  void *v72;
  void *v73;
  double v74;
  id v75;
  void *v76;
  std::vector<int>::pointer begin;
  uint64_t v78;
  uint64_t v79;
  id v80;
  void *v81;
  unint64_t v82;
  id v83;
  void *v84;
  uint64_t v85;
  id v86;
  void *v87;
  int v88;
  id v89;
  void *v90;
  _QWORD *v91;
  _DWORD *v92;
  uint64_t v93;
  unint64_t v94;
  id v95;
  std::vector<int> *v96;
  id v97;
  void *v98;
  uint64_t v99;
  id v100;
  void *v101;
  id v102;
  void *v103;
  id v104;
  void *v105;
  std::vector<int>::pointer v106;
  uint64_t v107;
  uint64_t v108;
  id v109;
  void *v110;
  uint64_t v111;
  id v112;
  void *v113;
  unint64_t v114;
  id v115;
  void *v116;
  uint64_t v117;
  id v118;
  void *v119;
  unint64_t v120;
  id v121;
  void *v122;
  NSObject *v123;
  uint64_t v125;
  uint64_t v126;
  _QWORD *__sz;
  std::vector<int>::size_type __sza;
  std::vector<int>::size_type __szb;
  uint8_t buf[8];
  _QWORD block[4];
  id v133;

  v5 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "playbackMixerDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "currentSampleIndex");
  v9 = objc_loadWeakRetained(v5);
  objc_msgSend(v9, "playbackMixerDataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  v12 = objc_loadWeakRetained(v5);
  LODWORD(v10) = objc_msgSend(v12, "isPlaying");
  v13 = (double)v8 / (double)v11;

  v14 = objc_loadWeakRetained(v5);
  v15 = v14;
  if ((_DWORD)v10)
  {
    objc_msgSend(v14, "playbackMixerDataSource");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    __sz = (_QWORD *)objc_msgSend(v16, "sampleBuffer");

    if (!*a5)
      return 0;
    v17 = 0;
    for (i = (void **)(a5 + 4); ; i += 2)
    {
      v19 = objc_loadWeakRetained(v5);
      objc_msgSend(v19, "playbackMixerDataSource");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "currentSampleIndex");

      v22 = *((unsigned int *)i - 1);
      v23 = objc_loadWeakRetained(v5);
      v24 = objc_msgSend(v23, "usesBinauralPanning");
      v25 = objc_loadWeakRetained(v5);
      objc_msgSend(v25, "playbackMixerDataSource");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (v24)
        v28 = v13;
      else
        v28 = 0.5;
      objc_msgSend(v26, "setPanning:", v28);

      v29 = objc_loadWeakRetained(v5);
      objc_msgSend(v29, "playbackMixerDataSource");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v22 >> 2;
      objc_msgSend(v30, "prepareNextSamples:", v22 >> 2);

      v32 = objc_loadWeakRetained(v5);
      objc_msgSend(v32, "playbackMixerDataSource");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "length");

      v35 = v34 - v21;
      if (v34 == v21)
      {
        v36 = (char *)*i;
        v37 = *((unsigned int *)i - 1);
      }
      else
      {
        v38 = *i;
        v39 = objc_loadWeakRetained(v5);
        v40 = v39;
        if (v31 <= v35)
        {
          objc_msgSend(v39, "playbackMixerDataSource");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          memcpy(v38, (const void *)(*__sz + 4 * objc_msgSend(v44, "currentSampleIndex")), 4 * v31);

          v45 = objc_loadWeakRetained(v5);
          objc_msgSend(v45, "playbackMixerDataSource");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "setCurrentSampleIndex:", objc_msgSend(v46, "currentSampleIndex") + v31);

          goto LABEL_13;
        }
        objc_msgSend(v39, "playbackMixerDataSource");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        memcpy(v38, (const void *)(*__sz + 4 * objc_msgSend(v41, "currentSampleIndex")), 4 * v35);

        v42 = objc_loadWeakRetained(v5);
        objc_msgSend(v42, "playbackMixerDataSource");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setCurrentSampleIndex:", objc_msgSend(v43, "currentSampleIndex") + v35);

        v36 = (char *)*i + 4 * v35;
        v37 = 4 * (v31 - v35);
      }
      bzero(v36, v37);
LABEL_13:
      if (++v17 >= (unint64_t)*a5)
      {
        if (v21 + v31 >= (uint64_t)(__sz[1] - *__sz) >> 2)
        {
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __45__AXMDataSonifier__initializeAudioSourceNode__block_invoke_2;
          block[3] = &unk_1E625E8A8;
          objc_copyWeak(&v133, v5);
          dispatch_async(MEMORY[0x1E0C80D38], block);
          objc_destroyWeak(&v133);
        }
        return 0;
      }
    }
  }
  v47 = objc_msgSend(v14, "isScrubbing");

  v48 = objc_loadWeakRetained(v5);
  v49 = v48;
  if (v47)
  {
    objc_msgSend(v48, "scrubbingMixerDataSource");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = (_QWORD *)objc_msgSend(v50, "sampleBuffer");

    v52 = objc_loadWeakRetained(v5);
    objc_msgSend(v52, "scrubbingTrendlineAudioDataSource");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v125 = objc_msgSend(v53, "sampleBuffer");

    v54 = a5;
    if (*a5)
    {
      v55 = 0;
      do
      {
        v56 = v54[4 * v55 + 3];
        v57 = objc_loadWeakRetained(v5);
        objc_msgSend(v57, "scrubbingMixerDataSource");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = objc_msgSend(v58, "length");
        __sza = v55;

        v60 = objc_loadWeakRetained(v5);
        v61 = (std::vector<int> *)objc_msgSend(v60, "scrubbingPlaybackCallbackRenderingContext");
        v62 = v56 >> 2;

        if (v56 >> 2 != v61->__end_ - v61->__begin_)
          std::vector<int>::resize(v61, v56 >> 2);
        v63 = objc_loadWeakRetained(v5);
        objc_msgSend(v63, "trendlineFunction");
        v64 = (void *)objc_claimAutoreleasedReturnValue();

        if (v64)
        {
          v65 = v56;
          v66 = objc_loadWeakRetained(v5);
          objc_msgSend(v66, "trendlineScrubbingTone");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = (unint64_t)objc_loadWeakRetained(v5);
          objc_msgSend((id)v56, "scrubbingTrendlineAudioDataSource");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "renderInBuffer:atFrame:numSamples:", v125, objc_msgSend(v68, "currentSampleIndex"), v62);

          LODWORD(v56) = v65;
        }
        v69 = objc_loadWeakRetained(v5);
        v70 = objc_msgSend(v69, "usesBinauralPanning");
        v71 = objc_loadWeakRetained(v5);
        objc_msgSend(v71, "scrubbingMixerDataSource");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = v72;
        if (v70)
          v74 = v13;
        else
          v74 = 0.5;
        objc_msgSend(v72, "setPanning:", v74);

        v75 = objc_loadWeakRetained(v5);
        objc_msgSend(v75, "scrubbingMixerDataSource");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "prepareNextSamples:", v62);

        if (v56 > 3)
        {
          v78 = 0;
          if (v62 <= 1)
            v79 = 1;
          else
            v79 = v62;
          do
          {
            v80 = objc_loadWeakRetained(v5);
            objc_msgSend(v80, "scrubbingMixerDataSource");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            v82 = (v78 + objc_msgSend(v81, "currentSampleIndex")) % v59;

            begin = v61->__begin_;
            v61->__begin_[v78++] = *(_DWORD *)(*v51 + 4 * v82);
          }
          while (v79 != v78);
        }
        else
        {
          begin = v61->__begin_;
        }
        memcpy(*(void **)&a5[4 * __sza + 4], begin, 4 * v62);
        v83 = objc_loadWeakRetained(v5);
        objc_msgSend(v83, "scrubbingMixerDataSource");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = objc_msgSend(v84, "currentSampleIndex");
        v86 = objc_loadWeakRetained(v5);
        objc_msgSend(v86, "scrubbingMixerDataSource");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "setCurrentSampleIndex:", (v85 + v62) % v59);

        v54 = a5;
        v55 = __sza + 1;
      }
      while (__sza + 1 < *a5);
    }
  }
  else
  {
    v88 = objc_msgSend(v48, "isInLiveContinuousToneSession");

    if (v88)
    {
      v89 = objc_loadWeakRetained(v5);
      objc_msgSend(v89, "liveContinuousMixerDataSource");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v91 = (_QWORD *)objc_msgSend(v90, "sampleBuffer");

      v92 = a5;
      if (*a5)
      {
        v93 = 0;
        do
        {
          v94 = v92[4 * v93 + 3];
          v95 = objc_loadWeakRetained(v5);
          v96 = (std::vector<int> *)objc_msgSend(v95, "liveTonePlaybackCallbackRenderingContext");
          v126 = v93;

          __szb = v94 >> 2;
          if (v94 >> 2 != v96->__end_ - v96->__begin_)
            std::vector<int>::resize(v96, __szb);
          v97 = objc_loadWeakRetained(v5);
          objc_msgSend(v97, "liveContinuousAudioDataSource");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          v99 = objc_msgSend(v98, "sampleBuffer");

          v100 = objc_loadWeakRetained(v5);
          objc_msgSend(v100, "liveContinuousDataTone");
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          v102 = objc_loadWeakRetained(v5);
          objc_msgSend(v102, "liveContinuousAudioDataSource");
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v101, "renderInBuffer:atFrame:numSamples:", v99, objc_msgSend(v103, "currentSampleIndex"), __szb);

          v104 = objc_loadWeakRetained(v5);
          objc_msgSend(v104, "liveContinuousMixerDataSource");
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v105, "prepareNextSamples:", __szb);

          if (v94 > 3)
          {
            v107 = 0;
            if (__szb <= 1)
              v108 = 1;
            else
              v108 = v94 >> 2;
            do
            {
              v109 = objc_loadWeakRetained(v5);
              objc_msgSend(v109, "liveContinuousMixerDataSource");
              v110 = (void *)objc_claimAutoreleasedReturnValue();
              v111 = objc_msgSend(v110, "currentSampleIndex");
              v112 = objc_loadWeakRetained(v5);
              objc_msgSend(v112, "liveContinuousMixerDataSource");
              v113 = (void *)objc_claimAutoreleasedReturnValue();
              v114 = (v107 + v111) % (unint64_t)objc_msgSend(v113, "length");

              v106 = v96->__begin_;
              v96->__begin_[v107++] = *(_DWORD *)(*v91 + 4 * v114);
            }
            while (v108 != v107);
          }
          else
          {
            v106 = v96->__begin_;
          }
          memcpy(*(void **)&a5[4 * v126 + 4], v106, 4 * __szb);
          v115 = objc_loadWeakRetained(v5);
          objc_msgSend(v115, "liveContinuousMixerDataSource");
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          v117 = objc_msgSend(v116, "currentSampleIndex");
          v118 = objc_loadWeakRetained(v5);
          objc_msgSend(v118, "liveContinuousMixerDataSource");
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          v120 = objc_msgSend(v119, "length");
          v121 = objc_loadWeakRetained(v5);
          objc_msgSend(v121, "liveContinuousMixerDataSource");
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v122, "setCurrentSampleIndex:", (v117 + __szb) % v120);

          v93 = v126 + 1;
          v92 = a5;
        }
        while (v126 + 1 < (unint64_t)*a5);
      }
    }
    else
    {
      AXMediaLogCommon();
      v123 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B0E3B000, v123, OS_LOG_TYPE_DEFAULT, "Error: IO audio unit is running but we aren't in a scrubbing or playback session -- investigate.", buf, 2u);
      }

    }
  }
  return 0;
}

void __45__AXMDataSonifier__initializeAudioSourceNode__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "stopPlaying");

}

- (AudioStreamBasicDescription)_audioFormat
{
  retstr->mSampleRate = 44100.0;
  retstr->mBitsPerChannel = 16;
  *(_OWORD *)&retstr->mFormatID = xmmword_1B0EFFE90;
  *(_QWORD *)&retstr->mBytesPerFrame = 0x200000004;
  return self;
}

- (void)_initializeLowpassFilter
{
  AVAudioUnitEQ *v3;
  AVAudioUnitEQ *lowpassFilter;
  void *v5;
  double v6;
  id v7;

  v3 = (AVAudioUnitEQ *)objc_msgSend(objc_alloc(MEMORY[0x1E0C89B30]), "initWithNumberOfBands:", 1);
  lowpassFilter = self->_lowpassFilter;
  self->_lowpassFilter = v3;

  -[AVAudioUnitEQ bands](self->_lowpassFilter, "bands");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setFilterType:", 1);
  LODWORD(v6) = 1148846080;
  objc_msgSend(v7, "setFrequency:", v6);
  objc_msgSend(v7, "setBypass:", 0);

}

- (void)setLowpassCutoff:(float)a3
{
  void *v4;
  double v5;
  id v6;

  -[AVAudioUnitEQ bands](self->_lowpassFilter, "bands");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v5 = a3;
  objc_msgSend(v4, "setFrequency:", v5);

}

- (float)lowpassCutoff
{
  void *v2;
  void *v3;
  float v4;
  float v5;

  -[AVAudioUnitEQ bands](self->_lowpassFilter, "bands");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frequency");
  v5 = v4;

  return v5;
}

- (void)_initializeCompressor
{
  AVAudioUnitEffect *v3;
  AVAudioUnitEffect *compressor;
  AVAudioUnitEffect *v5;
  AVAudioUnitEffect *v6;
  __int128 v7;
  int v8;

  v3 = (AVAudioUnitEffect *)objc_alloc_init(MEMORY[0x1E0C89B38]);
  compressor = self->_compressor;
  self->_compressor = v3;

  v8 = 0;
  v7 = *(_OWORD *)"xfuapmcdlppa";
  v5 = (AVAudioUnitEffect *)objc_msgSend(objc_alloc(MEMORY[0x1E0C89B38]), "initWithAudioComponentDescription:", &v7);
  v6 = self->_compressor;
  self->_compressor = v5;

  -[AVAudioUnitEffect setBypass:](self->_compressor, "setBypass:", 0);
  AudioUnitSetParameter((AudioUnit)-[AVAudioUnitEffect audioUnit](self->_compressor, "audioUnit"), 4u, 0, 0, 5.0, 0);
  AudioUnitSetParameter((AudioUnit)-[AVAudioUnitEffect audioUnit](self->_compressor, "audioUnit"), 5u, 0, 0, 20.0, 0);
  AudioUnitSetParameter((AudioUnit)-[AVAudioUnitEffect audioUnit](self->_compressor, "audioUnit"), 0x3E8u, 0, 0, 3.0, 0);
  AudioUnitSetParameter((AudioUnit)-[AVAudioUnitEffect audioUnit](self->_compressor, "audioUnit"), 0, 0, 0, -0.5, 0);
  AudioUnitSetParameter((AudioUnit)-[AVAudioUnitEffect audioUnit](self->_compressor, "audioUnit"), 6u, 0, 0, 0.0, 0);
}

- (void)_initializeStereoPanner
{
  AVAudioEnvironmentNode *v3;
  AVAudioEnvironmentNode *stereoPanner;

  v3 = (AVAudioEnvironmentNode *)objc_alloc_init(MEMORY[0x1E0C89A90]);
  stereoPanner = self->_stereoPanner;
  self->_stereoPanner = v3;

  -[AVAudioEngine attachNode:](self->_engine, "attachNode:", self->_stereoPanner);
}

- (void)_setPanning:(float)a3
{
  -[AVAudioEnvironmentNode setPan:](self->_stereoPanner, "setPan:");
}

- (void)_initializeLimiter
{
  AVAudioUnitEffect *v3;
  AVAudioUnitEffect *limiter;
  __int128 v5;
  int v6;

  v6 = 0;
  v5 = *(_OWORD *)"xfuartmllppa";
  v3 = (AVAudioUnitEffect *)objc_msgSend(objc_alloc(MEMORY[0x1E0C89B38]), "initWithAudioComponentDescription:", &v5);
  limiter = self->_limiter;
  self->_limiter = v3;

  -[AVAudioUnitEffect setBypass:](self->_limiter, "setBypass:", 0);
  AudioUnitSetParameter((AudioUnit)-[AVAudioUnitEffect audioUnit](self->_limiter, "audioUnit"), 1u, 0, 0, 2.0, 0);
  -[AVAudioEngine attachNode:](self->_engine, "attachNode:", self->_limiter);
}

- (double)normalizedTimeEncodingValueForValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;

  v4 = a3;
  -[AXMDataSonifier currentChartDescriptor](self, "currentChartDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeNumericAxisDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[AXMDataSonifier currentChartDescriptor](self, "currentChartDescriptor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeNumericAxisDescriptor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "number");
    v10 = v9;
    objc_msgSend(v8, "lowerBound");
    v12 = v11;
    objc_msgSend(v8, "upperBound");
    -[AXMDataSonifier normalizedValueForValue:min:max:](self, "normalizedValueForValue:min:max:", v10, v12, v13);
    v15 = v14;
  }
  else
  {
    -[AXMDataSonifier currentChartDescriptor](self, "currentChartDescriptor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "timeCategoricalAxisDescriptor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      v15 = 0.0;
      goto LABEL_4;
    }
    -[AXMDataSonifier currentChartDescriptor](self, "currentChartDescriptor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "timeCategoricalAxisDescriptor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "categoryOrder");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "category");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "indexOfObject:", v21);

    v15 = 0.0;
    if (v22 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v8, "categoryOrder");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (double)v22 / (double)(unint64_t)objc_msgSend(v23, "count");

    }
  }

LABEL_4:
  return v15;
}

- (double)normalizedValueForValue:(double)a3 min:(double)a4 max:(double)a5
{
  return (AXMClampDouble(a3, a4, a5) - a4) / (a5 - a4);
}

- (double)valueFromNormalizedValue:(double)a3 min:(double)a4 max:(double)a5
{
  return a4 + a3 * (a5 - a4);
}

- (double)interpolatedPitchValueForNormalizedTimePosition:(double)a3 inSeries:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  unint64_t i;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  unint64_t v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  double v39;
  double v40;

  v6 = a4;
  -[AXMDataSonifier currentChartDescriptor](self, "currentChartDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeAxisDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "isCategoricalAxis");
  if ((v9 & 1) != 0)
  {
    objc_msgSend(v6, "dataPoints");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (double)(unint64_t)objc_msgSend(v10, "count");

    v12 = 0.0;
  }
  else
  {
    objc_msgSend(v8, "lowerBound");
    v12 = v13;
    objc_msgSend(v8, "upperBound");
    v11 = v14;
  }
  -[AXMDataSonifier valueFromNormalizedValue:min:max:](self, "valueFromNormalizedValue:min:max:", a3, v12, v11);
  v16 = v15;
  objc_msgSend(v6, "dataPoints");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 1; ; ++i)
  {
    if (i >= objc_msgSend(v17, "count"))
    {
      v24 = 0.0;
      goto LABEL_14;
    }
    if ((v9 & 1) == 0)
      break;
    v19 = (double)i;
    if (v16 < (double)i)
    {
      v25 = i - 1;
      v26 = (double)(i - 1);
      goto LABEL_13;
    }
LABEL_10:
    ;
  }
  objc_msgSend(v17, "objectAtIndexedSubscript:", i);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "timeEncodingValue");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "number");
  v23 = v22;

  if (v23 <= v16)
    goto LABEL_10;
  v25 = i - 1;
  objc_msgSend(v17, "objectAtIndexedSubscript:", i - 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "timeEncodingValue");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "number");
  v26 = v29;

  objc_msgSend(v17, "objectAtIndexedSubscript:", i);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "timeEncodingValue");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "number");
  v19 = v32;

LABEL_13:
  objc_msgSend(v17, "objectAtIndexedSubscript:", v25);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "pitchEncodingValue");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "doubleValue");
  v36 = v35;

  objc_msgSend(v17, "objectAtIndexedSubscript:", i);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "pitchEncodingValue");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "doubleValue");
  v40 = v39;

  v24 = v36 + (v16 - v26) / (v19 - v26) * (v40 - v36);
LABEL_14:

  return v24;
}

- (double)timeOffsetForTimeEncodingValue:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  -[AXMDataSonifier normalizedTimeEncodingValueForValue:](self, "normalizedTimeEncodingValueForValue:", v4);
  v6 = v5;
  -[AXMDataSonifier playbackDuration](self, "playbackDuration");
  v8 = v6 * v7;

  return v8;
}

- (unint64_t)sampleIndexForTimeOffset:(double)a3
{
  return (unint64_t)(a3 / 1000.0 * 44100.0);
}

- (double)frequencyForPitchEncodingValue:(double)a3
{
  long double v5;
  double v6;
  long double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;

  -[AXMDataSonifier minimumPlaybackFrequency](self, "minimumPlaybackFrequency");
  v6 = log2(v5);
  -[AXMDataSonifier maximumPlaybackFrequency](self, "maximumPlaybackFrequency");
  v8 = log2(v7);
  -[AXMDataSonifier currentChartDescriptor](self, "currentChartDescriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pitchAxisDescriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "lowerBound");
  v12 = v11;
  objc_msgSend(v10, "upperBound");
  -[AXMDataSonifier normalizedValueForValue:min:max:](self, "normalizedValueForValue:min:max:", a3, v12, v13);
  v15 = exp2(v6 + v14 * (v8 - v6));
  -[AXMDataSonifier minimumPlaybackFrequency](self, "minimumPlaybackFrequency");
  v17 = v16;
  -[AXMDataSonifier maximumPlaybackFrequency](self, "maximumPlaybackFrequency");
  v19 = AXMClampDouble(v15, v17, v18);

  return v19;
}

- (double)volumeForVolumeEncodingValue:(double)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;

  -[AXMDataSonifier currentChartDescriptor](self, "currentChartDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "volumeAxisDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[AXMDataSonifier maximumToneVolume](self, "maximumToneVolume");
    v8 = v7;
    -[AXMDataSonifier minimumToneVolume](self, "minimumToneVolume");
    v10 = v9;
    objc_msgSend(v6, "lowerBound");
    v12 = v11;
    objc_msgSend(v6, "upperBound");
    -[AXMDataSonifier normalizedValueForValue:min:max:](self, "normalizedValueForValue:min:max:", a3, v12, v13);
    v15 = v14;
    -[AXMDataSonifier minimumToneVolume](self, "minimumToneVolume");
    v17 = v16;
    -[AXMDataSonifier minimumToneVolume](self, "minimumToneVolume");
    v19 = v18;
    -[AXMDataSonifier maximumToneVolume](self, "maximumToneVolume");
    v21 = AXMClampDouble(v17 + v15 * (v8 - v10), v19, v20);
  }
  else
  {
    v21 = 1.0;
  }

  return v21;
}

- (double)durationForDurationEncodingValue:(double)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;

  -[AXMDataSonifier currentChartDescriptor](self, "currentChartDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "durationAxisDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "lowerBound");
  v8 = v7;
  objc_msgSend(v6, "upperBound");
  -[AXMDataSonifier normalizedValueForValue:min:max:](self, "normalizedValueForValue:min:max:", a3, v8, v9);
  v11 = v10;
  -[AXMDataSonifier maximumDiscreteToneLength](self, "maximumDiscreteToneLength");
  v13 = v12;
  -[AXMDataSonifier minimumDiscreteToneLength](self, "minimumDiscreteToneLength");
  v15 = v14;
  -[AXMDataSonifier minimumDiscreteToneLength](self, "minimumDiscreteToneLength");
  v17 = v16;
  -[AXMDataSonifier minimumDiscreteToneLength](self, "minimumDiscreteToneLength");
  v19 = v18;
  -[AXMDataSonifier maximumDiscreteToneLength](self, "maximumDiscreteToneLength");
  v21 = AXMClampDouble(v11 * ((v13 - v15) * 1000.0) + v17 * 1000.0, v19 * 1000.0, v20 * 1000.0);

  return v21;
}

- (BOOL)series:(id)a3 hasContinuousPitchDataForTimePosition:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  v6 = a3;
  -[AXMDataSonifier currentChartDescriptor](self, "currentChartDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeAxisDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "isCategoricalAxis") & 1) != 0)
  {
    v9 = 1;
  }
  else
  {
    objc_msgSend(v8, "lowerBound");
    v11 = v10;
    objc_msgSend(v8, "upperBound");
    -[AXMDataSonifier valueFromNormalizedValue:min:max:](self, "valueFromNormalizedValue:min:max:", a4, v11, v12);
    v14 = v13;
    if (objc_msgSend(v6, "isContinuous"))
    {
      objc_msgSend(v6, "minimumDataValueOnTimeAxis");
      v16 = v15;
      objc_msgSend(v6, "maximumDataValueOnTimeAxis");
      v9 = v14 <= v17 && v16 <= v14;
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (void)beginLiveContinuousToneSession
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1B0E3B000, log, OS_LOG_TYPE_ERROR, "error starting audio output: %@", buf, 0xCu);

}

- (void)endLiveContinuousToneSession
{
  void *v3;

  -[AXMDataSonifier liveContinuousMixerDataSource](self, "liveContinuousMixerDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllDataSources");

  self->_isInLiveContinuousToneSession = 0;
}

- (void)setLiveContinuousToneNormalizedFrequency:(double)a3
{
  long double v5;
  double v6;
  long double v7;
  long double v8;
  double v9;
  id v10;

  -[AXMDataSonifier minimumPlaybackFrequency](self, "minimumPlaybackFrequency");
  v6 = log2(v5);
  -[AXMDataSonifier maximumPlaybackFrequency](self, "maximumPlaybackFrequency");
  v8 = log2(v7);
  v9 = exp2(v6 + a3 * (v8 - v6));
  -[AXMDataSonifier liveContinuousDataTone](self, "liveContinuousDataTone");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBaseFrequency:", v9);

}

- (void)_peakNormalizeBuffer:(void *)a3 length:(unint64_t)a4 level:(double)a5
{
  int *v5;
  uint64_t v6;
  int v7;
  unint64_t v8;
  int *v9;
  unint64_t v10;
  int v11;
  int v12;

  v5 = *(int **)a3;
  v6 = *((_QWORD *)a3 + 1) - *(_QWORD *)a3;
  if (v6)
  {
    v7 = 0;
    v8 = v6 >> 2;
    if (v8 <= 1)
      v8 = 1;
    v9 = *(int **)a3;
    v10 = v8;
    do
    {
      v12 = *v9++;
      v11 = v12;
      if (v12 > v7)
        v7 = v11;
      --v10;
    }
    while (v10);
    do
    {
      *v5 = (int)((double)(int)((double)*v5 / ((double)v7 / 32500.0)) * a5);
      ++v5;
      --v8;
    }
    while (v8);
  }
}

- (id)_newContinuousToneEnvelope
{
  return -[AXMADSREnvelope initWithAttackDuration:attackLevel:decayDuration:sustainDuration:sustainLevel:releaseDuration:]([AXMADSREnvelope alloc], "initWithAttackDuration:attackLevel:decayDuration:sustainDuration:sustainLevel:releaseDuration:", 500.0, 1.0, 0.0, 1.0, 1.0, 50.0);
}

- (void)_regenerateTimeEncodingValuesForDataPoints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  id obj;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  id v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  -[AXMDataSonifier currentChartDescriptor](self, "currentChartDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeCategoricalAxisDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXMDataSonifier currentChartDescriptor](self, "currentChartDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeNumericAxisDescriptor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "categoryOrder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  -[AXMDataSonifier currentChartDescriptor](self, "currentChartDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "series");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v9;
  v34 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  if (v34)
  {
    v33 = *(_QWORD *)v43;
    v10 = (double)v7;
    do
    {
      for (i = 0; i != v34; ++i)
      {
        if (*(_QWORD *)v43 != v33)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        objc_msgSend(v11, "dataPoints");
        v36 = (id)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
        if (v12)
        {
          v13 = *(_QWORD *)v39;
          do
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v39 != v13)
                objc_enumerationMutation(v36);
              v15 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
              if (v4)
              {
                objc_msgSend(v4, "categoryOrder");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "timeEncodingValue");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "category");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v19 = objc_msgSend(v16, "indexOfObject:", v18);

                if (v19 != 0x7FFFFFFFFFFFFFFFLL)
                {
                  -[AXMDataSonifier normalizedValueForValue:min:max:](self, "normalizedValueForValue:min:max:", (double)v19, 0.0, v10);
                  v21 = v20;
                  -[AXMDataSonifier playbackDuration](self, "playbackDuration");
                  objc_msgSend(v15, "setPlaybackTimeOffsetMS:", v21 * v22);
                }
              }
              else
              {
                objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * j), "timeEncodingValue");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "number");
                v25 = v24;

                objc_msgSend(v37, "lowerBound");
                v27 = v26;
                objc_msgSend(v37, "upperBound");
                -[AXMDataSonifier normalizedValueForValue:min:max:](self, "normalizedValueForValue:min:max:", v25, v27, v28);
                v30 = v29;
                -[AXMDataSonifier playbackDuration](self, "playbackDuration");
                objc_msgSend(v15, "setPlaybackTimeOffsetMS:", v30 * v31);
              }
            }
            v12 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
          }
          while (v12);
        }

      }
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    }
    while (v34);
  }

}

- (AXMDataSeriesDescriptor)currentSeries
{
  unint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  if (-[AXMDataSonifier currentSeriesIndex](self, "currentSeriesIndex") == 0x7FFFFFFFFFFFFFFFLL)
    return (AXMDataSeriesDescriptor *)0;
  v4 = -[AXMDataSonifier currentSeriesIndex](self, "currentSeriesIndex");
  -[AXMDataSonifier currentChartDescriptor](self, "currentChartDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "series");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v4 >= v7)
  {
    v11 = -[AXMDataSonifier currentSeriesIndex](self, "currentSeriesIndex");
    -[AXMDataSonifier currentChartDescriptor](self, "currentChartDescriptor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "series");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v11 != v14)
      return (AXMDataSeriesDescriptor *)0;
    -[AXMDataSonifier currentChartDescriptor](self, "currentChartDescriptor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "series");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastObject");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[AXMDataSonifier currentChartDescriptor](self, "currentChartDescriptor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "series");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", -[AXMDataSonifier currentSeriesIndex](self, "currentSeriesIndex"));
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)v10;

  return (AXMDataSeriesDescriptor *)v15;
}

- (BOOL)shouldIncrementToPitch:(double)a3 by:(double)a4
{
  float v6;
  double v7;

  -[AVAudioUnitTimePitch pitch](self->_pitchShifter, "pitch");
  v7 = v6 + a4;
  if (a4 >= 0.0)
    return v7 < a3 + a4;
  else
    return v7 > a3 + a4;
}

- (double)minimumPlaybackFrequency
{
  return self->_minimumPlaybackFrequency;
}

- (void)setMinimumPlaybackFrequency:(double)a3
{
  self->_minimumPlaybackFrequency = a3;
}

- (double)maximumPlaybackFrequency
{
  return self->_maximumPlaybackFrequency;
}

- (void)setMaximumPlaybackFrequency:(double)a3
{
  self->_maximumPlaybackFrequency = a3;
}

- (BOOL)usesBinauralPanning
{
  return self->_usesBinauralPanning;
}

- (void)setUsesBinauralPanning:(BOOL)a3
{
  self->_usesBinauralPanning = a3;
}

- (int)dataMode
{
  return self->_dataMode;
}

- (id)function
{
  return self->_function;
}

- (BOOL)isPlaying
{
  return self->_playing;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (BOOL)isScrubbing
{
  return self->_scrubbing;
}

- (BOOL)isEndingScrubbing
{
  return self->_isEndingScrubbing;
}

- (int)interpolationMode
{
  return self->_interpolationMode;
}

- (AXMLiveContinuousSynth)continuousScrubbingTone
{
  return self->_continuousScrubbingTone;
}

- (BOOL)isInLiveContinuousToneSession
{
  return self->_isInLiveContinuousToneSession;
}

- (AXMChartDescriptor)currentChartDescriptor
{
  return self->_currentChartDescriptor;
}

- (int64_t)currentSeriesIndex
{
  return self->_currentSeriesIndex;
}

- (NSTimer)playbackObserverUpdateTimer
{
  return self->_playbackObserverUpdateTimer;
}

- (void)setPlaybackObserverUpdateTimer:(id)a3
{
  objc_storeStrong((id *)&self->_playbackObserverUpdateTimer, a3);
}

- (AXMAudioDataSourceMixer)playbackMixerDataSource
{
  return self->_playbackMixerDataSource;
}

- (void)setPlaybackMixerDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_playbackMixerDataSource, a3);
}

- (AXMAudioDataSource)playbackChartDataAudioDataSource
{
  return self->_playbackChartDataAudioDataSource;
}

- (void)setPlaybackChartDataAudioDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_playbackChartDataAudioDataSource, a3);
}

- (AXMAudioDataSource)playbackTrendlineAudioDataSource
{
  return self->_playbackTrendlineAudioDataSource;
}

- (void)setPlaybackTrendlineAudioDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_playbackTrendlineAudioDataSource, a3);
}

- (AXMAudioDataSourceMixer)scrubbingMixerDataSource
{
  return self->_scrubbingMixerDataSource;
}

- (void)setScrubbingMixerDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_scrubbingMixerDataSource, a3);
}

- (AXMAudioDataSource)scrubbingDiscreteAudioDataSource
{
  return self->_scrubbingDiscreteAudioDataSource;
}

- (void)setScrubbingDiscreteAudioDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_scrubbingDiscreteAudioDataSource, a3);
}

- (AXMAudioDataSource)scrubbingContinuousAudioDataSource
{
  return self->_scrubbingContinuousAudioDataSource;
}

- (void)setScrubbingContinuousAudioDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_scrubbingContinuousAudioDataSource, a3);
}

- (AXMAudioDataSource)scrubbingTrendlineAudioDataSource
{
  return self->_scrubbingTrendlineAudioDataSource;
}

- (void)setScrubbingTrendlineAudioDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_scrubbingTrendlineAudioDataSource, a3);
}

- (AXMAudioDataSourceMixer)liveContinuousMixerDataSource
{
  return self->_liveContinuousMixerDataSource;
}

- (void)setLiveContinuousMixerDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_liveContinuousMixerDataSource, a3);
}

- (AXMAudioDataSource)liveContinuousAudioDataSource
{
  return self->_liveContinuousAudioDataSource;
}

- (void)setLiveContinuousAudioDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_liveContinuousAudioDataSource, a3);
}

- (NSPointerArray)playbackObservers
{
  return self->_playbackObservers;
}

- (void)setPlaybackObservers:(id)a3
{
  objc_storeStrong((id *)&self->_playbackObservers, a3);
}

- (AXMLiveContinuousSynth)trendlineScrubbingTone
{
  return self->_trendlineScrubbingTone;
}

- (AXMLiveContinuousSynth)liveContinuousDataTone
{
  return self->_liveContinuousDataTone;
}

- (id)trendlineFunction
{
  return self->_trendlineFunction;
}

- (void)setTrendlineFunction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (void)scrubbingDiscreteDataRenderingContext
{
  return self->_scrubbingDiscreteDataRenderingContext;
}

- (void)scrubbingPlaybackCallbackRenderingContext
{
  return self->_scrubbingPlaybackCallbackRenderingContext;
}

- (void)liveTonePlaybackCallbackRenderingContext
{
  return self->_liveTonePlaybackCallbackRenderingContext;
}

- (unint64_t)playbackSampleCount
{
  return self->_playbackSampleCount;
}

- (NSMutableOrderedSet)dataCategories
{
  return self->_dataCategories;
}

- (double)minimumDiscreteToneLength
{
  return self->_minimumDiscreteToneLength;
}

- (void)setMinimumDiscreteToneLength:(double)a3
{
  self->_minimumDiscreteToneLength = a3;
}

- (double)maximumDiscreteToneLength
{
  return self->_maximumDiscreteToneLength;
}

- (void)setMaximumDiscreteToneLength:(double)a3
{
  self->_maximumDiscreteToneLength = a3;
}

- (double)minimumToneVolume
{
  return self->_minimumToneVolume;
}

- (void)setMinimumToneVolume:(double)a3
{
  self->_minimumToneVolume = a3;
}

- (double)maximumToneVolume
{
  return self->_maximumToneVolume;
}

- (void)setMaximumToneVolume:(double)a3
{
  self->_maximumToneVolume = a3;
}

- (AVAudioSourceNode)audioSourceNode
{
  return self->_audioSourceNode;
}

- (void)setAudioSourceNode:(id)a3
{
  objc_storeStrong((id *)&self->_audioSourceNode, a3);
}

- (AVAudioPlayerNode)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_player, a3);
}

- (AVAudioEngine)engine
{
  return self->_engine;
}

- (void)setEngine:(id)a3
{
  objc_storeStrong((id *)&self->_engine, a3);
}

- (AVAudioUnitEffect)compressor
{
  return self->_compressor;
}

- (void)setCompressor:(id)a3
{
  objc_storeStrong((id *)&self->_compressor, a3);
}

- (AVAudioUnitEffect)limiter
{
  return self->_limiter;
}

- (void)setLimiter:(id)a3
{
  objc_storeStrong((id *)&self->_limiter, a3);
}

- (AVAudioEnvironmentNode)stereoPanner
{
  return self->_stereoPanner;
}

- (void)setStereoPanner:(id)a3
{
  objc_storeStrong((id *)&self->_stereoPanner, a3);
}

- (AVAudioUnitEQ)lowpassFilter
{
  return self->_lowpassFilter;
}

- (void)setLowpassFilter:(id)a3
{
  objc_storeStrong((id *)&self->_lowpassFilter, a3);
}

- (AVAudioUnitTimePitch)pitchShifter
{
  return self->_pitchShifter;
}

- (void)setPitchShifter:(id)a3
{
  objc_storeStrong((id *)&self->_pitchShifter, a3);
}

- (NSTimer)keyPitchUpdateTimer
{
  return self->_keyPitchUpdateTimer;
}

- (void)setKeyPitchUpdateTimer:(id)a3
{
  objc_storeStrong((id *)&self->_keyPitchUpdateTimer, a3);
}

- (NSArray)keyPitches
{
  return self->_keyPitches;
}

- (void)setKeyPitches:(id)a3
{
  objc_storeStrong((id *)&self->_keyPitches, a3);
}

- (double)currentPlaybackTime
{
  return self->_currentPlaybackTime;
}

- (void)setCurrentPlaybackTime:(double)a3
{
  self->_currentPlaybackTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyPitches, 0);
  objc_storeStrong((id *)&self->_keyPitchUpdateTimer, 0);
  objc_storeStrong((id *)&self->_pitchShifter, 0);
  objc_storeStrong((id *)&self->_lowpassFilter, 0);
  objc_storeStrong((id *)&self->_stereoPanner, 0);
  objc_storeStrong((id *)&self->_limiter, 0);
  objc_storeStrong((id *)&self->_compressor, 0);
  objc_storeStrong((id *)&self->_engine, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_audioSourceNode, 0);
  objc_storeStrong((id *)&self->_dataCategories, 0);
  objc_storeStrong(&self->_trendlineFunction, 0);
  objc_storeStrong((id *)&self->_liveContinuousDataTone, 0);
  objc_storeStrong((id *)&self->_trendlineScrubbingTone, 0);
  objc_storeStrong((id *)&self->_playbackObservers, 0);
  objc_storeStrong((id *)&self->_liveContinuousAudioDataSource, 0);
  objc_storeStrong((id *)&self->_liveContinuousMixerDataSource, 0);
  objc_storeStrong((id *)&self->_scrubbingTrendlineAudioDataSource, 0);
  objc_storeStrong((id *)&self->_scrubbingContinuousAudioDataSource, 0);
  objc_storeStrong((id *)&self->_scrubbingDiscreteAudioDataSource, 0);
  objc_storeStrong((id *)&self->_scrubbingMixerDataSource, 0);
  objc_storeStrong((id *)&self->_playbackTrendlineAudioDataSource, 0);
  objc_storeStrong((id *)&self->_playbackChartDataAudioDataSource, 0);
  objc_storeStrong((id *)&self->_playbackMixerDataSource, 0);
  objc_storeStrong((id *)&self->_playbackObserverUpdateTimer, 0);
  objc_storeStrong((id *)&self->_currentChartDescriptor, 0);
  objc_storeStrong((id *)&self->_continuousScrubbingTone, 0);
  objc_storeStrong(&self->_function, 0);
  objc_storeStrong((id *)&self->buffer, 0);
}

@end
