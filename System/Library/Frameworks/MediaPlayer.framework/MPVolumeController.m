@implementation MPVolumeController

- (unsigned)volumeCapabilities
{
  return -[MPVolumeControllerDataSource volumeControlCapabilities](self->_dataSource, "volumeControlCapabilities");
}

- (void)updateVolumeValue
{
  -[MPVolumeControllerDataSource reload](self->_dataSource, "reload");
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MPVolumeController)init
{
  MPVolumeControllerSystemDataSource *v3;
  MPVolumeController *v4;

  v3 = objc_alloc_init(MPVolumeControllerSystemDataSource);
  v4 = -[MPVolumeController initWithDataSource:](self, "initWithDataSource:", v3);

  return v4;
}

- (MPVolumeController)initWithDataSource:(id)a3
{
  id v4;
  MPVolumeController *v5;
  MPVolumeController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MPVolumeController;
  v5 = -[MPVolumeController init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[MPVolumeController setDataSource:](v5, "setDataSource:", v4);

  return v6;
}

- (void)setDataSource:(id)a3
{
  MPVolumeControllerDataSource *v6;
  void *v7;
  MPVolumeControllerDataSource *v8;

  v6 = (MPVolumeControllerDataSource *)a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPVolumeController.m"), 190, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataSource"));

    v6 = 0;
  }
  if (self->_dataSource != v6)
  {
    v8 = v6;
    objc_storeStrong((id *)&self->_dataSource, a3);
    -[MPVolumeControllerDataSource setDelegate:](self->_dataSource, "setDelegate:", self);
    -[MPVolumeControllerDataSource initializeVolume](self->_dataSource, "initializeVolume");
    v6 = v8;
  }

}

- (NSString)volumeAudioCategory
{
  return (NSString *)-[MPVolumeControllerDataSource volumeAudioCategory](self->_dataSource, "volumeAudioCategory");
}

- (void)volumeControllerDataSource:(id)a3 didChangeVolumeControlAvailability:(BOOL)a4
{
  _BOOL8 v4;
  NSObject *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  _BOOL4 v11;
  uint64_t v12;

  v4 = a4;
  v12 = *MEMORY[0x1E0C80C00];
  v6 = os_log_create("com.apple.amp.mediaplayer", "Volume");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = objc_opt_class();
    v10 = 1024;
    v11 = v4;
    _os_log_impl(&dword_193B9B000, v6, OS_LOG_TYPE_DEFAULT, "%@ volumeControlAvailableDidChange available: %{BOOL}u", (uint8_t *)&v8, 0x12u);
  }

  -[MPVolumeController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "volumeController:volumeControlAvailableDidChange:", self, v4);

}

- (void)volumeControllerDataSource:(id)a3 didChangeVolumeCapabilities:(unsigned int)a4
{
  uint64_t v4;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v4 = *(_QWORD *)&a4;
  v14 = *MEMORY[0x1E0C80C00];
  v6 = os_log_create("com.apple.amp.mediaplayer", "Volume");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_opt_class();
    v8 = (void *)MRMediaRemotePickedRouteVolumeControlCapabilitiesCopyDescription();
    v10 = 138412546;
    v11 = v7;
    v12 = 2114;
    v13 = v8;
    _os_log_impl(&dword_193B9B000, v6, OS_LOG_TYPE_DEFAULT, "%@ volumeControlCapabilitiesDidChange capabilities:%{public}@", (uint8_t *)&v10, 0x16u);

  }
  -[MPVolumeController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v9, "volumeController:volumeControlCapabilitiesDidChange:", self, v4);

}

- (void)volumeControllerDataSource:(id)a3 didChangeVolume:(float)a4 silenceVolumeHUD:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v8;
  void *v9;
  double v10;
  char v11;
  double v12;
  void *v13;

  v5 = a5;
  -[MPVolumeController delegate](self, "delegate", a3);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (!self->_volumeChangeCoalescingCount)
  {
    v13 = (void *)v8;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      *(float *)&v10 = a4;
      objc_msgSend(v13, "volumeController:volumeValueDidChange:silenceVolumeHUD:", self, v5, v10);
LABEL_6:
      v9 = v13;
      goto LABEL_7;
    }
    v11 = objc_opt_respondsToSelector();
    v9 = v13;
    if ((v11 & 1) != 0)
    {
      *(float *)&v12 = a4;
      objc_msgSend(v13, "volumeController:volumeValueDidChange:", self, v12);
      goto LABEL_6;
    }
  }
LABEL_7:

}

- (MPVolumeControllerDelegate)delegate
{
  return (MPVolumeControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)volumeControllerDataSource:(id)a3 didChangeMuted:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[MPVolumeController delegate](self, "delegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "volumeController:mutedStateDidChange:", self, v4);

}

- (float)volumeValue
{
  float result;

  -[MPVolumeControllerDataSource volume](self->_dataSource, "volume");
  return result;
}

- (BOOL)isVolumeControlAvailable
{
  return -[MPVolumeControllerDataSource isVolumeControlAvailable](self->_dataSource, "isVolumeControlAvailable");
}

- (NSString)volumeControlLabel
{
  return (NSString *)-[MPVolumeControllerDataSource volumeControlLabel](self->_dataSource, "volumeControlLabel");
}

- (void)setVolumeValue:(float)a3
{
  -[MPVolumeControllerDataSource setVolume:](self->_dataSource, "setVolume:");
}

- (BOOL)isMuted
{
  return -[MPVolumeControllerDataSource isMuted](self->_dataSource, "isMuted");
}

- (void)setMuted:(BOOL)a3
{
  -[MPVolumeControllerDataSource setMuted:](self->_dataSource, "setMuted:", a3);
}

- (void)adjustVolumeValue:(float)a3
{
  -[MPVolumeControllerDataSource adjustVolumeValue:](self->_dataSource, "adjustVolumeValue:");
}

- (void)getVolumeValueWithCompletion:(id)a3
{
  -[MPVolumeControllerDataSource getVolumeValueWithCompletion:](self->_dataSource, "getVolumeValueWithCompletion:", a3);
}

- (void)setVolume:(float)a3 withNotificationDelay:(float)a4
{
  _QWORD v7[5];
  float v8;
  float v9;

  if (-[MPVolumeController isVolumeControlAvailable](self, "isVolumeControlAvailable"))
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __54__MPVolumeController_setVolume_withNotificationDelay___block_invoke;
    v7[3] = &unk_1E3161620;
    v7[4] = self;
    v8 = a4;
    v9 = a3;
    dispatch_async(MEMORY[0x1E0C80D38], v7);
  }
}

- (void)beginIncreasingRelativeVolume
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[MPVolumeControllerDataSource beginIncreasingRelativeVolume](self->_dataSource, "beginIncreasingRelativeVolume");
}

- (void)endIncreasingRelativeVolume
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[MPVolumeControllerDataSource endIncreasingRelativeVolume](self->_dataSource, "endIncreasingRelativeVolume");
}

- (void)beginDecreasingRelativeVolume
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[MPVolumeControllerDataSource beginDecreasingRelativeVolume](self->_dataSource, "beginDecreasingRelativeVolume");
}

- (void)endDecreasingRelativeVolume
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[MPVolumeControllerDataSource endDecreasingRelativeVolume](self->_dataSource, "endDecreasingRelativeVolume");
}

- (void)increaseVolume
{
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MPVolumeControllerDataSource beginIncreasingRelativeVolume](self->_dataSource, "beginIncreasingRelativeVolume");
    -[MPVolumeControllerDataSource endIncreasingRelativeVolume](self->_dataSource, "endIncreasingRelativeVolume");
  }
}

- (void)decreaseVolume
{
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MPVolumeControllerDataSource beginDecreasingRelativeVolume](self->_dataSource, "beginDecreasingRelativeVolume");
    -[MPVolumeControllerDataSource endDecreasingRelativeVolume](self->_dataSource, "endDecreasingRelativeVolume");
  }
}

- (void)volumeControllerDataSource:(id)a3 didChangeVolume:(float)a4
{
  -[MPVolumeController volumeControllerDataSource:didChangeVolume:silenceVolumeHUD:](self, "volumeControllerDataSource:didChangeVolume:silenceVolumeHUD:", a3, 0);
}

- (void)volumeControllerDataSource:(id)a3 didChangeVolumeLabel:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[MPVolumeController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "volumeController:volumeControlLabelDidChange:", self, v6);

}

- (void)volumeControllerDataSource:(id)a3 didChangeVolumeAudioCategory:(id)a4
{
  id v4;

  +[MPVolumeHUDController sharedInstance](MPVolumeHUDController, "sharedInstance", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsUpdate");

}

- (void)setVolumeAudioCategory:(id)a3
{
  id v4;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[MPVolumeControllerDataSource setVolumeAudioCategory:](self->_dataSource, "setVolumeAudioCategory:", v4);

}

- (BOOL)volumeWarningEnabled
{
  return -[MPVolumeControllerDataSource volumeWarningEnabled](self->_dataSource, "volumeWarningEnabled");
}

- (int64_t)volumeWarningState
{
  return -[MPVolumeControllerDataSource volumeWarningState](self->_dataSource, "volumeWarningState");
}

- (float)EUVolumeLimit
{
  float result;

  -[MPVolumeControllerDataSource EUVolumeLimit](self->_dataSource, "EUVolumeLimit");
  return result;
}

- (BOOL)muted
{
  return -[MPVolumeControllerDataSource isMuted](self->_dataSource, "isMuted");
}

- (MPVolumeControllerDataSource)dataSource
{
  return self->_dataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __54__MPVolumeController_setVolume_withNotificationDelay___block_invoke(uint64_t a1)
{
  dispatch_time_t v2;
  double v3;
  _QWORD block[5];

  ++*(_DWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = dispatch_time(0, (uint64_t)(float)(*(float *)(a1 + 40) * 1000000000.0));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__MPVolumeController_setVolume_withNotificationDelay___block_invoke_2;
  block[3] = &unk_1E3163508;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E0C80D38], block);
  LODWORD(v3) = *(_DWORD *)(a1 + 44);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setVolume:", v3);
}

void __54__MPVolumeController_setVolume_withNotificationDelay___block_invoke_2(uint64_t a1)
{
  _DWORD *v2;
  uint64_t v3;
  id v4;

  --*(_DWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(_DWORD **)(a1 + 32);
  if (!v2[2])
  {
    objc_msgSend(v2, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v3 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(v3 + 24), "volume");
      objc_msgSend(v4, "volumeController:volumeValueDidChange:", v3);
    }

  }
}

+ (id)descriptionForWarningState:(int64_t)a3
{
  if ((unint64_t)a3 > 4)
    return 0;
  else
    return *(&off_1E31585E0 + a3);
}

@end
