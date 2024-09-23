@implementation IMDCoreSpotlightRecipientIndexer

+ (id)suggestedContactNameCustomKey
{
  if (qword_1EEC403F8 != -1)
    dispatch_once(&qword_1EEC403F8, &unk_1E5AB74B8);
  return (id)qword_1EEC403F0;
}

+ (id)suggestedContactPhotoCustomKey
{
  if (qword_1EEC40408 != -1)
    dispatch_once(&qword_1EEC40408, &unk_1E5AB74D8);
  return (id)qword_1EEC40400;
}

+ (id)groupPhotoPathCustomKey
{
  if (qword_1ED0D3950 != -1)
    dispatch_once(&qword_1ED0D3950, &unk_1E5AB74F8);
  return (id)qword_1ED0D3948;
}

+ (void)indexItem:(id)a3 withChat:(id)a4 isReindexing:(BOOL)a5 metadataToUpdate:(id)a6 timingProfiler:(id)a7
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  const __CFString *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  __CFString *v26;
  void *v27;
  IMDCoreSpotlightChatParticipant *v28;
  void *v29;
  char v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  unsigned __int8 v38;
  void *v39;
  char v40;
  void *v41;
  uint64_t v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  char v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  NSObject *v60;
  void *v61;
  void *v62;
  _BOOL4 v63;
  void *v64;
  NSObject *v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  NSObject *v75;
  id v76;
  void *v77;
  void *v78;
  NSObject *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  NSObject *v86;
  void *v87;
  void *v88;
  NSObject *v89;
  void *v90;
  NSObject *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  NSObject *v97;
  id v98;
  NSObject *v99;
  id v100;
  NSObject *v101;
  id v102;
  NSObject *v103;
  id v104;
  void *v105;
  char v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  id v113;
  id v114;
  void *v115;
  id v116;
  void *v117;
  id v118;
  _BOOL4 v119;
  void *v120;
  void *v121;
  id obj;
  id v123;
  uint64_t v124;
  void *v125;
  _BOOL4 v126;
  void *v127;
  void *v129;
  void *v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  void *v139;
  void *v140;
  void *v141;
  id v142;
  void *v143;
  _BYTE v144[128];
  uint8_t v145[128];
  uint8_t buf[4];
  uint64_t v147;
  __int16 v148;
  void *v149;
  __int16 v150;
  void *v151;
  __int16 v152;
  void *v153;
  __int16 v154;
  const __CFString *v155;
  __int16 v156;
  id v157;
  __int16 v158;
  void *v159;
  uint64_t v160;

  v126 = a5;
  v160 = *MEMORY[0x1E0C80C00];
  v114 = a3;
  v10 = a4;
  v113 = a6;
  v11 = a7;
  objc_msgSend(v11, "startTimingForKey:", CFSTR("IMDCoreRecentsApiInitProfilingKey"));
  _IMDCoreRecentsApiInit();
  v130 = v11;
  objc_msgSend(v11, "stopTimingForKey:", CFSTR("IMDCoreRecentsApiInitProfilingKey"));
  v119 = __PAIR128__(IMDCoreSpotlightRecipientIndexer_TestHandleID, IMDCoreSpotlightRecipientIndexer_TestContact) == 0;
  v112 = v10;
  objc_msgSend(v10, "objectForKey:", CFSTR("participants"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v123 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v116 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v114, "objectForKey:", CFSTR("time"));
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "objectForKey:", CFSTR("service"));
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "objectForKey:", CFSTR("lalh"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_stripFZIDPrefix");
  v111 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v114, "objectForKey:", CFSTR("flags"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v11) = objc_msgSend(v14, "unsignedLongLongValue");

  v106 = (char)v11;
  if ((v11 & 4) != 0)
  {
    v17 = v111;
  }
  else
  {
    objc_msgSend(v114, "objectForKey:", CFSTR("handle"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_stripFZIDPrefix");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "im_stripCategoryLabel");
    v17 = (id)objc_claimAutoreleasedReturnValue();

  }
  v121 = v17;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), v129, v17);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0D397C8], "verboseLoggingEnabled") && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = objc_msgSend(v12, "count");
      v20 = CFSTR("YES");
      *(_DWORD *)buf = 134219522;
      v147 = v19;
      v148 = 2112;
      if ((v106 & 4) == 0)
        v20 = CFSTR("NO");
      v149 = v117;
      v150 = 2112;
      v151 = v129;
      v152 = 2112;
      v153 = v111;
      v154 = 2112;
      v155 = v20;
      v156 = 2112;
      v157 = v17;
      v158 = 2112;
      v159 = v105;
      _os_log_impl(&dword_1ABB60000, v18, OS_LOG_TYPE_INFO, "Got %lu participants, date %@ service %@ lastAddressedLocalHandle %@ isFromMe %@ senderID %@ sendingAddress %@", buf, 0x48u);
    }

  }
  v118 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v137 = 0u;
  v138 = 0u;
  v135 = 0u;
  v136 = 0u;
  obj = v12;
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v135, v145, 16);
  if (v21)
  {
    v22 = 0;
    v124 = *(_QWORD *)v136;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v136 != v124)
          objc_enumerationMutation(obj);
        v24 = *(_QWORD *)(*((_QWORD *)&v135 + 1) + 8 * i);
        objc_msgSend(a1, "_contactForURI:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v130, "startTimingForKey:iteration:", CFSTR("IMDCoreSpotlightFullNameForContactProfilingKey"), v22 + i);
        _IMDCoreSpotlightFullNameForContact(v25, 0);
        v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v130, "stopTimingForKey:iteration:", CFSTR("IMDCoreSpotlightFullNameForContactProfilingKey"), v22 + i);
        objc_msgSend(v130, "startTimingForKey:iteration:", CFSTR("IMDCoreSpotlightContactsHandleIDForHandler"), v22 + i);
        objc_msgSend(a1, "_handleIDForHandleID:", v24);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v130, "stopTimingForKey:iteration:", CFSTR("IMDCoreSpotlightContactsHandleIDForHandler"), v22 + i);
        if (v27 && !v126)
        {
          v28 = -[IMDCoreSpotlightChatParticipant initWithHandleID:contact:isSender:]([IMDCoreSpotlightChatParticipant alloc], "initWithHandleID:contact:isSender:", v27, v25, objc_msgSend(v121, "isEqualToString:", v27));
          objc_msgSend(v118, "addObject:", v28);

        }
        _IMDCoreRecentsKindForHandleID(v27, v129);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v26)
        {
          objc_msgSend(v27, "im_stripCategoryLabel");
          v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        if (!v126)
        {
          v30 = !v119;
          if (!v27)
            v30 = 1;
          if ((v30 & 1) == 0 && v29)
          {
            objc_msgSend(v130, "startTimingForKey:iteration:", CFSTR("IMDCoreSpotlightCoreRecentsRecentEventForAddress"), v22 + i);
            if (v26)
              v31 = v26;
            else
              v31 = &stru_1E5AC1D70;
            objc_msgSend(MEMORY[0x1E0D18290], "recentEventForAddress:displayName:kind:date:weight:metadata:options:", v27, v31, v29, v117, 0, 0, 1);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v116, "addObject:", v32);
            objc_msgSend(v130, "stopTimingForKey:iteration:", CFSTR("IMDCoreSpotlightCoreRecentsRecentEventForAddress"), v22 + i);

          }
        }
        objc_msgSend(v130, "startTimingForKey:iteration:", CFSTR("IMDCoreSpotlightCreateCoreSpotlightPerson"), v22 + i);
        _IMDCoreSpotlightPerson(v26, v27, v25, v129);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v130, "stopTimingForKey:iteration:", CFSTR("IMDCoreSpotlightCreateCoreSpotlightPerson"), v22 + i);
        if (objc_msgSend(MEMORY[0x1E0D397C8], "verboseLoggingEnabled")
          && IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v147 = (uint64_t)v33;
            _os_log_impl(&dword_1ABB60000, v34, OS_LOG_TYPE_INFO, "Adding name %@", buf, 0xCu);
          }

        }
        if (v33)
          objc_msgSend(v123, "addObject:", v33);

      }
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v135, v145, 16);
      v22 += i;
    }
    while (v21);
  }

  _IMDCoreSpotlightChatUIDForChatDictionary(v112);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
  {
    objc_msgSend(a1, "chatUniqueIdentifierKey");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "setValue:forCustomKey:", v35, v36);

  }
  objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("groupPhotoGUID"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("groupPhotoPath"));
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "objectForKey:", CFSTR("groupName"));
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v125, "length"))
    objc_msgSend(v113, "setDisplayName:", v125);
  objc_msgSend(v114, "objectForKey:", CFSTR("plainBody"));
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "objectForKey:", CFSTR("attributedBody"));
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "objectForKey:", CFSTR("destinationCallerID"));
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = _IMDCoreSpotlightMessageMentionsMe(v110, v109);
  objc_msgSend(v114, "objectForKey:", CFSTR("threadOriginator"));
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "objectForKey:", CFSTR("flags"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "unsignedLongLongValue");

  objc_msgSend(v114, "objectForKey:", CFSTR("flags"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "unsignedLongLongValue");

  if (v117)
  {
    if (objc_msgSend(v107, "length"))
    {
      if (v126)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1ABB60000, v43, OS_LOG_TYPE_INFO, "Not donating INInteraction during re-indexing", buf, 2u);
          }
LABEL_64:

        }
      }
      else if ((v106 & 4) != 0)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1ABB60000, v43, OS_LOG_TYPE_INFO, "Not donating INInteraction for message from me", buf, 2u);
          }
          goto LABEL_64;
        }
      }
      else
      {
        objc_msgSend(v112, "objectForKey:", CFSTR("guid"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v112, "objectForKey:", CFSTR("chatIdentifier"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v114, "objectForKey:", CFSTR("guid"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v112, "objectForKey:", CFSTR("style"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(v47, "intValue");

        objc_msgSend(v114, "objectForKey:", CFSTR("uncanonicalizedHandle"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        _IMDCoreSpotlightNewINInteractionForIncomingMessage(v46, v107, v117, v129, v121, v49, v44, v45, v125, v48, v118, v111, v37, v115, v38, (v40 & 4) != 0, (v42 & 0x800000000) != 0, 0);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = v50;
        if (v50)
        {
          objc_msgSend(v50, "donateInteractionWithCompletion:", &unk_1E5AB7538);
        }
        else
        {
          IMLogHandleForCategory();
          v52 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
            sub_1ABC5B9D4(v52, v53, v54, v55, v56, v57, v58, v59);

        }
      }
    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1ABB60000, v43, OS_LOG_TYPE_INFO, "Not donating INInteraction for non-text message.", buf, 2u);
      }
      goto LABEL_64;
    }
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1ABB60000, v43, OS_LOG_TYPE_INFO, "Not donating INInteraction for message without a date, to prevent message send from appearing to have taken place now.", buf, 2u);
    }
    goto LABEL_64;
  }
  if (objc_msgSend(MEMORY[0x1E0D397C8], "verboseLoggingEnabled") && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v60 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v147 = (uint64_t)v123;
      _os_log_impl(&dword_1ABB60000, v60, OS_LOG_TYPE_INFO, "generated CSPersons %@", buf, 0xCu);
    }

  }
  if (!v126 && v119 && objc_msgSend(v116, "count") && objc_msgSend(obj, "count") == 1)
  {
    +[IMDCoreSpotlightDispatchObject sharedInstance](IMDCoreSpotlightDispatchObject, "sharedInstance");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "recentsInstance");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "recordContactEvents:recentsDomain:sendingAddress:source:userInitiated:", v116, *MEMORY[0x1E0D18278], v105, CFSTR("com.apple.MobileSMS"), 1);

  }
  if (v111)
    v63 = v119;
  else
    v63 = 0;
  if (v63)
  {
    objc_msgSend(v130, "startTimingForKey:", CFSTR("IMDCoreSpotlightCreateCoreSpotlightPersonForHandleID"));
    objc_msgSend(a1, "_selfCSPersonFromHandleID:messageService:", v111, v129);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "stopTimingForKey:", CFSTR("IMDCoreSpotlightCreateCoreSpotlightPersonForHandleID"));
  }
  else
  {
    v64 = 0;
  }
  if (objc_msgSend(MEMORY[0x1E0D397C8], "verboseLoggingEnabled") && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v65 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v147 = (uint64_t)v64;
      _os_log_impl(&dword_1ABB60000, v65, OS_LOG_TYPE_INFO, "generated self person %@", buf, 0xCu);
    }

  }
  if ((v106 & 4) != 0)
  {
    if (v64)
    {
      v140 = v64;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v140, 1);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v113, "setAuthors:", v73);

      if (v111)
      {
        v139 = v111;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v139, 1);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v113, "setAuthorAddresses:", v74);

      }
      if (objc_msgSend(MEMORY[0x1E0D397C8], "verboseLoggingEnabled")
        && IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v75 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v147 = (uint64_t)v64;
          v148 = 2112;
          v149 = v111;
          _os_log_impl(&dword_1ABB60000, v75, OS_LOG_TYPE_INFO, "Adding author %@ author senderID %@", buf, 0x16u);
        }

      }
    }
  }
  else
  {
    objc_msgSend(v130, "startTimingForKey:", CFSTR("IMDCoreSpotlightAddAuthorDataTimingKey"));
    v133 = 0u;
    v134 = 0u;
    v131 = 0u;
    v132 = 0u;
    v66 = v123;
    v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v131, v144, 16);
    if (v67)
    {
      v68 = *(_QWORD *)v132;
LABEL_93:
      v69 = 0;
      while (1)
      {
        if (*(_QWORD *)v132 != v68)
          objc_enumerationMutation(v66);
        v70 = *(void **)(*((_QWORD *)&v131 + 1) + 8 * v69);
        objc_msgSend(v70, "handles");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "firstObject");
        v72 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v72, "isEqualToString:", v121) & 1) != 0)
          break;

        if (v67 == ++v69)
        {
          v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v131, v144, 16);
          if (v67)
            goto LABEL_93;
          goto LABEL_99;
        }
      }
      v76 = v70;

      if (!v76)
        goto LABEL_111;
      objc_msgSend(v114, "objectForKey:", CFSTR("handle"));
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      if (MEMORY[0x1AF434F1C]())
      {
        v143 = v125;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v143, 1);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v113, "setAuthorNames:", v78);
      }
      else
      {
        v142 = v76;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v142, 1);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v113, "setAuthors:", v78);
      }

      v80 = v121;
      if (v121)
      {
        v141 = v121;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v141, 1);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v113, "setAuthorAddresses:", v81);

        v80 = v121;
      }
      _IMDNicknameInfoForAddress(v80);
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D39980]), "initWithDictionaryRepresentation:", v127);
      _IMDContactNameForNickname(v82, 0);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "avatar");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "imageFilePath");
      v85 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v83, "length"))
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v86 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
          {
            v120 = v77;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v83, "length"));
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v147 = (uint64_t)v87;
            _os_log_impl(&dword_1ABB60000, v86, OS_LOG_TYPE_INFO, " Adding profile name of length %@ ", buf, 0xCu);

            v77 = v120;
          }

        }
        objc_msgSend(a1, "suggestedContactNameCustomKey");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v113, "setValue:forCustomKey:", v83, v88);

      }
      if (objc_msgSend(v85, "length"))
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v89 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1ABB60000, v89, OS_LOG_TYPE_INFO, " Adding profile avatar path ", buf, 2u);
          }

        }
        objc_msgSend(a1, "suggestedContactPhotoCustomKey");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v113, "setValue:forCustomKey:", v85, v90);

      }
      objc_msgSend(v66, "removeObject:", v76);
      if (objc_msgSend(MEMORY[0x1E0D397C8], "verboseLoggingEnabled")
        && IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v91 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v147 = (uint64_t)v76;
          v148 = 2112;
          v149 = v121;
          _os_log_impl(&dword_1ABB60000, v91, OS_LOG_TYPE_INFO, "Adding author %@ author senderID %@", buf, 0x16u);
        }

      }
    }
    else
    {
LABEL_99:

LABEL_111:
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v79 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1ABB60000, v79, OS_LOG_TYPE_INFO, "IMDCoreSpotlightRecipientIndexer - Failed to get author CSPerson for !isFromMe message", buf, 2u);
        }

      }
      v76 = 0;
    }
    if (v64)
      objc_msgSend(v66, "insertObject:atIndex:", v64, 0);
    objc_msgSend(v130, "stopTimingForKey:", CFSTR("IMDCoreSpotlightAddAuthorDataTimingKey"));

  }
  objc_msgSend(v113, "setPrimaryRecipients:", v123);
  objc_msgSend(v123, "__imArrayByApplyingBlock:", &unk_1E5AB7578);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "setRecipientAddresses:", v92);
  objc_msgSend(v112, "objectForKey:", CFSTR("guid"));
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "im_lastPathComponent");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  IMSharedHelperExternalLocationForFile();
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "groupPhotoPathCustomKey");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "setValue:forCustomKey:", v95, v96);

  objc_msgSend(v113, "setGroupPhotoPath:", v95);
  if (objc_msgSend(MEMORY[0x1E0D397C8], "verboseLoggingEnabled"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v97 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v113, "primaryRecipients");
        v98 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v147 = (uint64_t)v98;
        _os_log_impl(&dword_1ABB60000, v97, OS_LOG_TYPE_INFO, "Setting primary recipients %@", buf, 0xCu);

      }
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v99 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v99, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v113, "recipientAddresses");
        v100 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v147 = (uint64_t)v100;
        _os_log_impl(&dword_1ABB60000, v99, OS_LOG_TYPE_INFO, "Setting primary recipient IDs %@", buf, 0xCu);

      }
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v101 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v101, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v113, "authors");
        v102 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v147 = (uint64_t)v102;
        _os_log_impl(&dword_1ABB60000, v101, OS_LOG_TYPE_INFO, "Setting author %@", buf, 0xCu);

      }
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v103 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v103, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v113, "authorAddresses");
        v104 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v147 = (uint64_t)v104;
        _os_log_impl(&dword_1ABB60000, v103, OS_LOG_TYPE_INFO, "Setting author IDs %@", buf, 0xCu);

      }
    }
  }

}

+ (id)_contactForURI:(id)a3
{
  if (IMDCoreSpotlightRecipientIndexer_TestContact)
    return (id)IMDCoreSpotlightRecipientIndexer_TestContact;
  _IMDCoreSpotlightCNContactForAddress(a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_handleIDForHandleID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = v3;
  v5 = (void *)IMDCoreSpotlightRecipientIndexer_TestHandleID;
  if (!IMDCoreSpotlightRecipientIndexer_TestHandleID)
    v5 = v3;
  v6 = v5;

  return v6;
}

+ (id)_selfCSPersonFromHandleID:(id)a3 messageService:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  _IMDCoreSpotlightCNContactForAddress(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _IMDCoreSpotlightFullNameForContact(v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!v8)
    v8 = v5;
  _IMDCoreSpotlightPerson(v8, v5, v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
