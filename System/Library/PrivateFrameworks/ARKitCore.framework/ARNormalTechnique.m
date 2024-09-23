@implementation ARNormalTechnique

- (ARNormalTechnique)init
{
  ARNormalTechnique *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ARNormalTechnique;
  v2 = -[ARTechnique init](&v4, sel_init);
  if (v2)
    v2->_session = (CV3DNormalEstimationSession *)CV3DNormalEstimationCreate();
  return v2;
}

- (id)processData:(id)a3
{
  void *v4;
  id v5;
  id v7;
  double v8;
  double v9;
  CVPixelBufferRef v10;
  __CVBuffer *v11;
  void *v12;
  void *v13;
  float v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  NSObject *v25;
  objc_class *v26;
  void *v27;
  NSObject *v28;
  objc_class *v29;
  void *v30;
  double v31;
  uint64_t v32;
  double v33;
  float v34;
  objc_super v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  ARNormalTechnique *v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v35.receiver = self;
  v35.super_class = (Class)ARNormalTechnique;
  -[ARTechnique processData:](&v35, sel_processData_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v7 = v4;
    if (!objc_msgSend(v7, "normalsBuffer"))
    {
      objc_msgSend(v7, "depthBufferSize");
      v10 = ARCreateCVPixelBufferFromPool(&self->_normalPixelBufferPool, 1380410945, self, CFSTR("Normals map"), v8, v9);
      if (v10)
      {
        v11 = v10;
        +[ARKitUserDefaults numberForKey:](ARKitUserDefaults, "numberForKey:", CFSTR("com.apple.arkit.planeEstimation.normalsKernelSize"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "unsignedIntValue");

        objc_msgSend(v7, "timestamp");
        kdebug_trace();
        objc_msgSend(v7, "sourceImageData");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "cameraIntrinsics");
        v33 = v15;
        v34 = v14;
        v31 = v16;
        objc_msgSend(v7, "sourceImageData");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "imageResolution");
        v19 = v18;
        v21 = v20;
        objc_msgSend(v7, "depthBufferSize");
        ARAdjustIntrinsicsForViewportSize(v34, v33, v31, v19, v21, v22, v23);
        v32 = v24;

        objc_msgSend(v7, "depthBuffer");
        if (CV3DNormalEstimationSessionCompute())
        {
          objc_msgSend(v7, "setNormalsBuffer:", v11);
        }
        else
        {
          _ARLogTechnique_13();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            v29 = (objc_class *)objc_opt_class();
            NSStringFromClass(v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v37 = v30;
            v38 = 2048;
            v39 = self;
            v40 = 2112;
            v41 = 0;
            _os_log_impl(&dword_1B3A68000, v28, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to compute normals: %@", buf, 0x20u);

          }
        }
        objc_msgSend(v7, "timestamp", v32);
        kdebug_trace();
        CVPixelBufferRelease(v11);
      }
      else
      {
        _ARLogTechnique_13();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v26 = (objc_class *)objc_opt_class();
          NSStringFromClass(v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v37 = v27;
          v38 = 2048;
          v39 = self;
          _os_log_impl(&dword_1B3A68000, v25, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: CVPixelBuffer to store normals could not be created from pool", buf, 0x16u);

        }
      }
    }
  }
  else
  {
    v5 = v4;
  }

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferPoolRelease(self->_normalPixelBufferPool);
  CV3DNormalEstimationSessionRelease();
  v3.receiver = self;
  v3.super_class = (Class)ARNormalTechnique;
  -[ARNormalTechnique dealloc](&v3, sel_dealloc);
}

@end
