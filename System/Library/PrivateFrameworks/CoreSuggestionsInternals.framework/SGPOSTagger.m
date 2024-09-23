@implementation SGPOSTagger

- (id)tokenizeTextContent:(id)a3 languageHint:(id)a4
{
  return -[SGPOSTagger tokenizeTextContent:languageHint:gazetteer:](self, "tokenizeTextContent:languageHint:gazetteer:", a3, a4, 0);
}

- (id)tokenizeTextContent:(id)a3 languageHint:(id)a4 gazetteer:(id)a5
{
  id v7;
  id v8;
  id v9;
  int v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  double v27;
  NSObject *v28;
  char v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  void *v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  id v44;
  uint64_t *v45;
  _QWORD v46[4];
  id v47;
  uint64_t *v48;
  uint8_t buf[8];
  _QWORD v50[4];
  id v51;
  uint64_t *v52;
  uint64_t *v53;
  uint64_t v54;
  double *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  _QWORD v64[3];
  id v65;
  void *v66;
  _QWORD v67[5];

  v67[3] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v58 = 0;
  v59 = &v58;
  v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__26334;
  v62 = __Block_byref_object_dispose__26335;
  v63 = 0;
  v63 = (id)objc_opt_new();
  if (v7)
  {
    v10 = objc_msgSend(v8, "isEqualToString:", CFSTR("zh-Hans"));
    v12 = *MEMORY[0x1E0CCE0B8];
    v67[0] = *MEMORY[0x1E0CCE0A8];
    v11 = (void *)v67[0];
    v67[1] = v12;
    v38 = v12;
    v40 = *MEMORY[0x1E0CCE0C8];
    v67[2] = *MEMORY[0x1E0CCE0C8];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 3);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v11;
    v37 = v13;
    if (v10)
    {
      v66 = (void *)*MEMORY[0x1E0CCE0C0];
      v14 = v66;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v66, 1);
      v15 = objc_claimAutoreleasedReturnValue();

      v39 = v14;
      v41 = (void *)v15;
    }
    else
    {
      v39 = v13;
    }
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CCE168]), "initWithTagSchemes:", v41);
    v17 = (void *)MEMORY[0x1C3BD4F6C]();
    v18 = objc_alloc(MEMORY[0x1E0C99E60]);
    v19 = (void *)objc_msgSend(v18, "initWithObjects:", *MEMORY[0x1E0CCE080], *MEMORY[0x1E0CCE060], *MEMORY[0x1E0CCE088], 0);
    objc_autoreleasePoolPop(v17);
    if (v9)
    {
      v65 = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v65, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setGazetteers:forTagScheme:", v20, v40);

      objc_msgSend(v9, "labels");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setByAddingObjectsFromArray:", v21);
      v22 = objc_claimAutoreleasedReturnValue();

      v19 = (void *)v22;
    }
    objc_msgSend(v16, "setString:", v7);
    objc_msgSend(v16, "string");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "length");

    if (v8)
      objc_msgSend(v16, "setLanguage:range:", v8, 0, objc_msgSend(v7, "length"));
    v54 = 0;
    v55 = (double *)&v54;
    v56 = 0x2020000000;
    v57 = 0;
    v25 = MEMORY[0x1E0C809B0];
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __58__SGPOSTagger_tokenizeTextContent_languageHint_gazetteer___block_invoke;
    v50[3] = &unk_1E7DB1B10;
    v52 = &v54;
    v53 = &v58;
    v26 = v7;
    v51 = v26;
    objc_msgSend(v16, "enumerateTagsInRange:unit:scheme:options:usingBlock:", 0, v24, 0, v39, 4, v50);
    if ((unint64_t)objc_msgSend((id)v59[5], "count") >= 2)
    {
      v27 = v55[3];
      if (v27 / (double)(unint64_t)objc_msgSend((id)v59[5], "count") > 0.8)
      {
        sgLogHandle();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1C3607000, v28, OS_LOG_TYPE_ERROR, "SGPOSTagger: Most tags are SYM, likely missing LinguisticData", buf, 2u);
        }

      }
    }
    v29 = v10 ^ 1;
    if (!v8)
      v29 = 1;
    if ((v29 & 1) != 0)
    {
      v32 = v16;
    }
    else
    {
      v30 = objc_alloc(MEMORY[0x1E0CCE168]);
      v64[0] = v37;
      v64[1] = v38;
      v64[2] = v40;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 3);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)objc_msgSend(v30, "initWithTagSchemes:", v31);

      objc_msgSend(v32, "setString:", v26);
      objc_msgSend(v32, "setLanguage:range:", v8, 0, objc_msgSend(v26, "length"));
    }
    v46[0] = v25;
    v46[1] = 3221225472;
    v46[2] = __58__SGPOSTagger_tokenizeTextContent_languageHint_gazetteer___block_invoke_10;
    v46[3] = &unk_1E7DB1B38;
    v33 = v26;
    v47 = v33;
    v48 = &v58;
    objc_msgSend(v32, "enumerateTagsInRange:unit:scheme:options:usingBlock:", 0, v24, 0, v38, 4, v46);
    v42[0] = v25;
    v42[1] = 3221225472;
    v42[2] = __58__SGPOSTagger_tokenizeTextContent_languageHint_gazetteer___block_invoke_2;
    v42[3] = &unk_1E7DB1B60;
    v34 = v19;
    v43 = v34;
    v44 = v33;
    v45 = &v58;
    objc_msgSend(v32, "enumerateTagsInRange:unit:scheme:options:usingBlock:", 0, v24, 0, v40, 4, v42);

    _Block_object_dispose(&v54, 8);
  }
  v35 = (id)v59[5];
  _Block_object_dispose(&v58, 8);

  return v35;
}

void __58__SGPOSTagger_tokenizeTextContent_languageHint_gazetteer___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  SGTaggedCharacterRange *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  SGTaggedCharacterRange *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = v7;
  if (v7)
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("SYM")))
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                              + 24)
                                                                  + 1.0;
    v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v10 = [SGTaggedCharacterRange alloc];
    v16[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a3, a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lowercaseString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v12);
    v15 = -[SGTaggedCharacterRange initWithAnnotationType:tags:range:text:](v10, "initWithAnnotationType:tags:range:text:", 2, v11, a3, a4, v14);
    objc_msgSend(v9, "addObject:", v15);

  }
}

void __58__SGPOSTagger_tokenizeTextContent_languageHint_gazetteer___block_invoke_10(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  SGTaggedCharacterRange *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v8);
  if (v7)
  {
    v12[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0C9AA60];
  }
  v11 = -[SGTaggedCharacterRange initWithAnnotationType:tags:range:text:]([SGTaggedCharacterRange alloc], "initWithAnnotationType:tags:range:text:", 3, v10, a3, a4, v9);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v11);

}

void __58__SGPOSTagger_tokenizeTextContent_languageHint_gazetteer___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  SGTaggedCharacterRange *v10;
  void *v11;
  SGTaggedCharacterRange *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  if (v7 && objc_msgSend(*(id *)(a1 + 32), "containsObject:", v7))
  {
    v8 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(*(id *)(a1 + 40), "substringWithRange:", a3, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v8);
    v10 = [SGTaggedCharacterRange alloc];
    v13[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[SGTaggedCharacterRange initWithAnnotationType:tags:range:text:](v10, "initWithAnnotationType:tags:range:text:", 13, v11, a3, a4, v9);

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v12);
  }

}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken3_26349 != -1)
    dispatch_once(&sharedInstance__pasOnceToken3_26349, &__block_literal_global_26350);
  return (id)sharedInstance__pasExprOnceResult_26351;
}

void __29__SGPOSTagger_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_26351;
  sharedInstance__pasExprOnceResult_26351 = v1;

  objc_autoreleasePoolPop(v0);
}

@end
