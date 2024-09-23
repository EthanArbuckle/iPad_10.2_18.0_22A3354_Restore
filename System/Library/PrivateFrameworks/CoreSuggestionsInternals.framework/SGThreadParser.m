@implementation SGThreadParser

+ (id)stripChevrons:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *context;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  context = (void *)MEMORY[0x1C3BD4F6C]();
  patterns();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "regex2ForKey:", CFSTR("NonQuotedLinePart"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v21 = v3;
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("\n"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v12);
        v14 = (void *)MEMORY[0x1C3BD4F6C](v9);
        objc_msgSend(v13, "stringByTrimmingCharactersInSet:", v6, context);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "length"))
        {
          v16 = (void *)MEMORY[0x1C3BD4F6C]();
          v22[0] = MEMORY[0x1E0C809B0];
          v22[1] = 3221225472;
          v22[2] = __32__SGThreadParser_stripChevrons___block_invoke;
          v22[3] = &unk_1E7DAF450;
          v23 = v7;
          v24 = v15;
          objc_msgSend(v5, "enumerateMatchesInString:ngroups:block:", v24, 1, v22);

          objc_autoreleasePoolPop(v16);
        }

        objc_autoreleasePoolPop(v14);
        ++v12;
      }
      while (v10 != v12);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      v10 = v9;
    }
    while (v9);
  }

  objc_msgSend(v7, "_pas_componentsJoinedByString:", CFSTR("\n"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringByTrimmingCharactersInSet:", v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(context);
  return v18;
}

+ (id)emailFrom:(id)a3 entity:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v22;
  unsigned int v23;
  uint64_t v24;
  int v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  unsigned int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v36[6];
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;

  v5 = a3;
  v6 = a4;
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0x7FFFFFFFFFFFFFFFLL;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0x7FFFFFFFFFFFFFFFLL;
  patterns();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "regex2ForKey:", CFSTR("Email"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __35__SGThreadParser_emailFrom_entity___block_invoke;
  v36[3] = &unk_1E7DAA930;
  v36[4] = &v41;
  v36[5] = &v37;
  objc_msgSend(v8, "enumerateMatchesInString:ngroups:block:", v5, 0, v36);

  v9 = v42[3];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL || v38[3] == v9)
  {
    v10 = 0;
  }
  else
  {
    v11 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(v5, "substringWithRange:", v42[3], v38[3] - v42[3]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v11);
    objc_msgSend(v6, "emailToCanonicalEmailCache");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v10 = v14;
    }
    else
    {
      v15 = objc_msgSend(v5, "length") - 1;
      if (v38[3] < v15 && objc_msgSend(v5, "characterAtIndex:") == 62)
        ++v38[3];
      v16 = v42[3];
      if (v16)
      {
        v17 = objc_msgSend(v5, "characterAtIndex:", v16 - 1);
        v18 = v42[3];
        if (v17 == 60)
          v42[3] = --v18;
        if (v18)
        {
          v19 = objc_msgSend(v5, "characterAtIndex:", v18 - 1);
          v20 = MEMORY[0x1E0C80978];
          if (v19 > 0x7F ? __maskrune(v19, 0x4000uLL) : *(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v19 + 60) & 0x4000)
          {
            while (1)
            {
              v22 = v42[3];
              v42[3] = v22 - 1;
              if (v22 == 1)
                break;
              v23 = objc_msgSend(v5, "characterAtIndex:", v22 - 2);
              if (v23 > 0x7F)
              {
                if (!__maskrune(v23, 0x4000uLL))
                {
LABEL_22:
                  v24 = v42[3];
                  if (v24)
                  {
                    v25 = objc_msgSend(v5, "characterAtIndex:", v24 - 1);
                    v26 = v42;
                    v27 = v42[3];
                    if (v25 == 34)
                    {
                      while (1)
                      {
                        v28 = v27 - 1;
                        v26[3] = v28;
                        if (!v28)
                          break;
                        v29 = objc_msgSend(v5, "characterAtIndex:", v28 - 1);
                        v26 = v42;
                        v27 = v42[3];
                        if (v29 == 34)
                        {
                          if (v27 && objc_msgSend(v5, "characterAtIndex:", v27 - 1) == 34)
                            --v42[3];
                          goto LABEL_34;
                        }
                      }
                    }
                    else
                    {
                      for (; v27; v42[3] = v27)
                      {
                        v30 = objc_msgSend(v5, "characterAtIndex:", v27 - 1);
                        if (v30 <= 0x3F && ((1 << v30) & 0x8400100200000000) != 0)
                          break;
                        if (v30 == 65306)
                          break;
                        v27 = v42[3] - 1;
                      }
                    }
                  }
                  break;
                }
              }
              else if ((*(_DWORD *)(v20 + 4 * v23 + 60) & 0x4000) == 0)
              {
                goto LABEL_22;
              }
            }
          }
        }
      }
LABEL_34:
      v31 = (void *)MEMORY[0x1C3BD4F6C]();
      objc_msgSend(v5, "substringWithRange:", v42[3], v38[3] - v42[3]);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "stringByTrimmingCharactersInSet:", v33);
      v10 = (id)objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(v31);
      objc_msgSend(v6, "emailToCanonicalEmailCache");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setObject:forKeyedSubscript:", v10, v12);

    }
  }
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);

  return v10;
}

+ (id)emailFrom:(id)a3
{
  return (id)objc_msgSend(a1, "emailFrom:entity:", a3, 0);
}

+ (id)nextMessage:(id)a3 entity:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  void *v17;
  unint64_t v18;
  void *v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  __CFString *v26;
  void *v27;
  _QWORD *v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD v50[5];
  _QWORD v51[5];
  _QWORD v52[5];
  _QWORD v53[5];
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  uint64_t v60;
  _QWORD v61[4];
  id v62;
  uint64_t v63;
  _QWORD v64[4];
  id v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;
  _QWORD v72[4];

  v72[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v66 = 0;
  v67 = &v66;
  v68 = 0x3032000000;
  v69 = __Block_byref_object_copy__7849;
  v70 = __Block_byref_object_dispose__7850;
  v7 = v5;
  v71 = v7;
  v63 = 0;
  v64[0] = &v63;
  v64[1] = 0x3032000000;
  v64[2] = __Block_byref_object_copy__7849;
  v64[3] = __Block_byref_object_dispose__7850;
  v65 = 0;
  v60 = 0;
  v61[0] = &v60;
  v61[1] = 0x3032000000;
  v61[2] = __Block_byref_object_copy__7849;
  v61[3] = __Block_byref_object_dispose__7850;
  v62 = 0;
  v54 = 0;
  v55 = &v54;
  v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__7849;
  v58 = __Block_byref_object_dispose__7850;
  v59 = 0;
  +[SGMailPatterns replyAttributionPattern](SGMailPatterns, "replyAttributionPattern");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v10 = v67[5];
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __37__SGThreadParser_nextMessage_entity___block_invoke;
  v53[3] = &unk_1E7DAF888;
  v53[4] = &v63;
  objc_msgSend(v8, "enumerateMatchesInString:ngroups:block:", v10, 0, v53);

  +[SGMailPatterns headerPattern:](SGMailPatterns, "headerPattern:", CFSTR("From"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v67[5];
  v52[0] = v9;
  v52[1] = 3221225472;
  v52[2] = __37__SGThreadParser_nextMessage_entity___block_invoke_2;
  v52[3] = &unk_1E7DAF888;
  v52[4] = &v60;
  objc_msgSend(v11, "enumerateMatchesInString:ngroups:block:", v12, 0, v52);

  +[SGMailPatterns quotedRegionStartPattern](SGMailPatterns, "quotedRegionStartPattern");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v67[5];
  v51[0] = v9;
  v51[1] = 3221225472;
  v51[2] = __37__SGThreadParser_nextMessage_entity___block_invoke_3;
  v51[3] = &unk_1E7DAF888;
  v51[4] = &v54;
  objc_msgSend(v13, "enumerateMatchesInString:ngroups:block:", v14, 0, v51);

  v15 = *(void **)(v64[0] + 40);
  if (!v15)
  {
    v17 = *(void **)(v61[0] + 40);
    if (!v17)
    {
      if (!v55[5])
      {
        v48 = 0;
        goto LABEL_28;
      }
      v16 = -1;
      goto LABEL_9;
    }
    v16 = -1;
LABEL_6:
    v18 = objc_msgSend(v17, "rangeValue");
    goto LABEL_10;
  }
  v16 = objc_msgSend(v15, "rangeValue");
  v17 = *(void **)(v61[0] + 40);
  if (v17)
    goto LABEL_6;
LABEL_9:
  v18 = -1;
LABEL_10:
  v19 = (void *)v55[5];
  if (v19 && (v20 = objc_msgSend(v19, "rangeValue"), v20 < v16) && v20 < v18)
  {
    v21 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend((id)v67[5], "substringFromIndex:", objc_msgSend((id)v55[5], "rangeValue"));
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v67[5];
    v67[5] = v22;

    +[SGThreadParser stripChevrons:](SGThreadParser, "stripChevrons:", v67[5]);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)v67[5];
    v67[5] = v24;

    objc_autoreleasePoolPop(v21);
    v26 = &stru_1E7DB83A8;
  }
  else
  {
    v27 = (void *)MEMORY[0x1C3BD4F6C]();
    v28 = v64;
    if (v16 >= v18)
      v28 = v61;
    v29 = *(id *)(*v28 + 40);
    v30 = (void *)v67[5];
    v31 = objc_msgSend(v29, "rangeValue");
    objc_msgSend(v30, "substringWithRange:", v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)v67[5];
    v35 = objc_msgSend(v29, "rangeValue");
    objc_msgSend(v29, "rangeValue");
    objc_msgSend(v34, "substringFromIndex:", v36 + v35);
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = (void *)v67[5];
    v67[5] = v37;

    if (v29 == *(id *)(v61[0] + 40))
    {
      +[SGMailPatterns headersPattern](SGMailPatterns, "headersPattern");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v67[5];
      v50[0] = v9;
      v50[1] = 3221225472;
      v50[2] = __37__SGThreadParser_nextMessage_entity___block_invoke_4;
      v50[3] = &unk_1E7DAF888;
      v50[4] = &v66;
      objc_msgSend(v39, "enumerateMatchesInString:ngroups:block:", v40, 0, v50);

    }
    patterns();
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "regex2ForKey:", CFSTR("NextLineQuoted"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "existsInString:", v67[5]);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (v43)
    {
      +[SGThreadParser stripChevrons:](SGThreadParser, "stripChevrons:", v67[5]);
      v44 = objc_claimAutoreleasedReturnValue();
      v45 = (void *)v67[5];
      v67[5] = v44;

    }
    +[SGThreadParser emailFrom:entity:](SGThreadParser, "emailFrom:entity:", v33, v6);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v46;
    if (v46)
      v26 = v46;
    else
      v26 = &stru_1E7DB83A8;

    objc_autoreleasePoolPop(v27);
  }
  if (objc_msgSend((id)v67[5], "length"))
  {
    v72[0] = v67[5];
    v72[1] = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 2);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v48 = 0;
  }

LABEL_28:
  _Block_object_dispose(&v54, 8);

  _Block_object_dispose(&v60, 8);
  _Block_object_dispose(&v63, 8);

  _Block_object_dispose(&v66, 8);
  return v48;
}

+ (id)nextMessage:(id)a3
{
  return (id)objc_msgSend(a1, "nextMessage:entity:", a3, 0);
}

+ (void)enumeratePreviousMessages:(id)a3 inEntity:(id)a4 usingBlock:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, void *, void *);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, void *, void *))a5;
  v10 = (void *)MEMORY[0x1C3BD4F6C]();
  +[SGThreadParser nextMessage:entity:](SGThreadParser, "nextMessage:entity:", v7, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v10);
  if (v11)
  {
    do
    {
      v12 = (void *)MEMORY[0x1E0D19938];
      objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "namedEmailAddressWithFieldValue:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "emailAddress");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      SGNormalizeEmailAddress();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, v15, v17);

      objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
      v19 = (id)objc_claimAutoreleasedReturnValue();

      v18 = (void *)MEMORY[0x1C3BD4F6C]();
      +[SGThreadParser nextMessage:entity:](SGThreadParser, "nextMessage:entity:", v19, v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_autoreleasePoolPop(v18);
      v7 = v19;
    }
    while (v11);
  }
  else
  {
    v19 = v7;
  }

}

+ (void)enumeratePreviousMessages:(id)a3 usingBlock:(id)a4
{
  objc_msgSend(a1, "enumeratePreviousMessages:inEntity:usingBlock:", a3, 0, a4);
}

+ (id)ipsosMessageWithSearchableItem:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  +[SGMessage messageWithSearchableItem:](SGSimpleMailMessage, "messageWithSearchableItem:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textContent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    +[SGNaturalLanguageDissector ipsosMessageWithMailMessage:store:](SGNaturalLanguageDissector, "ipsosMessageWithMailMessage:store:", v3, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __37__SGThreadParser_nextMessage_entity___block_invoke(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", *a2, a2[1]);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return 0;
}

uint64_t __37__SGThreadParser_nextMessage_entity___block_invoke_2(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", *a2, a2[1]);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return 0;
}

uint64_t __37__SGThreadParser_nextMessage_entity___block_invoke_3(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", *a2, a2[1]);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return 0;
}

uint64_t __37__SGThreadParser_nextMessage_entity___block_invoke_4(uint64_t a1, _QWORD *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  if (!*a2)
  {
    v4 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "substringFromIndex:", a2[1]);
    v5 = objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v4);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
  return 0;
}

uint64_t __35__SGThreadParser_emailFrom_entity___block_invoke(uint64_t a1, _QWORD *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2[1]
                                                              + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 24);
  return 0;
}

uint64_t __32__SGThreadParser_stripChevrons___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  void *v6;

  if (a2[1])
  {
    v4 = (void *)MEMORY[0x1C3BD4F6C]();
    if (a2[4])
    {
      v5 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "substringWithRange:", a2[3]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v6);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", &stru_1E7DB83A8);
    }
    objc_autoreleasePoolPop(v4);
  }
  return 0;
}

@end
