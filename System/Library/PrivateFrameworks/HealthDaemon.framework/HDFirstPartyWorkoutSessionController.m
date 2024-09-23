@implementation HDFirstPartyWorkoutSessionController

- (HDFirstPartyWorkoutSessionController)initWithProfile:(id)a3 sessionConfiguration:(id)a4 sessionStateController:(id)a5 recoveryState:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HDFirstPartyWorkoutSessionController *v14;
  HDDefaultWorkoutSessionController *v15;
  HDDefaultWorkoutSessionController *defaultSessionController;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HDFirstPartyWorkoutSessionController;
  v14 = -[HDFirstPartyWorkoutSessionController init](&v18, sel_init);
  if (v14)
  {
    v15 = -[HDDefaultWorkoutSessionController initWithProfile:sessionConfiguration:sessionStateController:recoveryState:]([HDDefaultWorkoutSessionController alloc], "initWithProfile:sessionConfiguration:sessionStateController:recoveryState:", v10, v11, v14, v13);
    defaultSessionController = v14->_defaultSessionController;
    v14->_defaultSessionController = v15;

    objc_storeWeak((id *)&v14->_sessionStateController, v12);
  }

  return v14;
}

- (void)workoutSessionServer:(id)a3 didChangeConfiguration:(id)a4
{
  -[HDDefaultWorkoutSessionController workoutSessionServer:didChangeConfiguration:](self->_defaultSessionController, "workoutSessionServer:didChangeConfiguration:", a3, a4);
}

- (void)workoutSessionServer:(id)a3 didTransitionFromState:(int64_t)a4 toState:(int64_t)a5 date:(id)a6
{
  self->_currentState = a5;
  -[HDDefaultWorkoutSessionController workoutSessionServer:didTransitionFromState:toState:date:](self->_defaultSessionController, "workoutSessionServer:didTransitionFromState:toState:date:", a3, a4);
}

- (void)workoutSessionServer:(id)a3 accumulatorDidChange:(id)a4
{
  -[HDDefaultWorkoutSessionController workoutSessionServer:accumulatorDidChange:](self->_defaultSessionController, "workoutSessionServer:accumulatorDidChange:", a3, a4);
}

+ (id)recoveryIdentifier
{
  return CFSTR("com.apple.SessionController.FirstParty");
}

- (void)hktest_setStateTransitionCompletionHandler:(id)a3
{
  -[HDDefaultWorkoutSessionController hktest_setStateTransitionCompletionHandler:](self->_defaultSessionController, "hktest_setStateTransitionCompletionHandler:", a3);
}

+ (void)willFinishSessionWithRecoveryData:(id)a3 profile:(id)a4
{
  +[HDDefaultWorkoutSessionController willFinishSessionWithRecoveryData:profile:](HDDefaultWorkoutSessionController, "willFinishSessionWithRecoveryData:profile:", a3, a4);
}

- (void)unitTest_setCMWorkoutManager:(id)a3
{
  -[HDDefaultWorkoutSessionController unitTest_setCMWorkoutManager:](self->_defaultSessionController, "unitTest_setCMWorkoutManager:", a3);
}

- (void)beginNewActivity:(id)a3
{
  -[HDDefaultWorkoutSessionController beginNewActivity:](self->_defaultSessionController, "beginNewActivity:", a3);
}

- (void)endCurrentActivity:(id)a3
{
  -[HDDefaultWorkoutSessionController endCurrentActivity:](self->_defaultSessionController, "endCurrentActivity:", a3);
}

- (BOOL)enableAutomaticDetectionForActivityConfigurations:(id)a3
{
  return -[HDDefaultWorkoutSessionController enableAutomaticDetectionForActivityConfigurations:](self->_defaultSessionController, "enableAutomaticDetectionForActivityConfigurations:", a3);
}

- (BOOL)prepareWithError:(id *)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_sessionStateController);
  LOBYTE(a3) = objc_msgSend(WeakRetained, "prepareWithError:", a3);

  return (char)a3;
}

- (BOOL)startActivityWithDate:(id)a3 error:(id *)a4
{
  HDWorkoutSessionStateController **p_sessionStateController;
  id v6;
  id WeakRetained;

  p_sessionStateController = &self->_sessionStateController;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_sessionStateController);
  LOBYTE(a4) = objc_msgSend(WeakRetained, "startActivityWithDate:error:", v6, a4);

  return (char)a4;
}

- (BOOL)stopActivityWithDate:(id)a3 error:(id *)a4
{
  HDWorkoutSessionStateController **p_sessionStateController;
  id v6;
  id WeakRetained;

  p_sessionStateController = &self->_sessionStateController;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_sessionStateController);
  LOBYTE(a4) = objc_msgSend(WeakRetained, "startActivityWithDate:error:", v6, a4);

  return (char)a4;
}

- (BOOL)endWithError:(id *)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_sessionStateController);
  LOBYTE(a3) = objc_msgSend(WeakRetained, "endWithError:", a3);

  return (char)a3;
}

- (BOOL)pauseWithError:(id *)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_sessionStateController);
  LOBYTE(a3) = objc_msgSend(WeakRetained, "pauseWithError:", a3);

  return (char)a3;
}

- (BOOL)resumeWithError:(id *)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_sessionStateController);
  LOBYTE(a3) = objc_msgSend(WeakRetained, "resumeWithError:", a3);

  return (char)a3;
}

- (void)autoPauseWithDate:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  id WeakRetained;
  id v8;

  v8 = a3;
  if (self)
  {
    HKObjectForNanoPreferencesUserDefaultsKey();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      WeakRetained = 0;
      goto LABEL_6;
    }
    v5 = v4;
    v6 = objc_msgSend(v4, "BOOLValue");

    if (v6)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_sessionStateController);
      objc_msgSend(WeakRetained, "autoPauseWithDate:", v8);
LABEL_6:

    }
  }

}

- (void)autoResumeWithDate:(id)a3
{
  HDWorkoutSessionStateController **p_sessionStateController;
  id v4;
  id WeakRetained;

  if (self->_currentState == 9)
  {
    p_sessionStateController = &self->_sessionStateController;
    v4 = a3;
    WeakRetained = objc_loadWeakRetained((id *)p_sessionStateController);
    objc_msgSend(WeakRetained, "autoResumeWithDate:", v4);

  }
}

- (void)endHeartRateRecovery
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_sessionStateController);
  objc_msgSend(WeakRetained, "endHeartRateRecovery");

}

- (void)finish
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_sessionStateController);
  objc_msgSend(WeakRetained, "finish");

}

- (void)finishAggregationWithDate:(id)a3
{
  HDWorkoutSessionStateController **p_sessionStateController;
  id v4;
  id WeakRetained;

  p_sessionStateController = &self->_sessionStateController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_sessionStateController);
  objc_msgSend(WeakRetained, "finishAggregationWithDate:", v4);

}

- (void)generateEvent:(id)a3
{
  HDWorkoutSessionStateController **p_sessionStateController;
  id v4;
  id WeakRetained;

  p_sessionStateController = &self->_sessionStateController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_sessionStateController);
  objc_msgSend(WeakRetained, "generateEvent:", v4);

}

- (void)generateError:(id)a3
{
  HDWorkoutSessionStateController **p_sessionStateController;
  id v4;
  id WeakRetained;

  p_sessionStateController = &self->_sessionStateController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_sessionStateController);
  objc_msgSend(WeakRetained, "generateError:", v4);

}

- (void)generateMetadata:(id)a3
{
  HDWorkoutSessionStateController **p_sessionStateController;
  id v4;
  id WeakRetained;

  p_sessionStateController = &self->_sessionStateController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_sessionStateController);
  objc_msgSend(WeakRetained, "generateMetadata:", v4);

}

- (void)generateConfigurationUpdate:(id)a3
{
  HDWorkoutSessionStateController **p_sessionStateController;
  id v4;
  id WeakRetained;

  p_sessionStateController = &self->_sessionStateController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_sessionStateController);
  objc_msgSend(WeakRetained, "generateConfigurationUpdate:", v4);

}

- (void)didBeginNewActivity:(id)a3
{
  HDWorkoutSessionStateController **p_sessionStateController;
  id v4;
  id WeakRetained;

  p_sessionStateController = &self->_sessionStateController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_sessionStateController);
  objc_msgSend(WeakRetained, "didBeginNewActivity:", v4);

}

- (void)didEndCurrentActivity:(id)a3
{
  HDWorkoutSessionStateController **p_sessionStateController;
  id v4;
  id WeakRetained;

  p_sessionStateController = &self->_sessionStateController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_sessionStateController);
  objc_msgSend(WeakRetained, "didEndCurrentActivity:", v4);

}

- (void)didDetectActivityChange:(id)a3
{
  HDWorkoutSessionStateController **p_sessionStateController;
  id v4;
  id WeakRetained;

  p_sessionStateController = &self->_sessionStateController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_sessionStateController);
  objc_msgSend(WeakRetained, "didDetectActivityChange:", v4);

}

- (BOOL)storeSessionControllerState:(id)a3 forRecoveryIdentifier:(id)a4 error:(id *)a5
{
  HDWorkoutSessionStateController **p_sessionStateController;
  id v8;
  id v9;
  id WeakRetained;

  p_sessionStateController = &self->_sessionStateController;
  v8 = a4;
  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_sessionStateController);
  LOBYTE(a5) = objc_msgSend(WeakRetained, "storeSessionControllerState:forRecoveryIdentifier:error:", v9, v8, a5);

  return (char)a5;
}

- (HDWorkoutDataAccumulator)workoutDataAccumulator
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_sessionStateController);
  objc_msgSend(WeakRetained, "workoutDataAccumulator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HDWorkoutDataAccumulator *)v3;
}

+ (BOOL)supportsWorkoutConfiguration:(id)a3 clientApplicationIdentifier:(id)a4
{
  return objc_msgSend(a4, "isEqualToString:", CFSTR("com.apple.SessionTrackerApp"));
}

- (void)fakeActivityDetection:(id)a3 workoutActivity:(id)a4
{
  -[HDDefaultWorkoutSessionController fakeActivityDetection:workoutActivity:](self->_defaultSessionController, "fakeActivityDetection:workoutActivity:", a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultSessionController, 0);
  objc_destroyWeak((id *)&self->_sessionStateController);
}

@end
