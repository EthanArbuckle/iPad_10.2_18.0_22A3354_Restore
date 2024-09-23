@implementation MFLocalizedMessageHeaders

- (id)copyFormattedHeaderValueFromAddressList:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", v5);

  if (objc_msgSend(v4, "length"))
  {
    sanitizeStringForMarkup(v4);
    objc_msgSend(v4, "appendString:", CFSTR("<BR>"));
  }

  return v4;
}

- (void)appendHeaderMarkupForKey:(id)a3 value:(id)a4 toString:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  const __CFDate *v20;
  __CFDateFormatter *v21;
  __CFString *StringWithDate;
  void *v23;
  const __CFLocale *cf;
  const __CFDate *date;
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v26 = v8;
  +[MFLocalizedMessageHeaders localizedHeaders](MFLocalizedMessageHeaders, "localizedHeaders");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v26);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (!v12)
    v12 = v26;
  v13 = (void *)objc_msgSend(v12, "mutableCopy");
  sanitizeStringForMarkup(v13);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<B>%@:</B> "), v13);

  objc_msgSend(v10, "appendString:", v14);
  if (v26)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = v9;
      objc_msgSend(v26, "lowercaseString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0D1E5F8]))
      {
        objc_msgSend(MEMORY[0x1E0D1E7A8], "subjectStringForDisplayForSubjectString:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)objc_msgSend(v17, "mutableCopy");

        sanitizeStringForMarkup(v18);
        v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<B>%@</B><BR>"), v18);
      }
      else if (objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0D1E560]))
      {
        v20 = (const __CFDate *)objc_msgSend(MEMORY[0x1E0C99D68], "mf_copyDateInCommonFormatsWithString:", v15);
        if (v20)
        {
          date = v20;
          cf = CFLocaleCopyCurrent();
          v21 = CFDateFormatterCreate(0, cf, kCFDateFormatterLongStyle, kCFDateFormatterLongStyle);
          StringWithDate = (__CFString *)CFDateFormatterCreateStringWithDate(0, v21, date);
          v18 = (void *)-[__CFString mutableCopy](StringWithDate, "mutableCopy");
          sanitizeStringForMarkup(v18);
          objc_msgSend(v18, "stringByAppendingString:", CFSTR("<BR>"));
          v19 = (id)objc_claimAutoreleasedReturnValue();
          CFRelease(v21);
          CFRelease(cf);

          v20 = date;
        }
        else
        {
          v19 = 0;
          v18 = 0;
        }

      }
      else
      {
        v23 = (void *)objc_msgSend(v15, "mutableCopy");
        sanitizeStringForMarkup(v23);
        v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@<BR>"), v23);
        v18 = v23;
      }

      if (!v19)
        goto LABEL_19;
      goto LABEL_18;
    }
    if (objc_msgSend((id)objc_opt_class(), "isStructuredHeaderKey:", v26))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v19 = -[MFLocalizedMessageHeaders copyFormattedHeaderValueFromAddressList:](self, "copyFormattedHeaderValueFromAddressList:", v9);
        if (!v19)
        {
LABEL_19:

          goto LABEL_20;
        }
LABEL_18:
        objc_msgSend(v10, "appendString:", v19);
        goto LABEL_19;
      }
    }
  }
LABEL_20:

}

- (id)markupString
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id obj;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D460C8], "basicHeaders");
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = 0;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v4)
  {
    v16 = *(_QWORD *)v23;
    do
    {
      v5 = 0;
      v15 = v4;
      do
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v5);
        -[MFMessageHeaders headersForKey:](self, "headersForKey:", v6);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          -[MFMessageHeaders _capitalizedKeyForKey:](self, "_capitalizedKeyForKey:", v6);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v3)
            v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
          v20 = 0u;
          v21 = 0u;
          v18 = 0u;
          v19 = 0u;
          v8 = v17;
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          if (v9)
          {
            v10 = *(_QWORD *)v19;
            do
            {
              for (i = 0; i != v9; ++i)
              {
                if (*(_QWORD *)v19 != v10)
                  objc_enumerationMutation(v8);
                v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
                if ((objc_msgSend(v12, "isEqualToString:", &stru_1E4F1C8F8) & 1) == 0)
                  -[MFLocalizedMessageHeaders appendHeaderMarkupForKey:value:toString:](self, "appendHeaderMarkupForKey:value:toString:", v7, v12, v3);
              }
              v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
            }
            while (v9);
          }

          v4 = v15;
        }

        ++v5;
      }
      while (v5 != v4);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v4);
  }

  return v3;
}

+ (id)localizedHeaders
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v2 = (void *)localizedHeaders_headers;
  if (!localizedHeaders_headers)
  {
    v3 = objc_alloc(MEMORY[0x1E0C99E08]);
    MFLookupLocalizedString(CFSTR("To"), CFSTR("To"), CFSTR("Message"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    MFLookupLocalizedString(CFSTR("Reply-To"), CFSTR("Reply-To"), CFSTR("Message"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    MFLookupLocalizedString(CFSTR("Subject"), CFSTR("Subject"), CFSTR("Message"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    MFLookupLocalizedString(CFSTR("From"), CFSTR("From"), CFSTR("Message"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    MFLookupLocalizedString(CFSTR("Cc"), CFSTR("Cc"), CFSTR("Message"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    MFLookupLocalizedString(CFSTR("Bcc"), CFSTR("Bcc"), CFSTR("Message"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    MFLookupLocalizedString(CFSTR("Date"), CFSTR("Date"), CFSTR("Message"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    MFLookupLocalizedString(CFSTR("Attachments"), CFSTR("Attachments"), CFSTR("Message"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    MFLookupLocalizedString(CFSTR("Resent-To"), CFSTR("Resent-To"), CFSTR("Message"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    MFLookupLocalizedString(CFSTR("Resent-Cc"), CFSTR("Resent-Cc"), CFSTR("Message"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    MFLookupLocalizedString(CFSTR("Resent-From"), CFSTR("Resent-From"), CFSTR("Message"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v3, "initWithObjectsAndKeys:", v17, CFSTR("To"), v16, CFSTR("Reply-To"), v15, CFSTR("Subject"), v14, CFSTR("From"), v13, CFSTR("Cc"), v12, CFSTR("Bcc"), v4, CFSTR("Date"), v11, CFSTR("Attachments"), v10,
           CFSTR("Resent-To"),
           v5,
           CFSTR("Resent-Cc"),
           v6,
           CFSTR("Resent-From"),
           0);
    v8 = (void *)localizedHeaders_headers;
    localizedHeaders_headers = v7;

    v2 = (void *)localizedHeaders_headers;
  }
  return v2;
}

+ (id)localizedHeadersFromEnglishHeaders:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v12, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = v12;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v7);
        +[MFLocalizedMessageHeaders localizedHeaders](MFLocalizedMessageHeaders, "localizedHeaders");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10 && (objc_msgSend(v10, "isEqualToString:", &stru_1E4F1C8F8) & 1) == 0)
          objc_msgSend(v3, "addObject:", v10);
        else
          objc_msgSend(v3, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  return v3;
}

+ (id)englishHeadersFromLocalizedHeaders:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v15, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFLocalizedMessageHeaders localizedHeaders](MFLocalizedMessageHeaders, "localizedHeaders");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v15;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        v12 = objc_msgSend(v5, "indexOfObject:", v11);
        if (v12 == 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v3, "addObject:", v11);
        }
        else
        {
          objc_msgSend(v6, "objectAtIndex:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v13);

        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  return v3;
}

@end
