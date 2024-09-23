@implementation AXSSLanguageLoader

+ (id)loadLanguages
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__AXSSLanguageLoader_loadLanguages__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (loadLanguages_onceToken != -1)
    dispatch_once(&loadLanguages_onceToken, block);
  return (id)objc_msgSend((id)loadLanguages_langMaps, "copy");
}

void __35__AXSSLanguageLoader_loadLanguages__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  AXSSDialectMap *v24;
  AXSSLanguageMap *v25;
  void *v26;
  void *v27;
  id obj;
  uint64_t v29;
  uint64_t v30;
  unsigned int v31;
  unsigned int v32;
  unsigned int v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)loadLanguages_langMaps;
  loadLanguages_langMaps = v2;

  v39 = a1;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pathForResource:ofType:", CFSTR("SynthesizerLanguageMap"), CFSTR("plist"));
  v5 = objc_claimAutoreleasedReturnValue();

  v27 = (void *)v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v5);
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("languageMaps"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
  if (v30)
  {
    v29 = *(_QWORD *)v48;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v48 != v29)
          objc_enumerationMutation(obj);
        v37 = v6;
        v7 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v6);
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("languageID"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("alternateLanguageIDs"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ambiguousWithLanguages"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("isAmbiguous"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v8, "BOOLValue");

        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("isWestern"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v9, "BOOLValue");

        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("isRTL"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v10, "BOOLValue");

        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("localeLanguageMaps"));
        v38 = (id)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
        if (v42)
        {
          v40 = *(_QWORD *)v44;
          do
          {
            for (i = 0; i != v42; ++i)
            {
              if (*(_QWORD *)v44 != v40)
                objc_enumerationMutation(v38);
              v12 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
              objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("localeID"));
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", v13);
              objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("voiceName"));
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("languageID"));
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("speakableCharacterRanges"));
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(v39 + 32), "_characterSetForRanges:", v17);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("supplementaryCharacterRanges"));
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(*(id *)(v39 + 32), "_characterSetForRanges:", v19);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "formUnionWithCharacterSet:", v20);
              v21 = *(void **)(v39 + 32);
              objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("secondaryLanguageRange"));
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "_characterSetForRanges:", v22);
              v23 = (void *)objc_claimAutoreleasedReturnValue();

              v24 = -[AXSSDialectMap initWithLocale:voiceName:specificLanguageID:voiceIdentifier:speakableCharacters:secondaryLanguageRange:]([AXSSDialectMap alloc], "initWithLocale:voiceName:specificLanguageID:voiceIdentifier:speakableCharacters:secondaryLanguageRange:", v14, v15, v16, 0, v18, v23);
              objc_msgSend(v41, "addObject:", v24);

            }
            v42 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
          }
          while (v42);
        }

        v25 = -[AXSSLanguageMap initWithLanguageID:isWestern:isAmbiguous:isRTL:dialects:alternateLanguageIDs:associatedAmbiguousLanguages:]([AXSSLanguageMap alloc], "initWithLanguageID:isWestern:isAmbiguous:isRTL:dialects:alternateLanguageIDs:associatedAmbiguousLanguages:", v36, v32, v33, v31, v41, v35, v34);
        objc_msgSend((id)loadLanguages_langMaps, "addObject:", v25);

        v6 = v37 + 1;
      }
      while (v37 + 1 != v30);
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
    }
    while (v30);
  }

}

+ (id)_characterSetForRanges:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CB3780]);
  if (objc_msgSend(v3, "length"))
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v15 = v3;
    objc_msgSend(v3, "componentsSeparatedByString:", CFSTR(" "));
    obj = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v18;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v18 != v7)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v8), "componentsSeparatedByString:", CFSTR("-"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectAtIndex:", 0);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "integerValue");
          objc_msgSend(v9, "objectAtIndex:", 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "integerValue");

          objc_msgSend(v4, "addCharactersInRange:", v11, v13);
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v6);
    }

    v3 = v15;
  }

  return v4;
}

@end
