@implementation _MDLProbeCluster

- (BOOL)isEmpty
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  BOOL v6;

  objc_msgSend_probes(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_count(v3, v4, v5) == 0;

  return v6;
}

- (BOOL)isEqualToCluster:(id)a3
{
  const char *v4;
  uint64_t v5;
  id v6;
  float32x4_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  float32x4_t v12;
  float32x4_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  float32x4_t v18;
  float32x4_t v19;
  const char *v20;
  uint64_t v21;
  float32x4_t v22;
  __int8 v23;
  float32x4_t v25;
  float32x4_t v26;
  float32x4_t v27;

  v6 = a3;
  if (v6
    && (objc_msgSend_centroid(self, v4, v5),
        v25 = v7,
        objc_msgSend_centroid(v6, v8, v9),
        (vmovn_s32(vceqq_f32(v25, v12)).u8[0] & 1) != 0)
    && (objc_msgSend_centroid(self, v10, v11),
        v26 = v13,
        objc_msgSend_centroid(v6, v14, v15),
        (vmovn_s32(vceqq_f32(v26, v18)).i8[2] & 1) != 0))
  {
    objc_msgSend_centroid(self, v16, v17);
    v27 = v19;
    objc_msgSend_centroid(v6, v20, v21);
    v23 = vmovn_s32(vceqq_f32(v27, v22)).i8[4];
  }
  else
  {
    v23 = 0;
  }

  return v23 & 1;
}

- (BOOL)isEqual:(id)a3
{
  _MDLProbeCluster *v4;
  const char *v5;
  char isEqualToCluster;

  v4 = (_MDLProbeCluster *)a3;
  if (self == v4)
  {
    isEqualToCluster = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      isEqualToCluster = objc_msgSend_isEqualToCluster_(self, v5, (uint64_t)v4);
    else
      isEqualToCluster = 0;
  }

  return isEqualToCluster;
}

- (unint64_t)hash
{
  uint64_t v2;
  int8x8_t v4;
  const char *v5;
  uint64_t v6;
  int8x8_t v7;
  float32x2_t v8;
  int32x2_t v9;
  int8x16_t v10;
  int8x16_t v11;
  int64x2_t v12;
  unint64_t v13;
  const char *v14;
  uint64_t v15;
  float v16;
  uint64_t v17;
  int8x8_t v19;

  objc_msgSend_centroid(self, a2, v2);
  v19 = v4;
  objc_msgSend_centroid(self, v5, v6);
  v8 = (float32x2_t)vext_s8(v7, v19, 4uLL);
  v9 = vceqz_f32(v8);
  v10.i64[0] = v9.i32[0];
  v10.i64[1] = v9.i32[1];
  v11 = v10;
  v10.i64[0] = v8.u32[0];
  v10.i64[1] = v8.u32[1];
  v12 = (int64x2_t)vbicq_s8(v10, v11);
  v13 = veorq_s8((int8x16_t)v12, (int8x16_t)vdupq_laneq_s64(v12, 1)).u64[0];
  objc_msgSend_centroid(self, v14, v15);
  v17 = LODWORD(v16);
  if (v16 == 0.0)
    v17 = 0;
  return v13 ^ v17;
}

- (void)calculateCentroidNotIncludingSamplesinArray:(id)a3
{
  id v4;
  NSMutableSet *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  float32x4_t v14;
  int32x2_t v15;
  float32x4_t v21;
  float32x4_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = self->_probes;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v23, v27, 16);
  if (!v8)
  {

    v22 = 0u;
LABEL_13:
    v21 = v22;
    goto LABEL_14;
  }
  v9 = 0;
  v10 = *(_QWORD *)v24;
  v22 = 0u;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v24 != v10)
        objc_enumerationMutation(v5);
      v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
      if ((objc_msgSend_containsObject_(v4, v7, (uint64_t)v12, *(_OWORD *)&v22, (_QWORD)v23) & 1) == 0)
      {
        objc_msgSend_position(v12, v7, v13);
        v22 = vaddq_f32(v14, v22);
        ++v9;
      }
    }
    v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v7, (uint64_t)&v23, v27, 16);
  }
  while (v8);

  if (v9 < 1)
    goto LABEL_13;
  *(float *)v15.i32 = (float)v9;
  __asm { FMOV            V1.4S, #1.0 }
  v21 = vmulq_f32(v22, vdivq_f32(_Q1, (float32x4_t)vdupq_lane_s32(v15, 0)));
LABEL_14:
  *(float32x4_t *)self->_centroid = v21;

}

- (double)centroid
{
  __int128 v2;

  objc_copyStruct(&v2, (const void *)(a1 + 16), 16, 1, 0);
  return *(double *)&v2;
}

- (void)setCentroid:(_MDLProbeCluster *)self
{
  __int128 v2;
  __int128 v3;

  v3 = v2;
  objc_copyStruct(self->_centroid, &v3, 16, 1, 0);
}

- (NSMutableSet)probes
{
  return (NSMutableSet *)objc_getProperty(self, a2, 8, 1);
}

- (void)setProbes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_probes, 0);
}

@end
