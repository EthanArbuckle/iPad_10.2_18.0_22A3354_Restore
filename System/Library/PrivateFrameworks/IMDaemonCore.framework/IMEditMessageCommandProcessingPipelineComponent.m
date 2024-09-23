@implementation IMEditMessageCommandProcessingPipelineComponent

- (IMEditMessageCommandProcessingPipelineComponent)initWithPipelineResources:(id)a3
{
  id v5;
  IMEditMessageCommandProcessingPipelineComponent *v6;
  IMEditMessageCommandProcessingPipelineComponent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMEditMessageCommandProcessingPipelineComponent;
  v6 = -[IMEditMessageCommandProcessingPipelineComponent init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_pipelineResources, a3);

  return v7;
}

- (id)_idsAccount
{
  void *v2;
  void *v3;
  void *v4;

  -[IMEditMessageCommandProcessingPipelineComponent pipelineResources](self, "pipelineResources");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imdAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "idsAccount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_account
{
  void *v2;
  void *v3;

  -[IMEditMessageCommandProcessingPipelineComponent pipelineResources](self, "pipelineResources");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imdAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_messageStore
{
  void *v2;
  void *v3;

  -[IMEditMessageCommandProcessingPipelineComponent pipelineResources](self, "pipelineResources");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "messageStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)runIndividuallyWithInput:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  unsigned int v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  int v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  id v27;
  void *v28;
  NSObject *v29;
  id v30;
  NSObject *v31;
  id v32;
  NSObject *v33;
  id v34;
  int v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  NSObject *v42;
  id v43;
  uint64_t v44;
  NSObject *v45;
  id v46;
  NSObject *v47;
  uint64_t v48;
  NSObject *v49;
  id v50;
  id v51;
  uint64_t v52;
  NSObject *v53;
  unint64_t v54;
  NSObject *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t i;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t j;
  uint64_t v64;
  void *v65;
  id v66;
  uint64_t v67;
  NSObject *v68;
  void *v69;
  void *v70;
  NSObject *v71;
  id v72;
  void *v73;
  uint64_t v74;
  id v75;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  unsigned int v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  id v96;
  id v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  _BYTE v106[128];
  uint8_t v107[128];
  uint8_t buf[4];
  uint64_t v109;
  __int16 v110;
  uint64_t v111;
  __int16 v112;
  void *v113;
  __int16 v114;
  unint64_t v115;
  __int16 v116;
  uint64_t v117;
  uint64_t v118;

  v118 = *MEMORY[0x1E0C80C00];
  v96 = a3;
  objc_msgSend(v96, "editCommandGUID");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "editedMessageGUID");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled(v95))
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v109 = (uint64_t)v92;
      v110 = 2112;
      v111 = (uint64_t)v95;
      _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, "<IMEditMessageCommandProcessingPipelineComponent> Started processing for EditMessageCommand editCommandGUID: %@ editedMessageGUID: %@", buf, 0x16u);
    }

  }
  v5 = IMGetCachedDomainBoolForKey();
  if ((_DWORD)v5)
  {
    if (IMOSLoggingEnabled(v5))
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v109 = (uint64_t)v92;
        _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "    Ignoring edit message command for message: %@", buf, 0xCu);
      }

    }
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithValue:", v96);
    goto LABEL_107;
  }
  if (objc_msgSend(v95, "length"))
  {
    -[IMEditMessageCommandProcessingPipelineComponent _messageStore](self, "_messageStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "messageWithGUID:", v95);
    v94 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v94)
    {
      IMLogHandleForCategory();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        sub_1D166B948();

      v30 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v93 = (void *)objc_msgSend(v30, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D35A00], 5, 0);
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithError:", v93);
      goto LABEL_106;
    }
    objc_msgSend(v94, "body");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v93)
    {
      objc_msgSend(v94, "plainBody");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      v11 = &stru_1E92346B0;
      if (v9)
        v11 = (__CFString *)v9;
      v12 = v11;

      v93 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v12);
    }
    objc_msgSend(v94, "sender");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_stripFZIDPrefix");
    v85 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v96, "idsTrustedData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fromIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_stripFZIDPrefix");
    v84 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v96, "idsTrustedData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isFromMe");

    v18 = objc_msgSend(v94, "isFromMe");
    if ((v17 & v18 & 1) == 0 && (objc_msgSend(v84, "isEqualToString:", v85) & 1) == 0)
    {
      IMLogHandleForCategory();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138413314;
        v109 = (uint64_t)v95;
        v110 = 2112;
        v111 = (uint64_t)v84;
        v112 = 2112;
        v113 = v85;
        v114 = 2048;
        v115 = v18;
        v116 = 2048;
        v117 = v17;
        _os_log_error_impl(&dword_1D1413000, v33, OS_LOG_TYPE_ERROR, "Not allowing message edit for guid %@. Edit sender %@, original sender %@, original isFromMe %ld, edit isFromMe %ld", buf, 0x34u);
      }

      v34 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v86 = (void *)objc_msgSend(v34, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D35A00], 13, 0);
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithError:", v86);
      goto LABEL_105;
    }
    -[IMEditMessageCommandProcessingPipelineComponent _messageStore](self, "_messageStore");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "chatsForMessageGUID:", v95);
    v86 = (void *)objc_claimAutoreleasedReturnValue();

    if (IMOSLoggingEnabled(v20))
    {
      OSLogHandleForIMFoundationCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v109 = (uint64_t)v95;
        v110 = 2112;
        v111 = (uint64_t)v86;
        _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_INFO, "Found chats for messageID: %@  chats: %@", buf, 0x16u);
      }

    }
    if (!objc_msgSend(v86, "count"))
    {
      IMLogHandleForCategory();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        sub_1D166B9A8();

      v32 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v91 = (void *)objc_msgSend(v32, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D35A00], 8, 0);
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithError:", v91);

      goto LABEL_105;
    }
    objc_msgSend(v96, "editedMessagePartBody");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = objc_msgSend(v96, "editedMessagePartIndex");
    v22 = objc_msgSend(v96, "editType");
    objc_msgSend(v96, "editedMessagePartFileTransferGUIDs");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = objc_msgSend(v96, "shouldRetractMessageSubject");
    v23 = objc_msgSend(v96, "hasEditTypeAndPartIndex");
    if ((unint64_t)(v22 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      IMLogHandleForCategory();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        sub_1D166BA08();

      v25 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v89 = (void *)objc_msgSend(v25, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D35A00], 9, 0);
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithError:", v89);
      goto LABEL_104;
    }
    v35 = v23;
    v36 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v96, "timestamp");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "__im_iMessageDateFromTimeStamp:", v37);
    v89 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v94, "time");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "timeIntervalSinceDate:", v81);
    v39 = v38;
    -[IMEditMessageCommandProcessingPipelineComponent _timeoutIntervalForEditType:enforceExactRetractionTimeoutInterval:](self, "_timeoutIntervalForEditType:enforceExactRetractionTimeoutInterval:", v22, v35 ^ 1u);
    v40 = fabs(v39);
    if (v40 > v41)
    {
      IMLogHandleForCategory();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        v74 = (uint64_t)*MEMORY[0x1E0D38240];
        *(_DWORD *)buf = 134218754;
        v109 = (uint64_t)v40;
        v110 = 2048;
        v111 = v74;
        v112 = 2112;
        v113 = v81;
        v114 = 2112;
        v115 = (unint64_t)v89;
        _os_log_error_impl(&dword_1D1413000, v42, OS_LOG_TYPE_ERROR, "Unable to apply edits, message edit timestamp exceeds maximum receive timeout. TimeBetweenOriginalAndEdit: %ld, MaximumInterval: %ld, OriginalDate: %@, EditedDate: %@", buf, 0x2Au);
      }

      v43 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v82 = (void *)objc_msgSend(v43, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D35A00], 14, 0);
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithError:", v82);
LABEL_103:

LABEL_104:
LABEL_105:

LABEL_106:
      goto LABEL_107;
    }
    objc_msgSend(v94, "dateEdited");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    if (v82)
    {
      v44 = objc_msgSend(v82, "compare:", v89);
      if (v44 == 1)
      {
        IMLogHandleForCategory();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          sub_1D166BAEC();

        v46 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v79 = (void *)objc_msgSend(v46, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D35A00], 15, 0);
        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithError:", v79);

        goto LABEL_103;
      }
      if (IMOSLoggingEnabled(v44))
      {
        OSLogHandleForIMFoundationCategory();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v109 = (uint64_t)v89;
          v110 = 2112;
          v111 = (uint64_t)v82;
          _os_log_impl(&dword_1D1413000, v47, OS_LOG_TYPE_INFO, "Message has already been edited, processing newer edit. ThisEdit: %@, DateOfLastEdit: %@", buf, 0x16u);
        }

      }
    }
    objc_msgSend(v94, "historyForMessagePart:", v88);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "lastObject");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "dateSent");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    if (v78)
    {
      v48 = objc_msgSend(v78, "compare:", v89);
      if (v48 == 1)
      {
        IMLogHandleForCategory();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218498;
          v109 = v88;
          v110 = 2112;
          v111 = (uint64_t)v89;
          v112 = 2112;
          v113 = v78;
          _os_log_error_impl(&dword_1D1413000, v49, OS_LOG_TYPE_ERROR, "Unable to apply edits, message edit is older than previously processed edit for message part %ld. ThisEdit: %@, DateOfLastEdit: %@", buf, 0x20u);
        }

        v50 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v51 = (id)objc_msgSend(v50, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D35A00], 15, 0);
        v52 = objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithError:", v51);
        goto LABEL_101;
      }
      if (IMOSLoggingEnabled(v48))
      {
        OSLogHandleForIMFoundationCategory();
        v53 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v109 = (uint64_t)v89;
          v110 = 2112;
          v111 = (uint64_t)v78;
          _os_log_impl(&dword_1D1413000, v53, OS_LOG_TYPE_INFO, "Message part has already been edited, processing newer edit. ThisEdit: %@, DateOfLastPartEdit: %@", buf, 0x16u);
        }

      }
    }
    v54 = -[IMEditMessageCommandProcessingPipelineComponent _messageEditHistoryLimit](self, "_messageEditHistoryLimit");
    if (objc_msgSend(v80, "count") > v54 && v22 == 1)
    {
      IMLogHandleForCategory();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        sub_1D166BA68();
    }
    else
    {
      if (v22 != 1 || objc_msgSend(v90, "length"))
      {
        if (objc_msgSend(v83, "count"))
        {
          -[IMEditMessageCommandProcessingPipelineComponent _adaptiveImageGlyphFileTransferGUIDsInMessageItem:](self, "_adaptiveImageGlyphFileTransferGUIDsInMessageItem:", v94);
          v51 = (id)objc_claimAutoreleasedReturnValue();
          v104 = 0u;
          v105 = 0u;
          v102 = 0u;
          v103 = 0u;
          v56 = v83;
          v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v102, v107, 16);
          if (v57)
          {
            v58 = *(_QWORD *)v103;
            while (2)
            {
              for (i = 0; i != v57; ++i)
              {
                if (*(_QWORD *)v103 != v58)
                  objc_enumerationMutation(v56);
                if (!objc_msgSend(v51, "containsObject:", *(_QWORD *)(*((_QWORD *)&v102 + 1) + 8 * i)))
                {

                  IMLogHandleForCategory();
                  v71 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
                    sub_1D166BAC0();

                  v72 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v73 = (void *)objc_msgSend(v72, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D35A00], 9, 0);
                  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithError:", v73);

                  goto LABEL_102;
                }
              }
              v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v102, v107, 16);
              if (v57)
                continue;
              break;
            }
          }

        }
        v51 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v100 = 0u;
        v101 = 0u;
        v98 = 0u;
        v99 = 0u;
        v60 = v86;
        v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v98, v106, 16);
        if (v61)
        {
          v62 = *(_QWORD *)v99;
          do
          {
            for (j = 0; j != v61; ++j)
            {
              if (*(_QWORD *)v99 != v62)
                objc_enumerationMutation(v60);
              v64 = *(_QWORD *)(*((_QWORD *)&v98 + 1) + 8 * j);
              v97 = 0;
              -[IMEditMessageCommandProcessingPipelineComponent _applyEditsToMessage:preEditFullMessageText:editType:editedPartIndex:editedMessagePartText:shouldRetractSubject:editTimestamp:chat:updatedAssociatedMessageItems:](self, "_applyEditsToMessage:preEditFullMessageText:editType:editedPartIndex:editedMessagePartText:shouldRetractSubject:editTimestamp:chat:updatedAssociatedMessageItems:", v94, v93, v22, v88, v90, v87, v89, v64, &v97);
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              v66 = v97;
              if (v65)
                objc_msgSend(v51, "addObject:", v65);
              if (objc_msgSend(v66, "count"))
                objc_msgSend(v51, "addObjectsFromArray:", v66);

            }
            v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v98, v106, 16);
          }
          while (v61);
        }

        if (IMOSLoggingEnabled(v67))
        {
          OSLogHandleForIMFoundationCategory();
          v68 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v109 = (uint64_t)v95;
            _os_log_impl(&dword_1D1413000, v68, OS_LOG_TYPE_INFO, "Successfully edited message with GUID=%@", buf, 0xCu);
          }

        }
        objc_msgSend(v60, "firstObject");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "setChat:", v69);

        v70 = (void *)objc_msgSend(v51, "copy");
        objc_msgSend(v96, "setMessageItems:", v70);

        v52 = objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithValue:", v96);
        goto LABEL_101;
      }
      IMLogHandleForCategory();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        sub_1D166BA94();
    }

    v75 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v51 = (id)objc_msgSend(v75, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D35A00], 9, 0);
    v52 = objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithError:", v51);
LABEL_101:
    v7 = (void *)v52;
LABEL_102:

    goto LABEL_103;
  }
  IMLogHandleForCategory();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    sub_1D166B91C();

  v27 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v28 = (void *)objc_msgSend(v27, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D35A00], 3, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithError:", v28);

LABEL_107:
  return v7;
}

- (id)_applyEditsToMessage:(id)a3 preEditFullMessageText:(id)a4 editType:(unint64_t)a5 editedPartIndex:(int64_t)a6 editedMessagePartText:(id)a7 shouldRetractSubject:(BOOL)a8 editTimestamp:(id)a9 chat:(id)a10 updatedAssociatedMessageItems:(id *)a11
{
  _BOOL4 v11;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  id v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  uint64_t v41;

  v11 = a8;
  v41 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v36 = a4;
  v34 = a7;
  v37 = a9;
  v17 = a10;
  objc_msgSend(v16, "guid");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled(v35))
  {
    OSLogHandleForIMFoundationCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v40 = v35;
      _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "Applying edits to the content of message: %@", buf, 0xCu);
    }

  }
  v19 = (void *)objc_msgSend(v16, "copyWithFlags:", objc_msgSend(v16, "flags"));
  objc_msgSend(v19, "_setMessageID:", objc_msgSend(v16, "messageID"));
  if (!a5)
  {
    IMLogHandleForCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_1D166BB68();

LABEL_12:
    v20 = 0;
    goto LABEL_18;
  }
  if (a5 != 2)
  {
    if (a5 == 1)
    {
      objc_msgSend(v36, "__im_messageTextByReplacingMessagePartIndex:withNewPartText:", a6, v34);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addEditedPartIndex:", a6);
      goto LABEL_18;
    }
    goto LABEL_12;
  }
  objc_msgSend(v36, "__im_messageTextByRemovingMessagePartIndex:", a6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addRetractedPartIndex:", a6);
  if (v11)
    objc_msgSend(v19, "setSubject:", 0);
  objc_msgSend(v36, "__im_messagePartMatchingPartIndex:", a6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "transferGUID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v23, "length"))
  {
    objc_msgSend(v16, "fileTransferGUIDs");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v24, "mutableCopy");

    objc_msgSend(v25, "removeObject:", v23);
    v26 = (void *)objc_msgSend(v25, "copy");
    objc_msgSend(v19, "setFileTransferGUIDs:", v26);

  }
LABEL_18:
  objc_msgSend(v19, "setBody:", v20);
  objc_msgSend(v19, "setPlainBody:", 0);
  objc_msgSend(v19, "setDateEdited:", v37);
  -[IMEditMessageCommandProcessingPipelineComponent pipelineResources](self, "pipelineResources");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "messageStore");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = 0;
  objc_msgSend(v28, "storeEditedMessage:editedPartIndex:editType:previousMessage:chat:updatedAssociatedMessageItems:", v19, a6, a5, v16, v17, &v38);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v38;
  v31 = v30;
  if (a11)
    *a11 = objc_retainAutorelease(v30);

  return v29;
}

- (id)_adaptiveImageGlyphFileTransferGUIDsInMessageItem:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  +[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileTransferGUIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v5, "transferForGUID:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "isAdaptiveImageGlyph"))
          objc_msgSend(v4, "addObject:", v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }
  v13 = (void *)objc_msgSend(v4, "copy");

  return v13;
}

- (double)_timeoutIntervalForEditType:(unint64_t)a3 enforceExactRetractionTimeoutInterval:(BOOL)a4
{
  double result;

  if (a3 == 2)
  {
    MEMORY[0x1E0DE7D20](self, sel__messageRetractionReceivedTimeoutEnforcingExactTimeoutInterval_);
  }
  else if (a3 == 1)
  {
    MEMORY[0x1E0DE7D20](self, sel__messageEditReceivedTimeout);
  }
  else
  {
    return 0.0;
  }
  return result;
}

- (double)_messageEditReceivedTimeout
{
  void *v2;
  void *v3;
  double v4;
  uint64_t v5;
  double v6;
  double v7;
  NSObject *v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("message-edit-received-timeout"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0D38240];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (v5 = objc_msgSend(v3, "doubleValue"), v6 > 0.0))
  {
    v7 = v6;
    if (IMOSLoggingEnabled(v5))
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v10 = 134218240;
        v11 = (uint64_t)v7;
        v12 = 2048;
        v13 = (uint64_t)v4;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Server bag overide for message edit received timeout. Server: %ld Default: %ld", (uint8_t *)&v10, 0x16u);
      }

    }
  }
  else
  {
    v7 = v4;
  }

  return v7;
}

- (int64_t)_messageEditHistoryLimit
{
  void *v2;
  void *v3;
  int64_t v4;
  uint64_t v5;
  int64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("message-edit-history-limit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0D38238];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (v5 = objc_msgSend(v3, "integerValue"), v5 >= 1))
  {
    v6 = v5;
    if (IMOSLoggingEnabled(v5))
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138412546;
        v12 = v8;
        v13 = 2112;
        v14 = v9;
        _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Server bag override for message edit history limit. Server: %@ Default: %@", (uint8_t *)&v11, 0x16u);

      }
    }
  }
  else
  {
    v6 = v4;
  }

  return v6;
}

- (double)_messageRetractionReceivedTimeoutEnforcingExactTimeoutInterval:(BOOL)a3
{
  double *v3;
  void *v4;
  void *v5;
  double v6;
  uint64_t v7;
  double v8;
  double v9;
  NSObject *v10;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a3)
    v3 = (double *)MEMORY[0x1E0D38300];
  else
    v3 = (double *)MEMORY[0x1E0D382F8];
  objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("message-retraction-received-timeout"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *v3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (v7 = objc_msgSend(v5, "doubleValue"), v8 > 0.0))
  {
    v9 = v8;
    if (IMOSLoggingEnabled(v7))
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v12 = 134218240;
        v13 = (uint64_t)v9;
        v14 = 2048;
        v15 = (uint64_t)v6;
        _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Server bag overide for message retraction received timeout. Server: %ld Default: %ld", (uint8_t *)&v12, 0x16u);
      }

    }
  }
  else
  {
    v9 = v6;
  }

  return v9;
}

- (IMDiMessagePipelineResources)pipelineResources
{
  return self->_pipelineResources;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipelineResources, 0);
}

@end
