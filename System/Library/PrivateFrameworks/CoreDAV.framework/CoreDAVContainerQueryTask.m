@implementation CoreDAVContainerQueryTask

+ (id)_copySearchTermsFromSearchString:(id)a3
{
  __CFString *v3;
  CFIndex v4;
  const __CFLocale *v5;
  __CFStringTokenizer *v6;
  id v7;
  CFRange CurrentTokenRange;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v27;
  id v28;
  CFRange v29;

  v3 = (__CFString *)a3;
  v4 = -[__CFString length](v3, "length");
  v5 = CFLocaleCopyCurrent();
  v29.location = 0;
  v29.length = v4;
  v6 = CFStringTokenizerCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v3, v29, 0, v5);
  v28 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  while (CFStringTokenizerAdvanceToNextToken(v6))
  {
    CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v6);
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", CurrentTokenRange.location, CurrentTokenRange.length);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v9);

  }
  CFRelease(v6);
  CFRelease(v5);
  if (!_copySearchTermsFromSearchString____friendlyPunctuationCharacterSet)
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("-@._"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)_copySearchTermsFromSearchString____friendlyPunctuationCharacterSet;
    _copySearchTermsFromSearchString____friendlyPunctuationCharacterSet = v10;

  }
  if (objc_msgSend(v7, "count"))
  {
    v12 = 0;
    do
    {
      objc_msgSend(v7, "objectAtIndex:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "rangeValue");
      v16 = v15;

      v17 = -[__CFString length](v3, "length");
      if (v12 >= objc_msgSend(v7, "count") - 1)
      {
        v20 = 0;
        if (v14)
        {
LABEL_11:
          v27 = v14 + v16;
          while (1)
          {
            v21 = v14 - 1;
            if (!objc_msgSend((id)_copySearchTermsFromSearchString____friendlyPunctuationCharacterSet, "characterIsMember:", -[__CFString characterAtIndex:](v3, "characterAtIndex:", v14 - 1, v27)))break;
            ++v16;
            --v14;
            if (!v21)
            {
              v16 = v27;
              break;
            }
          }
        }
      }
      else
      {
        objc_msgSend(v7, "objectAtIndex:", v12 + 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v18, "rangeValue");
        v20 = v19;

        if (v14)
          goto LABEL_11;
      }
      v22 = v16 + v14;
      ++v12;
      while (v22 < v17
           && objc_msgSend((id)_copySearchTermsFromSearchString____friendlyPunctuationCharacterSet, "characterIsMember:", -[__CFString characterAtIndex:](v3, "characterAtIndex:")))
      {
        if (++v16 + v14 == v17 && v20)
        {
          v16 += v20;
          objc_msgSend(v7, "removeObjectAtIndex:", v12);
          if (v12 < objc_msgSend(v7, "count"))
          {
            objc_msgSend(v7, "objectAtIndex:", v12);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v23, "rangeValue");
            v20 = v24;

          }
        }
        v22 = v16 + v14;
      }
      -[__CFString substringWithRange:](v3, "substringWithRange:", v14, v16);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "addObject:", v25);

    }
    while (v12 < objc_msgSend(v7, "count"));
  }

  return v28;
}

- (CoreDAVContainerQueryTask)initWithSearchTerms:(id)a3 searchLimit:(unint64_t)a4 atURL:(id)a5 appSpecificDataItemClass:(Class)a6
{
  CDVAbstractMethod();
}

- (CoreDAVContainerQueryTask)initWithSearchString:(id)a3 searchLimit:(unint64_t)a4 atURL:(id)a5 appSpecificDataItemClass:(Class)a6
{
  id v10;
  id v11;
  CoreDAVContainerQueryTask *v12;

  v10 = a5;
  v11 = +[CoreDAVContainerQueryTask _copySearchTermsFromSearchString:](CoreDAVContainerQueryTask, "_copySearchTermsFromSearchString:", a3);
  v12 = -[CoreDAVContainerQueryTask initWithSearchTerms:searchLimit:atURL:appSpecificDataItemClass:](self, "initWithSearchTerms:searchLimit:atURL:appSpecificDataItemClass:", v11, a4, v10, a6);

  return v12;
}

- (id)_initWithSearchTerms:(id)a3 searchLimit:(unint64_t)a4 atURL:(id)a5 appSpecificDataItemClass:(Class)a6
{
  id v11;
  CoreDAVContainerQueryTask *v12;
  CoreDAVContainerQueryTask *v13;
  objc_super v15;

  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CoreDAVContainerQueryTask;
  v12 = -[CoreDAVTask initWithURL:](&v15, sel_initWithURL_, a5);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_searchTerms, a3);
    v13->_searchLimit = a4;
    if (!a6)
      a6 = (Class)objc_opt_class();
    v13->_appSpecificDataItemClass = a6;
    v13->super._depth = 3;
  }

  return v13;
}

- (id)httpMethod
{
  return CFSTR("REPORT");
}

- (void)addFiltersToXMLData:(id)a3
{
  void *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  id v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  objc_msgSend(v4, "logHandleForAccountInfoProvider:", WeakRetained);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 138543362;
      v10 = (id)objc_opt_class();
      v8 = v10;
      _os_log_impl(&dword_209602000, v7, OS_LOG_TYPE_ERROR, "addFiltersToXMLData: to be implemented by subclass %{public}@", (uint8_t *)&v9, 0xCu);

    }
  }

}

- (id)requestBody
{
  CoreDAVXMLData *v3;
  void *v4;

  v3 = objc_alloc_init(CoreDAVXMLData);
  -[CoreDAVXMLData startElement:inNamespace:withAttributeNamesAndValues:](v3, "startElement:inNamespace:withAttributeNamesAndValues:", self->_appSpecificQueryCommand, self->_appSpecificNamespace, 0);
  -[CoreDAVXMLData startElement:inNamespace:withAttributeNamesAndValues:](v3, "startElement:inNamespace:withAttributeNamesAndValues:", CFSTR("prop"), CFSTR("DAV:"), 0);
  -[CoreDAVXMLData appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:](v3, "appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:", CFSTR("getetag"), CFSTR("DAV:"), 0, 0);
  -[CoreDAVXMLData appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:](v3, "appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:", self->_appSpecificDataProp, self->_appSpecificNamespace, 0, 0);
  -[CoreDAVXMLData endElement:inNamespace:](v3, "endElement:inNamespace:", CFSTR("prop"), CFSTR("DAV:"));
  -[CoreDAVContainerQueryTask addFiltersToXMLData:](self, "addFiltersToXMLData:", v3);
  -[CoreDAVXMLData endElement:inNamespace:](v3, "endElement:inNamespace:", self->_appSpecificQueryCommand, self->_appSpecificNamespace);
  -[CoreDAVXMLData data](v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)copyDefaultParserForContentType:(id)a3
{
  CoreDAVXMLParser *v4;
  uint64_t v5;
  void *v6;
  CoreDAVXMLParser *v7;
  CoreDAVItemParserMapping *v8;
  CoreDAVItemParserMapping *v9;
  void *v10;

  v4 = [CoreDAVXMLParser alloc];
  v5 = objc_opt_class();
  -[CoreDAVTask url](self, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CoreDAVXMLParser initWithRootElementNameSpace:name:parseClass:baseURL:](v4, "initWithRootElementNameSpace:name:parseClass:baseURL:", CFSTR("DAV:"), CFSTR("multistatus"), v5, v6);

  v8 = -[CoreDAVItemParserMapping initWithNameSpace:name:parseClass:]([CoreDAVItemParserMapping alloc], "initWithNameSpace:name:parseClass:", CFSTR("DAV:"), CFSTR("getetag"), objc_opt_class());
  v9 = -[CoreDAVItemParserMapping initWithNameSpace:name:parseClass:]([CoreDAVItemParserMapping alloc], "initWithNameSpace:name:parseClass:", self->_appSpecificNamespace, self->_appSpecificDataProp, objc_opt_class());
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", 2);
  objc_msgSend(v10, "addObject:", v8);
  objc_msgSend(v10, "addObject:", v9);
  -[CoreDAVXMLParser setParseHints:](v7, "setParseHints:", v10);

  return v7;
}

- (void)finishCoreDAVTaskWithError:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  uint64_t v6;
  void *v7;
  id WeakRetained;
  void *v9;
  NSObject *v10;
  __CFString *v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  uint64_t v34;
  CoreDAVContainerQueryTask *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  id v39;
  uint64_t v40;
  __CFString *v41;
  NSObject *v42;
  void *v43;
  char v44;
  void *v45;
  void *v46;
  char v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  objc_super v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t v60[128];
  uint8_t buf[4];
  __CFString *v62;
  __int16 v63;
  __CFString *v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v4 = (__CFString *)a3;
  v5 = v4;
  if (v4)
  {
    v6 = -[__CFString code](v4, "code");
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    objc_msgSend(v7, "logHandleForAccountInfoProvider:", WeakRetained);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 == 1)
    {
      if (v9)
      {
        v10 = v9;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          v62 = (__CFString *)objc_opt_class();
          v11 = v62;
          v12 = "%{public}@ cancelled";
          v13 = v10;
          v14 = OS_LOG_TYPE_INFO;
          v15 = 12;
LABEL_29:
          _os_log_impl(&dword_209602000, v13, v14, v12, buf, v15);

          goto LABEL_30;
        }
        goto LABEL_30;
      }
    }
    else if (v9)
    {
      v42 = v9;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v62 = (__CFString *)objc_opt_class();
        v63 = 2112;
        v64 = v5;
        v11 = v62;
        v12 = "%{public}@ failed: %@";
        v13 = v42;
        v14 = OS_LOG_TYPE_DEFAULT;
        v15 = 22;
        goto LABEL_29;
      }
LABEL_30:

    }
    v41 = v5;
    LOBYTE(v18) = 0;
    v16 = 0;
    goto LABEL_32;
  }
  v16 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  -[CoreDAVTask responseBodyParser](self, "responseBodyParser");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "rootElement");
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "responses");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
  v18 = 0;
  if (v54)
  {
    v19 = *(_QWORD *)v57;
    v51 = *(_QWORD *)v57;
    v50 = v17;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v57 != v19)
          objc_enumerationMutation(v17);
        v21 = *(__CFString **)(*((_QWORD *)&v56 + 1) + 8 * v20);
        -[__CFString errorItem](v21, "errorItem");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "numberOfMatchesWithinLimits");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
          objc_msgSend(v24, "logHandleForAccountInfoProvider:", v25);
          v26 = objc_claimAutoreleasedReturnValue();

          if (v26 && os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v62 = CFSTR("number-of-matches-within-limits");
            v63 = 2112;
            v64 = v21;
            _os_log_impl(&dword_209602000, v26, OS_LOG_TYPE_DEBUG, "Received %@ response %@", buf, 0x16u);
          }
          v18 = 1;
        }
        else
        {
          -[__CFString successfulPropertiesToValues](v21, "successfulPropertiesToValues");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v27;
          if (v27)
          {
            objc_msgSend(v27, "CDVObjectForKeyWithNameSpace:andName:", CFSTR("DAV:"), CFSTR("getetag"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "payloadAsString");
            v26 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(v24, "CDVObjectForKeyWithNameSpace:andName:", self->_appSpecificNamespace, self->_appSpecificDataProp);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "payload");
            v53 = objc_claimAutoreleasedReturnValue();

            -[__CFString firstHref](v21, "firstHref");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "payloadAsFullURL");
            v52 = (void *)objc_claimAutoreleasedReturnValue();

            v31 = objc_alloc(self->_appSpecificDataItemClass);
            -[CoreDAVTask url](self, "url");
            v32 = v16;
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            -[CoreDAVTask accountInfoProvider](self, "accountInfoProvider");
            v34 = v18;
            v35 = self;
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = v53;
            v38 = (void *)objc_msgSend(v31, "initWithURL:eTag:dataPayload:inContainerWithURL:withAccountInfoProvider:", v52, v26, v53, v33, v36);

            self = v35;
            v18 = v34;

            v16 = v32;
            v17 = v50;
            objc_msgSend(v16, "addObject:", v38);

          }
          else
          {
            +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
            v26 = objc_claimAutoreleasedReturnValue();
            v39 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
            -[NSObject logHandleForAccountInfoProvider:](v26, "logHandleForAccountInfoProvider:", v39);
            v37 = objc_claimAutoreleasedReturnValue();

            if (v37 && os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v62 = v21;
              _os_log_impl(&dword_209602000, v37, OS_LOG_TYPE_DEFAULT, "Unexpected status response %@", buf, 0xCu);
            }
          }
          v19 = v51;

        }
        ++v20;
      }
      while (v54 != v20);
      v40 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
      v54 = v40;
    }
    while (v40);
  }

  v41 = 0;
  v5 = 0;
LABEL_32:
  self->super._numDownloadedElements = objc_msgSend(v16, "count");
  -[CoreDAVTask delegate](self, "delegate");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_opt_respondsToSelector();

  -[CoreDAVTask delegate](self, "delegate");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v45;
  if ((v44 & 1) != 0)
  {
    objc_msgSend(v45, "containerQueryTask:completedWithFoundItems:limitReached:error:", self, v16, v18 & 1, v41);
LABEL_36:

    -[CoreDAVTask setDelegate:](self, "setDelegate:", 0);
    goto LABEL_37;
  }
  v47 = objc_opt_respondsToSelector();

  if ((v47 & 1) != 0)
  {
    -[CoreDAVTask delegate](self, "delegate");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "containerQueryTask:completedWithFoundItems:error:", self, v16, v41);
    goto LABEL_36;
  }
LABEL_37:
  v55.receiver = self;
  v55.super_class = (Class)CoreDAVContainerQueryTask;
  -[CoreDAVTask finishCoreDAVTaskWithError:](&v55, sel_finishCoreDAVTaskWithError_, v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appSpecificDataProp, 0);
  objc_storeStrong((id *)&self->_appSpecificQueryCommand, 0);
  objc_storeStrong((id *)&self->_appSpecificNamespace, 0);
  objc_storeStrong((id *)&self->_searchTerms, 0);
}

@end
