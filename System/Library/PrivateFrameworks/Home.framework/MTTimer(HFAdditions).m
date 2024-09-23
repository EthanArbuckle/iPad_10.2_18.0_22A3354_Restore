@implementation MTTimer(HFAdditions)

- (uint64_t)isEqual:()HFAdditions
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    objc_msgSend(a1, "timerID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timerID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "hmf_isEqualToUUID:", v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (uint64_t)hash
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "timerID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "hash");

  return v2;
}

- (id)hf_targetAccessoryInHome:()HFAdditions
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v27;
  _QWORD v28[4];
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "siriContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D148D0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithString:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject scheme](v7, "scheme");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("siri-hk-target")) & 1) != 0)
    {
      -[NSObject path](v7, "path");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("accessory"));

      if (v10)
      {
        v32 = 0u;
        v33 = 0u;
        v30 = 0u;
        v31 = 0u;
        -[NSObject queryItems](v7, "queryItems");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        if (v12)
        {
          v13 = v12;
          v27 = v7;
          v14 = *(_QWORD *)v31;
          while (2)
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v31 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
              objc_msgSend(v16, "name");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(CFSTR("identifier"), "isEqualToString:", v17);

              if (v18)
              {
                objc_msgSend(v16, "value");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                if (v19)
                {
                  v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v19);
                  if (v20)
                  {
                    v21 = (void *)v20;

                    goto LABEL_24;
                  }
                }

              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
            if (v13)
              continue;
            break;
          }
          v21 = 0;
LABEL_24:
          v7 = v27;
        }
        else
        {
          v21 = 0;
        }

        goto LABEL_27;
      }
    }
    else
    {

    }
    v21 = 0;
LABEL_27:
    objc_msgSend(v4, "accessories");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __49__MTTimer_HFAdditions__hf_targetAccessoryInHome___block_invoke;
    v28[3] = &unk_1EA727840;
    v29 = v21;
    v25 = v21;
    objc_msgSend(v24, "na_firstObjectPassingTest:", v28);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_28:
    goto LABEL_29;
  }
  objc_msgSend(a1, "siriContext");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    HFLogForCategory(4uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v36 = a1;
      v37 = 2112;
      v38 = v4;
      _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "No targetReference found for alarm: %@ in home: %@", buf, 0x16u);
    }
    v23 = 0;
    goto LABEL_28;
  }
  v23 = 0;
LABEL_29:

  return v23;
}

@end
