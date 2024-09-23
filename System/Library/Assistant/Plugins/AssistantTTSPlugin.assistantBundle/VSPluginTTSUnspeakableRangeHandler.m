@implementation VSPluginTTSUnspeakableRangeHandler

- (void)performWithCompletion:(id)a3
{
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void (**v29)(id, void *);
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint8_t v44[128];
  uint8_t buf[4];
  VSPluginTTSUnspeakableRangeHandler *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v29 = (void (**)(id, void *))a3;
  VSGetLogDefault();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v46 = self;
    _os_log_impl(&dword_21CBCE000, v4, OS_LOG_TYPE_INFO, "ttsGetUnspeakableRangeOfText= %@", buf, 0xCu);
  }

  v28 = objc_alloc_init(MEMORY[0x24BE81810]);
  v5 = objc_alloc(MEMORY[0x24BEC0DE0]);
  -[SATTSGetUnspeakableRangeOfText locale](self, "locale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithLanguage:", v6);

  v8 = 0x24BDBC000uLL;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  -[SATTSGetUnspeakableRangeOfText texts](self, "texts");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v40;
    v31 = v9;
    v32 = v7;
    v30 = *(_QWORD *)v40;
    do
    {
      v13 = 0;
      v33 = v11;
      do
      {
        if (*(_QWORD *)v40 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v13);
        objc_msgSend(*(id *)(v8 + 3768), "array");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          objc_msgSend(v7, "unspeakableRangeOfText:", v14);
          v16 = (id)objc_claimAutoreleasedReturnValue();
          v35 = 0u;
          v36 = 0u;
          v37 = 0u;
          v38 = 0u;
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v36;
            do
            {
              for (i = 0; i != v18; ++i)
              {
                if (*(_QWORD *)v36 != v19)
                  objc_enumerationMutation(v16);
                v21 = objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "rangeValue");
                v23 = v22;
                v24 = objc_alloc_init(MEMORY[0x24BE81508]);
                objc_msgSend(v24, "setStart:", v21);
                objc_msgSend(v24, "setLength:", v23);
                objc_msgSend(v24, "dictionary");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "addObject:", v25);

              }
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
            }
            while (v18);
            v9 = v31;
            v7 = v32;
            v8 = 0x24BDBC000;
            v12 = v30;
            v11 = v33;
          }
        }
        else
        {
          v16 = objc_alloc_init(MEMORY[0x24BE81508]);
          objc_msgSend(v16, "setStart:", 0);
          objc_msgSend(v16, "setLength:", objc_msgSend(v14, "length"));
          objc_msgSend(v16, "dictionary");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v26);

        }
        objc_msgSend(v9, "addObject:", v15);

        ++v13;
      }
      while (v13 != v11);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v11);
  }

  objc_msgSend(v28, "setResults:", v9);
  if (v29)
  {
    objc_msgSend(v28, "dictionary");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v29[2](v29, v27);

  }
}

@end
