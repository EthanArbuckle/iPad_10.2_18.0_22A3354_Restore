@implementation IMCommSafetySummary

+ (id)primaryiCloudAccountIdentifier
{
  if (qword_1EE65F658 != -1)
    dispatch_once(&qword_1EE65F658, &unk_1E471DA38);
  return (id)qword_1EE65F650;
}

+ (id)recipientStrings:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v3, "participants", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
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
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "ID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (MEMORY[0x1A858280C]())
        {
          IMFormattedDisplayStringForNumber();
          v11 = objc_claimAutoreleasedReturnValue();

          v10 = (void *)v11;
        }
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

+ (void)registerEvent:(unint64_t)a3 eventType:(unint64_t)a4 messageGUID:(id)a5 chat:(id)a6 forImages:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  uint8_t buf[4];
  unint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v12 = a5;
  v13 = a6;
  v14 = a7;
  objc_msgSend(MEMORY[0x1E0D397A0], "sharedManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v15, "shouldNotifyParentAboutSensitivePhotos") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D397A0], "sharedManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "childIsYoungAgeGroup");

    if ((v17 & 1) != 0)
    {
      +[IMCommSafetySummary primaryiCloudAccountIdentifier](IMCommSafetySummary, "primaryiCloudAccountIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MGCopyAnswer();
      if (v12)
      {
        objc_msgSend(v13, "messageForGUID:", v12);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (v19)
        {
          objc_msgSend(v19, "sender");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "ID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v22 = 0;
        }

      }
      else
      {
        v22 = 0;
      }
      if (MEMORY[0x1A858280C](v22))
      {
        IMFormattedDisplayStringForNumber();
        v24 = objc_claimAutoreleasedReturnValue();

        v22 = (void *)v24;
      }
      objc_msgSend(a1, "registerEvent:eventType:messageGUID:chat:forImages:childID:deviceID:senderID:eventSender:", a3, a4, v12, v13, v14, v25, v18, v22, &unk_1E471DD18);

      goto LABEL_17;
    }
  }
  else
  {

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v27 = a4;
      _os_log_impl(&dword_1A1FF4000, v23, OS_LOG_TYPE_INFO, "Not registering event %lu because setting is not enabled!", buf, 0xCu);
    }

  }
LABEL_17:

}

+ (void)registerEvent:(unint64_t)a3 eventType:(unint64_t)a4 messageGUID:(id)a5 chat:(id)a6 forImages:(id)a7 childID:(id)a8 deviceID:(id)a9 senderID:(id)a10 eventSender:(id)a11
{
  id v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id obj;
  uint64_t v44;
  void (**v46)(id, void *, void *);
  void *v47;
  id v48;
  id v49;
  void *v50;
  uint64_t v51;
  id v53;
  void *v54;
  void *v55;
  id v56;
  void *context;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t i;
  void *v64;
  void *v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint8_t buf[4];
  unint64_t v71;
  __int16 v72;
  unint64_t v73;
  __int16 v74;
  id v75;
  __int16 v76;
  void *v77;
  __int16 v78;
  void *v79;
  __int16 v80;
  void *v81;
  __int16 v82;
  void *v83;
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v56 = a5;
  v42 = a6;
  v14 = a7;
  v49 = a8;
  v48 = a9;
  v53 = a10;
  v46 = (void (**)(id, void *, void *))a11;
  +[IMChatRegistry sharedRegistry](IMChatRegistry, "sharedRegistry");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "chatIdentifier");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "messagesURLWithChat:", v42);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMCommSafetySummary recipientStrings:](IMCommSafetySummary, "recipientStrings:", v42);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    v15 = objc_alloc(MEMORY[0x1E0D025F0]);
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "timeIntervalSinceReferenceDate");
    v17 = (void *)objc_msgSend(v15, "initWithChildID:deviceID:sourceBundleID:absoluteTimeStamp:eventDirection:eventType:contentType:contactHandles:contentID:conversationID:imageData:senderHandle:contentURL:conversationURL:", v49, v48, CFSTR("com.apple.MobileSMS"), a3, a4, 0, v47, &stru_1E4725068, v54, 0, 0, 0, v55);

    v46[2](v46, v17, v17);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v71 = a4;
        _os_log_impl(&dword_1A1FF4000, v18, OS_LOG_TYPE_INFO, "Registered event of type %lu with Biome", buf, 0xCu);
      }

    }
  }
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  obj = v14;
  v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v84, 16);
  if (v51)
  {
    v44 = *(_QWORD *)v67;
    do
    {
      for (i = 0; i != v51; ++i)
      {
        if (*(_QWORD *)v67 != v44)
          objc_enumerationMutation(obj);
        v65 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
        context = (void *)MEMORY[0x1A8582D94]();
        objc_msgSend(v65, "imageData");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = (void *)IMRescaledImageDataFromDataForBiomeDonation();

        if (v56)
          objc_msgSend(v50, "messagesURLWithMessageGUID:", v56);
        else
          objc_msgSend(v50, "messagesURLWithChat:", v42);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_alloc(MEMORY[0x1E0D025F0]);
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "timeIntervalSinceReferenceDate");
        v23 = v22;
        objc_msgSend(v65, "identifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)objc_msgSend(v20, "initWithChildID:deviceID:sourceBundleID:absoluteTimeStamp:eventDirection:eventType:contentType:contactHandles:contentID:conversationID:imageData:senderHandle:contentURL:conversationURL:", v49, v48, CFSTR("com.apple.MobileSMS"), a3, a4, 0, v23, v47, v24, v54, v62, v53, v64, v55);

        v58 = objc_alloc(MEMORY[0x1E0D025F0]);
        objc_msgSend(v25, "childID");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "deviceID");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "sourceBundleID");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "absoluteTimestamp");
        v27 = v26;
        v28 = objc_msgSend(v25, "eventDirection");
        v29 = objc_msgSend(v25, "eventType");
        v30 = objc_msgSend(v25, "contentType");
        objc_msgSend(v25, "contactHandles");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "contentID");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "conversationID");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "senderHandle");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "contentURL");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "conversationURL");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (void *)objc_msgSend(v58, "initWithChildID:deviceID:sourceBundleID:absoluteTimeStamp:eventDirection:eventType:contentType:contactHandles:contentID:conversationID:imageData:senderHandle:contentURL:conversationURL:", v60, v61, v59, v28, v29, v30, v27, v31, v32, v33, 0, v34, v35, v36);

        v46[2](v46, v25, v37);
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v65, "identifier");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "absoluteString");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "absoluteString");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413826;
            v71 = (unint64_t)v56;
            v72 = 2048;
            v73 = a4;
            v74 = 2112;
            v75 = v53;
            v76 = 2112;
            v77 = v39;
            v78 = 2112;
            v79 = v40;
            v80 = 2112;
            v81 = v54;
            v82 = 2112;
            v83 = v41;
            _os_log_impl(&dword_1A1FF4000, v38, OS_LOG_TYPE_INFO, "Registered event with messageGUID %@, of type %lu, sender %@, contentID %@, contentURL %@, conversationID %@, conversationURL %@ with Biome", buf, 0x48u);

          }
        }

        objc_autoreleasePoolPop(context);
      }
      v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v84, 16);
    }
    while (v51);
  }

}

@end
