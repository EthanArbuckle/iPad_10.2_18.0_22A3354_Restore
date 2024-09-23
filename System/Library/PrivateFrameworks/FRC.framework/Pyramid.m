@implementation Pyramid

- (Pyramid)initWithDevice:(id)a3 commmandQueue:(id)a4
{
  Pyramid *v4;
  Pyramid *v5;
  uint64_t v6;
  MTLComputePipelineState *subsampleKernel;
  uint64_t v8;
  MTLComputePipelineState *residueKernel;
  uint64_t v10;
  MTLComputePipelineState *residueInplaceKernel;
  uint64_t v12;
  MTLComputePipelineState *shuffleConcatenateKernel;
  uint64_t v14;
  MTLComputePipelineState *gaussianSubsampleKernel;
  uint64_t v16;
  MTLComputePipelineState *blendKernel;
  uint64_t v18;
  MTLComputePipelineState *featureBackwarpKernel;
  uint64_t v20;
  MTLComputePipelineState *paddingKernel;
  uint64_t v22;
  MTLComputePipelineState *gaussian3x3SubsampleKernel;
  uint64_t v24;
  MTLComputePipelineState *twoLayerBlendKernel;
  uint64_t v26;
  MTLComputePipelineState *bicubicSubsampleKernel;
  const __CFString *v28;
  uint64_t v29;
  MTLComputePipelineState *gaussian3x3FilterKernel;
  uint64_t v31;
  MTLBuffer *gaussianCoefficientBuffer;
  uint64_t v33;
  uint64_t v34;
  MTLBuffer *gaussian3x3CoefficientBuffer;
  uint64_t v36;
  objc_super v38;

  v38.receiver = self;
  v38.super_class = (Class)Pyramid;
  v4 = -[FRCMetalBase initWithDevice:commmandQueue:](&v38, sel_initWithDevice_commmandQueue_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[FRCMetalBase createKernel:](v4, "createKernel:", CFSTR("subsample_frame"));
    v6 = objc_claimAutoreleasedReturnValue();
    subsampleKernel = v5->_subsampleKernel;
    v5->_subsampleKernel = (MTLComputePipelineState *)v6;

    -[FRCMetalBase createKernel:](v5, "createKernel:", CFSTR("create_residue"));
    v8 = objc_claimAutoreleasedReturnValue();
    residueKernel = v5->_residueKernel;
    v5->_residueKernel = (MTLComputePipelineState *)v8;

    -[FRCMetalBase createKernel:](v5, "createKernel:", CFSTR("create_residue_inplace"));
    v10 = objc_claimAutoreleasedReturnValue();
    residueInplaceKernel = v5->_residueInplaceKernel;
    v5->_residueInplaceKernel = (MTLComputePipelineState *)v10;

    -[FRCMetalBase createKernel:](v5, "createKernel:", CFSTR("shuffle_and_concat"));
    v12 = objc_claimAutoreleasedReturnValue();
    shuffleConcatenateKernel = v5->_shuffleConcatenateKernel;
    v5->_shuffleConcatenateKernel = (MTLComputePipelineState *)v12;

    -[FRCMetalBase createKernel:](v5, "createKernel:", CFSTR("gaussian_subsample"));
    v14 = objc_claimAutoreleasedReturnValue();
    gaussianSubsampleKernel = v5->_gaussianSubsampleKernel;
    v5->_gaussianSubsampleKernel = (MTLComputePipelineState *)v14;

    -[FRCMetalBase createKernel:](v5, "createKernel:", CFSTR("blend_resisue_with_grid_output"));
    v16 = objc_claimAutoreleasedReturnValue();
    blendKernel = v5->_blendKernel;
    v5->_blendKernel = (MTLComputePipelineState *)v16;

    -[FRCMetalBase createKernel:](v5, "createKernel:", CFSTR("warp_with_consistency_map"));
    v18 = objc_claimAutoreleasedReturnValue();
    featureBackwarpKernel = v5->_featureBackwarpKernel;
    v5->_featureBackwarpKernel = (MTLComputePipelineState *)v18;

    -[FRCMetalBase createKernel:](v5, "createKernel:", CFSTR("padding_copy"));
    v20 = objc_claimAutoreleasedReturnValue();
    paddingKernel = v5->_paddingKernel;
    v5->_paddingKernel = (MTLComputePipelineState *)v20;

    -[FRCMetalBase createKernel:](v5, "createKernel:", CFSTR("gaussian3x3_subsample"));
    v22 = objc_claimAutoreleasedReturnValue();
    gaussian3x3SubsampleKernel = v5->_gaussian3x3SubsampleKernel;
    v5->_gaussian3x3SubsampleKernel = (MTLComputePipelineState *)v22;

    -[FRCMetalBase createKernel:](v5, "createKernel:", CFSTR("blend_two_layer_pyramid"));
    v24 = objc_claimAutoreleasedReturnValue();
    twoLayerBlendKernel = v5->_twoLayerBlendKernel;
    v5->_twoLayerBlendKernel = (MTLComputePipelineState *)v24;

    -[FRCMetalBase createKernel:](v5, "createKernel:", CFSTR("bicubic_subsample"));
    v26 = objc_claimAutoreleasedReturnValue();
    bicubicSubsampleKernel = v5->_bicubicSubsampleKernel;
    v5->_bicubicSubsampleKernel = (MTLComputePipelineState *)v26;

    if (-[MTLDevice supportsFamily:](v5->super._device, "supportsFamily:", 1008))
    {
      v5->_supportsSIMDShuffle = 1;
    }
    else if (!v5->_supportsSIMDShuffle)
    {
      v28 = CFSTR("gaussian3x3_filter");
      goto LABEL_7;
    }
    v28 = CFSTR("gaussian3x3_filter_SIMD");
LABEL_7:
    -[FRCMetalBase createKernel:](v5, "createKernel:", v28);
    v29 = objc_claimAutoreleasedReturnValue();
    gaussian3x3FilterKernel = v5->_gaussian3x3FilterKernel;
    v5->_gaussian3x3FilterKernel = (MTLComputePipelineState *)v29;

    v31 = -[MTLDevice newBufferWithLength:options:](v5->super._device, "newBufferWithLength:options:", 50, 0);
    gaussianCoefficientBuffer = v5->_gaussianCoefficientBuffer;
    v5->_gaussianCoefficientBuffer = (MTLBuffer *)v31;

    v33 = -[MTLBuffer contents](v5->_gaussianCoefficientBuffer, "contents");
    *(_WORD *)(v33 + 48) = 10386;
    *(_OWORD *)v33 = GaussianFilterCoeffients;
    *(_OWORD *)(v33 + 16) = unk_1D428E628;
    *(_OWORD *)(v33 + 32) = xmmword_1D428E638;
    v34 = -[MTLDevice newBufferWithLength:options:](v5->super._device, "newBufferWithLength:options:", 24, 0);
    gaussian3x3CoefficientBuffer = v5->_gaussian3x3CoefficientBuffer;
    v5->_gaussian3x3CoefficientBuffer = (MTLBuffer *)v34;

    v36 = -[MTLBuffer contents](v5->_gaussian3x3CoefficientBuffer, "contents");
    *(_WORD *)(v36 + 16) = 12027;
    *(_OWORD *)v36 = Gaussian3x3FilterCoeffients;
  }
  return v5;
}

- (void)createResiduePyramidFromBuffer:(__CVBuffer *)a3 toBuffer:(__CVBuffer *)a4 levels:(unint64_t)a5
{
  void *v8;
  unint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t i;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  createTexturesFromCVPixelBuffer(a3, self->super._device, 1, 3uLL);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v21 = 0u;
  v22 = 0u;
  v9 = a5 + 1;
  if (a5 != -1)
  {
    v10 = 0;
    v11 = 1;
    do
    {
      createTexturesFromCVPixelBuffer(a4[v10], self->super._device, 1, 3uLL);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)*((_QWORD *)&v21 + v10);
      *((_QWORD *)&v21 + v10) = v12;

      v10 = v11;
      v14 = v9 > v11++;
    }
    while (v14);
    if (a5 == 2)
    {
      createTexturesFromCVPixelBuffer(a4[3], self->super._device, 1, 3uLL);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)*((_QWORD *)&v22 + 1);
      *((_QWORD *)&v22 + 1) = v15;

    }
  }
  -[MTLCommandQueue commandBuffer](self->super._commandQueue, "commandBuffer", v21, (_QWORD)v22);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "enqueue");
  -[Pyramid encodeResiduePyramidToCommandBuffer:fromTexture:toTexture:levels:](self, "encodeResiduePyramidToCommandBuffer:fromTexture:toTexture:levels:", v17, v8, &v21, a5);
  objc_msgSend(v17, "commit");
  objc_msgSend(v17, "waitUntilCompleted");
  if (a5 != -1)
  {
    v18 = 0;
    v19 = 1;
    do
    {
      if (isBufferCopyNecessaryForCVtoTextureConversion(objc_msgSend(*((id *)&v21 + v18), "width"), objc_msgSend(*((id *)&v21 + v18), "height"), objc_msgSend(*((id *)&v21 + v18), "arrayLength")))
      {
        copyTextureToBuffer(*((void **)&v21 + v18), a4[v18]);
      }
      v18 = v19;
      v14 = v9 > v19++;
    }
    while (v14);
  }

  for (i = 32; i != -8; i -= 8)
}

- (void)encodeResiduePyramidToCommandBuffer:(id)a3 fromTexture:(id)a4 toTexture:(const void *)a5 levels:(unint64_t)a6
{
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v15 = a3;
  v10 = a4;
  v11 = v10;
  switch(a6)
  {
    case 4uLL:
      -[Pyramid encodeSubsampleTextureWith5x5GaussianToCommandBuffer:source:destination:clampToEdge:](self, "encodeSubsampleTextureWith5x5GaussianToCommandBuffer:source:destination:clampToEdge:", v15, v10, a5[4], 1);
      -[Pyramid encodeSubsampleTextureWith5x5GaussianToCommandBuffer:source:destination:clampToEdge:](self, "encodeSubsampleTextureWith5x5GaussianToCommandBuffer:source:destination:clampToEdge:", v15, a5[4], a5[2], 0);
      -[Pyramid encodeSubsampleTextureWith5x5GaussianToCommandBuffer:source:destination:clampToEdge:](self, "encodeSubsampleTextureWith5x5GaussianToCommandBuffer:source:destination:clampToEdge:", v15, a5[2], a5[3], 0);
      -[Pyramid encodeResidueToCommandBuffer:base:low:destination:](self, "encodeResidueToCommandBuffer:base:low:destination:", v15, v11, a5[4], *a5);
      -[Pyramid encodeResidueToCommandBuffer:base:low:destination:](self, "encodeResidueToCommandBuffer:base:low:destination:", v15, a5[4], a5[2], a5[1]);
      -[Pyramid encodeResidueInplaceToCommandBuffer:base:low:](self, "encodeResidueInplaceToCommandBuffer:base:low:", v15, a5[2], a5[3]);
      break;
    case 3uLL:
      v12 = v10;
      v13 = objc_msgSend(v12, "height");
      if (v13 != objc_msgSend((id)*a5, "height"))
      {
        createTextures(self->super._device, objc_msgSend((id)*a5, "width"), objc_msgSend((id)*a5, "height"), 1, 3uLL);
        v14 = objc_claimAutoreleasedReturnValue();

        -[Pyramid encodeAddBottomPaddingToCommandBuffer:source:destination:](self, "encodeAddBottomPaddingToCommandBuffer:source:destination:", v15, v12, v14);
        v12 = (id)v14;
      }
      -[Pyramid encodeSubsampleTextureWith5x5GaussianToCommandBuffer:source:destination:clampToEdge:](self, "encodeSubsampleTextureWith5x5GaussianToCommandBuffer:source:destination:clampToEdge:", v15, v12, a5[3], 0);
      -[Pyramid encodeSubsampleTextureWith5x5GaussianToCommandBuffer:source:destination:clampToEdge:](self, "encodeSubsampleTextureWith5x5GaussianToCommandBuffer:source:destination:clampToEdge:", v15, a5[3], a5[2], 0);
      -[Pyramid encodeResidueToCommandBuffer:base:low:destination:](self, "encodeResidueToCommandBuffer:base:low:destination:", v15, v12, a5[3], *a5);
      -[Pyramid encodeResidueToCommandBuffer:base:low:destination:](self, "encodeResidueToCommandBuffer:base:low:destination:", v15, a5[3], a5[2], a5[1]);

      break;
    case 2uLL:
      -[Pyramid encode3x3GaussianFilterToCommandBuffer:source:destination:](self, "encode3x3GaussianFilterToCommandBuffer:source:destination:", v15, v10, a5[1]);
      -[Pyramid encodeBicubicSubsampleTextureToCommandBuffer:source:destination:](self, "encodeBicubicSubsampleTextureToCommandBuffer:source:destination:", v15, a5[1], a5[2]);
      -[Pyramid encode3x3GaussianFilterToCommandBuffer:source:destination:](self, "encode3x3GaussianFilterToCommandBuffer:source:destination:", v15, a5[2], a5[3]);
      -[Pyramid encodeResidueToCommandBuffer:base:low:destination:](self, "encodeResidueToCommandBuffer:base:low:destination:", v15, v11, a5[3], a5[1]);
      break;
    default:
      -[Pyramid encodeResiduePyramidToCommandBuffer:fromTexture:toTexture:levels:].cold.1();
  }

}

- (void)encodeBicubicSubsampleTextureToCommandBuffer:(id)a3 source:(id)a4 destination:(id)a5
{
  id v8;
  id v9;
  id v10;
  float v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  int64x2_t v15;
  uint64_t v16;
  _QWORD v17[3];
  float v18;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (float)(unint64_t)objc_msgSend(v9, "width");
  v18 = v11 / (float)(unint64_t)objc_msgSend(v8, "width");
  objc_msgSend(v10, "computeCommandEncoder");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setComputePipelineState:", self->_bicubicSubsampleKernel);
  objc_msgSend(v12, "setTexture:atIndex:", v9, 0);

  objc_msgSend(v12, "setTexture:atIndex:", v8, 1);
  objc_msgSend(v12, "setBytes:length:atIndex:", &v18, 4, 0);
  v13 = (unint64_t)(objc_msgSend(v8, "width") + 15) >> 4;
  v14 = objc_msgSend(v8, "height");

  v17[0] = v13;
  v17[1] = (unint64_t)(v14 + 15) >> 4;
  v17[2] = 1;
  v15 = vdupq_n_s64(0x10uLL);
  v16 = 1;
  objc_msgSend(v12, "dispatchThreadgroups:threadsPerThreadgroup:", v17, &v15);
  objc_msgSend(v12, "endEncoding");

}

- (void)encodeSubsampleTextureWith5x5GaussianToCommandBuffer:(id)a3 source:(id)a4 destination:(id)a5 clampToEdge:(BOOL)a6
{
  _BOOL4 v6;
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  int64x2_t v21;
  uint64_t v22;
  _QWORD v23[3];

  v6 = a6;
  v10 = (objc_class *)MEMORY[0x1E0CC6B80];
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = objc_alloc_init(v10);
  v15 = v14;
  if (v6)
    v16 = 0;
  else
    v16 = 4;
  objc_msgSend(v14, "setTAddressMode:", v16);
  objc_msgSend(v15, "setSAddressMode:", v16);
  objc_msgSend(v15, "setNormalizedCoordinates:", 0);
  v17 = (void *)-[MTLDevice newSamplerStateWithDescriptor:](self->super._device, "newSamplerStateWithDescriptor:", v15);
  objc_msgSend(v13, "computeCommandEncoder");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setComputePipelineState:", self->_gaussianSubsampleKernel);
  objc_msgSend(v18, "setTexture:atIndex:", v12, 0);

  objc_msgSend(v18, "setTexture:atIndex:", v11, 1);
  objc_msgSend(v18, "setBuffer:offset:atIndex:", self->_gaussianCoefficientBuffer, 0, 0);
  objc_msgSend(v18, "setSamplerState:atIndex:", v17, 0);
  v19 = (unint64_t)(objc_msgSend(v11, "width") + 15) >> 4;
  v20 = objc_msgSend(v11, "height");

  v23[0] = v19;
  v23[1] = (unint64_t)(v20 + 15) >> 4;
  v23[2] = 1;
  v21 = vdupq_n_s64(0x10uLL);
  v22 = 1;
  objc_msgSend(v18, "dispatchThreadgroups:threadsPerThreadgroup:", v23, &v21);
  objc_msgSend(v18, "endEncoding");

}

- (void)encodeSubsampleTextureWith3x3GaussianToCommandBuffer:(id)a3 source:(id)a4 destination:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  int64x2_t v15;
  uint64_t v16;
  _QWORD v17[3];

  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "computeCommandEncoder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setComputePipelineState:", self->_gaussian3x3SubsampleKernel);
  objc_msgSend(v10, "setTexture:atIndex:", v9, 0);
  objc_msgSend(v10, "setTexture:atIndex:", v8, 1);
  v11 = -[MTLBuffer contents](self->_gaussian3x3CoefficientBuffer, "contents");
  v12 = objc_msgSend(v9, "width");

  *(float *)(v11 + 20) = (float)v12 / (float)(unint64_t)objc_msgSend(v8, "width");
  objc_msgSend(v10, "setBuffer:offset:atIndex:", self->_gaussian3x3CoefficientBuffer, 0, 0);
  v13 = (unint64_t)(objc_msgSend(v8, "width") + 15) >> 4;
  v14 = objc_msgSend(v8, "height");

  v17[0] = v13;
  v17[1] = (unint64_t)(v14 + 15) >> 4;
  v17[2] = 1;
  v15 = vdupq_n_s64(0x10uLL);
  v16 = 1;
  objc_msgSend(v10, "dispatchThreadgroups:threadsPerThreadgroup:", v17, &v15);
  objc_msgSend(v10, "endEncoding");

}

- (void)encode3x3GaussianFilterToCommandBuffer:(id)a3 source:(id)a4 destination:(id)a5
{
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  _QWORD v15[3];

  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "computeCommandEncoder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setComputePipelineState:", self->_gaussian3x3FilterKernel);
  objc_msgSend(v10, "setTexture:atIndex:", v9, 0);

  objc_msgSend(v10, "setTexture:atIndex:", v8, 1);
  objc_msgSend(v10, "setBuffer:offset:atIndex:", self->_gaussian3x3CoefficientBuffer, 0, 0);
  v11 = (unint64_t)(objc_msgSend(v8, "width") + 3) >> 2;
  v12 = objc_msgSend(v8, "height");

  v15[0] = v11;
  v15[1] = (unint64_t)(v12 + 31) >> 5;
  v15[2] = 1;
  v13 = xmmword_1D428E600;
  v14 = 1;
  objc_msgSend(v10, "dispatchThreadgroups:threadsPerThreadgroup:", v15, &v13);
  objc_msgSend(v10, "endEncoding");

}

- (void)encodeResidueToCommandBuffer:(id)a3 base:(id)a4 low:(id)a5 destination:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  unint64_t v14;
  float v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  int64x2_t v19;
  uint64_t v20;
  _QWORD v21[3];
  float v22;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  objc_msgSend(a3, "computeCommandEncoder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setComputePipelineState:", self->_residueKernel);
  objc_msgSend(v13, "setTexture:atIndex:", v12, 0);
  objc_msgSend(v13, "setTexture:atIndex:", v11, 1);
  objc_msgSend(v13, "setTexture:atIndex:", v10, 2);
  v14 = objc_msgSend(v11, "width");

  v15 = (float)v14;
  v16 = objc_msgSend(v12, "width");

  v22 = v15 / (float)v16;
  objc_msgSend(v13, "setBytes:length:atIndex:", &v22, 4, 0);
  v17 = (unint64_t)(objc_msgSend(v10, "width") + 15) >> 4;
  v18 = objc_msgSend(v10, "height");

  v21[0] = v17;
  v21[1] = (unint64_t)(v18 + 15) >> 4;
  v21[2] = 1;
  v19 = vdupq_n_s64(0x10uLL);
  v20 = 1;
  objc_msgSend(v13, "dispatchThreadgroups:threadsPerThreadgroup:", v21, &v19);
  objc_msgSend(v13, "endEncoding");

}

- (void)encodeResidueInplaceToCommandBuffer:(id)a3 base:(id)a4 low:(id)a5
{
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  int64x2_t v13;
  uint64_t v14;
  _QWORD v15[3];

  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "computeCommandEncoder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setComputePipelineState:", self->_residueInplaceKernel);
  objc_msgSend(v10, "setTexture:atIndex:", v9, 0);
  objc_msgSend(v10, "setTexture:atIndex:", v8, 1);

  v11 = (unint64_t)(objc_msgSend(v9, "width") + 15) >> 4;
  v12 = objc_msgSend(v9, "height");

  v15[0] = v11;
  v15[1] = (unint64_t)(v12 + 15) >> 4;
  v15[2] = 1;
  v13 = vdupq_n_s64(0x10uLL);
  v14 = 1;
  objc_msgSend(v10, "dispatchThreadgroups:threadsPerThreadgroup:", v15, &v13);
  objc_msgSend(v10, "endEncoding");

}

- (void)encodeShuffleToCommandBuffer:(id)a3 full:(id)a4 quarter:(id)a5 destination:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  int64x2_t v16;
  uint64_t v17;
  _QWORD v18[3];

  v10 = a6;
  v11 = a5;
  v12 = a4;
  objc_msgSend(a3, "computeCommandEncoder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setComputePipelineState:", self->_shuffleConcatenateKernel);
  objc_msgSend(v13, "setTexture:atIndex:", v12, 0);

  objc_msgSend(v13, "setTexture:atIndex:", v11, 1);
  objc_msgSend(v13, "setTexture:atIndex:", v10, 2);
  v14 = (unint64_t)(objc_msgSend(v10, "width") + 15) >> 4;
  v15 = objc_msgSend(v10, "height");

  v18[0] = v14;
  v18[1] = (unint64_t)(v15 + 15) >> 4;
  v18[2] = 1;
  v16 = vdupq_n_s64(0x10uLL);
  v17 = 1;
  objc_msgSend(v13, "dispatchThreadgroups:threadsPerThreadgroup:", v18, &v16);
  objc_msgSend(v13, "endEncoding");

}

- (void)blendWarpedResidueForward:(__CVBuffer *)a3 backward:(__CVBuffer *)a4 withGridNetOutput:(__CVBuffer *)a5 timeScale:(float)a6 destination:(__CVBuffer *)a7 callback:(id)a8
{
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  _QWORD v21[4];
  id v22;

  v14 = a8;
  createTexturesFromCVPixelBuffer(a3, self->super._device, 1, 3uLL);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  createTexturesFromCVPixelBuffer(a4, self->super._device, 1, 3uLL);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  createTexturesFromCVPixelBuffer(a5, self->super._device, 1, 3uLL);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  createTexturesFromCVPixelBuffer(a7, self->super._device, 1, 3uLL);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTLCommandQueue commandBuffer](self->super._commandQueue, "commandBuffer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v20 = a6;
  -[Pyramid encodeLayerBlendToCommandBuffer:forwardResidue:backwardResidue:withBaseLayer:timeScale:destination:](self, "encodeLayerBlendToCommandBuffer:forwardResidue:backwardResidue:withBaseLayer:timeScale:destination:", v19, v15, v16, v17, v18, v20);
  if (v14)
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __95__Pyramid_blendWarpedResidueForward_backward_withGridNetOutput_timeScale_destination_callback___block_invoke;
    v21[3] = &unk_1E97868A8;
    v22 = v14;
    objc_msgSend(v19, "addCompletedHandler:", v21);

  }
  objc_msgSend(v19, "commit");
  objc_msgSend(v19, "waitUntilScheduled");

}

uint64_t __95__Pyramid_blendWarpedResidueForward_backward_withGridNetOutput_timeScale_destination_callback___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)encodeLayerBlendToCommandBuffer:(id)a3 forwardResidue:(id)a4 backwardResidue:(id)a5 withBaseLayer:(id)a6 timeScale:(float)a7 destination:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  int64x2_t v20;
  uint64_t v21;
  _QWORD v22[3];
  float v23;

  v23 = a7;
  v13 = a8;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  objc_msgSend(a3, "computeCommandEncoder");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setComputePipelineState:", self->_blendKernel);
  objc_msgSend(v17, "setTexture:atIndex:", v16, 0);

  objc_msgSend(v17, "setTexture:atIndex:", v15, 1);
  objc_msgSend(v17, "setTexture:atIndex:", v14, 2);

  objc_msgSend(v17, "setTexture:atIndex:", v13, 3);
  objc_msgSend(v17, "setBytes:length:atIndex:", &v23, 4, 0);
  v18 = (unint64_t)(objc_msgSend(v13, "width") + 15) >> 4;
  v19 = objc_msgSend(v13, "height");

  v22[0] = v18;
  v22[1] = (unint64_t)(v19 + 15) >> 4;
  v22[2] = 1;
  v20 = vdupq_n_s64(0x10uLL);
  v21 = 1;
  objc_msgSend(v17, "dispatchThreadgroups:threadsPerThreadgroup:", v22, &v20);
  objc_msgSend(v17, "endEncoding");

}

- (void)encodeFeatureBackwarpToCommandBuffer:(id)a3 feature:(id)a4 forwardFlow:(id)a5 backwardFlow:(id)a6 timeScale:(float)a7 destination:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  int64x2_t v20;
  uint64_t v21;
  _QWORD v22[3];
  float v23;

  v23 = a7;
  v13 = a8;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  objc_msgSend(a3, "computeCommandEncoder");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setComputePipelineState:", self->_featureBackwarpKernel);
  objc_msgSend(v17, "setTexture:atIndex:", v16, 0);

  objc_msgSend(v17, "setTexture:atIndex:", v15, 1);
  objc_msgSend(v17, "setTexture:atIndex:", v14, 2);

  objc_msgSend(v17, "setTexture:atIndex:", v13, 3);
  objc_msgSend(v17, "setBytes:length:atIndex:", &v23, 4, 0);
  v18 = (unint64_t)(objc_msgSend(v13, "width") + 15) >> 4;
  v19 = objc_msgSend(v13, "height");

  v22[0] = v18;
  v22[1] = (unint64_t)(v19 + 15) >> 4;
  v22[2] = 1;
  v20 = vdupq_n_s64(0x10uLL);
  v21 = 1;
  objc_msgSend(v17, "dispatchThreadgroups:threadsPerThreadgroup:", v22, &v20);
  objc_msgSend(v17, "endEncoding");

}

- (void)encodeAddBottomPaddingToCommandBuffer:(id)a3 source:(id)a4 destination:(id)a5
{
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  int64x2_t v13;
  uint64_t v14;
  _QWORD v15[3];

  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "computeCommandEncoder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setComputePipelineState:", self->_paddingKernel);
  objc_msgSend(v10, "setTexture:atIndex:", v9, 0);

  objc_msgSend(v10, "setTexture:atIndex:", v8, 1);
  v11 = (unint64_t)(objc_msgSend(v8, "width") + 15) >> 4;
  v12 = objc_msgSend(v8, "height");

  v15[0] = v11;
  v15[1] = (unint64_t)(v12 + 15) >> 4;
  v15[2] = 1;
  v13 = vdupq_n_s64(0x10uLL);
  v14 = 1;
  objc_msgSend(v10, "dispatchThreadgroups:threadsPerThreadgroup:", v15, &v13);
  objc_msgSend(v10, "endEncoding");

}

- (void)encodeLayerBlendToCommandBuffer:(id)a3 baseLayer:(id)a4 toDestination:(id)a5
{
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  int64x2_t v14;
  uint64_t v15;
  _QWORD v16[3];
  float v17;

  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "computeCommandEncoder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setComputePipelineState:", self->_twoLayerBlendKernel);
  objc_msgSend(v10, "setTexture:atIndex:", v9, 0);
  objc_msgSend(v10, "setTexture:atIndex:", v8, 1);
  v11 = objc_msgSend(v9, "width");

  v17 = (float)v11 / (float)(unint64_t)objc_msgSend(v8, "width");
  objc_msgSend(v10, "setBytes:length:atIndex:", &v17, 4, 0);
  v12 = (unint64_t)(objc_msgSend(v8, "width") + 15) >> 4;
  v13 = objc_msgSend(v8, "height");

  v16[0] = v12;
  v16[1] = (unint64_t)(v13 + 15) >> 4;
  v16[2] = 1;
  v14 = vdupq_n_s64(0x10uLL);
  v15 = 1;
  objc_msgSend(v10, "dispatchThreadgroups:threadsPerThreadgroup:", v16, &v14);
  objc_msgSend(v10, "endEncoding");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bicubicSubsampleKernel, 0);
  objc_storeStrong((id *)&self->_twoLayerBlendKernel, 0);
  objc_storeStrong((id *)&self->_gaussian3x3CoefficientBuffer, 0);
  objc_storeStrong((id *)&self->_gaussian3x3FilterKernel, 0);
  objc_storeStrong((id *)&self->_gaussian3x3SubsampleKernel, 0);
  objc_storeStrong((id *)&self->_gaussianCoefficientBuffer, 0);
  objc_storeStrong((id *)&self->_paddingKernel, 0);
  objc_storeStrong((id *)&self->_featureBackwarpKernel, 0);
  objc_storeStrong((id *)&self->_blendKernel, 0);
  objc_storeStrong((id *)&self->_gaussianSubsampleKernel, 0);
  objc_storeStrong((id *)&self->_shuffleConcatenateKernel, 0);
  objc_storeStrong((id *)&self->_residueInplaceKernel, 0);
  objc_storeStrong((id *)&self->_residueKernel, 0);
  objc_storeStrong((id *)&self->_subsampleKernel, 0);
}

- (void)encodeResiduePyramidToCommandBuffer:fromTexture:toTexture:levels:.cold.1()
{
  __assert_rtn("-[Pyramid encodeResiduePyramidToCommandBuffer:fromTexture:toTexture:levels:]", "Pyramid.m", 195, "0");
}

@end
