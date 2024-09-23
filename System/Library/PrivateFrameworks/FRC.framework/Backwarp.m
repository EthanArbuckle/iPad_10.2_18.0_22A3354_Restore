@implementation Backwarp

- (Backwarp)initWithDevice:(id)a3 interleaved:(BOOL)a4
{
  id v7;
  Backwarp *v8;
  Backwarp *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)Backwarp;
  v8 = -[Backwarp init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_device, a3);
    v9->_interleaved = a4;
    -[Backwarp setupMetal](v9, "setupMetal");
  }

  return v9;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)Backwarp;
  -[Backwarp dealloc](&v2, sel_dealloc);
}

- (void)setupMetal
{
  MTLCommandQueue *v3;
  MTLCommandQueue *commandQueue;
  void *v5;
  void *v6;
  MTLDevice *device;
  MTLLibrary *v8;
  MTLLibrary *mtlLibrary;
  const __CFString *v10;
  void *v11;
  id v12;
  MTLDevice *v13;
  MTLComputePipelineState *v14;
  id v15;
  MTLComputePipelineState *backwarpKernel;
  void *v17;
  MTLDevice *v18;
  MTLComputePipelineState *v19;
  id v20;
  MTLComputePipelineState *backwarpInterleavedKernel;
  void *v22;
  MTLDevice *v23;
  MTLComputePipelineState *v24;
  id v25;
  MTLComputePipelineState *backwarpInterleavedWithInterleavedFlowOutputKernel;
  const __CFString *v27;
  void *v28;
  MTLDevice *v29;
  MTLComputePipelineState *v30;
  id v31;
  MTLComputePipelineState *backwarpLossKernel;
  void *v33;
  MTLDevice *v34;
  MTLComputePipelineState *v35;
  id v36;
  MTLComputePipelineState *backwarpLossWithFlowMagnitudeKernel;
  void *v38;
  MTLDevice *v39;
  MTLComputePipelineState *v40;
  id v41;
  MTLComputePipelineState *flowUpscaleKernel;
  void *v43;
  MTLDevice *v44;
  MTLComputePipelineState *v45;
  id v46;
  MTLComputePipelineState *flowUpscale2CTo1CKernel;
  void *v48;
  MTLDevice *v49;
  MTLComputePipelineState *v50;
  id v51;
  MTLComputePipelineState *flowUpscale2CTo2CKernel;
  void *v53;
  MTLDevice *v54;
  MTLComputePipelineState *v55;
  id v56;
  MTLComputePipelineState *subsampleFlowKernel;
  void *v58;
  MTLDevice *v59;
  MTLComputePipelineState *v60;
  id v61;
  MTLComputePipelineState *subsampleErrorKernel;
  void *v63;
  MTLDevice *v64;
  MTLComputePipelineState *v65;
  id v66;
  MTLComputePipelineState *upscaleErrorKernel;
  void *v68;
  MTLDevice *v69;
  MTLComputePipelineState *v70;
  id v71;
  MTLComputePipelineState *subsampleInputKernel;
  void *v73;
  MTLDevice *v74;
  MTLComputePipelineState *v75;
  id v76;
  MTLComputePipelineState *padTextureKernel;
  void *v78;
  MTLDevice *v79;
  MTLComputePipelineState *v80;
  id v81;
  MTLComputePipelineState *padTexture2CTO1CKernel;
  void *v83;
  MTLDevice *v84;
  MTLComputePipelineState *v85;
  id v86;
  MTLComputePipelineState *reverseFlowKernel;
  void *v88;
  MTLDevice *v89;
  MTLComputePipelineState *v90;
  id v91;
  MTLComputePipelineState *flowSplattingWarpKernel;
  void *v93;
  MTLDevice *v94;
  MTLComputePipelineState *v95;
  id v96;
  MTLComputePipelineState *flowReshuffleKernel;
  void *v98;
  MTLDevice *v99;
  MTLComputePipelineState *v100;
  id v101;
  MTLComputePipelineState *flowReshuffleTo2CKernel;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  id v112;
  id v113;
  id v114;
  id v115;
  id v116;
  id v117;
  id v118;
  id v119;
  id v120;
  uint64_t v121;

  v3 = (MTLCommandQueue *)-[MTLDevice newCommandQueue](self->_device, "newCommandQueue");
  commandQueue = self->_commandQueue;
  self->_commandQueue = v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.FRC"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLForResource:withExtension:", CFSTR("default"), CFSTR("metallib"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  device = self->_device;
  if (v6)
    v8 = (MTLLibrary *)-[MTLDevice newLibraryWithURL:error:](device, "newLibraryWithURL:error:", v6, 0);
  else
    v8 = (MTLLibrary *)-[MTLDevice newDefaultLibrary](device, "newDefaultLibrary");
  mtlLibrary = self->_mtlLibrary;
  self->_mtlLibrary = v8;

  if (self->_interleaved)
    v10 = CFSTR("backwarp");
  else
    v10 = CFSTR("backwarpNonInterleaved");
  v11 = (void *)-[MTLLibrary newFunctionWithName:](self->_mtlLibrary, "newFunctionWithName:", v10);
  if (!v11)
    NSLog(CFSTR(">> ERROR: Failed creating a new function!"));
  v121 = 0;
  v12 = objc_alloc_init(MEMORY[0x1E0CC6A80]);
  objc_msgSend(v12, "setThreadGroupSizeIsMultipleOfThreadExecutionWidth:", 1);
  objc_msgSend(v12, "setComputeFunction:", v11);
  v13 = self->_device;
  v120 = 0;
  v14 = (MTLComputePipelineState *)-[MTLDevice newComputePipelineStateWithDescriptor:options:reflection:error:](v13, "newComputePipelineStateWithDescriptor:options:reflection:error:", v12, 0, &v121, &v120);
  v15 = v120;
  backwarpKernel = self->_backwarpKernel;
  self->_backwarpKernel = v14;

  if (!self->_backwarpKernel)
    NSLog(CFSTR(">> ERROR: Failed to create backwarp kernel"));
  v17 = (void *)-[MTLLibrary newFunctionWithName:](self->_mtlLibrary, "newFunctionWithName:", CFSTR("backwarpWithInterleavedFlow"));

  objc_msgSend(v12, "setComputeFunction:", v17);
  v18 = self->_device;
  v119 = v15;
  v19 = (MTLComputePipelineState *)-[MTLDevice newComputePipelineStateWithDescriptor:options:reflection:error:](v18, "newComputePipelineStateWithDescriptor:options:reflection:error:", v12, 0, &v121, &v119);
  v20 = v119;

  backwarpInterleavedKernel = self->_backwarpInterleavedKernel;
  self->_backwarpInterleavedKernel = v19;

  if (!self->_backwarpInterleavedKernel)
    NSLog(CFSTR(">> ERROR: Failed to create backwarp kernel"));
  v22 = (void *)-[MTLLibrary newFunctionWithName:](self->_mtlLibrary, "newFunctionWithName:", CFSTR("backwarpWithInterleavedFlowToInterleavedFlow"));

  objc_msgSend(v12, "setComputeFunction:", v22);
  v23 = self->_device;
  v118 = v20;
  v24 = (MTLComputePipelineState *)-[MTLDevice newComputePipelineStateWithDescriptor:options:reflection:error:](v23, "newComputePipelineStateWithDescriptor:options:reflection:error:", v12, 0, &v121, &v118);
  v25 = v118;

  backwarpInterleavedWithInterleavedFlowOutputKernel = self->_backwarpInterleavedWithInterleavedFlowOutputKernel;
  self->_backwarpInterleavedWithInterleavedFlowOutputKernel = v24;

  if (!self->_backwarpInterleavedWithInterleavedFlowOutputKernel)
    NSLog(CFSTR(">> ERROR: Failed to create backwarp kernel"));
  if (self->_interleaved)
    v27 = CFSTR("backwarpLoss");
  else
    v27 = CFSTR("backwarpLossNonInterleaved");
  v28 = (void *)-[MTLLibrary newFunctionWithName:](self->_mtlLibrary, "newFunctionWithName:", v27);

  if (!v28)
    NSLog(CFSTR(">> ERROR: Failed creating a backwarpLoss function!"));
  objc_msgSend(v12, "setComputeFunction:", v28);
  v29 = self->_device;
  v117 = v25;
  v30 = (MTLComputePipelineState *)-[MTLDevice newComputePipelineStateWithDescriptor:options:reflection:error:](v29, "newComputePipelineStateWithDescriptor:options:reflection:error:", v12, 0, &v121, &v117);
  v31 = v117;

  backwarpLossKernel = self->_backwarpLossKernel;
  self->_backwarpLossKernel = v30;

  if (!self->_backwarpLossKernel)
    NSLog(CFSTR(">> ERROR: Failed to create backwarpLoss kernel"));
  v33 = (void *)-[MTLLibrary newFunctionWithName:](self->_mtlLibrary, "newFunctionWithName:", CFSTR("backwarpLossWithFlowMagnitude"));

  objc_msgSend(v12, "setComputeFunction:", v33);
  v34 = self->_device;
  v116 = v31;
  v35 = (MTLComputePipelineState *)-[MTLDevice newComputePipelineStateWithDescriptor:options:reflection:error:](v34, "newComputePipelineStateWithDescriptor:options:reflection:error:", v12, 0, &v121, &v116);
  v36 = v116;

  backwarpLossWithFlowMagnitudeKernel = self->_backwarpLossWithFlowMagnitudeKernel;
  self->_backwarpLossWithFlowMagnitudeKernel = v35;

  if (!self->_backwarpLossWithFlowMagnitudeKernel)
    NSLog(CFSTR(">> ERROR: Failed to create backwarpLossWithFlowMagnitude kernel"));
  v38 = (void *)-[MTLLibrary newFunctionWithName:](self->_mtlLibrary, "newFunctionWithName:", CFSTR("upscaleFlow"));

  if (!v38)
    NSLog(CFSTR(">> ERROR: Failed creating a upscaleFlow function!"));
  objc_msgSend(v12, "setComputeFunction:", v38);
  v39 = self->_device;
  v115 = v36;
  v40 = (MTLComputePipelineState *)-[MTLDevice newComputePipelineStateWithDescriptor:options:reflection:error:](v39, "newComputePipelineStateWithDescriptor:options:reflection:error:", v12, 0, &v121, &v115);
  v41 = v115;

  flowUpscaleKernel = self->_flowUpscaleKernel;
  self->_flowUpscaleKernel = v40;

  if (!self->_flowUpscaleKernel)
    NSLog(CFSTR(">> ERROR: Failed to create upscaleFlow kernel"));
  v43 = (void *)-[MTLLibrary newFunctionWithName:](self->_mtlLibrary, "newFunctionWithName:", CFSTR("upscaleFlow2CTo1C"));

  objc_msgSend(v12, "setComputeFunction:", v43);
  v44 = self->_device;
  v114 = v41;
  v45 = (MTLComputePipelineState *)-[MTLDevice newComputePipelineStateWithDescriptor:options:reflection:error:](v44, "newComputePipelineStateWithDescriptor:options:reflection:error:", v12, 0, &v121, &v114);
  v46 = v114;

  flowUpscale2CTo1CKernel = self->_flowUpscale2CTo1CKernel;
  self->_flowUpscale2CTo1CKernel = v45;

  if (!self->_flowUpscale2CTo1CKernel)
    NSLog(CFSTR(">> ERROR: Failed to create upscaleFlow kernel"));
  v48 = (void *)-[MTLLibrary newFunctionWithName:](self->_mtlLibrary, "newFunctionWithName:", CFSTR("upscaleFlow2CTo2C"));

  objc_msgSend(v12, "setComputeFunction:", v48);
  v49 = self->_device;
  v113 = v46;
  v50 = (MTLComputePipelineState *)-[MTLDevice newComputePipelineStateWithDescriptor:options:reflection:error:](v49, "newComputePipelineStateWithDescriptor:options:reflection:error:", v12, 0, &v121, &v113);
  v51 = v113;

  flowUpscale2CTo2CKernel = self->_flowUpscale2CTo2CKernel;
  self->_flowUpscale2CTo2CKernel = v50;

  if (!self->_flowUpscale2CTo2CKernel)
    NSLog(CFSTR(">> ERROR: Failed to create upscaleFlow kernel"));
  v53 = (void *)-[MTLLibrary newFunctionWithName:](self->_mtlLibrary, "newFunctionWithName:", CFSTR("subsampleFlow"));

  objc_msgSend(v12, "setComputeFunction:", v53);
  v54 = self->_device;
  v112 = v51;
  v55 = (MTLComputePipelineState *)-[MTLDevice newComputePipelineStateWithDescriptor:options:reflection:error:](v54, "newComputePipelineStateWithDescriptor:options:reflection:error:", v12, 0, &v121, &v112);
  v56 = v112;

  subsampleFlowKernel = self->_subsampleFlowKernel;
  self->_subsampleFlowKernel = v55;

  if (!self->_subsampleFlowKernel)
    NSLog(CFSTR(">> ERROR: Failed to create subsampleFlow kernel"));
  v58 = (void *)-[MTLLibrary newFunctionWithName:](self->_mtlLibrary, "newFunctionWithName:", CFSTR("subsampleError"));

  objc_msgSend(v12, "setComputeFunction:", v58);
  v59 = self->_device;
  v111 = v56;
  v60 = (MTLComputePipelineState *)-[MTLDevice newComputePipelineStateWithDescriptor:options:reflection:error:](v59, "newComputePipelineStateWithDescriptor:options:reflection:error:", v12, 0, &v121, &v111);
  v61 = v111;

  subsampleErrorKernel = self->_subsampleErrorKernel;
  self->_subsampleErrorKernel = v60;

  if (!self->_subsampleErrorKernel)
    NSLog(CFSTR(">> ERROR: Failed to create subsampleError kernel"));
  v63 = (void *)-[MTLLibrary newFunctionWithName:](self->_mtlLibrary, "newFunctionWithName:", CFSTR("upscaleError"));

  objc_msgSend(v12, "setComputeFunction:", v63);
  v64 = self->_device;
  v110 = v61;
  v65 = (MTLComputePipelineState *)-[MTLDevice newComputePipelineStateWithDescriptor:options:reflection:error:](v64, "newComputePipelineStateWithDescriptor:options:reflection:error:", v12, 0, &v121, &v110);
  v66 = v110;

  upscaleErrorKernel = self->_upscaleErrorKernel;
  self->_upscaleErrorKernel = v65;

  if (!self->_upscaleErrorKernel)
    NSLog(CFSTR(">> ERROR: Failed to create error upscale kernel"));
  v68 = (void *)-[MTLLibrary newFunctionWithName:](self->_mtlLibrary, "newFunctionWithName:", CFSTR("subsampleInput"));

  objc_msgSend(v12, "setComputeFunction:", v68);
  v69 = self->_device;
  v109 = v66;
  v70 = (MTLComputePipelineState *)-[MTLDevice newComputePipelineStateWithDescriptor:options:reflection:error:](v69, "newComputePipelineStateWithDescriptor:options:reflection:error:", v12, 0, &v121, &v109);
  v71 = v109;

  subsampleInputKernel = self->_subsampleInputKernel;
  self->_subsampleInputKernel = v70;

  if (!self->_subsampleInputKernel)
    NSLog(CFSTR(">> ERROR: Failed to create subsampleInput kernel"));
  v73 = (void *)-[MTLLibrary newFunctionWithName:](self->_mtlLibrary, "newFunctionWithName:", CFSTR("padTexture"));

  objc_msgSend(v12, "setComputeFunction:", v73);
  v74 = self->_device;
  v108 = v71;
  v75 = (MTLComputePipelineState *)-[MTLDevice newComputePipelineStateWithDescriptor:options:reflection:error:](v74, "newComputePipelineStateWithDescriptor:options:reflection:error:", v12, 0, &v121, &v108);
  v76 = v108;

  padTextureKernel = self->_padTextureKernel;
  self->_padTextureKernel = v75;

  if (!self->_padTextureKernel)
    NSLog(CFSTR(">> ERROR: Failed to create padFlow kernel"));
  v78 = (void *)-[MTLLibrary newFunctionWithName:](self->_mtlLibrary, "newFunctionWithName:", CFSTR("padTexture2CTo1C"));

  objc_msgSend(v12, "setComputeFunction:", v78);
  v79 = self->_device;
  v107 = v76;
  v80 = (MTLComputePipelineState *)-[MTLDevice newComputePipelineStateWithDescriptor:options:reflection:error:](v79, "newComputePipelineStateWithDescriptor:options:reflection:error:", v12, 0, &v121, &v107);
  v81 = v107;

  padTexture2CTO1CKernel = self->_padTexture2CTO1CKernel;
  self->_padTexture2CTO1CKernel = v80;

  if (!self->_padTexture2CTO1CKernel)
    NSLog(CFSTR(">> ERROR: Failed to create padTexture2CTo1C kernel"));
  v83 = (void *)-[MTLLibrary newFunctionWithName:](self->_mtlLibrary, "newFunctionWithName:", CFSTR("reverseFlow"));

  objc_msgSend(v12, "setComputeFunction:", v83);
  v84 = self->_device;
  v106 = v81;
  v85 = (MTLComputePipelineState *)-[MTLDevice newComputePipelineStateWithDescriptor:options:reflection:error:](v84, "newComputePipelineStateWithDescriptor:options:reflection:error:", v12, 0, &v121, &v106);
  v86 = v106;

  reverseFlowKernel = self->_reverseFlowKernel;
  self->_reverseFlowKernel = v85;

  if (!self->_reverseFlowKernel)
    NSLog(CFSTR(">> ERROR: Failed to create reverse flow kernel"));
  v88 = (void *)-[MTLLibrary newFunctionWithName:](self->_mtlLibrary, "newFunctionWithName:", CFSTR("warpWithSplattedFlow"));

  objc_msgSend(v12, "setComputeFunction:", v88);
  v89 = self->_device;
  v105 = v86;
  v90 = (MTLComputePipelineState *)-[MTLDevice newComputePipelineStateWithDescriptor:options:reflection:error:](v89, "newComputePipelineStateWithDescriptor:options:reflection:error:", v12, 0, &v121, &v105);
  v91 = v105;

  flowSplattingWarpKernel = self->_flowSplattingWarpKernel;
  self->_flowSplattingWarpKernel = v90;

  if (!self->_flowSplattingWarpKernel)
    NSLog(CFSTR(">> ERROR: Failed to create warpWithSplattedFlow flow kernel"));
  v93 = (void *)-[MTLLibrary newFunctionWithName:](self->_mtlLibrary, "newFunctionWithName:", CFSTR("reshuffleAndAddFlow"));

  objc_msgSend(v12, "setComputeFunction:", v93);
  v94 = self->_device;
  v104 = v91;
  v95 = (MTLComputePipelineState *)-[MTLDevice newComputePipelineStateWithDescriptor:options:reflection:error:](v94, "newComputePipelineStateWithDescriptor:options:reflection:error:", v12, 0, &v121, &v104);
  v96 = v104;

  flowReshuffleKernel = self->_flowReshuffleKernel;
  self->_flowReshuffleKernel = v95;

  if (!self->_flowReshuffleKernel)
    NSLog(CFSTR(">> ERROR: Failed to create flow reshuffle kernel"));
  v98 = (void *)-[MTLLibrary newFunctionWithName:](self->_mtlLibrary, "newFunctionWithName:", CFSTR("reshuffleAndAddFlow2C"));

  objc_msgSend(v12, "setComputeFunction:", v98);
  v99 = self->_device;
  v103 = v96;
  v100 = (MTLComputePipelineState *)-[MTLDevice newComputePipelineStateWithDescriptor:options:reflection:error:](v99, "newComputePipelineStateWithDescriptor:options:reflection:error:", v12, 0, &v121, &v103);
  v101 = v103;

  flowReshuffleTo2CKernel = self->_flowReshuffleTo2CKernel;
  self->_flowReshuffleTo2CKernel = v100;

  if (!self->_flowReshuffleTo2CKernel)
    NSLog(CFSTR(">> ERROR: Failed to create flow reshuffle 2C kernel"));

}

- (void)warpImage:(id)a3 to:(id)a4 withFlow:(id)a5 upscaledFlow:(id)a6
{
  MTLCommandQueue *commandQueue;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  commandQueue = self->_commandQueue;
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  -[MTLCommandQueue commandBuffer](commandQueue, "commandBuffer");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[Backwarp encodeToCommandBuffer:source:flow:destination:upscaledFlow:](self, "encodeToCommandBuffer:source:flow:destination:upscaledFlow:", v15, v14, v12, v13, v11);

  objc_msgSend(v15, "commit");
  objc_msgSend(v15, "waitUntilCompleted");

}

- (void)encodeToCommandBuffer:(id)a3 source:(id)a4 flow:(id)a5 destination:(id)a6 upscaledFlow:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  float v18;
  float v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  int64x2_t v23;
  uint64_t v24;
  _QWORD v25[3];

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (v12 && v13)
  {
    objc_msgSend(a3, "computeCommandEncoder");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = (void *)-[MTLDevice newBufferWithLength:options:](self->_device, "newBufferWithLength:options:", 4, 0);
      v18 = (float)(unint64_t)objc_msgSend(v15, "width");
      v19 = v18 / (float)(unint64_t)objc_msgSend(v13, "width");
      v20 = objc_retainAutorelease(v17);
      *(float *)objc_msgSend(v20, "contents") = v19;
      if (objc_msgSend(v13, "pixelFormat") == 25)
      {
        v21 = 32;
      }
      else
      {
        v22 = objc_msgSend(v15, "pixelFormat");
        v21 = 40;
        if (v22 == 65)
          v21 = 48;
      }
      objc_msgSend(v16, "setComputePipelineState:", *(Class *)((char *)&self->super.isa + v21));
      objc_msgSend(v16, "setTexture:atIndex:", v12, 0);
      objc_msgSend(v16, "setTexture:atIndex:", v13, 1);
      objc_msgSend(v16, "setTexture:atIndex:", v14, 2);
      objc_msgSend(v16, "setTexture:atIndex:", v15, 3);
      objc_msgSend(v16, "setBuffer:offset:atIndex:", v20, 0, 0);
      v25[0] = (unint64_t)(objc_msgSend(v14, "width") + 15) >> 4;
      v25[1] = (unint64_t)(objc_msgSend(v14, "height") + 15) >> 4;
      v25[2] = 1;
      v23 = vdupq_n_s64(0x10uLL);
      v24 = 1;
      objc_msgSend(v16, "dispatchThreadgroups:threadsPerThreadgroup:", v25, &v23);
      objc_msgSend(v16, "endEncoding");

    }
  }

}

- (void)calcBackwarpLoss:(id)a3 second:(id)a4 flow:(id)a5 timeScale:(float)a6 destination:(id)a7
{
  MTLCommandQueue *commandQueue;
  id v13;
  id v14;
  id v15;
  id v16;
  double v17;
  id v18;

  commandQueue = self->_commandQueue;
  v13 = a7;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  -[MTLCommandQueue commandBuffer](commandQueue, "commandBuffer");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v17 = a6;
  -[Backwarp encodeBackwarpLossToCommandBuffer:first:second:flow:timeScale:destination:](self, "encodeBackwarpLossToCommandBuffer:first:second:flow:timeScale:destination:", v18, v16, v15, v14, v13, v17);

  objc_msgSend(v18, "commit");
  objc_msgSend(v18, "waitUntilCompleted");

}

- (void)encodeBackwarpLossToCommandBuffer:(id)a3 first:(id)a4 second:(id)a5 flow:(id)a6 timeScale:(float)a7 destination:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  int64x2_t v22;
  uint64_t v23;
  _QWORD v24[3];

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  if (v15 && v16 && v17)
  {
    objc_msgSend(v14, "computeCommandEncoder");
    v19 = objc_claimAutoreleasedReturnValue();
    if (!v19)
      -[Backwarp encodeBackwarpLossToCommandBuffer:first:second:flow:timeScale:destination:].cold.1();
    v20 = (void *)v19;
    v21 = objc_retainAutorelease((id)-[MTLDevice newBufferWithLength:options:](self->_device, "newBufferWithLength:options:", 4, 0));
    *(float *)objc_msgSend(v21, "contents") = a7;
    objc_msgSend(v20, "setComputePipelineState:", self->_backwarpLossKernel);
    objc_msgSend(v20, "setTexture:atIndex:", v15, 0);
    objc_msgSend(v20, "setTexture:atIndex:", v16, 1);
    objc_msgSend(v20, "setTexture:atIndex:", v17, 2);
    objc_msgSend(v20, "setTexture:atIndex:", v18, 3);
    objc_msgSend(v20, "setBuffer:offset:atIndex:", v21, 0, 0);
    v24[0] = (unint64_t)(objc_msgSend(v18, "width") + 15) >> 4;
    v24[1] = (unint64_t)(objc_msgSend(v18, "height") + 15) >> 4;
    v24[2] = 1;
    v22 = vdupq_n_s64(0x10uLL);
    v23 = 1;
    objc_msgSend(v20, "dispatchThreadgroups:threadsPerThreadgroup:", v24, &v22);
    objc_msgSend(v20, "endEncoding");

  }
  else
  {
    NSLog(CFSTR("Error! : input / output texture cannot be nil"));
  }

}

- (void)encodeBackwarpLossWithFlowMagnitudeToCommandBuffer:(id)a3 first:(id)a4 second:(id)a5 flow:(id)a6 timeScale:(float)a7 gamma:(float)a8 protectionThreshold:(float)a9 destination:(id)a10
{
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  int64x2_t v25;
  uint64_t v26;
  _QWORD v27[3];
  _DWORD v28[3];

  v18 = a10;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  objc_msgSend(a3, "computeCommandEncoder");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setComputePipelineState:", self->_backwarpLossWithFlowMagnitudeKernel);
  objc_msgSend(v22, "setTexture:atIndex:", v21, 0);

  objc_msgSend(v22, "setTexture:atIndex:", v20, 1);
  objc_msgSend(v22, "setTexture:atIndex:", v19, 2);

  objc_msgSend(v22, "setTexture:atIndex:", v18, 3);
  *(float *)v28 = a7;
  *(float *)&v28[1] = a8;
  *(float *)&v28[2] = a9;
  objc_msgSend(v22, "setBytes:length:atIndex:", v28, 12, 0);
  v23 = (unint64_t)(objc_msgSend(v18, "width") + 15) >> 4;
  v24 = objc_msgSend(v18, "height");

  v27[0] = v23;
  v27[1] = (unint64_t)(v24 + 15) >> 4;
  v27[2] = 1;
  v25 = vdupq_n_s64(0x10uLL);
  v26 = 1;
  objc_msgSend(v22, "dispatchThreadgroups:threadsPerThreadgroup:", v27, &v25);
  objc_msgSend(v22, "endEncoding");

}

- (void)upscaleFlow:(id)a3 destination:(id)a4 callback:(id)a5
{
  id v8;
  MTLCommandQueue *commandQueue;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  commandQueue = self->_commandQueue;
  v10 = a4;
  v11 = a3;
  -[MTLCommandQueue commandBuffer](commandQueue, "commandBuffer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[Backwarp encodeUpscaleFlowToCommandBuffer:source:destination:](self, "encodeUpscaleFlowToCommandBuffer:source:destination:", v12, v11, v10);

  kdebug_trace();
  if (v8)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __45__Backwarp_upscaleFlow_destination_callback___block_invoke;
    v13[3] = &unk_1E97868A8;
    v14 = v8;
    objc_msgSend(v12, "addCompletedHandler:", v13);

    objc_msgSend(v12, "commit");
    objc_msgSend(v12, "waitUntilScheduled");
  }
  else
  {
    objc_msgSend(v12, "commit");
    objc_msgSend(v12, "waitUntilCompleted");
  }
  kdebug_trace();

}

uint64_t __45__Backwarp_upscaleFlow_destination_callback___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)upscaleFlow:(id)a3 destination:(id)a4
{
  -[Backwarp upscaleFlow:destination:callback:](self, "upscaleFlow:destination:callback:", a3, a4, 0);
}

- (void)encodeUpscaleFlowToCommandBuffer:(id)a3 source:(id)a4 destination:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  int64x2_t v16;
  uint64_t v17;
  _QWORD v18[3];
  float v19[2];

  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v8 && v9)
  {
    v11 = a3;
    v12 = objc_msgSend(v10, "width");
    v19[0] = (float)(v12 / objc_msgSend(v8, "width"));
    v19[1] = 1.0 / v19[0];
    objc_msgSend(v11, "computeCommandEncoder");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      if (objc_msgSend(v8, "pixelFormat") == 65)
      {
        v14 = objc_msgSend(v10, "pixelFormat");
        v15 = 72;
        if (v14 == 65)
          v15 = 80;
      }
      else
      {
        v15 = 64;
      }
      objc_msgSend(v13, "setComputePipelineState:", *(Class *)((char *)&self->super.isa + v15));
      objc_msgSend(v13, "setTexture:atIndex:", v8, 0);
      objc_msgSend(v13, "setTexture:atIndex:", v10, 1);
      objc_msgSend(v13, "setBytes:length:atIndex:", v19, 8, 0);
      v18[0] = (unint64_t)(objc_msgSend(v10, "width") + 15) >> 4;
      v18[1] = (unint64_t)(objc_msgSend(v10, "height") + 15) >> 4;
      v18[2] = 1;
      v16 = vdupq_n_s64(0x10uLL);
      v17 = 1;
      objc_msgSend(v13, "dispatchThreadgroups:threadsPerThreadgroup:", v18, &v16);
      objc_msgSend(v13, "endEncoding");
    }

  }
}

- (void)encodeSubsampleFlowToCommandBuffer:(id)a3 source:(id)a4 destination:(id)a5
{
  -[Backwarp encodeSubsampleToCommandBufferr:source:destination:kernel:](self, "encodeSubsampleToCommandBufferr:source:destination:kernel:", a3, a4, a5, self->_subsampleFlowKernel);
}

- (void)encodeSubsampleErrorToCommandBuffer:(id)a3 source:(id)a4 destination:(id)a5
{
  -[Backwarp encodeSubsampleToCommandBufferr:source:destination:kernel:](self, "encodeSubsampleToCommandBufferr:source:destination:kernel:", a3, a4, a5, self->_subsampleErrorKernel);
}

- (void)encodeUpscaleErrorToCommandBuffer:(id)a3 source:(id)a4 destination:(id)a5
{
  -[Backwarp encodeSubsampleToCommandBufferr:source:destination:kernel:](self, "encodeSubsampleToCommandBufferr:source:destination:kernel:", a3, a4, a5, self->_upscaleErrorKernel);
}

- (void)encodeSubsampleToCommandBufferr:(id)a3 source:(id)a4 destination:(id)a5 kernel:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  int64x2_t v16;
  uint64_t v17;
  _QWORD v18[3];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (!v10 || !v11 || (v13 = v12) == 0)
    -[Backwarp encodeSubsampleToCommandBufferr:source:destination:kernel:].cold.1();
  objc_msgSend(v9, "computeCommandEncoder");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "setComputePipelineState:", v13);
    objc_msgSend(v15, "setTexture:atIndex:", v10, 0);
    objc_msgSend(v15, "setTexture:atIndex:", v11, 1);
    v18[0] = (unint64_t)(objc_msgSend(v11, "width") + 15) >> 4;
    v18[1] = (unint64_t)(objc_msgSend(v11, "height") + 15) >> 4;
    v18[2] = 1;
    v16 = vdupq_n_s64(0x10uLL);
    v17 = 1;
    objc_msgSend(v15, "dispatchThreadgroups:threadsPerThreadgroup:", v18, &v16);
    objc_msgSend(v15, "endEncoding");
  }

}

- (void)encodeSubsampleInputToCommandBufferr:(id)a3 source:(id)a4 destination:(id)a5
{
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  float v12;
  id v13;
  unint64_t v14;
  uint64_t v15;
  int64x2_t v16;
  uint64_t v17;
  _QWORD v18[3];

  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "computeCommandEncoder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "width");
  v12 = (float)(v11 / objc_msgSend(v8, "width"));
  v13 = objc_retainAutorelease((id)-[MTLDevice newBufferWithLength:options:](self->_device, "newBufferWithLength:options:", 4, 0));
  *(float *)objc_msgSend(v13, "contents") = v12;
  objc_msgSend(v10, "setComputePipelineState:", self->_subsampleInputKernel);
  objc_msgSend(v10, "setTexture:atIndex:", v9, 0);

  objc_msgSend(v10, "setTexture:atIndex:", v8, 1);
  objc_msgSend(v10, "setBuffer:offset:atIndex:", v13, 0, 0);
  v14 = (unint64_t)(objc_msgSend(v8, "width") + 15) >> 4;
  v15 = objc_msgSend(v8, "height");

  v18[0] = v14;
  v18[1] = (unint64_t)(v15 + 15) >> 4;
  v18[2] = 1;
  v16 = vdupq_n_s64(0x10uLL);
  v17 = 1;
  objc_msgSend(v10, "dispatchThreadgroups:threadsPerThreadgroup:", v18, &v16);
  objc_msgSend(v10, "endEncoding");

}

- (void)copyTextureWithPaddingSource:(id)a3 destination:(id)a4 callback:(id)a5
{
  id v8;
  MTLCommandQueue *commandQueue;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  commandQueue = self->_commandQueue;
  v10 = a4;
  v11 = a3;
  -[MTLCommandQueue commandBuffer](commandQueue, "commandBuffer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[Backwarp encodePaddingTextureToCommandBuffer:source:destination:](self, "encodePaddingTextureToCommandBuffer:source:destination:", v12, v11, v10);

  if (v8)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __62__Backwarp_copyTextureWithPaddingSource_destination_callback___block_invoke;
    v13[3] = &unk_1E97868A8;
    v14 = v8;
    objc_msgSend(v12, "addCompletedHandler:", v13);

    objc_msgSend(v12, "commit");
    objc_msgSend(v12, "waitUntilScheduled");
  }
  else
  {
    objc_msgSend(v12, "commit");
    objc_msgSend(v12, "waitUntilCompleted");
  }

}

uint64_t __62__Backwarp_copyTextureWithPaddingSource_destination_callback___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)copyTextureWithPaddingSource:(id)a3 destination:(id)a4
{
  -[Backwarp copyTextureWithPaddingSource:destination:callback:](self, "copyTextureWithPaddingSource:destination:callback:", a3, a4, 0);
}

- (void)encodePaddingTextureToCommandBuffer:(id)a3 source:(id)a4 destination:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int64x2_t v13;
  uint64_t v14;
  _QWORD v15[3];

  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v8 && v9)
  {
    objc_msgSend(a3, "computeCommandEncoder");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      if (objc_msgSend(v8, "pixelFormat") == 65 && objc_msgSend(v10, "pixelFormat") == 25)
        v12 = 136;
      else
        v12 = 128;
      objc_msgSend(v11, "setComputePipelineState:", *(Class *)((char *)&self->super.isa + v12));
      objc_msgSend(v11, "setTexture:atIndex:", v8, 0);
      objc_msgSend(v11, "setTexture:atIndex:", v10, 1);
      v15[0] = (unint64_t)(objc_msgSend(v10, "width") + 15) >> 4;
      v15[1] = (unint64_t)(objc_msgSend(v10, "height") + 15) >> 4;
      v15[2] = 1;
      v13 = vdupq_n_s64(0x10uLL);
      v14 = 1;
      objc_msgSend(v11, "dispatchThreadgroups:threadsPerThreadgroup:", v15, &v13);
      objc_msgSend(v11, "endEncoding");
    }

  }
}

- (void)reverseFlowWithSource:(id)a3 destination:(id)a4
{
  MTLCommandQueue *commandQueue;
  id v7;
  id v8;
  id v9;

  commandQueue = self->_commandQueue;
  v7 = a4;
  v8 = a3;
  -[MTLCommandQueue commandBuffer](commandQueue, "commandBuffer");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[Backwarp encodeReverseFlowToCommandBuffer:source:destination:](self, "encodeReverseFlowToCommandBuffer:source:destination:", v9, v8, v7);

  objc_msgSend(v9, "commit");
  objc_msgSend(v9, "waitUntilCompleted");

}

- (void)encodeReverseFlowToCommandBuffer:(id)a3 source:(id)a4 destination:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int64x2_t v13;
  uint64_t v14;
  _QWORD v15[3];

  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v8 && v9)
  {
    objc_msgSend(a3, "computeCommandEncoder");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "setComputePipelineState:", self->_reverseFlowKernel);
      objc_msgSend(v12, "setTexture:atIndex:", v8, 0);
      objc_msgSend(v12, "setTexture:atIndex:", v10, 1);
      v15[0] = (unint64_t)(objc_msgSend(v10, "width") + 15) >> 4;
      v15[1] = (unint64_t)(objc_msgSend(v10, "height") + 15) >> 4;
      v15[2] = 1;
      v13 = vdupq_n_s64(0x10uLL);
      v14 = 1;
      objc_msgSend(v12, "dispatchThreadgroups:threadsPerThreadgroup:", v15, &v13);
      objc_msgSend(v12, "endEncoding");
    }

  }
}

- (void)encodeFlowSplattingWarpToCommandBuffer:(id)a3 source:(id)a4 flow:(id)a5 timeScale:(float)a6 destination:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  unint64_t v16;
  float v17;
  id v18;
  float *v19;
  void *v20;
  id v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  int64x2_t v25;
  uint64_t v26;
  _QWORD v27[3];

  v12 = a7;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = objc_msgSend(v14, "width");
  v17 = (float)(v16 / objc_msgSend(v13, "width"));
  v18 = objc_retainAutorelease((id)-[MTLDevice newBufferWithLength:options:](self->_device, "newBufferWithLength:options:", 8, 0));
  v19 = (float *)objc_msgSend(v18, "contents");
  *v19 = v17 * a6;
  v19[1] = 1.0 / v17;
  objc_msgSend(v15, "computeCommandEncoder");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "setComputePipelineState:", self->_flowSplattingWarpKernel);
  objc_msgSend(v20, "setTexture:atIndex:", v14, 0);

  objc_msgSend(v20, "setTexture:atIndex:", v13, 1);
  objc_msgSend(v20, "setTexture:atIndex:", v12, 2);
  objc_msgSend(v20, "setBuffer:offset:atIndex:", v18, 0, 0);
  v21 = objc_alloc_init(MEMORY[0x1E0CC6B80]);
  objc_msgSend(v21, "setTAddressMode:", 0);
  objc_msgSend(v21, "setSAddressMode:", 0);
  objc_msgSend(v21, "setNormalizedCoordinates:", 0);
  objc_msgSend(v21, "setMinFilter:", 1);
  objc_msgSend(v21, "setMagFilter:", 1);
  v22 = (void *)-[MTLDevice newSamplerStateWithDescriptor:](self->_device, "newSamplerStateWithDescriptor:", v21);
  objc_msgSend(v20, "setSamplerState:atIndex:", v22, 0);
  v23 = (unint64_t)(objc_msgSend(v12, "width") + 15) >> 4;
  v24 = objc_msgSend(v12, "height");

  v27[0] = v23;
  v27[1] = (unint64_t)(v24 + 15) >> 4;
  v27[2] = 1;
  v25 = vdupq_n_s64(0x10uLL);
  v26 = 1;
  objc_msgSend(v20, "dispatchThreadgroups:threadsPerThreadgroup:", v27, &v25);
  objc_msgSend(v20, "endEncoding");

}

- (void)encodeReShuffleFlowToCommandBuffer:(id)a3 shuffledFlow:(id)a4 previousFlow:(id)a5 destination:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  int64x2_t v16;
  uint64_t v17;
  _QWORD v18[3];

  v10 = a6;
  v11 = a5;
  v12 = a4;
  objc_msgSend(a3, "computeCommandEncoder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v10, "pixelFormat");
  v15 = 160;
  if (v14 == 65)
    v15 = 168;
  objc_msgSend(v13, "setComputePipelineState:", *(Class *)((char *)&self->super.isa + v15));
  objc_msgSend(v13, "setTexture:atIndex:", v12, 0);

  objc_msgSend(v13, "setTexture:atIndex:", v11, 1);
  objc_msgSend(v13, "setTexture:atIndex:", v10, 2);
  v18[0] = (unint64_t)(objc_msgSend(v10, "width") + 15) >> 4;
  v18[1] = (unint64_t)(objc_msgSend(v10, "height") + 15) >> 4;
  v18[2] = 1;
  v16 = vdupq_n_s64(0x10uLL);
  v17 = 1;
  objc_msgSend(v13, "dispatchThreadgroups:threadsPerThreadgroup:", v18, &v16);
  objc_msgSend(v13, "endEncoding");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flowReshuffleTo2CKernel, 0);
  objc_storeStrong((id *)&self->_flowReshuffleKernel, 0);
  objc_storeStrong((id *)&self->_flowSplattingWarpKernel, 0);
  objc_storeStrong((id *)&self->_reverseFlowKernel, 0);
  objc_storeStrong((id *)&self->_padTexture2CTO1CKernel, 0);
  objc_storeStrong((id *)&self->_padTextureKernel, 0);
  objc_storeStrong((id *)&self->_subsampleInputKernel, 0);
  objc_storeStrong((id *)&self->_upscaleErrorKernel, 0);
  objc_storeStrong((id *)&self->_subsampleErrorKernel, 0);
  objc_storeStrong((id *)&self->_subsampleFlowKernel, 0);
  objc_storeStrong((id *)&self->_backwarpLossWithFlowMagnitudeKernel, 0);
  objc_storeStrong((id *)&self->_flowUpscale2CTo2CKernel, 0);
  objc_storeStrong((id *)&self->_flowUpscale2CTo1CKernel, 0);
  objc_storeStrong((id *)&self->_flowUpscaleKernel, 0);
  objc_storeStrong((id *)&self->_backwarpLossKernel, 0);
  objc_storeStrong((id *)&self->_backwarpInterleavedWithInterleavedFlowOutputKernel, 0);
  objc_storeStrong((id *)&self->_backwarpInterleavedKernel, 0);
  objc_storeStrong((id *)&self->_backwarpKernel, 0);
  objc_storeStrong((id *)&self->_mtlLibrary, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (void)encodeBackwarpLossToCommandBuffer:first:second:flow:timeScale:destination:.cold.1()
{
  __assert_rtn("-[Backwarp encodeBackwarpLossToCommandBuffer:first:second:flow:timeScale:destination:]", "Backwarp.m", 358, "computeEncoder != nil");
}

- (void)encodeSubsampleToCommandBufferr:source:destination:kernel:.cold.1()
{
  __assert_rtn("-[Backwarp encodeSubsampleToCommandBufferr:source:destination:kernel:]", "Backwarp.m", 530, "0");
}

@end
