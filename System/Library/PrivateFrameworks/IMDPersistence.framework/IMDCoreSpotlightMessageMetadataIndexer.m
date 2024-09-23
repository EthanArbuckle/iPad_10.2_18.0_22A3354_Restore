@implementation IMDCoreSpotlightMessageMetadataIndexer

+ (BOOL)cancelIndexingForItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  char v8;
  NSObject *v9;
  BOOL v10;
  NSObject *v11;
  void *v12;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "objectForKey:", CFSTR("associatedMessageType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    goto LABEL_13;
  v6 = objc_msgSend(v4, "integerValue");
  if (v6)
    v7 = (v6 & 0xFFFFFFFFFFFFFFF8) == 2000;
  else
    v7 = 1;
  v8 = v7;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v14 = 134217984;
      v15 = (const char *)v6;
      _os_log_impl(&dword_1ABB60000, v9, OS_LOG_TYPE_INFO, "Item is of type %ld", (uint8_t *)&v14, 0xCu);
    }

  }
  if ((v8 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v3, "objectForKey:", CFSTR("guid"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 136315650;
        v15 = "+[IMDCoreSpotlightMessageMetadataIndexer cancelIndexingForItem:]";
        v16 = 2112;
        v17 = v12;
        v18 = 2048;
        v19 = v6;
        _os_log_impl(&dword_1ABB60000, v11, OS_LOG_TYPE_INFO, "%s GUID %@ is of type %ld, not indexing", (uint8_t *)&v14, 0x20u);

      }
    }
    v10 = 1;
  }
  else
  {
LABEL_13:
    v10 = 0;
  }

  return v10;
}

+ (void)indexItem:(id)a3 withChat:(id)a4 isReindexing:(BOOL)a5 metadataToUpdate:(id)a6 timingProfiler:(id)a7
{
  id v11;
  id v12;
  void *v13;
  int v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  _BOOL8 v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  NSObject *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  void *v69;
  _QWORD v70[2];

  v70[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v61 = a4;
  v12 = a6;
  v56 = a7;
  objc_msgSend(v11, "objectForKey:", CFSTR("time"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v58, "isEqualToDate:", v13);

  if (v14)
  {
    IMLogHandleForCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_1ABC5BA7C(v15, v16, v17, v18, v19, v20, v21, v22);

  }
  else if (v58)
  {
    objc_msgSend(v12, "setContentCreationDate:", v58);
  }
  objc_msgSend(v11, "objectForKey:", CFSTR("accountID"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  if (v60)
    objc_msgSend(v12, "setAccountIdentifier:", v60);
  objc_msgSend(v61, "objectForKey:", CFSTR("lalh"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "_stripFZIDPrefix");
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  if (v59)
  {
    v70[0] = v59;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAccountHandles:", v24);

  }
  objc_msgSend(v11, "objectForKey:", CFSTR("flags"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "unsignedLongLongValue");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (v26 >> 13) & 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMessageRead:", v27);

  v28 = (v26 >> 2) & 1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setIsFromMe:", v29);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "isFromMeCustomKey");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setValue:forCustomKey:", v30, v31);

  objc_msgSend(v61, "objectForKey:", CFSTR("participants"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (unint64_t)objc_msgSend(v57, "count") > 1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setIsGroupThread:", v33);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v32);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "isGroupChatCustomKey");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setValue:forCustomKey:", v34, v35);

  objc_msgSend(v11, "_numberForKey:", CFSTR("isIncomingMessage"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "BOOLValue");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setIsNew:", v38);

  objc_msgSend(v11, "objectForKey:", CFSTR("attributedBody"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  _IMDCoreSpotlightTokensMentionedInMessage(v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "mentionedAddressesCustomKey");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setValue:forCustomKey:", v40, v41);

  v42 = objc_msgSend(v39, "length");
  v43 = objc_msgSend(v39, "attribute:existsInRange:", *MEMORY[0x1E0D366F8], 0, v42);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setIsTwoFactorCode:", v44);

  objc_msgSend(v11, "objectForKey:", CFSTR("handle"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MEMORY[0x1AF434F1C]());
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "isBusinessChatCustomKey");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setValue:forCustomKey:", v46, v47);

  objc_msgSend(v11, "objectForKey:", CFSTR("service"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if (v48)
    objc_msgSend(v12, "setMessageService:", v48);
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("knownSender"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "BOOLValue");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setIsMessageFromKnownSender:", v51);

  v52 = objc_msgSend(a1, "isMutedChatForChatDictionary:", v61);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "isChatMutedCustomKey");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setValue:forCustomKey:", v53, v54);
  if (objc_msgSend(MEMORY[0x1E0D397C8], "verboseLoggingEnabled") && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      v63 = v58;
      v64 = 2112;
      v65 = v60;
      v66 = 2112;
      v67 = v59;
      v68 = 2112;
      v69 = v48;
      _os_log_impl(&dword_1ABB60000, v55, OS_LOG_TYPE_INFO, "setting date %@ accountID %@ lastAddressedLocalHandle %@ service %@", buf, 0x2Au);
    }

  }
}

+ (BOOL)isMutedChatForChatDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;

  v3 = a3;
  objc_msgSend(v3, "objectForKey:", CFSTR("chatIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("style"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  objc_msgSend(v3, "objectForKey:", CFSTR("groupID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("participants"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayByApplyingSelector:", sel__stripFZIDPrefix);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("lalh"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_stripFZIDPrefix");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKey:", CFSTR("originalGroupID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D39970], "sharedList");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "muteIdentifiersForChatStyle:groupID:participantIDs:lastAddressedHandleID:originalGroupID:chatIdentifier:", v6, v7, v9, v11, v12, v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "isMutedChatForMuteIdentifiers:", v14);

  return v15;
}

@end
