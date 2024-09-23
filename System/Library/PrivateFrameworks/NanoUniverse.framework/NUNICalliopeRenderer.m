@implementation NUNICalliopeRenderer

- (NUNICalliopeRenderer)initWithPixelFormat:(unint64_t)a3 textureSuffix:(id)a4 rendererStyle:(unint64_t)a5
{
  id v8;
  NUNICalliopeRenderer *v9;
  uint64_t v10;
  NUNICalliopeResourceManager *resourceManager;
  uint64_t v12;
  MTLDevice *device;
  uint64_t v14;
  NUNICalliopeTextureGroup *textureGroup;
  void *v16;
  void *v17;
  objc_super v19;

  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)NUNICalliopeRenderer;
  v9 = -[NUNIRenderer initWithPixelFormat:textureSuffix:rendererStyle:](&v19, sel_initWithPixelFormat_textureSuffix_rendererStyle_, a3, v8, a5);
  if (v9)
  {
    +[NUNICalliopeResourceManager sharedInstanceWithDisplayPixelFormat:](NUNICalliopeResourceManager, "sharedInstanceWithDisplayPixelFormat:", a3);
    v10 = objc_claimAutoreleasedReturnValue();
    resourceManager = v9->_resourceManager;
    v9->_resourceManager = (NUNICalliopeResourceManager *)v10;

    -[NUNICalliopeResourceManager addClient](v9->_resourceManager, "addClient");
    objc_msgSend(MEMORY[0x24BE16F48], "sharedDevice");
    v12 = objc_claimAutoreleasedReturnValue();
    device = v9->_device;
    v9->_device = (MTLDevice *)v12;

    -[NUNICalliopeResourceManager textureGroupWithSuffix:](v9->_resourceManager, "textureGroupWithSuffix:", v8);
    v14 = objc_claimAutoreleasedReturnValue();
    textureGroup = v9->_textureGroup;
    v9->_textureGroup = (NUNICalliopeTextureGroup *)v14;

    -[MTLDevice supportsFamily:](v9->_device, "supportsFamily:", 1004);
    v9->_bloomDownsampleUsingTileShaders = 0;
    v9->_bloomEnabled = -[MTLDevice supportsFamily:](v9->_device, "supportsFamily:", 1004);
    v16 = (void *)MGGetStringAnswer();
    v9->_useLowerResolutionTextures = objc_msgSend(v16, "isEqualToString:", CFSTR("t8010"));
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_isPhone = objc_msgSend(v17, "userInterfaceIdiom") == 0;

  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[NUNICalliopeResourceManager removeClient](self->_resourceManager, "removeClient");
  v3.receiver = self;
  v3.super_class = (Class)NUNICalliopeRenderer;
  -[NUNIRenderer dealloc](&v3, sel_dealloc);
}

- (void)setRendererOptions:(id)a3
{
  NUNIRendererOptions **p_rendererOptions;
  id v6;

  p_rendererOptions = &self->_rendererOptions;
  objc_storeStrong((id *)&self->_rendererOptions, a3);
  v6 = a3;
  LODWORD(p_rendererOptions) = -[NUNIRendererOptions changeSequence](*p_rendererOptions, "changeSequence");

  self->_rendererOptionsChangeSequence = (_DWORD)p_rendererOptions - 1;
}

- (void)purgeUnusedWithScene:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = *(_QWORD *)(objc_msgSend(a3, "structure") + 56);
  objc_msgSend(MEMORY[0x24BE16F60], "sharedInstance");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE16F70], "nullTexture2D");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 24; ++i)
  {
    if (v4 != i)
    {
      -[NUNICalliopeTextureGroup gradients](self->_textureGroup, "gradients");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", i);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8 != v5)
      {
        objc_msgSend(v8, "atlas");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "uuid");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "purge:", v10);

      }
    }
  }

}

- (id)contentMaskLayer
{
  return self->_contentMaskLayer;
}

- (void)setContentMaskLayer:(id)a3
{
  objc_storeStrong((id *)&self->_contentMaskLayer, a3);
}

- (void)_updateStateWithScene:(const NUNISceneStructure *)a3 viewport:(NUNIViewport)a4
{
  int width;
  int height;
  void *v8;
  int32x4_t v16;
  int32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  float var1;
  int32x4_t v26;
  float v30;
  float v31;
  float v32;
  simd_float4 v33;
  simd_float4 v34;
  simd_float4 v35;
  simd_float4 v36;
  __float2 v37;
  float32x2_t v38;
  simd_float4 v39;
  simd_float4 v40;
  simd_float4 v41;
  simd_float4 v42;
  simd_float4 v43;
  simd_float4 v44;
  simd_float4 v45;
  simd_float4 v46;
  simd_float4 v47;
  simd_float4 v48;
  simd_float4 v49;
  simd_float4 v50;
  simd_float4 v51;
  simd_float4 v52;
  simd_float4 v53;
  simd_float4 v54;
  simd_float4 v55;
  simd_float4 v56;
  simd_float4 v57;
  simd_float4 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  simd_float4 v63;
  simd_float4 v64;
  simd_float4 v65;
  simd_float4 v66;
  float32x4_t v67;
  unint64_t var4;
  simd_float4 v69;
  simd_float4 v70;
  simd_float4 v71;
  simd_float4 v72;
  float32x4_t v73;
  int32x4_t v74;
  float32x4_t v75;
  __int128 v76;
  simd_float4 v77;
  simd_float4 v78;
  simd_float4 v79;
  simd_float4 v80;
  simd_float4x4 v81;
  simd_float4x4 v82;
  simd_float4x4 v83;
  simd_float4x4 v84;
  simd_float4x4 v85;
  simd_float4x4 v86;
  simd_float4x4 v87;
  simd_float4x4 v88;

  width = a4.width;
  height = a4.height;
  objc_msgSend(MEMORY[0x24BE16F60], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateTextureStreaming");

  v76 = *(_OWORD *)&a3->var0;
  v67 = *(float32x4_t *)&a3->var3;
  _Q0 = vsubq_f32(v67, *(float32x4_t *)&a3->var0);
  _Q1 = vmulq_f32(_Q0, _Q0);
  _S2 = _Q0.i32[2];
  __asm { FMLA            S1, S2, V0.S[2] }
  _Q1.f32[0] = sqrtf(_Q1.f32[0]);
  v16 = (int32x4_t)vdivq_f32(_Q0, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q1.f32, 0));
  v17 = *(int32x4_t *)&a3->var5;
  v18 = (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v16, (int8x16_t)v16, 0xCuLL), (int8x16_t)v16, 8uLL);
  _Q3 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v17, v17), (int8x16_t)v17, 0xCuLL);
  v19 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v16, v16), (int8x16_t)v16, 0xCuLL);
  _Q2 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(vextq_s8((int8x16_t)v17, (int8x16_t)v17, 0xCuLL), (int8x16_t)v17, 8uLL), vnegq_f32(v19)), _Q3, v18);
  _Q3.i32[0] = _Q2.i32[2];
  __asm { FMLA            S4, S3, V2.S[2] }
  _Q3.f32[0] = sqrtf(_S4);
  if (_Q3.f32[0] < 0.00001)
  {
    _Q2 = vmlaq_f32(vmulq_f32(v19, (float32x4_t)xmmword_2134DC490), (float32x4_t)xmmword_2134DBD80, v18);
    _Q3.i64[0] = _Q2.u32[2];
    __asm { FMLA            S4, S3, V2.S[2] }
    _Q3.f32[0] = sqrtf(_S4);
    if (_Q3.f32[0] < 0.00001)
    {
      _Q2 = vmlaq_f32(vmulq_f32(v19, (float32x4_t)xmmword_2134DC4A0), (float32x4_t)xmmword_2134DC4B0, v18);
      _Q3.i64[0] = _Q2.u32[2];
      __asm { FMLA            S4, S3, V2.S[2] }
      _Q3.f32[0] = sqrtf(_S4);
    }
  }
  var1 = a3->var8.var0.var1;
  v26 = (int32x4_t)vdivq_f32(_Q2, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q3.f32, 0));
  _Q0 = vmlaq_f32(vmulq_f32(v18, vnegq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v26, v26), (int8x16_t)v26, 0xCuLL))), v19, (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v26, (int8x16_t)v26, 0xCuLL), (int8x16_t)v26, 8uLL));
  _Q1 = vmulq_f32(_Q0, _Q0);
  _S2 = _Q0.i32[2];
  __asm { FMLA            S1, S2, V0.S[2] }
  _Q1.f32[0] = sqrtf(_Q1.f32[0]);
  v73 = vnegq_f32(vdivq_f32(_Q0, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q1.f32, 0)));
  v74 = v26;
  v30 = (float)width / (float)height;
  v75 = (float32x4_t)v16;
  var4 = a3[1].var4;
  if (v30 >= 1.0)
  {
    v32 = 0.34907;
  }
  else
  {
    v31 = atanf(0.17633 / v30);
    v32 = v31 + v31;
  }
  *(__n64 *)v33.f32 = UMFloat4x4MakeLookAt(*(double *)v74.i64, v73.f32[0]);
  v79 = v34;
  v80 = v33;
  v77 = v36;
  v78 = v35;
  if (fabsf(var1) > 0.00001)
  {
    v37 = __sincosf_stret(var1 * 0.5);
    v38 = vmul_n_f32(*(float32x2_t *)v75.f32, v37.__sinval);
    *(__n64 *)v39.f32 = UMFloat4x4Make(v38.f32[0], v38.f32[1], vmuls_lane_f32(v37.__sinval, v75, 2), v37.__cosval);
    v85.columns[0] = v39;
    v85.columns[1] = v40;
    v85.columns[2] = v41;
    v85.columns[3] = v42;
    v81.columns[1] = v79;
    v81.columns[0] = v80;
    v81.columns[3] = v77;
    v81.columns[2] = v78;
    *(double *)v43.i64 = UMMul(v81, v85);
    v79 = v44;
    v80 = v43;
    v77 = v46;
    v78 = v45;
  }
  *(double *)v47.i64 = UMFloat4x4MakeTranslate();
  v86.columns[0] = v47;
  v86.columns[1] = v48;
  v86.columns[2] = v49;
  v86.columns[3] = v50;
  v82.columns[1] = v79;
  v82.columns[0] = v80;
  v82.columns[3] = v77;
  v82.columns[2] = v78;
  *(double *)v51.i64 = UMMul(v82, v86);
  v71 = v52;
  v72 = v51;
  v69 = v54;
  v70 = v53;
  v55.f32[0] = UMFloat4x4MakePerspective((float)(v32 * 180.0) / 3.1416, (float)width / (float)height, 0.001, 5.0);
  v65 = v56;
  v66 = v55;
  v63 = v58;
  v64 = v57;
  *(double *)v83.columns[0].i64 = UMFloat4x4MakeTranslate();
  v87.columns[1] = v65;
  v87.columns[0] = v66;
  v87.columns[3] = v63;
  v87.columns[2] = v64;
  *(double *)v84.columns[0].i64 = UMMul(v83, v87);
  v88.columns[1] = v71;
  v88.columns[0] = v72;
  v88.columns[3] = v69;
  v88.columns[2] = v70;
  *(double *)&v59 = UMMul(v84, v88);
  self->_state.viewport.width = width;
  self->_state.viewport.height = height;
  self->_state.cameraRoll = var1;
  self->_state.aspect = v30;
  self->_state.fovY = v32;
  *(_DWORD *)self->_anon_304 = 0;
  *(_QWORD *)&self->_anon_304[4] = var4;
  *(_OWORD *)&self->_anon_304[12] = v76;
  *(float32x4_t *)&self->_anon_304[28] = v67;
  *(float32x4_t *)&self->_anon_304[44] = v73;
  *(int32x4_t *)&self->_anon_304[60] = v74;
  *(float32x4_t *)&self->_anon_304[76] = v75;
  *(simd_float4 *)&self->_anon_304[92] = v80;
  *(simd_float4 *)&self->_anon_304[108] = v79;
  *(simd_float4 *)&self->_anon_304[124] = v78;
  *(simd_float4 *)&self->_anon_304[140] = v77;
  *(simd_float4 *)&self->_anon_304[156] = v72;
  *(simd_float4 *)&self->_anon_304[172] = v71;
  *(simd_float4 *)&self->_anon_304[188] = v70;
  *(simd_float4 *)&self->_anon_304[204] = v69;
  *(_OWORD *)&self->_anon_304[220] = v59;
  *(_OWORD *)&self->_anon_304[236] = v60;
  *(_OWORD *)&self->_anon_304[252] = v61;
  *(_OWORD *)&self->_anon_304[268] = v62;
}

- (unint64_t)_computePatchSpheroidLodWithPositionInViewSpace:(NUNICalliopeRenderer *)self radius:(SEL)a2 drawableSize:
{
  uint64_t v2;
  float v3;
  uint64_t v4;

  return (unint64_t)fminf(fmaxf(log2f(fabsf((float)((float)((float)(1024.0 / fmaxf(*(float *)&v4, *((float *)&v4 + 1))) / v3)* *(float *)(v2 + 8))/ 10.0)), 0.0), 1024.0);
}

- (void)_updateTextureLODsForPatchSpheroid:(NUNICalliopeRenderer *)self uvRate:(SEL)a2 drawableSize:(unint64_t)a3
{
  float32x2_t *v3;
  float32x2_t v4;
  int32x2_t v5;
  float32x2_t v7;
  float v8;
  char *v9;
  _DWORD *v10;
  float v11;
  uint16x4_t v12;
  float32x4_t v13;
  float v14;
  float32x4_t v15;
  float v16;
  float32x4_t v17;
  int32x4_t v18;
  uint32x4_t v19;
  id v20;
  uint64_t i;
  $5AFC0E169F343DF89EAE37A2F834CF53 *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  float32x4_t v27;
  int32x4_t v28;
  uint16x4_t v29;
  float v30;
  float32x4_t v31;
  float32x4_t v32;
  int32x4_t v33;
  int32x4_t v34;

  v7 = vmul_f32(*v3, v4);
  v8 = fminf(v7.f32[0], v7.f32[1]);
  if (self->_isPhone)
    v9 = (char *)&_NUNIAtlasSizes_iphone;
  else
    v9 = (char *)&_NUNIAtlasSizes_ipad;
  v10 = &_NUNIAtlasMipCounts_iphone;
  v11 = 1.0 / v8;
  if (!self->_isPhone)
    v10 = &_NUNIAtlasMipCounts_ipad;
  v5.i32[0] = v10[a3];
  v12 = (uint16x4_t)vmovl_u8((uint8x8_t)v5).u64[0];
  v29 = v12;
  v5.i32[0] = 1067030938;
  if (!self->_useLowerResolutionTextures)
    *(float *)v5.i32 = -0.5;
  v27 = (float32x4_t)vdupq_lane_s32(v5, 0);
  v28 = (int32x4_t)vmovl_u16(v12);
  v33 = (int32x4_t)vabsq_f32(vmulq_n_f32(vcvtq_f32_u32(vmovl_u16(*(uint16x4_t *)&v9[8 * a3])), v11));
  v30 = log2f(*(float *)&v33.i32[1]);
  v13.f32[0] = log2f(*(float *)v33.i32);
  v13.f32[1] = v30;
  v31 = v13;
  v14 = log2f(*(float *)&v33.i32[2]);
  v15 = v31;
  v15.f32[2] = v14;
  v32 = v15;
  v16 = log2f(*(float *)&v33.i32[3]);
  v17 = v32;
  v17.f32[3] = v16;
  v18 = vcvtq_s32_f32(vmaxnmq_f32(vaddq_f32(v27, v17), (float32x4_t)0));
  v19.i64[0] = -1;
  v19.i64[1] = -1;
  v17.i64[0] = 0x400000004;
  v17.i64[1] = 0x400000004;
  v34 = vminq_s32((int32x4_t)vbslq_s8((int8x16_t)vcgtq_s32(v28, v18), (int8x16_t)v18, (int8x16_t)vaddw_u16(v19, v29)), (int32x4_t)v17);
  v20 = -[NUNIRenderer textureSuffix](self, "textureSuffix");
  for (i = 0; i != 24; ++i)
  {
    v22 = -[NUNICalliopeResourceManager patchTextureGroupForSpheroid:index:suffix:](self->_resourceManager, "patchTextureGroupForSpheroid:index:suffix:", a3, i, v20, *(_OWORD *)&v27, *(_OWORD *)&v28);
    objc_msgSend(v22->var0, "atlas");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setMaxMipmapLevelsToDrop:", v34.i32[0]);

    objc_msgSend(v22->var1, "atlas");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setMaxMipmapLevelsToDrop:", v34.i32[1]);

    objc_msgSend(v22->var2, "atlas");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setMaxMipmapLevelsToDrop:", v34.i32[2]);

    objc_msgSend(v22->var3, "atlas");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setMaxMipmapLevelsToDrop:", v34.i32[3]);

  }
}

- (void)_updateBaseUniformsForViewport:(NUNIViewport)a3
{
  int width;
  int height;
  unsigned int v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;
  void *v10;
  NSObject *v18;
  NUNICalliopeResourceManager *resourceManager;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  float v24;
  double v26;
  double v27;
  float v30;
  float v32;
  int v33;
  _BYTE buf[32];
  __int128 v35;
  _BYTE v36[22];
  uint64_t v37;

  width = a3.width;
  v37 = *MEMORY[0x24BDAC8D0];
  height = a3.height;
  if (__ROR8__(0xEEEEEEEEEEEEEEEFLL * self->_frame, 2) <= 0x444444444444444uLL)
  {
    v6 = -[NUNIRendererOptions changeSequence](self->_rendererOptions, "changeSequence");
    if (v6 != self->_rendererOptionsChangeSequence)
    {
      v33 = height;
      v7 = 0;
      self->_rendererOptionsChangeSequence = v6;
      do
      {
        v8 = _updateBaseUniformsForViewport__optionKeys[v7];
        -[NUNIRendererOptions fractionValueForOption:](self->_rendererOptions, "fractionValueForOption:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9)
        {
          objc_msgSend(v9, "doubleValue");
          __asm { FCVT            H0, D0 }
          _H1 = *(_WORD *)&self->_anon_5c6[2 * v7 + 1];
          __asm
          {
            FCVT            S0, H0
            FCVT            S1, H1
          }
          if (_S1 != *(float *)&_D0)
          {
            NUNILoggingObjectForDomain(0);
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543618;
              *(_QWORD *)&buf[4] = v8;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v10;
              _os_log_debug_impl(&dword_2134A1000, v18, OS_LOG_TYPE_DEBUG, "Overriding option %{public}@ with value %{public}@", buf, 0x16u);
            }

            objc_msgSend(v10, "doubleValue");
            __asm { FCVT            H0, D0 }
            *(_WORD *)&self->_anon_5c6[2 * v7 + 1] = _D0;
          }
        }

        ++v7;
      }
      while (v7 != 35);
      resourceManager = self->_resourceManager;
      v21 = *(_OWORD *)&self->_anon_5c6[49];
      v35 = *(_OWORD *)&self->_anon_5c6[33];
      *(_OWORD *)v36 = v21;
      *(_QWORD *)&v36[14] = *(_QWORD *)&self->_anon_5c6[63];
      v22 = *(_OWORD *)&self->_anon_5c6[17];
      *(_OWORD *)buf = *(_OWORD *)&self->_anon_5c6[1];
      *(_OWORD *)&buf[16] = v22;
      -[NUNICalliopeResourceManager setPipelineConstants:](resourceManager, "setPipelineConstants:", buf);
      height = v33;
    }
  }
  v23 = *(_QWORD *)&self->_anon_304[4];
  v24 = (float)width;
  __asm { FMOV            V4.2S, #1.0 }
  HIDWORD(v26) = HIDWORD(_D4);
  if (height > width)
  {
    *((float *)&_D4 + 1) = (float)height / (float)width;
    v27 = _D4;
  }
  else
  {
    v24 = (float)height;
    *(float *)&v26 = (float)width / (float)height;
    v27 = v26;
  }
  _H4 = *(_WORD *)&self->_anon_5c6[11];
  __asm { FCVT            S4, H4 }
  v30 = (float)(_S4 * 5.0) + 1.0;
  LOWORD(_S4) = *(_WORD *)&self->_anon_5c6[13];
  __asm { FCVT            S4, H4 }
  v32 = _S4 * -10.0;
  *(_OWORD *)&self->_baseUniforms.vsh.{?= = 0u;
  *(_OWORD *)&self->_anon_421[15] = 0u;
  *(_OWORD *)&self->_anon_421[31] = 0u;
  *(_QWORD *)&self->_anon_421[47] = v23;
  *(double *)&self->_anon_421[55] = v27;
  *(float *)&self->_anon_421[63] = 1.0 / v24;
  *(_OWORD *)&self->_anon_421[67] = 0u;
  *(_OWORD *)&self->_anon_421[83] = 0u;
  *(_OWORD *)&self->_anon_421[99] = 0u;
  *(_OWORD *)&self->_anon_421[115] = 0u;
  *(_OWORD *)&self->_anon_421[131] = 0u;
  *(_OWORD *)&self->_anon_421[147] = 0u;
  *(_QWORD *)&self->_anon_421[163] = 0x3D4CCCCD3E31D0D4;
  *(_DWORD *)&self->_anon_421[171] = 0;
  *(float *)&self->_anon_421[175] = v32;
  *(float *)&self->_anon_421[179] = (float)((float)(-1.0 / v30) * v32) - v32;
  *(float *)&self->_anon_421[183] = v30;
  *(_QWORD *)&self->_anon_421[195] = 0;
  *(_QWORD *)&self->_anon_421[187] = 0;
  *(_DWORD *)&self->_anon_421[203] = 0;
}

- (id)getUniformsBufferForFrameBufferIndex:(unint64_t)a3 pContents:(NUNICalliopeRenderUniforms *)a4 pOffset:(unint64_t *)a5
{
  $3606551850D16BDB739FEE492AA18E84 *v9;
  uint64_t current;
  int v11;
  int *p_capacity;
  int capacity;
  MTLBuffer *v14;
  int v15;
  MTLBuffer *v16;
  uint64_t v17;
  MTLBuffer *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v9 = &self->_renderUniformsBuffersCounts[a3];
  current = v9->current;
  capacity = v9->capacity;
  p_capacity = &v9->capacity;
  v11 = capacity;
  self->_renderUniformsBuffersCounts[a3].current = current + 1;
  if ((int)current >= capacity)
  {
    if (v11 <= 10)
      v11 = 10;
    v15 = v11 + 2;
    *p_capacity = v15;
    v14 = (MTLBuffer *)-[MTLDevice newBufferWithLength:options:](self->_device, "newBufferWithLength:options:", (v15 << 8), 1);
    objc_storeStrong((id *)&self->_renderUniformsBuffers[a3], v14);
  }
  else
  {
    v14 = self->_renderUniformsBuffers[a3];
  }
  v16 = objc_retainAutorelease(v14);
  v17 = -[MTLBuffer contents](v16, "contents");
  if (v17)
  {
    *a4 = (NUNICalliopeRenderUniforms *)(v17 + (current << 8));
    *a5 = current << 8;
    v18 = v16;
  }
  else
  {
    NUNILoggingObjectForDomain(0);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[NUNICalliopeRenderer getUniformsBufferForFrameBufferIndex:pContents:pOffset:].cold.1(v19, v20, v21, v22, v23, v24, v25, v26);

    v18 = 0;
    *p_capacity = 0;
    *a4 = &self->_dummyUniforms;
    *a5 = 0;
  }

  return v18;
}

- (void)_renderOffscreenBackgroundWithRenderEncoder:(id)a3 frameBufferIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  _OWORD *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  simd_float4 v18;
  simd_float4 v19;
  simd_float4 v20;
  simd_float4 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  _OWORD *v32;
  simd_float4x4 v33;

  v31 = 0;
  v32 = 0;
  v6 = a3;
  -[NUNICalliopeRenderer getUniformsBufferForFrameBufferIndex:pContents:pOffset:](self, "getUniformsBufferForFrameBufferIndex:pContents:pOffset:", a4, &v32, &v31);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v32;
  *v32 = *(_OWORD *)&self->_baseUniforms.vsh.{?=;
  v9 = *(_OWORD *)&self->_anon_421[63];
  v11 = *(_OWORD *)&self->_anon_421[15];
  v10 = *(_OWORD *)&self->_anon_421[31];
  v8[3] = *(_OWORD *)&self->_anon_421[47];
  v8[4] = v9;
  v8[1] = v11;
  v8[2] = v10;
  v12 = *(_OWORD *)&self->_anon_421[127];
  v14 = *(_OWORD *)&self->_anon_421[79];
  v13 = *(_OWORD *)&self->_anon_421[95];
  v8[7] = *(_OWORD *)&self->_anon_421[111];
  v8[8] = v12;
  v8[5] = v14;
  v8[6] = v13;
  v15 = *(_OWORD *)&self->_anon_421[191];
  v17 = *(_OWORD *)&self->_anon_421[143];
  v16 = *(_OWORD *)&self->_anon_421[159];
  v8[11] = *(_OWORD *)&self->_anon_421[175];
  v8[12] = v15;
  v8[9] = v17;
  v8[10] = v16;
  *(double *)v18.i64 = UMFloat4x4MakeTranslate();
  v33.columns[0] = v18;
  v33.columns[1] = v19;
  v33.columns[2] = v20;
  v33.columns[3] = v21;
  *(double *)&v22 = UMMul(*(simd_float4x4 *)&self->_anon_304[220], v33);
  v8[6] = v22;
  v8[7] = v23;
  v8[8] = v24;
  v8[9] = v25;
  objc_msgSend(v6, "setVertexBuffer:offset:atIndex:", v7, v31, 1);
  -[NUNICalliopeResourceManager renderOffscreenPipelineForStarfield](self->_resourceManager, "renderOffscreenPipelineForStarfield");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLabel:", CFSTR("Καλλιόπη Starfield"));
  objc_msgSend(v6, "setRenderPipelineState:", v26);
  -[NUNICalliopeResourceManager starfieldVerticesBuffer](self->_resourceManager, "starfieldVerticesBuffer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setVertexBuffer:offset:atIndex:", v27, 0, 0);

  -[NUNICalliopeResourceManager starfieldIndicesBuffer](self->_resourceManager, "starfieldIndicesBuffer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:baseVertex:baseInstance:", 3, 384150, 0, v28, 0, 1, 0, 0);

  -[NUNICalliopeResourceManager renderOffscreenPipelineForStar](self->_resourceManager, "renderOffscreenPipelineForStar");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLabel:", CFSTR("Καλλιόπη Star"));
  objc_msgSend(v6, "setRenderPipelineState:", v29);
  -[NUNICalliopeResourceManager starVerticesBuffer](self->_resourceManager, "starVerticesBuffer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setVertexBuffer:offset:atIndex:", v30, 0, 0);

  objc_msgSend(v6, "drawPrimitives:vertexStart:vertexCount:instanceCount:baseInstance:", 4, 0, 4, 702, 0);
}

- (void)_renderSunSprite:(NUNICalliopeRenderUniforms *)a3 frameBufferIndex:(unint64_t)a4 renderEncoder:(id)a5 position:(float)a6 scale:(float)a7 opacity:
{
  float v7;
  float v8;
  id v12;
  void *v13;
  _OWORD *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  void *v24;
  NUNICalliopeRendererState *p_state;
  void *v26;
  float32x4_t v28;
  int32x4_t v35;
  float32x4_t v36;
  float32x4_t v37;
  int32x4_t v38;
  float32x4_t v39;
  simd_float4 v40;
  simd_float4 v41;
  simd_float4 v42;
  simd_float4 v43;
  simd_float4 v44;
  simd_float4 v45;
  simd_float4 v46;
  simd_float4 v47;
  __int128 v48;
  _OWORD *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  double v53;
  float v54;
  float v55;
  float v56;
  __float2 v57;
  float v58;
  float v59;
  float v60;
  void *v61;
  void *v62;
  void *v63;
  simd_float4 v64;
  simd_float4 v65;
  simd_float4 v66;
  float32x4_t v67;
  float32x4_t v68;
  uint64_t v69;
  uint64_t v70;
  simd_float4x4 v71;
  simd_float4x4 v72;
  simd_float4x4 v73;

  v8 = v7;
  v67 = *(float32x4_t *)&a6;
  v12 = a5;
  v69 = 0;
  v70 = 0;
  -[NUNICalliopeRenderer getUniformsBufferForFrameBufferIndex:pContents:pOffset:](self, "getUniformsBufferForFrameBufferIndex:pContents:pOffset:", a4, &v70, &v69);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setVertexBuffer:offset:atIndex:", v13, v69, 1);
  objc_msgSend(v12, "setFragmentBuffer:offset:atIndex:", v13, v69, 0);
  v14 = (_OWORD *)v70;
  *(_OWORD *)v70 = *(_OWORD *)&self->_baseUniforms.vsh.{?=;
  v15 = *(_OWORD *)&self->_anon_421[63];
  v17 = *(_OWORD *)&self->_anon_421[15];
  v16 = *(_OWORD *)&self->_anon_421[31];
  v14[3] = *(_OWORD *)&self->_anon_421[47];
  v14[4] = v15;
  v14[1] = v17;
  v14[2] = v16;
  v18 = *(_OWORD *)&self->_anon_421[127];
  v20 = *(_OWORD *)&self->_anon_421[79];
  v19 = *(_OWORD *)&self->_anon_421[95];
  v14[7] = *(_OWORD *)&self->_anon_421[111];
  v14[8] = v18;
  v14[5] = v20;
  v14[6] = v19;
  v21 = *(_OWORD *)&self->_anon_421[191];
  v23 = *(_OWORD *)&self->_anon_421[143];
  v22 = *(_OWORD *)&self->_anon_421[159];
  v14[11] = *(_OWORD *)&self->_anon_421[175];
  v14[12] = v21;
  v14[9] = v23;
  v14[10] = v22;
  -[NUNICalliopeResourceManager renderOffscreenPipelineForSpheroid:layer:config:](self->_resourceManager, "renderOffscreenPipelineForSpheroid:layer:config:", 14, 0, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    p_state = &self->_state;
    objc_msgSend(v12, "setLabel:", CFSTR("Καλλιόπη Sun Sprite"));
    objc_msgSend(v12, "setRenderPipelineState:", v24);
    -[NUNICalliopeResourceManager discVerticesBuffer](self->_resourceManager, "discVerticesBuffer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setVertexBuffer:offset:atIndex:", v26, 0, 0);

    *(_OWORD *)v70 = xmmword_2134DC4C0;
    _Q0 = vsubq_f32(*(float32x4_t *)&self->_anon_304[12], v67);
    v28 = v67;
    _Q1 = vmulq_f32(_Q0, _Q0);
    _S2 = _Q0.i32[2];
    __asm { FMLA            S1, S2, V0.S[2] }
    _Q1.f32[0] = sqrtf(_Q1.f32[0]);
    v35 = (int32x4_t)vdivq_f32(_Q0, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q1.f32, 0));
    v36 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v35, v35), (int8x16_t)v35, 0xCuLL);
    v37 = (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v35, (int8x16_t)v35, 0xCuLL), (int8x16_t)v35, 8uLL);
    v38 = (int32x4_t)vmlaq_f32(vmulq_f32(v37, vnegq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(*(int32x4_t *)&p_state[3].viewport.height, *(int32x4_t *)&p_state[3].viewport.height), *(int8x16_t *)&p_state[3].viewport.height, 0xCuLL))), v36, (float32x4_t)vextq_s8(vextq_s8(*(int8x16_t *)&p_state[3].viewport.height, *(int8x16_t *)&p_state[3].viewport.height, 0xCuLL), *(int8x16_t *)&p_state[3].viewport.height, 8uLL));
    v39 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(vextq_s8((int8x16_t)v38, (int8x16_t)v38, 0xCuLL), (int8x16_t)v38, 8uLL), vnegq_f32(v36)), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v38, v38), (int8x16_t)v38, 0xCuLL), v37);
    v38.i32[3] = 0;
    v39.i32[3] = 0;
    v65 = (simd_float4)v39;
    v66 = (simd_float4)v38;
    v35.i32[3] = 0;
    v64 = (simd_float4)v35;
    v28.i32[3] = 1.0;
    v68 = v28;
    UMFloat4x4MakeScale(a7 + a7);
    v72.columns[0] = v40;
    v72.columns[1] = v41;
    v72.columns[2] = v42;
    v72.columns[3] = v43;
    v71.columns[1] = v65;
    v71.columns[0] = v66;
    v71.columns[2] = v64;
    v71.columns[3] = (simd_float4)v68;
    *(double *)v44.i64 = UMMul(v71, v72);
    v73.columns[0] = v44;
    v73.columns[1] = v45;
    v73.columns[2] = v46;
    v73.columns[3] = v47;
    *(double *)&v48 = UMMul(*(simd_float4x4 *)&self->_anon_304[220], v73);
    v49 = (_OWORD *)v70;
    *(_OWORD *)(v70 + 96) = v48;
    v49[7] = v50;
    v49[8] = v51;
    v49[9] = v52;
    v53 = UMMul(*(float32x4_t *)&self->_anon_304[220], *(float32x4_t *)&self->_anon_304[236], *(float32x4_t *)&self->_anon_304[252], *(float32x4_t *)&self->_anon_304[268], v68);
    v55 = *(float *)&v53 / v54;
    v56 = *((float *)&v53 + 1) / v54;
    v57 = __sincosf_stret(self->_state.cameraRoll);
    v58 = (float)(v56 * v57.__cosval) - (float)(v57.__sinval * v55);
    v59 = fminf(fmaxf((float)(v58 + -0.8) * 10.0, 0.0), 1.0);
    v60 = (float)(1.0 - fabsf((float)(v55 * v57.__cosval) - (float)(v57.__sinval * v56)))
        * fminf(fmaxf((float)(v58 + -0.3) * 5.0, 0.0), 1.0);
    if (v59 > v60)
      v60 = v59;
    *(float *)(v70 + 160) = (float)((float)(v60 * -0.8) + 1.0) * v8;
    -[NUNICalliopeTextureGroup gradients](self->_textureGroup, "gradients", *(_OWORD *)&v64, *(_OWORD *)&v65, *(_OWORD *)&v66);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "objectAtIndexedSubscript:", 14);
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v62, "atlas");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "bind:slot:", v12, 5);

    objc_msgSend(v12, "drawPrimitives:vertexStart:vertexCount:", 4, 0, 16);
  }

}

- (void)_renderSaturnRings:(double)a3 frameBufferIndex:(__n128)a4 renderEncoder:(__n128)a5 forwardAngle:(__n128)a6 position:(__n128)a7 isRotated:(float)a8 rotationMatrix:(float)a9 scale:(uint64_t)a10 equatorRotation:(_OWORD *)a11
{
  id v21;
  void *v22;
  _OWORD *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  void *v33;
  simd_float4x4 v34;
  simd_float4 v35;
  simd_float4 v36;
  simd_float4 v37;
  simd_float4 v38;
  simd_float4 v39;
  simd_float4 v40;
  simd_float4 v41;
  simd_float4 v42;
  simd_float4 v43;
  simd_float4 v44;
  simd_float4 v45;
  simd_float4 v46;
  simd_float4 v47;
  simd_float4 v48;
  simd_float4 v49;
  simd_float4 v50;
  _OWORD *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  int64x2_t v56;
  int64x2_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  _BYTE v62[64];
  simd_float4 v63;
  simd_float4 v64;
  simd_float4 v65;
  simd_float4 v66;
  simd_float4 v67;
  simd_float4 v68;
  simd_float4 v69;
  simd_float4 v70;
  uint64_t v71;
  uint64_t v72;
  simd_float4x4 v73;
  simd_float4x4 v74;
  simd_float4x4 v75;
  simd_float4x4 v76;
  simd_float4x4 v77;

  *(__n128 *)&v62[32] = a6;
  *(__n128 *)&v62[48] = a7;
  *(__n128 *)v62 = a4;
  *(__n128 *)&v62[16] = a5;
  v21 = a13;
  v71 = 0;
  v72 = 0;
  objc_msgSend((id)a1, "getUniformsBufferForFrameBufferIndex:pContents:pOffset:", a12, &v72, &v71);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setVertexBuffer:offset:atIndex:", v22, v71, 1);
  objc_msgSend(v21, "setFragmentBuffer:offset:atIndex:", v22, v71, 0);
  v23 = (_OWORD *)v72;
  *(_OWORD *)v72 = *a11;
  v24 = a11[4];
  v26 = a11[1];
  v25 = a11[2];
  v23[3] = a11[3];
  v23[4] = v24;
  v23[1] = v26;
  v23[2] = v25;
  v27 = a11[8];
  v29 = a11[5];
  v28 = a11[6];
  v23[7] = a11[7];
  v23[8] = v27;
  v23[5] = v29;
  v23[6] = v28;
  v30 = a11[12];
  v32 = a11[9];
  v31 = a11[10];
  v23[11] = a11[11];
  v23[12] = v30;
  v23[9] = v32;
  v23[10] = v31;
  objc_msgSend(*(id *)(a1 + 48), "renderOffscreenPipelineForSaturnRing");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    objc_msgSend(v21, "setRenderPipelineState:", v33);
    UMFloat4x4MakeScale(a8 * 1.2275);
    if (a14)
    {
      *(double *)v35.i64 = UMMul(v34, *(simd_float4x4 *)v62);
      v67 = v36;
      v69 = v35;
      v63 = v38;
      v65 = v37;
      a2 = a2 - a9;
    }
    else
    {
      v67 = v34.columns[1];
      v69 = v34.columns[0];
      v63 = v34.columns[3];
      v65 = v34.columns[2];
    }
    *(double *)v39.i64 = UMFloat4x4MakeRotateZ(a2);
    v75.columns[0] = v39;
    v75.columns[1] = v40;
    v75.columns[2] = v41;
    v75.columns[3] = v42;
    v73.columns[1] = v67;
    v73.columns[0] = v69;
    v73.columns[3] = v63;
    v73.columns[2] = v65;
    *(double *)v43.i64 = UMMul(v73, v75);
    v68 = v44;
    v70 = v43;
    v64 = v46;
    v66 = v45;
    *(double *)v74.columns[0].i64 = UMFloat4x4MakeTranslate();
    v76.columns[1] = v68;
    v76.columns[0] = v70;
    v76.columns[3] = v64;
    v76.columns[2] = v66;
    *(double *)v47.i64 = UMMul(v74, v76);
    v77.columns[0] = v47;
    v77.columns[1] = v48;
    v77.columns[2] = v49;
    v77.columns[3] = v50;
    v51 = (_OWORD *)v72;
    *(double *)&v52 = UMMul(*(simd_float4x4 *)(a1 + 992), v77);
    v51[6] = v52;
    v51[7] = v53;
    v51[8] = v54;
    v51[9] = v55;
    *(double *)v56.i64 = UMFloat4x4MakeRotateZ(a2);
    *(int64x2_t *)(v72 + 32) = vzip1q_s64(v56, v57);
    objc_msgSend(v21, "setCullMode:", 0);
    objc_msgSend(*(id *)(a1 + 48), "saturnRingVerticesBuffer");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setVertexBuffer:offset:atIndex:", v58, 0, 0);

    objc_msgSend(*(id *)(a1 + 56), "gradients");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "objectAtIndexedSubscript:", 7);
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v60, "atlas");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "bind:slot:", v21, 1);

    objc_msgSend(v21, "drawPrimitives:vertexStart:vertexCount:", 4, 0, 26);
  }

}

- (void)_renderPatchSpheroid:(const NUNISpheroidStructure *)a3 frustumCullingState:(id *)a4 drawableSize:frameBufferIndex:renderEncoder:
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  unint64_t type;
  float v28;
  _BOOL8 v29;
  void *v30;
  float equatorRotation;
  float v32;
  float v33;
  simd_float4 v34;
  simd_float4 v35;
  simd_float4 v36;
  simd_float4 v37;
  __float2 v38;
  __float2 v39;
  float32x4_t v40;
  simd_quatf v41;
  float32x4_t v42;
  simd_float4 v43;
  simd_float4 v44;
  simd_float4 v45;
  simd_float4 v46;
  float32x4_t v50;
  float v51;
  float v52;
  float v56;
  simd_float4 v57;
  simd_float4 v58;
  simd_float4 v59;
  simd_float4 v60;
  simd_float4x4 v61;
  simd_float4 v62;
  simd_float4 v63;
  simd_float4 v64;
  simd_float4 v65;
  simd_float4 v66;
  simd_float4 v67;
  simd_float4 v68;
  simd_float4 v69;
  int32x4_t v70;
  int32x4_t v71;
  int32x4_t v72;
  int32x4_t v73;
  float32x4_t v74;
  float32x4_t v75;
  float32x4_t v76;
  float32x4_t v77;
  float32x4_t v78;
  float32x4_t v79;
  simd_float4 v80;
  simd_float4 v81;
  simd_float4 v82;
  simd_float4 v83;
  _OWORD *v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  float32x4_t v89;
  float32x4_t v90;
  float32x4_t *v91;
  float32x4_t v92;
  float v93;
  float32x4_t v94;
  double v95;
  double v96;
  int v97;
  float32x4_t v98;
  float32x4_t v99;
  float32x4_t v100;
  double v101;
  double v102;
  double v103;
  void *v104;
  float32x4_t v105;
  __int128 v106;
  float32x2_t v107;
  float32x2_t v108;
  double v109;
  unint64_t v110;
  int32x2_t v111;
  float32x2_t v112;
  const $8EF4127CF77ECA3DDB612FCF233DC3A8 *v113;
  int v114;
  int v115;
  uint64_t v116;
  float32x4_t v117;
  float32x4_t v118;
  unint64_t v119;
  uint64_t v120;
  float32x4_t v121;
  BOOL v123;
  const $8EF4127CF77ECA3DDB612FCF233DC3A8 *v124;
  uint64_t v125;
  char *v126;
  int v127;
  BOOL v128;
  uint64_t v129;
  uint64_t i;
  NUNICalliopeResourceManager *resourceManager;
  void *v132;
  id *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  _OWORD *v142;
  _OWORD *v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  uint64_t v153;
  void *v154;
  simd_float4x4 v155;
  simd_float4x4 v156;
  simd_float4 v157;
  simd_float4 v158;
  simd_float4 v159;
  simd_float4 v160;
  simd_float4 v161;
  simd_float4 v162;
  simd_float4 v163;
  simd_float4 v164;
  _OWORD *v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  NUNICalliopeResourceManager *v174;
  void *v175;
  uint64_t v176;
  void *v177;
  void *v178;
  _OWORD *v179;
  _OWORD *v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  uint64_t v190;
  void *v191;
  float32x2_t v193;
  float32x2_t v194;
  float32x2_t v195;
  uint64_t v196;
  float32x2_t v197;
  float32x2_t v198;
  float32x2_t v199;
  float32x2_t v200;
  float32x2_t v201;
  float32x2_t v202;
  float32x2_t v203;
  float32x2_t v204;
  float32x2_t v205;
  float32x4_t v206;
  float32x4_t v207;
  float32x4_t v208;
  float32x4_t v209;
  float cameraRoll;
  __float2 v211;
  int32x4_t v212;
  int32x4_t v213;
  int32x4_t v214;
  int32x4_t v215;
  int32x4_t v216;
  int32x4_t v217;
  int32x4_t v218;
  int32x4_t v219;
  float32x4_t v220;
  float32x4_t v221;
  float32x4_t v222;
  float32x4_t v223;
  double v224;
  double v225;
  double v226;
  float32x4_t v227;
  void *v228;
  simd_float4 v229;
  simd_float4 v230;
  simd_float4 v231;
  simd_float4 v232;
  const NUNISpheroidStructure *v233;
  double v234;
  simd_float4x4 v235;
  float32x4_t v236;
  unsigned int v237;
  uint64_t v238;
  void *v239;
  void *v240;
  float32x4_t v241;
  float32x4_t v242;
  float32x4_t v243;
  simd_float4x4 v244;
  float32x4_t v245;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v246;
  float32x4_t v247;
  float32x4_t v248;
  __int128 v249;
  uint64_t v250;
  float32x2_t v251;
  __int128 v252;
  simd_float4x4 v253;
  uint64_t v254;
  uint64_t v255;
  _QWORD v256[4];
  _QWORD v257[5];
  simd_float4x4 v258;
  simd_float4x4 v259;
  simd_float4x4 v260;
  simd_float4x4 v261;
  simd_float4x4 v262;
  simd_float4x4 v263;

  v7 = v4;
  *(_QWORD *)&v249 = v6;
  v246 = a4;
  v257[3] = *MEMORY[0x24BDAC8D0];
  v10 = v5;
  v254 = 0;
  v255 = 0;
  -[NUNICalliopeRenderer getUniformsBufferForFrameBufferIndex:pContents:pOffset:](self, "getUniformsBufferForFrameBufferIndex:pContents:pOffset:", v7, &v255, &v254);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v255;
  *(_OWORD *)v255 = *(_OWORD *)&self->_baseUniforms.vsh.{?=;
  v13 = *(_OWORD *)&self->_anon_421[63];
  v15 = *(_OWORD *)&self->_anon_421[15];
  v14 = *(_OWORD *)&self->_anon_421[31];
  *(_OWORD *)(v12 + 48) = *(_OWORD *)&self->_anon_421[47];
  *(_OWORD *)(v12 + 64) = v13;
  *(_OWORD *)(v12 + 16) = v15;
  *(_OWORD *)(v12 + 32) = v14;
  v16 = *(_OWORD *)&self->_anon_421[127];
  v18 = *(_OWORD *)&self->_anon_421[79];
  v17 = *(_OWORD *)&self->_anon_421[95];
  *(_OWORD *)(v12 + 112) = *(_OWORD *)&self->_anon_421[111];
  *(_OWORD *)(v12 + 128) = v16;
  *(_OWORD *)(v12 + 80) = v18;
  *(_OWORD *)(v12 + 96) = v17;
  v19 = *(_OWORD *)&self->_anon_421[191];
  v21 = *(_OWORD *)&self->_anon_421[143];
  v20 = *(_OWORD *)&self->_anon_421[159];
  *(_OWORD *)(v12 + 176) = *(_OWORD *)&self->_anon_421[175];
  *(_OWORD *)(v12 + 192) = v19;
  *(_OWORD *)(v12 + 144) = v21;
  *(_OWORD *)(v12 + 160) = v20;
  type = a3->type;
  if (a3->type == 3)
  {
    _H0 = *(_WORD *)&self->_anon_5c6[47];
    __asm { FCVT            S0, H0 }
    v28 = a3[1].equatorRotation * _S0;
    *(float *)(v12 + 188) = v28;
    v29 = v28 > 0.00001;
    v247.i32[0] = v28 > 0.00001;
  }
  else
  {
    v29 = 0;
    v247.i32[0] = 0;
  }
  -[NUNICalliopeResourceManager renderOffscreenPipelineForSpheroid:layer:config:](self->_resourceManager, "renderOffscreenPipelineForSpheroid:layer:config:", type, 0, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    objc_msgSend(v10, "pushDebugGroup:", CFSTR("Spheroid"));
    *(float *)(v255 + 160) = a3[1].angle;
    equatorRotation = a3->equatorRotation;
    v32 = a3[2].equatorRotation * a3[2].opacity;
    v33 = v32 * 0.98;
    UMFloat4x4MakeScale(v33);
    v253.columns[0] = v34;
    v253.columns[1] = v35;
    v253.columns[2] = v36;
    v253.columns[3] = v37;
    v245 = *(float32x4_t *)&a3[3].type;
    v242 = *(float32x4_t *)&self->_anon_304[12];
    v244.columns[2].i32[0] = *(_QWORD *)&a3[3].angle;
    v38 = __sincosf_stret(COERCE_FLOAT(HIDWORD(*(_QWORD *)&a3[3].angle)));
    v248.i32[0] = LODWORD(v38.__cosval);
    v244.columns[3].i32[0] = *(_QWORD *)&v38;
    v39 = __sincosf_stret(v244.columns[2].f32[0]);
    *(float32x2_t *)v40.f32 = vmul_n_f32((float32x2_t)__PAIR64__(LODWORD(v39.__sinval), LODWORD(v39.__cosval)), v244.columns[3].f32[0]);
    v40.i32[2] = v248.i32[0];
    v41 = *(simd_quatf *)&a3[1].type;
    v42 = vmulq_f32((float32x4_t)v41, (float32x4_t)v41);
    v248.f32[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v42, 2), vaddq_f32(v42, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v42.f32, 1))).f32[0];
    v241 = v40;
    if (v248.f32[0] <= 0.00001)
    {
      v244.columns[3] = 0u;
      if (equatorRotation == 0.0)
      {
        v237 = 0;
        memset(&v244, 0, 48);
        v248 = v40;
LABEL_20:
        v234 = *(double *)v245.i64;
        *(double *)v258.columns[0].i64 = UMFloat4x4MakeTranslate();
        v231 = v258.columns[1];
        v232 = v258.columns[0];
        v229 = v258.columns[3];
        v230 = v258.columns[2];
        *(double *)v80.i64 = UMMul(v258, v253);
        v262.columns[0] = v80;
        v262.columns[1] = v81;
        v262.columns[2] = v82;
        v262.columns[3] = v83;
        v253.columns[0] = v80;
        v253.columns[1] = v81;
        v253.columns[2] = v82;
        v253.columns[3] = v83;
        v84 = (_OWORD *)v255;
        *(double *)&v85 = UMMul(*(simd_float4x4 *)&self->_anon_304[220], v262);
        v84[6] = v85;
        v84[7] = v86;
        v84[8] = v87;
        v84[9] = v88;
        v259 = __invert_f4(v253);
        v89 = v242;
        v89.i32[3] = 1.0;
        v235 = v259;
        v243 = v89;
        *(double *)v90.i64 = UMMul((float32x4_t)v259.columns[0], (float32x4_t)v259.columns[1], (float32x4_t)v259.columns[2], (float32x4_t)v259.columns[3], v89);
        v91 = (float32x4_t *)v255;
        *(float32x4_t *)v255 = v248;
        v91[1] = v90;
        v238 = v7;
        v236 = v90;
        if (type == 3)
        {
          v92 = vmulq_f32(v241, *(float32x4_t *)&self->_anon_304[76]);
          v93 = 0.0;
          if (vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v92, 2), vaddq_f32(v92, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v92.f32, 1))).f32[0] > 0.0)
          {
            v94.i64[0] = 0x4000000040000000;
            v94.i64[1] = 0x4000000040000000;
            v248.i64[0] = vmlaq_f32(*(float32x4_t *)&a3[3].type, v94, v241).u64[0];
            objc_msgSend(v10, "setLabel:", CFSTR("Καλλιόπη Cinematic Sun"));
            *(float *)&v95 = a3[1].angle;
            LODWORD(v96) = 1033476506;
            -[NUNICalliopeRenderer _renderSunSprite:frameBufferIndex:renderEncoder:position:scale:opacity:](self, "_renderSunSprite:frameBufferIndex:renderEncoder:position:scale:opacity:", v255, v7, v10, *(double *)v248.i64, v96, v95);
          }
          v97 = 0;
        }
        else if (type == 7)
        {
          if (fabsf(v248.f32[2]) < 0.05)
          {
            v98 = v248;
            v98.i32[2] = 1028443341;
            v99 = vmulq_f32(v248, v248);
            v99.f32[0] = sqrtf(vmlas_n_f32(v99.f32[1], v248.f32[0], v248.f32[0]) + 0.0025);
            *v91 = vdivq_f32(v98, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v99.f32, 0));
          }
          v100 = *(float32x4_t *)&self->_anon_304[76];
          if (vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v100, v100)) <= 0.1)
            v93 = 3.1416;
          else
            v93 = atan2f(v100.f32[0], v100.f32[1]);
          objc_msgSend(v10, "setLabel:", CFSTR("Καλλιόπη Saturn Ring Back"));
          *(float *)&v101 = v93;
          *(float *)&v102 = v32 * 0.98;
          *(float *)&v103 = equatorRotation;
          -[NUNICalliopeRenderer _renderSaturnRings:frameBufferIndex:renderEncoder:forwardAngle:position:isRotated:rotationMatrix:scale:equatorRotation:](self, "_renderSaturnRings:frameBufferIndex:renderEncoder:forwardAngle:position:isRotated:rotationMatrix:scale:equatorRotation:", v255, v7, v10, v237, v101, *(double *)v245.i64, *(double *)v244.columns[0].i64, *(double *)v244.columns[1].i64, *(double *)v244.columns[2].i64, *(double *)v244.columns[3].i64, v102, v103);
          v97 = 1;
        }
        else
        {
          v97 = 0;
          v93 = 0.0;
        }
        objc_msgSend(v10, "setLabel:", CFSTR("Καλλιόπη Patch Surface"));
        objc_msgSend(v10, "setRenderPipelineState:", v30);
        objc_msgSend(v10, "setCullMode:", 2);
        -[NUNICalliopeResourceManager patchVerticesBuffer](self->_resourceManager, "patchVerticesBuffer");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setVertexBuffer:offset:atIndex:", v104, 0, 0);

        objc_msgSend(v10, "setVertexBuffer:offset:atIndex:", v11, v254, 1);
        objc_msgSend(v10, "setFragmentBuffer:offset:atIndex:", v11, v254, 0);
        DWORD2(v252) = 0;
        *(_QWORD *)&v252 = 0;
        v105 = v245;
        v105.i32[3] = 1.0;
        v245 = v105;
        *(double *)&v106 = UMMul(*(float32x4_t *)&self->_anon_304[156], *(float32x4_t *)&self->_anon_304[172], *(float32x4_t *)&self->_anon_304[188], *(float32x4_t *)&self->_anon_304[204], v105);
        v252 = v106;
        _NUNICalliopeRenderer_ComputeProjectedSpheroid(self->_state.fovY);
        v251 = vmul_f32(vsqrt_f32(vmla_f32(vmul_f32(v107, v107), v108, v108)), (float32x2_t)vdup_n_s32(0x3E4CCCCDu));
        -[NUNICalliopeRenderer _updateTextureLODsForPatchSpheroid:uvRate:drawableSize:](self, "_updateTextureLODsForPatchSpheroid:uvRate:drawableSize:", type, &v251, *(double *)&v249);
        *(float *)&v109 = v32 * 0.98;
        v110 = -[NUNICalliopeRenderer _computePatchSpheroidLodWithPositionInViewSpace:radius:drawableSize:](self, "_computePatchSpheroidLodWithPositionInViewSpace:radius:drawableSize:", &v252, v109, *(double *)&v249);
        v233 = a3;
        if (type == 3)
        {
          v112 = (float32x2_t)0x3D4CCCCD3E31D0D4;
        }
        else
        {
          *(float *)v111.i32 = 2.0
                             / (float)((float)(fminf(*(float *)&v249, *((float *)&v249 + 1)) * v33)
                                     / fabsf(*((float *)&v252 + 2)));
          v112 = vadd_f32(vminnm_f32((float32x2_t)vdup_lane_s32(v111, 0), (float32x2_t)0x3E051EB83DCCCCCDLL), (float32x2_t)0x3CA3D70A3E31D0D4);
        }
        *(float32x2_t *)(v255 + 164) = v112;
        -[NUNICalliopeResourceManager patchIndicesBufferForLod:](self->_resourceManager, "patchIndicesBufferForLod:", v110);
        *(_QWORD *)&v249 = objc_claimAutoreleasedReturnValue();
        v248.i64[0] = -[NUNICalliopeResourceManager patchIndexCountForLod:](self->_resourceManager, "patchIndexCountForLod:", v110);
        -[NUNICalliopeRenderer prepareObjectSpaceFrustumWithTransform:withState:](self, "prepareObjectSpaceFrustumWithTransform:withState:", &v253, v246);
        v113 = -[NUNICalliopeResourceManager patchBoundingBoxForSpheroid](self->_resourceManager, "patchBoundingBoxForSpheroid");
        v114 = -[NUNICalliopeRenderer classifyObjectBoundingBoxVersusFrustum:max:withState:](self, "classifyObjectBoundingBoxVersusFrustum:max:withState:", v113, (char *)v113 + 16, v246);
        v239 = v30;
        v240 = v11;
        if (v114)
        {
          v115 = v114;
          v116 = 0;
          v117 = vmlaq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v235.columns[0], COERCE_FLOAT(*(_OWORD *)&self->_anon_304[76])), (float32x4_t)v235.columns[1], *(float32x2_t *)&self->_anon_304[76], 1), (float32x4_t)v235.columns[2], *(float32x4_t *)&self->_anon_304[76], 2), (float32x4_t)0, (float32x4_t)v235.columns[3]);
          do
          {
            v118 = vmulq_f32(v117, _renderPatchSpheroid_frustumCullingState_drawableSize_frameBufferIndex_renderEncoder__basisVectors[v116]);
            *((_BYTE *)v256 + v116++) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v118, 2), vaddq_f32(v118, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v118.f32, 1))).f32[0] < 0.0;
          }
          while (v116 != 26);
          v119 = type;
          v120 = 0;
          v117.i32[0] = 1.0;
          do
          {
            v121 = vmulq_f32(v236, _renderPatchSpheroid_frustumCullingState_drawableSize_frameBufferIndex_renderEncoder__basisVectors[v120]);
            v123 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v121, 2), vaddq_f32(v121, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v121.f32, 1))).f32[0] > 1.0&& *((_BYTE *)v256 + v120) != 0;
            *((_BYTE *)v256 + v120++) = v123;
          }
          while (v120 != 26);
          v124 = -[NUNICalliopeResourceManager patchBoundingBoxes](self->_resourceManager, "patchBoundingBoxes", *(double *)v117.i64);
          v125 = 0;
          v126 = &byte_2134DC7E3;
          do
          {
            v127 = *((unsigned __int8 *)v256 + *(v126 - 2)) | *((unsigned __int8 *)v256
                                                                               + *(v126 - 3)) | *((unsigned __int8 *)v256 + *(v126 - 1)) | *((unsigned __int8 *)v256 + *v126);
            v128 = v127 != 0;
            if (v115 == 2 && v127)
              v128 = -[NUNICalliopeRenderer isObjectBoundingBoxInsideOrIntersectingFrustum:max:withState:](self, "isObjectBoundingBoxInsideOrIntersectingFrustum:max:withState:", v124, (char *)v124 + 16, v246);
            v126 += 4;
            *((_BYTE *)v257 + v125++) = v128;
            v124 = (const $8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v124 + 32);
          }
          while (v125 != 24);
        }
        else
        {
          v119 = type;
          memset(v257, 0, 24);
        }
        v129 = 0;
        for (i = 0; i != 24; ++i)
        {
          if (*((_BYTE *)v257 + i))
          {
            resourceManager = self->_resourceManager;
            -[NUNIRenderer textureSuffix](self, "textureSuffix");
            v132 = (void *)objc_claimAutoreleasedReturnValue();
            v133 = -[NUNICalliopeResourceManager patchTextureGroupForSpheroid:index:suffix:](resourceManager, "patchTextureGroupForSpheroid:index:suffix:", v119, i, v132);

            objc_msgSend(*v133, "atlas");
            v134 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v134, "bind:slot:", v10, 1);

            objc_msgSend(v133[1], "atlas");
            v135 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v135, "bind:slot:", v10, 2);

            objc_msgSend(v133[2], "atlas");
            v136 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v136, "bind:slot:", v10, 3);

            if (v247.i32[0])
            {
              objc_msgSend(v133[3], "atlas");
              v137 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v137, "bind:slot:", v10, 4);

            }
            if (v97)
            {
              -[NUNICalliopeTextureGroup gradients](self->_textureGroup, "gradients");
              v138 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v138, "objectAtIndexedSubscript:", 7);
              v139 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v139, "atlas");
              v140 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v140, "bind:slot:", v10, 5);

            }
            objc_msgSend(v10, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:baseVertex:baseInstance:", 3, v248.i64[0], 0, (_QWORD)v249, 0, 1, v129, 0);
          }
          v129 += 289;
        }
        if (v119 == 3)
        {
          if (v247.i32[0])
          {
            v256[0] = 0;
            v250 = 0;
            -[NUNICalliopeRenderer getUniformsBufferForFrameBufferIndex:pContents:pOffset:](self, "getUniformsBufferForFrameBufferIndex:pContents:pOffset:", v238, v256, &v250);
            v141 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setVertexBuffer:offset:atIndex:", v141, v250, 1);
            objc_msgSend(v10, "setFragmentBuffer:offset:atIndex:", v141, v250, 0);
            v143 = (_OWORD *)v255;
            v142 = (_OWORD *)v256[0];
            *(_OWORD *)v256[0] = *(_OWORD *)v255;
            v144 = v143[4];
            v146 = v143[1];
            v145 = v143[2];
            v142[3] = v143[3];
            v142[4] = v144;
            v142[1] = v146;
            v142[2] = v145;
            v147 = v143[8];
            v149 = v143[5];
            v148 = v143[6];
            v142[7] = v143[7];
            v142[8] = v147;
            v142[5] = v149;
            v142[6] = v148;
            v150 = v143[12];
            v152 = v143[9];
            v151 = v143[10];
            v142[11] = v143[11];
            v142[12] = v150;
            v142[9] = v152;
            v142[10] = v151;
            -[NUNICalliopeResourceManager renderOffscreenPipelineForSpheroid:layer:config:](self->_resourceManager, "renderOffscreenPipelineForSpheroid:layer:config:", 3, 1, v29);
            v153 = objc_claimAutoreleasedReturnValue();
            if (!v153)
            {

              v11 = v240;
              goto LABEL_81;
            }
            v154 = (void *)v153;
            objc_msgSend(v10, "setLabel:", CFSTR("Καλλιόπη Patch Homosphere"));
            objc_msgSend(v10, "setRenderPipelineState:", v154);
            UMFloat4x4MakeScale(v32);
            v156 = v155;
            v253 = v155;
            if (v237)
            {
              *(double *)v157.i64 = UMMul(v155, v244);
              v156.columns[0] = v157;
              v156.columns[1] = v158;
              v156.columns[2] = v159;
              v156.columns[3] = v160;
              v253.columns[0] = v157;
              v253.columns[1] = v158;
              v253.columns[2] = v159;
              v253.columns[3] = v160;
            }
            v260.columns[1] = v231;
            v260.columns[0] = v232;
            v260.columns[3] = v229;
            v260.columns[2] = v230;
            *(double *)v161.i64 = UMMul(v260, v156);
            v263.columns[0] = v161;
            v263.columns[1] = v162;
            v263.columns[2] = v163;
            v263.columns[3] = v164;
            v253.columns[0] = v161;
            v253.columns[1] = v162;
            v253.columns[2] = v163;
            v253.columns[3] = v164;
            v165 = (_OWORD *)v256[0];
            *(double *)&v166 = UMMul(*(simd_float4x4 *)&self->_anon_304[220], v263);
            v165[6] = v166;
            v165[7] = v167;
            v165[8] = v168;
            v165[9] = v169;
            v261 = __invert_f4(v253);
            *(double *)&v170 = UMMul((float32x4_t)v261.columns[0], (float32x4_t)v261.columns[1], (float32x4_t)v261.columns[2], (float32x4_t)v261.columns[3], v243);
            v171 = 0;
            v172 = 0;
            v173 = v256[0];
            *(_OWORD *)(v256[0] + 16) = v170;
            *(_DWORD *)(v173 + 164) = 1046807559;
            do
            {
              if (*((_BYTE *)v257 + v172))
              {
                v174 = self->_resourceManager;
                -[NUNIRenderer textureSuffix](self, "textureSuffix");
                v175 = (void *)objc_claimAutoreleasedReturnValue();
                v176 = -[NUNICalliopeResourceManager patchTextureGroupForSpheroid:index:suffix:](v174, "patchTextureGroupForSpheroid:index:suffix:", 3, v172, v175);

                objc_msgSend(*(id *)(v176 + 24), "atlas");
                v177 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v177, "bind:slot:", v10, 4);

                objc_msgSend(v10, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:baseVertex:baseInstance:", 3, v248.i64[0], 0, (_QWORD)v249, 0, 1, v171, 0);
              }
              ++v172;
              v171 += 289;
            }
            while (v172 != 24);

          }
          v256[0] = 0;
          v250 = 0;
          -[NUNICalliopeRenderer getUniformsBufferForFrameBufferIndex:pContents:pOffset:](self, "getUniformsBufferForFrameBufferIndex:pContents:pOffset:", v238, v256, &v250);
          v178 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setVertexBuffer:offset:atIndex:", v178, v250, 1);
          objc_msgSend(v10, "setFragmentBuffer:offset:atIndex:", v178, v250, 0);
          v180 = (_OWORD *)v255;
          v179 = (_OWORD *)v256[0];
          *(_OWORD *)v256[0] = *(_OWORD *)v255;
          v181 = v180[4];
          v183 = v180[1];
          v182 = v180[2];
          v179[3] = v180[3];
          v179[4] = v181;
          v179[1] = v183;
          v179[2] = v182;
          v184 = v180[8];
          v186 = v180[5];
          v185 = v180[6];
          v179[7] = v180[7];
          v179[8] = v184;
          v179[5] = v186;
          v179[6] = v185;
          v187 = v180[12];
          v189 = v180[9];
          v188 = v180[10];
          v179[11] = v180[11];
          v179[12] = v187;
          v179[9] = v189;
          v179[10] = v188;
          -[NUNICalliopeResourceManager renderOffscreenPipelineForAtmosphere](self->_resourceManager, "renderOffscreenPipelineForAtmosphere");
          v190 = objc_claimAutoreleasedReturnValue();
          v30 = v239;
          v11 = v240;
          if (!v190)
          {

LABEL_81:
            goto LABEL_82;
          }
          v191 = (void *)v190;
          objc_msgSend(v10, "setLabel:", CFSTR("Καλλιόπη Atmosphere"));
          objc_msgSend(v10, "setRenderPipelineState:", v191);
          UMMul(*(float32x4_t *)&self->_anon_304[156], *(float32x4_t *)&self->_anon_304[172], *(float32x4_t *)&self->_anon_304[188], *(float32x4_t *)&self->_anon_304[204], v245);
          _NUNICalliopeRenderer_ComputeProjectedSpheroid(self->_state.fovY);
          __asm { FMOV            V5.2S, #1.0 }
          v193 = vdiv_f32(_D5, *(float32x2_t *)(v256[0] + 56));
          *(float32x2_t *)v256[0] = vmul_f32(vsub_f32(v194, *(float32x2_t *)(v256[0] + 48)), v193);
          v196 = v256[0];
          *(float32x2_t *)(v256[0] + 8) = vmul_f32(v195, v193);
          *(float32x2_t *)(v196 + 16) = vmul_f32(v197, v193);
          v198 = vmul_f32(v195, v195);
          v198.i32[0] = vadd_f32(v198, (float32x2_t)vdup_lane_s32((int32x2_t)v198, 1)).u32[0];
          v199 = vrsqrte_f32((float32x2_t)v198.u32[0]);
          v200 = vmul_f32(v199, vrsqrts_f32((float32x2_t)v198.u32[0], vmul_f32(v199, v199)));
          v198.i32[0] = vmul_f32(v200, vrsqrts_f32((float32x2_t)v198.u32[0], vmul_f32(v200, v200))).u32[0];
          v201 = vmul_f32(v197, v197);
          v201.i32[0] = vadd_f32(v201, (float32x2_t)vdup_lane_s32((int32x2_t)v201, 1)).u32[0];
          v202 = vmul_n_f32(v195, v198.f32[0]);
          v203 = vrsqrte_f32((float32x2_t)v201.u32[0]);
          v204 = vmul_f32(v203, vrsqrts_f32((float32x2_t)v201.u32[0], vmul_f32(v203, v203)));
          v205 = vmul_n_f32(v197, vmul_f32(v204, vrsqrts_f32((float32x2_t)v201.u32[0], vmul_f32(v204, v204))).f32[0]);
          v207 = *(float32x4_t *)&self->_anon_304[44];
          v206 = *(float32x4_t *)&self->_anon_304[60];
          v208 = vmlaq_n_f32(vmulq_lane_f32(v207, v205, 1), v206, v205.f32[0]);
          v209 = vmlaq_n_f32(vmulq_lane_f32(v207, v202, 1), v206, v202.f32[0]);
          cameraRoll = self->_state.cameraRoll;
          if (fabsf(cameraRoll) <= 0.00001)
          {
            v208.i32[3] = 1.0;
            v209.i32[3] = 1.0;
          }
          else
          {
            v247 = v208;
            v248 = v209;
            v211 = __sincosf_stret(cameraRoll * 0.5);
            *(__n64 *)v212.i8 = UMFloat4x4Make(v211.__sinval * *(float *)&self->_anon_304[76], v211.__sinval * *(float *)&self->_anon_304[80], v211.__sinval * *(float *)&self->_anon_304[84], v211.__cosval);
            v214 = vzip1q_s32(v212, v213);
            v215 = vzip2q_s32(v212, v213);
            v218 = vzip1q_s32(v216, v217);
            v219 = vzip2q_s32(v216, v217);
            v220 = (float32x4_t)vzip1q_s32(v214, v218);
            v221 = (float32x4_t)vzip2q_s32(v214, v218);
            v222 = (float32x4_t)vzip1q_s32(v215, v219);
            v223 = (float32x4_t)vzip2q_s32(v215, v219);
            v208 = vaddq_f32(v223, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v220, v247.f32[0]), v221, *(float32x2_t *)v247.f32, 1), v222, v247, 2));
            v209 = vaddq_f32(v223, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v220, v248.f32[0]), v221, *(float32x2_t *)v248.f32, 1), v222, v248, 2));
            v196 = v256[0];
          }
          *(float32x4_t *)(v196 + 32) = v209;
          *(float32x4_t *)(v196 + 48) = v208;
          *(float32x4_t *)(v196 + 64) = v241;
          v227 = vmulq_f32(v241, *(float32x4_t *)&self->_anon_304[76]);
          *(_DWORD *)(v196 + 80) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v227, 2), vaddq_f32(v227, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v227.f32, 1))).u32[0];
          *(float *)(v196 + 160) = v233[1].angle;
          objc_msgSend(v10, "setCullMode:", 0);
          -[NUNICalliopeResourceManager atmosphereRingVerticesBuffer](self->_resourceManager, "atmosphereRingVerticesBuffer");
          v228 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setVertexBuffer:offset:atIndex:", v228, 0, 0);

          objc_msgSend(v10, "drawPrimitives:vertexStart:vertexCount:", 4, 0, 50);
        }
        else
        {
          v11 = v240;
          if (v97)
          {
            objc_msgSend(v10, "setLabel:", CFSTR("Καλλιόπη Saturn Ring Front"));
            *(float *)&v224 = v93 + 3.1416;
            *(float *)&v225 = v32 * 0.98;
            *(float *)&v226 = equatorRotation;
            -[NUNICalliopeRenderer _renderSaturnRings:frameBufferIndex:renderEncoder:forwardAngle:position:isRotated:rotationMatrix:scale:equatorRotation:](self, "_renderSaturnRings:frameBufferIndex:renderEncoder:forwardAngle:position:isRotated:rotationMatrix:scale:equatorRotation:", v255, v238, v10, v237, v224, v234, *(double *)v244.columns[0].i64, *(double *)v244.columns[1].i64, *(double *)v244.columns[2].i64, *(double *)v244.columns[3].i64, v225, v226);
          }
        }
        objc_msgSend(v10, "setCullMode:", 0);
        objc_msgSend(v10, "popDebugGroup");
        goto LABEL_81;
      }
      memset(&v244, 0, 48);
    }
    else
    {
      *(__n64 *)v43.f32 = UMFloat4x4Make(v41);
      v244.columns[0] = v43;
      v244.columns[1] = v44;
      v244.columns[2] = v45;
      v244.columns[3] = v46;
      if (type != 4)
      {
        _Q0 = vaddq_f32(v245, (float32x4_t)xmmword_2134DC4D0);
        _Q1 = vmulq_f32(_Q0, _Q0);
        _S2 = _Q0.i32[2];
        __asm { FMLA            S1, S2, V0.S[2] }
        _Q1.f32[0] = sqrtf(_Q1.f32[0]);
        v50 = vnegq_f32(vdivq_f32(_Q0, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q1.f32, 0)));
        _Q1.f32[0] = fmaxf(v248.f32[0], 0.0);
        v51 = _Q1.f32[0] / 0.2;
        _NF = _Q1.f32[0] < 0.2;
        v52 = 1.0;
        if (_NF)
          v52 = v51;
        _Q2 = vmlaq_n_f32(v241, vsubq_f32(v50, v241), v52);
        _Q0 = vmulq_f32(_Q2, _Q2);
        _S1 = _Q2.i32[2];
        __asm { FMLA            S0, S1, V2.S[2] }
        _Q0.f32[0] = sqrtf(_Q0.f32[0]);
        v241 = vdivq_f32(_Q2, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q0.f32, 0));
      }
      if (equatorRotation == 0.0)
        goto LABEL_19;
    }
    v56 = 1.5708;
    if (type != 4)
      v56 = 0.0;
    *(double *)v57.i64 = UMFloat4x4MakeRotateZ(v56 + equatorRotation);
    v61.columns[0] = v57;
    v61.columns[1] = v58;
    v61.columns[2] = v59;
    v61.columns[3] = v60;
    if (v248.f32[0] > 0.00001)
    {
      *(double *)v62.i64 = UMMul(v244, v61);
      v61.columns[0] = v62;
      v61.columns[1] = v63;
      v61.columns[2] = v64;
      v61.columns[3] = v65;
    }
    v244 = v61;
LABEL_19:
    *(double *)v66.i64 = UMMul(v253, v244);
    v253.columns[0] = v66;
    v253.columns[1] = v67;
    v253.columns[2] = v68;
    v253.columns[3] = v69;
    v70 = vzip1q_s32((int32x4_t)v244.columns[0], (int32x4_t)v244.columns[2]);
    v71 = vzip2q_s32((int32x4_t)v244.columns[0], (int32x4_t)v244.columns[2]);
    v72 = vzip1q_s32((int32x4_t)v244.columns[1], (int32x4_t)v244.columns[3]);
    v73 = vzip2q_s32((int32x4_t)v244.columns[1], (int32x4_t)v244.columns[3]);
    v74 = (float32x4_t)vzip1q_s32(v70, v72);
    v75 = (float32x4_t)vzip2q_s32(v70, v72);
    v76 = (float32x4_t)vzip1q_s32(v71, v73);
    v77 = (float32x4_t)vzip2q_s32(v71, v73);
    v78 = v241;
    v78.i32[3] = 0;
    *(double *)v79.i64 = UMMul(v74, v75, v76, v77, v78);
    v248 = v79;
    v237 = 1;
    goto LABEL_20;
  }
LABEL_82:

}

- (void)_renderLocationDot:(const NUNISpheroidStructure *)a3 scene:(const NUNISceneStructure *)a4 uniPtr:(NUNICalliopeRenderUniforms *)a5 viewport:(NUNIViewport)a6 renderEncoder:(id)a7
{
  void *v12;
  NUNICalliopeRendererState *p_state;
  void *v14;
  simd_float4 v15;
  simd_float4 v16;
  simd_float4 v17;
  simd_float4 v18;
  simd_float4 v19;
  simd_float4 v20;
  simd_float4 v21;
  simd_float4 v22;
  float distance;
  simd_float4 v24;
  simd_float4 v25;
  simd_float4 v26;
  simd_float4 v27;
  simd_float4 v28;
  simd_float4 v29;
  simd_float4 v30;
  simd_float4 v31;
  simd_float4 v32;
  simd_float4 v33;
  simd_float4 v34;
  simd_float4 v35;
  simd_float4 v36;
  simd_float4 v37;
  simd_float4 v38;
  simd_float4 v39;
  float equatorRotation;
  simd_float4 v41;
  float v42;
  simd_float4 v43;
  simd_float4 v44;
  simd_float4 v45;
  simd_float4 v46;
  simd_float4 v47;
  simd_float4 v48;
  simd_float4 v49;
  simd_float4 v50;
  simd_float4 v51;
  simd_float4 v52;
  simd_float4 v53;
  simd_float4 v54;
  simd_float4 v55;
  simd_float4 v56;
  simd_float4 v57;
  float32x4_t v58;
  float32x4_t v59;
  float32x4_t v60;
  float32x4_t v61;
  int32x4_t v62;
  int32x4_t v63;
  int32x4_t v64;
  float32x2_t v65;
  float32x2_t v66;
  float32x2_t v67;
  float32x2_t v68;
  int32x2_t v69;
  float32x2_t v70;
  float v71;
  float var1;
  simd_float4 v73;
  simd_float4 v74;
  simd_float4 v75;
  simd_float4 v76;
  simd_float4 v77;
  simd_float4 v78;
  simd_float4 v79;
  simd_float4 v80;
  simd_float4 v81;
  simd_float4 v82;
  simd_float4 v83;
  simd_float4 v84;
  simd_float4 v85;
  simd_float4 v86;
  simd_float4 v87;
  simd_float4 v88;
  simd_float4 v89;
  simd_float4 v90;
  simd_float4 v91;
  simd_float4 v92;
  simd_float4x4 v93;
  simd_float4 v94;
  simd_float4 v95;
  simd_float4 v96;
  simd_float4 v97;
  simd_float4 v98;
  simd_float4 v99;
  simd_float4 v100;
  simd_float4 v101;
  float32x4_t v102;
  float32x4_t v103;
  float32x4_t v104;
  float32x4_t v105;
  void *v106;
  simd_float4 v107;
  simd_float4 v108;
  simd_float4 v109;
  simd_float4 v110;
  simd_float4 v111;
  simd_float4 v112;
  simd_float4 v113;
  simd_float4 v114;
  simd_float4 v115;
  simd_float4 v116;
  simd_float4 v117;
  simd_float4 v118;
  simd_float4 v119;
  simd_float4 v120;
  simd_float4 v121;
  simd_float4 v122;
  int32x4_t v123;
  int32x4_t v124;
  simd_float4 v125;
  simd_float4 v126;
  simd_float4 v127;
  simd_float4 v128;
  simd_float4 v129;
  simd_float4 v130;
  simd_float4 v131;
  simd_float4 v132;
  simd_float4 v133;
  simd_float4 v134;
  simd_float4 v135;
  simd_float4 v136;
  float32x4_t v137;
  simd_float4 v138;
  simd_float4 v139;
  simd_float4 v140;
  simd_float4 v141;
  float32x4_t v142;
  simd_float4 v143;
  simd_float4 v144;
  simd_float4 v145;
  simd_float4 v146;
  float32x4_t v147;
  simd_float4 v148;
  simd_float4 v149;
  simd_float4 v150;
  simd_float4 v151;
  float32x4_t v152;
  id v153;
  simd_float4x4 v154;
  simd_float4x4 v155;
  simd_float4x4 v156;
  simd_float4x4 v157;
  simd_float4x4 v158;
  simd_float4x4 v159;
  simd_float4x4 v160;
  simd_float4x4 v161;
  simd_float4x4 v162;
  simd_float4x4 v163;
  simd_float4x4 v164;
  simd_float4x4 v165;
  simd_float4x4 v166;
  simd_float4x4 v167;
  simd_float4x4 v168;
  simd_float4x4 v169;
  simd_float4x4 v170;
  simd_float4x4 v171;
  simd_float4x4 v172;
  simd_float4x4 v173;
  simd_float4x4 v174;
  simd_float4x4 v175;
  simd_float4x4 v176;
  simd_float4x4 v177;

  v153 = a7;
  -[NUNICalliopeResourceManager renderOffscreenPipelineForLocationDot](self->_resourceManager, "renderOffscreenPipelineForLocationDot");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    p_state = &self->_state;
    objc_msgSend(v153, "setLabel:", CFSTR("Καλλιόπη LocationDot"));
    objc_msgSend(v153, "setRenderPipelineState:", v12);
    -[NUNICalliopeResourceManager rectVerticesBuffer](self->_resourceManager, "rectVerticesBuffer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v153, "setVertexBuffer:offset:atIndex:", v14, 0, 0);

    UMFloat4x4MakeScale(0.11);
    v143 = v16;
    v148 = v15;
    v133 = v18;
    v138 = v17;
    *(double *)v154.columns[0].i64 = UMFloat4x4MakeTranslate();
    v117 = v154.columns[1];
    v118 = v154.columns[0];
    v115 = v154.columns[3];
    v116 = v154.columns[2];
    v166.columns[1] = v143;
    v166.columns[0] = v148;
    v166.columns[3] = v133;
    v166.columns[2] = v138;
    *(double *)v19.i64 = UMMul(v154, v166);
    v144 = v20;
    v149 = v19;
    v134 = v22;
    v139 = v21;
    distance = a3[4].distance;
    *(double *)v24.i64 = UMFloat4x4MakeRotateX(a3[4].distanceScale * -0.017453);
    v127 = v25;
    v128 = v24;
    v125 = v27;
    v126 = v26;
    *(double *)v28.i64 = UMFloat4x4MakeRotateZ(distance * 0.017453);
    v131 = v29;
    v132 = v28;
    v129 = v31;
    v130 = v30;
    v155.columns[1] = v127;
    v155.columns[0] = v128;
    v155.columns[3] = v125;
    v155.columns[2] = v126;
    v167.columns[1] = v144;
    v167.columns[0] = v149;
    v167.columns[3] = v134;
    v167.columns[2] = v139;
    *(double *)v32.i64 = UMMul(v155, v167);
    v168.columns[0] = v32;
    v168.columns[1] = v33;
    v168.columns[2] = v34;
    v168.columns[3] = v35;
    v156.columns[1] = v131;
    v156.columns[0] = v132;
    v156.columns[3] = v129;
    v156.columns[2] = v130;
    *(double *)v36.i64 = UMMul(v156, v168);
    v145 = v37;
    v150 = v36;
    v135 = v39;
    v140 = v38;
    equatorRotation = a3->equatorRotation;
    UMFloat4x4MakeScale(a3[2].equatorRotation * a3[2].opacity);
    v113 = v157.columns[1];
    v114 = v157.columns[0];
    v111 = v157.columns[3];
    v112 = v157.columns[2];
    v169.columns[1] = v145;
    v169.columns[0] = v150;
    v169.columns[3] = v135;
    v169.columns[2] = v140;
    *(double *)v41.i64 = UMMul(v157, v169);
    v42 = fabsf(equatorRotation);
    v146 = v43;
    v151 = v41;
    v136 = v45;
    v141 = v44;
    if (v42 <= 0.00001)
    {
      UMFloat4x4MakeScale(1.0);
      v109 = v51;
      v110 = v50;
      v107 = v53;
      v108 = v52;
    }
    else
    {
      *(double *)v158.columns[0].i64 = UMFloat4x4MakeRotateZ(equatorRotation);
      v109 = v158.columns[1];
      v110 = v158.columns[0];
      v107 = v158.columns[3];
      v108 = v158.columns[2];
      v170.columns[1] = v146;
      v170.columns[0] = v151;
      v170.columns[3] = v136;
      v170.columns[2] = v141;
      *(double *)v46.i64 = UMMul(v158, v170);
      v146 = v47;
      v151 = v46;
      v136 = v49;
      v141 = v48;
    }
    *(double *)v159.columns[0].i64 = UMFloat4x4MakeTranslate();
    v121 = v159.columns[1];
    v122 = v159.columns[0];
    v119 = v159.columns[3];
    v120 = v159.columns[2];
    v171.columns[1] = v146;
    v171.columns[0] = v151;
    v171.columns[3] = v136;
    v171.columns[2] = v141;
    *(double *)v54.i64 = UMMul(v159, v171);
    v172.columns[0] = v54;
    v172.columns[1] = v55;
    v172.columns[2] = v56;
    v172.columns[3] = v57;
    *(double *)v58.i64 = UMMul(*(simd_float4x4 *)&p_state[12].viewport.width, v172);
    v147 = v59;
    v152 = v58;
    v137 = v61;
    v142 = v60;
    *(double *)v62.i64 = UMMul(v58, v59, v60, v61, (float32x4_t)xmmword_2134DC4F0);
    v124 = v62;
    *(double *)v63.i64 = UMMul(v152, v147, v142, v137, (float32x4_t)xmmword_2134DC500);
    v123 = v63;
    *(double *)v64.i64 = UMMul(v152, v147, v142, v137, (float32x4_t)xmmword_2134DBE40);
    v65.f32[0] = (float)a6.width;
    v65.f32[1] = (float)a6.height;
    v66 = vmul_f32(v65, (float32x2_t)0x3F0000003F000000);
    v67 = vdiv_f32(vmul_f32(v66, *(float32x2_t *)v123.i8), (float32x2_t)vdup_laneq_s32(v123, 3));
    *(float32x2_t *)v64.i8 = vdiv_f32(vmul_f32(v66, *(float32x2_t *)v64.i8), (float32x2_t)vdup_laneq_s32(v64, 3));
    v68 = vsub_f32(vdiv_f32(vmul_f32(v66, *(float32x2_t *)v124.i8), (float32x2_t)vdup_laneq_s32(v124, 3)), *(float32x2_t *)v64.i8);
    v69 = (int32x2_t)vmul_f32(v68, v68);
    *(float32x2_t *)v64.i8 = vsub_f32(v67, *(float32x2_t *)v64.i8);
    *(float32x2_t *)v64.i8 = vmul_f32(*(float32x2_t *)v64.i8, *(float32x2_t *)v64.i8);
    v70 = vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(v69, *(int32x2_t *)v64.i8), (float32x2_t)vzip2_s32(v69, *(int32x2_t *)v64.i8)));
    if (v70.f32[0] >= v70.f32[1])
      v70.f32[0] = v70.f32[1];
    v71 = v70.f32[0] * 0.23077;
    var1 = a4[1].var8.var0.var1;
    if (v71 <= var1)
    {
      v106 = v153;
      v103 = v147;
      v102 = v152;
      v105 = v137;
      v104 = v142;
    }
    else
    {
      UMFloat4x4MakeScale((float)(var1 * 0.11) / v71);
      v173.columns[0] = v73;
      v173.columns[1] = v74;
      v173.columns[2] = v75;
      v173.columns[3] = v76;
      v160.columns[1] = v117;
      v160.columns[0] = v118;
      v160.columns[3] = v115;
      v160.columns[2] = v116;
      *(double *)v77.i64 = UMMul(v160, v173);
      v174.columns[0] = v77;
      v174.columns[1] = v78;
      v174.columns[2] = v79;
      v174.columns[3] = v80;
      v161.columns[1] = v127;
      v161.columns[0] = v128;
      v161.columns[3] = v125;
      v161.columns[2] = v126;
      *(double *)v81.i64 = UMMul(v161, v174);
      v175.columns[0] = v81;
      v175.columns[1] = v82;
      v175.columns[2] = v83;
      v175.columns[3] = v84;
      v162.columns[1] = v131;
      v162.columns[0] = v132;
      v162.columns[3] = v129;
      v162.columns[2] = v130;
      *(double *)v85.i64 = UMMul(v162, v175);
      v176.columns[0] = v85;
      v176.columns[1] = v86;
      v176.columns[2] = v87;
      v176.columns[3] = v88;
      v163.columns[1] = v113;
      v163.columns[0] = v114;
      v163.columns[3] = v111;
      v163.columns[2] = v112;
      *(double *)v89.i64 = UMMul(v163, v176);
      v93.columns[0] = v89;
      v93.columns[1] = v90;
      v93.columns[2] = v91;
      v93.columns[3] = v92;
      if (v42 > 0.00001)
      {
        v164.columns[1] = v109;
        v164.columns[0] = v110;
        v164.columns[3] = v107;
        v164.columns[2] = v108;
        *(double *)v94.i64 = UMMul(v164, v93);
        v93.columns[0] = v94;
        v93.columns[1] = v95;
        v93.columns[2] = v96;
        v93.columns[3] = v97;
      }
      v165.columns[1] = v121;
      v165.columns[0] = v122;
      v165.columns[3] = v119;
      v165.columns[2] = v120;
      *(double *)v98.i64 = UMMul(v165, v93);
      v177.columns[0] = v98;
      v177.columns[1] = v99;
      v177.columns[2] = v100;
      v177.columns[3] = v101;
      *(double *)v102.i64 = UMMul(*(simd_float4x4 *)&p_state[12].viewport.width, v177);
      v106 = v153;
    }
    *(float32x4_t *)&a5[96].vsh.{?= = v102;
    *(float32x4_t *)&a5[112].vsh.{?= = v103;
    *(float32x4_t *)&a5[128].vsh.{?= = v104;
    *(float32x4_t *)&a5[144].vsh.{?= = v105;
    objc_msgSend(v106, "setCullMode:", 1, *(_OWORD *)&v107, *(_OWORD *)&v108, *(_OWORD *)&v109, *(_OWORD *)&v110);
    objc_msgSend(v153, "drawPrimitives:vertexStart:vertexCount:", 4, 0, 4);
    objc_msgSend(v153, "setCullMode:", 0);
  }

}

- (void)_renderSpriteSpheroid:(const NUNISpheroidStructure *)a3 frameBufferIndex:(unint64_t)a4 renderEncoder:(id)a5
{
  id v8;
  void *v9;
  _OWORD *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  unint64_t type;
  void *v21;
  NUNICalliopeRendererState *p_state;
  void *v23;
  _OWORD *v24;
  float32x4_t v25;
  int32x4_t v33;
  float32x4_t v34;
  float32x4_t v35;
  int32x4_t v36;
  float32x4_t v37;
  float v38;
  simd_float4 v39;
  simd_float4 v40;
  simd_float4 v41;
  simd_float4 v42;
  simd_float4 v43;
  simd_float4 v44;
  simd_float4 v45;
  simd_float4 v46;
  __int128 v47;
  _OWORD *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  void *v52;
  void *v53;
  void *v54;
  simd_float4 v55;
  simd_float4 v56;
  simd_float4 v57;
  simd_float4 v58;
  uint64_t v59;
  _OWORD *v60;
  simd_float4x4 v61;
  simd_float4x4 v62;
  simd_float4x4 v63;

  v8 = a5;
  v59 = 0;
  v60 = 0;
  -[NUNICalliopeRenderer getUniformsBufferForFrameBufferIndex:pContents:pOffset:](self, "getUniformsBufferForFrameBufferIndex:pContents:pOffset:", a4, &v60, &v59);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setVertexBuffer:offset:atIndex:", v9, v59, 1);
  objc_msgSend(v8, "setFragmentBuffer:offset:atIndex:", v9, v59, 0);
  v10 = v60;
  *v60 = *(_OWORD *)&self->_baseUniforms.vsh.{?=;
  v11 = *(_OWORD *)&self->_anon_421[63];
  v13 = *(_OWORD *)&self->_anon_421[15];
  v12 = *(_OWORD *)&self->_anon_421[31];
  v10[3] = *(_OWORD *)&self->_anon_421[47];
  v10[4] = v11;
  v10[1] = v13;
  v10[2] = v12;
  v14 = *(_OWORD *)&self->_anon_421[127];
  v16 = *(_OWORD *)&self->_anon_421[79];
  v15 = *(_OWORD *)&self->_anon_421[95];
  v10[7] = *(_OWORD *)&self->_anon_421[111];
  v10[8] = v14;
  v10[5] = v16;
  v10[6] = v15;
  v17 = *(_OWORD *)&self->_anon_421[191];
  v19 = *(_OWORD *)&self->_anon_421[143];
  v18 = *(_OWORD *)&self->_anon_421[159];
  v10[11] = *(_OWORD *)&self->_anon_421[175];
  v10[12] = v17;
  v10[9] = v19;
  v10[10] = v18;
  type = a3->type;
  -[NUNICalliopeResourceManager renderOffscreenPipelineForSpheroid:layer:config:](self->_resourceManager, "renderOffscreenPipelineForSpheroid:layer:config:", a3->type, 0, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    objc_msgSend(v8, "setLabel:", CFSTR("Καλλιόπη SpriteSpheroid"));
    objc_msgSend(v8, "setRenderPipelineState:", v21);
    -[NUNICalliopeResourceManager discVerticesBuffer](self->_resourceManager, "discVerticesBuffer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setVertexBuffer:offset:atIndex:", v23, 0, 0);

    v24 = v60;
    *v60 = s_sprites[a3[4].type];
    *((_DWORD *)v24 + 40) = LODWORD(a3[1].angle);
    v25 = *(float32x4_t *)&a3[3].type;
    if (type == 10)
    {
      v58 = (simd_float4)xmmword_2134DBD80;
      v56 = (simd_float4)xmmword_2134DBF70;
      v57 = (simd_float4)xmmword_2134DC510;
    }
    else
    {
      _Q0 = vsubq_f32(*(float32x4_t *)&self->_anon_304[12], v25);
      _Q1 = vmulq_f32(_Q0, _Q0);
      _S2 = _Q0.i32[2];
      __asm { FMLA            S1, S2, V0.S[2] }
      _Q1.f32[0] = sqrtf(_Q1.f32[0]);
      v33 = (int32x4_t)vdivq_f32(_Q0, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q1.f32, 0));
      v34 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v33, v33), (int8x16_t)v33, 0xCuLL);
      v35 = (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v33, (int8x16_t)v33, 0xCuLL), (int8x16_t)v33, 8uLL);
      p_state = &self->_state;
      v36 = (int32x4_t)vmlaq_f32(vmulq_f32(v35, vnegq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(*(int32x4_t *)&p_state[3].viewport.height, *(int32x4_t *)&p_state[3].viewport.height), *(int8x16_t *)&p_state[3].viewport.height, 0xCuLL))), v34, (float32x4_t)vextq_s8(vextq_s8(*(int8x16_t *)&p_state[3].viewport.height, *(int8x16_t *)&p_state[3].viewport.height, 0xCuLL), *(int8x16_t *)&p_state[3].viewport.height, 8uLL));
      v37 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(vextq_s8((int8x16_t)v36, (int8x16_t)v36, 0xCuLL), (int8x16_t)v36, 8uLL), vnegq_f32(v34)), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v36, v36), (int8x16_t)v36, 0xCuLL), v35);
      v36.i32[3] = 0;
      v37.i32[3] = 0;
      v56 = (simd_float4)v37;
      v57 = (simd_float4)v36;
      v33.i32[3] = 0;
      v58 = (simd_float4)v33;
    }
    v25.i32[3] = 1.0;
    v55 = (simd_float4)v25;
    v38 = a3[2].equatorRotation * a3[2].opacity;
    if (type == 14)
      v38 = v38 + v38;
    UMFloat4x4MakeScale(v38);
    v62.columns[0] = v39;
    v62.columns[1] = v40;
    v62.columns[2] = v41;
    v62.columns[3] = v42;
    v61.columns[1] = v56;
    v61.columns[0] = v57;
    v61.columns[2] = v58;
    v61.columns[3] = v55;
    *(double *)v43.i64 = UMMul(v61, v62);
    v63.columns[0] = v43;
    v63.columns[1] = v44;
    v63.columns[2] = v45;
    v63.columns[3] = v46;
    *(double *)&v47 = UMMul(*(simd_float4x4 *)&self->_anon_304[220], v63);
    v48 = v60;
    v60[6] = v47;
    v48[7] = v49;
    v48[8] = v50;
    v48[9] = v51;
    -[NUNICalliopeTextureGroup gradients](self->_textureGroup, "gradients");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "objectAtIndexedSubscript:", type);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v53, "atlas");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "bind:slot:", v8, 5);

    objc_msgSend(v8, "drawPrimitives:vertexStart:vertexCount:", 4, 0, 16);
  }

}

- (void)_renderOffscreenSceneWithScene:(const NUNISceneStructure *)a3 spheroids:(id)a4 viewport:(NUNIViewport)a5 commandBuffer:(id)a6 frameBufferIndex:(unint64_t)a7 drawableTexture:(id)a8
{
  uint64_t height;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NUNCalliopeOffscreen *v17;
  NUNCalliopeOffscreen *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NUNCalliopeOffscreen *v26;
  MTLTexture *v27;
  IOSurface *v28;
  IOSurface *v29;
  IOSurface *v30;
  MTLTexture *v31;
  MTLTexture *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  float32x4_t *v43;
  __int32 v44;
  int *v51;
  double v52;
  int *v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  float v57;
  float var7;
  void *v59;
  float *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  void *v70;
  NUNCalliopeOffscreen *v71;
  void *v72;
  void *v73;
  unint64_t v74;
  unint64_t v75;
  id v76;
  void *v77;
  NUNCalliopeOffscreen *v78;
  void *v79;
  id v80;
  double location;
  uint64_t v85;
  float *v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  _BYTE v112[128];
  _BYTE __base[4];
  int v114;
  _OWORD v115[12];
  _QWORD v116[4];
  _QWORD v117[6];

  v117[4] = *MEMORY[0x24BDAC8D0];
  height = a5.height;
  v12 = a4;
  v13 = a6;
  v80 = a8;
  if (self->_bloomDownsampleUsingTileShaders && self->_bloomEnabled)
  {
    -[NUNICalliopeRenderer _getOrCreateOffscreenBloomWithViewport:](self, "_getOrCreateOffscreenBloomWithViewport:", a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "renderPassDescriptor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "renderCommandEncoderWithDescriptor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "setLabel:", CFSTR("Clear Bloom Texture"));
    objc_msgSend(v16, "endEncoding");

  }
  v17 = self->_offscreenScenes[a7];
  v18 = v17;
  v79 = v13;
  if (!v17
    || -[NUNCalliopeOffscreen width](v17, "width") != a5.width
    || -[NUNCalliopeOffscreen height](v18, "height") != (_DWORD)height)
  {
    objc_msgSend(MEMORY[0x24BE16F48], "sharedNilTexture2D");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_opt_new();
    objc_msgSend(v19, "setTextureType:", 2);
    objc_msgSend(v19, "setWidth:", a5.width);
    objc_msgSend(v19, "setHeight:", *(uint64_t *)&a5 >> 32);
    objc_msgSend(v19, "setDepth:", 1);
    objc_msgSend(v19, "setPixelFormat:", 10);
    v116[0] = *MEMORY[0x24BDD8D90];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v117[0] = v20;
    v116[1] = *MEMORY[0x24BDD8D58];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", height);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *MEMORY[0x24BDD8D60];
    v117[1] = v21;
    v117[2] = &unk_24CFE36C0;
    v23 = *MEMORY[0x24BDD8D38];
    v116[2] = v22;
    v116[3] = v23;
    v117[3] = &unk_24CFE36D8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v117, v116, 4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = (void *)MGGetStringAnswer();
    v76 = v12;
    v26 = v18;
    if (objc_msgSend(v25, "isEqualToString:", CFSTR("t8010")))
    {
      objc_msgSend(v19, "setUsage:", 4);
      objc_msgSend(v19, "setResourceOptions:", 48);
      v27 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v19);
      v28 = 0;
    }
    else
    {
      objc_msgSend(v19, "setUsage:", 5);
      objc_msgSend(v19, "setResourceOptions:", 0);
      v28 = (IOSurface *)objc_msgSend(objc_alloc(MEMORY[0x24BDD8DE8]), "initWithProperties:", v24);
      v27 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:iosurface:plane:](self->_device, "newTextureWithDescriptor:iosurface:plane:", v19, v28, 0);
    }
    v29 = self->_contentMaskSurfaces[a7];
    self->_contentMaskSurfaces[a7] = v28;
    v30 = v28;

    v31 = self->_contentMaskTextures[a7];
    self->_contentMaskTextures[a7] = v27;
    v32 = v27;

    v18 = -[NUNCalliopeOffscreen initWithDevice:width:height:texture0:texture1:loadAction:clearColor0:clearColor1:]([NUNCalliopeOffscreen alloc], "initWithDevice:width:height:texture0:texture1:loadAction:clearColor0:clearColor1:", self->_device, a5, height, v77, v32, 2, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 1.0);
    objc_storeStrong((id *)&self->_offscreenScenes[a7], v18);

    v12 = v76;
    v13 = v79;
  }
  -[NUNCalliopeOffscreen setTexture0:](v18, "setTexture0:", v80);
  v75 = objc_msgSend(v80, "width");
  v74 = objc_msgSend(v80, "height");
  -[NUNCalliopeOffscreen renderPassDescriptor](v18, "renderPassDescriptor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setTileWidth:", 32);

  -[NUNCalliopeOffscreen renderPassDescriptor](v18, "renderPassDescriptor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setTileHeight:", 32);

  v78 = v18;
  -[NUNCalliopeOffscreen renderPassDescriptor](v18, "renderPassDescriptor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "renderCommandEncoderWithDescriptor:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  memset(v115, 0, sizeof(v115));
  v108 = 0u;
  v109 = 0u;
  v110 = 0u;
  v111 = 0u;
  v37 = v12;
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v108, v112, 16);
  if (v38)
  {
    v39 = v38;
    LODWORD(v40) = 0;
    v41 = *(_QWORD *)v109;
    do
    {
      for (i = 0; i != v39; ++i)
      {
        if (*(_QWORD *)v109 != v41)
          objc_enumerationMutation(v37);
        v43 = (float32x4_t *)objc_msgSend(*(id *)(*((_QWORD *)&v108 + 1) + 8 * i), "structure");
        if (v43[5].f32[2] > 0.00001 && v43[3].f32[0] > 0.00001 && v43[9].i8[8])
        {
          v44 = v43->i32[0];
          _S0 = 0;
          if ((v43->i32[0] - 10) >= 2)
          {
            if (v44 == 13)
            {
              _S0 = 1258291194;
            }
            else if (v44 == 3)
            {
              _S0 = 1258291192;
            }
            else
            {
              _S0 = 1258291196;
              if (((1 << v44) & 0xFFC000) == 0)
              {
                _S0 = 1258291198;
                if (v44 != 12)
                {
                  _S2 = vsubq_f32((float32x4_t)self[784], v43[96]).i32[2];
                  __asm { FMLA            S0, S2, V1.S[2] }
                }
              }
            }
          }
          v51 = (int *)&__base[8 * (int)v40];
          *v51 = _S0;
          v51[1] = v40;
          *((_QWORD *)v115 + (int)v40) = v43;
          LODWORD(v40) = v40 + 1;
        }
      }
      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v108, v112, 16);
    }
    while (v39);
  }
  else
  {
    LODWORD(v40) = 0;
  }

  qsort(__base, (int)v40, 8uLL, (int (__cdecl *)(const void *, const void *))_NUNICalliopeRenderCompareObject);
  objc_msgSend(v36, "setLabel:", CFSTR("Καλλιόπη Offscreen Scene"));
  v87 = 0uLL;
  *(double *)&v88 = (double)a5.width;
  *((double *)&v88 + 1) = (double)(int)height;
  v89 = xmmword_2134DC520;
  objc_msgSend(v36, "setViewport:", &v87);
  objc_msgSend(v36, "setCullMode:", 0);
  objc_msgSend(v36, "setFrontFacingWinding:", 0);
  -[NUNICalliopeRenderer _renderOffscreenBackgroundWithRenderEncoder:frameBufferIndex:](self, "_renderOffscreenBackgroundWithRenderEncoder:frameBufferIndex:", v36, a7);
  v106 = 0u;
  v107 = 0u;
  v104 = 0u;
  v105 = 0u;
  v102 = 0u;
  v103 = 0u;
  v100 = 0u;
  v101 = 0u;
  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  v87 = 0u;
  -[NUNICalliopeRenderer prepareWorldSpaceFrustumWithTransform:withState:](self, "prepareWorldSpaceFrustumWithTransform:withState:", &self->_anon_304[220], &v87);
  if ((int)v40 >= 1)
  {
    *(float *)&v52 = (float)v75;
    *((float *)&v52 + 1) = (float)v74;
    location = v52;
    v40 = v40;
    v53 = &v114;
    do
    {
      v54 = *v53;
      v53 += 2;
      v55 = *((_QWORD *)v115 + v54);
      v56 = 1 << *(_DWORD *)v55;
      if ((v56 & 0xFBFC00) != 0)
      {
        -[NUNICalliopeRenderer _renderSpriteSpheroid:frameBufferIndex:renderEncoder:](self, "_renderSpriteSpheroid:frameBufferIndex:renderEncoder:", v55, a7, v36);
      }
      else if ((v56 & 0x3FE) != 0)
      {
        -[NUNICalliopeRenderer _renderPatchSpheroid:frustumCullingState:drawableSize:frameBufferIndex:renderEncoder:](self, "_renderPatchSpheroid:frustumCullingState:drawableSize:frameBufferIndex:renderEncoder:", v55, &v87, a7, v36, location);
      }
      if ((v56 & 8) != 0)
      {
        v57 = *(float *)&a3[1].var6;
        if (v57 > 0.00001)
        {
          var7 = a3[1].var7;
          v85 = 0;
          v86 = 0;
          -[NUNICalliopeRenderer getUniformsBufferForFrameBufferIndex:pContents:pOffset:](self, "getUniformsBufferForFrameBufferIndex:pContents:pOffset:", a7, &v86, &v85);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "setVertexBuffer:offset:atIndex:", v59, v85, 1);
          objc_msgSend(v36, "setFragmentBuffer:offset:atIndex:", v59, v85, 0);
          v60 = v86;
          *(_OWORD *)v86 = *(_OWORD *)&self->_baseUniforms.vsh.{?=;
          v61 = *(_OWORD *)&self->_anon_421[15];
          v62 = *(_OWORD *)&self->_anon_421[31];
          v63 = *(_OWORD *)&self->_anon_421[63];
          *((_OWORD *)v60 + 3) = *(_OWORD *)&self->_anon_421[47];
          *((_OWORD *)v60 + 4) = v63;
          *((_OWORD *)v60 + 1) = v61;
          *((_OWORD *)v60 + 2) = v62;
          v64 = *(_OWORD *)&self->_anon_421[79];
          v65 = *(_OWORD *)&self->_anon_421[95];
          v66 = *(_OWORD *)&self->_anon_421[127];
          *((_OWORD *)v60 + 7) = *(_OWORD *)&self->_anon_421[111];
          *((_OWORD *)v60 + 8) = v66;
          *((_OWORD *)v60 + 5) = v64;
          *((_OWORD *)v60 + 6) = v65;
          v68 = *(_OWORD *)&self->_anon_421[143];
          v67 = *(_OWORD *)&self->_anon_421[159];
          v69 = *(_OWORD *)&self->_anon_421[191];
          *((_OWORD *)v60 + 11) = *(_OWORD *)&self->_anon_421[175];
          *((_OWORD *)v60 + 12) = v69;
          *((_OWORD *)v60 + 9) = v68;
          *((_OWORD *)v60 + 10) = v67;
          v60[40] = v57 * *(float *)(v55 + 48);
          v60[41] = var7 - floorf(var7);
          v60[43] = a3[1].var8.var0.var0;
          -[NUNICalliopeRenderer _renderLocationDot:scene:uniPtr:viewport:renderEncoder:](self, "_renderLocationDot:scene:uniPtr:viewport:renderEncoder:", v55, a3);

        }
      }
      --v40;
    }
    while (v40);
  }
  if (self->_bloomEnabled)
  {
    v70 = v79;
    v71 = v78;
    if (self->_bloomDownsampleUsingTileShaders)
    {
      -[NUNICalliopeRenderer _renderOffscreenBloomTextureUsingTileShaderWithViewport:renderEncoder:](self, "_renderOffscreenBloomTextureUsingTileShaderWithViewport:renderEncoder:", a5, v36);
      objc_msgSend(v36, "endEncoding");
    }
    else
    {
      objc_msgSend(v36, "endEncoding");
      -[NUNCalliopeOffscreen texture0](v78, "texture0");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      -[NUNICalliopeRenderer _renderOffscreenBloomTextureWithViewport:sceneTexture:commandBuffer:](self, "_renderOffscreenBloomTextureWithViewport:sceneTexture:commandBuffer:", a5, v72, v79);

    }
    objc_msgSend(v79, "computeCommandEncoder");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUNICalliopeRenderer _computeBloomChainTextures:](self, "_computeBloomChainTextures:", v73);
    objc_msgSend(v73, "endEncoding");

  }
  else
  {
    objc_msgSend(v36, "endEncoding");
    v70 = v79;
    v71 = v78;
  }

}

- (id)_getOrCreateOffscreenBloomWithViewport:(NUNIViewport)a3
{
  uint64_t v5;
  uint64_t v6;
  NUNCalliopeOffscreen *offscreenBloom;
  void *v8;
  NUNCalliopeOffscreen *v9;
  NUNCalliopeOffscreen *v10;

  v5 = (a3.width >> 2);
  v6 = *(uint64_t *)&a3 >> 34;
  offscreenBloom = self->_offscreenBloom;
  if (!offscreenBloom
    || -[NUNCalliopeOffscreen width](offscreenBloom, "width") != (_DWORD)v5
    || -[NUNCalliopeOffscreen height](self->_offscreenBloom, "height") != (_DWORD)v6)
  {
    _NUNCalliopeCreateTexture(self->_device, v5, v6, 1, 10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUNICalliopeRenderer _setupBloomChainWithViewport:bloomTexture:](self, "_setupBloomChainWithViewport:bloomTexture:", a3, v8);
    v9 = -[NUNCalliopeOffscreen initWithDevice:width:height:texture0:texture1:loadAction:clearColor0:clearColor1:]([NUNCalliopeOffscreen alloc], "initWithDevice:width:height:texture0:texture1:loadAction:clearColor0:clearColor1:", self->_device, v5, v6, v8, 0, 2 * self->_bloomDownsampleUsingTileShaders, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    v10 = self->_offscreenBloom;
    self->_offscreenBloom = v9;

  }
  return self->_offscreenBloom;
}

- (void)_renderOffscreenBloomTextureUsingTileShaderWithViewport:(NUNIViewport)a3 renderEncoder:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[3];

  v6 = a4;
  -[NUNICalliopeRenderer _getOrCreateOffscreenBloomWithViewport:](self, "_getOrCreateOffscreenBloomWithViewport:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pushDebugGroup:", CFSTR("Καλλιόπη Bloom Downsample"));
  -[NUNICalliopeResourceManager renderOffscreenPipelineForBloomDownsampleUsingTileShader](self->_resourceManager, "renderOffscreenPipelineForBloomDownsampleUsingTileShader");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRenderPipelineState:", v8);

  objc_msgSend(v7, "texture0");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTileTexture:atIndex:", v9, 0);

  v10[0] = (unint64_t)objc_msgSend(v6, "tileWidth") >> 1;
  v10[1] = (unint64_t)objc_msgSend(v6, "tileHeight") >> 1;
  v10[2] = 1;
  objc_msgSend(v6, "dispatchThreadsPerTile:", v10);
  objc_msgSend(v6, "setTileTexture:atIndex:", 0, 0);
  objc_msgSend(v6, "popDebugGroup");

}

- (void)_renderOffscreenBloomTextureWithViewport:(NUNIViewport)a3 sceneTexture:(id)a4 commandBuffer:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  __int128 v15;

  v8 = a5;
  v9 = a4;
  -[NUNICalliopeRenderer _getOrCreateOffscreenBloomWithViewport:](self, "_getOrCreateOffscreenBloomWithViewport:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "renderPassDescriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "renderCommandEncoderWithDescriptor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[NUNICalliopeResourceManager renderOffscreenPipelineForBloomDownsample](self->_resourceManager, "renderOffscreenPipelineForBloomDownsample");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLabel:", CFSTR("Καλλιόπη Bloom Downsample"));
  objc_msgSend(v12, "setRenderPipelineState:", v13);
  v14[0] = 0;
  v14[1] = 0;
  *(double *)&v14[2] = (double)(int)objc_msgSend(v10, "width");
  *(double *)&v14[3] = (double)(int)objc_msgSend(v10, "height");
  v15 = xmmword_2134DC520;
  objc_msgSend(v12, "setViewport:", v14);
  objc_msgSend(v12, "setCullMode:", 0);
  objc_msgSend(v12, "setFragmentTexture:atIndex:", v9, 0);

  objc_msgSend(v12, "drawPrimitives:vertexStart:vertexCount:", 3, 0, 3);
  objc_msgSend(v12, "endEncoding");

}

- (void)_setupBloomChainWithViewport:(NUNIViewport)a3 bloomTexture:(id)a4
{
  unint64_t v6;
  float v7;
  unint64_t v8;
  unint64_t v9;
  $33731095F0C501293CE96C5012083D19 *p_bloomChain;
  void *v11;
  MTLTexture *v12;
  MTLTexture *texture;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64x2_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  MTLTexture *v22;
  MTLTexture *v23;
  uint64x2_t *v24;
  int8x16_t v25;
  unint64_t v26;
  unint64_t v27;
  $43A06E64BE8DAA1C024B87E562EAE8F8 *v28;
  MTLTexture *v29;
  id v30;
  uint64x2_t v31;
  int64x2_t v32;
  int64x2_t v33;

  v30 = a4;
  if (!v30)
    -[NUNICalliopeRenderer _setupBloomChainWithViewport:bloomTexture:].cold.1();
  v6 = 0;
  v7 = fmaxf((float)a3.width, (float)a3.height) * 0.025;
  do
    ++v6;
  while ((float)((float)(1 << v6) * 1.5) < v7);
  v8 = 16;
  if (v6 < 0x10)
    v8 = v6;
  if (v8 <= 2)
    v9 = 2;
  else
    v9 = v8;
  p_bloomChain = &self->_bloomChain;
  self->_bloomChain.numLevels = v9;
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "setWidth:", (unint64_t)objc_msgSend(v30, "width") >> 1);
  objc_msgSend(v11, "setHeight:", (unint64_t)objc_msgSend(v30, "height") >> 1);
  objc_msgSend(v11, "setMipmapLevelCount:", v9 - 1);
  objc_msgSend(v11, "setPixelFormat:", 25);
  objc_msgSend(v11, "setUsage:", 3);
  v12 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v11);
  texture = self->_bloomChain.texture;
  self->_bloomChain.texture = v12;

  v14 = objc_msgSend(v30, "width");
  v15 = objc_msgSend(v30, "height");
  if (!v14)
    -[NUNICalliopeRenderer _setupBloomChainWithViewport:bloomTexture:].cold.2();
  if (!v15)
    -[NUNICalliopeRenderer _setupBloomChainWithViewport:bloomTexture:].cold.3();
  v16 = 0;
  v17.i64[0] = v14;
  v17.i64[1] = v15;
  v18 = 16;
  if (v6 < 0x10)
    v18 = v6;
  if (v18 <= 2)
    v18 = 2;
  v19 = 32 * v18;
  v20 = -1;
  v31 = (uint64x2_t)vdupq_n_s64(1uLL);
  v32 = vdupq_n_s64(7uLL);
  do
  {
    v33 = v17;
    if (v16)
    {
      v21 = -[MTLTexture newTextureViewWithPixelFormat:textureType:levels:slices:](p_bloomChain->texture, "newTextureViewWithPixelFormat:textureType:levels:slices:", -[MTLTexture pixelFormat](p_bloomChain->texture, "pixelFormat"), -[MTLTexture textureType](p_bloomChain->texture, "textureType"), v20, 1, 0, 1);
      v22 = p_bloomChain->levels[v16 / 0x20].texture;
      p_bloomChain->levels[v16 / 0x20].texture = (MTLTexture *)v21;
    }
    else
    {
      v23 = (MTLTexture *)v30;
      v22 = self->_bloomChain.levels[0].texture;
      self->_bloomChain.levels[0].texture = v23;
    }

    v24 = (uint64x2_t *)((char *)p_bloomChain + v16);
    v24[1] = vshrq_n_u64((uint64x2_t)vaddq_s64(v33, v32), 3uLL);
    v24[2].i64[0] = 1;
    v25 = (int8x16_t)vcgtq_u64((uint64x2_t)v33, v31);
    v17 = vsubq_s64((int64x2_t)vandq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)v33, 1uLL), v25), (int64x2_t)vmvnq_s8(v25));
    v16 += 32;
    ++v20;
  }
  while (v19 != v16);
  if (v9 <= 0xF)
  {
    v26 = 16;
    if (v6 < 0x10)
      v26 = v6;
    if (v26 <= 2)
      v26 = 2;
    v27 = v26 - 1;
    v28 = &self->_bloomChain.levels[v26];
    do
    {
      v29 = v28->texture;
      v28->texture = 0;

      v28->numThreadgroups.width = 0;
      v28->numThreadgroups.height = 0;
      v28->numThreadgroups.depth = 0;
      ++v27;
      ++v28;
    }
    while (v27 < 0xF);
  }

}

- (void)_computeBloomChainTextures:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  $43A06E64BE8DAA1C024B87E562EAE8F8 *v9;
  unint64_t numLevels;
  unint64_t v11;
  MTLTexture **v12;
  int64x2_t v13;
  int64x2_t v14;
  int64x2_t v15;
  uint64_t v16;
  __int128 v17;
  MTLTexture *depth;

  v4 = a3;
  -[NUNICalliopeResourceManager computePipelineForBloomChainDownsample](self->_resourceManager, "computePipelineForBloomChainDownsample");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUNICalliopeResourceManager computePipelineForBloomChainUpsample](self->_resourceManager, "computePipelineForBloomChainUpsample");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    -[NUNICalliopeRenderer _computeBloomChainTextures:].cold.1();
  v7 = (void *)v6;
  if (!v6)
    -[NUNICalliopeRenderer _computeBloomChainTextures:].cold.2();
  objc_msgSend(v4, "pushDebugGroup:", CFSTR("Καλλιόπη Bloom Chain Downsample"));
  objc_msgSend(v4, "setComputePipelineState:", v5);
  if (self->_bloomChain.numLevels != 1)
  {
    v8 = 0;
    v9 = &self->_bloomChain.levels[1];
    v13 = vdupq_n_s64(8uLL);
    do
    {
      if (!v9[-1].texture)
        -[NUNICalliopeRenderer _computeBloomChainTextures:].cold.5();
      if (!v9->texture)
        -[NUNICalliopeRenderer _computeBloomChainTextures:].cold.6();
      ++v8;
      objc_msgSend(v4, "setTexture:atIndex:");
      objc_msgSend(v4, "setTexture:atIndex:", v9->texture, 1);
      v17 = *(_OWORD *)&v9->numThreadgroups.width;
      depth = (MTLTexture *)v9->numThreadgroups.depth;
      v15 = v13;
      v16 = 1;
      objc_msgSend(v4, "dispatchThreadgroups:threadsPerThreadgroup:", &v17, &v15);
      ++v9;
    }
    while (v8 < self->_bloomChain.numLevels - 1);
  }
  objc_msgSend(v4, "popDebugGroup", *(_OWORD *)&v13);
  objc_msgSend(v4, "pushDebugGroup:", CFSTR("Καλλιόπη Bloom Chain Upsample"));
  objc_msgSend(v4, "setComputePipelineState:", v7);
  numLevels = self->_bloomChain.numLevels;
  v11 = numLevels - 1;
  if (numLevels - 1 >= 2)
  {
    v12 = &self->_contentMaskTextures[4 * numLevels];
    v14 = vdupq_n_s64(8uLL);
    do
    {
      if (!v12[4])
        -[NUNICalliopeRenderer _computeBloomChainTextures:].cold.3();
      if (!*v12)
        -[NUNICalliopeRenderer _computeBloomChainTextures:].cold.4();
      objc_msgSend(v4, "setTexture:atIndex:");
      objc_msgSend(v4, "setTexture:atIndex:", *v12, 1);
      v17 = *(_OWORD *)(v12 + 1);
      depth = v12[3];
      v15 = v14;
      v16 = 1;
      objc_msgSend(v4, "dispatchThreadgroups:threadsPerThreadgroup:", &v17, &v15);
      --v11;
      v12 -= 4;
    }
    while (v11 > 1);
  }
  objc_msgSend(v4, "popDebugGroup", *(_OWORD *)&v14);

}

- (void)_renderOffscreenPostWithScene:(const NUNISceneStructure *)a3 viewport:(NUNIViewport)a4 commandBuffer:(id)a5 frameBufferIndex:(unint64_t)a6
{
  NUNIViewport v8;
  NUNIViewport height;
  NUNCalliopeOffscreen *v11;
  NUNCalliopeOffscreen *v12;
  $33731095F0C501293CE96C5012083D19 *p_bloomChain;
  id v14;
  void *v15;
  _OWORD *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  NUNCalliopeOffscreen *v26;
  void *v27;
  NUNIViewport v28;
  NUNCalliopeOffscreen *v29;
  void *v30;
  MTLDevice *device;
  void *v32;
  NUNCalliopeOffscreen *v33;
  NUNCalliopeOffscreen *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  _QWORD v40[4];
  __int128 v41;
  uint64_t v42;
  _OWORD *v43;

  v8 = a4;
  height = (NUNIViewport)a4.height;
  v11 = self->_offscreenScenes[a6];
  v12 = self->_offscreenPosts;
  p_bloomChain = &self->_bloomChain;
  *(float *)&self->_anon_421[191] = 1.0 / (float)(self->_bloomChain.numLevels - 1);
  v42 = 0;
  v43 = 0;
  v14 = a5;
  -[NUNICalliopeRenderer getUniformsBufferForFrameBufferIndex:pContents:pOffset:](self, "getUniformsBufferForFrameBufferIndex:pContents:pOffset:", a6, &v43, &v42);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v43;
  *v43 = *(_OWORD *)&self->_baseUniforms.vsh.{?=;
  v17 = *(_OWORD *)&self->_anon_421[63];
  v19 = *(_OWORD *)&self->_anon_421[15];
  v18 = *(_OWORD *)&self->_anon_421[31];
  v16[3] = *(_OWORD *)&self->_anon_421[47];
  v16[4] = v17;
  v16[1] = v19;
  v16[2] = v18;
  v20 = *(_OWORD *)&self->_anon_421[127];
  v22 = *(_OWORD *)&self->_anon_421[79];
  v21 = *(_OWORD *)&self->_anon_421[95];
  v16[7] = *(_OWORD *)&self->_anon_421[111];
  v16[8] = v20;
  v16[5] = v22;
  v16[6] = v21;
  v23 = *(_OWORD *)&self->_anon_421[191];
  v25 = *(_OWORD *)&self->_anon_421[143];
  v24 = *(_OWORD *)&self->_anon_421[159];
  v16[11] = *(_OWORD *)&self->_anon_421[175];
  v16[12] = v23;
  v16[9] = v25;
  v16[10] = v24;
  if (!v12
    || -[NUNCalliopeOffscreen width](v12, "width") != v8.width
    || -[NUNCalliopeOffscreen height](v12, "height") != height.width)
  {
    objc_msgSend(MEMORY[0x24BE16F48], "sharedNilTexture2D");
    v26 = v11;
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v14;
    v28 = v8;
    v8 = height;
    v29 = [NUNCalliopeOffscreen alloc];
    v30 = v15;
    device = self->_device;
    -[NUNCalliopeOffscreen texture1](v26, "texture1");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v29;
    height = v8;
    v8.width = v28.width;
    v34 = -[NUNCalliopeOffscreen initWithDevice:width:height:texture0:texture1:loadAction:clearColor0:clearColor1:](v33, "initWithDevice:width:height:texture0:texture1:loadAction:clearColor0:clearColor1:", device, v28, height, v27, v32, 1, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 1.0);

    objc_storeStrong((id *)&self->_offscreenPosts, v34);
    v11 = v26;
    v12 = v34;
    v15 = v30;
    v14 = v39;
    p_bloomChain = &self->_bloomChain;
  }
  -[NUNCalliopeOffscreen texture0](v11, "texture0");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUNCalliopeOffscreen setTexture0:](v12, "setTexture0:", v35);

  -[NUNCalliopeOffscreen renderPassDescriptor](v12, "renderPassDescriptor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "renderCommandEncoderWithDescriptor:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  -[NUNICalliopeResourceManager renderOffscreenPipelineForPost](self->_resourceManager, "renderOffscreenPipelineForPost");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setLabel:", CFSTR("Καλλιόπη Post"));
  objc_msgSend(v37, "setRenderPipelineState:", v38);
  v40[0] = 0;
  v40[1] = 0;
  *(double *)&v40[2] = (double)v8.width;
  *(double *)&v40[3] = (double)height.width;
  v41 = xmmword_2134DC520;
  objc_msgSend(v37, "setViewport:", v40);
  objc_msgSend(v37, "setCullMode:", 0);
  objc_msgSend(v37, "setFragmentBuffer:offset:atIndex:", v15, v42, 0);
  objc_msgSend(v37, "setFragmentTexture:atIndex:", p_bloomChain->texture, 1);
  objc_msgSend(v37, "drawPrimitives:vertexStart:vertexCount:", 3, 0, 3);
  objc_msgSend(v37, "endEncoding");

}

- (void)renderOffscreenWithScene:(id)a3 viewport:(NUNIViewport)a4 commandBuffer:(id)a5
{
  -[NUNICalliopeRenderer _updateStateWithScene:viewport:](self, "_updateStateWithScene:viewport:", objc_msgSend(a3, "structure"), a4);
  -[NUNICalliopeRenderer _updateBaseUniformsForViewport:](self, "_updateBaseUniformsForViewport:", a4);
}

- (void)renderWithScene:(id)a3 viewport:(NUNIViewport)a4 commandBuffer:(id)a5 passDescriptor:(id)a6
{
  unint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a5;
  v10 = self->_frame % 3;
  v11 = a6;
  v12 = a3;
  v13 = objc_msgSend(v12, "structure");
  objc_msgSend(v11, "colorAttachments");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "texture");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  self->_renderUniformsBuffersCounts[v10].current = 0;
  objc_msgSend(v12, "spheroids");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[NUNICalliopeRenderer _renderOffscreenSceneWithScene:spheroids:viewport:commandBuffer:frameBufferIndex:drawableTexture:](self, "_renderOffscreenSceneWithScene:spheroids:viewport:commandBuffer:frameBufferIndex:drawableTexture:", v13, v17, a4, v18, v10, v16);
  if (self->_bloomEnabled)
    -[NUNICalliopeRenderer _renderOffscreenPostWithScene:viewport:commandBuffer:frameBufferIndex:](self, "_renderOffscreenPostWithScene:viewport:commandBuffer:frameBufferIndex:", v13, a4, v18, v10);
  -[NUNCalliopeOffscreen setTexture0:](self->_offscreenScenes[v10], "setTexture0:", 0);
  -[NUNCalliopeOffscreen setTexture0:](self->_offscreenPosts, "setTexture0:", 0);
  -[CALayer setContents:](self->_contentMaskLayer, "setContents:", self->_contentMaskSurfaces[v10]);
  ++self->_frame;

}

- (void)prepareWorldSpaceFrustumWithTransform:(id *)a3 withState:(id *)a4
{
  uint64_t v5;
  char v6;
  uint64_t v7;
  char v8;
  char *v9;
  char *v10;
  float32x4_t v11;
  simd_float4x4 v12;
  simd_float4x4 v13;

  v12.columns[2] = (simd_float4)*((_OWORD *)a3 + 2);
  v12.columns[3] = (simd_float4)*((_OWORD *)a3 + 3);
  v12.columns[0] = *(simd_float4 *)a3;
  v12.columns[1] = (simd_float4)*((_OWORD *)a3 + 1);
  v13 = __invert_f4(v12);
  v5 = 0;
  v6 = 1;
  do
  {
    v7 = 0;
    v8 = v6;
    v9 = (char *)&prepareWorldSpaceFrustumWithTransform_withState__projectedPositions + 64 * v5;
    v10 = (char *)a4 + 64 * v5;
    do
    {
      v11 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v13.columns[0], COERCE_FLOAT(*(_OWORD *)&v9[v7])), (float32x4_t)v13.columns[1], *(float32x2_t *)&v9[v7], 1), (float32x4_t)v13.columns[2], *(float32x4_t *)&v9[v7], 2), (float32x4_t)v13.columns[3], *(float32x4_t *)&v9[v7], 3);
      *(float32x4_t *)&v10[v7] = vdivq_f32(v11, (float32x4_t)vdupq_laneq_s32((int32x4_t)v11, 3));
      v7 += 16;
    }
    while (v7 != 64);
    v6 = 0;
    v5 = 1;
  }
  while ((v8 & 1) != 0);
}

- (void)prepareObjectSpaceFrustumWithTransform:(id *)a3 withState:(id *)a4
{
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  char *v10;
  double *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  simd_float4x4 v18;
  simd_float4x4 v19;

  v18.columns[2] = (simd_float4)*((_OWORD *)a3 + 2);
  v18.columns[3] = (simd_float4)*((_OWORD *)a3 + 3);
  v18.columns[0] = *(simd_float4 *)a3;
  v18.columns[1] = (simd_float4)*((_OWORD *)a3 + 1);
  v19 = __invert_f4(v18);
  v6 = 0;
  v7 = 1;
  do
  {
    v8 = 0;
    v9 = v7;
    v10 = (char *)a4 + 64 * v6;
    do
    {
      *(float32x4_t *)&v10[v8 + 128] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v19.columns[0], COERCE_FLOAT(*(_OWORD *)&v10[v8])), (float32x4_t)v19.columns[1], *(float32x2_t *)&v10[v8], 1), (float32x4_t)v19.columns[2], *(float32x4_t *)&v10[v8], 2), (float32x4_t)v19.columns[3], *(float32x4_t *)&v10[v8], 3);
      v8 += 16;
    }
    while (v8 != 64);
    v7 = 0;
    v6 = 1;
  }
  while ((v9 & 1) != 0);
  v11 = (double *)((char *)a4 + 256);
  v12 = -4;
  do
  {
    v13 = __CFADD__(v12, 1);
    v14 = v12 + 1;
    v15 = v12 + 5;
    if (v13)
      v15 = 0;
    -[NUNICalliopeRenderer buildFrustumPlane:p2:p3:](self, "buildFrustumPlane:p2:p3:", *(v11 - 16), *(v11 - 8), *((double *)a4 + 2 * v15 + 24));
    *(_OWORD *)v11 = v16;
    v11 += 2;
    v12 = v14;
  }
  while (v14);
  -[NUNICalliopeRenderer buildFrustumPlane:p2:p3:](self, "buildFrustumPlane:p2:p3:", *((double *)a4 + 16), *((double *)a4 + 18), *((double *)a4 + 20));
  *((_OWORD *)a4 + 20) = v17;
}

- (double)buildFrustumPlane:(float32x4_t)a1 p2:(float32x4_t)a2 p3:(float32x4_t)a3
{
  float32x4_t v3;
  float32x4_t v4;
  float32x4_t v5;
  float32x4_t v6;
  int32x4_t v7;
  double result;

  v3 = vsubq_f32(a2, a1);
  v4 = vsubq_f32(a3, a2);
  v5 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v4, (int32x4_t)v4), (int8x16_t)v4, 0xCuLL), vnegq_f32(v3)), v4, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v3, (int32x4_t)v3), (int8x16_t)v3, 0xCuLL));
  v6 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v5, (int32x4_t)v5), (int8x16_t)v5, 0xCuLL);
  v7 = (int32x4_t)vmulq_f32(v5, v5);
  v7.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v7.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v7, 2), *(float32x2_t *)v7.i8)).u32[0];
  *(float32x2_t *)v5.f32 = vrsqrte_f32((float32x2_t)v7.u32[0]);
  *(float32x2_t *)v5.f32 = vmul_f32(*(float32x2_t *)v5.f32, vrsqrts_f32((float32x2_t)v7.u32[0], vmul_f32(*(float32x2_t *)v5.f32, *(float32x2_t *)v5.f32)));
  *(_QWORD *)&result = vmulq_n_f32(v6, vmul_f32(*(float32x2_t *)v5.f32, vrsqrts_f32((float32x2_t)v7.u32[0], vmul_f32(*(float32x2_t *)v5.f32, *(float32x2_t *)v5.f32))).f32[0]).u64[0];
  return result;
}

- (int)classifyObjectBoundingBoxVersusFrustum:(NUNICalliopeRenderer *)self max:(SEL)a2 withState:
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  BOOL v6;
  char v7;
  unsigned int v13;
  float v14;
  float v15;
  float32x4_t v16;
  int8x16_t v17;
  int v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v5 = 0;
  v6 = 0;
  v22 = *MEMORY[0x24BDAC8D0];
  v20 = v2;
  v21 = v3;
  v7 = 1;
  __asm { FMOV            V0.4S, #1.0 }
  do
  {
    v13 = 0;
    v14 = -3.4028e38;
    v15 = 3.4028e38;
    do
    {
      v16.i32[3] = HIDWORD(_Q0);
      v16.i32[0] = *(_DWORD *)*(&v20 + (v13 & 1));
      v16.i32[1] = *(_DWORD *)(*(&v20 + ((v13 >> 1) & 1)) + 4);
      v16.i32[2] = *(_DWORD *)(*(&v20 + (v13 >> 2)) + 8);
      v17 = (int8x16_t)vmulq_f32(*(float32x4_t *)(v4 + 16 * v5 + 256), v16);
      *(float *)v17.i32 = vaddv_f32(vadd_f32(*(float32x2_t *)v17.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v17, v17, 8uLL)));
      v15 = fminf(v15, *(float *)v17.i32);
      v14 = fmaxf(v14, *(float *)v17.i32);
      ++v13;
    }
    while (v13 != 8);
    if (v14 < 0.0)
      break;
    v7 &= v15 >= 0.0;
    v6 = v5++ > 3;
  }
  while (v5 != 5);
  if ((v7 & 1) != 0)
    v18 = 1;
  else
    v18 = 2;
  if (v6)
    return v18;
  else
    return 0;
}

- (BOOL)isObjectBoundingBoxInsideOrIntersectingFrustum:(NUNICalliopeRenderer *)self max:(SEL)a2 withState:
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  BOOL v6;
  unsigned int v12;
  float v13;
  float32x4_t v14;
  int8x16_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v5 = 0;
  v6 = 0;
  v19 = *MEMORY[0x24BDAC8D0];
  v17 = v2;
  v18 = v3;
  __asm { FMOV            V0.4S, #1.0 }
  do
  {
    v12 = 0;
    v13 = -3.4028e38;
    do
    {
      v14.i32[3] = HIDWORD(_Q0);
      v14.i32[0] = *(_DWORD *)*(&v17 + (v12 & 1));
      v14.i32[1] = *(_DWORD *)(*(&v17 + ((v12 >> 1) & 1)) + 4);
      v14.i32[2] = *(_DWORD *)(*(&v17 + (v12 >> 2)) + 8);
      v15 = (int8x16_t)vmulq_f32(*(float32x4_t *)(v4 + 16 * v5 + 256), v14);
      v13 = fmaxf(v13, vaddv_f32(vadd_f32(*(float32x2_t *)v15.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v15, v15, 8uLL))));
      ++v12;
    }
    while (v12 != 8);
    if (v13 < 0.0)
      break;
    v6 = v5++ > 3;
  }
  while (v5 != 5);
  return v6;
}

- (id)spheroidAtPoint:(id)a3 scene:(NUNIViewport)a4 viewport:
{
  float32x2_t v4;
  float32x2_t v6;
  int height;
  id v9;
  NUNICalliopeRendererState *p_state;
  void *v11;
  int v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  void *v16;
  float32x4_t *v17;
  _DWORD *v24;
  float32x2_t v26;
  float32x2_t v27;
  float32x2_t v28;
  float32x2_t v29;
  float fovY;
  float32x2_t v31;
  uint64_t v32;
  int *v33;
  uint64_t v34;
  uint64_t v35;
  float32x4_t v36;
  float32x2_t v37;
  float32x2_t v38;
  float32x2_t v39;
  float32x2_t v40;
  float32x2_t v41;
  int32x2_t v42;
  int32x2_t v43;
  int32x2_t v44;
  float32x2_t v45;
  int32x2_t v46;
  float32x2_t v47;
  void *v48;
  void *v50;
  float32x4_t v51;
  float32x4_t v52;
  float v53;
  float32x4_t v54;
  float width;
  float32x4_t v56;
  _BYTE __base[4];
  int v58;
  _OWORD v59[12];
  uint64_t v60;

  v6 = v4;
  v60 = *MEMORY[0x24BDAC8D0];
  height = a4.height;
  v9 = a3;
  -[NUNICalliopeRenderer _updateStateWithScene:viewport:](self, "_updateStateWithScene:viewport:", objc_msgSend(v9, "structure"), a4);
  p_state = &self->_state;
  memset(v59, 0, sizeof(v59));
  v50 = v9;
  objc_msgSend(v9, "spheroids");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");
  if (v12 < 1)
  {
    v14 = 0;
  }
  else
  {
    v13 = 0;
    v14 = 0;
    v15 = v12;
    do
    {
      objc_msgSend(v11, "objectAtIndexedSubscript:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (float32x4_t *)objc_msgSend(v16, "structure");

      if (v17[5].f32[2] > 0.00001 && v17[3].f32[0] > 0.00001 && v17[9].i8[8] && ((1 << v17->i32[0]) & 0x3FE) != 0)
      {
        _S2 = vsubq_f32((float32x4_t)p_state[32], v17[96]).i32[2];
        __asm { FMLA            S1, S2, V0.S[2] }
        v24 = &__base[8 * v14];
        *v24 = _S1;
        v24[1] = v13;
        *((_QWORD *)v59 + v13) = v17;
        ++v14;
      }
      ++v13;
    }
    while (v15 != v13);
  }
  width = (float)a4.width;
  v53 = (float)height;
  qsort(__base, v14, 8uLL, (int (__cdecl *)(const void *, const void *))_NUNICalliopeRenderCompareObject);
  __asm { FMOV            V1.2S, #1.0 }
  v26.i32[1] = _D1.i32[1];
  if (height > a4.width)
  {
    _D1.f32[1] = width / v53;
    v27 = _D1;
  }
  else
  {
    v26.f32[0] = v53 / width;
    v27 = v26;
  }
  if (v14 < 1)
  {
LABEL_18:
    v48 = 0;
  }
  else
  {
    v28.f32[1] = (float)height;
    v28.f32[0] = (float)a4.width;
    v29 = vmla_f32((float32x2_t)0x3F800000BF800000, (float32x2_t)0xC000000040000000, vdiv_f32(v6, v28));
    v54 = *(float32x4_t *)&p_state[9].aspect;
    v56 = *(float32x4_t *)&p_state[8].fovY;
    v51 = *(float32x4_t *)&p_state[11].viewport.height;
    v52 = *(float32x4_t *)&p_state[10].cameraRoll;
    fovY = p_state->fovY;
    v31 = *(float32x2_t *)&p_state[1].viewport.height;
    v32 = v14;
    v33 = &v58;
    while (1)
    {
      v35 = *v33;
      v33 += 2;
      v34 = v35;
      v36 = *(float32x4_t *)(*((_QWORD *)v59 + v35) + 96);
      v36.i32[3] = 1.0;
      UMMul(v56, v54, v52, v51, v36);
      _NUNICalliopeRenderer_ComputeProjectedSpheroid(fovY);
      v38 = vmul_f32(v27, v37);
      v40 = vmul_f32(v27, v39);
      v42 = (int32x2_t)vmul_f32(v38, v38);
      v43 = (int32x2_t)vmul_f32(v40, v40);
      v44 = (int32x2_t)vadd_f32((float32x2_t)vzip1_s32(v42, v43), (float32x2_t)vzip2_s32(v42, v43));
      v45 = vsub_f32(v29, vmul_f32(v27, vsub_f32(v41, v31)));
      v46 = (int32x2_t)vmul_f32(v45, v45);
      v47 = vadd_f32((float32x2_t)vzip1_s32(v46, v44), (float32x2_t)vzip2_s32(v46, v44));
      if ((vmvn_s8((int8x8_t)vcgt_f32((float32x2_t)vdup_lane_s32((int32x2_t)v47, 1), v47)).u8[0] & 1) == 0)
        break;
      if (!--v32)
        goto LABEL_18;
    }
    objc_msgSend(v11, "objectAtIndexedSubscript:", v34);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v48;
}

- (NUNICalliopeResourceManager)resourceManager
{
  return self->_resourceManager;
}

- (NUNIRendererOptions)rendererOptions
{
  return self->_rendererOptions;
}

- (void).cxx_destruct
{
  uint64_t i;
  uint64_t j;
  uint64_t k;
  uint64_t m;

  objc_storeStrong((id *)&self->_rendererOptions, 0);
  __destructor_8_s0_AB8s32n16_S_s8_AE((id *)&self->_bloomChain.texture);
  objc_storeStrong((id *)&self->_contentMaskLayer, 0);
  for (i = 2; i != -1; --i)
    objc_storeStrong((id *)&self->_contentMaskSurfaces[i], 0);
  for (j = 2; j != -1; --j)
    objc_storeStrong((id *)&self->_contentMaskTextures[j], 0);
  objc_storeStrong((id *)&self->_offscreenPosts, 0);
  objc_storeStrong((id *)&self->_offscreenBloom, 0);
  for (k = 2; k != -1; --k)
    objc_storeStrong((id *)&self->_offscreenScenes[k], 0);
  for (m = 2; m != -1; --m)
    objc_storeStrong((id *)&self->_renderUniformsBuffers[m], 0);
  objc_storeStrong((id *)&self->_textureGroup, 0);
  objc_storeStrong((id *)&self->_resourceManager, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (void)getUniformsBufferForFrameBufferIndex:(uint64_t)a3 pContents:(uint64_t)a4 pOffset:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2134A1000, a1, a3, "failed to create buffer, reverting to dummyUniforms", a5, a6, a7, a8, 0);
}

- (void)_setupBloomChainWithViewport:bloomTexture:.cold.1()
{
  __assert_rtn("-[NUNICalliopeRenderer _setupBloomChainWithViewport:bloomTexture:]", "NUNICalliopeRenderer.m", 2033, "texture != nil");
}

- (void)_setupBloomChainWithViewport:bloomTexture:.cold.2()
{
  __assert_rtn("-[NUNICalliopeRenderer _setupBloomChainWithViewport:bloomTexture:]", "NUNICalliopeRenderer.m", 2080, "levelSx > 0");
}

- (void)_setupBloomChainWithViewport:bloomTexture:.cold.3()
{
  __assert_rtn("-[NUNICalliopeRenderer _setupBloomChainWithViewport:bloomTexture:]", "NUNICalliopeRenderer.m", 2081, "levelSy > 0");
}

- (void)_computeBloomChainTextures:.cold.1()
{
  __assert_rtn("-[NUNICalliopeRenderer _computeBloomChainTextures:]", "NUNICalliopeRenderer.m", 2117, "downsamplePipelineState != nil");
}

- (void)_computeBloomChainTextures:.cold.2()
{
  __assert_rtn("-[NUNICalliopeRenderer _computeBloomChainTextures:]", "NUNICalliopeRenderer.m", 2118, "upsamplePipelineState != nil");
}

- (void)_computeBloomChainTextures:.cold.3()
{
  __assert_rtn("-[NUNICalliopeRenderer _computeBloomChainTextures:]", "NUNICalliopeRenderer.m", 2160, "source->texture != nil");
}

- (void)_computeBloomChainTextures:.cold.4()
{
  __assert_rtn("-[NUNICalliopeRenderer _computeBloomChainTextures:]", "NUNICalliopeRenderer.m", 2161, "destination->texture != nil");
}

- (void)_computeBloomChainTextures:.cold.5()
{
  __assert_rtn("-[NUNICalliopeRenderer _computeBloomChainTextures:]", "NUNICalliopeRenderer.m", 2135, "source->texture != nil");
}

- (void)_computeBloomChainTextures:.cold.6()
{
  __assert_rtn("-[NUNICalliopeRenderer _computeBloomChainTextures:]", "NUNICalliopeRenderer.m", 2136, "destination->texture != nil");
}

@end
