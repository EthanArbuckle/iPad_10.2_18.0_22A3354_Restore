@implementation BWMRCNode

- (void)_newSymbologiesArrayFromIdentifiers:(uint64_t)a1
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  uint64_t v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _QWORD v45[19];
  _QWORD v46[20];

  v46[19] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (!*(_QWORD *)(a1 + 176))
  {
    v4 = *MEMORY[0x1E0D833C0];
    v5 = *MEMORY[0x1E0CA4C78];
    v45[0] = *MEMORY[0x1E0CA4C70];
    v45[1] = v5;
    v6 = *MEMORY[0x1E0D833C8];
    v46[0] = v4;
    v46[1] = v6;
    v7 = *MEMORY[0x1E0D83448];
    v8 = *MEMORY[0x1E0CA4C50];
    v45[2] = *MEMORY[0x1E0CA4CA0];
    v45[3] = v8;
    v9 = *MEMORY[0x1E0D83388];
    v46[2] = v7;
    v46[3] = v9;
    v10 = *MEMORY[0x1E0D83390];
    v11 = *MEMORY[0x1E0CA4C60];
    v45[4] = *MEMORY[0x1E0CA4C58];
    v45[5] = v11;
    v12 = *MEMORY[0x1E0D833A8];
    v46[4] = v10;
    v46[5] = v12;
    v13 = *MEMORY[0x1E0D83380];
    v14 = *MEMORY[0x1E0CA4C80];
    v45[6] = *MEMORY[0x1E0CA4C48];
    v45[7] = v14;
    v15 = *MEMORY[0x1E0D833E8];
    v46[6] = v13;
    v46[7] = v15;
    v16 = *MEMORY[0x1E0D833F8];
    v17 = *MEMORY[0x1E0CA4C68];
    v45[8] = *MEMORY[0x1E0CA4C88];
    v45[9] = v17;
    v18 = *MEMORY[0x1E0D833B8];
    v46[8] = v16;
    v46[9] = v18;
    v19 = *MEMORY[0x1E0D83440];
    v20 = *MEMORY[0x1E0CA4C40];
    v45[10] = *MEMORY[0x1E0CA4C98];
    v45[11] = v20;
    v21 = *MEMORY[0x1E0D83370];
    v46[10] = v19;
    v46[11] = v21;
    v22 = *MEMORY[0x1E0D83418];
    v23 = *MEMORY[0x1E0D08560];
    v45[12] = *MEMORY[0x1E0CA4C90];
    v45[13] = v23;
    v24 = *MEMORY[0x1E0D83378];
    v46[12] = v22;
    v46[13] = v24;
    v25 = *MEMORY[0x1E0D833D0];
    v26 = *MEMORY[0x1E0D08570];
    v45[14] = *MEMORY[0x1E0D08568];
    v45[15] = v26;
    v27 = *MEMORY[0x1E0D833D8];
    v46[14] = v25;
    v46[15] = v27;
    v28 = *MEMORY[0x1E0D833E0];
    v29 = *MEMORY[0x1E0D08588];
    v45[16] = *MEMORY[0x1E0D08578];
    v45[17] = v29;
    v30 = *MEMORY[0x1E0D83410];
    v46[16] = v28;
    v46[17] = v30;
    v45[18] = *MEMORY[0x1E0D08580];
    v46[18] = *MEMORY[0x1E0D83408];
    v31 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 19);
    *(_QWORD *)(a1 + 176) = v31;
    v32 = v31;
  }
  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a2, "count"));
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v34 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v41 != v36)
          objc_enumerationMutation(a2);
        v38 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
        if (objc_msgSend(*(id *)(a1 + 176), "objectForKey:", v38))
          objc_msgSend(v33, "addObject:", objc_msgSend(*(id *)(a1 + 176), "objectForKeyedSubscript:", v38));
      }
      v35 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v35);
  }
  return v33;
}

- (BWMRCNode)init
{
  BWMRCNode *v2;
  BWMRCNode *v3;
  CGSize v4;
  BWNodeInput *v5;
  BWVideoFormatRequirements *v6;
  BWNodeOutput *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BWMRCNode;
  v2 = -[BWNode init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_createSampleBufferProcessorFunction = mrcn_createSampleBufferProcessor;
    v2->_symbologiesArray = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    v4 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v3->_rectOfInterest.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    v3->_rectOfInterest.size = v4;
    v3->_rectOfInterestLock._os_unfair_lock_opaque = 0;
    v5 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1986618469, v3);
    -[BWNodeInput setIndefinitelyHeldBufferCount:](v5, "setIndefinitelyHeldBufferCount:", 1);
    v6 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWNodeInput setFormatRequirements:](v5, "setFormatRequirements:", v6);

    -[BWNode addInput:](v3, "addInput:", v5);
    -[BWFormatRequirements setSupportedPixelFormats:](-[BWNodeInput formatRequirements](v3->super._input, "formatRequirements"), "setSupportedPixelFormats:", &unk_1E4A00380);
    v7 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1836016234, v3);
    -[BWNodeOutput setFormat:](v7, "setFormat:", +[BWMetadataObjectFormat formatWithMetadataIdentifiers:](BWMetadataObjectFormat, "formatWithMetadataIdentifiers:", 0));
    -[BWNode addOutput:](v3, "addOutput:", v7);

  }
  return v3;
}

- (id)nodeType
{
  return CFSTR("Effect");
}

- (void)setRectOfInterest:(CGRect)a3
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGRect v8;
  CGRect v9;
  CGRect v10;

  v9.origin.x = 0.0;
  v9.origin.y = 0.0;
  v9.size.width = 1.0;
  v9.size.height = 1.0;
  v8 = CGRectIntersection(a3, v9);
  x = v8.origin.x;
  y = v8.origin.y;
  width = v8.size.width;
  height = v8.size.height;
  if (CGRectIsEmpty(v8))
  {
    x = *MEMORY[0x1E0C9D648];
    y = *(double *)(MEMORY[0x1E0C9D648] + 8);
    width = *(double *)(MEMORY[0x1E0C9D648] + 16);
    height = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  os_unfair_lock_lock(&self->_rectOfInterestLock);
  v10.origin.x = x;
  v10.origin.y = y;
  v10.size.width = width;
  v10.size.height = height;
  if (!CGRectEqualToRect(self->_rectOfInterest, v10))
  {
    self->_hasPendingRectOfInterestUpdate = 1;
    self->_rectOfInterest.origin.x = x;
    self->_rectOfInterest.origin.y = y;
    self->_rectOfInterest.size.width = width;
    self->_rectOfInterest.size.height = height;
  }
  os_unfair_lock_unlock(&self->_rectOfInterestLock);
}

- (void)setMrcIdentifiers:(id)a3
{
  NSArray *v5;

  v5 = (NSArray *)objc_msgSend(a3, "copy");
  self->_mrcIdentifiers = v5;
  -[BWNodeOutput setFormat:](self->super._output, "setFormat:", +[BWMetadataObjectFormat formatWithMetadataIdentifiers:](BWMetadataObjectFormat, "formatWithMetadataIdentifiers:", v5));

  self->_symbologiesArray = (NSArray *)-[BWMRCNode _newSymbologiesArrayFromIdentifiers:]((uint64_t)self, self->_mrcIdentifiers);
}

- (void)setLowPowerModeEnabled:(BOOL)a3
{
  self->_lowPowerModeEnabled = a3;
}

- (void)setDetectedResultsObserver:(id)a3
{
  self->_detectedResultsObserver = (BWMetadataDetectedResultsObserver *)a3;
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWMRCNode;
  -[BWNode prepareForCurrentConfigurationToBecomeLive](&v3, sel_prepareForCurrentConfigurationToBecomeLive);
  if (!self->_sampleBufferProcessor)
  {
    if (-[BWMRCNode _setupSampleBufferProcessor]((uint64_t)self))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
  }
}

- (uint64_t)_setupSampleBufferProcessor
{
  void (*v2)(_QWORD, _QWORD, uint64_t *);
  uint64_t v3;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t v5;
  uint64_t FigBaseObject;
  void (*v7)(uint64_t, _QWORD, _QWORD);
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, _QWORD, uint64_t);
  CFDictionaryRef DictionaryRepresentation;
  uint64_t v12;
  void (*v13)(uint64_t, _QWORD, CFDictionaryRef);
  uint64_t v14;
  void (*v15)(uint64_t, _QWORD, _QWORD);
  uint64_t v16;
  uint64_t (*v17)(uint64_t, _QWORD, _QWORD);
  uint64_t v18;
  uint64_t v20;

  if (!a1)
    return 0;
  v20 = 0;
  v2 = *(void (**)(_QWORD, _QWORD, uint64_t *))(a1 + 96);
  if (!v2)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  v2(*MEMORY[0x1E0C9AE00], 0, &v20);
  v3 = v20;
  *(_QWORD *)(a1 + 104) = v20;
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
  if (!v4)
  {
    v18 = 4294954514;
LABEL_21:
    fig_log_get_emitter();
    FigDebugAssert3();
    return v18;
  }
  v5 = v4(v3, mrcn_processorOutputReadyCallback, a1);
  if ((_DWORD)v5)
  {
    v18 = v5;
    goto LABEL_21;
  }
  FigBaseObject = FigSampleBufferProcessorGetFigBaseObject();
  v7 = *(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v7)
    v7(FigBaseObject, *MEMORY[0x1E0D05878], *MEMORY[0x1E0C9AE50]);
  v8 = *(_QWORD *)(a1 + 112);
  if (v8)
  {
    v9 = FigSampleBufferProcessorGetFigBaseObject();
    v10 = *(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v10)
      v10(v9, *MEMORY[0x1E0D05890], v8);
  }
  if (!CGRectIsNull(*(CGRect *)(a1 + 136)))
  {
    DictionaryRepresentation = CGRectCreateDictionaryRepresentation(*(CGRect *)(a1 + 136));
    v12 = FigSampleBufferProcessorGetFigBaseObject();
    v13 = *(void (**)(uint64_t, _QWORD, CFDictionaryRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v13)
      v13(v12, *MEMORY[0x1E0D05868], DictionaryRepresentation);
    if (DictionaryRepresentation)
      CFRelease(DictionaryRepresentation);
  }
  if (*(_BYTE *)(a1 + 173))
  {
    v14 = FigSampleBufferProcessorGetFigBaseObject();
    v15 = *(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v15)
      v15(v14, *MEMORY[0x1E0D05870], MEMORY[0x1E0C9AAB0]);
  }
  v16 = FigSampleBufferProcessorGetFigBaseObject();
  v17 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v17)
    return v17(v16, *MEMORY[0x1E0D05880], 0);
  else
    return 4294954514;
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  OpaqueFigSampleBufferProcessor *sampleBufferProcessor;
  void (*v4)(OpaqueFigSampleBufferProcessor *, _QWORD, _QWORD);
  uint64_t FigBaseObject;
  uint64_t v6;
  void (*v7)(uint64_t);
  OpaqueFigSampleBufferProcessor *v8;
  objc_super v9;

  sampleBufferProcessor = self->_sampleBufferProcessor;
  if (sampleBufferProcessor)
  {
    v4 = *(void (**)(OpaqueFigSampleBufferProcessor *, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                             + 16)
                                                                                 + 8);
    if (v4)
      v4(sampleBufferProcessor, 0, 0);
    FigBaseObject = FigSampleBufferProcessorGetFigBaseObject();
    if (FigBaseObject)
    {
      v6 = FigBaseObject;
      v7 = *(void (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 24);
      if (v7)
        v7(v6);
    }
    v8 = self->_sampleBufferProcessor;
    if (v8)
    {
      CFRelease(v8);
      self->_sampleBufferProcessor = 0;
    }
  }

  v9.receiver = self;
  v9.super_class = (Class)BWMRCNode;
  -[BWNode dealloc](&v9, sel_dealloc);
}

- (id)nodeSubType
{
  return CFSTR("MRCProcessor");
}

- (id)mrcIdentifiers
{
  return self->_mrcIdentifiers;
}

- (CGRect)rectOfInterest
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_rectOfInterest.origin.x;
  y = self->_rectOfInterest.origin.y;
  width = self->_rectOfInterest.size.width;
  height = self->_rectOfInterest.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)lowPowerModeEnabled
{
  return self->_lowPowerModeEnabled;
}

- (void)didReachEndOfDataForInput:(id)a3
{
  objc_super v5;

  -[BWMRCNode _teardownSampleBufferProcessor]((uint64_t)self);
  v5.receiver = self;
  v5.super_class = (Class)BWMRCNode;
  -[BWNode didReachEndOfDataForInput:](&v5, sel_didReachEndOfDataForInput_, a3);
}

- (void)_teardownSampleBufferProcessor
{
  uint64_t v2;
  void (*v3)(uint64_t);
  const void *v4;

  if (a1)
  {
    v2 = *(_QWORD *)(a1 + 104);
    if (v2)
    {
      v3 = *(void (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
      if (v3)
        v3(v2);
      v4 = *(const void **)(a1 + 104);
      if (v4)
      {
        CFRelease(v4);
        *(_QWORD *)(a1 + 104) = 0;
      }
    }
  }
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  unsigned int (*v10)(uint64_t, _QWORD, _QWORD);
  _BOOL4 hasPendingRectOfInterestUpdate;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  BOOL IsEmpty;
  CFDictionaryRef DictionaryRepresentation;
  uint64_t FigBaseObject;
  void (*v19)(uint64_t, _QWORD, CFDictionaryRef);
  OpaqueFigSampleBufferProcessor *sampleBufferProcessor;
  void (*v21)(OpaqueFigSampleBufferProcessor *, opaqueCMSampleBuffer *);
  CGRect v22;
  CGRect v23;
  CGRect v24;

  v6 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05C40], 0);
  v7 = v6;
  if (v6)
    dispatch_group_enter(v6);
  v8 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05D58], 0);
  if (!v8
    || (objc_msgSend(v8, "BOOLValue") & 1) != 0
    || (v9 = FigSampleBufferProcessorGetFigBaseObject(),
        (v10 = *(unsigned int (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56)) != 0)
    && !v10(v9, *MEMORY[0x1E0D05888], 0))
  {
    os_unfair_lock_lock(&self->_rectOfInterestLock);
    hasPendingRectOfInterestUpdate = self->_hasPendingRectOfInterestUpdate;
    x = self->_rectOfInterest.origin.x;
    y = self->_rectOfInterest.origin.y;
    width = self->_rectOfInterest.size.width;
    height = self->_rectOfInterest.size.height;
    self->_hasPendingRectOfInterestUpdate = 0;
    os_unfair_lock_unlock(&self->_rectOfInterestLock);
    v22.origin.x = x;
    v22.origin.y = y;
    v22.size.width = width;
    v22.size.height = height;
    IsEmpty = CGRectIsEmpty(v22);
    if (hasPendingRectOfInterestUpdate)
    {
      v23.origin.x = x;
      v23.origin.y = y;
      v23.size.width = width;
      v23.size.height = height;
      if (!CGRectIsNull(v23))
      {
        v24.origin.x = x;
        v24.origin.y = y;
        v24.size.width = width;
        v24.size.height = height;
        DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v24);
        FigBaseObject = FigSampleBufferProcessorGetFigBaseObject();
        v19 = *(void (**)(uint64_t, _QWORD, CFDictionaryRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
        if (v19)
          v19(FigBaseObject, *MEMORY[0x1E0D05868], DictionaryRepresentation);
        if (DictionaryRepresentation)
          CFRelease(DictionaryRepresentation);
      }
    }
    if (!IsEmpty)
    {
      sampleBufferProcessor = self->_sampleBufferProcessor;
      v21 = *(void (**)(OpaqueFigSampleBufferProcessor *, opaqueCMSampleBuffer *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                            + 16);
      if (v21)
        v21(sampleBufferProcessor, a3);
    }
  }
  if (v7)
    dispatch_group_leave(v7);
}

- (BOOL)_shouldEmitSBufForBarcodeCount:(__int128 *)a3 originalPTS:
{
  uint64_t v4;
  _BOOL8 v5;
  void *v6;
  __int128 v8;
  uint64_t v9;

  if (!a1)
    return 0;
  v4 = a2;
  if (!a2)
    v4 = *(_QWORD *)(a1 + 128);
  v5 = v4 > 0;
  *(_QWORD *)(a1 + 128) = a2;
  v6 = *(void **)(a1 + 184);
  v8 = *a3;
  v9 = *((_QWORD *)a3 + 2);
  objc_msgSend(v6, "node:didEmitCodesCount:emittedIdentifiers:originalPTS:", a1, a2, 0, &v8);
  return v5;
}

- (BWMetadataDetectedResultsObserver)detectedResultsObserver
{
  return self->_detectedResultsObserver;
}

@end
