@implementation AXSSVoiceTagger

+ (id)voiceTagsForContent:(id)a3 preferredLangauge:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t location;
  NSUInteger length;
  void *v15;
  uint64_t v16;
  char v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  id v22;
  NSUInteger v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  int v30;
  id v31;
  void *v32;
  uint64_t v33;
  NSUInteger v34;
  NSUInteger v35;
  NSUInteger v36;
  NSRange v37;
  void *v38;
  id v39;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  NSRange v47;
  NSRange v48;

  v6 = a3;
  v7 = a4;
  v43 = (id)objc_opt_new();
  v44 = v6;
  +[AXSSLanguageTagger languageTagsForContent:](AXSSLanguageTagger, "languageTagsForContent:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[AXSSLanguageManager shared](AXSSLanguageManager, "shared");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v7;
  v10 = v7;
  v11 = v8;
  objc_msgSend(v9, "dialectForLanguageID:", v10);
  v12 = objc_claimAutoreleasedReturnValue();

  v45 = (void *)v12;
  if (objc_msgSend(v8, "count"))
  {
    location = 0;
    length = 0;
    v15 = 0;
    v16 = 0;
    v17 = v12 != 0;
    v46 = a1;
    v42 = v11;
    while (1)
    {
      objc_msgSend(v11, "objectAtIndexedSubscript:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v17 & 1) != 0)
      {
        objc_msgSend(a1, "_currentLineContentForTag:inTags:", v18, v11);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v45, "canSpeakString:", v19);
        if (v20)
        {
          if (v15)
          {
            objc_msgSend(a1, "_createVoiceTagWithDialect:range:content:createdFromNewline:", v15, location, length, v44, 0);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "addObject:", v21);

          }
          v22 = v45;

          location = objc_msgSend(v18, "taggedRange");
          length = v23;
          v15 = v22;
          a1 = v46;
        }
        v17 = v20 ^ 1;

      }
      else
      {
        v17 = 0;
      }
      objc_msgSend(a1, "_primaryDialectForTag:inTags:", v18, v11);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v15, "isEqual:", v24) & 1) != 0 || (objc_msgSend(v15, "isEqual:", v45) & 1) != 0)
      {
        v25 = 1;
      }
      else
      {
        objc_msgSend(v18, "dialect");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v15, "isEqual:", v26);

      }
      objc_msgSend(v18, "taggedString");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v15, "canSpeakString:", v27);

      if (!v15)
        break;
      if ((v28 & v25) == 1)
      {
        a1 = v46;
LABEL_22:
        v48.location = objc_msgSend(v18, "taggedRange");
        v48.length = v36;
        v47.location = location;
        v47.length = length;
        v37 = NSUnionRange(v47, v48);
        location = v37.location;
        length = v37.length;
        goto LABEL_23;
      }
      a1 = v46;
      objc_msgSend(v46, "_createVoiceTagWithDialect:range:content:createdFromNewline:", v15, location, length, v44, 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "addObject:", v32);

      objc_msgSend(v18, "dialect");
      v33 = objc_claimAutoreleasedReturnValue();

      location = objc_msgSend(v18, "taggedRange");
      length = v34;
      v17 = 1;
      v15 = (void *)v33;
LABEL_23:
      if (objc_msgSend(v18, "createdFromNewline"))
      {
        v17 = 1;
        objc_msgSend(a1, "_createVoiceTagWithDialect:range:content:createdFromNewline:", v15, location, length, v44, 1);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "addObject:", v38);

        v15 = 0;
      }
      v11 = v42;

      if (++v16 >= (unint64_t)objc_msgSend(v42, "count"))
        goto LABEL_28;
    }
    objc_msgSend(v18, "content");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v24, "canSpeakString:", v29);

    if (v30)
    {
      v31 = v24;
    }
    else
    {
      objc_msgSend(v18, "dialect");
      v31 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15 = v31;
    a1 = v46;
    location = objc_msgSend(v18, "taggedRange");
    length = v35;
    goto LABEL_22;
  }
  v15 = 0;
LABEL_28:
  v39 = v43;

  return v39;
}

+ (id)_createVoiceTagWithDialect:(id)a3 range:(_NSRange)a4 content:(id)a5 createdFromNewline:(BOOL)a6
{
  uint64_t v6;
  NSUInteger length;
  NSUInteger location;
  id v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  int v20;
  unint64_t v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  AXSSLanguageTag *v27;
  unsigned int v29;
  NSUInteger v30;

  v6 = a6;
  length = a4.length;
  location = a4.location;
  v10 = a3;
  v11 = a5;
  +[AXSSLanguageManager shared](AXSSLanguageManager, "shared");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "systemLanguageID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hasPrefix:", CFSTR("en"));

  objc_msgSend(v11, "substringWithRange:", location, length);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringByTrimmingCharactersInSet:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "specificLanguageID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v18, "hasPrefix:", CFSTR("el")))
  {
LABEL_11:

    goto LABEL_12;
  }
  v19 = objc_msgSend(v17, "length");

  if (v19 < 0xA)
    v20 = v14;
  else
    v20 = 0;
  if (v20 == 1)
  {
    v30 = length;
    if (objc_msgSend(v17, "length"))
    {
      v29 = v6;
      v21 = 0;
      v22 = 1;
      do
      {
        v23 = objc_msgSend(v17, "characterAtIndex:", 0);
        +[AXSSLanguageManager shared](AXSSLanguageManager, "shared");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "dialectForSystemLanguage");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v22 &= objc_msgSend(v25, "canSpeakCharacter:", v23);

        ++v21;
      }
      while (v21 < objc_msgSend(v17, "length"));
      v6 = v29;
      if ((v22 & 1) == 0)
      {
        length = v30;
        goto LABEL_12;
      }
    }
    +[AXSSLanguageManager shared](AXSSLanguageManager, "shared");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dialectForSystemLanguage");
    v26 = objc_claimAutoreleasedReturnValue();

    v10 = (id)v26;
    length = v30;
    goto LABEL_11;
  }
LABEL_12:
  v27 = -[AXSSLanguageTag initWithDialect:range:content:createdFromNewline:]([AXSSLanguageTag alloc], "initWithDialect:range:content:createdFromNewline:", v10, location, length, v11, v6);

  return v27;
}

+ (id)markupVoiceTagForAttributedString:(id)a3 preferredLangauge:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithAttributedString:", v6);
  objc_msgSend(v6, "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v7;
  objc_msgSend(a1, "voiceTagsForContent:preferredLangauge:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v16, "dialect");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "voiceIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v16, "taggedRange");
        objc_msgSend(v8, "addAttribute:value:range:", CFSTR("AXVoiceIdentifier"), v18, v19, v20);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v13);
  }

  v21 = (void *)objc_msgSend(v8, "copy");
  return v21;
}

+ (id)_currentLineContentForTag:(id)a3 inTags:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v5 = a3;
  v6 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__2;
  v20 = __Block_byref_object_dispose__2;
  objc_msgSend(v5, "taggedString");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "content");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "content");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __52__AXSSVoiceTagger__currentLineContentForTag_inTags___block_invoke;
  v13[3] = &unk_1E5F99088;
  v10 = v5;
  v14 = v10;
  v15 = &v16;
  objc_msgSend(v7, "enumerateSubstringsInRange:options:usingBlock:", 0, v9, 4, v13);

  v11 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v11;
}

void __52__AXSSVoiceTagger__currentLineContentForTag_inTags___block_invoke(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  NSUInteger v12;
  NSRange v13;
  uint64_t v14;
  id v16;
  NSRange v17;
  NSRange v18;

  v16 = a2;
  v18.location = objc_msgSend(*(id *)(a1 + 32), "taggedRange");
  v18.length = v12;
  v17.location = a3;
  v17.length = a4;
  v13 = NSIntersectionRange(v17, v18);
  if (v13.location == objc_msgSend(*(id *)(a1 + 32), "taggedRange") && v13.length == v14)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a7 = 1;
  }

}

+ (id)_primaryDialectForTag:(id)a3 inTags:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a1, "_currentLineContentForTag:inTags:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[AXSSLanguageTagger primaryLanguageForContent:](AXSSLanguageTagger, "primaryLanguageForContent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[AXSSLanguageManager shared](AXSSLanguageManager, "shared");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dialectForLanguageID:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
