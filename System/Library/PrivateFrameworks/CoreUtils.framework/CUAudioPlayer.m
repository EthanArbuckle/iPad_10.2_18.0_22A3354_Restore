@implementation CUAudioPlayer

- (CUAudioPlayer)init
{
  CUAudioPlayer *v2;
  CUAudioPlayer *v3;
  CUAudioPlayer *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CUAudioPlayer;
  v2 = -[CUAudioPlayer init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E0C80D38]);
    v3->_ucat = (LogCategory *)&gLogCategory_CUAudioPlayer;
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
  v4.super_class = (Class)CUAudioPlayer;
  -[CUAudioPlayer dealloc](&v4, sel_dealloc);
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
  v7 = qword_1EE066520;
  v14 = objc_retainAutorelease(v5);
  objc_msgSend(v14, "UTF8String");
  LogCategoryReplaceF(p_ucat, (uint64_t)"%s-%s", v8, v9, v10, v11, v12, v13, v7);

}

- (BOOL)setPortUID:(id)a3 channelName:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  BOOL v33;
  uint64_t v35;
  id *v36;
  uint64_t v37;
  CUAudioPlayer *v38;
  void *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  objc_msgSend((Class)getAVAudioSessionClass[0](), "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentRoute");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "outputs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v46;
    v39 = v12;
    v40 = v8;
    v36 = a5;
    v37 = *(_QWORD *)v46;
    v38 = self;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v46 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_msgSend(v17, "UID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isEqual:", v8);

        if (v19)
        {
          v43 = 0u;
          v44 = 0u;
          v41 = 0u;
          v42 = 0u;
          objc_msgSend(v17, "channels");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
          if (v21)
          {
            v22 = v21;
            v23 = *(_QWORD *)v42;
            while (2)
            {
              for (j = 0; j != v22; ++j)
              {
                if (*(_QWORD *)v42 != v23)
                  objc_enumerationMutation(v20);
                v25 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
                objc_msgSend(v25, "channelName");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = objc_msgSend(v26, "isEqual:", v9);

                if (v27)
                {
                  objc_storeStrong((id *)&v38->_channel, v25);

                  v33 = 1;
                  v8 = v40;
                  goto LABEL_21;
                }
              }
              v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
              if (v22)
                continue;
              break;
            }
          }

          v12 = v39;
          v8 = v40;
          v15 = v37;
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      a5 = v36;
    }
    while (v14);
  }

  if (a5)
  {
    NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960591, (uint64_t)"Port/channel not found", v28, v29, v30, v31, v32, v35);
    v33 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v33 = 0;
  }
LABEL_21:

  return v33;
}

- (void)_applyChannelAssignments:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  LogCategory *ucat;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  LogCategory *v19;
  uint64_t v20;
  void *v21;
  id v22;

  v4 = a3;
  v22 = v4;
  if (self->_channel)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v6 = objc_msgSend(v22, "numberOfChannels");
    if (v6)
    {
      v7 = v6;
      do
      {
        objc_msgSend(v5, "addObject:", self->_channel);
        --v7;
      }
      while (v7);
    }
    ucat = self->_ucat;
    if (ucat->var0 >= 31)
      goto LABEL_13;
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
        goto LABEL_13;
      ucat = self->_ucat;
    }
    -[AVAudioSessionChannelDescription owningPortUID](self->_channel, "owningPortUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVAudioSessionChannelDescription channelName](self->_channel, "channelName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUAudioPlayer _applyChannelAssignments:]", 0x1Eu, (uint64_t)"Applying channel: portUID=%@, channelName=%@", v10, v11, v12, v13, (uint64_t)v9);

LABEL_13:
    objc_msgSend(v22, "setChannelAssignments:", v5);

    goto LABEL_16;
  }
  objc_msgSend(v4, "channelAssignments");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v19 = self->_ucat;
    if (v19->var0 <= 30)
    {
      if (v19->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v19, 0x1Eu))
          goto LABEL_15;
        v19 = self->_ucat;
      }
      LogPrintF((uint64_t)v19, (uint64_t)"-[CUAudioPlayer _applyChannelAssignments:]", 0x1Eu, (uint64_t)"Applying channel: nil", v15, v16, v17, v18, v20);
    }
LABEL_15:
    objc_msgSend(v22, "setChannelAssignments:", 0);
  }
LABEL_16:

}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__CUAudioPlayer_activate__block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  LogCategory *ucat;
  NSMutableArray *v8;
  NSMutableArray *playRequests;
  NSMutableDictionary *v10;
  NSMutableDictionary *preparedRequests;
  AVAudioSession *v12;
  AVAudioSession *audioSession;
  unsigned int enableSmartRouting;
  AVAudioSession *v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  LogCategory *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  unint64_t v34;
  AVAudioSession *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  LogCategory *v42;
  AVAudioSession *v43;
  BOOL v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  LogCategory *v50;
  void *v51;
  id v52;
  id v53;
  id v54;

  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUAudioPlayer _activate]", 0x1Eu, (uint64_t)"Activate %#{flags}\n", v2, v3, v4, v5, self->_flags);
      goto LABEL_5;
    }
    if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }
LABEL_5:
  v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  playRequests = self->_playRequests;
  self->_playRequests = v8;

  v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  preparedRequests = self->_preparedRequests;
  self->_preparedRequests = v10;

  objc_storeStrong((id *)&self->_selfRef, self);
  objc_msgSend((Class)getAVAudioSessionClass[0](), "sharedInstance");
  v12 = (AVAudioSession *)objc_claimAutoreleasedReturnValue();
  audioSession = self->_audioSession;
  self->_audioSession = v12;

  enableSmartRouting = self->_enableSmartRouting;
  if (enableSmartRouting)
  {
    v15 = self->_audioSession;
    v54 = 0;
    v16 = -[AVAudioSession setEligibleForBTSmartRoutingConsideration:error:](v15, "setEligibleForBTSmartRoutingConsideration:error:", enableSmartRouting == 1, &v54);
    v24 = v54;
    if ((v16 & 1) == 0)
    {
      v25 = self->_ucat;
      if (v25->var0 <= 90)
      {
        if (v25->var0 != -1)
        {
LABEL_9:
          v26 = self->_enableSmartRouting;
          if (v26 > 2)
            v27 = "?";
          else
            v27 = off_1E25DC078[v26];
          NSPrintF((uint64_t)"%{error}", v17, v18, v19, v20, v21, v22, v23, (uint64_t)v24);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF((uint64_t)v25, (uint64_t)"-[CUAudioPlayer _activate]", 0x5Au, (uint64_t)"### AudioSession Smart Routing failed: option=%s, error=%@", v28, v29, v30, v31, (uint64_t)v27);

          goto LABEL_15;
        }
        if (_LogCategory_Initialize((uint64_t)self->_ucat, 0x5Au))
        {
          v25 = self->_ucat;
          goto LABEL_9;
        }
      }
    }
LABEL_15:

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  getAVAudioSessionInterruptionNotification[0]();
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addObserver:selector:name:object:", self, sel_audioSessionInterrupted_, v33, self->_audioSession);

  v34 = ((unint64_t)self->_flags >> 2) & 1;
  v35 = self->_audioSession;
  getAVAudioSessionCategoryAmbient[0]();
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0;
  LOBYTE(v35) = -[AVAudioSession setCategory:withOptions:error:](v35, "setCategory:withOptions:error:", v36, v34, &v53);
  v37 = v53;

  if ((v35 & 1) == 0)
  {
    v42 = self->_ucat;
    if (v42->var0 <= 90)
    {
      if (v42->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v42, 0x5Au))
          goto LABEL_21;
        v42 = self->_ucat;
      }
      LogPrintF((uint64_t)v42, (uint64_t)"-[CUAudioPlayer _activate]", 0x5Au, (uint64_t)"### AudioSession setCategory failed: %{error}\n", v38, v39, v40, v41, (uint64_t)v37);
    }
  }
LABEL_21:
  v43 = self->_audioSession;
  v52 = v37;
  v44 = -[AVAudioSession setActive:error:](v43, "setActive:error:", 1, &v52);
  v45 = v52;

  if (!v44)
  {
    v50 = self->_ucat;
    if (v50->var0 <= 90)
    {
      if (v50->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v50, 0x5Au))
          goto LABEL_26;
        v50 = self->_ucat;
      }
      LogPrintF((uint64_t)v50, (uint64_t)"-[CUAudioPlayer _activate]", 0x5Au, (uint64_t)"### AudioSession setActive failed: %{error}\n", v46, v47, v48, v49, (uint64_t)v45);
    }
  }
LABEL_26:

}

- (void)invalidateWithFlags:(unsigned int)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  unsigned int v5;

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37__CUAudioPlayer_invalidateWithFlags___block_invoke;
  v4[3] = &unk_1E25DE500;
  v4[4] = self;
  v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)_invalidateWithFlags:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  LogCategory *ucat;
  void *v11;
  uint64_t v12;

  if (self->_invalidateCalled)
    return;
  v8 = *(_QWORD *)&a3;
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
        goto LABEL_6;
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUAudioPlayer _invalidateWithFlags:]", 0x1Eu, (uint64_t)"Invalidate %#{flags}\n", v4, v5, v6, v7, v8);
  }
LABEL_6:
  self->_invalidateCalled = 1;
  self->_invalidateFlags = v8;
  if ((v8 & 3) == 0)
  {
    NSErrorWithOSStatusF(4294960573, (uint64_t)"Invalidated", *(uint64_t *)&a3, v3, v4, v5, v6, v7, v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUAudioPlayer _abortRequestsWithError:](self, "_abortRequestsWithError:", v11);

  }
  -[CUAudioPlayer _invalidated](self, "_invalidated");
}

- (void)_invalidated
{
  void *v3;
  void *v4;
  AVAudioSession *audioSession;
  void (**invalidationHandler)(void);
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  LogCategory *ucat;
  CUAudioPlayer *selfRef;
  uint64_t v14;

  if (self->_invalidateCalled
    && !self->_invalidateDone
    && !self->_currentRequest
    && !-[NSMutableArray count](self->_playRequests, "count")
    && !-[NSMutableDictionary count](self->_preparedRequests, "count"))
  {
    if (self->_audioSession)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      getAVAudioSessionInterruptionNotification[0]();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "removeObserver:name:object:", self, v4, self->_audioSession);

      audioSession = self->_audioSession;
      self->_audioSession = 0;

    }
    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler)
    {
      invalidationHandler[2]();
      v7 = self->_invalidationHandler;
    }
    else
    {
      v7 = 0;
    }
    self->_invalidationHandler = 0;

    self->_invalidateDone = 1;
    ucat = self->_ucat;
    if (ucat->var0 > 30)
      goto LABEL_16;
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
        goto LABEL_16;
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUAudioPlayer _invalidated]", 0x1Eu, (uint64_t)"Invalidated\n", v8, v9, v10, v11, v14);
LABEL_16:
    selfRef = self->_selfRef;
    self->_selfRef = 0;

  }
}

- (void)playPreparedIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__CUAudioPlayer_playPreparedIdentifier_completion___block_invoke;
  block[3] = &unk_1E25DD410;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

- (void)_playPreparedIdentifier:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  LogCategory *ucat;
  int var0;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  v6 = (void (**)(id, void *))a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_preparedRequests, "objectForKeyedSubscript:", v23);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  ucat = self->_ucat;
  var0 = ucat->var0;
  if (v13)
  {
    if (var0 <= 30)
    {
      if (var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
          goto LABEL_9;
        ucat = self->_ucat;
      }
      objc_msgSend(v13, "label");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUAudioPlayer _playPreparedIdentifier:completion:]", 0x1Eu, (uint64_t)"Play prepared ID %@ '%@'\n", v16, v17, v18, v19, (uint64_t)v23);

    }
LABEL_9:
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_preparedRequests, "setObject:forKeyedSubscript:", 0, v23);
    objc_msgSend(v13, "setCompletion:", v6);
    -[NSMutableArray addObject:](self->_playRequests, "addObject:", v13);
    -[CUAudioPlayer _processRequests](self, "_processRequests");
    goto LABEL_13;
  }
  if (var0 <= 90)
  {
    v20 = (uint64_t)v23;
    if (var0 != -1)
    {
LABEL_7:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUAudioPlayer _playPreparedIdentifier:completion:]", 0x5Au, (uint64_t)"### Play prepared ID %@ not found\n", v9, v10, v11, v12, v20);
      goto LABEL_11;
    }
    if (_LogCategory_Initialize((uint64_t)self->_ucat, 0x5Au))
    {
      ucat = self->_ucat;
      v20 = (uint64_t)v23;
      goto LABEL_7;
    }
  }
LABEL_11:
  if (v6)
  {
    NSErrorWithOSStatusF(4294960569, (uint64_t)"Prepared ID %@ not found", v7, v8, v9, v10, v11, v12, (uint64_t)v23);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v21);

  }
LABEL_13:

}

- (void)playURL:(id)a3 completion:(id)a4
{
  -[CUAudioPlayer playURL:loop:completion:](self, "playURL:loop:completion:", a3, 0, a4);
}

- (void)playURL:(id)a3 loop:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *dispatchQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a5;
  dispatchQueue = self->_dispatchQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __41__CUAudioPlayer_playURL_loop_completion___block_invoke;
  v13[3] = &unk_1E25DC010;
  v13[4] = self;
  v14 = v8;
  v16 = a4;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(dispatchQueue, v13);

}

- (void)_playURL:(id)a3 loop:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  void (**v8)(id, id);
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  LogCategory *ucat;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  CUAudioRequest *v25;
  LogCategory *v26;
  void *v27;
  uint64_t v28;
  id v29;

  v5 = a4;
  v8 = (void (**)(id, id))a5;
  v9 = a3;
  objc_msgSend(v9, "absoluteString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastPathComponent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUAudioPlayer _playURL:loop:completion:]", 0x1Eu, (uint64_t)"Play request '%@'\n", v12, v13, v14, v15, (uint64_t)v11);
      goto LABEL_5;
    }
    if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }
LABEL_5:
  v29 = 0;
  v17 = (void *)objc_msgSend(objc_alloc((Class)getAVAudioPlayerClass[0]()), "initWithContentsOfURL:error:", v9, &v29);

  v24 = v29;
  if (v17)
  {
    objc_msgSend(v17, "setDelegate:", self);
    if (v5)
      objc_msgSend(v17, "setNumberOfLoops:", -1);
    -[CUAudioPlayer _applyChannelAssignments:](self, "_applyChannelAssignments:", v17);
    objc_msgSend(v17, "prepareToPlay");
    v25 = objc_alloc_init(CUAudioRequest);
    -[CUAudioRequest setAudioPlayer:](v25, "setAudioPlayer:", v17);
    -[CUAudioRequest setCompletion:](v25, "setCompletion:", v8);
    -[CUAudioRequest setLabel:](v25, "setLabel:", v11);
    -[NSMutableArray addObject:](self->_playRequests, "addObject:", v25);
    -[CUAudioPlayer _processRequests](self, "_processRequests");

    goto LABEL_9;
  }
  v26 = self->_ucat;
  if (v26->var0 <= 90)
  {
    if (v26->var0 != -1)
    {
LABEL_12:
      LogPrintF((uint64_t)v26, (uint64_t)"-[CUAudioPlayer _playURL:loop:completion:]", 0x5Au, (uint64_t)"### Create AVAudioPlayer for '%@' failed: %{error}\n", v20, v21, v22, v23, (uint64_t)v11);
      goto LABEL_14;
    }
    if (_LogCategory_Initialize((uint64_t)v26, 0x5Au))
    {
      v26 = self->_ucat;
      goto LABEL_12;
    }
  }
LABEL_14:
  if (v8)
  {
    if (v24)
    {
      v8[2](v8, v24);
    }
    else
    {
      NSErrorWithOSStatusF(4294960596, (uint64_t)"Create AVAudioPlayer", v18, v19, v20, v21, v22, v23, v28);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, v27);

    }
  }
LABEL_9:

}

- (void)prepareURL:(id)a3 identifier:(id *)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *dispatchQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(a4, v10);
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __50__CUAudioPlayer_prepareURL_identifier_completion___block_invoke;
  v15[3] = &unk_1E25DE2C8;
  v15[4] = self;
  v16 = v8;
  v17 = v10;
  v18 = v9;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_async(dispatchQueue, v15);

}

- (void)_prepareURL:(id)a3 identifier:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, id);
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  LogCategory *ucat;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  CUAudioRequest *v26;
  LogCategory *v27;
  void *v28;
  uint64_t v29;
  id v30;

  v8 = a4;
  v9 = (void (**)(id, id))a5;
  v10 = a3;
  objc_msgSend(v10, "absoluteString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastPathComponent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUAudioPlayer _prepareURL:identifier:completion:]", 0x1Eu, (uint64_t)"Prepare request '%@'\n", v13, v14, v15, v16, (uint64_t)v12);
      goto LABEL_5;
    }
    if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }
LABEL_5:
  v30 = 0;
  v18 = (void *)objc_msgSend(objc_alloc((Class)getAVAudioPlayerClass[0]()), "initWithContentsOfURL:error:", v10, &v30);

  v25 = v30;
  if (v18)
  {
    objc_msgSend(v18, "setDelegate:", self);
    -[CUAudioPlayer _applyChannelAssignments:](self, "_applyChannelAssignments:", v18);
    objc_msgSend(v18, "prepareToPlay");
    v26 = objc_alloc_init(CUAudioRequest);
    -[CUAudioRequest setAudioPlayer:](v26, "setAudioPlayer:", v18);
    -[CUAudioRequest setLabel:](v26, "setLabel:", v12);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_preparedRequests, "setObject:forKeyedSubscript:", v26, v8);

    goto LABEL_7;
  }
  v27 = self->_ucat;
  if (v27->var0 <= 90)
  {
    if (v27->var0 != -1)
    {
LABEL_10:
      LogPrintF((uint64_t)v27, (uint64_t)"-[CUAudioPlayer _prepareURL:identifier:completion:]", 0x5Au, (uint64_t)"### Create AVAudioPlayer for '%@' failed: %{error}\n", v21, v22, v23, v24, (uint64_t)v12);
      goto LABEL_12;
    }
    if (_LogCategory_Initialize((uint64_t)v27, 0x5Au))
    {
      v27 = self->_ucat;
      goto LABEL_10;
    }
  }
LABEL_12:
  if (v9)
  {
    if (v25)
    {
      v9[2](v9, v25);
    }
    else
    {
      NSErrorWithOSStatusF(4294960596, (uint64_t)"Create AVAudioPlayer", v19, v20, v21, v22, v23, v24, v29);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, v28);

    }
  }
LABEL_7:

}

- (void)_processRequests
{
  CUAudioRequest *v3;
  CUAudioRequest *currentRequest;
  LogCategory *ucat;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  if (!self->_currentRequest)
  {
    -[NSMutableArray firstObject](self->_playRequests, "firstObject");
    v3 = (CUAudioRequest *)objc_claimAutoreleasedReturnValue();
    currentRequest = self->_currentRequest;
    self->_currentRequest = v3;

    if (self->_currentRequest)
    {
      -[NSMutableArray removeObjectAtIndex:](self->_playRequests, "removeObjectAtIndex:", 0);
      ucat = self->_ucat;
      if (ucat->var0 <= 30)
      {
        if (ucat->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
            goto LABEL_8;
          ucat = self->_ucat;
        }
        -[CUAudioRequest label](self->_currentRequest, "label");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUAudioPlayer _processRequests]", 0x1Eu, (uint64_t)"Play start '%@'\n", v7, v8, v9, v10, (uint64_t)v6);

      }
LABEL_8:
      -[CUAudioRequest audioPlayer](self->_currentRequest, "audioPlayer");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "play");

    }
  }
}

- (void)_completeRequest:(id)a3 error:(id)a4
{
  id v6;
  CUAudioRequest *v7;
  id v8;
  LogCategory *ucat;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BOOL4 v15;
  CUAudioRequest *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (**v24)(_QWORD, _QWORD);
  unsigned int invalidateFlags;
  void *v26;
  uint64_t v27;
  CUAudioRequest *v28;

  v28 = (CUAudioRequest *)a3;
  v6 = a4;
  v7 = v28;
  v8 = v6;
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      -[CUAudioRequest label](v28, "label");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUAudioPlayer _completeRequest:error:]", 0x1Eu, (uint64_t)"Play completed '%@', %{error}\n", v11, v12, v13, v14, (uint64_t)v10);

      v7 = v28;
      goto LABEL_5;
    }
    v15 = _LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu);
    v7 = v28;
    if (v15)
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }
LABEL_5:
  v16 = v7;
  if (self->_currentRequest == v7)
  {
    self->_currentRequest = 0;

    v16 = v28;
  }
  -[CUAudioRequest completion](v16, "completion");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[CUAudioRequest completion](v28, "completion");
    v24 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v24)[2](v24, v8);

  }
  invalidateFlags = self->_invalidateFlags;
  if ((invalidateFlags & 1) != 0
    || (invalidateFlags & 2) != 0 && !-[NSMutableArray count](self->_playRequests, "count"))
  {
    NSErrorWithOSStatusF(4294960573, (uint64_t)"Invalidated", v18, v19, v20, v21, v22, v23, v27);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUAudioPlayer _abortRequestsWithError:](self, "_abortRequestsWithError:", v26);

  }
  else
  {
    -[CUAudioPlayer _processRequests](self, "_processRequests");
  }

}

- (void)_abortRequestsWithError:(id)a3
{
  id v4;
  CUAudioRequest *v5;
  CUAudioRequest *currentRequest;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CUAudioRequest *v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD);
  NSMutableDictionary *preparedRequests;
  id v18;
  _QWORD v19[4];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_currentRequest;
  if (v5)
  {
    currentRequest = self->_currentRequest;
    self->_currentRequest = 0;

    -[CUAudioRequest completion](v5, "completion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[CUAudioRequest completion](v5, "completion");
      v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id))v8)[2](v8, v4);

    }
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = self->_playRequests;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      v13 = 0;
      v14 = v5;
      do
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        v5 = (CUAudioRequest *)*(id *)(*((_QWORD *)&v21 + 1) + 8 * v13);

        -[CUAudioRequest completion](v5, "completion");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          -[CUAudioRequest completion](v5, "completion");
          v16 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, id))v16)[2](v16, v4);

        }
        ++v13;
        v14 = v5;
      }
      while (v11 != v13);
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  -[NSMutableArray removeAllObjects](self->_playRequests, "removeAllObjects");
  preparedRequests = self->_preparedRequests;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __41__CUAudioPlayer__abortRequestsWithError___block_invoke;
  v19[3] = &unk_1E25DC038;
  v20 = v4;
  v18 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](preparedRequests, "enumerateKeysAndObjectsUsingBlock:", v19);
  -[NSMutableDictionary removeAllObjects](self->_preparedRequests, "removeAllObjects");
  -[CUAudioPlayer _invalidated](self, "_invalidated");

}

- (void)audioPlayerDecodeErrorDidOccur:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__CUAudioPlayer_audioPlayerDecodeErrorDidOccur_error___block_invoke;
  block[3] = &unk_1E25DCEE8;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(dispatchQueue, block);

}

- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4
{
  id v6;
  NSObject *dispatchQueue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__CUAudioPlayer_audioPlayerDidFinishPlaying_successfully___block_invoke;
  block[3] = &unk_1E25DD868;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(dispatchQueue, block);

}

- (void)audioSessionInterrupted:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__CUAudioPlayer_audioSessionInterrupted___block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)label
{
  return self->_label;
}

- (unsigned)enableSmartRouting
{
  return self->_enableSmartRouting;
}

- (void)setEnableSmartRouting:(unsigned int)a3
{
  self->_enableSmartRouting = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_selfRef, 0);
  objc_storeStrong((id *)&self->_preparedRequests, 0);
  objc_storeStrong((id *)&self->_playRequests, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_audioSession, 0);
}

void __41__CUAudioPlayer_audioSessionInterrupted___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v9;
  int *v10;
  _BOOL4 v11;
  uint64_t v12;
  id v13;

  v9 = *(_QWORD **)(a1 + 32);
  v10 = (int *)v9[8];
  if (*v10 <= 60)
  {
    if (*v10 == -1)
    {
      v11 = _LogCategory_Initialize((uint64_t)v10, 0x3Cu);
      v9 = *(_QWORD **)(a1 + 32);
      if (!v11)
        goto LABEL_5;
      v10 = (int *)v9[8];
    }
    LogPrintF((uint64_t)v10, (uint64_t)"-[CUAudioPlayer audioSessionInterrupted:]_block_invoke", 0x3Cu, (uint64_t)"### AudioPlayer interrupted\n", a5, a6, a7, a8, v12);
    v9 = *(_QWORD **)(a1 + 32);
  }
LABEL_5:
  NSErrorWithOSStatusF(4294960573, (uint64_t)"AudioSession interrupted", a3, a4, a5, a6, a7, a8, v12);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_abortRequestsWithError:", v13);

}

void __58__CUAudioPlayer_audioPlayerDidFinishPlaying_successfully___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  v7 = v2;
  v16 = (uint64_t)v2;
  if (v2)
  {
    v8 = *(void **)(a1 + 40);
    objc_msgSend(v2, "audioPlayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)v16;
    if (v8 == v9)
    {
      v12 = *(void **)(a1 + 32);
      if (*(_BYTE *)(a1 + 48))
      {
        objc_msgSend(*(id *)(a1 + 32), "_completeRequest:error:", v16, 0);
      }
      else
      {
        NSErrorWithOSStatusF(4294960596, (uint64_t)"Finish failed", v16, v10, v3, v4, v5, v6, v15);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "_completeRequest:error:", v16, v14);

      }
      goto LABEL_11;
    }
  }
  v11 = *(int **)(*(_QWORD *)(a1 + 32) + 64);
  if (*v11 <= 90)
  {
    if (*v11 != -1)
    {
LABEL_5:
      LogPrintF((uint64_t)v11, (uint64_t)"-[CUAudioPlayer audioPlayerDidFinishPlaying:successfully:]_block_invoke", 0x5Au, (uint64_t)"### AudioPlayer finished for non-current player\n", v3, v4, v5, v6, v15);
LABEL_11:
      v7 = (void *)v16;
      goto LABEL_12;
    }
    v13 = _LogCategory_Initialize((uint64_t)v11, 0x5Au);
    v7 = (void *)v16;
    if (v13)
    {
      v11 = *(int **)(*(_QWORD *)(a1 + 32) + 64);
      goto LABEL_5;
    }
  }
LABEL_12:

}

void __54__CUAudioPlayer_audioPlayerDecodeErrorDidOccur_error___block_invoke(uint64_t a1)
{
  id v2;
  int *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  id v13;

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  v3 = *(int **)(*(_QWORD *)(a1 + 32) + 64);
  v13 = v2;
  if (*v3 <= 60)
  {
    if (*v3 == -1)
    {
      v10 = _LogCategory_Initialize((uint64_t)v3, 0x3Cu);
      v2 = v13;
      if (!v10)
        goto LABEL_5;
      v3 = *(int **)(*(_QWORD *)(a1 + 32) + 64);
    }
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v2, "audioPlayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF((uint64_t)v3, (uint64_t)"-[CUAudioPlayer audioPlayerDecodeErrorDidOccur:error:]_block_invoke", 0x3Cu, (uint64_t)"### AudioPlayer decode failed %{error} %s\n", v6, v7, v8, v9, v4);

    v2 = v13;
  }
LABEL_5:
  if (v2)
  {
    v11 = *(void **)(a1 + 48);
    objc_msgSend(v2, "audioPlayer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v2 = v13;
    if (v11 == v12)
    {
      objc_msgSend(*(id *)(a1 + 32), "_completeRequest:error:", v13, *(_QWORD *)(a1 + 40));
      v2 = v13;
    }
  }

}

void __41__CUAudioPlayer__abortRequestsWithError___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v6 = a3;
  objc_msgSend(v6, "completion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v6, "completion");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v5[2](v5, *(_QWORD *)(a1 + 32));

  }
}

uint64_t __50__CUAudioPlayer_prepareURL_identifier_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_prepareURL:identifier:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __41__CUAudioPlayer_playURL_loop_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_playURL:loop:completion:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

uint64_t __51__CUAudioPlayer_playPreparedIdentifier_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_playPreparedIdentifier:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __37__CUAudioPlayer_invalidateWithFlags___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateWithFlags:", *(unsigned int *)(a1 + 40));
}

uint64_t __25__CUAudioPlayer_activate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activate");
}

@end
