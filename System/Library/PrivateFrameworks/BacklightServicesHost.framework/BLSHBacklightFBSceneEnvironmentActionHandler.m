@implementation BLSHBacklightFBSceneEnvironmentActionHandler

- (id)respondToActions:(id)a3 forFBScene:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(v5, "mutableCopy");
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v12);
        bls_scenes_log();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v26 = v13;
          _os_log_debug_impl(&dword_2145AC000, v14, OS_LOG_TYPE_DEBUG, "respondToActions: action: %@", buf, 0xCu);
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v15 = v13;
          bls_scenes_log();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v26 = v15;
            _os_log_debug_impl(&dword_2145AC000, v16, OS_LOG_TYPE_DEBUG, "respondToActions: matched action: %@", buf, 0xCu);
          }

          objc_msgSend(v6, "backlightSceneHostEnvironment");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "reason");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "clientDidRequestInvalidationForReason:", v18);

          objc_msgSend(v7, "removeObject:", v15);
        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v10);
  }

  v19 = (void *)objc_msgSend(v7, "copy");
  return v19;
}

@end
