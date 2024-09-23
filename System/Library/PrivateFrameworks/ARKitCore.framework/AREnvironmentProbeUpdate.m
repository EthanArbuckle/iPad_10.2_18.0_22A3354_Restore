@implementation AREnvironmentProbeUpdate

- (AREnvironmentProbeUpdate)init
{
  AREnvironmentProbeUpdate *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AREnvironmentProbeUpdate;
  result = -[AREnvironmentProbeUpdate init](&v3, sel_init);
  if (result)
    result->_probeAnchorsLock._os_unfair_lock_opaque = 0;
  return result;
}

- (void)updateAddedProbeAnchors:(id)a3 updatedProbeAnchors:(id)a4 removedProbeAnchors:(id)a5
{
  id v8;
  id v9;
  NSArray *addedProbeAnchors;
  NSArray *v11;
  NSArray *v12;
  NSArray *updatedProbeAnchors;
  NSArray *v14;
  NSArray *v15;
  NSArray *removedProbeAnchors;
  NSArray *v17;
  NSArray *v18;
  id v19;

  v19 = a3;
  v8 = a4;
  v9 = a5;
  os_unfair_lock_lock_with_options();
  addedProbeAnchors = self->_addedProbeAnchors;
  if (addedProbeAnchors)
  {
    -[NSArray arrayByAddingObjectsFromArray:](addedProbeAnchors, "arrayByAddingObjectsFromArray:", v19);
    v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = (NSArray *)objc_msgSend(v19, "copy");
  }
  v12 = self->_addedProbeAnchors;
  self->_addedProbeAnchors = v11;

  updatedProbeAnchors = self->_updatedProbeAnchors;
  if (updatedProbeAnchors)
  {
    -[NSArray arrayByAddingObjectsFromArray:](updatedProbeAnchors, "arrayByAddingObjectsFromArray:", v8);
    v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = (NSArray *)objc_msgSend(v8, "copy");
  }
  v15 = self->_updatedProbeAnchors;
  self->_updatedProbeAnchors = v14;

  removedProbeAnchors = self->_removedProbeAnchors;
  if (removedProbeAnchors)
  {
    -[NSArray arrayByAddingObjectsFromArray:](removedProbeAnchors, "arrayByAddingObjectsFromArray:", v9);
    v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = (NSArray *)objc_msgSend(v9, "copy");
  }
  v18 = self->_removedProbeAnchors;
  self->_removedProbeAnchors = v17;

  os_unfair_lock_unlock(&self->_probeAnchorsLock);
}

- (id)anchorsForCameraWithTransform:(double)a3 referenceOriginTransform:(double)a4 existingAnchors:(double)a5 anchorsToRemove:(float32x4_t)a6
{
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v51 = a11;
  v14 = a12;
  os_unfair_lock_lock_with_options();
  v15 = *(id *)(a1 + 16);
  v16 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = 0;

  v50 = *(id *)(a1 + 24);
  v17 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = 0;

  v18 = *(id *)(a1 + 32);
  v19 = *(void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  v47 = v14;
  v48 = v18;
  objc_msgSend(v14, "addObjectsFromArray:", v18, v15);
  +[ARProbeFilter filter:](ARProbeFilter, "filter:", v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "mutableCopy");

  v49 = v21;
  +[ARProbeFilter filter:](ARProbeFilter, "filter:", v51);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v22, "mutableCopy");

  if (objc_msgSend(v21, "count"))
    objc_msgSend(v23, "removeObjectsInArray:", v21);
  if (objc_msgSend(v15, "count"))
    objc_msgSend(v23, "addObjectsFromArray:", v15);
  objc_msgSend((id)a1, "manager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "_updateProbesFromExistingAnchors:", v23);

  v25 = (void *)objc_opt_new();
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v26 = v15;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v60, v73, 16);
  if (v27)
  {
    v28 = *(_QWORD *)v61;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v61 != v28)
          objc_enumerationMutation(v26);
        v30 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
        objc_msgSend(v30, "referenceTransform");
        v31 = 0;
        v64 = v32;
        v65 = v33;
        v66 = v34;
        v67 = v35;
        do
        {
          *(__int128 *)((char *)&v68 + v31) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a6, COERCE_FLOAT(*(__int128 *)((char *)&v64 + v31))), a7, *(float32x2_t *)((char *)&v64 + v31), 1), a8, *(float32x4_t *)((char *)&v64 + v31), 2), a9, *(float32x4_t *)((char *)&v64 + v31), 3);
          v31 += 16;
        }
        while (v31 != 64);
        objc_msgSend(v30, "setTransform:", *(double *)&v68, *(double *)&v69, *(double *)&v70, *(double *)&v71);
        objc_msgSend(v25, "addObject:", v30);
      }
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v60, v73, 16);
    }
    while (v27);
  }

  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v36 = v50;
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v56, v72, 16);
  if (v37)
  {
    v38 = *(_QWORD *)v57;
    do
    {
      for (j = 0; j != v37; ++j)
      {
        if (*(_QWORD *)v57 != v38)
          objc_enumerationMutation(v36);
        v40 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * j);
        objc_msgSend(v40, "referenceTransform");
        v41 = 0;
        v64 = v42;
        v65 = v43;
        v66 = v44;
        v67 = v45;
        do
        {
          *(__int128 *)((char *)&v68 + v41) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a6, COERCE_FLOAT(*(__int128 *)((char *)&v64 + v41))), a7, *(float32x2_t *)((char *)&v64 + v41), 1), a8, *(float32x4_t *)((char *)&v64 + v41), 2), a9, *(float32x4_t *)((char *)&v64 + v41), 3);
          v41 += 16;
        }
        while (v41 != 64);
        objc_msgSend(v40, "setTransform:", *(double *)&v68, *(double *)&v69, *(double *)&v70, *(double *)&v71);
        objc_msgSend(v25, "addObject:", v40);
      }
      v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v56, v72, 16);
    }
    while (v37);
  }

  return v25;
}

- (AREnvironmentProbeManager)manager
{
  return (AREnvironmentProbeManager *)objc_loadWeakRetained((id *)&self->_manager);
}

- (void)setManager:(id)a3
{
  objc_storeWeak((id *)&self->_manager, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_manager);
  objc_storeStrong((id *)&self->_removedProbeAnchors, 0);
  objc_storeStrong((id *)&self->_updatedProbeAnchors, 0);
  objc_storeStrong((id *)&self->_addedProbeAnchors, 0);
}

@end
