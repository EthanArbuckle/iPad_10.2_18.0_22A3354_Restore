@implementation AXCharacterSoundMap

- (AXCharacterSoundMap)init
{
  AXCharacterSoundMap *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *phDictionaries;
  AXCharacterSoundMap *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AXCharacterSoundMap;
  v2 = -[AXCharacterSoundMap init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    phDictionaries = v2->_phDictionaries;
    v2->_phDictionaries = v3;

    v5 = v2;
  }

  return v2;
}

- (id)phonemeStringForCharacter:(id)a3 forLanguage:(id)a4 andVoiceIdentifier:(id)a5
{
  return -[AXCharacterSoundMap _linguisticStringForCharacter:language:linguisticType:andVoiceIdentifier:](self, "_linguisticStringForCharacter:language:linguisticType:andVoiceIdentifier:", a3, a4, 1, a5);
}

- (id)phoneticStringForCharacter:(id)a3 forLanguage:(id)a4 andVoiceIdentifier:(id)a5
{
  return -[AXCharacterSoundMap _linguisticStringForCharacter:language:linguisticType:andVoiceIdentifier:](self, "_linguisticStringForCharacter:language:linguisticType:andVoiceIdentifier:", a3, a4, 0, a5);
}

- (id)_linguisticStringForCharacter:(id)a3 language:(id)a4 linguisticType:(int64_t)a5 andVoiceIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  __CFString *v14;
  id v15;
  __CFString *v16;
  const __CFString *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  __CFString *v34;
  void *v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  id v63;
  void *v64;
  AXCharacterSoundMap *v65;
  void *v66;
  int64_t v67;
  void *v68;
  void *v69;
  void *v70;
  __CFString *v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  AXLanguageConvertToCanonicalForm(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = v11;
  AXLanguageCanonicalFormToGeneralLanguage(v11);
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString isEqualToString:](v14, "isEqualToString:", CFSTR("no")))
  {

    v14 = CFSTR("nb");
  }
  v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v67 = a5;
  if (a5)
  {
    if (a5 != 1)
    {
      v18 = 0;
      v19 = 0;
      v16 = 0;
      goto LABEL_9;
    }
    v16 = CFSTR("AXPhonemes/");
    v17 = CFSTR("%@@phonemes");
  }
  else
  {
    v16 = CFSTR("AXPhonetics/");
    v17 = CFSTR("%@@phonetics");
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v17, v13);
  v18 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v17, v14);
  v19 = objc_claimAutoreleasedReturnValue();
LABEL_9:
  -[NSMutableDictionary objectForKey:](self->_phDictionaries, "objectForKey:", v18);
  v20 = objc_claimAutoreleasedReturnValue();
  v71 = v14;
  v68 = (void *)v18;
  v69 = v13;
  v65 = self;
  v66 = (void *)v19;
  if (v20
    || (-[NSMutableDictionary objectForKey:](self->_phDictionaries, "objectForKey:", v19),
        (v20 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v21 = (void *)v20;
  }
  else
  {
    v38 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v13, "componentsSeparatedByString:", CFSTR("-"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "firstObject");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "componentsSeparatedByString:", CFSTR("-"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "lastObject");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "uppercaseString");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "stringWithFormat:", CFSTR("%@_%@"), v40, v43);
    v44 = objc_claimAutoreleasedReturnValue();

    v45 = (void *)v44;
    v46 = (void *)AXSAccessibilityUtilitiesPath();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.plist"), v45);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingString:](v16, "stringByAppendingString:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "stringByAppendingPathComponent:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithContentsOfFile:", v49);
    v50 = objc_claimAutoreleasedReturnValue();
    if (v50)
    {
      v21 = (void *)v50;
    }
    else
    {
      v64 = v45;
      v51 = (void *)AXSAccessibilityUtilitiesPath();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.plist"), v71);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString stringByAppendingString:](v16, "stringByAppendingString:", v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "stringByAppendingPathComponent:", v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithContentsOfFile:", v54);
      v55 = objc_claimAutoreleasedReturnValue();
      if (!v55)
      {
        -[__CFString uppercaseString](v71, "uppercaseString");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString stringByAppendingFormat:](v71, "stringByAppendingFormat:", CFSTR("_%@"), v56);
        v57 = objc_claimAutoreleasedReturnValue();

        v58 = (void *)AXSAccessibilityUtilitiesPath();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.plist"), v57);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString stringByAppendingString:](v16, "stringByAppendingString:", v59);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "stringByAppendingPathComponent:", v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithContentsOfFile:", v61);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v70 = (void *)v57;
        if (!v21)
          goto LABEL_22;
        goto LABEL_12;
      }
      v21 = (void *)v55;
      v49 = v54;
    }

  }
LABEL_12:
  v62 = v12;
  v63 = v10;
  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  v22 = v21;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v72, v76, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v73;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v73 != v25)
          objc_enumerationMutation(v22);
        v27 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * i);
        objc_msgSend(v22, "objectForKey:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v28, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_ESC_"), CFSTR("\x1B"));
          v29 = objc_claimAutoreleasedReturnValue();

          v28 = (void *)v29;
        }
        objc_msgSend(v15, "setObject:forKey:", v28, v27);

      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v72, v76, 16);
    }
    while (v24);
  }

  v12 = v62;
  v10 = v63;
LABEL_22:
  -[NSMutableDictionary setObject:forKey:](v65->_phDictionaries, "setObject:forKey:", v15, v68);
  objc_msgSend(v10, "lowercaseString");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v67)
  {
    v32 = v31;
    v33 = v69;
    v34 = v71;
    if (!v31)
      goto LABEL_24;
  }
  else
  {
    objc_opt_class();
    v33 = v69;
    v34 = v71;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v32 = v31;
      if (v31)
        goto LABEL_25;
      goto LABEL_24;
    }
    objc_msgSend(v31, "objectForKey:", v12);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v32)
    {
      objc_msgSend(v31, "objectForKey:", CFSTR("default"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v31, "objectForKey:", CFSTR("ipa"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37)
      objc_msgSend(v32, "setIPASpeechPhonemes:", v37);

    if (!v32)
    {
LABEL_24:
      objc_msgSend(v10, "uppercaseString");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKey:", v35);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
LABEL_25:

  return v32;
}

- (NSMutableDictionary)phDictionaries
{
  return self->_phDictionaries;
}

- (void)setPhDictionaries:(id)a3
{
  objc_storeStrong((id *)&self->_phDictionaries, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phDictionaries, 0);
}

@end
