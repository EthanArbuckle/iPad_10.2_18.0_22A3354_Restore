@implementation IMAutomationGroupChat

- (id)createGroupChatWithDestinationIDs:(id)a3 error:(id *)a4 optArguments:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
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
  id v31;
  _QWORD v32[2];
  _QWORD v33[2];
  uint8_t buf[4];
  void *v35;
  _QWORD v36[2];
  _QWORD v37[3];

  v37[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v31 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMCoreAutomationHook handlesFromStrings:error:results:](self, "handlesFromStrings:error:results:", v8, a4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v36[0] = *MEMORY[0x1E0CB2D50];
    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Condition failed : '%s'"), "(handles) == nil");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMCoreAutomationHook stringFromAutomationErrorCode:](IMCoreAutomationHook, "stringFromAutomationErrorCode:", 5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ (%@)"), v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v16;
    v36[1] = CFSTR("IMCoreAutomationHookParameterErrorLocation");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/MessagesCore/IMCore/IMCore/Source/Automation Hooks/IMAutomationGroupChat.m", 29);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IMCoreAutomationHookErrorDomain"), 5, v11);
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
          v35 = v20;
          _os_log_impl(&dword_1A1FF4000, v19, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

        }
      }
      if (a4 && !*a4)
        *a4 = objc_retainAutorelease(v18);
    }

    goto LABEL_22;
  }
  -[IMCoreAutomationHook chatForHandles:error:results:](self, "chatForHandles:error:results:", v10, a4, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v32[0] = *MEMORY[0x1E0CB2D50];
    v21 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Condition failed : '%s'"), "(chat) == nil");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMCoreAutomationHook stringFromAutomationErrorCode:](IMCoreAutomationHook, "stringFromAutomationErrorCode:", 5);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("%@ (%@)"), v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v24;
    v32[1] = CFSTR("IMCoreAutomationHookParameterErrorLocation");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/MessagesCore/IMCore/IMCore/Source/Automation Hooks/IMAutomationGroupChat.m", 32);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v25;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
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
          v35 = v29;
          _os_log_impl(&dword_1A1FF4000, v28, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

        }
      }
      if (a4 && !*a4)
        *a4 = objc_retainAutorelease(v27);
    }

LABEL_22:
    v12 = 0;
    goto LABEL_23;
  }
  v12 = v9;
LABEL_23:

  return v12;
}

- (id)_runChangeParticipantsQueryWithGroupID:(id)a3 participants:(id)a4 timeOut:(double)a5 error:(id *)a6 optArguments:(id)a7 addParticipants:(BOOL)a8
{
  _BOOL4 v8;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  void *v63;
  id *v64;
  id v65;
  _QWORD v66[2];
  _QWORD v67[2];
  _QWORD v68[2];
  _QWORD v69[2];
  _QWORD v70[2];
  _QWORD v71[2];
  _QWORD v72[2];
  _QWORD v73[2];
  uint8_t buf[4];
  void *v75;
  _QWORD v76[2];
  _QWORD v77[5];

  v8 = a8;
  v77[2] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v65 = a7;
  if (!v13)
  {
    v23 = a6;
    v76[0] = *MEMORY[0x1E0CB2D50];
    v24 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Condition failed : '%s'"), "(groupID) == nil");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMCoreAutomationHook stringFromAutomationErrorCode:](IMCoreAutomationHook, "stringFromAutomationErrorCode:", 5);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringWithFormat:", CFSTR("%@ (%@)"), v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v77[0] = v27;
    v76[1] = CFSTR("IMCoreAutomationHookParameterErrorLocation");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/MessagesCore/IMCore/IMCore/Source/Automation Hooks/IMAutomationGroupChat.m", 44);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v77[1] = v28;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v77, v76, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IMCoreAutomationHookErrorDomain"), 5, v15);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (!v17)
      goto LABEL_24;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v17, "description");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v75 = v30;
        _os_log_impl(&dword_1A1FF4000, v29, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

      }
    }
    if (!v23 || *v23)
      goto LABEL_24;
    v31 = objc_retainAutorelease(v17);
    v17 = v31;
    v32 = 0;
    *v23 = v31;
LABEL_58:
    v16 = v31;
    goto LABEL_56;
  }
  v64 = a6;
  if (objc_msgSend(v14, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMCoreAutomationHook handlesFromStrings:error:results:](self, "handlesFromStrings:error:results:", v14, a6, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      -[IMCoreAutomationHook existingChatForGroupID:error:results:](self, "existingChatForGroupID:error:results:", v13, 0, v15);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      if (v17
        || (-[IMCoreAutomationHook chatForHandles:error:results:](self, "chatForHandles:error:results:", v16, a6, v15),
            (v17 = (id)objc_claimAutoreleasedReturnValue()) != 0))
      {
        v18 = objc_alloc(MEMORY[0x1E0CB3498]);
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("join us"), &stru_1E4725068, 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(v18, "initWithString:", v20);
        +[IMMessage instantMessageWithText:messageSubject:fileTransferGUIDs:flags:threadIdentifier:](IMMessage, "instantMessageWithText:messageSubject:fileTransferGUIDs:flags:threadIdentifier:", v21, 0, 0, 5, 0);
        v22 = (id)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          if (v8)
            objc_msgSend(v17, "inviteParticipants:reason:", v16, v22);
          else
            objc_msgSend(v17, "removeParticipants:reason:", v16, v22);
          v32 = v15;
          goto LABEL_55;
        }
        v66[0] = *MEMORY[0x1E0CB2D50];
        v47 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Condition failed : '%s'"), "(message) == nil");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        +[IMCoreAutomationHook stringFromAutomationErrorCode:](IMCoreAutomationHook, "stringFromAutomationErrorCode:", 5);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "stringWithFormat:", CFSTR("%@ (%@)"), v48, v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v67[0] = v50;
        v66[1] = CFSTR("IMCoreAutomationHookParameterErrorLocation");
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/MessagesCore/IMCore/IMCore/Source/Automation Hooks/IMAutomationGroupChat.m", 65);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v67[1] = v51;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v67, v66, 2);
        v63 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IMCoreAutomationHookErrorDomain"), 5, v63);
        v52 = (id)objc_claimAutoreleasedReturnValue();
        if (v52)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v53 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v52, "description");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v75 = v54;
              _os_log_impl(&dword_1A1FF4000, v53, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

            }
          }
          if (v64 && !*v64)
            *v64 = objc_retainAutorelease(v52);
        }

      }
      else
      {
        v68[0] = *MEMORY[0x1E0CB2D50];
        v55 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Condition failed : '%s'"), "(chat) == nil");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        +[IMCoreAutomationHook stringFromAutomationErrorCode:](IMCoreAutomationHook, "stringFromAutomationErrorCode:", 5);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "stringWithFormat:", CFSTR("%@ (%@)"), v56, v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v69[0] = v58;
        v68[1] = CFSTR("IMCoreAutomationHookParameterErrorLocation");
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/MessagesCore/IMCore/IMCore/Source/Automation Hooks/IMAutomationGroupChat.m", 57);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v69[1] = v59;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v69, v68, 2);
        v17 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IMCoreAutomationHookErrorDomain"), 5, v17);
        v22 = (id)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v60 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v22, "description");
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v75 = v61;
              _os_log_impl(&dword_1A1FF4000, v60, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

            }
          }
          if (v64 && !*v64)
            *v64 = objc_retainAutorelease(v22);
        }

      }
    }
    else
    {
      v70[0] = *MEMORY[0x1E0CB2D50];
      v40 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Condition failed : '%s'"), "(handles) == nil");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      +[IMCoreAutomationHook stringFromAutomationErrorCode:](IMCoreAutomationHook, "stringFromAutomationErrorCode:", 5);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "stringWithFormat:", CFSTR("%@ (%@)"), v41, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v71[0] = v43;
      v70[1] = CFSTR("IMCoreAutomationHookParameterErrorLocation");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/MessagesCore/IMCore/IMCore/Source/Automation Hooks/IMAutomationGroupChat.m", 50);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v71[1] = v44;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v71, v70, 2);
      v17 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IMCoreAutomationHookErrorDomain"), 5, v17);
      v22 = (id)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v22, "description");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v75 = v46;
            _os_log_impl(&dword_1A1FF4000, v45, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

          }
        }
        if (v64 && !*v64)
          *v64 = objc_retainAutorelease(v22);
      }

    }
    v32 = 0;
LABEL_55:

    goto LABEL_56;
  }
  v72[0] = *MEMORY[0x1E0CB2D50];
  v33 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Condition failed : '%s'"), "[participants count] == 0");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMCoreAutomationHook stringFromAutomationErrorCode:](IMCoreAutomationHook, "stringFromAutomationErrorCode:", 5);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "stringWithFormat:", CFSTR("%@ (%@)"), v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v73[0] = v36;
  v72[1] = CFSTR("IMCoreAutomationHookParameterErrorLocation");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/MessagesCore/IMCore/IMCore/Source/Automation Hooks/IMAutomationGroupChat.m", 45);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v73[1] = v37;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v73, v72, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IMCoreAutomationHookErrorDomain"), 5, v15);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v17, "description");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v75 = v39;
        _os_log_impl(&dword_1A1FF4000, v38, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

      }
    }
    if (v64 && !*v64)
    {
      v31 = objc_retainAutorelease(v17);
      v17 = v31;
      v32 = 0;
      *v64 = v31;
      goto LABEL_58;
    }
  }
LABEL_24:
  v32 = 0;
  v16 = v17;
LABEL_56:

  return v32;
}

- (id)addParticipantsWithGroupID:(id)a3 participants:(id)a4 timeOut:(double)a5 error:(id *)a6 optArguments:(id)a7
{
  return (id)MEMORY[0x1E0DE7D20](self, sel__runChangeParticipantsQueryWithGroupID_participants_timeOut_error_optArguments_addParticipants_);
}

- (id)removeParticipantsWithGroupID:(id)a3 participants:(id)a4 timeOut:(double)a5 error:(id *)a6 optArguments:(id)a7
{
  return (id)MEMORY[0x1E0DE7D20](self, sel__runChangeParticipantsQueryWithGroupID_participants_timeOut_error_optArguments_addParticipants_);
}

- (id)changeGroupNameWithGroupID:(id)a3 newName:(id)a4 timeOut:(double)a5 error:(id *)a6 optArguments:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  id v41;
  _QWORD v42[2];
  _QWORD v43[2];
  _QWORD v44[2];
  _QWORD v45[2];
  uint8_t buf[4];
  void *v47;
  _QWORD v48[2];
  _QWORD v49[4];

  v49[2] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v41 = a7;
  if (!v11)
  {
    v48[0] = *MEMORY[0x1E0CB2D50];
    v17 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Condition failed : '%s'"), "(groupID) == nil");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMCoreAutomationHook stringFromAutomationErrorCode:](IMCoreAutomationHook, "stringFromAutomationErrorCode:", 5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("%@ (%@)"), v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v20;
    v48[1] = CFSTR("IMCoreAutomationHookParameterErrorLocation");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/MessagesCore/IMCore/IMCore/Source/Automation Hooks/IMAutomationGroupChat.m", 112);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v49[1] = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 2);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IMCoreAutomationHookErrorDomain"), 5, v13);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v15, "description");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v47 = v23;
          _os_log_impl(&dword_1A1FF4000, v22, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

        }
      }
      if (a6 && !*a6)
        *a6 = objc_retainAutorelease(v15);
    }

    goto LABEL_32;
  }
  if (!v12)
  {
    v44[0] = *MEMORY[0x1E0CB2D50];
    v24 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Condition failed : '%s'"), "(newName) == nil");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMCoreAutomationHook stringFromAutomationErrorCode:](IMCoreAutomationHook, "stringFromAutomationErrorCode:", 5);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringWithFormat:", CFSTR("%@ (%@)"), v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = v27;
    v44[1] = CFSTR("IMCoreAutomationHookParameterErrorLocation");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/MessagesCore/IMCore/IMCore/Source/Automation Hooks/IMAutomationGroupChat.m", 113);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v45[1] = v28;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 2);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IMCoreAutomationHookErrorDomain"), 5, v13);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v15, "description");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v47 = v30;
          _os_log_impl(&dword_1A1FF4000, v29, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

        }
      }
      if (a6 && !*a6)
        *a6 = objc_retainAutorelease(v15);
    }

    goto LABEL_32;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[IMCoreAutomationHook existingChatForGroupID:error:results:](self, "existingChatForGroupID:error:results:", v11, a6, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v14)
  {
    v42[0] = *MEMORY[0x1E0CB2D50];
    v31 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Condition failed : '%s'"), "(chat) == nil");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMCoreAutomationHook stringFromAutomationErrorCode:](IMCoreAutomationHook, "stringFromAutomationErrorCode:", 5);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "stringWithFormat:", CFSTR("%@ (%@)"), v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v34;
    v42[1] = CFSTR("IMCoreAutomationHookParameterErrorLocation");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/MessagesCore/IMCore/IMCore/Source/Automation Hooks/IMAutomationGroupChat.m", 117);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v43[1] = v35;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IMCoreAutomationHookErrorDomain"), 5, v36);
    v37 = (id)objc_claimAutoreleasedReturnValue();
    if (v37)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v37, "description");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v47 = v39;
          _os_log_impl(&dword_1A1FF4000, v38, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

        }
      }
      if (a6 && !*a6)
        *a6 = objc_retainAutorelease(v37);
    }

LABEL_32:
    v16 = 0;
    goto LABEL_33;
  }
  objc_msgSend(v14, "setDisplayName:", v12);
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, CFSTR("name"));
  v13 = v13;
  v16 = v13;
LABEL_33:

  return v16;
}

- (id)groupParticipantsWithGroupID:(id)a3 timeOut:(double)a4 error:(id *)a5 optArguments:(id)a6
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  BOOL v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t j;
  void *v54;
  NSObject *v55;
  NSObject *v56;
  NSObject *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  NSObject *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  NSObject *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  NSObject *v83;
  void *v84;
  void *v85;
  id obj;
  id v87;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _QWORD v97[2];
  _QWORD v98[2];
  _QWORD v99[2];
  _QWORD v100[2];
  _BYTE v101[128];
  _QWORD v102[2];
  _QWORD v103[2];
  _QWORD v104[2];
  _QWORD v105[2];
  _BYTE v106[128];
  _QWORD v107[2];
  _QWORD v108[2];
  uint8_t buf[4];
  id v110;
  _QWORD v111[2];
  _QWORD v112[5];

  v112[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v87 = a6;
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMCoreAutomationHook existingChatForGroupID:error:results:](self, "existingChatForGroupID:error:results:", v8, a5, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!v10)
    {
      v107[0] = *MEMORY[0x1E0CB2D50];
      v42 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Condition failed : '%s'"), "(chat) == nil");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      +[IMCoreAutomationHook stringFromAutomationErrorCode:](IMCoreAutomationHook, "stringFromAutomationErrorCode:", 5);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "stringWithFormat:", CFSTR("%@ (%@)"), v43, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v108[0] = v45;
      v107[1] = CFSTR("IMCoreAutomationHookParameterErrorLocation");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/MessagesCore/IMCore/IMCore/Source/Automation Hooks/IMAutomationGroupChat.m", 129);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v108[1] = v46;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v108, v107, 2);
      v14 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IMCoreAutomationHookErrorDomain"), 5, v14);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v47 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v13, "description");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v110 = v48;
            _os_log_impl(&dword_1A1FF4000, v47, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

          }
        }
        if (a5 && !*a5)
          *a5 = objc_retainAutorelease(v13);
      }

      goto LABEL_40;
    }
    objc_msgSend(v10, "participants");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v95 = 0u;
    v96 = 0u;
    v93 = 0u;
    v94 = 0u;
    v14 = v12;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v93, v106, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v94;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v94 != v16)
            objc_enumerationMutation(v14);
          v18 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * i);
          objc_msgSend(v18, "ID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v19 == 0;

          if (v20)
          {
            v104[0] = *MEMORY[0x1E0CB2D50];
            v33 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Condition failed : '%s'"), "([handle ID]) == nil");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            +[IMCoreAutomationHook stringFromAutomationErrorCode:](IMCoreAutomationHook, "stringFromAutomationErrorCode:", 5);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "stringWithFormat:", CFSTR("%@ (%@)"), v34, v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v105[0] = v36;
            v104[1] = CFSTR("IMCoreAutomationHookParameterErrorLocation");
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/MessagesCore/IMCore/IMCore/Source/Automation Hooks/IMAutomationGroupChat.m", 135);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v105[1] = v37;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v105, v104, 2);
            v38 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IMCoreAutomationHookErrorDomain"), 5, v38);
            v39 = (id)objc_claimAutoreleasedReturnValue();
            if (v39)
            {
              if (IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v40 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
                {
                  objc_msgSend(v39, "description");
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v110 = v41;
                  _os_log_impl(&dword_1A1FF4000, v40, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

                }
              }
              if (a5 && !*a5)
                *a5 = objc_retainAutorelease(v39);
            }

            goto LABEL_40;
          }
          objc_msgSend(v18, "ID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v21);

        }
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v93, v106, 16);
        if (v15)
          continue;
        break;
      }
    }

    objc_msgSend(v11, "lastAddressedHandleID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "length") == 0;

    if (v23)
    {
      if (objc_msgSend(v11, "joinState") != 3)
        goto LABEL_54;
      objc_msgSend(v11, "account");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v50;
      if (!v50)
      {
        v102[0] = *MEMORY[0x1E0CB2D50];
        v76 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Condition failed : '%s'"), "(account) == nil");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        +[IMCoreAutomationHook stringFromAutomationErrorCode:](IMCoreAutomationHook, "stringFromAutomationErrorCode:", 5);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "stringWithFormat:", CFSTR("%@ (%@)"), v77, v78);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v103[0] = v79;
        v102[1] = CFSTR("IMCoreAutomationHookParameterErrorLocation");
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/MessagesCore/IMCore/IMCore/Source/Automation Hooks/IMAutomationGroupChat.m", 145);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v103[1] = v80;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v103, v102, 2);
        v81 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IMCoreAutomationHookErrorDomain"), 5, v81);
        v82 = (id)objc_claimAutoreleasedReturnValue();
        if (v82)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v83 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v82, "description");
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v110 = v84;
              _os_log_impl(&dword_1A1FF4000, v83, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

            }
          }
          if (a5 && !*a5)
            *a5 = objc_retainAutorelease(v82);
        }

        goto LABEL_40;
      }
      objc_msgSend(v50, "arrayOfAllIMHandles");
      v91 = 0u;
      v92 = 0u;
      v89 = 0u;
      v90 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v101, 16);
      if (v51)
      {
        v52 = *(_QWORD *)v90;
        while (2)
        {
          for (j = 0; j != v51; ++j)
          {
            if (*(_QWORD *)v90 != v52)
              objc_enumerationMutation(obj);
            objc_msgSend(*(id *)(*((_QWORD *)&v89 + 1) + 8 * j), "displayID");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v54)
            {
              v99[0] = *MEMORY[0x1E0CB2D50];
              v68 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Condition failed : '%s'"), "(handleString) == nil");
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              +[IMCoreAutomationHook stringFromAutomationErrorCode:](IMCoreAutomationHook, "stringFromAutomationErrorCode:", 5);
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v68, "stringWithFormat:", CFSTR("%@ (%@)"), v85, v69);
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              v100[0] = v70;
              v99[1] = CFSTR("IMCoreAutomationHookParameterErrorLocation");
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/MessagesCore/IMCore/IMCore/Source/Automation Hooks/IMAutomationGroupChat.m", 150);
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              v100[1] = v71;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v100, v99, 2);
              v72 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IMCoreAutomationHookErrorDomain"), 5, v72);
              v73 = (id)objc_claimAutoreleasedReturnValue();
              if (v73)
              {
                if (IMOSLoggingEnabled())
                {
                  OSLogHandleForIMFoundationCategory();
                  v74 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
                  {
                    objc_msgSend(v73, "description");
                    v75 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412290;
                    v110 = v75;
                    _os_log_impl(&dword_1A1FF4000, v74, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

                  }
                }
                if (a5 && !*a5)
                  *a5 = objc_retainAutorelease(v73);
              }

              goto LABEL_40;
            }
            objc_msgSend(v13, "addObject:", v54);

          }
          v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v101, 16);
          if (v51)
            continue;
          break;
        }
      }

    }
    else
    {
      objc_msgSend(v11, "lastAddressedHandleID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v24);
    }

LABEL_54:
    if (v13)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v55 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v110 = v8;
          _os_log_impl(&dword_1A1FF4000, v55, OS_LOG_TYPE_INFO, "groupParticipantsWithGroupID incoming ID %@ ", buf, 0xCu);
        }

      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v110 = v13;
          _os_log_impl(&dword_1A1FF4000, v56, OS_LOG_TYPE_INFO, "groupParticipantsWithGroupID resulting participants %@ ", buf, 0xCu);
        }

      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v57 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v110 = v11;
          _os_log_impl(&dword_1A1FF4000, v57, OS_LOG_TYPE_INFO, "groupParticipantsWithGroupID resulting chat %@ ", buf, 0xCu);
        }

      }
      objc_msgSend(v9, "setObject:forKey:", v8, CFSTR("group_id"));
      objc_msgSend(v13, "allObjects");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", v58, CFSTR("members"));

      v32 = v9;
      goto LABEL_41;
    }
    v97[0] = *MEMORY[0x1E0CB2D50];
    v59 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Condition failed : '%s'"), "(outList) == nil");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMCoreAutomationHook stringFromAutomationErrorCode:](IMCoreAutomationHook, "stringFromAutomationErrorCode:", 5);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "stringWithFormat:", CFSTR("%@ (%@)"), v60, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v98[0] = v62;
    v97[1] = CFSTR("IMCoreAutomationHookParameterErrorLocation");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/MessagesCore/IMCore/IMCore/Source/Automation Hooks/IMAutomationGroupChat.m", 156);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v98[1] = v63;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v98, v97, 2);
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IMCoreAutomationHookErrorDomain"), 5, v64);
    v65 = (id)objc_claimAutoreleasedReturnValue();
    if (v65)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v66 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v65, "description");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v110 = v67;
          _os_log_impl(&dword_1A1FF4000, v66, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

        }
      }
      if (a5 && !*a5)
        *a5 = objc_retainAutorelease(v65);
    }

LABEL_40:
    v32 = 0;
LABEL_41:

    goto LABEL_42;
  }
  v111[0] = *MEMORY[0x1E0CB2D50];
  v25 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Condition failed : '%s'"), "(groupID) == nil");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMCoreAutomationHook stringFromAutomationErrorCode:](IMCoreAutomationHook, "stringFromAutomationErrorCode:", 5);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringWithFormat:", CFSTR("%@ (%@)"), v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v112[0] = v28;
  v111[1] = CFSTR("IMCoreAutomationHookParameterErrorLocation");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/MessagesCore/IMCore/IMCore/Source/Automation Hooks/IMAutomationGroupChat.m", 126);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v112[1] = v29;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v112, v111, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IMCoreAutomationHookErrorDomain"), 5, v9);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (!v14)
    goto LABEL_21;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v14, "description");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v110 = v31;
      _os_log_impl(&dword_1A1FF4000, v30, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

    }
  }
  if (a5 && !*a5)
  {
    v14 = objc_retainAutorelease(v14);
    v32 = 0;
    *a5 = v14;
    v11 = v14;
  }
  else
  {
LABEL_21:
    v32 = 0;
    v11 = v14;
  }
LABEL_42:

  return v32;
}

- (id)groupNameWithGroupID:(id)a3 timeOut:(double)a4 error:(id *)a5 optArguments:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  _QWORD v34[2];
  _QWORD v35[2];
  uint8_t buf[4];
  void *v37;
  _QWORD v38[2];
  _QWORD v39[3];

  v39[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a6;
  if (!v9)
  {
    v38[0] = *MEMORY[0x1E0CB2D50];
    v17 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Condition failed : '%s'"), "(groupID) == nil");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMCoreAutomationHook stringFromAutomationErrorCode:](IMCoreAutomationHook, "stringFromAutomationErrorCode:", 5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("%@ (%@)"), v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v20;
    v38[1] = CFSTR("IMCoreAutomationHookParameterErrorLocation");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/MessagesCore/IMCore/IMCore/Source/Automation Hooks/IMAutomationGroupChat.m", 168);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IMCoreAutomationHookErrorDomain"), 5, v11);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v13, "description");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v37 = v23;
          _os_log_impl(&dword_1A1FF4000, v22, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

        }
      }
      if (a5 && !*a5)
        *a5 = objc_retainAutorelease(v13);
    }

    goto LABEL_25;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[IMCoreAutomationHook existingChatForGroupID:error:results:](self, "existingChatForGroupID:error:results:", v9, a5, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
    v34[0] = *MEMORY[0x1E0CB2D50];
    v24 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Condition failed : '%s'"), "(chat) == nil");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMCoreAutomationHook stringFromAutomationErrorCode:](IMCoreAutomationHook, "stringFromAutomationErrorCode:", 5);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringWithFormat:", CFSTR("%@ (%@)"), v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v27;
    v34[1] = CFSTR("IMCoreAutomationHookParameterErrorLocation");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/MessagesCore/IMCore/IMCore/Source/Automation Hooks/IMAutomationGroupChat.m", 171);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = v28;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IMCoreAutomationHookErrorDomain"), 5, v29);
    v30 = (id)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v30, "description");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v37 = v32;
          _os_log_impl(&dword_1A1FF4000, v31, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

        }
      }
      if (a5 && !*a5)
        *a5 = objc_retainAutorelease(v30);
    }

LABEL_25:
    v16 = 0;
    goto LABEL_26;
  }
  objc_msgSend(v12, "displayName");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
    v15 = (__CFString *)v14;
  else
    v15 = &stru_1E4725068;
  objc_msgSend(v11, "setObject:forKey:", v15, CFSTR("name"));
  v11 = v11;

  v16 = v11;
LABEL_26:

  return v16;
}

@end
