@implementation ARSceneReconstructionHandler

- (ARSceneReconstructionHandler)initWithSceneReconstruction:(unint64_t)a3 options:(id)a4 slamSessionHandle:(CV3DSLAMSession *)a5
{
  id v9;
  ARSceneReconstructionHandler *v10;
  ARSceneReconstructionHandler *v11;
  objc_super v13;

  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ARSceneReconstructionHandler;
  v10 = -[ARSceneReconstructionHandler init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_sceneReconstruction = a3;
    objc_storeStrong((id *)&v10->_options, a4);
    v11->_slamSessionHandle = a5;
    CV3DSLAMSessionRetain();
    v11->_slamStateBufferBackLock._os_unfair_lock_opaque = 0;
    v11->_reconstructionSessionLock._os_unfair_lock_opaque = 0;
  }

  return v11;
}

- (void)bufferSlamState:(CV3DSLAMStateContext *)a3
{
  _QWORD *v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  __int128 v9;

  CV3DSLAMStateRetain();
  *(_QWORD *)&v9 = a3;
  v5 = (_QWORD *)operator new();
  *v5 = &off_1E6670618;
  v5[1] = 0;
  v5[2] = 0;
  v5[3] = a3;
  *((_QWORD *)&v9 + 1) = v5;
  os_unfair_lock_lock_with_options();
  std::vector<std::shared_ptr<CV3DSLAMStateContext const>>::push_back[abi:ne180100]((char **)&self->_slamStateBufferBack, &v9);
  os_unfair_lock_unlock(&self->_slamStateBufferBackLock);
  v6 = (std::__shared_weak_count *)*((_QWORD *)&v9 + 1);
  if (*((_QWORD *)&v9 + 1))
  {
    v7 = (unint64_t *)(*((_QWORD *)&v9 + 1) + 8);
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
}

- (void)swapSlamStateBuffers
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  uint64_t i;
  void *begin;
  __int128 v8;
  void *value;
  int v10;
  void *v11;
  __int16 v12;
  ARSceneReconstructionHandler *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_slamStateBufferFront.__begin_ != self->_slamStateBufferFront.__end_)
  {
    _ARLogTechnique();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = (objc_class *)objc_opt_class();
      NSStringFromClass(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v5;
      v12 = 2048;
      v13 = self;
      _os_log_impl(&dword_1B3A68000, v3, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unexpected non-empty slam state buffer; discarding...",
        (uint8_t *)&v10,
        0x16u);

    }
    begin = self->_slamStateBufferFront.__begin_;
    for (i = (uint64_t)self->_slamStateBufferFront.__end_;
          (void *)i != begin;
    self->_slamStateBufferFront.__end_ = begin;
  }
  os_unfair_lock_lock_with_options();
  v8 = *(_OWORD *)&self->_slamStateBufferFront.__begin_;
  *(_OWORD *)&self->_slamStateBufferFront.__begin_ = *(_OWORD *)&self->_slamStateBufferBack.__begin_;
  *(_OWORD *)&self->_slamStateBufferBack.__begin_ = v8;
  value = self->_slamStateBufferFront.__end_cap_.__value_;
  self->_slamStateBufferFront.__end_cap_.__value_ = self->_slamStateBufferBack.__end_cap_.__value_;
  self->_slamStateBufferBack.__end_cap_.__value_ = value;
  os_unfair_lock_unlock(&self->_slamStateBufferBackLock);
}

- (BOOL)_recreateReconstructionSessionWithError:(id *)a3
{
  unint64_t sceneReconstruction;
  uint64_t v6;
  void *v7;
  BOOL v8;
  float v9;
  float v10;
  float v11;
  uint64_t v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  __CFString *v16;
  void *v18;
  objc_class *v19;
  void *v20;
  char v21;
  uint64_t v22;
  char v23;
  NSObject *v24;
  objc_class *v25;
  uint64_t v26;
  _BOOL4 v27;
  uint64_t v28;
  CV3DReconSession *v29;
  unint64_t v30;
  void *v31;
  void *v32;
  _BOOL4 v33;
  const char *v34;
  void *v35;
  const char *v36;
  objc_class *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  NSObject *log;
  os_log_t loga;
  void *v46;
  void *v47;
  id v48[5];
  id v49;
  _QWORD v50[2];
  uint64_t (*v51)();
  void *v52;
  uint64_t v53;
  _QWORD v54[2];
  uint64_t (*v55)();
  void *v56;
  uint64_t v57;
  _QWORD v58[2];
  uint64_t (*v59)();
  void *v60;
  uint64_t v61;
  _QWORD v62[4];
  id v63;
  _QWORD v64[4];
  id v65;
  id location;
  _QWORD v67[2];
  uint64_t (*v68)();
  void *v69;
  uint64_t v70;
  _QWORD v71[2];
  uint64_t (*v72)();
  void *v73;
  uint64_t v74;
  void *v75;
  uint8_t buf[4];
  uint64_t v77;
  __int16 v78;
  ARSceneReconstructionHandler *v79;
  __int16 v80;
  void *v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->_reconstructionSessionLock);
  CV3DReconSessionRelease();
  self->_reconstructionSession = 0;
  v75 = 0;
  sceneReconstruction = self->_sceneReconstruction;
  if ((sceneReconstruction & 0x80) != 0)
  {
    v6 = CV3DReconSessionConfigurationCreateWithPrivatePreset();
    if ((sceneReconstruction & 1 | ((sceneReconstruction & 8) != 0)) == 1)
      -[ARSceneReconstructionHandler _recreateReconstructionSessionWithError:].cold.1();
  }
  else
  {
    v6 = CV3DReconSessionConfigurationCreateWithPrivatePreset();
  }
  v7 = (void *)MEMORY[0x1E0C809B0];
  v71[0] = MEMORY[0x1E0C809B0];
  v71[1] = 3221225472;
  v72 = __72__ARSceneReconstructionHandler__recreateReconstructionSessionWithError___block_invoke;
  v73 = &__block_descriptor_40_e5_v8__0l;
  v74 = v6;
  if ((~self->_sceneReconstruction & 0x11) != 0
    && (sceneReconstruction & 0x80) == 0
    && (self->_sceneReconstruction & 0x18) != 0x18
    || (CV3DReconSessionConfigurationAddPrivateMappingAttribute() & 1) != 0)
  {
    v67[0] = v7;
    v67[1] = 3221225472;
    v68 = __72__ARSceneReconstructionHandler__recreateReconstructionSessionWithError___block_invoke_2;
    v69 = &__block_descriptor_40_e5_v8__0l;
    v70 = CV3DReconSlamAdapterCreate();
    objc_initWeak(&location, self);
    v64[0] = v7;
    v64[1] = 3221225472;
    v64[2] = __72__ARSceneReconstructionHandler__recreateReconstructionSessionWithError___block_invoke_3;
    v64[3] = &unk_1E6675C98;
    objc_copyWeak(&v65, &location);
    v47 = (void *)MEMORY[0x1B5E2DF90](v64);
    v62[0] = v7;
    v62[1] = 3221225472;
    v62[2] = __72__ARSceneReconstructionHandler__recreateReconstructionSessionWithError___block_invoke_4;
    v62[3] = &unk_1E6675CC0;
    objc_copyWeak(&v63, &location);
    v46 = (void *)MEMORY[0x1B5E2DF90](v62);
    if ((CV3DReconSlamAdapterSetAnchoringCallbacks() & 1) != 0)
    {
      if (CV3DReconSessionConfigurationSetSlamAdapter())
      {
        if (CV3DReconSessionConfigurationAddMappingAttribute())
        {
          -[ARSceneReconstructionOptions lowQosSchedulingEnabled](self->_options, "lowQosSchedulingEnabled");
          if ((CV3DReconSessionConfigurationEnableLowQosScheduling() & 1) != 0)
          {
            -[ARSceneReconstructionOptions minDepthUncertaintyThreshold](self->_options, "minDepthUncertaintyThreshold");
            GetConfidenceFromUncertainty(v9);
            v11 = v10;
            if ((CV3DReconSessionConfigurationSetMinDepthConfidence() & 1) == 0)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error setting reconstruction session minimum depth confidence to %f"), v11);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              ARSetNSErrorByWrappingCFErrorWithFailureReasonMessage(a3, v75, v18);
              goto LABEL_32;
            }
            if ((sceneReconstruction & 1) == 0)
            {
LABEL_40:
              if ((sceneReconstruction & 0x80) == 0)
                goto LABEL_56;
              v22 = CV3DReconMeshingConfigurationCreateWithPrivatePreset();
              if (!v22)
              {
                ARSetNSErrorByWrappingCFErrorWithFailureReasonMessage(a3, v75, CFSTR("Error creating meshing configuration"));
                goto LABEL_28;
              }
              v54[0] = v7;
              v54[1] = 3221225472;
              v55 = __72__ARSceneReconstructionHandler__recreateReconstructionSessionWithError___block_invoke_28;
              v56 = &__block_descriptor_40_e5_v8__0l;
              v57 = v22;
              if (-[ARSceneReconstructionHandler _configureMeshingConfiguration:error:](self, "_configureMeshingConfiguration:error:", v22, a3))
              {
                if ((CV3DReconMeshingConfigurationAddPrivateMeshIntegrationAttribute() & 1) != 0)
                {
                  if ((CV3DReconSessionConfigurationSetMeshingConfiguration() & 1) != 0)
                  {
                    v23 = 1;
                    goto LABEL_55;
                  }
                  ARSetNSErrorByWrappingCFErrorWithFailureReasonMessage(a3, v75, CFSTR("Error setting meshing configuration"));
                }
                else
                {
                  _ARLogGeneral();
                  v24 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
                  {
                    v25 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v25);
                    v26 = objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543874;
                    v77 = v26;
                    v78 = 2048;
                    v79 = self;
                    v80 = 2112;
                    v81 = v75;
                    loga = (os_log_t)v26;
                    _os_log_impl(&dword_1B3A68000, v24, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error adding color to reconstruction session meshing configuration: %@", buf, 0x20u);

                  }
                }
              }
              v23 = 0;
LABEL_55:
              ((void (*)(_QWORD *))v55)(v54);
              if ((v23 & 1) == 0)
                goto LABEL_28;
LABEL_56:
              if ((CV3DReconSessionConfigurationEnableSynchronousScheduling() & 1) == 0)
              {
                ARSetNSErrorByWrappingCFErrorWithFailureReasonMessage(a3, v75, CFSTR("Error setting scheduling mode in reconstruction session configuration"));
                goto LABEL_28;
              }
              -[ARSceneReconstructionOptions deterministicMode](self->_options, "deterministicMode");
              if ((CV3DReconSessionConfigurationEnableDeterministicBehavior() & 1) != 0)
              {
                v27 = +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.sceneReconstruction.waitTillVIOIsStable"));
                if ((CV3DReconSessionConfigurationEnableConsumeVIOMetadata() & 1) != 0)
                {
                  v28 = CV3DReconSessionCreateWithConfiguration();
                  v29 = (CV3DReconSession *)v28;
                  if (v28)
                  {
                    v50[0] = v7;
                    v50[1] = 3221225472;
                    v51 = __72__ARSceneReconstructionHandler__recreateReconstructionSessionWithError___block_invoke_40;
                    v52 = &__block_descriptor_40_e5_v8__0l;
                    v53 = v28;
                    if ((sceneReconstruction & 0x81) != 0 && CV3DReconSessionHasMeshingCapability())
                    {
                      v48[1] = v7;
                      v48[2] = (id)3221225472;
                      v48[3] = __72__ARSceneReconstructionHandler__recreateReconstructionSessionWithError___block_invoke_2_41;
                      v48[4] = &unk_1E6675CE8;
                      objc_copyWeak(&v49, &location);
                      if ((CV3DReconSessionAddOnMeshListUpdateCallback() & 1) == 0)
                      {
                        ARSetNSErrorByWrappingCFErrorWithFailureReasonMessage(a3, v75, CFSTR("Error setting meshing list update callback"));
                        objc_destroyWeak(&v49);
                        goto LABEL_91;
                      }
                      objc_destroyWeak(&v49);
                    }
                    if ((sceneReconstruction & 8) != 0 && CV3DReconSessionHasKeyframingCapability())
                    {
                      objc_copyWeak(v48, &location);
                      if ((CV3DReconSessionAddOnKeyframeListUpdateCallback() & 1) == 0)
                      {
                        ARSetNSErrorByWrappingCFErrorWithFailureReasonMessage(a3, v75, CFSTR("Error setting keyframe list update callback"));
                        objc_destroyWeak(v48);
                        goto LABEL_91;
                      }
                      objc_destroyWeak(v48);
                    }
                    if (-[ARSceneReconstructionHandler _reconfigureSession:error:](self, "_reconfigureSession:error:", v29, a3))
                    {
                      if ((sceneReconstruction & 0x80) != 0 && (CV3DReconSessionEnablePerFrameMeshColor() & 1) == 0)
                      {
                        v39 = v75;
                        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error enabling per-frame mesh color"));
                        v40 = (void *)objc_claimAutoreleasedReturnValue();
                        ARSetNSErrorByWrappingCFErrorWithFailureReasonMessage(a3, v39, v40);

                      }
                      else
                      {
                        if ((sceneReconstruction & 1) == 0
                          || (v30 = self->_sceneReconstruction & 0x11,
                              (CV3DReconSessionEnablePerFrameMeshColor() & 1) != 0))
                        {
                          CV3DReconSessionRetain();
                          self->_reconstructionSession = v29;
                          v8 = 1;
LABEL_92:
                          ((void (*)(_QWORD *))v51)(v50);
                          goto LABEL_29;
                        }
                        v41 = v75;
                        v42 = CFSTR("disabling");
                        if (v30 == 17)
                          v42 = CFSTR("enabling");
                        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error %@ per-frame mesh color"), v42);
                        v43 = (void *)objc_claimAutoreleasedReturnValue();
                        ARSetNSErrorByWrappingCFErrorWithFailureReasonMessage(a3, v41, v43);

                      }
                    }
LABEL_91:
                    v8 = 0;
                    goto LABEL_92;
                  }
                  ARSetNSErrorByWrappingCFErrorWithFailureReasonMessage(a3, v75, CFSTR("Error creating reconstruction session"));
LABEL_28:
                  v8 = 0;
LABEL_29:

                  objc_destroyWeak(&v63);
                  objc_destroyWeak(&v65);
                  objc_destroyWeak(&location);
                  ((void (*)(_QWORD *))v68)(v67);
                  goto LABEL_30;
                }
                v35 = v75;
                v36 = "disabling";
                if (v27)
                  v36 = "enabling";
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error %s consume VIO metadata in reconstruction session configuration"), v36);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                ARSetNSErrorByWrappingCFErrorWithFailureReasonMessage(a3, v35, v18);
              }
              else
              {
                v31 = v75;
                v32 = (void *)MEMORY[0x1E0CB3940];
                v33 = -[ARSceneReconstructionOptions deterministicMode](self->_options, "deterministicMode");
                v34 = "disabling";
                if (v33)
                  v34 = "enabling";
                objc_msgSend(v32, "stringWithFormat:", CFSTR("Error %s deterministic mode in reconstruction session configuration"), v34);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                ARSetNSErrorByWrappingCFErrorWithFailureReasonMessage(a3, v31, v18);
              }
LABEL_32:

              goto LABEL_28;
            }
            v12 = CV3DReconMeshingConfigurationCreateWithPrivatePreset();
            if (!v12)
            {
              ARSetNSErrorByWrappingCFErrorWithFailureReasonMessage(a3, v75, CFSTR("Error creating meshing configuration"));
              goto LABEL_28;
            }
            v58[0] = v7;
            v58[1] = 3221225472;
            v59 = __72__ARSceneReconstructionHandler__recreateReconstructionSessionWithError___block_invoke_5;
            v60 = &__block_descriptor_40_e5_v8__0l;
            v61 = v12;
            if (!-[ARSceneReconstructionHandler _configureMeshingConfiguration:error:](self, "_configureMeshingConfiguration:error:", v12, a3))goto LABEL_38;
            if ((CV3DReconMeshingConfigurationAddMeshIntegrationAttribute() & 1) != 0)
            {
              if ((~self->_sceneReconstruction & 0x11) != 0)
              {
                if ((CV3DReconMeshingConfigurationRemoveMeshIntegrationAttribute() & 1) == 0)
                {
                  _ARLogGeneral();
                  v13 = objc_claimAutoreleasedReturnValue();
                  if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
                    goto LABEL_37;
                  log = v13;
                  v37 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v37);
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  v77 = (uint64_t)v38;
                  v78 = 2048;
                  v79 = self;
                  v80 = 2112;
                  v81 = v75;
                  _os_log_impl(&dword_1B3A68000, log, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error removing color to reconstruction session meshing configuration: %@", buf, 0x20u);

                  goto LABEL_36;
                }
              }
              else if ((CV3DReconMeshingConfigurationAddPrivateMeshIntegrationAttribute() & 1) == 0)
              {
                _ARLogGeneral();
                v13 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
                {
                  log = v13;
                  v14 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v14);
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  v77 = (uint64_t)v15;
                  v78 = 2048;
                  v79 = self;
                  v80 = 2112;
                  v81 = v75;
                  _os_log_impl(&dword_1B3A68000, log, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error adding color to reconstruction session meshing configuration: %@", buf, 0x20u);

LABEL_36:
                  v13 = log;
                  goto LABEL_37;
                }
                goto LABEL_37;
              }
              if ((CV3DReconSessionConfigurationSetMeshingConfiguration() & 1) != 0)
              {
                v21 = 1;
LABEL_39:
                ((void (*)(_QWORD *))v59)(v58);
                if ((v21 & 1) == 0)
                  goto LABEL_28;
                goto LABEL_40;
              }
              ARSetNSErrorByWrappingCFErrorWithFailureReasonMessage(a3, v75, CFSTR("Error setting meshing configuration"));
LABEL_38:
              v21 = 0;
              goto LABEL_39;
            }
            _ARLogGeneral();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              log = v13;
              v19 = (objc_class *)objc_opt_class();
              NSStringFromClass(v19);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v77 = (uint64_t)v20;
              v78 = 2048;
              v79 = self;
              v80 = 2112;
              v81 = v75;
              _os_log_impl(&dword_1B3A68000, log, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error adding semantics to reconstruction session meshing configuration: %@", buf, 0x20u);

              goto LABEL_36;
            }
LABEL_37:

            goto LABEL_38;
          }
          v16 = CFSTR("Error setting reconstruction session QoS scheduling mode");
        }
        else
        {
          v16 = CFSTR("Error adding reconstruction session configuration mapping attribute: semantic");
        }
      }
      else
      {
        v16 = CFSTR("Error setting reconstruction session configuration slam adapter");
      }
    }
    else
    {
      v16 = CFSTR("Error setting reconstruction session configuration slam adapter callbacks");
    }
    ARSetNSErrorByWrappingCFErrorWithFailureReasonMessage(a3, v75, v16);
    goto LABEL_28;
  }
  ARSetNSErrorByWrappingCFErrorWithFailureReasonMessage(a3, v75, CFSTR("Error enabling color attribute"));
  v8 = 0;
LABEL_30:
  ((void (*)(_QWORD *))v72)(v71);
  return v8;
}

uint64_t __72__ARSceneReconstructionHandler__recreateReconstructionSessionWithError___block_invoke()
{
  return CV3DReconSessionConfigurationRelease();
}

uint64_t __72__ARSceneReconstructionHandler__recreateReconstructionSessionWithError___block_invoke_2()
{
  return CV3DReconSlamAdapterRelease();
}

void __72__ARSceneReconstructionHandler__recreateReconstructionSessionWithError___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && (CV3DSLAMSessionAddAnchor() & 1) == 0)
    objc_msgSend(WeakRetained, "handleCFError:withErrorMessage:", 0, CFSTR("Error adding anchor"));

}

void __72__ARSceneReconstructionHandler__recreateReconstructionSessionWithError___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && (CV3DSLAMSessionRemoveAnchor() & 1) == 0)
    objc_msgSend(WeakRetained, "handleCFError:withErrorMessage:", 0, CFSTR("Error removing anchor"));

}

uint64_t __72__ARSceneReconstructionHandler__recreateReconstructionSessionWithError___block_invoke_5()
{
  return CV3DReconMeshingConfigurationRelease();
}

uint64_t __72__ARSceneReconstructionHandler__recreateReconstructionSessionWithError___block_invoke_28()
{
  return CV3DReconMeshingConfigurationRelease();
}

uint64_t __72__ARSceneReconstructionHandler__recreateReconstructionSessionWithError___block_invoke_40()
{
  return CV3DReconSessionRelease();
}

void __72__ARSceneReconstructionHandler__recreateReconstructionSessionWithError___block_invoke_2_41(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_didReceiveMeshListUpdateCallbackWithMeshList:timestamp:error:", a2, a3, a4);

}

void __72__ARSceneReconstructionHandler__recreateReconstructionSessionWithError___block_invoke_3_45(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_didReceiveKeyframeListUpdateCallbackWithKeyframeList:timestamp:error:", a2, a3, a4);

}

- (void)_setupSLAMStateBuffering
{
  unint64_t v3;
  id v4;
  uint64_t v5;
  id location;

  if (!self->_slamStateCbID.__engaged_)
  {
    objc_initWeak(&location, self);
    v5 = 0;
    objc_copyWeak(&v4, &location);
    v3 = CV3DSLAMSessionRegisterNewStateBlock();
    if (v3)
    {
      self->_slamStateCbID.var0.__val_ = v3;
      self->_slamStateCbID.__engaged_ = 1;
    }
    else
    {
      -[ARSceneReconstructionHandler handleCFError:withErrorMessage:](self, "handleCFError:withErrorMessage:", v5, CFSTR("Error setting slam state callback"));
    }
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
}

void __56__ARSceneReconstructionHandler__setupSLAMStateBuffering__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "bufferSlamState:", a2);

}

- (BOOL)_canReconfigureExistingSessionForSceneReconstruction:(unint64_t)a3 options:(id)a4
{
  id v6;
  BOOL v7;

  v6 = a4;
  os_unfair_lock_assert_owner(&self->_reconstructionSessionLock);
  v7 = self->_reconstructionSession
    && -[ARSceneReconstructionOptions isEqual:](self->_options, "isEqual:", v6)
    && (self->_sceneReconstruction ^ a3) == 2;

  return v7;
}

- (BOOL)_reconfigureSession:(CV3DReconSession *)a3 error:(id *)a4
{
  unint64_t v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;

  os_unfair_lock_assert_owner(&self->_reconstructionSessionLock);
  if ((self->_sceneReconstruction & 1) == 0)
    return 1;
  v7 = self->_sceneReconstruction & 3;
  if ((CV3DReconSessionEnablePerFrameMeshSemantics() & 1) != 0)
  {
    if ((CV3DReconSessionEnablePerFrameMeshColor() & 1) != 0)
      return 1;
    v8 = CFSTR("disabling");
    if (v7 == 3)
      v8 = CFSTR("enabling");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error %@ per-frame mesh color"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ARSetNSErrorByWrappingCFErrorWithFailureReasonMessage(a4, 0, v9);
  }
  else
  {
    v10 = CFSTR("disabling");
    if (v7 == 3)
      v10 = CFSTR("enabling");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error %@ per-frame mesh semantics"), v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ARSetNSErrorByWrappingCFErrorWithFailureReasonMessage(a4, 0, v9);
  }

  return 0;
}

- (BOOL)_configureMeshingConfiguration:(CV3DReconMeshingConfiguration *)a3 error:(id *)a4
{
  __CFString *v6;

  os_unfair_lock_assert_owner(&self->_reconstructionSessionLock);
  ARVoxelSizeForSceneReconstructionOptions(self->_options);
  if ((CV3DReconMeshingConfigurationSetVoxelSize() & 1) != 0)
  {
    ARBucketsOrderOfMagnitudeForSceneReconstructionOptions(self->_options);
    if ((CV3DReconMeshingConfigurationSetBucketsOrderOfMagnitude() & 1) != 0)
    {
      if (ARDeviceIsiPad() && (CV3DReconMeshingConfigurationSetMinMeshingPeriod() & 1) == 0)
      {
        v6 = CFSTR("Error setting meshing configuration minimum meshing period on iPad");
      }
      else
      {
        -[ARSceneReconstructionOptions enableOccupancyMapping](self->_options, "enableOccupancyMapping");
        if ((CV3DReconMeshingConfigurationEnableOccupancyMapping() & 1) != 0)
        {
          self->_occupancyMappingEnabled = CV3DReconMeshingConfigurationHasOccupancyMapping();
          return 1;
        }
        v6 = CFSTR("Error enabling occupancy mapping");
      }
    }
    else
    {
      v6 = CFSTR("Error setting meshing configuration buckets order of magnitude");
    }
  }
  else
  {
    v6 = CFSTR("Error setting meshing configuration voxel size");
  }
  ARSetNSErrorByWrappingCFErrorWithFailureReasonMessage(a4, 0, v6);
  return 0;
}

- (void)_didReceiveMeshListUpdateCallbackWithMeshList:(CV3DReconMeshList *)a3 timestamp:(double)a4 error:(__CFError *)a5
{
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  ARSceneReconstructionHandler *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a5)
  {
    _ARLogTechnique();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFError localizedFailureReason](a5, "localizedFailureReason");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543874;
      v16 = v11;
      v17 = 2048;
      v18 = self;
      v19 = 2112;
      v20 = v12;
      _os_log_impl(&dword_1B3A68000, v9, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error received in mesh list update callback: %@", (uint8_t *)&v15, 0x20u);

    }
    kdebug_trace();
    CV3DReconMeshListRelease();
  }
  else
  {
    CV3DReconMeshListGetCount();
    kdebug_trace();
    -[ARSceneReconstructionHandler delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[ARSceneReconstructionHandler delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "sceneReconstructionHandler:didOutputMeshList:withTimestamp:", self, a3, a4);

    }
    else
    {
      CV3DReconMeshListRelease();
    }
  }

}

- (void)_didReceiveKeyframeListUpdateCallbackWithKeyframeList:(CV3DReconKeyframeList *)a3 timestamp:(double)a4 error:(__CFError *)a5
{
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  ARSceneReconstructionHandler *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a5)
  {
    _ARLogTechnique();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFError localizedFailureReason](a5, "localizedFailureReason");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543874;
      v16 = v10;
      v17 = 2048;
      v18 = self;
      v19 = 2112;
      v20 = v11;
      _os_log_impl(&dword_1B3A68000, v8, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error received in keyframe list update callback: %@", (uint8_t *)&v15, 0x20u);

    }
  }
  else
  {
    -[ARSceneReconstructionHandler delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[ARSceneReconstructionHandler delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "sceneReconstructionHandler:didOutputKeyframeList:withTimestamp:", self, a3, a4);

      goto LABEL_8;
    }
  }
  CV3DReconKeyframeListRelease();
LABEL_8:

}

- (void)start
{
  os_unfair_lock_s *p_reconstructionSessionLock;
  BOOL v4;
  id v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _BYTE buf[12];
  __int16 v19;
  ARSceneReconstructionHandler *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  p_reconstructionSessionLock = &self->_reconstructionSessionLock;
  os_unfair_lock_lock(&self->_reconstructionSessionLock);
  if (!self->_reconstructionSession)
  {
    -[ARSceneReconstructionHandler _setupSLAMStateBuffering](self, "_setupSLAMStateBuffering");
    v17 = 0;
    v4 = -[ARSceneReconstructionHandler _recreateReconstructionSessionWithError:](self, "_recreateReconstructionSessionWithError:", &v17);
    v5 = v17;
    v6 = v5;
    if (!v4)
    {
      os_unfair_lock_unlock(p_reconstructionSessionLock);
      _ARLogGeneral();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = (objc_class *)objc_opt_class();
        NSStringFromClass(v8);
        v9 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "localizedFailureReason");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "underlyingErrors");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "firstObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "localizedFailureReason");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        *(_QWORD *)&buf[4] = v9;
        v19 = 2048;
        v20 = self;
        v21 = 2112;
        v22 = v10;
        v23 = 2112;
        v24 = v13;
        _os_log_impl(&dword_1B3A68000, v7, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@: %@", buf, 0x2Au);

      }
      -[ARSceneReconstructionHandler delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "underlyingErrors");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "sceneReconstructionHandler:didFailWithError:", self, v16);

      return;
    }

    if (!self->_reconstructionSession)
      goto LABEL_7;
  }
  if (self->_sessionActivated)
  {
LABEL_7:
    os_unfair_lock_unlock(p_reconstructionSessionLock);
    return;
  }
  *(_QWORD *)buf = 0;
  if (CV3DReconSessionEnable())
  {
    self->_sessionActivated = 1;
    goto LABEL_7;
  }
  os_unfair_lock_unlock(p_reconstructionSessionLock);
  -[ARSceneReconstructionHandler handleCFError:withErrorMessage:](self, "handleCFError:withErrorMessage:", *(_QWORD *)buf, CFSTR("Error enabling reconstruction session"));
}

- (void)reconfigureSceneReconstruction:(unint64_t)a3 options:(id)a4
{
  id v7;
  _BOOL4 v8;
  CV3DReconSession *reconstructionSession;
  BOOL v10;
  id v11;
  NSObject *v12;
  objc_class *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  NSObject *v23;
  objc_class *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  _BYTE buf[12];
  __int16 v36;
  ARSceneReconstructionHandler *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (self->_sceneReconstruction == a3 && -[ARSceneReconstructionOptions isEqual:](self->_options, "isEqual:", v7))
    goto LABEL_18;
  os_unfair_lock_lock(&self->_reconstructionSessionLock);
  v8 = -[ARSceneReconstructionHandler _canReconfigureExistingSessionForSceneReconstruction:options:](self, "_canReconfigureExistingSessionForSceneReconstruction:options:", a3, v7);
  self->_sceneReconstruction = a3;
  objc_storeStrong((id *)&self->_options, a4);
  if (v8)
  {
    reconstructionSession = self->_reconstructionSession;
    v34 = 0;
    v10 = -[ARSceneReconstructionHandler _reconfigureSession:error:](self, "_reconfigureSession:error:", reconstructionSession, &v34);
    v11 = v34;
    if (!v10)
    {
      os_unfair_lock_unlock(&self->_reconstructionSessionLock);
      _ARLogGeneral();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "localizedFailureReason");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "underlyingErrors");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "firstObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "localizedFailureReason");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        *(_QWORD *)&buf[4] = v14;
        v36 = 2048;
        v37 = self;
        v38 = 2112;
        v39 = v15;
        v40 = 2112;
        v41 = v18;
        _os_log_impl(&dword_1B3A68000, v12, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@: %@", buf, 0x2Au);

      }
      -[ARSceneReconstructionHandler delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "underlyingErrors");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "firstObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "sceneReconstructionHandler:didFailWithError:", self, v21);

      goto LABEL_18;
    }
LABEL_12:
    os_unfair_lock_unlock(&self->_reconstructionSessionLock);

    goto LABEL_18;
  }
  if (self->_sessionActivated)
  {
    *(_QWORD *)buf = 0;
    if ((CV3DReconSessionDisable() & 1) == 0)
    {
      os_unfair_lock_unlock(&self->_reconstructionSessionLock);
      -[ARSceneReconstructionHandler handleCFError:withErrorMessage:](self, "handleCFError:withErrorMessage:", *(_QWORD *)buf, CFSTR("Error disabling reconstruction session"));
      goto LABEL_18;
    }
    self->_sessionActivated = 0;
    if ((CV3DReconSessionWait() & 1) == 0)
    {
      os_unfair_lock_unlock(&self->_reconstructionSessionLock);
      -[ARSceneReconstructionHandler handleCFError:withErrorMessage:failSession:](self, "handleCFError:withErrorMessage:failSession:", *(_QWORD *)buf, CFSTR("Error waiting on reconstruction session"), 0);
      goto LABEL_18;
    }
  }
  v33 = 0;
  v22 = -[ARSceneReconstructionHandler _recreateReconstructionSessionWithError:](self, "_recreateReconstructionSessionWithError:", &v33);
  v11 = v33;
  if (v22)
    goto LABEL_12;
  os_unfair_lock_unlock(&self->_reconstructionSessionLock);
  _ARLogGeneral();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedFailureReason");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "underlyingErrors");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "firstObject");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "localizedFailureReason");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    *(_QWORD *)&buf[4] = v25;
    v36 = 2048;
    v37 = self;
    v38 = 2112;
    v39 = v26;
    v40 = 2112;
    v41 = v29;
    _os_log_impl(&dword_1B3A68000, v23, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@: %@", buf, 0x2Au);

  }
  -[ARSceneReconstructionHandler delegate](self, "delegate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "underlyingErrors");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "firstObject");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "sceneReconstructionHandler:didFailWithError:", self, v32);

LABEL_18:
}

- (void)pause
{
  os_unfair_lock_s *p_reconstructionSessionLock;
  char v4;

  if (self->_sessionActivated)
  {
    p_reconstructionSessionLock = &self->_reconstructionSessionLock;
    os_unfair_lock_lock(&self->_reconstructionSessionLock);
    v4 = CV3DReconSessionDisable();
    os_unfair_lock_unlock(p_reconstructionSessionLock);
    if ((v4 & 1) != 0)
      self->_sessionActivated = 0;
    else
      -[ARSceneReconstructionHandler handleCFError:withErrorMessage:](self, "handleCFError:withErrorMessage:", 0, CFSTR("Error disabling reconstruction session"));
  }
}

- (void)reset
{
  os_unfair_lock_s *p_reconstructionSessionLock;
  char v4;

  p_reconstructionSessionLock = &self->_reconstructionSessionLock;
  os_unfair_lock_lock(&self->_reconstructionSessionLock);
  kdebug_trace();
  v4 = CV3DReconSessionReset();
  kdebug_trace();
  os_unfair_lock_unlock(p_reconstructionSessionLock);
  if ((v4 & 1) == 0)
    -[ARSceneReconstructionHandler handleCFError:withErrorMessage:](self, "handleCFError:withErrorMessage:", 0, CFSTR("Error resetting reconstruction session"));
}

- (void)meshPlaneHarmonizationShouldEnable:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_reconstructionSessionLock;
  char v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  const char *v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  ARSceneReconstructionHandler *v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  p_reconstructionSessionLock = &self->_reconstructionSessionLock;
  os_unfair_lock_lock(&self->_reconstructionSessionLock);
  v6 = CV3DReconSessionEnableMeshPlaneHarmony();
  os_unfair_lock_unlock(p_reconstructionSessionLock);
  if ((v6 & 1) != 0)
  {
    _ARLogTechnique();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = "disabled";
      *(_DWORD *)buf = 138543874;
      v12 = v9;
      if (v3)
        v10 = "enabled";
      v13 = 2048;
      v14 = self;
      v15 = 2080;
      v16 = v10;
      _os_log_impl(&dword_1B3A68000, v7, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Scene reconstruction plane harmonization is %s", buf, 0x20u);

    }
  }
  else
  {
    -[ARSceneReconstructionHandler handleCFError:withErrorMessage:failSession:](self, "handleCFError:withErrorMessage:failSession:", 0, CFSTR("Error updating plane harmonization"), 0);
  }
}

- (void)pushDepth:(id)a3 semanticSegmentation:(id)a4 personSegmentation:(id)a5 pose:(id)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  float v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  __int128 v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  _QWORD *end;
  _QWORD *begin;
  uint64_t v33;
  char v34;
  uint64_t i;
  NSObject *v36;
  objc_class *v37;
  id v38;
  void *v39;
  objc_class *v40;
  void *v41;
  objc_class *v42;
  void *v43;
  unint64_t sceneReconstruction;
  void *v45;
  char v46;
  const __CFString *v47;
  void *v48;
  char v49;
  __int128 v50;
  double v51;
  double v52;
  float v53;
  id v54;
  id v55;
  id v56;
  _QWORD v57[2];
  void (*v58)(uint64_t);
  void *v59;
  __CVBuffer *v60;
  _QWORD v61[2];
  uint64_t (*v62)();
  void *v63;
  uint64_t v64;
  _QWORD v65[2];
  uint64_t (*v66)();
  void *v67;
  uint64_t v68;
  _BYTE buf[12];
  __int16 v70;
  ARSceneReconstructionHandler *v71;
  __int16 v72;
  uint64_t v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v56 = a4;
  v55 = a5;
  v11 = a6;
  objc_msgSend(v11, "worldTrackingState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "state");

  if (v13 == 2)
  {
    if (objc_msgSend(v56, "maskedSemanticsSampledForDepth"))
    {
      objc_msgSend(v10, "sourceImageData");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "timestamp");
      kdebug_trace();

      objc_msgSend(v10, "sourceImageData");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "cameraIntrinsics");
      v52 = v17;
      v53 = v16;
      v51 = v18;
      objc_msgSend(v10, "sourceImageData");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "imageResolution");
      v21 = v20;
      v23 = v22;
      objc_msgSend(v10, "depthBufferSize");
      ARAdjustIntrinsicsForViewportSize(v53, v52, v51, v21, v23, v24, v25);
      v50 = v26;

      objc_msgSend(v11, "visionCameraTransform");
      kdebug_trace();
      kdebug_trace();
      kdebug_trace();
      kdebug_trace();
      kdebug_trace();
      objc_msgSend(v56, "sourceImageData");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "timestamp");
      objc_msgSend(v10, "depthBufferSize");
      objc_msgSend(v10, "depthBufferSize");
      v28 = CV3DReconFrameBundleCreate();

      if (v28)
      {
        v29 = MEMORY[0x1E0C809B0];
        v65[0] = MEMORY[0x1E0C809B0];
        v65[1] = 3221225472;
        v66 = __87__ARSceneReconstructionHandler_pushDepth_semanticSegmentation_personSegmentation_pose___block_invoke;
        v67 = &__block_descriptor_40_e5_v8__0l;
        v68 = v28;
        *(_QWORD *)buf = 0;
        v54 = v11;
        objc_msgSend(v11, "slamState");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[ARSceneReconstructionHandler bufferSlamState:](self, "bufferSlamState:", objc_msgSend(v30, "slamState"));

        -[ARSceneReconstructionHandler swapSlamStateBuffers](self, "swapSlamStateBuffers");
        begin = self->_slamStateBufferFront.__begin_;
        end = self->_slamStateBufferFront.__end_;
        if (begin != end)
        {
          do
          {
            if (!*begin)
            {
              -[ARSceneReconstructionHandler handleCFError:withErrorMessage:failSession:](self, "handleCFError:withErrorMessage:failSession:", *(_QWORD *)buf, CFSTR("Error: unexpected null slam state"), 0);
              goto LABEL_38;
            }
            v33 = CV3DReconSlamMetadataCreateFromSlamState();
            if (!v33)
            {
              -[ARSceneReconstructionHandler handleCFError:withErrorMessage:failSession:](self, "handleCFError:withErrorMessage:failSession:", *(_QWORD *)buf, CFSTR("Error: failed to convert slam state to recon slam metadata"), 0);
              goto LABEL_38;
            }
            v61[0] = v29;
            v61[1] = 3221225472;
            v62 = __87__ARSceneReconstructionHandler_pushDepth_semanticSegmentation_personSegmentation_pose___block_invoke_2;
            v63 = &__block_descriptor_40_e5_v8__0l;
            v64 = v33;
            v34 = CV3DReconFrameBundleAddSlamMetadata();
            if ((v34 & 1) == 0)
              -[ARSceneReconstructionHandler handleCFError:withErrorMessage:failSession:](self, "handleCFError:withErrorMessage:failSession:", *(_QWORD *)buf, CFSTR("Error adding SLAM state to frame bundle"), 0);
            ((void (*)(_QWORD *))v62)(v61);
            if ((v34 & 1) == 0)
              goto LABEL_38;
            begin += 2;
          }
          while (begin != end);
          begin = self->_slamStateBufferFront.__begin_;
          for (i = (uint64_t)self->_slamStateBufferFront.__end_;
                (_QWORD *)i != begin;
        }
        self->_slamStateBufferFront.__end_ = begin;
        objc_msgSend(v10, "singleFrameDepthBuffer", v50);
        if ((CV3DReconFrameBundleSetDepthImage() & 1) == 0)
        {
          -[ARSceneReconstructionHandler handleCFError:withErrorMessage:failSession:](self, "handleCFError:withErrorMessage:failSession:", *(_QWORD *)buf, CFSTR("Error setting depth image to frame bundle"), 0);
LABEL_38:
          v11 = v54;
          ((void (*)(_QWORD *))v66)(v65);
          goto LABEL_21;
        }
        v57[0] = v29;
        v57[1] = 3221225472;
        v58 = __87__ARSceneReconstructionHandler_pushDepth_semanticSegmentation_personSegmentation_pose___block_invoke_3;
        v59 = &__block_descriptor_40_e5_v8__0l;
        v60 = -[ARSceneReconstructionHandler postProcessConfidenceBuffer:fromSegmentationData:](self, "postProcessConfidenceBuffer:fromSegmentationData:", objc_msgSend(v10, "singleFrameConfidenceBuffer"), v55);
        if (objc_msgSend(v10, "normalsBuffer")
          && (objc_msgSend(v10, "normalsBuffer"), (CV3DReconFrameBundleSetNormalsImage() & 1) == 0))
        {
          v47 = CFSTR("Error setting normals image to frame bundle");
        }
        else if (CV3DReconFrameBundleSetDepthConfidenceImage())
        {
          objc_msgSend(v56, "maskedSemanticsSampledForDepth");
          if ((CV3DReconFrameBundleSetSemanticsImage() & 1) != 0)
          {
            sceneReconstruction = self->_sceneReconstruction;
            if ((~sceneReconstruction & 0x11) != 0
              && (~sceneReconstruction & 0x18) != 0
              && (sceneReconstruction & 0x80) == 0
              || (objc_msgSend(v10, "sourceImageData"),
                  v45 = (void *)objc_claimAutoreleasedReturnValue(),
                  objc_msgSend(v45, "pixelBuffer"),
                  v46 = CV3DReconFrameBundleSetColorImage(),
                  v45,
                  (v46 & 1) != 0))
            {
              CVPixelBufferGetWidth((CVPixelBufferRef)objc_msgSend(v10, "singleFrameDepthBuffer"));
              CVPixelBufferGetHeight((CVPixelBufferRef)objc_msgSend(v10, "singleFrameDepthBuffer"));
              CVPixelBufferGetWidth((CVPixelBufferRef)objc_msgSend(v56, "maskedSemanticsSampledForDepth"));
              CVPixelBufferGetHeight((CVPixelBufferRef)objc_msgSend(v56, "maskedSemanticsSampledForDepth"));
              kdebug_trace();
              kdebug_trace();
              os_unfair_lock_lock(&self->_reconstructionSessionLock);
              objc_msgSend(v10, "timestamp");
              objc_msgSend(v56, "sourceImageData");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "timestamp");
              kdebug_trace();

              v49 = CV3DReconSessionProcessFrameBundle();
              os_unfair_lock_unlock(&self->_reconstructionSessionLock);
              kdebug_trace();
              if ((v49 & 1) == 0)
                -[ARSceneReconstructionHandler handleCFError:withErrorMessage:failSession:](self, "handleCFError:withErrorMessage:failSession:", *(_QWORD *)buf, CFSTR("Error processing frame bundle"), 0);
            }
            else
            {
              -[ARSceneReconstructionHandler handleCFError:withErrorMessage:failSession:](self, "handleCFError:withErrorMessage:failSession:", *(_QWORD *)buf, CFSTR("Error setting color image to frame bundle"), 0);
            }
            goto LABEL_37;
          }
          v47 = CFSTR("Error setting semantics image to frame bundle");
        }
        else
        {
          v47 = CFSTR("Error setting depth confidence image to frame bundle");
        }
        -[ARSceneReconstructionHandler handleCFError:withErrorMessage:failSession:](self, "handleCFError:withErrorMessage:failSession:", *(_QWORD *)buf, v47, 0);
LABEL_37:
        v58((uint64_t)v57);
        goto LABEL_38;
      }
      _ARLogTechnique();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        v42 = (objc_class *)objc_opt_class();
        NSStringFromClass(v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v43;
        v70 = 2048;
        v71 = self;
        _os_log_impl(&dword_1B3A68000, v36, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Error creating frame bundle, skipping pushing to spatial mapping", buf, 0x16u);

      }
    }
    else
    {
      _ARLogTechnique();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        v40 = (objc_class *)objc_opt_class();
        NSStringFromClass(v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v41;
        v70 = 2048;
        v71 = self;
        _os_log_impl(&dword_1B3A68000, v36, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Skipping pushing to spatial mapping since masked semantics sampled for depth is not available", buf, 0x16u);

      }
    }
  }
  else
  {
    _ARLogTechnique();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      v37 = (objc_class *)objc_opt_class();
      NSStringFromClass(v37);
      v38 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "worldTrackingState");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v38;
      v70 = 2048;
      v71 = self;
      v72 = 2048;
      v73 = objc_msgSend(v39, "state");
      _os_log_impl(&dword_1B3A68000, v36, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Skipping pushing to spatial mapping since world tracking state is not normal: %ld", buf, 0x20u);

    }
  }

LABEL_21:
}

uint64_t __87__ARSceneReconstructionHandler_pushDepth_semanticSegmentation_personSegmentation_pose___block_invoke()
{
  return CV3DReconFrameBundleRelease();
}

uint64_t __87__ARSceneReconstructionHandler_pushDepth_semanticSegmentation_personSegmentation_pose___block_invoke_2()
{
  return CV3DReconSlamMetadataRelease();
}

void __87__ARSceneReconstructionHandler_pushDepth_semanticSegmentation_personSegmentation_pose___block_invoke_3(uint64_t a1)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 32));
}

- (__CVBuffer)postProcessConfidenceBuffer:(__CVBuffer *)a3 fromSegmentationData:(id)a4
{
  id v6;
  void *v7;
  double Width;
  double Height;
  __CVBuffer *v10;
  __CVBuffer *v11;
  double v12;
  double v13;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  CVPixelBufferRef v18;
  OSType PixelFormatType;
  __CVBuffer *v20;
  void *BaseAddress;
  void *v22;
  size_t BytesPerRow;
  size_t v24;
  size_t v25;
  uint64_t v26;
  uint64_t v27;
  size_t i;
  size_t v29;
  char *v30;
  char *v31;
  int v33;
  void *v34;
  __int16 v35;
  ARSceneReconstructionHandler *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  int v40;
  __int16 v41;
  int v42;
  __int16 v43;
  int v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = v6;
  if (!v6 || !objc_msgSend(v6, "segmentationBuffer"))
    goto LABEL_27;
  if (a3)
  {
    Width = (double)CVPixelBufferGetWidth(a3);
    Height = (double)CVPixelBufferGetHeight(a3);
  }
  else
  {
    Width = *MEMORY[0x1E0C9D820];
    Height = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v10 = (__CVBuffer *)objc_msgSend(v7, "segmentationBuffer");
  v11 = v10;
  if (v10)
  {
    v12 = (double)CVPixelBufferGetWidth(v10);
    v13 = (double)CVPixelBufferGetHeight(v11);
  }
  else
  {
    v12 = *MEMORY[0x1E0C9D820];
    v13 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  if (v12 != Width || v13 != Height)
  {
    _ARLogTechnique();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138544642;
      v34 = v17;
      v35 = 2048;
      v36 = self;
      v37 = 1024;
      v38 = (int)v12;
      v39 = 1024;
      v40 = (int)v13;
      v41 = 1024;
      v42 = (int)Width;
      v43 = 1024;
      v44 = (int)Height;
      _os_log_impl(&dword_1B3A68000, v15, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Confidence buffer and person segmentation buffer do not match size. (%d,%d) vs. (%d,%d).", (uint8_t *)&v33, 0x2Eu);

    }
    v18 = CVPixelBufferRetain(a3);
    goto LABEL_28;
  }
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  v20 = ARCreateCVPixelBufferFromPool(&self->_postProcessedDepthConfidencePool, PixelFormatType, self, CFSTR("Post processed confidence buffer"), Width, Height);
  if (!v20)
  {
LABEL_27:
    v18 = CVPixelBufferRetain(a3);
LABEL_28:
    v20 = v18;
    goto LABEL_29;
  }
  CVPixelBufferLockBaseAddress((CVPixelBufferRef)objc_msgSend(v7, "segmentationBuffer"), 1uLL);
  CVPixelBufferLockBaseAddress(v20, 0);
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  BaseAddress = CVPixelBufferGetBaseAddress(v20);
  v22 = CVPixelBufferGetBaseAddress(a3);
  BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  memcpy(BaseAddress, v22, (unint64_t)(Height * (double)BytesPerRow));
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  v24 = CVPixelBufferGetBytesPerRow((CVPixelBufferRef)objc_msgSend(v7, "segmentationBuffer"));
  v25 = CVPixelBufferGetBytesPerRow(v20);
  v26 = 0;
  v27 = 0;
  for (i = 0; i < CVPixelBufferGetHeight(v20); ++i)
  {
    v29 = 0;
    v30 = (char *)CVPixelBufferGetBaseAddress((CVPixelBufferRef)objc_msgSend(v7, "segmentationBuffer")) + v27;
    v31 = (char *)CVPixelBufferGetBaseAddress(v20) + v26;
    while (CVPixelBufferGetWidth(v20) > v29)
    {
      if (v30[v29])
        *(_DWORD *)&v31[4 * v29] = 0;
      ++v29;
    }
    v27 += v24;
    v26 += v25;
  }
  CVPixelBufferUnlockBaseAddress((CVPixelBufferRef)objc_msgSend(v7, "segmentationBuffer"), 1uLL);
  CVPixelBufferUnlockBaseAddress(v20, 0);
LABEL_29:

  return v20;
}

- (void)processPlaneList:(CV3DPlaneDetectionPlaneList *)a3
{
  os_unfair_lock_s *p_reconstructionSessionLock;
  char v5;

  p_reconstructionSessionLock = &self->_reconstructionSessionLock;
  os_unfair_lock_lock(&self->_reconstructionSessionLock);
  v5 = CV3DReconSessionProcessPlaneList();
  os_unfair_lock_unlock(p_reconstructionSessionLock);
  if ((v5 & 1) == 0)
    -[ARSceneReconstructionHandler handleCFError:withErrorMessage:failSession:](self, "handleCFError:withErrorMessage:failSession:", 0, CFSTR("Error processing plane list"), 0);
}

- (BOOL)queryOccupancyWithPoints:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  char OccupancyAsync;
  uint64_t (*v10)();
  NSObject *v11;
  objc_class *v12;
  void *v13;
  _QWORD v15[2];
  uint64_t (*v16)();
  void *v17;
  uint64_t v18;
  _BYTE buf[12];
  __int16 v20;
  ARSceneReconstructionHandler *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (self->_occupancyMappingEnabled)
  {
    *(_QWORD *)buf = 0;
    v8 = MEMORY[0x1B5E2C5E0](v6);
    os_unfair_lock_lock(&self->_reconstructionSessionLock);
    OccupancyAsync = CV3DReconSessionQueryOccupancyAsync();
    os_unfair_lock_unlock(&self->_reconstructionSessionLock);
    v15[0] = MEMORY[0x1E0C809B0];
    v10 = __66__ARSceneReconstructionHandler_queryOccupancyWithPoints_callback___block_invoke;
    v15[1] = 3221225472;
    v16 = __66__ARSceneReconstructionHandler_queryOccupancyWithPoints_callback___block_invoke;
    v17 = &__block_descriptor_40_e5_v8__0l;
    v18 = v8;
    if ((OccupancyAsync & 1) == 0)
    {
      -[ARSceneReconstructionHandler handleCFError:withErrorMessage:failSession:](self, "handleCFError:withErrorMessage:failSession:", *(_QWORD *)buf, CFSTR("Failed to query occupancy map"), 0);
      v10 = v16;
    }
    ((void (*)(_QWORD *))v10)(v15);
  }
  else
  {
    _ARLogTechnique();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v13;
      v20 = 2048;
      v21 = self;
      _os_log_impl(&dword_1B3A68000, v11, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Occupancy mapping is not enabled.", buf, 0x16u);

    }
    OccupancyAsync = 0;
  }

  return OccupancyAsync;
}

uint64_t __66__ARSceneReconstructionHandler_queryOccupancyWithPoints_callback___block_invoke()
{
  return CV3DReconOccupancyQueryRequestRelease();
}

- (void)handleCFError:(__CFError *)a3 withErrorMessage:(id)a4 failSession:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  ARSceneReconstructionHandler *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v5 = a5;
  v22 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  os_unfair_lock_assert_not_owner(&self->_reconstructionSessionLock);
  if (a3)
  {
    _ARLogGeneral();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFError localizedFailureReason](a3, "localizedFailureReason");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138544130;
      v15 = v11;
      v16 = 2048;
      v17 = self;
      v18 = 2112;
      v19 = v8;
      v20 = 2112;
      v21 = v12;
      _os_log_impl(&dword_1B3A68000, v9, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@: %@", (uint8_t *)&v14, 0x2Au);

    }
    if (v5)
    {
      -[ARSceneReconstructionHandler delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "sceneReconstructionHandler:didFailWithError:", self, a3);

    }
  }

}

- (void)handleCFError:(__CFError *)a3 withErrorMessage:(id)a4
{
  -[ARSceneReconstructionHandler handleCFError:withErrorMessage:failSession:](self, "handleCFError:withErrorMessage:failSession:", a3, a4, 1);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  CVPixelBufferPoolRelease(self->_postProcessedDepthConfidencePool);
  v4 = 0;
  if (self->_slamStateCbID.__engaged_ && (CV3DSLAMSessionDeregisterNewStateBlock() & 1) == 0)
    -[ARSceneReconstructionHandler handleCFError:withErrorMessage:failSession:](self, "handleCFError:withErrorMessage:failSession:", v4, CFSTR("Error deregistering slam state callback"), 0);
  if (self->_reconstructionSession)
  {
    if ((CV3DReconSessionDisable() & 1) == 0)
      -[ARSceneReconstructionHandler handleCFError:withErrorMessage:failSession:](self, "handleCFError:withErrorMessage:failSession:", v4, CFSTR("Error disabling reconstruction session"), 0);
    if ((CV3DReconSessionWait() & 1) == 0)
      -[ARSceneReconstructionHandler handleCFError:withErrorMessage:failSession:](self, "handleCFError:withErrorMessage:failSession:", v4, CFSTR("Error waiting on reconstruction session"), 0);
  }
  CV3DReconSessionRelease();
  CV3DSLAMSessionRelease();
  v3.receiver = self;
  v3.super_class = (Class)ARSceneReconstructionHandler;
  -[ARSceneReconstructionHandler dealloc](&v3, sel_dealloc);
}

- (unint64_t)sceneReconstruction
{
  return self->_sceneReconstruction;
}

- (ARSceneReconstructionDelegate)delegate
{
  return (ARSceneReconstructionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ARSceneReconstructionOptions)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  vector<std::shared_ptr<const CV3DSLAMStateContext>, std::allocator<std::shared_ptr<const CV3DSLAMStateContext>>> *p_slamStateBufferFront;

  objc_storeStrong((id *)&self->_options, 0);
  objc_destroyWeak((id *)&self->_delegate);
  p_slamStateBufferFront = &self->_slamStateBufferFront;
  std::vector<std::shared_ptr<CV3DSLAMStateContext const>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_slamStateBufferFront);
  p_slamStateBufferFront = &self->_slamStateBufferBack;
  std::vector<std::shared_ptr<CV3DSLAMStateContext const>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_slamStateBufferFront);
}

- (id).cxx_construct
{
  *((_BYTE *)self + 112) = 0;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *((_BYTE *)self + 104) = 0;
  return self;
}

- (void)bufferSlamState:(std::__shared_weak_count *)a1
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1B5E2D5B8);
}

- (uint64_t)bufferSlamState:
{
  return CV3DSLAMStateRelease();
}

- (uint64_t)bufferSlamState:(uint64_t)a1
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

- (void)_recreateReconstructionSessionWithError:.cold.1()
{
  __assert_rtn("-[ARSceneReconstructionHandler _recreateReconstructionSessionWithError:]", "ARSceneReconstructionHandler.mm", 141, "!requestMesh && !requestKeyframe");
}

@end
