@implementation CDMDateTimeProtoSpanMatcher

- (CDMDateTimeProtoSpanMatcher)initWithDataDetectorPath:(id)a3 locale:(id)a4
{
  id v6;
  id v7;
  CDMDateTimeProtoSpanMatcher *v8;
  uint64_t v9;
  UPDataDetectors *upDataDetectors;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CDMDateTimeProtoSpanMatcher;
  v8 = -[CDMDateTimeProtoSpanMatcher init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BE9E3F8]), "initLoadFromDataDetectorsDirectoryPath:forLocale:", v6, v7);
    upDataDetectors = v8->_upDataDetectors;
    v8->_upDataDetectors = (UPDataDetectors *)v9;

  }
  return v8;
}

- (id)matchSpansForTokenChain:(id)a3 asrHypothesis:(id)a4
{
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  unint64_t v8;
  objc_class *v9;
  void *v10;
  id v11;
  void *v12;
  UPDataDetectors *upDataDetectors;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  unint64_t v29;
  os_signpost_id_t v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[128];
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v31 = a3;
  v5 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v6 = (id)CDMLogContext;
  v7 = v6;
  v8 = v5 - 1;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v38 = v10;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "SpanMatcher", "%{public}@", buf, 0xCu);

  }
  v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v31, "string");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v29 = v5 - 1;
    v30 = v5;
    upDataDetectors = self->_upDataDetectors;
    objc_msgSend(v31, "string");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UPDataDetectors matchSpansForUtterance:](upDataDetectors, "matchSpansForUtterance:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v16 = v15;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v33 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          +[CDMDateTimeProtoSpanMatcher buildMatchingSpan:tokenChain:](CDMDateTimeProtoSpanMatcher, "buildMatchingSpan:tokenChain:", v21, v31);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = (void *)MEMORY[0x24BE9E328];
          objc_msgSend(v21, "usoGraph");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "convertFromUsoGraph:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v22, "setUsoGraph:", v25);
          objc_msgSend(v11, "addObject:", v22);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v18);
    }

    v8 = v29;
    v5 = v30;
  }
  v26 = (id)CDMLogContext;
  v27 = v26;
  if (v8 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v27, OS_SIGNPOST_INTERVAL_END, v5, "SpanMatcher", ", buf, 2u);
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upDataDetectors, 0);
}

+ (id)buildMatchingSpan:(id)a3 tokenChain:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  int v31;
  int v32;
  void *v33;
  int v35;
  int v36;
  int v37;
  int v38;
  void *v39;
  uint64_t v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  int v44;
  __int16 v45;
  int v46;
  __int16 v47;
  int v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "tokens");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  objc_msgSend(v6, "tokens");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  objc_msgSend(v6, "tokens");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "value");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v5, "range");
  objc_msgSend(v6, "string");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14 >= objc_msgSend(v15, "length"))
  {

  }
  else
  {
    v16 = objc_msgSend(v5, "range");
    objc_msgSend(v5, "range");
    v18 = v16 + v17 - 1;
    objc_msgSend(v6, "string");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "length");

    if (v18 < v20)
    {
      v21 = objc_msgSend(v6, "tokenIndexFromCharacterIndex:", objc_msgSend(v5, "range"));
      v22 = objc_msgSend(v5, "range");
      objc_msgSend(v5, "range");
      v10 = objc_msgSend(v6, "tokenIndexFromCharacterIndex:", v22 + v23 - 1) + 1;
      objc_msgSend(v6, "string");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v5, "range");
      objc_msgSend(v24, "substringWithRange:", v25, v26);
      v27 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v27;
      goto LABEL_8;
    }
  }
  CDMOSLoggerForCategory(0);
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    v35 = objc_msgSend(v5, "range");
    v36 = objc_msgSend(v5, "range");
    objc_msgSend(v5, "range");
    v38 = v37 + v36;
    objc_msgSend(v6, "string");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v42 = "+[CDMDateTimeProtoSpanMatcher buildMatchingSpan:tokenChain:]";
    v43 = 1024;
    v44 = v35;
    v45 = 1024;
    v46 = v38;
    v47 = 1024;
    v48 = objc_msgSend(v39, "length");
    _os_log_debug_impl(&dword_21A2A0000, v28, OS_LOG_TYPE_DEBUG, "%s Forced DateTime span match to align with final token due to invalid DD match range start=<%u>, end=<%u> (exclusive), tokenChain string length=<%u>", buf, 0x1Eu);

  }
  v21 = (v8 - 1);
LABEL_8:
  objc_msgSend(v5, "category");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v5, "range");
  v31 = objc_msgSend(v5, "range");
  objc_msgSend(v5, "range");
  LODWORD(v40) = 0;
  +[CDMProtoSpanMatcherHelper buildMatchingSpanProtoWithLabel:inputStringForDebug:startTokenIndex:endTokenIndex:startCharIndex:endCharIndex:spanMatcherName:](CDMProtoSpanMatcherHelper, "buildMatchingSpanProtoWithLabel:inputStringForDebug:startTokenIndex:endTokenIndex:startCharIndex:endCharIndex:spanMatcherName:", v29, v13, v21, v10, v30, (v32 + v31), v40);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

+ (id)getCDMServiceAssetConfig
{
  CDMServiceAssetConfig *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(CDMServiceAssetConfig);
  v6 = CFSTR("data_detectors");
  v7 = CFSTR("com.apple.siri.nl.data_detectors");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMServiceAssetConfig addCDMFactorToFoldersMapping:forAssetSet:](v2, "addCDMFactorToFoldersMapping:forAssetSet:", v4, 0);

  return v2;
}

@end
