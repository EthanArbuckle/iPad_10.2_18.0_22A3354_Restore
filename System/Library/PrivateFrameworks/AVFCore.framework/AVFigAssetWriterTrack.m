@implementation AVFigAssetWriterTrack

+ (AVFigAssetWriterTrack)assetWriterTrackWithFigAssetWriter:(OpaqueFigAssetWriter *)a3 mediaType:(id)a4 mediaFileType:(id)a5 formatSpecification:(id)a6 sourcePixelBufferAttributes:(id)a7 multiPass:(BOOL)a8 attachedAdaptor:(id)a9 error:(id *)a10
{
  _BOOL8 v10;

  v10 = a8;
  if ((objc_msgSend(a4, "isEqualToString:", CFSTR("soun")) & 1) == 0
    && (objc_msgSend(a4, "isEqualToString:", CFSTR("vide")) & 1) == 0
    && (objc_msgSend(a4, "isEqualToString:", CFSTR("auxv")) & 1) == 0)
  {
    objc_opt_class();
    objc_opt_class();
  }
  return (AVFigAssetWriterTrack *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFigAssetWriter:mediaType:mediaFileType:formatSpecification:sourcePixelBufferAttributes:multiPass:error:", a3, a4, a5, a6, a7, v10, a10);
}

- (AVFigAssetWriterTrack)init
{
  return -[AVFigAssetWriterTrack initWithFigAssetWriter:mediaType:mediaFileType:formatSpecification:sourcePixelBufferAttributes:multiPass:error:](self, "initWithFigAssetWriter:mediaType:mediaFileType:formatSpecification:sourcePixelBufferAttributes:multiPass:error:", 0, 0, 0, 0, 0, 0, 0);
}

- (AVFigAssetWriterTrack)initWithFigAssetWriter:(OpaqueFigAssetWriter *)a3 mediaType:(id)a4 mediaFileType:(id)a5 formatSpecification:(id)a6 sourcePixelBufferAttributes:(id)a7 multiPass:(BOOL)a8 error:(id *)a9
{
  _BOOL8 v9;
  char *v16;
  uint64_t v17;
  void *v18;
  objc_class *v19;
  const char *v20;
  NSObject *v21;
  uint64_t v22;
  id v23;
  id v24;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  const char *v34;
  char *v35;
  char *v36;
  void *v37;
  objc_super v38;

  v9 = a8;
  v38.receiver = self;
  v38.super_class = (Class)AVFigAssetWriterTrack;
  v16 = -[AVFigAssetWriterTrack init](&v38, sel_init);
  v17 = objc_opt_class();
  AVRequireConcreteObject(v16, a2, v17);
  if (!a3)
  {
    v26 = v16;
    v32 = (void *)MEMORY[0x1E0C99DA0];
    v33 = *MEMORY[0x1E0C99778];
    v34 = "figAssetWriter != NULL";
    goto LABEL_12;
  }
  if (!a4)
  {
    v35 = v16;
    v32 = (void *)MEMORY[0x1E0C99DA0];
    v33 = *MEMORY[0x1E0C99778];
    v34 = "mediaType != nil";
    goto LABEL_12;
  }
  if (!a5)
  {
    v36 = v16;
    v32 = (void *)MEMORY[0x1E0C99DA0];
    v33 = *MEMORY[0x1E0C99778];
    v34 = "mediaFileType != nil";
LABEL_12:
    v37 = (void *)objc_msgSend(v32, "exceptionWithName:reason:userInfo:", v33, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v16, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v27, v28, v29, v30, v31, (uint64_t)v34), 0);
    objc_exception_throw(v37);
  }
  if (v16)
  {
    *((_QWORD *)v16 + 2) = CFRetain(a3);
    *((_QWORD *)v16 + 4) = objc_msgSend(a4, "copyWithZone:", objc_msgSend(v16, "zone"));
    *((_QWORD *)v16 + 5) = objc_msgSend(a5, "copyWithZone:", objc_msgSend(v16, "zone"));
    *((_DWORD *)v16 + 6) = objc_msgSend(v16, "_attachToFigAssetWriterUsingFormatSpecification:sourcePixelBufferAttributes:multiPass:error:", a6, a7, v9, a9);
    *((_QWORD *)v16 + 1) = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", v16);
    v18 = (void *)MEMORY[0x1E0CB3940];
    v19 = (objc_class *)objc_opt_class();
    v20 = (const char *)objc_msgSend((id)objc_msgSend(v18, "stringWithFormat:", CFSTR("<%@: %p> water level queue"), NSStringFromClass(v19), v16), "UTF8String");
    v21 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    *((_QWORD *)v16 + 6) = dispatch_queue_create(v20, v21);
    v22 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)(v16 + 60) = *MEMORY[0x1E0CA2E18];
    *(_QWORD *)(v16 + 76) = *(_QWORD *)(v22 + 16);
    v23 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    *((_QWORD *)v16 + 11) = v23;
    objc_msgSend(v23, "setName:", CFSTR("com.apple.avfoundation.assetwriterinput"));
    v24 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
    CFRetain(*((CFTypeRef *)v16 + 1));
    objc_msgSend(v24, "addListenerWithWeakReference:callback:name:object:flags:", *((_QWORD *)v16 + 1), figAssetWriterTrackDidDropBelowLowWaterLevel, *MEMORY[0x1E0CC3CE0], *((_QWORD *)v16 + 2), 0);
    if (*((_DWORD *)v16 + 6))
    {
      objc_msgSend(v16, "_refreshAboveHighWaterLevel");
    }
    else
    {

      return 0;
    }
  }
  return (AVFigAssetWriterTrack *)v16;
}

- (void)dealloc
{
  NSObject *aboveHighWaterLevelQueue;
  objc_super v4;

  if (self->_figAssetWriter)
  {
    objc_msgSend(+[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter()), "removeListenerWithWeakReference:callback:name:object:", self->_weakReference, figAssetWriterTrackDidDropBelowLowWaterLevel, *MEMORY[0x1E0CC3CE0], self->_figAssetWriter);
    CFRelease(self->_weakReference);
    CFRelease(self->_figAssetWriter);
  }
  aboveHighWaterLevelQueue = self->_aboveHighWaterLevelQueue;
  if (aboveHighWaterLevelQueue)
    dispatch_release(aboveHighWaterLevelQueue);

  v4.receiver = self;
  v4.super_class = (Class)AVFigAssetWriterTrack;
  -[AVFigAssetWriterTrack dealloc](&v4, sel_dealloc);
}

- (__CVPixelBufferPool)pixelBufferPool
{
  OpaqueFigAssetWriter *v3;
  uint64_t v4;
  void (*v5)(OpaqueFigAssetWriter *, uint64_t, _QWORD, _QWORD, __CVPixelBufferPool **);
  __CVPixelBufferPool *v6;
  __CVPixelBufferPool *v8;

  v8 = 0;
  v3 = -[AVFigAssetWriterTrack figAssetWriter](self, "figAssetWriter");
  v4 = -[AVFigAssetWriterTrack trackID](self, "trackID");
  v5 = *(void (**)(OpaqueFigAssetWriter *, uint64_t, _QWORD, _QWORD, __CVPixelBufferPool **))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 48);
  if (v5)
  {
    v5(v3, v4, *MEMORY[0x1E0CC3D40], *MEMORY[0x1E0C9AE00], &v8);
    v6 = v8;
  }
  else
  {
    v6 = 0;
  }
  CVPixelBufferPoolRelease(v6);
  return v8;
}

- (void)_figAssetWriterDidDropBelowLowWaterLevelForTrackID:(int)a3
{
  if (-[AVFigAssetWriterTrack trackID](self, "trackID") == a3)
    -[AVFigAssetWriterTrack _refreshAboveHighWaterLevel](self, "_refreshAboveHighWaterLevel");
}

- (void)_refreshAboveHighWaterLevel
{
  OpaqueFigAssetWriter *v3;
  uint64_t v4;
  uint64_t (*v5)(OpaqueFigAssetWriter *, uint64_t);
  _BOOL4 v6;
  NSObject *aboveHighWaterLevelQueue;
  _QWORD block[6];
  int v9;

  v3 = -[AVFigAssetWriterTrack figAssetWriter](self, "figAssetWriter");
  v4 = -[AVFigAssetWriterTrack trackID](self, "trackID");
  v5 = *(uint64_t (**)(OpaqueFigAssetWriter *, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 96);
  if (v5)
  {
    v6 = v5(v3, v4) == 0;
    if (((v6 ^ -[AVFigAssetWriterTrack isAboveHighWaterLevel](self, "isAboveHighWaterLevel")) & 1) != 0)
      return;
LABEL_5:
    -[AVFigAssetWriterTrack willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("aboveHighWaterLevel"));
    aboveHighWaterLevelQueue = self->_aboveHighWaterLevelQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__AVFigAssetWriterTrack__refreshAboveHighWaterLevel__block_invoke;
    block[3] = &unk_1E3032660;
    block[4] = self;
    block[5] = v3;
    v9 = v4;
    dispatch_sync(aboveHighWaterLevelQueue, block);
    -[AVFigAssetWriterTrack didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("aboveHighWaterLevel"));
    return;
  }
  if (-[AVFigAssetWriterTrack isAboveHighWaterLevel](self, "isAboveHighWaterLevel"))
    goto LABEL_5;
}

uint64_t __52__AVFigAssetWriterTrack__refreshAboveHighWaterLevel__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t (*v5)(uint64_t, uint64_t);

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(unsigned int *)(a1 + 48);
  result = CMBaseObjectGetVTable();
  v5 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(result + 16) + 96);
  if (v5)
  {
    result = v5(v2, v3);
    LOBYTE(v5) = (_DWORD)result != 0;
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) = (_BYTE)v5;
  return result;
}

- (BOOL)encoderSupportsMultiPass
{
  OpaqueFigAssetWriter *v3;
  uint64_t v4;
  uint64_t (*v5)(OpaqueFigAssetWriter *, uint64_t, _QWORD, _QWORD, CFBooleanRef *);
  int v6;
  CFBooleanRef v7;
  BOOL v8;
  CFBooleanRef BOOLean;

  BOOLean = 0;
  v3 = -[AVFigAssetWriterTrack figAssetWriter](self, "figAssetWriter");
  v4 = -[AVFigAssetWriterTrack trackID](self, "trackID");
  v5 = *(uint64_t (**)(OpaqueFigAssetWriter *, uint64_t, _QWORD, _QWORD, CFBooleanRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                                 + 48);
  if (!v5)
    return 0;
  v6 = v5(v3, v4, *MEMORY[0x1E0CC3D30], *MEMORY[0x1E0C9AE00], &BOOLean);
  v7 = BOOLean;
  if (v6)
  {
    v8 = 0;
    if (!BOOLean)
      return v8;
    goto LABEL_4;
  }
  v8 = CFBooleanGetValue(BOOLean) != 0;
  v7 = BOOLean;
  if (BOOLean)
LABEL_4:
    CFRelease(v7);
  return v8;
}

- (BOOL)isAboveHighWaterLevel
{
  NSObject *aboveHighWaterLevelQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  aboveHighWaterLevelQueue = self->_aboveHighWaterLevelQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__AVFigAssetWriterTrack_isAboveHighWaterLevel__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(aboveHighWaterLevelQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __46__AVFigAssetWriterTrack_isAboveHighWaterLevel__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 56);
  return result;
}

- (BOOL)beginPassReturningError:(id *)a3
{
  OpaqueFigAssetWriter *v5;
  uint64_t v6;
  uint64_t (*v7)(OpaqueFigAssetWriter *, uint64_t, _QWORD);
  signed int v8;

  v5 = -[AVFigAssetWriterTrack figAssetWriter](self, "figAssetWriter");
  v6 = -[AVFigAssetWriterTrack trackID](self, "trackID");
  v7 = *(uint64_t (**)(OpaqueFigAssetWriter *, uint64_t, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                         + 136);
  if (v7)
  {
    v8 = v7(v5, v6, 0);
    if (!a3)
      return v8 == 0;
  }
  else
  {
    v8 = -12782;
    if (!a3)
      return v8 == 0;
  }
  if (v8)
    *a3 = (id)AVLocalizedErrorWithUnderlyingOSStatus(v8, 0);
  return v8 == 0;
}

- (BOOL)addSampleBuffer:(opaqueCMSampleBuffer *)a3 error:(id *)a4
{
  OpaqueFigAssetWriter *v7;
  uint64_t v8;
  uint64_t (*v9)(OpaqueFigAssetWriter *, uint64_t, opaqueCMSampleBuffer *);
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  const __CFString *v14;
  id v15;

  v7 = -[AVFigAssetWriterTrack figAssetWriter](self, "figAssetWriter");
  v8 = -[AVFigAssetWriterTrack trackID](self, "trackID");
  v9 = *(uint64_t (**)(OpaqueFigAssetWriter *, uint64_t, opaqueCMSampleBuffer *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                         + 80);
  if (v9)
  {
    v10 = v9(v7, v8, a3);
    v11 = v10;
    if ((int)v10 > -12143)
    {
      if ((_DWORD)v10 == -12142)
      {
        v12 = (void *)MEMORY[0x1E0C99DA0];
        v13 = *MEMORY[0x1E0C99768];
        v14 = CFSTR("Must start a session (using -[AVAssetWriter startSessionAtSourceTime:) first");
        goto LABEL_13;
      }
      if (!(_DWORD)v10)
      {
        v15 = 0;
        goto LABEL_14;
      }
    }
    else
    {
      if ((_DWORD)v10 == -12413)
      {
        v12 = (void *)MEMORY[0x1E0C99DA0];
        v13 = *MEMORY[0x1E0C99778];
        v14 = CFSTR("Input buffer must be in an uncompressed format when outputSettings is not nil");
        goto LABEL_13;
      }
      if ((_DWORD)v10 == -12330)
      {
        v12 = (void *)MEMORY[0x1E0C99DA0];
        v13 = *MEMORY[0x1E0C99778];
        v14 = CFSTR("First input buffer must have an appropriate kCMSampleBufferAttachmentKey_TrimDurationAtStart since the codec has encoder delay");
LABEL_13:
        v15 = (id)AVErrorForClientProgrammingError(objc_msgSend(v12, "exceptionWithName:reason:userInfo:", v13, v14, 0));
        LODWORD(v11) = -12413;
        goto LABEL_14;
      }
    }
  }
  else
  {
    v11 = 4294954514;
  }
  v15 = +[AVAssetWriter _errorForOSStatus:](AVAssetWriter, "_errorForOSStatus:", v11);
LABEL_14:
  -[AVFigAssetWriterTrack _refreshAboveHighWaterLevel](self, "_refreshAboveHighWaterLevel");
  if (a4 && (_DWORD)v11)
    *a4 = v15;
  return (_DWORD)v11 == 0;
}

- (BOOL)addPixelBuffer:(__CVBuffer *)a3 atPresentationTime:(id *)a4 error:(id *)a5
{
  OpaqueFigAssetWriter *v9;
  uint64_t v10;
  uint64_t (*v11)(OpaqueFigAssetWriter *, uint64_t, __CVBuffer *, $3CC8671D27C23BF42ADDB32F2B5E48AE *);
  uint64_t v12;
  void *v13;
  uint64_t v14;
  objc_class *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v23;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v24;

  v9 = -[AVFigAssetWriterTrack figAssetWriter](self, "figAssetWriter");
  v10 = -[AVFigAssetWriterTrack trackID](self, "trackID");
  v23 = *a4;
  v11 = *(uint64_t (**)(OpaqueFigAssetWriter *, uint64_t, __CVBuffer *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 88);
  if (v11)
  {
    v24 = v23;
    v12 = v11(v9, v10, a3, &v24);
    if ((_DWORD)v12 == -12142)
    {
      v13 = (void *)MEMORY[0x1E0C99DA0];
      v14 = *MEMORY[0x1E0C99768];
      v15 = (objc_class *)objc_opt_class();
      v21 = (void *)objc_msgSend(v13, "exceptionWithName:reason:userInfo:", v14, AVMethodExceptionReasonWithClassAndSelector(v15, sel_appendPixelBuffer_withPresentationTime_, (uint64_t)CFSTR("Must start a session (using -[AVAssetWriter startSessionAtSourceTime:) before appending pixel buffers"), v16, v17, v18, v19, v20, v23.var0), 0);
      objc_exception_throw(v21);
    }
  }
  else
  {
    v12 = 4294954514;
  }
  -[AVFigAssetWriterTrack _refreshAboveHighWaterLevel](self, "_refreshAboveHighWaterLevel", v23.var0);
  if (a5)
    *a5 = +[AVAssetWriter _errorForOSStatus:](AVAssetWriter, "_errorForOSStatus:", v12);
  return (_DWORD)v12 == 0;
}

- (BOOL)addTaggedPixelBufferGroup:(OpaqueCMTaggedBufferGroup *)a3 atPresentationTime:(id *)a4 error:(id *)a5
{
  OpaqueFigAssetWriter *v9;
  uint64_t v10;
  uint64_t (*v11)(OpaqueFigAssetWriter *, uint64_t, OpaqueCMTaggedBufferGroup *, $3CC8671D27C23BF42ADDB32F2B5E48AE *);
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  objc_class *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const __CFString *v22;
  void *v24;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v25;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v26;

  v9 = -[AVFigAssetWriterTrack figAssetWriter](self, "figAssetWriter");
  v10 = -[AVFigAssetWriterTrack trackID](self, "trackID");
  v25 = *a4;
  v11 = *(uint64_t (**)(OpaqueFigAssetWriter *, uint64_t, OpaqueCMTaggedBufferGroup *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 176);
  if (v11)
  {
    v26 = v25;
    v12 = v11(v9, v10, a3, &v26);
    if ((_DWORD)v12 == -15596)
    {
      v14 = (void *)MEMORY[0x1E0C99DA0];
      v15 = *MEMORY[0x1E0C99768];
      v16 = (objc_class *)objc_opt_class();
      v22 = CFSTR("Must use IOSurface backed CVPixelBuffer for taggedPixelBufferGroup");
LABEL_10:
      v24 = (void *)objc_msgSend(v14, "exceptionWithName:reason:userInfo:", v15, AVMethodExceptionReasonWithClassAndSelector(v16, sel_appendTaggedPixelBufferGroup_withPresentationTime_, (uint64_t)v22, v17, v18, v19, v20, v21, v25.var0), 0);
      objc_exception_throw(v24);
    }
    v13 = v12;
    if ((_DWORD)v12 == -12142)
    {
      v14 = (void *)MEMORY[0x1E0C99DA0];
      v15 = *MEMORY[0x1E0C99768];
      v16 = (objc_class *)objc_opt_class();
      v22 = CFSTR("Must start a session (using -[AVAssetWriter startSessionAtSourceTime:) before appending tagged buffer groups");
      goto LABEL_10;
    }
  }
  else
  {
    v13 = 4294954514;
  }
  -[AVFigAssetWriterTrack _refreshAboveHighWaterLevel](self, "_refreshAboveHighWaterLevel", v25.var0);
  if (a5)
    *a5 = +[AVAssetWriter _errorForOSStatus:](AVAssetWriter, "_errorForOSStatus:", v13);
  return (_DWORD)v13 == 0;
}

- (void)endPassWithCompletionHandler:(id)a3
{
  AVAssetWriterInputFigAssetWriterEndPassOperation *v5;
  _QWORD v6[6];

  v5 = -[AVAssetWriterInputFigAssetWriterEndPassOperation initWithFigAssetWriter:trackID:]([AVAssetWriterInputFigAssetWriterEndPassOperation alloc], "initWithFigAssetWriter:trackID:", -[AVFigAssetWriterTrack figAssetWriter](self, "figAssetWriter"), -[AVFigAssetWriterTrack trackID](self, "trackID"));
  -[AVAssetWriterInputFigAssetWriterEndPassOperation setName:](v5, "setName:", CFSTR("com.apple.avfoundation.assetwriterinput.endpass"));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__AVFigAssetWriterTrack_endPassWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E3032448;
  v6[4] = v5;
  v6[5] = a3;
  -[AVAssetWriterInputFigAssetWriterEndPassOperation setCompletionBlock:](v5, "setCompletionBlock:", v6);
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v5);

}

uint64_t __54__AVFigAssetWriterTrack_endPassWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "status") == 2, objc_msgSend(*(id *)(a1 + 32), "descriptionForNextPass"), objc_msgSend(*(id *)(a1 + 32), "error"));
}

- (BOOL)markEndOfDataReturningError:(id *)a3
{
  OpaqueFigAssetWriter *v5;
  uint64_t v6;
  uint64_t (*v7)(OpaqueFigAssetWriter *, uint64_t);
  uint64_t v8;

  v5 = -[AVFigAssetWriterTrack figAssetWriter](self, "figAssetWriter");
  v6 = -[AVFigAssetWriterTrack trackID](self, "trackID");
  v7 = *(uint64_t (**)(OpaqueFigAssetWriter *, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 104);
  if (!v7)
  {
    v8 = 4294954514;
    if (!a3)
      return (_DWORD)v8 == 0;
    goto LABEL_3;
  }
  v8 = v7(v5, v6);
  if (a3)
LABEL_3:
    *a3 = +[AVAssetWriter _errorForOSStatus:](AVAssetWriter, "_errorForOSStatus:", v8);
  return (_DWORD)v8 == 0;
}

- (void)setFigMetadata:(id)a3
{
  OpaqueFigAssetWriter *v5;
  uint64_t v6;
  void (*v7)(OpaqueFigAssetWriter *, uint64_t, _QWORD, id);

  v5 = -[AVFigAssetWriterTrack figAssetWriter](self, "figAssetWriter");
  v6 = -[AVFigAssetWriterTrack trackID](self, "trackID");
  v7 = *(void (**)(OpaqueFigAssetWriter *, uint64_t, _QWORD, id))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                          + 40);
  if (v7)
    v7(v5, v6, *MEMORY[0x1E0CC3D38], a3);
}

- (void)setFigTrackMatrix:(id)a3
{
  OpaqueFigAssetWriter *v5;
  uint64_t v6;
  void (*v7)(OpaqueFigAssetWriter *, uint64_t, _QWORD, id);

  v5 = -[AVFigAssetWriterTrack figAssetWriter](self, "figAssetWriter");
  v6 = -[AVFigAssetWriterTrack trackID](self, "trackID");
  v7 = *(void (**)(OpaqueFigAssetWriter *, uint64_t, _QWORD, id))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                          + 64);
  if (v7)
    v7(v5, v6, *MEMORY[0x1E0CC4688], a3);
}

- (void)setMediaTimeScale:(int)a3
{
  OpaqueFigAssetWriter *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(OpaqueFigAssetWriter *, uint64_t, _QWORD, uint64_t);

  v5 = -[AVFigAssetWriterTrack figAssetWriter](self, "figAssetWriter");
  v6 = -[AVFigAssetWriterTrack trackID](self, "trackID");
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = *(void (**)(OpaqueFigAssetWriter *, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                               + 64);
  if (v8)
    v8(v5, v6, *MEMORY[0x1E0CC45F0], v7);
}

- (void)setFigDimensions:(id)a3
{
  OpaqueFigAssetWriter *v5;
  uint64_t v6;
  void (*v7)(OpaqueFigAssetWriter *, uint64_t, _QWORD, id);

  v5 = -[AVFigAssetWriterTrack figAssetWriter](self, "figAssetWriter");
  v6 = -[AVFigAssetWriterTrack trackID](self, "trackID");
  v7 = *(void (**)(OpaqueFigAssetWriter *, uint64_t, _QWORD, id))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                          + 64);
  if (v7)
    v7(v5, v6, *MEMORY[0x1E0CC4680], a3);
}

- (void)setLanguageCode:(id)a3
{
  OpaqueFigAssetWriter *v5;
  uint64_t v6;
  void (*v7)(OpaqueFigAssetWriter *, uint64_t, _QWORD, id);

  v5 = -[AVFigAssetWriterTrack figAssetWriter](self, "figAssetWriter");
  v6 = -[AVFigAssetWriterTrack trackID](self, "trackID");
  v7 = *(void (**)(OpaqueFigAssetWriter *, uint64_t, _QWORD, id))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                          + 64);
  if (v7)
    v7(v5, v6, *MEMORY[0x1E0CC45D0], a3);
}

- (void)setExtendedLanguageTag:(id)a3
{
  OpaqueFigAssetWriter *v5;
  uint64_t v6;
  void (*v7)(OpaqueFigAssetWriter *, uint64_t, _QWORD, id);

  v5 = -[AVFigAssetWriterTrack figAssetWriter](self, "figAssetWriter");
  v6 = -[AVFigAssetWriterTrack trackID](self, "trackID");
  v7 = *(void (**)(OpaqueFigAssetWriter *, uint64_t, _QWORD, id))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                          + 64);
  if (v7)
    v7(v5, v6, *MEMORY[0x1E0CC4580], a3);
}

- (void)setMarksOutputTrackAsEnabled:(BOOL)a3
{
  _BOOL4 v3;
  OpaqueFigAssetWriter *v5;
  uint64_t v6;
  void (*v7)(OpaqueFigAssetWriter *, uint64_t, _QWORD, uint64_t);
  uint64_t v8;

  v3 = a3;
  v5 = -[AVFigAssetWriterTrack figAssetWriter](self, "figAssetWriter");
  v6 = -[AVFigAssetWriterTrack trackID](self, "trackID");
  v7 = *(void (**)(OpaqueFigAssetWriter *, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                               + 64);
  if (v7)
  {
    if (v3)
      v8 = *MEMORY[0x1E0C9AE50];
    else
      v8 = *MEMORY[0x1E0C9AE40];
    v7(v5, v6, *MEMORY[0x1E0CC4560], v8);
  }
}

- (void)setTrackVolume:(float)a3
{
  CFNumberRef v4;
  CFNumberRef v5;
  OpaqueFigAssetWriter *v6;
  uint64_t v7;
  void (*v8)(OpaqueFigAssetWriter *, uint64_t, _QWORD, CFNumberRef);
  float valuePtr;

  valuePtr = a3;
  v4 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberFloat32Type, &valuePtr);
  if (v4)
  {
    v5 = v4;
    v6 = -[AVFigAssetWriterTrack figAssetWriter](self, "figAssetWriter");
    v7 = -[AVFigAssetWriterTrack trackID](self, "trackID");
    v8 = *(void (**)(OpaqueFigAssetWriter *, uint64_t, _QWORD, CFNumberRef))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                 + 16)
                                                                                     + 64);
    if (v8)
      v8(v6, v7, *MEMORY[0x1E0CC4698], v5);
    CFRelease(v5);
  }
}

- (void)setLayer:(int64_t)a3
{
  uint64_t v4;
  OpaqueFigAssetWriter *v5;
  uint64_t v6;
  void (*v7)(OpaqueFigAssetWriter *, uint64_t, _QWORD, uint64_t);

  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = -[AVFigAssetWriterTrack figAssetWriter](self, "figAssetWriter");
  v6 = -[AVFigAssetWriterTrack trackID](self, "trackID");
  v7 = *(void (**)(OpaqueFigAssetWriter *, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                               + 64);
  if (v7)
    v7(v5, v6, *MEMORY[0x1E0CC6010], v4);
}

- (void)setAlternateGroupID:(signed __int16)a3
{
  int v3;
  OpaqueFigAssetWriter *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(OpaqueFigAssetWriter *, uint64_t, _QWORD, uint64_t);

  v3 = a3;
  v5 = -[AVFigAssetWriterTrack figAssetWriter](self, "figAssetWriter");
  v6 = -[AVFigAssetWriterTrack trackID](self, "trackID");
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3);
  v8 = *(void (**)(OpaqueFigAssetWriter *, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                               + 64);
  if (v8)
    v8(v5, v6, *MEMORY[0x1E0CC4540], v7);
}

- (void)setProvisionalAlternateGroupID:(signed __int16)a3
{
  int v3;
  OpaqueFigAssetWriter *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(OpaqueFigAssetWriter *, uint64_t, _QWORD, uint64_t);

  v3 = a3;
  v5 = -[AVFigAssetWriterTrack figAssetWriter](self, "figAssetWriter");
  v6 = -[AVFigAssetWriterTrack trackID](self, "trackID");
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3);
  v8 = *(void (**)(OpaqueFigAssetWriter *, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                               + 64);
  if (v8)
    v8(v5, v6, *MEMORY[0x1E0CC4648], v7);
}

- (void)setExcludeFromAutoSelection:(BOOL)a3
{
  _BOOL4 v3;
  OpaqueFigAssetWriter *v5;
  uint64_t v6;
  void (*v7)(OpaqueFigAssetWriter *, uint64_t, _QWORD, uint64_t);
  uint64_t v8;

  v3 = a3;
  v5 = -[AVFigAssetWriterTrack figAssetWriter](self, "figAssetWriter");
  v6 = -[AVFigAssetWriterTrack trackID](self, "trackID");
  v7 = *(void (**)(OpaqueFigAssetWriter *, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                               + 64);
  if (v7)
  {
    if (v3)
      v8 = *MEMORY[0x1E0C9AE50];
    else
      v8 = *MEMORY[0x1E0C9AE40];
    v7(v5, v6, *MEMORY[0x1E0CC4570], v8);
  }
}

- (void)setPreferredChunkDuration:(id *)a3
{
  const __CFAllocator *v4;
  CFDictionaryRef v5;
  OpaqueFigAssetWriter *v6;
  uint64_t v7;
  void (*v8)(OpaqueFigAssetWriter *, uint64_t, _QWORD, CFDictionaryRef);
  CMTime v9;

  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v9 = *(CMTime *)a3;
  v5 = CMTimeCopyAsDictionary(&v9, v4);
  v6 = -[AVFigAssetWriterTrack figAssetWriter](self, "figAssetWriter");
  v7 = -[AVFigAssetWriterTrack trackID](self, "trackID");
  v8 = *(void (**)(OpaqueFigAssetWriter *, uint64_t, _QWORD, CFDictionaryRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                       + 64);
  if (v8)
    v8(v6, v7, *MEMORY[0x1E0CC4628], v5);
  if (v5)
    CFRelease(v5);
}

- (void)setPreferredChunkAlignment:(int64_t)a3
{
  OpaqueFigAssetWriter *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(OpaqueFigAssetWriter *, uint64_t, _QWORD, uint64_t);

  v5 = -[AVFigAssetWriterTrack figAssetWriter](self, "figAssetWriter");
  v6 = -[AVFigAssetWriterTrack trackID](self, "trackID");
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = *(void (**)(OpaqueFigAssetWriter *, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                               + 64);
  if (v8)
    v8(v5, v6, *MEMORY[0x1E0CC4618], v7);
}

- (void)setPreferredChunkSize:(int64_t)a3
{
  OpaqueFigAssetWriter *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(OpaqueFigAssetWriter *, uint64_t, _QWORD, uint64_t);

  v5 = -[AVFigAssetWriterTrack figAssetWriter](self, "figAssetWriter");
  v6 = -[AVFigAssetWriterTrack trackID](self, "trackID");
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = *(void (**)(OpaqueFigAssetWriter *, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                               + 64);
  if (v8)
    v8(v5, v6, *MEMORY[0x1E0CC4630], v7);
}

- (void)setMediaDataLocation:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  OpaqueFigAssetWriter *v10;
  uint64_t v11;
  void (*v12)(OpaqueFigAssetWriter *, uint64_t, _QWORD, uint64_t);
  OpaqueFigAssetWriter *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(OpaqueFigAssetWriter *, uint64_t, _QWORD, uint64_t);
  OpaqueFigAssetWriter *v17;
  uint64_t v18;
  void (*v19)(OpaqueFigAssetWriter *, uint64_t, _QWORD, uint64_t);
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0C9AE50];
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("AVAssetWriterInputMediaDataLocationBeforeMainMediaDataNotInterleaved")))
  {
    v6 = *MEMORY[0x1E0CC5C00];
    v20[0] = *MEMORY[0x1E0CC5C08];
    v20[1] = v6;
    v21[0] = &unk_1E30936B8;
    v21[1] = &unk_1E30936D0;
    v7 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
    v8 = 1;
  }
  else
  {
    v9 = objc_msgSend(a3, "isEqualToString:", CFSTR("AVAssetWriterInputMediaDataLocationSparselyInterleavedWithMainMediaData"));
    v8 = 0;
    v7 = 0;
    if (v9)
      v5 = *MEMORY[0x1E0C9AE40];
  }
  v10 = -[AVFigAssetWriterTrack figAssetWriter](self, "figAssetWriter");
  v11 = -[AVFigAssetWriterTrack trackID](self, "trackID");
  v12 = *(void (**)(OpaqueFigAssetWriter *, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                            + 16)
                                                                                + 64);
  if (v12)
    v12(v10, v11, *MEMORY[0x1E0CC4650], v7);
  v13 = -[AVFigAssetWriterTrack figAssetWriter](self, "figAssetWriter");
  v14 = -[AVFigAssetWriterTrack trackID](self, "trackID");
  v15 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8);
  v16 = *(void (**)(OpaqueFigAssetWriter *, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                            + 16)
                                                                                + 64);
  if (v16)
    v16(v13, v14, *MEMORY[0x1E0CC45E0], v15);
  v17 = -[AVFigAssetWriterTrack figAssetWriter](self, "figAssetWriter");
  v18 = -[AVFigAssetWriterTrack trackID](self, "trackID");
  v19 = *(void (**)(OpaqueFigAssetWriter *, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                            + 16)
                                                                                + 64);
  if (v19)
    v19(v17, v18, *MEMORY[0x1E0CC45B0], v5);
}

- (void)setSampleReferenceBaseURL:(id)a3
{
  OpaqueFigAssetWriter *v5;
  uint64_t v6;
  void (*v7)(OpaqueFigAssetWriter *, uint64_t, _QWORD, id);

  v5 = -[AVFigAssetWriterTrack figAssetWriter](self, "figAssetWriter");
  v6 = -[AVFigAssetWriterTrack trackID](self, "trackID");
  v7 = *(void (**)(OpaqueFigAssetWriter *, uint64_t, _QWORD, id))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                          + 64);
  if (v7)
    v7(v5, v6, *MEMORY[0x1E0CC4668], a3);
}

- (void)setFormatDescriptions:(id)a3
{
  OpaqueFigAssetWriter *v5;
  uint64_t v6;
  void (*v7)(OpaqueFigAssetWriter *, uint64_t, _QWORD, id);

  v5 = -[AVFigAssetWriterTrack figAssetWriter](self, "figAssetWriter");
  v6 = -[AVFigAssetWriterTrack trackID](self, "trackID");
  v7 = *(void (**)(OpaqueFigAssetWriter *, uint64_t, _QWORD, id))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                          + 64);
  if (v7)
    v7(v5, v6, *MEMORY[0x1E0CC4590], a3);
}

- (int)_attachToFigAssetWriterUsingFormatSpecification:(id)a3 sourcePixelBufferAttributes:(id)a4 multiPass:(BOOL)a5 error:(id *)a6
{
  OpaqueFigAssetWriter *v8;
  uint64_t v9;
  uint64_t (*v10)(OpaqueFigAssetWriter *, uint64_t, int *);
  int v11;
  int v13;

  v13 = 0;
  v8 = -[AVFigAssetWriterTrack figAssetWriter](self, "figAssetWriter", a3, a4, a5);
  v9 = CMMediaTypeFromAVMediaType(-[AVFigAssetWriterTrack mediaType](self, "mediaType"));
  v10 = *(uint64_t (**)(OpaqueFigAssetWriter *, uint64_t, int *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                         + 8);
  if (v10)
  {
    v11 = v10(v8, v9, &v13);
    if (!a6)
      return v13;
  }
  else
  {
    v11 = -12782;
    if (!a6)
      return v13;
  }
  if (v11)
    *a6 = +[AVAssetWriter _errorForOSStatus:](AVAssetWriter, "_errorForOSStatus:");
  return v13;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)sampleBufferCoalescingInterval
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[2].var2;
  retstr->var3 = *(int64_t *)((char *)&self[3].var0 + 4);
  return self;
}

- (void)setSampleBufferCoalescingInterval:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  *(_QWORD *)&self->_sampleBufferCoalescingInterval.flags = a3->var3;
  *(_OWORD *)(&self->_aboveHighWaterLevel + 4) = v3;
}

- (OpaqueFigAssetWriter)figAssetWriter
{
  return self->_figAssetWriter;
}

- (int)trackID
{
  return self->_trackID;
}

- (NSString)mediaType
{
  return self->_mediaType;
}

- (AVMediaFileType)mediaFileType
{
  return self->_mediaFileType;
}

@end
