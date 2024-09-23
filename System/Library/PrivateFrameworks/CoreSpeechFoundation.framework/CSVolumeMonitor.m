@implementation CSVolumeMonitor

- (CSVolumeMonitor)init
{
  CSVolumeMonitor *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSVolumeMonitor;
  v2 = -[CSEventMonitor init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("CSVolumeMonitor queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    -[CSVolumeMonitor fetchVolumeFromAVSystemControllerForAudioCategory:](v2, "fetchVolumeFromAVSystemControllerForAudioCategory:", CFSTR("Audio/Video"));
    -[CSVolumeMonitor fetchVolumeFromAVSystemControllerForAudioCategory:](v2, "fetchVolumeFromAVSystemControllerForAudioCategory:", CFSTR("Alarm"));
  }
  return v2;
}

- (void)_startMonitoringWithQueue:(id)a3
{
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[CSVolumeMonitor _startMonitoringWithQueue:]";
    _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v5, 0xCu);
  }
  -[CSVolumeMonitor _startObservingSystemControllerLifecycle](self, "_startObservingSystemControllerLifecycle");
  -[CSVolumeMonitor startObservingSystemVolumes](self, "startObservingSystemVolumes");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CSVolumeMonitor;
  -[CSEventMonitor dealloc](&v4, sel_dealloc);
}

- (void)_notifyObserver:(id)a3 volumeDidChanged:(float)a4 forAudioCategory:(id)a5
{
  id v8;
  double v9;
  double v10;
  id v11;

  v11 = a3;
  v8 = a5;
  -[CSEventMonitor notifyObserver:](self, "notifyObserver:", v11);
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("Audio/Video")))
  {
    self->_musicVolumeLevel = a4;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      *(float *)&v9 = a4;
      objc_msgSend(v11, "CSVolumeMonitor:didReceiveMusicVolumeChanged:", self, v9);
    }
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("Alarm")))
  {
    self->_alarmVolumeLevel = a4;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      *(float *)&v10 = a4;
      objc_msgSend(v11, "CSVolumeMonitor:didReceiveAlarmVolumeChanged:", self, v10);
    }
  }

}

- (float)musicVolume
{
  NSObject *queue;
  float v3;
  _QWORD v5[6];
  uint64_t v6;
  float *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = (float *)&v6;
  v8 = 0x2020000000;
  v9 = 1056964608;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__CSVolumeMonitor_musicVolume__block_invoke;
  v5[3] = &unk_1E6880D18;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)musicVolumeWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __45__CSVolumeMonitor_musicVolumeWithCompletion___block_invoke;
    v7[3] = &unk_1E6881160;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (float)alarmVolume
{
  NSObject *queue;
  float v3;
  _QWORD v5[6];
  uint64_t v6;
  float *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = (float *)&v6;
  v8 = 0x2020000000;
  v9 = 1056964608;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__CSVolumeMonitor_alarmVolume__block_invoke;
  v5[3] = &unk_1E6880D18;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)fetchVolumeFromAVSystemControllerForAudioCategory:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  CSVolumeMonitor *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__CSVolumeMonitor_fetchVolumeFromAVSystemControllerForAudioCategory___block_invoke;
  v7[3] = &unk_1E6880E88;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (BOOL)_fetchSystemVolumeForCategory:(id)a3 usingSystemController:(id)a4 volume:(float *)a5
{
  id v8;
  id v9;
  void *v10;
  BOOL v11;
  NSObject *v12;
  double v13;
  NSObject *v14;
  int v16;
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  double v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!a5)
    goto LABEL_11;
  v11 = 0;
  *a5 = 0.5;
  if (!v8 || !v9)
    goto LABEL_12;
  if (!-[CSVolumeMonitor _supportAVSystemVolumeFetch](self, "_supportAVSystemVolumeFetch"))
  {
    v14 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v16 = 136315138;
      v17 = "-[CSVolumeMonitor _fetchSystemVolumeForCategory:usingSystemController:volume:]";
      _os_log_error_impl(&dword_1B502E000, v14, OS_LOG_TYPE_ERROR, "%s Fetching system volume on wrong device.", (uint8_t *)&v16, 0xCu);
    }
    goto LABEL_11;
  }
  if (!objc_msgSend(v10, "getVolume:category:mode:route:deviceIdentifier:routeSubtype:", a5, v8, 0, CFSTR("Speaker"), CFSTR("PuffinOutput"), 0))
  {
LABEL_11:
    v11 = 0;
    goto LABEL_12;
  }
  v12 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v13 = *a5;
    v16 = 136315650;
    v17 = "-[CSVolumeMonitor _fetchSystemVolumeForCategory:usingSystemController:volume:]";
    v18 = 2114;
    v19 = v8;
    v20 = 2050;
    v21 = v13;
    _os_log_impl(&dword_1B502E000, v12, OS_LOG_TYPE_DEFAULT, "%s Fetched system volume for %{public}@ as %{public}f.", (uint8_t *)&v16, 0x20u);
  }
  v11 = 1;
LABEL_12:

  return v11;
}

- (void)systemVolumeDidChange:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__CSVolumeMonitor_systemVolumeDidChange___block_invoke;
  v7[3] = &unk_1E6880E88;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (float)_getNewSystemVolumesWithNotification:(id)a3 category:(id)a4
{
  id v6;
  id v7;
  int *v8;
  float v9;
  void *v10;
  void *v11;
  float v12;
  float v13;
  float v14;
  float v15;
  double v16;
  NSObject *v17;
  NSObject *v18;
  _QWORD v20[5];
  double v21;
  float v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  double v26;
  __int16 v27;
  double v28;
  __int16 v29;
  double v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("Audio/Video")) & 1) != 0)
  {
    v8 = &OBJC_IVAR___CSVolumeMonitor__musicVolumeLevel;
  }
  else
  {
    v9 = 0.0;
    if (!objc_msgSend(v7, "isEqualToString:", CFSTR("Alarm")))
      goto LABEL_6;
    v8 = &OBJC_IVAR___CSVolumeMonitor__alarmVolumeLevel;
  }
  v9 = *(float *)((char *)&self->super.super.isa + *v8);
LABEL_6:
  objc_msgSend(v6, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0D47ED0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "floatValue");
  v13 = v12;

  v14 = 1.0;
  if (v13 <= 1.0)
    v14 = v13;
  v15 = fmaxf(v14, 0.0);
  if (vabds_f32(v9, v15) <= 0.02)
  {
    v18 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v24 = "-[CSVolumeMonitor _getNewSystemVolumesWithNotification:category:]";
      v25 = 2050;
      v26 = v9;
      v27 = 2050;
      v28 = v15;
      _os_log_impl(&dword_1B502E000, v18, OS_LOG_TYPE_INFO, "%s Receiving fake system volume change: %{public}f -> %{public}f, ignoring...", buf, 0x20u);
    }
    v15 = v9;
  }
  else
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __65__CSVolumeMonitor__getNewSystemVolumesWithNotification_category___block_invoke;
    v20[3] = &unk_1E687ED28;
    v20[4] = self;
    v22 = v15;
    v16 = COERCE_DOUBLE(v7);
    v21 = v16;
    -[CSEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v20);
    v17 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v24 = "-[CSVolumeMonitor _getNewSystemVolumesWithNotification:category:]";
      v25 = 2114;
      v26 = v16;
      v27 = 2050;
      v28 = v9;
      v29 = 2050;
      v30 = v15;
      _os_log_impl(&dword_1B502E000, v17, OS_LOG_TYPE_DEFAULT, "%s Observer: system volume for category %{public}@, changed from %{public}f to %{public}f", buf, 0x2Au);
    }

  }
  return v15;
}

- (void)systemControllerDied:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[CSVolumeMonitor systemControllerDied:]";
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_1B502E000, v5, OS_LOG_TYPE_DEFAULT, "%s notification = %{public}@", (uint8_t *)&v6, 0x16u);
  }
  -[CSVolumeMonitor startObservingSystemVolumes](self, "startObservingSystemVolumes");

}

- (void)startObservingSystemVolumes
{
  void *v3;
  uint64_t *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  -[CSVolumeMonitor fetchVolumeFromAVSystemControllerForAudioCategory:](self, "fetchVolumeFromAVSystemControllerForAudioCategory:", CFSTR("Audio/Video"));
  -[CSVolumeMonitor fetchVolumeFromAVSystemControllerForAudioCategory:](self, "fetchVolumeFromAVSystemControllerForAudioCategory:", CFSTR("Alarm"));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (uint64_t *)MEMORY[0x1E0D482B8];
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0D482B8], 0);

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", *v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D48558], "sharedAVSystemController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttribute:forKey:error:", v9, *MEMORY[0x1E0D48288], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *v4;
  objc_msgSend(MEMORY[0x1E0D48558], "sharedAVSystemController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_systemVolumeDidChange_, v7, v8);

}

- (void)_startObservingSystemControllerLifecycle
{
  void *v3;
  uint64_t *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (uint64_t *)MEMORY[0x1E0D48208];
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0D48208], 0);

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", *v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D48558], "sharedAVSystemController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttribute:forKey:error:", v9, *MEMORY[0x1E0D48288], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *v4;
  objc_msgSend(MEMORY[0x1E0D48558], "sharedAVSystemController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_systemControllerDied_, v7, v8);

}

- (BOOL)_supportAVSystemVolumeFetch
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __65__CSVolumeMonitor__getNewSystemVolumesWithNotification_category___block_invoke(uint64_t a1, uint64_t a2, double a3)
{
  LODWORD(a3) = *(_DWORD *)(a1 + 48);
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserver:volumeDidChanged:forAudioCategory:", a2, *(_QWORD *)(a1 + 40), a3);
}

void __41__CSVolumeMonitor_systemVolumeDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int *v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __41__CSVolumeMonitor_systemVolumeDidChange___block_invoke_2;
  v14 = &unk_1E687FDC8;
  v2 = *(void **)(a1 + 40);
  v15 = *(id *)(a1 + 32);
  v16 = v2;
  objc_msgSend(v15, "enumerateObserversInQueue:", &v11);
  objc_msgSend(*(id *)(a1 + 40), "userInfo", v11, v12, v13, v14, v15);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D47EA0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D48558], "sharedAVSystemController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "volumeCategoryForAudioCategory:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "isEqualToString:", CFSTR("Audio/Video")))
    {
      v7 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v18 = "-[CSVolumeMonitor systemVolumeDidChange:]_block_invoke";
        v19 = 2114;
        v20 = v4;
        _os_log_impl(&dword_1B502E000, v7, OS_LOG_TYPE_DEFAULT, "%s Observer: received system volume change for audioCategory %{public}@", buf, 0x16u);
      }
      v8 = &OBJC_IVAR___CSVolumeMonitor__musicVolumeLevel;
    }
    else
    {
      if (!objc_msgSend(v6, "isEqualToString:", CFSTR("Alarm")))
      {
LABEL_11:

        goto LABEL_12;
      }
      v9 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v18 = "-[CSVolumeMonitor systemVolumeDidChange:]_block_invoke";
        v19 = 2114;
        v20 = v4;
        _os_log_impl(&dword_1B502E000, v9, OS_LOG_TYPE_DEFAULT, "%s Observer: received system volume change for audioCategory %{public}@", buf, 0x16u);
      }
      v8 = &OBJC_IVAR___CSVolumeMonitor__alarmVolumeLevel;
    }
    objc_msgSend(*(id *)(a1 + 32), "_getNewSystemVolumesWithNotification:category:", *(_QWORD *)(a1 + 40), v6);
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + *v8) = v10;
    goto LABEL_11;
  }
LABEL_12:

}

void __41__CSVolumeMonitor_systemVolumeDidChange___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "CSVolumeMonitor:systemVolumeDidChange:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __69__CSVolumeMonitor_fetchVolumeFromAVSystemControllerForAudioCategory___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  int *v12;
  uint64_t v13;
  int v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[CSVolumeMonitor fetchVolumeFromAVSystemControllerForAudioCategory:]_block_invoke";
    _os_log_impl(&dword_1B502E000, v2, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v14 = 1056964608;
  objc_msgSend(MEMORY[0x1E0D48558], "sharedAVSystemController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributeForKey:", *MEMORY[0x1E0D47FB0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if (v5)
  {
    v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[CSVolumeMonitor fetchVolumeFromAVSystemControllerForAudioCategory:]_block_invoke";
      _os_log_impl(&dword_1B502E000, v6, OS_LOG_TYPE_DEFAULT, "%s System is now muted, fetching volume as 0...", buf, 0xCu);
    }
    v7 = 0;
    v14 = 0;
  }
  else
  {
    objc_msgSend(v3, "volumeCategoryForAudioCategory:", *(_QWORD *)(a1 + 32));
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v7 = (void *)v8;
      if ((objc_msgSend(*(id *)(a1 + 40), "_fetchSystemVolumeForCategory:usingSystemController:volume:", v8, v3, &v14) & 1) == 0)
      {
        v9 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          v10 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 136315394;
          v16 = "-[CSVolumeMonitor fetchVolumeFromAVSystemControllerForAudioCategory:]_block_invoke";
          v17 = 2114;
          v18 = v10;
          _os_log_error_impl(&dword_1B502E000, v9, OS_LOG_TYPE_ERROR, "%s Unable to get the system volume for audio category %{public}@", buf, 0x16u);
        }
      }
    }
    else
    {
      v11 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        v13 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 136315394;
        v16 = "-[CSVolumeMonitor fetchVolumeFromAVSystemControllerForAudioCategory:]_block_invoke";
        v17 = 2114;
        v18 = v13;
        _os_log_error_impl(&dword_1B502E000, v11, OS_LOG_TYPE_ERROR, "%s Unable to get the volume category for audio category '%{public}@'", buf, 0x16u);
      }
      v7 = 0;
    }
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("Audio/Video")) & 1) != 0)
  {
    v12 = &OBJC_IVAR___CSVolumeMonitor__musicVolumeLevel;
LABEL_18:
    *(_DWORD *)(*(_QWORD *)(a1 + 40) + *v12) = v14;
    goto LABEL_19;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("Alarm")))
  {
    v12 = &OBJC_IVAR___CSVolumeMonitor__alarmVolumeLevel;
    goto LABEL_18;
  }
LABEL_19:

}

float __30__CSVolumeMonitor_alarmVolume__block_invoke(uint64_t a1)
{
  float result;

  result = *(float *)(*(_QWORD *)(a1 + 32) + 36);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __45__CSVolumeMonitor_musicVolumeWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, float))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(float *)(*(_QWORD *)(a1 + 32) + 32));
}

float __30__CSVolumeMonitor_musicVolume__block_invoke(uint64_t a1)
{
  float result;

  result = *(float *)(*(_QWORD *)(a1 + 32) + 32);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

+ (id)sharedInstance
{
  if (+[CSUtils isDarwinOS](CSUtils, "isDarwinOS"))
    return 0;
  if (sharedInstance_onceToken_4076 != -1)
    dispatch_once(&sharedInstance_onceToken_4076, &__block_literal_global_4077);
  return (id)sharedInstance__sharedInstance_4078;
}

void __33__CSVolumeMonitor_sharedInstance__block_invoke()
{
  CSVolumeMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(CSVolumeMonitor);
  v1 = (void *)sharedInstance__sharedInstance_4078;
  sharedInstance__sharedInstance_4078 = (uint64_t)v0;

}

@end
