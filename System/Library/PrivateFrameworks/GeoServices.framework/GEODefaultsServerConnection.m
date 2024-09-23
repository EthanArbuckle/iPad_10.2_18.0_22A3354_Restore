@implementation GEODefaultsServerConnection

void ___GEODefaultsServerConnection_block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  const char *string;
  const char *v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  objc_class *v9;
  void *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  NSObject *v20;
  dispatch_time_t v21;
  NSObject *v22;
  NSObject *global_queue;
  dispatch_source_t v24;
  void *v25;
  NSObject *v26;
  dispatch_time_t v27;
  id v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  NSObject *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (MEMORY[0x18D765A14]() == MEMORY[0x1E0C812F8])
  {
    string = xpc_dictionary_get_string(v2, "message");
    if (string)
    {
      v4 = string;
      if (!strcmp(string, "defaults.keysChanged"))
      {
        v9 = (objc_class *)objc_opt_class();
        v28 = 0;
        GEODecodeModernXPCMessage(v2, v9, (uint64_t)&v28);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v28;
        objc_msgSend(v10, "keyStrings");
        v11 = (char *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "keyOptions");

        if (!(objc_msgSend(v11, "count") | v12) || v5)
        {
          j__GEOGetUserDefaultsLog();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            v30 = v11;
            v31 = 1024;
            v32 = v12;
            v33 = 2112;
            v34 = v5;
            _os_log_impl(&dword_1885A9000, v22, OS_LOG_TYPE_ERROR, "Could not decode XPC message keys: %@ options: %#x error: %@", buf, 0x1Cu);
          }

        }
        else
        {
          v5 = v11;
          os_unfair_lock_lock(&stru_1ECDBBA64);
          if (!qword_1ECDBBAC8)
          {
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            v13 = objc_claimAutoreleasedReturnValue();
            v14 = (void *)qword_1ECDBBAC8;
            qword_1ECDBBAC8 = v13;

          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)qword_1ECDBBAC8, "objectForKeyedSubscript:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16 == 0;

          if (v17)
          {
            objc_msgSend(MEMORY[0x1E0C99E20], "set");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)qword_1ECDBBAC8, "setObject:forKeyedSubscript:", v18, v15);

          }
          objc_msgSend((id)qword_1ECDBBAC8, "objectForKeyedSubscript:", v15);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObjectsFromArray:", v5);

          v20 = qword_1ECDBBAC0;
          if (qword_1ECDBBAC0)
          {
            v21 = dispatch_time(0, 2000000);
            dispatch_source_set_timer(v20, v21, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
          }
          else
          {
            global_queue = geo_get_global_queue();
            v24 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, global_queue);
            v25 = (void *)qword_1ECDBBAC0;
            qword_1ECDBBAC0 = (uint64_t)v24;

            dispatch_source_set_event_handler((dispatch_source_t)qword_1ECDBBAC0, &__block_literal_global_155);
            v26 = qword_1ECDBBAC0;
            v27 = dispatch_time(0, 2000000);
            dispatch_source_set_timer(v26, v27, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
            dispatch_activate((dispatch_object_t)qword_1ECDBBAC0);
          }

          os_unfair_lock_unlock(&stru_1ECDBBA64);
        }
        goto LABEL_22;
      }
      j__GEOGetUserDefaultsLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v30 = v4;
        v6 = "Received unknown message: \"%s\";
        v7 = v5;
        v8 = OS_LOG_TYPE_DEFAULT;
LABEL_8:
        _os_log_impl(&dword_1885A9000, v7, v8, v6, buf, 0xCu);
      }
    }
    else
    {
      j__GEOGetUserDefaultsLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v30 = (const char *)v2;
        v6 = "Received invalid message: \"%@\";
        v7 = v5;
        v8 = OS_LOG_TYPE_ERROR;
        goto LABEL_8;
      }
    }
LABEL_22:

  }
}

uint64_t ___GEODefaultsServerConnection_block_invoke()
{
  uint64_t v0;
  void *v1;

  +[GEOXPCConnection createServerConnectionFor:debugIdentifier:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:eventHandler:", 2, CFSTR("Defaults"), &__block_literal_global_90);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECDBBAA0;
  qword_1ECDBBAA0 = v0;

  return objc_msgSend((id)qword_1ECDBBAA0, "setReconnectAutomatically:", 1);
}

@end
