@implementation ARUIRingUniforms

- (void)vertexAttributesBytes
{
  return self->_anon_10;
}

- (void)uniformsBytes
{
  return &self[1];
}

- (ARUIRingUniforms)initWithRing:(id)a3 inContext:(id)a4
{
  id v6;
  id v7;
  ARUIRingUniforms *v8;
  ARUIRingUniforms *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ARUIRingUniforms;
  v8 = -[ARUIRingUniforms init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[ARUIRingUniforms _updateVertexAttributesWithRing:inContext:](v8, "_updateVertexAttributesWithRing:inContext:", v6, v7);
    -[ARUIRingUniforms _updateUniformsWithRing:inContext:](v9, "_updateUniformsWithRing:inContext:", v6, v7);
  }

  return v9;
}

- (void)_updateUniformsWithRing:(id)a3 inContext:(id)a4
{
  id v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float32x2_t v14;
  float32x2_t v15;
  float32x2_t v16;
  float32x2_t v17;
  float v18;
  float v19;
  float v20;
  float v21;
  int v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  int v26;
  int v27;
  int v28;
  _BOOL4 v29;
  double v30;
  float v31;
  float v32;
  __int128 v33;
  float v34;
  float32x2_t v35;
  float v36;
  __float2 v37;
  float32x4_t v38;
  float32x4_t v39;
  float32x4_t v40;
  float32x4_t v41;
  float v47;
  __float2 v48;
  __float2 v49;
  __int128 v50;
  float32x2_t v51;
  float v52;
  id v53;

  v53 = a3;
  v6 = a4;
  objc_msgSend(v53, "diameter");
  v8 = v7;
  objc_msgSend(v53, "thickness");
  v10 = v9;
  objc_msgSend(v6, "screenScale");
  v52 = v11;
  objc_msgSend(v53, "scale");
  v13 = v12;
  objc_msgSend(v53, "translation");
  v15 = v14;
  objc_msgSend(v6, "drawableSize");
  v17 = v16;
  objc_msgSend(v53, "percentage");
  v19 = v18;
  objc_msgSend(v53, "zRotation");
  v21 = v20;
  v22 = objc_msgSend(v6, "opaque");

  if (v22)
  {
    objc_msgSend(v53, "topColorPremultipliedVector");
    *(_OWORD *)&self[1].super.isa = v23;
    objc_msgSend(v53, "bottomColorPremultipliedVector");
  }
  else
  {
    objc_msgSend(v53, "topColorVector");
    *(_OWORD *)&self[1].super.isa = v25;
    objc_msgSend(v53, "bottomColorVector");
  }
  *(_OWORD *)self[1]._anon_10 = v24;
  objc_msgSend(v53, "emptyOpacity");
  *(_DWORD *)&self[1]._anon_10[80] = v26;
  objc_msgSend(v53, "trackOpacity");
  *(_DWORD *)&self[1]._anon_10[88] = v27;
  objc_msgSend(v53, "opacity");
  *(_DWORD *)&self[1]._anon_10[92] = v28;
  *(float *)&self[1]._anon_10[64] = v19;
  v29 = ARUIFloatGreater(v19, 0.5);
  v30 = v19;
  v31 = 2.0;
  if (v29)
  {
    v32 = 2.0 / ((v30 + -0.5) * 2.0 + 1.0);
    v31 = v32;
  }
  v33 = *(_OWORD *)&self[1]._anon_10[64];
  *((float *)&v33 + 1) = (float)(v10 * (float)(v52 * v13)) * 0.5;
  v34 = v8 * 0.2;
  *(double *)&v35 = (float)(v8 * (float)(v52 * v13)) * 0.5 - *((float *)&v33 + 1);
  v35.f32[0] = *(double *)&v35;
  v51 = v35;
  *((_QWORD *)&v33 + 1) = __PAIR64__(LODWORD(v31), v35.u32[0]);
  *(float *)&self[1]._anon_10[84] = v34;
  *(_OWORD *)&self[1]._anon_10[64] = v33;
  v36 = v30 * 6.28318531;
  v37 = __sincosf_stret(v36);
  *(double *)v38.i64 = matrix_float4x4_zRotation_and_translation(-v21, 0.0);
  *(float32x4_t *)&self[1]._anon_10[32] = vaddq_f32(v41, vmlaq_f32(vmlsq_lane_f32(vmulq_f32(v38, (float32x4_t)0), v39, v51, 0), (float32x4_t)0, v40));
  *(float32x4_t *)&self[1]._anon_10[48] = vaddq_f32(v41, vmlaq_f32(vmlaq_n_f32(vmulq_n_f32(v38, v37.__sinval * v51.f32[0]), v39, -(float)(v37.__cosval * v51.f32[0])), (float32x4_t)0, v40));
  __asm { FMOV            V1.2D, #0.5 }
  *(float32x2_t *)v38.f32 = vcvt_f32_f64(vaddq_f64(vmulq_f64(vcvtq_f64_f32(v17), _Q1), vcvtq_f64_f32(vmul_n_f32(v15, v52))));
  v38.i64[1] = 0x3F80000000000000;
  *(float32x4_t *)&self[1]._anon_10[16] = v38;
  v47 = v21 + v30 * 6.28318531;
  v48 = __sincosf_stret(v21 + 0.0);
  v49 = __sincosf_stret(v47);
  *(_QWORD *)&v50 = __PAIR64__(LODWORD(v48.__sinval), LODWORD(v48.__cosval));
  *((_QWORD *)&v50 + 1) = __PAIR64__(LODWORD(v49.__sinval), LODWORD(v49.__cosval));
  *(_OWORD *)&self[1]._anon_10[96] = v50;

}

- (void)_updateVertexAttributesWithRing:(id)a3 inContext:(id)a4
{
  id v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  int32x2_t v20;
  float32x2_t v21;
  float32x2_t v22;
  __int128 v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  float32x4_t v38;
  float32x4_t v39;
  float32x4_t v40;
  float32x4_t v41;
  float32x4_t v42;
  float32x4_t v43;
  float32x4_t v44;
  float32x4_t v45;
  float32x4_t v46;
  float32x4_t v47;
  float32x4_t v48;
  float32x4_t v49;
  float32x4_t v50;
  float32x4_t v51;
  float32x4_t v52;
  float32x4_t v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  float32x4_t v59;
  float32x4_t v60;
  float32x4_t v61;
  float32x4_t v62;

  v54 = a3;
  v6 = a4;
  objc_msgSend(v54, "diameter");
  objc_msgSend(v54, "thickness");
  objc_msgSend(v54, "zRotation");
  v8 = v7;
  objc_msgSend(v6, "screenScale");
  v10 = v9;
  objc_msgSend(v54, "scale");
  v12 = v11;
  v13 = v10 * v11;
  objc_msgSend(v6, "drawableDiameter");
  v15 = v14 / v13;
  objc_msgSend(v6, "skewAdjustmentMatrix");
  v50 = v17;
  v52 = v16;
  v46 = v19;
  v48 = v18;
  objc_msgSend(v54, "translation");
  *(float *)v20.i32 = v12 * v15;
  v21.i32[1] = vneg_f32(v21).i32[1];
  v22 = vdiv_f32(v21, (float32x2_t)vdup_lane_s32(v20, 0));
  *(double *)&v23 = matrix_float4x4_zRotation_and_translation(v8, COERCE_DOUBLE(vadd_f32(v22, v22)));
  v24 = 0;
  v55 = v23;
  v56 = v25;
  v57 = v26;
  v58 = v27;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v59 + v24) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v52, COERCE_FLOAT(*(__int128 *)((char *)&v55 + v24))), v50, *(float32x2_t *)((char *)&v55 + v24), 1), v48, *(float32x4_t *)((char *)&v55 + v24), 2), v46, *(float32x4_t *)((char *)&v55 + v24), 3);
    v24 += 16;
  }
  while (v24 != 64);
  v51 = v60;
  v53 = v59;
  v47 = v62;
  v49 = v61;
  matrix_float4x4_uniform_scale();
  v28 = 0;
  v55 = v29;
  v56 = v30;
  v57 = v31;
  v58 = v32;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v59 + v28) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v53, COERCE_FLOAT(*(__int128 *)((char *)&v55 + v28))), v51, *(float32x2_t *)((char *)&v55 + v28), 1), v49, *(float32x4_t *)((char *)&v55 + v28), 2), v47, *(float32x4_t *)((char *)&v55 + v28), 3);
    v28 += 16;
  }
  while (v28 != 64);
  v44 = v60;
  v45 = v59;
  v42 = v62;
  v43 = v61;
  matrix_float4x4_uniform_scale();
  v33 = 0;
  v55 = v34;
  v56 = v35;
  v57 = v36;
  v58 = v37;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v59 + v33) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v53, COERCE_FLOAT(*(__int128 *)((char *)&v55 + v33))), v51, *(float32x2_t *)((char *)&v55 + v33), 1), v49, *(float32x4_t *)((char *)&v55 + v33), 2), v47, *(float32x4_t *)((char *)&v55 + v33), 3);
    v33 += 16;
  }
  while (v33 != 64);
  v38 = v59;
  v39 = v60;
  v40 = v61;
  v41 = v62;
  *(float32x4_t *)self->_anon_10 = v45;
  *(float32x4_t *)&self->_anon_10[16] = v44;
  *(float32x4_t *)&self->_anon_10[32] = v43;
  *(float32x4_t *)&self->_anon_10[48] = v42;
  *(float32x4_t *)&self->_anon_10[64] = v38;
  *(float32x4_t *)&self->_anon_10[80] = v39;
  *(float32x4_t *)&self->_anon_10[96] = v40;
  *(float32x4_t *)&self->_anon_10[112] = v41;

}

- (__n128)vertexAttributes
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;

  v2 = *(_OWORD *)(a1 + 96);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(a2 + 80) = v2;
  v3 = *(_OWORD *)(a1 + 128);
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(a2 + 112) = v3;
  v4 = *(_OWORD *)(a1 + 32);
  *(_OWORD *)a2 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(a2 + 16) = v4;
  result = *(__n128 *)(a1 + 48);
  v6 = *(_OWORD *)(a1 + 64);
  *(__n128 *)(a2 + 32) = result;
  *(_OWORD *)(a2 + 48) = v6;
  return result;
}

- (__n128)uniforms
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;

  v2 = *(_OWORD *)(a1 + 224);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 208);
  *(_OWORD *)(a2 + 80) = v2;
  v3 = *(_OWORD *)(a1 + 256);
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(a1 + 240);
  *(_OWORD *)(a2 + 112) = v3;
  v4 = *(_OWORD *)(a1 + 160);
  *(_OWORD *)a2 = *(_OWORD *)(a1 + 144);
  *(_OWORD *)(a2 + 16) = v4;
  result = *(__n128 *)(a1 + 176);
  v6 = *(_OWORD *)(a1 + 192);
  *(__n128 *)(a2 + 32) = result;
  *(_OWORD *)(a2 + 48) = v6;
  return result;
}

@end
