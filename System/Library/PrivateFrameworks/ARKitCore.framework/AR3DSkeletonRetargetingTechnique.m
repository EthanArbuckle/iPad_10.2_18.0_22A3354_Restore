@implementation AR3DSkeletonRetargetingTechnique

- (AR3DSkeletonRetargetingTechnique)init
{
  AR3DSkeletonRetargetingTechnique *v2;
  dispatch_semaphore_t v3;
  OS_dispatch_semaphore *resultSemaphore;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AR3DSkeletonRetargetingTechnique;
  v2 = -[ARTechnique init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_semaphore_create(1);
    resultSemaphore = v2->_resultSemaphore;
    v2->_resultSemaphore = (OS_dispatch_semaphore *)v3;

  }
  return v2;
}

- (void)prepare:(BOOL)a3
{
  ABPKRetargeting *v4;
  ABPKRetargeting *abpkRetargeting;

  if (!self->_abpkRetargeting)
  {
    v4 = (ABPKRetargeting *)objc_alloc_init(MEMORY[0x1E0CF7888]);
    abpkRetargeting = self->_abpkRetargeting;
    self->_abpkRetargeting = v4;

  }
}

- (id)processData:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  AR3DSkeletonRetargetingTechnique *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _ARLogGeneral();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v29 = v7;
    v30 = 2048;
    v31 = self;
    _os_log_impl(&dword_1B3A68000, v5, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Process Data", buf, 0x16u);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v4;
    v9 = objc_alloc(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v8, "detectedSkeletons");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithCapacity:", objc_msgSend(v10, "count"));

    v12 = +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.bodytracking.multipleBodyAnchors"));
    objc_msgSend(v8, "timestamp");
    kdebug_trace();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(v8, "detectedSkeletons", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v24;
LABEL_6:
      v17 = 0;
      while (1)
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(v13);
        -[AR3DSkeletonRetargetingTechnique _retargetSkeleton:](self, "_retargetSkeleton:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v17));
        v18 = objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          v19 = (void *)v18;
          objc_msgSend(v11, "addObject:", v18);

          if (!v12)
            break;
        }
        if (v15 == ++v17)
        {
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          if (v15)
            goto LABEL_6;
          break;
        }
      }
    }

    objc_msgSend(v8, "timestamp");
    kdebug_trace();
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_resultSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    v20 = (void *)objc_opt_new();
    -[AR3DSkeletonRetargetingTechnique setLatestResults:](self, "setLatestResults:", v20);

    -[AR3DSkeletonRetargetingTechnique latestResults](self, "latestResults");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setRetargetedSkeletons:", v11);

    dispatch_semaphore_signal((dispatch_semaphore_t)self->_resultSemaphore);
  }
  return v4;
}

- (void)requestResultDataAtTimestamp:(double)a3 context:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  float v24;
  float v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_resultSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  -[AR3DSkeletonRetargetingTechnique latestResults](self, "latestResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "imageData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cameraIntrinsics");
    v32 = v10;
    v33 = v9;
    v31 = v11;
    -[AR3DSkeletonRetargetingTechnique latestResults](self, "latestResults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCameraIntrinsics:", v33, v32, v31);

    objc_msgSend(v6, "imageData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "imageResolution");
    v15 = v14;
    v17 = v16;
    -[AR3DSkeletonRetargetingTechnique latestResults](self, "latestResults");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setImageResolution:", v15, v17);

    -[AR3DSkeletonRetargetingTechnique latestResults](self, "latestResults");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "retargetedSkeletons");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "firstObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "resultDataOfClass:", objc_opt_class());
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "firstObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23 && (objc_msgSend(v23, "estimatedScaleFactor"), v24 > 0.0))
    {
      objc_msgSend(v23, "estimatedScaleFactor");
      objc_msgSend(v21, "setEstimatedScaleFactor:", v25);
      objc_msgSend(v23, "visionTransform");
      objc_msgSend(v21, "setVisionTransform:");
      -[ARTechnique delegate](self, "delegate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[AR3DSkeletonRetargetingTechnique latestResults](self, "latestResults");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = v27;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v26;
    }
    else
    {
      v26 = (void *)objc_opt_new();
      objc_msgSend(v26, "setTimestamp:", a3);
      objc_msgSend(v26, "setRetargetedSkeletons:", MEMORY[0x1E0C9AA60]);
      -[ARTechnique delegate](self, "delegate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v26;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v27;
    }
    objc_msgSend(v29, "technique:didOutputResultData:timestamp:context:", self, v28, v6, a3);

    -[AR3DSkeletonRetargetingTechnique setLatestResults:](self, "setLatestResults:", 0);
  }
  else
  {
    v21 = (void *)objc_opt_new();
    -[ARTechnique delegate](self, "delegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "technique:didOutputResultData:timestamp:context:", self, v30, v6, a3);

  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_resultSemaphore);

}

- (id)_retargetSkeleton:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint8_t *v12;
  uint64_t v13;
  unint64_t v14;
  uint8_t *v20;
  __int128 v21;
  NSObject *v22;
  objc_class *v23;
  void *v24;
  ARCoreRESkeletonResult *v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  void *v29;
  void *v30;
  ARCoreRESkeletonResult *v31;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  AR3DSkeletonRetargetingTechnique *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0CF7858]);
  v6 = objc_msgSend(v4, "joints");
  v7 = objc_msgSend(v4, "jointCount");
  objc_msgSend(v4, "skeletonDetectionResult2D");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initWithJoints:numberOfJoints:referenceDetectionResult:", v6, v7, v8);

  -[ABPKRetargeting processData:](self->_abpkRetargeting, "processData:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "jointTransformCount");
  MEMORY[0x1E0C80A78]();
  v12 = &buf[-16 * v11 - 16];
  if (objc_msgSend(v10, "jointTransformCount"))
  {
    v13 = 0;
    v14 = 0;
    __asm { FMOV            V0.4S, #1.0 }
    v33 = _Q0;
    do
    {
      v20 = &v12[v13];
      *(_OWORD *)&v12[v13 + 32] = *(_OWORD *)(objc_msgSend(v10, "localJointTransformsSRT", v33) + v13 + 32);
      v21 = *(_OWORD *)(objc_msgSend(v10, "localJointTransformsSRT") + v13 + 16);
      *(_OWORD *)v20 = v33;
      *((_OWORD *)v20 + 1) = v21;
      ++v14;
      v13 += 48;
    }
    while (v14 < objc_msgSend(v10, "jointTransformCount"));
  }
  _ARLogGeneral();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v35 = v24;
    v36 = 2048;
    v37 = self;
    _os_log_impl(&dword_1B3A68000, v22, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Creating result", buf, 0x16u);

  }
  v25 = [ARCoreRESkeletonResult alloc];
  v26 = objc_msgSend(v10, "jointModelTransforms");
  v27 = objc_msgSend(v10, "jointTransformCount");
  LODWORD(v28) = 981668463;
  objc_msgSend(v4, "createResultScaledByFactor:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[ARCoreRESkeletonResult initWithModelJointTransforms:localJointTransformsSRT:numberOfTransforms:liftedSkeletonData:identifier:](v25, "initWithModelJointTransforms:localJointTransformsSRT:numberOfTransforms:liftedSkeletonData:identifier:", v26, v12, v27, v29, v30);

  return v31;
}

+ (BOOL)producesResultDataForAnchorOfClass:(Class)a3
{
  return objc_opt_class() == (_QWORD)a3;
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "isMemberOfClass:", objc_opt_class());

  return v4;
}

- (ARCoreRESkeletonResults)latestResults
{
  return self->_latestResults;
}

- (void)setLatestResults:(id)a3
{
  objc_storeStrong((id *)&self->_latestResults, a3);
}

- (OS_dispatch_semaphore)resultSemaphore
{
  return self->_resultSemaphore;
}

- (void)setResultSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_resultSemaphore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultSemaphore, 0);
  objc_storeStrong((id *)&self->_latestResults, 0);
  objc_storeStrong((id *)&self->_abpkRetargeting, 0);
}

@end
