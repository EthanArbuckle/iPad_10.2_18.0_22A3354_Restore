@implementation ARCoachingGlyphRenderer

- (double)currentAnimationTime
{
  double result;

  -[ARCoachingAnimTime absoluteTime](self->_time, "absoluteTime");
  return result;
}

- (ARCoachingGlyphState)state
{
  return self->_state;
}

- (ARCoachingGlyphRenderer)initWithLayer:(id)a3 device:(id)a4 pixelFormat:(unint64_t)a5 sampleCount:(int)a6 deviceMaskImage:(id)a7
{
  id v13;
  id v14;
  id v15;
  ARCoachingGlyphRenderer *v16;
  ARCoachingGlyphRenderer *v17;
  double v23;
  ARCoachingGlyphState *v24;
  ARCoachingGlyphState *state;
  ARCoachingAnimTime *v26;
  ARCoachingAnimTime *time;
  ARCoachingDeviceController *v28;
  ARCoachingDeviceController *deviceController;
  ARCoachingDeviceController *v30;
  void *v31;
  uint64_t v32;
  ARCoachingDeviceController *parallaxDeviceController;
  uint64_t v34;
  OS_dispatch_queue *queue;
  id v36;
  ARCoachingMetalSplineData *v37;
  ARCoachingMetalSplineData *splineData;
  ARCoachingMetalSplineData *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  ARCoachingQuaternionSpring *v47;
  ARCoachingQuaternionSpring *rotationSpring;
  ARCoachingGlyphState *v49;
  ARCoachingQuaternionSpring *v50;
  ARCoachingQuaternionSpring *v51;
  __int128 v52;
  ARCoachingSpringDouble3 *v53;
  ARCoachingSpringDouble3 *scaleSpring;
  __int128 v55;
  ARCoachingGlyphState *v56;
  int8x16_t v57;
  unint64_t v58;
  ARCoachingSpringDouble3 *v59;
  __int128 v60;
  ARCoachingSpringDouble3 *v61;
  int8x16_t v62;
  unint64_t v63;
  ARCoachingSpringDouble3 *v64;
  ARCoachingSpringDouble3 *topPlaneTranslationSpring;
  __int128 v66;
  ARCoachingGlyphState *v67;
  int8x16_t v68;
  unint64_t v69;
  ARCoachingSpringDouble3 *v70;
  __int128 v71;
  ARCoachingSpringDouble3 *v72;
  int8x16_t v73;
  unint64_t v74;
  ARCoachingSpringDouble3 *v75;
  ARCoachingSpringDouble3 *bottomPlaneTranslationSpring;
  __int128 v77;
  ARCoachingGlyphState *v78;
  int8x16_t v79;
  unint64_t v80;
  ARCoachingSpringDouble3 *v81;
  __int128 v82;
  ARCoachingSpringDouble3 *v83;
  int8x16_t v84;
  unint64_t v85;
  ARCoachingStateSpring *v86;
  ARCoachingStateSpring *cubeResolveSpring;
  double v88;
  double v89;
  double v90;
  ARCoachingStateSpring *v91;
  ARCoachingStateSpring *planeResolveSpring;
  double v93;
  double v94;
  double v95;
  ARCoachingStateSpring *v96;
  ARCoachingStateSpring *verticalResolvingSpring;
  ARCoachingStateSpring *v98;
  ARCoachingStateSpring *alphaSpring;
  ARCoachingBasicSpring *v100;
  double v101;
  double v102;
  uint64_t v103;
  ARCoachingBasicSpring *orientationSpring;
  id v106;
  id v107;
  _OWORD v108[3];
  uint64_t v109;
  _OWORD v110[3];
  uint64_t v111;
  _OWORD v112[3];
  uint64_t v113;
  _OWORD v114[3];
  uint64_t v115;
  _OWORD v116[3];
  uint64_t v117;
  _OWORD v118[3];
  uint64_t v119;
  __int128 v120;
  __int128 v121;
  _OWORD v122[2];
  __int128 v123;
  __int128 v124;
  objc_super v125;

  v13 = a3;
  v14 = a4;
  v15 = a7;
  v125.receiver = self;
  v125.super_class = (Class)ARCoachingGlyphRenderer;
  v16 = -[ARCoachingGlyphRenderer init](&v125, sel_init);
  v17 = v16;
  if (v16)
  {
    v107 = v13;
    objc_storeStrong((id *)&v16->_device, a4);
    v17->_pixelFormat = a5;
    v17->_sampleCount = a6;
    objc_storeStrong((id *)&v17->_layer, a3);
    v17->_strokeWeight = 0.035;
    __asm { FMOV            V0.2S, #16.0 }
    *(_QWORD *)&v17->_edgeFactor = _D0;
    v17->_dirty_tesselation_factors = 1;
    v17->_angularVelocity.angle = 0.0;
    *(_QWORD *)&v17->_anon_c8[8] = 0;
    *(_QWORD *)&v17->_anon_c8[16] = 0;
    *(_OWORD *)&v17->_anon_c8[24] = 0u;
    -[ARCoachingGlyphRenderer setA_vel:](v17, "setA_vel:", 0.0);
    LODWORD(v23) = 0;
    -[ARCoachingGlyphRenderer setRotationAngleY:](v17, "setRotationAngleY:", v23);
    v24 = objc_alloc_init(ARCoachingGlyphState);
    state = v17->_state;
    v17->_state = v24;

    v26 = objc_alloc_init(ARCoachingAnimTime);
    time = v17->_time;
    v17->_time = v26;

    v17->_lastDrawableSize.width = -1.0;
    v17->_lastDrawableSize.height = -1.0;
    v28 = -[ARCoachingDeviceController initWithDeviceMaskImage:geoTrackingMode:]([ARCoachingDeviceController alloc], "initWithDeviceMaskImage:geoTrackingMode:", v15, 0);
    deviceController = v17->_deviceController;
    v17->_deviceController = v28;

    v30 = [ARCoachingDeviceController alloc];
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = v15;
    v32 = -[ARCoachingDeviceController initWithDeviceMaskImage:solidColor:geoTrackingMode:](v30, "initWithDeviceMaskImage:solidColor:geoTrackingMode:", v15, v31, 0);
    parallaxDeviceController = v17->_parallaxDeviceController;
    v17->_parallaxDeviceController = (ARCoachingDeviceController *)v32;

    -[ARCoachingDeviceController setLayerParent:](v17->_parallaxDeviceController, "setLayerParent:", v17->_layer);
    -[ARCoachingDeviceController setLayerParent:](v17->_deviceController, "setLayerParent:", v17->_layer);
    -[CAMetalLayer setAllowsGroupBlending:](v17->_layer, "setAllowsGroupBlending:", 1);
    ARCreateNonFixedPriorityDispatchQueue();
    v34 = objc_claimAutoreleasedReturnValue();
    queue = v17->_queue;
    v17->_queue = (OS_dispatch_queue *)v34;

    v36 = v14;
    v37 = -[ARCoachingMetalSplineData init:]([ARCoachingMetalSplineData alloc], "init:", v14);
    splineData = v17->_splineData;
    v17->_splineData = v37;

    v39 = v17->_splineData;
    -[ARCoachingMetalSplineData shapes](v39, "shapes");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "controlPoints");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "objectAtIndexedSubscript:", 2);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "controlPoints");
    -[ARCoachingMetalSplineData shapes](v17->_splineData, "shapes");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "controlPoints");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "objectAtIndexedSubscript:", 2);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARCoachingMetalSplineData computeShapeBlendWithEnd:endCount:](v39, "computeShapeBlendWithEnd:endCount:", v43, objc_msgSend(v46, "numControlPoints"));

    v47 = objc_alloc_init(ARCoachingQuaternionSpring);
    rotationSpring = v17->_rotationSpring;
    v17->_rotationSpring = v47;

    v49 = v17->_state;
    if (v49)
    {
      -[ARCoachingGlyphState computeQuaternionTarget](v49, "computeQuaternionTarget");
    }
    else
    {
      v123 = 0u;
      v124 = 0u;
    }
    v50 = v17->_rotationSpring;
    v122[0] = v123;
    v122[1] = v124;
    -[ARCoachingQuaternionSpring setTarget:](v50, "setTarget:", v122);
    v51 = v17->_rotationSpring;
    v14 = v36;
    if (v51)
    {
      -[ARCoachingQuaternionSpring target](v51, "target");
    }
    else
    {
      v120 = 0u;
      v121 = 0u;
    }
    v15 = v106;
    v52 = v121;
    *(_OWORD *)v17->_anon_a0 = v120;
    *(_OWORD *)&v17->_anon_a0[16] = v52;
    v53 = objc_alloc_init(ARCoachingSpringDouble3);
    scaleSpring = v17->_scaleSpring;
    v17->_scaleSpring = v53;

    -[ARCoachingSpringDouble3 setResponse:](v17->_scaleSpring, "setResponse:", 0.699999988);
    v56 = v17->_state;
    if (v56)
    {
      -[ARCoachingGlyphState computeScaleTarget](v56, "computeScaleTarget");
      v57 = (int8x16_t)v118[2];
      v58 = vextq_s8(v57, v57, 8uLL).u64[0];
      *(_QWORD *)&v55 = v119;
    }
    else
    {
      v57.i64[0] = 0;
      v58 = 0;
      *(_QWORD *)&v55 = 0;
    }
    v59 = v17->_scaleSpring;
    v57.i64[1] = v58;
    v118[0] = v57;
    v118[1] = v55;
    -[ARCoachingSpringDouble3 setTarget:](v59, "setTarget:", v118);
    v61 = v17->_scaleSpring;
    if (v61)
    {
      -[ARCoachingSpringDouble3 target](v61, "target");
      v62 = (int8x16_t)v116[2];
      v63 = vextq_s8(v62, v62, 8uLL).u64[0];
      *(_QWORD *)&v60 = v117;
      v61 = v17->_scaleSpring;
    }
    else
    {
      v62.i64[0] = 0;
      v63 = 0;
      *(_QWORD *)&v60 = 0;
    }
    v62.i64[1] = v63;
    v116[0] = v62;
    v116[1] = v60;
    -[ARCoachingSpringDouble3 setValue:](v61, "setValue:", v116);
    v64 = objc_alloc_init(ARCoachingSpringDouble3);
    topPlaneTranslationSpring = v17->_topPlaneTranslationSpring;
    v17->_topPlaneTranslationSpring = v64;

    -[ARCoachingSpringDouble3 setResponse:](v17->_topPlaneTranslationSpring, "setResponse:", 0.699999988);
    v67 = v17->_state;
    if (v67)
    {
      -[ARCoachingGlyphState computeTopPlaneTranslationTarget](v67, "computeTopPlaneTranslationTarget");
      v68 = (int8x16_t)v114[2];
      v69 = vextq_s8(v68, v68, 8uLL).u64[0];
      *(_QWORD *)&v66 = v115;
    }
    else
    {
      v68.i64[0] = 0;
      v69 = 0;
      *(_QWORD *)&v66 = 0;
    }
    v70 = v17->_topPlaneTranslationSpring;
    v68.i64[1] = v69;
    v114[0] = v68;
    v114[1] = v66;
    -[ARCoachingSpringDouble3 setTarget:](v70, "setTarget:", v114);
    v72 = v17->_topPlaneTranslationSpring;
    if (v72)
    {
      -[ARCoachingSpringDouble3 target](v72, "target");
      v73 = (int8x16_t)v112[2];
      v74 = vextq_s8(v73, v73, 8uLL).u64[0];
      *(_QWORD *)&v71 = v113;
      v72 = v17->_topPlaneTranslationSpring;
    }
    else
    {
      v73.i64[0] = 0;
      v74 = 0;
      *(_QWORD *)&v71 = 0;
    }
    v73.i64[1] = v74;
    v112[0] = v73;
    v112[1] = v71;
    -[ARCoachingSpringDouble3 setValue:](v72, "setValue:", v112);
    v75 = objc_alloc_init(ARCoachingSpringDouble3);
    bottomPlaneTranslationSpring = v17->_bottomPlaneTranslationSpring;
    v17->_bottomPlaneTranslationSpring = v75;

    -[ARCoachingSpringDouble3 setResponse:](v17->_bottomPlaneTranslationSpring, "setResponse:", 0.699999988);
    v78 = v17->_state;
    if (v78)
    {
      -[ARCoachingGlyphState computeBottomPlaneTranslationTarget](v78, "computeBottomPlaneTranslationTarget");
      v79 = (int8x16_t)v110[2];
      v80 = vextq_s8(v79, v79, 8uLL).u64[0];
      *(_QWORD *)&v77 = v111;
    }
    else
    {
      v79.i64[0] = 0;
      v80 = 0;
      *(_QWORD *)&v77 = 0;
    }
    v81 = v17->_bottomPlaneTranslationSpring;
    v79.i64[1] = v80;
    v110[0] = v79;
    v110[1] = v77;
    -[ARCoachingSpringDouble3 setTarget:](v81, "setTarget:", v110);
    v83 = v17->_bottomPlaneTranslationSpring;
    if (v83)
    {
      -[ARCoachingSpringDouble3 target](v83, "target");
      v84 = (int8x16_t)v108[2];
      v85 = vextq_s8(v84, v84, 8uLL).u64[0];
      *(_QWORD *)&v82 = v109;
      v83 = v17->_bottomPlaneTranslationSpring;
    }
    else
    {
      v84.i64[0] = 0;
      v85 = 0;
      *(_QWORD *)&v82 = 0;
    }
    v84.i64[1] = v85;
    v108[0] = v84;
    v108[1] = v82;
    -[ARCoachingSpringDouble3 setValue:](v83, "setValue:", v108);
    v86 = -[ARCoachingStateSpring initWithValue:]([ARCoachingStateSpring alloc], "initWithValue:", 0.0);
    cubeResolveSpring = v17->_cubeResolveSpring;
    v17->_cubeResolveSpring = v86;

    -[ARFLSpring parameters](v17->_cubeResolveSpring, "parameters");
    v89 = v88;
    -[ARFLSpring parameters](v17->_cubeResolveSpring, "parameters");
    -[ARFLSpring setParameters:](v17->_cubeResolveSpring, "setParameters:", ARFLSpringParametersMake(-[ARFLSpring parameters](v17->_cubeResolveSpring, "parameters"), v89, v90, 0.699999988));
    -[ARFLSpring setTarget:](v17->_cubeResolveSpring, "setTarget:", 0.0);
    -[ARFLSpring setValue:](v17->_cubeResolveSpring, "setValue:", 0.0);
    v91 = -[ARCoachingStateSpring initWithValue:]([ARCoachingStateSpring alloc], "initWithValue:", 0.0);
    planeResolveSpring = v17->_planeResolveSpring;
    v17->_planeResolveSpring = v91;

    -[ARFLSpring parameters](v17->_planeResolveSpring, "parameters");
    v94 = v93;
    -[ARFLSpring parameters](v17->_planeResolveSpring, "parameters");
    -[ARFLSpring setParameters:](v17->_planeResolveSpring, "setParameters:", ARFLSpringParametersMake(-[ARFLSpring parameters](v17->_planeResolveSpring, "parameters"), v94, v95, 0.699999988));
    -[ARFLSpring setTarget:](v17->_planeResolveSpring, "setTarget:", 0.0);
    -[ARFLSpring setValue:](v17->_planeResolveSpring, "setValue:", 0.0);
    v96 = -[ARCoachingStateSpring initWithValue:]([ARCoachingStateSpring alloc], "initWithValue:", 0.0);
    verticalResolvingSpring = v17->_verticalResolvingSpring;
    v17->_verticalResolvingSpring = v96;

    -[ARFLSpring parameters](v17->_verticalResolvingSpring, "parameters");
    -[ARFLSpring setParameters:](v17->_verticalResolvingSpring, "setParameters:");
    -[ARFLSpring setTarget:](v17->_verticalResolvingSpring, "setTarget:", 0.0);
    -[ARFLSpring setValue:](v17->_verticalResolvingSpring, "setValue:", 0.0);
    v98 = -[ARCoachingStateSpring initWithValue:]([ARCoachingStateSpring alloc], "initWithValue:", 0.0);
    alphaSpring = v17->_alphaSpring;
    v17->_alphaSpring = v98;

    -[ARFLSpring setTarget:](v17->_alphaSpring, "setTarget:", 0.0);
    -[ARFLSpring setValue:](v17->_alphaSpring, "setValue:", 0.0);
    v100 = [ARCoachingBasicSpring alloc];
    LODWORD(v101) = 1128792064;
    LODWORD(v102) = 22.0;
    v103 = -[ARCoachingBasicSpring initWithTension:friction:](v100, "initWithTension:friction:", v101, v102);
    orientationSpring = v17->_orientationSpring;
    v17->_orientationSpring = (ARCoachingBasicSpring *)v103;

    -[ARCoachingGlyphState setDelegate:](v17->_state, "setDelegate:", v17);
    v13 = v107;
  }

  return v17;
}

- (void)prepareWithCompletionHandler:(id)a3
{
  id v4;
  MTLDevice *v5;
  void *pixelFormat;
  int sampleCount;
  NSObject *queue;
  MTLDevice *v9;
  id v10;
  _QWORD v11[4];
  MTLDevice *v12;
  id v13;
  id v14[2];
  int v15;
  id location;

  v4 = a3;
  v5 = self->_device;
  pixelFormat = (void *)self->_pixelFormat;
  sampleCount = self->_sampleCount;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__ARCoachingGlyphRenderer_prepareWithCompletionHandler___block_invoke;
  v11[3] = &unk_1EA586D20;
  v12 = v5;
  v9 = v5;
  objc_copyWeak(v14, &location);
  v15 = sampleCount;
  v14[1] = pixelFormat;
  v13 = v4;
  v10 = v4;
  dispatch_async(queue, v11);

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);

}

void __56__ARCoachingGlyphRenderer_prepareWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id WeakRetained;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
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
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  uint64_t v61;
  void (*v62)(void);
  NSObject *v63;
  uint64_t v64;
  NSObject *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  id v69;
  id v70;
  id v71;
  uint8_t buf[4];
  id v73;
  __int16 v74;
  void *v75;
  __int16 v76;
  void *v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  ARKitUIBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLForResource:withExtension:", CFSTR("default"), CFSTR("metallib"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v71 = 0;
    v5 = (void *)objc_msgSend(v2, "newLibraryWithURL:error:", v4, &v71);
    v6 = v71;
    objc_msgSend(v5, "setLabel:", CFSTR("com.apple.arkit.coachinganimation.library"));
    if (v6)
    {
      _ARLogCoaching_6();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        -[NSObject localizedDescription](v6, "localizedDescription");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject localizedFailureReason](v6, "localizedFailureReason");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject localizedRecoverySuggestion](v6, "localizedRecoverySuggestion");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v73 = v8;
        v74 = 2112;
        v75 = v9;
        v76 = 2112;
        v77 = v10;
        _os_log_impl(&dword_1DCC73000, v7, OS_LOG_TYPE_ERROR, "Error while loading metal library for coaching animation\n\tError: %@\n\tReason: %@\n\tSuggestion: %@", buf, 0x20u);

      }
    }
  }
  else
  {
    _ARLogCoaching_6();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DCC73000, v6, OS_LOG_TYPE_ERROR, "Failed to find metal library for coaching animations", buf, 2u);
    }
    v5 = 0;
  }

  v11 = -[ARCoachingDotsRenderer init:pixelFormat:metalLibrary:sampleCount:]([ARCoachingDotsRenderer alloc], "init:pixelFormat:metalLibrary:sampleCount:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), v5, *(unsigned int *)(a1 + 64));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setDotsRenderer:", v11);

  v13 = objc_msgSend(v5, "newFunctionWithName:", CFSTR("tessellation_kernel_quad"));
  v14 = objc_msgSend(v5, "newFunctionWithName:", CFSTR("tessellation_vertex_quad"));
  v15 = objc_msgSend(v5, "newFunctionWithName:", CFSTR("tessellation_fragment"));
  objc_msgSend(MEMORY[0x1E0CC6BD8], "vertexDescriptor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "attributes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFormat:", 30);

  objc_msgSend(v16, "attributes");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setOffset:", 0);

  objc_msgSend(v16, "attributes");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setBufferIndex:", 0);

  objc_msgSend(v16, "attributes");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectAtIndexedSubscript:", 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setFormat:", 28);

  objc_msgSend(v16, "attributes");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectAtIndexedSubscript:", 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setOffset:", 16);

  objc_msgSend(v16, "attributes");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectAtIndexedSubscript:", 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setBufferIndex:", 0);

  objc_msgSend(v16, "layouts");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "objectAtIndexedSubscript:", 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setStepFunction:", 4);

  objc_msgSend(v16, "layouts");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "objectAtIndexedSubscript:", 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setStepRate:", 1);

  objc_msgSend(v16, "layouts");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "objectAtIndexedSubscript:", 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setStride:", 32);

  v35 = objc_alloc_init(MEMORY[0x1E0CC6B68]);
  objc_msgSend(v35, "setVertexDescriptor:", v16);
  objc_msgSend(v35, "setTessellationFactorScaleEnabled:", 0);
  objc_msgSend(v35, "setTessellationFactorFormat:", 0);
  objc_msgSend(v35, "setTessellationControlPointIndexType:", 1);
  objc_msgSend(v35, "setTessellationFactorStepFunction:", 1);
  objc_msgSend(v35, "setTessellationOutputWindingOrder:", 0);
  objc_msgSend(v35, "setTessellationPartitionMode:", 3);
  objc_msgSend(v35, "setMaxTessellationFactor:", 16);
  v68 = (void *)v14;
  objc_msgSend(v35, "setVertexFunction:", v14);
  v67 = (void *)v15;
  objc_msgSend(v35, "setFragmentFunction:", v15);
  objc_msgSend(v35, "colorAttachments");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "objectAtIndexedSubscript:", 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setBlendingEnabled:", 1);

  objc_msgSend(v35, "colorAttachments");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "objectAtIndexedSubscript:", 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setRgbBlendOperation:", 4);

  objc_msgSend(v35, "colorAttachments");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "objectAtIndexedSubscript:", 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setAlphaBlendOperation:", 4);

  objc_msgSend(v35, "colorAttachments");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "objectAtIndexedSubscript:", 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setSourceRGBBlendFactor:", 1);

  objc_msgSend(v35, "colorAttachments");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "objectAtIndexedSubscript:", 0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setSourceAlphaBlendFactor:", 1);

  objc_msgSend(v35, "colorAttachments");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "objectAtIndexedSubscript:", 0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setDestinationRGBBlendFactor:", 5);

  objc_msgSend(v35, "colorAttachments");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "objectAtIndexedSubscript:", 0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setDestinationAlphaBlendFactor:", 5);

  v50 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v35, "colorAttachments");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "objectAtIndexedSubscript:", 0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setPixelFormat:", v50);

  objc_msgSend(v35, "setRasterSampleCount:", *(int *)(a1 + 64));
  v53 = *(void **)(a1 + 32);
  v70 = 0;
  v54 = (void *)objc_msgSend(v53, "newRenderPipelineStateWithDescriptor:error:", v35, &v70);
  v55 = v70;
  if (v54)
  {
    v56 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v56, "setPostTessellationPipelineState:", v54);

    v57 = *(void **)(a1 + 32);
    v69 = 0;
    v58 = (void *)v13;
    v59 = (void *)objc_msgSend(v57, "newComputePipelineStateWithFunction:error:", v13, &v69);
    v55 = v69;
    if (v59)
    {
      v60 = objc_loadWeakRetained((id *)(a1 + 48));
      objc_msgSend(v60, "setComputePipelineState:", v59);

      v61 = *(_QWORD *)(a1 + 40);
      if (!v61)
      {
LABEL_22:

        goto LABEL_23;
      }
      v62 = *(void (**)(void))(v61 + 16);
    }
    else
    {
      _ARLogCoaching_6();
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v73 = v55;
        _os_log_impl(&dword_1DCC73000, v65, OS_LOG_TYPE_ERROR, "Failed to create compute pipeline state object. error %@", buf, 0xCu);
      }

      v66 = *(_QWORD *)(a1 + 40);
      if (!v66)
        goto LABEL_22;
      v62 = *(void (**)(void))(v66 + 16);
    }
    v62();
    goto LABEL_22;
  }
  v58 = (void *)v13;
  _ARLogCoaching_6();
  v63 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v73 = v55;
    _os_log_impl(&dword_1DCC73000, v63, OS_LOG_TYPE_ERROR, "Failed to create post tessellation render pipeline state object. error %@", buf, 0xCu);
  }

  v64 = *(_QWORD *)(a1 + 40);
  if (v64)
    (*(void (**)(uint64_t, id))(v64 + 16))(v64, v55);
LABEL_23:

}

- (void)snapStateChanged
{
  double v3;
  double v4;
  BOOL v5;
  double v6;
  unint64_t v7;
  unint64_t v8;
  double v9;

  -[ARCoachingMetalSplineData recordState](self->_splineData, "recordState");
  -[ARCoachingAnimTime absoluteTime](self->_time, "absoluteTime");
  -[ARCoachingAnimTime setStartTime:](self->_time, "setStartTime:");
  v3 = 1.0;
  if (-[ARCoachingGlyphState snapState](self->_state, "snapState") == 1)
    v4 = 0.0;
  else
    v4 = 1.0;
  -[ARFLSpring setTarget:](self->_planeResolveSpring, "setTarget:", v4);
  v5 = -[ARCoachingGlyphState isVertical](self->_state, "isVertical");
  v6 = 1.0;
  if (!v5)
  {
    v7 = -[ARCoachingGlyphState snapState](self->_state, "snapState", 1.0);
    v6 = 1.0;
    if (v7 != 3)
      v6 = 0.0;
  }
  -[ARFLSpring setTarget:](self->_verticalResolvingSpring, "setTarget:", v6);
  if (-[ARCoachingGlyphState snapState](self->_state, "snapState"))
  {
    if (-[ARCoachingGlyphState snapState](self->_state, "snapState") == 4)
      v3 = 1.0;
    else
      v3 = 0.0;
  }
  -[ARFLSpring setTarget:](self->_cubeResolveSpring, "setTarget:", v3);
  v8 = -[ARCoachingGlyphState snapState](self->_state, "snapState");
  v9 = 1.0;
  if (!v8)
    v9 = 0.0;
  -[ARFLSpring setTarget:](self->_alphaSpring, "setTarget:", v9);
  if (-[ARCoachingGlyphState snapState](self->_state, "snapState") == 1)
  {
    -[ARFLSpring target](self->_planeResolveSpring, "target");
    -[ARFLSpring setValue:](self->_planeResolveSpring, "setValue:");
    -[ARFLSpring target](self->_verticalResolvingSpring, "target");
    -[ARFLSpring setValue:](self->_verticalResolvingSpring, "setValue:");
    -[ARFLSpring target](self->_cubeResolveSpring, "target");
    -[ARFLSpring setValue:](self->_cubeResolveSpring, "setValue:");
    -[ARFLSpring target](self->_alphaSpring, "target");
    -[ARFLSpring setValue:](self->_alphaSpring, "setValue:");
    -[ARCoachingAnimTime setAbsoluteTime:](self->_time, "setAbsoluteTime:", 0.0);
  }
}

- (void)quaternionTargetChanged
{
  ARCoachingGlyphState *state;
  ARCoachingQuaternionSpring *rotationSpring;
  __int128 v5;
  ARCoachingQuaternionSpring *v6;
  ARCoachingQuaternionSpring *v7;
  _OWORD v8[2];
  __int128 v9;
  __int128 v10;
  _OWORD v11[2];
  _OWORD v12[2];
  __int128 v13;
  __int128 v14;

  state = self->_state;
  if (state)
  {
    -[ARCoachingGlyphState quaternionTarget](state, "quaternionTarget");
  }
  else
  {
    v13 = 0u;
    v14 = 0u;
  }
  rotationSpring = self->_rotationSpring;
  v12[0] = v13;
  v12[1] = v14;
  -[ARCoachingQuaternionSpring setTarget:](rotationSpring, "setTarget:", v12);
  v5 = *(_OWORD *)&self->_anon_a0[16];
  v6 = self->_rotationSpring;
  v11[0] = *(_OWORD *)self->_anon_a0;
  v11[1] = v5;
  -[ARCoachingQuaternionSpring setValue:](v6, "setValue:", v11);
  if (-[ARCoachingGlyphState snapState](self->_state, "snapState") == 1)
  {
    v7 = self->_rotationSpring;
    if (v7)
    {
      -[ARCoachingQuaternionSpring target](v7, "target");
      v7 = self->_rotationSpring;
    }
    else
    {
      v9 = 0u;
      v10 = 0u;
    }
    v8[0] = v9;
    v8[1] = v10;
    -[ARCoachingQuaternionSpring setValue:](v7, "setValue:", v8);
  }
}

- (void)scaleTargetChanged
{
  __int128 v2;
  ARCoachingGlyphState *state;
  int8x16_t v5;
  unint64_t v6;
  ARCoachingSpringDouble3 *scaleSpring;
  __int128 v8;
  ARCoachingSpringDouble3 *v9;
  int8x16_t v10;
  unint64_t v11;
  _OWORD v12[3];
  uint64_t v13;
  _OWORD v14[3];
  uint64_t v15;

  state = self->_state;
  if (state)
  {
    -[ARCoachingGlyphState scaleTarget](state, "scaleTarget");
    v5 = (int8x16_t)v14[2];
    v6 = vextq_s8(v5, v5, 8uLL).u64[0];
    *(_QWORD *)&v2 = v15;
  }
  else
  {
    v5.i64[0] = 0;
    v6 = 0;
    *(_QWORD *)&v2 = 0;
  }
  scaleSpring = self->_scaleSpring;
  v5.i64[1] = v6;
  v14[0] = v5;
  v14[1] = v2;
  -[ARCoachingSpringDouble3 setTarget:](scaleSpring, "setTarget:", v14);
  if (-[ARCoachingGlyphState snapState](self->_state, "snapState") == 1)
  {
    v9 = self->_scaleSpring;
    if (v9)
    {
      -[ARCoachingSpringDouble3 target](v9, "target");
      v10 = (int8x16_t)v12[2];
      v11 = vextq_s8(v10, v10, 8uLL).u64[0];
      *(_QWORD *)&v8 = v13;
      v9 = self->_scaleSpring;
    }
    else
    {
      v10.i64[0] = 0;
      v11 = 0;
      *(_QWORD *)&v8 = 0;
    }
    v10.i64[1] = v11;
    v12[0] = v10;
    v12[1] = v8;
    -[ARCoachingSpringDouble3 setValue:](v9, "setValue:", v12);
  }
}

- (void)topPlaneTranslationTargetChanged
{
  __int128 v2;
  ARCoachingGlyphState *state;
  int8x16_t v5;
  unint64_t v6;
  ARCoachingSpringDouble3 *topPlaneTranslationSpring;
  __int128 v8;
  ARCoachingSpringDouble3 *v9;
  int8x16_t v10;
  unint64_t v11;
  _OWORD v12[3];
  uint64_t v13;
  _OWORD v14[3];
  uint64_t v15;

  state = self->_state;
  if (state)
  {
    -[ARCoachingGlyphState topPlaneTranslationTarget](state, "topPlaneTranslationTarget");
    v5 = (int8x16_t)v14[2];
    v6 = vextq_s8(v5, v5, 8uLL).u64[0];
    *(_QWORD *)&v2 = v15;
  }
  else
  {
    v5.i64[0] = 0;
    v6 = 0;
    *(_QWORD *)&v2 = 0;
  }
  topPlaneTranslationSpring = self->_topPlaneTranslationSpring;
  v5.i64[1] = v6;
  v14[0] = v5;
  v14[1] = v2;
  -[ARCoachingSpringDouble3 setTarget:](topPlaneTranslationSpring, "setTarget:", v14);
  if (-[ARCoachingGlyphState snapState](self->_state, "snapState") == 1)
  {
    v9 = self->_topPlaneTranslationSpring;
    if (v9)
    {
      -[ARCoachingSpringDouble3 target](v9, "target");
      v10 = (int8x16_t)v12[2];
      v11 = vextq_s8(v10, v10, 8uLL).u64[0];
      *(_QWORD *)&v8 = v13;
      v9 = self->_topPlaneTranslationSpring;
    }
    else
    {
      v10.i64[0] = 0;
      v11 = 0;
      *(_QWORD *)&v8 = 0;
    }
    v10.i64[1] = v11;
    v12[0] = v10;
    v12[1] = v8;
    -[ARCoachingSpringDouble3 setValue:](v9, "setValue:", v12);
  }
}

- (void)bottomPlaneTranslationTargetChanged
{
  __int128 v2;
  ARCoachingGlyphState *state;
  int8x16_t v5;
  unint64_t v6;
  ARCoachingSpringDouble3 *bottomPlaneTranslationSpring;
  __int128 v8;
  ARCoachingSpringDouble3 *v9;
  int8x16_t v10;
  unint64_t v11;
  _OWORD v12[3];
  uint64_t v13;
  _OWORD v14[3];
  uint64_t v15;

  state = self->_state;
  if (state)
  {
    -[ARCoachingGlyphState bottomPlaneTranslationTarget](state, "bottomPlaneTranslationTarget");
    v5 = (int8x16_t)v14[2];
    v6 = vextq_s8(v5, v5, 8uLL).u64[0];
    *(_QWORD *)&v2 = v15;
  }
  else
  {
    v5.i64[0] = 0;
    v6 = 0;
    *(_QWORD *)&v2 = 0;
  }
  bottomPlaneTranslationSpring = self->_bottomPlaneTranslationSpring;
  v5.i64[1] = v6;
  v14[0] = v5;
  v14[1] = v2;
  -[ARCoachingSpringDouble3 setTarget:](bottomPlaneTranslationSpring, "setTarget:", v14);
  if (-[ARCoachingGlyphState snapState](self->_state, "snapState") == 1)
  {
    v9 = self->_bottomPlaneTranslationSpring;
    if (v9)
    {
      -[ARCoachingSpringDouble3 target](v9, "target");
      v10 = (int8x16_t)v12[2];
      v11 = vextq_s8(v10, v10, 8uLL).u64[0];
      *(_QWORD *)&v8 = v13;
      v9 = self->_bottomPlaneTranslationSpring;
    }
    else
    {
      v10.i64[0] = 0;
      v11 = 0;
      *(_QWORD *)&v8 = 0;
    }
    v10.i64[1] = v11;
    v12[0] = v10;
    v12[1] = v8;
    -[ARCoachingSpringDouble3 setValue:](v9, "setValue:", v12);
  }
}

- (void)generateTexturesWithSize:(CGSize)a3
{
  MTLTexture *msaaTex;
  MTLTexture *v6;
  MTLTexture *v7;
  id v8;

  if (a3.width != *MEMORY[0x1E0C9D820] || a3.height != *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    if (self->_sampleCount == 1)
    {
      msaaTex = self->_msaaTex;
      self->_msaaTex = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", self->_pixelFormat, (int)a3.width, (int)a3.height, 0);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setUsage:", 4);
      objc_msgSend(v8, "setTextureType:", 4);
      objc_msgSend(v8, "setSampleCount:", self->_sampleCount);
      objc_msgSend(v8, "setStorageMode:", 3);
      v6 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v8);
      v7 = self->_msaaTex;
      self->_msaaTex = v6;

      msaaTex = (MTLTexture *)v8;
    }

  }
}

- (void)computeTesselationFactorsForCommandBuffer:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int64x2_t v8;
  int64x2_t v9;
  uint64_t v10;

  objc_msgSend(a3, "computeCommandEncoder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLabel:", CFSTR("Compute Command Encoder"));
  objc_msgSend(v4, "pushDebugGroup:", CFSTR("Compute Tessellation Factors"));
  objc_msgSend(v4, "setComputePipelineState:", self->_computePipelineState);
  objc_msgSend(v4, "setBytes:length:atIndex:", &self->_edgeFactor, 4, 0);
  objc_msgSend(v4, "setBytes:length:atIndex:", &self->_insideFactor, 4, 1);
  -[ARCoachingMetalSplineData tessellationFactorsBuffer](self->_splineData, "tessellationFactorsBuffer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBuffer:offset:atIndex:", v5, 0, 2);

  -[ARCoachingMetalSplineData patchUserDataBuffer](self->_splineData, "patchUserDataBuffer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBuffer:offset:atIndex:", v6, 0, 3);

  v9 = vdupq_n_s64(1uLL);
  v10 = 1;
  v7 = -[ARCoachingMetalSplineData patchCount](self->_splineData, "patchCount");
  v8 = v9;
  objc_msgSend(v4, "dispatchThreadgroups:threadsPerThreadgroup:", &v9, &v7);
  objc_msgSend(v4, "popDebugGroup");
  objc_msgSend(v4, "endEncoding");

}

- (void)renderPostTessellationInDrawable:(id)a3 withCommandBuffer:(id)a4
{
  id v6;
  id v7;
  double v8;
  float64_t v10;
  float32x2_t v11;
  double v16;
  float32x4_t v17;
  float32x4_t v18;
  void *v19;
  int sampleCount;
  void *msaaTex;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  float v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  unsigned int v41;
  __int128 v42;
  float32x4_t v43;
  float32x4_t v44;
  float32x4_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  float32x4_t v49;
  float32x4_t v50;
  float32x4_t v51;
  float32x4_t v52;
  __int128 v53;
  float32x4_t v54;
  float32x4_t v55;
  float32x4_t v56;
  uint64_t v57;
  uint64_t v58;
  float32x4_t v59;
  float32x4_t v60;
  float32x4_t v61;
  float32x4_t v62;
  double v63;
  ARCoachingDotsRenderer *dotsRenderer;
  MTLDevice *device;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  __int128 v71;
  float v72;
  __float2 v73;
  uint64_t v74;
  float32x4_t v75;
  float64x2_t v76;
  float32x4_t v77;
  float32x4_t v78;
  float32x4_t v79;
  float32x4_t v80;
  float32x4_t v81;
  float32x4_t v82;
  __int128 v83;
  uint64_t v84;
  float32x4_t v85;
  float32x4_t v86;
  float32x4_t v87;
  double v88;
  uint64_t v89;
  __int128 v90;
  float32x4_t v91;
  float32x4_t v92;
  float32x4_t v93;
  void *v94;
  void *v95;
  void *v96;
  uint64_t v97;
  void *v98;
  void *v99;
  float32x4_t v100;
  double v101;
  float32x4_t v102;
  double v103;
  float32x4_t v104;
  double v105;
  float32x4_t v106;
  double v107;
  float32x4_t v108;
  double v109;
  float32x4_t v110;
  float32x4_t v111;
  float32x4_t v112;
  float32x4_t v113;
  float32x4_t v114;
  float32x4_t v115;
  float32x4_t v116;
  __int128 v117;
  float32x4_t v118;
  float32x4_t v119;
  float64_t v120;
  float32x2_t v121;
  float32x4_t v122;
  float32x4_t v123;
  __int128 v124;
  float32x4_t v125;
  float32x4_t v126;
  float32x4_t v127;
  __int128 v128;
  uint64_t v129;
  int v130;
  float32x2_t v131;
  __int128 v132;
  float32x4_t v133;
  float32x4_t v134;
  float32x4_t v135;
  __int128 v136;
  float32x4_t v137;
  float32x4_t v138;
  float32x4_t v139;

  v6 = a3;
  v7 = a4;
  -[ARFLSpring value](self->_planeResolveSpring, "value");
  v120 = v8;
  -[ARFLSpring value](self->_cubeResolveSpring, "value");
  _Q1.f64[0] = v120;
  _Q1.f64[1] = v10;
  v11 = vmaxnm_f32(vcvt_f32_f64(_Q1), 0);
  __asm { FMOV            V1.2S, #1.0 }
  v121 = vminnm_f32(v11, *(float32x2_t *)&_Q1.f64[0]);
  v131 = v121;
  -[ARFLSpring value](self->_alphaSpring, "value");
  *(float *)&v16 = fmin(fmax(v16, 0.0), 1.0);
  v130 = LODWORD(v16);
  v17 = vmlaq_lane_f32(*(float32x4_t *)&self->_anon_1b0[16], vsubq_f32(*(float32x4_t *)&self->_anon_170[16], *(float32x4_t *)&self->_anon_1b0[16]), v121, 1);
  *(float32x4_t *)self->_anon_130 = vmlaq_lane_f32(*(float32x4_t *)self->_anon_1b0, vsubq_f32(*(float32x4_t *)self->_anon_170, *(float32x4_t *)self->_anon_1b0), v121, 1);
  *(float32x4_t *)&self->_anon_130[16] = v17;
  v18 = vmlaq_lane_f32(*(float32x4_t *)&self->_anon_1b0[48], vsubq_f32(*(float32x4_t *)&self->_anon_170[48], *(float32x4_t *)&self->_anon_1b0[48]), v121, 1);
  *(float32x4_t *)&self->_anon_130[32] = vmlaq_lane_f32(*(float32x4_t *)&self->_anon_1b0[32], vsubq_f32(*(float32x4_t *)&self->_anon_170[32], *(float32x4_t *)&self->_anon_1b0[32]), v121, 1);
  *(float32x4_t *)&self->_anon_130[48] = v18;
  objc_msgSend(MEMORY[0x1E0CC6B50], "renderPassDescriptor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  sampleCount = self->_sampleCount;
  if (sampleCount >= 2)
  {
    msaaTex = self->_msaaTex;
  }
  else
  {
    objc_msgSend(v6, "texture");
    msaaTex = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v19, "colorAttachments");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setTexture:", msaaTex);

  if (sampleCount <= 1)
  v24 = self->_sampleCount;
  if (v24 < 2)
  {
    v25 = 0;
  }
  else
  {
    objc_msgSend(v6, "texture");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26 = v121.f32[1];
  objc_msgSend(v19, "colorAttachments");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectAtIndexedSubscript:", 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setResolveTexture:", v25);

  if (v24 >= 2)
  objc_msgSend(v19, "colorAttachments");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "objectAtIndexedSubscript:", 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setClearColor:", 0.0, 0.0, 0.0, 0.0);

  if (self->_sampleCount <= 1)
    v31 = 1;
  else
    v31 = 2;
  objc_msgSend(v19, "colorAttachments");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "objectAtIndexedSubscript:", 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setStoreAction:", v31);

  objc_msgSend(v19, "colorAttachments");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "objectAtIndexedSubscript:", 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setLoadAction:", 2);

  objc_msgSend(v7, "renderCommandEncoderWithDescriptor:", v19);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setLabel:", CFSTR("Render Command Encoder"));
  objc_msgSend(v36, "pushDebugGroup:", CFSTR("Dots"));
  -[ARFLSpring value](self->_verticalResolvingSpring, "value");
  v109 = v37;
  -[ARFLSpring value](self->_verticalResolvingSpring, "value");
  v38 = 1.0 - v121.f32[1];
  v40 = v39 * v38;
  *(float *)&v41 = 0.5 * (v39 * v38);
  +[ARCoachingTransformations translate:](ARCoachingTransformations, "translate:", COERCE_DOUBLE((unint64_t)v41));
  v114 = v43;
  v117 = v42;
  v110 = v45;
  v111 = v44;
  -[ARCoachingMetalSplineData instanceTransforms](self->_splineData, "instanceTransforms");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "firstObject");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "transform");
  v48 = 0;
  v49 = *(float32x4_t *)self->_anon_f0;
  v50 = *(float32x4_t *)&self->_anon_f0[16];
  v51 = *(float32x4_t *)&self->_anon_f0[32];
  v52 = *(float32x4_t *)&self->_anon_f0[48];
  v132 = v53;
  v133 = v54;
  v134 = v55;
  v135 = v56;
  v136 = 0u;
  v137 = 0u;
  v138 = 0u;
  v139 = 0u;
  do
  {
    *(__int128 *)((char *)&v136 + v48) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v49, COERCE_FLOAT(*(__int128 *)((char *)&v132 + v48))), v50, *(float32x2_t *)((char *)&v132 + v48), 1), v51, *(float32x4_t *)((char *)&v132 + v48), 2), v52, *(float32x4_t *)((char *)&v132 + v48), 3);
    v48 += 16;
  }
  while (v48 != 64);
  v104 = v137;
  v106 = (float32x4_t)v136;
  v100 = v139;
  v102 = v138;

  v57 = 0;
  v132 = v117;
  v133 = v114;
  v134 = v111;
  v135 = v110;
  v136 = 0u;
  v137 = 0u;
  v138 = 0u;
  v139 = 0u;
  do
  {
    *(__int128 *)((char *)&v136 + v57) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v106, COERCE_FLOAT(*(__int128 *)((char *)&v132 + v57))), v104, *(float32x2_t *)((char *)&v132 + v57), 1), v102, *(float32x4_t *)((char *)&v132 + v57), 2), v100, *(float32x4_t *)((char *)&v132 + v57), 3);
    v57 += 16;
  }
  while (v57 != 64);
  v58 = 0;
  v59 = *(float32x4_t *)self->_anon_130;
  v60 = *(float32x4_t *)&self->_anon_130[16];
  v61 = *(float32x4_t *)&self->_anon_130[32];
  v62 = *(float32x4_t *)&self->_anon_130[48];
  v132 = v136;
  v133 = v137;
  v134 = v138;
  v135 = v139;
  v136 = 0u;
  v137 = 0u;
  v138 = 0u;
  v139 = 0u;
  do
  {
    *(__int128 *)((char *)&v136 + v58) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v59, COERCE_FLOAT(*(__int128 *)((char *)&v132 + v58))), v60, *(float32x2_t *)((char *)&v132 + v58), 1), v61, *(float32x4_t *)((char *)&v132 + v58), 2), v62, *(float32x4_t *)((char *)&v132 + v58), 3);
    v58 += 16;
  }
  while (v58 != 64);
  v105 = *(double *)v138.i64;
  v107 = *(double *)v139.i64;
  v101 = *(double *)&v136;
  v103 = *(double *)v137.i64;
  v128 = 0uLL;
  v129 = 0;
  v136 = kARCoachingDotsRenderParamsHorizontal;
  v137.i64[0] = 1077936128;
  v132 = kARCoachingDotsRenderParamsVertical;
  v133.i64[0] = 0x3E20D97C40200000;
  *(float *)&v63 = ARCoachingDotsRenderParamsLerp((uint64_t)&v136, (uint64_t)&v132, (uint64_t)&v128, v40);
  dotsRenderer = self->_dotsRenderer;
  device = self->_device;
  -[ARFLSpring value](self->_cubeResolveSpring, "value", v63);
  v67 = 1.0 - v66;
  -[ARFLSpring value](self->_planeResolveSpring, "value");
  *(float *)&v67 = v67 * v68;
  -[ARCoachingAnimTime absoluteTime](self->_time, "absoluteTime");
  v136 = v128;
  v137.i64[0] = v129;
  LODWORD(v69) = LODWORD(v67);
  -[ARCoachingDotsRenderer encode:renderCommandEncoder:mvp:visibility:renderParams:time:](dotsRenderer, "encode:renderCommandEncoder:mvp:visibility:renderParams:time:", device, v36, &v136, v101, v103, v105, v107, v69, v70);
  objc_msgSend(v36, "popDebugGroup");
  if (-[ARCoachingGlyphState isVertical](self->_state, "isVertical")
    && -[ARCoachingGlyphState snapState](self->_state, "snapState") == 4)
  {
    v71 = xmmword_1DCCA1230;
  }
  else
  {
    v71 = xmmword_1DCCA0E60;
  }
  v108 = (float32x4_t)v71;
  -[ARCoachingBasicSpring output](self->_orientationSpring, "output");
  v73 = __sincosf_stret(v72 * 0.5);
  v74 = 0;
  v75 = vmulq_n_f32(v108, v73.__sinval);
  v75.i32[3] = LODWORD(v73.__cosval);
  v76.f64[0] = v109;
  v76.f64[1] = 1.0 - v109;
  v77 = (float32x4_t)vmulq_f64(v76, (float64x2_t)xmmword_1DCCA1670);
  v126 = 0u;
  v127 = 0u;
  *(float32x2_t *)v77.f32 = vcvt_f32_f64((float64x2_t)v77);
  v124 = 0u;
  v125 = 0u;
  v78 = vaddq_f32(v110, vmulq_lane_f32(v77, v121, 1));
  v79 = *(float32x4_t *)self->_anon_f0;
  v80 = *(float32x4_t *)&self->_anon_f0[16];
  v81 = *(float32x4_t *)&self->_anon_f0[32];
  v82 = *(float32x4_t *)&self->_anon_f0[48];
  v132 = v117;
  v133 = v114;
  v134 = v111;
  v135 = v78;
  v136 = 0u;
  v137 = 0u;
  v138 = 0u;
  v139 = 0u;
  do
  {
    *(__int128 *)((char *)&v136 + v74) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v79, COERCE_FLOAT(*(__int128 *)((char *)&v132 + v74))), v80, *(float32x2_t *)((char *)&v132 + v74), 1), v81, *(float32x4_t *)((char *)&v132 + v74), 2), v82, *(float32x4_t *)((char *)&v132 + v74), 3);
    v74 += 16;
  }
  while (v74 != 64);
  v118 = v137;
  v122 = (float32x4_t)v136;
  v112 = v139;
  v115 = v138;
  *(double *)&v83 = simd_matrix4x4(v75);
  v84 = 0;
  v132 = v83;
  v133 = v85;
  v134 = v86;
  v135 = v87;
  v136 = 0u;
  v137 = 0u;
  v138 = 0u;
  v139 = 0u;
  do
  {
    *(__int128 *)((char *)&v136 + v84) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v122, COERCE_FLOAT(*(__int128 *)((char *)&v132 + v84))), v118, *(float32x2_t *)((char *)&v132 + v84), 1), v115, *(float32x4_t *)((char *)&v132 + v84), 2), v112, *(float32x4_t *)((char *)&v132 + v84), 3);
    v84 += 16;
  }
  while (v84 != 64);
  v119 = v137;
  v123 = (float32x4_t)v136;
  v113 = v139;
  v116 = v138;
  v88 = v38 + (float)(v26 * 0.85);
  *(float *)&v88 = v88;
  +[ARCoachingTransformations scale:](ARCoachingTransformations, "scale:", *(double *)vdupq_lane_s32(*(int32x2_t *)&v88, 0).i64);
  v89 = 0;
  v132 = v90;
  v133 = v91;
  v134 = v92;
  v135 = v93;
  v136 = 0u;
  v137 = 0u;
  v138 = 0u;
  v139 = 0u;
  do
  {
    *(__int128 *)((char *)&v136 + v89) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v123, COERCE_FLOAT(*(__int128 *)((char *)&v132 + v89))), v119, *(float32x2_t *)((char *)&v132 + v89), 1), v116, *(float32x4_t *)((char *)&v132 + v89), 2), v113, *(float32x4_t *)((char *)&v132 + v89), 3);
    v89 += 16;
  }
  while (v89 != 64);
  v124 = v136;
  v125 = v137;
  v126 = v138;
  v127 = v139;
  objc_msgSend(v36, "pushDebugGroup:", CFSTR("Post Tessellation and Render"));
  objc_msgSend(v36, "setRenderPipelineState:", self->_postTessellationPipelineState);
  -[ARCoachingMetalSplineData controlPointsBuffer](self->_splineData, "controlPointsBuffer");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setVertexBuffer:offset:atIndex:", v94, 0, 0);

  -[ARCoachingMetalSplineData instanceBuffer](self->_splineData, "instanceBuffer");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setVertexBuffer:offset:atIndex:", v95, 0, 1);

  objc_msgSend(v36, "setVertexBytes:length:atIndex:", &v124, 64, 2);
  objc_msgSend(v36, "setVertexBytes:length:atIndex:", self->_anon_130, 64, 3);
  objc_msgSend(v36, "setVertexBytes:length:atIndex:", &self->_strokeWeight, 4, 4);
  objc_msgSend(v36, "setVertexBytes:length:atIndex:", &v131, 8, 5);
  objc_msgSend(v36, "setVertexBytes:length:atIndex:", &v130, 4, 6);
  -[ARCoachingMetalSplineData tessellationFactorsBuffer](self->_splineData, "tessellationFactorsBuffer");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setTessellationFactorBuffer:offset:instanceStride:", v96, 0, 0);

  v97 = -[ARCoachingMetalSplineData patchCount](self->_splineData, "patchCount");
  -[ARCoachingMetalSplineData controlPointIndicesBuffer](self->_splineData, "controlPointIndicesBuffer");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARCoachingMetalSplineData instanceTransforms](self->_splineData, "instanceTransforms");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "drawIndexedPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPointIndexBufferOffset:instanceCount:baseInstance:", 4, 0, v97, 0, 0, v98, 0, objc_msgSend(v99, "count"), 0);

  objc_msgSend(v36, "popDebugGroup");
  objc_msgSend(v36, "endEncoding");

}

- (void)updateAngularVelocity
{
  float v3;
  double v4;
  float v5;
  __int128 v6;
  double v7;
  __int128 v8;

  -[ARCoachingGlyphRenderer a_vel](self, "a_vel");
  *(float *)&v4 = v3 * 0.97;
  -[ARCoachingGlyphRenderer setA_vel:](self, "setA_vel:", v4);
  -[ARCoachingGlyphRenderer a_vel](self, "a_vel");
  self->_angularVelocity.angle = self->_angularVelocity.angle + v5 + (self->_angularVelocity.angle + v5) * -0.01;
  if (-[ARCoachingGlyphState isVertical](self->_state, "isVertical")
    && -[ARCoachingGlyphState snapState](self->_state, "snapState") == 4)
  {
    v7 = 0.0;
    *(_QWORD *)&v8 = 1.0;
  }
  else
  {
    *(_QWORD *)&v8 = 0;
    v7 = 1.0;
  }
  *(_QWORD *)&v6 = 0;
  *((double *)&v8 + 1) = v7;
  *(_OWORD *)&self->_anon_c8[8] = v8;
  *(_OWORD *)&self->_anon_c8[24] = v6;
}

- (void)stepSprings:(double)a3
{
  ARCoachingQuaternionSpring *rotationSpring;
  __int128 v6;
  __int128 v7;

  -[ARCoachingQuaternionSpring stepWithDeltaTime:](self->_rotationSpring, "stepWithDeltaTime:");
  -[ARCoachingSpringDouble3 stepWithDeltaTime:](self->_scaleSpring, "stepWithDeltaTime:", a3);
  -[ARCoachingSpringDouble3 stepWithDeltaTime:](self->_topPlaneTranslationSpring, "stepWithDeltaTime:", a3);
  -[ARCoachingSpringDouble3 stepWithDeltaTime:](self->_bottomPlaneTranslationSpring, "stepWithDeltaTime:", a3);
  -[ARFLSpring step:](self->_cubeResolveSpring, "step:", a3);
  -[ARFLSpring step:](self->_planeResolveSpring, "step:", a3);
  -[ARFLSpring step:](self->_verticalResolvingSpring, "step:", a3);
  -[ARFLSpring step:](self->_alphaSpring, "step:", a3);
  -[ARCoachingBasicSpring stepWithDeltaTime:](self->_orientationSpring, "stepWithDeltaTime:", a3);
  rotationSpring = self->_rotationSpring;
  if (rotationSpring)
  {
    -[ARCoachingQuaternionSpring value](rotationSpring, "value");
  }
  else
  {
    v6 = 0u;
    v7 = 0u;
  }
  *(_OWORD *)self->_anon_a0 = v6;
  *(_OWORD *)&self->_anon_a0[16] = v7;
}

- (void)resetSprings
{
  ARCoachingQuaternionSpring *rotationSpring;
  __int128 v4;
  ARCoachingSpringDouble3 *scaleSpring;
  int8x16_t v6;
  unint64_t v7;
  __int128 v8;
  ARCoachingSpringDouble3 *topPlaneTranslationSpring;
  int8x16_t v10;
  unint64_t v11;
  __int128 v12;
  ARCoachingSpringDouble3 *bottomPlaneTranslationSpring;
  int8x16_t v14;
  unint64_t v15;
  ARCoachingQuaternionSpring *v16;
  __int128 v17;
  __int128 v18;
  _OWORD v19[3];
  uint64_t v20;
  _OWORD v21[3];
  uint64_t v22;
  _OWORD v23[3];
  uint64_t v24;
  _OWORD v25[2];
  __int128 v26;
  __int128 v27;

  rotationSpring = self->_rotationSpring;
  if (rotationSpring)
  {
    -[ARCoachingQuaternionSpring target](rotationSpring, "target");
    rotationSpring = self->_rotationSpring;
  }
  else
  {
    v26 = 0u;
    v27 = 0u;
  }
  v25[0] = v26;
  v25[1] = v27;
  -[ARCoachingQuaternionSpring setValue:](rotationSpring, "setValue:", v25);
  scaleSpring = self->_scaleSpring;
  if (scaleSpring)
  {
    -[ARCoachingSpringDouble3 target](scaleSpring, "target");
    v6 = (int8x16_t)v23[2];
    v7 = vextq_s8(v6, v6, 8uLL).u64[0];
    *(_QWORD *)&v4 = v24;
    scaleSpring = self->_scaleSpring;
  }
  else
  {
    v6.i64[0] = 0;
    v7 = 0;
    *(_QWORD *)&v4 = 0;
  }
  v6.i64[1] = v7;
  v23[0] = v6;
  v23[1] = v4;
  -[ARCoachingSpringDouble3 setValue:](scaleSpring, "setValue:", v23);
  topPlaneTranslationSpring = self->_topPlaneTranslationSpring;
  if (topPlaneTranslationSpring)
  {
    -[ARCoachingSpringDouble3 target](topPlaneTranslationSpring, "target");
    v10 = (int8x16_t)v21[2];
    v11 = vextq_s8(v10, v10, 8uLL).u64[0];
    *(_QWORD *)&v8 = v22;
    topPlaneTranslationSpring = self->_topPlaneTranslationSpring;
  }
  else
  {
    v10.i64[0] = 0;
    v11 = 0;
    *(_QWORD *)&v8 = 0;
  }
  v10.i64[1] = v11;
  v21[0] = v10;
  v21[1] = v8;
  -[ARCoachingSpringDouble3 setValue:](topPlaneTranslationSpring, "setValue:", v21);
  bottomPlaneTranslationSpring = self->_bottomPlaneTranslationSpring;
  if (bottomPlaneTranslationSpring)
  {
    -[ARCoachingSpringDouble3 target](bottomPlaneTranslationSpring, "target");
    v14 = (int8x16_t)v19[2];
    v15 = vextq_s8(v14, v14, 8uLL).u64[0];
    *(_QWORD *)&v12 = v20;
    bottomPlaneTranslationSpring = self->_bottomPlaneTranslationSpring;
  }
  else
  {
    v14.i64[0] = 0;
    v15 = 0;
    *(_QWORD *)&v12 = 0;
  }
  v14.i64[1] = v15;
  v19[0] = v14;
  v19[1] = v12;
  -[ARCoachingSpringDouble3 setValue:](bottomPlaneTranslationSpring, "setValue:", v19);
  -[ARFLSpring target](self->_cubeResolveSpring, "target");
  -[ARFLSpring setValue:](self->_cubeResolveSpring, "setValue:");
  -[ARFLSpring target](self->_planeResolveSpring, "target");
  -[ARFLSpring setValue:](self->_planeResolveSpring, "setValue:");
  -[ARFLSpring target](self->_verticalResolvingSpring, "target");
  -[ARFLSpring setValue:](self->_verticalResolvingSpring, "setValue:");
  -[ARFLSpring target](self->_alphaSpring, "target");
  -[ARFLSpring setValue:](self->_alphaSpring, "setValue:");
  v16 = self->_rotationSpring;
  if (v16)
  {
    -[ARCoachingQuaternionSpring value](v16, "value");
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
  }
  *(_OWORD *)self->_anon_a0 = v17;
  *(_OWORD *)&self->_anon_a0[16] = v18;
}

- (void)computeRotation:(double)a3
{
  unsigned __int8 *anon_a0;
  float64x2_t v5;
  float64x2_t v6;
  float64x2_t *v7;
  float64x2_t *v8;
  float64x2_t v9;
  float64x2_t v10;
  __double2 v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  float64x2_t v20;
  float64x2_t v21;
  float64x2_t v22[2];
  float64x2_t v23;
  float64x2_t v24;
  float64x2_t v25;
  float64x2_t v26;

  v5 = *(float64x2_t *)self->_anon_a0;
  v6 = *(float64x2_t *)&self->_anon_a0[16];
  anon_a0 = self->_anon_a0;
  if (vaddvq_f64(vaddq_f64(vmulq_f64(v5, v5), vmulq_f64(v6, v6))) >= 0.0)
  {
    v25 = *(float64x2_t *)self->_anon_a0;
    v26 = v6;
    v23 = v5;
    v24 = v6;
    v7 = &v25;
    v8 = &v23;
  }
  else
  {
    v25 = vnegq_f64(v5);
    v26 = vnegq_f64(v6);
    v23 = v5;
    v24 = v6;
    v7 = &v23;
    v8 = &v25;
  }
  _simd_slerp_internal(v7, v8, v22);
  v9 = v22[1];
  *(float64x2_t *)anon_a0 = v22[0];
  *((float64x2_t *)anon_a0 + 1) = v9;
  v20 = *(float64x2_t *)&self->_anon_c8[8];
  v21 = *(float64x2_t *)&self->_anon_c8[24];
  v11 = __sincos_stret(self->_angularVelocity.angle * 0.5);
  v10.f64[0] = v11.__sinval;
  v12 = vmulq_n_f64(v20, v11.__sinval);
  *(_QWORD *)&v10.f64[0] = *(_OWORD *)&vmulq_f64(v21, v10);
  v10.f64[1] = v11.__cosval;
  v13 = *(float64x2_t *)self->_anon_a0;
  v14 = vnegq_f64(v12);
  v15 = (float64x2_t)vextq_s8((int8x16_t)v10, (int8x16_t)vnegq_f64(v10), 8uLL);
  *(double *)&v16 = simd_matrix4x4(vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vaddq_f64(vmlaq_n_f64(vmulq_laneq_f64(v12, *(float64x2_t *)&self->_anon_a0[16], 1), (float64x2_t)vextq_s8((int8x16_t)v14, (int8x16_t)v12, 8uLL), *(double *)&self->_anon_a0[16]), vmlaq_n_f64(vmulq_laneq_f64(v10, v13, 1), v15, v13.f64[0]))), vaddq_f64(vmlaq_n_f64(vmulq_laneq_f64(v10, *(float64x2_t *)&self->_anon_a0[16], 1), v15, *(double *)&self->_anon_a0[16]), vmlaq_n_f64(vmulq_laneq_f64(v14, v13, 1), (float64x2_t)vextq_s8((int8x16_t)v12, (int8x16_t)v14, 8uLL), v13.f64[0]))));
  *(_OWORD *)self->_anon_f0 = v16;
  *(_OWORD *)&self->_anon_f0[16] = v17;
  *(_OWORD *)&self->_anon_f0[32] = v18;
  *(_OWORD *)&self->_anon_f0[48] = v19;
}

- (void)drawWithTimeDelta:(double)a3 drawable:(id)a4 commandBuffer:(id)a5
{
  ARCoachingAnimTime *time;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  int32x2_t v14;
  ARCoachingMetalSplineData *splineData;
  float32x4_t v16;
  ARCoachingMetalSplineData *v17;
  ARCoachingMetalSplineData *v18;
  ARCoachingMetalSplineData *v19;
  ARCoachingMetalSplineData *v20;
  ARCoachingMetalSplineData *v21;
  ARCoachingMetalSplineData *v22;
  ARCoachingMetalSplineData *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  double v32;
  void *v33;
  ARCoachingMetalSplineData *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  ARCoachingDeviceController *deviceController;
  CAMetalLayer *layer;
  float v55;
  ARCoachingDeviceController *parallaxDeviceController;
  CAMetalLayer *v57;
  unsigned int v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  int32x2_t v67;
  void *v68;
  void *v69;
  id v70;
  id v71;
  __int128 v72;
  uint64_t v73;
  __int128 v74;
  uint64_t v75;
  __int128 v76;
  uint64_t v77;

  v71 = a4;
  v70 = a5;
  -[ARCoachingGlyphRenderer stepSprings:](self, "stepSprings:", a3);
  time = self->_time;
  if (-[ARCoachingGlyphState snapState](self->_state, "snapState") == 1)
    v9 = 0.0;
  else
    v9 = a3;
  -[ARCoachingAnimTime absoluteTime](time, "absoluteTime");
  -[ARCoachingAnimTime setAbsoluteTime:](time, "setAbsoluteTime:", v10 + v9);
  -[ARFLSpring value](self->_cubeResolveSpring, "value");
  v12 = fmin(fmax(v11, 0.0), 1.0);
  -[ARCoachingAnimTime oscillatingTime](self->_time, "oscillatingTime");
  *(double *)&v14 = v12 * v13 * 0.05;
  *(float *)v14.i32 = *(double *)v14.i32;
  v67 = v14;
  splineData = self->_splineData;
  -[ARCoachingSpringDouble3 floatValue](self->_scaleSpring, "floatValue");
  -[ARCoachingMetalSplineData computeInstanceTransformScale:](splineData, "computeInstanceTransformScale:", *(double *)vaddq_f32(v16, (float32x4_t)vdupq_lane_s32(v67, 0)).i64);
  v17 = self->_splineData;
  -[ARCoachingSpringDouble3 floatValue](self->_bottomPlaneTranslationSpring, "floatValue");
  -[ARCoachingMetalSplineData computeInstanceTransformTranslate:index:](v17, "computeInstanceTransformTranslate:index:", 0);
  v18 = self->_splineData;
  -[ARCoachingSpringDouble3 floatValue](self->_topPlaneTranslationSpring, "floatValue");
  -[ARCoachingMetalSplineData computeInstanceTransformTranslate:index:](v18, "computeInstanceTransformTranslate:index:", 1);
  v19 = self->_splineData;
  -[ARCoachingSpringDouble3 floatValue](self->_bottomPlaneTranslationSpring, "floatValue");
  -[ARCoachingMetalSplineData computeInstanceTransformTranslate:index:](v19, "computeInstanceTransformTranslate:index:", 2);
  v20 = self->_splineData;
  -[ARCoachingSpringDouble3 floatValue](self->_bottomPlaneTranslationSpring, "floatValue");
  -[ARCoachingMetalSplineData computeInstanceTransformTranslate:index:](v20, "computeInstanceTransformTranslate:index:", 3);
  v21 = self->_splineData;
  -[ARCoachingSpringDouble3 floatValue](self->_bottomPlaneTranslationSpring, "floatValue");
  -[ARCoachingMetalSplineData computeInstanceTransformTranslate:index:](v21, "computeInstanceTransformTranslate:index:", 4);
  v22 = self->_splineData;
  -[ARCoachingSpringDouble3 floatValue](self->_bottomPlaneTranslationSpring, "floatValue");
  -[ARCoachingMetalSplineData computeInstanceTransformTranslate:index:](v22, "computeInstanceTransformTranslate:index:", 5);
  v23 = self->_splineData;
  -[ARCoachingMetalSplineData shapes](v23, "shapes");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "controlPoints");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "objectAtIndexedSubscript:", 1);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v63, "controlPoints");
  -[ARCoachingMetalSplineData shapes](self->_splineData, "shapes");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "controlPoints");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "objectAtIndexedSubscript:", 1);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v60, "numControlPoints");
  -[ARCoachingMetalSplineData shapes](self->_splineData, "shapes");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "controlPoints");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "controlPoints");
  -[ARCoachingMetalSplineData shapes](self->_splineData, "shapes");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "controlPoints");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "objectAtIndexedSubscript:", 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "numControlPoints");
  -[ARCoachingAnimTime oscillatingTime](self->_time, "oscillatingTime");
  *(float *)&v32 = v32;
  -[ARCoachingMetalSplineData shapeBlendWithStart:startCount:end:endCount:t:](v23, "shapeBlendWithStart:startCount:end:endCount:t:", v59, v58, v27, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = self->_splineData;
  -[ARCoachingMetalSplineData shapes](v34, "shapes");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "controlPoints");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "objectAtIndexedSubscript:", 2);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "controlPoints");
  -[ARCoachingMetalSplineData shapes](self->_splineData, "shapes");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "controlPoints");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "objectAtIndexedSubscript:", 2);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "numControlPoints");
  v41 = objc_msgSend(v33, "controlPoints");
  v69 = v33;
  v42 = objc_msgSend(v33, "numControlPoints");
  -[ARFLSpring value](self->_cubeResolveSpring, "value");
  *(float *)&v43 = v43;
  -[ARCoachingMetalSplineData computeShapeBlendWithStart:startCount:end:endCount:t:](v34, "computeShapeBlendWithStart:startCount:end:endCount:t:", v36, v40, v41, v42, v43);

  -[ARCoachingGlyphRenderer updateAngularVelocity](self, "updateAngularVelocity");
  -[ARCoachingGlyphRenderer computeRotation:](self, "computeRotation:", a3);
  if (self->_dirty_tesselation_factors)
  {
    -[ARCoachingGlyphRenderer computeTesselationFactorsForCommandBuffer:](self, "computeTesselationFactorsForCommandBuffer:", v70);
    self->_dirty_tesselation_factors = 0;
  }
  -[ARCoachingGlyphRenderer renderPostTessellationInDrawable:withCommandBuffer:](self, "renderPostTessellationInDrawable:withCommandBuffer:", v71, v70);
  -[ARFLSpring value](self->_cubeResolveSpring, "value");
  v45 = v44;
  -[ARFLSpring value](self->_verticalResolvingSpring, "value");
  v46 = 1.0 - v45;
  v48 = (1.0 - v45) * v47;
  v76 = 0uLL;
  v77 = 0;
  v74 = kARCoachingDeviceRenderParamsHorizontal;
  v75 = 3233808384;
  v72 = kARCoachingDeviceRenderParamsVertical;
  v73 = 3262119936;
  ARCoachingDeviceRenderParamsLerp((uint64_t)&v74, (uint64_t)&v72, (uint64_t)&v76, v48);
  -[ARCoachingAnimTime absoluteTime](self->_time, "absoluteTime");
  v50 = v48 * -0.2 + 0.2 + v49;
  -[ARFLSpring value](self->_planeResolveSpring, "value");
  v52 = v46 * v51;
  deviceController = self->_deviceController;
  layer = self->_layer;
  v74 = v76;
  v75 = v77;
  -[ARCoachingDeviceController update:visibility:layer:renderParams:](deviceController, "update:visibility:layer:renderParams:", layer, &v74, v50, v52);
  *(_QWORD *)&v74 = v76;
  DWORD2(v74) = DWORD2(v76);
  v55 = (v48 * -0.0199 + 0.9999) * *((float *)&v76 + 3);
  parallaxDeviceController = self->_parallaxDeviceController;
  v57 = self->_layer;
  *((float *)&v74 + 3) = v55;
  v75 = v77;
  -[ARCoachingDeviceController update:visibility:layer:renderParams:](parallaxDeviceController, "update:visibility:layer:renderParams:", v57, &v74, v50, v52);

}

- (void)resizeIfNeeded:(id)a3
{
  void *v4;
  double v5;
  void *v6;
  double v7;
  double v9;
  float v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  double v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  float32x4_t v29;
  float32x4_t v30;
  float32x4_t v31;
  float32x4_t v32;
  double v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  float32x4_t v42;
  float32x4_t v43;
  float32x4_t v44;
  float32x4_t v45;
  float32x4_t v46;
  float32x4_t v47;
  float32x4_t v48;
  float32x4_t v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;

  v50 = a3;
  objc_msgSend(v50, "texture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (double)(unint64_t)objc_msgSend(v4, "width");
  objc_msgSend(v50, "texture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (double)(unint64_t)objc_msgSend(v6, "height");

  if (self->_lastDrawableSize.width != v5 || self->_lastDrawableSize.height != v7)
  {
    self->_lastDrawableSize.width = v5;
    self->_lastDrawableSize.height = v7;
    kdebug_trace();
    -[ARCoachingGlyphRenderer generateTexturesWithSize:](self, "generateTexturesWithSize:", v5, v7);
    v9 = v5 / v7;
    v10 = v5 / v7;
    *(float *)&v9 = v10 * -1.5;
    *(float *)&v11 = v10 * 1.5;
    LODWORD(v12) = -1.5;
    LODWORD(v13) = 1.5;
    LODWORD(v14) = 0;
    LODWORD(v15) = 4.0;
    +[ARCoachingTransformations ortho2d:right:bottom:top:near:far:](ARCoachingTransformations, "ortho2d:right:bottom:top:near:far:", v9, v11, v12, v13, v14, v15);
    v46 = v17;
    v48 = v16;
    v42 = v19;
    v44 = v18;
    +[ARCoachingTransformations lookAt:center:up:](ARCoachingTransformations, "lookAt:center:up:", 0.0, 0.0);
    v20 = 0;
    v51 = v21;
    v52 = v22;
    v53 = v23;
    v54 = v24;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    do
    {
      *(__int128 *)((char *)&v55 + v20) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v48, COERCE_FLOAT(*(__int128 *)((char *)&v51 + v20))), v46, *(float32x2_t *)((char *)&v51 + v20), 1), v44, *(float32x4_t *)((char *)&v51 + v20), 2), v42, *(float32x4_t *)((char *)&v51 + v20), 3);
      v20 += 16;
    }
    while (v20 != 64);
    HIDWORD(v25) = DWORD1(v55);
    v26 = v56;
    v27 = v57;
    v28 = v58;
    *(_OWORD *)self->_anon_170 = v55;
    *(_OWORD *)&self->_anon_170[16] = v26;
    *(_OWORD *)&self->_anon_170[32] = v27;
    *(_OWORD *)&self->_anon_170[48] = v28;
    LODWORD(v25) = 1118437376;
    LODWORD(v27) = 981668463;
    LODWORD(v28) = 5.0;
    *(float *)&v26 = v10;
    +[ARCoachingTransformations perspective_fov:aspect:near:far:](ARCoachingTransformations, "perspective_fov:aspect:near:far:", v25, *(double *)&v26, *(double *)&v27, *(double *)&v28);
    v47 = v30;
    v49 = v29;
    v43 = v32;
    v45 = v31;
    v33 = ARCoachingGlyphPerspectiveEye();
    +[ARCoachingTransformations lookAt:center:up:](ARCoachingTransformations, "lookAt:center:up:", v33, ARCoachingGlyphPerspectiveCenter(), 0.0078125);
    v34 = 0;
    v51 = v35;
    v52 = v36;
    v53 = v37;
    v54 = v38;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    do
    {
      *(__int128 *)((char *)&v55 + v34) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v49, COERCE_FLOAT(*(__int128 *)((char *)&v51 + v34))), v47, *(float32x2_t *)((char *)&v51 + v34), 1), v45, *(float32x4_t *)((char *)&v51 + v34), 2), v43, *(float32x4_t *)((char *)&v51 + v34), 3);
      v34 += 16;
    }
    while (v34 != 64);
    v39 = v56;
    v40 = v57;
    v41 = v58;
    *(_OWORD *)self->_anon_1b0 = v55;
    *(_OWORD *)&self->_anon_1b0[16] = v39;
    *(_OWORD *)&self->_anon_1b0[32] = v40;
    *(_OWORD *)&self->_anon_1b0[48] = v41;
    self->_dirty_tesselation_factors = 1;
  }

}

- (void)setOrientationAngle:(float)a3
{
  -[ARCoachingBasicSpring setInput:](self->_orientationSpring, "setInput:");
}

- (void)resetData
{
  ARCoachingBasicSpring *v3;
  double v4;
  double v5;
  ARCoachingBasicSpring *v6;
  ARCoachingBasicSpring *orientationSpring;
  ARCoachingQuaternionSpring *v8;
  ARCoachingQuaternionSpring *rotationSpring;
  ARCoachingGlyphState *state;
  ARCoachingQuaternionSpring *v11;
  ARCoachingQuaternionSpring *v12;
  __int128 v13;
  __int128 v14;
  _OWORD v15[2];
  __int128 v16;
  __int128 v17;

  v3 = [ARCoachingBasicSpring alloc];
  LODWORD(v4) = 1128792064;
  LODWORD(v5) = 22.0;
  v6 = -[ARCoachingBasicSpring initWithTension:friction:](v3, "initWithTension:friction:", v4, v5);
  orientationSpring = self->_orientationSpring;
  self->_orientationSpring = v6;

  v8 = objc_alloc_init(ARCoachingQuaternionSpring);
  rotationSpring = self->_rotationSpring;
  self->_rotationSpring = v8;

  state = self->_state;
  if (state)
  {
    -[ARCoachingGlyphState computeQuaternionTarget](state, "computeQuaternionTarget");
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
  }
  v11 = self->_rotationSpring;
  v15[0] = v16;
  v15[1] = v17;
  -[ARCoachingQuaternionSpring setTarget:](v11, "setTarget:", v15);
  v12 = self->_rotationSpring;
  if (v12)
  {
    -[ARCoachingQuaternionSpring target](v12, "target");
  }
  else
  {
    v13 = 0u;
    v14 = 0u;
  }
  *(_OWORD *)self->_anon_a0 = v13;
  *(_OWORD *)&self->_anon_a0[16] = v14;
}

- (void)restartAnimation
{
  -[ARCoachingGlyphRenderer resetData](self, "resetData");
  -[ARCoachingGlyphRenderer resetSprings](self, "resetSprings");
  -[ARCoachingGlyphRenderer resetAnimationTime:](self, "resetAnimationTime:", 0.0);
}

- (void)resetAnimationTime:(double)a3
{
  ARCoachingAnimTime *v5;
  ARCoachingAnimTime *time;

  v5 = objc_alloc_init(ARCoachingAnimTime);
  time = self->_time;
  self->_time = v5;

  -[ARCoachingAnimTime setAbsoluteTime:](self->_time, "setAbsoluteTime:", a3);
}

- (float)rotationAngleY
{
  return self->_rotationAngleY;
}

- (void)setRotationAngleY:(float)a3
{
  self->_rotationAngleY = a3;
}

- (float)a_vel
{
  return self->_a_vel;
}

- (void)setA_vel:(float)a3
{
  self->_a_vel = a3;
}

- (ARCoachingDotsRenderer)dotsRenderer
{
  return self->_dotsRenderer;
}

- (void)setDotsRenderer:(id)a3
{
  objc_storeStrong((id *)&self->_dotsRenderer, a3);
}

- (MTLComputePipelineState)computePipelineState
{
  return self->_computePipelineState;
}

- (void)setComputePipelineState:(id)a3
{
  objc_storeStrong((id *)&self->_computePipelineState, a3);
}

- (MTLRenderPipelineState)postTessellationPipelineState
{
  return self->_postTessellationPipelineState;
}

- (void)setPostTessellationPipelineState:(id)a3
{
  objc_storeStrong((id *)&self->_postTessellationPipelineState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postTessellationPipelineState, 0);
  objc_storeStrong((id *)&self->_computePipelineState, 0);
  objc_storeStrong((id *)&self->_dotsRenderer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_parallaxDeviceController, 0);
  objc_storeStrong((id *)&self->_deviceController, 0);
  objc_storeStrong((id *)&self->_splineData, 0);
  objc_storeStrong((id *)&self->_orientationSpring, 0);
  objc_storeStrong((id *)&self->_alphaSpring, 0);
  objc_storeStrong((id *)&self->_verticalResolvingSpring, 0);
  objc_storeStrong((id *)&self->_planeResolveSpring, 0);
  objc_storeStrong((id *)&self->_cubeResolveSpring, 0);
  objc_storeStrong((id *)&self->_bottomPlaneTranslationSpring, 0);
  objc_storeStrong((id *)&self->_topPlaneTranslationSpring, 0);
  objc_storeStrong((id *)&self->_scaleSpring, 0);
  objc_storeStrong((id *)&self->_rotationSpring, 0);
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_layer, 0);
  objc_storeStrong((id *)&self->_msaaTex, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
