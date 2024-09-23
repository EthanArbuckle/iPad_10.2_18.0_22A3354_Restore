@implementation BWPhotoDecompressorNode

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  int v8;
  __CFString *v9;
  BWNodeOutputMediaProperties *v10;
  BWNodeOutputMediaProperties *v11;
  uint64_t v12;
  BWVideoFormatRequirements *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  if (self->_synchronizedSlaveAttachedMediaDecompressionEnabled)
  {
    v8 = objc_msgSend(a5, "isEqualToString:", 0x1E495AE38, a4);
    if (v8)
      v9 = CFSTR("SynchronizedSlaveFrame");
    else
      v9 = (__CFString *)a5;
  }
  else
  {
    v8 = 0;
    v9 = (__CFString *)a5;
  }
  v10 = -[BWNodeOutput mediaPropertiesForAttachedMediaKey:](self->super._output, "mediaPropertiesForAttachedMediaKey:", v9);
  if (v10)
  {
    v11 = v10;
    if ((-[__CFString isEqualToString:](v9, "isEqualToString:", CFSTR("PrimaryFormat")) & 1) == 0)
    {
      v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ output %@ unexpectedly has mediaPropertiesForAttachedMediaKey %@ (provided media key was %@)"), self, self->super._output, v9, a5);
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v12, 0));
    }
  }
  else
  {
    v11 = objc_alloc_init(BWNodeOutputMediaProperties);
    -[BWNodeOutput _setMediaProperties:forAttachedMediaKey:](self->super._output, "_setMediaProperties:forAttachedMediaKey:", v11, v9);
  }
  if ((v8 | -[__CFString isEqualToString:](v9, "isEqualToString:", CFSTR("PrimaryFormat"))) == 1)
  {
    v13 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setWidth:](v13, "setWidth:", objc_msgSend(a3, "width"));
    -[BWVideoFormatRequirements setHeight:](v13, "setHeight:", objc_msgSend(a3, "height"));
    if (FigCapturePixelFormatIsFullRange(objc_msgSend(a3, "pixelFormat")))
      v14 = 875704422;
    else
      v14 = 875704438;
    v17[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v14);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v13, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1));
    if (objc_msgSend(a3, "colorSpaceProperties"))
    {
      v16 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(a3, "colorSpaceProperties"));
      -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v13, "setSupportedColorSpaceProperties:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1));
    }
    v15 = -[BWNodeOutput mediaConfigurationForAttachedMediaKey:](self->super._output, "mediaConfigurationForAttachedMediaKey:", v9);
    objc_msgSend(v15, "setFormatRequirements:", v13);
    objc_msgSend(v15, "setProvidesPixelBufferPool:", 1);

  }
  else
  {
    -[BWNodeOutputMediaProperties setResolvedFormat:](v11, "setResolvedFormat:", a3);
  }
}

- (id)nodeType
{
  return CFSTR("Effect");
}

- (BWPhotoDecompressorNode)initWithSynchronizedSlaveAttachedMediaDecompressionEnabled:(BOOL)a3
{
  _BOOL4 v3;
  BWPhotoDecompressorNode *v4;
  BWNodeInput *v5;
  BWVideoFormatRequirements *v6;
  BWNodeInputMediaConfiguration *v7;
  BWNodeOutput *v8;
  BWVideoFormatRequirements *v9;
  BWNodeOutputMediaConfiguration *v10;
  objc_super v12;

  v3 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BWPhotoDecompressorNode;
  v4 = -[BWNode init](&v12, sel_init);
  if (v4)
  {
    v5 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1986618469, v4);
    v6 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v6, "setSupportedPixelFormats:", &unk_1E4A00128);
    -[BWNodeInput setFormatRequirements:](v5, "setFormatRequirements:", v6);

    -[BWNode addInput:](v4, "addInput:", v5);
    v4->_synchronizedSlaveAttachedMediaDecompressionEnabled = v3;
    if (v3)
    {
      v7 = objc_alloc_init(BWNodeInputMediaConfiguration);
      -[BWNodeInputMediaConfiguration setFormatRequirements:](v7, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
      -[BWNodeInputMediaConfiguration setPassthroughMode:](v7, "setPassthroughMode:", 0);
      -[BWNodeInput setMediaConfiguration:forAttachedMediaKey:](v5, "setMediaConfiguration:forAttachedMediaKey:", v7, 0x1E495AE38);
    }
    v8 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v4);
    -[BWNode addOutput:](v4, "addOutput:", v8);

    if (v4->_synchronizedSlaveAttachedMediaDecompressionEnabled)
    {
      v9 = objc_alloc_init(BWVideoFormatRequirements);
      v10 = objc_alloc_init(BWNodeOutputMediaConfiguration);
      -[BWNodeOutputMediaConfiguration setFormatRequirements:](v10, "setFormatRequirements:", v9);
      -[BWNodeOutputMediaConfiguration setPassthroughMode:](v10, "setPassthroughMode:", 0);
      -[BWNodeOutputMediaConfiguration setIndexOfInputWhichDrivesThisOutput:](v10, "setIndexOfInputWhichDrivesThisOutput:", 0);
      -[BWNodeOutputMediaConfiguration setAttachedMediaKeyOfInputWhichDrivesThisOutput:](v10, "setAttachedMediaKeyOfInputWhichDrivesThisOutput:", 0x1E495AE38);
      -[BWNodeOutput setMediaConfiguration:forAttachedMediaKey:](v8, "setMediaConfiguration:forAttachedMediaKey:", v10, CFSTR("SynchronizedSlaveFrame"));
    }
  }
  return v4;
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)BWPhotoDecompressorNode;
  -[BWNode prepareForCurrentConfigurationToBecomeLive](&v2, sel_prepareForCurrentConfigurationToBecomeLive);
}

- (void)addEmitSampleBufferSemaphore:(id)a3
{
  NSMutableArray *emitSampleBufferSemaphores;

  emitSampleBufferSemaphores = self->_emitSampleBufferSemaphores;
  if (!emitSampleBufferSemaphores)
  {
    emitSampleBufferSemaphores = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    self->_emitSampleBufferSemaphores = emitSampleBufferSemaphores;
  }
  -[NSMutableArray addObject:](emitSampleBufferSemaphores, "addObject:", a3);
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  objc_super v3;

  -[BWPhotoDecompressorNode _releaseResources]((uint64_t)self);

  v3.receiver = self;
  v3.super_class = (Class)BWPhotoDecompressorNode;
  -[BWNode dealloc](&v3, sel_dealloc);
}

- (void)_releaseResources
{
  if (a1)
  {
    -[BWPhotoDecompressorNode _ensureSemaphoresAreBalanced](a1);

    *(_QWORD *)(a1 + 104) = 0;
    *(_QWORD *)(a1 + 112) = 0;
  }
}

- (id)nodeSubType
{
  return CFSTR("PhotoDecompressor");
}

- (void)suspendResources
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWPhotoDecompressorNode;
  -[BWNode suspendResources](&v3, sel_suspendResources);
  -[BWPhotoDecompressor flush](self->_photoDecompressor, "flush");
  -[BWPhotoDecompressor flush](self->_synchronizedSlavePhotoDecompressor, "flush");
}

- (void)didReachEndOfDataForInput:(id)a3
{
  objc_super v5;

  -[BWPhotoDecompressorNode _releaseResources]((uint64_t)self);
  v5.receiver = self;
  v5.super_class = (Class)BWPhotoDecompressorNode;
  -[BWNode didReachEndOfDataForInput:](&v5, sel_didReachEndOfDataForInput_, a3);
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  opaqueCMSampleBuffer *v4;
  CMBlockBufferRef DataBuffer;
  NSMutableArray *emitSampleBufferSemaphores;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  const void **v12;
  unint64_t v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  int v17;
  _BOOL4 v18;
  id v19;
  opaqueCMSampleBuffer *v20;
  CFTypeRef v21;
  BWPhotoDecompressor *photoDecompressor;
  NSMutableArray *emitSynchronizedSlaveSampleBufferSemaphores;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  NSObject *v28;
  BWPhotoDecompressor *synchronizedSlavePhotoDecompressor;
  opaqueCMSampleBuffer *v30;
  NSMutableSet *disabledSynchronizedSlaveSemaphores;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  CFTypeRef v36;
  _BOOL4 v37;
  OpaqueCMBlockBuffer *v38;
  uint64_t AttachedMedia;
  CFTypeRef v40;
  CMTime v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  CMTime v54;
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v4 = a3;
  v58 = *MEMORY[0x1E0C80C00];
  memset(&v54, 0, sizeof(v54));
  CMSampleBufferGetPresentationTimeStamp(&v54, a3);
  DataBuffer = CMSampleBufferGetDataBuffer(v4);
  if (DataBuffer)
  {
    v40 = CMGetAttachment(v4, CFSTR("SampleDataToBeDropped"), 0);
    if (-[NSMutableArray count](self->_emitSampleBufferSemaphores, "count"))
    {
      ++self->_numberOfTimesWaited;
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      emitSampleBufferSemaphores = self->_emitSampleBufferSemaphores;
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](emitSampleBufferSemaphores, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v51;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v51 != v10)
              objc_enumerationMutation(emitSampleBufferSemaphores);
            dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*((_QWORD *)&v50 + 1) + 8 * i), 0xFFFFFFFFFFFFFFFFLL);
          }
          v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](emitSampleBufferSemaphores, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
        }
        while (v9);
      }
    }
    v12 = (const void **)MEMORY[0x1E0C9AE50];
    if (-[NSMutableArray count](self->_emitSynchronizedSlaveSampleBufferSemaphores, "count")
      && (v13 = -[NSMutableArray count](self->_emitSynchronizedSlaveSampleBufferSemaphores, "count"),
          v13 <= -[NSMutableSet count](self->_disabledSynchronizedSlaveSemaphores, "count")))
    {
      v14 = 0;
      AttachedMedia = 0;
    }
    else
    {
      AttachedMedia = BWSampleBufferGetAttachedMedia(v4, 0x1E495AE38);
      v14 = AttachedMedia != 0;
    }
    v21 = *v12;
    photoDecompressor = self->_photoDecompressor;
    if (!photoDecompressor)
    {
      photoDecompressor = -[BWPhotoDecompressor initWithOutputPixelBufferPool:]([BWPhotoDecompressor alloc], "initWithOutputPixelBufferPool:", -[BWNodeOutput livePixelBufferPool](self->super._output, "livePixelBufferPool"));
      self->_photoDecompressor = photoDecompressor;
    }
    v20 = -[BWPhotoDecompressor newUncompressedSampleBufferFromSampleBuffer:](photoDecompressor, "newUncompressedSampleBufferFromSampleBuffer:", v4);
    FigCaptureMetadataUtilitiesAddSampleBufferMetadataUsedByVideoEncoderToPixelBuffer(v20);
    v19 = 0;
    if (v40 == v21 && v20)
    {
      if (!-[NSMutableArray count](self->_emitSampleBufferSemaphores, "count"))
      {
        v19 = 0;
        if (v14)
          goto LABEL_27;
        goto LABEL_46;
      }
      v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v19, "addObjectsFromArray:", self->_emitSampleBufferSemaphores);
      CMSetAttachment(v20, CFSTR("SampleDataToBeDroppedEmitSampleBufferSemaphores"), v19, 1u);
    }
    if (v14)
      goto LABEL_27;
LABEL_46:
    if (v20)
    {
      v17 = 0;
      v18 = 0;
      v4 = v20;
      goto LABEL_52;
    }
    if (!-[NSMutableArray count](self->_emitSynchronizedSlaveSampleBufferSemaphores, "count"))
    {
      v20 = 0;
LABEL_53:
      v41 = v54;
      -[BWNodeOutput emitDroppedSample:](self->super._output, "emitDroppedSample:", +[BWDroppedSample newDroppedSampleWithReason:pts:](BWDroppedSample, "newDroppedSampleWithReason:pts:", 0x1E494F038, &v41));
      ++self->_numberOfBuffersEmitted;
LABEL_54:
      ++self->_numberOfSynchronizedSlaveBuffersEmitted;
      goto LABEL_55;
    }
LABEL_27:
    v36 = v21;
    v37 = v14;
    v38 = DataBuffer;
    if (-[NSMutableArray count](self->_emitSynchronizedSlaveSampleBufferSemaphores, "count"))
    {
      ++self->_numberOfTimesSynchronizedSlaveWaited;
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      emitSynchronizedSlaveSampleBufferSemaphores = self->_emitSynchronizedSlaveSampleBufferSemaphores;
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](emitSynchronizedSlaveSampleBufferSemaphores, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v47;
        do
        {
          for (j = 0; j != v25; ++j)
          {
            if (*(_QWORD *)v47 != v26)
              objc_enumerationMutation(emitSynchronizedSlaveSampleBufferSemaphores);
            v28 = *(NSObject **)(*((_QWORD *)&v46 + 1) + 8 * j);
            if ((-[NSMutableSet containsObject:](self->_disabledSynchronizedSlaveSemaphores, "containsObject:", v28) & 1) == 0)
              dispatch_semaphore_wait(v28, 0xFFFFFFFFFFFFFFFFLL);
          }
          v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](emitSynchronizedSlaveSampleBufferSemaphores, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
        }
        while (v25);
      }
    }
    else if (-[NSMutableArray count](self->_emitSampleBufferSemaphores, "count"))
    {
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("We have an emitSampleBufferSemaphore but no emitSynchronizedSlaveSampleBufferSemaphore"), 0));
    }
    if (!v20)
      goto LABEL_53;
    synchronizedSlavePhotoDecompressor = self->_synchronizedSlavePhotoDecompressor;
    if (!synchronizedSlavePhotoDecompressor)
    {
      synchronizedSlavePhotoDecompressor = -[BWPhotoDecompressor initWithOutputPixelBufferPool:]([BWPhotoDecompressor alloc], "initWithOutputPixelBufferPool:", objc_msgSend(-[BWNodeOutput mediaPropertiesForAttachedMediaKey:](self->super._output, "mediaPropertiesForAttachedMediaKey:", CFSTR("SynchronizedSlaveFrame")), "livePixelBufferPool"));
      self->_synchronizedSlavePhotoDecompressor = synchronizedSlavePhotoDecompressor;
    }
    v30 = -[BWPhotoDecompressor newUncompressedSampleBufferFromSampleBuffer:](synchronizedSlavePhotoDecompressor, "newUncompressedSampleBufferFromSampleBuffer:", AttachedMedia);
    FigCaptureMetadataUtilitiesAddSampleBufferMetadataUsedByVideoEncoderToPixelBuffer(v20);
    BWSampleBufferRemoveAttachedMedia(v20, 0x1E495AE38);
    v18 = v37;
    if (v30)
    {
      BWSampleBufferSetAttachedMedia(v20, (uint64_t)CFSTR("SynchronizedSlaveFrame"), (uint64_t)v30);
      if (v40 == v36)
      {
        if (-[NSMutableArray count](self->_emitSynchronizedSlaveSampleBufferSemaphores, "count"))
        {
          objc_msgSend(v19, "addObjectsFromArray:", self->_emitSynchronizedSlaveSampleBufferSemaphores);
          v44 = 0u;
          v45 = 0u;
          v42 = 0u;
          v43 = 0u;
          disabledSynchronizedSlaveSemaphores = self->_disabledSynchronizedSlaveSemaphores;
          v32 = -[NSMutableSet countByEnumeratingWithState:objects:count:](disabledSynchronizedSlaveSemaphores, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
          if (v32)
          {
            v33 = v32;
            v34 = *(_QWORD *)v43;
            do
            {
              for (k = 0; k != v33; ++k)
              {
                if (*(_QWORD *)v43 != v34)
                  objc_enumerationMutation(disabledSynchronizedSlaveSemaphores);
                objc_msgSend(v19, "removeObject:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * k));
              }
              v33 = -[NSMutableSet countByEnumeratingWithState:objects:count:](disabledSynchronizedSlaveSemaphores, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
            }
            while (v33);
          }
        }
      }
      CFRelease(v30);
      v17 = 1;
    }
    else
    {
      v17 = 0;
    }
    v4 = v20;
    DataBuffer = v38;
    if ((v17 & 1) != 0)
      goto LABEL_58;
    goto LABEL_52;
  }
  v15 = (void *)CMGetAttachment(v4, CFSTR("FileWriterAction"), 0);
  if (v15)
  {
    if (self->_synchronizedSlaveAttachedMediaDecompressionEnabled)
    {
      if (objc_msgSend(v15, "isEqualToString:", 0x1E495A078))
      {
        v16 = (void *)CMGetAttachment(v4, CFSTR("RecordingSettings"), 0);
        if (v16)
          -[BWPhotoDecompressorNode _setOverCaptureSynchronizedSlaveSemaphoreEnabled:](self, objc_msgSend(v16, "spatialOverCaptureMovieURL") != 0);
      }
    }
  }
  v17 = 0;
  v18 = 0;
  v19 = 0;
  v20 = 0;
LABEL_52:
  if (v18)
    goto LABEL_53;
LABEL_58:
  if (v4)
  {
    -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", v4);
    if (DataBuffer)
      ++self->_numberOfBuffersEmitted;
    if (v17)
      goto LABEL_54;
  }
LABEL_55:
  if (v20)
    CFRelease(v20);

}

- (_QWORD)_setOverCaptureSynchronizedSlaveSemaphoreEnabled:(_QWORD *)result
{
  _QWORD *v2;
  uint64_t v4;
  id v5;

  if (result)
  {
    v2 = result;
    result = (_QWORD *)result[16];
    if (result)
    {
      v4 = objc_msgSend(result, "lastObject");
      v5 = (id)v2[17];
      if (!v5)
      {
        v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        v2[17] = v5;
      }
      if (a2)
        return (_QWORD *)objc_msgSend(v5, "removeObject:", v4);
      else
        return (_QWORD *)objc_msgSend(v5, "addObject:", v4);
    }
  }
  return result;
}

- (void)handleDroppedSample:(id)a3 forInput:(id)a4
{
  void *v6;
  id v7;
  id v8;

  if (-[NSMutableArray count](self->_emitSampleBufferSemaphores, "count", a3, a4))
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", self->_emitSampleBufferSemaphores);
    if (-[NSMutableArray count](self->_emitSynchronizedSlaveSampleBufferSemaphores, "count"))
      objc_msgSend(v6, "addObjectsFromArray:", self->_emitSynchronizedSlaveSampleBufferSemaphores);
    v7 = +[BWDroppedSample newDroppedSampleFromDroppedSample:backPressureSemaphoresToIgnore:](BWDroppedSample, "newDroppedSampleFromDroppedSample:backPressureSemaphoresToIgnore:", a3, v6);
  }
  else
  {
    v7 = a3;
  }
  v8 = v7;
  -[BWNodeOutput emitDroppedSample:](self->super._output, "emitDroppedSample:", v7);

}

- (BOOL)downstreamIsSharingOutputPool
{
  return self->_downstreamIsSharingOutputPool;
}

- (void)setDownstreamIsSharingOutputPool:(BOOL)a3
{
  self->_downstreamIsSharingOutputPool = a3;
}

- (void)addEmitSynchronizedSlaveSampleBufferSemaphore:(id)a3
{
  NSMutableArray *emitSynchronizedSlaveSampleBufferSemaphores;

  emitSynchronizedSlaveSampleBufferSemaphores = self->_emitSynchronizedSlaveSampleBufferSemaphores;
  if (!emitSynchronizedSlaveSampleBufferSemaphores)
  {
    emitSynchronizedSlaveSampleBufferSemaphores = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    self->_emitSynchronizedSlaveSampleBufferSemaphores = emitSynchronizedSlaveSampleBufferSemaphores;
  }
  -[NSMutableArray addObject:](emitSynchronizedSlaveSampleBufferSemaphores, "addObject:", a3);
}

- (uint64_t)_ensureSemaphoresAreBalanced
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    if (objc_msgSend(*(id *)(result + 120), "count") && *(_DWORD *)(v1 + 148) < *(_DWORD *)(v1 + 144))
    {
      do
      {
        v17 = 0u;
        v18 = 0u;
        v15 = 0u;
        v16 = 0u;
        v2 = *(void **)(v1 + 120);
        v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
        if (v3)
        {
          v4 = v3;
          v5 = *(_QWORD *)v16;
          do
          {
            for (i = 0; i != v4; ++i)
            {
              if (*(_QWORD *)v16 != v5)
                objc_enumerationMutation(v2);
              dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*((_QWORD *)&v15 + 1) + 8 * i));
            }
            v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
          }
          while (v4);
        }
        ++*(_DWORD *)(v1 + 148);
      }
      while (*(_DWORD *)(v1 + 148) < *(_DWORD *)(v1 + 144));
    }
    result = objc_msgSend(*(id *)(v1 + 128), "count");
    if (result && *(_DWORD *)(v1 + 156) < *(_DWORD *)(v1 + 152))
    {
      do
      {
        v13 = 0u;
        v14 = 0u;
        v11 = 0u;
        v12 = 0u;
        v7 = *(void **)(v1 + 128);
        result = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v19, 16);
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
                objc_enumerationMutation(v7);
              dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
            }
            while (v8 != v10);
            result = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v19, 16);
            v8 = result;
          }
          while (result);
        }
        ++*(_DWORD *)(v1 + 156);
      }
      while (*(_DWORD *)(v1 + 156) < *(_DWORD *)(v1 + 152));
    }
  }
  return result;
}

@end
