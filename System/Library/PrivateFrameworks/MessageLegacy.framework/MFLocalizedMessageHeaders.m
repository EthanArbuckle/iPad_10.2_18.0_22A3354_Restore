@implementation MFLocalizedMessageHeaders

- (id)copyFormattedHeaderValueFromAddressList:(id)a3
{
  id v4;

  v4 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v4, "appendString:", objc_msgSend(a3, "componentsJoinedByString:", CFSTR(", ")));
  if (objc_msgSend(v4, "length"))
  {
    sanitizeStringForMarkup(v4);
    objc_msgSend(v4, "appendString:", CFSTR("<BR>"));
  }
  return v4;
}

- (void)appendHeaderMarkupForKey:(id)a3 value:(id)a4 toString:(id)a5
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  const __CFDate *v17;
  const __CFLocale *v18;
  __CFDateFormatter *v19;
  __CFString *StringWithDate;
  void *v21;
  void *v22;
  id v23;
  id v24;

  v9 = (id)objc_msgSend(+[MFLocalizedMessageHeaders localizedHeaders](MFLocalizedMessageHeaders, "localizedHeaders"), "objectForKey:", a3);
  if (!v9)
    v9 = a3;
  v10 = (void *)objc_msgSend(v9, "mutableCopy");
  sanitizeStringForMarkup(v10);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<B>%@:</B> "), v10);
  objc_msgSend(a5, "appendString:", v11);

  if (!a3)
    return;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (objc_msgSend((id)objc_opt_class(), "isStructuredHeaderKey:", a3))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = -[MFLocalizedMessageHeaders copyFormattedHeaderValueFromAddressList:](self, "copyFormattedHeaderValueFromAddressList:", a4);
        if (v15)
          goto LABEL_17;
      }
    }
    return;
  }
  v12 = (void *)objc_msgSend(a3, "lowercaseString");
  if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0D1E5F8]))
  {
    v13 = (void *)objc_msgSend((id)objc_msgSend(a4, "mf_stringByLocalizingReOrFwdPrefix"), "mutableCopy");
    sanitizeStringForMarkup(v13);
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<B>%@</B><BR>"), v13);
  }
  else
  {
    if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0D1E560]))
    {
      v16 = objc_msgSend(MEMORY[0x1E0C99D68], "mf_copyDateInCommonFormatsWithString:", a4);
      if (v16)
      {
        v17 = (const __CFDate *)v16;
        v18 = CFLocaleCopyCurrent();
        v19 = CFDateFormatterCreate(0, v18, kCFDateFormatterLongStyle, kCFDateFormatterLongStyle);
        StringWithDate = (__CFString *)CFDateFormatterCreateStringWithDate(0, v19, v17);
        v21 = (void *)-[__CFString mutableCopy](StringWithDate, "mutableCopy");
        sanitizeStringForMarkup(v21);
        v23 = (id)objc_msgSend(v21, "stringByAppendingString:", CFSTR("<BR>"));

        v15 = v23;
        if (v23)
          goto LABEL_17;
      }
      return;
    }
    v22 = (void *)objc_msgSend(a4, "mutableCopy");
    sanitizeStringForMarkup(v22);
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@<BR>"), v22);
  }
  v15 = (id)v14;
  if (v14)
  {
LABEL_17:
    v24 = v15;
    objc_msgSend(a5, "appendString:", v15);

  }
}

- (id)markupString
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = (id)objc_msgSend(MEMORY[0x1E0D460C8], "basicHeaders");
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v26;
    v18 = *(_QWORD *)v26;
    do
    {
      v7 = 0;
      v19 = v4;
      do
      {
        if (*(_QWORD *)v26 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v7);
        v9 = -[MFMessageHeaders headersForKey:](self, "headersForKey:", v8);
        if (v9)
        {
          v10 = v9;
          v11 = -[MFMessageHeaders _capitalizedKeyForKey:](self, "_capitalizedKeyForKey:", v8);
          if (!v5)
            v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
          v23 = 0u;
          v24 = 0u;
          v21 = 0u;
          v22 = 0u;
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v22;
            do
            {
              for (i = 0; i != v13; ++i)
              {
                if (*(_QWORD *)v22 != v14)
                  objc_enumerationMutation(v10);
                v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
                if ((objc_msgSend(v16, "isEqualToString:", &stru_1E81CBE50) & 1) == 0)
                  -[MFLocalizedMessageHeaders appendHeaderMarkupForKey:value:toString:](self, "appendHeaderMarkupForKey:value:toString:", v11, v16, v5);
              }
              v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
            }
            while (v13);
            v6 = v18;
            v4 = v19;
          }
        }
        ++v7;
      }
      while (v7 != v4);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)localizedHeaders
{
  id result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  result = (id)localizedHeaders_headers;
  if (!localizedHeaders_headers)
  {
    v13 = objc_alloc(MEMORY[0x1E0C99E08]);
    v12 = MFLookupLocalizedString((uint64_t)CFSTR("To"), (uint64_t)CFSTR("To"), 0);
    v11 = MFLookupLocalizedString((uint64_t)CFSTR("Reply-To"), (uint64_t)CFSTR("Reply-To"), 0);
    v10 = MFLookupLocalizedString((uint64_t)CFSTR("Subject"), (uint64_t)CFSTR("Subject"), 0);
    v9 = MFLookupLocalizedString((uint64_t)CFSTR("From"), (uint64_t)CFSTR("From"), 0);
    v8 = MFLookupLocalizedString((uint64_t)CFSTR("Cc"), (uint64_t)CFSTR("Cc"), 0);
    v3 = MFLookupLocalizedString((uint64_t)CFSTR("Bcc"), (uint64_t)CFSTR("Bcc"), 0);
    v4 = MFLookupLocalizedString((uint64_t)CFSTR("Date"), (uint64_t)CFSTR("Date"), 0);
    v5 = MFLookupLocalizedString((uint64_t)CFSTR("Attachments"), (uint64_t)CFSTR("Attachments"), 0);
    v6 = MFLookupLocalizedString((uint64_t)CFSTR("Resent-To"), (uint64_t)CFSTR("Resent-To"), 0);
    v7 = MFLookupLocalizedString((uint64_t)CFSTR("Resent-Cc"), (uint64_t)CFSTR("Resent-Cc"), 0);
    result = (id)objc_msgSend(v13, "initWithObjectsAndKeys:", v12, CFSTR("To"), v11, CFSTR("Reply-To"), v10, CFSTR("Subject"), v9, CFSTR("From"), v8, CFSTR("Cc"), v3, CFSTR("Bcc"), v4, CFSTR("Date"), v5, CFSTR("Attachments"), v6,
                   CFSTR("Resent-To"),
                   v7,
                   CFSTR("Resent-Cc"),
                   MFLookupLocalizedString((uint64_t)CFSTR("Resent-From"), (uint64_t)CFSTR("Resent-From"), 0),
                   CFSTR("Resent-From"),
                   0);
    localizedHeaders_headers = (uint64_t)result;
  }
  return result;
}

+ (id)localizedHeadersFromEnglishHeaders:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a3, "count"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(a3);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v8);
        v10 = (void *)objc_msgSend(+[MFLocalizedMessageHeaders localizedHeaders](MFLocalizedMessageHeaders, "localizedHeaders"), "objectForKey:", v9);
        if (v10 && (v11 = v10, (objc_msgSend(v10, "isEqualToString:", &stru_1E81CBE50) & 1) == 0))
        {
          v12 = v4;
          v13 = v11;
        }
        else
        {
          v12 = v4;
          v13 = v9;
        }
        objc_msgSend(v12, "addObject:", v13);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }
  return v4;
}

+ (id)englishHeadersFromLocalizedHeaders:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a3, "count"));
  v5 = +[MFLocalizedMessageHeaders localizedHeaders](MFLocalizedMessageHeaders, "localizedHeaders");
  v6 = (void *)objc_msgSend(v5, "allValues");
  v7 = (void *)objc_msgSend(v5, "allKeys");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(a3);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        v13 = objc_msgSend(v6, "indexOfObject:", v12);
        if (v13 != 0x7FFFFFFFFFFFFFFFLL)
          v12 = objc_msgSend(v7, "objectAtIndex:", v13);
        objc_msgSend(v4, "addObject:", v12);
      }
      v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }
  return v4;
}

@end
