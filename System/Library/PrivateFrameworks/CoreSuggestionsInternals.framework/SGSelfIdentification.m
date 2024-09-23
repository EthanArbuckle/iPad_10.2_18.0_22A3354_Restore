@implementation SGSelfIdentification

+ (id)processConversation:(id)a3 threadLength:(unint64_t)a4 options:(unint64_t)a5
{
  id v9;
  void *v10;
  int v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  _QWORD *v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD *v24;
  void *v25;
  void *v26;
  uint64_t i;
  int v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  NSObject *v48;
  uint64_t *v49;
  _QWORD v50[6];
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  __int128 buf;
  uint64_t (*v58)(uint64_t, uint64_t, void *);
  void *v59;
  id v60;
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (!objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGSelfIdentification.m"), 108, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("conversation.count > 0"));

  }
  objc_msgSend(v9, "lastObject");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0;
  v52 = &v51;
  v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__6328;
  v55 = __Block_byref_object_dispose__6329;
  v56 = 0;
  objc_msgSend(v45, "message");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isSent");

  if (v11)
  {
    sgLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    v44 = v12;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf) = 0;
      _os_log_debug_impl(&dword_1C3607000, v12, OS_LOG_TYPE_DEBUG, "Self-id: Skipping - outgoing message", (uint8_t *)&buf, 2u);
    }
    v13 = 0;
  }
  else
  {
    v14 = MEMORY[0x1E0C809B0];
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __65__SGSelfIdentification_processConversation_threadLength_options___block_invoke;
    v50[3] = &__block_descriptor_48_e67___NSString_36__0_SGMSIPatternType__Q_8__NSString_16__NSString_24B32l;
    v50[4] = a5;
    v50[5] = a4;
    v15 = (void *)MEMORY[0x1C3BD5158](v50);
    objc_msgSend(v45, "text");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    _PASNormalizeUnicodeStringMinimally();
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    sgLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v17;
      _os_log_debug_impl(&dword_1C3607000, v18, OS_LOG_TYPE_DEBUG, "Self-id: looking for pattern match in: \"%@\", (uint8_t *)&buf, 0xCu);
    }

    +[SGDetectedAttributeDissector patterns](SGDetectedAttributeDissector, "patterns");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v14;
    v46[1] = 3221225472;
    v46[2] = __65__SGSelfIdentification_processConversation_threadLength_options___block_invoke_16;
    v46[3] = &unk_1E7DAA010;
    v44 = v15;
    v48 = v44;
    v49 = &v51;
    v47 = v17;
    v19 = v47;
    v20 = v46;
    +[SGDetectedAttributeDissector patterns](SGDetectedAttributeDissector, "patterns");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "regex2ForKey:", CFSTR("MyName/F"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf = v14;
    *((_QWORD *)&buf + 1) = 3221225472;
    v58 = __enumerateMyNameInstances_block_invoke;
    v59 = &unk_1E7DAA0A0;
    v60 = v19;
    v61 = v20;
    v23 = v19;
    v24 = v20;
    objc_msgSend(v22, "enumerateMatchesInString:ngroups:blockWithSubregexp:", v23, 4, &buf);

    v25 = (void *)v52[5];
    if (!v25)
    {
      objc_msgSend(v43, "regex2ForKey:", CFSTR("NameRequest/F"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      for (i = (int)(objc_msgSend(v9, "count") - 2); ; --i)
      {
        v28 = objc_msgSend(v9, "count");
        v29 = v28 <= 3 ? 3 : v28;
        if (i < (v29 - 3))
          break;
        objc_msgSend(v9, "objectAtIndexedSubscript:", i);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "message");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v31, "isSent") & 1) != 0)
        {
          objc_msgSend(v30, "text");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          _PASNormalizeUnicodeString();
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "existsInString:", v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          if (v34)
          {
            objc_msgSend(v34, "hashId");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (*)(NSObject *, _QWORD, void *, id, _QWORD))v44[2].isa)(v44, *MEMORY[0x1E0D19CC0], v35, v23, 0);
            v36 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v36, "length"))
            {
              v37 = objc_opt_new();
              v38 = (void *)v52[5];
              v52[5] = v37;

              objc_msgSend((id)v52[5], "setName:", v36);
              objc_msgSend((id)v52[5], "setContext:", v23);
              v39 = objc_msgSend(v23, "length");
              objc_msgSend((id)v52[5], "setContextRange:", 0, v39);
              objc_msgSend(MEMORY[0x1E0D19820], "extractionInfoWithExtractionType:modelVersion:confidence:", 2, 0, 0);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend((id)v52[5], "setExtractionInfo:", v40);

            }
            break;
          }
        }
        else
        {

        }
      }

      v25 = (void *)v52[5];
    }
    v13 = v25;

  }
  _Block_object_dispose(&v51, 8);

  return v13;
}

+ (id)processConversation:(id)a3 options:(unint64_t)a4
{
  void *v6;
  void *v7;

  sgMap();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "processConversation:threadLength:options:", v6, 0, a4 | 0x100);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

SGTextMessageItem *__52__SGSelfIdentification_processConversation_options___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;
  SGTextMessageItem *v4;
  SGTextMessageItem *v5;
  SGTextMessageItem *v6;
  uint64_t v7;
  SGTextMessageItem *v8;
  SGTextMessage *v9;
  void *v10;
  void *v11;
  void *v12;
  SGTextMessage *v13;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v4 = (SGTextMessageItem *)v2;
  v5 = v4;
  v6 = v4;
  if ((isKindOfClass & 1) != 0)
  {
    v7 = -[SGTextMessageItem hasPrefix:](v4, "hasPrefix:", CFSTR("sent:"));
    v8 = [SGTextMessageItem alloc];
    v9 = [SGTextMessage alloc];
    v15[0] = CFSTR("isSent");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = CFSTR("body");
    v16[0] = v10;
    v11 = v5;
    if ((_DWORD)v7)
    {
      -[SGTextMessageItem substringFromIndex:](v5, "substringFromIndex:", 5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v16[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[SGTextMessage initWithMessageDictionary:](v9, "initWithMessageDictionary:", v12);
    v6 = -[SGTextMessageItem initWithTextMessage:](v8, "initWithTextMessage:", v13);

    if ((_DWORD)v7)
  }

  return v6;
}

id __65__SGSelfIdentification_processConversation_threadLength_options___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, char a5)
{
  __CFString *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  const char *v25;
  void *v26;
  _QWORD *v27;
  const __CFString *v28;
  BOOL v30;
  char v31;
  _QWORD v32[2];
  void (*v33)(_QWORD *, void *, uint64_t, uint64_t);
  void *v34;
  id v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t *v39;
  uint64_t *v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t v66;
  char v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t v71;
  _BYTE buf[24];
  void *v73;
  id v74;
  uint64_t *v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  _PASCollapseWhitespaceAndStrip();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "length"))
  {
    v13 = 0;
    goto LABEL_33;
  }
  v63 = 0;
  v64 = &v63;
  v65 = 0x2020000000;
  v66 = 0;
  v59 = 0;
  v60 = &v59;
  v61 = 0x2020000000;
  v62 = 0;
  v55 = 0;
  v56 = &v55;
  v57 = 0x2020000000;
  v58 = 0;
  v51 = 0;
  v52 = &v51;
  v53 = 0x2020000000;
  v54 = 0;
  v47 = 0;
  v48 = &v47;
  v49 = 0x2020000000;
  v50 = 0;
  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v46 = 0;
  if (SGGuessNamingTradition(v11) != 1)
  {
    v14 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v33 = __65__SGSelfIdentification_processConversation_threadLength_options___block_invoke_2;
    v34 = &unk_1E7DA9FC8;
    v36 = &v51;
    v37 = &v47;
    v38 = &v43;
    v35 = v10;
    v39 = &v59;
    v15 = *(_QWORD *)(a1 + 32);
    v40 = &v55;
    v41 = &v63;
    v42 = v15;
    v16 = v11;
    v17 = v32;
    v68 = 0;
    v69 = &v68;
    v70 = 0x2020000000;
    v71 = 0;
    *(_QWORD *)buf = v14;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __enumerateNameComponents_block_invoke;
    v73 = &unk_1E7DAA078;
    v75 = &v68;
    v18 = v17;
    v74 = v18;
    +[SGTokenizer enumerateTokensInString:block:](SGTokenizer, "enumerateTokensInString:block:", v16, buf);
    if (!v69[3])
    {
      v67 = 0;
      v19 = objc_msgSend(v16, "length");
      ((void (*)(_QWORD *, id, _QWORD, uint64_t, char *))v33)(v18, v16, 0, v19, &v67);
    }

    _Block_object_dispose(&v68, 8);
    v20 = v52[3];
    v21 = v60[3];
    if (v20 != v21)
    {
      if (v56[3] < v21)
      {
        v22 = 0;
        goto LABEL_12;
      }
      if (v44[3])
        goto LABEL_13;
      v30 = v20 == 0;
      v31 = a5 ^ 1;
      if (!v30)
        v31 = 0;
      if ((v31 & 1) != 0 || (*(_QWORD *)(a1 + 32) & 2) == 0)
        goto LABEL_13;
    }
    v22 = objc_msgSend(v16, "length");
LABEL_12:
    v64[3] = v22;
LABEL_13:

    goto LABEL_14;
  }
  if (+[SGNames isSalientNameByChars:](SGNames, "isSalientNameByChars:", v11))
  {
    v12 = objc_msgSend(v11, "length");
    v64[3] = v12;
  }
LABEL_14:
  v23 = v64[3];
  if (!v23)
  {
    sgLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v10;
      _os_log_debug_impl(&dword_1C3607000, v24, OS_LOG_TYPE_DEBUG, "Self-id: Found NO name to extract from candidate \"%@\", buf, 0xCu);
    }
    v13 = 0;
    goto LABEL_22;
  }
  if (v23 == objc_msgSend(v11, "length"))
  {
    v13 = v11;
    sgLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v10;
      v25 = "Self-id: Extracted name \"%@\" from candidate \"%@\";
LABEL_41:
      _os_log_debug_impl(&dword_1C3607000, v24, OS_LOG_TYPE_DEBUG, v25, buf, 0x16u);
    }
  }
  else
  {
    v26 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(v11, "substringWithRange:", 0, v64[3]);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v26);
    sgLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v10;
      v25 = "Self-id: Extracted partial name \"%@\" from candidate \"%@\";
      goto LABEL_41;
    }
  }
LABEL_22:

  if ((*(_BYTE *)(a1 + 33) & 1) == 0)
  {
    if (objc_msgSend(v13, "length"))
    {
      v27 = (_QWORD *)MEMORY[0x1E0D19CA8];
    }
    else if (v48[3])
    {
      v27 = (_QWORD *)MEMORY[0x1E0D19CA0];
    }
    else
    {
      v27 = (_QWORD *)MEMORY[0x1E0D19CB0];
    }
    if (v9)
      v28 = v9;
    else
      v28 = CFSTR("NA");
    objc_msgSend(MEMORY[0x1E0D198D0], "recordSelfIdMatchWithPatternType:patternHash:nameTokenCount:nameClassification:messageIndex:", a2, v28, v60[3], *v27, *(_QWORD *)(a1 + 40));
  }
  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v63, 8);
LABEL_33:

  return v13;
}

void __65__SGSelfIdentification_processConversation_threadLength_options___block_invoke_16(_QWORD *a1, void *a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, _BYTE *a7)
{
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;

  v13 = a1[5];
  v14 = a2;
  objc_msgSend(a5, "hashId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *, id, uint64_t))(v13 + 16))(v13, *MEMORY[0x1E0D19CB8], v15, v14, a6);
  v20 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v20, "length"))
  {
    v16 = objc_opt_new();
    v17 = *(_QWORD *)(a1[6] + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setName:", v20);
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setContext:", a1[4]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setContextRange:", a3, a4);
    objc_msgSend(MEMORY[0x1E0D19820], "extractionInfoWithExtractionType:modelVersion:confidence:", 2, 0, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setExtractionInfo:", v19);

    *a7 = 1;
  }

}

void __65__SGSelfIdentification_processConversation_threadLength_options___block_invoke_2(_QWORD *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  char v8;
  char v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  const __CFCharacterSet *Predefined;
  __CFString *v14;
  void *v15;
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v19;
  int64_t v20;
  int v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  CFIndex v25;
  UniChar v26;
  int IsCharacterMember;
  int64_t v28;
  uint64_t v30;
  uint64_t v31;
  int64_t v32;
  CFIndex v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  UniChar buffer[16];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  CFStringRef theString;
  const UniChar *v45;
  const char *v46;
  uint64_t v47;
  CFIndex v48;
  int64_t v49;
  int64_t v50;
  uint64_t v51;
  CFRange v52;

  v51 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = +[SGNames attributesForNameWord:](SGNames, "attributesForNameWord:", v7);
  v9 = v8;
  if ((v8 & 4) != 0)
  {
    v11 = a1[5];
LABEL_8:
    ++*(_QWORD *)(*(_QWORD *)(v11 + 8) + 24);
    goto LABEL_9;
  }
  if ((v8 & 1) != 0)
  {
    v11 = a1[6];
    goto LABEL_8;
  }
  ++*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
  sgLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v34 = a1[4];
    *(_DWORD *)buffer = 138412546;
    *(_QWORD *)&buffer[2] = v7;
    buffer[6] = 2112;
    *(_QWORD *)&buffer[7] = v34;
    _os_log_debug_impl(&dword_1C3607000, v10, OS_LOG_TYPE_DEBUG, "Self-id: Not-a-known-name \"%@\" word in candidate \"%@\", (uint8_t *)buffer, 0x16u);
  }

LABEL_9:
  ++*(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24);
  v12 = v7;
  Predefined = CFCharacterSetGetPredefined(kCFCharacterSetUppercaseLetter);
  v14 = (__CFString *)v12;
  objc_opt_self();
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
    goto LABEL_43;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  memset(buffer, 0, sizeof(buffer));
  Length = CFStringGetLength(v14);
  theString = v14;
  v47 = 0;
  v48 = Length;
  CharactersPtr = CFStringGetCharactersPtr(v14);
  CStringPtr = 0;
  v45 = CharactersPtr;
  if (!CharactersPtr)
    CStringPtr = CFStringGetCStringPtr(v14, 0x600u);
  v49 = 0;
  v50 = 0;
  v46 = CStringPtr;
  if (Length > 0)
  {
    v35 = v9;
    v36 = a4;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 64;
    do
    {
      if ((unint64_t)v20 >= 4)
        v24 = 4;
      else
        v24 = v20;
      v25 = v48;
      if (v48 <= v20)
      {
        v26 = 0;
      }
      else if (v45)
      {
        v26 = v45[v20 + v47];
      }
      else if (v46)
      {
        v26 = v46[v47 + v20];
      }
      else
      {
        v28 = v49;
        if (v50 <= v20 || v49 > v20)
        {
          v30 = v24 + v19;
          v31 = v23 - v24;
          v32 = v20 - v24;
          v33 = v32 + 64;
          if (v32 + 64 >= v48)
            v33 = v48;
          v49 = v32;
          v50 = v33;
          if (v48 >= v31)
            v25 = v31;
          v52.length = v25 + v30;
          v52.location = v32 + v47;
          CFStringGetCharacters(theString, v52, buffer);
          v28 = v49;
        }
        v26 = buffer[v20 - v28];
      }
      IsCharacterMember = CFCharacterSetIsCharacterMember(Predefined, v26);
      if ((v22 & 1) != 0)
      {
        if (!IsCharacterMember)
          ++v21;
      }
      else if (!IsCharacterMember)
      {
        a4 = v36;
        v9 = v35;
        goto LABEL_43;
      }
      ++v20;
      --v19;
      ++v23;
      v22 = 1;
    }
    while (Length != v20);

    a4 = v36;
    v9 = v35;
    if (v21 >= 1)
      ++*(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 24);
  }
  else
  {
LABEL_43:

  }
  if ((v9 & 4) != 0
    && (a1[11] & 1) != 0
    && *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) == *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24))
  {
    *(_QWORD *)(*(_QWORD *)(a1[10] + 8) + 24) = a3 + a4;
  }

}

@end
