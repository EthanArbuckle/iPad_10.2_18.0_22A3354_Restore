@implementation KMLanguageModelBridge

- (KMLanguageModelBridge)initWithLanguageCode:(id)a3
{
  id v5;
  KMLanguageModelBridge *v6;
  KMLanguageModelBridge *v7;
  KVItemBuilder *v8;
  KVItemBuilder *builder;
  KMLanguageModelBridge *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)KMLanguageModelBridge;
  v6 = -[KMLanguageModelBridge init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    if (!v5)
    {
      v10 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v6->_languageCode, a3);
    v8 = (KVItemBuilder *)objc_alloc_init(MEMORY[0x24BE5E8E8]);
    builder = v7->_builder;
    v7->_builder = v8;

  }
  v10 = v7;
LABEL_6:

  return v10;
}

- (unsigned)cascadeItemType
{
  return *MEMORY[0x24BE15620];
}

- (id)originAppId
{
  return (id)*MEMORY[0x24BE5E8A0];
}

- (BOOL)enumerateItemsWithError:(id *)a3 usingBlock:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSString *v18;
  NSString *v20;
  NSString *languageCode;
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint8_t v28[4];
  const char *v29;
  __int16 v30;
  NSString *v31;
  _BYTE buf[24];
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  void *v37;
  _QWORD v38[3];
  _QWORD v39[4];

  v39[3] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  AFKeyboardLMLocaleOverride();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BE5EE60];
  v38[0] = *MEMORY[0x24BE5EEB8];
  v38[1] = v7;
  v39[0] = v6;
  v39[1] = MEMORY[0x24BDBD1C8];
  v38[2] = *MEMORY[0x24BE5EE78];
  AFKeyboardResourcesDirectoryPath();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v39[2] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, v38, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (LMLanguageModelCreate())
  {
    v27 = 0;
    if ((LMLanguageModelGetDynamicTokenIDRange() & 1) != 0)
    {
      v23 = 0;
      v24 = &v23;
      v25 = 0x2020000000;
      v26 = 0;
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v33 = __Block_byref_object_copy__858;
      v34 = __Block_byref_object_dispose__859;
      v35 = 0;
      v22 = v5;
      LMLanguageModelEnumerateDynamicTokensWithBlock();
      LMLanguageModelRelease();
      v10 = *((_BYTE *)v24 + 24) == 0;
      if (*((_BYTE *)v24 + 24))
      {
        v11 = KMLogContextCore;
        if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
        {
          languageCode = self->_languageCode;
          *(_DWORD *)v28 = 136315394;
          v29 = "-[KMLanguageModelBridge enumerateItemsWithError:usingBlock:]";
          v30 = 2112;
          v31 = languageCode;
          _os_log_error_impl(&dword_218838000, v11, OS_LOG_TYPE_ERROR, "%s Enumeration failed while fetching dynamic tokens for Keyboard from LanguageModel for language=%@", v28, 0x16u);
        }
        KVSetError();
      }

      _Block_object_dispose(buf, 8);
      _Block_object_dispose(&v23, 8);
    }
    else
    {
      v17 = KMLogContextCore;
      v10 = 1;
      if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_INFO))
      {
        v18 = self->_languageCode;
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[KMLanguageModelBridge enumerateItemsWithError:usingBlock:]";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v18;
        _os_log_impl(&dword_218838000, v17, OS_LOG_TYPE_INFO, "%s No dynamic tokens for language=%@", buf, 0x16u);
      }
    }
  }
  else
  {
    v12 = KMLogContextCore;
    if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
    {
      v20 = self->_languageCode;
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[KMLanguageModelBridge enumerateItemsWithError:usingBlock:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v20;
      _os_log_error_impl(&dword_218838000, v12, OS_LOG_TYPE_ERROR, "%s Could not get dynamic vocabulary for Keyboard from LanguageModel for language=%@", buf, 0x16u);
    }
    v13 = (void *)MEMORY[0x24BDD1540];
    v36 = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Could not get dynamic vocabulary for Keyboard from LanguageModel for language=%@"), self->_languageCode);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.vocabulary.donate.keyboard"), 2, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    KVSetError();

    v10 = 0;
  }

  return v10;
}

- (id)_getItemWithTokenID:(unsigned int)a3 dynamicToken:(id)a4 error:(id *)a5
{
  uint64_t v6;
  id v8;
  KVItemBuilder *builder;
  void *v10;
  id v11;
  id v12;
  void *v13;

  v6 = *(_QWORD *)&a3;
  v8 = a4;
  builder = self->_builder;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)-[KVItemBuilder setItemType:itemId:error:](builder, "setItemType:itemId:error:", 10, v10, a5);

  v12 = (id)-[KVItemBuilder addFieldWithType:value:error:](self->_builder, "addFieldWithType:value:error:", 400, v8, a5);
  -[KVItemBuilder buildItemWithError:](self->_builder, "buildItemWithError:", a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_builder, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
}

void __60__KMLanguageModelBridge_enumerateItemsWithError_usingBlock___block_invoke(uint64_t a1, unsigned int a2, _BYTE *a3)
{
  uint64_t StringForTokenID;
  void *v6;
  void *v7;
  float v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id obj;

  StringForTokenID = LMLanguageModelCreateStringForTokenID();
  if (StringForTokenID)
  {
    v6 = (void *)StringForTokenID;
    v7 = (void *)MEMORY[0x219A1AD04]();
    LMLanguageModelGetUsageCount();
    if (v8 <= 0.0)
    {
      CFRelease(v6);
    }
    else
    {
      v9 = v6;
      v10 = v9;
      if (a2 >= *(_DWORD *)(a1 + 72) && a2 <= *(_DWORD *)(a1 + 76))
      {
        v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        obj = *(id *)(v11 + 40);
        objc_msgSend(*(id *)(a1 + 32), "_getItemWithTokenID:dynamicToken:error:");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong((id *)(v11 + 40), obj);
        if (!v12 || ((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))() & 1) == 0)
        {
          *a3 = 1;
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
        }
        CFRelease(v10);

      }
      else
      {
        CFRelease(v9);
      }

    }
    objc_autoreleasePoolPop(v7);
  }
}

@end
