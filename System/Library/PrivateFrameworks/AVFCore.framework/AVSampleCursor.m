@implementation AVSampleCursor

+ (void)initialize
{
  objc_opt_class();
}

+ (AVSampleCursor)sampleCursorWithFigSampleCursor:(OpaqueFigSampleCursor *)a3
{
  return (AVSampleCursor *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithFigSampleCursor:", a3);
}

- (AVSampleCursor)init
{
  return -[AVSampleCursor initWithFigSampleCursor:](self, "initWithFigSampleCursor:", 0);
}

- (AVSampleCursor)initWithFigSampleCursor:(OpaqueFigSampleCursor *)a3
{
  AVSampleCursor *v4;
  AVSampleCursorInternal *v5;
  OpaqueFigSampleCursor *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVSampleCursor;
  v4 = -[AVSampleCursor init](&v8, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(AVSampleCursorInternal);
    v4->_sampleCursor = v5;
    if (v5
      && ((CFRetain(v5), !a3) ? (v6 = 0) : (v6 = (OpaqueFigSampleCursor *)CFRetain(a3)),
          (v4->_sampleCursor->figSampleCursor = v6) != 0))
    {
      v4->_sampleCursor->implementsGetDecodeTimeStamp = *(_QWORD *)(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 48) != 0;
      v4->_sampleCursor->implementsGetDuration = *(_QWORD *)(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 56) != 0;
      v4->_sampleCursor->implementsGetDependencyInfo = *(_QWORD *)(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 64) != 0;
      v4->_sampleCursor->implementsTestReorderingBoundary = *(_QWORD *)(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 80) != 0;
      v4->_sampleCursor->implementsCopySampleLocation = *(_QWORD *)(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 144) != 0;
      v4->_sampleCursor->implementsCopyChunkDetails = *(_QWORD *)(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 152) != 0;
      v4->_sampleCursor->implementsCreateSampleBuffer = *(_QWORD *)(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 112) != 0;
      v4->_sampleCursor->implementsGetMPEG2FrameType = *(_QWORD *)(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 72) != 0;
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  const __CFAllocator *v6;
  const __CFString *v7;
  CMTime v9;
  CMTime time;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  if (self)
    -[AVSampleCursor presentationTimeStamp](self, "presentationTimeStamp");
  else
    memset(&time, 0, sizeof(time));
  v7 = (id)CMTimeCopyDescription(v6, &time);
  if (self)
    -[AVSampleCursor decodeTimeStamp](self, "decodeTimeStamp");
  else
    memset(&v9, 0, sizeof(v9));
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, PTS = %@, DTS = %@>"), v5, self, v7, (id)CMTimeCopyDescription(v6, &v9));
}

- (void)dealloc
{
  AVSampleCursorInternal *sampleCursor;
  objc_super v4;

  sampleCursor = self->_sampleCursor;
  if (sampleCursor)
  {
    if (sampleCursor->figSampleCursor)
    {
      CFRelease(sampleCursor->figSampleCursor);
      sampleCursor = self->_sampleCursor;
    }
    CFRelease(sampleCursor);

  }
  v4.receiver = self;
  v4.super_class = (Class)AVSampleCursor;
  -[AVSampleCursor dealloc](&v4, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  OpaqueFigSampleCursor *figSampleCursor;
  uint64_t (*v5)(OpaqueFigSampleCursor *, CFTypeRef *);
  int v6;
  CFTypeRef v7;
  BOOL v8;
  AVSampleCursor *v9;
  AVSampleCursor *v10;
  CFTypeRef cf;

  cf = 0;
  figSampleCursor = self->_sampleCursor->figSampleCursor;
  v5 = *(uint64_t (**)(OpaqueFigSampleCursor *, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
  if (!v5)
    return 0;
  v6 = v5(figSampleCursor, &cf);
  v7 = cf;
  if (v6)
    v8 = 1;
  else
    v8 = cf == 0;
  if (!v8)
  {
    v9 = +[AVSampleCursor allocWithZone:](AVSampleCursor, "allocWithZone:", a3);
    v10 = -[AVSampleCursor initWithFigSampleCursor:](v9, "initWithFigSampleCursor:", cf);
    v7 = cf;
    if (!cf)
      return v10;
    goto LABEL_10;
  }
  v10 = 0;
  if (cf)
LABEL_10:
    CFRelease(v7);
  return v10;
}

- (OpaqueFigSampleCursor)_figSampleCursor
{
  return self->_sampleCursor->figSampleCursor;
}

- (int64_t)stepInDecodeOrderByCount:(int64_t)stepCount
{
  OpaqueFigSampleCursor *figSampleCursor;
  void (*v5)(OpaqueFigSampleCursor *, int64_t, int64_t *);
  int64_t v7;

  v7 = 0;
  figSampleCursor = self->_sampleCursor->figSampleCursor;
  v5 = *(void (**)(OpaqueFigSampleCursor *, int64_t, int64_t *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                          + 168);
  if (!v5)
    return 0;
  v5(figSampleCursor, stepCount, &v7);
  return v7;
}

- (int64_t)stepInPresentationOrderByCount:(int64_t)stepCount
{
  OpaqueFigSampleCursor *figSampleCursor;
  void (*v5)(OpaqueFigSampleCursor *, int64_t, int64_t *);
  int64_t v7;

  v7 = 0;
  figSampleCursor = self->_sampleCursor->figSampleCursor;
  v5 = *(void (**)(OpaqueFigSampleCursor *, int64_t, int64_t *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                          + 176);
  if (!v5)
    return 0;
  v5(figSampleCursor, stepCount, &v7);
  return v7;
}

- (CMTime)stepByDecodeTime:(SEL)a3 wasPinned:(CMTime *)deltaDecodeTime
{
  uint64_t v9;
  CMTimeEpoch v10;
  CMTimeEpoch v11;
  OpaqueFigSampleCursor *figSampleCursor;
  void (*v13)(OpaqueFigSampleCursor *, CMTime *);
  OpaqueFigSampleCursor *v14;
  CMTime *result;
  uint64_t (*v16)(OpaqueFigSampleCursor *, CMTime *);
  BOOL v17;
  OpaqueFigSampleCursor *v18;
  void (*v19)(OpaqueFigSampleCursor *, CMTime *);
  __int128 v20;
  __int128 v21;
  CMTime rhs;
  CMTime lhs;
  CMTime v24;
  CMTime v25;
  CMTime v26;

  v9 = MEMORY[0x1E0CA2E68];
  v21 = *MEMORY[0x1E0CA2E68];
  *(_OWORD *)&retstr->value = *MEMORY[0x1E0CA2E68];
  v10 = *(_QWORD *)(v9 + 16);
  retstr->epoch = v10;
  v20 = *MEMORY[0x1E0CA2E18];
  *(_OWORD *)&v25.value = *MEMORY[0x1E0CA2E18];
  v11 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  v25.epoch = v11;
  figSampleCursor = self->_sampleCursor->figSampleCursor;
  v13 = *(void (**)(OpaqueFigSampleCursor *, CMTime *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 48);
  if (v13)
    v13(figSampleCursor, &v25);
  v14 = self->_sampleCursor->figSampleCursor;
  v24 = *deltaDecodeTime;
  result = (CMTime *)CMBaseObjectGetVTable();
  v16 = *(uint64_t (**)(OpaqueFigSampleCursor *, CMTime *))(result->epoch + 120);
  if (v16
    && ((v26 = v24, result = (CMTime *)v16(v14, &v26), (_DWORD)result != -12840)
      ? (v17 = (_DWORD)result == 0)
      : (v17 = 1),
        v17))
  {
    if (outWasPinned)
      *outWasPinned = (_DWORD)result == -12840;
    *(_OWORD *)&v26.value = v20;
    v26.epoch = v11;
    v18 = self->_sampleCursor->figSampleCursor;
    v19 = *(void (**)(OpaqueFigSampleCursor *, CMTime *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 48);
    if (v19)
      v19(v18, &v26);
    lhs = v26;
    rhs = v25;
    result = CMTimeSubtract(&v24, &lhs, &rhs);
    *retstr = v24;
  }
  else
  {
    *(_OWORD *)&retstr->value = v21;
    retstr->epoch = v10;
  }
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stepByDecodeTime:(SEL)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4;

  if (self)
  {
    v4 = *a4;
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[$3CC8671D27C23BF42ADDB32F2B5E48AE stepByDecodeTime:wasPinned:](self, "stepByDecodeTime:wasPinned:", &v4, 0);
  }
  else
  {
    retstr->var0 = 0;
    *(_QWORD *)&retstr->var1 = 0;
    retstr->var3 = 0;
  }
  return self;
}

- (CMTime)stepByPresentationTime:(SEL)a3 wasPinned:(CMTime *)deltaPresentationTime
{
  uint64_t v9;
  CMTimeEpoch v10;
  CMTimeEpoch v11;
  OpaqueFigSampleCursor *figSampleCursor;
  void (*v13)(OpaqueFigSampleCursor *, CMTime *);
  OpaqueFigSampleCursor *v14;
  CMTime *result;
  uint64_t (*v16)(OpaqueFigSampleCursor *, CMTime *);
  BOOL v17;
  OpaqueFigSampleCursor *v18;
  void (*v19)(OpaqueFigSampleCursor *, CMTime *);
  __int128 v20;
  __int128 v21;
  CMTime rhs;
  CMTime lhs;
  CMTime v24;
  CMTime v25;
  CMTime v26;

  v9 = MEMORY[0x1E0CA2E68];
  v21 = *MEMORY[0x1E0CA2E68];
  *(_OWORD *)&retstr->value = *MEMORY[0x1E0CA2E68];
  v10 = *(_QWORD *)(v9 + 16);
  retstr->epoch = v10;
  v20 = *MEMORY[0x1E0CA2E18];
  *(_OWORD *)&v25.value = *MEMORY[0x1E0CA2E18];
  v11 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  v25.epoch = v11;
  figSampleCursor = self->_sampleCursor->figSampleCursor;
  v13 = *(void (**)(OpaqueFigSampleCursor *, CMTime *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
  if (v13)
    v13(figSampleCursor, &v25);
  v14 = self->_sampleCursor->figSampleCursor;
  v24 = *deltaPresentationTime;
  result = (CMTime *)CMBaseObjectGetVTable();
  v16 = *(uint64_t (**)(OpaqueFigSampleCursor *, CMTime *))(result->epoch + 128);
  if (v16
    && ((v26 = v24, result = (CMTime *)v16(v14, &v26), (_DWORD)result != -12840)
      ? (v17 = (_DWORD)result == 0)
      : (v17 = 1),
        v17))
  {
    if (outWasPinned)
      *outWasPinned = (_DWORD)result == -12840;
    *(_OWORD *)&v26.value = v20;
    v26.epoch = v11;
    v18 = self->_sampleCursor->figSampleCursor;
    v19 = *(void (**)(OpaqueFigSampleCursor *, CMTime *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
    if (v19)
      v19(v18, &v26);
    lhs = v26;
    rhs = v25;
    result = CMTimeSubtract(&v24, &lhs, &rhs);
    *retstr = v24;
  }
  else
  {
    *(_OWORD *)&retstr->value = v21;
    retstr->epoch = v10;
  }
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stepByPresentationTime:(SEL)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4;

  if (self)
  {
    v4 = *a4;
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[$3CC8671D27C23BF42ADDB32F2B5E48AE stepByPresentationTime:wasPinned:](self, "stepByPresentationTime:wasPinned:", &v4, 0);
  }
  else
  {
    retstr->var0 = 0;
    *(_QWORD *)&retstr->var1 = 0;
    retstr->var3 = 0;
  }
  return self;
}

- (CMTime)presentationTimeStamp
{
  OpaqueFigSampleCursor *figSampleCursor;
  CMTime *result;
  uint64_t (*v6)(OpaqueFigSampleCursor *, CMTime *);

  *retstr = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  figSampleCursor = self->_sampleCursor->figSampleCursor;
  result = (CMTime *)CMBaseObjectGetVTable();
  v6 = *(uint64_t (**)(OpaqueFigSampleCursor *, CMTime *))(result->epoch + 40);
  if (v6)
    return (CMTime *)v6(figSampleCursor, retstr);
  return result;
}

- (CMTime)decodeTimeStamp
{
  AVSampleCursorInternal *sampleCursor;
  _BOOL4 implementsGetDecodeTimeStamp;
  OpaqueFigSampleCursor *figSampleCursor;
  CMTime *result;
  CMTimeEpoch epoch;
  uint64_t (*v9)(OpaqueFigSampleCursor *, CMTime *);

  *retstr = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  sampleCursor = self->_sampleCursor;
  implementsGetDecodeTimeStamp = sampleCursor->implementsGetDecodeTimeStamp;
  figSampleCursor = sampleCursor->figSampleCursor;
  result = (CMTime *)CMBaseObjectGetVTable();
  epoch = result->epoch;
  if (implementsGetDecodeTimeStamp)
  {
    v9 = *(uint64_t (**)(OpaqueFigSampleCursor *, CMTime *))(epoch + 48);
    if (!v9)
      return result;
    return (CMTime *)v9(figSampleCursor, retstr);
  }
  v9 = *(uint64_t (**)(OpaqueFigSampleCursor *, CMTime *))(epoch + 40);
  if (v9)
    return (CMTime *)v9(figSampleCursor, retstr);
  return result;
}

- (NSComparisonResult)comparePositionInDecodeOrderWithPositionOfCursor:(AVSampleCursor *)cursor
{
  OpaqueFigSampleCursor *v4;
  OpaqueFigSampleCursor *figSampleCursor;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v9)(OpaqueFigSampleCursor *, OpaqueFigSampleCursor *);

  v4 = -[AVSampleCursor _figSampleCursor](cursor, "_figSampleCursor");
  figSampleCursor = self->_sampleCursor->figSampleCursor;
  v6 = *(_QWORD *)(CMBaseObjectGetVTable() + 16);
  if (v4)
    v7 = *(_QWORD *)(CMBaseObjectGetVTable() + 16);
  else
    v7 = 0;
  if (v6 == v7 && (v9 = *(uint64_t (**)(OpaqueFigSampleCursor *, OpaqueFigSampleCursor *))(v6 + 32)) != 0)
    return v9(figSampleCursor, v4);
  else
    return 0;
}

- (BOOL)samplesWithEarlierDecodeTimeStampsMayHaveLaterPresentationTimeStampsThanCursor:(AVSampleCursor *)cursor
{
  OpaqueFigSampleCursor *v4;
  OpaqueFigSampleCursor *figSampleCursor;
  uint64_t v6;
  uint64_t v7;
  unsigned int (*v9)(OpaqueFigSampleCursor *, OpaqueFigSampleCursor *, _QWORD);

  if (!self->_sampleCursor->implementsTestReorderingBoundary)
    return 0;
  v4 = -[AVSampleCursor _figSampleCursor](cursor, "_figSampleCursor");
  figSampleCursor = self->_sampleCursor->figSampleCursor;
  v6 = *(_QWORD *)(CMBaseObjectGetVTable() + 16);
  if (v4)
    v7 = *(_QWORD *)(CMBaseObjectGetVTable() + 16);
  else
    v7 = 0;
  return v6 != v7
      || (v9 = *(unsigned int (**)(OpaqueFigSampleCursor *, OpaqueFigSampleCursor *, _QWORD))(v6 + 80)) == 0
      || v9(figSampleCursor, v4, 0) == 0;
}

- (BOOL)samplesWithLaterDecodeTimeStampsMayHaveEarlierPresentationTimeStampsThanCursor:(AVSampleCursor *)cursor
{
  OpaqueFigSampleCursor *v4;
  OpaqueFigSampleCursor *figSampleCursor;
  uint64_t v6;
  uint64_t v7;
  unsigned int (*v9)(OpaqueFigSampleCursor *, OpaqueFigSampleCursor *, uint64_t);

  if (!self->_sampleCursor->implementsTestReorderingBoundary)
    return 0;
  v4 = -[AVSampleCursor _figSampleCursor](cursor, "_figSampleCursor");
  figSampleCursor = self->_sampleCursor->figSampleCursor;
  v6 = *(_QWORD *)(CMBaseObjectGetVTable() + 16);
  if (v4)
    v7 = *(_QWORD *)(CMBaseObjectGetVTable() + 16);
  else
    v7 = 0;
  return v6 != v7
      || (v9 = *(unsigned int (**)(OpaqueFigSampleCursor *, OpaqueFigSampleCursor *, uint64_t))(v6 + 80)) == 0
      || v9(figSampleCursor, v4, 1) == 0;
}

- (BOOL)canProvideSampleBuffers
{
  return self->_sampleCursor->implementsCreateSampleBuffer;
}

- (opaqueCMSampleBuffer)createSampleBufferForCurrentSampleReturningError:(id *)a3
{
  AVSampleCursorInternal *sampleCursor;
  OpaqueFigSampleCursor *figSampleCursor;
  uint64_t (*v6)(OpaqueFigSampleCursor *, _QWORD, opaqueCMSampleBuffer **);
  signed int v7;
  opaqueCMSampleBuffer *v9;

  sampleCursor = self->_sampleCursor;
  if (!sampleCursor->implementsCreateSampleBuffer)
    return 0;
  v9 = 0;
  figSampleCursor = sampleCursor->figSampleCursor;
  v6 = *(uint64_t (**)(OpaqueFigSampleCursor *, _QWORD, opaqueCMSampleBuffer **))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                          + 112);
  if (v6)
  {
    v7 = v6(figSampleCursor, 0, &v9);
    if (!a3)
      return v9;
LABEL_7:
    if (v7)
      *a3 = (id)AVLocalizedErrorWithUnderlyingOSStatus(v7, 0);
    return v9;
  }
  v7 = -12782;
  if (a3)
    goto LABEL_7;
  return v9;
}

- (opaqueCMSampleBuffer)createSampleBufferFromCurrentSampleToEndCursor:(id)a3 error:(id *)a4
{
  uint64_t v6;
  OpaqueFigSampleCursor *figSampleCursor;
  uint64_t (*v8)(OpaqueFigSampleCursor *, uint64_t, opaqueCMSampleBuffer **);
  signed int v9;
  opaqueCMSampleBuffer *v11;

  if (!self->_sampleCursor->implementsCreateSampleBuffer)
    return 0;
  v6 = objc_msgSend(a3, "_figSampleCursor");
  v11 = 0;
  figSampleCursor = self->_sampleCursor->figSampleCursor;
  v8 = *(uint64_t (**)(OpaqueFigSampleCursor *, uint64_t, opaqueCMSampleBuffer **))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                           + 112);
  if (v8)
  {
    v9 = v8(figSampleCursor, v6, &v11);
    if (!a4)
      return v11;
LABEL_7:
    if (v9)
      *a4 = (id)AVLocalizedErrorWithUnderlyingOSStatus(v9, 0);
    return v11;
  }
  v9 = -12782;
  if (a4)
    goto LABEL_7;
  return v11;
}

- (CMTime)currentSampleDuration
{
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, CMTime *);

  *retstr = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E10];
  v4 = *(_QWORD *)&self->timescale;
  if (*(_BYTE *)(v4 + 17))
  {
    v5 = *(_QWORD *)(v4 + 8);
    self = (CMTime *)CMBaseObjectGetVTable();
    v6 = *(uint64_t (**)(uint64_t, CMTime *))(self->epoch + 56);
    if (v6)
      return (CMTime *)v6(v5, retstr);
  }
  return self;
}

- (CMFormatDescriptionRef)copyCurrentSampleFormatDescription
{
  OpaqueFigSampleCursor *figSampleCursor;
  void (*v3)(OpaqueFigSampleCursor *, const opaqueCMFormatDescription **);
  const opaqueCMFormatDescription *v5;

  v5 = 0;
  figSampleCursor = self->_sampleCursor->figSampleCursor;
  v3 = *(void (**)(OpaqueFigSampleCursor *, const opaqueCMFormatDescription **))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                          + 160);
  if (!v3)
    return 0;
  v3(figSampleCursor, &v5);
  return v5;
}

- (AVSampleCursorSyncInfo)currentSampleSyncInfo
{
  AVSampleCursorInternal *sampleCursor;
  OpaqueFigSampleCursor *figSampleCursor;
  unsigned int (*v4)(OpaqueFigSampleCursor *, char *, char *, _QWORD, char *);
  int implementsGetMPEG2FrameType;
  int v6;
  OpaqueFigSampleCursor *v7;
  unsigned int (*v8)(OpaqueFigSampleCursor *, char *, char *, __int16 *);
  __int16 v10;
  char v11;
  char v12;
  char v13;
  char v14;

  v14 = 1;
  v13 = 0;
  v12 = 0;
  sampleCursor = self->_sampleCursor;
  if (sampleCursor->implementsGetDependencyInfo)
  {
    figSampleCursor = sampleCursor->figSampleCursor;
    v4 = *(unsigned int (**)(OpaqueFigSampleCursor *, char *, char *, _QWORD, char *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                                + 64);
    if (!v4)
    {
      implementsGetMPEG2FrameType = 0;
LABEL_15:
      v6 = 1;
      return (AVSampleCursorSyncInfo)((implementsGetMPEG2FrameType << 8) | ((_DWORD)v4 << 16) | v6);
    }
    if (!v4(figSampleCursor, &v14, &v13, 0, &v12))
    {
      LODWORD(v4) = v12 != 0;
      implementsGetMPEG2FrameType = v13 != 0;
      v6 = v14 != 0;
      return (AVSampleCursorSyncInfo)((implementsGetMPEG2FrameType << 8) | ((_DWORD)v4 << 16) | v6);
    }
    goto LABEL_13;
  }
  implementsGetMPEG2FrameType = sampleCursor->implementsGetMPEG2FrameType;
  if (!sampleCursor->implementsGetMPEG2FrameType)
  {
LABEL_14:
    LODWORD(v4) = 0;
    goto LABEL_15;
  }
  v11 = 0;
  v10 = 0;
  v7 = sampleCursor->figSampleCursor;
  v8 = *(unsigned int (**)(OpaqueFigSampleCursor *, char *, char *, __int16 *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                         + 72);
  if (!v8 || v8(v7, &v11, (char *)&v10 + 1, &v10))
  {
LABEL_13:
    implementsGetMPEG2FrameType = 0;
    goto LABEL_14;
  }
  LODWORD(v4) = v11 == 66;
  implementsGetMPEG2FrameType = v11 == 73 && HIBYTE(v10) != 0;
  v6 = (v11 == 73) & ~implementsGetMPEG2FrameType;
  return (AVSampleCursorSyncInfo)((implementsGetMPEG2FrameType << 8) | ((_DWORD)v4 << 16) | v6);
}

- (AVSampleCursorDependencyInfo)currentSampleDependencyInfo
{
  uint64_t FigBaseObject;
  unsigned int (*v3)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  CFTypeID v4;
  const __CFBoolean *Value;
  _BOOL4 v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const __CFBoolean *v13;
  const __CFBoolean *v14;
  CFTypeRef cf;

  cf = 0;
  FigBaseObject = FigSampleCursorGetFigBaseObject();
  v3 = *(unsigned int (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                           + 48);
  if (!v3 || v3(FigBaseObject, *MEMORY[0x1E0CC5E48], *MEMORY[0x1E0C9AE00], &cf))
    goto LABEL_7;
  if (!cf)
  {
    v7 = 0;
    v6 = 0;
    v11 = 0;
    v10 = 0;
    v9 = 0;
    v8 = 0;
    return (AVSampleCursorDependencyInfo)((v9 << 40) | (v8 << 32) | (v10 << 24) | (v11 << 16) | ((unint64_t)v6 << 8) | v7);
  }
  v4 = CFGetTypeID(cf);
  if (v4 == CFDictionaryGetTypeID())
  {
    Value = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)cf, (const void *)*MEMORY[0x1E0CA2618]);
    if (Value)
    {
      v6 = CFBooleanGetValue(Value) != 0;
      v7 = 1;
    }
    else
    {
      v6 = 0;
      v7 = 0;
    }
    v13 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)cf, (const void *)*MEMORY[0x1E0CA25C8]);
    if (v13)
    {
      v10 = CFBooleanGetValue(v13) != 0;
      v11 = 1;
    }
    else
    {
      v10 = 0;
      v11 = 0;
    }
    v14 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)cf, (const void *)*MEMORY[0x1E0CA2610]);
    if (v14)
    {
      v9 = CFBooleanGetValue(v14) != 0;
      v8 = 1;
    }
    else
    {
      v8 = 0;
      v9 = 0;
    }
  }
  else
  {
LABEL_7:
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v6 = 0;
    v7 = 0;
  }
  if (cf)
    CFRelease(cf);
  return (AVSampleCursorDependencyInfo)((v9 << 40) | (v8 << 32) | (v10 << 24) | (v11 << 16) | ((unint64_t)v6 << 8) | v7);
}

- (AVSampleCursorAudioDependencyInfo)currentSampleAudioDependencyInfo
{
  uint64_t FigBaseObject;
  unsigned int (*v3)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  CFTypeID v4;
  const __CFNumber *Value;
  _BOOL8 v6;
  NSInteger v7;
  CFTypeRef cf;
  _BOOL8 v9;
  NSInteger v10;
  AVSampleCursorAudioDependencyInfo result;

  v9 = 0;
  v10 = 0;
  cf = 0;
  FigBaseObject = FigSampleCursorGetFigBaseObject();
  v3 = *(unsigned int (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                           + 48);
  if (v3 && !v3(FigBaseObject, *MEMORY[0x1E0CC5E48], *MEMORY[0x1E0C9AE00], &cf))
  {
    if (!cf)
      goto LABEL_9;
    v4 = CFGetTypeID(cf);
    if (v4 == CFDictionaryGetTypeID())
    {
      Value = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)cf, (const void *)*MEMORY[0x1E0CA25A8]);
      if (Value)
      {
        LOBYTE(v9) = 1;
        CFNumberGetValue(Value, kCFNumberNSIntegerType, &v10);
      }
    }
  }
  if (cf)
    CFRelease(cf);
LABEL_9:
  v6 = v9;
  v7 = v10;
  result.audioSamplePacketRefreshCount = v7;
  result.audioSampleIsIndependentlyDecodable = v6;
  return result;
}

- (NSDictionary)currentSampleDependencyAttachments
{
  uint64_t FigBaseObject;
  void (*v3)(uint64_t, _QWORD, _QWORD, void **);
  void *v4;
  void *v6;

  v6 = 0;
  FigBaseObject = FigSampleCursorGetFigBaseObject();
  v3 = *(void (**)(uint64_t, _QWORD, _QWORD, void **))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (v3)
  {
    v3(FigBaseObject, *MEMORY[0x1E0CC5E48], *MEMORY[0x1E0C9AE00], &v6);
    v4 = v6;
  }
  else
  {
    v4 = 0;
  }
  return (NSDictionary *)v4;
}

- (NSURL)currentChunkStorageURL
{
  AVSampleCursorInternal *sampleCursor;
  OpaqueFigSampleCursor *figSampleCursor;
  unsigned int (*v4)(OpaqueFigSampleCursor *, CFTypeRef *, id *, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  OpaqueFigSampleCursor *v5;
  unsigned int (*v6)(OpaqueFigSampleCursor *, _QWORD, _QWORD, CFTypeRef *, id *);
  CFTypeRef v7;
  BOOL v8;
  uint64_t CMBaseObject;
  void (*v10)(uint64_t, _QWORD, _QWORD, id *);
  id v12;
  CFTypeRef cf;

  v12 = 0;
  cf = 0;
  sampleCursor = self->_sampleCursor;
  if (sampleCursor->implementsCopyChunkDetails)
  {
    figSampleCursor = sampleCursor->figSampleCursor;
    v4 = *(unsigned int (**)(OpaqueFigSampleCursor *, CFTypeRef *, id *, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 152);
    if (!v4 || v4(figSampleCursor, &cf, &v12, 0, 0, 0, 0, 0, 0, 0))
      goto LABEL_14;
  }
  else if (sampleCursor->implementsCopySampleLocation)
  {
    v5 = sampleCursor->figSampleCursor;
    v6 = *(unsigned int (**)(OpaqueFigSampleCursor *, _QWORD, _QWORD, CFTypeRef *, id *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 144);
    if (!v6 || v6(v5, 0, 0, &cf, &v12))
      goto LABEL_14;
  }
  v7 = cf;
  if (v12)
    v8 = 1;
  else
    v8 = cf == 0;
  if (v8)
    goto LABEL_15;
  CMBaseObject = CMByteStreamGetCMBaseObject();
  v10 = *(void (**)(uint64_t, _QWORD, _QWORD, id *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (v10)
    v10(CMBaseObject, *MEMORY[0x1E0CA2098], *MEMORY[0x1E0C9AE00], &v12);
LABEL_14:
  v7 = cf;
LABEL_15:
  if (v7)
    CFRelease(v7);
  return (NSURL *)v12;
}

- (AVSampleCursorStorageRange)currentChunkStorageRange
{
  AVSampleCursorInternal *sampleCursor;
  OpaqueFigSampleCursor *figSampleCursor;
  uint64_t (*v4)(OpaqueFigSampleCursor *, _QWORD, _QWORD, int64_t *, int64_t *, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  int v5;
  BOOL v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  AVSampleCursorStorageRange result;

  sampleCursor = self->_sampleCursor;
  if (sampleCursor->implementsCopyChunkDetails)
  {
    v9 = 0;
    v10 = 0;
    figSampleCursor = sampleCursor->figSampleCursor;
    v4 = *(uint64_t (**)(OpaqueFigSampleCursor *, _QWORD, _QWORD, int64_t *, int64_t *, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 152);
    if (v4)
    {
      v5 = v4(figSampleCursor, 0, 0, &v10, &v9, 0, 0, 0, 0, 0);
      v6 = v5 == 0;
      if (v5)
        v7 = -1;
      else
        v7 = v10;
      if (v6)
        v8 = v9;
      else
        v8 = 0;
    }
    else
    {
      v8 = 0;
      v7 = -1;
    }
  }
  else
  {
    v7 = -[AVSampleCursor currentSampleStorageRange](self, "currentSampleStorageRange");
  }
  result.length = v8;
  result.offset = v7;
  return result;
}

- (AVSampleCursorChunkInfo)currentChunkInfo
{
  unint64_t v2;
  AVSampleCursorInternal *sampleCursor;
  OpaqueFigSampleCursor *figSampleCursor;
  unsigned int (*v5)(OpaqueFigSampleCursor *, _QWORD, _QWORD, _QWORD, _QWORD, int64_t *, _QWORD, char *, __int16 *, char *);
  int64_t v6;
  _BOOL8 v7;
  char v8;
  __int16 v9;
  int64_t v10;
  AVSampleCursorChunkInfo result;

  v2 = 65793;
  sampleCursor = self->_sampleCursor;
  if (sampleCursor->implementsCopyChunkDetails
    && (v10 = 0,
        v9 = 0,
        v8 = 0,
        figSampleCursor = sampleCursor->figSampleCursor,
        (v5 = *(unsigned int (**)(OpaqueFigSampleCursor *, _QWORD, _QWORD, _QWORD, _QWORD, int64_t *, _QWORD, char *, __int16 *, char *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 152)) != 0)
    && !v5(figSampleCursor, 0, 0, 0, 0, &v10, 0, (char *)&v9 + 1, &v9, &v8))
  {
    v6 = v10;
    v2 = (HIBYTE(v9) != 0) | ((unint64_t)((_BYTE)v9 != 0) << 8) | ((unint64_t)(v8 != 0) << 16);
  }
  else
  {
    v6 = 1;
  }
  v7 = v2;
  result.chunkHasUniformSampleSizes = v7;
  result.chunkHasUniformSampleDurations = BYTE1(v7);
  result.chunkHasUniformFormatDescriptions = BYTE2(v7);
  result.chunkSampleCount = v6;
  return result;
}

- (int64_t)currentSampleIndexInChunk
{
  AVSampleCursorInternal *sampleCursor;
  OpaqueFigSampleCursor *figSampleCursor;
  unsigned int (*v4)(OpaqueFigSampleCursor *, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, int64_t *, _QWORD, _QWORD, _QWORD);
  int64_t v6;

  sampleCursor = self->_sampleCursor;
  if (!sampleCursor->implementsCopyChunkDetails)
    return 0;
  v6 = 0;
  figSampleCursor = sampleCursor->figSampleCursor;
  v4 = *(unsigned int (**)(OpaqueFigSampleCursor *, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, int64_t *, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 152);
  if (!v4)
    return 0;
  if (v4(figSampleCursor, 0, 0, 0, 0, 0, &v6, 0, 0, 0))
    return 0;
  return v6;
}

- (AVSampleCursorStorageRange)currentSampleStorageRange
{
  AVSampleCursorInternal *sampleCursor;
  uint64_t v3;
  OpaqueFigSampleCursor *figSampleCursor;
  uint64_t (*v5)(OpaqueFigSampleCursor *, uint64_t *, int64_t *, _QWORD, _QWORD);
  int v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  AVSampleCursorStorageRange result;

  sampleCursor = self->_sampleCursor;
  v3 = -1;
  if (sampleCursor->implementsCopySampleLocation
    && (v9 = 0,
        v10 = -1,
        figSampleCursor = sampleCursor->figSampleCursor,
        (v5 = *(uint64_t (**)(OpaqueFigSampleCursor *, uint64_t *, int64_t *, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 144)) != 0))
  {
    v6 = v5(figSampleCursor, &v10, &v9, 0, 0);
    if (v6)
      v3 = -1;
    else
      v3 = v10;
    if (v6)
      v7 = 0;
    else
      v7 = v9;
  }
  else
  {
    v7 = 0;
  }
  v8 = v3;
  result.length = v7;
  result.offset = v8;
  return result;
}

- (NSInteger)samplesRequiredForDecoderRefresh
{
  uint64_t FigBaseObject;
  uint64_t (*v3)(uint64_t, _QWORD, _QWORD, CFNumberRef *);
  int v4;
  CFNumberRef v5;
  NSInteger v6;
  int valuePtr;
  CFNumberRef number;

  number = 0;
  FigBaseObject = FigSampleCursorGetFigBaseObject();
  v3 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, CFNumberRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (!v3)
    return 0;
  v4 = v3(FigBaseObject, *MEMORY[0x1E0CC5E38], *MEMORY[0x1E0C9AE00], &number);
  v5 = number;
  if (v4)
  {
    v6 = 0;
    if (!number)
      return v6;
    goto LABEL_4;
  }
  valuePtr = 0;
  CFNumberGetValue(number, kCFNumberSInt32Type, &valuePtr);
  v6 = valuePtr;
  v5 = number;
  if (number)
LABEL_4:
    CFRelease(v5);
  return v6;
}

- (id)seamIdentifier
{
  uint64_t FigBaseObject;
  unsigned int (*v3)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  id v4;
  id v5;
  CFTypeRef cf;

  cf = 0;
  FigBaseObject = FigSampleCursorGetFigBaseObject();
  v3 = *(unsigned int (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                           + 48);
  if (!v3 || v3(FigBaseObject, *MEMORY[0x1E0CC5E50], *MEMORY[0x1E0C9AE00], &cf))
  {
    v5 = 0;
  }
  else
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3A28]);
    v5 = (id)objc_msgSend(v4, "initWithUUIDString:", cf);
  }
  if (cf)
    CFRelease(cf);
  return v5;
}

@end
