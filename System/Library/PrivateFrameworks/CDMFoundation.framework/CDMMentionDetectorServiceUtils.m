@implementation CDMMentionDetectorServiceUtils

+ (id)buildMDRequestWithUtterance:(id)a3 tokenChain:(id)a4 embedding:(id)a5 nluRequestId:(id)a6 resultCandidateId:(id)a7 cdmRequestId:(id)a8
{
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v33 = a3;
  v13 = a4;
  v32 = a5;
  v31 = a6;
  v30 = a7;
  v29 = a8;
  v14 = objc_alloc_init(MEMORY[0x24BE9E210]);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  objc_msgSend(v13, "tokens");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v35 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        if ((objc_msgSend(v21, "isWhitespace") & 1) == 0)
        {
          objc_msgSend(v21, "cleanValue");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "length");

          if (v23)
            objc_msgSend(v15, "addObject:", v21);
        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v18);
  }

  v24 = objc_alloc_init(MEMORY[0x24BE9E300]);
  objc_msgSend(v13, "locale");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setLocale:", v25);

  objc_msgSend(v24, "setTokens:", v15);
  objc_msgSend(v13, "stringValue");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setStringValue:", v26);

  objc_msgSend(v14, "setUtterance:", v33);
  v27 = objc_alloc_init(MEMORY[0x24BE9E150]);
  objc_msgSend(v14, "setRequestId:", v27);

  objc_msgSend(v14, "setResultCandidateId:", v30);
  objc_msgSend(v14, "setNluRequestId:", v31);
  objc_msgSend(v14, "setTokenChain:", v24);
  objc_msgSend(v14, "setMaxCandidates:", 10);
  objc_msgSend(v14, "setEmbeddingTensor:", v32);
  objc_msgSend(v14, "setCdmRequestId:", v29);

  return v14;
}

+ (void)logMDRequestToFile:(id)a3
{
  void *v3;
  id v4;
  NSObject *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = 0;
  +[CDMNluLogUtil writeMDRequestToDisk:error:](CDMNluLogUtil, "writeMDRequestToDisk:error:", a3, &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v6;

  if (!v3)
  {
    CDMOSLoggerForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v8 = "+[CDMMentionDetectorServiceUtils logMDRequestToFile:]";
      v9 = 2112;
      v10 = v4;
      _os_log_error_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_ERROR, "%s [ERR]: Error logging md request to file: %@", buf, 0x16u);
    }

  }
}

+ (void)logMDResponseToFile:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (!v3)
  {
    CDMOSLoggerForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "+[CDMMentionDetectorServiceUtils logMDResponseToFile:]";
      _os_log_debug_impl(&dword_21A2A0000, v6, OS_LOG_TYPE_DEBUG, "%s nil md response, not writing to tmp", buf, 0xCu);
    }
    v5 = 0;
    goto LABEL_8;
  }
  v7 = 0;
  +[CDMNluLogUtil writeMDResponseToDisk:error:](CDMNluLogUtil, "writeMDResponseToDisk:error:", v3, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v7;

  if (!v4)
  {
    CDMOSLoggerForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v9 = "+[CDMMentionDetectorServiceUtils logMDResponseToFile:]";
      v10 = 2112;
      v11 = v5;
      _os_log_error_impl(&dword_21A2A0000, v6, OS_LOG_TYPE_ERROR, "%s [ERR]: Error logging md response to file: %@", buf, 0x16u);
    }
LABEL_8:

  }
}

@end
