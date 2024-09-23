@implementation ABPKRetargeting

- (ABPKRetargeting)init
{
  NSObject *v3;
  ABPKRetargeting *v4;
  uint64_t v5;
  NSUUID *skeletonIdentifier;
  objc_super v8;
  uint8_t buf[16];

  __ABPKLogSharedInstance();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210836000, v3, OS_LOG_TYPE_DEBUG, " ABPKRetargeting: Initializing ", buf, 2u);
  }

  v8.receiver = self;
  v8.super_class = (Class)ABPKRetargeting;
  v4 = -[ABPKRetargeting init](&v8, sel_init);
  if (v4)
  {
    v5 = objc_opt_new();
    skeletonIdentifier = v4->_skeletonIdentifier;
    v4->_skeletonIdentifier = (NSUUID *)v5;

    v4->_coreIKSolver = (CoreIKSolver *)CoreIKCreateAltruisticSolverInstance();
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  MEMORY[0x212BCB7C0](self->_coreIKSolver, a2);
  v3.receiver = self;
  v3.super_class = (Class)ABPKRetargeting;
  -[ABPKRetargeting dealloc](&v3, sel_dealloc);
}

- (id)processData:(id)a3
{
  -[ABPKRetargeting _retargetSkeleton:](self, "_retargetSkeleton:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_retargetSkeleton:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t SourceBufferSize;
  uint64_t TargetBufferSize;
  uint64_t v8;
  __int128 *v9;
  uint64_t v15;
  __int128 v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  float32x4_t *v24;
  NSObject *v25;
  ABPKResultRetargeting *v26;
  NSObject *v27;
  int v28;
  unsigned int v29;
  float32x4_t *v30;
  float32x4_t *v31;
  float *v32;
  _OWORD *v33;
  __int32 v34;
  uint64_t v35;
  __int32 v36;
  int v37;
  float v38;
  float v39;
  float v40;
  float v41;
  __int128 v42;
  float v43;
  float v44;
  float32x4_t v45;
  float v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  float32x4_t v50;
  __int128 v51;
  __int128 v52;
  ABPKResultRetargeting *v53;
  double v54;
  _QWORD v56[2];
  __int128 v57;
  float32x4_t v58;
  __int128 v59;
  float32x4_t v60;
  __int128 v61;
  uint8_t buf[4];
  int v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  __ABPKLogSharedInstance();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210836000, v5, OS_LOG_TYPE_DEBUG, " ABPKRetargeting: Retargeting skeleton ", buf, 2u);
  }

  SourceBufferSize = CoreIKSolverGetSourceBufferSize();
  TargetBufferSize = CoreIKSolverGetTargetBufferSize();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  if (SourceBufferSize)
  {
    v8 = 0;
    v9 = (__int128 *)&v56[-4 * SourceBufferSize + 2];
    __asm { FMOV            V0.4S, #10.0 }
    v60 = _Q0;
    v61 = xmmword_210881530;
    do
    {
      v15 = objc_msgSend(v4, "joints");
      v16 = v61;
      *(v9 - 1) = (__int128)vdivq_f32(*(float32x4_t *)(v15 + 16 * v8), v60);
      *v9 = v16;
      ++v8;
      v9 += 2;
    }
    while (SourceBufferSize != v8);
  }
  __ABPKLogSharedInstance();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210836000, v17, OS_LOG_TYPE_DEBUG, " \t Run CoreIK solver ", buf, 2u);
  }

  v18 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  MEMORY[0x24BDAC7A8](v18);
  v19 = CoreIKSolveModelSpaceSource();
  v20 = v19;
  v21 = MEMORY[0x24BDAC7A8](v19);
  v22 = MEMORY[0x24BDAC7A8](v21);
  v24 = (float32x4_t *)&v56[-2 * v23];
  if (v22)
  {
    __ABPKLogSharedInstance();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v63 = v20;
      _os_log_impl(&dword_210836000, v25, OS_LOG_TYPE_ERROR, " Could not solve skeleton: %i ", buf, 8u);
    }
    v26 = 0;
  }
  else
  {
    __ABPKLogSharedInstance();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210836000, v27, OS_LOG_TYPE_DEBUG, " \t Create result type ", buf, 2u);
    }

    v56[1] = v56;
    if (TargetBufferSize)
    {
      v30 = v24 + 1;
      v31 = (float32x4_t *)&v56[-4 * TargetBufferSize + 2];
      v32 = (float *)&v56[-4 * TargetBufferSize + 3] + 1;
      v33 = &v56[-8 * TargetBufferSize + 4];
      v34 = 0;
      v57 = xmmword_210881540;
      v58 = (float32x4_t)vdupq_n_s32(0x3C23D70Au);
      v35 = TargetBufferSize;
      do
      {
        v36 = v34;
        v37 = v28;
        v38 = *(v32 - 3);
        v39 = *(v32 - 2);
        v40 = *(v32 - 1);
        v41 = *v32;
        *(float *)&v42 = (float)((float)((float)(v38 * v38) - (float)(v39 * v39)) - (float)(v40 * v40))
                       + (float)(v41 * v41);
        v43 = v40 * *v32;
        v44 = v39 * *v32;
        *((float *)&v42 + 1) = (float)(v43 + (float)(v38 * v39)) + (float)(v43 + (float)(v38 * v39));
        *((float *)&v42 + 2) = (float)-(float)(v44 - (float)(v38 * v40)) - (float)(v44 - (float)(v38 * v40));
        v45.f32[0] = (float)-(float)(v43 - (float)(v38 * v39)) - (float)(v43 - (float)(v38 * v39));
        v46 = v38 * *v32;
        v45.f32[1] = (float)((float)((float)(v39 * v39) - (float)(v40 * v40)) + (float)(v41 * v41)) - (float)(v38 * v38);
        v45.f32[2] = (float)(v46 + (float)(v39 * v40)) + (float)(v46 + (float)(v39 * v40));
        *(float *)&v47 = (float)(v44 + (float)(v40 * v38)) + (float)(v44 + (float)(v40 * v38));
        *((float *)&v47 + 1) = (float)-(float)(v46 - (float)(v39 * v40)) - (float)(v46 - (float)(v39 * v40));
        *((_QWORD *)&v47 + 1) = __PAIR64__(v29, (float)((float)((float)(v41 * v41) + (float)(v40 * v40)) - (float)(v38 * v38))- (float)(v39 * v39));
        HIDWORD(v42) = v37;
        v45.i32[3] = v36;
        v60 = v45;
        v61 = v42;
        v59 = v47;
        simdMatrix4x4FromRotationAndTranslation();
        *(v33 - 2) = v48;
        *(v33 - 1) = v49;
        v29 = HIDWORD(v59);
        v50 = vmulq_f32(v31[-1], v58);
        *v30 = *v31;
        v30[1] = v50;
        v30[-1] = (float32x4_t)v57;
        v30 += 3;
        *v33 = v51;
        v33[1] = v52;
        v33 += 4;
        v31 += 2;
        v32 += 8;
        --v35;
        v34 = v60.i32[3];
        v28 = HIDWORD(v61);
      }
      while (v35);
    }
    v53 = [ABPKResultRetargeting alloc];
    LODWORD(v54) = 981668463;
    objc_msgSend(v4, "createResultScaledByFactor:", v54);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = -[ABPKResultRetargeting initWithModelJointTransforms:localJointTransformsSRT:numberOfTransforms:liftedSkeletonData:identifier:](v53, "initWithModelJointTransforms:localJointTransformsSRT:numberOfTransforms:liftedSkeletonData:identifier:", &v56[-8 * TargetBufferSize], v24, TargetBufferSize, v25, self->_skeletonIdentifier);
  }

  return v26;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_skeletonIdentifier, 0);
}

@end
