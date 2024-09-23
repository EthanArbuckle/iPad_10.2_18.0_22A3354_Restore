@implementation IMDRelayUtilities

+ (id)relayPartsFor:(id)a3 overridingAttachmentData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __CFString *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  id v32;
  void *v33;
  _QWORD v34[2];
  _QWORD v35[3];
  _QWORD v36[3];
  void *v37;
  _QWORD v38[4];
  _QWORD v39[4];
  uint8_t buf[4];
  const __CFString *v41;
  __int16 v42;
  const __CFString *v43;
  _QWORD v44[2];
  _QWORD v45[2];
  _QWORD v46[4];

  v46[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "fileTransferGUIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    objc_msgSend(v6, "fileTransferGUIDs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

    +[IMDAttachmentStore sharedInstance](IMDAttachmentStore, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "attachmentWithGUID:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      if (IMOSLoggingEnabled(v14))
      {
        OSLogHandleForIMFoundationCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v41 = v11;
          _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "No transfer found for %@", buf, 0xCu);
        }
        goto LABEL_12;
      }
LABEL_13:
      v19 = 0;
      goto LABEL_27;
    }
    v15 = objc_msgSend(v13, "isInThumbnailState");
    if ((_DWORD)v15)
    {
      if (IMOSLoggingEnabled(v15))
      {
        OSLogHandleForIMFoundationCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v13, "guid");
          v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v41 = v17;
          _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Transfer found in thumbnail state, aborting relay %@", buf, 0xCu);

        }
LABEL_12:

        goto LABEL_13;
      }
      goto LABEL_13;
    }
    if (v7)
    {
      v32 = v7;
    }
    else
    {
      objc_msgSend(a1, "loadDataForTransfer:", v13);
      v32 = (id)objc_claimAutoreleasedReturnValue();
      if (!v32)
      {
        if (!IMOSLoggingEnabled(0))
          goto LABEL_13;
        OSLogHandleForIMFoundationCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v41 = CFSTR("YES");
          v42 = 2112;
          v43 = CFSTR("NO");
          _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "No transfer(%@) or data(%@) found ", buf, 0x16u);
        }
        goto LABEL_12;
      }
    }
    v38[0] = IMDCTPartDictionaryContentTypeKey;
    objc_msgSend(v13, "mimeType", v32);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v13, "mimeType");
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = CFSTR("application/octet-stream");
    }
    v39[0] = v21;
    v39[1] = CFSTR("0.file");
    v38[1] = IMDCTPartDictionaryContentIDKey;
    v38[2] = IMDCTPartDictionaryContentLocationKey;
    objc_msgSend(v13, "filename");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "lastPathComponent");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v39[2] = v23;
    v38[3] = IMDCTPartDictionaryContentDataKey;
    v39[3] = v33;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    v37 = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    CreateSMILStringForMessageParts(v25);
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (IMOSLoggingEnabled(v27))
    {
      OSLogHandleForIMFoundationCategory();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v41 = v26;
        _os_log_impl(&dword_1D1413000, v28, OS_LOG_TYPE_INFO, "Generated SMIL string: %@", buf, 0xCu);
      }

    }
    v35[0] = IMDCTPartDictionaryContentTypeKey;
    v35[1] = IMDCTPartDictionaryContentIDKey;
    v36[0] = IMDCTPartDictionaryContentTypeSMILKey;
    v36[1] = CFSTR("0.smil");
    v35[2] = IMDCTPartDictionaryContentDataKey;
    -[__CFString dataUsingEncoding:](v26, "dataUsingEncoding:", 4);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v36[2] = v29;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 3);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v34[0] = v30;
    v34[1] = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[IMDTelephonyServiceSession getPlainTextForMessage:processedMessageItem:](IMDTelephonyServiceSession, "getPlainTextForMessage:processedMessageItem:", v6, v6);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v45[0] = CFSTR("text/plain");
    v44[0] = IMDCTPartDictionaryContentTypeKey;
    v44[1] = IMDCTPartDictionaryContentDataKey;
    -[__CFString dataUsingEncoding:](v11, "dataUsingEncoding:", 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v45[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_27:

  return v19;
}

+ (id)plainTextRelayPartWithString:(id)a3 index:(int64_t)a4
{
  id v4;
  __CFDictionary *v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    CFDictionarySetValue(v5, IMDCTPartDictionaryContentTypeKey, CFSTR("text/plain"));
    objc_msgSend(v4, "dataUsingEncoding:", 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      CFDictionarySetValue(v5, IMDCTPartDictionaryContentDataKey, v6);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)loadDataForTransfer:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x1E0C99D50];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "localPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "initWithContentsOfFile:", v6);
  return v7;
}

@end
