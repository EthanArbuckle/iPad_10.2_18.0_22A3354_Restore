@implementation ARFaceTrackingResults

- (id)anchorsForCameraWithTransform:(float32x4_t)a3 referenceOriginTransform:(float32x4_t)a4 existingAnchors:(float32x4_t)a5 anchorsToRemove:(uint64_t)a6
{
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  ARFaceAnchor *v18;
  void *v19;
  ARFaceAnchor *v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  void *v31;
  ARFaceAnchor *v32;
  void *v33;
  ARFaceAnchor *v34;
  id v36;
  void *v41;
  id v42;
  id obj;
  id v44;
  void *v45;
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
  __int128 v57;
  _OWORD v58[4];
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v36 = a7;
  v41 = (void *)objc_opt_new();
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  obj = v36;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v55 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v41, "addObject:", v11);
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
    }
    while (v8);
  }

  ARDictionaryFromAnchors(v41);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (id)objc_opt_new();
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  objc_msgSend(a1, "trackedFaces");
  v42 = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v50, v64, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v51;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v51 != v13)
          objc_enumerationMutation(v42);
        v15 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * j);
        if ((objc_msgSend(v15, "isValid") & 1) != 0)
        {
          objc_msgSend(v15, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "objectForKeyedSubscript:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          v18 = [ARFaceAnchor alloc];
          if (v17)
            objc_msgSend(v17, "identifier");
          else
            objc_msgSend(v15, "identifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = -[ARFaceAnchor initWithIdentifier:trackingData:](v18, "initWithIdentifier:trackingData:", v19, v15);

          -[ARAnchor transform](v20, "transform");
          v21 = 0;
          v58[0] = v22;
          v58[1] = v23;
          v58[2] = v24;
          v58[3] = v25;
          do
          {
            *(__int128 *)((char *)&v59 + v21 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, COERCE_FLOAT(v58[v21])), a3, *(float32x2_t *)&v58[v21], 1), a4, (float32x4_t)v58[v21], 2), a5, (float32x4_t)v58[v21], 3);
            ++v21;
          }
          while (v21 != 4);
          -[ARAnchor setTransform:](v20, "setTransform:", *(double *)&v59, *(double *)&v60, *(double *)&v61, *(double *)&v62);
          -[ARAnchor identifier](v20, "identifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "removeObjectForKey:", v26);

          objc_msgSend(v44, "addObject:", v20);
        }
      }
      v12 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v50, v64, 16);
    }
    while (v12);
  }

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  objc_msgSend(v45, "allValues");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v46, v63, 16);
  if (v28)
  {
    v29 = *(_QWORD *)v47;
    do
    {
      for (k = 0; k != v28; ++k)
      {
        if (*(_QWORD *)v47 != v29)
          objc_enumerationMutation(v27);
        v31 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * k);
        if ((objc_msgSend(v31, "isTracked") & 1) != 0)
        {
          v32 = [ARFaceAnchor alloc];
          objc_msgSend(v31, "trackingError");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = -[ARFaceAnchor initWithExistingFaceAnchor:tracked:trackingError:](v32, "initWithExistingFaceAnchor:tracked:trackingError:", v31, 0, v33);

          objc_msgSend(v44, "addObject:", v34);
        }
      }
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v46, v63, 16);
    }
    while (v28);
  }

  return v44;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[ARFaceTrackingResults trackedFaces](self, "trackedFaces");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("trackedFaces"));

}

- (ARFaceTrackingResults)initWithCoder:(id)a3
{
  id v4;
  ARFaceTrackingResults *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *trackedFaces;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ARFaceTrackingResults;
  v5 = -[ARFaceTrackingResults init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("trackedFaces"));
    v9 = objc_claimAutoreleasedReturnValue();
    trackedFaces = v5->_trackedFaces;
    v5->_trackedFaces = (NSArray *)v9;

  }
  return v5;
}

- (NSArray)trackedFaces
{
  return self->_trackedFaces;
}

- (void)setTrackedFaces:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackedFaces, 0);
}

@end
