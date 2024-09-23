@implementation NUNIGlobetrotterRenderer

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
  simd_float4 v24;
  simd_float4 v25;
  simd_float4 v26;
  simd_float4 v27;
  simd_float4 v28;
  simd_float4 v29;
  simd_float4 v30;
  simd_float4 v31;
  simd_float4x4 v32;
  simd_float4 v33;
  simd_float4 v34;
  simd_float4 v35;
  simd_float4 v36;
  __int128 v37;
  __int128 v38;
  float v39;
  float v40;
  __float2 v41;
  __float2 v42;
  float32x4_t v43;
  __int128 v44;
  float v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  uint64_t v51;
  id v52;
  double (**v53)(_QWORD, double);
  id v54;
  double (**v55)(_QWORD, double);
  double (**v56)(_QWORD, double);
  float32x4_t v57;
  float32x4_t v58;
  float32x4_t v59;
  float32x4_t v60;
  float32x4_t v61;
  float32x4_t v62;
  float32x4_t v63;
  float32x4_t v64;
  float32x4_t v65;
  __int128 v66;
  int v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  float32x4_t v72;
  float32x4_t v73;
  float32x4_t v74;
  float32x4_t v75;
  float32x4_t v76;
  float32x4_t v77;
  float32x4_t v78;
  float32x4_t v79;
  float32x4_t v80;
  float32x4_t v81;
  float32x4_t v82;
  float32x4_t v83;
  float32x4_t v84;
  float32x4_t v85;
  float32x4_t v86;
  simd_float4 v87;
  float32x4_t v88;
  simd_float4 v89;
  float32x4_t v90;
  simd_float4 v91;
  float32x4_t v92;
  simd_float4 v93;
  float v94;
  float v95;
  simd_float4 v96;
  simd_float4 v97;
  simd_float4 v98;
  simd_float4 v99;
  simd_float4 v100;
  simd_float4 v101;
  simd_float4 v102;
  simd_float4 v103;
  __int128 v104;
  float v105;
  _QWORD v106[4];
  id v107;
  _QWORD aBlock[4];
  id v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  float32x4_t v113;
  float32x4_t v114;
  float32x4_t v115;
  float32x4_t v116;
  float32x4_t v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  _OWORD v140[8];
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  simd_float4x4 v146;
  simd_float4x4 v147;
  simd_float4x4 v148;

  v8 = a3;
  v9 = a5;
  objc_msgSend(v9, "position");
  v104 = v10;
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
  v96 = v18;
  v98 = v17;
  v100 = v16;
  v102 = v15;
  *(double *)v23.columns[0].i64 = UMFloat4x4MakeTranslate();
  if (v13 == 0.0)
  {
    v32.columns[1] = v100;
    v32.columns[0] = v102;
    v32.columns[3] = v96;
    v32.columns[2] = v98;
  }
  else
  {
    v91 = v23.columns[1];
    v93 = v23.columns[0];
    v87 = v23.columns[3];
    v89 = v23.columns[2];
    *(double *)v24.i64 = UMFloat4x4MakeRotateZ(v13 + 0.0);
    v147.columns[0] = v24;
    v147.columns[1] = v25;
    v147.columns[2] = v26;
    v147.columns[3] = v27;
    v146.columns[1] = v100;
    v146.columns[0] = v102;
    v146.columns[3] = v96;
    v146.columns[2] = v98;
    *(double *)v28.i64 = UMMul(v146, v147);
    v32.columns[0] = v28;
    v32.columns[1] = v29;
    v23.columns[1] = v91;
    v23.columns[0] = v93;
    v32.columns[2] = v30;
    v32.columns[3] = v31;
    v23.columns[3] = v87;
    v23.columns[2] = v89;
  }
  *(double *)v33.i64 = UMMul(v23, v32);
  if (v11)
  {
    if (v11 == 1)
      -[NUNIGlobetrotterRenderer draw3DWithEncoder:state:spheroid:].cold.1();
  }
  else
  {
    v143 = 0u;
    v144 = 0u;
    v141 = 0u;
    v142 = 0u;
    v138 = 0u;
    v139 = 0u;
    v136 = 0u;
    v137 = 0u;
    v134 = 0u;
    v135 = 0u;
    v132 = 0u;
    v133 = 0u;
    v130 = 0u;
    v131 = 0u;
    v128 = 0u;
    v129 = 0u;
    v126 = 0u;
    v127 = 0u;
    v124 = 0u;
    v125 = 0u;
    v122 = 0u;
    v123 = 0u;
    v120 = 0u;
    v121 = 0u;
    v118 = 0u;
    v119 = 0u;
    v116 = 0u;
    v117 = 0u;
    v114 = 0u;
    v115 = 0u;
    v112 = 0u;
    v113 = 0u;
    v110 = 0u;
    v111 = 0u;
    v101 = v34;
    v103 = v33;
    v97 = v36;
    v99 = v35;
    -[NUNIClassicRenderer bindAssetArt:renderEncoder:toSlot:](self, "bindAssetArt:renderEncoder:toSlot:", 3, v8, 0);
    objc_msgSend(v8, "setFragmentTexture:atIndex:", self->_globeLinesCurrentTexture, 1);
    v145 = v104;
    v140[0] = v103;
    v140[1] = v101;
    v140[2] = v99;
    v140[3] = v97;
    v37 = *(_OWORD *)&a4[4].collectionType;
    v140[4] = *(_OWORD *)&a4[4].viewport.width;
    v140[5] = v37;
    v38 = *(_OWORD *)&a4[5].viewport.width;
    v140[6] = *(_OWORD *)&a4[4].octGeomRange.start;
    v140[7] = v38;
    objc_msgSend(v9, "light");
    v94 = v39;
    v41 = __sincosf_stret(v40);
    v42 = __sincosf_stret(v94);
    v43.f32[0] = v42.__cosval * v41.__sinval;
    v43.f32[1] = v42.__sinval * v41.__sinval;
    v43.i64[1] = LODWORD(v41.__cosval);
    *(double *)&v44 = UMMul(*(float32x4_t *)&a4[4].viewport.width, *(float32x4_t *)&a4[4].collectionType, *(float32x4_t *)&a4[4].octGeomRange.start, *(float32x4_t *)&a4[5].viewport.width, v43);
    v111 = v44;
    objc_msgSend(v9, "blend");
    v105 = v45;
    v46 = (float)((float)(v45 * 0.35) + (float)((float)(1.0 - v45) * 0.72));
    v47 = (float)((float)(v45 * 0.0) + (float)((float)(1.0 - v45) * 0.92157));
    v48 = (float)((float)(v45 * 0.15) + (float)((float)(1.0 - v45) * 0.98431));
    v49 = (float)((float)(v45 * 0.25) + (float)((float)(1.0 - v45) * 0.54902));
    v95 = 1.0 - v45;
    v50 = (float)((float)(v45 * 0.56) + (float)((float)(1.0 - v45) * 0.87843));
    v51 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __61__NUNIGlobetrotterRenderer_draw3DWithEncoder_state_spheroid___block_invoke;
    aBlock[3] = &unk_24CFD74C0;
    v52 = v9;
    v109 = v52;
    v53 = (double (**)(_QWORD, double))_Block_copy(aBlock);
    v106[0] = v51;
    v106[1] = 3221225472;
    v106[2] = __61__NUNIGlobetrotterRenderer_draw3DWithEncoder_state_spheroid___block_invoke_2;
    v106[3] = &unk_24CFD74C0;
    v54 = v52;
    v107 = v54;
    v55 = (double (**)(_QWORD, double))_Block_copy(v106);
    v56 = v55;
    if (v105 == 0.0)
    {
      *(double *)v57.i64 = v55[2](v55, v46);
      v117 = v57;
      *(double *)v58.i64 = v56[2](v56, v47);
      v116 = v58;
      *(double *)v59.i64 = v56[2](v56, v48);
      v115 = v59;
      *(double *)v60.i64 = v56[2](v56, v49);
      v114 = v60;
      *(double *)v61.i64 = v56[2](v56, v50);
    }
    else
    {
      *(double *)v62.i64 = v53[2](v53, v46);
      if (v105 == 1.0)
      {
        v117 = v62;
        *(double *)v63.i64 = v53[2](v53, v47);
        v116 = v63;
        *(double *)v64.i64 = v53[2](v53, v48);
        v115 = v64;
        *(double *)v65.i64 = v53[2](v53, v49);
        v114 = v65;
        *(double *)v61.i64 = v53[2](v53, v50);
      }
      else
      {
        v90 = v62;
        *(double *)v72.i64 = v53[2](v53, v47);
        v92 = v72;
        *(double *)v73.i64 = v53[2](v53, v48);
        v88 = v73;
        *(double *)v74.i64 = v53[2](v53, v49);
        v86 = v74;
        *(double *)v75.i64 = v53[2](v53, v50);
        v85 = v75;
        *(double *)v76.i64 = v56[2](v56, v46);
        v84 = v76;
        *(double *)v77.i64 = v56[2](v56, v47);
        v83 = v77;
        *(double *)v78.i64 = v56[2](v56, v48);
        v82 = v78;
        *(double *)v79.i64 = v56[2](v56, v49);
        v81 = v79;
        *(double *)v80.i64 = v56[2](v56, v50);
        v116 = vmlaq_n_f32(vmulq_n_f32(v92, v105), v83, v95);
        v117 = vmlaq_n_f32(vmulq_n_f32(v90, v105), v84, v95);
        v114 = vmlaq_n_f32(vmulq_n_f32(v86, v105), v81, v95);
        v115 = vmlaq_n_f32(vmulq_n_f32(v88, v105), v82, v95);
        v61 = vmlaq_n_f32(vmulq_n_f32(v85, v105), v80, v95);
      }
    }
    v113 = v61;
    objc_msgSend(v54, "colorize");
    CLKUIConvertToRGBfFromSRGBf_fast();
    v110 = v66;
    objc_msgSend(v54, "opacity");
    LODWORD(v112) = v67;
    v148.columns[1] = v101;
    v148.columns[0] = v103;
    v148.columns[3] = v97;
    v148.columns[2] = v99;
    *(double *)&v68 = UMMul(*(simd_float4x4 *)&a4[5].collectionType, v148);
    v141 = v68;
    v142 = v69;
    v143 = v70;
    v144 = v71;
    objc_msgSend(v8, "setVertexBytes:length:atIndex:", v140, 208, 1);
    objc_msgSend(v8, "setFragmentBytes:length:atIndex:", &v110, 480, 0);

  }
  objc_msgSend(v8, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:", 3, a4->octGeomRange.count, 0, (_QWORD)-[NUNIClassicRenderer resources](self, "resources")[40], 2 * a4->octGeomRange.start);
  objc_msgSend(v8, "setCullMode:", 0);

}

uint64_t __61__NUNIGlobetrotterRenderer_draw3DWithEncoder_state_spheroid___block_invoke(uint64_t a1, double a2)
{
  if (a2 >= 0.5)
  {
    objc_msgSend(*(id *)(a1 + 32), "colorize");
    __asm { FMOV            V0.4S, #1.0 }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "colorize");
  }
  return CLKUIConvertToRGBfFromSRGBf_fast();
}

uint64_t __61__NUNIGlobetrotterRenderer_draw3DWithEncoder_state_spheroid___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "colorize");
  return CLKUIConvertToRGBfFromSRGBf_fast();
}

- (void)drawOffscreen3DWithCommandBuffer:(id)a3 state:(const NUNIClassicRendererState *)a4 spheroid:(id)a5
{
  id v8;
  MTLTexture *v9;
  MTLTexture *globeLinesCurrentTexture;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  id v14;

  v14 = a3;
  v8 = a5;
  if (!objc_msgSend(v8, "programType")
    && !UMFloat4x4Equal(*(simd_float4x4 *)&a4[4].viewport.width, *(simd_float4x4 *)self->_anon_1d0))
  {
    -[NUNIGlobetrotterRenderer _renderGlobeLinesWithCommandBuffer:state:spheroid:](self, "_renderGlobeLinesWithCommandBuffer:state:spheroid:", v14, a4, v8);
    v9 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    globeLinesCurrentTexture = self->_globeLinesCurrentTexture;
    self->_globeLinesCurrentTexture = v9;

    v11 = *(_OWORD *)&a4[4].viewport.width;
    v12 = *(_OWORD *)&a4[4].collectionType;
    v13 = *(_OWORD *)&a4[5].viewport.width;
    *(_OWORD *)&self->_anon_1d0[32] = *(_OWORD *)&a4[4].octGeomRange.start;
    *(_OWORD *)&self->_anon_1d0[48] = v13;
    *(_OWORD *)self->_anon_1d0 = v11;
    *(_OWORD *)&self->_anon_1d0[16] = v12;
  }

}

- (id)_renderGlobeLinesWithCommandBuffer:(id)a3 state:(const NUNIClassicRendererState *)a4 spheroid:(id)a5
{
  id v7;
  CLKUIMetalResourcePool *globeLineTextureResourcePool;
  void *v9;
  CLKUIMetalResourcePool *v10;
  CLKUIMetalResourcePool *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  uint64_t i;
  float v26;
  unint64_t j;
  float v28;
  unint64_t v29;
  __int128 v30;
  _QWORD v37[4];
  _OWORD v38[28];
  __int128 v39;
  __int128 v40;

  v7 = a3;
  globeLineTextureResourcePool = self->_globeLineTextureResourcePool;
  if (!globeLineTextureResourcePool)
  {
    objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 10, a4->viewport.width, a4->viewport.height, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setUsage:", 5);
    objc_msgSend(MEMORY[0x24BE16F50], "texturePoolWithDescriptor:expectedCountPerFrame:", v9, 3);
    v10 = (CLKUIMetalResourcePool *)objc_claimAutoreleasedReturnValue();
    v11 = self->_globeLineTextureResourcePool;
    self->_globeLineTextureResourcePool = v10;

    globeLineTextureResourcePool = self->_globeLineTextureResourcePool;
  }
  -[CLKUIMetalResourcePool dequeueReusableResourceForUseOnCommandBuffer:](globeLineTextureResourcePool, "dequeueReusableResourceForUseOnCommandBuffer:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "colorAttachments");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTexture:", v12);

  objc_msgSend(v13, "colorAttachments");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setLoadAction:", 2);

  objc_msgSend(v13, "colorAttachments");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setClearColor:", 0.0, 0.0, 0.0, 0.0);

  objc_msgSend(v13, "colorAttachments");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setStoreAction:", 1);

  objc_msgSend(v7, "renderCommandEncoderWithDescriptor:", v13);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setRenderPipelineState:", (_QWORD)-[NUNIClassicRenderer resources](self, "resources")[24]);
  v39 = 0u;
  v40 = 0u;
  memset(&v38[4], 0, 384);
  v23 = *(_OWORD *)&a4[4].collectionType;
  v38[0] = *(_OWORD *)&a4[4].viewport.width;
  v38[1] = v23;
  v24 = *(_OWORD *)&a4[5].viewport.width;
  v38[2] = *(_OWORD *)&a4[4].octGeomRange.start;
  v38[3] = v24;
  for (i = 8; i != 32; ++i)
  {
    v26 = (float)(unint64_t)(i - 8) * 6.28318531 / 24.0;
    *((__float2 *)v38 + i) = __sincosf_stret(v26);
  }
  for (j = 0; j != 12; ++j)
  {
    v28 = (float)j * 3.14159265 / 12.0;
    v29 = (unint64_t)__sincosf_stret(v28);
    *(double *)&v30 = UMMul(*(float32x4_t *)&a4[4].viewport.width, *(float32x4_t *)&a4[4].collectionType, *(float32x4_t *)&a4[4].octGeomRange.start, *(float32x4_t *)&a4[5].viewport.width, (float32x4_t)v29);
    v38[j + 16] = v30;
  }
  *(double *)&_Q0 = UMMul(*(float32x4_t *)&a4[4].viewport.width, *(float32x4_t *)&a4[4].collectionType, *(float32x4_t *)&a4[4].octGeomRange.start, *(float32x4_t *)&a4[5].viewport.width, (float32x4_t)xmmword_2134DBD80);
  v39 = _Q0;
  v37[0] = 0;
  v37[1] = 0x3F80000000000000;
  v37[2] = 1065353216;
  __asm { FMOV            V0.2S, #1.0 }
  v37[3] = _Q0;
  objc_msgSend(v22, "setVertexBytes:length:atIndex:", v37, 32, 1);
  objc_msgSend(v22, "setFragmentBytes:length:atIndex:", v38, 480, 0);
  objc_msgSend(v22, "drawPrimitives:vertexStart:vertexCount:", 4, 0, 4);
  objc_msgSend(v22, "setCullMode:", 0);
  objc_msgSend(v22, "endEncoding");

  return v12;
}

- (void)_createPipelineForProgramType:(unint64_t)a3 fromLibrary:(id)a4
{
  unint64_t v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NUNIClassicRendererResources *v36;
  MTLRenderPipelineState *v37;
  id v38;

  v38 = a4;
  v6 = -[NUNIRenderer pixelFormat](self, "pixelFormat");
  v7 = CFSTR("classic_sprite_vsh");
  v8 = CFSTR("classic_sprite_fsh");
  v9 = CFSTR("NUNIClassicShaders");
  switch(a3)
  {
    case 0uLL:
      v7 = CFSTR("globetrotter_globe_vsh");
      v8 = CFSTR("globetrotter_globe_fsh");
      goto LABEL_5;
    case 1uLL:
      goto LABEL_6;
    case 2uLL:
      v7 = CFSTR("classic_luna_vsh");
      v8 = CFSTR("classic_luna_fsh");
      goto LABEL_6;
    case 3uLL:
      v7 = CFSTR("globetrotter_lines_vsh");
      v8 = CFSTR("globetrotter_lines_fsh");
      v6 = 10;
LABEL_5:
      v9 = CFSTR("NUNIGlobetrotterShaders");
LABEL_6:
      v10 = (void *)MEMORY[0x24BE16F40];
      NUNIBundle();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NUNIClassicRenderer mtlDevice](self, "mtlDevice");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "archiveWithName:bundle:device:", v9, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDDD5B0], "functionDescriptor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setName:", v7);
      v15 = (void *)objc_msgSend(v13, "newFunctionInLibrary:withDescriptor:", v38, v14);
      objc_msgSend(v14, "setName:", v8);
      v16 = (void *)objc_msgSend(v13, "newFunctionInLibrary:withDescriptor:", v38, v14);
      v17 = objc_alloc_init(MEMORY[0x24BDDD6B8]);
      objc_msgSend(v17, "setLabel:", _NUNIGlobetrotterPipelineNames[a3]);
      objc_msgSend(v17, "setVertexFunction:", v15);
      objc_msgSend(v17, "setFragmentFunction:", v16);
      objc_msgSend(v17, "colorAttachments");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setPixelFormat:", v6);

      objc_msgSend(v17, "colorAttachments");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setBlendingEnabled:", 1);

      objc_msgSend(v17, "colorAttachments");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setRgbBlendOperation:", 0);

      objc_msgSend(v17, "colorAttachments");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setAlphaBlendOperation:", 0);

      objc_msgSend(v17, "colorAttachments");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setSourceRGBBlendFactor:", 1);

      objc_msgSend(v17, "colorAttachments");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "objectAtIndexedSubscript:", 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setSourceAlphaBlendFactor:", 1);

      objc_msgSend(v17, "colorAttachments");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectAtIndexedSubscript:", 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setDestinationRGBBlendFactor:", 5);

      objc_msgSend(v17, "colorAttachments");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objectAtIndexedSubscript:", 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setDestinationAlphaBlendFactor:", 5);

      -[NUNIClassicRenderer mtlDevice](self, "mtlDevice");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v13, "newRenderPipelineStateForDevice:withDescriptor:", v34, v17);
      v36 = -[NUNIClassicRenderer resources](self, "resources");
      v37 = v36->pipelines[a3];
      v36->pipelines[a3] = (MTLRenderPipelineState *)v35;

      if (!(_QWORD)-[NUNIClassicRenderer resources](self, "resources")[8 * a3])
        -[NUNIGlobetrotterRenderer _createPipelineForProgramType:fromLibrary:].cold.2();

      return;
    default:
      -[NUNIGlobetrotterRenderer _createPipelineForProgramType:fromLibrary:].cold.1();
  }
}

- (void)_initPrograms
{
  void *v3;
  void *v4;
  id v5;

  NUNIBundle();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NUNIClassicRenderer mtlDevice](self, "mtlDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "newDefaultLibraryWithBundle:error:", v5, 0);

  -[NUNIGlobetrotterRenderer _createPipelineForProgramType:fromLibrary:](self, "_createPipelineForProgramType:fromLibrary:", 0, v4);
  -[NUNIGlobetrotterRenderer _createPipelineForProgramType:fromLibrary:](self, "_createPipelineForProgramType:fromLibrary:", 1, v4);
  -[NUNIGlobetrotterRenderer _createPipelineForProgramType:fromLibrary:](self, "_createPipelineForProgramType:fromLibrary:", 2, v4);
  -[NUNIGlobetrotterRenderer _createPipelineForProgramType:fromLibrary:](self, "_createPipelineForProgramType:fromLibrary:", 3, v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_globeLinesCurrentTexture, 0);
  objc_storeStrong((id *)&self->_globeLineTextureResourcePool, 0);
}

- (void)draw3DWithEncoder:state:spheroid:.cold.1()
{
  __assert_rtn("-[NUNIGlobetrotterRenderer draw3DWithEncoder:state:spheroid:]", "NUNIGlobetrotterRenderer.m", 94, "ptype != NUNIProgramTypeSprite");
}

- (void)_createPipelineForProgramType:fromLibrary:.cold.1()
{
  __assert_rtn("-[NUNIGlobetrotterRenderer _createPipelineForProgramType:fromLibrary:]", "NUNIGlobetrotterRenderer.m", 300, "!\"NUNIRenderer: Unknown pipeline program type\");
}

- (void)_createPipelineForProgramType:fromLibrary:.cold.2()
{
  __assert_rtn("-[NUNIGlobetrotterRenderer _createPipelineForProgramType:fromLibrary:]", "NUNIGlobetrotterRenderer.m", 334, "[self resources]->pipelines[programType] != nil");
}

@end
