@implementation PanoramaParallaxStage

- (PanoramaParallaxStage)initWithContext:(id)a3
{
  id v5;
  PanoramaParallaxStage *v6;
  PanoramaParallaxStage *v7;
  PanoramaParallaxStageShaders *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  PanoramaParallaxStageShaders *shaders;
  MTLTexture *warpedMask;
  uint64_t v14;
  NSMutableArray *preShiftPyramid;
  PanoramaParallaxStage *v16;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PanoramaParallaxStage;
  v6 = -[PanoramaParallaxStage init](&v18, sel_init);
  v7 = v6;
  if (v6
    && (objc_storeStrong((id *)&v6->_metal, a3),
        v8 = [PanoramaParallaxStageShaders alloc],
        v11 = objc_msgSend_initWithContext_(v8, v9, (uint64_t)v5, v10),
        shaders = v7->_shaders,
        v7->_shaders = (PanoramaParallaxStageShaders *)v11,
        shaders,
        v7->_shaders))
  {
    warpedMask = v7->_warpedMask;
    v7->_warpedFrame = 0;
    v7->_warpedMask = 0;

    v14 = objc_opt_new();
    preShiftPyramid = v7->_preShiftPyramid;
    v7->_preShiftPyramid = (NSMutableArray *)v14;

    v16 = v7;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  objc_super v5;

  objc_msgSend_purgeResources(self, a2, v2, v3);
  v5.receiver = self;
  v5.super_class = (Class)PanoramaParallaxStage;
  -[PanoramaParallaxStage dealloc](&v5, sel_dealloc);
}

- (int)resetState
{
  return 0;
}

- (int)_applyWarpToSlice:(id)a3 chroma:(id)a4 mask:(id)a5 preFlow:(id)a6 warpedLuma:(id)a7 warpedChroma:(id)a8 warpedMask:(id)a9
{
  FigMetalContext *metal;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  const char *v47;
  const char *v48;
  const char *v49;
  const char *v50;
  const char *v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  id v69;
  id v70;
  __int128 v71;
  uint64_t v72;
  _QWORD v73[3];
  __int128 v74;
  uint64_t v75;

  metal = self->_metal;
  v70 = a9;
  v69 = a8;
  v17 = a7;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  v21 = a3;
  objc_msgSend_commandQueue(metal, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_commandBuffer(v25, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setLabel_(v29, v30, (uint64_t)CFSTR("Panorama:ParallaxStage:_applyWarpToSlice"), v31);
  objc_msgSend_computeCommandEncoder(v29, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applyWarpToSlice(self->_shaders, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  getThreadgroupSizeForShader(v39, (unint64_t *)&v74);

  objc_msgSend_applyWarpToSlice(self->_shaders, v40, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setComputePipelineState_(v35, v44, (uint64_t)v43, v45);

  objc_msgSend_setTexture_atIndex_(v35, v46, (uint64_t)v21, 0);
  objc_msgSend_setTexture_atIndex_(v35, v47, (uint64_t)v20, 1);
  objc_msgSend_setTexture_atIndex_(v35, v48, (uint64_t)v19, 2);

  objc_msgSend_setTexture_atIndex_(v35, v49, (uint64_t)v18, 3);
  objc_msgSend_setTexture_atIndex_(v35, v50, (uint64_t)v17, 4);

  objc_msgSend_setTexture_atIndex_(v35, v51, (uint64_t)v69, 5);
  objc_msgSend_setTexture_atIndex_(v35, v52, (uint64_t)v70, 6);

  v56 = objc_msgSend_width(v20, v53, v54, v55);
  v60 = objc_msgSend_height(v20, v57, v58, v59);

  v73[0] = v56;
  v73[1] = v60;
  v73[2] = 1;
  v71 = v74;
  v72 = v75;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v35, v61, (uint64_t)v73, (uint64_t)&v71);
  objc_msgSend_endEncoding(v35, v62, v63, v64);
  objc_msgSend_commit(v29, v65, v66, v67);

  return 0;
}

- (int)prepareToProcess:(unint64_t)a3 sliceHeight:(unint64_t)a4
{
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t *p_warpedFrame;
  const char *v16;
  MTLTexture *v17;
  MTLTexture *warpedLuma;
  const char *v19;
  MTLTexture *v20;
  MTLTexture *warpedChroma;
  int v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  MTLTexture *v32;
  MTLTexture *warpedMask;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x24BDAC8D0];
  v35 = *MEMORY[0x24BDC5668];
  v36[0] = MEMORY[0x24BDBD1B8];
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], a2, (uint64_t)v36, (uint64_t)&v35, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_width(self->_warpedLuma, v8, v9, v10) == a3
    && objc_msgSend_height(self->_warpedLuma, v11, v12, v13) == a4)
  {
    goto LABEL_9;
  }
  if (objc_msgSend_purgeResources(self, v11, v12, v13))
    goto LABEL_14;
  p_warpedFrame = (uint64_t *)&self->_warpedFrame;
  if (!self->_warpedFrame)
  {
    CVPixelBufferCreate(0, a3, a4, 0x34323066u, (CFDictionaryRef)v7, &self->_warpedFrame);
    if (!*p_warpedFrame)
      goto LABEL_14;
    objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metal, v16, *p_warpedFrame, 10, 3, 0);
    v17 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    warpedLuma = self->_warpedLuma;
    self->_warpedLuma = v17;

    if (!self->_warpedLuma
      || (objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metal, v19, (uint64_t)self->_warpedFrame, 30, 3, 1), v20 = (MTLTexture *)objc_claimAutoreleasedReturnValue(), warpedChroma = self->_warpedChroma, self->_warpedChroma = v20, warpedChroma, !self->_warpedChroma))
    {
LABEL_14:
      v23 = 0;
      v22 = 2;
      goto LABEL_13;
    }
  }
  if (self->_warpedMask)
  {
LABEL_9:
    v22 = 0;
    v23 = 0;
  }
  else
  {
    objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x24BDDD740], v14, 10, a3 >> 1, a4 >> 1, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setUsage_(v23, v24, 3, v25);
    objc_msgSend_device(self->_metal, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_(v29, v30, (uint64_t)v23, v31);
    warpedMask = self->_warpedMask;
    self->_warpedMask = v32;

    if (self->_warpedMask)
      v22 = 0;
    else
      v22 = 2;
  }
LABEL_13:

  return v22;
}

- (int)_allocateShiftPyramidLike:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  int v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  const char *v69;
  const char *v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;

  v4 = a3;
  if ((unint64_t)objc_msgSend_count(self->_preShiftPyramid, v5, v6, v7) >= 4)
  {
    objc_msgSend_objectAtIndexedSubscript_(self->_preShiftPyramid, v8, 0, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend_width(v11, v12, v13, v14);
    if (v15 == objc_msgSend_width(v4, v16, v17, v18))
    {
      objc_msgSend_objectAtIndexedSubscript_(self->_preShiftPyramid, v19, 0, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend_height(v21, v22, v23, v24);
      v29 = objc_msgSend_height(v4, v26, v27, v28);

      v30 = 0;
      v31 = 0;
      if (v25 == v29)
        goto LABEL_8;
    }
    else
    {

    }
  }
  objc_msgSend_removeAllObjects(self->_preShiftPyramid, v8, v9, v10);
  v32 = (void *)MEMORY[0x24BDDD740];
  v36 = objc_msgSend_width(v4, v33, v34, v35);
  v40 = objc_msgSend_height(v4, v37, v38, v39);
  objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(v32, v41, 65, v36, v40, 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 3;
  objc_msgSend_setUsage_(v30, v43, 3, v44);
  objc_msgSend_device(self->_metal, v45, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend_newTextureWithDescriptor_(v48, v49, (uint64_t)v30, v50);

  if (!v31)
  {
LABEL_14:
    v56 = 0;
    goto LABEL_15;
  }
  objc_msgSend_addObject_(self->_preShiftPyramid, v51, (uint64_t)v31, v52);
LABEL_8:
  if ((unint64_t)objc_msgSend_count(self->_preShiftPyramid, v8, v9, v10) > 3)
  {
    v42 = 0;
    goto LABEL_14;
  }
  v56 = 0;
  while (1)
  {
    v57 = v30;
    v58 = v56;
    v59 = v31;
    objc_msgSend_lastObject(self->_preShiftPyramid, v53, v54, v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    v60 = (void *)MEMORY[0x24BDDD740];
    v64 = (unint64_t)objc_msgSend_width(v56, v61, v62, v63) >> 1;
    v68 = objc_msgSend_height(v56, v65, v66, v67);
    objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(v60, v69, 65, v64, v68 >> 1, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_setUsage_(v30, v70, 3, v71);
    objc_msgSend_device(self->_metal, v72, v73, v74);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend_newTextureWithDescriptor_(v75, v76, (uint64_t)v30, v77);

    if (!v31)
      break;
    objc_msgSend_addObject_(self->_preShiftPyramid, v78, (uint64_t)v31, v79);
    if ((unint64_t)objc_msgSend_count(self->_preShiftPyramid, v80, v81, v82) >= 4)
    {
      v42 = 0;
      goto LABEL_15;
    }
  }
  v42 = 3;
LABEL_15:

  return v42;
}

- (int)_buildShiftPyramid
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  __int128 v49;
  uint64_t v50;
  _QWORD v51[3];
  __int128 v52;
  uint64_t v53;

  objc_msgSend_commandQueue(self->_metal, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_commandBuffer(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setLabel_(v9, v10, (uint64_t)CFSTR("Panorama:ParallaxStage:_buildShiftPyramid"), v11);
  objc_msgSend_computeCommandEncoder(v9, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_downsampleShifts(self->_shaders, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  getThreadgroupSizeForShader(v19, (unint64_t *)&v52);

  for (i = 1; i != 4; ++i)
  {
    objc_msgSend_objectAtIndexedSubscript_(self->_preShiftPyramid, v20, i - 1, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(self->_preShiftPyramid, v24, i, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_downsampleShifts(self->_shaders, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setComputePipelineState_(v15, v31, (uint64_t)v30, v32);

    objc_msgSend_setTexture_atIndex_(v15, v33, (uint64_t)v23, 0);
    objc_msgSend_setTexture_atIndex_(v15, v34, (uint64_t)v26, 1);
    v38 = objc_msgSend_width(v26, v35, v36, v37);
    v42 = objc_msgSend_height(v26, v39, v40, v41);
    v51[0] = v38;
    v51[1] = v42;
    v51[2] = 1;
    v49 = v52;
    v50 = v53;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v15, v43, (uint64_t)v51, (uint64_t)&v49);

  }
  objc_msgSend_endEncoding(v15, v20, v44, v21);
  objc_msgSend_commit(v9, v45, v46, v47);

  return 0;
}

- (uint64_t)_computePreShift:(simd_float3)a3 homography:(simd_float3)a4
{
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  const char *v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  simd_float3x3 v55;
  __int128 v56;
  uint64_t v57;
  _QWORD v58[3];
  __int128 v59;
  uint64_t v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _OWORD v64[3];
  simd_float3x3 v65;

  v55.columns[1] = a3;
  v55.columns[2] = a4;
  v55.columns[0] = a2;
  v64[0] = a2;
  v64[1] = a3;
  v64[2] = a4;
  v62 = 0u;
  v63 = 0u;
  v61 = 0u;
  v7 = a6;
  v65 = __invert_f3(v55);
  DWORD2(v61) = v65.columns[0].i32[2];
  DWORD2(v62) = v65.columns[1].i32[2];
  *(_QWORD *)&v61 = v65.columns[0].i64[0];
  *(_QWORD *)&v62 = v65.columns[1].i64[0];
  DWORD2(v63) = v65.columns[2].i32[2];
  *(_QWORD *)&v63 = v65.columns[2].i64[0];
  objc_msgSend_commandQueue(a1[1], v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_commandBuffer(v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setLabel_(v15, v16, (uint64_t)CFSTR("Panorama:ParallaxStage:_computePreShift"), v17);
  objc_msgSend_computeCommandEncoder(v15, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_computePreShifts(a1[2], v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  getThreadgroupSizeForShader(v25, (unint64_t *)&v59);

  objc_msgSend_computePreShifts(a1[2], v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setComputePipelineState_(v21, v30, (uint64_t)v29, v31);

  objc_msgSend_setTexture_atIndex_(v21, v32, (uint64_t)v7, 0);
  objc_msgSend_objectAtIndexedSubscript_(a1[5], v33, 0, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTexture_atIndex_(v21, v36, (uint64_t)v35, 1);

  objc_msgSend_setBytes_length_atIndex_(v21, v37, (uint64_t)v64, 48, 0);
  objc_msgSend_setBytes_length_atIndex_(v21, v38, (uint64_t)&v61, 48, 1);
  v42 = objc_msgSend_width(v7, v39, v40, v41);
  v46 = objc_msgSend_height(v7, v43, v44, v45);

  v58[0] = v42;
  v58[1] = v46;
  v58[2] = 1;
  v56 = v59;
  v57 = v60;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v21, v47, (uint64_t)v58, (uint64_t)&v56);
  objc_msgSend_endEncoding(v21, v48, v49, v50);
  objc_msgSend_commit(v15, v51, v52, v53);

  return 0;
}

- (uint64_t)addSlice:(double)a3 mask:(double)a4 homography:(uint64_t)a5 residualFlow:(__CVBuffer *)a6
{
  id v11;
  size_t Width;
  size_t Height;
  const char *v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  uint64_t ShiftPyramidLike;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;

  v11 = a7;
  Width = CVPixelBufferGetWidth(a6);
  Height = CVPixelBufferGetHeight(a6);
  v15 = objc_msgSend_prepareToProcess_sliceHeight_((void *)a1, v14, Width, Height);
  if ((_DWORD)v15)
  {
    v35 = v15;
    v18 = 0;
    v20 = 0;
    v23 = 0;
    goto LABEL_9;
  }
  objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(*(void **)(a1 + 8), v16, (uint64_t)a6, 10, 1, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    v20 = 0;
    goto LABEL_13;
  }
  objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(*(void **)(a1 + 8), v17, (uint64_t)a6, 30, 1, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
LABEL_13:
    v23 = 0;
    goto LABEL_14;
  }
  objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(*(void **)(a1 + 8), v19, a8, 65, 1, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v23)
  {
LABEL_14:
    v35 = 3;
    goto LABEL_9;
  }
  ShiftPyramidLike = objc_msgSend__allocateShiftPyramidLike_((void *)a1, v21, (uint64_t)v23, v22);
  if ((_DWORD)ShiftPyramidLike
    || (ShiftPyramidLike = objc_msgSend__computePreShift_homography_((void *)a1, v25, (uint64_t)v23, v26, a2, a3, a4),
        (_DWORD)ShiftPyramidLike)
    || (ShiftPyramidLike = objc_msgSend__buildShiftPyramid((void *)a1, v27, v28, v29), (_DWORD)ShiftPyramidLike))
  {
    v35 = ShiftPyramidLike;
  }
  else
  {
    objc_msgSend_lastObject(*(void **)(a1 + 40), v30, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend__applyWarpToSlice_chroma_mask_preFlow_warpedLuma_warpedChroma_warpedMask_((void *)a1, v34, (uint64_t)v18, (uint64_t)v20, v11, v33, *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 80));

  }
LABEL_9:

  return v35;
}

- (int)prepareToProcess:(unsigned int)a3
{
  return 0;
}

- (int)prewarm
{
  return 0;
}

- (int)process
{
  return 0;
}

- (int)setDirection:(int)a3
{
  return 0;
}

- (int)purgeResources
{
  MTLTexture *warpedLuma;
  MTLTexture *warpedChroma;
  MTLTexture *warpedMask;

  if (self->_warpedFrame)
  {
    warpedLuma = self->_warpedLuma;
    self->_warpedLuma = 0;

    warpedChroma = self->_warpedChroma;
    self->_warpedChroma = 0;

    CVPixelBufferRelease(self->_warpedFrame);
    self->_warpedFrame = 0;
  }
  warpedMask = self->_warpedMask;
  if (warpedMask)
  {
    self->_warpedMask = 0;

  }
  return 0;
}

- (int)setup
{
  return 0;
}

- (MTLCommandQueue)metalCommandQueue
{
  return self->metalCommandQueue;
}

- (void)setMetalCommandQueue:(id)a3
{
  objc_storeStrong((id *)&self->metalCommandQueue, a3);
}

- (NSDictionary)cameraInfoByPortType
{
  return self->cameraInfoByPortType;
}

- (void)setCameraInfoByPortType:(id)a3
{
  objc_storeStrong((id *)&self->cameraInfoByPortType, a3);
}

- (NSDictionary)tuningParameters
{
  return self->tuningParameters;
}

- (void)setTuningParameters:(id)a3
{
  objc_storeStrong((id *)&self->tuningParameters, a3);
}

- (__CVBuffer)warpedFrame
{
  return self->_warpedFrame;
}

- (void)setWarpedFrame:(__CVBuffer *)a3
{
  self->_warpedFrame = a3;
}

- (MTLTexture)warpedMask
{
  return (MTLTexture *)objc_getProperty(self, a2, 80, 1);
}

- (void)setWarpedMask:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_warpedMask, 0);
  objc_storeStrong((id *)&self->tuningParameters, 0);
  objc_storeStrong((id *)&self->cameraInfoByPortType, 0);
  objc_storeStrong((id *)&self->metalCommandQueue, 0);
  objc_storeStrong((id *)&self->_preShiftPyramid, 0);
  objc_storeStrong((id *)&self->_warpedChroma, 0);
  objc_storeStrong((id *)&self->_warpedLuma, 0);
  objc_storeStrong((id *)&self->_shaders, 0);
  objc_storeStrong((id *)&self->_metal, 0);
}

@end
