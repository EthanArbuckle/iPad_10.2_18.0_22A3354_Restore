@implementation AR3DSkeletonLiftingTechnique

- (AR3DSkeletonLiftingTechnique)init
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  AR3DSkeletonLiftingTechnique *v7;
  objc_super v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  AR3DSkeletonLiftingTechnique *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  _ARLogGeneral();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v11 = v5;
    v12 = 2048;
    v13 = self;
    _os_log_impl(&dword_1B3A68000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Initializing", buf, 0x16u);

  }
  ARCreateFixedPriorityDispatchQueue("com.apple.arkit.humanpose3d");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)AR3DSkeletonLiftingTechnique;
  v7 = -[ARMLImageProcessingTechnique initWithDispatchQueue:networkInputScaleBeforeRotation:delegateInference:](&v9, sel_initWithDispatchQueue_networkInputScaleBeforeRotation_delegateInference_, v6, 1, 1.0, 32.0);

  return v7;
}

- (void)_prepareOnce:(BOOL)a3
{
  ABPK3DLiftingAlgorithm *v4;
  ABPK3DLiftingAlgorithm *liftingAlgorithm;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  AR3DSkeletonLiftingTechnique *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  CreateABPK3DLiftingAlgorithm();
  v4 = (ABPK3DLiftingAlgorithm *)objc_claimAutoreleasedReturnValue();
  liftingAlgorithm = self->_liftingAlgorithm;
  self->_liftingAlgorithm = v4;

  if (!self->_liftingAlgorithm)
  {
    _ARLogGeneral();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v13 = v8;
      v14 = 2048;
      v15 = self;
      _os_log_impl(&dword_1B3A68000, v6, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: ABPK3DLiftingAlgorithm could not be initialized!", buf, 0x16u);

    }
    if (ARSkipCrashOnCrash(void)::onceToken != -1)
      dispatch_once(&ARSkipCrashOnCrash(void)::onceToken, &__block_literal_global_39);
    if (!ARSkipCrashOnCrash(void)::skipCrashOnCrash)
    {
      v9 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ABPK3DLiftingAlgorithm could not be initialized!"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("ARCrash: %@"), v10);
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      qword_1EF081328 = (uint64_t)strdup((const char *)objc_msgSend(v11, "UTF8String"));

      abort();
    }
  }
}

- (unint64_t)requiredSensorDataTypes
{
  return 0;
}

- (double)requiredTimeInterval
{
  if (-[AR3DSkeletonLiftingTechnique requiredTimeInterval]::onceToken != -1)
    dispatch_once(&-[AR3DSkeletonLiftingTechnique requiredTimeInterval]::onceToken, &__block_literal_global_5);
  return *(double *)&-[AR3DSkeletonLiftingTechnique requiredTimeInterval]::sTimeInterval;
}

uint64_t __52__AR3DSkeletonLiftingTechnique_requiredTimeInterval__block_invoke()
{
  uint64_t result;
  double v1;

  result = ARIsANEVersionEqualOrPriorToH12();
  v1 = 0.008;
  if ((_DWORD)result)
    v1 = 0.015;
  -[AR3DSkeletonLiftingTechnique requiredTimeInterval]::sTimeInterval = *(_QWORD *)&v1;
  return result;
}

- (id)processEspressoTensor:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  ABPK3DLiftingAlgorithm *liftingAlgorithm;
  AR3DSkeletonDetectionResult *v15;
  void *v17;
  _BOOL4 v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  AR3DSkeletonDetectionResult *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  objc_class *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  AR3DSkeletonDetectionResult *v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  AR3DSkeletonLiftingTechnique *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _ARLogGeneral();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v44 = v7;
    v45 = 2048;
    v46 = self;
    _os_log_impl(&dword_1B3A68000, v5, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: ProcessEspressoTensor", buf, 0x16u);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v4;
    if (ARIsANEVersionEqualOrPriorToH12())
      objc_msgSend(v8, "trackedDetectionResult");
    else
      objc_msgSend(v8, "rawDetectionResult");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v9;
    if (!v9)
      goto LABEL_11;
    objc_msgSend(v9, "liftingData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "liftingData3D") == 0;

    if (v13
      || (objc_msgSend(v8, "timestamp"),
          -[AR3DSkeletonLiftingTechnique _startMLRunNetworkSignpostWithTimestamp:](self, "_startMLRunNetworkSignpostWithTimestamp:"), liftingAlgorithm = self->_liftingAlgorithm, objc_msgSend(v8, "timestamp"), LODWORD(liftingAlgorithm) = -[ABPK3DLiftingAlgorithm runLiftingModelWithData:atTimestamp:](liftingAlgorithm, "runLiftingModelWithData:atTimestamp:", v11), objc_msgSend(v8, "timestamp"), -[AR3DSkeletonLiftingTechnique _endMLRunNetworkSignpostWithTimestamp:](self, "_endMLRunNetworkSignpostWithTimestamp:"), (_DWORD)liftingAlgorithm))
    {
LABEL_11:
      v15 = 0;
      v10 = 0;
LABEL_12:

      goto LABEL_13;
    }
    if ((ARIsANEVersionEqualOrPriorToH12() & 1) == 0)
    {
      objc_msgSend(v8, "trackedDetectionResult");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17 == 0;

      if (v18)
      {
        _ARLogGeneral();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          v33 = (objc_class *)objc_opt_class();
          NSStringFromClass(v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v44 = v34;
          v45 = 2048;
          v46 = self;
          _os_log_impl(&dword_1B3A68000, v32, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: trackedDetectionResult is nil, bailing out", buf, 0x16u);

        }
        goto LABEL_11;
      }
      v41 = objc_alloc(MEMORY[0x1E0CF7838]);
      objc_msgSend(v8, "trackedDetectionResult");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v38, "rawJointsOutput");
      objc_msgSend(v8, "rawDetectionResult");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v37, "jointTrackingStates");
      objc_msgSend(v8, "rawDetectionResult");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v36, "jointCount");
      objc_msgSend(v8, "rawDetectionResult");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "imageResolution");
      v21 = v20;
      v23 = v22;
      objc_msgSend(v8, "rawDetectionResult");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "rotation");
      objc_msgSend(v8, "trackedDetectionResult");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "liftingData");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v41, "initWithJoints:trackingStates:numberOfJoints:imageResolution:rotation:croppedRect:liftingData:", v40, v39, v19, v25, v27, v21, v23, 0.0, 0.0, 1.0, 1.0);

      v11 = (void *)v28;
    }
    v29 = [AR3DSkeletonDetectionResult alloc];
    -[ABPK3DLiftingAlgorithm getLiftingResults](self->_liftingAlgorithm, "getLiftingResults");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[AR3DSkeletonDetectionResult initWithJoints:numberOfJoints:referenceDetectionResult:](v29, "initWithJoints:numberOfJoints:referenceDetectionResult:", objc_msgSend(v30, "joints"), 17, v11);

    v10 = (void *)objc_opt_new();
    if (v15)
    {
      v42 = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v31 = (void *)MEMORY[0x1E0C9AA60];
    }
    objc_msgSend(v10, "setDetectedSkeletons:", v31);
    if (v15)

    objc_msgSend(v8, "timestamp");
    objc_msgSend(v10, "setTimestamp:");
    goto LABEL_12;
  }
  v10 = 0;
LABEL_13:

  return v10;
}

- (void)_startLoadingMLModelSignpost
{
  kdebug_trace();
}

- (void)_endLoadingMLModelSignpost
{
  kdebug_trace();
}

- (void)_startMLProcessingSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_endMLProcessingSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_startMLRunNetworkSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_endMLRunNetworkSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_startMLCreateResultSignpostWithTimestamp:(double)a3 orientation:(int64_t)a4 outputSize:(CGSize)a5
{
  kdebug_trace();
}

- (void)_endMLCreateResultSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_liftingAlgorithm, 0);
}

@end
