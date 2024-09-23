@implementation MRUSystemVolumeController

- (unsigned)volumeCapabilitiesForType:(int64_t)a3
{
  void *v3;
  unsigned int v4;

  -[MRUSystemVolumeController volumeControllerForType:](self, "volumeControllerForType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "volumeCapabilities");

  return v4;
}

- (id)volumeControllerForType:(int64_t)a3
{
  if ((unint64_t)a3 <= 2)
    self = (MRUSystemVolumeController *)*((id *)&self->_systemVolumeController + a3);
  return self;
}

- (MRUSystemVolumeController)initWithOutputDeviceRouteController:(id)a3
{
  id v5;
  MRUSystemVolumeController *v6;
  MRUSystemVolumeController *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  MPVolumeController *systemVolumeController;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MRUSystemVolumeController;
  v6 = -[MRUSystemVolumeController init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_outputDeviceRouteController, a3);
    -[MRUSystemOutputDeviceRouteController addObserver:](v7->_outputDeviceRouteController, "addObserver:", v7);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("Audio/Video"), CFSTR("MediaPlayback"), CFSTR("Alarm"), CFSTR("Ringtone"), CFSTR("PhoneCall"), CFSTR("VoiceCommand"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC2540]), "initWithVolumeAudioCategories:", v8);
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CC2530]), "initWithDataSource:", v9);
    systemVolumeController = v7->_systemVolumeController;
    v7->_systemVolumeController = (MPVolumeController *)v10;

    -[MPVolumeController setDelegate:](v7->_systemVolumeController, "setDelegate:", v7);
    -[MRUSystemVolumeController updateVolumeControllers](v7, "updateVolumeControllers");

  }
  return v7;
}

- (NSString)volumeAudioCategory
{
  return -[MPVolumeController volumeAudioCategory](self->_systemVolumeController, "volumeAudioCategory");
}

- (float)volumeValueForType:(int64_t)a3
{
  void *v3;
  char v4;
  float v5;
  float v6;

  -[MRUSystemVolumeController volumeControllerForType:](self, "volumeControllerForType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "volumeCapabilities");
  objc_msgSend(v3, "volumeValue");
  if ((v4 & 2) != 0)
    v6 = v5;
  else
    v6 = 1.0;

  return v6;
}

- (void)setVolumeValue:(float)a3 forType:(int64_t)a4
{
  double v5;
  double v6;
  id v7;

  -[MRUSystemVolumeController volumeControllerForType:](self, "volumeControllerForType:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = 1036831949;
  *(float *)&v6 = a3;
  objc_msgSend(v7, "setVolume:withNotificationDelay:", v6, v5);

}

- (void)increaseVolume
{
  -[MPVolumeController increaseVolume](self->_systemVolumeController, "increaseVolume");
}

- (void)decreaseVolume
{
  -[MPVolumeController decreaseVolume](self->_systemVolumeController, "decreaseVolume");
}

+ (id)packageStateForVolumeValue:(float)a3
{
  const __CFString *v4;

  if (a3 <= 0.00000011921)
    return CFSTR("mute");
  if (a3 < 0.33)
    return CFSTR("min");
  if (a3 >= 1.0)
    v4 = CFSTR("max");
  else
    v4 = CFSTR("full");
  if (a3 >= 0.66)
    return (id)v4;
  else
    return CFSTR("half");
}

- (void)volumeController:(id)a3 volumeValueDidChange:(float)a4
{
  id v6;
  int64_t v7;
  uint64_t v8;
  double v9;
  id WeakRetained;

  v6 = a3;
  v7 = -[MRUSystemVolumeController typeForVolumeController:](self, "typeForVolumeController:", v6);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = objc_msgSend(v6, "volumeCapabilities");

  *(float *)&v9 = a4;
  objc_msgSend(WeakRetained, "systemVolumeController:didChangeVolumeControlCapabilities:effectiveVolumeValue:forType:", self, v8, v7, v9);

}

- (void)volumeController:(id)a3 volumeControlCapabilitiesDidChange:(unsigned int)a4
{
  uint64_t v4;
  int64_t v6;
  float v7;
  float v8;
  id WeakRetained;
  double v10;
  id v11;

  v4 = *(_QWORD *)&a4;
  v11 = a3;
  v6 = -[MRUSystemVolumeController typeForVolumeController:](self, "typeForVolumeController:");
  v7 = 1.0;
  if ((v4 & 2) != 0)
  {
    objc_msgSend(v11, "volumeValue");
    v7 = v8;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  *(float *)&v10 = v7;
  objc_msgSend(WeakRetained, "systemVolumeController:didChangeVolumeControlCapabilities:effectiveVolumeValue:forType:", self, v4, v6, v10);

}

- (void)updateVolumeControllers
{
  id v3;
  void *v4;
  void *v5;
  MPVolumeController *v6;
  MPVolumeController *primaryVolumeController;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  MPVolumeController *v12;
  MPVolumeController *secondaryVolumeController;
  MPVolumeController *v14;
  MPVolumeController *v15;
  uint64_t v16;

  if (-[MRUSystemOutputDeviceRouteController isSplitRoute](self->_outputDeviceRouteController, "isSplitRoute"))
  {
    v3 = objc_alloc(MEMORY[0x1E0CC2538]);
    -[MRUSystemOutputDeviceRouteController systemRoute](self->_outputDeviceRouteController, "systemRoute");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUSystemOutputDeviceRouteController primaryOutputDeviceRoute](self->_outputDeviceRouteController, "primaryOutputDeviceRoute");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v3, "initWithGroupRoute:outputDeviceRoute:", v4, v5);

    v6 = (MPVolumeController *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC2530]), "initWithDataSource:", v16);
    primaryVolumeController = self->_primaryVolumeController;
    self->_primaryVolumeController = v6;

    -[MPVolumeController setDelegate:](self->_primaryVolumeController, "setDelegate:", self);
    v8 = objc_alloc(MEMORY[0x1E0CC2538]);
    -[MRUSystemOutputDeviceRouteController systemRoute](self->_outputDeviceRouteController, "systemRoute");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUSystemOutputDeviceRouteController secondaryOutputDeviceRoute](self->_outputDeviceRouteController, "secondaryOutputDeviceRoute");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v8, "initWithGroupRoute:outputDeviceRoute:", v9, v10);

    v12 = (MPVolumeController *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC2530]), "initWithDataSource:", v11);
    secondaryVolumeController = self->_secondaryVolumeController;
    self->_secondaryVolumeController = v12;

    -[MPVolumeController setDelegate:](self->_secondaryVolumeController, "setDelegate:", self);
    v14 = (MPVolumeController *)v16;
  }
  else
  {
    -[MPVolumeController setDelegate:](self->_primaryVolumeController, "setDelegate:", 0);
    v15 = self->_primaryVolumeController;
    self->_primaryVolumeController = 0;

    -[MPVolumeController setDelegate:](self->_secondaryVolumeController, "setDelegate:", 0);
    v14 = self->_secondaryVolumeController;
    self->_secondaryVolumeController = 0;
  }

}

- (int64_t)typeForVolumeController:(id)a3
{
  if (self->_primaryVolumeController == a3)
    return 1;
  else
    return 2 * (self->_secondaryVolumeController == a3);
}

- (MRUSystemOutputDeviceRouteController)outputDeviceRouteController
{
  return self->_outputDeviceRouteController;
}

- (MRUSystemVolumeControllerDelegate)delegate
{
  return (MRUSystemVolumeControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MPVolumeController)systemVolumeController
{
  return self->_systemVolumeController;
}

- (MPVolumeController)primaryVolumeController
{
  return self->_primaryVolumeController;
}

- (MPVolumeController)secondaryVolumeController
{
  return self->_secondaryVolumeController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryVolumeController, 0);
  objc_storeStrong((id *)&self->_primaryVolumeController, 0);
  objc_storeStrong((id *)&self->_systemVolumeController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_outputDeviceRouteController, 0);
}

@end
