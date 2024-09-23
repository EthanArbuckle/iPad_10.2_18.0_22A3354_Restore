@implementation BWCompressedShotBufferNode

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[BWNode outputs](self, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(a4, "index")), "setFormat:", a3);
}

- (id)nodeType
{
  return CFSTR("Effect");
}

- (BWNodeOutput)sensorRawOutput
{
  return self->_sensorRawOutput;
}

- (BWNodeInput)sensorRawInput
{
  return self->_sensorRawInput;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (BWCompressedShotBufferNode)initWithNodeConfiguration:(id)a3 compressionInputDimensions:(id)a4
{
  BWCompressedShotBufferNode *v6;
  BWCompressedShotBufferNode *v7;
  unsigned int v8;
  int v9;
  BWNodeInput *v10;
  BWNodeOutput *v11;
  BWNodeInput *v12;
  BWVideoFormatRequirements *v13;
  BWNodeOutput *v14;
  BWVideoFormatRequirements *v15;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  objc_super v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)BWCompressedShotBufferNode;
  v6 = -[BWNode init](&v18, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_bufferTrackingLock._os_unfair_lock_opaque = 0;
    v6->_uncompressedEquivalentCapacity = 11;
    v6->_queuedCompressedSampleBuffers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7->_passthroughEnabled = 1;
    v7->_compressWhenCompressedBuffersInUseEnabled = 1;
    v7->_compressionTiles = 2;
    v7->_compressedSurfacePoolEnabled = 0;
    if (FigCaptureVideoDimensionsAreValid(*(_QWORD *)&a4))
    {
      v7->_compressionInputDimensionsInit = ($470D365275581EF16070F5A11344F73E)a4;
      objc_msgSend(a3, "figThreadPriority");
      v7->_decompressionQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
      v8 = objc_msgSend(a3, "depthDataType");
      if (v8 <= 8)
      {
        if (((1 << v8) & 0xF6) != 0)
        {
LABEL_5:

          return 0;
        }
        if (((1 << v8) & 9) != 0)
          v9 = 5;
        else
          v9 = 7;
        v7->_decompressionPoolCapacity = v9;
      }
      v10 = -[BWNodeInput initWithMediaType:node:index:]([BWNodeInput alloc], "initWithMediaType:node:index:", 1986618469, v7, 0);
      -[BWNodeInputMediaConfiguration setFormatRequirements:](-[BWNodeInput primaryMediaConfiguration](v10, "primaryMediaConfiguration"), "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
      -[BWNodeInputMediaConfiguration setPassthroughMode:](-[BWNodeInput primaryMediaConfiguration](v10, "primaryMediaConfiguration"), "setPassthroughMode:", 1);
      -[BWNode addInput:](v7, "addInput:", v10);
      v11 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v7);
      -[BWNodeOutputMediaConfiguration setFormatRequirements:](-[BWNodeOutput primaryMediaConfiguration](v11, "primaryMediaConfiguration"), "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
      -[BWNodeOutputMediaConfiguration setPassthroughMode:](-[BWNodeOutput primaryMediaConfiguration](v11, "primaryMediaConfiguration"), "setPassthroughMode:", 1);
      -[BWNodeOutputMediaConfiguration setIndexOfInputWhichDrivesThisOutput:](-[BWNodeOutput primaryMediaConfiguration](v11, "primaryMediaConfiguration"), "setIndexOfInputWhichDrivesThisOutput:", -[BWNodeInput index](v10, "index"));
      -[BWNode addOutput:](v7, "addOutput:", v11);
      v12 = -[BWNodeInput initWithMediaType:node:index:]([BWNodeInput alloc], "initWithMediaType:node:index:", 1986618469, v7, 1);
      v13 = objc_alloc_init(BWVideoFormatRequirements);
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v13, "setSupportedPixelFormats:", &unk_1E4A00218);
      -[BWNodeInputMediaConfiguration setFormatRequirements:](-[BWNodeInput primaryMediaConfiguration](v12, "primaryMediaConfiguration"), "setFormatRequirements:", v13);
      -[BWNodeInputMediaConfiguration setPassthroughMode:](-[BWNodeInput primaryMediaConfiguration](v12, "primaryMediaConfiguration"), "setPassthroughMode:", 1);
      -[BWNode addInput:](v7, "addInput:", v12);
      v7->_sensorRawInput = v12;
      v14 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v7);
      v15 = objc_alloc_init(BWVideoFormatRequirements);
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v15, "setSupportedPixelFormats:", &unk_1E4A00218);
      -[BWNodeOutputMediaConfiguration setFormatRequirements:](-[BWNodeOutput primaryMediaConfiguration](v14, "primaryMediaConfiguration"), "setFormatRequirements:", v15);
      -[BWNodeOutputMediaConfiguration setPassthroughMode:](-[BWNodeOutput primaryMediaConfiguration](v14, "primaryMediaConfiguration"), "setPassthroughMode:", 1);
      -[BWNodeOutputMediaConfiguration setIndexOfInputWhichDrivesThisOutput:](-[BWNodeOutput primaryMediaConfiguration](v14, "primaryMediaConfiguration"), "setIndexOfInputWhichDrivesThisOutput:", -[BWNodeInput index](v12, "index"));
      -[BWNode addOutput:](v7, "addOutput:", v14);
      v7->_sensorRawOutput = v14;
      return v7;
    }
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    goto LABEL_5;
  }
  return v7;
}

- (void)dealloc
{
  CMPhotoCompressionSession *compressionSession;
  opaqueCMFormatDescription *decompressionFormatDescription;
  objc_super v5;

  compressionSession = self->_compressionSession;
  if (compressionSession)
    CFRelease(compressionSession);

  decompressionFormatDescription = self->_decompressionFormatDescription;
  if (decompressionFormatDescription)
    CFRelease(decompressionFormatDescription);
  v5.receiver = self;
  v5.super_class = (Class)BWCompressedShotBufferNode;
  -[BWNode dealloc](&v5, sel_dealloc);
}

- (id)nodeSubType
{
  return CFSTR("CompressedShotBuffer");
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __86__BWCompressedShotBufferNode_configurationWithID_updatedFormat_didBecomeLiveForInput___block_invoke;
  v5[3] = &unk_1E491E748;
  v5[4] = self;
  v5[5] = a5;
  -[BWCompressedShotBufferNode _asyncOnDecompressionQueue:]((uint64_t)self, (uint64_t)v5);
}

uint64_t __86__BWCompressedShotBufferNode_configurationWithID_updatedFormat_didBecomeLiveForInput___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "outputs"), "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 40), "index")), "makeConfiguredFormatLive");
}

- (void)_asyncOnDecompressionQueue:(uint64_t)a1
{
  NSObject *v2;
  _QWORD block[5];

  if (a1)
  {
    if (a2)
    {
      v2 = *(NSObject **)(a1 + 200);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __57__BWCompressedShotBufferNode__asyncOnDecompressionQueue___block_invoke;
      block[3] = &unk_1E491ECB8;
      block[4] = a2;
      dispatch_async(v2, block);
    }
  }
}

- (void)handleStillImagePrewarmWithSettings:(id)a3 forInput:(id)a4
{
  _QWORD v4[7];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __75__BWCompressedShotBufferNode_handleStillImagePrewarmWithSettings_forInput___block_invoke;
  v4[3] = &unk_1E491EB90;
  v4[4] = self;
  v4[5] = a4;
  v4[6] = a3;
  -[BWCompressedShotBufferNode _asyncOnDecompressionQueue:]((uint64_t)self, (uint64_t)v4);
}

uint64_t __75__BWCompressedShotBufferNode_handleStillImagePrewarmWithSettings_forInput___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "outputs"), "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 40), "index")), "emitStillImagePrewarmMessageWithSettings:", *(_QWORD *)(a1 + 48));
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  _QWORD v4[7];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__BWCompressedShotBufferNode_handleNodeError_forInput___block_invoke;
  v4[3] = &unk_1E491EB90;
  v4[4] = self;
  v4[5] = a4;
  v4[6] = a3;
  -[BWCompressedShotBufferNode _asyncOnDecompressionQueue:]((uint64_t)self, (uint64_t)v4);
}

uint64_t __55__BWCompressedShotBufferNode_handleNodeError_forInput___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "outputs"), "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 40), "index")), "emitNodeError:", *(_QWORD *)(a1 + 48));
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v8;
  void *v9;
  _QWORD *v10;
  $470D365275581EF16070F5A11344F73E *p_compressionInputDimensions;
  uint64_t compressionInputDimensionsInit;
  const opaqueCMFormatDescription *FormatDescription;
  int inUseUncompressedBufferCount;
  uint64_t inUseCompressedBufferCount;
  int width;
  uint64_t v17;
  float v18;
  int64_t inUseCompressedBytes;
  float v20;
  uint64_t v21;
  int64_t v22;
  int64_t compressedByteCapacity;
  NSObject *v24;
  BWPixelBufferPool *decompressionPool;
  uint64_t v26;
  NSObject *v27;
  CMAttachmentBearerRef v28;
  OpaqueCMBlockBuffer *DataBuffer;
  int64_t DataLength;
  int64_t v31;
  CFTypeRef v32;
  CFTypeRef v33;
  _QWORD v34[8];
  _QWORD v35[7];
  _QWORD v36[5];
  os_log_type_t type;
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v33 = CMGetAttachment(a3, CFSTR("StillSettings"), 0);
  if (dword_1EE6BE6D8)
  {
    v38 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if ((-[BWCompressedShotBufferNode _shouldPassthroughSampleBuffer:forInput:]((uint64_t)self, a3, (uint64_t)a4) & 1) != 0)
  {
    if (a3)
    {
      v8 = (void *)CFRetain(a3);
      goto LABEL_6;
    }
LABEL_18:
    FigDebugAssert3();
    goto LABEL_42;
  }
  if (!self->_decompressionPool)
    -[BWCompressedShotBufferNode _setupDecompressionPool]((BWPixelBufferPool *)self);
  os_unfair_lock_lock(&self->_bufferTrackingLock);
  p_compressionInputDimensions = &self->_compressionInputDimensions;
  if (!FigCaptureVideoDimensionsAreValid(*(_QWORD *)&self->_compressionInputDimensions))
  {
    compressionInputDimensionsInit = (uint64_t)self->_compressionInputDimensionsInit;
    *p_compressionInputDimensions = ($470D365275581EF16070F5A11344F73E)compressionInputDimensionsInit;
    if (!FigCaptureVideoDimensionsAreValid(compressionInputDimensionsInit))
    {
      FormatDescription = CMSampleBufferGetFormatDescription(a3);
      *p_compressionInputDimensions = ($470D365275581EF16070F5A11344F73E)CMVideoFormatDescriptionGetDimensions(FormatDescription);
    }
    -[BWCompressedShotBufferNode _updateCompressedByteCapacity]((uint64_t)self);
  }
  inUseUncompressedBufferCount = self->_inUseUncompressedBufferCount;
  if (inUseUncompressedBufferCount < self->_decompressionPoolCapacity && self->_inUseCompressedBufferCount <= 0)
  {
    decompressionPool = self->_decompressionPool;
    if (decompressionPool)
    {
      if (!-[BWPixelBufferPool isPixelBufferAvailable](decompressionPool, "isPixelBufferAvailable"))
        goto LABEL_16;
      inUseUncompressedBufferCount = self->_inUseUncompressedBufferCount;
    }
    self->_inUseUncompressedBufferCount = inUseUncompressedBufferCount + 1;
    os_unfair_lock_unlock(&self->_bufferTrackingLock);
    v8 = -[BWCompressedShotBufferNode _newSampleBufferFromDecompressionPoolWithCopyOfSampleBuffer:]((CMSampleBufferRef)self, a3);
LABEL_6:
    v9 = v8;
    if (v8)
    {
      CFRetain(v8);
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __58__BWCompressedShotBufferNode_renderSampleBuffer_forInput___block_invoke_2;
      v35[3] = &unk_1E491EC68;
      v35[4] = self;
      v35[5] = a4;
      v35[6] = v9;
      v10 = v35;
LABEL_40:
      -[BWCompressedShotBufferNode _asyncOnDecompressionQueue:]((uint64_t)self, (uint64_t)v10);
      CFRelease(v9);
      return;
    }
    goto LABEL_18;
  }
LABEL_16:
  inUseCompressedBufferCount = self->_inUseCompressedBufferCount;
  width = p_compressionInputDimensions->width;
  if ((int)inUseCompressedBufferCount <= 0)
  {
    inUseCompressedBytes = self->_inUseCompressedBytes;
    LODWORD(v17) = self->_compressionInputDimensions.height * width;
    v20 = 2.0;
  }
  else
  {
    v17 = self->_compressionInputDimensions.height * (uint64_t)width;
    v18 = (float)(v17 * inUseCompressedBufferCount);
    inUseCompressedBytes = self->_inUseCompressedBytes;
    v20 = v18 / (float)inUseCompressedBytes;
  }
  v21 = (uint64_t)(float)((float)(int)v17 / v20);
  v22 = inUseCompressedBytes + v21;
  compressedByteCapacity = self->_compressedByteCapacity;
  os_unfair_lock_unlock(&self->_bufferTrackingLock);
  if (v22 >= compressedByteCapacity)
  {
    mach_absolute_time();
    if (*MEMORY[0x1E0CA1FC0] == 1)
    {
      -[BWCompressedShotBufferNode _inUseCompressedBufferCount]((os_unfair_lock_s *)self);
      -[BWCompressedShotBufferNode _inUseCompressedBytes]((uint64_t)self);
      -[BWCompressedShotBufferNode _compressedByteCapacity]((uint64_t)self);
      kdebug_trace();
    }
    if (dword_1EE6BE6D8)
    {
      v38 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v24 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    while (1)
    {
      v26 = -[BWCompressedShotBufferNode _inUseCompressedBytes]((uint64_t)self) + v21;
      if (v26 <= -[BWCompressedShotBufferNode _compressedByteCapacity]((uint64_t)self))
        break;
      usleep(0x2710u);
    }
    if (*MEMORY[0x1E0CA1FC0] == 1)
      kdebug_trace();
    mach_absolute_time();
    FigHostTimeToNanoseconds();
    if (dword_1EE6BE6D8)
    {
      v38 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v27 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  mach_absolute_time();
  v28 = -[BWCompressedShotBufferNode _newCompressedSampleBufferFromUncompressedSampleBuffer:](self, a3);
  if (!v28)
    goto LABEL_18;
  v9 = (void *)v28;
  mach_absolute_time();
  FigHostTimeToNanoseconds();
  DataBuffer = CMSampleBufferGetDataBuffer((CMSampleBufferRef)v9);
  DataLength = CMBlockBufferGetDataLength(DataBuffer);
  if (DataLength > 0)
  {
    v31 = DataLength;
    os_unfair_lock_lock(&self->_bufferTrackingLock);
    -[NSMutableArray addObject:](self->_queuedCompressedSampleBuffers, "addObject:", v9);
    ++self->_inUseCompressedBufferCount;
    self->_inUseCompressedBytes += v31;
    if (*MEMORY[0x1E0CA1FC0] == 1)
      kdebug_trace();
    os_unfair_lock_unlock(&self->_bufferTrackingLock);
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __58__BWCompressedShotBufferNode_renderSampleBuffer_forInput___block_invoke;
    v36[3] = &unk_1E491E720;
    v36[4] = self;
    v10 = v36;
    goto LABEL_40;
  }
  CFRelease(v9);
LABEL_42:
  v32 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __58__BWCompressedShotBufferNode_renderSampleBuffer_forInput___block_invoke_3;
  v34[3] = &unk_1E491EC90;
  v34[4] = self;
  v34[5] = v33;
  v34[6] = v32;
  v34[7] = a4;
  -[BWCompressedShotBufferNode _asyncOnDecompressionQueue:]((uint64_t)self, (uint64_t)v34);
}

- (uint64_t)_shouldPassthroughSampleBuffer:(uint64_t)a3 forInput:
{
  uint64_t v3;
  void *v5;
  void *v6;
  double v7;
  double v8;
  __int16 v9;
  __int16 v10;

  if (result)
  {
    v3 = result;
    if (*(_QWORD *)(result + 96) != a3)
      return 1;
    v5 = (void *)CMGetAttachment(target, CFSTR("StillSettings"), 0);
    v6 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    if (objc_msgSend((id)objc_msgSend(v5, "requestedSettings"), "resolutionFlavor") == 2)
      return 1;
    if (objc_msgSend((id)objc_msgSend(v5, "requestedSettings"), "resolutionFlavor") != 1
      || (result = objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D20]), "intValue"),
          (_DWORD)result != 1))
    {
      BWPixelBufferDimensionsFromSampleBuffer((opaqueCMSampleBuffer *)target);
      FigCaptureMetadataUtilitiesGetValidBufferRect();
      if (v8 <= (double)*(int *)(v3 + 192) && v7 <= (double)*(int *)(v3 + 196))
      {
        if ((objc_msgSend((id)objc_msgSend(v5, "captureSettings"), "captureFlags") & 2) != 0)
          return 0;
        if (!*(_BYTE *)(v3 + 160))
          return 0;
        v9 = objc_msgSend((id)objc_msgSend(v5, "captureSettings"), "captureFlags");
        if (*(_BYTE *)(v3 + 161))
        {
          v10 = v9;
          if (-[BWCompressedShotBufferNode _hasQueuedCompressedBuffers]((os_unfair_lock_s *)v3)
            || (v10 & 0x800) != 0 && (objc_msgSend((id)v3, "compressionResourcesAllocated") & 1) != 0)
          {
            return 0;
          }
        }
      }
      return 1;
    }
  }
  return result;
}

- (BWPixelBufferPool)_setupDecompressionPool
{
  BWPixelBufferPool *v1;
  void *v2;
  BWVideoFormatRequirements *v3;
  uint64_t v4;
  BWVideoFormatRequirements *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    if (!*(_QWORD *)&result[1]._providesBackPressure)
    {
      v2 = (void *)objc_msgSend((id)objc_msgSend(*(id *)&result->_providesBackPressure, "primaryMediaProperties"), "resolvedFormat");
      v3 = objc_alloc_init(BWVideoFormatRequirements);
      v8[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v2, "pixelFormat"));
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v3, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1));
      -[BWVideoFormatRequirements setWidth:](v3, "setWidth:", SLODWORD(v1[1]._prefetchedSurfaceIDs));
      -[BWVideoFormatRequirements setHeight:](v3, "setHeight:", SHIDWORD(v1[1]._prefetchedSurfaceIDs));
      -[BWVideoFormatRequirements setBytesPerRowAlignment:](v3, "setBytesPerRowAlignment:", objc_msgSend(v2, "bytesPerRowAlignment"));
      v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v2, "cacheMode"));
      -[BWVideoFormatRequirements setSupportedCacheModes:](v3, "setSupportedCacheModes:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v7, 1));
      v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v2, "colorSpaceProperties"));
      -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v3, "setSupportedColorSpaceProperties:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v6, 1));
      v5 = v3;
      LOBYTE(v4) = 1;
      result = -[BWPixelBufferPool initWithVideoFormat:capacity:name:clientProvidesPool:memoryPool:providesBackPressure:reportSlowBackPressureAllocations:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:clientProvidesPool:memoryPool:providesBackPressure:reportSlowBackPressureAllocations:", +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v5, 1)), SLODWORD(v1[1]._backPressureSemaphore), CFSTR("BWCompressedShotBuffer Decompression"), 0, +[BWMemoryPool sharedMemoryPool](BWMemoryPool, "sharedMemoryPool"), 1, v4);
      *(_QWORD *)&v1[1]._providesBackPressure = result;
    }
  }
  return result;
}

- (uint64_t)_updateCompressedByteCapacity
{
  uint64_t v1;
  uint64_t v2;

  if (result)
  {
    v1 = result;
    result = FigCaptureVideoDimensionsAreValid(*(_QWORD *)(result + 184));
    if ((_DWORD)result)
    {
      LODWORD(v2) = *(_DWORD *)(v1 + 124) - *(_DWORD *)(v1 + 224);
      if ((int)v2 <= 1)
        v2 = 1;
      else
        v2 = v2;
      *(_QWORD *)(v1 + 136) = *(int *)(v1 + 188) * (uint64_t)*(int *)(v1 + 184) * v2;
    }
  }
  return result;
}

- (uint64_t)_inUseCompressedBufferCount
{
  uint64_t os_unfair_lock_opaque;

  if (!a1)
    return 0;
  os_unfair_lock_lock(a1 + 28);
  os_unfair_lock_opaque = a1[30]._os_unfair_lock_opaque;
  os_unfair_lock_unlock(a1 + 28);
  return os_unfair_lock_opaque;
}

- (uint64_t)_inUseCompressedBytes
{
  uint64_t v2;

  if (!a1)
    return 0;
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
  v2 = *(_QWORD *)(a1 + 128);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  return v2;
}

- (uint64_t)_compressedByteCapacity
{
  uint64_t v2;

  if (!a1)
    return 0;
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
  v2 = *(_QWORD *)(a1 + 136);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  return v2;
}

- (CMAttachmentBearerRef)_newCompressedSampleBufferFromUncompressedSampleBuffer:(CMAttachmentBearerRef)result
{
  uint64_t v3;
  CVImageBufferRef ImageBuffer;
  _DWORD *v5;
  __CVBuffer *v6;
  __CVBuffer *v7;
  __IOSurface *IOSurface;
  uint64_t PixelFormatType;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  double ValidBufferRect;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v31;
  float v32;
  int v33;
  float v34;
  __CVBuffer *v35;
  uint64_t v36;
  const __CFString *v37;
  CFTypeRef v38;
  const void *v39;
  size_t BytesPerRow;
  size_t v41;
  char *BaseAddress;
  char *v43;
  char *v44;
  uint64_t v45;
  char *v46;
  unsigned int __n;
  double v48;
  double v49;
  CMSampleTimingInfo timingInfoOut;
  CMAttachmentBearerRef destination;
  CMAttachmentBearerRef v52;
  _QWORD v53[4];
  _QWORD v54[6];

  v54[4] = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v3 = (uint64_t)result;
  destination = 0;
  v52 = 0;
  ImageBuffer = CMSampleBufferGetImageBuffer(sbuf);
  v5 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (ImageBuffer && (v6 = (__CVBuffer *)CFRetain(ImageBuffer)) != 0)
  {
    v7 = v6;
    if (*v5 == 1)
    {
      IOSurface = CVPixelBufferGetIOSurface(v6);
      IOSurfaceGetID(IOSurface);
      kdebug_trace();
    }
    PixelFormatType = CVPixelBufferGetPixelFormatType(v7);
    v10 = PixelFormatType;
    if ((_DWORD)PixelFormatType == 1651925816 || (_DWORD)PixelFormatType == 1652056888)
    {
      memset(&timingInfoOut, 0, sizeof(timingInfoOut));
      if (!CMSampleBufferGetSampleTimingInfo(sbuf, 0, &timingInfoOut))
      {
        if (*(_QWORD *)(v3 + 168)
          || (v11 = -[BWCompressedShotBufferNode _newCompressionSession](v3), (*(_QWORD *)(v3 + 168) = v11) != 0))
        {
          v12 = *MEMORY[0x1E0D09318];
          v54[0] = &unk_1E49F8160;
          v13 = *MEMORY[0x1E0D09308];
          v53[0] = v12;
          v53[1] = v13;
          v14 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 2);
          v15 = *MEMORY[0x1E0D09328];
          v54[1] = v14;
          v54[2] = &unk_1E49F8160;
          v16 = *MEMORY[0x1E0D09310];
          v53[2] = v15;
          v53[3] = v16;
          v54[3] = MEMORY[0x1E0C9AAB0];
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, v53, 4);
          if (!CMPhotoCompressionSessionOpenEmptyContainer())
          {
            v17 = *MEMORY[0x1E0C9D628];
            v18 = *(double *)(MEMORY[0x1E0C9D628] + 8);
            v20 = *(double *)(MEMORY[0x1E0C9D628] + 16);
            v19 = *(double *)(MEMORY[0x1E0C9D628] + 24);
            v21 = psn_pixelBufferDimensions(v7);
            v22 = objc_msgSend(*(id *)(v3 + 216), "dimensions");
            v23 = HIDWORD(v22);
            if ((int)v21 <= (int)v22 && SHIDWORD(v21) <= SHIDWORD(v22))
              goto LABEL_25;
            CMGetAttachment(sbuf, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
            ValidBufferRect = FigCaptureMetadataUtilitiesGetValidBufferRect();
            v28 = (double)(int)v22;
            v29 = (double)SHIDWORD(v22);
            if (v26 > (double)(int)v22 || v27 > v29)
              goto LABEL_25;
            v31 = v27;
            v48 = v25;
            v49 = ValidBufferRect;
            v32 = v26;
            v33 = v22;
            if ((int)FigCaptureRoundFloatToMultipleOf(8, v32) < (int)v22)
            {
              v33 = FigCaptureRoundFloatToMultipleOf(8, v32);
              v28 = (double)v33;
            }
            v34 = v31;
            if ((int)FigCaptureCeilFloatToMultipleOf(8, v34) < SHIDWORD(v22))
            {
              LODWORD(v23) = FigCaptureCeilFloatToMultipleOf(8, v34);
              v29 = (double)(int)v23;
            }
            if (((v33 | v23) & 7) == 0 || !(v33 & 0xF | v23 & 3))
            {
              v18 = v48;
              v17 = v49;
              v20 = v28;
              v19 = v29;
LABEL_25:
              v35 = v7;
LABEL_26:
              -[BWCompressedShotBufferNode _compressionOptionsWithCropRect:](v3, v17, v18, v20, v19);
              if (!CMPhotoCompressionSessionAddImage())
                CMPhotoCompressionSessionCloseContainerAndCopyBacking();
              goto LABEL_31;
            }
            __n = v33;
            mach_absolute_time();
            v36 = objc_msgSend(+[BWOnDemandPixelBufferAllocator onDemandAllocatorWithDimensions:pixelFormat:name:memoryPool:](BWOnDemandPixelBufferAllocator, "onDemandAllocatorWithDimensions:pixelFormat:name:memoryPool:", v21, v10, CFSTR("Uncompressed shot buffer copy"), +[BWMemoryPool sharedMemoryPool](BWMemoryPool, "sharedMemoryPool")), "newPixelBuffer");
            if (v36)
            {
              v35 = (__CVBuffer *)v36;
              v37 = (const __CFString *)*MEMORY[0x1E0CA90D8];
              v38 = CVBufferCopyAttachment(v7, (CFStringRef)*MEMORY[0x1E0CA90D8], 0);
              if (v38)
              {
                v39 = v38;
                CVBufferSetAttachment(v35, v37, v38, kCVAttachmentMode_ShouldPropagate);
                CFRelease(v39);
              }
              CVPixelBufferLockBaseAddress(v7, 1uLL);
              CVPixelBufferLockBaseAddress(v35, 0);
              BytesPerRow = CVPixelBufferGetBytesPerRow(v7);
              v41 = CVPixelBufferGetBytesPerRow(v35);
              BaseAddress = (char *)CVPixelBufferGetBaseAddress(v7);
              v43 = (char *)CVPixelBufferGetBaseAddress(v35);
              if ((_DWORD)v23)
              {
                v44 = v43;
                v45 = v23;
                v46 = &BaseAddress[(unint64_t)v49 + BytesPerRow * (unint64_t)v48];
                do
                {
                  memcpy(v44, v46, __n);
                  v46 += BytesPerRow;
                  v44 += v41;
                  --v45;
                }
                while (v45);
              }
              CVPixelBufferUnlockBaseAddress(v7, 1uLL);
              CVPixelBufferUnlockBaseAddress(v35, 0);
              mach_absolute_time();
              FigHostTimeToNanoseconds();
              CFRetain(v35);
              CFRelease(v7);
              v5 = (_DWORD *)MEMORY[0x1E0CA1FC0];
              goto LABEL_26;
            }
          }
        }
      }
    }
    else
    {
      FigDebugAssert3();
    }
    v35 = v7;
  }
  else
  {
    FigDebugAssert3();
    v35 = 0;
  }
LABEL_31:
  if (*v5 == 1)
    kdebug_trace();
  if (destination)
    CFRelease(destination);
  if (v35)
    CFRelease(v35);
  return v52;
}

void __58__BWCompressedShotBufferNode_renderSampleBuffer_forInput___block_invoke(uint64_t a1)
{
  -[BWCompressedShotBufferNode _decompressionWork](*(_QWORD *)(a1 + 32));
}

- (void)_decompressionWork
{
  opaqueCMSampleBuffer *v2;
  opaqueCMSampleBuffer *v3;
  OpaqueCMBlockBuffer *DataBuffer;
  size_t DataLength;
  const void *v6;
  const void *v7;
  CFTypeRef v8;
  id v9;
  uint64_t v10;
  void (**v11)(_QWORD);

  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
      FigDebugAssert3();
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    v2 = (opaqueCMSampleBuffer *)(id)objc_msgSend(*(id *)(a1 + 144), "firstObject");
    if (v2)
    {
      v3 = v2;
      objc_msgSend(*(id *)(a1 + 144), "removeObjectAtIndex:", 0);
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
      DataBuffer = CMSampleBufferGetDataBuffer(v3);
      DataLength = CMBlockBufferGetDataLength(DataBuffer);
      v6 = (const void *)-[BWCompressedShotBufferNode _newDecompressedSampleBufferFromCompressedSampleBuffer:](a1, (uint64_t)v3);
      if (v6)
      {
        v7 = v6;
        CMGetAttachment(v6, CFSTR("StillSettings"), 0);
        objc_msgSend(*(id *)(a1 + 104), "emitSampleBuffer:", v7);
        CFRelease(v7);
      }
      else
      {
        v8 = CMGetAttachment(v3, CFSTR("StillSettings"), 0);
        v9 = +[BWNodeError newError:sourceNode:stillImageSettings:metadata:](BWNodeError, "newError:sourceNode:stillImageSettings:metadata:", 4294954516, a1, v8, CMGetAttachment(v3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0));
        objc_msgSend(*(id *)(a1 + 104), "emitNodeError:", v9);

      }
      CFRelease(v3);
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
      --*(_DWORD *)(a1 + 120);
      v10 = *(_QWORD *)(a1 + 128);
      *(_QWORD *)(a1 + 128) = v10 - DataLength;
      if (!*(_DWORD *)(a1 + 120))
      {
        if (v10 != DataLength)
          FigDebugAssert3();
        *(_DWORD *)(a1 + 116) = 0;
      }
      if (*MEMORY[0x1E0CA1FC0] == 1)
        kdebug_trace();
      v11 = (void (**)(_QWORD))*(id *)(a1 + 152);
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
      if (v11)
      {
        v11[2](v11);

      }
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
    }
  }
}

- (CMSampleBufferRef)_newSampleBufferFromDecompressionPoolWithCopyOfSampleBuffer:(CMSampleBufferRef)result
{
  CMSampleBufferRef v3;
  __CVBuffer *ImageBuffer;
  uint64_t v5;
  __CVBuffer *v6;
  OSType PixelFormatType;
  OSType v8;
  unint64_t v10;
  unint64_t v11;
  double ValidBufferRect;
  double v13;
  double v14;
  double v15;
  double v17;
  double v18;
  double v19;
  size_t BytesPerRow;
  size_t v22;
  char *BaseAddress;
  char *v24;
  size_t v25;
  uint64_t v26;
  id v27;
  unint64_t v28;
  uint64_t v29;
  CMSampleBufferRef v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  if (result)
  {
    v3 = result;
    mach_absolute_time();
    v30 = 0;
    ImageBuffer = CMSampleBufferGetImageBuffer(a2);
    v5 = objc_msgSend(*((id *)v3 + 27), "newPixelBuffer");
    v6 = (__CVBuffer *)v5;
    if (!ImageBuffer)
      goto LABEL_43;
    if (!v5)
    {
      FigDebugAssert3();
      return v30;
    }
    CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    PixelFormatType = CVPixelBufferGetPixelFormatType(ImageBuffer);
    v8 = CVPixelBufferGetPixelFormatType(v6);
    if (PixelFormatType != 1651925816 && PixelFormatType != 1652056888)
      goto LABEL_31;
    if (v8 != 1651925816 && v8 != 1652056888)
      goto LABEL_31;
    v10 = psn_pixelBufferDimensions(ImageBuffer);
    v11 = psn_pixelBufferDimensions(v6);
    ValidBufferRect = *MEMORY[0x1E0C9D628];
    v13 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v14 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v15 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    if (!FigCaptureVideoDimensionsAreEqual(v10, v11) && ((int)v10 > (int)v11 || SHIDWORD(v10) > SHIDWORD(v11)))
    {
      ValidBufferRect = FigCaptureMetadataUtilitiesGetValidBufferRect();
      v13 = v19;
      if (v17 > (double)(int)v11 || v18 > (double)SHIDWORD(v11))
      {
LABEL_31:
        FigDebugAssert3();
LABEL_38:
        CFRelease(v6);
        return v30;
      }
      v14 = v17;
      v15 = v18;
    }
    v28 = v11;
    v29 = v10;
    BytesPerRow = CVPixelBufferGetBytesPerRow(ImageBuffer);
    v22 = CVPixelBufferGetBytesPerRow(v6);
    CVPixelBufferLockBaseAddress(ImageBuffer, 1uLL);
    CVPixelBufferLockBaseAddress(v6, 0);
    BaseAddress = (char *)CVPixelBufferGetBaseAddress(ImageBuffer);
    v24 = (char *)CVPixelBufferGetBaseAddress(v6);
    if (BytesPerRow == v22)
    {
      v31.origin.x = ValidBufferRect;
      v31.origin.y = v13;
      v31.size.width = v14;
      v31.size.height = v15;
      if (CGRectIsNull(v31))
      {
        memcpy(v24, BaseAddress, BytesPerRow * (v29 >> 32));
        goto LABEL_34;
      }
    }
    if (BytesPerRow >= v22)
      v25 = v22;
    else
      v25 = BytesPerRow;
    v32.origin.x = ValidBufferRect;
    v32.origin.y = v13;
    v32.size.width = v14;
    v32.size.height = v15;
    if (CGRectIsNull(v32))
    {
      v26 = v29 >> 32;
      if (!(v29 >> 32))
        goto LABEL_34;
    }
    else
    {
      BaseAddress += (unint64_t)ValidBufferRect + BytesPerRow * (unint64_t)v13;
      v26 = (unint64_t)v15;
      v25 = (unint64_t)v14;
      if (!(unint64_t)v15)
        goto LABEL_34;
    }
    do
    {
      memcpy(v24, BaseAddress, v25);
      BaseAddress += BytesPerRow;
      v24 += v22;
      --v26;
    }
    while (v26);
LABEL_34:
    CVPixelBufferUnlockBaseAddress(ImageBuffer, 1uLL);
    CVPixelBufferUnlockBaseAddress(v6, 0);
    CVBufferPropagateAttachments(ImageBuffer, v6);
    if (!BWCMSampleBufferCreateCopyWithNewPixelBuffer(a2, v6, (CFTypeRef *)v3 + 29, &v30))
    {
      v33.origin.x = ValidBufferRect;
      v33.origin.y = v13;
      v33.size.width = v14;
      v33.size.height = v15;
      if (!CGRectIsNull(v33))
      {
        v27 = BWCMSampleBufferCopyReattachAndReturnMutableMetadata(v30);
        FigCaptureMetadataUtilitiesUpdateMetadataForStillImageCrop(v27, v29, v28, ValidBufferRect, v13, v14, v15, 0.0, 0.0, v14, v15);
        FigCaptureMetadataUtilitiesUpdateMetadataForNewFinalDimensions((uint64_t)v27, v29, v28);
      }
      if (!v6)
        return v30;
      goto LABEL_38;
    }
LABEL_43:
    FigDebugAssert3();
    if (!v6)
      return v30;
    goto LABEL_38;
  }
  return result;
}

void __58__BWCompressedShotBufferNode_renderSampleBuffer_forInput___block_invoke_2(uint64_t a1)
{
  const void *v2;

  objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "outputs"), "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 40), "index")), "emitSampleBuffer:", *(_QWORD *)(a1 + 48));
  v2 = *(const void **)(a1 + 48);
  if (v2)
    CFRelease(v2);
}

void __58__BWCompressedShotBufferNode_renderSampleBuffer_forInput___block_invoke_3(uint64_t a1)
{
  id v2;

  v2 = +[BWNodeError newError:sourceNode:stillImageSettings:metadata:](BWNodeError, "newError:sourceNode:stillImageSettings:metadata:", 4294954516, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "outputs"), "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 56), "index")), "emitNodeError:", v2);

}

- (void)didReachEndOfDataForInput:(id)a3
{
  _QWORD v4[5];

  if (-[BWNode allInputsHaveReachedState:](self, "allInputsHaveReachedState:", 0))
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __56__BWCompressedShotBufferNode_didReachEndOfDataForInput___block_invoke;
    v4[3] = &unk_1E491E720;
    v4[4] = self;
    -[BWCompressedShotBufferNode _asyncOnDecompressionQueue:]((uint64_t)self, (uint64_t)v4);
  }
}

uint64_t __56__BWCompressedShotBufferNode_didReachEndOfDataForInput___block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  uint64_t v4;
  void (**v5)(_QWORD);
  void *v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "flush");

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216) = 0;
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 168))
  {
    CMPhotoCompressionSessionReleaseHardwareResources();
    CMPhotoCompressionSessionFlushCachedBuffers();
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(const void **)(v2 + 168);
    if (v3)
    {
      CFRelease(v3);
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168) = 0;
      v2 = *(_QWORD *)(a1 + 32);
    }
  }
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 112));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void (***)(_QWORD))(v4 + 152);
  *(_QWORD *)(v4 + 152) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 112));
  if (v5)
  {
    v5[2](v5);

  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = (void *)objc_msgSend(*(id *)(a1 + 32), "outputs", 0);
  result = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (result)
  {
    v8 = result;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "markEndOfLiveOutput");
      }
      while (v8 != v10);
      result = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v8 = result;
    }
    while (result);
  }
  return result;
}

- (void)setUncompressedEquivalentCapacity:(int)a3
{
  os_unfair_lock_s *p_bufferTrackingLock;

  p_bufferTrackingLock = &self->_bufferTrackingLock;
  os_unfair_lock_lock(&self->_bufferTrackingLock);
  if (self->_uncompressedEquivalentCapacity != a3)
  {
    self->_uncompressedEquivalentCapacity = a3;
    -[BWCompressedShotBufferNode _updateCompressedByteCapacity]((uint64_t)self);
  }
  os_unfair_lock_unlock(p_bufferTrackingLock);
}

- (int)uncompressedEquivalentCapacity
{
  BWCompressedShotBufferNode *v2;
  os_unfair_lock_s *p_bufferTrackingLock;

  v2 = self;
  p_bufferTrackingLock = &self->_bufferTrackingLock;
  os_unfair_lock_lock(&self->_bufferTrackingLock);
  LODWORD(v2) = v2->_uncompressedEquivalentCapacity;
  os_unfair_lock_unlock(p_bufferTrackingLock);
  return (int)v2;
}

- (int)minimumUncompressedEquivalentCapacity
{
  return self->_decompressionPoolCapacity + 1;
}

- (BOOL)compressionResourcesAllocated
{
  BWCompressedShotBufferNode *v2;
  os_unfair_lock_s *p_bufferTrackingLock;

  v2 = self;
  p_bufferTrackingLock = &self->_bufferTrackingLock;
  os_unfair_lock_lock(&self->_bufferTrackingLock);
  LOBYTE(v2) = FigCaptureVideoDimensionsAreValid(*(_QWORD *)&v2->_compressionInputDimensions);
  os_unfair_lock_unlock(p_bufferTrackingLock);
  return (char)v2;
}

- (void)flushAndWaitUntilThreshold:(int)a3
{
  os_unfair_lock_s *p_bufferTrackingLock;
  uint64_t v6;

  p_bufferTrackingLock = &self->_bufferTrackingLock;
  os_unfair_lock_lock(&self->_bufferTrackingLock);
  v6 = (int)(float)((float)((float)(100.0 - (float)a3) / 100.0)
                                * (float)(self->_compressedByteCapacity
                                        / (self->_compressionInputDimensions.height
                                         * (uint64_t)self->_compressionInputDimensions.width)));
  os_unfair_lock_unlock(p_bufferTrackingLock);
  -[BWCompressedShotBufferNode flushAndWaitForUncompressedEquivalentFreeBufferCount:](self, "flushAndWaitForUncompressedEquivalentFreeBufferCount:", v6);
}

- (void)flushAndWaitForUncompressedEquivalentFreeBufferCount:(int)a3
{
  int64_t v5;
  char v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;

  mach_absolute_time();
  os_unfair_lock_lock(&self->_bufferTrackingLock);
  v5 = self->_compressedByteCapacity
     - self->_compressionInputDimensions.height * (uint64_t)self->_compressionInputDimensions.width * a3;
  os_unfair_lock_unlock(&self->_bufferTrackingLock);
  if (*MEMORY[0x1E0CA1FC0] == 1)
  {
    -[BWCompressedShotBufferNode _inUseCompressedBufferCount]((os_unfair_lock_s *)self);
    -[BWCompressedShotBufferNode _inUseCompressedBytes]((uint64_t)self);
    kdebug_trace();
  }
  v10 = -[BWCompressedShotBufferNode _inUseCompressedBytes]((uint64_t)self);
  if (v10 > v5)
  {
    v6 = 0;
    do
    {
      if ((v6 & 1) == 0 && dword_1EE6BE6D8)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      usleep(0x2710u);
      v8 = -[BWCompressedShotBufferNode _inUseCompressedBytes]((uint64_t)self);
      v6 = 1;
    }
    while (v8 > v5);
  }
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  if (v10 <= v5)
  {
    if (!dword_1EE6BE6D8)
      return;
  }
  else
  {
    mach_absolute_time();
    FigHostTimeToNanoseconds();
    if (!dword_1EE6BE6D8)
      return;
  }
  v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
}

- (BOOL)hasUncompressedEquivalentFreeBufferCount:(int)a3
{
  os_unfair_lock_s *p_bufferTrackingLock;
  uint64_t v6;

  p_bufferTrackingLock = &self->_bufferTrackingLock;
  os_unfair_lock_lock(&self->_bufferTrackingLock);
  v6 = self->_compressedByteCapacity
     - self->_compressionInputDimensions.height * (uint64_t)self->_compressionInputDimensions.width * a3;
  os_unfair_lock_unlock(p_bufferTrackingLock);
  return -[BWCompressedShotBufferNode _inUseCompressedBytes]((uint64_t)self) <= v6;
}

- (void)setFreeBufferCountIncreasedHandler:(id)a3
{
  os_unfair_lock_s *p_bufferTrackingLock;
  int inUseCompressedBufferCount;

  p_bufferTrackingLock = &self->_bufferTrackingLock;
  os_unfair_lock_lock(&self->_bufferTrackingLock);
  inUseCompressedBufferCount = self->_inUseCompressedBufferCount;

  self->_freeBufferCountIncreasedHandler = (id)objc_msgSend(a3, "copy");
  os_unfair_lock_unlock(p_bufferTrackingLock);
  if (a3)
  {
    if (!inUseCompressedBufferCount)
      (*((void (**)(id))a3 + 2))(a3);
  }
}

- (id)freeBufferCountIncreasedHandler
{
  os_unfair_lock_s *p_bufferTrackingLock;
  id v4;

  p_bufferTrackingLock = &self->_bufferTrackingLock;
  os_unfair_lock_lock(&self->_bufferTrackingLock);
  v4 = self->_freeBufferCountIncreasedHandler;
  os_unfair_lock_unlock(p_bufferTrackingLock);
  return v4;
}

- (void)getInUseCompressedBufferCount:(int *)a3 inUseCompressedBytes:(int64_t *)a4 maxInUseCompressedBytes:(int64_t *)a5 forUncompressedEquivalentFreeBufferCount:(int)a6
{
  os_unfair_lock_s *p_bufferTrackingLock;

  p_bufferTrackingLock = &self->_bufferTrackingLock;
  os_unfair_lock_lock(&self->_bufferTrackingLock);
  if (a3)
    *a3 = self->_inUseCompressedBufferCount;
  if (a4)
    *a4 = self->_inUseCompressedBytes;
  if (a5)
    *a5 = self->_compressedByteCapacity
        - self->_compressionInputDimensions.height * (uint64_t)self->_compressionInputDimensions.width * a6;
  os_unfair_lock_unlock(p_bufferTrackingLock);
}

- (BOOL)passthroughEnabled
{
  return self->_passthroughEnabled;
}

void __57__BWCompressedShotBufferNode__asyncOnDecompressionQueue___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1A858DD40]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

- (uint64_t)_newCompressionSession
{
  _BOOL8 v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[2];
  _QWORD v5[2];
  _QWORD v6[3];
  _QWORD v7[3];
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    if (*(_BYTE *)(result + 180))
    {
      v1 = FigCapturePlatformIOSurfaceWiringAssertionEnabled() != 0;
      v8 = *MEMORY[0x1E0D09668];
      v7[0] = &unk_1E49F8160;
      v2 = *MEMORY[0x1E0D09638];
      v6[0] = *MEMORY[0x1E0D09640];
      v6[1] = v2;
      v7[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v1);
      v6[2] = *MEMORY[0x1E0D09630];
      v7[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[BWMemoryPool poolIdentifier](+[BWMemoryPool sharedMemoryPool](BWMemoryPool, "sharedMemoryPool"), "poolIdentifier"));
      v9[0] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 3);
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
      if (CMPhotoSurfacePoolCreate())
        return 0;
      v3 = *MEMORY[0x1E0D09478];
      v4[0] = *MEMORY[0x1E0D09480];
      v4[1] = v3;
      v5[0] = MEMORY[0x1E0C9AAB0];
      v5[1] = 0;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
    }
    CMPhotoCompressionSessionCreate();
    return 0;
  }
  return result;
}

- (void)_compressionOptionsWithCropRect:(CGFloat)a3
{
  void *v10;
  uint64_t v11;
  uint64_t v12;
  CFDictionaryRef DictionaryRepresentation;
  CGRect v15;
  CGRect v16;

  if (!a1)
    return 0;
  v10 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_1E49F8178, *MEMORY[0x1E0D09378]);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D09340]);
  v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 176));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D09440]);
  if (*(_BYTE *)(a1 + 180))
  {
    v12 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D09448]);
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0D093E8]);
  }
  v15.origin.x = a2;
  v15.origin.y = a3;
  v15.size.width = a4;
  v15.size.height = a5;
  if (!CGRectIsNull(v15))
  {
    v16.origin.x = a2;
    v16.origin.y = a3;
    v16.size.width = a4;
    v16.size.height = a5;
    DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v16);
    objc_msgSend(v10, "setObject:forKeyedSubscript:", DictionaryRepresentation, *MEMORY[0x1E0D09430]);
    if (DictionaryRepresentation)
      CFRelease(DictionaryRepresentation);
  }
  return v10;
}

- (CMVideoFormatDescriptionRef)_copyCompressedFormatDescriptionForUncompressedSampleBuffer:(CMVideoFormatDescriptionRef)result
{
  const opaqueCMFormatDescription *FormatDescription;
  CFDictionaryRef Extensions;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const opaqueCMFormatDescription *v12;
  CMVideoDimensions Dimensions;
  CMVideoFormatDescriptionRef formatDescriptionOut;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    FormatDescription = CMSampleBufferGetFormatDescription(sbuf);
    Extensions = CMFormatDescriptionGetExtensions(FormatDescription);
    if (Extensions)
    {
      v5 = *MEMORY[0x1E0CA8E98];
      v20[0] = *MEMORY[0x1E0CA8EE8];
      v20[1] = v5;
      v20[2] = *MEMORY[0x1E0CA8D68];
      v6 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
      v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
      v15 = 0u;
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v16;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v16 != v10)
              objc_enumerationMutation(v6);
            objc_msgSend(v7, "setObject:forKeyedSubscript:", -[__CFDictionary objectForKeyedSubscript:](Extensions, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11)), *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11));
            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        }
        while (v9);
      }
      if (objc_msgSend(v7, "count"))
        Extensions = (CFDictionaryRef)v7;
      else
        Extensions = 0;
    }
    formatDescriptionOut = 0;
    v12 = CMSampleBufferGetFormatDescription(sbuf);
    Dimensions = CMVideoFormatDescriptionGetDimensions(v12);
    CMVideoFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0x736C696Du, Dimensions.width, Dimensions.height, Extensions, &formatDescriptionOut);
    return formatDescriptionOut;
  }
  return result;
}

- (BOOL)_hasQueuedCompressedBuffers
{
  _BOOL8 v2;

  if (!a1)
    return 0;
  os_unfair_lock_lock(a1 + 28);
  v2 = (signed int)a1[30]._os_unfair_lock_opaque > 0;
  os_unfair_lock_unlock(a1 + 28);
  return v2;
}

- (uint64_t)_newDecompressedSampleBufferFromCompressedSampleBuffer:(uint64_t)a1
{
  _DWORD *v4;
  int v5;
  int v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  BWPhotoDecompressor *v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v4 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*(_QWORD *)(a1 + 216))
  {
    mach_absolute_time();
    if (*v4 == 1)
      kdebug_trace();
    v5 = objc_msgSend(*(id *)(a1 + 216), "waitForAvailablePixelBuffer");
    if (*v4 == 1)
      kdebug_trace();
    if (dword_1EE6BE6D8)
      v6 = v5;
    else
      v6 = 0;
    if (v6 == 1)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  mach_absolute_time();
  if (*v4 == 1)
    kdebug_trace();
  v8 = *(BWPhotoDecompressor **)(a1 + 208);
  if (!v8)
  {
    if (!*(_QWORD *)(a1 + 216)
      || (v8 = -[BWPhotoDecompressor initWithOutputPixelBufferPool:]([BWPhotoDecompressor alloc], "initWithOutputPixelBufferPool:", *(_QWORD *)(a1 + 216)), (*(_QWORD *)(a1 + 208) = v8) == 0))
    {
      FigDebugAssert3();
      return 0;
    }
  }
  v9 = -[BWPhotoDecompressor newUncompressedSampleBufferFromSampleBuffer:](v8, "newUncompressedSampleBufferFromSampleBuffer:", a2, v11, v12);
  if (*v4 == 1)
    kdebug_trace();
  return v9;
}

@end
