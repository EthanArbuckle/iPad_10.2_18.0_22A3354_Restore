@implementation IMReplySuggestionGenerator

+ (void)repliesForMessages:(id)a3 senderMessages:(id)a4 recipientHandles:(id)a5 languageCode:(id)a6 languageCodeChangeDate:(id)a7 completion:(id)a8
{
  uint64_t v8;

  LOBYTE(v8) = 1;
  objc_msgSend(a1, "_repliesForMessages:senderMessages:recipientHandles:languageCode:languageCodeChangeDate:loadAsync:fetchUsingContactsFramework:completion:", a3, a4, a5, a6, a7, 1, v8, a8);
}

+ (void)repliesForMessages:(id)a3 senderMessages:(id)a4 recipientHandles:(id)a5 languageCode:(id)a6 languageCodeChangeDate:(id)a7 fetchUsingContactsFramework:(BOOL)a8 completion:(id)a9
{
  uint64_t v9;

  LOBYTE(v9) = a8;
  objc_msgSend(a1, "_repliesForMessages:senderMessages:recipientHandles:languageCode:languageCodeChangeDate:loadAsync:fetchUsingContactsFramework:completion:", a3, a4, a5, a6, a7, 1, v9, a9);
}

+ (void)annotatedRepliesForMessages:(id)a3 senderMessages:(id)a4 recipientHandles:(id)a5 languageCode:(id)a6 languageCodeChangeDate:(id)a7 completion:(id)a8
{
  objc_msgSend(a1, "_annotatedRepliesForMessages:senderMessages:recipientHandles:languageCode:languageCodeChangeDate:loadAsync:completion:", a3, a4, a5, a6, a7, 1, a8);
}

+ (id)repliesForMessages:(id)a3 senderMessages:(id)a4 recipientHandles:(id)a5 languageCode:(id)a6 languageCodeChangeDate:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v19;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_19E24762C;
  v25 = sub_19E2474FC;
  v26 = 0;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = sub_19E2B2D70;
  v20[3] = &unk_1E3FB70E8;
  v20[4] = &v21;
  LOBYTE(v19) = 1;
  objc_msgSend(a1, "_repliesForMessages:senderMessages:recipientHandles:languageCode:languageCodeChangeDate:loadAsync:fetchUsingContactsFramework:completion:", v12, v13, v14, v15, v16, 0, v19, v20);
  v17 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v17;
}

+ (void)_annotatedRepliesForMessages:(id)a3 senderMessages:(id)a4 recipientHandles:(id)a5 languageCode:(id)a6 languageCodeChangeDate:(id)a7 loadAsync:(BOOL)a8 completion:(id)a9
{
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  IMReplySuggestion *v24;
  void *v25;
  void *v26;
  char v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  id v33;
  _BOOL4 v34;
  void *v35;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v34 = a8;
  v48 = *MEMORY[0x1E0C80C00];
  v37 = a3;
  v36 = a4;
  v13 = a5;
  v14 = a6;
  v33 = a7;
  v15 = a9;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v35 = v13;
  sub_19E2B301C(v13, v14, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v44 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        v24 = -[IMReplySuggestion initWithType:text:]([IMReplySuggestion alloc], "initWithType:text:", 1, v23);
        -[IMReplySuggestion setStringRepresentation:](v24, "setStringRepresentation:", v23);
        objc_msgSend(v23, "localizedLowercaseString");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObject:", v25);

        objc_msgSend(v16, "addObject:", v24);
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    }
    while (v20);
  }
  v26 = (void *)objc_opt_class();
  v27 = sub_19E2B2B2C();
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = sub_19E2B341C;
  v38[3] = &unk_1E3FB7110;
  v39 = v17;
  v40 = v16;
  v41 = v15;
  v42 = a1;
  v28 = v15;
  v29 = v16;
  v30 = v17;
  LOBYTE(v31) = v27;
  objc_msgSend(v26, "_contextualRepliesForMessages:senderMessages:recipientHandles:languageCode:languageCodeChangeDate:loadAsync:includeDynamicSuggestions:completion:", v37, v36, v35, v14, v33, v34, v31, v38);

}

+ (void)_repliesForMessages:(id)a3 senderMessages:(id)a4 recipientHandles:(id)a5 languageCode:(id)a6 languageCodeChangeDate:(id)a7 loadAsync:(BOOL)a8 fetchUsingContactsFramework:(BOOL)a9 completion:(id)a10
{
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  char v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  _BOOL4 v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;

  v31 = a8;
  v15 = a10;
  v16 = (void *)MEMORY[0x1E0C99DE8];
  v17 = a7;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  v21 = a3;
  objc_msgSend(v16, "array");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  sub_19E2B301C(v19, v18, a9);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  sub_19E2B39F0(v22, v23, v24);

  v25 = (void *)objc_opt_class();
  v26 = sub_19E2B2B2C();
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = sub_19E2B3B40;
  v32[3] = &unk_1E3FB7138;
  v33 = v22;
  v34 = v23;
  v35 = v15;
  v27 = v15;
  v28 = v23;
  v29 = v22;
  LOBYTE(v30) = v26;
  objc_msgSend(v25, "_contextualRepliesForMessages:senderMessages:recipientHandles:languageCode:languageCodeChangeDate:loadAsync:includeDynamicSuggestions:completion:", v21, v20, v19, v18, v17, v31, v30, v32);

}

+ (void)_contextualRepliesForMessages:(id)a3 senderMessages:(id)a4 recipientHandles:(id)a5 languageCode:(id)a6 languageCodeChangeDate:(id)a7 loadAsync:(BOOL)a8 includeDynamicSuggestions:(BOOL)a9 completion:(id)a10
{
  _BOOL4 v10;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  id v25;
  void *v26;
  unint64_t v27;
  _BOOL8 v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  id v38;
  void *v39;
  unint64_t v40;
  _BOOL8 v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  objc_class *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  id v56;
  id v57;
  id v58;
  id v59;
  void *v60;
  void *v61;
  id v62;
  id obj;
  id v64;
  _QWORD aBlock[4];
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _QWORD v75[5];
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t v79;
  _BYTE v80[128];
  _BYTE v81[128];
  uint64_t v82;

  v10 = a8;
  v82 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v54 = a5;
  v17 = a6;
  v58 = a7;
  v57 = a10;
  v61 = v17;
  if (!objc_msgSend(v17, "length"))
  {
    if (_IMWillLog())
      _IMAlwaysLog();

    v61 = 0;
  }
  objc_msgSend(v15, "firstObject", v54);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "time");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "firstObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "time");
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  v56 = v19;
  v59 = v56;
  if (objc_msgSend(v56, "compare:", v60) == -1)
  {
    v59 = v60;

  }
  v64 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  obj = v15;
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v81, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v72;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v72 != v22)
          objc_enumerationMutation(obj);
        v24 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
        v25 = objc_alloc_init((Class)sub_19E2B42E8());
        +[IMReplySuggestionGenerator combinedPlainTextOfMessageItem:](IMReplySuggestionGenerator, "combinedPlainTextOfMessageItem:", v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setTitle:", v26);

        v27 = objc_msgSend(v24, "associatedMessageType") & 0xFFFFFFFFFFFFFFF8;
        v29 = v27 == 3000 || v27 == 2000;
        objc_msgSend(v25, "setTapBack:", v29);
        objc_msgSend(v25, "setRead:", objc_msgSend(v24, "isRead"));
        objc_msgSend(v25, "setEmote:", objc_msgSend(v24, "isEmote"));
        objc_msgSend(v24, "sender");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)objc_msgSend(v30, "copy");
        objc_msgSend(v25, "setSenderIdentifier:", v31);

        objc_msgSend(v24, "time");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setDateSent:", v32);

        objc_msgSend(v64, "addObject:", v25);
      }
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v81, 16);
    }
    while (v21);
  }

  v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v62 = v16;
  v34 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v67, v80, 16);
  if (v34)
  {
    v35 = *(_QWORD *)v68;
    do
    {
      for (j = 0; j != v34; ++j)
      {
        if (*(_QWORD *)v68 != v35)
          objc_enumerationMutation(v62);
        v37 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * j);
        v38 = objc_alloc_init((Class)sub_19E2B42E8());
        +[IMReplySuggestionGenerator combinedPlainTextOfMessageItem:](IMReplySuggestionGenerator, "combinedPlainTextOfMessageItem:", v37);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setTitle:", v39);

        v40 = objc_msgSend(v37, "associatedMessageType") & 0xFFFFFFFFFFFFFFF8;
        v42 = v40 == 3000 || v40 == 2000;
        objc_msgSend(v38, "setTapBack:", v42);
        objc_msgSend(v38, "setRead:", objc_msgSend(v37, "isRead"));
        objc_msgSend(v38, "setEmote:", objc_msgSend(v37, "isEmote"));
        objc_msgSend(v37, "sender");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = (void *)objc_msgSend(v43, "copy");
        objc_msgSend(v38, "setSenderIdentifier:", v44);

        objc_msgSend(v37, "time");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setDateSent:", v45);

        objc_msgSend(v33, "addObject:", v38);
      }
      v34 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v67, v80, 16);
    }
    while (v34);
  }

  v76 = 0;
  v77 = &v76;
  v78 = 0x2050000000;
  v46 = (void *)qword_1EE503FB0;
  v79 = qword_1EE503FB0;
  if (!qword_1EE503FB0)
  {
    v75[0] = MEMORY[0x1E0C809B0];
    v75[1] = 3221225472;
    v75[2] = sub_19E2B4D80;
    v75[3] = &unk_1E3FB4F80;
    v75[4] = &v76;
    sub_19E2B4D80((uint64_t)v75);
    v46 = (void *)v77[3];
  }
  v47 = objc_retainAutorelease(v46);
  _Block_object_dispose(&v76, 8);
  v48 = (void *)objc_msgSend([v47 alloc], "initWithType:receivedMessages:", 0, v64);
  objc_msgSend(v48, "setSenderMessages:", v33);
  objc_msgSend(v48, "setLanguageCode:", v61);
  objc_msgSend(v48, "setIncludesDynamicSuggestions:", a9);
  objc_msgSend(v48, "setRequestDate:", v59);
  objc_msgSend(v48, "setLanguageLastChangedDate:", v58);
  objc_msgSend(sub_19E2B43A0(), "sharedManager");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v49;
  if (v10)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_19E2B4458;
    aBlock[3] = &unk_1E3FB7160;
    v66 = v57;
    v51 = _Block_copy(aBlock);
    objc_msgSend(v50, "suggestionsForRequest:withCompletion:", v48, v51);

    v52 = v66;
  }
  else
  {
    objc_msgSend(v49, "suggestionsForRequest:", v48);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "suggestions");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, void *))v57 + 2))(v57, v52);
  }

}

+ (int64_t)_tintColorForMetadata:(id)a3
{
  id v3;
  int64_t v4;
  void *v5;

  v3 = a3;
  v4 = 0;
  switch(objc_msgSend(v3, "attributionSource"))
  {
    case 1:
      break;
    case 3:
      objc_msgSend(v3, "url");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
        v4 = 3;
      else
        v4 = 4;

      break;
    case 4:
      v4 = 1;
      break;
    case 5:
      v4 = 2;
      break;
    default:
      v4 = 4;
      break;
  }

  return v4;
}

+ (void)primeResponseKitIfNeeded
{
  if (qword_1EE503F70 != -1)
    dispatch_once(&qword_1EE503F70, &unk_1E3FB3788);
}

+ (id)combinedPlainTextOfMessageItem:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  __CFString *v15;

  v3 = a3;
  objc_msgSend(v3, "balloonBundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  v6 = &stru_1E3FBBA48;
  if (!v5)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x3032000000;
    v13 = sub_19E24762C;
    v14 = sub_19E2474FC;
    v15 = &stru_1E3FBBA48;
    objc_msgSend(v3, "body");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_19E2B46D0;
    v9[3] = &unk_1E3FB7188;
    v9[4] = &v10;
    objc_msgSend(v7, "__im_visitMessageParts:", v9);

    objc_msgSend((id)v11[5], "trimmedString");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    _Block_object_dispose(&v10, 8);

  }
  return v6;
}

+ (id)textMessageItemsFilteredByIsOutgoing:(id)a3 isOutgoingContent:(BOOL)a4
{
  int v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v4 = a4;
  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v21 = (id)objc_opt_new();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v5, "reverseObjectEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (!v7)
  {
    v9 = 0;
    goto LABEL_24;
  }
  v8 = v7;
  v9 = 0;
  v10 = *(_QWORD *)v23;
  v20 = v5;
  while (2)
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v23 != v10)
        objc_enumerationMutation(v6);
      v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v13 = v12;
      else
        v13 = 0;
      v14 = v13;
      v15 = v14;
      if (!v14 || (objc_msgSend(v14, "isLastMessageCandidate") & 1) == 0)
        goto LABEL_19;
      +[IMReplySuggestionGenerator combinedPlainTextOfMessageItem:](IMReplySuggestionGenerator, "combinedPlainTextOfMessageItem:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "isFromMe") != v4
        || (objc_msgSend(v15, "isTypingMessage") & 1) != 0
        || !objc_msgSend(v16, "length"))
      {

LABEL_19:
        if (v9)
          goto LABEL_24;
        continue;
      }
      objc_msgSend(v15, "time");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        objc_msgSend(v15, "time");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v9, "timeIntervalSinceDate:", v17, v20);
      if (v18 > 120.0)
      {

        v5 = v20;
        goto LABEL_24;
      }
      objc_msgSend(v21, "insertObject:atIndex:", v15, 0);

      v5 = v20;
    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v8)
      continue;
    break;
  }
LABEL_24:

  return v21;
}

+ (id)recentIncomingMessagesWithTextContentForReplySuggestions:(id)a3
{
  return (id)MEMORY[0x1E0DE7D20](IMReplySuggestionGenerator, sel_textMessageItemsFilteredByIsOutgoing_isOutgoingContent_);
}

+ (id)recentOugoingMessagesWithTextContentForReplySuggestions:(id)a3
{
  return (id)MEMORY[0x1E0DE7D20](IMReplySuggestionGenerator, sel_textMessageItemsFilteredByIsOutgoing_isOutgoingContent_);
}

@end
