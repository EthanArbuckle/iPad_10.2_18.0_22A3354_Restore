@implementation MNSoundEffectResourceController

- (MNSoundEffectResourceController)init
{
  MNSoundEffectResourceController *v2;
  MNSoundEffectResourceController *v3;
  MNSoundEffectResourceController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MNSoundEffectResourceController;
  v2 = -[MNSoundEffectResourceController init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[MNSoundEffectResourceController _registerForObservation](v2, "_registerForObservation");
    v3->_indicatorID = 3;
    v4 = v3;
  }

  return v3;
}

- (void)_registerForObservation
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  GetAudioLogForMNSoundEffectResourceControllerCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_DEBUG, "ⓧ Registering observers", v5, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__audioSessionInterruption_, *MEMORY[0x1E0CFF008], 0);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__mediaSessionServicesWereLost_, *MEMORY[0x1E0CFF058], 0);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__mediaSessionServicesWereReset_, *MEMORY[0x1E0CFF070], 0);

}

- (AVAudioPlayer)approach
{
  AVAudioPlayer *approach;
  AVAudioPlayer *v4;
  AVAudioPlayer *v5;

  approach = self->_approach;
  if (!approach)
  {
    -[MNSoundEffectResourceController _playerForFileName:andExtension:](self, "_playerForFileName:andExtension:", CFSTR("Approach"), CFSTR("caf"));
    v4 = (AVAudioPlayer *)objc_claimAutoreleasedReturnValue();
    v5 = self->_approach;
    self->_approach = v4;

    -[AVAudioPlayer setDelegate:](self->_approach, "setDelegate:", self);
    approach = self->_approach;
  }
  return approach;
}

- (AVAudioPlayer)leftTurn
{
  AVAudioPlayer *leftTurn;
  AVAudioPlayer *v4;
  AVAudioPlayer *v5;

  leftTurn = self->_leftTurn;
  if (!leftTurn)
  {
    -[MNSoundEffectResourceController _playerForFileName:andExtension:](self, "_playerForFileName:andExtension:", CFSTR("TurnLeft"), CFSTR("caf"));
    v4 = (AVAudioPlayer *)objc_claimAutoreleasedReturnValue();
    v5 = self->_leftTurn;
    self->_leftTurn = v4;

    -[AVAudioPlayer setDelegate:](self->_leftTurn, "setDelegate:", self);
    leftTurn = self->_leftTurn;
  }
  return leftTurn;
}

- (AVAudioPlayer)rightTurn
{
  AVAudioPlayer *rightTurn;
  AVAudioPlayer *v4;
  AVAudioPlayer *v5;

  rightTurn = self->_rightTurn;
  if (!rightTurn)
  {
    -[MNSoundEffectResourceController _playerForFileName:andExtension:](self, "_playerForFileName:andExtension:", CFSTR("TurnRight"), CFSTR("caf"));
    v4 = (AVAudioPlayer *)objc_claimAutoreleasedReturnValue();
    v5 = self->_rightTurn;
    self->_rightTurn = v4;

    -[AVAudioPlayer setDelegate:](self->_rightTurn, "setDelegate:", self);
    rightTurn = self->_rightTurn;
  }
  return rightTurn;
}

- (BOOL)playing
{
  return -[AVAudioPlayer isPlaying](self->_approach, "isPlaying")
      || -[AVAudioPlayer isPlaying](self->_leftTurn, "isPlaying")
      || -[AVAudioPlayer isPlaying](self->_rightTurn, "isPlaying");
}

- (BOOL)playSound:(unint64_t)a3 andReport:(id *)a4
{
  void *v5;
  void *v6;
  char v7;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  int v20;
  unint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a3 < 3)
  {
    -[MNSoundEffectResourceController stop](self, "stop");
    GetAudioLogForMNSoundEffectResourceControllerCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v20 = 134217984;
      v21 = a3;
      _os_log_impl(&dword_1B0AD7000, v10, OS_LOG_TYPE_INFO, "Ⓧ Attempting to start playing id %lu", (uint8_t *)&v20, 0xCu);
    }

    if (a3 == 2)
    {
      -[MNSoundEffectResourceController rightTurn](self, "rightTurn");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a3 == 1)
        -[MNSoundEffectResourceController leftTurn](self, "leftTurn");
      else
        -[MNSoundEffectResourceController approach](self, "approach");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;
    v7 = objc_msgSend(v11, "play");
    GetAudioLogForMNSoundEffectResourceControllerCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if ((v7 & 1) != 0)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_1B0AD7000, v14, OS_LOG_TYPE_INFO, "Ⓧ    Playback was successfully started", (uint8_t *)&v20, 2u);
      }

      self->_indicatorID = a3;
      -[MNSoundEffectResourceController delegate](self, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_opt_respondsToSelector();

      if ((v16 & 1) == 0)
        goto LABEL_23;
      -[MNSoundEffectResourceController delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "soundEffectResourceController:willStartPlayingIndicator:", self, self->_indicatorID);
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v20 = 134217984;
        v21 = a3;
        _os_log_impl(&dword_1B0AD7000, v14, OS_LOG_TYPE_ERROR, "⒳    Error trying to play id %lu (this is a problem in AVAudioPlayer)", (uint8_t *)&v20, 0xCu);
      }

      if (!a4)
        goto LABEL_23;
      v18 = (void *)MEMORY[0x1E0CB35C8];
      NAVAudioErrorDomain();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "errorWithDomain:code:userInfo:", v17, 3700, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_23:
    return v7;
  }
  if (a4)
  {
    v5 = (void *)MEMORY[0x1E0CB35C8];
    NAVAudioErrorDomain();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, 3500, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

- (void)stop
{
  NSObject *v3;
  uint8_t v4[16];

  if (-[MNSoundEffectResourceController playing](self, "playing"))
  {
    GetAudioLogForMNSoundEffectResourceControllerCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_INFO, "ⓧ Stopping sound playback", v4, 2u);
    }

    -[AVAudioPlayer stop](self->_approach, "stop");
    -[AVAudioPlayer setCurrentTime:](self->_approach, "setCurrentTime:", 0.0);
    -[AVAudioPlayer stop](self->_leftTurn, "stop");
    -[AVAudioPlayer setCurrentTime:](self->_leftTurn, "setCurrentTime:", 0.0);
    -[AVAudioPlayer stop](self->_rightTurn, "stop");
    -[AVAudioPlayer setCurrentTime:](self->_rightTurn, "setCurrentTime:", 0.0);
    self->_indicatorID = 3;
  }
}

- (id)_playerForFileName:(id)a3 andExtension:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length") && objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "_navigationBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLForResource:withExtension:", v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = 0;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C89AC8]), "initWithContentsOfURL:error:", v8, &v14);
    v10 = v14;
    if (v10)
    {
      GetAudioLogForMNSoundEffectResourceControllerCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v16 = v5;
        v17 = 2112;
        v18 = v6;
        v19 = 2112;
        v20 = v10;
        _os_log_impl(&dword_1B0AD7000, v11, OS_LOG_TYPE_ERROR, "⒳    Error creating player for %@.%@ - %@", buf, 0x20u);
      }

      v12 = 0;
    }
    else
    {
      v12 = v9;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  _BOOL4 v20;
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  GetAudioLogForMNSoundEffectResourceControllerCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v15 = 136315650;
    v16 = "-[MNSoundEffectResourceController audioPlayerDidFinishPlaying:successfully:]";
    v17 = 2112;
    v18 = v6;
    v19 = 1024;
    v20 = v4;
    _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_INFO, "ⓧ %s : %@ : %d", (uint8_t *)&v15, 0x1Cu);
  }

  -[MNSoundEffectResourceController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[MNSoundEffectResourceController delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "soundEffectResourceController:didFinishPlayingIndicator:", self, self->_indicatorID);
LABEL_8:

    }
  }
  else
  {
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      NAVAudioErrorDomain();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 3701, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[MNSoundEffectResourceController delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "soundEffectResourceController:didFailWhilePlayingIndicator:withError:", self, self->_indicatorID, v10);

      goto LABEL_8;
    }
  }

}

- (void)audioPlayerDecodeErrorDidOccur:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  GetAudioLogForMNSoundEffectResourceControllerCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v19 = "-[MNSoundEffectResourceController audioPlayerDecodeErrorDidOccur:error:]";
    v20 = 2112;
    v21 = v6;
    v22 = 2112;
    v23 = v7;
    _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_INFO, "ⓧ %s : %@ : %@", buf, 0x20u);
  }

  -[MNSoundEffectResourceController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    NAVAudioErrorDomain();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *MEMORY[0x1E0CB3388];
    v17 = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 3702, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[MNSoundEffectResourceController delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "soundEffectResourceController:didFailWhilePlayingIndicator:withError:", self, self->_indicatorID, v14);

  }
}

- (void)_audioSessionInterruption:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  _QWORD *v9;
  void *v10;
  unint64_t indicatorID;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CFF038]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  if (v6 == 1 && -[MNSoundEffectResourceController playing](self, "playing"))
  {
    GetAudioLogForMNSoundEffectResourceControllerCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
    v9 = (_QWORD *)MEMORY[0x1E0CFF028];
    if (v8)
    {
      objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CFF028]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v23 = v10;
      _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_INFO, "ⓧ Media services were interrupted - %@", buf, 0xCu);

    }
    indicatorID = self->_indicatorID;
    -[MNSoundEffectResourceController stop](self, "stop");
    -[MNSoundEffectResourceController delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      NAVAudioErrorDomain();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKey:", *v9, *MEMORY[0x1E0CB3388]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 0, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      -[MNSoundEffectResourceController delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "soundEffectResourceController:wasInterruptedWhilePlayingIndicator:withError:", self, indicatorID, v18);

    }
  }

}

- (void)_mediaSessionServicesWereLost:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  GetAudioLogForMNSoundEffectResourceControllerCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B0AD7000, v4, OS_LOG_TYPE_INFO, "ⓧ Media services were lost", v5, 2u);
  }

  -[MNSoundEffectResourceController stop](self, "stop");
}

- (void)_mediaSessionServicesWereReset:(id)a3
{
  NSObject *v4;
  AVAudioPlayer *approach;
  AVAudioPlayer *leftTurn;
  AVAudioPlayer *rightTurn;
  uint8_t v8[16];

  GetAudioLogForMNSoundEffectResourceControllerCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1B0AD7000, v4, OS_LOG_TYPE_INFO, "ⓧ Media services were reset", v8, 2u);
  }

  approach = self->_approach;
  self->_approach = 0;

  leftTurn = self->_leftTurn;
  self->_leftTurn = 0;

  rightTurn = self->_rightTurn;
  self->_rightTurn = 0;

}

- (MNSoundEffectControllerDelegate)delegate
{
  return (MNSoundEffectControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setApproach:(id)a3
{
  objc_storeStrong((id *)&self->_approach, a3);
}

- (void)setLeftTurn:(id)a3
{
  objc_storeStrong((id *)&self->_leftTurn, a3);
}

- (void)setRightTurn:(id)a3
{
  objc_storeStrong((id *)&self->_rightTurn, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightTurn, 0);
  objc_storeStrong((id *)&self->_leftTurn, 0);
  objc_storeStrong((id *)&self->_approach, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
