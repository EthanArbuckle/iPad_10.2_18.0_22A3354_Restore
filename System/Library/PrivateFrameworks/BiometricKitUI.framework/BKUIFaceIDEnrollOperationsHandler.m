@implementation BKUIFaceIDEnrollOperationsHandler

- (void)retryOperation
{
  BKEnrollPearlOperation *enrollOperation;
  NSDate *lastFaceFoundDate;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  enrollOperation = self->_enrollOperation;
  self->_enrollOperation = 0;

  -[NSMutableArray removeAllObjects](self->_poseStatus, "removeAllObjects");
  self->_canStartEnrollmentOperation = 1;
  self->_bioKitCompletionPercentage = 0.0;
  lastFaceFoundDate = self->_lastFaceFoundDate;
  self->_lastFaceFoundDate = 0;

  _BKUILoggingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB281000, v5, OS_LOG_TYPE_DEFAULT, "retryOperation: enrollOperationInProgress = NO", buf, 2u);
  }

  self->_enrollOperationInProgress = 0;
  self->_centerBinComplete = 0;
  if (-[BKUIFaceIDEnrollOperationsHandler glassesEnforcementError](self, "glassesEnforcementError"))
  {
    _BKUILoggingFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1DB281000, v6, OS_LOG_TYPE_DEFAULT, "Retrying Glasses enrollment for enforcemnt error", v8, 2u);
    }

    -[BKUIFaceIDEnrollOperationsHandler setGlassesEnforcementError:](self, "setGlassesEnforcementError:", 0);
    -[BKUIFaceIDEnrollOperationsHandler matchUserThenDoSingleEnrollmentCompletion](self, "matchUserThenDoSingleEnrollmentCompletion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIFaceIDEnrollOperationsHandler matchUserForSecondPhaseEnrollmentWithCompletionAction:](self, "matchUserForSecondPhaseEnrollmentWithCompletionAction:", v7);

  }
}

- (BKUIFaceIDEnrollOperationsHandler)initWithBKPearlEnrollmentType:(int64_t)a3
{
  BKUIFaceIDEnrollOperationsHandler *result;

  result = -[BKUIFaceIDEnrollOperationsHandler init](self, "init");
  if (result)
    result->_enrollmentType = a3;
  return result;
}

- (BKUIFaceIDEnrollOperationsHandler)init
{
  BKUIFaceIDEnrollOperationsHandler *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *enrollStartStopQueue;
  uint64_t v6;
  NSMutableArray *poseStatus;
  Class BKDeviceClass_0;
  void *v9;
  uint64_t v10;
  id v11;
  BKDevicePearl *device;
  NSObject *v13;
  uint64_t v14;
  BKUIAnalyticsManager *analyticsManager;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v21;
  id v22;
  objc_super v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)BKUIFaceIDEnrollOperationsHandler;
  v2 = -[BKUIFaceIDEnrollOperationsHandler init](&v23, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.biometrickitui.enrollmentStartStopQueue", v3);
    enrollStartStopQueue = v2->_enrollStartStopQueue;
    v2->_enrollStartStopQueue = (OS_dispatch_queue *)v4;

    v6 = objc_opt_new();
    poseStatus = v2->_poseStatus;
    v2->_poseStatus = (NSMutableArray *)v6;

    v2->_canStartEnrollmentOperation = 1;
    BKDeviceClass_0 = getBKDeviceClass_0();
    -[objc_class deviceDescriptorForType:](getBKDeviceDescriptorClass_0(), "deviceDescriptorForType:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    -[objc_class deviceWithDescriptor:error:](BKDeviceClass_0, "deviceWithDescriptor:error:", v9, &v22);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v22;
    device = v2->_device;
    v2->_device = (BKDevicePearl *)v10;

    if (!v2->_device || v11)
    {
      _BKUILoggingFacility();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v11;
        _os_log_impl(&dword_1DB281000, v13, OS_LOG_TYPE_DEFAULT, "Failed to fetch BKDevice: %@", buf, 0xCu);
      }

    }
    v14 = objc_opt_new();
    analyticsManager = v2->_analyticsManager;
    v2->_analyticsManager = (BKUIAnalyticsManager *)v14;

    -[BKUIFaceIDEnrollOperationsHandler device](v2, "device");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    objc_msgSend(v16, "supportsPeriocularEnrollmentWithError:", &v21);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v21;

    if (v18)
    {
      _BKUILoggingFacility();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v18;
        _os_log_impl(&dword_1DB281000, v19, OS_LOG_TYPE_DEFAULT, "Failed to fetch if periocular is supported supportsPeriocularEnrollmentWithError failed, defaulting to NO ....error: %@", buf, 0xCu);
      }

      v2->_supportsPeriocularEnrollment = 0;
    }
    else
    {
      v2->_supportsPeriocularEnrollment = objc_msgSend(v17, "BOOLValue");
    }

  }
  return v2;
}

- (BOOL)isActive
{
  BKEnrollPearlOperation *enrollOperation;

  enrollOperation = self->_enrollOperation;
  if (enrollOperation)
    LOBYTE(enrollOperation) = -[BKEnrollPearlOperation state](enrollOperation, "state") != 4;
  return (char)enrollOperation;
}

- (void)setSuspend:(BOOL)a3
{
  BKEnrollPearlOperation *enrollOperation;
  id v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  id v9;
  void *v10;
  id v11;
  uint8_t buf[8];
  id v13;

  enrollOperation = self->_enrollOperation;
  if (a3)
  {
    v13 = 0;
    -[BKEnrollPearlOperation suspendWithError:](enrollOperation, "suspendWithError:", &v13);
    v5 = v13;
    if (!v5)
      return;
    v6 = v5;
    _BKUILoggingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v8 = "Pearl: Failed suspending enroll";
    goto LABEL_8;
  }
  v11 = 0;
  -[BKEnrollPearlOperation resumeWithError:](enrollOperation, "resumeWithError:", &v11);
  v9 = v11;
  if (!v9)
    return;
  v6 = v9;
  _BKUILoggingFacility();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v8 = "Pearl: Failed resuming enroll";
LABEL_8:
    _os_log_impl(&dword_1DB281000, v7, OS_LOG_TYPE_DEFAULT, v8, buf, 2u);
  }
LABEL_9:

  -[BKUIFaceIDEnrollOperationsHandler operationsDelegate](self, "operationsDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "endEnrollFlowWithError:", v6);

}

- (void)_cleanupEnroll
{
  id v3;

  -[BKUIFaceIDEnrollOperationsHandler _cleanupEnroll:](self, "_cleanupEnroll:", 1);
  -[BKUIFaceIDEnrollOperationsHandler operationsDelegate](self, "operationsDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidateSubstateTimer");

}

- (void)_cleanupEnroll:(BOOL)a3
{
  _BOOL4 v3;
  BKEnrollPearlOperation *enrollOperation;
  BKEnrollPearlOperation *v6;
  void *v7;
  SFClient *sharingclient;
  LAContext *authContext;
  NSObject *v10;
  uint8_t v11[16];

  v3 = a3;
  enrollOperation = self->_enrollOperation;
  if (enrollOperation)
  {
    -[BKEnrollPearlOperation setDelegate:](enrollOperation, "setDelegate:", 0);
    v6 = self->_enrollOperation;
    self->_enrollOperation = 0;

    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setIdleTimerDisabled:", 0);

  }
  -[SFClient invalidate](self->_sharingclient, "invalidate");
  sharingclient = self->_sharingclient;
  self->_sharingclient = 0;

  if (v3)
  {
    -[LAContext invalidate](self->_authContext, "invalidate");
    authContext = self->_authContext;
    self->_authContext = 0;

  }
  _BKUILoggingFacility();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1DB281000, v10, OS_LOG_TYPE_DEFAULT, "_cleanupEnroll: enrollOperationInProgress = NO", v11, 2u);
  }

  self->_enrollOperationInProgress = 0;
}

- (BOOL)completeCurrentEnrollOperationWithError:(id *)a3
{
  int v5;
  NSObject *v6;
  BKEnrollPearlOperation *enrollOperation;
  const char *v8;
  BKEnrollPearlOperation *v9;
  id v10;
  int v12;
  BKEnrollPearlOperation *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = -[BKEnrollPearlOperation completeWithError:](self->_enrollOperation, "completeWithError:");
  if (v5)
  {
    self->_userSelectedUseAccessibilityEnrollment = 1;
    _BKUILoggingFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      enrollOperation = self->_enrollOperation;
      v12 = 138412546;
      v13 = enrollOperation;
      v14 = 2048;
      v15 = -[BKEnrollPearlOperation enrollmentType](enrollOperation, "enrollmentType");
      v8 = "sucessfully completed enroll operation:%@, type:%li";
LABEL_6:
      _os_log_impl(&dword_1DB281000, v6, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v12, 0x16u);
    }
  }
  else
  {
    _BKUILoggingFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9 = self->_enrollOperation;
      v10 = *a3;
      v12 = 138412546;
      v13 = v9;
      v14 = 2112;
      v15 = (uint64_t)v10;
      v8 = "Failed to complete current enroll operation:%@, error:%@";
      goto LABEL_6;
    }
  }

  return v5;
}

- (void)cancelCurrentEnrollmentOperationIfUnfinished
{
  if (-[BKEnrollPearlOperation state](self->_enrollOperation, "state") != 4)
    -[BKEnrollPearlOperation cancel](self->_enrollOperation, "cancel");
}

- (void)cancelEnrollForRotation
{
  NSObject *enrollStartStopQueue;
  _QWORD block[5];

  enrollStartStopQueue = self->_enrollStartStopQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__BKUIFaceIDEnrollOperationsHandler_cancelEnrollForRotation__block_invoke;
  block[3] = &unk_1EA27FB98;
  block[4] = self;
  dispatch_sync(enrollStartStopQueue, block);
}

void __60__BKUIFaceIDEnrollOperationsHandler_cancelEnrollForRotation__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _DWORD v20[2];
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "operationsDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "needsCancellationForState:", objc_msgSend(v3, "state"));

  objc_msgSend(*(id *)(a1 + 32), "operationsDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getEnrollview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "percentOfPillsCompleted");
  v8 = v7;

  _BKUILoggingFacility();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "operationsDelegate", 1.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "state");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8 >= 1.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = 67109634;
    v20[1] = v11;
    v21 = 2112;
    v22 = v12;
    v23 = 2112;
    v24 = v13;
    _os_log_impl(&dword_1DB281000, v9, OS_LOG_TYPE_DEFAULT, "cancelEnrollForRotation: currentState[%u]demandsCancellation: %@, hasPartialPillCompletion: %@", (uint8_t *)v20, 0x1Cu);

  }
  if (v8 >= 1.0)
    v14 = 1;
  else
    v14 = v4;
  _BKUILoggingFacility();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v14 == 1)
  {
    if (v16)
    {
      LOWORD(v20[0]) = 0;
      _os_log_impl(&dword_1DB281000, v15, OS_LOG_TYPE_DEFAULT, "cancelEnrollForRotation early exit", (uint8_t *)v20, 2u);
    }
  }
  else
  {
    if (v16)
    {
      LOWORD(v20[0]) = 0;
      _os_log_impl(&dword_1DB281000, v15, OS_LOG_TYPE_DEFAULT, "cancelEnrollForRotation: cancelling now", (uint8_t *)v20, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "operationsDelegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "getEnrollview");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setState:completion:", 0, 0);

    objc_msgSend(*(id *)(a1 + 32), "_removeIdentity");
    objc_msgSend(*(id *)(a1 + 32), "_cleanupEnroll:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeAllObjects");
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120) = 0;
    v19 = *(_QWORD *)(a1 + 32);
    v15 = *(NSObject **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = 0;
  }

}

- (BOOL)needsCancellationForState:(int)a3
{
  return (a3 < 0xB) & (0x707u >> a3);
}

- (void)startEnrollForEnrollmentType:(int64_t)a3 glassesRequirement:(int64_t)a4 identity:(id)a5 operationStartedActionBlock:(id)a6
{
  id v10;
  id v11;
  _BOOL4 enrollOperationInProgress;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *enrollStartStopQueue;
  int64_t v26;
  int64_t v27;
  _QWORD block[5];
  id v29;
  id v30;
  int64_t v31;
  int64_t v32;
  _QWORD v33[4];
  _QWORD v34[4];
  uint8_t buf[4];
  BKUIFaceIDEnrollOperationsHandler *v36;
  __int16 v37;
  int64_t v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  enrollOperationInProgress = self->_enrollOperationInProgress;
  _BKUILoggingFacility();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (enrollOperationInProgress)
  {
    if (v14)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB281000, v13, OS_LOG_TYPE_DEFAULT, "startEnrollForEnrollmentType: enrollOperationInProgress = YES - Enroll already in progress", buf, 2u);
    }

  }
  else
  {
    if (v14)
    {
      *(_DWORD *)buf = 138412802;
      v36 = self;
      v37 = 2048;
      v38 = a3;
      v39 = 2112;
      v40 = v10;
      _os_log_impl(&dword_1DB281000, v13, OS_LOG_TYPE_DEFAULT, "%@ Starting Enroll... type:%li identity:%@ enrollOperationInProgress = YES", buf, 0x20u);
    }

    -[BKUIFaceIDEnrollOperationsHandler analyticsManager](self, "analyticsManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = CFSTR("inBuddy");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BKUIFaceIDEnrollOperationsHandler inbuddy](self, "inbuddy"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v16;
    v33[1] = CFSTR("enrollmentType");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v27 = a3;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = v17;
    v33[2] = CFSTR("enrollmentState");
    v18 = (void *)MEMORY[0x1E0CB37E8];
    -[BKUIFaceIDEnrollOperationsHandler enrollOperation](self, "enrollOperation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "numberWithInteger:", objc_msgSend(v19, "state"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v34[2] = v20;
    v33[3] = CFSTR("enrollmentNeedsGlasses");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v26 = a4;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v34[3] = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "traceEvent:withPayload:", CFSTR("com.apple.BKUI.FaceIDEnrollmentStarted"), v22);

    self->_bioKitCompletionPercentage = 0.0;
    self->_enrollOperationInProgress = 1;
    -[BKUIFaceIDEnrollOperationsHandler operationsDelegate](self, "operationsDelegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setNeedsLayout");

    enrollStartStopQueue = self->_enrollStartStopQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __122__BKUIFaceIDEnrollOperationsHandler_startEnrollForEnrollmentType_glassesRequirement_identity_operationStartedActionBlock___block_invoke;
    block[3] = &unk_1EA2800D0;
    block[4] = self;
    v31 = v27;
    v29 = v10;
    v32 = v26;
    v30 = v11;
    dispatch_sync(enrollStartStopQueue, block);

  }
}

void __122__BKUIFaceIDEnrollOperationsHandler_startEnrollForEnrollmentType_glassesRequirement_identity_operationStartedActionBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  id v14;
  NSObject *v15;
  _BOOL4 v16;
  _BOOL8 v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _QWORD block[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD aBlock[5];
  id v28;
  id v29;
  id v30;
  id v31[3];
  id location;
  id v33;
  id buf;
  __int16 v35;
  _BOOL4 v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  _BKUILoggingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "credential");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = v3 != 0;
    _os_log_impl(&dword_1DB281000, v2, OS_LOG_TYPE_DEFAULT, "Has credential: %d", (uint8_t *)&buf, 8u);

  }
  v4 = *(void **)(a1 + 32);
  v33 = 0;
  objc_msgSend(v4, "getAuthContextForCredentialError:", &v33);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v33;
  _BKUILoggingFacility();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = v5 != 0;
    _os_log_impl(&dword_1DB281000, v7, OS_LOG_TYPE_DEFAULT, "Has credentialSet: %d", (uint8_t *)&buf, 8u);
  }

  objc_initWeak(&location, *(id *)(a1 + 32));
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __122__BKUIFaceIDEnrollOperationsHandler_startEnrollForEnrollmentType_glassesRequirement_identity_operationStartedActionBlock___block_invoke_77;
  aBlock[3] = &unk_1EA280058;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  objc_copyWeak(v31, &location);
  v31[1] = *(id *)(a1 + 56);
  v9 = *(id *)(a1 + 40);
  v10 = *(void **)(a1 + 64);
  v28 = v9;
  v31[2] = v10;
  v11 = v5;
  v29 = v11;
  v30 = *(id *)(a1 + 48);
  v12 = _Block_copy(aBlock);
  if (v6)
  {
    objc_initWeak(&buf, *(id *)(a1 + 32));
    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __122__BKUIFaceIDEnrollOperationsHandler_startEnrollForEnrollmentType_glassesRequirement_identity_operationStartedActionBlock___block_invoke_2_87;
    block[3] = &unk_1EA27FD80;
    objc_copyWeak(&v23, &buf);
    v22 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&buf);
  }
  else
  {
    v13 = _AXSVoiceOverTouchEnabled();
    v14 = objc_alloc_init(MEMORY[0x1E0D02830]);
    _BKUILoggingFacility();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v13 != 0;
      v17 = v13 == 0;
      LODWORD(buf) = 67109376;
      HIDWORD(buf) = v17;
      v35 = 1024;
      v36 = v16;
      _os_log_impl(&dword_1DB281000, v15, OS_LOG_TYPE_DEFAULT, "Setting attention detection to %d because VoiceOver is %d", (uint8_t *)&buf, 0xEu);
    }
    else
    {
      v17 = v13 == 0;
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAttentionDetectionEnabled:", v18);

    objc_initWeak(&buf, *(id *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "device");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = getuid();
    v24[0] = v8;
    v24[1] = 3221225472;
    v24[2] = __122__BKUIFaceIDEnrollOperationsHandler_startEnrollForEnrollmentType_glassesRequirement_identity_operationStartedActionBlock___block_invoke_84;
    v24[3] = &unk_1EA2800A8;
    objc_copyWeak(&v26, &buf);
    v25 = v12;
    objc_msgSend(v19, "setProtectedConfiguration:forUser:credentialSet:reply:", v14, v20, v11, v24);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&buf);

  }
  objc_destroyWeak(v31);
  objc_destroyWeak(&location);

}

void __122__BKUIFaceIDEnrollOperationsHandler_startEnrollForEnrollmentType_glassesRequirement_identity_operationStartedActionBlock___block_invoke_77(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[6];
  id v18;
  uint64_t v19;
  _QWORD block[5];
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 32));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(v3, "createEnrollOperationWithError:", &v23);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v23;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 128);
  *(_QWORD *)(v6 + 128) = v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "setEnrollmentType:", *(_QWORD *)(a1 + 72));
  if (*(_QWORD *)(a1 + 72) != 1)
  {
    _BKUILoggingFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v25 = v9;
      _os_log_impl(&dword_1DB281000, v8, OS_LOG_TYPE_DEFAULT, "Set enroll operation enrollment type to augment identity: %@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "setAugmentedIdentity:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "setPeriocularGlassesRequirement:", *(_QWORD *)(a1 + 80));
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "setCredentialSet:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "setUserID:", getuid());
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "setClientToComplete:", 1);
  v10 = *(void **)(*(_QWORD *)(a1 + 32) + 128);
  if (!v10 || v5)
  {
    _BKUILoggingFacility();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v5;
      _os_log_impl(&dword_1DB281000, v11, OS_LOG_TYPE_DEFAULT, "Failed to create enroll operation: %@", buf, 0xCu);
    }

  }
  else
  {
    objc_msgSend(v10, "setDelegate:", WeakRetained);
  }
  v12 = *(void **)(a1 + 32);
  v22 = v5;
  v13 = objc_msgSend(v12, "_startOperationWithError:", &v22);
  v14 = v22;

  if ((v13 & 1) != 0)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __122__BKUIFaceIDEnrollOperationsHandler_startEnrollForEnrollmentType_glassesRequirement_identity_operationStartedActionBlock___block_invoke_2;
    v17[3] = &unk_1EA280030;
    v19 = *(_QWORD *)(a1 + 72);
    v17[4] = *(_QWORD *)(a1 + 32);
    v17[5] = WeakRetained;
    v18 = *(id *)(a1 + 56);
    dispatch_async(MEMORY[0x1E0C80D38], v17);
    v15 = v18;
  }
  else
  {
    _BKUILoggingFacility();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v14;
      _os_log_impl(&dword_1DB281000, v16, OS_LOG_TYPE_DEFAULT, "Failed to start enroll: %@", buf, 0xCu);
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __122__BKUIFaceIDEnrollOperationsHandler_startEnrollForEnrollmentType_glassesRequirement_identity_operationStartedActionBlock___block_invoke_78;
    block[3] = &unk_1EA27FC78;
    block[4] = WeakRetained;
    v21 = v14;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v15 = v21;
  }

}

void __122__BKUIFaceIDEnrollOperationsHandler_startEnrollForEnrollmentType_glassesRequirement_identity_operationStartedActionBlock___block_invoke_78(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "operationsDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to start enroll: %@"), *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setStatus:", v3);

  objc_msgSend(*(id *)(a1 + 32), "operationsDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endEnrollFlowWithError:", *(_QWORD *)(a1 + 40));

}

void __122__BKUIFaceIDEnrollOperationsHandler_startEnrollForEnrollmentType_glassesRequirement_identity_operationStartedActionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIdleTimerDisabled:", 1);

  v3 = objc_alloc_init(getSFClientClass());
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 8);
  *(_QWORD *)(v4 + 8) = v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "activateAssertionWithIdentifier:", CFSTR("com.apple.sharing.PreventProxCards"));
  if (*(_QWORD *)(a1 + 56) != 1 && !objc_msgSend(*(id *)(a1 + 40), "isEnrollmentAugmentationOnly"))
  {
    v6 = *(_QWORD *)(a1 + 48);
    if (!v6)
      return;
    goto LABEL_7;
  }
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
  {
LABEL_7:
    (*(void (**)(void))(v6 + 16))();
    return;
  }
  objc_msgSend(*(id *)(a1 + 40), "operationsDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "state");

  if (v8 == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "operationsDelegate");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setState:animated:", 3, 1);

  }
}

void __122__BKUIFaceIDEnrollOperationsHandler_startEnrollForEnrollmentType_glassesRequirement_identity_operationStartedActionBlock___block_invoke_84(uint64_t a1, char a2, void *a3)
{
  id v5;
  _QWORD *WeakRetained;
  NSObject *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v5 || (a2 & 1) == 0)
  {
    _BKUILoggingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v5;
      _os_log_impl(&dword_1DB281000, v7, OS_LOG_TYPE_DEFAULT, "Failed to disable attention detection with VoiceOver, reason: %@", buf, 0xCu);
    }

  }
  v8 = WeakRetained[4];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __122__BKUIFaceIDEnrollOperationsHandler_startEnrollForEnrollmentType_glassesRequirement_identity_operationStartedActionBlock___block_invoke_85;
  block[3] = &unk_1EA280080;
  v10 = *(id *)(a1 + 32);
  dispatch_async(v8, block);

}

uint64_t __122__BKUIFaceIDEnrollOperationsHandler_startEnrollForEnrollmentType_glassesRequirement_identity_operationStartedActionBlock___block_invoke_85(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __122__BKUIFaceIDEnrollOperationsHandler_startEnrollForEnrollmentType_glassesRequirement_identity_operationStartedActionBlock___block_invoke_2_87(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "operationsDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endEnrollFlowWithError:", *(_QWORD *)(a1 + 32));

}

- (void)startEnroll
{
  self->_userSelectedUseAccessibilityEnrollment = 0;
  -[BKUIFaceIDEnrollOperationsHandler startEnrollForEnrollmentType:glassesRequirement:identity:operationStartedActionBlock:](self, "startEnrollForEnrollmentType:glassesRequirement:identity:operationStartedActionBlock:", 1, 0, 0, 0);
}

- (void)matchUserThenDoSingleEnrollmentWithExisitingEnrollmentConfigCompletionAction:(id)a3
{
  id v4;
  BKUIMatchVerifyPearlOperation *v5;
  void *v6;
  void *v7;
  id v8;
  BKUIPasscodeEntryController *v9;
  BKUIPasscodeEntryController *v10;
  void *v11;
  void *v12;
  id *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  _QWORD v21[5];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id location;
  id v28;

  v4 = a3;
  v5 = objc_alloc_init(BKUIMatchVerifyPearlOperation);
  -[BKUIFaceIDEnrollOperationsHandler setMatchOperation:](self, "setMatchOperation:", v5);

  -[BKUIFaceIDEnrollOperationsHandler operationsDelegate](self, "operationsDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIFaceIDEnrollOperationsHandler matchOperation](self, "matchOperation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setOperationsDelegate:", v6);

  -[BKUIFaceIDEnrollOperationsHandler setGlassesEnforcementError:](self, "setGlassesEnforcementError:", 0);
  -[BKUIFaceIDEnrollOperationsHandler setMatchUserThenDoSingleEnrollmentCompletion:](self, "setMatchUserThenDoSingleEnrollmentCompletion:", v4);
  v28 = 0;
  LODWORD(v7) = -[BKUIFaceIDEnrollOperationsHandler _matchOperationPreflightCheck:](self, "_matchOperationPreflightCheck:", &v28);
  v8 = v28;
  if ((_DWORD)v7)
  {
    if (-[BKUIFaceIDEnrollOperationsHandler inbuddy](self, "inbuddy")
      && -[BKUIFaceIDEnrollOperationsHandler enrollmentConfiguration](self, "enrollmentConfiguration") == 3
      && +[BKUIPasscodeEntryController isDevicePasscodeSet](BKUIPasscodeEntryController, "isDevicePasscodeSet")&& !v8)
    {
      dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
      -[BKUIFaceIDEnrollOperationsHandler setExternalizedAuthContext:](self, "setExternalizedAuthContext:", 0);
      -[BKUIFaceIDEnrollOperationsHandler setCredential:](self, "setCredential:", 0);
      objc_initWeak(&location, self);
      v9 = [BKUIPasscodeEntryController alloc];
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __114__BKUIFaceIDEnrollOperationsHandler_matchUserThenDoSingleEnrollmentWithExisitingEnrollmentConfigCompletionAction___block_invoke;
      v24[3] = &unk_1EA280120;
      objc_copyWeak(&v26, &location);
      v25 = v4;
      v10 = -[BKUIPasscodeEntryController initWithVerifiedPasscodeAction:](v9, "initWithVerifiedPasscodeAction:", v24);
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v10);
      -[BKUIFaceIDEnrollOperationsHandler operationsDelegate](self, "operationsDelegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "presentViewController:animated:completion:", v11, 1, 0);

      v13 = &v26;
    }
    else
    {
      if (-[BKUIFaceIDEnrollOperationsHandler isEnrollmentAugmentationOnly](self, "isEnrollmentAugmentationOnly"))
      {
        -[BKUIFaceIDEnrollOperationsHandler operationsDelegate](self, "operationsDelegate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "substate");

        if (v15 != 15)
        {
          -[BKUIFaceIDEnrollOperationsHandler operationsDelegate](self, "operationsDelegate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setState:animated:", 3, 1);

        }
      }
      objc_initWeak(&location, self);
      -[BKUIFaceIDEnrollOperationsHandler matchOperation](self, "matchOperation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIFaceIDEnrollOperationsHandler device](self, "device");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIFaceIDEnrollOperationsHandler identity](self, "identity");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[BKUIFaceIDEnrollOperationsHandler enrollmentConfiguration](self, "enrollmentConfiguration");
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __114__BKUIFaceIDEnrollOperationsHandler_matchUserThenDoSingleEnrollmentWithExisitingEnrollmentConfigCompletionAction___block_invoke_4;
      v21[3] = &unk_1EA280148;
      objc_copyWeak(&v23, &location);
      v21[4] = self;
      v22 = v4;
      objc_msgSend(v17, "startMatchOperationWithDevice:identity:credential:withConfiguration:matchOperationActionBlock:", v18, v19, v8, v20, v21);

      v13 = &v23;
    }
    objc_destroyWeak(v13);
    objc_destroyWeak(&location);
  }

}

void __114__BKUIFaceIDEnrollOperationsHandler_matchUserThenDoSingleEnrollmentWithExisitingEnrollmentConfigCompletionAction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[5];
  id v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (v3)
  {
    objc_msgSend(WeakRetained, "setCredential:", v3);
    objc_msgSend(v5, "operationsDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __114__BKUIFaceIDEnrollOperationsHandler_matchUserThenDoSingleEnrollmentWithExisitingEnrollmentConfigCompletionAction___block_invoke_2;
    v9[3] = &unk_1EA2800F8;
    v9[4] = v5;
    v10 = *(id *)(a1 + 32);
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, v9);

    v7 = v10;
  }
  else
  {
    objc_msgSend(WeakRetained, "operationsDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __114__BKUIFaceIDEnrollOperationsHandler_matchUserThenDoSingleEnrollmentWithExisitingEnrollmentConfigCompletionAction___block_invoke_3;
    v8[3] = &unk_1EA27FB98;
    v8[4] = v5;
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, v8);
  }

}

uint64_t __114__BKUIFaceIDEnrollOperationsHandler_matchUserThenDoSingleEnrollmentWithExisitingEnrollmentConfigCompletionAction___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "matchUserThenDoSingleEnrollmentWithExisitingEnrollmentConfigCompletionAction:", *(_QWORD *)(a1 + 40));
}

void __114__BKUIFaceIDEnrollOperationsHandler_matchUserThenDoSingleEnrollmentWithExisitingEnrollmentConfigCompletionAction___block_invoke_3(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "operationsDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.biometrickitui.pearl_enroll"), -1, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endEnrollFlowWithError:", v1);

}

void __114__BKUIFaceIDEnrollOperationsHandler_matchUserThenDoSingleEnrollmentWithExisitingEnrollmentConfigCompletionAction___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (v3)
  {
    if ((objc_msgSend(WeakRetained, "supportsPeriocularEnrollment") & 1) != 0
      || objc_msgSend(v5, "enrollmentType") != 3)
    {
      objc_msgSend(v5, "startEnrollForEnrollmentType:glassesRequirement:identity:operationStartedActionBlock:", objc_msgSend(v5, "enrollmentType"), 0, v3, *(_QWORD *)(a1 + 40));
    }
    else
    {
      _BKUILoggingFacility();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __114__BKUIFaceIDEnrollOperationsHandler_matchUserThenDoSingleEnrollmentWithExisitingEnrollmentConfigCompletionAction___block_invoke_4_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);

      objc_msgSend(v5, "operationsDelegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.biometrickitui.pearl_enroll"), -4, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "endEnrollFlowWithError:", v15);

    }
  }
  else
  {
    objc_msgSend(WeakRetained, "matchOperation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "matchOperation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "matchOperation:failedToMatchWithUserPositionSubstate:operationCompleteAction:", v16, objc_msgSend(v17, "lastErrorousSubState"), *(_QWORD *)(a1 + 40));

  }
}

- (void)matchUserForGlassesPhaseEnrollmentWithCompletionAction:(id)a3
{
  id v4;
  BKUIMatchVerifyPearlOperation *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id location;
  id v25;

  v4 = a3;
  v5 = objc_alloc_init(BKUIMatchVerifyPearlOperation);
  -[BKUIFaceIDEnrollOperationsHandler setMatchOperation:](self, "setMatchOperation:", v5);

  -[BKUIFaceIDEnrollOperationsHandler operationsDelegate](self, "operationsDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIFaceIDEnrollOperationsHandler matchOperation](self, "matchOperation");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v7, "setOperationsDelegate:", v6);

  v25 = 0;
  LOBYTE(v7) = -[BKUIFaceIDEnrollOperationsHandler _matchOperationPreflightCheck:](self, "_matchOperationPreflightCheck:", &v25);
  v8 = v25;
  if ((v7 & 1) != 0)
  {
    objc_initWeak(&location, self);
    -[BKUIFaceIDEnrollOperationsHandler matchOperation](self, "matchOperation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIFaceIDEnrollOperationsHandler device](self, "device");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIFaceIDEnrollOperationsHandler identity](self, "identity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[BKUIFaceIDEnrollOperationsHandler enrollmentConfiguration](self, "enrollmentConfiguration");
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __92__BKUIFaceIDEnrollOperationsHandler_matchUserForGlassesPhaseEnrollmentWithCompletionAction___block_invoke;
    v21[3] = &unk_1EA280148;
    objc_copyWeak(&v23, &location);
    v21[4] = self;
    v22 = v4;
    objc_msgSend(v9, "startMatchOperationWithDevice:identity:credential:withConfiguration:matchOperationActionBlock:", v10, v11, v8, v12, v21);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
  else
  {
    _BKUILoggingFacility();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[BKUIFaceIDEnrollOperationsHandler matchUserForGlassesPhaseEnrollmentWithCompletionAction:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);

  }
}

void __92__BKUIFaceIDEnrollOperationsHandler_matchUserForGlassesPhaseEnrollmentWithCompletionAction___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (v7)
  {
    objc_msgSend(WeakRetained, "startEnrollForEnrollmentType:glassesRequirement:identity:operationStartedActionBlock:", 3, 1, v7, *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(WeakRetained, "matchOperation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "matchOperation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "matchOperation:failedToMatchWithUserPositionSubstate:operationCompleteAction:", v5, objc_msgSend(v6, "lastErrorousSubState"), *(_QWORD *)(a1 + 40));

  }
}

- (BOOL)_matchOperationPreflightCheck:(id *)a3
{
  void (**v5)(void *, id);
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  BOOL v12;
  Class BKDeviceClass_0;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  id v20;
  id v21;
  _QWORD aBlock[5];
  uint8_t buf[4];
  _BOOL4 v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__BKUIFaceIDEnrollOperationsHandler__matchOperationPreflightCheck___block_invoke;
  aBlock[3] = &unk_1EA280170;
  aBlock[4] = self;
  v5 = (void (**)(void *, id))_Block_copy(aBlock);
  _BKUILoggingFacility();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[BKUIFaceIDEnrollOperationsHandler credential](self, "credential");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109120;
    v24 = v7 != 0;
    _os_log_impl(&dword_1DB281000, v6, OS_LOG_TYPE_DEFAULT, "Has credential: %d", buf, 8u);

  }
  v21 = 0;
  -[BKUIFaceIDEnrollOperationsHandler getAuthContextForCredentialError:](self, "getAuthContextForCredentialError:", &v21);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v21;
  _BKUILoggingFacility();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v24 = v8 != 0;
    _os_log_impl(&dword_1DB281000, v10, OS_LOG_TYPE_DEFAULT, "Has credentialSet: %d", buf, 8u);
  }

  -[BKUIFaceIDEnrollOperationsHandler device](self, "device");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    goto LABEL_6;
  BKDeviceClass_0 = getBKDeviceClass_0();
  -[objc_class deviceDescriptorForType:](getBKDeviceDescriptorClass_0(), "deviceDescriptorForType:", 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  -[objc_class deviceWithDescriptor:error:](BKDeviceClass_0, "deviceWithDescriptor:error:", v14, &v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v20;
  -[BKUIFaceIDEnrollOperationsHandler setDevice:](self, "setDevice:", v15);

  if (!v16)
  {
LABEL_6:
    *a3 = objc_retainAutorelease(v8);
    v12 = 1;
  }
  else
  {
    _BKUILoggingFacility();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[BKUIFaceIDEnrollOperationsHandler _matchOperationPreflightCheck:].cold.1((uint64_t)v16, v17, v18);

    v5[2](v5, v16);
    v12 = 0;
  }

  return v12;
}

uint64_t __67__BKUIFaceIDEnrollOperationsHandler__matchOperationPreflightCheck___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_removeIdentity");
  return objc_msgSend(*(id *)(a1 + 32), "enrollOperation:failedWithReason:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128), 2);
}

- (void)cancelEnrollPreserveIdentity
{
  void *v3;
  NSDate *lastFaceFoundDate;

  -[BKUIFaceIDEnrollOperationsHandler _cleanupEnroll:](self, "_cleanupEnroll:", 0);
  -[BKUIFaceIDEnrollOperationsHandler matchOperation](self, "matchOperation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelMatchOperation");

  -[NSMutableArray removeAllObjects](self->_poseStatus, "removeAllObjects");
  self->_bioKitCompletionPercentage = 0.0;
  lastFaceFoundDate = self->_lastFaceFoundDate;
  self->_lastFaceFoundDate = 0;

}

- (void)cancelEnroll
{
  -[BKUIFaceIDEnrollOperationsHandler _removeIdentity](self, "_removeIdentity");
  -[BKUIFaceIDEnrollOperationsHandler cancelEnrollPreserveIdentity](self, "cancelEnrollPreserveIdentity");
}

- (void)_removeIdentity
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[BKUIFaceIDEnrollOperationsHandler identity](self, "identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && !-[BKUIFaceIDEnrollOperationsHandler isEnrollmentAugmentationOnly](self, "isEnrollmentAugmentationOnly"))
  {
    _BKUILoggingFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      -[BKUIFaceIDEnrollOperationsHandler identity](self, "identity");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v10 = v5;
      _os_log_impl(&dword_1DB281000, v4, OS_LOG_TYPE_DEFAULT, "Removing identity: %@", buf, 0xCu);

    }
    -[BKUIFaceIDEnrollOperationsHandler setCanStartEnrollmentOperation:](self, "setCanStartEnrollmentOperation:", 0);
    -[BKUIFaceIDEnrollOperationsHandler device](self, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIFaceIDEnrollOperationsHandler identity](self, "identity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __52__BKUIFaceIDEnrollOperationsHandler__removeIdentity__block_invoke;
    v8[3] = &unk_1EA2801C0;
    v8[4] = self;
    objc_msgSend(v6, "removeIdentity:reply:", v7, v8);

  }
}

void __52__BKUIFaceIDEnrollOperationsHandler__removeIdentity__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[5];
  id v9;
  char v10;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__BKUIFaceIDEnrollOperationsHandler__removeIdentity__block_invoke_2;
  block[3] = &unk_1EA280198;
  v6 = *(_QWORD *)(a1 + 32);
  v10 = a2;
  block[4] = v6;
  v9 = v5;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __52__BKUIFaceIDEnrollOperationsHandler__removeIdentity__block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setCanStartEnrollmentOperation:", 1);
  objc_msgSend(*(id *)(a1 + 32), "operationsDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateButtonsVisibility");

  if (!*(_BYTE *)(a1 + 48) || *(_QWORD *)(a1 + 40))
  {
    _BKUILoggingFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 40);
      v5 = 138412290;
      v6 = v4;
      _os_log_impl(&dword_1DB281000, v3, OS_LOG_TYPE_DEFAULT, "Failed removing identity: %@", (uint8_t *)&v5, 0xCu);
    }

  }
}

- (void)advanceEnrollmentState
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  int v20;
  int v21;
  void *v22;
  double v23;
  void *v24;
  int v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  int v30;
  id v31;
  NSObject *v32;
  _BOOL4 v33;
  _BOOL4 v34;
  void *v35;
  void *v36;
  double v37;
  double bioKitCompletionPercentage;
  const __CFString *v39;
  NSObject *v40;
  double v41;
  void *v42;
  int v43;
  _BOOL4 v44;
  NSObject *v45;
  _BOOL4 v46;
  unint64_t v47;
  void *v48;
  int v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  id v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t buf[4];
  double v60;
  __int16 v61;
  _BYTE v62[10];
  _DWORD v63[4];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  -[BKUIFaceIDEnrollOperationsHandler operationsDelegate](self, "operationsDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (int)(self->_bioKitCompletionPercentage * 100.0);
  -[BKUIFaceIDEnrollOperationsHandler operationsDelegate](self, "operationsDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "percentOfPillsCompleted");
  objc_msgSend(v4, "stringWithFormat:", CFSTR("BioKit: %d%%, rings: %d%%"), v5, (int)(v7 * 100.0));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProgressString:", v8);

  -[BKUIFaceIDEnrollOperationsHandler operationsDelegate](self, "operationsDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_updateDebugLabel");

  -[BKUIFaceIDEnrollOperationsHandler operationsDelegate](self, "operationsDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "percentOfPillsCompleted");
  v12 = v11;

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v13 = self->_poseStatus;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v56;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v56 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * v17++), "integerValue");
      }
      while (v15 != v17);
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
    }
    while (v15);
  }

  _BKUILoggingFacility();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    -[BKUIFaceIDEnrollOperationsHandler operationsDelegate](self, "operationsDelegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "state");
    v21 = (int)(self->_bioKitCompletionPercentage * 100.0);
    -[BKUIFaceIDEnrollOperationsHandler operationsDelegate](self, "operationsDelegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "percentOfPillsCompleted");
    *(_DWORD *)buf = 134218752;
    v60 = v12;
    v61 = 1024;
    *(_DWORD *)v62 = v20;
    *(_WORD *)&v62[4] = 1024;
    *(_DWORD *)&v62[6] = v21;
    LOWORD(v63[0]) = 1024;
    *(_DWORD *)((char *)v63 + 2) = (int)(v23 * 100.0);
    _os_log_impl(&dword_1DB281000, v18, OS_LOG_TYPE_DEFAULT, "advanceEnrollmentState evaluate next state for advancement... percentPillsCompleted:%f state:%i BioKit: %d%%, rings: %d%%", buf, 0x1Eu);

  }
  -[BKUIFaceIDEnrollOperationsHandler operationsDelegate](self, "operationsDelegate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "state");

  if (v25 == 5 && v12 >= 1.0)
  {
    _BKUILoggingFacility();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB281000, v26, OS_LOG_TYPE_DEFAULT, "Finishing 1st enroll operation...", buf, 2u);
    }

    -[BKUIFaceIDEnrollOperationsHandler enrollOperation](self, "enrollOperation");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "state");

    if (v28 != 4)
    {
      -[BKUIFaceIDEnrollOperationsHandler enrollOperation](self, "enrollOperation");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = 0;
      v30 = objc_msgSend(v29, "completeWithError:", &v54);
      v31 = v54;

      _BKUILoggingFacility();
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
      if (v30)
      {
        if (v33)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DB281000, v32, OS_LOG_TYPE_DEFAULT, "1st Enroll  operation marked as completed!", buf, 2u);
        }

        if (-[BKUIFaceIDEnrollOperationsHandler isEnrollmentAugmentationOnly](self, "isEnrollmentAugmentationOnly"))
        {
          v34 = -[BKUIFaceIDEnrollOperationsHandler isEnrollmentAugmentationOnly](self, "isEnrollmentAugmentationOnly");
          -[BKUIFaceIDEnrollOperationsHandler operationsDelegate](self, "operationsDelegate");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = v35;
          if (v34)
            v37 = 0.5;
          else
            v37 = 0.1;
        }
        else
        {
          -[BKUIFaceIDEnrollOperationsHandler operationsDelegate](self, "operationsDelegate");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = v35;
          v37 = 1.0;
        }
        v50 = 6;
        goto LABEL_47;
      }
      if (v33)
      {
        *(_DWORD *)buf = 138412290;
        v60 = *(double *)&v31;
        _os_log_impl(&dword_1DB281000, v32, OS_LOG_TYPE_DEFAULT, "Failed to complete 1st enroll: %@", buf, 0xCu);
      }

      -[BKUIFaceIDEnrollOperationsHandler operationsDelegate](self, "operationsDelegate");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to complete 1st enroll: %@"), v31, v52);
      goto LABEL_43;
    }
  }
  else
  {
    -[BKUIFaceIDEnrollOperationsHandler operationsDelegate](self, "operationsDelegate");
    v31 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v31, "state") != 7 || v12 < 1.0)
      goto LABEL_49;
    bioKitCompletionPercentage = self->_bioKitCompletionPercentage;

    if (bioKitCompletionPercentage >= 1.0)
    {
      if (-[BKUIFaceIDEnrollOperationsHandler supportsPeriocularEnrollment](self, "supportsPeriocularEnrollment"))
        v39 = CFSTR("extended");
      else
        v39 = &stru_1EA281248;
      _BKUILoggingFacility();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        v41 = self->_bioKitCompletionPercentage;
        -[BKUIFaceIDEnrollOperationsHandler operationsDelegate](self, "operationsDelegate");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v42, "state");
        *(_DWORD *)buf = 138412802;
        v60 = *(double *)&v39;
        v61 = 2048;
        *(double *)v62 = v41;
        *(_WORD *)&v62[8] = 1024;
        v63[0] = v43 == 7;
        _os_log_impl(&dword_1DB281000, v40, OS_LOG_TYPE_DEFAULT, "Finishing %@ enroll operation... %f %i", buf, 0x1Cu);

      }
      if (-[BKEnrollPearlOperation state](self->_enrollOperation, "state") != 4)
      {
        v53 = 0;
        v44 = -[BKUIFaceIDEnrollOperationsHandler _completeOperationWithError:](self, "_completeOperationWithError:", &v53);
        v31 = v53;
        _BKUILoggingFacility();
        v45 = objc_claimAutoreleasedReturnValue();
        v46 = os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT);
        if (v44)
        {
          if (v46)
          {
            *(_DWORD *)buf = 138412290;
            v60 = *(double *)&v39;
            _os_log_impl(&dword_1DB281000, v45, OS_LOG_TYPE_DEFAULT, "%@ enroll operation marked as completed!", buf, 0xCu);
          }

          v47 = -[BKUIFaceIDEnrollOperationsHandler enrollmentConfiguration](self, "enrollmentConfiguration");
          -[BKUIFaceIDEnrollOperationsHandler operationsDelegate](self, "operationsDelegate");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = v48;
          if (!v47
            || (v49 = objc_msgSend(v48, "state"),
                v36,
                -[BKUIFaceIDEnrollOperationsHandler operationsDelegate](self, "operationsDelegate"),
                v36 = (void *)objc_claimAutoreleasedReturnValue(),
                v49 == 7))
          {
            v37 = 0.5;
            v35 = v36;
            v50 = 8;
LABEL_47:
            objc_msgSend(v35, "setState:animated:afterDelay:", v50, 1, v37);
            goto LABEL_48;
          }
          -[BKUIFaceIDEnrollOperationsHandler operationsDelegate](self, "operationsDelegate");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "setState:animated:afterDelay:", objc_msgSend(v51, "state") + 1, 1, 0.5);
LABEL_44:

LABEL_48:
LABEL_49:

          return;
        }
        if (v46)
        {
          *(_DWORD *)buf = 138412546;
          v60 = *(double *)&v39;
          v61 = 2112;
          *(_QWORD *)v62 = v31;
          _os_log_impl(&dword_1DB281000, v45, OS_LOG_TYPE_DEFAULT, "Failed to complete %@ enroll operation: %@", buf, 0x16u);
        }

        -[BKUIFaceIDEnrollOperationsHandler operationsDelegate](self, "operationsDelegate");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to complete %@ enroll: %@"), v39, v31);
LABEL_43:
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setStatus:", v51);
        goto LABEL_44;
      }
    }
  }
}

- (BOOL)showAddGlassesButton
{
  return 0;
}

- (void)operation:(id)a3 faceDetectStateChanged:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  BKUIFaceIDEnrollOperationsHandler *v9;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__BKUIFaceIDEnrollOperationsHandler_operation_faceDetectStateChanged___block_invoke;
  v7[3] = &unk_1EA27FC78;
  v8 = v5;
  v9 = self;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __70__BKUIFaceIDEnrollOperationsHandler_operation_faceDetectStateChanged___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  char v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  _QWORD *v38;
  char v39;
  void *v40;
  int v41;
  void *v42;
  double v43;
  void *v44;
  void *v45;
  double *v46;
  id v47;

  if (objc_msgSend(*(id *)(a1 + 32), "tooCloseToCamera"))
  {
    objc_msgSend(*(id *)(a1 + 40), "operationsDelegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setStatus:", CFSTR("Too close to camera"));
    v3 = 0;
    v4 = 0;
    v5 = 1;
    goto LABEL_17;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "tooFarFromCamera"))
  {
    objc_msgSend(*(id *)(a1 + 40), "operationsDelegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setStatus:", CFSTR("Too far from camera"));
    v3 = 0;
    v4 = 0;
    v5 = 2;
    goto LABEL_17;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "multipleFaces"))
  {
    objc_msgSend(*(id *)(a1 + 40), "operationsDelegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setStatus:", CFSTR("Multiple faces in view"));
    v3 = 0;
    v4 = 0;
    v5 = 4;
    goto LABEL_17;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "flare"))
  {
    objc_msgSend(*(id *)(a1 + 40), "operationsDelegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setStatus:", CFSTR("Bright light on camera"));
    v3 = 0;
    v4 = 0;
    v5 = 7;
    goto LABEL_17;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "partiallyOutOfView"))
  {
    objc_msgSend(*(id *)(a1 + 40), "operationsDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = v6;
    v7 = CFSTR("Face not fully visible");
  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 32), "occlusion"))
    {
      objc_msgSend(*(id *)(a1 + 40), "operationsDelegate");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setStatus:", CFSTR("Face is occluded"));
      v3 = 0;
      v4 = 0;
      v5 = 8;
      goto LABEL_17;
    }
    v8 = objc_msgSend(*(id *)(a1 + 32), "faceDetected");
    objc_msgSend(*(id *)(a1 + 40), "operationsDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = v6;
    if (v8)
    {
      objc_msgSend(v6, "setStatus:", CFSTR("Face found!"));
      v4 = 0;
      v5 = 0;
      v3 = 1;
      goto LABEL_17;
    }
    v7 = CFSTR("No face in view");
  }
  objc_msgSend(v6, "setStatus:", v7);
  v3 = 0;
  v5 = 9;
  v4 = 1;
LABEL_17:

  if (objc_msgSend(*(id *)(a1 + 32), "faceDetected"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
  v12 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "count");
  v13 = *(id **)(a1 + 40);
  if (v12)
  {
    objc_msgSend(v13[9], "objectAtIndexedSubscript:", 8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setCenterBinComplete:", objc_msgSend(v14, "integerValue") == 3);

  }
  else
  {
    objc_msgSend(v13, "setCenterBinComplete:", 0);
  }
  objc_msgSend(*(id *)(a1 + 40), "operationsDelegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "state");

  if ((v3 & objc_msgSend(*(id *)(a1 + 32), "faceDetected")) == 1 && v16 == 3)
  {
    if ((objc_msgSend(*(id *)(a1 + 40), "centerBinComplete") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "operationsDelegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      v19 = 4;
LABEL_30:
      objc_msgSend(v17, "setState:animated:", v19, 1);
      goto LABEL_54;
    }
  }
  else
  {
    if (v16 == 4)
    {
      if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 40))
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40));
        v22 = v21;

        if (v22 > 2.0)
        {
          objc_msgSend(*(id *)(a1 + 40), "operationsDelegate");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17;
          v19 = 3;
          goto LABEL_30;
        }
      }
      goto LABEL_46;
    }
    if ((v16 & 0xFFFFFFFD) == 5)
    {
      if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 40))
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40));
        if (v24 <= 1.15)
        {

        }
        else
        {
          objc_msgSend(*(id *)(a1 + 40), "operationsDelegate");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "getEnrollview");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "percentOfPillsCompleted");
          v28 = v27;

          if (v28 < 1.0)
          {
            objc_msgSend(*(id *)(a1 + 40), "operationsDelegate");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "setState:animated:", 3, 1);

            objc_msgSend(*(id *)(a1 + 40), "operationsDelegate");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "audioManager");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 40), "operationsDelegate");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "triggerSoundHapticForTransitionToSubstate:fromSubstate:", 9, objc_msgSend(v32, "substate"));

            objc_msgSend(*(id *)(a1 + 40), "operationsDelegate");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setSubstate:", 9);
            goto LABEL_54;
          }
        }
      }
      goto LABEL_46;
    }
  }
  v33 = v3 ^ 1;
  if (v16 != 3)
    v33 = 1;
  if ((v33 & 1) == 0
    && objc_msgSend(*(id *)(a1 + 40), "centerBinComplete")
    && objc_msgSend(*(id *)(a1 + 32), "faceDetected"))
  {
    objc_msgSend(*(id *)(a1 + 40), "operationsDelegate");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v34, "previousState") == 5)
    {

LABEL_45:
      objc_msgSend(*(id *)(a1 + 40), "operationsDelegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "operationsDelegate");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setState:animated:", objc_msgSend(v37, "previousState"), 1);

      goto LABEL_54;
    }
    objc_msgSend(*(id *)(a1 + 40), "operationsDelegate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "previousState");

    if (v36 == 7)
      goto LABEL_45;
  }
LABEL_46:
  v38 = *(_QWORD **)(a1 + 40);
  if (v38[5])
    v39 = 0;
  else
    v39 = v4;
  if ((v39 & 1) != 0)
    goto LABEL_55;
  objc_msgSend(v38, "operationsDelegate");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "substate");

  objc_msgSend(*(id *)(a1 + 40), "operationsDelegate");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v42;
  if (v41)
    v43 = 4.0;
  else
    v43 = 1.25;
  objc_msgSend(v42, "setSubstate:animated:afterDelay:", v5, 1, v43);
LABEL_54:

LABEL_55:
  if ((objc_msgSend(*(id *)(a1 + 32), "occlusion") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "operationsDelegate");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "getEnrollview");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "updateWithFaceState:", *(_QWORD *)(a1 + 32));

    objc_msgSend(*(id *)(a1 + 40), "advanceEnrollmentState");
    v46 = *(double **)(a1 + 40);
    if (v46[15] >= 1.0)
    {
      objc_msgSend(v46, "operationsDelegate");
      v47 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "refreshEscapeHatchForCurrentState");

    }
  }
}

- (void)enrollOperation:(id)a3 percentCompleted:(int64_t)a4
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __70__BKUIFaceIDEnrollOperationsHandler_enrollOperation_percentCompleted___block_invoke;
  v4[3] = &unk_1EA2801E8;
  v4[4] = self;
  v4[5] = a4;
  dispatch_async(MEMORY[0x1E0C80D38], v4);
}

uint64_t __70__BKUIFaceIDEnrollOperationsHandler_enrollOperation_percentCompleted___block_invoke(uint64_t a1)
{
  *(double *)(*(_QWORD *)(a1 + 32) + 120) = (double)*(uint64_t *)(a1 + 40) / 100.0;
  return objc_msgSend(*(id *)(a1 + 32), "advanceEnrollmentState");
}

- (void)enrollOperation:(id)a3 finishedWithEnrollResult:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint8_t v12[16];

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "enrolledIdentity");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
    -[BKUIFaceIDEnrollOperationsHandler enrollOperation:finishedWithEnrollResult:].cold.1();
  v9 = (void *)v8;
  if (objc_msgSend(v7, "glassesDetected")
    && !objc_msgSend(v6, "periocularGlassesRequirement")
    && objc_msgSend(v6, "enrollmentType") == 3)
  {
    _BKUILoggingFacility();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1DB281000, v10, OS_LOG_TYPE_DEFAULT, "glasses found!", v12, 2u);
    }

    -[BKUIFaceIDEnrollOperationsHandler setGlassesFound:](self, "setGlassesFound:", 1);
  }
  -[BKUIFaceIDEnrollOperationsHandler operationsDelegate](self, "operationsDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "enrollOperation:finishedWithIdentity:animateImmediately:", v6, v9, 0);

  -[BKUIFaceIDEnrollOperationsHandler _cleanupEnroll](self, "_cleanupEnroll");
}

- (void)enrollOperation:(id)a3 failedWithReason:(int64_t)a4
{
  id v6;
  int v7;
  dispatch_time_t v8;
  _QWORD v9[6];
  _QWORD block[5];
  int v11;

  v6 = a3;
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 0xA)
  {
    -[BKUIFaceIDEnrollOperationsHandler setGlassesEnforcementError:](self, "setGlassesEnforcementError:", 1);
    if (a4 == 11)
    {
      if (-[BKUIFaceIDEnrollOperationsHandler glassesRequirement](self, "glassesRequirement") == 2)
        v7 = 12;
      else
        v7 = 13;
    }
    else
    {
      v7 = 14;
    }
    v8 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__BKUIFaceIDEnrollOperationsHandler_enrollOperation_failedWithReason___block_invoke;
    block[3] = &unk_1EA280210;
    block[4] = self;
    v11 = v7;
    dispatch_after(v8, MEMORY[0x1E0C80D38], block);
  }
  else if (a4 != 1)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __70__BKUIFaceIDEnrollOperationsHandler_enrollOperation_failedWithReason___block_invoke_3;
    v9[3] = &unk_1EA2801E8;
    v9[4] = self;
    v9[5] = a4;
    dispatch_async(MEMORY[0x1E0C80D38], v9);
  }

}

void __70__BKUIFaceIDEnrollOperationsHandler_enrollOperation_failedWithReason___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  dispatch_time_t v4;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "operationsDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setState:animated:", 3, 1);

  objc_msgSend(*(id *)(a1 + 32), "operationsDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSubstate:animated:afterDelay:", *(unsigned int *)(a1 + 40), 1, 0.0);

  v4 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__BKUIFaceIDEnrollOperationsHandler_enrollOperation_failedWithReason___block_invoke_2;
  block[3] = &unk_1EA27FB98;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_after(v4, MEMORY[0x1E0C80D38], block);
}

void __70__BKUIFaceIDEnrollOperationsHandler_enrollOperation_failedWithReason___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "operationsDelegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "refreshEscapeHatchForCurrentState");

}

void __70__BKUIFaceIDEnrollOperationsHandler_enrollOperation_failedWithReason___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  _BKUILoggingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __70__BKUIFaceIDEnrollOperationsHandler_enrollOperation_failedWithReason___block_invoke_3_cold_1(a1, v2);

  objc_msgSend(*(id *)(a1 + 32), "_removeIdentity");
  objc_msgSend(*(id *)(a1 + 32), "operationsDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Enroll failed with reason %d"), *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setStatus:", v4);

  objc_msgSend(*(id *)(a1 + 32), "operationsDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getEnrollview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFailed");

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.biometrickitui.biokit"), *(_QWORD *)(a1 + 40), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "operationsDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endEnrollFlowWithError:", v7);

}

- (void)matchOperation:(id)a3 failedToMatchWithUserPositionSubstate:(int)a4 operationCompleteAction:(id)a5
{
  _QWORD v5[5];
  int v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __114__BKUIFaceIDEnrollOperationsHandler_matchOperation_failedToMatchWithUserPositionSubstate_operationCompleteAction___block_invoke;
  v5[3] = &unk_1EA280210;
  v5[4] = self;
  v6 = a4;
  dispatch_async(MEMORY[0x1E0C80D38], v5);
}

void __114__BKUIFaceIDEnrollOperationsHandler_matchOperation_failedToMatchWithUserPositionSubstate_operationCompleteAction___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint8_t buf[4];
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "operationsDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Enroll failed with last substate %d"), *(unsigned int *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setStatus:", v3);

  objc_msgSend(*(id *)(a1 + 32), "matchOperation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "failReason");

  v6 = *(void **)(a1 + 32);
  if (v5 == -9999)
  {
    if (objc_msgSend(v6, "isEnrollmentAugmentationOnly"))
      v7 = 2;
    else
      v7 = 6;
    _BKUILoggingFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_DWORD *)(a1 + 40);
      *(_DWORD *)buf = 67109120;
      v17 = v9;
      _os_log_impl(&dword_1DB281000, v8, OS_LOG_TYPE_DEFAULT, "PearlMatchOperation: BKUIMatchVerifyFailReasonStartFailed failed to start match operation error = %d .... showing RetryUI", buf, 8u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.biometrickitui.biokit"), v7, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "operationsDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "endEnrollFlowWithError:", v10);

  }
  else
  {
    objc_msgSend(v6, "matchOperation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "matchOperation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "moveEnrollStateToNeedsPositioning:", objc_msgSend(v13, "lastErrorousSubState"));

    if ((objc_msgSend(*(id *)(a1 + 32), "shouldShowRetryUI") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "matchOperation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "retryMatchOperation");

    }
    _BKUILoggingFacility();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(_DWORD *)(a1 + 40);
      *(_DWORD *)buf = 67109120;
      v17 = v15;
      _os_log_impl(&dword_1DB281000, v10, OS_LOG_TYPE_DEFAULT, "PearlMatchOperation: failedToMatchWithUserPositionSubstate to enroll, error = %d .... showing RetryUI start retry", buf, 8u);
    }
  }

}

- (BOOL)_validateEnrolledPoses:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  if (v4 != 3)
  {
    v11 = v4;
    _BKUILoggingFacility();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    v16 = 134218240;
    v17 = v11;
    v18 = 2048;
    v19 = 3;
    v13 = "Error: Unexpected number of enrolled poses, there are %lu rows, expected %lu";
LABEL_11:
    _os_log_impl(&dword_1DB281000, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v16, 0x16u);
    goto LABEL_12;
  }
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 != 3)
  {
    _BKUILoggingFacility();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    v16 = 134218240;
    v17 = v6;
    v18 = 2048;
    v19 = 3;
    v13 = "Error: Unexpected number of enrolled poses, there are %lu cols, expected %lu";
    goto LABEL_11;
  }
  v7 = 0;
  while (1)
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9 != 3)
      break;
    if (++v7 == 3)
    {
      v10 = 1;
      goto LABEL_13;
    }
  }
  _BKUILoggingFacility();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 134218496;
    v17 = v7;
    v18 = 2048;
    v19 = objc_msgSend(v15, "count");
    v20 = 2048;
    v21 = 3;
    _os_log_impl(&dword_1DB281000, v12, OS_LOG_TYPE_DEFAULT, "Error: Unexpected number of enrolled poses, row %lu has %lu cols, expected %lu!", (uint8_t *)&v16, 0x20u);

  }
LABEL_12:

  v10 = 0;
LABEL_13:

  return v10;
}

- (void)enrollOperation:(id)a3 progressedWithInfo:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  BKUIFaceIDEnrollOperationsHandler *v9;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__BKUIFaceIDEnrollOperationsHandler_enrollOperation_progressedWithInfo___block_invoke;
  v7[3] = &unk_1EA27FC78;
  v8 = v5;
  v9 = self;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __72__BKUIFaceIDEnrollOperationsHandler_enrollOperation_progressedWithInfo___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  int v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint8_t v49[16];

  objc_msgSend(*(id *)(a1 + 32), "enrolledPoses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 40), "_validateEnrolledPoses:", v2))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "removeAllObjects");
    v3 = *(void **)(*(_QWORD *)(a1 + 40) + 72);
    objc_msgSend(v2, "objectAtIndexedSubscript:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndexedSubscript:", 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

    v6 = *(void **)(*(_QWORD *)(a1 + 40) + 72);
    objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v8);

    v9 = *(void **)(*(_QWORD *)(a1 + 40) + 72);
    objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v11);

    v12 = *(void **)(*(_QWORD *)(a1 + 40) + 72);
    objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v14);

    v15 = *(void **)(*(_QWORD *)(a1 + 40) + 72);
    objc_msgSend(v2, "objectAtIndexedSubscript:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v17);

    v18 = *(void **)(*(_QWORD *)(a1 + 40) + 72);
    objc_msgSend(v2, "objectAtIndexedSubscript:", 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v20);

    v21 = *(void **)(*(_QWORD *)(a1 + 40) + 72);
    objc_msgSend(v2, "objectAtIndexedSubscript:", 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectAtIndexedSubscript:", 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObject:", v23);

    v24 = *(void **)(*(_QWORD *)(a1 + 40) + 72);
    objc_msgSend(v2, "objectAtIndexedSubscript:", 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectAtIndexedSubscript:", 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObject:", v26);

    v27 = *(void **)(*(_QWORD *)(a1 + 40) + 72);
    objc_msgSend(v2, "objectAtIndexedSubscript:", 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectAtIndexedSubscript:", 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObject:", v29);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "objectAtIndexedSubscript:", 8);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v30, "integerValue");

    if (v31 != (void *)3)
    {
LABEL_21:
      objc_msgSend(*(id *)(a1 + 40), "operationsDelegate");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "getEnrollview");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "updateWithProgress:", *(_QWORD *)(a1 + 32));

      objc_msgSend(*(id *)(a1 + 40), "advanceEnrollmentState");
      goto LABEL_22;
    }
    objc_msgSend(*(id *)(a1 + 40), "operationsDelegate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "state");
    if (v33 != 3)
    {
      objc_msgSend(*(id *)(a1 + 40), "operationsDelegate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v31, "state") != 4)
        goto LABEL_7;
    }
    objc_msgSend(*(id *)(a1 + 40), "operationsDelegate");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v34, "previousState") != 5)
    {
      objc_msgSend(*(id *)(a1 + 40), "operationsDelegate");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "previousState");

      if (v33 != 3)
      if (v36 == 7)
        goto LABEL_21;
      if (objc_msgSend(*(id *)(a1 + 32), "percentageCompleted") != 100)
      {
        objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "bkui_IsInternalInstall");

        if (v38)
        {
          _BKUILoggingFacility();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v49 = 0;
            _os_log_impl(&dword_1DB281000, v39, OS_LOG_TYPE_DEFAULT, "enroll progress not complete on first pose ...", v49, 2u);
          }

          +[BKUIAlertController alertControllerWithTitle:message:preferredStyle:](BKUIAlertController, "alertControllerWithTitle:message:preferredStyle:", CFSTR("BioCapture Error"), CFSTR("(Internal) Center bin complete without enroll completion. Please run \"/usr/libexec/seputil --get TRBC > trbc.trace\" and attach the resulting file to a radar against Pearl ID // New Bugs."), 1);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CEA2E0], "actionWithTitle:style:handler:", CFSTR("OK"), 0, 0);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "addAction:", v41);

          objc_msgSend(*(id *)(a1 + 40), "operationsDelegate");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "presentViewController:animated:completion:", v40, 1, 0);

        }
      }
      objc_msgSend(*(id *)(a1 + 40), "operationsDelegate");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "clearPendingStateWorkItems");

      v44 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 128), "enrollmentType");
      objc_msgSend(*(id *)(a1 + 40), "operationsDelegate");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v45;
      if (v44 == 1)
        v46 = 5;
      else
        v46 = 7;
      objc_msgSend(v45, "setState:animated:", v46, 1);
      goto LABEL_20;
    }

    if (v33 != 3)
LABEL_7:

LABEL_20:
    goto LABEL_21;
  }
LABEL_22:

}

- (id)getAuthContextForCredentialError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  objc_class *LAContextClass;
  LAContext *v9;
  void *authContext;
  id v11;
  LAContext *v12;
  LAContext *v13;
  LAContext *v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  NSObject *v21;
  id v22;
  uint8_t buf[4];
  id v24;
  void *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  -[BKUIFaceIDEnrollOperationsHandler credential](self, "credential");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

LABEL_4:
    -[BKUIFaceIDEnrollOperationsHandler credential](self, "credential");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    LAContextClass = getLAContextClass();
    if (v7)
    {
      v9 = (LAContext *)objc_opt_new();
      authContext = self->_authContext;
      self->_authContext = v9;
    }
    else
    {
      v11 = [LAContextClass alloc];
      -[BKUIFaceIDEnrollOperationsHandler externalizedAuthContext](self, "externalizedAuthContext");
      authContext = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (LAContext *)objc_msgSend(v11, "initWithExternalizedContext:", authContext);
      v13 = self->_authContext;
      self->_authContext = v12;

    }
    -[LAContext setUiDelegate:](self->_authContext, "setUiDelegate:", self);
    v14 = self->_authContext;
    v25 = &unk_1EA298AC0;
    v26[0] = &unk_1EA298AD8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    v16 = (id)-[LAContext evaluatePolicy:options:error:](v14, "evaluatePolicy:options:error:", 1007, v15, &v22);
    v17 = v22;

    if (v17)
    {
      _BKUILoggingFacility();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v17;
        _os_log_impl(&dword_1DB281000, v18, OS_LOG_TYPE_DEFAULT, "BKUIPearl: Error evaluating policy: %@", buf, 0xCu);
      }

      v19 = 0;
      if (a3)
        *a3 = objc_retainAutorelease(v17);
    }
    else
    {
      -[LAContext externalizedContext](self->_authContext, "externalizedContext");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }

    return v19;
  }
  -[BKUIFaceIDEnrollOperationsHandler externalizedAuthContext](self, "externalizedAuthContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    goto LABEL_4;
  if (!self->_authContext)
    return 0;
  _BKUILoggingFacility();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB281000, v21, OS_LOG_TYPE_DEFAULT, "Using cached authentication context", buf, 2u);
  }

  -[LAContext externalizedContext](self->_authContext, "externalizedContext");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_startOperationWithError:(id *)a3
{
  return -[BKEnrollPearlOperation startWithError:](self->_enrollOperation, "startWithError:", a3);
}

- (BOOL)_completeOperationWithError:(id *)a3
{
  void *v4;

  -[BKUIFaceIDEnrollOperationsHandler enrollOperation](self, "enrollOperation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "completeWithError:", a3);

  return (char)a3;
}

- (void)event:(int64_t)a3 params:(id)a4 reply:(id)a5
{
  id v8;
  void *v9;
  int v10;
  LAContext *authContext;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  if (a3 == 2)
  {
    objc_msgSend(a4, "objectForKey:", &unk_1EA298AF0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");

    if (v10)
    {
      authContext = self->_authContext;
      -[BKUIFaceIDEnrollOperationsHandler credential](self, "credential");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dataUsingEncoding:", 4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __56__BKUIFaceIDEnrollOperationsHandler_event_params_reply___block_invoke;
      v14[3] = &unk_1EA280238;
      v15 = v8;
      -[LAContext setCredential:forProcessedEvent:credentialType:reply:](authContext, "setCredential:forProcessedEvent:credentialType:reply:", v13, 2, -1, v14);

    }
  }

}

uint64_t __56__BKUIFaceIDEnrollOperationsHandler_event_params_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)shouldShowRetryUI
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (-[BKUIFaceIDEnrollOperationsHandler glassesEnforcementError](self, "glassesEnforcementError"))
    return 1;
  -[BKUIFaceIDEnrollOperationsHandler matchOperation](self, "matchOperation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[BKUIFaceIDEnrollOperationsHandler matchOperation](self, "matchOperation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "matchedIdentity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v3 = 0;
    }
    else
    {
      -[BKUIFaceIDEnrollOperationsHandler matchOperation](self, "matchOperation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v7, "failReason") == 1;

    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)isEnrollmentAugmentationOnly
{
  return -[BKUIFaceIDEnrollOperationsHandler enrollmentConfiguration](self, "enrollmentConfiguration") == 3
      || -[BKUIFaceIDEnrollOperationsHandler enrollmentConfiguration](self, "enrollmentConfiguration") == 4;
}

- (BKUIPearlEnrollOperationsDelegate)operationsDelegate
{
  return (BKUIPearlEnrollOperationsDelegate *)objc_loadWeakRetained((id *)&self->_operationsDelegate);
}

- (void)retryPressed
{
  void *v3;
  id v4;

  if (-[BKUIFaceIDEnrollOperationsHandler glassesEnforcementError](self, "glassesEnforcementError"))
  {
    -[BKUIFaceIDEnrollOperationsHandler retryOperation](self, "retryOperation");
  }
  else
  {
    -[BKUIFaceIDEnrollOperationsHandler matchOperation](self, "matchOperation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "retryMatchOperation");

    -[BKUIFaceIDEnrollOperationsHandler operationsDelegate](self, "operationsDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSubstate:animated:afterDelay:", 0, 1, 0.0);

  }
}

- (id)getAuthContextForCredentialError:(id *)a3 authContext:(id *)a4
{
  void *v6;

  -[BKUIFaceIDEnrollOperationsHandler getAuthContextForCredentialError:](self, "getAuthContextForCredentialError:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *a4 = objc_retainAutorelease(self->_authContext);
  return v6;
}

- (int64_t)glassesRequirement
{
  if (-[BKUIFaceIDEnrollOperationsHandler enrollmentConfiguration](self, "enrollmentConfiguration") == 4)
    return 2;
  else
    return 1;
}

+ (id)handlersForEnrollmentConfiguration:(unint64_t)a3 inBuddy:(BOOL)a4 delegate:(id)a5 credential:(id)a6 externalizedAuthContext:(id)a7
{
  _BOOL8 v9;
  id v11;
  id v12;
  id v13;
  void *v14;
  BKUIFaceIDEnrollOperationsHandler *v15;
  BKUIFaceIDEnrollGlassesOperationsHandler *v16;
  uint64_t v17;
  id v18;
  BKUIFaceIDEnrollOperationsHandler *v19;
  BKUIFaceIDEnrollGlassesOperationsHandler *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  BKUIFaceIDEnrollOperationsHandler *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v9 = a4;
  v35 = *MEMORY[0x1E0C80C00];
  v11 = a5;
  v12 = a6;
  v13 = a7;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[BKUIFaceIDEnrollOperationsHandler initWithBKPearlEnrollmentType:]([BKUIFaceIDEnrollOperationsHandler alloc], "initWithBKPearlEnrollmentType:", 1);
  if (-[BKUIFaceIDEnrollOperationsHandler supportsPeriocularEnrollment](v15, "supportsPeriocularEnrollment"))
  {
    v28 = v15;
    objc_msgSend(v14, "addObject:", v15);
    switch(a3)
    {
      case 0uLL:
        v16 = [BKUIFaceIDEnrollOperationsHandler alloc];
        v17 = 2;
        goto LABEL_8;
      case 1uLL:
        goto LABEL_6;
      case 3uLL:
        objc_msgSend(v14, "removeAllObjects");
LABEL_6:
        v19 = -[BKUIFaceIDEnrollOperationsHandler initWithBKPearlEnrollmentType:]([BKUIFaceIDEnrollOperationsHandler alloc], "initWithBKPearlEnrollmentType:", 3);
        v20 = -[BKUIFaceIDEnrollOperationsHandler initWithBKPearlEnrollmentType:]([BKUIFaceIDEnrollGlassesOperationsHandler alloc], "initWithBKPearlEnrollmentType:", 3);
        objc_msgSend(v14, "addObject:", v19);
        objc_msgSend(v14, "addObject:", v20);

        goto LABEL_9;
      case 4uLL:
        objc_msgSend(v14, "removeAllObjects");
        v16 = [BKUIFaceIDEnrollGlassesOperationsHandler alloc];
        v17 = 3;
LABEL_8:
        v19 = -[BKUIFaceIDEnrollOperationsHandler initWithBKPearlEnrollmentType:](v16, "initWithBKPearlEnrollmentType:", v17);
        objc_msgSend(v14, "addObject:", v19);
LABEL_9:

        break;
      default:
        break;
    }
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v29 = v14;
    v21 = v14;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v31 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_msgSend(v26, "setOperationsDelegate:", v11);
          objc_msgSend(v26, "setInbuddy:", v9);
          objc_msgSend(v26, "setEnrollmentConfiguration:", a3);
          objc_msgSend(v26, "setCredential:", v12);
          objc_msgSend(v26, "setExternalizedAuthContext:", v13);
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v23);
    }

    v18 = v21;
    v15 = v28;
    v14 = v29;
  }
  else
  {
    +[BKUILegacyOperationsHandler handlersForEnrollmentConfiguration:inBuddy:delegate:credential:externalizedAuthContext:](BKUILegacyOperationsHandler, "handlersForEnrollmentConfiguration:inBuddy:delegate:credential:externalizedAuthContext:", a3, v9, v11, v12, v13);
    v18 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

- (id)bkIdentities
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  id v7;

  -[BKUIFaceIDEnrollOperationsHandler device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  objc_msgSend(v2, "identitiesWithError:", &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v7;

  if (v4)
  {
    _BKUILoggingFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[BKUIFaceIDEnrollOperationsHandler bkIdentities].cold.1(v4, v5);

  }
  return v3;
}

- (void)setOperationsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_operationsDelegate, a3);
}

- (NSString)credential
{
  return self->_credential;
}

- (void)setCredential:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)isSuspended
{
  return self->_suspend;
}

- (BOOL)inbuddy
{
  return self->_inbuddy;
}

- (void)setInbuddy:(BOOL)a3
{
  self->_inbuddy = a3;
}

- (NSMutableArray)poseStatus
{
  return self->_poseStatus;
}

- (void)setPoseStatus:(id)a3
{
  objc_storeStrong((id *)&self->_poseStatus, a3);
}

- (unint64_t)enrollmentConfiguration
{
  return self->_enrollmentConfiguration;
}

- (void)setEnrollmentConfiguration:(unint64_t)a3
{
  self->_enrollmentConfiguration = a3;
}

- (int64_t)enrollmentType
{
  return self->_enrollmentType;
}

- (void)setEnrollmentType:(int64_t)a3
{
  self->_enrollmentType = a3;
}

- (BKDevicePearl)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (BKIdentity)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_identity, a3);
}

- (NSData)externalizedAuthContext
{
  return self->_externalizedAuthContext;
}

- (void)setExternalizedAuthContext:(id)a3
{
  objc_storeStrong((id *)&self->_externalizedAuthContext, a3);
}

- (double)bioKitCompletionPercentage
{
  return self->_bioKitCompletionPercentage;
}

- (void)setBioKitCompletionPercentage:(double)a3
{
  self->_bioKitCompletionPercentage = a3;
}

- (BOOL)canStartEnrollmentOperation
{
  return self->_canStartEnrollmentOperation;
}

- (void)setCanStartEnrollmentOperation:(BOOL)a3
{
  self->_canStartEnrollmentOperation = a3;
}

- (BOOL)glassesFound
{
  return self->_glassesFound;
}

- (void)setGlassesFound:(BOOL)a3
{
  self->_glassesFound = a3;
}

- (BOOL)glassesEnforcementError
{
  return self->_glassesEnforcementError;
}

- (void)setGlassesEnforcementError:(BOOL)a3
{
  self->_glassesEnforcementError = a3;
}

- (BKEnrollPearlOperation)enrollOperation
{
  return self->_enrollOperation;
}

- (void)setEnrollOperation:(id)a3
{
  objc_storeStrong((id *)&self->_enrollOperation, a3);
}

- (BOOL)centerBinComplete
{
  return self->_centerBinComplete;
}

- (void)setCenterBinComplete:(BOOL)a3
{
  self->_centerBinComplete = a3;
}

- (BOOL)userSelectedUseAccessibilityEnrollment
{
  return self->_userSelectedUseAccessibilityEnrollment;
}

- (void)setUserSelectedUseAccessibilityEnrollment:(BOOL)a3
{
  self->_userSelectedUseAccessibilityEnrollment = a3;
}

- (BKUIMatchVerifyPearlOperation)matchOperation
{
  return self->_matchOperation;
}

- (void)setMatchOperation:(id)a3
{
  objc_storeStrong((id *)&self->_matchOperation, a3);
}

- (id)matchUserThenDoSingleEnrollmentCompletion
{
  return self->_matchUserThenDoSingleEnrollmentCompletion;
}

- (void)setMatchUserThenDoSingleEnrollmentCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (BOOL)supportsPeriocularEnrollment
{
  return self->_supportsPeriocularEnrollment;
}

- (void)setSupportsPeriocularEnrollment:(BOOL)a3
{
  self->_supportsPeriocularEnrollment = a3;
}

- (BKUIAnalyticsManager)analyticsManager
{
  return (BKUIAnalyticsManager *)objc_getProperty(self, a2, 152, 1);
}

- (void)setAnalyticsManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong(&self->_matchUserThenDoSingleEnrollmentCompletion, 0);
  objc_storeStrong((id *)&self->_matchOperation, 0);
  objc_storeStrong((id *)&self->_enrollOperation, 0);
  objc_storeStrong((id *)&self->_externalizedAuthContext, 0);
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_poseStatus, 0);
  objc_storeStrong((id *)&self->_credential, 0);
  objc_destroyWeak((id *)&self->_operationsDelegate);
  objc_storeStrong((id *)&self->_lastFaceFoundDate, 0);
  objc_storeStrong((id *)&self->_enrollStartStopQueue, 0);
  objc_storeStrong((id *)&self->_authContext, 0);
  objc_storeStrong((id *)&self->_sharingclient, 0);
}

void __114__BKUIFaceIDEnrollOperationsHandler_matchUserThenDoSingleEnrollmentWithExisitingEnrollmentConfigCompletionAction___block_invoke_4_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DB281000, a1, a3, "This device does not support periocular enrollment", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)matchUserForGlassesPhaseEnrollmentWithCompletionAction:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DB281000, a1, a3, "Mathc Operation preflight check failed:", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)_matchOperationPreflightCheck:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_3(&dword_1DB281000, a2, a3, "Failed to get BK device, early exiting with failing the enrollment: %@", (uint8_t *)&v3);
}

- (void)enrollOperation:finishedWithEnrollResult:.cold.1()
{
  __assert_rtn("-[BKUIFaceIDEnrollOperationsHandler enrollOperation:finishedWithEnrollResult:]", "BKUIFaceIDEnrollOperationsHandler.m", 724, "enrolledIdentity != nil");
}

void __70__BKUIFaceIDEnrollOperationsHandler_enrollOperation_failedWithReason___block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_1DB281000, a2, OS_LOG_TYPE_ERROR, "PearlEnroll: Failed to enroll, error = %d", (uint8_t *)v3, 8u);
  OUTLINED_FUNCTION_1();
}

- (void)bkIdentities
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_3(&dword_1DB281000, a2, v4, "unable to fetch number of identities error: %@", (uint8_t *)&v5);

}

@end
