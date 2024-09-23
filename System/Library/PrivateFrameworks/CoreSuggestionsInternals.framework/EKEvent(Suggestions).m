@implementation EKEvent(Suggestions)

- (BOOL)sg_isCuratedEventFromSuggestionNewerThan:()Suggestions
{
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  _BOOL8 v11;
  NSObject *v12;
  uint8_t v14[16];

  objc_msgSend(a1, "suggestionInfo");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4
    || (v5 = (void *)v4,
        objc_msgSend(a1, "suggestionInfo"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "timestamp"),
        v8 = v7,
        v6,
        v5,
        v8 == 0.0))
  {
    sgEventsLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1C3607000, v12, OS_LOG_TYPE_DEFAULT, "sg_isCuratedEventFromSuggestionNewerThan: missing suggestion info or timestamp", v14, 2u);
    }

    return 0;
  }
  else
  {
    objc_msgSend(a1, "suggestionInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timestamp");
    v11 = v10 > a2;

  }
  return v11;
}

- (uint64_t)sg_eventMetadata
{
  return objc_msgSend(MEMORY[0x1E0D19818], "eventMetadataFromEKEvent:", a1);
}

- (id)sg_schemas
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "sg_eventMetadata");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "schemaOrg");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)sg_fallbackURL
{
  void *v1;
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  void *v17;
  void *v18;
  char v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[8];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "sg_schemas");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1)
  {
    sgEventsLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3607000, v3, OS_LOG_TYPE_DEFAULT, "sg_fallbackURL: Event does not have schame", buf, 2u);
    }
    goto LABEL_24;
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v3 = v1;
  v4 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
LABEL_4:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v22 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v7);
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("url"), (_QWORD)v21);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        break;
      if (v5 == ++v7)
      {
        v5 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        if (v5)
          goto LABEL_4;
        goto LABEL_24;
      }
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("url"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "scheme");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lowercaseString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "isEqualToString:", CFSTR("http")))
      {

LABEL_19:
        goto LABEL_25;
      }
      objc_msgSend(v12, "scheme");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lowercaseString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("https"));

      if ((v19 & 1) != 0)
        goto LABEL_19;
      sgDeveloperLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        goto LABEL_23;
      *(_WORD *)buf = 0;
      v16 = "Ignoring URL that is not http or https";
    }
    else
    {
      sgDeveloperLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
LABEL_23:

        goto LABEL_24;
      }
      *(_WORD *)buf = 0;
      v16 = "Could not convert string to URL";
    }
    _os_log_impl(&dword_1C3607000, v15, OS_LOG_TYPE_DEFAULT, v16, buf, 2u);
    goto LABEL_23;
  }
LABEL_24:
  v12 = 0;
LABEL_25:

  return v12;
}

@end
