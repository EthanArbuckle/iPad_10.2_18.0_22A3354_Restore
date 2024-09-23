@implementation AVFigAssetWriterAudioTrack

- (AVFigAssetWriterAudioTrack)initWithFigAssetWriter:(OpaqueFigAssetWriter *)a3 mediaType:(id)a4 mediaFileType:(id)a5 formatSpecification:(id)a6 sourcePixelBufferAttributes:(id)a7 multiPass:(BOOL)a8 error:(id *)a9
{
  AVFigAssetWriterAudioTrack *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AVFigAssetWriterAudioTrack;
  v9 = -[AVFigAssetWriterTrack initWithFigAssetWriter:mediaType:mediaFileType:formatSpecification:sourcePixelBufferAttributes:multiPass:error:](&v11, sel_initWithFigAssetWriter_mediaType_mediaFileType_formatSpecification_sourcePixelBufferAttributes_multiPass_error_, a3, a4, a5, a6, a7, a8, a9);
  if (v9)
    v9->_pendingAudioSampleBuffers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVFigAssetWriterAudioTrack;
  -[AVFigAssetWriterTrack dealloc](&v3, sel_dealloc);
}

- (int)_attachToFigAssetWriterUsingFormatSpecification:(id)a3 sourcePixelBufferAttributes:(id)a4 multiPass:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  void *v11;
  uint64_t v12;
  AVMediaFileType *v13;
  AVMediaFileType *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  OpaqueFigAssetWriter *v18;
  uint64_t v19;
  uint64_t (*v20)(OpaqueFigAssetWriter *, _OWORD *, uint64_t, void *, uint64_t, uint64_t, int *);
  uint64_t v21;
  objc_super v23;
  uint64_t v24;
  _OWORD v25[2];
  uint64_t v26;
  int v27;
  id v28;

  v7 = a5;
  v28 = 0;
  v27 = 0;
  v11 = (void *)objc_msgSend(a3, "outputSettings");
  v12 = objc_msgSend(a3, "sourceFormatDescription");
  v13 = -[AVFigAssetWriterTrack mediaFileType](self, "mediaFileType");
  if (!v11)
  {
    v23.receiver = self;
    v23.super_class = (Class)AVFigAssetWriterAudioTrack;
    v27 = -[AVFigAssetWriterTrack _attachToFigAssetWriterUsingFormatSpecification:sourcePixelBufferAttributes:multiPass:error:](&v23, sel__attachToFigAssetWriterUsingFormatSpecification_sourcePixelBufferAttributes_multiPass_error_, a3, a4, v7, &v28);
    if (!a6)
      return v27;
    goto LABEL_13;
  }
  v14 = v13;
  v26 = 0;
  memset(v25, 0, sizeof(v25));
  v24 = 0;
  if (v12)
    v15 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v12, *MEMORY[0x1E0CC3C90]);
  else
    v15 = 0;
  objc_msgSend(v11, "willYieldCompressedSamples");
  objc_msgSend(v11, "getAudioStreamBasicDescription:forAudioFileTypeID:sourceFormatDescription:", v25, -[AVMediaFileType audioFileTypeID](v14, "audioFileTypeID"), v12);
  v16 = (void *)objc_msgSend(v11, "copyAudioChannelLayoutForSourceFormatDescription:audioChannelLayoutSize:", v12, &v24);
  v17 = objc_msgSend(v11, "audioOptions");
  v18 = -[AVFigAssetWriterTrack figAssetWriter](self, "figAssetWriter");
  v19 = v24;
  v20 = *(uint64_t (**)(OpaqueFigAssetWriter *, _OWORD *, uint64_t, void *, uint64_t, uint64_t, int *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
  if (!v20)
  {
    v21 = 4294954514;
    goto LABEL_11;
  }
  v21 = v20(v18, v25, v19, v16, v17, v15, &v27);
  if ((_DWORD)v21)
LABEL_11:
    v28 = +[AVAssetWriter _errorForOSStatus:](AVAssetWriter, "_errorForOSStatus:", v21);
  free(v16);
  if (a6)
LABEL_13:
    *a6 = v28;
  return v27;
}

- (BOOL)_flushPendingSampleBuffersReturningError:(id *)a3
{
  NSMutableArray *pendingAudioSampleBuffers;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CMItemCount v10;
  const opaqueCMFormatDescription *FormatDescription;
  opaqueCMSampleBuffer *v12;
  CMItemCount NumSamples;
  OpaqueCMBlockBuffer *DataBuffer;
  uint64_t v15;
  CMSampleBufferRef v16;
  id v17;
  objc_super v19;
  size_t sampleSizeArray;
  CMSampleBufferRef v21;
  CMSampleTimingInfo timingInfoOut;
  CMBlockBufferRef blockBufferOut;

  pendingAudioSampleBuffers = self->_pendingAudioSampleBuffers;
  blockBufferOut = 0;
  memset(&timingInfoOut, 0, sizeof(timingInfoOut));
  sampleSizeArray = 0;
  v21 = 0;
  v6 = CMBlockBufferCreateEmpty(0, -[NSMutableArray count](pendingAudioSampleBuffers, "count"), 0, &blockBufferOut);
  if ((_DWORD)v6)
  {
    v15 = v6;
    v16 = 0;
  }
  else
  {
    v7 = -[NSMutableArray count](pendingAudioSampleBuffers, "count");
    if (v7 < 1)
    {
      FormatDescription = 0;
      v10 = 0;
    }
    else
    {
      v8 = v7;
      v9 = 0;
      v10 = 0;
      FormatDescription = 0;
      do
      {
        v12 = (opaqueCMSampleBuffer *)-[NSMutableArray objectAtIndex:](pendingAudioSampleBuffers, "objectAtIndex:", v9);
        NumSamples = CMSampleBufferGetNumSamples(v12);
        if (!v9)
        {
          FormatDescription = CMSampleBufferGetFormatDescription(v12);
          sampleSizeArray = CMSampleBufferGetSampleSize(v12, 0);
          CMSampleBufferGetSampleTimingInfo(v12, 0, &timingInfoOut);
        }
        v10 += NumSamples;
        DataBuffer = CMSampleBufferGetDataBuffer(v12);
        CMBlockBufferAppendBufferReference(blockBufferOut, DataBuffer, 0, 0, 0);
        ++v9;
      }
      while (v8 != v9);
    }
    v15 = CMSampleBufferCreate(0, blockBufferOut, 1u, 0, 0, FormatDescription, v10, 1, &timingInfoOut, 1, &sampleSizeArray, &v21);
    if ((_DWORD)v15)
      v16 = 0;
    else
      v16 = v21;
  }
  if (blockBufferOut)
    CFRelease(blockBufferOut);
  timingInfoOut.duration.value = 0;
  if ((_DWORD)v15)
  {
    v17 = +[AVAssetWriter _errorForOSStatus:](AVAssetWriter, "_errorForOSStatus:", v15);
    LOBYTE(v15) = 0;
    timingInfoOut.duration.value = (CMTimeValue)v17;
    if (!v16)
      goto LABEL_17;
    goto LABEL_16;
  }
  v19.receiver = self;
  v19.super_class = (Class)AVFigAssetWriterAudioTrack;
  LODWORD(v15) = -[AVFigAssetWriterTrack addSampleBuffer:error:](&v19, sel_addSampleBuffer_error_, v16, &timingInfoOut);
  if (v16)
LABEL_16:
    CFRelease(v16);
LABEL_17:
  -[NSMutableArray removeAllObjects](self->_pendingAudioSampleBuffers, "removeAllObjects");
  if (a3)
    *a3 = (id)timingInfoOut.duration.value;
  return v15;
}

- (BOOL)addSampleBuffer:(opaqueCMSampleBuffer *)a3 error:(id *)a4
{
  const opaqueCMFormatDescription *FormatDescription;
  const opaqueCMFormatDescription *v8;
  _BOOL4 v9;
  const AudioStreamBasicDescription *StreamBasicDescription;
  __int128 v11;
  NSMutableArray *pendingAudioSampleBuffers;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  objc_super v18;
  CMTime time2;
  CMTime lhs;
  CMTime rhs;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  CMTime v26;
  objc_super v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (!self)
  {
    v28 = 0;
    v29 = 0;
    v30 = 0;
    goto LABEL_19;
  }
  -[AVFigAssetWriterTrack sampleBufferCoalescingInterval](self, "sampleBufferCoalescingInterval");
  if ((v29 & 0x100000000) == 0)
  {
LABEL_19:
    v27.receiver = self;
    v27.super_class = (Class)AVFigAssetWriterAudioTrack;
    LOBYTE(v9) = -[AVFigAssetWriterTrack addSampleBuffer:error:](&v27, sel_addSampleBuffer_error_, a3, a4);
    return v9;
  }
  FormatDescription = CMSampleBufferGetFormatDescription(a3);
  if (!-[NSMutableArray count](self->_pendingAudioSampleBuffers, "count")
    || (v8 = CMSampleBufferGetFormatDescription((CMSampleBufferRef)-[NSMutableArray objectAtIndex:](self->_pendingAudioSampleBuffers, "objectAtIndex:", 0)), CMFormatDescriptionEqual(FormatDescription, v8))|| (v9 = -[AVFigAssetWriterAudioTrack _flushPendingSampleBuffersReturningError:](self, "_flushPendingSampleBuffersReturningError:", a4)))
  {
    StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(FormatDescription);
    if (StreamBasicDescription
      && StreamBasicDescription->mFormatID == 1819304813
      && (StreamBasicDescription->mFormatFlags & 0x20) == 0)
    {
      -[NSMutableArray addObject:](self->_pendingAudioSampleBuffers, "addObject:", a3);
      v11 = *MEMORY[0x1E0CA2E68];
      v26.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      *(_OWORD *)&v26.value = v11;
      pendingAudioSampleBuffers = self->_pendingAudioSampleBuffers;
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](pendingAudioSampleBuffers, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v23;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v23 != v15)
              objc_enumerationMutation(pendingAudioSampleBuffers);
            CMSampleBufferGetDuration(&rhs, *(CMSampleBufferRef *)(*((_QWORD *)&v22 + 1) + 8 * i));
            lhs = v26;
            CMTimeAdd(&v26, &lhs, &rhs);
          }
          v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](pendingAudioSampleBuffers, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
        }
        while (v14);
      }
      -[AVFigAssetWriterTrack sampleBufferCoalescingInterval](self, "sampleBufferCoalescingInterval");
      lhs = v26;
      LOBYTE(v9) = CMTimeCompare(&lhs, &time2) < 1
                || -[AVFigAssetWriterAudioTrack _flushPendingSampleBuffersReturningError:](self, "_flushPendingSampleBuffersReturningError:", a4);
    }
    else
    {
      v18.receiver = self;
      v18.super_class = (Class)AVFigAssetWriterAudioTrack;
      LOBYTE(v9) = -[AVFigAssetWriterTrack addSampleBuffer:error:](&v18, sel_addSampleBuffer_error_, a3, a4);
    }
  }
  return v9;
}

- (void)prepareToEndSession
{
  if (-[NSMutableArray count](self->_pendingAudioSampleBuffers, "count"))
    -[AVFigAssetWriterAudioTrack _flushPendingSampleBuffersReturningError:](self, "_flushPendingSampleBuffersReturningError:", 0);
}

- (BOOL)markEndOfDataReturningError:(id *)a3
{
  _BOOL4 v5;
  objc_super v7;
  void *v8;

  v8 = 0;
  if (!-[NSMutableArray count](self->_pendingAudioSampleBuffers, "count")
    || (v5 = -[AVFigAssetWriterAudioTrack _flushPendingSampleBuffersReturningError:](self, "_flushPendingSampleBuffersReturningError:", &v8)))
  {
    v7.receiver = self;
    v7.super_class = (Class)AVFigAssetWriterAudioTrack;
    LOBYTE(v5) = -[AVFigAssetWriterTrack markEndOfDataReturningError:](&v7, sel_markEndOfDataReturningError_, &v8);
  }
  if (a3)
    *a3 = v8;
  return v5;
}

@end
