@implementation IMChatRegistry

- (id)existingChatWithGUID:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  IMChatRegistry *v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1A1FF7A48;
    v11[3] = &unk_1E471F8A8;
    v11[4] = self;
    v12 = v4;
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = sub_1A2071B64;
    v8[3] = &unk_1E471F8F8;
    v9 = v12;
    v10 = self;
    -[IMChatRegistry _performSingleChatCacheLookupWithBlock:cacheMissQueryKey:queryBlock:](self, "_performSingleChatCacheLookupWithBlock:cacheMissQueryKey:queryBlock:", v11, CFSTR("ChatCache-LoadWithGUID"), v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_performSingleChatCacheLookupWithBlock:(id)a3 cacheMissQueryKey:(id)a4 queryBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v8 = a3;
  v18 = a5;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_1A1FF78FC;
  v19[3] = &unk_1E471FAD0;
  v20 = v8;
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = sub_1A2075284;
  v17 = &unk_1E471FAF8;
  v9 = v18;
  v10 = v8;
  -[IMChatRegistry _performChatCacheLookupWithBlock:cacheMissQueryKey:queryBlock:](self, "_performChatCacheLookupWithBlock:cacheMissQueryKey:queryBlock:", v19, a4, &v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject", v14, v15, v16, v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_performChatCacheLookupWithBlock:(id)a3 cacheMissQueryKey:(id)a4 queryBlock:(id)a5
{
  void (**v8)(id, _BYTE *);
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  void *v16;
  _BOOL4 v17;
  NSObject *v18;
  void *v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  _QWORD v30[4];
  id v31;
  IMChatRegistry *v32;
  void (**v33)(id, _BYTE *);
  __int128 *v34;
  _QWORD v35[5];
  id v36;
  id v37;
  char v38;
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  __int128 v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(id, _BYTE *))a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v8 && v10)
  {
    v38 = 0;
    *(_QWORD *)&v43 = 0;
    *((_QWORD *)&v43 + 1) = &v43;
    v44 = 0x3032000000;
    v45 = sub_1A200ADA4;
    v46 = sub_1A200AC44;
    v47 = 0;
    v8[2](v8, &v38);
    v47 = (id)objc_claimAutoreleasedReturnValue();
    if (-[IMChatRegistry processingChatCacheMiss](self, "processingChatCacheMiss"))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          v13 = objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 40), "count");
          *(_DWORD *)buf = 134217984;
          v40 = v13;
          _os_log_impl(&dword_1A1FF4000, v12, OS_LOG_TYPE_INFO, "Attempting a nested chat cache lookup, returning early with %llu cache results only", buf, 0xCu);
        }

      }
    }
    else
    {
      -[IMChatRegistry daemonController](self, "daemonController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (objc_msgSend(v16, "processCapabilities") & 4) == 0;

      if (v17)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            -[IMChatRegistry daemonController](self, "daemonController");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "processCapabilities");
            IMStringFromClientCapabilities();
            v20 = (id)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 40), "count");
            *(_DWORD *)buf = 138412546;
            v40 = (uint64_t)v20;
            v41 = 2048;
            v42 = v21;
            _os_log_impl(&dword_1A1FF4000, v18, OS_LOG_TYPE_INFO, "Attempting a chat cache lookup without chats capability (has %@), returning early with %llu cache results only", buf, 0x16u);

          }
        }
      }
      else if (v38)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v40 = (uint64_t)v9;
            _os_log_impl(&dword_1A1FF4000, v22, OS_LOG_TYPE_INFO, "Chat cache miss for key %@", buf, 0xCu);
          }

        }
        v23 = (void *)MEMORY[0x1E0C99E60];
        objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 40), "__imArrayByApplyingBlock:", &unk_1E471FB38);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setWithArray:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        -[IMChatRegistry daemonQueryController](self, "daemonQueryController");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = MEMORY[0x1E0C809B0];
        v35[0] = MEMORY[0x1E0C809B0];
        v35[1] = 3221225472;
        v35[2] = sub_1A2075298;
        v35[3] = &unk_1E471FB60;
        v35[4] = self;
        v37 = v11;
        v28 = v25;
        v36 = v28;
        v30[0] = v27;
        v30[1] = 3221225472;
        v30[2] = sub_1A2075358;
        v30[3] = &unk_1E471FB88;
        v34 = &v43;
        v33 = v8;
        v31 = v9;
        v32 = self;
        objc_msgSend(v26, "performQueryWithKey:expectsSynchronousResult:block:completionHandler:", v31, 1, v35, v30);

      }
    }
    v15 = *(id *)(*((_QWORD *)&v43 + 1) + 40);
    _Block_object_dispose(&v43, 8);

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        LODWORD(v43) = 136315138;
        *(_QWORD *)((char *)&v43 + 4) = "-[IMChatRegistry(Queries_Internal) _performChatCacheLookupWithBlock:cacheMissQue"
                                        "ryKey:queryBlock:]";
        _os_log_impl(&dword_1A1FF4000, v14, OS_LOG_TYPE_INFO, "Sent nil block to %s", (uint8_t *)&v43, 0xCu);
      }

    }
    v15 = (id)MEMORY[0x1E0C9AA60];
  }

  return v15;
}

- (BOOL)processingChatCacheMiss
{
  return self->_processingChatCacheMiss;
}

- (IMDaemonController)daemonController
{
  return +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
}

- (id)_cachedGroupChatForGroupChatDictionary:(id)a3 participants:(id)a4 participantHash:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  int v27;
  void *v28;
  int v29;
  void *v30;
  int v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  const __CFString *v36;
  const __CFString *v37;
  const __CFString *v38;
  void *v39;
  int v40;
  BOOL v41;
  id v42;
  BOOL v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  void *v55;
  NSObject *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t j;
  void *v61;
  void *v62;
  _BOOL4 v63;
  NSObject *v64;
  id v65;
  void *v66;
  NSObject *v67;
  void *v68;
  void *v69;
  void *v70;
  __CFString *v71;
  NSObject *v72;
  void *v73;
  NSObject *v74;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  __CFString *v81;
  id v82;
  void *v83;
  void *v84;
  uint64_t v85;
  id v86;
  void *v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _BYTE v97[128];
  uint8_t v98[128];
  uint8_t buf[4];
  uint64_t v100;
  __int16 v101;
  uint64_t v102;
  __int16 v103;
  const __CFString *v104;
  __int16 v105;
  uint64_t v106;
  __int16 v107;
  uint64_t v108;
  uint64_t v109;

  v109 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v82 = a4;
  v86 = a5;
  v88 = v7;
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D37730]);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a4) = objc_msgSend(v8, "isTranscriptSharingEnabled");

  if (!(_DWORD)a4 || (objc_msgSend(v84, "hasPrefix:", *MEMORY[0x1E0D394C8]) & 1) == 0)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D37878]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    HIDWORD(v76) = objc_msgSend(v10, "intValue");

    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D37780]);
    v81 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D37760]);
    v85 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D37830]);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D37858]);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D37718]);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accountForUniqueID:", v79);
    v83 = (void *)objc_claimAutoreleasedReturnValue();

    -[IMChatRegistry _cachedChatWithGroupID:](self, "_cachedChatWithGroupID:", v81);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v76) = v12 != 0;
    if (v12)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v12, "guid");
          v14 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "displayName");
          v15 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "personCentricID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413314;
          v100 = (uint64_t)v14;
          v101 = 2112;
          v102 = (uint64_t)v81;
          v103 = 2112;
          v104 = v15;
          v105 = 2112;
          v106 = v85;
          v107 = 2112;
          v108 = (uint64_t)v16;
          _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "Found existing candidate chat guid: %@ with groupID: %@ ec displayName %@ displayName %@ existing pcmid %@", buf, 0x34u);

        }
      }
      objc_msgSend(v12, "participants", v76);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMChatRegistry _sortedParticipantIDHashForParticipants:](self, "_sortedParticipantIDHashForParticipants:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = objc_msgSend(v86, "isEqualToString:", v18);
      objc_msgSend(v12, "displayName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if ((void *)v85 == v20)
      {
        v22 = 1;
      }
      else
      {
        objc_msgSend(v12, "displayName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend((id)v85, "isEqualToString:", v21);

      }
      objc_msgSend(v12, "personCentricID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v80 == v23)
      {
        v25 = 1;
      }
      else
      {
        objc_msgSend(v12, "personCentricID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v80, "isEqualToString:", v24);

      }
      objc_msgSend(v12, "chatIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v84, "isEqualToString:", v26);

      objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "isPriusEnabled");

      if (v29)
      {
        objc_msgSend(v83, "service");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "groupsMergeDisplayNames");

        v22 |= v31;
      }
      if ((v19 & (v22 & v25 | v27)) == 1)
      {
        v9 = v12;
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v12, "guid");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("guid"));
            v34 = objc_claimAutoreleasedReturnValue();
            v35 = (void *)v34;
            v36 = CFSTR("NO");
            *(_DWORD *)buf = 138413314;
            v100 = (uint64_t)v33;
            if (v25)
              v37 = CFSTR("YES");
            else
              v37 = CFSTR("NO");
            if (v22)
              v38 = CFSTR("YES");
            else
              v38 = CFSTR("NO");
            v101 = 2112;
            if (v19)
              v36 = CFSTR("YES");
            v102 = (uint64_t)v36;
            v103 = 2112;
            v104 = v38;
            v105 = 2112;
            v106 = (uint64_t)v37;
            v107 = 2112;
            v108 = v34;
            _os_log_impl(&dword_1A1FF4000, v32, OS_LOG_TYPE_INFO, "Found candidate chat %@ but rejected matchingParticipantHash: %@ matchingDisplayName: %@ matchingPersonCentricID: %@ dictionary guid: %@", buf, 0x34u);

          }
        }
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags", v76);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "isPriusEnabled");

    if (v40)
    {
      if (v9)
      {
        v41 = v85 == 0;
        if (!v12)
          goto LABEL_103;
        goto LABEL_80;
      }
      objc_msgSend(v83, "service");
      v42 = (id)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v42, "groupsMergeDisplayNames"))
      {
        v9 = 0;
LABEL_54:

        goto LABEL_55;
      }
      v43 = objc_msgSend((id)v85, "length") == 0;

      if (!v43)
      {
        -[IMChatRegistry _cachedChatsWithDisplayName:](self, "_cachedChatsWithDisplayName:", v85);
        v95 = 0u;
        v96 = 0u;
        v93 = 0u;
        v94 = 0u;
        v42 = (id)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v93, v98, 16);
        if (v44)
        {
          v45 = *(_QWORD *)v94;
          while (2)
          {
            for (i = 0; i != v44; ++i)
            {
              if (*(_QWORD *)v94 != v45)
                objc_enumerationMutation(v42);
              v47 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * i);
              objc_msgSend(v47, "participants");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              -[IMChatRegistry _sortedParticipantIDHashForParticipants:](self, "_sortedParticipantIDHashForParticipants:", v48);
              v49 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v47, "account");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "serviceName");
              v51 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v86, "isEqualToString:", v49))
              {
                objc_msgSend(v83, "serviceName");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                v53 = objc_msgSend(v51, "isEqualToString:", v52);

                if (v53)
                {
                  v9 = v47;

                  goto LABEL_53;
                }
              }

            }
            v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v93, v98, 16);
            if (v44)
              continue;
            break;
          }
        }
        v9 = 0;
LABEL_53:

        goto LABEL_54;
      }
      v9 = 0;
    }
LABEL_55:
    v41 = v85 == 0;
    if (v9 | v85 || !objc_msgSend(v82, "count"))
    {
      if (!v12)
        goto LABEL_86;
    }
    else
    {
      -[IMChatRegistry groupParticipantToChatsMap](self, "groupParticipantToChatsMap");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "objectForKeyedSubscript:", v86);
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v55, "count"))
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v100 = (uint64_t)v82;
            _os_log_impl(&dword_1A1FF4000, v56, OS_LOG_TYPE_INFO, "Existing chats for unnamed group with same participants, participants to match %@", buf, 0xCu);
          }

        }
        LODWORD(v77) = 1;
      }
      v91 = 0u;
      v92 = 0u;
      v89 = 0u;
      v90 = 0u;
      v57 = v55;
      v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v89, v97, 16);
      if (v58)
      {
        v59 = *(_QWORD *)v90;
        while (2)
        {
          for (j = 0; j != v58; ++j)
          {
            if (*(_QWORD *)v90 != v59)
              objc_enumerationMutation(v57);
            v61 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * j);
            objc_msgSend(v61, "displayName", v77);
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            v63 = v62 == 0;

            if (v63)
            {
              if (IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v64 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
                {
                  objc_msgSend(v61, "participants");
                  v65 = (id)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v61, "personCentricID");
                  v66 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v100 = (uint64_t)v65;
                  v101 = 2112;
                  v102 = (uint64_t)v66;
                  _os_log_impl(&dword_1A1FF4000, v64, OS_LOG_TYPE_INFO, "Matched chat with participants %@ pcmid %@", buf, 0x16u);

                }
              }
              v9 = v61;
              goto LABEL_79;
            }
          }
          v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v89, v97, 16);
          if (v58)
            continue;
          break;
        }
      }
      v9 = 0;
LABEL_79:

      v41 = 1;
      if ((v77 & 1) == 0)
      {
LABEL_86:
        if (v9)
        {
LABEL_103:

          goto LABEL_104;
        }
        objc_msgSend(v83, "serviceName");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = (__CFString *)IMCopyGUIDForChat();
        if (IMAdditionalChatRegistryLoggingEnabled() && IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v72 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412802;
            v100 = (uint64_t)v70;
            v101 = 2112;
            v102 = (uint64_t)v78;
            v103 = 2112;
            v104 = v71;
            _os_log_impl(&dword_1A1FF4000, v72, OS_LOG_TYPE_INFO, "Looking up chat based on service name [%@] and roomName [%@] [%@]", buf, 0x20u);
          }

        }
        -[IMChatRegistry _cachedChatWithGUID:](self, "_cachedChatWithGUID:", v71, v77);
        v9 = objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v73 = v71;
          if (v41)
            goto LABEL_102;
        }
        else
        {
          objc_msgSend(v70, "isEqualToString:", *MEMORY[0x1E0D38F58]);
          v73 = (void *)IMCopyGUIDForChat();

          -[IMChatRegistry _cachedChatWithGUID:](self, "_cachedChatWithGUID:", v73);
          v9 = objc_claimAutoreleasedReturnValue();
          if (v41)
          {
LABEL_102:

            goto LABEL_103;
          }
        }
        if (IMAdditionalChatRegistryLoggingEnabled() && IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v74 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v100 = v85;
            _os_log_impl(&dword_1A1FF4000, v74, OS_LOG_TYPE_INFO, "Updating chat's display name:%@", buf, 0xCu);
          }

        }
        objc_msgSend((id)v9, "_updateDisplayName:", v85);
        goto LABEL_102;
      }
    }
LABEL_80:
    if (((unint64_t)objc_msgSend(v82, "count", v77) > 1 || BYTE4(v77) == 43)
      && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v67 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
      {
        objc_msgSend((id)v9, "guid");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "arrayByApplyingSelector:", &sel_ID);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413314;
        v100 = (uint64_t)v68;
        v101 = 2112;
        v102 = v85;
        v103 = 2112;
        v104 = v81;
        v105 = 2112;
        v106 = (uint64_t)v80;
        v107 = 2112;
        v108 = (uint64_t)v69;
        _os_log_impl(&dword_1A1FF4000, v67, OS_LOG_TYPE_INFO, " ==>  chatForChatDictionary info for chat we matched guid %@ displayName %@ groupID: %@ pcmid %@ participants %@", buf, 0x34u);

      }
    }
    goto LABEL_86;
  }
  v9 = 0;
LABEL_104:

  return (id)v9;
}

- (id)_cachedChatWithGroupID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[IMChatRegistry groupIDToChatMap](self, "groupIDToChatMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSMutableDictionary)groupParticipantToChatsMap
{
  return self->_groupParticipantToChatsMap;
}

- (id)_copyMergedChatsPairedArrayFromMergedChatsArray:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  id v17;
  void *v19;
  uint8_t buf[16];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 10);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = v3;
  v6 = 0;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v22;
    v9 = *MEMORY[0x1E0D37830];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v11, "objectForKey:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v6, "isEqualToString:", v12) & 1) == 0)
        {
          if (objc_msgSend(v4, "count") && objc_msgSend(v6, "length"))
          {
            objc_msgSend(MEMORY[0x1E0D36A98], "pairWithFirst:second:", v4, v6);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "addObject:", v13);

            v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 10);
          }
          v14 = v12;

          v6 = v14;
        }
        objc_msgSend(v4, "addObject:", v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v4, "count") && objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x1E0D36A98], "pairWithFirst:second:", v4, v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v15);

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v16, OS_LOG_TYPE_INFO, "Completed re-constructing merged chat paired array", buf, 2u);
    }

  }
  v17 = v19;

  return v17;
}

- (id)_cachedOneToOneChatForChatDictionary:(id)a3 participants:(id)a4 participantHash:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  int v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D37830]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count") == 1)
  {
    objc_msgSend(v9, "lastObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMChatRegistry _cachedChatWithHandle:](self, "_cachedChatWithHandle:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13
      || (-[IMChatRegistry _cachedChatWithPersonID:](self, "_cachedChatWithPersonID:", v11),
          (v13 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      if (objc_msgSend(v13, "chatStyle") != 45)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            v17 = 138413058;
            v18 = v12;
            v19 = 2112;
            v20 = v11;
            v21 = 2112;
            v22 = v13;
            v23 = 2112;
            v24 = v8;
            _os_log_impl(&dword_1A1FF4000, v14, OS_LOG_TYPE_INFO, "Found chat with handle %@ (pcID: %@) but rejecting as style is not instant message style, chat: %@ dictionary: %@", (uint8_t *)&v17, 0x2Au);
          }

        }
        v13 = 0;
      }
    }

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v17 = 138412546;
        v18 = v9;
        v19 = 2112;
        v20 = v8;
        _os_log_impl(&dword_1A1FF4000, v15, OS_LOG_TYPE_INFO, "Chat has 1-1 chat style but incorrect count of participants: %@ dictionary: %@", (uint8_t *)&v17, 0x16u);
      }

    }
    v13 = 0;
  }

  return v13;
}

- (id)_cachedChatWithHandle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "ID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMChatRegistry _cachedChatWithIdentifier:style:](self, "_cachedChatWithIdentifier:style:", v5, 45);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(v4, "ID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMChatRegistry _cachedChatWithPersonID:](self, "_cachedChatWithPersonID:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "chatStyle") == 45)
    {
      objc_msgSend(v6, "setRecipient:", v4);
    }
    else
    {

      v6 = 0;
    }
  }

  return v6;
}

- (id)_cachedChatWithIdentifier:(id)a3 style:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  id v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a4;
  v6 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = sub_1A200AEB4;
  v14 = sub_1A200ACCC;
  v15 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1A2121798;
  v9[3] = &unk_1E47228D0;
  v9[4] = self;
  v9[5] = &v10;
  -[IMChatRegistry _enumerateChatGUIDPermutationsForChatIdentifier:styles:usingBlock:](self, "_enumerateChatGUIDPermutationsForChatIdentifier:styles:usingBlock:", v6, v4, v9);
  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (id)_sortedParticipantIDHashForParticipants:(id)a3 usesPersonCentricID:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  _BOOL4 v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v4 = a4;
  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (IMAdditionalChatRegistryLoggingEnabled() && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v5;
      _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "Incoming list of participants to get sorted and hashed: %@", buf, 0xCu);
    }

  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v12, "personCentricID", (_QWORD)v21);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "length"))
          v14 = v4;
        else
          v14 = 0;

        if (v14)
        {
          objc_msgSend(v12, "personCentricID");
          v15 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v12, "ID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16 == 0;

          if (v17)
            continue;
          objc_msgSend(v12, "ID");
          v15 = objc_claimAutoreleasedReturnValue();
        }
        v18 = (void *)v15;
        objc_msgSend(v7, "addObject:", v15);

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v9);
  }

  IMSHA1HashFromStrings();
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)_cachedChatWithGUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[IMChatRegistry simulatedChats](self, "simulatedChats");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      -[IMChatRegistry simulatedChatGUIDToChatMap](self, "simulatedChatGUIDToChatMap");
    else
      -[IMChatRegistry chatGUIDToChatMap](self, "chatGUIDToChatMap");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSArray)simulatedChats
{
  return self->_simulatedChats;
}

- (NSMutableDictionary)chatGUIDToChatMap
{
  return self->_chatGUIDToChatMap;
}

+ (IMChatRegistry)sharedRegistry
{
  if (qword_1ECF123C8 != -1)
    dispatch_once(&qword_1ECF123C8, &unk_1E471C1B0);
  return (IMChatRegistry *)(id)qword_1ECF123D0;
}

- (void)updateChatDictionaryArray:(id)a3 createdChat:(id)a4 joinstate:(int64_t)a5 setHasCommunicatedOveriMessage:(BOOL *)a6
{
  _UNKNOWN **v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _UNKNOWN **v20;
  void *v21;
  BOOL v22;
  void *v23;
  char v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v30;
  id v31;

  v31 = a3;
  v30 = a4;
  if ((unint64_t)objc_msgSend(v31, "count") >= 2)
  {
    v28 = *MEMORY[0x1E0D37778];
    v27 = *MEMORY[0x1E0D377C8];
    v26 = *MEMORY[0x1E0D377B8];
    v8 = &off_1E471A000;
    v9 = 1;
    do
    {
      objc_msgSend(v31, "objectAtIndex:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", v28);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", v27);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "intValue");

      -[IMChatRegistry _registerChatDictionary:forChat:isIncoming:newGUID:shouldPostNotification:](self, "_registerChatDictionary:forChat:isIncoming:newGUID:shouldPostNotification:", v10, v30, 0, v11, 0);
      -[IMChatRegistry _updateInfo:forGUID:updatingUnreadCount:shouldPostNotifications:](self, "_updateInfo:forGUID:updatingUnreadCount:shouldPostNotifications:", v10, v11, 1, 0);
      objc_msgSend(v10, "objectForKeyedSubscript:", v26);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "longLongValue");

      if (!v15)
        objc_msgSend(v30, "setIsFiltered:", 0);
      objc_msgSend(v10, "objectForKey:", CFSTR("lastMessage"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKey:", CFSTR("service"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8[279], "serviceWithInternalName:", v17);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)v18;
      if (!*a6)
      {
        if (v18)
        {
          objc_msgSend(v8[279], "iMessageService");
          v20 = v8;
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          v22 = v19 == v21;
          v8 = v20;
          if (v22)
          {
            +[IMChatRegistry sharedRegistry](IMChatRegistry, "sharedRegistry");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "_setChatHasCommunicatedOveriMessage:", v30);

            v8 = v20;
            *a6 = 1;
          }
        }
      }
      if (objc_msgSend(v19, "supportsMutatingGroupMembers"))
      {
        v24 = objc_msgSend(v19, "isDiscontinued");
        if (a5 == 3 && (v24 & 1) == 0)
          objc_msgSend(v30, "_setJoinState:", v13);
      }

      ++v9;
    }
    while (v9 < objc_msgSend(v31, "count"));
  }

}

- (int64_t)_winningJoinStateForExistingChat:(id)a3 incomingDictionary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int64_t v8;
  uint64_t v9;
  int64_t v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  id v15;
  void *v16;
  int v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  int64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  int64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "valueForKey:", *MEMORY[0x1E0D377C8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (int)objc_msgSend(v7, "intValue");

  v9 = objc_msgSend(v5, "joinState");
  if (v9 == v8)
  {
    v10 = v8;
  }
  else
  {
    v10 = v9;
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D37870]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMServiceImpl serviceWithInternalName:](IMServiceImpl, "serviceWithInternalName:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "supportsMutatingGroupMembers");

    if ((v13 & 1) != 0)
    {
      v10 = v8;
    }
    else
    {
      objc_msgSend(v5, "guid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      IMComponentsFromChatGUID();
      v15 = 0;

      +[IMServiceImpl serviceWithInternalName:](IMServiceImpl, "serviceWithInternalName:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "supportsMutatingGroupMembers");

      if (v17)
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D37778]);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v5, "guid");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            v23 = v20;
            v24 = 2048;
            v25 = v10;
            v26 = 2112;
            v27 = v18;
            v28 = 2048;
            v29 = v8;
            _os_log_impl(&dword_1A1FF4000, v19, OS_LOG_TYPE_INFO, "Join state inconsistency detected. Existing chat %@ join state %lu incoming chat %@ join state %lu", buf, 0x2Au);

          }
        }

      }
      else
      {
        v10 = v8;
      }

    }
  }

  return v10;
}

- (void)_updateUnreadCountForChat:(id)a3
{
  -[IMChatRegistry _updateUnreadCountForChat:shouldPostNotification:](self, "_updateUnreadCountForChat:shouldPostNotification:", a3, 1);
}

- (void)_updateInfo:(id)a3 forGUID:(id)a4 updatingUnreadCount:(BOOL)a5 shouldPostNotifications:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL4 v7;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v6 = a6;
  v7 = a5;
  v15 = a3;
  v10 = a4;
  if (v10)
  {
    if (v15)
    {
      -[IMChatRegistry chatGUIDToInfoMap](self, "chatGUIDToInfoMap");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v15, v10);

    }
    -[IMChatRegistry _cachedChatWithGUID:](self, "_cachedChatWithGUID:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      if (v7)
        -[IMChatRegistry _updateUnreadCountForChat:shouldPostNotification:](self, "_updateUnreadCountForChat:shouldPostNotification:", v12, v6);
      objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D37810]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMChatRegistry _updateChat:originalGroupID:shouldPostNotification:](self, "_updateChat:originalGroupID:shouldPostNotification:", v12, v13, v6);

      objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D37780]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMChatRegistry _updateChat:groupID:shouldPostNotification:](self, "_updateChat:groupID:shouldPostNotification:", v12, v14, v6);

      -[IMChatRegistry _updateChatAutoDonationBehavior:withInfo:shouldPostNotification:](self, "_updateChatAutoDonationBehavior:withInfo:shouldPostNotification:", v12, v15, v6);
      -[IMChatRegistry _updateReplySuggestions:withInfo:](self, "_updateReplySuggestions:withInfo:", v12, v15);
      -[IMChatRegistry _updatePendingIncomingSatelliteMessageCount:shouldPostNotification:](self, "_updatePendingIncomingSatelliteMessageCount:shouldPostNotification:", v12, v6);
      -[IMChatRegistry _updateIsDownloadingPendingSatelliteMessages:shouldPostNotification:](self, "_updateIsDownloadingPendingSatelliteMessages:shouldPostNotification:", v12, v6);
      -[IMChatRegistry _updateHasCancellableScheduledMessage:shouldPostNotification:](self, "_updateHasCancellableScheduledMessage:shouldPostNotification:", v12, v6);
    }

  }
}

- (void)_updateUnreadCountForChat:(id)a3 shouldPostNotification:(BOOL)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  _BOOL4 v20;
  id v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  int v30;
  _BYTE v31[128];
  uint64_t v32;

  v20 = a4;
  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v21 = v5;
    objc_msgSend(v5, "_guids");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v6 = 0;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v24 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          -[IMChatRegistry chatGUIDToInfoMap](self, "chatGUIDToInfoMap");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKey:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "objectForKey:", CFSTR("unreadCount"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "unsignedIntegerValue");

          v15 = IMOSLoggingEnabled();
          if (v14)
          {
            if (v15)
            {
              OSLogHandleForIMFoundationCategory();
              v16 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                v28 = v10;
                v29 = 1024;
                v30 = v14;
                _os_log_impl(&dword_1A1FF4000, v16, OS_LOG_TYPE_INFO, "Chat [%@] info dictionary has [Unread: %d]", buf, 0x12u);
              }

            }
            v6 += v14;
          }
          else if (v15)
          {
            OSLogHandleForIMFoundationCategory();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              v28 = v10;
              v29 = 1024;
              v30 = 0;
              _os_log_impl(&dword_1A1FF4000, v17, OS_LOG_TYPE_DEBUG, "Chat [%@] info dictionary has [Unread: %d]", buf, 0x12u);
            }

          }
        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v7);
    }

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v21, "guid");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v28 = v19;
        v29 = 1024;
        v30 = v6;
        _os_log_impl(&dword_1A1FF4000, v18, OS_LOG_TYPE_DEBUG, "Chat [%@] _setDBUnreadCount to %d", buf, 0x12u);

      }
    }
    objc_msgSend(v21, "_setDBUnreadCount:postNotification:", v6, v20);
    v5 = v21;
  }

}

- (NSMutableDictionary)chatGUIDToInfoMap
{
  return self->_chatGUIDToInfoMap;
}

- (void)_updateChatAutoDonationBehavior:(id)a3 withInfo:(id)a4 shouldPostNotification:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  const __CFString *v26;
  uint64_t v27;

  v5 = a5;
  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = *MEMORY[0x1E0D37728];
  objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0D37728]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v9, "objectForKey:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "integerValue");

    if (-[IMChatRegistry _updateAutoDonationBehavior:forChat:shouldPostNotification:](self, "_updateAutoDonationBehavior:forChat:shouldPostNotification:", v13, v8, v5)&& IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v8, "guid");
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v15;
        v17 = CFSTR("NO");
        v21 = 134218498;
        v22 = v13;
        v23 = 2112;
        if (v5)
          v17 = CFSTR("YES");
        v24 = v15;
        v25 = 2112;
        v26 = v17;
        _os_log_impl(&dword_1A1FF4000, v14, OS_LOG_TYPE_INFO, "Found existing autoDonationBehavior: %ld for chat with GUID: %@ (notify: %@)", (uint8_t *)&v21, 0x20u);

      }
LABEL_15:

    }
  }
  else if (-[IMChatRegistry _updateAutoDonationBehavior:forChat:shouldPostNotification:](self, "_updateAutoDonationBehavior:forChat:shouldPostNotification:", 0, v8, v5)&& IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v8, "guid");
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)v18;
      v20 = CFSTR("NO");
      if (v5)
        v20 = CFSTR("YES");
      v21 = 138412546;
      v22 = v18;
      v23 = 2112;
      v24 = (uint64_t)v20;
      _os_log_impl(&dword_1A1FF4000, v14, OS_LOG_TYPE_INFO, "Using default autoDonationBehavior for chat with GUID: %@ (notify: %@)", (uint8_t *)&v21, 0x16u);

    }
    goto LABEL_15;
  }

}

- (BOOL)_updateAutoDonationBehavior:(int64_t)a3 forChat:(id)a4 shouldPostNotification:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;

  v5 = a5;
  v8 = a4;
  v9 = objc_msgSend(v8, "autoDonationBehavior");
  if (v9 != a3)
  {
    objc_msgSend(v8, "setAutoDonationBehavior:", a3);
    if (v5)
    {
      -[IMChatRegistry sharedWithYouManager](self, "sharedWithYouManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isSharedWithYouEnabled");

      if (v11)
      {
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "__mainThreadPostNotificationName:object:", CFSTR("__kIMChatRegistryChatMarkedForAutoDonatingChangedNotification"), v8);

      }
    }
  }

  return v9 != a3;
}

- (id)_lastMessageItemForChatDictionary:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *IMMessageFromIMMessageItemDictionary;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lastMessage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    IMMessageFromIMMessageItemDictionary = 0;
    goto LABEL_16;
  }
  v6 = v4;
  if (!objc_msgSend(v5, "count"))
  {
    IMMessageFromIMMessageItemDictionary = 0;
    goto LABEL_14;
  }
  objc_msgSend(v5, "objectForKey:", CFSTR("accountID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("account"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("serviceName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (v8)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("accountID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
LABEL_5:
      if (v9)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  objc_msgSend(v6, "objectForKey:", CFSTR("account"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    goto LABEL_12;
LABEL_11:
  objc_msgSend(v6, "objectForKey:", CFSTR("serviceName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v11 = 0;
    goto LABEL_13;
  }
LABEL_12:
  +[IMServiceImpl serviceWithInternalName:](IMServiceImpl, "serviceWithInternalName:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
  +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bestAccountForService:login:guid:", v11, v8, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  IMMessageFromIMMessageItemDictionary = _CreateIMMessageFromIMMessageItemDictionary(v5, v13, 1);
LABEL_14:

  if (IMMessageFromIMMessageItemDictionary)
    -[IMChatRegistry _checkIfItemIsCorrupt:](self, "_checkIfItemIsCorrupt:", IMMessageFromIMMessageItemDictionary);
LABEL_16:

  return IMMessageFromIMMessageItemDictionary;
}

- (void)_checkIfItemIsCorrupt:(id)a3
{
  id v3;
  id v4;
  void *v5;
  NSObject *v6;
  char v7;
  _QWORD v8[4];
  id v9;
  char v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    objc_msgSend(v4, "guid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[IMChat isGUIDInAttemptingListInScrutinyMode:](IMChat, "isGUIDInAttemptingListInScrutinyMode:", v5))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v12 = v5;
          v13 = 2112;
          v14 = v4;
          _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "Found attempted guid %@. Marking message as corrupt %@", buf, 0x16u);
        }

      }
      v7 = objc_msgSend(v4, "isCorrupt");
      objc_msgSend(v4, "setIsCorrupt:", 1);
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = sub_1A213FFD0;
      v8[3] = &unk_1E4722FD0;
      v9 = v5;
      v10 = v7;
      dispatch_async(MEMORY[0x1E0C80D38], v8);

    }
  }

}

- (NSArray)cachedChats
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[IMChatRegistry simulatedChats](self, "simulatedChats");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[IMChatRegistry cachedChatsInThreadNameMap](self, "cachedChatsInThreadNameMap");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v6, "copy");

  }
  return (NSArray *)v5;
}

- (IMContactStore)contactStore
{
  NSObject *contactStoreQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1A200AE74;
  v10 = sub_1A200ACAC;
  v11 = 0;
  contactStoreQueue = self->_contactStoreQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1A1FFE760;
  v5[3] = &unk_1E471F5D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(contactStoreQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (IMContactStore *)v3;
}

- (NSMutableArray)cachedChatsInThreadNameMap
{
  return self->_cachedChatsInThreadNameMap;
}

- (id)_cachedChatForChatDictionary:(id)a3 participants:(id)a4 participantHash:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  _DWORD v20[2];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("style"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "intValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("guid"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMChatRegistry _cachedChatWithGUID:](self, "_cachedChatWithGUID:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    switch(v12)
    {
      case '#':
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            LOWORD(v20[0]) = 0;
            _os_log_impl(&dword_1A1FF4000, v16, OS_LOG_TYPE_INFO, "Room style chats are no longer supported", (uint8_t *)v20, 2u);
          }

        }
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("roomName"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMChatRegistry _cachedChatWithIdentifier:style:](self, "_cachedChatWithIdentifier:style:", v17, 35);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        break;
      case '+':
        -[IMChatRegistry _cachedGroupChatForGroupChatDictionary:participants:participantHash:](self, "_cachedGroupChatForGroupChatDictionary:participants:participantHash:", v8, v9, v10);
        v15 = objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      case '-':
        -[IMChatRegistry _cachedOneToOneChatForChatDictionary:participants:participantHash:](self, "_cachedOneToOneChatForChatDictionary:participants:participantHash:", v8, v9, v10);
        v15 = objc_claimAutoreleasedReturnValue();
LABEL_12:
        v14 = (void *)v15;
        break;
      default:
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            v20[0] = 67109120;
            v20[1] = v12;
            _os_log_impl(&dword_1A1FF4000, v18, OS_LOG_TYPE_INFO, "Unknown chat style %d", (uint8_t *)v20, 8u);
          }

        }
        v14 = 0;
        break;
    }
  }

  return v14;
}

- (void)_verifyChatMergeWithChat:(id)a3 dictionary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  int v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  _BOOL4 v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  const __CFString *v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  _BYTE v44[10];
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5 && v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("style"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "intValue");

    v10 = objc_msgSend(v5, "chatStyle");
    v11 = v10 != v9;
    if (v10 == v9)
    {
      v17 = 0;
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v5, "guid");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v42 = v13;
          v43 = 1024;
          *(_DWORD *)v44 = objc_msgSend(v5, "chatStyle");
          *(_WORD *)&v44[4] = 1024;
          *(_DWORD *)&v44[6] = v9;
          _os_log_impl(&dword_1A1FF4000, v12, OS_LOG_TYPE_INFO, "**WARNING** Incorrectly attempting to register dictionary to chat %@ with style %c (expected %c)", buf, 0x18u);

        }
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v15 = (void *)objc_msgSend(v7, "__im_copyChatDictionaryWithRedactedMessageContent");
          *(_DWORD *)buf = 138412290;
          v42 = v15;
          _os_log_impl(&dword_1A1FF4000, v14, OS_LOG_TYPE_INFO, "Dictionary: %@", buf, 0xCu);

        }
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v42 = v5;
          _os_log_impl(&dword_1A1FF4000, v16, OS_LOG_TYPE_INFO, "Registering with chat: %@", buf, 0xCu);
        }

      }
      v17 = CFSTR("Mismatched chat style");
    }
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("participants"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "participants");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "count");
    LOBYTE(v20) = v20 == objc_msgSend(v18, "count");

    if ((v20 & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v5, "guid");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "participants");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v42 = v22;
          v43 = 2112;
          *(_QWORD *)v44 = v23;
          *(_WORD *)&v44[8] = 2112;
          v45 = v18;
          _os_log_impl(&dword_1A1FF4000, v21, OS_LOG_TYPE_INFO, "**WARNING** Incorrectly attempting to register dictionary to chat %@ with participants %@ (expected %@)", buf, 0x20u);

        }
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          v25 = (void *)objc_msgSend(v7, "__im_copyChatDictionaryWithRedactedMessageContent");
          *(_DWORD *)buf = 138412290;
          v42 = v25;
          _os_log_impl(&dword_1A1FF4000, v24, OS_LOG_TYPE_INFO, "Dictionary: %@", buf, 0xCu);

        }
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v42 = v5;
          _os_log_impl(&dword_1A1FF4000, v26, OS_LOG_TYPE_INFO, "Registering with chat: %@", buf, 0xCu);
        }

      }
      v11 = 1;
      v17 = CFSTR("Mismatched participant count");
    }
    objc_msgSend(v5, "participants");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "count") == 0;

    if (v28)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v5, "guid");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v42 = v30;
          v43 = 2112;
          *(_QWORD *)v44 = v18;
          _os_log_impl(&dword_1A1FF4000, v29, OS_LOG_TYPE_INFO, "**WARNING** Zero participants in chat %@ (dictionary has %@)", buf, 0x16u);

        }
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          v32 = (void *)objc_msgSend(v7, "__im_copyChatDictionaryWithRedactedMessageContent");
          *(_DWORD *)buf = 138412290;
          v42 = v32;
          _os_log_impl(&dword_1A1FF4000, v31, OS_LOG_TYPE_INFO, "Dictionary: %@", buf, 0xCu);

        }
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v42 = v5;
          _os_log_impl(&dword_1A1FF4000, v33, OS_LOG_TYPE_INFO, "Registering with chat: %@", buf, 0xCu);
        }

      }
      v17 = CFSTR("Zero participants");
    }
    else if (!v11)
    {
LABEL_52:

      goto LABEL_53;
    }
    objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)MEMORY[0x1E0CB35C8];
    if (v17)
      v36 = v17;
    else
      v36 = CFSTR("Generic merge error");
    v39 = *MEMORY[0x1E0CB2938];
    v40 = v36;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Messages.IMChatRegistryErrorDomain"), 2, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "forceAutoBugCaptureWithSubType:errorPayload:", CFSTR("Invalid Chat Merge"), v38);

    goto LABEL_52;
  }
LABEL_53:

}

- (id)_participantsForChatDictionary:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v17;
  void *v18;
  id obj;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("accountID"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accountForUniqueID:", v18);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("participants"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
  if (v4)
  {
    v23 = *(_QWORD *)v26;
    v22 = *MEMORY[0x1E0D36D90];
    v21 = *MEMORY[0x1E0D36E10];
    v5 = *MEMORY[0x1E0D36D68];
    v6 = *MEMORY[0x1E0D36DD0];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v26 != v23)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKeyedSubscript:", v22);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v21);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v5);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v6);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "imHandleWithID:alreadyCanonical:", v9, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
        {
          objc_msgSend(v13, "setPersonCentricID:", v12);
          objc_msgSend(v20, "addObject:", v14);
          objc_msgSend(v14, "_setOriginalID:countryCode:updateSiblings:", v10, v11, 1);
        }
        else if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138413058;
            v30 = v9;
            v31 = 2112;
            v32 = v10;
            v33 = 2112;
            v34 = v11;
            v35 = 2112;
            v36 = v12;
            _os_log_impl(&dword_1A1FF4000, v15, OS_LOG_TYPE_INFO, "Failed to find handle for participant id: %@ unformatted: %@ countryCode: %@ personCentricID: %@", buf, 0x2Au);
          }

        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
    }
    while (v4);
  }

  return v20;
}

- (void)_updateReplySuggestions:(id)a3 withInfo:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  int v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  void *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  NSObject *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "lastFinishedMessageItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v7, "isTypingMessage"))
  {
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D37850]);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      if (!IMOSLoggingEnabled())
      {
LABEL_39:

        goto LABEL_40;
      }
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v5, "guid");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138412290;
        v34 = v24;
        _os_log_impl(&dword_1A1FF4000, v10, OS_LOG_TYPE_INFO, "[%@] no smart replies in info dictionary", (uint8_t *)&v33, 0xCu);

      }
LABEL_38:

      goto LABEL_39;
    }
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D37778]);
    v10 = objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v5, "guid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138412546;
        v34 = v12;
        v35 = 2112;
        v36 = (uint64_t)v10;
        _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "[%@] infoGuid = %@", (uint8_t *)&v33, 0x16u);

      }
    }
    objc_msgSend(v5, "guid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", v10);

    if ((v14 & 1) == 0)
    {
      objc_msgSend(v5, "lastFinishedMessage");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15 == 0;

      if (v16)
      {
        if (!IMOSLoggingEnabled())
          goto LABEL_38;
        OSLogHandleForIMFoundationCategory();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v5, "guid");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = 138412546;
          v34 = v25;
          v35 = 2112;
          v36 = (uint64_t)v10;
          _os_log_impl(&dword_1A1FF4000, v19, OS_LOG_TYPE_INFO, "[%@] returning because last finished message is nil, can't get finished message time with info guid = %@", (uint8_t *)&v33, 0x16u);

        }
        goto LABEL_19;
      }
      objc_msgSend(v5, "lastFinishedMessageDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "__im_nanosecondTimeInterval");

      objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D377F0]);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = -[NSObject longLongValue](v19, "longLongValue");
      v21 = IMOSLoggingEnabled();
      if (v20 < v18)
      {
        if (v21)
        {
          OSLogHandleForIMFoundationCategory();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v5, "guid");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = 138413058;
            v34 = v23;
            v35 = 2048;
            v36 = v20;
            v37 = 2048;
            v38 = v18;
            v39 = 2112;
            v40 = v10;
            _os_log_impl(&dword_1A1FF4000, v22, OS_LOG_TYPE_INFO, "[%@] returning, info timestamp = %lld < chat timestamp = %lld, info guid = %@", (uint8_t *)&v33, 0x2Au);

          }
        }
LABEL_19:

        goto LABEL_38;
      }
      if (v21)
      {
        OSLogHandleForIMFoundationCategory();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v5, "guid");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = 138413058;
          v34 = v27;
          v35 = 2048;
          v36 = v20;
          v37 = 2048;
          v38 = v18;
          v39 = 2112;
          v40 = v10;
          _os_log_impl(&dword_1A1FF4000, v26, OS_LOG_TYPE_INFO, "[%@] info timestamp = %lld > chat timestamp = %lld, info guid = %@", (uint8_t *)&v33, 0x2Au);

        }
      }

    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v5, "guid");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "replySuggestions");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "count");
        v32 = -[NSObject count](v8, "count");
        v33 = 138412802;
        v34 = v29;
        v35 = 2048;
        v36 = v31;
        v37 = 2048;
        v38 = v32;
        _os_log_impl(&dword_1A1FF4000, v28, OS_LOG_TYPE_INFO, "[%@] Updating smart replies from %tu to %tu", (uint8_t *)&v33, 0x20u);

      }
    }
    objc_msgSend(v5, "setReplySuggestions:", v8);
    objc_msgSend(v5, "updateReplySuggestions");
    goto LABEL_38;
  }
  objc_msgSend(v5, "setReplySuggestions:", 0);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v5, "guid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138412290;
      v34 = v9;
      _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "[%@] removing replies for typing indicator", (uint8_t *)&v33, 0xCu);

    }
    goto LABEL_39;
  }
LABEL_40:

}

- (void)_noteChatInit:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "_shouldRegisterChat")
    && (-[NSMutableArray containsObjectIdenticalTo:](self->_allChatsInProcess, "containsObjectIdenticalTo:", v4) & 1) == 0)
  {
    -[NSMutableArray addObject:](self->_allChatsInProcess, "addObject:", v4);
  }

}

- (void)_registerChatDictionary:(id)a3 forChat:(id)a4 isIncoming:(BOOL)a5 newGUID:(id)a6 shouldPostNotification:(BOOL)a7
{
  _BOOL4 v7;
  __CFString *v10;
  id v11;
  NSObject *v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  NSMutableDictionary *chatGUIDToChatMap;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  __CFString *v30;
  NSObject *v31;
  id v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  BOOL v37;
  void *v38;
  int v39;
  int v40;
  char v41;
  NSObject *v42;
  __CFString *v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t i;
  void *v52;
  NSObject *v53;
  NSObject *v54;
  NSObject *v55;
  void *v56;
  id v57;
  int v58;
  NSObject *v59;
  __CFString *v60;
  __CFString *v61;
  void *v62;
  __CFString *v63;
  NSObject *v64;
  id v65;
  id v66;
  __CFString *v67;
  NSObject *v68;
  id v69;
  __CFString *v70;
  void *v71;
  int v72;
  NSObject *v73;
  id v74;
  __CFString *v75;
  id v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  BOOL v82;
  _BOOL4 v83;
  __CFString *key;
  _BOOL4 v85;
  void *v86;
  void *v87;
  id v88;
  void *v89;
  void *v90;
  id v92;
  __CFString *v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  uint64_t v98;
  uint8_t v99[128];
  uint8_t buf[4];
  id v101;
  __int16 v102;
  const __CFString *v103;
  __int16 v104;
  const __CFString *v105;
  __int16 v106;
  __CFString *v107;
  __int16 v108;
  id v109;
  uint64_t v110;

  v7 = a7;
  v85 = a5;
  v110 = *MEMORY[0x1E0C80C00];
  v92 = a3;
  v10 = (__CFString *)a4;
  v11 = a6;
  v93 = v10;
  if (!-[__CFString _shouldRegisterChat](v10, "_shouldRegisterChat"))
    goto LABEL_119;
  v83 = v7;
  v89 = v11;
  if (((IMAdditionalChatRegistryLoggingEnabled() & 1) != 0 || !self->_firstLoad) && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = CFSTR("NO");
      *(_DWORD *)buf = 138413058;
      v101 = v11;
      if (v85)
        v14 = CFSTR("YES");
      else
        v14 = CFSTR("NO");
      v103 = v14;
      v102 = 2112;
      if (v83)
        v13 = CFSTR("YES");
      v104 = 2112;
      v105 = v13;
      v106 = 2112;
      v107 = v10;
      _os_log_impl(&dword_1A1FF4000, v12, OS_LOG_TYPE_INFO, "Registering dictionary for with newGUID: %@ isIncoming: %@ shouldPostNotification: %@ chat: %@", buf, 0x2Au);
    }

  }
  -[__CFString account](v10, "account");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "uniqueID");
  v87 = (void *)objc_claimAutoreleasedReturnValue();

  -[__CFString chatIdentifier](v10, "chatIdentifier");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[__CFString chatStyle](v10, "chatStyle");
  if (v89)
  {
    v88 = v89;
  }
  else
  {
    -[__CFString guid](v10, "guid");
    v88 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[__CFString groupID](v10, "groupID");
  key = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v92)
  {
    objc_msgSend(v92, "objectForKey:", CFSTR("accountID"));
    v17 = objc_claimAutoreleasedReturnValue();

    if (!v88)
    {
      objc_msgSend(v92, "objectForKey:", CFSTR("guid"));
      v88 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v92, "objectForKey:", CFSTR("chatIdentifier"));
    v18 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v92, "objectForKey:", CFSTR("style"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v19, "intValue");

    v90 = (void *)v18;
    v87 = (void *)v17;
  }
  -[IMChatRegistry _verifyChatMergeWithChat:dictionary:](self, "_verifyChatMergeWithChat:dictionary:", v10, v92);
  if (v89)
  {
    v98 = 0;
    IMComponentsFromChatGUID();
    v20 = 0;
    if (objc_msgSend(v20, "length"))
    {
      v21 = v20;

      v90 = v21;
    }

  }
  v86 = (void *)IMCopyThreadNameForChat();
  if (v86)
  {
    -[NSMutableDictionary objectForKey:](self->_chatGUIDToChatMap, "objectForKey:", v88);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      chatGUIDToChatMap = self->_chatGUIDToChatMap;
      -[__CFString guid](v10, "guid");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](chatGUIDToChatMap, "objectForKey:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = v25 != 0;

      if (!v22)
        goto LABEL_33;
    }
    else
    {
      v82 = 0;
      if (!v22)
      {
LABEL_33:
        if (v16 == 43)
        {
          if (-[__CFString length](key, "length"))
          {
            -[NSMutableDictionary objectForKey:](self->_groupIDToChatMap, "objectForKey:", key);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = v28 == 0;

            if (v29)
            {
              v30 = v10;
              if (v10)
              {
                CFDictionarySetValue((CFMutableDictionaryRef)self->_groupIDToChatMap, key, v30);
              }
              else
              {
                v31 = MEMORY[0x1E0C81028];
                v32 = MEMORY[0x1E0C81028];
                if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
                  sub_1A2197C84();

              }
            }
          }
        }
        -[__CFString guid](v10, "guid");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v33, "isEqualToString:", v88) & 1) != 0)
        {
          v34 = 0;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v35, "isInternalInstall");

        }
        -[__CFString chatIdentifier](v10, "chatIdentifier");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v36 == 0;

        if (v37)
        {
          v40 = 0;
        }
        else
        {
          -[__CFString chatIdentifier](v10, "chatIdentifier");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v88, "containsString:", v38);

          v40 = v39 ^ 1;
        }
        v41 = v34 ^ 1;
        if (v16 != 43)
          v41 = 1;
        if ((v41 & 1) != 0)
        {
          if (v16 == 45)
            v58 = v34;
          else
            v58 = 0;
          if (v58 == 1 && IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v59 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v92, "objectForKey:", *MEMORY[0x1E0D37830]);
              v60 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
              -[__CFString guid](v10, "guid");
              v61 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
              -[__CFString personCentricID](v10, "personCentricID");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413314;
              v101 = v88;
              v102 = 2112;
              v103 = v60;
              v104 = 2048;
              v105 = v10;
              v106 = 2112;
              v107 = v61;
              v108 = 2112;
              v109 = v62;
              _os_log_impl(&dword_1A1FF4000, v59, OS_LOG_TYPE_INFO, "Registering chat with guid: %@ and personID %@ for chat %p with guid %@ and personID %@", buf, 0x34u);

            }
          }
        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v42 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
            {
              -[__CFString guid](v10, "guid");
              v43 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
              -[__CFString groupID](v10, "groupID");
              v44 = (id)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413314;
              v101 = v88;
              v102 = 2112;
              v103 = key;
              v104 = 2048;
              v105 = v10;
              v106 = 2112;
              v107 = v43;
              v108 = 2112;
              v109 = v44;
              _os_log_impl(&dword_1A1FF4000, v42, OS_LOG_TYPE_INFO, "Registering chat with guid: %@ groupID: %@ for chat %p with guid %@ groupID: %@ ", buf, 0x34u);

            }
          }
          if (v40)
          {
            objc_msgSend(v92, "objectForKey:", CFSTR("participants"));
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v45, "count"));
            v96 = 0u;
            v97 = 0u;
            v94 = 0u;
            v95 = 0u;
            v47 = v45;
            v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v94, v99, 16);
            if (v48)
            {
              v49 = *(_QWORD *)v95;
              v50 = *MEMORY[0x1E0D36D90];
              do
              {
                for (i = 0; i != v48; ++i)
                {
                  if (*(_QWORD *)v95 != v49)
                    objc_enumerationMutation(v47);
                  objc_msgSend(*(id *)(*((_QWORD *)&v94 + 1) + 8 * i), "objectForKey:", v50);
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v52, "length"))
                  {
                    objc_msgSend(v46, "addObject:", v52);
                  }
                  else if (IMOSLoggingEnabled())
                  {
                    OSLogHandleForIMFoundationCategory();
                    v53 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_1A1FF4000, v53, OS_LOG_TYPE_INFO, "Skipping an participant with empty ID!", buf, 2u);
                    }

                  }
                }
                v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v94, v99, 16);
              }
              while (v48);
            }

            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v54 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v101 = v46;
                _os_log_impl(&dword_1A1FF4000, v54, OS_LOG_TYPE_INFO, "participants of chat we are registering %@", buf, 0xCu);
              }

            }
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v55 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
              {
                -[__CFString participants](v93, "participants");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v56, "arrayByApplyingSelector:", &sel_ID);
                v57 = (id)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v101 = v57;
                _os_log_impl(&dword_1A1FF4000, v55, OS_LOG_TYPE_INFO, "participants of existing chat %@", buf, 0xCu);

              }
            }

          }
        }
        v63 = v93;
        if (v93)
        {
          CFDictionarySetValue((CFMutableDictionaryRef)self->_chatGUIDToChatMap, v88, v63);
        }
        else
        {
          v64 = MEMORY[0x1E0C81028];
          v65 = MEMORY[0x1E0C81028];
          if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
            sub_1A2197C10();

        }
        v66 = v86;
        CFDictionarySetValue((CFMutableDictionaryRef)self->_chatGUIDToCurrentThreadMap, v88, v66);

        v67 = v63;
        if (v93)
        {
          CFDictionarySetValue((CFMutableDictionaryRef)self->_threadNameToChatMap, v66, v67);
        }
        else
        {
          v68 = MEMORY[0x1E0C81028];
          v69 = MEMORY[0x1E0C81028];
          if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
            sub_1A2197B9C();

        }
        -[__CFString personCentricID](v67, "personCentricID");
        v70 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (!v70)
        {
          -[IMChatRegistry contactStore](self, "contactStore");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = objc_msgSend(v71, "isBatchFetchingForLaunchCompleted");

          if (!v72)
          {
LABEL_106:
            if ((-[NSMutableArray containsObjectIdenticalTo:](self->_cachedChatsInThreadNameMap, "containsObjectIdenticalTo:", v67) & 1) == 0)-[NSMutableArray addObject:](self->_cachedChatsInThreadNameMap, "addObject:", v67);
            if (v85)
            {
              v76 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", 1);

              v77 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v76, CFSTR("__kIMChatRegistryIsIncomingKey"), 0);
            }
            else
            {
              v77 = 0;
              v76 = 0;
            }
            if (!v82 && !-[IMChatRegistry isFirstLoad](self, "isFirstLoad") && v83)
            {
              objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v78, "__mainThreadPostNotificationName:object:userInfo:", CFSTR("__kIMChatRegistryDidRegisterChatNotification"), v67, v77);

            }
            -[__CFString verifyFiltering](v67, "verifyFiltering");
            -[__CFString _guids](v67, "_guids");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "addObject:", v88);

LABEL_115:
            v10 = v93;
            goto LABEL_116;
          }
          -[__CFString _generatePersonCentricID](v67, "_generatePersonCentricID");
          v70 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v73 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
            {
              -[__CFString guid](v67, "guid");
              v74 = (id)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v101 = v74;
              v102 = 2112;
              v103 = v70;
              _os_log_impl(&dword_1A1FF4000, v73, OS_LOG_TYPE_INFO, "Registering chat %@ using personCentricID %@", buf, 0x16u);

            }
          }
          v75 = v67;
          if (v93)
            CFDictionarySetValue((CFMutableDictionaryRef)self->_chatPersonIDToChatMap, v70, v75);

          -[__CFString setPersonCentricID:](v75, "setPersonCentricID:", v70);
        }

        goto LABEL_106;
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      -[__CFString guid](v10, "guid");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v101 = v27;
      _os_log_impl(&dword_1A1FF4000, v26, OS_LOG_TYPE_INFO, " => empty thread name for guid %@", buf, 0xCu);

    }
    goto LABEL_115;
  }
LABEL_116:
  if (-[__CFString chatStyle](v10, "chatStyle") != 45)
  {
    -[__CFString participants](v93, "participants");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMChatRegistry _sortedParticipantIDHashForParticipants:](self, "_sortedParticipantIDHashForParticipants:", v80);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMChatRegistry _addChat:participantSet:](self, "_addChat:participantSet:", v93, v81);

  }
  v11 = v89;
LABEL_119:

}

- (BOOL)isFirstLoad
{
  return self->_firstLoad;
}

- (void)_setChatHasCommunicatedOveriMessage:(id)a3
{
  id v4;
  NSMutableDictionary *chatGUIDToiMessageSentOrReceivedMap;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    chatGUIDToiMessageSentOrReceivedMap = self->_chatGUIDToiMessageSentOrReceivedMap;
    v10 = v4;
    objc_msgSend(v4, "guid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](chatGUIDToiMessageSentOrReceivedMap, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v10;
    if (!v7)
    {
      v8 = self->_chatGUIDToiMessageSentOrReceivedMap;
      objc_msgSend(v10, "guid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v10, v9);

      v4 = v10;
    }
  }

}

- (id)_cachedChatWithPersonID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[IMChatRegistry chatPersonIDToChatMap](self, "chatPersonIDToChatMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSMutableDictionary)chatPersonIDToChatMap
{
  return self->_chatPersonIDToChatMap;
}

- (NSMutableDictionary)groupIDToChatMap
{
  return self->_groupIDToChatMap;
}

- (id)_sortedParticipantIDHashForParticipants:(id)a3
{
  return -[IMChatRegistry _sortedParticipantIDHashForParticipants:usesPersonCentricID:](self, "_sortedParticipantIDHashForParticipants:usesPersonCentricID:", a3, 1);
}

- (void)_addChat:(id)a3 participantSet:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[NSMutableDictionary objectForKey:](self->_groupParticipantToChatsMap, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](self->_groupParticipantToChatsMap, "setObject:forKey:", v8, v7);
    }
    objc_msgSend(v8, "addObject:", v6);
    if (!self->_firstLoad && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v6, "guid");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138412802;
        v12 = v10;
        v13 = 2112;
        v14 = v7;
        v15 = 2112;
        v16 = v8;
        _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_INFO, "Added chat %@ to chatsForParticipant[%@], now %@", (uint8_t *)&v11, 0x20u);

      }
    }

  }
}

- (BOOL)filterediMessageChatsExist
{
  return self->_filterediMessageChatsExist;
}

- (void)setUserActivityForChat:(id)a3 orHandles:(id)a4
{
  -[IMChatRegistry setUserActivityForChat:message:orHandles:](self, "setUserActivityForChat:message:orHandles:", a3, 0, a4);
}

- (void)setUserActivityForChat:(id)a3 message:(id)a4 orHandles:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v8, "guid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "guid");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = 138412802;
      v44 = v12;
      v45 = 2112;
      v46 = v13;
      v47 = 2112;
      v48 = v10;
      _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "Updating user activity with chat: %@ message: %@ handles: %@", (uint8_t *)&v43, 0x20u);

    }
  }
  if (v8 || objc_msgSend(v10, "count"))
  {
    -[IMChatRegistry userActivity](self, "userActivity");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14 == 0;

    if (v15)
    {
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B10]), "initWithActivityType:", CFSTR("com.apple.Messages"));
      -[IMChatRegistry setUserActivity:](self, "setUserActivity:", v16);

    }
    if (v8 && !objc_msgSend(0, "length"))
    {
      objc_msgSend(v8, "displayName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = 0;
    }
    if (!objc_msgSend(v17, "length"))
    {
      objc_msgSend(v8, "displayNameWithRawAddress:isSpamFilteringEnabled:", 0, objc_msgSend(MEMORY[0x1E0D36110], "isSpamFilteringOn"));
      v18 = objc_claimAutoreleasedReturnValue();

      v17 = (void *)v18;
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastIncomingFinishedMessageWithTextContent");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "text");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "string");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
      objc_msgSend(v19, "setObject:forKey:", v22, CFSTR("__kIMChatRegistryUserActivityLastMessageKey"));
    -[IMChatRegistry messagesURLWithChat:orHandles:withMessageText:](self, "messagesURLWithChat:orHandles:withMessageText:", v8, v10, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23)
    {
      objc_msgSend(v23, "absoluteString");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKey:", v25, CFSTR("__kIMChatRegistryContinuityURLKey"));

      -[IMChatRegistry userActivity](self, "userActivity");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_opt_respondsToSelector();

      if ((v27 & 1) != 0)
      {
        -[IMChatRegistry userActivity](self, "userActivity");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "absoluteString");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setTargetContentIdentifier:", v29);

      }
    }
    -[IMChatRegistry userActivity](self, "userActivity");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v19, "copy");
    objc_msgSend(v30, "setUserInfo:", v31);

    -[IMChatRegistry userActivity](self, "userActivity");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setTitle:", v17);

    -[IMChatRegistry userActivity](self, "userActivity");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setNeedsSave:", 1);

    -[IMChatRegistry _interactionForMessage:inChat:](self, "_interactionForMessage:inChat:", v9, v8);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          LOWORD(v43) = 0;
          _os_log_impl(&dword_1A1FF4000, v35, OS_LOG_TYPE_INFO, "Donating user activity with interaction", (uint8_t *)&v43, 2u);
        }

      }
      -[IMChatRegistry userActivity](self, "userActivity");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setInteraction:", v34);

      -[IMChatRegistry userActivity](self, "userActivity");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setEligibleForHandoff:", 0);
    }
    else if (objc_msgSend(v9, "isFinished"))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          LOWORD(v43) = 0;
          _os_log_impl(&dword_1A1FF4000, v38, OS_LOG_TYPE_INFO, "Setting user activity for sent message, with no interaction", (uint8_t *)&v43, 2u);
        }

      }
      -[IMChatRegistry userActivity](self, "userActivity");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setEligibleForHandoff:", 0);
    }
    else
    {
      -[IMChatRegistry userActivity](self, "userActivity");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setEligibleForHandoff:", 1);
    }

    -[IMChatRegistry userActivity](self, "userActivity");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setEligibleForSearch:", 0);

    -[IMChatRegistry userActivity](self, "userActivity");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setEligibleForPublicIndexing:", 0);

    -[IMChatRegistry userActivity](self, "userActivity");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "becomeCurrent");

  }
  else
  {
    -[IMChatRegistry userActivity](self, "userActivity");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "invalidate");

    -[IMChatRegistry setUserActivity:](self, "setUserActivity:", 0);
  }

}

- (void)updateRecoverableMessagesMetadataSynchronously:(BOOL)a3 loadChats:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  id v8;
  NSObject *v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  BOOL v16;
  _QWORD v17[5];
  BOOL v18;
  uint8_t buf[4];
  const __CFString *v20;
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v5 = a4;
  v6 = a3;
  v23 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = CFSTR("NO");
      if (v6)
        v11 = CFSTR("YES");
      else
        v11 = CFSTR("NO");
      if (v5)
        v10 = CFSTR("YES");
      *(_DWORD *)buf = 138412546;
      v20 = v11;
      v21 = 2112;
      v22 = v10;
      _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_INFO, "Recently Deleted | Loading recoverable message metadata synchronously %@ loadsChats %@", buf, 0x16u);
    }

  }
  -[IMChatRegistry daemonQueryController](self, "daemonQueryController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_1A200D49C;
  v17[3] = &unk_1E471FC90;
  v18 = v6;
  v17[4] = self;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1A200D2E8;
  v14[3] = &unk_1E471FCE0;
  v16 = v5;
  v14[4] = self;
  v15 = v8;
  v13 = v8;
  objc_msgSend(v12, "performQueryWithKey:expectsSynchronousResult:block:completionHandler:", CFSTR("RecentlyDeleted-RecoverableMessagesMetadata"), v6, v17, v14);

}

- (void)updateRecoverableMessagesMetadataSynchronously:(BOOL)a3 completionHandler:(id)a4
{
  -[IMChatRegistry updateRecoverableMessagesMetadataSynchronously:loadChats:completionHandler:](self, "updateRecoverableMessagesMetadataSynchronously:loadChats:completionHandler:", a3, 0, a4);
}

- (id)existingChatWithChatIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;
  IMChatRegistry *v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  if (objc_msgSend(v4, "length") && (objc_msgSend(v4, "isEqualToString:", CFSTR("-1")) & 1) == 0)
  {
    v6 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1A200BD34;
    v11[3] = &unk_1E471F8A8;
    v11[4] = self;
    v12 = v4;
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = sub_1A2072830;
    v8[3] = &unk_1E471F8F8;
    v9 = v12;
    v10 = self;
    -[IMChatRegistry _performSingleChatCacheLookupWithBlock:cacheMissQueryKey:queryBlock:](self, "_performSingleChatCacheLookupWithBlock:cacheMissQueryKey:queryBlock:", v11, CFSTR("ChatCache-LoadWithIdentifier"), v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)unreadCountChanged:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  _DWORD v7[2];
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (-[IMChatRegistry unreadCount](self, "unreadCount") != a3)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v7[0] = 67109376;
        v7[1] = -[IMChatRegistry unreadCount](self, "unreadCount");
        v8 = 1024;
        v9 = a3;
        _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Unread count changed from %d to %d", (uint8_t *)v7, 0xEu);
      }

    }
    -[IMChatRegistry setUnreadCount:](self, "setUnreadCount:", a3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "__mainThreadPostNotificationName:object:", CFSTR("__kIMChatRegistryUnreadCountChangedNotification"), 0);

  }
}

- (void)setupComplete
{
  -[IMChatRegistry setWantsHistoryReload:](self, "setWantsHistoryReload:", 0);
}

- (void)setupComplete:(BOOL)a3 info:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  char *v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  int v21;
  NSObject *v22;
  int64_t v23;
  int v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  char *v28;
  NSObject *v29;
  int v30;
  const char *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v30 = 136315138;
      v31 = "-[IMChatRegistry(IMChatRegistry_DaemonIncoming) setupComplete:info:]";
      _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v30, 0xCu);
    }

  }
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "listener");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_stampForContext:", CFSTR("DBModificationStamp"));
  v9 = (char *)objc_claimAutoreleasedReturnValue();

  LODWORD(v7) = -[IMChatRegistry daemonHadTerminated](self, "daemonHadTerminated");
  v10 = IMOSLoggingEnabled();
  if (!(_DWORD)v7)
  {
    if (v10)
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v30 = 138412290;
        v31 = v9;
        _os_log_impl(&dword_1A1FF4000, v17, OS_LOG_TYPE_INFO, "This our first launch, just noting the modification stamp: %@", (uint8_t *)&v30, 0xCu);
      }
      goto LABEL_24;
    }
LABEL_25:
    v16 = 1;
    goto LABEL_26;
  }
  if (v10)
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      -[IMChatRegistry historyModificationStamp](self, "historyModificationStamp");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138412546;
      v31 = v9;
      v32 = 2112;
      v33 = v12;
      _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "New history modification stamp is: %@     old was: %@", (uint8_t *)&v30, 0x16u);

    }
  }
  if (!v9
    || (-[IMChatRegistry historyModificationStamp](self, "historyModificationStamp"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v13, "isEqualToString:", v9),
        v13,
        (v14 & 1) == 0))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        LOWORD(v30) = 0;
        _os_log_impl(&dword_1A1FF4000, v17, OS_LOG_TYPE_INFO, "   We're out of date, updating as we need", (uint8_t *)&v30, 2u);
      }
LABEL_24:

      goto LABEL_25;
    }
    goto LABEL_25;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      LOWORD(v30) = 0;
      _os_log_impl(&dword_1A1FF4000, v15, OS_LOG_TYPE_INFO, "   We're up to date, nothing to do here", (uint8_t *)&v30, 2u);
    }

  }
  v16 = 0;
LABEL_26:
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D39100]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMChatRegistry unreadCountChanged:](self, "unreadCountChanged:", objc_msgSend(v18, "integerValue"));

  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D390D0]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMChatRegistry lastFailedMessageDateChanged:](self, "lastFailedMessageDateChanged:", objc_msgSend(v19, "longLongValue"));

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMEventCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = -[IMChatRegistry unreadCount](self, "unreadCount");
      v30 = 67109120;
      LODWORD(v31) = v21;
      _os_log_impl(&dword_1A1FF4000, v20, OS_LOG_TYPE_INFO, "Unread count is %d", (uint8_t *)&v30, 8u);
    }

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMEventCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = -[IMChatRegistry lastFailedMessageDate](self, "lastFailedMessageDate");
      v30 = 134217984;
      v31 = (const char *)v23;
      _os_log_impl(&dword_1A1FF4000, v22, OS_LOG_TYPE_INFO, "Last failed message date is %lld", (uint8_t *)&v30, 0xCu);
    }

  }
  v24 = IMOSLoggingEnabled();
  if (v9)
  {
    if (v24)
    {
      OSLogHandleForIMFoundationCategory();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        -[IMChatRegistry historyModificationStamp](self, "historyModificationStamp");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 138412546;
        v31 = v9;
        v32 = 2112;
        v33 = v26;
        _os_log_impl(&dword_1A1FF4000, v25, OS_LOG_TYPE_INFO, "Updating modification stamp to: %@     old was: %@", (uint8_t *)&v30, 0x16u);

      }
    }
    -[IMChatRegistry setHistoryModificationStamp:](self, "setHistoryModificationStamp:", v9);
  }
  else if (v24)
  {
    OSLogHandleForIMFoundationCategory();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      -[IMChatRegistry historyModificationStamp](self, "historyModificationStamp");
      v28 = (char *)objc_claimAutoreleasedReturnValue();
      v30 = 138412290;
      v31 = v28;
      _os_log_impl(&dword_1A1FF4000, v27, OS_LOG_TYPE_INFO, "No modification stamp to update, old is: %@", (uint8_t *)&v30, 0xCu);

    }
  }
  if ((_DWORD)v16 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      LOWORD(v30) = 0;
      _os_log_impl(&dword_1A1FF4000, v29, OS_LOG_TYPE_INFO, "   history may by out of date at this point, queries will all be non cached", (uint8_t *)&v30, 2u);
    }

  }
  -[IMChatRegistry setWantsHistoryReload:](self, "setWantsHistoryReload:", v16);
  -[IMChatRegistry setDaemonHadTerminated:](self, "setDaemonHadTerminated:", 0);

}

- (void)loadedRecoverableMessagesMetadata:(id)a3 queryID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = objc_msgSend(v6, "count");
      v10 = CFSTR("YES");
      if (!v9)
        v10 = CFSTR("NO");
      *(_DWORD *)buf = 138412546;
      v16 = v7;
      v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "Recently Deleted | Completing query: Loaded recoverableMessagesMetadata for query: %@, hasRecoverableMessages: %@", buf, 0x16u);
    }

  }
  -[IMChatRegistry daemonQueryController](self, "daemonQueryController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = CFSTR("recoverableMessagesMetadata");
  v14 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "completeQuery:userInfo:", v7, v12);

}

- (void)lastFailedMessageDateChanged:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  int v7;
  int64_t v8;
  __int16 v9;
  int64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (-[IMChatRegistry lastFailedMessageDate](self, "lastFailedMessageDate") != a3)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v7 = 134218240;
        v8 = -[IMChatRegistry lastFailedMessageDate](self, "lastFailedMessageDate");
        v9 = 2048;
        v10 = a3;
        _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Failed message date changed from %lld to %lld", (uint8_t *)&v7, 0x16u);
      }

    }
    -[IMChatRegistry setLastFailedMessageDate:](self, "setLastFailedMessageDate:", a3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "__mainThreadPostNotificationName:object:", CFSTR("__kIMChatRegistryLastFailedMessageDateChangedNotification"), 0);

  }
}

- (void)_handleMergedChatReconstructions:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  int v10;
  int v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v24 = a3;
  +[IMDaemonController sharedController](IMDaemonController, "sharedController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "processCapabilities");

  if ((v5 & 0x2400000) != 0)
  {
    v23 = -[IMChatRegistry _copyMergedChatsPairedArrayFromMergedChatsArray:](self, "_copyMergedChatsPairedArrayFromMergedChatsArray:", v24);
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "capabilitiesForListenerID:", 0);
    if ((*MEMORY[0x1E0D36CD0] & v7) != 0)
    {

    }
    else
    {
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "capabilitiesForListenerID:", 0);
      v11 = *MEMORY[0x1E0D36D28] & v10;

      if (!v11)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "Clearing chat registry", buf, 2u);
          }

        }
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "__mainThreadPostNotificationName:object:", CFSTR("__kIMChatRegistryWillLoadNotification"), 0);

        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        -[IMChatRegistry cachedChats](self, "cachedChats");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v15, "copy");

        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v17)
        {
          v18 = *(_QWORD *)v26;
          do
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v26 != v18)
                objc_enumerationMutation(v16);
              v20 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
              if (IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v21 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  v31 = v20;
                  _os_log_impl(&dword_1A1FF4000, v21, OS_LOG_TYPE_INFO, " => Unregistering chat: %@", buf, 0xCu);
                }

              }
              -[IMChatRegistry _unregisterChat:](self, "_unregisterChat:", v20);
            }
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
          }
          while (v17);
        }

        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "__mainThreadPostNotificationName:object:", CFSTR("__kIMChatRegistryDidLoadNotification"), 0);

        v12 = v23;
        goto LABEL_10;
      }
    }
    v12 = v23;
    -[IMChatRegistry __handleMergedChatReconstructions:](self, "__handleMergedChatReconstructions:", v23);
    -[IMChatRegistry setUpInitialCallState](self, "setUpInitialCallState");
LABEL_10:

    goto LABEL_11;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMEventCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "Bailing out of _handleMergedChatReconstructions as no precached chats are expected.", buf, 2u);
    }

  }
LABEL_11:

}

- (void)_handleCachingAliasToCNIDMap:(id)a3
{
  id v4;
  id v5;
  void *v6;
  int v7;
  int v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D36AE8]);
  objc_msgSend(v5, "startTimingForKey:", CFSTR("_handleCachingAliasToCNIDMap"));
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "capabilitiesForListenerID:", 0);
  v8 = *MEMORY[0x1E0D36D10] & v7;

  if (v8)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMEventCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_INFO, "Bailing out of handle Contacts cache construction due to kFZListenerCapPaginatedChatRegistry", (uint8_t *)&v12, 2u);
      }
LABEL_9:

    }
  }
  else
  {
    -[IMChatRegistry contactStore](self, "contactStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHandleIDToCNIDMap:", v4);

    objc_msgSend(v5, "stopTimingForKey:", CFSTR("_handleCachingAliasToCNIDMap"));
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v5, "totalTimeForKey:", CFSTR("_handleCachingAliasToCNIDMap"));
        v12 = 134217984;
        v13 = v11;
        _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_INFO, "Caching AliasToCNIDMap completed. Took %f seconds", (uint8_t *)&v12, 0xCu);
      }
      goto LABEL_9;
    }
  }

}

- (void)_fetchInitialBatchOfContactsOnLaunch
{
  NSObject *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  _BOOL8 v7;
  void *v8;
  uint8_t v9[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "ChatRegistry: Fetching the initial batch of Contacts", v9, 2u);
    }

  }
  +[IMHandleRegistrar sharedInstance](IMHandleRegistrar, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getIDsForInitialBatch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "count");
  if (v6)
  {
    v7 = v6 < 0x1A;
    -[IMChatRegistry contactStore](self, "contactStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fetchCNContactsForHandlesWithIDs:isFinalBatch:", v5, v7);
  }
  else
  {
    -[IMChatRegistry contactStore](self, "contactStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBatchFetchingCompleted");
  }

}

- (void)_daemonCompletedDeferredSetup
{
  NSObject *v3;
  _BOOL4 v4;
  const __CFString *v5;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = -[IMChatRegistry isFirstLoad](self, "isFirstLoad");
      v5 = CFSTR("NO");
      if (v4)
        v5 = CFSTR("YES");
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "Daemon completed deferred setup (firstLoad was: %@)", (uint8_t *)&v6, 0xCu);
    }

  }
  -[IMChatRegistry setFirstLoad:](self, "setFirstLoad:", 0);
}

- (void)_batchFetchRemainingContactsOnLaunch
{
  uint64_t v2;
  void *v3;
  dispatch_time_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD aBlock[5];

  v2 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1A2142A94;
  aBlock[3] = &unk_1E471E348;
  aBlock[4] = self;
  v3 = _Block_copy(aBlock);
  v4 = dispatch_time(0, 2000000000);
  dispatch_get_global_queue(25, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  v7[1] = 3221225472;
  v7[2] = sub_1A2142B80;
  v7[3] = &unk_1E471E528;
  v8 = v3;
  v6 = v3;
  dispatch_after(v4, v5, v7);

}

- (void)__handleMergedChatReconstructions:(id)a3
{
  sub_1A1FFE7D4(self, a3, 1);
}

- (void)setUpInitialCallState
{
  NSObject *v3;
  void *v4;
  _QWORD v5[5];
  uint8_t buf[16];

  if ((IMIsRunningInUnitTesting() & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "Setting up initial state of calls", buf, 2u);
      }

    }
    -[IMChatRegistry conversationManager](self, "conversationManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = sub_1A200B774;
    v5[3] = &unk_1E471E348;
    v5[4] = self;
    objc_msgSend(v4, "registerWithCompletionHandler:", v5);

  }
}

- (id)_cachedChatWithIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_1A200AEB4;
  v12 = sub_1A200ACCC;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1A212173C;
  v7[3] = &unk_1E47228D0;
  v7[4] = self;
  v7[5] = &v8;
  -[IMChatRegistry _enumerateChatGUIDPermutationsForChatIdentifier:styles:usingBlock:](self, "_enumerateChatGUIDPermutationsForChatIdentifier:styles:usingBlock:", v4, 47, v7);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (void)_updateBlackholedChatsExist:(BOOL)a3
{
  void *v4;
  void *v5;
  __CFNotificationCenter *DarwinNotifyCenter;

  -[IMChatRegistry setBlackholedChatsExist:](self, "setBlackholedChatsExist:", a3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IMChatRegistry blackholedChatsExist](self, "blackholedChatsExist"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "__mainThreadPostNotificationName:object:", CFSTR("__kIMChatRegistryBlackholedChatsExistNotification"), v5);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("__kIMChatRegistryBlackholedChatsExistNotification"), 0, 0, 1u);
}

- (NSUserActivity)userActivity
{
  return self->_userActivity;
}

- (unint64_t)unreadCount
{
  return self->_unreadCount;
}

- (void)setWantsHistoryReload:(BOOL)a3
{
  self->_wantsHistoryReload = a3;
}

- (void)setUserActivity:(id)a3
{
  objc_storeStrong((id *)&self->_userActivity, a3);
}

- (void)setUnreadCount:(unint64_t)a3
{
  self->_unreadCount = a3;
}

- (void)setLoading:(BOOL)a3
{
  self->_loading = a3;
}

- (void)setLastFailedMessageDate:(int64_t)a3
{
  self->_lastFailedMessageDate = a3;
}

- (void)setHistoryModificationStamp:(id)a3
{
  objc_storeStrong((id *)&self->_historyModificationStamp, a3);
}

- (void)setFirstLoad:(BOOL)a3
{
  self->_firstLoad = a3;
}

- (void)setFilterediMessageChatsExist:(BOOL)a3
{
  self->_filterediMessageChatsExist = a3;
}

- (void)setFilterCategoryToEarliestInitiallyFetchedLastMessageDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (void)setDaemonHadTerminated:(BOOL)a3
{
  self->_daemonHadTerminated = a3;
}

- (void)setBlackholedChatsExist:(BOOL)a3
{
  self->_blackholedChatsExist = a3;
}

- (int64_t)lastFailedMessageDate
{
  return self->_lastFailedMessageDate;
}

- (id)initAsListener:(BOOL)a3
{
  _BOOL4 v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
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
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  dispatch_queue_t v49;
  void *v50;
  NSObject *v51;
  _QWORD block[4];
  id v54;
  objc_super v55;

  v3 = a3;
  v55.receiver = self;
  v55.super_class = (Class)IMChatRegistry;
  v4 = -[IMChatRegistry init](&v55, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel__handleChatParticipantsDidChange_, CFSTR("__kIMChatParticipantsDidChangeNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v4, sel__handleAddressBookChange_, *MEMORY[0x1E0D373D0], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v4, sel__handleAddressBookChange_, *MEMORY[0x1E0D373C0], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v4, sel__handleAvailabilityChangedNotification_, IMHandleAvailabilityChangedNotification, 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v4, sel__handleAvailabilityInvitationReceivedNotification_, IMHandleAvailabilityInvitationReceivedNotification, 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v4, sel__handleAvailabilityStateChangedNotification_, IMHandleAvailabilityStateChangedNotification, 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v4, sel__daemonReallyDied_, CFSTR("__k_IMDaemonDidDisconnectNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v4, sel__handleOffGridChangedNotification_, *MEMORY[0x1E0D38050], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v4, sel__handleOffGridInvitationReceivedNotification_, *MEMORY[0x1E0D38060], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v4, sel__handleOffGridStateChangedNotification_, *MEMORY[0x1E0D38068], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v4, sel__handleKeyTransparencyStatusChangedNotification_, CFSTR("__kIMChatKeyTransparencyStatusChangedNotification"), 0);

    objc_msgSend(MEMORY[0x1E0D39970], "sharedList");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "registerForGroupIDChangeNotifications");

    *((_BYTE *)v4 + 17) = 1;
    v17 = (void *)*((_QWORD *)v4 + 12);
    *((_QWORD *)v4 + 12) = 0;

    *((_WORD *)v4 + 6) = 256;
    v18 = (void *)*((_QWORD *)v4 + 13);
    *((_QWORD *)v4 + 13) = 0;

    v19 = (void *)*((_QWORD *)v4 + 15);
    *((_QWORD *)v4 + 14) = 0;
    *((_QWORD *)v4 + 15) = 0;

    v20 = (void *)*((_QWORD *)v4 + 30);
    *((_QWORD *)v4 + 30) = 0;

    v21 = (void *)*((_QWORD *)v4 + 29);
    *((_QWORD *)v4 + 29) = 0;

    objc_msgSend(MEMORY[0x1E0C99DE8], "nonRetainingArray");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)*((_QWORD *)v4 + 17);
    *((_QWORD *)v4 + 17) = v22;

    v24 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v25 = (void *)*((_QWORD *)v4 + 21);
    *((_QWORD *)v4 + 21) = v24;

    v26 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v27 = (void *)*((_QWORD *)v4 + 19);
    *((_QWORD *)v4 + 19) = v26;

    v28 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v29 = (void *)*((_QWORD *)v4 + 20);
    *((_QWORD *)v4 + 20) = v28;

    v30 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v31 = (void *)*((_QWORD *)v4 + 24);
    *((_QWORD *)v4 + 24) = v30;

    v32 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v33 = (void *)*((_QWORD *)v4 + 16);
    *((_QWORD *)v4 + 16) = v32;

    v34 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v35 = (void *)*((_QWORD *)v4 + 26);
    *((_QWORD *)v4 + 26) = v34;

    v36 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v37 = (void *)*((_QWORD *)v4 + 27);
    *((_QWORD *)v4 + 27) = v36;

    v38 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v39 = (void *)*((_QWORD *)v4 + 22);
    *((_QWORD *)v4 + 22) = v38;

    v40 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v41 = (void *)*((_QWORD *)v4 + 18);
    *((_QWORD *)v4 + 18) = v40;

    objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    *((_BYTE *)v4 + 14) = objc_msgSend(v42, "isInternalInstall");

    *((_BYTE *)v4 + 16) = 0;
    if (v3)
    {
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "listener");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "addHandler:", v4);

      objc_msgSend(MEMORY[0x1E0D36AD0], "sharedInstance");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "addListener:", v4);

    }
    v46 = +[IMChatHistoryController sharedInstance](IMChatHistoryController, "sharedInstance");
    v47 = objc_alloc_init(MEMORY[0x1E0DBD298]);
    v48 = (void *)*((_QWORD *)v4 + 11);
    *((_QWORD *)v4 + 11) = v47;

    v49 = dispatch_queue_create("IMChatRegistry.contactStoreQueue", 0);
    v50 = (void *)*((_QWORD *)v4 + 6);
    *((_QWORD *)v4 + 6) = v49;

    v51 = *((_QWORD *)v4 + 6);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1A200CDD4;
    block[3] = &unk_1E471E348;
    v54 = v4;
    dispatch_async(v51, block);

  }
  return v4;
}

- (NSDictionary)filterCategoryToEarliestInitiallyFetchedLastMessageDate
{
  return self->_filterCategoryToEarliestInitiallyFetchedLastMessageDate;
}

- (IMDaemonQueryController)daemonQueryController
{
  void *v2;
  void *v3;

  -[IMChatRegistry daemonController](self, "daemonController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queryController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (IMDaemonQueryController *)v3;
}

- (BOOL)daemonHadTerminated
{
  return self->_daemonHadTerminated;
}

- (TUConversationManager)conversationManager
{
  return self->_conversationManager;
}

- (BOOL)blackholedChatsExist
{
  return self->_blackholedChatsExist;
}

- (void)_updateFilterediMessageChatsExist:(BOOL)a3
{
  MEMORY[0x1E0DE7D20](self, sel_setFilterediMessageChatsExist_);
}

- (void)_setPostMessageSentNotifications:(BOOL)a3
{
  self->_postMessageSentNotifications = a3;
}

- (void)_setDefaultNumberOfMessagesToLoad:(unint64_t)a3
{
  self->_defaultNumberOfMessagesToLoad = a3;
}

- (void)_resetChatRegistry
{
  -[NSMutableDictionary removeAllObjects](self->_chatGUIDToCurrentThreadMap, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_chatGUIDToInfoMap, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_chatGUIDToChatMap, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_chatGUIDToiMessageSentOrReceivedMap, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_allChatsInProcess, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_chatPersonIDToChatMap, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_cachedChatsInThreadNameMap, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_threadNameToChatMap, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_groupIDToChatMap, "removeAllObjects");
  -[IMChatRegistry _resetChatReconstructionGroupMaps](self, "_resetChatReconstructionGroupMaps");
}

- (void)_resetChatReconstructionGroupMaps
{
  -[NSMutableDictionary removeAllObjects](self->_groupParticipantToChatsMap, "removeAllObjects");
}

+ (Class)messageClass
{
  void *v2;

  v2 = (void *)qword_1ECF12368;
  if (!qword_1ECF12368)
  {
    v2 = (void *)objc_opt_class();
    qword_1ECF12368 = (uint64_t)v2;
  }
  return (Class)v2;
}

+ (BOOL)hasInitializedChatFiltering
{
  if (qword_1EE65F330 != -1)
    dispatch_once(&qword_1EE65F330, &unk_1E471C590);
  return byte_1EE6617C8;
}

+ (void)setHasInitializedChatFiltering:(BOOL)a3
{
  if (byte_1EE6617C8 != a3)
  {
    byte_1EE6617C8 = a3;
    IMSetDomainBoolForKey();
  }
}

- (void)verifyFilteringForAllChats
{
  void *v3;
  uint64_t v4;

  if ((sub_1A200DA5C() & 1) != 0 || IMIsRunningInUnitTesting())
  {
    -[IMChatRegistry cachedChats](self, "cachedChats");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", &unk_1E471BBC0);

    v4 = objc_opt_class();
    MEMORY[0x1E0DE7D20](v4, sel_setHasInitializedChatFiltering_);
  }
}

- (id)existingConversationForFaceTimeConversationUUID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v4;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Existing TUConversation with UUID: %@", buf, 0xCu);
    }

  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[IMChatRegistry conversationManager](self, "conversationManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activeConversations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v10 = *(_QWORD *)v21;
    *(_QWORD *)&v9 = 138412290;
    v19 = v9;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v11);
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v12, "UUID");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v19;
            v26 = v14;
            _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "Active TUConversation UUID: %@", buf, 0xCu);

          }
        }
        objc_msgSend(v12, "UUID", v19);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqual:", v4);

        if (v16)
        {
          v17 = v12;
          goto LABEL_19;
        }
        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v8)
        continue;
      break;
    }
  }
  v17 = 0;
LABEL_19:

  return v17;
}

- (id)chatForFaceTimeConversation:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "remoteMemberHandleStrings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMChatRegistry chatForFaceTimeRecipientIDs:](self, "chatForFaceTimeRecipientIDs:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)chatForFaceTimeRecipientIDs:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  IMHandle *v13;
  IMHandle *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeIMessageAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v11);
        v13 = [IMHandle alloc];
        v14 = -[IMHandle initWithAccount:ID:alreadyCanonical:](v13, "initWithAccount:ID:alreadyCanonical:", v5, v12, 0, (_QWORD)v18);
        objc_msgSend(v6, "addObject:", v14);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  +[IMChatRegistry sharedRegistry](IMChatRegistry, "sharedRegistry");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "chatWithHandles:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)chatWithHandle:(id)a3
{
  return -[IMChatRegistry chatWithHandle:lastAddressedHandle:lastAddressedSIMID:](self, "chatWithHandle:lastAddressedHandle:lastAddressedSIMID:", a3, 0, 0);
}

- (id)chatWithHandle:(id)a3 lastAddressedHandle:(id)a4 lastAddressedSIMID:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  IMChat *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v8;
      _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_DEBUG, "handle: %@", buf, 0xCu);
    }

  }
  if (!v8)
  {
    v12 = 0;
    goto LABEL_43;
  }
  -[IMChatRegistry existingChatWithHandle:](self, "existingChatWithHandle:", v8);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (v12)
    goto LABEL_7;
  if (IMSharedHelperContactsBasedMergingEnabled())
  {
    -[IMChatRegistry _existingChatForHandleUsingPersonID:](self, "_existingChatForHandleUsingPersonID:", v8);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v30 = v12;
          _os_log_impl(&dword_1A1FF4000, v15, OS_LOG_TYPE_INFO, "Found a chat using PersonID: %@ ", buf, 0xCu);
        }

      }
      objc_msgSend(v12, "setRecipient:", v8);
LABEL_7:
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v30 = v12;
          v31 = 2112;
          v32 = v8;
          _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "Redirecting chat %@ to handle: %@", buf, 0x16u);
        }

      }
      objc_msgSend(v12, "setRecipient:", v8);
      objc_msgSend(v8, "account");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_setAccount:", v14);

      goto LABEL_43;
    }
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v16, OS_LOG_TYPE_INFO, "No chat found", buf, 2u);
    }

  }
  -[IMChatRegistry _possiblyUnregisteredCachedChatWithHandle:](self, "_possiblyUnregisteredCachedChatWithHandle:", v8);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v12;
        _os_log_impl(&dword_1A1FF4000, v17, OS_LOG_TYPE_INFO, "Found created chat: %@", buf, 0xCu);
      }

    }
    objc_msgSend(v12, "setRecipient:", v8);
    objc_msgSend(v8, "account");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_setAccount:", v18);

  }
  else
  {
    v19 = [IMChat alloc];
    objc_msgSend(v8, "account");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    IMSingleObjectArray();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    BYTE2(v28) = 0;
    LOWORD(v28) = 0;
    v12 = -[IMChat _initWithGUID:account:style:roomName:displayName:lastAddressedHandle:lastAddressedSIMID:items:participants:isFiltered:hasHadSuccessfulQuery:isRecovered:isDeletingIncomingMessages:](v19, "_initWithGUID:account:style:roomName:displayName:lastAddressedHandle:lastAddressedSIMID:items:participants:isFiltered:hasHadSuccessfulQuery:isRecovered:isDeletingIncomingMessages:", 0, v20, 45, 0, 0, v9, v10, 0, v21, 1, v28);

    objc_msgSend(v12, "_setupObservation");
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v12, "lastAddressedHandleID");
        v23 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "lastAddressedSIMID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v30 = v12;
        v31 = 2112;
        v32 = v23;
        v33 = 2112;
        v34 = v24;
        _os_log_impl(&dword_1A1FF4000, v22, OS_LOG_TYPE_INFO, "Created chat: %@ lastaddressed handle %@ last addressed simID %@", buf, 0x20u);

      }
    }
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v12;
      _os_log_impl(&dword_1A1FF4000, v25, OS_LOG_TYPE_INFO, "registering outgoing chat: %@", buf, 0xCu);
    }

  }
  -[IMChatRegistry _registerChat:isIncoming:guid:](self, "_registerChat:isIncoming:guid:", v12, 0, 0);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v12;
      _os_log_impl(&dword_1A1FF4000, v26, OS_LOG_TYPE_INFO, "Joining chat: %@", buf, 0xCu);
    }

  }
  objc_msgSend(v12, "join");
LABEL_43:

  return v12;
}

- (id)chatWithHandles:(id)a3
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_chatWithHandles_lastAddressedHandle_lastAddressedSIMID_);
}

- (id)chatWithHandles:(id)a3 lastAddressedHandle:(id)a4 lastAddressedSIMID:(id)a5
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_chatWithHandles_displayName_joinedChatsOnly_lastAddressedHandle_lastAddressedSIMID_);
}

- (id)chatWithHandles:(id)a3 displayName:(id)a4 joinedChatsOnly:(BOOL)a5
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_chatWithHandles_displayName_joinedChatsOnly_lastAddressedHandle_lastAddressedSIMID_);
}

- (id)chatWithHandles:(id)a3 displayName:(id)a4 joinedChatsOnly:(BOOL)a5 lastAddressedHandle:(id)a6 lastAddressedSIMID:(id)a7
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_chatWithHandles_displayName_joinedChatsOnly_findMatchingNamedGroups_lastAddressedHandle_lastAddressedSIMID_);
}

- (id)chatWithHandles:(id)a3 displayName:(id)a4 joinedChatsOnly:(BOOL)a5 findMatchingNamedGroups:(BOOL)a6 lastAddressedHandle:(id)a7 lastAddressedSIMID:(id)a8
{
  _BOOL4 v10;
  _BOOL8 v11;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  uint64_t v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v10 = a6;
  v11 = a5;
  v34 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a7;
  v17 = a8;
  v18 = objc_msgSend(v14, "count");
  if (!v18)
  {
    v20 = 0;
    goto LABEL_29;
  }
  if (v18 == 1)
  {
    objc_msgSend(v14, "lastObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMChatRegistry chatWithHandle:lastAddressedHandle:lastAddressedSIMID:](self, "chatWithHandle:lastAddressedHandle:lastAddressedSIMID:", v19, v16, v17);
    v20 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_29;
  }
  if (v10)
  {
    -[IMChatRegistry existingChatWithHandles:allowAlternativeService:groupID:displayName:joinedChatsOnly:](self, "existingChatWithHandles:allowAlternativeService:groupID:displayName:joinedChatsOnly:", v14, 0, 0, v15, v11);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v31 = v20;
          _os_log_impl(&dword_1A1FF4000, v21, OS_LOG_TYPE_INFO, "Found existing chat: %@", buf, 0xCu);
        }

      }
      goto LABEL_29;
    }
  }
  objc_msgSend(v14, "lastObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "account");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMChatRegistry _possiblyUnregisteredCachedChatWithHandles:style:groupID:displayName:joinedChatsOnly:](self, "_possiblyUnregisteredCachedChatWithHandles:style:groupID:displayName:joinedChatsOnly:", v14, 43, 0, v15, v11);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v20;
        _os_log_impl(&dword_1A1FF4000, v24, OS_LOG_TYPE_INFO, "Found created chat: %@", buf, 0xCu);
      }
LABEL_19:

    }
  }
  else
  {
    BYTE2(v29) = 0;
    LOWORD(v29) = 0;
    v20 = -[IMChat _initWithGUID:account:style:roomName:displayName:lastAddressedHandle:lastAddressedSIMID:items:participants:isFiltered:hasHadSuccessfulQuery:isRecovered:isDeletingIncomingMessages:]([IMChat alloc], "_initWithGUID:account:style:roomName:displayName:lastAddressedHandle:lastAddressedSIMID:items:participants:isFiltered:hasHadSuccessfulQuery:isRecovered:isDeletingIncomingMessages:", 0, v23, 43, 0, v15, v16, v17, 0, v14, 1, v29);
    objc_msgSend(v20, "_setupObservation");
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v20, "lastAddressedHandleID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v31 = v20;
        v32 = 2112;
        v33 = v25;
        _os_log_impl(&dword_1A1FF4000, v24, OS_LOG_TYPE_INFO, "Created chat: %@ , lastAddressedHandle %@", buf, 0x16u);

      }
      goto LABEL_19;
    }
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v20;
      _os_log_impl(&dword_1A1FF4000, v26, OS_LOG_TYPE_INFO, "Registering outgoing chat: %@", buf, 0xCu);
    }

  }
  -[IMChatRegistry _registerChat:isIncoming:guid:](self, "_registerChat:isIncoming:guid:", v20, 0, 0);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v20;
      _os_log_impl(&dword_1A1FF4000, v27, OS_LOG_TYPE_INFO, "Joining chat: %@", buf, 0xCu);
    }

  }
  objc_msgSend(v20, "join");

LABEL_29:
  return v20;
}

- (id)allGUIDsForChat:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t);
  void *v13;
  id v14;
  id v15;

  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[IMChatRegistry chatGUIDToChatMap](self, "chatGUIDToChatMap");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = sub_1A2071B48;
    v13 = &unk_1E471F880;
    v14 = v4;
    v15 = v5;
    v7 = v5;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", &v10);

    v8 = (void *)objc_msgSend(v7, "copy", v10, v11, v12, v13);
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v8;
}

- (void)updateChatsUsingMessageGUIDsAndSummaries:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D39858], "messageSummarizationEnabled"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Requesting to update messages with summaries.", v8, 2u);
      }

    }
    -[IMChatRegistry daemonController](self, "daemonController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "remoteDaemon");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateChatsUsingMessageGUIDsAndSummaries:", v4);

  }
}

- (id)existingChatsWithGUIDs:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  IMChatRegistry *v10;
  _QWORD v11[4];
  id v12;
  IMChatRegistry *v13;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1A2071EC8;
    v11[3] = &unk_1E471F920;
    v12 = v4;
    v13 = self;
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = sub_1A2072084;
    v8[3] = &unk_1E471F970;
    v9 = v12;
    v10 = self;
    -[IMChatRegistry _performChatCacheLookupWithBlock:cacheMissQueryKey:queryBlock:](self, "_performChatCacheLookupWithBlock:cacheMissQueryKey:queryBlock:", v11, CFSTR("ChatCache-LoadWithGUID"), v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v6;
}

- (id)_chatPredicateForGUIDs:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "__imArrayByApplyingBlock:", &unk_1E471D5F8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)existingChatWithHandle:(id)a3
{
  return -[IMChatRegistry existingChatWithHandle:allowAlternativeService:](self, "existingChatWithHandle:allowAlternativeService:", a3, 1);
}

- (id)existingChatWithHandle:(id)a3 allowAlternativeService:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v13;
  id v14;
  __int16 v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "ID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[IMChatRegistry existingChatWithChatIdentifier:](self, "existingChatWithChatIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "service");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "internalName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMChatRegistry _existingChatWithIdentifier:style:service:](self, "_existingChatWithIdentifier:style:service:", v7, 45, v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v8 && objc_msgSend(v8, "chatStyle") != 45)
  {

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v13 = 138412802;
        v14 = v6;
        v15 = 1024;
        v16 = (char)objc_msgSend(0, "chatStyle");
        v17 = 2112;
        v18 = 0;
        _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "Looked up existing chat for handle %@ but got chat style %c, returning nil chat (found %@)", (uint8_t *)&v13, 0x1Cu);
      }

    }
    v8 = 0;
  }

  return v8;
}

- (id)existingChatWithHandles:(id)a3
{
  return -[IMChatRegistry existingChatWithHandles:allowAlternativeService:groupID:displayName:joinedChatsOnly:](self, "existingChatWithHandles:allowAlternativeService:groupID:displayName:joinedChatsOnly:", a3, 1, 0, 0, 0);
}

- (id)existingChatWithHandles:(id)a3 allowAlternativeService:(BOOL)a4
{
  return -[IMChatRegistry existingChatWithHandles:allowAlternativeService:groupID:displayName:joinedChatsOnly:](self, "existingChatWithHandles:allowAlternativeService:groupID:displayName:joinedChatsOnly:", a3, a4, 0, 0, 0);
}

- (id)existingChatWithHandles:(id)a3 allowAlternativeService:(BOOL)a4 groupID:(id)a5
{
  return -[IMChatRegistry existingChatWithHandles:allowAlternativeService:groupID:displayName:joinedChatsOnly:](self, "existingChatWithHandles:allowAlternativeService:groupID:displayName:joinedChatsOnly:", a3, a4, 0, 0, 0);
}

- (id)existingChatWithHandles:(id)a3 allowAlternativeService:(BOOL)a4 groupID:(id)a5 displayName:(id)a6 joinedChatsOnly:(BOOL)a7
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_existingChatWithHandles_allowAlternativeService_groupID_displayName_joinedChatsOnly_findMatchingNamedGroups_);
}

- (id)existingChatWithHandles:(id)a3 allowAlternativeService:(BOOL)a4 groupID:(id)a5 displayName:(id)a6 joinedChatsOnly:(BOOL)a7 findMatchingNamedGroups:(BOOL)a8
{
  _BOOL8 v11;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  IMChatRegistry *v25;
  BOOL v26;
  BOOL v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  BOOL v32;
  BOOL v33;

  v11 = a4;
  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = objc_msgSend(v13, "count");
  if (v16)
  {
    if (v16 == 1)
    {
      objc_msgSend(v13, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMChatRegistry existingChatWithHandle:allowAlternativeService:](self, "existingChatWithHandle:allowAlternativeService:", v17, v11);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v19 = MEMORY[0x1E0C809B0];
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = sub_1A2072610;
      v28[3] = &unk_1E471F9B8;
      v28[4] = self;
      v29 = v13;
      v32 = v11;
      v30 = v14;
      v31 = v15;
      v33 = a7;
      v21[0] = v19;
      v21[1] = 3221225472;
      v21[2] = sub_1A2072628;
      v21[3] = &unk_1E471F9E0;
      v22 = v30;
      v23 = v31;
      v26 = a7;
      v27 = v11;
      v24 = v29;
      v25 = self;
      -[IMChatRegistry _performSingleChatCacheLookupWithBlock:cacheMissQueryKey:queryBlock:](self, "_performSingleChatCacheLookupWithBlock:cacheMissQueryKey:queryBlock:", v28, CFSTR("ChatCache-LoadWithHandlesDisplayNameGroupID"), v21);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)existingChatWithGroupID:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[5];
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1A2072A94;
    v10[3] = &unk_1E471F8A8;
    v10[4] = self;
    v11 = v4;
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = sub_1A2072AA0;
    v8[3] = &unk_1E471F8F8;
    v8[4] = self;
    v9 = v11;
    -[IMChatRegistry _performSingleChatCacheLookupWithBlock:cacheMissQueryKey:queryBlock:](self, "_performSingleChatCacheLookupWithBlock:cacheMissQueryKey:queryBlock:", v10, CFSTR("ChatCache-LoadWithGroupID"), v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)existingChatWithDeviceIndependentID:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[IMChatRegistry existingChatWithGroupID:](self, "existingChatWithGroupID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[IMChatRegistry existingChatWithChatIdentifier:](self, "existingChatWithChatIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)existingChatWithDisplayName:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  IMChatRegistry *v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1A2072C90;
  v12[3] = &unk_1E471F8A8;
  v12[4] = self;
  v13 = v4;
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = sub_1A2072C9C;
  v9[3] = &unk_1E471F8F8;
  v10 = v13;
  v11 = self;
  v6 = v13;
  -[IMChatRegistry _performSingleChatCacheLookupWithBlock:cacheMissQueryKey:queryBlock:](self, "_performSingleChatCacheLookupWithBlock:cacheMissQueryKey:queryBlock:", v12, CFSTR("ChatCache-LoadWithGroupID"), v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)existingChatWithPinningIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  char v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v22;
  _QWORD v23[6];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  id *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint8_t buf[4];
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v28 = 0;
    v29 = (id *)&v28;
    v30 = 0x3032000000;
    v31 = sub_1A200ADA4;
    v32 = sub_1A200AC44;
    v33 = 0;
    v22 = v4;
    -[IMChatRegistry existingChatWithDeviceIndependentID:](self, "existingChatWithDeviceIndependentID:");
    v33 = (id)objc_claimAutoreleasedReturnValue();
    if (!v29[5])
    {
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      -[IMChatRegistry cachedChats](self, "cachedChats");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
      if (v6)
      {
        v7 = *(_QWORD *)v25;
        while (2)
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v25 != v7)
              objc_enumerationMutation(v5);
            v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
            if (objc_msgSend(v9, "chatStyle") != 45)
            {
              objc_msgSend(v9, "displayName");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v10, "length"))
              {

              }
              else
              {
                objc_msgSend(v9, "participants");
                v11 = (void *)objc_claimAutoreleasedReturnValue();
                -[IMChatRegistry _sortedParticipantIDHashForParticipants:usesPersonCentricID:](self, "_sortedParticipantIDHashForParticipants:usesPersonCentricID:", v11, 0);
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                v13 = objc_msgSend(v12, "isEqualToString:", v22);

                if (v13)
                {
                  objc_storeStrong(v29 + 5, v9);
                  goto LABEL_17;
                }
              }
            }
          }
          v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
          if (v6)
            continue;
          break;
        }
      }
LABEL_17:

    }
    -[IMChatRegistry daemonController](self, "daemonController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "processCapabilities");

    v17 = v29[5];
    if (!v17 && (v16 & 4) != 0)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v35 = v22;
          _os_log_impl(&dword_1A1FF4000, v18, OS_LOG_TYPE_INFO, "Cache miss for existingChatWithPinningIdentifier %@", buf, 0xCu);
        }

      }
      -[IMChatRegistry daemonController](self, "daemonController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "synchronousRemoteDaemon");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = sub_1A20730F8;
      v23[3] = &unk_1E471FA08;
      v23[4] = self;
      v23[5] = &v28;
      objc_msgSend(v20, "loadChatsWithPinningIdentifier:reply:", v22, v23);

      v17 = v29[5];
    }
    v14 = v17;
    _Block_object_dispose(&v28, 8);

    v4 = v22;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)existingChatWithPersonID:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  IMChatRegistry *v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  if (IMSharedHelperPersonCentricMergingEnabled() && objc_msgSend(v4, "length"))
  {
    v5 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1A207323C;
    v11[3] = &unk_1E471F8A8;
    v11[4] = self;
    v12 = v4;
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = sub_1A2073248;
    v8[3] = &unk_1E471F8F8;
    v9 = v12;
    v10 = self;
    -[IMChatRegistry _performSingleChatCacheLookupWithBlock:cacheMissQueryKey:queryBlock:](self, "_performSingleChatCacheLookupWithBlock:cacheMissQueryKey:queryBlock:", v11, CFSTR("ChatCache-LoadWithGroupID"), v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)existingChatWithAddresses:(id)a3 allowAlternativeService:(BOOL)a4 bestHandles:(id *)a5
{
  _BOOL4 v5;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  NSObject *v20;
  void *v21;
  id *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v23 = a5;
  v5 = a4;
  v32 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v24 = v7;
  if (v5)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v24;
        _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "allowAlternativeService is YES, attempting to find better handles for addresses: %@", buf, 0xCu);
      }

    }
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v24, "count"));
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v10 = v24;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v26 != v12)
            objc_enumerationMutation(v10);
          objc_msgSend(MEMORY[0x1E0D397A8], "validateAndCleanupID:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i), v23);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMChatRegistry contactStore](self, "contactStore");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "fetchCNContactForHandleWithID:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
            objc_msgSend(v9, "addObject:", v16);

        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v11);
    }

    -[IMChatRegistry existingChatWithContacts:bestHandles:](self, "existingChatWithContacts:bestHandles:", v9, v23);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = v7;
    v19 = objc_msgSend(v7, "count");
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v18;
        _os_log_impl(&dword_1A1FF4000, v20, OS_LOG_TYPE_INFO, "existingChatWithAddresses: %@", buf, 0xCu);
      }

      v18 = v24;
    }
    IMFindExistingChatForAddresses(v18, 0, v19 > 1, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v21;
    if (v23)
    {
      objc_msgSend(v21, "participants");
      *v23 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v17;
}

- (id)existingChatWithContacts:(id)a3 bestHandles:(id *)a4
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  __int128 *p_buf;
  id *v13;
  __int128 buf;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v5;
      _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "Finding existing chat for contacts: %@", (uint8_t *)&buf, 0xCu);
    }

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v15 = 0x3032000000;
  v16 = sub_1A200ADA4;
  v17 = sub_1A200AC44;
  v18 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1A20737FC;
  v10[3] = &unk_1E471FA30;
  v7 = v5;
  p_buf = &buf;
  v13 = a4;
  v11 = v7;
  +[IMHandle bestHandlesForContacts:useExtendedAsyncLookup:completion:](IMHandle, "bestHandlesForContacts:useExtendedAsyncLookup:completion:", v7, 0, v10);
  v8 = *(id *)(*((_QWORD *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);
  return v8;
}

- (void)_loadChatsFilteredUsingPredicate:(id)a3 lastMessageOlderThan:(id)a4 limit:(unint64_t)a5 waitForReply:(BOOL)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  BOOL v21;

  v12 = a7;
  v13 = a4;
  v14 = a3;
  -[IMChatRegistry daemonController](self, "daemonController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (a6)
    objc_msgSend(v15, "synchronousRemoteDaemon");
  else
    objc_msgSend(v15, "remoteDaemon");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_1A207428C;
  v19[3] = &unk_1E471FA58;
  v19[4] = self;
  v20 = v12;
  v21 = a6;
  v18 = v12;
  objc_msgSend(v17, "loadChatsFilteredUsingPredicate:lastMessageOlderThan:limit:reply:", v14, v13, a5, v19);

}

- (id)_earliestLastMessageDateFromChatDictionaries:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v12[7];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_1A200ADA4;
  v21 = sub_1A200AC44;
  v22 = 0;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v23, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v14;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v8);
        v12[0] = v7;
        v12[1] = 3221225472;
        v12[2] = sub_1A20745BC;
        v12[3] = &unk_1E471FA80;
        v12[4] = self;
        v12[5] = v9;
        v12[6] = &v17;
        objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v12);
        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v23, 16);
    }
    while (v5);
  }

  v10 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v10;
}

- (id)_lastMessageDateForQueryFromChatDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("lastMessageRecordDateForQuery"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("lastMessage"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("time"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && (objc_msgSend(v6, "doubleValue"), v8 > 10.0))
    {
      v9 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v7, "doubleValue");
      objc_msgSend(v9, "dateWithTimeIntervalSinceReferenceDate:");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

- (void)_loadAllSiblingChatsForHandlesAssociatedWithChats:(id)a3 waitForReply:(BOOL)a4 completionHandler:(id)a5
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  uint64_t v40;
  id obj;
  uint64_t v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  _QWORD v50[5];
  id v51;
  BOOL v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint8_t buf[4];
  id v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _QWORD v73[2];
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v36 = a5;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  obj = v6;
  v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
  if (v42)
  {
    v40 = *(_QWORD *)v66;
    v46 = *MEMORY[0x1E0C967C0];
    v45 = *MEMORY[0x1E0C966A8];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v66 != v40)
        {
          v9 = v8;
          objc_enumerationMutation(obj);
          v8 = v9;
        }
        v43 = v8;
        v10 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v8);
        if (objc_msgSend(v10, "chatStyle", v36) == 45)
        {
          v63 = 0u;
          v64 = 0u;
          v61 = 0u;
          v62 = 0u;
          objc_msgSend(v10, "participants");
          v44 = (id)objc_claimAutoreleasedReturnValue();
          v48 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v61, v74, 16);
          if (v48)
          {
            v47 = *(_QWORD *)v62;
            do
            {
              for (i = 0; i != v48; ++i)
              {
                if (*(_QWORD *)v62 != v47)
                  objc_enumerationMutation(v44);
                v49 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
                v73[0] = v46;
                v73[1] = v45;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 2);
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v49, "cnContactWithKeys:", v12);
                v13 = (void *)objc_claimAutoreleasedReturnValue();

                v59 = 0u;
                v60 = 0u;
                v58 = 0u;
                v57 = 0u;
                objc_msgSend(v13, "emailAddresses");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v57, v72, 16);
                if (v15)
                {
                  v16 = *(_QWORD *)v58;
                  do
                  {
                    for (j = 0; j != v15; ++j)
                    {
                      if (*(_QWORD *)v58 != v16)
                        objc_enumerationMutation(v14);
                      objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * j), "value");
                      v18 = (void *)objc_claimAutoreleasedReturnValue();
                      IMCanonicalFormForEmail();
                      v19 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v19)
                        objc_msgSend(v7, "addObject:", v19);

                    }
                    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v57, v72, 16);
                  }
                  while (v15);
                }

                v55 = 0u;
                v56 = 0u;
                v53 = 0u;
                v54 = 0u;
                objc_msgSend(v13, "phoneNumbers");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v53, v71, 16);
                if (v21)
                {
                  v22 = *(_QWORD *)v54;
                  do
                  {
                    for (k = 0; k != v21; ++k)
                    {
                      if (*(_QWORD *)v54 != v22)
                        objc_enumerationMutation(v20);
                      objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * k), "value");
                      v24 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v24, "stringValue");
                      v25 = (void *)objc_claimAutoreleasedReturnValue();
                      IMFormatPhoneNumber();
                      v26 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v26)
                      {
                        objc_msgSend(v7, "addObject:", v26);
                        IMChatCanonicalIDSIDsForAddress();
                        v27 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v27, "_stripFZIDPrefix");
                        v28 = (void *)objc_claimAutoreleasedReturnValue();

                        if (v28 && (objc_msgSend(v26, "isEqualToString:", v28) & 1) == 0)
                          objc_msgSend(v7, "addObject:", v28);

                      }
                    }
                    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v53, v71, 16);
                  }
                  while (v21);
                }

                objc_msgSend(v49, "ID");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "addObject:", v29);

              }
              v48 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v61, v74, 16);
            }
            while (v48);
          }

        }
        v8 = v43 + 1;
      }
      while (v43 + 1 != v42);
      v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
    }
    while (v42);
  }

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v70 = v7;
      _os_log_impl(&dword_1A1FF4000, v30, OS_LOG_TYPE_INFO, "Fetching sibling chats with handles %@", buf, 0xCu);
    }

  }
  -[IMChatRegistry daemonController](self, "daemonController", v36);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (a4)
    objc_msgSend(v31, "synchronousRemoteDaemon");
  else
    objc_msgSend(v31, "remoteDaemon");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "allObjects");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = sub_1A2074CA8;
  v50[3] = &unk_1E471FA58;
  v52 = a4;
  v50[4] = self;
  v51 = v37;
  v35 = v37;
  objc_msgSend(v33, "loadAnyChatsContainingHandleIDsIn:reply:", v34, v50);

}

- (void)updateEarliestMessageDateForChats:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(_QWORD);
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v5 = a3;
  v6 = (void (**)(_QWORD))a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1A2074F0C;
  v15[3] = &unk_1E471FAA8;
  v9 = v7;
  v16 = v9;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v15);
  +[IMDaemonController sharedController](IMDaemonController, "sharedController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "synchronousRemoteDaemon");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = sub_1A2074F50;
  v13[3] = &unk_1E471E750;
  v14 = v5;
  v12 = v5;
  objc_msgSend(v11, "fetchEarliestMessageDateForChatsWithGUIDs:completion:", v9, v13);

  if (v6)
    v6[2](v6);

}

- (void)_validateChatQueryResults:(id)a3 matchCurrentCacheResults:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t i;
  NSObject *v12;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!objc_msgSend(v5, "count") && !objc_msgSend(v6, "count"))
    goto LABEL_23;
  if (!objc_msgSend(v5, "count") && objc_msgSend(v6, "count"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v20 = v6;
        v21 = 2112;
        v22 = v5;
        _os_log_impl(&dword_1A1FF4000, v12, OS_LOG_TYPE_INFO, "Chat cache now has chats, but query didn't explictly populate it, cache: %@ query: %@", buf, 0x16u);
      }

    }
    goto LABEL_23;
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (!v8)
  {

LABEL_19:
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v20 = v6;
        v21 = 2112;
        v22 = v7;
        _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "Chat cache does not have results returned from daemon in cache miss query, cache: %@ query: %@", buf, 0x16u);
      }

    }
    goto LABEL_23;
  }
  v9 = 0;
  v10 = *(_QWORD *)v15;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v15 != v10)
        objc_enumerationMutation(v7);
      v9 |= objc_msgSend(v6, "containsObjectIdenticalTo:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14);
    }
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  }
  while (v8);

  if ((v9 & 1) == 0)
    goto LABEL_19;
LABEL_23:

}

- (id)_existingChatWithIdentifier:(id)a3 style:(unsigned __int8)a4 service:(id)a5
{
  void *v5;
  void *v7;

  v5 = 0;
  if (a3 && a5)
  {
    v7 = (void *)IMCopyGUIDForChat();
    -[IMChatRegistry existingChatWithGUID:](self, "existingChatWithGUID:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)_existingChatWithIdentifier:(id)a3 style:(unsigned __int8)a4 account:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t v19[16];

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = v9;
  v11 = 0;
  if (v8 && v9)
  {
    v12 = (void *)IMCopyThreadNameForChat();
    if (!v12
      || (-[IMChatRegistry threadNameToChatMap](self, "threadNameToChatMap"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v13, "objectForKey:", v12),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v13,
          !v11))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v19 = 0;
          _os_log_impl(&dword_1A1FF4000, v14, OS_LOG_TYPE_INFO, " ==> lookup with accountUniqueID failed, looking up with service", v19, 2u);
        }

      }
      +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "accountForUniqueID:", v10);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "serviceName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMChatRegistry _existingChatWithIdentifier:style:service:](self, "_existingChatWithIdentifier:style:service:", v8, v6, v17);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v11;
}

- (id)_existingChatForHandleUsingPersonID:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IMChatRegistry contactStore](self, "contactStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isBatchFetchingForLaunchCompleted");

  if (v6)
  {
    objc_msgSend(v4, "cnContactWithKeys:", MEMORY[0x1E0C9AA60]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)objc_msgSend(v8, "length");
    if (v9)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          v13 = 138412290;
          v14 = v8;
          _os_log_impl(&dword_1A1FF4000, v10, OS_LOG_TYPE_INFO, "Attempting to look up chat using PersonID: %@", (uint8_t *)&v13, 0xCu);
        }

      }
      -[IMChatRegistry existingChatWithPersonID:](self, "existingChatWithPersonID:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v11 = v9;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_existingChatFromSiblingsForHandle:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "_chatSiblingsArray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v5;
      _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_DEBUG, " => siblings: %@", buf, 0xCu);
    }

  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v18;
LABEL_7:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v9)
        objc_enumerationMutation(v7);
      v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v10);
      objc_msgSend(v11, "ID", (_QWORD)v17);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "service");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "internalName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMChatRegistry _existingChatWithIdentifier:style:service:](self, "_existingChatWithIdentifier:style:service:", v12, 45, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v8)
          goto LABEL_7;
        goto LABEL_13;
      }
    }
  }
  else
  {
LABEL_13:
    v15 = 0;
  }

  return v15;
}

- (id)_existingChatWithHandle:(id)a3 fixChatHandle:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v4 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (qword_1EE65F468 != -1)
    dispatch_once(&qword_1EE65F468, &unk_1E471FBA8);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = (id)qword_1EE65F460;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v6, "ID", (_QWORD)v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "internalName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMChatRegistry _existingChatWithIdentifier:style:service:](self, "_existingChatWithIdentifier:style:service:", v12, 45, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {

          goto LABEL_21;
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
      if (v8)
        continue;
      break;
    }
  }

  if (IMSharedHelperContactsBasedMergingEnabled())
  {
    -[IMChatRegistry _existingChatForHandleUsingPersonID:](self, "_existingChatForHandleUsingPersonID:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14 && v4)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v22 = v14;
          _os_log_impl(&dword_1A1FF4000, v15, OS_LOG_TYPE_INFO, "Found a chat using PersonID: %@ ", buf, 0xCu);
        }

      }
      objc_msgSend(v14, "setRecipient:", v6, (_QWORD)v17);
    }
  }
  else
  {
    v14 = 0;
  }
LABEL_21:

  return v14;
}

- (void)moveMessagesWithGUIDsToRecentlyDeleted:(id)a3 deleteDate:(id)a4 synchronously:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  BOOL v25;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[IMChatRegistry daemonQueryController](self, "daemonQueryController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = sub_1A2075EF4;
  v22[3] = &unk_1E471FBD0;
  v25 = v7;
  v22[4] = self;
  v23 = v10;
  v24 = v11;
  v18[0] = v14;
  v18[1] = 3221225472;
  v18[2] = sub_1A2075F78;
  v18[3] = &unk_1E471FBF8;
  v19 = v23;
  v20 = v24;
  v21 = v12;
  v15 = v12;
  v16 = v24;
  v17 = v23;
  objc_msgSend(v13, "performQueryWithKey:expectsSynchronousResult:block:completionHandler:", CFSTR("RecentlyDeleted-MoveMessagesWithGUIDsToRecovery"), v7, v22, v18);

}

- (void)moveMessagesInChatsToRecentlyDeleted:(id)a3 deleteDate:(id)a4 synchronously:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  BOOL v29;
  _QWORD v30[4];
  id v31;
  IMChatRegistry *v32;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v14 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = sub_1A2076260;
  v30[3] = &unk_1E471FC20;
  v31 = v13;
  v32 = self;
  v15 = v13;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v30);
  objc_msgSend(v15, "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMChatRegistry daemonQueryController](self, "daemonQueryController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v14;
  v26[1] = 3221225472;
  v26[2] = sub_1A20762BC;
  v26[3] = &unk_1E471FBD0;
  v29 = v7;
  v26[4] = self;
  v27 = v16;
  v28 = v11;
  v22[0] = v14;
  v22[1] = 3221225472;
  v22[2] = sub_1A2076340;
  v22[3] = &unk_1E471FBF8;
  v23 = v10;
  v24 = v28;
  v25 = v12;
  v18 = v12;
  v19 = v28;
  v20 = v10;
  v21 = v16;
  objc_msgSend(v17, "performQueryWithKey:expectsSynchronousResult:block:completionHandler:", CFSTR("RecentlyDeleted-MoveMessagesInChatsToRecovery"), v7, v26, v22);

}

- (void)recoverMessagesForChats:(id)a3 synchronously:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  BOOL v24;
  _QWORD v25[4];
  id v26;
  IMChatRegistry *v27;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v11 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = sub_1A20766DC;
  v25[3] = &unk_1E471FC20;
  v26 = v10;
  v27 = self;
  v12 = v10;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v25);
  objc_msgSend(v12, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMChatRegistry daemonQueryController](self, "daemonQueryController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v11;
  v22[1] = 3221225472;
  v22[2] = sub_1A2076720;
  v22[3] = &unk_1E471FC48;
  v24 = v6;
  v22[4] = self;
  v23 = v13;
  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = sub_1A20767A4;
  v18[3] = &unk_1E471FBF8;
  v19 = v8;
  v20 = v23;
  v21 = v9;
  v15 = v9;
  v16 = v23;
  v17 = v8;
  objc_msgSend(v14, "performQueryWithKey:expectsSynchronousResult:block:completionHandler:", CFSTR("RecentlyDeleted-RecoverMessages"), v6, v22, v18);

}

- (void)permanentlyDeleteRecoverableMessagesInChats:(id)a3 synchronously:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  BOOL v23;
  _QWORD v24[4];
  id v25;
  IMChatRegistry *v26;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v11 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = sub_1A2076C64;
  v24[3] = &unk_1E471FC20;
  v25 = v10;
  v26 = self;
  v12 = v10;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v24);
  objc_msgSend(v12, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMChatRegistry daemonQueryController](self, "daemonQueryController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v9;
  v21[0] = v11;
  v21[1] = 3221225472;
  v21[2] = sub_1A2076CA8;
  v21[3] = &unk_1E471FC48;
  v23 = v6;
  v21[4] = self;
  v22 = v13;
  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = sub_1A2076D2C;
  v18[3] = &unk_1E471FD08;
  v19 = v8;
  v15 = v9;
  v16 = v8;
  v17 = v13;
  objc_msgSend(v14, "performQueryWithKey:expectsSynchronousResult:block:completionHandler:", CFSTR("RecentlyDeleted-PermanentlyDeleteRecoverableMessages"), v6, v21, v18);

}

- (void)enumerateAllChatsAndAttachmentSizesWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  +[IMChatRegistry sharedRegistry](IMChatRegistry, "sharedRegistry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "numberOfCachedChats");

  if (v7)
  {
    IMDAttachmentFindLargestConversations();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v8;
        _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_INFO, "Found dbLargestConversations: %@", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1A8582D94]();
    v12 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = sub_1A20A8898;
    v21[3] = &unk_1E47209A0;
    v21[4] = self;
    v13 = v10;
    v22 = v13;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v21);

    objc_autoreleasePoolPop(v11);
    v14 = (void *)MEMORY[0x1A8582D94]();
    objc_msgSend(v13, "keysSortedByValueUsingComparator:", &unk_1E471D758);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v14);
    v18[0] = v12;
    v18[1] = 3221225472;
    v18[2] = sub_1A20A8A58;
    v18[3] = &unk_1E47209E8;
    v18[4] = self;
    v19 = v13;
    v20 = v5;
    v16 = v13;
    objc_msgSend(v15, "enumerateObjectsUsingBlock:", v18);

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v17, OS_LOG_TYPE_INFO, "No cached chats are loaded -- client has likely not received setup. Skipping largest conversation load.", buf, 2u);
    }

  }
}

- (id)chatForIMHandle:(id)a3
{
  return -[IMChatRegistry chatWithHandle:lastAddressedHandle:lastAddressedSIMID:](self, "chatWithHandle:lastAddressedHandle:lastAddressedSIMID:", a3, 0, 0);
}

- (id)chatForIMHandles:(id)a3
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_chatWithHandles_lastAddressedHandle_lastAddressedSIMID_);
}

- (id)chatForIMHandles:(id)a3 lastAddressedHandle:(id)a4 lastAddressedSIMID:(id)a5
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_chatWithHandles_displayName_joinedChatsOnly_lastAddressedHandle_lastAddressedSIMID_);
}

- (id)chatForIMHandles:(id)a3 displayName:(id)a4 joinedChatsOnly:(BOOL)a5
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_chatWithHandles_displayName_joinedChatsOnly_lastAddressedHandle_lastAddressedSIMID_);
}

- (id)chatForIMHandles:(id)a3 displayName:(id)a4 joinedChatsOnly:(BOOL)a5 lastAddressedHandle:(id)a6 lastAddressedSIMID:(id)a7
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_chatWithHandles_displayName_joinedChatsOnly_lastAddressedHandle_lastAddressedSIMID_);
}

- (id)chatForIMHandles:(id)a3 chatName:(id)a4
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_chatForIMHandles_chatName_lastAddressedHandle_lastAddressedSIMID_);
}

- (id)chatForIMHandles:(id)a3 chatName:(id)a4 lastAddressedHandle:(id)a5 lastAddressedSIMID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  int v18;
  unint64_t v19;
  NSObject *v20;
  id v21;
  int v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  uint64_t v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v33 = v10;
      v34 = 2112;
      v35 = v11;
      _os_log_impl(&dword_1A1FF4000, v14, OS_LOG_TYPE_DEBUG, "handles: %@  name: %@", buf, 0x16u);
    }

  }
  objc_msgSend(v10, "lastObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "service");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v16, "maxChatParticipantsForHandle:simID:", v12, v13);
  v18 = v17;
  if (v17 >= 1)
  {
    v19 = objc_msgSend(v10, "count");
    if (v19 > objc_msgSend(v16, "maxChatParticipantsForHandle:simID:", v12, v13))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v33) = v18;
          _os_log_impl(&dword_1A1FF4000, v20, OS_LOG_TYPE_INFO, "Failing to invite participants that would put us over our max size of: %d", buf, 8u);
        }

      }
      v21 = 0;
      goto LABEL_39;
    }
  }
  -[IMChatRegistry existingChatForIMHandles:](self, "existingChatForIMHandles:", v10);
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v22 = IMOSLoggingEnabled();
  if (v21)
  {
    if (v22)
    {
      OSLogHandleForIMFoundationCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v33 = v21;
        _os_log_impl(&dword_1A1FF4000, v23, OS_LOG_TYPE_INFO, "Found existing chat: %@", buf, 0xCu);
      }

    }
    goto LABEL_39;
  }
  if (v22)
  {
    OSLogHandleForIMFoundationCategory();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v24, OS_LOG_TYPE_INFO, "No chat found", buf, 2u);
    }

  }
  objc_msgSend(v10, "lastObject");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "account");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMChatRegistry _possiblyUnregisteredCachedChatWithHandles:style:groupID:displayName:joinedChatsOnly:](self, "_possiblyUnregisteredCachedChatWithHandles:style:groupID:displayName:joinedChatsOnly:", v10, 43, 0, 0, 0);
  v21 = (id)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v33 = v21;
        _os_log_impl(&dword_1A1FF4000, v27, OS_LOG_TYPE_INFO, "Found created chat: %@", buf, 0xCu);
      }
LABEL_29:

    }
  }
  else
  {
    BYTE2(v31) = 0;
    LOWORD(v31) = 0;
    v21 = -[IMChat _initWithGUID:account:style:roomName:displayName:lastAddressedHandle:lastAddressedSIMID:items:participants:isFiltered:hasHadSuccessfulQuery:isRecovered:isDeletingIncomingMessages:]([IMChat alloc], "_initWithGUID:account:style:roomName:displayName:lastAddressedHandle:lastAddressedSIMID:items:participants:isFiltered:hasHadSuccessfulQuery:isRecovered:isDeletingIncomingMessages:", 0, v26, 43, 0, 0, v12, v13, 0, v10, 1, v31);
    objc_msgSend(v21, "_setupObservation");
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v33 = v21;
        _os_log_impl(&dword_1A1FF4000, v27, OS_LOG_TYPE_INFO, "Created chat: %@", buf, 0xCu);
      }
      goto LABEL_29;
    }
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v21;
      _os_log_impl(&dword_1A1FF4000, v28, OS_LOG_TYPE_INFO, "Registering outgoing chat: %@", buf, 0xCu);
    }

  }
  -[IMChatRegistry _registerChat:isIncoming:guid:](self, "_registerChat:isIncoming:guid:", v21, 0, 0);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v21;
      _os_log_impl(&dword_1A1FF4000, v29, OS_LOG_TYPE_INFO, "Joining chat: %@", buf, 0xCu);
    }

  }
  objc_msgSend(v21, "join");

LABEL_39:
  return v21;
}

- (id)chatForRoom:(id)a3 onAccount:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v18 = v6;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_DEBUG, "roomName: %@  account: %@", buf, 0x16u);
    }

  }
  if (v7)
  {
    objc_msgSend(v7, "chatIDForRoomName:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v9;
        _os_log_impl(&dword_1A1FF4000, v10, OS_LOG_TYPE_INFO, "Account pushed room name to: %@", buf, 0xCu);
      }

    }
  }
  else
  {
    v9 = v6;
  }
  -[IMChatRegistry existingChatForRoom:onAccount:](self, "existingChatForRoom:onAccount:", v9, v7);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v11;
        _os_log_impl(&dword_1A1FF4000, v12, OS_LOG_TYPE_INFO, "Found existing chat: %@", buf, 0xCu);
      }

    }
    goto LABEL_30;
  }
  -[IMChatRegistry _possiblyUnregisteredCachedChatForRoom:onAccount:](self, "_possiblyUnregisteredCachedChatForRoom:onAccount:", v9, v7);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v11;
        _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "Found created chat: %@", buf, 0xCu);
      }
LABEL_24:

    }
  }
  else
  {
    BYTE2(v16) = 0;
    LOWORD(v16) = 0;
    v11 = -[IMChat _initWithGUID:account:style:roomName:displayName:lastAddressedHandle:lastAddressedSIMID:items:participants:isFiltered:hasHadSuccessfulQuery:isRecovered:isDeletingIncomingMessages:]([IMChat alloc], "_initWithGUID:account:style:roomName:displayName:lastAddressedHandle:lastAddressedSIMID:items:participants:isFiltered:hasHadSuccessfulQuery:isRecovered:isDeletingIncomingMessages:", 0, v7, 35, v9, 0, 0, 0, 0, 0, 1, v16);
    objc_msgSend(v11, "_setupObservation");
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v11;
        _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "Created chat: %@", buf, 0xCu);
      }
      goto LABEL_24;
    }
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v11;
      _os_log_impl(&dword_1A1FF4000, v14, OS_LOG_TYPE_INFO, "Registering chat: %@", buf, 0xCu);
    }

  }
  -[IMChatRegistry _registerChat:isIncoming:guid:](self, "_registerChat:isIncoming:guid:", v11, 0, 0);
LABEL_30:

  return v11;
}

- (unint64_t)numberOfExistingChats
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[IMChatRegistry simulatedChats](self, "simulatedChats");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    -[IMChatRegistry simulatedChats](self, "simulatedChats");
  else
    -[IMChatRegistry cachedChatsInThreadNameMap](self, "cachedChatsInThreadNameMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (NSArray)allExistingChats
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[IMChatRegistry simulatedChats](self, "simulatedChats");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[IMChatRegistry cachedChatsInThreadNameMap](self, "cachedChatsInThreadNameMap");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSArray *)v6;
}

- (id)existingChatForIMHandle:(id)a3
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_existingChatForIMHandle_allowRetargeting_);
}

- (id)existingChatForIMHandles:(id)a3
{
  return -[IMChatRegistry existingChatForIMHandles:allowRetargeting:groupID:displayName:joinedChatsOnly:](self, "existingChatForIMHandles:allowRetargeting:groupID:displayName:joinedChatsOnly:", a3, 1, 0, 0, 0);
}

- (id)existingChatForRoom:(id)a3 onAccount:(id)a4
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_existingChatForRoom_onAccount_allowRetargeting_);
}

- (id)existingChatForIMHandles:(id)a3 allowRetargeting:(BOOL)a4 groupID:(id)a5 displayName:(id)a6 joinedChatsOnly:(BOOL)a7
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_existingChatForIMHandles_allowRetargeting_groupID_displayName_ignoresDisplayName_joinedChatsOnly_);
}

- (id)existingChatForIMHandles:(id)a3 allowRetargeting:(BOOL)a4
{
  return -[IMChatRegistry existingChatForIMHandles:allowRetargeting:groupID:displayName:joinedChatsOnly:](self, "existingChatForIMHandles:allowRetargeting:groupID:displayName:joinedChatsOnly:", a3, a4, 0, 0, 0);
}

- (id)existingChatForRoom:(id)a3 onAccount:(id)a4 allowRetargeting:(BOOL)a5
{
  id v7;
  void *v8;
  void *v9;

  v7 = a3;
  objc_msgSend(a4, "uniqueID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMChatRegistry _existingChatWithIdentifier:style:account:](self, "_existingChatWithIdentifier:style:account:", v7, 35, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)existingChatForIMHandles:(id)a3 allowRetargeting:(BOOL)a4 groupID:(id)a5 displayName:(id)a6 ignoresDisplayName:(BOOL)a7 joinedChatsOnly:(BOOL)a8
{
  id v11;
  NSObject *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  int v29;
  id v30;
  id v33;
  _BOOL4 v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t v40[128];
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;
  __int16 v47;
  const __CFString *v48;
  uint64_t v49;

  v34 = a8;
  v49 = *MEMORY[0x1E0C80C00];
  v33 = a3;
  v35 = a5;
  v11 = a6;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v33, "arrayByApplyingSelector:", &sel_ID);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("NO");
      *(_DWORD *)buf = 138413058;
      v42 = v13;
      if (v34)
        v14 = CFSTR("YES");
      v43 = 2112;
      v44 = v35;
      v45 = 2112;
      v46 = v11;
      v47 = 2112;
      v48 = v14;
      _os_log_impl(&dword_1A1FF4000, v12, OS_LOG_TYPE_DEBUG, "existingChatForHandles: %@  groupID: %@ displayName %@ isJoined %@ ", buf, 0x2Au);

    }
  }
  if (objc_msgSend(v33, "count"))
  {
    if (objc_msgSend(v11, "length"))
      v15 = v11;
    else
      v15 = 0;
    v16 = v15;

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    -[IMChatRegistry cachedChatsInThreadNameMap](self, "cachedChatsInThreadNameMap");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v37;
LABEL_13:
      v20 = 0;
      while (1)
      {
        if (*(_QWORD *)v37 != v19)
          objc_enumerationMutation(v17);
        v21 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v20);
        if (objc_msgSend(v21, "chatStyle") != 43)
          goto LABEL_33;
        objc_msgSend(v21, "displayName");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v22, "length"))
          v23 = v22;
        else
          v23 = 0;
        v24 = v23;

        if (!objc_msgSend(v35, "length"))
          goto LABEL_23;
        if (!(v24 | v16))
          goto LABEL_28;
        objc_msgSend(v21, "groupID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v35, "isEqualToString:", v25);

        if (v26)
        {
LABEL_23:
          if (a7)
            goto LABEL_28;
          if (v24)
          {
            if ((objc_msgSend((id)v24, "isEqualToString:", v16) & 1) != 0)
              goto LABEL_28;
          }
          else if (!v16)
          {
LABEL_28:
            if (!v34 || objc_msgSend(v21, "joinState") >= 2)
            {
              v27 = (void *)MEMORY[0x1A8582D94]();
              objc_msgSend(v21, "participants");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = objc_msgSend(v33, "equivalentToRecipients:", v28);

              if (v29)
              {
                v30 = v21;
                objc_autoreleasePoolPop(v27);

                goto LABEL_38;
              }
              objc_autoreleasePoolPop(v27);
            }
          }
        }

LABEL_33:
        if (v18 == ++v20)
        {
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
          if (v18)
            goto LABEL_13;
          break;
        }
      }
    }
    v30 = 0;
LABEL_38:

    v11 = (id)v16;
  }
  else
  {
    v30 = 0;
  }

  return v30;
}

- (id)existingChatForIMHandle:(id)a3 allowRetargeting:(BOOL)a4
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_existingChatForIMHandle_allowRetargeting_fixChatHandle_);
}

- (id)existingChatForIMHandle:(id)a3 allowRetargeting:(BOOL)a4 fixChatHandle:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v13;
  id v14;
  uint64_t v15;

  v5 = a5;
  v6 = a4;
  v15 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v13 = 138412290;
      v14 = v8;
      _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_DEBUG, "handle: %@", (uint8_t *)&v13, 0xCu);
    }

  }
  -[IMChatRegistry _existingChatWithHandle:fixChatHandle:](self, "_existingChatWithHandle:fixChatHandle:", v8, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v6)
    objc_msgSend(v10, "setRecipient:", v8);

  return v11;
}

- (id)existingChatForIMHandles:(id)a3 allowRetargeting:(BOOL)a4 groupID:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v6 = a4;
  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v8, "arrayByApplyingSelector:", &sel_ID);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = v11;
      v16 = 2112;
      v17 = v9;
      _os_log_impl(&dword_1A1FF4000, v10, OS_LOG_TYPE_DEBUG, "handles: %@  groupID: %@", (uint8_t *)&v14, 0x16u);

    }
  }
  -[IMChatRegistry existingChatForIMHandles:allowRetargeting:groupID:displayName:joinedChatsOnly:](self, "existingChatForIMHandles:allowRetargeting:groupID:displayName:joinedChatsOnly:", v8, v6, v9, 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)unblackholeAndLoadChatWithIMHandles:(id)a3
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_unblackholeChatWithHandles_);
}

+ (id)performanceLogHandle
{
  if (qword_1EE65EA68 != -1)
    dispatch_once(&qword_1EE65EA68, &unk_1E471D8D8);
  return (id)qword_1EE65EA70;
}

- (id)performanceLogHandle
{
  uint64_t v2;

  v2 = objc_opt_class();
  return (id)MEMORY[0x1E0DE7D20](v2, sel_performanceLogHandle);
}

+ (IMChatRegistry)sharedRegistryIfAvailable
{
  void *v3;

  if ((IMIsRunningInIMDPersistenceAgent() & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(a1, "sharedRegistry");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (IMChatRegistry *)v3;
}

+ (void)setMessageClass:(Class)a3
{
  qword_1ECF12368 = (uint64_t)a3;
}

- (void)_noteChatDealloc:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "_shouldRegisterChat"))
    -[NSMutableArray removeObjectIdenticalTo:](self->_allChatsInProcess, "removeObjectIdenticalTo:", v4);

}

- (IMChatRegistry)init
{
  return (IMChatRegistry *)-[IMChatRegistry initAsListener:](self, "initAsListener:", 0);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, 0, 0);

  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "listener");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeHandler:", self);

  v6.receiver = self;
  v6.super_class = (Class)IMChatRegistry;
  -[IMChatRegistry dealloc](&v6, sel_dealloc);
}

- (IMDaemonProtocol)remoteDaemon
{
  return (IMDaemonProtocol *)+[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
}

- (IMSharedWithYouManager)sharedWithYouManager
{
  return (IMSharedWithYouManager *)objc_msgSend(MEMORY[0x1E0D39AE8], "sharedManager");
}

- (void)_registerChatDictionary:(id)a3 forChat:(id)a4 isIncoming:(BOOL)a5 newGUID:(id)a6
{
  -[IMChatRegistry _registerChatDictionary:forChat:isIncoming:newGUID:shouldPostNotification:](self, "_registerChatDictionary:forChat:isIncoming:newGUID:shouldPostNotification:", a3, a4, a5, a6, 1);
}

- (void)_registerChat:(id)a3 isIncoming:(BOOL)a4 guid:(id)a5
{
  -[IMChatRegistry _registerChatDictionary:forChat:isIncoming:newGUID:](self, "_registerChatDictionary:forChat:isIncoming:newGUID:", 0, a3, a4, a5);
}

- (void)unregisterChat:(id)a3
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1A1FF4000, v4, OS_LOG_TYPE_INFO, "This call is deprecated, and doesn't do anything anymore, please file bugs if you need some behavior here", v5, 2u);
    }

  }
}

- (void)unregisterChatWithGUID:(id)a3
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1A1FF4000, v4, OS_LOG_TYPE_INFO, "This call is deprecated, and doesn't do anything anymore, please file bugs if you need some behavior here", v5, 2u);
    }

  }
}

- (void)_unregisterChat:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v4;
        _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Unregistering chat: %@", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "__mainThreadPostNotificationName:object:", CFSTR("__kIMChatRegistryWillUnregisterChatNotification"), v4);

    -[IMChatRegistry allGUIDsForChat:](self, "allGUIDsForChat:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMChatRegistry _clearMapsUsingChat:guids:](self, "_clearMapsUsingChat:guids:", v4, v7);
    objc_msgSend(v4, "didUnregisterFromRegistry:", self);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v8);
          v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "__mainThreadPostNotificationName:object:", CFSTR("__kIMChatRegistryDidUnregisterChatNotification"), v12);

        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

  }
}

- (void)_unregisterChatWithGUID:(id)a3
{
  id v4;

  -[IMChatRegistry _cachedChatWithGUID:](self, "_cachedChatWithGUID:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[IMChatRegistry _unregisterChat:](self, "_unregisterChat:", v4);

}

- (void)_clearMapsUsingChat:(id)a3 guids:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        -[NSMutableDictionary removeObjectForKey:](self->_chatGUIDToCurrentThreadMap, "removeObjectForKey:", v12);
        -[NSMutableDictionary removeObjectForKey:](self->_chatGUIDToChatMap, "removeObjectForKey:", v12);
        -[NSMutableDictionary removeObjectForKey:](self->_chatGUIDToiMessageSentOrReceivedMap, "removeObjectForKey:", v12);
        -[NSMutableDictionary removeObjectForKey:](self->_chatGUIDToInfoMap, "removeObjectForKey:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }
  -[NSMutableArray removeObjectIdenticalTo:](self->_allChatsInProcess, "removeObjectIdenticalTo:", v6);
  -[NSMutableArray removeObjectIdenticalTo:](self->_cachedChatsInThreadNameMap, "removeObjectIdenticalTo:", v6);
  -[NSMutableDictionary allKeysForObject:](self->_threadNameToChatMap, "allKeysForObject:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count"))
    -[NSMutableDictionary removeObjectsForKeys:](self->_threadNameToChatMap, "removeObjectsForKeys:", v13);
  -[NSMutableDictionary allKeysForObject:](self->_chatPersonIDToChatMap, "allKeysForObject:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "count"))
    -[NSMutableDictionary removeObjectsForKeys:](self->_chatPersonIDToChatMap, "removeObjectsForKeys:", v14);
  if (objc_msgSend(v6, "chatStyle") == 43)
  {
    -[NSMutableDictionary allKeysForObject:](self->_groupIDToChatMap, "allKeysForObject:", v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "count"))
      -[NSMutableDictionary removeObjectsForKeys:](self->_groupIDToChatMap, "removeObjectsForKeys:", v15);
    -[IMChatRegistry _removeFromGroupParticipantToChatsMap:](self, "_removeFromGroupParticipantToChatsMap:", v6);

  }
}

- (id)generateUnusedChatIdentifierForGroupChatWithAccount:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v4 = (void *)MEMORY[0x1E0D39740];
  objc_msgSend(a3, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "internalName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1A20E53F8;
  v9[3] = &unk_1E471F948;
  v9[4] = self;
  objc_msgSend(v4, "generateUnusedChatIdentifierForGroupChatWithServiceName:chatWithChatIdentifierExists:", v6, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)_hasChat:(id)a3 forService:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *chatGUIDToiMessageSentOrReceivedMap;
  id v12;
  int v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "chatIdentifier");
  chatGUIDToiMessageSentOrReceivedMap = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "internalName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "chatStyle");
  v9 = (void *)IMCopyGUIDForChat();

  -[NSMutableDictionary objectForKey:](self->_chatGUIDToChatMap, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(chatGUIDToiMessageSentOrReceivedMap) = v10 != 0;

  +[IMService iMessageService](IMServiceImpl, "iMessageService");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (v12 == v7)
    v13 = (int)chatGUIDToiMessageSentOrReceivedMap;
  else
    v13 = 0;

  if (v13 == 1)
  {
    chatGUIDToiMessageSentOrReceivedMap = self->_chatGUIDToiMessageSentOrReceivedMap;
    objc_msgSend(v6, "guid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(chatGUIDToiMessageSentOrReceivedMap, "objectForKey:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(chatGUIDToiMessageSentOrReceivedMap) = v15 != 0;

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v18 = 138412290;
        v19 = v6;
        _os_log_impl(&dword_1A1FF4000, v16, OS_LOG_TYPE_INFO, "iMessage map had entry for %@", (uint8_t *)&v18, 0xCu);
      }

    }
  }

  return (char)chatGUIDToiMessageSentOrReceivedMap;
}

- (void)_setSimulatedChats:(id)a3
{
  NSMutableDictionary *Mutable;
  NSMutableDictionary *simulatedChatGUIDToChatMap;
  id v7;
  id v8;
  _QWORD v9[5];

  v7 = a3;
  objc_storeStrong((id *)&self->_simulatedChats, a3);
  if (!self->_simulatedChatGUIDToChatMap)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    simulatedChatGUIDToChatMap = self->_simulatedChatGUIDToChatMap;
    self->_simulatedChatGUIDToChatMap = Mutable;

  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1A20E5690;
  v9[3] = &unk_1E4721E08;
  v9[4] = self;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v9, v7);

}

- (void)_removeFromGroupParticipantToChatsMap:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[NSMutableDictionary allKeys](self->_groupParticipantToChatsMap, "allKeys", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_groupParticipantToChatsMap, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "containsObject:", v4))
        {
          objc_msgSend(v12, "removeObject:", v4);
          ++v7;
          if (!objc_msgSend(v12, "count"))
            objc_msgSend(v5, "addObject:", v11);
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v8);
  }

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = objc_msgSend(v5, "count");
      *(_DWORD *)buf = 134218240;
      v20 = v7;
      v21 = 2048;
      v22 = v14;
      _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "Removed chat from %lu entries, and clearing %lu keys, from Group Participants cache", buf, 0x16u);
    }

  }
  -[NSMutableDictionary removeObjectsForKeys:](self->_groupParticipantToChatsMap, "removeObjectsForKeys:", v5);

}

- (void)_handleChatParticipantsDidChange:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSMutableDictionary *chatGUIDToChatMap;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableDictionary *chatGUIDToCurrentThreadMap;
  void *v16;
  void *v17;
  char v18;
  char v19;
  NSMutableDictionary *v20;
  void *v21;
  NSMutableDictionary *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v28 = 138412290;
      v29 = v5;
      _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "Participants changed in [%@]", (uint8_t *)&v28, 0xCu);
    }

  }
  if (v5)
  {
    objc_msgSend(v5, "invalidateHasKnownParticipantsCache");
    chatGUIDToChatMap = self->_chatGUIDToChatMap;
    objc_msgSend(v5, "guid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](chatGUIDToChatMap, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(chatGUIDToChatMap) = v9 == 0;

    if ((chatGUIDToChatMap & 1) == 0)
    {
      if (objc_msgSend(v5, "chatStyle") == 45)
      {
        objc_msgSend(v5, "recipient");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "ID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "account");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "uniqueID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)IMCopyThreadNameForChat();

        chatGUIDToCurrentThreadMap = self->_chatGUIDToCurrentThreadMap;
        objc_msgSend(v5, "guid");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKey:](chatGUIDToCurrentThreadMap, "objectForKey:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = objc_msgSend(v14, "isEqualToString:", v17);
        if (v14)
          v19 = v18;
        else
          v19 = 1;
        if ((v19 & 1) == 0)
        {
          -[NSMutableDictionary setObject:forKey:](self->_threadNameToChatMap, "setObject:forKey:", v5, v14);
          if ((-[NSMutableArray containsObjectIdenticalTo:](self->_cachedChatsInThreadNameMap, "containsObjectIdenticalTo:", v5) & 1) == 0)-[NSMutableArray addObject:](self->_cachedChatsInThreadNameMap, "addObject:", v5);
          v20 = self->_chatGUIDToCurrentThreadMap;
          objc_msgSend(v5, "guid");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](v20, "setObject:forKey:", v14, v21);

          v22 = self->_chatGUIDToChatMap;
          objc_msgSend(v5, "guid");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](v22, "setObject:forKey:", v5, v23);

        }
      }
      else
      {
        -[IMChatRegistry _removeFromGroupParticipantToChatsMap:](self, "_removeFromGroupParticipantToChatsMap:", v5);
        objc_msgSend(v5, "participants");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMChatRegistry _sortedParticipantIDHashForParticipants:](self, "_sortedParticipantIDHashForParticipants:", v24);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        -[IMChatRegistry _addChat:participantSet:](self, "_addChat:participantSet:", v5, v14);
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v5, "participants");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = 138412546;
            v29 = v14;
            v30 = 2112;
            v31 = v26;
            _os_log_impl(&dword_1A1FF4000, v25, OS_LOG_TYPE_INFO, "New participantIDHash %@ based on %@", (uint8_t *)&v28, 0x16u);

          }
        }
      }

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "postNotificationName:object:userInfo:", CFSTR("__kIMChatMultiWayStateChangedNotification"), v5, 0);

    }
  }

}

- (void)_handleAddressBookChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D37400]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMChatRegistry cachedChats](self, "cachedChats");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v13, "invalidateHasKnownParticipantsCache", (_QWORD)v14);
        objc_msgSend(v13, "_handleAddressBookChangeForRecipientUID:", v5);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (id)_ownerHandleStringsFromSubscription:(id)a3
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "ownerHandles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "handleString", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "length"))
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)chatsWithMyself
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  +[IMAccountController sharedInstance](IMAccountController, "sharedInstance", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accounts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v8);
        +[IMChatRegistry sharedRegistry](IMChatRegistry, "sharedRegistry");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "loginIMHandle");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "existingChatWithHandle:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v12, "chatStyle") == 45)
        {
          objc_msgSend(v12, "participants");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "count");

          if (v14 <= 1)
          {
            objc_msgSend(v12, "recipient");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v15, "matchesLoginHandleForAnyAccount"))
              objc_msgSend(v2, "addObject:", v12);

          }
        }

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

  v16 = (void *)objc_msgSend(v2, "copy");
  return v16;
}

- (id)_chatsMatchingHandles:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  __int128 v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
  if (v6)
  {
    v8 = *(_QWORD *)v22;
    *(_QWORD *)&v7 = 138412290;
    v19 = v7;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v29 = v10;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1, v19);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMChatRegistry existingChatWithAddresses:allowAlternativeService:bestHandles:](self, "existingChatWithAddresses:allowAlternativeService:bestHandles:", v11, 0, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = IMOSLoggingEnabled();
        if (v12)
        {
          if (v13)
          {
            OSLogHandleForIMFoundationCategory();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v12, "guid");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v26 = v15;
              v27 = 2112;
              v28 = v10;
              _os_log_impl(&dword_1A1FF4000, v14, OS_LOG_TYPE_INFO, "_chatsMatchingHandles: Found existing 1-1 chat %@ matching owner handle: %@", buf, 0x16u);

            }
          }
          objc_msgSend(v5, "addObject:", v12);
        }
        else if (v13)
        {
          OSLogHandleForIMFoundationCategory();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v19;
            v26 = v10;
            _os_log_impl(&dword_1A1FF4000, v16, OS_LOG_TYPE_INFO, "_chatsMatchingHandles: Did not find any existing 1-1 chat matching owner handle: %@", buf, 0xCu);
          }

        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
    }
    while (v6);
  }

  v17 = (void *)objc_msgSend(v5, "copy");
  return v17;
}

- (void)_handleKeyTransparencyStatusChangedNotification:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t v19[16];

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isKeyTransparencyEnabled");

  if (v6)
  {
    objc_msgSend(v4, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("__kIMChatKTStatusChangedAffectedHandlesKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");

    if (!objc_msgSend(v9, "count"))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v19 = 0;
          _os_log_impl(&dword_1A1FF4000, v14, OS_LOG_TYPE_INFO, "Received handle key transparency status changed notification with no information about impacted handles", v19, 2u);
        }

      }
      goto LABEL_15;
    }
    objc_msgSend(v4, "object");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    objc_msgSend(v4, "object");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if ((isKindOfClass & 1) != 0)
    {
      if (!v12)
      {
LABEL_15:

        goto LABEL_16;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_14;
      v15 = objc_msgSend(v9, "count");

      if (v15 != 1)
        goto LABEL_15;
      objc_msgSend(v4, "object");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "existingIMHandleWithID:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      -[IMChatRegistry existingChatWithHandle:](self, "existingChatWithHandle:", v18);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
        goto LABEL_15;
    }
    objc_msgSend(v13, "_reloadChatItemsForKeyTransparencyStatusChange");
LABEL_14:

    goto LABEL_15;
  }
LABEL_16:

}

- (void)_handleOffGridChangedNotification:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "Received handle off grid changed notification for subscription: %@", (uint8_t *)&v7, 0xCu);
    }

  }
  -[IMChatRegistry _handleStatusChangedForSubscription:](self, "_handleStatusChangedForSubscription:", v5);

}

- (void)_handleOffGridInvitationReceivedNotification:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "Received handle off grid invitation received notification for subscription: %@", (uint8_t *)&v7, 0xCu);
    }

  }
  -[IMChatRegistry _handleStatusInvitationReceivedForSubscription:](self, "_handleStatusInvitationReceivedForSubscription:", v5);

}

- (void)_handleOffGridStateChangedNotification:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "Received handle off grid state changed notification for subscription: %@", (uint8_t *)&v7, 0xCu);
    }

  }
  -[IMChatRegistry _handleStatusStateChangedForSubscription:](self, "_handleStatusStateChangedForSubscription:", v5);

}

- (void)_handleAvailabilityChangedNotification:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "Received handle availability changed notification for subscription: %@", (uint8_t *)&v7, 0xCu);
    }

  }
  -[IMChatRegistry _handleStatusChangedForSubscription:](self, "_handleStatusChangedForSubscription:", v5);

}

- (void)_handleAvailabilityInvitationReceivedNotification:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "Received handle availability invitation received notification for subscription: %@", (uint8_t *)&v7, 0xCu);
    }

  }
  -[IMChatRegistry _handleStatusInvitationReceivedForSubscription:](self, "_handleStatusInvitationReceivedForSubscription:", v5);

}

- (void)_handleAvailabilityStateChangedNotification:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "Received handle availability state changed notification for subscription: %@", (uint8_t *)&v7, 0xCu);
    }

  }
  -[IMChatRegistry _handleStatusStateChangedForSubscription:](self, "_handleStatusStateChangedForSubscription:", v5);

}

- (void)_handleStatusChangedForSubscription:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[IMChatRegistry _chatsMatchingStatusSubscription:](self, "_chatsMatchingStatusSubscription:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "_reloadChatItemsForHandleAvailabilityChange");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_handleStatusInvitationReceivedForSubscription:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[IMChatRegistry _chatsMatchingStatusSubscription:](self, "_chatsMatchingStatusSubscription:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "_reloadChatItemsForHandleAvailabilityChange");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_handleStatusStateChangedForSubscription:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[IMChatRegistry _chatsMatchingStatusSubscription:](self, "_chatsMatchingStatusSubscription:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "_reloadChatItemsForHandleAvailabilityChange");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (id)_chatsMatchingStatusSubscription:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20 = v4;
  if (objc_msgSend(v4, "isPersonalStatusSubscription"))
  {
    -[IMChatRegistry chatsWithMyself](self, "chatsWithMyself");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v5;
        _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "Status update is for personal channel. Found matching chats: %@", buf, 0xCu);
      }

    }
  }
  else
  {
    -[IMChatRegistry _ownerHandleStringsFromSubscription:](self, "_ownerHandleStringsFromSubscription:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    obj = v7;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          v30 = v12;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMChatRegistry existingChatWithAddresses:allowAlternativeService:bestHandles:](self, "existingChatWithAddresses:allowAlternativeService:bestHandles:", v13, 0, 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = IMOSLoggingEnabled();
          if (v14)
          {
            if (v15)
            {
              OSLogHandleForIMFoundationCategory();
              v16 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v14, "guid");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v27 = v17;
                v28 = 2112;
                v29 = v12;
                _os_log_impl(&dword_1A1FF4000, v16, OS_LOG_TYPE_INFO, "_chatsMatchingStatusSubscription: Found existing 1-1 chat %@ matching owner handle: %@", buf, 0x16u);

              }
            }
            objc_msgSend(v8, "addObject:", v14);
          }
          else if (v15)
          {
            OSLogHandleForIMFoundationCategory();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v27 = v12;
              _os_log_impl(&dword_1A1FF4000, v18, OS_LOG_TYPE_INFO, "_chatsMatchingStatusSubscription: Did not find any existing 1-1 chat matching owner handle: %@", buf, 0xCu);
            }

          }
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
      }
      while (v9);
    }

    v5 = (void *)objc_msgSend(v8, "copy");
  }

  return v5;
}

- (id)chatDictionariesForChat:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
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
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v4)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v4, "_guids", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
          -[IMChatRegistry chatGUIDToInfoMap](self, "chatGUIDToInfoMap");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "addObject:", v13);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

  }
  return v5;
}

- (unint64_t)_defaultNumberOfMessagesToLoad
{
  return self->_defaultNumberOfMessagesToLoad;
}

- (BOOL)_postMessageSentNotifications
{
  return self->_postMessageSentNotifications;
}

- (OS_dispatch_queue)contactStoreQueue
{
  return self->_contactStoreQueue;
}

- (void)setContactStoreQueue:(id)a3
{
  objc_storeStrong((id *)&self->_contactStoreQueue, a3);
}

- (NSArray)serviceNamesForChatIdentifierSearch
{
  return self->_serviceNamesForChatIdentifierSearch;
}

- (void)setServiceNamesForChatIdentifierSearch:(id)a3
{
  objc_storeStrong((id *)&self->_serviceNamesForChatIdentifierSearch, a3);
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (BOOL)_isLoading
{
  return self->__isLoading;
}

- (NSArray)preExistingAllChats
{
  return self->_preExistingAllChats;
}

- (void)setPreExistingAllChats:(id)a3
{
  objc_storeStrong((id *)&self->_preExistingAllChats, a3);
}

- (NSString)historyModificationStamp
{
  return self->_historyModificationStamp;
}

- (IMTimer)markAsReadTimer
{
  return self->_markAsReadTimer;
}

- (void)setMarkAsReadTimer:(id)a3
{
  objc_storeStrong((id *)&self->_markAsReadTimer, a3);
}

- (double)timerStartTimeInterval
{
  return self->_timerStartTimeInterval;
}

- (void)setTimerStartTimeInterval:(double)a3
{
  self->_timerStartTimeInterval = a3;
}

- (BOOL)loading
{
  return self->_loading;
}

- (BOOL)wantsHistoryReload
{
  return self->_wantsHistoryReload;
}

- (BOOL)isInternalInstall
{
  return self->_isInternalInstall;
}

- (void)setIsInternalInstall:(BOOL)a3
{
  self->_isInternalInstall = a3;
}

- (NSMutableDictionary)chatsBeingLoadedMap
{
  return self->_chatsBeingLoadedMap;
}

- (void)setChatsBeingLoadedMap:(id)a3
{
  objc_storeStrong((id *)&self->_chatsBeingLoadedMap, a3);
}

- (void)setChatPersonIDToChatMap:(id)a3
{
  objc_storeStrong((id *)&self->_chatPersonIDToChatMap, a3);
}

- (NSMutableArray)allChatsInProcess
{
  return self->_allChatsInProcess;
}

- (NSMutableDictionary)chatGUIDToCurrentThreadMap
{
  return self->_chatGUIDToCurrentThreadMap;
}

- (NSMutableDictionary)threadNameToChatMap
{
  return self->_threadNameToChatMap;
}

- (NSMutableDictionary)simulatedChatGUIDToChatMap
{
  return self->_simulatedChatGUIDToChatMap;
}

- (NSMutableDictionary)chatGUIDToiMessageSentOrReceivedMap
{
  return self->_chatGUIDToiMessageSentOrReceivedMap;
}

- (void)setProcessingChatCacheMiss:(BOOL)a3
{
  self->_processingChatCacheMiss = a3;
}

- (NSSet)registryChangeHistoryChatsToUnregister
{
  return self->_registryChangeHistoryChatsToUnregister;
}

- (void)setRegistryChangeHistoryChatsToUnregister:(id)a3
{
  objc_storeStrong((id *)&self->_registryChangeHistoryChatsToUnregister, a3);
}

- (NSSet)registryChangeHistoryChatsToObserve
{
  return self->_registryChangeHistoryChatsToObserve;
}

- (void)setRegistryChangeHistoryChatsToObserve:(id)a3
{
  objc_storeStrong((id *)&self->_registryChangeHistoryChatsToObserve, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registryChangeHistoryChatsToObserve, 0);
  objc_storeStrong((id *)&self->_registryChangeHistoryChatsToUnregister, 0);
  objc_storeStrong((id *)&self->_userActivity, 0);
  objc_storeStrong((id *)&self->_groupParticipantToChatsMap, 0);
  objc_storeStrong((id *)&self->_groupIDToChatMap, 0);
  objc_storeStrong((id *)&self->_filterCategoryToEarliestInitiallyFetchedLastMessageDate, 0);
  objc_storeStrong((id *)&self->_chatGUIDToiMessageSentOrReceivedMap, 0);
  objc_storeStrong((id *)&self->_simulatedChatGUIDToChatMap, 0);
  objc_storeStrong((id *)&self->_threadNameToChatMap, 0);
  objc_storeStrong((id *)&self->_chatGUIDToInfoMap, 0);
  objc_storeStrong((id *)&self->_chatGUIDToCurrentThreadMap, 0);
  objc_storeStrong((id *)&self->_chatGUIDToChatMap, 0);
  objc_storeStrong((id *)&self->_cachedChatsInThreadNameMap, 0);
  objc_storeStrong((id *)&self->_allChatsInProcess, 0);
  objc_storeStrong((id *)&self->_chatPersonIDToChatMap, 0);
  objc_storeStrong((id *)&self->_chatsBeingLoadedMap, 0);
  objc_storeStrong((id *)&self->_markAsReadTimer, 0);
  objc_storeStrong((id *)&self->_historyModificationStamp, 0);
  objc_storeStrong((id *)&self->_conversationManager, 0);
  objc_storeStrong((id *)&self->_preExistingAllChats, 0);
  objc_storeStrong((id *)&self->_simulatedChats, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_serviceNamesForChatIdentifierSearch, 0);
  objc_storeStrong((id *)&self->_contactStoreQueue, 0);
}

- (id)activeCallForConversationUUID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentVideoCalls");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "activeConversationForCall:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "UUID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqual:", v3);

        if (v15)
        {
          v16 = v11;

          v8 = v16;
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_activeTUConversations
{
  void *v2;
  void *v3;

  -[IMChatRegistry conversationManager](self, "conversationManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeConversations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_existingChatForTUConversation:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  NSObject *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[IMChatRegistry cachedChats](self, "cachedChats", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v9, "chatStyle") == 43
          && objc_msgSend(v9, "mapsToTUConversation:", v4))
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v18 = v9;
              v19 = 2112;
              v20 = v4;
              _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "Found chat %@ for TUConversation %@", buf, 0x16u);
            }

          }
          v10 = v9;
          goto LABEL_16;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_16:

  return v10;
}

- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "stateChangedForConversation %@", (uint8_t *)&v9, 0xCu);
    }

  }
  -[IMChatRegistry _postMultiWayStateChangedNotification:](self, "_postMultiWayStateChangedNotification:", v7);

}

- (void)conversationManager:(id)a3 activeRemoteParticipantsChangedForConversation:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = 136315138;
      v10 = "-[IMChatRegistry(IMChatRegistry_CallManagement) conversationManager:activeRemoteParticipantsChangedForConversation:]";
      _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "activeRemoteParticipantsChangedForConversation %s", (uint8_t *)&v9, 0xCu);
    }

  }
  -[IMChatRegistry _postMultiWayStateChangedNotification:](self, "_postMultiWayStateChangedNotification:", v7);

}

- (void)conversationManager:(id)a3 removedActiveConversation:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "removedActiveConversation %@", (uint8_t *)&v9, 0xCu);
    }

  }
  -[IMChatRegistry _postMultiWayStateChangedNotification:](self, "_postMultiWayStateChangedNotification:", v7);

}

- (void)conversationManager:(id)a3 activitySessionsChangedForConversation:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "activitySessionsChangedForConversation %@", (uint8_t *)&v9, 0xCu);
    }

  }
  -[IMChatRegistry _postMultiWayStateChangedNotification:](self, "_postMultiWayStateChangedNotification:", v7);

}

- (void)conversationManager:(id)a3 remoteMembersChangedForConversation:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "remoteMembersChangedForConversation %@", (uint8_t *)&v9, 0xCu);
    }

  }
  -[IMChatRegistry _postMultiWayStateChangedNotification:](self, "_postMultiWayStateChangedNotification:", v7);

}

- (void)_postMultiWayStateChangedNotification:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  const __CFString *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "messagesGroupUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v17[0] = v5;
    v16[0] = CFSTR("__kIMChatMultiWayMessagesGroupID");
    v16[1] = CFSTR("__kIMChatMultiWayMessagesConversationUUID");
    objc_msgSend(v3, "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v10 = 138412802;
      v11 = CFSTR("__kIMChatMultiWayStateChangedNotification");
      v12 = 2112;
      v13 = v5;
      v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "posting notification %@ for chat with groupID %@ and userInfo %@", (uint8_t *)&v10, 0x20u);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("__kIMChatMultiWayStateChangedNotification"), 0, v7);

}

- (void)markChatsAsReadFilteredUsingPredicate:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[IMChatRegistry daemonController](self, "daemonController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "synchronousRemoteDaemon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markChatsAsReadFilteredUsingPredicate:", v4);

}

- (unint64_t)numberOfCachedChats
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[IMChatRegistry simulatedChats](self, "simulatedChats");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
    -[IMChatRegistry simulatedChats](self, "simulatedChats");
  else
    -[IMChatRegistry cachedChatsInThreadNameMap](self, "cachedChatsInThreadNameMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6;
}

- (void)_recalculateServiceNamesForChatIdentifierSearch
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  +[IMServiceImpl servicesWithCapabilityName:](IMServiceImpl, "servicesWithCapabilityName:", *MEMORY[0x1E0D38E30]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingComparator:", &unk_1E471DAD8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayByApplyingSelector:", sel_internalName);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMChatRegistry setServiceNamesForChatIdentifierSearch:](self, "setServiceNamesForChatIdentifierSearch:", v5);

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      -[IMChatRegistry serviceNamesForChatIdentifierSearch](self, "serviceNamesForChatIdentifierSearch");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "Ranked service names for chat resolution: %{public}@", (uint8_t *)&v8, 0xCu);

    }
  }
}

- (void)_enumerateChatGUIDPermutationsForChatIdentifier:(id)a3 styles:(unsigned __int8)a4 usingBlock:(id)a5
{
  id v8;
  void (**v9)(id, void *, _BYTE *);
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  char v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, void *, _BYTE *))a5;
  v23 = 0;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[IMChatRegistry serviceNamesForChatIdentifierSearch](self, "serviceNamesForChatIdentifierSearch", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    v14 = a4 & 0x2D;
    v15 = a4 & 0x2B;
LABEL_3:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v13)
        objc_enumerationMutation(v10);
      if (v14 == 45)
      {
        v17 = (void *)IMCopyGUIDForChat();
        v9[2](v9, v17, &v23);

        if (v23)
          break;
      }
      if (v15 == 43)
      {
        v18 = (void *)IMCopyGUIDForChat();
        v9[2](v9, v18, &v23);

        if (v23)
          break;
      }
      if (v12 == ++v16)
      {
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        if (v12)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (id)_possiblyUnregisteredCachedChatWithIdentifier:(id)a3 style:(unsigned __int8)a4 account:(id)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  uint64_t v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v6 = a4;
  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v26 = a5;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[IMChatRegistry allChatsInProcess](self, "allChatsInProcess");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (!v10)
  {
    v25 = 0;
    goto LABEL_17;
  }
  v11 = v10;
  v12 = *(_QWORD *)v28;
  v24 = *(_QWORD *)v28;
  v25 = 0;
  do
  {
    v13 = 0;
    do
    {
      if (*(_QWORD *)v28 != v12)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v13);
      objc_msgSend(v14, "chatIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v8, "isEqualToString:", v15)
        || objc_msgSend(v14, "chatStyle") != (_DWORD)v6)
      {
        goto LABEL_10;
      }
      v16 = v8;
      v17 = v9;
      v18 = v6;
      objc_msgSend(v14, "account");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "uniqueID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v26, "isEqualToString:", v20);

      if (v21)
      {
        v15 = v25;
        v25 = v14;
        v6 = v18;
        v9 = v17;
        v8 = v16;
        v12 = v24;
LABEL_10:

        goto LABEL_11;
      }
      v6 = v18;
      v9 = v17;
      v8 = v16;
      v12 = v24;
LABEL_11:
      ++v13;
    }
    while (v11 != v13);
    v22 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    v11 = v22;
  }
  while (v22);
LABEL_17:

  return v25;
}

- (id)_possiblyUnregisteredCachedChatWithHandle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "ID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMChatRegistry _possiblyUnregisteredCachedChatWithIdentifier:style:account:](self, "_possiblyUnregisteredCachedChatWithIdentifier:style:account:", v5, 45, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(v4, "_chatSiblings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v10 = v9;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v11)
      {
        v12 = v11;
        v20 = v9;
        v13 = *(_QWORD *)v22;
LABEL_5:
        v14 = 0;
        while (1)
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v14);
          objc_msgSend(v15, "ID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "account");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "uniqueID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMChatRegistry _possiblyUnregisteredCachedChatWithIdentifier:style:account:](self, "_possiblyUnregisteredCachedChatWithIdentifier:style:account:", v16, 45, v18);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          if (v8)
            break;
          if (v12 == ++v14)
          {
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
            if (v12)
              goto LABEL_5;
            v8 = 0;
            break;
          }
        }
        v9 = v20;
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (id)_possiblyUnregisteredCachedChatWithHandles:(id)a3 style:(unsigned __int8)a4 groupID:(id)a5 displayName:(id)a6 joinedChatsOnly:(BOOL)a7
{
  int v9;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  id v31;
  void *v33;
  _BOOL4 v34;
  id obj;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v34 = a7;
  v9 = a4;
  v42 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v36 = a5;
  v12 = a6;
  v33 = v11;
  if (objc_msgSend(v11, "count"))
  {
    -[IMChatRegistry allChatsInProcess](self, "allChatsInProcess");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "length"))
      v14 = v12;
    else
      v14 = 0;
    v15 = v14;

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    obj = v13;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v38;
LABEL_7:
      v19 = 0;
      while (1)
      {
        if (*(_QWORD *)v38 != v18)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v19);
        if (objc_msgSend(v20, "chatStyle") != v9)
          goto LABEL_28;
        objc_msgSend(v20, "displayName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "length");
        if (v36 && v22 && (objc_msgSend(v20, "groupID"), (v23 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v24 = (void *)v23;
          objc_msgSend(v20, "groupID");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v36, "isEqualToString:", v25);

          if (v26)
          {
            v31 = v20;
            goto LABEL_33;
          }
        }
        else
        {

        }
        objc_msgSend(v20, "displayName");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v27, "length"))
          break;
        objc_msgSend(v20, "displayName");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v28)
          goto LABEL_23;
        if (v15 && (objc_msgSend(v28, "isEqualToString:", v15) & 1) != 0)
        {
LABEL_24:
          if (!v34 || objc_msgSend(v20, "joinState") >= 2)
          {
            objc_msgSend(v20, "participants");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v29, "_hasSameMembers:", v33);

            if ((v30 & 1) != 0)
            {
              v31 = v20;

              goto LABEL_33;
            }
          }
        }
LABEL_27:

LABEL_28:
        if (v17 == ++v19)
        {
          v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
          if (v17)
            goto LABEL_7;
          goto LABEL_30;
        }
      }

LABEL_23:
      v28 = 0;
      if (!v15)
        goto LABEL_24;
      goto LABEL_27;
    }
LABEL_30:
    v31 = 0;
LABEL_33:

  }
  else
  {
    v31 = 0;
    v15 = v12;
  }

  return v31;
}

- (id)_possiblyUnregisteredCachedChatForRoom:(id)a3 onAccount:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(a4, "uniqueID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMChatRegistry _possiblyUnregisteredCachedChatWithIdentifier:style:account:](self, "_possiblyUnregisteredCachedChatWithIdentifier:style:account:", v6, 35, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_cachedChatWithHandles:(id)a3 allowAlternativeService:(BOOL)a4 groupID:(id)a5 displayName:(id)a6 joinedChatsOnly:(BOOL)a7
{
  return (id)MEMORY[0x1E0DE7D20](self, sel__cachedChatWithHandles_allowAlternativeService_groupID_displayName_joinedChatsOnly_findMatchingNamedGroups_);
}

- (id)_cachedChatWithHandles:(id)a3 allowAlternativeService:(BOOL)a4 groupID:(id)a5 displayName:(id)a6 joinedChatsOnly:(BOOL)a7 findMatchingNamedGroups:(BOOL)a8
{
  _BOOL8 v8;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL8 v22;
  void *v23;
  void *v24;
  int v25;
  id v26;
  void *v28;
  void *v29;
  _BOOL4 v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v8 = a8;
  v30 = a7;
  v38 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v32 = a5;
  v31 = a6;
  v29 = v12;
  if (objc_msgSend(v12, "count"))
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    -[IMChatRegistry cachedChatsInThreadNameMap](self, "cachedChatsInThreadNameMap");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v34;
      v28 = v13;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v34 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          if (objc_msgSend(v18, "chatStyle") == 43)
          {
            objc_msgSend(v18, "displayName");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "groupID");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v20;
            if ((!v8 || !v19)
              && (!objc_msgSend(v20, "length")
               || !objc_msgSend(v32, "length")
               || objc_msgSend(v32, "isEqualToString:", v21))
              && (!objc_msgSend(v19, "length")
               || !objc_msgSend(v31, "length")
               || objc_msgSend(v31, "isEqualToString:", v19))
              && (!v30 || objc_msgSend(v18, "joinState") == 2 || objc_msgSend(v18, "joinState") == 3))
            {
              v22 = v8;
              v23 = (void *)MEMORY[0x1A8582D94]();
              objc_msgSend(v18, "participants");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(v29, "equivalentToRecipients:", v24);

              if (v25)
              {
                v26 = v18;
                objc_autoreleasePoolPop(v23);

                v13 = v28;
                goto LABEL_27;
              }
              objc_autoreleasePoolPop(v23);
              v8 = v22;
              v13 = v28;
            }

          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        if (v15)
          continue;
        break;
      }
    }
    v26 = 0;
LABEL_27:

  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (id)_cachedChatWithDisplayName:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[IMChatRegistry cachedChats](self, "cachedChats", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "displayName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_cachedChatsWithDisplayName:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[IMChatRegistry cachedChats](self, "cachedChats", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
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
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v11, "displayName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v4);

        if (v13)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_cachedChatsWithMessage:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[IMChatRegistry cachedChats](self, "cachedChats", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v10);
        objc_msgSend(v4, "guid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "messageForGUID:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          objc_msgSend(v5, "addObject:", v11);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_cachedChatsWithMessageGUID:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[IMChatRegistry cachedChats](self, "cachedChats", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v11, "messageForGUID:", v4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)unblackholeChatWithHandles:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v21;
  _QWORD v23[6];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE buf[24];
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v3;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = objc_msgSend(v3, "count");
      _os_log_impl(&dword_1A1FF4000, v4, OS_LOG_TYPE_INFO, "Request to load chat with handleIDs array %@ of count %lu", buf, 0x16u);
    }

  }
  if (v3)
  {
    v21 = v3;
    if (objc_msgSend(v3, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v6 = v3;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      if (v7)
      {
        v8 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v25 != v8)
              objc_enumerationMutation(v6);
            v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
            objc_msgSend(v10, "ID");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v11, "_appearsToBePhoneNumber"))
            {
              IMInternationalForPhoneNumberWithOptions();
              v12 = objc_claimAutoreleasedReturnValue();

              v11 = (void *)v12;
            }
            IMStripFormattingFromAddress();
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v13);

            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v14 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                *(_QWORD *)&buf[4] = v10;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v11;
                _os_log_impl(&dword_1A1FF4000, v14, OS_LOG_TYPE_INFO, "Adding IMHandle: %@ into rawAddresses set as ID string %@", buf, 0x16u);
              }

            }
          }
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        }
        while (v7);
      }

      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v16 = objc_msgSend(v5, "count");
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v5;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v16;
          _os_log_impl(&dword_1A1FF4000, v15, OS_LOG_TYPE_INFO, "No exisiting chat. Calling out to daemon to find potential chat rawAddressSet set %@ of count %lu", buf, 0x16u);
        }

      }
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v29 = sub_1A200AED4;
      v30 = sub_1A200ACDC;
      v31 = 0;
      -[IMChatRegistry daemonController](self, "daemonController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "synchronousRemoteDaemon");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = sub_1A2123DA4;
      v23[3] = &unk_1E471FA08;
      v23[4] = self;
      v23[5] = buf;
      objc_msgSend(v18, "unblackholeAndLoadChatWithHandleIDs:reply:", v5, v23);

      v19 = *(id *)(*(_QWORD *)&buf[8] + 40);
      _Block_object_dispose(buf, 8);

    }
    else
    {
      v19 = 0;
    }
    v3 = v21;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void)_IMChatGetIdentifiersAndServicesTestHookWithChatRegistry:(id)a3 chat:(id)a4 identifiers:(id *)a5 services:(id *)a6 personCentricEnabled:(BOOL)a7
{
  sub_1A21251A8(a3, a4, a5, a6, a7);
}

- (void)_chat:(id)a3 sendReadReceiptForMessages:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  BOOL v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  BOOL v22;
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v26 = v6;
      v27 = 2112;
      v28 = v7;
      _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_DEBUG, "chat: %@  messages: %@", buf, 0x16u);
    }

  }
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "capabilitiesForListenerID:", 0);
  if ((*MEMORY[0x1E0D36CD0] & v10) == 0)
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "capabilitiesForListenerID:", 0);
    if ((*MEMORY[0x1E0D36D28] & v12) == 0)
    {
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "capabilitiesForListenerID:", 0);
      v22 = (*MEMORY[0x1E0D36CC0] & v21) == 0;

      if (v22)
        goto LABEL_13;
      goto LABEL_9;
    }

  }
LABEL_9:
  objc_msgSend(v6, "account");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v6, "chatIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14 == 0;

    if (!v15)
    {
      if (objc_msgSend(v7, "count"))
      {
        v23 = 0;
        v24 = 0;
        sub_1A2125B7C(self, v6, &v24, &v23);
        v16 = v24;
        v17 = v23;
        v18 = (void *)IMCreateSerializedItemsFromArray();
        +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "markReadForIDs:style:onServices:messages:clientUnreadCount:", v16, objc_msgSend(v6, "chatStyle"), v17, v18, objc_msgSend(v6, "unreadMessageCount"));

      }
    }
  }
LABEL_13:

}

- (void)_chat_sendReadReceiptForAllMessages:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  BOOL v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  int v19;
  BOOL v20;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v4;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_DEBUG, "chat: %@", buf, 0xCu);
    }

  }
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "capabilitiesForListenerID:", 0);
  if ((*MEMORY[0x1E0D36CD0] & v7) == 0)
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "capabilitiesForListenerID:", 0);
    if ((*MEMORY[0x1E0D36D28] & v9) == 0)
    {
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "capabilitiesForListenerID:", 0);
      v20 = (*MEMORY[0x1E0D36CC0] & v19) == 0;

      if (v20)
        goto LABEL_16;
      goto LABEL_9;
    }

  }
LABEL_9:
  objc_msgSend(v4, "account");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v4, "chatIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11 == 0;

    if (!v12)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v4, "account");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v24 = v4;
          v25 = 2112;
          v26 = v14;
          _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "Sending read receipt for all messages in chat: %@   for account: %@", buf, 0x16u);

        }
      }
      v21 = 0;
      v22 = 0;
      sub_1A2125B7C(self, v4, &v22, &v21);
      v15 = v22;
      v16 = v21;
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "markReadForIDs:style:onServices:messages:clientUnreadCount:setUnreadCountToZero:", v15, objc_msgSend(v4, "chatStyle"), v16, 0, objc_msgSend(v4, "unreadMessageCount"), 1);

    }
  }
LABEL_16:

}

- (void)_chat_markLastMessageAsUnread:(id)a3
{
  char *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  BOOL v18;
  id v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = (char *)a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v4;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_DEBUG, "chat: %@", buf, 0xCu);
    }

  }
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "capabilitiesForListenerID:", 0);
  if ((*MEMORY[0x1E0D36CD0] & v7) == 0)
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "capabilitiesForListenerID:", 0);
    if ((*MEMORY[0x1E0D36D28] & v9) == 0)
    {
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "capabilitiesForListenerID:", 0);
      v18 = (*MEMORY[0x1E0D36CC0] & v17) == 0;

      if (v18)
        goto LABEL_18;
      goto LABEL_9;
    }

  }
LABEL_9:
  objc_msgSend(v4, "lastIncomingFinishedMessage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v22 = "-[IMChatRegistry(IMChatRegistry_Sending) _chat_markLastMessageAsUnread:]";
        v23 = 2112;
        v24 = v4;
        _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "%s Unable to get lastIncomingFinishedMessage, falling back to lastFinishedMessage. chat: %@", buf, 0x16u);
      }

    }
    objc_msgSend(v4, "lastFinishedMessage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v10, "guid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isFromMe"))
  {

    v12 = 0;
  }
  v19 = 0;
  v20 = 0;
  sub_1A2125B7C(self, v4, &v20, &v19);
  v13 = v20;
  v14 = v19;
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "markUnreadForMessageGUID:IDs:style:services:", v12, v13, objc_msgSend(v4, "chatStyle"), v14);

LABEL_18:
}

- (void)_chat_recoverFromJunk:(id)a3
{
  char *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  int v21;
  BOOL v22;
  int v23;
  const char *v24;
  __int16 v25;
  char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = (char *)a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v23 = 138412290;
      v24 = v3;
      _os_log_impl(&dword_1A1FF4000, v4, OS_LOG_TYPE_DEBUG, "chat: %@", (uint8_t *)&v23, 0xCu);
    }

  }
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "capabilitiesForListenerID:", 0);
  if ((*MEMORY[0x1E0D36CD0] & v6) == 0)
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "capabilitiesForListenerID:", 0);
    if ((*MEMORY[0x1E0D36D28] & v8) == 0)
    {
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "capabilitiesForListenerID:", 0);
      v22 = (*MEMORY[0x1E0D36CC0] & v21) == 0;

      if (v22)
        goto LABEL_20;
      goto LABEL_9;
    }

  }
LABEL_9:
  objc_msgSend(v3, "lastIncomingFinishedMessage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v23 = 136315394;
        v24 = "-[IMChatRegistry(IMChatRegistry_Sending) _chat_recoverFromJunk:]";
        v25 = 2112;
        v26 = v3;
        _os_log_impl(&dword_1A1FF4000, v10, OS_LOG_TYPE_INFO, "%s Unable to get lastIncomingFinishedMessage, falling back to lastFinishedMessage. chat: %@", (uint8_t *)&v23, 0x16u);
      }

    }
    objc_msgSend(v3, "lastFinishedMessage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "guid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v12 = objc_claimAutoreleasedReturnValue();
    -[NSObject recoverChatsFromJunkContainingMessageWithGUID:](v12, "recoverChatsFromJunkContainingMessageWithGUID:", v11);
  }
  else
  {
    IMLogHandleForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1A21981CC(v12, v13, v14, v15, v16, v17, v18, v19);
  }

LABEL_20:
}

- (void)_chat_storeItem:(id)a3 inChat:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  BOOL v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  BOOL v21;
  int v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5 || !v6)
    goto LABEL_18;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v22 = 138412546;
      v23 = v7;
      v24 = 2112;
      v25 = v5;
      _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_DEBUG, "chat: %@  item: %@", (uint8_t *)&v22, 0x16u);
    }

  }
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "capabilitiesForListenerID:", 0);
  if ((*MEMORY[0x1E0D36CD0] & v10) == 0)
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "capabilitiesForListenerID:", 0);
    if ((*MEMORY[0x1E0D36D28] & v12) == 0)
    {
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "capabilitiesForListenerID:", 0);
      v21 = (*MEMORY[0x1E0D36CC0] & v20) == 0;

      if (v21)
        goto LABEL_18;
      goto LABEL_11;
    }

  }
LABEL_11:
  objc_msgSend(v7, "account");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v7, "chatIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14 == 0;

    if (!v15)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          v22 = 138412546;
          v23 = v5;
          v24 = 2112;
          v25 = v7;
          _os_log_impl(&dword_1A1FF4000, v16, OS_LOG_TYPE_INFO, "Storing item: %@ in chat: %@", (uint8_t *)&v22, 0x16u);
        }

      }
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "guid");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "storeItem:inChatGUID:", v5, v18);

    }
  }
LABEL_18:

}

- (void)_chat:(id)a3 sendPlayedReceiptForMessage:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  BOOL v15;
  NSObject *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  int v22;
  BOOL v23;
  id v24;
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v27 = v6;
      v28 = 2112;
      v29 = v7;
      _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_DEBUG, "chat: %@ message: %@", buf, 0x16u);
    }

  }
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "capabilitiesForListenerID:", 0);
  if ((*MEMORY[0x1E0D36CD0] & v10) == 0)
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "capabilitiesForListenerID:", 0);
    if ((*MEMORY[0x1E0D36D28] & v12) == 0)
    {
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "capabilitiesForListenerID:", 0);
      v23 = (*MEMORY[0x1E0D36CC0] & v22) == 0;

      if (v23)
        goto LABEL_18;
      goto LABEL_9;
    }

  }
LABEL_9:
  objc_msgSend(v6, "account");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v6, "chatIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14 == 0;

    if (!v15)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v6, "account");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v27 = v7;
          v28 = 2112;
          v29 = v6;
          v30 = 2112;
          v31 = v17;
          _os_log_impl(&dword_1A1FF4000, v16, OS_LOG_TYPE_INFO, "Sending played receipt for message %@ in chat: %@   for account: %@", buf, 0x20u);

        }
      }
      v24 = 0;
      v25 = 0;
      sub_1A2125B7C(self, v6, &v25, &v24);
      v18 = v25;
      v19 = v24;
      if (v7)
      {
        +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "markPlayedForIDs:style:onServices:message:", v18, objc_msgSend(v6, "chatStyle"), v19, v7);

      }
    }
  }
LABEL_18:

}

- (void)_chat:(id)a3 setPlayedExpressiveSendForMessage:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  BOOL v15;
  NSObject *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  int v22;
  BOOL v23;
  id v24;
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v27 = v6;
      v28 = 2112;
      v29 = v7;
      _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_DEBUG, "chat: %@ message: %@", buf, 0x16u);
    }

  }
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "capabilitiesForListenerID:", 0);
  if ((*MEMORY[0x1E0D36CD0] & v10) == 0)
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "capabilitiesForListenerID:", 0);
    if ((*MEMORY[0x1E0D36D28] & v12) == 0)
    {
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "capabilitiesForListenerID:", 0);
      v23 = (*MEMORY[0x1E0D36CC0] & v22) == 0;

      if (v23)
        goto LABEL_18;
      goto LABEL_9;
    }

  }
LABEL_9:
  objc_msgSend(v6, "account");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v6, "chatIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14 == 0;

    if (!v15)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v6, "account");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v27 = v7;
          v28 = 2112;
          v29 = v6;
          v30 = 2112;
          v31 = v17;
          _os_log_impl(&dword_1A1FF4000, v16, OS_LOG_TYPE_INFO, "Setting played expressive send for message %@ in chat: %@   for account: %@", buf, 0x20u);

        }
      }
      v24 = 0;
      v25 = 0;
      sub_1A2125B7C(self, v6, &v25, &v24);
      v18 = v25;
      v19 = v24;
      if (v7)
      {
        +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "markPlayedExpressiveSendForIDs:style:onServices:message:", v18, objc_msgSend(v6, "chatStyle"), v19, v7);

      }
    }
  }
LABEL_18:

}

- (void)_chat:(id)a3 sendSavedReceiptForMessage:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  BOOL v15;
  NSObject *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  int v22;
  BOOL v23;
  id v24;
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v27 = v6;
      v28 = 2112;
      v29 = v7;
      _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_DEBUG, "chat: %@ message: %@", buf, 0x16u);
    }

  }
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "capabilitiesForListenerID:", 0);
  if ((*MEMORY[0x1E0D36CD0] & v10) == 0)
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "capabilitiesForListenerID:", 0);
    if ((*MEMORY[0x1E0D36D28] & v12) == 0)
    {
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "capabilitiesForListenerID:", 0);
      v23 = (*MEMORY[0x1E0D36CC0] & v22) == 0;

      if (v23)
        goto LABEL_18;
      goto LABEL_9;
    }

  }
LABEL_9:
  objc_msgSend(v6, "account");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v6, "chatIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14 == 0;

    if (!v15)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v6, "account");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v27 = v7;
          v28 = 2112;
          v29 = v6;
          v30 = 2112;
          v31 = v17;
          _os_log_impl(&dword_1A1FF4000, v16, OS_LOG_TYPE_INFO, "Sending saved receipt for message %@ in chat: %@   for account: %@", buf, 0x20u);

        }
      }
      v24 = 0;
      v25 = 0;
      sub_1A2125B7C(self, v6, &v25, &v24);
      v18 = v25;
      v19 = v24;
      if (v7)
      {
        +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "markSavedForIDs:style:onServices:message:", v18, objc_msgSend(v6, "chatStyle"), v19, v7);

      }
    }
  }
LABEL_18:

}

- (void)_chat:(id)a3 sendNotifyRecipientCommandForMessage:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  BOOL v15;
  NSObject *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  int v22;
  BOOL v23;
  id v24;
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v27 = v6;
      v28 = 2112;
      v29 = v7;
      _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_DEBUG, "chat: %@ message: %@", buf, 0x16u);
    }

  }
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "capabilitiesForListenerID:", 0);
  if ((*MEMORY[0x1E0D36CD0] & v10) == 0)
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "capabilitiesForListenerID:", 0);
    if ((*MEMORY[0x1E0D36D28] & v12) == 0)
    {
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "capabilitiesForListenerID:", 0);
      v23 = (*MEMORY[0x1E0D36CC0] & v22) == 0;

      if (v23)
        goto LABEL_18;
      goto LABEL_9;
    }

  }
LABEL_9:
  objc_msgSend(v6, "account");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v6, "chatIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14 == 0;

    if (!v15)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v6, "account");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v27 = v7;
          v28 = 2112;
          v29 = v6;
          v30 = 2112;
          v31 = v17;
          _os_log_impl(&dword_1A1FF4000, v16, OS_LOG_TYPE_INFO, "Sending notify recipient commadn for message %@ in chat: %@   for account: %@", buf, 0x20u);

        }
      }
      v24 = 0;
      v25 = 0;
      sub_1A2125B7C(self, v6, &v25, &v24);
      v18 = v25;
      v19 = v24;
      if (v7)
      {
        +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "sendNotifyRecipientCommandForIDs:style:onServices:message:", v18, objc_msgSend(v6, "chatStyle"), v19, v7);

      }
    }
  }
LABEL_18:

}

- (void)_markHasHadSuccessfulQueryForChat:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  BOOL v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  int v19;
  BOOL v20;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v4;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_DEBUG, "chat: %@", buf, 0xCu);
    }

  }
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "capabilitiesForListenerID:", 0);
  if ((*MEMORY[0x1E0D36CD0] & v7) == 0)
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "capabilitiesForListenerID:", 0);
    if ((*MEMORY[0x1E0D36D28] & v9) == 0)
    {
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "capabilitiesForListenerID:", 0);
      v20 = (*MEMORY[0x1E0D36CC0] & v19) == 0;

      if (v20)
        goto LABEL_16;
      goto LABEL_9;
    }

  }
LABEL_9:
  objc_msgSend(v4, "account");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v4, "chatIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11 == 0;

    if (!v12)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v4, "account");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v24 = v4;
          v25 = 2112;
          v26 = v14;
          _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "Marking chat as had successful ID query in chat: %@   for account: %@", buf, 0x16u);

        }
      }
      v21 = 0;
      v22 = 0;
      sub_1A2125B7C(self, v4, &v22, &v21);
      v15 = v22;
      v16 = v21;
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "markHasHadSuccessfulQueryForIDs:style:onServices:", v15, objc_msgSend(v4, "chatStyle"), v16);

    }
  }
LABEL_16:

}

- (id)_eventForMessage:(id)a3
{
  id v3;
  __CFArray *v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  const void **v18;
  void *v19;
  void *v20;
  uint64_t v21;

  v3 = a3;
  v4 = (__CFArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!v3 || (objc_msgSend(v3, "isTypingMessage") & 1) != 0)
    goto LABEL_35;
  objc_msgSend(v3, "balloonBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsString:", *MEMORY[0x1E0D375D0]);

  if (v6 && v4 && *MEMORY[0x1E0D38480])
    CFArrayAppendValue(v4, (const void *)*MEMORY[0x1E0D38480]);
  objc_msgSend(v3, "balloonBundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D375C0]);

  if (v8 && v4 && *MEMORY[0x1E0D385C0])
    CFArrayAppendValue(v4, (const void *)*MEMORY[0x1E0D385C0]);
  objc_msgSend(v3, "balloonBundleID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0D375F8]);

  if (v10 && v4 && *MEMORY[0x1E0D387D8])
    CFArrayAppendValue(v4, (const void *)*MEMORY[0x1E0D387D8]);
  objc_msgSend(v3, "balloonBundleID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0D37588]);

  if (v12 && v4 && *MEMORY[0x1E0D38560])
    CFArrayAppendValue(v4, (const void *)*MEMORY[0x1E0D38560]);
  objc_msgSend(v3, "expressiveSendStyleID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "length"))
  {
    objc_msgSend(v3, "expressiveSendStyleID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "rangeOfString:", *MEMORY[0x1E0D37FF0]);

    if (v15 != 0x7FFFFFFFFFFFFFFFLL && v4 && *MEMORY[0x1E0D38598])
      CFArrayAppendValue(v4, (const void *)*MEMORY[0x1E0D38598]);
  }
  else
  {

  }
  objc_msgSend(v3, "expressiveSendStyleID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0D380A0]);

  if (v17)
  {
    if (!v4)
      goto LABEL_35;
    v18 = (const void **)MEMORY[0x1E0D38600];
    goto LABEL_32;
  }
  objc_msgSend(v3, "expressiveSendStyleID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v19, "length"))
  {

    goto LABEL_35;
  }
  objc_msgSend(v3, "expressiveSendStyleID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "rangeOfString:", *MEMORY[0x1E0D38098]);

  if (v21 != 0x7FFFFFFFFFFFFFFFLL && v4)
  {
    v18 = (const void **)MEMORY[0x1E0D384C8];
LABEL_32:
    if (*v18)
      CFArrayAppendValue(v4, *v18);
  }
LABEL_35:

  return v4;
}

- (void)_trackUsageForMessage:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[IMChatRegistry _eventForMessage:](self, "_eventForMessage:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7);
        objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "trackEvent:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (void)_setReplyToGuidOnMessage:(id)a3 forChat:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "lastFinishedMessageItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "guid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setReplyToGUID:", v8);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v5, "guid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412546;
      v12 = v8;
      v13 = 2112;
      v14 = v10;
      _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_INFO, "Setting %@ as the reply to guid for %@", (uint8_t *)&v11, 0x16u);

    }
  }

}

- (BOOL)_nicknameSharingEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D398E8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sharingEnabled");

  return v3;
}

- (unint64_t)_nicknameSharingAudience
{
  void *v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x1E0D398E8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sharingAudience");

  return v3;
}

- (void)_setMeCardSharingOnMessage:(id)a3 forChat:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  NSObject *v9;
  _BOOL8 v10;
  _BOOL8 v11;
  NSObject *v12;
  void *v13;
  int v14;
  _DWORD v15[7];

  *(_QWORD *)&v15[5] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[IMChatRegistry _nicknameSharingAudience](self, "_nicknameSharingAudience");
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v14 = 134217984;
      *(_QWORD *)v15 = v8;
      _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_INFO, "Current me card sharing audience is %lu", (uint8_t *)&v14, 0xCu);
    }

  }
  if (-[IMChatRegistry _nicknameSharingEnabled](self, "_nicknameSharingEnabled"))
  {
    if (v8 > 1)
      v10 = -[IMChatRegistry _shouldShareMeCardForAlwaysAskAudienceWithChat:](self, "_shouldShareMeCardForAlwaysAskAudienceWithChat:", v7);
    else
      v10 = -[IMChatRegistry _shouldShareMeCardForContactsOnlyAudienceWithChat:](self, "_shouldShareMeCardForContactsOnlyAudienceWithChat:", v7);
    v11 = v10;
  }
  else
  {
    v11 = 0;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "guid");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 67109378;
      v15[0] = v11;
      LOWORD(v15[1]) = 2112;
      *(_QWORD *)((char *)&v15[1] + 2) = v13;
      _os_log_impl(&dword_1A1FF4000, v12, OS_LOG_TYPE_INFO, "Setting meCard sharing preference %d on message %@", (uint8_t *)&v14, 0x12u);

    }
  }
  objc_msgSend(v6, "setShouldSendMeCard:", v11);

}

- (BOOL)_shouldShareMeCardForContactsOnlyAudienceWithChat:(id)a3
{
  id v3;
  BOOL v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((objc_msgSend(v3, "allParticipantsAreContacts") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(v3, "participants", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          +[IMNicknameController sharedInstance](IMNicknameController, "sharedInstance");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v11, "handleIsAllowedForSharing:", v10) & 1) != 0)
          {

          }
          else
          {
            v12 = objc_msgSend(v10, "isContact");

            if ((v12 & 1) == 0)
            {
              v4 = 0;
              goto LABEL_15;
            }
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v7)
          continue;
        break;
      }
    }
    v4 = 1;
LABEL_15:

  }
  return v4;
}

- (BOOL)_shouldShareMeCardForAlwaysAskAudienceWithChat:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(a3, "participants", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        +[IMNicknameController sharedInstance](IMNicknameController, "sharedInstance");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v8) = objc_msgSend(v9, "handleIsAllowedForSharing:", v8);

        if (!(_DWORD)v8)
        {
          v10 = 0;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
  v10 = 1;
LABEL_11:

  return v10;
}

- (void)_chat:(id)a3 sendMessage:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "account");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[IMChatRegistry _chat:sendMessage:withAccount:](self, "_chat:sendMessage:withAccount:", v7, v6, v8);

}

- (void)_chat:(id)a3 sendMessage:(id)a4 withAccount:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  BOOL v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  char v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  BOOL v26;
  void *v27;
  void *v28;
  void *v29;
  BOOL v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  BOOL v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  NSObject *v43;
  NSObject *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  void *v53;
  void *v54;
  id v55;
  uint8_t buf[4];
  id v57;
  __int16 v58;
  id v59;
  __int16 v60;
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v57 = v8;
      v58 = 2112;
      v59 = v9;
      _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_DEBUG, "chat: %@  message: %@", buf, 0x16u);
    }

  }
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "capabilitiesForListenerID:", 0);
  if ((*MEMORY[0x1E0D36CD0] & v13) != 0)
  {
    v14 = 0;
  }
  else
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "capabilitiesForListenerID:", 0);
    if ((*MEMORY[0x1E0D36D28] & v16) != 0)
    {
      v14 = 0;
    }
    else
    {
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "capabilitiesForListenerID:", 0);
      v14 = (*MEMORY[0x1E0D36CC0] & v18) == 0;

    }
  }

  if (v9)
    v19 = v14;
  else
    v19 = 1;
  if ((v19 & 1) == 0)
  {
    if ((objc_msgSend(v8, "supportsSendingTypingIndicators") & 1) == 0
      && objc_msgSend(v9, "isTypingMessage"))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A1FF4000, v20, OS_LOG_TYPE_INFO, "Bailing sending message as its a typing message and service does not support typing", buf, 2u);
        }

      }
      goto LABEL_73;
    }
    IMCopyGUIDForChatOnAccount(v8, v10);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    IMComponentsFromChatGUID();
    v22 = 0;
    if (!v10 || !v22)
    {
LABEL_72:

      goto LABEL_73;
    }
    v55 = v22;
    v23 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v23, "_updateError:", 0);
    objc_msgSend(v10, "loginIMHandle");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "_updateSender:", v24);

    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v25, "isScheduledMessagesCoreEnabled"))
    {
      v26 = objc_msgSend(v23, "scheduleType") == 2;

      if (v26)
      {
LABEL_28:
        if (!objc_msgSend(v23, "scheduleType"))
          objc_msgSend(v23, "_updateTime:", 0);
        objc_msgSend(v23, "_updateTimeRead:", 0);
        objc_msgSend(v23, "_updateTimeDelivered:", 0);
        objc_msgSend(v23, "_updateTimePlayed:", 0);
        objc_msgSend(v23, "_imMessageItem");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMChatRegistry _setMeCardSharingOnMessage:forChat:](self, "_setMeCardSharingOnMessage:forChat:", v27, v8);
        if (objc_msgSend(v27, "isTypingMessage"))
        {
          objc_msgSend(v9, "customTypingIndicatorIcon");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setTypingIndicatorIcon:", v28);

        }
        if (!v27)
          goto LABEL_71;
        -[IMChatRegistry _trackUsageForMessage:](self, "_trackUsageForMessage:", v27);
        objc_msgSend(v27, "tapback");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v29 == 0;

        if (!v30)
        {
          objc_msgSend(MEMORY[0x1E0D39B48], "sharedInstance");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "sendTapbackSendEvent");

        }
        objc_msgSend(v9, "notificationIDSTokenURI");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v57 = v54;
            _os_log_impl(&dword_1A1FF4000, v32, OS_LOG_TYPE_INFO, "Before Siri passed in following notificationIDSTokenURI %@ so setting it on immessageitem", buf, 0xCu);
          }

        }
        if (objc_msgSend(v54, "length"))
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v57 = v54;
              _os_log_impl(&dword_1A1FF4000, v33, OS_LOG_TYPE_INFO, "Siri passed in following notificationIDSTokenURI %@ so setting it on immessageitem", buf, 0xCu);
            }

          }
          objc_msgSend(v27, "setNotificationIDSTokenURI:", v54);
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v27, "notificationIDSTokenURI");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v57 = v35;
              _os_log_impl(&dword_1A1FF4000, v34, OS_LOG_TYPE_INFO, "now it is set to %@", buf, 0xCu);

            }
          }
        }
        objc_msgSend(v27, "balloonBundleID");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v36, "isEqualToString:", *MEMORY[0x1E0D375F8]))
        {
          objc_msgSend(v27, "fileTransferGUIDs");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v37, "count") == 0;

          if (v38)
          {
LABEL_52:
            objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = objc_msgSend(v40, "isInternalInstall");

            if (v41)
            {
              objc_msgSend(v27, "expressiveSendStyleID");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              if (v42 || !IMGetCachedDomainBoolForKey())
              {

              }
              else if ((objc_msgSend(v27, "isTypingMessage") & 1) == 0)
              {
                if (IMOSLoggingEnabled())
                {
                  OSLogHandleForIMFoundationCategory();
                  v43 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1A1FF4000, v43, OS_LOG_TYPE_INFO, "Forcing laser due to defaults com.apple.MobileSMS AlwaysSendLasers", buf, 2u);
                  }

                }
                objc_msgSend(v27, "setExpressiveSendStyleID:", CFSTR("com.apple.messages.effect.CKLasersEffect"));
              }
            }
            -[IMChatRegistry _setReplyToGuidOnMessage:forChat:](self, "_setReplyToGuidOnMessage:forChat:", v27, v8);
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v44 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412802;
                v57 = v27;
                v58 = 2112;
                v59 = v8;
                v60 = 2112;
                v61 = v10;
                _os_log_impl(&dword_1A1FF4000, v44, OS_LOG_TYPE_DEBUG, "Sending message: %@ to %@ account: %@", buf, 0x20u);
              }

            }
            +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = objc_msgSend(v8, "chatStyle");
            objc_msgSend(v10, "uniqueID");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "sendMessage:toChatID:identifier:style:account:", v27, v21, v55, v46, v47);

            if ((objc_msgSend(v27, "isTypingMessage") & 1) == 0)
            {
              objc_msgSend(MEMORY[0x1E0D39B48], "sharedInstance");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "sendSentMessageEvent");

            }
            -[IMChatRegistry setUserActivityForChat:message:orHandles:](self, "setUserActivityForChat:message:orHandles:", v8, v9, 0);
            objc_msgSend(v27, "service");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            +[IMService iMessageService](IMServiceImpl, "iMessageService");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "internalName");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = objc_msgSend(v49, "isEqualToIgnoringCase:", v51);

            if (v52)
            {
              +[IMChatRegistry sharedRegistry](IMChatRegistry, "sharedRegistry");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "_setChatHasCommunicatedOveriMessage:", v8);

            }
LABEL_71:

            v22 = v55;
            goto LABEL_72;
          }
          objc_msgSend(v27, "body");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = (void *)objc_msgSend(v39, "mutableCopy");

          objc_msgSend(v36, "removeCharactersWithAttribute:", *MEMORY[0x1E0D36430]);
          objc_msgSend(v27, "setBody:", v36);
        }

        goto LABEL_52;
      }
    }
    else
    {

    }
    objc_msgSend(v23, "_updateFlags:", objc_msgSend(v9, "flags") & 0xFFFFFFFFFFFF4FFFLL);
    goto LABEL_28;
  }
LABEL_73:

}

- (void)_chat:(id)a3 sendEditedMessageItem:(id)a4 previousMessageItem:(id)a5 partIndex:(int64_t)a6 editType:(unint64_t)a7 backwardCompatabilityText:(id)a8
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint8_t buf[8];
  uint64_t v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a8;
  objc_msgSend(v12, "account");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  IMCopyGUIDForChatOnAccount(v12, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0;
  IMComponentsFromChatGUID();
  v18 = 0;
  v19 = objc_msgSend(v12, "chatStyle");
  objc_msgSend(v12, "account");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "uniqueID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v22, OS_LOG_TYPE_INFO, "Asking daemon to send edited message", buf, 2u);
    }

  }
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "sendEditedMessage:previousMessage:partIndex:editType:toChatIdentifier:style:account:backwardCompatabilityText:", v13, v14, a6, a7, v18, v19, v21, v15);

  if (a7 == 2)
  {
    objc_msgSend(v13, "message");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMChatRegistry setUserActivityForChat:message:orHandles:](self, "setUserActivityForChat:message:orHandles:", v12, v24, 0);

  }
}

- (void)_chat:(id)a3 resendEditedMessageItem:(id)a4 partIndex:(int64_t)a5 withBackwardCompatabilityText:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  uint8_t buf[8];
  uint64_t v24;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  objc_msgSend(v9, "account");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  IMCopyGUIDForChatOnAccount(v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0;
  IMComponentsFromChatGUID();
  v14 = 0;
  v15 = objc_msgSend(v9, "chatStyle");
  objc_msgSend(v9, "account");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "uniqueID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "retractedPartIndexes");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "containsIndex:", a5);

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v20, OS_LOG_TYPE_INFO, "Asking daemon to resend edited message", buf, 2u);
    }

  }
  if (v19)
    v21 = 2;
  else
    v21 = 1;
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "sendEditedMessage:previousMessage:partIndex:editType:toChatIdentifier:style:account:backwardCompatabilityText:", v10, v10, a5, v21, v14, v15, v17, v11);

}

- (void)_chat:(id)a3 cancelScheduledMessageWithGUID:(id)a4 destinations:(id)a5 cancelType:(unint64_t)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  objc_msgSend(v10, "account");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  IMCopyGUIDForChatOnAccount(v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  IMComponentsFromChatGUID();
  objc_msgSend(v10, "account");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

}

- (void)_chat:(id)a3 editScheduledMessageItem:(id)a4 previousMessageItem:(id)a5 partIndex:(int64_t)a6 editType:(unint64_t)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint8_t buf[8];
  uint64_t v23;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  objc_msgSend(v11, "account");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  IMCopyGUIDForChatOnAccount(v11, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0;
  IMComponentsFromChatGUID();
  v16 = 0;
  v17 = objc_msgSend(v11, "chatStyle");
  objc_msgSend(v11, "account");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "uniqueID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v20, OS_LOG_TYPE_INFO, "Asking daemon to send edited scheduled message", buf, 2u);
    }

  }
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "sendEditedScheduledMessage:previousMessage:partIndex:editType:toChatIdentifier:style:account:", v12, v13, a6, a7, v16, v17, v19);

}

- (void)_chat:(id)a3 editScheduledMessageItem:(id)a4 previousMessageItem:(id)a5 retractingPartIndexes:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint8_t v21[8];
  uint64_t v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v9, "account");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  IMCopyGUIDForChatOnAccount(v9, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0;
  IMComponentsFromChatGUID();
  v15 = 0;
  v16 = objc_msgSend(v9, "chatStyle");
  objc_msgSend(v9, "account");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "uniqueID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_1A1FF4000, v19, OS_LOG_TYPE_INFO, "Asking daemon to send edited scheduled message retracting part indexes", v21, 2u);
    }

  }
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sendEditedScheduledMessage:previousMessage:retractingPartIndexes:toChatIdentifier:style:account:", v10, v11, v12, v15, v16, v18);

}

- (void)_chat:(id)a3 repositionSticker:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint8_t v14[8];
  uint64_t v15;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  IMCopyGUIDForChatOnAccount(v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0;
  IMComponentsFromChatGUID();
  v9 = 0;
  objc_msgSend(v5, "account");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uniqueID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1A1FF4000, v12, OS_LOG_TYPE_INFO, "Asking daemon to send sticker reposition message", v14, 2u);
    }

  }
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sendRepositionStickerMessage:chatIdentifier:accountID:style:", v6, v9, v11, objc_msgSend(v5, "chatStyle"));

}

- (void)_chat:(id)a3 sendGroupPhotoUpdate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  IMCopyGUIDForChatOnAccount(v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  IMComponentsFromChatGUID();
  v9 = 0;
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "chatStyle");
  objc_msgSend(v6, "account");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "uniqueID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sendGroupPhotoUpdate:toChatID:identifier:style:account:", v5, v8, v9, v11, v13);

}

- (void)_chat:(id)a3 retryGroupPhotoUpload:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  IMCopyGUIDForChatOnAccount(v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  IMComponentsFromChatGUID();
  v9 = 0;
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "chatStyle");
  objc_msgSend(v6, "account");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "uniqueID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "retryGroupPhotoUpload:toChatID:identifier:style:account:", v5, v8, v9, v11, v13);

}

- (void)_chat:(id)a3 sendSyndicationAction:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  int v27;
  int v28;
  id v29;
  id v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  id v34;
  __int16 v35;
  NSObject *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    IMLogHandleForCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1A21981FC(v14, v19, v20, v21, v22, v23, v24, v25);
    goto LABEL_15;
  }
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "capabilitiesForListenerID:", 0);
  if ((*MEMORY[0x1E0D36CD0] & v9) != 0)
    goto LABEL_5;
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "capabilitiesForListenerID:", 0);
  if ((*MEMORY[0x1E0D36D28] & v11) != 0)
  {

LABEL_5:
    goto LABEL_6;
  }
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "capabilitiesForListenerID:", 0);
  v28 = *MEMORY[0x1E0D36CC0] & v27;

  if (!v28)
    goto LABEL_16;
LABEL_6:
  objc_msgSend(v6, "account");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v6, "chatIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v29 = 0;
      v30 = 0;
      sub_1A2125B7C(self, v6, &v30, &v29);
      v14 = v30;
      v15 = v29;
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          v17 = -[NSObject count](v14, "count");
          *(_DWORD *)buf = 134218498;
          v32 = v17;
          v33 = 2112;
          v34 = v7;
          v35 = 2112;
          v36 = v14;
          _os_log_impl(&dword_1A1FF4000, v16, OS_LOG_TYPE_INFO, "Found %lu chats to send Syndication Action %@ to. chatIDs: %@", buf, 0x20u);
        }

      }
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "sendSyndicationAction:toChatsWithIdentifiers:", v7, v14);

LABEL_15:
    }
  }
LABEL_16:

}

- (void)_chat:(id)a3 sendUpdatedCollaborationMetadata:(id)a4 forMessageGUID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  int v30;
  int v31;
  id v32;
  id v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  id v37;
  __int16 v38;
  NSObject *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v9)
  {
    IMLogHandleForCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_1A219822C(v17, v22, v23, v24, v25, v26, v27, v28);
    goto LABEL_15;
  }
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "capabilitiesForListenerID:", 0);
  if ((*MEMORY[0x1E0D36CD0] & v12) != 0)
    goto LABEL_5;
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "capabilitiesForListenerID:", 0);
  if ((*MEMORY[0x1E0D36D28] & v14) != 0)
  {

LABEL_5:
    goto LABEL_6;
  }
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "capabilitiesForListenerID:", 0);
  v31 = *MEMORY[0x1E0D36CC0] & v30;

  if (!v31)
    goto LABEL_16;
LABEL_6:
  objc_msgSend(v8, "account");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(v8, "chatIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v32 = 0;
      v33 = 0;
      sub_1A2125B7C(self, v8, &v33, &v32);
      v17 = v33;
      v18 = v32;
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          v20 = -[NSObject count](v17, "count");
          *(_DWORD *)buf = 134218498;
          v35 = v20;
          v36 = 2112;
          v37 = v9;
          v38 = 2112;
          v39 = v17;
          _os_log_impl(&dword_1A1FF4000, v19, OS_LOG_TYPE_INFO, "Found %lu chats to send updated collaboration metadata %@ to. chatIDs: %@", buf, 0x20u);
        }

      }
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "sendUpdatedCollaborationMetadata:toChatsWithIdentifiers:forMessageGUID:", v9, v17, v10);

LABEL_15:
    }
  }
LABEL_16:

}

- (void)_chat:(id)a3 inviteParticipants:(id)a4 reason:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  BOOL v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v31 = v7;
      v32 = 2112;
      v33 = v8;
      v34 = 2112;
      v35 = v9;
      _os_log_impl(&dword_1A1FF4000, v10, OS_LOG_TYPE_DEBUG, "chat: %@  participants: %@  reason: %@", buf, 0x20u);
    }

  }
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "capabilitiesForListenerID:", 0);
  if ((*MEMORY[0x1E0D36CD0] & v12) == 0)
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "capabilitiesForListenerID:", 0);
    if ((*MEMORY[0x1E0D36D28] & v14) == 0)
    {
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "capabilitiesForListenerID:", 0);
      v29 = (*MEMORY[0x1E0D36CC0] & v28) == 0;

      if (v29)
        goto LABEL_13;
      goto LABEL_9;
    }

  }
LABEL_9:
  objc_msgSend(v7, "account");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "uniqueID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v7, "chatStyle");
  objc_msgSend(v7, "account");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  IMCopyGUIDForChatOnAccount(v7, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  IMComponentsFromChatGUID();
  v20 = 0;
  v21 = v20;
  if (v16 && v20)
  {
    objc_msgSend(v7, "account");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "loginIMHandle");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_updateSender:", v23);

    objc_msgSend(v9, "_imMessageItem");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrayByApplyingSelector:", sel__handleInfo);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "invitePersonInfo:withMessage:toChatID:identifier:style:account:", v26, v24, v19, v21, v17, v16);

  }
LABEL_13:

}

- (void)_chat:(id)a3 removeParticipants:(id)a4 reason:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  BOOL v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v28 = v7;
      v29 = 2112;
      v30 = v8;
      v31 = 2112;
      v32 = v9;
      _os_log_impl(&dword_1A1FF4000, v10, OS_LOG_TYPE_DEBUG, "chat: %@  participants: %@  reason: %@", buf, 0x20u);
    }

  }
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "capabilitiesForListenerID:", 0);
  if ((*MEMORY[0x1E0D36CD0] & v12) == 0)
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "capabilitiesForListenerID:", 0);
    if ((*MEMORY[0x1E0D36D28] & v14) == 0)
    {
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "capabilitiesForListenerID:", 0);
      v26 = (*MEMORY[0x1E0D36CC0] & v25) == 0;

      if (v26)
        goto LABEL_13;
      goto LABEL_9;
    }

  }
LABEL_9:
  objc_msgSend(v7, "account");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "uniqueID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v7, "chatStyle");
  objc_msgSend(v7, "account");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  IMCopyGUIDForChatOnAccount(v7, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  IMComponentsFromChatGUID();
  v20 = 0;
  v21 = v20;
  if (v16 && v20)
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrayByApplyingSelector:", sel__handleInfo);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "removePersonInfo:chatID:identifier:style:account:", v23, v19, v21, v17, v16);

  }
LABEL_13:

}

- (void)_chat:(id)a3 joinWithProperties:(id)a4 guid:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  id v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  BOOL v20;
  int v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  BOOL v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  unsigned int v34;
  id v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v35 = a4;
  v9 = a5;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v37 = v8;
      v38 = 2112;
      v39 = v35;
      v40 = 2112;
      v41 = v9;
      _os_log_impl(&dword_1A1FF4000, v10, OS_LOG_TYPE_INFO, "chat: %@  joinProperties: %@, guid: %@", buf, 0x20u);
    }

  }
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "capabilitiesForListenerID:", 0);
  if ((*MEMORY[0x1E0D36CD0] & v12) != 0)
    goto LABEL_8;
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "capabilitiesForListenerID:", 0);
  if ((*MEMORY[0x1E0D36D28] & v14) != 0)
  {

LABEL_8:
    goto LABEL_9;
  }
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "capabilitiesForListenerID:", 0);
  v28 = (*MEMORY[0x1E0D36CC0] & v27) == 0;

  if (v28)
    goto LABEL_35;
LABEL_9:
  IMComponentsFromChatGUID();
  v15 = 0;
  -[IMChatRegistry chatGUIDToChatMap](self, "chatGUIDToChatMap");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKey:", v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {

LABEL_14:
    -[IMChatRegistry _registerChat:isIncoming:guid:](self, "_registerChat:isIncoming:guid:", v8, 0, v9);
    v34 = objc_msgSend(v8, "chatStyle");
    objc_msgSend(v8, "account");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
      v20 = v15 == 0;
    else
      v20 = 1;
    v21 = !v20;

    if (!v21)
      goto LABEL_34;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v8, "account");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v37 = v8;
        v38 = 2112;
        v39 = v23;
        _os_log_impl(&dword_1A1FF4000, v22, OS_LOG_TYPE_INFO, "Forwarding join chat for: %@   to account: %@", buf, 0x16u);

      }
    }
    if (v34 == 45)
    {
      objc_msgSend(v8, "recipient");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "_handleInfo");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      IMSingleObjectArray();
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v8, "participantsWithState:", 21);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "arrayByApplyingSelector:", sel__handleInfo);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v8, "groupID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setGroupID:", v17);
    }
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastAddressedHandleID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastAddressedSIMID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "account");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "uniqueID");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "joinChatID:handleInfo:identifier:style:groupID:lastAddressedHandle:lastAddressedSIMID:joinProperties:account:", v9, v16, v15, v34, v17, v30, v31, v35, v33);

    goto LABEL_33;
  }
  if (objc_msgSend(v8, "joinState") != 3)
  {
    v18 = objc_msgSend(v8, "joinState") == 4;

    if (v18)
      goto LABEL_34;
    goto LABEL_14;
  }
LABEL_33:

LABEL_34:
LABEL_35:

}

- (void)_chat:(id)a3 joinWithProperties:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  objc_msgSend(v12, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  IMCopyGUIDForChatOnAccount(v12, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMChatRegistry _chat:joinWithProperties:guid:](self, "_chat:joinWithProperties:guid:", v12, v6, v8);
  objc_msgSend(v12, "guid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if ((v10 & 1) == 0)
  {
    objc_msgSend(v12, "guid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMChatRegistry _chat:joinWithProperties:guid:](self, "_chat:joinWithProperties:guid:", v12, v6, v11);

  }
}

- (void)_chat_leave:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  int v24;
  BOOL v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v3;
      _os_log_impl(&dword_1A1FF4000, v4, OS_LOG_TYPE_DEBUG, "chat: %@", buf, 0xCu);
    }

  }
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "capabilitiesForListenerID:", 0);
  if ((*MEMORY[0x1E0D36CD0] & v6) == 0)
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "capabilitiesForListenerID:", 0);
    if ((*MEMORY[0x1E0D36D28] & v8) == 0)
    {
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "capabilitiesForListenerID:", 0);
      v25 = (*MEMORY[0x1E0D36CC0] & v24) == 0;

      if (v25)
        goto LABEL_32;
      goto LABEL_9;
    }

  }
LABEL_9:
  v9 = objc_msgSend(v3, "chatStyle");
  if ((_DWORD)v9 == 45)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v3;
        _os_log_impl(&dword_1A1FF4000, v10, OS_LOG_TYPE_INFO, "Not allowed to leave 1:1 chat: %@", buf, 0xCu);
      }

    }
  }
  else
  {
    objc_msgSend(v3, "account");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    IMCopyGUIDForChatOnAccount(v3, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    IMComponentsFromChatGUID();
    v13 = 0;
    if (v13)
    {
      objc_msgSend(v3, "account");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v3, "account");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v27 = v3;
            v28 = 2112;
            v29 = v16;
            _os_log_impl(&dword_1A1FF4000, v15, OS_LOG_TYPE_INFO, "Forwarding leave chat for: %@   to account: %@", buf, 0x16u);

          }
        }
        +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "account");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "uniqueID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "leaveChatID:style:account:", v13, v9, v19);

      }
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v3, "guid");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v27 = v21;
        _os_log_impl(&dword_1A1FF4000, v20, OS_LOG_TYPE_INFO, "Unjoining chat locally: %@", buf, 0xCu);

      }
    }
    if (v3)
      objc_msgSend(v3, "_setJoinState:", 0);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1FF4000, v22, OS_LOG_TYPE_INFO, "Done", buf, 2u);
      }

    }
  }
LABEL_32:

}

- (void)_chat_remove:(id)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  BOOL v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v24 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v24;
      _os_log_impl(&dword_1A1FF4000, v4, OS_LOG_TYPE_DEBUG, "chat: %@", buf, 0xCu);
    }

  }
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "capabilitiesForListenerID:", 0);
  if ((*MEMORY[0x1E0D36CD0] & v6) == 0)
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "capabilitiesForListenerID:", 0);
    if ((*MEMORY[0x1E0D36D28] & v8) == 0)
    {
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "capabilitiesForListenerID:", 0);
      v23 = (*MEMORY[0x1E0D36CC0] & v22) == 0;

      if (v23)
        goto LABEL_27;
      goto LABEL_9;
    }

  }
LABEL_9:
  -[IMChatRegistry allGUIDsForChat:](self, "allGUIDsForChat:", v24);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v9;
      _os_log_impl(&dword_1A1FF4000, v10, OS_LOG_TYPE_INFO, "Removing chat from the agent too: %@", buf, 0xCu);
    }

  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v31 = v15;
            _os_log_impl(&dword_1A1FF4000, v16, OS_LOG_TYPE_INFO, "   Found guid to remove: %@", buf, 0xCu);
          }

        }
        +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "removeChat:", v15);

        -[IMChatRegistry _unregisterChatWithGUID:](self, "_unregisterChatWithGUID:", v15);
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v12);
  }

  objc_msgSend(v24, "personCentricID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[IMChatRegistry chatPersonIDToChatMap](self, "chatPersonIDToChatMap");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "personCentricID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "removeObjectForKey:", v20);

  }
LABEL_27:

}

- (void)_chat_declineInvitation:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  BOOL v14;
  int v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  BOOL v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v3;
      _os_log_impl(&dword_1A1FF4000, v4, OS_LOG_TYPE_DEBUG, "chat: %@", buf, 0xCu);
    }

  }
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "capabilitiesForListenerID:", 0);
  if ((*MEMORY[0x1E0D36CD0] & v6) == 0)
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "capabilitiesForListenerID:", 0);
    if ((*MEMORY[0x1E0D36D28] & v8) == 0)
    {
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "capabilitiesForListenerID:", 0);
      v23 = (*MEMORY[0x1E0D36CC0] & v22) == 0;

      if (v23)
        goto LABEL_22;
      goto LABEL_9;
    }

  }
LABEL_9:
  v9 = objc_msgSend(v3, "chatStyle");
  objc_msgSend(v3, "account");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  IMCopyGUIDForChatOnAccount(v3, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  IMComponentsFromChatGUID();
  v12 = 0;
  objc_msgSend(v3, "account");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    v14 = v12 == 0;
  else
    v14 = 1;
  v15 = !v14;

  if (v15)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v3, "account");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v25 = v3;
        v26 = 2112;
        v27 = v17;
        _os_log_impl(&dword_1A1FF4000, v16, OS_LOG_TYPE_INFO, "Forwarding decline chat for: %@   to account: %@", buf, 0x16u);

      }
    }
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "account");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "uniqueID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "declineInvitationToChatID:identifier:style:account:", v11, v12, v9, v20);

  }
LABEL_22:

}

- (void)_chat:(id)a3 setProperties:(id)a4 ofParticipant:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  BOOL v23;
  int v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  BOOL v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v34 = v8;
      v35 = 2112;
      v36 = v9;
      v37 = 2112;
      v38 = v10;
      _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_DEBUG, "chat: %@  properties: %@  participant: %@", buf, 0x20u);
    }

  }
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "capabilitiesForListenerID:", 0);
  if ((*MEMORY[0x1E0D36CD0] & v13) == 0)
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "capabilitiesForListenerID:", 0);
    if ((*MEMORY[0x1E0D36D28] & v15) == 0)
    {
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "capabilitiesForListenerID:", 0);
      v32 = (*MEMORY[0x1E0D36CC0] & v31) == 0;

      if (v32)
        goto LABEL_20;
      goto LABEL_9;
    }

  }
LABEL_9:
  objc_msgSend(v8, "account");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  IMCopyGUIDForChatOnAccount(v8, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  buf[0] = 0;
  IMComponentsFromChatGUID();
  v18 = 0;
  -[IMChatRegistry chatGUIDToChatMap](self, "chatGUIDToChatMap");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKey:", v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20 == 0;

  if (v21)
    -[IMChatRegistry _registerChat:isIncoming:guid:](self, "_registerChat:isIncoming:guid:", v8, 0, v17);
  objc_msgSend(v8, "account");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
    v23 = v18 == 0;
  else
    v23 = 1;
  v24 = !v23;

  if (v24)
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = buf[0];
    objc_msgSend(v8, "account");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "uniqueID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setProperties:ofParticipant:inChatID:identifier:style:account:", v9, v26, v17, v18, v27, v29);

  }
LABEL_20:

}

- (void)_chat:(id)a3 setValue:(id)a4 forChatProperty:(id)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  void *v28;
  int v29;
  BOOL v30;
  id v31;
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  id v40;
  __int16 v41;
  id v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v31 = a4;
  v33 = a5;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v40 = v8;
      v41 = 2112;
      v42 = v33;
      v43 = 2112;
      v44 = v31;
      _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_DEBUG, "chat: %@  property: %@  value: %@", buf, 0x20u);
    }

  }
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance", v31);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "capabilitiesForListenerID:", 0);
  if ((*MEMORY[0x1E0D36CD0] & v11) == 0)
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "capabilitiesForListenerID:", 0);
    if ((*MEMORY[0x1E0D36D28] & v13) == 0)
    {
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "capabilitiesForListenerID:", 0);
      v30 = (*MEMORY[0x1E0D36CC0] & v29) == 0;

      if (v30)
        goto LABEL_24;
      goto LABEL_9;
    }

  }
LABEL_9:
  objc_msgSend(v8, "account");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  IMCopyGUIDForChatOnAccount(v8, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMChatRegistry chatGUIDToChatMap](self, "chatGUIDToChatMap");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKey:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17 == 0;

  if (v18)
    -[IMChatRegistry _registerChat:isIncoming:guid:](self, "_registerChat:isIncoming:guid:", v8, 0, v15);
  if (v33)
  {
    v19 = (void *)MEMORY[0x1E0C99D80];
    if (v32)
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v32, v33);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "dictionaryWithObject:forKey:", v21, v33);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[IMChatRegistry allGUIDsForChat:](self, "allGUIDsForChat:", v8);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v35 != v24)
            objc_enumerationMutation(v22);
          v26 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
          +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "chat:updateProperties:", v26, v20);

        }
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v23);
    }

  }
LABEL_24:

}

- (void)_chat:(id)a3 updateDisplayName:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  char v25;
  void *v26;
  void *v27;
  int v28;
  BOOL v29;
  void *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[128];
  uint8_t buf[4];
  id v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v31 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v38 = v6;
      v39 = 2112;
      v40 = v31;
      _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_DEBUG, "chat: %@  update display name: %@", buf, 0x16u);
    }

  }
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "capabilitiesForListenerID:", 0);
  if ((*MEMORY[0x1E0D36CD0] & v9) == 0)
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "capabilitiesForListenerID:", 0);
    if ((*MEMORY[0x1E0D36D28] & v11) == 0)
    {
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "capabilitiesForListenerID:", 0);
      v29 = (*MEMORY[0x1E0D36CC0] & v28) == 0;

      if (v29)
        goto LABEL_22;
      goto LABEL_9;
    }

  }
LABEL_9:
  objc_msgSend(v6, "account");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  IMCopyGUIDForChatOnAccount(v6, v12);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMChatRegistry chatGUIDToChatMap](self, "chatGUIDToChatMap");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", v30);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14 == 0;

  if (v15)
    -[IMChatRegistry _registerChat:isIncoming:guid:](self, "_registerChat:isIncoming:guid:", v6, 0, v30);
  -[IMChatRegistry allGUIDsForChat:](self, "allGUIDsForChat:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v18 = v16;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v33;
    v21 = (_QWORD *)MEMORY[0x1E0D38F68];
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v33 != v20)
          objc_enumerationMutation(v18);
        v23 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v22);
        if (!objc_msgSend(v6, "shouldIgnoreiMessageSiblingGroupIdentityUpdates")
          || (IMComponentsFromChatGUID(),
              v24 = 0,
              v25 = objc_msgSend(v24, "isEqualToString:", *v21),
              v24,
              (v25 & 1) == 0))
        {
          +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "chat:updateDisplayName:messageID:", v23, v31, v17);

        }
        ++v22;
      }
      while (v19 != v22);
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v19);
  }

LABEL_22:
}

- (void)_chat:(id)a3 updateLastAddressedHandle:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  int v25;
  BOOL v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v33 = v6;
      v34 = 2112;
      v35 = v7;
      _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_DEBUG, "chat: %@  update last address handle: %@", buf, 0x16u);
    }

  }
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "capabilitiesForListenerID:", 0);
  if ((*MEMORY[0x1E0D36CD0] & v10) == 0)
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "capabilitiesForListenerID:", 0);
    if ((*MEMORY[0x1E0D36D28] & v12) == 0)
    {
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "capabilitiesForListenerID:", 0);
      v26 = (*MEMORY[0x1E0D36CC0] & v25) == 0;

      if (v26)
        goto LABEL_19;
      goto LABEL_9;
    }

  }
LABEL_9:
  objc_msgSend(v6, "account");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  IMCopyGUIDForChatOnAccount(v6, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMChatRegistry chatGUIDToChatMap](self, "chatGUIDToChatMap");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16 == 0;

  if (v17)
    -[IMChatRegistry _registerChat:isIncoming:guid:](self, "_registerChat:isIncoming:guid:", v6, 0, v14);
  -[IMChatRegistry allGUIDsForChat:](self, "allGUIDsForChat:", v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v28;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v28 != v20)
          objc_enumerationMutation(v18);
        v22 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v21);
        +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "chat:updateLastAddressHandle:", v22, v7);

        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v19);
  }

LABEL_19:
}

- (void)_chat:(id)a3 updateLastAddressedSIMID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  int v25;
  BOOL v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v33 = v6;
      v34 = 2112;
      v35 = v7;
      _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_DEBUG, "chat: %@  update last address uniqueID: %@", buf, 0x16u);
    }

  }
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "capabilitiesForListenerID:", 0);
  if ((*MEMORY[0x1E0D36CD0] & v10) == 0)
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "capabilitiesForListenerID:", 0);
    if ((*MEMORY[0x1E0D36D28] & v12) == 0)
    {
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "capabilitiesForListenerID:", 0);
      v26 = (*MEMORY[0x1E0D36CC0] & v25) == 0;

      if (v26)
        goto LABEL_19;
      goto LABEL_9;
    }

  }
LABEL_9:
  objc_msgSend(v6, "account");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  IMCopyGUIDForChatOnAccount(v6, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMChatRegistry chatGUIDToChatMap](self, "chatGUIDToChatMap");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16 == 0;

  if (v17)
    -[IMChatRegistry _registerChat:isIncoming:guid:](self, "_registerChat:isIncoming:guid:", v6, 0, v14);
  -[IMChatRegistry allGUIDsForChat:](self, "allGUIDsForChat:", v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v28;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v28 != v20)
          objc_enumerationMutation(v18);
        v22 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v21);
        +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "chat:updateLastAddressedSIMID:", v22, v7);

        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v19);
  }

LABEL_19:
}

- (void)_chat:(id)a3 updateIsFiltered:(int64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  BOOL v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  id v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v32 = v6;
      v33 = 1024;
      v34 = a4;
      _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "chat: %@  update is filtered: %d", buf, 0x12u);
    }

  }
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "capabilitiesForListenerID:", 0);
  if ((*MEMORY[0x1E0D36CD0] & v9) == 0)
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "capabilitiesForListenerID:", 0);
    if ((*MEMORY[0x1E0D36D28] & v11) == 0)
    {
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "capabilitiesForListenerID:", 0);
      v25 = (*MEMORY[0x1E0D36CC0] & v24) == 0;

      if (v25)
        goto LABEL_19;
      goto LABEL_9;
    }

  }
LABEL_9:
  objc_msgSend(v6, "account");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  IMCopyGUIDForChatOnAccount(v6, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMChatRegistry chatGUIDToChatMap](self, "chatGUIDToChatMap");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15 == 0;

  if (v16)
    -[IMChatRegistry _registerChat:isIncoming:guid:](self, "_registerChat:isIncoming:guid:", v6, 0, v13);
  -[IMChatRegistry allGUIDsForChat:](self, "allGUIDsForChat:", v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v27;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v27 != v19)
          objc_enumerationMutation(v17);
        v21 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v20);
        +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "chat:updateIsFiltered:", v21, a4);

        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v18);
  }

LABEL_19:
}

- (void)_chat:(id)a3 updateIsBlackholed:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  BOOL v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  id v32;
  __int16 v33;
  _BOOL4 v34;
  uint64_t v35;

  v4 = a4;
  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v32 = v6;
      v33 = 1024;
      v34 = v4;
      _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "chat: %@  update is blackholed: %d", buf, 0x12u);
    }

  }
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "capabilitiesForListenerID:", 0);
  if ((*MEMORY[0x1E0D36CD0] & v9) == 0)
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "capabilitiesForListenerID:", 0);
    if ((*MEMORY[0x1E0D36D28] & v11) == 0)
    {
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "capabilitiesForListenerID:", 0);
      v25 = (*MEMORY[0x1E0D36CC0] & v24) == 0;

      if (v25)
        goto LABEL_21;
      goto LABEL_9;
    }

  }
LABEL_9:
  if (!v4)
    objc_msgSend(v6, "setValue:forChatProperty:", MEMORY[0x1E0C9AAB0], CFSTR("restoredFromBlackhole"));
  objc_msgSend(v6, "account");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  IMCopyGUIDForChatOnAccount(v6, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMChatRegistry allGUIDsForChat:](self, "allGUIDsForChat:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMChatRegistry chatGUIDToChatMap](self, "chatGUIDToChatMap");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    -[IMChatRegistry _unregisterChat:](self, "_unregisterChat:", v6);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v17 = v14;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v27;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v27 != v19)
          objc_enumerationMutation(v17);
        v21 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v20);
        +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance", (_QWORD)v26);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "chat:updateIsBlackholed:", v21, v4);

        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v18);
  }

LABEL_21:
}

- (void)_chat:(id)a3 updateIsRecovered:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  BOOL v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  _BOOL4 v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v4 = a4;
  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      v32 = v4;
      v33 = 2112;
      v34 = v6;
      _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "Update is recovered: %d for chat: %@", buf, 0x12u);
    }

  }
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "capabilitiesForListenerID:", 0);
  if ((*MEMORY[0x1E0D36CD0] & v9) == 0)
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "capabilitiesForListenerID:", 0);
    if ((*MEMORY[0x1E0D36D28] & v11) == 0)
    {
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "capabilitiesForListenerID:", 0);
      v25 = (*MEMORY[0x1E0D36CC0] & v24) == 0;

      if (v25)
        goto LABEL_19;
      goto LABEL_9;
    }

  }
LABEL_9:
  objc_msgSend(v6, "account");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  IMCopyGUIDForChatOnAccount(v6, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMChatRegistry chatGUIDToChatMap](self, "chatGUIDToChatMap");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15 == 0;

  if (v16)
    -[IMChatRegistry _registerChat:isIncoming:guid:](self, "_registerChat:isIncoming:guid:", v6, 0, v13);
  -[IMChatRegistry allGUIDsForChat:](self, "allGUIDsForChat:", v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v27;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v27 != v19)
          objc_enumerationMutation(v17);
        v21 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v20);
        +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "chat:updateIsRecovered:", v21, v4);

        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v18);
  }

LABEL_19:
}

- (void)_chat:(id)a3 updateIsDeletingIncomingMessages:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  BOOL v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  _BOOL4 v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v4 = a4;
  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      v32 = v4;
      v33 = 2112;
      v34 = v6;
      _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "Update isDeletingIncomingMessages: %d for chat: %@", buf, 0x12u);
    }

  }
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "capabilitiesForListenerID:", 0);
  if ((*MEMORY[0x1E0D36CD0] & v9) == 0)
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "capabilitiesForListenerID:", 0);
    if ((*MEMORY[0x1E0D36D28] & v11) == 0)
    {
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "capabilitiesForListenerID:", 0);
      v25 = (*MEMORY[0x1E0D36CC0] & v24) == 0;

      if (v25)
        goto LABEL_19;
      goto LABEL_9;
    }

  }
LABEL_9:
  objc_msgSend(v6, "account");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  IMCopyGUIDForChatOnAccount(v6, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMChatRegistry chatGUIDToChatMap](self, "chatGUIDToChatMap");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15 == 0;

  if (v16)
    -[IMChatRegistry _registerChat:isIncoming:guid:](self, "_registerChat:isIncoming:guid:", v6, 0, v13);
  -[IMChatRegistry allGUIDsForChat:](self, "allGUIDsForChat:", v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v27;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v27 != v19)
          objc_enumerationMutation(v17);
        v21 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v20);
        +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "chat:updateIsDeletingIncomingMessages:", v21, v4);

        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v18);
  }

LABEL_19:
}

- (void)_chat_fetchIncomingPendingMessagesOverSatellite:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v8 = 0;
  v9 = 0;
  sub_1A2125B7C(self, a3, &v9, &v8);
  v4 = v9;
  v5 = v8;
  -[IMChatRegistry daemonController](self, "daemonController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteDaemon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchIncomingPendingMessagesOverSatelliteForChatsWithIDs:services:", v4, v5);

}

- (void)_loadSiblingsForChatIfNeeded:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "chatStyle") == 45 && (objc_msgSend(v4, "hasQueriedForSiblingChats") & 1) == 0)
  {
    v6[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMChatRegistry _loadAllSiblingChatsForHandlesAssociatedWithChats:waitForReply:completionHandler:](self, "_loadAllSiblingChatsForHandlesAssociatedWithChats:waitForReply:completionHandler:", v5, 1, 0);

    objc_msgSend(v4, "setHasQueriedForSiblingChats:", 1);
  }

}

- (void)_chat_loadHistory:(id)a3 limit:(unint64_t)a4 beforeGUID:(id)a5 afterGUID:(id)a6 threadIdentifier:(id)a7 queryID:(id)a8 synchronous:(BOOL)a9 completion:(id)a10
{
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  void *v27;
  NSObject *v28;
  os_signpost_id_t v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  id v34;
  NSObject *v35;
  void *v36;
  char v37;
  void *v38;
  int v39;
  BOOL v40;
  id v41;
  id v42;
  id v43;
  id v45;
  id v46;
  id v47;
  id v48;
  _QWORD v49[4];
  NSObject *v50;
  id v51;
  id v52;
  os_signpost_id_t v53;
  BOOL v54;
  _QWORD aBlock[5];
  id v56;
  id v57;
  id v58;
  unint64_t v59;
  id v60;
  id v61;
  uint8_t buf[4];
  id v63;
  __int16 v64;
  int v65;
  __int16 v66;
  id v67;
  __int16 v68;
  id v69;
  __int16 v70;
  id v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v48 = a3;
  v45 = a5;
  v46 = a6;
  v42 = a7;
  v47 = a8;
  v43 = a10;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413314;
      v63 = v48;
      v64 = 1024;
      v65 = a4;
      v66 = 2112;
      v67 = v45;
      v68 = 2112;
      v69 = v46;
      v70 = 2112;
      v71 = v47;
      _os_log_impl(&dword_1A1FF4000, v15, OS_LOG_TYPE_DEBUG, "chat: %@ limit: %d beforeGUID: %@ afterGUID: %@ queryID: %@", buf, 0x30u);
    }

  }
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "capabilitiesForListenerID:", 0);
  if ((*MEMORY[0x1E0D36CD0] & v17) == 0)
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "capabilitiesForListenerID:", 0);
    if ((*MEMORY[0x1E0D36D28] & v19) == 0)
    {
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "capabilitiesForListenerID:", 0);
      v40 = (*MEMORY[0x1E0D36CC0] & v39) == 0;

      if (v40)
        goto LABEL_20;
      goto LABEL_9;
    }

  }
LABEL_9:
  -[IMChatRegistry _loadSiblingsForChatIfNeeded:](self, "_loadSiblingsForChatIfNeeded:", v48);
  v60 = 0;
  v61 = 0;
  sub_1A2125B7C(self, v48, &v61, &v60);
  v41 = v61;
  v20 = v60;
  -[IMChatRegistry daemonController](self, "daemonController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (a9)
    objc_msgSend(v21, "synchronousRemoteDaemon");
  else
    objc_msgSend(v21, "remoteDaemon");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1A212CF38;
  aBlock[3] = &unk_1E47229A0;
  aBlock[4] = self;
  v56 = v47;
  v25 = v48;
  v57 = v25;
  v26 = v20;
  v58 = v26;
  v59 = a4;
  v27 = _Block_copy(aBlock);
  IMLogHandleForCategory();
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = os_signpost_id_generate(v28);
  v30 = v28;
  v31 = v30;
  if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A1FF4000, v31, OS_SIGNPOST_INTERVAL_BEGIN, v29, "loadHistoryForChatWithGUID", ", buf, 2u);
  }

  objc_msgSend(v25, "guid");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v25, "chatStyle");
  v49[0] = v24;
  v49[1] = 3221225472;
  v49[2] = sub_1A212CFD4;
  v49[3] = &unk_1E47229F0;
  v53 = v29;
  v50 = v31;
  v51 = v27;
  v54 = a9;
  v52 = v43;
  v34 = v27;
  v35 = v31;
  objc_msgSend(v23, "loadHistoryForChatWithGUID:chatIdentifiers:style:services:limit:beforeGUID:afterGUID:threadIdentifier:reply:", v32, v41, v33, v26, a4, v45, v46, v42, v49);

  if (objc_msgSend(v25, "isFiltered"))
  {
    if ((objc_msgSend(v25, "supportsFilteringExtensions") & 1) == 0)
    {
      objc_msgSend(v25, "valueForChatProperty:", CFSTR("hasViewedPotentialSpamChat"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "BOOLValue");

      if ((v37 & 1) == 0)
        objc_msgSend(v25, "setValue:forChatProperty:", MEMORY[0x1E0C9AAB0], CFSTR("hasViewedPotentialSpamChat"));
    }
  }

LABEL_20:
}

- (void)_chat_loadPagedHistory:(id)a3 numberOfMessagesBefore:(unint64_t)a4 numberOfMessagesAfter:(unint64_t)a5 messageGUID:(id)a6 threadIdentifier:(id)a7 queryID:(id)a8 synchronous:(BOOL)a9 completion:(id)a10
{
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  id v21;
  NSObject *v22;
  os_signpost_id_t v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  NSObject *v32;
  void *v33;
  int v34;
  BOOL v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  _QWORD v42[4];
  NSObject *v43;
  IMChatRegistry *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  os_signpost_id_t v49;
  unint64_t v50;
  unint64_t v51;
  BOOL v52;
  id v53;
  id v54;
  uint8_t buf[4];
  id v56;
  __int16 v57;
  int v58;
  __int16 v59;
  int v60;
  __int16 v61;
  id v62;
  __int16 v63;
  id v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v41 = a3;
  v39 = a6;
  v37 = a7;
  v40 = a8;
  v38 = a10;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413314;
      v56 = v41;
      v57 = 1024;
      v58 = a4;
      v59 = 1024;
      v60 = a5;
      v61 = 2112;
      v62 = v39;
      v63 = 2112;
      v64 = v40;
      _os_log_impl(&dword_1A1FF4000, v16, OS_LOG_TYPE_DEBUG, "_chat_loadPagedHistory chat: %@ numberOfMessagesBefore: %d numberOfMessagesAfter: %d messageGUID: %@ queryID: %@", buf, 0x2Cu);
    }

  }
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "capabilitiesForListenerID:", 0);
  if ((*MEMORY[0x1E0D36CD0] & v18) == 0)
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "capabilitiesForListenerID:", 0);
    if ((*MEMORY[0x1E0D36D28] & v20) == 0)
    {
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "capabilitiesForListenerID:", 0);
      v35 = (*MEMORY[0x1E0D36CC0] & v34) == 0;

      if (v35)
        goto LABEL_16;
      goto LABEL_9;
    }

  }
LABEL_9:
  -[IMChatRegistry _loadSiblingsForChatIfNeeded:](self, "_loadSiblingsForChatIfNeeded:", v41);
  v53 = 0;
  v54 = 0;
  sub_1A2125B7C(self, v41, &v54, &v53);
  v36 = v54;
  v21 = v53;
  IMLogHandleForCategory();
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = os_signpost_id_generate(v22);
  v24 = v22;
  v25 = v24;
  if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A1FF4000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v23, "loadPagedHistoryAroundMessageWithGUID", ", buf, 2u);
  }

  -[IMChatRegistry daemonController](self, "daemonController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (a9)
    objc_msgSend(v26, "synchronousRemoteDaemon");
  else
    objc_msgSend(v26, "remoteDaemon");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v41, "guid");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v41, "chatStyle");
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = sub_1A212D5BC;
  v42[3] = &unk_1E4722A40;
  v49 = v23;
  v43 = v25;
  v44 = self;
  v45 = v40;
  v46 = v41;
  v47 = v21;
  v50 = a4;
  v51 = a5;
  v52 = a9;
  v48 = v38;
  v31 = v21;
  v32 = v25;
  objc_msgSend(v28, "loadPagedHistoryAroundMessageWithGUID:chatGUID:chatIdentifiers:style:services:numberOfMessagesBefore:numberOfMessagesAfter:threadIdentifier:reply:", v39, v29, v36, v30, v31, a4, a5, v37, v42);

LABEL_16:
}

- (void)_chat_fetchHistorySummary:(id)a3 dateInterval:(id)a4 synchronous:(BOOL)a5 queryID:(id)a6 completion:(id)a7
{
  _BOOL4 v9;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  BOOL v29;
  _QWORD v30[4];
  id v31;
  id v32;
  BOOL v33;
  id v34;
  id v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  _BOOL4 v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v9 = a5;
  v44 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413058;
      v37 = v12;
      v38 = 2112;
      v39 = v13;
      v40 = 1024;
      v41 = v9;
      v42 = 2112;
      v43 = v14;
      _os_log_impl(&dword_1A1FF4000, v16, OS_LOG_TYPE_DEBUG, "_chat_fetchHistorySummary chat: %@ dateInterval: %@ synchronous: %d queryID: %@", buf, 0x26u);
    }

  }
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "capabilitiesForListenerID:", 0);
  if ((*MEMORY[0x1E0D36CD0] & v18) == 0)
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "capabilitiesForListenerID:", 0);
    if ((*MEMORY[0x1E0D36D28] & v20) == 0)
    {
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "capabilitiesForListenerID:", 0);
      v29 = (*MEMORY[0x1E0D36CC0] & v28) == 0;

      if (v29)
        goto LABEL_13;
      goto LABEL_9;
    }

  }
LABEL_9:
  -[IMChatRegistry _loadSiblingsForChatIfNeeded:](self, "_loadSiblingsForChatIfNeeded:", v12);
  v34 = 0;
  v35 = 0;
  sub_1A2125B7C(self, v12, &v35, &v34);
  v21 = v35;
  v22 = v34;
  v23 = objc_msgSend(v12, "chatStyle");
  -[IMChatRegistry daemonController](self, "daemonController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v9)
    objc_msgSend(v24, "synchronousRemoteDaemon");
  else
    objc_msgSend(v24, "remoteDaemon");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = sub_1A212DB24;
  v30[3] = &unk_1E4722A68;
  v33 = v9;
  v32 = v15;
  v31 = v14;
  objc_msgSend(v26, "fetchMessageHistorySummaryForDateInterval:chatIdentifiers:chatStyle:services:reply:", v13, v21, v23, v22, v30);

LABEL_13:
}

- (void)_chat_fetchOldestMessageDateForChat:(id)a3 synchronous:(BOOL)a4 queryID:(id)a5 completion:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  BOOL v26;
  _QWORD v27[4];
  id v28;
  id v29;
  BOOL v30;
  id v31;
  id v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  _BOOL4 v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v8 = a4;
  v39 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v34 = v10;
      v35 = 1024;
      v36 = v8;
      v37 = 2112;
      v38 = v11;
      _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_DEBUG, "_chat_fetchOldestMessageDateForChat chat: %@ synchronous: %d queryID: %@", buf, 0x1Cu);
    }

  }
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "capabilitiesForListenerID:", 0);
  if ((*MEMORY[0x1E0D36CD0] & v15) == 0)
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "capabilitiesForListenerID:", 0);
    if ((*MEMORY[0x1E0D36D28] & v17) == 0)
    {
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "capabilitiesForListenerID:", 0);
      v26 = (*MEMORY[0x1E0D36CC0] & v25) == 0;

      if (v26)
        goto LABEL_13;
      goto LABEL_9;
    }

  }
LABEL_9:
  -[IMChatRegistry _loadSiblingsForChatIfNeeded:](self, "_loadSiblingsForChatIfNeeded:", v10);
  v31 = 0;
  v32 = 0;
  sub_1A2125B7C(self, v10, &v32, &v31);
  v18 = v32;
  v19 = v31;
  v20 = objc_msgSend(v10, "chatStyle");
  -[IMChatRegistry daemonController](self, "daemonController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v8)
    objc_msgSend(v21, "synchronousRemoteDaemon");
  else
    objc_msgSend(v21, "remoteDaemon");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = sub_1A212DECC;
  v27[3] = &unk_1E4722A90;
  v30 = v8;
  v29 = v12;
  v28 = v11;
  objc_msgSend(v23, "fetchOldestMessageDateForChatIdentifiers:chatStyle:services:reply:", v18, v20, v19, v27);

LABEL_13:
}

- (void)_chat_clearHistory:(id)a3 beforeGUID:(id)a4 afterGUID:(id)a5 queryID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  int v25;
  BOOL v26;
  id v27;
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413058;
      v30 = v10;
      v31 = 2112;
      v32 = v11;
      v33 = 2112;
      v34 = v12;
      v35 = 2112;
      v36 = v13;
      _os_log_impl(&dword_1A1FF4000, v14, OS_LOG_TYPE_DEBUG, "chat: %@ beforeGUID: %@ afterGUID: %@ queryID: %@", buf, 0x2Au);
    }

  }
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "capabilitiesForListenerID:", 0);
  if ((*MEMORY[0x1E0D36CD0] & v16) == 0)
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "capabilitiesForListenerID:", 0);
    if ((*MEMORY[0x1E0D36D28] & v18) == 0)
    {
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "capabilitiesForListenerID:", 0);
      v26 = (*MEMORY[0x1E0D36CC0] & v25) == 0;

      if (v26)
        goto LABEL_10;
      goto LABEL_9;
    }

  }
LABEL_9:
  v27 = 0;
  v28 = 0;
  sub_1A2125B7C(self, v10, &v28, &v27);
  v19 = v28;
  v20 = v27;
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v10, "chatStyle");
  objc_msgSend(v10, "guid");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "clearHistoryForIDs:style:onServices:beforeGUID:afterGUID:chatID:queryID:", v19, v22, v20, v11, v12, v23, v13);

LABEL_10:
}

- (void)_chat_markAsSpam:(id)a3 queryID:(id)a4 isJunkReportedToCarrier:(BOOL)a5
{
  -[IMChatRegistry _chat_markAsSpam:queryID:autoReport:isJunkReportedToCarrier:reportReason:](self, "_chat_markAsSpam:queryID:autoReport:isJunkReportedToCarrier:reportReason:", a3, a4, 0, a5, 0);
}

- (void)_chat_markAsSpamAutomatically:(id)a3
{
  -[IMChatRegistry _chat_markAsSpam:queryID:autoReport:isJunkReportedToCarrier:reportReason:](self, "_chat_markAsSpam:queryID:autoReport:isJunkReportedToCarrier:reportReason:", a3, 0, 1, 0, 0);
}

- (void)_chat_markAsSpam:(id)a3 queryID:(id)a4 autoReport:(BOOL)a5 isJunkReportedToCarrier:(BOOL)a6 reportReason:(unint64_t)a7
{
  _BOOL8 v7;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  id v17;
  id v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  int v27;
  BOOL v28;
  _BOOL4 v30;
  _QWORD v31[5];
  id v32;
  id v33;
  id v34;
  BOOL v35;
  id v36;
  id v37;
  uint8_t buf[4];
  id v39;
  uint64_t v40;

  v30 = a6;
  v7 = a5;
  v40 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v10;
      _os_log_impl(&dword_1A1FF4000, v12, OS_LOG_TYPE_INFO, "chat: %@", buf, 0xCu);
    }

  }
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "capabilitiesForListenerID:", 0);
  if ((*MEMORY[0x1E0D36CD0] & v14) == 0)
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "capabilitiesForListenerID:", 0);
    if ((*MEMORY[0x1E0D36D28] & v16) == 0)
    {
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "capabilitiesForListenerID:", 0);
      v28 = (*MEMORY[0x1E0D36CC0] & v27) == 0;

      if (v28)
        goto LABEL_16;
      goto LABEL_9;
    }

  }
LABEL_9:
  v36 = 0;
  v37 = 0;
  sub_1A2125B7C(self, v10, &v37, &v36);
  v17 = v37;
  v18 = v36;
  if (objc_msgSend(v11, "length"))
    v19 = !v7;
  else
    v19 = 0;
  -[IMChatRegistry daemonController](self, "daemonController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v19)
    objc_msgSend(v20, "synchronousRemoteDaemon");
  else
    objc_msgSend(v20, "remoteDaemon");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "guid");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v10, "chatStyle");
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = sub_1A212E530;
  v31[3] = &unk_1E4722AB8;
  v35 = v19;
  v31[4] = self;
  v32 = v11;
  v33 = v10;
  v34 = v18;
  v25 = v18;
  objc_msgSend(v22, "markChatAsSpamWithGUID:chatIdentifiers:style:services:isAutoReport:isJunkReportedToCarrier:reportReason:reply:", v23, v17, v24, v25, v7, v30, a7, v31);

LABEL_16:
}

- (void)_chat_loadFrequentReplies:(id)a3 limit:(unint64_t)a4 queryID:(id)a5 loadImmediately:(BOOL)a6
{
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  int v25;
  BOOL v26;
  id v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  unint64_t v32;
  BOOL v33;
  id v34;
  id v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  int v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v27 = a5;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v37 = v10;
      v38 = 1024;
      v39 = a4;
      v40 = 2112;
      v41 = v27;
      _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_DEBUG, "chat: %@ limit:%d queryID: %@", buf, 0x1Cu);
    }

  }
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "capabilitiesForListenerID:", 0);
  if ((*MEMORY[0x1E0D36CD0] & v13) == 0)
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "capabilitiesForListenerID:", 0);
    if ((*MEMORY[0x1E0D36D28] & v15) == 0)
    {
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "capabilitiesForListenerID:", 0);
      v26 = (*MEMORY[0x1E0D36CC0] & v25) == 0;

      if (v26)
        goto LABEL_13;
      goto LABEL_9;
    }

  }
LABEL_9:
  v34 = 0;
  v35 = 0;
  sub_1A2125B7C(self, v10, &v35, &v34);
  v16 = v35;
  v17 = v34;
  -[IMChatRegistry daemonController](self, "daemonController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (a6)
    objc_msgSend(v18, "synchronousRemoteDaemon");
  else
    objc_msgSend(v18, "remoteDaemon");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "guid");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v10, "chatStyle");
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = sub_1A212E8CC;
  v28[3] = &unk_1E4722B08;
  v33 = a6;
  v28[4] = self;
  v29 = v27;
  v30 = v10;
  v31 = v17;
  v32 = a4;
  v23 = v17;
  objc_msgSend(v20, "loadFrequentRepliesForChatWithGUID:chatIdentifiers:style:services:limit:reply:", v21, v16, v22, v23, a4, v28);

LABEL_13:
}

- (void)_chat_loadUnreadMessages:(id)a3 limit:(unint64_t)a4 fallbackGUID:(id)a5 queryID:(id)a6 loadImmediately:(BOOL)a7
{
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  int v30;
  BOOL v31;
  id v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  BOOL v37;
  _QWORD aBlock[5];
  id v39;
  id v40;
  id v41;
  unint64_t v42;
  id v43;
  id v44;
  uint8_t buf[4];
  id v46;
  __int16 v47;
  unint64_t v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v34 = a3;
  v32 = a5;
  v33 = a6;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v46 = v34;
      v47 = 2048;
      v48 = a4;
      v49 = 2112;
      v50 = v33;
      _os_log_impl(&dword_1A1FF4000, v12, OS_LOG_TYPE_DEBUG, "chat: %@ limit:%lu queryID: %@", buf, 0x20u);
    }

  }
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "capabilitiesForListenerID:", 0);
  if ((*MEMORY[0x1E0D36CD0] & v14) == 0)
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "capabilitiesForListenerID:", 0);
    if ((*MEMORY[0x1E0D36D28] & v16) == 0)
    {
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "capabilitiesForListenerID:", 0);
      v31 = (*MEMORY[0x1E0D36CC0] & v30) == 0;

      if (v31)
        goto LABEL_13;
      goto LABEL_9;
    }

  }
LABEL_9:
  v43 = 0;
  v44 = 0;
  sub_1A2125B7C(self, v34, &v44, &v43);
  v17 = v44;
  v18 = v43;
  -[IMChatRegistry daemonController](self, "daemonController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (a7)
    objc_msgSend(v19, "synchronousRemoteDaemon");
  else
    objc_msgSend(v19, "remoteDaemon");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1A212EDB0;
  aBlock[3] = &unk_1E47229A0;
  aBlock[4] = self;
  v39 = v33;
  v23 = v34;
  v40 = v23;
  v41 = v18;
  v42 = a4;
  v24 = v18;
  v25 = _Block_copy(aBlock);
  objc_msgSend(v23, "guid");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v23, "chatStyle");
  v35[0] = v22;
  v35[1] = 3221225472;
  v35[2] = sub_1A212EE4C;
  v35[3] = &unk_1E4722B30;
  v37 = a7;
  v36 = v25;
  v28 = v25;
  objc_msgSend(v21, "loadUnreadHistoryForChatWithGUID:chatIdentifiers:style:services:limit:fallbackMessageGUID:reply:", v26, v17, v27, v24, a4, v32, v35);

LABEL_13:
}

- (void)_chat_loadAttachments:(id)a3 queryID:(id)a4 loadImmediately:(BOOL)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  int v24;
  BOOL v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  BOOL v30;
  id v31;
  id v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v34 = v8;
      v35 = 2112;
      v36 = v9;
      _os_log_impl(&dword_1A1FF4000, v10, OS_LOG_TYPE_DEBUG, "chat: %@ queryID: %@", buf, 0x16u);
    }

  }
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "capabilitiesForListenerID:", 0);
  if ((*MEMORY[0x1E0D36CD0] & v12) == 0)
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "capabilitiesForListenerID:", 0);
    if ((*MEMORY[0x1E0D36D28] & v14) == 0)
    {
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "capabilitiesForListenerID:", 0);
      v25 = (*MEMORY[0x1E0D36CC0] & v24) == 0;

      if (v25)
        goto LABEL_13;
      goto LABEL_9;
    }

  }
LABEL_9:
  v31 = 0;
  v32 = 0;
  sub_1A2125B7C(self, v8, &v32, &v31);
  v15 = v32;
  v16 = v31;
  -[IMChatRegistry daemonController](self, "daemonController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (a5)
    objc_msgSend(v17, "synchronousRemoteDaemon");
  else
    objc_msgSend(v17, "remoteDaemon");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "guid");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v8, "chatStyle");
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = sub_1A212F214;
  v26[3] = &unk_1E4722B58;
  v30 = a5;
  v26[4] = self;
  v27 = v9;
  v28 = v8;
  v29 = v16;
  v22 = v16;
  objc_msgSend(v19, "loadAttachmentsForChatWithGUID:chatIdentifiers:style:services:reply:", v20, v15, v21, v22, v26);

LABEL_13:
}

- (void)_chat_loadUncachedAttachmentsCount:(id)a3 queryID:(id)a4 loadImmediately:(BOOL)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  int v24;
  BOOL v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  BOOL v30;
  id v31;
  id v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v34 = v8;
      v35 = 2112;
      v36 = v9;
      _os_log_impl(&dword_1A1FF4000, v10, OS_LOG_TYPE_DEBUG, "chat: %@ queryID: %@", buf, 0x16u);
    }

  }
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "capabilitiesForListenerID:", 0);
  if ((*MEMORY[0x1E0D36CD0] & v12) == 0)
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "capabilitiesForListenerID:", 0);
    if ((*MEMORY[0x1E0D36D28] & v14) == 0)
    {
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "capabilitiesForListenerID:", 0);
      v25 = (*MEMORY[0x1E0D36CC0] & v24) == 0;

      if (v25)
        goto LABEL_13;
      goto LABEL_9;
    }

  }
LABEL_9:
  v31 = 0;
  v32 = 0;
  sub_1A2125B7C(self, v8, &v32, &v31);
  v15 = v32;
  v16 = v31;
  -[IMChatRegistry daemonController](self, "daemonController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (a5)
    objc_msgSend(v17, "synchronousRemoteDaemon");
  else
    objc_msgSend(v17, "remoteDaemon");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "guid");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v8, "chatStyle");
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = sub_1A212F650;
  v26[3] = &unk_1E4722AB8;
  v30 = a5;
  v26[4] = self;
  v27 = v9;
  v28 = v8;
  v29 = v16;
  v22 = v16;
  objc_msgSend(v19, "loadUncachedAttachmentCountForChatWithGUID:chatIdentifiers:style:services:reply:", v20, v15, v21, v22, v26);

LABEL_13:
}

- (void)_chat_downloadPurgedAttachmentsForChat:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  BOOL v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v4;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Download purged attachments for chat %@", buf, 0xCu);
    }

  }
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "capabilitiesForListenerID:", 0);
  if ((*MEMORY[0x1E0D36CD0] & v7) == 0)
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "capabilitiesForListenerID:", 0);
    if ((*MEMORY[0x1E0D36D28] & v9) == 0)
    {
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "capabilitiesForListenerID:", 0);
      v17 = (*MEMORY[0x1E0D36CC0] & v16) == 0;

      if (v17)
        goto LABEL_10;
      goto LABEL_9;
    }

  }
LABEL_9:
  v18 = 0;
  v19 = 0;
  sub_1A2125B7C(self, v4, &v19, &v18);
  v10 = v19;
  v11 = v18;
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v4, "chatStyle");
  objc_msgSend(v4, "guid");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "downloadPurgedAttachmentsForIDs:style:onServices:chatID:", v10, v13, v11, v14);

LABEL_10:
}

- (void)_chat_isDownloadingPurgedAssetsForChat:(id)a3 queryID:(id)a4 loadImmediately:(BOOL)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  int v24;
  BOOL v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  BOOL v30;
  id v31;
  id v32;
  uint8_t buf[4];
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v8;
      _os_log_impl(&dword_1A1FF4000, v10, OS_LOG_TYPE_INFO, "Getting isDownloadingPurgedAssets for chat %@", buf, 0xCu);
    }

  }
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "capabilitiesForListenerID:", 0);
  if ((*MEMORY[0x1E0D36CD0] & v12) == 0)
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "capabilitiesForListenerID:", 0);
    if ((*MEMORY[0x1E0D36D28] & v14) == 0)
    {
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "capabilitiesForListenerID:", 0);
      v25 = (*MEMORY[0x1E0D36CC0] & v24) == 0;

      if (v25)
        goto LABEL_13;
      goto LABEL_9;
    }

  }
LABEL_9:
  v31 = 0;
  v32 = 0;
  sub_1A2125B7C(self, v8, &v32, &v31);
  v15 = v32;
  v16 = v31;
  -[IMChatRegistry daemonController](self, "daemonController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (a5)
    objc_msgSend(v17, "synchronousReplyingRemoteDaemon");
  else
    objc_msgSend(v17, "replyingRemoteDaemon");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "guid");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v8, "chatStyle");
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = sub_1A212FCC4;
  v26[3] = &unk_1E4722BD0;
  v30 = a5;
  v26[4] = self;
  v27 = v9;
  v28 = v8;
  v29 = v16;
  v22 = v16;
  objc_msgSend(v19, "loadIsDownloadingPurgedAttachmentsForChatWithGUID:chatIdentifiers:style:services:reply:", v20, v15, v21, v22, v26);

LABEL_13:
}

- (void)_chat_closeSession:(id)a3 didDeleteConversation:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v4 = a4;
  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v5;
      _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "Close session for business chat: %@", buf, 0xCu);
    }

  }
  v7 = objc_msgSend(v5, "chatStyle");
  objc_msgSend(v5, "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  IMCopyGUIDForChatOnAccount(v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  IMComponentsFromChatGUID();
  v10 = 0;
  if (v10)
  {
    objc_msgSend(v5, "account");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = IMOSLoggingEnabled();
    if (v11)
    {
      if (v12)
      {
        OSLogHandleForIMFoundationCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v5, "account");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v20 = v10;
          v21 = 2112;
          v22 = v5;
          v23 = 2112;
          v24 = v14;
          _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "Closing chat session with business with chatIdentifier: %@ chat: %@ on account: %@", buf, 0x20u);

        }
      }
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "account");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "uniqueID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "closeSessionChatID:identifier:didDeleteConversation:style:account:", v9, v10, v4, v7, v17);

    }
    else if (v12)
    {
      OSLogHandleForIMFoundationCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v5;
        _os_log_impl(&dword_1A1FF4000, v18, OS_LOG_TYPE_INFO, "ChatRegistry - Cannot close session. Did not find account for chat: %@", buf, 0xCu);
      }

    }
  }

}

- (void)_chat_markRepliedForMessageGUID:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "markRepliedForMessageGUID:", v3);

}

- (id)_processLoadedChatDictionaries:(id)a3
{
  void *v3;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  const __CFString *v19;
  void *v20;
  id obj;
  void *v23;
  uint64_t v24;
  id v25;
  char v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  id v34;
  __int16 v35;
  void *v36;
  uint64_t v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v32 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "Loaded %llu chats from daemon", buf, 0xCu);
    }

  }
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v38, 16);
  if (v7)
  {
    v24 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v28 != v24)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v10 = (void *)MEMORY[0x1A8582D94]();
        v26 = 0;
        -[IMChatRegistry _lastMessageItemForChatDictionary:](self, "_lastMessageItemForChatDictionary:", v9);
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v11;
        if (v11)
        {
          v37 = v11;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v3;
        }
        else
        {
          v13 = 0;
        }
        v25 = 0;
        sub_1A2000CE4(self, v9, v13, 1, &v26, &v25);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v25;
        if (v12)

        if (v14)
        {
          -[IMChatRegistry _registerChatDictionary:forChat:isIncoming:newGUID:shouldPostNotification:](self, "_registerChatDictionary:forChat:isIncoming:newGUID:shouldPostNotification:", v9, v14, 1, v15, 1);
          -[IMChatRegistry _updateInfo:forGUID:updatingUnreadCount:](self, "_updateInfo:forGUID:updatingUnreadCount:", v9, v15, 1);
          objc_msgSend(v23, "addObject:", v14);
        }
        else if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("guid"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v32 = (uint64_t)v15;
            v33 = 2112;
            v34 = v17;
            _os_log_impl(&dword_1A1FF4000, v16, OS_LOG_TYPE_INFO, "Failed to reconstruct chat for chatGUID: %@ chatInfo[guid]: %@", buf, 0x16u);

          }
        }
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            v19 = CFSTR("YES");
            if (!v26)
              v19 = CFSTR("NO");
            *(_DWORD *)buf = 138412802;
            v32 = (uint64_t)v19;
            v33 = 2112;
            v34 = v15;
            v35 = 2112;
            v36 = v14;
            _os_log_impl(&dword_1A1FF4000, v18, OS_LOG_TYPE_INFO, "Loaded chat was created: %@ guid: %@ chat: %@", buf, 0x20u);
          }

        }
        objc_autoreleasePoolPop(v10);
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v38, 16);
    }
    while (v7);
  }

  objc_msgSend(v23, "array");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (void)loadedChats:(id)a3 queryID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[IMChatRegistry _processLoadedChatDictionaries:](self, "_processLoadedChatDictionaries:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMChatRegistry daemonQueryController](self, "daemonQueryController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = CFSTR("chats");
  v11[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "completeQuery:userInfo:", v6, v9);

}

- (void)markedAsReadForMessageGUID:(id)a3 success:(BOOL)a4 queryID:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v5 = a4;
  v14[2] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a3;
  -[IMChatRegistry daemonQueryController](self, "daemonQueryController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = CFSTR("messageGUID");
  v13[1] = CFSTR("success");
  v14[0] = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "completeQuery:userInfo:", v8, v12);
}

- (void)forcedReloadingChatRegistryWithQueryID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[IMChatRegistry daemonQueryController](self, "daemonQueryController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "completeQuery:userInfo:", v4, 0);

}

- (void)_account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 messagesUpdated:(id)a7
{
  -[IMChatRegistry _account:chat:style:chatProperties:messagesUpdated:suppressNotification:](self, "_account:chat:style:chatProperties:messagesUpdated:suppressNotification:", a3, a4, a5, a6, a7, 0);
}

- (void)_account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 messagesUpdated:(id)a7 suppressNotification:(BOOL)a8
{
  _BOOL8 v8;
  id v12;
  NSObject *v13;
  uint64_t i;
  void *v15;
  void *IMMessageFromIMItem;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  id v24;
  id obj;
  uint64_t v26;
  unsigned int v27;
  uint64_t v28;
  id v29;
  id v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint8_t v42[128];
  uint8_t buf[4];
  id v44;
  __int16 v45;
  id v46;
  __int16 v47;
  unsigned int v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v8 = a8;
  v27 = a5;
  v51 = *MEMORY[0x1E0C80C00];
  v31 = a3;
  v29 = a4;
  v24 = a6;
  v12 = a7;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413058;
      v44 = v31;
      v45 = 2112;
      v46 = v29;
      v47 = 1024;
      v48 = v27;
      v49 = 2112;
      v50 = v12;
      _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_DEBUG, "account: %@  chat: %@   style: %d  messages: %@", buf, 0x26u);
    }

  }
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v12;
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v28)
  {
    v26 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v38 != v26)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        _IMBestAccountForIMItem(v15, 0, v31, 0, 0);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        IMMessageFromIMItem = (void *)_CreateIMMessageFromIMItem(v15, v32, 1);
        _IMCheckMessageForDDResults(IMMessageFromIMItem);
        -[IMChatRegistry _existingChatWithIdentifier:style:account:](self, "_existingChatWithIdentifier:style:account:", v29, v27, v31);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v17, 0, v24);
        }
        else
        {
          -[IMChatRegistry _cachedChatsWithMessage:](self, "_cachedChatsWithMessage:", IMMessageFromIMItem);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v19 = v18;
        if (objc_msgSend(v18, "count"))
        {
          v35 = 0u;
          v36 = 0u;
          v33 = 0u;
          v34 = 0u;
          v20 = v19;
          v21 = -[NSObject countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
          if (v21)
          {
            v22 = *(_QWORD *)v34;
            do
            {
              for (j = 0; j != v21; ++j)
              {
                if (*(_QWORD *)v34 != v22)
                  objc_enumerationMutation(v20);
                objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * j), "_handleIncomingItem:updateRecipient:suppressNotification:", v15, 1, v8);
              }
              v21 = -[NSObject countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
            }
            while (v21);
          }
        }
        else
        {
          if (!IMOSLoggingEnabled())
            goto LABEL_26;
          OSLogHandleForIMFoundationCategory();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v44 = v29;
            _os_log_impl(&dword_1A1FF4000, v20, OS_LOG_TYPE_INFO, "No chat found for chat ID: %@", buf, 0xCu);
          }
        }

LABEL_26:
      }
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v28);
  }

}

- (void)service:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 messagesUpdated:(id)a6
{
  uint64_t v7;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  NSObject *v22;
  void *v23;
  id v24;
  id v25;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint8_t v37[128];
  uint8_t buf[4];
  id v39;
  __int16 v40;
  id v41;
  __int16 v42;
  int v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v7 = a5;
  v46 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v25 = a4;
  v24 = a6;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      v39 = v9;
      v40 = 2112;
      v41 = v25;
      v42 = 1024;
      v43 = v7;
      v44 = 2048;
      v45 = objc_msgSend(v24, "count");
      _os_log_impl(&dword_1A1FF4000, v10, OS_LOG_TYPE_INFO, "service: %@ chat: %@ style: %d messages: %lu", buf, 0x26u);
    }

  }
  v23 = v9;
  -[IMChatRegistry _existingChatWithIdentifier:style:service:](self, "_existingChatWithIdentifier:style:service:", v25, v7, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = (id)IMCreateItemsFromSerializedArray();
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v33 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        if (v11)
        {
          v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v11, 0);
        }
        else
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "guid");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMChatRegistry _cachedChatsWithMessageGUID:](self, "_cachedChatsWithMessageGUID:", v17);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v16, "firstObject");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v15, "_refreshContextWithAccountHandles");
        if (objc_msgSend(v16, "count"))
        {
          v30 = 0u;
          v31 = 0u;
          v28 = 0u;
          v29 = 0u;
          v18 = v16;
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
          if (v19)
          {
            v20 = *(_QWORD *)v29;
            do
            {
              for (j = 0; j != v19; ++j)
              {
                if (*(_QWORD *)v29 != v20)
                  objc_enumerationMutation(v18);
                objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * j), "_handleIncomingItem:", v15);
              }
              v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
            }
            while (v19);
          }

        }
        else if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v39 = v25;
            _os_log_impl(&dword_1A1FF4000, v22, OS_LOG_TYPE_INFO, "No chat found for chat ID: %@", buf, 0xCu);
          }

        }
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v12);
  }

}

- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 messageUpdated:(id)a7
{
  uint64_t v7;
  id v11;
  id v12;
  id v13;
  id v14;

  v7 = a5;
  v11 = a6;
  v12 = a4;
  v13 = a3;
  IMSingleObjectArray();
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[IMChatRegistry _account:chat:style:chatProperties:messagesUpdated:](self, "_account:chat:style:chatProperties:messagesUpdated:", v13, v12, v7, v11, v14);

}

- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 messageUpdated:(id)a7 suppressNotification:(BOOL)a8
{
  _BOOL8 v8;
  uint64_t v9;
  id v13;
  id v14;
  id v15;
  id v16;

  v8 = a8;
  v9 = a5;
  v13 = a6;
  v14 = a4;
  v15 = a3;
  IMSingleObjectArray();
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[IMChatRegistry _account:chat:style:chatProperties:messagesUpdated:suppressNotification:](self, "_account:chat:style:chatProperties:messagesUpdated:suppressNotification:", v15, v14, v9, v13, v16, v8);

}

- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 messagesUpdated:(id)a7
{
  uint64_t v7;
  id v11;
  id v12;
  id v13;
  id v14;

  v7 = a5;
  v11 = a6;
  v12 = a4;
  v13 = a3;
  v14 = (id)IMCreateItemsFromSerializedArray();
  -[IMChatRegistry _account:chat:style:chatProperties:messagesUpdated:](self, "_account:chat:style:chatProperties:messagesUpdated:", v13, v12, v7, v11, v14);

}

- (BOOL)_shouldSwitchAccountAddingMessagesToChat:(id)a3 messageItems:(id)a4 removedGUIDs:(id)a5 messagesComingFromStorage:(BOOL)a6 chatProperties:(id)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  NSObject *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  BOOL v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t k;
  char v44;
  void *v46;
  IMChatRegistry *v47;
  id v48;
  void *v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t buf[16];
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v8 = a6;
  v67 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v50 = a4;
  v13 = a5;
  v48 = a7;
  v49 = v13;
  if (v8)
  {
    v47 = self;
    objc_msgSend(v12, "_items");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_items");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "mutableCopy");

    v17 = objc_alloc(MEMORY[0x1E0C99E20]);
    objc_msgSend(v12, "_items");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "arrayByApplyingSelector:", sel_guid);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v17, "initWithArray:", v19);

    v21 = objc_alloc(MEMORY[0x1E0C99E20]);
    objc_msgSend(v50, "arrayByApplyingSelector:", sel_guid);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "initWithArray:", v22);

    v46 = (void *)v23;
    objc_msgSend(v20, "minusSet:", v23);
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v24 = v14;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
    if (v25)
    {
      v26 = *(_QWORD *)v61;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v61 != v26)
            objc_enumerationMutation(v24);
          v28 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
          objc_msgSend(v28, "guid");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v20, "containsObject:", v29);

          if ((v30 & 1) == 0)
            objc_msgSend(v16, "removeObject:", v28);
        }
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
      }
      while (v25);
    }

    objc_msgSend(v16, "arrayByAddingObjectsFromArray:", v50);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "sortedArrayUsingFunction:context:", sub_1A213AF80, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1FF4000, v33, OS_LOG_TYPE_INFO, "We received messages from storage so we are appending current items with items from storage", buf, 2u);
      }

    }
    objc_msgSend(v12, "beginHoldingChatItemsUpdatesForReason:", CFSTR("IMItemsChanged"));
    if (objc_msgSend(v49, "count"))
      objc_msgSend(v12, "_removeItemsForGuids:", v49);
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v34 = v32;
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
    if (v35)
    {
      v36 = *(_QWORD *)v56;
      do
      {
        for (j = 0; j != v35; ++j)
        {
          if (*(_QWORD *)v56 != v36)
            objc_enumerationMutation(v34);
          objc_msgSend(v12, "_handleIncomingItem:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * j));
        }
        v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
      }
      while (v35);
    }

    objc_msgSend(v12, "endHoldingChatItemsUpdatesForReason:", CFSTR("IMItemsChanged"));
    objc_msgSend(v12, "guid");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMChatRegistry _updateInfo:forGUID:updatingUnreadCount:](v47, "_updateInfo:forGUID:updatingUnreadCount:", v48, v38, 1);

    v39 = 1;
  }
  else
  {
    objc_msgSend(v12, "beginHoldingChatItemsUpdatesForReason:", CFSTR("IMItemsChanged"));
    if (objc_msgSend(v13, "count"))
      objc_msgSend(v12, "_removeItemsForGuids:", v13);
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v40 = v50;
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
    if (v41)
    {
      v42 = *(_QWORD *)v52;
      do
      {
        for (k = 0; k != v41; ++k)
        {
          if (*(_QWORD *)v52 != v42)
            objc_enumerationMutation(v40);
          v44 = objc_msgSend(v12, "_handleIncomingItem:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * k));
        }
        v39 = v44;
        v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
      }
      while (v41);
    }
    else
    {
      v39 = 1;
    }

    objc_msgSend(v12, "endHoldingChatItemsUpdatesForReason:", CFSTR("IMItemsChanged"));
  }

  return v39;
}

- (void)_processMessageForAccount:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 groupID:(id)a7 chatPersonCentricID:(id)a8 message:(id)a9
{
  uint64_t v12;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;

  v12 = a5;
  v16 = (void *)MEMORY[0x1E0C99D20];
  v17 = a9;
  v18 = a8;
  v19 = a7;
  v20 = a6;
  v21 = a4;
  v22 = a3;
  objc_msgSend(v16, "arrayWithObjects:count:", &a9, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v24) = 0;
  -[IMChatRegistry _processMessagesForAccount:chat:style:chatProperties:groupID:chatPersonCentricID:messages:removed:messagesComingFromStorage:](self, "_processMessagesForAccount:chat:style:chatProperties:groupID:chatPersonCentricID:messages:removed:messagesComingFromStorage:", v22, v21, v12, v20, v19, v18, v23, 0, v24);

}

- (void)_processMessagesForAccount:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 groupID:(id)a7 chatPersonCentricID:(id)a8 messages:(id)a9 removed:(id)a10 messagesComingFromStorage:(BOOL)a11
{
  uint64_t v14;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *IMMessageFromIMItem;
  void *v44;
  _BOOL4 v45;
  uint64_t v46;
  void *v47;
  char v48;
  void *v49;
  char v50;
  id v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t i;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  id v64;
  unsigned int v65;
  id v66;
  id v67;
  id v68;
  id v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  id v74;
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];
  uint8_t v81[128];
  uint8_t buf[4];
  id v83;
  __int16 v84;
  id v85;
  __int16 v86;
  int v87;
  __int16 v88;
  void *v89;
  __int16 v90;
  id v91;
  uint64_t v92;

  v14 = a5;
  v92 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v68 = a4;
  v69 = a6;
  v64 = a7;
  v66 = a8;
  v18 = a9;
  v67 = a10;
  v65 = v14;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v18, "arrayByApplyingSelector:", sel_guid);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v83 = v17;
      v84 = 2112;
      v85 = v68;
      v86 = 1024;
      v87 = v14;
      v88 = 2112;
      v89 = v20;
      v90 = 2112;
      v91 = v69;
      _os_log_impl(&dword_1A1FF4000, v19, OS_LOG_TYPE_INFO, "Process messages for account: %@  chat: %@   style: %d  messages: %@  properties: %@", buf, 0x30u);

    }
    v14 = v14;
  }
  -[IMChatRegistry _existingChatWithIdentifier:style:account:](self, "_existingChatWithIdentifier:style:account:", v68, v14, v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    if (v69)
    {
      if (objc_msgSend(v21, "isFiltered") <= 1)
      {
        objc_msgSend(v22, "guid");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "objectForKey:", CFSTR("guid"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v23, "isEqualToString:", v24);

        if ((v25 & 1) == 0)
        {
          objc_msgSend(v69, "objectForKey:", CFSTR("isFiltered"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "intValue");

          if (objc_msgSend(v22, "isFiltered") != v27)
            -[IMChatRegistry _updateChat:updateIsFiltered:](self, "_updateChat:updateIsFiltered:", v22);
        }
      }
    }
  }
  else
  {
    -[IMChatRegistry existingChatWithPersonID:](self, "existingChatWithPersonID:", v66);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "objectForKey:", CFSTR("guid"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMChatRegistry _registerChatDictionary:forChat:isIncoming:newGUID:](self, "_registerChatDictionary:forChat:isIncoming:newGUID:", v69, v22, 0, v28);
    -[IMChatRegistry _updateInfo:forGUID:updatingUnreadCount:](self, "_updateInfo:forGUID:updatingUnreadCount:", v69, v28, 1);
    objc_msgSend(v18, "lastObject");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22 && objc_msgSend(v22, "chatStyle") == 45 && (objc_msgSend(v29, "isFromMe") & 1) == 0)
    {
      +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "accountForUniqueID:", v17);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v31)
      {
        +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "service");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        +[IMServiceImpl serviceWithInternalName:](IMServiceImpl, "serviceWithInternalName:", v63);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "bestAccountForService:", v33);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v29, "handle");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "imHandleWithID:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (v35)
        objc_msgSend(v22, "setRecipient:", v35);

    }
  }
  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  v36 = v18;
  v37 = 0;
  v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v76, v81, 16);
  if (v38)
  {
    v39 = *(_QWORD *)v77;
    do
    {
      v40 = 0;
      v41 = v37;
      do
      {
        if (*(_QWORD *)v77 != v39)
          objc_enumerationMutation(v36);
        v42 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * v40);
        _IMBestAccountForIMItem(v42, 0, v17, 0, 0);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        IMMessageFromIMItem = (void *)_CreateIMMessageFromIMItem(v42, v37, 1);
        _IMCheckMessageForDDResults(IMMessageFromIMItem);

        ++v40;
        v41 = v37;
      }
      while (v38 != v40);
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v76, v81, 16);
    }
    while (v38);
  }

  if (v22)
  {
    if (!-[IMChatRegistry _shouldSwitchAccountAddingMessagesToChat:messageItems:removedGUIDs:messagesComingFromStorage:chatProperties:](self, "_shouldSwitchAccountAddingMessagesToChat:messageItems:removedGUIDs:messagesComingFromStorage:chatProperties:", v22, v36, v67, a11, v69))goto LABEL_61;
    goto LABEL_60;
  }
  if (v65 == 35)
  {
    -[IMChatRegistry existingChatForRoom:onAccount:](self, "existingChatForRoom:onAccount:", v68, v37);
    v46 = objc_claimAutoreleasedReturnValue();
LABEL_38:
    v22 = (id)v46;
    if (v46)
    {
      -[IMChatRegistry _shouldSwitchAccountAddingMessagesToChat:messageItems:removedGUIDs:messagesComingFromStorage:chatProperties:](self, "_shouldSwitchAccountAddingMessagesToChat:messageItems:removedGUIDs:messagesComingFromStorage:chatProperties:", v46, v36, v67, a11, v69);
      goto LABEL_60;
    }
    objc_msgSend(v36, "lastObject");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "isEmpty");

    if ((v48 & 1) == 0)
    {
      if (objc_msgSend(v69, "count"))
      {
        buf[0] = 0;
        v74 = 0;
        sub_1A2000CE4(self, v69, 0, 1, buf, &v74);
        v22 = (id)objc_claimAutoreleasedReturnValue();
        v51 = v74;
        v70 = 0u;
        v71 = 0u;
        v72 = 0u;
        v73 = 0u;
        v52 = v36;
        v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
        if (v53)
        {
          v54 = *(_QWORD *)v71;
          do
          {
            for (i = 0; i != v53; ++i)
            {
              if (*(_QWORD *)v71 != v54)
                objc_enumerationMutation(v52);
              objc_msgSend(v22, "_handleIncomingItem:", *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * i));
            }
            v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
          }
          while (v53);
        }

        if (buf[0])
          objc_msgSend(v22, "_setupObservation");
      }
      else
      {
        BYTE2(v62) = 0;
        LOWORD(v62) = 0;
        v22 = -[IMChat _initWithGUID:account:style:roomName:displayName:lastAddressedHandle:lastAddressedSIMID:items:participants:isFiltered:hasHadSuccessfulQuery:isRecovered:isDeletingIncomingMessages:]([IMChat alloc], "_initWithGUID:account:style:roomName:displayName:lastAddressedHandle:lastAddressedSIMID:items:participants:isFiltered:hasHadSuccessfulQuery:isRecovered:isDeletingIncomingMessages:", 0, v37, v65, v68, 0, 0, 0, v36, 0, 1, v62);
        objc_msgSend(v22, "_setupObservation");
        v51 = 0;
      }
      objc_msgSend(v36, "lastObject");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMChatRegistry _registerChat:isIncoming:guid:](self, "_registerChat:isIncoming:guid:", v22, objc_msgSend(v58, "isFromMe") ^ 1, v51);

      -[IMChatRegistry _updateUnreadCountForChat:](self, "_updateUnreadCountForChat:", v22);
      goto LABEL_60;
    }
LABEL_41:
    v22 = 0;
    goto LABEL_60;
  }
  if (v65 == 43)
  {
    -[IMChatRegistry existingChatWithChatIdentifier:](self, "existingChatWithChatIdentifier:", v68);
    v46 = objc_claimAutoreleasedReturnValue();
    goto LABEL_38;
  }
  if (v65 != 45)
    goto LABEL_41;
  objc_msgSend(v37, "imHandleWithID:", v68);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMChatRegistry existingChatWithHandle:](self, "existingChatWithHandle:", v44);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    objc_msgSend(v36, "lastObject");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "isTypingMessage");

    if ((v50 & 1) != 0)
    {
      v22 = 0;
    }
    else
    {
      buf[0] = 0;
      v75 = 0;
      sub_1A2000CE4(self, v69, v36, 1, buf, &v75);
      v22 = (id)objc_claimAutoreleasedReturnValue();
      v56 = v75;
      if (buf[0])
        objc_msgSend(v22, "_setupObservation");
      objc_msgSend(v36, "lastObject");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMChatRegistry _registerChat:isIncoming:guid:](self, "_registerChat:isIncoming:guid:", v22, objc_msgSend(v57, "isFromMe") ^ 1, v56);

      -[IMChatRegistry _updateUnreadCountForChat:](self, "_updateUnreadCountForChat:", v22);
      objc_msgSend(v22, "join");
    }

    goto LABEL_60;
  }
  v45 = -[IMChatRegistry _shouldSwitchAccountAddingMessagesToChat:messageItems:removedGUIDs:messagesComingFromStorage:chatProperties:](self, "_shouldSwitchAccountAddingMessagesToChat:messageItems:removedGUIDs:messagesComingFromStorage:chatProperties:", v22, v36, v67, a11, v69);

  if (v45)
  {
LABEL_60:
    objc_msgSend(v36, "lastObject");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "_senderHandle");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "account");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_setAccount:", v61);

  }
LABEL_61:
  if (objc_msgSend(v22, "serviceSwitchRequested"))
  {
    objc_msgSend(v22, "refreshServiceForSending");
    objc_msgSend(v22, "setServiceSwitchRequested:", 0);
  }

}

- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 groupID:(id)a7 chatPersonCentricID:(id)a8 messageSent:(id)a9
{
  uint64_t v12;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  int v22;
  id v23;

  v12 = a5;
  v23 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  kdebug_trace();
  if (objc_msgSend(v19, "isFinished"))
  {
    objc_msgSend(v19, "fileTransferGUIDs");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v20, "count"))
    {
LABEL_5:

      goto LABEL_6;
    }
    objc_msgSend(v19, "service");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isEqualToString:", *MEMORY[0x1E0D38F68]);

    if (v22)
    {
      objc_msgSend(v19, "guid");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      _signpostSendFileMessage();
      goto LABEL_5;
    }
  }
LABEL_6:
  -[IMChatRegistry _processMessageForAccount:chat:style:chatProperties:groupID:chatPersonCentricID:message:](self, "_processMessageForAccount:chat:style:chatProperties:groupID:chatPersonCentricID:message:", v23, v15, v12, v16, v17, v18, v19);

}

- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 notifySentMessage:(id)a7 sendTime:(id)a8 isReplicating:(BOOL)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *IMMessageFromIMItem;
  __CFDictionary *v21;
  __CFDictionary *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if (-[IMChatRegistry _postMessageSentNotifications](self, "_postMessageSentNotifications"))
  {
    _IMBestAccountForIMItem(v17, 0, v14, 0, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    IMMessageFromIMItem = (void *)_CreateIMMessageFromIMItem(v17, v19, 1);
    v21 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v22 = v21;
    if (v18)
      CFDictionarySetValue(v21, CFSTR("__kIMChatRegistryMessageSendTimeKey"), v18);
    if (IMMessageFromIMItem)
      CFDictionarySetValue(v22, CFSTR("__kIMChatRegistryMessageSentMessageKey"), IMMessageFromIMItem);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a9);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
      CFDictionarySetValue(v22, CFSTR("__kIMChatRegistryMessageSendIsReplicatingKey"), v23);

    objc_msgSend(v19, "serviceName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v15;
    if (objc_msgSend(v24, "isEqualToString:", *MEMORY[0x1E0D38F70]))
    {
      objc_msgSend(v17, "fallbackHash");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "length");

      if (!v26)
      {
LABEL_12:
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "__mainThreadPostNotificationName:object:userInfo:", CFSTR("__kIMChatRegistryMessageSentNotification"), 0, v22);

        v15 = v28;
        goto LABEL_13;
      }
      objc_msgSend(v17, "fallbackHash");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFDictionary setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v24, CFSTR("__kIMChatRegistryMessageOriginalGUIDKey"));
    }

    goto LABEL_12;
  }
LABEL_13:

}

- (void)_clearExistingTypingIndicatorsWithMessageGUID:(id)a3 excludingChatWithIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[IMChatRegistry _cachedChatsWithMessageGUID:](self, "_cachedChatsWithMessageGUID:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218498;
      v30 = objc_msgSend(v8, "count");
      v31 = 2112;
      v32 = v6;
      v33 = 2112;
      v34 = v7;
      _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_INFO, "Found %llu chats with message matching GUID: %@ (will exclude chat %@)", buf, 0x20u);
    }

  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v11)
  {
    v13 = *(_QWORD *)v25;
    *(_QWORD *)&v12 = 138412802;
    v23 = v12;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v15, "chatIdentifier", v23, (_QWORD)v24);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqualToString:", v7);

        if ((v17 & 1) == 0)
        {
          objc_msgSend(v15, "_itemForGUID:", v6);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v18, "isTypingMessage"))
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v19 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v15, "guid");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v23;
                v30 = (uint64_t)v6;
                v31 = 2112;
                v32 = v20;
                v33 = 2112;
                v34 = v18;
                _os_log_impl(&dword_1A1FF4000, v19, OS_LOG_TYPE_INFO, "Removing typing indicator %@ from chat %@, existing item: %@", buf, 0x20u);

              }
            }
            objc_msgSend(v15, "_removeItem:", v18);
          }
          else if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v15, "guid");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v23;
              v30 = (uint64_t)v6;
              v31 = 2112;
              v32 = v22;
              v33 = 2112;
              v34 = v18;
              _os_log_impl(&dword_1A1FF4000, v21, OS_LOG_TYPE_INFO, "Message %@ in chat %@ is not a typing indicator: %@", buf, 0x20u);

            }
          }

        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v11);
  }

}

- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 groupID:(id)a7 chatPersonCentricID:(id)a8 messageReceived:(id)a9
{
  uint64_t v12;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;

  v12 = a5;
  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  v20 = a4;
  v22 = a3;
  objc_msgSend(v16, "guid");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMChatRegistry _clearExistingTypingIndicatorsWithMessageGUID:excludingChatWithIdentifier:](self, "_clearExistingTypingIndicatorsWithMessageGUID:excludingChatWithIdentifier:", v21, v20);

  -[IMChatRegistry _processMessageForAccount:chat:style:chatProperties:groupID:chatPersonCentricID:message:](self, "_processMessageForAccount:chat:style:chatProperties:groupID:chatPersonCentricID:message:", v22, v20, v12, v19, v18, v17, v16);
}

- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 groupID:(id)a7 chatPersonCentricID:(id)a8 initialEmergencyQuestionnaireReceived:(id)a9
{
  uint64_t v12;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v12 = a5;
  v28 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  -[IMChatRegistry account:chat:style:chatProperties:groupID:chatPersonCentricID:messageReceived:](self, "account:chat:style:chatProperties:groupID:chatPersonCentricID:messageReceived:", v15, v16, v12, v17, v18, v19, v20);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v16;
      _os_log_impl(&dword_1A1FF4000, v21, OS_LOG_TYPE_INFO, "initialEmergencyQuestionnaireReceived - Opening Messages to: %@", buf, 0xCu);
    }

  }
  if (qword_1EE65F710 != -1)
    dispatch_once(&qword_1EE65F710, &unk_1E471DB78);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sms://open?groupid=%@"), v16);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v22;
      _os_log_impl(&dword_1A1FF4000, v23, OS_LOG_TYPE_INFO, "Launching to messages app. URL String is %@", buf, 0xCu);
    }

  }
  objc_msgSend((id)qword_1EE65F708, "defaultWorkspace");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v22);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "openURL:configuration:completionHandler:", v25, 0, 0);

}

- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 groupID:(id)a7 chatPersonCentricID:(id)a8 messagesReceived:(id)a9 removed:(id)a10 messagesComingFromStorage:(BOOL)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  id v27;
  unsigned int v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v28 = a5;
  HIDWORD(v26) = a11;
  v35 = *MEMORY[0x1E0C80C00];
  v29 = a3;
  v16 = a4;
  v27 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v20 = a10;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v31;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v31 != v23)
          objc_enumerationMutation(v19);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v24), "guid");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMChatRegistry _clearExistingTypingIndicatorsWithMessageGUID:excludingChatWithIdentifier:](self, "_clearExistingTypingIndicatorsWithMessageGUID:excludingChatWithIdentifier:", v25, v16);

        ++v24;
      }
      while (v22 != v24);
      v22 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v22);
  }
  LOBYTE(v26) = BYTE4(v26);
  -[IMChatRegistry _processMessagesForAccount:chat:style:chatProperties:groupID:chatPersonCentricID:messages:removed:messagesComingFromStorage:](self, "_processMessagesForAccount:chat:style:chatProperties:groupID:chatPersonCentricID:messages:removed:messagesComingFromStorage:", v29, v16, v28, v27, v17, v18, v19, v20, v26);

}

- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 invitationReceived:(id)a7
{
  uint64_t v9;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  int v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v9 = a5;
  v33 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413058;
      v26 = v12;
      v27 = 2112;
      v28 = v13;
      v29 = 1024;
      v30 = v9;
      v31 = 2112;
      v32 = v15;
      _os_log_impl(&dword_1A1FF4000, v16, OS_LOG_TYPE_DEBUG, "account: %@  chat: %@  style: %d  invitation: %@", buf, 0x26u);
    }

  }
  if ((v9 & 0xFFFFFFF7) == 0x23)
  {
    +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "accountForUniqueID:", v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[IMChatRegistry _existingChatWithIdentifier:style:account:](self, "_existingChatWithIdentifier:style:account:", v13, v9, v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
    {
      objc_msgSend(v19, "groupID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMChatRegistry account:chat:style:chatProperties:groupID:chatPersonCentricID:messageReceived:](self, "account:chat:style:chatProperties:groupID:chatPersonCentricID:messageReceived:", v12, v13, v9, v14, v21, 0, v15);
    }
    else
    {
      objc_msgSend(v15, "_setInvitation:", 1);
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v15, 0);
      if (objc_msgSend(v14, "count"))
      {
        buf[0] = 0;
        v24 = 0;
        sub_1A2000CE4(self, v14, 0, 1, buf, &v24);
        v20 = (id)objc_claimAutoreleasedReturnValue();
        v22 = v24;
        objc_msgSend(v20, "_handleIncomingItem:", v15);
        if (buf[0])
          objc_msgSend(v20, "_setupObservation");
      }
      else
      {
        BYTE2(v23) = 0;
        LOWORD(v23) = 0;
        v20 = -[IMChat _initWithGUID:account:style:roomName:displayName:lastAddressedHandle:lastAddressedSIMID:items:participants:isFiltered:hasHadSuccessfulQuery:isRecovered:isDeletingIncomingMessages:]([IMChat alloc], "_initWithGUID:account:style:roomName:displayName:lastAddressedHandle:lastAddressedSIMID:items:participants:isFiltered:hasHadSuccessfulQuery:isRecovered:isDeletingIncomingMessages:", 0, v18, v9, v13, 0, 0, 0, v21, 0, 1, v23);
        objc_msgSend(v20, "_setupObservation");
        v22 = 0;
      }
      -[IMChatRegistry _registerChat:isIncoming:guid:](self, "_registerChat:isIncoming:guid:", v20, objc_msgSend(v15, "isFromMe") ^ 1, v22);
      -[IMChatRegistry _updateUnreadCountForChat:](self, "_updateUnreadCountForChat:", v20);

    }
  }
  else
  {
    -[IMChatRegistry account:chat:style:chatProperties:groupID:chatPersonCentricID:messageReceived:](self, "account:chat:style:chatProperties:groupID:chatPersonCentricID:messageReceived:", v12, v13, v9, v14, 0, 0, v15);
  }

}

- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 updateProperties:(id)a7
{
  uint64_t v9;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  int v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v9 = a5;
  v39 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  v12 = a4;
  v23 = a6;
  v13 = a7;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413058;
      v32 = v25;
      v33 = 2112;
      v34 = v12;
      v35 = 1024;
      v36 = v9;
      v37 = 2112;
      v38 = v13;
      _os_log_impl(&dword_1A1FF4000, v14, OS_LOG_TYPE_DEBUG, "account: %@  chat: %@  style: %d  properties: %@", buf, 0x26u);
    }

  }
  -[IMChatRegistry _existingChatWithIdentifier:style:account:](self, "_existingChatWithIdentifier:style:account:", v12, v9, v25, v23);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(v13, "allKeys");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v27 != v18)
            objc_enumerationMutation(v16);
          v20 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v13, "objectForKey:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v22 = 0;
          else
            v22 = v21;
          objc_msgSend(v15, "setValue:forChatProperty:", v22, v20);

        }
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v17);
    }

  }
}

- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 error:(id)a7
{
  uint64_t v9;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  int v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v9 = a5;
  v27 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v19 = 138413058;
      v20 = v12;
      v21 = 2112;
      v22 = v13;
      v23 = 1024;
      v24 = v9;
      v25 = 2112;
      v26 = v15;
      _os_log_impl(&dword_1A1FF4000, v16, OS_LOG_TYPE_DEBUG, "account: %@  chat: %@  style: %d  error: %@", (uint8_t *)&v19, 0x26u);
    }

  }
  -[IMChatRegistry _existingChatWithIdentifier:style:account:](self, "_existingChatWithIdentifier:style:account:", v13, v9, v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedDescription");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_showErrorMessage:", v18);

}

- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 groupID:(id)a7 chatPersonCentricID:(id)a8 statusChanged:(int)a9 handleInfo:(id)a10
{
  uint64_t v13;
  id v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  id v24;
  id v25;
  __CFDictionary *v26;
  NSObject *v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  BOOL v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  id key;
  id obj;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  id v59;
  uint8_t v60[128];
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  id v66;
  uint64_t v67;

  v13 = a5;
  v67 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v47 = a6;
  v44 = a7;
  key = a8;
  v48 = a10;
  v45 = v17;
  v43 = v16;
  -[IMChatRegistry _existingChatWithIdentifier:style:account:](self, "_existingChatWithIdentifier:style:account:", v17, v13, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v18, "guid");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v62 = v18;
      v63 = 2112;
      v64 = v20;
      v65 = 2112;
      v66 = key;
      _os_log_impl(&dword_1A1FF4000, v19, OS_LOG_TYPE_INFO, "chat (%p) properties updated for guid %@: personCentricID %@", buf, 0x20u);

    }
  }
  if (v18)
    goto LABEL_8;
  -[IMChatRegistry existingChatWithPersonID:](self, "existingChatWithPersonID:", key);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_msgSend(v47, "objectForKey:", CFSTR("guid"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMChatRegistry _registerChatDictionary:forChat:isIncoming:newGUID:](self, "_registerChatDictionary:forChat:isIncoming:newGUID:", v47, v18, 0, v21);
    -[IMChatRegistry _updateInfo:forGUID:updatingUnreadCount:](self, "_updateInfo:forGUID:updatingUnreadCount:", v47, v21, 1);

LABEL_8:
    v54 = v18;
    objc_msgSend(v18, "guid");
    v46 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
    v22 = v54;
    switch(a9)
    {
      case -1:
      case 0:
      case 3:
      case 4:
      case 5:
        objc_msgSend(v54, "_setJoinState:", 0);
        if ((a9 + 1) <= 6)
        {
          v22 = v54;
          if (((1 << (a9 + 1)) & 0x73) == 0)
            goto LABEL_32;
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1A1FF4000, v23, OS_LOG_TYPE_INFO, "We're not in the room, leaving as is", buf, 2u);
            }

          }
        }
        break;
      case 1:
      case 6:
        goto LABEL_32;
      case 2:
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v62 = v45;
            _os_log_impl(&dword_1A1FF4000, v27, OS_LOG_TYPE_INFO, "Joined chat: %@", buf, 0xCu);
          }

        }
        v28 = 3;
        goto LABEL_31;
      case 7:
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v62 = v45;
            _os_log_impl(&dword_1A1FF4000, v29, OS_LOG_TYPE_INFO, "Read Only chat: %@", buf, 0xCu);
          }

        }
        v28 = 4;
LABEL_31:
        objc_msgSend(v54, "_setJoinState:", v28);
        v22 = v54;
LABEL_32:
        -[IMChatRegistry _registerChat:isIncoming:guid:](self, "_registerChat:isIncoming:guid:", v22, 0, v46);
        break;
      default:
        break;
    }
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    obj = v48;
    v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
    if (v30)
    {
      v53 = *(_QWORD *)v56;
      v52 = *MEMORY[0x1E0D36D90];
      v51 = *MEMORY[0x1E0D36E10];
      v31 = *MEMORY[0x1E0D36D68];
      v32 = *MEMORY[0x1E0D36C20];
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v56 != v53)
            objc_enumerationMutation(obj);
          v34 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
          objc_msgSend(v34, "objectForKey:", v52);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "objectForKey:", v51);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "objectForKey:", v31);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "objectForKey:", v32);
          v38 = objc_claimAutoreleasedReturnValue();
          v39 = (void *)v38;
          if (v35)
            v40 = v38 == 0;
          else
            v40 = 1;
          if (!v40)
          {
            objc_msgSend(v54, "account");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "imHandleWithID:alreadyCanonical:", v35, 1);
            v42 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v42, "_setOriginalID:countryCode:updateSiblings:", v36, v37, 1);
            objc_msgSend(v42, "setPersonCentricID:", key);
            objc_msgSend(v54, "_setParticipantState:forHandle:postNotification:", sub_1A20B8D80(objc_msgSend(v39, "intValue")), v42, 0);

          }
        }
        v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
      }
      while (v30);
    }

    goto LABEL_46;
  }
  buf[0] = 0;
  v59 = 0;
  sub_1A2000CE4(self, v47, 0, (a9 < 8) & (0xC6u >> a9), buf, &v59);
  v54 = (id)objc_claimAutoreleasedReturnValue();
  v46 = v59;
  v24 = v54;
  if (buf[0])
  {
    objc_msgSend(v54, "_setupObservation");
    objc_msgSend(v54, "setPersonCentricID:", key);
    v24 = v54;
    if (v54)
    {
      v25 = v54;
      -[IMChatRegistry chatPersonIDToChatMap](self, "chatPersonIDToChatMap");
      v26 = (__CFDictionary *)objc_claimAutoreleasedReturnValue();
      CFDictionarySetValue(v26, key, v25);

      v24 = v54;
    }
  }
  if (v24)
    goto LABEL_9;
LABEL_46:

}

- (void)leftChat:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v8 = 138412290;
      v9 = v4;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Leaving chat with GUID: %@", (uint8_t *)&v8, 0xCu);
    }

  }
  -[IMChatRegistry existingChatWithGUID:](self, "existingChatWithGUID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "Found chat: %@", (uint8_t *)&v8, 0xCu);
    }

  }
  if (v6)
  {
    objc_msgSend(v6, "_setJoinState:", 0);
    -[IMChatRegistry _unregisterChat:](self, "_unregisterChat:", v6);
  }

}

- (void)_updatePersonCentricIDToChatMapForChat:(id)a3 toNewPersonCentricID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  __CFDictionary *v11;
  NSObject *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "personCentricID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[IMChatRegistry chatPersonIDToChatMap](self, "chatPersonIDToChatMap");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectForKey:", v8);

  }
  objc_msgSend(v6, "setPersonCentricID:", v7);
  if (v6)
  {
    v10 = v6;
    -[IMChatRegistry chatPersonIDToChatMap](self, "chatPersonIDToChatMap");
    v11 = (__CFDictionary *)objc_claimAutoreleasedReturnValue();
    CFDictionarySetValue(v11, v7, v10);

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = 138412802;
      v14 = v8;
      v15 = 2112;
      v16 = v7;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_1A1FF4000, v12, OS_LOG_TYPE_INFO, "Updated personCentricID from %@ to %@ for chat %@", (uint8_t *)&v13, 0x20u);
    }

  }
}

- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 chatPersonCentricID:(id)a7 member:(id)a8 statusChanged:(int)a9
{
  uint64_t v12;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  int v29;
  __int16 v30;
  id v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v12 = a5;
  v34 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v24 = 138413314;
      v25 = v15;
      v26 = 2112;
      v27 = v16;
      v28 = 1024;
      v29 = v12;
      v30 = 2112;
      v31 = v19;
      v32 = 1024;
      v33 = a9;
      _os_log_impl(&dword_1A1FF4000, v20, OS_LOG_TYPE_DEBUG, "Chat status changed: account: %@  chat: %@  style: %d  member: %@  status: %d", (uint8_t *)&v24, 0x2Cu);
    }

  }
  -[IMChatRegistry _existingChatWithIdentifier:style:account:](self, "_existingChatWithIdentifier:style:account:", v16, v12, v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "canHaveMultipleParticipants"))
  {
    objc_msgSend(v21, "account");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "imHandleWithInfo:", v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "_participant:statusChanged:", v23, a9);
    -[IMChatRegistry _updatePersonCentricIDToChatMapForChat:toNewPersonCentricID:](self, "_updatePersonCentricIDToChatMapForChat:toNewPersonCentricID:", v21, v18);

  }
}

- (void)chat:(id)a3 propertiesUpdated:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v10 = 138412546;
      v11 = v6;
      v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "chat: %@  propertiesUpdated: %@", (uint8_t *)&v10, 0x16u);
    }

  }
  -[IMChatRegistry _cachedChatWithGUID:](self, "_cachedChatWithGUID:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setChatProperties:", v7);

}

- (void)chat:(id)a3 chatPersonCentricID:(id)a4 displayNameUpdated:(id)a5
{
  MEMORY[0x1E0DE7D20](self, sel_chat_chatPersonCentricID_displayNameUpdated_sender_);
}

- (void)chat:(id)a3 chatPersonCentricID:(id)a4 displayNameUpdated:(id)a5 sender:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v16 = 138412546;
      v17 = v10;
      v18 = 2112;
      v19 = v12;
      _os_log_impl(&dword_1A1FF4000, v14, OS_LOG_TYPE_INFO, "chat: %@  displayName: %@", (uint8_t *)&v16, 0x16u);
    }

  }
  -[IMChatRegistry existingChatWithGUID:](self, "existingChatWithGUID:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_updateDisplayName:sender:", v12, v13);
  if (objc_msgSend(v15, "canHaveMultipleParticipants"))
    -[IMChatRegistry _updatePersonCentricIDToChatMapForChat:toNewPersonCentricID:](self, "_updatePersonCentricIDToChatMapForChat:toNewPersonCentricID:", v15, v11);

}

- (void)chat:(id)a3 lastAddressedHandleUpdated:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v12 = 138412546;
      v13 = v6;
      v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "chat: %@ lastAddressedHandleUpdated: %@", (uint8_t *)&v12, 0x16u);
    }

  }
  -[IMChatRegistry _cachedChatWithGUID:](self, "_cachedChatWithGUID:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "_updateLastAddressedHandleID:", v7);
    objc_msgSend(v10, "refreshServiceForSending");
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = 138412290;
      v13 = v6;
      _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "No cached chat for %@, ignoring last addressed handle update", (uint8_t *)&v12, 0xCu);
    }

  }
}

- (void)chat:(id)a3 lastAddressedSIMIDUpdated:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v12 = 138412546;
      v13 = v6;
      v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "chat: %@ lastAddressedSIMIDUpdated: %@", (uint8_t *)&v12, 0x16u);
    }

  }
  -[IMChatRegistry _cachedChatWithGUID:](self, "_cachedChatWithGUID:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "_updateLastAddressedSIMID:", v7);
    objc_msgSend(v10, "refreshServiceForSending");
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = 138412290;
      v13 = v6;
      _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "No cached chat for %@, ignoring last addressed SIM ID update", (uint8_t *)&v12, 0xCu);
    }

  }
}

- (void)chat:(id)a3 lastAddressedHandleUpdated:(id)a4 lastAddressedSIMIDUpdated:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v15 = 138412802;
      v16 = v8;
      v17 = 2112;
      v18 = v9;
      v19 = 2112;
      v20 = v10;
      _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "chat: %@ lastAddressedHandleUpdated: %@ lastAddressedSIMIDUpdated: %@", (uint8_t *)&v15, 0x20u);
    }

  }
  -[IMChatRegistry _cachedChatWithGUID:](self, "_cachedChatWithGUID:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "_updateLastAddressedHandleID:", v9);
    objc_msgSend(v13, "_updateLastAddressedSIMID:", v10);
    objc_msgSend(v13, "refreshServiceForSending");
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = 138412290;
      v16 = v8;
      _os_log_impl(&dword_1A1FF4000, v14, OS_LOG_TYPE_INFO, "No cached chat for %@, ignoring last addressed handle and last addressed SIM ID update", (uint8_t *)&v15, 0xCu);
    }

  }
}

- (void)chat:(id)a3 isFilteredUpdated:(int64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  id v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v11 = 138412546;
      v12 = v6;
      v13 = 1024;
      v14 = a4;
      _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "chat: %@ isFilteredUpdated: %d", (uint8_t *)&v11, 0x12u);
    }

  }
  -[IMChatRegistry _cachedChatWithGUID:](self, "_cachedChatWithGUID:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "setIsFiltered:", a4);
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = 138412290;
      v12 = v6;
      _os_log_impl(&dword_1A1FF4000, v10, OS_LOG_TYPE_INFO, "No cached chat for %@, ignoring is filtered update", (uint8_t *)&v11, 0xCu);
    }

  }
}

- (void)chat:(id)a3 isRecoveredUpdated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = CFSTR("NO");
      if (v4)
        v8 = CFSTR("YES");
      v12 = 138412546;
      v13 = v6;
      v14 = 2112;
      v15 = v8;
      _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "chat: %@ isRecoveredUpdated: %@", (uint8_t *)&v12, 0x16u);
    }

  }
  -[IMChatRegistry _cachedChatWithGUID:](self, "_cachedChatWithGUID:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "setRecovered:", v4);
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = 138412290;
      v13 = v6;
      _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "No cached chat for %@, ignoring is recover update", (uint8_t *)&v12, 0xCu);
    }

  }
}

- (void)chat:(id)a3 isDeletingIncomingMessagesUpdated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = CFSTR("NO");
      if (v4)
        v8 = CFSTR("YES");
      v12 = 138412546;
      v13 = v6;
      v14 = 2112;
      v15 = v8;
      _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "chat: %@ isDeletingIncomingMessagesUpdated: %@", (uint8_t *)&v12, 0x16u);
    }

  }
  -[IMChatRegistry _cachedChatWithGUID:](self, "_cachedChatWithGUID:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "setDeletingIncomingMessages:", v4);
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = 138412290;
      v13 = v6;
      _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "No cached chat for %@, ignoring is is deleting incoming messages update", (uint8_t *)&v12, 0xCu);
    }

  }
}

- (void)chat:(id)a3 engramIDUpdated:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v12 = 138412546;
      v13 = v6;
      v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "chat: %@ engramIDUpdated: %@", (uint8_t *)&v12, 0x16u);
    }

  }
  -[IMChatRegistry _cachedChatWithGUID:](self, "_cachedChatWithGUID:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "_updateEngramID:", v7);
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = 138412290;
      v13 = v6;
      _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "No cached chat for %@, ignoring engram ID update", (uint8_t *)&v12, 0xCu);
    }

  }
}

- (void)engroupParticipantsUpdatedForChat:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = v4;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "chat: %@ finished updating group chat", (uint8_t *)&v9, 0xCu);
    }

  }
  -[IMChatRegistry _cachedChatWithGUID:](self, "_cachedChatWithGUID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "_engroupParticipantsUpdated");
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = v4;
      _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "No cached chat for %@, ignoring engroup update", (uint8_t *)&v9, 0xCu);
    }

  }
}

- (void)updatedSummariesForChatsWithGUIDsAndProperties:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  const __CFString *v18;
  void *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D39858], "messageSummarizationEnabled"))
  {
    objc_msgSend(v4, "allKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v4, "objectForKey:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMChatRegistry chat:propertiesUpdated:](self, "chat:propertiesUpdated:", v10, v11);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
      }
      while (v7);
    }
    v18 = CFSTR("__kIMChatRegistrySummaryDictionaryKey");
    v19 = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "__mainThreadPostNotificationName:object:userInfo:", CFSTR("__kIMChatRegistryDidUpdateMessagesWithSummaryNotification"), 0, v12);

  }
}

- (void)chat:(id)a3 uncachedAttachmentCountUpdated:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v12 = 138412546;
      v13 = v6;
      v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "chat: %@ uncachedAttachmentCountUpdated: %@", (uint8_t *)&v12, 0x16u);
    }

  }
  -[IMChatRegistry _cachedChatWithGUID:](self, "_cachedChatWithGUID:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "_setCountOfAttachmentsNotCachedLocally:", v7);
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = 138412290;
      v13 = v6;
      _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "No cached chat for %@, ignoring attachment count update", (uint8_t *)&v12, 0xCu);
    }

  }
}

- (void)_updateChat:(id)a3 updateIsFiltered:(int64_t)a4
{
  id v5;

  v5 = a3;
  objc_msgSend(v5, "updateIsFiltered:", a4);
  objc_msgSend(v5, "verifyFiltering");

}

- (void)_updateIsDownloadingPendingSatelliteMessages:(id)a3 shouldPostNotification:(BOOL)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  uint64_t v19;
  unsigned int v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v4 = a4;
  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isCarrierPigeonEnabled");

  if (v6 && v8)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v6, "_guids");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v10)
    {
      v11 = v10;
      v20 = v4;
      v12 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
          -[IMChatRegistry chatGUIDToInfoMap](self, "chatGUIDToInfoMap");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKey:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v16, "objectForKey:", CFSTR("downloadingPendingSatelliteMessages"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "BOOLValue");

          if ((v18 & 1) != 0)
          {
            v19 = 1;
            goto LABEL_13;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v11)
          continue;
        break;
      }
      v19 = 0;
LABEL_13:
      v4 = v20;
    }
    else
    {
      v19 = 0;
    }

    objc_msgSend(v6, "_setIsDownloadingPendingSatelliteMessages:postNotification:", v19, v4);
  }

}

- (void)_updateHasCancellableScheduledMessage:(id)a3 shouldPostNotification:(BOOL)a4
{
  id v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  const __CFString *v17;
  NSObject *v18;
  void *v19;
  id v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  const __CFString *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v20 = v5;
    objc_msgSend(v5, "_guids");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v6 = 0;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v23;
      v9 = *MEMORY[0x1E0D37790];
LABEL_4:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v10);
        -[IMChatRegistry chatGUIDToInfoMap](self, "chatGUIDToInfoMap");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "objectForKeyedSubscript:", v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "BOOLValue");

        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v17 = CFSTR("NO");
            if (v15)
              v17 = CFSTR("YES");
            v27 = v11;
            v28 = 2112;
            v29 = v17;
            _os_log_impl(&dword_1A1FF4000, v16, OS_LOG_TYPE_INFO, "Chat [%@] info dictionary has [hasCancellableScheduledMessage: %@]", buf, 0x16u);
          }

        }
        v6 |= v15;
        if ((v15 & 1) != 0)
          break;
        if (v7 == ++v10)
        {
          v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          if (v7)
            goto LABEL_4;
          break;
        }
      }
    }

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v20, "guid");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v27 = v19;
        v28 = 1024;
        LODWORD(v29) = v6 & 1;
        _os_log_impl(&dword_1A1FF4000, v18, OS_LOG_TYPE_INFO, "Chat [%@] hasCancellableScheduledMessage to %d", buf, 0x12u);

      }
    }
    objc_msgSend(v20, "setHasCancellableScheduledMessage:", v6 & 1);
    v5 = v20;
  }

}

- (void)_updatePendingIncomingSatelliteMessageCount:(id)a3 shouldPostNotification:(BOOL)a4
{
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  _BOOL4 v22;
  id v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  int v32;
  _BYTE v33[128];
  uint64_t v34;

  v22 = a4;
  v34 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isCarrierPigeonEnabled");

  if (v23 && v6)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(v23, "_guids");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v26;
      v10 = *MEMORY[0x1E0D37828];
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v26 != v9)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          -[IMChatRegistry chatGUIDToInfoMap](self, "chatGUIDToInfoMap");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKey:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "objectForKey:", v10);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "unsignedIntegerValue");

          v17 = IMOSLoggingEnabled();
          if (v16)
          {
            if (v17)
            {
              OSLogHandleForIMFoundationCategory();
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                v30 = v12;
                v31 = 1024;
                v32 = v16;
                _os_log_impl(&dword_1A1FF4000, v18, OS_LOG_TYPE_INFO, "Chat [%@] info dictionary has [pendingSatelliteCount: %d]", buf, 0x12u);
              }

            }
            v7 += v16;
          }
          else if (v17)
          {
            OSLogHandleForIMFoundationCategory();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v30 = v12;
              v31 = 1024;
              v32 = v7;
              _os_log_impl(&dword_1A1FF4000, v19, OS_LOG_TYPE_INFO, "Chat [%@] info dictionary has [pendingSatelliteCount: %d]", buf, 0x12u);
            }

          }
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      }
      while (v8);
    }

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v23, "guid");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v30 = v21;
        v31 = 1024;
        v32 = v7;
        _os_log_impl(&dword_1A1FF4000, v20, OS_LOG_TYPE_INFO, "Chat [%@] _updatePendingSatelliteCount to %d", buf, 0x12u);

      }
    }
    objc_msgSend(v23, "_setPendingIncomingSatelliteMessageCount:postNotification:", v7, v22);
  }

}

- (void)_updateInfo:(id)a3 forGUID:(id)a4 updatingUnreadCount:(BOOL)a5
{
  -[IMChatRegistry _updateInfo:forGUID:updatingUnreadCount:shouldPostNotifications:](self, "_updateInfo:forGUID:updatingUnreadCount:shouldPostNotifications:", a3, a4, a5, 1);
}

- (void)_updateChat:(id)a3 originalGroupID:(id)a4 shouldPostNotification:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  int v10;
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v5 = a5;
  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "originalGroupID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((IMAreObjectsLogicallySame() & 1) == 0)
  {
    v10 = objc_msgSend(v7, "chatStyle");
    v11 = IMOSLoggingEnabled();
    if (v10 == 43)
    {
      if (v11)
      {
        OSLogHandleForIMFoundationCategory();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v7, "guid");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 138412802;
          v19 = v13;
          v20 = 2112;
          v21 = v9;
          v22 = 2112;
          v23 = v8;
          _os_log_impl(&dword_1A1FF4000, v12, OS_LOG_TYPE_INFO, "Updating original groupID of chat %@ from %@ to %@", (uint8_t *)&v18, 0x20u);

        }
      }
      if (v8)
        objc_msgSend(v7, "setOriginalGroupID:", v8);
      if (v5)
      {
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
        v15 = v14;
        if (v9)
          objc_msgSend(v14, "setObject:forKey:", v9, CFSTR("__kIMChatRegistryPreviousOriginalGroupIDKey"));
        if (v8)
          objc_msgSend(v15, "setObject:forKey:", v8, CFSTR("__kIMChatRegistryUpdatedOriginalGroupIDKey"));
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "__mainThreadPostNotificationName:object:userInfo:", CFSTR("__kIMChatRegistryOriginalGroupIDChangedNotification"), v7, v15);

      }
    }
    else if (v11)
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v18 = 138412802;
        v19 = v9;
        v20 = 2112;
        v21 = v8;
        v22 = 2112;
        v23 = v7;
        _os_log_impl(&dword_1A1FF4000, v17, OS_LOG_TYPE_INFO, "Ignoring original groupID update (%@ -> %@) because chat is not group chat: %@", (uint8_t *)&v18, 0x20u);
      }

    }
  }

}

- (void)_updateChat:(id)a3 groupID:(id)a4 shouldPostNotification:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  NSObject *v28;
  uint64_t v29;

  v5 = a5;
  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "groupID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((IMAreObjectsLogicallySame() & 1) == 0)
  {
    if (objc_msgSend(v8, "chatStyle") == 43)
    {
      if (v9)
      {
        -[IMChatRegistry groupIDToChatMap](self, "groupIDToChatMap");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", v9);
        v12 = objc_claimAutoreleasedReturnValue();

        if (v12 && -[NSObject chatStyle](v12, "chatStyle") == 43)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v8, "guid");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = 138413058;
              v22 = v10;
              v23 = 2112;
              v24 = v9;
              v25 = 2112;
              v26 = v14;
              v27 = 2112;
              v28 = v12;
              _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "Ignoring groupID update (%@ -> %@) for %@ because existing group chat is in groupID map: %@", (uint8_t *)&v21, 0x2Au);

            }
          }
LABEL_27:

          goto LABEL_28;
        }
      }
      else
      {
        v12 = 0;
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v8, "guid");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = 138412802;
          v22 = v16;
          v23 = 2112;
          v24 = v10;
          v25 = 2112;
          v26 = v9;
          _os_log_impl(&dword_1A1FF4000, v15, OS_LOG_TYPE_INFO, "Updating groupID of chat %@ from %@ to %@", (uint8_t *)&v21, 0x20u);

        }
      }
      if (v9)
      {
        objc_msgSend(v8, "setGroupID:", v9);
        -[IMChatRegistry groupIDToChatMap](self, "groupIDToChatMap");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKey:", v8, v9);

      }
      if (v5)
      {
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
        v19 = v18;
        if (v10)
          objc_msgSend(v18, "setObject:forKey:", v10, CFSTR("__kIMChatRegistryPreviousGroupIDKey"));
        if (v9)
          objc_msgSend(v19, "setObject:forKey:", v9, CFSTR("__kIMChatRegistryUpdatedGroupIDKey"));
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "__mainThreadPostNotificationName:object:userInfo:", CFSTR("__kIMChatRegistryGroupIDChangedNotification"), v8, v19);

      }
      goto LABEL_27;
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v21 = 138412802;
        v22 = v10;
        v23 = 2112;
        v24 = v9;
        v25 = 2112;
        v26 = v8;
        _os_log_impl(&dword_1A1FF4000, v12, OS_LOG_TYPE_INFO, "Ignoring groupID update (%@ -> %@) because chat is not group chat: %@", (uint8_t *)&v21, 0x20u);
      }
      goto LABEL_27;
    }
  }
LABEL_28:

}

- (void)chat:(id)a3 updated:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("lastMessage"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("guid"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = 138412802;
      v13 = v6;
      v14 = 2112;
      v15 = v10;
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "chat: %@  last message guid %@ updated: %@", (uint8_t *)&v12, 0x20u);
    }

  }
  -[IMChatRegistry _updateInfo:forGUID:updatingUnreadCount:](self, "_updateInfo:forGUID:updatingUnreadCount:", v7, v6, 1);

}

- (void)historicalMessageGUIDsDeleted:(id)a3 chatGUIDs:(id)a4 queryID:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v29 = v8;
      v30 = 2112;
      v31 = v10;
      v32 = 2112;
      v33 = v9;
      _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "deletedGUIDs: %@  queryID: %@  chatGUIDs: %@", buf, 0x20u);
    }

  }
  if (objc_msgSend(v9, "count"))
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v13 = v9;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v24;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v24 != v15)
            objc_enumerationMutation(v13);
          -[IMChatRegistry existingChatWithGUID:](self, "existingChatWithGUID:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v16));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17 && (objc_msgSend(v12, "containsObjectIdenticalTo:", v17) & 1) == 0)
          {
            objc_msgSend(v17, "_handleMessageGUIDDeletions:", v8);
            objc_msgSend(v12, "addObject:", v17);
          }

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v14);
    }

  }
  else
  {
    -[IMChatRegistry chatGUIDToChatMap](self, "chatGUIDToChatMap");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = sub_1A213FEB4;
    v21[3] = &unk_1E4722FA8;
    v22 = v8;
    objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v21);

    v12 = v22;
  }

  -[IMChatRegistry daemonQueryController](self, "daemonQueryController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "completeQuery:", v10);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "__mainThreadPostNotificationName:object:", CFSTR("__kIMChatRegistryDidMoveMessagesInChatsToRecentlyDeletedNotification"), v8);

}

- (void)_checkLimitAndSetMessagesToKeepLoadedIfNeeded:(unint64_t)a3 chat:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  unint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (objc_msgSend(v5, "numberOfMessagesToKeepLoaded") < a3)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = 134218240;
        v8 = a3;
        v9 = 2048;
        v10 = objc_msgSend(v5, "numberOfMessagesToKeepLoaded");
        _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "The limit (%lu) of number of messages we loaded is higher than our capacity (%lu), bumping our capactity to the new limit", (uint8_t *)&v7, 0x16u);
      }

    }
    objc_msgSend(v5, "setNumberOfMessagesToKeepLoaded:", a3);
  }

}

- (void)_completeChatLoadQueryWithChat:(id)a3 queryID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("__kIMChatQueryIDKey");
      v13[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "__mainThreadPostNotificationName:object:userInfo:", CFSTR("__kIMChatLoadRequestDidCompleteNotification"), v6, v9);

      -[IMChatRegistry daemonQueryController](self, "daemonQueryController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "completeQuery:", v7);
    }
    else
    {
      -[IMChatRegistry daemonQueryController](self, "daemonQueryController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Messages.IMChatRegistryErrorDomain"), 1, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "failQuery:error:", v7, v11);

    }
  }

}

- (void)historyQuery:(id)a3 chatID:(id)a4 services:(id)a5 finishedWithResult:(id)a6 limit:(int64_t)a7
{
  void *v10;
  int v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  int v16;
  NSObject *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *IMMessageFromIMMessageItemDictionary;
  NSObject *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  int v34;
  int v35;
  id v37;
  id v38;
  id v39;
  id v40;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  id v48;
  __int16 v49;
  id v50;
  __int16 v51;
  id v52;
  __int16 v53;
  int v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v40 = a3;
  v39 = a4;
  v37 = a5;
  v38 = a6;
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "capabilitiesForListenerID:", 0);
  if ((*MEMORY[0x1E0D36CD0] & v11) == 0)
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "capabilitiesForListenerID:", 0);
    if ((*MEMORY[0x1E0D36D28] & v13) == 0)
    {
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "capabilitiesForListenerID:", 0);
      v35 = *MEMORY[0x1E0D36CC0] & v34;

      if (!v35)
        goto LABEL_38;
      goto LABEL_5;
    }

  }
LABEL_5:
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      v48 = v40;
      v49 = 2112;
      v50 = v39;
      v51 = 2112;
      v52 = v37;
      v53 = 1024;
      v54 = objc_msgSend(v38, "count");
      _os_log_impl(&dword_1A1FF4000, v14, OS_LOG_TYPE_INFO, "History query ID: %@   chatID: %@  service: %@  finished with results (%d)", buf, 0x26u);
    }

  }
  -[IMChatRegistry existingChatWithGUID:](self, "existingChatWithGUID:", v39);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = IMOSLoggingEnabled();
  if (v15)
  {
    if (v16)
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v48 = v15;
        _os_log_impl(&dword_1A1FF4000, v17, OS_LOG_TYPE_INFO, "Found chat: %@", buf, 0xCu);
      }

    }
    +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_enableCache");

    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v19 = v38;
    v20 = 0;
    v21 = 0;
    v22 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v44;
      do
      {
        v24 = 0;
        v25 = v20;
        do
        {
          if (*(_QWORD *)v44 != v23)
            objc_enumerationMutation(v19);
          v26 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v24);
          v42 = v25;
          _IMBestAccountForIMMessageItemDictionary(v26, v15, 0, v25, &v42);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v42;

          IMMessageFromIMMessageItemDictionary = _CreateIMMessageFromIMMessageItemDictionary(v26, v27, 1);
          if (IMMessageFromIMMessageItemDictionary)
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v48 = IMMessageFromIMMessageItemDictionary;
                _os_log_impl(&dword_1A1FF4000, v29, OS_LOG_TYPE_DEBUG, "   => Created IMItem: %@", buf, 0xCu);
              }

            }
            if (!v21)
              v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            -[IMChatRegistry _checkIfItemIsCorrupt:](self, "_checkIfItemIsCorrupt:", IMMessageFromIMMessageItemDictionary);
            if (!objc_msgSend(IMMessageFromIMMessageItemDictionary, "type"))
            {
              objc_msgSend(IMMessageFromIMMessageItemDictionary, "message");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              _IMCheckMessageForDDResults(v30);

            }
            objc_msgSend(v21, "addObject:", IMMessageFromIMMessageItemDictionary);
          }

          ++v24;
          v25 = v20;
        }
        while (v22 != v24);
        v22 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
      }
      while (v22);
    }

    -[IMChatRegistry _checkLimitAndSetMessagesToKeepLoadedIfNeeded:chat:](self, "_checkLimitAndSetMessagesToKeepLoadedIfNeeded:chat:", a7, v15);
    objc_msgSend(v15, "_insertHistoricalMessages:queryID:isRefresh:isHistoryQuery:limit:", v21, v40, 0, 1, a7);
    +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "_disableCache");

  }
  else
  {
    if (v16)
    {
      OSLogHandleForIMFoundationCategory();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v48 = v40;
        v49 = 2112;
        v50 = v39;
        _os_log_impl(&dword_1A1FF4000, v32, OS_LOG_TYPE_INFO, "Found no chat object for query: %@   chat ID: %@", buf, 0x16u);
      }

    }
    v20 = 0;
  }
  -[IMChatRegistry _completeChatLoadQueryWithChat:queryID:](self, "_completeChatLoadQueryWithChat:queryID:", v15, v40);
  kdebug_trace();

LABEL_38:
}

- (void)pagedHistoryQuery:(id)a3 chatID:(id)a4 services:(id)a5 numberOfMessagesBefore:(int64_t)a6 numberOfMessagesAfter:(int64_t)a7 finishedWithResult:(id)a8 hasMessagesBefore:(BOOL)a9 hasMessagesAfter:(BOOL)a10
{
  void *v13;
  int v14;
  void *v15;
  int v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *IMMessageFromIMMessageItemDictionary;
  void *v30;
  NSObject *v31;
  _BOOL8 v32;
  NSObject *v34;
  void *v36;
  void *v37;
  int v38;
  int v39;
  uint64_t v40;
  id v42;
  id v44;
  id v45;
  id v46;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[4];
  _BYTE v54[10];
  id v55;
  __int16 v56;
  id v57;
  __int16 v58;
  int v59;
  __int16 v60;
  int v61;
  __int16 v62;
  int v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v46 = a3;
  v45 = a4;
  v42 = a5;
  v44 = a8;
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "capabilitiesForListenerID:", 0);
  if ((*MEMORY[0x1E0D36CD0] & v14) == 0)
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "capabilitiesForListenerID:", 0);
    if ((*MEMORY[0x1E0D36D28] & v16) == 0)
    {
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "capabilitiesForListenerID:", 0);
      v39 = *MEMORY[0x1E0D36CC0] & v38;

      if (!v39)
        goto LABEL_43;
      goto LABEL_5;
    }

  }
LABEL_5:
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413570;
      *(_QWORD *)v54 = v46;
      *(_WORD *)&v54[8] = 2112;
      v55 = v45;
      v56 = 2112;
      v57 = v42;
      v58 = 1024;
      v59 = objc_msgSend(v44, "count");
      v60 = 1024;
      v61 = a6;
      v62 = 1024;
      v63 = a7;
      _os_log_impl(&dword_1A1FF4000, v17, OS_LOG_TYPE_INFO, "Paged history query ID: %@ chatID: %@ service: %@ finished with results count: %d numberOfMessagesBefore: %d numberOfMessagesAfter: %d", buf, 0x32u);
    }

  }
  -[IMChatRegistry existingChatWithGUID:](self, "existingChatWithGUID:", v45);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_enableCache");

    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v20 = v44;
    v21 = 0;
    v22 = 0;
    v23 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v49, v64, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v50;
      do
      {
        v25 = 0;
        v26 = v21;
        do
        {
          if (*(_QWORD *)v50 != v24)
            objc_enumerationMutation(v20);
          v27 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v25);
          v48 = v26;
          _IMBestAccountForIMMessageItemDictionary(v27, v18, 0, v26, &v48);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v48;

          IMMessageFromIMMessageItemDictionary = _CreateIMMessageFromIMMessageItemDictionary(v27, v28, 1);
          if (IMMessageFromIMMessageItemDictionary)
          {
            if (!v22)
              v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            -[IMChatRegistry _checkIfItemIsCorrupt:](self, "_checkIfItemIsCorrupt:", IMMessageFromIMMessageItemDictionary);
            if (!objc_msgSend(IMMessageFromIMMessageItemDictionary, "type"))
            {
              objc_msgSend(IMMessageFromIMMessageItemDictionary, "message");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              _IMCheckMessageForDDResults(v30);

            }
            objc_msgSend(v22, "addObject:", IMMessageFromIMMessageItemDictionary);
          }

          ++v25;
          v26 = v21;
        }
        while (v23 != v25);
        v23 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v49, v64, 16);
      }
      while (v23);
    }

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v54 = a6;
        *(_WORD *)&v54[4] = 1024;
        *(_DWORD *)&v54[6] = a7;
        _os_log_impl(&dword_1A1FF4000, v31, OS_LOG_TYPE_INFO, "Paged history about to call insert historicalMessages numberOfMessagesBefore: %d numberOfMessagesAfter: %d", buf, 0xEu);
      }

    }
    v32 = a7 > 0 && a6 > 0;
    if (a6 <= 0)
      a9 = objc_msgSend(v18, "hasMoreMessagesToLoad");
    if (a7 <= 0)
      a10 = objc_msgSend(v18, "hasMoreRecentMessagesToLoad");
    BYTE1(v40) = a10;
    LOBYTE(v40) = a9;
    objc_msgSend(v18, "_insertHistoricalMessages:queryID:isRefresh:isHistoryQuery:isReplacingItems:limit:hasMessagesBefore:hasMessagesAfter:", v22, v46, 0, 1, v32, objc_msgSend(v22, "count"), v40);
    +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "_disableCache");

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v54 = v46;
        *(_WORD *)&v54[8] = 2112;
        v55 = v45;
        _os_log_impl(&dword_1A1FF4000, v34, OS_LOG_TYPE_INFO, "Found no chat object for query: %@  chat ID: %@", buf, 0x16u);
      }

    }
    v21 = 0;
  }
  -[IMChatRegistry _completeChatLoadQueryWithChat:queryID:](self, "_completeChatLoadQueryWithChat:queryID:", v18, v46);

LABEL_43:
}

- (void)attachmentQuery:(id)a3 chatID:(id)a4 services:(id)a5 finishedWithResult:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  NSObject *v18;
  void *v19;
  int v20;
  NSObject *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  int v26;
  int v27;
  _QWORD v28[4];
  id v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "capabilitiesForListenerID:", 0);
  if ((*MEMORY[0x1E0D36CD0] & v15) == 0)
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "capabilitiesForListenerID:", 0);
    if ((*MEMORY[0x1E0D36D28] & v17) == 0)
    {
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "capabilitiesForListenerID:", 0);
      v27 = *MEMORY[0x1E0D36CC0] & v26;

      if (!v27)
        goto LABEL_20;
      goto LABEL_5;
    }

  }
LABEL_5:
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      v31 = v10;
      v32 = 2112;
      v33 = v11;
      v34 = 2112;
      v35 = v12;
      v36 = 1024;
      v37 = objc_msgSend(v13, "count");
      _os_log_impl(&dword_1A1FF4000, v18, OS_LOG_TYPE_INFO, "Media attachment filenames query ID: %@   chatID: %@  service: %@  finished with results (%d)", buf, 0x26u);
    }

  }
  -[IMChatRegistry existingChatWithGUID:](self, "existingChatWithGUID:", v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = IMOSLoggingEnabled();
  if (v19)
  {
    if (v20)
    {
      OSLogHandleForIMFoundationCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v19;
        _os_log_impl(&dword_1A1FF4000, v21, OS_LOG_TYPE_INFO, "Found chat: %@", buf, 0xCu);
      }

    }
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v13, "count"));
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = sub_1A21412FC;
    v28[3] = &unk_1E4722FF8;
    v29 = v22;
    v23 = v22;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v28);
    objc_msgSend(v19, "_setAttachments:", v23);

  }
  else if (v20)
  {
    OSLogHandleForIMFoundationCategory();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v31 = v10;
      v32 = 2112;
      v33 = v11;
      _os_log_impl(&dword_1A1FF4000, v24, OS_LOG_TYPE_INFO, "Found no chat object for query: %@   chat ID: %@", buf, 0x16u);
    }

  }
  -[IMChatRegistry _completeChatLoadQueryWithChat:queryID:](self, "_completeChatLoadQueryWithChat:queryID:", v19, v10);

LABEL_20:
}

- (void)uncachedAttachmentCountQuery:(id)a3 chatID:(id)a4 services:(id)a5 finishedWithResult:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  NSObject *v18;
  void *v19;
  int v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  int v24;
  int v25;
  int v26;
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "capabilitiesForListenerID:", 0);
  if ((*MEMORY[0x1E0D36CD0] & v15) == 0)
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "capabilitiesForListenerID:", 0);
    if ((*MEMORY[0x1E0D36D28] & v17) == 0)
    {
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "capabilitiesForListenerID:", 0);
      v25 = *MEMORY[0x1E0D36CC0] & v24;

      if (!v25)
        goto LABEL_20;
      goto LABEL_5;
    }

  }
LABEL_5:
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v26 = 138413058;
      v27 = v10;
      v28 = 2112;
      v29 = v11;
      v30 = 2112;
      v31 = v12;
      v32 = 2048;
      v33 = objc_msgSend(v13, "unsignedLongValue");
      _os_log_impl(&dword_1A1FF4000, v18, OS_LOG_TYPE_INFO, "Media attachment uncached count query ID: %@   chatID: %@  service: %@  finished with results (%lu)", (uint8_t *)&v26, 0x2Au);
    }

  }
  -[IMChatRegistry existingChatWithGUID:](self, "existingChatWithGUID:", v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = IMOSLoggingEnabled();
  if (v19)
  {
    if (v20)
    {
      OSLogHandleForIMFoundationCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v26 = 138412290;
        v27 = v19;
        _os_log_impl(&dword_1A1FF4000, v21, OS_LOG_TYPE_INFO, "Found chat: %@", (uint8_t *)&v26, 0xCu);
      }

    }
    objc_msgSend(v19, "_setCountOfAttachmentsNotCachedLocally:", v13);
  }
  else if (v20)
  {
    OSLogHandleForIMFoundationCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v26 = 138412546;
      v27 = v10;
      v28 = 2112;
      v29 = v11;
      _os_log_impl(&dword_1A1FF4000, v22, OS_LOG_TYPE_INFO, "Found no chat object for query: %@   chat ID: %@", (uint8_t *)&v26, 0x16u);
    }

  }
  -[IMChatRegistry _completeChatLoadQueryWithChat:queryID:](self, "_completeChatLoadQueryWithChat:queryID:", v19, v10);

LABEL_20:
}

- (id)_chatForIdentifiers:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_1A200AEE4;
  v12 = sub_1A200ACE4;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1A214182C;
  v7[3] = &unk_1E4723020;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (void)finishedDownloadingPurgedAssetsForChatIDs:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "capabilitiesForListenerID:", 0);
  if ((*MEMORY[0x1E0D36CD0] & v6) == 0)
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "capabilitiesForListenerID:", 0);
    if ((*MEMORY[0x1E0D36D28] & v8) == 0)
    {
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "capabilitiesForListenerID:", 0);
      v14 = *MEMORY[0x1E0D36CC0] & v13;

      if (!v14)
        goto LABEL_12;
      goto LABEL_5;
    }

  }
LABEL_5:
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v15 = 138412290;
      v16 = v4;
      _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_INFO, "Media attachment download purged assets for chatIDs: %@  finished.", (uint8_t *)&v15, 0xCu);
    }

  }
  -[IMChatRegistry _chatForIdentifiers:](self, "_chatForIdentifiers:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "__mainThreadPostNotificationName:object:userInfo:", CFSTR("__kIMChatPurgedAttachmentsDownloadCompleteNotification"), v10, 0);

  }
LABEL_12:

}

- (void)downloadedPurgedAssetBatchForChatIDs:(id)a3 completedTransferGUIDs:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  const __CFString *v20;
  id v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "capabilitiesForListenerID:", 0);
  if ((*MEMORY[0x1E0D36CD0] & v9) == 0)
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "capabilitiesForListenerID:", 0);
    if ((*MEMORY[0x1E0D36D28] & v11) == 0)
    {
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "capabilitiesForListenerID:", 0);
      v19 = *MEMORY[0x1E0D36CC0] & v18;

      if (!v19)
        goto LABEL_15;
      goto LABEL_5;
    }

  }
LABEL_5:
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v6;
      _os_log_impl(&dword_1A1FF4000, v12, OS_LOG_TYPE_INFO, "Media attachment download purged assets batch for chatIDs: %@  finished.", buf, 0xCu);
    }

  }
  -[IMChatRegistry _chatForIdentifiers:](self, "_chatForIdentifiers:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if (v7)
      v14 = v7;
    else
      v14 = (id)MEMORY[0x1E0C9AA60];
    v20 = CFSTR("completedTransferGUIDs");
    v21 = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "__mainThreadPostNotificationName:object:userInfo:", CFSTR("__kIMChatPurgedAttachmentsDownloadBatchCompleteNotification"), v13, v15);

  }
LABEL_15:

}

- (void)isDownloadingQuery:(id)a3 chatID:(id)a4 services:(id)a5 finishedWithResult:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  NSObject *v17;
  void *v18;
  int v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  int v23;
  int v24;
  int v25;
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  _BOOL4 v32;
  uint64_t v33;

  v6 = a6;
  v33 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "capabilitiesForListenerID:", 0);
  if ((*MEMORY[0x1E0D36CD0] & v14) == 0)
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "capabilitiesForListenerID:", 0);
    if ((*MEMORY[0x1E0D36D28] & v16) == 0)
    {
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "capabilitiesForListenerID:", 0);
      v24 = *MEMORY[0x1E0D36CC0] & v23;

      if (!v24)
        goto LABEL_20;
      goto LABEL_5;
    }

  }
LABEL_5:
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v25 = 138413058;
      v26 = v10;
      v27 = 2112;
      v28 = v11;
      v29 = 2112;
      v30 = v12;
      v31 = 1024;
      v32 = v6;
      _os_log_impl(&dword_1A1FF4000, v17, OS_LOG_TYPE_INFO, "Media attachment is downloading purged assets query ID: %@   chatID: %@  service: %@  finished with results (%i)", (uint8_t *)&v25, 0x26u);
    }

  }
  -[IMChatRegistry existingChatWithGUID:](self, "existingChatWithGUID:", v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = IMOSLoggingEnabled();
  if (v18)
  {
    if (v19)
    {
      OSLogHandleForIMFoundationCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v25 = 138412290;
        v26 = v18;
        _os_log_impl(&dword_1A1FF4000, v20, OS_LOG_TYPE_INFO, "Found chat: %@", (uint8_t *)&v25, 0xCu);
      }

    }
    objc_msgSend(v18, "_setIsDownloadingPurgedAssets:", v6);
  }
  else if (v19)
  {
    OSLogHandleForIMFoundationCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v25 = 138412546;
      v26 = v10;
      v27 = 2112;
      v28 = v11;
      _os_log_impl(&dword_1A1FF4000, v21, OS_LOG_TYPE_INFO, "Found no chat object for query: %@   chat ID: %@", (uint8_t *)&v25, 0x16u);
    }

  }
  -[IMChatRegistry _completeChatLoadQueryWithChat:queryID:](self, "_completeChatLoadQueryWithChat:queryID:", v18, v10);

LABEL_20:
}

- (void)markAsSpamQuery:(id)a3 chatID:(id)a4 services:(id)a5 finishedWithResult:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  NSObject *v18;
  void *v19;
  int v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  int v24;
  int v25;
  int v26;
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "capabilitiesForListenerID:", 0);
  if ((*MEMORY[0x1E0D36CD0] & v15) == 0)
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "capabilitiesForListenerID:", 0);
    if ((*MEMORY[0x1E0D36D28] & v17) == 0)
    {
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "capabilitiesForListenerID:", 0);
      v25 = *MEMORY[0x1E0D36CC0] & v24;

      if (!v25)
        goto LABEL_20;
      goto LABEL_5;
    }

  }
LABEL_5:
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v26 = 138413058;
      v27 = v10;
      v28 = 2112;
      v29 = v11;
      v30 = 2112;
      v31 = v12;
      v32 = 2112;
      v33 = v13;
      _os_log_impl(&dword_1A1FF4000, v18, OS_LOG_TYPE_INFO, "Mark as Spam query ID: %@   chatID: %@  service: %@  finished with results (%@)", (uint8_t *)&v26, 0x2Au);
    }

  }
  -[IMChatRegistry existingChatWithGUID:](self, "existingChatWithGUID:", v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = IMOSLoggingEnabled();
  if (v19)
  {
    if (v20)
    {
      OSLogHandleForIMFoundationCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v26 = 138412290;
        v27 = v19;
        _os_log_impl(&dword_1A1FF4000, v21, OS_LOG_TYPE_INFO, "Found chat: %@", (uint8_t *)&v26, 0xCu);
      }

    }
    objc_msgSend(v19, "_setCountOfMessagesMarkedAsSpam:", v13);
  }
  else if (v20)
  {
    OSLogHandleForIMFoundationCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v26 = 138412546;
      v27 = v10;
      v28 = 2112;
      v29 = v11;
      _os_log_impl(&dword_1A1FF4000, v22, OS_LOG_TYPE_INFO, "Found no chat object for query: %@   chat ID: %@", (uint8_t *)&v26, 0x16u);
    }

  }
  -[IMChatRegistry _completeChatLoadQueryWithChat:queryID:](self, "_completeChatLoadQueryWithChat:queryID:", v19, v10);

LABEL_20:
}

- (void)frequentRepliesQuery:(id)a3 chatID:(id)a4 services:(id)a5 finishedWithResult:(id)a6 limit:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  int v24;
  int v25;
  int v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "capabilitiesForListenerID:", 0);
  if ((*MEMORY[0x1E0D36CD0] & v16) == 0)
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "capabilitiesForListenerID:", 0);
    if ((*MEMORY[0x1E0D36D28] & v18) == 0)
    {
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "capabilitiesForListenerID:", 0);
      v25 = *MEMORY[0x1E0D36CC0] & v24;

      if (!v25)
        goto LABEL_12;
      goto LABEL_5;
    }

  }
LABEL_5:
  -[IMChatRegistry existingChatWithGUID:](self, "existingChatWithGUID:", v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_enableCache");

    objc_msgSend(v19, "setFrequentReplies:", v14);
    +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "_disableCache");

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v26 = 138412546;
      v27 = v11;
      v28 = 2112;
      v29 = v12;
      _os_log_impl(&dword_1A1FF4000, v22, OS_LOG_TYPE_INFO, "Found no chat object for frequent replies query: %@   chat ID: %@", (uint8_t *)&v26, 0x16u);
    }

  }
  -[IMChatRegistry _completeChatLoadQueryWithChat:queryID:](self, "_completeChatLoadQueryWithChat:queryID:", v19, v11);

LABEL_12:
}

- (void)_automation_markAsReadQuery:(id)a3 finishedWithResult:(BOOL)a4
{
  void *v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  id v13;

  v13 = a3;
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "capabilitiesForListenerID:", 0);
  if ((*MEMORY[0x1E0D36CD0] & v6) == 0)
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "capabilitiesForListenerID:", 0);
    if ((*MEMORY[0x1E0D36D28] & v8) == 0)
    {
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "capabilitiesForListenerID:", 0);
      v12 = *MEMORY[0x1E0D36CC0] & v11;

      if (!v12)
        goto LABEL_6;
      goto LABEL_5;
    }

  }
LABEL_5:
  -[IMChatRegistry daemonQueryController](self, "daemonQueryController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "completeQuery:", v13);

LABEL_6:
}

- (void)chatsNeedRemerging:(id)a3 groupedChats:(id)a4
{
  NSObject *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSObject *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id v26;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  const __CFString *v33;
  id v34;
  _BYTE v35[128];
  const __CFString *v36;
  id v37;
  uint8_t buf[4];
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  v26 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "Chats need re-merging notification", buf, 2u);
    }

  }
  if ((unint64_t)objc_msgSend(v28, "count", v26) < 2)
  {
    if (objc_msgSend(v28, "count") == 1)
    {
      objc_msgSend(v28, "lastObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMChatRegistry existingChatWithGUID:](self, "existingChatWithGUID:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "firstObject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKey:", *MEMORY[0x1E0D37830]);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMChatRegistry _updatePersonCentricIDToChatMapForChat:toNewPersonCentricID:](self, "_updatePersonCentricIDToChatMapForChat:toNewPersonCentricID:", v22, v24);

    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1FF4000, v25, OS_LOG_TYPE_INFO, "One GUID presented to merge, not remerging!", buf, 2u);
      }

    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v39 = v28;
        _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "Asked to remerge %@", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v28;
    if (!v28)
      v9 = (id)MEMORY[0x1E0C9AA60];
    v36 = CFSTR("__kIMChatRegistryGUIDListKey");
    v37 = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "__mainThreadPostNotificationName:object:userInfo:", CFSTR("__kIMChatRegistryWillRemergeChatsNotification"), self, v10);

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v11 = v28;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v30 != v13)
            objc_enumerationMutation(v11);
          v15 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v39 = v15;
              _os_log_impl(&dword_1A1FF4000, v16, OS_LOG_TYPE_INFO, "Unregistering chat guid %@", buf, 0xCu);
            }

          }
          -[IMChatRegistry _unregisterChatWithGUID:](self, "_unregisterChatWithGUID:", v15);
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      }
      while (v12);
    }

    v17 = -[IMChatRegistry _copyMergedChatsPairedArrayFromMergedChatsArray:](self, "_copyMergedChatsPairedArrayFromMergedChatsArray:", v27);
    sub_1A1FFE7D4(self, v17, 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = CFSTR("__kIMChatRegistryMergedPairsListKey");
    v19 = (id)MEMORY[0x1E0C9AA60];
    if (v17)
      v19 = v17;
    v34 = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "__mainThreadPostNotificationName:object:userInfo:", CFSTR("__kIMChatRegistryDidRemergeChatsNotification"), self, v20);

  }
}

- (void)_handleChatReconstructions:(id)a3
{
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "capabilitiesForListenerID:", 0);
  v6 = *MEMORY[0x1E0D36D10] & v5;

  if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMEventCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "Bailing out of handle chat reconstructions due to kFZListenerCapPaginatedChatRegistry", buf, 2u);
      }
LABEL_13:

      goto LABEL_14;
    }
    goto LABEL_14;
  }
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "capabilitiesForListenerID:", 0);
  if ((*MEMORY[0x1E0D36CD0] & v9) == 0)
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "capabilitiesForListenerID:", 0);
    if ((*MEMORY[0x1E0D36D28] & v11) == 0)
    {
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "capabilitiesForListenerID:", 0);
      v16 = *MEMORY[0x1E0D36CC0] & v15;

      if (!v16)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A1FF4000, v17, OS_LOG_TYPE_INFO, "Clearing chat registry", buf, 2u);
          }

        }
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "__mainThreadPostNotificationName:object:", CFSTR("__kIMChatRegistryWillLoadNotification"), 0);

        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        -[IMChatRegistry cachedChats](self, "cachedChats");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)objc_msgSend(v19, "copy");

        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        if (v21)
        {
          v22 = *(_QWORD *)v29;
          do
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v29 != v22)
                objc_enumerationMutation(v20);
              v24 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
              if (IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v25 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  v34 = v24;
                  _os_log_impl(&dword_1A1FF4000, v25, OS_LOG_TYPE_INFO, " => Unregistering chat: %@", buf, 0xCu);
                }

              }
              -[IMChatRegistry _unregisterChat:](self, "_unregisterChat:", v24);
            }
            v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
          }
          while (v21);
        }

        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "__mainThreadPostNotificationName:object:", CFSTR("__kIMChatRegistryDidLoadNotification"), 0);

        goto LABEL_14;
      }
      goto LABEL_10;
    }

  }
LABEL_10:
  -[IMChatRegistry cachedChats](self, "cachedChats");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMChatRegistry setPreExistingAllChats:](self, "setPreExistingAllChats:", v12);

  -[IMChatRegistry chatGUIDToInfoMap](self, "chatGUIDToInfoMap");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeAllObjects");

  -[IMChatRegistry __handleChatReconstructions:](self, "__handleChatReconstructions:", v27);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "Not doing 2 step chat registry load", buf, 2u);
    }
    goto LABEL_13;
  }
LABEL_14:

}

- (void)__handleChatReconstructions:(id)a3
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t i;
  void *v10;
  IMChatRegistry *v11;
  IMChatRegistry *v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *IMMessageFromIMMessageItemDictionary;
  id v29;
  void *v30;
  void *v31;
  IMChatRegistry *v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  id v36;
  NSObject *v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _BOOL4 v45;
  id v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  int v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t j;
  NSObject *v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t k;
  void *v69;
  NSObject *v70;
  IMChatRegistry *v71;
  NSObject *v72;
  void *v73;
  NSObject *v74;
  NSObject *v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t m;
  NSObject *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  _BOOL4 v85;
  unsigned int v86;
  id v87;
  void *v88;
  id obj;
  id v90;
  id v91;
  uint64_t v92;
  uint64_t v93;
  id v94;
  id v95;
  _BOOL4 v96;
  char v97;
  IMChatRegistry *v98;
  void *v99;
  void *v100;
  void *v101;
  id v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  id v116;
  char v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  _BYTE v122[128];
  _BYTE v123[128];
  _BYTE v124[128];
  uint8_t v125[128];
  uint8_t buf[4];
  id v127;
  uint64_t v128;

  v128 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v4, OS_LOG_TYPE_INFO, "Restoring chats", buf, 2u);
    }

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      MarcoLoggingStringForMessageData();
      v6 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v127 = v6;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_DEBUG, " => chats: %@", buf, 0xCu);

    }
  }
  objc_msgSend(MEMORY[0x1E0D36AE8], "IMCoreSetupTimingCollection");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "startTimingForKey:", CFSTR("IMCoreSetup: ChatReconstruction"));
  -[IMChatRegistry setLoading:](self, "setLoading:", 1);
  v85 = -[IMChatRegistry isFirstLoad](self, "isFirstLoad");
  v90 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v87 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v91 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[IMChatRegistry cachedChats](self, "cachedChats");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "addObjectsFromArray:", v7);

  -[IMChatRegistry _resetChatReconstructionGroupMaps](self, "_resetChatReconstructionGroupMaps");
  -[IMChatRegistry groupIDToChatMap](self, "groupIDToChatMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllObjects");

  v120 = 0u;
  v121 = 0u;
  v118 = 0u;
  v119 = 0u;
  obj = v3;
  v93 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v118, v125, 16);
  if (!v93)
  {
    v97 = 0;
    goto LABEL_109;
  }
  v97 = 0;
  v86 = !v85;
  v92 = *(_QWORD *)v119;
  do
  {
    for (i = 0; i != v93; ++i)
    {
      if (*(_QWORD *)v119 != v92)
        objc_enumerationMutation(obj);
      v100 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * i);
      objc_msgSend(v100, "objectForKey:", CFSTR("guid"));
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMChatRegistry _cachedChatWithGUID:](self, "_cachedChatWithGUID:", v101);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "objectForKey:", CFSTR("lastMessage"));
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        if (!-[IMChatRegistry wantsHistoryReload](self, "wantsHistoryReload"))
        {
          -[IMChatRegistry _registerChatDictionary:forChat:isIncoming:newGUID:shouldPostNotification:](self, "_registerChatDictionary:forChat:isIncoming:newGUID:shouldPostNotification:", v100, v10, 0, v101, 0);
          -[IMChatRegistry _updateInfo:forGUID:updatingUnreadCount:](self, "_updateInfo:forGUID:updatingUnreadCount:", v100, v101, 1);
          objc_msgSend(v90, "removeObjectIdenticalTo:", v10);
          v26 = 0;
          goto LABEL_103;
        }
        v11 = self;
        if ((v97 & 1) == 0)
        {
          v12 = v11;
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "** Posting will load notification", buf, 2u);
            }

          }
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "__mainThreadPostNotificationName:object:", CFSTR("__kIMChatRegistryWillLoadNotification"), v12);

          v11 = v12;
        }
        v98 = v11;

        v15 = v99;
        v16 = v100;
        if (objc_msgSend(v15, "count"))
        {
          objc_msgSend(v15, "objectForKey:", CFSTR("accountID"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKey:", CFSTR("account"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKey:", CFSTR("serviceName"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            if (v18)
              goto LABEL_25;
LABEL_69:
            objc_msgSend(v16, "objectForKey:", CFSTR("account"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v19)
              goto LABEL_70;
LABEL_71:
            +[IMServiceImpl serviceWithInternalName:](IMServiceImpl, "serviceWithInternalName:", v19);
            v46 = (id)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            objc_msgSend(v16, "objectForKey:", CFSTR("accountID"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v18)
              goto LABEL_69;
LABEL_25:
            if (v19)
              goto LABEL_71;
LABEL_70:
            objc_msgSend(v16, "objectForKey:", CFSTR("serviceName"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (v19)
              goto LABEL_71;
            v46 = 0;
          }
          +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "bestAccountForService:login:guid:", v46, v18, v17);
          v48 = (void *)objc_claimAutoreleasedReturnValue();

          IMMessageFromIMMessageItemDictionary = _CreateIMMessageFromIMMessageItemDictionary(v15, v48, 1);
        }
        else
        {
          IMMessageFromIMMessageItemDictionary = 0;
        }
        v26 = IMMessageFromIMMessageItemDictionary;

        if (v26)
        {
          -[IMChatRegistry _checkIfItemIsCorrupt:](v98, "_checkIfItemIsCorrupt:", v26);
          v49 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v49, "addObject:", v26);
          v50 = v26;
          v51 = v10;
          objc_msgSend(v51, "_lastMessage");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = v52;
          if (!v52)
            goto LABEL_89;
          if (objc_msgSend(v52, "messageID") && objc_msgSend(v50, "messageID"))
          {
            objc_msgSend(v50, "time");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "time");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v96 = objc_msgSend(v54, "compare:", v55) == 1;

            if (!v96)
              goto LABEL_91;
LABEL_90:
            objc_msgSend(v51, "_insertHistoricalMessages:queryID:isRefresh:isHistoryQuery:", v49, CFSTR("Reconstruction"), v86, 0);
            goto LABEL_91;
          }
          if (!objc_msgSend(v53, "messageID") && objc_msgSend(v50, "messageID"))
          {
LABEL_89:

            goto LABEL_90;
          }
          if (objc_msgSend(v53, "messageID"))
            objc_msgSend(v50, "messageID");

LABEL_91:
        }
        -[IMChatRegistry _registerChatDictionary:forChat:isIncoming:newGUID:shouldPostNotification:](v98, "_registerChatDictionary:forChat:isIncoming:newGUID:shouldPostNotification:", v16, v10, 0, v101, 0);
        -[IMChatRegistry _updateInfo:forGUID:updatingUnreadCount:](v98, "_updateInfo:forGUID:updatingUnreadCount:", v16, v101, 1);
        if ((objc_msgSend(v91, "containsObjectIdenticalTo:", v10) & 1) == 0)
          objc_msgSend(v91, "addObject:", v10);
        objc_msgSend(v90, "removeObjectIdenticalTo:", v10);
        v97 = 1;
        goto LABEL_103;
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A1FF4000, v20, OS_LOG_TYPE_INFO, " => no existing chat, we'll create one", buf, 2u);
        }

      }
      v21 = v99;
      v22 = v100;
      if (!objc_msgSend(v21, "count"))
      {
        v27 = 0;
        goto LABEL_44;
      }
      objc_msgSend(v21, "objectForKey:", CFSTR("accountID"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKey:", CFSTR("account"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKey:", CFSTR("serviceName"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        if (v24)
          goto LABEL_34;
      }
      else
      {
        objc_msgSend(v22, "objectForKey:", CFSTR("accountID"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
        {
LABEL_34:
          if (v25)
            goto LABEL_42;
          goto LABEL_41;
        }
      }
      objc_msgSend(v22, "objectForKey:", CFSTR("account"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
        goto LABEL_42;
LABEL_41:
      objc_msgSend(v22, "objectForKey:", CFSTR("serviceName"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v25)
      {
        v29 = 0;
        goto LABEL_43;
      }
LABEL_42:
      +[IMServiceImpl serviceWithInternalName:](IMServiceImpl, "serviceWithInternalName:", v25);
      v29 = (id)objc_claimAutoreleasedReturnValue();

LABEL_43:
      +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "bestAccountForService:login:guid:", v29, v24, v23);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = _CreateIMMessageFromIMMessageItemDictionary(v21, v31, 1);
LABEL_44:
      v26 = v27;

      if (v26)
      {
        -[IMChatRegistry _checkIfItemIsCorrupt:](self, "_checkIfItemIsCorrupt:", v26);
        v95 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(v95, "addObject:", v26);
      }
      else
      {
        v95 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      }
      v117 = 0;
      v116 = 0;
      sub_1A2000CE4(self, v22, v95, 1, &v117, &v116);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v94 = v116;
      if (v117)
      {
        objc_msgSend(v10, "_startTiming:", v88);
        objc_msgSend(v87, "addObject:", v10);
        v32 = self;
        if ((v97 & 1) == 0)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1A1FF4000, v33, OS_LOG_TYPE_INFO, "** Posting will load notification", buf, 2u);
            }

          }
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "__mainThreadPostNotificationName:object:", CFSTR("__kIMChatRegistryWillLoadNotification"), v32);

        }
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v10, "guid");
            v36 = (id)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v127 = v36;
            _os_log_impl(&dword_1A1FF4000, v35, OS_LOG_TYPE_DEBUG, "   Loaded chat: %@", buf, 0xCu);

          }
        }
        -[IMChatRegistry _registerChatDictionary:forChat:isIncoming:newGUID:shouldPostNotification:](v32, "_registerChatDictionary:forChat:isIncoming:newGUID:shouldPostNotification:", v22, v10, 0, v94, 0);
        v97 = 1;
        goto LABEL_99;
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v10, "guid");
          v38 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v127 = v38;
          _os_log_impl(&dword_1A1FF4000, v37, OS_LOG_TYPE_INFO, "Not registering: %@, already existing", buf, 0xCu);

        }
      }
      -[IMChatRegistry _registerChatDictionary:forChat:isIncoming:newGUID:shouldPostNotification:](self, "_registerChatDictionary:forChat:isIncoming:newGUID:shouldPostNotification:", v22, v10, 0, v94, 0);
      objc_msgSend(v90, "removeObjectIdenticalTo:", v10);
      v39 = v26;
      v40 = v10;
      objc_msgSend(v40, "_lastMessage");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v41;
      if (!v41)
        goto LABEL_97;
      if (!objc_msgSend(v41, "messageID") || !objc_msgSend(v39, "messageID"))
      {
        if (objc_msgSend(v42, "messageID") || !objc_msgSend(v39, "messageID"))
        {
          if (objc_msgSend(v42, "messageID"))
            objc_msgSend(v39, "messageID");

          goto LABEL_99;
        }
LABEL_97:

LABEL_98:
        objc_msgSend(v40, "_insertHistoricalMessages:queryID:isRefresh:isHistoryQuery:", v95, CFSTR("Reconstruction"), v86, 0);
        goto LABEL_99;
      }
      objc_msgSend(v39, "time");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "time");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v43, "compare:", v44) == 1;

      if (v45)
        goto LABEL_98;
LABEL_99:
      -[IMChatRegistry _updateInfo:forGUID:updatingUnreadCount:](self, "_updateInfo:forGUID:updatingUnreadCount:", v22, v101, 1);
      if (v10 && (objc_msgSend(v91, "containsObjectIdenticalTo:", v10) & 1) == 0)
        objc_msgSend(v91, "addObject:", v10);

LABEL_103:
      -[IMChatRegistry _checkIfItemIsCorrupt:](self, "_checkIfItemIsCorrupt:", v26);
      objc_msgSend(v26, "service");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      +[IMService iMessageService](IMServiceImpl, "iMessageService");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "internalName");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = objc_msgSend(v56, "isEqualToIgnoringCase:", v58);

      if (v59)
        -[IMChatRegistry _setChatHasCommunicatedOveriMessage:](self, "_setChatHasCommunicatedOveriMessage:", v10);
      objc_msgSend(v10, "_setJoinState:", -[IMChatRegistry _winningJoinStateForExistingChat:incomingDictionary:](self, "_winningJoinStateForExistingChat:incomingDictionary:", v10, v100));

    }
    v93 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v118, v125, 16);
  }
  while (v93);
LABEL_109:

  objc_msgSend(v88, "startTimingForKey:", CFSTR("IMCoreSetup: Updating unread counts"));
  v114 = 0u;
  v115 = 0u;
  v112 = 0u;
  v113 = 0u;
  v60 = v91;
  v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v112, v124, 16);
  if (v61)
  {
    v62 = *(_QWORD *)v113;
    do
    {
      for (j = 0; j != v61; ++j)
      {
        if (*(_QWORD *)v113 != v62)
          objc_enumerationMutation(v60);
        -[IMChatRegistry _updateUnreadCountForChat:](self, "_updateUnreadCountForChat:", *(_QWORD *)(*((_QWORD *)&v112 + 1) + 8 * j));
      }
      v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v112, v124, 16);
    }
    while (v61);
  }

  objc_msgSend(v88, "stopTimingForKey:", CFSTR("IMCoreSetup: Updating unread counts"));
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v64 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v127 = v90;
      _os_log_impl(&dword_1A1FF4000, v64, OS_LOG_TYPE_INFO, "Removing stale chats: %@", buf, 0xCu);
    }

  }
  v110 = 0u;
  v111 = 0u;
  v108 = 0u;
  v109 = 0u;
  v65 = v90;
  v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v108, v123, 16);
  if (v66)
  {
    v67 = *(_QWORD *)v109;
    do
    {
      for (k = 0; k != v66; ++k)
      {
        if (*(_QWORD *)v109 != v67)
          objc_enumerationMutation(v65);
        v69 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * k);
        if (objc_msgSend(v69, "joinState") == 2)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v70 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1A1FF4000, v70, OS_LOG_TYPE_INFO, "We're in process of joining, let's keep this around", buf, 2u);
            }

          }
        }
        else
        {
          v71 = self;
          if ((v97 & 1) == 0)
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v72 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1A1FF4000, v72, OS_LOG_TYPE_INFO, "** Posting will load notification", buf, 2u);
              }

            }
            objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v73, "__mainThreadPostNotificationName:object:", CFSTR("__kIMChatRegistryWillLoadNotification"), v71);

          }
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v74 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v127 = v69;
              _os_log_impl(&dword_1A1FF4000, v74, OS_LOG_TYPE_INFO, " => Unregistering chat: %@", buf, 0xCu);
            }

          }
          -[IMChatRegistry _unregisterChat:](v71, "_unregisterChat:", v69);
          v97 = 1;
        }
      }
      v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v108, v123, 16);
    }
    while (v66);
  }

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v75 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v75, OS_LOG_TYPE_INFO, "Done restoring chats", buf, 2u);
    }

  }
  if (v88)
  {
    v106 = 0u;
    v107 = 0u;
    v104 = 0u;
    v105 = 0u;
    -[IMChatRegistry cachedChats](self, "cachedChats");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v104, v122, 16);
    if (v77)
    {
      v78 = *(_QWORD *)v105;
      do
      {
        for (m = 0; m != v77; ++m)
        {
          if (*(_QWORD *)v105 != v78)
            objc_enumerationMutation(v76);
          objc_msgSend(*(id *)(*((_QWORD *)&v104 + 1) + 8 * m), "_endTiming");
        }
        v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v104, v122, 16);
      }
      while (v77);
    }

  }
  objc_msgSend(v88, "stopTimingForKey:", CFSTR("IMCoreSetup: ChatReconstruction"));
  if ((v97 & 1) != 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v80 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1FF4000, v80, OS_LOG_TYPE_INFO, "** Posting did load notification", buf, 2u);
      }

    }
    if (v85)
    {
      v81 = 0;
    }
    else
    {
      v82 = (void *)MEMORY[0x1E0C99D80];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "dictionaryWithObjectsAndKeys:", v83, CFSTR("__kIMChatRegistryDidLoadIsRefreshKey"), 0);
      v81 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "__mainThreadPostNotificationName:object:userInfo:", CFSTR("__kIMChatRegistryDidLoadNotification"), self, v81);

  }
  -[IMChatRegistry setLoading:](self, "setLoading:", 0);
  -[IMChatRegistry setFirstLoad:](self, "setFirstLoad:", 0);
  if ((IMIsRunningInUnitTesting() & 1) == 0)
  {
    v103 = v87;
    im_dispatch_after();

  }
  -[IMChatRegistry setUpInitialCallState](self, "setUpInitialCallState");

}

- (void)_daemonReallyDied:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = 136315138;
      v7 = "-[IMChatRegistry(IMChatRegistry_DaemonIncoming) _daemonReallyDied:]";
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v6, 0xCu);
    }

  }
  -[IMChatRegistry setDaemonHadTerminated:](self, "setDaemonHadTerminated:", 1);

}

- (void)_daemonBeganDeferredSetup
{
  NSObject *v3;
  _BOOL4 v4;
  const __CFString *v5;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = -[IMChatRegistry isFirstLoad](self, "isFirstLoad");
      v5 = CFSTR("NO");
      if (v4)
        v5 = CFSTR("YES");
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "Daemon began deferred setup (firstLoad is: %@)", (uint8_t *)&v6, 0xCu);
    }

  }
  -[IMChatRegistry _recalculateServiceNamesForChatIdentifierSearch](self, "_recalculateServiceNamesForChatIdentifierSearch");
}

- (void)_chatLoadedWithChatIdentifier:(id)a3 chats:(id)a4
{
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *IMMessageFromIMMessageItemDictionary;
  void *v15;
  void *v16;
  void *v17;
  __CFArray *v18;
  __CFArray *v19;
  BOOL v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  id obj;
  id v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  void *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v33 = a3;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = a4;
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
  if (v32)
  {
    v31 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v38 != v31)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKey:", CFSTR("guid"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKey:", CFSTR("chatIdentifier"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v7, "isEqualToIgnoringCase:", v33) & 1) != 0)
        {
          objc_msgSend(v6, "objectForKey:", CFSTR("lastMessage"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = v6;
          if (objc_msgSend(v8, "count"))
          {
            objc_msgSend(v8, "objectForKey:", CFSTR("accountID"));
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "objectForKey:", CFSTR("account"));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "objectForKey:", CFSTR("serviceName"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (v10)
            {
              if (v11)
                goto LABEL_10;
LABEL_18:
              objc_msgSend(v9, "objectForKey:", CFSTR("account"));
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v12)
                goto LABEL_19;
LABEL_20:
              +[IMServiceImpl serviceWithInternalName:](IMServiceImpl, "serviceWithInternalName:", v12);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_msgSend(v9, "objectForKey:", CFSTR("accountID"));
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v11)
                goto LABEL_18;
LABEL_10:
              if (v12)
                goto LABEL_20;
LABEL_19:
              objc_msgSend(v9, "objectForKey:", CFSTR("serviceName"));
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              if (v12)
                goto LABEL_20;
              v15 = 0;
            }
            +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "bestAccountForService:login:guid:", v15, v11, v10);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            IMMessageFromIMMessageItemDictionary = _CreateIMMessageFromIMMessageItemDictionary(v8, v17, 1);
          }
          else
          {
            IMMessageFromIMMessageItemDictionary = 0;
          }

          if (IMMessageFromIMMessageItemDictionary)
            -[IMChatRegistry _checkIfItemIsCorrupt:](self, "_checkIfItemIsCorrupt:", IMMessageFromIMMessageItemDictionary);
          v18 = (__CFArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v19 = v18;
          v20 = IMMessageFromIMMessageItemDictionary == 0;
          if (!v18)
            v20 = 1;
          if (!v20)
            CFArrayAppendValue(v18, IMMessageFromIMMessageItemDictionary);
          buf[0] = 0;
          v36 = 0;
          sub_1A2000CE4(self, v9, v19, 1, buf, &v36);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v36;
          -[IMChatRegistry _registerChatDictionary:forChat:isIncoming:newGUID:](self, "_registerChatDictionary:forChat:isIncoming:newGUID:", v9, v21, 0, v22);
          -[IMChatRegistry _updateInfo:forGUID:updatingUnreadCount:](self, "_updateInfo:forGUID:updatingUnreadCount:", v9, v35, 1);
          if (buf[0])
            goto LABEL_42;
          v30 = IMMessageFromIMMessageItemDictionary;
          objc_msgSend(v21, "_lastMessage");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v23;
          if (v23)
          {
            if (objc_msgSend(v23, "messageID") && objc_msgSend(v30, "messageID"))
            {
              objc_msgSend(v30, "time");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "time");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = objc_msgSend(v28, "compare:", v25) == 1;

              if (!v27)
                goto LABEL_42;
LABEL_41:
              objc_msgSend(v21, "_insertHistoricalMessages:queryID:isRefresh:isHistoryQuery:", v19, CFSTR("Reconstruction"), 0, 0);
LABEL_42:
              objc_msgSend(v21, "_setJoinState:", -[IMChatRegistry _winningJoinStateForExistingChat:incomingDictionary:](self, "_winningJoinStateForExistingChat:incomingDictionary:", v21, v9));

              goto LABEL_43;
            }
            if (objc_msgSend(v24, "messageID") || !objc_msgSend(v30, "messageID"))
            {
              if (objc_msgSend(v24, "messageID"))
                objc_msgSend(v30, "messageID");

              goto LABEL_42;
            }
          }

          goto LABEL_41;
        }
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v42 = v33;
            v43 = 2112;
            v44 = v7;
            _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "We got back up the wrong chat. Expected %@, got %@", buf, 0x16u);
          }

        }
LABEL_43:

      }
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    }
    while (v32);
  }

  -[IMChatRegistry chatsBeingLoadedMap](self, "chatsBeingLoadedMap");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "removeObjectForKey:", v33);

  -[IMChatRegistry setLoading:](self, "setLoading:", 0);
  -[IMChatRegistry setFirstLoad:](self, "setFirstLoad:", 0);

}

- (void)_previouslyBlackholedChatLoadedWithHandleIDs:(id)a3 chat:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v6);
  objc_msgSend(v7, "objectForKey:", CFSTR("participants"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v9, "count"));
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1A21456D0;
  v16[3] = &unk_1E4721E08;
  v11 = v10;
  v17 = v11;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v16);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v8, "hash"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isEqualToSet:", v8) & 1) != 0)
  {
    v18 = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMChatRegistry _chatLoadedWithChatIdentifier:chats:](self, "_chatLoadedWithChatIdentifier:chats:", v12, v13);

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v20 = v8;
        v21 = 2112;
        v22 = v11;
        _os_log_impl(&dword_1A1FF4000, v14, OS_LOG_TYPE_INFO, "We got back up the wrong chat. Expected %@, got %@", buf, 0x16u);
      }

    }
    -[IMChatRegistry chatsBeingLoadedMap](self, "chatsBeingLoadedMap");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeObjectForKey:", v12);

    -[IMChatRegistry setLoading:](self, "setLoading:", 0);
    -[IMChatRegistry setFirstLoad:](self, "setFirstLoad:", 0);
  }

}

- (void)chatLoadedWithChatIdentifier:(id)a3 chats:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  uint8_t v12[16];

  v6 = a3;
  v7 = a4;
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "capabilitiesForListenerID:", 0);
  v10 = (*MEMORY[0x1E0D36CC0] | *MEMORY[0x1E0D36D10] | *MEMORY[0x1E0D36CD0]) & v9;

  if (v10)
  {
    -[IMChatRegistry _chatLoadedWithChatIdentifier:chats:](self, "_chatLoadedWithChatIdentifier:chats:", v6, v7);
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMEventCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "Bailing out of handle chatLoadedWithChatIdentifier due to kFZListenerCapOnDemandChatRegistry cap not being present", v12, 2u);
    }

  }
}

- (void)previouslyBlackholedChatLoadedWithChatIdentifier:(id)a3 chats:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  int v10;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v12;
  uint8_t v13[16];

  v6 = a3;
  v7 = a4;
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "capabilitiesForListenerID:", 0);
  v10 = (*MEMORY[0x1E0D36CC0] | *MEMORY[0x1E0D36D10] | *MEMORY[0x1E0D36CD0]) & v9;

  if (v10)
  {
    -[IMChatRegistry _chatLoadedWithChatIdentifier:chats:](self, "_chatLoadedWithChatIdentifier:chats:", v6, v7);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("__kIMChatPreviouslyBlackholedChatHasBeenLoaded"), 0, 0, 1u);
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMEventCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1A1FF4000, v12, OS_LOG_TYPE_INFO, "Bailing out of handle chatLoadedWithChatIdentifier due to kFZListenerCapOnDemandChatRegistry cap not being present", v13, 2u);
    }

  }
}

- (void)previouslyBlackholedChatLoadedWithHandleIDs:(id)a3 chat:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  uint8_t v12[16];

  v6 = a3;
  v7 = a4;
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "capabilitiesForListenerID:", 0);
  v10 = *MEMORY[0x1E0D36CD0] & v9;

  if (v10)
  {
    -[IMChatRegistry _previouslyBlackholedChatLoadedWithHandleIDs:chat:](self, "_previouslyBlackholedChatLoadedWithHandleIDs:chat:", v6, v7);
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMEventCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "Bailing out of handle chatLoadedWithChatIdentifier due to kFZListenerCapChats cap not being present", v12, 2u);
    }

  }
}

- (void)blackholedChatsExist:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  id v8;
  uint8_t buf[16];

  v3 = a3;
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "capabilitiesForListenerID:", 0);
  v6 = (*MEMORY[0x1E0D36CC0] | *MEMORY[0x1E0D36CD0]) & v5;

  if (v6)
  {
    +[IMChatRegistry sharedRegistry](IMChatRegistry, "sharedRegistry");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_updateBlackholedChatsExist:", v3);

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMEventCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "Bailing out of handle blackholedChatsExist due to kFZListenerCapChats cap not being present", buf, 2u);
    }

  }
}

- (void)screenTimeEnablementChanged:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  NSObject *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  __CFString **v12;
  void *v13;
  int v14;
  int v15;
  int v16;
  const __CFString *v17;
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "capabilitiesForListenerID:", 0);
  if ((*MEMORY[0x1E0D36CD0] & v5) == 0)
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "capabilitiesForListenerID:", 0);
    if ((*MEMORY[0x1E0D36D28] & v7) == 0)
    {
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "capabilitiesForListenerID:", 0);
      v15 = *MEMORY[0x1E0D36CC0] & v14;

      if (!v15)
        return;
      goto LABEL_5;
    }

  }
LABEL_5:
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = CFSTR("Disabled");
      if (v3)
        v9 = CFSTR("Enabled");
      v16 = 138412290;
      v17 = v9;
      _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "ScreenTime is: %@", (uint8_t *)&v16, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = &off_1EE65D460;
  if (!v3)
    v12 = &off_1EE65D468;
  objc_msgSend(v10, "__mainThreadPostNotificationName:object:userInfo:", *v12, 0, 0);

}

- (void)groupPhotoUpdatedForChatIdentifier:(id)a3 style:(unsigned __int8)a4 account:(id)a5 userInfo:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v8 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v17 = 138412546;
      v18 = v10;
      v19 = 2112;
      v20 = v12;
      _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "Received groupPhotoUpdatedForChatIdentifier: %@ userInfo: %@", (uint8_t *)&v17, 0x16u);
    }

  }
  -[IMChatRegistry _existingChatWithIdentifier:style:account:](self, "_existingChatWithIdentifier:style:account:", v10, v8, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v17 = 138412290;
      v18 = v14;
      _os_log_impl(&dword_1A1FF4000, v15, OS_LOG_TYPE_INFO, "Found chat %@", (uint8_t *)&v17, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "postNotificationName:object:userInfo:", CFSTR("__kIMChatGroupPhotoChangedNotification"), v14, v12);

}

- (void)movedMessagesToRecentlyDeletedWithQueryID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Recently Deleted | Completing query: moved messages to recently deleted for query: %@", (uint8_t *)&v7, 0xCu);
    }

  }
  -[IMChatRegistry daemonQueryController](self, "daemonQueryController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "completeQuery:", v4);

}

- (void)movedMessagesToRecentlyDeletedForChatsWithGUIDs:(id)a3 queryID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v7;
      _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "Recently Deleted | Completing query: moved messages from chats to recently deleted for query: %@", buf, 0xCu);
    }

  }
  if (v7)
  {
    -[IMChatRegistry daemonQueryController](self, "daemonQueryController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "completeQuery:", v7);

  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1A21461C0;
  v11[3] = &unk_1E471F340;
  v11[4] = self;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v11);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "__mainThreadPostNotificationName:object:", CFSTR("__kIMChatRegistryDidMoveMessagesInChatsToRecentlyDeletedNotification"), v6);

}

- (void)recoveredMessagesWithQueryID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Recently Deleted | Completing query: recovered messages for query: %@", (uint8_t *)&v7, 0xCu);
    }

  }
  -[IMChatRegistry daemonQueryController](self, "daemonQueryController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "completeQuery:", v4);

}

- (void)permanentlyDeletedMessagesInChatsWithDeletedChatGUIDs:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t v14[128];
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v4;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Recently Deleted | Fully deleted chats with GUIDs: %@", buf, 0xCu);
    }

  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        -[IMChatRegistry _unregisterChatWithGUID:](self, "_unregisterChatWithGUID:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)permanentlyDeletedMessagesInChatsWithDeletedChatGUIDs:(id)a3 queryID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v10 = 138412290;
      v11 = v7;
      _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "Recently Deleted | Completing query: permanently deleted messages in recently deleted from chats for query: %@", (uint8_t *)&v10, 0xCu);
    }

  }
  -[IMChatRegistry permanentlyDeletedMessagesInChatsWithDeletedChatGUIDs:](self, "permanentlyDeletedMessagesInChatsWithDeletedChatGUIDs:", v6);
  -[IMChatRegistry daemonQueryController](self, "daemonQueryController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "completeQuery:", v7);

}

- (void)permanentlyDeletedRecoverableMessagesForChatsWithGUIDs:(id)a3 deletedChatGUIDs:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[5];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        -[IMChatRegistry _unregisterChatWithGUID:](self, "_unregisterChatWithGUID:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1A21466FC;
  v13[3] = &unk_1E471F340;
  v13[4] = self;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v13);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "__mainThreadPostNotificationName:object:", CFSTR("__kIMChatRegistryDidPermanentlyDeleteRecoverableMessagesInChatsNotification"), v6);

}

- (void)recoveredMessagesFromRecentlyDeletedForChatsWithGUIDs:(id)a3
{
  id v3;
  void *v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1A21467E8;
  v5[3] = &unk_1E471F340;
  v5[4] = self;
  v3 = a3;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v5);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "__mainThreadPostNotificationName:object:", CFSTR("__kIMChatRegistryDidRecoverMessagesInChatsNotification"), v3);

}

- (void)chat:(id)a3 lastMessageTimeStampOnLoadUpdated:(double)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v5;
      v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "Recently Deleted | IMChat: %@, updated last message timestamp on load: %@", (uint8_t *)&v10, 0x16u);

    }
  }
  +[IMChatRegistry sharedRegistry](IMChatRegistry, "sharedRegistry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "existingChatWithGUID:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setLastMessageTimeStampOnLoad:", (uint64_t)a4);
}

- (void)serviceSwitchRequestReceivedForChatWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  +[IMChatRegistry sharedRegistry](IMChatRegistry, "sharedRegistry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_cachedChatWithIdentifier:", v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "setServiceSwitchRequested:", 1);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "__mainThreadPostNotificationName:object:userInfo:", CFSTR("__kIMChatServiceSwitchRequestedNotification"), v6, 0);

  }
}

- (void)capabilitiesUpdatedForHandle:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1A1FF4000, v4, OS_LOG_TYPE_INFO, "capabilitiesUpdatedForHandle: Posting notification", v6, 2u);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "__mainThreadPostNotificationName:object:", CFSTR("__kIMChatHandleLazuliCapabilitiesUpdatedNotification"), v3);

}

- (id)messagesURLWithChat:(id)a3 orHandles:(id)a4 withMessageText:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
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
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v51;
  id v52;
  id v53;
  id v54;
  void *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!v7)
  {
    if (!objc_msgSend(v8, "count"))
    {
      v49 = 0;
      goto LABEL_33;
    }
    objc_msgSend(v8, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "account");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "service");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "shortName");
    v12 = objc_claimAutoreleasedReturnValue();

LABEL_7:
    v19 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v7, "account");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "service");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "shortName");
  v12 = objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "chatStyle") != 45)
  {
    objc_msgSend(v7, "groupID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "participants");
    v19 = 0;
    v14 = v8;
    v8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  objc_msgSend(v7, "recipient");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
    goto LABEL_7;
  v15 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(v13, "ID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringByAddingPercentEncodingWithAllowedCharacters:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "arrayWithObject:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  v22 = 0;
LABEL_10:

  v55 = v22;
  if (objc_msgSend(v19, "count") || !objc_msgSend(v8, "count"))
  {
    v23 = v19;
  }
  else
  {
    v51 = v12;
    v52 = v9;
    v54 = v7;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v53 = v8;
    v24 = v8;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v57;
      do
      {
        v28 = 0;
        do
        {
          if (*(_QWORD *)v57 != v27)
            objc_enumerationMutation(v24);
          objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * v28), "ID");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "stringByAddingPercentEncodingWithAllowedCharacters:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v23, "addObject:", v31);
          ++v28;
        }
        while (v26 != v28);
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
      }
      while (v26);
    }

    v8 = v53;
    v7 = v54;
    v12 = v51;
    v9 = v52;
    v22 = v55;
  }
  v32 = (void *)v12;
  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("sms://open?service=%@"), v12);
  v34 = v9;
  if (v22)
  {
    v35 = (void *)MEMORY[0x1E0CB3500];
    v36 = v22;
    objc_msgSend(v35, "URLPathAllowedCharacterSet");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "stringByAddingPercentEncodingWithAllowedCharacters:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v34;
    objc_msgSend(v33, "appendFormat:", CFSTR("&groupid=%@"), v38);

  }
  objc_msgSend(v7, "displayName");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v39, "length"))
  {
    v40 = (void *)MEMORY[0x1E0CB3500];
    v41 = v39;
    objc_msgSend(v40, "URLPathAllowedCharacterSet");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "stringByAddingPercentEncodingWithAllowedCharacters:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v34;
    objc_msgSend(v33, "appendFormat:", CFSTR("&displayname=%@"), v43);

  }
  if (objc_msgSend(v9, "length"))
  {
    v44 = (void *)MEMORY[0x1E0CB3500];
    v45 = v9;
    objc_msgSend(v44, "URLPathAllowedCharacterSet");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "stringByAddingPercentEncodingWithAllowedCharacters:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v34;
    objc_msgSend(v33, "appendFormat:", CFSTR("&body=%@"), v47);

  }
  if ((unint64_t)objc_msgSend(v23, "count") >= 2)
  {
    objc_msgSend(v23, "componentsJoinedByString:", CFSTR(","));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "appendFormat:", CFSTR("&recipients=%@"), v48);
LABEL_31:

    goto LABEL_32;
  }
  if (objc_msgSend(v23, "count") == 1)
  {
    objc_msgSend(v23, "firstObject");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "appendFormat:", CFSTR("&recipient=%@"), v48);
    goto LABEL_31;
  }
LABEL_32:
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v33);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_33:
  return v49;
}

- (id)messagesURLWithChat:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (objc_class *)MEMORY[0x1E0CB37A0];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithString:", CFSTR("sms://open?"));
  objc_msgSend(v4, "chatIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAddingPercentEncodingWithAllowedCharacters:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appendFormat:", CFSTR("groupid=%@"), v8);
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)messagesURLWithMessageGUID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("sms://open?"));
  v5 = (void *)MEMORY[0x1E0CB3500];
  v6 = v3;
  objc_msgSend(v5, "URLPathAllowedCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAddingPercentEncodingWithAllowedCharacters:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "appendFormat:", CFSTR("message-guid=%@"), v8);
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)chatForURL:(id)a3 outMessageText:(id *)a4 outRecipientIDs:(id *)a5 outService:(id *)a6 outMessageGUID:(id *)a7
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_chatForURL_outMessageText_outRecipientIDs_outService_outMessageGUID_presentOverlay_);
}

- (id)chatForURL:(id)a3 outMessageText:(id *)a4 outRecipientIDs:(id *)a5 outService:(id *)a6 outMessageGUID:(id *)a7 presentOverlay:(BOOL *)a8
{
  return -[IMChatRegistry chatForURL:outMessageText:outRecipientIDs:outService:outMessageGUID:presentOverlay:outSIMID:](self, "chatForURL:outMessageText:outRecipientIDs:outService:outMessageGUID:presentOverlay:outSIMID:", a3, a4, a5, a6, a7, a8, 0);
}

- (id)chatForURL:(id)a3 outMessageText:(id *)a4 outRecipientIDs:(id *)a5 outService:(id *)a6 outMessageGUID:(id *)a7 presentOverlay:(BOOL *)a8 outSIMID:(id *)a9
{
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  __CFString *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  uint64_t v29;
  void *v30;
  BOOL v31;
  void *v32;
  id v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  id v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  uint64_t v45;
  int v46;
  NSObject *v47;
  int v48;
  NSObject *v49;
  NSObject *v50;
  void *v51;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  int v59;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  id v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint8_t v73[128];
  uint8_t buf[4];
  id v75;
  __int16 v76;
  void *v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v68 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (a7)
    *a7 = 0;
  if (a5)
    *a5 = 0;
  if (a6)
    *a6 = 0;
  if (a7)
    *a7 = 0;
  if (a8)
    *a8 = 0;
  if (a9)
    *a9 = 0;
  objc_msgSend(v68, "resourceSpecifier");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "rangeOfString:", CFSTR("open?groupid")) == 0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(v14, "rangeOfString:", CFSTR("open?address")) == 0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(v14, "rangeOfString:", CFSTR("open?addresses")) == 0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(v14, "rangeOfString:", CFSTR("open?message-guid")) == 0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(v14, "rangeOfString:", CFSTR("open?recipients")) == 0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(v14, "rangeOfString:", CFSTR("open?recipient")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = objc_msgSend(v14, "rangeOfString:", CFSTR("open?service"));

    if (v15 != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_26;
    if (objc_msgSend(v14, "hasPrefix:", CFSTR("//")))
    {
      objc_msgSend(v14, "substringFromIndex:", 2);
      v16 = objc_claimAutoreleasedReturnValue();

      v14 = (id)v16;
    }
    v17 = v14;
    v18 = objc_msgSend(v17, "rangeOfString:", CFSTR("?"));
    v19 = 0x1E0CB3000;
    if (v18 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v20 = &stru_1E4725068;
      v14 = v17;
    }
    else
    {
      v53 = v18;
      objc_msgSend(v17, "substringToIndex:", v18);
      v14 = (id)objc_claimAutoreleasedReturnValue();

      v54 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v17, "substringFromIndex:", v53 + 1);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "stringWithFormat:", CFSTR("&%@"), v55);
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v19 = 0x1E0CB3000uLL;
    }
    v56 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(*(id *)(v19 + 2368), "stringWithFormat:", CFSTR("sms:/open?address=%@%@"), v14, v20);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "URLWithString:", v57);
    v58 = objc_claimAutoreleasedReturnValue();

    v68 = (id)v58;
  }
  else
  {
    v17 = v14;
  }

  v14 = v17;
LABEL_26:
  objc_msgSend(v68, "absoluteString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (id)ExtractURLQueries();

  objc_msgSend(v13, "objectForKey:", CFSTR("body"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", CFSTR("bot-name"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", CFSTR("service-id"));
  v24 = objc_claimAutoreleasedReturnValue();
  v64 = (void *)v24;
  if (__PAIR128__((unint64_t)v65, v24) != 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1FF4000, v25, OS_LOG_TYPE_INFO, "> Incoming messagesURL is detected as a chatbot based on its query parameters.", buf, 2u);
      }

    }
    objc_msgSend(v23, "stringByReplacingOccurrencesOfString:withString:", CFSTR("+"), CFSTR("%20"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "stringByRemovingPercentEncoding");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (a4 && v23)
    *a4 = objc_retainAutorelease(v23);
  objc_msgSend(v13, "objectForKey:", CFSTR("groupid"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", CFSTR("chatguid"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", CFSTR("recipient"));
  v67 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("best-match"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v27, "BOOLValue");

  objc_msgSend(v13, "objectForKey:", CFSTR("simid"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  if (v66)
    v28 = a9 != 0;
  else
    v28 = 0;
  if (v28)
    *a9 = (id)objc_msgSend(v66, "copy");
  if (!v67)
  {
    objc_msgSend(v13, "objectForKey:", CFSTR("address"));
    v67 = objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v13, "objectForKey:", CFSTR("recipients"));
  v29 = objc_claimAutoreleasedReturnValue();
  if (!v29)
  {
    objc_msgSend(v13, "objectForKey:", CFSTR("addresses"));
    v29 = objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v13, "objectForKey:", CFSTR("overlay"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30 != 0;

  if (a8 != 0 && v31)
    *a8 = 1;
  objc_msgSend(v13, "objectForKey:", CFSTR("message-guid"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v32, "length"))
  {
    v33 = 0;
    if (a7)
      *a7 = objc_retainAutorelease(v32);
    goto LABEL_114;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v75 = v68;
      _os_log_impl(&dword_1A1FF4000, v34, OS_LOG_TYPE_INFO, "finding chat for URL: %@", buf, 0xCu);
    }

  }
  if (v63)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v75 = v63;
        _os_log_impl(&dword_1A1FF4000, v35, OS_LOG_TYPE_INFO, "didn't find chat, lets look for it as chatGUID: %@", buf, 0xCu);
      }

    }
    -[IMChatRegistry existingChatWithGUID:](self, "existingChatWithGUID:", v63);
    v33 = (id)objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      if (!IMOSLoggingEnabled())
        goto LABEL_114;
      OSLogHandleForIMFoundationCategory();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v75 = v33;
        v76 = 2112;
        v77 = v63;
        _os_log_impl(&dword_1A1FF4000, v36, OS_LOG_TYPE_INFO, "    => found chat: %@ for chatGUID: %@", buf, 0x16u);
      }
LABEL_62:

      goto LABEL_114;
    }
  }
  if (v62)
  {
    -[IMChatRegistry existingChatWithGroupID:](self, "existingChatWithGroupID:", v62);
    v33 = (id)objc_claimAutoreleasedReturnValue();
    if (v33)
      goto LABEL_71;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1FF4000, v37, OS_LOG_TYPE_INFO, "didn't find chat, lets look for it as a chat identifier", buf, 2u);
      }

    }
    -[IMChatRegistry existingChatWithChatIdentifier:](self, "existingChatWithChatIdentifier:", v62);
    v33 = (id)objc_claimAutoreleasedReturnValue();
    if (v33)
    {
LABEL_71:
      if (!IMOSLoggingEnabled())
        goto LABEL_114;
      OSLogHandleForIMFoundationCategory();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v75 = v33;
        _os_log_impl(&dword_1A1FF4000, v36, OS_LOG_TYPE_INFO, "    => found chat: %@", buf, 0xCu);
      }
      goto LABEL_62;
    }
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v38, OS_LOG_TYPE_INFO, "didn't find it, going through participant logic and others", buf, 2u);
    }

  }
  if (v67)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:");
    v39 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (v29)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    objc_msgSend((id)v29, "componentsSeparatedByString:", CFSTR(","));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v69, v73, 16);
    if (v42)
    {
      v43 = *(_QWORD *)v70;
      do
      {
        for (i = 0; i != v42; ++i)
        {
          if (*(_QWORD *)v70 != v43)
            objc_enumerationMutation(v41);
          objc_msgSend(v40, "addObject:", *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * i));
        }
        v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v69, v73, 16);
      }
      while (v42);
    }

    v39 = v40;
  }
  else
  {
    v39 = 0;
  }
  v45 = objc_msgSend(v39, "count");
  v46 = v59;
  if (!v45)
    v46 = 0;
  if (v46 == 1)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v75 = v39;
        _os_log_impl(&dword_1A1FF4000, v47, OS_LOG_TYPE_INFO, "URL expects best contacts match for handle IDs %@", buf, 0xCu);
      }

    }
    -[IMChatRegistry _bestChatForHandleIDs:](self, "_bestChatForHandleIDs:", v39);
    v33 = (id)objc_claimAutoreleasedReturnValue();
    v48 = IMOSLoggingEnabled();
    if (v33)
    {
      if (v48)
      {
        OSLogHandleForIMFoundationCategory();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v75 = v33;
          _os_log_impl(&dword_1A1FF4000, v49, OS_LOG_TYPE_INFO, "    => Found chat based on recipientIDs: %@", buf, 0xCu);
        }

      }
      goto LABEL_114;
    }
    if (v48)
    {
      OSLogHandleForIMFoundationCategory();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v75 = v39;
        _os_log_impl(&dword_1A1FF4000, v50, OS_LOG_TYPE_INFO, "    => didn't find existing chat with contacts from handle IDs %@", buf, 0xCu);
      }

    }
  }
  objc_msgSend(v13, "objectForKey:", CFSTR("displayname"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5)
    *a5 = objc_retainAutorelease(v39);
  if (v67 | v29)
  {
    IMFindExistingChatForAddresses(v39, v51, (unint64_t)objc_msgSend(v39, "count") > 1, 1);
    v33 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v33 = 0;
  }

LABEL_114:
  return v33;
}

- (id)_bestChatForHandleIDs:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0D397A8], "sharedInstance");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "fetchCNContactForHandleWithID:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = IMOSLoggingEnabled();
        if (!v11)
        {
          if (v12)
          {
            OSLogHandleForIMFoundationCategory();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v24 = v9;
              _os_log_impl(&dword_1A1FF4000, v16, OS_LOG_TYPE_INFO, "    => could not find contact for handle %@, not searching for chat by contacts", buf, 0xCu);
            }

          }
          v14 = 0;
          goto LABEL_22;
        }
        if (v12)
        {
          OSLogHandleForIMFoundationCategory();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v24 = v11;
            v25 = 2112;
            v26 = v9;
            _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "    => adding contact %@ for handle %@", buf, 0x16u);
          }

        }
        objc_msgSend(v4, "addObject:", v11);

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      if (v6)
        continue;
      break;
    }
  }

  -[IMChatRegistry existingChatWithContacts:bestHandles:](self, "existingChatWithContacts:bestHandles:", v4, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v14;
      _os_log_impl(&dword_1A1FF4000, v15, OS_LOG_TYPE_INFO, "    => found best chat with contacts: %@", buf, 0xCu);
    }

  }
LABEL_22:

  return v14;
}

- (id)_inPersonHandleFromIMHandle:(id)a3 contact:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(a3, "normalizedID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (MEMORY[0x1A858280C]())
  {
    if (v5)
    {
      v7 = (void *)objc_msgSend(objc_alloc((Class)MEMORY[0x1A858292C](CFSTR("CNPhoneNumber"), CFSTR("Contacts"))), "initWithStringValue:", v6);
      if (!v7)
      {
        v16 = 0;
        v22 = 2;
LABEL_41:

        goto LABEL_42;
      }
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      objc_msgSend(v5, "phoneNumbers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      if (v9)
      {
        v10 = v9;
        v25 = v6;
        v26 = v5;
        v11 = *(_QWORD *)v32;
        while (2)
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v32 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v12);
            objc_msgSend(v13, "value", v25, v26);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "isLikePhoneNumber:", v7);

            if (v15)
            {
              if (qword_1EE65EB18 != -1)
                dispatch_once(&qword_1EE65EB18, &unk_1E471C1D0);
              if (off_1EE65EB10)
              {
                ((void (*)(void *))off_1EE65EB10)(v13);
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = 2;
                goto LABEL_37;
              }
            }
            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
          if (v10)
            continue;
          break;
        }
        v16 = 0;
        v6 = v25;
        v5 = v26;
      }
      else
      {
        v16 = 0;
      }
      v22 = 2;
LABEL_40:

      goto LABEL_41;
    }
    v16 = 0;
    v22 = 2;
  }
  else if (IMStringIsEmail())
  {
    if (v5)
    {
      IMNormalizeFormattedString();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      objc_msgSend(v5, "emailAddresses");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      if (v16)
      {
        v25 = v6;
        v26 = v5;
        v17 = *(_QWORD *)v28;
        while (2)
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v28 != v17)
              objc_enumerationMutation(v8);
            v19 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v18);
            objc_msgSend(v19, "value", v25, v26);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            IMNormalizeFormattedString();
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v21, "isEqual:", v7))
            {
              if (qword_1EE65F9B0[0] != -1)
                dispatch_once(qword_1EE65F9B0, &unk_1E4723D20);
              if (off_1EE65F9A8)
              {
                ((void (*)(void *))off_1EE65F9A8)(v19);
                v16 = (void *)objc_claimAutoreleasedReturnValue();

                v22 = 1;
LABEL_37:
                v6 = v25;
                v5 = v26;
                goto LABEL_40;
              }
            }

            v18 = (char *)v18 + 1;
          }
          while (v16 != v18);
          v16 = (void *)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          if (v16)
            continue;
          break;
        }
        v6 = v25;
        v5 = v26;
      }
      v22 = 1;
      goto LABEL_40;
    }
    v16 = 0;
    v22 = 1;
  }
  else
  {
    v22 = 0;
    v16 = 0;
  }
LABEL_42:
  v23 = (void *)objc_msgSend(objc_alloc((Class)qword_1EE65F2C0), "initWithValue:type:label:", v6, v22, v16);

  return v23;
}

- (id)_inPersonNameForContact:(id)a3 imHandle:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  dispatch_semaphore_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  dispatch_time_t v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  intptr_t (*v24)(uint64_t, void *);
  void *v25;
  NSObject *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "normalizedID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isBusiness"))
  {
    if (v5)
    {
      objc_msgSend(v5, "nickname");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v20, "length"))
      {
        v19 = v20;
        goto LABEL_14;
      }
      objc_msgSend((id)MEMORY[0x1A858292C](CFSTR("CNContactFormatter"), CFSTR("Contacts")), "stringFromContact:style:", v5, 0);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "length"))
      {

        goto LABEL_14;
      }

    }
    objc_msgSend(v6, "displayID");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  v8 = (void *)MEMORY[0x1E0D396F8];
  objc_msgSend(v6, "ID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "placeholderNameForBrandURI:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = dispatch_semaphore_create(0);
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = sub_1A200AF34;
  v32 = sub_1A200AD0C;
  v33 = 0;
  +[IMHandleRegistrar sharedInstance](IMHandleRegistrar, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = sub_1A216ABD4;
  v25 = &unk_1E4723278;
  v27 = &v28;
  v13 = v11;
  v26 = v13;
  objc_msgSend(v12, "businessNameForUID:updateHandler:", v7, &v22);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "length", v22, v23, v24, v25);
  v16 = v14;
  if (v15)
    goto LABEL_5;
  v17 = dispatch_time(0, 3000000000);
  dispatch_semaphore_wait(v13, v17);
  if (objc_msgSend((id)v29[5], "length"))
  {
    v16 = (void *)v29[5];
LABEL_5:
    v18 = v16;

    v10 = v18;
  }
  v19 = v10;

  _Block_object_dispose(&v28, 8);
LABEL_14:

  return v19;
}

- (id)_inPersonFromIMHandle:(id)a3 isMe:(BOOL)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = *(id *)MEMORY[0x1A8582938]("CNContactPhoneNumbersKey", CFSTR("Contacts"));
  v8 = *(id *)MEMORY[0x1A8582938]("CNContactEmailAddressesKey", CFSTR("Contacts"));
  v9 = v8;
  if (v7)
    v10 = v8 == 0;
  else
    v10 = 1;
  if (v10)
  {
    v12 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v26[0] = v8;
    v26[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C9AA60], "arrayByAddingObjectsFromArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v13 = (void *)MEMORY[0x1A858292C](CFSTR("CNContactFormatter"), CFSTR("Contacts"));
  if (v13)
  {
    objc_msgSend(v13, "descriptorForRequiredKeysForStyle:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "arrayByAddingObject:", v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v15;
  }
  objc_msgSend(MEMORY[0x1E0CB3850], "descriptorForUsedKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "arrayByAddingObject:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "cnContactWithKeys:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMChatRegistry _inPersonHandleFromIMHandle:contact:](self, "_inPersonHandleFromIMHandle:contact:", v6, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMChatRegistry _inPersonNameForContact:imHandle:](self, "_inPersonNameForContact:imHandle:", v18, v6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3850], "componentsForContact:", v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "identifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v25) = a4;
  v23 = (void *)objc_msgSend(objc_alloc((Class)qword_1EE65F2B8), "initWithPersonHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:isMe:", v19, v21, v20, 0, v22, 0, v25);

  return v23;
}

- (id)_interactionForMessage:(id)a3 inChat:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v6 = a3;
  v7 = a4;
  if (qword_1EE65F2F0 != -1)
    dispatch_once(&qword_1EE65F2F0, &unk_1E471DC78);
  objc_msgSend(v6, "retractedPartIndexes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (!v9)
  {
    if (objc_msgSend(v6, "isFinished") && (objc_msgSend(v6, "isTypingMessage") & 1) == 0)
    {
      objc_msgSend(v6, "plainBody");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "length") || (objc_msgSend(v6, "hasInlineAttachments") & 1) != 0)
      {
        v13 = objc_msgSend(v6, "associatedMessageType");

        if (!v13)
        {
          -[IMChatRegistry _sendMessageInteractionForMessage:inChat:](self, "_sendMessageInteractionForMessage:inChat:", v6, v7);
          v10 = objc_claimAutoreleasedReturnValue();
          goto LABEL_5;
        }
      }
      else
      {

      }
    }
    v11 = 0;
    goto LABEL_14;
  }
  -[IMChatRegistry _unsendMessageInteractionForMessage:inChat:](self, "_unsendMessageInteractionForMessage:inChat:", v6, v7);
  v10 = objc_claimAutoreleasedReturnValue();
LABEL_5:
  v11 = (void *)v10;
LABEL_14:

  return v11;
}

- (id)_sendMessageInteractionForMessage:(id)a3 inChat:(id)a4
{
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  void *v60;
  uint8_t v61[128];
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v54 = a3;
  v55 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v54, "guid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "guid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v63 = v7;
      v64 = 2112;
      v65 = v8;
      _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "Donating send message interaction for message %@ in chat %@", buf, 0x16u);

    }
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "participantsWithState:", 16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v57 != v12)
          objc_enumerationMutation(v10);
        -[IMChatRegistry _inPersonFromIMHandle:isMe:](self, "_inPersonFromIMHandle:isMe:", *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i), 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v14);

      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
    }
    while (v11);
  }
  objc_msgSend(v55, "account");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "service");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v48, "name");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "sender");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMChatRegistry _inPersonFromIMHandle:isMe:](self, "_inPersonFromIMHandle:isMe:", v16, 1);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v55, "isGroupChat")
    || (objc_msgSend(v55, "displayName"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v18 = objc_msgSend(v17, "length") == 0,
        v17,
        v18))
  {
    v50 = 0;
  }
  else
  {
    v19 = objc_alloc((Class)qword_1EE65F2D8);
    objc_msgSend(v55, "guid");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "displayName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = (void *)objc_msgSend(v19, "initWithVocabularyIdentifier:spokenPhrase:pronunciationHint:", v20, v21, 0);

  }
  v22 = objc_alloc((Class)qword_1EE65F2C8);
  objc_msgSend(v54, "plainBody");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "guid");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = (void *)objc_msgSend(v22, "initWithRecipients:content:speakableGroupName:conversationIdentifier:serviceName:sender:", v9, v23, v50, v24, v52, v51);

  objc_msgSend(v53, "_setLaunchId:", CFSTR("com.apple.MobileSMS"));
  objc_msgSend(v55, "allChatProperties");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKey:", *MEMORY[0x1E0D37788]);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  +[IMFileTransferCenter sharedInstance](IMFileTransferCenter, "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "transferForGUID:", v47);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "filename");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "im_lastPathComponent");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v55, "guid");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  IMSharedHelperExternalLocationForFile();
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v49, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v49);
    v30 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v30 = 0;
  }
  v45 = (void *)v30;
  objc_msgSend((id)qword_1EE65F2A0, "imageWithURL:");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
    objc_msgSend(v53, "setImage:forParameterNamed:", v31, CFSTR("speakableGroupName"));
  v32 = (void *)objc_msgSend(objc_alloc((Class)qword_1EE65F2D0), "initWithCode:userActivity:", 3, 0);
  objc_msgSend(v54, "guid");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "time");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "guid");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_alloc((Class)qword_1EE65F2B0);
  objc_msgSend(v54, "plainBody");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_msgSend(v36, "initWithIdentifier:conversationIdentifier:content:dateSent:sender:recipients:groupName:messageType:serviceName:", v33, v35, v37, v34, v51, v9, v50, 1, v52);

  v60 = v38;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v60, 1);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setSentMessages:", v39);

  v40 = (void *)objc_msgSend(objc_alloc((Class)qword_1EE65F2A8), "initWithIntent:response:", v53, v32);
  if (IMIsRunningInMessagesComposeViewService())
  {
    v41 = (void *)objc_opt_new();
    objc_msgSend(v40, "_setContextExtensionUUID:", v41);

  }
  objc_msgSend(v40, "setIdentifier:", v33);
  objc_msgSend(v40, "setGroupIdentifier:", v35);
  if (objc_msgSend(v54, "isFromMe"))
    v42 = 1;
  else
    v42 = 2;
  objc_msgSend(v40, "setDirection:", v42);
  if (v34)
  {
    v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:duration:", v34, 0.0);
    objc_msgSend(v40, "setDateInterval:", v43);

  }
  if (objc_msgSend(v54, "isFinished"))
    +[IMRemindersIntegration notifyInteractionWithPeople:](IMRemindersIntegration, "notifyInteractionWithPeople:", v9);
  objc_msgSend(v40, "setIntentHandlingStatus:", 3);

  return v40;
}

- (id)_unsendMessageInteractionForMessage:(id)a3 inChat:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v5, "guid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "guid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v20 = v8;
      v21 = 2112;
      v22 = v9;
      _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "Donating unsend message interaction for message %@ in chat %@", buf, 0x16u);

    }
  }
  objc_msgSend(v5, "guid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "length"))
  {
    v18 = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0C9AA60];
  }
  v12 = (void *)objc_msgSend(objc_alloc((Class)qword_1EE65EAE8), "initWithMessageIdentifiers:", v11);
  objc_msgSend(v12, "_setLaunchId:", CFSTR("com.apple.MobileSMS"));
  v13 = (void *)objc_msgSend(objc_alloc((Class)qword_1EE65EAF0), "initWithCode:userActivity:", 3, 0);
  v14 = (void *)objc_msgSend(objc_alloc((Class)qword_1EE65F2A8), "initWithIntent:response:", v12, v13);
  objc_msgSend(v5, "dateEdited");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:duration:", v15, 0.0);
    objc_msgSend(v14, "setDateInterval:", v16);

  }
  objc_msgSend(v14, "setIntentHandlingStatus:", 3);

  return v14;
}

@end
