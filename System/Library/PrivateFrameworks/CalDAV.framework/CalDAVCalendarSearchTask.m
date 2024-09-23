@implementation CalDAVCalendarSearchTask

- (CalDAVCalendarSearchTask)initWithLanguages:(id)a3 location:(id)a4 calendarType:(id)a5 url:(id)a6
{
  id v11;
  id v12;
  id v13;
  CalDAVCalendarSearchTask *v14;
  CalDAVCalendarSearchTask *v15;
  uint64_t v16;
  NSString *location;
  uint64_t v18;
  NSString *calendarType;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v21.receiver = self;
  v21.super_class = (Class)CalDAVCalendarSearchTask;
  v14 = -[CalDAVCalendarSearchTask initWithURL:](&v21, sel_initWithURL_, a6);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_languages, a3);
    v16 = objc_msgSend(v12, "copy");
    location = v15->_location;
    v15->_location = (NSString *)v16;

    v18 = objc_msgSend(v13, "copy");
    calendarType = v15->_calendarType;
    v15->_calendarType = (NSString *)v18;

    v15->_limit = 3;
  }

  return v15;
}

- (void)setLimit:(unint64_t)a3
{
  self->_limit = a3;
}

- (id)httpMethod
{
  return CFSTR("REPORT");
}

- (id)requestBody
{
  id v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v22;
  NSArray *obj;
  CalDAVCalendarSearchTask *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BE1ABD8]);
  v4 = -[NSArray count](self->_languages, "count");
  v5 = *MEMORY[0x24BE1ACC8];
  v6 = *MEMORY[0x24BE1ADC8];
  if (v4)
  {
    v22 = *MEMORY[0x24BE1ACC8];
    objc_msgSend(v3, "startElement:inNamespace:withAttributeNamesAndValues:", v5, v6, *MEMORY[0x24BE1ACF0], *MEMORY[0x24BE1ACA8], 0);
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v24 = self;
    obj = self->_languages;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v26;
      v10 = *MEMORY[0x24BE1AD50];
      v11 = *MEMORY[0x24BE1AD70];
      v12 = *MEMORY[0x24BE1AD90];
      v13 = *MEMORY[0x24BE1ADC0];
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v26 != v9)
            objc_enumerationMutation(obj);
          v15 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v3, "startElement:inNamespace:withAttributeNamesAndValues:", v10, v6, 0);
          objc_msgSend(v3, "appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:", v11, v6, v15, 0);
          objc_msgSend(v3, "appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:", v12, v6, v24->_location, 0);
          objc_msgSend(v3, "appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:", v13, v6, v24->_calendarType, 0);
          objc_msgSend(v3, "endElement:inNamespace:", v10, v6);
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v8);
    }

    v5 = v22;
    self = v24;
  }
  else
  {
    objc_msgSend(v3, "startElement:inNamespace:withAttributeNamesAndValues:", *MEMORY[0x24BE1ACC8], *MEMORY[0x24BE1ADC8], 0);
    v16 = *MEMORY[0x24BE1AD50];
    objc_msgSend(v3, "startElement:inNamespace:withAttributeNamesAndValues:", *MEMORY[0x24BE1AD50], v6, 0);
    objc_msgSend(v3, "appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:", *MEMORY[0x24BE1ADC0], v6, self->_calendarType, 0);
    objc_msgSend(v3, "endElement:inNamespace:", v16, v6);
  }
  if (self->_limit)
  {
    v17 = *MEMORY[0x24BE1ACD8];
    objc_msgSend(v3, "startElement:inNamespace:withAttributeNamesAndValues:", *MEMORY[0x24BE1ACD8], v6, 0);
    v18 = *MEMORY[0x24BE1ACE0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), self->_limit);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:", v18, v6, v19, 0);

    objc_msgSend(v3, "endElement:inNamespace:", v17, v6);
  }
  objc_msgSend(v3, "endElement:inNamespace:", v5, v6);
  objc_msgSend(v3, "data");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)copyDefaultParserForContentType:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v4 = objc_alloc(MEMORY[0x24BE1ABE0]);
  v5 = *MEMORY[0x24BE1AE30];
  v6 = *MEMORY[0x24BE1AED0];
  v7 = objc_opt_class();
  -[CalDAVCalendarSearchTask url](self, "url");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v4, "initWithRootElementNameSpace:name:parseClass:baseURL:", v5, v6, v7, v8);

  return v9;
}

- (void)finishCoreDAVTaskWithError:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSDictionary *urlsToResults;
  NSDictionary *v14;
  NSDictionary *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  objc_super v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v19 = a3;
  -[CalDAVCalendarSearchTask responseBodyParser](self, "responseBodyParser");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "rootElement");
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "responses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v9, "matchResults");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v9, "firstHref");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "payloadAsFullURL");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          urlsToResults = self->_urlsToResults;
          if (!urlsToResults)
          {
            v14 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
            v15 = self->_urlsToResults;
            self->_urlsToResults = v14;

            urlsToResults = self->_urlsToResults;
          }
          objc_msgSend(v9, "matchResults");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary setObject:forKey:](urlsToResults, "setObject:forKey:", v16, v12);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v6);
  }

  v20.receiver = self;
  v20.super_class = (Class)CalDAVCalendarSearchTask;
  -[CalDAVCalendarSearchTask finishCoreDAVTaskWithError:](&v20, sel_finishCoreDAVTaskWithError_, v19);

}

- (id)additionalHeaderValues
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)CalDAVCalendarSearchTask;
  -[CalDAVCalendarSearchTask additionalHeaderValues](&v7, sel_additionalHeaderValues);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
    objc_msgSend(v3, "addEntriesFromDictionary:", v4);
  v5 = (void *)MGGetStringAnswer();
  if (v5)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("X-Request-Sku"));
  if (-[NSDictionary count](self->_additionalAuthenticationHeaders, "count"))
    objc_msgSend(v3, "addEntriesFromDictionary:", self->_additionalAuthenticationHeaders);

  return v3;
}

- (void)setAdditionalAuthenticationHeaders:(id)a3
{
  NSDictionary *v4;
  NSDictionary *additionalAuthenticationHeaders;

  v4 = (NSDictionary *)objc_msgSend(a3, "copy");
  additionalAuthenticationHeaders = self->_additionalAuthenticationHeaders;
  self->_additionalAuthenticationHeaders = v4;

}

- (NSDictionary)urlsToResults
{
  return self->_urlsToResults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlsToResults, 0);
  objc_storeStrong((id *)&self->_additionalAuthenticationHeaders, 0);
  objc_storeStrong((id *)&self->_calendarType, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_languages, 0);
}

@end
