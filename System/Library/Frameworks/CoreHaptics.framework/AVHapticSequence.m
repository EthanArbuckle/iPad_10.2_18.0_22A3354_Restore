@implementation AVHapticSequence

- (AVHapticSequence)init
{

  return 0;
}

- (AVHapticSequence)initWithData:(id)a3 player:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  AVHapticSequence *v12;
  AVHapticSequence *v13;
  _QWORD v15[8];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  objc_super v28;
  _BYTE buf[40];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (kAVHCScope)
  {
    v10 = *(id *)kAVHCScope;
    if (!v10)
      goto LABEL_8;
  }
  else
  {
    v10 = MEMORY[0x1E0C81028];
    v11 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = "AVHapticPlayer.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 856;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = "-[AVHapticSequence initWithData:player:error:]";
    *(_WORD *)&buf[28] = 2048;
    *(_QWORD *)&buf[30] = v8;
    *(_WORD *)&buf[38] = 2048;
    v30 = v9;
    _os_log_impl(&dword_1B573F000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: starting init with data %p, player %p", buf, 0x30u);
  }

LABEL_8:
  v28.receiver = self;
  v28.super_class = (Class)AVHapticSequence;
  v12 = -[AVHapticSequence init](&v28, sel_init);
  v13 = v12;
  if (v12)
  {
    if (v9)
    {
      -[AVHapticSequence setPlayer:](v12, "setPlayer:", v9);
      v24 = 0;
      v25 = &v24;
      v26 = 0x2020000000;
      v27 = 0xFFFFFFFFLL;
      v20 = 0;
      v21 = &v20;
      v22 = 0x2020000000;
      v23 = 0;
      v16 = 0;
      v17 = &v16;
      v18 = 0x2020000000;
      v19 = 0;
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      *(_QWORD *)&buf[24] = __Block_byref_object_copy__4;
      *(_QWORD *)&buf[32] = __Block_byref_object_dispose__4;
      v30 = 0;
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __46__AVHapticSequence_initWithData_player_error___block_invoke;
      v15[3] = &unk_1E69603C8;
      v15[4] = &v24;
      v15[5] = &v20;
      v15[6] = &v16;
      v15[7] = buf;
      if ((objc_msgSend(v9, "loadAndPrepareHapticSequenceFromData:reply:", v8, v15) & 1) != 0)
      {
        -[AVHapticSequence setSeqID:](v13, "setSeqID:", v25[3]);
        -[AVHapticSequence setLastStartTime:](v13, "setLastStartTime:", -1.0);
        *(_WORD *)&v13->_loopIsEnabled = 0;
        v13->_playbackRate = 1.0;
        *(_QWORD *)&v13->_duration = v21[3];
        v13->_channelCount = v17[3];
        v13->_activeChannel = 0;
        if (!a5)
          goto LABEL_18;
      }
      else
      {

        v13 = 0;
        if (!a5)
        {
LABEL_18:
          _Block_object_dispose(buf, 8);

          _Block_object_dispose(&v16, 8);
          _Block_object_dispose(&v20, 8);
          _Block_object_dispose(&v24, 8);
          goto LABEL_19;
        }
      }
      *a5 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
      goto LABEL_18;
    }
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4812, 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

    v13 = 0;
  }
LABEL_19:

  return v13;
}

void __46__AVHapticSequence_initWithData_player_error___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, void *a4, double a5)
{
  id v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  if (kAVHCScope)
  {
    v10 = *(id *)kAVHCScope;
    if (!v10)
      goto LABEL_8;
  }
  else
  {
    v10 = MEMORY[0x1E0C81028];
    v11 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v14 = 136316418;
    v15 = "AVHapticPlayer.mm";
    v16 = 1024;
    v17 = 874;
    v18 = 2080;
    v19 = "-[AVHapticSequence initWithData:player:error:]_block_invoke";
    v20 = 1024;
    v21 = a2;
    v22 = 1024;
    v23 = a3;
    v24 = 2112;
    v25 = v9;
    _os_log_impl(&dword_1B573F000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: initWithData: reply block for hapticPlayer loadAndPrepareHapticSequenceFromData: replyID: %u, replyChannelCount: %u, replyError: %@", (uint8_t *)&v14, 0x32u);
  }

LABEL_8:
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = a2;
  *(double *)(*(_QWORD *)(a1[5] + 8) + 24) = a5;
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = a3;
  v12 = *(_QWORD *)(a1[7] + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v9;

}

- (AVHapticSequence)initWithEvents:(id)a3 player:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  AVHapticSequence *v12;
  AVHapticSequence *v13;
  _QWORD v15[8];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  objc_super v28;
  _BYTE buf[32];
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (kAVHCScope)
  {
    v10 = *(id *)kAVHCScope;
    if (!v10)
      goto LABEL_8;
  }
  else
  {
    v10 = MEMORY[0x1E0C81028];
    v11 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "AVHapticPlayer.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 903;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = "-[AVHapticSequence initWithEvents:player:error:]";
    _os_log_impl(&dword_1B573F000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: starting init with event array", buf, 0x1Cu);
  }

LABEL_8:
  v28.receiver = self;
  v28.super_class = (Class)AVHapticSequence;
  v12 = -[AVHapticSequence init](&v28, sel_init);
  v13 = v12;
  if (v12)
  {
    -[AVHapticSequence setPlayer:](v12, "setPlayer:", v9);
    v24 = 0;
    v25 = &v24;
    v26 = 0x2020000000;
    v27 = 0xFFFFFFFFLL;
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 0;
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 0;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    *(_QWORD *)&buf[24] = __Block_byref_object_copy__4;
    v30 = __Block_byref_object_dispose__4;
    v31 = 0;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __48__AVHapticSequence_initWithEvents_player_error___block_invoke;
    v15[3] = &unk_1E69603C8;
    v15[4] = &v24;
    v15[5] = &v20;
    v15[6] = &v16;
    v15[7] = buf;
    if ((objc_msgSend(v9, "loadAndPrepareHapticSequenceFromEvents:reply:", v8, v15) & 1) != 0)
    {
      -[AVHapticSequence setSeqID:](v13, "setSeqID:", v25[3]);
      -[AVHapticSequence setLastStartTime:](v13, "setLastStartTime:", -1.0);
      *(_WORD *)&v13->_loopIsEnabled = 0;
      v13->_playbackRate = 1.0;
      *(_QWORD *)&v13->_duration = v21[3];
      v13->_channelCount = v17[3];
      v13->_activeChannel = 0;
      if (!a5)
        goto LABEL_14;
    }
    else
    {

      v13 = 0;
      if (!a5)
      {
LABEL_14:
        _Block_object_dispose(buf, 8);

        _Block_object_dispose(&v16, 8);
        _Block_object_dispose(&v20, 8);
        _Block_object_dispose(&v24, 8);
        goto LABEL_15;
      }
    }
    *a5 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
    goto LABEL_14;
  }
LABEL_15:

  return v13;
}

void __48__AVHapticSequence_initWithEvents_player_error___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, void *a4, double a5)
{
  id v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  if (kAVHCScope)
  {
    v10 = *(id *)kAVHCScope;
    if (!v10)
      goto LABEL_8;
  }
  else
  {
    v10 = MEMORY[0x1E0C81028];
    v11 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v14 = 136316418;
    v15 = "AVHapticPlayer.mm";
    v16 = 1024;
    v17 = 916;
    v18 = 2080;
    v19 = "-[AVHapticSequence initWithEvents:player:error:]_block_invoke";
    v20 = 1024;
    v21 = a2;
    v22 = 1024;
    v23 = a3;
    v24 = 2112;
    v25 = v9;
    _os_log_impl(&dword_1B573F000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: initWithEvents: reply block for hapticPlayer loadAndPrepareHapticSequenceFromEvents: replyID: %u, replyChannelCount: %u, replyError: %@", (uint8_t *)&v14, 0x32u);
  }

LABEL_8:
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = a2;
  *(double *)(*(_QWORD *)(a1[5] + 8) + 24) = a5;
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = a3;
  v12 = *(_QWORD *)(a1[7] + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v9;

}

- (AVHapticSequence)initWithDictionary:(id)a3 player:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  AVHapticSequence *v12;
  AVHapticSequence *v13;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  objc_super v20;
  _BYTE buf[32];
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (kAVHCScope)
  {
    v10 = *(id *)kAVHCScope;
    if (!v10)
      goto LABEL_8;
  }
  else
  {
    v10 = MEMORY[0x1E0C81028];
    v11 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "AVHapticPlayer.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 945;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = "-[AVHapticSequence initWithDictionary:player:error:]";
    _os_log_impl(&dword_1B573F000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: starting init with dictionary", buf, 0x1Cu);
  }

LABEL_8:
  v20.receiver = self;
  v20.super_class = (Class)AVHapticSequence;
  v12 = -[AVHapticSequence init](&v20, sel_init);
  v13 = v12;
  if (v12)
  {
    -[AVHapticSequence setPlayer:](v12, "setPlayer:", v9);
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 0xFFFFFFFFLL;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    *(_QWORD *)&buf[24] = __Block_byref_object_copy__4;
    v22 = __Block_byref_object_dispose__4;
    v23 = 0;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __52__AVHapticSequence_initWithDictionary_player_error___block_invoke;
    v15[3] = &unk_1E69602F0;
    v15[4] = &v16;
    v15[5] = buf;
    if ((objc_msgSend(v9, "loadAndPrepareHapticSequenceFromVibePattern:reply:", v8, v15) & 1) != 0)
    {
      -[AVHapticSequence setSeqID:](v13, "setSeqID:", v17[3]);
      -[AVHapticSequence setLastStartTime:](v13, "setLastStartTime:", -1.0);
      *(_WORD *)&v13->_loopIsEnabled = 0;
      v13->_playbackRate = 1.0;
      v13->_duration = 5.0;
      *(_OWORD *)&v13->_channelCount = xmmword_1B5794510;
      if (!a5)
        goto LABEL_14;
    }
    else
    {

      v13 = 0;
      if (!a5)
      {
LABEL_14:
        _Block_object_dispose(buf, 8);

        _Block_object_dispose(&v16, 8);
        goto LABEL_15;
      }
    }
    *a5 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
    goto LABEL_14;
  }
LABEL_15:

  return v13;
}

void __52__AVHapticSequence_initWithDictionary_player_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (kAVHCScope)
  {
    v6 = *(id *)kAVHCScope;
    if (!v6)
      goto LABEL_8;
  }
  else
  {
    v6 = MEMORY[0x1E0C81028];
    v7 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v10 = 136316162;
    v11 = "AVHapticPlayer.mm";
    v12 = 1024;
    v13 = 956;
    v14 = 2080;
    v15 = "-[AVHapticSequence initWithDictionary:player:error:]_block_invoke";
    v16 = 1024;
    v17 = a2;
    v18 = 2112;
    v19 = v5;
    _os_log_impl(&dword_1B573F000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: initWithDictionary: reply block for hapticPlayer loadAndPrepareHapticSequenceFromVibePattern: replyID: %u, replyError: %@", (uint8_t *)&v10, 0x2Cu);
  }

LABEL_8:
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;

}

- (void)dealloc
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  objc_super v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  AVHapticSequence *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (kAVHCScope)
  {
    v3 = *(id *)kAVHCScope;
    if (!v3)
      goto LABEL_8;
  }
  else
  {
    v3 = (id)MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  v5 = v3;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    -[AVHapticSequence player](self, "player");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "client");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316162;
    v14 = "AVHapticPlayer.mm";
    v15 = 1024;
    v16 = 982;
    v17 = 2080;
    v18 = "-[AVHapticSequence dealloc]";
    v19 = 2048;
    v20 = self;
    v21 = 2048;
    v22 = objc_msgSend(v7, "clientID");
    _os_log_impl(&dword_1B573F000, v5, OS_LOG_TYPE_INFO, "%25s:%-5d %s: dealloc seq %p, clientID: 0x%lx", buf, 0x30u);

  }
LABEL_8:
  if (self->_loopIsEnabled)
  {
    if (kAVHCScope)
    {
      v8 = *(id *)kAVHCScope;
      if (!v8)
      {
LABEL_16:
        -[AVHapticSequence player](self, "player");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "enableSequenceLooping:enable:error:", self->_seqID, 0, 0);

        goto LABEL_17;
      }
    }
    else
    {
      v8 = MEMORY[0x1E0C81028];
      v9 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v14 = "AVHapticPlayer.mm";
      v15 = 1024;
      v16 = 984;
      v17 = 2080;
      v18 = "-[AVHapticSequence dealloc]";
      _os_log_impl(&dword_1B573F000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Destroying a sequence that is still looping!  Disabling loop.", buf, 0x1Cu);
    }

    goto LABEL_16;
  }
LABEL_17:
  -[AVHapticSequence player](self, "player");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "detachHapticSequence:", self->_seqID);

  self->_seqID = -1;
  v12.receiver = self;
  v12.super_class = (Class)AVHapticSequence;
  -[AVHapticSequence dealloc](&v12, sel_dealloc);
}

- (unint64_t)eventBehavior
{
  return self->_eventBehavior;
}

- (void)setEventBehavior:(unint64_t)a3
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  char v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  id v16;
  int v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (kAVHCScope)
  {
    v5 = *(id *)kAVHCScope;
    if (!v5)
      goto LABEL_8;
  }
  else
  {
    v5 = (id)MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  v7 = v5;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[AVHapticSequence player](self, "player");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "client");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 136316418;
    v18 = "AVHapticPlayer.mm";
    v19 = 1024;
    v20 = 999;
    v21 = 2080;
    v22 = "-[AVHapticSequence setEventBehavior:]";
    v23 = 2048;
    v24 = objc_msgSend(v9, "clientID");
    v25 = 1024;
    v26 = -[AVHapticSequence seqID](self, "seqID");
    v27 = 1024;
    v28 = a3;
    _os_log_impl(&dword_1B573F000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: clientID: 0x%lx seqID: %u behavior: %u", (uint8_t *)&v17, 0x32u);

  }
LABEL_8:
  if (self->_eventBehavior == a3)
    return;
  if (a3 > 7)
  {
    if (kAVHCScope)
    {
      v15 = *(id *)kAVHCScope;
      if (!v15)
        return;
    }
    else
    {
      v15 = MEMORY[0x1E0C81028];
      v16 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v17 = 136315906;
      v18 = "AVHapticPlayer.mm";
      v19 = 1024;
      v20 = 1002;
      v21 = 2080;
      v22 = "-[AVHapticSequence setEventBehavior:]";
      v23 = 1024;
      LODWORD(v24) = a3;
      _os_log_impl(&dword_1B573F000, v15, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Illegal event behavior: %u", (uint8_t *)&v17, 0x22u);
    }

  }
  else
  {
    if (!-[AVHapticSequence channelCount](self, "channelCount"))
      goto LABEL_14;
    v10 = 0;
    v11 = 1;
    do
    {
      -[AVHapticSequence player](self, "player");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "client");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "setSequenceEventBehavior:behavior:channel:", -[AVHapticSequence seqID](self, "seqID"), a3, v10);

      v11 &= v14;
      ++v10;
    }
    while (v10 < -[AVHapticSequence channelCount](self, "channelCount"));
    if ((v11 & 1) != 0)
LABEL_14:
      self->_eventBehavior = a3;
  }
}

- (BOOL)setLoopingEnabled:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v5;
  void *v7;
  int v8;

  if (self->_seqID == -1)
  {
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", 1020, "-[AVHapticSequence setLoopingEnabled:error:]", "_seqID != kInvalidSequenceID", -4812, a4);
  }
  else
  {
    v5 = a3;
    -[AVHapticSequence player](self, "player");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "enableSequenceLooping:enable:error:", self->_seqID, v5, a4);

    if (v8)
    {
      self->_loopIsEnabled = v5;
      return 1;
    }
  }
  return 0;
}

- (void)setCompletionHandler:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[AVHapticSequence player](self, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSequenceFinishedHandlerForID:finishedHandler:", self->_seqID, v6);

}

- (id)completionHandler
{
  void *v3;
  void *v4;
  void *v5;

  -[AVHapticSequence player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "client");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getSequenceFinishedHandlerForID:", self->_seqID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)getChannelCount
{
  AVHapticSequence *v2;
  unint64_t channelCount;

  v2 = self;
  objc_sync_enter(v2);
  channelCount = v2->_channelCount;
  objc_sync_exit(v2);

  return channelCount;
}

- (BOOL)loopingEnabled
{
  return self->_loopIsEnabled;
}

- (void)setLoopingEnabled:(BOOL)a3
{
  -[AVHapticSequence setLoopingEnabled:error:](self, "setLoopingEnabled:error:", a3, 0);
}

- (BOOL)setLoopLength:(float)a3 error:(id *)a4
{
  void *v7;
  double v8;
  int v9;

  -[AVHapticSequence player](self, "player");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v8 = a3;
  v9 = objc_msgSend(v7, "setSequenceLoopLength:length:error:", self->_seqID, a4, v8);

  if (v9)
    self->_loopLength = a3;
  return v9;
}

- (float)playbackRate
{
  return self->_playbackRate;
}

- (void)setPlaybackRate:(float)a3
{
  void *v5;
  double v6;
  int v7;

  -[AVHapticSequence player](self, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v6 = a3;
  v7 = objc_msgSend(v5, "setSequencePlaybackRate:rate:error:", self->_seqID, 0, v6);

  if (v7)
    self->_playbackRate = a3;
}

- (BOOL)prepareToPlayAndReturnError:(id *)a3
{
  AVHapticSequence *v4;
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  void *v14;
  char v15;
  char v16;
  int v17;
  const char *v18;
  uint64_t v19;
  char v20;
  int v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = self;
  objc_sync_enter(v4);
  if (kAVHCScope)
  {
    v5 = *(id *)kAVHCScope;
    if (!v5)
      goto LABEL_8;
  }
  else
  {
    v5 = (id)MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  v7 = v5;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[AVHapticSequence player](v4, "player");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "client");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 136315906;
    v23 = "AVHapticPlayer.mm";
    v24 = 1024;
    v25 = 1077;
    v26 = 2080;
    v27 = "-[AVHapticSequence prepareToPlayAndReturnError:]";
    v28 = 2048;
    v29 = objc_msgSend(v9, "clientID");
    _os_log_impl(&dword_1B573F000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: prepare to play seq: clientID: 0x%lx", (uint8_t *)&v22, 0x26u);

  }
LABEL_8:
  -[AVHapticSequence player](v4, "player");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "resourcesAllocated");

  if ((v11 & 1) == 0)
  {
    v17 = -4807;
    v18 = "self.player.resourcesAllocated";
    v19 = 1078;
LABEL_16:
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", v19, "-[AVHapticSequence prepareToPlayAndReturnError:]", v18, v17, a3);
    v16 = 0;
    v20 = 0;
    goto LABEL_19;
  }
  if (v4->_seqID == -1)
  {
    v17 = -4812;
    v18 = "_seqID != kInvalidSequenceID";
    v19 = 1079;
    goto LABEL_16;
  }
  -[AVHapticSequence player](v4, "player");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "prepareHapticSequence:error:", v4->_seqID, a3);

  if (v13)
  {
    if (-[AVHapticSequence loopingEnabled](v4, "loopingEnabled")
      && (-[AVHapticSequence player](v4, "player"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v15 = objc_msgSend(v14, "enableSequenceLooping:enable:error:", v4->_seqID, 1, a3),
          v14,
          (v15 & 1) == 0))
    {
      v16 = 0;
      v4->_loopIsEnabled = 0;
    }
    else
    {
      v16 = 1;
    }
  }
  else
  {
    v16 = 0;
  }
  v20 = 1;
LABEL_19:
  objc_sync_exit(v4);

  return v16 & v20;
}

- (BOOL)playAtTime:(double)a3 offset:(double)a4 error:(id *)a5
{
  AVHapticSequence *v8;
  id v9;
  id v10;
  NSObject *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  double playbackRate;
  _BOOL4 isMuted;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  char v27;
  id v28;
  int v29;
  const char *v30;
  uint64_t v31;
  char v32;
  char v33;
  id v35;
  NSObject *v36;
  int v37;
  int v38;
  const char *v39;
  _BOOL4 v40;
  uint64_t v41;
  double v42;
  void *v43;
  float v44;
  double v45;
  void *v46;
  double v47;
  void *v48;
  int v49;
  _BYTE v50[18];
  __int16 v51;
  const char *v52;
  __int16 v53;
  int v54;
  __int16 v55;
  _BYTE v56[18];
  __int16 v57;
  double v58;
  __int16 v59;
  double v60;
  __int16 v61;
  _BOOL4 v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v8 = self;
  objc_sync_enter(v8);
  if (kAVHCScope)
  {
    v9 = *(id *)kAVHCScope;
    if (!v9)
      goto LABEL_8;
  }
  else
  {
    v9 = (id)MEMORY[0x1E0C81028];
    v10 = MEMORY[0x1E0C81028];
  }
  v11 = v9;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = -[AVHapticSequence seqID](v8, "seqID");
    -[AVHapticSequence player](v8, "player");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "client");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "clientID");
    playbackRate = v8->_playbackRate;
    isMuted = v8->_isMuted;
    *(_DWORD *)v50 = 136317186;
    *(_QWORD *)&v50[4] = "AVHapticPlayer.mm";
    *(_WORD *)&v50[12] = 1024;
    *(_DWORD *)&v50[14] = 1096;
    v51 = 2080;
    v52 = "-[AVHapticSequence playAtTime:offset:error:]";
    v53 = 1024;
    v54 = v12;
    v55 = 2048;
    *(_QWORD *)v56 = v15;
    *(_WORD *)&v56[8] = 2048;
    *(double *)&v56[10] = a3;
    v57 = 2048;
    v58 = a4;
    v59 = 2048;
    v60 = playbackRate;
    v61 = 1024;
    v62 = isMuted;
    _os_log_impl(&dword_1B573F000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: play seq %u: clientID: 0x%lx time: %.3f offsetTime: %.3f playback rate: %.1f muted: %d", v50, 0x50u);

  }
LABEL_8:
  -[AVHapticSequence player](v8, "player");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "resourcesAllocated");

  if ((v19 & 1) == 0)
  {
    v29 = -4807;
    v30 = "self.player.resourcesAllocated";
    v31 = 1097;
LABEL_23:
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", v31, "-[AVHapticSequence playAtTime:offset:error:]", v30, v29, a5);
    v32 = 0;
    v33 = 0;
    goto LABEL_24;
  }
  -[AVHapticSequence player](v8, "player");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "client");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "clientID") == -1;

  if (v22)
  {
    v29 = -4812;
    v30 = "self.player.client.clientID != kInvalidClientID";
    v31 = 1098;
    goto LABEL_23;
  }
  -[AVHapticSequence player](v8, "player");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "client");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "running");

  if ((v25 & 1) == 0)
  {
    v29 = -4805;
    v30 = "self.player.client.running";
    v31 = 1099;
    goto LABEL_23;
  }
  if (v8->_seqID == -1)
  {
    v29 = -4812;
    v30 = "_seqID != kInvalidSequenceID";
    v31 = 1100;
    goto LABEL_23;
  }
  if (-[AVHapticSequence loopingEnabled](v8, "loopingEnabled"))
  {
    -[AVHapticSequence player](v8, "player");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "enableSequenceLooping:enable:error:", v8->_seqID, 1, a5);

    if ((v27 & 1) == 0)
      v8->_loopIsEnabled = 0;
  }
  if (-[AVHapticSequence channelCount](v8, "channelCount") < 2)
    goto LABEL_37;
  if (!kAVHCScope)
  {
    v28 = (id)MEMORY[0x1E0C81028];
    v35 = MEMORY[0x1E0C81028];
    goto LABEL_26;
  }
  v28 = *(id *)kAVHCScope;
  if (v28)
  {
LABEL_26:
    v36 = v28;
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      v37 = -[AVHapticSequence seqID](v8, "seqID");
      v38 = -[AVHapticSequence activeChannel](v8, "activeChannel");
      v39 = "but sequence was muted";
      v40 = v8->_isMuted;
      *(_QWORD *)&v50[4] = "AVHapticPlayer.mm";
      *(_DWORD *)v50 = 136316418;
      *(_WORD *)&v50[12] = 1024;
      if (!v40)
        v39 = "";
      *(_DWORD *)&v50[14] = 1108;
      v51 = 2080;
      v52 = "-[AVHapticSequence playAtTime:offset:error:]";
      v53 = 1024;
      v54 = v37;
      v55 = 1024;
      *(_DWORD *)v56 = v38;
      *(_WORD *)&v56[4] = 2080;
      *(_QWORD *)&v56[6] = v39;
      _os_log_impl(&dword_1B573F000, v36, OS_LOG_TYPE_INFO, "%25s:%-5d %s: soloing sequence ID: %u track %u %s", v50, 0x32u);
    }

  }
  v41 = -[AVHapticSequence channelCount](v8, "channelCount", *(_OWORD *)v50);
  if (v41 - 1 >= 0)
  {
    do
    {
      --v41;
      v42 = 1.0;
      if (!v8->_isMuted)
      {
        if (v41 == -[AVHapticSequence activeChannel](v8, "activeChannel"))
          v42 = 0.0;
        else
          v42 = 1.0;
      }
      -[AVHapticSequence player](v8, "player");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v42;
      *(float *)&v45 = v44;
      objc_msgSend(v43, "setSequenceChannelParam:atTime:channel:param:value:error:", v8->_seqID, v41, 1014, a5, a3, v45);

      -[AVHapticSequence player](v8, "player");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v47 = v44;
      objc_msgSend(v46, "setSequenceChannelParam:atTime:channel:param:value:error:", v8->_seqID, v41, 2014, a5, a3, v47);

    }
    while (v41 > 0);
  }
LABEL_37:
  -[AVHapticSequence player](v8, "player");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v48, "playHapticSequence:atTime:offset:", v8->_seqID, a3, a4);

  if (v49)
  {
    -[AVHapticSequence setLastStartTime:](v8, "setLastStartTime:", a3);
    v32 = 1;
    v33 = 1;
  }
  else
  {
    v33 = 0;
    v32 = 1;
  }
LABEL_24:
  objc_sync_exit(v8);

  return v32 & v33;
}

- (BOOL)stopAtTime:(double)a3 error:(id *)a4
{
  AVHapticSequence *v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  char v21;
  int v22;
  const char *v23;
  uint64_t v24;
  int v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  double v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = self;
  objc_sync_enter(v6);
  if (kAVHCScope)
  {
    v7 = *(id *)kAVHCScope;
    if (!v7)
      goto LABEL_8;
  }
  else
  {
    v7 = (id)MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  v9 = v7;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[AVHapticSequence player](v6, "player");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "client");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 136316162;
    v27 = "AVHapticPlayer.mm";
    v28 = 1024;
    v29 = 1128;
    v30 = 2080;
    v31 = "-[AVHapticSequence stopAtTime:error:]";
    v32 = 2048;
    v33 = objc_msgSend(v11, "clientID");
    v34 = 2048;
    v35 = a3;
    _os_log_impl(&dword_1B573F000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: stop seq: clientID: 0x%lx time: %.3f", (uint8_t *)&v26, 0x30u);

  }
LABEL_8:
  -[AVHapticSequence player](v6, "player");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "resourcesAllocated");

  if ((v13 & 1) == 0)
  {
    v22 = -4807;
    v23 = "self.player.resourcesAllocated";
    v24 = 1129;
LABEL_19:
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", v24, "-[AVHapticSequence stopAtTime:error:]", v23, v22, a4);
    LOBYTE(a4) = 0;
    v21 = 0;
    goto LABEL_20;
  }
  -[AVHapticSequence player](v6, "player");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "client");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "clientID") == -1;

  if (v16)
  {
    v22 = -4812;
    v23 = "self.player.client.clientID != kInvalidClientID";
    v24 = 1130;
    goto LABEL_19;
  }
  -[AVHapticSequence player](v6, "player");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "client");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "running");

  if ((v19 & 1) == 0)
  {
    v22 = -4805;
    v23 = "self.player.client.running";
    v24 = 1131;
    goto LABEL_19;
  }
  if (v6->_seqID == -1)
  {
    v22 = -4812;
    v23 = "_seqID != kInvalidSequenceID";
    v24 = 1132;
    goto LABEL_19;
  }
  -[AVHapticSequence player](v6, "player");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a4) = objc_msgSend(v20, "stopHapticSequence:atTime:", v6->_seqID, a3);

  if ((_DWORD)a4)
  {
    -[AVHapticSequence setLastStartTime:](v6, "setLastStartTime:", -1.0);
    LOBYTE(a4) = 1;
  }
  v21 = 1;
LABEL_20:
  objc_sync_exit(v6);

  return a4 & v21;
}

- (BOOL)pauseAtTime:(double)a3 error:(id *)a4
{
  AVHapticSequence *v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  char v21;
  int v22;
  const char *v23;
  uint64_t v24;
  int v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  double v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = self;
  objc_sync_enter(v6);
  if (kAVHCScope)
  {
    v7 = *(id *)kAVHCScope;
    if (!v7)
      goto LABEL_8;
  }
  else
  {
    v7 = (id)MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  v9 = v7;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[AVHapticSequence player](v6, "player");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "client");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 136316162;
    v27 = "AVHapticPlayer.mm";
    v28 = 1024;
    v29 = 1146;
    v30 = 2080;
    v31 = "-[AVHapticSequence pauseAtTime:error:]";
    v32 = 2048;
    v33 = objc_msgSend(v11, "clientID");
    v34 = 2048;
    v35 = a3;
    _os_log_impl(&dword_1B573F000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: pause seq: clientID: 0x%lx time: %.3f", (uint8_t *)&v26, 0x30u);

  }
LABEL_8:
  -[AVHapticSequence player](v6, "player");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "resourcesAllocated");

  if ((v13 & 1) == 0)
  {
    v22 = -4807;
    v23 = "self.player.resourcesAllocated";
    v24 = 1147;
LABEL_17:
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", v24, "-[AVHapticSequence pauseAtTime:error:]", v23, v22, a4);
    v21 = 0;
    goto LABEL_18;
  }
  -[AVHapticSequence player](v6, "player");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "client");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "clientID") == -1;

  if (v16)
  {
    v22 = -4812;
    v23 = "self.player.client.clientID != kInvalidClientID";
    v24 = 1148;
    goto LABEL_17;
  }
  -[AVHapticSequence player](v6, "player");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "client");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "running");

  if ((v19 & 1) == 0)
  {
    v22 = -4805;
    v23 = "self.player.client.running";
    v24 = 1149;
    goto LABEL_17;
  }
  if (v6->_seqID == -1)
  {
    v22 = -4812;
    v23 = "_seqID != kInvalidSequenceID";
    v24 = 1150;
    goto LABEL_17;
  }
  -[AVHapticSequence player](v6, "player");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "pauseHapticSequence:atTime:", v6->_seqID, a3);

LABEL_18:
  objc_sync_exit(v6);

  return v21;
}

- (BOOL)resumeAtTime:(double)a3 error:(id *)a4
{
  AVHapticSequence *v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  char v21;
  int v22;
  const char *v23;
  uint64_t v24;
  int v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  double v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = self;
  objc_sync_enter(v6);
  if (kAVHCScope)
  {
    v7 = *(id *)kAVHCScope;
    if (!v7)
      goto LABEL_8;
  }
  else
  {
    v7 = (id)MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  v9 = v7;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[AVHapticSequence player](v6, "player");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "client");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 136316162;
    v27 = "AVHapticPlayer.mm";
    v28 = 1024;
    v29 = 1161;
    v30 = 2080;
    v31 = "-[AVHapticSequence resumeAtTime:error:]";
    v32 = 2048;
    v33 = objc_msgSend(v11, "clientID");
    v34 = 2048;
    v35 = a3;
    _os_log_impl(&dword_1B573F000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: resume seq: clientID: 0x%lx time: %.3f", (uint8_t *)&v26, 0x30u);

  }
LABEL_8:
  -[AVHapticSequence player](v6, "player");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "resourcesAllocated");

  if ((v13 & 1) == 0)
  {
    v22 = -4807;
    v23 = "self.player.resourcesAllocated";
    v24 = 1162;
LABEL_17:
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", v24, "-[AVHapticSequence resumeAtTime:error:]", v23, v22, a4);
    v21 = 0;
    goto LABEL_18;
  }
  -[AVHapticSequence player](v6, "player");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "client");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "clientID") == -1;

  if (v16)
  {
    v22 = -4812;
    v23 = "self.player.client.clientID != kInvalidClientID";
    v24 = 1163;
    goto LABEL_17;
  }
  -[AVHapticSequence player](v6, "player");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "client");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "running");

  if ((v19 & 1) == 0)
  {
    v22 = -4805;
    v23 = "self.player.client.running";
    v24 = 1164;
    goto LABEL_17;
  }
  if (v6->_seqID == -1)
  {
    v22 = -4812;
    v23 = "_seqID != kInvalidSequenceID";
    v24 = 1165;
    goto LABEL_17;
  }
  -[AVHapticSequence player](v6, "player");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "resumeHapticSequence:atTime:", v6->_seqID, a3);

LABEL_18:
  objc_sync_exit(v6);

  return v21;
}

- (BOOL)seekToTime:(double)a3 error:(id *)a4
{
  AVHapticSequence *v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  char v21;
  int v22;
  const char *v23;
  uint64_t v24;
  int v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = self;
  objc_sync_enter(v6);
  if (kAVHCScope)
  {
    v7 = *(id *)kAVHCScope;
    if (!v7)
      goto LABEL_8;
  }
  else
  {
    v7 = (id)MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  v9 = v7;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[AVHapticSequence player](v6, "player");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "client");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 136315906;
    v27 = "AVHapticPlayer.mm";
    v28 = 1024;
    v29 = 1176;
    v30 = 2080;
    v31 = "-[AVHapticSequence seekToTime:error:]";
    v32 = 2048;
    v33 = objc_msgSend(v11, "clientID");
    _os_log_impl(&dword_1B573F000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: seek seq: clientID: 0x%lx time: NOW", (uint8_t *)&v26, 0x26u);

  }
LABEL_8:
  -[AVHapticSequence player](v6, "player");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "resourcesAllocated");

  if ((v13 & 1) == 0)
  {
    v22 = -4807;
    v23 = "self.player.resourcesAllocated";
    v24 = 1177;
LABEL_17:
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", v24, "-[AVHapticSequence seekToTime:error:]", v23, v22, a4);
    v21 = 0;
    goto LABEL_18;
  }
  -[AVHapticSequence player](v6, "player");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "client");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "clientID") == -1;

  if (v16)
  {
    v22 = -4812;
    v23 = "self.player.client.clientID != kInvalidClientID";
    v24 = 1178;
    goto LABEL_17;
  }
  -[AVHapticSequence player](v6, "player");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "client");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "running");

  if ((v19 & 1) == 0)
  {
    v22 = -4805;
    v23 = "self.player.client.running";
    v24 = 1179;
    goto LABEL_17;
  }
  if (v6->_seqID == -1)
  {
    v22 = -4812;
    v23 = "_seqID != kInvalidSequenceID";
    v24 = 1180;
    goto LABEL_17;
  }
  -[AVHapticSequence player](v6, "player");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "seekHapticSequence:toTime:", v6->_seqID, a3);

LABEL_18:
  objc_sync_exit(v6);

  return v21;
}

- (BOOL)resetAtTime:(double)a3 error:(id *)a4
{
  AVHapticSequence *v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  char v18;
  int v19;
  const char *v20;
  uint64_t v21;
  int v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  double v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = self;
  objc_sync_enter(v6);
  if (kAVHCScope)
  {
    v7 = *(id *)kAVHCScope;
    if (!v7)
      goto LABEL_8;
  }
  else
  {
    v7 = (id)MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  v9 = v7;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[AVHapticSequence player](v6, "player");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "client");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 136316162;
    v24 = "AVHapticPlayer.mm";
    v25 = 1024;
    v26 = 1193;
    v27 = 2080;
    v28 = "-[AVHapticSequence resetAtTime:error:]";
    v29 = 2048;
    v30 = objc_msgSend(v11, "clientID");
    v31 = 2048;
    v32 = a3;
    _os_log_impl(&dword_1B573F000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: reset parameters on seq: clientID: 0x%lx time: %.3f ", (uint8_t *)&v23, 0x30u);

  }
LABEL_8:
  -[AVHapticSequence player](v6, "player");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "resourcesAllocated");

  if ((v13 & 1) == 0)
  {
    v19 = -4807;
    v20 = "self.player.resourcesAllocated";
    v21 = 1194;
LABEL_15:
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", v21, "-[AVHapticSequence resetAtTime:error:]", v20, v19, a4);
    v18 = 0;
    goto LABEL_16;
  }
  -[AVHapticSequence player](v6, "player");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "client");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "clientID") == -1;

  if (v16)
  {
    v19 = -4812;
    v20 = "self.player.client.clientID != kInvalidClientID";
    v21 = 1195;
    goto LABEL_15;
  }
  if (v6->_seqID == -1)
  {
    v19 = -4812;
    v20 = "_seqID != kInvalidSequenceID";
    v21 = 1196;
    goto LABEL_15;
  }
  -[AVHapticSequence player](v6, "player");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "resetHapticSequence:atTime:", v6->_seqID, a3);

LABEL_16:
  objc_sync_exit(v6);

  return v18;
}

- (BOOL)setParameter:(unint64_t)a3 value:(float)a4 channel:(unint64_t)a5 atTime:(double)a6 error:(id *)a7
{
  AVHapticSequence *v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  double v27;
  char v28;
  int v29;
  const char *v30;
  uint64_t v31;
  int v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  int v42;
  __int16 v43;
  double v44;
  __int16 v45;
  int v46;
  __int16 v47;
  double v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v12 = self;
  objc_sync_enter(v12);
  if (kAVHCScope)
  {
    v13 = *(id *)kAVHCScope;
    if (!v13)
      goto LABEL_8;
  }
  else
  {
    v13 = (id)MEMORY[0x1E0C81028];
    v14 = MEMORY[0x1E0C81028];
  }
  v15 = v13;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    -[AVHapticSequence player](v12, "player");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "client");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 136316930;
    v34 = "AVHapticPlayer.mm";
    v35 = 1024;
    v36 = 1209;
    v37 = 2080;
    v38 = "-[AVHapticSequence setParameter:value:channel:atTime:error:]";
    v39 = 2048;
    v40 = objc_msgSend(v17, "clientID");
    v41 = 1024;
    v42 = a3;
    v43 = 2048;
    v44 = a4;
    v45 = 1024;
    v46 = a5;
    v47 = 2048;
    v48 = a6;
    _os_log_impl(&dword_1B573F000, v15, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: set param on seq: clientID: 0x%lx type: %u value: %.2f channelIndex: %u atTime: %.3f", (uint8_t *)&v33, 0x46u);

  }
LABEL_8:
  if (-[AVHapticSequence channelCount](v12, "channelCount") <= a5)
  {
    v29 = -4804;
    v30 = "channelIndex < self.channelCount";
    v31 = 1210;
LABEL_19:
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", v31, "-[AVHapticSequence setParameter:value:channel:atTime:error:]", v30, v29, a7);
    v28 = 0;
    goto LABEL_20;
  }
  -[AVHapticSequence player](v12, "player");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "resourcesAllocated");

  if ((v19 & 1) == 0)
  {
    v29 = -4807;
    v30 = "self.player.resourcesAllocated";
    v31 = 1211;
    goto LABEL_19;
  }
  -[AVHapticSequence player](v12, "player");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "client");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "clientID") == -1;

  if (v22)
  {
    v29 = -4812;
    v30 = "self.player.client.clientID != kInvalidClientID";
    v31 = 1212;
    goto LABEL_19;
  }
  -[AVHapticSequence player](v12, "player");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "client");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "running");

  if ((v25 & 1) == 0)
  {
    v29 = -4805;
    v30 = "self.player.client.running";
    v31 = 1213;
    goto LABEL_19;
  }
  if (v12->_seqID == -1)
  {
    v29 = -4812;
    v30 = "_seqID != kInvalidSequenceID";
    v31 = 1214;
    goto LABEL_19;
  }
  -[AVHapticSequence player](v12, "player");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v27 = a4;
  v28 = objc_msgSend(v26, "setSequenceChannelParam:atTime:channel:param:value:error:", v12->_seqID, a5, a3, a7, a6, v27);

LABEL_20:
  objc_sync_exit(v12);

  return v28;
}

- (BOOL)cancelAndReturnError:(id *)a3
{
  AVHapticSequence *v4;
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  int v20;
  const char *v21;
  uint64_t v22;
  int v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = self;
  objc_sync_enter(v4);
  if (kAVHCScope)
  {
    v5 = *(id *)kAVHCScope;
    if (!v5)
      goto LABEL_8;
  }
  else
  {
    v5 = (id)MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  v7 = v5;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[AVHapticSequence player](v4, "player");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "client");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 136315906;
    v25 = "AVHapticPlayer.mm";
    v26 = 1024;
    v27 = 1224;
    v28 = 2080;
    v29 = "-[AVHapticSequence cancelAndReturnError:]";
    v30 = 2048;
    v31 = objc_msgSend(v9, "clientID");
    _os_log_impl(&dword_1B573F000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: cancel seq: clientID: 0x%lx", (uint8_t *)&v24, 0x26u);

  }
LABEL_8:
  -[AVHapticSequence player](v4, "player");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "resourcesAllocated");

  if ((v11 & 1) == 0)
  {
    v20 = -4807;
    v21 = "self.player.resourcesAllocated";
    v22 = 1225;
LABEL_17:
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", v22, "-[AVHapticSequence cancelAndReturnError:]", v21, v20, a3);
    v19 = 0;
    goto LABEL_18;
  }
  -[AVHapticSequence player](v4, "player");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "client");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "clientID") == -1;

  if (v14)
  {
    v20 = -4812;
    v21 = "self.player.client.clientID != kInvalidClientID";
    v22 = 1226;
    goto LABEL_17;
  }
  -[AVHapticSequence player](v4, "player");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "client");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "running");

  if ((v17 & 1) == 0)
  {
    v20 = -4805;
    v21 = "self.player.client.running";
    v22 = 1227;
    goto LABEL_17;
  }
  if (v4->_seqID == -1)
  {
    v20 = -4812;
    v21 = "_seqID != kInvalidSequenceID";
    v22 = 1228;
    goto LABEL_17;
  }
  -[AVHapticSequence player](v4, "player");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "clearSequenceEvents:atTime:", v4->_seqID, 0.0);

LABEL_18:
  objc_sync_exit(v4);

  return v19;
}

- (BOOL)activateChannelByIndex:(unint64_t)a3 atTime:(double)a4 error:(id *)a5
{
  AVHapticSequence *v8;
  id v9;
  id v10;
  NSObject *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _BOOL4 isMuted;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  int v24;
  double v25;
  double v26;
  const CALog::Scope *v27;
  double v28;
  double v29;
  NSObject *v30;
  NSObject *v31;
  int v32;
  const char *v33;
  uint64_t v34;
  char v35;
  NSObject *v37;
  unint64_t v38;
  double v39;
  void *v40;
  float v41;
  double v42;
  void *v43;
  double v44;
  id v45;
  int v46;
  const char *v47;
  __int16 v48;
  int v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  _BYTE v53[14];
  __int16 v54;
  double v55;
  __int16 v56;
  int v57;
  __int16 v58;
  _BOOL4 v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v8 = self;
  objc_sync_enter(v8);
  if (kAVHCScope)
  {
    v9 = *(id *)kAVHCScope;
    if (!v9)
      goto LABEL_8;
  }
  else
  {
    v9 = (id)MEMORY[0x1E0C81028];
    v10 = MEMORY[0x1E0C81028];
  }
  v11 = v9;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = -[AVHapticSequence seqID](v8, "seqID");
    -[AVHapticSequence player](v8, "player");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "client");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "clientID");
    isMuted = v8->_isMuted;
    v46 = 136316930;
    v47 = "AVHapticPlayer.mm";
    v48 = 1024;
    v49 = 1240;
    v50 = 2080;
    v51 = "-[AVHapticSequence activateChannelByIndex:atTime:error:]";
    v52 = 1024;
    *(_DWORD *)v53 = v12;
    *(_WORD *)&v53[4] = 2048;
    *(_QWORD *)&v53[6] = v15;
    v54 = 2048;
    v55 = a4;
    v56 = 1024;
    v57 = a3;
    v58 = 1024;
    v59 = isMuted;
    _os_log_impl(&dword_1B573F000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: activating seqID %u track index: clientID: 0x%lx time: %.3f index: %u muted: %d", (uint8_t *)&v46, 0x42u);

  }
LABEL_8:
  if (-[AVHapticSequence channelCount](v8, "channelCount") <= a3)
  {
    v32 = -4804;
    v33 = "index < self.channelCount";
    v34 = 1241;
LABEL_25:
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", v34, "-[AVHapticSequence activateChannelByIndex:atTime:error:]", v33, v32, a5);
    v35 = 0;
    goto LABEL_26;
  }
  -[AVHapticSequence player](v8, "player");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "resourcesAllocated");

  if ((v18 & 1) == 0)
  {
    v32 = -4807;
    v33 = "self.player.resourcesAllocated";
    v34 = 1242;
    goto LABEL_25;
  }
  -[AVHapticSequence player](v8, "player");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "client");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "clientID") == -1;

  if (v21)
  {
    v32 = -4812;
    v33 = "self.player.client.clientID != kInvalidClientID";
    v34 = 1243;
    goto LABEL_25;
  }
  if (v8->_seqID == -1)
  {
    v32 = -4812;
    v33 = "_seqID != kInvalidSequenceID";
    v34 = 1244;
    goto LABEL_25;
  }
  if (-[AVHapticSequence activeChannel](v8, "activeChannel") == a3)
  {
LABEL_42:
    v35 = 1;
    goto LABEL_26;
  }
  -[AVHapticSequence setActiveChannel:](v8, "setActiveChannel:", a3);
  -[AVHapticSequence player](v8, "player");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "client");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "running");

  if (!v24)
  {
    if (kAVHCScope)
    {
      v37 = *(id *)kAVHCScope;
      if (!v37)
        goto LABEL_42;
    }
    else
    {
      v37 = MEMORY[0x1E0C81028];
      v45 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      v46 = 136315650;
      v47 = "AVHapticPlayer.mm";
      v48 = 1024;
      v49 = 1260;
      v50 = 2080;
      v51 = "-[AVHapticSequence activateChannelByIndex:atTime:error:]";
      _os_log_impl(&dword_1B573F000, v37, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Associated player is not running - action delayed until sequence start", (uint8_t *)&v46, 0x1Cu);
    }

    goto LABEL_42;
  }
  -[AVHapticSequence lastStartTime](v8, "lastStartTime");
  if (v25 == -1.0 || (-[AVHapticSequence lastStartTime](v8, "lastStartTime"), v26 <= a4))
  {
    v29 = a4;
  }
  else
  {
    -[AVHapticSequence lastStartTime](v8, "lastStartTime");
    v29 = v28;
    if (v28 > a4)
    {
      CALog::LogObjIfEnabled((CALog *)3, kAVHCScope, v27);
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = v30;
      if (v30 && os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v46 = 136315906;
        v47 = "AVHapticPlayer.mm";
        v48 = 1024;
        v49 = 1252;
        v50 = 2080;
        v51 = "-[AVHapticSequence activateChannelByIndex:atTime:error:]";
        v52 = 2048;
        *(double *)v53 = v29;
        _os_log_impl(&dword_1B573F000, v31, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: request pushed out to pending play request at time %.3f", (uint8_t *)&v46, 0x26u);
      }

    }
  }
  v38 = 0;
  v35 = 1;
  while (v38 < -[AVHapticSequence channelCount](v8, "channelCount"))
  {
    v39 = 1.0;
    if (!v8->_isMuted)
    {
      if (v38 == -[AVHapticSequence activeChannel](v8, "activeChannel"))
        v39 = 0.0;
      else
        v39 = 1.0;
    }
    -[AVHapticSequence player](v8, "player");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v39;
    *(float *)&v42 = v41;
    objc_msgSend(v40, "setSequenceChannelParam:atTime:channel:param:value:error:", v8->_seqID, v38, 1014, a5, v29, v42);

    -[AVHapticSequence player](v8, "player");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v44 = v41;
    v35 = objc_msgSend(v43, "setSequenceChannelParam:atTime:channel:param:value:error:", v8->_seqID, v38, 2014, a5, v29, v44);

    ++v38;
  }
LABEL_26:
  objc_sync_exit(v8);

  return v35 & 1;
}

- (BOOL)setVolume:(float)a3 atTime:(double)a4 error:(id *)a5
{
  AVHapticSequence *v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  BOOL v18;
  unint64_t i;
  void *v20;
  double v21;
  void *v22;
  double v23;
  int v24;
  const char *v25;
  uint64_t v26;
  BOOL v27;
  int v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  double v38;
  __int16 v39;
  double v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = self;
  objc_sync_enter(v8);
  if (kAVHCScope)
  {
    v9 = *(id *)kAVHCScope;
    if (!v9)
      goto LABEL_8;
  }
  else
  {
    v9 = (id)MEMORY[0x1E0C81028];
    v10 = MEMORY[0x1E0C81028];
  }
  v11 = v9;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    -[AVHapticSequence player](v8, "player");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "client");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 136316418;
    v30 = "AVHapticPlayer.mm";
    v31 = 1024;
    v32 = 1273;
    v33 = 2080;
    v34 = "-[AVHapticSequence setVolume:atTime:error:]";
    v35 = 2048;
    v36 = objc_msgSend(v13, "clientID");
    v37 = 2048;
    v38 = a4;
    v39 = 2048;
    v40 = a3;
    _os_log_impl(&dword_1B573F000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: set volume on seq: clientID: 0x%lx time: %.3f volume: %.3f", (uint8_t *)&v29, 0x3Au);

  }
LABEL_8:
  -[AVHapticSequence player](v8, "player");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "resourcesAllocated");

  if ((v15 & 1) == 0)
  {
    v24 = -4807;
    v25 = "self.player.resourcesAllocated";
    v26 = 1274;
LABEL_18:
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", v26, "-[AVHapticSequence setVolume:atTime:error:]", v25, v24, a5);
    v27 = 0;
    goto LABEL_19;
  }
  -[AVHapticSequence player](v8, "player");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "client");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "clientID") == -1;

  if (v18)
  {
    v24 = -4812;
    v25 = "self.player.client.clientID != kInvalidClientID";
    v26 = 1275;
    goto LABEL_18;
  }
  if (v8->_seqID == -1)
  {
    v24 = -4812;
    v25 = "_seqID != kInvalidSequenceID";
    v26 = 1276;
    goto LABEL_18;
  }
  for (i = 0; i < -[AVHapticSequence channelCount](v8, "channelCount"); ++i)
  {
    -[AVHapticSequence player](v8, "player");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v21 = a3;
    objc_msgSend(v20, "setSequenceChannelParam:atTime:channel:param:value:error:", v8->_seqID, i, 1000, a5, a4, v21);

    -[AVHapticSequence player](v8, "player");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v23 = a3;
    objc_msgSend(v22, "setSequenceChannelParam:atTime:channel:param:value:error:", v8->_seqID, i, 2000, a5, a4, v23);

  }
  v27 = 1;
LABEL_19:
  objc_sync_exit(v8);

  return v27;
}

- (BOOL)earlyUnduckAudioAtTime:(double)a3 error:(id *)a4
{
  AVHapticSequence *v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  char v18;
  int v19;
  const char *v20;
  uint64_t v21;
  int v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  double v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = self;
  objc_sync_enter(v6);
  if (kAVHCScope)
  {
    v7 = *(id *)kAVHCScope;
    if (!v7)
      goto LABEL_8;
  }
  else
  {
    v7 = (id)MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  v9 = v7;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[AVHapticSequence player](v6, "player");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "client");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 136316162;
    v24 = "AVHapticPlayer.mm";
    v25 = 1024;
    v26 = 1289;
    v27 = 2080;
    v28 = "-[AVHapticSequence earlyUnduckAudioAtTime:error:]";
    v29 = 2048;
    v30 = objc_msgSend(v11, "clientID");
    v31 = 2048;
    v32 = a3;
    _os_log_impl(&dword_1B573F000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: early unduck audio on seq: clientID: 0x%lx time: %.3f", (uint8_t *)&v23, 0x30u);

  }
LABEL_8:
  -[AVHapticSequence player](v6, "player");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "resourcesAllocated");

  if ((v13 & 1) == 0)
  {
    v19 = -4807;
    v20 = "self.player.resourcesAllocated";
    v21 = 1290;
LABEL_15:
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", v21, "-[AVHapticSequence earlyUnduckAudioAtTime:error:]", v20, v19, a4);
    v18 = 0;
    goto LABEL_16;
  }
  -[AVHapticSequence player](v6, "player");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "client");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "clientID") == -1;

  if (v16)
  {
    v19 = -4812;
    v20 = "self.player.client.clientID != kInvalidClientID";
    v21 = 1291;
    goto LABEL_15;
  }
  if (v6->_seqID == -1)
  {
    v19 = -4812;
    v20 = "_seqID != kInvalidSequenceID";
    v21 = 1292;
    goto LABEL_15;
  }
  -[AVHapticSequence player](v6, "player");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "sendUnduckAudioCommand:atTime:", v6->_seqID, a3);

LABEL_16:
  objc_sync_exit(v6);

  return v18;
}

- (AVHapticPlayer)player
{
  return (AVHapticPlayer *)objc_loadWeakRetained((id *)&self->_player);
}

- (void)setPlayer:(id)a3
{
  objc_storeWeak((id *)&self->_player, a3);
}

- (unint64_t)seqID
{
  return self->_seqID;
}

- (void)setSeqID:(unint64_t)a3
{
  self->_seqID = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)lastStartTime
{
  return self->_lastStartTime;
}

- (void)setLastStartTime:(double)a3
{
  self->_lastStartTime = a3;
}

- (unint64_t)activeChannel
{
  return self->_activeChannel;
}

- (void)setActiveChannel:(unint64_t)a3
{
  self->_activeChannel = a3;
}

- (BOOL)isMuted
{
  return self->_isMuted;
}

- (void)setIsMuted:(BOOL)a3
{
  self->_isMuted = a3;
}

- (unint64_t)channelCount
{
  return self->_channelCount;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_player);
}

@end
