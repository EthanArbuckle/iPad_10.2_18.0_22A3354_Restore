@implementation VSAMSBagLoadOperation

- (void)executionDidBegin
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[5];
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  VSDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[VSAMSBagLoadOperation executionDidBegin]";
    _os_log_impl(&dword_1D2419000, v3, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CFD9E8], "vs_defaultBag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSAMSBagLoadOperation bagKey](self, "bagKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[VSAMSBagLoadOperation bagKey](self, "bagKey");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 == CFSTR("SoleProviderFeatureEnabled"))
  {

LABEL_7:
    -[VSAMSBagLoadOperation bagKey](self, "bagKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "BOOLForKey:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v11;
    goto LABEL_8;
  }
  -[VSAMSBagLoadOperation bagKey](self, "bagKey");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v9 == CFSTR("ShowMultiAppInstallForCaseAlwaysRequirePassword"))
    goto LABEL_7;
LABEL_8:
  objc_msgSend(v6, "valuePromise");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __42__VSAMSBagLoadOperation_executionDidBegin__block_invoke;
  v13[3] = &unk_1E93A07F8;
  v13[4] = self;
  objc_msgSend(v12, "addFinishBlock:", v13);

}

- (NSString)bagKey
{
  return self->_bagKey;
}

- (void)setBagKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

void __42__VSAMSBagLoadOperation_executionDidBegin__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  VSDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "bagKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412802;
    v13 = v5;
    v14 = 2112;
    v15 = v8;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_1D2419000, v7, OS_LOG_TYPE_DEFAULT, "Finished loading value %@ for AMS bag key %@ with error %@", (uint8_t *)&v12, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "setValue:", v5);
  objc_msgSend(v6, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CFD808]))
  {

    goto LABEL_9;
  }
  v10 = objc_msgSend(v6, "code");

  if (v10 != 204)
  {
LABEL_9:
    objc_msgSend(*(id *)(a1 + 32), "setError:", v6);
    goto LABEL_10;
  }
  VSDefaultLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12) = 0;
    _os_log_impl(&dword_1D2419000, v11, OS_LOG_TYPE_DEFAULT, "Bag error was AMSErrorCodeBagValueMissing, ignoring error", (uint8_t *)&v12, 2u);
  }

LABEL_10:
  objc_msgSend(*(id *)(a1 + 32), "finishExecutionIfPossible");

}

- (id)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong(&self->_value, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_bagKey, 0);
}

@end
