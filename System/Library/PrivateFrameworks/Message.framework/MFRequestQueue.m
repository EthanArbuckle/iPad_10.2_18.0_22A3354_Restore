@implementation MFRequestQueue

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __21__MFRequestQueue_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_27 != -1)
    dispatch_once(&log_onceToken_27, block);
  return (OS_os_log *)(id)log_log_27;
}

void __21__MFRequestQueue_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_27;
  log_log_27 = (uint64_t)v1;

}

+ (id)signpostLog
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__MFRequestQueue_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken_1 != -1)
    dispatch_once(&signpostLog_onceToken_1, block);
  return (id)signpostLog_log_1;
}

void __29__MFRequestQueue_signpostLog__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email.signposts", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)signpostLog_log_1;
  signpostLog_log_1 = (uint64_t)v1;

}

- (unint64_t)signpostID
{
  NSObject *v3;
  os_signpost_id_t v4;

  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

- (MFRequestQueue)init
{
  MFRequestQueue *v2;
  MFRequestQueue *v3;
  NSMutableArray *v4;
  NSMutableArray *requestPairs;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MFRequestQueue;
  v2 = -[MFRequestQueue init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    requestPairs = v3->_requestPairs;
    v3->_requestPairs = v4;

  }
  return v3;
}

- (BOOL)addRequests:(id)a3
{
  return -[MFRequestQueue addRequests:combine:](self, "addRequests:combine:", a3, 0);
}

- (BOOL)addRequests:(id)a3 combine:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  char v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  _BYTE v21[128];
  uint64_t v22;

  v4 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (v4)
  {
    v8 = -[MFRequestQueue sendRequests:](self, "sendRequests:", v6);
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v17;
      v8 = 1;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v9);
          v20 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1, (_QWORD)v16);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = -[MFRequestQueue sendRequests:](self, "sendRequests:", v13);

          v8 &= v14;
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v10);
    }
    else
    {
      v8 = 1;
    }

  }
  return v8;
}

- (BOOL)addRequest:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[MFRequestQueue sendRequests:](self, "sendRequests:", v5);

  return (char)self;
}

- (BOOL)sendRequests:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  os_unfair_lock_s *p_lock;
  BOOL v13;
  NSObject *v14;
  NSObject *v15;
  int v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "first");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_opt_class();
  +[MFRequestQueue signpostLog](MFRequestQueue, "signpostLog");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  +[MFRequestQueue signpostLog](MFRequestQueue, "signpostLog");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    v17 = 138543874;
    v18 = v7;
    v19 = 2050;
    v20 = objc_msgSend(v7, "hash");
    v21 = 2050;
    v22 = objc_msgSend(v4, "count");
    _os_signpost_emit_with_name_impl(&dword_1A4F90000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "REQUEST QUEUE", "RequestClass=%{signpost.description:attribute,public}@ RequestType=%{public, signpost.telemetry:number1}lu RequestCount=%{public, signpost.telemetry:number2}lu enableTelemetry=YES ", (uint8_t *)&v17, 0x20u);
  }

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v13 = -[MFRequestQueue _processRequests:](self, "_processRequests:", v4);
  os_unfair_lock_unlock(p_lock);
  +[MFRequestQueue signpostLog](MFRequestQueue, "signpostLog");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    LOWORD(v17) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A4F90000, v15, OS_SIGNPOST_INTERVAL_END, v9, "REQUEST QUEUE", ", (uint8_t *)&v17, 2u);
  }

  return v13;
}

- (BOOL)processRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(v3, "second");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "first");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleResponse:error:", v5, 0);

  return 1;
}

- (BOOL)_processRequests:(id)a3
{
  id v4;

  v4 = a3;
  LOBYTE(self) = -[MFRequestQueue processRequests:](self, "processRequests:", v4);

  return (char)self;
}

- (BOOL)processRequests:(id)a3
{
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__MFRequestQueue_processRequests___block_invoke;
  v5[3] = &unk_1E4E88D58;
  v5[4] = self;
  v5[5] = &v6;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__MFRequestQueue_processRequests___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "processRequest:", a2);
  if ((_DWORD)result)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  return result;
}

- (NSMutableArray)requestPairs
{
  return self->_requestPairs;
}

- (void)setRequestPairs:(id)a3
{
  objc_storeStrong((id *)&self->_requestPairs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestPairs, 0);
}

@end
