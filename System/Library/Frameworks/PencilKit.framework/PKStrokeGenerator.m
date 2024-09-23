@implementation PKStrokeGenerator

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)resetFilters
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = self->_allInputPointFilters;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "resetFilter", (_QWORD)v6);
      }
      while (v3 != v5);
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (PKStrokeGenerator)init
{
  return -[PKStrokeGenerator initWithStrokeNoiseSmoothing:](self, "initWithStrokeNoiseSmoothing:", 0);
}

- (PKStrokeGeneratorDelegate)delegate
{
  return (PKStrokeGeneratorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 27) = 0;
  *((_QWORD *)self + 28) = 0;
  *((_QWORD *)self + 29) = 0;
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  return self;
}

+ (void)initialize
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PKStrokeGenerator;
  objc_msgSendSuper2(&v2, sel_initialize);
  objc_opt_class();
}

- (PKStrokeGenerator)initWithStrokeNoiseSmoothing:(BOOL)a3
{
  _BOOL4 v3;
  PKStrokeGenerator *v4;
  PKStrokeGenerator *v5;
  NSArray *allInputPointFilters;
  void *v7;
  void *v8;
  PKInputPointExtraRollLatencyFilter *v9;
  PKInputPointExtraRollLatencyFilter *extraRollLatencyFilter;
  PKInputPointRollNoiseFilter *v11;
  PKInputPointRollNoiseFilter *rollNoiseFilter;
  PKInputPointRollNoiseFilter *v13;
  uint64_t v14;
  NSArray *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *inputQueue;
  dispatch_queue_t v19;
  OS_dispatch_queue *outputQueue;
  uint64_t v21;
  PKStrokeGenerator *v22;
  uint64_t v23;
  void *inputProvider;
  PKStrokeGenerator *v25;
  uint64_t v26;
  void *pixelSmoothingFilter;
  uint64_t v28;
  void *pointReductionFilter;
  PKStrokeGenerator *v30;
  uint64_t v31;
  void **p_noiseSmoother;
  void *v33;
  PKStrokeGenerator *v39;
  uint64_t v40;
  void *estimatedAltitudeAndAzimuthFilter;
  uint64_t v42;
  void *startHookFilter;
  uint64_t v44;
  void *endHookFilter;
  uint64_t v46;
  void *velocityFilter;
  PKStrokeGenerator *v48;
  uint64_t v49;
  void *directionAngleFilter;
  PKStrokeGenerator *v51;
  uint64_t v52;
  void *azimuthFilter;
  PKStrokeGenerator *v54;
  uint64_t v55;
  void *inputToOutputFilter;
  uint64_t v57;
  void *startCapFilter;
  PKStrokeGenerator *v59;
  uint64_t v60;
  void *animationFilter;
  PKStrokeGenerator *v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD *v65;
  uint64_t v66;
  uint64_t v67;
  _QWORD *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  dispatch_semaphore_t v77;
  void *v78;
  void *v79;
  void *v80;
  char v81;
  objc_super v83;
  _QWORD v84[3];

  v3 = a3;
  v84[2] = *MEMORY[0x1E0C80C00];
  v83.receiver = self;
  v83.super_class = (Class)PKStrokeGenerator;
  v4 = -[PKStrokeGenerator init](&v83, sel_init);
  v5 = v4;
  if (v4)
  {
    allInputPointFilters = v4->_allInputPointFilters;
    v4->_allInputPointFilters = (NSArray *)MEMORY[0x1E0C9AA60];

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_enableDidUpdateRoll = objc_msgSend(v7, "BOOLForKey:", CFSTR("internalSettings.drawing.disableDidUpdateRoll")) ^ 1;

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_alwaysUseRollAngleForFountainPen = objc_msgSend(v8, "BOOLForKey:", CFSTR("PKAlwaysUseRollAngleForFountainPen"));

    v9 = objc_alloc_init(PKInputPointExtraRollLatencyFilter);
    extraRollLatencyFilter = v5->_extraRollLatencyFilter;
    v5->_extraRollLatencyFilter = v9;

    v11 = objc_alloc_init(PKInputPointRollNoiseFilter);
    rollNoiseFilter = v5->_rollNoiseFilter;
    v5->_rollNoiseFilter = v11;

    v13 = v5->_rollNoiseFilter;
    v84[0] = v5->_extraRollLatencyFilter;
    v84[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 2);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v5->_allInputPointFilters;
    v5->_allInputPointFilters = (NSArray *)v14;

    v5->_baseRollAngleLock._os_unfair_lock_opaque = 0;
    if (qword_1ECEE65D0 != -1)
      dispatch_once(&qword_1ECEE65D0, &__block_literal_global_385);
    if (_MergedGlobals_158 == 1)
      v5->_keepPredictedTouchesAtEndOfStroke = _MergedGlobals_158;
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_queue_create("com.apple.pencilkit.draw-input", v16);
    inputQueue = v5->_inputQueue;
    v5->_inputQueue = (OS_dispatch_queue *)v17;

    v19 = dispatch_queue_create("com.apple.pencilkit.draw-output", v16);
    outputQueue = v5->_outputQueue;
    v5->_outputQueue = (OS_dispatch_queue *)v19;

    v5->_inputScale = 1.0;
    v21 = operator new();
    *(_QWORD *)v21 = off_1E7774278;
    v22 = v5;
    *(_QWORD *)(v21 + 8) = 0;
    objc_storeWeak((id *)(v21 + 8), v22);

    v22->_inputProvider = (void *)v21;
    v23 = operator new();
    inputProvider = v22->_inputProvider;
    *(_BYTE *)(v23 + 16) = 0;
    *(_QWORD *)v23 = off_1E7774308;
    *(_QWORD *)(v23 + 8) = inputProvider;
    *(_OWORD *)(v23 + 24) = xmmword_1BE4FEB70;
    *(_QWORD *)(v23 + 40) = 0;
    v25 = v22;
    *(_QWORD *)(v23 + 48) = 0;
    objc_storeWeak((id *)(v23 + 48), v25);

    v25->_pixelSmoothingFilter = (void *)v23;
    v26 = operator new();
    pixelSmoothingFilter = v25->_pixelSmoothingFilter;
    *(_BYTE *)(v26 + 16) = 0;
    *(_QWORD *)(v26 + 24) = 0x3FF0000000000000;
    *(_OWORD *)(v26 + 32) = 0u;
    *(_OWORD *)(v26 + 48) = 0u;
    *(_OWORD *)(v26 + 64) = 0u;
    *(_OWORD *)(v26 + 80) = 0u;
    *(_QWORD *)(v26 + 96) = 0;
    *(_QWORD *)(v26 + 104) = 0;
    *(_QWORD *)v26 = off_1E7774340;
    *(_QWORD *)(v26 + 8) = pixelSmoothingFilter;
    *(_QWORD *)(v26 + 112) = 0;
    *(_QWORD *)(v26 + 120) = 0;
    *(_OWORD *)(v26 + 128) = xmmword_1BE4FEB80;
    *(_OWORD *)(v26 + 144) = 0u;
    *(_OWORD *)(v26 + 160) = 0u;
    *(_OWORD *)(v26 + 176) = 0u;
    *(_BYTE *)(v26 + 192) = 0;
    v25->_pointReductionFilter = (void *)v26;
    if (v3)
    {
      v28 = operator new();
      pointReductionFilter = v25->_pointReductionFilter;
      *(_BYTE *)(v28 + 16) = 0;
      *(_QWORD *)(v28 + 24) = 0x3FF0000000000000;
      *(_OWORD *)(v28 + 32) = 0u;
      *(_OWORD *)(v28 + 48) = 0u;
      *(_OWORD *)(v28 + 64) = 0u;
      *(_OWORD *)(v28 + 80) = 0u;
      *(_QWORD *)(v28 + 96) = 0;
      *(_QWORD *)(v28 + 104) = 0;
      *(_QWORD *)v28 = &unk_1E77742B0;
      *(_QWORD *)(v28 + 8) = pointReductionFilter;
      v30 = v25;
      *(_QWORD *)(v28 + 120) = 0;
      objc_storeWeak((id *)(v28 + 120), v30);

      v30->_noiseSmoother = (void *)v28;
      v31 = operator new();
      p_noiseSmoother = &v30->_noiseSmoother;
    }
    else
    {
      v31 = operator new();
      p_noiseSmoother = &v25->_pointReductionFilter;
    }
    v33 = *p_noiseSmoother;
    *(_BYTE *)(v31 + 16) = 0;
    *(_QWORD *)v31 = off_1E77744A0;
    *(_QWORD *)(v31 + 8) = v33;
    *(_QWORD *)(v31 + 24) = 0x3FF0000000000000;
    *(_QWORD *)(v31 + 32) = -1;
    *(_QWORD *)(v31 + 40) = -1;
    *(_QWORD *)(v31 + 48) = -1;
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)(v31 + 56) = _Q0;
    *(_OWORD *)(v31 + 72) = _Q0;
    *(_QWORD *)(v31 + 88) = 0;
    *(_BYTE *)(v31 + 96) = 0;
    *(_QWORD *)(v31 + 104) = 300;
    *(_OWORD *)(v31 + 112) = xmmword_1BE4FEB90;
    v39 = v25;
    *(_QWORD *)(v31 + 128) = 0;
    objc_storeWeak((id *)(v31 + 128), v39);

    v39->_estimatedAltitudeAndAzimuthFilter = (void *)v31;
    v40 = operator new();
    estimatedAltitudeAndAzimuthFilter = v39->_estimatedAltitudeAndAzimuthFilter;
    *(_BYTE *)(v40 + 16) = 0;
    *(_QWORD *)v40 = off_1E7773E08;
    *(_QWORD *)(v40 + 8) = estimatedAltitudeAndAzimuthFilter;
    *(_QWORD *)(v40 + 24) = 0x3FF0000000000000;
    *(_QWORD *)(v40 + 32) = 0;
    *(_BYTE *)(v40 + 40) = 0;
    v39->_startHookFilter = (void *)v40;
    v42 = operator new();
    startHookFilter = v39->_startHookFilter;
    *(_BYTE *)(v42 + 16) = 0;
    *(_QWORD *)v42 = off_1E7773D08;
    *(_QWORD *)(v42 + 8) = startHookFilter;
    *(_QWORD *)(v42 + 24) = 0x3FF0000000000000;
    *(_QWORD *)(v42 + 32) = 0x7FFFFFFFFFFFFFFFLL;
    *(_BYTE *)(v42 + 40) = 0;
    v39->_endHookFilter = (void *)v42;
    v44 = operator new();
    endHookFilter = v39->_endHookFilter;
    *(_BYTE *)(v44 + 16) = 0;
    *(_QWORD *)(v44 + 24) = 0x3FF0000000000000;
    *(_QWORD *)v44 = off_1E7774430;
    *(_QWORD *)(v44 + 8) = endHookFilter;
    v39->_velocityFilter = (void *)v44;
    v46 = operator new();
    velocityFilter = v39->_velocityFilter;
    *(_BYTE *)(v46 + 16) = 0;
    *(_QWORD *)(v46 + 24) = 0x3FF0000000000000;
    *(_QWORD *)v46 = off_1E7774468;
    *(_QWORD *)(v46 + 8) = velocityFilter;
    v48 = v39;
    *(_QWORD *)(v46 + 48) = 0;
    objc_storeWeak((id *)(v46 + 48), v48);

    v48->_directionAngleFilter = (void *)v46;
    v49 = operator new();
    directionAngleFilter = v48->_directionAngleFilter;
    *(_BYTE *)(v49 + 16) = 0;
    *(_QWORD *)(v49 + 24) = 0x3FF0000000000000;
    *(_OWORD *)(v49 + 32) = 0u;
    *(_OWORD *)(v49 + 48) = 0u;
    *(_OWORD *)(v49 + 64) = 0u;
    *(_QWORD *)v49 = off_1E7773C28;
    *(_QWORD *)(v49 + 8) = directionAngleFilter;
    *(_WORD *)(v49 + 80) = 0;
    *(_QWORD *)(v49 + 104) = 0;
    v51 = v48;
    *(_QWORD *)(v49 + 112) = 0;
    objc_storeWeak((id *)(v49 + 112), v51);

    *(_QWORD *)(v49 + 96) = 0x7FF8000000000000;
    v51->_azimuthFilter = (void *)v49;
    v52 = operator new();
    azimuthFilter = v51->_azimuthFilter;
    *(_BYTE *)(v52 + 16) = 0;
    *(_QWORD *)(v52 + 24) = 0x3FF0000000000000;
    *(_OWORD *)(v52 + 32) = 0u;
    *(_OWORD *)(v52 + 48) = 0u;
    *(_OWORD *)(v52 + 64) = 0u;
    *(_OWORD *)(v52 + 80) = 0u;
    *(_QWORD *)(v52 + 96) = 0;
    *(_QWORD *)v52 = off_1E77741E8;
    *(_QWORD *)(v52 + 8) = azimuthFilter;
    v54 = v51;
    *(_QWORD *)(v52 + 104) = 0;
    objc_storeWeak((id *)(v52 + 104), v54);

    v54->_inputToOutputFilter = (void *)v52;
    v55 = operator new();
    inputToOutputFilter = v54->_inputToOutputFilter;
    *(_BYTE *)(v55 + 16) = 0;
    *(_QWORD *)v55 = off_1E7773DD0;
    *(_QWORD *)(v55 + 8) = inputToOutputFilter;
    *(_QWORD *)(v55 + 24) = 0x3FF0000000000000;
    *(_QWORD *)(v55 + 32) = 0;
    *(_QWORD *)(v55 + 40) = 0;
    *(_QWORD *)(v55 + 48) = 0;
    v54->_startCapFilter = (void *)v55;
    v57 = operator new();
    startCapFilter = v54->_startCapFilter;
    *(_BYTE *)(v57 + 16) = 0;
    *(_QWORD *)v57 = off_1E7773D98;
    *(_QWORD *)(v57 + 8) = startCapFilter;
    *(_QWORD *)(v57 + 32) = 0;
    *(_QWORD *)(v57 + 40) = 0;
    *(_QWORD *)(v57 + 24) = 0x3FF0000000000000;
    v59 = v54;
    *(_QWORD *)(v57 + 48) = 0;
    objc_storeWeak((id *)(v57 + 48), v59);

    v59->_animationFilter = (void *)v57;
    v60 = operator new();
    animationFilter = (uint64_t)v59->_animationFilter;
    *(_BYTE *)(v60 + 16) = 0;
    *(_QWORD *)(v60 + 24) = 0x3FF0000000000000;
    *(_OWORD *)(v60 + 32) = 0u;
    *(_OWORD *)(v60 + 48) = 0u;
    *(_OWORD *)(v60 + 64) = 0u;
    *(_OWORD *)(v60 + 80) = 0u;
    *(_QWORD *)(v60 + 96) = 0;
    *(_QWORD *)v60 = off_1E7774398;
    *(_QWORD *)(v60 + 8) = animationFilter;
    v62 = v59;
    *(_QWORD *)(v60 + 120) = 0;
    objc_storeWeak((id *)(v60 + 120), v62);

    v62[61] = v60;
    v63 = operator new();
    v64 = v62[61];
    *(_BYTE *)(v63 + 16) = 0;
    *(_QWORD *)(v63 + 24) = 0x3FF0000000000000;
    *(_OWORD *)(v63 + 32) = 0u;
    *(_OWORD *)(v63 + 48) = 0u;
    *(_OWORD *)(v63 + 64) = 0u;
    *(_OWORD *)(v63 + 80) = 0u;
    *(_QWORD *)(v63 + 96) = 0;
    *(_QWORD *)v63 = &unk_1E7773D40;
    *(_QWORD *)(v63 + 8) = v64;
    *(_QWORD *)(v63 + 120) = 0;
    *(_QWORD *)(v63 + 128) = 0;
    *(_QWORD *)(v63 + 112) = 0;
    v65 = v62;
    *(_QWORD *)(v63 + 136) = 0;
    objc_storeWeak((id *)(v63 + 136), v65);

    v65[59] = v63;
    v66 = operator new();
    v67 = v65[59];
    *(_BYTE *)(v66 + 16) = 0;
    *(_QWORD *)(v66 + 24) = 0x3FF0000000000000;
    *(_OWORD *)(v66 + 32) = 0u;
    *(_OWORD *)(v66 + 48) = 0u;
    *(_OWORD *)(v66 + 64) = 0u;
    *(_OWORD *)(v66 + 80) = 0u;
    *(_QWORD *)(v66 + 96) = 0;
    *(_QWORD *)v66 = &unk_1E7773FA8;
    *(_QWORD *)(v66 + 8) = v67;
    v68 = v65;
    *(_QWORD *)(v66 + 104) = 0;
    objc_storeWeak((id *)(v66 + 104), v68);

    v68[68] = v66;
    v69 = operator new();
    v70 = v68[68];
    *(_BYTE *)(v69 + 16) = 0;
    *(_QWORD *)v69 = off_1E7773CD0;
    *(_QWORD *)(v69 + 8) = v70;
    *(_QWORD *)(v69 + 24) = 0x3FF0000000000000;
    *(_QWORD *)(v69 + 32) = 0;
    *(_QWORD *)(v69 + 40) = 0;
    *(_QWORD *)(v69 + 48) = 0;
    v68[66] = v69;
    v71 = operator new();
    v72 = v68[66];
    *(_BYTE *)(v71 + 16) = 0;
    *(_QWORD *)(v71 + 24) = 0x3FF0000000000000;
    *(_OWORD *)(v71 + 32) = 0u;
    *(_OWORD *)(v71 + 48) = 0u;
    *(_OWORD *)(v71 + 64) = 0u;
    *(_OWORD *)(v71 + 80) = 0u;
    *(_QWORD *)(v71 + 96) = 0;
    *(_QWORD *)v71 = &unk_1E7773F18;
    *(_QWORD *)(v71 + 8) = v72;
    v68[67] = v71;
    v73 = operator new();
    v74 = v68[67];
    *(_BYTE *)(v73 + 16) = 0;
    *(_QWORD *)(v73 + 24) = 0x3FF0000000000000;
    *(_OWORD *)(v73 + 32) = 0u;
    *(_OWORD *)(v73 + 48) = 0u;
    *(_OWORD *)(v73 + 64) = 0u;
    *(_OWORD *)(v73 + 80) = 0u;
    *(_QWORD *)(v73 + 96) = 0;
    *(_QWORD *)v73 = off_1E7773EC0;
    *(_QWORD *)(v73 + 8) = v74;
    v68[70] = v73;
    v75 = operator new();
    v76 = v68[70];
    *(_BYTE *)(v75 + 16) = 0;
    *(_QWORD *)(v75 + 24) = 0x3FF0000000000000;
    *(_OWORD *)(v75 + 32) = 0u;
    *(_OWORD *)(v75 + 48) = 0u;
    *(_OWORD *)(v75 + 64) = 0u;
    *(_OWORD *)(v75 + 80) = 0u;
    *(_QWORD *)v75 = off_1E7774000;
    *(_QWORD *)(v75 + 8) = v76;
    *(_QWORD *)(v75 + 96) = 0;
    *(_QWORD *)(v75 + 104) = 0x7FF8000000000000;
    v68[71] = v75;
    v77 = dispatch_semaphore_create(0);
    v78 = (void *)v68[31];
    v68[31] = v77;

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "bundleIdentifier");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = objc_msgSend(v80, "isEqualToString:", CFSTR("com.apple.mobilenotes"));

    *((_BYTE *)v68 + 344) = v81;
  }
  return v5;
}

- (void)dealloc
{
  id *inputProvider;
  id *pixelSmoothingFilter;
  _QWORD *pointReductionFilter;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *startHookFilter;
  void *endHookFilter;
  void *velocityFilter;
  id *directionAngleFilter;
  id *inputSmoother;
  id v15;
  id v16;
  id v17;
  _QWORD *fountainPenFilter;
  void *v19;
  void *v20;
  id *propertySmoother;
  id v22;
  id v23;
  id *inputToOutputFilter;
  id v25;
  id v26;
  void *startCapFilter;
  id *azimuthFilter;
  id v29;
  void *endCapFilter;
  _QWORD *compressionFilter;
  void *v32;
  void *v33;
  _QWORD *decompressionFilter;
  void *v35;
  void *v36;
  id *rulerExtremaFilter;
  id v38;
  id v39;
  id *estimatedAltitudeAndAzimuthFilter;
  id *animationFilter;
  id *noiseSmoother;
  id v43;
  id v44;
  objc_super v45;

  inputProvider = (id *)self->_inputProvider;
  if (inputProvider)
  {
    objc_destroyWeak(inputProvider + 1);
    MEMORY[0x1C3B7F770](inputProvider, 0x81C40803F642BLL);
  }
  pixelSmoothingFilter = (id *)self->_pixelSmoothingFilter;
  if (pixelSmoothingFilter)
  {
    objc_destroyWeak(pixelSmoothingFilter + 6);
    MEMORY[0x1C3B7F770](pixelSmoothingFilter, 0x10A1C40F7C73FE6);
  }
  pointReductionFilter = self->_pointReductionFilter;
  if (pointReductionFilter)
  {
    *pointReductionFilter = off_1E7774340;
    v6 = (void *)pointReductionFilter[21];
    if (v6)
    {
      pointReductionFilter[22] = v6;
      operator delete(v6);
    }
    v7 = (void *)pointReductionFilter[18];
    if (v7)
    {
      pointReductionFilter[19] = v7;
      operator delete(v7);
    }
    *pointReductionFilter = off_1E7773AC8;
    v8 = (void *)pointReductionFilter[10];
    if (v8)
    {
      pointReductionFilter[11] = v8;
      operator delete(v8);
    }
    *pointReductionFilter = off_1E77740A8;
    v9 = (void *)pointReductionFilter[6];
    if (v9)
    {
      pointReductionFilter[7] = v9;
      operator delete(v9);
    }
    MEMORY[0x1C3B7F770](pointReductionFilter, 0x10B1C40B92EB384);
  }
  startHookFilter = self->_startHookFilter;
  if (startHookFilter)
    MEMORY[0x1C3B7F770](startHookFilter, 0x10A1C40A8CDCD5BLL);
  endHookFilter = self->_endHookFilter;
  if (endHookFilter)
    MEMORY[0x1C3B7F770](endHookFilter, 0x10A1C40A8CDCD5BLL);
  velocityFilter = self->_velocityFilter;
  if (velocityFilter)
    MEMORY[0x1C3B7F770](velocityFilter, 0x10A1C40A8CDCD5BLL);
  directionAngleFilter = (id *)self->_directionAngleFilter;
  if (directionAngleFilter)
  {
    objc_destroyWeak(directionAngleFilter + 6);
    MEMORY[0x1C3B7F770](directionAngleFilter, 0x10A1C40F9F78CB0);
  }
  inputSmoother = (id *)self->_inputSmoother;
  if (inputSmoother)
  {
    *inputSmoother = &unk_1E7773D40;
    objc_destroyWeak(inputSmoother + 17);
    v15 = inputSmoother[14];
    if (v15)
    {
      inputSmoother[15] = v15;
      operator delete(v15);
    }
    *inputSmoother = &unk_1E7773B78;
    v16 = inputSmoother[10];
    if (v16)
    {
      inputSmoother[11] = v16;
      operator delete(v16);
    }
    *inputSmoother = &unk_1E7774148;
    v17 = inputSmoother[6];
    if (v17)
    {
      inputSmoother[7] = v17;
      operator delete(v17);
    }
    MEMORY[0x1C3B7F770](inputSmoother, 0x10A1C4091D11D32);
  }
  fountainPenFilter = self->_fountainPenFilter;
  if (fountainPenFilter)
  {
    *fountainPenFilter = &unk_1E7773B78;
    v19 = (void *)fountainPenFilter[10];
    if (v19)
    {
      fountainPenFilter[11] = v19;
      operator delete(v19);
    }
    *fountainPenFilter = &unk_1E7774148;
    v20 = (void *)fountainPenFilter[6];
    if (v20)
    {
      fountainPenFilter[7] = v20;
      operator delete(v20);
    }
    MEMORY[0x1C3B7F770](fountainPenFilter, 0x10A1C40F23EBCE3);
  }
  propertySmoother = (id *)self->_propertySmoother;
  if (propertySmoother)
  {
    objc_destroyWeak(propertySmoother + 15);
    *propertySmoother = &unk_1E7773B78;
    v22 = propertySmoother[10];
    if (v22)
    {
      propertySmoother[11] = v22;
      operator delete(v22);
    }
    *propertySmoother = &unk_1E7774148;
    v23 = propertySmoother[6];
    if (v23)
    {
      propertySmoother[7] = v23;
      operator delete(v23);
    }
    MEMORY[0x1C3B7F770](propertySmoother, 0x10A1C40E2AAAF71);
  }
  inputToOutputFilter = (id *)self->_inputToOutputFilter;
  if (inputToOutputFilter)
  {
    objc_destroyWeak(inputToOutputFilter + 13);
    *inputToOutputFilter = off_1E7773A70;
    v25 = inputToOutputFilter[10];
    if (v25)
    {
      inputToOutputFilter[11] = v25;
      operator delete(v25);
    }
    *inputToOutputFilter = off_1E7774058;
    v26 = inputToOutputFilter[6];
    if (v26)
    {
      inputToOutputFilter[7] = v26;
      operator delete(v26);
    }
    MEMORY[0x1C3B7F770](inputToOutputFilter, 0x10A1C40D2FCA11BLL);
  }
  startCapFilter = self->_startCapFilter;
  if (startCapFilter)
    MEMORY[0x1C3B7F770](startCapFilter, 0x10A1C40C3B39206);
  azimuthFilter = (id *)self->_azimuthFilter;
  if (azimuthFilter)
  {
    objc_destroyWeak(azimuthFilter + 14);
    *azimuthFilter = off_1E77740A8;
    v29 = azimuthFilter[6];
    if (v29)
    {
      azimuthFilter[7] = v29;
      operator delete(v29);
    }
    MEMORY[0x1C3B7F770](azimuthFilter, 0x10A1C40C295C68ALL);
  }
  endCapFilter = self->_endCapFilter;
  if (endCapFilter)
    MEMORY[0x1C3B7F770](endCapFilter, 0x10A1C40C3B39206);
  compressionFilter = self->_compressionFilter;
  if (compressionFilter)
  {
    *compressionFilter = off_1E7773B20;
    v32 = (void *)compressionFilter[10];
    if (v32)
    {
      compressionFilter[11] = v32;
      operator delete(v32);
    }
    *compressionFilter = off_1E77740F8;
    v33 = (void *)compressionFilter[6];
    if (v33)
    {
      compressionFilter[7] = v33;
      operator delete(v33);
    }
    MEMORY[0x1C3B7F770](compressionFilter, 0x10A1C40AE98C8B9);
  }
  decompressionFilter = self->_decompressionFilter;
  if (decompressionFilter)
  {
    *decompressionFilter = off_1E7773BD0;
    v35 = (void *)decompressionFilter[10];
    if (v35)
    {
      decompressionFilter[11] = v35;
      operator delete(v35);
    }
    *decompressionFilter = off_1E7774198;
    v36 = (void *)decompressionFilter[6];
    if (v36)
    {
      decompressionFilter[7] = v36;
      operator delete(v36);
    }
    MEMORY[0x1C3B7F770](decompressionFilter, 0x10A1C40E4B39F60);
  }
  rulerExtremaFilter = (id *)self->_rulerExtremaFilter;
  if (rulerExtremaFilter)
  {
    objc_destroyWeak(rulerExtremaFilter + 13);
    *rulerExtremaFilter = &unk_1E7773B78;
    v38 = rulerExtremaFilter[10];
    if (v38)
    {
      rulerExtremaFilter[11] = v38;
      operator delete(v38);
    }
    *rulerExtremaFilter = &unk_1E7774148;
    v39 = rulerExtremaFilter[6];
    if (v39)
    {
      rulerExtremaFilter[7] = v39;
      operator delete(v39);
    }
    MEMORY[0x1C3B7F770](rulerExtremaFilter, 0x10A1C40D2FCA11BLL);
  }
  estimatedAltitudeAndAzimuthFilter = (id *)self->_estimatedAltitudeAndAzimuthFilter;
  if (estimatedAltitudeAndAzimuthFilter)
  {
    objc_destroyWeak(estimatedAltitudeAndAzimuthFilter + 16);
    MEMORY[0x1C3B7F770](estimatedAltitudeAndAzimuthFilter, 0x10A1C40BB619F7BLL);
  }
  animationFilter = (id *)self->_animationFilter;
  if (animationFilter)
  {
    objc_destroyWeak(animationFilter + 6);
    MEMORY[0x1C3B7F770](animationFilter, 0x10A1C40F7C73FE6);
  }
  noiseSmoother = (id *)self->_noiseSmoother;
  if (noiseSmoother)
  {
    objc_destroyWeak(noiseSmoother + 15);
    *noiseSmoother = off_1E7773AC8;
    v43 = noiseSmoother[10];
    if (v43)
    {
      noiseSmoother[11] = v43;
      operator delete(v43);
    }
    *noiseSmoother = off_1E77740A8;
    v44 = noiseSmoother[6];
    if (v44)
    {
      noiseSmoother[7] = v44;
      operator delete(v44);
    }
    MEMORY[0x1C3B7F770](noiseSmoother, 0x10A1C40E2AAAF71);
  }
  v45.receiver = self;
  v45.super_class = (Class)PKStrokeGenerator;
  -[PKStrokeGenerator dealloc](&v45, sel_dealloc);
}

- (void)setupForInk:(id)a3 maximumSupportedContentVersion:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  uint64_t v11;
  void *v12;
  int v13;
  _BOOL4 alwaysUseRollAngleForFountainPen;
  id v15;

  v15 = a3;
  -[PKStrokeGenerator setRollAngleEnabled:](self, "setRollAngleEnabled:", 0);
  -[PKStrokeGenerator setAdditionalRollAngle:](self, "setAdditionalRollAngle:", 0.0);
  -[PKStrokeGenerator setShouldClearAzimuth:](self, "setShouldClearAzimuth:", 0);
  if (!_os_feature_enabled_impl())
    goto LABEL_8;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", CFSTR("internalSettings.drawing.markerUsesRollForAzimuth"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLForKey:", CFSTR("internalSettings.drawing.markerUsesRollForAzimuth"));

    if (!v9)
      goto LABEL_8;
  }
  else
  {

  }
  if (objc_msgSend(v15, "_isMarkerInk"))
    -[PKStrokeGenerator setRollAngleEnabled:](self, "setRollAngleEnabled:", 1);
LABEL_8:
  if (!objc_msgSend(v15, "_isFountainPenInkV2"))
    goto LABEL_24;
  v10 = _os_feature_enabled_impl() ^ 1;
  if (a4 < 3)
    LOBYTE(v10) = 1;
  if ((v10 & 1) != 0)
  {
LABEL_24:
    if (objc_msgSend(v15, "_isFountainPenInk"))
      -[PKStrokeGenerator setShouldClearAzimuth:](self, "setShouldClearAzimuth:", 1);
  }
  else
  {
    -[PKStrokeGenerator setShouldClearAzimuth:](self, "setShouldClearAzimuth:", 1);
    +[PKPencilDevice activePencil]();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v11)
    {
      v13 = *(_DWORD *)(v11 + 36);
      if (v13 == 1 || !v13 && (PKQueryIsRollSupported() & 1) != 0)
      {

LABEL_20:
        -[PKStrokeGenerator setRollAngleEnabled:](self, "setRollAngleEnabled:", 1);
        -[PKStrokeGenerator setAdditionalRollAngle:](self, "setAdditionalRollAngle:", 1.57079633);
        goto LABEL_21;
      }
    }
    alwaysUseRollAngleForFountainPen = self->_alwaysUseRollAngleForFountainPen;

    if (alwaysUseRollAngleForFountainPen)
      goto LABEL_20;
  }
LABEL_21:

}

- (int64_t)inputType
{
  return self->_currentInputType;
}

- (unint64_t)activeInputProperties
{
  return self->_currentActiveInputProperties;
}

- (void)configureFilters
{
  uint64_t v3;
  PKInputPointExtraRollLatencyFilter *extraRollLatencyFilter;
  uint64_t v5;
  PKInputPointRollNoiseFilter *rollNoiseFilter;
  uint64_t v7;
  PKInputPointRollNoiseFilter *v8;
  id v9;
  id v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v9, "integerForKey:", CFSTR("internalSettings.roll.extraLatency"));
  extraRollLatencyFilter = self->_extraRollLatencyFilter;
  if (extraRollLatencyFilter)
    extraRollLatencyFilter->_numFramesExtraLatency = v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v10, "integerForKey:", CFSTR("internalSettings.roll.noiseOffset"));
  rollNoiseFilter = self->_rollNoiseFilter;
  if (rollNoiseFilter && rollNoiseFilter->_rollOffsetNoise != (double)v5)
  {
    rollNoiseFilter->_rollOffsetNoise = (double)v5;
    -[PKInputPointRollNoiseFilter _recalculateOffset](rollNoiseFilter, "_recalculateOffset");
  }

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v11, "integerForKey:", CFSTR("internalSettings.roll.noiseJitter"));
  v8 = self->_rollNoiseFilter;
  if (v8)
    v8->_rollJitterNoise = (double)v7;

}

- (void)drawingBeganWithStroke:(id)a3 inputType:(int64_t)a4 activeInputProperties:(unint64_t)a5 inputScale:(double)a6 start:(id)a7
{
  id v12;
  id v13;
  BOOL v14;
  BOOL v15;
  double baseRollAngle;
  NSObject *inputQueue;
  uint64_t v18;
  id v19;
  id v20;
  _QWORD block[5];
  id v22;
  id v23;
  double v24;
  uint64_t v25;
  unint64_t v26;
  int64_t v27;
  double v28;
  BOOL v29;
  BOOL v30;

  v12 = a3;
  v13 = a7;
  v14 = -[PKStrokeGenerator shouldClearAzimuth](self, "shouldClearAzimuth");
  v15 = -[PKStrokeGenerator rollAngleEnabled](self, "rollAngleEnabled");
  if (self)
  {
    os_unfair_lock_lock(&self->_baseRollAngleLock);
    baseRollAngle = self->_baseRollAngle;
    os_unfair_lock_unlock(&self->_baseRollAngleLock);
  }
  else
  {
    baseRollAngle = 0.0;
  }
  -[PKStrokeGenerator additionalRollAngle](self, "additionalRollAngle");
  self->_currentStrokeRollBaseValue = -1.0;
  inputQueue = self->_inputQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__PKStrokeGenerator_drawingBeganWithStroke_inputType_activeInputProperties_inputScale_start___block_invoke;
  block[3] = &unk_1E777D798;
  v29 = v14;
  v30 = v15;
  v24 = baseRollAngle;
  v25 = v18;
  block[4] = self;
  v22 = v12;
  v26 = a5;
  v27 = a4;
  v28 = a6;
  v23 = v13;
  v19 = v13;
  v20 = v12;
  dispatch_async(inputQueue, block);

}

void __93__PKStrokeGenerator_drawingBeganWithStroke_inputType_activeInputProperties_inputScale_start___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[5];
  id v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  __int16 v15;

  v10[0] = MEMORY[0x1E0C809B0];
  v10[2] = __93__PKStrokeGenerator_drawingBeganWithStroke_inputType_activeInputProperties_inputScale_start___block_invoke_2;
  v10[3] = &unk_1E777D770;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(v2 + 400);
  v10[1] = 3221225472;
  v10[4] = v2;
  v15 = *(_WORD *)(a1 + 96);
  v12 = *(_OWORD *)(a1 + 56);
  v11 = v3;
  v13 = *(_OWORD *)(a1 + 72);
  v14 = *(_QWORD *)(a1 + 88);
  dispatch_sync(v4, v10);
  v9 = *(_QWORD *)(a1 + 48);
  if (v9)
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 16))(v9, v5, v6, v7, v8);

}

void __93__PKStrokeGenerator_drawingBeganWithStroke_inputType_activeInputProperties_inputScale_start___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (***v16)(_QWORD, void *, _QWORD, double);
  void *v17;
  uint8_t v18[16];

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 257) = *(_BYTE *)(a1 + 88);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 258) = *(_BYTE *)(a1 + 89);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 264) = *(_QWORD *)(a1 + 48);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 272) = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "configureFilters");
  v2 = os_log_create("com.apple.pencilkit", "Stroke Generator");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v18 = 0;
    _os_log_debug_impl(&dword_1BE213000, v2, OS_LOG_TYPE_DEBUG, "Drawing began", v18, 2u);
  }

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 176), *(id *)(a1 + 40));
  v3 = objc_msgSend(*(id *)(a1 + 40), "_flags");
  if ((v3 & 0x2000000000) == 0)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "_setFlags:", v3 & 0xFFFFFFC00000001FLL | (32 * arc4random()) | 0x2000000000);
  v5 = *(_QWORD *)(a1 + 64);
  v4 = *(_QWORD *)(a1 + 72);
  if (qword_1ECEE65D0 != -1)
    dispatch_once(&qword_1ECEE65D0, &__block_literal_global_385);
  v6 = (_MergedGlobals_158 & 1) != 0 || v4 == 1 && (v5 & 0xC) == 8;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 256) = v6;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 584) = *(_QWORD *)(a1 + 80);
  objc_msgSend(*(id *)(a1 + 32), "setUseRuler:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setCanSnapToRuler:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setIsSnappedToRuler:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setStrokeMaxForce:", 0.0);
  objc_msgSend(*(id *)(a1 + 32), "setTouchSensitivity:", 1.0);
  if (_UIAccessibilityForceTouchEnabled())
  {
    _UIAccessibilityForceTouchSensitivity();
    objc_msgSend(*(id *)(a1 + 32), "setTouchSensitivity:", (1.0 - v8) * -3.0 + 1.0);
  }
  v9 = *(_QWORD *)(a1 + 64);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 184) = *(_QWORD *)(a1 + 72);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 192) = v9;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 200) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208) = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v10 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(v10 + 80) = v11;
  *(_QWORD *)(v10 + 88) = 0;
  *(_QWORD *)(v10 + 96) = 0;
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)(v10 + 104) = _Q0;
  *(_OWORD *)(v10 + 120) = 0u;
  *(_OWORD *)(v10 + 136) = 0u;
  *(_OWORD *)(v10 + 152) = 0u;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 568) + 104) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
  v16 = (void (***)(_QWORD, void *, _QWORD, double))objc_msgSend(*(id *)(a1 + 32), "outputFilter");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "ink");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  (**v16)(v16, v17, *(_QWORD *)(a1 + 72), *(double *)(*(_QWORD *)(a1 + 32) + 584));

  if ((v5 & 8) != 0)
  {
    if (*(_QWORD *)(a1 + 72) != 1)
      goto LABEL_22;
    if (qword_1ECEE65D8 != -1)
      dispatch_once(&qword_1ECEE65D8, &__block_literal_global_395);
    if (byte_1ECEE65C9)
    {
LABEL_22:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 440) + 40) = 1;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 448) + 40) = 1;
    }
  }
}

- (void)allowSnappingToRuler:(CGAffineTransform *)a3 width:(double)a4
{
  __int128 v4;
  NSObject *inputQueue;
  _QWORD v6[5];
  __int128 v7;
  __int128 v8;
  __int128 v9;
  double v10;

  v6[1] = 3221225472;
  v4 = *(_OWORD *)&a3->c;
  v7 = *(_OWORD *)&a3->a;
  inputQueue = self->_inputQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[2] = __48__PKStrokeGenerator_allowSnappingToRuler_width___block_invoke;
  v6[3] = &unk_1E777D7C0;
  v6[4] = self;
  v8 = v4;
  v9 = *(_OWORD *)&a3->tx;
  v10 = a4;
  dispatch_async(inputQueue, v6);
}

uint64_t __48__PKStrokeGenerator_allowSnappingToRuler_width___block_invoke(uint64_t a1)
{
  __int128 v2;
  _OWORD v4[3];

  v2 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 72);
  objc_msgSend(*(id *)(a1 + 32), "setRulerTransform:", v4);
  objc_msgSend(*(id *)(a1 + 32), "setRulerWidth:", *(double *)(a1 + 88));
  objc_msgSend(*(id *)(a1 + 32), "setUseRuler:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "setCanSnapToRuler:", 1);
}

- (CGPoint)getRulerSnapLineOriginAndTangent:(CGPoint *)a3 andNormal:(CGPoint *)a4
{
  double v7;
  double v8;
  void *v9;
  double *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGPoint result;

  -[PKStrokeGenerator rulerTransform](self, "rulerTransform");
  -[PKStrokeGenerator rulerWidth](self, "rulerWidth");
  v8 = v7 * 0.5;
  if (-[PKStrokeGenerator isSnappedToRuler](self, "isSnappedToRuler"))
  {
    -[PKStroke ink](self->_currentStroke, "ink");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "behavior");
    v10 = (double *)objc_claimAutoreleasedReturnValue();
    if (v10)
      v11 = -(v10[3] - self->_baseValues.aspectRatio * (self->_baseValues.edgeWidth + self->_baseValues.radius) * v10[2]);
    else
      v11 = 0.0;
    v8 = v8 + v11 / self->_inputScale;

  }
  if (-[PKStrokeGenerator isSnappedToRulerTopSide](self, "isSnappedToRulerTopSide"))
    v12 = v8;
  else
    v12 = -v8;
  v13 = v12 * 0.0;
  v14 = v12 * 0.0;
  if (a3)
  {
    a3->x = v13 + 0.0 * 100.0 + 0.0;
    a3->y = v14 + 0.0 * 100.0 + 0.0;
  }
  if (a4)
  {
    v15 = (v12 + v12) * 0.0
        + 0.0 * 0.0
        + 0.0
        - (0.0 * *(double *)(MEMORY[0x1E0C9D538] + 8)
         + 0.0 * *MEMORY[0x1E0C9D538]
         + 0.0);
    v16 = 1.0 / sqrt(v15 * v15 + v15 * v15);
    a4->x = v15 * v16;
    a4->y = v15 * v16;
  }
  v17 = v13 + 0.0 * -100.0 + 0.0;
  v18 = v14 + 0.0 * -100.0 + 0.0;
  result.y = v18;
  result.x = v17;
  return result;
}

- (double)distanceToRulerCenter:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;

  y = a3.y;
  x = a3.x;
  -[PKStrokeGenerator rulerTransform](self, "rulerTransform");
  v6 = *(double *)(MEMORY[0x1E0C9D538] + 8) * 0.0 + 0.0 * *MEMORY[0x1E0C9D538] + 0.0;
  -[PKStrokeGenerator rulerWidth](self, "rulerWidth");
  v8 = v7 * 0.5 * 0.0 + 0.0 * 0.0 + 0.0 - v6;
  v9 = 1.0 / sqrt(v8 * v8 + v8 * v8);
  return (y - v6) * (v8 * v9) + (x - v6) * (v8 * v9);
}

- (BOOL)shouldSnapPointToRuler:(CGPoint)a3
{
  double y;
  double x;
  _BOOL4 v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v12;
  double v13;

  y = a3.y;
  x = a3.x;
  v6 = -[PKStrokeGenerator useRuler](self, "useRuler");
  if (v6)
  {
    if (self->_currentInputType == 1)
      v7 = 25.0;
    else
      v7 = 45.0;
    -[PKStrokeGenerator rulerWidth](self, "rulerWidth");
    v9 = v8 * 0.5 + v7;
    -[PKStrokeGenerator rulerTransform](self, "rulerTransform");
    -[PKStrokeGenerator distanceToRulerCenter:](self, "distanceToRulerCenter:", x, y);
    LOBYTE(v6) = fabs(v10) < v9 * sqrt(v13 * v13 + v12 * v12);
  }
  return v6;
}

- (void)snapToRuler
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  double v17;
  void *v18;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[28];

  -[PKStrokeGenerator delegate](self, "delegate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[PKStrokeGenerator delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[PKStrokeGenerator delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "strokeGeneratorDidSnapToRuler:", self);

    }
  }
  end = self->_drawPoints.__end_;
  v9 = *((_OWORD *)end - 5);
  v11 = *((_OWORD *)end - 8);
  v10 = *((_OWORD *)end - 7);
  *(_OWORD *)&v23[4] = *((_OWORD *)end - 6);
  *(_OWORD *)&v23[6] = v9;
  *(_OWORD *)v23 = v11;
  *(_OWORD *)&v23[2] = v10;
  v12 = *((_OWORD *)end - 1);
  v14 = *((_OWORD *)end - 4);
  v13 = *((_OWORD *)end - 3);
  *(_OWORD *)&v23[12] = *((_OWORD *)end - 2);
  *(_OWORD *)&v23[14] = v12;
  *(_OWORD *)&v23[8] = v14;
  *(_OWORD *)&v23[10] = v13;
  -[PKStrokeGenerator outputCurrentStrokePoint:](self, "outputCurrentStrokePoint:", v23);
  v15 = *(_OWORD *)&v23[23];
  *(_OWORD *)&self->_baseValues.aspectRatio = *(_OWORD *)&v23[21];
  *(_OWORD *)&self->_baseValues.force = v15;
  *(_OWORD *)&self->_baseValues.altitude = *(_OWORD *)&v23[25];
  *(_QWORD *)&self->_baseValues.radius2 = v23[27];
  v16 = *(_OWORD *)&v23[19];
  *(_OWORD *)&self->_baseValues.timestamp = *(_OWORD *)&v23[17];
  *(_OWORD *)&self->_baseValues.location.y = v16;
  -[PKStrokeGenerator distanceToRulerCenter:](self, "distanceToRulerCenter:", *(double *)self->_drawPoints.__begin_, *((double *)self->_drawPoints.__begin_ + 1));
  -[PKStrokeGenerator setIsSnappedToRulerTopSide:](self, "setIsSnappedToRulerTopSide:", v17 > 0.0);
  -[PKStrokeGenerator setIsSnappedToRuler:](self, "setIsSnappedToRuler:", 1);
  -[PKStroke _clipPlane](self->_currentStroke, "_clipPlane");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
    -[PKStroke _setClipPlane:](self->_currentStroke, "_setClipPlane:", 0);
  begin = self->_drawPoints.__begin_;
  v20 = self->_drawPoints.__end_;
  while (begin != v20)
  {
    -[PKStrokeGenerator snapPointToRuler:](self, "snapPointToRuler:", *(double *)begin, *((double *)begin + 1));
    *(_QWORD *)begin = v21;
    *((_QWORD *)begin + 1) = v22;
    begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 128);
  }
}

- (void)maskToRuler
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  _PKStrokeClipPlane *v9;
  _PKStrokeClipPlane *v10;
  double v11[2];

  -[PKStrokeGenerator distanceToRulerCenter:](self, "distanceToRulerCenter:", *(double *)self->_drawPoints.__begin_, *((double *)self->_drawPoints.__begin_ + 1));
  -[PKStrokeGenerator setIsSnappedToRulerTopSide:](self, "setIsSnappedToRulerTopSide:", v3 > 0.0);
  -[PKStrokeGenerator setIsSnappedToRuler:](self, "setIsSnappedToRuler:", 0);
  -[PKStrokeGenerator getRulerSnapLineOriginAndTangent:andNormal:](self, "getRulerSnapLineOriginAndTangent:andNormal:", 0, v11);
  v5 = v4;
  v7 = v6;
  -[PKStroke _clipPlane](self->_currentStroke, "_clipPlane");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = [_PKStrokeClipPlane alloc];
    v10 = -[_PKStrokeClipPlane initWithOrigin:normal:](v9, "initWithOrigin:normal:", v5, v7, -v11[0], -v11[1]);
    -[PKStroke _setClipPlane:](self->_currentStroke, "_setClipPlane:", v10);

  }
}

- (CGPoint)snapPointToRuler:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v16 = *MEMORY[0x1E0C80C00];
  if (-[PKStrokeGenerator isSnappedToRuler](self, "isSnappedToRuler"))
  {
    -[PKStrokeGenerator getRulerSnapLineOriginAndTangent:andNormal:](self, "getRulerSnapLineOriginAndTangent:andNormal:", &v14, 0);
    v8 = 1.0 / sqrt((v15 - v7) * (v15 - v7) + (v14 - v6) * (v14 - v6));
    v9 = (v14 - v6) * v8;
    v10 = (v15 - v7) * v8;
    v11 = (y - v7) * v10 + (x - v6) * v9;
    x = v6 + v9 * v11;
    y = v7 + v10 * v11;
  }
  v12 = x;
  v13 = y;
  result.y = v13;
  result.x = v12;
  return result;
}

- (void)updateRulerSnapping
{
  unint64_t v3;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;

  if (-[PKStrokeGenerator canSnapToRuler](self, "canSnapToRuler"))
  {
    v3 = self->_drawPoints.__end_ - self->_drawPoints.__begin_;
    if (v3)
    {
      if (v3 >= 0x81 && !-[PKStrokeGenerator isPreviewing](self, "isPreviewing"))
      {
        begin = self->_drawPoints.__begin_;
        end = self->_drawPoints.__end_;
        v6 = *((double *)end - 16) - *(double *)begin;
        v7 = *((double *)end - 15) - *((double *)begin + 1);
        -[PKStrokeGenerator rulerTransform](self, "rulerTransform");
        v8 = v7 * v7 + v6 * v6;
        if (v8 > self->_inputScale * (self->_inputScale * 225.0))
        {
          v10 = *MEMORY[0x1E0C9D538];
          v9 = *(double *)(MEMORY[0x1E0C9D538] + 8);
          if (-[PKStrokeGenerator shouldSnapPointToRuler:](self, "shouldSnapPointToRuler:", *(double *)self->_drawPoints.__begin_, *((double *)self->_drawPoints.__begin_ + 1))&& (v11 = v20 + v16 + v18 * 0.0 - (v20 + v9 * v18 + v16 * v10), v12 = v21 + v17 + v19 * 0.0 - (v21 + v9 * v19 + v17 * v10), v13 = 1.0 / sqrt(v8), v14 = 1.0 / sqrt(v12 * v12 + v11 * v11), fabs(v7 * v13 * (v12 * v14) + v6 * v13 * (v11 * v14)) > 0.86))
          {
            -[PKStrokeGenerator snapToRuler](self, "snapToRuler");
          }
          else
          {
            -[PKStrokeGenerator maskToRuler](self, "maskToRuler");
          }
          -[PKStrokeGenerator setCanSnapToRuler:](self, "setCanSnapToRuler:", 0);
        }
      }
      if (-[PKStrokeGenerator canSnapToRuler](self, "canSnapToRuler"))
      {
        -[PKStroke _clipPlane](self->_currentStroke, "_clipPlane");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
          -[PKStrokeGenerator maskToRuler](self, "maskToRuler");
      }
    }
  }
}

- (BOOL)lastPointIsMasked
{
  double v3;
  double v4;
  BOOL v5;
  BOOL result;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  -[PKStrokeGenerator lastPoint](self, "lastPoint");
  v5 = v4 == INFINITY && v3 == INFINITY;
  result = 0;
  if (!v5
    && -[PKStrokeGenerator useRuler](self, "useRuler")
    && !-[PKStrokeGenerator isSnappedToRuler](self, "isSnappedToRuler"))
  {
    -[PKStrokeGenerator lastPoint](self, "lastPoint");
    -[PKStrokeGenerator distanceToRulerCenter:](self, "distanceToRulerCenter:");
    v8 = v7;
    -[PKStrokeGenerator rulerWidth](self, "rulerWidth");
    v10 = v9 * 0.5;
    -[PKStrokeGenerator rulerTransform](self, "rulerTransform");
    v11 = v10 * sqrt(v13 * v13 + v12 * v12);
    if (-[PKStrokeGenerator isSnappedToRulerTopSide](self, "isSnappedToRulerTopSide"))
    {
      if (v8 < v11)
        return 1;
    }
    if (!-[PKStrokeGenerator isSnappedToRulerTopSide](self, "isSnappedToRulerTopSide") && v11 > -v8)
      return 1;
  }
  return result;
}

- (void)getUpdatedRangeFromIndex:(unint64_t *)a3
{
  NSObject *outputQueue;
  void *v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  outputQueue = self->_outputQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__PKStrokeGenerator_getUpdatedRangeFromIndex___block_invoke;
  block[3] = &unk_1E777D7E8;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(outputQueue, block);
  v4 = (void *)v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __46__PKStrokeGenerator_getUpdatedRangeFromIndex___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "outputFilter");
  result = (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)v2 + 16))(v2, *(_QWORD *)(a1 + 48));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)getInputUpdatedRangeFromIndex:(unint64_t *)a3
{
  _QWORD *v5;

  v5 = (_QWORD *)operator new();
  v5[1] = 0;
  v5[2] = 0;
  *v5 = 0;
  *a3 = -[PKStrokeGenerator copyInputUpdatedRangeFromIndex:into:](self, "copyInputUpdatedRangeFromIndex:into:", *a3, v5);
  return v5;
}

- (unint64_t)copyInputUpdatedRangeFromIndex:(unint64_t)a3 into:(void *)a4
{
  std::vector<PKInputPoint>::__insert_with_size[abi:ne180100]<std::__wrap_iter<PKInputPoint*>,std::__wrap_iter<PKInputPoint*>>((uint64_t)a4, *((_QWORD *)a4 + 1), (char *)self->_drawPoints.__begin_ + 128 * a3, (char *)self->_drawPoints.__end_, (self->_drawPoints.__end_ - ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)self->_drawPoints.__begin_ + 128 * a3)) >> 7);
  return self->_immutableCount;
}

- (void)reset
{
  self->_drawPoints.__end_ = self->_drawPoints.__begin_;
  self->_latestNonPredictedTimestamp = 0.0;
  self->_immutableCount = 0;
  self->_missedUpdates = 0;
  -[PKStrokeGenerator setIsSnappedToRuler:](self, "setIsSnappedToRuler:", 0);
  std::vector<_PKStrokePoint>::resize((uint64_t)&self->_outputPoints, 0);
  self->_outputImmutableCount = 0;
  self->_inputHasChanged = 0;
}

- (_PKStrokePoint)outputCurrentStrokePoint:(SEL)a3
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _OWORD v13[5];
  double radius2;
  _OWORD v15[8];

  v4 = *(_OWORD *)&a4->var9;
  v15[4] = *(_OWORD *)&a4->var7;
  v15[5] = v4;
  v5 = *(_OWORD *)&a4->var13;
  v15[6] = *(_OWORD *)&a4->var11;
  v15[7] = v5;
  v6 = *(_OWORD *)&a4->var1;
  v15[0] = a4->var0;
  v15[1] = v6;
  v7 = *(_OWORD *)&a4->var5;
  v15[2] = *(_OWORD *)&a4->var3;
  v15[3] = v7;
  v8 = *(_OWORD *)&self->_baseValues.location.y;
  v13[0] = *(_OWORD *)&self->_baseValues.timestamp;
  v13[1] = v8;
  v9 = *(_OWORD *)&self->_baseValues.aspectRatio;
  v10 = *(_OWORD *)&self->_baseValues.force;
  v11 = *(_OWORD *)&self->_baseValues.altitude;
  radius2 = self->_baseValues.radius2;
  v13[3] = v10;
  v13[4] = v11;
  v13[2] = v9;
  return -[PKStrokeGenerator outputPoint:baseValues:](self, "outputPoint:baseValues:", v15, v13);
}

- (_PKStrokePoint)outputPoint:(SEL)a3 baseValues:(id *)a4
{
  double touchSensitivity;
  void *v10;
  void *v11;
  int v12;
  __int128 v13;
  __int128 v14;
  PKStroke *currentStroke;
  double var1;
  unint64_t currentActiveInputProperties;
  void *v18;
  uint64_t **v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _PKStrokePoint *result;
  _BOOL4 v31;
  double v32;
  long double v33;
  long double v35[2];
  _OWORD v36[8];
  _OWORD v37[8];
  _OWORD v38[5];
  double radius2;
  uint64_t v40;
  int64_t currentInputType;
  double inputScale;
  double v43;
  double strokeMaxForce;
  uint64_t v45;
  PKStroke *v46;
  unint64_t v47;

  touchSensitivity = self->_touchSensitivity;
  if (-[PKStrokeGenerator isPreviewing](self, "isPreviewing"))
  {
    -[PKStroke ink](self->_currentStroke, "ink");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.ink.watercolor"));

    if (v12)
    {
      a4->var1 = 0.7;
      a4->var3 = 0.785398163;
    }
  }
  v13 = *(_OWORD *)&a5->force;
  v38[2] = *(_OWORD *)&a5->aspectRatio;
  v38[3] = v13;
  v38[4] = *(_OWORD *)&a5->altitude;
  radius2 = a5->radius2;
  v40 = 0;
  v14 = *(_OWORD *)&a5->location.y;
  v38[0] = *(_OWORD *)&a5->timestamp;
  v38[1] = v14;
  LOBYTE(v40) = self->_isSnappedToRuler;
  currentStroke = self->_currentStroke;
  currentInputType = self->_currentInputType;
  inputScale = self->_inputScale;
  v43 = touchSensitivity;
  *(double *)&v14 = self->_eraserIndicatorAlpha;
  strokeMaxForce = self->_strokeMaxForce;
  var1 = strokeMaxForce;
  v45 = v14;
  currentActiveInputProperties = self->_currentActiveInputProperties;
  v46 = currentStroke;
  v47 = currentActiveInputProperties;
  if (strokeMaxForce < a4->var1)
    var1 = a4->var1;
  self->_strokeMaxForce = var1;
  -[PKStroke ink](currentStroke, "ink");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "behavior");
  v19 = (uint64_t **)objc_claimAutoreleasedReturnValue();
  v20 = *(_OWORD *)&a4->var9;
  v37[4] = *(_OWORD *)&a4->var7;
  v37[5] = v20;
  v21 = *(_OWORD *)&a4->var13;
  v37[6] = *(_OWORD *)&a4->var11;
  v37[7] = v21;
  v22 = *(_OWORD *)&a4->var1;
  v37[0] = a4->var0;
  v37[1] = v22;
  v23 = *(_OWORD *)&a4->var5;
  v37[2] = *(_OWORD *)&a4->var3;
  v37[3] = v23;
  self->_eraserIndicatorAlpha = -[PKInkBehavior brushOpacityForPoint:context:](v19, v37, (uint64_t)v38);

  retstr->radius2 = 0.0;
  *(_OWORD *)&retstr->force = 0u;
  *(_OWORD *)&retstr->altitude = 0u;
  *(_OWORD *)&retstr->location.y = 0u;
  *(_OWORD *)&retstr->aspectRatio = 0u;
  *(_OWORD *)&retstr->timestamp = 0u;
  -[PKStroke ink](self->_currentStroke, "ink");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "behavior");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = *(_OWORD *)&a4->var9;
  v36[4] = *(_OWORD *)&a4->var7;
  v36[5] = v26;
  v27 = *(_OWORD *)&a4->var13;
  v36[6] = *(_OWORD *)&a4->var11;
  v36[7] = v27;
  v28 = *(_OWORD *)&a4->var1;
  v36[0] = a4->var0;
  v36[1] = v28;
  v29 = *(_OWORD *)&a4->var5;
  v36[2] = *(_OWORD *)&a4->var3;
  v36[3] = v29;
  -[PKInkBehavior outputForPoint:context:]((uint64_t)v25, (uint64_t)v36, (uint64_t)v38, (uint64_t)retstr);

  v31 = !self->_shouldClearAzimuth;
  if (self->_currentRollAngleEnabled && self->_currentInputType == 1)
  {
    v32 = retstr->azimuth - (a4->var12 - self->_currentBaseRollAngle + self->_currentAdditionalRollAngle);
    v33 = fmod(v32, 6.28318531);
    if (v32 <= 6.28318531 && v32 >= 0.0)
      v33 = v32;
    if (v33 < 0.0)
      v33 = v33 + 6.28318531;
    if (v33 == 0.0)
      v33 = 0.0;
    retstr->azimuth = v33;
    v31 = 1;
  }
  else if (self->_currentShouldClearAzimuth)
  {
    retstr->azimuth = 0.0;
  }
  if (self->_isSnappedToRuler)
  {
    result = (_PKStrokePoint *)-[PKStrokeGenerator getRulerSnapLineOriginAndTangent:andNormal:](self, "getRulerSnapLineOriginAndTangent:andNormal:", 0, v35);
    if (v31)
      retstr->azimuth = atan2(v35[1], v35[0]);
  }
  return result;
}

- (_PKStrokePoint)_latestStrokePoint
{
  NSObject *outputQueue;
  uint64_t *v5;
  __int128 v6;
  __int128 v7;
  _PKStrokePoint *result;
  _QWORD block[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  __n128 (*v13)(uint64_t, uint64_t);
  uint64_t (*v14)();
  const char *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v10 = 0;
  v11 = &v10;
  v12 = 0x8812000000;
  v13 = __Block_byref_object_copy__35;
  v14 = __Block_byref_object_dispose__35;
  v15 = "";
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0;
  outputQueue = self->_outputQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__PKStrokeGenerator__latestStrokePoint__block_invoke;
  block[3] = &unk_1E77795A8;
  block[4] = self;
  block[5] = &v10;
  dispatch_sync(outputQueue, block);
  v5 = v11;
  v6 = *((_OWORD *)v11 + 6);
  *(_OWORD *)&retstr->aspectRatio = *((_OWORD *)v11 + 5);
  *(_OWORD *)&retstr->force = v6;
  *(_OWORD *)&retstr->altitude = *((_OWORD *)v5 + 7);
  *(_QWORD *)&retstr->radius2 = v5[16];
  v7 = *((_OWORD *)v5 + 4);
  *(_OWORD *)&retstr->timestamp = *((_OWORD *)v5 + 3);
  *(_OWORD *)&retstr->location.y = v7;
  _Block_object_dispose(&v10, 8);
  return result;
}

__n128 __39__PKStrokeGenerator__latestStrokePoint__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __n128 result;
  __int128 v7;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
  if (v1 != *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40))
  {
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v3 = *(_OWORD *)(v1 - 40);
    v4 = *(_OWORD *)(v1 - 24);
    v5 = *(_OWORD *)(v1 - 56);
    *(_QWORD *)(v2 + 128) = *(_QWORD *)(v1 - 8);
    *(_OWORD *)(v2 + 96) = v3;
    *(_OWORD *)(v2 + 112) = v4;
    *(_OWORD *)(v2 + 80) = v5;
    result = *(__n128 *)(v1 - 88);
    v7 = *(_OWORD *)(v1 - 72);
    *(__n128 *)(v2 + 48) = result;
    *(_OWORD *)(v2 + 64) = v7;
  }
  return result;
}

- (int64_t)fetchFilteredPointsFromIndex:(int64_t)a3 accessBlock:(id)a4
{
  id v6;
  NSObject *outputQueue;
  id v8;
  int64_t v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  int64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v6 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  outputQueue = self->_outputQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__PKStrokeGenerator_fetchFilteredPointsFromIndex_accessBlock___block_invoke;
  v11[3] = &unk_1E777D810;
  v11[4] = self;
  v12 = v6;
  v13 = &v15;
  v14 = a3;
  v8 = v6;
  dispatch_sync(outputQueue, v11);
  v9 = v16[3];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __62__PKStrokeGenerator_fetchFilteredPointsFromIndex_accessBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 72))
  {
    std::vector<_PKStrokePoint>::resize(v2 + 40, *(_QWORD *)(v2 + 64));
    v3 = objc_msgSend(*(id *)(a1 + 32), "outputFilter");
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)v3 + 24))(v3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64), *(_QWORD *)(a1 + 32) + 40);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72) = 0;
    v2 = *(_QWORD *)(a1 + 32);
  }
  v4 = 0x2E8BA2E8BA2E8BA3 * ((uint64_t)(*(_QWORD *)(v2 + 48) - *(_QWORD *)(v2 + 40)) >> 3);
  v5 = *(_QWORD *)(a1 + 56);
  if (v5 < 0 || v5 >= v4)
  {
    if (v5 > v4)
    {
      v7 = os_log_create("com.apple.pencilkit", ");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        v8 = *(_QWORD *)(a1 + 56);
        v9 = 134218240;
        v10 = v8;
        v11 = 2048;
        v12 = v4;
        _os_log_fault_impl(&dword_1BE213000, v7, OS_LOG_TYPE_FAULT, "fromIndex > outputPointsSize (%lu > %lu)", (uint8_t *)&v9, 0x16u);
      }

    }
  }
  else
  {
    v6 = (void *)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    memcpy(v6, (const void *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 88 * *(_QWORD *)(a1 + 56)), 88 * (v4 - *(_QWORD *)(a1 + 56)));
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
}

- (id)newStrokeWithCurrentData
{
  NSObject *outputQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__27;
  v10 = __Block_byref_object_dispose__28;
  v11 = 0;
  outputQueue = self->_outputQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__PKStrokeGenerator_newStrokeWithCurrentData__block_invoke;
  v5[3] = &unk_1E7777418;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(outputQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __45__PKStrokeGenerator_newStrokeWithCurrentData__block_invoke(uint64_t a1)
{
  id *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(id **)(a1 + 32);
  objc_msgSend(v2[22], "_strokeDataUUID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_newStrokeWithCurrentDataAndStrokeDataUUID:");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)newStrokeWithCurrentDataCopy
{
  NSObject *outputQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__27;
  v10 = __Block_byref_object_dispose__28;
  v11 = 0;
  outputQueue = self->_outputQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__PKStrokeGenerator_newStrokeWithCurrentDataCopy__block_invoke;
  v5[3] = &unk_1E7777418;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(outputQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __49__PKStrokeGenerator_newStrokeWithCurrentDataCopy__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_newStrokeWithCurrentDataAndStrokeDataUUID:");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)_newStrokeWithCurrentDataAndStrokeDataUUID:(id)a3
{
  id v4;
  void *v5;
  _QWORD *compressionFilter;
  id v7;
  PKLiveStrokePath *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int64_t currentInputType;
  double timestamp;
  void *v14;
  PKLiveStrokePath *v15;
  PKStrokePath *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  double v21;
  void *v22;
  uint64_t v23;

  v4 = a3;
  if (!self->_currentStroke
    || (v5 = -[PKStrokeGenerator compressionFilter](self, "compressionFilter"),
        (*(void (**)(void *))(*(_QWORD *)v5 + 40))(v5),
        compressionFilter = self->_compressionFilter,
        compressionFilter[11] == compressionFilter[10]))
  {
    v7 = 0;
  }
  else
  {
    v7 = -[PKStroke copyForMutation](self->_currentStroke, "copyForMutation");
    if (self->_captureLiveData)
    {
      v8 = [PKLiveStrokePath alloc];
      v9 = compressionFilter[10];
      v10 = compressionFilter[11];
      v11 = *((_QWORD *)self->_compressionFilter + 9);
      currentInputType = self->_currentInputType;
      timestamp = self->_baseValues.timestamp;
      v14 = v4;
      if (!v4)
      {
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v15 = -[PKLiveStrokePath initWithPoints:count:immutableCount:inputType:timestamp:UUID:inputPoints:](v8, "initWithPoints:count:immutableCount:inputType:timestamp:UUID:inputPoints:", v9, (v10 - v9) >> 5, v11, currentInputType, v14, &self->_drawPoints, timestamp);
      objc_msgSend(v7, "set_strokeData:", v15);
    }
    else
    {
      v16 = [PKStrokePath alloc];
      v17 = compressionFilter[10];
      v18 = compressionFilter[11];
      v19 = *((_QWORD *)self->_compressionFilter + 9);
      v20 = self->_currentInputType;
      v21 = self->_baseValues.timestamp;
      v14 = v4;
      if (!v4)
      {
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v15 = -[PKStrokePath initWithPoints:count:immutableCount:inputType:timestamp:UUID:](v16, "initWithPoints:count:immutableCount:inputType:timestamp:UUID:", v17, (v18 - v17) >> 5, v19, v20, v14, v21);
      objc_msgSend(v7, "set_strokeData:", v15);
    }

    if (!v4)
    objc_msgSend(v7, "ink");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "_isFountainPenInkV2") && objc_msgSend(v7, "requiredContentVersion") <= 2)
    {
      v23 = objc_msgSend(v22, "_copyWithOriginalRequiredContentVersion");

      v22 = (void *)v23;
      objc_msgSend(v7, "_setInk:", v23);
    }
    if (self->_shouldSetIsSafeForStyleInventorFlag)
      objc_msgSend(v7, "_setIsSafeForStyleInventory:", 1);

  }
  return v7;
}

- (void)drawingUpdatePoint:(id *)a3
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  NSObject *outputQueue;
  _QWORD block[5];
  $9076B28992D74D3AA2059476C2B9E2A9 var0;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;

  block[1] = 3221225472;
  v4 = *(_OWORD *)&a3->var9;
  v14 = *(_OWORD *)&a3->var7;
  v15 = v4;
  v5 = *(_OWORD *)&a3->var13;
  v16 = *(_OWORD *)&a3->var11;
  v17 = v5;
  v6 = *(_OWORD *)&a3->var1;
  var0 = a3->var0;
  v11 = v6;
  v7 = *(_OWORD *)&a3->var5;
  v12 = *(_OWORD *)&a3->var3;
  outputQueue = self->_outputQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __40__PKStrokeGenerator_drawingUpdatePoint___block_invoke;
  block[3] = &unk_1E7779580;
  block[4] = self;
  v13 = v7;
  dispatch_async(outputQueue, block);
  -[PKStrokeGenerator drawingUpdateAllPoints](self, "drawingUpdateAllPoints");
}

void __40__PKStrokeGenerator_drawingUpdatePoint___block_invoke(uint64_t a1)
{
  _QWORD *v1;
  __int128 *v2;
  _OWORD *v3;
  unint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _OWORD *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  char *v18;
  char *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  char *v26;
  char *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72) = 1;
  v1 = *(_QWORD **)(a1 + 32);
  v2 = (__int128 *)(a1 + 40);
  v3 = (_OWORD *)v1[28];
  v4 = v1[29];
  if ((unint64_t)v3 >= v4)
  {
    v12 = v1[27];
    v13 = ((uint64_t)v3 - v12) >> 7;
    v14 = v13 + 1;
    if ((unint64_t)(v13 + 1) >> 57)
      std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
    v15 = v4 - v12;
    if (v15 >> 6 > v14)
      v14 = v15 >> 6;
    if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFF80)
      v16 = 0x1FFFFFFFFFFFFFFLL;
    else
      v16 = v14;
    if (v16)
      v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<PKInputPoint>>((uint64_t)(v1 + 29), v16);
    else
      v17 = 0;
    v18 = &v17[128 * v13];
    v19 = &v17[128 * v16];
    v20 = *v2;
    v21 = v2[1];
    v22 = v2[3];
    *((_OWORD *)v18 + 2) = v2[2];
    *((_OWORD *)v18 + 3) = v22;
    *(_OWORD *)v18 = v20;
    *((_OWORD *)v18 + 1) = v21;
    v23 = v2[4];
    v24 = v2[5];
    v25 = v2[7];
    *((_OWORD *)v18 + 6) = v2[6];
    *((_OWORD *)v18 + 7) = v25;
    *((_OWORD *)v18 + 4) = v23;
    *((_OWORD *)v18 + 5) = v24;
    v11 = v18 + 128;
    v27 = (char *)v1[27];
    v26 = (char *)v1[28];
    if (v26 != v27)
    {
      do
      {
        v28 = *((_OWORD *)v26 - 8);
        v29 = *((_OWORD *)v26 - 7);
        v30 = *((_OWORD *)v26 - 5);
        *((_OWORD *)v18 - 6) = *((_OWORD *)v26 - 6);
        *((_OWORD *)v18 - 5) = v30;
        *((_OWORD *)v18 - 8) = v28;
        *((_OWORD *)v18 - 7) = v29;
        v31 = *((_OWORD *)v26 - 4);
        v32 = *((_OWORD *)v26 - 3);
        v33 = *((_OWORD *)v26 - 1);
        *((_OWORD *)v18 - 2) = *((_OWORD *)v26 - 2);
        *((_OWORD *)v18 - 1) = v33;
        *((_OWORD *)v18 - 4) = v31;
        *((_OWORD *)v18 - 3) = v32;
        v18 -= 128;
        v26 -= 128;
      }
      while (v26 != v27);
      v26 = (char *)v1[27];
    }
    v1[27] = v18;
    v1[28] = v11;
    v1[29] = v19;
    if (v26)
      operator delete(v26);
  }
  else
  {
    v5 = *v2;
    v6 = *(_OWORD *)(a1 + 56);
    v7 = *(_OWORD *)(a1 + 88);
    v3[2] = *(_OWORD *)(a1 + 72);
    v3[3] = v7;
    *v3 = v5;
    v3[1] = v6;
    v8 = *(_OWORD *)(a1 + 104);
    v9 = *(_OWORD *)(a1 + 120);
    v10 = *(_OWORD *)(a1 + 152);
    v3[6] = *(_OWORD *)(a1 + 136);
    v3[7] = v10;
    v3[4] = v8;
    v3[5] = v9;
    v11 = v3 + 8;
  }
  v1[28] = v11;
}

- (void)drawingUpdateAllPoints
{
  -[PKStrokeGenerator drawingUpdateAllPointsDidTimeoutWithStrokeUUID:](self, "drawingUpdateAllPointsDidTimeoutWithStrokeUUID:", 0);
}

- (void)drawingUpdateAllPointsDidTimeoutWithStrokeUUID:(id)a3
{
  id v4;
  NSObject *outputQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  outputQueue = self->_outputQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__PKStrokeGenerator_drawingUpdateAllPointsDidTimeoutWithStrokeUUID___block_invoke;
  v7[3] = &unk_1E7777440;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(outputQueue, v7);

}

uint64_t __68__PKStrokeGenerator_drawingUpdateAllPointsDidTimeoutWithStrokeUUID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_drawingUpdateAllPointsDidTimeoutWithStrokeUUID:", *(_QWORD *)(a1 + 40));
}

- (void)_drawingUpdateAllPointsDidTimeoutWithStrokeUUID:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  if (!v6
    || (-[PKStroke _strokeUUID](self->_currentStroke, "_strokeUUID"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isEqual:", v6),
        v4,
        (v5 & 1) != 0))
  {
    -[PKStrokeGenerator _drawingUpdateAllPointsDidTimeout:updateSemaphore:](self, "_drawingUpdateAllPointsDidTimeout:updateSemaphore:", v6 != 0, 1);
  }

}

- (void)_drawingUpdateAllPointsDidTimeout:(BOOL)a3 updateSemaphore:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  char v9;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v10;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v11;
  uint64_t v12;
  char *v13;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v14;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v15;
  int64_t immutableCount;
  uint64_t v17;
  double *v18;
  double v19;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  unint64_t v25;
  NSObject *v26;
  NSObject *v27;
  int64_t missedUpdates;
  int64_t v29;
  int v30;
  int64_t v31;
  __int16 v32;
  int64_t v33;
  uint64_t v34;

  v4 = a4;
  v5 = a3;
  v34 = *MEMORY[0x1E0C80C00];
  begin = self->_updatedDrawPoints.__begin_;
  end = self->_updatedDrawPoints.__end_;
  if (end == begin)
    goto LABEL_25;
  v9 = 0;
  v10 = 0;
  v11 = self->_drawPoints.__begin_;
  v12 = (self->_drawPoints.__end_ - v11) >> 7;
  v13 = (char *)v11 + 80;
  v14 = begin;
LABEL_3:
  while (2)
  {
    v15 = v14;
    immutableCount = self->_immutableCount;
    v17 = v12 - immutableCount;
    if (v12 > immutableCount)
    {
      v18 = (double *)&v13[128 * immutableCount];
      do
      {
        if (*(_QWORD *)v18 == *((_QWORD *)v15 + 10))
        {
          v19 = *((double *)v15 + 2);
          *(v18 - 8) = v19;
          if (self->_currentRollAngleEnabled && self->_enableDidUpdateRoll)
            v18[3] = *((double *)v15 + 13);
          if (!self->_currentInputType)
            *(v18 - 8) = v19 / self->_touchSensitivity;
          if (!*((_QWORD *)v15 + 15))
            *v18 = NAN;
          if (!self->_keepPredictedTouchesAtEndOfStroke)
          {
            v14 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v15 + 128);
            v9 = 1;
            v10 = v15;
            if (($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v15 + 128) == end)
              goto LABEL_21;
            goto LABEL_3;
          }
          v9 = 1;
          v10 = v15;
        }
        v18 += 16;
        --v17;
      }
      while (v17);
    }
    v14 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v15 + 128);
    if (($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v15 + 128) != end)
      continue;
    break;
  }
  v15 = v10;
  if ((v9 & 1) != 0)
  {
LABEL_21:
    v20 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v15 + 128);
    if (begin != ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v15 + 128))
    {
      v21 = end - v20;
      if (end != v20)
        memmove(begin, v20, end - v20);
      self->_updatedDrawPoints.__end_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + v21);
    }
  }
LABEL_25:
  -[PKStrokeGenerator updateImmutableCount](self, "updateImmutableCount");
  if (self->_drawingEndedButNotFinished)
  {
    v22 = self->_immutableCount;
    v23 = self->_drawPoints.__end_ - self->_drawPoints.__begin_;
    if (v22 >= v23 >> 7 || v5)
    {
      v25 = v23 >> 7;
      self->_drawingEndedButNotFinished = 0;
      if (v22 < v25)
      {
        self->_immutableCount = v25;
        if (!v4)
          return;
        v26 = os_log_create("com.apple.pencilkit", "Stroke Generator");
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v30) = 0;
          _os_log_debug_impl(&dword_1BE213000, v26, OS_LOG_TYPE_DEBUG, "Timeout waiting for updates", (uint8_t *)&v30, 2u);
        }

      }
      else if (!v4)
      {
        return;
      }
      if (self->_missedUpdates >= 1)
      {
        v27 = os_log_create("com.apple.pencilkit", "Stroke Generator");
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          v29 = self->_immutableCount;
          missedUpdates = self->_missedUpdates;
          v30 = 134218240;
          v31 = missedUpdates;
          v32 = 2048;
          v33 = v29;
          _os_log_error_impl(&dword_1BE213000, v27, OS_LOG_TYPE_ERROR, "Missed updates at end of stroke: %lu (total points: %lu)", (uint8_t *)&v30, 0x16u);
        }

      }
      dispatch_semaphore_signal((dispatch_semaphore_t)self->_drawingWaitForFinishSemaphore);
    }
  }
}

- (void)updateImmutableCount
{
  void *v3;
  double v4;
  double v5;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  uint64_t v7;
  uint64_t v8;
  int64_t i;
  char *v10;
  uint64_t v11;
  uint64_t *v12;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemUptime");
  v5 = v4;

  if (!-[PKStrokeGenerator canSnapToRuler](self, "canSnapToRuler"))
  {
    begin = self->_drawPoints.__begin_;
    v7 = self->_drawPoints.__end_ - begin;
    if ((unint64_t)v7 >= 0x81)
    {
      v8 = v7 >> 7;
      for (i = self->_immutableCount; i < v8; self->_immutableCount = i)
      {
        v10 = (char *)begin + 128 * i;
        v12 = (uint64_t *)(v10 + 80);
        v11 = *((_QWORD *)v10 + 10);
        if ((v11 & 0x8000000000000000) == 0)
        {
          if (*((double *)v10 + 8) >= v5 + -0.1)
            return;
          *v12 = -1;
          ++self->_missedUpdates;
          v11 = *v12;
        }
        if (v10[72])
          break;
        if ((v11 & 0x8000000000000000) == 0)
          break;
        i = self->_immutableCount + 1;
      }
    }
  }
}

- (void)_removePredictedTouches
{
  vector<PKInputPoint, std::allocator<PKInputPoint>> *p_drawPoints;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  int64_t v5;
  uint64_t v6;
  unsigned __int8 *i;

  begin = self->_drawPoints.__begin_;
  end = self->_drawPoints.__end_;
  p_drawPoints = &self->_drawPoints;
  v5 = end - begin;
  v6 = (end - begin) >> 7;
  for (i = (unsigned __int8 *)begin + (v5 & 0xFFFFFFFFFFFFFF80) - 56; v6-- >= 1; i -= 128)
  {
    if (!*i)
    {
      std::vector<PKInputPoint>::resize((uint64_t)p_drawPoints, v6 + 1);
      return;
    }
  }
}

- (void)_updatePredictedTouches
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  uint64_t v3;
  uint64_t v4;
  double *v5;
  uint64_t v6;
  int v8;
  uint64_t v9;
  char v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double *v16;
  double *v17;
  double v18;
  char *v19;
  double *v20;
  double v21;
  char *v22;
  char *v23;

  begin = self->_drawPoints.__begin_;
  v3 = self->_drawPoints.__end_ - begin;
  v4 = v3 >> 7;
  v5 = (double *)((char *)begin + (v3 & 0xFFFFFFFFFFFFFF80) + 24);
  v6 = v3 >> 7;
  while (v6-- >= 1)
  {
    v8 = *((unsigned __int8 *)v5 - 80);
    v5 -= 16;
    if (!v8)
    {
      v9 = v6 + 1;
      if (v9 < v4)
      {
        v10 = 0;
        v11 = *(v5 - 1);
        v12 = *v5;
        v13 = *((_QWORD *)v5 + 1);
        v14 = *((_QWORD *)v5 + 7);
        v15 = v5[10];
        do
        {
          while (1)
          {
            v16 = (double *)((char *)begin + 128 * v9);
            if (vabdd_f64(v16[2], v11) >= 0.00999999978)
            {
              v16[2] = v11;
              v10 = 1;
            }
            v18 = v16[3];
            v17 = v16 + 3;
            if (vabdd_f64(v18, v12) >= 0.00999999978)
            {
              *v17 = v12;
              v10 = 1;
            }
            v19 = (char *)begin + 128 * v9;
            if (vabdd_f64(*((double *)v19 + 4), v12) >= 0.00999999978)
            {
              *((_QWORD *)v19 + 4) = v13;
              v10 = 1;
            }
            v21 = *((double *)v19 + 13);
            v20 = (double *)(v19 + 104);
            if (vabdd_f64(v21, v15) < 0.00999999978)
              break;
            *v20 = v15;
            v23 = (char *)begin + 128 * v9;
            *((_QWORD *)v23 + 10) = v14;
            v23[72] = 0;
            ++v9;
            v10 = 1;
            if (v9 == v4)
              goto LABEL_18;
          }
          v22 = (char *)begin + 128 * v9;
          *((_QWORD *)v22 + 10) = v14;
          v22[72] = 0;
          ++v9;
        }
        while (v9 != v4);
        if ((v10 & 1) == 0)
          return;
LABEL_18:
        self->_inputHasChanged = 1;
      }
      return;
    }
  }
}

- (double)latestNonPredictedTimestamp
{
  NSObject *outputQueue;
  double v3;
  _QWORD v5[6];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  outputQueue = self->_outputQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__PKStrokeGenerator_latestNonPredictedTimestamp__block_invoke;
  v5[3] = &unk_1E7777418;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(outputQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __48__PKStrokeGenerator_latestNonPredictedTimestamp__block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(*(_QWORD *)(a1 + 32) + 8);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (double)latestTimestamp
{
  NSObject *outputQueue;
  double v3;
  _QWORD v5[6];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  outputQueue = self->_outputQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__PKStrokeGenerator_latestTimestamp__block_invoke;
  v5[3] = &unk_1E77795A8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(outputQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __36__PKStrokeGenerator_latestTimestamp__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  double result;

  v1 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v1 + 16);
  v2 = *(_QWORD *)(v1 + 24);
  if (v3 != v2)
  {
    result = *(double *)(v2 - 64);
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

- (void)addPoints:()vector<PKInputPoint
{
  NSObject *inputQueue;
  _QWORD v4[5];
  void *__p;
  void *v6;
  uint64_t v7;

  inputQueue = self->_inputQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3321888768;
  v4[2] = __31__PKStrokeGenerator_addPoints___block_invoke;
  v4[3] = &unk_1E7774D68;
  v4[4] = self;
  __p = 0;
  v6 = 0;
  v7 = 0;
  std::vector<PKInputPoint>::__init_with_size[abi:ne180100]<PKInputPoint*,PKInputPoint*>(&__p, a3->__begin_, (uint64_t)a3->__end_, (a3->__end_ - a3->__begin_) >> 7);
  dispatch_async(inputQueue, v4);
  if (__p)
  {
    v6 = __p;
    operator delete(__p);
  }
}

void __31__PKStrokeGenerator_addPoints___block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v3;
  _QWORD v4[5];
  void *__p;
  void *v6;
  uint64_t v7;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 176))
  {
    v3 = *(NSObject **)(v1 + 400);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3321888768;
    v4[2] = __31__PKStrokeGenerator_addPoints___block_invoke_2;
    v4[3] = &unk_1E7774D68;
    v6 = 0;
    v7 = 0;
    __p = 0;
    std::vector<PKInputPoint>::__init_with_size[abi:ne180100]<PKInputPoint*,PKInputPoint*>(&__p, *(const void **)(a1 + 40), *(_QWORD *)(a1 + 48), (uint64_t)(*(_QWORD *)(a1 + 48) - *(_QWORD *)(a1 + 40)) >> 7);
    v4[4] = *(_QWORD *)(a1 + 32);
    dispatch_sync(v3, v4);
    if (__p)
    {
      v6 = __p;
      operator delete(__p);
    }
  }
}

uint64_t __31__PKStrokeGenerator_addPoints___block_invoke_2(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _OWORD v14[8];

  v1 = *(_QWORD *)(result + 48) - *(_QWORD *)(result + 40);
  if (v1 >= 1)
  {
    v2 = result;
    v3 = 0;
    v4 = (unint64_t)v1 >> 7;
    if (v4 <= 1)
      v5 = 1;
    else
      v5 = v4;
    do
    {
      v6 = *(void **)(v2 + 32);
      v7 = (__int128 *)(*(_QWORD *)(v2 + 40) + v3);
      v8 = v7[3];
      v10 = *v7;
      v9 = v7[1];
      v14[2] = v7[2];
      v14[3] = v8;
      v14[0] = v10;
      v14[1] = v9;
      v11 = v7[7];
      v13 = v7[4];
      v12 = v7[5];
      v14[6] = v7[6];
      v14[7] = v11;
      v14[4] = v13;
      v14[5] = v12;
      result = objc_msgSend(v6, "_drawingAddPoint:", v14);
      v3 += 128;
      --v5;
    }
    while (v5);
  }
  return result;
}

- (void)addPoint:(id *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  NSObject *inputQueue;
  _QWORD block[5];
  $9076B28992D74D3AA2059476C2B9E2A9 var0;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;

  block[1] = 3221225472;
  v3 = *(_OWORD *)&a3->var9;
  v13 = *(_OWORD *)&a3->var7;
  v14 = v3;
  v4 = *(_OWORD *)&a3->var13;
  v15 = *(_OWORD *)&a3->var11;
  v16 = v4;
  v5 = *(_OWORD *)&a3->var1;
  var0 = a3->var0;
  v10 = v5;
  v6 = *(_OWORD *)&a3->var5;
  v11 = *(_OWORD *)&a3->var3;
  inputQueue = self->_inputQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __30__PKStrokeGenerator_addPoint___block_invoke;
  block[3] = &unk_1E7779580;
  block[4] = self;
  v12 = v6;
  dispatch_async(inputQueue, block);
}

__n128 __30__PKStrokeGenerator_addPoint___block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __n128 result;
  _QWORD block[5];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 176))
  {
    v2 = *(NSObject **)(v1 + 400);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __30__PKStrokeGenerator_addPoint___block_invoke_2;
    block[3] = &unk_1E7779580;
    block[4] = v1;
    v3 = *(_OWORD *)(a1 + 120);
    v12 = *(_OWORD *)(a1 + 104);
    v13 = v3;
    v14 = *(_OWORD *)(a1 + 136);
    v15 = *(_OWORD *)(a1 + 152);
    v4 = *(_OWORD *)(a1 + 56);
    v8 = *(_OWORD *)(a1 + 40);
    v9 = v4;
    v5 = *(_OWORD *)(a1 + 88);
    v10 = *(_OWORD *)(a1 + 72);
    v11 = v5;
    dispatch_sync(v2, block);
  }
  return result;
}

uint64_t __30__PKStrokeGenerator_addPoint___block_invoke_2(uint64_t a1)
{
  void *v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  _OWORD v7[8];

  v1 = *(void **)(a1 + 32);
  v2 = *(_OWORD *)(a1 + 120);
  v7[4] = *(_OWORD *)(a1 + 104);
  v7[5] = v2;
  v3 = *(_OWORD *)(a1 + 152);
  v7[6] = *(_OWORD *)(a1 + 136);
  v7[7] = v3;
  v4 = *(_OWORD *)(a1 + 56);
  v7[0] = *(_OWORD *)(a1 + 40);
  v7[1] = v4;
  v5 = *(_OWORD *)(a1 + 88);
  v7[2] = *(_OWORD *)(a1 + 72);
  v7[3] = v5;
  return objc_msgSend(v1, "_drawingAddPoint:", v7);
}

- (void)closeStroke
{
  NSObject *inputQueue;
  _QWORD block[5];

  inputQueue = self->_inputQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__PKStrokeGenerator_closeStroke__block_invoke;
  block[3] = &unk_1E7776F38;
  block[4] = self;
  dispatch_async(inputQueue, block);
}

void __32__PKStrokeGenerator_closeStroke__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 176))
  {
    v2 = *(NSObject **)(v1 + 400);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __32__PKStrokeGenerator_closeStroke__block_invoke_2;
    block[3] = &unk_1E7776F38;
    block[4] = v1;
    dispatch_sync(v2, block);
  }
}

uint64_t __32__PKStrokeGenerator_closeStroke__block_invoke_2(uint64_t a1)
{
  double *v2;
  uint64_t v3;
  double v4;
  double v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  uint64_t result;
  double v15[2];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;

  objc_msgSend(*(id *)(a1 + 32), "_removePredictedTouches");
  v2 = *(double **)(*(_QWORD *)(a1 + 32) + 16);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  v4 = *(double *)(v3 - 128);
  v5 = *(double *)(v3 - 120);
  v6 = *(_OWORD *)(v3 - 32);
  v27 = *(_OWORD *)(v3 - 48);
  v28 = v6;
  v29 = *(_OWORD *)(v3 - 16);
  v7 = *(_OWORD *)(v3 - 96);
  v23 = *(_OWORD *)(v3 - 112);
  v24 = v7;
  v8 = *(_OWORD *)(v3 - 64);
  v25 = *(_OWORD *)(v3 - 80);
  v26 = v8;
  v9 = *v2;
  v10 = v2[1];
  v11 = 1.0 / (double)(uint64_t)fmax(sqrt((v10 - v5) * (v10 - v5) + (*v2 - v4) * (*v2 - v4)) / 6.0, 2.0);
  v12 = 0.0;
  do
  {
    v13 = *(void **)(a1 + 32);
    v15[0] = v9 * v12 + v4 * (1.0 - v12);
    v15[1] = v10 * v12 + v5 * (1.0 - v12);
    v20 = v27;
    v21 = v28;
    v22 = v29;
    v16 = v23;
    v17 = v24;
    v18 = v25;
    v19 = v26;
    result = objc_msgSend(v13, "_drawingAddPoint:", v15);
    v12 = v11 + v12;
  }
  while (v12 <= 1.0);
  return result;
}

- (void)_drawingAddPoint:(id *)a3
{
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  long double currentStrokeRollBaseValue;
  double var12;
  long double v16;
  double v18;
  double var7;
  CGFloat v20;
  CGFloat v21;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *value;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  $9076B28992D74D3AA2059476C2B9E2A9 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v30;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char *v36;
  char *v37;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v38;
  $9076B28992D74D3AA2059476C2B9E2A9 var0;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v45;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  $9076B28992D74D3AA2059476C2B9E2A9 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _OWORD v61[8];
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  if (-[NSArray count](self->_allInputPointFilters, "count"))
  {
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v5 = self->_allInputPointFilters;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v63;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v63 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
          v10 = *(_OWORD *)&a3->var9;
          v61[4] = *(_OWORD *)&a3->var7;
          v61[5] = v10;
          v11 = *(_OWORD *)&a3->var13;
          v61[6] = *(_OWORD *)&a3->var11;
          v61[7] = v11;
          v12 = *(_OWORD *)&a3->var1;
          v61[0] = a3->var0;
          v61[1] = v12;
          v13 = *(_OWORD *)&a3->var5;
          v61[2] = *(_OWORD *)&a3->var3;
          v61[3] = v13;
          objc_msgSend(v9, "addInputPoint:", v61, *(_OWORD *)&v53, v54, v55, v56, v57, v58, v59, v60);
          if (v9)
          {
            objc_msgSend(v9, "currentFilteredPoint");
          }
          else
          {
            v59 = 0u;
            v60 = 0u;
            v57 = 0u;
            v58 = 0u;
            v55 = 0u;
            v56 = 0u;
            v53 = 0u;
            v54 = 0u;
          }
          *(_OWORD *)&a3->var7 = v57;
          *(_OWORD *)&a3->var9 = v58;
          *(_OWORD *)&a3->var11 = v59;
          *(_OWORD *)&a3->var13 = v60;
          a3->var0 = v53;
          *(_OWORD *)&a3->var1 = v54;
          *(_OWORD *)&a3->var3 = v55;
          *(_OWORD *)&a3->var5 = v56;
        }
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
      }
      while (v6);
    }

  }
  self->_inputHasChanged = 1;
  if (!a3->var8)
  {
    currentStrokeRollBaseValue = self->_currentStrokeRollBaseValue;
    var12 = a3->var12;
    if (currentStrokeRollBaseValue >= 0.0)
    {
      DKDDiffAngleInRadians(a3->var12, currentStrokeRollBaseValue);
      if (v18 >= self->_currentStrokeRollDeltaMin)
      {
        if (v18 > self->_currentStrokeRollDeltaMax)
          self->_currentStrokeRollDeltaMax = v18;
      }
      else
      {
        self->_currentStrokeRollDeltaMin = v18;
      }
    }
    else
    {
      v16 = fmod(a3->var12, 6.28318531);
      if (var12 <= 6.28318531 && var12 >= 0.0)
        v16 = var12;
      if (v16 < 0.0)
        v16 = v16 + 6.28318531;
      if (v16 == 0.0)
        v16 = 0.0;
      self->_currentStrokeRollBaseValue = v16;
      self->_currentStrokeRollDeltaMin = 0.0;
      self->_currentStrokeRollDeltaMax = 0.0;
    }
    var7 = a3->var7;
    if (var7 < self->_latestNonPredictedTimestamp)
      var7 = self->_latestNonPredictedTimestamp;
    self->_latestNonPredictedTimestamp = var7;
    -[PKStrokeGenerator _removePredictedTouches](self, "_removePredictedTouches", *(_OWORD *)&v53, v54, v55, v56, v57, v58, v59, v60);
  }
  -[PKStrokeGenerator snapPointToRuler:](self, "snapPointToRuler:", a3->var0.var0.x, a3->var0.var0.y, *(_OWORD *)&v53, v54, v55, v56, v57, v58, v59, v60);
  a3->var0.var0.x = v20;
  a3->var0.var0.y = v21;
  if (a3->var8)
    a3->var9 = -1;
  value = self->_drawPoints.__end_cap_.__value_;
  end = self->_drawPoints.__end_;
  if (end >= value)
  {
    begin = self->_drawPoints.__begin_;
    v32 = (end - begin) >> 7;
    v33 = v32 + 1;
    if ((unint64_t)(v32 + 1) >> 57)
      std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
    v34 = value - begin;
    if (v34 >> 6 > v33)
      v33 = v34 >> 6;
    if ((unint64_t)v34 >= 0x7FFFFFFFFFFFFF80)
      v35 = 0x1FFFFFFFFFFFFFFLL;
    else
      v35 = v33;
    if (v35)
      v36 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<PKInputPoint>>((uint64_t)&self->_drawPoints.__end_cap_, v35);
    else
      v36 = 0;
    v37 = &v36[128 * v32];
    v38 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v36[128 * v35];
    var0 = a3->var0;
    v40 = *(_OWORD *)&a3->var1;
    v41 = *(_OWORD *)&a3->var5;
    *((_OWORD *)v37 + 2) = *(_OWORD *)&a3->var3;
    *((_OWORD *)v37 + 3) = v41;
    *($9076B28992D74D3AA2059476C2B9E2A9 *)v37 = var0;
    *((_OWORD *)v37 + 1) = v40;
    v42 = *(_OWORD *)&a3->var7;
    v43 = *(_OWORD *)&a3->var9;
    v44 = *(_OWORD *)&a3->var13;
    *((_OWORD *)v37 + 6) = *(_OWORD *)&a3->var11;
    *((_OWORD *)v37 + 7) = v44;
    *((_OWORD *)v37 + 4) = v42;
    *((_OWORD *)v37 + 5) = v43;
    v30 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v37 + 128);
    v46 = self->_drawPoints.__begin_;
    v45 = self->_drawPoints.__end_;
    if (v45 != v46)
    {
      do
      {
        v47 = *((_OWORD *)v45 - 8);
        v48 = *((_OWORD *)v45 - 7);
        v49 = *((_OWORD *)v45 - 5);
        *((_OWORD *)v37 - 6) = *((_OWORD *)v45 - 6);
        *((_OWORD *)v37 - 5) = v49;
        *((_OWORD *)v37 - 8) = v47;
        *((_OWORD *)v37 - 7) = v48;
        v50 = *((_OWORD *)v45 - 4);
        v51 = *((_OWORD *)v45 - 3);
        v52 = *((_OWORD *)v45 - 1);
        *((_OWORD *)v37 - 2) = *((_OWORD *)v45 - 2);
        *((_OWORD *)v37 - 1) = v52;
        *((_OWORD *)v37 - 4) = v50;
        *((_OWORD *)v37 - 3) = v51;
        v37 -= 128;
        v45 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v45 - 128);
      }
      while (v45 != v46);
      v45 = self->_drawPoints.__begin_;
    }
    self->_drawPoints.__begin_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v37;
    self->_drawPoints.__end_ = v30;
    self->_drawPoints.__end_cap_.__value_ = v38;
    if (v45)
      operator delete(v45);
  }
  else
  {
    v24 = a3->var0;
    v25 = *(_OWORD *)&a3->var1;
    v26 = *(_OWORD *)&a3->var5;
    *((_OWORD *)end + 2) = *(_OWORD *)&a3->var3;
    *((_OWORD *)end + 3) = v26;
    *($9076B28992D74D3AA2059476C2B9E2A9 *)end = v24;
    *((_OWORD *)end + 1) = v25;
    v27 = *(_OWORD *)&a3->var7;
    v28 = *(_OWORD *)&a3->var9;
    v29 = *(_OWORD *)&a3->var13;
    *((_OWORD *)end + 6) = *(_OWORD *)&a3->var11;
    *((_OWORD *)end + 7) = v29;
    *((_OWORD *)end + 4) = v27;
    *((_OWORD *)end + 5) = v28;
    v30 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)end + 128);
  }
  self->_drawPoints.__end_ = v30;
  -[PKStrokeGenerator updateRulerSnapping](self, "updateRulerSnapping");
  -[PKStrokeGenerator drawingUpdateAllPoints](self, "drawingUpdateAllPoints");
  -[PKStrokeGenerator updateImmutableCount](self, "updateImmutableCount");
  -[PKStrokeGenerator setLastPoint:](self, "setLastPoint:", a3->var0.var0.x, a3->var0.var0.y);
}

- (void)drawingEndedEstimatesTimeout:(double)a3 completion:(id)a4
{
  id v6;
  NSObject *inputQueue;
  id v8;
  _QWORD block[5];
  id v10;
  double v11;

  v6 = a4;
  inputQueue = self->_inputQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__PKStrokeGenerator_drawingEndedEstimatesTimeout_completion___block_invoke;
  block[3] = &unk_1E777D838;
  block[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  dispatch_async(inputQueue, block);
  -[PKStrokeGenerator setLastPoint:](self, "setLastPoint:", INFINITY, INFINITY);

}

void __61__PKStrokeGenerator_drawingEndedEstimatesTimeout_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  double v6;
  NSObject *v7;
  _BOOL4 v8;
  dispatch_time_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[6];
  uint8_t v21[16];
  _QWORD block[6];
  uint8_t buf[8];
  uint8_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 176))
  {
    v2 = os_log_create("com.apple.pencilkit", "Stroke Generator");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1BE213000, v2, OS_LOG_TYPE_DEBUG, "Drawing ended", buf, 2u);
    }

    *(_QWORD *)buf = 0;
    v24 = buf;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__27;
    v27 = __Block_byref_object_dispose__28;
    v28 = 0;
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(NSObject **)(v3 + 400);
    v5 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__PKStrokeGenerator_drawingEndedEstimatesTimeout_completion___block_invoke_33;
    block[3] = &unk_1E77795A8;
    block[4] = v3;
    block[5] = buf;
    dispatch_sync(v4, block);
    if (*((_QWORD *)v24 + 5))
    {
      v6 = *(double *)(a1 + 48);
      v7 = os_log_create("com.apple.pencilkit", "Stroke Generator");
      v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
      if (v6 <= 0.0)
      {
        if (v8)
        {
          *(_WORD *)v21 = 0;
          _os_log_debug_impl(&dword_1BE213000, v7, OS_LOG_TYPE_DEBUG, "No estimates timeout", v21, 2u);
        }

        objc_msgSend(*(id *)(a1 + 32), "_drawingUpdateAllPointsDidTimeout:updateSemaphore:", 1, 0);
        v12 = (void *)*((_QWORD *)v24 + 5);
        *((_QWORD *)v24 + 5) = 0;

      }
      else
      {
        if (v8)
        {
          *(_WORD *)v21 = 0;
          _os_log_debug_impl(&dword_1BE213000, v7, OS_LOG_TYPE_DEBUG, "Waiting for estimates", v21, 2u);
        }

        v9 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 48) * 1000000000.0));
        v10 = *(_QWORD *)(a1 + 32);
        v11 = *(NSObject **)(v10 + 400);
        v20[0] = v5;
        v20[1] = 3221225472;
        v20[2] = __61__PKStrokeGenerator_drawingEndedEstimatesTimeout_completion___block_invoke_34;
        v20[3] = &unk_1E77795A8;
        v20[4] = v10;
        v20[5] = buf;
        dispatch_after(v9, v11, v20);
        dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 248), 0xFFFFFFFFFFFFFFFFLL);
      }
    }
    v13 = os_log_create("com.apple.pencilkit", "Stroke Generator");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v21 = 0;
      _os_log_debug_impl(&dword_1BE213000, v13, OS_LOG_TYPE_DEBUG, "Finishing drawing ended", v21, 2u);
    }

    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(NSObject **)(v14 + 400);
    v19[0] = v5;
    v19[1] = 3221225472;
    v19[2] = __61__PKStrokeGenerator_drawingEndedEstimatesTimeout_completion___block_invoke_35;
    v19[3] = &unk_1E7776F38;
    v19[4] = v14;
    dispatch_sync(v15, v19);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(NSObject **)(v16 + 400);
    v18[0] = v5;
    v18[1] = 3221225472;
    v18[2] = __61__PKStrokeGenerator_drawingEndedEstimatesTimeout_completion___block_invoke_2;
    v18[3] = &unk_1E7776F38;
    v18[4] = v16;
    dispatch_sync(v17, v18);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __61__PKStrokeGenerator_drawingEndedEstimatesTimeout_completion___block_invoke_33(uint64_t a1)
{
  _BYTE *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72) = 1;
  v2 = *(_BYTE **)(a1 + 32);
  if (v2[256])
    objc_msgSend(v2, "_updatePredictedTouches");
  else
    objc_msgSend(v2, "_removePredictedTouches");
  objc_msgSend(*(id *)(a1 + 32), "setCanSnapToRuler:", 0);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 440) + 40) = 0;
  v3 = objc_msgSend(*(id *)(a1 + 32), "outputFilter");
  (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  objc_msgSend(*(id *)(a1 + 32), "updateImmutableCount");
  v4 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v4 + 200) != (uint64_t)(*(_QWORD *)(v4 + 24) - *(_QWORD *)(v4 + 16)) >> 7)
  {
    objc_msgSend(*(id *)(v4 + 176), "_strokeUUID");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 240) = 1;
  }
}

uint64_t __61__PKStrokeGenerator_drawingEndedEstimatesTimeout_completion___block_invoke_34(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_drawingUpdateAllPointsDidTimeoutWithStrokeUUID:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void __61__PKStrokeGenerator_drawingEndedEstimatesTimeout_completion___block_invoke_35(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_newStrokeWithCurrentDataAndStrokeDataUUID:", 0);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 176);
  *(_QWORD *)(v3 + 176) = v2;

}

void __61__PKStrokeGenerator_drawingEndedEstimatesTimeout_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "outputFilter");
  (*(void (**)(uint64_t))(*(_QWORD *)v2 + 32))(v2);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 176);
  *(_QWORD *)(v3 + 176) = 0;

}

- (void)drawingCancelledWithCompletion:(id)a3
{
  id v4;
  NSObject *inputQueue;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  PKStrokeGenerator *v11;
  id v12;

  v4 = a3;
  inputQueue = self->_inputQueue;
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __52__PKStrokeGenerator_drawingCancelledWithCompletion___block_invoke;
  v10 = &unk_1E7776F88;
  v11 = self;
  v12 = v4;
  v6 = v4;
  dispatch_async(inputQueue, &v7);
  -[PKStrokeGenerator setLastPoint:](self, "setLastPoint:", INFINITY, INFINITY, v7, v8, v9, v10, v11);

}

void __52__PKStrokeGenerator_drawingCancelledWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = os_log_create("com.apple.pencilkit", "Stroke Generator");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1BE213000, v2, OS_LOG_TYPE_DEBUG, "Drawing cancelled", buf, 2u);
  }

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(NSObject **)(v3 + 400);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__PKStrokeGenerator_drawingCancelledWithCompletion___block_invoke_36;
  block[3] = &unk_1E7776F38;
  block[4] = v3;
  dispatch_sync(v4, block);
}

void __52__PKStrokeGenerator_drawingCancelledWithCompletion___block_invoke_36(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "outputFilter");
  (*(void (**)(uint64_t))(*(_QWORD *)v2 + 32))(v2);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 176);
  *(_QWORD *)(v3 + 176) = 0;

}

+ (vector<PKInputPoint,)inputPointsFromPoints:(id)a2 velocityForDistanceFunction:(SEL)a3
{
  double (**v7)(_QWORD, double);
  double (**v8)(_QWORD, double);
  uint64_t v9;
  unint64_t v10;
  double *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  unint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  __int128 *v23;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *value;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char *v31;
  char *v32;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v33;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  vector<PKInputPoint, std::allocator<PKInputPoint>> *result;
  __int128 v43;
  __int128 v44;
  void *__p;
  void *v46;
  uint64_t v47;

  v7 = (double (**)(_QWORD, double))a5;
  if (v7)
    v8 = v7;
  else
    v8 = (double (**)(_QWORD, double))&__block_literal_global_88;
  __p = 0;
  v46 = 0;
  v47 = 0;
  PKArcLengthsFromPointArray((uint64_t *)a4, (uint64_t)&__p);
  v9 = *((_QWORD *)a4 + 1) - *(_QWORD *)a4;
  if (!v9)
  {
    retstr->__begin_ = 0;
    retstr->__end_ = 0;
    v12 = 0.0;
    retstr->__end_cap_.__value_ = 0;
LABEL_12:
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    if (*((_QWORD *)a4 + 1) != *(_QWORD *)a4)
    {
      v15 = v14;
      v16 = 0;
      v17 = 0.0;
      v43 = xmmword_1BE4FEBA0;
      do
      {
        +[PKInkProperties rangeForInput:](PKInkProperties, "rangeForInput:", 1, v43);
        v19 = v18;
        +[PKInkProperties rangeForInput:](PKInkProperties, "rangeForInput:", 1);
        v21 = fmin(v19, fmax(v20, v8[2](v8, v17 / v12)));
        v22 = *((double *)__p + v16);
        v15 = v15 + v22 / v21;
        v23 = (__int128 *)(*(_QWORD *)a4 + 16 * v16);
        v44 = *v23;
        end = retstr->__end_;
        value = retstr->__end_cap_.__value_;
        if (end >= value)
        {
          v27 = (end - retstr->__begin_) >> 7;
          v28 = v27 + 1;
          if ((unint64_t)(v27 + 1) >> 57)
            std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
          v29 = value - retstr->__begin_;
          if (v29 >> 6 > v28)
            v28 = v29 >> 6;
          if ((unint64_t)v29 >= 0x7FFFFFFFFFFFFF80)
            v30 = 0x1FFFFFFFFFFFFFFLL;
          else
            v30 = v28;
          if (v30)
            v31 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<PKInputPoint>>((uint64_t)&retstr->__end_cap_, v30);
          else
            v31 = 0;
          v32 = &v31[128 * v27];
          *(_OWORD *)v32 = v44;
          *((_QWORD *)v32 + 2) = 0xBFF0000000000000;
          *(_OWORD *)(v32 + 24) = 0u;
          *(_OWORD *)(v32 + 40) = 0u;
          *((_QWORD *)v32 + 7) = 0;
          *((double *)v32 + 8) = v15;
          *(_OWORD *)(v32 + 72) = v43;
          *(_OWORD *)(v32 + 88) = 0u;
          *(_OWORD *)(v32 + 104) = 0u;
          *((_QWORD *)v32 + 15) = 0;
          begin = retstr->__begin_;
          v33 = retstr->__end_;
          v35 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v32;
          if (v33 != retstr->__begin_)
          {
            do
            {
              v36 = *((_OWORD *)v33 - 8);
              v37 = *((_OWORD *)v33 - 7);
              v38 = *((_OWORD *)v33 - 5);
              *((_OWORD *)v35 - 6) = *((_OWORD *)v33 - 6);
              *((_OWORD *)v35 - 5) = v38;
              *((_OWORD *)v35 - 8) = v36;
              *((_OWORD *)v35 - 7) = v37;
              v39 = *((_OWORD *)v33 - 4);
              v40 = *((_OWORD *)v33 - 3);
              v41 = *((_OWORD *)v33 - 1);
              *((_OWORD *)v35 - 2) = *((_OWORD *)v33 - 2);
              *((_OWORD *)v35 - 1) = v41;
              *((_OWORD *)v35 - 4) = v39;
              *((_OWORD *)v35 - 3) = v40;
              v35 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v35 - 128);
              v33 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v33 - 128);
            }
            while (v33 != begin);
            v33 = begin;
          }
          v26 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v32 + 128);
          retstr->__begin_ = v35;
          retstr->__end_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v32 + 128);
          retstr->__end_cap_.__value_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v31[128 * v30];
          if (v33)
            operator delete(v33);
        }
        else
        {
          *(_OWORD *)end = *v23;
          *((_QWORD *)end + 2) = 0xBFF0000000000000;
          *(_OWORD *)((char *)end + 24) = 0u;
          *(_OWORD *)((char *)end + 40) = 0u;
          *((_QWORD *)end + 7) = 0;
          *((double *)end + 8) = v15;
          *(_OWORD *)((char *)end + 72) = v43;
          *(_OWORD *)((char *)end + 88) = 0u;
          *(_OWORD *)((char *)end + 104) = 0u;
          v26 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)end + 128);
          *((_QWORD *)end + 15) = 0;
        }
        retstr->__end_ = v26;
        v17 = v17 + v22;
        ++v16;
      }
      while (v16 < (uint64_t)(*((_QWORD *)a4 + 1) - *(_QWORD *)a4) >> 4);
    }
    goto LABEL_31;
  }
  v10 = v9 >> 4;
  v11 = (double *)__p;
  if (v10 <= 1)
    v10 = 1;
  v12 = 0.0;
  do
  {
    v13 = *v11++;
    v12 = v12 + v13;
    --v10;
  }
  while (v10);
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  if (v12 >= 0.0)
    goto LABEL_12;
LABEL_31:
  if (__p)
  {
    v46 = __p;
    operator delete(__p);
  }

  return result;
}

uint64_t __71__PKStrokeGenerator_inputPointsFromPoints_velocityForDistanceFunction___block_invoke()
{
  return +[PKInkProperties rangeForInput:](PKInkProperties, "rangeForInput:", 1);
}

+ (vector<PKInputPoint,)inputPointsFromPath:(id)a2 maxSegmentLength:(SEL)a3 velocityForDistanceFunction:(CGPath *)a4
{
  id v9;
  vector<PKInputPoint, std::allocator<PKInputPoint>> *result;
  void *__p;
  void *v12;
  uint64_t v13;

  v9 = a6;
  __p = 0;
  v12 = 0;
  v13 = 0;
  PKPointsFromPath(a4, (const void **)&__p, a5, 0.0);
  objc_msgSend(a2, "inputPointsFromPoints:velocityForDistanceFunction:", &__p, v9);
  if (__p)
  {
    v12 = __p;
    operator delete(__p);
  }

  return result;
}

- (id)strokeFromInputPoints:(void *)a3 inputType:(int64_t)a4 ink:(id)a5 inputScale:(double)a6 randomSeed:(unsigned int)a7 strokeClass:(Class)a8
{
  uint64_t v9;
  id v14;
  dispatch_semaphore_t v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  _QWORD v20[4];
  NSObject *v21;
  uint64_t *v22;
  void *__p;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v9 = *(_QWORD *)&a7;
  v14 = a5;
  v15 = dispatch_semaphore_create(0);
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__27;
  v30 = __Block_byref_object_dispose__28;
  v31 = objc_alloc_init(a8);
  objc_msgSend((id)v27[5], "_setInk:", v14);
  objc_msgSend((id)v27[5], "_setRandomSeed:", v9);
  if (*((_QWORD *)a3 + 1) != *(_QWORD *)a3)
  {
    if (a4)
      v16 = 23;
    else
      v16 = 8;
    -[PKStrokeGenerator drawingBeganWithStroke:inputType:activeInputProperties:inputScale:start:](self, "drawingBeganWithStroke:inputType:activeInputProperties:inputScale:start:", v27[5], a4, v16, 0, a6);
    __p = 0;
    v24 = 0;
    v25 = 0;
    std::vector<PKInputPoint>::__init_with_size[abi:ne180100]<PKInputPoint*,PKInputPoint*>(&__p, *(const void **)a3, *((_QWORD *)a3 + 1), (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 7);
    -[PKStrokeGenerator addPoints:](self, "addPoints:", &__p);
    if (__p)
    {
      v24 = __p;
      operator delete(__p);
    }
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __91__PKStrokeGenerator_strokeFromInputPoints_inputType_ink_inputScale_randomSeed_strokeClass___block_invoke;
    v20[3] = &unk_1E777D880;
    v22 = &v26;
    v17 = v15;
    v21 = v17;
    -[PKStrokeGenerator drawingEndedEstimatesTimeout:completion:](self, "drawingEndedEstimatesTimeout:completion:", v20, 0.0);
    dispatch_semaphore_wait(v17, 0xFFFFFFFFFFFFFFFFLL);

  }
  v18 = (id)v27[5];
  _Block_object_dispose(&v26, 8);

  return v18;
}

void __91__PKStrokeGenerator_strokeFromInputPoints_inputType_ink_inputScale_randomSeed_strokeClass___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (id)strokeFromPath:(CGPath *)a3 ink:(id)a4 inputScale:(double)a5 maxSegmentLength:(double)a6 velocityForDistanceFunction:(id)a7 strokeClass:(Class)a8
{
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *__p;
  void *v20;
  uint64_t v21;

  v14 = a4;
  v15 = a7;
  v16 = (void *)objc_opt_class();
  if (v16)
  {
    objc_msgSend(v16, "inputPointsFromPath:maxSegmentLength:velocityForDistanceFunction:", a3, v15, a6);
  }
  else
  {
    __p = 0;
    v20 = 0;
    v21 = 0;
  }
  -[PKStrokeGenerator strokeFromInputPoints:inputType:ink:inputScale:randomSeed:strokeClass:](self, "strokeFromInputPoints:inputType:ink:inputScale:randomSeed:strokeClass:", &__p, 0, v14, arc4random(), a8, a5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (__p)
  {
    v20 = __p;
    operator delete(__p);
  }

  return v17;
}

- (id)strokeFromPoints:(CGPoint *)a3 count:(unint64_t)a4 ink:(id)a5 inputScale:(double)a6 strokeClass:(Class)a7
{
  id v12;
  void *v13;
  void *v14;
  void *__p;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;

  v12 = a5;
  v19 = 0;
  v20 = 0;
  v21 = 0;
  std::vector<CGPoint>::__init_with_size[abi:ne180100]<CGPoint*,CGPoint*>(&v19, a3, (uint64_t)&a3[a4], a4);
  v13 = (void *)objc_opt_class();
  if (v13)
  {
    objc_msgSend(v13, "inputPointsFromPoints:velocityForDistanceFunction:", &v19, 0);
  }
  else
  {
    __p = 0;
    v17 = 0;
    v18 = 0;
  }
  -[PKStrokeGenerator strokeFromInputPoints:inputType:ink:inputScale:randomSeed:strokeClass:](self, "strokeFromInputPoints:inputType:ink:inputScale:randomSeed:strokeClass:", &__p, 0, v12, arc4random(), a7, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (__p)
  {
    v17 = __p;
    operator delete(__p);
  }
  if (v19)
  {
    v20 = v19;
    operator delete(v19);
  }

  return v14;
}

- (id)strokeFromPoints:(const void *)a3 sourceStroke:(id)a4 inputScale:(double)a5 averageInputPoint:(id *)a6
{
  id v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  double *v17;
  unint64_t v18;
  double v19;
  double v20;
  double var12;
  double var5;
  double v23;
  __int128 v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  _QWORD v30[4];
  $9076B28992D74D3AA2059476C2B9E2A9 var0;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  char *v39;
  char *v40;
  uint64_t v41;

  v10 = a4;
  v11 = (void *)objc_opt_class();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __80__PKStrokeGenerator_strokeFromPoints_sourceStroke_inputScale_averageInputPoint___block_invoke;
  v30[3] = &__block_descriptor_160_e8_d16__0d8l;
  v12 = *(_OWORD *)&a6->var9;
  v35 = *(_OWORD *)&a6->var7;
  v36 = v12;
  v13 = *(_OWORD *)&a6->var13;
  v37 = *(_OWORD *)&a6->var11;
  v38 = v13;
  v14 = *(_OWORD *)&a6->var1;
  var0 = a6->var0;
  v32 = v14;
  v15 = *(_OWORD *)&a6->var3;
  v16 = *(_OWORD *)&a6->var5;
  v33 = v15;
  v34 = v16;
  if (v11)
  {
    objc_msgSend(v11, "inputPointsFromPoints:velocityForDistanceFunction:", a3, v30);
    v17 = (double *)v39;
    if (v40 != v39)
    {
      v18 = (v40 - v39) >> 7;
      *(_QWORD *)&v16 = *(_QWORD *)v39;
      *(_QWORD *)&v15 = *((_QWORD *)v39 + 1);
      if (v18 <= 1)
        v18 = 1;
      do
      {
        v19 = *v17;
        v20 = v17[1];
        var12 = a6->var12;
        var5 = a6->var5;
        v23 = (v20 - *(double *)&v15) * (v20 - *(double *)&v15) + (*v17 - *(double *)&v16) * (*v17 - *(double *)&v16);
        v24 = *(_OWORD *)&a6->var3;
        *((_OWORD *)v17 + 1) = *(_OWORD *)&a6->var1;
        *((_OWORD *)v17 + 2) = v24;
        v17[6] = var5;
        v17[11] = sqrt(v23);
        v17[13] = var12;
        v17 += 16;
        *(double *)&v15 = v20;
        *(double *)&v16 = v19;
        --v18;
      }
      while (v18);
    }
  }
  else
  {
    v39 = 0;
    v40 = 0;
    v41 = 0;
  }
  v25 = objc_msgSend(v10, "_inputType", *(double *)&v15, *(double *)&v16);
  objc_msgSend(v10, "ink");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = arc4random();
  -[PKStrokeGenerator strokeFromInputPoints:inputType:ink:inputScale:randomSeed:strokeClass:](self, "strokeFromInputPoints:inputType:ink:inputScale:randomSeed:strokeClass:", &v39, v25, v26, v27, objc_opt_class(), a5);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    v40 = v39;
    operator delete(v39);
  }

  return v28;
}

double __80__PKStrokeGenerator_strokeFromPoints_sourceStroke_inputScale_averageInputPoint___block_invoke(uint64_t a1)
{
  return *(double *)(a1 + 72);
}

- (id)strokeFromLineSegments:(const void *)a3 maxSegmentLength:(double)a4 ink:(id)a5 inputScale:(double)a6 strokeClass:(Class)a7
{
  double *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  double *v13;
  double v14;
  double v15;
  double *v16;
  double v17;
  double v18;
  unint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double *v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char *v31;
  double *v32;
  double *v33;
  void *v34;
  id v38;
  double *__p;
  double *v40;
  double *v41;

  v38 = a5;
  __p = 0;
  v9 = 0;
  v10 = 0;
  v40 = 0;
  v41 = 0;
  v11 = ((uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 4) - 1;
  do
  {
    v12 = 0;
    v13 = (double *)(*(_QWORD *)a3 + 16 * v10);
    v14 = *v13;
    v15 = v13[1];
    ++v10;
    v16 = (double *)(*(_QWORD *)a3 + 16 * v10);
    v17 = v16[1];
    v18 = sqrt((v15 - v17) * (v15 - v17) + (*v13 - *v16) * (*v13 - *v16)) / a4;
    v19 = vcvtpd_u64_f64(v18);
    v20 = (double)(unint64_t)ceil(v18);
    v21 = *v16 - *v13;
    v22 = v17 - v15;
    do
    {
      v23 = (double)v12 / v20;
      v24 = v14 + v21 * v23;
      v25 = v15 + v22 * v23;
      if (v9 >= v41)
      {
        v26 = __p;
        v27 = ((char *)v9 - (char *)__p) >> 4;
        v28 = v27 + 1;
        if ((unint64_t)(v27 + 1) >> 60)
          std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
        v29 = (char *)v41 - (char *)__p;
        if (v41 - __p > v28)
          v28 = v29 >> 3;
        if ((unint64_t)v29 >= 0x7FFFFFFFFFFFFFF0)
          v30 = 0xFFFFFFFFFFFFFFFLL;
        else
          v30 = v28;
        if (v30)
        {
          v31 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&v41, v30);
          v26 = __p;
          v9 = v40;
        }
        else
        {
          v31 = 0;
        }
        v32 = (double *)&v31[16 * v27];
        *v32 = v24;
        v32[1] = v25;
        v33 = v32;
        if (v9 != v26)
        {
          do
          {
            *((_OWORD *)v33 - 1) = *((_OWORD *)v9 - 1);
            v33 -= 2;
            v9 -= 2;
          }
          while (v9 != v26);
          v26 = __p;
        }
        v9 = v32 + 2;
        __p = v33;
        v41 = (double *)&v31[16 * v30];
        if (v26)
          operator delete(v26);
      }
      else
      {
        *v9 = v24;
        v9[1] = v25;
        v9 += 2;
      }
      v40 = v9;
      ++v12;
    }
    while (v12 <= v19);
  }
  while (v10 != v11);
  -[PKStrokeGenerator strokeFromPoints:count:ink:inputScale:strokeClass:](self, "strokeFromPoints:count:ink:inputScale:strokeClass:", a6);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (__p)
    operator delete(__p);

  return v34;
}

- (void)whenFinishedProcessingPointsCallCompletion:(id)a3
{
  id v4;
  NSObject *inputQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  inputQueue = self->_inputQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__PKStrokeGenerator_whenFinishedProcessingPointsCallCompletion___block_invoke;
  v7[3] = &unk_1E7777B08;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(inputQueue, v7);

}

void __64__PKStrokeGenerator_whenFinishedProcessingPointsCallCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  _QWORD block[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 400);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__PKStrokeGenerator_whenFinishedProcessingPointsCallCompletion___block_invoke_2;
  block[3] = &unk_1E7776F60;
  v4 = v1;
  dispatch_async(v2, block);

}

uint64_t __64__PKStrokeGenerator_whenFinishedProcessingPointsCallCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)captureLiveData
{
  return self->_captureLiveData;
}

- (void)setCaptureLiveData:(BOOL)a3
{
  self->_captureLiveData = a3;
}

- (BOOL)isPreviewing
{
  return self->_isPreviewing;
}

- (void)setIsPreviewing:(BOOL)a3
{
  self->_isPreviewing = a3;
}

- (double)additionalRollAngle
{
  return self->_additionalRollAngle;
}

- (void)setAdditionalRollAngle:(double)a3
{
  self->_additionalRollAngle = a3;
}

- (BOOL)rollAngleEnabled
{
  return self->_rollAngleEnabled;
}

- (void)setRollAngleEnabled:(BOOL)a3
{
  self->_rollAngleEnabled = a3;
}

- (BOOL)shouldClearAzimuth
{
  return self->_shouldClearAzimuth;
}

- (void)setShouldClearAzimuth:(BOOL)a3
{
  self->_shouldClearAzimuth = a3;
}

- (CGAffineTransform)rulerTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[13].a;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[12].tx;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[13].c;
  return self;
}

- (void)setRulerTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_rulerTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_rulerTransform.tx = v4;
  *(_OWORD *)&self->_rulerTransform.a = v3;
}

- (BOOL)useRuler
{
  return self->_useRuler;
}

- (void)setUseRuler:(BOOL)a3
{
  self->_useRuler = a3;
}

- (double)rulerWidth
{
  return self->_rulerWidth;
}

- (void)setRulerWidth:(double)a3
{
  self->_rulerWidth = a3;
}

- (BOOL)isSnappedToRulerTopSide
{
  return self->_isSnappedToRulerTopSide;
}

- (void)setIsSnappedToRulerTopSide:(BOOL)a3
{
  self->_isSnappedToRulerTopSide = a3;
}

- (BOOL)canSnapToRuler
{
  return self->_canSnapToRuler;
}

- (void)setCanSnapToRuler:(BOOL)a3
{
  self->_canSnapToRuler = a3;
}

- (double)strokeMaxForce
{
  return self->_strokeMaxForce;
}

- (void)setStrokeMaxForce:(double)a3
{
  self->_strokeMaxForce = a3;
}

- (CGPoint)lastPoint
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_lastPoint, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setLastPoint:(CGPoint)a3
{
  CGPoint v3;

  v3 = a3;
  objc_copyStruct(&self->_lastPoint, &v3, 16, 1, 0);
}

- (OS_dispatch_queue)outputQueue
{
  return self->_outputQueue;
}

- (void)setOutputQueue:(id)a3
{
  objc_storeStrong((id *)&self->_outputQueue, a3);
}

- (double)touchSensitivity
{
  return self->_touchSensitivity;
}

- (void)setTouchSensitivity:(double)a3
{
  self->_touchSensitivity = a3;
}

- (void)inputProvider
{
  return self->_inputProvider;
}

- (void)setInputProvider:(void *)a3
{
  self->_inputProvider = a3;
}

- (void)pixelSmoothingFilter
{
  return self->_pixelSmoothingFilter;
}

- (void)setPixelSmoothingFilter:(void *)a3
{
  self->_pixelSmoothingFilter = a3;
}

- (void)pointReductionFilter
{
  return self->_pointReductionFilter;
}

- (void)setPointReductionFilter:(void *)a3
{
  self->_pointReductionFilter = a3;
}

- (void)startHookFilter
{
  return self->_startHookFilter;
}

- (void)setStartHookFilter:(void *)a3
{
  self->_startHookFilter = a3;
}

- (void)endHookFilter
{
  return self->_endHookFilter;
}

- (void)setEndHookFilter:(void *)a3
{
  self->_endHookFilter = a3;
}

- (void)velocityFilter
{
  return self->_velocityFilter;
}

- (void)setVelocityFilter:(void *)a3
{
  self->_velocityFilter = a3;
}

- (void)directionAngleFilter
{
  return self->_directionAngleFilter;
}

- (void)setDirectionAngleFilter:(void *)a3
{
  self->_directionAngleFilter = a3;
}

- (void)inputSmoother
{
  return self->_inputSmoother;
}

- (void)setInputSmoother:(void *)a3
{
  self->_inputSmoother = a3;
}

- (void)noiseSmoother
{
  return self->_noiseSmoother;
}

- (void)setNoiseSmoother:(void *)a3
{
  self->_noiseSmoother = a3;
}

- (void)propertySmoother
{
  return self->_propertySmoother;
}

- (void)setPropertySmoother:(void *)a3
{
  self->_propertySmoother = a3;
}

- (void)inputToOutputFilter
{
  return self->_inputToOutputFilter;
}

- (void)setInputToOutputFilter:(void *)a3
{
  self->_inputToOutputFilter = a3;
}

- (void)startCapFilter
{
  return self->_startCapFilter;
}

- (void)setStartCapFilter:(void *)a3
{
  self->_startCapFilter = a3;
}

- (void)animationFilter
{
  return self->_animationFilter;
}

- (void)setAnimationFilter:(void *)a3
{
  self->_animationFilter = a3;
}

- (void)azimuthFilter
{
  return self->_azimuthFilter;
}

- (void)setAzimuthFilter:(void *)a3
{
  self->_azimuthFilter = a3;
}

- (void)endCapFilter
{
  return self->_endCapFilter;
}

- (void)setEndCapFilter:(void *)a3
{
  self->_endCapFilter = a3;
}

- (void)fountainPenFilter
{
  return self->_fountainPenFilter;
}

- (void)setFountainPenFilter:(void *)a3
{
  self->_fountainPenFilter = a3;
}

- (void)rulerExtremaFilter
{
  return self->_rulerExtremaFilter;
}

- (void)setRulerExtremaFilter:(void *)a3
{
  self->_rulerExtremaFilter = a3;
}

- (void)estimatedAltitudeAndAzimuthFilter
{
  return self->_estimatedAltitudeAndAzimuthFilter;
}

- (void)setEstimatedAltitudeAndAzimuthFilter:(void *)a3
{
  self->_estimatedAltitudeAndAzimuthFilter = a3;
}

- (void)compressionFilter
{
  return self->_compressionFilter;
}

- (void)setCompressionFilter:(void *)a3
{
  self->_compressionFilter = a3;
}

- (void)decompressionFilter
{
  return self->_decompressionFilter;
}

- (void)setDecompressionFilter:(void *)a3
{
  self->_decompressionFilter = a3;
}

- (BOOL)isSnappedToRuler
{
  return self->_isSnappedToRuler;
}

- (void)setIsSnappedToRuler:(BOOL)a3
{
  self->_isSnappedToRuler = a3;
}

- (double)eraserIndicatorAlpha
{
  return self->_eraserIndicatorAlpha;
}

- (void)setEraserIndicatorAlpha:(double)a3
{
  self->_eraserIndicatorAlpha = a3;
}

- (double)inputScale
{
  return self->_inputScale;
}

- (void)setInputScale:(double)a3
{
  self->_inputScale = a3;
}

- (void).cxx_destruct
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  _PKStrokePoint *v4;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v5;

  objc_storeStrong((id *)&self->_outputQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_allInputPointFilters, 0);
  objc_storeStrong((id *)&self->_rollNoiseFilter, 0);
  objc_storeStrong((id *)&self->_extraRollLatencyFilter, 0);
  objc_storeStrong((id *)&self->_drawingWaitForFinishSemaphore, 0);
  begin = self->_updatedDrawPoints.__begin_;
  if (begin)
  {
    self->_updatedDrawPoints.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_currentStroke, 0);
  objc_storeStrong((id *)&self->_inputQueue, 0);
  v4 = self->_outputPoints.__begin_;
  if (v4)
  {
    self->_outputPoints.__end_ = v4;
    operator delete(v4);
  }
  v5 = self->_drawPoints.__begin_;
  if (v5)
  {
    self->_drawPoints.__end_ = v5;
    operator delete(v5);
  }
}

@end
