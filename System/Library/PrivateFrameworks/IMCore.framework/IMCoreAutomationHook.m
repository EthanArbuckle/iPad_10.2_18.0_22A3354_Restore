@implementation IMCoreAutomationHook

- (IMAccount)bestiMessageAccount
{
  IMAccount *imessageAccount;
  void *v4;
  void *v5;
  IMAccount *v6;
  IMAccount *v7;

  imessageAccount = self->_imessageAccount;
  if (!imessageAccount)
  {
    +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMService iMessageService](IMServiceImpl, "iMessageService");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bestAccountForService:", v5);
    v6 = (IMAccount *)objc_claimAutoreleasedReturnValue();
    v7 = self->_imessageAccount;
    self->_imessageAccount = v6;

    imessageAccount = self->_imessageAccount;
  }
  return imessageAccount;
}

- (id)chatForHandles:(id)a3 error:(id *)a4 results:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  _QWORD v31[2];
  _QWORD v32[2];
  uint8_t buf[4];
  void *v34;
  _QWORD v35[2];
  _QWORD v36[3];

  v36[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  if (objc_msgSend(v7, "count"))
  {
    +[IMChatRegistry sharedRegistry](IMChatRegistry, "sharedRegistry");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "chatWithHandles:", v7);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "groupID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setValue:forKey:", v11, CFSTR("group_id"));

      v10 = v10;
      v12 = v10;
    }
    else
    {
      v31[0] = *MEMORY[0x1E0CB2D50];
      v21 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Condition failed : '%s'"), "(chat) == nil");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[IMCoreAutomationHook stringFromAutomationErrorCode:](IMCoreAutomationHook, "stringFromAutomationErrorCode:", 5);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringWithFormat:", CFSTR("%@ (%@)"), v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v31[1] = CFSTR("IMCoreAutomationHookParameterErrorLocation");
      v32[0] = v24;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/MessagesCore/IMCore/IMCore/Source/Automation Hooks/IMCoreAutomationHook.m", 49);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v32[1] = v25;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IMCoreAutomationHookErrorDomain"), 5, v26);
      v27 = (id)objc_claimAutoreleasedReturnValue();
      if (v27)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v27, "description");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v34 = v29;
            _os_log_impl(&dword_1A1FF4000, v28, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

          }
        }
        if (a4 && !*a4)
          *a4 = objc_retainAutorelease(v27);
      }

      v12 = 0;
    }
  }
  else
  {
    v35[0] = *MEMORY[0x1E0CB2D50];
    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Condition failed : '%s'"), "[handles count] == 0");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMCoreAutomationHook stringFromAutomationErrorCode:](IMCoreAutomationHook, "stringFromAutomationErrorCode:", 5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ (%@)"), v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = CFSTR("IMCoreAutomationHookParameterErrorLocation");
    v36[0] = v16;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/MessagesCore/IMCore/IMCore/Source/Automation Hooks/IMCoreAutomationHook.m", 47);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IMCoreAutomationHookErrorDomain"), 5, v10);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v18, "description");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v34 = v20;
          _os_log_impl(&dword_1A1FF4000, v19, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

        }
      }
      if (a4 && !*a4)
        *a4 = objc_retainAutorelease(v18);
    }

    v12 = 0;
  }

  return v12;
}

- (id)handlesFromStrings:(id)a3 error:(id *)a4 results:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[2];
  _QWORD v43[2];
  uint8_t v44[128];
  uint8_t buf[4];
  void *v46;
  _QWORD v47[2];
  _QWORD v48[5];

  v48[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  if (!objc_msgSend(v7, "count"))
  {
    v47[0] = *MEMORY[0x1E0CB2D50];
    v19 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Condition failed : '%s'"), "[handleStrings count] == 0");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMCoreAutomationHook stringFromAutomationErrorCode:](IMCoreAutomationHook, "stringFromAutomationErrorCode:", 5);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("%@ (%@)"), v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v47[1] = CFSTR("IMCoreAutomationHookParameterErrorLocation");
    v48[0] = v22;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/MessagesCore/IMCore/IMCore/Source/Automation Hooks/IMCoreAutomationHook.m", 58);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v48[1] = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 2);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IMCoreAutomationHookErrorDomain"), 5, v9);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v24, "description");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v46 = v26;
          _os_log_impl(&dword_1A1FF4000, v25, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

        }
      }
      if (a4 && !*a4)
        *a4 = objc_retainAutorelease(v24);
    }

    goto LABEL_31;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v39 != v12)
          objc_enumerationMutation(v10);
        v14 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
        -[IMCoreAutomationHook bestiMessageAccount](self, "bestiMessageAccount");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "imHandleWithID:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
          objc_msgSend(v9, "addObject:", v16);

      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    }
    while (v11);
  }

  v17 = objc_msgSend(v10, "count");
  if (v17 != objc_msgSend(v9, "count"))
  {
    v42[0] = *MEMORY[0x1E0CB2D50];
    v27 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Condition failed : '%s'"), "[handleStrings count] != [outArray count]");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMCoreAutomationHook stringFromAutomationErrorCode:](IMCoreAutomationHook, "stringFromAutomationErrorCode:", 5);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringWithFormat:", CFSTR("%@ (%@)"), v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v42[1] = CFSTR("IMCoreAutomationHookParameterErrorLocation");
    v43[0] = v30;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/MessagesCore/IMCore/IMCore/Source/Automation Hooks/IMCoreAutomationHook.m", 68);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v43[1] = v31;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IMCoreAutomationHookErrorDomain"), 5, v32);
    v33 = (id)objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v33, "description");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v46 = v35;
          _os_log_impl(&dword_1A1FF4000, v34, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

        }
      }
      if (a4 && !*a4)
        *a4 = objc_retainAutorelease(v33);
    }

LABEL_31:
    v18 = 0;
    goto LABEL_32;
  }
  objc_msgSend(v8, "setObject:forKey:", v10, CFSTR("members"));
  v9 = v9;
  v18 = v9;
LABEL_32:

  return v18;
}

- (id)existingChatForGroupID:(id)a3 error:(id *)a4 results:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  uint8_t buf[4];
  void *v23;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  +[IMChatRegistry sharedRegistry](IMChatRegistry, "sharedRegistry");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "existingChatWithGroupID:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = v10;
  }
  else
  {
    v24[0] = *MEMORY[0x1E0CB2D50];
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Condition failed : '%s'"), "(chat) == nil");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMCoreAutomationHook stringFromAutomationErrorCode:](IMCoreAutomationHook, "stringFromAutomationErrorCode:", 5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@ (%@)"), v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = CFSTR("IMCoreAutomationHookParameterErrorLocation");
    v25[0] = v15;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/MessagesCore/IMCore/IMCore/Source/Automation Hooks/IMCoreAutomationHook.m", 78);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IMCoreAutomationHookErrorDomain"), 5, v17);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v18, "description");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v23 = v20;
          _os_log_impl(&dword_1A1FF4000, v19, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

        }
      }
      if (a4 && !*a4)
        *a4 = objc_retainAutorelease(v18);
    }

  }
  return v10;
}

+ (id)stringFromAutomationErrorCode:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  const char *v7;

  switch(a3)
  {
    case 1:
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = 1;
      v7 = "IMCoreAutomationHookErrorCodeDomainTimeOut";
      goto LABEL_8;
    case 2:
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = 2;
      v7 = "IMCoreAutomationHookErrorCodeInvalidParameters";
      goto LABEL_8;
    case 3:
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = 3;
      v7 = "IMCoreAutomationHookErrorCodeGroupCreationFailure";
      goto LABEL_8;
    case 4:
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = 4;
      v7 = "IMCoreAutomationHookErrorCodeChatNotFound";
      goto LABEL_8;
    case 5:
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = 5;
      v7 = "IMCoreAutomationHookErrorCodeConditionFailed";
LABEL_8:
      objc_msgSend(v5, "stringWithFormat:", CFSTR("%s:%ld"), v7, v6, v3, v4);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return a1;
  }
  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imessageAccount, 0);
}

@end
