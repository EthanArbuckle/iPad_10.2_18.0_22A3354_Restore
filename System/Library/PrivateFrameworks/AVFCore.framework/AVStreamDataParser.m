@implementation AVStreamDataParser

- (void)_configureInternal
{
  AVStreamDataParserInternal *v3;
  NSObject *v4;

  v3 = objc_alloc_init(AVStreamDataParserInternal);
  self->_parser = v3;
  CFRetain(v3);
  v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  self->_parser->_threadSafetyQ = (OS_dispatch_queue *)dispatch_queue_create("com.apple.AVStreamDataParser._threadSafetyQ", v4);
  self->_parser->_status = 0;
  self->_parser->_typeIdOfInitialFigManifold = 0;
  self->_parser->_samplesBeforeReadyTotalDuration = *($95D729B680665BEAEFA1D6FCA8238556 *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  self->_parser->_startedUsingInternalContentKeySession = 0;
  self->_parser->_accumulatedInitializationData = 0;
  self->_parser->_preferSandboxedParsing = 0;
}

- (AVStreamDataParser)init
{
  AVStreamDataParser *v2;
  AVStreamDataParser *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVStreamDataParser;
  v2 = -[AVStreamDataParser init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[AVStreamDataParser _configureInternal](v2, "_configureInternal");
  return v3;
}

- (void)_willDeallocOrFinalize
{
  AVStreamDataParserInternal *parser;
  AVStreamDataParserInternal *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t FigBaseObject;
  uint64_t v11;
  void (*v12)(uint64_t);
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  parser = self->_parser;
  if (parser)
  {
    parser->_delegate = 0;
    v4 = self->_parser;
    if (v4->_threadSafetyQ)
    {
      dispatch_release((dispatch_object_t)v4->_threadSafetyQ);
      v4 = self->_parser;
    }
    if (v4->_figManifold)
    {
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v5 = -[AVAsset tracks](v4->_asset, "tracks", 0);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v14;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v14 != v8)
              objc_enumerationMutation(v5);
            -[AVStreamDataParser _unregisterForFigManifoldCallbacksForTrackID:](self, "_unregisterForFigManifoldCallbacksForTrackID:", objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9++), "trackID"));
          }
          while (v7 != v9);
          v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        }
        while (v7);
      }
      FigBaseObject = FigManifoldGetFigBaseObject();
      if (FigBaseObject)
      {
        v11 = FigBaseObject;
        v12 = *(void (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 24);
        if (v12)
          v12(v11);
      }
      CFRelease(self->_parser->_figManifold);
      v4 = self->_parser;
    }
    CFRelease(v4);
  }
}

- (void)dealloc
{
  AVStreamDataParserInternal *parser;
  AVStreamDataParserInternal *v4;
  OpaqueCMBlockBuffer *accumulatedInitializationData;
  objc_super v6;

  -[AVStreamDataParser _willDeallocOrFinalize](self, "_willDeallocOrFinalize");
  parser = self->_parser;
  if (parser)
  {

    v4 = self->_parser;
    accumulatedInitializationData = v4->_accumulatedInitializationData;
    if (accumulatedInitializationData)
    {
      CFRelease(accumulatedInitializationData);
      v4 = self->_parser;
    }

  }
  v6.receiver = self;
  v6.super_class = (Class)AVStreamDataParser;
  -[AVStreamDataParser dealloc](&v6, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  self->_parser->_delegate = (AVStreamDataParserOutputHandling *)a3;
}

- (AVStreamDataParserOutputHandling)delegate
{
  return self->_parser->_delegate;
}

- (int64_t)status
{
  NSObject *threadSafetyQ;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  threadSafetyQ = self->_parser->_threadSafetyQ;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __28__AVStreamDataParser_status__block_invoke;
  v5[3] = &unk_1E302FDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(threadSafetyQ, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __28__AVStreamDataParser_status__block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = v1 - (v1 > 2);
  return result;
}

- (int64_t)status2
{
  NSObject *threadSafetyQ;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  threadSafetyQ = self->_parser->_threadSafetyQ;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__AVStreamDataParser_status2__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(threadSafetyQ, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __29__AVStreamDataParser_status2__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32)
                                                                                          + 8)
                                                                              + 24);
  return result;
}

- (void)setStatus:(int64_t)a3
{
  NSObject *threadSafetyQ;
  _QWORD v4[6];

  threadSafetyQ = self->_parser->_threadSafetyQ;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __32__AVStreamDataParser_setStatus___block_invoke;
  v4[3] = &unk_1E302FE78;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(threadSafetyQ, v4);
}

uint64_t __32__AVStreamDataParser_setStatus___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(result + 40);
  v2 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  v3 = *(_QWORD *)(v2 + 24);
  if (v3 < 4 || v1 >= v3)
    *(_QWORD *)(v2 + 24) = v1;
  return result;
}

- (void)appendStreamData:(id)a3
{
  -[AVStreamDataParser appendStreamData:withFlags:](self, "appendStreamData:withFlags:", a3, 0);
}

- (NSError)error
{
  return self->_parser->_error;
}

- (void)_setError:(id)a3
{
  -[AVStreamDataParser setStatus:](self, "setStatus:", 4);
  if (!self->_parser->_error)
  {
    self->_parser->_error = (NSError *)objc_msgSend(a3, "copy");
    if (self->_parser->_delegate)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[AVStreamDataParserOutputHandling streamDataParser:didFailToParseStreamDataWithError:](self->_parser->_delegate, "streamDataParser:didFailToParseStreamDataWithError:", self, self->_parser->_error);
    }
  }
}

+ (NSArray)audiovisualMIMETypes
{
  if (audiovisualMIMETypes_onceToken != -1)
    dispatch_once(&audiovisualMIMETypes_onceToken, &__block_literal_global_44);
  return (NSArray *)audiovisualMIMETypes_mimes;
}

void __42__AVStreamDataParser_audiovisualMIMETypes__block_invoke()
{
  uint64_t v0;
  const void *v1;
  uint64_t v2;
  const void *v3;
  uint64_t v4;
  const void *v5;

  audiovisualMIMETypes_mimes = (uint64_t)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v0 = FigCopyWebVTTMIMETypes();
  if (v0)
  {
    v1 = (const void *)v0;
    objc_msgSend((id)audiovisualMIMETypes_mimes, "addObjectsFromArray:", v0);
    CFRelease(v1);
  }
  v2 = FigCopyQTMovieMIMETypes();
  if (v2)
  {
    v3 = (const void *)v2;
    objc_msgSend((id)audiovisualMIMETypes_mimes, "addObjectsFromArray:", v2);
    CFRelease(v3);
  }
  v4 = FigCopyMPEGTransportStreamMIMETypes();
  if (v4)
  {
    v5 = (const void *)v4;
    objc_msgSend((id)audiovisualMIMETypes_mimes, "addObjectsFromArray:", v4);
    CFRelease(v5);
  }
  FigCopySetOfAudioSupportedMIMETypes();
}

+ (BOOL)canParseExtendedMIMEType:(id)a3
{
  +[AVStreamDataParser audiovisualMIMETypes](AVStreamDataParser, "audiovisualMIMETypes");
  +[AVURLAsset _avfValidationPlist](AVURLAsset, "_avfValidationPlist");
  return FigMediaValidatorValidateRFC4281ExtendedMIMETypeForStreaming() == 0;
}

- (void)setAllowableMIMETypes:(id)a3
{
  AVStreamDataParserInternal *parser;
  NSArray *allowableMIMETypes;

  parser = self->_parser;
  if (parser->_figManifold)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("must only set allowableMIMETypes before any stream data is appended"), 0));
  allowableMIMETypes = parser->_allowableMIMETypes;
  self->_parser->_allowableMIMETypes = (NSArray *)objc_msgSend(a3, "copyWithZone:", 0);

}

- (NSArray)allowableMIMETypes
{
  return (NSArray *)(id)-[NSArray copyWithZone:](self->_parser->_allowableMIMETypes, "copyWithZone:", 0);
}

- (void)_appendStreamData:(OpaqueCMBlockBuffer *)a3 withFlags:(unint64_t)a4
{
  OpaqueCMBlockBuffer *v7;
  AVStreamDataParserInternal *parser;
  OpaqueFigManifold *figManifold;
  uint64_t (*v10)(OpaqueFigManifold *, _QWORD, unint64_t, OpaqueCMBlockBuffer *);
  int v11;
  OpaqueFigManifold *v12;
  unsigned int (*v13)(OpaqueFigManifold *, _QWORD, _QWORD, CFTypeRef *);
  uint64_t FigBaseObject;
  uint64_t v15;
  void (*v16)(uint64_t);
  AVStreamDataParserInternal *v17;
  OpaqueFigManifold *v18;
  AVStreamDataParserInternal *v19;
  OpaqueCMBlockBuffer *accumulatedInitializationData;
  AVStreamDataParserInternal *v21;
  uint64_t v22;
  uint64_t v23;
  CMBlockBufferRef *p_accumulatedInitializationData;
  OpaqueCMBlockBuffer *v25;
  OpaqueCMBlockBuffer *v26;
  size_t DataLength;
  signed int v28;
  size_t v30;
  unint64_t typeIdOfInitialFigManifold;
  CFTypeID v32;
  OpaqueFigManifold *v33;
  unsigned int (*v34)(OpaqueFigManifold *, _QWORD, _QWORD, CFNumberRef *);
  uint64_t v35;
  uint64_t v36;
  OpaqueCMBlockBuffer *v37;
  CFTypeRef cf;
  CFNumberRef number;
  CFTypeRef v40;

  number = 0;
  v40 = 0;
  if (!a3)
    return;
  if (-[AVStreamDataParser status2](self, "status2") < 4)
  {
    parser = self->_parser;
    if (parser->_figManifold)
    {
      v7 = (OpaqueCMBlockBuffer *)CFRetain(a3);
      if (!v7)
        goto LABEL_52;
LABEL_7:
      figManifold = self->_parser->_figManifold;
      if (!figManifold)
        goto LABEL_52;
      v10 = *(uint64_t (**)(OpaqueFigManifold *, _QWORD, unint64_t, OpaqueCMBlockBuffer *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
      if (v10)
      {
        v11 = v10(figManifold, 0, a4 & 1, v7);
        if (v11 == -16046)
        {
          cf = 0;
          v12 = self->_parser->_figManifold;
          v13 = *(unsigned int (**)(OpaqueFigManifold *, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                                + 48);
          if (v13 && !v13(v12, *MEMORY[0x1E0CC4710], *MEMORY[0x1E0C9AE00], &cf))
          {
            -[AVStreamDataParser providePendingMediaData](self, "providePendingMediaData");
            FigBaseObject = FigManifoldGetFigBaseObject();
            if (FigBaseObject)
            {
              v15 = FigBaseObject;
              v16 = *(void (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 24);
              if (v16)
                v16(v15);
            }
            v17 = self->_parser;
            v18 = v17->_figManifold;
            if (v18)
            {
              CFRelease(v18);
              self->_parser->_figManifold = 0;
              v17 = self->_parser;
            }

            self->_parser->_asset = 0;
            v19 = self->_parser;
            accumulatedInitializationData = v19->_accumulatedInitializationData;
            if (accumulatedInitializationData)
            {
              CFRelease(accumulatedInitializationData);
              self->_parser->_accumulatedInitializationData = 0;
              v19 = self->_parser;
            }

            self->_parser->_samplesBeforeReady = 0;
            self->_parser->_samplesBeforeReadyTotalSize = 0;
            v21 = self->_parser;
            v22 = MEMORY[0x1E0CA2E68];
            *(_OWORD *)&v21->_samplesBeforeReadyTotalDuration.value = *MEMORY[0x1E0CA2E68];
            v21->_samplesBeforeReadyTotalDuration.epoch = *(_QWORD *)(v22 + 16);
            self->_parser->_encounteredStreamDiscontinuity = 1;
            v23 = (uint64_t)cf;
            if (cf)
            {
              -[AVStreamDataParser _appendStreamData:withFlags:](self, "_appendStreamData:withFlags:", cf, a4);
              CFRelease(cf);
              v23 = 0;
            }
            goto LABEL_50;
          }
        }
        else if (!v11)
        {
          v33 = self->_parser->_figManifold;
          v34 = *(unsigned int (**)(OpaqueFigManifold *, _QWORD, _QWORD, CFNumberRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                                  + 48);
          if (v34)
          {
            if (!v34(v33, *MEMORY[0x1E0CC4708], *MEMORY[0x1E0C9AE00], &number))
            {
              LODWORD(cf) = 0;
              CFNumberGetValue(number, kCFNumberSInt32Type, &cf);
              if ((_DWORD)cf)
              {
                if ((_DWORD)cf == 2)
                {
                  v35 = 3;
                }
                else
                {
                  if ((_DWORD)cf != 1)
                    goto LABEL_52;
                  if (self->_parser->_asset)
                    v35 = 2;
                  else
                    v35 = 1;
                }
              }
              else
              {
                v35 = 2;
              }
              -[AVStreamDataParser setStatus:](self, "setStatus:", v35);
              goto LABEL_52;
            }
          }
        }
      }
      goto LABEL_48;
    }
    v26 = parser->_accumulatedInitializationData;
    p_accumulatedInitializationData = &parser->_accumulatedInitializationData;
    v25 = v26;
    if (!v26)
    {
      CMBlockBufferCreateEmpty((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, p_accumulatedInitializationData);
      v25 = self->_parser->_accumulatedInitializationData;
      if (!v25)
        goto LABEL_4;
    }
    DataLength = CMBlockBufferGetDataLength(a3);
    CMBlockBufferAppendBufferReference(v25, a3, 0, DataLength, 0);
    v7 = (OpaqueCMBlockBuffer *)CFRetain(self->_parser->_accumulatedInitializationData);
    if (!v7)
      goto LABEL_52;
    v28 = -[AVStreamDataParser _createFigManifoldWithBlockBuffer:manifold:](self, "_createFigManifoldWithBlockBuffer:manifold:", v7, &v40);
    if (v28 == -16048 || v28 == -16044)
    {
      if (v28 == -16048)
        v30 = 0x200000;
      else
        v30 = 0x20000;
      if (CMBlockBufferGetDataLength(v7) <= v30)
        goto LABEL_7;
    }
    else
    {
      if (v28)
      {
        v36 = AVLocalizedErrorWithUnderlyingOSStatus(v28, 0);
        goto LABEL_49;
      }
      if (!v40)
        goto LABEL_52;
      typeIdOfInitialFigManifold = self->_parser->_typeIdOfInitialFigManifold;
      v32 = CFGetTypeID(v40);
      if (!typeIdOfInitialFigManifold)
      {
        self->_parser->_typeIdOfInitialFigManifold = v32;
        goto LABEL_61;
      }
      if (typeIdOfInitialFigManifold == v32)
      {
LABEL_61:
        self->_parser->_figManifold = (OpaqueFigManifold *)CFRetain(v40);
        v37 = self->_parser->_accumulatedInitializationData;
        if (v37)
        {
          CFRelease(v37);
          self->_parser->_accumulatedInitializationData = 0;
        }
        goto LABEL_7;
      }
    }
LABEL_48:
    v36 = AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11853, 0);
LABEL_49:
    v23 = v36;
LABEL_50:
    if (v23)
      -[AVStreamDataParser _setError:](self, "_setError:");
    goto LABEL_52;
  }
  NSLog(CFSTR("Ignoring appendStreamData:withFlags: because we're failed or expired, create a new AVStreamDataParser to try again"));
LABEL_4:
  v7 = 0;
LABEL_52:
  if (number)
    CFRelease(number);
  if (v7)
    CFRelease(v7);
  if (v40)
    CFRelease(v40);
}

- (void)appendStreamData:(id)a3 withFlags:(unint64_t)a4
{
  unint64_t v7;
  OpaqueCMBlockBuffer *v8;
  OpaqueCMBlockBuffer *v9;
  size_t v10;
  const __CFAllocator *v11;
  size_t v12;
  BOOL v13;
  CMBlockBufferRef blockBufferOut;

  v7 = objc_msgSend(a3, "length");
  v8 = +[AVStreamDataParser _createBlockBufferUsingNSData:withOffset:withLength:](AVStreamDataParser, "_createBlockBufferUsingNSData:withOffset:withLength:", a3, 0, v7);
  if (v8)
  {
    v9 = v8;
    if (v7 <= 0x20000)
    {
      -[AVStreamDataParser _appendStreamData:withFlags:](self, "_appendStreamData:withFlags:", v8, a4);
    }
    else
    {
      v10 = 0;
      v11 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      do
      {
        blockBufferOut = 0;
        if (v7 >= 0x20000)
          v12 = 0x20000;
        else
          v12 = v7;
        if (CMBlockBufferCreateWithBufferReference(v11, v9, v10, v12, 0, &blockBufferOut))
          v13 = 1;
        else
          v13 = blockBufferOut == 0;
        if (v13)
          break;
        -[AVStreamDataParser _appendStreamData:withFlags:](self, "_appendStreamData:withFlags:");
        v10 += v12;
        v7 -= v12;
        CFRelease(blockBufferOut);
      }
      while (v7);
    }
    CFRelease(v9);
  }
}

- (void)providePendingMediaData
{
  OpaqueFigManifold *figManifold;
  unsigned int (*v4)(OpaqueFigManifold *);

  if (-[AVStreamDataParser status2](self, "status2") < 4)
  {
    figManifold = self->_parser->_figManifold;
    if (figManifold)
    {
      v4 = *(unsigned int (**)(OpaqueFigManifold *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
      if (!v4 || v4(figManifold))
        -[AVStreamDataParser _setError:](self, "_setError:", AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11853, 0));
    }
  }
  else
  {
    NSLog(CFSTR("Ignoring providePendingMediaData because we're failed or expired, create a new AVStreamDataParser to try again"));
  }
}

- (AVAsset)asset
{
  return self->_parser->_asset;
}

- (void)setShouldProvideMediaData:(BOOL)a3 forTrackID:(int)a4
{
  uint64_t v4;
  _BOOL4 v5;
  NSMutableArray *trackIDsNotProvidingMedia;
  void *v8;
  uint64_t v9;
  const __CFString *v10;
  _QWORD v11[2];

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  v11[1] = *MEMORY[0x1E0C80C00];
  if (!-[AVAsset trackWithTrackID:](self->_parser->_asset, "trackWithTrackID:", *(_QWORD *)&a4))
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99778];
    v10 = CFSTR("AVErrorPersistentTrackIDKey");
    v11[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
    objc_exception_throw((id)objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, CFSTR("trackID must be valid"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1)));
  }
  trackIDsNotProvidingMedia = self->_parser->_trackIDsNotProvidingMedia;
  if (v5)
  {
    -[NSMutableArray removeObject:](trackIDsNotProvidingMedia, "removeObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (int)v4));
  }
  else
  {
    if (!trackIDsNotProvidingMedia)
    {
      self->_parser->_trackIDsNotProvidingMedia = (NSMutableArray *)(id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      trackIDsNotProvidingMedia = self->_parser->_trackIDsNotProvidingMedia;
    }
    -[NSMutableArray addObject:](trackIDsNotProvidingMedia, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (int)v4));
  }
}

- (BOOL)shouldProvideMediaDataForTrackID:(int)a3
{
  return -[NSMutableArray containsObject:](self->_parser->_trackIDsNotProvidingMedia, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3)) ^ 1;
}

- (void)_createAssetIfNecessary
{
  AVStreamDataParserInternal *parser;
  OpaqueFigManifold *figManifold;
  uint64_t (*v5)(OpaqueFigManifold *, _QWORD, _QWORD, CFTypeRef *);
  int v6;
  AVStreamDataParserInternal *v8;
  AVStreamDataParserInternal *v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  NSMutableArray *obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  CFTypeRef cf;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  parser = self->_parser;
  if (!parser->_asset)
  {
    cf = 0;
    figManifold = parser->_figManifold;
    v5 = *(uint64_t (**)(OpaqueFigManifold *, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                + 8)
                                                                                    + 48);
    if (v5)
    {
      v6 = v5(figManifold, *MEMORY[0x1E0CC4700], *MEMORY[0x1E0C9AE00], &cf);
      if (!v6 || v6 == -12784)
      {
        if (cf)
        {
          self->_parser->_asset = (AVAsset *)+[AVAsset inspectionOnlyAssetWithFigAsset:](AVAsset, "inspectionOnlyAssetWithFigAsset:");
          CFRelease(cf);
        }
        else
        {
          self->_parser->_asset = (AVAsset *)+[AVAsset inspectionOnlyAssetWithStreamDataParser:tracks:](AVAsset, "inspectionOnlyAssetWithStreamDataParser:tracks:", self, self->_parser->_tracksBecomingReadyByTrackID);
        }
        v8 = self->_parser;
        if (v8->_asset)
        {

          self->_parser->_tracksBecomingReadyByTrackID = 0;
          v9 = self->_parser;
          if (v9->_delegate)
          {
            v10 = objc_opt_respondsToSelector();
            v9 = self->_parser;
            if ((v10 & 1) != 0)
            {
              -[AVStreamDataParserOutputHandling streamDataParser:didParseStreamDataAsAsset:withDiscontinuity:](v9->_delegate, "streamDataParser:didParseStreamDataAsAsset:withDiscontinuity:", self, v9->_asset, v9->_encounteredStreamDiscontinuity);
              v9 = self->_parser;
            }
          }
          v9->_encounteredStreamDiscontinuity = 0;
          v16 = 0u;
          v17 = 0u;
          v18 = 0u;
          v19 = 0u;
          obj = self->_parser->_samplesBeforeReady;
          v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v17;
            do
            {
              for (i = 0; i != v12; ++i)
              {
                if (*(_QWORD *)v17 != v13)
                  objc_enumerationMutation(obj);
                -[AVStreamDataParser _figManifold:pushedSampleBuffer:trackID:flags:](self, "_figManifold:pushedSampleBuffer:trackID:flags:", objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "objectForKey:", CFSTR("figManifold")), objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "objectForKey:", CFSTR("sbuf")), objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "objectForKey:", CFSTR("trackID")), "intValue"), objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "objectForKey:", CFSTR("flags")), "unsignedIntValue"));
              }
              v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
            }
            while (v12);
          }

          self->_parser->_samplesBeforeReady = 0;
        }
      }
    }
  }
}

+ (id)outputMIMECodecParameterForInputMIMECodecParameter:(id)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("avc3"), CFSTR("avc1")), "stringByReplacingOccurrencesOfString:withString:", CFSTR("hev1"), CFSTR("hvc1")), "stringByReplacingOccurrencesOfString:withString:", CFSTR("dvhe"), CFSTR("dvh1"));
}

+ (OpaqueCMBlockBuffer)_createBlockBufferUsingNSData:(id)a3 withOffset:(unint64_t)a4 withLength:(unint64_t)a5
{
  FigCreateBlockBufferWithCFDataNoCopy();
  return 0;
}

+ (id)_createNSDataWithBlockBuffer:(OpaqueCMBlockBuffer *)a3
{
  uint64_t v3;
  void *v4;
  size_t v6;
  char *dataPointerOut;
  CMBlockBufferRef blockBufferOut;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  blockBufferOut = 0;
  if (CMBlockBufferCreateContiguous((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a3, (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0, 0, &blockBufferOut)|| (v6 = 0, dataPointerOut = 0, CMBlockBufferGetDataPointer(blockBufferOut, 0, 0, &v6, &dataPointerOut))|| (v3 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", dataPointerOut, v6, 0)) == 0)
  {
    v4 = 0;
  }
  else
  {
    v9[0] = CFSTR("data");
    v9[1] = CFSTR("contiguousBlock");
    v10[0] = v3;
    v10[1] = blockBufferOut;
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  }
  if (blockBufferOut)
    CFRelease(blockBufferOut);
  return v4;
}

- (int)_figManifold:(OpaqueFigManifold *)a3 pushedSampleBuffer:(opaqueCMSampleBuffer *)a4 trackID:(int)a5 flags:(unsigned int)a6
{
  uint64_t v6;
  uint64_t v7;
  const opaqueCMFormatDescription *FormatDescription;
  CMMediaType MediaType;
  uint64_t v13;
  const opaqueCMFormatDescription *v14;
  FourCharCode MediaSubType;
  AVStreamDataParserInternal *parser;
  AVStreamDataParserOutputHandling *delegate;
  NSMutableDictionary *trackDecryptorsByTrackID;
  NSMutableArray *samplesBeforeReady;
  AVStreamDataParserInternal *v20;
  AVStreamDataParserInternal *v21;
  unint64_t samplesBeforeReadyTotalSize;
  Float64 Seconds;
  CMFormatDescriptionRef v24;
  CMFormatDescriptionRef v25;
  AVAsset *v26;
  Float64 v28;
  CMTime rhs;
  CMTime lhs;
  CMTime time1;
  CMTime v32;
  _QWORD v33[4];
  _QWORD v34[5];

  v6 = *(_QWORD *)&a6;
  v7 = *(_QWORD *)&a5;
  v34[4] = *MEMORY[0x1E0C80C00];
  FormatDescription = CMSampleBufferGetFormatDescription(a4);
  MediaType = CMFormatDescriptionGetMediaType(FormatDescription);
  v13 = AVStringForOSType(MediaType);
  v14 = CMSampleBufferGetFormatDescription(a4);
  MediaSubType = CMFormatDescriptionGetMediaSubType(v14);
  AVStringForOSType(MediaSubType);
  parser = self->_parser;
  if (parser->_asset)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && !-[NSArray count](-[AVAssetTrack formatDescriptions](-[AVAsset trackWithTrackID:](self->_parser->_asset, "trackWithTrackID:", v7), "formatDescriptions"), "count"))
    {
      v24 = CMSampleBufferGetFormatDescription(a4);
      if (v24)
      {
        v25 = v24;
        v26 = self->_parser->_asset;
        self->_parser->_asset = (AVAsset *)-[AVAsset copyAssetWithReplacementFormatDescription:forTrackID:](self->_parser->_asset, "copyAssetWithReplacementFormatDescription:forTrackID:", v25, v7);
        if (self->_parser->_delegate)
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            -[AVStreamDataParserOutputHandling streamDataParser:didParseStreamDataAsAsset:withDiscontinuity:](self->_parser->_delegate, "streamDataParser:didParseStreamDataAsAsset:withDiscontinuity:", self, self->_parser->_asset, 0);
        }
      }
    }
    LODWORD(delegate) = -[AVStreamDataParser shouldProvideMediaDataForTrackID:](self, "shouldProvideMediaDataForTrackID:", v7);
    if ((_DWORD)delegate)
    {
      delegate = self->_parser->_delegate;
      if (delegate)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          trackDecryptorsByTrackID = self->_parser->_trackDecryptorsByTrackID;
          if (trackDecryptorsByTrackID
            && -[NSMutableDictionary objectForKey:](trackDecryptorsByTrackID, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7)))
          {
            FigSampleBufferSetDecryptor();
          }
          -[AVStreamDataParserOutputHandling streamDataParser:didProvideMediaData:forTrackID:mediaType:flags:](self->_parser->_delegate, "streamDataParser:didProvideMediaData:forTrackID:mediaType:flags:", self, a4, v7, v13, 0);
        }
        goto LABEL_20;
      }
    }
  }
  else
  {
    samplesBeforeReady = parser->_samplesBeforeReady;
    if (!samplesBeforeReady)
    {
      self->_parser->_samplesBeforeReady = (NSMutableArray *)(id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      samplesBeforeReady = self->_parser->_samplesBeforeReady;
    }
    v33[0] = CFSTR("figManifold");
    v33[1] = CFSTR("sbuf");
    v34[0] = a3;
    v34[1] = a4;
    v33[2] = CFSTR("trackID");
    v34[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
    v33[3] = CFSTR("flags");
    v34[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
    -[NSMutableArray addObject:](samplesBeforeReady, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 4));
    self->_parser->_samplesBeforeReadyTotalSize += CMSampleBufferGetTotalSampleSize(a4);
    memset(&v32, 0, sizeof(v32));
    CMSampleBufferGetOutputDuration(&v32, a4);
    if ((v32.flags & 0x1D) == 1)
    {
      v20 = self->_parser;
      lhs = (CMTime)v20->_samplesBeforeReadyTotalDuration;
      rhs = v32;
      CMTimeAdd(&time1, &lhs, &rhs);
      v20->_samplesBeforeReadyTotalDuration = ($95D729B680665BEAEFA1D6FCA8238556)time1;
    }
    v21 = self->_parser;
    samplesBeforeReadyTotalSize = v21->_samplesBeforeReadyTotalSize;
    if (samplesBeforeReadyTotalSize <= 0xA00000)
    {
      time1 = (CMTime)v21->_samplesBeforeReadyTotalDuration;
      *(_OWORD *)&lhs.value = kAVStreamDataParserMaxCachedOutputDuration;
      lhs.epoch = 0;
      if (CMTimeCompare(&time1, &lhs) < 1)
      {
LABEL_20:
        LODWORD(delegate) = 0;
        return (int)delegate;
      }
      time1 = (CMTime)self->_parser->_samplesBeforeReadyTotalDuration;
      Seconds = CMTimeGetSeconds(&time1);
      *(_OWORD *)&time1.value = kAVStreamDataParserMaxCachedOutputDuration;
      time1.epoch = 0;
      v28 = CMTimeGetSeconds(&time1);
      NSLog(CFSTR("Aborting parsing due to unsupported interleaving, cache duration %.3f seconds exceeding %.3f"), *(_QWORD *)&Seconds, *(_QWORD *)&v28);
    }
    else
    {
      NSLog(CFSTR("Aborting parsing due to unsupported interleaving, cache size %d bytes exceeding %d"), samplesBeforeReadyTotalSize, 10485760);
    }
    LODWORD(delegate) = -16047;
  }
  return (int)delegate;
}

- (int)_figManifold:(OpaqueFigManifold *)a3 trackDidEnd:(int)a4
{
  uint64_t v4;
  AVAssetTrack *v6;
  AVAssetTrack *v7;
  char isKindOfClass;
  AVStreamDataParserInternal *parser;
  AVAsset *v10;
  char v11;

  v4 = *(_QWORD *)&a4;
  v6 = -[AVAsset trackWithTrackID:](self->_parser->_asset, "trackWithTrackID:", *(_QWORD *)&a4);
  if (v6)
  {
    v7 = v6;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    parser = self->_parser;
    if ((isKindOfClass & 1) != 0)
    {
      v10 = parser->_asset;
      self->_parser->_asset = (AVAsset *)-[AVAsset copyAssetRemovingTrackID:](self->_parser->_asset, "copyAssetRemovingTrackID:", v4);
      parser = self->_parser;
      if (parser->_delegate)
      {
        v11 = objc_opt_respondsToSelector();
        parser = self->_parser;
        if ((v11 & 1) != 0)
        {
          -[AVStreamDataParserOutputHandling streamDataParser:didParseStreamDataAsAsset:withDiscontinuity:](parser->_delegate, "streamDataParser:didParseStreamDataAsAsset:withDiscontinuity:", self, parser->_asset, 0);
          parser = self->_parser;
        }
      }
    }
    if (parser->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
      -[AVStreamDataParserOutputHandling streamDataParser:didReachEndOfTrackWithTrackID:mediaType:](self->_parser->_delegate, "streamDataParser:didReachEndOfTrackWithTrackID:mediaType:", self, v4, -[AVAssetTrack mediaType](v7, "mediaType"));
  }
  return 0;
}

- (int)_figManifold:(OpaqueFigManifold *)a3 formatDescription:(opaqueCMFormatDescription *)a4 orDecryptorDidChange:(void *)a5 forTrackID:(int)a6
{
  AVStreamDataParserInternal *parser;
  NSMutableDictionary *trackFormatDescriptionsByTrackID;
  CFPropertyListRef Extension;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  CMMediaType MediaType;
  signed int MediaSubType;
  uint64_t v25;
  unsigned __int16 v26;
  int v27;
  void *v28;
  void *v29;
  const void *v30;
  AVStreamDataParserInternal *v31;
  AVAsset *v32;
  id v33;
  id v34;
  id v36;
  uint64_t v37;
  void *v38;
  id v39;
  AVStreamDataParserInternal *v40;
  NSMutableDictionary *trackDecryptorsByTrackID;
  const __CFString *v43;
  void *v44;
  id v45[16];
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  if (a4 && FigCPEIsSupportedFormatDescription())
  {
    self->_parser->_currentTrackID = a6;
    parser = self->_parser;
    trackFormatDescriptionsByTrackID = parser->_trackFormatDescriptionsByTrackID;
    if (!trackFormatDescriptionsByTrackID)
    {
      self->_parser->_trackFormatDescriptionsByTrackID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      parser = self->_parser;
      trackFormatDescriptionsByTrackID = parser->_trackFormatDescriptionsByTrackID;
    }
    -[NSMutableDictionary setObject:forKey:](trackFormatDescriptionsByTrackID, "setObject:forKey:", a4, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", parser->_currentTrackID));
    Extension = CMFormatDescriptionGetExtension(a4, (CFStringRef)*MEMORY[0x1E0CA2240]);
    if (Extension)
    {
      v11 = (void *)Extension;
      v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v13 = (void *)objc_msgSend(v11, "objectForKey:", CFSTR("sinf"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v46, v45, 16);
        if (v14)
        {
          v15 = *(_QWORD *)v47;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v47 != v15)
                objc_enumerationMutation(v13);
              v17 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(v12, "addObject:", v17);
            }
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v46, v45, 16);
          }
          while (v14);
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v12, "addObject:", v13);
      }
    }
    else
    {
      v12 = 0;
    }
    if (objc_msgSend(v12, "count"))
    {
      v18 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v19 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v46, v45, 16);
      if (v19)
      {
        v20 = *(_QWORD *)v47;
        do
        {
          for (j = 0; j != v19; ++j)
          {
            if (*(_QWORD *)v47 != v20)
              objc_enumerationMutation(v12);
            objc_msgSend(v18, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * j), "base64EncodedStringWithOptions:", 0));
          }
          v19 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v46, v45, 16);
        }
        while (v19);
      }
      v43 = CFSTR("sinf");
      v44 = v18;
      v22 = objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1), 1, 0);
      goto LABEL_43;
    }
    MediaType = CMFormatDescriptionGetMediaType(a4);
    MediaSubType = CMFormatDescriptionGetMediaSubType(a4);
    v25 = 0;
    if (MediaSubType <= 2053202738)
    {
      if (MediaSubType > 1902212706)
      {
        if (MediaSubType != 1902212707)
        {
          v26 = 24931;
          goto LABEL_40;
        }
      }
      else if (MediaSubType != 1667331683)
      {
        v27 = 1700886115;
        goto LABEL_41;
      }
    }
    else if (((MediaSubType - 2053202739) > 0x3D
            || ((1 << (MediaSubType - 51)) & 0x2020000000000001) == 0)
           && MediaSubType != 2053464883)
    {
      v26 = 30307;
LABEL_40:
      v27 = v26 | 0x7A610000;
LABEL_41:
      if (MediaSubType != v27)
        goto LABEL_44;
    }
    v28 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", MediaSubType);
    v29 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", MediaType);
    *(_QWORD *)&v46 = CFSTR("codc");
    *((_QWORD *)&v46 + 1) = CFSTR("mtyp");
    v45[0] = v28;
    v45[1] = v29;
    *(_QWORD *)&v47 = CFSTR("cont");
    v45[2] = CFSTR("mpts");
    v22 = objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, &v46, 3), 1, 0);
LABEL_43:
    v25 = v22;
LABEL_44:
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[AVStreamDataParserOutputHandling streamDataParser:didProvideContentKeySpecifier:forTrackID:](self->_parser->_delegate, "streamDataParser:didProvideContentKeySpecifier:forTrackID:", self, -[AVContentKeySpecifier initForKeySystem:initializationData:]([AVContentKeySpecifier alloc], "initForKeySystem:initializationData:", CFSTR("FairPlayStreaming"), v25), self->_parser->_currentTrackID);
      goto LABEL_46;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[AVStreamDataParserOutputHandling streamDataParserWillProvideContentKeyRequestInitializationData:forTrackID:](self->_parser->_delegate, "streamDataParserWillProvideContentKeyRequestInitializationData:forTrackID:", self, self->_parser->_currentTrackID);
    if (!self->_parser->_contentKeySession
      && (objc_opt_respondsToSelector() & 1) != 0
      && !self->_parser->_contentKeySession)
    {
      self->_parser->_defaultContentKeySession = -[AVContentKeySession initWithKeySystem:storageDirectoryAtURL:internal:]([AVContentKeySession alloc], "initWithKeySystem:storageDirectoryAtURL:internal:", CFSTR("FairPlayStreaming"), 0, 1);
      -[AVContentKeySession setDelegate:](self->_parser->_defaultContentKeySession, "setDelegate:", self);
      self->_parser->_contentKeySession = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", self->_parser->_defaultContentKeySession);
    }
    v36 = -[AVWeakReference referencedObject](self->_parser->_contentKeySession, "referencedObject");
    v37 = objc_msgSend(v36, "copyCryptorForInitializationData:", v25);
    v30 = (const void *)v37;
    if (!v36 || v37)
    {
      if (!v37)
      {
LABEL_78:
        self->_parser->_currentTrackID = 0;
        goto LABEL_47;
      }
    }
    else
    {
      v38 = (void *)objc_msgSend(v36, "issueContentKeyRequestForInitializationData:", v25);
      if (-[AVStreamDataParser status2](self, "status2") > 3)
        return -11860;
      if (objc_msgSend(v38, "status") >= 5)
      {
        -[AVStreamDataParser _setError:](self, "_setError:", objc_msgSend(v38, "error"));
        return -11860;
      }
      v39 = -[AVWeakReference referencedObject](self->_parser->_contentKeySession, "referencedObject");
      v45[0] = 0;
      v30 = (const void *)objc_msgSend(v39, "createCryptorIfNecessaryForInitializationData:formatDescription:error:", v25, a4, v45);
      if (!v30)
      {
        objc_msgSend(v45[0], "code");
        return FigSignalErrorAt();
      }
      self->_parser->_startedUsingInternalContentKeySession = objc_msgSend(v39, "isInternal");
    }
    v40 = self->_parser;
    trackDecryptorsByTrackID = v40->_trackDecryptorsByTrackID;
    if (!trackDecryptorsByTrackID)
    {
      self->_parser->_trackDecryptorsByTrackID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v40 = self->_parser;
      trackDecryptorsByTrackID = v40->_trackDecryptorsByTrackID;
    }
    -[NSMutableDictionary setObject:forKey:](trackDecryptorsByTrackID, "setObject:forKey:", v30, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v40->_currentTrackID));
    goto LABEL_78;
  }
  -[NSMutableDictionary removeObjectForKey:](self->_parser->_trackDecryptorsByTrackID, "removeObjectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a6));
LABEL_46:
  v30 = 0;
LABEL_47:
  v31 = self->_parser;
  if (v31->_asset)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_msgSend((id)-[AVAsset formatDescriptionsForTrackID:](self->_parser->_asset, "formatDescriptionsForTrackID:", a6), "containsObject:", a4) & 1) == 0)
    {
      v32 = self->_parser->_asset;
      self->_parser->_asset = (AVAsset *)-[AVAsset copyAssetWithReplacementFormatDescription:forTrackID:](self->_parser->_asset, "copyAssetWithReplacementFormatDescription:forTrackID:", a4, a6);
      if (self->_parser->_delegate)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          -[AVStreamDataParserOutputHandling streamDataParser:didParseStreamDataAsAsset:withDiscontinuity:](self->_parser->_delegate, "streamDataParser:didParseStreamDataAsAsset:withDiscontinuity:", self, self->_parser->_asset, 0);
      }
    }
  }
  else if (a4)
  {
    v33 = (id)objc_msgSend((id)-[NSMutableDictionary objectForKey:](v31->_tracksBecomingReadyByTrackID, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a6)), "mutableCopy");
    v34 = v33;
    if (v33)
    {
      objc_msgSend(v33, "setObject:forKey:", a4, CFSTR("formatDescription"));
      -[NSMutableDictionary setObject:forKey:](self->_parser->_tracksBecomingReadyByTrackID, "setObject:forKey:", v34, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a6));
    }
  }
  if (v30)
    CFRelease(v30);
  return 0;
}

- (int)_registerForFigManifoldCallbacksForTrackID:(int)a3
{
  uint64_t v3;
  OpaqueFigManifold *figManifold;
  uint64_t (*v6)(OpaqueFigManifold *, uint64_t, uint64_t (**)(), AVStreamDataParser *);

  v3 = *(_QWORD *)&a3;
  figManifold = self->_parser->_figManifold;
  v6 = *(uint64_t (**)(OpaqueFigManifold *, uint64_t, uint64_t (**)(), AVStreamDataParser *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
  if (v6)
    return v6(figManifold, v3, kManifoldTrackCallbacks, self);
  else
    return -12782;
}

- (int)_unregisterForFigManifoldCallbacksForTrackID:(int)a3
{
  uint64_t v3;
  OpaqueFigManifold *figManifold;
  uint64_t (*v5)(OpaqueFigManifold *, uint64_t, _QWORD, _QWORD);

  v3 = *(_QWORD *)&a3;
  figManifold = self->_parser->_figManifold;
  v5 = *(uint64_t (**)(OpaqueFigManifold *, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                              + 32);
  if (v5)
    return v5(figManifold, v3, 0, 0);
  else
    return -12782;
}

- (int)_figManifold:(OpaqueFigManifold *)a3 discoveredNewTrackID:(int)a4 mediaType:(id)a5
{
  uint64_t v6;
  int v8;
  AVStreamDataParserInternal *parser;
  AVAsset *v10;
  NSMutableDictionary *tracksBecomingReadyByTrackID;
  NSMutableDictionary *v12;
  uint64_t v13;

  v6 = *(_QWORD *)&a4;
  v8 = -[AVStreamDataParser _registerForFigManifoldCallbacksForTrackID:](self, "_registerForFigManifoldCallbacksForTrackID:", *(_QWORD *)&a4);
  if (!v8)
  {
    parser = self->_parser;
    if (parser->_asset)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = self->_parser->_asset;
        self->_parser->_asset = (AVAsset *)-[AVAsset copyAssetWithAdditionalTrackID:mediaType:](self->_parser->_asset, "copyAssetWithAdditionalTrackID:mediaType:", v6, a5);
      }
    }
    else
    {
      tracksBecomingReadyByTrackID = parser->_tracksBecomingReadyByTrackID;
      if (!tracksBecomingReadyByTrackID)
      {
        self->_parser->_tracksBecomingReadyByTrackID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        tracksBecomingReadyByTrackID = self->_parser->_tracksBecomingReadyByTrackID;
      }
      if (!-[NSMutableDictionary objectForKey:](tracksBecomingReadyByTrackID, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6)))
      {
        v12 = self->_parser->_tracksBecomingReadyByTrackID;
        v13 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", a5, CFSTR("mediaType"), 0);
        -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v13, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6));
      }
    }
  }
  return v8;
}

- (BOOL)_WebVTTIsAllowed
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!self->_parser->_allowableMIMETypes)
    return 1;
  v3 = (void *)FigCopyWebVTTMIMETypes();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
LABEL_4:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v11 != v6)
        objc_enumerationMutation(v3);
      if (-[NSArray containsObject:](self->_parser->_allowableMIMETypes, "containsObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7)))
      {
        break;
      }
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v5)
          goto LABEL_4;
        goto LABEL_10;
      }
    }
    v8 = 1;
    if (!v3)
      return v8;
  }
  else
  {
LABEL_10:
    v8 = 0;
    if (!v3)
      return v8;
  }
  CFRelease(v3);
  return v8;
}

- (BOOL)_MPEG2TSIsAllowed
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!self->_parser->_allowableMIMETypes)
    return 1;
  v3 = (void *)FigCopyMPEGTransportStreamMIMETypes();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
LABEL_4:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v11 != v6)
        objc_enumerationMutation(v3);
      if (-[NSArray containsObject:](self->_parser->_allowableMIMETypes, "containsObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7)))
      {
        break;
      }
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v5)
          goto LABEL_4;
        goto LABEL_10;
      }
    }
    v8 = 1;
    if (!v3)
      return v8;
  }
  else
  {
LABEL_10:
    v8 = 0;
    if (!v3)
      return v8;
  }
  CFRelease(v3);
  return v8;
}

- (BOOL)_MovieFragmentStreamIsAllowed
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!self->_parser->_allowableMIMETypes)
    return 1;
  v3 = (void *)FigCopyQTMovieMIMETypes();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
LABEL_4:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v11 != v6)
        objc_enumerationMutation(v3);
      if (-[NSArray containsObject:](self->_parser->_allowableMIMETypes, "containsObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7)))
      {
        break;
      }
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v5)
          goto LABEL_4;
        goto LABEL_10;
      }
    }
    v8 = 1;
    if (!v3)
      return v8;
  }
  else
  {
LABEL_10:
    v8 = 0;
    if (!v3)
      return v8;
  }
  CFRelease(v3);
  return v8;
}

- (BOOL)_ICYIsAllowed
{
  NSArray *allowableMIMETypes;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  CFTypeRef cf;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!self->_parser->_allowableMIMETypes)
    return 1;
  cf = 0;
  FigCopySetOfAudioSupportedMIMETypes();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  allowableMIMETypes = self->_parser->_allowableMIMETypes;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](allowableMIMETypes, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(allowableMIMETypes);
        if ((objc_msgSend(0, "containsObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i)) & 1) != 0)
        {
          v8 = 1;
          goto LABEL_12;
        }
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](allowableMIMETypes, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_12:
  if (cf)
    CFRelease(cf);
  return v8;
}

- (id)_fullListOfAllowableMIMETypes
{
  void *v3;
  uint64_t v4;
  const void *v5;
  uint64_t v6;
  const void *v7;
  uint64_t v8;
  const void *v9;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (-[AVStreamDataParser _WebVTTIsAllowed](self, "_WebVTTIsAllowed"))
  {
    v4 = FigCopyWebVTTMIMETypes();
    if (v4)
    {
      v5 = (const void *)v4;
      objc_msgSend(v3, "addObjectsFromArray:", v4);
      CFRelease(v5);
    }
  }
  if (-[AVStreamDataParser _MovieFragmentStreamIsAllowed](self, "_MovieFragmentStreamIsAllowed"))
  {
    v6 = FigCopyQTMovieMIMETypes();
    if (v6)
    {
      v7 = (const void *)v6;
      objc_msgSend(v3, "addObjectsFromArray:", v6);
      CFRelease(v7);
    }
  }
  if (-[AVStreamDataParser _MPEG2TSIsAllowed](self, "_MPEG2TSIsAllowed"))
  {
    v8 = FigCopyMPEGTransportStreamMIMETypes();
    if (v8)
    {
      v9 = (const void *)v8;
      objc_msgSend(v3, "addObjectsFromArray:", v8);
      CFRelease(v9);
    }
  }
  if (-[AVStreamDataParser _ICYIsAllowed](self, "_ICYIsAllowed"))
    FigCopySetOfAudioSupportedMIMETypes();
  return v3;
}

- (int)_createFigManifoldRemote:(OpaqueCMBlockBuffer *)a3 manifold:(OpaqueFigManifold *)a4
{
  int result;

  if (!-[AVStreamDataParser _WebVTTIsAllowed](self, "_WebVTTIsAllowed")
    || (result = FigManifoldCreateRemoteForWebVTT(), result == -16044))
  {
    if (!-[AVStreamDataParser _MPEG2TSIsAllowed](self, "_MPEG2TSIsAllowed")
      || (result = FigManifoldCreateRemoteForMPEG2(), result == -16044))
    {
      if (!-[AVStreamDataParser _MovieFragmentStreamIsAllowed](self, "_MovieFragmentStreamIsAllowed")
        || (result = FigManifoldCreateRemoteForMovieFragmentStream(), result == -16044))
      {
        if (-[AVStreamDataParser _ICYIsAllowed](self, "_ICYIsAllowed"))
          return FigManifoldCreateRemoteForICY();
        else
          return -16044;
      }
    }
  }
  return result;
}

- (int)_createFigManifold:(OpaqueCMBlockBuffer *)a3 manifold:(OpaqueFigManifold *)a4
{
  int result;

  if (!-[AVStreamDataParser _WebVTTIsAllowed](self, "_WebVTTIsAllowed")
    || (result = FigManifoldCreateForWebVTT(), result == -16044))
  {
    if (!-[AVStreamDataParser _MPEG2TSIsAllowed](self, "_MPEG2TSIsAllowed")
      || (result = FigManifoldCreateForMPEG2(), result == -16044))
    {
      if (!-[AVStreamDataParser _MovieFragmentStreamIsAllowed](self, "_MovieFragmentStreamIsAllowed")
        || (result = FigManifoldCreateForMovieFragmentStream(), result == -16044))
      {
        if (-[AVStreamDataParser _ICYIsAllowed](self, "_ICYIsAllowed"))
          return FigManifoldCreateForICY();
        else
          return -16044;
      }
    }
  }
  return result;
}

- (int)_createFigManifoldWithBlockBuffer:(OpaqueCMBlockBuffer *)a3 manifold:(OpaqueFigManifold *)a4
{
  int v7;
  int v8;

  if (-[AVStreamDataParser preferSandboxedParsing](self, "preferSandboxedParsing"))
    v7 = -[AVStreamDataParser _createFigManifoldRemote:manifold:](self, "_createFigManifoldRemote:manifold:", a3, a4);
  else
    v7 = -[AVStreamDataParser _createFigManifold:manifold:](self, "_createFigManifold:manifold:", a3, a4);
  v8 = v7;
  if (*a4)
    self->_parser->_typeIdOfInitialFigManifold = CFGetTypeID(*a4);
  return v8;
}

- (void)contentKeySession:(id)a3 didProvideContentKeyRequest:(id)a4
{
  AVContentKeyRequest *v6;

  v6 = self->_parser->_sessionKeyRequest;
  self->_parser->_sessionKeyRequest = (AVContentKeyRequest *)a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[AVStreamDataParserOutputHandling streamDataParser:didProvideContentKeyRequestInitializationData:forTrackID:](self->_parser->_delegate, "streamDataParser:didProvideContentKeyRequestInitializationData:forTrackID:", self, objc_msgSend(a4, "initializationData"), self->_parser->_currentTrackID);
}

- (void)contentKeySessionContentProtectionSessionIdentifierDidChange:(id)a3
{
  uint64_t v4;

  v4 = objc_msgSend(a3, "contentProtectionSessionIdentifier");
  if (v4)
    objc_msgSend(-[AVWeakReference referencedObject](self->_parser->_legacyStreamSession, "referencedObject"), "setFigCPEProtectorSessionIdentifier:", v4);
}

- (NSData)contentProtectionSessionIdentifier
{
  return (NSData *)objc_msgSend(-[AVWeakReference referencedObject](self->_parser->_contentKeySession, "referencedObject"), "contentProtectionSessionIdentifier");
}

- (void)processContentKeyResponseData:(id)a3 forTrackID:(int)a4
{
  AVStreamDataParserInternal *parser;
  AVContentKeyRequest *sessionKeyRequest;
  AVWeakReference *legacyStreamSession;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  AVStreamDataParser *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  parser = self->_parser;
  sessionKeyRequest = parser->_sessionKeyRequest;
  if (!sessionKeyRequest)
  {
    legacyStreamSession = parser->_legacyStreamSession;
    if (legacyStreamSession
      && (v15 = 0u,
          v16 = 0u,
          v17 = 0u,
          v18 = 0u,
          v9 = (void *)objc_msgSend(-[AVWeakReference referencedObject](legacyStreamSession, "referencedObject", a3, *(_QWORD *)&a4), "streamDataParsers", 0), (v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16)) != 0))
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
LABEL_5:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v14 = *(AVStreamDataParser **)(*((_QWORD *)&v15 + 1) + 8 * v13);
        if (v14 != self)
        {
          sessionKeyRequest = v14->_parser->_sessionKeyRequest;
          if (sessionKeyRequest)
            break;
        }
        if (v11 == ++v13)
        {
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          sessionKeyRequest = 0;
          if (v11)
            goto LABEL_5;
          break;
        }
      }
    }
    else
    {
      sessionKeyRequest = 0;
    }
  }
  -[AVContentKeyRequest processContentKeyResponse:](sessionKeyRequest, "processContentKeyResponse:", +[AVContentKeyResponse contentKeyResponseWithFairPlayStreamingKeyResponseData:](AVContentKeyResponse, "contentKeyResponseWithFairPlayStreamingKeyResponseData:", a3, *(_QWORD *)&a4));
}

- (void)processContentKeyResponseError:(id)a3 forTrackID:(int)a4
{
  uint64_t v4;
  const __CFString *v6;
  _QWORD v7[2];

  v4 = (uint64_t)a3;
  v7[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v6 = CFSTR("AVErrorPersistentTrackIDKey");
    v7[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a4);
    v4 = AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11800, (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1));
  }
  -[AVStreamDataParser _setError:](self, "_setError:", v4, *(_QWORD *)&a4);
  -[AVContentKeyRequest processContentKeyResponseError:](self->_parser->_sessionKeyRequest, "processContentKeyResponseError:", v4);
}

- (void)renewExpiringContentKeyResponseDataForTrackID:(int)a3
{
  -[AVContentKeyRequest renewExpiringContentKeyResponseData](self->_parser->_sessionKeyRequest, "renewExpiringContentKeyResponseData", *(_QWORD *)&a3);
}

- (id)streamingContentKeyRequestDataForApp:(id)a3 contentIdentifier:(id)a4 trackID:(int)a5 options:(id)a6 error:(id *)a7
{
  uint64_t v9;
  id v13;
  uint64_t v14;

  v9 = *(_QWORD *)&a5;
  objc_msgSend(-[AVWeakReference referencedObject](self->_parser->_legacyStreamSession, "referencedObject"), "setAppIdentifier:", a3);
  v13 = (id)objc_msgSend(a6, "mutableCopy");
  v14 = -[NSMutableDictionary objectForKeyedSubscript:](self->_parser->_trackFormatDescriptionsByTrackID, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9));
  if (v14)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, 0x1E304E218);
  return -[AVContentKeyRequest contentKeyRequestDataForApp:contentIdentifier:options:error:](self->_parser->_sessionKeyRequest, "contentKeyRequestDataForApp:contentIdentifier:options:error:", a3, a4, v13, a7);
}

- (BOOL)hasProtector
{
  return objc_msgSend(-[AVWeakReference referencedObject](self->_parser->_contentKeySession, "referencedObject"), "hasProtector");
}

- (void)expire
{
  -[AVStreamDataParser setStatus:](self, "setStatus:", 5);
  objc_msgSend(-[AVWeakReference referencedObject](self->_parser->_contentKeySession, "referencedObject"), "expire");
}

- (void)setSession:(id)a3
{
  AVStreamDataParserInternal *v5;
  AVStreamDataParserInternal **p_parser;
  AVStreamDataParserInternal *parser;
  AVWeakReference *v8;
  AVWeakReference *v9;
  AVStreamDataParserInternal **v10;
  AVStreamDataParserInternal *v11;
  AVWeakReference *v12;
  AVWeakReference *v13;
  void *v14;
  uint64_t v15;
  const __CFString *v16;

  if (a3)
  {
    objc_msgSend(a3, "referencedObject");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      return;
    parser = self->_parser;
    p_parser = &self->_parser;
    v5 = parser;
    if (parser->_legacyStreamSession)
    {
      v14 = (void *)MEMORY[0x1E0C99DA0];
      v15 = *MEMORY[0x1E0C99778];
      v16 = CFSTR("AVStreamDataParser can't attach to an AVContentKeySession when it's already attached to an AVStreamSession");
    }
    else
    {
      if (!v5->_startedUsingInternalContentKeySession)
      {
        v8 = v5->_contentKeySession;
        v9 = (AVWeakReference *)a3;
        v10 = p_parser;
LABEL_10:
        (*v10)->_contentKeySession = v9;
        return;
      }
      v14 = (void *)MEMORY[0x1E0C99DA0];
      v15 = *MEMORY[0x1E0C99778];
      v16 = CFSTR("AVStreamDataParser can't attach to an AVContentKeySession after it started using its own AVContentKeySession for key loading");
    }
    objc_exception_throw((id)objc_msgSend(v14, "exceptionWithName:reason:userInfo:", v15, v16, 0));
  }
  v10 = &self->_parser;
  v11 = self->_parser;
  if (v11->_legacyStreamSession)
  {
    -[AVStreamDataParser setStatus:](self, "setStatus:", 5);
    v12 = self->_parser->_legacyStreamSession;
    self->_parser->_legacyStreamSession = 0;
    v11 = self->_parser;
  }
  if (v11->_contentKeySession)
  {
    -[AVStreamDataParser setStatus:](self, "setStatus:", 5);
    v13 = self->_parser->_contentKeySession;
    v9 = 0;
    goto LABEL_10;
  }
}

- (id)contentKeySession
{
  return -[AVWeakReference referencedObject](self->_parser->_contentKeySession, "referencedObject");
}

- (BOOL)_attachedToExternalContentKeySession
{
  id v3;
  int v4;

  v3 = -[AVWeakReference referencedObject](self->_parser->_contentKeySession, "referencedObject");
  if (v3)
    v4 = objc_msgSend(v3, "isInternal") ^ 1;
  else
    LOBYTE(v4) = 0;
  if (self->_parser->_legacyStreamSession)
    return 1;
  else
    return v4;
}

- (BOOL)mayRequireContentKeysForMediaDataProcessing
{
  return 1;
}

- (int)_attachToContentKeySession:(id)a3 contentKeyBoss:(OpaqueFigContentKeyBoss *)a4 failedSinceAlreadyAttachedToAnotherSession:(BOOL *)a5
{
  AVWeakReference *v7;

  v7 = (AVWeakReference *)objc_msgSend(a3, "_weakReference");
  if (self->_parser->_contentKeySession == v7)
  {
    if (a5)
      *a5 = 0;
  }
  else
  {
    -[AVStreamDataParser setSession:](self, "setSession:", v7);
  }
  return 0;
}

- (void)setPreferSandboxedParsing:(BOOL)a3
{
  NSObject *threadSafetyQ;
  _QWORD v4[5];
  BOOL v5;

  threadSafetyQ = self->_parser->_threadSafetyQ;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __84__AVStreamDataParser_AVStreamDataParserSandboxedParsing__setPreferSandboxedParsing___block_invoke;
  v4[3] = &unk_1E302FD38;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(threadSafetyQ, v4);
}

uint64_t __84__AVStreamDataParser_AVStreamDataParserSandboxedParsing__setPreferSandboxedParsing___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 200) != v2 && *(_QWORD *)(v1 + 64))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("must only set preferSandboxedParsing before any stream data is appended"), 0));
  *(_BYTE *)(v1 + 200) = v2;
  return result;
}

- (BOOL)preferSandboxedParsing
{
  NSObject *threadSafetyQ;
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
  threadSafetyQ = self->_parser->_threadSafetyQ;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __80__AVStreamDataParser_AVStreamDataParserSandboxedParsing__preferSandboxedParsing__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(threadSafetyQ, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __80__AVStreamDataParser_AVStreamDataParserSandboxedParsing__preferSandboxedParsing__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 200);
  return result;
}

- (BOOL)isDefunct
{
  NSObject *threadSafetyQ;
  BOOL v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  threadSafetyQ = self->_parser->_threadSafetyQ;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__AVStreamDataParser_AVIntegrityChecking__isDefunct__block_invoke;
  v5[3] = &unk_1E302FDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(threadSafetyQ, v5);
  v3 = *((_BYTE *)v7 + 24) == 1;
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __52__AVStreamDataParser_AVIntegrityChecking__isDefunct__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  uint64_t v9;

  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 112), "referencedObject");
  if (!v2
    || (result = objc_msgSend(v2, "isDefunct"),
        (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result) == 0))
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(_QWORD *)(v4 + 64);
    if (!v5)
    {
LABEL_11:
      result = *(_QWORD *)(v4 + 40);
      if (result)
      {
        result = objc_msgSend((id)result, "isDefunct");
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
      }
      return result;
    }
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(_QWORD **)(CMBaseObjectGetVTable() + 8);
    if (*v7 >= 5uLL && (v8 = (uint64_t (*)(uint64_t, uint64_t))v7[11]) != 0)
      result = v8(v5, v6 + 24);
    else
      result = 4294954514;
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (!*(_BYTE *)(v9 + 24))
    {
      if ((_DWORD)result)
      {
        *(_BYTE *)(v9 + 24) = 1;
        return result;
      }
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      goto LABEL_11;
    }
  }
  return result;
}

@end
