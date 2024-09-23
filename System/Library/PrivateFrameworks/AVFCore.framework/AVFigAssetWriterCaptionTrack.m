@implementation AVFigAssetWriterCaptionTrack

- (int)_attachToFigAssetWriterUsingFormatSpecification:(id)a3 sourcePixelBufferAttributes:(id)a4 multiPass:(BOOL)a5 error:(id *)a6
{
  uint64_t v9;
  NSString *v10;
  __CFDictionary *Mutable;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int v16;
  const void **v17;
  OpaqueFigAssetWriter *v18;
  uint64_t (*v19)(OpaqueFigAssetWriter *, uint64_t, uint64_t, __CFDictionary *, int *);
  AVCaptionGrouper *v20;
  id v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  __int128 v28;
  uint64_t v29;
  int v30;

  v9 = CMMediaTypeFromAVMediaType(-[AVFigAssetWriterTrack mediaType](self, "mediaType", a3, a4, a5));
  v10 = -[AVMediaFileType UTI](-[AVFigAssetWriterTrack mediaFileType](self, "mediaFileType"), "UTI");
  v30 = 0;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (-[NSString isEqualToString:](v10, "isEqualToString:", CFSTR("com.apple.itunes-timed-text")))
  {
    v12 = 1634301044;
  }
  else if (-[NSString isEqualToString:](v10, "isEqualToString:", CFSTR("com.scenarist.closed-caption")))
  {
    v12 = 1664495672;
  }
  else if (-[NSString isEqualToString:](v10, "isEqualToString:", CFSTR("org.w3.webvtt")))
  {
    v12 = 2004251764;
  }
  else
  {
    v12 = 0;
  }
  v13 = (void *)objc_msgSend(a3, "outputSettings");
  v14 = v13;
  if (v13)
    objc_msgSend(v13, "captionTimeCodeFrameDuration");
  v28 = 0uLL;
  v29 = 0;
  v15 = FigCFDictionarySetCMTime();
  if ((_DWORD)v15)
    goto LABEL_24;
  v16 = objc_msgSend(v14, "useDropFrameTimeCode", 0, 0, 0);
  v17 = (const void **)MEMORY[0x1E0C9AE40];
  if (v16)
    v17 = (const void **)MEMORY[0x1E0C9AE50];
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CC3FD0], *v17);
  v18 = -[AVFigAssetWriterTrack figAssetWriter](self, "figAssetWriter");
  v19 = *(uint64_t (**)(OpaqueFigAssetWriter *, uint64_t, uint64_t, __CFDictionary *, int *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 152);
  if (!v19)
  {
    v25 = 4294954514;
LABEL_17:
    v21 = +[AVAssetWriter _errorForOSStatus:](AVAssetWriter, "_errorForOSStatus:", v25, v28, v29);
    goto LABEL_18;
  }
  v15 = v19(v18, v9, v12, Mutable, &v30);
  if ((_DWORD)v15)
  {
LABEL_24:
    v25 = v15;
    goto LABEL_17;
  }
  v20 = objc_alloc_init(AVCaptionGrouper);
  v21 = 0;
  self->_captionGrouper = v20;
  v22 = MEMORY[0x1E0CA2E40];
  v23 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
  *(_OWORD *)&self->_previousCaptionTimeRange.start.value = *MEMORY[0x1E0CA2E40];
  *(_OWORD *)&self->_previousCaptionTimeRange.start.epoch = v23;
  *(_OWORD *)&self->_previousCaptionTimeRange.duration.timescale = *(_OWORD *)(v22 + 32);
  v24 = MEMORY[0x1E0CA2E18];
  *(_OWORD *)&self->_nextGroupStartTime.value = *MEMORY[0x1E0CA2E18];
  self->_nextGroupStartTime.epoch = *(_QWORD *)(v24 + 16);
LABEL_18:
  v26 = v30;
  if (a6 && !v30)
    *a6 = v21;
  if (Mutable)
  {
    CFRelease(Mutable);
    return v30;
  }
  return v26;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVFigAssetWriterCaptionTrack;
  -[AVFigAssetWriterTrack dealloc](&v3, sel_dealloc);
}

- (BOOL)addSampleBuffer:(opaqueCMSampleBuffer *)a3 error:(id *)a4
{
  if (a4)
    *a4 = (id)AVErrorForClientProgrammingError(objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Cannot call appendSampleBuffer: when a caption adaptor is attached"), 0));
  return 0;
}

- (BOOL)flushCaptionsUntilTime:(id *)a3 error:(id *)a4
{
  AVCaptionGrouper *captionGrouper;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL4 v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  captionGrouper = self->_captionGrouper;
  v18 = *a3;
  v7 = -[AVCaptionGrouper flushAddedCaptionsIntoGroupsUpToTime:](captionGrouper, "flushAddedCaptionsIntoGroupsUpToTime:", &v18);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v10)
        objc_enumerationMutation(v7);
      v12 = -[AVFigAssetWriterCaptionTrack addCaptionGroupAsSampleBuffer:error:](self, "addCaptionGroupAsSampleBuffer:error:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11), a4);
      if (!v12)
        break;
      if (v9 == ++v11)
      {
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    LOBYTE(v12) = 1;
  }
  return v12;
}

- (BOOL)flushCaptionsWithError:(id *)a3
{
  __int128 v4;
  uint64_t v5;

  v4 = *MEMORY[0x1E0CA2E30];
  v5 = *(_QWORD *)(MEMORY[0x1E0CA2E30] + 16);
  return -[AVFigAssetWriterCaptionTrack flushCaptionsUntilTime:error:](self, "flushCaptionsUntilTime:error:", &v4, a3);
}

- (BOOL)addCaptionGroupAsSampleBuffer:(id)a3 error:(id *)a4
{
  uint64_t v6;
  const void *v7;
  BOOL v8;
  objc_super v10;
  void *v11;

  v11 = 0;
  v6 = objc_msgSend(a3, "copySampleBufferWithError:", &v11);
  if (v6)
  {
    v7 = (const void *)v6;
    v10.receiver = self;
    v10.super_class = (Class)AVFigAssetWriterCaptionTrack;
    v8 = -[AVFigAssetWriterTrack addSampleBuffer:error:](&v10, sel_addSampleBuffer_error_, v6, &v11);
    CFRelease(v7);
    if (!a4)
      return v8;
  }
  else
  {
    v8 = 0;
    if (!a4)
      return v8;
  }
  if (!v8)
    *a4 = v11;
  return v8;
}

- (BOOL)addCaption:(id)a3 error:(id *)a4
{
  $11E8FAD63EF01618BAA11C8CE4E61C06 *p_previousCaptionTimeRange;
  void *v8;
  uint64_t v9;
  const __CFString *v10;
  __int128 v11;
  BOOL result;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  _BYTE time2[32];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  CMTime v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  CMTime time1;
  void *v29;

  v29 = 0;
  p_previousCaptionTimeRange = &self->_previousCaptionTimeRange;
  if ((self->_previousCaptionTimeRange.start.flags & 1) != 0)
  {
    if (a3)
    {
      objc_msgSend(a3, "timeRange");
    }
    else
    {
      v26 = 0u;
      v27 = 0u;
      v25 = 0u;
    }
    *(_OWORD *)&time1.value = v25;
    time1.epoch = v26;
    *(_OWORD *)time2 = *(_OWORD *)&p_previousCaptionTimeRange->start.value;
    *(_QWORD *)&time2[16] = p_previousCaptionTimeRange->start.epoch;
    if (CMTimeCompare(&time1, (CMTime *)time2) < 0)
    {
      v8 = (void *)MEMORY[0x1E0C99DA0];
      v9 = *MEMORY[0x1E0C99778];
      v10 = CFSTR("Caption times must be non-decreasing");
      goto LABEL_21;
    }
  }
  if ((self->_nextGroupStartTime.flags & 1) != 0)
  {
    if (a3)
    {
      objc_msgSend(a3, "timeRange");
    }
    else
    {
      v22 = 0u;
      v23 = 0u;
      v21 = 0u;
    }
    *(_OWORD *)&v24.value = v21;
    v24.epoch = v22;
    *(_OWORD *)time2 = *(_OWORD *)&self->_nextGroupStartTime.value;
    *(_QWORD *)&time2[16] = self->_nextGroupStartTime.epoch;
    if (CMTimeCompare(&v24, (CMTime *)time2) < 0)
    {
      v8 = (void *)MEMORY[0x1E0C99DA0];
      v9 = *MEMORY[0x1E0C99778];
      v10 = CFSTR("Caption cannot occur previous previous group");
LABEL_21:
      v13 = AVErrorForClientProgrammingError(objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v10, 0));
      result = 0;
      v29 = (void *)v13;
      if (!a4)
        return result;
      goto LABEL_22;
    }
  }
  if (a3)
  {
    objc_msgSend(a3, "timeRange");
  }
  else
  {
    v20 = 0u;
    memset(time2, 0, sizeof(time2));
  }
  v11 = *(_OWORD *)&time2[16];
  *(_OWORD *)&p_previousCaptionTimeRange->start.value = *(_OWORD *)time2;
  *(_OWORD *)&p_previousCaptionTimeRange->start.epoch = v11;
  *(_OWORD *)&p_previousCaptionTimeRange->duration.timescale = v20;
  -[AVCaptionGrouper addCaption:](self->_captionGrouper, "addCaption:", a3);
  if (a3)
  {
    objc_msgSend(a3, "timeRange");
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v14 = 0u;
  }
  v17 = v14;
  v18 = v15;
  result = -[AVFigAssetWriterCaptionTrack flushCaptionsUntilTime:error:](self, "flushCaptionsUntilTime:error:", &v17, &v29, v14, v15, v16);
  if (a4)
  {
LABEL_22:
    if (!result)
      *a4 = v29;
  }
  return result;
}

- (BOOL)addCaptionGroup:(id)a3 error:(id *)a4
{
  $95D729B680665BEAEFA1D6FCA8238556 *p_nextGroupStartTime;
  void *v8;
  uint64_t v9;
  const __CFString *v10;
  __int128 v11;
  __int128 v12;
  BOOL result;
  uint64_t v14;
  CMTimeRange v15;
  CMTime v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  CMTime v20;
  CMTimeRange time2;
  CMTime v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  CMTime time1;
  void *v27;

  v27 = 0;
  p_nextGroupStartTime = &self->_nextGroupStartTime;
  if ((self->_nextGroupStartTime.flags & 1) != 0)
  {
    if (a3)
    {
      objc_msgSend(a3, "timeRange");
    }
    else
    {
      v24 = 0u;
      v25 = 0u;
      v23 = 0u;
    }
    *(_OWORD *)&time1.value = v23;
    time1.epoch = v24;
    *(_OWORD *)&time2.start.value = *(_OWORD *)&p_nextGroupStartTime->value;
    time2.start.epoch = p_nextGroupStartTime->epoch;
    if (CMTimeCompare(&time1, &time2.start))
    {
      v8 = (void *)MEMORY[0x1E0C99DA0];
      v9 = *MEMORY[0x1E0C99778];
      v10 = CFSTR("Caption group times must be contiguous");
      goto LABEL_18;
    }
  }
  v11 = *(_OWORD *)&self->_previousCaptionTimeRange.start.epoch;
  *(_OWORD *)&time2.start.value = *(_OWORD *)&self->_previousCaptionTimeRange.start.value;
  *(_OWORD *)&time2.start.epoch = v11;
  *(_OWORD *)&time2.duration.timescale = *(_OWORD *)&self->_previousCaptionTimeRange.duration.timescale;
  CMTimeRangeGetEnd(&v22, &time2);
  if ((v22.flags & 1) != 0)
  {
    if (a3)
    {
      objc_msgSend(a3, "timeRange");
    }
    else
    {
      v18 = 0u;
      v19 = 0u;
      v17 = 0u;
    }
    *(_OWORD *)&v20.value = v17;
    v20.epoch = v18;
    v12 = *(_OWORD *)&self->_previousCaptionTimeRange.start.epoch;
    *(_OWORD *)&time2.start.value = *(_OWORD *)&self->_previousCaptionTimeRange.start.value;
    *(_OWORD *)&time2.start.epoch = v12;
    *(_OWORD *)&time2.duration.timescale = *(_OWORD *)&self->_previousCaptionTimeRange.duration.timescale;
    CMTimeRangeGetEnd(&v16, &time2);
    if (CMTimeCompare(&v20, &v16) < 0)
    {
      v8 = (void *)MEMORY[0x1E0C99DA0];
      v9 = *MEMORY[0x1E0C99778];
      v10 = CFSTR("Caption group cannot occur before previous caption");
LABEL_18:
      v14 = AVErrorForClientProgrammingError(objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v10, 0));
      result = 0;
      v27 = (void *)v14;
      if (!a4)
        return result;
      goto LABEL_19;
    }
  }
  if (a3)
    objc_msgSend(a3, "timeRange");
  else
    memset(&v15, 0, sizeof(v15));
  CMTimeRangeGetEnd(&time2.start, &v15);
  *(_OWORD *)&p_nextGroupStartTime->value = *(_OWORD *)&time2.start.value;
  p_nextGroupStartTime->epoch = time2.start.epoch;
  result = -[AVFigAssetWriterCaptionTrack addCaptionGroupAsSampleBuffer:error:](self, "addCaptionGroupAsSampleBuffer:error:", a3, &v27);
  if (a4)
  {
LABEL_19:
    if (!result)
      *a4 = v27;
  }
  return result;
}

- (void)prepareToEndSession
{
  objc_super v3;

  -[AVFigAssetWriterCaptionTrack flushCaptionsWithError:](self, "flushCaptionsWithError:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AVFigAssetWriterCaptionTrack;
  -[AVFigAssetWriterTrack prepareToEndSession](&v3, sel_prepareToEndSession);
}

- (BOOL)markEndOfDataReturningError:(id *)a3
{
  _BOOL4 v5;
  objc_super v7;
  void *v8;

  v8 = 0;
  v5 = -[AVFigAssetWriterCaptionTrack flushCaptionsWithError:](self, "flushCaptionsWithError:", &v8);
  if (v5)
  {
    v7.receiver = self;
    v7.super_class = (Class)AVFigAssetWriterCaptionTrack;
    LOBYTE(v5) = -[AVFigAssetWriterTrack markEndOfDataReturningError:](&v7, sel_markEndOfDataReturningError_, &v8);
  }
  if (a3 && !v5)
    *a3 = v8;
  return v5;
}

@end
