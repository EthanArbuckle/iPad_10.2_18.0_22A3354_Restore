@implementation ARUISpriteUniforms

- (ARUISpriteUniforms)initWithSprite:(id)a3 inContext:(id)a4
{
  id v6;
  id v7;
  ARUISpriteUniforms *v8;
  ARUISpriteUniforms *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ARUISpriteUniforms;
  v8 = -[ARUISpriteUniforms init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[ARUISpriteUniforms _updateVertexAttributesWithSprite:inContet:](v8, "_updateVertexAttributesWithSprite:inContet:", v6, v7);
    -[ARUISpriteUniforms _updateUniformsWithSprite:](v9, "_updateUniformsWithSprite:", v6);
  }

  return v9;
}

- (void)_updateVertexAttributesWithSprite:(id)a3 inContet:(id)a4
{
  id v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  float32x4_t v27;
  float32x4_t v28;
  float32x4_t v29;
  float32x4_t v30;
  float32x4_t v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;

  v32 = a3;
  v6 = a4;
  objc_msgSend(v6, "skewAdjustmentMatrix");
  v30 = v8;
  v31 = v7;
  v28 = v10;
  v29 = v9;
  objc_msgSend(v6, "drawableDiameter");
  objc_msgSend(v6, "screenScale");
  objc_msgSend(v32, "translation");
  objc_msgSend(v32, "translation");
  *(double *)v11.i64 = matrix_float4x4_translation();
  v26 = v12;
  v27 = v11;
  v24 = v14;
  v25 = v13;
  objc_msgSend(v32, "size");
  matrix_float4x4_uniform_scale();
  v15 = 0;
  v33 = v16;
  v34 = v17;
  v35 = v18;
  v36 = v19;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  do
  {
    *(__int128 *)((char *)&v37 + v15) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v27, COERCE_FLOAT(*(__int128 *)((char *)&v33 + v15))), v26, *(float32x2_t *)((char *)&v33 + v15), 1), v25, *(float32x4_t *)((char *)&v33 + v15), 2), v24, *(float32x4_t *)((char *)&v33 + v15), 3);
    v15 += 16;
  }
  while (v15 != 64);
  v20 = 0;
  v33 = v37;
  v34 = v38;
  v35 = v39;
  v36 = v40;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  do
  {
    *(__int128 *)((char *)&v37 + v20) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v31, COERCE_FLOAT(*(__int128 *)((char *)&v33 + v20))), v30, *(float32x2_t *)((char *)&v33 + v20), 1), v29, *(float32x4_t *)((char *)&v33 + v20), 2), v28, *(float32x4_t *)((char *)&v33 + v20), 3);
    v20 += 16;
  }
  while (v20 != 64);
  v21 = v38;
  v22 = v39;
  v23 = v40;
  *(_OWORD *)&self[1].super.isa = v37;
  *(_OWORD *)self[1]._anon_10 = v21;
  *(_OWORD *)&self[1]._anon_10[16] = v22;
  *(_OWORD *)&self[2].super.isa = v23;

}

- (void)_updateUniformsWithSprite:(id)a3
{
  id v4;
  __int128 v5;
  int v6;
  int v7;

  v4 = a3;
  objc_msgSend(v4, "textureRect");
  *(_OWORD *)self->_anon_10 = v5;
  objc_msgSend(v4, "opacity");
  v7 = v6;

  *(_DWORD *)&self->_anon_10[16] = v7;
}

- (void)vertexAttributesBytes
{
  return &self[1];
}

- (void)uniformsBytes
{
  return self->_anon_10;
}

- (__n128)vertexAttributes
{
  return a1[3];
}

- ($3BA783FF50B239963188BE194EBFFEBA)uniforms
{
  _OWORD *v2;
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)self->_anon_10;
  v4 = *(_OWORD *)&self->_anon_10[16];
  *v2 = v3;
  v2[1] = v4;
  return ($3BA783FF50B239963188BE194EBFFEBA)v3;
}

@end
