@implementation SMSApplicationIntentsHelper

+ (BOOL)isSendMessageInteraction:(id)a3
{
  void *v3;
  char isKindOfClass;

  if (a3)
  {
    objc_msgSend(a3, "intent");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  else
  {
    isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

+ (BOOL)continueWithSendMessageInteraction:(id)a3 chatRegistry:(id)a4 navigationProvider:(id)a5 conversationList:(id)a6 chatController:(id)a7
{
  id v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  CKComposition *v16;
  uint64_t i;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  CKComposition *v24;
  CKComposition *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t j;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  void *v61;
  char isKindOfClass;
  id v63;
  void *v64;
  void *v65;
  id v67;
  void *v68;
  id v69;
  id v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  uint64_t v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  id v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _BYTE v85[128];
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v73 = a4;
  v67 = a5;
  v70 = a6;
  v69 = a7;
  v71 = v11;
  objc_msgSend(v11, "intent");
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "attachments");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v81, v86, 16);
  v14 = 0x1E0CB3000uLL;
  if (!v13)
  {
    v16 = 0;
    goto LABEL_27;
  }
  v15 = v13;
  v16 = 0;
  v74 = v12;
  v75 = *(_QWORD *)v82;
  do
  {
    for (i = 0; i != v15; ++i)
    {
      if (*(_QWORD *)v82 != v75)
        objc_enumerationMutation(v12);
      v18 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * i);
      objc_msgSend(v18, "sharedLink", v67);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        v20 = objc_alloc(*(Class *)(v14 + 1176));
        objc_msgSend(v18, "sharedLink");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "absoluteString");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (id)objc_msgSend(v20, "initWithString:attributes:", v22, 0);

        v24 = -[CKComposition initWithText:subject:]([CKComposition alloc], "initWithText:subject:", v23, 0);
        v25 = v24;
        if (v16)
        {
          -[CKComposition compositionByAppendingComposition:](v16, "compositionByAppendingComposition:", v24);
          v26 = objc_claimAutoreleasedReturnValue();

          v16 = (CKComposition *)v26;
        }
        else
        {
          v25 = v24;
          v16 = v25;
        }
      }
      else
      {
        objc_msgSend(v18, "file");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v27)
          continue;
        objc_msgSend(v18, "file");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "typeIdentifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v29, "isEqual:", CFSTR("com.apple.live-photo")) & 1) != 0)
        {
          objc_msgSend(v18, "file");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "fileURL");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "pathExtension");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "isEqualToIgnoringCase:", CFSTR("mov"));

          if ((v33 & 1) != 0)
          {
            v14 = 0x1E0CB3000;
            v12 = v74;
            continue;
          }
        }
        else
        {

        }
        objc_msgSend(MEMORY[0x1E0D36A38], "defaultHFSFileManager");
        v25 = (CKComposition *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "file");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "fileURL");
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v35, "lastPathComponent");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKComposition im_randomTemporaryFileURLWithFileName:](v25, "im_randomTemporaryFileURLWithFileName:", v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        v80 = 0;
        LODWORD(v36) = -[CKComposition im_copySecurityScopedResourceAtURL:toDestination:error:](v25, "im_copySecurityScopedResourceAtURL:toDestination:error:", v35, v37, &v80);
        v23 = v80;
        if ((_DWORD)v36)
        {
          +[CKMediaObjectManager sharedInstance](CKMediaObjectManager, "sharedInstance");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "mediaObjectWithFileURL:filename:transcoderUserInfo:", v37, 0, 0);
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            -[CKComposition compositionByAppendingMediaObject:](v16, "compositionByAppendingMediaObject:", v39);
            v40 = objc_claimAutoreleasedReturnValue();

            v16 = (CKComposition *)v40;
          }
          else
          {
            +[CKComposition compositionWithMediaObject:subject:](CKComposition, "compositionWithMediaObject:subject:", v39, 0);
            v16 = (CKComposition *)objc_claimAutoreleasedReturnValue();
          }
          v14 = 0x1E0CB3000;

        }
        else
        {
          v14 = 0x1E0CB3000;
        }
        v12 = v74;

      }
    }
    v15 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v81, v86, 16);
  }
  while (v15);
LABEL_27:

  objc_msgSend(v72, "content");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v41, "length"))
  {
    v42 = (void *)objc_msgSend(objc_alloc(*(Class *)(v14 + 1176)), "initWithString:attributes:", v41, 0);
    if (v16)
    {
      -[CKComposition compositionByAppendingText:](v16, "compositionByAppendingText:", v42);
      v43 = objc_claimAutoreleasedReturnValue();

      v16 = (CKComposition *)v43;
    }
    else
    {
      v16 = -[CKComposition initWithText:subject:]([CKComposition alloc], "initWithText:subject:", v42, 0);
    }

  }
  objc_msgSend(v72, "conversationIdentifier", v67);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "existingChatWithGUID:", v44);
  v45 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v72, "speakableGroupName");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v46;
  if (!v45 && v46)
  {
    objc_msgSend(v46, "vocabularyIdentifier");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "existingChatWithGUID:", v48);
    v45 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!v45 && v47)
  {
    objc_msgSend(v47, "spokenPhrase");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "existingChatWithDisplayName:", v49);
    v45 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (v45)
  {
LABEL_51:
    objc_msgSend(v70, "conversationForExistingChat:", v45);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v69;
    v60 = objc_msgSend(v71, "intentHandlingStatus");
    objc_msgSend(v59, "conversation");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v61, "isEqual:", v51))
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        v63 = v59;
        v64 = v63;
        if (v60 != 3)
        {
          objc_msgSend(v63, "setComposition:", v16);
          objc_msgSend(v64, "showKeyboardForReply");
        }

        v65 = v68;
LABEL_60:

        goto LABEL_61;
      }
    }
    else
    {

    }
    if (v60 != 3)
      objc_msgSend(v51, "setUnsentComposition:", v16);
    v65 = v68;
    objc_msgSend(v68, "showConversation:animate:", v51, 1);
    goto LABEL_60;
  }
  objc_msgSend(v72, "valueForKeyPath:", CFSTR("recipients.personHandle.value"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v45 = v50;
  v52 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v76, v85, 16);
  if (v52)
  {
    v53 = v52;
    v54 = *(_QWORD *)v77;
    do
    {
      for (j = 0; j != v53; ++j)
      {
        if (*(_QWORD *)v77 != v54)
          objc_enumerationMutation(v45);
        v56 = *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * j);
        if (v56)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v51, "addObject:", v56);
        }
      }
      v53 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v76, v85, 16);
    }
    while (v53);
  }

  v57 = (void *)objc_msgSend(v51, "copy");
  objc_msgSend(v73, "existingChatWithAddresses:allowAlternativeService:bestHandles:", v57, 0, 0);
  v58 = objc_claimAutoreleasedReturnValue();

  if (v58)
  {

    v45 = (id)v58;
    goto LABEL_51;
  }
  v65 = v68;
  objc_msgSend(v68, "showNewMessageCompositionPanelWithRecipients:composition:animated:", v45, v16, 1);
LABEL_61:

  return 1;
}

@end
