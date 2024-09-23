@implementation ARWorldTrackingParticipantAnchorData

- (ARWorldTrackingParticipantAnchorData)initWithAnchors:(id)a3
{
  id v4;
  ARWorldTrackingParticipantAnchorData *v5;
  uint64_t v6;
  NSSet *anchors;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ARWorldTrackingParticipantAnchorData;
  v5 = -[ARWorldTrackingParticipantAnchorData init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    anchors = v5->_anchors;
    v5->_anchors = (NSSet *)v6;

  }
  return v5;
}

- (id)anchorsForCameraWithTransform:(double)a3 referenceOriginTransform:(double)a4 existingAnchors:(double)a5 anchorsToRemove:(float32x4_t)a6
{
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  void *v21;
  void *v22;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _OWORD v32[4];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  double v36[3];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend(a1, "anchors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v29 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v15, "transform");
        v16 = 0;
        v32[0] = v17;
        v32[1] = v18;
        v32[2] = v19;
        v32[3] = v20;
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        *(_OWORD *)v36 = 0u;
        do
        {
          *(__int128 *)((char *)&v33 + v16 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a6, COERCE_FLOAT(v32[v16])), a7, *(float32x2_t *)&v32[v16], 1), a8, (float32x4_t)v32[v16], 2), a9, (float32x4_t)v32[v16], 3);
          ++v16;
        }
        while (v16 != 4);
        objc_msgSend(v15, "setTransform:", *(double *)&v33, *(double *)&v34, *(double *)&v35, v36[0]);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    }
    while (v12);
  }

  objc_msgSend(a1, "anchors");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "allObjects");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (NSSet)anchors
{
  return self->_anchors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchors, 0);
}

@end
