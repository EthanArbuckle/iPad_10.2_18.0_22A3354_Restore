@implementation AXLanguageTaggedContent

- (AXLanguageTaggedContent)initWithContent:(id)a3
{
  id v4;
  void *v5;
  AXLanguageTaggedContent *v6;
  objc_super v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4
    && (v8.receiver = self,
        v8.super_class = (Class)AXLanguageTaggedContent,
        (self = -[AXLanguageTaggedContent init](&v8, sel_init)) != 0))
  {
    v5 = (void *)objc_msgSend(v4, "mutableCopy");
    -[AXLanguageTaggedContent setContentString:](self, "setContentString:", v5);

    v10[0] = *MEMORY[0x1E0D174E8];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    self->_nlTagger = (void *)NLTaggerCreate();
    v9 = *MEMORY[0x1E0D174D8];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 1);
    self->_namedEntityTagger = (void *)NLTaggerCreate();
    self = self;
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_nlTagger);
  CFRelease(self->_namedEntityTagger);
  v3.receiver = self;
  v3.super_class = (Class)AXLanguageTaggedContent;
  -[AXLanguageTaggedContent dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("AXTaggedContent:<%p>. tags:\n"), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[AXLanguageTaggedContent tags](self, "tags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "appendFormat:", CFSTR("  %@\n"), *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)appendLanguageTaggedContent:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  AXLogSpokenContentTextProcessing();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18C62B000, v5, OS_LOG_TYPE_INFO, "Will append new tagged content to current tagged content", buf, 2u);
  }

  -[AXLanguageTaggedContent contentString](self, "contentString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:", v7);

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(v4, "tags", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v35;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v35 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v12);
        -[AXLanguageTaggedContent content](self, "content");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setContent:", v14);

        v15 = objc_msgSend(v13, "range");
        -[AXLanguageTaggedContent contentString](self, "contentString");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "length") + v15;
        objc_msgSend(v4, "contentString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v17 - objc_msgSend(v18, "length");
        objc_msgSend(v13, "range");
        objc_msgSend(v13, "setRange:", v19, v20);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v10);
  }

  -[AXLanguageTaggedContent tags](self, "tags");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tags");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addObjectsFromArray:", v22);

  -[AXLanguageTaggedContent unpredictedAmbiguousLangMaps](self, "unpredictedAmbiguousLangMaps");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unpredictedAmbiguousLangMaps");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "unionOrderedSet:", v24);

  -[AXLanguageTaggedContent predictedSecondaryLangMaps](self, "predictedSecondaryLangMaps");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predictedSecondaryLangMaps");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "unionOrderedSet:", v26);

  AXLogSpokenContentTextProcessing();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    -[AXLanguageTaggedContent currentDialects](self, "currentDialects");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentDialects");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v39 = v28;
    v40 = 2112;
    v41 = v29;
    _os_log_impl(&dword_18C62B000, v27, OS_LOG_TYPE_INFO, "Combining currentDialects. old: %@. new: %@", buf, 0x16u);

  }
  -[AXLanguageTaggedContent currentDialects](self, "currentDialects");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentDialects");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "arrayByAddingObjectsFromArray:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXLanguageTaggedContent setCurrentDialects:](self, "setCurrentDialects:", v32);

  if (-[AXLanguageTaggedContent isTagged](self, "isTagged"))
    v33 = objc_msgSend(v4, "isTagged");
  else
    v33 = 0;
  -[AXLanguageTaggedContent setTagged:](self, "setTagged:", v33);

}

- (void)enumerateUnpredictedTags:(id)a3
{
  void (**v4)(id, void *, _BYTE *);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  char v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, _BYTE *))a3;
  v15 = 0;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[AXLanguageTaggedContent tags](self, "tags", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
      if ((objc_msgSend(v10, "wasPredicted") & 1) == 0)
      {
        v4[2](v4, v10, &v15);
        if (v15)
          break;
      }
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)enumeratePredictedTags:(id)a3
{
  void (**v4)(id, void *, _BYTE *);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  char v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, _BYTE *))a3;
  v15 = 0;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[AXLanguageTaggedContent tags](self, "tags", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
      if (objc_msgSend(v10, "wasPredicted"))
      {
        v4[2](v4, v10, &v15);
        if (v15)
          break;
      }
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (id)langCodeForlangId:(int)a3
{
  if ((a3 - 2) > 0x38)
    return CFSTR("und");
  else
    return off_1E24C8180[a3 - 2];
}

- (int)langIDforLangCode:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("ar")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("bg")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("zh-Hans")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("zh-Hant")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("hr")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("cs")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("da")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("nl")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("en")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("fi")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("fr")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("de")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("el")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("he")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("hi")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("hu")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("is")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("it")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("ja")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("ko")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("mr")) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("nb")) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("pl")) & 1) != 0)
  {
    v4 = 24;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("pt")) & 1) != 0)
  {
    v4 = 25;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("ro")) & 1) != 0)
  {
    v4 = 26;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("ru")) & 1) != 0)
  {
    v4 = 27;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("sk")) & 1) != 0)
  {
    v4 = 28;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("es")) & 1) != 0)
  {
    v4 = 29;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("sv")) & 1) != 0)
  {
    v4 = 30;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("th")) & 1) != 0)
  {
    v4 = 31;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("tr")) & 1) != 0)
  {
    v4 = 32;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("uk")) & 1) != 0)
  {
    v4 = 33;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("ur")) & 1) != 0)
  {
    v4 = 34;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("hy")) & 1) != 0)
  {
    v4 = 35;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("bn")) & 1) != 0)
  {
    v4 = 36;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("pa")) & 1) != 0)
  {
    v4 = 37;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("gu")) & 1) != 0)
  {
    v4 = 38;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("or")) & 1) != 0)
  {
    v4 = 39;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("ta")) & 1) != 0)
  {
    v4 = 40;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("te")) & 1) != 0)
  {
    v4 = 41;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("kn")) & 1) != 0)
  {
    v4 = 42;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("ml")) & 1) != 0)
  {
    v4 = 43;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("si")) & 1) != 0)
  {
    v4 = 44;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("lo")) & 1) != 0)
  {
    v4 = 45;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("bo")) & 1) != 0)
  {
    v4 = 46;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("my")) & 1) != 0)
  {
    v4 = 47;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("ka")) & 1) != 0)
  {
    v4 = 48;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("am")) & 1) != 0)
  {
    v4 = 49;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("chr")) & 1) != 0)
  {
    v4 = 50;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("iu")) & 1) != 0)
  {
    v4 = 51;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("km")) & 1) != 0)
  {
    v4 = 52;
  }
  else if (objc_msgSend(v3, "hasPrefix:", CFSTR("mn")))
  {
    v4 = 53;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (id)_allLangIDs
{
  return &unk_1E24F8DF8;
}

- ($1230CF39250A084FEEB876D19862D23B)_languageHintsEvenlyDistributedWithProbability:(float)a3 excludingHints:(id)a4
{
  id v6;
  void *v7;
  $1230CF39250A084FEEB876D19862D23B *v8;
  uint64_t v9;
  uint64_t v10;
  float v11;
  unint64_t v12;
  float *p_var1;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;

  v6 = a4;
  -[AXLanguageTaggedContent _allLangIDs](self, "_allLangIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = ($1230CF39250A084FEEB876D19862D23B *)malloc_type_malloc(8 * objc_msgSend(v7, "count"), 0x100004000313F17uLL);
  v9 = objc_msgSend(v7, "count");
  v10 = objc_msgSend(v6, "count");
  v11 = 0.0;
  if (v9 != v10)
    v11 = a3 / (float)(unint64_t)(v9 - v10);
  if (objc_msgSend(v7, "count"))
  {
    v12 = 0;
    p_var1 = &v8->var1;
    do
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *((_DWORD *)p_var1 - 1) = objc_msgSend(v14, "intValue");

      objc_msgSend(v7, "objectAtIndexedSubscript:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKey:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        objc_msgSend(v7, "objectAtIndexedSubscript:", v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKey:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "floatValue");
        *(_DWORD *)p_var1 = v19;

      }
      else
      {
        *p_var1 = v11;
      }
      ++v12;
      p_var1 += 2;
    }
    while (objc_msgSend(v7, "count") > v12);
  }

  return v8;
}

- (id)_overrideLanguageDetection:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[AXLanguageManager sharedInstance](AXLanguageManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dialectForSystemLanguage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "specificLanguageID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "hasPrefix:", CFSTR("zh"))
    && (objc_msgSend(v6, "hasPrefix:", CFSTR("ja")) & 1) != 0
    || objc_msgSend(v3, "hasPrefix:", CFSTR("ja"))
    && objc_msgSend(v6, "hasPrefix:", CFSTR("zh")))
  {
    AXLogSpokenContentTextProcessing();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v12 = 138412290;
      v13 = v3;
      _os_log_impl(&dword_18C62B000, v7, OS_LOG_TYPE_INFO, "Override language {%@} detection to be ja-JP", (uint8_t *)&v12, 0xCu);
    }

    +[AXLanguageManager sharedInstance](AXLanguageManager, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dialectForSystemLanguage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "specificLanguageID");
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = v3;
  }

  return v10;
}

- (void)_searchForShorthandDates
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
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
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, void *);
  void *v23;
  AXLanguageTaggedContent *v24;
  id v25;

  objc_msgSend(MEMORY[0x1E0CB3560], "dataDetectorWithTypes:error:", 8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXLanguageTaggedContent contentString](self, "contentString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  +[AXLanguageManager sharedInstance](AXLanguageManager, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dialectForSystemLanguage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(v9, "specificLanguageID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localeWithLocaleIdentifier:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLocale:", v12);

  objc_msgSend(v7, "shortMonthSymbols");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v13);

  objc_msgSend(v7, "shortWeekdaySymbols");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v14);

  -[AXLanguageTaggedContent contentString](self, "contentString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "matchesInString:options:range:", v15, 0, 0, v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXLanguageTaggedContent setShorthandDateMatches:](self, "setShorthandDateMatches:", v16);

  -[AXLanguageTaggedContent shorthandDateMatches](self, "shorthandDateMatches");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __51__AXLanguageTaggedContent__searchForShorthandDates__block_invoke;
  v23 = &unk_1E24C80C0;
  v24 = self;
  v25 = v6;
  v18 = v6;
  objc_msgSend(v17, "ax_filteredArrayUsingBlock:", &v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXLanguageTaggedContent setShorthandDateMatches:](self, "setShorthandDateMatches:", v19, v20, v21, v22, v23, v24);

}

uint64_t __51__AXLanguageTaggedContent__searchForShorthandDates__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "resultType") == 8)
  {
    objc_msgSend(*(id *)(a1 + 32), "contentString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "range");
    objc_msgSend(v4, "substringWithRange:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = *(id *)(a1 + 40);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v8);
          if ((objc_msgSend(v7, "containsString:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13) & 1) != 0)
          {
            v9 = 1;
            goto LABEL_13;
          }
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_13:

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)_isNamedEntity:(id)a3
{
  id v3;
  char v4;
  _QWORD v6[4];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v3 = a3;
  NLTaggerSetString();
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  v6[3] = 0;
  objc_msgSend(v3, "length");
  NLTaggerEnumerateTokens();
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(v6, 8);
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __42__AXLanguageTaggedContent__isNamedEntity___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  char v7;
  char v8;
  int v9;
  void *v10;

  v5 = (void *)NLTaggerCopyTagForCurrentToken();
  v6 = v5;
  if (++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) < 2uLL)
  {
    v10 = v5;
    v7 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D17158]);
    v6 = v10;
    if ((v7 & 1) != 0
      || (v8 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D17160]), v6 = v10, (v8 & 1) != 0)
      || (v9 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D17150]), v6 = v10, v9))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    *a3 = 1;
  }

}

- (BOOL)_addLanguageTagForDateIfNecessary
{
  void *v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSUInteger location;
  NSUInteger length;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSUInteger v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  void *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  -[AXLanguageTaggedContent shorthandDateMatches](self, "shorthandDateMatches");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "count"))
  {
LABEL_10:

    return 0;
  }
  v4 = -[AXLanguageTaggedContent nextShorthandDateIndex](self, "nextShorthandDateIndex");
  -[AXLanguageTaggedContent shorthandDateMatches](self, "shorthandDateMatches");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v4 >= v6)
    return 0;
  -[AXLanguageTaggedContent shorthandDateMatches](self, "shorthandDateMatches");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", -[AXLanguageTaggedContent nextShorthandDateIndex](self, "nextShorthandDateIndex"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v3, "range");
  location = self->_currentChunk.location;
  length = self->_currentChunk.length;
  if (location != v8 || length != v9)
  {
    v18 = length + location;
    v19 = objc_msgSend(v3, "range");
    if (v18 > v19 + v20)
      -[AXLanguageTaggedContent setNextShorthandDateIndex:](self, "setNextShorthandDateIndex:", -[AXLanguageTaggedContent nextShorthandDateIndex](self, "nextShorthandDateIndex") + 1);
    goto LABEL_10;
  }
  -[AXLanguageTaggedContent setNextShorthandDateIndex:](self, "setNextShorthandDateIndex:", -[AXLanguageTaggedContent nextShorthandDateIndex](self, "nextShorthandDateIndex") + 1);
  +[AXLanguageManager sharedInstance](AXLanguageManager, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dialectForSystemLanguage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXLanguageTaggedContent setCurrentDialects:](self, "setCurrentDialects:", v14);

  AXLogSpokenContentTextProcessing();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    -[AXLanguageTaggedContent currentDialects](self, "currentDialects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138412290;
    v22 = v16;
    _os_log_impl(&dword_18C62B000, v15, OS_LOG_TYPE_INFO, "Setting currentDialetcs to dialectForSystemLanguage: %@", (uint8_t *)&v21, 0xCu);

  }
  -[AXLanguageTaggedContent _addTag](self, "_addTag");

  return 1;
}

- (BOOL)_addLanguageTagForCurrentChunk
{
  void *v3;
  NSUInteger v4;
  void *v5;
  unint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  NSObject *v19;
  BOOL v20;
  NSObject *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  double v27;
  uint64_t v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  $1230CF39250A084FEEB876D19862D23B *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  __int128 v39;
  unint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  void *v47;
  NSObject *v48;
  double v49;
  void *v50;
  NSObject *v51;
  void *v52;
  NSObject *v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  BOOL v60;
  NSObject *v61;
  void *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  __int128 v67;
  uint64_t v68;
  void *v69;
  float *v70;
  void *v71;
  $1230CF39250A084FEEB876D19862D23B *v72;
  NSObject *v73;
  void *v74;
  void *v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  double v80;
  uint8_t buf[4];
  uint64_t v82;
  __int16 v83;
  double v84;
  __int16 v85;
  NSObject *v86;
  _BYTE v87[128];
  _QWORD v88[5];

  v88[3] = *MEMORY[0x1E0C80C00];
  +[AXLanguageManager sharedInstance](AXLanguageManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self->_currentChunk.length + self->_currentChunk.location;
  -[AXLanguageTaggedContent contentString](self, "contentString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v4 > v6)
  {
    AXLogSpokenContentTextProcessing();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[AXLanguageTaggedContent _addLanguageTagForCurrentChunk].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

    -[AXLanguageTaggedContent contentString](self, "contentString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    self->_currentChunk.length = objc_msgSend(v15, "length") - self->_currentChunk.location;

  }
  +[AXSettings sharedInstance](AXSettings, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "spokenContentShouldUseLanguageDetection");

  if ((v17 & 1) != 0)
  {
    -[AXLanguageTaggedContent contentString](self, "contentString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "substringWithRange:", self->_currentChunk.location, self->_currentChunk.length);
    v19 = objc_claimAutoreleasedReturnValue();

    if (-[AXLanguageTaggedContent _addLanguageTagForDateIfNecessary](self, "_addLanguageTagForDateIfNecessary"))
    {
      v20 = 0;
    }
    else
    {
      v75 = v3;
      NLLanguageIdentifierCreate();
      -[NSObject length](v19, "length");
      NLLanguageIdentifierConsumeString();
      AXLogSpokenContentTextProcessing();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        -[NSObject stringByReplacingOccurrencesOfString:withString:](v19, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("<newline>"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v82 = (uint64_t)v22;
        _os_log_impl(&dword_18C62B000, v21, OS_LOG_TYPE_INFO, "Running language detection on chunk: '%@'", buf, 0xCu);

      }
      v73 = v19;

      objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "count");
      if (v24 >= 3)
        v25 = 3;
      else
        v25 = v24;
      v26 = (void *)objc_opt_new();
      if (v25)
      {
        v28 = 0;
        v29 = (double)((v25 + v25 * v25) >> 1);
        do
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v25 * 0.6 / v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v23, "objectAtIndexedSubscript:", v28);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "numberWithUnsignedInt:", -[AXLanguageTaggedContent langIDforLangCode:](self, "langIDforLangCode:", v32));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setObject:forKeyedSubscript:", v30, v33);

          ++v28;
          --v25;
        }
        while (v25);
      }
      LODWORD(v27) = 1053609165;
      v34 = -[AXLanguageTaggedContent _languageHintsEvenlyDistributedWithProbability:excludingHints:](self, "_languageHintsEvenlyDistributedWithProbability:excludingHints:", v26, v27);
      -[AXLanguageTaggedContent _allLangIDs](self, "_allLangIDs");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "count");
      v72 = v34;
      NLLanguageIdentifierSetLanguageHints();

      memset(v88, 0, 24);
      NLLanguageIdentifierGetTopHypotheses();
      objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = 0;
      v19 = v73;
      if (LODWORD(v88[0]) > 1)
      {
        if (*((float *)v88 + 1) <= 0.9)
        {
          v37 = 0;
        }
        else
        {
          v69 = (void *)v36;
          -[AXLanguageTaggedContent langCodeForlangId:](self, "langCodeForlangId:", *((float *)v88 + 1));
          v68 = objc_claimAutoreleasedReturnValue();
          v38 = 1;
          *(_QWORD *)&v39 = 138412802;
          v67 = v39;
          do
          {
            if (LODWORD(v88[v38]) < 2)
              break;
            v40 = (unint64_t)&v88[v38];
            if (*(float *)(v40 + 4) > 0.2)
            {
              -[AXLanguageTaggedContent langCodeForlangId:](self, "langCodeForlangId:");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v76 = 0u;
              v77 = 0u;
              v78 = 0u;
              v79 = 0u;
              objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v76, v87, 16);
              if (v43)
              {
                v44 = v43;
                v70 = (float *)(v40 | 4);
                v45 = *(_QWORD *)v77;
                while (2)
                {
                  for (i = 0; i != v44; ++i)
                  {
                    if (*(_QWORD *)v77 != v45)
                      objc_enumerationMutation(v42);
                    if (objc_msgSend(*(id *)(*((_QWORD *)&v76 + 1) + 8 * i), "hasPrefix:", v41, v67))
                    {
                      objc_msgSend(v75, "dialectForLanguageID:", v41);
                      v47 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v47)
                      {
                        objc_msgSend(v69, "addObject:", v47);
                        AXLogSpokenContentTextProcessing();
                        v48 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
                        {
                          v49 = *v70;
                          *(_DWORD *)buf = v67;
                          v82 = v68;
                          v83 = 2048;
                          v84 = v49;
                          v85 = 2112;
                          v86 = v73;
                          _os_log_impl(&dword_18C62B000, v48, OS_LOG_TYPE_INFO, "Adding secondary tag %@ with probability %f for chunk: %@", buf, 0x20u);
                        }

                      }
                      goto LABEL_38;
                    }
                  }
                  v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v76, v87, 16);
                  if (v44)
                    continue;
                  break;
                }
              }
LABEL_38:

            }
            ++v38;
          }
          while (v38 != 3);
          v19 = v73;
          v37 = (void *)v68;
          v36 = (uint64_t)v69;
        }
      }
      v50 = (void *)v36;
      AXLogSpokenContentTextProcessing();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        v82 = (uint64_t)v37;
        v83 = 2048;
        v84 = *((float *)v88 + 1);
        v85 = 2112;
        v86 = v19;
        _os_log_impl(&dword_18C62B000, v51, OS_LOG_TYPE_INFO, "Tagger chose tag '%@' with probability %f for chunk: %@", buf, 0x20u);
      }

      if (v37)
      {
        objc_msgSend(v75, "dialectForLanguageID:", v37);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXLanguageTaggedContent _overrideLanguageDetection:](self, "_overrideLanguageDetection:", v37);
        v53 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v75, "dialectForLanguageID:", v53);
        v54 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        v55 = v50;
        if (v54 != 0.0 && objc_msgSend(v50, "containsObject:", *(_QWORD *)&v54))
          objc_msgSend(v50, "removeObject:", *(_QWORD *)&v54);
        if (v52 && (objc_msgSend(v52, "isEqual:", *(_QWORD *)&v54) & 1) == 0)
          objc_msgSend(v50, "addObject:", v52);
        v74 = v52;
        +[AXLanguageManager sharedInstance](AXLanguageManager, "sharedInstance", v67);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "dialectForSystemLanguage");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "specificLanguageID");
        v58 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)&v54, "specificLanguageID");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = (objc_msgSend(v58, "isEqualToString:", v59) & 1) == 0
           && -[AXLanguageTaggedContent _isNamedEntity:](self, "_isNamedEntity:", v19);

        v20 = v54 == 0.0 || v60;
        if (v20)
        {
          AXLogSpokenContentTextProcessing();
          v61 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v82 = (uint64_t)v53;
            _os_log_impl(&dword_18C62B000, v61, OS_LOG_TYPE_INFO, "Couldn't find dialect for tag %@, manually tagging", buf, 0xCu);
          }
        }
        else
        {
          v71 = v58;
          self->_predictedByTagger = 1;
          v80 = v54;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v80, 1);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          -[AXLanguageTaggedContent setCurrentDialects:](self, "setCurrentDialects:", v62);

          AXLogSpokenContentTextProcessing();
          v63 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v82 = (uint64_t)v53;
            v83 = 2112;
            v84 = v54;
            _os_log_impl(&dword_18C62B000, v63, OS_LOG_TYPE_INFO, "Setting currentDialects to dialectForLanguageID: %@. %@", buf, 0x16u);
          }

          -[AXLanguageTaggedContent _addTag](self, "_addTag");
          -[AXLanguageTaggedContent tags](self, "tags");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          -[AXLanguageTaggedContent tags](self, "tags");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "objectAtIndex:", objc_msgSend(v65, "count") - 1);
          v61 = objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v55, "count"))
            -[NSObject addPredictedSecondaryDialects:](v61, "addPredictedSecondaryDialects:", v55);
          v58 = v71;
        }

      }
      else
      {
        AXLogSpokenContentTextProcessing();
        v53 = objc_claimAutoreleasedReturnValue();
        v20 = 1;
        if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18C62B000, v53, OS_LOG_TYPE_INFO, "Tagger couldn't find a language for current chunk. Manually tagging.", buf, 2u);
        }
        v55 = v50;
      }

      NLLanguageIdentifierRelease();
      free(v72);

      v3 = v75;
    }
  }
  else
  {
    AXLogSpokenContentTextProcessing();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18C62B000, v19, OS_LOG_TYPE_DEFAULT, "Language detection is disabled. will manually tag", buf, 2u);
    }
    v20 = 1;
  }

  return v20;
}

- (void)_debugLog:(id)a3 token:(id)a4 range:(_NSRange)a5 script:(id)a6 dialects:(id)a7
{
  NSUInteger length;
  NSUInteger location;
  id v12;
  id v13;
  __CFString *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  const __CFString *v20;
  uint64_t v21;
  int v22;
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  __CFString *v31;
  uint64_t v32;
  NSRange v33;

  length = a5.length;
  location = a5.location;
  v32 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = (__CFString *)a6;
  v15 = a7;
  AXLogSpokenContentTextProcessing();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v13, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("<newline>"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v33.location = location;
    v33.length = length;
    NSStringFromRange(v33);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = &stru_1E24CAB08;
    if (-[__CFString length](v14, "length"))
      v20 = v14;
    else
      v20 = &stru_1E24CAB08;
    v21 = objc_msgSend(v15, "count");
    if (v21)
    {
      objc_msgSend(v15, "description");
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v22 = 138413315;
    v23 = v12;
    v24 = 2113;
    v25 = v17;
    v26 = 2112;
    v27 = v18;
    v28 = 2112;
    v29 = v20;
    v30 = 2112;
    v31 = v19;
    _os_log_debug_impl(&dword_18C62B000, v16, OS_LOG_TYPE_DEBUG, "%@ '%{private}@' %@ %@ %@", (uint8_t *)&v22, 0x34u);
    if (v21)

  }
}

- (void)tagContent
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_18C62B000, log, OS_LOG_TYPE_DEBUG, "Will begin tagging by enumerating words", v1, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __37__AXLanguageTaggedContent_tagContent__block_invoke(uint64_t a1, unint64_t *a2)
{
  unint64_t v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  BOOL v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  _QWORD *v13;
  uint64_t v14;
  id *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;

  v3 = *a2;
  v4 = a2[1];
  objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", *a2, v4);
  v33 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)NLTaggerCopyTagForCurrentToken();
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)
     + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32);
  v7 = v3 >= v6;
  v8 = v3 - v6;
  if (!v7)
  {
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(_QWORD *)(v9 + 24);
    if (v10)
      *(_QWORD *)(v9 + 24) = v8 + v10;
  }
  AXLogSpokenContentTextProcessing();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);

  if (v12)
    objc_msgSend(*(id *)(a1 + 40), "_debugLog:token:range:script:dialects:", CFSTR("Enumerate token:"), v33, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), v5, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8));
  v13 = *(_QWORD **)(a1 + 40);
  if (v3 > v13[3] + v13[2])
    objc_msgSend(v13, "_manuallyProcessContentWithRange:");
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v16 = *(_QWORD *)(v14 + 40);
  v15 = (id *)(v14 + 40);
  if (!v16)
    objc_storeStrong(v15, v5);
  if (v4 != 1 || *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    if (v5)
      goto LABEL_13;
LABEL_25:
    objc_msgSend(*(id *)(a1 + 40), "_manuallyProcessContentWithRange:", v3, v4);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
    goto LABEL_26;
  }
  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v29, "characterIsMember:", objc_msgSend(v33, "characterAtIndex:", 0));

  if (!v5)
    goto LABEL_25;
LABEL_13:
  if (v5 == *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    v25 = *(_QWORD **)(a1 + 40);
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    {
      v25[3] += v4;
      goto LABEL_26;
    }
    if (objc_msgSend(v25, "_addLanguageTagForCurrentChunk"))
    {
      v26 = *(_QWORD *)(a1 + 40);
      v27 = *(_QWORD *)(v26 + 16);
      v28 = *(_QWORD *)(v26 + 24);
      *(_QWORD *)(v26 + 24) = 0;
      objc_msgSend(*(id *)(a1 + 40), "_manuallyProcessContentWithRange:", v27, v28);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
    }
    v20 = *(_QWORD *)(a1 + 40);
    v21 = *(_QWORD *)(v20 + 24);
    if (!v21)
    {
      *(_QWORD *)(v20 + 24) = v4;
      objc_msgSend(*(id *)(a1 + 40), "tags");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "lastObject");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setCreatedFromNewline:", 1);

      goto LABEL_23;
    }
    goto LABEL_22;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "_addLanguageTagForCurrentChunk"))
  {
    v17 = *(_QWORD *)(a1 + 40);
    v18 = *(_QWORD *)(v17 + 16);
    v19 = *(_QWORD *)(v17 + 24);
    *(_QWORD *)(v17 + 24) = 0;
    objc_msgSend(*(id *)(a1 + 40), "_manuallyProcessContentWithRange:", v18, v19);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v5);
  v20 = *(_QWORD *)(a1 + 40);
  v21 = *(_QWORD *)(v20 + 24);
  if (v21)
  {
LABEL_22:
    *(_QWORD *)(v20 + 24) = v21 + v4;
    goto LABEL_23;
  }
  *(_QWORD *)(v20 + 24) = v4;
  v22 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  objc_msgSend(*(id *)(a1 + 40), "tags");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "lastObject");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setCreatedFromNewline:", v22);

LABEL_23:
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
LABEL_26:
  v30 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  *(_QWORD *)(v30 + 32) = v3;
  *(_QWORD *)(v30 + 40) = v4;

}

- (BOOL)_isStringCombinationOfCommonAndEmoji:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t *v9;
  unint64_t v10;
  BOOL v11;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;

  v3 = a3;
  +[AXLanguageManager sharedInstance](AXLanguageManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  while (v5 < objc_msgSend(v3, "length"))
  {
    v6 = objc_msgSend(v3, "length") - v5;
    v13 = 0;
    v14 = &v13;
    v15 = 0x3010000000;
    v16 = &unk_18C749431;
    v17 = 0;
    v18 = 0;
    objc_msgSend(v4, "commonCharacters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v3, "rangeOfCharacterFromSet:options:range:", v7, 0, v5, v6);
    v18 = v8;

    v9 = v14;
    v10 = v14[4];
    if (v10 <= v5)
    {
      if (v10 != v5)
      {
LABEL_8:
        _Block_object_dispose(&v13, 8);
        v11 = 0;
        goto LABEL_9;
      }
    }
    else
    {
      objc_msgSend(v3, "length");
      CEMEnumerateEmojiTokensInStringWithBlock();
      v9 = v14;
      if (v14[4] > v5)
        goto LABEL_8;
    }
    v5 += v9[5];
    _Block_object_dispose(&v13, 8);
  }
  v11 = v5 == objc_msgSend(v3, "length");
LABEL_9:

  return v11;
}

uint64_t __64__AXLanguageTaggedContent__isStringCombinationOfCommonAndEmoji___block_invoke(uint64_t result, uint64_t a2, unint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t v5;

  if (a3 >= *(_QWORD *)(result + 40))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
    *(_QWORD *)(v5 + 32) = a3;
    *(_QWORD *)(v5 + 40) = a4;
    *a5 = 1;
  }
  return result;
}

- (BOOL)langMapIsSignificant:(id)a3
{
  return 1;
}

- (id)significantAmbiguousLangMapsForUserKeyboards
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  +[AXLanguageManager sharedInstance](AXLanguageManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v2, "ambiguousDialectsFromUserKeyboardPreferences", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "langMap");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)unambiguousLangMaps
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[AXLanguageTaggedContent tags](self, "tags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v8);
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        objc_msgSend(v9, "unambiguousDialects", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v18;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v18 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14), "langMap");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "addObject:", v15);

              ++v14;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          }
          while (v12);
        }

        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)ambiguousLangMaps
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[AXLanguageTaggedContent tags](self, "tags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v8);
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        objc_msgSend(v9, "ambiguousDialects", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v18;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v18 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14), "langMap");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "addObject:", v15);

              ++v14;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          }
          while (v12);
        }

        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v6);
  }

  return v3;
}

- (BOOL)hasOnlyWesternLangMaps
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  int v20;
  BOOL v21;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  -[AXLanguageTaggedContent tags](self, "tags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (!v3)
  {
    v21 = 1;
    goto LABEL_27;
  }
  v4 = v3;
  v5 = *(_QWORD *)v33;
  v23 = *(_QWORD *)v33;
  while (2)
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v33 != v5)
        objc_enumerationMutation(v2);
      v7 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      objc_msgSend(v7, "unambiguousDialects");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v29;
LABEL_8:
        v12 = 0;
        while (1)
        {
          if (*(_QWORD *)v29 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v12), "langMap");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isWestern");

          if (!v14)
            goto LABEL_25;
          if (v10 == ++v12)
          {
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
            if (v10)
              goto LABEL_8;
            break;
          }
        }
      }

      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      objc_msgSend(v7, "ambiguousDialects");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v25;
LABEL_16:
        v18 = 0;
        while (1)
        {
          if (*(_QWORD *)v25 != v17)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v18), "langMap");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "isWestern");

          if (!v20)
            break;
          if (v16 == ++v18)
          {
            v16 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
            if (v16)
              goto LABEL_16;
            goto LABEL_22;
          }
        }
LABEL_25:

        v21 = 0;
        goto LABEL_27;
      }
LABEL_22:

      v5 = v23;
    }
    v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    v21 = 1;
    if (v4)
      continue;
    break;
  }
LABEL_27:

  return v21;
}

- (BOOL)hasOnlyNonWesternLangMaps
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  char v20;
  BOOL v21;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  -[AXLanguageTaggedContent tags](self, "tags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (!v3)
  {
    v21 = 1;
    goto LABEL_27;
  }
  v4 = v3;
  v5 = *(_QWORD *)v33;
  v23 = *(_QWORD *)v33;
  while (2)
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v33 != v5)
        objc_enumerationMutation(v2);
      v7 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      objc_msgSend(v7, "unambiguousDialects");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v29;
LABEL_8:
        v12 = 0;
        while (1)
        {
          if (*(_QWORD *)v29 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v12), "langMap");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isWestern");

          if ((v14 & 1) != 0)
            goto LABEL_25;
          if (v10 == ++v12)
          {
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
            if (v10)
              goto LABEL_8;
            break;
          }
        }
      }

      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      objc_msgSend(v7, "ambiguousDialects");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v25;
LABEL_16:
        v18 = 0;
        while (1)
        {
          if (*(_QWORD *)v25 != v17)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v18), "langMap");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "isWestern");

          if ((v20 & 1) != 0)
            break;
          if (v16 == ++v18)
          {
            v16 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
            if (v16)
              goto LABEL_16;
            goto LABEL_22;
          }
        }
LABEL_25:

        v21 = 0;
        goto LABEL_27;
      }
LABEL_22:

      v5 = v23;
    }
    v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    v21 = 1;
    if (v4)
      continue;
    break;
  }
LABEL_27:

  return v21;
}

- (id)_preferredLanguagesForTagging
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  +[AXSettings sharedInstance](AXSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "spokenContentDefaultFallbackLanguage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v6[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_manuallyProcessContentWithRange:(_NSRange)a3
{
  NSUInteger length;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  __int128 v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  NSArray *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  NSArray *v25;
  NSObject *v26;
  NSArray *v27;
  NSObject *v28;
  NSArray *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSArray *currentDialects;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  NSArray *v42;
  void *v43;
  NSArray *v44;
  void *v45;
  NSArray *v46;
  void *v47;
  NSArray *v48;
  void *v49;
  NSArray *v50;
  void *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  _BOOL4 v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  __int128 v66;
  void *v67;
  NSUInteger location;
  _QWORD v69[4];
  id v70;
  _BYTE *v71;
  void *v72;
  uint8_t buf[4];
  NSArray *v74;
  __int16 v75;
  void *v76;
  _BYTE v77[24];
  void *v78;
  __int16 v79;
  NSArray *v80;
  __int16 v81;
  void *v82;
  uint64_t v83;

  length = a3.length;
  location = a3.location;
  v83 = *MEMORY[0x1E0C80C00];
  AXLogSpokenContentTextProcessing();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);

  if (v6)
  {
    -[AXLanguageTaggedContent contentString](self, "contentString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "substringWithRange:", location, length);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXLanguageTaggedContent _debugLog:token:range:script:dialects:](self, "_debugLog:token:range:script:dialects:", CFSTR("Manual process:"), v8, location, length, 0, self->_currentDialects);

  }
  +[AXLanguageManager sharedInstance](AXLanguageManager, "sharedInstance");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  if (length)
  {
    v10 = 0;
    *(_QWORD *)&v9 = 138413315;
    v66 = v9;
    do
    {
      -[AXLanguageTaggedContent contentString](self, "contentString", v66);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "rangeOfComposedCharacterSequenceAtIndex:", location + v10);
      v14 = v13;

      -[AXLanguageTaggedContent contentString](self, "contentString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "substringWithRange:", v12, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      AXLogSpokenContentTextProcessing();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", length);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("<newline>"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (self->_currentDialects)
          currentDialects = self->_currentDialects;
        else
          currentDialects = (NSArray *)&stru_1E24CAB08;
        NSStringFromRange(self->_currentChunk);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v77 = v66;
        *(_QWORD *)&v77[4] = v31;
        *(_WORD *)&v77[12] = 2112;
        *(_QWORD *)&v77[14] = v32;
        *(_WORD *)&v77[22] = 2113;
        v78 = v33;
        v79 = 2112;
        v80 = currentDialects;
        v81 = 2112;
        v82 = v35;
        _os_log_debug_impl(&dword_18C62B000, v17, OS_LOG_TYPE_DEBUG, "Iterate char %@/%@: '%{private}@' %@ %@", v77, 0x34u);

      }
      v18 = objc_msgSend(v16, "characterAtIndex:", 0);
      if (objc_msgSend(v16, "length") == 1 && objc_msgSend(v67, "isCharacterCommon:", v18))
      {
        AXLogSpokenContentTextProcessing();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          if (self->_currentDialects)
            v48 = self->_currentDialects;
          else
            v48 = (NSArray *)&stru_1E24CAB08;
          NSStringFromRange(self->_currentChunk);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v77 = 138412546;
          *(_QWORD *)&v77[4] = v48;
          *(_WORD *)&v77[12] = 2112;
          *(_QWORD *)&v77[14] = v49;
          _os_log_debug_impl(&dword_18C62B000, v19, OS_LOG_TYPE_DEBUG, "Skipping common char. %@ %@", v77, 0x16u);

        }
      }
      else
      {
        if (-[NSArray count](self->_currentDialects, "count"))
        {
          *(_QWORD *)v77 = 0;
          *(_QWORD *)&v77[8] = v77;
          *(_QWORD *)&v77[16] = 0x2020000000;
          LOBYTE(v78) = 0;
          if (AXLanguageIsSpeakableEmojiString(v16))
          {
            *(_BYTE *)(*(_QWORD *)&v77[8] + 24) = 1;
LABEL_23:
            AXLogSpokenContentTextProcessing();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            {
              v44 = self->_currentDialects;
              NSStringFromRange(self->_currentChunk);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v74 = v44;
              v75 = 2112;
              v76 = v45;
              _os_log_debug_impl(&dword_18C62B000, v22, OS_LOG_TYPE_DEBUG, "Add to exisiting %@ %@", buf, 0x16u);

            }
          }
          else
          {
            v21 = self->_currentDialects;
            v69[0] = MEMORY[0x1E0C809B0];
            v69[1] = 3221225472;
            v69[2] = __60__AXLanguageTaggedContent__manuallyProcessContentWithRange___block_invoke;
            v69[3] = &unk_1E24C8160;
            v70 = v16;
            v71 = v77;
            -[NSArray enumerateObjectsUsingBlock:](v21, "enumerateObjectsUsingBlock:", v69);

            if (*(_BYTE *)(*(_QWORD *)&v77[8] + 24))
              goto LABEL_23;
            -[AXLanguageTaggedContent _preferredLanguagesForTagging](self, "_preferredLanguagesForTagging");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "dialectsThatCanSpeakCharacter:overridePreferredLanguages:allowTransliteration:preferOverrides:", v18, v23, 0, 1);
            v22 = objc_claimAutoreleasedReturnValue();

            if (-[NSObject count](v22, "count"))
            {
              if (self->_currentDialects)
                -[AXLanguageTaggedContent _addTag](self, "_addTag");
              -[AXLanguageTaggedContent setCurrentDialects:](self, "setCurrentDialects:", v22);
              AXLogSpokenContentTextProcessing();
              v24 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
              {
                -[AXLanguageTaggedContent _preferredLanguagesForTagging](self, "_preferredLanguagesForTagging");
                v25 = (NSArray *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v74 = v25;
                _os_log_impl(&dword_18C62B000, v24, OS_LOG_TYPE_INFO, "OverridePreferredLanguages: %@", buf, 0xCu);

              }
              AXLogSpokenContentTextProcessing();
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
              {
                -[AXLanguageTaggedContent currentDialects](self, "currentDialects");
                v27 = (NSArray *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v74 = v27;
                _os_log_impl(&dword_18C62B000, v26, OS_LOG_TYPE_INFO, "Setting currentDialects to dialectsThatCanSpeakCharacter: %@", buf, 0xCu);

              }
              AXLogSpokenContentTextProcessing();
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
              {
                v29 = self->_currentDialects;
                NSStringFromRange(self->_currentChunk);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v74 = v29;
                v75 = 2112;
                v76 = v30;
                _os_log_impl(&dword_18C62B000, v28, OS_LOG_TYPE_INFO, "Start new chunk %@ %@", buf, 0x16u);

              }
            }
            else
            {
              AXLogSpokenContentTextProcessing();
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
              {
                v42 = self->_currentDialects;
                NSStringFromRange(self->_currentChunk);
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v74 = v42;
                v75 = 2112;
                v76 = v43;
                _os_log_impl(&dword_18C62B000, v28, OS_LOG_TYPE_INFO, "Char is unspeakable. %@ %@", buf, 0x16u);

              }
            }

          }
          _Block_object_dispose(v77, 8);
          goto LABEL_26;
        }
        AXLogSpokenContentTextProcessing();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          if (self->_currentDialects)
            v46 = self->_currentDialects;
          else
            v46 = (NSArray *)&stru_1E24CAB08;
          NSStringFromRange(self->_currentChunk);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v77 = 138412546;
          *(_QWORD *)&v77[4] = v46;
          *(_WORD *)&v77[12] = 2112;
          *(_QWORD *)&v77[14] = v47;
          _os_log_debug_impl(&dword_18C62B000, v20, OS_LOG_TYPE_DEBUG, "No current dialects. %@ %@", v77, 0x16u);

        }
        if ((AXLanguageIsSpeakableEmojiString(v16) & 1) != 0 || objc_msgSend(v16, "length") != 1)
          goto LABEL_26;
        if ((_DWORD)v18 == 8722)
          v18 = 45;
        else
          v18 = v18;
        if (!objc_msgSend(v67, "isCharacterCommon:", v18))
        {
          -[AXLanguageTaggedContent _preferredLanguagesForTagging](self, "_preferredLanguagesForTagging");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "dialectsThatCanSpeakCharacter:overridePreferredLanguages:allowTransliteration:preferOverrides:", v18, v36, 0, 1);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[AXLanguageTaggedContent setCurrentDialects:](self, "setCurrentDialects:", v37);

          AXLogSpokenContentTextProcessing();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
          {
            -[AXLanguageTaggedContent _preferredLanguagesForTagging](self, "_preferredLanguagesForTagging");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v77 = 138412290;
            *(_QWORD *)&v77[4] = v39;
            _os_log_impl(&dword_18C62B000, v38, OS_LOG_TYPE_INFO, "OverridePreferredLanguages: %@", v77, 0xCu);

          }
          AXLogSpokenContentTextProcessing();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            -[AXLanguageTaggedContent currentDialects](self, "currentDialects");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v77 = 138412290;
            *(_QWORD *)&v77[4] = v41;
            _os_log_impl(&dword_18C62B000, v40, OS_LOG_TYPE_INFO, "Setting currentDialects to dialectsThatCanSpeakCharacter: %@", v77, 0xCu);

          }
          goto LABEL_26;
        }
        AXLogSpokenContentTextProcessing();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          if (self->_currentDialects)
            v50 = self->_currentDialects;
          else
            v50 = (NSArray *)&stru_1E24CAB08;
          NSStringFromRange(self->_currentChunk);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v77 = 138412546;
          *(_QWORD *)&v77[4] = v50;
          *(_WORD *)&v77[12] = 2112;
          *(_QWORD *)&v77[14] = v51;
          _os_log_debug_impl(&dword_18C62B000, v19, OS_LOG_TYPE_DEBUG, "Skipping first common char. %@ %@", v77, 0x16u);

        }
      }

LABEL_26:
      ++self->_currentChunk.length;

      ++v10;
    }
    while (length != v10);
  }
  +[AXLanguageManager sharedInstance](AXLanguageManager, "sharedInstance");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "dialectForCurrentLocale");
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v53)
  {
    AXLogSpokenContentTextProcessing();
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v67, "systemLanguageID");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "userLocale");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "objectForKey:", *MEMORY[0x1E0C997E8]);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "userLocale");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "objectForKey:", *MEMORY[0x1E0C997B0]);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v77 = 138412802;
      *(_QWORD *)&v77[4] = v61;
      *(_WORD *)&v77[12] = 2112;
      *(_QWORD *)&v77[14] = v63;
      *(_WORD *)&v77[22] = 2112;
      v78 = v65;
      _os_log_impl(&dword_18C62B000, v54, OS_LOG_TYPE_INFO, "Failed to find dialect map for system language: %@, locale language: %@, locale region: %@", v77, 0x20u);

    }
    goto LABEL_68;
  }
  -[AXLanguageTaggedContent currentDialects](self, "currentDialects");
  v54 = objc_claimAutoreleasedReturnValue();
  if ((-[NSObject containsObject:](v54, "containsObject:", v53) & 1) != 0)
  {
LABEL_68:

    goto LABEL_69;
  }
  objc_msgSend(v53, "speakableCharacters");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v55 == 0;

  if (v56)
  {
    v72 = v53;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v72, 1);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXLanguageTaggedContent currentDialects](self, "currentDialects");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "arrayByAddingObjectsFromArray:", v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXLanguageTaggedContent setCurrentDialects:](self, "setCurrentDialects:", v59);

    AXLogSpokenContentTextProcessing();
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v53, "specificLanguageID");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v77 = 138412290;
      *(_QWORD *)&v77[4] = v60;
      _os_log_impl(&dword_18C62B000, v54, OS_LOG_TYPE_INFO, "Adding language %@ to content because we don't have spoken range", v77, 0xCu);

    }
    goto LABEL_68;
  }
LABEL_69:

}

uint64_t __60__AXLanguageTaggedContent__manuallyProcessContentWithRange___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "canSpeakString:allowsTransliteration:", *(_QWORD *)(a1 + 32), 0);
  if ((_DWORD)result)
  {
    *a4 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

- (void)_addTag
{
  OUTLINED_FUNCTION_0_0(&dword_18C62B000, a1, a3, "Current dialects unexpectedly nil", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (id)primaryAmbiguousDialect
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  -[AXLanguageTaggedContent ambiguousLangMaps](self, "ambiguousLangMaps");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[AXSettings sharedInstance](AXSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "spokenContentDefaultFallbackLanguage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v5 = v2;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v29;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v29 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v10, "generalLanguageID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqual:", v4);

          if ((v12 & 1) != 0)
          {
            objc_msgSend(v10, "defaultDialect");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_22;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        if (v7)
          continue;
        break;
      }
    }

  }
  +[AXLanguageManager sharedInstance](AXLanguageManager, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "systemLanguageID");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v14 = v2;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v25;
LABEL_13:
    v18 = 0;
    while (1)
    {
      if (*(_QWORD *)v25 != v17)
        objc_enumerationMutation(v14);
      v19 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v18);
      objc_msgSend(v19, "generalLanguageID", (_QWORD)v24);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isEqual:", v5);

      if ((v21 & 1) != 0)
        break;
      if (v16 == ++v18)
      {
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v16)
          goto LABEL_13;
        goto LABEL_19;
      }
    }
  }
  else
  {
LABEL_19:

    objc_msgSend(v14, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v19;
  }
  objc_msgSend(v19, "defaultDialect", (_QWORD)v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_22:
  return v22;
}

- (id)primaryUnambiguousDialect
{
  void *v2;
  void *v3;
  void *v4;

  -[AXLanguageTaggedContent unambiguousLangMaps](self, "unambiguousLangMaps");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultDialect");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)updateTagsForLocalePrefChange
{
  unint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id obj;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  -[AXLanguageTaggedContent tags](self, "tags");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v23)
  {
    v22 = *(_QWORD *)v33;
    v2 = 0x1E0C99000uLL;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v33 != v22)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v3);
        objc_msgSend(*(id *)(v2 + 3600), "orderedSet");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        objc_msgSend(v4, "ambiguousDialects");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v29;
          do
          {
            v10 = 0;
            do
            {
              if (*(_QWORD *)v29 != v9)
                objc_enumerationMutation(v6);
              objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v10), "langMap");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "defaultDialect");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "addObject:", v12);

              ++v10;
            }
            while (v8 != v10);
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
          }
          while (v8);
        }

        objc_msgSend(*(id *)(v2 + 3600), "orderedSet");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        objc_msgSend(v4, "unambiguousDialects");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v25;
          do
          {
            v18 = 0;
            do
            {
              if (*(_QWORD *)v25 != v17)
                objc_enumerationMutation(v14);
              objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v18), "langMap");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "defaultDialect");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "addObject:", v20);

              ++v18;
            }
            while (v16 != v18);
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
          }
          while (v16);
        }

        objc_msgSend(v4, "setAmbiguousDialects:", v5);
        objc_msgSend(v4, "setUnambiguousDialects:", v13);

        ++v3;
        v2 = 0x1E0C99000;
      }
      while (v3 != v23);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v23);
  }

}

- (NSMutableArray)tags
{
  return self->_tags;
}

- (void)setTags:(id)a3
{
  objc_storeStrong((id *)&self->_tags, a3);
}

- (BOOL)isTagged
{
  return self->_tagged;
}

- (void)setTagged:(BOOL)a3
{
  self->_tagged = a3;
}

- (NSMutableOrderedSet)unpredictedAmbiguousLangMaps
{
  return self->_unpredictedAmbiguousLangMaps;
}

- (void)setUnpredictedAmbiguousLangMaps:(id)a3
{
  objc_storeStrong((id *)&self->_unpredictedAmbiguousLangMaps, a3);
}

- (NSString)userPreferredLangID
{
  return self->_userPreferredLangID;
}

- (void)setUserPreferredLangID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSMutableOrderedSet)predictedSecondaryLangMaps
{
  return self->_predictedSecondaryLangMaps;
}

- (void)setPredictedSecondaryLangMaps:(id)a3
{
  objc_storeStrong((id *)&self->_predictedSecondaryLangMaps, a3);
}

- (NSMutableString)contentString
{
  return self->_contentString;
}

- (void)setContentString:(id)a3
{
  objc_storeStrong((id *)&self->_contentString, a3);
}

- (NSArray)currentDialects
{
  return self->_currentDialects;
}

- (void)setCurrentDialects:(id)a3
{
  objc_storeStrong((id *)&self->_currentDialects, a3);
}

- (NSArray)shorthandDateMatches
{
  return self->_shorthandDateMatches;
}

- (void)setShorthandDateMatches:(id)a3
{
  objc_storeStrong((id *)&self->_shorthandDateMatches, a3);
}

- (unint64_t)nextShorthandDateIndex
{
  return self->_nextShorthandDateIndex;
}

- (void)setNextShorthandDateIndex:(unint64_t)a3
{
  self->_nextShorthandDateIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shorthandDateMatches, 0);
  objc_storeStrong((id *)&self->_contentString, 0);
  objc_storeStrong((id *)&self->_predictedSecondaryLangMaps, 0);
  objc_storeStrong((id *)&self->_userPreferredLangID, 0);
  objc_storeStrong((id *)&self->_unpredictedAmbiguousLangMaps, 0);
  objc_storeStrong((id *)&self->_tags, 0);
  objc_storeStrong((id *)&self->_currentDialects, 0);
}

- (void)_addLanguageTagForCurrentChunk
{
  OUTLINED_FUNCTION_0_0(&dword_18C62B000, a1, a3, "The current chunk is too long, we are out of bounds. Our bookkeeping got out of sync somewhere. Please file a radar with the exact text you tried to speak.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

@end
