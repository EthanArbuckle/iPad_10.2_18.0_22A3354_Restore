@implementation AWUnitTestSampler

- (AWUnitTestSampler)init
{
  AWUnitTestSampler *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AWUnitTestSampler;
  v2 = -[AWUnitTestSampler init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.AttentionAwareness.AWUnitTestSampler", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (id)_connect
{
  AWUnitTestSampler *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __29__AWUnitTestSampler__connect__block_invoke;
  v6[3] = &unk_1E5F8E538;
  v6[4] = self;
  v2 = self;
  v3 = (void *)MEMORY[0x1B5DF9110](v6);
  +[AWServiceManager invokeWithService:](AWServiceManager, "invokeWithService:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)connect
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  return -[AWUnitTestSampler _connect](self, "_connect");
}

- (id)invokeSampler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1552;
  v16 = __Block_byref_object_dispose__1553;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__AWUnitTestSampler_invokeSampler___block_invoke;
  block[3] = &unk_1E5F8E560;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)getStatsWithBlock:(id)a3
{
  _QWORD *v4;
  void *v5;
  NSObject *v6;
  void (*v7)(_QWORD *, _BYTE *);
  unint64_t v8;
  double v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE buf[24];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3810000000;
  v14 = &unk_1AF5C0E93;
  v15 = 0;
  v16 = 0;
  v17 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __39__AWUnitTestSampler_getStatsWithBlock___block_invoke;
  v10[3] = &unk_1E5F8E5B0;
  v10[4] = &v11;
  -[AWUnitTestSampler invokeSampler:](self, "invokeSampler:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && currentLogLevel >= 3)
  {
    _AALog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = absTimeNS();
      if (v8 == -1)
        v9 = INFINITY;
      else
        v9 = (double)v8 / 1000000000.0;
      *(_DWORD *)buf = 134218242;
      *(double *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v5;
      _os_log_error_impl(&dword_1AF589000, v6, OS_LOG_TYPE_ERROR, "%13.5f: failed to get unit test sampler stats: %@", buf, 0x16u);
    }

  }
  v7 = (void (*)(_QWORD *, _BYTE *))v4[2];
  *(_OWORD *)buf = *((_OWORD *)v12 + 2);
  *(_QWORD *)&buf[16] = v12[6];
  v7(v4, buf);

  _Block_object_dispose(&v11, 8);
}

- (void)resetStats
{
  void *v2;
  BOOL v3;
  NSObject *v4;
  unint64_t v5;
  double v6;
  int v7;
  double v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[AWUnitTestSampler invokeSampler:](self, "invokeSampler:", &__block_literal_global_1569);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = currentLogLevel < 3;
  else
    v3 = 1;
  if (!v3)
  {
    _AALog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = absTimeNS();
      if (v5 == -1)
        v6 = INFINITY;
      else
        v6 = (double)v5 / 1000000000.0;
      v7 = 134218242;
      v8 = v6;
      v9 = 2112;
      v10 = v2;
      _os_log_error_impl(&dword_1AF589000, v4, OS_LOG_TYPE_ERROR, "%13.5f: failed to reset unit test sampler stats: %@", (uint8_t *)&v7, 0x16u);
    }

  }
}

- (void)setDisplayState:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  NSObject *v5;
  unint64_t v6;
  double v7;
  const char *v8;
  _QWORD v9[4];
  BOOL v10;
  uint8_t buf[4];
  double v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __37__AWUnitTestSampler_setDisplayState___block_invoke;
  v9[3] = &__block_descriptor_33_e38___NSError_16__0___AWUnitTestSampler__8l;
  v10 = a3;
  -[AWUnitTestSampler invokeSampler:](self, "invokeSampler:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && currentLogLevel >= 3)
  {
    _AALog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = absTimeNS();
      if (v6 == -1)
        v7 = INFINITY;
      else
        v7 = (double)v6 / 1000000000.0;
      v8 = "off";
      *(_DWORD *)buf = 134218498;
      v12 = v7;
      if (v3)
        v8 = "on";
      v13 = 2080;
      v14 = v8;
      v15 = 2112;
      v16 = v4;
      _os_log_error_impl(&dword_1AF589000, v5, OS_LOG_TYPE_ERROR, "%13.5f: failed to set display state %s: %@", buf, 0x20u);
    }

  }
}

- (void)setDisplayState:(BOOL)a3 reply:(id)a4
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("not implemented"));
}

- (void)setDisplayCallback:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("not implemented"));
}

- (void)setSampleState:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  NSObject *v5;
  unint64_t v6;
  double v7;
  const char *v8;
  _QWORD v9[4];
  BOOL v10;
  uint8_t buf[4];
  double v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __36__AWUnitTestSampler_setSampleState___block_invoke;
  v9[3] = &__block_descriptor_33_e38___NSError_16__0___AWUnitTestSampler__8l;
  v10 = a3;
  -[AWUnitTestSampler invokeSampler:](self, "invokeSampler:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && currentLogLevel >= 3)
  {
    _AALog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = absTimeNS();
      if (v6 == -1)
        v7 = INFINITY;
      else
        v7 = (double)v6 / 1000000000.0;
      v8 = "absent";
      *(_DWORD *)buf = 134218498;
      v12 = v7;
      if (v3)
        v8 = "present";
      v13 = 2080;
      v14 = v8;
      v15 = 2112;
      v16 = v4;
      _os_log_error_impl(&dword_1AF589000, v5, OS_LOG_TYPE_ERROR, "%13.5f: failed to set sample state %s: %@", buf, 0x20u);
    }

  }
}

- (void)setSampleState:(BOOL)a3 reply:(id)a4
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("not implemented"));
}

- (void)setSampleState:(BOOL)a3 deliverEvent:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  NSObject *v6;
  unint64_t v7;
  double v8;
  const char *v9;
  _QWORD v10[4];
  BOOL v11;
  BOOL v12;
  uint8_t buf[4];
  double v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v4 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__AWUnitTestSampler_setSampleState_deliverEvent___block_invoke;
  v10[3] = &__block_descriptor_34_e38___NSError_16__0___AWUnitTestSampler__8l;
  v11 = a3;
  v12 = a4;
  -[AWUnitTestSampler invokeSampler:](self, "invokeSampler:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && currentLogLevel >= 3)
  {
    _AALog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = absTimeNS();
      if (v7 == -1)
        v8 = INFINITY;
      else
        v8 = (double)v7 / 1000000000.0;
      v9 = "absent";
      *(_DWORD *)buf = 134218498;
      v14 = v8;
      if (v4)
        v9 = "present";
      v15 = 2080;
      v16 = v9;
      v17 = 2112;
      v18 = v5;
      _os_log_error_impl(&dword_1AF589000, v6, OS_LOG_TYPE_ERROR, "%13.5f: failed to set sample state %s: %@", buf, 0x20u);
    }

  }
}

- (void)setSampleState:(BOOL)a3 deliverEvent:(BOOL)a4 reply:(id)a5
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("not implemented"), a5);
}

- (void)setSmartCoverClosed:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  NSObject *v5;
  unint64_t v6;
  double v7;
  const char *v8;
  _QWORD v9[4];
  BOOL v10;
  uint8_t buf[4];
  double v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41__AWUnitTestSampler_setSmartCoverClosed___block_invoke;
  v9[3] = &__block_descriptor_33_e38___NSError_16__0___AWUnitTestSampler__8l;
  v10 = a3;
  -[AWUnitTestSampler invokeSampler:](self, "invokeSampler:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && currentLogLevel >= 3)
  {
    _AALog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = absTimeNS();
      if (v6 == -1)
        v7 = INFINITY;
      else
        v7 = (double)v6 / 1000000000.0;
      v8 = "open";
      *(_DWORD *)buf = 134218498;
      v12 = v7;
      if (v3)
        v8 = "closed";
      v13 = 2080;
      v14 = v8;
      v15 = 2112;
      v16 = v4;
      _os_log_error_impl(&dword_1AF589000, v5, OS_LOG_TYPE_ERROR, "%13.5f: failed to set smart cover state %s: %@", buf, 0x20u);
    }

  }
}

- (void)setSmartCoverClosed:(BOOL)a3 reply:(id)a4
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("not implemented"));
}

- (void)setSmartCoverCallback:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("not implemented"));
}

- (void)setCarPlayConnected:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  NSObject *v5;
  unint64_t v6;
  double v7;
  const char *v8;
  _QWORD v9[4];
  BOOL v10;
  uint8_t buf[4];
  double v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41__AWUnitTestSampler_setCarPlayConnected___block_invoke;
  v9[3] = &__block_descriptor_33_e38___NSError_16__0___AWUnitTestSampler__8l;
  v10 = a3;
  -[AWUnitTestSampler invokeSampler:](self, "invokeSampler:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && currentLogLevel >= 3)
  {
    _AALog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = absTimeNS();
      if (v6 == -1)
        v7 = INFINITY;
      else
        v7 = (double)v6 / 1000000000.0;
      v8 = "disconnected";
      *(_DWORD *)buf = 134218498;
      v12 = v7;
      if (v3)
        v8 = "connected";
      v13 = 2080;
      v14 = v8;
      v15 = 2112;
      v16 = v4;
      _os_log_error_impl(&dword_1AF589000, v5, OS_LOG_TYPE_ERROR, "%13.5f: failed to set CarPlay connected %s: %@", buf, 0x20u);
    }

  }
}

- (void)setCarPlayConnected:(BOOL)a3 reply:(id)a4
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("not implemented"));
}

- (void)setPearlErrorState:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  NSObject *v5;
  unint64_t v6;
  double v7;
  const char *v8;
  _QWORD v9[4];
  BOOL v10;
  uint8_t buf[4];
  double v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __40__AWUnitTestSampler_setPearlErrorState___block_invoke;
  v9[3] = &__block_descriptor_33_e38___NSError_16__0___AWUnitTestSampler__8l;
  v10 = a3;
  -[AWUnitTestSampler invokeSampler:](self, "invokeSampler:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && currentLogLevel >= 3)
  {
    _AALog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = absTimeNS();
      if (v6 == -1)
        v7 = INFINITY;
      else
        v7 = (double)v6 / 1000000000.0;
      v8 = "clear";
      *(_DWORD *)buf = 134218498;
      v12 = v7;
      if (v3)
        v8 = "set";
      v13 = 2080;
      v14 = v8;
      v15 = 2112;
      v16 = v4;
      _os_log_error_impl(&dword_1AF589000, v5, OS_LOG_TYPE_ERROR, "%13.5f: failed to %s error: %@", buf, 0x20u);
    }

  }
}

- (void)setCarplayStateChangedCallback:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("not implemented"));
}

- (void)setPearlErrorState:(BOOL)a3 reply:(id)a4
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("not implemented"));
}

- (id)AVFoundationSession
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("not implemented"));
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_remoteSamplerProxy, 0);
}

id __40__AWUnitTestSampler_setPearlErrorState___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v3 = a2;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__1552;
  v12 = __Block_byref_object_dispose__1553;
  v13 = 0;
  v4 = *(unsigned __int8 *)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__AWUnitTestSampler_setPearlErrorState___block_invoke_2;
  v7[3] = &unk_1E5F8E8A0;
  v7[4] = &v8;
  objc_msgSend(v3, "setPearlErrorState:reply:", v4, v7);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __40__AWUnitTestSampler_setPearlErrorState___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;

  if (a2)
    __assert_rtn("-[AWUnitTestSampler setPearlErrorState:]_block_invoke_2", "PearlUnitTestSupport.m", 286, "!error");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

id __41__AWUnitTestSampler_setCarPlayConnected___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v3 = a2;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__1552;
  v12 = __Block_byref_object_dispose__1553;
  v13 = 0;
  v4 = *(unsigned __int8 *)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__AWUnitTestSampler_setCarPlayConnected___block_invoke_2;
  v7[3] = &unk_1E5F8E8A0;
  v7[4] = &v8;
  objc_msgSend(v3, "setCarPlayConnected:reply:", v4, v7);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __41__AWUnitTestSampler_setCarPlayConnected___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;

  if (a2)
    __assert_rtn("-[AWUnitTestSampler setCarPlayConnected:]_block_invoke_2", "PearlUnitTestSupport.m", 262, "!error");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

id __41__AWUnitTestSampler_setSmartCoverClosed___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v3 = a2;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__1552;
  v12 = __Block_byref_object_dispose__1553;
  v13 = 0;
  v4 = *(unsigned __int8 *)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__AWUnitTestSampler_setSmartCoverClosed___block_invoke_2;
  v7[3] = &unk_1E5F8E8A0;
  v7[4] = &v8;
  objc_msgSend(v3, "setSmartCoverClosed:reply:", v4, v7);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __41__AWUnitTestSampler_setSmartCoverClosed___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;

  if (a2)
    __assert_rtn("-[AWUnitTestSampler setSmartCoverClosed:]_block_invoke_2", "PearlUnitTestSupport.m", 231, "!error");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

id __49__AWUnitTestSampler_setSampleState_deliverEvent___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v3 = a2;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__1552;
  v13 = __Block_byref_object_dispose__1553;
  v14 = 0;
  v4 = *(unsigned __int8 *)(a1 + 32);
  v5 = *(unsigned __int8 *)(a1 + 33);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__AWUnitTestSampler_setSampleState_deliverEvent___block_invoke_2;
  v8[3] = &unk_1E5F8E8A0;
  v8[4] = &v9;
  objc_msgSend(v3, "setSampleState:deliverEvent:reply:", v4, v5, v8);
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __49__AWUnitTestSampler_setSampleState_deliverEvent___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;

  if (a2)
    __assert_rtn("-[AWUnitTestSampler setSampleState:deliverEvent:]_block_invoke_2", "PearlUnitTestSupport.m", 205, "!error");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

id __36__AWUnitTestSampler_setSampleState___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v3 = a2;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__1552;
  v12 = __Block_byref_object_dispose__1553;
  v13 = 0;
  v4 = *(unsigned __int8 *)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__AWUnitTestSampler_setSampleState___block_invoke_2;
  v7[3] = &unk_1E5F8E8A0;
  v7[4] = &v8;
  objc_msgSend(v3, "setSampleState:reply:", v4, v7);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __36__AWUnitTestSampler_setSampleState___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;

  if (a2)
    __assert_rtn("-[AWUnitTestSampler setSampleState:]_block_invoke_2", "PearlUnitTestSupport.m", 178, "!error");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

id __37__AWUnitTestSampler_setDisplayState___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v3 = a2;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__1552;
  v12 = __Block_byref_object_dispose__1553;
  v13 = 0;
  v4 = *(unsigned __int8 *)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__AWUnitTestSampler_setDisplayState___block_invoke_2;
  v7[3] = &unk_1E5F8E8A0;
  v7[4] = &v8;
  objc_msgSend(v3, "setDisplayState:reply:", v4, v7);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __37__AWUnitTestSampler_setDisplayState___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;

  if (a2)
    __assert_rtn("-[AWUnitTestSampler setDisplayState:]_block_invoke_2", "PearlUnitTestSupport.m", 147, "!error");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

uint64_t __31__AWUnitTestSampler_resetStats__block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "resetStats");
  return 0;
}

uint64_t __39__AWUnitTestSampler_getStatsWithBlock___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __39__AWUnitTestSampler_getStatsWithBlock___block_invoke_2;
  v3[3] = &unk_1E5F8E588;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "getStatsWithBlock:", v3);
  return 0;
}

__n128 __39__AWUnitTestSampler_getStatsWithBlock___block_invoke_2(uint64_t a1, __n128 *a2)
{
  __n128 *v2;
  __n128 result;

  v2 = *(__n128 **)(*(_QWORD *)(a1 + 32) + 8);
  result = *a2;
  v2[3].n128_u64[0] = a2[1].n128_u64[0];
  v2[2] = result;
  return result;
}

void __35__AWUnitTestSampler_invokeSampler___block_invoke(uint64_t a1)
{
  __CFString *v1;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  unint64_t v15;
  double v16;
  const __CFString *v17;
  void *v18;
  unint64_t v19;
  double v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id *v26;
  uint64_t v27;
  void *v28;
  _QWORD v29[5];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  const __CFString *v37;
  uint8_t buf[4];
  double v39;
  __int16 v40;
  _QWORD v41[4];

  *(_QWORD *)((char *)&v41[2] + 2) = *MEMORY[0x1E0C80C00];
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__1552;
  v34 = __Block_byref_object_dispose__1553;
  v35 = 0;
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  if (v3)
  {
    v4 = (void *)*MEMORY[0x1E0CB28A8];
    v5 = 1;
    while (1)
    {
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __35__AWUnitTestSampler_invokeSampler___block_invoke_2;
      v29[3] = &unk_1E5F8E8A0;
      v29[4] = &v30;
      objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", v29);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
        goto LABEL_29;
      v10 = (void *)v31[5];
      if (!v10)
        goto LABEL_29;
      if (currentLogLevel >= 3)
      {
        _AALog();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          v19 = absTimeNS();
          if (v19 == -1)
            v20 = INFINITY;
          else
            v20 = (double)v19 / 1000000000.0;
          v21 = v31[5];
          *(_DWORD *)buf = 134218242;
          v39 = v20;
          v40 = 2112;
          v41[0] = v21;
          _os_log_error_impl(&dword_1AF589000, v11, OS_LOG_TYPE_ERROR, "%13.5f: XPC proxy error: %@", buf, 0x16u);
        }

        v10 = (void *)v31[5];
      }
      objc_msgSend(v10, "domain");
      v12 = objc_claimAutoreleasedReturnValue();
      if ((void *)v12 != v4)
      {
        v4 = (void *)v12;
        goto LABEL_28;
      }
      if (objc_msgSend((id)v31[5], "code") != 4099)
        goto LABEL_28;

      if ((v5 & 1) == 0)
        goto LABEL_29;
      objc_msgSend(*(id *)(a1 + 32), "connect");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (currentLogLevel >= 7)
        break;
LABEL_21:

      v18 = (void *)v31[5];
      v31[5] = 0;

      v5 = 0;
      v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
      if (!v3)
        goto LABEL_27;
    }
    _AALog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
LABEL_20:

      goto LABEL_21;
    }
    v15 = absTimeNS();
    if (v15 == -1)
    {
      v16 = INFINITY;
      if (v13)
        goto LABEL_15;
    }
    else
    {
      v16 = (double)v15 / 1000000000.0;
      if (v13)
      {
LABEL_15:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("failed: %@"), v13);
        v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v17 = v1;
        goto LABEL_18;
      }
    }
    v17 = CFSTR("succeeded");
LABEL_18:
    *(_DWORD *)buf = 134218498;
    v39 = v16;
    v40 = 1024;
    LODWORD(v41[0]) = 1;
    WORD2(v41[0]) = 2112;
    *(_QWORD *)((char *)v41 + 6) = v17;
    _os_log_impl(&dword_1AF589000, v14, OS_LOG_TYPE_DEFAULT, "%13.5f: XPC proxy invalid: reconnect %u %@", buf, 0x1Cu);
    if (v13)

    goto LABEL_20;
  }
LABEL_27:
  v22 = (void *)MEMORY[0x1E0CB35C8];
  v36 = *MEMORY[0x1E0CB2D50];
  v37 = CFSTR(" Not connected to server");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 57, v6);
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v24 + 40);
  *(_QWORD *)(v24 + 40) = v23;
LABEL_28:

LABEL_29:
  v25 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v27 = *(_QWORD *)(v25 + 40);
  v26 = (id *)(v25 + 40);
  if (!v27)
  {
    v28 = (void *)v31[5];
    if (v28)
      objc_storeStrong(v26, v28);
  }
  _Block_object_dispose(&v30, 8);

}

void __35__AWUnitTestSampler_invokeSampler___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __29__AWUnitTestSampler__connect__block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __29__AWUnitTestSampler__connect__block_invoke_2;
  v3[3] = &unk_1E5F8E510;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "getUnitTestSamplerWithReply:", v3);
  return 0;
}

void __29__AWUnitTestSampler__connect__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), a2);
}

+ (id)sharedSampler
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__AWUnitTestSampler_sharedSampler__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedSampler_onceToken != -1)
    dispatch_once(&sharedSampler_onceToken, block);
  return (id)sharedSampler_sampler;
}

void __34__AWUnitTestSampler_sharedSampler__block_invoke()
{
  AWUnitTestSampler *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;
  id v7;

  v0 = objc_alloc_init(AWUnitTestSampler);
  v1 = (void *)sharedSampler_sampler;
  sharedSampler_sampler = (uint64_t)v0;

  objc_msgSend((id)sharedSampler_sampler, "_connect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0C99DA0];
    v4 = *MEMORY[0x1E0CB2FC0];
    v7 = v2;
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "raise:format:", v4, CFSTR("%@ sharedSampler not available"), v6);

    v2 = v7;
  }

}

@end
