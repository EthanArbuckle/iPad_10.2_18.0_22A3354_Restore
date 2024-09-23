@implementation MDLNormalMapTexture

- (id)generateDataAtLevel:(int64_t)a3 selector:(SEL)a4
{
  int32x2_t v4;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  const char *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  const char *v17;
  int8x8_t v18;
  int32x2_t v19;
  int8x8_t v20;
  int v21;
  int v22;
  id v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  id v29;
  const char *v30;
  uint64_t v31;
  const void *v32;
  const char *v33;
  uint64_t v34;
  size_t v35;

  if (self->super._channelEncoding != 1)
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v8, v12, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: Only 8 bit textures supported"), v10, v11);

  }
  if (self->super._textureData.channelCount != 4)
  {
    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v13, v17, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: Only 4 channel textures supported"), v15, v16);

  }
  v4.i32[0] = 0;
  v18.i32[1] = HIDWORD(*(_QWORD *)self->super._anon_118);
  v18.i32[0] = 1;
  v19 = (int32x2_t)vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_s32(v4, *(int32x2_t *)self->super._anon_118), 0), v18, *(int8x8_t *)self->super._anon_118);
  v20 = vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_s32(v4, vdup_lane_s32(v19, 1)), 0), (int8x8_t)(v19.u32[0] | 0x100000000), (int8x8_t)v19);
  if (v20.i32[0] >> a3 <= 1)
    v21 = 1;
  else
    v21 = v20.i32[0] >> a3;
  if (v20.i32[1] >> a3 <= 1)
    v22 = 1;
  else
    v22 = v20.i32[1] >> a3;
  objc_msgSend_allocateDataAtLevel_(self, a2, a3);
  v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v26 = (void *)objc_msgSend_mutableBytes(v23, v24, v25);
  objc_msgSend_texelDataWithTopLeftOrigin(self->_sourceTexture, v27, v28);
  v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v32 = (const void *)objc_msgSend_bytes(v29, v30, v31);
  v35 = objc_msgSend_length(v23, v33, v34);
  memcpy(v26, v32, v35);
  sub_1DCC30664(v21, v22, (unsigned int *)v26, *(float *)(&self->super._hasAlphaValues + 2), self->_smoothness);

  return v23;
}

- (MDLNormalMapTexture)initByGeneratingNormalMapWithTexture:(MDLTexture *)sourceTexture name:(NSString *)name smoothness:(float)smoothness contrast:(float)contrast
{
  MDLTexture *v11;
  NSString *v12;
  const char *v13;
  uint64_t v14;
  MDLNormalMapTexture *v15;
  uint64_t v16;
  NSString *v17;
  uint64_t v18;
  MDLNormalMapTexture *v19;
  objc_super v21;

  v11 = sourceTexture;
  v12 = name;
  v21.receiver = self;
  v21.super_class = (Class)MDLNormalMapTexture;
  v15 = -[MDLTexture init](&v21, sel_init);
  if (v15)
  {
    if (v12)
    {
      objc_msgSend_stringWithString_(MEMORY[0x1E0CB3940], v13, (uint64_t)v12);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v15->super._name;
      v15->super._name = (NSString *)v16;

    }
    objc_msgSend_dimensions(v11, v13, v14);
    *(_QWORD *)v15->super._anon_118 = v18;
    *(_QWORD *)&v15->super._anon_118[8] = 4 * (int)v18;
    v15->super._textureData.channelCount = 4;
    v15->super._channelEncoding = 1;
    *(float *)(&v15->super._hasAlphaValues + 2) = smoothness;
    v15->_smoothness = contrast;
    objc_storeStrong((id *)&v15->_sourceTexture, sourceTexture);
    v15->super._selfCreating = 1;
    v19 = v15;
  }

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceTexture, 0);
}

@end
