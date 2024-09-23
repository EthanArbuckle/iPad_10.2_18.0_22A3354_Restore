@implementation FBKAnnouncement

+ (id)entityName
{
  return CFSTR("Announcement");
}

- (void)setPropertiesFromJSONObject:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  FBKAnnouncement *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  unsigned int v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;

  v29 = a3;
  objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("title"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[FBKAnnouncement setTitle:](self, "setTitle:", v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("AppleSeed Announcement"), &stru_24E15EAF8, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKAnnouncement setTitle:](self, "setTitle:", v7);

  }
  objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("type"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKAnnouncement setType:](self, "setType:", v9);

  objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("created_at"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    FBKDateFromServerString(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKAnnouncement setCreatedAt:](self, "setCreatedAt:", v12);

  }
  else
  {
    -[FBKAnnouncement setCreatedAt:](self, "setCreatedAt:", 0);
  }
  objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("updated_at"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    FBKDateFromServerString(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("body"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[FBKAnnouncement setBody:](self, "setBody:", v17);
    v18 = self;
    v19 = 0;
  }
  else
  {
    -[FBKAnnouncement updatedAt](self, "updatedAt");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20 && v15)
    {
      -[FBKAnnouncement body](self, "body");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        -[FBKAnnouncement updatedAt](self, "updatedAt");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v15, "compare:", v23);
        v25 = -[FBKAnnouncement isStub](self, "isStub");
        if (v24 == 1)
          v26 = 1;
        else
          v26 = v25;
        -[FBKAnnouncement setIsStub:](self, "setIsStub:", v26);

        goto LABEL_22;
      }
    }
    else
    {

    }
    v18 = self;
    v19 = 1;
  }
  -[FBKAnnouncement setIsStub:](v18, "setIsStub:", v19);
LABEL_22:
  -[FBKAnnouncement setUpdatedAt:](self, "setUpdatedAt:", v15);
  objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("acknowledged?"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
    -[FBKAnnouncement setUnread:](self, "setUnread:", objc_msgSend(v28, "BOOLValue") ^ 1);

}

- (id)fullHTMLContent
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;

  if (fullHTMLContent_onceToken != -1)
    dispatch_once(&fullHTMLContent_onceToken, &__block_literal_global_3);
  -[FBKAnnouncement cachedFullHTMLContent](self, "cachedFullHTMLContent");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3
    || (v4 = (void *)v3,
        -[FBKAnnouncement cachedFullHTMLContent](self, "cachedFullHTMLContent"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "length"),
        v5,
        v4,
        !v6))
  {
    -[FBKAnnouncement body](self, "body");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "rangeOfString:options:", CFSTR("<html>"), 1);

    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = (void *)fullHTMLContent__announcementTemplate;
      -[FBKAnnouncement body](self, "body");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR("{{ANNOUNCEMENT_CONTENT}}"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBKAnnouncement setCachedFullHTMLContent:](self, "setCachedFullHTMLContent:", v11);

      -[FBKAnnouncement cachedFullHTMLContent](self, "cachedFullHTMLContent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = CFSTR("target=\"_blank\");
      v15 = &stru_24E15EAF8;
    }
    else
    {
      -[FBKAnnouncement body](self, "body");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = CFSTR("<head>");
      v15 = CFSTR("<head>\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
    }
    objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKAnnouncement setCachedFullHTMLContent:](self, "setCachedFullHTMLContent:", v16);

  }
  -[FBKAnnouncement cachedFullHTMLContent](self, "cachedFullHTMLContent");
  return (id)objc_claimAutoreleasedReturnValue();
}

void __34__FBKAnnouncement_fullHTMLContent__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLForResource:withExtension:", CFSTR("AnnouncementContent"), CFSTR("html"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfURL:encoding:error:", v1, 4, &v7);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v7;
  v4 = (void *)fullHTMLContent__announcementTemplate;
  fullHTMLContent__announcementTemplate = v2;

  if (v3)
  {
    +[FBKLog appHandle](FBKLog, "appHandle");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __34__FBKAnnouncement_fullHTMLContent__block_invoke_cold_1(v3, v5);

    v6 = (void *)fullHTMLContent__announcementTemplate;
    fullHTMLContent__announcementTemplate = (uint64_t)&stru_24E15EAF8;

  }
}

- (id)generateSearchText
{
  void *v3;
  FBKXMLDocument *v4;
  void *v5;
  FBKXMLDocument *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  FBKXMLDocument *v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[3];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  -[FBKAnnouncement body](self, "body");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = [FBKXMLDocument alloc];
    -[FBKAnnouncement fullHTMLContent](self, "fullHTMLContent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[FBKXMLDocument initWithHTMLString:](v4, "initWithHTMLString:", v5);

    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKXMLDocument performXPathQuery:](v6, "performXPathQuery:", CFSTR("//body//*[not(self::style)]/text()"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v32 = v6;
      v9 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v8, "count"));
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v10 = v8;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v36 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
            objc_msgSend(v15, "content");
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (v16)
            {
              objc_msgSend(v15, "content");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "stringByTrimmingCharactersInSet:", v7);
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v18, "length"))
                -[__CFString addObject:](v9, "addObject:", v18);

            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
        }
        while (v12);
      }

      -[__CFString componentsJoinedByString:](v9, "componentsJoinedByString:", CFSTR(" "));
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v6 = v32;
    }
    else
    {
      -[FBKAnnouncement body](self, "body");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(v20, "mutableCopy");

      v34 = 0;
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1798]), "initWithPattern:options:error:", CFSTR("<[^>]+>"), 0, &v34);
      v23 = v34;
      v33 = v23;
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1798]), "initWithPattern:options:error:", CFSTR("\\s+"), 0, &v33);
      v25 = v33;

      if (!v25)
      {
        objc_msgSend(v22, "replaceMatchesInString:options:range:withTemplate:", v21, 0, 0, objc_msgSend(v21, "length"), &stru_24E15EAF8);
        objc_msgSend(v24, "replaceMatchesInString:options:range:withTemplate:", v21, 0, 0, objc_msgSend(v21, "length"), CFSTR(" "));
      }
      v9 = v21;

      v19 = v9;
    }

  }
  else
  {
    v19 = &stru_24E15EAF8;
  }
  -[FBKAnnouncement title](self, "title");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v26;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("ANNOUNCEMENT"), &stru_24E15EAF8, CFSTR("CommonStrings"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v28;
  v39[2] = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v39, 3);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "componentsJoinedByString:", CFSTR(" "));
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

- (NSString)cachedFullHTMLContent
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCachedFullHTMLContent:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->cachedFullHTMLContent, 0);
}

void __34__FBKAnnouncement_fullHTMLContent__block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "debugDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_21D9A9000, a2, OS_LOG_TYPE_ERROR, "Failed to load AnnouncementContent with error [%{public}@]", (uint8_t *)&v4, 0xCu);

}

@end
