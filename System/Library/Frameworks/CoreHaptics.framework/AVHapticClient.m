@implementation AVHapticClient

void __48__AVHapticClient_requestAssignedChannels_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  NSObject *v8;
  id v9;
  id WeakRetained;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v5, "count");
  if (kAVHCScope)
  {
    v8 = *(id *)kAVHCScope;
    if (!v8)
      goto LABEL_8;
  }
  else
  {
    v8 = MEMORY[0x1E0C81028];
    v9 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v11 = 136315906;
    v12 = "AVHapticClient.mm";
    v13 = 1024;
    v14 = 1300;
    v15 = 2080;
    v16 = "-[AVHapticClient requestAssignedChannels:error:]_block_invoke_2";
    v17 = 1024;
    v18 = v7;
    _os_log_impl(&dword_1B573F000, v8, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Server returned count of %u", (uint8_t *)&v11, 0x22u);
  }

LABEL_8:
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  if (v7)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "setChannelKeys:", v5);

  }
}

- (void)setChannelKeys:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v6, 1);
  v5 = (void *)*((_QWORD *)self + 22);
  *((_QWORD *)self + 22) = v4;

}

void __43__AVHapticClient_clientCompletedWithError___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  void *v7;
  BOOL v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD);
  id v15;
  const char *v16;
  id v17;
  int v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
  {
    if (kAVHCScope)
    {
      v4 = *(id *)kAVHCScope;
      if (!v4)
        goto LABEL_32;
    }
    else
    {
      v4 = MEMORY[0x1E0C81028];
      v15 = MEMORY[0x1E0C81028];
    }
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      goto LABEL_31;
    v18 = 136315650;
    v19 = "AVHapticClient.mm";
    v20 = 1024;
    v21 = 1467;
    v22 = 2080;
    v23 = "-[AVHapticClient clientCompletedWithError:]_block_invoke";
    v16 = "%25s:%-5d %s: AVHapticClient 'strongSelf' is nil";
    goto LABEL_30;
  }
  if (kAVHCScope)
  {
    v3 = *(id *)kAVHCScope;
    if (!v3)
      goto LABEL_12;
  }
  else
  {
    v3 = (id)MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  v6 = v3;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 136315906;
    v19 = "AVHapticClient.mm";
    v20 = 1024;
    v21 = 1456;
    v22 = 2080;
    v23 = "-[AVHapticClient clientCompletedWithError:]_block_invoke";
    v24 = 1024;
    LODWORD(v25) = objc_msgSend(WeakRetained, "clientID");
    _os_log_impl(&dword_1B573F000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Async dispatch: preparing to call completionCallback for client 0x%x", (uint8_t *)&v18, 0x22u);
  }

LABEL_12:
  objc_msgSend(WeakRetained, "completionCallback");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v8)
  {
    if (kAVHCScope)
    {
      v4 = *(id *)kAVHCScope;
      if (!v4)
        goto LABEL_32;
    }
    else
    {
      v4 = MEMORY[0x1E0C81028];
      v17 = MEMORY[0x1E0C81028];
    }
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      goto LABEL_31;
    v18 = 136315650;
    v19 = "AVHapticClient.mm";
    v20 = 1024;
    v21 = 1463;
    v22 = 2080;
    v23 = "-[AVHapticClient clientCompletedWithError:]_block_invoke";
    v16 = "%25s:%-5d %s: strongSelf.completionCallback is nil";
LABEL_30:
    _os_log_impl(&dword_1B573F000, v4, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v18, 0x1Cu);
LABEL_31:

    goto LABEL_32;
  }
  if (!kAVHCScope)
  {
    v9 = (id)MEMORY[0x1E0C81028];
    v10 = MEMORY[0x1E0C81028];
    goto LABEL_20;
  }
  v9 = *(id *)kAVHCScope;
  if (v9)
  {
LABEL_20:
    v11 = v9;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(WeakRetained, "completionCallback");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1B5E4F2B4]();
      v18 = 136315906;
      v19 = "AVHapticClient.mm";
      v20 = 1024;
      v21 = 1458;
      v22 = 2080;
      v23 = "-[AVHapticClient clientCompletedWithError:]_block_invoke";
      v24 = 2048;
      v25 = v13;
      _os_log_impl(&dword_1B573F000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Calling completionCallback %p and then setting to nil", (uint8_t *)&v18, 0x26u);

    }
  }
  objc_msgSend(WeakRetained, "completionCallback");
  v14 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v14[2](v14, *(_QWORD *)(a1 + 32));

  objc_msgSend(WeakRetained, "setCompletionCallback:", 0);
LABEL_32:

}

uint64_t __25__AVHapticClient_finish___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (kAVHCScope)
  {
    v2 = *(id *)kAVHCScope;
    if (!v2)
      return objc_msgSend(*(id *)(a1 + 32), "setCompletionCallback:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    v2 = (id)MEMORY[0x1E0C81028];
    v3 = MEMORY[0x1E0C81028];
  }
  v4 = v2;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)MEMORY[0x1B5E4F2B4](*(_QWORD *)(a1 + 40));
    v7 = 136315906;
    v8 = "AVHapticClient.mm";
    v9 = 1024;
    v10 = 425;
    v11 = 2080;
    v12 = "-[AVHapticClient finish:]_block_invoke";
    v13 = 2048;
    v14 = v5;
    _os_log_impl(&dword_1B573F000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: completionCallback set to %p", (uint8_t *)&v7, 0x26u);

  }
  return objc_msgSend(*(id *)(a1 + 32), "setCompletionCallback:", *(_QWORD *)(a1 + 40));
}

- (void)setCompletionCallback:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (id)completionCallback
{
  return objc_getProperty(self, a2, 40, 1);
}

void __42__AVHapticClient_setPlayerBehavior_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  id v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  if (v4)
  {
    if (kAVHCScope)
    {
      v5 = *(id *)kAVHCScope;
      if (!v5)
        goto LABEL_9;
    }
    else
    {
      v5 = MEMORY[0x1E0C81028];
      v6 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315906;
      v8 = "AVHapticClient.mm";
      v9 = 1024;
      v10 = 1274;
      v11 = 2080;
      v12 = "-[AVHapticClient setPlayerBehavior:error:]_block_invoke_2";
      v13 = 2112;
      v14 = v4;
      _os_log_impl(&dword_1B573F000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Got error from server: %@", (uint8_t *)&v7, 0x26u);
    }

  }
LABEL_9:

}

void __26__AVHapticClient_prewarm___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  id v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
    *((_BYTE *)WeakRetained + 157) = v3 == 0;
  if (kAVHCScope)
  {
    v6 = *(id *)kAVHCScope;
    if (!v6)
      goto LABEL_10;
  }
  else
  {
    v6 = MEMORY[0x1E0C81028];
    v7 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315650;
    v9 = "AVHapticClient.mm";
    v10 = 1024;
    v11 = 345;
    v12 = 2080;
    v13 = "-[AVHapticClient prewarm:]_block_invoke_2";
    _os_log_impl(&dword_1B573F000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Server called client-side prewarm completionCallback", (uint8_t *)&v8, 0x1Cu);
  }

LABEL_10:
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __36__AVHapticClient_allocateResources___block_invoke_2(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  _QWORD *WeakRetained;
  uint64_t HapticCommandWriter;
  NSObject *v20;
  id v21;
  NSObject *v22;
  id v23;
  int v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (v8)
  {
    if (kAVHCScope)
    {
      v9 = *(id *)kAVHCScope;
      if (!v9)
      {
LABEL_12:
        v14 = v8;
        goto LABEL_37;
      }
    }
    else
    {
      v9 = (id)MEMORY[0x1E0C81028];
      v11 = MEMORY[0x1E0C81028];
    }
    v12 = v9;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "localizedDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 136315906;
      v25 = "AVHapticClient.mm";
      v26 = 1024;
      v27 = 196;
      v28 = 2080;
      v29 = "-[AVHapticClient allocateResources:]_block_invoke_2";
      v30 = 2112;
      v31 = v13;
      _os_log_impl(&dword_1B573F000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Unable to set up client: %@", (uint8_t *)&v24, 0x26u);

    }
    goto LABEL_12;
  }
  if (kAVHCScope)
  {
    v10 = *(id *)kAVHCScope;
    if (!v10)
      goto LABEL_17;
  }
  else
  {
    v10 = MEMORY[0x1E0C81028];
    v15 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v24 = 136315906;
    v25 = "AVHapticClient.mm";
    v26 = 1024;
    v27 = 200;
    v28 = 2080;
    v29 = "-[AVHapticClient allocateResources:]_block_invoke";
    v30 = 1024;
    LODWORD(v31) = a3;
    _os_log_impl(&dword_1B573F000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Server returned shared buffer of size %u", (uint8_t *)&v24, 0x22u);
  }

LABEL_17:
  if (!a3)
    __36__AVHapticClient_allocateResources___block_invoke_2_cold_1();
  if (kAVHCScope)
  {
    v16 = *(id *)kAVHCScope;
    if (!v16)
      goto LABEL_25;
  }
  else
  {
    v16 = MEMORY[0x1E0C81028];
    v17 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v24 = 136315650;
    v25 = "AVHapticClient.mm";
    v26 = 1024;
    v27 = 202;
    v28 = 2080;
    v29 = "-[AVHapticClient allocateResources:]_block_invoke";
    _os_log_impl(&dword_1B573F000, v16, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Setting up shared memory on client", (uint8_t *)&v24, 0x1Cu);
  }

LABEL_25:
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    HapticCommandWriter = createHapticCommandWriter();
    WeakRetained[2] = HapticCommandWriter;
    if (!HapticCommandWriter)
    {
      if (kAVHCScope)
      {
        v20 = *(id *)kAVHCScope;
        if (!v20)
        {
LABEL_35:
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4899, 0);
          v14 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_36;
        }
      }
      else
      {
        v20 = MEMORY[0x1E0C81028];
        v21 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v24 = 136315650;
        v25 = "AVHapticClient.mm";
        v26 = 1024;
        v27 = 207;
        v28 = 2080;
        v29 = "-[AVHapticClient allocateResources:]_block_invoke";
        _os_log_impl(&dword_1B573F000, v20, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Unable to access shared memory", (uint8_t *)&v24, 0x1Cu);
      }

      goto LABEL_35;
    }
  }
  v14 = 0;
LABEL_36:

LABEL_37:
  if (kAVHCScope)
  {
    v22 = *(id *)kAVHCScope;
    if (!v22)
      goto LABEL_44;
  }
  else
  {
    v22 = MEMORY[0x1E0C81028];
    v23 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    v24 = 136315650;
    v25 = "AVHapticClient.mm";
    v26 = 1024;
    v27 = 212;
    v28 = 2080;
    v29 = "-[AVHapticClient allocateResources:]_block_invoke";
    _os_log_impl(&dword_1B573F000, v22, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Notifying caller via completion callback", (uint8_t *)&v24, 0x1Cu);
  }

LABEL_44:
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __48__AVHapticClient_removeAssignedChannelID_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = 850045863;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((_QWORD *)self + 17) = 0;
  *((_QWORD *)self + 16) = 0;
  *((_QWORD *)self + 14) = 0;
  *((_QWORD *)self + 15) = (char *)self + 128;
  return self;
}

void __31__AVHapticClient_startRunning___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
    objc_msgSend(WeakRetained, "setState:", 2 * (v4 == 0));
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)clientCompletedWithError:(id)a3
{
  id v4;
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  id v10;
  NSObject *v11;
  int v12;
  _QWORD block[4];
  id v14;
  id v15;
  id location;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
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
    *(_DWORD *)buf = 136315906;
    v18 = "AVHapticClient.mm";
    v19 = 1024;
    v20 = 1451;
    v21 = 2080;
    v22 = "-[AVHapticClient clientCompletedWithError:]";
    v23 = 1024;
    v24 = -[AVHapticClient clientID](self, "clientID");
    _os_log_impl(&dword_1B573F000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Client-side (async) finish completion callback for client 0x%x called from server", buf, 0x22u);
  }

LABEL_8:
  objc_initWeak(&location, self);
  v8 = *((_QWORD *)self + 18);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__AVHapticClient_clientCompletedWithError___block_invoke;
  block[3] = &unk_1E69604D0;
  objc_copyWeak(&v15, &location);
  v9 = v4;
  v14 = v9;
  dispatch_async(v8, block);
  if (kAVHCScope)
  {
    if ((*(_BYTE *)(kAVHCScope + 8) & 1) != 0)
    {
      v10 = *(id *)kAVHCScope;
      if (v10)
      {
        v11 = v10;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          v12 = -[AVHapticClient clientID](self, "clientID");
          *(_DWORD *)buf = 136315906;
          v18 = "AVHapticClient.mm";
          v19 = 1024;
          v20 = 1470;
          v21 = 2080;
          v22 = "-[AVHapticClient clientCompletedWithError:]";
          v23 = 1024;
          v24 = v12;
          _os_log_impl(&dword_1B573F000, v11, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Client-side finish completionCallback done for client 0x%x", buf, 0x22u);
        }

      }
    }
  }

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

- (void)startRunning:(id)a3
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  int v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id location;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (kAVHCScope)
  {
    v6 = *(id *)kAVHCScope;
    if (!v6)
      goto LABEL_8;
  }
  else
  {
    v6 = (id)MEMORY[0x1E0C81028];
    v7 = MEMORY[0x1E0C81028];
  }
  v8 = v6;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v24 = "AVHapticClient.mm";
    v25 = 1024;
    v26 = 362;
    v27 = 2080;
    v28 = "-[AVHapticClient startRunning:]";
    v29 = 1024;
    v30 = -[AVHapticClient clientID](self, "clientID");
    _os_log_impl(&dword_1B573F000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Client 0x%x starting", buf, 0x22u);
  }

LABEL_8:
  -[AVHapticClient setState:](self, "setState:", 1);
  objc_initWeak(&location, self);
  v9 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __31__AVHapticClient_startRunning___block_invoke;
  v19[3] = &unk_1E695FF28;
  objc_copyWeak(&v21, &location);
  v10 = v5;
  v20 = v10;
  -[AVHapticClient getAsyncDelegateForMethod:errorHandler:](self, "getAsyncDelegateForMethod:errorHandler:", a2, v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __31__AVHapticClient_startRunning___block_invoke_2;
  v16[3] = &unk_1E695FF28;
  objc_copyWeak(&v18, &location);
  v12 = v10;
  v17 = v12;
  objc_msgSend(v11, "startRunning:", v16);
  if (kAVHCScope)
  {
    if ((*(_BYTE *)(kAVHCScope + 8) & 1) != 0)
    {
      v13 = *(id *)kAVHCScope;
      if (v13)
      {
        v14 = v13;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          v15 = -[AVHapticClient clientID](self, "clientID");
          *(_DWORD *)buf = 136315906;
          v24 = "AVHapticClient.mm";
          v25 = 1024;
          v26 = 379;
          v27 = 2080;
          v28 = "-[AVHapticClient startRunning:]";
          v29 = 1024;
          v30 = v15;
          _os_log_impl(&dword_1B573F000, v14, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Client 0x%x done with startRunning:", buf, 0x22u);
        }

      }
    }
  }

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

- (void)stopRunning:(id)a3
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  int v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id location;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (kAVHCScope)
  {
    v6 = *(id *)kAVHCScope;
    if (!v6)
      goto LABEL_8;
  }
  else
  {
    v6 = (id)MEMORY[0x1E0C81028];
    v7 = MEMORY[0x1E0C81028];
  }
  v8 = v6;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v24 = "AVHapticClient.mm";
    v25 = 1024;
    v26 = 397;
    v27 = 2080;
    v28 = "-[AVHapticClient stopRunning:]";
    v29 = 1024;
    v30 = -[AVHapticClient clientID](self, "clientID");
    _os_log_impl(&dword_1B573F000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Client 0x%x stopping", buf, 0x22u);
  }

LABEL_8:
  objc_initWeak(&location, self);
  v9 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __30__AVHapticClient_stopRunning___block_invoke;
  v19[3] = &unk_1E695FF28;
  objc_copyWeak(&v21, &location);
  v10 = v5;
  v20 = v10;
  -[AVHapticClient getAsyncDelegateForMethod:errorHandler:](self, "getAsyncDelegateForMethod:errorHandler:", a2, v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVHapticClient setState:](self, "setState:", 3);
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __30__AVHapticClient_stopRunning___block_invoke_2;
  v16[3] = &unk_1E695FF28;
  objc_copyWeak(&v18, &location);
  v12 = v10;
  v17 = v12;
  objc_msgSend(v11, "stopRunning:", v16);
  if (kAVHCScope)
  {
    if ((*(_BYTE *)(kAVHCScope + 8) & 1) != 0)
    {
      v13 = *(id *)kAVHCScope;
      if (v13)
      {
        v14 = v13;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          v15 = -[AVHapticClient clientID](self, "clientID");
          *(_DWORD *)buf = 136315906;
          v24 = "AVHapticClient.mm";
          v25 = 1024;
          v26 = 414;
          v27 = 2080;
          v28 = "-[AVHapticClient stopRunning:]";
          v29 = 1024;
          v30 = v15;
          _os_log_impl(&dword_1B573F000, v14, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Client 0x%x done with stopRunning:", buf, 0x22u);
        }

      }
    }
  }

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

void __30__AVHapticClient_stopRunning___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "setState:", 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)setState:(int)a3
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (*((_DWORD *)self + 38) != a3)
  {
    if (kAVHSScope)
    {
      v5 = *(id *)kAVHSScope;
      if (!v5)
        goto LABEL_9;
    }
    else
    {
      v5 = (id)MEMORY[0x1E0C81028];
      v6 = MEMORY[0x1E0C81028];
    }
    v7 = v5;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = 136316162;
      v9 = "AVHapticClient.mm";
      v11 = 106;
      v12 = 2080;
      v10 = 1024;
      v13 = "-[AVHapticClient setState:]";
      v14 = 1024;
      v15 = -[AVHapticClient clientID](self, "clientID");
      v16 = 1024;
      v17 = a3;
      _os_log_impl(&dword_1B573F000, v7, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Client 0x%x EngineState -> %d", (uint8_t *)&v8, 0x28u);
    }

  }
LABEL_9:
  *((_DWORD *)self + 38) = a3;
}

- (BOOL)finish:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  double v12;
  NSObject *v13;
  NSObject *v14;
  AVHapticClient *v15;
  char v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  id *v24;
  id v25;
  NSObject *v26;
  NSObject *v27;
  id v28;
  _QWORD v30[4];
  id v31;
  AVHapticClient *v32;
  id v33;
  _QWORD v34[4];
  id v35;
  AVHapticClient *v36;
  id v37;
  _QWORD block[5];
  id v39;
  uint8_t buf[4];
  _BYTE v41[36];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  int v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[AVHapticClient clientID](self, "clientID");
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
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)v41 = "AVHapticClient.mm";
    *(_WORD *)&v41[8] = 1024;
    *(_DWORD *)&v41[10] = 420;
    *(_WORD *)&v41[14] = 2080;
    *(_QWORD *)&v41[16] = "-[AVHapticClient finish:]";
    *(_WORD *)&v41[24] = 1024;
    *(_DWORD *)&v41[26] = v5;
    _os_log_impl(&dword_1B573F000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Client 0x%x finishing", buf, 0x22u);
  }

LABEL_8:
  if (!-[AVHapticClient running](self, "running"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4805, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (kAVHCScope)
    {
      v19 = *(id *)kAVHCScope;
      if (!v19)
      {
LABEL_27:
        v23 = *((_QWORD *)self + 18);
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __25__AVHapticClient_finish___block_invoke_49;
        v30[3] = &unk_1E69603A0;
        v33 = v4;
        v17 = v18;
        v31 = v17;
        v32 = self;
        dispatch_sync(v23, v30);

        v24 = &v33;
        goto LABEL_34;
      }
    }
    else
    {
      v19 = MEMORY[0x1E0C81028];
      v22 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v41 = "AVHapticClient.mm";
      *(_WORD *)&v41[8] = 1024;
      *(_DWORD *)&v41[10] = 446;
      *(_WORD *)&v41[14] = 2080;
      *(_QWORD *)&v41[16] = "-[AVHapticClient finish:]";
      *(_WORD *)&v41[24] = 2112;
      *(_QWORD *)&v41[26] = v18;
      *(_WORD *)&v41[34] = 1024;
      LODWORD(v42) = v5;
      _os_log_impl(&dword_1B573F000, v19, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Player was not running - bailing with error %@ for client 0x%x", buf, 0x2Cu);
    }

    goto LABEL_27;
  }
  v8 = MEMORY[0x1E0C809B0];
  v9 = *((_QWORD *)self + 18);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__AVHapticClient_finish___block_invoke;
  block[3] = &unk_1E695FF00;
  v10 = v4;
  block[4] = self;
  v39 = v10;
  dispatch_sync(v9, block);
  v11 = mach_absolute_time();
  v12 = (double)v11 * 0.0000000416666667;
  if (kAVHCScope)
  {
    if ((*(_BYTE *)(kAVHCScope + 8) & 1) != 0)
    {
      v13 = *(id *)kAVHCScope;
      if (v13)
      {
        v14 = v13;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v41 = "AVHapticClient.mm";
          *(_WORD *)&v41[8] = 1024;
          *(_DWORD *)&v41[10] = 430;
          *(_WORD *)&v41[14] = 2080;
          *(_QWORD *)&v41[16] = "-[AVHapticClient finish:]";
          *(_WORD *)&v41[24] = 2048;
          *(double *)&v41[26] = (double)v11 * 0.0000000416666667;
          *(_WORD *)&v41[34] = 2048;
          *(_QWORD *)&v42 = v11;
          _os_log_impl(&dword_1B573F000, v14, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Writing FinalEvent with time %f [host time was %llu]", buf, 0x30u);
        }

      }
    }
  }
  v15 = self;
  objc_sync_enter(v15);
  v46 = 0;
  v45 = 0u;
  v44 = 0u;
  v43 = 0u;
  v42 = 0u;
  *(_OWORD *)&v41[20] = 0u;
  *(_DWORD *)buf = 327792;
  *(double *)&v41[4] = v12;
  *(_QWORD *)&v41[12] = -1;
  v16 = writeCommand();
  objc_sync_exit(v15);

  if ((v16 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4899, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (kAVHCScope)
    {
      v21 = *(id *)kAVHCScope;
      if (!v21)
      {
LABEL_32:
        v26 = *((_QWORD *)self + 18);
        v34[0] = v8;
        v34[1] = 3221225472;
        v34[2] = __25__AVHapticClient_finish___block_invoke_48;
        v34[3] = &unk_1E69603A0;
        v37 = v10;
        v17 = v20;
        v35 = v17;
        v36 = v15;
        dispatch_sync(v26, v34);

        goto LABEL_33;
      }
    }
    else
    {
      v21 = MEMORY[0x1E0C81028];
      v25 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v41 = "AVHapticClient.mm";
      *(_WORD *)&v41[8] = 1024;
      *(_DWORD *)&v41[10] = 437;
      *(_WORD *)&v41[14] = 2080;
      *(_QWORD *)&v41[16] = "-[AVHapticClient finish:]";
      *(_WORD *)&v41[24] = 2112;
      *(_QWORD *)&v41[26] = v20;
      *(_WORD *)&v41[34] = 1024;
      LODWORD(v42) = v5;
      _os_log_impl(&dword_1B573F000, v21, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Attempt to write FinalEvent failed - bailing by calling completionCallback with error %@ for client 0x%x", buf, 0x2Cu);
    }

    goto LABEL_32;
  }
  v17 = 0;
LABEL_33:
  v24 = &v39;
LABEL_34:

  if (kAVHCScope)
  {
    v27 = *(id *)kAVHCScope;
    if (!v27)
      goto LABEL_41;
  }
  else
  {
    v27 = MEMORY[0x1E0C81028];
    v28 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)v41 = "AVHapticClient.mm";
    *(_WORD *)&v41[8] = 1024;
    *(_DWORD *)&v41[10] = 452;
    *(_WORD *)&v41[14] = 2080;
    *(_QWORD *)&v41[16] = "-[AVHapticClient finish:]";
    *(_WORD *)&v41[24] = 1024;
    *(_DWORD *)&v41[26] = v5;
    _os_log_impl(&dword_1B573F000, v27, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Client 0x%x done with finish", buf, 0x22u);
  }

LABEL_41:
  return v17 == 0;
}

- (BOOL)running
{
  return (*((_DWORD *)self + 38) - 1) < 2;
}

- (unint64_t)clientID
{
  return *((_QWORD *)self + 21);
}

- (BOOL)setPlayerBehavior:(unint64_t)a3 error:(id *)a4
{
  NSObject *v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  BOOL v14;
  _QWORD v16[5];
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__1;
  v22 = __Block_byref_object_dispose__1;
  v23 = 0;
  if (kAVHCScope)
  {
    v8 = *(id *)kAVHCScope;
    if (!v8)
      goto LABEL_8;
  }
  else
  {
    v8 = MEMORY[0x1E0C81028];
    v9 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v25 = "AVHapticClient.mm";
    v26 = 1024;
    v27 = 1268;
    v28 = 2080;
    v29 = "-[AVHapticClient setPlayerBehavior:error:]";
    v30 = 1024;
    v31 = a3;
    _os_log_impl(&dword_1B573F000, v8, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Calling server with player behavior %u", buf, 0x22u);
  }

LABEL_8:
  v10 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __42__AVHapticClient_setPlayerBehavior_error___block_invoke;
  v17[3] = &unk_1E6960358;
  v17[4] = &v18;
  -[AVHapticClient getSyncDelegateForMethod:errorHandler:](self, "getSyncDelegateForMethod:errorHandler:", a2, v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __42__AVHapticClient_setPlayerBehavior_error___block_invoke_2;
  v16[3] = &unk_1E6960358;
  v16[4] = &v18;
  objc_msgSend(v11, "setPlayerBehavior:reply:", a3, v16);
  if (a4)
    *a4 = objc_retainAutorelease((id)v19[5]);
  if (kAVHCScope)
  {
    v12 = *(id *)kAVHCScope;
    if (!v12)
      goto LABEL_17;
  }
  else
  {
    v12 = MEMORY[0x1E0C81028];
    v13 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v25 = "AVHapticClient.mm";
    v26 = 1024;
    v27 = 1277;
    v28 = 2080;
    v29 = "-[AVHapticClient setPlayerBehavior:error:]";
    _os_log_impl(&dword_1B573F000, v12, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Exited", buf, 0x1Cu);
  }

LABEL_17:
  v14 = v19[5] == 0;

  _Block_object_dispose(&v18, 8);
  return v14;
}

- (id)getSyncDelegateForMethod:(SEL)a3 errorHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13[2];
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  v7 = (void *)*((_QWORD *)self + 1);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__AVHapticClient_getSyncDelegateForMethod_errorHandler___block_invoke;
  v11[3] = &unk_1E6960480;
  v13[1] = (id)a3;
  objc_copyWeak(v13, &location);
  v12 = v6;
  v8 = v6;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
  return v9;
}

- (BOOL)sendEvents:(id)a3 withImmediateParameters:(id)a4 atTime:(double)a5 channel:(unint64_t)a6 outToken:(unint64_t *)a7 error:(id *)a8
{
  AVHapticClient *v14;
  id v15;
  id v16;

  v14 = self;
  v15 = a4;
  v16 = a3;
  objc_sync_enter(v14);
  LOBYTE(a8) = -[AVHapticClient doSendEvents:withImmediateParameters:atTime:channel:sorted:outToken:error:](v14, "doSendEvents:withImmediateParameters:atTime:channel:sorted:outToken:error:", v16, v15, a6, 0, a7, a8, a5);

  objc_sync_exit(v14);
  return (char)a8;
}

- (BOOL)resetChannel:(unint64_t)a3 atTime:(double)a4
{
  AVHapticClient *v6;
  id v7;
  NSObject *v8;
  char v9;
  int v11;
  _OWORD v12[10];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = self;
  objc_sync_enter(v6);
  if (kAVHCScope)
  {
    if ((*(_BYTE *)(kAVHCScope + 8) & 1) != 0)
    {
      v7 = *(id *)kAVHCScope;
      if (v7)
      {
        v8 = v7;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          v11 = 136316418;
          *(_QWORD *)&v12[0] = "AVHapticClient.mm";
          WORD4(v12[0]) = 1024;
          *(_DWORD *)((char *)v12 + 10) = 489;
          HIWORD(v12[0]) = 2080;
          *(_QWORD *)&v12[1] = "-[AVHapticClient resetChannel:atTime:]";
          WORD4(v12[1]) = 1024;
          *(_DWORD *)((char *)&v12[1] + 10) = -[AVHapticClient clientID](v6, "clientID");
          HIWORD(v12[1]) = 2048;
          *(double *)&v12[2] = a4;
          WORD4(v12[2]) = 1024;
          *(_DWORD *)((char *)&v12[2] + 10) = a3;
          _os_log_impl(&dword_1B573F000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Client 0x%x writing reset event: time: %.3f channelID: %u", (uint8_t *)&v11, 0x32u);
        }

      }
    }
  }
  memset((char *)&v12[1] + 4, 0, 84);
  v11 = 786544;
  *(double *)((char *)v12 + 4) = a4;
  *(_QWORD *)((char *)v12 + 12) = a3;
  v9 = writeCommand();
  objc_sync_exit(v6);

  return v9;
}

- (BOOL)removeAssignedChannelID:(unint64_t)a3 error:(id *)a4
{
  NSObject *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  _QWORD v16[5];
  _QWORD v17[5];
  uint8_t v18[4];
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  _BYTE buf[40];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (kAVHCScope)
  {
    v8 = *(id *)kAVHCScope;
    if (!v8)
      goto LABEL_8;
  }
  else
  {
    v8 = MEMORY[0x1E0C81028];
    v9 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "AVHapticClient.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1316;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = "-[AVHapticClient removeAssignedChannelID:error:]";
    *(_WORD *)&buf[28] = 1024;
    *(_DWORD *)&buf[30] = a3;
    _os_log_impl(&dword_1B573F000, v8, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Calling server with request to remove channelID %u", buf, 0x22u);
  }

LABEL_8:
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  *(_QWORD *)&buf[24] = __Block_byref_object_copy__1;
  *(_QWORD *)&buf[32] = __Block_byref_object_dispose__1;
  v10 = MEMORY[0x1E0C809B0];
  v25 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __48__AVHapticClient_removeAssignedChannelID_error___block_invoke;
  v17[3] = &unk_1E6960358;
  v17[4] = buf;
  -[AVHapticClient getSyncDelegateForMethod:errorHandler:](self, "getSyncDelegateForMethod:errorHandler:", a2, v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __48__AVHapticClient_removeAssignedChannelID_error___block_invoke_2;
  v16[3] = &unk_1E6960358;
  v16[4] = buf;
  objc_msgSend(v11, "removeChannel:reply:", a3, v16);
  v12 = *(void **)(*(_QWORD *)&buf[8] + 40);
  if (a4)
    *a4 = objc_retainAutorelease(v12);
  if (kAVHCScope)
  {
    v13 = *(id *)kAVHCScope;
    if (!v13)
      goto LABEL_17;
  }
  else
  {
    v13 = MEMORY[0x1E0C81028];
    v14 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v18 = 136315650;
    v19 = "AVHapticClient.mm";
    v20 = 1024;
    v21 = 1328;
    v22 = 2080;
    v23 = "-[AVHapticClient removeAssignedChannelID:error:]";
    _os_log_impl(&dword_1B573F000, v13, OS_LOG_TYPE_INFO, "%25s:%-5d %s: done removing channel", v18, 0x1Cu);
  }

LABEL_17:
  _Block_object_dispose(buf, 8);

  return v12 == 0;
}

- (void)prewarm:(id)a3
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (kAVHCScope)
  {
    v6 = *(id *)kAVHCScope;
    if (!v6)
      goto LABEL_8;
  }
  else
  {
    v6 = (id)MEMORY[0x1E0C81028];
    v7 = MEMORY[0x1E0C81028];
  }
  v8 = v6;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v19 = "AVHapticClient.mm";
    v20 = 1024;
    v21 = 335;
    v22 = 2080;
    v23 = "-[AVHapticClient prewarm:]";
    v24 = 1024;
    v25 = -[AVHapticClient clientID](self, "clientID");
    _os_log_impl(&dword_1B573F000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Client 0x%x starting prewarm", buf, 0x22u);
  }

LABEL_8:
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __26__AVHapticClient_prewarm___block_invoke;
  v16[3] = &unk_1E69602A0;
  v10 = v5;
  v17 = v10;
  -[AVHapticClient getAsyncDelegateForMethod:errorHandler:](self, "getAsyncDelegateForMethod:errorHandler:", a2, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)buf, self);
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __26__AVHapticClient_prewarm___block_invoke_2;
  v13[3] = &unk_1E695FF28;
  objc_copyWeak(&v15, (id *)buf);
  v12 = v10;
  v14 = v12;
  objc_msgSend(v11, "prewarm:", v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);

}

- (void)setConnectionCallback:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (void)queryServerCapabilities:(id)a3 reply:(id)a4
{
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v7 = a4;
  -[AVHapticClient getSyncDelegateForMethod:errorHandler:](self, "getSyncDelegateForMethod:errorHandler:", a2, &__block_literal_global_36);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "queryCapabilities:reply:", v9, v7);

}

- (AVHapticClient)initWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  AVHapticClient *v9;
  AVHapticClient *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  AVHapticClient *v14;
  id v15;
  objc_super v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (setupClientLogScopes(void)::once != -1)
    dispatch_once(&setupClientLogScopes(void)::once, &__block_literal_global_1);
  if (kAVHCScope)
  {
    v7 = *(id *)kAVHCScope;
    if (!v7)
      goto LABEL_10;
  }
  else
  {
    v7 = MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v19 = "AVHapticClient.mm";
    v20 = 1024;
    v21 = 139;
    v22 = 2080;
    v23 = "-[AVHapticClient initWithOptions:error:]";
    _os_log_impl(&dword_1B573F000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: initializing with options", buf, 0x1Cu);
  }

LABEL_10:
  v17.receiver = self;
  v17.super_class = (Class)AVHapticClient;
  v9 = -[AVHapticClient init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    -[AVHapticClient doInit](v9, "doInit");
    if (!-[AVHapticClient setupConnectionWithOptions:error:](v10, "setupConnectionWithOptions:error:", v6, a4))
    {
      if (kAVHCScope)
      {
        v12 = *(id *)kAVHCScope;
        if (!v12)
        {
LABEL_27:
          -[AVHapticClient disconnect](v10, "disconnect");
          v14 = 0;
          goto LABEL_28;
        }
      }
      else
      {
        v12 = MEMORY[0x1E0C81028];
        v15 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        v19 = "AVHapticClient.mm";
        v20 = 1024;
        v21 = 144;
        v22 = 2080;
        v23 = "-[AVHapticClient initWithOptions:error:]";
        _os_log_impl(&dword_1B573F000, v12, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Init calling disconnect on self", buf, 0x1Cu);
      }

      goto LABEL_27;
    }
  }
  if (!kAVHCScope)
  {
    v11 = MEMORY[0x1E0C81028];
    v13 = MEMORY[0x1E0C81028];
    goto LABEL_19;
  }
  v11 = *(id *)kAVHCScope;
  if (v11)
  {
LABEL_19:
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v19 = "AVHapticClient.mm";
      v20 = 1024;
      v21 = 149;
      v22 = 2080;
      v23 = "-[AVHapticClient initWithOptions:error:]";
      _os_log_impl(&dword_1B573F000, v11, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Init exited", buf, 0x1Cu);
    }

  }
  v14 = v10;
LABEL_28:

  return v14;
}

- (BOOL)setupConnectionWithOptions:(id)a3 error:(id *)a4
{
  NSObject *v6;
  id v7;
  __CFString *v8;
  id v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  id v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  dispatch_time_t v28;
  NSObject *v29;
  id v30;
  uint64_t v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  NSObject *v36;
  void *v37;
  int v38;
  NSObject *v39;
  uint64_t v40;
  id v41;
  void *v42;
  const char *v43;
  NSObject *v44;
  os_log_type_t v45;
  NSObject *v46;
  id v47;
  void *v48;
  id v49;
  uint64_t v50;
  id v51;
  NSObject *v52;
  id v53;
  BOOL v54;
  id v57;
  _QWORD v58[4];
  NSObject *v59;
  uint64_t *v60;
  _QWORD v61[5];
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD v66[4];
  id v67;
  _QWORD v68[4];
  id v69;
  id location;
  uint8_t v71[4];
  const char *v72;
  __int16 v73;
  int v74;
  __int16 v75;
  const char *v76;
  __int16 v77;
  id v78;
  __int16 v79;
  int v80;
  _BYTE buf[40];
  id v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v57 = a3;
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
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "AVHapticClient.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1153;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = "-[AVHapticClient setupConnectionWithOptions:error:]";
    _os_log_impl(&dword_1B573F000, v6, OS_LOG_TYPE_INFO, "%25s:%-5d %s: [xpc] Connecting...", buf, 0x1Cu);
  }

LABEL_8:
  objc_msgSend(v57, "objectForKey:", CFSTR("MachServiceName"));
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0CB3B38]);
  if (v8)
    v10 = v8;
  else
    v10 = CFSTR("com.apple.audio.hapticd");
  v11 = objc_msgSend(v9, "initWithMachServiceName:options:", v10, 4096);
  v12 = (void *)*((_QWORD *)self + 1);
  *((_QWORD *)self + 1) = v11;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF131630);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*((id *)self + 1), "setExportedInterface:", v13);

  objc_msgSend(*((id *)self + 1), "setExportedObject:", self);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF1354F0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*((id *)self + 1), "setRemoteObjectInterface:", v14);

  if (kAVHCScope)
  {
    if ((*(_BYTE *)(kAVHCScope + 8) & 1) != 0)
    {
      v15 = *(id *)kAVHCScope;
      if (v15)
      {
        v16 = v15;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          v17 = *((_QWORD *)self + 1);
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)&buf[4] = "AVHapticClient.mm";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 1162;
          *(_WORD *)&buf[18] = 2080;
          *(_QWORD *)&buf[20] = "-[AVHapticClient setupConnectionWithOptions:error:]";
          *(_WORD *)&buf[28] = 2112;
          *(_QWORD *)&buf[30] = v17;
          _os_log_impl(&dword_1B573F000, v16, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: [xpc] Connection: %@", buf, 0x26u);
        }

      }
    }
  }
  objc_msgSend(*((id *)self + 1), "remoteObjectInterface");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setXPCType:forSelector:argumentIndex:ofReply:", MEMORY[0x1E0C81388], sel_allocateClientResources_, 0, 1);

  objc_initWeak(&location, self);
  v19 = (void *)*((_QWORD *)self + 1);
  v20 = MEMORY[0x1E0C809B0];
  v68[0] = MEMORY[0x1E0C809B0];
  v68[1] = 3221225472;
  v68[2] = __51__AVHapticClient_setupConnectionWithOptions_error___block_invoke;
  v68[3] = &unk_1E6960430;
  objc_copyWeak(&v69, &location);
  objc_msgSend(v19, "setInterruptionHandler:", v68);
  v21 = (void *)*((_QWORD *)self + 1);
  v66[0] = v20;
  v66[1] = 3221225472;
  v66[2] = __51__AVHapticClient_setupConnectionWithOptions_error___block_invoke_2;
  v66[3] = &unk_1E6960430;
  objc_copyWeak(&v67, &location);
  objc_msgSend(v21, "setInvalidationHandler:", v66);
  -[AVHapticClient setConnected:](self, "setConnected:", 1);
  objc_msgSend(*((id *)self + 1), "resume");
  -[AVHapticClient setServerProcessID:](self, "setServerProcessID:", 0);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  *(_QWORD *)&buf[24] = __Block_byref_object_copy__1;
  *(_QWORD *)&buf[32] = __Block_byref_object_dispose__1;
  v82 = 0;
  v62 = 0;
  v63 = &v62;
  v64 = 0x2020000000;
  v65 = 0;
  if (kAVHCScope)
  {
    v22 = *(id *)kAVHCScope;
    if (!v22)
      goto LABEL_24;
  }
  else
  {
    v22 = MEMORY[0x1E0C81028];
    v23 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v71 = 136315906;
    v72 = "AVHapticClient.mm";
    v73 = 1024;
    v74 = 1183;
    v75 = 2080;
    v76 = "-[AVHapticClient setupConnectionWithOptions:error:]";
    v77 = 2112;
    v78 = v57;
    _os_log_impl(&dword_1B573F000, v22, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Calling configureWithOptions:reply on server with dictionary: '%@'", v71, 0x26u);
  }

LABEL_24:
  v61[0] = v20;
  v61[1] = 3221225472;
  v61[2] = __51__AVHapticClient_setupConnectionWithOptions_error___block_invoke_130;
  v61[3] = &unk_1E6960358;
  v61[4] = buf;
  -[AVHapticClient getAsyncDelegateForMethod:errorHandler:](self, "getAsyncDelegateForMethod:errorHandler:", a2, v61);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)MEMORY[0x1B5E4F11C]();
  v26 = dispatch_group_create();
  dispatch_group_enter(v26);
  v58[0] = v20;
  v58[1] = 3221225472;
  v58[2] = __51__AVHapticClient_setupConnectionWithOptions_error___block_invoke_2_131;
  v58[3] = &unk_1E6960458;
  v60 = &v62;
  v27 = v26;
  v59 = v27;
  objc_msgSend(v24, "configureWithOptions:reply:", v57, v58);
  v28 = dispatch_time(0, 1000000000);
  if (!dispatch_group_wait(v27, v28))
    goto LABEL_33;
  if (!kAVHCScope)
  {
    v29 = MEMORY[0x1E0C81028];
    v30 = MEMORY[0x1E0C81028];
    goto LABEL_29;
  }
  v29 = *(id *)kAVHCScope;
  if (v29)
  {
LABEL_29:
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v71 = 136315650;
      v72 = "AVHapticClient.mm";
      v73 = 1024;
      v74 = 1198;
      v75 = 2080;
      v76 = "-[AVHapticClient setupConnectionWithOptions:error:]";
      _os_log_impl(&dword_1B573F000, v29, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Initial XPC call to server timed out", v71, 0x1Cu);
    }

  }
  v31 = *(_QWORD *)&buf[8];
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4810, 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32;
  objc_storeStrong((id *)(v31 + 40), v32);
LABEL_33:

  objc_autoreleasePoolPop(v25);
  -[AVHapticClient setServerProcessID:](self, "setServerProcessID:", objc_msgSend(*((id *)self + 1), "processIdentifier"));
  if (kAVHCScope)
  {
    v34 = *(id *)kAVHCScope;
    if (!v34)
      goto LABEL_40;
  }
  else
  {
    v34 = (id)MEMORY[0x1E0C81028];
    v35 = MEMORY[0x1E0C81028];
  }
  v36 = v34;
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    v37 = (void *)*((_QWORD *)self + 1);
    v38 = objc_msgSend(v37, "processIdentifier");
    *(_DWORD *)v71 = 136316162;
    v72 = "AVHapticClient.mm";
    v73 = 1024;
    v74 = 1206;
    v75 = 2080;
    v76 = "-[AVHapticClient setupConnectionWithOptions:error:]";
    v77 = 2112;
    v78 = v37;
    v79 = 1024;
    v80 = v38;
    _os_log_impl(&dword_1B573F000, v36, OS_LOG_TYPE_INFO, "%25s:%-5d %s: [xpc] Server connection: %@, PID: %d", v71, 0x2Cu);
  }

LABEL_40:
  if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
  {
    if (kAVHCScope)
    {
      v39 = *(id *)kAVHCScope;
      if (!v39)
        goto LABEL_64;
    }
    else
    {
      v39 = MEMORY[0x1E0C81028];
      v41 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      v42 = *(void **)(*(_QWORD *)&buf[8] + 40);
      *(_DWORD *)v71 = 136315906;
      v72 = "AVHapticClient.mm";
      v73 = 1024;
      v74 = 1209;
      v75 = 2080;
      v76 = "-[AVHapticClient setupConnectionWithOptions:error:]";
      v77 = 2112;
      v78 = v42;
      v43 = "%25s:%-5d %s: [xpc] Got error during transaction: %@";
      v44 = v39;
      v45 = OS_LOG_TYPE_DEFAULT;
LABEL_57:
      _os_log_impl(&dword_1B573F000, v44, v45, v43, v71, 0x26u);
      goto LABEL_63;
    }
    goto LABEL_63;
  }
  v40 = v63[3];
  if (!v40)
  {
    if (kAVHCScope)
    {
      v46 = *(id *)kAVHCScope;
      if (!v46)
      {
LABEL_62:
        v50 = *(_QWORD *)&buf[8];
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4810, 0);
        v51 = (id)objc_claimAutoreleasedReturnValue();
        v39 = *(NSObject **)(v50 + 40);
        *(_QWORD *)(v50 + 40) = v51;
        goto LABEL_63;
      }
    }
    else
    {
      v46 = MEMORY[0x1E0C81028];
      v49 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v71 = 136315650;
      v72 = "AVHapticClient.mm";
      v73 = 1024;
      v74 = 1212;
      v75 = 2080;
      v76 = "-[AVHapticClient setupConnectionWithOptions:error:]";
      _os_log_impl(&dword_1B573F000, v46, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: [xpc] ERROR: Failed retrieving client ID", v71, 0x1Cu);
    }

    goto LABEL_62;
  }
  *((_QWORD *)self + 21) = v40;
  if (!kAVHCScope)
  {
    v39 = MEMORY[0x1E0C81028];
    v47 = MEMORY[0x1E0C81028];
LABEL_55:
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      v48 = (void *)*((_QWORD *)self + 21);
      *(_DWORD *)v71 = 136315906;
      v72 = "AVHapticClient.mm";
      v73 = 1024;
      v74 = 1217;
      v75 = 2080;
      v76 = "-[AVHapticClient setupConnectionWithOptions:error:]";
      v77 = 2048;
      v78 = v48;
      v43 = "%25s:%-5d %s: Client ID: 0x%lx";
      v44 = v39;
      v45 = OS_LOG_TYPE_INFO;
      goto LABEL_57;
    }
LABEL_63:

    goto LABEL_64;
  }
  v39 = *(id *)kAVHCScope;
  if (v39)
    goto LABEL_55;
LABEL_64:
  if (a4)
    *a4 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
  if (kAVHCScope)
  {
    v52 = *(id *)kAVHCScope;
    if (!v52)
      goto LABEL_73;
  }
  else
  {
    v52 = MEMORY[0x1E0C81028];
    v53 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v71 = 136315650;
    v72 = "AVHapticClient.mm";
    v73 = 1024;
    v74 = 1223;
    v75 = 2080;
    v76 = "-[AVHapticClient setupConnectionWithOptions:error:]";
    _os_log_impl(&dword_1B573F000, v52, OS_LOG_TYPE_INFO, "%25s:%-5d %s: [xpc] done connecting", v71, 0x1Cu);
  }

LABEL_73:
  v54 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40) == 0;

  _Block_object_dispose(&v62, 8);
  _Block_object_dispose(buf, 8);

  objc_destroyWeak(&v67);
  objc_destroyWeak(&v69);
  objc_destroyWeak(&location);

  return v54;
}

- (void)setServerProcessID:(int)a3
{
  *((_DWORD *)self + 40) = a3;
}

- (void)setConnected:(BOOL)a3
{
  *((_BYTE *)self + 158) = a3;
}

- (void)doInit
{
  void *v3;
  void *v4;
  dispatch_queue_t v5;
  void *v6;
  int AppIntegerValue;
  int v8;
  Boolean keyExistsAndHasValidFormat;

  *((_QWORD *)self + 3) = 1;
  v3 = (void *)*((_QWORD *)self + 22);
  *((_QWORD *)self + 22) = 0;

  *((_DWORD *)self + 38) = 0;
  *((_BYTE *)self + 158) = 0;
  v4 = (void *)*((_QWORD *)self + 23);
  *((_QWORD *)self + 23) = 0;

  v5 = dispatch_queue_create("Client completion queue", 0);
  v6 = (void *)*((_QWORD *)self + 18);
  *((_QWORD *)self + 18) = v5;

  keyExistsAndHasValidFormat = 0;
  AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("hapticserver_timeout"), CFSTR("com.apple.coreaudio"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v8 = AppIntegerValue;
  else
    v8 = 5;
  *((_DWORD *)self + 8) = v8;
  *((_BYTE *)self + 156) = 0;
}

- (void)allocateResources:(id)a3
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (kAVHCScope)
  {
    v6 = *(id *)kAVHCScope;
    if (!v6)
      goto LABEL_8;
  }
  else
  {
    v6 = (id)MEMORY[0x1E0C81028];
    v7 = MEMORY[0x1E0C81028];
  }
  v8 = v6;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v22 = "AVHapticClient.mm";
    v23 = 1024;
    v24 = 188;
    v25 = 2080;
    v26 = "-[AVHapticClient allocateResources:]";
    v27 = 1024;
    v28 = -[AVHapticClient clientID](self, "clientID");
    _os_log_impl(&dword_1B573F000, v8, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Client 0x%x allocating", buf, 0x22u);
  }

LABEL_8:
  v9 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __36__AVHapticClient_allocateResources___block_invoke;
  v19[3] = &unk_1E69602A0;
  v10 = v5;
  v20 = v10;
  -[AVHapticClient getAsyncDelegateForMethod:errorHandler:](self, "getAsyncDelegateForMethod:errorHandler:", a2, v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __36__AVHapticClient_allocateResources___block_invoke_2;
  v15[3] = &unk_1E69602C8;
  objc_copyWeak(&v17, &location);
  v12 = v10;
  v16 = v12;
  objc_msgSend(v11, "allocateClientResources:", v15);
  if (kAVHCScope)
  {
    v13 = *(id *)kAVHCScope;
    if (!v13)
      goto LABEL_15;
  }
  else
  {
    v13 = MEMORY[0x1E0C81028];
    v14 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v22 = "AVHapticClient.mm";
    v23 = 1024;
    v24 = 216;
    v25 = 2080;
    v26 = "-[AVHapticClient allocateResources:]";
    _os_log_impl(&dword_1B573F000, v13, OS_LOG_TYPE_INFO, "%25s:%-5d %s: done allocating", buf, 0x1Cu);
  }

LABEL_15:
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

- (id)getAsyncDelegateForMethod:(SEL)a3 errorHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13[2];
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  v7 = (void *)*((_QWORD *)self + 1);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__AVHapticClient_getAsyncDelegateForMethod_errorHandler___block_invoke;
  v11[3] = &unk_1E6960480;
  v13[1] = (id)a3;
  objc_copyWeak(v13, &location);
  v12 = v6;
  v8 = v6;
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
  return v9;
}

- (BOOL)requestAssignedChannels:(unint64_t)a3 error:(id *)a4
{
  NSObject *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  _QWORD v16[5];
  id v17;
  id location;
  _QWORD v19[5];
  uint8_t v20[4];
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;
  _BYTE buf[40];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (kAVHCScope)
  {
    v8 = *(id *)kAVHCScope;
    if (!v8)
      goto LABEL_8;
  }
  else
  {
    v8 = MEMORY[0x1E0C81028];
    v9 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "AVHapticClient.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1292;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = "-[AVHapticClient requestAssignedChannels:error:]";
    *(_WORD *)&buf[28] = 1024;
    *(_DWORD *)&buf[30] = a3;
    _os_log_impl(&dword_1B573F000, v8, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Calling server with request for %u channels", buf, 0x22u);
  }

LABEL_8:
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  *(_QWORD *)&buf[24] = __Block_byref_object_copy__1;
  *(_QWORD *)&buf[32] = __Block_byref_object_dispose__1;
  v10 = MEMORY[0x1E0C809B0];
  v27 = 0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __48__AVHapticClient_requestAssignedChannels_error___block_invoke;
  v19[3] = &unk_1E6960358;
  v19[4] = buf;
  -[AVHapticClient getSyncDelegateForMethod:errorHandler:](self, "getSyncDelegateForMethod:errorHandler:", a2, v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __48__AVHapticClient_requestAssignedChannels_error___block_invoke_2;
  v16[3] = &unk_1E69604A8;
  v16[4] = buf;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v11, "requestChannels:reply:", a3, v16);
  v12 = *(void **)(*(_QWORD *)&buf[8] + 40);
  if (a4)
    *a4 = objc_retainAutorelease(v12);
  if (kAVHCScope)
  {
    v13 = *(id *)kAVHCScope;
    if (!v13)
      goto LABEL_17;
  }
  else
  {
    v13 = MEMORY[0x1E0C81028];
    v14 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v20 = 136315650;
    v21 = "AVHapticClient.mm";
    v22 = 1024;
    v23 = 1310;
    v24 = 2080;
    v25 = "-[AVHapticClient requestAssignedChannels:error:]";
    _os_log_impl(&dword_1B573F000, v13, OS_LOG_TYPE_INFO, "%25s:%-5d %s: done requesting channels", v20, 0x1Cu);
  }

LABEL_17:
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  _Block_object_dispose(buf, 8);
  return v12 == 0;
}

- (NSArray)channelKeys
{
  return (NSArray *)objc_getProperty(self, a2, 176, 1);
}

- (void)setAsyncStopCallback:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 184);
}

- (BOOL)doSendEvents:(id)a3 withImmediateParameters:(id)a4 atTime:(double)a5 channel:(unint64_t)a6 sorted:(BOOL)a7 outToken:(unint64_t *)a8 error:(id *)a9
{
  id v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  int v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  unsigned int v22;
  double v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  id v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  NSObject *v39;
  uint64_t v40;
  double v41;
  id v42;
  NSObject *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  uint64_t v49;
  double v50;
  id v51;
  NSObject *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  int v57;
  NSObject *v58;
  NSObject *v59;
  NSObject *v60;
  NSObject *v61;
  NSObject *v62;
  NSObject *v63;
  void *v64;
  NSObject *v65;
  id v66;
  id v67;
  NSObject *v68;
  id v69;
  id v70;
  NSObject *v71;
  NSObject *v72;
  id v73;
  uint64_t v74;
  id v75;
  id v76;
  id v77;
  uint64_t v79;
  uint64_t v80;
  int v82;
  id v84;
  void *v86;
  uint64_t v87;
  int v88;
  uint64_t v89;
  uint64_t v90;
  int v91;
  uint8_t buf[4];
  _BYTE v93[112];
  __int128 v94;
  __int128 v95;
  __int128 v96;
  uint64_t v97;

  LODWORD(v79) = a7;
  v97 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v84 = a4;
  v86 = v12;
  v82 = objc_msgSend(v12, "count");
  if (kAVHCScope)
  {
    if ((*(_BYTE *)(kAVHCScope + 8) & 1) != 0)
    {
      v13 = *(id *)kAVHCScope;
      if (v13)
      {
        v14 = v13;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136316418;
          *(_QWORD *)v93 = "AVHapticClient.mm";
          *(_WORD *)&v93[8] = 1024;
          *(_DWORD *)&v93[10] = 547;
          *(_WORD *)&v93[14] = 2080;
          *(_QWORD *)&v93[16] = "-[AVHapticClient doSendEvents:withImmediateParameters:atTime:channel:sorted:outToken:error:]";
          *(_WORD *)&v93[24] = 1024;
          *(_DWORD *)&v93[26] = -[AVHapticClient clientID](self, "clientID");
          *(_WORD *)&v93[30] = 1024;
          *(_DWORD *)&v93[32] = v82;
          *(_WORD *)&v93[36] = 2048;
          *(double *)&v93[38] = a5;
          _os_log_impl(&dword_1B573F000, v14, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Client 0x%x writing %u events from passed-in event array at time: %.3f", buf, 0x32u);
        }

      }
    }
  }
  v91 = 0;
  if (v82)
  {
    v15 = 0;
    v16 = 336;
    do
    {
      objc_msgSend(v12, "objectAtIndexedSubscript:", v15, v79);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "eventCategory");
      if (v18)
      {
        if (v18 == 1)
        {
          v22 = 168;
        }
        else
        {
          if (v18 != 2)
          {
            if (kAVHCScope)
            {
              v63 = *(id *)kAVHCScope;
              if (!v63)
              {
LABEL_109:
                if (a9)
                {
                  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4821, 0);
                  *a9 = (id)objc_claimAutoreleasedReturnValue();
                }

                goto LABEL_153;
              }
            }
            else
            {
              v63 = MEMORY[0x1E0C81028];
              v69 = MEMORY[0x1E0C81028];
            }
            if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              *(_QWORD *)v93 = "AVHapticClient.mm";
              *(_WORD *)&v93[8] = 1024;
              *(_DWORD *)&v93[10] = 573;
              *(_WORD *)&v93[14] = 2080;
              *(_QWORD *)&v93[16] = "-[AVHapticClient doSendEvents:withImmediateParameters:atTime:channel:sorted:outToken:error:]";
              _os_log_impl(&dword_1B573F000, v63, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Event is none of haptic/audio event, parameter, or parameter curve. returning", buf, 0x1Cu);
            }

            goto LABEL_109;
          }
          objc_msgSend(v17, "parameterCurve");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "controlPoints");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "count");

          v22 = -[AVHapticClient calculateHapticCommandParamCurveMemorySize:](self, "calculateHapticCommandParamCurveMemorySize:", v21);
        }
      }
      else
      {
        objc_msgSend(v17, "duration");
        if (v23 == 0.0)
          v22 = 168;
        else
          v22 = 336;
      }

      v16 += v22;
      ++v15;
    }
    while (v82 != v15);
  }
  v87 = 0;
  v88 = 0;
  v89 = 0;
  v90 = 0;
  if ((reserveForWrite() & 1) == 0)
  {
    if ((unint64_t)objc_msgSend(v12, "count") < 3)
    {
      if (!kAVHCScope || (*(_BYTE *)(kAVHCScope + 8) & 1) == 0)
        goto LABEL_153;
      v61 = *(id *)kAVHCScope;
      v60 = v61;
      if (v61)
      {
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)v93 = "AVHapticClient.mm";
          *(_WORD *)&v93[8] = 1024;
          *(_DWORD *)&v93[10] = 603;
          *(_WORD *)&v93[14] = 2080;
          *(_QWORD *)&v93[16] = "-[AVHapticClient doSendEvents:withImmediateParameters:atTime:channel:sorted:outToken:error:]";
          _os_log_impl(&dword_1B573F000, v60, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Bailing out on recursion because event array cannot be split further", buf, 0x1Cu);
        }

        goto LABEL_153;
      }
      goto LABEL_154;
    }
    if ((v79 & 1) == 0)
    {
      objc_msgSend(v12, "sortedArrayUsingComparator:", &__block_literal_global_333);
      v12 = (id)objc_claimAutoreleasedReturnValue();

    }
    v86 = v12;
    objc_msgSend(v12, "subarrayWithRange:", 0, HapticClientUtil::getIndexOfSplitPoint<AVHapticEvent>(v12));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    if (kAVHCScope && (*(_BYTE *)(kAVHCScope + 8) & 1) != 0)
    {
      v65 = *(id *)kAVHCScope;
      v60 = v65;
      if (!v65)
      {
LABEL_95:

        goto LABEL_154;
      }
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)v93 = "AVHapticClient.mm";
        *(_WORD *)&v93[8] = 1024;
        *(_DWORD *)&v93[10] = 594;
        *(_WORD *)&v93[14] = 2080;
        *(_QWORD *)&v93[16] = "-[AVHapticClient doSendEvents:withImmediateParameters:atTime:channel:sorted:outToken:error:]";
        *(_WORD *)&v93[24] = 1024;
        *(_DWORD *)&v93[26] = v91;
        _os_log_impl(&dword_1B573F000, v60, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Bailing out on recursion (availableSize = %u)", buf, 0x22u);
      }

    }
    LOBYTE(v60) = 0;
    goto LABEL_95;
  }
  if (kAVHCScope)
  {
    if ((*(_BYTE *)(kAVHCScope + 8) & 1) != 0)
    {
      v24 = *(id *)kAVHCScope;
      if (v24)
      {
        v25 = v24;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)v93 = "AVHapticClient.mm";
          *(_WORD *)&v93[8] = 1024;
          *(_DWORD *)&v93[10] = 607;
          *(_WORD *)&v93[14] = 2080;
          *(_QWORD *)&v93[16] = "-[AVHapticClient doSendEvents:withImmediateParameters:atTime:channel:sorted:outToken:error:]";
          *(_WORD *)&v93[24] = 2048;
          *(double *)&v93[26] = a5;
          _os_log_impl(&dword_1B573F000, v25, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: ====>> StartEventList at time: %f", buf, 0x26u);
        }

      }
    }
  }
  memset(&v93[20], 0, 84);
  *(_DWORD *)buf = 393328;
  *(double *)&v93[4] = a5;
  *(_QWORD *)&v93[12] = a6;
  if (!writeCommandToReserved())
  {
    if (kAVHCScope)
    {
      v62 = *(id *)kAVHCScope;
      if (!v62)
      {
LABEL_100:
        if (!a9)
          goto LABEL_153;
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4899, 0);
        v67 = (id)objc_claimAutoreleasedReturnValue();
LABEL_118:
        LOBYTE(v60) = 0;
        *a9 = v67;
        goto LABEL_154;
      }
    }
    else
    {
      v62 = MEMORY[0x1E0C81028];
      v66 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)v93 = "AVHapticClient.mm";
      *(_WORD *)&v93[8] = 1024;
      *(_DWORD *)&v93[10] = 608;
      *(_WORD *)&v93[14] = 2080;
      *(_QWORD *)&v93[16] = "-[AVHapticClient doSendEvents:withImmediateParameters:atTime:channel:sorted:outToken:error:]";
      _os_log_impl(&dword_1B573F000, v62, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Memory write failed", buf, 0x1Cu);
    }

    goto LABEL_100;
  }
  if (!v82)
  {
LABEL_64:
    if (kAVHCScope)
    {
      if ((*(_BYTE *)(kAVHCScope + 8) & 1) != 0)
      {
        v58 = *(id *)kAVHCScope;
        if (v58)
        {
          v59 = v58;
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315906;
            *(_QWORD *)v93 = "AVHapticClient.mm";
            *(_WORD *)&v93[8] = 1024;
            *(_DWORD *)&v93[10] = 640;
            *(_WORD *)&v93[14] = 2080;
            *(_QWORD *)&v93[16] = "-[AVHapticClient doSendEvents:withImmediateParameters:atTime:channel:sorted:outToken:error:]";
            *(_WORD *)&v93[24] = 2048;
            *(double *)&v93[26] = a5;
            _os_log_impl(&dword_1B573F000, v59, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: <<==== EndEventList at time: %f", buf, 0x26u);
          }

        }
      }
    }
    memset(&v93[20], 0, 84);
    *(_DWORD *)buf = 458864;
    *(double *)&v93[4] = a5;
    *(_QWORD *)&v93[12] = a6;
    if ((writeCommandToReserved() & 1) != 0)
    {
      updateReservedWriteIndex();
      LOBYTE(v60) = 1;
      goto LABEL_154;
    }
    if (kAVHCScope)
    {
      v68 = *(id *)kAVHCScope;
      if (!v68)
      {
LABEL_116:
        if (!a9)
          goto LABEL_153;
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4899, 0);
        v67 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_118;
      }
    }
    else
    {
      v68 = MEMORY[0x1E0C81028];
      v70 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)v93 = "AVHapticClient.mm";
      *(_WORD *)&v93[8] = 1024;
      *(_DWORD *)&v93[10] = 641;
      *(_WORD *)&v93[14] = 2080;
      *(_QWORD *)&v93[16] = "-[AVHapticClient doSendEvents:withImmediateParameters:atTime:channel:sorted:outToken:error:]";
      _os_log_impl(&dword_1B573F000, v68, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Memory write failed", buf, 0x1Cu);
    }

    goto LABEL_116;
  }
  v26 = 0;
  v80 = 136315906;
  while (1)
  {
    objc_msgSend(v12, "objectAtIndexedSubscript:", v26, v80);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "eventCategory");
    if (!v28)
      break;
    if (v28 != 1)
    {
      if (v28 == 2)
      {
        if (kAVHCScope)
        {
          if ((*(_BYTE *)(kAVHCScope + 8) & 1) != 0)
          {
            v29 = *(id *)kAVHCScope;
            if (v29)
            {
              v30 = v29;
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v27, "time");
                *(_DWORD *)buf = v80;
                *(_QWORD *)v93 = "AVHapticClient.mm";
                *(_WORD *)&v93[8] = 1024;
                *(_DWORD *)&v93[10] = 630;
                *(_WORD *)&v93[14] = 2080;
                *(_QWORD *)&v93[16] = "-[AVHapticClient doSendEvents:withImmediateParameters:atTime:channel:sorted:outToken:error:]";
                *(_WORD *)&v93[24] = 2048;
                *(_QWORD *)&v93[26] = v31;
                _os_log_impl(&dword_1B573F000, v30, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Param curve: relative time %f", buf, 0x26u);
              }

            }
          }
        }
        v32 = objc_msgSend(v27, "paramType");
        objc_msgSend(v27, "time");
        v34 = v33;
        objc_msgSend(v27, "parameterCurve");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "controlPoints");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "sortedArrayUsingComparator:", &__block_literal_global_335);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVHapticClient doScheduleParamCurveWithMemoryReserve:atTime:channel:memoryReserve:paramCurve:error:](self, "doScheduleParamCurveWithMemoryReserve:atTime:channel:memoryReserve:paramCurve:error:", v32, a6, &v87, v37, a9, v34);

        goto LABEL_63;
      }
      if (kAVHCScope)
      {
        v71 = *(id *)kAVHCScope;
        if (!v71)
        {
LABEL_135:
          if (!a9)
            goto LABEL_152;
          v74 = -4821;
          goto LABEL_151;
        }
      }
      else
      {
        v71 = MEMORY[0x1E0C81028];
        v73 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)v93 = "AVHapticClient.mm";
        *(_WORD *)&v93[8] = 1024;
        *(_DWORD *)&v93[10] = 635;
        *(_WORD *)&v93[14] = 2080;
        *(_QWORD *)&v93[16] = "-[AVHapticClient doSendEvents:withImmediateParameters:atTime:channel:sorted:outToken:error:]";
        _os_log_impl(&dword_1B573F000, v71, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Event is none of haptic/audio event, parameter, or parameter curve. returning", buf, 0x1Cu);
      }

      goto LABEL_135;
    }
    if (kAVHCScope)
    {
      if ((*(_BYTE *)(kAVHCScope + 8) & 1) != 0)
      {
        v51 = *(id *)kAVHCScope;
        if (v51)
        {
          v52 = v51;
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v27, "time");
            *(_DWORD *)buf = v80;
            *(_QWORD *)v93 = "AVHapticClient.mm";
            *(_WORD *)&v93[8] = 1024;
            *(_DWORD *)&v93[10] = 625;
            *(_WORD *)&v93[14] = 2080;
            *(_QWORD *)&v93[16] = "-[AVHapticClient doSendEvents:withImmediateParameters:atTime:channel:sorted:outToken:error:]";
            *(_WORD *)&v93[24] = 2048;
            *(_QWORD *)&v93[26] = v53;
            _os_log_impl(&dword_1B573F000, v52, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Param event: relative time %f", buf, 0x26u);
          }

        }
      }
    }
    objc_msgSend(v27, "time");
    v55 = v54;
    v56 = objc_msgSend(v27, "paramType");
    objc_msgSend(v27, "value");
    v95 = 0u;
    v96 = 0u;
    v94 = 0u;
    memset(&v93[32], 0, 80);
    *(_DWORD *)buf = 196644;
    *(_QWORD *)&v93[4] = v55;
    *(_QWORD *)&v93[12] = a6;
    *(_QWORD *)&v93[20] = v56;
    *(_DWORD *)&v93[28] = v57;
    if ((writeCommandToReserved() & 1) == 0)
    {
      if (kAVHCScope)
      {
        v72 = *(id *)kAVHCScope;
        if (!v72)
          goto LABEL_149;
      }
      else
      {
        v72 = MEMORY[0x1E0C81028];
        v76 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)v93 = "AVHapticClient.mm";
        *(_WORD *)&v93[8] = 1024;
        *(_DWORD *)&v93[10] = 626;
        *(_WORD *)&v93[14] = 2080;
        *(_QWORD *)&v93[16] = "-[AVHapticClient doSendEvents:withImmediateParameters:atTime:channel:sorted:outToken:error:]";
        _os_log_impl(&dword_1B573F000, v72, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Memory write failed", buf, 0x1Cu);
      }
      goto LABEL_148;
    }
LABEL_63:

    if (v82 == ++v26)
      goto LABEL_64;
  }
  if (kAVHCScope)
  {
    if ((*(_BYTE *)(kAVHCScope + 8) & 1) != 0)
    {
      v38 = *(id *)kAVHCScope;
      if (v38)
      {
        v39 = v38;
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v27, "time");
          *(_DWORD *)buf = v80;
          *(_QWORD *)v93 = "AVHapticClient.mm";
          *(_WORD *)&v93[8] = 1024;
          *(_DWORD *)&v93[10] = 613;
          *(_WORD *)&v93[14] = 2080;
          *(_QWORD *)&v93[16] = "-[AVHapticClient doSendEvents:withImmediateParameters:atTime:channel:sorted:outToken:error:]";
          *(_WORD *)&v93[24] = 2048;
          *(_QWORD *)&v93[26] = v40;
          _os_log_impl(&dword_1B573F000, v39, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Start event: relative time %f", buf, 0x26u);
        }

      }
    }
  }
  startEventFromEvent(v27, v84, a6, *((_QWORD *)self + 3), (uint64_t)buf);
  if ((writeCommandToReserved() & 1) != 0)
  {
    objc_msgSend(v27, "duration");
    if (v41 != 0.0)
    {
      if (kAVHCScope)
      {
        if ((*(_BYTE *)(kAVHCScope + 8) & 1) != 0)
        {
          v42 = *(id *)kAVHCScope;
          if (v42)
          {
            v43 = v42;
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v27, "time");
              v45 = v44;
              objc_msgSend(v27, "duration");
              *(_DWORD *)buf = v80;
              *(_QWORD *)v93 = "AVHapticClient.mm";
              *(_WORD *)&v93[8] = 1024;
              *(_DWORD *)&v93[10] = 616;
              *(_WORD *)&v93[14] = 2080;
              *(_QWORD *)&v93[16] = "-[AVHapticClient doSendEvents:withImmediateParameters:atTime:channel:sorted:outToken:error:]";
              *(_WORD *)&v93[24] = 2048;
              *(double *)&v93[26] = v45 + v46;
              _os_log_impl(&dword_1B573F000, v43, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Stop event added: relative time %f", buf, 0x26u);
            }

          }
        }
      }
      objc_msgSend(v27, "time");
      v48 = v47;
      objc_msgSend(v27, "duration");
      v49 = *((_QWORD *)self + 3);
      memset(&v93[36], 0, 68);
      *(_DWORD *)buf = 131184;
      *(double *)&v93[4] = v48 + v50;
      *(_QWORD *)&v93[12] = a6;
      *(_QWORD *)&v93[20] = 0;
      *(_QWORD *)&v93[28] = v49;
      if ((writeCommandToReserved() & 1) == 0)
      {
        if (kAVHCScope)
        {
          v72 = *(id *)kAVHCScope;
          if (!v72)
            goto LABEL_149;
        }
        else
        {
          v72 = MEMORY[0x1E0C81028];
          v77 = MEMORY[0x1E0C81028];
        }
        if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)v93 = "AVHapticClient.mm";
          *(_WORD *)&v93[8] = 1024;
          *(_DWORD *)&v93[10] = 617;
          *(_WORD *)&v93[14] = 2080;
          *(_QWORD *)&v93[16] = "-[AVHapticClient doSendEvents:withImmediateParameters:atTime:channel:sorted:outToken:error:]";
          _os_log_impl(&dword_1B573F000, v72, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Memory write failed", buf, 0x1Cu);
        }
        goto LABEL_148;
      }
    }
    if (a8)
      *a8 = *((_QWORD *)self + 3);
    ++*((_QWORD *)self + 3);
    goto LABEL_63;
  }
  if (kAVHCScope)
  {
    v72 = *(id *)kAVHCScope;
    if (!v72)
      goto LABEL_149;
  }
  else
  {
    v72 = MEMORY[0x1E0C81028];
    v75 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)v93 = "AVHapticClient.mm";
    *(_WORD *)&v93[8] = 1024;
    *(_DWORD *)&v93[10] = 614;
    *(_WORD *)&v93[14] = 2080;
    *(_QWORD *)&v93[16] = "-[AVHapticClient doSendEvents:withImmediateParameters:atTime:channel:sorted:outToken:error:]";
    _os_log_impl(&dword_1B573F000, v72, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Memory write failed", buf, 0x1Cu);
  }
LABEL_148:

LABEL_149:
  if (!a9)
    goto LABEL_152;
  v74 = -4899;
LABEL_151:
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), v74, 0);
  *a9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_152:

LABEL_153:
  LOBYTE(v60) = 0;
LABEL_154:

  return (char)v60;
}

- (int)state
{
  id v3;
  NSObject *v4;
  int v5;
  int v6;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (kAVHSScope)
  {
    if ((*(_BYTE *)(kAVHSScope + 8) & 1) != 0)
    {
      v3 = *(id *)kAVHSScope;
      if (v3)
      {
        v4 = v3;
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
        {
          v5 = -[AVHapticClient clientID](self, "clientID");
          v6 = *((_DWORD *)self + 38);
          v8 = 136316162;
          v9 = "AVHapticClient.mm";
          v11 = 112;
          v12 = 2080;
          v10 = 1024;
          v13 = "-[AVHapticClient state]";
          v14 = 1024;
          v15 = v5;
          v16 = 1024;
          v17 = v6;
          _os_log_impl(&dword_1B573F000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: (Client 0x%x returning EngineState %d)", (uint8_t *)&v8, 0x28u);
        }

      }
    }
  }
  return *((_DWORD *)self + 38);
}

- (void)dealloc
{
  id v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  objc_super v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
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
    *(_DWORD *)buf = 136315906;
    v10 = "AVHapticClient.mm";
    v11 = 1024;
    v12 = 155;
    v13 = 2080;
    v14 = "-[AVHapticClient dealloc]";
    v15 = 1024;
    v16 = -[AVHapticClient clientID](self, "clientID");
    _os_log_impl(&dword_1B573F000, v5, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Deallocating HapticClient 0x%x", buf, 0x22u);
  }

LABEL_8:
  -[AVHapticClient disconnect](self, "disconnect");
  -[AVHapticClient destroySharedMemory](self, "destroySharedMemory");
  if (kAVHCScope)
  {
    v6 = *(id *)kAVHCScope;
    if (!v6)
      goto LABEL_15;
  }
  else
  {
    v6 = MEMORY[0x1E0C81028];
    v7 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v10 = "AVHapticClient.mm";
    v11 = 1024;
    v12 = 158;
    v13 = 2080;
    v14 = "-[AVHapticClient dealloc]";
    _os_log_impl(&dword_1B573F000, v6, OS_LOG_TYPE_INFO, "%25s:%-5d %s: dealloc of HapticClient exited", buf, 0x1Cu);
  }

LABEL_15:
  v8.receiver = self;
  v8.super_class = (Class)AVHapticClient;
  -[AVHapticClient dealloc](&v8, sel_dealloc);
}

void __48__AVHapticClient_queryServerCapabilities_reply___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = a2;
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
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v2, "localizedDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 136315906;
    v8 = "AVHapticClient.mm";
    v9 = 1024;
    v10 = 166;
    v11 = 2080;
    v12 = "-[AVHapticClient queryServerCapabilities:reply:]_block_invoke";
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1B573F000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Unable to get server capabilities: %@", (uint8_t *)&v7, 0x26u);

  }
LABEL_8:

}

- (double)hapticLatency
{
  void *v2;
  double v3;
  _QWORD v5[6];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[5];
  id v11;

  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = __Block_byref_object_copy__1;
  v10[4] = __Block_byref_object_dispose__1;
  v11 = 0;
  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[AVHapticClient getSyncDelegateForMethod:errorHandler:](self, "getSyncDelegateForMethod:errorHandler:", a2, &__block_literal_global_37);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __31__AVHapticClient_hapticLatency__block_invoke_38;
  v5[3] = &unk_1E6960278;
  v5[4] = &v6;
  v5[5] = v10;
  objc_msgSend(v2, "getHapticLatency:", v5);
  v3 = v7[3];

  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(v10, 8);

  return v3;
}

void __31__AVHapticClient_hapticLatency__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = a2;
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
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v2, "localizedDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 136315906;
    v8 = "AVHapticClient.mm";
    v9 = 1024;
    v10 = 176;
    v11 = 2080;
    v12 = "-[AVHapticClient hapticLatency]_block_invoke";
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1B573F000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Unable to get latency: %@", (uint8_t *)&v7, 0x26u);

  }
LABEL_8:

}

void __31__AVHapticClient_hapticLatency__block_invoke_38(uint64_t a1, void *a2, double a3)
{
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    if (kAVHCScope)
    {
      v7 = *(id *)kAVHCScope;
      if (!v7)
        goto LABEL_9;
    }
    else
    {
      v7 = MEMORY[0x1E0C81028];
      v8 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      v10 = 136315906;
      v11 = "AVHapticClient.mm";
      v12 = 1024;
      v13 = 181;
      v14 = 2080;
      v15 = "-[AVHapticClient hapticLatency]_block_invoke";
      v16 = 2112;
      v17 = v9;
      _os_log_impl(&dword_1B573F000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Got error from server: %@", (uint8_t *)&v10, 0x26u);
    }

  }
LABEL_9:

}

uint64_t __36__AVHapticClient_allocateResources___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)loadHapticEvent:(id)a3 reply:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD, uint64_t);
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  _QWORD v21[6];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t v26[4];
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  uint64_t v33;
  _BYTE buf[48];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, _QWORD, uint64_t))a4;
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
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = "AVHapticClient.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 221;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = "-[AVHapticClient loadHapticEvent:reply:]";
    *(_WORD *)&buf[28] = 1024;
    *(_DWORD *)&buf[30] = -[AVHapticClient clientID](self, "clientID");
    *(_WORD *)&buf[34] = 2048;
    *(_QWORD *)&buf[36] = v7;
    _os_log_impl(&dword_1B573F000, v11, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Client 0x%x loading dictionary: %p", buf, 0x2Cu);
  }

LABEL_8:
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  *(_QWORD *)&buf[24] = __Block_byref_object_copy__1;
  *(_QWORD *)&buf[32] = __Block_byref_object_dispose__1;
  *(_QWORD *)&buf[40] = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  -[AVHapticClient getSyncDelegateForMethod:errorHandler:](self, "getSyncDelegateForMethod:errorHandler:", a2, &__block_literal_global_42);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __40__AVHapticClient_loadHapticEvent_reply___block_invoke_2;
  v21[3] = &unk_1E69602F0;
  v21[4] = buf;
  v21[5] = &v22;
  objc_msgSend(v12, "loadHapticEvent:reply:", v7, v21);
  v13 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
  if (!v13)
  {
    v15 = 0;
    goto LABEL_18;
  }
  if (!kAVHCScope)
  {
    v14 = MEMORY[0x1E0C81028];
    v16 = MEMORY[0x1E0C81028];
    goto LABEL_14;
  }
  v14 = *(id *)kAVHCScope;
  if (v14)
  {
LABEL_14:
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v17 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
      *(_DWORD *)v26 = 136315906;
      v27 = "AVHapticClient.mm";
      v28 = 1024;
      v29 = 233;
      v30 = 2080;
      v31 = "-[AVHapticClient loadHapticEvent:reply:]";
      v32 = 2112;
      v33 = v17;
      _os_log_impl(&dword_1B573F000, v14, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Got error during transaction: %@", v26, 0x26u);
    }

  }
  v15 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
LABEL_18:
  v8[2](v8, v23[3], v15);
  if (kAVHCScope)
  {
    v18 = *(id *)kAVHCScope;
    if (!v18)
      goto LABEL_25;
  }
  else
  {
    v18 = MEMORY[0x1E0C81028];
    v19 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v26 = 136315650;
    v27 = "AVHapticClient.mm";
    v28 = 1024;
    v29 = 239;
    v30 = 2080;
    v31 = "-[AVHapticClient loadHapticEvent:reply:]";
    _os_log_impl(&dword_1B573F000, v18, OS_LOG_TYPE_INFO, "%25s:%-5d %s: done loading event", v26, 0x1Cu);
  }

LABEL_25:
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(buf, 8);

  return v13 == 0;
}

void __40__AVHapticClient_loadHapticEvent_reply___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v6;
  NSObject *v7;
  id v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  if (v6)
  {
    if (kAVHCScope)
    {
      v7 = *(id *)kAVHCScope;
      if (!v7)
        goto LABEL_9;
    }
    else
    {
      v7 = MEMORY[0x1E0C81028];
      v8 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315906;
      v10 = "AVHapticClient.mm";
      v11 = 1024;
      v12 = 228;
      v13 = 2080;
      v14 = "-[AVHapticClient loadHapticEvent:reply:]_block_invoke_2";
      v15 = 2112;
      v16 = v6;
      _os_log_impl(&dword_1B573F000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Got error from server: %@", (uint8_t *)&v9, 0x26u);
    }

  }
LABEL_9:
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;

}

- (BOOL)createCustomAudioEvent:(id)a3 format:(id)a4 frames:(unint64_t)a5 options:(id)a6 reply:(id)a7
{
  id v13;
  id v14;
  id v15;
  void (**v16)(id, _QWORD, uint64_t);
  void *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  _QWORD v26[6];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = (void (**)(id, _QWORD, uint64_t))a7;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__1;
  v35 = __Block_byref_object_dispose__1;
  v36 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  -[AVHapticClient getSyncDelegateForMethod:errorHandler:](self, "getSyncDelegateForMethod:errorHandler:", a2, &__block_literal_global_44);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __69__AVHapticClient_createCustomAudioEvent_format_frames_options_reply___block_invoke_2;
  v26[3] = &unk_1E69602F0;
  v26[4] = &v31;
  v26[5] = &v27;
  objc_msgSend(v17, "createCustomAudioEvent:format:frames:options:reply:", v13, v14, a5, v15, v26);
  v18 = v32[5];
  if (!v18)
  {
    v20 = 0;
    goto LABEL_11;
  }
  if (!kAVHCScope)
  {
    v19 = MEMORY[0x1E0C81028];
    v21 = MEMORY[0x1E0C81028];
    goto LABEL_7;
  }
  v19 = *(id *)kAVHCScope;
  if (v19)
  {
LABEL_7:
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v22 = v32[5];
      *(_DWORD *)buf = 136315906;
      v38 = "AVHapticClient.mm";
      v39 = 1024;
      v40 = 256;
      v41 = 2080;
      v42 = "-[AVHapticClient createCustomAudioEvent:format:frames:options:reply:]";
      v43 = 2112;
      v44 = v22;
      _os_log_impl(&dword_1B573F000, v19, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Got error during transaction: %@", buf, 0x26u);
    }

  }
  v20 = v32[5];
LABEL_11:
  v16[2](v16, v28[3], v20);
  if (kAVHCScope)
  {
    v23 = *(id *)kAVHCScope;
    if (!v23)
      goto LABEL_18;
  }
  else
  {
    v23 = MEMORY[0x1E0C81028];
    v24 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v38 = "AVHapticClient.mm";
    v39 = 1024;
    v40 = 262;
    v41 = 2080;
    v42 = "-[AVHapticClient createCustomAudioEvent:format:frames:options:reply:]";
    _os_log_impl(&dword_1B573F000, v23, OS_LOG_TYPE_INFO, "%25s:%-5d %s: done creating event", buf, 0x1Cu);
  }

LABEL_18:
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);

  return v18 == 0;
}

void __69__AVHapticClient_createCustomAudioEvent_format_frames_options_reply___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v6;
  NSObject *v7;
  id v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  if (v6)
  {
    if (kAVHCScope)
    {
      v7 = *(id *)kAVHCScope;
      if (!v7)
        goto LABEL_9;
    }
    else
    {
      v7 = MEMORY[0x1E0C81028];
      v8 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315906;
      v10 = "AVHapticClient.mm";
      v11 = 1024;
      v12 = 251;
      v13 = 2080;
      v14 = "-[AVHapticClient createCustomAudioEvent:format:frames:options:reply:]_block_invoke_2";
      v15 = 2112;
      v16 = v6;
      _os_log_impl(&dword_1B573F000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Got error from server: %@", (uint8_t *)&v9, 0x26u);
    }

  }
LABEL_9:
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;

}

- (BOOL)copyCustomAudioEvent:(unint64_t)a3 options:(id)a4 reply:(id)a5
{
  id v9;
  void (**v10)(id, _QWORD, uint64_t);
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  _QWORD v20[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = (void (**)(id, _QWORD, uint64_t))a5;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__1;
  v29 = __Block_byref_object_dispose__1;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  -[AVHapticClient getSyncDelegateForMethod:errorHandler:](self, "getSyncDelegateForMethod:errorHandler:", a2, &__block_literal_global_45);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __53__AVHapticClient_copyCustomAudioEvent_options_reply___block_invoke_2;
  v20[3] = &unk_1E69602F0;
  v20[4] = &v25;
  v20[5] = &v21;
  objc_msgSend(v11, "copyCustomAudioEvent:options:reply:", a3, v9, v20);
  v12 = v26[5];
  if (!v12)
  {
    v14 = 0;
    goto LABEL_11;
  }
  if (!kAVHCScope)
  {
    v13 = MEMORY[0x1E0C81028];
    v15 = MEMORY[0x1E0C81028];
    goto LABEL_7;
  }
  v13 = *(id *)kAVHCScope;
  if (v13)
  {
LABEL_7:
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v26[5];
      *(_DWORD *)buf = 136315906;
      v32 = "AVHapticClient.mm";
      v33 = 1024;
      v34 = 279;
      v35 = 2080;
      v36 = "-[AVHapticClient copyCustomAudioEvent:options:reply:]";
      v37 = 2112;
      v38 = v16;
      _os_log_impl(&dword_1B573F000, v13, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Got error during transaction: %@", buf, 0x26u);
    }

  }
  v14 = v26[5];
LABEL_11:
  v10[2](v10, v22[3], v14);
  if (kAVHCScope)
  {
    v17 = *(id *)kAVHCScope;
    if (!v17)
      goto LABEL_18;
  }
  else
  {
    v17 = MEMORY[0x1E0C81028];
    v18 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v32 = "AVHapticClient.mm";
    v33 = 1024;
    v34 = 285;
    v35 = 2080;
    v36 = "-[AVHapticClient copyCustomAudioEvent:options:reply:]";
    _os_log_impl(&dword_1B573F000, v17, OS_LOG_TYPE_INFO, "%25s:%-5d %s: done copying event", buf, 0x1Cu);
  }

LABEL_18:
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  return v12 == 0;
}

void __53__AVHapticClient_copyCustomAudioEvent_options_reply___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v6;
  NSObject *v7;
  id v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  if (v6)
  {
    if (kAVHCScope)
    {
      v7 = *(id *)kAVHCScope;
      if (!v7)
        goto LABEL_9;
    }
    else
    {
      v7 = MEMORY[0x1E0C81028];
      v8 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315906;
      v10 = "AVHapticClient.mm";
      v11 = 1024;
      v12 = 274;
      v13 = 2080;
      v14 = "-[AVHapticClient copyCustomAudioEvent:options:reply:]_block_invoke_2";
      v15 = 2112;
      v16 = v6;
      _os_log_impl(&dword_1B573F000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Got error from server: %@", (uint8_t *)&v9, 0x26u);
    }

  }
LABEL_9:
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;

}

- (BOOL)referenceCustomAudioEvent:(unint64_t)a3 reply:(id)a4
{
  void (**v7)(id, _QWORD);
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  _QWORD v18[5];
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = (void (**)(id, _QWORD))a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__1;
  v24 = __Block_byref_object_dispose__1;
  v8 = MEMORY[0x1E0C809B0];
  v25 = 0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __50__AVHapticClient_referenceCustomAudioEvent_reply___block_invoke;
  v19[3] = &unk_1E6960358;
  v19[4] = &v20;
  -[AVHapticClient getSyncDelegateForMethod:errorHandler:](self, "getSyncDelegateForMethod:errorHandler:", a2, v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v8;
  v18[1] = 3221225472;
  v18[2] = __50__AVHapticClient_referenceCustomAudioEvent_reply___block_invoke_2;
  v18[3] = &unk_1E6960358;
  v18[4] = &v20;
  objc_msgSend(v9, "referenceCustomAudioEvent:reply:", a3, v18);
  v10 = v21[5];
  if (!v10)
  {
    v12 = 0;
    goto LABEL_11;
  }
  if (!kAVHCScope)
  {
    v11 = MEMORY[0x1E0C81028];
    v13 = MEMORY[0x1E0C81028];
    goto LABEL_7;
  }
  v11 = *(id *)kAVHCScope;
  if (v11)
  {
LABEL_7:
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v21[5];
      *(_DWORD *)buf = 136315906;
      v27 = "AVHapticClient.mm";
      v28 = 1024;
      v29 = 301;
      v30 = 2080;
      v31 = "-[AVHapticClient referenceCustomAudioEvent:reply:]";
      v32 = 2112;
      v33 = v14;
      _os_log_impl(&dword_1B573F000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Got error during transaction: %@", buf, 0x26u);
    }

  }
  v12 = v21[5];
LABEL_11:
  v7[2](v7, v12);
  if (kAVHCScope)
  {
    v15 = *(id *)kAVHCScope;
    if (!v15)
      goto LABEL_18;
  }
  else
  {
    v15 = MEMORY[0x1E0C81028];
    v16 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v27 = "AVHapticClient.mm";
    v28 = 1024;
    v29 = 307;
    v30 = 2080;
    v31 = "-[AVHapticClient referenceCustomAudioEvent:reply:]";
    _os_log_impl(&dword_1B573F000, v15, OS_LOG_TYPE_INFO, "%25s:%-5d %s: done referencing event", buf, 0x1Cu);
  }

LABEL_18:
  _Block_object_dispose(&v20, 8);

  return v10 == 0;
}

void __50__AVHapticClient_referenceCustomAudioEvent_reply___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __50__AVHapticClient_referenceCustomAudioEvent_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  id v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  if (v4)
  {
    if (kAVHCScope)
    {
      v5 = *(id *)kAVHCScope;
      if (!v5)
        goto LABEL_9;
    }
    else
    {
      v5 = MEMORY[0x1E0C81028];
      v6 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315906;
      v8 = "AVHapticClient.mm";
      v9 = 1024;
      v10 = 297;
      v11 = 2080;
      v12 = "-[AVHapticClient referenceCustomAudioEvent:reply:]_block_invoke_2";
      v13 = 2112;
      v14 = v4;
      _os_log_impl(&dword_1B573F000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Got error from server: %@", (uint8_t *)&v7, 0x26u);
    }

  }
LABEL_9:

}

- (BOOL)releaseCustomAudioEvent:(unint64_t)a3 reply:(id)a4
{
  void (**v7)(id, _QWORD);
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  _QWORD v18[5];
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = (void (**)(id, _QWORD))a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__1;
  v24 = __Block_byref_object_dispose__1;
  v8 = MEMORY[0x1E0C809B0];
  v25 = 0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __48__AVHapticClient_releaseCustomAudioEvent_reply___block_invoke;
  v19[3] = &unk_1E6960358;
  v19[4] = &v20;
  -[AVHapticClient getSyncDelegateForMethod:errorHandler:](self, "getSyncDelegateForMethod:errorHandler:", a2, v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v8;
  v18[1] = 3221225472;
  v18[2] = __48__AVHapticClient_releaseCustomAudioEvent_reply___block_invoke_2;
  v18[3] = &unk_1E6960358;
  v18[4] = &v20;
  objc_msgSend(v9, "releaseCustomAudioEvent:reply:", a3, v18);
  v10 = v21[5];
  if (!v10)
  {
    v12 = 0;
    goto LABEL_11;
  }
  if (!kAVHCScope)
  {
    v11 = MEMORY[0x1E0C81028];
    v13 = MEMORY[0x1E0C81028];
    goto LABEL_7;
  }
  v11 = *(id *)kAVHCScope;
  if (v11)
  {
LABEL_7:
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v21[5];
      *(_DWORD *)buf = 136315906;
      v27 = "AVHapticClient.mm";
      v28 = 1024;
      v29 = 323;
      v30 = 2080;
      v31 = "-[AVHapticClient releaseCustomAudioEvent:reply:]";
      v32 = 2112;
      v33 = v14;
      _os_log_impl(&dword_1B573F000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Got error during transaction: %@", buf, 0x26u);
    }

  }
  v12 = v21[5];
LABEL_11:
  v7[2](v7, v12);
  if (kAVHCScope)
  {
    v15 = *(id *)kAVHCScope;
    if (!v15)
      goto LABEL_18;
  }
  else
  {
    v15 = MEMORY[0x1E0C81028];
    v16 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v27 = "AVHapticClient.mm";
    v28 = 1024;
    v29 = 329;
    v30 = 2080;
    v31 = "-[AVHapticClient releaseCustomAudioEvent:reply:]";
    _os_log_impl(&dword_1B573F000, v15, OS_LOG_TYPE_INFO, "%25s:%-5d %s: done releasing event", buf, 0x1Cu);
  }

LABEL_18:
  _Block_object_dispose(&v20, 8);

  return v10 == 0;
}

void __48__AVHapticClient_releaseCustomAudioEvent_reply___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __48__AVHapticClient_releaseCustomAudioEvent_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  id v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  if (v4)
  {
    if (kAVHCScope)
    {
      v5 = *(id *)kAVHCScope;
      if (!v5)
        goto LABEL_9;
    }
    else
    {
      v5 = MEMORY[0x1E0C81028];
      v6 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315906;
      v8 = "AVHapticClient.mm";
      v9 = 1024;
      v10 = 319;
      v11 = 2080;
      v12 = "-[AVHapticClient releaseCustomAudioEvent:reply:]_block_invoke_2";
      v13 = 2112;
      v14 = v4;
      _os_log_impl(&dword_1B573F000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Got error from server: %@", (uint8_t *)&v7, 0x26u);
    }

  }
LABEL_9:

}

uint64_t __26__AVHapticClient_prewarm___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)stopPrewarm
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (kAVHCScope)
  {
    v4 = *(id *)kAVHCScope;
    if (!v4)
      goto LABEL_8;
  }
  else
  {
    v4 = (id)MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  v6 = v4;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315906;
    v9 = "AVHapticClient.mm";
    v10 = 1024;
    v11 = 352;
    v12 = 2080;
    v13 = "-[AVHapticClient stopPrewarm]";
    v14 = 1024;
    v15 = -[AVHapticClient clientID](self, "clientID");
    _os_log_impl(&dword_1B573F000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Client 0x%x stopping prewarm", (uint8_t *)&v8, 0x22u);
  }

LABEL_8:
  -[AVHapticClient getAsyncDelegateForMethod:errorHandler:](self, "getAsyncDelegateForMethod:errorHandler:", a2, &__block_literal_global_46);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stopPrewarm");
  *((_BYTE *)self + 157) = 0;

}

void __29__AVHapticClient_stopPrewarm__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = a2;
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
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v2, "localizedDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 136315906;
    v8 = "AVHapticClient.mm";
    v9 = 1024;
    v10 = 354;
    v11 = 2080;
    v12 = "-[AVHapticClient stopPrewarm]_block_invoke";
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1B573F000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Unable to stop prewarm: %@", (uint8_t *)&v7, 0x26u);

  }
LABEL_8:

}

void __31__AVHapticClient_startRunning___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "setState:", 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)stopRunning
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (kAVHCScope)
  {
    v4 = *(id *)kAVHCScope;
    if (!v4)
      goto LABEL_8;
  }
  else
  {
    v4 = (id)MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  v6 = v4;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315906;
    v10 = "AVHapticClient.mm";
    v11 = 1024;
    v12 = 386;
    v13 = 2080;
    v14 = "-[AVHapticClient stopRunning]";
    v15 = 1024;
    v16 = -[AVHapticClient clientID](self, "clientID");
    _os_log_impl(&dword_1B573F000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Client 0x%x stopping", (uint8_t *)&v9, 0x22u);
  }

LABEL_8:
  -[AVHapticClient setState:](self, "setState:", 0);
  v7 = (void *)*((_QWORD *)self + 23);
  *((_QWORD *)self + 23) = 0;

  -[AVHapticClient getAsyncDelegateForMethod:errorHandler:](self, "getAsyncDelegateForMethod:errorHandler:", a2, &__block_literal_global_47);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stopRunning");

}

void __29__AVHapticClient_stopRunning__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = a2;
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
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v2, "localizedDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 136315906;
    v8 = "AVHapticClient.mm";
    v9 = 1024;
    v10 = 390;
    v11 = 2080;
    v12 = "-[AVHapticClient stopRunning]_block_invoke";
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1B573F000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Unable to stop running: %@", (uint8_t *)&v7, 0x26u);

  }
LABEL_8:

}

void __30__AVHapticClient_stopRunning___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "setState:", 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __25__AVHapticClient_finish___block_invoke_48(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "setCompletionCallback:", 0);
}

uint64_t __25__AVHapticClient_finish___block_invoke_49(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "setCompletionCallback:", 0);
}

- (BOOL)setChannelEventBehavior:(unint64_t)a3 channel:(unint64_t)a4
{
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  _QWORD v20[5];
  _QWORD v21[5];
  uint8_t v22[4];
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  uint64_t v29;
  _BYTE buf[40];
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (kAVHCScope)
  {
    v8 = *(id *)kAVHCScope;
    if (!v8)
      goto LABEL_8;
  }
  else
  {
    v8 = (id)MEMORY[0x1E0C81028];
    v9 = MEMORY[0x1E0C81028];
  }
  v10 = v8;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = "AVHapticClient.mm";
    *(_DWORD *)&buf[14] = 464;
    *(_WORD *)&buf[18] = 2080;
    *(_WORD *)&buf[12] = 1024;
    *(_QWORD *)&buf[20] = "-[AVHapticClient setChannelEventBehavior:channel:]";
    *(_WORD *)&buf[28] = 1024;
    *(_DWORD *)&buf[30] = -[AVHapticClient clientID](self, "clientID");
    *(_WORD *)&buf[34] = 1024;
    *(_DWORD *)&buf[36] = a3;
    _os_log_impl(&dword_1B573F000, v10, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Client 0x%x, behavior %u", buf, 0x28u);
  }

LABEL_8:
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  *(_QWORD *)&buf[24] = __Block_byref_object_copy__1;
  *(_QWORD *)&buf[32] = __Block_byref_object_dispose__1;
  v11 = MEMORY[0x1E0C809B0];
  v31 = 0;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __50__AVHapticClient_setChannelEventBehavior_channel___block_invoke;
  v21[3] = &unk_1E6960358;
  v21[4] = buf;
  -[AVHapticClient getSyncDelegateForMethod:errorHandler:](self, "getSyncDelegateForMethod:errorHandler:", a2, v21);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v11;
  v20[1] = 3221225472;
  v20[2] = __50__AVHapticClient_setChannelEventBehavior_channel___block_invoke_2;
  v20[3] = &unk_1E6960358;
  v20[4] = buf;
  objc_msgSend(v12, "setChannelEventBehavior:behavior:reply:", a4, a3, v20);
  v13 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
  if (!v13)
    goto LABEL_16;
  if (kAVHCScope)
  {
    v14 = *(id *)kAVHCScope;
    if (!v14)
      goto LABEL_16;
  }
  else
  {
    v14 = MEMORY[0x1E0C81028];
    v15 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v16 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
    *(_DWORD *)v22 = 136315906;
    v23 = "AVHapticClient.mm";
    v24 = 1024;
    v25 = 475;
    v26 = 2080;
    v27 = "-[AVHapticClient setChannelEventBehavior:channel:]";
    v28 = 2112;
    v29 = v16;
    _os_log_impl(&dword_1B573F000, v14, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Got error during transaction: %@", v22, 0x26u);
  }

LABEL_16:
  if (kAVHCScope)
  {
    v17 = *(id *)kAVHCScope;
    if (!v17)
      goto LABEL_23;
  }
  else
  {
    v17 = MEMORY[0x1E0C81028];
    v18 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v22 = 136315650;
    v23 = "AVHapticClient.mm";
    v24 = 1024;
    v25 = 480;
    v26 = 2080;
    v27 = "-[AVHapticClient setChannelEventBehavior:channel:]";
    _os_log_impl(&dword_1B573F000, v17, OS_LOG_TYPE_INFO, "%25s:%-5d %s: done setting behavior", v22, 0x1Cu);
  }

LABEL_23:
  _Block_object_dispose(buf, 8);

  return v13 == 0;
}

void __50__AVHapticClient_setChannelEventBehavior_channel___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __50__AVHapticClient_setChannelEventBehavior_channel___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  id v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  if (v4)
  {
    if (kAVHCScope)
    {
      v5 = *(id *)kAVHCScope;
      if (!v5)
        goto LABEL_9;
    }
    else
    {
      v5 = MEMORY[0x1E0C81028];
      v6 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315906;
      v8 = "AVHapticClient.mm";
      v9 = 1024;
      v10 = 471;
      v11 = 2080;
      v12 = "-[AVHapticClient setChannelEventBehavior:channel:]_block_invoke_2";
      v13 = 2048;
      v14 = v4;
      _os_log_impl(&dword_1B573F000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Got error from server: %p", (uint8_t *)&v7, 0x26u);
    }

  }
LABEL_9:

}

- (BOOL)doScheduleParamCurve:(unint64_t)a3 atTime:(double)a4 channel:(unint64_t)a5 paramCurve:(id)a6 error:(id *)a7
{
  id v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  BOOL v16;
  void *v17;
  unint64_t IndexOfSplit;
  void *v19;
  uint64_t v20;
  uint8_t buf[12];
  __int16 v23;
  _BYTE v24[20];
  __int16 v25;
  int v26;
  __int16 v27;
  double v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v12 = a6;
  v13 = objc_msgSend(v12, "count");
  if (kAVHCScope)
  {
    if ((*(_BYTE *)(kAVHCScope + 8) & 1) != 0)
    {
      v14 = *(id *)kAVHCScope;
      if (v14)
      {
        v15 = v14;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136316418;
          *(_QWORD *)&buf[4] = "AVHapticClient.mm";
          v23 = 1024;
          *(_DWORD *)v24 = 654;
          *(_WORD *)&v24[4] = 2080;
          *(_QWORD *)&v24[6] = "-[AVHapticClient doScheduleParamCurve:atTime:channel:paramCurve:error:]";
          *(_WORD *)&v24[14] = 1024;
          *(_DWORD *)&v24[16] = -[AVHapticClient clientID](self, "clientID");
          v25 = 1024;
          v26 = v13;
          v27 = 2048;
          v28 = a4;
          _os_log_impl(&dword_1B573F000, v15, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Client 0x%x writing %u param curve control points from passed-in param curve array at time: %.3f", buf, 0x32u);
        }

      }
    }
  }
  -[AVHapticClient calculateHapticCommandParamCurveMemorySize:](self, "calculateHapticCommandParamCurveMemorySize:", v13);
  memset(buf, 0, sizeof(buf));
  *(_QWORD *)&v24[2] = 0;
  *(_QWORD *)&v24[10] = 0;
  if ((reserveForWrite() & 1) != 0)
  {
    v16 = -[AVHapticClient doScheduleParamCurveWithMemoryReserve:atTime:channel:memoryReserve:paramCurve:error:](self, "doScheduleParamCurveWithMemoryReserve:atTime:channel:memoryReserve:paramCurve:error:", a3, a5, buf, v12, a7, a4);
    v17 = v12;
  }
  else
  {
    objc_msgSend(v12, "sortedArrayUsingComparator:", &__block_literal_global_335);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    IndexOfSplit = HapticClientUtil::getIndexOfSplitPoint<AVHapticEvent>(v17);
    objc_msgSend(v17, "subarrayWithRange:", 0, IndexOfSplit);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[AVHapticClient doScheduleParamCurve:atTime:channel:paramCurve:error:](self, "doScheduleParamCurve:atTime:channel:paramCurve:error:", a3, a5, v19, a7, a4))
    {
      objc_msgSend(v17, "subarrayWithRange:", IndexOfSplit, v13 - IndexOfSplit);
      v20 = objc_claimAutoreleasedReturnValue();

      v16 = -[AVHapticClient doScheduleParamCurve:atTime:channel:paramCurve:error:](self, "doScheduleParamCurve:atTime:channel:paramCurve:error:", a3, a5, v20, a7, a4);
      v19 = (void *)v20;
    }
    else
    {
      v16 = 0;
    }

  }
  return v16;
}

- (BOOL)doScheduleParamCurveWithMemoryReserve:(unint64_t)a3 atTime:(double)a4 channel:(unint64_t)a5 memoryReserve:(HapticSharedMemoryAddressReserve *)a6 paramCurve:(id)a7 error:(id *)a8
{
  id v10;
  void *v11;
  double v12;
  double v13;
  NSObject *v14;
  NSObject *v15;
  unsigned int v16;
  NSObject *v17;
  NSObject *v18;
  __int128 v19;
  unsigned int v20;
  double v21;
  unint64_t v22;
  unint64_t v23;
  float *v24;
  void *v25;
  double v26;
  NSObject *v27;
  NSObject *v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  BOOL v39;
  NSObject *v40;
  id v41;
  id v42;
  NSObject *v43;
  NSObject *v44;
  id v45;
  id v46;
  __int128 v48;
  unsigned int v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  int v60;
  uint8_t buf[4];
  _BYTE v62[108];
  __int128 v63;
  __int128 v64;
  __int128 v65;
  int v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v10 = a7;
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "time");
  v13 = v12;

  if (kAVHCScope)
  {
    if ((*(_BYTE *)(kAVHCScope + 8) & 1) != 0)
    {
      v14 = *(id *)kAVHCScope;
      if (v14)
      {
        v15 = v14;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136316674;
          *(_QWORD *)v62 = "AVHapticClient.mm";
          *(_WORD *)&v62[8] = 1024;
          *(_DWORD *)&v62[10] = 701;
          *(_WORD *)&v62[14] = 2080;
          *(_QWORD *)&v62[16] = "-[AVHapticClient doScheduleParamCurveWithMemoryReserve:atTime:channel:memoryReserve:paramCurve:error:]";
          *(_WORD *)&v62[24] = 1024;
          *(_DWORD *)&v62[26] = a3;
          *(_WORD *)&v62[30] = 2048;
          *(double *)&v62[32] = a4;
          *(_WORD *)&v62[40] = 2048;
          *(double *)&v62[42] = v13;
          *(_WORD *)&v62[50] = 2048;
          *(double *)&v62[52] = v13 + a4;
          _os_log_impl(&dword_1B573F000, v15, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: => StartParamCurveList (paramID %u) at (relative-to-event-list) original time %.3f + firstPointTimeOffset %.3f = adjusted time %.3f", buf, 0x40u);
        }

      }
    }
  }
  v16 = objc_msgSend(v10, "count");
  v51 = v16;
  if (kAVHCScope)
  {
    if ((*(_BYTE *)(kAVHCScope + 8) & 1) != 0)
    {
      v17 = *(id *)kAVHCScope;
      if (v17)
      {
        v18 = v17;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)v62 = "AVHapticClient.mm";
          *(_WORD *)&v62[8] = 1024;
          *(_DWORD *)&v62[10] = 704;
          *(_WORD *)&v62[14] = 2080;
          *(_QWORD *)&v62[16] = "-[AVHapticClient doScheduleParamCurveWithMemoryReserve:atTime:channel:memoryReserve:paramCurve:error:]";
          *(_WORD *)&v62[24] = 1024;
          *(_DWORD *)&v62[26] = v16;
          _os_log_impl(&dword_1B573F000, v18, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: %u curve points", buf, 0x22u);
        }

      }
    }
  }
  *(_DWORD *)buf = 589936;
  *(double *)&v62[4] = v13 + a4;
  *(_QWORD *)&v62[12] = a5;
  *(_QWORD *)&v62[20] = a3;
  memset(&v62[28], 0, 76);
  if (!writeCommandToReserved())
  {
    if (kAVHCScope)
    {
      v40 = *(id *)kAVHCScope;
      if (!v40)
        goto LABEL_53;
    }
    else
    {
      v40 = MEMORY[0x1E0C81028];
      v41 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)v62 = "AVHapticClient.mm";
      *(_WORD *)&v62[8] = 1024;
      *(_DWORD *)&v62[10] = 707;
      *(_WORD *)&v62[14] = 2080;
      *(_QWORD *)&v62[16] = "-[AVHapticClient doScheduleParamCurveWithMemoryReserve:atTime:channel:memoryReserve:paramCurve:error:]";
      _os_log_impl(&dword_1B573F000, v40, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Memory write failed", buf, 0x1Cu);
    }

LABEL_53:
    if (a8)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4899, 0);
      v42 = (id)objc_claimAutoreleasedReturnValue();
LABEL_67:
      v39 = 0;
      *a8 = v42;
      goto LABEL_75;
    }
LABEL_74:
    v39 = 0;
    goto LABEL_75;
  }
  if (v16)
  {
    v20 = 0;
    v21 = 0.0;
    *(_QWORD *)&v19 = 136316162;
    v48 = v19;
    while (1)
    {
      v60 = 0;
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      if (v20 + 16 <= v16)
        v22 = 16;
      else
        v22 = v16 - v20;
      v52 = 0uLL;
      v53 = 0uLL;
      if ((_DWORD)v22)
      {
        v23 = 0;
        v24 = (float *)&v52 + 2;
        do
        {
          objc_msgSend(v10, "objectAtIndexedSubscript:", v20 + v23, v48);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "time");
          *(float *)&v26 = v26 - v21 - v13;
          *(v24 - 1) = *(float *)&v26;
          objc_msgSend(v25, "value");
          clientParamToSynthParam();
          if (kAVHCScope)
          {
            if ((*(_BYTE *)(kAVHCScope + 8) & 1) != 0)
            {
              v27 = *(id *)kAVHCScope;
              if (v27)
              {
                v28 = v27;
                if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
                {
                  v29 = *(v24 - 1);
                  v30 = *v24;
                  *(_DWORD *)buf = 136316674;
                  *(_QWORD *)v62 = "AVHapticClient.mm";
                  *(_WORD *)&v62[8] = 1024;
                  *(_DWORD *)&v62[10] = 732;
                  *(_WORD *)&v62[14] = 2080;
                  *(_QWORD *)&v62[16] = "-[AVHapticClient doScheduleParamCurveWithMemoryReserve:atTime:channel:memoryRese"
                                        "rve:paramCurve:error:]";
                  *(_WORD *)&v62[24] = 1024;
                  *(_DWORD *)&v62[26] = v20 + v23;
                  *(_WORD *)&v62[30] = 1024;
                  *(_DWORD *)&v62[32] = 0;
                  *(_WORD *)&v62[36] = 2048;
                  *(double *)&v62[38] = v29;
                  *(_WORD *)&v62[46] = 2048;
                  *(double *)&v62[48] = v30;
                  _os_log_impl(&dword_1B573F000, v28, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Point #%u for synth param[%u]: adjusted rel time: %.3f, converted value: %f", buf, 0x3Cu);
                }

              }
            }
          }

          ++v23;
          v24 += 2;
        }
        while (v23 < v22);
      }
      LODWORD(v52) = v22;
      v31 = v21;
      v16 = v51;
      if (v20 + 16 <= v51)
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", v20 + 15);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "time");
        v34 = v33;

        v31 = v34 - v13;
        v16 = v51;
      }
      if (kAVHCScope)
      {
        if ((*(_BYTE *)(kAVHCScope + 8) & 1) != 0)
        {
          v35 = *(id *)kAVHCScope;
          if (v35)
          {
            v36 = v35;
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v48;
              *(_QWORD *)v62 = "AVHapticClient.mm";
              *(_WORD *)&v62[8] = 1024;
              *(_DWORD *)&v62[10] = 742;
              *(_WORD *)&v62[14] = 2080;
              *(_QWORD *)&v62[16] = "-[AVHapticClient doScheduleParamCurveWithMemoryReserve:atTime:channel:memoryReserve:"
                                    "paramCurve:error:]";
              *(_WORD *)&v62[24] = 1024;
              *(_DWORD *)&v62[26] = a3;
              *(_WORD *)&v62[30] = 2048;
              *(double *)&v62[32] = v21;
              _os_log_impl(&dword_1B573F000, v36, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: == AddParamCurve (paramID %u) rel time %.3f", buf, 0x2Cu);
            }

            v16 = v51;
          }
        }
      }
      v64 = v58;
      v65 = v59;
      v66 = v60;
      *(_OWORD *)&v62[60] = v54;
      *(_OWORD *)&v62[76] = v55;
      *(_OWORD *)&v62[92] = v56;
      v63 = v57;
      *(_OWORD *)&v62[28] = v52;
      *(_OWORD *)&v62[44] = v53;
      *(_DWORD *)buf = 655524;
      *(double *)&v62[4] = v21;
      *(_QWORD *)&v62[12] = a5;
      *(_QWORD *)&v62[20] = a3;
      if ((writeCommandToReserved() & 1) == 0)
        break;
      v20 += 15;
      v21 = v31;
      if (v20 >= v16)
        goto LABEL_38;
    }
    if (kAVHCScope)
    {
      v44 = *(id *)kAVHCScope;
      if (!v44)
      {
LABEL_72:
        if (a8)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4899, 0);
          *a8 = (id)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_74;
      }
    }
    else
    {
      v44 = MEMORY[0x1E0C81028];
      v46 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)v62 = "AVHapticClient.mm";
      *(_WORD *)&v62[8] = 1024;
      *(_DWORD *)&v62[10] = 743;
      *(_WORD *)&v62[14] = 2080;
      *(_QWORD *)&v62[16] = "-[AVHapticClient doScheduleParamCurveWithMemoryReserve:atTime:channel:memoryReserve:paramCurve:error:]";
      _os_log_impl(&dword_1B573F000, v44, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Memory write failed", buf, 0x1Cu);
    }

    goto LABEL_72;
  }
LABEL_38:
  if (kAVHCScope)
  {
    if ((*(_BYTE *)(kAVHCScope + 8) & 1) != 0)
    {
      v37 = *(id *)kAVHCScope;
      if (v37)
      {
        v38 = v37;
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136316674;
          *(_QWORD *)v62 = "AVHapticClient.mm";
          *(_WORD *)&v62[8] = 1024;
          *(_DWORD *)&v62[10] = 748;
          *(_WORD *)&v62[14] = 2080;
          *(_QWORD *)&v62[16] = "-[AVHapticClient doScheduleParamCurveWithMemoryReserve:atTime:channel:memoryReserve:paramCurve:error:]";
          *(_WORD *)&v62[24] = 1024;
          *(_DWORD *)&v62[26] = a3;
          *(_WORD *)&v62[30] = 2048;
          *(double *)&v62[32] = a4;
          *(_WORD *)&v62[40] = 2048;
          *(double *)&v62[42] = v13;
          *(_WORD *)&v62[50] = 2048;
          *(double *)&v62[52] = v13 + a4;
          _os_log_impl(&dword_1B573F000, v38, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: <= EndParamCurveList (paramID %u) at  original time %f + firstPointTimeOffset %.3f = adjusted time %.3f", buf, 0x40u);
        }

      }
    }
  }
  memset(&v62[28], 0, 76);
  *(_DWORD *)buf = 721008;
  *(double *)&v62[4] = v13 + a4;
  *(_QWORD *)&v62[12] = a5;
  *(_QWORD *)&v62[20] = a3;
  if ((writeCommandToReserved() & 1) == 0)
  {
    if (kAVHCScope)
    {
      v43 = *(id *)kAVHCScope;
      if (!v43)
        goto LABEL_65;
    }
    else
    {
      v43 = MEMORY[0x1E0C81028];
      v45 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)v62 = "AVHapticClient.mm";
      *(_WORD *)&v62[8] = 1024;
      *(_DWORD *)&v62[10] = 749;
      *(_WORD *)&v62[14] = 2080;
      *(_QWORD *)&v62[16] = "-[AVHapticClient doScheduleParamCurveWithMemoryReserve:atTime:channel:memoryReserve:paramCurve:error:]";
      _os_log_impl(&dword_1B573F000, v43, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Memory write failed", buf, 0x1Cu);
    }

LABEL_65:
    if (a8)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4899, 0);
      v42 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    }
    goto LABEL_74;
  }
  v39 = 1;
LABEL_75:

  return v39;
}

- (BOOL)clearEventsFromTime:(double)a3 channel:(unint64_t)a4
{
  AVHapticClient *v6;
  id v7;
  NSObject *v8;
  char v9;
  int v11;
  _OWORD v12[10];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = self;
  objc_sync_enter(v6);
  if (kAVHCScope)
  {
    if ((*(_BYTE *)(kAVHCScope + 8) & 1) != 0)
    {
      v7 = *(id *)kAVHCScope;
      if (v7)
      {
        v8 = v7;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          v11 = 136316418;
          *(_QWORD *)&v12[0] = "AVHapticClient.mm";
          WORD4(v12[0]) = 1024;
          *(_DWORD *)((char *)v12 + 10) = 763;
          HIWORD(v12[0]) = 2080;
          *(_QWORD *)&v12[1] = "-[AVHapticClient clearEventsFromTime:channel:]";
          WORD4(v12[1]) = 1024;
          *(_DWORD *)((char *)&v12[1] + 10) = -[AVHapticClient clientID](v6, "clientID");
          HIWORD(v12[1]) = 2048;
          *(double *)&v12[2] = a3;
          WORD4(v12[2]) = 1024;
          *(_DWORD *)((char *)&v12[2] + 10) = 4;
          _os_log_impl(&dword_1B573F000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Client 0x%x writing command: time: %.3f type: %hu", (uint8_t *)&v11, 0x32u);
        }

      }
    }
  }
  memset((char *)&v12[1] + 4, 0, 84);
  v11 = 262256;
  *(double *)((char *)v12 + 4) = a3;
  *(_QWORD *)((char *)v12 + 12) = a4;
  v9 = writeCommand();
  objc_sync_exit(v6);

  return v9;
}

- (BOOL)setParameter:(unint64_t)a3 atTime:(double)a4 value:(float)a5 channel:(unint64_t)a6
{
  AVHapticClient *v10;
  id v11;
  NSObject *v12;
  char v13;
  int v15;
  _BYTE v16[32];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v10 = self;
  objc_sync_enter(v10);
  if (kAVHCScope)
  {
    if ((*(_BYTE *)(kAVHCScope + 8) & 1) != 0)
    {
      v11 = *(id *)kAVHCScope;
      if (v11)
      {
        v12 = v11;
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          v15 = 136316930;
          *(_QWORD *)v16 = "AVHapticClient.mm";
          *(_WORD *)&v16[8] = 1024;
          *(_DWORD *)&v16[10] = 771;
          *(_WORD *)&v16[14] = 2080;
          *(_QWORD *)&v16[16] = "-[AVHapticClient setParameter:atTime:value:channel:]";
          *(_WORD *)&v16[24] = 1024;
          *(_DWORD *)&v16[26] = -[AVHapticClient clientID](v10, "clientID");
          *(_WORD *)&v16[30] = 2048;
          *(double *)&v17 = a4;
          WORD4(v17) = 1024;
          *(_DWORD *)((char *)&v17 + 10) = 3;
          HIWORD(v17) = 1024;
          LODWORD(v18) = a3;
          WORD2(v18) = 2048;
          *(double *)((char *)&v18 + 6) = a5;
          _os_log_impl(&dword_1B573F000, v12, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Client 0x%x writing command: time: %.3f type: %hu ID: %u, value: %f", (uint8_t *)&v15, 0x42u);
        }

      }
    }
  }
  v24 = 0u;
  v23 = 0u;
  v22 = 0u;
  v21 = 0u;
  v20 = 0u;
  v19 = 0u;
  v18 = 0u;
  v17 = 0u;
  v15 = 196644;
  *(double *)&v16[4] = a4;
  *(_QWORD *)&v16[12] = a6;
  *(_QWORD *)&v16[20] = a3;
  *(float *)&v16[28] = a5;
  v13 = writeCommand();
  objc_sync_exit(v10);

  return v13;
}

- (BOOL)scheduleParameterCurve:(unint64_t)a3 curve:(id)a4 atTime:(double)a5 channel:(unint64_t)a6 error:(id *)a7
{
  id v12;
  AVHapticClient *v13;
  id v15;
  id v16;
  NSObject *v17;
  uint8_t v18[40];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = self;
  objc_sync_enter(v13);
  if (!-[AVHapticClient doScheduleParamCurve:atTime:channel:paramCurve:error:](v13, "doScheduleParamCurve:atTime:channel:paramCurve:error:", a3, a6, v12, a7, a5))
  {
    if (kAVHCScope)
    {
      v15 = *(id *)kAVHCScope;
      if (!v15)
        goto LABEL_9;
    }
    else
    {
      v15 = (id)MEMORY[0x1E0C81028];
      v16 = MEMORY[0x1E0C81028];
    }
    v17 = v15;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[AVHapticClient scheduleParameterCurve:curve:atTime:channel:error:].cold.1(-[AVHapticClient clientID](v13, "clientID"), v18, v17);

LABEL_9:
    -[AVHapticClient scheduleParameterCurve:curve:atTime:channel:error:].cold.2();
  }
  objc_sync_exit(v13);

  return 1;
}

- (BOOL)loadAndPrepareHapticSequenceFromData:(id)a3 reply:(id)a4
{
  id v7;
  void (**v8)(id, uint64_t, uint64_t, uint64_t, double);
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  id *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  id obj;
  _QWORD v25[8];
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint8_t v39[4];
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  uint64_t v46;
  _BYTE buf[48];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, uint64_t, uint64_t, uint64_t, double))a4;
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
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = "AVHapticClient.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 793;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = "-[AVHapticClient loadAndPrepareHapticSequenceFromData:reply:]";
    *(_WORD *)&buf[28] = 1024;
    *(_DWORD *)&buf[30] = -[AVHapticClient clientID](self, "clientID");
    *(_WORD *)&buf[34] = 2048;
    *(_QWORD *)&buf[36] = v7;
    _os_log_impl(&dword_1B573F000, v11, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Client 0x%x loading sequence: %p", buf, 0x2Cu);
  }

LABEL_8:
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  *(_QWORD *)&buf[24] = __Block_byref_object_copy__1;
  *(_QWORD *)&buf[32] = __Block_byref_object_dispose__1;
  *(_QWORD *)&buf[40] = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = -1;
  v31 = 0;
  v32 = (double *)&v31;
  v33 = 0x2020000000;
  v34 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v12 = MEMORY[0x1E0C809B0];
  v30 = 0;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __61__AVHapticClient_loadAndPrepareHapticSequenceFromData_reply___block_invoke;
  v26[3] = &unk_1E6960358;
  v26[4] = buf;
  -[AVHapticClient getSyncDelegateForMethod:errorHandler:](self, "getSyncDelegateForMethod:errorHandler:", a2, v26);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v12;
  v25[1] = 3221225472;
  v25[2] = __61__AVHapticClient_loadAndPrepareHapticSequenceFromData_reply___block_invoke_2;
  v25[3] = &unk_1E69603C8;
  v25[4] = &v35;
  v25[5] = &v31;
  v25[6] = &v27;
  v25[7] = buf;
  objc_msgSend(v13, "loadHapticSequenceFromData:reply:", v7, v25);
  v14 = (id *)(*(_QWORD *)&buf[8] + 40);
  if (!*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
  {
    v16 = v36[3];
    obj = 0;
    -[AVHapticClient prepareHapticSequence:error:](self, "prepareHapticSequence:error:", v16, &obj);
    objc_storeStrong(v14, obj);
    v17 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
    v18 = v17 == 0;
    goto LABEL_18;
  }
  if (!kAVHCScope)
  {
    v15 = MEMORY[0x1E0C81028];
    v19 = MEMORY[0x1E0C81028];
    goto LABEL_14;
  }
  v15 = *(id *)kAVHCScope;
  if (v15)
  {
LABEL_14:
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v20 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
      *(_DWORD *)v39 = 136315906;
      v40 = "AVHapticClient.mm";
      v41 = 1024;
      v42 = 811;
      v43 = 2080;
      v44 = "-[AVHapticClient loadAndPrepareHapticSequenceFromData:reply:]";
      v45 = 2048;
      v46 = v20;
      _os_log_impl(&dword_1B573F000, v15, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Got error during transaction: %p", v39, 0x26u);
    }

  }
  v18 = 0;
  v17 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
LABEL_18:
  v8[2](v8, v36[3], v28[3], v17, v32[3]);
  if (kAVHCScope)
  {
    v21 = *(id *)kAVHCScope;
    if (!v21)
      goto LABEL_25;
  }
  else
  {
    v21 = MEMORY[0x1E0C81028];
    v22 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v39 = 136315650;
    v40 = "AVHapticClient.mm";
    v41 = 1024;
    v42 = 819;
    v43 = 2080;
    v44 = "-[AVHapticClient loadAndPrepareHapticSequenceFromData:reply:]";
    _os_log_impl(&dword_1B573F000, v21, OS_LOG_TYPE_INFO, "%25s:%-5d %s: done loading sequence", v39, 0x1Cu);
  }

LABEL_25:
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(buf, 8);

  return v18;
}

void __61__AVHapticClient_loadAndPrepareHapticSequenceFromData_reply___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __61__AVHapticClient_loadAndPrepareHapticSequenceFromData_reply___block_invoke_2(_QWORD *a1, uint64_t a2, uint64_t a3, void *a4, double a5)
{
  id v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  if (kAVHCScope)
  {
    if ((*(_BYTE *)(kAVHCScope + 8) & 1) != 0)
    {
      v11 = *(id *)kAVHCScope;
      if (v11)
      {
        v12 = v11;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          v15 = 136315650;
          v16 = "AVHapticClient.mm";
          v17 = 1024;
          v18 = 802;
          v19 = 2080;
          v20 = "-[AVHapticClient loadAndPrepareHapticSequenceFromData:reply:]_block_invoke_2";
          _os_log_impl(&dword_1B573F000, v12, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: loadAndPrepareHapticSequenceFromData:reply: top of [serverDelegate loadHapticSequenceFromData] reply block", (uint8_t *)&v15, 0x1Cu);
        }

      }
    }
  }
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = a2;
  *(double *)(*(_QWORD *)(a1[5] + 8) + 24) = a5;
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = a3;
  objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), a4);
  if (v10)
  {
    if (kAVHCScope)
    {
      v13 = *(id *)kAVHCScope;
      if (!v13)
        goto LABEL_15;
    }
    else
    {
      v13 = MEMORY[0x1E0C81028];
      v14 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 136315906;
      v16 = "AVHapticClient.mm";
      v17 = 1024;
      v18 = 807;
      v19 = 2080;
      v20 = "-[AVHapticClient loadAndPrepareHapticSequenceFromData:reply:]_block_invoke";
      v21 = 2048;
      v22 = v10;
      _os_log_impl(&dword_1B573F000, v13, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Got error from server: %p", (uint8_t *)&v15, 0x26u);
    }

  }
LABEL_15:

}

- (BOOL)loadAndPrepareHapticSequenceFromEvents:(id)a3 reply:(id)a4
{
  id v7;
  void (**v8)(id, uint64_t, uint64_t, uint64_t, double);
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  id *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  id obj;
  _QWORD v25[8];
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint8_t v39[4];
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  uint64_t v46;
  _BYTE buf[40];
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, uint64_t, uint64_t, uint64_t, double))a4;
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
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "AVHapticClient.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 826;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = "-[AVHapticClient loadAndPrepareHapticSequenceFromEvents:reply:]";
    *(_WORD *)&buf[28] = 1024;
    *(_DWORD *)&buf[30] = -[AVHapticClient clientID](self, "clientID");
    _os_log_impl(&dword_1B573F000, v11, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Client 0x%x loading sequence from event array", buf, 0x22u);
  }

LABEL_8:
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  *(_QWORD *)&buf[24] = __Block_byref_object_copy__1;
  *(_QWORD *)&buf[32] = __Block_byref_object_dispose__1;
  v48 = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = -1;
  v31 = 0;
  v32 = (double *)&v31;
  v33 = 0x2020000000;
  v34 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v12 = MEMORY[0x1E0C809B0];
  v30 = 0;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __63__AVHapticClient_loadAndPrepareHapticSequenceFromEvents_reply___block_invoke;
  v26[3] = &unk_1E6960358;
  v26[4] = buf;
  -[AVHapticClient getSyncDelegateForMethod:errorHandler:](self, "getSyncDelegateForMethod:errorHandler:", a2, v26);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v12;
  v25[1] = 3221225472;
  v25[2] = __63__AVHapticClient_loadAndPrepareHapticSequenceFromEvents_reply___block_invoke_2;
  v25[3] = &unk_1E69603C8;
  v25[4] = &v35;
  v25[5] = &v31;
  v25[6] = &v27;
  v25[7] = buf;
  objc_msgSend(v13, "loadHapticSequenceFromEvents:reply:", v7, v25);
  v14 = (id *)(*(_QWORD *)&buf[8] + 40);
  if (!*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
  {
    v16 = v36[3];
    obj = 0;
    -[AVHapticClient prepareHapticSequence:error:](self, "prepareHapticSequence:error:", v16, &obj);
    objc_storeStrong(v14, obj);
    v17 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
    v18 = v17 == 0;
    goto LABEL_18;
  }
  if (!kAVHCScope)
  {
    v15 = MEMORY[0x1E0C81028];
    v19 = MEMORY[0x1E0C81028];
    goto LABEL_14;
  }
  v15 = *(id *)kAVHCScope;
  if (v15)
  {
LABEL_14:
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v20 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
      *(_DWORD *)v39 = 136315906;
      v40 = "AVHapticClient.mm";
      v41 = 1024;
      v42 = 844;
      v43 = 2080;
      v44 = "-[AVHapticClient loadAndPrepareHapticSequenceFromEvents:reply:]";
      v45 = 2112;
      v46 = v20;
      _os_log_impl(&dword_1B573F000, v15, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Got error during transaction: %@", v39, 0x26u);
    }

  }
  v18 = 0;
  v17 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
LABEL_18:
  v8[2](v8, v36[3], v28[3], v17, v32[3]);
  if (kAVHCScope)
  {
    v21 = *(id *)kAVHCScope;
    if (!v21)
      goto LABEL_25;
  }
  else
  {
    v21 = MEMORY[0x1E0C81028];
    v22 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v39 = 136315650;
    v40 = "AVHapticClient.mm";
    v41 = 1024;
    v42 = 852;
    v43 = 2080;
    v44 = "-[AVHapticClient loadAndPrepareHapticSequenceFromEvents:reply:]";
    _os_log_impl(&dword_1B573F000, v21, OS_LOG_TYPE_INFO, "%25s:%-5d %s: done loading sequence", v39, 0x1Cu);
  }

LABEL_25:
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(buf, 8);

  return v18;
}

void __63__AVHapticClient_loadAndPrepareHapticSequenceFromEvents_reply___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __63__AVHapticClient_loadAndPrepareHapticSequenceFromEvents_reply___block_invoke_2(_QWORD *a1, uint64_t a2, uint64_t a3, void *a4, double a5)
{
  char *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  if (kAVHCScope)
  {
    if ((*(_BYTE *)(kAVHCScope + 8) & 1) != 0)
    {
      v11 = *(id *)kAVHCScope;
      if (v11)
      {
        v12 = v11;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          v15 = 136315650;
          v16 = "AVHapticClient.mm";
          v17 = 1024;
          v18 = 835;
          v19 = 2080;
          v20 = "-[AVHapticClient loadAndPrepareHapticSequenceFromEvents:reply:]_block_invoke_2";
          _os_log_impl(&dword_1B573F000, v12, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: loadAndPrepareHapticSequenceFromEvents:reply: top of [serverDelegate loadHapticSequenceFromEvents] reply block", (uint8_t *)&v15, 0x1Cu);
        }

      }
    }
  }
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = a2;
  *(double *)(*(_QWORD *)(a1[5] + 8) + 24) = a5;
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = a3;
  objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), a4);
  if (v10)
  {
    if (kAVHCScope)
    {
      v13 = *(id *)kAVHCScope;
      if (!v13)
        goto LABEL_15;
    }
    else
    {
      v13 = MEMORY[0x1E0C81028];
      v14 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 136315650;
      v16 = "AVHapticClient.mm";
      v17 = 1024;
      v18 = 840;
      v19 = 2112;
      v20 = v10;
      _os_log_impl(&dword_1B573F000, v13, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Got error from server: %@", (uint8_t *)&v15, 0x1Cu);
    }

  }
LABEL_15:

}

- (BOOL)loadAndPrepareHapticSequenceFromVibePattern:(id)a3 reply:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD, uint64_t);
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  id *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  id obj;
  _QWORD v25[6];
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint8_t v31[4];
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  uint64_t v38;
  _BYTE buf[48];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, _QWORD, uint64_t))a4;
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
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = "AVHapticClient.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 858;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = "-[AVHapticClient loadAndPrepareHapticSequenceFromVibePattern:reply:]";
    *(_WORD *)&buf[28] = 1024;
    *(_DWORD *)&buf[30] = -[AVHapticClient clientID](self, "clientID");
    *(_WORD *)&buf[34] = 2048;
    *(_QWORD *)&buf[36] = v7;
    _os_log_impl(&dword_1B573F000, v11, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Client 0x%x loading pattern: %p", buf, 0x2Cu);
  }

LABEL_8:
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  *(_QWORD *)&buf[24] = __Block_byref_object_copy__1;
  *(_QWORD *)&buf[32] = __Block_byref_object_dispose__1;
  *(_QWORD *)&buf[40] = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v12 = MEMORY[0x1E0C809B0];
  v30 = -1;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __68__AVHapticClient_loadAndPrepareHapticSequenceFromVibePattern_reply___block_invoke;
  v26[3] = &unk_1E6960358;
  v26[4] = buf;
  -[AVHapticClient getSyncDelegateForMethod:errorHandler:](self, "getSyncDelegateForMethod:errorHandler:", a2, v26);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v12;
  v25[1] = 3221225472;
  v25[2] = __68__AVHapticClient_loadAndPrepareHapticSequenceFromVibePattern_reply___block_invoke_2;
  v25[3] = &unk_1E69602F0;
  v25[4] = &v27;
  v25[5] = buf;
  objc_msgSend(v13, "loadVibePattern:reply:", v7, v25);
  v14 = (id *)(*(_QWORD *)&buf[8] + 40);
  if (!*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
  {
    v16 = v28[3];
    obj = 0;
    -[AVHapticClient prepareHapticSequence:error:](self, "prepareHapticSequence:error:", v16, &obj);
    objc_storeStrong(v14, obj);
    v17 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
    v18 = v17 == 0;
    goto LABEL_18;
  }
  if (!kAVHCScope)
  {
    v15 = MEMORY[0x1E0C81028];
    v19 = MEMORY[0x1E0C81028];
    goto LABEL_14;
  }
  v15 = *(id *)kAVHCScope;
  if (v15)
  {
LABEL_14:
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v20 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
      *(_DWORD *)v31 = 136315906;
      v32 = "AVHapticClient.mm";
      v33 = 1024;
      v34 = 872;
      v35 = 2080;
      v36 = "-[AVHapticClient loadAndPrepareHapticSequenceFromVibePattern:reply:]";
      v37 = 2112;
      v38 = v20;
      _os_log_impl(&dword_1B573F000, v15, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Got error during transaction: %@", v31, 0x26u);
    }

  }
  v18 = 0;
  v17 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
LABEL_18:
  v8[2](v8, v28[3], v17);
  if (kAVHCScope)
  {
    v21 = *(id *)kAVHCScope;
    if (!v21)
      goto LABEL_25;
  }
  else
  {
    v21 = MEMORY[0x1E0C81028];
    v22 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v31 = 136315650;
    v32 = "AVHapticClient.mm";
    v33 = 1024;
    v34 = 880;
    v35 = 2080;
    v36 = "-[AVHapticClient loadAndPrepareHapticSequenceFromVibePattern:reply:]";
    _os_log_impl(&dword_1B573F000, v21, OS_LOG_TYPE_INFO, "%25s:%-5d %s: done loading pattern", v31, 0x1Cu);
  }

LABEL_25:
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(buf, 8);

  return v18;
}

void __68__AVHapticClient_loadAndPrepareHapticSequenceFromVibePattern_reply___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __68__AVHapticClient_loadAndPrepareHapticSequenceFromVibePattern_reply___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (kAVHCScope)
  {
    if ((*(_BYTE *)(kAVHCScope + 8) & 1) != 0)
    {
      v7 = *(id *)kAVHCScope;
      if (v7)
      {
        v8 = v7;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          v11 = 136315650;
          v12 = "AVHapticClient.mm";
          v13 = 1024;
          v14 = 865;
          v15 = 2080;
          v16 = "-[AVHapticClient loadAndPrepareHapticSequenceFromVibePattern:reply:]_block_invoke_2";
          _os_log_impl(&dword_1B573F000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: loadAndPrepareHapticSequenceFromVibePattern:reply: top of [serverDelegate loadVibePattern] reply block", (uint8_t *)&v11, 0x1Cu);
        }

      }
    }
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  if (v6)
  {
    if (kAVHCScope)
    {
      v9 = *(id *)kAVHCScope;
      if (!v9)
        goto LABEL_15;
    }
    else
    {
      v9 = MEMORY[0x1E0C81028];
      v10 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315906;
      v12 = "AVHapticClient.mm";
      v13 = 1024;
      v14 = 868;
      v15 = 2080;
      v16 = "-[AVHapticClient loadAndPrepareHapticSequenceFromVibePattern:reply:]_block_invoke";
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_1B573F000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Got error from server: %@", (uint8_t *)&v11, 0x26u);
    }

  }
LABEL_15:

}

- (BOOL)setSequenceEventBehavior:(unint64_t)a3 behavior:(unint64_t)a4 channel:(unint64_t)a5
{
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  _QWORD v22[5];
  _QWORD v23[5];
  uint8_t v24[4];
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  uint64_t v31;
  _BYTE buf[40];
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (kAVHCScope)
  {
    v10 = *(id *)kAVHCScope;
    if (!v10)
      goto LABEL_8;
  }
  else
  {
    v10 = (id)MEMORY[0x1E0C81028];
    v11 = MEMORY[0x1E0C81028];
  }
  v12 = v10;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316418;
    *(_QWORD *)&buf[4] = "AVHapticClient.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 886;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = "-[AVHapticClient setSequenceEventBehavior:behavior:channel:]";
    *(_WORD *)&buf[28] = 1024;
    *(_DWORD *)&buf[30] = -[AVHapticClient clientID](self, "clientID");
    *(_WORD *)&buf[34] = 1024;
    *(_DWORD *)&buf[36] = a3;
    LOWORD(v33) = 1024;
    *(_DWORD *)((char *)&v33 + 2) = a4;
    _os_log_impl(&dword_1B573F000, v12, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Client 0x%x, seqID %u, behavior %u", buf, 0x2Eu);
  }

LABEL_8:
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  *(_QWORD *)&buf[24] = __Block_byref_object_copy__1;
  *(_QWORD *)&buf[32] = __Block_byref_object_dispose__1;
  v13 = MEMORY[0x1E0C809B0];
  v33 = 0;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __60__AVHapticClient_setSequenceEventBehavior_behavior_channel___block_invoke;
  v23[3] = &unk_1E6960358;
  v23[4] = buf;
  -[AVHapticClient getSyncDelegateForMethod:errorHandler:](self, "getSyncDelegateForMethod:errorHandler:", a2, v23);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v13;
  v22[1] = 3221225472;
  v22[2] = __60__AVHapticClient_setSequenceEventBehavior_behavior_channel___block_invoke_2;
  v22[3] = &unk_1E6960358;
  v22[4] = buf;
  objc_msgSend(v14, "setSequenceEventBehavior:behavior:channelIndex:reply:", a3, a4, a5, v22);
  v15 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
  if (!v15)
    goto LABEL_16;
  if (kAVHCScope)
  {
    v16 = *(id *)kAVHCScope;
    if (!v16)
      goto LABEL_16;
  }
  else
  {
    v16 = MEMORY[0x1E0C81028];
    v17 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v18 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
    *(_DWORD *)v24 = 136315906;
    v25 = "AVHapticClient.mm";
    v26 = 1024;
    v27 = 897;
    v28 = 2080;
    v29 = "-[AVHapticClient setSequenceEventBehavior:behavior:channel:]";
    v30 = 2112;
    v31 = v18;
    _os_log_impl(&dword_1B573F000, v16, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Got error during transaction: %@", v24, 0x26u);
  }

LABEL_16:
  if (kAVHCScope)
  {
    v19 = *(id *)kAVHCScope;
    if (!v19)
      goto LABEL_23;
  }
  else
  {
    v19 = MEMORY[0x1E0C81028];
    v20 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v24 = 136315650;
    v25 = "AVHapticClient.mm";
    v26 = 1024;
    v27 = 902;
    v28 = 2080;
    v29 = "-[AVHapticClient setSequenceEventBehavior:behavior:channel:]";
    _os_log_impl(&dword_1B573F000, v19, OS_LOG_TYPE_INFO, "%25s:%-5d %s: done setting behavior", v24, 0x1Cu);
  }

LABEL_23:
  _Block_object_dispose(buf, 8);

  return v15 == 0;
}

void __60__AVHapticClient_setSequenceEventBehavior_behavior_channel___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __60__AVHapticClient_setSequenceEventBehavior_behavior_channel___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  id v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  if (v4)
  {
    if (kAVHCScope)
    {
      v5 = *(id *)kAVHCScope;
      if (!v5)
        goto LABEL_9;
    }
    else
    {
      v5 = MEMORY[0x1E0C81028];
      v6 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315906;
      v8 = "AVHapticClient.mm";
      v9 = 1024;
      v10 = 893;
      v11 = 2080;
      v12 = "-[AVHapticClient setSequenceEventBehavior:behavior:channel:]_block_invoke_2";
      v13 = 2112;
      v14 = v4;
      _os_log_impl(&dword_1B573F000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Got error from server: %@", (uint8_t *)&v7, 0x26u);
    }

  }
LABEL_9:

}

- (void)setSequenceFinishedHandlerForID:(unint64_t)a3 finishedHandler:(id)a4
{
  id v6;
  std::mutex *v7;
  _QWORD *v8;
  uint64_t **v9;
  _QWORD *v10;
  uint64_t **v11;
  uint64_t v12;
  unint64_t v13;
  BOOL v14;
  _QWORD *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  AVHapticSequenceEntry *v19;
  unint64_t v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v6 = a4;
  v7 = (std::mutex *)((char *)self + 56);
  std::mutex::lock((std::mutex *)((char *)self + 56));
  v10 = (_QWORD *)*((_QWORD *)self + 16);
  v9 = (uint64_t **)((char *)self + 128);
  v8 = v10;
  v11 = v9 - 1;
  if (v10)
  {
    v12 = (uint64_t)v9;
    do
    {
      v13 = v8[4];
      v14 = v13 >= a3;
      if (v13 >= a3)
        v15 = v8;
      else
        v15 = v8 + 1;
      if (v14)
        v12 = (uint64_t)v8;
      v8 = (_QWORD *)*v15;
    }
    while (*v15);
    if ((uint64_t **)v12 != v9 && *(_QWORD *)(v12 + 32) <= a3)
      std::__tree<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>>>::erase(v9 - 1, v12);
  }
  if (kAVHCScope)
  {
    if ((*(_BYTE *)(kAVHCScope + 8) & 1) != 0)
    {
      v16 = *(id *)kAVHCScope;
      if (v16)
      {
        v17 = v16;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          v18 = (void *)MEMORY[0x1B5E4F2B4](v6);
          *(_DWORD *)buf = 136316162;
          v22 = "AVHapticClient.mm";
          v23 = 1024;
          v24 = 914;
          v25 = 2080;
          v26 = "-[AVHapticClient setSequenceFinishedHandlerForID:finishedHandler:]";
          v27 = 2048;
          v28 = v18;
          v29 = 1024;
          v30 = a3;
          _os_log_impl(&dword_1B573F000, v17, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Caching sequence finished handler block %p for seqID %u", buf, 0x2Cu);

        }
      }
    }
  }
  v19 = -[AVHapticSequenceEntry initWithHandler:]([AVHapticSequenceEntry alloc], "initWithHandler:", v6);
  std::__tree<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>>>::__emplace_unique_key_args<unsigned long,unsigned long &,AVHapticSequenceEntry * {__strong}>(v11, &v20, (uint64_t *)&v20, (uint64_t *)&v19);

  std::mutex::unlock(v7);
}

- (id)getSequenceFinishedHandlerForID:(unint64_t)a3
{
  std::mutex *v5;
  _QWORD *v6;
  char *v7;
  _QWORD *v8;
  id *v9;
  unint64_t v10;
  BOOL v11;
  _QWORD *v12;
  void *v13;
  void *v15;

  v5 = (std::mutex *)((char *)self + 56);
  std::mutex::lock((std::mutex *)((char *)self + 56));
  v8 = (_QWORD *)*((_QWORD *)self + 16);
  v7 = (char *)self + 128;
  v6 = v8;
  if (!v8)
    goto LABEL_12;
  v9 = (id *)v7;
  do
  {
    v10 = v6[4];
    v11 = v10 >= a3;
    if (v10 >= a3)
      v12 = v6;
    else
      v12 = v6 + 1;
    if (v11)
      v9 = (id *)v6;
    v6 = (_QWORD *)*v12;
  }
  while (*v12);
  if (v9 != (id *)v7 && (unint64_t)v9[4] <= a3)
  {
    objc_msgSend(v9[5], "handler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1B5E4F2B4]();

  }
  else
  {
LABEL_12:
    v13 = 0;
  }
  std::mutex::unlock(v5);
  return v13;
}

- (void)callSequenceFinishedHandlersWithError:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  char *v7;
  char *v8;
  id v9;
  void (**v10)(_QWORD, _QWORD);
  char *v11;
  char *v12;
  BOOL v13;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (kAVHCScope)
  {
    v5 = *(id *)kAVHCScope;
    if (!v5)
      goto LABEL_8;
  }
  else
  {
    v5 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v14 = 136315650;
    v15 = "AVHapticClient.mm";
    v16 = 1024;
    v17 = 927;
    v18 = 2080;
    v19 = "-[AVHapticClient callSequenceFinishedHandlersWithError:]";
    _os_log_impl(&dword_1B573F000, v5, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Calling completion handlers on any active sequences", (uint8_t *)&v14, 0x1Cu);
  }

LABEL_8:
  std::mutex::lock((std::mutex *)((char *)self + 56));
  v7 = (char *)*((_QWORD *)self + 15);
  v8 = (char *)self + 128;
  if (v7 != (char *)self + 128)
  {
    do
    {
      v9 = *((id *)v7 + 5);
      objc_msgSend(v9, "handler");
      v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id))v10)[2](v10, v4);

      v11 = (char *)*((_QWORD *)v7 + 1);
      if (v11)
      {
        do
        {
          v12 = v11;
          v11 = *(char **)v11;
        }
        while (v11);
      }
      else
      {
        do
        {
          v12 = (char *)*((_QWORD *)v7 + 2);
          v13 = *(_QWORD *)v12 == (_QWORD)v7;
          v7 = v12;
        }
        while (!v13);
      }
      v7 = v12;
    }
    while (v12 != v8);
  }
  std::__tree<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>>>::destroy((uint64_t)self + 120, *((_QWORD **)self + 16));
  *((_QWORD *)self + 16) = 0;
  *((_QWORD *)self + 17) = 0;
  *((_QWORD *)self + 15) = v8;
  std::mutex::unlock((std::mutex *)((char *)self + 56));

}

- (void)setRunStateForSequenceEntryWithID:(unint64_t)a3 running:(BOOL)a4
{
  _BOOL8 v4;
  std::mutex *v7;
  _QWORD *v8;
  char *v9;
  _QWORD *v10;
  id *v11;
  unint64_t v12;
  BOOL v13;
  _QWORD *v14;

  v4 = a4;
  v7 = (std::mutex *)((char *)self + 56);
  std::mutex::lock((std::mutex *)((char *)self + 56));
  v10 = (_QWORD *)*((_QWORD *)self + 16);
  v9 = (char *)self + 128;
  v8 = v10;
  if (v10)
  {
    v11 = (id *)v9;
    do
    {
      v12 = v8[4];
      v13 = v12 >= a3;
      if (v12 >= a3)
        v14 = v8;
      else
        v14 = v8 + 1;
      if (v13)
        v11 = (id *)v8;
      v8 = (_QWORD *)*v14;
    }
    while (*v14);
    if (v11 != (id *)v9 && (unint64_t)v11[4] <= a3)
      objc_msgSend(v11[5], "setRunning:", v4);
  }
  std::mutex::unlock(v7);
}

- (void)detachSequenceEntryforID:(unint64_t)a3
{
  std::mutex *v5;
  _QWORD *v6;
  char *v7;
  _QWORD *v8;
  uint64_t **v9;
  uint64_t v10;
  unint64_t v11;
  BOOL v12;
  _QWORD *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  int v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = (std::mutex *)((char *)self + 56);
  std::mutex::lock((std::mutex *)((char *)self + 56));
  v8 = (_QWORD *)*((_QWORD *)self + 16);
  v7 = (char *)self + 128;
  v6 = v8;
  if (v8)
  {
    v9 = (uint64_t **)(v7 - 8);
    v10 = (uint64_t)v7;
    do
    {
      v11 = v6[4];
      v12 = v11 >= a3;
      if (v11 >= a3)
        v13 = v6;
      else
        v13 = v6 + 1;
      if (v12)
        v10 = (uint64_t)v6;
      v6 = (_QWORD *)*v13;
    }
    while (*v13);
    if ((char *)v10 != v7 && *(_QWORD *)(v10 + 32) <= a3)
    {
      if (objc_msgSend(*(id *)(v10 + 40), "running"))
      {
        if (kAVHCScope)
        {
          if ((*(_BYTE *)(kAVHCScope + 8) & 1) != 0)
          {
            v14 = *(id *)kAVHCScope;
            if (v14)
            {
              v15 = v14;
              if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
              {
                v18 = 136315906;
                v19 = "AVHapticClient.mm";
                v20 = 1024;
                v21 = 950;
                v22 = 2080;
                v23 = "-[AVHapticClient detachSequenceEntryforID:]";
                v24 = 1024;
                v25 = a3;
                _os_log_impl(&dword_1B573F000, v15, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Sequence %u is running - setting entry to detached", (uint8_t *)&v18, 0x22u);
              }

            }
          }
        }
        objc_msgSend(*(id *)(v10 + 40), "setDetached:", 1);
      }
      else
      {
        if (kAVHCScope)
        {
          if ((*(_BYTE *)(kAVHCScope + 8) & 1) != 0)
          {
            v16 = *(id *)kAVHCScope;
            if (v16)
            {
              v17 = v16;
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
              {
                v18 = 136315906;
                v19 = "AVHapticClient.mm";
                v20 = 1024;
                v21 = 954;
                v22 = 2080;
                v23 = "-[AVHapticClient detachSequenceEntryforID:]";
                v24 = 1024;
                v25 = a3;
                _os_log_impl(&dword_1B573F000, v17, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Sequence %u is not running - deleting entry", (uint8_t *)&v18, 0x22u);
              }

            }
          }
        }
        std::__tree<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>>>::erase(v9, v10);
      }
    }
  }
  std::mutex::unlock(v5);
}

- (BOOL)prepareHapticSequence:(unint64_t)a3 error:(id *)a4
{
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  _QWORD v20[5];
  _QWORD v21[5];
  uint8_t v22[4];
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  uint64_t v29;
  _BYTE buf[40];
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (kAVHCScope)
  {
    v8 = *(id *)kAVHCScope;
    if (!v8)
      goto LABEL_8;
  }
  else
  {
    v8 = (id)MEMORY[0x1E0C81028];
    v9 = MEMORY[0x1E0C81028];
  }
  v10 = v8;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = "AVHapticClient.mm";
    *(_DWORD *)&buf[14] = 962;
    *(_WORD *)&buf[18] = 2080;
    *(_WORD *)&buf[12] = 1024;
    *(_QWORD *)&buf[20] = "-[AVHapticClient prepareHapticSequence:error:]";
    *(_WORD *)&buf[28] = 1024;
    *(_DWORD *)&buf[30] = -[AVHapticClient clientID](self, "clientID");
    *(_WORD *)&buf[34] = 1024;
    *(_DWORD *)&buf[36] = a3;
    _os_log_impl(&dword_1B573F000, v10, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Client 0x%x preparing sequenceID: %u", buf, 0x28u);
  }

LABEL_8:
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  *(_QWORD *)&buf[24] = __Block_byref_object_copy__1;
  *(_QWORD *)&buf[32] = __Block_byref_object_dispose__1;
  v11 = MEMORY[0x1E0C809B0];
  v31 = 0;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __46__AVHapticClient_prepareHapticSequence_error___block_invoke;
  v21[3] = &unk_1E6960358;
  v21[4] = buf;
  -[AVHapticClient getSyncDelegateForMethod:errorHandler:](self, "getSyncDelegateForMethod:errorHandler:", a2, v21);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v11;
  v20[1] = 3221225472;
  v20[2] = __46__AVHapticClient_prepareHapticSequence_error___block_invoke_2;
  v20[3] = &unk_1E6960358;
  v20[4] = buf;
  objc_msgSend(v12, "prepareHapticSequence:reply:", a3, v20);
  v13 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
  if (!v13)
    goto LABEL_18;
  if (!kAVHCScope)
  {
    v14 = MEMORY[0x1E0C81028];
    v15 = MEMORY[0x1E0C81028];
    goto LABEL_13;
  }
  v14 = *(id *)kAVHCScope;
  if (v14)
  {
LABEL_13:
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
      *(_DWORD *)v22 = 136315906;
      v23 = "AVHapticClient.mm";
      v24 = 1024;
      v25 = 974;
      v26 = 2080;
      v27 = "-[AVHapticClient prepareHapticSequence:error:]";
      v28 = 2112;
      v29 = v16;
      _os_log_impl(&dword_1B573F000, v14, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Got error during transaction: %@", v22, 0x26u);
    }

  }
  if (a4)
    *a4 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
LABEL_18:
  if (kAVHCScope)
  {
    v17 = *(id *)kAVHCScope;
    if (!v17)
      goto LABEL_25;
  }
  else
  {
    v17 = MEMORY[0x1E0C81028];
    v18 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v22 = 136315650;
    v23 = "AVHapticClient.mm";
    v24 = 1024;
    v25 = 982;
    v26 = 2080;
    v27 = "-[AVHapticClient prepareHapticSequence:error:]";
    _os_log_impl(&dword_1B573F000, v17, OS_LOG_TYPE_INFO, "%25s:%-5d %s: done preparing", v22, 0x1Cu);
  }

LABEL_25:
  _Block_object_dispose(buf, 8);

  return v13 == 0;
}

void __46__AVHapticClient_prepareHapticSequence_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __46__AVHapticClient_prepareHapticSequence_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (kAVHCScope)
  {
    if ((*(_BYTE *)(kAVHCScope + 8) & 1) != 0)
    {
      v5 = *(id *)kAVHCScope;
      if (v5)
      {
        v6 = v5;
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        {
          v9 = 136315650;
          v10 = "AVHapticClient.mm";
          v11 = 1024;
          v12 = 968;
          v13 = 2080;
          v14 = "-[AVHapticClient prepareHapticSequence:error:]_block_invoke_2";
          _os_log_impl(&dword_1B573F000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: prepareHapticSequence:error: top of [serverDelegate prepareHapticSequence] reply block", (uint8_t *)&v9, 0x1Cu);
        }

      }
    }
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  if (v4)
  {
    if (kAVHCScope)
    {
      v7 = *(id *)kAVHCScope;
      if (!v7)
        goto LABEL_15;
    }
    else
    {
      v7 = MEMORY[0x1E0C81028];
      v8 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315906;
      v10 = "AVHapticClient.mm";
      v11 = 1024;
      v12 = 970;
      v13 = 2080;
      v14 = "-[AVHapticClient prepareHapticSequence:error:]_block_invoke";
      v15 = 2112;
      v16 = v4;
      _os_log_impl(&dword_1B573F000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Got error from server: %@", (uint8_t *)&v9, 0x26u);
    }

  }
LABEL_15:

}

- (BOOL)enableSequenceLooping:(unint64_t)a3 enable:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  AVHapticClient *v8;
  NSObject *v9;
  NSObject *v10;
  char v11;
  char v12;
  int v14;
  _BYTE v15[32];
  float v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _DWORD v23[7];
  uint64_t v24;

  v6 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  v8 = self;
  objc_sync_enter(v8);
  if (kAVHCScope)
  {
    if ((*(_BYTE *)(kAVHCScope + 8) & 1) != 0)
    {
      v9 = *(id *)kAVHCScope;
      if (v9)
      {
        v10 = v9;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          v14 = 136316418;
          *(_QWORD *)v15 = "AVHapticClient.mm";
          *(_WORD *)&v15[8] = 1024;
          *(_DWORD *)&v15[10] = 991;
          *(_WORD *)&v15[14] = 2080;
          *(_QWORD *)&v15[16] = "-[AVHapticClient enableSequenceLooping:enable:error:]";
          *(_WORD *)&v15[24] = 1024;
          *(_DWORD *)&v15[26] = 22;
          *(_WORD *)&v15[30] = 1024;
          v16 = *(float *)&a3;
          LOWORD(v17) = 1024;
          *(_DWORD *)((char *)&v17 + 2) = v6;
          _os_log_impl(&dword_1B573F000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Writing command: (time 0) type: %hu sequenceID: %u looping: %d", (uint8_t *)&v14, 0x2Eu);
        }

      }
    }
  }
  memset(v23, 0, sizeof(v23));
  v22 = 0u;
  v21 = 0u;
  v20 = 0u;
  v19 = 0u;
  v18 = 0u;
  v17 = 0u;
  v14 = 1441832;
  *(_QWORD *)&v15[4] = 0;
  *(_QWORD *)&v15[12] = a3;
  *(_QWORD *)&v15[20] = a3;
  *(_DWORD *)&v15[28] = 101;
  v16 = (float)v6;
  v11 = writeCommand();
  objc_sync_exit(v8);

  if (a5)
    v12 = v11;
  else
    v12 = 1;
  if ((v12 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -4811, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v11;
}

- (BOOL)setSequenceLoopLength:(unint64_t)a3 length:(float)a4 error:(id *)a5
{
  AVHapticClient *v8;
  NSObject *v9;
  NSObject *v10;
  char v11;
  char v12;
  int v14;
  _BYTE v15[32];
  float v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _DWORD v23[7];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = self;
  objc_sync_enter(v8);
  if (kAVHCScope)
  {
    if ((*(_BYTE *)(kAVHCScope + 8) & 1) != 0)
    {
      v9 = *(id *)kAVHCScope;
      if (v9)
      {
        v10 = v9;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          v14 = 136316418;
          *(_QWORD *)v15 = "AVHapticClient.mm";
          *(_WORD *)&v15[8] = 1024;
          *(_DWORD *)&v15[10] = 1006;
          *(_WORD *)&v15[14] = 2080;
          *(_QWORD *)&v15[16] = "-[AVHapticClient setSequenceLoopLength:length:error:]";
          *(_WORD *)&v15[24] = 1024;
          *(_DWORD *)&v15[26] = 22;
          *(_WORD *)&v15[30] = 1024;
          v16 = *(float *)&a3;
          LOWORD(v17) = 2048;
          *(double *)((char *)&v17 + 2) = a4;
          _os_log_impl(&dword_1B573F000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Writing command: (time 0) type: %hu sequenceID: %u loop length: %f", (uint8_t *)&v14, 0x32u);
        }

      }
    }
  }
  memset(v23, 0, sizeof(v23));
  v22 = 0u;
  v21 = 0u;
  v20 = 0u;
  v19 = 0u;
  v18 = 0u;
  v17 = 0u;
  v14 = 1441832;
  *(_QWORD *)&v15[4] = 0;
  *(_QWORD *)&v15[12] = a3;
  *(_QWORD *)&v15[20] = a3;
  *(_DWORD *)&v15[28] = 102;
  v16 = a4;
  v11 = writeCommand();
  objc_sync_exit(v8);

  if (a5)
    v12 = v11;
  else
    v12 = 1;
  if ((v12 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -4811, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v11;
}

- (BOOL)setSequencePlaybackRate:(unint64_t)a3 rate:(float)a4 error:(id *)a5
{
  AVHapticClient *v8;
  NSObject *v9;
  NSObject *v10;
  char v11;
  char v12;
  int v14;
  _BYTE v15[32];
  float v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _DWORD v23[7];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = self;
  objc_sync_enter(v8);
  if (kAVHCScope)
  {
    if ((*(_BYTE *)(kAVHCScope + 8) & 1) != 0)
    {
      v9 = *(id *)kAVHCScope;
      if (v9)
      {
        v10 = v9;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          v14 = 136316418;
          *(_QWORD *)v15 = "AVHapticClient.mm";
          *(_WORD *)&v15[8] = 1024;
          *(_DWORD *)&v15[10] = 1021;
          *(_WORD *)&v15[14] = 2080;
          *(_QWORD *)&v15[16] = "-[AVHapticClient setSequencePlaybackRate:rate:error:]";
          *(_WORD *)&v15[24] = 1024;
          *(_DWORD *)&v15[26] = 22;
          *(_WORD *)&v15[30] = 1024;
          v16 = *(float *)&a3;
          LOWORD(v17) = 2048;
          *(double *)((char *)&v17 + 2) = a4;
          _os_log_impl(&dword_1B573F000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Writing command: (time 0) type: %hu sequenceID: %u rate: %f", (uint8_t *)&v14, 0x32u);
        }

      }
    }
  }
  memset(v23, 0, sizeof(v23));
  v22 = 0u;
  v21 = 0u;
  v20 = 0u;
  v19 = 0u;
  v18 = 0u;
  v17 = 0u;
  v14 = 1441832;
  *(_QWORD *)&v15[4] = 0;
  *(_QWORD *)&v15[12] = a3;
  *(_QWORD *)&v15[20] = a3;
  *(_DWORD *)&v15[28] = 103;
  v16 = a4;
  v11 = writeCommand();
  objc_sync_exit(v8);

  if (a5)
    v12 = v11;
  else
    v12 = 1;
  if ((v12 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -4811, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v11;
}

- (BOOL)startHapticSequence:(unint64_t)a3 atTime:(double)a4 withOffset:(double)a5
{
  AVHapticClient *v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  int v13;
  _BYTE v14[36];
  _OWORD v15[8];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = self;
  objc_sync_enter(v8);
  if (kAVHCScope)
  {
    if ((*(_BYTE *)(kAVHCScope + 8) & 1) != 0)
    {
      v9 = *(id *)kAVHCScope;
      if (v9)
      {
        v10 = v9;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          v13 = 136316674;
          *(_QWORD *)v14 = "AVHapticClient.mm";
          *(_WORD *)&v14[8] = 1024;
          *(_DWORD *)&v14[10] = 1034;
          *(_WORD *)&v14[14] = 2080;
          *(_QWORD *)&v14[16] = "-[AVHapticClient startHapticSequence:atTime:withOffset:]";
          *(_WORD *)&v14[24] = 2048;
          *(double *)&v14[26] = a4;
          *(_WORD *)&v14[34] = 1024;
          LODWORD(v15[0]) = 20;
          WORD2(v15[0]) = 1024;
          *(_DWORD *)((char *)v15 + 6) = a3;
          WORD5(v15[0]) = 2048;
          *(double *)((char *)v15 + 12) = a5;
          _os_log_impl(&dword_1B573F000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Writing command: time: %.3f type: %hu sequenceID: %u offset: %f", (uint8_t *)&v13, 0x3Cu);
        }

      }
    }
  }
  memset(v15, 0, 124);
  v13 = 1310760;
  *(double *)&v14[4] = a4;
  *(_QWORD *)&v14[12] = a3;
  *(_QWORD *)&v14[20] = 51;
  *(double *)&v14[28] = a5;
  v11 = writeCommand();
  if (v11)
    -[AVHapticClient setRunStateForSequenceEntryWithID:running:](v8, "setRunStateForSequenceEntryWithID:running:", a3, 1);
  objc_sync_exit(v8);

  return v11;
}

- (BOOL)stopHapticSequence:(unint64_t)a3 atTime:(double)a4
{
  AVHapticClient *v6;
  NSObject *v7;
  NSObject *v8;
  char v9;
  int v11;
  _BYTE v12[36];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _DWORD v19[7];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = self;
  objc_sync_enter(v6);
  if (kAVHCScope)
  {
    if ((*(_BYTE *)(kAVHCScope + 8) & 1) != 0)
    {
      v7 = *(id *)kAVHCScope;
      if (v7)
      {
        v8 = v7;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          v11 = 136316418;
          *(_QWORD *)v12 = "AVHapticClient.mm";
          *(_WORD *)&v12[8] = 1024;
          *(_DWORD *)&v12[10] = 1048;
          *(_WORD *)&v12[14] = 2080;
          *(_QWORD *)&v12[16] = "-[AVHapticClient stopHapticSequence:atTime:]";
          *(_WORD *)&v12[24] = 2048;
          *(double *)&v12[26] = a4;
          *(_WORD *)&v12[34] = 1024;
          LODWORD(v13) = 20;
          WORD2(v13) = 1024;
          *(_DWORD *)((char *)&v13 + 6) = a3;
          _os_log_impl(&dword_1B573F000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Writing command: time: %.3f seq cmd type: %hu sequenceID: %u", (uint8_t *)&v11, 0x32u);
        }

      }
    }
  }
  memset(v19, 0, sizeof(v19));
  v18 = 0u;
  v17 = 0u;
  v16 = 0u;
  v15 = 0u;
  v14 = 0u;
  v13 = 0u;
  v11 = 1310760;
  *(double *)&v12[4] = a4;
  *(_QWORD *)&v12[12] = a3;
  *(_QWORD *)&v12[20] = 52;
  *(_QWORD *)&v12[28] = 0xBFF0000000000000;
  v9 = writeCommand();
  objc_sync_exit(v6);

  return v9;
}

- (BOOL)pauseHapticSequence:(unint64_t)a3 atTime:(double)a4
{
  AVHapticClient *v6;
  NSObject *v7;
  NSObject *v8;
  char v9;
  int v11;
  _BYTE v12[36];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _DWORD v19[7];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = self;
  objc_sync_enter(v6);
  if (kAVHCScope)
  {
    if ((*(_BYTE *)(kAVHCScope + 8) & 1) != 0)
    {
      v7 = *(id *)kAVHCScope;
      if (v7)
      {
        v8 = v7;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          v11 = 136316418;
          *(_QWORD *)v12 = "AVHapticClient.mm";
          *(_WORD *)&v12[8] = 1024;
          *(_DWORD *)&v12[10] = 1056;
          *(_WORD *)&v12[14] = 2080;
          *(_QWORD *)&v12[16] = "-[AVHapticClient pauseHapticSequence:atTime:]";
          *(_WORD *)&v12[24] = 2048;
          *(double *)&v12[26] = a4;
          *(_WORD *)&v12[34] = 1024;
          LODWORD(v13) = 20;
          WORD2(v13) = 1024;
          *(_DWORD *)((char *)&v13 + 6) = a3;
          _os_log_impl(&dword_1B573F000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Writing command: time: %.3f seq cmd type: %hu sequenceID: %u", (uint8_t *)&v11, 0x32u);
        }

      }
    }
  }
  memset(v19, 0, sizeof(v19));
  v18 = 0u;
  v17 = 0u;
  v16 = 0u;
  v15 = 0u;
  v14 = 0u;
  v13 = 0u;
  v11 = 1310760;
  *(double *)&v12[4] = a4;
  *(_QWORD *)&v12[12] = a3;
  *(_QWORD *)&v12[20] = 53;
  *(_QWORD *)&v12[28] = 0xBFF0000000000000;
  v9 = writeCommand();
  objc_sync_exit(v6);

  return v9;
}

- (BOOL)resumeHapticSequence:(unint64_t)a3 atTime:(double)a4
{
  AVHapticClient *v6;
  NSObject *v7;
  NSObject *v8;
  char v9;
  int v11;
  _BYTE v12[36];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _DWORD v19[7];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = self;
  objc_sync_enter(v6);
  if (kAVHCScope)
  {
    if ((*(_BYTE *)(kAVHCScope + 8) & 1) != 0)
    {
      v7 = *(id *)kAVHCScope;
      if (v7)
      {
        v8 = v7;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          v11 = 136316418;
          *(_QWORD *)v12 = "AVHapticClient.mm";
          *(_WORD *)&v12[8] = 1024;
          *(_DWORD *)&v12[10] = 1064;
          *(_WORD *)&v12[14] = 2080;
          *(_QWORD *)&v12[16] = "-[AVHapticClient resumeHapticSequence:atTime:]";
          *(_WORD *)&v12[24] = 2048;
          *(double *)&v12[26] = a4;
          *(_WORD *)&v12[34] = 1024;
          LODWORD(v13) = 20;
          WORD2(v13) = 1024;
          *(_DWORD *)((char *)&v13 + 6) = a3;
          _os_log_impl(&dword_1B573F000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Writing command: time: %.3f seq cmd type: %hu sequenceID: %u", (uint8_t *)&v11, 0x32u);
        }

      }
    }
  }
  memset(v19, 0, sizeof(v19));
  v18 = 0u;
  v17 = 0u;
  v16 = 0u;
  v15 = 0u;
  v14 = 0u;
  v13 = 0u;
  v11 = 1310760;
  *(double *)&v12[4] = a4;
  *(_QWORD *)&v12[12] = a3;
  *(_QWORD *)&v12[20] = 54;
  *(_QWORD *)&v12[28] = 0xBFF0000000000000;
  v9 = writeCommand();
  objc_sync_exit(v6);

  return v9;
}

- (BOOL)seekHapticSequence:(unint64_t)a3 toTime:(double)a4
{
  AVHapticClient *v6;
  NSObject *v7;
  NSObject *v8;
  char v9;
  int v11;
  _BYTE v12[36];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _DWORD v19[7];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = self;
  objc_sync_enter(v6);
  if (kAVHCScope)
  {
    if ((*(_BYTE *)(kAVHCScope + 8) & 1) != 0)
    {
      v7 = *(id *)kAVHCScope;
      if (v7)
      {
        v8 = v7;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          v11 = 136316418;
          *(_QWORD *)v12 = "AVHapticClient.mm";
          *(_WORD *)&v12[8] = 1024;
          *(_DWORD *)&v12[10] = 1073;
          *(_WORD *)&v12[14] = 2080;
          *(_QWORD *)&v12[16] = "-[AVHapticClient seekHapticSequence:toTime:]";
          *(_WORD *)&v12[24] = 2048;
          *(_QWORD *)&v12[26] = 0;
          *(_WORD *)&v12[34] = 1024;
          LODWORD(v13) = 20;
          WORD2(v13) = 1024;
          *(_DWORD *)((char *)&v13 + 6) = a3;
          _os_log_impl(&dword_1B573F000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Writing command: time: %.3f seq cmd type: %hu sequenceID: %u", (uint8_t *)&v11, 0x32u);
        }

      }
    }
  }
  memset(v19, 0, sizeof(v19));
  v18 = 0u;
  v17 = 0u;
  v16 = 0u;
  v15 = 0u;
  v14 = 0u;
  v13 = 0u;
  v11 = 1310760;
  *(_QWORD *)&v12[4] = 0;
  *(_QWORD *)&v12[12] = a3;
  *(_QWORD *)&v12[20] = 55;
  *(double *)&v12[28] = a4;
  v9 = writeCommand();
  objc_sync_exit(v6);

  return v9;
}

- (BOOL)resetHapticSequence:(unint64_t)a3 atTime:(double)a4
{
  AVHapticClient *v6;
  NSObject *v7;
  NSObject *v8;
  char v9;
  int v11;
  _BYTE v12[36];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _DWORD v19[7];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = self;
  objc_sync_enter(v6);
  if (kAVHCScope)
  {
    if ((*(_BYTE *)(kAVHCScope + 8) & 1) != 0)
    {
      v7 = *(id *)kAVHCScope;
      if (v7)
      {
        v8 = v7;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          v11 = 136316418;
          *(_QWORD *)v12 = "AVHapticClient.mm";
          *(_WORD *)&v12[8] = 1024;
          *(_DWORD *)&v12[10] = 1081;
          *(_WORD *)&v12[14] = 2080;
          *(_QWORD *)&v12[16] = "-[AVHapticClient resetHapticSequence:atTime:]";
          *(_WORD *)&v12[24] = 2048;
          *(double *)&v12[26] = a4;
          *(_WORD *)&v12[34] = 1024;
          LODWORD(v13) = 20;
          WORD2(v13) = 1024;
          *(_DWORD *)((char *)&v13 + 6) = a3;
          _os_log_impl(&dword_1B573F000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Writing command: time: %.3f seq cmd type: %hu sequenceID: %u", (uint8_t *)&v11, 0x32u);
        }

      }
    }
  }
  memset(v19, 0, sizeof(v19));
  v18 = 0u;
  v17 = 0u;
  v16 = 0u;
  v15 = 0u;
  v14 = 0u;
  v13 = 0u;
  v11 = 1310760;
  *(double *)&v12[4] = a4;
  *(_QWORD *)&v12[12] = a3;
  *(_QWORD *)&v12[20] = 56;
  *(_QWORD *)&v12[28] = 0xBFF0000000000000;
  v9 = writeCommand();
  objc_sync_exit(v6);

  return v9;
}

- (BOOL)sendUnduckAudioCommand:(unint64_t)a3 atTime:(double)a4
{
  AVHapticClient *v6;
  NSObject *v7;
  NSObject *v8;
  char v9;
  int v11;
  _BYTE v12[36];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _DWORD v19[7];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = self;
  objc_sync_enter(v6);
  if (kAVHCScope)
  {
    if ((*(_BYTE *)(kAVHCScope + 8) & 1) != 0)
    {
      v7 = *(id *)kAVHCScope;
      if (v7)
      {
        v8 = v7;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          v11 = 136316418;
          *(_QWORD *)v12 = "AVHapticClient.mm";
          *(_WORD *)&v12[8] = 1024;
          *(_DWORD *)&v12[10] = 1089;
          *(_WORD *)&v12[14] = 2080;
          *(_QWORD *)&v12[16] = "-[AVHapticClient sendUnduckAudioCommand:atTime:]";
          *(_WORD *)&v12[24] = 2048;
          *(double *)&v12[26] = a4;
          *(_WORD *)&v12[34] = 1024;
          LODWORD(v13) = 20;
          WORD2(v13) = 1024;
          *(_DWORD *)((char *)&v13 + 6) = a3;
          _os_log_impl(&dword_1B573F000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Writing command: time: %.3f seq cmd type: %hu sequenceID: %u", (uint8_t *)&v11, 0x32u);
        }

      }
    }
  }
  memset(v19, 0, sizeof(v19));
  v18 = 0u;
  v17 = 0u;
  v16 = 0u;
  v15 = 0u;
  v14 = 0u;
  v13 = 0u;
  v11 = 1310760;
  *(double *)&v12[4] = a4;
  *(_QWORD *)&v12[12] = a3;
  *(_QWORD *)&v12[20] = 57;
  *(_QWORD *)&v12[28] = 0xBFF0000000000000;
  v9 = writeCommand();
  objc_sync_exit(v6);

  return v9;
}

- (BOOL)setSequenceChannelParameter:(unint64_t)a3 atTime:(double)a4 value:(float)a5 sequenceID:(unint64_t)a6 channel:(unint64_t)a7
{
  AVHapticClient *v12;
  NSObject *v13;
  NSObject *v14;
  char v15;
  int v17;
  _BYTE v18[36];
  _BYTE v19[12];
  _OWORD v20[7];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v12 = self;
  objc_sync_enter(v12);
  if (kAVHCScope)
  {
    if ((*(_BYTE *)(kAVHCScope + 8) & 1) != 0)
    {
      v13 = *(id *)kAVHCScope;
      if (v13)
      {
        v14 = v13;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          v17 = 136317186;
          *(_QWORD *)v18 = "AVHapticClient.mm";
          *(_WORD *)&v18[8] = 1024;
          *(_DWORD *)&v18[10] = 1097;
          *(_WORD *)&v18[14] = 2080;
          *(_QWORD *)&v18[16] = "-[AVHapticClient setSequenceChannelParameter:atTime:value:sequenceID:channel:]";
          *(_WORD *)&v18[24] = 2048;
          *(double *)&v18[26] = a4;
          *(_WORD *)&v18[34] = 1024;
          *(_DWORD *)v19 = 21;
          *(_WORD *)&v19[4] = 1024;
          *(_DWORD *)&v19[6] = a6;
          *(_WORD *)&v19[10] = 1024;
          LODWORD(v20[0]) = a7;
          WORD2(v20[0]) = 1024;
          *(_DWORD *)((char *)v20 + 6) = a3;
          WORD5(v20[0]) = 2048;
          *(double *)((char *)v20 + 12) = a5;
          _os_log_impl(&dword_1B573F000, v14, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Writing command: time: %.3f type: %hu sequenceID: %u channel: %u param: %u value: %.3f", (uint8_t *)&v17, 0x48u);
        }

      }
    }
  }
  memset(v20, 0, sizeof(v20));
  v17 = 1376312;
  *(double *)&v18[4] = a4;
  *(_QWORD *)&v18[12] = a6;
  *(_QWORD *)&v18[20] = 0;
  *(_QWORD *)&v18[28] = a7;
  *(_QWORD *)v19 = a3;
  *(float *)&v19[8] = a5;
  v15 = writeCommand();
  objc_sync_exit(v12);

  return v15;
}

- (BOOL)clearSequenceEvents:(unint64_t)a3 atTime:(double)a4
{
  AVHapticClient *v6;
  NSObject *v7;
  NSObject *v8;
  char v9;
  int v11;
  _BYTE v12[36];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = self;
  objc_sync_enter(v6);
  if (kAVHCScope)
  {
    if ((*(_BYTE *)(kAVHCScope + 8) & 1) != 0)
    {
      v7 = *(id *)kAVHCScope;
      if (v7)
      {
        v8 = v7;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          v11 = 136316418;
          *(_QWORD *)v12 = "AVHapticClient.mm";
          *(_WORD *)&v12[8] = 1024;
          *(_DWORD *)&v12[10] = 1105;
          *(_WORD *)&v12[14] = 2080;
          *(_QWORD *)&v12[16] = "-[AVHapticClient clearSequenceEvents:atTime:]";
          *(_WORD *)&v12[24] = 2048;
          *(double *)&v12[26] = a4;
          *(_WORD *)&v12[34] = 1024;
          LODWORD(v13) = 23;
          WORD2(v13) = 1024;
          *(_DWORD *)((char *)&v13 + 6) = a3;
          _os_log_impl(&dword_1B573F000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Writing command: time: %.3f cmd type: %hu sequenceID: %u", (uint8_t *)&v11, 0x32u);
        }

      }
    }
  }
  v17 = 0;
  v16 = 0u;
  v15 = 0u;
  v14 = 0u;
  v13 = 0u;
  *(_OWORD *)&v12[20] = 0u;
  v11 = 1507440;
  *(double *)&v12[4] = a4;
  *(_QWORD *)&v12[12] = a3;
  v9 = writeCommand();
  objc_sync_exit(v6);

  return v9;
}

- (void)detachHapticSequence:(unint64_t)a3
{
  AVHapticClient *v5;
  id v6;
  id v7;
  NSObject *v8;
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
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = self;
  objc_sync_enter(v5);
  if (kAVHCScope)
  {
    v6 = *(id *)kAVHCScope;
    if (!v6)
      goto LABEL_8;
  }
  else
  {
    v6 = (id)MEMORY[0x1E0C81028];
    v7 = MEMORY[0x1E0C81028];
  }
  v8 = v6;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v10 = 136316162;
    v11 = "AVHapticClient.mm";
    v13 = 1113;
    v14 = 2080;
    v12 = 1024;
    v15 = "-[AVHapticClient detachHapticSequence:]";
    v16 = 1024;
    v17 = -[AVHapticClient clientID](v5, "clientID");
    v18 = 1024;
    v19 = a3;
    _os_log_impl(&dword_1B573F000, v8, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Client 0x%x detaching sequenceID %u", (uint8_t *)&v10, 0x28u);
  }

LABEL_8:
  -[AVHapticClient getAsyncDelegateForMethod:errorHandler:](v5, "getAsyncDelegateForMethod:errorHandler:", a2, &__block_literal_global_56);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVHapticClient detachSequenceEntryforID:](v5, "detachSequenceEntryforID:", a3);
  objc_msgSend(v9, "detachSequence:", a3);

  objc_sync_exit(v5);
}

- (void)releaseResources
{
  NSObject *v4;
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (kAVHCScope)
  {
    v4 = *(id *)kAVHCScope;
    if (!v4)
      goto LABEL_8;
  }
  else
  {
    v4 = MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v9 = 136315650;
    v10 = "AVHapticClient.mm";
    v11 = 1024;
    v12 = 1124;
    v13 = 2080;
    v14 = "-[AVHapticClient releaseResources]";
    _os_log_impl(&dword_1B573F000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: releasing resources", (uint8_t *)&v9, 0x1Cu);
  }

LABEL_8:
  -[AVHapticClient destroySharedMemory](self, "destroySharedMemory");
  -[AVHapticClient getAsyncDelegateForMethod:errorHandler:](self, "getAsyncDelegateForMethod:errorHandler:", a2, &__block_literal_global_57);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "releaseClientResources");
  if (kAVHCScope)
  {
    v7 = *(id *)kAVHCScope;
    if (!v7)
      goto LABEL_15;
  }
  else
  {
    v7 = MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v9 = 136315650;
    v10 = "AVHapticClient.mm";
    v11 = 1024;
    v12 = 1129;
    v13 = 2080;
    v14 = "-[AVHapticClient releaseResources]";
    _os_log_impl(&dword_1B573F000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: done releasing", (uint8_t *)&v9, 0x1Cu);
  }

LABEL_15:
}

void __51__AVHapticClient_setupConnectionWithOptions_error___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleServerConnectionInterruption");

}

void __51__AVHapticClient_setupConnectionWithOptions_error___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleServerConnectionInvalidation");

}

void __51__AVHapticClient_setupConnectionWithOptions_error___block_invoke_130(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __51__AVHapticClient_setupConnectionWithOptions_error___block_invoke_2_131(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  id v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!a2)
  {
    if (kAVHCScope)
    {
      v4 = *(id *)kAVHCScope;
      if (!v4)
        goto LABEL_9;
    }
    else
    {
      v4 = MEMORY[0x1E0C81028];
      v5 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315650;
      v7 = "AVHapticClient.mm";
      v8 = 1024;
      v9 = 1191;
      v10 = 2080;
      v11 = "-[AVHapticClient setupConnectionWithOptions:error:]_block_invoke_2";
      _os_log_impl(&dword_1B573F000, v4, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Failed setting options / retrieving client ID from server", (uint8_t *)&v6, 0x1Cu);
    }

  }
LABEL_9:
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __57__AVHapticClient_getAsyncDelegateForMethod_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  id WeakRetained;
  int v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    if (kAVHCScope)
    {
      v4 = *(id *)kAVHCScope;
      if (!v4)
        goto LABEL_9;
    }
    else
    {
      v4 = (id)MEMORY[0x1E0C81028];
      v5 = MEMORY[0x1E0C81028];
    }
    v6 = v4;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v7 = (id)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
      v9 = objc_msgSend(WeakRetained, "clientID");
      objc_msgSend(v3, "localizedDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 136316418;
      v12 = "AVHapticClient.mm";
      v13 = 1024;
      v14 = 1232;
      v15 = 2080;
      v16 = "-[AVHapticClient getAsyncDelegateForMethod:errorHandler:]_block_invoke";
      v17 = 2112;
      v18 = v7;
      v19 = 1024;
      v20 = v9;
      v21 = 2112;
      v22 = v10;
      _os_log_impl(&dword_1B573F000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Async XPC call for '%@' (client ID 0x%x) failed: %@", (uint8_t *)&v11, 0x36u);

    }
  }
LABEL_9:
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __56__AVHapticClient_getSyncDelegateForMethod_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  id WeakRetained;
  int v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    if (kAVHCScope)
    {
      v4 = *(id *)kAVHCScope;
      if (!v4)
        goto LABEL_9;
    }
    else
    {
      v4 = (id)MEMORY[0x1E0C81028];
      v5 = MEMORY[0x1E0C81028];
    }
    v6 = v4;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v7 = (id)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
      v9 = objc_msgSend(WeakRetained, "clientID");
      objc_msgSend(v3, "localizedDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 136316418;
      v12 = "AVHapticClient.mm";
      v13 = 1024;
      v14 = 1243;
      v15 = 2080;
      v16 = "-[AVHapticClient getSyncDelegateForMethod:errorHandler:]_block_invoke";
      v17 = 2112;
      v18 = v7;
      v19 = 1024;
      v20 = v9;
      v21 = 2112;
      v22 = v10;
      _os_log_impl(&dword_1B573F000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Sync XPC call for '%@' (client ID 0x%x) failed: %@", (uint8_t *)&v11, 0x36u);

    }
  }
LABEL_9:
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)disconnect
{
  NSObject *v3;
  id v4;
  NSObject *v5;
  id v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!-[AVHapticClient connected](self, "connected"))
    return;
  -[AVHapticClient setConnected:](self, "setConnected:", 0);
  if (!kAVHCScope)
  {
    v3 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
    goto LABEL_6;
  }
  v3 = *(id *)kAVHCScope;
  if (v3)
  {
LABEL_6:
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v7 = 136315650;
      v8 = "AVHapticClient.mm";
      v9 = 1024;
      v10 = 1254;
      v11 = 2080;
      v12 = "-[AVHapticClient disconnect]";
      _os_log_impl(&dword_1B573F000, v3, OS_LOG_TYPE_INFO, "%25s:%-5d %s: [xpc] Invalidating...", (uint8_t *)&v7, 0x1Cu);
    }

  }
  objc_msgSend(*((id *)self + 1), "invalidate");
  if (kAVHCScope)
  {
    v5 = *(id *)kAVHCScope;
    if (!v5)
      return;
  }
  else
  {
    v5 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 136315650;
    v8 = "AVHapticClient.mm";
    v9 = 1024;
    v10 = 1256;
    v11 = 2080;
    v12 = "-[AVHapticClient disconnect]";
    _os_log_impl(&dword_1B573F000, v5, OS_LOG_TYPE_INFO, "%25s:%-5d %s: [xpc] done disconnecting", (uint8_t *)&v7, 0x1Cu);
  }

}

void __42__AVHapticClient_setPlayerBehavior_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)clearAssignedChannels
{
  void *v2;
  _QWORD v3[5];
  _QWORD v4[5];
  id v5;

  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x3032000000;
  v4[3] = __Block_byref_object_copy__1;
  v4[4] = __Block_byref_object_dispose__1;
  v5 = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __39__AVHapticClient_clearAssignedChannels__block_invoke;
  v3[3] = &unk_1E6960358;
  v3[4] = v4;
  -[AVHapticClient getSyncDelegateForMethod:errorHandler:](self, "getSyncDelegateForMethod:errorHandler:", a2, v3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "releaseChannels");

  _Block_object_dispose(v4, 8);
}

void __39__AVHapticClient_clearAssignedChannels__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __48__AVHapticClient_requestAssignedChannels_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __48__AVHapticClient_removeAssignedChannelID_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)handleServerConnectionInterruption
{
  int v3;
  NSObject *v4;
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  AVHapticClient *v10;
  void *v11;
  BOOL v12;
  NSObject *v13;
  id v14;
  void (**v15)(_QWORD, _QWORD);
  uint64_t v16;
  void *v17;
  NSObject *v18;
  id v19;
  _QWORD block[4];
  id v21;
  id v22;
  id location;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = -[AVHapticClient clientID](self, "clientID");
  if (kAVHCScope)
  {
    v4 = *(id *)kAVHCScope;
    if (!v4)
      goto LABEL_8;
  }
  else
  {
    v4 = MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315906;
    v25 = "AVHapticClient.mm";
    v26 = 1024;
    v27 = 1335;
    v28 = 2080;
    v29 = "-[AVHapticClient handleServerConnectionInterruption]";
    v30 = 1024;
    v31 = v3;
    _os_log_impl(&dword_1B573F000, v4, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: [xpc] Entered (due to connection interruption) for client ID 0x%x", buf, 0x22u);
  }

LABEL_8:
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4811, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = *((_QWORD *)self + 6);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v6);
  -[AVHapticClient callSequenceFinishedHandlersWithError:](self, "callSequenceFinishedHandlersWithError:", v6);
  objc_initWeak(&location, self);
  v8 = *((_QWORD *)self + 18);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__AVHapticClient_handleServerConnectionInterruption__block_invoke;
  block[3] = &unk_1E69604D0;
  objc_copyWeak(&v22, &location);
  v9 = v6;
  v21 = v9;
  dispatch_async(v8, block);
  v10 = self;
  objc_sync_enter(v10);
  if (-[AVHapticClient running](v10, "running"))
  {
    -[AVHapticClient asyncStopCallback](v10, "asyncStopCallback");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11 == 0;

    if (!v12)
    {
      if (kAVHCScope)
      {
        v13 = *(id *)kAVHCScope;
        if (!v13)
        {
LABEL_19:
          -[AVHapticClient asyncStopCallback](v10, "asyncStopCallback");
          v15 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          if (-[AVHapticClient disconnecting](v10, "disconnecting"))
            v16 = 3;
          else
            v16 = -1;
          v15[2](v15, v16);

          v17 = (void *)*((_QWORD *)v10 + 23);
          *((_QWORD *)v10 + 23) = 0;

          goto LABEL_23;
        }
      }
      else
      {
        v13 = MEMORY[0x1E0C81028];
        v14 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v25 = "AVHapticClient.mm";
        v26 = 1024;
        v27 = 1354;
        v28 = 2080;
        v29 = "-[AVHapticClient handleServerConnectionInterruption]";
        _os_log_impl(&dword_1B573F000, v13, OS_LOG_TYPE_INFO, "%25s:%-5d %s: We were running, so call async stopped callback", buf, 0x1Cu);
      }

      goto LABEL_19;
    }
  }
LABEL_23:
  objc_sync_exit(v10);

  *((_QWORD *)v10 + 21) = -1;
  *((_BYTE *)v10 + 156) = 0;
  -[AVHapticClient setState:](v10, "setState:", 0);
  if (kAVHCScope)
  {
    v18 = *(id *)kAVHCScope;
    if (!v18)
      goto LABEL_30;
  }
  else
  {
    v18 = MEMORY[0x1E0C81028];
    v19 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v25 = "AVHapticClient.mm";
    v26 = 1024;
    v27 = 1362;
    v28 = 2080;
    v29 = "-[AVHapticClient handleServerConnectionInterruption]";
    v30 = 1024;
    v31 = v3;
    _os_log_impl(&dword_1B573F000, v18, OS_LOG_TYPE_INFO, "%25s:%-5d %s: [xpc] done handling crash for client ID 0x%x", buf, 0x22u);
  }

LABEL_30:
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

void __52__AVHapticClient_handleServerConnectionInterruption__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  id v5;
  void (**v6)(_QWORD, _QWORD);
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "completionCallback");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (kAVHCScope)
    {
      v4 = *(id *)kAVHCScope;
      if (!v4)
      {
LABEL_9:
        objc_msgSend(WeakRetained, "completionCallback");
        v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v6[2](v6, *(_QWORD *)(a1 + 32));

        objc_msgSend(WeakRetained, "setCompletionCallback:", 0);
        goto LABEL_10;
      }
    }
    else
    {
      v4 = MEMORY[0x1E0C81028];
      v5 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v7 = 136315650;
      v8 = "AVHapticClient.mm";
      v9 = 1024;
      v10 = 1346;
      v11 = 2080;
      v12 = "-[AVHapticClient handleServerConnectionInterruption]_block_invoke";
      _os_log_impl(&dword_1B573F000, v4, OS_LOG_TYPE_INFO, "%25s:%-5d %s: We were waiting for a completion callback, so call it now", (uint8_t *)&v7, 0x1Cu);
    }

    goto LABEL_9;
  }
LABEL_10:

}

- (void)handleServerConnectionInvalidation
{
  int v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  id v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = -[AVHapticClient clientID](self, "clientID");
  if (-[AVHapticClient connected](self, "connected"))
  {
    if (kAVHCScope)
    {
      v4 = *(id *)kAVHCScope;
      if (!v4)
      {
LABEL_12:
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4811, 0);
        v5 = (id)objc_claimAutoreleasedReturnValue();
        v7 = *((_QWORD *)self + 6);
        if (v7)
          (*(void (**)(uint64_t, NSObject *))(v7 + 16))(v7, v5);
LABEL_17:

        goto LABEL_18;
      }
    }
    else
    {
      v4 = MEMORY[0x1E0C81028];
      v6 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315906;
      v12 = "AVHapticClient.mm";
      v13 = 1024;
      v14 = 1369;
      v15 = 2080;
      v16 = "-[AVHapticClient handleServerConnectionInvalidation]";
      v17 = 1024;
      v18 = v3;
      _os_log_impl(&dword_1B573F000, v4, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: [xpc] Entered (due to connection invalidation) for client ID 0x%x", (uint8_t *)&v11, 0x22u);
    }

    goto LABEL_12;
  }
  if (!kAVHCScope)
  {
    v5 = MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
LABEL_15:
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v11 = 136315906;
      v12 = "AVHapticClient.mm";
      v13 = 1024;
      v14 = 1377;
      v15 = 2080;
      v16 = "-[AVHapticClient handleServerConnectionInvalidation]";
      v17 = 1024;
      v18 = v3;
      _os_log_impl(&dword_1B573F000, v5, OS_LOG_TYPE_INFO, "%25s:%-5d %s: [xpc] Entered (due to client disconnect) for client ID 0x%x", (uint8_t *)&v11, 0x22u);
    }
    goto LABEL_17;
  }
  v5 = *(id *)kAVHCScope;
  if (v5)
    goto LABEL_15;
LABEL_18:
  if (kAVHCScope)
  {
    v9 = *(id *)kAVHCScope;
    if (!v9)
      return;
  }
  else
  {
    v9 = MEMORY[0x1E0C81028];
    v10 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v11 = 136315906;
    v12 = "AVHapticClient.mm";
    v13 = 1024;
    v14 = 1379;
    v15 = 2080;
    v16 = "-[AVHapticClient handleServerConnectionInvalidation]";
    v17 = 1024;
    v18 = v3;
    _os_log_impl(&dword_1B573F000, v9, OS_LOG_TYPE_INFO, "%25s:%-5d %s: [xpc] done handling disconnect for client ID 0x%x", (uint8_t *)&v11, 0x22u);
  }

}

- (unsigned)calculateHapticCommandParamCurveMemorySize:(unsigned int)a3
{
  unsigned int v3;
  unsigned int v4;
  int v5;
  NSObject *v6;
  NSObject *v7;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a3 < 0x11)
  {
    v5 = 1;
  }
  else
  {
    v3 = (a3 - 16) / 0xF;
    if (a3 - 16 == 15 * v3)
      v4 = (a3 - 16) / 0xF;
    else
      v4 = v3 + 1;
    v5 = v4 + 1;
  }
  if (kAVHCScope)
  {
    if ((*(_BYTE *)(kAVHCScope + 8) & 1) != 0)
    {
      v6 = *(id *)kAVHCScope;
      if (v6)
      {
        v7 = v6;
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          v9 = 136316674;
          v10 = "AVHapticClient.mm";
          v11 = 1024;
          v12 = 1405;
          v13 = 2080;
          v14 = "-[AVHapticClient calculateHapticCommandParamCurveMemorySize:]";
          v15 = 1024;
          v16 = v5;
          v17 = 1024;
          v18 = v5 + 2;
          v19 = 1024;
          v20 = 168;
          v21 = 1024;
          v22 = 168 * (v5 + 2);
          _os_log_impl(&dword_1B573F000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: %u sub curves, %u HapticCommands in total, sizeof(HapticCommand):%u, total size:%u bytes ", (uint8_t *)&v9, 0x34u);
        }

      }
    }
  }
  return 168 * (v5 + 2);
}

- (void)destroySharedMemory
{
  AVHapticClient *obj;

  obj = self;
  objc_sync_enter(obj);
  destroyHapticCommandWriter();
  *((_QWORD *)obj + 2) = 0;
  objc_sync_exit(obj);

}

- (void)sequenceFinished:(unint64_t)a3 error:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  _QWORD *v10;
  id *v11;
  unint64_t v12;
  BOOL v13;
  _QWORD *v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  id v22;
  NSObject *v23;
  int v24;
  int v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  _WORD v32[9];

  *(_QWORD *)&v32[5] = *MEMORY[0x1E0C80C00];
  v6 = a4;
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
    v25 = 136316162;
    v26 = "AVHapticClient.mm";
    v28 = 1422;
    v29 = 2080;
    v27 = 1024;
    v30 = "-[AVHapticClient sequenceFinished:error:]";
    v31 = 1024;
    *(_DWORD *)v32 = -[AVHapticClient clientID](self, "clientID");
    v32[2] = 1024;
    *(_DWORD *)&v32[3] = a3;
    _os_log_impl(&dword_1B573F000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Client-side sequence finish callback for client 0x%x, seq %u", (uint8_t *)&v25, 0x28u);
  }

LABEL_8:
  std::mutex::lock((std::mutex *)((char *)self + 56));
  v10 = (_QWORD *)*((_QWORD *)self + 16);
  if (!v10)
    goto LABEL_19;
  v11 = (id *)((char *)self + 128);
  do
  {
    v12 = v10[4];
    v13 = v12 >= a3;
    if (v12 >= a3)
      v14 = v10;
    else
      v14 = v10 + 1;
    if (v13)
      v11 = (id *)v10;
    v10 = (_QWORD *)*v14;
  }
  while (*v14);
  if (v11 != (id *)((char *)self + 128) && (unint64_t)v11[4] <= a3)
  {
    objc_msgSend(v11[5], "handler");
    v16 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11[5], "setRunning:", 0);
    if (objc_msgSend(v11[5], "detached"))
    {
      if (kAVHCScope)
      {
        if ((*(_BYTE *)(kAVHCScope + 8) & 1) != 0)
        {
          v17 = *(id *)kAVHCScope;
          if (v17)
          {
            v18 = v17;
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              v25 = 136315650;
              v26 = "AVHapticClient.mm";
              v27 = 1024;
              v28 = 1431;
              v29 = 2080;
              v30 = "-[AVHapticClient sequenceFinished:error:]";
              _os_log_impl(&dword_1B573F000, v18, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Deleting finished handler block for detached sequence", (uint8_t *)&v25, 0x1Cu);
            }

          }
        }
      }
      std::__tree<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>>>::erase((uint64_t **)self + 15, (uint64_t)v11);
    }
    std::mutex::unlock((std::mutex *)((char *)self + 56));
    if (v16)
    {
      if (kAVHCScope)
      {
        if ((*(_BYTE *)(kAVHCScope + 8) & 1) != 0)
        {
          v19 = *(id *)kAVHCScope;
          if (v19)
          {
            v20 = v19;
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              v21 = (void *)MEMORY[0x1B5E4F2B4](v16);
              v25 = 136315906;
              v26 = "AVHapticClient.mm";
              v27 = 1024;
              v28 = 1437;
              v29 = 2080;
              v30 = "-[AVHapticClient sequenceFinished:error:]";
              v31 = 2048;
              *(_QWORD *)v32 = v21;
              _os_log_impl(&dword_1B573F000, v20, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Calling cached sequence finished handler block %p", (uint8_t *)&v25, 0x26u);

            }
          }
        }
      }
      (*(void (**)(uint64_t, id))(v16 + 16))(v16, v6);
      if (kAVHCScope)
      {
        if ((*(_BYTE *)(kAVHCScope + 8) & 1) != 0)
        {
          v22 = *(id *)kAVHCScope;
          if (v22)
          {
            v23 = v22;
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              v24 = -[AVHapticClient clientID](self, "clientID");
              v25 = 136315906;
              v26 = "AVHapticClient.mm";
              v27 = 1024;
              v28 = 1439;
              v29 = 2080;
              v30 = "-[AVHapticClient sequenceFinished:error:]";
              v31 = 1024;
              *(_DWORD *)v32 = v24;
              _os_log_impl(&dword_1B573F000, v23, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Client-side sequence finish callback done for client 0x%x", (uint8_t *)&v25, 0x22u);
            }

          }
        }
      }
      goto LABEL_46;
    }
  }
  else
  {
LABEL_19:
    std::mutex::unlock((std::mutex *)((char *)self + 56));
  }
  if (kAVHCScope)
  {
    if ((*(_BYTE *)(kAVHCScope + 8) & 1) != 0)
    {
      v15 = *(id *)kAVHCScope;
      if (v15)
      {
        v16 = (uint64_t)v15;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          v25 = 136315906;
          v26 = "AVHapticClient.mm";
          v27 = 1024;
          v28 = 1442;
          v29 = 2080;
          v30 = "-[AVHapticClient sequenceFinished:error:]";
          v31 = 1024;
          *(_DWORD *)v32 = a3;
          _os_log_impl(&dword_1B573F000, (os_log_t)v16, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: No cached sequence finished handler block for seq %u", (uint8_t *)&v25, 0x22u);
        }
LABEL_46:

      }
    }
  }

}

- (void)clientStoppedForReason:(unint64_t)a3 error:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  AVHapticClient *v10;
  void *v11;
  BOOL v12;
  NSObject *v13;
  id v14;
  void (**v15)(_QWORD, _QWORD);
  void *v16;
  id v17;
  NSObject *v18;
  int v19;
  int v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a4;
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
    v20 = 136316162;
    v21 = "AVHapticClient.mm";
    v23 = 1475;
    v24 = 2080;
    v22 = 1024;
    v25 = "-[AVHapticClient clientStoppedForReason:error:]";
    v26 = 1024;
    v27 = -[AVHapticClient clientID](self, "clientID");
    v28 = 1024;
    v29 = a3;
    _os_log_impl(&dword_1B573F000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Client-side (async) stop callback for client 0x%x, reason %d", (uint8_t *)&v20, 0x28u);
  }

LABEL_8:
  v10 = self;
  objc_sync_enter(v10);
  -[AVHapticClient asyncStopCallback](v10, "asyncStopCallback");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11 == 0;

  if (!v12)
  {
    if (!-[AVHapticClient running](v10, "running"))
    {
      if (kAVHCScope)
      {
        v13 = *(id *)kAVHCScope;
        if (!v13)
          goto LABEL_17;
      }
      else
      {
        v13 = MEMORY[0x1E0C81028];
        v14 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v20 = 136315650;
        v21 = "AVHapticClient.mm";
        v22 = 1024;
        v23 = 1478;
        v24 = 2080;
        v25 = "-[AVHapticClient clientStoppedForReason:error:]";
        _os_log_impl(&dword_1B573F000, v13, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Client thinks it is not running.  Did we just get a call to stop?", (uint8_t *)&v20, 0x1Cu);
      }

    }
LABEL_17:
    -[AVHapticClient setState:](v10, "setState:", 0);
    -[AVHapticClient asyncStopCallback](v10, "asyncStopCallback");
    v15 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v15[2](v15, a3);

    v16 = (void *)*((_QWORD *)v10 + 23);
    *((_QWORD *)v10 + 23) = 0;

  }
  objc_sync_exit(v10);

  if (kAVHCScope)
  {
    if ((*(_BYTE *)(kAVHCScope + 8) & 1) != 0)
    {
      v17 = *(id *)kAVHCScope;
      if (v17)
      {
        v18 = v17;
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          v19 = -[AVHapticClient clientID](v10, "clientID");
          v20 = 136315906;
          v21 = "AVHapticClient.mm";
          v22 = 1024;
          v23 = 1484;
          v24 = 2080;
          v25 = "-[AVHapticClient clientStoppedForReason:error:]";
          v26 = 1024;
          v27 = v19;
          _os_log_impl(&dword_1B573F000, v18, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Client-side (async) stop callback done for client 0x%x", (uint8_t *)&v20, 0x22u);
        }

      }
    }
  }

}

- (void)clientDisconnectingForReason:(unint64_t)a3 error:(id)a4
{
  int v4;
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v4 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
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
    v10 = 136316162;
    v11 = "AVHapticClient.mm";
    v13 = 1489;
    v14 = 2080;
    v12 = 1024;
    v15 = "-[AVHapticClient clientDisconnectingForReason:error:]";
    v16 = 1024;
    v17 = -[AVHapticClient clientID](self, "clientID");
    v18 = 1024;
    v19 = v4;
    _os_log_impl(&dword_1B573F000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Client-side call for client 0x%x with disconnect reason %d", (uint8_t *)&v10, 0x28u);
  }

LABEL_8:
  *((_BYTE *)self + 156) = 1;

}

- (BOOL)prewarmed
{
  return *((_BYTE *)self + 157) & 1;
}

- (BOOL)connected
{
  return *((_BYTE *)self + 158) & 1;
}

- (id)connectionCallback
{
  return objc_getProperty(self, a2, 48, 1);
}

- (BOOL)disconnecting
{
  return *((_BYTE *)self + 156) & 1;
}

- (int)serverProcessID
{
  return *((_DWORD *)self + 40);
}

- (id)asyncStopCallback
{
  return objc_getProperty(self, a2, 184, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self + 23, 0);
  objc_storeStrong((id *)self + 22, 0);
  objc_storeStrong((id *)self + 18, 0);
  std::__tree<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>>>::destroy((uint64_t)self + 120, *((_QWORD **)self + 16));
  std::mutex::~mutex((std::mutex *)((char *)self + 56));
  objc_storeStrong((id *)self + 6, 0);
  objc_storeStrong((id *)self + 5, 0);
  objc_storeStrong((id *)self + 1, 0);
}

void __36__AVHapticClient_allocateResources___block_invoke_2_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    OUTLINED_FUNCTION_0(&dword_1B573F000, MEMORY[0x1E0C81028], v0, "%25s:%-5d ASSERTION FAILURE [(sharedBufferSize > 0) != 0 is false]: ", v1, v2, v3, v4, 2u);
  __break(1u);
}

- (void)scheduleParameterCurve:(os_log_t)log curve:atTime:channel:error:.cold.1(int a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136315906;
  *(_QWORD *)(buf + 4) = "AVHapticClient.mm";
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = 781;
  *((_WORD *)buf + 9) = 2080;
  *(_QWORD *)(buf + 20) = "-[AVHapticClient scheduleParameterCurve:curve:atTime:channel:error:]";
  *((_WORD *)buf + 14) = 1024;
  *(_DWORD *)(buf + 30) = a1;
  _os_log_impl(&dword_1B573F000, log, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Client 0x%x: doScheduleParamCurve failed!", buf, 0x22u);
}

- (void)scheduleParameterCurve:curve:atTime:channel:error:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    OUTLINED_FUNCTION_0(&dword_1B573F000, MEMORY[0x1E0C81028], v0, "%25s:%-5d ASSERTION FAILURE [(result) != 0 is false]: ", v1, v2, v3, v4, 2u);
  __break(1u);
}

@end
