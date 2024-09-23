@implementation ARCoreRESkeletonResults

- (id)anchorsForCameraWithTransform:(float32x4_t)a3 referenceOriginTransform:(float32x4_t)a4 existingAnchors:(float32x4_t)a5 anchorsToRemove:(uint64_t)a6
{
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  float32x4_t *v14;
  uint64_t j;
  void *v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;
  unint64_t v21;
  float32x4_t v22;
  float32x4_t v23;
  float32x4_t v24;
  float32x4_t v25;
  unint64_t v26;
  float32x4_t v27;
  float32x4_t v28;
  float32x4_t v29;
  float32x4_t v30;
  float32x4_t v31;
  float32x4_t v32;
  float32x4_t v33;
  unint64_t v34;
  void *v35;
  void *v36;
  ARBodyAnchor *v37;
  void *v38;
  ARBodyAnchor *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t k;
  void *v45;
  void *v46;
  id v48;
  id v49;
  id obj;
  uint64_t v51;
  id v56;
  float32x4_t v57;
  double v58;
  float32x4_t v59;
  double v60;
  float32x4_t v61;
  double v62;
  float32x4_t v63;
  double v64;
  void *v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  float32x4_t v78;
  float32x4_t v79;
  float32x4_t v80;
  float32x4_t v81;
  float32x4_t v82;
  float32x4_t v83;
  float32x4_t v84;
  float32x4_t v85;
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v48 = a7;
  v65 = (void *)objc_opt_new();
  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  obj = v48;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v88, 16, v48);
  if (v8)
  {
    v9 = *(_QWORD *)v75;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v75 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v11, "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "setObject:forKey:", v11, v12);

        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v88, 16);
    }
    while (v8);
  }

  v56 = (id)objc_opt_new();
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  objc_msgSend(a1, "retargetedSkeletons");
  v49 = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v70, v87, 16);
  if (v13)
  {
    v51 = *(_QWORD *)v71;
    v14 = (float32x4_t *)MEMORY[0x1E0C83FF0];
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v71 != v51)
          objc_enumerationMutation(v49);
        v16 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * j);
        *(double *)v17.i64 = ARVisionCameraToRenderingCoordinateTransform();
        v61 = v18;
        v63 = v17;
        v57 = v20;
        v59 = v19;
        objc_msgSend(v16, "visionTransform");
        v21 = 0;
        v78 = v22;
        v79 = v23;
        v80 = v24;
        v81 = v25;
        do
        {
          *(float32x4_t *)((char *)&v82 + v21) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v63, COERCE_FLOAT(*(_OWORD *)((char *)&v78 + v21))), v61, *(float32x2_t *)&v78.f32[v21 / 4], 1), v59, *(float32x4_t *)((char *)&v78 + v21), 2), v57, *(float32x4_t *)((char *)&v78 + v21), 3);
          v21 += 16;
        }
        while (v21 != 64);
        v26 = 0;
        v27 = v82;
        v28 = v83;
        v29 = v84;
        v30 = v85;
        v31 = v14[1];
        v32 = v14[2];
        v33 = v14[3];
        v78 = *v14;
        v79 = v31;
        v80 = v32;
        v81 = v33;
        do
        {
          *(float32x4_t *)((char *)&v82 + v26) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v27, COERCE_FLOAT(*(_OWORD *)((char *)&v78 + v26))), v28, *(float32x2_t *)&v78.f32[v26 / 4], 1), v29, *(float32x4_t *)((char *)&v78 + v26), 2), v30, *(float32x4_t *)((char *)&v78 + v26), 3);
          v26 += 16;
        }
        while (v26 != 64);
        v34 = 0;
        v78 = v82;
        v79 = v83;
        v80 = v84;
        v81 = v85;
        do
        {
          *(float32x4_t *)((char *)&v82 + v34) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, COERCE_FLOAT(*(_OWORD *)((char *)&v78 + v34))), a3, *(float32x2_t *)&v78.f32[v34 / 4], 1), a4, *(float32x4_t *)((char *)&v78 + v34), 2), a5, *(float32x4_t *)((char *)&v78 + v34), 3);
          v34 += 16;
        }
        while (v34 != 64);
        v58 = *(double *)v82.i64;
        v60 = *(double *)v83.i64;
        v62 = *(double *)v84.i64;
        v64 = *(double *)v85.i64;
        objc_msgSend(v16, "identifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "objectForKeyedSubscript:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        v37 = [ARBodyAnchor alloc];
        if (v36)
        {
          objc_msgSend(v36, "identifier");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = -[ARBodyAnchor initWithIdentifier:transform:tracked:skeletonData:](v37, "initWithIdentifier:transform:tracked:skeletonData:", v38, 1, v16, v58, v60, v62, v64);

          objc_msgSend(v16, "identifier");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "removeObjectForKey:", v40);
        }
        else
        {
          objc_msgSend(v16, "identifier");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = -[ARBodyAnchor initWithIdentifier:transform:tracked:skeletonData:](v37, "initWithIdentifier:transform:tracked:skeletonData:", v40, 1, v16, v58, v60, v62, v64);
        }

        objc_msgSend(v56, "addObject:", v39);
      }
      v13 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v70, v87, 16);
    }
    while (v13);
  }

  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  objc_msgSend(v65, "allValues");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v66, v86, 16);
  if (v42)
  {
    v43 = *(_QWORD *)v67;
    do
    {
      for (k = 0; k != v42; ++k)
      {
        if (*(_QWORD *)v67 != v43)
          objc_enumerationMutation(v41);
        v45 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * k);
        if (objc_msgSend(v45, "isTracked"))
        {
          v46 = (void *)objc_msgSend(v45, "copyWithTrackedState:", 0);
          objc_msgSend(v56, "addObject:", v46);

        }
      }
      v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v66, v86, 16);
    }
    while (v42);
  }

  return v56;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(double *)(v5 + 16) = self->_timestamp;
  v6 = -[NSArray copyWithZone:](self->_retargetedSkeletons, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  v8 = *(_OWORD *)&self[1].super.isa;
  v9 = *(_OWORD *)&self[1]._imageResolution.height;
  *(_OWORD *)(v5 + 64) = *(_OWORD *)&self[1]._timestamp;
  *(_OWORD *)(v5 + 80) = v9;
  *(_OWORD *)(v5 + 48) = v8;
  *(CGSize *)(v5 + 24) = self->_imageResolution;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id *v5;
  float32x4_t *v6;
  float32x4_t v7;
  uint32x4_t v8;
  BOOL v9;

  v4 = a3;
  if ((objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v5 = (id *)v4;
    v6 = (float32x4_t *)v5;
    v9 = *((double *)v5 + 2) == self->_timestamp
      && (objc_msgSend(v5[1], "isEqual:", self->_retargetedSkeletons) & 1) == 0
      && (v7 = (float32x4_t)vdupq_n_s32(0x38FA0000u),
          v8 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vcgeq_f32(v7, vabdq_f32(v6[4], *(float32x4_t *)&self[1]._timestamp)), (int8x16_t)vcgeq_f32(v7, vabdq_f32(v6[3], *(float32x4_t *)&self[1].super.isa))), (int8x16_t)vcgeq_f32(v7, vabdq_f32(v6[5], *(float32x4_t *)&self[1]._imageResolution.height))), v8.i32[3] = v8.i32[2], (vminvq_u32(v8) & 0x80000000) != 0)&& *(double *)v6[2].i64 == self->_imageResolution.height&& *(double *)&v6[1].i64[1] == self->_imageResolution.width;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (__n128)cameraIntrinsics
{
  return a1[3];
}

- (__n128)setCameraIntrinsics:(__n128)a3
{
  result[3] = a2;
  result[4] = a3;
  result[5] = a4;
  return result;
}

- (CGSize)imageResolution
{
  double width;
  double height;
  CGSize result;

  width = self->_imageResolution.width;
  height = self->_imageResolution.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setImageResolution:(CGSize)a3
{
  self->_imageResolution = a3;
}

- (NSArray)retargetedSkeletons
{
  return self->_retargetedSkeletons;
}

- (void)setRetargetedSkeletons:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retargetedSkeletons, 0);
}

@end
