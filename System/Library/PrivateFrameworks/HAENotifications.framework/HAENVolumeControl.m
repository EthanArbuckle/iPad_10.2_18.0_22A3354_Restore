@implementation HAENVolumeControl

+ (id)sharedInstance
{
  if (+[HAENDefaults isCurrentProcessMediaserverd](HAENDefaults, "isCurrentProcessMediaserverd")
    && sharedInstance_once_2 != -1)
  {
    dispatch_once(&sharedInstance_once_2, &__block_literal_global_4);
  }
  return (id)sharedInstance_instance_2;
}

void __35__HAENVolumeControl_sharedInstance__block_invoke()
{
  HAENVolumeControl *v0;
  void *v1;

  v0 = objc_alloc_init(HAENVolumeControl);
  v1 = (void *)sharedInstance_instance_2;
  sharedInstance_instance_2 = (uint64_t)v0;

}

- (HAENVolumeControl)init
{
  unsigned __int8 *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _BOOL8 v15;
  objc_super v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v17.receiver = self;
  v17.super_class = (Class)HAENVolumeControl;
  v2 = -[HAENVolumeControl init](&v17, sel_init);
  if (v2)
  {
    *((_DWORD *)v2 + 2) = getpid();
    *((_DWORD *)v2 + 10) = 0;
    +[HAENDefaults sharedInstance](HAENDefaults, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2[12] = objc_msgSend(v3, "isEUVolumeLimitOn");

    +[HAENDefaults sharedInstance](HAENDefaults, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v2[13] = objc_msgSend(v4, "isSKVolumeLimitOn");

    HAENotificationsLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v2[12]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v2[13]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v19 = v6;
      v20 = 2112;
      v21 = v7;
      _os_log_impl(&dword_2144B3000, v5, OS_LOG_TYPE_DEFAULT, "HAENVolumeControl: EU VLT [%@], South Korea VLT [%@]", buf, 0x16u);

    }
    v8 = objc_alloc_init(MEMORY[0x24BE0A230]);
    objc_msgSend(v8, "getPreferenceFor:", *MEMORY[0x24BE0A208]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v2[15] = objc_msgSend(v9, "BOOLValue");

    v2[16] = 0;
    __asm { FMOV            V0.2S, #-1.0 }
    *(_QWORD *)(v2 + 20) = _D0;
    v2[44] = 0;
    objc_msgSend(v2, "_updateFlags");
    if (v2[12])
      v15 = 1;
    else
      v15 = v2[13] != 0;
    objc_msgSend(v2, "_setMXVolumeLimit:", v15);
  }
  return (HAENVolumeControl *)v2;
}

- (float)computeLimitedVolume:(float)a3 event:(id)a4 action:(unsigned int *)a5
{
  unsigned int v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  float targetVolume80dB;
  float targetVolume74dB;
  void *v15;
  int v16;

  v8 = 1986817143;
  if (objc_msgSend(a4, "eventType") == 1818850917)
  {
    +[HAENDefaults sharedInstance](HAENDefaults, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "volumeReductionDelta");
    v11 = v10;

    v12 = a3 - v11;
  }
  else
  {
    if (-[HAENVolumeControl PME_enabled](self, "PME_enabled"))
    {
      targetVolume80dB = 0.5;
      targetVolume74dB = 0.38;
    }
    else
    {
      targetVolume80dB = self->_targetVolume80dB;
      if (targetVolume80dB <= 0.0 || (targetVolume74dB = self->_targetVolume74dB, targetVolume74dB <= 0.0))
      {
        +[HAENUnknownDeviceManager sharedInstance](HAENUnknownDeviceManager, "sharedInstance");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "unknownWiredHeadsetConnectedThroughB204");

        targetVolume74dB = 0.5;
        if (!v16)
          targetVolume74dB = 0.56;
        targetVolume80dB = 0.63;
        if (v16)
          targetVolume80dB = 0.59;
      }
    }
    if (targetVolume74dB > a3)
      targetVolume74dB = a3;
    if (a3 + -0.001 <= targetVolume80dB)
      targetVolume80dB = targetVolume74dB;
    v12 = targetVolume80dB;
    if (v12 + 0.001 >= a3)
      v8 = 1986814576;
    else
      v8 = 1986817143;
  }
  *a5 = v8;
  return fmin(fmax(v12, 0.0), 1.0);
}

- (float)getCurrentVolumeForCategory:(__CFString *)a3 route:(id *)a4
{
  NSObject *v4;

  -[HAENVolumeControl _fetchCategory:routeInfo:](self, "_fetchCategory:routeInfo:");
  if (!CMSessionManagerPerformVolumeOperationWithSequenceNumber())
    return -1.0;
  HAENotificationsLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[HAENVolumeControl getCurrentVolumeForCategory:route:].cold.1();

  return -1.0;
}

- (void)applyVolumeLoweringAtNextSession
{
  NSObject *v2;

  if (self->_lowerHeadphoneVolumeAtNextSession)
  {
    self->_lowerHeadphoneVolumeAtNextSession = 0;
    dispatch_get_global_queue(25, 0);
    v2 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v2, &__block_literal_global_5);

  }
}

void __53__HAENVolumeControl_applyVolumeLoweringAtNextSession__block_invoke(double a1)
{
  NSObject *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  LODWORD(a1) = 1057618919;
  objc_msgSend(MEMORY[0x24BE64998], "applyVolumeReductionToHeadphoneRoutes:", a1);
  HAENotificationsLog();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    v2 = 134217984;
    v3 = 0x3FE13F7CED916873;
    _os_log_impl(&dword_2144B3000, v1, OS_LOG_TYPE_DEFAULT, "headphone volume will be lowered to %.2f at the next session", (uint8_t *)&v2, 0xCu);
  }

}

- (unsigned)limitVolume:(id)a3
{
  NSObject *v4;
  uint8_t v6[16];

  HAENotificationsLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2144B3000, v4, OS_LOG_TYPE_DEFAULT, "headphone volume lowering will be delayed", v6, 2u);
  }

  self->_lowerHeadphoneVolumeAtNextSession = 1;
  return 1986814576;
}

- (void)limitVolumeTo:(float)a3 category:(__CFString *)a4 route:(id *)a5 actionResult:(unsigned int *)a6
{
  NSObject *v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  uint8_t buf[4];
  double v14;
  __int16 v15;
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  HAENotificationsLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v14 = a3;
    v15 = 2112;
    v16 = *(double *)&a4;
    _os_log_impl(&dword_2144B3000, v9, OS_LOG_TYPE_DEFAULT, ">>> limiting volume to %.2f for category %@, ", buf, 0x16u);
  }

  v10 = CMSessionManagerPerformVolumeOperationWithSequenceNumber();
  HAENotificationsLog();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[HAENVolumeControl limitVolumeTo:category:route:actionResult:].cold.1();

    *a6 = 561409132;
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v14 = *(double *)&a4;
      v15 = 2048;
      v16 = a3;
      _os_log_impl(&dword_2144B3000, v12, OS_LOG_TYPE_DEFAULT, "========> SET %@ volume to: %.2f", buf, 0x16u);
    }

  }
}

- (void)_fetchCategory:(__CFString *)a3 routeInfo:(id *)a4
{
  NSObject *v6;
  __CFString *var0;
  __CFString *var1;
  __CFString *var2;
  int v10;
  __CFString *v11;
  __int16 v12;
  __CFString *v13;
  __int16 v14;
  __CFString *v15;
  __int16 v16;
  __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  CMSessionMgrCopyDeviceRouteForRouteConfiguration();
  HAENotificationsLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    var0 = a4->var0;
    var1 = a4->var1;
    var2 = a4->var2;
    v10 = 138413058;
    v11 = a3;
    v12 = 2112;
    v13 = var0;
    v14 = 2112;
    v15 = var1;
    v16 = 2112;
    v17 = var2;
    _os_log_impl(&dword_2144B3000, v6, OS_LOG_TYPE_DEFAULT, ">>> category '%@', route: '%@', device: '%@', route subtype: '%@'", (uint8_t *)&v10, 0x2Au);
  }

}

- (void)_updateFlags
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  +[HAENDefaults sharedInstance](HAENDefaults, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  self->_haenFeatureEnabled = objc_msgSend(v3, "isHAENFeatureEnabled");

  HAENotificationsLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_haenFeatureEnabled);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_wiredHeadphoneConnected);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_2144B3000, v4, OS_LOG_TYPE_DEFAULT, "HAENVolumeControl: HAEN Feature [%@], wired headphone connected[%@]", (uint8_t *)&v7, 0x16u);

  }
}

- (void)_setMXVolumeLimit:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  const char *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x24BDAC8D0];
  self->_mxVolumeLimitOn = a3;
  v4 = objc_alloc_init(MEMORY[0x24BE0A230]);
  v5 = *MEMORY[0x24BE0A208];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v4, "setPreferenceFor:value:", v5, v6);

  HAENotificationsLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = "OFF";
    if (v3)
      v9 = "ON";
    v10 = 136315138;
    v11 = v9;
    _os_log_impl(&dword_2144B3000, v8, OS_LOG_TYPE_DEFAULT, "*** set MX VLT Status to [%s]", (uint8_t *)&v10, 0xCu);
  }

}

- (BOOL)_RLSAllowsMXVolumeLimit
{
  void *v2;
  uint64_t v3;
  void *v4;
  int v5;
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  +[HAENDefaults sharedInstance](HAENDefaults, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isReduceLoudSoundEnabled");

  +[HAENDefaults sharedInstance](HAENDefaults, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "getReduceLoudSoundThreshold");

  HAENotificationsLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v7;
    v11 = 1024;
    v12 = v5;
    _os_log_impl(&dword_2144B3000, v6, OS_LOG_TYPE_DEFAULT, "RLS volume limit %@, threshold %d", (uint8_t *)&v9, 0x12u);

  }
  if (v5 > 99)
    return 1;
  else
    return v3 ^ 1;
}

- (void)updateMXVolumeLimitStatus
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[HAENVolumeControl _updateFlags](self, "_updateFlags");
  -[HAENVolumeControl _updateMXVolumeLimit](self, "_updateMXVolumeLimit");
  os_unfair_lock_unlock(p_lock);
}

- (void)_updateMXVolumeLimit
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  HAENVolumeControl *v6;
  uint64_t v7;
  __int16 v8;
  __int16 v9;

  if (self->_wiredHeadphoneConnected
    && (self->_haenFeatureEnabled || self->_EUVolumeLimitFlagOn || self->_SKVolumeLimitFlagOn)
    && -[HAENVolumeControl _RLSAllowsMXVolumeLimit](self, "_RLSAllowsMXVolumeLimit"))
  {
    if (self->_mxVolumeLimitOn)
    {
      HAENotificationsLog();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 0;
        v4 = "mx volume limit is already on";
        v5 = (uint8_t *)&v9;
LABEL_14:
        _os_log_impl(&dword_2144B3000, v3, OS_LOG_TYPE_DEFAULT, v4, v5, 2u);
        goto LABEL_15;
      }
      goto LABEL_15;
    }
    v6 = self;
    v7 = 1;
LABEL_11:
    -[HAENVolumeControl _setMXVolumeLimit:](v6, "_setMXVolumeLimit:", v7);
    return;
  }
  if (self->_mxVolumeLimitOn)
  {
    v6 = self;
    v7 = 0;
    goto LABEL_11;
  }
  HAENotificationsLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 0;
    v4 = "mx volume limit is already off";
    v5 = (uint8_t *)&v8;
    goto LABEL_14;
  }
LABEL_15:

}

- (void)wiredHeadphoneConnected:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_wiredHeadphoneConnected = a3;
  -[HAENVolumeControl _updateFlags](self, "_updateFlags");
  -[HAENVolumeControl _updateMXVolumeLimit](self, "_updateMXVolumeLimit");
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)PME_enabled
{
  void *v2;
  void *v3;
  unint64_t v4;
  NSObject *v5;
  const char *v6;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (objc_opt_class())
  {
    objc_msgSend(MEMORY[0x24BE71AA0], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "personalMediaEnabled"))
    {
      objc_msgSend(MEMORY[0x24BE71AA0], "sharedInstance");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = ((unint64_t)objc_msgSend(v3, "personalAudioAccommodationTypes") >> 2) & 1;

    }
    else
    {
      LODWORD(v4) = 0;
    }

  }
  else
  {
    LODWORD(v4) = 0;
  }
  HAENotificationsLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = "OFF";
    if ((_DWORD)v4)
      v6 = "ON";
    v8 = 136315138;
    v9 = v6;
    _os_log_impl(&dword_2144B3000, v5, OS_LOG_TYPE_DEFAULT, "PME status: %s", (uint8_t *)&v8, 0xCu);
  }

  return v4;
}

- (void)setDeviceInfo:(id)a3
{
  id v4;
  void *v9;
  void *v10;
  void *v11;
  float v13;
  float v14;
  NSObject *v15;
  double targetVolume80dB;
  double targetVolume74dB;
  int v18;
  double v19;
  __int16 v20;
  double v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  __asm { FMOV            V0.2S, #-1.0 }
  *(_QWORD *)&self->_targetVolume80dB = _D0;
  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("_HAENMITSV80DB"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("_HAENMITSV74DB"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
      _ZF = v9 == 0;
    else
      _ZF = 1;
    if (!_ZF)
    {
      objc_msgSend(v10, "floatValue");
      self->_targetVolume74dB = v13;
      objc_msgSend(v9, "floatValue");
      self->_targetVolume80dB = v14;
      HAENotificationsLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        targetVolume80dB = self->_targetVolume80dB;
        targetVolume74dB = self->_targetVolume74dB;
        v18 = 134218240;
        v19 = targetVolume80dB;
        v20 = 2048;
        v21 = targetVolume74dB;
        _os_log_impl(&dword_2144B3000, v15, OS_LOG_TYPE_DEFAULT, "setting target scalar 80dB volume: %.2f, scalar 74dB volume: %.2f", (uint8_t *)&v18, 0x16u);
      }

    }
    os_unfair_lock_unlock(&self->_lock);

  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }

}

- ($C4267C7EEAC0F1C362AD94E813CFAD30)getStats
{
  HAENVolumeControl *v2;
  os_unfair_lock_s *p_lock;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  $C4267C7EEAC0F1C362AD94E813CFAD30 result;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = *(_QWORD *)&v2->_stats.currVolume;
  LODWORD(v2) = v2->_stats.volumeAction;
  os_unfair_lock_unlock(p_lock);
  v5 = v4;
  v6 = v2;
  result.var0 = *(float *)&v5;
  result.var1 = *((float *)&v5 + 1);
  result.var2 = v6;
  return result;
}

- (void)getCurrentVolumeForCategory:route:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2144B3000, v0, v1, "failed to get %@ volume %lld");
}

- (void)limitVolumeTo:category:route:actionResult:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2144B3000, v0, v1, "failed to SET %@ volume %lld");
}

@end
