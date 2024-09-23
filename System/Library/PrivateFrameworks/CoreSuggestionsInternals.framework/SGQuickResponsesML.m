@implementation SGQuickResponsesML

- (SGQuickResponsesML)initWithTraining:(id)a3
{
  id v5;
  SGQuickResponsesML *v6;
  SGQuickResponsesML *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SGQuickResponsesML;
  v6 = -[SGQuickResponsesML init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_localTraining, a3);

  return v7;
}

- (id)_dynamicLabelContentForReply:(id)a3 prompt:(id)a4 language:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  _BOOL4 v41;
  void *v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t i;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  SGNameDetector *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  _BOOL4 v65;
  unint64_t v67;
  void *v68;
  void *v69;
  NSObject *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint8_t v80[128];
  uint8_t buf[4];
  uint64_t v82;
  __int16 v83;
  uint64_t v84;
  __int16 v85;
  uint64_t v86;
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "message");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "attachmentFilename");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "message");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sender");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "displayName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if (+[SGQuickResponsesML _isImageAttachment:](SGQuickResponsesML, "_isImageAttachment:", v11))
    {
      v15 = CFSTR("photoSharingUEhPVE8K");
      goto LABEL_56;
    }
    if (+[SGQuickResponsesML _isSharingSenderLocation:senderName:](SGQuickResponsesML, "_isSharingSenderLocation:senderName:", v11, v14))
    {
      v15 = CFSTR("firstPartyLocTE9DLjFwCg");
      goto LABEL_56;
    }
  }
  if (!v14)
  {
    v15 = 0;
    goto LABEL_56;
  }
  v74 = v9;
  v75 = v14;
  v73 = v11;
  objc_msgSend(v7, "detectedData");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v16, "count"))
  {
    v17 = 0;
    v15 = 0;
    goto LABEL_55;
  }
  v71 = v8;
  v72 = v7;
  v17 = 0;
  v18 = 0;
  v19 = -1;
  v20 = 1;
  do
  {
    objc_msgSend(v16, "objectAtIndexedSubscript:", v20 - 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "matchType");

    switch(v22)
    {
      case 2:
        v19 = 2;
LABEL_16:
        objc_msgSend(v16, "objectAtIndexedSubscript:", v20 - 1);
        v28 = objc_claimAutoreleasedReturnValue();

        ++v18;
        v17 = (void *)v28;
        break;
      case 1:
        v19 = 1;
        goto LABEL_16;
      case 0:
        v23 = v19;
        +[SGContactPipelineHelper sharedInstance](SGContactPipelineHelper, "sharedInstance");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectAtIndexedSubscript:", v20 - 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "valueString");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v24, "numberMatchesContactsForm:", v26);

        if ((v27 & 1) == 0)
        {
          v19 = v23;
          break;
        }
        v19 = 0;
        goto LABEL_16;
    }
    if (objc_msgSend(v16, "count") <= v20)
      break;
    ++v20;
  }
  while (v18 < 2);
  if (v18 == 1)
  {
    objc_msgSend(v17, "valueString");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v71;
    v7 = v72;
    if (!v29)
    {
      v30 = objc_msgSend(v17, "range");
      v32 = v31;
      objc_msgSend(v72, "message");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "textContent");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30 + v32 > (unint64_t)objc_msgSend(v29, "length"))
      {
        sgLogHandle();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218496;
          v82 = v30;
          v83 = 2048;
          v84 = v32;
          v85 = 2048;
          v86 = objc_msgSend(v29, "length");
          _os_log_error_impl(&dword_1C3607000, v34, OS_LOG_TYPE_ERROR, "Range {%tu, %tu} out of bounds; string length: %tu",
            buf,
            0x20u);
        }
        v15 = 0;
        v7 = v72;
        goto LABEL_54;
      }
      v35 = (void *)MEMORY[0x1C3BD4F6C]();
      objc_msgSend(v29, "substringWithRange:", v30, v32);
      v36 = objc_claimAutoreleasedReturnValue();
      objc_autoreleasePoolPop(v35);

      v29 = (void *)v36;
      v7 = v72;
    }
    +[SGContactPipelineHelper findContactsForDetailType:andValue:](SGContactPipelineHelper, "findContactsForDetailType:andValue:", v19, v29);
    v37 = objc_claimAutoreleasedReturnValue();
    v34 = v37;
    if (!v37 || !-[NSObject count](v37, "count"))
    {
LABEL_36:
      v15 = 0;
      goto LABEL_54;
    }
    v67 = v19;
    objc_msgSend(v7, "message");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "sender");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handles");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "firstObject");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = v34;
    v41 = +[SGContactPipelineHelper personExistsInContacts:name:handle:](SGContactPipelineHelper, "personExistsInContacts:name:handle:", v34, v75, v40);

    if (v41)
    {
      if (v67 < 3)
      {
        v15 = off_1E7DAB568[v67];
        goto LABEL_54;
      }
      goto LABEL_36;
    }
    v69 = v29;
    v42 = (void *)objc_opt_new();
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v43 = v34;
    v44 = -[NSObject countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v76, v80, 16);
    if (v44)
    {
      v45 = v44;
      v46 = *(_QWORD *)v77;
      do
      {
        for (i = 0; i != v45; ++i)
        {
          if (*(_QWORD *)v77 != v46)
            objc_enumerationMutation(v43);
          v48 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
          objc_msgSend(v48, "givenName");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend(v49, "length");

          if (v50)
          {
            objc_msgSend(v48, "givenName");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "lowercaseString");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "addObject:", v52);

          }
          objc_msgSend(v48, "familyName");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = objc_msgSend(v53, "length");

          if (v54)
          {
            objc_msgSend(v48, "familyName");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "lowercaseString");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "addObject:", v56);

          }
        }
        v45 = -[NSObject countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v76, v80, 16);
      }
      while (v45);
    }

    v57 = (void *)MEMORY[0x1C3BD4F6C]();
    v58 = -[SGNameDetector initWithLanguage:]([SGNameDetector alloc], "initWithLanguage:", v74);
    v8 = v71;
    -[SGNameDetector detectNames:withNameSet:](v58, "detectNames:withNameSet:", v71, v42);
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v57);
    if (objc_msgSend(v59, "count") != 1)
      goto LABEL_52;
    v60 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(v59, "firstObject");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v61, "range");
    objc_msgSend(v71, "substringWithRange:", v62, v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v71;
    objc_autoreleasePoolPop(v60);
    v65 = +[SGContactPipelineHelper personExistsInContacts:name:handle:](SGContactPipelineHelper, "personExistsInContacts:name:handle:", v43, v64, 0);

    if (!v65)
      goto LABEL_52;
    if (v67 < 3)
    {
      v15 = off_1E7DAB580[v67];

    }
    else
    {
LABEL_52:

      v15 = 0;
    }
    v7 = v72;
    v29 = v69;
    v34 = v70;
LABEL_54:

  }
  else
  {
    v15 = 0;
    v8 = v71;
    v7 = v72;
  }
LABEL_55:

  v11 = v73;
  v9 = v74;
  v14 = v75;
LABEL_56:

  return (id)v15;
}

- (void)trainQuickResponsesForMessage:(id)a3 withConversationHistory:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  const char *v17;
  const char *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  unint64_t v38;
  unint64_t v39;
  NSObject *v40;
  const char *v41;
  NSObject *v42;
  uint32_t v43;
  void *v44;
  uint64_t v45;
  NSObject *v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  NSObject *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  char v56;
  NSObject *v57;
  _BOOL4 v58;
  void *v59;
  NSObject *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  NSObject *v65;
  uint64_t v66;
  NSObject *v67;
  void *v68;
  void *v69;
  void *v70;
  _BOOL4 v71;
  PMLTrainingProtocol *localTraining;
  void *v73;
  int v74;
  _BOOL4 v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  NSObject *v81;
  NSObject *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  NSObject *v86;
  void *v87;
  void *v88;
  uint8_t buf[4];
  _BYTE v90[10];
  __int16 v91;
  _BOOL4 v92;
  __int16 v93;
  _BOOL4 v94;
  __int16 v95;
  void *v96;
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "likelyLanguage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    sgLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      goto LABEL_33;
    *(_WORD *)buf = 0;
    v18 = "Quick responses: No likely language prediction for conversation";
LABEL_13:
    _os_log_debug_impl(&dword_1C3607000, v12, OS_LOG_TYPE_DEBUG, v18, buf, 2u);
    goto LABEL_33;
  }
  objc_msgSend(v7, "conversationIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  if (!v11)
  {
    sgLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      goto LABEL_33;
    *(_WORD *)buf = 0;
    v18 = "Quick responses: Text message has no conversation identifier";
    goto LABEL_13;
  }
  if (+[SGDetectedAttributeDissector isTwoPersonConversation:](SGDetectedAttributeDissector, "isTwoPersonConversation:", v7))
  {
    objc_msgSend(v8, "messages");
    v12 = objc_claimAutoreleasedReturnValue();
    -[NSObject objectAtIndexedSubscript:](v12, "objectAtIndexedSubscript:", -[NSObject count](v12, "count") - 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "message");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "textContent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v15, "length") >= 0x65)
    {
      sgLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        v17 = "Quick responses: response message is much too long for labeling or DP reporting";
LABEL_17:
        _os_log_debug_impl(&dword_1C3607000, v16, OS_LOG_TYPE_DEBUG, v17, buf, 2u);
        goto LABEL_32;
      }
      goto LABEL_32;
    }
    if ((unint64_t)-[NSObject count](v12, "count") <= 1)
    {
      sgLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        v17 = "Quick responses: processing requires at least two text messages";
        goto LABEL_17;
      }
LABEL_32:

      goto LABEL_33;
    }
    v19 = (void *)MEMORY[0x1E0D19EF0];
    objc_msgSend(v8, "likelyLanguage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v19) = objc_msgSend(v19, "areModelsAvailableInLanguage:", v20);

    if ((v19 & 1) == 0)
    {
      sgLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v8, "likelyLanguage");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v90 = v32;
        _os_log_debug_impl(&dword_1C3607000, v16, OS_LOG_TYPE_DEBUG, "Quick responses: No model available for language: %@", buf, 0xCu);

      }
      goto LABEL_32;
    }
    v87 = v15;
    -[NSObject objectAtIndexedSubscript:](v12, "objectAtIndexedSubscript:", -[NSObject count](v12, "count") - 2);
    v16 = objc_claimAutoreleasedReturnValue();
    -[NSObject message](v16, "message");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "sender");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handles");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = v13;
    if (objc_msgSend(v23, "count") == 1)
    {
      objc_msgSend(v13, "message");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "sender");
      v86 = v16;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handles");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = objc_msgSend(v25, "count");

      v16 = v86;
      if (v83 == 1)
      {
        -[NSObject message](v86, "message");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "sender");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "handles");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "firstObject");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "message");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "sender");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "handles");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "firstObject");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = objc_msgSend(v26, "isEqualToString:", v30);

        if (v74)
        {
          sgLogHandle();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl(&dword_1C3607000, v31, OS_LOG_TYPE_DEBUG, "Quick responses: processing requires the reply to be to a different person's prompt", buf, 2u);
          }
          v13 = v88;
          v16 = v86;
          goto LABEL_31;
        }
        v33 = (void *)MEMORY[0x1E0D19EE8];
        objc_msgSend(v8, "likelyLanguage");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "transformerInstanceForLanguage:mode:", v34, 0);
        v31 = objc_claimAutoreleasedReturnValue();

        -[NSObject config](v31, "config");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "classificationParams");
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        +[SGTextMessageConversationTracker getMergedPrompt:withParams:](SGTextMessageConversationTracker, "getMergedPrompt:withParams:", v8, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = v37;
        if (!objc_msgSend(v37, "length") || !objc_msgSend(v87, "length"))
        {
          sgLogHandle();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            v41 = "Quick responses: processing requires the prompt and the reply to have text content";
            v42 = v40;
            v43 = 2;
            goto LABEL_74;
          }
LABEL_43:
          v13 = v88;
          v16 = v86;
LABEL_44:

LABEL_31:
          v15 = v87;
          goto LABEL_32;
        }
        v38 = objc_msgSend(v36, "maxPromptLength");
        if (v38 >= 0x400)
          v39 = 1024;
        else
          v39 = v38;
        if (objc_msgSend(v37, "length") > v39)
        {
          sgLogHandle();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134217984;
            *(_QWORD *)v90 = v39;
            v41 = "Quick responses: processing requires the prompt to be no more than %lu characters in length";
            v42 = v40;
            v43 = 12;
LABEL_74:
            _os_log_debug_impl(&dword_1C3607000, v42, OS_LOG_TYPE_DEBUG, v41, buf, v43);
            goto LABEL_43;
          }
          goto LABEL_43;
        }
        objc_msgSend(v8, "likelyLanguage");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        -[SGQuickResponsesML _dynamicLabelContentForReply:prompt:language:](self, "_dynamicLabelContentForReply:prompt:language:", v88, v37, v44);
        v45 = objc_claimAutoreleasedReturnValue();

        v81 = v45;
        if (v45)
        {
          v78 = v36;
          sgLogHandle();
          v46 = objc_claimAutoreleasedReturnValue();
          v47 = 0x1E0D19000;
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v90 = v81;
            _os_log_debug_impl(&dword_1C3607000, v46, OS_LOG_TYPE_DEBUG, "Quick responses: using dynamic label with unique identifier %@", buf, 0xCu);
          }

          v40 = v81;
        }
        else
        {
          v40 = v87;
          v48 = objc_msgSend(v36, "maxReplyLength");
          if (v48 >= 0x400)
            v49 = 1024;
          else
            v49 = v48;
          if (-[NSObject length](v40, "length") > v49)
          {
            sgLogHandle();
            v50 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134217984;
              *(_QWORD *)v90 = v49;
              _os_log_debug_impl(&dword_1C3607000, v50, OS_LOG_TYPE_DEBUG, "Quick responses: not keeping response message because it is greater than %lu characters in length", buf, 0xCu);
            }
            v13 = v88;
            v16 = v86;
            goto LABEL_81;
          }
          v78 = v36;
          v47 = 0x1E0D19000uLL;
        }
        v51 = *(void **)(v47 + 3816);
        objc_msgSend(v8, "likelyLanguage");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "labelOf:inLanguage:", v40, v52);
        v53 = objc_claimAutoreleasedReturnValue();

        if (v53)
        {
          v75 = v81 != 0;
          v54 = *(void **)(v47 + 3816);
          objc_msgSend(v8, "likelyLanguage");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v82 = v53;
          v56 = objc_msgSend(v54, "shouldSampleForLabel:inLanguage:isDynamicLabel:", v53, v55, v75);

          sgLogHandle();
          v57 = objc_claimAutoreleasedReturnValue();
          v58 = os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG);
          if ((v56 & 1) == 0)
          {
            v67 = v57;
            v16 = v86;
            v36 = v78;
            if (v58)
            {
              *(_DWORD *)buf = 138412290;
              v50 = v82;
              *(_QWORD *)v90 = v82;
              _os_log_debug_impl(&dword_1C3607000, v67, OS_LOG_TYPE_DEBUG, "Quick responses: dropping sample with label %@", buf, 0xCu);
              v13 = v88;
            }
            else
            {
              v13 = v88;
              v50 = v82;
            }
            goto LABEL_80;
          }
          if (v58)
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v90 = v82;
            _os_log_debug_impl(&dword_1C3607000, v57, OS_LOG_TYPE_DEBUG, "Quick responses: keeping sample with label %@", buf, 0xCu);
          }

          -[NSObject source](v31, "source");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "sessionDescriptor");
          v60 = objc_claimAutoreleasedReturnValue();

          -[NSObject featurizer](v31, "featurizer");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "transform:", v85);
          v62 = objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGQuickResponsesML.m"), 303, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[vector isKindOfClass:PMLSparseVector.class]"));

          }
          v76 = (void *)v62;
          if (self->_localTraining
            && (objc_msgSend(v7, "spotlightReference"),
                v63 = (void *)objc_claimAutoreleasedReturnValue(),
                v63,
                v63)
            && v62
            && v60)
          {
            localTraining = self->_localTraining;
            v50 = v82;
            v64 = -[NSObject unsignedIntegerValue](v82, "unsignedIntegerValue");
            objc_msgSend(v7, "spotlightReference");
            v65 = objc_claimAutoreleasedReturnValue();
            v66 = v64;
            v67 = v60;
            -[PMLTrainingProtocol addSessionWithCovariates:label:sessionDescriptor:spotlightReference:isInternal:](localTraining, "addSessionWithCovariates:label:sessionDescriptor:spotlightReference:isInternal:", v62, v66, v60, v65, 0);
            v16 = v86;
          }
          else
          {
            v67 = v60;
            sgLogHandle();
            v65 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
            {
              v71 = self->_localTraining != 0;
              objc_msgSend(v7, "spotlightReference");
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject version](v60, "version");
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 67110146;
              *(_DWORD *)v90 = v71;
              *(_WORD *)&v90[4] = 1024;
              *(_DWORD *)&v90[6] = v73 != 0;
              v91 = 1024;
              v92 = v76 != 0;
              v93 = 1024;
              v94 = v60 != 0;
              v95 = 2112;
              v96 = v69;
              _os_log_debug_impl(&dword_1C3607000, v65, OS_LOG_TYPE_DEBUG, "Quick responses: not adding session for training - localTraining %d, spotlightReference %d, vector %d, sessionDescriptor %d, version: %@", buf, 0x24u);

            }
            v16 = v86;
            v50 = v82;
          }

          v13 = v88;
        }
        else
        {
          v50 = 0;
          sgLogHandle();
          v67 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v8, "likelyLanguage");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v90 = v68;
            _os_log_error_impl(&dword_1C3607000, v67, OS_LOG_TYPE_ERROR, "Quick responses: labeler failed to offer positive or negative label in language %@", buf, 0xCu);

          }
          v13 = v88;
          v16 = v86;
        }
        v36 = v78;
LABEL_80:

LABEL_81:
        goto LABEL_44;
      }
    }
    else
    {

    }
    sgLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C3607000, v31, OS_LOG_TYPE_DEBUG, "Quick responses: processing requires the prompt and reply to have a single sender handle", buf, 2u);
    }
    v13 = v88;
    goto LABEL_31;
  }
  sgLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    v18 = "Quick responses: processing is disabled for group messages";
    goto LABEL_13;
  }
LABEL_33:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localTraining, 0);
}

+ (BOOL)_isSharingSenderLocation:(id)a3 senderName:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  BOOL v10;

  v5 = a3;
  v6 = a4;
  v10 = 1;
  if ((objc_msgSend(CFSTR("CL.loc.vcf"), "isEqualToString:", v5) & 1) == 0
    && (objc_msgSend(CFSTR("Shared Location.loc.vcf"), "isEqualToString:", v5) & 1) == 0)
  {
    if (!v6
      || (v7 = (void *)MEMORY[0x1C3BD4F6C](),
          v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@'s Location.loc.vcf"), v6), v9 = objc_msgSend(v8, "isEqualToString:", v5), v8, objc_autoreleasePoolPop(v7), (v9 & 1) == 0))
    {
      v10 = 0;
    }
  }

  return v10;
}

+ (BOOL)_isImageAttachment:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(&unk_1E7E107A0, "containsObject:", v4);
  return (char)v3;
}

@end
