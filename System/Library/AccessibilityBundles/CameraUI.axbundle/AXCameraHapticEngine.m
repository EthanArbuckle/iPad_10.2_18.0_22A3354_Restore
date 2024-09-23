@implementation AXCameraHapticEngine

- (AXCameraHapticEngine)init
{
  AXCameraHapticEngine *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  AXCameraHapticEngine *v11;
  NSObject *v12;
  _QWORD v14[4];
  id v15;
  id location[2];
  id v17;
  id v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)AXCameraHapticEngine;
  v2 = -[AXCameraHapticEngine init](&v19, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBF5C0], "capabilitiesForHardware");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "supportsHaptics") & 1) != 0 || (objc_msgSend(v3, "supportsAudio") & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDB1858], "sharedInstance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 0;
      objc_msgSend(v4, "setPrefersNoDucking:error:", 1, &v18);
      v5 = v18;

      if (v5)
      {
        AXMediaLogHaptics();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          -[AXCameraHapticEngine init].cold.2();

      }
      v7 = objc_alloc(MEMORY[0x24BDBF5C0]);
      objc_msgSend(MEMORY[0x24BDB1858], "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 0;
      v9 = (void *)objc_msgSend(v7, "initWithAudioSession:error:", v8, &v17);
      v10 = v17;

      if (!v9 || v10)
      {
        AXMediaLogHaptics();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          -[AXCameraHapticEngine init].cold.1();

        v11 = 0;
      }
      else
      {
        v2->__supportsHaptics = objc_msgSend(v3, "supportsHaptics");
        v2->__supportsAudio = objc_msgSend(v3, "supportsAudio");
        objc_storeStrong((id *)&v2->__engine, v9);
        -[AXCameraHapticEngine _createLevelPlayerIfNeeded](v2, "_createLevelPlayerIfNeeded");
        -[AXCameraHapticEngine _createUnlevelPlayerIfNeeded](v2, "_createUnlevelPlayerIfNeeded");
        -[AXCameraHapticEngine _createScreenEdgePlayerIfNeeded](v2, "_createScreenEdgePlayerIfNeeded");
        -[CHHapticEngine setMuteHapticsWhileRecordingAudio:](v2->__engine, "setMuteHapticsWhileRecordingAudio:", 0);
        objc_initWeak(location, v2);
        v14[0] = MEMORY[0x24BDAC760];
        v14[1] = 3221225472;
        v14[2] = __28__AXCameraHapticEngine_init__block_invoke;
        v14[3] = &unk_24FEDFC48;
        objc_copyWeak(&v15, location);
        -[CHHapticEngine setResetHandler:](v2->__engine, "setResetHandler:", v14);
        -[CHHapticEngine setAutoShutdownEnabled:](v2->__engine, "setAutoShutdownEnabled:", 1);
        objc_msgSend(v9, "setStoppedHandler:", &__block_literal_global);
        v11 = v2;
        objc_destroyWeak(&v15);
        objc_destroyWeak(location);
      }

    }
    else
    {
      AXMediaLogHaptics();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_230B33000, v10, OS_LOG_TYPE_DEFAULT, "Haptics and audio not supported", (uint8_t *)location, 2u);
      }
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __28__AXCameraHapticEngine_init__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  AXMediaLogHaptics();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_230B33000, v2, OS_LOG_TYPE_DEFAULT, "CHHapticEngine reset received", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_releasePlayers");

}

void __28__AXCameraHapticEngine_init__block_invoke_197(uint64_t a1, uint64_t a2)
{
  void *v2;
  NSObject *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  +[AXCameraHapticEngine _stringForHapticEngineStoppedReason:](AXCameraHapticEngine, "_stringForHapticEngineStoppedReason:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  AXMediaLogHaptics();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_230B33000, v3, OS_LOG_TYPE_DEFAULT, "CHHapticEngine stopped for reason %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)dealloc
{
  objc_super v3;

  -[AXCameraHapticEngine _unregisterAudioResource:](self, "_unregisterAudioResource:", -[AXCameraHapticEngine _levelAudioResourceID](self, "_levelAudioResourceID"));
  -[AXCameraHapticEngine _unregisterAudioResource:](self, "_unregisterAudioResource:", -[AXCameraHapticEngine _unlevelAudioResourceID](self, "_unlevelAudioResourceID"));
  v3.receiver = self;
  v3.super_class = (Class)AXCameraHapticEngine;
  -[AXCameraHapticEngine dealloc](&v3, sel_dealloc);
}

+ (id)_stringForHapticEngineStoppedReason:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) > 4)
    return CFSTR("Unexpected enum");
  else
    return off_24FEDFCD0[a3 + 1];
}

- (void)_releasePlayers
{
  -[AXCameraHapticEngine set_levelPlayer:](self, "set_levelPlayer:", 0);
  -[AXCameraHapticEngine set_unlevelPlayer:](self, "set_unlevelPlayer:", 0);
  -[AXCameraHapticEngine set_screenEdgePlayer:](self, "set_screenEdgePlayer:", 0);
}

- (void)_createLevelPlayerIfNeeded
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_230B33000, v0, v1, "Error creating player: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_createUnlevelPlayerIfNeeded
{
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  double v7;
  void *v8;
  id v9;
  double v10;
  void *v11;
  id v12;
  _QWORD *v13;
  double v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  id v20;
  double v21;
  void *v22;
  id v23;
  double v24;
  void *v25;
  id v26;
  double v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  id v32;
  double v33;
  void *v34;
  id v35;
  double v36;
  void *v37;
  id v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  unint64_t v45;
  id v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  id v59;
  NSObject *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  id v64;
  id v65;
  void *v66;
  _QWORD v67[3];
  _QWORD v68[3];
  _QWORD v69[4];

  v69[3] = *MEMORY[0x24BDAC8D0];
  -[AXCameraHapticEngine _unlevelPlayer](self, "_unlevelPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[AXCameraHapticEngine set_unlevelAudioResourceID:](self, "set_unlevelAudioResourceID:", -[AXCameraHapticEngine _registerAudioWithResourceWithName:](self, "_registerAudioWithResourceWithName:", CFSTR("outLevel.aif")));
    if (-[AXCameraHapticEngine _supportsHaptics](self, "_supportsHaptics"))
    {
      v4 = objc_alloc(MEMORY[0x24BDBF5C8]);
      v5 = *MEMORY[0x24BDBF560];
      v6 = objc_alloc(MEMORY[0x24BDBF5D0]);
      LODWORD(v7) = 0.75;
      v8 = (void *)objc_msgSend(v6, "initWithParameterID:value:", *MEMORY[0x24BDBF540], v7);
      v69[0] = v8;
      v9 = objc_alloc(MEMORY[0x24BDBF5D0]);
      LODWORD(v10) = 1.0;
      v11 = (void *)objc_msgSend(v9, "initWithParameterID:value:", *MEMORY[0x24BDBF550], v10);
      v69[1] = v11;
      v12 = objc_alloc(MEMORY[0x24BDBF5D0]);
      v13 = (_QWORD *)MEMORY[0x24BDBF538];
      LODWORD(v14) = 0;
      v15 = (void *)objc_msgSend(v12, "initWithParameterID:value:", *MEMORY[0x24BDBF538], v14);
      v69[2] = v15;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v69, 3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = objc_msgSend(v4, "initWithEventType:parameters:relativeTime:", v5, v16, 0.0);

      v17 = objc_alloc(MEMORY[0x24BDBF5C8]);
      v18 = (uint64_t *)MEMORY[0x24BDBF560];
      v19 = *MEMORY[0x24BDBF560];
      v20 = objc_alloc(MEMORY[0x24BDBF5D0]);
      LODWORD(v21) = 0.75;
      v22 = (void *)objc_msgSend(v20, "initWithParameterID:value:", *MEMORY[0x24BDBF540], v21);
      v68[0] = v22;
      v23 = objc_alloc(MEMORY[0x24BDBF5D0]);
      LODWORD(v24) = 1.0;
      v25 = (void *)objc_msgSend(v23, "initWithParameterID:value:", *MEMORY[0x24BDBF550], v24);
      v68[1] = v25;
      v26 = objc_alloc(MEMORY[0x24BDBF5D0]);
      LODWORD(v27) = 0;
      v28 = (void *)objc_msgSend(v26, "initWithParameterID:value:", *v13, v27);
      v68[2] = v28;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v68, 3);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v17, "initWithEventType:parameters:relativeTime:", v19, v29, 0.075);

      v31 = objc_alloc(MEMORY[0x24BDBF5C8]);
      v61 = *v18;
      v32 = objc_alloc(MEMORY[0x24BDBF5D0]);
      LODWORD(v33) = 0.75;
      v34 = (void *)objc_msgSend(v32, "initWithParameterID:value:", *MEMORY[0x24BDBF540], v33);
      v67[0] = v34;
      v35 = objc_alloc(MEMORY[0x24BDBF5D0]);
      LODWORD(v36) = 1.0;
      v37 = (void *)objc_msgSend(v35, "initWithParameterID:value:", *MEMORY[0x24BDBF550], v36);
      v67[1] = v37;
      v38 = objc_alloc(MEMORY[0x24BDBF5D0]);
      LODWORD(v39) = 0;
      v40 = (void *)objc_msgSend(v38, "initWithParameterID:value:", *MEMORY[0x24BDBF538], v39);
      v67[2] = v40;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v67, 3);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = (void *)objc_msgSend(v31, "initWithEventType:parameters:relativeTime:", v61, v41, 0.15);

      v43 = (void *)v62;
    }
    else
    {
      v42 = 0;
      v30 = 0;
      v43 = 0;
    }
    if (-[AXCameraHapticEngine _unlevelAudioResourceID](self, "_unlevelAudioResourceID"))
    {
      v44 = objc_alloc(MEMORY[0x24BDBF5C8]);
      v45 = -[AXCameraHapticEngine _unlevelAudioResourceID](self, "_unlevelAudioResourceID");
      v46 = objc_alloc(MEMORY[0x24BDBF5D0]);
      LODWORD(v47) = 0.75;
      v48 = (void *)objc_msgSend(v46, "initWithParameterID:value:", *MEMORY[0x24BDBF530], v47);
      v66 = v48;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v66, 1);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = (void *)objc_msgSend(v44, "initWithAudioResourceID:parameters:relativeTime:", v45, v49, 0.0);

    }
    else
    {
      v50 = 0;
    }
    v51 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v52 = v51;
    if (v43)
      objc_msgSend(v51, "addObject:", v43);
    if (v30)
      objc_msgSend(v52, "addObject:", v30);
    v63 = (void *)v30;
    if (v42)
      objc_msgSend(v52, "addObject:", v42);
    v53 = v43;
    if (v50)
      objc_msgSend(v52, "addObject:", v50);
    v54 = objc_alloc(MEMORY[0x24BDBF5E0]);
    v65 = 0;
    v55 = (void *)objc_msgSend(v54, "initWithEvents:parameters:error:", v52, MEMORY[0x24BDBD1A8], &v65);
    v56 = v65;
    -[AXCameraHapticEngine _engine](self, "_engine");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v56;
    objc_msgSend(v57, "createPrivilegedPlayerWithPlayable:error:", v55, &v64);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v64;

    if (!v58 || v59)
    {
      AXMediaLogHaptics();
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
        -[AXCameraHapticEngine _createLevelPlayerIfNeeded].cold.1();

    }
    else
    {
      -[AXCameraHapticEngine set_unlevelPlayer:](self, "set_unlevelPlayer:", v58);
    }

  }
}

- (void)_createScreenEdgePlayerIfNeeded
{
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  double v7;
  void *v8;
  id v9;
  double v10;
  void *v11;
  id v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  id v26;
  id v27;
  _QWORD v28[4];

  v28[3] = *MEMORY[0x24BDAC8D0];
  -[AXCameraHapticEngine _screenEdgePlayer](self, "_screenEdgePlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    if (-[AXCameraHapticEngine _supportsHaptics](self, "_supportsHaptics"))
    {
      v4 = objc_alloc(MEMORY[0x24BDBF5C8]);
      v5 = *MEMORY[0x24BDBF560];
      v6 = objc_alloc(MEMORY[0x24BDBF5D0]);
      LODWORD(v7) = 1.0;
      v8 = (void *)objc_msgSend(v6, "initWithParameterID:value:", *MEMORY[0x24BDBF540], v7);
      v28[0] = v8;
      v9 = objc_alloc(MEMORY[0x24BDBF5D0]);
      LODWORD(v10) = 1.0;
      v11 = (void *)objc_msgSend(v9, "initWithParameterID:value:", *MEMORY[0x24BDBF550], v10);
      v28[1] = v11;
      v12 = objc_alloc(MEMORY[0x24BDBF5D0]);
      LODWORD(v13) = 0;
      v14 = (void *)objc_msgSend(v12, "initWithParameterID:value:", *MEMORY[0x24BDBF538], v13);
      v28[2] = v14;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v4, "initWithEventType:parameters:relativeTime:", v5, v15, 0.0);

      v17 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v18 = v17;
      if (v16)
      {
        objc_msgSend(v17, "addObject:", v16);

      }
    }
    else
    {
      v18 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    }
    v19 = objc_alloc(MEMORY[0x24BDBF5E0]);
    v27 = 0;
    v20 = (void *)objc_msgSend(v19, "initWithEvents:parameters:error:", v18, MEMORY[0x24BDBD1A8], &v27);
    v21 = v27;
    -[AXCameraHapticEngine _engine](self, "_engine");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v21;
    objc_msgSend(v22, "createPrivilegedPlayerWithPlayable:error:", v20, &v26);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v26;

    if (!v23 || v24)
    {
      AXMediaLogHaptics();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[AXCameraHapticEngine _createLevelPlayerIfNeeded].cold.1();

    }
    else
    {
      -[AXCameraHapticEngine set_screenEdgePlayer:](self, "set_screenEdgePlayer:", v23);
    }

  }
}

- (unint64_t)_registerAudioWithResourceWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  NSObject *v11;
  NSObject *v12;
  id v14;

  v4 = a3;
  if (-[AXCameraHapticEngine _supportsAudio](self, "_supportsAudio"))
  {
    objc_msgSend(v4, "stringByDeletingPathExtension");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pathExtension");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLForResource:withExtension:", v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[AXCameraHapticEngine _engine](self, "_engine");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 0;
      v10 = objc_msgSend(v9, "registerAudioResource:options:error:", v8, MEMORY[0x24BDBD1B8], &v14);
      v11 = v14;

      if (v10 && !v11)
        goto LABEL_12;
      AXMediaLogHaptics();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[AXCameraHapticEngine _registerAudioWithResourceWithName:].cold.2();

    }
    else
    {
      AXMediaLogHaptics();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[AXCameraHapticEngine _registerAudioWithResourceWithName:].cold.1();
    }
    v10 = 0;
LABEL_12:

    goto LABEL_13;
  }
  v10 = 0;
LABEL_13:

  return v10;
}

- (void)_unregisterAudioResource:(unint64_t)a3
{
  void *v4;
  int v5;
  id v6;
  NSObject *v7;
  id v8;

  if (a3)
  {
    -[AXCameraHapticEngine _engine](self, "_engine");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    v5 = objc_msgSend(v4, "unregisterAudioResource:error:", a3, &v8);
    v6 = v8;

    if (!v5 || v6)
    {
      AXMediaLogHaptics();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[AXCameraHapticEngine _unregisterAudioResource:].cold.1();

    }
  }
}

- (void)_performHapticForPlayer:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[4];
  NSObject *v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  AXMediaLogHaptics();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v4;
      _os_log_impl(&dword_230B33000, v6, OS_LOG_TYPE_INFO, "Playing haptic/sound for: %@", buf, 0xCu);
    }

    -[AXCameraHapticEngine _engine](self, "_engine");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __48__AXCameraHapticEngine__performHapticForPlayer___block_invoke;
    v8[3] = &unk_24FEDFCB0;
    v9 = v4;
    objc_msgSend(v7, "startWithCompletionHandler:", v8);

    v6 = v9;
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230B33000, v6, OS_LOG_TYPE_DEFAULT, "Trying to play haptic with nil player", buf, 2u);
  }

}

void __48__AXCameraHapticEngine__performHapticForPlayer___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  NSObject *v7;
  BOOL v8;
  NSObject *v9;
  id v10;

  v3 = a2;
  if (v3)
  {
    AXMediaLogHaptics();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __48__AXCameraHapticEngine__performHapticForPlayer___block_invoke_cold_2();
  }
  else
  {
    v5 = *(void **)(a1 + 32);
    v10 = 0;
    v6 = objc_msgSend(v5, "startAtTime:error:", &v10, 0.0);
    v7 = v10;
    v4 = v7;
    if (v6)
      v8 = v7 == 0;
    else
      v8 = 0;
    if (!v8)
    {
      AXMediaLogHaptics();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __48__AXCameraHapticEngine__performHapticForPlayer___block_invoke_cold_1();

    }
  }

}

- (void)performLevelFeedback
{
  id v3;

  -[AXCameraHapticEngine _createLevelPlayerIfNeeded](self, "_createLevelPlayerIfNeeded");
  -[AXCameraHapticEngine _levelPlayer](self, "_levelPlayer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[AXCameraHapticEngine _performHapticForPlayer:](self, "_performHapticForPlayer:", v3);

}

- (void)performUnlevelFeedback
{
  id v3;

  -[AXCameraHapticEngine _createUnlevelPlayerIfNeeded](self, "_createUnlevelPlayerIfNeeded");
  -[AXCameraHapticEngine _unlevelPlayer](self, "_unlevelPlayer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[AXCameraHapticEngine _performHapticForPlayer:](self, "_performHapticForPlayer:", v3);

}

- (void)performSubjectHitScreenEdgeFeedback
{
  double Current;
  double v4;
  double v5;
  double v6;
  void *v8;
  double v9;
  NSObject *v10;
  int v11;
  double v12;
  __int16 v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  Current = CFAbsoluteTimeGetCurrent();
  -[AXCameraHapticEngine _lastScreenEdgeTimestamp](self, "_lastScreenEdgeTimestamp");
  v5 = Current - v4;
  -[AXCameraHapticEngine screenEdgeFeedbackCooldownTime](self, "screenEdgeFeedbackCooldownTime");
  if (v6 > 0.0 && v5 < v6)
  {
    v9 = v6;
    AXMediaLogHaptics();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 134218240;
      v12 = v5;
      v13 = 2048;
      v14 = v9;
      _os_log_impl(&dword_230B33000, v10, OS_LOG_TYPE_DEFAULT, "Suppressing screen edge feedback %.3f seconds after previous feedback (cooldown time is %.3f)", (uint8_t *)&v11, 0x16u);
    }

  }
  else
  {
    -[AXCameraHapticEngine _createScreenEdgePlayerIfNeeded](self, "_createScreenEdgePlayerIfNeeded");
    -[AXCameraHapticEngine _screenEdgePlayer](self, "_screenEdgePlayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXCameraHapticEngine _performHapticForPlayer:](self, "_performHapticForPlayer:", v8);

    -[AXCameraHapticEngine set_lastScreenEdgeTimestamp:](self, "set_lastScreenEdgeTimestamp:", Current);
  }
}

- (double)screenEdgeFeedbackCooldownTime
{
  return self->_screenEdgeFeedbackCooldownTime;
}

- (void)setScreenEdgeFeedbackCooldownTime:(double)a3
{
  self->_screenEdgeFeedbackCooldownTime = a3;
}

- (BOOL)_supportsHaptics
{
  return self->__supportsHaptics;
}

- (BOOL)_supportsAudio
{
  return self->__supportsAudio;
}

- (CHHapticEngine)_engine
{
  return self->__engine;
}

- (CHHapticPatternPlayer)_levelPlayer
{
  return self->__levelPlayer;
}

- (void)set_levelPlayer:(id)a3
{
  objc_storeStrong((id *)&self->__levelPlayer, a3);
}

- (CHHapticPatternPlayer)_unlevelPlayer
{
  return self->__unlevelPlayer;
}

- (void)set_unlevelPlayer:(id)a3
{
  objc_storeStrong((id *)&self->__unlevelPlayer, a3);
}

- (CHHapticPatternPlayer)_screenEdgePlayer
{
  return self->__screenEdgePlayer;
}

- (void)set_screenEdgePlayer:(id)a3
{
  objc_storeStrong((id *)&self->__screenEdgePlayer, a3);
}

- (unint64_t)_levelAudioResourceID
{
  return self->__levelAudioResourceID;
}

- (void)set_levelAudioResourceID:(unint64_t)a3
{
  self->__levelAudioResourceID = a3;
}

- (unint64_t)_unlevelAudioResourceID
{
  return self->__unlevelAudioResourceID;
}

- (void)set_unlevelAudioResourceID:(unint64_t)a3
{
  self->__unlevelAudioResourceID = a3;
}

- (double)_lastScreenEdgeTimestamp
{
  return self->__lastScreenEdgeTimestamp;
}

- (void)set_lastScreenEdgeTimestamp:(double)a3
{
  self->__lastScreenEdgeTimestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__screenEdgePlayer, 0);
  objc_storeStrong((id *)&self->__unlevelPlayer, 0);
  objc_storeStrong((id *)&self->__levelPlayer, 0);
  objc_storeStrong((id *)&self->__engine, 0);
}

- (void)init
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_230B33000, v0, v1, "Could not set prefers no ducking: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_registerAudioWithResourceWithName:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_230B33000, v0, v1, "Error finding audio resource %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_registerAudioWithResourceWithName:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_230B33000, v1, OS_LOG_TYPE_ERROR, "Error registering audio resource %@: %@", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)_unregisterAudioResource:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_230B33000, v0, v1, "Error unregistering audio resource: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __48__AXCameraHapticEngine__performHapticForPlayer___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_230B33000, v0, v1, "Error playing haptic: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __48__AXCameraHapticEngine__performHapticForPlayer___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_230B33000, v0, v1, "Error starting engine: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
