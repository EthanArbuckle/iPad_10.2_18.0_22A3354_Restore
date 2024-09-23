@implementation StagingBuffer

- (StagingBuffer)initWithContext:(__n128)a3 stagingWidth:(__n128)a4 stagingHeight:(__n128)a5 homography:(__n128)a6 atlasHomography:(__n128)a7
{
  id v14;
  const char *v15;
  StagingBuffer *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  MTLTexture *luma;
  const char *v28;
  uint64_t v29;
  unint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  MTLTexture *chroma;
  const char *v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  MTLTexture *weights;
  StagingBuffer *v53;
  objc_super v61;

  v14 = a9;
  v61.receiver = a1;
  v61.super_class = (Class)StagingBuffer;
  v16 = -[StagingBuffer init](&v61, sel_init);
  if (v16)
  {
    objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x24BDDD740], v15, 25, a10, a11, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setUsage_(v17, v18, 3, v19);
    objc_msgSend_device(v14, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend_newTextureWithDescriptor_(v23, v24, (uint64_t)v17, v25);
    luma = v16->_luma;
    v16->_luma = (MTLTexture *)v26;

    if (!v16->_luma)
      goto LABEL_7;
    v29 = a10 >> 1;
    v30 = a11 >> 1;
    objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x24BDDD740], v28, 65, v29, a11 >> 1, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_setUsage_(v31, v32, 3, v33);
    objc_msgSend_device(v14, v34, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend_newTextureWithDescriptor_(v37, v38, (uint64_t)v31, v39);
    chroma = v16->_chroma;
    v16->_chroma = (MTLTexture *)v40;

    if (!v16->_chroma)
    {
      v53 = 0;
      v17 = v31;
      goto LABEL_6;
    }
    objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x24BDDD740], v42, 25, v29, v30, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_setUsage_(v17, v43, 3, v44);
    objc_msgSend_device(v14, v45, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend_newTextureWithDescriptor_(v48, v49, (uint64_t)v17, v50);
    weights = v16->_weights;
    v16->_weights = (MTLTexture *)v51;

    if (v16->_weights)
    {
      *(__n128 *)v16->_anon_30 = a2;
      *(__n128 *)&v16->_anon_30[16] = a3;
      *(__n128 *)&v16->_anon_30[32] = a4;
      *(__n128 *)&v16[1].super.isa = a5;
      *(__n128 *)&v16[1]._luma = a6;
      *(__n128 *)&v16[1]._weights = a7;
      v16->_dirty = 0;
      fig_note_initialize_category_with_default_work();
      v53 = v16;
    }
    else
    {
LABEL_7:
      v53 = 0;
    }
  }
  else
  {
    v53 = 0;
    v17 = 0;
  }
LABEL_6:

  return v53;
}

- (void)overlapWithAtlasHomography:(float32x4_t *)a1 roi:(simd_float3x3)a2
{
  uint64_t v3;
  float32x4_t v4;
  float32x4_t v5;
  float32x4_t v6;
  simd_float3x3 v7;
  _OWORD v8[3];
  simd_float3x3 v9;

  v9 = __invert_f3(a2);
  v3 = 0;
  v4 = a1[6];
  v5 = a1[7];
  v6 = a1[8];
  v7 = v9;
  memset(v8, 0, sizeof(v8));
  do
  {
    v8[v3] = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v4, COERCE_FLOAT(*(_OWORD *)&v7.columns[v3])), v5, *(float32x2_t *)v7.columns[v3].f32, 1), v6, (float32x4_t)v7.columns[v3], 2);
    ++v3;
  }
  while (v3 != 3);
}

- (MTLTexture)luma
{
  return (MTLTexture *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLuma:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (MTLTexture)chroma
{
  return (MTLTexture *)objc_getProperty(self, a2, 24, 1);
}

- (void)setChroma:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (MTLTexture)weights
{
  return (MTLTexture *)objc_getProperty(self, a2, 32, 1);
}

- (void)setWeights:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (double)homographyToReference
{
  __int128 v2;

  objc_copyStruct(&v2, (const void *)(a1 + 48), 48, 1, 0);
  return *(double *)&v2;
}

- (void)setHomographyToReference:(__n128)a3
{
  _OWORD v4[3];

  v4[0] = a2;
  v4[1] = a3;
  v4[2] = a4;
  objc_copyStruct((void *)(a1 + 48), v4, 48, 1, 0);
}

- (double)atlasHomography
{
  __int128 v2;

  objc_copyStruct(&v2, (const void *)(a1 + 96), 48, 1, 0);
  return *(double *)&v2;
}

- (void)setAtlasHomography:(__n128)a3
{
  _OWORD v4[3];

  v4[0] = a2;
  v4[1] = a3;
  v4[2] = a4;
  objc_copyStruct((void *)(a1 + 96), v4, 48, 1, 0);
}

- (NSDictionary)metadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMetadata:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (BOOL)dirty
{
  return self->_dirty;
}

- (void)setDirty:(BOOL)a3
{
  self->_dirty = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_weights, 0);
  objc_storeStrong((id *)&self->_chroma, 0);
  objc_storeStrong((id *)&self->_luma, 0);
}

@end
