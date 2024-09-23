@implementation AFClientLite

- (AFClientLite)init
{
  AFCallSiteInfo *v2;
  AFCallSiteInfo *v3;
  AFClientLite *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  AFCallSiteInfo *initiationCallSiteInfo;
  NSObject *v12;
  AFCallSiteInfo *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  objc_super v18;
  Dl_info v19;
  uint64_t v20;

  v3 = v2;
  v20 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)AFClientLite;
  v4 = -[AFClientLite init](&v18, sel_init);
  if (v4)
  {
    if (v2)
    {
      memset(&v19, 0, sizeof(v19));
      if (dladdr(v2, &v19))
      {
        if (v19.dli_fname && *v19.dli_fname)
        {
          v5 = objc_alloc(MEMORY[0x1E0CB3940]);
          v6 = (void *)objc_msgSend(v5, "initWithUTF8String:", v19.dli_fname);
        }
        else
        {
          v6 = 0;
        }
        if (v19.dli_sname && *v19.dli_sname)
        {
          v7 = objc_alloc(MEMORY[0x1E0CB3940]);
          v8 = (void *)objc_msgSend(v7, "initWithUTF8String:", v19.dli_sname);
        }
        else
        {
          v8 = 0;
        }
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __20__AFClientLite_init__block_invoke;
        v15[3] = &unk_1E3A33CF8;
        v16 = v6;
        v17 = v8;
        v9 = v8;
        v10 = v6;
        v3 = +[AFCallSiteInfo newWithBuilder:](AFCallSiteInfo, "newWithBuilder:", v15);

      }
      else
      {
        v3 = 0;
      }
    }
    initiationCallSiteInfo = v4->_initiationCallSiteInfo;
    v4->_initiationCallSiteInfo = v3;

    v12 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v13 = v4->_initiationCallSiteInfo;
      LODWORD(v19.dli_fname) = 136315650;
      *(const char **)((char *)&v19.dli_fname + 4) = "-[AFClientLite init]";
      WORD2(v19.dli_fbase) = 2048;
      *(void **)((char *)&v19.dli_fbase + 6) = v4;
      HIWORD(v19.dli_sname) = 2112;
      v19.dli_saddr = v13;
      _os_log_impl(&dword_19AF50000, v12, OS_LOG_TYPE_INFO, "%s %p (Caller = %@)", (uint8_t *)&v19, 0x20u);
    }
  }
  return v4;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  AFClientLite *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v6 = "-[AFClientLite dealloc]";
    v7 = 2048;
    v8 = self;
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }
  v4.receiver = self;
  v4.super_class = (Class)AFClientLite;
  -[AFClientLite dealloc](&v4, sel_dealloc);
}

- (void)_handleCommand:(id)a3 afterCurrentRequest:(BOOL)a4 isOneWay:(BOOL)a5 commandHandler:(id)a6 completion:(id)a7
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  int v16;
  const char *v17;
  __int16 v18;
  AFClientLite *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  _BOOL4 v25;
  uint64_t v26;

  v9 = a5;
  v10 = a4;
  v26 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a6;
  v14 = a7;
  v15 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v16 = 136316162;
    v17 = "-[AFClientLite _handleCommand:afterCurrentRequest:isOneWay:commandHandler:completion:]";
    v18 = 2048;
    v19 = self;
    v20 = 2112;
    v21 = v12;
    v22 = 1024;
    v23 = v10;
    v24 = 1024;
    v25 = v9;
    _os_log_impl(&dword_19AF50000, v15, OS_LOG_TYPE_INFO, "%s %p %@ %d %d", (uint8_t *)&v16, 0x2Cu);
  }

}

- (void)handleCommand:(id)a3 afterCurrentRequest:(BOOL)a4 commandHandler:(id)a5 completion:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  int v14;
  const char *v15;
  __int16 v16;
  AFClientLite *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  _BOOL4 v21;
  uint64_t v22;

  v8 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    v14 = 136315906;
    v15 = "-[AFClientLite handleCommand:afterCurrentRequest:commandHandler:completion:]";
    v16 = 2048;
    v17 = self;
    v18 = 2112;
    v19 = v10;
    v20 = 1024;
    v21 = v8;
    _os_log_debug_impl(&dword_19AF50000, v13, OS_LOG_TYPE_DEBUG, "%s %p %@ %d", (uint8_t *)&v14, 0x26u);
  }
  -[AFClientLite _handleCommand:afterCurrentRequest:isOneWay:commandHandler:completion:](self, "_handleCommand:afterCurrentRequest:isOneWay:commandHandler:completion:", v10, v8, 0, v11, v12);

}

- (void)handleOneWayCommand:(id)a3 commandHandler:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  AFClientLite *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    v12 = 136315650;
    v13 = "-[AFClientLite handleOneWayCommand:commandHandler:completion:]";
    v14 = 2048;
    v15 = self;
    v16 = 2112;
    v17 = v8;
    _os_log_debug_impl(&dword_19AF50000, v11, OS_LOG_TYPE_DEBUG, "%s %p %@", (uint8_t *)&v12, 0x20u);
  }
  -[AFClientLite _handleCommand:afterCurrentRequest:isOneWay:commandHandler:completion:](self, "_handleCommand:afterCurrentRequest:isOneWay:commandHandler:completion:", v8, 1, 1, v9, v10);

}

- (void)handleCommand:(id)a3 commandHandler:(id)a4 completion:(id)a5
{
  -[AFClientLite handleCommand:afterCurrentRequest:commandHandler:completion:](self, "handleCommand:afterCurrentRequest:commandHandler:completion:", a3, 1, a4, a5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initiationCallSiteInfo, 0);
}

void __20__AFClientLite_init__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setImagePath:", v3);
  objc_msgSend(v4, "setSymbolName:", *(_QWORD *)(a1 + 40));

}

@end
