@implementation NUNIClassicRenderer

- (NUNIClassicRendererResources)resources
{
  return &self->_resources;
}

- (void)discard
{
  NUNIClassicRendererResources *p_resources;
  MTLBuffer *vertexBuffer;
  MTLBuffer *indexBuffer;
  uint64_t i;
  MTLRenderPipelineState *v6;

  p_resources = &self->_resources;
  vertexBuffer = self->_resources.vertexBuffer;
  self->_resources.vertexBuffer = 0;

  indexBuffer = p_resources->indexBuffer;
  p_resources->indexBuffer = 0;

  for (i = 0; i != 4; ++i)
  {
    v6 = p_resources->pipelines[i];
    p_resources->pipelines[i] = 0;

  }
}

- (NUNIClassicRenderer)initWithPixelFormat:(unint64_t)a3 textureSuffix:(id)a4 rendererStyle:(unint64_t)a5
{
  id v8;
  NUNIClassicRenderer *v9;
  uint64_t v10;
  MTLDevice *mtlDevice;
  uint64_t v12;
  NUNIClassicResourceManager *resourceManager;
  uint64_t v14;
  NUNIClassicTextureGroup *textureGroup;
  objc_super v17;

  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)NUNIClassicRenderer;
  v9 = -[NUNIRenderer initWithPixelFormat:textureSuffix:rendererStyle:](&v17, sel_initWithPixelFormat_textureSuffix_rendererStyle_, a3, v8, a5);
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BE16F48], "sharedDevice");
    v10 = objc_claimAutoreleasedReturnValue();
    mtlDevice = v9->_mtlDevice;
    v9->_mtlDevice = (MTLDevice *)v10;

    +[NUNIClassicResourceManager sharedInstance](NUNIClassicResourceManager, "sharedInstance");
    v12 = objc_claimAutoreleasedReturnValue();
    resourceManager = v9->_resourceManager;
    v9->_resourceManager = (NUNIClassicResourceManager *)v12;

    -[NUNIClassicResourceManager addClient](v9->_resourceManager, "addClient");
    -[NUNIClassicResourceManager textureGroupWithSuffix:](v9->_resourceManager, "textureGroupWithSuffix:", v8);
    v14 = objc_claimAutoreleasedReturnValue();
    textureGroup = v9->_textureGroup;
    v9->_textureGroup = (NUNIClassicTextureGroup *)v14;

    -[NUNIClassicRenderer _initPrograms](v9, "_initPrograms");
    -[NUNIClassicRenderer _initHemi](v9, "_initHemi");
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[NUNIClassicResourceManager removeClient](self->_resourceManager, "removeClient");
  v3.receiver = self;
  v3.super_class = (Class)NUNIClassicRenderer;
  -[NUNIRenderer dealloc](&v3, sel_dealloc);
}

- (void)_initHemi
{
  id v3;
  unsigned int v4;
  id v5;
  uint64_t v6;
  unsigned int v7;
  MTLBuffer *v8;
  MTLBuffer *vertexBuffer;
  MTLBuffer *v10;
  MTLBuffer *indexBuffer;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = (id)objc_opt_new();
  v4 = _NTKCreateHalfOctahedron(v3, 1.0);
  _NTKCreateHalfOctahedron(v3, -1.0);

  self->_octahedronGeomRange = (NUNIClassicGeometryRange)(v4 | 0xD8000000000);
  v14 = 0;
  v12 = xmmword_2134E8FB0;
  v13 = 0x3F0000003E000001;
  v17 = 0;
  v15 = xmmword_2134E8FC0;
  v16 = 0x3F0000003F600000;
  v20 = 0;
  v18 = xmmword_2134E8FD0;
  v19 = 0x3F0000003EC00000;
  v23 = 0;
  v21 = xmmword_2134E8FE0;
  v22 = 0x3F0000003F200000;
  v5 = v3;
  v6 = objc_msgSend(v5, "addVertices:count:", &v12, 4);
  v7 = objc_msgSend(v5, "addIndices:count:vbase:", &_NTKCreateQuad_indices, 4, v6, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23);

  self->_quadGeomRange = (NUNIClassicGeometryRange)(v7 | 0x400000000);
  v8 = (MTLBuffer *)-[MTLDevice newBufferWithBytes:length:options:](self->_mtlDevice, "newBufferWithBytes:length:options:", objc_msgSend(v5, "vertices"), 32 * (int)objc_msgSend(v5, "vcount"), 0);
  vertexBuffer = self->_resources.vertexBuffer;
  self->_resources.vertexBuffer = v8;

  v10 = (MTLBuffer *)-[MTLDevice newBufferWithBytes:length:options:](self->_mtlDevice, "newBufferWithBytes:length:options:", objc_msgSend(v5, "indices"), 2 * (int)objc_msgSend(v5, "icount"), 0);
  indexBuffer = self->_resources.indexBuffer;
  self->_resources.indexBuffer = v10;

}

- (void)bindAssetArt:(unint64_t)a3 renderEncoder:(id)a4 toSlot:(unint64_t)a5
{
  NUNIClassicTextureGroup *textureGroup;
  id v8;
  void *v9;
  void *v10;
  id v11;

  textureGroup = self->_textureGroup;
  v8 = a4;
  -[NUNIClassicTextureGroup textures](textureGroup, "textures");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "atlas");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bind:slot:", v8, a5);

}

- (void)draw3DWithEncoder:(id)a3 state:(const NUNIClassicRendererState *)a4 spheroid:(id)a5
{
  id v8;
  id v9;
  __int128 v10;
  uint64_t v11;
  float v12;
  float v13;
  unint64_t projectionType;
  simd_float4 v15;
  simd_float4 v16;
  simd_float4 v17;
  simd_float4 v18;
  float v19;
  float v20;
  float v21;
  float v22;
  simd_float4x4 v23;
  uint64_t v24;
  float v25;
  simd_float4 v26;
  simd_float4 v27;
  simd_float4 v28;
  simd_float4 v29;
  simd_float4 v30;
  simd_float4 v31;
  simd_float4 v32;
  simd_float4 v33;
  simd_float4x4 v34;
  simd_float4 v35;
  simd_float4 v36;
  simd_float4 v37;
  simd_float4 v38;
  float v39;
  float v40;
  __float2 v41;
  __float2 v42;
  float32x4_t v43;
  const NUNIClassicRendererState *v44;
  simd_float4 v45;
  __int128 v46;
  __int128 v47;
  float v48;
  simd_float4 v49;
  float v50;
  __int32 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  void *v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  float v61;
  int v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  simd_float4 v67;
  simd_float4 v68;
  simd_float4 v69;
  float v70;
  simd_float4 v71;
  simd_float4 v72;
  simd_float4 v73;
  simd_float4 v74;
  simd_float4x4 v75;
  simd_float4 v76;
  simd_float4 v77;
  simd_float4 v78;
  __int128 v79;
  simd_float4 v80;
  simd_float4 v81;
  simd_float4 v82;
  simd_float4 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  simd_float4 v89;
  uint64_t v90;
  uint64_t v91;
  simd_float4 v92;
  simd_float4 v93;
  simd_float4 v94;
  simd_float4 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  uint64_t v105;
  uint64_t v106;
  simd_float4x4 v107;
  simd_float4x4 v108;

  v8 = a3;
  v9 = a5;
  objc_msgSend(v9, "position");
  v79 = v10;
  v11 = objc_msgSend(v9, "programType");
  objc_msgSend(v8, "setFrontFacingWinding:", 1);
  objc_msgSend(v8, "setCullMode:", 2);
  objc_msgSend(v9, "equatorRotation");
  v13 = v12;
  projectionType = a4->projectionType;
  if (projectionType == 1)
  {
    v22 = 1.0;
  }
  else
  {
    v15 = 0uLL;
    v16 = 0uLL;
    v17 = 0uLL;
    v18 = 0uLL;
    if (projectionType)
      goto LABEL_6;
    objc_msgSend(v9, "radius", 0.0, 0.0, 0.0, 0.0);
    v20 = v19;
    objc_msgSend(v9, "radiusScale");
    v22 = v20 * v21;
  }
  UMFloat4x4MakeScale(v22);
LABEL_6:
  v74 = v18;
  v76 = v17;
  v77 = v16;
  v78 = v15;
  *(double *)v23.columns[0].i64 = UMFloat4x4MakeTranslate();
  if (v13 == 0.0)
  {
    v34.columns[1] = v77;
    v34.columns[0] = v78;
    v34.columns[3] = v74;
    v34.columns[2] = v76;
  }
  else
  {
    v69 = v23.columns[1];
    v71 = v23.columns[0];
    v67 = v23.columns[3];
    v68 = v23.columns[2];
    v24 = objc_msgSend(v9, "type");
    v25 = 1.5708;
    if (v24 != 4)
      v25 = 0.0;
    *(double *)v26.i64 = UMFloat4x4MakeRotateZ(v13 + v25);
    v108.columns[0] = v26;
    v108.columns[1] = v27;
    v108.columns[2] = v28;
    v108.columns[3] = v29;
    v107.columns[1] = v77;
    v107.columns[0] = v78;
    v107.columns[3] = v74;
    v107.columns[2] = v76;
    *(double *)v30.i64 = UMMul(v107, v108);
    v34.columns[0] = v30;
    v34.columns[1] = v31;
    v23.columns[1] = v69;
    v23.columns[0] = v71;
    v34.columns[2] = v32;
    v34.columns[3] = v33;
    v23.columns[3] = v67;
    v23.columns[2] = v68;
  }
  *(double *)v35.i64 = UMMul(v23, v34);
  if (v11 == 1)
    -[NUNIClassicRenderer draw3DWithEncoder:state:spheroid:].cold.1();
  v75.columns[0] = v35;
  v75.columns[1] = v36;
  v75.columns[2] = v37;
  v75.columns[3] = v38;
  objc_msgSend(v9, "light");
  v70 = v39;
  v41 = __sincosf_stret(v40);
  v42 = __sincosf_stret(v70);
  v43.f32[0] = v42.__cosval * v41.__sinval;
  v43.f32[1] = v42.__sinval * v41.__sinval;
  v43.i64[1] = LODWORD(v41.__cosval);
  v44 = a4 + 4;
  *(double *)v45.i64 = UMMul(*(float32x4_t *)&a4[4].viewport.width, *(float32x4_t *)&a4[4].collectionType, *(float32x4_t *)&a4[4].octGeomRange.start, *(float32x4_t *)&a4[5].viewport.width, v43);
  if (v11 == 2)
  {
    v90 = 0;
    v91 = 0;
    v73 = v45;
    -[NUNIClassicRenderer bindAssetArt:renderEncoder:toSlot:](self, "bindAssetArt:renderEncoder:toSlot:", 5, v8, 0);
    -[NUNIClassicRenderer bindAssetArt:renderEncoder:toSlot:](self, "bindAssetArt:renderEncoder:toSlot:", 6, v8, 1);
    v104 = v79;
    v92 = v75.columns[0];
    v93 = v75.columns[1];
    v94 = v75.columns[2];
    v95 = v75.columns[3];
    v80 = v75.columns[0];
    v81 = v75.columns[1];
    v82 = v75.columns[2];
    v83 = v75.columns[3];
    v58 = *(_OWORD *)&a4[4].collectionType;
    v96 = *(_OWORD *)&v44->viewport.width;
    v97 = v58;
    v59 = *(_OWORD *)&a4[5].viewport.width;
    v98 = *(_OWORD *)&a4[4].octGeomRange.start;
    v99 = v59;
    v84 = v96;
    v85 = v58;
    v86 = v98;
    v87 = v59;
    v89 = v73;
    objc_msgSend(v9, "colorize");
    v88 = v60;
    objc_msgSend(v9, "opacity");
    v61 = fminf(fmaxf((float)((float)a4->viewport.width + -42.0) / 326.0, 0.0), 1.0);
    LODWORD(v90) = v62;
    *((float *)&v90 + 1) = (float)((float)(v61 * 0.08) + (float)((float)(1.0 - v61) * 0.3)) + 0.17365;
    *(double *)&v63 = UMMul(*(simd_float4x4 *)&a4[5].collectionType, v75);
    v100 = v63;
    v101 = v64;
    v102 = v65;
    v103 = v66;
    objc_msgSend(v8, "setVertexBytes:length:atIndex:", &v92, 208, 1);
    v56 = v8;
    v57 = 176;
    goto LABEL_16;
  }
  if (!v11)
  {
    v106 = 0;
    v105 = 0;
    v82 = 0uLL;
    v72 = v45;
    -[NUNIClassicRenderer bindAssetArt:renderEncoder:toSlot:](self, "bindAssetArt:renderEncoder:toSlot:", 3, v8, 0);
    -[NUNIClassicRenderer bindAssetArt:renderEncoder:toSlot:](self, "bindAssetArt:renderEncoder:toSlot:", 4, v8, 1);
    v104 = v79;
    v92 = v75.columns[0];
    v93 = v75.columns[1];
    v94 = v75.columns[2];
    v95 = v75.columns[3];
    v46 = *(_OWORD *)&a4[4].collectionType;
    v96 = *(_OWORD *)&v44->viewport.width;
    v97 = v46;
    v47 = *(_OWORD *)&a4[5].viewport.width;
    v98 = *(_OWORD *)&a4[4].octGeomRange.start;
    v99 = v47;
    v48 = -(float)(v13
                 - (float)((float)((float)((float)(a4->yearsSince1970 * 32.0) - floorf(a4->yearsSince1970 * 32.0))
                                 * -3.1416)
                         * 2.0));
    *(float *)&v105 = (float)(v48 + (float)(floorf(v48 / 6.2832) * -6.2832)) / 6.2832;
    v81 = v72;
    objc_msgSend(v9, "colorize");
    v80 = v49;
    objc_msgSend(v9, "opacity");
    v50 = fminf(fmaxf((float)((float)a4->viewport.width + -42.0) / 326.0, 0.0), 1.0);
    v82.i32[0] = v51;
    v82.f32[1] = (float)((float)(v50 * 0.08) + (float)((float)(1.0 - v50) * 0.3)) + 0.17365;
    *(double *)&v52 = UMMul(*(simd_float4x4 *)&a4[5].collectionType, v75);
    v100 = v52;
    v101 = v53;
    v102 = v54;
    v103 = v55;
    objc_msgSend(v8, "setVertexBytes:length:atIndex:", &v92, 224, 1);
    v56 = v8;
    v57 = 48;
LABEL_16:
    objc_msgSend(v56, "setFragmentBytes:length:atIndex:", &v80, v57, 0);
  }
  objc_msgSend(v8, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:", 3, a4->octGeomRange.count, 0, self->_resources.indexBuffer, 2 * a4->octGeomRange.start, *(double *)v45.i64);
  objc_msgSend(v8, "setCullMode:", 0);

}

- (void)drawSpriteWithEncoder:(id)a3 state:(const NUNIClassicRendererState *)a4 spheroid:(id)a5
{
  id v8;
  id v9;
  int v10;
  float32x4_t v11;
  simd_float4 v12;
  simd_float4 v13;
  simd_float4 v14;
  uint64_t v15;
  uint64_t v16;
  float v17;
  int32x4_t v25;
  float32x4_t v26;
  float32x4_t v27;
  int32x4_t v28;
  float32x4_t v29;
  float32x4_t v30;
  float32x4_t v31;
  float v33;
  float v34;
  simd_float4 v35;
  simd_float4 v36;
  simd_float4 v37;
  simd_float4 v38;
  simd_float4 v39;
  simd_float4 v40;
  simd_float4 v41;
  simd_float4 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  simd_float4 v47;
  float32x4_t v48;
  simd_float4 v49;
  simd_float4 v50;
  simd_float4 v51;
  int v52;
  _OWORD v53[5];
  simd_float4x4 v54;
  simd_float4x4 v55;
  simd_float4x4 v56;

  v8 = a5;
  v9 = a3;
  v53[4] = s_sprites_0[13 * a4->collectionType + objc_msgSend(v8, "spriteType")];
  objc_msgSend(v8, "opacity");
  v52 = v10;
  objc_msgSend(v8, "position");
  v48 = v11;
  if (objc_msgSend(v8, "isFacing") && !a4->projectionType)
  {
    _Q0 = vsubq_f32(*(float32x4_t *)&a4[1].viewport.width, v48);
    _Q1 = vmulq_f32(_Q0, _Q0);
    _S2 = _Q0.i32[2];
    __asm { FMLA            S1, S2, V0.S[2] }
    _Q1.f32[0] = sqrtf(_Q1.f32[0]);
    v25 = (int32x4_t)vdivq_f32(_Q0, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q1.f32, 0));
    v26 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v25, v25), (int8x16_t)v25, 0xCuLL);
    v27 = (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v25, (int8x16_t)v25, 0xCuLL), (int8x16_t)v25, 8uLL);
    v28 = (int32x4_t)vmlaq_f32(vmulq_f32(v27, vnegq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(*(int32x4_t *)&a4[1].octGeomRange.start, *(int32x4_t *)&a4[1].octGeomRange.start), *(int8x16_t *)&a4[1].octGeomRange.start, 0xCuLL))), v26, (float32x4_t)vextq_s8(vextq_s8(*(int8x16_t *)&a4[1].octGeomRange.start, *(int8x16_t *)&a4[1].octGeomRange.start, 0xCuLL), *(int8x16_t *)&a4[1].octGeomRange.start, 8uLL));
    v29 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v28, v28), (int8x16_t)v28, 0xCuLL);
    v30 = vmulq_f32((float32x4_t)vextq_s8(vextq_s8((int8x16_t)v28, (int8x16_t)v28, 0xCuLL), (int8x16_t)v28, 8uLL), vnegq_f32(v26));
    v28.i32[3] = 0;
    v31 = vmlaq_f32(v30, v29, v27);
    v25.i32[3] = 0;
    v50 = (simd_float4)v28;
    v51 = (simd_float4)v25;
    __asm { FMOV            V0.4S, #1.0 }
    _Q0.i64[0] = v48.i64[0];
    _Q0.i32[2] = v48.i32[2];
    v49 = _Q0;
    objc_msgSend(v8, "radius", v31.i64[0], v31.u32[2]);
  }
  else
  {
    *(double *)v12.i64 = UMFloat4x4MakeTranslate();
    v50 = v12;
    v51 = v13;
    v49 = v14;
    objc_msgSend(v8, "radius", v15, v16);
  }
  v33 = v17;
  objc_msgSend(v8, "radiusScale");
  UMFloat4x4MakeScale(v33 * v34);
  v55.columns[0] = v35;
  v55.columns[1] = v36;
  v55.columns[2] = v37;
  v55.columns[3] = v38;
  v54.columns[0] = v50;
  v54.columns[2] = v51;
  v54.columns[1] = v47;
  v54.columns[3] = v49;
  *(double *)v39.i64 = UMMul(v54, v55);
  v56.columns[0] = v39;
  v56.columns[1] = v40;
  v56.columns[2] = v41;
  v56.columns[3] = v42;
  *(double *)&v43 = UMMul(*(simd_float4x4 *)&a4[5].collectionType, v56);
  v53[0] = v43;
  v53[1] = v44;
  v53[2] = v45;
  v53[3] = v46;
  objc_msgSend(v9, "setVertexBytes:length:atIndex:", v53, 80, 1);
  objc_msgSend(v9, "setFragmentBytes:length:atIndex:", &v52, 4, 0);
  objc_msgSend(v9, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:", 4, a4->quadGeomRange.count, 0, self->_resources.indexBuffer, 2 * a4->quadGeomRange.start);

}

- (void)renderWithScene:(id)a3 viewport:(NUNIViewport)a4 commandBuffer:(id)a5 passDescriptor:(id)a6
{
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  float v18;
  float v19;
  int v20;
  float32x4_t v22;
  int *v28;
  NUNIClassicRenderer *v29;
  NUNIClassicRendererResources *p_resources;
  int *v31;
  uint64_t v32;
  uint64_t j;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t k;
  NUNIClassicRenderer *v39;
  void *v40;
  float32x4_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _OWORD __dst[20];
  _BYTE v47[128];
  _BYTE __base[4];
  int v49;
  _OWORD v50[12];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  objc_msgSend(a5, "renderCommandEncoderWithDescriptor:", a6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  kdebug_trace();
  v39 = self;
  memcpy(__dst, &self->_state, sizeof(__dst));
  memset(v50, 0, sizeof(v50));
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v40 = v9;
  objc_msgSend(v9, "spheroids");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v43 != v15)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_msgSend(v17, "radiusScale", v39);
        if (v18 > 0.00001)
        {
          objc_msgSend(v17, "opacity");
          if (v19 > 0.00001)
          {
            v20 = objc_msgSend(v17, "type");
            if (v20 == 10)
            {
              _S0 = 1258291200;
            }
            else if (v20 == 13)
            {
              _S0 = 1258291198;
            }
            else
            {
              _S0 = 1258291196;
              if (((1 << v20) & 0xFFC000) == 0)
              {
                _S0 = 1258291194;
                if (v20 != 12)
                {
                  v41 = (float32x4_t)__dst[3];
                  objc_msgSend(v17, "position");
                  _S2 = vsubq_f32(v41, v22).i32[2];
                  __asm { FMLA            S0, S2, V1.S[2] }
                }
              }
            }
            v28 = (int *)&__base[8 * v14];
            *v28 = _S0;
            v28[1] = v14;
            objc_storeStrong((id *)v50 + v14++, v17);
          }
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    }
    while (v13);
  }
  else
  {
    v14 = 0;
  }

  qsort(__base, v14, 8uLL, (int (__cdecl *)(const void *, const void *))_NUNIClassicRenderCompareObject);
  v29 = v39;
  p_resources = &v39->_resources;
  objc_msgSend(v10, "setVertexBuffer:offset:atIndex:", v39->_resources.vertexBuffer, 0, 0);
  if (v14 >= 1)
  {
    v31 = &v49;
    v32 = 4;
    for (j = v14; j; --j)
    {
      v34 = *v31;
      v31 += 2;
      v35 = *((id *)v50 + v34);
      if (objc_msgSend(v35, "isVisible"))
      {
        v36 = objc_msgSend(v35, "programType");
        if (v32 == v36)
        {
          if (v32 != 1)
            goto LABEL_29;
        }
        else
        {
          v37 = v36;
          objc_msgSend(v10, "setRenderPipelineState:", p_resources->pipelines[v36]);
          v32 = v37;
          if (v37 != 1)
          {
LABEL_29:
            -[NUNIClassicRenderer draw3DWithEncoder:state:spheroid:](v29, "draw3DWithEncoder:state:spheroid:", v10, __dst, v35, v39);
            goto LABEL_30;
          }
          -[NUNIClassicRenderer bindAssetArt:renderEncoder:toSlot:](v29, "bindAssetArt:renderEncoder:toSlot:", 0, v10, 0);
        }
        -[NUNIClassicRenderer drawSpriteWithEncoder:state:spheroid:](v29, "drawSpriteWithEncoder:state:spheroid:", v10, __dst, v35, v39);
        v32 = 1;
      }
LABEL_30:

    }
  }
  kdebug_trace();
  objc_msgSend(v10, "endEncoding");
  for (k = 184; k != -8; k -= 8)

}

- (void)renderOffscreenWithScene:(id)a3 viewport:(NUNIViewport)a4 commandBuffer:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  float v16;
  float v17;
  int v18;
  int v19;
  float32x4_t v21;
  int *v27;
  uint64_t v28;
  int *v29;
  uint64_t v30;
  id v31;
  uint64_t j;
  id v33;
  void *v34;
  float32x4_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _OWORD __dst[20];
  _BYTE v41[128];
  _BYTE __base[4];
  int v43;
  _OWORD v44[12];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v33 = a5;
  kdebug_trace();
  -[NUNIClassicRenderer _updateStateWithScene:viewport:](self, "_updateStateWithScene:viewport:", v8, a4);
  memcpy(__dst, &self->_state, sizeof(__dst));
  memset(v44, 0, sizeof(v44));
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v34 = v8;
  objc_msgSend(v8, "spheroids");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (!v10)
  {
    v12 = 0;
    goto LABEL_21;
  }
  v11 = v10;
  v12 = 0;
  v13 = *(_QWORD *)v37;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v37 != v13)
        objc_enumerationMutation(v9);
      v15 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
      objc_msgSend(v15, "radiusScale", v33);
      if (v16 > 0.00001)
      {
        objc_msgSend(v15, "opacity");
        if (v17 > 0.00001)
        {
          v18 = objc_msgSend(v15, "type");
          if (v18 == 10)
          {
            v19 = 1266679808;
LABEL_12:
            _S0 = v19;
          }
          else
          {
            if (v18 == 13)
            {
              v19 = 1266679807;
              goto LABEL_12;
            }
            _S0 = 1266679806;
            if (((1 << v18) & 0xFFC000) == 0)
            {
              _S0 = 1266679805;
              if (v18 != 12)
              {
                v35 = (float32x4_t)__dst[3];
                objc_msgSend(v15, "position");
                _S2 = vsubq_f32(v35, v21).i32[2];
                __asm { FMLA            S0, S2, V1.S[2] }
              }
            }
          }
          v27 = (int *)&__base[8 * v12];
          *v27 = _S0;
          v27[1] = v12;
          objc_storeStrong((id *)v44 + v12++, v15);
          continue;
        }
      }
    }
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  }
  while (v11);
LABEL_21:

  qsort(__base, v12, 8uLL, (int (__cdecl *)(const void *, const void *))_NUNIClassicRenderCompareObject);
  if (v12 >= 1)
  {
    v28 = v12;
    v29 = &v43;
    do
    {
      v30 = *v29;
      v29 += 2;
      v31 = *((id *)v44 + v30);
      if (objc_msgSend(v31, "isVisible") && objc_msgSend(v31, "programType") != 1)
        -[NUNIClassicRenderer drawOffscreen3DWithCommandBuffer:state:spheroid:](self, "drawOffscreen3DWithCommandBuffer:state:spheroid:", v33, __dst, v31);

      --v28;
    }
    while (v28);
  }
  kdebug_trace();
  for (j = 184; j != -8; j -= 8)

}

- (void)_updateStateWithScene:(id)a3 viewport:(NUNIViewport)a4
{
  int width;
  int height;
  id v7;
  float v8;
  float v9;
  float32x4_t v10;
  float32x4_t v11;
  unint64_t v12;
  NUNIClassicGeometryRange octahedronGeomRange;
  NUNIClassicGeometryRange quadGeomRange;
  unint64_t v15;
  float v16;
  float v17;
  int8x16_t v25;
  int32x4_t v26;
  float32x4_t v27;
  float32x4_t v29;
  int32x4_t v34;
  uint64_t v39;
  uint64_t v40;
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
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  simd_float4 v61;
  simd_float4 v62;
  simd_float4 v63;
  simd_float4 v64;
  simd_float4 v65;
  simd_float4 v66;
  simd_float4 v67;
  simd_float4 v68;
  int32x4_t v69;
  float32x4_t v70;
  float32x4_t v71;
  float32x4_t v72;
  float32x4_t v73;
  float v74;
  float v75;
  float v76;
  simd_float4 v77;
  simd_float4 v78;
  simd_float4 v79;
  simd_float4 v80;
  simd_float4 v81;
  simd_float4 v82;
  simd_float4 v83;
  simd_float4 v84;
  simd_float4 v85;
  __float2 v86;
  float32x2_t v87;
  simd_float4 v88;
  simd_float4 v89;
  simd_float4 v90;
  simd_float4 v91;
  simd_float4 v92;
  simd_float4 v93;
  simd_float4 v94;
  simd_float4 v95;
  simd_float4 v96;
  simd_float4 v97;
  simd_float4 v98;
  simd_float4 v99;
  simd_float4 v100;
  simd_float4 v101;
  simd_float4 v102;
  simd_float4x4 v103;
  simd_float4x4 v104;
  simd_float4 v105;
  simd_float4 v106;
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
  float32x4_t v119;
  int8x16_t v120;
  int32x4_t v121;
  float32x4_t v122;
  float32x4_t v123;
  float32x4_t v124;
  simd_float4x4 v125;
  simd_float4x4 v126;
  simd_float4x4 v127;
  simd_float4x4 v128;
  simd_float4x4 v129;
  simd_float4x4 v130;
  simd_float4x4 v131;
  simd_float4x4 v132;

  width = a4.width;
  height = a4.height;
  v7 = a3;
  objc_msgSend(v7, "yearsSince1970");
  v9 = v8;
  objc_msgSend(v7, "cameraPosition");
  v123 = v10;
  objc_msgSend(v7, "cameraTarget");
  v122 = v11;
  v12 = objc_msgSend(v7, "projectionType");
  octahedronGeomRange = self->_octahedronGeomRange;
  quadGeomRange = self->_quadGeomRange;
  v15 = objc_msgSend(v7, "collectionType");
  objc_msgSend(v7, "cameraRoll");
  v17 = v16;
  _Q0 = vsubq_f32(v122, v123);
  _Q1 = vmulq_f32(_Q0, _Q0);
  _S2 = _Q0.i32[2];
  __asm { FMLA            S1, S2, V0.S[2] }
  _Q1.f32[0] = sqrtf(_Q1.f32[0]);
  v124 = vdivq_f32(_Q0, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q1.f32, 0));
  objc_msgSend(v7, "cameraUp");
  v120 = v25;

  v26 = (int32x4_t)v124;
  v27 = (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v26, (int8x16_t)v26, 0xCuLL), (int8x16_t)v26, 8uLL);
  _Q4 = (int32x4_t)v120;
  _Q3 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(_Q4, _Q4), v120, 0xCuLL);
  v29 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v26, v26), (int8x16_t)v26, 0xCuLL);
  _Q2 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(vextq_s8((int8x16_t)_Q4, (int8x16_t)_Q4, 0xCuLL), v120, 8uLL), vnegq_f32(v29)), _Q3, v27);
  _Q3.i32[0] = _Q2.i32[2];
  __asm { FMLA            S4, S3, V2.S[2] }
  _Q3.f32[0] = sqrtf(*(float *)_Q4.i32);
  if (_Q3.f32[0] < 0.00001)
  {
    _Q2 = vmlaq_f32(vmulq_f32(v29, (float32x4_t)xmmword_2134DC490), (float32x4_t)xmmword_2134DBD80, v27);
    _Q3.i64[0] = _Q2.u32[2];
    __asm { FMLA            S4, S3, V2.S[2] }
    _Q3.f32[0] = sqrtf(_S4);
    if (_Q3.f32[0] < 0.00001)
    {
      _Q2 = vmlaq_f32(vmulq_f32(v29, (float32x4_t)xmmword_2134DC4A0), (float32x4_t)xmmword_2134DC4B0, v27);
      _Q3.i64[0] = _Q2.u32[2];
      __asm { FMLA            S4, S3, V2.S[2] }
      _Q3.f32[0] = sqrtf(_S4);
    }
  }
  v34 = (int32x4_t)vdivq_f32(_Q2, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q3.f32, 0));
  _Q0 = vmlaq_f32(vmulq_f32(v27, vnegq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v34, v34), (int8x16_t)v34, 0xCuLL))), v29, (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v34, (int8x16_t)v34, 0xCuLL), (int8x16_t)v34, 8uLL));
  _Q1 = vmulq_f32(_Q0, _Q0);
  _S2 = _Q0.i32[2];
  __asm { FMLA            S1, S2, V0.S[2] }
  _Q1.f32[0] = sqrtf(_Q1.f32[0]);
  v119 = vnegq_f32(vdivq_f32(_Q0, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q1.f32, 0)));
  v121 = v34;
  if (v12)
  {
    __asm { FMOV            V3.2S, #1.0 }
    LODWORD(v39) = _D3;
    if (_NF ^ _VF | _ZF)
    {
      *((float *)&v39 + 1) = (float)height / (float)width;
      v40 = v39;
    }
    else
    {
      *(float *)&_D3 = (float)width / (float)height;
      v40 = _D3;
    }
    v41.f32[0] = UMFloat4x4MakeOrtho(-*(float *)&v40, *(float *)&v40, -*((float *)&v40 + 1), *((float *)&v40 + 1), -0.001, 5.0);
    v115 = v42;
    v117 = v41;
    v111 = v44;
    v113 = v43;
    *(__n64 *)v45.f32 = UMFloat4x4MakeLookAt(*(double *)v121.i64, v119.f32[0]);
    v107 = v46;
    v109 = v45;
    v101 = v48;
    v105 = v47;
    *(double *)v49.i64 = UMFloat4x4MakeTranslate();
    v128.columns[0] = v49;
    v128.columns[1] = v50;
    v128.columns[2] = v51;
    v128.columns[3] = v52;
    v125.columns[1] = v107;
    v125.columns[0] = v109;
    v125.columns[3] = v101;
    v125.columns[2] = v105;
    *(double *)v53.i64 = UMMul(v125, v128);
    v129.columns[0] = v53;
    v108 = v54;
    v110 = v53;
    v129.columns[1] = v54;
    v129.columns[2] = v55;
    v102 = v56;
    v106 = v55;
    v129.columns[3] = v56;
    v126.columns[1] = v115;
    v126.columns[0] = v117;
    v126.columns[3] = v111;
    v126.columns[2] = v113;
    *(double *)&v57 = UMMul(v126, v129);
    v62 = v102;
    v61 = v106;
    v64 = v108;
    v63 = v110;
    v66 = v111;
    v65 = v113;
    v68 = v115;
    v67 = v117;
    v70 = v119;
    v69 = v121;
    v71 = v123;
    v72 = v124;
    v73 = v122;
  }
  else
  {
    v74 = (float)width / (float)height;
    v75 = 20.0;
    if (v74 < 1.0)
    {
      v76 = atanf(0.17633 / v74);
      v75 = (v76 + v76) * 180.0 / 3.14159274;
    }
    v77.f32[0] = UMFloat4x4MakePerspective(v75, (float)width / (float)height, 0.001, 5.0);
    v116 = v78;
    v118 = v77;
    v112 = v80;
    v114 = v79;
    *(__n64 *)v81.f32 = UMFloat4x4MakeLookAt(*(double *)v121.i64, v119.f32[0]);
    v85 = v81;
    if (fabsf(v17) > 0.00001)
    {
      v103.columns[0] = v81;
      v103.columns[1] = v82;
      v103.columns[2] = v83;
      v103.columns[3] = v84;
      v86 = __sincosf_stret(v17 * 0.5);
      v87 = vmul_n_f32(*(float32x2_t *)v124.f32, v86.__sinval);
      *(__n64 *)v88.f32 = UMFloat4x4Make(v87.f32[0], v87.f32[1], vmuls_lane_f32(v86.__sinval, v124, 2), v86.__cosval);
      v130.columns[0] = v88;
      v130.columns[1] = v89;
      v130.columns[2] = v90;
      v130.columns[3] = v91;
      *(double *)v92.i64 = UMMul(v103, v130);
      v85 = v92;
    }
    v104.columns[0] = v85;
    v104.columns[1] = v82;
    v104.columns[2] = v83;
    v104.columns[3] = v84;
    *(double *)v93.i64 = UMFloat4x4MakeTranslate();
    v131.columns[0] = v93;
    v131.columns[1] = v94;
    v131.columns[2] = v95;
    v131.columns[3] = v96;
    *(double *)v97.i64 = UMMul(v104, v131);
    v132.columns[0] = v97;
    v104.columns[2] = v98;
    v104.columns[3] = v97;
    v132.columns[1] = v98;
    v132.columns[2] = v99;
    v104.columns[0] = v100;
    v104.columns[1] = v99;
    v132.columns[3] = v100;
    v127.columns[1] = v116;
    v127.columns[0] = v118;
    v127.columns[3] = v112;
    v127.columns[2] = v114;
    *(double *)&v57 = UMMul(v127, v132);
    v62 = v104.columns[0];
    v61 = v104.columns[1];
    v64 = v104.columns[2];
    v63 = v104.columns[3];
    v66 = v112;
    v65 = v114;
    v68 = v116;
    v67 = v118;
    v71 = v123;
    v72 = v124;
    v69 = v121;
    v73 = v122;
    v70 = v119;
  }
  self->_state.viewport.width = width;
  self->_state.viewport.height = height;
  self->_state.projectionType = v12;
  self->_state.collectionType = v15;
  self->_state.yearsSince1970 = v9;
  self->_state.cameraRoll = v17;
  self->_state.octGeomRange = octahedronGeomRange;
  self->_state.quadGeomRange = quadGeomRange;
  *(float32x4_t *)self->_anon_a0 = v71;
  *(float32x4_t *)&self->_anon_a0[16] = v73;
  *(float32x4_t *)&self->_anon_a0[32] = v70;
  *(int32x4_t *)&self->_anon_a0[48] = v69;
  *(float32x4_t *)&self->_anon_a0[64] = v72;
  *(simd_float4 *)&self->_anon_a0[80] = v67;
  *(simd_float4 *)&self->_anon_a0[96] = v68;
  *(simd_float4 *)&self->_anon_a0[112] = v65;
  *(simd_float4 *)&self->_anon_a0[128] = v66;
  *(simd_float4 *)&self->_anon_a0[144] = v63;
  *(simd_float4 *)&self->_anon_a0[160] = v64;
  *(simd_float4 *)&self->_anon_a0[176] = v61;
  *(simd_float4 *)&self->_anon_a0[192] = v62;
  *(_OWORD *)&self->_anon_a0[208] = v57;
  *(_OWORD *)&self->_anon_a0[224] = v58;
  *(_OWORD *)&self->_anon_a0[240] = v59;
  *(_OWORD *)&self->_anon_a0[256] = v60;
}

- (void)_createPipelineForProgramType:(unint64_t)a3 fromLibrary:(id)a4
{
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NUNIClassicRendererResources *p_resources;
  MTLRenderPipelineState *v19;
  unint64_t v20;
  id v21;

  v21 = a4;
  v20 = -[NUNIRenderer pixelFormat](self, "pixelFormat");
  if (a3 >= 3)
    -[NUNIClassicRenderer _createPipelineForProgramType:fromLibrary:].cold.2();
  v6 = off_24CFD7CB0[a3];
  v7 = off_24CFD7CC8[a3];
  v8 = (void *)MEMORY[0x24BE16F40];
  NUNIBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "archiveWithName:bundle:device:", CFSTR("NUNIClassicShaders"), v9, self->_mtlDevice);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDDD5B0], "functionDescriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setName:", v7);
  v12 = (void *)objc_msgSend(v10, "newFunctionInLibrary:withDescriptor:", v21, v11);
  objc_msgSend(v11, "setName:", v6);
  v13 = (void *)objc_msgSend(v10, "newFunctionInLibrary:withDescriptor:", v21, v11);
  v14 = objc_alloc_init(MEMORY[0x24BDDD6B8]);
  objc_msgSend(v14, "setLabel:", _NUNIClassicPipelineNames[a3]);
  objc_msgSend(v14, "setVertexFunction:", v12);
  objc_msgSend(v14, "setFragmentFunction:", v13);
  objc_msgSend(v14, "colorAttachments");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setPixelFormat:", v20);
  objc_msgSend(v16, "setBlendingEnabled:", 1);
  objc_msgSend(v16, "setRgbBlendOperation:", 0);
  objc_msgSend(v16, "setAlphaBlendOperation:", 0);
  objc_msgSend(v16, "setSourceRGBBlendFactor:", 1);
  objc_msgSend(v16, "setSourceAlphaBlendFactor:", 1);
  objc_msgSend(v16, "setDestinationRGBBlendFactor:", 5);
  objc_msgSend(v16, "setDestinationAlphaBlendFactor:", 5);
  v17 = objc_msgSend(v10, "newRenderPipelineStateForDevice:withDescriptor:", self->_mtlDevice, v14);
  p_resources = &self->_resources;
  v19 = p_resources->pipelines[a3];
  p_resources->pipelines[a3] = (MTLRenderPipelineState *)v17;

  if (!p_resources->pipelines[a3])
    -[NUNIClassicRenderer _createPipelineForProgramType:fromLibrary:].cold.1();

}

- (void)_initPrograms
{
  void *v3;
  id v4;

  NUNIBundle();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)-[MTLDevice newDefaultLibraryWithBundle:error:](self->_mtlDevice, "newDefaultLibraryWithBundle:error:", v4, 0);
  -[NUNIClassicRenderer _createPipelineForProgramType:fromLibrary:](self, "_createPipelineForProgramType:fromLibrary:", 0, v3);
  -[NUNIClassicRenderer _createPipelineForProgramType:fromLibrary:](self, "_createPipelineForProgramType:fromLibrary:", 1, v3);
  -[NUNIClassicRenderer _createPipelineForProgramType:fromLibrary:](self, "_createPipelineForProgramType:fromLibrary:", 2, v3);

}

- (NUNIClassicTextureGroup)textureGroup
{
  return self->_textureGroup;
}

- (MTLDevice)mtlDevice
{
  return self->_mtlDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mtlDevice, 0);
  objc_storeStrong((id *)&self->_textureGroup, 0);
  objc_storeStrong((id *)&self->_resourceManager, 0);
  __destructor_8_AB0s8n4_s0_AE_s32_s40((uint64_t)&self->_resources);
}

- (void)draw3DWithEncoder:state:spheroid:.cold.1()
{
  __assert_rtn("-[NUNIClassicRenderer draw3DWithEncoder:state:spheroid:]", "NUNIClassicRenderer.m", 414, "ptype != NUNIProgramTypeSprite");
}

- (void)_createPipelineForProgramType:fromLibrary:.cold.1()
{
  __assert_rtn("-[NUNIClassicRenderer _createPipelineForProgramType:fromLibrary:]", "NUNIClassicRenderer.m", 821, "_resources.pipelines[programType] != nil");
}

- (void)_createPipelineForProgramType:fromLibrary:.cold.2()
{
  __assert_rtn("-[NUNIClassicRenderer _createPipelineForProgramType:fromLibrary:]", "NUNIClassicRenderer.m", 785, "!\"NUNIRenderer: Unknown pipeline program type\");
}

@end
