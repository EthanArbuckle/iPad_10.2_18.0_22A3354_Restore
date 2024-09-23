@implementation MRUWaveformViewController

- (MRUWaveformViewController)initWithContext:(unint64_t)a3 waveformController:(id)a4 settings:(id)a5
{
  id v9;
  id v10;
  MRUWaveformViewController *v11;
  MRUWaveformViewController *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MRUWaveformViewController;
  v11 = -[MRUWaveformViewController init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_settings, a5);
    objc_storeStrong((id *)&v12->_controller, a4);
    v12->_context = a3;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v12, sel_processInfoPowerStateDidChange_, *MEMORY[0x1E0CB3048], 0);

    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v12->_lowPowerModeEnabled = objc_msgSend(v14, "isLowPowerModeEnabled");

  }
  return v12;
}

- (MRUWaveformViewController)initWithContext:(unint64_t)a3 waveformController:(id)a4
{
  id v6;
  void *v7;
  MRUWaveformViewController *v8;

  v6 = a4;
  +[MRUWaveformSettings currentSettings](MRUWaveformSettings, "currentSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MRUWaveformViewController initWithContext:waveformController:settings:](self, "initWithContext:waveformController:settings:", a3, v6, v7);

  return v8;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)loadView
{
  MRUWaveformView *v3;
  MRUWaveformView *v4;

  v3 = [MRUWaveformView alloc];
  v4 = -[MRUWaveformView initWithFrame:context:settings:](v3, "initWithFrame:context:settings:", self->_context, self->_settings, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[MRUWaveformViewController setView:](self, "setView:", v4);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MRUWaveformViewController;
  -[MRUWaveformViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[MRUWaveformController setDelegate:](self->_controller, "setDelegate:", self);
  -[MRUWaveformViewController updateState](self, "updateState");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MRUWaveformViewController;
  -[MRUWaveformViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  self->_hasAppeared = 1;
  -[MRUWaveformViewController updateVisibility](self, "updateVisibility");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MRUWaveformViewController;
  -[MRUWaveformViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  self->_hasAppeared = 0;
  -[MRUWaveformViewController updateVisibility](self, "updateVisibility");
}

- (void)setOnScreen:(BOOL)a3
{
  if (self->_onScreen != a3)
  {
    self->_onScreen = a3;
    -[MRUWaveformViewController updateVisibility](self, "updateVisibility");
  }
}

- (void)setDimmed:(BOOL)a3
{
  _QWORD v5[5];
  BOOL v6;

  if (self->_dimmed != a3)
  {
    self->_dimmed = a3;
    -[MRUWaveformViewController updateVisibility](self, "updateVisibility");
    objc_msgSend(MEMORY[0x1E0DC4038], "_defaultAnimationDuration");
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __39__MRUWaveformViewController_setDimmed___block_invoke;
    v5[3] = &unk_1E5818D00;
    v5[4] = self;
    v6 = a3;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v5);
  }
}

void __39__MRUWaveformViewController_setDimmed___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDimmed:", v1);

}

- (void)updateVisibility
{
  _BOOL8 v3;

  v3 = -[MRUWaveformViewController isOnScreen](self, "isOnScreen") && self->_hasAppeared && !self->_dimmed;
  -[MRUWaveformController setVisible:](self->_controller, "setVisible:", v3);
}

- (void)updateWaveformWithData:(id)a3
{
  id v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  _BOOL4 v11;
  MRUWaveformSettings *settings;
  float v13;
  float v14;
  float v15;
  float v16;
  void *v17;
  double v18;
  MRUWaveformData *v19;
  MRUWaveformData *waveformData;
  MRUWaveformData *v21;
  _QWORD v22[5];
  MRUWaveformData *v23;
  int v24;
  int v25;
  int v26;

  v4 = a3;
  -[MRUWaveformViewController framerateRangeForData:](self, "framerateRangeForData:", v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[MRUWaveformController isPlaying](self->_controller, "isPlaying");
  settings = self->_settings;
  if (v11)
  {
    -[MRUWaveformSettings animationDuration](settings, "animationDuration");
    v14 = v13;
    -[MRUWaveformSettings springDamping](self->_settings, "springDamping");
  }
  else
  {
    -[MRUWaveformSettings pausedAnimationDuration](settings, "pausedAnimationDuration");
    v14 = v16;
    -[MRUWaveformSettings pausedSpringDamping](self->_settings, "pausedSpringDamping");
  }
  v17 = (void *)MEMORY[0x1E0DC3F10];
  v18 = v15;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __52__MRUWaveformViewController_updateWaveformWithData___block_invoke;
  v22[3] = &unk_1E5818D28;
  v24 = v6;
  v25 = v8;
  v26 = v10;
  v22[4] = self;
  v19 = (MRUWaveformData *)v4;
  v23 = v19;
  objc_msgSend(v17, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v22, 0, v14, 0.0, v18, 0.0);
  waveformData = self->_waveformData;
  self->_waveformData = v19;
  v21 = v19;

}

void __52__MRUWaveformViewController_updateWaveformWithData___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  _QWORD v7[5];
  id v8;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[2] = __52__MRUWaveformViewController_updateWaveformWithData___block_invoke_2;
  v7[3] = &unk_1E5818CB0;
  v2 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0DC3F10];
  v7[1] = 3221225472;
  v8 = v2;
  LODWORD(v4) = *(_DWORD *)(a1 + 48);
  LODWORD(v5) = *(_DWORD *)(a1 + 52);
  LODWORD(v6) = *(_DWORD *)(a1 + 56);
  objc_msgSend(v3, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1966083, v7, v4, v5, v6);

}

void __52__MRUWaveformViewController_updateWaveformWithData___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWaveformData:", v1);

}

- (CAFrameRateRange)framerateRangeForData:(id)a3
{
  id v4;
  float v5;
  float v6;
  float v7;
  MRUWaveformSettings *settings;
  int v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float minimum;
  float maximum;
  float preferred;
  float v21;
  float v22;
  float v23;
  CAFrameRateRange v24;
  CAFrameRateRange result;

  v4 = a3;
  if (-[MRUWaveformSettings supportsVariableFramerate](self->_settings, "supportsVariableFramerate"))
  {
    objc_msgSend(v4, "maxAbsoluteDifferenceFrom:", self->_waveformData);
    v6 = v5;
    v7 = (float)-[MRUWaveformSettings minimumFramerate](self->_settings, "minimumFramerate");
    settings = self->_settings;
    if (self->_lowPowerModeEnabled)
      v9 = -[MRUWaveformSettings lowPowerModeMaximumFramerate](settings, "lowPowerModeMaximumFramerate");
    else
      v9 = -[MRUWaveformSettings maximumFramerate](settings, "maximumFramerate");
    v15 = (float)v9;
    -[MRUWaveformSettings framerateThreshold](self->_settings, "framerateThreshold");
    v17 = v7 + (float)((float)(v6 / v16) * (float)(v15 - v7));
    if (v17 <= v15)
      v12 = v17;
    else
      v12 = v15;
    v13 = v7;
    v14 = v15;
  }
  else
  {
    v10 = (float)-[MRUWaveformSettings nonVariableFramerate](self->_settings, "nonVariableFramerate");
    v11 = (float)-[MRUWaveformSettings nonVariableFramerate](self->_settings, "nonVariableFramerate");
    v12 = (float)-[MRUWaveformSettings nonVariableFramerate](self->_settings, "nonVariableFramerate");
    v13 = v10;
    v14 = v11;
  }
  v24 = CAFrameRateRangeMake(v13, v14, v12);
  minimum = v24.minimum;
  maximum = v24.maximum;
  preferred = v24.preferred;

  v21 = minimum;
  v22 = maximum;
  v23 = preferred;
  result.preferred = v23;
  result.maximum = v22;
  result.minimum = v21;
  return result;
}

- (void)updateState
{
  void *v3;
  void *v4;
  id v5;

  -[MRUWaveformController artworkImage](self->_controller, "artworkImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUWaveformViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setArtworkImage:", v3);

  -[MRUWaveformController waveform](self->_controller, "waveform");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MRUWaveformViewController updateWaveformWithData:](self, "updateWaveformWithData:", v5);

}

- (void)waveformControllerTrackDidChange:(id)a3
{
  id v4;
  dispatch_time_t v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  self->_delayArtworkChange = 1;
  v5 = dispatch_time(0, 100000000);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__MRUWaveformViewController_waveformControllerTrackDidChange___block_invoke;
  v7[3] = &unk_1E5818CB0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_after(v5, MEMORY[0x1E0C80D38], v7);

}

void __62__MRUWaveformViewController_waveformControllerTrackDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 40), "artworkImage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setArtworkImage:", v2);

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 971) = 0;
}

- (void)waveformController:(id)a3 waveformDidChange:(id)a4
{
  -[MRUWaveformViewController updateWaveformWithData:](self, "updateWaveformWithData:", a4);
}

- (void)waveformController:(id)a3 artworkImageDidChange:(id)a4
{
  id v5;
  id v6;

  if (!a4 || !self->_delayArtworkChange)
  {
    v5 = a4;
    -[MRUWaveformViewController view](self, "view");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setArtworkImage:", v5);

  }
}

- (void)processInfoPowerStateDidChange:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__MRUWaveformViewController_processInfoPowerStateDidChange___block_invoke;
  block[3] = &unk_1E5818C88;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __60__MRUWaveformViewController_processInfoPowerStateDidChange___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setLowPowerModeEnabled:", objc_msgSend(v2, "isLowPowerModeEnabled"));

}

- (unint64_t)context
{
  return self->_context;
}

- (void)setContext:(unint64_t)a3
{
  self->_context = a3;
}

- (BOOL)isOnScreen
{
  return self->_onScreen;
}

- (BOOL)isDimmed
{
  return self->_dimmed;
}

- (MRUWaveformController)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
  objc_storeStrong((id *)&self->_controller, a3);
}

- (MRUWaveformSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
  objc_storeStrong((id *)&self->_settings, a3);
}

- (MRUWaveformData)waveformData
{
  return self->_waveformData;
}

- (void)setWaveformData:(id)a3
{
  objc_storeStrong((id *)&self->_waveformData, a3);
}

- (BOOL)hasAppeared
{
  return self->_hasAppeared;
}

- (void)setHasAppeared:(BOOL)a3
{
  self->_hasAppeared = a3;
}

- (BOOL)delayArtworkChange
{
  return self->_delayArtworkChange;
}

- (void)setDelayArtworkChange:(BOOL)a3
{
  self->_delayArtworkChange = a3;
}

- (BOOL)lowPowerModeEnabled
{
  return self->_lowPowerModeEnabled;
}

- (void)setLowPowerModeEnabled:(BOOL)a3
{
  self->_lowPowerModeEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waveformData, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_controller, 0);
}

@end
