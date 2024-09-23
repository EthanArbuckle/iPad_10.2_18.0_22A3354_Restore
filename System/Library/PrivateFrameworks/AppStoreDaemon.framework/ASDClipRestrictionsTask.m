@implementation ASDClipRestrictionsTask

- (ASDClipRestrictionsTask)initWithDictionary:(id)a3
{
  return -[ASDClipRestrictionsTask initWithDictionary:verificationDate:](self, "initWithDictionary:verificationDate:", a3, 0);
}

- (ASDClipRestrictionsTask)initWithDictionary:(id)a3 verificationDate:(id)a4
{
  id v7;
  id v8;
  ASDClipRestrictionsTask *v9;
  ASDClipRestrictionsTask *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ASDClipRestrictionsTask;
  v9 = -[ASDClipRestrictionsTask init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dictionary, a3);
    objc_storeStrong((id *)&v10->_verificationDate, a4);
    -[ASDClipRestrictionsTask _verifyRequest]((uint64_t)v10);
  }

  return v10;
}

- (void)_verifyRequest
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  id v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  int v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 16), "objectForKeyedSubscript:", CFSTR("attributes"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("appContentRatingsBySystem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("appsApple"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("value"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    ASDLogHandleForCategory(12);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LOWORD(v39) = 0;
      _os_log_impl(&dword_19A03B000, v6, OS_LOG_TYPE_INFO, "Performing age verification", (uint8_t *)&v39, 2u);
    }

    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "effectiveValueForSetting:", *MEMORY[0x1E0D470B0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "integerValue");
    objc_msgSend(*(id *)(a1 + 16), "objectForKeyedSubscript:", CFSTR("attributes"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("appContentRatingsBySystem"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("appsApple"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("value"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
      v14 = objc_msgSend(v13, "integerValue");
    else
      v14 = 0;
    ASDLogHandleForCategory(12);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v39 = 134218240;
      v40 = v14;
      v41 = 2048;
      v42 = v9;
      _os_log_impl(&dword_19A03B000, v16, OS_LOG_TYPE_INFO, "Verfiying app rank: %ld to restrictionsRank: %ld", (uint8_t *)&v39, 0x16u);
    }

    if (v14 <= v9)
    {
      v15 = 0;
    }
    else
    {
      ASDLogHandleForCategory(12);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v39) = 0;
        _os_log_error_impl(&dword_19A03B000, v17, OS_LOG_TYPE_ERROR, "Age verificaton failed", (uint8_t *)&v39, 2u);
      }

      v15 = 1;
    }

  }
  else
  {
    v15 = 0;
  }
  objc_msgSend(*(id *)(a1 + 16), "objectForKeyedSubscript:", CFSTR("attributes"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("permissions"));
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    objc_msgSend(*(id *)(a1 + 16), "objectForKeyedSubscript:", CFSTR("attributes"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("permissions"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 16), "objectForKeyedSubscript:", CFSTR("attributes"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("permissions"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "containsObject:", CFSTR("koreanAgeVerification"));

      if (!v25)
        goto LABEL_41;
      objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "ams_activeiTunesAccount");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
        ASDLogHandleForCategory(12);
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v39) = 0;
          _os_log_error_impl(&dword_19A03B000, v27, OS_LOG_TYPE_ERROR, "AppStore account required to verify Korean age verification", (uint8_t *)&v39, 2u);
        }

      }
      ASDLogHandleForCategory(12);
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        LOWORD(v39) = 0;
        _os_log_impl(&dword_19A03B000, v28, OS_LOG_TYPE_INFO, "Performing Korean age verification", (uint8_t *)&v39, 2u);
      }

      objc_msgSend(v18, "ams_accountFlagValueForAccountFlag:", *MEMORY[0x1E0CFD778]);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)(objc_msgSend(v21, "longLongValue") / 1000));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v20 = 0;
      }
      v29 = *(void **)(a1 + 24);
      if (v29)
      {
        v30 = v29;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v30 = (id)objc_claimAutoreleasedReturnValue();
      }
      v22 = v30;

      ASDLogHandleForCategory(12);
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        v39 = 138412546;
        v40 = (uint64_t)v22;
        v41 = 2112;
        v42 = (uint64_t)v20;
        _os_log_impl(&dword_19A03B000, v31, OS_LOG_TYPE_INFO, "Verfiying currentDate: %@ is before expirationDate: %@", (uint8_t *)&v39, 0x16u);
      }

      if (!v20 || objc_msgSend(v22, "compare:", v20) != -1)
      {
        ASDLogHandleForCategory(12);
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v39) = 0;
          _os_log_error_impl(&dword_19A03B000, v32, OS_LOG_TYPE_ERROR, "Korean age verification failed", (uint8_t *)&v39, 2u);
        }

        v15 |= 2uLL;
      }
    }

  }
LABEL_41:
  objc_msgSend(*(id *)(a1 + 16), "objectForKeyedSubscript:", CFSTR("attributes"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("platformAttributes"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("ios"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("minimumOSVersion"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CFDA50], "productVersion");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37)
    {
      if (objc_msgSend(v36, "compare:options:", v37, 64) == 1)
        v15 |= 4uLL;
    }
    else
    {
      ASDLogHandleForCategory(12);
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v39) = 0;
        _os_log_error_impl(&dword_19A03B000, v38, OS_LOG_TYPE_ERROR, "Unable to read device OS version, skipping minimum OS version check!", (uint8_t *)&v39, 2u);
      }

    }
  }
  *(_QWORD *)(a1 + 8) = v15;

}

- (ASDClipRestrictionsTask)initWithClipRequest:(id)a3
{
  void *v4;
  ASDClipRestrictionsTask *v5;

  objc_msgSend(a3, "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ASDClipRestrictionsTask initWithDictionary:verificationDate:](self, "initWithDictionary:verificationDate:", v4, 0);

  return v5;
}

- (ASDClipRestrictionsTask)initWithClipRequest:(id)a3 verificationDate:(id)a4
{
  id v6;
  id v7;
  ASDClipRestrictionsTask *v8;
  void *v9;
  uint64_t v10;
  NSDictionary *dictionary;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ASDClipRestrictionsTask;
  v8 = -[ASDClipRestrictionsTask init](&v13, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    dictionary = v8->_dictionary;
    v8->_dictionary = (NSDictionary *)v10;

    objc_storeStrong((id *)&v8->_verificationDate, a4);
    -[ASDClipRestrictionsTask _verifyRequest]((uint64_t)v8);
  }

  return v8;
}

- (BOOL)hasErrorStatus
{
  return -[ASDClipRestrictionsTask responseCode](self, "responseCode") != 0;
}

- (BOOL)hasResponseFlag:(int64_t)a3
{
  return (-[ASDClipRestrictionsTask responseCode](self, "responseCode") & a3) != 0;
}

- (int64_t)responseCode
{
  return self->_responseCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verificationDate, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end
