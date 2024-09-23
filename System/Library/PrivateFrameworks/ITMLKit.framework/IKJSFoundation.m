@implementation IKJSFoundation

- (IKJSFoundation)initWithAppContext:(id)a3 deviceConfig:(id)a4
{
  id v6;
  id v7;
  IKJSFoundation *v8;
  IKJSFoundation *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *jsTimers;
  NSMutableDictionary *v12;
  NSMutableDictionary *dateFormatterCache;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)IKJSFoundation;
  v8 = -[IKJSFoundation init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_appContext, v6);
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    jsTimers = v9->_jsTimers;
    v9->_jsTimers = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    dateFormatterCache = v9->_dateFormatterCache;
    v9->_dateFormatterCache = v12;

    objc_storeWeak((id *)&v9->_deviceConfig, v7);
  }

  return v9;
}

- (id)setInterval:(id)a3 time:(int64_t)a4
{
  return -[IKJSFoundation _startTimer:time:repeating:](self, "_startTimer:time:repeating:", a3, a4, 1);
}

- (id)setTimeout:(id)a3 time:(int64_t)a4
{
  return -[IKJSFoundation _startTimer:time:repeating:](self, "_startTimer:time:repeating:", a3, a4, 0);
}

- (void)stopTimers
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  _QWORD block[4];
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[IKJSFoundation jsTimers](self, "jsTimers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "valueForKey:", CFSTR("timer"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10++), "removeManagedReferences");
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __28__IKJSFoundation_stopTimers__block_invoke;
    block[3] = &unk_1E9F4BD18;
    v14 = v5;
    v11 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  -[IKJSFoundation jsTimers](self, "jsTimers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeAllObjects");

}

void __28__IKJSFoundation_stopTimers__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "invalidate", (_QWORD)v6);
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (id)_startTimer:(id)a3 time:(int64_t)a4 repeating:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  int64_t v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  IKJSTimerContext *v17;
  void *v18;
  void *v19;
  void *v20;
  IKJSTimerContext *v21;
  void *v22;
  id v23;
  _QWORD block[4];
  id v26;

  v5 = a5;
  v8 = a3;
  if ((objc_msgSend(v8, "isObject") & 1) == 0)
  {
    -[IKJSFoundation appContext](self, "appContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = CFSTR("starting timer with empty handler");
    goto LABEL_9;
  }
  if (a4 >= 1)
    v9 = a4;
  else
    v9 = 0;
  if (a4 <= 0 && v5)
  {
    -[IKJSFoundation appContext](self, "appContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = CFSTR("starting timer with invalid timeout");
LABEL_9:
    objc_msgSend(v10, "setException:withErrorMessage:", 0, v12);

    v13 = 0;
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0CBE0F0], "currentArguments");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v14, "count") < 3)
  {
    v15 = 0;
  }
  else
  {
    objc_msgSend(v14, "subarrayWithRange:", 2, objc_msgSend(v14, "count") - 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0C99E88], "timerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__jsTimerFired_, 0, v5, (float)((float)v9 / 1000.0));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = [IKJSTimerContext alloc];
  -[IKJSFoundation appContext](self, "appContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "jsContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("App"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[IKJSTimerContext initWithCallback:callbackArgs:repeating:ownerObject:timer:](v17, "initWithCallback:callbackArgs:repeating:ownerObject:timer:", v8, v15, v5, v20, v16);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKJSFoundation jsTimers](self, "jsTimers");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKey:", v21, v13);

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__IKJSFoundation__startTimer_time_repeating___block_invoke;
  block[3] = &unk_1E9F4BD18;
  v26 = v16;
  v23 = v16;
  dispatch_async(MEMORY[0x1E0C80D38], block);

LABEL_14:
  return v13;
}

void __45__IKJSFoundation__startTimer_time_repeating___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addTimer:forMode:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0C99860]);

}

- (void)_clearTimer:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD block[4];
  id v17;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "length"))
  {
    -[IKJSFoundation jsTimers](self, "jsTimers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[NSObject timer](v6, "timer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject removeManagedReferences](v6, "removeManagedReferences");
      -[IKJSFoundation jsTimers](self, "jsTimers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObjectForKey:", v4);

      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __30__IKJSFoundation__clearTimer___block_invoke;
      block[3] = &unk_1E9F4BD18;
      v17 = v7;
      v9 = v7;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
  }
  else
  {
    ITMLKitGetLogObject(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[IKJSFoundation _clearTimer:].cold.1((uint64_t)v4, v6, v10, v11, v12, v13, v14, v15);
  }

}

uint64_t __30__IKJSFoundation__clearTimer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)_jsTimerFired:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[IKJSFoundation appContext](self, "appContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __32__IKJSFoundation__jsTimerFired___block_invoke;
  v8[3] = &unk_1E9F4CB00;
  objc_copyWeak(&v10, &location);
  v7 = v5;
  v9 = v7;
  objc_msgSend(v6, "evaluate:completionBlock:", v8, 0);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __32__IKJSFoundation__jsTimerFired___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v13 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "jsTimers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v6, "managedCallback");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "value");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "managedArgs");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "jsValuesWithContext:", v13);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (id)objc_msgSend(v8, "callWithArguments:", v10);

      if ((objc_msgSend(v6, "isRepeating") & 1) == 0)
      {
        objc_msgSend(v6, "removeManagedReferences");
        objc_msgSend(v4, "jsTimers");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "removeObjectForKey:", *(_QWORD *)(a1 + 32));

      }
    }

  }
}

- (id)getCookieForURL:(id)a3 useSSCookieStorage:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a4;
  v5 = a3;
  if (!objc_msgSend(v5, "length"))
  {
    v6 = 0;
LABEL_8:
    v10 = 0;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = !v4;
  else
    v7 = 1;
  if (v7)
    goto LABEL_8;
  objc_msgSend(MEMORY[0x1E0DAF680], "sharedStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cookieHeadersForURL:userIdentifier:", v6, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKey:", CFSTR("Cookie"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v10;
}

- (void)setCookie:(id)a3 useSSCookieStorage:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;
  unint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  __CFString *v49;
  NSObject *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  _QWORD v63[2];

  v4 = a4;
  v63[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;
  objc_opt_class();
  v9 = 0x1E0C99000uLL;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    do
    {
      v62 = 0;
      objc_msgSend(v12, "scanUpToString:intoString:", CFSTR("="), &v62);
      v13 = v62;
      objc_msgSend(v12, "scanString:intoString:", CFSTR("="), 0);
      v61 = 0;
      objc_msgSend(v12, "scanUpToString:intoString:", CFSTR(";"), &v61);
      v14 = v61;
      objc_msgSend(v12, "scanString:intoString:", CFSTR(";"), 0);
      objc_msgSend(v13, "stringByTrimmingCharactersInSet:", v11);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "stringByTrimmingCharactersInSet:", v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (-[__CFString length](v15, "length") && objc_msgSend(v16, "length"))
      {
        if (objc_msgSend(v10, "count"))
        {
          v17 = v10;
          v18 = v16;
          v19 = v15;
        }
        else
        {
          objc_msgSend(v10, "setObject:forKey:", v15, CFSTR("name"));
          v17 = v10;
          v18 = v16;
          v19 = CFSTR("value");
        }
        objc_msgSend(v17, "setObject:forKey:", v18, v19);
      }
      v20 = objc_msgSend(v12, "isAtEnd");

    }
    while (!v20);

    v9 = 0x1E0C99000;
  }
  else
  {
    v10 = v8;
  }
  if (objc_msgSend(v10, "count"))
  {
    v21 = (void *)objc_msgSend(objc_alloc(*(Class *)(v9 + 3592)), "initWithCapacity:", objc_msgSend(v10, "count"));
    -[IKJSFoundation _stringForKey:fromDict:](self, "_stringForKey:fromDict:", CFSTR("name"), v10);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      -[IKJSFoundation _stringForKey:fromDict:](self, "_stringForKey:fromDict:", CFSTR("name"), v10);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKey:", v23, *MEMORY[0x1E0CB2B90]);

    }
    -[IKJSFoundation _stringForKey:fromDict:](self, "_stringForKey:fromDict:", CFSTR("value"), v10);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      -[IKJSFoundation _stringForKey:fromDict:](self, "_stringForKey:fromDict:", CFSTR("value"), v10);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKey:", v25, *MEMORY[0x1E0CB2BC0]);

    }
    -[IKJSFoundation _stringForKey:fromDict:](self, "_stringForKey:fromDict:", CFSTR("originURL"), v10);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      -[IKJSFoundation _stringForKey:fromDict:](self, "_stringForKey:fromDict:", CFSTR("originURL"), v10);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKey:", v27, *MEMORY[0x1E0CB2B98]);

    }
    -[IKJSFoundation _stringForKey:fromDict:](self, "_stringForKey:fromDict:", CFSTR("version"), v10);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      -[IKJSFoundation _stringForKey:fromDict:](self, "_stringForKey:fromDict:", CFSTR("version"), v10);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKey:", v29, *MEMORY[0x1E0CB2BC8]);

    }
    -[IKJSFoundation _stringForKey:fromDict:](self, "_stringForKey:fromDict:", CFSTR("domain"), v10);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      -[IKJSFoundation _stringForKey:fromDict:](self, "_stringForKey:fromDict:", CFSTR("domain"), v10);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKey:", v31, *MEMORY[0x1E0CB2B78]);

    }
    -[IKJSFoundation _stringForKey:fromDict:](self, "_stringForKey:fromDict:", CFSTR("path"), v10);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      -[IKJSFoundation _stringForKey:fromDict:](self, "_stringForKey:fromDict:", CFSTR("path"), v10);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKey:", v33, *MEMORY[0x1E0CB2BA0]);

    }
    -[IKJSFoundation _stringForKey:fromDict:](self, "_stringForKey:fromDict:", CFSTR("secure"), v10);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      -[IKJSFoundation _stringForKey:fromDict:](self, "_stringForKey:fromDict:", CFSTR("secure"), v10);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKey:", v35, *MEMORY[0x1E0CB2BB8]);

    }
    -[IKJSFoundation _stringForKey:fromDict:](self, "_stringForKey:fromDict:", CFSTR("comment"), v10);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      -[IKJSFoundation _stringForKey:fromDict:](self, "_stringForKey:fromDict:", CFSTR("comment"), v10);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKey:", v37, *MEMORY[0x1E0CB2B60]);

    }
    -[IKJSFoundation _stringForKey:fromDict:](self, "_stringForKey:fromDict:", CFSTR("commentURL"), v10);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      -[IKJSFoundation _stringForKey:fromDict:](self, "_stringForKey:fromDict:", CFSTR("commentURL"), v10);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKey:", v39, *MEMORY[0x1E0CB2B68]);

    }
    -[IKJSFoundation _stringForKey:fromDict:](self, "_stringForKey:fromDict:", CFSTR("discard"), v10);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (v40)
    {
      -[IKJSFoundation _stringForKey:fromDict:](self, "_stringForKey:fromDict:", CFSTR("discard"), v10);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKey:", v41, *MEMORY[0x1E0CB2B70]);

    }
    -[IKJSFoundation _stringForKey:fromDict:](self, "_stringForKey:fromDict:", CFSTR("maxAge"), v10);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      -[IKJSFoundation _stringForKey:fromDict:](self, "_stringForKey:fromDict:", CFSTR("maxAge"), v10);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKey:", v43, *MEMORY[0x1E0CB2B88]);

    }
    -[IKJSFoundation _stringForKey:fromDict:](self, "_stringForKey:fromDict:", CFSTR("port"), v10);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
    {
      -[IKJSFoundation _stringForKey:fromDict:](self, "_stringForKey:fromDict:", CFSTR("port"), v10);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKey:", v45, *MEMORY[0x1E0CB2BA8]);

    }
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("expires"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      +[IKFormatting rfc1123DateFormatter](IKFormatting, "rfc1123DateFormatter");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "dateFromString:", v46);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      if (v48)
      {
        objc_msgSend(v21, "setObject:forKey:", v48, *MEMORY[0x1E0CB2B80]);
      }
      else
      {
        ITMLKitGetLogObject(0);
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          -[IKJSFoundation setCookie:useSSCookieStorage:].cold.1((uint64_t)v46, v50, v51, v52, v53, v54, v55, v56);

      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v21, "setObject:forKey:", v46, *MEMORY[0x1E0CB2B80]);
    }
    v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3670]), "initWithProperties:", v21);
    if (v57)
    {
      if (v4)
      {
        objc_msgSend(MEMORY[0x1E0DAF680], "sharedStorage");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v63[0] = v57;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 1);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "setCookies:forUserIdentifier:", v59, &unk_1E9F8C800);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3678], "sharedHTTPCookieStorage");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "setCookie:", v57);
      }

      v49 = 0;
    }
    else
    {
      v49 = CFSTR("failed to create cookie");
    }

  }
  else
  {
    v49 = CFSTR("invalid argument");
  }
  if (-[__CFString length](v49, "length"))
  {
    -[IKJSFoundation appContext](self, "appContext");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setException:withErrorMessage:", 0, v49);

  }
}

- (void)clearCookies
{
  id v2;

  objc_msgSend(MEMORY[0x1E0DAF680], "sharedStorage");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllCookies");

}

- (id)_stringForKey:(id)a3 fromDict:(id)a4
{
  void *v4;
  id v5;

  objc_msgSend(a4, "objectForKeyedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "length"))
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (IKAppContext)appContext
{
  return (IKAppContext *)objc_loadWeakRetained((id *)&self->_appContext);
}

- (void)setAppContext:(id)a3
{
  objc_storeWeak((id *)&self->_appContext, a3);
}

- (NSMutableDictionary)jsTimers
{
  return self->_jsTimers;
}

- (void)setJsTimers:(id)a3
{
  objc_storeStrong((id *)&self->_jsTimers, a3);
}

- (NSMutableDictionary)dateFormatterCache
{
  return self->_dateFormatterCache;
}

- (void)setDateFormatterCache:(id)a3
{
  objc_storeStrong((id *)&self->_dateFormatterCache, a3);
}

- (IKAppDeviceConfig)deviceConfig
{
  return (IKAppDeviceConfig *)objc_loadWeakRetained((id *)&self->_deviceConfig);
}

- (void)setDeviceConfig:(id)a3
{
  objc_storeWeak((id *)&self->_deviceConfig, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_deviceConfig);
  objc_storeStrong((id *)&self->_dateFormatterCache, 0);
  objc_storeStrong((id *)&self->_jsTimers, 0);
  objc_destroyWeak((id *)&self->_appContext);
}

- (void)_clearTimer:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D95F2000, a2, a3, "Unknown timer: %@", a5, a6, a7, a8, 2u);
}

- (void)setCookie:(uint64_t)a3 useSSCookieStorage:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D95F2000, a2, a3, "Failed to convert [%@] to date", a5, a6, a7, a8, 2u);
}

@end
