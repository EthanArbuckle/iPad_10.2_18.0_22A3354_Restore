@implementation ARWorldTrackingReferenceAnchorData

- (ARWorldTrackingReferenceAnchorData)initWithUpdatedAnchors:(id)a3 addedAnchors:(id)a4 removedAnchors:(id)a5 externalAnchors:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ARWorldTrackingReferenceAnchorData *v15;
  ARWorldTrackingReferenceAnchorData *v16;
  uint64_t v17;
  NSSet *receivedAnchors;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)ARWorldTrackingReferenceAnchorData;
  v15 = -[ARWorldTrackingReferenceAnchorData init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_updatedAnchors, a3);
    objc_storeStrong((id *)&v16->_addedAnchors, a4);
    objc_storeStrong((id *)&v16->_removedAnchors, a5);
    objc_storeStrong((id *)&v16->_externalAnchors, a6);
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v17 = objc_claimAutoreleasedReturnValue();
    receivedAnchors = v16->_receivedAnchors;
    v16->_receivedAnchors = (NSSet *)v17;

  }
  return v16;
}

- (id)anchorsForCameraWithTransform:(double)a3 referenceOriginTransform:(double)a4 existingAnchors:(double)a5 anchorsToRemove:(float32x4_t)a6
{
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  float32x4_t v29;
  float32x4_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  NSObject *v35;
  float32x4_t v36;
  float32x4_t v37;
  float32x4_t v38;
  float32x4_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  objc_class *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  void *v50;
  void *v51;
  void *v52;
  float32x4_t v53;
  float32x4_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  NSObject *v59;
  float32x4_t v60;
  float32x4_t v61;
  float32x4_t v62;
  float32x4_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  objc_class *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t k;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  id v80;
  void *v81;
  void *obj;
  id *v83;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  void *v96;
  void *v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  _BYTE v114[128];
  _BYTE v115[128];
  _BYTE v116[128];
  uint8_t buf[32];
  __int128 v118;
  double v119[3];
  uint64_t v120;

  v120 = *MEMORY[0x1E0C80C00];
  v14 = a11;
  v80 = a12;
  objc_msgSend(a1, "updatedAnchors");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "count");
  objc_msgSend(a1, "addedAnchors");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "count");
  objc_msgSend(a1, "removedAnchors");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "count");
  kdebug_trace();

  v81 = v14;
  ARDictionaryFromAnchors(v14);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = (void *)objc_opt_new();
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  v109 = 0u;
  objc_msgSend(a1, "updatedAnchors");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v106, v116, 16);
  v83 = a1;
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v107;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v107 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * i);
        objc_msgSend(v23, "identifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "objectForKey:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v25)
        {
          _ARLogGeneral_37();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          {
            v43 = (objc_class *)objc_opt_class();
            NSStringFromClass(v43);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "identifier");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v44;
            *(_WORD *)&buf[12] = 2048;
            *(_QWORD *)&buf[14] = v83;
            *(_WORD *)&buf[22] = 2114;
            *(_QWORD *)&buf[24] = v45;
            _os_log_impl(&dword_1B3A68000, v35, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: VIO returned an updated anchor that is not surfaced by ARSession: %{public}@", buf, 0x20u);

            a1 = v83;
          }
          goto LABEL_16;
        }
        objc_msgSend(a1, "timestamp");
        v27 = v26;
        objc_msgSend(v25, "lastUpdateTimestamp");
        if (v27 > v28)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_msgSend(v25, "referenceTransform");
            ARInnerScaleFromMatrix(v29, v30);
            ARMatrixFromScale();
            v92 = v32;
            v94 = v31;
            v88 = v34;
            v90 = v33;
            v35 = objc_msgSend(v25, "copy");
            objc_msgSend(v23, "transform");
            v40 = 0;
            v110 = v94;
            v111 = v92;
            v112 = v90;
            v113 = v88;
            memset(buf, 0, sizeof(buf));
            v118 = 0u;
            *(_OWORD *)v119 = 0u;
            do
            {
              *(float32x4_t *)&buf[v40] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v36, COERCE_FLOAT(*(__int128 *)((char *)&v110 + v40))), v37, *(float32x2_t *)((char *)&v110 + v40), 1), v38, *(float32x4_t *)((char *)&v110 + v40), 2), v39, *(float32x4_t *)((char *)&v110 + v40), 3);
              v40 += 16;
            }
            while (v40 != 64);
            v41 = 0;
            v110 = *(_OWORD *)buf;
            v111 = *(_OWORD *)&buf[16];
            v112 = v118;
            v113 = *(_OWORD *)v119;
            memset(buf, 0, sizeof(buf));
            v118 = 0u;
            *(_OWORD *)v119 = 0u;
            do
            {
              *(float32x4_t *)&buf[v41] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a6, COERCE_FLOAT(*(__int128 *)((char *)&v110 + v41))), a7, *(float32x2_t *)((char *)&v110 + v41), 1), a8, *(float32x4_t *)((char *)&v110 + v41), 2), a9, *(float32x4_t *)((char *)&v110 + v41), 3);
              v41 += 16;
            }
            while (v41 != 64);
            -[NSObject setTransform:](v35, "setTransform:", *(double *)buf, *(double *)&buf[16], *(double *)&v118, v119[0]);
            objc_msgSend(v23, "sessionIdentifier");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setSessionIdentifier:](v35, "setSessionIdentifier:", v42);

            objc_msgSend(v96, "addObject:", v35);
LABEL_16:

          }
        }

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v106, v116, 16);
    }
    while (v20);
  }

  v104 = 0u;
  v105 = 0u;
  v102 = 0u;
  v103 = 0u;
  objc_msgSend(a1, "addedAnchors");
  obj = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v102, v115, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v103;
    do
    {
      for (j = 0; j != v47; ++j)
      {
        if (*(_QWORD *)v103 != v48)
          objc_enumerationMutation(obj);
        v50 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * j);
        objc_msgSend(a1[6], "member:", v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = v51;
        if (v51)
        {
          objc_msgSend(v51, "referenceTransform");
          ARInnerScaleFromMatrix(v53, v54);
          ARMatrixFromScale();
          v93 = v56;
          v95 = v55;
          v89 = v58;
          v91 = v57;
          v59 = objc_msgSend(v52, "copy");
          objc_msgSend(v50, "transform");
          v64 = 0;
          v110 = v95;
          v111 = v93;
          v112 = v91;
          v113 = v89;
          memset(buf, 0, sizeof(buf));
          v118 = 0u;
          *(_OWORD *)v119 = 0u;
          do
          {
            *(float32x4_t *)&buf[v64] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v60, COERCE_FLOAT(*(__int128 *)((char *)&v110 + v64))), v61, *(float32x2_t *)((char *)&v110 + v64), 1), v62, *(float32x4_t *)((char *)&v110 + v64), 2), v63, *(float32x4_t *)((char *)&v110 + v64), 3);
            v64 += 16;
          }
          while (v64 != 64);
          v65 = 0;
          v110 = *(_OWORD *)buf;
          v111 = *(_OWORD *)&buf[16];
          v112 = v118;
          v113 = *(_OWORD *)v119;
          memset(buf, 0, sizeof(buf));
          v118 = 0u;
          *(_OWORD *)v119 = 0u;
          do
          {
            *(float32x4_t *)&buf[v65] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a6, COERCE_FLOAT(*(__int128 *)((char *)&v110 + v65))), a7, *(float32x2_t *)((char *)&v110 + v65), 1), a8, *(float32x4_t *)((char *)&v110 + v65), 2), a9, *(float32x4_t *)((char *)&v110 + v65), 3);
            v65 += 16;
          }
          while (v65 != 64);
          -[NSObject setTransform:](v59, "setTransform:", *(double *)buf, *(double *)&buf[16], *(double *)&v118, v119[0]);
          objc_msgSend(v50, "sessionIdentifier");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setSessionIdentifier:](v59, "setSessionIdentifier:", v66);

          objc_msgSend(v96, "addObject:", v59);
        }
        else
        {
          _ARLogGeneral_37();
          v59 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
          {
            v67 = (objc_class *)objc_opt_class();
            NSStringFromClass(v67);
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "identifier");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v68;
            *(_WORD *)&buf[12] = 2048;
            *(_QWORD *)&buf[14] = v83;
            *(_WORD *)&buf[22] = 2114;
            *(_QWORD *)&buf[24] = v69;
            _os_log_impl(&dword_1B3A68000, v59, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Ignoring locally added anchor: %{public}@", buf, 0x20u);

            a1 = v83;
          }
        }

      }
      v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v102, v115, 16);
    }
    while (v47);
  }

  v100 = 0u;
  v101 = 0u;
  v98 = 0u;
  v99 = 0u;
  objc_msgSend(a1, "removedAnchors");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v98, v114, 16);
  if (v71)
  {
    v72 = v71;
    v73 = *(_QWORD *)v99;
    do
    {
      for (k = 0; k != v72; ++k)
      {
        if (*(_QWORD *)v99 != v73)
          objc_enumerationMutation(v70);
        v75 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * k);
        objc_msgSend(v75, "identifier");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "objectForKey:", v76);
        v77 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v77, "isMemberOfClass:", objc_opt_class()))
        {
          objc_msgSend(v96, "removeObject:", v75);
          objc_msgSend(v80, "addObject:", v75);
        }

      }
      v72 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v98, v114, 16);
    }
    while (v72);
  }

  objc_msgSend(v96, "count");
  objc_msgSend(v80, "count");
  kdebug_trace();
  objc_msgSend(v96, "allObjects");
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  return v78;
}

- (id)externalAnchorsWithReferenceOriginTransform:(float32x4_t)a3 existingAnchors:(float32x4_t)a4
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  float32x4_t v19;
  float32x4_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  float32x4_t v26;
  float32x4_t v27;
  float32x4_t v28;
  float32x4_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  objc_class *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v38;
  id *v39;
  id obj;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  uint8_t buf[32];
  __int128 v59;
  __int128 v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v8 = a7;
  objc_msgSend(a1, "externalAnchors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (!v10)
  {
    v36 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_22;
  }
  v11 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v39 = (id *)a1;
  objc_msgSend(a1, "externalAnchors");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
  if (!v13)
    goto LABEL_20;
  v14 = v13;
  v15 = *(_QWORD *)v50;
  v38 = v12;
  do
  {
    v16 = 0;
    do
    {
      if (*(_QWORD *)v50 != v15)
        objc_enumerationMutation(obj);
      v17 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v16);
      objc_msgSend(v12, "member:", v17);
      v18 = objc_claimAutoreleasedReturnValue();
      if (v18 || (objc_msgSend(v39[6], "member:", v17), (v18 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[NSObject referenceTransform](v18, "referenceTransform");
        ARInnerScaleFromMatrix(v19, v20);
        ARMatrixFromScale();
        v47 = v22;
        v48 = v21;
        v45 = v24;
        v46 = v23;
        v25 = -[NSObject copy](v18, "copy");
        objc_msgSend(v17, "transform");
        v30 = 0;
        v53 = v48;
        v54 = v47;
        v55 = v46;
        v56 = v45;
        memset(buf, 0, sizeof(buf));
        v59 = 0u;
        v60 = 0u;
        do
        {
          *(float32x4_t *)&buf[v30] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v26, COERCE_FLOAT(*(__int128 *)((char *)&v53 + v30))), v27, *(float32x2_t *)((char *)&v53 + v30), 1), v28, *(float32x4_t *)((char *)&v53 + v30), 2), v29, *(float32x4_t *)((char *)&v53 + v30), 3);
          v30 += 16;
        }
        while (v30 != 64);
        v31 = 0;
        v53 = *(_OWORD *)buf;
        v54 = *(_OWORD *)&buf[16];
        v55 = v59;
        v56 = v60;
        memset(buf, 0, sizeof(buf));
        v59 = 0u;
        v60 = 0u;
        do
        {
          *(float32x4_t *)&buf[v31] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, COERCE_FLOAT(*(__int128 *)((char *)&v53 + v31))), a3, *(float32x2_t *)((char *)&v53 + v31), 1), a4, *(float32x4_t *)((char *)&v53 + v31), 2), a5, *(float32x4_t *)((char *)&v53 + v31), 3);
          v31 += 16;
        }
        while (v31 != 64);
        objc_msgSend(v25, "setTransform:", *(double *)buf, *(double *)&buf[16], *(double *)&v59, *(double *)&v60);
        objc_msgSend(v17, "sessionIdentifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setSessionIdentifier:", v32);

        objc_msgSend(v11, "addObject:", v25);
        goto LABEL_14;
      }
      _ARLogGeneral_37();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        v33 = (objc_class *)objc_opt_class();
        NSStringFromClass(v33);
        v25 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "identifier");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v25;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v39;
        v12 = v38;
        *(_WORD *)&buf[22] = 2114;
        *(_QWORD *)&buf[24] = v34;
        _os_log_impl(&dword_1B3A68000, v18, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: External anchor was neither found in received list nor existing anchors: %{public}@", buf, 0x20u);

LABEL_14:
      }

      ++v16;
    }
    while (v16 != v14);
    v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
    v14 = v35;
  }
  while (v35);
LABEL_20:

  objc_msgSend(v11, "allObjects");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_22:
  return v36;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  double timestamp;
  id v5;

  timestamp = self->_timestamp;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("timestamp"), timestamp);
  objc_msgSend(v5, "encodeObject:forKey:", self->_updatedAnchors, CFSTR("updatedAnchors"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_addedAnchors, CFSTR("addedAnchors"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_removedAnchors, CFSTR("removedAnchors"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_externalAnchors, CFSTR("externalAnchors"));

}

- (ARWorldTrackingReferenceAnchorData)initWithCoder:(id)a3
{
  id v4;
  ARWorldTrackingReferenceAnchorData *v5;
  double v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSSet *updatedAnchors;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSSet *addedAnchors;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSSet *removedAnchors;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSSet *externalAnchors;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)ARWorldTrackingReferenceAnchorData;
  v5 = -[ARWorldTrackingReferenceAnchorData init](&v32, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timestamp"));
    v5->_timestamp = v6;
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("updatedAnchors"));
    v11 = objc_claimAutoreleasedReturnValue();
    updatedAnchors = v5->_updatedAnchors;
    v5->_updatedAnchors = (NSSet *)v11;

    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("addedAnchors"));
    v17 = objc_claimAutoreleasedReturnValue();
    addedAnchors = v5->_addedAnchors;
    v5->_addedAnchors = (NSSet *)v17;

    v19 = (void *)MEMORY[0x1E0C99E60];
    v20 = objc_opt_class();
    v21 = objc_opt_class();
    objc_msgSend(v19, "setWithObjects:", v20, v21, objc_opt_class(), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("removedAnchors"));
    v23 = objc_claimAutoreleasedReturnValue();
    removedAnchors = v5->_removedAnchors;
    v5->_removedAnchors = (NSSet *)v23;

    v25 = (void *)MEMORY[0x1E0C99E60];
    v26 = objc_opt_class();
    v27 = objc_opt_class();
    objc_msgSend(v25, "setWithObjects:", v26, v27, objc_opt_class(), 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v28, CFSTR("externalAnchors"));
    v29 = objc_claimAutoreleasedReturnValue();
    externalAnchors = v5->_externalAnchors;
    v5->_externalAnchors = (NSSet *)v29;

  }
  return v5;
}

- (unint64_t)hash
{
  return (unint64_t)(self->_timestamp * 1000.0);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  double *v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (double *)v4;
    v6 = vabdd_f64(self->_timestamp, v5[1]) < 2.22044605e-16
      && -[NSSet isEqualToSet:](self->_updatedAnchors, "isEqualToSet:", *((_QWORD *)v5 + 2))
      && -[NSSet isEqualToSet:](self->_addedAnchors, "isEqualToSet:", *((_QWORD *)v5 + 3))
      && -[NSSet isEqualToSet:](self->_removedAnchors, "isEqualToSet:", *((_QWORD *)v5 + 4))
      && -[NSSet isEqualToSet:](self->_externalAnchors, "isEqualToSet:", *((_QWORD *)v5 + 5));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (NSSet)updatedAnchors
{
  return self->_updatedAnchors;
}

- (NSSet)addedAnchors
{
  return self->_addedAnchors;
}

- (NSSet)removedAnchors
{
  return self->_removedAnchors;
}

- (NSSet)externalAnchors
{
  return self->_externalAnchors;
}

- (NSSet)receivedAnchors
{
  return self->_receivedAnchors;
}

- (void)setReceivedAnchors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receivedAnchors, 0);
  objc_storeStrong((id *)&self->_externalAnchors, 0);
  objc_storeStrong((id *)&self->_removedAnchors, 0);
  objc_storeStrong((id *)&self->_addedAnchors, 0);
  objc_storeStrong((id *)&self->_updatedAnchors, 0);
}

@end
