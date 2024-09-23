@implementation HUComfortSoundsController

- (void)routesDidChange:(id)a3
{
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *routeUID;
  void *v11;
  _BOOL4 v12;
  void *v13;
  NSString *v14;
  void *v15;
  void *v16;
  void *v17;
  os_log_t *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  os_log_t v24;
  id v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  os_log_t v30;
  id v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  NSObject *audioQueue;
  char v38;
  void *v39;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  +[HUUtilities sharedUtilities](HUUtilities, "sharedUtilities", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearAudioRoutes");

  v5 = -[HUComfortSoundsController currentRouteSupported](self, "currentRouteSupported");
  +[HUUtilities sharedUtilities](HUUtilities, "sharedUtilities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentPickableAudioRoutes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "valueForKey:", CFSTR("AXSHARoutePicked"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v7;
  objc_msgSend(v7, "valueForKey:", CFSTR("AXSHARouteSpeaker"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v8, "isEqualToDictionary:", v9);

  routeUID = self->_routeUID;
  objc_msgSend(v8, "valueForKey:", CFSTR("RouteUID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[NSString isEqualToString:](routeUID, "isEqualToString:", v11);

  CSInitializeLogging();
  v13 = (void *)MEMORY[0x1E0CB3940];
  v14 = self->_routeUID;
  objc_msgSend(v8, "valueForKey:", CFSTR("RouteUID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("Route changed %d, %d - %@, %@ = %@"), v5, !v12, v14, v15, v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsController routesDidChange:]", 635, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (os_log_t *)MEMORY[0x1E0D2F918];
  v19 = (void *)*MEMORY[0x1E0D2F918];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F918], OS_LOG_TYPE_DEFAULT))
  {
    v20 = objc_retainAutorelease(v17);
    v21 = v19;
    *(_DWORD *)buf = 136446210;
    v42 = objc_msgSend(v20, "UTF8String");
    _os_log_impl(&dword_1DE311000, v21, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  if (!self->_holdingForCall)
  {
    if (v12 && v5)
    {
      if ((v38 & 1) != 0
        || !-[NSString length](self->_routeUID, "length")
        || !self->_selectedSound
        || !self->_temporaryAirpodsDisconnect)
      {
        goto LABEL_7;
      }
      CSInitializeLogging();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CS route changed. Starting"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsController routesDidChange:]", 654, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = *v18;
      if (os_log_type_enabled(*v18, OS_LOG_TYPE_DEFAULT))
      {
        v31 = objc_retainAutorelease(v29);
        v32 = v30;
        v33 = objc_msgSend(v31, "UTF8String");
        *(_DWORD *)buf = 136446210;
        v42 = v33;
        _os_log_impl(&dword_1DE311000, v32, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

      }
      +[HUComfortSoundsSettings sharedInstance](HUComfortSoundsSettings, "sharedInstance");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v34;
      v36 = 1;
    }
    else
    {
      if (self->_liveListenComfortSoundsSwitch)
        goto LABEL_7;
      audioQueue = self->_audioQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __45__HUComfortSoundsController_routesDidChange___block_invoke;
      block[3] = &unk_1EA8E8220;
      block[4] = self;
      dispatch_async(audioQueue, block);
      +[HUComfortSoundsSettings sharedInstance](HUComfortSoundsSettings, "sharedInstance");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v34;
      v36 = 0;
    }
    objc_msgSend(v34, "setComfortSoundsEnabled:", v36);

    goto LABEL_7;
  }
  CSInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CS route changed while holding for call"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsController routesDidChange:]", 639, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = *v18;
  if (os_log_type_enabled(*v18, OS_LOG_TYPE_DEFAULT))
  {
    v25 = objc_retainAutorelease(v23);
    v26 = v24;
    v27 = objc_msgSend(v25, "UTF8String");
    *(_DWORD *)buf = 136446210;
    v42 = v27;
    _os_log_impl(&dword_1DE311000, v26, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  -[HUComfortSoundsController callStatusDidChange:](self, "callStatusDidChange:", 0);
LABEL_7:
  -[HUComfortSoundsController _handleContinuitySessionCheck](self, "_handleContinuitySessionCheck");

}

- (BOOL)currentRouteSupported
{
  void *v2;
  char v3;

  +[HUUtilities sharedUtilities](HUUtilities, "sharedUtilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "currentRouteSupportsBackgroundSounds");

  return v3;
}

- (void)clearActiveRoute
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSString *routeUID;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  os_log_t *v12;
  void *v13;
  os_log_t *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  os_log_t v23;
  id v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  os_log_t v29;
  id v30;
  NSObject *v31;
  uint64_t v32;
  dispatch_time_t v33;
  void *v34;
  void *v35;
  os_log_t v36;
  id v37;
  NSObject *v38;
  uint64_t v39;
  _QWORD v40[5];
  uint8_t buf[4];
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __45__HUComfortSoundsController_clearActiveRoute__block_invoke;
  v40[3] = &unk_1EA8E8220;
  v40[4] = self;
  v3 = (void *)MEMORY[0x1DF0EB808](v40, a2);
  +[HUUtilities sharedUtilities](HUUtilities, "sharedUtilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentPickableAudioRoutes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "valueForKey:", CFSTR("AXSHARoutePicked"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  routeUID = self->_routeUID;
  objc_msgSend(v6, "valueForKey:", CFSTR("RouteUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[NSString isEqualToString:](routeUID, "isEqualToString:", v8);

  CSInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The temporary airpods disconnect mode is - %hhd"), self->_temporaryAirpodsDisconnect);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsController clearActiveRoute]", 606, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (os_log_t *)MEMORY[0x1E0D2F918];
  v13 = (void *)*MEMORY[0x1E0D2F918];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F918], OS_LOG_TYPE_DEFAULT))
  {
    v14 = v12;
    v15 = v6;
    v16 = v3;
    v17 = objc_retainAutorelease(v11);
    v18 = v13;
    v19 = v17;
    v3 = v16;
    v6 = v15;
    v12 = v14;
    v20 = objc_msgSend(v19, "UTF8String");
    *(_DWORD *)buf = 136446210;
    v42 = v20;
    _os_log_impl(&dword_1DE311000, v18, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  if (!-[HUComfortSoundsController isPlayingOnQueue](self, "isPlayingOnQueue") || v9)
  {
    if (v9)
    {
      CSInitializeLogging();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Turning off temporary airpods disconnect mode."));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsController clearActiveRoute]", 616, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *v12;
      if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
      {
        v24 = objc_retainAutorelease(v22);
        v25 = v23;
        v26 = objc_msgSend(v24, "UTF8String");
        *(_DWORD *)buf = 136446210;
        v42 = v26;
        _os_log_impl(&dword_1DE311000, v25, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

      }
      self->_temporaryAirpodsDisconnect = 0;
    }
    else if (!self->_temporaryAirpodsDisconnect)
    {
      CSInitializeLogging();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Clearing route now"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsController clearActiveRoute]", 621, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = *v12;
      if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
      {
        v37 = objc_retainAutorelease(v35);
        v38 = v36;
        v39 = objc_msgSend(v37, "UTF8String");
        *(_DWORD *)buf = 136446210;
        v42 = v39;
        _os_log_impl(&dword_1DE311000, v38, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

      }
      dispatch_async((dispatch_queue_t)self->_audioQueue, v3);
    }
  }
  else
  {
    CSInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Clearing route after grace period"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsController clearActiveRoute]", 610, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = *v12;
    if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
    {
      v30 = objc_retainAutorelease(v28);
      v31 = v29;
      v32 = objc_msgSend(v30, "UTF8String");
      *(_DWORD *)buf = 136446210;
      v42 = v32;
      _os_log_impl(&dword_1DE311000, v31, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    self->_temporaryAirpodsDisconnect = 1;
    v33 = dispatch_time(0, 15000000000);
    dispatch_after(v33, (dispatch_queue_t)self->_audioQueue, v3);
  }

}

void __45__HUComfortSoundsController_clearActiveRoute__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  if ((objc_msgSend(*(id *)(a1 + 32), "isPlayingOnQueue") & 1) == 0)
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(v2 + 152);
    *(_QWORD *)(v2 + 152) = 0;

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 81) = 0;
  }
}

- (BOOL)isPlayingOnQueue
{
  void *v3;
  char v4;
  void *v5;

  -[HUComfortSoundsController audioPlayerNodeA](self, "audioPlayerNodeA");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isPlaying") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[HUComfortSoundsController audioPlayerNodeB](self, "audioPlayerNodeB");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isPlaying");

  }
  return v4;
}

- (AVAudioPlayerNode)audioPlayerNodeB
{
  return self->_audioPlayerNodeB;
}

- (AVAudioPlayerNode)audioPlayerNodeA
{
  return self->_audioPlayerNodeA;
}

+ (id)sharedController
{
  if (sharedController_onceToken_2 != -1)
    dispatch_once(&sharedController_onceToken_2, &__block_literal_global_20);
  return (id)sharedController_Controller_1;
}

void __45__HUComfortSoundsController_sharedController__block_invoke()
{
  HUComfortSoundsController *v0;
  void *v1;

  v0 = objc_alloc_init(HUComfortSoundsController);
  v1 = (void *)sharedController_Controller_1;
  sharedController_Controller_1 = (uint64_t)v0;

}

- (HUComfortSoundsController)init
{
  char *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  os_log_t *v20;
  void *v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  void *v26;
  void *v27;
  os_log_t v28;
  id v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  HUComfortSoundsAssetManager *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  char *v39;
  void *v40;
  char *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  char *v47;
  _QWORD block[4];
  char *v50;
  _QWORD v51[4];
  id v52;
  _QWORD v53[4];
  id v54;
  _QWORD v55[4];
  id v56;
  _QWORD v57[4];
  id v58;
  _QWORD v59[4];
  char *v60;
  id v61;
  _QWORD v62[4];
  char *v63;
  id v64;
  objc_super v65;
  uint8_t buf[4];
  uint64_t v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v65.receiver = self;
  v65.super_class = (Class)HUComfortSoundsController;
  v2 = -[HUComfortSoundsController init](&v65, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("comfort_sounds_audio", v3);
    v5 = (void *)*((_QWORD *)v2 + 18);
    *((_QWORD *)v2 + 18) = v4;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSince1970");
    v8 = v7;
    v9 = objc_msgSend(MEMORY[0x1E0D2F990], "systemBootTime");

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSince1970");
    v12 = v11;
    +[HUComfortSoundsSettings sharedInstance](HUComfortSoundsSettings, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lastEnablementTimestamp");
    v15 = v14;

    CSInitializeLogging();
    v16 = v8 - (double)v9;
    v17 = v12 - v15;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Starting up (%f, %f)"), *(_QWORD *)&v16, *(_QWORD *)&v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsController init]", 132, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (os_log_t *)MEMORY[0x1E0D2F918];
    v21 = (void *)*MEMORY[0x1E0D2F918];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F918], OS_LOG_TYPE_DEFAULT))
    {
      v22 = objc_retainAutorelease(v19);
      v23 = v21;
      v24 = objc_msgSend(v22, "UTF8String");
      *(_DWORD *)buf = 136446210;
      v67 = v24;
      _os_log_impl(&dword_1DE311000, v23, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    if (v16 < 90.0 && v17 > v16)
    {
      CSInitializeLogging();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Recently rebooted (%f, %f). Disabling"), *(_QWORD *)&v16, *(_QWORD *)&v17);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsController init]", 135, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = *v20;
      if (os_log_type_enabled(*v20, OS_LOG_TYPE_DEFAULT))
      {
        v29 = objc_retainAutorelease(v27);
        v30 = v28;
        v31 = objc_msgSend(v29, "UTF8String");
        *(_DWORD *)buf = 136446210;
        v67 = v31;
        _os_log_impl(&dword_1DE311000, v30, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

      }
      +[HUComfortSoundsSettings sharedInstance](HUComfortSoundsSettings, "sharedInstance");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setComfortSoundsEnabled:", 0);

    }
    *(_OWORD *)(v2 + 40) = xmmword_1DE38FFA0;
    *(_OWORD *)(v2 + 56) = xmmword_1DE38FFB0;
    *((_QWORD *)v2 + 9) = 0x3FA1111111111111;
    v33 = objc_alloc_init(HUComfortSoundsAssetManager);
    v34 = (void *)*((_QWORD *)v2 + 22);
    *((_QWORD *)v2 + 22) = v33;

    objc_msgSend(*((id *)v2 + 22), "setDelegate:", v2);
    +[HUComfortSoundsSettings sharedInstance](HUComfortSoundsSettings, "sharedInstance");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "selectedComfortSound");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setSelectedSound:", v36);

    objc_initWeak((id *)buf, v2);
    +[HUComfortSoundsSettings sharedInstance](HUComfortSoundsSettings, "sharedInstance");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = MEMORY[0x1E0C809B0];
    v62[0] = MEMORY[0x1E0C809B0];
    v62[1] = 3221225472;
    v62[2] = __33__HUComfortSoundsController_init__block_invoke;
    v62[3] = &unk_1EA8E8B68;
    v39 = v2;
    v63 = v39;
    objc_copyWeak(&v64, (id *)buf);
    objc_msgSend(v37, "registerUpdateBlock:forRetrieveSelector:withListener:", v62, sel_comfortSoundsEnabled, v39);

    +[HUComfortSoundsSettings sharedInstance](HUComfortSoundsSettings, "sharedInstance");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v59[0] = v38;
    v59[1] = 3221225472;
    v59[2] = __33__HUComfortSoundsController_init__block_invoke_3;
    v59[3] = &unk_1EA8E95E8;
    objc_copyWeak(&v61, (id *)buf);
    v41 = v39;
    v60 = v41;
    objc_msgSend(v40, "registerUpdateBlock:forRetrieveSelector:withListener:", v59, sel_selectedComfortSound, v41);

    +[HUComfortSoundsSettings sharedInstance](HUComfortSoundsSettings, "sharedInstance");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v57[0] = v38;
    v57[1] = 3221225472;
    v57[2] = __33__HUComfortSoundsController_init__block_invoke_26;
    v57[3] = &unk_1EA8E81D0;
    objc_copyWeak(&v58, (id *)buf);
    objc_msgSend(v42, "registerUpdateBlock:forRetrieveSelector:withListener:", v57, sel_relativeVolume, v41);

    +[HUComfortSoundsSettings sharedInstance](HUComfortSoundsSettings, "sharedInstance");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = v38;
    v55[1] = 3221225472;
    v55[2] = __33__HUComfortSoundsController_init__block_invoke_2_32;
    v55[3] = &unk_1EA8E81D0;
    objc_copyWeak(&v56, (id *)buf);
    objc_msgSend(v43, "registerUpdateBlock:forRetrieveSelector:withListener:", v55, sel_mixesWithMedia, v41);

    +[HUComfortSoundsSettings sharedInstance](HUComfortSoundsSettings, "sharedInstance");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = v38;
    v53[1] = 3221225472;
    v53[2] = __33__HUComfortSoundsController_init__block_invoke_2_38;
    v53[3] = &unk_1EA8E81D0;
    objc_copyWeak(&v54, (id *)buf);
    objc_msgSend(v44, "registerUpdateBlock:forRetrieveSelector:withListener:", v53, sel_mediaVolume, v41);

    +[HUComfortSoundsSettings sharedInstance](HUComfortSoundsSettings, "sharedInstance");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = v38;
    v51[1] = 3221225472;
    v51[2] = __33__HUComfortSoundsController_init__block_invoke_2_44;
    v51[3] = &unk_1EA8E81D0;
    objc_copyWeak(&v52, (id *)buf);
    objc_msgSend(v45, "registerUpdateBlock:forRetrieveSelector:withListener:", v51, sel_forceMixingBehavior, v41);

    v46 = *((_QWORD *)v2 + 18);
    block[0] = v38;
    block[1] = 3221225472;
    block[2] = __33__HUComfortSoundsController_init__block_invoke_2_50;
    block[3] = &unk_1EA8E8220;
    v47 = v41;
    v50 = v47;
    dispatch_async(v46, block);
    objc_msgSend(v47, "registerNotifications");
    objc_msgSend(v47, "_handleContinuitySessionCheck");

    objc_destroyWeak(&v52);
    objc_destroyWeak(&v54);
    objc_destroyWeak(&v56);
    objc_destroyWeak(&v58);

    objc_destroyWeak(&v61);
    objc_destroyWeak(&v64);

    objc_destroyWeak((id *)buf);
  }
  return (HUComfortSoundsController *)v2;
}

void __33__HUComfortSoundsController_init__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  id *v6;
  id WeakRetained;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  +[HUComfortSoundsSettings sharedInstance](HUComfortSoundsSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "comfortSoundsEnabled");

  if (v3)
  {
    +[HUComfortSoundsSettings sharedInstance](HUComfortSoundsSettings, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSince1970");
    objc_msgSend(v4, "setLastEnablementTimestamp:");

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setLiveListenComfortSoundsSwitch:", 0);
  }
  v6 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained(v6);
  v8 = objc_msgSend(WeakRetained, "shouldContinuePlayback");

  if (!v8)
  {
    v20 = objc_loadWeakRetained(v6);
    objc_msgSend(v20, "stop");
LABEL_11:

    goto LABEL_12;
  }
  +[AXHAController sharedController](AXHAController, "sharedController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "liveListenController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isListening");

  if (!v11)
  {
    v20 = objc_loadWeakRetained(v6);
    objc_msgSend(v20, "startComfortSounds");
    goto LABEL_11;
  }
  CSInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Switching to Background Sounds from Live Listen"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsController init]_block_invoke", 167, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)*MEMORY[0x1E0D2F918];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F918], OS_LOG_TYPE_DEFAULT))
  {
    v15 = objc_retainAutorelease(v13);
    v16 = v14;
    *(_DWORD *)buf = 136446210;
    v26 = objc_msgSend(v15, "UTF8String");
    _os_log_impl(&dword_1DE311000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  v17 = objc_loadWeakRetained(v6);
  objc_msgSend(v17, "setLiveListenComfortSoundsSwitch:", 1);

  +[AXHAController sharedController](AXHAController, "sharedController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "liveListenController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __33__HUComfortSoundsController_init__block_invoke_15;
  v23[3] = &unk_1EA8EAE60;
  objc_copyWeak(&v24, v6);
  objc_msgSend(v19, "stopListeningWithCompletion:", v23);

  objc_destroyWeak(&v24);
LABEL_12:
  v21 = objc_loadWeakRetained(v6);
  objc_msgSend(v21, "updateAnalytics");

  +[HUUtilities sharedUtilities](HUUtilities, "sharedUtilities");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "updateHearingFeatureUsage");

}

void __33__HUComfortSoundsController_init__block_invoke_15(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[4];
  id v4;

  v2 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__HUComfortSoundsController_init__block_invoke_2;
  block[3] = &unk_1EA8E81D0;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_after(v2, MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v4);
}

void __33__HUComfortSoundsController_init__block_invoke_2(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  int v4;
  id v5;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setLiveListenComfortSoundsSwitch:", 0);

  +[HUComfortSoundsSettings sharedInstance](HUComfortSoundsSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "comfortSoundsEnabled");

  if (v4)
  {
    v5 = objc_loadWeakRetained(v1);
    objc_msgSend(v5, "startComfortSounds");

  }
}

void __33__HUComfortSoundsController_init__block_invoke_3(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "audioQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__HUComfortSoundsController_init__block_invoke_4;
  v5[3] = &unk_1EA8E95E8;
  objc_copyWeak(&v7, v2);
  v6 = *(id *)(a1 + 32);
  dispatch_async(v4, v5);

  objc_destroyWeak(&v7);
}

void __33__HUComfortSoundsController_init__block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  os_log_t *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id *v12;
  id WeakRetained;
  void *v14;
  char v15;
  id v16;
  id v17;
  int v18;
  id v19;
  id v20;
  int v21;
  id v22;
  void *v23;
  void *v24;
  os_log_t v25;
  id v26;
  NSObject *v27;
  uint64_t v28;
  id v29;
  uint8_t buf[4];
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  +[HUComfortSoundsSettings sharedInstance](HUComfortSoundsSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedComfortSound");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  CSInitializeLogging();
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Updating sound to %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsController init]_block_invoke_4", 199, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (os_log_t *)MEMORY[0x1E0D2F918];
  v9 = (void *)*MEMORY[0x1E0D2F918];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F918], OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_retainAutorelease(v7);
    v11 = v9;
    *(_DWORD *)buf = 136446210;
    v31 = objc_msgSend(v10, "UTF8String");
    _os_log_impl(&dword_1DE311000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  v12 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "selectedSound");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqual:", v3);

  if ((v15 & 1) == 0)
  {
    v16 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v16, "setSelectedSound:", v3);

    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 80))
      goto LABEL_14;
    v17 = objc_loadWeakRetained((id *)(a1 + 40));
    v18 = objc_msgSend(v17, "shouldContinuePlayback");

    if (!v18)
      goto LABEL_14;
    v19 = objc_loadWeakRetained(v12);
    if ((objc_msgSend(v19, "isPlayingOnQueue") & 1) != 0)
    {
      v20 = objc_loadWeakRetained(v12);
      v21 = objc_msgSend(v20, "currentRouteSupported");

      if (v21)
      {
        v22 = objc_loadWeakRetained(v12);
        objc_msgSend(v22, "scheduleNewFile");
LABEL_13:

LABEL_14:
        v29 = objc_loadWeakRetained(v12);
        objc_msgSend(v29, "updateAnalytics");

        goto LABEL_15;
      }
    }
    else
    {

    }
    CSInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CS sound changed. Starting"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsController init]_block_invoke", 214, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      v26 = objc_retainAutorelease(v24);
      v27 = v25;
      v28 = objc_msgSend(v26, "UTF8String");
      *(_DWORD *)buf = 136446210;
      v31 = v28;
      _os_log_impl(&dword_1DE311000, v27, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    v22 = objc_loadWeakRetained(v12);
    objc_msgSend(v22, "playOnQueue");
    goto LABEL_13;
  }
LABEL_15:

}

void __33__HUComfortSoundsController_init__block_invoke_26(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id *v10;
  id WeakRetained;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  CSInitializeLogging();
  v2 = (void *)MEMORY[0x1E0CB3940];
  +[HUComfortSoundsSettings sharedInstance](HUComfortSoundsSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "relativeVolume");
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Setting relative volume %lf"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsController init]_block_invoke", 225, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)*MEMORY[0x1E0D2F918];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F918], OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_retainAutorelease(v6);
    v9 = v7;
    *(_DWORD *)buf = 136446210;
    v16 = objc_msgSend(v8, "UTF8String");
    _os_log_impl(&dword_1DE311000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  v10 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v10);
  objc_msgSend(WeakRetained, "audioQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__HUComfortSoundsController_init__block_invoke_29;
  block[3] = &unk_1EA8E81D0;
  objc_copyWeak(&v14, v10);
  dispatch_async(v12, block);

  objc_destroyWeak(&v14);
}

void __33__HUComfortSoundsController_init__block_invoke_29(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateVolumeForSessionAndRamp:", 0);

}

void __33__HUComfortSoundsController_init__block_invoke_2_32(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id *v9;
  id WeakRetained;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  CSInitializeLogging();
  v2 = (void *)MEMORY[0x1E0CB3940];
  +[HUComfortSoundsSettings sharedInstance](HUComfortSoundsSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Setting mixing preference %d"), objc_msgSend(v3, "mixesWithMedia"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsController init]_block_invoke_2", 232, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)*MEMORY[0x1E0D2F918];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F918], OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_retainAutorelease(v5);
    v8 = v6;
    *(_DWORD *)buf = 136446210;
    v15 = objc_msgSend(v7, "UTF8String");
    _os_log_impl(&dword_1DE311000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  v9 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v9);
  objc_msgSend(WeakRetained, "audioQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__HUComfortSoundsController_init__block_invoke_35;
  block[3] = &unk_1EA8E81D0;
  objc_copyWeak(&v13, v9);
  dispatch_async(v11, block);

  objc_destroyWeak(&v13);
}

void __33__HUComfortSoundsController_init__block_invoke_35(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateVolumeForSessionAndRamp:", 0);

}

void __33__HUComfortSoundsController_init__block_invoke_2_38(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id *v10;
  id WeakRetained;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  CSInitializeLogging();
  v2 = (void *)MEMORY[0x1E0CB3940];
  +[HUComfortSoundsSettings sharedInstance](HUComfortSoundsSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mediaVolume");
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Setting media volume %lf"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsController init]_block_invoke_2", 239, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)*MEMORY[0x1E0D2F918];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F918], OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_retainAutorelease(v6);
    v9 = v7;
    *(_DWORD *)buf = 136446210;
    v16 = objc_msgSend(v8, "UTF8String");
    _os_log_impl(&dword_1DE311000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  v10 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v10);
  objc_msgSend(WeakRetained, "audioQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__HUComfortSoundsController_init__block_invoke_41;
  block[3] = &unk_1EA8E81D0;
  objc_copyWeak(&v14, v10);
  dispatch_async(v12, block);

  objc_destroyWeak(&v14);
}

void __33__HUComfortSoundsController_init__block_invoke_41(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateVolumeForSessionAndRamp:", 0);

}

void __33__HUComfortSoundsController_init__block_invoke_2_44(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id *v9;
  id WeakRetained;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  CSInitializeLogging();
  v2 = (void *)MEMORY[0x1E0CB3940];
  +[HUComfortSoundsSettings sharedInstance](HUComfortSoundsSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Setting force media %d"), objc_msgSend(v3, "forceMixingBehavior"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsController init]_block_invoke_2", 246, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)*MEMORY[0x1E0D2F918];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F918], OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_retainAutorelease(v5);
    v8 = v6;
    *(_DWORD *)buf = 136446210;
    v15 = objc_msgSend(v7, "UTF8String");
    _os_log_impl(&dword_1DE311000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  v9 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v9);
  objc_msgSend(WeakRetained, "audioQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__HUComfortSoundsController_init__block_invoke_47;
  block[3] = &unk_1EA8E81D0;
  objc_copyWeak(&v13, v9);
  dispatch_async(v11, block);

  objc_destroyWeak(&v13);
}

void __33__HUComfortSoundsController_init__block_invoke_47(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateVolumeForSessionAndRamp:", 1);

}

uint64_t __33__HUComfortSoundsController_init__block_invoke_2_50(uint64_t a1)
{
  uint64_t result;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "shouldContinuePlayback");
  if ((_DWORD)result)
  {
    CSInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CS enabled at start. Starting"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsController init]_block_invoke_2", 255, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)*MEMORY[0x1E0D2F918];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F918], OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_retainAutorelease(v4);
      v7 = v5;
      *(_DWORD *)buf = 136446210;
      v9 = objc_msgSend(v6, "UTF8String");
      _os_log_impl(&dword_1DE311000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    return objc_msgSend(*(id *)(a1 + 32), "playOnQueue");
  }
  return result;
}

- (void)updateAnalytics
{
  void *v2;
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  uint8_t buf[4];
  uint64_t v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  +[HUComfortSoundsSettings sharedInstance](HUComfortSoundsSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedComfortSound");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = (__CFString *)v4;
  else
    v5 = &stru_1EA8EC4E0;
  v19[0] = CFSTR("enabled");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  +[HUComfortSoundsSettings sharedInstance](HUComfortSoundsSettings, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithBool:", objc_msgSend(v7, "comfortSoundsEnabled"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = CFSTR("sound");
  v20[0] = v8;
  v20[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  CSInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Updating analytics %@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsController updateAnalytics]", 280, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)*MEMORY[0x1E0D2F918];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F918], OS_LOG_TYPE_DEFAULT))
  {
    v13 = objc_retainAutorelease(v11);
    v14 = v12;
    *(_DWORD *)buf = 136446210;
    v18 = objc_msgSend(v13, "UTF8String");
    _os_log_impl(&dword_1DE311000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  v16 = v9;
  v15 = v9;
  AnalyticsSendEventLazy();

}

id __44__HUComfortSoundsController_updateAnalytics__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)registerNotifications
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  _QWORD v21[5];
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_callStatusDidChange_, *MEMORY[0x1E0DBD4A0], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_callStatusDidChange_, *MEMORY[0x1E0DBD4F0], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_routesDidChange_, CFSTR("com.apple.accessibility.hearing.wireless.splitter.changed"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_audioSessionWasInterrupted_, *MEMORY[0x1E0C896F0], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_audioEngineWasInterrupted_, *MEMORY[0x1E0C89650], 0);

  MRMediaRemoteSetWantsNowPlayingNotifications();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_mediaPlaybackDidChange_, *MEMORY[0x1E0D4C920], 0);

  MRMediaRemoteSetWantsRouteChangeNotifications();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:name:object:", self, sel_routesDidChange_, *MEMORY[0x1E0D4CD60], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_routesDidChange_, *MEMORY[0x1E0D4CDA0], 0);

  objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (uint64_t *)MEMORY[0x1E0D48200];
  v22[0] = *MEMORY[0x1E0D48200];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAttribute:forKey:error:", v13, *MEMORY[0x1E0D48280], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *v12;
  objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObserver:selector:name:object:", self, sel_mediaServerDied, v15, v16);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *MEMORY[0x1E0C8AB28];
  objc_msgSend(MEMORY[0x1E0C8B2A8], "sharedSystemAudioContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __50__HUComfortSoundsController_registerNotifications__block_invoke;
  v21[3] = &unk_1EA8EAE88;
  v21[4] = self;
  v20 = (id)objc_msgSend(v17, "addObserverForName:object:queue:usingBlock:", v18, v19, 0, v21);

  -[HUComfortSoundsController registerHasBlankedScreenNotification](self, "registerHasBlankedScreenNotification");
}

uint64_t __50__HUComfortSoundsController_registerNotifications__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleContinuitySessionCheck");
}

- (void)registerHasBlankedScreenNotification
{
  uint64_t v3;
  void (**v4)(_QWORD, _QWORD);
  void (**v5)(_QWORD, _QWORD);
  void (**v6)(_QWORD, _QWORD);
  int *p_keybagLockStateToken;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  int *p_blankScreenToken;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  int *p_lockStateNotifyToken;
  _BOOL4 v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  id *v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t, uint64_t);
  void *v36;
  id v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;
  id location;
  uint8_t buf[4];
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  v3 = MEMORY[0x1E0C809B0];
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __65__HUComfortSoundsController_registerHasBlankedScreenNotification__block_invoke;
  v40[3] = &unk_1EA8E9740;
  v32 = &v41;
  objc_copyWeak(&v41, &location);
  v4 = (void (**)(_QWORD, _QWORD))MEMORY[0x1DF0EB808](v40);
  v38[0] = v3;
  v38[1] = 3221225472;
  v38[2] = __65__HUComfortSoundsController_registerHasBlankedScreenNotification__block_invoke_86;
  v38[3] = &unk_1EA8E9740;
  objc_copyWeak(&v39, &location);
  v5 = (void (**)(_QWORD, _QWORD))MEMORY[0x1DF0EB808](v38);
  v33 = v3;
  v34 = 3221225472;
  v35 = __65__HUComfortSoundsController_registerHasBlankedScreenNotification__block_invoke_89;
  v36 = &unk_1EA8E9740;
  objc_copyWeak(&v37, &location);
  v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x1DF0EB808](&v33);
  p_keybagLockStateToken = &self->_keybagLockStateToken;
  v8 = MEMORY[0x1E0C80D38];
  v9 = MEMORY[0x1E0C80D38];
  LODWORD(v8) = notify_register_dispatch("com.apple.mobile.keybagd.lock_status", &self->_keybagLockStateToken, v8, v5) == 0;

  if ((_DWORD)v8)
  {
    v5[2](v5, *p_keybagLockStateToken);
    CSInitializeLogging();
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *p_keybagLockStateToken);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("Registered keybag lock state: %@ %@"), self, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsController registerHasBlankedScreenNotification]", 371, v12, &v41, v33, v34, v35, v36);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)*MEMORY[0x1E0D2F918];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
      *(_DWORD *)buf = 136446210;
      v44 = v15;
      _os_log_impl(&dword_1DE311000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }

  }
  else
  {
    *p_keybagLockStateToken = -1;
  }
  p_blankScreenToken = &self->_blankScreenToken;
  v17 = notify_register_dispatch("com.apple.springboard.hasBlankedScreen", &self->_blankScreenToken, MEMORY[0x1E0C80D38], v6) == 0;

  if (v17)
  {
    v6[2](v6, *p_blankScreenToken);
    CSInitializeLogging();
    v18 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *p_blankScreenToken);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("Registered blank screen state: %@ %@"), self, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsController registerHasBlankedScreenNotification]", 381, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (id)*MEMORY[0x1E0D2F918];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
      *(_DWORD *)buf = 136446210;
      v44 = v23;
      _os_log_impl(&dword_1DE311000, v22, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }

  }
  else
  {
    *p_blankScreenToken = -1;
  }
  p_lockStateNotifyToken = &self->_lockStateNotifyToken;
  v25 = notify_register_dispatch("ccom.apple.springboard.passcodeLockedOrBlocked", &self->_lockStateNotifyToken, MEMORY[0x1E0C80D38], v4) == 0;

  if (v25)
  {
    v4[2](v4, *p_lockStateNotifyToken);
    CSInitializeLogging();
    v26 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *p_lockStateNotifyToken);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringWithFormat:", CFSTR("Registered lock screen state: %@ %@"), self, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsController registerHasBlankedScreenNotification]", 391, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (id)*MEMORY[0x1E0D2F918];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = objc_msgSend(objc_retainAutorelease(v29), "UTF8String");
      *(_DWORD *)buf = 136446210;
      v44 = v31;
      _os_log_impl(&dword_1DE311000, v30, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }

  }
  else
  {
    *p_blankScreenToken = -1;
  }

  objc_destroyWeak(&v37);
  objc_destroyWeak(&v39);

  objc_destroyWeak(v32);
  objc_destroyWeak(&location);
}

void __65__HUComfortSoundsController_registerHasBlankedScreenNotification__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  id *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  uint64_t v15;
  _BYTE buf[24];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  CSInitializeLogging();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Handled device lock with passcode: %@ %@"), WeakRetained, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsController registerHasBlankedScreenNotification]_block_invoke", 340, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)*MEMORY[0x1E0D2F918];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F918], OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_retainAutorelease(v9);
    v12 = v10;
    *(_DWORD *)buf = 136446210;
    *(_QWORD *)&buf[4] = objc_msgSend(v11, "UTF8String");
    _os_log_impl(&dword_1DE311000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  v13 = objc_loadWeakRetained(v5);

  if (v13)
  {
    *(_QWORD *)buf = 0;
    notify_get_state(a2, (uint64_t *)buf);
    v14 = objc_loadWeakRetained(v5);
    v15 = objc_msgSend(v14, "isScreenBlank");
    objc_msgSend(v14, "deviceScreenStatusDidChange:systemLocked:", v15, *(unsigned int *)buf);

  }
}

void __65__HUComfortSoundsController_registerHasBlankedScreenNotification__block_invoke_86(uint64_t a1, uint64_t a2)
{
  void *v4;
  id *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  CSInitializeLogging();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Handled keybag lock: %@ %@"), WeakRetained, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsController registerHasBlankedScreenNotification]_block_invoke", 350, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)*MEMORY[0x1E0D2F918];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F918], OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_retainAutorelease(v9);
    v12 = v10;
    *(_DWORD *)buf = 136446210;
    v18 = objc_msgSend(v11, "UTF8String");
    _os_log_impl(&dword_1DE311000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  v13 = objc_loadWeakRetained(v5);

  if (v13)
  {
    v14 = objc_loadWeakRetained(v5);
    v15 = objc_msgSend(v14, "isScreenBlank");
    v16 = objc_loadWeakRetained(v5);
    objc_msgSend(v14, "deviceScreenStatusDidChange:systemLocked:", v15, objc_msgSend(v16, "isDeviceLockedWithPasscode"));

  }
}

void __65__HUComfortSoundsController_registerHasBlankedScreenNotification__block_invoke_89(uint64_t a1, uint64_t a2)
{
  void *v4;
  id *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  _BYTE buf[24];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  CSInitializeLogging();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Handled screen wake: %@ %@"), WeakRetained, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsController registerHasBlankedScreenNotification]_block_invoke", 359, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)*MEMORY[0x1E0D2F918];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F918], OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_retainAutorelease(v9);
    v12 = v10;
    *(_DWORD *)buf = 136446210;
    *(_QWORD *)&buf[4] = objc_msgSend(v11, "UTF8String");
    _os_log_impl(&dword_1DE311000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  v13 = objc_loadWeakRetained(v5);

  if (v13)
  {
    *(_QWORD *)buf = 0;
    notify_get_state(a2, (uint64_t *)buf);
    v14 = objc_loadWeakRetained(v5);
    v15 = *(unsigned int *)buf;
    v16 = v14;
    objc_msgSend(v16, "deviceScreenStatusDidChange:systemLocked:", v15, objc_msgSend(v16, "isDeviceLockedWithPasscode"));

  }
}

- (void)deviceScreenStatusDidChange:(int)a3 systemLocked:(int)a4
{
  _BOOL8 v6;
  _BOOL8 v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  os_log_t *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  os_log_t v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  if (a3)
    v6 = 0;
  else
    v6 = a4 != 0;
  v25 = *MEMORY[0x1E0C80C00];
  if (a4)
    v7 = 0;
  else
    v7 = a3 != 0;
  +[HUComfortSoundsSettings sharedInstance](HUComfortSoundsSettings, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "stopsOnLock");

  CSInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Screen blank status has changed - %d, %d, %d"), v6, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsController deviceScreenStatusDidChange:systemLocked:]", 407, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (os_log_t *)MEMORY[0x1E0D2F918];
  v13 = (void *)*MEMORY[0x1E0D2F918];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F918], OS_LOG_TYPE_DEFAULT))
  {
    v14 = objc_retainAutorelease(v11);
    v15 = v13;
    *(_DWORD *)buf = 136446210;
    v24 = objc_msgSend(v14, "UTF8String");
    _os_log_impl(&dword_1DE311000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  if ((((a3 != 0) ^ (a4 != 0)) & v9) == 1)
  {
    CSInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The device is locked. Comfort sounds should stop on lock"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsController deviceScreenStatusDidChange:systemLocked:]", 411, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *v12;
    if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
    {
      v19 = objc_retainAutorelease(v17);
      v20 = v18;
      v21 = objc_msgSend(v19, "UTF8String");
      *(_DWORD *)buf = 136446210;
      v24 = v21;
      _os_log_impl(&dword_1DE311000, v20, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    +[HUComfortSoundsSettings sharedInstance](HUComfortSoundsSettings, "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setComfortSoundsEnabled:", 0);

  }
}

- (void)_handleContinuitySessionCheck
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C8B2A8], "sharedAudioPresentationOutputContext");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "outputDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "isActivatedForContinuityScreen");
        -[HUComfortSoundsController setIsInContinuitySession:](self, "setIsInContinuitySession:", v8);
        HCLogHearingXPC();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v20 = "-[HUComfortSoundsController _handleContinuitySessionCheck]";
          v21 = 2112;
          v22 = v10;
          _os_log_impl(&dword_1DE311000, v9, OS_LOG_TYPE_DEFAULT, "%s: session active: %@", buf, 0x16u);

        }
        if ((_DWORD)v8)
        {
          +[HUComfortSoundsSettings sharedInstance](HUComfortSoundsSettings, "sharedInstance");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "comfortSoundsEnabled");

          if (v12)
          {
            +[HUComfortSoundsSettings sharedInstance](HUComfortSoundsSettings, "sharedInstance");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setComfortSoundsEnabled:", 0);

            goto LABEL_14;
          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_14:

}

- (void)mediaServerDied
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  dispatch_time_t v8;
  NSObject *audioQueue;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  CSInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Mediaserverd died"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsController mediaServerDied]", 496, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)*MEMORY[0x1E0D2F918];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F918], OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_retainAutorelease(v4);
    v7 = v5;
    *(_DWORD *)buf = 136446210;
    v12 = objc_msgSend(v6, "UTF8String");
    _os_log_impl(&dword_1DE311000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  v8 = dispatch_time(0, 2000000000);
  audioQueue = self->_audioQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__HUComfortSoundsController_mediaServerDied__block_invoke;
  block[3] = &unk_1EA8E8220;
  block[4] = self;
  dispatch_after(v8, audioQueue, block);
}

uint64_t __44__HUComfortSoundsController_mediaServerDied__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "stopOnQueueAndClearRoute:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setupEngine");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObserver:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 32), "registerNotifications");
  result = objc_msgSend(*(id *)(a1 + 32), "shouldContinuePlayback");
  if ((_DWORD)result)
  {
    CSInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Continuing playback after server died"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsController mediaServerDied]_block_invoke", 506, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)*MEMORY[0x1E0D2F918];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F918], OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_retainAutorelease(v5);
      v8 = v6;
      *(_DWORD *)buf = 136446210;
      v10 = objc_msgSend(v7, "UTF8String");
      _os_log_impl(&dword_1DE311000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    return objc_msgSend(*(id *)(a1 + 32), "playOnQueue");
  }
  return result;
}

- (void)audioSessionWasInterrupted:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  os_log_t *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *audioQueue;
  void *v15;
  void *v16;
  os_log_t v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  CSInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Session interrupted. %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsController audioSessionWasInterrupted:]", 514, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (os_log_t *)MEMORY[0x1E0D2F918];
  v8 = (void *)*MEMORY[0x1E0D2F918];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F918], OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_retainAutorelease(v6);
    v10 = v8;
    *(_DWORD *)buf = 136446210;
    v23 = objc_msgSend(v9, "UTF8String");
    _os_log_impl(&dword_1DE311000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  objc_msgSend(v4, "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "valueForKey:", *MEMORY[0x1E0C89718]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "intValue");

  if (v13 == 1)
  {
    -[HUComfortSoundsController stopAndClearRoute:](self, "stopAndClearRoute:", 0);
    audioQueue = self->_audioQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__HUComfortSoundsController_audioSessionWasInterrupted___block_invoke;
    block[3] = &unk_1EA8E8220;
    block[4] = self;
    dispatch_async(audioQueue, block);
  }
  else
  {
    -[HUComfortSoundsController play](self, "play");
    if (self->_holdingForCall)
    {
      CSInitializeLogging();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CS interrupted changed while holding for call"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsController audioSessionWasInterrupted:]", 529, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
      {
        v18 = objc_retainAutorelease(v16);
        v19 = v17;
        v20 = objc_msgSend(v18, "UTF8String");
        *(_DWORD *)buf = 136446210;
        v23 = v20;
        _os_log_impl(&dword_1DE311000, v19, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

      }
      -[HUComfortSoundsController callStatusDidChange:](self, "callStatusDidChange:", 0);
    }
  }

}

uint64_t __56__HUComfortSoundsController_audioSessionWasInterrupted___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "engine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stop");

  return objc_msgSend(*(id *)(a1 + 32), "setEngine:", 0);
}

- (void)audioEngineWasInterrupted:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *audioQueue;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  CSInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Audio Engine interrupted. %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsController audioEngineWasInterrupted:]", 537, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)*MEMORY[0x1E0D2F918];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F918], OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_retainAutorelease(v6);
    v9 = v7;
    *(_DWORD *)buf = 136446210;
    v13 = objc_msgSend(v8, "UTF8String");
    _os_log_impl(&dword_1DE311000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  audioQueue = self->_audioQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__HUComfortSoundsController_audioEngineWasInterrupted___block_invoke;
  block[3] = &unk_1EA8E8220;
  block[4] = self;
  dispatch_async(audioQueue, block);
}

uint64_t __55__HUComfortSoundsController_audioEngineWasInterrupted___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "stopOnQueueAndClearRoute:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setupEngine");
  result = objc_msgSend(*(id *)(a1 + 32), "shouldContinuePlayback");
  if ((_DWORD)result)
  {
    CSInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Continuing playback after restarting the engine"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsController audioEngineWasInterrupted:]_block_invoke", 544, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)*MEMORY[0x1E0D2F918];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F918], OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_retainAutorelease(v4);
      v7 = v5;
      *(_DWORD *)buf = 136446210;
      v9 = objc_msgSend(v6, "UTF8String");
      _os_log_impl(&dword_1DE311000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    return objc_msgSend(*(id *)(a1 + 32), "playOnQueue");
  }
  return result;
}

- (void)setupEngine
{
  id v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  OS_dispatch_queue *audioQueue;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v3 = objc_alloc_init(MEMORY[0x1E0C89A88]);
  -[HUComfortSoundsController setEngine:](self, "setEngine:", v3);
  v4 = objc_alloc_init(MEMORY[0x1E0C89AD8]);
  objc_msgSend(v3, "attachNode:", v4);
  -[HUComfortSoundsController setAudioPlayerNodeA:](self, "setAudioPlayerNodeA:", v4);
  v5 = objc_alloc_init(MEMORY[0x1E0C89AD8]);

  objc_msgSend(v3, "attachNode:", v5);
  -[HUComfortSoundsController setAudioPlayerNodeB:](self, "setAudioPlayerNodeB:", v5);
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  +[HUComfortSoundsSettings sharedInstance](HUComfortSoundsSettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "relativeVolume");
  v8 = v7;

  v17 = v8;
  +[HUComfortSoundsSettings sharedInstance](HUComfortSoundsSettings, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "mixesWithMedia");

  if (v10)
  {
    +[HUUtilities sharedUtilities](HUUtilities, "sharedUtilities");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    audioQueue = self->_audioQueue;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __40__HUComfortSoundsController_setupEngine__block_invoke;
    v13[3] = &unk_1EA8EA5F0;
    v13[4] = &v14;
    objc_msgSend(v11, "checkAudioPlayingWithQueue:andCompletion:", audioQueue, v13);

  }
  *(_QWORD *)&self->_outputGain = v15[3];
  _Block_object_dispose(&v14, 8);

}

void __40__HUComfortSoundsController_setupEngine__block_invoke(uint64_t a1, int a2)
{
  uint64_t v3;
  id v4;

  if (a2)
  {
    +[HUComfortSoundsSettings sharedInstance](HUComfortSoundsSettings, "sharedInstance");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mediaVolume");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3;

  }
}

- (void)clearEngine
{
  -[HUComfortSoundsController setEngine:](self, "setEngine:", 0);
  -[HUComfortSoundsController setAudioPlayerNodeA:](self, "setAudioPlayerNodeA:", 0);
  -[HUComfortSoundsController setAudioPlayerNodeB:](self, "setAudioPlayerNodeB:", 0);
}

- (BOOL)shouldContinuePlayback
{
  void *v3;
  _BOOL4 v4;

  +[HUComfortSoundsSettings sharedInstance](HUComfortSoundsSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "comfortSoundsEnabled") && self->_selectedSound)
    v4 = !-[HUComfortSoundsController isInContinuitySession](self, "isInContinuitySession");
  else
    LOBYTE(v4) = 0;

  return v4;
}

uint64_t __45__HUComfortSoundsController_routesDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "clearActiveRoute");
}

- (BOOL)hasCurrentCall
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  BOOL v6;
  _QWORD v8[8];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  uint8_t buf[4];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__HUComfortSoundsController_hasCurrentCall__block_invoke;
  v8[3] = &unk_1EA8E84E8;
  v8[4] = &v21;
  v8[5] = &v17;
  v8[6] = &v13;
  v8[7] = &v9;
  getCallStatus(v8);
  if (*((_BYTE *)v18 + 24) || *((_BYTE *)v10 + 24) || *((_BYTE *)v14 + 24))
  {
    CSInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Active Call Status - [pending = %d, active = %d, avc = %d, endpoint = %d]"), *((unsigned __int8 *)v10 + 24), *((unsigned __int8 *)v18 + 24), *((unsigned __int8 *)v14 + 24), *((unsigned __int8 *)v22 + 24));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsController hasCurrentCall]", 679, v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)*MEMORY[0x1E0D2F918];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = objc_msgSend(objc_retainAutorelease(v3), "UTF8String");
      *(_DWORD *)buf = 136446210;
      v26 = v5;
      _os_log_impl(&dword_1DE311000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }

    v6 = 1;
  }
  else
  {
    v6 = 0;
  }
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  return v6;
}

_QWORD *__43__HUComfortSoundsController_hasCurrentCall__block_invoke(_QWORD *result, char a2, char a3, char a4, char a5)
{
  *(_BYTE *)(*(_QWORD *)(result[4] + 8) + 24) = a2;
  *(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24) = a3;
  *(_BYTE *)(*(_QWORD *)(result[6] + 8) + 24) = a4;
  *(_BYTE *)(*(_QWORD *)(result[7] + 8) + 24) = a5;
  return result;
}

- (void)callStatusDidChange:(id)a3
{
  id v4;
  os_log_t *v5;
  NSObject *v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  char v13;
  void *v14;
  dispatch_time_t v15;
  NSObject *audioQueue;
  _QWORD block[5];

  v4 = a3;
  v5 = (os_log_t *)MEMORY[0x1E0D2F918];
  v6 = *MEMORY[0x1E0D2F918];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F918], OS_LOG_TYPE_DEBUG))
    -[HUComfortSoundsController callStatusDidChange:].cold.2((uint64_t)v4, v6);
  +[HUComfortSoundsSettings sharedInstance](HUComfortSoundsSettings, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "comfortSoundsAvailable");

  if (v8)
  {
    v9 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEBUG))
      -[HUComfortSoundsController callStatusDidChange:].cold.1((uint64_t)self, (uint64_t)v4, v9);
    if (-[HUComfortSoundsController hasCurrentCall](self, "hasCurrentCall"))
    {
      +[HUComfortSoundsSettings sharedInstance](HUComfortSoundsSettings, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "comfortSoundsEnabled");

      if (v11)
      {
        self->_holdingForCall = 1;
        -[HUComfortSoundsController stopAndClearRoute:](self, "stopAndClearRoute:", 0);
      }
    }
    else if (self->_holdingForCall)
    {
      +[HUComfortSoundsSettings sharedInstance](HUComfortSoundsSettings, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "comfortSoundsEnabled");

      if ((v13 & 1) == 0)
      {
        +[HUComfortSoundsSettings sharedInstance](HUComfortSoundsSettings, "sharedInstance");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setComfortSoundsEnabled:", 1);

      }
      v15 = dispatch_time(0, 3000000000);
      audioQueue = self->_audioQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __49__HUComfortSoundsController_callStatusDidChange___block_invoke;
      block[3] = &unk_1EA8E8220;
      block[4] = self;
      dispatch_after(v15, audioQueue, block);
    }
  }

}

void __49__HUComfortSoundsController_callStatusDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "hasCurrentCall") & 1) != 0)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "hasCurrentCall"))
    {
      +[HUComfortSoundsSettings sharedInstance](HUComfortSoundsSettings, "sharedInstance");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v2, "comfortSoundsEnabled");

      if (v3)
      {
        *(_BYTE *)(*(_QWORD *)(a1 + 32) + 80) = 1;
        objc_msgSend(*(id *)(a1 + 32), "stopAndClearRoute:", 0);
      }
    }
  }
  else
  {
    CSInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Removing call hold and playing"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsController callStatusDidChange:]_block_invoke", 711, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)*MEMORY[0x1E0D2F918];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F918], OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_retainAutorelease(v5);
      v8 = v6;
      *(_DWORD *)buf = 136446210;
      v10 = objc_msgSend(v7, "UTF8String");
      _os_log_impl(&dword_1DE311000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "playOnQueue");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 80) = 0;
  }
}

- (void)mediaPlaybackDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *audioQueue;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  CSInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Now playing notification: %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsController mediaPlaybackDidChange:]", 735, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)*MEMORY[0x1E0D2F918];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F918], OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_retainAutorelease(v6);
    v9 = v7;
    *(_DWORD *)buf = 136446210;
    v13 = objc_msgSend(v8, "UTF8String");
    _os_log_impl(&dword_1DE311000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  audioQueue = self->_audioQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__HUComfortSoundsController_mediaPlaybackDidChange___block_invoke;
  block[3] = &unk_1EA8E8220;
  block[4] = self;
  dispatch_async(audioQueue, block);
}

uint64_t __52__HUComfortSoundsController_mediaPlaybackDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateVolumeForSessionAndRamp:", 1);
}

- (void)play
{
  NSObject *audioQueue;
  _QWORD block[5];

  audioQueue = self->_audioQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__HUComfortSoundsController_play__block_invoke;
  block[3] = &unk_1EA8E8220;
  block[4] = self;
  dispatch_async(audioQueue, block);
}

uint64_t __33__HUComfortSoundsController_play__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "playOnQueue");
}

- (void)playOnQueue
{
  _BOOL4 v3;
  void *v4;
  _BOOL4 v5;
  _BOOL8 holdingForCall;
  void *v7;
  void *v8;
  void *v9;
  os_log_t *v10;
  void *v11;
  id v12;
  NSObject *v13;
  AVAudioSession *v14;
  AVAudioSession *session;
  AVAudioSession *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  os_log_t v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  AVAudioSession *v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  os_log_t v30;
  id v31;
  NSObject *v32;
  uint64_t v33;
  AVAudioSession *v34;
  id v35;
  void *v36;
  void *v37;
  os_log_t v38;
  id v39;
  NSObject *v40;
  uint64_t v41;
  AVAudioSession *v42;
  id v43;
  void *v44;
  void *v45;
  os_log_t v46;
  id v47;
  NSObject *v48;
  uint64_t v49;
  AVAudioSession *v50;
  id v51;
  void *v52;
  id v53;
  os_log_t v54;
  NSObject *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  NSString *v59;
  NSString *routeUID;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  char v71;
  id v72;
  void *v73;
  void *v74;
  os_log_t v75;
  id v76;
  NSObject *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  os_log_t v81;
  id v82;
  NSObject *v83;
  uint64_t v84;
  id mixingBlock;
  void *v86;
  double v87;
  void *v88;
  double v89;
  void *v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  uint8_t buf[4];
  uint64_t v98;
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  v3 = -[HUComfortSoundsController currentRouteSupported](self, "currentRouteSupported");
  CSInitializeLogging();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = -[HUComfortSoundsController isPlayingOnQueue](self, "isPlayingOnQueue");
  holdingForCall = self->_holdingForCall;
  +[HUComfortSoundsSettings sharedInstance](HUComfortSoundsSettings, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Playing [%d, %d, %d] {%d, %d}"), v5, v3, holdingForCall, objc_msgSend(v7, "comfortSoundsEnabled"), self->_selectedSound != 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsController playOnQueue]", 756, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (os_log_t *)MEMORY[0x1E0D2F918];
  v11 = (void *)*MEMORY[0x1E0D2F918];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F918], OS_LOG_TYPE_DEFAULT))
  {
    v12 = objc_retainAutorelease(v9);
    v13 = v11;
    *(_DWORD *)buf = 136446210;
    v98 = objc_msgSend(v12, "UTF8String");
    _os_log_impl(&dword_1DE311000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  if (!-[HUComfortSoundsController isPlayingOnQueue](self, "isPlayingOnQueue")
    && v3
    && !self->_holdingForCall
    && -[HUComfortSoundsController shouldContinuePlayback](self, "shouldContinuePlayback"))
  {
    objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
    v14 = (AVAudioSession *)objc_claimAutoreleasedReturnValue();
    session = self->_session;
    self->_session = v14;

    v16 = self->_session;
    v17 = *MEMORY[0x1E0C89690];
    v96 = 0;
    -[AVAudioSession setCategory:withOptions:error:](v16, "setCategory:withOptions:error:", v17, 1, &v96);
    v18 = v96;
    if (v18)
    {
      CSInitializeLogging();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error setting category for session: %@"), v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsController playOnQueue]", 768, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *v10;
      if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
      {
        v22 = objc_retainAutorelease(v20);
        v23 = v21;
        v24 = objc_msgSend(v22, "UTF8String");
        *(_DWORD *)buf = 136446210;
        v98 = v24;
        _os_log_impl(&dword_1DE311000, v23, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

      }
    }
    v25 = self->_session;
    v26 = *MEMORY[0x1E0C89748];
    v95 = v18;
    -[AVAudioSession setMode:error:](v25, "setMode:error:", v26, &v95);
    v27 = v95;

    if (v27)
    {
      CSInitializeLogging();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error setting default mode for session: %@"), v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsController playOnQueue]", 774, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = *v10;
      if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
      {
        v31 = objc_retainAutorelease(v29);
        v32 = v30;
        v33 = objc_msgSend(v31, "UTF8String");
        *(_DWORD *)buf = 136446210;
        v98 = v33;
        _os_log_impl(&dword_1DE311000, v32, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

      }
    }
    v34 = self->_session;
    v94 = v27;
    -[AVAudioSession setPrefersNoDucking:error:](v34, "setPrefersNoDucking:error:", 1, &v94);
    v35 = v94;

    if (v35)
    {
      CSInitializeLogging();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error preventing ducking with session: %@"), v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsController playOnQueue]", 780, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = *v10;
      if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
      {
        v39 = objc_retainAutorelease(v37);
        v40 = v38;
        v41 = objc_msgSend(v39, "UTF8String");
        *(_DWORD *)buf = 136446210;
        v98 = v41;
        _os_log_impl(&dword_1DE311000, v40, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

      }
    }
    v42 = self->_session;
    v93 = v35;
    -[AVAudioSession setAudioHardwareControlFlags:error:](v42, "setAudioHardwareControlFlags:error:", 0x100000, &v93);
    v43 = v93;

    if (v43)
    {
      CSInitializeLogging();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error setting volume desired hardware control flag with session: %@"), v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsController playOnQueue]", 786, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = *v10;
      if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
      {
        v47 = objc_retainAutorelease(v45);
        v48 = v46;
        v49 = objc_msgSend(v47, "UTF8String");
        *(_DWORD *)buf = 136446210;
        v98 = v49;
        _os_log_impl(&dword_1DE311000, v48, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

      }
    }
    v50 = self->_session;
    v92 = v43;
    -[AVAudioSession setActive:forFeature:error:](v50, "setActive:forFeature:error:", 1, 2048, &v92);
    v51 = v92;

    if (v51)
    {
      CSInitializeLogging();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error activating session: %@"), v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsController playOnQueue]", 792, v52);
      v53 = (id)objc_claimAutoreleasedReturnValue();
      v54 = *v10;
      if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
      {
        v53 = objc_retainAutorelease(v53);
        v55 = v54;
        v56 = objc_msgSend(v53, "UTF8String");
        *(_DWORD *)buf = 136446210;
        v98 = v56;
        _os_log_impl(&dword_1DE311000, v55, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

      }
    }
    else
    {
      +[HUUtilities sharedUtilities](HUUtilities, "sharedUtilities");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "currentPickableAudioRoutes");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "valueForKey:", CFSTR("AXSHARoutePicked"));
      v51 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v51, "valueForKey:", CFSTR("RouteUID"));
      v59 = (NSString *)objc_claimAutoreleasedReturnValue();
      routeUID = self->_routeUID;
      self->_routeUID = v59;

      v61 = (void *)os_transaction_create();
      -[HUComfortSoundsController setTransaction:](self, "setTransaction:", v61);

      -[HUComfortSoundsController engine](self, "engine");
      v62 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v62)
        -[HUComfortSoundsController setupEngine](self, "setupEngine");
      -[HUComfortSoundsController engine](self, "engine");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "mainMixerNode");
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      -[HUComfortSoundsController nextFileToPlay](self, "nextFileToPlay");
      v53 = (id)objc_claimAutoreleasedReturnValue();
      if (v53)
      {
        -[HUComfortSoundsController engine](self, "engine");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUComfortSoundsController audioPlayerNodeA](self, "audioPlayerNodeA");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "processingFormat");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "connect:to:format:", v65, v52, v66);

        -[HUComfortSoundsController engine](self, "engine");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUComfortSoundsController audioPlayerNodeB](self, "audioPlayerNodeB");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "processingFormat");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "connect:to:format:", v68, v52, v69);

        -[HUComfortSoundsController engine](self, "engine");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v91 = 0;
        v71 = objc_msgSend(v70, "startAndReturnError:", &v91);
        v72 = v91;

        if (!v72 || (v71 & 1) != 0)
        {
          mixingBlock = self->_mixingBlock;
          if (mixingBlock)
            dispatch_block_cancel(mixingBlock);
          -[HUComfortSoundsController audioPlayerNodeA](self, "audioPlayerNodeA");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v87) = 0;
          objc_msgSend(v86, "setVolume:", v87);

          -[HUComfortSoundsController audioPlayerNodeB](self, "audioPlayerNodeB");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v89) = 0;
          objc_msgSend(v88, "setVolume:", v89);

          -[HUComfortSoundsController setCrossFading:](self, "setCrossFading:", 0);
          -[HUComfortSoundsController audioPlayerNodeB](self, "audioPlayerNodeB");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          -[HUComfortSoundsController setCurrentNode:](self, "setCurrentNode:", v90);

          -[HUComfortSoundsController scheduleNewFile](self, "scheduleNewFile");
        }
        else
        {
          CSInitializeLogging();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error starting engine: %@"), v72);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsController playOnQueue]", 822, v73);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          v75 = *v10;
          if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
          {
            v76 = objc_retainAutorelease(v74);
            v77 = v75;
            v78 = objc_msgSend(v76, "UTF8String");
            *(_DWORD *)buf = 136446210;
            v98 = v78;
            _os_log_impl(&dword_1DE311000, v77, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

          }
        }

      }
      else
      {
        CSInitializeLogging();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing file. Stopping"));
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsController playOnQueue]", 811, v79);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = *v10;
        if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
        {
          v82 = objc_retainAutorelease(v80);
          v83 = v81;
          v84 = objc_msgSend(v82, "UTF8String");
          *(_DWORD *)buf = 136446210;
          v98 = v84;
          _os_log_impl(&dword_1DE311000, v83, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

        }
        -[HUComfortSoundsController stopOnQueueAndClearRoute:](self, "stopOnQueueAndClearRoute:", 1);
      }
    }

  }
}

- (id)nextFileToPlay
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  HUComfortSound *v12;
  HUComfortSound *selectedSound;
  void *v14;
  void *v15;
  os_log_t *v16;
  void *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  os_log_t v25;
  id v26;
  NSObject *v27;
  uint64_t v28;
  id v30;
  id v31;
  uint8_t buf[4];
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  -[HUComfortSound nextFilePath](self->_selectedSound, "nextFilePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v5 = 0;
LABEL_9:
    -[HUComfortSound asset](self->_selectedSound, "asset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      +[HUComfortSound defaultComfortSoundForGroup:](HUComfortSound, "defaultComfortSoundForGroup:", -[HUComfortSound soundGroup](self->_selectedSound, "soundGroup"));
      v12 = (HUComfortSound *)objc_claimAutoreleasedReturnValue();
      selectedSound = self->_selectedSound;
      self->_selectedSound = v12;

      CSInitializeLogging();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing file. Falling back %@"), self->_selectedSound);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsController nextFileToPlay]", 858, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (os_log_t *)MEMORY[0x1E0D2F918];
      v17 = (void *)*MEMORY[0x1E0D2F918];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F918], OS_LOG_TYPE_DEFAULT))
      {
        v18 = objc_retainAutorelease(v15);
        v19 = v17;
        v20 = objc_msgSend(v18, "UTF8String");
        *(_DWORD *)buf = 136446210;
        v33 = v20;
        _os_log_impl(&dword_1DE311000, v19, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

      }
      -[HUComfortSound nextFilePath](self->_selectedSound, "nextFilePath");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        v30 = v5;
        v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C89A98]), "initForReading:error:", v21, &v30);
        v22 = v30;

        if (v22)
        {
          CSInitializeLogging();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error loading file: %@"), v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsController nextFileToPlay]", 866, v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = *v16;
          if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
          {
            v26 = objc_retainAutorelease(v24);
            v27 = v25;
            v28 = objc_msgSend(v26, "UTF8String");
            *(_DWORD *)buf = 136446210;
            v33 = v28;
            _os_log_impl(&dword_1DE311000, v27, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

          }
        }
      }
      else
      {
        v4 = 0;
        v22 = v5;
      }

      v5 = v22;
    }
    goto LABEL_19;
  }
  v31 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C89A98]), "initForReading:error:", v3, &v31);
  v5 = v31;
  if (v5)
  {
    CSInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error loading file: %@"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsController nextFileToPlay]", 851, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)*MEMORY[0x1E0D2F918];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F918], OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_retainAutorelease(v7);
      v10 = v8;
      v11 = objc_msgSend(v9, "UTF8String");
      *(_DWORD *)buf = 136446210;
      v33 = v11;
      _os_log_impl(&dword_1DE311000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
  }
  if (!v4)
    goto LABEL_9;
LABEL_19:

  return v4;
}

- (void)scheduleNewFile
{
  id rampUpBlock;
  id rampDownBlock;

  -[HUComfortSoundsController setChangingSounds:](self, "setChangingSounds:", 1);
  rampUpBlock = self->_rampUpBlock;
  if (rampUpBlock)
    dispatch_block_cancel(rampUpBlock);
  rampDownBlock = self->_rampDownBlock;
  if (rampDownBlock)
    dispatch_block_cancel(rampDownBlock);
  -[HUComfortSoundsController rampNodeVolume:from:to:fadeDuration:](self, "rampNodeVolume:from:to:fadeDuration:", self->_currentNode, 1.0, 0.0, self->_changeDuration);
  -[HUComfortSoundsController scheduleFile](self, "scheduleFile");
}

- (void)scheduleFile
{
  void *v3;
  void *v4;
  unsigned int v5;
  id v6;
  void *v7;
  void *v8;
  os_log_t *v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  os_log_t v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  AVAudioPlayerNode *audioPlayerNodeA;
  AVAudioPlayerNode *v21;
  void *v22;
  double v23;
  uint64_t v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id mixingBlock;
  double fadeDuration;
  AVAudioPlayerNode *v32;
  dispatch_block_t v33;
  id v34;
  dispatch_time_t v35;
  void *v36;
  char v37;
  _BOOL4 v38;
  uint64_t v39;
  void *v40;
  void *v41;
  os_log_t v42;
  id v43;
  NSObject *v44;
  uint64_t v45;
  _QWORD block[4];
  AVAudioPlayerNode *v47;
  id v48[2];
  id v49;
  uint8_t buf[4];
  uint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  CSInitializeLogging();
  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HUComfortSoundsController engine](self, "engine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0;
  v5 = objc_msgSend(v4, "startAndReturnError:", &v49);
  v6 = v49;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Starting engine %d"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsController scheduleFile]", 899, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (os_log_t *)MEMORY[0x1E0D2F918];
  v10 = (void *)*MEMORY[0x1E0D2F918];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F918], OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_retainAutorelease(v8);
    v12 = v10;
    v13 = objc_msgSend(v11, "UTF8String");
    *(_DWORD *)buf = 136446210;
    v51 = v13;
    _os_log_impl(&dword_1DE311000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  if (v6)
  {
    CSInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error starting engine %@"), v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsController scheduleFile]", 902, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_retainAutorelease(v15);
      v18 = v16;
      v19 = objc_msgSend(v17, "UTF8String");
      *(_DWORD *)buf = 136446210;
      v51 = v19;
      _os_log_impl(&dword_1DE311000, v18, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    -[HUComfortSoundsController setupEngine](self, "setupEngine");
    -[HUComfortSoundsController scheduleFile](self, "scheduleFile");
  }
  else
  {
    audioPlayerNodeA = self->_audioPlayerNodeA;
    if (self->_currentNode == audioPlayerNodeA)
      audioPlayerNodeA = self->_audioPlayerNodeB;
    v21 = audioPlayerNodeA;
    -[HUComfortSoundsController setCurrentNode:](self, "setCurrentNode:", v21);
    -[HUComfortSoundsController nextFileToPlay](self, "nextFileToPlay");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      LODWORD(v23) = 0;
      -[AVAudioPlayerNode setVolume:](v21, "setVolume:", v23);
      -[AVAudioPlayerNode prepareWithFrameCount:](v21, "prepareWithFrameCount:", objc_msgSend(v22, "length"));
      -[AVAudioPlayerNode scheduleFile:atTime:completionCallbackType:completionHandler:](v21, "scheduleFile:atTime:completionCallbackType:completionHandler:", v22, 0, 2, &__block_literal_global_174);
      v24 = objc_msgSend(v22, "length");
      -[AVAudioPlayerNode outputFormatForBus:](v21, "outputFormatForBus:", 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "sampleRate");
      v27 = v26;

      v28 = (double)v24 / v27;
      if (v28 <= 20.0)
        v29 = v28 - self->_fadeDuration;
      else
        v29 = (v28 - self->_fadeDuration) * 0.8;
      mixingBlock = self->_mixingBlock;
      if (mixingBlock)
        dispatch_block_cancel(mixingBlock);
      objc_initWeak((id *)buf, self);
      fadeDuration = self->_fadeDuration;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __41__HUComfortSoundsController_scheduleFile__block_invoke_2;
      block[3] = &unk_1EA8EAEF0;
      objc_copyWeak(v48, (id *)buf);
      v32 = v21;
      v47 = v32;
      v48[1] = *(id *)&fadeDuration;
      v33 = dispatch_block_create((dispatch_block_flags_t)0, block);
      v34 = self->_mixingBlock;
      self->_mixingBlock = v33;

      v35 = dispatch_time(0, (uint64_t)(v29 * 1000000000.0));
      dispatch_after(v35, (dispatch_queue_t)self->_audioQueue, self->_mixingBlock);
      -[HUComfortSoundsController engine](self, "engine");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "isRunning");

      if ((v37 & 1) == 0)
        -[HUComfortSoundsController setupEngine](self, "setupEngine");
      -[AVAudioPlayerNode play](v32, "play");
      v38 = -[HUComfortSoundsController changingSounds](self, "changingSounds");
      v39 = 40;
      if (v38)
        v39 = 56;
      -[HUComfortSoundsController rampNodeVolume:from:to:fadeDuration:](self, "rampNodeVolume:from:to:fadeDuration:", v32, 0.0, 1.0, *(double *)((char *)&self->super.isa + v39));
      -[HUComfortSoundsController setCrossFading:](self, "setCrossFading:", 1);

      objc_destroyWeak(v48);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      CSInitializeLogging();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing file. Stopping"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsController scheduleFile]", 913, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
      {
        v43 = objc_retainAutorelease(v41);
        v44 = v42;
        v45 = objc_msgSend(v43, "UTF8String");
        *(_DWORD *)buf = 136446210;
        v51 = v45;
        _os_log_impl(&dword_1DE311000, v44, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

      }
      -[HUComfortSoundsController stopOnQueueAndClearRoute:](self, "stopOnQueueAndClearRoute:", 1);
    }

  }
}

void __41__HUComfortSoundsController_scheduleFile__block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  int v5;
  void *v6;
  void *v7;
  unsigned int v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  uint8_t buf[4];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ((objc_msgSend(WeakRetained, "shouldContinuePlayback") & 1) != 0)
  {
    v4 = objc_loadWeakRetained(v2);
    v5 = objc_msgSend(v4, "currentRouteSupported");

    if (v5)
    {
      CSInitializeLogging();
      v6 = (void *)MEMORY[0x1E0CB3940];
      +[HUComfortSoundsSettings sharedInstance](HUComfortSoundsSettings, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "comfortSoundsEnabled");
      v9 = objc_loadWeakRetained(v2);
      objc_msgSend(v6, "stringWithFormat:", CFSTR("Continuing playback [%d, %d]"), v8, objc_msgSend(v9, "currentRouteSupported"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsController scheduleFile]_block_invoke_2", 943, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)*MEMORY[0x1E0D2F918];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F918], OS_LOG_TYPE_DEFAULT))
      {
        v13 = objc_retainAutorelease(v11);
        v14 = v12;
        *(_DWORD *)buf = 136446210;
        v26 = objc_msgSend(v13, "UTF8String");
        _os_log_impl(&dword_1DE311000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

      }
      v15 = objc_loadWeakRetained(v2);
      objc_msgSend(v15, "rampNodeVolume:from:to:fadeDuration:", *(_QWORD *)(a1 + 32), 1.0, 0.0, *(double *)(a1 + 48));

      v16 = objc_loadWeakRetained(v2);
      objc_msgSend(v16, "scheduleFile");
      goto LABEL_10;
    }
  }
  else
  {

  }
  CSInitializeLogging();
  v17 = (void *)MEMORY[0x1E0CB3940];
  +[HUComfortSoundsSettings sharedInstance](HUComfortSoundsSettings, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "comfortSoundsEnabled");
  v20 = objc_loadWeakRetained(v2);
  objc_msgSend(v17, "stringWithFormat:", CFSTR("Stopping playback [%d, %d]"), v19, objc_msgSend(v20, "currentRouteSupported"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsController scheduleFile]_block_invoke", 949, v16);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)*MEMORY[0x1E0D2F918];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F918], OS_LOG_TYPE_DEFAULT))
  {
    v23 = objc_retainAutorelease(v21);
    v24 = v22;
    *(_DWORD *)buf = 136446210;
    v26 = objc_msgSend(v23, "UTF8String");
    _os_log_impl(&dword_1DE311000, v24, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
LABEL_10:

}

- (BOOL)isPlaying
{
  NSObject *audioQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  audioQueue = self->_audioQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__HUComfortSoundsController_isPlaying__block_invoke;
  v5[3] = &unk_1EA8E90D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(audioQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __38__HUComfortSoundsController_isPlaying__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isPlayingOnQueue");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)updateVolumeForSessionAndRamp:(BOOL)a3
{
  void *v5;
  OS_dispatch_queue *audioQueue;
  _QWORD v7[6];
  BOOL v8;
  _QWORD v9[4];

  if (!self->_holdingForCall)
  {
    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x2020000000;
    v9[3] = 0;
    +[HUUtilities sharedUtilities](HUUtilities, "sharedUtilities");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    audioQueue = self->_audioQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __59__HUComfortSoundsController_updateVolumeForSessionAndRamp___block_invoke;
    v7[3] = &unk_1EA8EAF18;
    v7[4] = self;
    v7[5] = v9;
    v8 = a3;
    objc_msgSend(v5, "checkAudioPlayingWithQueue:andCompletion:", audioQueue, v7);

    _Block_object_dispose(v9, 8);
  }
}

void __59__HUComfortSoundsController_updateVolumeForSessionAndRamp___block_invoke(uint64_t a1, unsigned int a2)
{
  void *v2;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  double v17;
  void *v18;
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    +[HUComfortSoundsSettings sharedInstance](HUComfortSoundsSettings, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "mixesWithMedia"))
    {

      goto LABEL_8;
    }
  }
  +[HUComfortSoundsSettings sharedInstance](HUComfortSoundsSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "forceMixingBehavior");

  if (!a2)
  {
    if (!v6)
    {
      +[HUComfortSoundsSettings sharedInstance](HUComfortSoundsSettings, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "relativeVolume");
      goto LABEL_10;
    }
LABEL_8:
    +[HUComfortSoundsSettings sharedInstance](HUComfortSoundsSettings, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mediaVolume");
LABEL_10:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v8;

    goto LABEL_11;
  }

  if ((v6 & 1) != 0)
    goto LABEL_8;
LABEL_11:
  CSInitializeLogging();
  v9 = (void *)MEMORY[0x1E0CB3940];
  +[HUComfortSoundsSettings sharedInstance](HUComfortSoundsSettings, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("Updating volume %d, %d, %lf"), a2, objc_msgSend(v10, "mixesWithMedia"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsController updateVolumeForSessionAndRamp:]_block_invoke", 1018, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)*MEMORY[0x1E0D2F918];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F918], OS_LOG_TYPE_DEFAULT))
  {
    v14 = objc_retainAutorelease(v12);
    v15 = v13;
    *(_DWORD *)buf = 136446210;
    v20 = objc_msgSend(v14, "UTF8String");
    _os_log_impl(&dword_1DE311000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  v16 = *(void **)(a1 + 32);
  v17 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  objc_msgSend(v16, "currentNode");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setVolume:forNode:andRamp:", v18, *(unsigned __int8 *)(a1 + 48), v17);

}

- (void)setVolume:(double)a3 forNode:(id)a4 andRamp:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id duckingBlock;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v5 = a5;
  v17 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  if (v5)
  {
    duckingBlock = self->_duckingBlock;
    if (duckingBlock)
      dispatch_block_cancel(duckingBlock);
    -[HUComfortSoundsController outputGain](self, "outputGain");
    -[HUComfortSoundsController rampOutputGainFrom:to:withProgress:](self, "rampOutputGainFrom:to:withProgress:");
  }
  else
  {
    -[HUComfortSoundsController setOutputGain:](self, "setOutputGain:", a3);
    if (a3 <= 0.0)
    {
      -[HUComfortSoundsController stopOnQueueAndClearRoute:](self, "stopOnQueueAndClearRoute:", 0);
      goto LABEL_11;
    }
    CSInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CS volume changed. Starting %d"), -[HUComfortSoundsController shouldContinuePlayback](self, "shouldContinuePlayback"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsController setVolume:forNode:andRamp:]", 1042, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)*MEMORY[0x1E0D2F918];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F918], OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_retainAutorelease(v11);
      v14 = v12;
      *(_DWORD *)buf = 136446210;
      v16 = objc_msgSend(v13, "UTF8String");
      _os_log_impl(&dword_1DE311000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
  }
  -[HUComfortSoundsController playOnQueue](self, "playOnQueue");
LABEL_11:

}

- (void)setOutputGain:(double)a3
{
  double v4;
  double v5;
  double outputGain;

  v4 = 0.0;
  if (a3 >= 0.0)
    v4 = a3;
  if (a3 <= 1.0)
    v5 = v4;
  else
    v5 = 1.0;
  self->_outputGain = v5;
  if (!-[HUComfortSoundsController crossFading](self, "crossFading"))
  {
    outputGain = self->_outputGain;
    *(float *)&outputGain = outputGain;
    -[AVAudioPlayerNode setVolume:](self->_currentNode, "setVolume:", outputGain);
  }
}

- (void)rampOutputGainFrom:(double)a3 to:(double)a4 withProgress:(double)a5
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double duckDuration;
  double stepsPerSecond;
  double v17;
  id v18;
  dispatch_block_t v19;
  id duckingBlock;
  dispatch_time_t v21;
  _QWORD block[5];
  id v23[5];
  id v24[9];

  if (a3 != a4)
  {
    v24[1] = v10;
    v24[2] = v9;
    v24[3] = v8;
    v24[4] = v7;
    v24[7] = v5;
    v24[8] = v6;
    duckDuration = self->_duckDuration;
    stepsPerSecond = self->_stepsPerSecond;
    v17 = 1.0 / (duckDuration * stepsPerSecond);
    -[HUComfortSoundsController setOutputGain:](self, "setOutputGain:", self->_outputGain + (a4 - a3) / (duckDuration * stepsPerSecond + 1.0));
    v18 = objc_initWeak(v24, self);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__HUComfortSoundsController_rampOutputGainFrom_to_withProgress___block_invoke;
    block[3] = &unk_1EA8EAF40;
    v23[1] = *(id *)&a5;
    v23[2] = *(id *)&v17;
    block[4] = self;
    v23[3] = *(id *)&a3;
    v23[4] = *(id *)&a4;
    objc_copyWeak(v23, v24);
    v19 = dispatch_block_create((dispatch_block_flags_t)0, block);
    duckingBlock = self->_duckingBlock;
    self->_duckingBlock = v19;

    v21 = dispatch_time(0, (uint64_t)(self->_stepDuration * 1000000000.0));
    dispatch_after(v21, (dispatch_queue_t)self->_audioQueue, self->_duckingBlock);
    objc_destroyWeak(v23);

    objc_destroyWeak(v24);
  }
}

void __64__HUComfortSoundsController_rampOutputGainFrom_to_withProgress___block_invoke(uint64_t a1)
{
  double v2;
  void *v3;
  BOOL v4;
  id WeakRetained;
  id v6;

  v2 = *(double *)(a1 + 48) + *(double *)(a1 + 56);
  v3 = *(void **)(a1 + 32);
  if (v3)
    v4 = v2 < 1.0;
  else
    v4 = 0;
  if (v4)
  {
    objc_msgSend(v3, "rampOutputGainFrom:to:withProgress:", *(double *)(a1 + 64), *(double *)(a1 + 72), v2);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "setOutputGain:", *(double *)(a1 + 72));

    if (*(double *)(a1 + 72) == 0.0)
    {
      v6 = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(v6, "stopOnQueueAndClearRoute:", 1);

    }
  }
}

- (void)rampNodeVolume:(id)a3 from:(double)a4 to:(double)a5 fadeDuration:(double)a6
{
  -[HUComfortSoundsController rampNodeVolume:from:to:fadeDuration:withProgress:](self, "rampNodeVolume:from:to:fadeDuration:withProgress:", a3, a4, a5, a6, 0.0);
}

- (void)rampNodeVolume:(id)a3 from:(double)a4 to:(double)a5 fadeDuration:(double)a6 withProgress:(double)a7
{
  id v12;
  double stepsPerSecond;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  BOOL v21;
  id rampUpBlock;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  dispatch_block_t v28;
  objc_class *v29;
  uint64_t v30;
  void *v31;
  dispatch_time_t v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  void *v38;
  id rampDownBlock;
  _QWORD block[4];
  id v41;
  id v42[6];
  uint8_t buf[4];
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  stepsPerSecond = self->_stepsPerSecond;
  v14 = vabdd_f64(a5, a4);
  v15 = a7 * 1.57079633;
  if (a5 <= a4)
    v16 = a5 + cos(v15) * v14;
  else
    v16 = a4 + sin(v15) * v14;
  -[HUComfortSoundsController outputGain](self, "outputGain");
  v18 = v16 * v17;
  v19 = 0.0;
  if (v18 >= 0.0)
    v19 = v18;
  if (v18 <= 1.0)
    v20 = v19;
  else
    v20 = 1.0;
  *(float *)&v20 = v20;
  objc_msgSend(v12, "setVolume:", v20, v19);
  if (a5 <= a4)
    v21 = v16 <= a5;
  else
    v21 = v16 >= a5;
  if (v21)
  {
    if (a5 <= a4)
    {
      objc_msgSend(v12, "stop");
      if (!-[HUComfortSoundsController shouldContinuePlayback](self, "shouldContinuePlayback"))
      {
        CSInitializeLogging();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Playback ended. Stopping"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsController rampNodeVolume:from:to:fadeDuration:withProgress:]", 1176, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = (void *)*MEMORY[0x1E0D2F918];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F918], OS_LOG_TYPE_DEFAULT))
        {
          v36 = objc_retainAutorelease(v34);
          v37 = v35;
          *(_DWORD *)buf = 136446210;
          v44 = objc_msgSend(v36, "UTF8String");
          _os_log_impl(&dword_1DE311000, v37, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

        }
        -[HUComfortSoundsController engine](self, "engine");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "stop");

      }
      rampDownBlock = self->_rampDownBlock;
      self->_rampDownBlock = 0;

    }
    else
    {
      rampUpBlock = self->_rampUpBlock;
      self->_rampUpBlock = 0;

      -[HUComfortSoundsController setCrossFading:](self, "setCrossFading:", 0);
      -[HUComfortSoundsController setChangingSounds:](self, "setChangingSounds:", 0);
      if (-[HUComfortSoundsController changePending](self, "changePending"))
      {
        CSInitializeLogging();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Performing pending change request."));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsController rampNodeVolume:from:to:fadeDuration:withProgress:]", 1165, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)*MEMORY[0x1E0D2F918];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F918], OS_LOG_TYPE_DEFAULT))
        {
          v26 = objc_retainAutorelease(v24);
          v27 = v25;
          *(_DWORD *)buf = 136446210;
          v44 = objc_msgSend(v26, "UTF8String");
          _os_log_impl(&dword_1DE311000, v27, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

        }
        -[HUComfortSoundsController setChangePending:](self, "setChangePending:", 0);
        -[HUComfortSoundsController scheduleNewFile](self, "scheduleNewFile");
      }
    }
  }
  else
  {
    objc_initWeak((id *)buf, self);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __78__HUComfortSoundsController_rampNodeVolume_from_to_fadeDuration_withProgress___block_invoke;
    block[3] = &unk_1EA8EAF68;
    objc_copyWeak(v42, (id *)buf);
    v42[1] = *(id *)&a7;
    *(double *)&v42[2] = 1.0 / (stepsPerSecond * a6);
    v41 = v12;
    v42[3] = *(id *)&a4;
    v42[4] = *(id *)&a5;
    v42[5] = *(id *)&a6;
    v28 = dispatch_block_create((dispatch_block_flags_t)0, block);
    v29 = (objc_class *)MEMORY[0x1DF0EB808]();
    v30 = 32;
    if (a5 > a4)
      v30 = 24;
    v31 = *(Class *)((char *)&self->super.isa + v30);
    *(Class *)((char *)&self->super.isa + v30) = v29;

    v32 = dispatch_time(0, (uint64_t)(self->_stepDuration * 1000000000.0));
    dispatch_after(v32, (dispatch_queue_t)self->_audioQueue, v28);

    objc_destroyWeak(v42);
    objc_destroyWeak((id *)buf);
  }

}

void __78__HUComfortSoundsController_rampNodeVolume_from_to_fadeDuration_withProgress___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "rampNodeVolume:from:to:fadeDuration:withProgress:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 48) + *(double *)(a1 + 56));
    WeakRetained = v3;
  }

}

- (void)startComfortSounds
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[6];
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  CSInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CS enabled. Starting"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsController startComfortSounds]", 1187, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)*MEMORY[0x1E0D2F918];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F918], OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_retainAutorelease(v4);
    v7 = v5;
    *(_DWORD *)buf = 136446210;
    v15 = objc_msgSend(v6, "UTF8String");
    _os_log_impl(&dword_1DE311000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  -[HUComfortSoundsController play](self, "play");
  +[HUComfortSoundsSettings sharedInstance](HUComfortSoundsSettings, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selectedComfortSound");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "soundGroup");

  -[HUComfortSoundsController assetManager](self, "assetManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "availableAssets");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __47__HUComfortSoundsController_startComfortSounds__block_invoke;
  v13[3] = &unk_1EA8EAF90;
  v13[4] = self;
  v13[5] = v10;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v13);

}

void __47__HUComfortSoundsController_startComfortSounds__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "properties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", CFSTR("SoundGroup"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");
  v6 = *(_QWORD *)(a1 + 40);

  if (v5 == v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "assetManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "assetId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "downloadAssetWithId:", v8);

  }
}

- (void)stop
{
  NSObject *audioQueue;
  _QWORD block[5];

  audioQueue = self->_audioQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__HUComfortSoundsController_stop__block_invoke;
  block[3] = &unk_1EA8E8220;
  block[4] = self;
  dispatch_async(audioQueue, block);
}

uint64_t __33__HUComfortSoundsController_stop__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopOnQueueAndClearRoute:", 1);
}

- (void)stopAndClearRoute:(BOOL)a3
{
  NSObject *audioQueue;
  _QWORD v4[5];
  BOOL v5;

  audioQueue = self->_audioQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__HUComfortSoundsController_stopAndClearRoute___block_invoke;
  v4[3] = &unk_1EA8EAFB8;
  v4[4] = self;
  v5 = a3;
  dispatch_async(audioQueue, v4);
}

uint64_t __47__HUComfortSoundsController_stopAndClearRoute___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopOnQueueAndClearRoute:", *(unsigned __int8 *)(a1 + 40));
}

- (void)stopOnQueueAndClearRoute:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  os_log_t *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id mixingBlock;
  id rampUpBlock;
  id rampDownBlock;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  os_log_t v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v3 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  CSInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Stopping"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsController stopOnQueueAndClearRoute:]", 1221, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (os_log_t *)MEMORY[0x1E0D2F918];
  v8 = (void *)*MEMORY[0x1E0D2F918];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F918], OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_retainAutorelease(v6);
    v10 = v8;
    *(_DWORD *)buf = 136446210;
    v24 = objc_msgSend(v9, "UTF8String");
    _os_log_impl(&dword_1DE311000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  mixingBlock = self->_mixingBlock;
  if (mixingBlock)
    dispatch_block_cancel(mixingBlock);
  rampUpBlock = self->_rampUpBlock;
  if (rampUpBlock)
    dispatch_block_cancel(rampUpBlock);
  rampDownBlock = self->_rampDownBlock;
  if (rampDownBlock)
    dispatch_block_cancel(rampDownBlock);
  if (v3)
    -[HUComfortSoundsController clearActiveRoute](self, "clearActiveRoute");
  -[HUComfortSoundsController audioPlayerNodeA](self, "audioPlayerNodeA");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stop");

  -[HUComfortSoundsController audioPlayerNodeB](self, "audioPlayerNodeB");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stop");

  if (!-[HUComfortSoundsController shouldContinuePlayback](self, "shouldContinuePlayback"))
  {
    CSInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Stopping engine"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsController stopOnQueueAndClearRoute:]", 1246, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      v19 = objc_retainAutorelease(v17);
      v20 = v18;
      v21 = objc_msgSend(v19, "UTF8String");
      *(_DWORD *)buf = 136446210;
      v24 = v21;
      _os_log_impl(&dword_1DE311000, v20, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    -[HUComfortSoundsController engine](self, "engine");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stop");

    -[HUComfortSoundsController setTransaction:](self, "setTransaction:", 0);
    -[AVAudioSession setActive:forFeature:error:](self->_session, "setActive:forFeature:error:", 0, 2048, 0);
  }
  -[HUComfortSoundsController clearEngine](self, "clearEngine");
}

- (void)availableAssetsDidUpdate
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  BOOL v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CF2D60];
  -[HUComfortSoundsAssetManager availableAssets](self->_assetManager, "availableAssets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v2, "archivedAssets:error:", v3, &v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v13;

  if (objc_msgSend(v4, "length"))
    v6 = v5 == 0;
  else
    v6 = 0;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v4, CFSTR("HUComfortSoundsAvailableAssetsKey"), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D2F990], "messagePayloadFromDictionary:andIdentifier:", v12, 0x1000000);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    +[AXHeardController sharedServer](AXHeardController, "sharedServer");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D2F9A0], "messageWithPayload:", v7);
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sendUpdateMessage:forIdentifier:", v10, 0x1000000);
    goto LABEL_8;
  }
  CSInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error archiving assets %@"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsController availableAssetsDidUpdate]", 1274, v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = (void *)*MEMORY[0x1E0D2F918];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F918], OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_retainAutorelease(v8);
    v10 = v9;
    v11 = objc_msgSend(v8, "UTF8String");
    *(_DWORD *)buf = 136446210;
    v15 = v11;
    _os_log_impl(&dword_1DE311000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
LABEL_8:

  }
}

- (void)assetDownloadDidUpdate
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  BOOL v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CF2D60];
  -[HUComfortSoundsAssetManager availableAssets](self->_assetManager, "availableAssets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v3, "archivedAssets:error:", v4, &v16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v16;

  if (objc_msgSend(v5, "length"))
    v7 = v6 == 0;
  else
    v7 = 0;
  if (v7)
  {
    v13 = (void *)MEMORY[0x1E0C99D80];
    -[HUComfortSoundsAssetManager assetDownloadProgress](self->_assetManager, "assetDownloadProgress");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryWithObjectsAndKeys:", v5, CFSTR("HUComfortSoundsAvailableAssetsKey"), v14, CFSTR("HUComfortSoundsDownloadProgressKey"), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D2F990], "messagePayloadFromDictionary:andIdentifier:", v15, 0x1000000);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    +[AXHeardController sharedServer](AXHeardController, "sharedServer");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D2F9A0], "messageWithPayload:", v8);
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sendUpdateMessage:forIdentifier:", v11, 0x1000000);
    goto LABEL_8;
  }
  CSInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error archiving assets %@"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsController assetDownloadDidUpdate]", 1290, v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = (void *)*MEMORY[0x1E0D2F918];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F918], OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_retainAutorelease(v9);
    v11 = v10;
    v12 = objc_msgSend(v9, "UTF8String");
    *(_DWORD *)buf = 136446210;
    v18 = v12;
    _os_log_impl(&dword_1DE311000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
LABEL_8:

  }
}

- (id)processComfortSoundsAssetRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  HUComfortSoundsController *v10;

  v4 = a3;
  objc_msgSend(v4, "payload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__HUComfortSoundsController_processComfortSoundsAssetRequest___block_invoke;
  v8[3] = &unk_1EA8E9CF0;
  v9 = v4;
  v10 = self;
  v6 = v4;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v8);

  return 0;
}

void __62__HUComfortSoundsController_processComfortSoundsAssetRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("ax_hearing_should_register_client_key")))
  {
    v6 = objc_msgSend(v5, "BOOLValue");
    objc_msgSend(*(id *)(a1 + 32), "client");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWantsUpdates:forIdentifier:", v6, 0x1000000);

    if ((_DWORD)v6)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 176), "availableAssets");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");

      v10 = *(id **)(a1 + 40);
      if (v9)
        objc_msgSend(v10, "availableAssetsDidUpdate");
      else
        objc_msgSend(v10[22], "refreshAssets");
    }
  }
  else if (objc_msgSend(v11, "isEqualToString:", CFSTR("HUComfortSoundsDownloadAssetKey")))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 176), "downloadAssetWithId:", v5);
  }
  else if (objc_msgSend(v11, "isEqualToString:", CFSTR("HUComfortSoundsRemoveAssetKey")))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 176), "removeAssetWithId:", v5);
  }

}

- (AVAudioSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (AVAudioEngine)engine
{
  return self->_engine;
}

- (void)setEngine:(id)a3
{
  objc_storeStrong((id *)&self->_engine, a3);
}

- (void)setAudioPlayerNodeA:(id)a3
{
  objc_storeStrong((id *)&self->_audioPlayerNodeA, a3);
}

- (void)setAudioPlayerNodeB:(id)a3
{
  objc_storeStrong((id *)&self->_audioPlayerNodeB, a3);
}

- (AVAudioPlayerNode)currentNode
{
  return self->_currentNode;
}

- (void)setCurrentNode:(id)a3
{
  objc_storeStrong((id *)&self->_currentNode, a3);
}

- (OS_dispatch_queue)audioQueue
{
  return self->_audioQueue;
}

- (void)setAudioQueue:(id)a3
{
  objc_storeStrong((id *)&self->_audioQueue, a3);
}

- (NSString)routeUID
{
  return self->_routeUID;
}

- (void)setRouteUID:(id)a3
{
  objc_storeStrong((id *)&self->_routeUID, a3);
}

- (BOOL)holdingForCall
{
  return self->_holdingForCall;
}

- (void)setHoldingForCall:(BOOL)a3
{
  self->_holdingForCall = a3;
}

- (BOOL)temporaryAirpodsDisconnect
{
  return self->_temporaryAirpodsDisconnect;
}

- (void)setTemporaryAirpodsDisconnect:(BOOL)a3
{
  self->_temporaryAirpodsDisconnect = a3;
}

- (BOOL)liveListenComfortSoundsSwitch
{
  return self->_liveListenComfortSoundsSwitch;
}

- (void)setLiveListenComfortSoundsSwitch:(BOOL)a3
{
  self->_liveListenComfortSoundsSwitch = a3;
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_transaction, a3);
}

- (HUComfortSound)selectedSound
{
  return self->_selectedSound;
}

- (void)setSelectedSound:(id)a3
{
  objc_storeStrong((id *)&self->_selectedSound, a3);
}

- (HUComfortSoundsAssetManager)assetManager
{
  return self->_assetManager;
}

- (void)setAssetManager:(id)a3
{
  objc_storeStrong((id *)&self->_assetManager, a3);
}

- (double)outputGain
{
  return self->_outputGain;
}

- (BOOL)crossFading
{
  return self->_crossFading;
}

- (void)setCrossFading:(BOOL)a3
{
  self->_crossFading = a3;
}

- (BOOL)changingSounds
{
  return self->_changingSounds;
}

- (void)setChangingSounds:(BOOL)a3
{
  self->_changingSounds = a3;
}

- (BOOL)changePending
{
  return self->_changePending;
}

- (void)setChangePending:(BOOL)a3
{
  self->_changePending = a3;
}

- (BOOL)isScreenBlank
{
  return self->_isScreenBlank;
}

- (void)setIsScreenBlank:(BOOL)a3
{
  self->_isScreenBlank = a3;
}

- (BOOL)isDeviceLockedWithPasscode
{
  return self->_isDeviceLockedWithPasscode;
}

- (void)setIsDeviceLockedWithPasscode:(BOOL)a3
{
  self->_isDeviceLockedWithPasscode = a3;
}

- (BOOL)isInContinuitySession
{
  return self->_isInContinuitySession;
}

- (void)setIsInContinuitySession:(BOOL)a3
{
  self->_isInContinuitySession = a3;
}

- (int)blankScreenToken
{
  return self->_blankScreenToken;
}

- (void)setBlankScreenToken:(int)a3
{
  self->_blankScreenToken = a3;
}

- (int)keybagLockStateToken
{
  return self->_keybagLockStateToken;
}

- (void)setKeybagLockStateToken:(int)a3
{
  self->_keybagLockStateToken = a3;
}

- (int)lockStateNotifyToken
{
  return self->_lockStateNotifyToken;
}

- (void)setLockStateNotifyToken:(int)a3
{
  self->_lockStateNotifyToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetManager, 0);
  objc_storeStrong((id *)&self->_selectedSound, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_routeUID, 0);
  objc_storeStrong((id *)&self->_audioQueue, 0);
  objc_storeStrong((id *)&self->_currentNode, 0);
  objc_storeStrong((id *)&self->_audioPlayerNodeB, 0);
  objc_storeStrong((id *)&self->_audioPlayerNodeA, 0);
  objc_storeStrong((id *)&self->_engine, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong(&self->_rampDownBlock, 0);
  objc_storeStrong(&self->_rampUpBlock, 0);
  objc_storeStrong(&self->_duckingBlock, 0);
  objc_storeStrong(&self->_mixingBlock, 0);
}

- (void)callStatusDidChange:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  _DWORD v4[2];
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = *(unsigned __int8 *)(a1 + 80);
  v4[0] = 67109379;
  v4[1] = v3;
  v5 = 2113;
  v6 = a2;
  _os_log_debug_impl(&dword_1DE311000, log, OS_LOG_TYPE_DEBUG, "Phone call holding %d with notification %{private}@", (uint8_t *)v4, 0x12u);
}

- (void)callStatusDidChange:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138477827;
  v3 = a1;
  _os_log_debug_impl(&dword_1DE311000, a2, OS_LOG_TYPE_DEBUG, "Call status changed - %{private}@", (uint8_t *)&v2, 0xCu);
}

@end
