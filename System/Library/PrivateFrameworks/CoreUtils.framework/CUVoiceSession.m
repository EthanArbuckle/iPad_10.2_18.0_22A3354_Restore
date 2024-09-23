@implementation CUVoiceSession

- (CUVoiceSession)init
{
  CUVoiceSession *v2;
  CUVoiceSession *v3;
  CUVoiceSession *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CUVoiceSession;
  v2 = -[CUVoiceSession init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E0C80D38]);
    v3->_ucat = (LogCategory *)&gLogCategory_CUVoiceSession;
    v4 = v3;
  }

  return v3;
}

- (void)dealloc
{
  LogCategory *ucat;
  objc_super v4;

  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove(ucat);
    self->_ucat = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CUVoiceSession;
  -[CUVoiceSession dealloc](&v4, sel_dealloc);
}

- (void)setLabel:(id)a3
{
  id v5;
  uint64_t *p_ucat;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  objc_storeStrong((id *)&self->_label, a3);
  v5 = a3;
  p_ucat = (uint64_t *)&self->_ucat;
  v7 = qword_1EE067F48;
  v14 = objc_retainAutorelease(v5);
  objc_msgSend(v14, "UTF8String");
  LogCategoryReplaceF(p_ucat, (uint64_t)"%s-%s", v8, v9, v10, v11, v12, v13, v7);

}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__CUVoiceSession_invalidate__block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)invalidateWithFlags:(unsigned int)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  unsigned int v5;

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __38__CUVoiceSession_invalidateWithFlags___block_invoke;
  v4[3] = &unk_1E25DE500;
  v4[4] = self;
  v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)_invalidate
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  LogCategory *v10;
  LogCategory *ucat;
  void *v12;
  _BOOL4 v13;
  uint64_t v14;
  id v15;

  -[CUVoiceRequest speechRequest](self->_currentRequest, "speechRequest");
  v3 = objc_claimAutoreleasedReturnValue();
  v9 = (id)v3;
  v15 = (id)v3;
  if ((self->_invalidateFlags & 2) == 0 || !self->_currentRequest)
  {
    if (!v3)
    {
      NSErrorWithOSStatusF(4294960573, (uint64_t)"Invalidated", 0, v4, v5, v6, v7, v8, v14);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CUVoiceSession _completeAllRequestsWithError:](self, "_completeAllRequestsWithError:", v12);

      goto LABEL_13;
    }
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        v13 = _LogCategory_Initialize((uint64_t)ucat, 0x1Eu);
        v9 = v15;
        if (!v13)
          goto LABEL_12;
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUVoiceSession _invalidate]", 0x1Eu, (uint64_t)"Stop speaking for invalidate\n", v5, v6, v7, v8, v14);
      v9 = v15;
    }
LABEL_12:
    -[SiriTTSDaemonSession cancelWithRequest:](self->_speechSynthesizer, "cancelWithRequest:", v9);
    goto LABEL_13;
  }
  v10 = self->_ucat;
  if (v10->var0 <= 30)
  {
    if (v10->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v10, 0x1Eu))
        goto LABEL_13;
      v10 = self->_ucat;
    }
    LogPrintF((uint64_t)v10, (uint64_t)"-[CUVoiceSession _invalidate]", 0x1Eu, (uint64_t)"Waiting until current request finishes before invalidating\n", v5, v6, v7, v8, v14);
  }
LABEL_13:
  -[CUVoiceSession _invalidated](self, "_invalidated");

}

- (void)_invalidated
{
  void (**invalidationHandler)(id, SEL);
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  LogCategory *ucat;
  uint64_t v10;

  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    invalidationHandler = (void (**)(id, SEL))self->_invalidationHandler;
    if (invalidationHandler)
    {
      invalidationHandler[2](invalidationHandler, a2);
      v4 = self->_invalidationHandler;
    }
    else
    {
      v4 = 0;
    }
    self->_invalidationHandler = 0;

    self->_invalidateDone = 1;
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_8:
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUVoiceSession _invalidated]", 0x1Eu, (uint64_t)"Invalidated\n", v5, v6, v7, v8, v10);
        return;
      }
      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_8;
      }
    }
  }
}

- (void)speakText:(id)a3 flags:(unsigned int)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *dispatchQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unsigned int v16;

  v8 = a3;
  v9 = a5;
  dispatchQueue = self->_dispatchQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __45__CUVoiceSession_speakText_flags_completion___block_invoke;
  v13[3] = &unk_1E25DE3B8;
  v13[4] = self;
  v14 = v8;
  v16 = a4;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(dispatchQueue, v13);

}

- (void)_speakText:(id)a3 flags:(unsigned int)a4 completion:(id)a5
{
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  LogCategory *ucat;
  const __CFString *v14;
  const __CFString *v15;
  SiriTTSDaemonSession *v16;
  SiriTTSDaemonSession *speechSynthesizer;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  LogCategory *v24;
  uint64_t v25;
  __CFString *v26;
  Class (__cdecl *v27)();
  __CFString *v28;
  void *v29;
  void *v30;
  CUVoiceRequest *v31;
  NSMutableArray *requests;
  NSMutableArray *v33;
  NSMutableArray *v34;
  uint64_t v35;
  __CFString *v36;

  v6 = *(_QWORD *)&a4;
  v36 = (__CFString *)a3;
  v12 = a5;
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
        goto LABEL_10;
      ucat = self->_ucat;
    }
    v14 = v36;
    if (IsAppleInternalBuild_sOnce != -1)
    {
      dispatch_once(&IsAppleInternalBuild_sOnce, &__block_literal_global_85);
      v14 = v36;
    }
    if (IsAppleInternalBuild_sIsInternal)
      v15 = v14;
    else
      v15 = CFSTR("*");
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUVoiceSession _speakText:flags:completion:]", 0x1Eu, (uint64_t)"Scheduling speaking '%@'\n", v8, v9, v10, v11, (uint64_t)v15);
  }
LABEL_10:
  if (!self->_speechSynthesizer)
  {
    v16 = (SiriTTSDaemonSession *)objc_alloc_init((Class)getSiriTTSDaemonSessionClass[0]());
    speechSynthesizer = self->_speechSynthesizer;
    self->_speechSynthesizer = v16;

  }
  -[CUVoiceRequest speechRequest](self->_currentRequest, "speechRequest");
  v18 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v18;
  if ((v6 & 1) == 0 && v18)
  {
    v24 = self->_ucat;
    if (v24->var0 <= 30)
    {
      if (v24->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v24, 0x1Eu))
          goto LABEL_18;
        v24 = self->_ucat;
      }
      LogPrintF((uint64_t)v24, (uint64_t)"-[CUVoiceSession _speakText:flags:completion:]", 0x1Eu, (uint64_t)"Stop speaking for new request\n", v19, v20, v21, v22, v35);
    }
LABEL_18:
    -[SiriTTSDaemonSession cancelWithRequest:](self->_speechSynthesizer, "cancelWithRequest:", v23);
  }
  v25 = softLinkVSPreferencesCopyDefaultOutputLanguageIdentifierForUserPreferences[0]();
  v26 = CFSTR("en-US");
  if (v25)
    v26 = (__CFString *)v25;
  v27 = (Class (__cdecl *)())getSiriTTSSynthesisVoiceClass;
  v28 = v26;
  v29 = (void *)objc_msgSend(objc_alloc(v27()), "initWithLanguage:name:", v28, 0);

  v30 = (void *)objc_msgSend(objc_alloc((Class)getSiriTTSSpeechRequestClass[0]()), "initWithText:voice:", v36, v29);
  v31 = objc_alloc_init(CUVoiceRequest);
  -[CUVoiceRequest setCompletion:](v31, "setCompletion:", v12);
  -[CUVoiceRequest setFlags:](v31, "setFlags:", v6);
  -[CUVoiceRequest setOwner:](v31, "setOwner:", self);
  -[CUVoiceRequest setSpeechRequest:](v31, "setSpeechRequest:", v30);
  requests = self->_requests;
  if (!requests)
  {
    v33 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v34 = self->_requests;
    self->_requests = v33;

    requests = self->_requests;
  }
  -[NSMutableArray addObject:](requests, "addObject:", v31);
  -[CUVoiceSession _processQueuedRequests](self, "_processQueuedRequests");

}

- (void)stopSpeaking
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__CUVoiceSession_stopSpeaking__block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_processQueuedRequests
{
  CUVoiceRequest **p_currentRequest;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  LogCategory *ucat;
  uint64_t v12;
  void *v13;
  SiriTTSDaemonSession *speechSynthesizer;
  _QWORD v15[6];
  id v16;
  _QWORD v17[6];

  p_currentRequest = &self->_currentRequest;
  if (!self->_currentRequest)
  {
    -[NSMutableArray popFirstObject](self->_requests, "popFirstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
LABEL_15:

      return;
    }
    objc_storeStrong((id *)p_currentRequest, v4);
    objc_msgSend(v4, "speechRequest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
LABEL_14:

      goto LABEL_15;
    }
    if (IsAppleInternalBuild_sOnce != -1)
      dispatch_once(&IsAppleInternalBuild_sOnce, &__block_literal_global_85);
    if (IsAppleInternalBuild_sIsInternal)
    {
      objc_msgSend(v9, "text");
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = CFSTR("*");
    }
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
          goto LABEL_13;
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUVoiceSession _processQueuedRequests]", 0x1Eu, (uint64_t)"Start speaking text '%@'\n", v5, v6, v7, v8, (uint64_t)v10);
    }
LABEL_13:
    v12 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __40__CUVoiceSession__processQueuedRequests__block_invoke;
    v17[3] = &unk_1E25DE628;
    v17[4] = self;
    v17[5] = v10;
    objc_msgSend(v9, "setDidStartSpeaking:", v17);
    -[objc_class sharedInstance](getAVAudioSessionClass_9248(), "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCategory:mode:routeSharingPolicy:options:error:", CFSTR("AVAudioSessionCategoryPlayback"), CFSTR("AVAudioSessionModeDefault"), 1, 0, 0);

    speechSynthesizer = self->_speechSynthesizer;
    v15[0] = v12;
    v15[1] = 3221225472;
    v15[2] = __40__CUVoiceSession__processQueuedRequests__block_invoke_2;
    v15[3] = &unk_1E25DE3E0;
    v15[4] = self;
    v15[5] = v10;
    v16 = v9;
    -[SiriTTSDaemonSession speakWithSpeechRequest:didFinish:](speechSynthesizer, "speakWithSpeechRequest:didFinish:", v16, v15);

    goto LABEL_14;
  }
}

- (void)_completeAllRequestsWithError:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_requests;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[CUVoiceSession _completeRequest:error:](self, "_completeRequest:error:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), v4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  -[NSMutableArray removeAllObjects](self->_requests, "removeAllObjects");
}

- (void)_completeRequest:(id)a3 error:(id)a4
{
  id v6;
  void (**v7)(_QWORD, _QWORD);
  CUVoiceRequest *v8;

  v8 = (CUVoiceRequest *)a3;
  v6 = a4;
  if (self->_currentRequest == v8)
  {
    self->_currentRequest = 0;

  }
  -[CUVoiceRequest completion](v8, "completion");
  v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[CUVoiceRequest setCompletion:](v8, "setCompletion:", 0);
    ((void (**)(_QWORD, id))v7)[2](v7, v6);
  }

}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_voiceRequests, 0);
  objc_storeStrong((id *)&self->_speechSynthesizer, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);
}

uint64_t __40__CUVoiceSession__processQueuedRequests__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  if (*(int *)result <= 30)
  {
    if (*(_DWORD *)result != -1)
      return LogPrintF(result, (uint64_t)"-[CUVoiceSession _processQueuedRequests]_block_invoke", 0x1Eu, (uint64_t)"DidStartSpeakingRequest '%@'\n", a5, a6, a7, a8, *(_QWORD *)(a1 + 40));
    result = _LogCategory_Initialize(result, 0x1Eu);
    if ((_DWORD)result)
    {
      result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
      return LogPrintF(result, (uint64_t)"-[CUVoiceSession _processQueuedRequests]_block_invoke", 0x1Eu, (uint64_t)"DidStartSpeakingRequest '%@'\n", a5, a6, a7, a8, *(_QWORD *)(a1 + 40));
    }
  }
  return result;
}

void __40__CUVoiceSession__processQueuedRequests__block_invoke_2(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int *v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  int *v16;
  _BOOL4 v17;
  void (**v18)(_QWORD, _QWORD);
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _BYTE *v27;
  void *v28;
  uint64_t v29;
  id v30;

  v30 = a2;
  v7 = a1[4];
  v8 = *(int **)(v7 + 40);
  if (*v8 <= 30)
  {
    if (*v8 == -1)
    {
      v9 = _LogCategory_Initialize((uint64_t)v8, 0x1Eu);
      v7 = a1[4];
      if (!v9)
        goto LABEL_5;
      v8 = *(int **)(v7 + 40);
    }
    LogPrintF((uint64_t)v8, (uint64_t)"-[CUVoiceSession _processQueuedRequests]_block_invoke_2", 0x1Eu, (uint64_t)"Did finish speaking text '%@', finished %s, error %{error}\n", v3, v4, v5, v6, a1[5]);
    v7 = a1[4];
  }
LABEL_5:
  objc_msgSend(*(id *)(v7 + 8), "speechRequest");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = a1[4];
  if ((void *)a1[6] != v14)
  {
    v16 = *(int **)(v15 + 40);
    if (*v16 <= 60)
    {
      if (*v16 != -1)
      {
LABEL_8:
        LogPrintF((uint64_t)v16, (uint64_t)"-[CUVoiceSession _processQueuedRequests]_block_invoke_2", 0x3Cu, (uint64_t)"### Finished speaking non-current request?\n", v10, v11, v12, v13, v29);
        v15 = a1[4];
        goto LABEL_10;
      }
      v17 = _LogCategory_Initialize((uint64_t)v16, 0x3Cu);
      v15 = a1[4];
      if (v17)
      {
        v16 = *(int **)(v15 + 40);
        goto LABEL_8;
      }
    }
  }
LABEL_10:
  objc_msgSend(*(id *)(v15 + 8), "completion");
  v18 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_msgSend(*(id *)(a1[4] + 8), "setCompletion:", 0);
    ((void (**)(_QWORD, id))v18)[2](v18, v30);
  }

  v19 = a1[4];
  v20 = *(void **)(v19 + 8);
  *(_QWORD *)(v19 + 8) = 0;

  v27 = (_BYTE *)a1[4];
  if (v27[16])
  {
    NSErrorWithOSStatusF(4294960573, (uint64_t)"Invalidated", v21, v22, v23, v24, v25, v26, v29);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "_completeAllRequestsWithError:", v28);

  }
  else
  {
    objc_msgSend(v27, "_processQueuedRequests");
  }

}

void __30__CUVoiceSession_stopSpeaking__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int *v8;
  _BOOL4 v9;
  uint64_t v10;
  void *v11;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "speechRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(int **)(v7 + 40);
    v11 = v2;
    if (*v8 <= 30)
    {
      if (*v8 == -1)
      {
        v9 = _LogCategory_Initialize((uint64_t)v8, 0x1Eu);
        v7 = *(_QWORD *)(a1 + 32);
        if (!v9)
          goto LABEL_6;
        v8 = *(int **)(v7 + 40);
      }
      LogPrintF((uint64_t)v8, (uint64_t)"-[CUVoiceSession stopSpeaking]_block_invoke", 0x1Eu, (uint64_t)"Stop speaking\n", v3, v4, v5, v6, v10);
      v7 = *(_QWORD *)(a1 + 32);
    }
LABEL_6:
    objc_msgSend(*(id *)(v7 + 32), "cancelWithRequest:", v11);
    v2 = v11;
  }

}

uint64_t __45__CUVoiceSession_speakText_flags_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_speakText:flags:completion:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

uint64_t __38__CUVoiceSession_invalidateWithFlags___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  _BOOL4 v12;

  v8 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v8 + 16))
  {
    v9 = result;
    *(_BYTE *)(v8 + 16) = 1;
    v10 = *(_QWORD *)(result + 32);
    v11 = *(int **)(v10 + 40);
    if (*v11 <= 30)
    {
      if (*v11 == -1)
      {
        v12 = _LogCategory_Initialize((uint64_t)v11, 0x1Eu);
        v10 = *(_QWORD *)(v9 + 32);
        if (!v12)
          goto LABEL_6;
        v11 = *(int **)(v10 + 40);
      }
      LogPrintF((uint64_t)v11, (uint64_t)"-[CUVoiceSession invalidateWithFlags:]_block_invoke", 0x1Eu, (uint64_t)"InvalidateWithFlags: %#{flags}\n", a5, a6, a7, a8, *(unsigned int *)(v9 + 40));
      v10 = *(_QWORD *)(v9 + 32);
    }
LABEL_6:
    *(_DWORD *)(v10 + 20) = *(_DWORD *)(v9 + 40);
    return objc_msgSend(*(id *)(v9 + 32), "_invalidate");
  }
  return result;
}

uint64_t __28__CUVoiceSession_invalidate__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int *v11;
  _BOOL4 v12;
  uint64_t v13;

  v8 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v8 + 16))
  {
    v9 = result;
    *(_BYTE *)(v8 + 16) = 1;
    v10 = *(_QWORD **)(result + 32);
    v11 = (int *)v10[5];
    if (*v11 <= 30)
    {
      if (*v11 == -1)
      {
        v12 = _LogCategory_Initialize((uint64_t)v11, 0x1Eu);
        v10 = *(_QWORD **)(v9 + 32);
        if (!v12)
          return objc_msgSend(v10, "_invalidate");
        v11 = (int *)v10[5];
      }
      LogPrintF((uint64_t)v11, (uint64_t)"-[CUVoiceSession invalidate]_block_invoke", 0x1Eu, (uint64_t)"Invalidate\n", a5, a6, a7, a8, v13);
      v10 = *(_QWORD **)(v9 + 32);
    }
    return objc_msgSend(v10, "_invalidate");
  }
  return result;
}

@end
