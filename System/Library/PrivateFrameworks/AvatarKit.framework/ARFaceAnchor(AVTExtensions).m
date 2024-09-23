@implementation ARFaceAnchor(AVTExtensions)

- (__n128)_avt_rawTransform
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  void *v17;
  void *v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;
  float32x4_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;

  objc_msgSend(a1, "trackingData");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCD60]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
    v4 = (void *)v2;
  else
    v4 = v1;
  v5 = v4;

  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCD58]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCC98]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCCF8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *MEMORY[0x1E0CFCD68];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCD68]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ARMatrix3x3FromArray();

  v11 = *MEMORY[0x1E0CFCD90];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCD90]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  ARVector3FromArray();

  ARVector3ScalarMultiplication();
  ARMatrix4x4FromRotationAndTranslation();
  v29 = v14;
  v30 = v13;
  v26 = v16;
  v28 = v15;
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  ARMatrix3x3FromArray();

  objc_msgSend(v8, "objectForKeyedSubscript:", v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  ARVector3FromArray();

  ARVector3ScalarMultiplication();
  ARMatrix4x4FromRotationAndTranslation();
  v23 = 0;
  v31 = v30;
  v32 = v29;
  v33 = v28;
  v34 = v26;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  do
  {
    *(__int128 *)((char *)&v35 + v23) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v19, COERCE_FLOAT(*(__int128 *)((char *)&v31 + v23))), v20, *(float32x2_t *)((char *)&v31 + v23), 1), v21, *(float32x4_t *)((char *)&v31 + v23), 2), v22, *(float32x4_t *)((char *)&v31 + v23), 3);
    v23 += 16;
  }
  while (v23 != 64);
  v24 = 0;
  v31 = v35;
  v32 = v36;
  v33 = v37;
  v34 = v38;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  do
  {
    *(__int128 *)((char *)&v35 + v24) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_1DD26A060, COERCE_FLOAT(*(__int128 *)((char *)&v31 + v24))), (float32x4_t)xmmword_1DD26A010, *(float32x2_t *)((char *)&v31 + v24), 1), (float32x4_t)xmmword_1DD26A160, *(float32x4_t *)((char *)&v31 + v24), 2), (float32x4_t)xmmword_1DD26A170, *(float32x4_t *)((char *)&v31 + v24), 3);
    v24 += 16;
  }
  while (v24 != 64);
  v27 = v35;

  return (__n128)v27;
}

- (float)_avt_rawBlendShapeAtLocation:()AVTExtensions
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  int v10;
  void *v11;
  id v12;
  float v13;
  float v14;
  void *v15;
  uint64_t v16;

  v4 = a3;
  objc_msgSend(a1, "trackingData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCD60]);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (void *)v6;
  else
    v8 = v5;
  v9 = v8;

  v10 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C894D8]);
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCC40]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCC78]);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "floatValue");
    if (v13 <= 0.5)
      v14 = 0.0;
    else
      v14 = 1.0;
  }
  else
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCC48]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = AVTBlendShapeLocationToARIndex(v4);
    v12 = objc_retainAutorelease(v15);
    v14 = *(float *)(objc_msgSend(v12, "bytes") + 4 * v16);
  }

  return v14;
}

@end
