@implementation AREnvironmentTexturingTechnique

- (AREnvironmentTexturingTechnique)initWithOptions:(int64_t)a3 wantsHDREnvironmentTextures:(BOOL)a4
{
  AREnvironmentTexturingTechnique *v6;
  AREnvironmentProbeManager *v7;
  AREnvironmentProbeManager *probeManager;
  uint64_t v9;
  ARPlaneWorld *planeWorld;
  uint64_t v11;
  OS_dispatch_queue *planeUpdateQueue;
  uint64_t v13;
  OS_dispatch_queue *networkPrewarmQueue;
  dispatch_semaphore_t v15;
  OS_dispatch_semaphore *ultraWideSemaphore;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)AREnvironmentTexturingTechnique;
  v6 = -[ARTechnique init](&v18, sel_init);
  if (v6)
  {
    v7 = -[AREnvironmentProbeManager initWithMode:]([AREnvironmentProbeManager alloc], "initWithMode:", a3);
    probeManager = v6->_probeManager;
    v6->_probeManager = v7;

    v9 = objc_opt_new();
    planeWorld = v6->_planeWorld;
    v6->_planeWorld = (ARPlaneWorld *)v9;

    ARCreateNonFixedPriorityDispatchQueue("com.apple.arkit.environmentTexturing.planeUpdate");
    v11 = objc_claimAutoreleasedReturnValue();
    planeUpdateQueue = v6->_planeUpdateQueue;
    v6->_planeUpdateQueue = (OS_dispatch_queue *)v11;

    ARCreateNonFixedPriorityDispatchQueue("com.apple.arkit.environmentTexturing.networkPrewarm");
    v13 = objc_claimAutoreleasedReturnValue();
    networkPrewarmQueue = v6->_networkPrewarmQueue;
    v6->_networkPrewarmQueue = (OS_dispatch_queue *)v13;

    v6->_networkIntialized = 0;
    v6->_wantsHDREnvironmentTextures = a4;
    v15 = dispatch_semaphore_create(1);
    ultraWideSemaphore = v6->_ultraWideSemaphore;
    v6->_ultraWideSemaphore = (OS_dispatch_semaphore *)v15;

  }
  return v6;
}

- (unint64_t)requiredSensorDataTypes
{
  return 1;
}

- (BOOL)reconfigurableFrom:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "isMemberOfClass:", objc_opt_class());

  return v4;
}

- (void)reconfigureFrom:(id)a3
{
  AREnvironmentProbeManager *v4;
  void *v5;
  AREnvironmentProbeManager *v6;
  id v7;

  v7 = a3;
  v4 = [AREnvironmentProbeManager alloc];
  objc_msgSend(v7, "probeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[AREnvironmentProbeManager initWithMode:](v4, "initWithMode:", objc_msgSend(v5, "mode"));
  -[AREnvironmentTexturingTechnique setProbeManager:](self, "setProbeManager:", v6);

}

- (id)processData:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  intptr_t v9;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    objc_msgSend(v6, "cameraType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7 == (void *)*MEMORY[0x1E0C89F98])
    {
      v9 = dispatch_semaphore_wait((dispatch_semaphore_t)self->_ultraWideSemaphore, 0);

      if (!v9)
      {
        objc_storeStrong((id *)&self->_ultraWide, a3);
        dispatch_semaphore_signal((dispatch_semaphore_t)self->_ultraWideSemaphore);
      }
    }
    else
    {

    }
  }
  return v5;
}

- (void)prepare:(BOOL)a3
{
  id v4;
  _BOOL8 wantsHDREnvironmentTextures;
  id v6;

  if (!-[AREnvironmentTexturingTechnique networkIntialized](self, "networkIntialized", a3))
  {
    -[AREnvironmentTexturingTechnique setNetworkIntialized:](self, "setNetworkIntialized:", 1);
    v4 = +[ARCubemapCompletion sharedInstance](ARCubemapCompletion, "sharedInstance");
    wantsHDREnvironmentTextures = self->_wantsHDREnvironmentTextures;
    +[ARCubemapCompletion sharedInstance](ARCubemapCompletion, "sharedInstance");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setGenerateHDROutput:", wantsHDREnvironmentTextures);

  }
}

- (void)requestResultDataAtTimestamp:(double)a3 context:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  ARImageData *v9;
  ARImageData *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  ARPlaneWorld *planeWorld;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  NSObject *networkPrewarmQueue;
  void *v26;
  void *v27;
  BOOL v28;
  void *v30;
  _BOOL4 v31;
  NSObject *planeUpdateQueue;
  void *v33;
  ARImageData *v34;
  ARImageData *v35;
  _QWORD v36[4];
  ARImageData *v37;
  id v38;
  id v39;
  id v40;
  _QWORD block[4];
  id v42;
  _QWORD v43[3];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  id location;
  void *v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(v6, "imageData");
  v35 = (ARImageData *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resultDataOfClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_ultraWideSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  v9 = self->_ultraWide;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_ultraWideSemaphore);
  v10 = v35;
  if (v9)
    v10 = v9;
  v34 = v10;
  objc_msgSend(v6, "anchorsToAdd");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[ARProbeFilter filter:](ARProbeFilter, "filter:", v11);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_opt_new();
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v13 = v33;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v45 != v15)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v17);

      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    }
    while (v14);
  }

  -[AREnvironmentTexturingTechnique probeManager](self, "probeManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  planeWorld = self->_planeWorld;
  if (planeWorld)
    -[ARPlaneWorld planes](planeWorld, "planes");
  else
    memset(v43, 0, sizeof(v43));
  objc_msgSend(v18, "updateProbesForTimestamp:planes:imageData:pose:enableDirectTexturingForProbesWithIdentifier:", v43, v34, v8, v12, a3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  location = v43;
  std::vector<ARTexturedPlane>::__destroy_vector::operator()[abi:ne180100]((void ***)&location);

  -[ARTechnique delegate](self, "delegate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "technique:didOutputResultData:timestamp:context:", self, v22, v6, a3);

  if (!-[AREnvironmentTexturingTechnique networkIntialized](self, "networkIntialized"))
  {
    if (v8)
    {
      objc_msgSend(v8, "worldTrackingState");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "vioTrackingState") == 0;

      if (v24)
      {
        -[AREnvironmentTexturingTechnique setNetworkIntialized:](self, "setNetworkIntialized:", 1);
        objc_initWeak(&location, self);
        networkPrewarmQueue = self->_networkPrewarmQueue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __72__AREnvironmentTexturingTechnique_requestResultDataAtTimestamp_context___block_invoke;
        block[3] = &unk_1E66723F8;
        objc_copyWeak(&v42, &location);
        dispatch_async(networkPrewarmQueue, block);
        objc_destroyWeak(&v42);
        objc_destroyWeak(&location);
      }
    }
  }
  objc_msgSend(v6, "resultDataOfClass:", objc_opt_class());
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "lastObject");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
    v28 = v27 == 0;
  else
    v28 = 1;
  if (!v28 && v8 != 0)
  {
    objc_msgSend(v8, "worldTrackingState");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "vioTrackingState") == 0;

    if (v31)
    {
      objc_initWeak(&location, self);
      planeUpdateQueue = self->_planeUpdateQueue;
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __72__AREnvironmentTexturingTechnique_requestResultDataAtTimestamp_context___block_invoke_2;
      v36[3] = &unk_1E6672420;
      objc_copyWeak(&v40, &location);
      v37 = v35;
      v38 = v27;
      v39 = v8;
      dispatch_async(planeUpdateQueue, v36);

      objc_destroyWeak(&v40);
      objc_destroyWeak(&location);
    }
  }

}

void __72__AREnvironmentTexturingTechnique_requestResultDataAtTimestamp_context___block_invoke(uint64_t a1)
{
  unsigned __int8 *WeakRetained;
  int v2;
  void *v3;
  unsigned __int8 *v4;

  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v2 = WeakRetained[96];
    +[ARCubemapCompletion sharedInstance](ARCubemapCompletion, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setGenerateHDROutput:", v2 != 0);

    WeakRetained = v4;
  }

}

void __72__AREnvironmentTexturingTechnique_requestResultDataAtTimestamp_context___block_invoke_2(id *a1)
{
  _QWORD *WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  int v6;
  int v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  _BYTE v20[8];
  _QWORD *v21;

  WeakRetained = objc_loadWeakRetained(a1 + 7);
  if (WeakRetained)
  {
    objc_msgSend(a1[4], "timestamp");
    kdebug_trace();
    v3 = (void *)WeakRetained[7];
    objc_msgSend(a1[5], "detectionResult");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    convert((const CV3DPlaneDetectionPlaneList *)objc_msgSend(v4, "cv3dPlaneDetections"), (uint64_t)v20);
    v5 = objc_msgSend(a1[4], "pixelBuffer");
    objc_msgSend(a1[4], "exposureTargetOffset");
    v7 = v6;
    objc_msgSend(a1[6], "cameraTransform");
    v18 = v9;
    v19 = v8;
    v16 = v11;
    v17 = v10;
    objc_msgSend(a1[4], "cameraIntrinsics");
    v13 = v12;
    LODWORD(v12) = v7;
    objc_msgSend(v3, "updatePlanes:withCameraImage:exposureOffset:transform:intrinsics:synchronous:", v20, v5, 0, v12, v19, v18, v17, v16, v13, v14, v15);
    std::__tree<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::__map_value_compare<std::array<unsigned char,16ul>,std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::less<std::array<unsigned char,16ul>>,true>,std::allocator<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>>>::destroy((uint64_t)v20, v21);

    objc_msgSend(a1[4], "timestamp");
    kdebug_trace();
  }

}

+ (BOOL)producesResultDataForAnchorOfClass:(Class)a3
{
  return objc_opt_class() == (_QWORD)a3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int wantsHDREnvironmentTextures;
  BOOL v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AREnvironmentTexturingTechnique;
  if (-[ARTechnique isEqual:](&v11, sel_isEqual_, v4))
  {
    -[AREnvironmentTexturingTechnique probeManager](self, "probeManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "mode");
    objc_msgSend(v4, "probeManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == objc_msgSend(v7, "mode"))
    {
      wantsHDREnvironmentTextures = self->_wantsHDREnvironmentTextures;
      v9 = wantsHDREnvironmentTextures == objc_msgSend(v4, "wantsHDREnvironmentTextures");
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_fullDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v10.receiver = self;
  v10.super_class = (Class)AREnvironmentTexturingTechnique;
  -[ARTechnique _fullDescription](&v10, sel__fullDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[ARPlaneWorld _fullDescription](self->_planeWorld, "_fullDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("PlaneWorld: %@\n"), v6);

  -[AREnvironmentTexturingTechnique probeManager](self, "probeManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_fullDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("ProbManager: %@\n"), v8);

  return v5;
}

- (BOOL)wantsHDREnvironmentTextures
{
  return self->_wantsHDREnvironmentTextures;
}

- (AREnvironmentProbeManager)probeManager
{
  return (AREnvironmentProbeManager *)objc_getProperty(self, a2, 104, 1);
}

- (void)setProbeManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (BOOL)networkIntialized
{
  return self->_networkIntialized;
}

- (void)setNetworkIntialized:(BOOL)a3
{
  self->_networkIntialized = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_probeManager, 0);
  objc_storeStrong((id *)&self->_ultraWideSemaphore, 0);
  objc_storeStrong((id *)&self->_ultraWide, 0);
  objc_storeStrong((id *)&self->_networkPrewarmQueue, 0);
  objc_storeStrong((id *)&self->_planeUpdateQueue, 0);
  objc_storeStrong((id *)&self->_planeWorld, 0);
}

@end
