@implementation CVABilinearSampler

- (CVABilinearSampler)initWithDevice:(id)a3 mode:(int)a4
{
  uint64_t v4;
  id v6;
  CVABilinearSampler *v7;
  CVABilinearSampler *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  objc_super v13;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CVABilinearSampler;
  v7 = -[CVABilinearSampler init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_mode = v4;
    if ((_DWORD)v4)
    {
      if ((_DWORD)v4 != 1)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[CVABilinearSampler initWithDevice:mode:]");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog(CFSTR("%@: Unsupported sampling mode %d."), v11, v4);

        v8 = 0;
        goto LABEL_8;
      }
      v9 = CFSTR("bilinearSamplerFragmentShaderPerspectiveWarp");
      v10 = CFSTR("BilinearSamplerPipelinePerspectiveWarp");
    }
    else
    {
      v9 = CFSTR("bilinearSamplerFragmentShader");
      v10 = CFSTR("BilinearSamplerPipeline");
    }
    v8 = -[CVABilinearSampler _initWithDevice:pipelineLabel:fragmentFunction:](v7, "_initWithDevice:pipelineLabel:fragmentFunction:", v6, v10, v9);
  }
LABEL_8:

  return v8;
}

- (id)_initWithDevice:(id)a3 pipelineLabel:(id)a4 fragmentFunction:(id)a5
{
  id v9;
  id v10;
  id v11;
  MTLDevice *device;
  void *v13;
  id v14;
  MTLRenderPassDescriptor *v15;
  MTLRenderPassDescriptor *renderPassDescriptor;
  MTLRenderPipelineDescriptor *v17;
  MTLRenderPipelineDescriptor *renderPipelineDescriptor;
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
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  CVABilinearSampler *v40;
  void *v41;
  id v43;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_storeStrong((id *)&self->_device, a3);
  device = self->_device;
  v43 = 0;
  +[VPCMetalLib metalLibraryWithDevice:error:](VPCMetalLib, "metalLibraryWithDevice:error:", device, &v43);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v43;
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CC6B50], "renderPassDescriptor");
    v15 = (MTLRenderPassDescriptor *)objc_claimAutoreleasedReturnValue();
    renderPassDescriptor = self->_renderPassDescriptor;
    self->_renderPassDescriptor = v15;

    v17 = (MTLRenderPipelineDescriptor *)objc_opt_new();
    renderPipelineDescriptor = self->_renderPipelineDescriptor;
    self->_renderPipelineDescriptor = v17;

    -[MTLRenderPipelineDescriptor setLabel:](self->_renderPipelineDescriptor, "setLabel:", v10);
    -[MTLRenderPipelineDescriptor setRasterSampleCount:](self->_renderPipelineDescriptor, "setRasterSampleCount:", 1);
    -[MTLRenderPipelineDescriptor setDepthAttachmentPixelFormat:](self->_renderPipelineDescriptor, "setDepthAttachmentPixelFormat:", 0);
    -[MTLRenderPipelineDescriptor setStencilAttachmentPixelFormat:](self->_renderPipelineDescriptor, "setStencilAttachmentPixelFormat:", 0);
    v19 = (void *)objc_msgSend(v13, "newFunctionWithName:", CFSTR("bilinearSamplerVertexShader"));
    -[MTLRenderPipelineDescriptor setVertexFunction:](self->_renderPipelineDescriptor, "setVertexFunction:", v19);

    v20 = (void *)objc_msgSend(v13, "newFunctionWithName:", v11);
    -[MTLRenderPipelineDescriptor setFragmentFunction:](self->_renderPipelineDescriptor, "setFragmentFunction:", v20);

    objc_msgSend(MEMORY[0x1E0CC6BD8], "vertexDescriptor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "attributes");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setFormat:", 29);

    objc_msgSend(v21, "attributes");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setOffset:", 0);

    objc_msgSend(v21, "attributes");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setBufferIndex:", 0);

    objc_msgSend(v21, "attributes");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectAtIndexedSubscript:", 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setFormat:", 29);

    objc_msgSend(v21, "attributes");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectAtIndexedSubscript:", 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setOffset:", 8);

    objc_msgSend(v21, "attributes");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectAtIndexedSubscript:", 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setBufferIndex:", 0);

    objc_msgSend(v21, "layouts");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "objectAtIndexedSubscript:", 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setStride:", 16);

    objc_msgSend(v21, "layouts");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "objectAtIndexedSubscript:", 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setStepRate:", 1);

    objc_msgSend(v21, "layouts");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "objectAtIndexedSubscript:", 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setStepFunction:", 1);

    -[MTLRenderPipelineDescriptor setVertexDescriptor:](self->_renderPipelineDescriptor, "setVertexDescriptor:", v21);
    v40 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[CVABilinearSampler _initWithDevice:pipelineLabel:fragmentFunction:]");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedDescription");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%@ error %@"), v21, v41);

    v40 = 0;
  }

  return v40;
}

- (void)encodeToCommandBuffer:(float32x4_t)a3 sourceTexture:(float32x4_t)a4 transform:(uint64_t)a5 destinationTexture:(void *)a6 destinationBoundingBox:(void *)a7
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  float32x4_t v32;
  float32x2_t v33;
  float32x2_t v34;
  float32x2_t v35;
  float32x2_t v36;
  void *v37;
  void *v38;
  float32x4_t v39;
  float32x4_t v40;
  float32x2_t v41;
  float32x4_t v42;
  int32x4_t v43;
  int32x4_t v44;
  float32x4_t v45;
  int32x4_t v46;
  int32x4_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  id v54;

  v13 = a6;
  v14 = a7;
  v15 = a8;
  if ((unint64_t)objc_msgSend(v15, "mipmapLevelCount") >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[CVABilinearSampler encodeToCommandBuffer:sourceTexture:transform:destinationTexture:destinationBoundingBox:]");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%@ Destination texture has mipmaps, you most probably don't want that."), v16);

  }
  objc_msgSend(*(id *)(a1 + 16), "colorAttachments");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTexture:", v15);

  objc_msgSend(*(id *)(a1 + 16), "colorAttachments");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setLoadAction:", 0);

  objc_msgSend(*(id *)(a1 + 16), "colorAttachments");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setStoreAction:", 1);

  objc_msgSend(*(id *)(a1 + 24), "colorAttachments");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 32) && (v25 = objc_msgSend(v24, "pixelFormat"), v25 == objc_msgSend(v15, "pixelFormat")))
  {
    v26 = 0;
  }
  else
  {
    objc_msgSend(v24, "setPixelFormat:", objc_msgSend(v15, "pixelFormat"));
    v27 = *(void **)(a1 + 8);
    v28 = *(_QWORD *)(a1 + 24);
    v54 = 0;
    v29 = objc_msgSend(v27, "newRenderPipelineStateWithDescriptor:error:", v28, &v54);
    v26 = v54;
    v30 = *(void **)(a1 + 32);
    *(_QWORD *)(a1 + 32) = v29;

  }
  objc_msgSend(v13, "renderCommandEncoderWithDescriptor:", *(_QWORD *)(a1 + 16));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setLabel:", CFSTR("BilinearSampler"));
  if (v31 && *(_QWORD *)(a1 + 32))
  {
    if (*(_DWORD *)(a1 + 160))
    {
      *(float32x4_t *)(a1 + 112) = a2;
      *(float32x4_t *)(a1 + 128) = a3;
      *(float32x4_t *)(a1 + 144) = a4;
      objc_msgSend(v31, "setFragmentBytes:length:atIndex:");
      v32 = *a9;
      v33 = 0;
      v34 = 0;
      v35 = 0;
      v36 = 0;
    }
    else
    {
      *(float32x2_t *)v39.f32 = vcvt_f32_s32((int32x2_t)(objc_msgSend(v15, "width") | ((unint64_t)objc_msgSend(v15, "height") << 32)));
      v39.i64[1] = v39.i64[0];
      v32 = *a9;
      v40 = vmulq_f32(*a9, v39);
      v41 = (float32x2_t)vaddq_f32(v40, (float32x4_t)vdupq_laneq_s32((int32x4_t)v40, 3)).u64[0];
      v42 = vmulq_n_f32(a2, v40.f32[0]);
      v43 = (int32x4_t)vaddq_f32(a4, vmlaq_lane_f32(v42, a3, *(float32x2_t *)v40.f32, 1));
      v34 = vdiv_f32(*(float32x2_t *)v43.i8, (float32x2_t)vdup_laneq_s32(v43, 2));
      v44 = (int32x4_t)vaddq_f32(a4, vmlaq_lane_f32(v42, a3, v41, 1));
      v33 = vdiv_f32(*(float32x2_t *)v44.i8, (float32x2_t)vdup_laneq_s32(v44, 2));
      v45 = vmulq_n_f32(a2, vaddq_f32(v40, (float32x4_t)vdupq_laneq_s32((int32x4_t)v40, 2)).f32[0]);
      v46 = (int32x4_t)vaddq_f32(a4, vmlaq_lane_f32(v45, a3, v41, 1));
      v35 = vdiv_f32(*(float32x2_t *)v46.i8, (float32x2_t)vdup_laneq_s32(v46, 2));
      v47 = (int32x4_t)vaddq_f32(a4, vmlaq_lane_f32(v45, a3, *(float32x2_t *)v40.f32, 1));
      v36 = vdiv_f32(*(float32x2_t *)v47.i8, (float32x2_t)vdup_laneq_s32(v47, 2));
    }
    LODWORD(v48) = v32.i32[0];
    HIDWORD(v48) = vaddq_f32(v32, (float32x4_t)vdupq_laneq_s32(*(int32x4_t *)&v32, 3)).i32[1];
    LODWORD(v49) = vadd_f32(*(float32x2_t *)v32.f32, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32((int32x4_t)v32, 2)).u32[0];
    HIDWORD(v49) = v32.i32[1];
    *(_QWORD *)(a1 + 40) = v32.i64[0];
    *(float32x2_t *)(a1 + 48) = v34;
    v50 = (_QWORD *)(a1 + 40);
    v50[2] = v48;
    v50[3] = v33;
    v50[4] = v49;
    v50[5] = v36;
    v50[6] = __PAIR64__(HIDWORD(v48), v49);
    v50[7] = v35;
    objc_msgSend(v31, "setRenderPipelineState:", *(v50 - 1));
    objc_msgSend(v31, "setCullMode:", 0);
    objc_msgSend(v31, "setFragmentTexture:atIndex:", v14, 0);
    objc_msgSend(v31, "setVertexBytes:length:atIndex:", v50, 64, 0);
    objc_msgSend(v31, "drawPrimitives:vertexStart:vertexCount:", 4, 0, 4);
    objc_msgSend(v31, "endEncoding");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[CVABilinearSampler encodeToCommandBuffer:sourceTexture:transform:destinationTexture:destinationBoundingBox:]");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "localizedDescription");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%@ error: %@"), v37, v38);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderPipelineState, 0);
  objc_storeStrong((id *)&self->_renderPipelineDescriptor, 0);
  objc_storeStrong((id *)&self->_renderPassDescriptor, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
