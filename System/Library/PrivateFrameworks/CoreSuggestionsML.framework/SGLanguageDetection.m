@implementation SGLanguageDetection

+ (id)languageForLocaleIdentifier:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  __CFString *v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  void *v19;
  int v20;
  void *v21;
  char v22;
  void *v23;
  char v24;
  void *v25;
  char v26;
  void *v27;
  char v28;
  void *v30;

  v5 = a3;
  v6 = (void *)MEMORY[0x220753E80]();
  if ((unint64_t)objc_msgSend(v5, "length") <= 1)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGLanguageDetection.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("localeIdentifier.length >= 2"));

  }
  objc_msgSend(MEMORY[0x24BDD14A8], "letterCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGStringSplitter splitString:withCharacterSet:](SGStringSplitter, "splitString:withCharacterSet:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lowercaseString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "lastObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "count");
  v13 = objc_msgSend(v10, "isEqualToString:", CFSTR("zh"));
  if (v12 == 1)
  {
    if ((v13 & 1) != 0)
    {
      v14 = CFSTR("zh-Hans");
      goto LABEL_33;
    }
LABEL_32:
    v14 = v10;
    goto LABEL_33;
  }
  if (v13)
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("Hans"));

    v14 = CFSTR("zh-Hans");
    if ((v16 & 1) == 0)
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("Hant"));

      if ((v18 & 1) != 0 || (objc_msgSend(v11, "isEqualToString:", CFSTR("HK")) & 1) != 0)
      {
        v14 = CFSTR("zh-Hant");
      }
      else
      {
        v14 = CFSTR("zh-Hant");
        if ((objc_msgSend(v11, "isEqualToString:", CFSTR("MO")) & 1) == 0
          && !objc_msgSend(v11, "isEqualToString:", CFSTR("TW")))
        {
          v14 = CFSTR("zh-Hans");
        }
      }
    }
  }
  else
  {
    v14 = CFSTR("hi");
    if (!objc_msgSend(v10, "isEqualToString:", CFSTR("hi")))
    {
      if (objc_msgSend(v10, "isEqualToString:", CFSTR("uz")))
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("Cyrl"));

        if ((v22 & 1) != 0)
        {
          v14 = CFSTR("uz");
          goto LABEL_33;
        }
        objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("Arab"));

        if ((v24 & 1) != 0)
          goto LABEL_23;
        objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("Latn"));

        if ((v26 & 1) != 0
          || (objc_msgSend(v11, "isEqualToString:", CFSTR("UZ")) & 1) != 0
          || (objc_msgSend(v11, "isEqualToString:", CFSTR("AZ")) & 1) != 0)
        {
          v14 = CFSTR("uz-Latn");
          goto LABEL_33;
        }
        if ((objc_msgSend(v11, "isEqualToString:", CFSTR("AF")) & 1) != 0)
        {
LABEL_23:
          v14 = CFSTR("uz-Arab");
          goto LABEL_33;
        }
      }
      if (objc_msgSend(v10, "isEqualToString:", CFSTR("sr")))
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("Latn"));

        if ((v28 & 1) != 0)
        {
          v14 = CFSTR("sr-Latn");
          goto LABEL_33;
        }
      }
      goto LABEL_32;
    }
    objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("Latn"));

    if (v20)
      v14 = CFSTR("hi-Latn");
  }
LABEL_33:

  objc_autoreleasePoolPop(v6);
  return v14;
}

+ (id)defaultLanguage
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BDBCB18]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && (unint64_t)objc_msgSend(v3, "length") >= 2)
  {
    +[SGLanguageDetection languageForLocaleIdentifier:](SGLanguageDetection, "languageForLocaleIdentifier:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)detectLanguageFromText:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(a1, "dominantLanguageTagFromText:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "defaultLanguage");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

+ (id)detectLanguageFromText:(id)a3 withMaxLength:(unint64_t)a4 withMaxTags:(unint64_t)a5 withMinimumCount:(unint64_t)a6 withMinimumAgreement:(double)a7
{
  id v11;
  void *v12;
  id v13;
  void *v14;

  v11 = a3;
  objc_msgSend((id)objc_opt_class(), "dominantLanguageTagFromText:withMaxLength:withMaxTags:withMinimumCount:withMinimumAgreement:", v11, a4, a5, a6, a7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = v12;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "defaultLanguage");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;

  return v14;
}

+ (id)detectLanguageFromLanguageTags:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(a1, "dominantLanguageTagFromLanguageTags:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "defaultLanguage");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

+ (id)detectLanguageFromLanguageTags:(id)a3 withMinimumCount:(unint64_t)a4 withMinimumAgreement:(double)a5
{
  id v8;
  void *v9;

  v8 = a3;
  if (objc_msgSend(v8, "count"))
    objc_msgSend(a1, "dominantLanguageTagFromLanguageTags:withMinimumCount:withMinimumAgreement:", v8, a4, a5);
  else
    objc_msgSend((id)objc_opt_class(), "defaultLanguage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)dominantLanguageTagFromText:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "dominantLanguageTagFromText:withMaxLength:withMaxTags:withMinimumCount:withMinimumAgreement:", v3, 30, 8, 0, 0.6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)dominantLanguageTagFromText:(id)a3 withMaxLength:(unint64_t)a4 withMaxTags:(unint64_t)a5 withMinimumCount:(unint64_t)a6 withMinimumAgreement:(double)a7
{
  id v11;
  void *v12;
  void *v13;

  v11 = a3;
  objc_msgSend((id)objc_opt_class(), "languageTagsFromText:withMaxLength:withMaxTags:", v11, a4, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "dominantLanguageTagFromLanguageTags:withMinimumCount:withMinimumAgreement:", v12, a6, a7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)dominantLanguageTagFromLanguageTags:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "dominantLanguageTagFromLanguageTags:withMinimumCount:withMinimumAgreement:", v3, 0, 0.6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)dominantLanguageTagFromLanguageTags:(id)a3 withMinimumCount:(unint64_t)a4 withMinimumAgreement:(double)a5
{
  id v7;
  id v8;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  id v21;
  unint64_t v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if (objc_msgSend(v7, "count") >= a4 && objc_msgSend(v7, "count"))
  {
    if (objc_msgSend(v7, "count") == 1)
    {
      objc_msgSend(v7, "firstObject");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD14E0]), "initWithArray:", v7);
      if (objc_msgSend(v10, "count") == 1)
      {
        objc_msgSend(v7, "firstObject");
        v8 = (id)objc_claimAutoreleasedReturnValue();
      }
      else if ((unint64_t)objc_msgSend(v10, "count") <= 2)
      {
        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        v23 = v10;
        v11 = v10;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v12)
        {
          v13 = v12;
          v14 = 0;
          v15 = 0;
          v16 = *(_QWORD *)v25;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v25 != v16)
                objc_enumerationMutation(v11);
              v18 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
              v19 = objc_msgSend(v11, "countForObject:", v18);
              if (v19 >= v15)
              {
                v20 = v19;
                v21 = v18;

                v14 = v21;
                v15 = v20;
              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
          }
          while (v13);
        }
        else
        {
          v14 = 0;
          v15 = 0;
        }

        v22 = objc_msgSend(v7, "count");
        if (v15 >= a4 && (double)v15 / (double)v22 >= a5)
          v8 = v14;
        else
          v8 = 0;
        v10 = v23;

      }
      else
      {
        v8 = 0;
      }

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)languageTagsFromText:(id)a3 withMaxLength:(unint64_t)a4 withMaxTags:(unint64_t)a5
{
  id v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  BOOL v28;
  void *v29;
  void *v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  void *v40;
  SEL v41;
  unint64_t v42;
  uint64_t v43;
  void *v44;
  _QWORD v45[4];
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  uint64_t *v51;
  _QWORD *v52;
  _QWORD *v53;
  _QWORD *v54;
  SEL v55;
  id v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t v59;
  unint64_t v60;
  BOOL v61;
  _QWORD v62[4];
  _QWORD v63[4];
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;
  _QWORD v70[5];
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _QWORD v76[3];
  uint64_t v77;
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = objc_msgSend(v9, "length");
  if (v10)
  {
    v41 = a2;
    v42 = a5;
    if (v10 > 2 * a4)
    {
      v11 = (void *)MEMORY[0x220753E80]();
      objc_msgSend(v9, "substringToIndex:", 2 * a4);
      v12 = objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(v11);
      v9 = (id)v12;
    }
    v13 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", *MEMORY[0x24BDBCB20]);
    v15 = objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(a1, "languageForLocaleIdentifier:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v16);

    }
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v72, v78, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v73;
LABEL_8:
      v20 = 0;
      while (1)
      {
        if (*(_QWORD *)v73 != v19)
          objc_enumerationMutation(v17);
        objc_msgSend(a1, "languageForLocaleIdentifier:", *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * v20));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v21);

        if ((unint64_t)objc_msgSend(v13, "count") > 2)
          break;
        if (v18 == ++v20)
        {
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v72, v78, 16);
          if (v18)
            goto LABEL_8;
          break;
        }
      }
    }

    v22 = objc_alloc(MEMORY[0x24BDD1638]);
    v77 = *MEMORY[0x24BDD0F58];
    v43 = v77;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v77, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (void *)objc_msgSend(v22, "initWithTagSchemes:options:", v23, 0);

    v24 = objc_alloc(MEMORY[0x24BDD1638]);
    v76[0] = *MEMORY[0x24BDD0F88];
    v76[1] = v43;
    v76[2] = *MEMORY[0x24BDD0F70];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v76, 3);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)objc_msgSend(v24, "initWithTagSchemes:options:", v25, 0);

    objc_msgSend(v9, "localizedLowercaseString");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setString:", v26);
    v70[0] = 0;
    v70[1] = v70;
    v70[2] = 0x3032000000;
    v70[3] = __Block_byref_object_copy__1349;
    v70[4] = __Block_byref_object_dispose__1350;
    v71 = 0;
    v71 = (id)objc_opt_new();
    v64 = 0;
    v65 = &v64;
    v66 = 0x3032000000;
    v67 = __Block_byref_object_copy__1349;
    v68 = __Block_byref_object_dispose__1350;
    v69 = 0;
    v69 = (id)objc_opt_new();
    v63[0] = 0;
    v63[1] = v63;
    v63[2] = 0x2020000000;
    v63[3] = 0;
    v62[0] = 0;
    v62[1] = v62;
    v62[2] = 0x2020000000;
    v62[3] = 0;
    v27 = objc_msgSend(v26, "length");
    v28 = v27 == objc_msgSend(v9, "length");
    objc_msgSend(MEMORY[0x24BDD14A8], "uppercaseLetterCharacterSet");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)v15;
    v31 = objc_msgSend(v26, "length");
    v32 = a4 + 20;
    if (a4 + 20 >= v31)
      v33 = v31;
    else
      v33 = a4 + 20;
    v45[0] = MEMORY[0x24BDAC760];
    v45[1] = 3221225472;
    v45[2] = __70__SGLanguageDetection_languageTagsFromText_withMaxLength_withMaxTags___block_invoke;
    v45[3] = &unk_24DDC51F0;
    v34 = v26;
    v46 = v34;
    v55 = v41;
    v56 = a1;
    v57 = a4;
    v35 = v13;
    v47 = v35;
    v51 = &v64;
    v52 = v70;
    v61 = v28;
    v9 = v9;
    v48 = v9;
    v58 = v32;
    v36 = v40;
    v49 = v36;
    v53 = v63;
    v59 = 536870926;
    v54 = v62;
    v37 = v29;
    v50 = v37;
    v60 = v42;
    objc_msgSend(v44, "enumerateTagsInRange:unit:scheme:options:usingBlock:", 0, v33, 0, v43, 536870926, v45);
    v38 = (id)v65[5];

    _Block_object_dispose(v62, 8);
    _Block_object_dispose(v63, 8);
    _Block_object_dispose(&v64, 8);

    _Block_object_dispose(v70, 8);
  }
  else
  {
    v38 = (id)MEMORY[0x24BDBD1A8];
  }

  return v38;
}

+ (_NSRange)tokenRangeForText:(id)a3 maxTruncatedLength:(unint64_t)a4 tagger:(id)a5 taggerOptions:(unint64_t)a6 prevTextTokenMaxRange:(unint64_t)a7 originalLengthShortfall:(unint64_t)a8 lowercaseText:(id)a9 lowercaseRange:(_NSRange)a10
{
  id v14;
  id v15;
  id v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t *v23;
  NSUInteger v24;
  NSObject *v25;
  id v26;
  NSUInteger v27;
  NSUInteger v28;
  NSUInteger v29;
  int v30;
  int v31;
  _QWORD v35[4];
  id v36;
  id v37;
  uint64_t *v38;
  SEL v39;
  id v40;
  unint64_t v41;
  _NSRange v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  void *v46;
  __int128 v47;
  uint8_t buf[4];
  int v49;
  __int16 v50;
  int location;
  __int16 v52;
  int length;
  __int16 v54;
  int v55;
  uint64_t v56;
  _NSRange result;

  v56 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a5;
  v16 = a9;
  objc_msgSend(v15, "setString:", v14);
  v43 = 0;
  v44 = &v43;
  v45 = 0x3010000000;
  v46 = &unk_21AC30DF2;
  v47 = xmmword_21AC26FC0;
  v17 = objc_msgSend(v14, "length");
  if (v17 >= a4)
    v18 = a4;
  else
    v18 = v17;
  v19 = v18 - a7;
  v20 = *MEMORY[0x24BDD0F88];
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __156__SGLanguageDetection_tokenRangeForText_maxTruncatedLength_tagger_taggerOptions_prevTextTokenMaxRange_originalLengthShortfall_lowercaseText_lowercaseRange___block_invoke;
  v35[3] = &unk_24DDC5218;
  v21 = v14;
  v36 = v21;
  v39 = a2;
  v40 = a1;
  v41 = a8;
  v42 = a10;
  v22 = v16;
  v37 = v22;
  v38 = &v43;
  objc_msgSend(v15, "enumerateTagsInRange:unit:scheme:options:usingBlock:", a7, v19, 0, v20, a6, v35);
  v23 = v44;
  v24 = v44[4];
  if (v24 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v25 = MEMORY[0x24BDACB70];
    v26 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      v30 = objc_msgSend(v22, "length");
      v31 = objc_msgSend(v21, "length");
      *(_DWORD *)buf = 67109888;
      v49 = v30;
      v50 = 1024;
      location = a10.location;
      v52 = 1024;
      length = a10.length;
      v54 = 1024;
      v55 = v31;
      _os_log_debug_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "SGLanguageDetection: lowercase len %d, range loc %d / len %d found no range in original len %d", buf, 0x1Au);
    }

    v23 = v44;
    v24 = v44[4];
  }
  v27 = v23[5];

  _Block_object_dispose(&v43, 8);
  v28 = v24;
  v29 = v27;
  result.length = v29;
  result.location = v28;
  return result;
}

+ (void)logMatchingForRange:(_NSRange)a3 lowercaseRange:(_NSRange)a4 text:(id)a5 lowercaseText:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v9;
  NSUInteger v10;
  id v12;
  id v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  unsigned int v17;
  unint64_t v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  int v23;
  int v24;
  void *v25;
  void *v26;
  uint8_t buf[4];
  _BYTE v28[10];
  _BYTE v29[20];
  uint64_t v30;

  length = a4.length;
  location = a4.location;
  v9 = a3.length;
  v10 = a3.location;
  v30 = *MEMORY[0x24BDAC8D0];
  v12 = a5;
  v13 = a6;
  v14 = location + length != objc_msgSend(v13, "length");
  if (((v14 ^ (v10 + v9 == objc_msgSend(v12, "length"))) & 1) == 0)
  {
    v15 = (void *)MEMORY[0x220753E80]();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)v28 = location + length;
      *(_WORD *)&v28[4] = 1024;
      *(_DWORD *)&v28[6] = objc_msgSend(v13, "length");
      *(_WORD *)v29 = 1024;
      *(_DWORD *)&v29[2] = v10 + v9;
      *(_WORD *)&v29[6] = 1024;
      *(_DWORD *)&v29[8] = objc_msgSend(v12, "length");
      _os_log_debug_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "SGLanguageDetection: mismatched lowercase rangeEnd %d, stringEnd %d / original rangeEnd %d, stringEnd %d", buf, 0x1Au);
    }
    objc_autoreleasePoolPop(v15);
  }
  if (location == v10 && length != v9)
  {
    v16 = (void *)MEMORY[0x220753E80]();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)v28 = v10;
      *(_WORD *)&v28[4] = 1024;
      *(_DWORD *)&v28[6] = length;
      *(_WORD *)v29 = 1024;
      *(_DWORD *)&v29[2] = v10;
      *(_WORD *)&v29[6] = 1024;
      *(_DWORD *)&v29[8] = v9;
      _os_log_debug_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "SGLanguageDetection: lowercase tokenRange is loc %d, len %d but original range is loc %d, len %d", buf, 0x1Au);
    }
    v17 = length - v9;
    if ((int)length - (int)v9 < 0)
      v17 = v9 - length;
    if (v17 >= 3)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109888;
        *(_DWORD *)v28 = v10;
        *(_WORD *)&v28[4] = 1024;
        *(_DWORD *)&v28[6] = length;
        *(_WORD *)v29 = 1024;
        *(_DWORD *)&v29[2] = v10;
        *(_WORD *)&v29[6] = 1024;
        *(_DWORD *)&v29[8] = v9;
        _os_log_error_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "SGLanguageDetection: strange! lowercase is loc %d, len %d but original is loc %d, len %d", buf, 0x1Au);
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v13, "substringWithRange:", location, length);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v13, "length");
        objc_msgSend(v12, "substringWithRange:", v10, v9);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v12, "length");
        *(_DWORD *)buf = 138413058;
        *(_QWORD *)v28 = v19;
        *(_WORD *)&v28[8] = 1024;
        *(_DWORD *)v29 = v20;
        *(_WORD *)&v29[4] = 2112;
        *(_QWORD *)&v29[6] = v21;
        *(_WORD *)&v29[14] = 1024;
        *(_DWORD *)&v29[16] = v22;
        _os_log_error_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "SGLanguageDetection: possible problem! lowercase '%@' strlen %d and original '%@' strlen %d", buf, 0x22u);

      }
    }
    v18 = objc_msgSend(v12, "length");
    if (v18 > objc_msgSend(v13, "length") && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    {
      v23 = objc_msgSend(v12, "length");
      v24 = objc_msgSend(v13, "length");
      objc_msgSend(a1, "defaultLanguage");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1638], "dominantLanguageForString:", v12);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v28 = v23;
      *(_WORD *)&v28[4] = 1024;
      *(_DWORD *)&v28[6] = v24;
      *(_WORD *)v29 = 2112;
      *(_QWORD *)&v29[2] = v25;
      *(_WORD *)&v29[10] = 2112;
      *(_QWORD *)&v29[12] = v26;
      _os_log_fault_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "SGLanguageDetection: original len %d is longer than the lowercased len %d in locale %@, detected %@", buf, 0x22u);

    }
    objc_autoreleasePoolPop(v16);
  }

}

void __156__SGLanguageDetection_tokenRangeForText_maxTruncatedLength_tagger_taggerOptions_prevTextTokenMaxRange_originalLengthShortfall_lowercaseText_lowercaseRange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v9 = a3 + a4;
  if (a3 + a4 > (unint64_t)objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), CFSTR("SGLanguageDetection.m"), 304, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("NSMaxRange(textTagRange) <= text.length"));

  }
  if ((unint64_t)(*(_QWORD *)(a1 + 72) + v9) > *(_QWORD *)(a1 + 80))
  {
    objc_msgSend(*(id *)(a1 + 64), "logMatchingForRange:lowercaseRange:text:lowercaseText:", a3, a4);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    *(_QWORD *)(v10 + 32) = a3;
    *(_QWORD *)(v10 + 40) = a4;
    *a5 = 1;
  }
}

void __70__SGLanguageDetection_languageTagsFromText_withMaxLength_withMaxTags___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[2];

  v9 = a2;
  if (a3 + a4 > (unint64_t)objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), CFSTR("SGLanguageDetection.m"), 217, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("NSMaxRange(lowercaseRange) <= lowercaseText.length"));

  }
  if ((unint64_t)(a3 + a4) >= *(_QWORD *)(a1 + 120))
    *a5 = 1;
  if (!v9)
  {
    v10 = 0;
    goto LABEL_37;
  }
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("und")) & 1) != 0)
  {
    v10 = v9;
    goto LABEL_37;
  }
  objc_msgSend(*(id *)(a1 + 112), "languageForLocaleIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v11 = (void *)MEMORY[0x220753E80]();
    goto LABEL_14;
  }
  if (!objc_msgSend(*(id *)(a1 + 40), "containsObject:", v10))
  {
    v11 = (void *)MEMORY[0x220753E80]();
    if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "containsObject:", v10) & 1) == 0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "addObject:", v10);
LABEL_24:
      objc_autoreleasePoolPop(v11);
      goto LABEL_37;
    }
LABEL_14:
    v12 = *(unsigned __int8 *)(a1 + 152);
    v13 = (void *)MEMORY[0x220753E80]();
    if (!v12)
    {
      v14 = objc_msgSend(*(id *)(a1 + 112), "tokenRangeForText:maxTruncatedLength:tagger:taggerOptions:prevTextTokenMaxRange:originalLengthShortfall:lowercaseText:lowercaseRange:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 136), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24), *(_QWORD *)(a1 + 32), a3, a4);
      if (v14 == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_autoreleasePoolPop(v13);
        v16 = 0;
LABEL_23:

        goto LABEL_24;
      }
      a4 = v15;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = v14 + v15;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = (a3 - v14) & ~((a3 - v14) >> 63);
      a3 = v14;
    }
    objc_msgSend(*(id *)(a1 + 48), "substringWithRange:", a3, a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v13);
    if (objc_msgSend(v16, "rangeOfCharacterFromSet:", *(_QWORD *)(a1 + 64)) == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(*(id *)(a1 + 56), "setString:", v16);
      objc_msgSend(*(id *)(a1 + 56), "string");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = 0;
      v24[1] = objc_msgSend(v17, "length");

      objc_msgSend(*(id *)(a1 + 56), "tagAtIndex:unit:scheme:tokenRange:", 0, 0, *MEMORY[0x24BDD0F58], v24);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v19 = v18;
        if ((objc_msgSend(v18, "isEqualToString:", CFSTR("und")) & 1) != 0)
        {
          v20 = v19;
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 112), "languageForLocaleIdentifier:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(*(id *)(a1 + 40), "containsObject:", v20))
          {
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "addObject:", v20);
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 56), "tagAtIndex:unit:scheme:tokenRange:", 0, 0, *MEMORY[0x24BDD0F70], v24);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = v21;
            if (v10
              && (!v21
               || (objc_msgSend(v21, "isEqualToString:", *MEMORY[0x24BDD0F10]) & 1) != 0
               || objc_msgSend(v22, "isEqualToString:", *MEMORY[0x24BDD0F20])))
            {
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "addObject:", v10);
            }

          }
        }
      }
      else
      {
        v20 = 0;
      }

      objc_autoreleasePoolPop(v11);
      goto LABEL_35;
    }
    goto LABEL_23;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "addObject:", v10);
LABEL_35:
  if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "count") >= *(_QWORD *)(a1 + 144))
    *a5 = 1;
LABEL_37:

}

@end
