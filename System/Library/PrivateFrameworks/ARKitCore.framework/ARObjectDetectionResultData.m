@implementation ARObjectDetectionResultData

- (id)anchorsForCameraWithTransform:(double)a3 referenceOriginTransform:(double)a4 existingAnchors:(double)a5 anchorsToRemove:(float32x4_t)a6
{
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  ARObjectAnchor *v29;
  ARObjectAnchor *v30;
  void *v31;
  void *v32;
  float32x4_t v33;
  float32x4_t v34;
  float32x4_t v35;
  float32x4_t v36;
  unint64_t v37;
  simd_float4 v38;
  simd_float4 v39;
  simd_float4 v40;
  simd_float4 v41;
  simd_float4 v42;
  unint64_t v43;
  simd_float4 v44;
  simd_float4 v45;
  simd_float4 v46;
  unint64_t v47;
  float32x4_t v48;
  float32x4_t v49;
  float32x4_t v50;
  float32x4_t v51;
  unint64_t v52;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  id obj;
  id v60;
  float32x4_t v65;
  float32x4_t v66;
  float32x4_t v67;
  float32x4_t v68;
  float32x4_t v69;
  float32x4_t v70;
  float32x4_t v71;
  float32x4_t v72;
  simd_float4 v73;
  simd_float4 v74;
  simd_float4 v75;
  simd_float4 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  simd_float4 v85;
  simd_float4 v86;
  simd_float4 v87;
  simd_float4 v88;
  float32x4_t v89;
  float32x4_t v90;
  float32x4_t v91;
  float32x4_t v92;
  _BYTE v93[128];
  _BYTE v94[128];
  uint64_t v95;
  simd_float4x4 v96;
  simd_float4x4 v97;

  v95 = *MEMORY[0x1E0C80C00];
  v12 = a11;
  v13 = (void *)objc_opt_new();
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v14 = v12;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v81, v94, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v82;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v82 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v19, "identifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKey:", v19, v20);

        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v81, v94, 16);
    }
    while (v16);
  }
  v54 = v14;

  v60 = (id)objc_opt_new();
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  objc_msgSend(a1, "detectedObjects");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v93, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v78;
    v57 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 16);
    v58 = *MEMORY[0x1E0C83FF0];
    v55 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 48);
    v56 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 32);
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v78 != v23)
          objc_enumerationMutation(obj);
        v25 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * j);
        objc_msgSend(v25, "referenceObject");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "identifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
        {
          v29 = (ARObjectAnchor *)objc_msgSend(v28, "copy");
        }
        else
        {
          v30 = [ARObjectAnchor alloc];
          objc_msgSend(v25, "referenceObject");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = -[ARObjectAnchor initWithReferenceObject:transform:](v30, "initWithReferenceObject:transform:", v31, *(double *)&v58, *(double *)&v57, *(double *)&v56, *(double *)&v55);

        }
        objc_msgSend(v25, "referenceObject");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "referenceOriginTransform");
        v97 = __invert_f4(v96);
        v75 = v97.columns[1];
        v76 = v97.columns[0];
        v73 = v97.columns[3];
        v74 = v97.columns[2];

        *(double *)v33.i64 = ARVisionToRenderingCoordinateTransform();
        v69 = v34;
        v71 = v33;
        v65 = v36;
        v67 = v35;
        objc_msgSend(v25, "visionTransform");
        v37 = 0;
        v85 = v38;
        v86 = v39;
        v87 = v40;
        v88 = v41;
        v89 = 0u;
        v90 = 0u;
        v91 = 0u;
        v92 = 0u;
        do
        {
          *(float32x4_t *)((char *)&v89 + v37) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v71, COERCE_FLOAT(*(_OWORD *)((char *)&v85 + v37))), v69, *(float32x2_t *)&v85.f32[v37 / 4], 1), v67, *(float32x4_t *)((char *)&v85 + v37), 2), v65, *(float32x4_t *)((char *)&v85 + v37), 3);
          v37 += 16;
        }
        while (v37 != 64);
        v70 = v90;
        v72 = v89;
        v66 = v92;
        v68 = v91;
        *(double *)v42.i64 = ARRenderingToVisionCoordinateTransform();
        v43 = 0;
        v85 = v42;
        v86 = v44;
        v87 = v45;
        v88 = v46;
        v89 = 0u;
        v90 = 0u;
        v91 = 0u;
        v92 = 0u;
        do
        {
          *(float32x4_t *)((char *)&v89 + v43) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v72, COERCE_FLOAT(*(_OWORD *)((char *)&v85 + v43))), v70, *(float32x2_t *)&v85.f32[v43 / 4], 1), v68, *(float32x4_t *)((char *)&v85 + v43), 2), v66, *(float32x4_t *)((char *)&v85 + v43), 3);
          v43 += 16;
        }
        while (v43 != 64);
        v47 = 0;
        v48 = v89;
        v49 = v90;
        v50 = v91;
        v51 = v92;
        v85 = v76;
        v86 = v75;
        v87 = v74;
        v88 = v73;
        v89 = 0u;
        v90 = 0u;
        v91 = 0u;
        v92 = 0u;
        do
        {
          *(float32x4_t *)((char *)&v89 + v47) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v48, COERCE_FLOAT(*(_OWORD *)((char *)&v85 + v47))), v49, *(float32x2_t *)&v85.f32[v47 / 4], 1), v50, *(float32x4_t *)((char *)&v85 + v47), 2), v51, *(float32x4_t *)((char *)&v85 + v47), 3);
          v47 += 16;
        }
        while (v47 != 64);
        v52 = 0;
        v85 = (simd_float4)v89;
        v86 = (simd_float4)v90;
        v87 = (simd_float4)v91;
        v88 = (simd_float4)v92;
        v89 = 0u;
        v90 = 0u;
        v91 = 0u;
        v92 = 0u;
        do
        {
          *(float32x4_t *)((char *)&v89 + v52) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a6, COERCE_FLOAT(*(_OWORD *)((char *)&v85 + v52))), a7, *(float32x2_t *)&v85.f32[v52 / 4], 1), a8, *(float32x4_t *)((char *)&v85 + v52), 2), a9, *(float32x4_t *)((char *)&v85 + v52), 3);
          v52 += 16;
        }
        while (v52 != 64);
        -[ARAnchor setTransform:](v29, "setTransform:", *(double *)v89.i64, *(double *)v90.i64, *(double *)v91.i64, *(double *)v92.i64);
        if (v29)
          objc_msgSend(v60, "addObject:", v29);

      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v93, 16);
    }
    while (v22);
  }

  return v60;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  BOOL v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "detectedObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARObjectDetectionResultData detectedObjects](self, "detectedObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {
      objc_msgSend(v5, "timestamp");
      v9 = v8 == self->_timestamp;
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

- (NSDictionary)tracingEntry
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  ARQATraceableDefaultEntryForResultData(self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v3, "mutableCopy");

  v4 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[ARObjectDetectionResultData detectedObjects](self, "detectedObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[ARObjectDetectionResultData detectedObjects](self, "detectedObjects");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v10);
        v12 = (void *)objc_opt_new();
        objc_msgSend(v11, "referenceObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("identifier"));

        objc_msgSend(v11, "referenceObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "extent");
        +[ARQAHelper arrayWithVector3:](ARQAHelper, "arrayWithVector3:");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v16, CFSTR("extent"));

        objc_msgSend(v11, "referenceObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "center");
        +[ARQAHelper arrayWithVector3:](ARQAHelper, "arrayWithVector3:");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v18, CFSTR("center"));

        objc_msgSend(v11, "visionTransform");
        +[ARQAHelper arrayWithMatrix4x4:](ARQAHelper, "arrayWithMatrix4x4:");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v19, CFSTR("transform"));

        objc_msgSend(v6, "addObject:", v12);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v8);
  }

  objc_msgSend(v21, "setObject:forKeyedSubscript:", v6, CFSTR("objects"));
  return (NSDictionary *)v21;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (NSArray)detectedObjects
{
  return self->_detectedObjects;
}

- (void)setDetectedObjects:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectedObjects, 0);
}

@end
