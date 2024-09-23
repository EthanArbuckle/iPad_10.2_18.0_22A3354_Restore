@implementation BCSURLPatternController

- (BCSURLPatternController)initWithCacheManager:(id)a3 metricFactory:(id)a4
{
  id v7;
  id v8;
  BCSURLPatternController *v9;
  BCSURLPatternController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BCSURLPatternController;
  v9 = -[BCSURLPatternController init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cacheManager, a3);
    objc_storeStrong((id *)&v10->_metricFactory, a4);
  }

  return v10;
}

- (void)matchPatternForURL:(id)a3 forClientBundleID:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  id v49;
  BCSURLPatternController *v50;
  id obj;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  BCSURLPatternMatcher *v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  const __CFString *v66;
  void *v67;
  _BYTE v68[128];
  _BYTE v69[128];
  const __CFString *v70;
  void *v71;
  uint8_t buf[4];
  const char *v73;
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  ABSLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v73 = "-[BCSURLPatternController matchPatternForURL:forClientBundleID:completion:]";
    _os_log_impl(&dword_20ACAD000, v9, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (v8)
  {
    -[BCSURLPatternController cachedPatternMatchingResult](self, "cachedPatternMatchingResult");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isExpired"))
    {

      goto LABEL_12;
    }
    -[BCSURLPatternController cachedPatternMatchingResult](self, "cachedPatternMatchingResult");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "originalURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v7, "isEqual:", v13);

    if (!v14)
    {
LABEL_12:
      objc_msgSend(v7, "host");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[BCSDomainItemIdentifier identifierWithType:domain:](BCSDomainItemIdentifier, "identifierWithType:domain:", 3, v23);
      v11 = objc_claimAutoreleasedReturnValue();

      -[BCSURLPatternController cacheManager](self, "cacheManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "domainItemMatching:", v11);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v25)
      {
        (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v8 + 2))(v8, 0, 0, 0, 0, 0);
LABEL_42:

        goto LABEL_43;
      }
      v50 = self;
      objc_msgSend(v25, "domainBundleIDPatterns");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_alloc_init(BCSURLPatternMatcher);
      if (!-[BCSURLPatternMatcher isValidDomainForURL:domainBundleIDPatterns:](v56, "isValidDomainForURL:domainBundleIDPatterns:", v7, v26))
      {
        (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v8 + 2))(v8, 0, 0, 0, 0, 0);
LABEL_41:

        goto LABEL_42;
      }
      v48 = v11;
      v49 = v8;
      v27 = v7;
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = 0u;
      v63 = 0u;
      v64 = 0u;
      v65 = 0u;
      v47 = v26;
      objc_msgSend(v26, "bundleIdPatterns");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
      if (v53)
      {
        v52 = *(_QWORD *)v63;
        do
        {
          v28 = 0;
          do
          {
            if (*(_QWORD *)v63 != v52)
              objc_enumerationMutation(obj);
            v54 = v28;
            v29 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v28);
            v58 = 0u;
            v59 = 0u;
            v60 = 0u;
            v61 = 0u;
            objc_msgSend(v29, "urlPatterns");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
            if (v31)
            {
              v32 = v31;
              v33 = *(_QWORD *)v59;
              do
              {
                for (i = 0; i != v32; ++i)
                {
                  if (*(_QWORD *)v59 != v33)
                    objc_enumerationMutation(v30);
                  v35 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i);
                  objc_msgSend(v29, "bundleId");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  v37 = v25;
                  objc_msgSend(v25, "expirationDate");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  v57 = 0;
                  -[BCSURLPatternMatcher matchPattern:withURL:forBundleID:expirationDate:error:](v56, "matchPattern:withURL:forBundleID:expirationDate:error:", v35, v27, v36, v38, &v57);
                  v39 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v39, "extractedURL");
                  v40 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v40)
                    objc_msgSend(v55, "addObject:", v39);

                  v25 = v37;
                }
                v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
              }
              while (v32);
            }

            v28 = v54 + 1;
          }
          while (v54 + 1 != v53);
          v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
        }
        while (v53);
      }

      if (!objc_msgSend(v55, "count"))
      {
        v8 = v49;
        (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v49 + 2))(v49, 0, 0, 0, 0, 0);
        v7 = v27;
LABEL_40:
        v26 = v47;

        v11 = v48;
        goto LABEL_41;
      }
      -[BCSURLPatternController mostExplicitMatchingResultFromResults:](v50, "mostExplicitMatchingResultFromResults:", v55);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v27;
      v8 = v49;
      if (v41)
      {
        -[BCSURLPatternController setCachedPatternMatchingResult:](v50, "setCachedPatternMatchingResult:", v41);
        if (MEMORY[0x20BD2FF14]("-[BCSURLPatternController matchPatternForURL:forClientBundleID:completion:]"))
        {
          v66 = CFSTR("BCSBusinessQueryServicePatternMatchingResult");
          objc_msgSend(v41, "debugDescription");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = v42;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v41, "bundleID");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          -[BCSURLPatternController cachedPatternMatchingResult](v50, "cachedPatternMatchingResult");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "extractedURL");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          (*((void (**)(id, uint64_t, void *, void *, void *, _QWORD))v49 + 2))(v49, 1, v44, v46, v43, 0);

LABEL_39:
          goto LABEL_40;
        }
      }
      else
      {
        MEMORY[0x20BD2FF14]("-[BCSURLPatternController matchPatternForURL:forClientBundleID:completion:]");
      }
      objc_msgSend(v41, "bundleID");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[BCSURLPatternController cachedPatternMatchingResult](v50, "cachedPatternMatchingResult");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "extractedURL");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, uint64_t, void *, void *, _QWORD, _QWORD))v49 + 2))(v49, 1, v43, v45, 0, 0);
      goto LABEL_39;
    }
    ABSLogCommon();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v73 = "-[BCSURLPatternController matchPatternForURL:forClientBundleID:completion:]";
      _os_log_impl(&dword_20ACAD000, v15, OS_LOG_TYPE_DEFAULT, "%s Found matched pattern result in memory cache", buf, 0xCu);
    }

    v70 = CFSTR("BCSBusinessQueryServicePatternMatchingResult");
    -[BCSURLPatternController cachedPatternMatchingResult](self, "cachedPatternMatchingResult");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "debugDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringByAppendingString:", CFSTR("\nFrom Memory Cache: YES"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1);
    v11 = objc_claimAutoreleasedReturnValue();

    -[BCSURLPatternController cachedPatternMatchingResult](self, "cachedPatternMatchingResult");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bundleID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[BCSURLPatternController cachedPatternMatchingResult](self, "cachedPatternMatchingResult");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "extractedURL");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, uint64_t, void *, void *, NSObject *, _QWORD))v8 + 2))(v8, 1, v20, v22, v11, 0);

  }
  else
  {
    ABSLogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v73 = "-[BCSURLPatternController matchPatternForURL:forClientBundleID:completion:]";
      _os_log_impl(&dword_20ACAD000, v11, OS_LOG_TYPE_DEFAULT, "%s Nil completion passed. Do nothing.", buf, 0xCu);
    }
  }
LABEL_43:

}

- (id)mostExplicitMatchingResultFromResults:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  id v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v17 = v3;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = 0;
      v9 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v4);
          v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          v12 = 1000000 * objc_msgSend(v11, "totalConsecutivePrefixMatches");
          v13 = v12 + 1000 * objc_msgSend(v11, "totalExactMatches");
          v14 = v13 + objc_msgSend(v11, "totalAnyMatches");
          if (v14 >= v7)
          {
            v15 = v11;

            v7 = v14;
            v8 = v15;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v6);
    }
    else
    {
      v8 = 0;
    }

    v3 = v17;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BCSMetricFactoryProtocol)metricFactory
{
  return self->_metricFactory;
}

- (BCSDomainItemCaching)cacheManager
{
  return self->_cacheManager;
}

- (BCSURLPatternMatchResult)cachedPatternMatchingResult
{
  return self->_cachedPatternMatchingResult;
}

- (void)setCachedPatternMatchingResult:(id)a3
{
  objc_storeStrong((id *)&self->_cachedPatternMatchingResult, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedPatternMatchingResult, 0);
  objc_storeStrong((id *)&self->_cacheManager, 0);
  objc_storeStrong((id *)&self->_metricFactory, 0);
}

@end
