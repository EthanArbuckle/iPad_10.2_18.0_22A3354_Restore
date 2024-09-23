@implementation AXSSMotionTracker

- (AXSSMotionTracker)init
{
  AXSSMotionTracker *v2;
  AXSSMotionTracker *v3;
  uint64_t v4;
  uint64_t v5;
  AXSSMotionTrackingExpressionConfiguration *expressionConfiguration;
  AXSSRateLimitingLogger *v7;
  void *v8;
  uint64_t v9;
  AXSSRateLimitingLogger *loggingRateLimiter;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AXSSMotionTracker;
  v2 = -[AXSSMotionTracker init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_motionTrackingMode = AXSSMotionTrackingDefaultMode;
    v4 = AXSSMotionTrackingDefaultJoystickModeMovementThreshold;
    *(_QWORD *)&v2->_sensitivity = AXSSMotionTrackingDefaultSensitivity;
    *(_QWORD *)&v2->_joystickModeMovementThreshold = v4;
    +[AXSSMotionTrackingExpressionConfiguration defaultExpressionConfiguration](AXSSMotionTrackingExpressionConfiguration, "defaultExpressionConfiguration");
    v5 = objc_claimAutoreleasedReturnValue();
    expressionConfiguration = v3->_expressionConfiguration;
    v3->_expressionConfiguration = (AXSSMotionTrackingExpressionConfiguration *)v5;

    v7 = [AXSSRateLimitingLogger alloc];
    AXSSLogForCategory(2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[AXSSRateLimitingLogger initWithLogLevel:categoryLog:timeInterval:](v7, "initWithLogLevel:categoryLog:timeInterval:", 1, v8, 1.0);
    loggingRateLimiter = v3->__loggingRateLimiter;
    v3->__loggingRateLimiter = (AXSSRateLimitingLogger *)v9;

  }
  return v3;
}

- (void)dealloc
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "AXSSMotionTracker: dealloc", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (BOOL)_hasBeenStarted
{
  void *v2;
  BOOL v3;

  -[AXSSMotionTracker _motionTrackingDaemonConnection](self, "_motionTrackingDaemonConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isTracking
{
  _BOOL4 v3;

  v3 = -[AXSSMotionTracker _hasBeenStarted](self, "_hasBeenStarted");
  if (v3)
    LOBYTE(v3) = -[AXSSMotionTracker _tracking](self, "_tracking");
  return v3;
}

- (void)start
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "AXSSMotionTracker: start", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __26__AXSSMotionTracker_start__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  AXSSLogForCategory(2);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1AF5CC000, v0, OS_LOG_TYPE_INFO, "AXSSMotionTracker: connection invalidated", v1, 2u);
  }

}

void __26__AXSSMotionTracker_start__block_invoke_29(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  AXSSLogForCategory(2);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1AF5CC000, v2, OS_LOG_TYPE_INFO, "AXSSMotionTracker: connection interrupted", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_motionTrackingDaemonWasInterruptedFromXPC");
  objc_msgSend(WeakRetained, "invalidate");
  objc_msgSend(WeakRetained, "stop");

}

- (void)stop
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  AXSSLogForCategory(2);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1AF5CC000, v3, OS_LOG_TYPE_INFO, "AXSSMotionTracker: stop", v5, 2u);
  }

  if (-[AXSSMotionTracker _hasBeenStarted](self, "_hasBeenStarted"))
  {
    if (-[AXSSMotionTracker _tracking](self, "_tracking"))
    {
      -[AXSSMotionTracker _motionTrackingDaemon](self, "_motionTrackingDaemon");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stopTracking");

      -[AXSSMotionTracker set_tracking:](self, "set_tracking:", 0);
      -[AXSSMotionTracker _changeState:](self, "_changeState:", 0);
    }
  }
}

- (void)invalidate
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "AXSSMotionTracker: invalidate:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)recalibrateFace
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1AF5CC000, v0, v1, "AXSSMotionTracker: recalibrateFace:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)setDebugOverlayEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (self->_debugOverlayEnabled != a3)
  {
    v3 = a3;
    AXSSLogForCategory(2);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v8[0] = 67109120;
      v8[1] = v3;
      _os_log_impl(&dword_1AF5CC000, v5, OS_LOG_TYPE_INFO, "AXSSMotionTracker:setDebugOverlayEnabled: %d", (uint8_t *)v8, 8u);
    }

    self->_debugOverlayEnabled = v3;
    if (-[AXSSMotionTracker _tracking](self, "_tracking"))
    {
      -[AXSSMotionTracker _motionTrackingDaemon](self, "_motionTrackingDaemon");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v3)
        objc_msgSend(v6, "showDebugOverlay");
      else
        objc_msgSend(v6, "hideDebugOverlay");

    }
  }
}

+ (NSSet)supportedExpressions
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E5FA87B8);
}

+ (NSArray)supportedExpressionSensitivitiesAscending
{
  return (NSArray *)&unk_1E5FA87D0;
}

- (void)setMotionTrackingMode:(unint64_t)a3
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  if (self->_motionTrackingMode != a3)
  {
    AXSSLogForCategory(2);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[AXSSMotionTracker setMotionTrackingMode:].cold.1(a3, v5, v6, v7, v8, v9, v10, v11);

    self->_motionTrackingMode = a3;
    if (-[AXSSMotionTracker _tracking](self, "_tracking"))
    {
      -[AXSSMotionTracker _motionTrackingDaemon](self, "_motionTrackingDaemon");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setMotionTrackingMode:", a3);

    }
  }
}

- (unint64_t)motionTrackingMode
{
  return self->_motionTrackingMode;
}

- (void)setSensitivity:(double)a3
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  if (vabdd_f64(self->_sensitivity, a3) > 2.22044605e-16)
  {
    AXSSLogForCategory(2);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[AXSSMotionTracker setSensitivity:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

    self->_sensitivity = a3;
    if (-[AXSSMotionTracker _tracking](self, "_tracking"))
    {
      -[AXSSMotionTracker _motionTrackingDaemon](self, "_motionTrackingDaemon");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setSensitivity:", a3);

    }
  }
}

- (AXSSMotionTrackingInputConfiguration)inputConfiguration
{
  return (AXSSMotionTrackingInputConfiguration *)(id)-[AXSSMotionTrackingInputConfiguration copy](self->_inputConfiguration, "copy");
}

- (void)setInputConfiguration:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  AXSSMotionTrackingInputConfiguration *v12;
  AXSSMotionTrackingInputConfiguration *inputConfiguration;
  void *v14;

  v4 = a3;
  if (!-[AXSSMotionTrackingInputConfiguration isEqual:](self->_inputConfiguration, "isEqual:", v4))
  {
    AXSSLogForCategory(2);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[AXSSMotionTracker setInputConfiguration:].cold.1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

    v12 = (AXSSMotionTrackingInputConfiguration *)objc_msgSend(v4, "copy");
    inputConfiguration = self->_inputConfiguration;
    self->_inputConfiguration = v12;

    if (-[AXSSMotionTracker _tracking](self, "_tracking"))
    {
      -[AXSSMotionTracker _motionTrackingDaemon](self, "_motionTrackingDaemon");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setInputConfiguration:", v4);

    }
  }

}

- (AXSSMotionTrackingExpressionConfiguration)expressionConfiguration
{
  return (AXSSMotionTrackingExpressionConfiguration *)(id)-[AXSSMotionTrackingExpressionConfiguration copy](self->_expressionConfiguration, "copy");
}

- (void)setExpressionConfiguration:(id)a3
{
  id v4;
  NSObject *v5;
  AXSSMotionTrackingExpressionConfiguration *v6;
  AXSSMotionTrackingExpressionConfiguration *expressionConfiguration;
  void *v8;

  v4 = a3;
  if (!-[AXSSMotionTrackingExpressionConfiguration isEqual:](self->_expressionConfiguration, "isEqual:", v4))
  {
    AXSSLogForCategory(2);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[AXSSMotionTracker setExpressionConfiguration:].cold.1((uint64_t)v4, v5);

    v6 = (AXSSMotionTrackingExpressionConfiguration *)objc_msgSend(v4, "copy");
    expressionConfiguration = self->_expressionConfiguration;
    self->_expressionConfiguration = v6;

    if (-[AXSSMotionTracker _tracking](self, "_tracking"))
    {
      -[AXSSMotionTracker _motionTrackingDaemon](self, "_motionTrackingDaemon");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setExpressionConfiguration:", v4);

    }
  }

}

- (void)setJoystickModeMovementThreshold:(double)a3
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  if (vabdd_f64(self->_joystickModeMovementThreshold, a3) > 2.22044605e-16)
  {
    AXSSLogForCategory(2);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[AXSSMotionTracker setJoystickModeMovementThreshold:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

    self->_joystickModeMovementThreshold = a3;
    if (-[AXSSMotionTracker _tracking](self, "_tracking"))
    {
      -[AXSSMotionTracker _motionTrackingDaemon](self, "_motionTrackingDaemon");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setJoystickModeMovementThreshold:", a3);

    }
  }
}

- (void)setLookAtPoint:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (v11)
  {
    -[AXSSMotionTracker state](self, "state");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      -[AXSSMotionTracker state](self, "state");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "error");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        -[AXSSMotionTracker state](self, "state");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)objc_msgSend(v8, "copy");

        objc_msgSend(v11, "pointValue");
        objc_msgSend(v9, "setLookAtPoint:");
        -[AXSSMotionTracker _updateState:](self, "_updateState:", v9);
        if (-[AXSSMotionTracker _tracking](self, "_tracking"))
        {
          -[AXSSMotionTracker _motionTrackingDaemon](self, "_motionTrackingDaemon");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "pointValue");
          objc_msgSend(v10, "setLookAtPoint:");

        }
      }
    }
  }

}

- (NSValue)lookAtPoint
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[2];

  -[AXSSMotionTracker state](self, "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return (NSValue *)0;
  v4 = (void *)MEMORY[0x1E0CB3B18];
  -[AXSSMotionTracker state](self, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lookAtPoint");
  v10[0] = v6;
  v10[1] = v7;
  objc_msgSend(v4, "valueWithBytes:objCType:", v10, "{CGPoint=dd}");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSValue *)v8;
}

- (void)_updateState:(id)a3
{
  void *v4;
  id v5;

  -[AXSSMotionTracker setState:](self, "setState:", a3);
  -[AXSSMotionTracker delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[AXSSMotionTracker state](self, "state");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "motionTracker:updatedState:", self, v4);

  }
}

- (void)_changeState:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __34__AXSSMotionTracker__changeState___block_invoke;
    v6[3] = &unk_1E5F98988;
    v6[4] = self;
    v7 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], v6);

  }
}

uint64_t __34__AXSSMotionTracker__changeState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateState:", *(_QWORD *)(a1 + 40));
}

- (AXSSMotionTrackingDaemonProtocol)_motionTrackingDaemon
{
  void *v2;
  void *v3;

  -[AXSSMotionTracker _motionTrackingDaemonConnection](self, "_motionTrackingDaemonConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_48);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AXSSMotionTrackingDaemonProtocol *)v3;
}

void __42__AXSSMotionTracker__motionTrackingDaemon__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  AXSSLogForCategory(2);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __42__AXSSMotionTracker__motionTrackingDaemon__block_invoke_cold_1((uint64_t)v2, v3);

}

- (void)_motionTrackingDaemonWasInterruptedFromXPC
{
  NSObject *v3;
  AXSSMotionTrackingState *v4;
  void *v5;
  uint8_t v6[16];

  AXSSLogForCategory(2);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1AF5CC000, v3, OS_LOG_TYPE_INFO, "AXSSMotionTracker: _motionTrackingDaemonWasInterruptedFromXPC", v6, 2u);
  }

  v4 = objc_alloc_init(AXSSMotionTrackingState);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("AXSSMotionTrackingErrorDomain"), 9, 0);
  -[AXSSMotionTrackingState setError:](v4, "setError:", v5);

  -[AXSSMotionTracker _changeState:](self, "_changeState:", v4);
}

- (void)motionTrackingDaemonUpdatedState:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: motionTrackingDaemonUpdatedState %@"), "-[AXSSMotionTracker motionTrackingDaemonUpdatedState:]", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSMotionTracker _loggingRateLimiter](self, "_loggingRateLimiter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logString:", v4);

  if (v6)
    -[AXSSMotionTracker _changeState:](self, "_changeState:", v6);

}

- (double)sensitivity
{
  return self->_sensitivity;
}

- (double)joystickModeMovementThreshold
{
  return self->_joystickModeMovementThreshold;
}

- (BOOL)debugOverlayEnabled
{
  return self->_debugOverlayEnabled;
}

- (AXSSMotionTrackingState)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (AXSSMotionTrackerDelegate)delegate
{
  return (AXSSMotionTrackerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSXPCConnection)_motionTrackingDaemonConnection
{
  return self->__motionTrackingDaemonConnection;
}

- (void)set_motionTrackingDaemonConnection:(id)a3
{
  objc_storeStrong((id *)&self->__motionTrackingDaemonConnection, a3);
}

- (BOOL)_tracking
{
  return self->__tracking;
}

- (void)set_tracking:(BOOL)a3
{
  self->__tracking = a3;
}

- (void)set_hasBeenStarted:(BOOL)a3
{
  self->__hasBeenStarted = a3;
}

- (AXSSRateLimitingLogger)_loggingRateLimiter
{
  return self->__loggingRateLimiter;
}

- (void)set_loggingRateLimiter:(id)a3
{
  objc_storeStrong((id *)&self->__loggingRateLimiter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__loggingRateLimiter, 0);
  objc_storeStrong((id *)&self->__motionTrackingDaemonConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_expressionConfiguration, 0);
  objc_storeStrong((id *)&self->_inputConfiguration, 0);
}

- (void)setMotionTrackingMode:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1AF5CC000, a2, a3, "AXSSMotionTracker: setMotionTrackingMode: %lu", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)setSensitivity:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1AF5CC000, a1, a3, "AXSSMotionTracker: setSensitivity: %f", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)setInputConfiguration:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1AF5CC000, a2, a3, "AXSSMotionTracker: setInputConfiguration: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)setExpressionConfiguration:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[AXSSMotionTracker setExpressionConfiguration:]";
  v4 = 2112;
  v5 = a1;
  _os_log_debug_impl(&dword_1AF5CC000, a2, OS_LOG_TYPE_DEBUG, "%s: %@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)setJoystickModeMovementThreshold:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1AF5CC000, a1, a3, "AXSSMotionTracker: setJoystickModeMovementThreshold: %f", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __42__AXSSMotionTracker__motionTrackingDaemon__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1AF5CC000, a2, OS_LOG_TYPE_ERROR, "ERROR: XPC connection returned error for remote object proxy: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

@end
