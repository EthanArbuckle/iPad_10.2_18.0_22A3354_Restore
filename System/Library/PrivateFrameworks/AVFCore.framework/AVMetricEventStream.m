@implementation AVMetricEventStream

- (AVMetricEventStream)init
{
  AVMetricEventStream *v2;
  const __CFAllocator *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVMetricEventStream;
  v2 = -[AVMetricEventStream init](&v5, sel_init);
  if (v2)
  {
    v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v2->_publisherByEventTimeline = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], 0);
    v2->_publishers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v2->_eventTimelines = CFArrayCreateMutable(v3, 0, MEMORY[0x1E0C9B378]);
    v2->_internalQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.avmetrics", 0);
    v2->_metricEventClassesToSubscribe = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    FigMetricInstallAllPlaybackDeserializationHandlers();
  }
  return v2;
}

- (void)dealloc
{
  __CFDictionary *publisherByEventTimeline;
  __CFArray *eventTimelines;
  NSObject *internalQueue;
  objc_super v6;

  publisherByEventTimeline = self->_publisherByEventTimeline;
  if (publisherByEventTimeline)
    CFRelease(publisherByEventTimeline);

  eventTimelines = self->_eventTimelines;
  if (eventTimelines)
    CFRelease(eventTimelines);

  internalQueue = self->_internalQueue;
  if (internalQueue)
    dispatch_release(internalQueue);
  v6.receiver = self;
  v6.super_class = (Class)AVMetricEventStream;
  -[AVMetricEventStream dealloc](&v6, sel_dealloc);
}

+ (id)eventStream
{
  return objc_alloc_init(AVMetricEventStream);
}

- (id)errorEventWithFigMetricEvent:(OpaqueFigMetricEvent *)a3
{
  uint64_t (*v4)(OpaqueFigMetricEvent *);
  uint64_t v5;
  void (*v6)(__int128 *__return_ptr, OpaqueFigMetricEvent *);
  uint64_t (*v7)(OpaqueFigMetricEvent *);
  void *v8;
  AVMetricErrorEvent *v9;
  uint64_t (*v10)(OpaqueFigMetricEvent *);
  int v11;
  uint64_t (*v12)(OpaqueFigMetricEvent *);
  uint64_t v13;
  AVMetricErrorEvent *v14;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;

  v4 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
  if (v4)
    v5 = v4(a3);
  else
    v5 = 0;
  v18 = 0uLL;
  v19 = 0;
  v6 = *(void (**)(__int128 *__return_ptr, OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                             + 56);
  if (v6)
  {
    v6(&v18, a3);
  }
  else
  {
    v18 = *MEMORY[0x1E0CA2E18];
    v19 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  }
  v7 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
  if (v7)
    v8 = (void *)v7(a3);
  else
    v8 = 0;
  v9 = [AVMetricErrorEvent alloc];
  v10 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 24) + 16);
  if (v10)
    v11 = v10(a3);
  else
    v11 = 0;
  v12 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 24) + 8);
  if (v12)
    v13 = v12(a3);
  else
    v13 = 0;
  v16 = v18;
  v17 = v19;
  v14 = -[AVMetricErrorEvent initWithDate:mediaTime:sessionID:didRecover:error:](v9, "initWithDate:mediaTime:sessionID:didRecover:error:", v5, &v16, v8, v11 != 0, v13);

  return v14;
}

- (id)resourceRequestEventWithFigMetricEvent:(OpaqueFigMetricEvent *)a3
{
  uint64_t (*v4)(OpaqueFigMetricEvent *);
  uint64_t v5;
  void (*v6)(__int128 *__return_ptr, OpaqueFigMetricEvent *);
  uint64_t (*v7)(OpaqueFigMetricEvent *);
  uint64_t (*v8)(OpaqueFigMetricEvent *);
  uint64_t v9;
  uint64_t (*v10)(OpaqueFigMetricEvent *);
  uint64_t v11;
  uint64_t (*v12)(OpaqueFigMetricEvent *);
  uint64_t v13;
  uint64_t (*v14)(OpaqueFigMetricEvent *);
  uint64_t v15;
  uint64_t (*v16)(OpaqueFigMetricEvent *);
  uint64_t v17;
  uint64_t (*v18)(OpaqueFigMetricEvent *);
  uint64_t v19;
  uint64_t (*v20)(OpaqueFigMetricEvent *);
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(OpaqueFigMetricEvent *);
  int v24;
  uint64_t (*v25)(OpaqueFigMetricEvent *);
  uint64_t v26;
  AVMetricErrorEvent *v27;
  uint64_t (*v28)(OpaqueFigMetricEvent *);
  uint64_t v29;
  AVMetricErrorEvent *v30;
  uint64_t (*v31)(OpaqueFigMetricEvent *);
  uint64_t v32;
  uint64_t v33;
  BOOL v34;
  void *v35;
  uint64_t v36;
  AVMetricMediaResourceRequestEvent *v37;
  AVMetricMediaResourceRequestEvent *v38;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  __int128 v45;
  uint64_t v46;
  __int128 v47;
  uint64_t v48;

  v4 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
  if (v4)
    v5 = v4(a3);
  else
    v5 = 0;
  v47 = 0uLL;
  v48 = 0;
  v6 = *(void (**)(__int128 *__return_ptr, OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                             + 56);
  if (v6)
  {
    v6(&v47, a3);
  }
  else
  {
    v47 = *MEMORY[0x1E0CA2E18];
    v48 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  }
  v7 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
  if (v7)
    v44 = (void *)v7(a3);
  else
    v44 = 0;
  v8 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 32) + 8);
  if (v8)
    v9 = v8(a3);
  else
    v9 = 0;
  v10 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 32) + 16);
  if (v10)
    v11 = v10(a3);
  else
    v11 = 0;
  v12 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 32) + 24);
  if (v12)
    v13 = v12(a3);
  else
    v13 = 0;
  v14 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 32) + 32);
  if (v14)
    v15 = v14(a3);
  else
    v15 = 0;
  v16 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 32) + 40);
  if (v16)
    v17 = v16(a3);
  else
    v17 = 0;
  v18 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 32) + 48);
  if (v18)
    v19 = v18(a3);
  else
    v19 = 0;
  v20 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 32) + 56);
  if (v20)
  {
    v21 = v20(a3);
    v41 = v22;
  }
  else
  {
    v21 = 0;
    v41 = 0;
  }
  v23 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 32) + 64);
  if (v23)
    v24 = v23(a3);
  else
    v24 = 0;
  v25 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 32) + 72);
  v42 = v13;
  v43 = v11;
  if (v25 && v25(a3))
  {
    v26 = v9;
    v27 = [AVMetricErrorEvent alloc];
    v28 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 32) + 72);
    if (v28)
      v29 = v28(a3);
    else
      v29 = 0;
    v45 = v47;
    v46 = v48;
    v30 = -[AVMetricErrorEvent initWithDate:mediaTime:sessionID:didRecover:error:](v27, "initWithDate:mediaTime:sessionID:didRecover:error:", v5, &v45, v44, 1, v29);
  }
  else
  {
    v26 = v9;
    v30 = 0;
  }
  v31 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 32) + 80);
  v32 = v5;
  if (v31)
    v33 = v31(a3);
  else
    v33 = 0;
  v34 = v24 != 0;
  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v33, 0);
  objc_msgSend(v35, "setRequiresSecureCoding:", 1);
  v36 = objc_msgSend(v35, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB2CD0]);

  v37 = [AVMetricMediaResourceRequestEvent alloc];
  v45 = v47;
  v46 = v48;
  LOBYTE(v40) = v34;
  v38 = -[AVMetricMediaResourceRequestEvent initWithDate:mediaTime:sessionID:url:serverAddress:requestStartTime:requestEndTime:responseStartTime:responseEndTime:byteRange:readFromCache:errorEvent:networkTransactionMetrics:](v37, "initWithDate:mediaTime:sessionID:url:serverAddress:requestStartTime:requestEndTime:responseStartTime:responseEndTime:byteRange:readFromCache:errorEvent:networkTransactionMetrics:", v32, &v45, v44, v26, v43, v42, v15, v17, v19, v21, v41, v40, v30, v36);

  return v38;
}

- (id)playlistRequestEventWithFigMetricEvent:(OpaqueFigMetricEvent *)a3
{
  uint64_t (*v5)(OpaqueFigMetricEvent *);
  uint64_t v6;
  void (*v7)(__int128 *__return_ptr, OpaqueFigMetricEvent *);
  uint64_t (*v8)(OpaqueFigMetricEvent *);
  void *v9;
  uint64_t (*v10)(OpaqueFigMetricEvent *);
  uint64_t v11;
  uint64_t (*v12)(OpaqueFigMetricEvent *);
  uint64_t v13;
  uint64_t v14;
  id v15;
  AVMetricHLSPlaylistRequestEvent *v16;
  unsigned int (*v17)(OpaqueFigMetricEvent *);
  _BOOL8 v18;
  AVMetricHLSPlaylistRequestEvent *v19;
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;

  v5 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
  if (v5)
    v6 = v5(a3);
  else
    v6 = 0;
  v23 = 0uLL;
  v24 = 0;
  v7 = *(void (**)(__int128 *__return_ptr, OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                             + 56);
  if (v7)
  {
    v7(&v23, a3);
  }
  else
  {
    v23 = *MEMORY[0x1E0CA2E18];
    v24 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  }
  v8 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
  if (v8)
    v9 = (void *)v8(a3);
  else
    v9 = 0;
  v10 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 32) + 8);
  if (v10)
    v11 = v10(a3);
  else
    v11 = 0;
  v12 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 32) + 96);
  if (v12)
    v13 = v12(a3);
  else
    v13 = 1836415096;
  v14 = AVMediaTypeFromCMMediaType(v13);
  v15 = -[AVMetricEventStream resourceRequestEventWithFigMetricEvent:](self, "resourceRequestEventWithFigMetricEvent:", a3);
  v16 = [AVMetricHLSPlaylistRequestEvent alloc];
  v17 = *(unsigned int (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 32) + 88);
  if (v17)
    v18 = v17(a3) != 0;
  else
    v18 = 0;
  v21 = v23;
  v22 = v24;
  v19 = -[AVMetricHLSPlaylistRequestEvent initWithDate:mediaTime:sessionID:url:isMultivariantPlaylist:mediaType:mediaResourceRequestEvent:](v16, "initWithDate:mediaTime:sessionID:url:isMultivariantPlaylist:mediaType:mediaResourceRequestEvent:", v6, &v21, v9, v11, v18, v14, v15);

  return v19;
}

- (id)mediaSegmentRequestEventWithFigMetricEvent:(OpaqueFigMetricEvent *)a3
{
  uint64_t (*v5)(OpaqueFigMetricEvent *);
  uint64_t v6;
  void (*v7)(__int128 *__return_ptr, OpaqueFigMetricEvent *);
  uint64_t (*v8)(OpaqueFigMetricEvent *);
  void *v9;
  uint64_t (*v10)(OpaqueFigMetricEvent *);
  uint64_t v11;
  uint64_t (*v12)(OpaqueFigMetricEvent *);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t (*v17)(OpaqueFigMetricEvent *);
  uint64_t v18;
  uint64_t v19;
  AVMetricHLSMediaSegmentRequestEvent *v20;
  unsigned int (*v21)(OpaqueFigMetricEvent *);
  AVMetricHLSMediaSegmentRequestEvent *v22;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;

  v5 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
  if (v5)
    v6 = v5(a3);
  else
    v6 = 0;
  v27 = 0uLL;
  v28 = 0;
  v7 = *(void (**)(__int128 *__return_ptr, OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                             + 56);
  if (v7)
  {
    v7(&v27, a3);
  }
  else
  {
    v27 = *MEMORY[0x1E0CA2E18];
    v28 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  }
  v8 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
  if (v8)
    v9 = (void *)v8(a3);
  else
    v9 = 0;
  v10 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 32) + 128);
  if (v10)
    v11 = v10(a3);
  else
    v11 = 0;
  v12 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 32) + 56);
  if (v12)
  {
    v13 = v12(a3);
    v15 = v14;
  }
  else
  {
    v13 = 0;
    v15 = 0;
  }
  v16 = -[AVMetricEventStream resourceRequestEventWithFigMetricEvent:](self, "resourceRequestEventWithFigMetricEvent:", a3);
  v17 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 32) + 96);
  if (v17)
    v18 = v17(a3);
  else
    v18 = 1836415096;
  v19 = AVMediaTypeFromCMMediaType(v18);
  v20 = [AVMetricHLSMediaSegmentRequestEvent alloc];
  v21 = *(unsigned int (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 32) + 104);
  if (v21)
    LOBYTE(v21) = v21(a3) != 0;
  v25 = v27;
  v26 = v28;
  LOBYTE(v24) = (_BYTE)v21;
  v22 = -[AVMetricHLSMediaSegmentRequestEvent initWithDate:mediaTime:sessionID:indexFileURL:byteRange:isMapSegment:mediaType:mediaResourceRequestEvent:](v20, "initWithDate:mediaTime:sessionID:indexFileURL:byteRange:isMapSegment:mediaType:mediaResourceRequestEvent:", v6, &v25, v9, v11, v13, v15, v24, v19, v16);

  return v22;
}

- (id)contentKeyRequestEventWithFigMetricEvent:(OpaqueFigMetricEvent *)a3
{
  uint64_t (*v5)(OpaqueFigMetricEvent *);
  uint64_t v6;
  void (*v7)(__int128 *__return_ptr, OpaqueFigMetricEvent *);
  uint64_t (*v8)(OpaqueFigMetricEvent *);
  void *v9;
  id v10;
  uint64_t (*v11)(OpaqueFigMetricEvent *);
  uint64_t v12;
  uint64_t v13;
  void (*v14)(OpaqueFigMetricEvent *);
  const __CFString *v15;
  AVContentKeySpecifier *v16;
  AVContentKeySpecifier *v17;
  AVMetricContentKeyRequestEvent *v18;
  unsigned int (*v19)(OpaqueFigMetricEvent *);
  _BOOL8 v20;
  AVMetricContentKeyRequestEvent *v21;
  __int128 v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;

  v5 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
  if (v5)
    v6 = v5(a3);
  else
    v6 = 0;
  v25 = 0uLL;
  v26 = 0;
  v7 = *(void (**)(__int128 *__return_ptr, OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                             + 56);
  if (v7)
  {
    v7(&v25, a3);
  }
  else
  {
    v25 = *MEMORY[0x1E0CA2E18];
    v26 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  }
  v8 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
  if (v8)
    v9 = (void *)v8(a3);
  else
    v9 = 0;
  v10 = -[AVMetricEventStream resourceRequestEventWithFigMetricEvent:](self, "resourceRequestEventWithFigMetricEvent:", a3);
  v11 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 32) + 96);
  if (v11)
    v12 = v11(a3);
  else
    v12 = 1836415096;
  v13 = AVMediaTypeFromCMMediaType(v12);
  v14 = *(void (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 32) + 112);
  if (v14)
    v14(a3);
  if (FigContentKeySpecifierGetKeySystem() == 1)
  {
    v15 = CFSTR("FairPlayStreaming");
  }
  else
  {
    v15 = CFSTR("ClearKeySystem");
    if (FigContentKeySpecifierGetKeySystem() != 2
      && FigContentKeySpecifierGetKeySystem() == 3)
    {
      v15 = CFSTR("AuthorizationTokenSystem");
    }
  }
  v16 = [AVContentKeySpecifier alloc];
  v17 = -[AVContentKeySpecifier initForKeySystem:identifier:options:](v16, "initForKeySystem:identifier:options:", v15, FigContentKeySpecifierGetIdentifier(), MEMORY[0x1E0C9AA70]);
  v18 = [AVMetricContentKeyRequestEvent alloc];
  v19 = *(unsigned int (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 32) + 120);
  if (v19)
    v20 = v19(a3) != 0;
  else
    v20 = 0;
  v23 = v25;
  v24 = v26;
  v21 = -[AVMetricContentKeyRequestEvent initWithDate:mediaTime:sessionID:contentKeySpecifier:mediaType:isClientInitiated:mediaResourceRequestEvent:](v18, "initWithDate:mediaTime:sessionID:contentKeySpecifier:mediaType:isClientInitiated:mediaResourceRequestEvent:", v6, &v23, v9, v17, v13, v20, v10);

  return v21;
}

- (id)likelyToKeepUpEventWithFigMetricEvent:(OpaqueFigMetricEvent *)a3
{
  uint64_t (*v4)(OpaqueFigMetricEvent *);
  uint64_t v5;
  void (*v6)(__int128 *__return_ptr, OpaqueFigMetricEvent *);
  uint64_t (*v7)(OpaqueFigMetricEvent *);
  void *v8;
  AVAssetVariant *v9;
  uint64_t (*v10)(OpaqueFigMetricEvent *);
  uint64_t v11;
  AVAssetVariant *v12;
  AVMetricPlayerItemLikelyToKeepUpEvent *v13;
  double (*v14)(OpaqueFigMetricEvent *);
  double v15;
  uint64_t (*v16)(OpaqueFigMetricEvent *);
  uint64_t v17;
  AVMetricPlayerItemLikelyToKeepUpEvent *v18;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;

  v4 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
  if (v4)
    v5 = v4(a3);
  else
    v5 = 0;
  v22 = 0uLL;
  v23 = 0;
  v6 = *(void (**)(__int128 *__return_ptr, OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                             + 56);
  if (v6)
  {
    v6(&v22, a3);
  }
  else
  {
    v22 = *MEMORY[0x1E0CA2E18];
    v23 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  }
  v7 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
  if (v7)
    v8 = (void *)v7(a3);
  else
    v8 = 0;
  v9 = [AVAssetVariant alloc];
  v10 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 40) + 8);
  if (v10)
    v11 = v10(a3);
  else
    v11 = 0;
  v12 = -[AVAssetVariant initWithFigAlternate:](v9, "initWithFigAlternate:", v11);
  v13 = [AVMetricPlayerItemLikelyToKeepUpEvent alloc];
  v14 = *(double (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 40) + 48);
  if (v14)
    v15 = v14(a3);
  else
    v15 = 0.0;
  v16 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 40) + 16);
  if (v16)
    v17 = v16(a3);
  else
    v17 = 0;
  v20 = v22;
  v21 = v23;
  v18 = -[AVMetricPlayerItemLikelyToKeepUpEvent initWithDate:mediaTime:sessionID:variant:timeTaken:loadedTimeRanges:](v13, "initWithDate:mediaTime:sessionID:variant:timeTaken:loadedTimeRanges:", v5, &v20, v8, v12, v17, v15);

  return v18;
}

- (id)initialLikelyToKeepUpEventWithFigMetricEvent:(OpaqueFigMetricEvent *)a3
{
  uint64_t (*v5)(OpaqueFigMetricEvent *);
  uint64_t v6;
  void (*v7)(__int128 *__return_ptr, OpaqueFigMetricEvent *);
  uint64_t (*v8)(OpaqueFigMetricEvent *);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  AVAssetVariant *v13;
  uint64_t (*v14)(OpaqueFigMetricEvent *);
  uint64_t v15;
  AVAssetVariant *v16;
  uint64_t (*v17)(OpaqueFigMetricEvent *);
  const __CFArray *v18;
  CFIndex v19;
  CFIndex i;
  uint64_t (*v21)(OpaqueFigMetricEvent *);
  const __CFArray *v22;
  CFIndex v23;
  CFIndex j;
  uint64_t (*v25)(OpaqueFigMetricEvent *);
  const __CFArray *v26;
  CFIndex v27;
  CFIndex k;
  AVMetricPlayerItemInitialLikelyToKeepUpEvent *v29;
  double (*v30)(OpaqueFigMetricEvent *);
  double v31;
  uint64_t (*v32)(OpaqueFigMetricEvent *);
  uint64_t v33;
  AVMetricPlayerItemInitialLikelyToKeepUpEvent *v34;
  __int128 v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;

  v5 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
  if (v5)
    v6 = v5(a3);
  else
    v6 = 0;
  v38 = 0uLL;
  v39 = 0;
  v7 = *(void (**)(__int128 *__return_ptr, OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                             + 56);
  if (v7)
  {
    v7(&v38, a3);
  }
  else
  {
    v38 = *MEMORY[0x1E0CA2E18];
    v39 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  }
  v8 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
  if (v8)
    v9 = (void *)v8(a3);
  else
    v9 = 0;
  v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = [AVAssetVariant alloc];
  v14 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 40) + 8);
  if (v14)
    v15 = v14(a3);
  else
    v15 = 0;
  v16 = -[AVAssetVariant initWithFigAlternate:](v13, "initWithFigAlternate:", v15);
  v17 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 40) + 24);
  if (v17)
    v18 = (const __CFArray *)v17(a3);
  else
    v18 = 0;
  v19 = 0;
  if (!v18)
    goto LABEL_18;
LABEL_17:
  for (i = CFArrayGetCount(v18); v19 < i; i = 0)
  {
    objc_msgSend(v10, "addObject:", -[AVMetricEventStream playlistRequestEventWithFigMetricEvent:](self, "playlistRequestEventWithFigMetricEvent:", CFArrayGetValueAtIndex(v18, v19++)));
    if (v18)
      goto LABEL_17;
LABEL_18:
    ;
  }
  v21 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 40) + 32);
  if (v21)
    v22 = (const __CFArray *)v21(a3);
  else
    v22 = 0;
  v23 = 0;
  if (!v22)
    goto LABEL_27;
LABEL_26:
  for (j = CFArrayGetCount(v22); v23 < j; j = 0)
  {
    objc_msgSend(v11, "addObject:", -[AVMetricEventStream mediaSegmentRequestEventWithFigMetricEvent:](self, "mediaSegmentRequestEventWithFigMetricEvent:", CFArrayGetValueAtIndex(v22, v23++)));
    if (v22)
      goto LABEL_26;
LABEL_27:
    ;
  }
  v25 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 40) + 40);
  if (v25)
    v26 = (const __CFArray *)v25(a3);
  else
    v26 = 0;
  v27 = 0;
  if (!v26)
    goto LABEL_36;
LABEL_35:
  for (k = CFArrayGetCount(v26); v27 < k; k = 0)
  {
    objc_msgSend(v12, "addObject:", -[AVMetricEventStream contentKeyRequestEventWithFigMetricEvent:](self, "contentKeyRequestEventWithFigMetricEvent:", CFArrayGetValueAtIndex(v26, v27++)));
    if (v26)
      goto LABEL_35;
LABEL_36:
    ;
  }
  v29 = [AVMetricPlayerItemInitialLikelyToKeepUpEvent alloc];
  v30 = *(double (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 40) + 48);
  if (v30)
    v31 = v30(a3);
  else
    v31 = 0.0;
  v32 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 40) + 16);
  if (v32)
    v33 = v32(a3);
  else
    v33 = 0;
  v36 = v38;
  v37 = v39;
  v34 = -[AVMetricPlayerItemInitialLikelyToKeepUpEvent initWithDate:mediaTime:sessionID:variant:timeTaken:loadedTimeRanges:playlistRequestEvents:mediaSegmentRequestEvents:contentKeyRequestEvents:](v29, "initWithDate:mediaTime:sessionID:variant:timeTaken:loadedTimeRanges:playlistRequestEvents:mediaSegmentRequestEvents:contentKeyRequestEvents:", v6, &v36, v9, v16, v33, v10, v31, v11, v12);

  return v34;
}

- (id)rateChangeEventWithFigMetricEvent:(OpaqueFigMetricEvent *)a3
{
  uint64_t (*v4)(OpaqueFigMetricEvent *);
  uint64_t v5;
  void (*v6)(__int128 *__return_ptr, OpaqueFigMetricEvent *);
  uint64_t (*v7)(OpaqueFigMetricEvent *);
  void *v8;
  uint64_t (*v9)(OpaqueFigMetricEvent *);
  AVAssetVariant *v10;
  AVMetricPlayerItemRateChangeEvent *v11;
  double (*v12)(OpaqueFigMetricEvent *);
  double v13;
  double v14;
  double (*v15)(OpaqueFigMetricEvent *);
  AVMetricPlayerItemRateChangeEvent *v16;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;

  v4 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
  if (v4)
    v5 = v4(a3);
  else
    v5 = 0;
  v20 = 0uLL;
  v21 = 0;
  v6 = *(void (**)(__int128 *__return_ptr, OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                             + 56);
  if (v6)
  {
    v6(&v20, a3);
  }
  else
  {
    v20 = *MEMORY[0x1E0CA2E18];
    v21 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  }
  v7 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
  if (v7)
    v8 = (void *)v7(a3);
  else
    v8 = 0;
  v9 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 48) + 8);
  if (v9)
  {
    v10 = (AVAssetVariant *)v9(a3);
    if (v10)
      v10 = -[AVAssetVariant initWithFigAlternate:]([AVAssetVariant alloc], "initWithFigAlternate:", v10);
  }
  else
  {
    v10 = 0;
  }
  v11 = [AVMetricPlayerItemRateChangeEvent alloc];
  v12 = *(double (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 48) + 16);
  v13 = 0.0;
  v14 = 0.0;
  if (v12)
    v14 = v12(a3);
  v15 = *(double (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 48) + 24);
  if (v15)
    v13 = v15(a3);
  v18 = v20;
  v19 = v21;
  v16 = -[AVMetricPlayerItemRateChangeEvent initWithDate:mediaTime:sessionID:variant:rate:previousRate:](v11, "initWithDate:mediaTime:sessionID:variant:rate:previousRate:", v5, &v18, v8, v10, v14, v13);

  return v16;
}

- (id)stallEventWithFigMetricEvent:(OpaqueFigMetricEvent *)a3
{
  uint64_t (*v4)(OpaqueFigMetricEvent *);
  uint64_t v5;
  void (*v6)(__int128 *__return_ptr, OpaqueFigMetricEvent *);
  uint64_t (*v7)(OpaqueFigMetricEvent *);
  void *v8;
  uint64_t (*v9)(OpaqueFigMetricEvent *);
  AVAssetVariant *v10;
  AVMetricPlayerItemStallEvent *v11;
  double (*v12)(OpaqueFigMetricEvent *);
  double v13;
  double v14;
  double (*v15)(OpaqueFigMetricEvent *);
  AVMetricPlayerItemStallEvent *v16;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;

  v4 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
  if (v4)
    v5 = v4(a3);
  else
    v5 = 0;
  v20 = 0uLL;
  v21 = 0;
  v6 = *(void (**)(__int128 *__return_ptr, OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                             + 56);
  if (v6)
  {
    v6(&v20, a3);
  }
  else
  {
    v20 = *MEMORY[0x1E0CA2E18];
    v21 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  }
  v7 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
  if (v7)
    v8 = (void *)v7(a3);
  else
    v8 = 0;
  v9 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 48) + 8);
  if (v9)
  {
    v10 = (AVAssetVariant *)v9(a3);
    if (v10)
      v10 = -[AVAssetVariant initWithFigAlternate:]([AVAssetVariant alloc], "initWithFigAlternate:", v10);
  }
  else
  {
    v10 = 0;
  }
  v11 = [AVMetricPlayerItemStallEvent alloc];
  v12 = *(double (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 48) + 16);
  v13 = 0.0;
  v14 = 0.0;
  if (v12)
    v14 = v12(a3);
  v15 = *(double (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 48) + 24);
  if (v15)
    v13 = v15(a3);
  v18 = v20;
  v19 = v21;
  v16 = -[AVMetricPlayerItemRateChangeEvent initWithDate:mediaTime:sessionID:variant:rate:previousRate:](v11, "initWithDate:mediaTime:sessionID:variant:rate:previousRate:", v5, &v18, v8, v10, v14, v13);

  return v16;
}

- (id)seekEventWithFigMetricEvent:(OpaqueFigMetricEvent *)a3
{
  uint64_t (*v4)(OpaqueFigMetricEvent *);
  uint64_t v5;
  void (*v6)(__int128 *__return_ptr, OpaqueFigMetricEvent *);
  uint64_t (*v7)(OpaqueFigMetricEvent *);
  void *v8;
  uint64_t (*v9)(OpaqueFigMetricEvent *);
  AVAssetVariant *v10;
  AVMetricPlayerItemSeekEvent *v11;
  double (*v12)(OpaqueFigMetricEvent *);
  double v13;
  double v14;
  double (*v15)(OpaqueFigMetricEvent *);
  AVMetricPlayerItemSeekEvent *v16;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;

  v4 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
  if (v4)
    v5 = v4(a3);
  else
    v5 = 0;
  v20 = 0uLL;
  v21 = 0;
  v6 = *(void (**)(__int128 *__return_ptr, OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                             + 56);
  if (v6)
  {
    v6(&v20, a3);
  }
  else
  {
    v20 = *MEMORY[0x1E0CA2E18];
    v21 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  }
  v7 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
  if (v7)
    v8 = (void *)v7(a3);
  else
    v8 = 0;
  v9 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 48) + 8);
  if (v9)
  {
    v10 = (AVAssetVariant *)v9(a3);
    if (v10)
      v10 = -[AVAssetVariant initWithFigAlternate:]([AVAssetVariant alloc], "initWithFigAlternate:", v10);
  }
  else
  {
    v10 = 0;
  }
  v11 = [AVMetricPlayerItemSeekEvent alloc];
  v12 = *(double (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 48) + 16);
  v13 = 0.0;
  v14 = 0.0;
  if (v12)
    v14 = v12(a3);
  v15 = *(double (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 48) + 24);
  if (v15)
    v13 = v15(a3);
  v18 = v20;
  v19 = v21;
  v16 = -[AVMetricPlayerItemRateChangeEvent initWithDate:mediaTime:sessionID:variant:rate:previousRate:](v11, "initWithDate:mediaTime:sessionID:variant:rate:previousRate:", v5, &v18, v8, v10, v14, v13);

  return v16;
}

- (id)seekDidCompleteEventWithFigMetricEvent:(OpaqueFigMetricEvent *)a3
{
  uint64_t (*v4)(OpaqueFigMetricEvent *);
  uint64_t v5;
  void (*v6)(__int128 *__return_ptr, OpaqueFigMetricEvent *);
  uint64_t (*v7)(OpaqueFigMetricEvent *);
  void *v8;
  uint64_t (*v9)(OpaqueFigMetricEvent *);
  AVAssetVariant *v10;
  AVMetricPlayerItemSeekDidCompleteEvent *v11;
  uint64_t (*v12)(OpaqueFigMetricEvent *);
  int v13;
  double (*v14)(OpaqueFigMetricEvent *);
  double v15;
  double v16;
  double (*v17)(OpaqueFigMetricEvent *);
  AVMetricPlayerItemSeekDidCompleteEvent *v18;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;

  v4 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
  if (v4)
    v5 = v4(a3);
  else
    v5 = 0;
  v22 = 0uLL;
  v23 = 0;
  v6 = *(void (**)(__int128 *__return_ptr, OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                             + 56);
  if (v6)
  {
    v6(&v22, a3);
  }
  else
  {
    v22 = *MEMORY[0x1E0CA2E18];
    v23 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  }
  v7 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
  if (v7)
    v8 = (void *)v7(a3);
  else
    v8 = 0;
  v9 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 48) + 8);
  if (v9)
  {
    v10 = (AVAssetVariant *)v9(a3);
    if (v10)
      v10 = -[AVAssetVariant initWithFigAlternate:]([AVAssetVariant alloc], "initWithFigAlternate:", v10);
  }
  else
  {
    v10 = 0;
  }
  v11 = [AVMetricPlayerItemSeekDidCompleteEvent alloc];
  v12 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 48) + 32);
  if (v12)
    v13 = v12(a3);
  else
    v13 = 0;
  v14 = *(double (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 48) + 16);
  v15 = 0.0;
  v16 = 0.0;
  if (v14)
    v16 = v14(a3);
  v17 = *(double (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 48) + 24);
  if (v17)
    v15 = v17(a3);
  v20 = v22;
  v21 = v23;
  v18 = -[AVMetricPlayerItemSeekDidCompleteEvent initWithDate:mediaTime:sessionID:variant:didSeekInBuffer:rate:previousRate:](v11, "initWithDate:mediaTime:sessionID:variant:didSeekInBuffer:rate:previousRate:", v5, &v20, v8, v10, v13 != 0, v16, v15);

  return v18;
}

- (id)variantChangeEventWithFigMetricEvent:(OpaqueFigMetricEvent *)a3
{
  uint64_t (*v4)(OpaqueFigMetricEvent *);
  uint64_t v5;
  void (*v6)(__int128 *__return_ptr, OpaqueFigMetricEvent *);
  uint64_t (*v7)(OpaqueFigMetricEvent *);
  void *v8;
  uint64_t (*v9)(OpaqueFigMetricEvent *);
  AVAssetVariant *v10;
  uint64_t (*v11)(OpaqueFigMetricEvent *);
  AVAssetVariant *v12;
  AVMetricPlayerItemVariantSwitchEvent *v13;
  uint64_t (*v14)(OpaqueFigMetricEvent *);
  uint64_t v15;
  unsigned int (*v16)(OpaqueFigMetricEvent *);
  AVMetricPlayerItemVariantSwitchEvent *v17;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;

  v4 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
  if (v4)
    v5 = v4(a3);
  else
    v5 = 0;
  v22 = 0uLL;
  v23 = 0;
  v6 = *(void (**)(__int128 *__return_ptr, OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                             + 56);
  if (v6)
  {
    v6(&v22, a3);
  }
  else
  {
    v22 = *MEMORY[0x1E0CA2E18];
    v23 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  }
  v7 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
  if (v7)
    v8 = (void *)v7(a3);
  else
    v8 = 0;
  v9 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 56) + 16);
  if (v9)
    v10 = (AVAssetVariant *)v9(a3);
  else
    v10 = 0;
  v11 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 56) + 8);
  if (v11)
  {
    v12 = (AVAssetVariant *)v11(a3);
    if (v12)
      v12 = -[AVAssetVariant initWithFigAlternate:]([AVAssetVariant alloc], "initWithFigAlternate:", v12);
    if (v10)
      goto LABEL_17;
  }
  else
  {
    v12 = 0;
    if (v10)
LABEL_17:
      v10 = -[AVAssetVariant initWithFigAlternate:]([AVAssetVariant alloc], "initWithFigAlternate:", v10);
  }
  v13 = [AVMetricPlayerItemVariantSwitchEvent alloc];
  v14 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 56) + 24);
  if (v14)
    v15 = v14(a3);
  else
    v15 = 0;
  v16 = *(unsigned int (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 56) + 32);
  if (v16)
    LOBYTE(v16) = v16(a3) != 0;
  v20 = v22;
  v21 = v23;
  LOBYTE(v19) = (_BYTE)v16;
  v17 = -[AVMetricPlayerItemVariantSwitchEvent initWithDate:mediaTime:sessionID:fromVariant:toVariant:loadedTimeRanges:didSucceed:](v13, "initWithDate:mediaTime:sessionID:fromVariant:toVariant:loadedTimeRanges:didSucceed:", v5, &v20, v8, v10, v12, v15, v19);

  return v17;
}

- (id)variantChangeStartEventWithFigMetricEvent:(OpaqueFigMetricEvent *)a3
{
  uint64_t (*v4)(OpaqueFigMetricEvent *);
  uint64_t v5;
  void (*v6)(__int128 *__return_ptr, OpaqueFigMetricEvent *);
  uint64_t (*v7)(OpaqueFigMetricEvent *);
  void *v8;
  uint64_t (*v9)(OpaqueFigMetricEvent *);
  AVAssetVariant *v10;
  uint64_t (*v11)(OpaqueFigMetricEvent *);
  AVAssetVariant *v12;
  AVMetricPlayerItemVariantSwitchStartEvent *v13;
  uint64_t (*v14)(OpaqueFigMetricEvent *);
  uint64_t v15;
  AVMetricPlayerItemVariantSwitchStartEvent *v16;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;

  v4 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
  if (v4)
    v5 = v4(a3);
  else
    v5 = 0;
  v20 = 0uLL;
  v21 = 0;
  v6 = *(void (**)(__int128 *__return_ptr, OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                             + 56);
  if (v6)
  {
    v6(&v20, a3);
  }
  else
  {
    v20 = *MEMORY[0x1E0CA2E18];
    v21 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  }
  v7 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
  if (v7)
    v8 = (void *)v7(a3);
  else
    v8 = 0;
  v9 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 80) + 16);
  if (v9)
    v10 = (AVAssetVariant *)v9(a3);
  else
    v10 = 0;
  v11 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 80) + 8);
  if (v11)
  {
    v12 = (AVAssetVariant *)v11(a3);
    if (v12)
      v12 = -[AVAssetVariant initWithFigAlternate:]([AVAssetVariant alloc], "initWithFigAlternate:", v12);
    if (v10)
      goto LABEL_17;
  }
  else
  {
    v12 = 0;
    if (v10)
LABEL_17:
      v10 = -[AVAssetVariant initWithFigAlternate:]([AVAssetVariant alloc], "initWithFigAlternate:", v10);
  }
  v13 = [AVMetricPlayerItemVariantSwitchStartEvent alloc];
  v14 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 80) + 24);
  if (v14)
    v15 = v14(a3);
  else
    v15 = 0;
  v18 = v20;
  v19 = v21;
  v16 = -[AVMetricPlayerItemVariantSwitchStartEvent initWithDate:mediaTime:sessionID:fromVariant:toVariant:loadedTimeRanges:](v13, "initWithDate:mediaTime:sessionID:fromVariant:toVariant:loadedTimeRanges:", v5, &v18, v8, v10, v12, v15);

  return v16;
}

- (id)playbackSummaryEventWithFigMetricEvent:(OpaqueFigMetricEvent *)a3
{
  uint64_t (*v5)(OpaqueFigMetricEvent *);
  void (*v6)(__int128 *__return_ptr, OpaqueFigMetricEvent *);
  uint64_t (*v7)(OpaqueFigMetricEvent *);
  void *v8;
  uint64_t (*v9)(OpaqueFigMetricEvent *);
  uint64_t v10;
  id v11;
  AVMetricPlayerItemPlaybackSummaryEvent *v12;
  uint64_t (*v13)(OpaqueFigMetricEvent *);
  uint64_t v14;
  uint64_t (*v15)(OpaqueFigMetricEvent *);
  uint64_t v16;
  uint64_t (*v17)(OpaqueFigMetricEvent *);
  uint64_t v18;
  uint64_t (*v19)(OpaqueFigMetricEvent *);
  uint64_t v20;
  uint64_t (*v21)(OpaqueFigMetricEvent *);
  uint64_t v22;
  double (*v23)(OpaqueFigMetricEvent *);
  double v24;
  double v25;
  double (*v26)(OpaqueFigMetricEvent *);
  uint64_t (*v27)(OpaqueFigMetricEvent *);
  uint64_t v28;
  uint64_t (*v29)(OpaqueFigMetricEvent *);
  uint64_t v30;
  AVMetricPlayerItemPlaybackSummaryEvent *v31;
  uint64_t v33;
  __int128 v34;
  uint64_t v35;
  __int128 v36;
  uint64_t v37;

  v5 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
  if (v5)
    v33 = v5(a3);
  else
    v33 = 0;
  v36 = 0uLL;
  v37 = 0;
  v6 = *(void (**)(__int128 *__return_ptr, OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                             + 56);
  if (v6)
  {
    v6(&v36, a3);
  }
  else
  {
    v36 = *MEMORY[0x1E0CA2E18];
    v37 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  }
  v7 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
  if (v7)
    v8 = (void *)v7(a3);
  else
    v8 = 0;
  v9 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 72) + 8);
  if (v9 && (v10 = v9(a3)) != 0)
    v11 = -[AVMetricEventStream errorEventWithFigMetricEvent:](self, "errorEventWithFigMetricEvent:", v10);
  else
    v11 = 0;
  v12 = [AVMetricPlayerItemPlaybackSummaryEvent alloc];
  v13 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 72) + 16);
  if (v13)
    v14 = v13(a3);
  else
    v14 = 0;
  v15 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 72) + 24);
  if (v15)
    v16 = v15(a3);
  else
    v16 = 0;
  v17 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 72) + 32);
  if (v17)
    v18 = v17(a3);
  else
    v18 = 0;
  v19 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 72) + 40);
  if (v19)
    v20 = v19(a3);
  else
    v20 = 0;
  v21 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 72) + 48);
  if (v21)
    v22 = v21(a3);
  else
    v22 = 0;
  v23 = *(double (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 72) + 56);
  v24 = 0.0;
  v25 = 0.0;
  if (v23)
    v25 = v23(a3);
  v26 = *(double (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 72) + 64);
  if (v26)
    v24 = v26(a3);
  v27 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 72) + 72);
  if (v27)
    v28 = v27(a3);
  else
    v28 = 0;
  v29 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 72) + 80);
  if (v29)
    v30 = v29(a3);
  else
    v30 = 0;
  v34 = v36;
  v35 = v37;
  v31 = -[AVMetricPlayerItemPlaybackSummaryEvent initWithDate:mediaTime:sessionID:errorEvent:recoverableErrorCount:stallCount:variantSwitchCount:playbackDuration:mediaResourceRequestCount:timeSpentRecoveringFromStall:timeSpentInInitialStartup:timeWeightedAverageBitrate:timeWeightedPeakBitrate:](v12, "initWithDate:mediaTime:sessionID:errorEvent:recoverableErrorCount:stallCount:variantSwitchCount:playbackDuration:mediaResourceRequestCount:timeSpentRecoveringFromStall:timeSpentInInitialStartup:timeWeightedAverageBitrate:timeWeightedPeakBitrate:", v33, &v34, v8, v11, v14, v16, v25, v24, v18, v20, v22, v28, v30);

  return v31;
}

- (id)metricEventForFigMetricEvent:(OpaqueFigMetricEvent *)a3
{
  uint64_t (*v5)(OpaqueFigMetricEvent *);
  id result;

  v5 = *(uint64_t (**)(OpaqueFigMetricEvent *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
  if (!v5)
    return 0;
  switch(v5(a3))
  {
    case 0:
      result = -[AVMetricEventStream playlistRequestEventWithFigMetricEvent:](self, "playlistRequestEventWithFigMetricEvent:", a3);
      break;
    case 1:
      result = -[AVMetricEventStream mediaSegmentRequestEventWithFigMetricEvent:](self, "mediaSegmentRequestEventWithFigMetricEvent:", a3);
      break;
    case 2:
      result = -[AVMetricEventStream contentKeyRequestEventWithFigMetricEvent:](self, "contentKeyRequestEventWithFigMetricEvent:", a3);
      break;
    case 4:
      result = -[AVMetricEventStream initialLikelyToKeepUpEventWithFigMetricEvent:](self, "initialLikelyToKeepUpEventWithFigMetricEvent:", a3);
      break;
    case 5:
      result = -[AVMetricEventStream likelyToKeepUpEventWithFigMetricEvent:](self, "likelyToKeepUpEventWithFigMetricEvent:", a3);
      break;
    case 6:
      result = -[AVMetricEventStream variantChangeEventWithFigMetricEvent:](self, "variantChangeEventWithFigMetricEvent:", a3);
      break;
    case 7:
      result = -[AVMetricEventStream variantChangeStartEventWithFigMetricEvent:](self, "variantChangeStartEventWithFigMetricEvent:", a3);
      break;
    case 8:
      result = -[AVMetricEventStream stallEventWithFigMetricEvent:](self, "stallEventWithFigMetricEvent:", a3);
      break;
    case 9:
      result = -[AVMetricEventStream rateChangeEventWithFigMetricEvent:](self, "rateChangeEventWithFigMetricEvent:", a3);
      break;
    case 10:
      result = -[AVMetricEventStream seekEventWithFigMetricEvent:](self, "seekEventWithFigMetricEvent:", a3);
      break;
    case 11:
      result = -[AVMetricEventStream seekDidCompleteEventWithFigMetricEvent:](self, "seekDidCompleteEventWithFigMetricEvent:", a3);
      break;
    case 12:
      result = -[AVMetricEventStream errorEventWithFigMetricEvent:](self, "errorEventWithFigMetricEvent:", a3);
      break;
    case 14:
      result = -[AVMetricEventStream playbackSummaryEventWithFigMetricEvent:](self, "playbackSummaryEventWithFigMetricEvent:", a3);
      break;
    default:
      return 0;
  }
  return result;
}

- (int64_t)getFigMetricEventIDForAVMetricClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3)
    return 12;
  if ((Class)objc_opt_class() == a3)
    return 1;
  if ((Class)objc_opt_class() == a3)
    return 0;
  if ((Class)objc_opt_class() == a3)
    return 2;
  if ((Class)objc_opt_class() == a3)
    return 5;
  if ((Class)objc_opt_class() == a3)
    return 4;
  if ((Class)objc_opt_class() == a3)
    return 9;
  if ((Class)objc_opt_class() == a3)
    return 8;
  if ((Class)objc_opt_class() == a3)
    return 10;
  if ((Class)objc_opt_class() == a3)
    return 11;
  if ((Class)objc_opt_class() == a3)
    return 6;
  if ((Class)objc_opt_class() == a3)
    return 14;
  if ((Class)objc_opt_class() == a3)
    return 7;
  return -1;
}

- (void)didReceiveEventForMetricEventTimeline:(OpaqueFigMetricEventTimeline *)a3 event:(OpaqueFigMetricEvent *)a4
{
  id v6;
  const void *Value;
  AVWeakReferencingDelegateStorage *delegateStorage;
  _QWORD v9[6];

  if (a3)
  {
    if (a4)
    {
      v6 = -[AVMetricEventStream metricEventForFigMetricEvent:](self, "metricEventForFigMetricEvent:", a4);
      Value = CFDictionaryGetValue(self->_publisherByEventTimeline, a3);
      delegateStorage = self->_delegateStorage;
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __67__AVMetricEventStream_didReceiveEventForMetricEventTimeline_event___block_invoke;
      v9[3] = &unk_1E30349A0;
      v9[4] = Value;
      v9[5] = v6;
      -[AVWeakReferencingDelegateStorage invokeDelegateCallbackWithBlock:](delegateStorage, "invokeDelegateCallbackWithBlock:", v9);
    }
  }
}

uint64_t __67__AVMetricEventStream_didReceiveEventForMetricEventTimeline_event___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(a2, "publisher:didReceiveEvent:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  return result;
}

- (void)addPublisher:(id)a3 eventTimeline:(OpaqueFigMetricEventTimeline *)a4
{
  NSObject *internalQueue;
  _QWORD block[7];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__AVMetricEventStream_addPublisher_eventTimeline___block_invoke;
  block[3] = &unk_1E302FEE0;
  block[5] = a3;
  block[6] = a4;
  block[4] = self;
  dispatch_sync(internalQueue, block);
}

_QWORD *__50__AVMetricEventStream_addPublisher_eventTimeline___block_invoke(_QWORD *result)
{
  const void *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, void *, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, uint64_t);
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v1 = (const void *)result[6];
  if (v1)
  {
    v2 = result;
    CFArrayAppendValue(*(CFMutableArrayRef *)(result[4] + 24), v1);
    objc_msgSend(*(id *)(v2[4] + 16), "addObject:", v2[5]);
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(v2[4] + 8), (const void *)v2[6], (const void *)v2[5]);
    v3 = v2[6];
    v4 = v2[4];
    v5 = *(_QWORD *)(v4 + 56);
    v6 = *(void (**)(uint64_t, uint64_t, void *, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
    if (v6)
      v6(v3, v4, &_block_invoke_subscriberCallbacks, v5);
    v7 = v2[4];
    if (*(_BYTE *)(v7 + 48))
    {
      v8 = v2[6];
      result = (_QWORD *)CMBaseObjectGetVTable();
      v9 = *(uint64_t (**)(uint64_t, uint64_t))(result[2] + 32);
      if (v9)
        return (_QWORD *)v9(v8, v7);
    }
    else
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v10 = *(void **)(v7 + 40);
      result = (_QWORD *)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (result)
      {
        v11 = result;
        v12 = *(_QWORD *)v19;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v19 != v12)
              objc_enumerationMutation(v10);
            v14 = objc_msgSend((id)v2[4], "getFigMetricEventIDForAVMetricClass:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v13));
            v15 = v2[6];
            v16 = v2[4];
            v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
            if (v17)
              v17(v15, v16, v14);
            v13 = (_QWORD *)((char *)v13 + 1);
          }
          while (v11 != v13);
          result = (_QWORD *)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          v11 = result;
        }
        while (result);
      }
    }
  }
  return result;
}

- (BOOL)addPublisher:(id)a3
{
  _QWORD v5[5];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__AVMetricEventStream_addPublisher___block_invoke;
  v5[3] = &unk_1E30349C8;
  objc_copyWeak(&v6, &location);
  v5[4] = a3;
  objc_msgSend(a3, "getEventTimelineWithCompletionHandler:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return 1;
}

id __36__AVMetricEventStream_addPublisher___block_invoke(uint64_t a1, uint64_t a2)
{
  id result;

  result = objc_loadWeak((id *)(a1 + 40));
  if (a2)
    return (id)objc_msgSend(result, "addPublisher:eventTimeline:", *(_QWORD *)(a1 + 32), a2);
  return result;
}

- (BOOL)setSubscriber:(id)a3 queue:(id)a4
{
  NSObject *internalQueue;
  _QWORD block[7];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__AVMetricEventStream_setSubscriber_queue___block_invoke;
  block[3] = &unk_1E302FD88;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_sync(internalQueue, block);
  return 1;
}

uint64_t __43__AVMetricEventStream_setSubscriber_queue___block_invoke(_QWORD *a1)
{
  void *v2;

  v2 = *(void **)(a1[4] + 32);
  if (!v2)
  {
    *(_QWORD *)(a1[4] + 32) = objc_alloc_init(AVWeakReferencingDelegateStorage);
    v2 = *(void **)(a1[4] + 32);
  }
  return objc_msgSend(v2, "setDelegate:queue:", a1[5], a1[6]);
}

- (void)subscribeToMetricEvent:(Class)a3
{
  NSObject *internalQueue;
  _QWORD v4[6];

  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__AVMetricEventStream_subscribeToMetricEvent___block_invoke;
  v4[3] = &unk_1E302FCE8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(internalQueue, v4);
}

const __CFArray *__46__AVMetricEventStream_subscribeToMetricEvent___block_invoke(uint64_t a1)
{
  CFIndex i;
  const __CFArray *result;
  const void *ValueAtIndex;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(const void *, uint64_t, uint64_t);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addObject:", *(_QWORD *)(a1 + 40));
  for (i = 0; ; ++i)
  {
    result = *(const __CFArray **)(*(_QWORD *)(a1 + 32) + 24);
    if (result)
      result = (const __CFArray *)CFArrayGetCount(result);
    if (i >= (uint64_t)result)
      break;
    ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(*(_QWORD *)(a1 + 32) + 24), i);
    v5 = objc_msgSend(*(id *)(a1 + 32), "getFigMetricEventIDForAVMetricClass:", *(_QWORD *)(a1 + 40));
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void (**)(const void *, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
    if (v7)
      v7(ValueAtIndex, v6, v5);
  }
  return result;
}

- (void)subscribeToMetricEvents:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(a3);
        -[AVMetricEventStream subscribeToMetricEvent:](self, "subscribeToMetricEvent:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
}

- (void)subscribeToAllMetricEvents
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__AVMetricEventStream_subscribeToAllMetricEvents__block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

const __CFArray *__49__AVMetricEventStream_subscribeToAllMetricEvents__block_invoke(uint64_t a1)
{
  CFIndex v2;
  const __CFArray *result;
  const void *ValueAtIndex;
  uint64_t v5;
  void (*v6)(const void *, uint64_t);

  v2 = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) = 1;
  while (1)
  {
    result = *(const __CFArray **)(*(_QWORD *)(a1 + 32) + 24);
    if (result)
      result = (const __CFArray *)CFArrayGetCount(result);
    if (v2 >= (uint64_t)result)
      break;
    ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(*(_QWORD *)(a1 + 32) + 24), v2);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void (**)(const void *, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
    if (v6)
      v6(ValueAtIndex, v5);
    ++v2;
  }
  return result;
}

@end
