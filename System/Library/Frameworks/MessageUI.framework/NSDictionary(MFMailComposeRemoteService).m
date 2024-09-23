@implementation NSDictionary(MFMailComposeRemoteService)

- (id)mf_filterUsingMap:()MFMailComposeRemoteService inverse:
{
  id v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t i;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  __int128 v21;
  id v22;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  NSObject *v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(a1, "count"));
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(a1, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  obj = v6;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v7)
  {
    v9 = *(_QWORD *)v26;
    *(_QWORD *)&v8 = 138412546;
    v21 = v8;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(obj);
        v11 = *(NSObject **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKey:", v11, v21);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          MFLogGeneral();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v30 = v11;
            _os_log_impl(&dword_1AB96A000, v13, OS_LOG_TYPE_DEFAULT, "#Warning Unexpected key (%@).", buf, 0xCu);
          }
          goto LABEL_23;
        }
        objc_msgSend(a1, "objectForKey:", v11);
        v13 = objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            MFLogGeneral();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              v16 = (objc_class *)objc_opt_class();
              NSStringFromClass(v16);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v21;
              v30 = v13;
              v31 = 2112;
              v32 = v17;
              _os_log_impl(&dword_1AB96A000, v15, OS_LOG_TYPE_DEFAULT, "#Warning Value (%@) of unexpected class (%@).", buf, 0x16u);

            }
LABEL_22:

LABEL_23:
            v18 = 0;
            goto LABEL_24;
          }
          -[NSObject mf_filterUsingMap:inverse:](v13, "mf_filterUsingMap:inverse:", v12, a4);
          v14 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v12, "transformValue:inverse:", v13, a4);
            v14 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              MFLogGeneral();
              v15 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                NSStringFromClass((Class)v12);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v21;
                v30 = v13;
                v31 = 2112;
                v32 = v19;
                _os_log_impl(&dword_1AB96A000, v15, OS_LOG_TYPE_DEFAULT, "#Warning Value (%@) of unexpected class (%@).", buf, 0x16u);

              }
              goto LABEL_22;
            }
            v14 = v13;
          }
        }
        v18 = v14;

        if (v18)
          objc_msgSend(v22, "setObject:forKey:", v18, v11);
LABEL_24:

      }
      v6 = obj;
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v7);
  }

  return v22;
}

@end
