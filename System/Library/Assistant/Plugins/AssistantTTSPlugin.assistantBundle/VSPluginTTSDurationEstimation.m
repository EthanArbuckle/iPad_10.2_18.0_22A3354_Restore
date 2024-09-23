@implementation VSPluginTTSDurationEstimation

- (VSPluginTTSDurationEstimation)initWithDictionary:(id)a3
{
  id v4;
  VSPluginTTSDurationEstimation *v5;
  uint64_t v6;
  SATTSEstimateTTSRequestDuration *request;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VSPluginTTSDurationEstimation;
  v5 = -[VSPluginTTSDurationEstimation init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BE817F0]), "initWithDictionary:", v4);
    request = v5->_request;
    v5->_request = (SATTSEstimateTTSRequestDuration *)v6;

  }
  return v5;
}

- (void)performWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void (**v37)(id, _QWORD);
  id obj;
  void *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t v45[128];
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD))a3;
  VSGetLogDefault();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[VSPluginTTSDurationEstimation request](self, "request");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSPluginTTSDurationEstimation request](self, "request");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "texts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v47 = v6;
    v48 = 2112;
    v49 = v8;
    _os_log_impl(&dword_21CBCE000, v5, OS_LOG_TYPE_DEFAULT, "VSPluginTTSDurationEstimation, %@, texts: %@", buf, 0x16u);

  }
  if (v4)
  {
    -[VSPluginTTSDurationEstimation request](self, "request");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      v4[2](v4, MEMORY[0x24BDBD1B8]);
    v37 = v4;
    v10 = (void *)MEMORY[0x24BDBCEA0];
    -[VSPluginTTSDurationEstimation request](self, "request");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "locale");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localeWithLocaleIdentifier:", v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v36 = (void *)v13;
    v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE09310]), "initWithLocale:", v13);
    objc_msgSend(v39, "setHandleTTSCodes:", 1);
    v35 = objc_alloc_init(MEMORY[0x24BE817F8]);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_alloc_init(MEMORY[0x24BEC0E00]);
    v16 = objc_alloc_init(MEMORY[0x24BEC0DF8]);
    v17 = (void *)MEMORY[0x24BEC0E20];
    -[VSPluginTTSDurationEstimation request](self, "request");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "gender");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setGender:", objc_msgSend(v17, "genderFromString:", v19));

    -[VSPluginTTSDurationEstimation request](self, "request");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "locale");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setLanguageCode:", v21);

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    -[VSPluginTTSDurationEstimation request](self, "request");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "texts");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v23;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v42;
      do
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v42 != v26)
            objc_enumerationMutation(obj);
          v28 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v27);
          v40 = 0;
          objc_msgSend(v39, "parseStringWithFormat:error:", v28, &v40);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v40;
          if (v30)
          {
            VSGetLogDefault();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v47 = v28;
              v48 = 2112;
              v49 = v30;
              _os_log_error_impl(&dword_21CBCE000, v31, OS_LOG_TYPE_ERROR, "Unable to parse text: '%@', error: %@", buf, 0x16u);
            }

            v32 = v28;
            v29 = v32;
          }
          objc_msgSend(v16, "setText:", v29);
          objc_msgSend(v15, "estimateDurationOfRequest:", v16);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v33);

          ++v27;
        }
        while (v25 != v27);
        v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      }
      while (v25);
    }

    objc_msgSend(v35, "setDurations:", v14);
    objc_msgSend(v35, "dictionary");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v37;
    ((void (**)(id, void *))v37)[2](v37, v34);

  }
}

- (SATTSEstimateTTSRequestDuration)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
}

@end
