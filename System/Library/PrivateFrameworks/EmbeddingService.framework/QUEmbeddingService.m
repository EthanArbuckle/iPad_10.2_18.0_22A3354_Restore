@implementation QUEmbeddingService

- (QUEmbeddingService)initWithLocale:(id)a3 version:(id)a4
{
  id v7;
  id v8;
  QUEmbeddingService *v9;
  QUEmbeddingService *v10;
  uint64_t v11;
  NSString *version;
  CDMClient *v13;
  CDMClient *cdmClient;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)QUEmbeddingService;
  v9 = -[QUEmbeddingService init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_locale, a3);
    v11 = objc_msgSend(v8, "copy");
    version = v10->_version;
    v10->_version = (NSString *)v11;

    v13 = (CDMClient *)objc_alloc_init(MEMORY[0x24BE10358]);
    cdmClient = v10->_cdmClient;
    v10->_cdmClient = v13;

  }
  return v10;
}

- (void)loadWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  CDMClient *cdmClient;
  NSString *version;
  NSLocale *locale;
  _QWORD v17[5];
  id v18;
  uint8_t buf[16];
  _QWORD v20[4];
  id v21;
  _QWORD block[4];
  id v23;

  v4 = a3;
  v5 = (void *)gTestEmbeddings;
  if (gTestEmbeddings)
  {
    -[NSLocale localeIdentifier](self->_locale, "localeIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __48__QUEmbeddingService_loadWithCompletionHandler___block_invoke;
      block[3] = &unk_250BB16C0;
      v23 = v4;
      dispatch_async(v8, block);

      v9 = v23;
    }
    else
    {
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __48__QUEmbeddingService_loadWithCompletionHandler___block_invoke_2;
      v20[3] = &unk_250BB16C0;
      v21 = v4;
      dispatch_async(v8, v20);

      v9 = v21;
    }
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23A897000, v10, OS_LOG_TYPE_INFO, "[QPNLU] Setting up CDMClient", buf, 2u);
    }

    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_signpost_id_make_with_pointer(v12, self);

    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_23A897000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v13, "CDMClient setup", (const char *)&unk_23A899F61, buf, 2u);
    }

    version = self->_version;
    cdmClient = self->_cdmClient;
    locale = self->_locale;
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __48__QUEmbeddingService_loadWithCompletionHandler___block_invoke_90;
    v17[3] = &unk_250BB16E8;
    v17[4] = self;
    v18 = v4;
    -[CDMClient setupWithLocale:embeddingVersion:completionHandler:](cdmClient, "setupWithLocale:embeddingVersion:completionHandler:", locale, version, v17);
    v9 = v18;
  }

}

+ (id)signpostLog
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__QUEmbeddingService_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken != -1)
    dispatch_once(&signpostLog_onceToken, block);
  return (id)signpostLog_log;
}

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __25__QUEmbeddingService_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken != -1)
    dispatch_once(&log_onceToken, block);
  return (id)log_log;
}

void __25__QUEmbeddingService_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.queryunderstanding", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log;
  log_log = (uint64_t)v1;

}

void __33__QUEmbeddingService_signpostLog__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.spotlight.QueryParser", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)signpostLog_log;
  signpostLog_log = (uint64_t)v1;

}

+ (void)setTestEmbeddings:(id)a3
{
  objc_storeStrong((id *)&gTestEmbeddings, a3);
}

+ (id)testEmbeddings
{
  return (id)gTestEmbeddings;
}

+ (BOOL)isUnitTested
{
  if (isUnitTested_onceToken != -1)
    dispatch_once(&isUnitTested_onceToken, &__block_literal_global);
  return isUnitTested_isUnitTested;
}

void __34__QUEmbeddingService_isUnitTested__block_invoke()
{
  Class v0;
  Class v1;
  SEL v2;
  void *v3;
  id v4;

  v0 = NSClassFromString(CFSTR("XCTestProbe"));
  if (v0)
  {
    v1 = v0;
    v2 = NSSelectorFromString(CFSTR("isTesting"));
    -[objc_class methodSignatureForSelector:](v1, "methodSignatureForSelector:", v2);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE98], "invocationWithMethodSignature:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSelector:", v2);
    objc_msgSend(v3, "invokeWithTarget:", v1);
    objc_msgSend(v3, "getReturnValue:", &isUnitTested_isUnitTested);

  }
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  objc_msgSend((id)objc_opt_class(), "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23A897000, v3, OS_LOG_TYPE_DEFAULT, "[QPNLU] Deallocating QUEmbeddingService and releasing CDMClient", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)QUEmbeddingService;
  -[QUEmbeddingService dealloc](&v4, sel_dealloc);
}

uint64_t __48__QUEmbeddingService_loadWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __48__QUEmbeddingService_loadWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("QUEmbeddingServiceTestError"), -1, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __48__QUEmbeddingService_loadWithCompletionHandler___block_invoke_90(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t v7[16];

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_make_with_pointer(v5, *(const void **)(a1 + 32));

  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_23A897000, v4, OS_SIGNPOST_INTERVAL_END, v6, "CDMClient setup", (const char *)&unk_23A899F61, v7, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)getEmbeddingForQuery:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *p_super;
  id *v11;
  id *v12;
  NSLocale *v13;
  id v14;
  NSLocale *v15;
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  CDMClient *cdmClient;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  NSLocale *v24;
  QUEmbeddingService *v25;
  id v26;
  _QWORD block[4];
  void *v28;
  id v29;
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (gTestEmbeddings)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23A897000, v8, OS_LOG_TYPE_DEBUG, "Use embedding from test data", buf, 2u);
    }

    objc_msgSend((id)gTestEmbeddings, "objectForKeyedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(0, 0);
    p_super = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __61__QUEmbeddingService_getEmbeddingForQuery_completionHandler___block_invoke;
    block[3] = &unk_250BB1710;
    v11 = &v29;
    v12 = &v28;
    v28 = v9;
    v29 = v7;
    v13 = v9;
    v14 = v7;
    dispatch_async(p_super, block);
  }
  else
  {
    v15 = self->_locale;
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v16 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_signpost_id_make_with_pointer(v17, self);

    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v6;
      _os_signpost_emit_with_name_impl(&dword_23A897000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v18, "CDMClient getEmbeddingForQuery", "Query = %@", buf, 0xCu);
    }

    cdmClient = self->_cdmClient;
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __61__QUEmbeddingService_getEmbeddingForQuery_completionHandler___block_invoke_92;
    v22[3] = &unk_250BB1738;
    v11 = &v26;
    v26 = v7;
    v12 = &v23;
    v20 = v6;
    v23 = v20;
    v24 = v15;
    v25 = self;
    v21 = v7;
    v13 = v15;
    -[CDMClient processEmbeddingRequest:completionHandler:](cdmClient, "processEmbeddingRequest:completionHandler:", v20, v22);
    p_super = &v24->super;
  }

}

uint64_t __61__QUEmbeddingService_getEmbeddingForQuery_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __61__QUEmbeddingService_getEmbeddingForQuery_completionHandler___block_invoke_92(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  int64_t v13;
  int v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int64_t v27;
  void *v28;
  int v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  int v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t j;
  uint64_t v44;
  unint64_t v45;
  void *v46;
  double v47;
  void *v48;
  uint64_t v49;
  NSObject *v50;
  void *v51;
  QUEmbeddingOutput *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  NSObject *v58;
  os_signpost_id_t v59;
  id v60;
  void *v61;
  char v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  NSObject *obj;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unsigned int v72;
  void *v73;
  uint64_t v74;
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint8_t buf[4];
  void *v81;
  __int16 v82;
  void *v83;
  _BYTE v84[128];
  uint64_t v85;
  NSRange v86;

  v85 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = v6;
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    goto LABEL_60;
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v66, "count"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v5;
  objc_msgSend(v5, "subwordTokenChain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(*(id *)(a1 + 32), "length");
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v61 = v9;
  objc_msgSend(v9, "subwordTokens");
  v12 = objc_claimAutoreleasedReturnValue();
  v63 = v8;
  v74 = a1;
  v70 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v76, v84, 16);
  if (!v70)
  {
    v5 = v60;
LABEL_43:
    v73 = v10;

    goto LABEL_45;
  }
  v13 = 0;
  v62 = 0;
  v72 = 0;
  v14 = 0;
  v68 = 0;
  v69 = *(_QWORD *)v77;
  v71 = 0x7FFFFFFFFFFFFFFFLL;
  obj = v12;
  do
  {
    for (i = 0; i != v70; ++i)
    {
      if (*(_QWORD *)v77 != v69)
        objc_enumerationMutation(obj);
      v16 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
      objc_msgSend(v16, "value");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v17);

      if (objc_msgSend(v16, "tokenIndex") == v14)
      {
        ++v72;
      }
      else
      {
        if (v14 >= 1)
        {
          v18 = (void *)objc_msgSend(v10, "copy");
          objc_msgSend(v66, "addObject:", v18);

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v72);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "addObject:", v19);

          objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", v71, v68);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "addObject:", v20);

        }
        objc_msgSend(MEMORY[0x24BDD16A8], "string");
        v21 = objc_claimAutoreleasedReturnValue();

        v14 = objc_msgSend(v16, "tokenIndex");
        v72 = 1;
        v10 = (void *)v21;
      }
      objc_msgSend(v16, "value");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "characterAtIndex:", 0);
      if (v23 == 9601)
      {
        objc_msgSend(v22, "substringFromIndex:", 1);
        v24 = objc_claimAutoreleasedReturnValue();

        v22 = (void *)v24;
      }
      v73 = v10;
      objc_msgSend(v10, "appendString:", v22);
      v25 = objc_msgSend(*(id *)(a1 + 32), "rangeOfString:options:range:locale:", v22, 129, v13, v11 - v13, *(_QWORD *)(a1 + 40));
      if (v25 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v27 = v13;
        if (objc_msgSend(v22, "length") == 1)
        {
          objc_msgSend(MEMORY[0x24BDD14A8], "punctuationCharacterSet");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "characterIsMember:", objc_msgSend(v22, "characterAtIndex:", 0));

          v27 = v13;
          if (v29)
          {
            v27 = v13;
            if (v11 > v13)
            {
              v27 = v13;
              while (1)
              {
                objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                v31 = objc_msgSend(v30, "characterIsMember:", objc_msgSend(*(id *)(v74 + 32), "characterAtIndex:", v27));

                if (!v31)
                  break;
                if (v11 == ++v27)
                {
                  v27 = v11;
                  goto LABEL_29;
                }
              }
              objc_msgSend(MEMORY[0x24BDD14A8], "punctuationCharacterSet");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = objc_msgSend(v33, "characterIsMember:", objc_msgSend(*(id *)(v74 + 32), "characterAtIndex:", v27));

              if (v34)
              {
                v26 = 1;
                v8 = v63;
                a1 = v74;
                goto LABEL_24;
              }
LABEL_29:
              v8 = v63;
            }
          }
        }
        if ((objc_msgSend(v22, "isEqualToString:", CFSTR("[CLS]")) & 1) != 0)
        {
          v13 = v27;
          a1 = v74;
        }
        else
        {
          a1 = v74;
          if ((objc_msgSend(v22, "isEqualToString:", CFSTR("[SEP]")) & 1) == 0)
          {
            objc_msgSend((id)objc_opt_class(), "log");
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              v86.location = v13;
              v86.length = v11 - v13;
              NSStringFromRange(v86);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v81 = v22;
              v82 = 2112;
              v83 = v36;
              _os_log_impl(&dword_23A897000, v35, OS_LOG_TYPE_DEFAULT, "[QPNLU] Could not find %@ with range %@", buf, 0x16u);

            }
            v62 = 1;
          }
          v13 = v27;
        }
      }
      else
      {
        v27 = v25;
LABEL_24:
        v32 = v71;
        if (v23 == 9601)
          v32 = v27;
        v13 = v26 + v27;
        v71 = v32;
        v68 = v26 + v27 - v32;
      }

    }
    v70 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v76, v84, 16);
  }
  while (v70);

  if ((v62 & 1) != 0)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v12 = objc_claimAutoreleasedReturnValue();
    v5 = v60;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23A897000, v12, OS_LOG_TYPE_FAULT, "[QPNLU] Could not find ranges of one or more tokens in the input query string.", buf, 2u);
    }
    goto LABEL_43;
  }
  v5 = v60;
LABEL_45:
  objc_msgSend(v5, "subwordTokenEmbedding");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "embeddingTensor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = 0;
  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBFFF0]), "initWithShape:dataType:error:", &unk_250BB21B8, 65568, &v75);
  v7 = v75;
  if (objc_msgSend(v38, "embeddingDim") == 192
    && (v40 = objc_msgSend(v38, "numToken"),
        objc_msgSend(v61, "subwordTokens"),
        v41 = (void *)objc_claimAutoreleasedReturnValue(),
        v42 = objc_msgSend(v41, "count") - 2,
        v41,
        v40 == v42))
  {
    for (j = 0; j != 5376; ++j)
      objc_msgSend(v39, "setObject:atIndexedSubscript:", &unk_250BB21D0, j);
    v44 = objc_msgSend(v38, "numToken");
    if (objc_msgSend(v38, "embeddingDim") * v44)
    {
      v45 = 0;
      do
      {
        v46 = (void *)MEMORY[0x24BDD16E0];
        LODWORD(v47) = *(_DWORD *)(objc_msgSend(v38, "values") + 4 * v45);
        objc_msgSend(v46, "numberWithFloat:", v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setObject:atIndexedSubscript:", v48, v45 + 192);

        ++v45;
        v49 = objc_msgSend(v38, "numToken");
      }
      while (objc_msgSend(v38, "embeddingDim") * v49 > v45);
    }
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT))
    {
      v51 = *(void **)(v74 + 32);
      *(_DWORD *)buf = 138412290;
      v81 = v51;
      _os_log_impl(&dword_23A897000, v50, OS_LOG_TYPE_FAULT, "[QPNLU] Invalid embedding from query: %@", buf, 0xCu);
    }

  }
  v52 = objc_alloc_init(QUEmbeddingOutput);
  -[QUEmbeddingOutput setEmbedding:](v52, "setEmbedding:", v39);
  v53 = (void *)objc_msgSend(v66, "copy");
  -[QUEmbeddingOutput setTokens:](v52, "setTokens:", v53);

  v54 = (void *)objc_msgSend(v65, "copy");
  -[QUEmbeddingOutput setTokenRanges:](v52, "setTokenRanges:", v54);

  v55 = (void *)objc_msgSend(v64, "copy");
  -[QUEmbeddingOutput setSubtokenLenForTokens:](v52, "setSubtokenLenForTokens:", v55);

  objc_msgSend(v63, "subarrayWithRange:", 1, objc_msgSend(v63, "count") - 2);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[QUEmbeddingOutput setSubtokens:](v52, "setSubtokens:", v56);

  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v57 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v58 = objc_claimAutoreleasedReturnValue();
  v59 = os_signpost_id_make_with_pointer(v58, *(const void **)(v74 + 48));

  if (v59 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v57))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_23A897000, v57, OS_SIGNPOST_INTERVAL_END, v59, "CDMClient getEmbeddingForQuery", (const char *)&unk_23A899F61, buf, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(v74 + 56) + 16))();
LABEL_60:

}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (CDMClient)cdmClient
{
  return self->_cdmClient;
}

- (void)setCdmClient:(id)a3
{
  objc_storeStrong((id *)&self->_cdmClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cdmClient, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

@end
