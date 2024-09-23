@implementation MKGETStatusRouter

- (void)server:(id)a3 didReceiveRequest:(id)a4 response:(id)a5
{
  id v6;
  void *v7;
  MKDevice *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  MKWiFiDevice *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  MKGETStatusRouter *v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v27 = a5;
  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v26 = self;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_state);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("state"));

  v8 = objc_alloc_init(MKDevice);
  -[MKDevice systemName](v8, "systemName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v9, CFSTR("system_name"));

  -[MKDevice systemVersion](v8, "systemVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v10, CFSTR("system_version"));

  -[MKDevice deviceName](v8, "deviceName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v11, CFSTR("device_name"));

  -[MKDevice deviceFamily](v8, "deviceFamily");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v12, CFSTR("device_family"));

  v13 = objc_alloc_init(MKWiFiDevice);
  -[MKWiFiDevice currentNetwork](v13, "currentNetwork");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(v14, "allKeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v30 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v14, "objectForKeyedSubscript:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKey:", v21, v20);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v17);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v26->_preferredChannel);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v22, CFSTR("ap1"));

  v28 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v6, 0, &v28);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v28;
  if (v24)
  {
    +[MKLog log](MKLog, "log");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[MKGETStatusRouter server:didReceiveRequest:response:].cold.1((uint64_t)v24, v25);

  }
  objc_msgSend(v27, "setBody:", v23);

}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (int64_t)preferredChannel
{
  return self->_preferredChannel;
}

- (void)setPreferredChannel:(int64_t)a3
{
  self->_preferredChannel = a3;
}

- (void)server:(uint64_t)a1 didReceiveRequest:(NSObject *)a2 response:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_21EC08000, a2, OS_LOG_TYPE_ERROR, "error=%@", (uint8_t *)&v2, 0xCu);
}

@end
