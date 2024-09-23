@implementation AXMHapticComponent

- (AXMHapticComponent)init
{
  AXMHapticComponent *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AXMHapticComponent;
  v2 = -[AXMOutputComponent init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("AXMHapticComponent", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

+ (BOOL)isSupported
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C9DCC8], "capabilitiesForHardware");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsHaptics");

  return v3;
}

- (double)autoShutdownTimeout
{
  return self->_autoShutdownTimeout;
}

- (void)setAutoShutdownTimeout:(double)a3
{
  self->_autoShutdownTimeout = a3;
  if (a3 >= 0.0)
    -[CHHapticEngine setAutoShutdownTimeout:](self->_engine, "setAutoShutdownTimeout:");
}

- (BOOL)usesHapticsOnly
{
  return self->_usesHapticsOnly;
}

- (void)setUsesHapticsOnly:(BOOL)a3
{
  self->_usesHapticsOnly = a3;
  -[CHHapticEngine setPlaysHapticsOnly:](self->_engine, "setPlaysHapticsOnly:");
}

- (void)transitionToState:(int64_t)a3 completion:(id)a4
{
  id v6;
  int64_t v7;
  CHHapticEngine *v8;
  id v9;
  CHHapticEngine *engine;
  void *v11;
  NSObject *v12;
  CHHapticEngine *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  objc_super v21;
  objc_super v22;
  objc_super v23;
  id v24;
  uint8_t buf[4];
  CHHapticEngine *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = -[AXMOutputComponent componentState](self, "componentState");
  if (a3 != 2 || v7)
  {
    AXMediaLogHaptics();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[AXMSoundComponent transitionToState:completion:].cold.2(self, a3, v19);

    v21.receiver = self;
    v21.super_class = (Class)AXMHapticComponent;
    -[AXMOutputComponent transitionToState:completion:](&v21, sel_transitionToState_completion_, a3, v6);
  }
  else
  {
    v24 = 0;
    v8 = (CHHapticEngine *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DCC8]), "initWithAudioSession:sessionIsShared:error:", 0, 0, &v24);
    v9 = v24;
    engine = self->_engine;
    self->_engine = v8;

    -[CHHapticEngine setAutoShutdownEnabled:](self->_engine, "setAutoShutdownEnabled:", -[AXMHapticComponent isAutoShutdownEnabled](self, "isAutoShutdownEnabled"));
    if (self->_autoShutdownTimeout >= 0.0)
      -[CHHapticEngine setAutoShutdownTimeout:](self->_engine, "setAutoShutdownTimeout:");
    -[CHHapticEngine setPlaysHapticsOnly:](self->_engine, "setPlaysHapticsOnly:", self->_usesHapticsOnly);
    objc_msgSend(MEMORY[0x1E0C9DCC8], "capabilitiesForHardware");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    self->_supportsHaptics = objc_msgSend(v11, "supportsHaptics");
    self->_supportsAudio = objc_msgSend(v11, "supportsAudio");
    AXMediaLogHaptics();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = self->_engine;
      v20 = v9;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CHHapticEngine isAutoShutdownEnabled](v13, "isAutoShutdownEnabled"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v11, "supportsHaptics"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v11, "supportsAudio"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CHHapticEngine playsHapticsOnly](self->_engine, "playsHapticsOnly"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v26 = v13;
      v27 = 2112;
      v28 = v14;
      v29 = 2112;
      v30 = v15;
      v31 = 2112;
      v32 = v16;
      v33 = 2112;
      v34 = v17;
      _os_log_impl(&dword_1B0E3B000, v12, OS_LOG_TYPE_DEFAULT, "Creating haptic engine %@. Auto-shutdown enabled: %@. Supports haptics: %@. Supports audio: %@. Plays Haptics Only: %@", buf, 0x34u);

      v9 = v20;
    }

    if (v9)
    {
      AXMediaLogHaptics();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[AXMHapticComponent transitionToState:completion:].cold.1();

      v23.receiver = self;
      v23.super_class = (Class)AXMHapticComponent;
      -[AXMOutputComponent transitionToState:completion:](&v23, sel_transitionToState_completion_, 1, v6);
    }
    else
    {
      -[CHHapticEngine setStoppedHandler:](self->_engine, "setStoppedHandler:", &__block_literal_global_34);
      -[CHHapticEngine setResetHandler:](self->_engine, "setResetHandler:", &__block_literal_global_26);
      v22.receiver = self;
      v22.super_class = (Class)AXMHapticComponent;
      -[AXMOutputComponent transitionToState:completion:](&v22, sel_transitionToState_completion_, 2, v6);
    }

  }
}

void __51__AXMHapticComponent_transitionToState_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  AXMediaLogHaptics();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 134217984;
    v5 = a2;
    _os_log_impl(&dword_1B0E3B000, v3, OS_LOG_TYPE_INFO, "Haptic engine stopped. reason: %ld", (uint8_t *)&v4, 0xCu);
  }

}

void __51__AXMHapticComponent_transitionToState_completion___block_invoke_24()
{
  NSObject *v0;
  uint8_t v1[16];

  AXMediaLogHaptics();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1B0E3B000, v0, OS_LOG_TYPE_INFO, "Haptic engine reset", v1, 2u);
  }

}

- (BOOL)canHandleRequest:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "hapticActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (void)handleRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  AXMHapticComponent *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__AXMHapticComponent_handleRequest_completion___block_invoke;
  block[3] = &unk_1E625F5E8;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __47__AXMHapticComponent_handleRequest_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  double v28;
  void *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  _QWORD block[4];
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  uint8_t buf[4];
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  double v50;
  _QWORD v51[3];

  v51[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "hapticActions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hapticFileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "hapticActions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hapticIntensity");
  v8 = v7;

  objc_msgSend(v4, "pathExtension");
  v9 = objc_claimAutoreleasedReturnValue();
  -[NSObject lowercaseString](v9, "lowercaseString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("ahap")))
  {

LABEL_6:
    goto LABEL_7;
  }
  objc_msgSend(v4, "pathExtension");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lowercaseString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("json"));

  if ((v13 & 1) == 0)
  {
    AXMediaLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      __47__AXMHapticComponent_handleRequest_completion___block_invoke_cold_7(v9);
    goto LABEL_6;
  }
LABEL_7:
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v14, 0, &v44);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v44;
  if (!v16 && v15)
  {
    v43 = 0;
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0C9DD08]), "initWithDictionary:error:", v15, &v43);
    v16 = v43;
    if (v16 || !v17)
    {
      AXMediaLogHaptics();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        __47__AXMHapticComponent_handleRequest_completion___block_invoke_cold_1();
      goto LABEL_18;
    }
    v18 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
    v42 = 0;
    objc_msgSend(v18, "startAndReturnError:", &v42);
    v19 = v42;
    if (v19)
    {
      v16 = v19;
      AXMediaLogHaptics();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        __47__AXMHapticComponent_handleRequest_completion___block_invoke_cold_5();
    }
    else
    {
      v23 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
      v41 = 0;
      objc_msgSend(v23, "createPlayerWithPattern:error:", v17, &v41);
      v24 = objc_claimAutoreleasedReturnValue();
      v16 = v41;
      v25 = *(_QWORD *)(a1 + 40);
      v26 = *(void **)(v25 + 32);
      *(_QWORD *)(v25 + 32) = v24;

      if (v16)
      {
        AXMediaLogHaptics();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          __47__AXMHapticComponent_handleRequest_completion___block_invoke_cold_4();
      }
      else
      {
        v27 = objc_alloc(MEMORY[0x1E0C9DCC0]);
        *(float *)&v28 = v8;
        v20 = objc_msgSend(v27, "initWithParameterID:value:relativeTime:", *MEMORY[0x1E0C9DC10], v28, 0.0);
        v29 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
        v51[0] = v20;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = 0;
        objc_msgSend(v29, "sendParameters:atTime:error:", v30, &v40, 0.0);
        v16 = v40;

        AXMediaLogHaptics();
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = v31;
        if (v16)
        {
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            __47__AXMHapticComponent_handleRequest_completion___block_invoke_cold_3();
        }
        else
        {
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            v33 = *(_QWORD *)(a1 + 40);
            v34 = *(_QWORD *)(v33 + 24);
            v35 = *(_QWORD *)(v33 + 32);
            *(_DWORD *)buf = 138412802;
            v46 = v34;
            v47 = 2112;
            v48 = v35;
            v49 = 2048;
            v50 = v8;
            _os_log_impl(&dword_1B0E3B000, v32, OS_LOG_TYPE_INFO, "Requesting haptic. Engine: %@. Player: %@. Intensity: %.2f", buf, 0x20u);
          }

          v36 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
          v39 = 0;
          objc_msgSend(v36, "startAtTime:error:", &v39, 0.0);
          v16 = v39;
          if (!v16)
            goto LABEL_18;
          AXMediaLogHaptics();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            __47__AXMHapticComponent_handleRequest_completion___block_invoke_cold_2();
        }

      }
    }
LABEL_18:

    goto LABEL_19;
  }
  AXMediaLogHaptics();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    __47__AXMHapticComponent_handleRequest_completion___block_invoke_cold_6();
LABEL_19:

  v21 = *(void **)(a1 + 48);
  v22 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__AXMHapticComponent_handleRequest_completion___block_invoke_36;
  block[3] = &unk_1E625D100;
  v38 = v21;
  dispatch_async(v22, block);

}

uint64_t __47__AXMHapticComponent_handleRequest_completion___block_invoke_36(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)isAutoShutdownEnabled
{
  return self->_autoShutdownEnabled;
}

- (void)setAutoShutdownEnabled:(BOOL)a3
{
  self->_autoShutdownEnabled = a3;
}

- (CHHapticPatternPlayer)_levelPlayer
{
  return self->__levelPlayer;
}

- (void)set_levelPlayer:(id)a3
{
  objc_storeStrong((id *)&self->__levelPlayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__levelPlayer, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_engine, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)transitionToState:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_1B0E3B000, v0, v1, "Error creating haptic engine: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __47__AXMHapticComponent_handleRequest_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_1B0E3B000, v0, v1, "Failed to create haptic pattern: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __47__AXMHapticComponent_handleRequest_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_1B0E3B000, v0, v1, "Failed to play haptic: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __47__AXMHapticComponent_handleRequest_completion___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_1B0E3B000, v0, v1, "Failed to set intensity of haptic: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __47__AXMHapticComponent_handleRequest_completion___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_1B0E3B000, v0, v1, "Failed to create haptic player: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __47__AXMHapticComponent_handleRequest_completion___block_invoke_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_1B0E3B000, v0, v1, "Failed to start haptic engine: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __47__AXMHapticComponent_handleRequest_completion___block_invoke_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_1B0E3B000, v0, v1, "Failed to load haptic pattern dictionary: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __47__AXMHapticComponent_handleRequest_completion___block_invoke_cold_7(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1B0E3B000, log, OS_LOG_TYPE_FAULT, "Unexpected file format for haptic file", v1, 2u);
}

@end
