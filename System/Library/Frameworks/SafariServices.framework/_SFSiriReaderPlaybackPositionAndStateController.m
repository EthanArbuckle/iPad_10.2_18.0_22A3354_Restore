@implementation _SFSiriReaderPlaybackPositionAndStateController

- (void)prepareStepper:(id)a3
{
  _SFSettingsAlertStepperConfiguration **p_stepper;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  p_stepper = &self->_stepper;
  v9 = a3;
  objc_storeWeak((id *)p_stepper, v9);
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("gobackward"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setImage:forButton:", v5, 1);

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("goforward"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setImage:forButton:", v6, 0);

  objc_msgSend(MEMORY[0x1E0D4ED50], "sharedPlaybackController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isPlaying = objc_msgSend(v7, "currentPlaybackState") == 1;

  -[_SFSiriReaderPlaybackPositionAndStateController _imageForSiriIsPlaying:](self, "_imageForSiriIsPlaying:", self->_isPlaying);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setImage:forButton:", v8, 2);

  objc_msgSend(v9, "setEnabled:forButton:", 1, 2);
  objc_msgSend(v9, "setEnabled:forButton:", 1, 0);
  objc_msgSend(v9, "setEnabled:forButton:", 1, 1);

}

- (void)incrementValue:(id)a3
{
  id v3;

  objc_msgSend(MEMORY[0x1E0D4ED50], "sharedPlaybackController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "skipForward");

}

- (void)decrementValue:(id)a3
{
  id v3;

  objc_msgSend(MEMORY[0x1E0D4ED50], "sharedPlaybackController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "skipBackward");

}

- (void)resetValue:(id)a3
{
  _BOOL4 isPlaying;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_stepper);
  isPlaying = self->_isPlaying;
  objc_msgSend(MEMORY[0x1E0D4ED50], "sharedPlaybackController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (isPlaying)
    objc_msgSend(v5, "pause");
  else
    objc_msgSend(v5, "play");

  v7 = !self->_isPlaying;
  self->_isPlaying ^= 1u;
  -[_SFSiriReaderPlaybackPositionAndStateController _imageForSiriIsPlaying:](self, "_imageForSiriIsPlaying:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setImage:forButton:", v8, 2);

}

- (id)_imageForSiriIsPlaying:(BOOL)a3
{
  const __CFString *v3;

  if (a3)
    v3 = CFSTR("pause");
  else
    v3 = CFSTR("play");
  return (id)objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_stepper);
}

@end
