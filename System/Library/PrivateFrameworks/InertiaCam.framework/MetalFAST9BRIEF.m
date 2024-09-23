@implementation MetalFAST9BRIEF

- (__CVMetalTextureCache)textureCache
{
  return self->_textureCache;
}

- (MetalFAST9BRIEF)init
{
  MetalFAST9BRIEF *v2;
  void *v3;
  void *v4;
  MetalFAST9BRIEF *v5;
  MTLDevice *v6;
  MTLDevice *device;
  uint64_t v8;
  MTLCommandQueue *queue;
  dispatch_data_t v10;
  MTLDevice *v11;
  uint64_t v12;
  id v13;
  MTLLibrary *library;
  void *v15;
  void *v16;
  void *v17;
  MTLDevice *v18;
  uint64_t v19;
  id v20;
  MTLLibrary *v21;
  uint64_t v22;
  MTLFunction *responseMapKernel;
  uint64_t v24;
  MTLFunction *response4MapKernel;
  uint64_t v26;
  MTLFunction *suppressMapKernel;
  uint64_t v28;
  MTLFunction *suppress4MapKernel;
  uint64_t v30;
  MTLFunction *computeHistogramKernel;
  uint64_t v32;
  MTLFunction *compute4HistogramKernel;
  uint64_t v34;
  MTLFunction *histogramThresholdKernel;
  uint64_t v36;
  MTLFunction *cumulativeSumSimpleKernel;
  uint64_t v38;
  MTLFunction *compactMPSBuffersKernel;
  uint64_t v40;
  MTLFunction *listKeypointsSimpleKernel;
  uint64_t v42;
  MTLFunction *listKeypointsKernel;
  uint64_t v44;
  MTLFunction *listKeypoints2Kernel;
  uint64_t v46;
  MTLFunction *listKeypoints3Kernel;
  uint64_t v48;
  MTLFunction *refineKeypointKernel;
  uint64_t v50;
  MTLFunction *extractORBKernel;
  uint64_t v52;
  MTLFunction *boxBlurKernel;
  uint64_t v54;
  MTLFunction *boxBlurKernel_R8;
  uint64_t v56;
  MTLFunction *gaussianishBlurKernel;
  id v58;
  uint64_t v59;
  MTLSamplerState *clampedLinearNonNormSamplerState;
  void *v61;
  MTLFunction *v62;
  void *v63;
  uint64_t v64;
  PipelineStatePromise *pipelineStates;
  uint64_t v66;
  int v67;
  id v69;
  id v70;
  objc_super v71;
  size_t v72;
  _QWORD v73[2];
  int v74[2];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v71.receiver = self;
  v71.super_class = (Class)MetalFAST9BRIEF;
  v2 = -[MetalFAST9BRIEF init](&v71, sel_init);
  if (!v2)
    goto LABEL_19;
  v72 = 50;
  v3 = malloc_type_malloc(0x32uLL, 0xCA10BF4BuLL);
  *(_QWORD *)v74 = 0x100000006;
  if (sysctl(v74, 2u, v3, &v72, 0, 0))
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  free(v3);
  if ((objc_msgSend(&unk_1E9893338, "containsObject:", v4) & 1) == 0)
  {
    if (qword_1ED988280 != -1)
      dispatch_once(&qword_1ED988280, &unk_1E988B1B0);
    if (dword_1ED988278 <= 0)
    {
      v6 = (MTLDevice *)MTLCreateSystemDefaultDevice();
      device = v2->_device;
      v2->_device = v6;

      v8 = -[MTLDevice newCommandQueue](v2->_device, "newCommandQueue");
      queue = v2->_queue;
      v2->_queue = (MTLCommandQueue *)v8;

      v10 = dispatch_data_create(&inertiaCamMetalLibStart, &inertiaCamMetalLibEnd - &inertiaCamMetalLibStart, 0, 0);
      v11 = v2->_device;
      v70 = 0;
      v12 = -[MTLDevice newLibraryWithData:error:](v11, "newLibraryWithData:error:", v10, &v70);
      v13 = v70;
      library = v2->_library;
      v2->_library = (MTLLibrary *)v12;

      if (!v12)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "pathForResource:ofType:", CFSTR("InertiaCamMetalLib"), CFSTR("metallib"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16)
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "pathForResource:ofType:", CFSTR("default"), CFSTR("metallib"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v18 = v2->_device;
        v69 = v13;
        v19 = -[MTLDevice newLibraryWithFile:error:](v18, "newLibraryWithFile:error:", v16, &v69);
        v20 = v69;

        v21 = v2->_library;
        v2->_library = (MTLLibrary *)v19;

        v13 = v20;
      }
      v22 = -[MTLLibrary newFunctionWithName:](v2->_library, "newFunctionWithName:", CFSTR("computeResponseMap"));
      responseMapKernel = v2->_responseMapKernel;
      v2->_responseMapKernel = (MTLFunction *)v22;

      v24 = -[MTLLibrary newFunctionWithName:](v2->_library, "newFunctionWithName:", CFSTR("computeResponseMap4"));
      response4MapKernel = v2->_response4MapKernel;
      v2->_response4MapKernel = (MTLFunction *)v24;

      v26 = -[MTLLibrary newFunctionWithName:](v2->_library, "newFunctionWithName:", CFSTR("suppressResponseMap"));
      suppressMapKernel = v2->_suppressMapKernel;
      v2->_suppressMapKernel = (MTLFunction *)v26;

      v28 = -[MTLLibrary newFunctionWithName:](v2->_library, "newFunctionWithName:", CFSTR("suppressResponseMap4"));
      suppress4MapKernel = v2->_suppress4MapKernel;
      v2->_suppress4MapKernel = (MTLFunction *)v28;

      v30 = -[MTLLibrary newFunctionWithName:](v2->_library, "newFunctionWithName:", CFSTR("computeHistograms"));
      computeHistogramKernel = v2->_computeHistogramKernel;
      v2->_computeHistogramKernel = (MTLFunction *)v30;

      v32 = -[MTLLibrary newFunctionWithName:](v2->_library, "newFunctionWithName:", CFSTR("computeHistograms4"));
      compute4HistogramKernel = v2->_compute4HistogramKernel;
      v2->_compute4HistogramKernel = (MTLFunction *)v32;

      v34 = -[MTLLibrary newFunctionWithName:](v2->_library, "newFunctionWithName:", CFSTR("histogramThreshold"));
      histogramThresholdKernel = v2->_histogramThresholdKernel;
      v2->_histogramThresholdKernel = (MTLFunction *)v34;

      v36 = -[MTLLibrary newFunctionWithName:](v2->_library, "newFunctionWithName:", CFSTR("cumulativeSumSimple"));
      cumulativeSumSimpleKernel = v2->_cumulativeSumSimpleKernel;
      v2->_cumulativeSumSimpleKernel = (MTLFunction *)v36;

      v38 = -[MTLLibrary newFunctionWithName:](v2->_library, "newFunctionWithName:", CFSTR("compactMPSBuffers"));
      compactMPSBuffersKernel = v2->_compactMPSBuffersKernel;
      v2->_compactMPSBuffersKernel = (MTLFunction *)v38;

      v40 = -[MTLLibrary newFunctionWithName:](v2->_library, "newFunctionWithName:", CFSTR("listKeypoints_simple"));
      listKeypointsSimpleKernel = v2->_listKeypointsSimpleKernel;
      v2->_listKeypointsSimpleKernel = (MTLFunction *)v40;

      v42 = -[MTLLibrary newFunctionWithName:](v2->_library, "newFunctionWithName:", CFSTR("listKeypoints"));
      listKeypointsKernel = v2->_listKeypointsKernel;
      v2->_listKeypointsKernel = (MTLFunction *)v42;

      v44 = -[MTLLibrary newFunctionWithName:](v2->_library, "newFunctionWithName:", CFSTR("listKeypoints2"));
      listKeypoints2Kernel = v2->_listKeypoints2Kernel;
      v2->_listKeypoints2Kernel = (MTLFunction *)v44;

      v46 = -[MTLLibrary newFunctionWithName:](v2->_library, "newFunctionWithName:", CFSTR("listKeypoints4"));
      listKeypoints3Kernel = v2->_listKeypoints3Kernel;
      v2->_listKeypoints3Kernel = (MTLFunction *)v46;

      v48 = -[MTLLibrary newFunctionWithName:](v2->_library, "newFunctionWithName:", CFSTR("refineKeypoints"));
      refineKeypointKernel = v2->_refineKeypointKernel;
      v2->_refineKeypointKernel = (MTLFunction *)v48;

      v50 = -[MTLLibrary newFunctionWithName:](v2->_library, "newFunctionWithName:", CFSTR("ORB_img"));
      extractORBKernel = v2->_extractORBKernel;
      v2->_extractORBKernel = (MTLFunction *)v50;

      v52 = -[MTLLibrary newFunctionWithName:](v2->_library, "newFunctionWithName:", CFSTR("diameter5BoxBlur_2y"));
      boxBlurKernel = v2->_boxBlurKernel;
      v2->_boxBlurKernel = (MTLFunction *)v52;

      v54 = -[MTLLibrary newFunctionWithName:](v2->_library, "newFunctionWithName:", CFSTR("diameter5BoxBlur0"));
      boxBlurKernel_R8 = v2->_boxBlurKernel_R8;
      v2->_boxBlurKernel_R8 = (MTLFunction *)v54;

      v56 = -[MTLLibrary newFunctionWithName:](v2->_library, "newFunctionWithName:", CFSTR("gaussianishConvolve3x3"));
      gaussianishBlurKernel = v2->_gaussianishBlurKernel;
      v2->_gaussianishBlurKernel = (MTLFunction *)v56;

      v58 = objc_alloc_init(MEMORY[0x1E0CC6B80]);
      objc_msgSend(v58, "setRAddressMode:", 0);
      objc_msgSend(v58, "setSAddressMode:", 0);
      objc_msgSend(v58, "setTAddressMode:", 0);
      objc_msgSend(v58, "setMinFilter:", 1);
      objc_msgSend(v58, "setMagFilter:", 1);
      objc_msgSend(v58, "setMipFilter:", 0);
      objc_msgSend(v58, "setNormalizedCoordinates:", 0);
      v59 = -[MTLDevice newSamplerStateWithDescriptor:](v2->_device, "newSamplerStateWithDescriptor:", v58);
      clampedLinearNonNormSamplerState = v2->_clampedLinearNonNormSamplerState;
      v2->_clampedLinearNonNormSamplerState = (MTLSamplerState *)v59;

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = v2->_suppress4MapKernel;
      v73[0] = v2->_response4MapKernel;
      v73[1] = v62;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 2);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "addObjectsFromArray:", v63);

      objc_msgSend(v61, "addObject:", v2->_gaussianishBlurKernel);
      sub_1D4D6C4BC(v2->_device, v61);
      v64 = objc_claimAutoreleasedReturnValue();
      pipelineStates = v2->_pipelineStates;
      v2->_pipelineStates = (PipelineStatePromise *)v64;

      v72 = 0;
      v66 = CVMetalTextureCacheCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], MEMORY[0x1E0C9AA70], v2->_device, MEMORY[0x1E0C9AA70], (CVMetalTextureCacheRef *)&v72);
      if ((_DWORD)v66)
      {
        NSLog(CFSTR("CVMetalTextureCacheCreate() returned %d"), v66);
        v67 = 1;
      }
      else
      {
        v67 = 0;
        v2->_textureCache = (__CVMetalTextureCache *)v72;
      }

      if (v67)
        goto LABEL_10;
LABEL_19:
      v5 = v2;
      goto LABEL_20;
    }
  }

LABEL_10:
  v5 = 0;
LABEL_20:

  return v5;
}

- (void)dealloc
{
  __CVMetalTextureCache *textureCache;
  objc_super v4;

  textureCache = self->_textureCache;
  if (textureCache)
    CFRelease(textureCache);
  v4.receiver = self;
  v4.super_class = (Class)MetalFAST9BRIEF;
  -[MetalFAST9BRIEF dealloc](&v4, sel_dealloc);
}

- (BOOL)didFinishInitializationWithTimeout:(double)a3
{
  return !-[PipelineStatePromise timesOutWaitingForPipelineStates:](self->_pipelineStates, "timesOutWaitingForPipelineStates:", a3)&& -[PipelineStatePromise groupWasSuccessful](self->_pipelineStates, "groupWasSuccessful");
}

- (id)_textureFromPixelBuffer:(__CVBuffer *)a3 forcedMetalPixelFormat:(unint64_t)a4 forcedWidthDivisior:(int)a5
{
  unint64_t v8;
  uint64_t v9;
  size_t BytesPerRowOfPlane;
  size_t WidthOfPlane;
  size_t HeightOfPlane;
  size_t v13;
  size_t v14;
  signed int PixelFormatType;
  int v16;
  BOOL v17;
  void *v18;
  void *BaseAddressOfPlane;
  void *v20;
  void *v21;
  MTLDevice *device;
  void *v23;
  _QWORD v25[5];
  CVMetalTextureRef image;

  v8 = a5;
  v9 = a5 - 1;
  if (CVPixelBufferIsPlanar(a3))
  {
    BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
    WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
    HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
  }
  else
  {
    BytesPerRowOfPlane = CVPixelBufferGetBytesPerRow(a3);
    WidthOfPlane = CVPixelBufferGetWidth(a3);
    HeightOfPlane = CVPixelBufferGetHeight(a3);
  }
  v13 = HeightOfPlane;
  v14 = (v9 + WidthOfPlane) / v8;
  if (a4)
    goto LABEL_15;
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  a4 = 13;
  if (PixelFormatType > 1111970368)
  {
    if (PixelFormatType == 1380401729)
    {
LABEL_13:
      a4 = 73;
      goto LABEL_15;
    }
    if (PixelFormatType == 1278226488)
      goto LABEL_15;
    v16 = 1111970369;
  }
  else
  {
    if (PixelFormatType == 875704422 || PixelFormatType == 875704438)
      goto LABEL_15;
    v16 = 1094862674;
  }
  if (PixelFormatType == v16)
    goto LABEL_13;
  a4 = 0;
LABEL_15:
  image = 0;
  if (CVMetalTextureCacheCreateTextureFromImage((CFAllocatorRef)*MEMORY[0x1E0C9AE00], self->_textureCache, a3, MEMORY[0x1E0C9AA70], (MTLPixelFormat)a4, v14, v13, 0, &image))
  {
    v17 = 1;
  }
  else
  {
    v17 = image == 0;
  }
  if (v17
    || (CFAutorelease(image), CVMetalTextureGetTexture(image),
                              (v18 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v18 = 0;
    if (!CVPixelBufferLockBaseAddress(a3, 0))
    {
      if (CVPixelBufferIsPlanar(a3))
        BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(a3, 0);
      else
        BaseAddressOfPlane = CVPixelBufferGetBaseAddress(a3);
      v20 = BaseAddressOfPlane;
      objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", a4, v14, v13, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      device = self->_device;
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = sub_1D4D6D0C0;
      v25[3] = &unk_1E988B300;
      v25[4] = a3;
      v23 = (void *)-[MTLDevice newBufferWithBytesNoCopy:length:options:deallocator:](device, "newBufferWithBytesNoCopy:length:options:deallocator:", v20, v13 * BytesPerRowOfPlane, 0, v25);
      objc_msgSend(v21, "setStorageMode:", 0);
      v18 = (void *)objc_msgSend(v23, "newTextureWithDescriptor:offset:bytesPerRow:", v21, 0, BytesPerRowOfPlane);

    }
  }
  return v18;
}

- (void)_computeResponseMap_metal:(id)a3 inputTexture:(id)a4 outputTexture:(id)a5 garbagePixelCount:(unsigned int)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  id v18;
  _QWORD v19[3];
  _QWORD v20[3];
  unsigned int v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v21 = a6;
  if (!-[PipelineStatePromise groupWasSuccessful](self->_pipelineStates, "groupWasSuccessful"))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Failed to create compute pipeline state"), 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  objc_msgSend(v10, "computeCommandEncoder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PipelineStatePromise pipelineStateForFunction:](self->_pipelineStates, "pipelineStateForFunction:", self->_response4MapKernel);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setComputePipelineState:", v14);
  objc_msgSend(v13, "setTexture:atIndex:", v11, 0);
  objc_msgSend(v13, "setTexture:atIndex:", v12, 1);
  objc_msgSend(v13, "setBytes:length:atIndex:", &v21, 4, 0);
  v15 = objc_msgSend(v14, "threadExecutionWidth");
  v16 = objc_msgSend(v14, "maxTotalThreadsPerThreadgroup");
  v17 = v16 / objc_msgSend(v14, "threadExecutionWidth");
  v20[0] = (v15 + objc_msgSend(v11, "width") - 1) / v15;
  v20[1] = (v17 + objc_msgSend(v11, "height") - 1) / v17;
  v20[2] = 1;
  v19[0] = v15;
  v19[1] = v17;
  v19[2] = 1;
  objc_msgSend(v13, "dispatchThreadgroups:threadsPerThreadgroup:", v20, v19);
  objc_msgSend(v13, "endEncoding");

}

- (void)_suppressResponseMap_metal:(id)a3 unsuppressedTexture:(id)a4 suppressedTexture:(id)a5 garbagePixelCount:(unsigned int)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  id v18;
  _QWORD v19[3];
  _QWORD v20[3];
  unsigned int v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v21 = a6;
  if (!-[PipelineStatePromise groupWasSuccessful](self->_pipelineStates, "groupWasSuccessful"))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Failed to create compute pipeline state"), 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  objc_msgSend(v10, "computeCommandEncoder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PipelineStatePromise pipelineStateForFunction:](self->_pipelineStates, "pipelineStateForFunction:", self->_suppress4MapKernel);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setComputePipelineState:", v14);
  objc_msgSend(v13, "setTexture:atIndex:", v11, 0);
  objc_msgSend(v13, "setTexture:atIndex:", v12, 2);
  objc_msgSend(v13, "setBytes:length:atIndex:", &v21, 4, 0);
  v15 = objc_msgSend(v14, "threadExecutionWidth");
  v16 = objc_msgSend(v14, "maxTotalThreadsPerThreadgroup");
  v17 = v16 / objc_msgSend(v14, "threadExecutionWidth");
  v20[0] = (v15 + objc_msgSend(v11, "width") - 1) / v15;
  v20[1] = (v17 + objc_msgSend(v11, "height") - 1) / v17;
  v20[2] = 1;
  v19[0] = v15;
  v19[1] = v17;
  v19[2] = 1;
  objc_msgSend(v13, "dispatchThreadgroups:threadsPerThreadgroup:", v20, v19);
  objc_msgSend(v13, "endEncoding");

}

- (void)_generateHistograms_metal:(id)a3 suppressedTexture:(id)a4 tileBuffer:(id)a5 desiredKeypointCountsBuffer:(id)a6 thresholdsBuffer:(id)a7 histogramBuffer:(id)a8 thresholdRangeBuffer:(id)a9 keypointsAtChosenThresholdBuffer:(id)a10 truncatedRegionsBuffer:(id)a11 tileCount:(unint64_t)a12 maxTileHeight:(unint64_t)a13
{
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  int64x2_t v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  int64x2_t v34;
  uint64_t v35;
  unint64_t v36;
  int64x2_t v37;
  __int128 v38;
  uint64_t v39;
  unint64_t v40;
  int64x2_t v41;

  v19 = a3;
  v20 = a4;
  v33 = a5;
  v32 = a6;
  v31 = a7;
  v21 = a8;
  v30 = a9;
  v29 = a10;
  v28 = a11;
  if (!-[PipelineStatePromise groupWasSuccessful](self->_pipelineStates, "groupWasSuccessful"))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Failed to create compute pipeline state"), 0);
    v26 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v26);
  }
  objc_msgSend(v19, "blitCommandEncoder");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "fillBuffer:range:value:", v21, 0, objc_msgSend(v21, "length"), 0);
  objc_msgSend(v22, "endEncoding");
  objc_msgSend(v19, "computeCommandEncoder");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PipelineStatePromise pipelineStateForFunction:](self->_pipelineStates, "pipelineStateForFunction:", self->_computeHistogramKernel);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setComputePipelineState:", v24);

  objc_msgSend(v23, "setTexture:atIndex:", v20, 0);
  objc_msgSend(v23, "setBuffer:offset:atIndex:", v33, 0, 0);
  objc_msgSend(v23, "setBuffer:offset:atIndex:", v21, 0, 1);
  v27 = vdupq_n_s64(1uLL);
  v40 = a12;
  v41 = v27;
  v38 = xmmword_1D4DB1D00;
  v39 = 1;
  objc_msgSend(v23, "dispatchThreadgroups:threadsPerThreadgroup:", &v40, &v38);
  objc_msgSend(v23, "endEncoding");
  objc_msgSend(v19, "computeCommandEncoder");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setComputePipelineState:", self->_histogramThresholdPipelineState);
  objc_msgSend(v25, "setBuffer:offset:atIndex:", v32, 0, 0);
  objc_msgSend(v25, "setBuffer:offset:atIndex:", v21, 0, 1);
  objc_msgSend(v25, "setBuffer:offset:atIndex:", v31, 0, 2);
  objc_msgSend(v25, "setBuffer:offset:atIndex:", v30, 0, 3);
  objc_msgSend(v25, "setBuffer:offset:atIndex:", v29, 0, 4);
  objc_msgSend(v25, "setBuffer:offset:atIndex:", v28, 0, 5);
  v37 = v27;
  v34 = v27;
  v35 = 1;
  v36 = a12;
  objc_msgSend(v25, "dispatchThreadgroups:threadsPerThreadgroup:", &v36, &v34);
  objc_msgSend(v25, "endEncoding");

}

- (void)_cumulativeSum_metal:(id)a3 expectedPointsBuffer:(id)a4 cumulativePointsBuffer:(id)a5 regionCountBuffer:(id)a6 keypointCountBuffer:(id)a7 regionCount:(unint64_t)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  int64x2_t v20;
  uint64_t v21;
  int64x2_t v22;
  uint64_t v23;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (!-[PipelineStatePromise groupWasSuccessful](self->_pipelineStates, "groupWasSuccessful"))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Failed to create compute pipeline state"), 0);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v19);
  }
  objc_msgSend(v13, "computeCommandEncoder");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setComputePipelineState:", self->_cumulativeSumSimplePipelineState);
  objc_msgSend(v18, "setBuffer:offset:atIndex:", v14, 0, 0);
  objc_msgSend(v18, "setBuffer:offset:atIndex:", v15, 0, 1);
  objc_msgSend(v18, "setBuffer:offset:atIndex:", v16, 0, 2);
  objc_msgSend(v18, "setBuffer:offset:atIndex:", v17, 0, 3);
  v22 = vdupq_n_s64(1uLL);
  v23 = 1;
  v20 = v22;
  v21 = 1;
  objc_msgSend(v18, "dispatchThreadgroups:threadsPerThreadgroup:", &v22, &v20);
  objc_msgSend(v18, "endEncoding");

}

- (void)_listKeypointsSimple_metal:(id)a3 suppressedResponseMapTexture:(id)a4 tileBuffer:(id)a5 tileCountBuffer:(id)a6 tileCount:(unint64_t)a7 thresholdsBuffer:(id)a8 cumulativePointsBuffer:(id)a9 keypointLocationsBuffer:(id)a10 keypointResponsesBuffer:(id)a11 desiredKeypointsBuffer:(id)a12 indexBuffer:(id)a13
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  MetalFAST9BRIEF *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  int64x2_t v41;
  id v42;
  MetalFAST9BRIEF *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  unint64_t v49;
  unint64_t v50;
  __int128 v51;
  uint64_t v52;
  unint64_t v53;
  int64x2_t v54;

  v48 = a3;
  v39 = a4;
  v19 = a5;
  v40 = a6;
  v47 = a8;
  v20 = a9;
  v21 = a10;
  v22 = a11;
  v23 = a12;
  v24 = a13;
  v25 = self;
  if (!-[PipelineStatePromise groupWasSuccessful](self->_pipelineStates, "groupWasSuccessful"))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Failed to create compute pipeline state"), 0);
    v38 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v38);
  }
  v26 = v39;
  v27 = v48;
  v43 = v25;
  v44 = v24;
  v45 = v23;
  v46 = v20;
  if (a7)
  {
    v28 = 0;
    v29 = 0;
    v30 = 0;
    v41 = vdupq_n_s64(1uLL);
    v42 = v19;
    do
    {
      v50 = a7;
      v31 = v26;
      v32 = v22;
      v33 = objc_retainAutorelease(v19);
      v34 = objc_msgSend(v33, "contents");
      v49 = ((unint64_t)(*(_DWORD *)(v34 + 4 * (v30 + 3))
                                            * *(_DWORD *)(v34 + 4 * (v30 + 2)))
           + 511) >> 9;
      objc_msgSend(v27, "blitCommandEncoder");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "fillBuffer:range:value:", v44, 0, objc_msgSend(v44, "length"), 0);
      objc_msgSend(v35, "endEncoding");
      objc_msgSend(v27, "computeCommandEncoder");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setComputePipelineState:", v43->_listKeypointsSimplePipelineState);
      objc_msgSend(v36, "setBuffer:offset:atIndex:", v45, v28, 0);
      v37 = v33;
      v22 = v32;
      v26 = v31;
      objc_msgSend(v36, "setBuffer:offset:atIndex:", v37, v29, 1);
      objc_msgSend(v36, "setBuffer:offset:atIndex:", v47, v30, 2);
      objc_msgSend(v36, "setBuffer:offset:atIndex:", v22, 0, 3);
      objc_msgSend(v36, "setBuffer:offset:atIndex:", v21, 0, 4);
      objc_msgSend(v36, "setBuffer:offset:atIndex:", v46, v30, 5);
      objc_msgSend(v36, "setBuffer:offset:atIndex:", v44, 0, 6);
      objc_msgSend(v36, "setTexture:atIndex:", v31, 0);
      v53 = v49;
      v19 = v42;
      v54 = v41;
      v51 = xmmword_1D4DB1D10;
      v52 = 1;
      objc_msgSend(v36, "dispatchThreadgroups:threadsPerThreadgroup:", &v53, &v51);
      objc_msgSend(v36, "endEncoding");

      v27 = v48;
      v30 += 4;
      v29 += 16;
      v28 += 12;
      a7 = v50 - 1;
    }
    while (v50 != 1);
  }

}

- (void)_listKeypoints2_metal:(id)a3 suppressedResponseMapTexture:(id)a4 tileBuffer:(id)a5 tileCountBuffer:(id)a6 tileCount:(unint64_t)a7 thresholdsBuffer:(id)a8 cumulativePointsBuffer:(id)a9 keypointLocationsBuffer:(id)a10 keypointResponsesBuffer:(id)a11 maxRegionHeight:(double)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  __int128 v28;
  uint64_t v29;
  unint64_t v30;
  int64x2_t v31;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v24 = a11;
  if (!-[PipelineStatePromise groupWasSuccessful](self->_pipelineStates, "groupWasSuccessful"))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Failed to create compute pipeline state"), 0);
    v26 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v26);
  }
  objc_msgSend(v17, "computeCommandEncoder");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setComputePipelineState:", self->_listKeypoints2PipelineState);
  objc_msgSend(v25, "setThreadgroupMemoryLength:atIndex:", 128, 0);
  objc_msgSend(v25, "setBuffer:offset:atIndex:", v19, 0, 0);
  objc_msgSend(v25, "setBuffer:offset:atIndex:", v21, 0, 1);
  objc_msgSend(v25, "setBuffer:offset:atIndex:", v24, 0, 2);
  objc_msgSend(v25, "setBuffer:offset:atIndex:", v23, 0, 3);
  objc_msgSend(v25, "setBuffer:offset:atIndex:", v22, 0, 4);
  objc_msgSend(v25, "setBuffer:offset:atIndex:", v20, 0, 5);
  objc_msgSend(v25, "setTexture:atIndex:", v18, 0);
  v29 = 1;
  v30 = a7;
  v31 = vdupq_n_s64(1uLL);
  v28 = xmmword_1D4DB1D00;
  objc_msgSend(v25, "dispatchThreadgroups:threadsPerThreadgroup:", &v30, &v28);
  objc_msgSend(v25, "endEncoding");

}

- (void)_listKeypoints3_metal:(id)a3 suppressedResponseMapTexture:(id)a4 tileBuffer:(id)a5 tileCountBuffer:(id)a6 tileCount:(unint64_t)a7 thresholdsBuffer:(id)a8 cumulativePointsBuffer:(id)a9 keypointLocationsBuffer:(id)a10 keypointResponsesBuffer:(id)a11 maxRegionHeight:(double)a12 maxRegionWidth:(double)a13
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v31;
  __int128 v32;
  uint64_t v33;
  _QWORD v34[3];

  v20 = a3;
  v31 = a4;
  v21 = a5;
  v22 = a6;
  v23 = a8;
  v24 = a9;
  v25 = a10;
  v26 = a11;
  if (!-[PipelineStatePromise groupWasSuccessful](self->_pipelineStates, "groupWasSuccessful"))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Failed to create compute pipeline state"), 0);
    v28 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v28);
  }
  objc_msgSend(v20, "computeCommandEncoder");
  v29 = v20;
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setComputePipelineState:", self->_listKeypoints3PipelineState);
  objc_msgSend(v27, "setThreadgroupMemoryLength:atIndex:", 256, 0);
  objc_msgSend(v27, "setBuffer:offset:atIndex:", v21, 0, 0);
  objc_msgSend(v27, "setBuffer:offset:atIndex:", v23, 0, 1);
  objc_msgSend(v27, "setBuffer:offset:atIndex:", v26, 0, 2);
  objc_msgSend(v27, "setBuffer:offset:atIndex:", v25, 0, 3);
  objc_msgSend(v27, "setBuffer:offset:atIndex:", v24, 0, 4);
  objc_msgSend(v27, "setBuffer:offset:atIndex:", v22, 0, 5);
  objc_msgSend(v27, "setTexture:atIndex:", v31, 0);
  v34[0] = (unint64_t)((int)a13 + 31) >> 5;
  v34[1] = (unint64_t)((int)a12 + 1) >> 1;
  v34[2] = a7;
  v32 = xmmword_1D4DB1D20;
  v33 = 1;
  objc_msgSend(v27, "dispatchThreadgroups:threadsPerThreadgroup:", v34, &v32);
  objc_msgSend(v27, "endEncoding");

}

- (void)_refineKeypoints_metal:(id)a3 inputImageTexture:(id)a4 keypointLocationsBuffer:(id)a5 refinedLocationsBuffer:(id)a6 keypointCountBuffer:(id)a7 keypointCount:(unint64_t)a8 debugIntermediatesBuffer:(id)a9 cumulativePointsBuffer:(id)a10 tileCountBuffer:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  __int128 v27;
  uint64_t v28;
  _BYTE v29[24];

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a9;
  v22 = a10;
  v23 = a11;
  if (!-[PipelineStatePromise groupWasSuccessful](self->_pipelineStates, "groupWasSuccessful"))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Failed to create compute pipeline state"), 0);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v25);
  }
  objc_msgSend(v16, "computeCommandEncoder");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setComputePipelineState:", self->_refineKeypointPipelineState);
  objc_msgSend(v24, "setTexture:atIndex:", v17, 0);
  objc_msgSend(v24, "setBuffer:offset:atIndex:", v18, 0, 0);
  objc_msgSend(v24, "setBuffer:offset:atIndex:", v19, 0, 1);
  objc_msgSend(v24, "setBuffer:offset:atIndex:", v20, 0, 2);
  objc_msgSend(v24, "setBuffer:offset:atIndex:", v22, 0, 3);
  objc_msgSend(v24, "setBuffer:offset:atIndex:", v23, 0, 4);
  objc_msgSend(v24, "setBuffer:offset:atIndex:", v21, 0, 5);
  objc_msgSend(v24, "setSamplerState:atIndex:", self->_clampedLinearNonNormSamplerState, 0);
  if (a8)
  {
    *(_QWORD *)v29 = (a8 + 31) >> 5;
    *(int64x2_t *)&v29[8] = vdupq_n_s64(1uLL);
    v27 = xmmword_1D4DB1D00;
    v28 = 1;
    objc_msgSend(v24, "dispatchThreadgroups:threadsPerThreadgroup:", v29, &v27);
  }
  else
  {
    *(_OWORD *)v29 = xmmword_1D4DB1D00;
    *(_QWORD *)&v29[16] = 1;
    objc_msgSend(v24, "dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:", v20, 4, v29);
  }
  objc_msgSend(v24, "endEncoding");

}

- (void)_extractORB_metal:(id)a3 boxBlurredTexture:(id)a4 keypointLocationsBuffer:(id)a5 outputORBDescriptorBuffer:(id)a6 keypointCountBuffer:(id)a7 keypointCount:(unint64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  __int128 v21;
  uint64_t v22;
  _BYTE v23[24];

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  if (!-[PipelineStatePromise groupWasSuccessful](self->_pipelineStates, "groupWasSuccessful"))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Failed to create compute pipeline state"), 0);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v20);
  }
  objc_msgSend(v14, "computeCommandEncoder");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setComputePipelineState:", self->_extractORBPipelineState);
  objc_msgSend(v19, "setTexture:atIndex:", v15, 0);
  objc_msgSend(v19, "setBuffer:offset:atIndex:", v18, 0, 0);
  objc_msgSend(v19, "setBuffer:offset:atIndex:", v16, 0, 1);
  objc_msgSend(v19, "setBuffer:offset:atIndex:", v17, 0, 2);
  if (a8)
  {
    *(_QWORD *)v23 = (a8 + 31) >> 5;
    *(int64x2_t *)&v23[8] = vdupq_n_s64(1uLL);
    v21 = xmmword_1D4DB1D00;
    v22 = 1;
    objc_msgSend(v19, "dispatchThreadgroups:threadsPerThreadgroup:", v23, &v21);
  }
  else
  {
    *(_OWORD *)v23 = xmmword_1D4DB1D00;
    *(_QWORD *)&v23[16] = 1;
    objc_msgSend(v19, "dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:", v18, 4, v23);
  }
  objc_msgSend(v19, "endEncoding");

}

- (void)_boxBlur_metal:(id)a3 inputImageTexture:(id)a4 boxBlurredTexture:(id)a5
{
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  id v14;
  __int128 v15;
  uint64_t v16;
  _QWORD v17[3];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!-[PipelineStatePromise groupWasSuccessful](self->_pipelineStates, "groupWasSuccessful"))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Failed to create compute pipeline state"), 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v14);
  }
  v11 = (((unint64_t)(objc_msgSend(v10, "width") + 3) >> 2) + 7) >> 3;
  v12 = (((unint64_t)(objc_msgSend(v10, "height") + 1) >> 1) + 1) >> 1;
  objc_msgSend(v8, "computeCommandEncoder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setComputePipelineState:", self->_boxBlurPipelineState);
  objc_msgSend(v13, "setTexture:atIndex:", v9, 0);
  objc_msgSend(v13, "setTexture:atIndex:", v10, 1);
  v17[0] = v11;
  v17[1] = v12;
  v17[2] = 1;
  v15 = xmmword_1D4DB1D30;
  v16 = 1;
  objc_msgSend(v13, "dispatchThreadgroups:threadsPerThreadgroup:", v17, &v15);
  objc_msgSend(v13, "endEncoding");

}

- (void)_ORBDescriptorsFromTextures_part1_metal:(id)a3 inputTexture_RGBA8Uint:(id)a4 inputTexture_R8Unorm:(id)a5 responseBuffer:(id)a6 cumulativeKeypointsPerRegionBuffer:(id)a7 intermediateBuffers:(id)a8
{
  id v14;
  id v15;
  id v16;
  uint64_t v17;
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
  uint64_t v34;
  void *v35;
  void *v36;
  MetalFAST9BRIEF *v37;
  id v38;
  id v39;
  void *v40;
  id v41;

  v14 = a8;
  v38 = a7;
  v39 = a6;
  v15 = a4;
  v16 = a3;
  v17 = -(int)objc_msgSend(a5, "width") & 3;
  objc_msgSend(v14, "responseTexture");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = self;
  v40 = v16;
  -[MetalFAST9BRIEF _computeResponseMap_metal:inputTexture:outputTexture:garbagePixelCount:](self, "_computeResponseMap_metal:inputTexture:outputTexture:garbagePixelCount:", v16, v15, v18, v17);

  objc_msgSend(v14, "responseTexture");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "suppressedResponseTexture_RGBA8Uint");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[MetalFAST9BRIEF _suppressResponseMap_metal:unsuppressedTexture:suppressedTexture:garbagePixelCount:](self, "_suppressResponseMap_metal:unsuppressedTexture:suppressedTexture:garbagePixelCount:", v16, v19, v20, v17);

  objc_msgSend(v14, "suppressedResponseTexture_R8Unorm");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "rectRegionsBuffer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "rectRegionsDesiredKeypoints");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "thresholdsBuffer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "histogramsBuffer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "thresholdRangeBuffer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "countOfKeypointsPerRegion");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "truncatedRegionsBuffer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[MetalFAST9BRIEF _generateHistograms_metal:suppressedTexture:tileBuffer:desiredKeypointCountsBuffer:thresholdsBuffer:histogramBuffer:thresholdRangeBuffer:keypointsAtChosenThresholdBuffer:truncatedRegionsBuffer:tileCount:maxTileHeight:](v37, "_generateHistograms_metal:suppressedTexture:tileBuffer:desiredKeypointCountsBuffer:thresholdsBuffer:histogramBuffer:thresholdRangeBuffer:keypointsAtChosenThresholdBuffer:truncatedRegionsBuffer:tileCount:maxTileHeight:", v40, v21, v22, v23, v24, v25, v26, v27, v28, (int)objc_msgSend(v14, "countOfRectRegions"), (int)objc_msgSend(v14, "maxRegionHeight"));

  objc_msgSend(v14, "countOfKeypointsPerRegion");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "rectRegionCount");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "keypointCountBuffer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[MetalFAST9BRIEF _cumulativeSum_metal:expectedPointsBuffer:cumulativePointsBuffer:regionCountBuffer:keypointCountBuffer:regionCount:](v37, "_cumulativeSum_metal:expectedPointsBuffer:cumulativePointsBuffer:regionCountBuffer:keypointCountBuffer:regionCount:", v40, v29, v38, v30, v31, 0);

  objc_msgSend(v14, "suppressedResponseTexture_R8Uint");
  v41 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "rectRegionsBuffer");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "rectRegionCount");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (int)objc_msgSend(v14, "countOfRectRegions");
  objc_msgSend(v14, "thresholdsBuffer");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "compactKeypointsBuffer");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v22) = objc_msgSend(v14, "maxRegionHeight");

  -[MetalFAST9BRIEF _listKeypoints2_metal:suppressedResponseMapTexture:tileBuffer:tileCountBuffer:tileCount:thresholdsBuffer:cumulativePointsBuffer:keypointLocationsBuffer:keypointResponsesBuffer:maxRegionHeight:](v37, "_listKeypoints2_metal:suppressedResponseMapTexture:tileBuffer:tileCountBuffer:tileCount:thresholdsBuffer:cumulativePointsBuffer:keypointLocationsBuffer:keypointResponsesBuffer:maxRegionHeight:", v40, v41, v32, v33, v34, v35, (double)v22, v38, v36, v39);
}

- (void)_ORBDescriptorsFromTextures_part2_metal:(id)a3 inputTexture_RGBA8Uint:(id)a4 inputTexture_R8Unorm:(id)a5 descriptorBuffer:(id)a6 refinedKeypointsBuffer:(id)a7 cumulativeKeypointsPerRegionBuffer:(id)a8 intermediateBuffers:(id)a9 keypointCount:(int)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v27;
  id v28;
  id v29;
  id v30;

  v16 = a9;
  v17 = a8;
  v27 = a7;
  v28 = a6;
  v18 = a5;
  v29 = a4;
  v19 = a3;
  objc_msgSend(v16, "compactKeypointsBuffer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "keypointCountBuffer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "refinementIntermediatesBuffer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "rectRegionCount");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[MetalFAST9BRIEF _refineKeypoints_metal:inputImageTexture:keypointLocationsBuffer:refinedLocationsBuffer:keypointCountBuffer:keypointCount:debugIntermediatesBuffer:cumulativePointsBuffer:tileCountBuffer:](self, "_refineKeypoints_metal:inputImageTexture:keypointLocationsBuffer:refinedLocationsBuffer:keypointCountBuffer:keypointCount:debugIntermediatesBuffer:cumulativePointsBuffer:tileCountBuffer:", v19, v18, v20, v27, v21, a10, v22, v17, v23);

  objc_msgSend(v16, "boxBlurredTexture_R8Uint");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[MetalFAST9BRIEF _boxBlur_metal:inputImageTexture:boxBlurredTexture:](self, "_boxBlur_metal:inputImageTexture:boxBlurredTexture:", v19, v29, v24);

  objc_msgSend(v16, "boxBlurredTexture_R8Uint");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "keypointCountBuffer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  -[MetalFAST9BRIEF _extractORB_metal:boxBlurredTexture:keypointLocationsBuffer:outputORBDescriptorBuffer:keypointCountBuffer:keypointCount:](self, "_extractORB_metal:boxBlurredTexture:keypointLocationsBuffer:outputORBDescriptorBuffer:keypointCountBuffer:keypointCount:", v19, v30, v27, v28, v25, a10);
}

- (void)ORBDescriptorsFromPixelBuffer_metal:(id)a3 inputBuffer:(__CVBuffer *)a4 descriptorBuffer:(id)a5 refinedKeypointsBuffer:(id)a6 responseBuffer:(id)a7 cumulativeKeypointsPerRegionBuffer:(id)a8 intermediateBuffers:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  CGFloat x;
  float v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  id v29;
  id v30;
  uint64_t v31;
  id v32;
  id v33;
  id v34;
  CGRect CleanRect;

  v15 = a3;
  v32 = a5;
  v16 = a6;
  v33 = a7;
  v17 = a8;
  v18 = a9;
  if (!-[PipelineStatePromise groupWasSuccessful](self->_pipelineStates, "groupWasSuccessful"))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Failed to create compute pipeline state"), 0);
    v30 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v30);
  }
  -[MetalFAST9BRIEF _textureFromPixelBuffer:forcedMetalPixelFormat:forcedWidthDivisior:](self, "_textureFromPixelBuffer:forcedMetalPixelFormat:forcedWidthDivisior:", a4, 10, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[MTLDevice supportsFeatureSet:](self->_device, "supportsFeatureSet:", 4);
  v34 = v15;
  v21 = v34;
  if ((v20 & 1) == 0)
  {
    -[MTLCommandQueue commandBuffer](self->_queue, "commandBuffer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v22 = v16;
  CleanRect = CVImageBufferGetCleanRect(a4);
  x = CleanRect.origin.x;
  v24 = CVImageBufferGetEncodedSize(a4).height - (CleanRect.origin.y + CleanRect.size.height);
  objc_msgSend(v18, "gaussianBlurredTexture_R8Unorm");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&x = x;
  -[MetalFAST9BRIEF _gaussianishBlur_metal:inputTexture:outputTexture:offset:](self, "_gaussianishBlur_metal:inputTexture:outputTexture:offset:", v21, v19, v25, *(float *)&x, v24);

  objc_msgSend(v18, "gaussianBlurredTexture_RGBA8Uint");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "gaussianBlurredTexture_R8Unorm");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[MetalFAST9BRIEF _ORBDescriptorsFromTextures_part1_metal:inputTexture_RGBA8Uint:inputTexture_R8Unorm:responseBuffer:cumulativeKeypointsPerRegionBuffer:intermediateBuffers:](self, "_ORBDescriptorsFromTextures_part1_metal:inputTexture_RGBA8Uint:inputTexture_R8Unorm:responseBuffer:cumulativeKeypointsPerRegionBuffer:intermediateBuffers:", v21, v26, v27, v33, v17, v18);
  if ((v20 & 1) != 0)
  {
    v28 = 0;
  }
  else
  {
    objc_msgSend(v21, "commit");
    objc_msgSend(v21, "waitUntilCompleted");
    objc_msgSend(v18, "keypointCountBuffer");
    v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v28 = *(_DWORD *)objc_msgSend(v29, "contents");

  }
  LODWORD(v31) = v28;
  -[MetalFAST9BRIEF _ORBDescriptorsFromTextures_part2_metal:inputTexture_RGBA8Uint:inputTexture_R8Unorm:descriptorBuffer:refinedKeypointsBuffer:cumulativeKeypointsPerRegionBuffer:intermediateBuffers:keypointCount:](self, "_ORBDescriptorsFromTextures_part2_metal:inputTexture_RGBA8Uint:inputTexture_R8Unorm:descriptorBuffer:refinedKeypointsBuffer:cumulativeKeypointsPerRegionBuffer:intermediateBuffers:keypointCount:", v34, v26, v27, v32, v22, v17, v18, v31);

}

- (void)_gaussianishBlur_metal:(id)a3 inputTexture:(id)a4 outputTexture:(id)a5 offset:(CGPoint)a6
{
  double y;
  double x;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  id v19;
  _QWORD v20[3];
  _QWORD v21[3];
  _DWORD v22[2];
  uint64_t v23;
  uint64_t v24;

  y = a6.y;
  x = a6.x;
  v24 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (!-[PipelineStatePromise groupWasSuccessful](self->_pipelineStates, "groupWasSuccessful"))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Failed to create compute pipeline state"), 0);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v19);
  }
  objc_msgSend(v11, "computeCommandEncoder");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = rint(x);
  v22[1] = rint(y);
  v23 = 0;
  -[PipelineStatePromise pipelineStateForFunction:](self->_pipelineStates, "pipelineStateForFunction:", self->_gaussianishBlurKernel);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setComputePipelineState:", v15);
  objc_msgSend(v14, "setTexture:atIndex:", v12, 0);
  objc_msgSend(v14, "setTexture:atIndex:", v13, 1);
  objc_msgSend(v14, "setBytes:length:atIndex:", v22, 16, 0);
  v16 = objc_msgSend(v15, "threadExecutionWidth");
  v17 = objc_msgSend(v15, "maxTotalThreadsPerThreadgroup");
  v18 = v17 / objc_msgSend(v15, "threadExecutionWidth");
  v21[0] = (v16 + objc_msgSend(v13, "width") - 1) / v16;
  v21[1] = (v18 + objc_msgSend(v13, "height") - 1) / v18;
  v21[2] = 1;
  v20[0] = v16;
  v20[1] = v18;
  v20[2] = 1;
  objc_msgSend(v14, "dispatchThreadgroups:threadsPerThreadgroup:", v21, v20);
  objc_msgSend(v14, "endEncoding");

}

+ (id)_createMTLBufferFromRects:(id)a3 device:(id)a4 storageMode:(unint64_t)a5 maxRectWidth:(unint64_t *)a6 maxRectHeight:(unint64_t *)a7
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  int32x4_t v17;
  uint32x2_t v18;
  __int128 v19;
  __int128 v20;
  int32x4_t v22;
  float64x2_t v23;
  float64x2_t v24;

  v11 = a3;
  v12 = a4;
  v13 = objc_retainAutorelease((id)objc_msgSend(v12, "newBufferWithLength:options:", 48 * objc_msgSend(v11, "count"), 16 * a5));
  v14 = objc_msgSend(v13, "contents");
  if (objc_msgSend(v11, "count"))
  {
    v15 = 0;
    v22 = 0u;
    do
    {
      objc_msgSend(v11, "objectAtIndex:", v15, v22.i64[0]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0u;
      v24 = 0u;
      objc_msgSend(v16, "getValue:size:", &v23, 32);
      v17 = (int32x4_t)vcvtq_u64_f64(v24);
      v18 = (uint32x2_t)vmovn_s64((int64x2_t)v17);
      *(int32x4_t *)(v14 + 16 * v15) = vuzp1q_s32((int32x4_t)vcvtq_u64_f64(v23), v17);
      v17.i64[1] = v22.i64[1];
      *(uint32x2_t *)v17.i8 = vmax_u32(*(uint32x2_t *)v22.i8, v18);
      v22 = v17;

      ++v15;
    }
    while (objc_msgSend(v11, "count") > v15);
    *(_QWORD *)&v19 = v22.u32[0];
    *((_QWORD *)&v19 + 1) = v22.u32[1];
    v20 = v19;
    if (a6)
      goto LABEL_5;
  }
  else
  {
    v20 = 0uLL;
    if (a6)
LABEL_5:
      *a6 = v20;
  }
  if (a7)
    *a7 = *((_QWORD *)&v20 + 1);

  return v13;
}

+ (id)_createMTLBufferFromRectRegionsDesiredKeypoints:(id)a3 device:(id)a4 storageMode:(unint64_t)a5 maxAllowedDescriptors:(unint64_t *)a6
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unsigned int v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;

  v8 = a3;
  v9 = a4;
  v10 = objc_retainAutorelease((id)objc_msgSend(v9, "newBufferWithLength:options:", 12 * objc_msgSend(v8, "count"), 16 * a5));
  v11 = objc_msgSend(v10, "contents");
  if ((unint64_t)objc_msgSend(v8, "count") >= 2)
  {
    v13 = 0;
    v14 = 0;
    v12 = 0;
    v15 = 1;
    do
    {
      objc_msgSend(v8, "objectAtIndex:", v15 - 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)(v11 + 4 * v13) = objc_msgSend(v16, "unsignedIntValue");

      objc_msgSend(v8, "objectAtIndex:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)(v11 + 4 * (v13 + 1)) = objc_msgSend(v17, "unsignedIntValue");

      v18 = (*(_DWORD *)(v11 + 4 * (v13 + 1)) + *(_DWORD *)(v11 + 4 * v13));
      *(_DWORD *)(v11 + 4 * (v13 + 2)) = v18;
      v12 += v18;
      ++v14;
      v13 += 3;
      v15 += 2;
    }
    while (v14 < (unint64_t)objc_msgSend(v8, "count") >> 1);
  }
  else
  {
    v12 = 0;
  }
  if (a6)
    *a6 = v12;

  return v10;
}

- (MTLDevice)device
{
  return (MTLDevice *)objc_getProperty(self, a2, 8, 1);
}

- (MTLCommandQueue)queue
{
  return (MTLCommandQueue *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipelineStates, 0);
  objc_storeStrong((id *)&self->_clampedLinearNonNormSamplerState, 0);
  objc_storeStrong((id *)&self->_gaussianishBlurKernel, 0);
  objc_storeStrong((id *)&self->_boxBlurR8PipelineState, 0);
  objc_storeStrong((id *)&self->_boxBlurPipelineState, 0);
  objc_storeStrong((id *)&self->_extractORBPipelineState, 0);
  objc_storeStrong((id *)&self->_refineKeypointPipelineState, 0);
  objc_storeStrong((id *)&self->_boxBlurKernel_R8, 0);
  objc_storeStrong((id *)&self->_boxBlurKernel, 0);
  objc_storeStrong((id *)&self->_extractORBKernel, 0);
  objc_storeStrong((id *)&self->_refineKeypointKernel, 0);
  objc_storeStrong((id *)&self->_listKeypoints3PipelineState, 0);
  objc_storeStrong((id *)&self->_listKeypoints2PipelineState, 0);
  objc_storeStrong((id *)&self->_listKeypointsPipelineState, 0);
  objc_storeStrong((id *)&self->_listKeypointsSimplePipelineState, 0);
  objc_storeStrong((id *)&self->_listKeypoints3Kernel, 0);
  objc_storeStrong((id *)&self->_listKeypoints2Kernel, 0);
  objc_storeStrong((id *)&self->_listKeypointsKernel, 0);
  objc_storeStrong((id *)&self->_listKeypointsSimpleKernel, 0);
  objc_storeStrong((id *)&self->_compactMPSBuffersPipelineState, 0);
  objc_storeStrong((id *)&self->_cumulativeSumSimplePipelineState, 0);
  objc_storeStrong((id *)&self->_histogramThresholdPipelineState, 0);
  objc_storeStrong((id *)&self->_compactMPSBuffersKernel, 0);
  objc_storeStrong((id *)&self->_cumulativeSumSimpleKernel, 0);
  objc_storeStrong((id *)&self->_histogramThresholdKernel, 0);
  objc_storeStrong((id *)&self->_computeHistogramKernel, 0);
  objc_storeStrong((id *)&self->_suppressMapKernel, 0);
  objc_storeStrong((id *)&self->_responseMapKernel, 0);
  objc_storeStrong((id *)&self->_compute4HistogramKernel, 0);
  objc_storeStrong((id *)&self->_suppress4MapKernel, 0);
  objc_storeStrong((id *)&self->_response4MapKernel, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
