@implementation CVAFilterRenderComposite

- (CVAFilterRenderComposite)initWithDevice:(id)a3 library:(id)a4 pipelineLibrary:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  CVAFilterRenderComposite *v13;
  objc_class *v14;
  uint64_t v15;
  NSString *label;
  id v17;
  void *v18;
  void *v19;
  MTLComputePipelineState *renderingCompositeFixUpAddNoiseKernel;
  void *v21;
  MTLComputePipelineState *renderingCompositeApplyColorCubes;
  void *v23;
  MTLComputePipelineState *renderingCompositeFixupAndBGColorMapKernel;
  void *v25;
  MTLComputePipelineState *renderingCompositeFixupAndFGColorMapKernel;
  void *v27;
  CVAFilterRenderComposite *renderingCompositeFixupAndColorMapKernel;
  __int16 v30;
  objc_super v31;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v31.receiver = self;
  v31.super_class = (Class)CVAFilterRenderComposite;
  v13 = -[CVAFilterRenderComposite init](&v31, sel_init);
  if (v13)
  {
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = objc_claimAutoreleasedReturnValue();
    label = v13->_label;
    v13->_label = (NSString *)v15;

    v17 = v10;
    v18 = (void *)objc_opt_new();
    v19 = (void *)objc_msgSend(v18, "copy");
    v30 = 0;
    objc_msgSend(v19, "setConstantValue:type:withName:", (char *)&v30 + 1, 53, CFSTR("kUseBgLut"));
    objc_msgSend(v19, "setConstantValue:type:withName:", &v30, 53, CFSTR("kUseFgLut"));
    sub_1B5674B88((void **)&v13->_renderingCompositeFixUpAddNoiseKernel, v11, v12, v17, CFSTR("compositeFixupAndAddNoise"), a6, v19);
    renderingCompositeFixUpAddNoiseKernel = v13->_renderingCompositeFixUpAddNoiseKernel;

    if (!renderingCompositeFixUpAddNoiseKernel)
      goto LABEL_8;
    v21 = (void *)objc_msgSend(v18, "copy");
    v30 = 257;
    objc_msgSend(v21, "setConstantValue:type:withName:", (char *)&v30 + 1, 53, CFSTR("kUseBgLut"));
    objc_msgSend(v21, "setConstantValue:type:withName:", &v30, 53, CFSTR("kUseFgLut"));
    sub_1B5674B88((void **)&v13->_renderingCompositeApplyColorCubes, v11, v12, v17, CFSTR("compositeApplyColorCubes"), a6, v21);
    renderingCompositeApplyColorCubes = v13->_renderingCompositeApplyColorCubes;

    if (!renderingCompositeApplyColorCubes)
      goto LABEL_8;
    v23 = (void *)objc_msgSend(v18, "copy");
    v30 = 256;
    objc_msgSend(v23, "setConstantValue:type:withName:", (char *)&v30 + 1, 53, CFSTR("kUseBgLut"));
    objc_msgSend(v23, "setConstantValue:type:withName:", &v30, 53, CFSTR("kUseFgLut"));
    sub_1B5674B88((void **)&v13->_renderingCompositeFixupAndBGColorMapKernel, v11, v12, v17, CFSTR("compositeFixupAndAddNoise"), a6, v23);
    renderingCompositeFixupAndBGColorMapKernel = v13->_renderingCompositeFixupAndBGColorMapKernel;

    if (!renderingCompositeFixupAndBGColorMapKernel)
      goto LABEL_8;
    v25 = (void *)objc_msgSend(v18, "copy");
    v30 = 1;
    objc_msgSend(v25, "setConstantValue:type:withName:", (char *)&v30 + 1, 53, CFSTR("kUseBgLut"));
    objc_msgSend(v25, "setConstantValue:type:withName:", &v30, 53, CFSTR("kUseFgLut"));
    sub_1B5674B88((void **)&v13->_renderingCompositeFixupAndFGColorMapKernel, v11, v12, v17, CFSTR("compositeFixupAndAddNoise"), a6, v25);
    renderingCompositeFixupAndFGColorMapKernel = v13->_renderingCompositeFixupAndFGColorMapKernel;

    if (renderingCompositeFixupAndFGColorMapKernel)
    {
      v27 = (void *)objc_msgSend(v18, "copy");
      v30 = 257;
      objc_msgSend(v27, "setConstantValue:type:withName:", (char *)&v30 + 1, 53, CFSTR("kUseBgLut"));
      objc_msgSend(v27, "setConstantValue:type:withName:", &v30, 53, CFSTR("kUseFgLut"));
      sub_1B5674B88((void **)&v13->_renderingCompositeFixupAndColorMapKernel, v11, v12, v17, CFSTR("compositeFixupAndAddNoise"), a6, v27);
      renderingCompositeFixupAndColorMapKernel = (CVAFilterRenderComposite *)v13->_renderingCompositeFixupAndColorMapKernel;

      if (renderingCompositeFixupAndColorMapKernel)
        renderingCompositeFixupAndColorMapKernel = v13;
    }
    else
    {
LABEL_8:
      renderingCompositeFixupAndColorMapKernel = 0;
    }

  }
  else
  {
    renderingCompositeFixupAndColorMapKernel = 0;
  }

  return renderingCompositeFixupAndColorMapKernel;
}

- (void)encodeColorCubesToCommandBuffer:(id)a3 sdofYTexture:(id)a4 sdofUVTexture:(id)a5 alphaTexture:(id)a6 fgColorLut:(id)a7 bgColorLut:(id)a8 dstColorTex:(id)a9 dstColorTex_plane1:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64x2_t v27;
  void *v28;
  id v29;
  id v30;
  __int128 v31;
  uint64_t v32;
  uint64x2_t v33;
  uint64_t v34;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v30 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v23 = objc_msgSend(v17, "width");
  v24 = objc_msgSend(v17, "height");
  if (v19 && v20)
  {
    v25 = v24;
    v29 = v16;
    objc_msgSend(v16, "computeCommandEncoder");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setLabel:", CFSTR("_renderingCompositeApplyColorCubes"));
    objc_msgSend(v26, "setComputePipelineState:", self->_renderingCompositeApplyColorCubes);
    objc_msgSend(v26, "setTexture:atIndex:", v17, 0);
    objc_msgSend(v26, "setTexture:atIndex:", v18, 1);
    objc_msgSend(v26, "setTexture:atIndex:", v30, 2);
    objc_msgSend(v26, "setTexture:atIndex:", v20, 3);
    objc_msgSend(v26, "setTexture:atIndex:", v19, 4);
    objc_msgSend(v26, "setTexture:atIndex:", v21, 5);
    objc_msgSend(v26, "setTexture:atIndex:", v22, 6);
    v27.i64[0] = v23;
    v27.i64[1] = v25;
    v33 = vshrq_n_u64(vsraq_n_u64((uint64x2_t)vdupq_n_s64(0xFuLL), v27, 1uLL), 4uLL);
    v34 = 1;
    v32 = 1;
    v31 = xmmword_1B56AC968;
    objc_msgSend(v26, "dispatchThreadgroups:threadsPerThreadgroup:", &v33, &v31);
    objc_msgSend(v26, "endEncoding");

    v16 = v29;
  }
  else
  {
    objc_msgSend(v16, "blitCommandEncoder");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "copyFromTexture:toTexture:", v17, v21);
    objc_msgSend(v28, "copyFromTexture:toTexture:", v18, v22);
    objc_msgSend(v28, "endEncoding");

  }
}

- (void)encodeToCommandBuffer:(id)a3 srcForegroundTex:(id)a4 srcBackgroundTex:(id)a5 srcCocTex:(id)a6 dstYTex:(id)a7 dstUVTex:(id)a8 fgColorLut:(id)a9 bgColorLut:(id)a10 frameNumber:(unsigned int)a11 seedGeneratorFactor:(unsigned int)a12 noiseBits:(int)a13 noiseBitsFactor:(float)a14 cubeIntensity:(float)a15 maxBlurRadius:(optional<float>)a16
{
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  float v28;
  float v29;
  BOOL v30;
  float v31;
  unsigned __int8 v32;
  unint64_t v33;
  unint64_t v34;
  void *v35;
  void *v36;
  char *v37;
  unint64_t *v38;
  void *v39;
  char v40;
  id v42;
  id v43;
  id v44;
  char v45;
  unint64_t v46;
  char v47;
  unint64_t v48;
  char v49;
  unint64_t v50;
  char v51;
  unint64_t v52;
  uint64_t v53;
  int v54;
  float v55;
  float v56;
  float v57;

  v43 = a3;
  v23 = a4;
  v42 = a5;
  v44 = a6;
  v24 = a7;
  v25 = a8;
  v26 = a9;
  v27 = a10;
  v53 = *(_QWORD *)&a11;
  v54 = a13;
  v55 = a14;
  v56 = a15;
  v28 = (float)(a16.m_storage * 2.0) + 1.0;
  v29 = 1.0 - (float)(1.0 / v28);
  v30 = v28 <= 1.0;
  v31 = 0.0;
  if (!v30)
    v31 = v29;
  if (!a16.m_initialized)
    v31 = 1.0;
  v57 = v31;
  v32 = atomic_load((unsigned __int8 *)&qword_1EF12D438);
  if ((v32 & 1) == 0 && __cxa_guard_acquire(&qword_1EF12D438))
  {
    +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "BOOLForKey:", CFSTR("CVAPhotoDebugCoC"));

    byte_1EF12D75D = v40;
    __cxa_guard_release(&qword_1EF12D438);
  }
  if (byte_1EF12D75D)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("noisePercentToAddAtInfinity = %.1f"), (float)(v57 * 100.0));

  }
  v33 = objc_msgSend(v23, "width");
  v34 = objc_msgSend(v23, "height");
  objc_msgSend(v43, "computeCommandEncoder");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v35;
  if (v26 && v27)
  {
    objc_msgSend(v35, "setLabel:", CFSTR("_renderingCompositeFixupAndColorMapKernel"));
    objc_msgSend(v36, "setComputePipelineState:", self->_renderingCompositeFixupAndColorMapKernel);
    objc_msgSend(v36, "setTexture:atIndex:", v42, 0);
    objc_msgSend(v36, "setTexture:atIndex:", v23, 1);
    objc_msgSend(v36, "setTexture:atIndex:", v44, 2);
    objc_msgSend(v36, "setTexture:atIndex:", v24, 3);
    objc_msgSend(v36, "setTexture:atIndex:", v25, 4);
    objc_msgSend(v36, "setTexture:atIndex:", v27, 5);
    objc_msgSend(v36, "setTexture:atIndex:", v26, 6);
    objc_msgSend(v36, "setBytes:length:atIndex:", &v53, 24, 0);
    v52 = ((v33 >> 1) + 15) >> 4;
    v37 = &v51;
    v38 = &v52;
  }
  else if (v27)
  {
    objc_msgSend(v35, "setLabel:", CFSTR("_renderingCompositeFixupAndBGColorMapKernel"));
    objc_msgSend(v36, "setComputePipelineState:", self->_renderingCompositeFixupAndBGColorMapKernel);
    objc_msgSend(v36, "setTexture:atIndex:", v42, 0);
    objc_msgSend(v36, "setTexture:atIndex:", v23, 1);
    objc_msgSend(v36, "setTexture:atIndex:", v44, 2);
    objc_msgSend(v36, "setTexture:atIndex:", v24, 3);
    objc_msgSend(v36, "setTexture:atIndex:", v25, 4);
    objc_msgSend(v36, "setTexture:atIndex:", v27, 5);
    objc_msgSend(v36, "setBytes:length:atIndex:", &v53, 24, 0);
    v50 = ((v33 >> 1) + 15) >> 4;
    v37 = &v49;
    v38 = &v50;
  }
  else if (v26)
  {
    objc_msgSend(v35, "setLabel:", CFSTR("_renderingCompositeFixupAndFGColorMapKernel"));
    objc_msgSend(v36, "setComputePipelineState:", self->_renderingCompositeFixupAndFGColorMapKernel);
    objc_msgSend(v36, "setTexture:atIndex:", v42, 0);
    objc_msgSend(v36, "setTexture:atIndex:", v23, 1);
    objc_msgSend(v36, "setTexture:atIndex:", v44, 2);
    objc_msgSend(v36, "setTexture:atIndex:", v24, 3);
    objc_msgSend(v36, "setTexture:atIndex:", v25, 4);
    objc_msgSend(v36, "setTexture:atIndex:", v26, 6);
    objc_msgSend(v36, "setBytes:length:atIndex:", &v53, 24, 0);
    v48 = ((v33 >> 1) + 15) >> 4;
    v37 = &v47;
    v38 = &v48;
  }
  else
  {
    objc_msgSend(v35, "setLabel:", CFSTR("_renderingCompositeFixUpAddNoiseKernel"));
    objc_msgSend(v36, "setComputePipelineState:", self->_renderingCompositeFixUpAddNoiseKernel);
    objc_msgSend(v36, "setTexture:atIndex:", v42, 0);
    objc_msgSend(v36, "setTexture:atIndex:", v23, 1);
    objc_msgSend(v36, "setTexture:atIndex:", v44, 2);
    objc_msgSend(v36, "setTexture:atIndex:", v24, 3);
    objc_msgSend(v36, "setTexture:atIndex:", v25, 4);
    objc_msgSend(v36, "setBytes:length:atIndex:", &v53, 24, 0);
    v46 = ((v33 >> 1) + 15) >> 4;
    v37 = &v45;
    v38 = &v46;
  }
  v38[1] = ((v34 >> 1) + 15) >> 4;
  v38[2] = 1;
  *((_QWORD *)v37 + 2) = 1;
  *(_OWORD *)v37 = xmmword_1B56AC968;
  objc_msgSend(v36, "dispatchThreadgroups:threadsPerThreadgroup:");
  objc_msgSend(v36, "endEncoding");

}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_renderingCompositeApplyColorCubes, 0);
  objc_storeStrong((id *)&self->_renderingCompositeFixupAndColorMapKernel, 0);
  objc_storeStrong((id *)&self->_renderingCompositeFixupAndFGColorMapKernel, 0);
  objc_storeStrong((id *)&self->_renderingCompositeFixupAndBGColorMapKernel, 0);
  objc_storeStrong((id *)&self->_renderingCompositeFixUpAddNoiseKernel, 0);
}

@end
