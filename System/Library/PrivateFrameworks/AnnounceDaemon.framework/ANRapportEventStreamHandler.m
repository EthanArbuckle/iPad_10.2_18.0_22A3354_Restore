@implementation ANRapportEventStreamHandler

- (ANRapportEventStreamHandler)init
{
  ANRapportEventStreamHandler *v2;
  uint64_t v3;
  NSMutableDictionary *rapportActivationHandlers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ANRapportEventStreamHandler;
  v2 = -[ANRapportEventStreamHandler init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    rapportActivationHandlers = v2->_rapportActivationHandlers;
    v2->_rapportActivationHandlers = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void)addRapportServiceType:(id)a3 activationBlock:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  v8 = _Block_copy(a4);
  -[ANRapportEventStreamHandler rapportActivationHandlers](self, "rapportActivationHandlers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, v6);

}

- (void)addAnnounceRapportServiceType
{
  id v3;

  if (objc_msgSend(MEMORY[0x1E0CF7DE8], "isAnnounceEnabled"))
  {
    -[ANRapportEventStreamHandler rapportActivationHandlers](self, "rapportActivationHandlers");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &__block_literal_global_6, *MEMORY[0x1E0CF79F8]);

  }
}

void __60__ANRapportEventStreamHandler_addAnnounceRapportServiceType__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  +[ANRapportConnection sharedConnection](ANRapportConnection, "sharedConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activateLinkWithOptions:completion:", 1, v2);

}

- (void)setEventStreamHandler
{
  _QWORD handler[5];

  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __52__ANRapportEventStreamHandler_setEventStreamHandler__block_invoke;
  handler[3] = &unk_1E938F788;
  handler[4] = self;
  xpc_set_event_stream_handler("com.apple.rapport.matching", MEMORY[0x1E0C80D38], handler);
}

void __52__ANRapportEventStreamHandler_setEventStreamHandler__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  const char *string;
  NSObject *v5;
  xpc_object_t reply;
  void *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  NSObject *v10;
  _QWORD v11[4];
  NSObject *v12;
  uint8_t buf[4];
  const __CFString *v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  string = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x1E0C81298]);
  ANLogHandleRapportEventStreamHandler();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v14 = &stru_1E93913D0;
    v15 = 2080;
    v16 = string;
    _os_log_impl(&dword_1D23A0000, v5, OS_LOG_TYPE_DEFAULT, "%@XPC Event Stream Name: %s", buf, 0x16u);
  }

  if (string && xpc_dictionary_expects_reply())
  {
    reply = xpc_dictionary_create_reply(v3);
    if (reply)
    {
      objc_msgSend(*(id *)(a1 + 32), "rapportActivationHandlers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v8);
      v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __52__ANRapportEventStreamHandler_setEventStreamHandler__block_invoke_6;
        v11[3] = &unk_1E938F760;
        v12 = reply;
        ((void (**)(_QWORD, _QWORD *))v9)[2](v9, v11);
        v10 = v12;
      }
      else
      {
        ANLogHandleRapportEventStreamHandler();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v14 = &stru_1E93913D0;
          v15 = 2080;
          v16 = string;
          _os_log_impl(&dword_1D23A0000, v10, OS_LOG_TYPE_ERROR, "%@Unsupported XPC Event Stream Name: %s", buf, 0x16u);
        }
      }

    }
  }

}

void __52__ANRapportEventStreamHandler_setEventStreamHandler__block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
    CUXPCEncodeNSError();
  ANLogHandleRapportEventStreamHandler();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412546;
    v7 = &stru_1E93913D0;
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_1D23A0000, v4, OS_LOG_TYPE_DEFAULT, "%@Sending Reply %@", (uint8_t *)&v6, 0x16u);
  }

  xpc_dictionary_send_reply();
}

- (NSMutableDictionary)rapportActivationHandlers
{
  return self->_rapportActivationHandlers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rapportActivationHandlers, 0);
}

@end
