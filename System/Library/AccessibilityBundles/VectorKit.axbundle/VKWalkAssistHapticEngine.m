@implementation VKWalkAssistHapticEngine

- (VKWalkAssistHapticEngine)init
{
  VKWalkAssistHapticEngine *v2;
  void *v3;
  int v4;
  CHHapticEngine *hapticEngine;
  VKWalkAssistHapticEngine *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VKWalkAssistHapticEngine;
  v2 = -[VKWalkAssistHapticEngine init](&v8, sel_init);
  if (v2
    && (objc_msgSend(MEMORY[0x24BDBF5C0], "capabilitiesForHardware"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "supportsHaptics"),
        v3,
        v4))
  {
    hapticEngine = v2->_hapticEngine;
    v2->_hapticEngine = 0;

    *(_WORD *)&v2->_hapticEngineStarted = 0;
    v6 = v2;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)start
{
  -[VKWalkAssistHapticEngine setUsesHapticFeedback:](self, "setUsesHapticFeedback:", 1);
}

- (void)stop
{
  -[VKWalkAssistHapticEngine setUsesHapticFeedback:](self, "setUsesHapticFeedback:", 0);
}

- (void)playEnterHaptic
{
  id v3;

  -[VKWalkAssistHapticEngine enterPattern](self, "enterPattern");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[VKWalkAssistHapticEngine _playHapticFromHapticPattern:](self, "_playHapticFromHapticPattern:", v3);

}

- (void)playExitHaptic
{
  id v3;

  -[VKWalkAssistHapticEngine exitPattern](self, "exitPattern");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[VKWalkAssistHapticEngine _playHapticFromHapticPattern:](self, "_playHapticFromHapticPattern:", v3);

}

- (void)playSingleHapticPulseWithIntensity:(float)a3 duration:(double)a4
{
  id v5;

  -[VKWalkAssistHapticEngine singlePulsePatternWithIntensity:duration:](self, "singlePulsePatternWithIntensity:duration:");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[VKWalkAssistHapticEngine _playHapticFromHapticPattern:](self, "_playHapticFromHapticPattern:", v5);

}

- (void)setUsesHapticFeedback:(BOOL)a3
{
  void *v4;
  int v5;
  CHHapticEngine *v6;
  id v7;
  CHHapticEngine *v8;
  NSObject *v9;
  CHHapticEngine *hapticEngine;
  id *v11;
  CHHapticEngine *v12;
  id v13;
  CHHapticEngine *v14;
  uint64_t v15;
  CHHapticEngine *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id location;
  id v24;
  id v25;

  if (self->_usesHapticFeedback != a3)
  {
    if (!a3)
    {
      if (!self->_hapticEngineStarted)
        return;
      objc_initWeak(&location, self);
      hapticEngine = self->_hapticEngine;
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __50__VKWalkAssistHapticEngine_setUsesHapticFeedback___block_invoke_180;
      v17[3] = &unk_2503C4D48;
      v11 = &v18;
      objc_copyWeak(&v18, &location);
      -[CHHapticEngine stopWithCompletionHandler:](hapticEngine, "stopWithCompletionHandler:", v17);
      self->_usesHapticFeedback = 0;
      goto LABEL_10;
    }
    if (!self->_hapticEngineStarted)
    {
      objc_msgSend(MEMORY[0x24BDBF5C0], "capabilitiesForHardware");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "supportsHaptics");

      if (v5)
      {
        v25 = 0;
        v6 = (CHHapticEngine *)objc_msgSend(objc_alloc(MEMORY[0x24BDBF5C0]), "initAndReturnError:", &v25);
        v7 = v25;
        v8 = self->_hapticEngine;
        self->_hapticEngine = v6;

        if (v7)
        {
          AXLogCommon();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
            -[VKWalkAssistHapticEngine setUsesHapticFeedback:].cold.2();
LABEL_15:

          return;
        }
        v12 = self->_hapticEngine;
        v24 = 0;
        -[CHHapticEngine startAndReturnError:](v12, "startAndReturnError:", &v24);
        v13 = v24;
        if (v13)
        {
          v7 = v13;
          AXLogCommon();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
            -[VKWalkAssistHapticEngine setUsesHapticFeedback:].cold.1();
          goto LABEL_15;
        }
        objc_initWeak(&location, self);
        v14 = self->_hapticEngine;
        v15 = MEMORY[0x24BDAC760];
        v21[0] = MEMORY[0x24BDAC760];
        v21[1] = 3221225472;
        v21[2] = __50__VKWalkAssistHapticEngine_setUsesHapticFeedback___block_invoke;
        v21[3] = &unk_2503C4CF8;
        v11 = &v22;
        objc_copyWeak(&v22, &location);
        -[CHHapticEngine setResetHandler:](v14, "setResetHandler:", v21);
        v16 = self->_hapticEngine;
        v19[0] = v15;
        v19[1] = 3221225472;
        v19[2] = __50__VKWalkAssistHapticEngine_setUsesHapticFeedback___block_invoke_178;
        v19[3] = &unk_2503C4D20;
        objc_copyWeak(&v20, &location);
        -[CHHapticEngine setStoppedHandler:](v16, "setStoppedHandler:", v19);
        *(_WORD *)&self->_hapticEngineStarted = 257;
        objc_destroyWeak(&v20);
LABEL_10:
        objc_destroyWeak(v11);
        objc_destroyWeak(&location);
      }
    }
  }
}

void __50__VKWalkAssistHapticEngine_setUsesHapticFeedback___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "hapticEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v3, "startAndReturnError:", &v9);
  v4 = v9;

  if (v4)
  {
    AXLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v4;
      _os_log_impl(&dword_232B35000, v5, OS_LOG_TYPE_DEFAULT, "Cannot restart CHHapticEngine: %@", buf, 0xCu);
    }

    v6 = objc_loadWeakRetained(v1);
    objc_msgSend(v6, "setUsesHapticFeedback:", 0);

    v7 = objc_loadWeakRetained(v1);
    objc_msgSend(v7, "setHapticEngineStarted:", 0);
  }
  else
  {
    v8 = objc_loadWeakRetained(v1);
    objc_msgSend(v8, "setHapticEngineStarted:", 1);

    v7 = objc_loadWeakRetained(v1);
    objc_msgSend(v7, "setUsesHapticFeedback:", 1);
  }

}

void __50__VKWalkAssistHapticEngine_setUsesHapticFeedback___block_invoke_178(uint64_t a1, uint64_t a2)
{
  id *v3;
  id WeakRetained;
  id v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  __int16 v9;
  __int16 v10;
  __int16 v11;
  __int16 v12;
  __int16 v13;

  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setHapticEngineStarted:", 0);

  v5 = objc_loadWeakRetained(v3);
  objc_msgSend(v5, "setUsesHapticFeedback:", 0);

  switch(a2)
  {
    case -1:
      AXLogCommon();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 0;
        v7 = "CHHapticEngine stopped: System Error";
        v8 = (uint8_t *)&v10;
        goto LABEL_12;
      }
      break;
    case 1:
      AXLogCommon();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 0;
        v7 = "CHHapticEngine stopped: Audio Session Interrupt";
        v8 = (uint8_t *)&v13;
        goto LABEL_12;
      }
      break;
    case 2:
      AXLogCommon();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 0;
        v7 = "CHHapticEngine stopped: Application Suspended";
        v8 = (uint8_t *)&v12;
        goto LABEL_12;
      }
      break;
    case 3:
      AXLogCommon();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 0;
        v7 = "CHHapticEngine stopped: Idle Timeout";
        v8 = (uint8_t *)&v11;
        goto LABEL_12;
      }
      break;
    default:
      AXLogCommon();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 0;
        v7 = "CHHapticEngine stopped: Unknown reason";
        v8 = (uint8_t *)&v9;
LABEL_12:
        _os_log_impl(&dword_232B35000, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
      }
      break;
  }

}

void __50__VKWalkAssistHapticEngine_setUsesHapticFeedback___block_invoke_180(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  int v7;
  id v8;
  NSObject *v9;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v4);
  v6 = WeakRetained;
  if (v3)
  {
    v7 = objc_msgSend(WeakRetained, "hapticEngineStarted");

    if (v7)
    {
      v8 = objc_loadWeakRetained(v4);
      objc_msgSend(v8, "setUsesHapticFeedback:", 1);

    }
    AXLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      __50__VKWalkAssistHapticEngine_setUsesHapticFeedback___block_invoke_180_cold_1();

  }
  else
  {
    objc_msgSend(WeakRetained, "setHapticEngineStarted:", 0);

  }
}

- (id)enterPattern
{
  id v2;
  double v3;
  void *v4;
  id v5;
  double v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v16;
  void *v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc(MEMORY[0x24BDBF5D0]);
  LODWORD(v3) = 1.0;
  v4 = (void *)objc_msgSend(v2, "initWithParameterID:value:", *MEMORY[0x24BDBF540], v3);
  v5 = objc_alloc(MEMORY[0x24BDBF5D0]);
  LODWORD(v6) = 1.0;
  v7 = (void *)objc_msgSend(v5, "initWithParameterID:value:", *MEMORY[0x24BDBF548], v6);
  v8 = objc_alloc(MEMORY[0x24BDBF5C8]);
  v9 = *MEMORY[0x24BDBF560];
  v18[0] = v4;
  v18[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithEventType:parameters:relativeTime:", v9, v10, 0.0);

  v12 = objc_alloc(MEMORY[0x24BDBF5E0]);
  v17 = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v17, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v14 = (void *)objc_msgSend(v12, "initWithEvents:parameters:error:", v13, MEMORY[0x24BDBD1A8], &v16);

  return v14;
}

- (id)exitPattern
{
  id v2;
  _QWORD *v3;
  double v4;
  id v5;
  _QWORD *v6;
  double v7;
  void *v8;
  id v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  double v15;
  void *v16;
  id v17;
  double v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v28;
  uint64_t v29;
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[3];

  v32[2] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc(MEMORY[0x24BDBF5D0]);
  v3 = (_QWORD *)MEMORY[0x24BDBF540];
  LODWORD(v4) = 1058642330;
  v28 = (void *)objc_msgSend(v2, "initWithParameterID:value:", *MEMORY[0x24BDBF540], v4);
  v5 = objc_alloc(MEMORY[0x24BDBF5D0]);
  v6 = (_QWORD *)MEMORY[0x24BDBF548];
  LODWORD(v7) = 1050253722;
  v8 = (void *)objc_msgSend(v5, "initWithParameterID:value:", *MEMORY[0x24BDBF548], v7);
  v9 = objc_alloc(MEMORY[0x24BDBF5C8]);
  v10 = (uint64_t *)MEMORY[0x24BDBF560];
  v11 = *MEMORY[0x24BDBF560];
  v32[0] = v28;
  v32[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v9, "initWithEventType:parameters:relativeTime:", v11, v12, 0.0);

  v14 = objc_alloc(MEMORY[0x24BDBF5D0]);
  LODWORD(v15) = 1050253722;
  v16 = (void *)objc_msgSend(v14, "initWithParameterID:value:", *v3, v15);
  v17 = objc_alloc(MEMORY[0x24BDBF5D0]);
  LODWORD(v18) = 1050253722;
  v19 = (void *)objc_msgSend(v17, "initWithParameterID:value:", *v6, v18);
  v20 = objc_alloc(MEMORY[0x24BDBF5C8]);
  v21 = *v10;
  v31[0] = v16;
  v31[1] = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v20, "initWithEventType:parameters:relativeTime:", v21, v22, 0.125);

  v24 = objc_alloc(MEMORY[0x24BDBF5E0]);
  v30[0] = v13;
  v30[1] = v23;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v26 = (void *)objc_msgSend(v24, "initWithEvents:parameters:error:", v25, MEMORY[0x24BDBD1A8], &v29);

  return v26;
}

- (id)singlePulsePatternWithIntensity:(float)a3 duration:(double)a4
{
  id v6;
  double v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v17;
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v6 = objc_alloc(MEMORY[0x24BDBF5D0]);
  *(float *)&v7 = a3;
  v8 = (void *)objc_msgSend(v6, "initWithParameterID:value:", *MEMORY[0x24BDBF540], v7);
  v9 = objc_alloc(MEMORY[0x24BDBF5C8]);
  v10 = *MEMORY[0x24BDBF560];
  v19[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithEventType:parameters:relativeTime:duration:", v10, v11, 0.0, a4);

  v13 = objc_alloc(MEMORY[0x24BDBF5E0]);
  v18 = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v18, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v15 = (void *)objc_msgSend(v13, "initWithEvents:parameters:error:", v14, MEMORY[0x24BDBD1A8], &v17);

  return v15;
}

- (void)_playHapticFromHapticPattern:(id)a3
{
  id v4;
  CHHapticEngine *v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  CHHapticEngine *hapticEngine;
  id v10;
  id v11;
  id v12[5];

  v12[4] = *(id *)MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4 && self->_usesHapticFeedback)
  {
    if (!self->_hapticEngineStarted)
    {
      hapticEngine = self->_hapticEngine;
      v12[0] = 0;
      -[CHHapticEngine startAndReturnError:](hapticEngine, "startAndReturnError:", v12);
      v10 = v12[0];
      if (v10)
      {
        v7 = v10;
        AXLogCommon();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
          -[VKWalkAssistHapticEngine _playHapticFromHapticPattern:].cold.2();
        goto LABEL_12;
      }
      self->_hapticEngineStarted = 1;
    }
    v5 = self->_hapticEngine;
    v11 = 0;
    -[CHHapticEngine createAdvancedPlayerWithPattern:error:](v5, "createAdvancedPlayerWithPattern:error:", v4, &v11);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v11;
    if (v7)
    {
      AXLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        -[VKWalkAssistHapticEngine _playHapticFromHapticPattern:].cold.1();

    }
    else
    {
      -[NSObject startAtTime:error:](v6, "startAtTime:error:", 0, 0.0);
    }
LABEL_12:

  }
}

- (CHHapticEngine)hapticEngine
{
  return self->_hapticEngine;
}

- (void)setHapticEngine:(id)a3
{
  objc_storeStrong((id *)&self->_hapticEngine, a3);
}

- (BOOL)hapticEngineStarted
{
  return self->_hapticEngineStarted;
}

- (void)setHapticEngineStarted:(BOOL)a3
{
  self->_hapticEngineStarted = a3;
}

- (BOOL)usesHapticFeedback
{
  return self->_usesHapticFeedback;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hapticEngine, 0);
}

- (void)setUsesHapticFeedback:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_232B35000, v0, v1, "Cannot start CHHapticEngine: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setUsesHapticFeedback:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_232B35000, v0, v1, "Cannot initialize CHHapticEngine: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __50__VKWalkAssistHapticEngine_setUsesHapticFeedback___block_invoke_180_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_232B35000, v0, v1, "Cannot stop CHHapticEngine: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_playHapticFromHapticPattern:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_232B35000, v0, v1, "Cannot configure haptic player: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_playHapticFromHapticPattern:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_232B35000, v0, v1, "Cannot restart haptic engine: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
