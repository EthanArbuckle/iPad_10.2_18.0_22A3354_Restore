@implementation IMAutomationMessageSend

- (IMAutomationMessageSend)init
{
  IMAutomationMessageSend *v2;
  NSMutableSet *v3;
  NSMutableSet *pendingSendGUIDs;
  NSMutableDictionary *v5;
  NSMutableDictionary *sentMessageInfo;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IMAutomationMessageSend;
  v2 = -[IMAutomationMessageSend init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    pendingSendGUIDs = v2->_pendingSendGUIDs;
    v2->_pendingSendGUIDs = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    sentMessageInfo = v2->_sentMessageInfo;
    v2->_sentMessageInfo = v5;

  }
  return v2;
}

- (id)createIMMessageToSendWithMessage:(id)a3 filePaths:(id)a4 bundleID:(id)a5 attributionInfoName:(id)a6 isAudioMessage:(BOOL)a7 threadIdentifier:(id)a8
{
  id v12;
  id v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  _BOOL4 v33;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  id v41;
  _QWORD v42[3];
  _QWORD v43[3];
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  id v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v33 = a7;
  v50 = *MEMORY[0x1E0C80C00];
  v36 = a3;
  v12 = a4;
  v13 = a5;
  v41 = a6;
  v35 = a8;
  v40 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v12, "count"))
  {
    v14 = 0;
    v39 = *MEMORY[0x1E0D37F30];
    v38 = *MEMORY[0x1E0D37F20];
    v37 = *MEMORY[0x1E0D37F18];
    do
    {
      v15 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(v12, "objectAtIndex:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "fileURLWithPath:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      +[IMFileTransferCenter sharedInstance](IMFileTransferCenter, "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "createNewOutgoingTransferWithLocalFileURL:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v13, "length") && objc_msgSend(v41, "length"))
      {
        +[IMFileTransferCenter sharedInstance](IMFileTransferCenter, "sharedInstance");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "transferForGUID:", v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        IMBalloonExtensionIDWithSuffix();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412802;
            v45 = v22;
            v46 = 2112;
            v47 = v41;
            v48 = 2112;
            v49 = v19;
            _os_log_impl(&dword_1A1FF4000, v23, OS_LOG_TYPE_INFO, "createIMMessageToSendWithMessage, setting bundleID value to %@ and attribution info name %@ on transferGUID %@", buf, 0x20u);
          }

        }
        v42[0] = v39;
        v42[1] = v38;
        v43[0] = v22;
        v43[1] = v41;
        v42[2] = v37;
        v43[2] = &unk_1E475ED18;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 3);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setAttributionInfo:", v24);

        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v21, "attributionInfo");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v45 = v26;
            _os_log_impl(&dword_1A1FF4000, v25, OS_LOG_TYPE_INFO, "createIMMessageToSendWithMessage, attribution info %@", buf, 0xCu);

          }
        }

      }
      objc_msgSend(v40, "addObject:", v19);
      +[IMFileTransferCenter sharedInstance](IMFileTransferCenter, "sharedInstance");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "registerTransferWithDaemon:", v19);

      ++v14;
    }
    while (objc_msgSend(v12, "count") > v14);
  }
  if (objc_msgSend(v40, "count"))
  {
    -[IMAutomationMessageSend appendFilePathsWithGUIDs:withText:](self, "appendFilePathsWithGUIDs:withText:", v40, v36);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
      v29 = 2097157;
    else
      v29 = 5;
    +[IMMessage instantMessageWithText:messageSubject:fileTransferGUIDs:flags:threadIdentifier:](IMMessage, "instantMessageWithText:messageSubject:fileTransferGUIDs:flags:threadIdentifier:", v28, 0, v40, v29, v35);
    v30 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v36, "length"))
    {
      v31 = 0;
      goto LABEL_23;
    }
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v36, 0);
    +[IMMessage instantMessageWithText:flags:threadIdentifier:](IMMessage, "instantMessageWithText:flags:threadIdentifier:", v28, 5, v35);
    v30 = objc_claimAutoreleasedReturnValue();
  }
  v31 = (void *)v30;

LABEL_23:
  return v31;
}

- (id)sendMessage:(id)a3 destinationID:(id)a4 filePaths:(id)a5 groupID:(id)a6 service:(id)a7 timeOut:(double)a8 error:(id *)a9
{
  return -[IMAutomationMessageSend sendMessage:destinationID:filePaths:groupID:bundleID:attributionInfoName:service:timeOut:error:](self, "sendMessage:destinationID:filePaths:groupID:bundleID:attributionInfoName:service:timeOut:error:", a3, a4, a5, a6, 0, 0, 10.0, a7, a9);
}

- (id)sendMessage:(id)a3 destinationID:(id)a4 filePaths:(id)a5 groupID:(id)a6 bundleID:(id)a7 attributionInfoName:(id)a8 service:(id)a9 timeOut:(double)a10 error:(id *)a11
{
  return -[IMAutomationMessageSend sendMessage:destinationID:filePaths:isAudioMessage:groupID:bundleID:attributionInfoName:service:timeOut:threadIdentifier:error:](self, "sendMessage:destinationID:filePaths:isAudioMessage:groupID:bundleID:attributionInfoName:service:timeOut:threadIdentifier:error:", a3, a4, a5, 0, a6, a7, a10, a8, a9, 0, a11);
}

- (id)sendMessage:(id)a3 destinationID:(id)a4 timeOut:(double)a5 threadIdentifier:(id)a6 error:(id *)a7
{
  return -[IMAutomationMessageSend sendMessage:destinationID:filePaths:isAudioMessage:groupID:bundleID:attributionInfoName:service:timeOut:threadIdentifier:error:](self, "sendMessage:destinationID:filePaths:isAudioMessage:groupID:bundleID:attributionInfoName:service:timeOut:threadIdentifier:error:", a3, a4, 0, 0, 0, 0, a5, 0, 0, a6, a7);
}

- (id)sendMessage:(id)a3 destinationID:(id)a4 filePaths:(id)a5 isAudioMessage:(BOOL)a6 groupID:(id)a7 bundleID:(id)a8 attributionInfoName:(id)a9 service:(id)a10 timeOut:(double)a11 threadIdentifier:(id)a12 error:(id *)a13
{
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  BOOL v31;
  char v32;
  NSObject *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  id v42;
  void *v43;
  _BOOL4 v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  uint8_t buf[4];
  id v51;
  __int16 v52;
  id v53;
  __int16 v54;
  id v55;
  __int16 v56;
  id v57;
  __int16 v58;
  id v59;
  __int16 v60;
  double v61;
  uint64_t v62;

  v44 = a6;
  v62 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v49 = a4;
  v20 = a5;
  v21 = a7;
  v47 = a8;
  v48 = a9;
  v46 = a10;
  v45 = a12;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413570;
      v51 = v19;
      v52 = 2112;
      v53 = v49;
      v54 = 2112;
      v55 = v20;
      v56 = 2112;
      v57 = v47;
      v58 = 2112;
      v59 = v48;
      v60 = 2048;
      v61 = a11;
      _os_log_impl(&dword_1A1FF4000, v22, OS_LOG_TYPE_INFO, "sendMessageSync messageText %@ handle %@ filePaths %@ bundleID %@ attributionInfoName %@ timeout: %f", buf, 0x3Eu);
    }

  }
  v23 = objc_alloc_init(MEMORY[0x1E0C99D80]);
  v24 = objc_msgSend(v21, "length");
  v25 = objc_msgSend(v19, "length");
  if (v24)
  {
    if (v20 && v25)
    {
LABEL_8:
      v26 = v24 == 0;
      v42 = -[IMAutomationMessageSend copyFilePathsToTmpLocation:](self, "copyFilePathsToTmpLocation:", v20);
      if (v46)
        v27 = v46;
      else
        v27 = (id)*MEMORY[0x1E0D38F68];
      +[IMServiceImpl serviceWithInternalName:](IMServiceImpl, "serviceWithInternalName:", v27, v42);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "bestAccountForService:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v29, "imHandleWithID:", v49);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        +[IMChatRegistry sharedRegistry](IMChatRegistry, "sharedRegistry");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "chatWithHandle:", v36);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        +[IMChatRegistry sharedRegistry](IMChatRegistry, "sharedRegistry");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "existingChatWithGroupID:", v21);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
      }

      if (v30)
      {
        -[IMAutomationMessageSend createIMMessageToSendWithMessage:filePaths:bundleID:attributionInfoName:isAudioMessage:threadIdentifier:](self, "createIMMessageToSendWithMessage:filePaths:bundleID:attributionInfoName:isAudioMessage:threadIdentifier:", v19, v43, v47, v48, v44, v45);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMAutomationMessageSend _sendIMMessage:chat:service:timeOut:resultDict:error:](self, "_sendIMMessage:chat:service:timeOut:resultDict:error:", v38, v30, v28, v23, a13, a11);
        v39 = objc_claimAutoreleasedReturnValue();

        v23 = (id)v39;
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v51 = v23;
          _os_log_impl(&dword_1A1FF4000, v40, OS_LOG_TYPE_INFO, "SendMessage returning resultDir:%@", buf, 0xCu);
        }

      }
      v34 = v23;

      goto LABEL_34;
    }
  }
  else
  {
    v31 = v20 == 0;
    if (objc_msgSend(v19, "length"))
      v31 = 0;
    if (objc_msgSend(v49, "length"))
      v32 = v31;
    else
      v32 = 1;
    if ((v32 & 1) == 0)
      goto LABEL_8;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v33, OS_LOG_TYPE_INFO, "Invalid parameters", buf, 2u);
    }

  }
  if (a13)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.private.IMCore.IMAutomationMessageSend"), 2, 0);
    *a13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v34 = v23;
LABEL_34:

  return v34;
}

- (id)sendIMMessage:(id)a3 chat:(id)a4 timeOut:(double)a5 resultDict:(id)a6 error:(id *)a7
{
  return -[IMAutomationMessageSend _sendIMMessage:chat:service:timeOut:resultDict:error:](self, "_sendIMMessage:chat:service:timeOut:resultDict:error:", a3, a4, 0, a6, a7, a5);
}

- (id)_sendIMMessage:(id)a3 chat:(id)a4 service:(id)a5 timeOut:(double)a6 resultDict:(id)a7 error:(id *)a8
{
  id v12;
  id v13;
  id v14;
  id v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  const __CFString *v22;
  void *v23;
  NSObject *v24;
  int v26;
  id v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v15);
  objc_msgSend(v12, "guid");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString setObject:forKey:](v16, "setObject:forKey:", v17, CFSTR("GUID"));
  -[IMAutomationMessageSend pendingSendGUIDs](self, "pendingSendGUIDs");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObject:", v17);

  +[IMChatRegistry sharedRegistry](IMChatRegistry, "sharedRegistry");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "_setPostMessageSentNotifications:", 1);

  objc_msgSend(v13, "refreshServiceForSending");
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v12, "plainBody");
      v21 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "isTypingMessage"))
        v22 = CFSTR("YES");
      else
        v22 = CFSTR("NO");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v12, "flags"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138412802;
      v27 = v21;
      v28 = 2112;
      v29 = v22;
      v30 = 2112;
      v31 = v23;
      _os_log_impl(&dword_1A1FF4000, v20, OS_LOG_TYPE_INFO, "messageToSend body:%@ isTyping message %@ flags %@", (uint8_t *)&v26, 0x20u);

    }
  }
  if (v14)
    objc_msgSend(v13, "sendMessage:onService:", v12, v14);
  else
    objc_msgSend(v13, "sendMessage:", v12);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v26 = 138412546;
      v27 = v17;
      v28 = 2112;
      v29 = v16;
      _os_log_impl(&dword_1A1FF4000, v24, OS_LOG_TYPE_INFO, "Sent IMmessage %@ resultDir:%@", (uint8_t *)&v26, 0x16u);
    }

  }
  return v16;
}

- (id)loadHighResolutionFileForMessageGUID:(id)a3 withFilePathIndex:(int64_t)a4
{
  id v5;
  const void *v6;
  const __CFArray *v7;
  const __CFArray *v8;
  id v9;
  CFTypeRef cf;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_1A200AE84;
  v17 = sub_1A200ACB4;
  v18 = 0;
  v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = (const void *)IMDMessageRecordCopyMessageForGUID();
  if (v6)
  {
    v7 = (const __CFArray *)IMDMessageRecordCopyAttachments();
    v8 = v7;
    if (a4 < 0 || !v7)
    {
      if (!v7)
      {
LABEL_8:
        CFRelease(v6);
        goto LABEL_9;
      }
    }
    else if (CFArrayGetCount(v7) > a4)
    {
      CFArrayGetValueAtIndex(v8, a4);
      v12 = 0;
      cf = 0;
      _IMDAttachmentRecordBulkCopy();
    }
    CFRelease(v8);
    goto LABEL_8;
  }
LABEL_9:
  v9 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v9;
}

- (id)deleteAttachmentWithMessageGUID:(id)a3 andFilePathIndex:(int64_t)a4
{
  return objc_alloc_init(MEMORY[0x1E0C99E08]);
}

- (id)clearAttachmentsUploadedToCloudkit
{
  return objc_alloc_init(MEMORY[0x1E0C99E08]);
}

- (id)uploadAttachmentToCloudkitWithMessageGUID:(id)a3 andFilePathIndex:(int64_t)a4
{
  return objc_alloc_init(MEMORY[0x1E0C99E08]);
}

- (id)fileSizeForMessageGUID:(id)a3 withFilePathIndex:(int64_t)a4
{
  id v5;
  id v6;
  uint64_t v7;
  const void *v8;
  const __CFArray *v9;
  const __CFArray *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7 = IMDMessageRecordCopyMessageForGUID();
  if (v7)
  {
    v8 = (const void *)v7;
    v9 = (const __CFArray *)IMDMessageRecordCopyAttachments();
    v10 = v9;
    if (a4 < 0 || !v9)
    {
      if (!v9)
      {
LABEL_9:
        CFRelease(v8);
        goto LABEL_10;
      }
    }
    else if (CFArrayGetCount(v9) > a4)
    {
      CFArrayGetValueAtIndex(v10, a4);
      v12 = 0;
      v13 = 0;
      _IMDAttachmentRecordBulkCopy();
    }
    CFRelease(v10);
    goto LABEL_9;
  }
  objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("Could not find IMDMessageRecordRef with message guid"), CFSTR("error"));
LABEL_10:

  return v6;
}

- (id)dictionaryFromGUID:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  const void *v6;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  CFTypeRef v29;
  uint64_t v30;
  CFTypeRef cf;
  uint64_t v32;
  CFTypeRef v33;
  __int128 v34;
  uint64_t v35;
  CFTypeRef v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  CFTypeRef v42;
  uint64_t v43;
  uint64_t v44;
  CFTypeRef v45;
  __int16 v46;
  uint64_t v47;
  uint64_t v48;
  CFTypeRef v49;
  uint64_t v50;
  CFTypeRef v51;
  CFTypeRef v52;
  CFTypeRef v53;
  CFTypeRef v54;
  CFTypeRef v55;
  CFTypeRef v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  CFTypeRef v61;
  uint64_t v62;
  uint64_t v63;

  v3 = a3;
  if (qword_1EE65F628 != -1)
    dispatch_once(&qword_1EE65F628, &unk_1E471D938);
  if (qword_1EE65F638 != -1)
    dispatch_once(&qword_1EE65F638, &unk_1E4721F60);
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = off_1EE65F620(v3);
  if (v5)
  {
    v6 = (const void *)v5;
    v62 = 0;
    v63 = 0;
    v60 = 0;
    v61 = 0;
    v58 = 0;
    v59 = 0;
    v56 = 0;
    v57 = 0;
    v54 = 0;
    v55 = 0;
    v52 = 0;
    v53 = 0;
    v50 = 0;
    v51 = 0;
    v48 = 0;
    v49 = 0;
    v47 = 0;
    v46 = 0;
    v44 = 0;
    v45 = 0;
    v42 = 0;
    v43 = 0;
    v40 = 0;
    v41 = 0;
    v38 = 0;
    v39 = 0;
    v36 = 0;
    v37 = 0;
    v35 = 0;
    v34 = 0u;
    v32 = 0;
    v33 = 0;
    v30 = 0;
    cf = 0;
    v29 = 0;
    off_1EE65F630(v5, &v43, &v63, &v62, &v61, &v60, &v59, &v58, &v57, &v56, &v55, &v54, &v53, &v52, &v51, &v50, &v49, &v48, &v47,
      (char *)&v46 + 1,
      &v46,
      &v45,
      &v41,
      &v42,
      &v38,
      &v39,
      &v40,
      &v44,
      &v37,
      &v36,
      &v35,
      &v34,
      0,
      &cf,
      &v33,
      &v32,
      &v30,
      0,
      0,
      0,
      0,
      &v29,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0);
    if (v61)
    {
      if (v43)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("itemType"));

      }
      if (v63)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("messageID"));

      }
      if (v62)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("replaceID"));

      }
      if (v61)
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v61, CFSTR("GUID"));
      if (v60)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("date"));

      }
      if (v59)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("date-read"));

      }
      if (v58)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("date-delivered"));

      }
      if (v57)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("datePlayed"));

      }
      if (v56)
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v56, CFSTR("body"));
      if (v55)
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v55, CFSTR("attributedBody"));
      if (v54)
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v54, CFSTR("flags"));
      if (v53)
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v53, CFSTR("service"));
      if (v52)
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v52, CFSTR("account"));
      if (v51)
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v51, CFSTR("accountGUID"));
      if (v50)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("handleID"));

      }
      if (v49)
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v49, CFSTR("messageSubject"));
      if (v48)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("error"));

      }
      if (v47)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("type"));

      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", HIBYTE(v46) != 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("hasAttachments"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (_BYTE)v46 != 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, CFSTR("wasDDScanned"));

      if (v45)
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v45, CFSTR("roomnames"));
      if (v41)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, CFSTR("otherHandleID"));

      }
      if (v42)
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v42, CFSTR("groupTitle"));
      if (v38)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, CFSTR("groupActionType"));

      }
      if (v39)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, CFSTR("shareStatus"));

      }
      if (v40)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, CFSTR("shareDirection"));

      }
      if (v44)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, CFSTR("expireState"));

      }
      if (v37)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v24, CFSTR("messageActionType"));

      }
      if (v36)
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v36, CFSTR("associatedMessageGUID"));
      if (v35)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v25, CFSTR("associatedMessageType"));

      }
      if (cf)
        objc_msgSend(v4, "setObject:forKeyedSubscript:", cf, CFSTR("payloadData"));
      if (v33)
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v33, CFSTR("expressiveSendStyleID"));
      if (v32)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v26, CFSTR("timePlayedExpressiveSend"));

      }
      if (v30)
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v30, CFSTR("messageSummaryInfo"));
      if (v29)
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v29, CFSTR("destinationCallerID"));
      if (v61)
        CFRelease(v61);
    }
    if (v56)
      CFRelease(v56);
    if (v42)
      CFRelease(v42);
    if (v55)
      CFRelease(v55);
    if (cf)
      CFRelease(cf);
    if (v54)
      CFRelease(v54);
    if (v53)
      CFRelease(v53);
    if (v52)
      CFRelease(v52);
    if (v51)
      CFRelease(v51);
    if (v49)
      CFRelease(v49);
    if (v45)
      CFRelease(v45);
    if (v36)
      CFRelease(v36);
    if (v33)
      CFRelease(v33);
    if (v29)
      CFRelease(v29);
    CFRelease(v6);
  }
  v27 = v4;

  return v27;
}

- (NSMutableSet)pendingSendGUIDs
{
  return self->_pendingSendGUIDs;
}

- (void)setPendingSendGUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_pendingSendGUIDs, a3);
}

- (NSMutableDictionary)sentMessageInfo
{
  return self->_sentMessageInfo;
}

- (void)setSentMessageInfo:(id)a3
{
  objc_storeStrong((id *)&self->_sentMessageInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sentMessageInfo, 0);
  objc_storeStrong((id *)&self->_pendingSendGUIDs, 0);
}

- (id)copyFilePathsToTmpLocation:(id)a3
{
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  __int128 v19;
  id v20;
  id obj;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  id v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
  if (v4)
  {
    v6 = *(_QWORD *)v25;
    *(_QWORD *)&v5 = 138412290;
    v19 = v5;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v25 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v8, "componentsSeparatedByString:", CFSTR("/"), v19);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        IMSafeTemporaryDirectory();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "lastObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v11;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "im_URLByAppendingPathComponents:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "path");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        -[IMAutomationMessageSend deleteTmpFilePath:](self, "deleteTmpFilePath:", v14);
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 0;
        LODWORD(v11) = objc_msgSend(v15, "copyItemAtPath:toPath:error:", v8, v14, &v23);
        v16 = v23;

        if ((_DWORD)v11)
        {
          objc_msgSend(v20, "addObject:", v14);
        }
        else if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v19;
            v29 = v16;
            _os_log_impl(&dword_1A1FF4000, v17, OS_LOG_TYPE_INFO, "Error occurred copying attachment files to tmp path: %@", buf, 0xCu);
          }

        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
    }
    while (v4);
  }

  return v20;
}

- (void)deleteTmpFilePath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "fileExistsAtPath:", v3) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    v6 = objc_msgSend(v5, "removeItemAtPath:error:", v3, &v9);
    v7 = v9;

    if ((v6 & 1) == 0 && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v11 = v7;
        _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "Error occurred deleting tmp attachment file: %@", buf, 0xCu);
      }

    }
  }
  else
  {

    v7 = 0;
  }

}

- (id)appendFilePathsWithGUIDs:(id)a3 withText:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  int v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v25;
  id v26;
  __int16 v27;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v9 = objc_msgSend(v6, "length");
  v10 = (uint64_t *)MEMORY[0x1E0D366B8];
  v11 = 0x1E0CB3000uLL;
  v25 = v6;
  if (v9)
  {
    NSLog(CFSTR("valid text"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v12, *v10);

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v6, v8);
    objc_msgSend(v7, "appendAttributedString:", v13);

    v14 = 1;
  }
  else
  {
    v14 = 0;
  }
  v26 = v7;
  if (objc_msgSend(v5, "count"))
  {
    v15 = 0;
    v16 = *v10;
    v17 = *MEMORY[0x1E0D36430];
    do
    {
      objc_msgSend(v5, "objectAtIndex:", v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);

        objc_msgSend(*(id *)(v11 + 2024), "numberWithUnsignedInteger:", v14);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKey:", v20, v16);

        objc_msgSend(v19, "setObject:forKey:", v18, v17);
        ++v14;
        v27 = -4;
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCharacters:length:", &v27, 1);
        v22 = v11;
        v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v21, v19);
        objc_msgSend(v26, "appendAttributedString:", v23);

        v11 = v22;
        v8 = v19;
      }

      ++v15;
    }
    while (objc_msgSend(v5, "count") > v15);
  }

  return v26;
}

@end
