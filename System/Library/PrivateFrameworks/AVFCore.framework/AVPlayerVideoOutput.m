@implementation AVPlayerVideoOutput

- (BOOL)_setupWithOutputSpecification:(id)a3 exceptionReasonOut:(id *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL result;
  const __CFString *v13;
  void *v14;
  uint64_t v15;

  if (a3)
  {
    if (objc_msgSend(a3, "preferredTagCollections")
      && objc_msgSend((id)objc_msgSend(a3, "preferredTagCollections"), "count"))
    {
      self->_outputSpecification = (AVVideoOutputSpecification *)objc_msgSend(a3, "copy");
      self->_receiverState.stateQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.avplayervideooutput.state", 0);
      self->_iVarAccessQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avfoundation.avplayervideooutput.ivars");
      return 1;
    }
    if (a4)
    {
      v13 = CFSTR("AVPlayerVideoOutput: Received malformed outputSpecification");
      goto LABEL_9;
    }
  }
  else if (a4)
  {
    v13 = CFSTR("AVPlayerVideoOutput: outputSpecification cannot be nil.");
LABEL_9:
    v14 = (void *)AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v13, (uint64_t)a4, v4, v5, v6, v7, v15);
    result = 0;
    *a4 = v14;
    return result;
  }
  return 0;
}

- (AVPlayerVideoOutput)initWithSpecification:(id)a3
{
  AVPlayerVideoOutput *v5;
  AVPlayerVideoOutput *v6;
  AVPlayerVideoOutput *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)AVPlayerVideoOutput;
  v5 = -[AVPlayerVideoOutput init](&v17, sel_init);
  v6 = v5;
  if (v5)
  {
    v16 = 0;
    if (!-[AVPlayerVideoOutput _setupWithOutputSpecification:exceptionReasonOut:](v5, "_setupWithOutputSpecification:exceptionReasonOut:", a3, &v16))
    {
      v7 = v6;
      if (v16)
      {
        v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v6, a2, v16, v8, v9, v10, v11, v12, v15), 0);
        objc_exception_throw(v14);
      }
      return 0;
    }
  }
  return v6;
}

- (void)dealloc
{
  OpaqueFigVideoReceiver *videoReceiver;
  OpaqueFigVideoTarget *videoTarget;
  NSObject *stateQueue;
  NSObject *iVarAccessQueue;
  OpaqueCMTaggedBufferGroup *lastSeenTaggedBufferGroup;
  objc_super v8;

  videoReceiver = self->_receiverState.videoReceiver;
  if (videoReceiver)
  {
    CFRelease(videoReceiver);
    self->_receiverState.videoReceiver = 0;
  }
  videoTarget = self->_receiverState.videoTarget;
  if (videoTarget)
  {
    CFRelease(videoTarget);
    self->_receiverState.videoTarget = 0;
  }

  stateQueue = self->_receiverState.stateQueue;
  if (stateQueue)
  {
    dispatch_release(stateQueue);
    self->_receiverState.stateQueue = 0;
  }
  iVarAccessQueue = self->_iVarAccessQueue;
  if (iVarAccessQueue)
  {
    dispatch_release(iVarAccessQueue);
    self->_iVarAccessQueue = 0;
  }
  lastSeenTaggedBufferGroup = self->_receiverState.lastSeenTaggedBufferGroup;
  if (lastSeenTaggedBufferGroup)
  {
    CFRelease(lastSeenTaggedBufferGroup);
    self->_receiverState.lastSeenTaggedBufferGroup = 0;
  }

  v8.receiver = self;
  v8.super_class = (Class)AVPlayerVideoOutput;
  -[AVPlayerVideoOutput dealloc](&v8, sel_dealloc);
}

- (id)attachedPlayer
{
  NSObject *stateQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__22;
  v10 = __Block_byref_object_dispose__22;
  v11 = 0;
  stateQueue = self->_receiverState.stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__AVPlayerVideoOutput_attachedPlayer__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __37__AVPlayerVideoOutput_attachedPlayer__block_invoke(uint64_t a1)
{
  id result;

  result = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (OpaqueCMTaggedBufferGroup)_copyTaggedBufferGroupForHostTimeInternal:(id *)a3 doNotConsume:(BOOL)a4 presentationTimeStamp:(id *)a5 activeConfiguration:(id *)a6 lastSeenTaggedBufferGroup:(OpaqueCMTaggedBufferGroup *)a7
{
  uint64_t v12;
  NSObject *stateQueue;
  int64_t v14;
  uint64_t *v15;
  id v16;
  const void *v17;
  OpaqueCMTaggedBufferGroup *v18;
  _QWORD block[11];
  __int128 v22;
  int64_t var3;
  BOOL v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  void (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  void *v42;
  __int128 v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  int v48;
  uint64_t v49;
  _QWORD v50[3];

  v12 = 0;
  v50[1] = *MEMORY[0x1E0C80C00];
  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v48 = 0;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3810000000;
  v42 = &unk_1935931BF;
  v43 = *MEMORY[0x1E0CA2E18];
  v44 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  v33 = 0;
  v34 = &v33;
  v35 = 0x3052000000;
  v36 = __Block_byref_object_copy__22;
  v37 = __Block_byref_object_dispose__22;
  v38 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  if (a4)
  {
    v49 = *MEMORY[0x1E0CC64E0];
    v50[0] = MEMORY[0x1E0C9AAB0];
    v12 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, &v49, 1);
  }
  stateQueue = self->_receiverState.stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __146__AVPlayerVideoOutput__copyTaggedBufferGroupForHostTimeInternal_doNotConsume_presentationTimeStamp_activeConfiguration_lastSeenTaggedBufferGroup___block_invoke;
  block[3] = &unk_1E3033C08;
  v22 = *(_OWORD *)&a3->var0;
  var3 = a3->var3;
  block[4] = self;
  block[5] = v12;
  block[6] = &v45;
  block[7] = &v29;
  block[8] = &v39;
  block[9] = &v33;
  block[10] = &v25;
  v24 = a4;
  dispatch_sync(stateQueue, block);
  if (v30[3] && !*((_DWORD *)v46 + 6))
  {
    if (a5)
    {
      v14 = v40[6];
      *(_OWORD *)&a5->var0 = *((_OWORD *)v40 + 2);
      a5->var3 = v14;
    }
    if (a6)
      *a6 = (id)v34[5];
    if (a7)
    {
      v15 = v26;
      *a7 = (OpaqueCMTaggedBufferGroup *)v26[3];
      v15[3] = 0;
    }
  }
  v16 = (id)v34[5];
  v17 = (const void *)v26[3];
  if (v17)
    CFRelease(v17);
  v18 = (OpaqueCMTaggedBufferGroup *)v30[3];
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v45, 8);
  return v18;
}

void __146__AVPlayerVideoOutput__copyTaggedBufferGroupForHostTimeInternal_doNotConsume_presentationTimeStamp_activeConfiguration_lastSeenTaggedBufferGroup___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, __int128 *, uint64_t, uint64_t, uint64_t);
  int v7;
  CFTypeRef v8;
  uint64_t v9;
  const void *v10;
  const void *v11;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  if (v1)
  {
    if ((*(_DWORD *)(a1 + 100) & 0x1D) == 1)
    {
      v3 = *(_QWORD *)(a1 + 40);
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v13 = *(_OWORD *)(a1 + 88);
      v14 = *(_QWORD *)(a1 + 104);
      v6 = *(uint64_t (**)(uint64_t, __int128 *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                + 16)
                                                                                    + 88);
      if (v6)
      {
        v15 = v13;
        v16 = v14;
        v7 = v6(v1, &v15, v3, v4 + 24, v5 + 32);
      }
      else
      {
        v7 = -12782;
      }
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v7;
      if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      {
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = *(id *)(*(_QWORD *)(a1 + 32) + 48);
        v8 = *(CFTypeRef *)(*(_QWORD *)(a1 + 32) + 40);
        if (v8)
          v8 = CFRetain(v8);
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = v8;
        if (!*(_BYTE *)(a1 + 112))
        {
          v9 = *(_QWORD *)(a1 + 32);
          v10 = *(const void **)(v9 + 40);
          v11 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
          *(_QWORD *)(v9 + 40) = v11;
          if (v11)
            CFRetain(v11);
          if (v10)
            CFRelease(v10);
        }
      }
    }
    else
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
}

- (BOOL)hasNewTaggedBufferGroupForHostTime:(id *)a3
{
  OpaqueCMTaggedBufferGroup *v3;
  OpaqueCMTaggedBufferGroup *v4;
  BOOL v5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7;
  CFTypeRef cf;

  v7 = *a3;
  cf = 0;
  v3 = -[AVPlayerVideoOutput _copyTaggedBufferGroupForHostTimeInternal:doNotConsume:presentationTimeStamp:activeConfiguration:lastSeenTaggedBufferGroup:](self, "_copyTaggedBufferGroupForHostTimeInternal:doNotConsume:presentationTimeStamp:activeConfiguration:lastSeenTaggedBufferGroup:", &v7, 1, 0, 0, &cf);
  if (v3)
  {
    v4 = v3;
    v5 = FigCFEqual() == 0;
    CFRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  if (cf)
    CFRelease(cf);
  return v5;
}

- (OpaqueCMTaggedBufferGroup)copyTaggedBufferGroupForHostTime:(id *)a3 presentationTimeStamp:(id *)a4 activeConfiguration:(id *)a5
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6;

  v6 = *a3;
  return -[AVPlayerVideoOutput _copyTaggedBufferGroupForHostTimeInternal:doNotConsume:presentationTimeStamp:activeConfiguration:lastSeenTaggedBufferGroup:](self, "_copyTaggedBufferGroupForHostTimeInternal:doNotConsume:presentationTimeStamp:activeConfiguration:lastSeenTaggedBufferGroup:", &v6, 0, a4, a5, 0);
}

- (id)_playerItemWithIdentifier:(id)a3
{
  id Weak;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  Weak = objc_loadWeak((id *)&self->_receiverState.weakPlayer);
  v5 = 0;
  if (a3 && Weak)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = (void *)objc_msgSend(Weak, "_items", 0);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
LABEL_5:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v5 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
        if ((objc_msgSend((id)objc_msgSend(v5, "identifier"), "isEqual:", a3) & 1) != 0)
          break;
        if (v8 == ++v10)
        {
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
          v5 = 0;
          if (v8)
            goto LABEL_5;
          return v5;
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return v5;
}

- (void)_handleVideoReceiverActiveConfigurationChanged:(FigVideoReceiverConfigurationInfo *)a3
{
  __int128 v5;
  id v6;
  const __CFArray *v7;
  CFIndex v8;
  CFIndex v9;
  AVPlayerVideoOutputConfiguration *v10;
  __CFArray *var1;
  AVPlayerVideoOutputConfiguration *v12;
  __int128 v13;
  int64_t var3;
  _OWORD v15[3];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = 0;
  v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v16 = *MEMORY[0x1E0C9BAA8];
  v17 = v5;
  v18 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v6 = -[AVPlayerVideoOutput _playerItemWithIdentifier:](self, "_playerItemWithIdentifier:", a3->var0);
  v7 = (const __CFArray *)FigCFDictionaryCopyArrayOfValues();
  v8 = 0;
  while (1)
  {
    v9 = v7 ? CFArrayGetCount(v7) : 0;
    if (v8 >= v9)
      break;
    CFArrayGetValueAtIndex(v7, v8++);
    if (FigCFDictionaryGetValueIfPresent())
    {
      FigGetCGAffineTransformFrom3x3MatrixArray();
      break;
    }
  }
  if (v7)
    CFRelease(v7);

  if (v6)
  {
    v10 = [AVPlayerVideoOutputConfiguration alloc];
    var1 = a3->var1;
    v15[0] = v16;
    v15[1] = v17;
    v15[2] = v18;
    v13 = *(_OWORD *)&a3->var3.var0;
    var3 = a3->var3.var3;
    v12 = -[AVPlayerVideoOutputConfiguration initWithSourcePlayerItem:dataChannelDescriptions:transform:activationTime:](v10, "initWithSourcePlayerItem:dataChannelDescriptions:transform:activationTime:", v6, var1, v15, &v13);
  }
  else
  {
    v12 = 0;
  }
  self->_receiverState.activeConfiguration = v12;
}

- (int)_setUpVideoReceiverEventHandlers:(OpaqueFigVideoReceiver *)a3
{
  uint64_t (*v4)(OpaqueFigVideoReceiver *, _QWORD *);
  int v5;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__AVPlayerVideoOutput__setUpVideoReceiverEventHandlers___block_invoke;
  v7[3] = &unk_1E3033C30;
  objc_copyWeak(&v8, &location);
  v4 = *(uint64_t (**)(OpaqueFigVideoReceiver *, _QWORD *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 192);
  if (v4)
    v5 = v4(a3, v7);
  else
    v5 = -12782;
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  return v5;
}

_QWORD *__56__AVPlayerVideoOutput__setUpVideoReceiverEventHandlers___block_invoke(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  _QWORD *result;
  __int128 v6;
  _OWORD v7[3];

  result = objc_loadWeak((id *)(a1 + 32));
  if (result)
  {
    if (result[4] == a2)
    {
      v6 = a3[1];
      v7[0] = *a3;
      v7[1] = v6;
      v7[2] = a3[2];
      return (_QWORD *)objc_msgSend(result, "_handleVideoReceiverActiveConfigurationChanged:", v7);
    }
  }
  return result;
}

- (int)_createAndConfigureVideoReceiverIfNecessaryOnStateQueue
{
  int v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CFTypeRef v10;
  uint64_t (*v11)(CFTypeRef, void *, _QWORD);
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  id v23;
  void *v24;
  CFTypeRef v25;
  uint64_t (*v26)(CFTypeRef, void *, _QWORD);
  CFTypeRef v27;
  uint64_t (*v28)(CFTypeRef, uint64_t (*)(uint64_t, uint64_t, void *, uint64_t), AVPlayerVideoOutput *);
  int v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  CFTypeRef cf;
  CFTypeRef v46;
  _QWORD v47[3];
  _QWORD v48[3];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  cf = 0;
  v46 = 0;
  if (self->_receiverState.videoReceiver)
  {
    v29 = 0;
    goto LABEL_39;
  }
  v3 = MEMORY[0x194033E44](*MEMORY[0x1E0C9AE00], 0, &v46);
  if (v3)
    goto LABEL_38;
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = -[AVVideoOutputSpecification preferredTagCollections](self->_outputSpecification, "preferredTagCollections");
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v42;
LABEL_5:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v42 != v8)
        objc_enumerationMutation(v5);
      v3 = FigDataChannelGroupCreate();
      if (v3)
        goto LABEL_38;
      v3 = FigDataChannelGroupAddDataChannel();
      if (v3)
        goto LABEL_38;
      objc_msgSend(v4, "addObject:", cf);
      if (cf)
      {
        CFRelease(cf);
        cf = 0;
      }
      if (v7 == ++v9)
      {
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
        if (v7)
          goto LABEL_5;
        break;
      }
    }
  }
  v10 = v46;
  v11 = *(uint64_t (**)(CFTypeRef, void *, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 72);
  if (!v11)
  {
LABEL_37:
    v29 = -12782;
    goto LABEL_39;
  }
  v3 = v11(v10, v4, 0);
  if (v3)
    goto LABEL_38;
  v40 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (-[NSArray count](v5, "count"))
  {
    v12 = 0;
    v39 = *MEMORY[0x1E0CC64C8];
    v38 = *MEMORY[0x1E0CC64D0];
    v37 = *MEMORY[0x1E0CC64D8];
    v36 = *MEMORY[0x1E0CC64B0];
    v35 = *MEMORY[0x1E0C9AE50];
    v34 = *MEMORY[0x1E0C9AE40];
    v33 = *MEMORY[0x1E0CC64A8];
    v32 = *MEMORY[0x1E0CC64B8];
    v31 = *MEMORY[0x1E0CC6498];
    v13 = *MEMORY[0x1E0CC64A0];
    do
    {
      v14 = -[NSArray objectAtIndex:](v5, "objectAtIndex:", v12);
      v15 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
      v16 = -[AVVideoOutputSpecification _videoColorPropertiesForTagCollection:](self->_outputSpecification, "_videoColorPropertiesForTagCollection:", v14);
      if (v16)
      {
        v17 = v16;
        v18 = objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("ColorPrimaries"));
        v19 = objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("TransferFunction"));
        v20 = objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("YCbCrMatrix"));
        v47[0] = v39;
        v47[1] = v38;
        v48[0] = v18;
        v48[1] = v19;
        v47[2] = v37;
        v48[2] = v20;
        objc_msgSend(v15, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 3), v36);
      }
      v21 = -[AVVideoOutputSpecification _allowWideColorForTagCollection:](self->_outputSpecification, "_allowWideColorForTagCollection:", v14);
      if (v21)
      {
        if (objc_msgSend(v21, "BOOLValue"))
          v22 = v35;
        else
          v22 = v34;
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v22, v33);
      }
      v23 = -[AVVideoOutputSpecification _pixelBufferAttributesForTagCollection:](self->_outputSpecification, "_pixelBufferAttributesForTagCollection:", v14);
      if (v23)
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v23, v32);
      if (objc_msgSend(v15, "count"))
      {
        v24 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
        objc_msgSend(v24, "setObject:forKeyedSubscript:", v14, v31);
        objc_msgSend(v24, "setObject:forKeyedSubscript:", v15, v13);
        objc_msgSend(v40, "addObject:", v24);
      }
      ++v12;
    }
    while (v12 < -[NSArray count](v5, "count"));
  }
  if (objc_msgSend(v40, "count"))
  {
    v25 = v46;
    v26 = *(uint64_t (**)(CFTypeRef, void *, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 80);
    if (v26)
    {
      v3 = v26(v25, v40, 0);
      if (!v3)
        goto LABEL_33;
LABEL_38:
      v29 = v3;
      goto LABEL_39;
    }
    goto LABEL_37;
  }
LABEL_33:
  v27 = v46;
  v28 = *(uint64_t (**)(CFTypeRef, uint64_t (*)(uint64_t, uint64_t, void *, uint64_t), AVPlayerVideoOutput *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 144);
  if (!v28)
    goto LABEL_37;
  v3 = v28(v27, metadataSupplierResourceLifeCycleCallback, self);
  if (v3)
    goto LABEL_38;
  v29 = -[AVPlayerVideoOutput _setUpVideoReceiverEventHandlers:](self, "_setUpVideoReceiverEventHandlers:", v46);
  if (!v29)
  {
    self->_receiverState.videoReceiver = (OpaqueFigVideoReceiver *)v46;
    v46 = 0;
    goto LABEL_41;
  }
LABEL_39:
  if (v46)
    CFRelease(v46);
LABEL_41:
  if (cf)
    CFRelease(cf);
  return v29;
}

- (BOOL)_attachToPlayer:(id)a3 exceptionReason:(id *)a4
{
  NSObject *stateQueue;
  char v5;
  _QWORD block[9];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  stateQueue = self->_receiverState.stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__AVPlayerVideoOutput__attachToPlayer_exceptionReason___block_invoke;
  block[3] = &unk_1E3033C58;
  block[4] = self;
  block[5] = a3;
  block[6] = &v8;
  block[7] = a4;
  block[8] = a2;
  dispatch_sync(stateQueue, block);
  v5 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __55__AVPlayerVideoOutput__attachToPlayer_exceptionReason___block_invoke(uint64_t a1)
{
  id Weak;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  Weak = objc_loadWeak((id *)(*(_QWORD *)(a1 + 32) + 16));
  if (!Weak)
  {
    objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
    result = objc_msgSend(*(id *)(a1 + 32), "_createAndConfigureVideoReceiverIfNecessaryOnStateQueue");
    if ((_DWORD)result
      || !*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24)
      && (v11 = *MEMORY[0x1E0CC64E8],
          v12[0] = *MEMORY[0x1E0C9AE50],
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1),
          result = FigVideoTargetCreateWithVideoReceiver(),
          (_DWORD)result))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
      goto LABEL_12;
    }
    result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "videoTargets"), "containsObject:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
    if ((result & 1) == 0)
      result = objc_msgSend(*(id *)(a1 + 40), "addVideoTarget:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
LABEL_11:
    *(_BYTE *)(v9 + 24) = 1;
    goto LABEL_12;
  }
  result = objc_msgSend(Weak, "isEqual:", *(_QWORD *)(a1 + 40));
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if ((_DWORD)result)
    goto LABEL_11;
  *(_BYTE *)(v9 + 24) = 0;
  if (*(_QWORD *)(a1 + 56))
  {
    result = AVMethodExceptionReasonWithObjectAndSelector(*(objc_class **)(a1 + 32), *(const char **)(a1 + 64), (uint64_t)CFSTR("This output is already attached to a player, and AVPlayerVideoOutput cannot be attached to more than one player at a time"), v4, v5, v6, v7, v8, v10);
    **(_QWORD **)(a1 + 56) = result;
  }
LABEL_12:
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    return (uint64_t)objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 16), 0);
  return result;
}

- (void)_detachFromPlayer:(id)a3
{
  NSObject *stateQueue;
  _QWORD v4[6];

  stateQueue = self->_receiverState.stateQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __41__AVPlayerVideoOutput__detachFromPlayer___block_invoke;
  v4[3] = &unk_1E302FCE8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(stateQueue, v4);
}

void __41__AVPlayerVideoOutput__detachFromPlayer___block_invoke(uint64_t a1)
{
  id Weak;
  void *v3;
  uint64_t v4;
  const void *v5;

  Weak = objc_loadWeak((id *)(*(_QWORD *)(a1 + 32) + 16));
  if (Weak)
  {
    v3 = Weak;
    if (objc_msgSend(*(id *)(a1 + 40), "isEqual:", Weak))
    {
      objc_msgSend(v3, "removeVideoTarget:synchronously:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), 1);
      objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 16), 0);
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(const void **)(v4 + 40);
      if (v5)
      {
        CFRelease(v5);
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = 0;
        v4 = *(_QWORD *)(a1 + 32);
      }

      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = 0;
    }
  }
}

- (void)_setResourceLifeCycleHandler:(id)a3
{
  uint64_t v4;
  NSObject *iVarAccessQueue;
  _QWORD v6[6];

  v4 = objc_msgSend(a3, "copy");
  iVarAccessQueue = self->_iVarAccessQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__AVPlayerVideoOutput__setResourceLifeCycleHandler___block_invoke;
  v6[3] = &unk_1E3031550;
  v6[4] = self;
  v6[5] = v4;
  av_readwrite_dispatch_queue_write(iVarAccessQueue, v6);
}

void __52__AVPlayerVideoOutput__setResourceLifeCycleHandler___block_invoke(uint64_t a1)
{

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = *(_QWORD *)(a1 + 40);
}

- (id)resourceLifeCycleHandler
{
  NSObject *iVarAccessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__92;
  v10 = __Block_byref_object_dispose__93;
  v11 = 0;
  iVarAccessQueue = self->_iVarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__AVPlayerVideoOutput_resourceLifeCycleHandler__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(iVarAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __47__AVPlayerVideoOutput_resourceLifeCycleHandler__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_receiverState.weakPlayer);
}

@end
