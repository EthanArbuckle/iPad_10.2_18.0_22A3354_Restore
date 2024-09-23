@implementation CVAFilterRenderStagelight

- (CVAFilterRenderStagelight)initWithDevice:(id)a3 library:(id)a4 pipelineLibrary:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  CVAFilterRenderStagelight *v13;
  objc_class *v14;
  uint64_t v15;
  NSString *label;
  void *v17;
  id v18;
  void *v19;
  CVAFilterRenderStagelight *v20;
  __int16 v22;
  objc_super v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v23.receiver = self;
  v23.super_class = (Class)CVAFilterRenderStagelight;
  v13 = -[CVAFilterRenderStagelight init](&v23, sel_init);
  if (v13)
  {
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = objc_claimAutoreleasedReturnValue();
    label = v13->_label;
    v13->_label = (NSString *)v15;

    v17 = (void *)objc_opt_new();
    v18 = v10;
    v19 = (void *)objc_msgSend(v17, "copy");
    v22 = 257;
    objc_msgSend(v19, "setConstantValue:type:withName:", (char *)&v22 + 1, 53, CFSTR("kUseStageLightProxyCube"));
    objc_msgSend(v19, "setConstantValue:type:withName:", &v22, 53, CFSTR("kUseStageLightCube"));
    sub_1B5674B88((void **)&v13->_renderingStageLightKernel_bothCubes, v11, v12, v18, CFSTR("renderStageLight"), a6, v19);
    if (!v13->_renderingStageLightKernel_bothCubes)
      goto LABEL_7;
    v22 = 256;
    objc_msgSend(v19, "setConstantValue:type:withName:", (char *)&v22 + 1, 53, CFSTR("kUseStageLightProxyCube"));
    objc_msgSend(v19, "setConstantValue:type:withName:", &v22, 53, CFSTR("kUseStageLightCube"));
    sub_1B5674B88((void **)&v13->_renderingStageLightKernel_proxyCube, v11, v12, v18, CFSTR("renderStageLight"), a6, v19);
    if (!v13->_renderingStageLightKernel_proxyCube)
      goto LABEL_7;
    v22 = 1;
    objc_msgSend(v19, "setConstantValue:type:withName:", (char *)&v22 + 1, 53, CFSTR("kUseStageLightProxyCube"));
    objc_msgSend(v19, "setConstantValue:type:withName:", &v22, 53, CFSTR("kUseStageLightCube"));
    sub_1B5674B88((void **)&v13->_renderingStageLightKernel_cube, v11, v12, v18, CFSTR("renderStageLight"), a6, v19);
    if (!v13->_renderingStageLightKernel_cube)
      goto LABEL_7;
    v22 = 0;
    objc_msgSend(v19, "setConstantValue:type:withName:", (char *)&v22 + 1, 53, CFSTR("kUseStageLightProxyCube"));
    objc_msgSend(v19, "setConstantValue:type:withName:", &v22, 53, CFSTR("kUseStageLightCube"));
    sub_1B5674B88((void **)&v13->_renderingStageLightKernel_noCube, v11, v12, v18, CFSTR("renderStageLight"), a6, v19);
    if (v13->_renderingStageLightKernel_noCube)
      v20 = v13;
    else
LABEL_7:
      v20 = 0;

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)encodeToCommandBuffer:(id)a3 srcColorTex:(id)a4 srcAlphaTex:(id)a5 dstYTex:(id)a6 dstUVTex:(id)a7 stageLightProxyLut:(id)a8 stageLightLut:(id)a9 blackBackgroundIntensity:(float)a10 vignetteIntensity:(float)a11
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  float v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64x2_t v32;
  void *v33;
  __int128 v34;
  uint64_t v35;
  uint64x2_t v36;
  uint64_t v37;
  _DWORD v38[3];

  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = a6;
  v23 = a7;
  v24 = a8;
  v25 = a9;
  v33 = v19;
  v26 = objc_msgSend(v20, "width");
  v27 = objc_msgSend(v20, "height");
  *(float *)v38 = a10;
  v28 = 1.5699;
  if ((float)(a11 * 100.0) > 0.1)
    v28 = (float)((float)((float)((float)(a11 * 100.0) * 3.1416) / -180.0) + 3.1416) * 0.5;
  *(float *)&v38[1] = tanf(v28) * 0.5;
  v38[2] = 1065353216;
  objc_msgSend(v19, "computeCommandEncoder");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (v24 && v25)
  {
    objc_msgSend(v29, "setLabel:", CFSTR("_renderingStageLightKernel_bothCubes"));
    v31 = 8;
  }
  else if (v24)
  {
    objc_msgSend(v29, "setLabel:", CFSTR("_renderingStageLightKernel_proxyCube"));
    v31 = 16;
  }
  else if (v25)
  {
    objc_msgSend(v29, "setLabel:", CFSTR("_renderingStageLightKernel_cube"));
    v31 = 24;
  }
  else
  {
    objc_msgSend(v29, "setLabel:", CFSTR("_renderingStageLightKernel_noCube"));
    v31 = 32;
  }
  objc_msgSend(v30, "setComputePipelineState:", *(Class *)((char *)&self->super.isa + v31));
  objc_msgSend(v30, "setTexture:atIndex:", v20, 0);
  objc_msgSend(v30, "setTexture:atIndex:", v21, 1);
  objc_msgSend(v30, "setTexture:atIndex:", v22, 2);
  objc_msgSend(v30, "setTexture:atIndex:", v23, 3);
  objc_msgSend(v30, "setTexture:atIndex:", v24, 4);
  objc_msgSend(v30, "setTexture:atIndex:", v25, 5);
  objc_msgSend(v30, "setBytes:length:atIndex:", v38, 12, 0);
  v32.i64[0] = v26;
  v32.i64[1] = v27;
  v36 = vshrq_n_u64(vsraq_n_u64((uint64x2_t)vdupq_n_s64(0xFuLL), v32, 1uLL), 4uLL);
  v37 = 1;
  v35 = 1;
  v34 = xmmword_1B56AC968;
  objc_msgSend(v30, "dispatchThreadgroups:threadsPerThreadgroup:", &v36, &v34);
  objc_msgSend(v30, "endEncoding");

}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_renderingStageLightKernel_noCube, 0);
  objc_storeStrong((id *)&self->_renderingStageLightKernel_cube, 0);
  objc_storeStrong((id *)&self->_renderingStageLightKernel_proxyCube, 0);
  objc_storeStrong((id *)&self->_renderingStageLightKernel_bothCubes, 0);
}

@end
