@implementation IMAutomation

- (BOOL)checkArgumentValidity:(id)a3 forExpectedNumberOfArguments:(int)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  BOOL v12;

  v5 = a3;
  if (a4 < 1)
  {
    v12 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("arg%d"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = 1;
      do
      {
        v9 = v8;
        if (a4 == v8)
          break;
        ++v8;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("arg%d"), (v9 + 1));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

      }
      while (v11);
      v12 = v9 >= a4;
    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (id)callIMCoreMethodWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v16;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("methodName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (!v6 || objc_msgSend(v6, "isEqualToString:", &stru_1E4725068))
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", CFSTR("No method name was passed in"), CFSTR("error"), 0);
      if (!IMOSLoggingEnabled())
      {
LABEL_33:

        goto LABEL_34;
      }
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_INFO, "No method name was passed in", buf, 2u);
      }
LABEL_32:

      goto LABEL_33;
    }
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("clearAttachmentsUploadedToCloudkit")))
    {
      v9 = objc_opt_new();
      -[NSObject clearAttachmentsUploadedToCloudkit](v9, "clearAttachmentsUploadedToCloudkit");
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v8 = (void *)v10;
      goto LABEL_32;
    }
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("deleteAttachmentWithMessageGUID"))
      && -[IMAutomation checkArgumentValidity:forExpectedNumberOfArguments:](self, "checkArgumentValidity:forExpectedNumberOfArguments:", v5, 2))
    {
      v9 = objc_opt_new();
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("arg1"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("arg2"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject deleteAttachmentWithMessageGUID:andFilePathIndex:](v9, "deleteAttachmentWithMessageGUID:andFilePathIndex:", v11, objc_msgSend(v12, "integerValue"));
      v13 = objc_claimAutoreleasedReturnValue();
LABEL_30:
      v8 = (void *)v13;

      goto LABEL_31;
    }
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("dictionaryFromGUID"))
      && -[IMAutomation checkArgumentValidity:forExpectedNumberOfArguments:](self, "checkArgumentValidity:forExpectedNumberOfArguments:", v5, 1))
    {
      v9 = objc_opt_new();
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("arg1"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject dictionaryFromGUID:](v9, "dictionaryFromGUID:", v11);
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v7, "isEqualToString:", CFSTR("fileSizeForMessageGUID"))
        && -[IMAutomation checkArgumentValidity:forExpectedNumberOfArguments:](self, "checkArgumentValidity:forExpectedNumberOfArguments:", v5, 2))
      {
        v9 = objc_opt_new();
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("arg1"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("arg2"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject fileSizeForMessageGUID:withFilePathIndex:](v9, "fileSizeForMessageGUID:withFilePathIndex:", v11, objc_msgSend(v12, "integerValue"));
        v13 = objc_claimAutoreleasedReturnValue();
        goto LABEL_30;
      }
      if (objc_msgSend(v7, "isEqualToString:", CFSTR("loadHighResolutionFileForMessageGUID"))
        && -[IMAutomation checkArgumentValidity:forExpectedNumberOfArguments:](self, "checkArgumentValidity:forExpectedNumberOfArguments:", v5, 2))
      {
        v9 = objc_opt_new();
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("arg1"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("arg2"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject loadHighResolutionFileForMessageGUID:withFilePathIndex:](v9, "loadHighResolutionFileForMessageGUID:withFilePathIndex:", v11, objc_msgSend(v12, "integerValue"));
        v13 = objc_claimAutoreleasedReturnValue();
        goto LABEL_30;
      }
      if (!objc_msgSend(v7, "isEqualToString:", CFSTR("startConversationFrom"))
        || !-[IMAutomation checkArgumentValidity:forExpectedNumberOfArguments:](self, "checkArgumentValidity:forExpectedNumberOfArguments:", v5, 2))
      {
        if (!objc_msgSend(v7, "isEqualToString:", CFSTR("uploadAttachmentToCloudkitWithMessageGUID"))
          || !-[IMAutomation checkArgumentValidity:forExpectedNumberOfArguments:](self, "checkArgumentValidity:forExpectedNumberOfArguments:", v5, 2))
        {
          v16 = objc_alloc(MEMORY[0x1E0C99D80]);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Could not find method %@"), v7);
          v9 = objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v16, "initWithObjectsAndKeys:", v9, CFSTR("error"), 0);
          goto LABEL_10;
        }
        v9 = objc_opt_new();
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("arg1"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("arg2"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject uploadAttachmentToCloudkitWithMessageGUID:andFilePathIndex:](v9, "uploadAttachmentToCloudkitWithMessageGUID:andFilePathIndex:", v11, objc_msgSend(v12, "integerValue"));
        v13 = objc_claimAutoreleasedReturnValue();
        goto LABEL_30;
      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("arg1"));
      v9 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("arg2"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMAutomation startConversationFrom:andReceiveAt:](self, "startConversationFrom:andReceiveAt:", v9, v11);
      v14 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (void *)v14;
LABEL_31:

    goto LABEL_32;
  }
  v8 = 0;
LABEL_34:

  return v8;
}

- (id)IMCoreAutomationPerformOperationWithDictionary:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint8_t buf[16];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_1A200AE24;
  v18 = sub_1A200AC84;
  v19 = 0;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "IMCoreAutomationPerformOperationWithDictionary method call already on main queue", buf, 2u);
      }

    }
    -[IMAutomation callIMCoreMethodWithDictionary:](self, "callIMCoreMethodWithDictionary:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v15[5];
    v15[5] = v6;

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1A20B2790;
    block[3] = &unk_1E471F520;
    v12 = &v14;
    block[4] = self;
    v11 = v4;
    dispatch_sync(MEMORY[0x1E0C80D38], block);

  }
  v8 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v8;
}

- (id)startConversationFrom:(id)a3 andReceiveAt:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  unint64_t v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  char v35;
  const __CFString *v36;
  int v37;
  void *v38;
  char v39;
  void *v40;
  char v41;
  void *v42;
  char v43;
  uint64_t v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  char v51;
  void *v52;
  char v53;
  void *v54;
  char v55;
  uint64_t v56;
  void *v57;
  id v58;
  void *v59;
  char v60;
  const __CFString *v61;
  void *v62;
  char v63;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v65;
  char v66;
  uint64_t v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  void *v75;
  id v76;
  void *v77;
  void *v78;
  id obj;
  __CFString *v80;
  uint64_t v81;
  id v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _BYTE v91[128];
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v8 = objc_msgSend(v5, "length");
  if (!v6 || !v8)
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("Did not pass in a valid set of arguments"), CFSTR("error"));
    v23 = v7;
    goto LABEL_69;
  }
  v77 = v7;
  v78 = v6;
  +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMService iMessageService](IMServiceImpl, "iMessageService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accountsForService:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v87, v92, 16);
  if (!v13)
  {
    v15 = 0;
    v16 = 0;
    goto LABEL_17;
  }
  v14 = v13;
  v15 = 0;
  v16 = 0;
  v17 = *(_QWORD *)v88;
  do
  {
    for (i = 0; i != v14; ++i)
    {
      if (*(_QWORD *)v88 != v17)
        objc_enumerationMutation(v12);
      v19 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * i);
      if (objc_msgSend(v19, "accountType") == 2)
      {
        v20 = (void *)v16;
        v21 = v15;
        v16 = (unint64_t)v19;
      }
      else
      {
        v20 = (void *)v15;
        v21 = (unint64_t)v19;
        if (objc_msgSend(v19, "accountType") != 1)
          continue;
      }
      v22 = v19;

      v15 = v21;
    }
    v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v87, v92, 16);
  }
  while (v14);
LABEL_17:

  if (!(v15 | v16))
  {
    v7 = v77;
    objc_msgSend(v77, "setObject:forKeyedSubscript:", CFSTR("No usable iMessageAccounts found"), CFSTR("error"));
    v45 = v77;
    goto LABEL_68;
  }
  v24 = (id)v15;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("P:%@"), v5);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15 || (v26 = (void *)v16) == 0)
  {
    if (!v24 || (v26 = v24, v16))
    {
      if (!v16
        || (objc_msgSend((id)v16, "login"),
            v27 = (void *)objc_claimAutoreleasedReturnValue(),
            v28 = objc_msgSend(v25, "isEqualToString:", v27),
            v27,
            v26 = (void *)v16,
            (v28 & 1) == 0))
      {
        v26 = v24;
      }
    }
  }
  v75 = v25;
  v82 = v24;
  v76 = v26;
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  obj = v78;
  v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v91, 16);
  if (!v29)
  {
    v80 = &stru_1E4725068;
    v31 = 1;
    goto LABEL_47;
  }
  v30 = v29;
  v80 = &stru_1E4725068;
  v81 = *(_QWORD *)v84;
  LOBYTE(v31) = 1;
  while (2)
  {
    v32 = 0;
    while (2)
    {
      if (*(_QWORD *)v84 != v81)
        objc_enumerationMutation(obj);
      v33 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * v32);
      if (!objc_msgSend(v33, "length"))
      {
        v7 = v77;
        objc_msgSend(v77, "setObject:forKeyedSubscript:", CFSTR("Did not pass in valid alias"), CFSTR("error"));
        v46 = v77;

        goto LABEL_45;
      }
      objc_msgSend(v82, "vettedAliases");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "containsObject:", v33);

      if ((v35 & 1) != 0)
      {
        if ((v31 & 1) == 0)
        {
          v31 = 0;
          goto LABEL_40;
        }
LABEL_36:
        objc_msgSend(v82, "aliases", v36);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "containsObject:", v33);

        if ((v41 & 1) != 0
          || (objc_msgSend(v82, "addAlias:", v33),
              objc_msgSend(v82, "aliases"),
              v42 = (void *)objc_claimAutoreleasedReturnValue(),
              v43 = objc_msgSend(v42, "containsObject:", v33),
              v42,
              v36 = CFSTR("Failed to add alias to alias array | "),
              (v43 & 1) != 0))
        {
          v31 = 1;
          goto LABEL_40;
        }
      }
      else
      {
        v37 = objc_msgSend(v82, "validateAlias:", v33);
        v36 = CFSTR("Failed to validate alias | ");
        if (v37)
        {
          objc_msgSend(v82, "vettedAliases", CFSTR("Failed to validate alias | "));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v38, "containsObject:", v33);

          v36 = CFSTR("Failed to validate alias | ");
          if ((v39 & 1) != 0)
            goto LABEL_36;
        }
      }
      -[__CFString stringByAppendingString:](v80, "stringByAppendingString:", v36);
      v44 = objc_claimAutoreleasedReturnValue();

      v31 = 0;
      v80 = (__CFString *)v44;
LABEL_40:
      if (v30 != ++v32)
        continue;
      break;
    }
    v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v91, 16);
    if (v30)
      continue;
    break;
  }
LABEL_47:

  if (v76 == v82
    && (objc_msgSend(v82, "aliases"),
        v50 = (void *)objc_claimAutoreleasedReturnValue(),
        v51 = objc_msgSend(v50, "containsObject:", v5),
        v50,
        (v51 & 1) == 0))
  {
    v7 = v77;
    objc_msgSend(v77, "setObject:forKeyedSubscript:", CFSTR("Cannot set apple id caller id if this alias is not in alias list"), CFSTR("error"));
    v68 = v77;
LABEL_45:
    v47 = v82;
    v48 = v75;
    v49 = v80;
  }
  else
  {
    objc_msgSend(v76, "vettedAliases");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v52, "containsObject:", v5);

    v7 = v77;
    if ((v53 & 1) == 0)
    {
      if (objc_msgSend(v76, "validateAlias:", v5)
        && (objc_msgSend(v76, "vettedAliases"),
            v54 = (void *)objc_claimAutoreleasedReturnValue(),
            v55 = objc_msgSend(v54, "containsObject:", v5),
            v54,
            (v55 & 1) != 0))
      {
        v31 = 1;
      }
      else
      {
        -[__CFString stringByAppendingString:](v80, "stringByAppendingString:", CFSTR("Failed to validate callerID | "));
        v56 = objc_claimAutoreleasedReturnValue();

        v31 = 0;
        v80 = (__CFString *)v56;
      }
    }
    +[IMService iMessageService](IMServiceImpl, "iMessageService");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    IMPreferredAccountForService(v57);
    v58 = (id)objc_claimAutoreleasedReturnValue();

    if (v58 == v76)
    {
      if (v31)
        goto LABEL_58;
      v47 = v82;
      v48 = v75;
      v49 = v80;
LABEL_65:
      objc_msgSend(v77, "setObject:forKeyedSubscript:", v49, CFSTR("error"));
    }
    else
    {
      objc_msgSend(v76, "service");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = IMSetPreferredAccountForService(v76, v59);

      if ((v60 & 1) == 0)
      {
        v61 = CFSTR("Preferred account was not set to specified login account");
        v47 = v82;
        v48 = v75;
        v49 = v80;
        goto LABEL_62;
      }
LABEL_58:
      objc_msgSend(v76, "displayName");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = objc_msgSend(v62, "isEqualToString:", v5);

      if ((v63 & 1) != 0)
      {
        v47 = v82;
        v48 = v75;
        v49 = v80;
        goto LABEL_66;
      }
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.ft.CallerID.changed"), 0, 0, 1u);
      objc_msgSend(v76, "setDisplayName:", v5);
      objc_msgSend(v76, "displayName");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = objc_msgSend(v65, "isEqualToString:", v5);

      v47 = v82;
      v48 = v75;
      v49 = v80;
      if ((v66 & 1) == 0)
      {
        v61 = CFSTR("Failed to change display name | ");
LABEL_62:
        objc_msgSend(v49, "stringByAppendingString:", v61);
        v67 = objc_claimAutoreleasedReturnValue();

        v49 = (void *)v67;
        goto LABEL_65;
      }
    }
LABEL_66:
    objc_msgSend(v47, "aliases");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "setObject:forKeyedSubscript:", v69, CFSTR("receivingAliases"));

    objc_msgSend(v47, "vettedAliases");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "setObject:forKeyedSubscript:", v70, CFSTR("receivingVettedAliases"));

    objc_msgSend(v76, "displayName");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "setObject:forKeyedSubscript:", v71, CFSTR("sendingDisplayName"));

    objc_msgSend(v76, "login");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "setObject:forKeyedSubscript:", v72, CFSTR("sendingLogin"));

    v73 = v77;
  }

LABEL_68:
  v6 = v78;
LABEL_69:

  return v7;
}

@end
