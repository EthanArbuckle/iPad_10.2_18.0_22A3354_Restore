@implementation IMSharedMessage3rdPartySummary

+ (id)pluginPath
{
  return CFSTR("/System/Library/Messages/iMessageBalloons/MSMessageExtensionBalloonPlugin.bundle");
}

+ (id)previewSummaryWithPluginPayload:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  objc_super v12;

  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___IMSharedMessage3rdPartySummary;
  v5 = objc_msgSendSuper2(&v12, sel_previewSummaryWithPluginPayload_);
  v6 = objc_msgSend(a3, "data");
  if (v6)
  {
    v7 = v6;
    v11 = 0;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = objc_msgSend(MEMORY[0x1E0CB3710], "_strictlyUnarchivedObjectOfClasses:fromData:error:", IMExtensionPayloadUnarchivingClasses(), v7, &v11);
    else
      v8 = objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", IMExtensionPayloadUnarchivingClasses(), v7, &v11);
    v9 = v8;
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = (id)objc_msgSend(a1, "_individualPreviewSummary:", v9);
        if (!v5)
          return (id)objc_msgSend(a1, "_appNameSummary:", v9);
      }
    }
  }
  return v5;
}

+ (id)_individualPreviewSummary:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;

  v3 = (void *)objc_msgSend(a1, "_replaceHandleWithContactNameInString:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ldtext")));
  v4 = objc_msgSend((id)objc_msgSend(v3, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet")), "length");
  v5 = objc_msgSend(v3, "length");
  if (v4)
    v6 = v5 == 0;
  else
    v6 = 1;
  if (v6)
    return 0;
  else
    return v3;
}

+ (id)_replaceHandleWithContactNameInString:(id)a3
{
  id v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v3 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v5 = (void *)objc_msgSend(a1, "_handleIdentifiers:", a3);
    v3 = (id)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", v3);
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v17 != v7)
            objc_enumerationMutation(v5);
          v9 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
          v10 = (void *)objc_msgSend(a1, "_idForHandleIdentifier:", v9);
          v11 = (__CFString *)objc_msgSend(a1, "_displayNameWithID:", v10);
          if (!-[__CFString length](v11, "length")
            && (objc_msgSend(v10, "isEqualToString:", CFSTR("kIMTranscriptPluginBreadcrumbTextSenderIdentifier")) & 1) == 0
            && (objc_msgSend(v10, "isEqualToString:", CFSTR("kIMTranscriptPluginBreadcrumbTextReceiverIdentifier")) & 1) == 0)
          {
            v11 = (__CFString *)objc_msgSend(v10, "_stripFZIDPrefix");
          }
          v12 = -[__CFString length](v11, "length");
          v13 = objc_msgSend(v3, "length");
          if (v12)
            v14 = v11;
          else
            v14 = &stru_1E3FBBA48;
          objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", v9, v14, 0, 0, v13);
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v6);
    }
  }
  return v3;
}

+ (id)_displayNameWithID:(id)a3
{
  -[IMContactStore fetchCNContactForHandleWithID:](+[IMContactStore sharedInstance](IMContactStore, "sharedInstance"), "fetchCNContactForHandleWithID:", a3);
  return (id)MEMORY[0x1E0DE7D20](IMContactStore, sel_displayNameForContact_);
}

+ (id)_handleIdentifiers:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend((id)objc_msgSend(a1, "_handleIdentifierRegex"), "matchesInString:options:range:", a3, 0, 0, objc_msgSend(a3, "length"));
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v4);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "range");
        objc_msgSend(v5, "addObject:", objc_msgSend(a3, "substringWithRange:", v10, v11));
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
  return v5;
}

+ (id)_handleIdentifierRegex
{
  return (id)objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("\\$\\(([^\\$]|\\$[^\\(])*?\\)"), 0, 0);
}

+ (id)_idForHandleIdentifier:(id)a3
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_msgSend((id)objc_msgSend(a1, "_handleIdentifierRegex"), "firstMatchInString:options:range:", a3, 0, 0, objc_msgSend(a3, "length"));
  if (v4 && !objc_msgSend(v4, "range") && v5 == objc_msgSend(a3, "length"))
    return (id)objc_msgSend(a3, "substringWithRange:", 2, objc_msgSend(a3, "length") - 3);
  else
    return 0;
}

+ (id)_appNameSummary:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("an"));
  if (v3 && (v4 = v3, (objc_msgSend(v3, "isEqualToString:", &stru_1E3FBBA48) & 1) == 0))
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", objc_msgSend((id)IMSharedUtilitiesFrameworkBundle(), "localizedStringForKey:value:table:", CFSTR("1 %@ Message"), &stru_1E3FBBA48, CFSTR("IMSharedUtilities")), v4);
  else
    return 0;
}

@end
