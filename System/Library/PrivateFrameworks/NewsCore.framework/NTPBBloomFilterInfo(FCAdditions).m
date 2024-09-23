@implementation NTPBBloomFilterInfo(FCAdditions)

+ (id)fc_fullBloomFilterInfo
{
  void *v0;
  void *v1;
  char v3;

  v0 = (void *)objc_opt_new();
  v3 = -1;
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &v3, 1);
  objc_msgSend(v0, "setBloomFilterData:", v1);

  objc_msgSend(v0, "setHashFunctionCount:", 1);
  return v0;
}

+ (id)fc_emptyBloomFilterInfo
{
  void *v0;
  void *v1;
  char v3;

  v0 = (void *)objc_opt_new();
  v3 = 0;
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &v3, 1);
  objc_msgSend(v0, "setBloomFilterData:", v1);

  objc_msgSend(v0, "setHashFunctionCount:", 1);
  return v0;
}

- (uint64_t)fc_maybeContainsURL:()FCAdditions
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  _QWORD v17[5];
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  int v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0D62990];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(a1, "bloomFilterData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithData:hashFunctionCount:", v7, (int)objc_msgSend(a1, "hashFunctionCount"));

  objc_msgSend(v5, "nb_domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "lowercaseString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = v10;
    v12 = (void *)FCWebURLResolutionLog;
    if (os_log_type_enabled((os_log_t)FCWebURLResolutionLog, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v12;
      objc_msgSend(a1, "bloomFilterData");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218499;
      v19 = objc_msgSend(v14, "length");
      v20 = 1024;
      v21 = objc_msgSend(a1, "hashFunctionCount");
      v22 = 2117;
      v23 = v11;
      _os_log_impl(&dword_1A1B90000, v13, OS_LOG_TYPE_DEFAULT, "using bloom filter of length %zd, hash function count %d to query %{sensitive}@", buf, 0x1Cu);

    }
    v15 = objc_msgSend(v8, "maybeContainsString:", v11);

  }
  else
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __56__NTPBBloomFilterInfo_FCAdditions__fc_maybeContainsURL___block_invoke;
    v17[3] = &unk_1E463AB90;
    v17[4] = a1;
    __56__NTPBBloomFilterInfo_FCAdditions__fc_maybeContainsURL___block_invoke((uint64_t)v17);
    v15 = 0;
  }

  return v15;
}

@end
