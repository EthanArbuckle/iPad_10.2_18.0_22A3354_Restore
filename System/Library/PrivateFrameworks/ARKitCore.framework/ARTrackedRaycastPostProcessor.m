@implementation ARTrackedRaycastPostProcessor

- (ARTrackedRaycastPostProcessor)initWithSession:(id)a3
{
  id v4;
  ARTrackedRaycastPostProcessor *v5;
  uint64_t v6;
  void *v7;
  dispatch_semaphore_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ARTrackedRaycastPostProcessor;
  v5 = -[ARTrackedRaycastPostProcessor init](&v17, sel_init);
  if (v5)
  {
    v6 = objc_opt_new();
    v7 = (void *)_trackedRaycasts;
    _trackedRaycasts = v6;

    v8 = dispatch_semaphore_create(1);
    v9 = (void *)_trackedRaycastSemaphore;
    _trackedRaycastSemaphore = (uint64_t)v8;

    v10 = objc_opt_new();
    v11 = (void *)_initialRaycastResults;
    _initialRaycastResults = v10;

    v12 = objc_opt_new();
    v13 = (void *)_targetRaycastResultUpdates;
    _targetRaycastResultUpdates = v12;

    v14 = objc_opt_new();
    v15 = (void *)_resultsHistory;
    _resultsHistory = v14;

    objc_storeWeak((id *)&v5->_session, v4);
  }

  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (_updateTimer)
  {
    objc_msgSend((id)_updateTimer, "invalidate");
    v3 = (void *)_updateTimer;
    _updateTimer = 0;

  }
  v4.receiver = self;
  v4.super_class = (Class)ARTrackedRaycastPostProcessor;
  -[ARTrackedRaycastPostProcessor dealloc](&v4, sel_dealloc);
}

- (NSArray)trackedRaycasts
{
  void *v2;

  dispatch_semaphore_wait((dispatch_semaphore_t)_trackedRaycastSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend((id)_trackedRaycasts, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal((dispatch_semaphore_t)_trackedRaycastSemaphore);
  return (NSArray *)v2;
}

- (void)addTrackedRaycast:(id)a3 andProcessInitialResults:(id)a4
{
  NSObject *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = _trackedRaycastSemaphore;
  v7 = a4;
  v8 = a3;
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  v9 = (void *)_trackedRaycasts;
  objc_msgSend(v8, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

  -[ARTrackedRaycastPostProcessor processInitialResults:forRaycast:](self, "processInitialResults:forRaycast:", v7, v8);
  dispatch_semaphore_signal((dispatch_semaphore_t)_trackedRaycastSemaphore);
}

- (void)removeTrackedRaycastWithIdentifier:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)_trackedRaycasts;
  v4 = a3;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, v4);
  objc_msgSend((id)_initialRaycastResults, "setObject:forKeyedSubscript:", 0, v4);
  objc_msgSend((id)_targetRaycastResultUpdates, "setObject:forKeyedSubscript:", 0, v4);
  objc_msgSend((id)_resultsHistory, "setObject:forKeyedSubscript:", 0, v4);

}

- (void)invalidateAllRaycasts
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend((id)_trackedRaycasts, "allKeys", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[ARTrackedRaycastPostProcessor invalidateRaycastWithIdentifier:](self, "invalidateRaycastWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)invalidateRaycastWithIdentifier:(id)a3
{
  id v4;
  ARSession **p_session;
  id WeakRetained;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v4 = a3;
  p_session = &self->_session;
  WeakRetained = objc_loadWeakRetained((id *)&self->_session);

  if (WeakRetained)
  {
    objc_msgSend((id)_trackedRaycasts, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = objc_loadWeakRetained((id *)p_session);
      objc_msgSend(v8, "delegateQueue");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (!v9)
      {
        v10 = MEMORY[0x1E0C80D38];
        v11 = MEMORY[0x1E0C80D38];
      }
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __65__ARTrackedRaycastPostProcessor_invalidateRaycastWithIdentifier___block_invoke;
      v12[3] = &unk_1E6672118;
      v13 = v7;
      v14 = v4;
      dispatch_async(v10, v12);
      if (!v9)

    }
  }

}

void __65__ARTrackedRaycastPostProcessor_invalidateRaycastWithIdentifier___block_invoke(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD);
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "updateHandler");
  v2 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, MEMORY[0x1E0C9AA60]);

  objc_msgSend((id)_initialRaycastResults, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));
  objc_msgSend((id)_targetRaycastResultUpdates, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));
  v3 = (void *)_resultsHistory;
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, v4);

}

- (void)processInitialResults:(id)a3 forRaycast:(id)a4
{
  id v6;
  id v7;
  ARSession **p_session;
  id WeakRetained;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;

  v6 = a3;
  v7 = a4;
  p_session = &self->_session;
  WeakRetained = objc_loadWeakRetained((id *)&self->_session);

  if (WeakRetained)
  {
    v10 = objc_loadWeakRetained((id *)p_session);
    objc_msgSend(v10, "annotateAnchorToRaycastResults:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)_initialRaycastResults, "setObject:forKeyedSubscript:", v13, v12);

    objc_msgSend(v7, "query");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "target");

    if (v15 == 2)
    {
      v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v17 = 10;
      do
      {
        objc_msgSend(v11, "firstObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v18);

        --v17;
      }
      while (v17);
      objc_msgSend((id)_resultsHistory, "setObject:forKeyedSubscript:", v16, v12);
      v19 = (void *)_targetRaycastResultUpdates;
      objc_msgSend(v7, "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKeyedSubscript:", 0, v20);

    }
    v21 = objc_loadWeakRetained((id *)p_session);
    objc_msgSend(v21, "delegateQueue");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (!v22)
    {
      v23 = MEMORY[0x1E0C80D38];
      v24 = MEMORY[0x1E0C80D38];
    }
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __66__ARTrackedRaycastPostProcessor_processInitialResults_forRaycast___block_invoke;
    v25[3] = &unk_1E6672118;
    v26 = v7;
    v6 = v11;
    v27 = v6;
    dispatch_async(v23, v25);
    if (!v22)

  }
}

void __66__ARTrackedRaycastPostProcessor_processInitialResults_forRaycast___block_invoke(uint64_t a1)
{
  void (**v2)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "updateHandler");
  v2 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(_QWORD *)(a1 + 40));

}

- (void)processUpdatedResults:(id)a3
{
  id v4;
  id WeakRetained;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_session);

  if (WeakRetained)
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)_trackedRaycastSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    v7 = 0;
    v8 = &v7;
    v9 = 0x2020000000;
    v10 = 0;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __55__ARTrackedRaycastPostProcessor_processUpdatedResults___block_invoke;
    v6[3] = &unk_1E6672140;
    v6[4] = self;
    v6[5] = &v7;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v6);
    dispatch_semaphore_signal((dispatch_semaphore_t)_trackedRaycastSemaphore);
    if (*((_BYTE *)v8 + 24))
      -[ARTrackedRaycastPostProcessor startUpdateTimer](self, "startUpdateTimer");
    _Block_object_dispose(&v7, 8);
  }

}

void __55__ARTrackedRaycastPostProcessor_processUpdatedResults___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;

  v5 = (id *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "annotateAnchorToRaycastResults:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)_trackedRaycasts, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "query");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "target");

  if (v12 == 2)
  {
    objc_msgSend(v9, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      if (objc_msgSend(*(id *)(a1 + 32), "result:isCloseEnoughToInitialResultForRaycast:", v13, v10))
      {
        objc_msgSend(v13, "setTarget:", 2);
        v14 = (void *)_targetRaycastResultUpdates;
        objc_msgSend(v10, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v15);

        if (!_updateTimer)
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      }
    }

  }
  else if (v10 && objc_msgSend(v9, "count"))
  {
    v16 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(v16, "delegateQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (!v17)
    {
      v18 = MEMORY[0x1E0C80D38];
      v19 = MEMORY[0x1E0C80D38];
    }
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __55__ARTrackedRaycastPostProcessor_processUpdatedResults___block_invoke_2;
    v20[3] = &unk_1E6672118;
    v21 = v10;
    v22 = v9;
    dispatch_async(v18, v20);
    if (!v17)

  }
}

void __55__ARTrackedRaycastPostProcessor_processUpdatedResults___block_invoke_2(uint64_t a1)
{
  void (**v2)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "updateHandler");
  v2 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(_QWORD *)(a1 + 40));

}

- (void)performBlockWhileLockingRaycasts:(id)a3
{
  NSObject *v3;
  void (**v4)(_QWORD);

  v3 = _trackedRaycastSemaphore;
  v4 = (void (**)(_QWORD))a3;
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  v4[2](v4);

  dispatch_semaphore_signal((dispatch_semaphore_t)_trackedRaycastSemaphore);
}

- (void)updateFromPoseGraphEventWithData:(__n128)a3 referenceOriginTransform:(__n128)a4
{
  id v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  unint64_t v17;
  float64x2_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  float64x2_t v22;
  unint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  void *v27;
  float32x4_t v28;
  float32x4_t v29;
  float32x4_t v30;
  float32x4_t v31;
  float32x4_t v32;
  void *v33;
  float32x4_t v34;
  float32x4_t v35;
  float32x4_t v36;
  float32x4_t v37;
  float32x4_t v38;
  float32x4_t v39;
  uint64_t v40;
  uint64_t v41;
  ARRaycastQuery *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  ARRaycastResult *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  ARRaycastResult *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  int v67;
  void *v68;
  void *v69;
  id obj;
  uint64_t v71;
  uint64_t v72;
  float32x4_t v73;
  float32x4_t v74;
  float32x4_t v75;
  float32x4_t v76;
  simd_float4 v77;
  float32x4_t v78;
  float32x4_t v79;
  simd_float4 v80;
  float32x4_t v81;
  float32x4_t v82;
  float32x4_t v83;
  float32x4_t v84;
  float32x4_t v85;
  simd_float4 v86;
  float32x4_t v87;
  float32x4_t v88;
  simd_float4 v89;
  float32x4_t v90;
  float32x4_t v91;
  simd_float4 v92;
  float32x4_t v93;
  float32x4_t v94;
  simd_float4 v95;
  void *v96;
  _BYTE v97[64];
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  float64x2_t v102;
  double v103;
  float64x2_t v104;
  double v105;
  _BYTE v106[128];
  float64x2_t v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  simd_float4x4 v111;
  uint64_t v112;
  simd_float4x4 v113;
  simd_float4x4 v114;
  simd_float4x4 v115;

  *(__n128 *)&v97[32] = a4;
  *(__n128 *)&v97[48] = a5;
  *(__n128 *)v97 = a2;
  *(__n128 *)&v97[16] = a3;
  v112 = *MEMORY[0x1E0C80C00];
  v8 = a7;
  dispatch_semaphore_wait((dispatch_semaphore_t)_trackedRaycastSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  v98 = 0u;
  v99 = 0u;
  v100 = 0u;
  v101 = 0u;
  v68 = v8;
  objc_msgSend(v8, "updatedAnchors");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v72 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v98, v106, 16);
  if (v72)
  {
    v71 = *(_QWORD *)v99;
    v69 = a1;
    do
    {
      for (i = 0; i != v72; ++i)
      {
        if (*(_QWORD *)v99 != v71)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * i);
        objc_msgSend(v10, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)_trackedRaycasts, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          *(double *)v13.i64 = ARRenderingToVisionCoordinateTransform();
          v90 = v14;
          v93 = v13;
          v84 = v16;
          v87 = v15;
          objc_msgSend(v10, "transform");
          v17 = 0;
          v107 = v18;
          v108 = v19;
          v109 = v20;
          v110 = v21;
          memset(&v111, 0, sizeof(v111));
          do
          {
            v111.columns[v17 / 2] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v93, COERCE_FLOAT(*(_OWORD *)((char *)&v107 + v17 * 8))), v90, *(float32x2_t *)&v107.f64[v17], 1), v87, *(float32x4_t *)((char *)&v107 + v17 * 8), 2), v84, *(float32x4_t *)((char *)&v107 + v17 * 8), 3);
            v17 += 2;
          }
          while (v17 != 8);
          v91 = (float32x4_t)v111.columns[1];
          v94 = (float32x4_t)v111.columns[0];
          v85 = (float32x4_t)v111.columns[3];
          v88 = (float32x4_t)v111.columns[2];
          v22.f64[0] = ARVisionToRenderingCoordinateTransform();
          v23 = 0;
          v107 = v22;
          v108 = v24;
          v109 = v25;
          v110 = v26;
          memset(&v111, 0, sizeof(v111));
          do
          {
            v111.columns[v23 / 2] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v94, COERCE_FLOAT(*(_OWORD *)((char *)&v107 + v23 * 8))), v91, *(float32x2_t *)&v107.f64[v23], 1), v88, *(float32x4_t *)((char *)&v107 + v23 * 8), 2), v85, *(float32x4_t *)((char *)&v107 + v23 * 8), 3);
            v23 += 2;
          }
          while (v23 != 8);
          v77 = v111.columns[3];
          v80 = v111.columns[2];
          v113 = __invert_f4(v111);
          v92 = v113.columns[1];
          v95 = v113.columns[0];
          v86 = v113.columns[3];
          v89 = v113.columns[2];
          v111.columns[0] = (simd_float4)vcvtq_f64_f32(*(float32x2_t *)v77.f32);
          *(double *)v111.columns[1].i64 = v77.f32[2];
          v107 = vcvtq_f64_f32(*(float32x2_t *)v80.f32);
          *(double *)&v108 = v80.f32[2];
          objc_msgSend(v12, "query");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "direction");
          v81 = v28;

          v114 = __invert_f4(*(simd_float4x4 *)v97);
          v75 = (float32x4_t)v114.columns[0];
          v76 = (float32x4_t)v114.columns[1];
          v74 = (float32x4_t)v114.columns[3];
          v78 = (float32x4_t)v114.columns[2];
          v82 = vmlaq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v114.columns[0], v81.f32[0]), (float32x4_t)v114.columns[1], *(float32x2_t *)v81.f32, 1), (float32x4_t)v114.columns[2], v81, 2), (float32x4_t)0, (float32x4_t)v114.columns[3]);
          *(double *)v29.i64 = ARRenderingToVisionCoordinateTransform();
          v83 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v29, v82.f32[0]), v30, *(float32x2_t *)v82.f32, 1), v31, v82, 2), v32, v82, 3);
          objc_msgSend(v12, "query");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "origin");
          v73 = v34;

          v79 = vaddq_f32(v74, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v75, v73.f32[0]), v76, *(float32x2_t *)v73.f32, 1), v78, v73, 2));
          *(double *)v35.i64 = ARRenderingToVisionCoordinateTransform();
          v39 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v35, v79.f32[0]), v36, *(float32x2_t *)v79.f32, 1), v37, v79, 2), v38, v79, 3);
          v104 = vcvtq_f64_f32(*(float32x2_t *)v39.f32);
          v105 = v39.f32[2];
          v115.columns[3] = v86;
          v102 = vcvtq_f64_f32(*(float32x2_t *)v83.f32);
          v103 = v83.f32[2];
          v115.columns[1] = v92;
          v115.columns[0] = v95;
          v115.columns[2] = v89;
          ARWorldTransformFromVisionTransform(v115, *(float32x4_t *)v97, *(float32x4_t *)&v97[16], *(float32x4_t *)&v97[32], *(float32x4_t *)&v97[48]);
          v92.i64[0] = v41;
          v95.i64[0] = v40;
          v42 = [ARRaycastQuery alloc];
          objc_msgSend(v12, "query");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend(v43, "target");
          objc_msgSend(v12, "query");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = -[ARRaycastQuery initWithOrigin:direction:allowingTarget:alignment:](v42, "initWithOrigin:direction:allowingTarget:alignment:", v44, objc_msgSend(v45, "targetAlignment"), *(double *)v92.i64, *(double *)v95.i64);

          v96 = (void *)v46;
          objc_msgSend(v12, "setTrackedQuery:", v46);
          objc_msgSend((id)_initialRaycastResults, "objectForKeyedSubscript:", v11);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = v47;
          if (v47)
          {
            objc_msgSend(v47, "worldTransform");
            objc_msgSend(a1, "updatePose:referenceOriginTransform:oldRayOrigin:oldRayDirection:newRayOrigin:newRayDirection:", &v104, &v102, &v111, &v107);
            v53 = -[ARRaycastResult initWithWorldTransform:target:targetAlignment:]([ARRaycastResult alloc], "initWithWorldTransform:target:targetAlignment:", objc_msgSend(v48, "target"), objc_msgSend(v48, "targetAlignment"), v49, v50, v51, v52);
            objc_msgSend(v48, "anchor");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            -[ARRaycastResult setAnchor:](v53, "setAnchor:", v54);

            objc_msgSend(v48, "anchorIdentifier");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            -[ARRaycastResult setAnchorIdentifier:](v53, "setAnchorIdentifier:", v55);

            objc_msgSend((id)_initialRaycastResults, "setObject:forKeyedSubscript:", v53, v11);
          }
          objc_msgSend((id)_targetRaycastResultUpdates, "objectForKeyedSubscript:", v11);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = v56;
          if (v56)
          {
            objc_msgSend(v56, "worldTransform");
            objc_msgSend(a1, "updatePose:referenceOriginTransform:oldRayOrigin:oldRayDirection:newRayOrigin:newRayDirection:", &v104, &v102, &v111, &v107);
            v62 = -[ARRaycastResult initWithWorldTransform:target:targetAlignment:]([ARRaycastResult alloc], "initWithWorldTransform:target:targetAlignment:", objc_msgSend(v57, "target"), objc_msgSend(v57, "targetAlignment"), v58, v59, v60, v61);
            objc_msgSend(v57, "anchor");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            -[ARRaycastResult setAnchor:](v62, "setAnchor:", v63);

            objc_msgSend(v57, "anchorIdentifier");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            -[ARRaycastResult setAnchorIdentifier:](v62, "setAnchorIdentifier:", v64);

            objc_msgSend((id)_targetRaycastResultUpdates, "setObject:forKeyedSubscript:", v62, v11);
            objc_msgSend((id)_resultsHistory, "objectForKeyedSubscript:", v11);
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            v66 = v65;
            if (v65)
            {
              objc_msgSend(v65, "removeAllObjects");
              v67 = 10;
              do
              {
                objc_msgSend(v66, "addObject:", v62);
                --v67;
              }
              while (v67);
            }

            a1 = v69;
          }

        }
      }
      v72 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v98, v106, 16);
    }
    while (v72);
  }

  dispatch_semaphore_signal((dispatch_semaphore_t)_trackedRaycastSemaphore);
}

- (double)updatePose:(__n128)a3 referenceOriginTransform:(__n128)a4 oldRayOrigin:(simd_float4)a5 oldRayDirection:(simd_float4)a6 newRayOrigin:(simd_float4)a7 newRayDirection:(simd_float4)a8
{
  int8x16_t v8;
  int8x16_t v9;
  __n128 v10;
  __n128 v11;
  double v17[9];
  float64x2_t v18;
  float64x2_t v19[4];
  uint64_t v20;
  simd_float4x4 v21;

  v20 = *MEMORY[0x1E0C80C00];
  *(double *)v8.i64 = ARVisionTransformFromWorldTransform(a1, a2, a3, a4, a5, a6, a7, a8);
  ARMatrix4x4RowMajorRotationAndTranslation(v19, &v18, v8, v9, v10, v11);
  CV3DUpdateHitTestResultPose();
  *(double *)v21.columns[0].i64 = ARMatrix4x4MakeRowMajorTransform(v17);
  return ARWorldTransformFromVisionTransform(v21, (float32x4_t)a5, (float32x4_t)a6, (float32x4_t)a7, (float32x4_t)a8);
}

- (BOOL)result:(id)a3 isCloseEnoughToInitialResultForRaycast:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  float32x4_t v11;
  float32x4_t v12;
  void *v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float v17;
  float v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v22;
  float32x4_t v23;

  v5 = a3;
  v6 = a4;
  v7 = (void *)_initialRaycastResults;
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 1;
  if (v5 && v9)
  {
    objc_msgSend(v9, "worldTransform");
    v23 = v11;
    objc_msgSend(v5, "worldTransform");
    v22 = v12;
    objc_msgSend(v6, "query");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "origin");
    v15 = vsubq_f32(v14, v23);
    v16 = vmulq_f32(v15, v15);
    v17 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v16, 2), vaddq_f32(v16, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v16.f32, 1))).f32[0]);

    v18 = v17 * 0.1;
    v19 = vsubq_f32(v23, v22);
    v20 = vmulq_f32(v19, v19);
    v10 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v20, 2), vaddq_f32(v20, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v20.f32, 1))).f32[0]) <= v18;
  }

  return v10;
}

- (void)startUpdateTimer
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__ARTrackedRaycastPostProcessor_startUpdateTimer__block_invoke;
  block[3] = &unk_1E6672168;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __49__ARTrackedRaycastPostProcessor_startUpdateTimer__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", *(_QWORD *)(a1 + 32), sel_updateFromTimer_, 0, 1, 0.1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_updateTimer;
  _updateTimer = v1;

  return objc_msgSend((id)_updateTimer, "fire");
}

- (void)updateFromTimer:(id)a3
{
  _QWORD v4[5];

  if ((id)_updateTimer == a3)
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)_trackedRaycastSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __49__ARTrackedRaycastPostProcessor_updateFromTimer___block_invoke;
    v4[3] = &unk_1E6672190;
    v4[4] = self;
    objc_msgSend((id)_trackedRaycasts, "enumerateKeysAndObjectsUsingBlock:", v4);
    dispatch_semaphore_signal((dispatch_semaphore_t)_trackedRaycastSemaphore);
  }
  else
  {
    objc_msgSend(a3, "invalidate");
  }
}

void __49__ARTrackedRaycastPostProcessor_updateFromTimer___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  float32x4_t v11;
  float32x4_t v12;
  void *v13;
  void *v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  float32x4_t v25;
  float32x4_t v26;
  float v27;
  float v28;
  float32x4_t v29;
  float v30;
  float v32;
  float v33;
  float32x4_t v34;
  float32x4_t v35;
  float32x4_t v36;
  float v37;
  float v38;
  float32x4_t v39;
  int8x16_t v40;
  float32x4_t v41;
  int8x16_t v42;
  float v43;
  float v44;
  float v46;
  float v47;
  float32x2_t v48;
  float32x2_t v49;
  float v50;
  float32x4_t v51;
  float v52;
  float v53;
  float v54;
  float32x4_t v55;
  int8x16_t v56;
  float32x2_t v57;
  unsigned __int32 v58;
  float32x2_t v59;
  float32x2_t v60;
  float32x4_t v76;
  float32x4_t v77;
  float32x4_t v78;
  float32x4_t v79;
  float32x4_t v80;
  float32x4_t v81;
  float32x4_t v82;
  float32x4_t v83;
  id WeakRetained;
  NSObject *v85;
  NSObject *v86;
  id v87;
  ARRaycastResult *v88;
  ARRaycastResult *v89;
  void *v90;
  uint64_t v91;
  void *v92;
  ARRaycastResult *v93;
  void *v94;
  void *v95;
  id v96;
  NSObject *v97;
  NSObject *v98;
  id v99;
  float32x4_t v100;
  float32x4_t v101;
  float32x4_t v102;
  float32x4_t v103;
  float v104;
  float v105;
  float32x4_t v106;
  float32x4_t v107;
  float32x4_t v108;
  float32x4_t v109;
  float32x4_t v110;
  float32x4_t v111;
  float32x4_t v112;
  _QWORD block[4];
  ARRaycastResult *v114;
  id v115;
  _QWORD v116[4];
  id v117;
  ARRaycastResult *v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  _BYTE v123[128];
  uint64_t v124;
  simd_float3x3 v125;
  simd_float3x3 v126;

  v124 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "query");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "target");

  if (v8 == 2)
  {
    objc_msgSend((id)_targetRaycastResultUpdates, "objectForKeyedSubscript:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "worldTransform");
      v107 = v11;
      *(double *)v125.columns[0].i64 = ARMatrix3x3FromMatrix4x4(objc_msgSend(v10, "worldTransform"));
      *(double *)v12.i64 = simd_quaternion(v125);
      v103 = v12;
      objc_msgSend((id)_resultsHistory, "objectForKeyedSubscript:", v5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lastObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "worldTransform");
      v109 = v15;
      *(double *)v126.columns[0].i64 = ARMatrix3x3FromMatrix4x4(objc_msgSend(v14, "worldTransform"));
      *(double *)v16.i64 = simd_quaternion(v126);
      v17 = v16;
      v18 = vsubq_f32(v109, v107);
      v19 = vmulq_f32(v18, v18);
      v101 = v17;
      if (sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v19, 2), vaddq_f32(v19, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v19.f32, 1))).f32[0]) > 0.005)
      {
        v121 = 0u;
        v122 = 0u;
        v119 = 0u;
        v120 = 0u;
        v20 = v13;
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v119, v123, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v120;
          v110 = 0u;
          do
          {
            for (i = 0; i != v22; ++i)
            {
              if (*(_QWORD *)v120 != v23)
                objc_enumerationMutation(v20);
              objc_msgSend(*(id *)(*((_QWORD *)&v119 + 1) + 8 * i), "worldTransform");
              v110 = vaddq_f32(v110, v25);
            }
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v119, v123, 16);
          }
          while (v22);
        }

        objc_msgSend(v20, "count");
        v17 = v101;
      }
      v26 = vmulq_f32(v17, v17);
      v27 = atan2f(sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v26, 2), vaddq_f32(v26, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v26.f32, 1))).f32[0]), v17.f32[3]);
      v28 = v27 + v27;
      v29 = vmulq_f32(v103, v103);
      v30 = atan2f(sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v29, 2), vaddq_f32(v29, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v29.f32, 1))).f32[0]), v103.f32[3]);
      _Q17 = v103;
      v32 = vabds_f32(v28, v30 + v30);
      if (v32 > 0.0087266)
      {
        v33 = 0.0087266 / v32;
        v34 = vmulq_f32(v103, v101);
        v35 = (float32x4_t)vextq_s8((int8x16_t)v34, (int8x16_t)v34, 8uLL);
        *(float32x2_t *)v34.f32 = vadd_f32(*(float32x2_t *)v34.f32, *(float32x2_t *)v35.f32);
        v34.f32[0] = vaddv_f32(*(float32x2_t *)v34.f32);
        v35.i32[0] = 0;
        v36 = (float32x4_t)vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vmvnq_s8((int8x16_t)vcgeq_f32(v34, v35)), 0), (int8x16_t)vnegq_f32(v103), (int8x16_t)v103);
        v37 = 1.0;
        v38 = 1.0 - v33;
        v39 = vsubq_f32(v101, v36);
        v40 = (int8x16_t)vmulq_f32(v39, v39);
        v111 = v36;
        v41 = vaddq_f32(v101, v36);
        v42 = (int8x16_t)vmulq_f32(v41, v41);
        v43 = atan2f(sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v40.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v40, v40, 8uLL)))), sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v42.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v42, v42, 8uLL)))));
        v44 = v43 + v43;
        _ZF = (float)(v43 + v43) == 0.0;
        v46 = 1.0;
        if (!_ZF)
          v46 = sinf(v44) / v44;
        v47 = v46;
        v48 = vrecpe_f32((float32x2_t)LODWORD(v46));
        v49 = vmul_f32(v48, vrecps_f32((float32x2_t)LODWORD(v47), v48));
        LODWORD(v50) = vmul_f32(v49, vrecps_f32((float32x2_t)LODWORD(v47), v49)).u32[0];
        if ((float)(v38 * v44) != 0.0)
        {
          v104 = v50;
          v49.f32[0] = sinf(v38 * v44);
          v50 = v104;
          v37 = v49.f32[0] / (float)(v38 * v44);
        }
        v49.f32[0] = v38 * (float)(v50 * v37);
        v51 = (float32x4_t)vdupq_lane_s32((int32x2_t)v49, 0);
        v52 = v33 * v44;
        v53 = 1.0;
        if (v52 != 0.0)
        {
          v105 = v50;
          v100 = v51;
          v54 = sinf(v52);
          v51 = v100;
          v50 = v105;
          v53 = v54 / v52;
        }
        v55 = vmlaq_f32(vmulq_n_f32(v111, v33 * (float)(v50 * v53)), v101, v51);
        v56 = (int8x16_t)vmulq_f32(v55, v55);
        v57 = vadd_f32(*(float32x2_t *)v56.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v56, v56, 8uLL));
        if (vaddv_f32(v57) == 0.0)
        {
          _Q17 = (float32x4_t)xmmword_1B3BDFD50;
        }
        else
        {
          v58 = vadd_f32(v57, (float32x2_t)vdup_lane_s32((int32x2_t)v57, 1)).u32[0];
          v59 = vrsqrte_f32((float32x2_t)v58);
          v60 = vmul_f32(v59, vrsqrts_f32((float32x2_t)v58, vmul_f32(v59, v59)));
          _Q17 = vmulq_n_f32(v55, vmul_f32(v60, vrsqrts_f32((float32x2_t)v58, vmul_f32(v60, v60))).f32[0]);
        }
      }
      _S3 = _Q17.i32[1];
      _S4 = _Q17.i32[2];
      __asm { FMLS            S0, S4, V17.S[2] }
      _S5 = _Q17.i32[3];
      __asm
      {
        FMLA            S0, S5, V17.S[3]
        FMLA            S2, S3, V17.S[1]
        FMLA            S2, S5, V17.S[3]
        FMLS            S2, S17, V17.S[0]
        FMLA            S7, S4, V17.S[1]
        FMLA            S5, S4, V17.S[2]
        FMLS            S5, S17, V17.S[0]
        FMLS            S5, S3, V17.S[1]
      }
      ARMatrix4x4FromRotationAndTranslation();
      v108 = v77;
      v112 = v76;
      v102 = v79;
      v106 = v78;
      objc_msgSend(v10, "worldTransform");
      if ((AREqualTransforms(v112, v108, v106, v102, v80, v81, v82, v83) & 1) != 0)
      {
        objc_msgSend(v13, "removeAllObjects");
        objc_msgSend(v13, "addObject:", v10);
        objc_msgSend((id)_targetRaycastResultUpdates, "setObject:forKeyedSubscript:", 0, v5);
        WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
        objc_msgSend(WeakRetained, "delegateQueue");
        v85 = objc_claimAutoreleasedReturnValue();
        v86 = v85;
        if (!v85)
        {
          v86 = MEMORY[0x1E0C80D38];
          v87 = MEMORY[0x1E0C80D38];
        }
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __49__ARTrackedRaycastPostProcessor_updateFromTimer___block_invoke_3;
        block[3] = &unk_1E6672118;
        v114 = (ARRaycastResult *)v6;
        v115 = v10;
        dispatch_async(v86, block);
        if (!v85)

        v88 = v114;
      }
      else
      {
        v89 = [ARRaycastResult alloc];
        objc_msgSend(v6, "query");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        v91 = objc_msgSend(v90, "target");
        objc_msgSend(v6, "query");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        v93 = -[ARRaycastResult initWithWorldTransform:target:targetAlignment:](v89, "initWithWorldTransform:target:targetAlignment:", v91, objc_msgSend(v92, "targetAlignment"), *(double *)v112.i64, *(double *)v108.i64, *(double *)v106.i64, *(double *)v102.i64);

        objc_msgSend(v10, "anchor");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        -[ARRaycastResult setAnchor:](v93, "setAnchor:", v94);

        objc_msgSend(v10, "anchorIdentifier");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        -[ARRaycastResult setAnchorIdentifier:](v93, "setAnchorIdentifier:", v95);

        objc_msgSend(v13, "addObject:", v93);
        if ((unint64_t)objc_msgSend(v13, "count") >= 0xB)
          objc_msgSend(v13, "removeObjectAtIndex:", 0);
        v96 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
        objc_msgSend(v96, "delegateQueue");
        v97 = objc_claimAutoreleasedReturnValue();
        v98 = v97;
        if (!v97)
        {
          v98 = MEMORY[0x1E0C80D38];
          v99 = MEMORY[0x1E0C80D38];
        }
        v116[0] = MEMORY[0x1E0C809B0];
        v116[1] = 3221225472;
        v116[2] = __49__ARTrackedRaycastPostProcessor_updateFromTimer___block_invoke_2;
        v116[3] = &unk_1E6672118;
        v117 = v6;
        v118 = v93;
        v88 = v93;
        dispatch_async(v98, v116);
        if (!v97)

      }
      objc_msgSend((id)_resultsHistory, "setObject:forKeyedSubscript:", v13, v5);

    }
  }

}

void __49__ARTrackedRaycastPostProcessor_updateFromTimer___block_invoke_2(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD);
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "updateHandler");
  v2 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v4[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v2)[2](v2, v3);

}

void __49__ARTrackedRaycastPostProcessor_updateFromTimer___block_invoke_3(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD);
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "updateHandler");
  v2 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v4[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v2)[2](v2, v3);

}

- (ARSession)session
{
  return (ARSession *)objc_loadWeakRetained((id *)&self->_session);
}

- (void)setSession:(id)a3
{
  objc_storeWeak((id *)&self->_session, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_session);
}

@end
