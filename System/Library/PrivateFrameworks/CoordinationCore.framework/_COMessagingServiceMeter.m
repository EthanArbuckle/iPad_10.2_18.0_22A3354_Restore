@implementation _COMessagingServiceMeter

- (_COMessagingServiceMeter)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSMutableDictionary *v20;
  NSMutableDictionary *peaks;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  NSDictionary *limits;
  void *v35;
  _COMessagingServiceMeter *val;
  id v37;
  _QWORD handler[4];
  id v39;
  id location;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  objc_super v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v49.receiver = self;
  v49.super_class = (Class)_COMessagingServiceMeter;
  val = -[_COMessagingServiceMeter init](&v49, sel_init);
  if (val)
  {
    val->_lock._os_unfair_lock_opaque = 0;
    v37 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v37, "setObject:forKey:", &unk_24D4CF3F0, CFSTR("com.apple.homepodsettingsd"));
    objc_msgSend(v37, "setObject:forKey:", &unk_24D4CF408, CFSTR("com.apple.coordinated"));
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "arguments");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = objc_msgSend(v35, "indexOfObject:", CFSTR("--limits"));
    if (v3 != 0x7FFFFFFFFFFFFFFFLL && v3 + 1 < (unint64_t)objc_msgSend(v35, "count"))
    {
      objc_msgSend(v35, "objectAtIndex:");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "componentsSeparatedByString:", CFSTR(","));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v7 = v5;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v46;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v46 != v9)
              objc_enumerationMutation(v7);
            objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "stringByTrimmingCharactersInSet:", v6);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v11, "length"))
            {
              objc_msgSend(v11, "componentsSeparatedByString:", CFSTR("="));
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v12, "count") == 2)
              {
                objc_msgSend(v12, "objectAtIndex:", 0);
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "stringByTrimmingCharactersInSet:", v6);
                v14 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v12, "objectAtIndex:", 1);
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "stringByTrimmingCharactersInSet:", v6);
                v16 = (void *)objc_claimAutoreleasedReturnValue();

                if (objc_msgSend(v14, "length"))
                {
                  if (objc_msgSend(v16, "length"))
                  {
                    v17 = objc_msgSend(v16, "integerValue");
                    if (v17 >= 1)
                    {
                      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v17);
                      v18 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v37, "setObject:forKey:", v18, v14);

                    }
                  }
                }

              }
            }

          }
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
        }
        while (v8);
      }

    }
    v19 = objc_msgSend(v35, "indexOfObject:", CFSTR("--evaluating"));
    if (v19 != 0x7FFFFFFFFFFFFFFFLL && v19 + 1 < (unint64_t)objc_msgSend(v35, "count"))
    {
      v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      peaks = val->_peaks;
      val->_peaks = v20;

      objc_msgSend(v35, "objectAtIndex:", v19 + 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "componentsSeparatedByString:", CFSTR(","));
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v25 = v23;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
      if (v26)
      {
        v27 = *(_QWORD *)v42;
        do
        {
          for (j = 0; j != v26; ++j)
          {
            if (*(_QWORD *)v42 != v27)
              objc_enumerationMutation(v25);
            v29 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
            objc_msgSend(v29, "stringByTrimmingCharactersInSet:", v24);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v30, "length"))
            {
              -[NSMutableDictionary setObject:forKey:](val->_peaks, "setObject:forKey:", &unk_24D4CF420, v29);
              objc_msgSend(v37, "setObject:forKey:", &unk_24D4CF438, v29);
            }

          }
          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
        }
        while (v26);
      }

      objc_initWeak(&location, val);
      dispatch_get_global_queue(21, 0);
      v31 = objc_claimAutoreleasedReturnValue();
      handler[0] = MEMORY[0x24BDAC760];
      handler[1] = 3221225472;
      handler[2] = __32___COMessagingServiceMeter_init__block_invoke;
      handler[3] = &unk_24D4B36F0;
      objc_copyWeak(&v39, &location);
      notify_register_dispatch("com.apple.CoordinationCore.COMessagingServiceMeter", &val->_registration, v31, handler);

      objc_destroyWeak(&v39);
      objc_destroyWeak(&location);

    }
    v32 = objc_msgSend(v37, "copy");
    limits = val->_limits;
    val->_limits = (NSDictionary *)v32;

  }
  return val;
}

- (void)dealloc
{
  int v3;
  objc_super v4;

  v3 = -[_COMessagingServiceMeter registration](self, "registration");
  if (notify_is_valid_token(v3))
    notify_cancel(v3);
  v4.receiver = self;
  v4.super_class = (Class)_COMessagingServiceMeter;
  -[_COMessagingServiceMeter dealloc](&v4, sel_dealloc);
}

- (void)_withLock:(id)a3
{
  os_unfair_lock_s *p_lock;
  void (**v4)(_QWORD);

  p_lock = &self->_lock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)clientIdentifier:(id)a3 canSendLength:(unint64_t)a4
{
  id v6;
  unint64_t v7;
  _QWORD v9[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  v7 = -[_COMessagingServiceMeter sendLimitForIdentifier:](self, "sendLimitForIdentifier:", v6);
  if (-[_COMessagingServiceMeter isEvaluatingIdentifier:](self, "isEvaluatingIdentifier:", v6))
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __59___COMessagingServiceMeter_clientIdentifier_canSendLength___block_invoke;
    v9[3] = &unk_24D4B3340;
    v9[4] = self;
    v10 = v6;
    v11 = a4;
    -[_COMessagingServiceMeter _withLock:](self, "_withLock:", v9);

  }
  return v7 > a4;
}

- (BOOL)clientIdentifier:(id)a3 canReceiveLength:(unint64_t)a4
{
  id v6;
  unint64_t v7;
  _QWORD v9[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  v7 = -[_COMessagingServiceMeter receiveLimitForIdentifier:](self, "receiveLimitForIdentifier:", v6);
  if (-[_COMessagingServiceMeter isEvaluatingIdentifier:](self, "isEvaluatingIdentifier:", v6))
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __62___COMessagingServiceMeter_clientIdentifier_canReceiveLength___block_invoke;
    v9[3] = &unk_24D4B3340;
    v9[4] = self;
    v10 = v6;
    v11 = a4;
    -[_COMessagingServiceMeter _withLock:](self, "_withLock:", v9);

  }
  return v7 > a4;
}

- (BOOL)isEvaluatingIdentifier:(id)a3
{
  id v4;
  BOOL v5;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  if (-[_COMessagingServiceMeter sendLimitForIdentifier:](self, "sendLimitForIdentifier:", v4) == -1)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v13 = 0;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __51___COMessagingServiceMeter_isEvaluatingIdentifier___block_invoke;
    v7[3] = &unk_24D4B0BE0;
    v9 = &v10;
    v7[4] = self;
    v8 = v4;
    -[_COMessagingServiceMeter _withLock:](self, "_withLock:", v7);
    v5 = *((_BYTE *)v11 + 24) != 0;

    _Block_object_dispose(&v10, 8);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)sendLimitForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v4 = a3;
  -[_COMessagingServiceMeter limits](self, "limits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = objc_msgSend(v6, "unsignedIntegerValue");
  else
    v7 = 10240;

  return v7;
}

- (unint64_t)receiveLimitForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v4 = a3;
  -[_COMessagingServiceMeter limits](self, "limits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = objc_msgSend(v6, "unsignedIntegerValue");
  else
    v7 = 10240;

  return v7;
}

- (NSDictionary)limits
{
  return self->_limits;
}

- (NSMutableDictionary)peaks
{
  return self->_peaks;
}

- (int)registration
{
  return self->_registration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peaks, 0);
  objc_storeStrong((id *)&self->_limits, 0);
}

@end
