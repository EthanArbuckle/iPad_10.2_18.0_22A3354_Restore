@implementation _CDEventStreamsRegister

- (void)initWithEventStreams:(void *)a1
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _QWORD *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  uint8_t buf[4];
  const __CFString *v27;
  __int16 v28;
  void *v29;
  _BYTE v30[128];
  _QWORD v31[6];

  v31[4] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v25.receiver = a1;
    v25.super_class = (Class)_CDEventStreamsRegister;
    v4 = objc_msgSendSuper2(&v25, sel_init);
    a1 = v4;
    if (v4)
    {
      v20 = v4;
      if (!v3)
      {
        +[_DKSystemEventStreams deviceActivityLevelStream](_DKSystemEventStreams, "deviceActivityLevelStream");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v31[0] = v5;
        +[_DKSystemEventStreams appInFocusStream](_DKSystemEventStreams, "appInFocusStream");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v31[1] = v6;
        +[_DKSystemEventStreams watchNearbyStream](_DKSystemEventStreams, "watchNearbyStream");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v31[2] = v7;
        +[_DKSystemEventStreams defaultPairedDeviceNearbyStream](_DKSystemEventStreams, "defaultPairedDeviceNearbyStream");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v31[3] = v8;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 4);
        v3 = (id)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v3 = v3;
      v10 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v22;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v22 != v12)
              objc_enumerationMutation(v3);
            v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
            objc_msgSend(v9, "addObject:", v14);
            +[_CDLogging dataCollectionChannel](_CDLogging, "dataCollectionChannel");
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v14, "name");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v27 = CFSTR("enabled");
              v28 = 2112;
              v29 = v16;
              _os_log_impl(&dword_18DDBE000, v15, OS_LOG_TYPE_INFO, "Data collection %@ for stream %@", buf, 0x16u);

            }
          }
          v11 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
        }
        while (v11);
      }

      v17 = objc_msgSend(v9, "copy");
      a1 = v20;
      v18 = (void *)v20[1];
      v20[1] = v17;

    }
  }

  return a1;
}

- (id)getEventHandler:(id)a1
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  __objc2_class **v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  int v16;

  v3 = a2;
  if (a1)
  {
    +[_DKSystemEventStreams deviceActivityLevelStream](_DKSystemEventStreams, "deviceActivityLevelStream");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "isEqualToString:", v5);

    if ((v6 & 1) != 0)
    {
      v7 = off_1E26E06C0;
    }
    else
    {
      +[_DKSystemEventStreams appInFocusStream](_DKSystemEventStreams, "appInFocusStream");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v3, "isEqualToString:", v9);

      if ((v10 & 1) != 0)
      {
        v7 = off_1E26E06C8;
      }
      else
      {
        +[_DKSystemEventStreams watchActiveStream](_DKSystemEventStreams, "watchActiveStream");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v3, "isEqualToString:", v12);

        if ((v13 & 1) != 0)
        {
          v7 = off_1E26E06D8;
        }
        else
        {
          +[_DKSystemEventStreams defaultPairedDeviceNearbyStream](_DKSystemEventStreams, "defaultPairedDeviceNearbyStream");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "name");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v3, "isEqualToString:", v15);

          if (!v16)
          {
            a1 = 0;
            goto LABEL_11;
          }
          v7 = off_1E26E06D0;
        }
      }
    }
    a1 = objc_alloc_init(*v7);
  }
LABEL_11:

  return a1;
}

- (id)getEventHandlerDictForStreams
{
  id *v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[16];
  _BYTE v18[128];
  uint64_t v19;

  v1 = a1;
  v19 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v3 = v1[1];
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v14 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          objc_msgSend(v8, "name");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[_CDEventStreamsRegister getEventHandler:](v1, v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10)
          {
            objc_msgSend(v8, "name");
            v11 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "setObject:forKey:", v10, v11);
          }
          else
          {
            +[_CDLogging dataCollectionChannel](_CDLogging, "dataCollectionChannel");
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
              -[_CDEventStreamsRegister getEventHandlerDictForStreams].cold.1((uint64_t)v17, (uint64_t)v8);
          }

        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      }
      while (v5);
    }

    v1 = (id *)objc_msgSend(v2, "copy");
  }
  return v1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventStreams, 0);
}

- (void)getEventHandlerDictForStreams
{
  _QWORD *v2;
  _DWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend((id)OUTLINED_FUNCTION_18_3(a1, a2), "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *v3 = 138412290;
  *v2 = v4;
  OUTLINED_FUNCTION_7_9(&dword_18DDBE000, v5, v6, "Event handler for %@ not defined in getEventHandler method");

}

@end
