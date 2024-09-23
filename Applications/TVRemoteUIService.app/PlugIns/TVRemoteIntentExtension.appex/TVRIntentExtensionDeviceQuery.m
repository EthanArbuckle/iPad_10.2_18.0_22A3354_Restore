@implementation TVRIntentExtensionDeviceQuery

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_1);
  return (id)sharedInstance_sharedInstance_0;
}

void __47__TVRIntentExtensionDeviceQuery_sharedInstance__block_invoke(id a1)
{
  TVRIntentExtensionDeviceQuery *v1;
  void *v2;

  v1 = objc_alloc_init(TVRIntentExtensionDeviceQuery);
  v2 = (void *)sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = (uint64_t)v1;

}

- (void)provideDeviceOptionsWithCompletion:(id)a3
{
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __68__TVRIntentExtensionDeviceQuery_provideDeviceOptionsWithCompletion___block_invoke;
  v4[3] = &unk_1000105C0;
  v4[4] = self;
  v5 = a3;
  v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);

}

void __68__TVRIntentExtensionDeviceQuery_provideDeviceOptionsWithCompletion___block_invoke(uint64_t a1)
{
  id v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  void *v6;
  dispatch_time_t v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[16];

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    v2 = _TVRIntentExtensionLog();
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting device query", buf, 2u);
    }

    v4 = objc_alloc_init((Class)TVRCDeviceQuery);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 8);
    *(_QWORD *)(v5 + 8) = v4;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "start");
  }
  v7 = dispatch_time(0, 3000000000);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __68__TVRIntentExtensionDeviceQuery_provideDeviceOptionsWithCompletion___block_invoke_2;
  v9[3] = &unk_1000105C0;
  v8 = *(void **)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v8;
  dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, v9);

}

void __68__TVRIntentExtensionDeviceQuery_provideDeviceOptionsWithCompletion___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  NSObject *v21;
  _BOOL4 v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  id v31;
  _BYTE v32[128];

  v2 = objc_alloc_init((Class)NSMutableArray);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v25 = a1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "devices"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v8, "connectionType") == (id)1 && objc_msgSend(v8, "isPaired"))
        {
          v9 = _TVRIntentExtensionLog();
          v10 = objc_claimAutoreleasedReturnValue(v9);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v31 = v8;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Found paired device=%{public}@", buf, 0xCu);
          }

          v11 = objc_alloc((Class)TVRDevice);
          v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
          v15 = objc_msgSend(v11, "initWithIdentifier:displayString:pronunciationHint:", v12, v13, v14);
          objc_msgSend(v2, "addObject:", v15);

        }
        else
        {
          v16 = _TVRIntentExtensionLog();
          v12 = objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v31 = v8;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Ignoring since it is not paired or discovered via Rapport, device=%{public}@", buf, 0xCu);
          }
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    }
    while (v5);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(v25 + 32) + 8), "stop");
  v17 = *(_QWORD *)(v25 + 32);
  v18 = *(void **)(v17 + 8);
  *(_QWORD *)(v17 + 8) = 0;

  v19 = objc_msgSend(v2, "count");
  v20 = _TVRIntentExtensionLog();
  v21 = objc_claimAutoreleasedReturnValue(v20);
  v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
  if (v19)
  {
    if (v22)
    {
      *(_DWORD *)buf = 138543362;
      v31 = v2;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Calling device options completion with list=%{public}@", buf, 0xCu);
    }

    v23 = *(_QWORD *)(v25 + 40);
    v24 = objc_msgSend(objc_alloc((Class)INObjectCollection), "initWithItems:", v2);
    (*(void (**)(uint64_t, id, _QWORD))(v23 + 16))(v23, v24, 0);

  }
  else
  {
    if (v22)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Calling device options completion with nil list since no devices were found", buf, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(v25 + 40) + 16))();
  }

}

- (TVRCDeviceQuery)deviceQuery
{
  return self->_deviceQuery;
}

- (void)setDeviceQuery:(id)a3
{
  objc_storeStrong((id *)&self->_deviceQuery, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceQuery, 0);
}

@end
