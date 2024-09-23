void __XPCServerIMDMessageRecordCopyNewestFailedOutgoingMessagesToLimitAfterDate_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _BOOL4 v6;
  _QWORD v7[8];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1ABC33A40;
  v7[3] = &unk_1E5ABF5C0;
  v7[6] = a5;
  v7[7] = a6;
  v7[4] = a3;
  v7[5] = a4;
  v6 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1ABC33A40(_QWORD *a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  xpc_object_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  xpc_object_t v11;
  void *v12;
  uint64_t result;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = (void *)IMDMessageRecordCopyNewestFailedOutgoingMessagesToLimitAfterDate(a1[6], a1[7]);
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = a1[6];
      v5 = a1[7];
      v14 = 134218496;
      v15 = v5;
      v16 = 2048;
      v17 = v4;
      v18 = 2048;
      v19 = objc_msgSend(v2, "count");
      _os_log_impl(&dword_1ABB60000, v3, OS_LOG_TYPE_INFO, "Copy newest failed outgoing messages up to date: %lld  limit: %lld   (Result: %lu)", (uint8_t *)&v14, 0x20u);
    }
  }
  v6 = xpc_array_create(0, 0);
  if (v6)
  {
    v7 = objc_msgSend(v2, "count");
    if (v7 >= 1)
    {
      v8 = 0;
      v9 = v7;
      do
      {
        v10 = objc_msgSend(v2, "objectAtIndex:", v8);
        v11 = xpc_dictionary_create(0, 0, 0);
        if (v11)
        {
          _IMDMessageRecordBulkCopyXPCDictionary(v10, (uint64_t)v11, 1, 0);
          xpc_array_append_value(v6, v11);
          xpc_release(v11);
        }
        ++v8;
      }
      while (v9 != v8);
    }
    v12 = (void *)a1[4];
    if (v12)
      xpc_dictionary_set_value(v12, "array_result", v6);
    xpc_release(v6);
  }
  if (v2)
    CFRelease(v2);
  result = a1[5];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDMessageRecordCopyMostRecentUseageOfAddresses_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _BOOL4 v5;
  _QWORD v6[7];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1ABC33C74;
  v6[3] = &unk_1E5ABF480;
  v6[4] = a5;
  v6[5] = a3;
  v6[6] = a4;
  v5 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1ABC33C74(uint64_t a1)
{
  void *v2;
  xpc_object_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  xpc_object_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t result;
  int v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = (void *)IMDMessageRecordCopyMostRecentUseageOfAddresses(*(const __CFArray **)(a1 + 32));
  v3 = xpc_array_create(0, 0);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v2, "count");
    if (v5 >= 1)
    {
      v6 = 0;
      v7 = v5;
      do
      {
        v8 = (void *)objc_msgSend(v2, "objectAtIndex:", v6);
        v9 = xpc_dictionary_create(0, 0, 0);
        if (v9)
        {
          v10 = v9;
          xpc_array_set_string(v4, 0xFFFFFFFFFFFFFFFFLL, (const char *)objc_msgSend(v8, "UTF8String"));
          xpc_release(v10);
        }
        ++v6;
      }
      while (v7 != v6);
    }
    v11 = *(void **)(a1 + 40);
    if (v11)
      xpc_dictionary_set_value(v11, "array_result", v4);
    xpc_release(v4);
  }
  if (IMOSLoggingEnabled())
  {
    v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = *(_QWORD *)(a1 + 32);
      v15 = 138412546;
      v16 = v13;
      v17 = 2112;
      v18 = v2;
      _os_log_impl(&dword_1ABB60000, v12, OS_LOG_TYPE_INFO, "Copy most recent usage of addresses: %@   result: %@", (uint8_t *)&v15, 0x16u);
    }
  }
  if (v2)
    CFRelease(v2);
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDMessageRecordCreate_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, __int128 a15, __int128 a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,__int128 a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,__int128 a28,uint64_t a29,__int128 a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,__int128 a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,__int128 a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,__int128 a46,uint64_t a47,uint64_t a48,uint64_t a49)
{
  _BOOL4 v49;
  _QWORD v50[10];
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  __int128 v56;
  uint64_t v57;
  uint64_t v58;
  __int128 v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  __int128 v63;
  uint64_t v64;
  uint64_t v65;
  __int128 v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  __int128 v76;
  uint64_t v77;
  uint64_t v78;
  __int128 v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  __int128 v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;

  v50[0] = MEMORY[0x1E0C809B0];
  v50[2] = sub_1ABC33FC0;
  v50[3] = &unk_1E5ABF7F0;
  v50[4] = a12;
  v50[5] = a14;
  v50[6] = a5;
  v50[7] = a13;
  v50[8] = a17;
  v50[9] = a37;
  v73 = a20;
  v74 = a7;
  v75 = a8;
  v76 = a9;
  v77 = a10;
  v53 = a21;
  v54 = a24;
  v79 = a22;
  v78 = a11;
  v80 = a23;
  v81 = a25;
  v82 = a26;
  v55 = a27;
  v57 = a31;
  v84 = a29;
  v56 = a30;
  v85 = a32;
  v59 = a35;
  v58 = a33;
  v60 = a36;
  v61 = a38;
  v62 = a39;
  v86 = a34;
  v87 = a40;
  v64 = a42;
  v65 = a43;
  v88 = a44;
  v89 = a45;
  v90 = a48;
  v91 = a49;
  v67 = a47;
  v68 = a18;
  v69 = a19;
  v71 = a4;
  v72 = a6;
  v50[1] = 3221225472;
  v51 = a15;
  v52 = a16;
  v83 = a28;
  v63 = a41;
  v66 = a46;
  v70 = a3;
  v49 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v50, v49);
}

uint64_t sub_1ABC33FC0(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _OWORD *v14;
  const __CFString *v15;
  const void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const __CFString *v20;
  const void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t result;
  void *v31;
  uint64_t v32;
  uint8_t buf[4];
  uint64_t v34;
  _QWORD v35[3];

  v35[1] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = objc_msgSend(v3, "unsignedLongLongValue");
  if ((v4 & 0x100000) != 0)
  {
    v31 = v3;
    v32 = v2;
    goto LABEL_12;
  }
  v5 = *(void **)(a1 + 48);
  v6 = (void *)objc_msgSend((id)JWDecodeCodableObjectWithStandardAllowlist(), "mutableCopy");
  if (!objc_msgSend(v5, "length"))
    objc_msgSend(v6, "string");
  if (!objc_msgSend(MEMORY[0x1E0D397F8], "supportsDataDetectors")
    || (unint64_t)objc_msgSend(v6, "length") >= 0xFA0)
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)*(uint64_t *)(a1 + 296));
  v7 = IMDDScanAttributedStringWithExtendedContext();
  v8 = (void *)MEMORY[0x1E0CB37E8];
  if (!v7)
  {
LABEL_10:
    v9 = objc_msgSend(v8, "numberWithUnsignedLongLong:", v4 | 0x100000);
    goto LABEL_11;
  }
  v9 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v4 | 0x110000);
  v2 = JWEncodeCodableObject();
LABEL_11:
  v31 = (void *)v9;
  v32 = v2;

LABEL_12:
  v10 = *(_OWORD *)(a1 + 80);
  v11 = *(_OWORD *)(a1 + 112);
  v12 = *(_OWORD *)(a1 + 360);
  v13 = *(_OWORD *)(a1 + 376);
  v14 = IMDMessageRecordCreate(0, *(_QWORD *)(a1 + 304), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 296), *(_QWORD *)(a1 + 312), *(_QWORD *)(a1 + 320), *(_QWORD *)(a1 + 328), *(_QWORD *)(a1 + 336), *(_QWORD *)(a1 + 344), *(_QWORD *)(a1 + 352), v31, *(_QWORD *)(a1 + 56), v32, v10, *((uint64_t *)&v10 + 1), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), 0, 0,
          0,
          v11,
          *((uint64_t *)&v11 + 1),
          v12,
          *((uint64_t *)&v12 + 1),
          v13,
          *((uint64_t *)&v13 + 1),
          *(_QWORD *)(a1 + 392),
          *(_QWORD *)(a1 + 128),
          *(_QWORD *)(a1 + 400),
          *(_QWORD *)(a1 + 408),
          *(_QWORD *)(a1 + 416),
          *(_QWORD *)(a1 + 136),
          *(_QWORD *)(a1 + 144),
          *(_QWORD *)(a1 + 152),
          *(_QWORD *)(a1 + 424),
          *(_QWORD *)(a1 + 160),
          *(_QWORD *)(a1 + 432),
          *(_QWORD *)(a1 + 168),
          *(_QWORD *)(a1 + 176),
          *(_QWORD *)(a1 + 184),
          0,
          *(_QWORD *)(a1 + 192),
          *(_QWORD *)(a1 + 200),
          *(_QWORD *)(a1 + 440),
          *(_QWORD *)(a1 + 208),
          *(_QWORD *)(a1 + 216),
          *(_QWORD *)(a1 + 224),
          *(_QWORD *)(a1 + 232),
          *(_QWORD *)(a1 + 448),
          *(_QWORD *)(a1 + 456),
          *(_QWORD *)(a1 + 240),
          *(_QWORD *)(a1 + 248),
          *(_QWORD *)(a1 + 256),
          *(_QWORD *)(a1 + 464),
          *(_QWORD *)(a1 + 472));
  if (v14)
  {
    v15 = *(const __CFString **)(a1 + 64);
    if (v15)
    {
      v16 = (const void *)IMDHandleRecordCopyHandleForIDOnService(v15, *(const __CFString **)(a1 + 80));
      if (v16)
        goto LABEL_18;
      v17 = *MEMORY[0x1E0C9AE00];
      v18 = *(_QWORD *)(a1 + 64);
      v19 = *(_QWORD *)(a1 + 264);
      if (!v19)
        v19 = IMCountryCodeForIncomingTextMessage();
      v16 = IMDHandleRecordCreate(v17, v18, v19, *(void **)(a1 + 80), *(_QWORD *)(a1 + 272), 0);
      if (v16)
      {
LABEL_18:
        IMDMessageRecordSetHandle((uint64_t)v14, (uint64_t)v16);
        IMDSMSRecordStoreInvalidateCaches();
        CFRelease(v16);
      }
    }
    v20 = *(const __CFString **)(a1 + 112);
    if (v20)
    {
      v21 = (const void *)IMDHandleRecordCopyHandleForIDOnService(v20, *(const __CFString **)(a1 + 80));
      if (v21)
        goto LABEL_24;
      v22 = *MEMORY[0x1E0C9AE00];
      v23 = *(_QWORD *)(a1 + 112);
      v24 = *(_QWORD *)(a1 + 264);
      if (!v24)
        v24 = IMCountryCodeForIncomingTextMessage();
      v21 = IMDHandleRecordCreate(v22, v23, v24, *(void **)(a1 + 80), *(_QWORD *)(a1 + 272), 0);
      if (v21)
      {
LABEL_24:
        IMDMessageRecordSetOtherHandle((uint64_t)v14, (uint64_t)v21);
        IMDSMSRecordStoreInvalidateCaches();
        CFRelease(v21);
      }
    }
  }
  if (objc_msgSend(*(id *)(a1 + 136), "isEqualToString:", IMBalloonExtensionIDWithSuffix()))
  {
    IMProcessPeerPaymentMessageWithPayloadData();
  }
  else if (objc_msgSend(*(id *)(a1 + 136), "isEqualToString:", IMBalloonExtensionIDWithSuffix()))
  {
    IMProcessPhotosExtensionMessageWithPayloadData();
  }
  else if (objc_msgSend(*(id *)(a1 + 136), "isEqualToString:", *MEMORY[0x1E0D375F8]))
  {
    IMProcessRichLinkMessageWithBody();
  }
  else if (objc_msgSend(*(id *)(a1 + 136), "isEqualToString:", IMBalloonExtensionIDWithSuffix()))
  {
    if (*(_QWORD *)(a1 + 64))
    {
      v35[0] = *(_QWORD *)(a1 + 64);
      objc_msgSend((id)objc_msgSend(IMDCNRecordIDForAliases((void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1)), "objectForKey:", *(_QWORD *)(a1 + 64)), "isEqualToString:", CFSTR("__kIMDCNPersonNotFound"));
    }
    IMProcessGameCenterMessageWithPayloadData();
  }
  v25 = IMOSLoggingEnabled();
  if (v14)
  {
    if (v25)
    {
      v26 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        v27 = *(_QWORD *)(a1 + 56);
        *(_DWORD *)buf = 138412290;
        v34 = v27;
        _os_log_impl(&dword_1ABB60000, v26, OS_LOG_TYPE_INFO, "Created message with guid: %@", buf, 0xCu);
      }
    }
    _IMDMessageRecordBulkCopyXPCDictionary((uint64_t)v14, *(_QWORD *)(a1 + 280), 0, 0);
    CFRelease(v14);
  }
  else if (v25)
  {
    v28 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v29 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138412290;
      v34 = v29;
      _os_log_impl(&dword_1ABB60000, v28, OS_LOG_TYPE_INFO, "Failed to create message with guid: %@", buf, 0xCu);
    }
  }
  result = *(_QWORD *)(a1 + 288);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDMessageRecordCopyChats_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _BOOL4 v5;
  _QWORD v6[7];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1ABC345AC;
  v6[3] = &unk_1E5ABF4F8;
  v6[5] = a4;
  v6[6] = a5;
  v6[4] = a3;
  v5 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1ABC345AC(_QWORD *a1)
{
  const void *v2;
  const void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  xpc_object_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  xpc_object_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t result;
  int v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = IMDMessageRecordCreateFromRecordID(0, a1[6]);
  if (v2)
  {
    v3 = v2;
    v4 = (void *)IMDMessageRecordCopyChats((uint64_t)v2);
    if (IMOSLoggingEnabled())
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = a1[6];
        v17 = 134218240;
        v18 = v6;
        v19 = 2048;
        v20 = objc_msgSend(v4, "count");
        _os_log_impl(&dword_1ABB60000, v5, OS_LOG_TYPE_INFO, "Copy chats from message ID: %lld  (Results: %lu)", (uint8_t *)&v17, 0x16u);
      }
    }
    v7 = xpc_array_create(0, 0);
    if (v7)
    {
      v8 = objc_msgSend(v4, "count");
      if (v8 >= 1)
      {
        v9 = 0;
        v10 = v8;
        do
        {
          v11 = objc_msgSend(v4, "objectAtIndex:", v9);
          v12 = xpc_dictionary_create(0, 0, 0);
          if (v12)
          {
            _IMDChatRecordBulkCopyXPCDictionary(v11, (uint64_t)v12, 0, 0, 0, 1);
            xpc_array_append_value(v7, v12);
            xpc_release(v12);
          }
          ++v9;
        }
        while (v10 != v9);
      }
      v13 = (void *)a1[4];
      if (v13)
        xpc_dictionary_set_value(v13, "array_result", v7);
      xpc_release(v7);
    }
    if (v4)
      CFRelease(v4);
    CFRelease(v3);
  }
  else if (IMOSLoggingEnabled())
  {
    v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = a1[6];
      v17 = 134217984;
      v18 = v15;
      _os_log_impl(&dword_1ABB60000, v14, OS_LOG_TYPE_INFO, "Tried to copy chats from message ID: %lld, but no message found", (uint8_t *)&v17, 0xCu);
    }
  }
  result = a1[5];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDMessageRecordChatForMessageGUID_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _BOOL4 v5;
  _QWORD v6[7];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1ABC34864;
  v6[3] = &unk_1E5ABF480;
  v6[4] = a5;
  v6[5] = a3;
  v6[6] = a4;
  v5 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1ABC34864(uint64_t a1)
{
  CFStringRef v2;
  int v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  const __CFString *v7;
  uint64_t result;
  int v9;
  CFStringRef v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = IMDMessageRecordChatForMessageGUID(*(CFStringRef *)(a1 + 32));
  v3 = IMOSLoggingEnabled();
  if (v2)
  {
    if (v3)
    {
      v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v5 = *(_QWORD *)(a1 + 32);
        v9 = 138412546;
        v10 = v2;
        v11 = 2112;
        v12 = v5;
        _os_log_impl(&dword_1ABB60000, v4, OS_LOG_TYPE_INFO, "Found chat: %@  for message GUID: %@", (uint8_t *)&v9, 0x16u);
      }
    }
    _IMDChatRecordBulkCopyXPCDictionary((uint64_t)v2, *(_QWORD *)(a1 + 40), 0, 0, 0, 1);
    CFRelease(v2);
  }
  else if (v3)
  {
    v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = *(const __CFString **)(a1 + 32);
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_1ABB60000, v6, OS_LOG_TYPE_INFO, "Tried to find chat from message GUID: %@, but no chat was found", (uint8_t *)&v9, 0xCu);
    }
  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDMessageRecordCopyAttachments_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v5[7];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1ABC34A48;
  v5[3] = &unk_1E5ABF4F8;
  v5[5] = a4;
  v5[6] = a5;
  v5[4] = a3;
  IMDPersistencePerformBlock(v5, 1);
}

uint64_t sub_1ABC34A48(_QWORD *a1)
{
  const void *v2;
  const void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  xpc_object_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  xpc_object_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t result;
  int v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = IMDMessageRecordCreateFromRecordID(0, a1[6]);
  if (v2)
  {
    v3 = v2;
    v4 = (void *)IMDMessageRecordCopyAttachments((uint64_t)v2);
    if (IMOSLoggingEnabled())
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = a1[6];
        v17 = 134218240;
        v18 = v6;
        v19 = 2048;
        v20 = objc_msgSend(v4, "count");
        _os_log_impl(&dword_1ABB60000, v5, OS_LOG_TYPE_INFO, "Copy attachments from message ID: %lld  (Results: %lu)", (uint8_t *)&v17, 0x16u);
      }
    }
    v7 = xpc_array_create(0, 0);
    if (v7)
    {
      v8 = objc_msgSend(v4, "count");
      if (v8 >= 1)
      {
        v9 = 0;
        v10 = v8;
        do
        {
          v11 = objc_msgSend(v4, "objectAtIndex:", v9);
          v12 = xpc_dictionary_create(0, 0, 0);
          if (v12)
          {
            _IMDAttachmentRecordBulkCopyXPCDictionary(v11, (uint64_t)v12, 1);
            xpc_array_append_value(v7, v12);
            xpc_release(v12);
          }
          ++v9;
        }
        while (v10 != v9);
      }
      v13 = (void *)a1[4];
      if (v13)
        xpc_dictionary_set_value(v13, "array_result", v7);
      xpc_release(v7);
    }
    if (v4)
      CFRelease(v4);
    CFRelease(v3);
  }
  else if (IMOSLoggingEnabled())
  {
    v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = a1[6];
      v17 = 134217984;
      v18 = v15;
      _os_log_impl(&dword_1ABB60000, v14, OS_LOG_TYPE_INFO, "Tried to copy attachments from message ID: %lld, but no attachments found", (uint8_t *)&v17, 0xCu);
    }
  }
  result = a1[5];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDMessageRecordSetHandle_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _BOOL4 v6;
  _QWORD v7[7];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1ABC34CF4;
  v7[3] = &unk_1E5ABF570;
  v7[5] = a6;
  v7[6] = a5;
  v7[4] = a4;
  v6 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1ABC34CF4(_QWORD *a1)
{
  const void *v2;
  const void *v3;
  int v4;
  BOOL v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  const void *v18;
  __int16 v19;
  const void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = (const void *)IMDHandleRecordCreateFromRecordID(0, a1[5]);
  v3 = IMDMessageRecordCreateFromRecordIDWithLock(0, a1[6], 1);
  v4 = IMOSLoggingEnabled();
  if (v3)
    v5 = v2 == 0;
  else
    v5 = 1;
  if (!v5)
  {
    if (v4)
    {
      v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = a1[5];
        v11 = a1[6];
        v13 = 134218240;
        v14 = v10;
        v15 = 2048;
        v16 = v11;
        _os_log_impl(&dword_1ABB60000, v9, OS_LOG_TYPE_INFO, "Setting handle ID: %lld  on message ID: %lld", (uint8_t *)&v13, 0x16u);
      }
    }
    IMDMessageRecordSetHandle((uint64_t)v3, (uint64_t)v2);
LABEL_15:
    CFRelease(v3);
    goto LABEL_16;
  }
  if (v4)
  {
    v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = a1[5];
      v8 = a1[6];
      v13 = 134218754;
      v14 = v7;
      v15 = 2048;
      v16 = v8;
      v17 = 2112;
      v18 = v3;
      v19 = 2112;
      v20 = v2;
      _os_log_impl(&dword_1ABB60000, v6, OS_LOG_TYPE_INFO, "Failed to set handle (%lld) on message (%lld)   (Message: %@  Handle: %@)", (uint8_t *)&v13, 0x2Au);
    }
  }
  if (v3)
    goto LABEL_15;
LABEL_16:
  if (v2)
    CFRelease(v2);
  IMDSMSRecordStoreInvalidateCaches();
  result = a1[4];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDMessageRecordCopyHandle_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _BOOL4 v5;
  _QWORD v6[7];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1ABC34F28;
  v6[3] = &unk_1E5ABF4F8;
  v6[5] = a4;
  v6[6] = a5;
  v6[4] = a3;
  v5 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1ABC34F28(uint64_t *a1)
{
  const __CFArray **v2;
  const __CFArray **v3;
  _QWORD *v4;
  int v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t result;
  int v13;
  _QWORD *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (const __CFArray **)IMDMessageRecordCreateFromRecordIDWithLock(0, a1[6], 1);
  if (v2)
  {
    v3 = v2;
    v4 = IMDMessageRecordCopyHandle(v2);
    v5 = IMOSLoggingEnabled();
    if (v4)
    {
      if (v5)
      {
        v6 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          v7 = a1[6];
          v13 = 138412546;
          v14 = v4;
          v15 = 2048;
          v16 = v7;
          _os_log_impl(&dword_1ABB60000, v6, OS_LOG_TYPE_INFO, "Copied handle: %@  for message ID: %lld", (uint8_t *)&v13, 0x16u);
        }
      }
      _IMDHandleRecordBulkCopyXPCDictionary((uint64_t)v4, a1[4], 1);
      CFRelease(v4);
    }
    else if (v5)
    {
      v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = a1[6];
        v13 = 134217984;
        v14 = (_QWORD *)v11;
        _os_log_impl(&dword_1ABB60000, v10, OS_LOG_TYPE_INFO, "Tried to copy handle from Message ID: %lld, but no handle was found", (uint8_t *)&v13, 0xCu);
      }
    }
    CFRelease(v3);
  }
  else if (IMOSLoggingEnabled())
  {
    v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = a1[6];
      v13 = 134217984;
      v14 = (_QWORD *)v9;
      _os_log_impl(&dword_1ABB60000, v8, OS_LOG_TYPE_INFO, "Tried to copy handle from Message ID: %lld, but no message was found", (uint8_t *)&v13, 0xCu);
    }
  }
  result = a1[5];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDMessageRecordCopyOtherHandle_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _BOOL4 v5;
  _QWORD v6[7];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1ABC35198;
  v6[3] = &unk_1E5ABF4F8;
  v6[5] = a4;
  v6[6] = a5;
  v6[4] = a3;
  v5 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1ABC35198(uint64_t *a1)
{
  const __CFArray **v2;
  const __CFArray **v3;
  _QWORD *v4;
  int v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t result;
  int v13;
  _QWORD *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (const __CFArray **)IMDMessageRecordCreateFromRecordIDWithLock(0, a1[6], 1);
  if (v2)
  {
    v3 = v2;
    v4 = IMDMessageRecordCopyOtherHandle(v2);
    v5 = IMOSLoggingEnabled();
    if (v4)
    {
      if (v5)
      {
        v6 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          v7 = a1[6];
          v13 = 138412546;
          v14 = v4;
          v15 = 2048;
          v16 = v7;
          _os_log_impl(&dword_1ABB60000, v6, OS_LOG_TYPE_INFO, "Copied other handle: %@  for message ID: %lld", (uint8_t *)&v13, 0x16u);
        }
      }
      _IMDHandleRecordBulkCopyXPCDictionary((uint64_t)v4, a1[4], 1);
      CFRelease(v4);
    }
    else if (v5)
    {
      v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = a1[6];
        v13 = 134217984;
        v14 = (_QWORD *)v11;
        _os_log_impl(&dword_1ABB60000, v10, OS_LOG_TYPE_INFO, "Tried to copy other handle from Message ID: %lld, but no handle was found", (uint8_t *)&v13, 0xCu);
      }
    }
    CFRelease(v3);
  }
  else if (IMOSLoggingEnabled())
  {
    v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = a1[6];
      v13 = 134217984;
      v14 = (_QWORD *)v9;
      _os_log_impl(&dword_1ABB60000, v8, OS_LOG_TYPE_INFO, "Tried to copy other handle from Message ID: %lld, but no message was found", (uint8_t *)&v13, 0xCu);
    }
  }
  result = a1[5];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDMessageRecordBulkUpdate_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, uint64_t a10, __int128 a11, __int128 a12, __int128 a13, uint64_t a14, uint64_t a15, __int128 a16, uint64_t a17, __int128 a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,__int128 a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,__int128 a31,__int128 a32,uint64_t a33,uint64_t a34,__int128 a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,__int128 a40,uint64_t a41,uint64_t a42,uint64_t a43)
{
  _BOOL4 v43;
  _QWORD v44[5];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;
  __int128 v57;
  uint64_t v58;
  uint64_t v59;
  __int128 v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  __int128 v66;
  uint64_t v67;
  uint64_t v68;
  __int128 v69;
  uint64_t v70;
  __int128 v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  __int128 v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;

  v44[0] = MEMORY[0x1E0C809B0];
  v44[2] = sub_1ABC35520;
  v44[3] = &unk_1E5ABF818;
  v63 = a5;
  v64 = a6;
  v44[4] = a7;
  v66 = a9;
  v65 = a8;
  v67 = a10;
  v48 = a15;
  v69 = a16;
  v68 = a14;
  v70 = a17;
  v49 = a20;
  v72 = a19;
  v73 = a21;
  v50 = a23;
  v75 = a24;
  v74 = a22;
  v76 = a25;
  v51 = a26;
  v52 = a27;
  v53 = a29;
  v77 = a28;
  v78 = a30;
  v54 = a31;
  v55 = a32;
  v56 = a33;
  v58 = a36;
  v59 = a37;
  v79 = a34;
  v80 = a38;
  v81 = a39;
  v82 = a42;
  v83 = a43;
  v61 = a41;
  v62 = a4;
  v44[1] = 3221225472;
  v45 = a11;
  v46 = a12;
  v47 = a13;
  v71 = a18;
  v57 = a35;
  v60 = a40;
  v43 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v44, v43);
}

uint64_t sub_1ABC35520(uint64_t a1)
{
  const void *v2;
  const void *v3;
  uint64_t result;
  __int128 v5;

  v2 = IMDMessageRecordCreateFromRecordIDWithLock(0, *(_QWORD *)(a1 + 240), 1);
  if (v2)
  {
    v5 = *(_OWORD *)(a1 + 112);
    v3 = v2;
    IMDMessageRecordBulkUpdate((uint64_t)v2, *(_QWORD *)(a1 + 248), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 256), *(_QWORD *)(a1 + 264), *(_QWORD *)(a1 + 272), *(_QWORD *)(a1 + 280), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 288), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 296), *(_QWORD *)(a1 + 304), *(_QWORD *)(a1 + 312), *(_QWORD *)(a1 + 96),
      *(_QWORD *)(a1 + 320),
      *(_QWORD *)(a1 + 328),
      *(_QWORD *)(a1 + 336),
      *(_QWORD *)(a1 + 344),
      *(_QWORD *)(a1 + 352),
      *(_QWORD *)(a1 + 104),
      *(_QWORD *)(a1 + 360),
      *(_QWORD *)(a1 + 368),
      *(_QWORD *)(a1 + 376),
      v5,
      *((uint64_t *)&v5 + 1),
      *(_QWORD *)(a1 + 384),
      *(_QWORD *)(a1 + 128),
      *(_QWORD *)(a1 + 392),
      *(_QWORD *)(a1 + 136),
      *(_QWORD *)(a1 + 144),
      *(_QWORD *)(a1 + 152),
      *(_QWORD *)(a1 + 160),
      *(_QWORD *)(a1 + 168),
      *(_QWORD *)(a1 + 400),
      *(_QWORD *)(a1 + 176),
      *(_QWORD *)(a1 + 184),
      *(_QWORD *)(a1 + 192),
      *(_QWORD *)(a1 + 200),
      *(_QWORD *)(a1 + 408),
      *(_QWORD *)(a1 + 416),
      *(_QWORD *)(a1 + 208),
      *(_QWORD *)(a1 + 216),
      *(_QWORD *)(a1 + 224),
      *(_QWORD *)(a1 + 424),
      *(_QWORD *)(a1 + 432));
    CFRelease(v3);
  }
  result = *(_QWORD *)(a1 + 232);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDMessagePTaskInsertRow_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _BOOL4 v6;
  _QWORD v7[7];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1ABC35744;
  v7[3] = &unk_1E5ABF4F8;
  v7[5] = a4;
  v7[6] = a6;
  v7[4] = a5;
  v6 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1ABC35744(uint64_t *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v3 = a1[4];
      v4 = a1[6];
      v6 = 138412546;
      v7 = v3;
      v8 = 2048;
      v9 = v4;
      _os_log_impl(&dword_1ABB60000, v2, OS_LOG_TYPE_INFO, "Inserting Message Processing Task with (guid: %@, taskflags: %ld)", (uint8_t *)&v6, 0x16u);
    }
  }
  IMDMessagePTaskInsertRow(a1[4], a1[6]);
  result = a1[5];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDMessagePTaskSelectWithLimit_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _BOOL4 v5;
  _QWORD v6[7];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1ABC35894;
  v6[3] = &unk_1E5ABF4F8;
  v6[5] = a4;
  v6[6] = a5;
  v6[4] = a3;
  v5 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1ABC35894(_QWORD *a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  xpc_object_t v5;
  unint64_t v6;
  void *v7;
  xpc_object_t v8;
  void *v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (void *)IMDMessagePTaskSelectWithLimit(a1[6]);
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = a1[6];
      *(_DWORD *)buf = 134218240;
      v14 = v4;
      v15 = 2048;
      v16 = objc_msgSend(v2, "count");
      _os_log_impl(&dword_1ABB60000, v3, OS_LOG_TYPE_INFO, "Coping first %ld Message Processing Task (Results: %ld)", buf, 0x16u);
    }
  }
  v5 = xpc_array_create(0, 0);
  if (v5)
  {
    if (objc_msgSend(v2, "count"))
    {
      v6 = 0;
      do
      {
        v7 = (void *)objc_msgSend(v2, "objectAtIndex:", v6);
        v8 = xpc_dictionary_create(0, 0, 0);
        if (v8)
        {
          if (objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("guid")))
          {
            v11 = objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("guid"));
            v12 = 0;
            IMInsertNSStringsToXPCDictionary();
          }
          if (objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("task_flags"), v11, v12))
          {
            v11 = objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("task_flags")), "intValue");
            v12 = 0;
            IMInsertIntsToXPCDictionary();
          }
          xpc_array_append_value(v5, v8);
          xpc_release(v8);
        }
        ++v6;
      }
      while (v6 < objc_msgSend(v2, "count", v11, v12));
    }
    v9 = (void *)a1[4];
    if (v9)
      xpc_dictionary_set_value(v9, "array_result", v5);
    xpc_release(v5);
  }
  result = a1[5];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDMessagePTaskUpdateTaskFlagsForGUID_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _BOOL4 v6;
  _QWORD v7[7];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1ABC35B1C;
  v7[3] = &unk_1E5ABF4F8;
  v7[5] = a4;
  v7[6] = a6;
  v7[4] = a5;
  v6 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1ABC35B1C(uint64_t *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v3 = a1[6];
      v4 = a1[4];
      v6 = 134218242;
      v7 = v3;
      v8 = 2112;
      v9 = v4;
      _os_log_impl(&dword_1ABB60000, v2, OS_LOG_TYPE_INFO, "Updating task_flags to %ld for Message Processing Task with guid: %@", (uint8_t *)&v6, 0x16u);
    }
  }
  IMDMessagePTaskUpdateTaskFlagsForGUID(a1[4], a1[6]);
  result = a1[5];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDMessagePTaskDeleteAllCompletedTask_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _BOOL4 v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1ABC35C68;
  v5[3] = &unk_1E5AB43E8;
  v5[4] = a4;
  v4 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v5, v4);
}

uint64_t sub_1ABC35C68(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  uint8_t v4[16];

  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1ABB60000, v2, OS_LOG_TYPE_INFO, "Deleting all completed task from Message Processing Table", v4, 2u);
    }
  }
  IMDMessagePTaskDeleteAllCompletedTask();
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDChatRecordCreate_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, __int128 a10, __int128 a11, __int128 a12, __int128 a13, uint64_t a14, __int128 a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,__int128 a21,__int128 a22,uint64_t a23)
{
  _BOOL4 v23;
  _QWORD v24[6];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;

  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = sub_1ABC35DCC;
  v24[3] = &unk_1E5ABF840;
  v35 = a5;
  v36 = a6;
  v24[4] = a7;
  v24[5] = a8;
  v25 = a9;
  v26 = a10;
  v27 = a11;
  v28 = a12;
  v37 = a13;
  v29 = a15;
  v38 = a14;
  v39 = a16;
  v40 = a18;
  v30 = a17;
  v31 = a19;
  v41 = a21;
  v42 = a22;
  v43 = a23;
  v32 = a20;
  v33 = a3;
  v34 = a4;
  v23 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v24, v23);
}

void sub_1ABC35DCC(uint64_t *a1)
{
  const void *v2;
  int v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  const void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = IMDChatRecordCreate(0, a1[21], a1[22], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], a1[12], a1[13], a1[23], a1[24], a1[25], a1[14], a1[15], a1[26],
         a1[16],
         a1[27],
         a1[17],
         a1[18],
         a1[28],
         a1[29],
         a1[30],
         a1[31],
         a1[32]);
  v3 = IMOSLoggingEnabled();
  if (v2)
  {
    if (v3)
    {
      v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v5 = a1[8];
        *(_DWORD *)buf = 138412546;
        v10 = v5;
        v11 = 2048;
        v12 = v2;
        _os_log_impl(&dword_1ABB60000, v4, OS_LOG_TYPE_INFO, "Created chat with guid: %@  (0x%p)", buf, 0x16u);
      }
    }
    _IMDChatRecordBulkCopyXPCDictionary((uint64_t)v2, a1[19], 0, 0, 1, 1);
  }
  else if (v3)
  {
    v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = a1[8];
      *(_DWORD *)buf = 138412290;
      v10 = v7;
      _os_log_impl(&dword_1ABB60000, v6, OS_LOG_TYPE_INFO, "Failed to create chat with guid: %@", buf, 0xCu);
    }
  }
  v8 = a1[20];
  if (v8)
    (*(void (**)(void))(v8 + 16))();
  if (v2)
    CFRelease(v2);
}

void __XPCServerIMDChatRecordCopyHandles_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _BOOL4 v5;
  _QWORD v6[7];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1ABC3602C;
  v6[3] = &unk_1E5ABF4F8;
  v6[5] = a4;
  v6[6] = a5;
  v6[4] = a3;
  v5 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1ABC3602C(_QWORD *a1)
{
  _QWORD *v2;
  const void *v3;
  _QWORD *v4;
  xpc_object_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  xpc_object_t v11;
  void *v12;
  void *v13;
  uint64_t result;

  v2 = IMDChatRecordCreateFromRecordID(0, a1[6]);
  if (v2)
  {
    v3 = v2;
    v4 = IMDChatRecordCopyHandles(v2);
    v5 = xpc_array_create(0, 0);
    if (v5)
    {
      v6 = v5;
      v7 = objc_msgSend(v4, "count");
      if (v7 >= 1)
      {
        v8 = 0;
        v9 = v7;
        do
        {
          v10 = objc_msgSend(v4, "objectAtIndex:", v8);
          v11 = xpc_dictionary_create(0, 0, 0);
          if (v11)
          {
            v12 = v11;
            _IMDHandleRecordBulkCopyXPCDictionary(v10, (uint64_t)v11, 1);
            xpc_array_append_value(v6, v12);
            xpc_release(v12);
          }
          ++v8;
        }
        while (v9 != v8);
      }
      v13 = (void *)a1[4];
      if (v13)
        xpc_dictionary_set_value(v13, "array_result", v6);
      xpc_release(v6);
    }
    if (v4)
      CFRelease(v4);
    CFRelease(v3);
  }
  result = a1[5];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDChatRecordCopyMessagesWithLimit_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _BOOL4 v6;
  _QWORD v7[8];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1ABC361B8;
  v7[3] = &unk_1E5ABF5C0;
  v7[6] = a5;
  v7[7] = a6;
  v7[4] = a3;
  v7[5] = a4;
  v6 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1ABC361B8(_QWORD *a1)
{
  _OWORD *v2;
  const void *v3;
  void *v4;
  xpc_object_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  xpc_object_t v11;
  void *v12;
  void *v13;
  uint64_t result;

  v2 = IMDChatRecordCreateFromRecordID(0, a1[6]);
  if (v2)
  {
    v3 = v2;
    v4 = (void *)IMDChatRecordCopyMessagesWithLimit((uint64_t)v2, a1[7]);
    v5 = xpc_array_create(0, 0);
    if (v5)
    {
      v6 = v5;
      v7 = objc_msgSend(v4, "count");
      if (v7 >= 1)
      {
        v8 = 0;
        v9 = v7;
        do
        {
          v10 = objc_msgSend(v4, "objectAtIndex:", v8);
          v11 = xpc_dictionary_create(0, 0, 0);
          if (v11)
          {
            v12 = v11;
            _IMDMessageRecordBulkCopyXPCDictionary(v10, (uint64_t)v11, 0, 0);
            xpc_array_append_value(v6, v12);
            xpc_release(v12);
          }
          ++v8;
        }
        while (v9 != v8);
      }
      v13 = (void *)a1[4];
      if (v13)
        xpc_dictionary_set_value(v13, "array_result", v6);
      xpc_release(v6);
    }
    if (v4)
      CFRelease(v4);
    CFRelease(v3);
  }
  result = a1[5];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDChatRecordSetIsArchived_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _BOOL4 v6;
  _QWORD v7[7];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1ABC36350;
  v7[3] = &unk_1E5ABF570;
  v7[5] = a5;
  v7[6] = a6;
  v7[4] = a4;
  v6 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1ABC36350(_QWORD *a1)
{
  _OWORD *v2;
  const void *v3;
  uint64_t result;

  v2 = IMDChatRecordCreateFromRecordID(0, a1[5]);
  if (v2)
  {
    v3 = v2;
    IMDChatRecordSetIsArchived((uint64_t)v2, a1[6]);
    CFRelease(v3);
  }
  result = a1[4];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDChatRecordSetIsBlackholed_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _BOOL4 v6;
  _QWORD v7[7];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1ABC36408;
  v7[3] = &unk_1E5ABF570;
  v7[5] = a5;
  v7[6] = a6;
  v7[4] = a4;
  v6 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1ABC36408(_QWORD *a1)
{
  _OWORD *v2;
  const void *v3;
  uint64_t result;

  v2 = IMDChatRecordCreateFromRecordID(0, a1[5]);
  if (v2)
  {
    v3 = v2;
    IMDChatRecordSetIsBlackholed((uint64_t)v2, a1[6]);
    CFRelease(v3);
  }
  result = a1[4];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDChatRecordSetIsRecovered_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _BOOL4 v6;
  _QWORD v7[7];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1ABC364C0;
  v7[3] = &unk_1E5ABF570;
  v7[5] = a5;
  v7[6] = a6;
  v7[4] = a4;
  v6 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1ABC364C0(_QWORD *a1)
{
  _OWORD *v2;
  const void *v3;
  uint64_t result;

  v2 = IMDChatRecordCreateFromRecordID(0, a1[5]);
  if (v2)
  {
    v3 = v2;
    IMDChatRecordSetIsRecovered((uint64_t)v2, a1[6]);
    CFRelease(v3);
  }
  result = a1[4];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDChatRecordSetIsDeletingIncomingMessages_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _BOOL4 v6;
  _QWORD v7[7];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1ABC36578;
  v7[3] = &unk_1E5ABF570;
  v7[5] = a5;
  v7[6] = a6;
  v7[4] = a4;
  v6 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1ABC36578(_QWORD *a1)
{
  _OWORD *v2;
  const void *v3;
  uint64_t result;

  v2 = IMDChatRecordCreateFromRecordID(0, a1[5]);
  if (v2)
  {
    v3 = v2;
    IMDChatRecordSetIsDeletingIncomingMessages((uint64_t)v2, a1[6]);
    CFRelease(v3);
  }
  result = a1[4];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDChatRecordAddHandle_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _BOOL4 v6;
  _QWORD v7[7];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1ABC36630;
  v7[3] = &unk_1E5ABF570;
  v7[5] = a5;
  v7[6] = a6;
  v7[4] = a4;
  v6 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1ABC36630(_QWORD *a1)
{
  _OWORD *v2;
  uint64_t v3;
  const void *v4;
  BOOL v5;
  uint64_t result;

  v2 = IMDChatRecordCreateFromRecordID(0, a1[5]);
  v3 = IMDHandleRecordCreateFromRecordID(0, a1[6]);
  v4 = (const void *)v3;
  if (v2)
    v5 = v3 == 0;
  else
    v5 = 1;
  if (v5)
  {
    if (!v2)
      goto LABEL_8;
  }
  else
  {
    IMDChatRecordAddHandle((uint64_t)v2, v3);
  }
  CFRelease(v2);
LABEL_8:
  if (v4)
    CFRelease(v4);
  result = a1[4];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDChatRecordRemoveHandle_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _BOOL4 v6;
  _QWORD v7[7];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1ABC36724;
  v7[3] = &unk_1E5ABF570;
  v7[5] = a5;
  v7[6] = a6;
  v7[4] = a4;
  v6 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1ABC36724(_QWORD *a1)
{
  _OWORD *v2;
  uint64_t v3;
  const void *v4;
  BOOL v5;
  uint64_t result;

  v2 = IMDChatRecordCreateFromRecordID(0, a1[5]);
  v3 = IMDHandleRecordCreateFromRecordID(0, a1[6]);
  v4 = (const void *)v3;
  if (v2)
    v5 = v3 == 0;
  else
    v5 = 1;
  if (v5)
  {
    if (!v2)
      goto LABEL_8;
  }
  else
  {
    IMDChatRecordRemoveHandle((uint64_t)v2, v3);
  }
  CFRelease(v2);
LABEL_8:
  if (v4)
    CFRelease(v4);
  result = a1[4];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDChatRecordBulkUpdate_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, __int128 a10, __int128 a11, __int128 a12, uint64_t a13, __int128 a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,__int128 a23,__int128 a24,uint64_t a25)
{
  _BOOL4 v25;
  _QWORD v26[5];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;

  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = sub_1ABC3687C;
  v26[3] = &unk_1E5ABF868;
  v39 = a6;
  v40 = a7;
  v26[4] = a8;
  v27 = a9;
  v28 = a10;
  v29 = a11;
  v30 = a12;
  v41 = a14;
  v31 = a13;
  v32 = a16;
  v42 = a15;
  v43 = a18;
  v33 = a17;
  v34 = a19;
  v44 = a20;
  v35 = a21;
  v36 = a22;
  v45 = a23;
  v46 = a24;
  v47 = a25;
  v37 = a4;
  v38 = a5;
  v25 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v26, v25);
}

uint64_t sub_1ABC3687C(uint64_t *a1)
{
  _OWORD *v2;
  const void *v3;
  uint64_t result;

  v2 = IMDChatRecordCreateFromRecordID(0, a1[20]);
  if (v2)
  {
    v3 = v2;
    IMDChatRecordBulkUpdate((uint64_t)v2, a1[21], a1[22], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], a1[12], a1[13], a1[23], a1[24], a1[25], a1[14], a1[15], a1[26],
      a1[16],
      a1[27],
      a1[17],
      a1[18],
      a1[28],
      a1[29],
      a1[30],
      a1[31],
      a1[32]);
    CFRelease(v3);
  }
  result = a1[19];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDChatRecordCopyAllChats_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _BOOL4 v4;
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1ABC369BC;
  v5[3] = &unk_1E5ABF430;
  v5[4] = a3;
  v5[5] = a4;
  v4 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v5, v4);
}

uint64_t sub_1ABC369BC(uint64_t a1)
{
  void *v2;
  xpc_object_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  xpc_object_t v9;
  void *v10;
  void *v11;
  uint64_t result;

  v2 = (void *)IMDChatRecordCopyAllChats();
  v3 = xpc_array_create(0, 0);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v2, "count");
    if (v5 >= 1)
    {
      v6 = 0;
      v7 = v5;
      do
      {
        v8 = objc_msgSend(v2, "objectAtIndex:", v6);
        v9 = xpc_dictionary_create(0, 0, 0);
        if (v9)
        {
          v10 = v9;
          _IMDChatRecordBulkCopyXPCDictionary(v8, (uint64_t)v9, 0, 0, 0, 1);
          xpc_array_append_value(v4, v10);
          xpc_release(v10);
        }
        ++v6;
      }
      while (v7 != v6);
    }
    v11 = *(void **)(a1 + 32);
    if (v11)
      xpc_dictionary_set_value(v11, "array_result", v4);
    xpc_release(v4);
  }
  if (v2)
    CFRelease(v2);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDChatRecordCopyAllNamedChats_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _BOOL4 v4;
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1ABC36B34;
  v5[3] = &unk_1E5ABF430;
  v5[4] = a3;
  v5[5] = a4;
  v4 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v5, v4);
}

uint64_t sub_1ABC36B34(uint64_t a1)
{
  void *v2;
  xpc_object_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  xpc_object_t v9;
  void *v10;
  void *v11;
  uint64_t result;

  v2 = (void *)IMDChatRecordCopyAllNamedChats();
  v3 = xpc_array_create(0, 0);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v2, "count");
    if (v5 >= 1)
    {
      v6 = 0;
      v7 = v5;
      do
      {
        v8 = objc_msgSend(v2, "objectAtIndex:", v6);
        v9 = xpc_dictionary_create(0, 0, 0);
        if (v9)
        {
          v10 = v9;
          _IMDChatRecordBulkCopyXPCDictionary(v8, (uint64_t)v9, 0, 0, 0, 1);
          xpc_array_append_value(v4, v10);
          xpc_release(v10);
        }
        ++v6;
      }
      while (v7 != v6);
    }
    v11 = *(void **)(a1 + 32);
    if (v11)
      xpc_dictionary_set_value(v11, "array_result", v4);
    xpc_release(v4);
  }
  if (v2)
    CFRelease(v2);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDChatRecordCopyAllActiveChatsProgressivelyWithLimit_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _BOOL4 v6;
  _QWORD v7[8];

  if (a3)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = sub_1ABC36CB4;
    v7[3] = &unk_1E5ABF5C0;
    v7[4] = a3;
    v7[5] = a4;
    v7[6] = a5;
    v7[7] = a6;
    v6 = sub_1ABC29340(a3);
    IMDPersistencePerformBlock(v7, v6);
  }
}

void sub_1ABC36CB4(_QWORD *a1)
{
  const __CFArray *active;
  CFIndex v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  CFIndex v7;
  NSObject *v8;
  CFIndex v9;
  xpc_object_t v10;
  CFIndex Count;
  CFIndex v12;
  uint64_t v13;
  xpc_object_t v14;
  const void *ValueAtIndex;
  const void *v16;
  void *Value;
  void *v18;
  char v19;
  int64_t v20;
  void *v21;
  int64_t v22;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  id v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  CFIndex v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v33 = objc_alloc_init(MEMORY[0x1E0D36AE8]);
  objc_msgSend(v33, "startTimingForKey:", CFSTR("goFetchAllActiveChatsProgressively"));
  v31 = a1;
  if (qword_1EEC3F7F0 == a1[6])
  {
LABEL_17:
    v10 = xpc_array_create(0, 0);
    Count = CFArrayGetCount((CFArrayRef)qword_1EEC402D0);
    v12 = qword_1ED0D38B0;
    if (qword_1ED0D38B0 < Count)
    {
      v13 = qword_1ED0D38B0 + 250;
      do
      {
        v14 = xpc_dictionary_create(0, 0, 0);
        ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)qword_1EEC402D0, v12);
        v16 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", IMDChatRecordGetIdentifier((uint64_t)ValueAtIndex));
        if (qword_1EEC40690)
        {
          Value = (void *)CFDictionaryGetValue((CFDictionaryRef)qword_1EEC40690, v16);
          v18 = Value;
          if (Value)
          {
            v19 = objc_msgSend((id)objc_msgSend(Value, "objectForKeyedSubscript:", CFSTR("l")), "BOOLValue");
            v20 = objc_msgSend((id)objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("d")), "integerValue");
          }
          else
          {
            v19 = 0;
            v20 = -1;
          }
        }
        else
        {
          v20 = -1;
          v19 = 1;
        }
        _IMDChatRecordBulkCopyXPCDictionary((uint64_t)ValueAtIndex, (uint64_t)v14, 1, 0, v19, 1);
        xpc_dictionary_set_int64(v14, "last_message_date_on_load", v20);
        v21 = (void *)CFDictionaryGetValue((CFDictionaryRef)qword_1EEC402D8, v16);
        if (v21)
          v22 = objc_msgSend(v21, "longLongValue");
        else
          v22 = 0;
        xpc_dictionary_set_int64(v14, "unread_count_cache", v22);
        xpc_array_append_value(v10, v14);
        xpc_release(v14);
        ++qword_1ED0D38B0;
        if (v12 + 1 >= Count)
          break;
      }
      while (v12++ < v13);
    }
    if ((IMOSLoggingEnabled() & 1) != 0)
    {
      v24 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218240;
        v35 = qword_1ED0D38B0;
        v36 = 2048;
        v37 = Count;
        _os_log_impl(&dword_1ABB60000, v24, OS_LOG_TYPE_INFO, "Progressive chat send progress: %lu out of %lu", buf, 0x16u);
      }
    }
    xpc_dictionary_set_value((xpc_object_t)v31[4], "array_result", v10);
    xpc_release(v10);
    v25 = (void *)v31[4];
    if (qword_1ED0D38B0 == Count)
    {
      xpc_dictionary_set_BOOL(v25, "complete", 1);
      qword_1EEC3F7F0 = -1;
      if (qword_1EEC402D0)
      {
        CFRelease((CFTypeRef)qword_1EEC402D0);
        qword_1EEC402D0 = 0;
      }
      if (qword_1EEC40690)
      {
        CFRelease((CFTypeRef)qword_1EEC40690);
        qword_1EEC40690 = 0;
      }
      if (qword_1EEC402D8)
      {
        CFRelease((CFTypeRef)qword_1EEC402D8);
        qword_1EEC402D8 = 0;
      }
      if (IMOSLoggingEnabled())
      {
        v26 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          v35 = qword_1ED0D38B0;
          _os_log_impl(&dword_1ABB60000, v26, OS_LOG_TYPE_INFO, "Progressive chat send complete with %lu chats sent", buf, 0xCu);
        }
      }
    }
    else
    {
      xpc_dictionary_set_BOOL(v25, "complete", 0);
    }
    objc_msgSend(v33, "stopTimingForKey:", CFSTR("goFetchAllActiveChatsProgressively"), v31);

    v27 = *(_QWORD *)(v32 + 40);
    if (v27)
      (*(void (**)(void))(v27 + 16))();
    return;
  }
  if (qword_1EEC402D0)
  {
    CFRelease((CFTypeRef)qword_1EEC402D0);
    qword_1EEC402D0 = 0;
  }
  if (qword_1EEC40690)
  {
    CFRelease((CFTypeRef)qword_1EEC40690);
    qword_1EEC40690 = 0;
  }
  if (qword_1EEC402D8)
  {
    CFRelease((CFTypeRef)qword_1EEC402D8);
    qword_1EEC402D8 = 0;
  }
  active = (const __CFArray *)IMDChatRecordCopyAllActiveChats();
  qword_1EEC402D0 = (uint64_t)active;
  qword_1ED0D38B0 = 0;
  qword_1EEC3F7F0 = a1[6];
  if (active)
  {
    if ((uint64_t)a1[7] >= 1)
    {
      v3 = CFArrayGetCount(active);
      v4 = a1[7];
      if (v3 > v4)
      {
        qword_1EEC40690 = (uint64_t)IMDChatRowIDsMostRecentByLastMessageWithLimit(v4);
        if (IMOSLoggingEnabled())
        {
          v5 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
          {
            v6 = a1[7];
            *(_DWORD *)buf = 134218240;
            v35 = v6;
            v36 = 2048;
            v37 = CFDictionaryGetCount((CFDictionaryRef)qword_1EEC40690);
            _os_log_impl(&dword_1ABB60000, v5, OS_LOG_TYPE_INFO, "Enforcing lastMessage load limit of %lld, found %lu chats with messages", buf, 0x16u);
          }
        }
      }
    }
    v7 = CFArrayGetCount((CFArrayRef)qword_1EEC402D0);
    qword_1EEC402D8 = (uint64_t)CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v7, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    _IMDMessageRecordCountAllUnreadMessagesForAllUnreadChats((uint64_t)&unk_1E5AAF428);
    if (IMOSLoggingEnabled())
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = CFArrayGetCount((CFArrayRef)qword_1EEC402D0);
        *(_DWORD *)buf = 134218240;
        v35 = v9;
        v36 = 2048;
        v37 = 250;
        _os_log_impl(&dword_1ABB60000, v8, OS_LOG_TYPE_INFO, "Received new copy all chats request (total: %ld, batch size: %ld)", buf, 0x16u);
      }
    }
    goto LABEL_17;
  }
  if (IMOSLoggingEnabled())
  {
    v28 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1ABB60000, v28, OS_LOG_TYPE_INFO, "Got nil for all active chats, aborting progressive copy all chats request early", buf, 2u);
    }
  }
  qword_1EEC3F7F0 = -1;
  v29 = (void *)a1[4];
  if (v29)
    xpc_dictionary_set_BOOL(v29, "complete", 1);
  v30 = a1[5];
  if (v30)
    (*(void (**)(void))(v30 + 16))();

}

void sub_1ABC3731C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const void *v4;
  const void *v5;

  v4 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
  v5 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  CFDictionarySetValue((CFMutableDictionaryRef)qword_1EEC402D8, v4, v5);
}

void __XPCServerIMDChatRecordCopyAllActiveChatsWithLimit_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _BOOL4 v5;
  _QWORD v6[7];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1ABC373D0;
  v6[3] = &unk_1E5ABF4F8;
  v6[5] = a4;
  v6[6] = a5;
  v6[4] = a3;
  v5 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1ABC373D0(_QWORD *a1)
{
  void *active;
  int v3;
  uint64_t v4;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  int64_t v17;
  xpc_object_t v18;
  void *v19;
  NSObject *v20;
  uint64_t result;
  _QWORD *v22;
  id v23;
  id MessageWithLimit;
  xpc_object_t xarray;
  _QWORD v26[5];
  uint8_t buf[4];
  id v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v23 = objc_alloc_init(MEMORY[0x1E0D36AE8]);
  objc_msgSend(v23, "startTimingForKey:", CFSTR("goFetchAllActiveChats"));
  active = (void *)IMDChatRecordCopyAllActiveChats();
  xarray = xpc_array_create(0, 0);
  v3 = objc_msgSend(active, "count");
  MessageWithLimit = 0;
  v22 = a1;
  v4 = a1[6];
  v6 = v4 > 0 && v4 < v3;
  if (v6)
  {
    MessageWithLimit = IMDChatRowIDsMostRecentByLastMessageWithLimit(v4);
    if (IMOSLoggingEnabled())
    {
      v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = (void *)v22[6];
        *(_DWORD *)buf = 134218240;
        v28 = v8;
        v29 = 2048;
        v30 = objc_msgSend(MessageWithLimit, "count");
        _os_log_impl(&dword_1ABB60000, v7, OS_LOG_TYPE_INFO, "Enforing lastMessage load limit of %lld, found %lu chats with messages", buf, 0x16u);
      }
    }
  }
  if (xarray)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (v3 >= 1)
    {
      v10 = 0;
      v11 = v3;
      do
      {
        v12 = objc_msgSend(active, "objectAtIndex:", v10);
        v13 = v12;
        if (v6)
        {
          v14 = (void *)objc_msgSend(MessageWithLimit, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", IMDChatRecordGetIdentifier(v12)));
          v15 = v14;
          if (v14)
          {
            v16 = objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("l")), "BOOLValue");
            v17 = objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("d")), "integerValue");
          }
          else
          {
            v16 = 0;
            v17 = -1;
          }
        }
        else
        {
          v17 = -1;
          v16 = 1;
        }
        v18 = xpc_dictionary_create(0, 0, 0);
        if (v18)
        {
          _IMDChatRecordBulkCopyXPCDictionary(v13, (uint64_t)v18, 1, 0, v16, 1);
          xpc_dictionary_set_int64(v18, "last_message_date_on_load", v17);
          xpc_array_append_value(xarray, v18);
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v18, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", xpc_dictionary_get_int64(v18, "recordIdentifier")));
          xpc_release(v18);
        }
        ++v10;
      }
      while (v11 != v10);
    }
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = sub_1ABC377A0;
    v26[3] = &unk_1E5ABF8B0;
    v26[4] = v9;
    _IMDMessageRecordCountAllUnreadMessagesForAllUnreadChats((uint64_t)v26);
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", &unk_1E5AAE7D8);

    v19 = (void *)v22[4];
    if (v19)
      xpc_dictionary_set_value(v19, "array_result", xarray);
    xpc_release(xarray);
  }

  if (active)
    CFRelease(active);
  objc_msgSend(v23, "stopTimingForKey:", CFSTR("goFetchAllActiveChats"));
  if (IMOSLoggingEnabled())
  {
    v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v23;
      _os_log_impl(&dword_1ABB60000, v20, OS_LOG_TYPE_INFO, "Finished timing goFetchAllActiveChats with time: %@", buf, 0xCu);
    }
  }

  result = v22[5];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void *sub_1ABC377A0(uint64_t a1, uint64_t a2, int64_t a3)
{
  void *result;

  result = (void *)objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2));
  if (result)
  {
    xpc_dictionary_set_int64(result, "unread_count_cache", a3);
    return (void *)objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2));
  }
  return result;
}

void sub_1ABC37834(int a1, int a2, xpc_object_t xdict)
{
  xpc_dictionary_set_int64(xdict, "unread_count_cache", 0);
}

void __XPCServerIMDChatRecordCopyAllUnreadChatsAndRecentChatsWithLimit_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _BOOL4 v6;
  _QWORD v7[8];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1ABC378A8;
  v7[3] = &unk_1E5ABF5C0;
  v7[6] = a5;
  v7[7] = a6;
  v7[4] = a3;
  v7[5] = a4;
  v6 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1ABC378A8(_QWORD *a1)
{
  id v2;
  id v3;
  id v4;
  xpc_object_t v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  xpc_object_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t result;
  _QWORD v14[5];
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0D36AE8]);
  objc_msgSend(v2, "startTimingForKey:", CFSTR("copyRecentChats"));
  v3 = IMDChatRecordCopyAllUnreadChatsAndRecentChatsWithLimit(a1[6], a1[7]);
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = xpc_array_create(0, 0);
  if (v5)
  {
    v6 = v5;
    if (objc_msgSend(v3, "count"))
    {
      v7 = 0;
      do
      {
        v8 = objc_msgSend(v3, "objectAtIndex:", v7);
        v9 = xpc_dictionary_create(0, 0, 0);
        if (v9)
        {
          v10 = v9;
          _IMDChatRecordBulkCopyXPCDictionary(v8, (uint64_t)v9, 1, 0, 1, 1);
          xpc_dictionary_set_int64(v10, "unread_count_cache", 0);
          objc_msgSend(v4, "setObject:forKey:", v10, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", IMDChatRecordGetIdentifier(v8)));
          xpc_array_append_value(v6, v10);
          xpc_release(v10);
        }
        ++v7;
      }
      while (v7 < objc_msgSend(v3, "count"));
    }
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_1ABC37B20;
    v14[3] = &unk_1E5ABF8B0;
    v14[4] = v4;
    _IMDMessageRecordCountAllUnreadMessagesForAllUnreadChats((uint64_t)v14);
    v11 = (void *)a1[4];
    if (v11)
      xpc_dictionary_set_value(v11, "array_result", v6);
    xpc_release(v6);
  }

  objc_msgSend(v2, "stopTimingForKey:", CFSTR("copyRecentChats"));
  if (IMOSLoggingEnabled())
  {
    v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v2;
      _os_log_impl(&dword_1ABB60000, v12, OS_LOG_TYPE_INFO, "Finished timing copyRecentChats with time: %@", buf, 0xCu);
    }
  }

  result = a1[5];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_1ABC37B20(uint64_t a1, uint64_t a2, int64_t a3)
{
  void *v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  int64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2));
  if (v5)
  {
    xpc_dictionary_set_int64(v5, "unread_count_cache", a3);
  }
  else if (IMOSLoggingEnabled())
  {
    v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = 134218240;
      v8 = a2;
      v9 = 2048;
      v10 = a3;
      _os_log_impl(&dword_1ABB60000, v6, OS_LOG_TYPE_INFO, "An unread chat was not included in recent chats with rowID: %llu unreadCount: %lld", (uint8_t *)&v7, 0x16u);
    }
  }
}

void __XPCServerIMDCoreSpotlightAddMessageGUID_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _BOOL4 v6;
  _QWORD v7[7];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1ABC37CD8;
  v7[3] = &unk_1E5ABF4F8;
  v7[5] = a4;
  v7[6] = a6;
  v7[4] = a5;
  v6 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1ABC37CD8(uint64_t a1)
{
  uint64_t result;

  IMDCoreSpotlightAddMessageGUID(*(void **)(a1 + 32), *(_QWORD *)(a1 + 48));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDCoreSpotlightAddMessageGUIDs_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _BOOL4 v6;
  _QWORD v7[7];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1ABC37D78;
  v7[3] = &unk_1E5ABF4F8;
  v7[5] = a4;
  v7[6] = a6;
  v7[4] = a5;
  v6 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1ABC37D78(uint64_t a1)
{
  uint64_t result;

  IMDCoreSpotlightAddMessageGUIDs(*(void **)(a1 + 32), *(_QWORD *)(a1 + 48));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDCoreSpotlightDeleteMessageGUIDs_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _BOOL4 v6;
  _QWORD v7[7];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1ABC37E18;
  v7[3] = &unk_1E5ABF4F8;
  v7[5] = a4;
  v7[6] = a6;
  v7[4] = a5;
  v6 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1ABC37E18(uint64_t a1)
{
  uint64_t result;

  IMDCoreSpotlightDeleteMessageGUIDS(*(void **)(a1 + 32), *(_QWORD *)(a1 + 48));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDCoreSpotlightAddChatGUID_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _BOOL4 v6;
  _QWORD v7[7];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1ABC37EB8;
  v7[3] = &unk_1E5ABF4F8;
  v7[5] = a4;
  v7[6] = a6;
  v7[4] = a5;
  v6 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1ABC37EB8(uint64_t a1)
{
  uint64_t result;

  IMDCoreSpotlightAddChatGUID(*(void **)(a1 + 32), *(_QWORD *)(a1 + 48));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDCoreSpotlightDeleteChatGUID_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _BOOL4 v6;
  _QWORD v7[7];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1ABC37F58;
  v7[3] = &unk_1E5ABF4F8;
  v7[5] = a4;
  v7[6] = a6;
  v7[4] = a5;
  v6 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1ABC37F58(uint64_t a1)
{
  uint64_t result;

  IMDCoreSpotlightDeleteChatGUID(*(void **)(a1 + 32), *(_QWORD *)(a1 + 48));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDCoreSpotlightSetNeedsMessageReindex_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _BOOL4 v5;
  _QWORD v6[6];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1ABC37FF4;
  v6[3] = &unk_1E5ABF4D0;
  v6[4] = a4;
  v6[5] = a5;
  v5 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v6, v5);
}

void sub_1ABC37FF4(uint64_t a1)
{
  IMDCoreSpotlightSetNeedsMessageReindex(*(_QWORD *)(a1 + 40), *(void **)(a1 + 32));
}

void __XPCServerIMDCoreSpotlightIndexNextMessageBatchIfNeeded_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _BOOL4 v6;
  _QWORD v7[7];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1ABC38060;
  v7[3] = &unk_1E5ABF570;
  v7[5] = a5;
  v7[6] = a6;
  v7[4] = a4;
  v6 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v7, v6);
}

void sub_1ABC38060(uint64_t a1)
{
  IMDCoreSpotlightIndexNextMessageBatchIfNeeded(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(void **)(a1 + 32));
}

void __XPCServerIMDCoreSpotlightReindexMessages_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _BOOL4 v6;
  _QWORD v7[7];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1ABC380D0;
  v7[3] = &unk_1E5ABF4F8;
  v7[5] = a4;
  v7[6] = a6;
  v7[4] = a5;
  v6 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v7, v6);
}

void sub_1ABC380D0(uint64_t a1)
{
  IMDCoreSpotlightReindexMessages(*(void **)(a1 + 32), *(_QWORD *)(a1 + 48), *(void **)(a1 + 40));
}

void __XPCServerIMDCoreSpotlightReindexMessagesWithCollaborationMetadata_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _BOOL4 v7;
  _QWORD v8[8];

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1ABC38140;
  v8[3] = &unk_1E5ABF8F8;
  v8[4] = a5;
  v8[5] = a6;
  v8[6] = a4;
  v8[7] = a7;
  v7 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v8, v7);
}

uint64_t sub_1ABC38140(uint64_t a1)
{
  uint64_t result;

  IMDCoreSpotlightReindexMessagesWithCollaborationMetadata(*(void **)(a1 + 32), *(void **)(a1 + 40), *(_QWORD *)(a1 + 56));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDChatRecordCopyChatForGUID_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _BOOL4 v5;
  _QWORD v6[7];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1ABC381E4;
  v6[3] = &unk_1E5ABF480;
  v6[4] = a5;
  v6[5] = a3;
  v6[6] = a4;
  v5 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v6, v5);
}

void sub_1ABC381E4(uint64_t a1)
{
  CFStringRef v2;
  CFStringRef v3;
  uint64_t v4;

  v2 = IMDChatRecordCopyChatForGUID(*(CFStringRef *)(a1 + 32));
  v3 = v2;
  if (v2)
    _IMDChatRecordBulkCopyXPCDictionary((uint64_t)v2, *(_QWORD *)(a1 + 40), 0, 0, 1, 1);
  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
    (*(void (**)(void))(v4 + 16))();
  if (v3)
    CFRelease(v3);
}

void __XPCServerIMDChatRecordCopyChatRecordForIdentifier_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _BOOL4 v5;
  _QWORD v6[7];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1ABC382B0;
  v6[3] = &unk_1E5ABF4F8;
  v6[5] = a4;
  v6[6] = a5;
  v6[4] = a3;
  v5 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v6, v5);
}

void sub_1ABC382B0(uint64_t *a1)
{
  uint64_t v2;
  const void *v3;
  uint64_t v4;

  v2 = IMDChatRecordCopyChatRecord(a1[6]);
  v3 = (const void *)v2;
  if (v2)
    _IMDChatRecordBulkCopyXPCDictionary(v2, a1[4], 0, 0, 1, 1);
  v4 = a1[5];
  if (v4)
    (*(void (**)(void))(v4 + 16))();
  if (v3)
    CFRelease(v3);
}

void __XPCServerIMDChatRecordCopyChatForMessageID_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _BOOL4 v5;
  _QWORD v6[7];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1ABC3837C;
  v6[3] = &unk_1E5ABF4F8;
  v6[5] = a4;
  v6[6] = a5;
  v6[4] = a3;
  v5 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v6, v5);
}

void sub_1ABC3837C(uint64_t *a1)
{
  int64_t v2;
  const void *v3;
  uint64_t v4;

  v2 = IMDChatRecordCopyChatForMessageID(a1[6]);
  v3 = (const void *)v2;
  if (v2)
    _IMDChatRecordBulkCopyXPCDictionary(v2, a1[4], 0, 0, 0, 1);
  v4 = a1[5];
  if (v4)
    (*(void (**)(void))(v4 + 16))();
  if (v3)
    CFRelease(v3);
}

void __XPCServerIMDChatRecordCopyChatsWithHandleOnService_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _BOOL4 v6;
  _QWORD v7[8];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1ABC38448;
  v7[3] = &unk_1E5ABF598;
  v7[4] = a5;
  v7[5] = a6;
  v7[6] = a3;
  v7[7] = a4;
  v6 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1ABC38448(uint64_t a1)
{
  const __CFArray *v2;
  xpc_object_t v3;
  void *v4;
  void *v5;
  uint64_t result;

  v2 = (const __CFArray *)IMDChatRecordCopyChatsWithHandleOnService(*(const __CFString **)(a1 + 32), *(const __CFString **)(a1 + 40));
  v3 = xpc_array_create(0, 0);
  if (v3)
  {
    v4 = v3;
    _IMDChatRecordCopyChatsToXPCArray(v2, v3, 0, 0, 0, 1);
    v5 = *(void **)(a1 + 48);
    if (v5)
      xpc_dictionary_set_value(v5, "array_result", v4);
    xpc_release(v4);
  }
  if (v2)
    CFRelease(v2);
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDChatRecordCopyChatsWithIdentifierOnService_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _BOOL4 v6;
  _QWORD v7[8];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1ABC38554;
  v7[3] = &unk_1E5ABF598;
  v7[4] = a5;
  v7[5] = a6;
  v7[6] = a3;
  v7[7] = a4;
  v6 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1ABC38554(uint64_t a1)
{
  const __CFArray *v2;
  xpc_object_t v3;
  void *v4;
  void *v5;
  uint64_t result;

  v2 = (const __CFArray *)IMDChatRecordCopyChatsWithIdentifierOnService(*(const __CFString **)(a1 + 32), *(const __CFString **)(a1 + 40));
  v3 = xpc_array_create(0, 0);
  if (v3)
  {
    v4 = v3;
    _IMDChatRecordCopyChatsToXPCArray(v2, v3, 0, 0, 0, 1);
    v5 = *(void **)(a1 + 48);
    if (v5)
      xpc_dictionary_set_value(v5, "array_result", v4);
    xpc_release(v4);
  }
  if (v2)
    CFRelease(v2);
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDChatRecordCopyChatsWithRoomnameOnService_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _BOOL4 v6;
  _QWORD v7[8];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1ABC38660;
  v7[3] = &unk_1E5ABF598;
  v7[4] = a5;
  v7[5] = a6;
  v7[6] = a3;
  v7[7] = a4;
  v6 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1ABC38660(uint64_t a1)
{
  const __CFArray *v2;
  xpc_object_t v3;
  void *v4;
  void *v5;
  uint64_t result;

  v2 = (const __CFArray *)IMDChatRecordCopyChatsWithRoomnameOnService(*(const __CFString **)(a1 + 32), *(const __CFString **)(a1 + 40));
  v3 = xpc_array_create(0, 0);
  if (v3)
  {
    v4 = v3;
    _IMDChatRecordCopyChatsToXPCArray(v2, v3, 0, 0, 0, 1);
    v5 = *(void **)(a1 + 48);
    if (v5)
      xpc_dictionary_set_value(v5, "array_result", v4);
    xpc_release(v4);
  }
  if (v2)
    CFRelease(v2);
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDChatRecordCopyChatsWithGroupID_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _BOOL4 v5;
  _QWORD v6[7];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1ABC3876C;
  v6[3] = &unk_1E5ABF480;
  v6[4] = a5;
  v6[5] = a3;
  v6[6] = a4;
  v5 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1ABC3876C(uint64_t a1)
{
  const __CFArray *v2;
  xpc_object_t v3;
  void *v4;
  void *v5;
  uint64_t result;

  v2 = (const __CFArray *)IMDChatRecordCopyChatsWithGroupID(*(const __CFString **)(a1 + 32));
  v3 = xpc_array_create(0, 0);
  if (v3)
  {
    v4 = v3;
    _IMDChatRecordCopyChatsToXPCArray(v2, v3, 0, 0, 0, 1);
    v5 = *(void **)(a1 + 40);
    if (v5)
      xpc_dictionary_set_value(v5, "array_result", v4);
    xpc_release(v4);
  }
  if (v2)
    CFRelease(v2);
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDChatRecordCopyNewestChatForGroupIDOnService_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  _BOOL4 v7;
  _QWORD v8[8];
  char v9;

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1ABC38878;
  v8[3] = &unk_1E5ABF920;
  v8[4] = a5;
  v8[5] = a6;
  v9 = a7;
  v8[6] = a3;
  v8[7] = a4;
  v7 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v8, v7);
}

void sub_1ABC38878(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  uint64_t v4;

  v2 = IMDChatRecordCopyNewestChatForGroupIDOnService(*(const __CFString **)(a1 + 32), *(const __CFString **)(a1 + 40), *(unsigned __int8 *)(a1 + 64));
  v3 = (const void *)v2;
  if (v2)
    _IMDChatRecordBulkCopyXPCDictionary(v2, *(_QWORD *)(a1 + 48), 0, 0, 0, 1);
  v4 = *(_QWORD *)(a1 + 56);
  if (v4)
    (*(void (**)(void))(v4 + 16))();
  if (v3)
    CFRelease(v3);
}

void __XPCServerIMDChatRecordDeleteChatForGUID_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _BOOL4 v5;
  _QWORD v6[6];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1ABC38948;
  v6[3] = &unk_1E5ABF430;
  v6[4] = a5;
  v6[5] = a4;
  v5 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1ABC38948(uint64_t a1)
{
  uint64_t result;

  IMDChatRecordDeleteChatForGUID(*(__CFString **)(a1 + 32));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDChatRecordAssociateMessageWithGUIDToChatWithGUIDIfNeeded_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _BOOL4 v6;
  _QWORD v7[7];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1ABC389E4;
  v7[3] = &unk_1E5ABF480;
  v7[4] = a5;
  v7[5] = a6;
  v7[6] = a4;
  v6 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1ABC389E4(uint64_t *a1)
{
  uint64_t result;

  IMDChatRecordAssociateMessageWithGUIDToChatWithGUIDIfNeeded(a1[4], a1[5]);
  result = a1[6];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDChatRecordDisassociateMessageWithGUIDFromChatWithGUIDIfNeeded_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _BOOL4 v6;
  _QWORD v7[7];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1ABC38A84;
  v7[3] = &unk_1E5ABF480;
  v7[4] = a5;
  v7[5] = a6;
  v7[6] = a4;
  v6 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1ABC38A84(uint64_t a1)
{
  uint64_t result;

  IMDChatRecordDisassociateMessageWithGUIDFromChatWithGUIDIfNeeded(*(const __CFString **)(a1 + 32), *(const __CFString **)(a1 + 40));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDChatRecordCopyChatGUIDsWithUnplayedAudioMessages_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _BOOL4 v4;
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1ABC38B20;
  v5[3] = &unk_1E5ABF430;
  v5[4] = a3;
  v5[5] = a4;
  v4 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v5, v4);
}

uint64_t sub_1ABC38B20(uint64_t a1)
{
  CFMutableArrayRef v2;
  xpc_object_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  xpc_object_t v10;
  void *v11;
  void *v12;
  uint64_t result;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = IMDChatRecordCopyChatGUIDsWithUnplayedAudioMessages();
  v3 = xpc_array_create(0, 0);
  if (v3)
  {
    v4 = v3;
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = -[__CFArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v2);
          v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if (objc_msgSend(v9, "UTF8String"))
          {
            v10 = xpc_string_create((const char *)objc_msgSend(v9, "UTF8String"));
            if (v10)
            {
              v11 = v10;
              xpc_array_append_value(v4, v10);
              xpc_release(v11);
            }
          }
        }
        v6 = -[__CFArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v6);
    }
    v12 = *(void **)(a1 + 32);
    if (v12)
      xpc_dictionary_set_value(v12, "array_result", v4);
    xpc_release(v4);
  }
  if (v2)
    CFRelease(v2);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDChatRecordSetIsFiltered_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _BOOL4 v6;
  _QWORD v7[7];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1ABC38CF0;
  v7[3] = &unk_1E5ABF4F8;
  v7[5] = a4;
  v7[6] = a6;
  v7[4] = a5;
  v6 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1ABC38CF0(uint64_t a1)
{
  uint64_t result;

  IMDChatRecordSetIsFiltered(*(const __CFString **)(a1 + 32), *(_QWORD *)(a1 + 48));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDChatRecordDeleteEmptyChats_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _BOOL4 v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1ABC38D8C;
  v5[3] = &unk_1E5AB43E8;
  v5[4] = a4;
  v4 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v5, v4);
}

uint64_t sub_1ABC38D8C(uint64_t a1)
{
  uint64_t result;

  IMDChatRecordDeleteEmptyChats();
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDChatRecordCopyChatIdentitiesForMessageWithGUIDs_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _BOOL4 v5;
  _QWORD v6[7];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1ABC38E24;
  v6[3] = &unk_1E5ABF480;
  v6[4] = a5;
  v6[5] = a3;
  v6[6] = a4;
  v5 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1ABC38E24(uint64_t a1)
{
  const __CFArray *v2;
  xpc_object_t v3;
  void *v4;
  void *v5;
  uint64_t result;

  v2 = IMDChatRecordCopyChatIdentitiesForMessageWithGUIDs(*(const __CFArray **)(a1 + 32));
  v3 = xpc_dictionary_create(0, 0, 0);
  if (v3)
  {
    v4 = v3;
    if (-[__CFArray count](v2, "count"))
      IMInsertArraysToXPCDictionary();
    v5 = *(void **)(a1 + 40);
    if (v5)
      xpc_dictionary_set_value(v5, "array_result", v4);
    xpc_release(v4);
  }
  if (v2)
    CFRelease(v2);
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDChatRecordRepairDuplicateChats_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _BOOL4 v7;
  _QWORD v8[9];

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1ABC38F44;
  v8[3] = &unk_1E5ABF948;
  v8[4] = a5;
  v8[5] = a6;
  v8[6] = a7;
  v8[7] = a3;
  v8[8] = a4;
  v7 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v8, v7);
}

uint64_t sub_1ABC38F44(uint64_t a1)
{
  int v2;
  NSObject *v3;
  const __CFString *v4;
  void *v5;
  BOOL v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t result;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v2 = IMDChatRecordRepairDuplicateChats(*(void **)(a1 + 32), *(_QWORD *)(a1 + 40), *(void **)(a1 + 48), &v12);
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = CFSTR("NO");
      if (v2)
        v4 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      v14 = (uint64_t)v4;
      _os_log_impl(&dword_1ABB60000, v3, OS_LOG_TYPE_INFO, "IMDChatRecordRepairDuplicateChats is returned %@", buf, 0xCu);
    }
  }
  v5 = *(void **)(a1 + 56);
  if (v5)
  {
    xpc_dictionary_set_BOOL(v5, "BOOL_result", v2);
    if ((v2 & 1) == 0)
    {
      v6 = v12 == 0;
      v7 = IMOSLoggingEnabled();
      if (v6)
      {
        if (v7)
        {
          v10 = OSLogHandleForIMEventCategory();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1ABB60000, v10, OS_LOG_TYPE_INFO, "got NO success with NO error!?", buf, 2u);
          }
        }
      }
      else
      {
        if (v7)
        {
          v8 = OSLogHandleForIMEventCategory();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
          {
            v9 = objc_msgSend(v12, "description");
            *(_DWORD *)buf = 138412290;
            v14 = v9;
            _os_log_impl(&dword_1ABB60000, v8, OS_LOG_TYPE_INFO, "got NO success with error: %@", buf, 0xCu);
          }
        }
        xpc_dictionary_set_string(*(xpc_object_t *)(a1 + 56), "error_domain", (const char *)objc_msgSend((id)objc_msgSend(v12, "domain"), "UTF8String"));
        xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 56), "error_code", objc_msgSend(v12, "code"));
        xpc_dictionary_set_string(*(xpc_object_t *)(a1 + 56), "error_localized_description", (const char *)objc_msgSend((id)objc_msgSend(v12, "localizedDescription"), "UTF8String"));
      }
    }
  }
  result = *(_QWORD *)(a1 + 64);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDChatRecordSplitDatabaseByDays_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _BOOL4 v6;
  _QWORD v7[8];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1ABC3921C;
  v7[3] = &unk_1E5ABF8F8;
  v7[4] = a6;
  v7[5] = a3;
  v7[6] = a4;
  v7[7] = a5;
  v6 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1ABC3921C(uint64_t a1)
{
  char v2;
  uint64_t result;

  v2 = IMDTrimSharedDatabaseToDays(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), 0);
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 40), "BOOL_result", v2);
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDChatRecordSplitDatabaseByRecentCount_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _BOOL4 v6;
  _QWORD v7[8];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1ABC392D4;
  v7[3] = &unk_1E5ABF8F8;
  v7[4] = a6;
  v7[5] = a3;
  v7[6] = a4;
  v7[7] = a5;
  v6 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1ABC392D4(uint64_t a1)
{
  char v2;
  uint64_t result;

  v2 = IMDTrimSharedDatabaseToMessageCount(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), 0);
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 40), "BOOL_result", v2);
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDSwitchDatabase_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _BOOL4 v5;
  _QWORD v6[6];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1ABC39388;
  v6[3] = &unk_1E5ABF430;
  v6[4] = a5;
  v6[5] = a4;
  v5 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1ABC39388(uint64_t a1)
{
  uint64_t result;

  IMDSwitchToDatabase();
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDMessageRecordCopyArrayOfAssociatedMessagesForMessageGUIDFromSender_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _BOOL4 v6;
  _QWORD v7[8];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1ABC39424;
  v7[3] = &unk_1E5ABF598;
  v7[4] = a5;
  v7[5] = a6;
  v7[6] = a3;
  v7[7] = a4;
  v6 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1ABC39424(uint64_t a1)
{
  void *v2;
  xpc_object_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  xpc_object_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t result;
  id v14;

  v14 = 0;
  v2 = (void *)IMDMessageRecordCopyArrayOfAssociatedMessagesForMessageGUIDFromSender(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), (void (*)(void))&v14);
  v3 = xpc_array_create(0, 0);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v2, "count");
    if (v5 >= 1)
    {
      v6 = 0;
      v7 = v5;
      do
      {
        v8 = objc_msgSend(v2, "objectAtIndex:", v6);
        v9 = xpc_dictionary_create(0, 0, 0);
        if (v9)
        {
          v10 = v9;
          _IMDMessageRecordBulkCopyXPCDictionary(v8, (uint64_t)v9, 0, 0);
          xpc_array_append_value(v4, v10);
          xpc_release(v10);
        }
        ++v6;
      }
      while (v7 != v6);
    }
    v11 = *(void **)(a1 + 48);
    if (v11)
      xpc_dictionary_set_value(v11, "array_result", v4);
    xpc_release(v4);
  }
  if (v14)
  {
    v12 = *(void **)(a1 + 48);
    if (v12)
    {
      xpc_dictionary_set_int64(v12, "error_code", objc_msgSend(v14, "code"));
      xpc_dictionary_set_string(*(xpc_object_t *)(a1 + 48), "error_domain", (const char *)objc_msgSend((id)objc_msgSend(v14, "domain"), "UTF8String"));
      if (objc_msgSend((id)objc_msgSend(v14, "localizedDescription"), "UTF8String"))
        xpc_dictionary_set_string(*(xpc_object_t *)(a1 + 48), "error_description", (const char *)objc_msgSend((id)objc_msgSend(v14, "localizedDescription"), "UTF8String"));
    }
  }
  if (v2)
    CFRelease(v2);
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDCoreSpotlightMarkAttachment_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  _BOOL4 v9;
  _QWORD v10[11];
  char v11;

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1ABC39630;
  v10[3] = &unk_1E5ABF970;
  v10[4] = a6;
  v10[5] = a5;
  v10[6] = a1;
  v10[7] = a7;
  v11 = a9;
  v10[8] = a8;
  v10[9] = a3;
  v10[10] = a4;
  v9 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v10, v9);
}

uint64_t sub_1ABC39630(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  int v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  const __CFString *v16;
  uint64_t v17;
  void *v18;
  uint64_t result;
  _BYTE v20[32];
  uint8_t buf[40];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "UTF8String");
    v3 = sandbox_extension_consume();
    if (v3 != -1)
      goto LABEL_7;
    if (IMOSLoggingEnabled())
    {
      v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v6 = *(_QWORD *)(a1 + 32);
        v5 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v5;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v6;
        _os_log_impl(&dword_1ABB60000, v4, OS_LOG_TYPE_INFO, "Failed to consume sandbox token, %@ token: %@", buf, 0x16u);
      }
    }
  }
  v3 = -1;
LABEL_7:
  memset(buf, 0, 32);
  xpc_connection_get_audit_token();
  objc_msgSend(*(id *)(a1 + 40), "UTF8String");
  *(_OWORD *)v20 = *(_OWORD *)buf;
  *(_OWORD *)&v20[16] = *(_OWORD *)&buf[16];
  v7 = sandbox_check_by_audit_token();
  if (v7)
  {
    if (IMOSLoggingEnabled())
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = *__error();
        v10 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)v20 = 67109890;
        *(_DWORD *)&v20[4] = v7;
        *(_WORD *)&v20[8] = 1024;
        *(_DWORD *)&v20[10] = v9;
        *(_WORD *)&v20[14] = 1024;
        *(_DWORD *)&v20[16] = buf;
        *(_WORD *)&v20[20] = 2112;
        *(_QWORD *)&v20[22] = v10;
        _os_log_impl(&dword_1ABB60000, v8, OS_LOG_TYPE_INFO, "Denying access to attachment, (check %d, errno %d) client with audit token: %u not allowed to access request path: %@", v20, 0x1Eu);
      }
    }
    v11 = 0;
  }
  else
  {
    v11 = IMDCoreSpotlightMarkAttachment();
  }
  if (v3 != -1 && sandbox_extension_release() == -1)
  {
    if (IMOSLoggingEnabled())
    {
      v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v14 = *(_QWORD *)(a1 + 32);
        v13 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)v20 = 138412546;
        *(_QWORD *)&v20[4] = v13;
        *(_WORD *)&v20[12] = 2112;
        *(_QWORD *)&v20[14] = v14;
        _os_log_impl(&dword_1ABB60000, v12, OS_LOG_TYPE_INFO, "Failed to release sandbox token, %@ token: %@", v20, 0x16u);
      }
    }
  }
  if (IMOSLoggingEnabled())
  {
    v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = CFSTR("NO");
      v17 = *(_QWORD *)(a1 + 40);
      if (v11)
        v16 = CFSTR("YES");
      *(_DWORD *)v20 = 138412546;
      *(_QWORD *)&v20[4] = v17;
      *(_WORD *)&v20[12] = 2112;
      *(_QWORD *)&v20[14] = v16;
      _os_log_impl(&dword_1ABB60000, v15, OS_LOG_TYPE_INFO, "Mark file %@ succedded ? %@", v20, 0x16u);
    }
  }
  v18 = *(void **)(a1 + 72);
  if (v18)
    xpc_dictionary_set_BOOL(v18, "BOOL_result", v11);
  result = *(_QWORD *)(a1 + 80);
  if (result)
    return (*(uint64_t (**)(uint64_t))(result + 16))(result);
  return result;
}

void __XPCServerIMDDowngradeDatabase_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _BOOL4 v7;
  _QWORD v8[9];

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1ABC399DC;
  v8[3] = &unk_1E5ABF610;
  v8[4] = a5;
  v8[5] = a6;
  v8[7] = a4;
  v8[8] = a7;
  v8[6] = a3;
  v7 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v8, v7);
}

uint64_t sub_1ABC399DC(uint64_t *a1)
{
  char v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t result;
  uint64_t v7;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v2 = IMDDowngradeDatabaseToVersion(a1[4], a1[5], a1[8], (void (*)(void))&v7);
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = a1[8];
      *(_DWORD *)buf = 134217984;
      v9 = v4;
      _os_log_impl(&dword_1ABB60000, v3, OS_LOG_TYPE_INFO, "Downgrade Database to version %ld", buf, 0xCu);
    }
  }
  v5 = (void *)a1[6];
  if (v5)
    xpc_dictionary_set_BOOL(v5, "BOOL_result", v2);
  if (v7)
    _IMDInsertErrorToXPCDictionary(a1[6], "error");
  result = a1[7];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDMessageRecordCopyMessagesToUploadToCloudKit_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _BOOL4 v5;
  _QWORD v6[7];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1ABC39B64;
  v6[3] = &unk_1E5ABF4F8;
  v6[5] = a4;
  v6[6] = a5;
  v6[4] = a3;
  v5 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1ABC39B64(_QWORD *a1)
{
  void *v2;
  xpc_object_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  xpc_object_t v9;
  void *v10;
  void *v11;
  uint64_t result;

  v2 = (void *)IMDMessageRecordCopyMessagesToUploadToCloudKitWithLimit(a1[6]);
  if (v2)
  {
    v3 = xpc_array_create(0, 0);
    if (v3)
    {
      v4 = v3;
      v5 = objc_msgSend(v2, "count");
      if (v5 >= 1)
      {
        v6 = 0;
        v7 = v5;
        do
        {
          v8 = objc_msgSend(v2, "objectAtIndex:", v6);
          v9 = xpc_dictionary_create(0, 0, 0);
          if (v9)
          {
            v10 = v9;
            _IMDMessageRecordBulkCopyXPCDictionary(v8, (uint64_t)v9, 1, 1);
            xpc_array_append_value(v4, v10);
            xpc_release(v10);
          }
          ++v6;
        }
        while (v7 != v6);
      }
      v11 = (void *)a1[4];
      if (v11)
        xpc_dictionary_set_value(v11, "array_result", v4);
      xpc_release(v4);
    }
  }

  result = a1[5];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDMessageRecordCopyMessagesPendingUpdateT1ToCloudKit_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _BOOL4 v5;
  _QWORD v6[7];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1ABC39CDC;
  v6[3] = &unk_1E5ABF4F8;
  v6[5] = a4;
  v6[6] = a5;
  v6[4] = a3;
  v5 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1ABC39CDC(uint64_t a1)
{
  uint64_t v1;
  void *updated;
  xpc_object_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  xpc_object_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t result;
  uint64_t v16;

  v1 = a1;
  updated = (void *)IMDMessageRecordCopyMessagesPendingUpdateT1ToCloudKitWithLimit(*(_QWORD *)(a1 + 48));
  if (updated)
  {
    v3 = xpc_array_create(0, 0);
    if (v3)
    {
      v4 = v3;
      v16 = v1;
      v5 = objc_msgSend(updated, "count");
      if (v5 >= 1)
      {
        v6 = 0;
        v7 = v5;
        do
        {
          v8 = (void *)objc_msgSend(updated, "objectAtIndex:", v6);
          v9 = xpc_dictionary_create(0, 0, 0);
          if (v9)
          {
            v10 = v9;
            v11 = (void *)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MID"));
            v12 = (void *)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("TOID"));
            v13 = (void *)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("TOPart"));
            xpc_dictionary_set_int64(v10, "ROWID", objc_msgSend((id)objc_msgSend(v8, "objectForKey:", CFSTR("ROWID")), "longLongValue"));
            if (objc_msgSend(v11, "UTF8String"))
              xpc_dictionary_set_string(v10, "MID", (const char *)objc_msgSend(v11, "UTF8String"));
            if (objc_msgSend(v12, "UTF8String"))
              xpc_dictionary_set_string(v10, "TOID", (const char *)objc_msgSend(v12, "UTF8String"));
            if (objc_msgSend(v13, "UTF8String"))
              xpc_dictionary_set_string(v10, "TOPart", (const char *)objc_msgSend(v13, "UTF8String"));
            xpc_array_append_value(v4, v10);
            xpc_release(v10);
          }
          ++v6;
        }
        while (v7 != v6);
      }
      v1 = v16;
      v14 = *(void **)(v16 + 32);
      if (v14)
        xpc_dictionary_set_value(v14, "array_result", v4);
      xpc_release(v4);
    }
  }

  result = *(_QWORD *)(v1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDMessageRecordCopyMessagesPendingUpdateT2ToCloudKit_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _BOOL4 v5;
  _QWORD v6[7];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1ABC39F3C;
  v6[3] = &unk_1E5ABF4F8;
  v6[5] = a4;
  v6[6] = a5;
  v6[4] = a3;
  v5 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1ABC39F3C(uint64_t a1)
{
  uint64_t v1;
  void *updated;
  xpc_object_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  xpc_object_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t result;
  uint64_t v16;

  v1 = a1;
  updated = (void *)IMDMessageRecordCopyMessagesPendingUpdateT2ToCloudKitWithLimit(*(_QWORD *)(a1 + 48));
  if (updated)
  {
    v3 = xpc_array_create(0, 0);
    if (v3)
    {
      v4 = v3;
      v16 = v1;
      v5 = objc_msgSend(updated, "count");
      if (v5 >= 1)
      {
        v6 = 0;
        v7 = v5;
        do
        {
          v8 = (void *)objc_msgSend(updated, "objectAtIndex:", v6);
          v9 = xpc_dictionary_create(0, 0, 0);
          if (v9)
          {
            v10 = v9;
            v11 = (void *)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MID"));
            v12 = (void *)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SR"));
            v13 = (void *)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SSR"));
            xpc_dictionary_set_int64(v10, "ROWID", objc_msgSend((id)objc_msgSend(v8, "objectForKey:", CFSTR("ROWID")), "longLongValue"));
            if (objc_msgSend(v11, "UTF8String"))
              xpc_dictionary_set_string(v10, "MID", (const char *)objc_msgSend(v11, "UTF8String"));
            if (objc_msgSend(v12, "UTF8String"))
              xpc_dictionary_set_string(v10, "SR", (const char *)objc_msgSend(v12, "UTF8String"));
            if (objc_msgSend(v13, "UTF8String"))
              xpc_dictionary_set_string(v10, "SSR", (const char *)objc_msgSend(v13, "UTF8String"));
            xpc_array_append_value(v4, v10);
            xpc_release(v10);
          }
          ++v6;
        }
        while (v7 != v6);
      }
      v1 = v16;
      v14 = *(void **)(v16 + 32);
      if (v14)
        xpc_dictionary_set_value(v14, "array_result", v4);
      xpc_release(v4);
    }
  }

  result = *(_QWORD *)(v1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDMessageRecordCopyMessagesPendingUpdateT3ToCloudKit_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _BOOL4 v5;
  _QWORD v6[7];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1ABC3A19C;
  v6[3] = &unk_1E5ABF4F8;
  v6[5] = a4;
  v6[6] = a5;
  v6[4] = a3;
  v5 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1ABC3A19C(uint64_t a1)
{
  uint64_t v1;
  void *updated;
  xpc_object_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  xpc_object_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t result;
  uint64_t v14;

  v1 = a1;
  updated = (void *)IMDMessageRecordCopyMessagesPendingUpdateT3ToCloudKitWithLimit(*(_QWORD *)(a1 + 48));
  if (updated)
  {
    v3 = xpc_array_create(0, 0);
    if (v3)
    {
      v4 = v3;
      v14 = v1;
      v5 = objc_msgSend(updated, "count");
      if (v5 >= 1)
      {
        v6 = 0;
        v7 = v5;
        do
        {
          v8 = (void *)objc_msgSend(updated, "objectAtIndex:", v6);
          v9 = xpc_dictionary_create(0, 0, 0);
          if (v9)
          {
            v10 = v9;
            v11 = (void *)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MID"));
            xpc_dictionary_set_int64(v10, "ROWID", objc_msgSend((id)objc_msgSend(v8, "objectForKey:", CFSTR("ROWID")), "longLongValue"));
            if (objc_msgSend(v11, "UTF8String"))
              xpc_dictionary_set_string(v10, "MID", (const char *)objc_msgSend(v11, "UTF8String"));
            xpc_array_append_value(v4, v10);
            xpc_release(v10);
          }
          ++v6;
        }
        while (v7 != v6);
      }
      v1 = v14;
      v12 = *(void **)(v14 + 32);
      if (v12)
        xpc_dictionary_set_value(v12, "array_result", v4);
      xpc_release(v4);
    }
  }

  result = *(_QWORD *)(v1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDMessageRecordMarkAllMessagesAsNeedingCloudKitSync_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _BOOL4 v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1ABC3A388;
  v5[3] = &unk_1E5AB43E8;
  v5[4] = a4;
  v4 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v5, v4);
}

uint64_t sub_1ABC3A388(uint64_t a1)
{
  uint64_t result;

  IMDMessageRecordMarkAllMessagesAsNeedingCloudKitSync();
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDMessageRecordCopyMessagesToDeleteFromCloudKit_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _BOOL4 v5;
  _QWORD v6[7];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1ABC3A420;
  v6[3] = &unk_1E5ABF4F8;
  v6[5] = a4;
  v6[6] = a5;
  v6[4] = a3;
  v5 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1ABC3A420(_QWORD *a1)
{
  void *v2;
  xpc_object_t v3;
  void *v4;
  unint64_t v5;
  xpc_object_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t result;
  xpc_object_t xarray;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = (void *)IMDMessageRecordCopyRecordIDsAndGUIDsToDeleteWithLimit(a1[6]);
  if (objc_msgSend(v2, "count"))
  {
    v3 = xpc_array_create(0, 0);
    if (v3)
    {
      v4 = v3;
      if (objc_msgSend(v2, "count"))
      {
        v5 = 0;
        xarray = v4;
        v18 = v2;
        do
        {
          v6 = xpc_dictionary_create(0, 0, 0);
          if (v6)
          {
            v7 = v6;
            v8 = (void *)objc_msgSend(v2, "objectAtIndex:", v5);
            v19 = 0u;
            v20 = 0u;
            v21 = 0u;
            v22 = 0u;
            v9 = (void *)objc_msgSend(v8, "allKeys");
            v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
            if (v10)
            {
              v11 = v10;
              v12 = *(_QWORD *)v20;
              do
              {
                for (i = 0; i != v11; ++i)
                {
                  if (*(_QWORD *)v20 != v12)
                    objc_enumerationMutation(v9);
                  v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
                  if ((objc_msgSend(v14, "isEqualToString:", CFSTR("ROWID")) & 1) == 0)
                    xpc_dictionary_set_string(v7, (const char *)objc_msgSend(v14, "cStringUsingEncoding:", 4), (const char *)objc_msgSend((id)objc_msgSend(v8, "valueForKey:", v14), "cStringUsingEncoding:", 4));
                }
                v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
              }
              while (v11);
            }
            v4 = xarray;
            xpc_array_append_value(xarray, v7);
            xpc_release(v7);
            v2 = v18;
          }
          ++v5;
        }
        while (objc_msgSend(v2, "count") > v5);
      }
      v15 = (void *)a1[4];
      if (v15)
        xpc_dictionary_set_value(v15, "array_result", v4);
      xpc_release(v4);
    }
  }

  result = a1[5];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDUpdateWallpaperForCNContact_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _BOOL4 v6;
  _QWORD v7[8];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1ABC3A694;
  v7[3] = &unk_1E5ABF598;
  v7[4] = a5;
  v7[5] = a6;
  v7[6] = a3;
  v7[7] = a4;
  v6 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1ABC3A694(uint64_t a1)
{
  BOOL v2;
  void *v3;
  uint64_t result;

  v2 = IMDSaveWallpaperForCNContact(*(void **)(a1 + 32), *(void **)(a1 + 40));
  v3 = *(void **)(a1 + 48);
  if (v3)
    xpc_dictionary_set_BOOL(v3, "BOOL_result", v2);
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDMessageRecordAddGUIDAndCKRecordIDToDeleteFromCloudKit_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _BOOL4 v6;
  _QWORD v7[7];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1ABC3A74C;
  v7[3] = &unk_1E5ABF480;
  v7[4] = a5;
  v7[5] = a6;
  v7[6] = a4;
  v6 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1ABC3A74C(uint64_t a1)
{
  uint64_t result;

  IMDMessageRecordAddGUIDAndCKRecordIDToDeleteFromCloudKit(*(void **)(a1 + 32), *(void **)(a1 + 40));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDAddIncompatibleGroupPhotoChangedMessagesToDeleteFromCloudKit_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _BOOL4 v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1ABC3A7E8;
  v5[3] = &unk_1E5AB43E8;
  v5[4] = a4;
  v4 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v5, v4);
}

uint64_t sub_1ABC3A7E8(uint64_t a1)
{
  uint64_t result;

  IMDAddIncompatibleGroupPhotoChangedMessagesToDeleteFromCloudKit();
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDMessageRecordMarkDeletedTombStonedMessages_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _BOOL4 v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1ABC3A87C;
  v5[3] = &unk_1E5AB43E8;
  v5[4] = a4;
  v4 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v5, v4);
}

uint64_t sub_1ABC3A87C(uint64_t a1)
{
  uint64_t result;

  IMDMessageRecordClearDeleteTombStones();
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDMessageRecordDeleteTombStonedMessagesWithRecordIDs_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _BOOL4 v5;
  _QWORD v6[6];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1ABC3A910;
  v6[3] = &unk_1E5ABF430;
  v6[4] = a5;
  v6[5] = a4;
  v5 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1ABC3A910(uint64_t a1)
{
  uint64_t result;

  IMDMessageRecordDeleteTombStonedMessagesWithRecordIDs(*(const __CFArray **)(a1 + 32));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerInsertIntoDeletedChatsTable_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _BOOL4 v7;
  _QWORD v8[8];

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1ABC3A9AC;
  v8[3] = &unk_1E5ABF8F8;
  v8[4] = a5;
  v8[5] = a6;
  v8[6] = a4;
  v8[7] = a7;
  v7 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v8, v7);
}

uint64_t sub_1ABC3A9AC(uint64_t a1)
{
  uint64_t result;

  IMDChatInsertIntoDeletedChatsTable(*(void **)(a1 + 32), *(void **)(a1 + 40), *(_QWORD *)(a1 + 56));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDChatRecordCopyChatRecordIDsAndGUIDsToDeleteFromCloudKitWithLimit_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _BOOL4 v5;
  _QWORD v6[7];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1ABC3AA50;
  v6[3] = &unk_1E5ABF4F8;
  v6[5] = a4;
  v6[6] = a5;
  v6[4] = a3;
  v5 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1ABC3AA50(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  xpc_object_t v3;
  void *v4;
  unint64_t v5;
  xpc_object_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t result;
  uint64_t v17;
  xpc_object_t xarray;
  void *v19;
  unint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v1 = a1;
  v26 = *MEMORY[0x1E0C80C00];
  v2 = (void *)IMDChatCopyChatRecordIDsAndGUIDsToDeleteWithLimit(*(_QWORD *)(a1 + 48));
  if (objc_msgSend(v2, "count"))
  {
    v3 = xpc_array_create(0, 0);
    if (v3)
    {
      v4 = v3;
      v17 = v1;
      if (objc_msgSend(v2, "count"))
      {
        v5 = 0;
        xarray = v4;
        v19 = v2;
        do
        {
          v6 = xpc_dictionary_create(0, 0, 0);
          if (v6)
          {
            v7 = v6;
            v20 = v5;
            v8 = (void *)objc_msgSend(v2, "objectAtIndex:", v5);
            v21 = 0u;
            v22 = 0u;
            v23 = 0u;
            v24 = 0u;
            v9 = (void *)objc_msgSend(v8, "allKeys");
            v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
            if (v10)
            {
              v11 = v10;
              v12 = *(_QWORD *)v22;
              do
              {
                for (i = 0; i != v11; ++i)
                {
                  if (*(_QWORD *)v22 != v12)
                    objc_enumerationMutation(v9);
                  v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
                  if ((objc_msgSend(v14, "isEqualToString:", CFSTR("ROWID")) & 1) == 0)
                  {
                    if ((objc_msgSend(v14, "isEqualToString:", CFSTR("guid")) & 1) != 0
                      || objc_msgSend(v14, "isEqualToString:", CFSTR("recordID")))
                    {
                      xpc_dictionary_set_string(v7, (const char *)objc_msgSend(v14, "cStringUsingEncoding:", 4), (const char *)objc_msgSend((id)objc_msgSend(v8, "valueForKey:", v14), "cStringUsingEncoding:", 4));
                    }
                    if (objc_msgSend(v14, "isEqualToString:", CFSTR("timestamp")))
                      xpc_dictionary_set_int64(v7, "timestamp", objc_msgSend((id)objc_msgSend(v8, "valueForKey:", v14), "unsignedIntegerValue"));
                  }
                }
                v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
              }
              while (v11);
            }
            v4 = xarray;
            xpc_array_append_value(xarray, v7);
            xpc_release(v7);
            v2 = v19;
            v5 = v20;
          }
          ++v5;
        }
        while (objc_msgSend(v2, "count") > v5);
      }
      v1 = v17;
      v15 = *(void **)(v17 + 32);
      if (v15)
        xpc_dictionary_set_value(v15, "array_result", v4);
      xpc_release(v4);
    }
  }

  result = *(_QWORD *)(v1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDChatClearPendingDeleteChatsTable_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _BOOL4 v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1ABC3AD24;
  v5[3] = &unk_1E5AB43E8;
  v5[4] = a4;
  v4 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v5, v4);
}

uint64_t sub_1ABC3AD24(uint64_t a1)
{
  uint64_t result;

  IMDChatClearPendingDeleteChatsTable();
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDChatRemapMessagesWithErrorCodeToErrorCode_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _BOOL4 v7;
  _QWORD v8[8];

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1ABC3ADBC;
  v8[3] = &unk_1E5ABF5C0;
  v8[6] = a6;
  v8[7] = a7;
  v8[4] = a5;
  v8[5] = a4;
  v7 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v8, v7);
}

uint64_t sub_1ABC3ADBC(uint64_t a1)
{
  uint64_t result;

  IMDChatRemapMessagesWithErrorCodeToErrorCode(*(void **)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDMessageRecordCalculateLocalCloudKitStatistics_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _BOOL4 v4;
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1ABC3AE58;
  v5[3] = &unk_1E5ABF430;
  v5[4] = a3;
  v5[5] = a4;
  v4 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v5, v4);
}

uint64_t sub_1ABC3AE58(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t result;

  if (*(_QWORD *)(a1 + 32))
  {
    IMDMessageRecordCalculateLocalCloudKitStatistics();
    v2 = (void *)IMCreateXPCObjectFromDictionary();
    if (v2)
    {
      v3 = v2;
      xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), "dictionary_result", v2);
      xpc_release(v3);
    }
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDMessageRecordCalculateTotalCounts_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _BOOL4 v4;
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1ABC3AF1C;
  v5[3] = &unk_1E5ABF430;
  v5[4] = a3;
  v5[5] = a4;
  v4 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v5, v4);
}

uint64_t sub_1ABC3AF1C(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t result;

  if (*(_QWORD *)(a1 + 32))
  {
    IMDMessageRecordCalculateTotalCounts();
    v2 = (void *)IMCreateXPCObjectFromDictionary();
    if (v2)
    {
      v3 = v2;
      xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), "dictionary_result", v2);
      xpc_release(v3);
    }
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDMessageRecordMarkMessageWithROWIDAsSyncedWithCloudKit_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _BOOL4 v5;
  _QWORD v6[6];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1ABC3AFE0;
  v6[3] = &unk_1E5ABF4D0;
  v6[4] = a4;
  v6[5] = a5;
  v5 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1ABC3AFE0(uint64_t a1)
{
  uint64_t result;

  IMDMessageRecordMarkMessageWithROWIDAsSyncedWithCloudKit(*(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDMessageRecordMarkMessageWithROWIDAsIgnoreButNeedingSyncWithCloudKit_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _BOOL4 v5;
  _QWORD v6[6];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1ABC3B078;
  v6[3] = &unk_1E5ABF4D0;
  v6[4] = a4;
  v6[5] = a5;
  v5 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1ABC3B078(uint64_t a1)
{
  uint64_t result;

  IMDMessageRecordMarkMessageWithROWIDAsIgnoreButNeedingSyncWithCloudKit(*(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDMessageRecordSetCloudKitSyncCounts_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _BOOL4 v5;
  _QWORD v6[6];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1ABC3B110;
  v6[3] = &unk_1E5ABF430;
  v6[4] = a5;
  v6[5] = a4;
  v5 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1ABC3B110(uint64_t a1)
{
  uint64_t result;

  _IMDMessageRecordSetCloudKitSyncCounts(*(void **)(a1 + 32));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDAttachmentRecordMarkFailedAttachmentsAsNeedingSync_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _BOOL4 v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1ABC3B1A8;
  v5[3] = &unk_1E5AB43E8;
  v5[4] = a4;
  v4 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v5, v4);
}

uint64_t sub_1ABC3B1A8(uint64_t a1)
{
  uint64_t result;

  IMDAttachmentMarkAllFailedAttachmentsAsNeedingSync();
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDAttachmentRecordCopyAttachmentsToDeleteFromCloudKit(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _BOOL4 v6;
  _QWORD v7[8];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1ABC3B240;
  v7[3] = &unk_1E5ABF8F8;
  v7[4] = a5;
  v7[5] = a3;
  v7[6] = a4;
  v7[7] = a6;
  v6 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1ABC3B240(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  xpc_object_t v3;
  void *v4;
  unint64_t v5;
  xpc_object_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t result;
  uint64_t v17;
  xpc_object_t xarray;
  void *v19;
  unint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v1 = a1;
  v26 = *MEMORY[0x1E0C80C00];
  v2 = (void *)IMDAttachmentCopyRecordIDsToDeleteAfterRowWithLimit(*(void **)(a1 + 32), *(_QWORD *)(a1 + 56));
  if (objc_msgSend(v2, "count"))
  {
    v3 = xpc_array_create(0, 0);
    if (v3)
    {
      v4 = v3;
      v17 = v1;
      if (objc_msgSend(v2, "count"))
      {
        v5 = 0;
        xarray = v4;
        v19 = v2;
        do
        {
          v6 = xpc_dictionary_create(0, 0, 0);
          if (v6)
          {
            v7 = v6;
            v20 = v5;
            v8 = (void *)objc_msgSend(v2, "objectAtIndex:", v5);
            v21 = 0u;
            v22 = 0u;
            v23 = 0u;
            v24 = 0u;
            v9 = (void *)objc_msgSend(v8, "allKeys");
            v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
            if (v10)
            {
              v11 = v10;
              v12 = *(_QWORD *)v22;
              do
              {
                for (i = 0; i != v11; ++i)
                {
                  if (*(_QWORD *)v22 != v12)
                    objc_enumerationMutation(v9);
                  v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
                  if (objc_msgSend(v14, "isEqualToString:", CFSTR("ROWID")))
                    xpc_dictionary_set_int64(v7, "ROWID", objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", v14), "longLongValue"));
                  else
                    xpc_dictionary_set_string(v7, (const char *)objc_msgSend(v14, "cStringUsingEncoding:", 4), (const char *)objc_msgSend((id)objc_msgSend(v8, "valueForKey:", v14), "cStringUsingEncoding:", 4));
                }
                v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
              }
              while (v11);
            }
            v4 = xarray;
            xpc_array_append_value(xarray, v7);
            xpc_release(v7);
            v2 = v19;
            v5 = v20;
          }
          ++v5;
        }
        while (objc_msgSend(v2, "count") > v5);
      }
      v1 = v17;
      v15 = *(void **)(v17 + 40);
      if (v15)
        xpc_dictionary_set_value(v15, "array_result", v4);
      xpc_release(v4);
    }
  }

  result = *(_QWORD *)(v1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDAttachmentRecordCopyAttachmentGUIDs(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _BOOL4 v6;
  _QWORD v7[8];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1ABC3B4E8;
  v7[3] = &unk_1E5ABF8F8;
  v7[4] = a5;
  v7[5] = a3;
  v7[6] = a4;
  v7[7] = a6;
  v6 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1ABC3B4E8(uint64_t a1)
{
  void *v2;
  xpc_object_t v3;
  void *v4;
  unint64_t v5;
  xpc_object_t v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  uint64_t result;

  v2 = (void *)IMDAttachmentCopyGUIDsAfterRowWithLimit(*(void **)(a1 + 32), *(_QWORD *)(a1 + 56));
  if (objc_msgSend(v2, "count"))
  {
    v3 = xpc_array_create(0, 0);
    if (v3)
    {
      v4 = v3;
      if (objc_msgSend(v2, "count"))
      {
        v5 = 0;
        do
        {
          v6 = xpc_dictionary_create(0, 0, 0);
          if (v6)
          {
            v7 = v6;
            v8 = (void *)objc_msgSend(v2, "objectAtIndex:", v5);
            v9 = objc_msgSend((id)objc_msgSend(v8, "objectForKey:", CFSTR("ROWID")), "longLongValue");
            v10 = (void *)objc_msgSend(v8, "objectForKey:", CFSTR("guid"));
            LOBYTE(v8) = objc_msgSend((id)objc_msgSend(v8, "objectForKey:", CFSTR("is_orphaned")), "BOOLValue");
            xpc_dictionary_set_int64(v7, "ROWID", v9);
            xpc_dictionary_set_string(v7, "guid", (const char *)objc_msgSend(v10, "cStringUsingEncoding:", 4));
            xpc_dictionary_set_BOOL(v7, "is_orphaned", (BOOL)v8);
            xpc_array_append_value(v4, v7);
            xpc_release(v7);
          }
          ++v5;
        }
        while (objc_msgSend(v2, "count") > v5);
      }
      v11 = *(void **)(a1 + 40);
      if (v11)
        xpc_dictionary_set_value(v11, "array_result", v4);
      xpc_release(v4);
    }
  }

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDAttachmentRecordDeleteTombStonedAttachmentsWithRecordIDs_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _BOOL4 v5;
  _QWORD v6[6];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1ABC3B6E8;
  v6[3] = &unk_1E5ABF430;
  v6[4] = a5;
  v6[5] = a4;
  v5 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1ABC3B6E8(uint64_t a1)
{
  uint64_t result;

  IMDAttachmentRecordDeleteTombStonedAttachmentsWithRecordIDs(*(const __CFArray **)(a1 + 32));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDAttachmentRecordDeleteTombStonedAttachmentsToDeleteFromCloudKit_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _BOOL4 v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1ABC3B780;
  v5[3] = &unk_1E5AB43E8;
  v5[4] = a4;
  v4 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v5, v4);
}

uint64_t sub_1ABC3B780(uint64_t a1)
{
  uint64_t result;

  IMDAttachmentRecordClearDeleteTombStones();
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __XPCServerIMDMessageRecordMarkAllUnsuccessFullSyncMessagesAsNeedingSync_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _BOOL4 v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1ABC3BFB0;
  v5[3] = &unk_1E5AB43E8;
  v5[4] = a4;
  v4 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v5, v4);
}

void __XPCServerIMDKVValueForKey_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _BOOL4 v5;
  _QWORD v6[7];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1ABC3BFE8;
  v6[3] = &unk_1E5ABF480;
  v6[4] = a5;
  v6[5] = a3;
  v6[6] = a4;
  v5 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v6, v5);
}

void __XPCServerIMDKVPersistValueForKey_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _BOOL4 v6;
  _QWORD v7[7];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1ABC3C04C;
  v7[3] = &unk_1E5ABF480;
  v7[4] = a5;
  v7[5] = a6;
  v7[6] = a4;
  v6 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v7, v6);
}

void __XPCServerIMDNotificationsPostNotifications_asyncIPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _BOOL4 v5;
  _QWORD v6[6];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1ABC3C08C;
  v6[3] = &unk_1E5ABF430;
  v6[4] = a5;
  v6[5] = a4;
  v5 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v6, v5);
}

void __XPCServerIMDNotificationsRetractNotificationsForReadMessages_asyncIPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _BOOL4 v5;
  _QWORD v6[6];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1ABC3C0C8;
  v6[3] = &unk_1E5ABF430;
  v6[4] = a5;
  v6[5] = a4;
  v5 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v6, v5);
}

void __XPCServerIMDMessageRecordRetractNotificationsForChatGuids_asyncIPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _BOOL4 v5;
  _QWORD v6[6];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1ABC3C104;
  v6[3] = &unk_1E5ABF430;
  v6[4] = a5;
  v6[5] = a4;
  v5 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v6, v5);
}

void __XPCServerIMDNotificationsRetractNotificationsFromFirstUnlock_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _BOOL4 v5;
  _QWORD v6[6];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1ABC3C140;
  v6[3] = &unk_1E5ABF430;
  v6[4] = a5;
  v6[5] = a4;
  v5 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v6, v5);
}

void __XPCServerIMDNotificationsPostUrgentNotificationsForMessages_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _BOOL4 v6;
  _QWORD v7[7];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1ABC3C17C;
  v7[3] = &unk_1E5ABF480;
  v7[4] = a5;
  v7[5] = a6;
  v7[6] = a4;
  v6 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v7, v6);
}

void __XPCServerIMDNotificationsUpdatePostedNotificationsForMessages_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _BOOL4 v6;
  _QWORD v7[7];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1ABC3C1BC;
  v7[3] = &unk_1E5ABF480;
  v7[4] = a5;
  v7[5] = a6;
  v7[6] = a4;
  v6 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v7, v6);
}

void __XPCServerIMDNotificationsPostFirstUnlockMessage_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _BOOL4 v6;
  _QWORD v7[7];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1ABC3C1FC;
  v7[3] = &unk_1E5ABF480;
  v7[4] = a5;
  v7[5] = a6;
  v7[6] = a4;
  v6 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v7, v6);
}

void __XPCServerIMDMessageRecordMarkMessageGUIDUnread_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _BOOL4 v5;
  _QWORD v6[6];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1ABC3C23C;
  v6[3] = &unk_1E5ABF430;
  v6[4] = a5;
  v6[5] = a4;
  v5 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v6, v5);
}

void __XPCServerIMDMessageRecordMarkMessagesAsUnreadWithChatGUIDUpToGUIDFromMe_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  _BOOL4 v7;
  _QWORD v8[7];
  char v9;

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1ABC3C278;
  v8[3] = &unk_1E5ABF4A8;
  v8[4] = a5;
  v8[5] = a6;
  v9 = a7;
  v8[6] = a4;
  v7 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v8, v7);
}

void __XPCServerIMDChatRecordPurgeAttachments_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _BOOL4 v5;
  _QWORD v6[6];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1ABC3C2BC;
  v6[3] = &unk_1E5ABF430;
  v6[4] = a5;
  v6[5] = a4;
  v5 = sub_1ABC29340(a3);
  IMDPersistencePerformBlock(v6, v5);
}

void __IMDPersistenceIPCServer_InitializeEntitlements()
{
  if (qword_1ED0D3A58 != -1)
    dispatch_once(&qword_1ED0D3A58, &unk_1E5ABF990);
}

uint64_t __IMDPersistenceCheckLesserEntitlements(void *a1, uint64_t a2)
{
  void *v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const __CFBoolean *v10;
  const __CFBoolean *v11;
  CFTypeID v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (qword_1ED0D3A58 != -1)
    dispatch_once(&qword_1ED0D3A58, &unk_1E5ABF990);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (void *)objc_msgSend((id)qword_1ED0D3A70, "allKeys", 0);
  result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (result)
  {
    v6 = result;
    v7 = *(_QWORD *)v15;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8);
        v10 = (const __CFBoolean *)objc_msgSend(a1, "objectForKey:", v9);
        if (v10)
        {
          v11 = v10;
          v12 = CFGetTypeID(v10);
          if (v12 == CFBooleanGetTypeID())
          {
            if (CFBooleanGetValue(v11))
            {
              v13 = (void *)objc_msgSend((id)qword_1ED0D3A70, "objectForKey:", v9);
              if (v13)
              {
                if ((objc_msgSend(v13, "containsIndex:", a2) & 1) != 0)
                  return 1;
              }
            }
          }
        }
        ++v8;
      }
      while (v6 != v8);
      result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v6 = result;
      if (result)
        continue;
      break;
    }
  }
  return result;
}

uint64_t sub_1ABC3BE24()
{
  void *v0;
  void *v1;
  _QWORD v3[4];
  _QWORD v4[5];

  v4[4] = *MEMORY[0x1E0C80C00];
  qword_1ED0D3A68 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("com.apple.private.imcore.spi.database-access"), CFSTR("com.apple.private.imcore.imdpersistence.data-detection-access"), CFSTR("com.apple.private.imcore.imdpersistence.database-access"), 0);
  v0 = (void *)objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndexesInRange:", 20, 2);
  objc_msgSend(v0, "addIndexesInRange:", 182, 4);
  v1 = (void *)objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndexesInRange:", 225, 1);
  objc_msgSend(v1, "addIndexesInRange:", 235, 1);
  v3[0] = CFSTR("com.apple.imdpersistence.IMDPersistenceAgent-UnreadChatList");
  v4[0] = objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 220, 1);
  v4[1] = v0;
  v3[1] = CFSTR("com.apple.imdpersistence.IMDPersistenceAgent-StorageManagement");
  v3[2] = CFSTR("com.apple.imdpersistence.IMDPersistenceAgent-GroupMetadata");
  v3[3] = CFSTR("com.apple.imdpersistence.IMDPersistenceAgent-Syndication");
  v4[2] = objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 154, 1);
  v4[3] = v1;
  qword_1ED0D3A70 = (uint64_t)(id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 4);
  qword_1ED0D3A60 = (uint64_t)(id)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", objc_msgSend((id)qword_1ED0D3A68, "allObjects"));
  return objc_msgSend((id)qword_1ED0D3A60, "addObjectsFromArray:", objc_msgSend((id)qword_1ED0D3A70, "allKeys"));
}

uint64_t sub_1ABC3BFB0(uint64_t a1)
{
  uint64_t result;

  IMDMessageRecordMarkAllUnsuccessFullSyncMessagesAsNeedingSync();
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_1ABC3BFE8(uint64_t a1)
{
  uint64_t result;

  IMDKVValueForKey(*(void **)(a1 + 32));
  if (*(_QWORD *)(a1 + 40))
    IMInsertDatasToXPCDictionary();
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_1ABC3C04C(uint64_t *a1)
{
  uint64_t result;

  IMDKVPersistValueForKey(a1[4], a1[5]);
  result = a1[6];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_1ABC3C08C(uint64_t a1)
{
  uint64_t result;

  IMDNotificationsPostNotificationsWithContext(*(void **)(a1 + 32));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_1ABC3C0C8(uint64_t a1)
{
  uint64_t result;

  IMDNotificationsRetractNotificationsForReadMessages(*(void **)(a1 + 32));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_1ABC3C104(uint64_t a1)
{
  uint64_t result;

  IMDMessageRecordRetractNotificationsForMessagesMatchingChatGUIDs(*(const __CFArray **)(a1 + 32));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_1ABC3C140(uint64_t a1)
{
  uint64_t result;

  IMDNotificationsRetractNotificationsFromFirstUnlockWithContext(*(void **)(a1 + 32));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_1ABC3C17C(uint64_t a1)
{
  uint64_t result;

  IMDNotificationsPostUrgentNotificationsForMessages(*(void **)(a1 + 32), *(void **)(a1 + 40));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_1ABC3C1BC(uint64_t a1)
{
  uint64_t result;

  IMDNotificationsUpdatePostedNotificationsForMessages(*(void **)(a1 + 32), *(void **)(a1 + 40));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_1ABC3C1FC(uint64_t a1)
{
  uint64_t result;

  IMDNotificationsPostFirstUnlockMessage(*(void **)(a1 + 32), *(void **)(a1 + 40));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_1ABC3C23C(uint64_t a1)
{
  uint64_t result;

  IMDMessageRecordMarkMessageGUIDUnread(*(_QWORD *)(a1 + 32));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_1ABC3C278(uint64_t a1)
{
  uint64_t result;

  IMDMessageRecordMarkMessagesAsUnreadWithChatGUIDUpToGUIDFromMe(*(const __CFString **)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_1ABC3C2BC(uint64_t a1)
{
  uint64_t result;

  IMDChatRecordPurgeAttachments(*(const __CFString **)(a1 + 32));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_1ABC3C2F8()
{
  uint64_t result;

  result = IMGetCachedDomainBoolForKeyWithDefaultValue();
  byte_1EEC402E8 = result;
  return result;
}

void sub_1ABC3C328()
{
  IMDSMSRecordStoreInvalidateCaches();
  byte_1ED0D38D8 = 0;
}

uint64_t sub_1ABC3C5B0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += a2;
  return result;
}

void sub_1ABC3C5C8(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
      v6 = a1[4];
      v7 = 136446722;
      v8 = "-[IMDDatabase(Spotlight) checkSpotlightIndexCountWithCompletion:]_block_invoke_2";
      v9 = 2048;
      v10 = v5;
      v11 = 2114;
      v12 = v6;
      _os_log_impl(&dword_1ABB60000, v4, OS_LOG_TYPE_INFO, "%{public}s Got %lld total indexed items for query %{public}@", (uint8_t *)&v7, 0x20u);
    }

  }
  (*(void (**)(void))(a1[5] + 16))();

}

void sub_1ABC3C95C(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  dispatch_time_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  uint64_t v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA5E70]))
  {
    v8 = objc_msgSend(v6, "code");

    if (v8 == -1003)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          v10 = a1[6];
          *(_DWORD *)buf = 134218498;
          v24 = v10;
          v25 = 1024;
          v26 = 5;
          v27 = 2112;
          v28 = v6;
          _os_log_impl(&dword_1ABB60000, v9, OS_LOG_TYPE_INFO, "Error getting client state (attempt %lld/%d): %@", buf, 0x1Cu);
        }

      }
      v11 = dispatch_time(0, 5000000000);
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = sub_1ABC3CC48;
      v19[3] = &unk_1E5ABFA20;
      v19[4] = a1[4];
      v12 = v6;
      v14 = (void *)a1[5];
      v13 = a1[6];
      v20 = v12;
      v22 = v13;
      v21 = v14;
      dispatch_after(v11, MEMORY[0x1E0C80D38], v19);

      goto LABEL_20;
    }
  }
  else
  {

  }
  v15 = objc_msgSend(v5, "length");
  v16 = IMOSLoggingEnabled();
  if (v15)
  {
    if (v16)
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1ABB60000, v17, OS_LOG_TYPE_INFO, "Spotlight client state exists", buf, 2u);
      }

    }
  }
  else if (v16)
  {
    OSLogHandleForIMFoundationCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1ABB60000, v18, OS_LOG_TYPE_INFO, "Spotlight client state is empty!", buf, 2u);
    }

  }
  (*(void (**)(void))(a1[5] + 16))();
LABEL_20:

}

uint64_t sub_1ABC3CC48(uint64_t a1)
{
  return MEMORY[0x1E0DE7D20](*(_QWORD *)(a1 + 32), sel__validateSpotlightClientStateWithLastError_attempts_completion_);
}

void sub_1ABC3CE00()
{
  void *v0;
  int v1;
  IMSpotlightEventNotifier *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isInternalInstall");

  if (v1)
  {
    v2 = objc_alloc_init(IMSpotlightEventNotifier);
    v3 = (void *)qword_1ED0D3920;
    qword_1ED0D3920 = (uint64_t)v2;

  }
}

__CFString *IMDCreateQueryRemoveMessagesFromTombStoneTableQuery(uint64_t a1)
{
  __CFString *Mutable;
  uint64_t v3;

  if (a1 < 1)
    return 0;
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  CFStringAppend(Mutable, CFSTR("DELETE FROM sync_deleted_messages WHERE (recordID = ?"));
  v3 = a1 - 1;
  if (a1 != 1)
  {
    do
    {
      CFStringAppend(Mutable, CFSTR(" OR recordID = ?"));
      --v3;
    }
    while (v3);
  }
  CFStringAppend(Mutable, CFSTR(")"));
  return Mutable;
}

__CFString *IMDCreateQueryRemoveMessagesFromMessageTableWithMessageGuidCount(uint64_t a1)
{
  __CFString *Mutable;
  uint64_t v3;

  if (a1 < 1)
    return 0;
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 256);
  CFStringAppend(Mutable, CFSTR("DELETE FROM message WHERE (guid = ?"));
  v3 = a1 - 1;
  if (a1 != 1)
  {
    do
    {
      CFStringAppend(Mutable, CFSTR(" OR guid = ?"));
      --v3;
    }
    while (v3);
  }
  CFStringAppend(Mutable, CFSTR(")"));
  return Mutable;
}

__CFString *IMDMessageRecordGetHistoryAllItemsWithOptionalThreadIdentifierQuery(int a1, uint64_t a2, int a3)
{
  __CFString *Mutable;
  const __CFString *v7;

  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  CFStringAppend(Mutable, CFSTR("SELECT cm.message_id FROM chat_message_join cm "));
  if ((a1 & 1) != 0 || a3)
    CFStringAppend(Mutable, CFSTR("INNER JOIN message m ON m.ROWID = cm.message_id "));
  CFStringAppend(Mutable, CFSTR("WHERE cm.chat_id IN (SELECT c.ROWID FROM chat c WHERE (c.chat_identifier = ? and c.service_name = ?)) "));
  if (a1)
    CFStringAppend(Mutable, CFSTR("AND ((m.thread_originator_guid = ? AND m.thread_originator_part = ?) OR m.associated_message_guid = ?)"));
  if (a3)
    CFStringAppend(Mutable, CFSTR("AND m.is_read == 0 AND m.is_finished == 1 AND m.is_from_me == 0 "));
  if (a2)
    v7 = CFSTR("ORDER BY cm.message_date DESC, cm.message_id DESC LIMIT ?;");
  else
    v7 = CFSTR("ORDER BY cm.message_date DESC, cm.message_id DESC;");
  CFStringAppend(Mutable, v7);
  return Mutable;
}

__CFString *IMDMessageRecordGetMessagesWithChatIdentifiersOnServicesBeforeAndAfterGUIDWithOptionalThreadIdentifierQuery(int a1, uint64_t a2, uint64_t a3)
{
  __CFString *Mutable;
  const __CFString *v7;
  const __CFString *v8;

  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  CFStringAppend(Mutable, CFSTR("SELECT message_id from chat_message_join cmj "));
  if (a1)
  {
    CFStringAppend(Mutable, CFSTR("INNER JOIN message m ON m.ROWID = cmj.message_id "));
    CFStringAppend(Mutable, CFSTR("WHERE cmj.chat_id = (SELECT c.rowid FROM chat c WHERE c.chat_identifier = ? AND c.service_name = ?) "));
    v7 = CFSTR("AND ((m.thread_originator_guid = ? AND m.thread_originator_part = ?) OR m.associated_message_guid = ?) ");
  }
  else
  {
    v7 = CFSTR("WHERE cmj.chat_id = (SELECT c.rowid FROM chat c WHERE c.chat_identifier = ? AND c.service_name = ?) ");
  }
  CFStringAppend(Mutable, v7);
  if (a2 < 1 || a3)
  {
    if (a2 < 1)
    {
      if (a3 < 1)
      {
        CFRelease(Mutable);
        return 0;
      }
      v8 = CFSTR("AND cmj.message_date >= (SELECT om.date FROM message om WHERE om.guid = ?) ORDER BY cmj.message_date ASC LIMIT ? + 1");
    }
    else
    {
      v8 = CFSTR("AND cmj.message_date < (SELECT om.date FROM message om WHERE om.guid = ?) ORDER BY cmj.message_date DESC LIMIT ?");
    }
  }
  else
  {
    v8 = CFSTR("AND cmj.message_date <= (SELECT om.date FROM message om WHERE om.guid = ?) ORDER BY cmj.message_date DESC LIMIT ? + 1");
  }
  CFStringAppend(Mutable, v8);
  return Mutable;
}

id IMDMessageRecordSelectMessagesWithGUIDsChatIdentifiersOnServicesQuery1(int a1)
{
  __CFString *v1;
  id v2;

  v1 = IMDMessageRecordDeleteMessagesWithGUIDsChatIdentifiersOnServicesQuery1(a1);
  v2 = (id)-[__CFString stringByReplacingOccurrencesOfString:withString:](v1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("DELETE"), CFSTR("SELECT *"));
  CFRelease(v1);
  return v2;
}

__CFString *IMDMessageRecordDeleteMessagesWithGUIDsChatIdentifiersOnServicesQuery1(int a1)
{
  __CFString *Mutable;
  __CFString *v3;
  int v4;
  NSObject *v5;
  NSObject *v7;

  if (!a1)
  {
    v5 = IMLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1ABC635EC();
    goto LABEL_9;
  }
  if (a1 < 2)
  {
LABEL_9:
    v3 = CFSTR("DELETE FROM chat_message_join WHERE chat_id = (SELECT c.rowid FROM chat c WHERE c.chat_identifier = ? AND c.service_name = ?) AND message_id = (SELECT m.ROWID FROM message m WHERE m.guid = ?);");
    CFRetain(CFSTR("DELETE FROM chat_message_join WHERE chat_id = (SELECT c.rowid FROM chat c WHERE c.chat_identifier = ? AND c.service_name = ?) AND message_id = (SELECT m.ROWID FROM message m WHERE m.guid = ?);"));
    return v3;
  }
  Mutable = CFStringCreateMutable(0, 0);
  if (Mutable)
  {
    v3 = Mutable;
    CFStringAppend(Mutable, CFSTR("DELETE FROM chat_message_join WHERE chat_id = (SELECT c.rowid FROM chat c WHERE c.chat_identifier = ? AND c.service_name = ?) AND message_id IN (SELECT m.ROWID FROM message m WHERE m.guid IN (?"));
    v4 = a1 - 1;
    do
    {
      CFStringAppend(v3, CFSTR(", ?"));
      --v4;
    }
    while (v4);
    CFStringAppend(v3, CFSTR("));"));
  }
  else
  {
    v7 = IMLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1ABC63694();
    return 0;
  }
  return v3;
}

__CFString *IMDMessageRecordDeleteMessagesWithGUIDsChatIdentifiersOnServicesQuery2(int a1)
{
  NSObject *v2;
  __CFString *Mutable;
  __CFString *v4;
  const __CFString *v5;
  NSObject *v6;

  if (!a1)
  {
    v2 = IMLogHandleForCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      sub_1ABC637CC();
  }
  Mutable = CFStringCreateMutable(0, 0);
  v4 = Mutable;
  if (Mutable)
  {
    CFStringAppend(Mutable, CFSTR("DELETE FROM message WHERE(    SELECT 1 FROM chat_message_join     WHERE message_id = message.rowid     LIMIT 1) IS NULL AND message.guid "));
    v5 = (const __CFString *)IMDGenerateInClauseForCount(a1);
    CFStringAppend(v4, v5);
  }
  else
  {
    v6 = IMLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1ABC63730();
  }
  return v4;
}

__CFString *IMDMessageRecordDeleteMessagesWithGUIDsChatIdentifiersOnServicesQuery3(int a1)
{
  NSObject *v2;
  __CFString *Mutable;
  __CFString *v4;
  const __CFString *v5;
  NSObject *v6;

  if (!a1)
  {
    v2 = IMLogHandleForCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      sub_1ABC63910();
  }
  Mutable = CFStringCreateMutable(0, 0);
  v4 = Mutable;
  if (Mutable)
  {
    CFStringAppend(Mutable, CFSTR("UPDATE message SET cache_roomnames = (SELECT group_concat(c.room_name)                    FROM chat c INNER JOIN chat_message_join j                    ON c.ROWID = j.chat_id                    WHERE j.message_id = message.ROWID) WHERE message.guid "));
    v5 = (const __CFString *)IMDGenerateInClauseForCount(a1);
    CFStringAppend(v4, v5);
  }
  else
  {
    v6 = IMLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1ABC63874();
  }
  return v4;
}

void sub_1ABC3D994(uint64_t a1, uint64_t a2, int a3, CFTypeRef *a4)
{
  const __CFAllocator *v7;
  void *v8;
  CFStringRef v9;
  void *v10;
  CFStringRef v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  CFStringRef v15;

  v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  if (a1 < 1)
  {
    v9 = 0;
  }
  else
  {
    v8 = IMDGenerateInClauseForCount(a1);
    v9 = CFStringCreateWithFormat(v7, 0, CFSTR("AND h.service NOT %@"), v8);
  }
  if (a2 < 1)
  {
    v11 = 0;
  }
  else
  {
    v10 = IMDGenerateInClauseForCount(a2);
    v11 = CFStringCreateWithFormat(v7, 0, CFSTR("AND m.guid NOT %@"), v10);
  }
  v12 = CFSTR("m.is_from_me = 0 AND");
  if (a3)
    v12 = CFSTR("m.is_from_me = 1 OR");
  v13 = &stru_1E5AC1D70;
  if (v9)
    v14 = v9;
  else
    v14 = &stru_1E5AC1D70;
  if (v11)
    v13 = v11;
  v15 = CFStringCreateWithFormat(v7, 0, CFSTR("SELECT   MAX(m.ROWID) FROM   message m   INDEXED BY message_idx_handle WHERE (  %@  m.handle_id IN(   SELECT       h.rowid     FROM       handle h     WHERE       h.id = ?       %@) )   AND m.date >= ?   AND m.was_deduplicated = 0   AND m.cache_has_attachments = 0   %@   AND im_trim(m.text) = im_trim(?)   AND m.ROWID IN(    SELECT        cm.message_id      FROM        chat_message_join cm      WHERE        m.ROWID = cm.message_id        AND cm.chat_id = (SELECT c.rowid FROM chat c WHERE c.chat_identifier = ? AND c.service_name = ?)  ) "), v12, v14, v13);
  if (v11)
    CFRelease(v11);
  if (v9)
    CFRelease(v9);
  if (v15)
  {
    if (a4)
      *a4 = CFRetain(v15);
    CFRelease(v15);
  }
}

CFTypeRef IMDMessageRecordCopyMessageMatchingBodyStringWithChatIdentifiersServicesSkippingGUIDsQuery(uint64_t a1, uint64_t a2, int a3)
{
  CFTypeRef v4;

  v4 = 0;
  sub_1ABC3D994(a1, a2, a3, &v4);
  return v4;
}

CFStringRef IMDMessageRecordCopyMessageMatchingBodyStringWithHandleSkippingServicesSkippingGUIDsQuery(int a1, int a2)
{
  const __CFAllocator *v3;
  void *v4;
  CFStringRef v5;
  void *v6;
  CFStringRef v7;
  const __CFString *v8;
  const __CFString *v9;
  CFStringRef v10;
  NSObject *v11;

  v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  if (a1 < 1)
  {
    v5 = 0;
  }
  else
  {
    v4 = IMDGenerateInClauseForCount(a1);
    v5 = CFStringCreateWithFormat(v3, 0, CFSTR("AND h.service NOT %@"), v4);
  }
  if (a2 < 1)
  {
    v7 = 0;
  }
  else
  {
    v6 = IMDGenerateInClauseForCount(a2);
    v7 = CFStringCreateWithFormat(v3, 0, CFSTR("AND m.guid NOT %@"), v6);
  }
  v8 = &stru_1E5AC1D70;
  if (v5)
    v9 = v5;
  else
    v9 = &stru_1E5AC1D70;
  if (v7)
    v8 = v7;
  v10 = CFStringCreateWithFormat(v3, 0, CFSTR("SELECT   MAX(m.ROWID) FROM   message m   INDEXED BY message_idx_handle WHERE   m.handle_id IN(   SELECT       h.rowid     FROM       handle h     WHERE       h.id = ?       %@ )  AND m.date >= ?   AND m.is_from_me = 0   AND m.was_deduplicated = 0   AND m.cache_roomnames IS NULL   %@   AND im_trim(m.text) = im_trim(?) "), v9, v8);
  if (v10 || (v11 = IMLogHandleForCategory(), !os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)))
  {
    if (!v7)
      goto LABEL_16;
    goto LABEL_15;
  }
  sub_1ABC639B8();
  if (v7)
LABEL_15:
    CFRelease(v7);
LABEL_16:
  if (v5)
    CFRelease(v5);
  return v10;
}

__CFString *IMDMessageRecordCopyMostRecentUseageOfAddressesQuery(int a1)
{
  __CFString *Mutable;
  __CFString *v3;
  const __CFString *v4;
  NSObject *v5;

  Mutable = CFStringCreateMutable(0, 0);
  v3 = Mutable;
  if (Mutable)
  {
    CFStringAppend(Mutable, CFSTR("SELECT   MAX(cm.message_id), h.ID FROM chat_message_join cm   INNER JOIN chat_handle_join j     ON cm.chat_id = j.chat_id       INNER JOIN handle h         ON h.ROWID = j.handle_id WHERE h.ID "));
    v4 = (const __CFString *)IMDGenerateInClauseForCount(a1);
    CFStringAppend(v3, v4);
    CFStringAppend(v3, CFSTR(" GROUP BY h.ID "));
    CFStringAppend(v3, CFSTR(" ORDER BY cm.message_id DESC "));
  }
  else
  {
    v5 = IMLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1ABC63A54();
  }
  return v3;
}

__CFString *IMDMessageRecordCopyMessagesForGUIDsQuery(int a1)
{
  __CFString *Mutable;
  __CFString *v3;
  const __CFString *v4;
  NSObject *v5;

  Mutable = CFStringCreateMutable(0, 0);
  v3 = Mutable;
  if (Mutable)
  {
    CFStringAppend(Mutable, CFSTR("SELECT ROWID, guid, text, replace, service_center, handle_id, subject, country, attributedBody, version, type, service, account, account_guid, error, date, date_read, date_delivered, is_delivered, is_finished, is_emote, is_from_me, is_empty, is_delayed, is_auto_reply, is_prepared, is_read, is_system_message, is_sent, has_dd_results, is_service_message, is_forward, was_downgraded, is_archive, cache_has_attachments, cache_roomnames, was_data_detected, was_deduplicated, is_audio_message, is_played, date_played, item_type, other_handle, group_title, group_action_type, share_status,  share_direction, is_expirable, expire_state, message_action_type, message_source, associated_message_guid, associated_message_type, balloon_bundle_id, payload_data, expressive_send_style_id,  associated_message_range_location, associated_message_range_length, time_expressive_send_played, message_summary_info, ck_sync_state, ck_record_id, ck_record_change_tag, destination_caller_id, is_corrupt, reply_to_guid, sort_id, is_spam, has_unseen_mention, thread_originator_guid, thread_originator_part, syndication_ranges, synced_syndication_ranges, was_delivered_quietly, did_notify_recipient, date_retracted, date_edited, was_detonated, part_count, is_stewie, is_sos, is_critical, bia_reference_id, is_kt_verified, fallback_hash, associated_message_emoji, is_pending_satellite_send, needs_relay, schedule_type, schedule_state, sent_or_received_off_grid FROM message "));
    CFStringAppend(v3, CFSTR("WHERE guid "));
    v4 = (const __CFString *)IMDGenerateInClauseForCount(a1);
    CFStringAppend(v3, v4);
    CFStringAppend(v3, CFSTR("ORDER BY message.ROWID ASC;"));
  }
  else
  {
    v5 = IMLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1ABC63AF0();
  }
  return v3;
}

__CFString *IMDCreateDeleteDeletedMessagesGuidsQuery(int a1)
{
  int v2;
  __CFString *Mutable;
  __CFString *v4;
  NSObject *v5;
  NSObject *v6;

  if (!a1)
  {
    v5 = IMLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1ABC63B8C();
    return 0;
  }
  v2 = a1 - 1;
  if (a1 < 1)
    return 0;
  Mutable = CFStringCreateMutable(0, 0);
  if (!Mutable)
  {
    v6 = IMLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1ABC63C34();
    return 0;
  }
  v4 = Mutable;
  CFStringAppend(Mutable, CFSTR("DELETE from deleted_messages where (ROWID = ?"));
  if (a1 >= 2)
  {
    do
    {
      CFStringAppend(v4, CFSTR(" OR ROWID = ?"));
      --v2;
    }
    while (v2);
  }
  CFStringAppend(v4, CFSTR(")"));
  return v4;
}

void *_IMDCreateQueryRemoveMessagesFromChatMessageJoinWithArrayOfMessageGuids(const __CFArray *a1, _QWORD *a2)
{
  CFIndex Count;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  const void *ValueAtIndex;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  CFIndex i;
  const void *v14;
  NSObject *v15;

  Count = CFArrayGetCount(a1);
  v5 = Count << 32;
  if (!(Count << 32))
  {
    v15 = IMLogHandleForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_1ABC63CD0();
    return 0;
  }
  if (v5 < 1)
    return 0;
  v6 = (int)Count;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", (int)Count);
  if (!v7)
  {
    v8 = IMLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1ABC63E14();
  }
  ValueAtIndex = CFArrayGetValueAtIndex(a1, 0);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("DELETE FROM chat_message_join WHERE message_id = ?"));
  if (!v10)
  {
    v11 = IMLogHandleForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1ABC63D78();
  }
  objc_msgSend(v7, "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("message_guid=%@"), ValueAtIndex));
  if ((unint64_t)v5 >= 0x100000001)
  {
    if (v6 <= 2)
      v12 = 2;
    else
      v12 = v6;
    for (i = 1; i != v12; ++i)
    {
      v14 = CFArrayGetValueAtIndex(a1, i);
      objc_msgSend(v10, "appendString:", CFSTR(" OR message_id = ?"));
      objc_msgSend(v7, "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("message_guid=%@"), v14));
    }
  }
  objc_msgSend(v10, "appendString:", CFSTR(")"));
  if (a2)
    *a2 = v7;

  return v10;
}

__CFString *IMDMessageRecordCountAllUnreadMessagesQuery(int a1)
{
  __CFString *Mutable;
  __CFString *v3;
  int v4;
  NSObject *v5;
  NSObject *v7;

  if (!a1)
  {
    v5 = IMLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1ABC63EB0();
    goto LABEL_9;
  }
  if (a1 < 2)
  {
LABEL_9:
    v3 = CFSTR("SELECT   COUNT(1) FROM (SELECT   m.rowid , cm.message_id FROM   message m INNER JOIN chat_message_join cm ON  cm.message_id = m.rowid INNER JOIN chat c ON   c.ROWID = cm.chat_id WHERE   m.is_read == 0   AND NOT (m.ROWID in (SELECT message_id FROM chat_recoverable_message_join))  AND m.is_finished == 1  AND m.is_from_me == 0  AND m.item_type == 0  AND m.is_system_message == 0  AND c.is_blackholed != 1  AND c.is_filtered != ?)");
    CFRetain(CFSTR("SELECT   COUNT(1) FROM (SELECT   m.rowid , cm.message_id FROM   message m INNER JOIN chat_message_join cm ON  cm.message_id = m.rowid INNER JOIN chat c ON   c.ROWID = cm.chat_id WHERE   m.is_read == 0   AND NOT (m.ROWID in (SELECT message_id FROM chat_recoverable_message_join))  AND m.is_finished == 1  AND m.is_from_me == 0  AND m.item_type == 0  AND m.is_system_message == 0  AND c.is_blackholed != 1  AND c.is_filtered != ?)"));
    return v3;
  }
  Mutable = CFStringCreateMutable(0, 0);
  if (Mutable)
  {
    v3 = Mutable;
    CFStringAppend(Mutable, CFSTR("SELECT COUNT(1) FROM (SELECT m.rowid , cm.message_id FROM message m INNER JOIN chat_message_join cm ON cm.message_id = m.rowid INNER JOIN chat c ON c.ROWID = cm.chat_id WHERE   m.is_read == 0   AND NOT (m.ROWID in (SELECT message_id FROM chat_recoverable_message_join))  AND m.is_finished == 1  AND m.is_from_me == 0  AND m.item_type == 0  AND m.is_system_message == 0  AND c.is_blackholed != 1  AND c.is_filtered NOT IN (?"));
    v4 = a1 - 1;
    do
    {
      CFStringAppend(v3, CFSTR(", ?"));
      --v4;
    }
    while (v4);
    CFStringAppend(v3, CFSTR("));"));
  }
  else
  {
    v7 = IMLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1ABC63F58();
    return 0;
  }
  return v3;
}

uint64_t IMDMessageRecordCopySortedMessagesForChatGUIDFilteredUsingPredicateWithLimitQuery(uint64_t a1, void *a2)
{
  const __CFString *v3;
  uint64_t v4;
  const __CFString *v5;

  if (a1)
    v3 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AND %@"), a1);
  else
    v3 = &stru_1E5AC1D70;
  if (objc_msgSend(a2, "count"))
  {
    v4 = objc_msgSend(a2, "componentsJoinedByString:", CFSTR(", "));
    v5 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ORDER BY %@ "), v4);
  }
  else
  {
    v5 = &stru_1E5AC1D70;
  }
  return objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT ROWID, guid, text, replace, service_center, handle_id, subject, country, attributedBody, version, type, service, account, account_guid, error, date, date_read, date_delivered, is_delivered, is_finished, is_emote, is_from_me, is_empty, is_delayed, is_auto_reply, is_prepared, is_read, is_system_message, is_sent, has_dd_results, is_service_message, is_forward, was_downgraded, is_archive, cache_has_attachments, cache_roomnames, was_data_detected, was_deduplicated, is_audio_message, is_played, date_played, item_type, other_handle, group_title, group_action_type, share_status,  share_direction, is_expirable, expire_state, message_action_type, message_source, associated_message_guid, associated_message_type, balloon_bundle_id, payload_data, expressive_send_style_id,  associated_message_range_location, associated_message_range_length, time_expressive_send_played, message_summary_info, ck_sync_state, ck_record_id, ck_record_change_tag, destination_caller_id, is_corrupt, reply_to_guid, sort_id, is_spam, has_unseen_mention, thread_originator_guid, thread_originator_part, syndication_ranges, synced_syndication_ranges, was_delivered_quietly, did_notify_recipient, date_retracted, date_edited, was_detonated, part_count, is_stewie, is_sos, is_critical, bia_reference_id, is_kt_verified, fallback_hash, associated_message_emoji, is_pending_satellite_send, needs_relay, schedule_type, schedule_state, sent_or_received_off_grid FROM message JOIN chat_message_join ON    chat_message_join.message_id == message.rowid WHERE    chat_message_join.chat_id = (SELECT c.rowid FROM chat c WHERE c.guid = ?) %@ %@ LIMIT    ?;"),
           v3,
           v5);
}

uint64_t IMDMessageRecordCopySortedMessagesFilteredUsingPredicateWithLimitQuery(const __CFString *a1, void *a2, int a3)
{
  uint64_t v6;
  const __CFString *v7;
  const __CFString *v8;

  if (objc_msgSend(a2, "count"))
  {
    v6 = objc_msgSend(a2, "componentsJoinedByString:", CFSTR(", "));
    v7 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ORDER BY %@ "), v6);
  }
  else
  {
    v7 = &stru_1E5AC1D70;
  }
  if (a3)
    v8 = CFSTR("INNER JOIN chat_message_join cmj ON cmj.message_id = message.rowid");
  else
    v8 = &stru_1E5AC1D70;
  if (!a1)
    a1 = &stru_1E5AC1D70;
  return objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT ROWID, guid, text, replace, service_center, handle_id, subject, country, attributedBody, version, type, service, account, account_guid, error, date, date_read, date_delivered, is_delivered, is_finished, is_emote, is_from_me, is_empty, is_delayed, is_auto_reply, is_prepared, is_read, is_system_message, is_sent, has_dd_results, is_service_message, is_forward, was_downgraded, is_archive, cache_has_attachments, cache_roomnames, was_data_detected, was_deduplicated, is_audio_message, is_played, date_played, item_type, other_handle, group_title, group_action_type, share_status,  share_direction, is_expirable, expire_state, message_action_type, message_source, associated_message_guid, associated_message_type, balloon_bundle_id, payload_data, expressive_send_style_id,  associated_message_range_location, associated_message_range_length, time_expressive_send_played, message_summary_info, ck_sync_state, ck_record_id, ck_record_change_tag, destination_caller_id, is_corrupt, reply_to_guid, sort_id, is_spam, has_unseen_mention, thread_originator_guid, thread_originator_part, syndication_ranges, synced_syndication_ranges, was_delivered_quietly, did_notify_recipient, date_retracted, date_edited, was_detonated, part_count, is_stewie, is_sos, is_critical, bia_reference_id, is_kt_verified, fallback_hash, associated_message_emoji, is_pending_satellite_send, needs_relay, schedule_type, schedule_state, sent_or_received_off_grid FROM message %@ WHERE %@ %@ LIMIT    ?;"),
           v8,
           a1,
           v7);
}

uint64_t IMDMessageRecordCopyAllUnreadMessagesQueryWithFilter(uint64_t a1, uint64_t a2)
{
  const __CFString *v3;

  if (a1)
    v3 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AND (%@)"), a1);
  else
    v3 = &stru_1E5AC1D70;
  return objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ %@ ORDER BY m.date DESC LIMIT %ld"), CFSTR("SELECT m.ROWID, m.guid, m.text, m.replace, m.service_center, m.handle_id, m.subject, m.country, m.attributedBody, m.version, m.type, m.service, m.account, m.account_guid, m.error, m.date, m.date_read, m.date_delivered, m.is_delivered, m.is_finished, m.is_emote, m.is_from_me, m.is_empty, m.is_delayed, m.is_auto_reply, m.is_prepared, m.is_read, m.is_system_message, m.is_sent, m.has_dd_results, m.is_service_message, m.is_forward, m.was_downgraded, m.is_archive, m.cache_has_attachments, m.cache_roomnames, m.was_data_detected, m.was_deduplicated, m.is_audio_message, m.is_played, m.date_played, m.item_type, m.other_handle, m.group_title, m.group_action_type, m.share_status, m.share_direction, m.is_expirable, m.expire_state, m.message_action_type, m.message_source, m.associated_message_guid, m.associated_message_type, m.balloon_bundle_id, m.payload_data, m.expressive_send_style_id, m.associated_message_range_location, m.associated_message_range_length, m.time_expressive_send_played, m.message_summary_info, m.ck_sync_state, m.ck_record_id, m.ck_record_change_tag, m.destination_caller_id, m.is_corrupt, m.reply_to_guid, m.sort_id, m.is_spam, m.has_unseen_mention, m.thread_originator_guid, m.thread_originator_part, m.syndication_ranges, m.synced_syndication_ranges, m.was_delivered_quietly, m.did_notify_recipient, m.date_retracted, m.date_edited, m.was_detonated, m.part_count, m.is_stewie, m.is_sos, m.is_critical, m.bia_reference_id, m.is_kt_verified, m.fallback_hash, m.associated_message_emoji, m.is_pending_satellite_send, m.needs_relay, m.schedule_type, m.schedule_state, m.sent_or_received_off_grid FROM message m  INNER JOIN chat_message_join cm ON cm.message_id = m.rowid  INNER JOIN chat c ON c.ROWID = cm.chat_id  WHERE m.is_read == 0  AND m.is_finished == 1  AND m.is_from_me == 0  AND m.item_type == 0  AND m.is_system_message == 0 "), v3, a2);
}

void sub_1ABC3E30C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x30u);
}

uint64_t IMDAttachmentRecordCreateEphemeralRecord(uint64_t a1)
{
  uint64_t Instance;
  uint64_t v3;
  __CFArray *Mutable;
  const void *v5;
  uint64_t v6;

  IMDAttachmentRecordGetTypeID();
  Instance = _CFRuntimeCreateInstance();
  v3 = Instance;
  if (Instance)
  {
    *(_QWORD *)(Instance + 16) = 0;
    *(_QWORD *)(Instance + 24) = 0;
    Mutable = CFArrayCreateMutable(0, 22, 0);
    if (a1)
      v5 = (const void *)((uint64_t (*)(uint64_t))*MEMORY[0x1E0D18820])(a1);
    else
      v5 = 0;
    CFArraySetValueAtIndex(Mutable, 0, v5);
    *(_QWORD *)(v3 + 16) = 3735928559;
    v6 = 21;
    do
    {
      CFArrayAppendValue(Mutable, 0);
      --v6;
    }
    while (v6);
  }
  return v3;
}

uint64_t IMDAttachmentRecordCopyAttachmentRecordUnlocked(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[6];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = sub_1ABC3E4AC;
  v3[3] = &unk_1E5AB1FA8;
  v3[4] = &v4;
  v3[5] = a1;
  _IMDPerformLockedMessageStoreBlock((uint64_t)v3);
  v1 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1ABC3E494(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1ABC3E4AC(uint64_t a1)
{
  uint64_t result;

  result = CSDBRecordStoreCopyInstanceOfClassWithUID();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t IMDAttachmentRecordCopyAttachmentRecord(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[6];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = sub_1ABC3E590;
  v3[3] = &unk_1E5AB1FA8;
  v3[4] = &v4;
  v3[5] = a1;
  _IMDPerformLockedMessageStoreBlock((uint64_t)v3);
  v1 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1ABC3E578(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1ABC3E590(uint64_t a1)
{
  uint64_t result;

  result = CSDBRecordStoreCopyInstanceOfClassWithUID();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t IMDAttachmentRecordDoesAttachmentWithGUIDExist(const __CFString *a1)
{
  char v2;
  uint64_t *v3;
  uint64_t v4;
  _QWORD v6[6];
  void (*v7[5])(void);
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v2 = IMDIsRunningInDatabaseServerProcess();
  v3 = &v8;
  if ((v2 & 1) != 0)
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x2020000000;
    v11 = 0;
    if (a1)
    {
      if (CFStringGetLength(a1))
      {
        v6[0] = MEMORY[0x1E0C809B0];
        v6[1] = 3221225472;
        v6[2] = sub_1ABC3E73C;
        v6[3] = &unk_1E5AB2200;
        v6[4] = &v8;
        v6[5] = a1;
        _IMDPerformLockedStatementBlockWithQuery((uint64_t)CFSTR("SELECT count(rowid) FROM Attachment where guid = ?"), (uint64_t)v6);
      }
      v3 = v9;
    }
    v4 = *((unsigned __int8 *)v3 + 24);
  }
  else
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x2020000000;
    v11 = 0;
    v7[0] = (void (*)(void))MEMORY[0x1E0C809B0];
    v7[1] = (void (*)(void))3221225472;
    v7[2] = (void (*)(void))sub_1ABC3E700;
    v7[3] = (void (*)(void))&unk_1E5AAF630;
    v7[4] = (void (*)(void))&v8;
    __syncXPCIMDAttachmentRecordDoesAttachmentWithGUIDExist_IPCAction(v7, (uint64_t)a1);
    v4 = *((unsigned __int8 *)v9 + 24);
  }
  _Block_object_dispose(&v8, 8);
  return v4;
}

void sub_1ABC3E6E0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

BOOL sub_1ABC3E700(uint64_t a1, xpc_object_t xdict)
{
  _BOOL8 result;

  result = xpc_dictionary_get_BOOL(xdict, "BOOL_result");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t sub_1ABC3E73C(uint64_t a1)
{
  uint64_t result;

  CSDBSqliteBindTextFromCFString();
  result = CSDBSqliteStatementIntegerResult();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = (int)result > 0;
  return result;
}

CFStringRef IMDAttachmentRecordCopyAttachmentForGUID(const __CFString *a1)
{
  return IMDAttachmentRecordCopyAttachmentForGUIDIsLegacyGUID(a1, 0);
}

CFStringRef IMDAttachmentRecordCopyAttachmentForGUIDIsLegacyGUID(CFStringRef theString, int a2)
{
  NSObject *v4;
  const __CFString *v5;
  const __CFArray *v6;
  int Count;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int ID;
  const void *v16;
  void (*v18[5])(void);
  _QWORD v19[6];
  __int128 buf;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    if (IMOSLoggingEnabled())
    {
      v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = CFSTR("YES");
        _os_log_impl(&dword_1ABB60000, v4, OS_LOG_TYPE_INFO, "*** IMDAttachmentRecordCopyAttachmentForGUIDIsLegacyGUID called with isLegacyGUID %@", (uint8_t *)&buf, 0xCu);
      }
    }
  }
  if (theString)
  {
    if (CFStringGetLength(theString))
    {
      if (!IMDIsRunningInDatabaseServerProcess())
      {
        *(_QWORD *)&buf = 0;
        *((_QWORD *)&buf + 1) = &buf;
        v21 = 0x2020000000;
        v22 = 0;
        v18[0] = (void (*)(void))MEMORY[0x1E0C809B0];
        v18[1] = (void (*)(void))3221225472;
        v18[2] = (void (*)(void))sub_1ABC3EA90;
        v18[3] = (void (*)(void))&unk_1E5AAF630;
        v18[4] = (void (*)(void))&buf;
        __syncXPCIMDAttachmentRecordCopyAttachmentForGUID_IPCAction(v18, (uint64_t)theString);
        theString = *(CFStringRef *)(*((_QWORD *)&buf + 1) + 24);
LABEL_22:
        _Block_object_dispose(&buf, 8);
        return theString;
      }
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v21 = 0x2020000000;
      v22 = 0;
      if (a2)
        v5 = CFSTR("SELECT ROWID, guid, created_date, start_date, filename, uti, mime_type, transfer_state, is_outgoing, user_info, transfer_name, total_bytes, is_sticker, sticker_user_info, attribution_info, hide_attachment, ck_sync_state, ck_server_change_token_blob, ck_record_id, original_guid, is_commsafety_sensitive, emoji_image_content_identifier, emoji_image_short_description FROM attachment WHERE original_guid = ? ORDER BY ROWID DESC;");
      else
        v5 = CFSTR("SELECT ROWID, guid, created_date, start_date, filename, uti, mime_type, transfer_state, is_outgoing, user_info, transfer_name, total_bytes, is_sticker, sticker_user_info, attribution_info, hide_attachment, ck_sync_state, ck_server_change_token_blob, ck_record_id, original_guid, is_commsafety_sensitive, emoji_image_content_identifier, emoji_image_short_description FROM attachment WHERE guid = ? ORDER BY ROWID DESC;");
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = sub_1ABC3EA30;
      v19[3] = &unk_1E5AB2200;
      v19[4] = &buf;
      v19[5] = theString;
      _IMDPerformLockedStatementBlockWithQuery((uint64_t)v5, (uint64_t)v19);
      v6 = *(const __CFArray **)(*((_QWORD *)&buf + 1) + 24);
      if ((_DWORD)v6)
      {
        Count = CFArrayGetCount(v6);
        if (Count >= 2)
        {
          v8 = IMLogHandleForCategory();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
            sub_1ABC63FF4((uint64_t)theString, v8, v9, v10, v11, v12, v13, v14);
          goto LABEL_18;
        }
        if (Count == 1)
        {
LABEL_18:
          CFArrayGetValueAtIndex(*(CFArrayRef *)(*((_QWORD *)&buf + 1) + 24), 0);
          ID = CSDBRecordGetID();
          theString = (CFStringRef)IMDAttachmentRecordCreateFromRecordIDUnlocked(*MEMORY[0x1E0C9AE00], ID);
          goto LABEL_20;
        }
      }
      theString = 0;
LABEL_20:
      v16 = *(const void **)(*((_QWORD *)&buf + 1) + 24);
      if (v16)
        CFRelease(v16);
      goto LABEL_22;
    }
    return 0;
  }
  return theString;
}

void sub_1ABC3E9DC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1ABC3EA30(uint64_t a1)
{
  uint64_t result;

  CSDBSqliteBindTextFromCFString();
  result = CSDBRecordStoreProcessStatement();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t sub_1ABC3EA90(uint64_t a1, void *a2)
{
  uint64_t result;

  result = _IMDCopyIMDAttachmentRecordFromXPCObjectClient(a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t IMDAttachmentRecordRowIDForGUID(const __CFString *a1)
{
  NSObject *v2;
  id RowsForQueryWithBindingBlock;
  void *v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void (*v13[5])(void);
  _QWORD v14[5];
  uint64_t v15;
  _QWORD v16[2];
  BOOL (*v17)(uint64_t);
  void *v18;
  __int128 *p_buf;
  uint8_t v20[4];
  uint64_t v21;
  __int16 v22;
  const __CFString *v23;
  __int128 buf;
  uint64_t v25;
  void *v26;
  _OWORD v27[11];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (IMDIsRunningInDatabaseServerProcess())
  {
    if (IMOSLoggingEnabled())
    {
      v2 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = a1;
        _os_log_impl(&dword_1ABB60000, v2, OS_LOG_TYPE_INFO, "Getting message record for attachment guid %@", (uint8_t *)&buf, 0xCu);
      }
    }
    if (!a1 || !CFStringGetLength(a1))
      return 0;
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v25 = 0xD010000000;
    v26 = &unk_1ABCCF005;
    memset(v27, 0, sizeof(v27));
    IMDSqlOperationInitWithSharedCSDBDatabase((uint64_t)v27);
    IMDSqlOperationBeginTransaction((_QWORD *)(*((_QWORD *)&buf + 1) + 32));
    v15 = 0;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v17 = sub_1ABC3EEB4;
    v18 = &unk_1E5AB0C88;
    p_buf = &buf;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_1ABC3EF00;
    v14[3] = &unk_1E5ABFB08;
    v14[4] = a1;
    RowsForQueryWithBindingBlock = _IMDSqlOperationGetRowsForQueryWithBindingBlock(CFSTR("SELECT ROWID FROM attachment WHERE guid = ? LIMIT 1;"),
                                     &v15,
                                     (uint64_t)v14);
    v4 = RowsForQueryWithBindingBlock;
    if (v15)
    {
      if (!IMOSLoggingEnabled())
        goto LABEL_21;
      v5 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        goto LABEL_21;
      *(_DWORD *)v20 = 138412290;
      v21 = v15;
      v6 = "kIMDAttachmentRecordGetAttachmentRowIDForGUID returned error %@";
      v7 = v5;
      v8 = 12;
    }
    else
    {
      if (objc_msgSend(RowsForQueryWithBindingBlock, "count"))
      {
        v9 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "firstObject"), "objectForKey:", CFSTR("ROWID")), "integerValue");
        if (IMOSLoggingEnabled())
        {
          v10 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v20 = 134218242;
            v21 = v9;
            v22 = 2112;
            v23 = a1;
            _os_log_impl(&dword_1ABB60000, v10, OS_LOG_TYPE_INFO, "Got ROWID %lu for GUID %@", v20, 0x16u);
          }
        }

        v17((uint64_t)v16);
        goto LABEL_22;
      }
      if (!IMOSLoggingEnabled())
        goto LABEL_21;
      v11 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        goto LABEL_21;
      *(_WORD *)v20 = 0;
      v6 = "kIMDAttachmentRecordGetAttachmentRowIDForGUID returned zero results";
      v7 = v11;
      v8 = 2;
    }
    _os_log_impl(&dword_1ABB60000, v7, OS_LOG_TYPE_INFO, v6, v20, v8);
LABEL_21:

    v17((uint64_t)v16);
    v9 = 0;
    goto LABEL_22;
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v25 = 0x2020000000;
  v26 = 0;
  v13[0] = (void (*)(void))MEMORY[0x1E0C809B0];
  v13[1] = (void (*)(void))3221225472;
  v13[2] = (void (*)(void))sub_1ABC3EF10;
  v13[3] = (void (*)(void))&unk_1E5AAF630;
  v13[4] = (void (*)(void))&buf;
  __syncXPCIMDAttachmentRecordRIDForGUID_IPCAction(v13, (uint64_t)a1);
  v9 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 24);
LABEL_22:
  _Block_object_dispose(&buf, 8);
  return v9;
}

void sub_1ABC3EE94()
{
  JUMPOUT(0x1ABC3EEACLL);
}

void sub_1ABC3EE9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

BOOL sub_1ABC3EEB4(uint64_t a1)
{
  IMDSqlOperationFinishQuery(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32);
  IMDSqlOperationCommitOrRevertTransaction((_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32));
  return IMDSqlOperationRelease(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32, 0);
}

void sub_1ABC3EF00(uint64_t a1, uint64_t a2)
{
  IMDSqlStatementBindTextFromCFString(a2 + 32, *(_QWORD *)(a1 + 32));
}

int64_t sub_1ABC3EF10(uint64_t a1, xpc_object_t xdict)
{
  int64_t result;

  result = xpc_dictionary_get_int64(xdict, "rrid");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t IMDAttachmentRecordCopyMessageForAttachmentGUID(const __CFString *a1)
{
  NSObject *v2;
  uint64_t v3;
  id RowsForQueryWithBindingBlock;
  id v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  id v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  NSObject *v19;
  int64_t v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  void (*v25[5])(void);
  _QWORD v26[5];
  _QWORD v27[5];
  uint64_t v28;
  _QWORD v29[2];
  BOOL (*v30)(uint64_t);
  void *v31;
  __int128 *p_buf;
  uint8_t v33[4];
  uint64_t v34;
  __int128 buf;
  uint64_t v36;
  void *v37;
  _BYTE v38[184];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (IMDIsRunningInDatabaseServerProcess())
  {
    if (IMOSLoggingEnabled())
    {
      v2 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = a1;
        _os_log_impl(&dword_1ABB60000, v2, OS_LOG_TYPE_INFO, "Getting message record for attachment guid %@", (uint8_t *)&buf, 0xCu);
      }
    }
    if (!a1 || !CFStringGetLength(a1))
      return 0;
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v36 = 0xD010000000;
    v37 = &unk_1ABCCF005;
    memset(v38, 0, 176);
    IMDSqlOperationInitWithSharedCSDBDatabase((uint64_t)v38);
    IMDSqlOperationBeginTransaction((_QWORD *)(*((_QWORD *)&buf + 1) + 32));
    v3 = MEMORY[0x1E0C809B0];
    v28 = 0;
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v30 = sub_1ABC3F594;
    v31 = &unk_1E5AB0C88;
    p_buf = &buf;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = sub_1ABC3F5E0;
    v27[3] = &unk_1E5ABFB08;
    v27[4] = a1;
    RowsForQueryWithBindingBlock = _IMDSqlOperationGetRowsForQueryWithBindingBlock(CFSTR("SELECT ROWID FROM attachment WHERE guid = ? LIMIT 1;"),
                                     &v28,
                                     (uint64_t)v27);
    v5 = RowsForQueryWithBindingBlock;
    if (v28)
    {
      if (!IMOSLoggingEnabled())
        goto LABEL_37;
      v6 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        goto LABEL_37;
      *(_DWORD *)v33 = 138412290;
      v34 = v28;
      v7 = "kIMDAttachmentRecordGetAttachmentRowIDForGUID returned error %@";
      v8 = v6;
      v9 = 12;
LABEL_11:
      _os_log_impl(&dword_1ABB60000, v8, OS_LOG_TYPE_INFO, v7, v33, v9);
LABEL_37:
      v30((uint64_t)v29);
      goto LABEL_38;
    }
    if (!objc_msgSend(RowsForQueryWithBindingBlock, "count"))
    {
      if (!IMOSLoggingEnabled())
        goto LABEL_37;
      v19 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        goto LABEL_37;
      *(_WORD *)v33 = 0;
      v7 = "kIMDAttachmentRecordGetAttachmentRowIDForGUID returned zero results";
      v8 = v19;
      v9 = 2;
      goto LABEL_11;
    }
    v11 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(RowsForQueryWithBindingBlock, "firstObject"), "objectForKey:", CFSTR("ROWID")), "integerValue");
    if (IMOSLoggingEnabled())
    {
      v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v33 = 134217984;
        v34 = v11;
        _os_log_impl(&dword_1ABB60000, v12, OS_LOG_TYPE_INFO, "Looking up message ID that corresponds to attachment ID %lld", v33, 0xCu);
      }
    }
    v26[0] = v3;
    v26[1] = 3221225472;
    v26[2] = sub_1ABC3F5F0;
    v26[3] = &unk_1E5ABFB08;
    v26[4] = v11;
    v13 = _IMDSqlOperationGetRowsForQueryWithBindingBlock(CFSTR("SELECT message_id FROM message_attachment_join WHERE attachment_id = ?;"),
            &v28,
            (uint64_t)v26);
    v14 = v13;
    if (v28)
    {
      if (!IMOSLoggingEnabled())
        goto LABEL_36;
      v15 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        goto LABEL_36;
      *(_DWORD *)v33 = 138412290;
      v34 = v28;
      v16 = "kIMDAttachmentRecordGetMessageIDFromAttachmentID returned error %@";
      v17 = v15;
      v18 = 12;
    }
    else
    {
      if (objc_msgSend(v13, "count"))
      {
        v20 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v13, "firstObject"), "objectForKey:", CFSTR("message_id")), "integerValue");
        if (IMOSLoggingEnabled())
        {
          v21 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v33 = 134217984;
            v34 = v20;
            _os_log_impl(&dword_1ABB60000, v21, OS_LOG_TYPE_INFO, "Looking up message record corresponding to %lld", v33, 0xCu);
          }
        }
        v10 = IMDMessageRecordCopyMessageForRowID(v20);
        IMDSqlOperationFinishQuery(*((_QWORD *)&buf + 1) + 32);
        IMDSqlOperationCommitOrRevertTransaction((_QWORD *)(*((_QWORD *)&buf + 1) + 32));
        IMDSqlOperationRelease(*((_QWORD *)&buf + 1) + 32, 0);
        if (v10)
          goto LABEL_39;
        if (IMOSLoggingEnabled())
        {
          v22 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v33 = 134217984;
            v34 = v20;
            _os_log_impl(&dword_1ABB60000, v22, OS_LOG_TYPE_INFO, "Failed to look up message record for messsage_id %llu", v33, 0xCu);
          }
        }
        goto LABEL_38;
      }
      if (!IMOSLoggingEnabled())
        goto LABEL_36;
      v23 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        goto LABEL_36;
      *(_WORD *)v33 = 0;
      v16 = "kIMDAttachmentRecordGetMessageIDFromAttachmentID returned zero results";
      v17 = v23;
      v18 = 2;
    }
    _os_log_impl(&dword_1ABB60000, v17, OS_LOG_TYPE_INFO, v16, v33, v18);
LABEL_36:
    v30((uint64_t)v29);
LABEL_38:
    v10 = 0;
    goto LABEL_39;
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v36 = 0x2020000000;
  v37 = 0;
  v25[0] = (void (*)(void))MEMORY[0x1E0C809B0];
  v25[1] = (void (*)(void))3221225472;
  v25[2] = (void (*)(void))sub_1ABC3F600;
  v25[3] = (void (*)(void))&unk_1E5AAF630;
  v25[4] = (void (*)(void))&buf;
  __syncXPCIMDAttachmentRecordCopyMessageForAttachmentGUID_IPCAction(v25, (uint64_t)a1);
  v10 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 24);
LABEL_39:
  _Block_object_dispose(&buf, 8);
  return v10;
}

void sub_1ABC3F574()
{
  JUMPOUT(0x1ABC3F58CLL);
}

void sub_1ABC3F57C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

BOOL sub_1ABC3F594(uint64_t a1)
{
  IMDSqlOperationFinishQuery(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32);
  IMDSqlOperationCommitOrRevertTransaction((_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32));
  return IMDSqlOperationRelease(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32, 0);
}

void sub_1ABC3F5E0(uint64_t a1, uint64_t a2)
{
  IMDSqlStatementBindTextFromCFString(a2 + 32, *(_QWORD *)(a1 + 32));
}

void sub_1ABC3F5F0(uint64_t a1, uint64_t a2)
{
  IMDSqlStatementBindInt64(a2 + 32, *(_QWORD *)(a1 + 32));
}

uint64_t sub_1ABC3F600(uint64_t a1, void *a2)
{
  uint64_t result;

  result = _IMDCopyIMDMessageRecordFromXPCObjectClient(a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t IMDAttachmentRecordCopyAttachmentStickers(int64_t a1)
{
  CFMutableArrayRef Mutable;
  uint64_t v3;
  uint64_t i;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const void *v13;
  uint64_t v14;
  id obj;
  uint64_t v17;
  void (*v18[5])(void);
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[7];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  if (IMDIsRunningInDatabaseServerProcess())
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x3052000000;
    v27 = sub_1ABC3F98C;
    v28 = sub_1ABC3F99C;
    v29 = 0;
    Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
    v31[3] = (uint64_t)Mutable;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = sub_1ABC3F9A8;
    v23[3] = &unk_1E5AB2B10;
    v23[4] = &v24;
    v23[5] = CFSTR("SELECT sticker_user_info, filename, created_date, attribution_info FROM attachment a INNER JOIN message_attachment_join ma ON a.ROWID = ma.attachment_id INNER JOIN message m ON ma.message_id = m.ROWID WHERE a.sticker_user_info IS NOT NULL AND m.is_from_me=1 AND a.transfer_state=5 GROUP BY filename ORDER BY a.ROWID DESC LIMIT ?;");
    v23[6] = a1;
    IMDRunSqlOperation((uint64_t)v23);
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    obj = (id)v25[5];
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v34, 16);
    if (v3)
    {
      v17 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v20 != v17)
            objc_enumerationMutation(obj);
          v5 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v5, "valueForKey:", CFSTR("attribution_info"));
          v6 = (void *)JWDecodeDictionary();
          v7 = objc_msgSend(v6, "valueForKey:", CFSTR("accessl"));
          v8 = (void *)MEMORY[0x1E0C99D80];
          if (v7)
          {
            v9 = objc_msgSend(v5, "valueForKey:", CFSTR("filename"));
            v10 = objc_msgSend(v5, "valueForKey:", CFSTR("sticker_user_info"));
            v11 = objc_msgSend(v5, "valueForKey:", CFSTR("created_date"));
            v12 = objc_msgSend(v6, "valueForKey:", CFSTR("accessl"));
          }
          else
          {
            v9 = objc_msgSend(v5, "valueForKey:", CFSTR("filename"));
            v10 = objc_msgSend(v5, "valueForKey:", CFSTR("sticker_user_info"));
            v11 = objc_msgSend(v5, "valueForKey:", CFSTR("created_date"));
            v12 = objc_msgSend(v5, "valueForKey:", CFSTR("filename"));
          }
          v13 = (const void *)objc_msgSend(v8, "dictionaryWithObjectsAndKeys:", v9, CFSTR("filename"), v10, CFSTR("sticker_user_info"), v11, CFSTR("created_date"), v12, CFSTR("accessibility_string"), 0);
          CFArrayAppendValue((CFMutableArrayRef)v31[3], v13);
        }
        v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v34, 16);
      }
      while (v3);
    }

    _Block_object_dispose(&v24, 8);
  }
  else
  {
    v18[0] = (void (*)(void))MEMORY[0x1E0C809B0];
    v18[1] = (void (*)(void))3221225472;
    v18[2] = (void (*)(void))sub_1ABC3FA28;
    v18[3] = (void (*)(void))&unk_1E5AAF630;
    v18[4] = (void (*)(void))&v30;
    __syncXPCIMDAttachmentRecordCopyStickers_IPCAction(v18, a1);
  }
  v14 = v31[3];
  _Block_object_dispose(&v30, 8);
  return v14;
}

void sub_1ABC3F950(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  uint64_t v41;

  _Block_object_dispose(&a41, 8);
  _Block_object_dispose((const void *)(v41 - 256), 8);
  _Unwind_Resume(a1);
}

void sub_1ABC3F98C(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void sub_1ABC3F99C(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

id sub_1ABC3F9A8(_QWORD *a1, uint64_t a2)
{
  const __CFString *v4;
  uint64_t v5;
  id result;
  _QWORD v7[6];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1ABC3FA1C;
  v7[3] = &unk_1E5AB2248;
  v4 = (const __CFString *)a1[5];
  v5 = a1[6];
  v7[4] = a2;
  v7[5] = v5;
  result = _IMDSqlOperationGetRowsWithBindingBlock(a2, v4, (uint64_t)v7);
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40) = result;
  return result;
}

void sub_1ABC3FA1C(uint64_t a1)
{
  IMDSqlStatementBindInt64(*(_QWORD *)(a1 + 32) + 32, *(_QWORD *)(a1 + 40));
}

void sub_1ABC3FA28(uint64_t a1, xpc_object_t xdict)
{
  xpc_object_t value;
  void *v4;
  size_t count;
  size_t v6;
  size_t i;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const void *v11;

  value = xpc_dictionary_get_value(xdict, "array_result");
  if (value)
  {
    v4 = value;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
    count = xpc_array_get_count(v4);
    if (count)
    {
      v6 = count;
      for (i = 0; i != v6; ++i)
      {
        xpc_array_get_dictionary(v4, i);
        v8 = IMGetXPCStringFromDictionary();
        v9 = IMGetXPCDataFromDictionary();
        v10 = IMGetXPCIntFromDictionary();
        v11 = (const void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v8, CFSTR("filename"), v9, CFSTR("sticker_user_info"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v10), CFSTR("created_date"), IMGetXPCStringFromDictionary(), CFSTR("accessibility_string"), 0);
        CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), v11);
      }
    }
  }
}

const void *IMDAttachmentCopyAttachmentWithStickerPath(CFStringRef theString)
{
  const __CFArray *v2;
  int Count;
  NSObject *v4;
  NSObject *v5;
  const void *v6;
  int ID;
  const void *v8;
  void (*v10[5])(void);
  _QWORD v11[6];
  uint8_t buf[4];
  CFStringRef v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (theString && CFStringGetLength(theString) > 0)
  {
    if (!IMDIsRunningInDatabaseServerProcess())
    {
      *(_QWORD *)&v14 = 0;
      *((_QWORD *)&v14 + 1) = &v14;
      v15 = 0x2020000000;
      v16 = 0;
      v10[0] = (void (*)(void))MEMORY[0x1E0C809B0];
      v10[1] = (void (*)(void))3221225472;
      v10[2] = (void (*)(void))sub_1ABC3FEA0;
      v10[3] = (void (*)(void))&unk_1E5AAF630;
      v10[4] = (void (*)(void))&v14;
      __syncXPCIMDAttachmentRecordCopyStickerAttachmentForStickerCachePath_IPCAction(v10, (uint64_t)theString);
      v6 = *(const void **)(*((_QWORD *)&v14 + 1) + 24);
LABEL_19:
      _Block_object_dispose(&v14, 8);
      return v6;
    }
    *(_QWORD *)&v14 = 0;
    *((_QWORD *)&v14 + 1) = &v14;
    v15 = 0x2020000000;
    v16 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1ABC3FE40;
    v11[3] = &unk_1E5AB2200;
    v11[4] = &v14;
    v11[5] = theString;
    _IMDPerformLockedStatementBlockWithQuery((uint64_t)CFSTR("SELECT ROWID, guid, created_date, start_date, filename, uti, mime_type, transfer_state, is_outgoing, user_info, transfer_name, total_bytes, is_sticker, sticker_user_info, attribution_info, hide_attachment, ck_sync_state, ck_server_change_token_blob, ck_record_id, original_guid, is_commsafety_sensitive, emoji_image_content_identifier, emoji_image_short_description FROM attachment WHERE filename LIKE ?;"),
      (uint64_t)v11);
    v2 = *(const __CFArray **)(*((_QWORD *)&v14 + 1) + 24);
    if ((_DWORD)v2)
    {
      Count = CFArrayGetCount(v2);
      if (Count >= 2)
      {
        if (IMOSLoggingEnabled())
        {
          v4 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v13 = theString;
            _os_log_impl(&dword_1ABB60000, v4, OS_LOG_TYPE_INFO, "There appears to be more than one sticker with sticker path [%@]", buf, 0xCu);
          }
        }
        goto LABEL_15;
      }
      if (Count == 1)
      {
LABEL_15:
        CFArrayGetValueAtIndex(*(CFArrayRef *)(*((_QWORD *)&v14 + 1) + 24), 0);
        ID = CSDBRecordGetID();
        v6 = IMDAttachmentRecordCreateFromRecordIDUnlocked(*MEMORY[0x1E0C9AE00], ID);
        goto LABEL_17;
      }
    }
    v6 = 0;
LABEL_17:
    v8 = *(const void **)(*((_QWORD *)&v14 + 1) + 24);
    if (v8)
      CFRelease(v8);
    goto LABEL_19;
  }
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LODWORD(v14) = 138412290;
      *(_QWORD *)((char *)&v14 + 4) = theString;
      _os_log_impl(&dword_1ABB60000, v5, OS_LOG_TYPE_INFO, "Invalid parameter to IMDAttachmentCountAttachmentsWithStickerPath stickerCachePath %@", (uint8_t *)&v14, 0xCu);
    }
  }
  return 0;
}

uint64_t sub_1ABC3FE40(uint64_t a1)
{
  uint64_t result;

  CSDBSqliteBindTextFromCFString();
  result = CSDBRecordStoreProcessStatement();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t sub_1ABC3FEA0(uint64_t a1, void *a2)
{
  uint64_t result;

  result = _IMDCopyIMDAttachmentRecordFromXPCObjectClient(a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t _IMDAttachmentRecordProcessStickerPathAttachmentCount(uint64_t result)
{
  if (!result)
    return -1;
  return result;
}

uint64_t IMDAttachmentRecordDoesStickerPathHaveAttachments(CFStringRef theString)
{
  NSObject *v2;
  uint64_t v3;
  void (*v5[5])(void);
  _QWORD v6[6];
  __int128 buf;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (theString && CFStringGetLength(theString) > 0)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v8 = 0x2020000000;
    v9 = 0;
    if (IMDIsRunningInDatabaseServerProcess())
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = sub_1ABC400A8;
      v6[3] = &unk_1E5AB2200;
      v6[4] = &buf;
      v6[5] = theString;
      _IMDPerformLockedStatementBlockWithQuery((uint64_t)CFSTR("SELECT count(rowid) FROM Attachment WHERE is_sticker = 1 AND filename LIKE ?;"),
        (uint64_t)v6);
    }
    else
    {
      v5[0] = (void (*)(void))MEMORY[0x1E0C809B0];
      v5[1] = (void (*)(void))3221225472;
      v5[2] = (void (*)(void))sub_1ABC400F8;
      v5[3] = (void (*)(void))&unk_1E5AAF630;
      v5[4] = (void (*)(void))&buf;
      __syncXPCIMDAttachmentRecordDoesStickerPathHaveAttachments_IPCAction(v5, (uint64_t)theString);
    }
    v3 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 24);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v2 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = theString;
        _os_log_impl(&dword_1ABB60000, v2, OS_LOG_TYPE_INFO, "Invalid parameter to IMDAttachmentCountAttachmentsWithStickerPath stickerCachePath %@", (uint8_t *)&buf, 0xCu);
      }
    }
    return 0;
  }
  return v3;
}

void sub_1ABC40070(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1ABC400A8(uint64_t a1)
{
  uint64_t result;
  int v3;

  CSDBSqliteBindTextFromCFString();
  result = CSDBSqliteStatementIntegerResult();
  if ((_DWORD)result)
    v3 = result;
  else
    v3 = -1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3;
  return result;
}

int64_t sub_1ABC400F8(uint64_t a1, xpc_object_t xdict)
{
  int64_t result;

  result = xpc_dictionary_get_int64(xdict, "int64_result");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

CFStringRef IMDAttachmentRecordCopyAttachmentForGUIDUnlocked(CFStringRef theString)
{
  CFStringRef v1;
  const __CFArray *v2;
  int Count;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int ID;
  const void *v12;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v1 = theString;
  if (!theString)
    return v1;
  if (!CFStringGetLength(theString))
    return 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1ABC40294;
  v14[3] = &unk_1E5AB2200;
  v14[4] = &v15;
  v14[5] = v1;
  _IMDPerformLockedStatementBlockWithQuery((uint64_t)CFSTR("SELECT ROWID, guid, created_date, start_date, filename, uti, mime_type, transfer_state, is_outgoing, user_info, transfer_name, total_bytes, is_sticker, sticker_user_info, attribution_info, hide_attachment, ck_sync_state, ck_server_change_token_blob, ck_record_id, original_guid, is_commsafety_sensitive, emoji_image_content_identifier, emoji_image_short_description FROM attachment WHERE guid = ? ORDER BY ROWID DESC;"),
    (uint64_t)v14);
  v2 = (const __CFArray *)v16[3];
  if (!(_DWORD)v2)
    goto LABEL_10;
  Count = CFArrayGetCount(v2);
  if (Count >= 2)
  {
    v4 = IMLogHandleForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_1ABC63FF4((uint64_t)v1, v4, v5, v6, v7, v8, v9, v10);
    goto LABEL_9;
  }
  if (Count != 1)
  {
LABEL_10:
    v1 = 0;
    goto LABEL_11;
  }
LABEL_9:
  CFArrayGetValueAtIndex((CFArrayRef)v16[3], 0);
  ID = CSDBRecordGetID();
  v1 = (CFStringRef)IMDAttachmentRecordCreateFromRecordIDUnlocked(*MEMORY[0x1E0C9AE00], ID);
LABEL_11:
  v12 = (const void *)v16[3];
  if (v12)
    CFRelease(v12);
  _Block_object_dispose(&v15, 8);
  return v1;
}

void sub_1ABC4026C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1ABC40294(uint64_t a1)
{
  uint64_t result;

  CSDBSqliteBindTextFromCFString();
  result = CSDBRecordStoreProcessStatement();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t IMDAttachmentRecordCopyRecentFilenames(int64_t a1)
{
  uint64_t v2;
  _QWORD v4[6];
  void (*v5[5])(void);
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  if ((IMDIsRunningInDatabaseServerProcess() & 1) != 0)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = sub_1ABC404D4;
    v4[3] = &unk_1E5AB2200;
    v4[4] = &v6;
    v4[5] = a1;
    _IMDPerformLockedStatementBlockWithQuery((uint64_t)CFSTR("SELECT filename from attachment where mime_type in (\"image/jpeg\", \"image/png\", \"image/gif\")  order by ROWID DESC LIMIT ?"), (uint64_t)v4);
  }
  else
  {
    v5[0] = (void (*)(void))MEMORY[0x1E0C809B0];
    v5[1] = (void (*)(void))3221225472;
    v5[2] = (void (*)(void))sub_1ABC40404;
    v5[3] = (void (*)(void))&unk_1E5AAF630;
    v5[4] = (void (*)(void))&v6;
    __syncXPCIMDAttachmentRecordCopyRecentFilenames_IPCAction(v5, a1);
  }
  v2 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v2;
}

void sub_1ABC403E8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1ABC40404(uint64_t a1, xpc_object_t xdict)
{
  xpc_object_t value;
  void *v4;
  size_t count;
  size_t v6;
  size_t v7;
  const CFArrayCallBacks *v8;
  const char *string;
  const void *v10;

  value = xpc_dictionary_get_value(xdict, "array_result");
  if (value)
  {
    v4 = value;
    count = xpc_array_get_count(value);
    if (count)
    {
      v6 = count;
      v7 = 0;
      v8 = (const CFArrayCallBacks *)MEMORY[0x1E0C9B378];
      do
      {
        if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CFArrayCreateMutable(0, 0, v8);
        string = xpc_array_get_string(v4, v7);
        if (string)
        {
          v10 = (const void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
          if (v10)
            CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), v10);
        }
        ++v7;
      }
      while (v6 != v7);
    }
  }
}

uint64_t sub_1ABC404D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  const __CFAllocator *v7;
  const CFArrayCallBacks *v8;
  const unsigned __int8 *v9;
  CFStringRef v10;
  CFStringRef v11;
  __CFArray *v12;

  CSDBSqliteBindInt64();
  result = sqlite3_step(*(sqlite3_stmt **)(a4 + 8));
  if ((_DWORD)result == 100)
  {
    v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v8 = (const CFArrayCallBacks *)MEMORY[0x1E0C9B378];
    do
    {
      if (sqlite3_column_text(*(sqlite3_stmt **)(a4 + 8), 0))
      {
        v9 = sqlite3_column_text(*(sqlite3_stmt **)(a4 + 8), 0);
        v10 = CFStringCreateWithCString(v7, (const char *)v9, 0x8000100u);
        if (v10)
        {
          v11 = v10;
          v12 = *(__CFArray **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
          if (!v12)
          {
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CFArrayCreateMutable(0, 0, v8);
            v12 = *(__CFArray **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
          }
          CFArrayAppendValue(v12, v11);
          CFRelease(v11);
        }
      }
      result = sqlite3_step(*(sqlite3_stmt **)(a4 + 8));
    }
    while ((_DWORD)result == 100);
  }
  return result;
}

void IMDAttachmentRecordMarkAttachmentWithROWIDWithSyncState(sqlite3_int64 a1, sqlite3_int64 a2)
{
  NSObject *v4;
  NSObject *v5;
  _OWORD v6[2];
  _OWORD v7[9];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LODWORD(v6[0]) = 134217984;
      *(_QWORD *)((char *)v6 + 4) = a1;
      _os_log_impl(&dword_1ABB60000, v4, OS_LOG_TYPE_INFO, "Request to mark attachment with ROWID %lld as failed to upload to cloudKit", (uint8_t *)v6, 0xCu);
    }
  }
  if (IMDIsRunningInDatabaseServerProcess())
  {
    memset(v7, 0, sizeof(v7));
    memset(v6, 0, sizeof(v6));
    IMDSqlOperationInitWithSharedCSDBDatabase((uint64_t)v6);
    _IMDSqlOperationBeginQuery((uint64_t)v6, CFSTR("update attachment set ck_sync_state = ? where rowid=?"));
    IMDSqlStatementBindInt64((uint64_t)v7, a2);
    IMDSqlStatementBindInt64((uint64_t)v7, a1);
    IMDSqlOperationFinishQuery((uint64_t)v6);
    IMDSqlOperationRelease((uint64_t)v6, 0);
  }
  else
  {
    __syncXPCIMDAttachmentRecordMarkAttachmentWithROWIDWithSyncState_IPCAction(0, a1, a2);
  }
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LODWORD(v6[0]) = 134217984;
      *(_QWORD *)((char *)v6 + 4) = a1;
      _os_log_impl(&dword_1ABB60000, v5, OS_LOG_TYPE_INFO, "Finished marking attachment with ROWID %lld as failed to upload (2)", (uint8_t *)v6, 0xCu);
    }
  }
}

void IMDAttachmentRecordMarkAttachmentWithROWIDAsSyncedWithCloudKit(sqlite3_int64 a1)
{
  NSObject *v2;
  NSObject *v3;
  _OWORD v4[2];
  _OWORD v5[9];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      LODWORD(v4[0]) = 134217984;
      *(_QWORD *)((char *)v4 + 4) = a1;
      _os_log_impl(&dword_1ABB60000, v2, OS_LOG_TYPE_INFO, "Request to mark attachment with ROWID %lld as clean", (uint8_t *)v4, 0xCu);
    }
  }
  if (IMDIsRunningInDatabaseServerProcess())
  {
    memset(v5, 0, sizeof(v5));
    memset(v4, 0, sizeof(v4));
    IMDSqlOperationInitWithSharedCSDBDatabase((uint64_t)v4);
    _IMDSqlOperationBeginQuery((uint64_t)v4, CFSTR("update attachment set ck_sync_state = 1,transfer_state = 5 where rowid=?"));
    IMDSqlStatementBindInt64((uint64_t)v5, a1);
    IMDSqlOperationFinishQuery((uint64_t)v4);
    IMDSqlOperationRelease((uint64_t)v4, 0);
  }
  else
  {
    __syncXPCIMDAttachmentRecordMarkAttachmentWithROWIDAsSyncedWithCloudKit_IPCAction(0, a1);
  }
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LODWORD(v4[0]) = 134217984;
      *(_QWORD *)((char *)v4 + 4) = a1;
      _os_log_impl(&dword_1ABB60000, v3, OS_LOG_TYPE_INFO, "Finished marking attachment with ROWID %lld as clean", (uint8_t *)v4, 0xCu);
    }
  }
}

void IMDAttachmentRecordMarkAllAttachmentsAsNeedingCloudKitSync()
{
  NSObject *v0;
  NSObject *v1;
  _OWORD v2[11];

  if (IMDIsRunningInDatabaseServerProcess())
  {
    if (IMOSLoggingEnabled())
    {
      v0 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
      {
        LOWORD(v2[0]) = 0;
        _os_log_impl(&dword_1ABB60000, v0, OS_LOG_TYPE_INFO, "IMDAttachmentRecordMarkAllAttachmentsAsNeedingCloudKitSync", (uint8_t *)v2, 2u);
      }
    }
    memset(v2, 0, sizeof(v2));
    IMDSqlOperationInitWithSharedCSDBDatabase((uint64_t)v2);
    IMDSqlOperationExecuteQuery((uint64_t)v2, CFSTR("update attachment set ck_sync_state=0, ck_server_change_token_blob='', ck_record_id='';"),
      (uint64_t)&unk_1E5AAF3A8);
    IMDSqlOperationRelease((uint64_t)v2, 0);
  }
  else
  {
    __syncXPCIMDAttachmentRecordMarkAllAttachmentsAsNeedingCloudKitSync_IPCAction(0);
    if (IMOSLoggingEnabled())
    {
      v1 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
      {
        LOWORD(v2[0]) = 0;
        _os_log_impl(&dword_1ABB60000, v1, OS_LOG_TYPE_INFO, "Returned from DB call after marking all attachments as dirty.", (uint8_t *)v2, 2u);
      }
    }
  }
}

void sub_1ABC40A68()
{
  NSObject *v0;
  uint8_t v1[16];

  if (IMOSLoggingEnabled())
  {
    v0 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v1 = 0;
      _os_log_impl(&dword_1ABB60000, v0, OS_LOG_TYPE_INFO, "IMDAttachmentRecordMarkAllAttachmentsAsNeedingCloudKitSync updated attachments as dirty ", v1, 2u);
    }
  }
}

void IMDAttachmentResetAllAttachmentsInFailedCloudDownloadState()
{
  NSObject *v0;
  NSObject *v1;
  _OWORD v2[11];

  if (IMDIsRunningInDatabaseServerProcess())
  {
    if (IMOSLoggingEnabled())
    {
      v0 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
      {
        LOWORD(v2[0]) = 0;
        _os_log_impl(&dword_1ABB60000, v0, OS_LOG_TYPE_INFO, "IMDAttachmentResetAllAttachmentsInFailedCloudDownloadState", (uint8_t *)v2, 2u);
      }
    }
    memset(v2, 0, sizeof(v2));
    IMDSqlOperationInitWithSharedCSDBDatabase((uint64_t)v2);
    IMDSqlOperationExecuteQuery((uint64_t)v2, CFSTR("UPDATE attachment SET ck_sync_state == 1 WHERE ck_sync_state == 5;"),
      (uint64_t)&unk_1E5AAE998);
    IMDSqlOperationExecuteQuery((uint64_t)v2, CFSTR("UPDATE attachment SET ck_sync_state=0 where ck_sync_state in (2,3,5) OR (ck_sync_state==1 AND guid not like \"at_%\");"),
      (uint64_t)&unk_1E5AAECC8);
    IMDSqlOperationRelease((uint64_t)v2, 0);
  }
  else
  {
    __syncXPCIMDAttachmentResetAllAttachmentsInFailedCloudDownloadState_IPCAction(0);
    if (IMOSLoggingEnabled())
    {
      v1 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
      {
        LOWORD(v2[0]) = 0;
        _os_log_impl(&dword_1ABB60000, v1, OS_LOG_TYPE_INFO, "IMDAttachmentResetAllAttachmentsInFailedCloudDownloadState Returned from DB call after resetting all failed cloud attachment downloads.", (uint8_t *)v2, 2u);
      }
    }
  }
}

void sub_1ABC40C54()
{
  NSObject *v0;
  uint8_t v1[16];

  if (IMOSLoggingEnabled())
  {
    v0 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v1 = 0;
      _os_log_impl(&dword_1ABB60000, v0, OS_LOG_TYPE_INFO, "IMDAttachmentResetAllAttachmentsInFailedCloudDownloadState update all failed cloud attachment downloads ", v1, 2u);
    }
  }
}

void sub_1ABC40CE0()
{
  NSObject *v0;
  uint8_t v1[16];

  if (IMOSLoggingEnabled())
  {
    v0 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v1 = 0;
      _os_log_impl(&dword_1ABB60000, v0, OS_LOG_TYPE_INFO, "IMDAttachmentResetAllAttachmentsInFailedCloudDownloadState reset all failed cloud attachments ", v1, 2u);
    }
  }
}

uint64_t IMDAttachmentRecordGetNonSyncedAttachmentDiskSpace()
{
  NSObject *v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  void (*v5[5])(void);
  _QWORD v6[5];
  uint8_t buf[8];
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    v0 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1ABB60000, v0, OS_LOG_TYPE_INFO, "Request to fetch the non synced attachment disk space", buf, 2u);
    }
  }
  *(_QWORD *)buf = 0;
  v8 = buf;
  v9 = 0x2020000000;
  v10 = 0;
  if (IMDIsRunningInDatabaseServerProcess())
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = sub_1ABC40F70;
    v6[3] = &unk_1E5AB2070;
    v6[4] = buf;
    _IMDPerformLockedStatementBlockWithQuery((uint64_t)CFSTR("SELECT sum(total_bytes) FROM attachment WHERE ck_sync_state != 1 AND hide_attachment == 0 ORDER BY created_date ASC;"),
      (uint64_t)v6);
    if (IMOSLoggingEnabled())
    {
      v1 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
      {
        v2 = *((_QWORD *)v8 + 3);
        *(_DWORD *)v11 = 134217984;
        v12 = v2;
        _os_log_impl(&dword_1ABB60000, v1, OS_LOG_TYPE_INFO, "Returning non synced attachment disk space with: %lld bytes", v11, 0xCu);
      }
    }
  }
  else
  {
    v5[0] = (void (*)(void))MEMORY[0x1E0C809B0];
    v5[1] = (void (*)(void))3221225472;
    v5[2] = (void (*)(void))sub_1ABC40FA4;
    v5[3] = (void (*)(void))&unk_1E5AAF630;
    v5[4] = (void (*)(void))buf;
    __syncXPCIMDAttachmentRecordGetNonSyncedAttachmentDiskSpace_IPCAction(v5);
  }
  v3 = *((_QWORD *)v8 + 3);
  _Block_object_dispose(buf, 8);
  return v3;
}

uint64_t sub_1ABC40F70(uint64_t a1)
{
  uint64_t result;

  result = CSDBSqliteStatementInteger64Result();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

int64_t sub_1ABC40FA4(uint64_t a1, xpc_object_t xdict)
{
  int64_t result;

  result = xpc_dictionary_get_int64(xdict, "diskSpace");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t IMDAttachmentRecordGetPurgeableDiskSpace()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  unsigned __int8 *v3;
  sqlite3_int64 v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v11[5])(void);
  _BYTE v12[24];
  uint8_t v13[24];
  uint8_t buf[16];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint8_t v29[4];
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    v0 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1ABB60000, v0, OS_LOG_TYPE_INFO, "Request to fetch the purgeable disk space", buf, 2u);
    }
  }
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  if (IMDIsRunningInDatabaseServerProcess())
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    *(_OWORD *)buf = 0u;
    IMDSqlOperationInitWithSharedCSDBDatabase((uint64_t)buf);
    _IMDSqlOperationBeginQuery((uint64_t)buf, CFSTR("SELECT filename, total_bytes FROM attachment WHERE ck_sync_state == 1 AND transfer_state == 5 AND ck_server_change_token_blob != '' AND ck_server_change_token_blob NOT NULL;"));
    v1 = 0;
    v2 = 0;
    while (IMDSqlOperationHasRows((uint64_t)buf))
    {
      IMDSqlOperationColumnByIndex((uint64_t)buf, 0, (uint64_t)v13);
      v3 = (unsigned __int8 *)IMDStringFromSqlColumn((uint64_t)v13);
      IMDSqlOperationColumnByIndex((uint64_t)buf, 1, (uint64_t)v12);
      v4 = IMDInt64FromSqlColumn((uint64_t)v12);
      if (objc_msgSend(v3, "length")
        && objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("~"), CFSTR("/var/mobile"))))
      {
        v26[3] += v4;
        ++v1;
      }
      else if (IMOSLoggingEnabled())
      {
        v5 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          v6 = objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("~"), CFSTR("/var/mobile"));
          *(_DWORD *)v29 = 138412290;
          v30 = v6;
          _os_log_impl(&dword_1ABB60000, v5, OS_LOG_TYPE_INFO, "File does not exist at path %@", v29, 0xCu);
        }
      }

      ++v2;
    }
    IMDSqlOperationFinishQuery((uint64_t)buf);
    IMDSqlOperationRelease((uint64_t)buf, 0);
    if (IMOSLoggingEnabled())
    {
      v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = v26[3];
        *(_DWORD *)v29 = 134218496;
        v30 = v8;
        v31 = 2048;
        v32 = v1;
        v33 = 2048;
        v34 = v2;
        _os_log_impl(&dword_1ABB60000, v7, OS_LOG_TYPE_INFO, "returning purgeable disk space results (%lld) to delete number of attachments to delete (%lld) number of attachments total (%lld) ", v29, 0x20u);
      }
    }
  }
  else
  {
    v11[0] = (void (*)(void))MEMORY[0x1E0C809B0];
    v11[1] = (void (*)(void))3221225472;
    v11[2] = (void (*)(void))sub_1ABC41378;
    v11[3] = (void (*)(void))&unk_1E5AAF630;
    v11[4] = (void (*)(void))&v25;
    __syncXPCIMDAttachmentRecordGetPurgeableDiskSpace_IPCAction(v11);
  }
  v9 = v26[3];
  _Block_object_dispose(&v25, 8);
  return v9;
}

int64_t sub_1ABC41378(uint64_t a1, xpc_object_t xdict)
{
  int64_t result;

  result = xpc_dictionary_get_int64(xdict, "purgeableDiskSpace");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t IMDAttachmentRecordCopyAttachmentsToMetricForDiskSpace(int64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v9[5])(void);
  _QWORD v10[5];
  uint8_t buf[8];
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1ABB60000, v2, OS_LOG_TYPE_INFO, "Request to copy attachments to metric what we would purge", buf, 2u);
    }
  }
  if (IMDIsRunningInDatabaseServerProcess())
  {
    *(_QWORD *)buf = 0;
    v12 = buf;
    v13 = 0x2020000000;
    LODWORD(v14) = 0;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1ABC4163C;
    v10[3] = &unk_1E5AB2070;
    v10[4] = buf;
    _IMDPerformLockedStatementBlockWithQuery((uint64_t)CFSTR("SELECT COUNT(*) FROM attachment WHERE ck_sync_state == 1 AND transfer_state == 5 AND ck_server_change_token_blob != '' AND ck_server_change_token_blob NOT NULL;"),
      (uint64_t)v10);
    v3 = arc4random_uniform(*((_DWORD *)v12 + 6));
    if (IMOSLoggingEnabled())
    {
      v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
        v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *((unsigned int *)v12 + 6));
        *(_DWORD *)v15 = 138412546;
        v16 = v5;
        v17 = 2112;
        v18 = v6;
        _os_log_impl(&dword_1ABB60000, v4, OS_LOG_TYPE_INFO, "Offset we are choosing: %@ number of available records: %@", v15, 0x16u);
      }
    }
    v7 = IMDAttachmentRecordCopyAttachmentsToPurgeForDiskSpace(a1, v3);
  }
  else
  {
    *(_QWORD *)buf = 0;
    v12 = buf;
    v13 = 0x2020000000;
    v14 = 0;
    v9[0] = (void (*)(void))MEMORY[0x1E0C809B0];
    v9[1] = (void (*)(void))3221225472;
    v9[2] = (void (*)(void))sub_1ABC41A44;
    v9[3] = (void (*)(void))&unk_1E5AAF630;
    v9[4] = (void (*)(void))buf;
    __syncXPCIMDAttachmentRecordCopyAttachmentsToMetricForDiskSpace_IPCAction(v9, a1);
    v7 = *((_QWORD *)v12 + 3);
  }
  _Block_object_dispose(buf, 8);
  return v7;
}

void sub_1ABC415D8(_Unwind_Exception *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  if (a2 == 1)
  {
    objc_begin_catch(exc_buf);
    objc_end_catch();
    JUMPOUT(0x1ABC41528);
  }
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(exc_buf);
}

uint64_t sub_1ABC4163C(uint64_t a1)
{
  uint64_t result;

  result = CSDBSqliteStatementIntegerResult();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t IMDAttachmentRecordCopyAttachmentsToPurgeForDiskSpace(int64_t a1, int a2)
{
  NSObject *v4;
  NSObject *v5;
  int64_t v6;
  uint64_t v7;
  NSObject *v8;
  int Count;
  void (*v11[5])(void);
  _QWORD v12[2];
  void (*v13)(uint64_t);
  void *v14;
  _QWORD *v15;
  uint64_t *v16;
  uint64_t *v17;
  _BYTE *v18;
  const __CFString *v19;
  int64_t v20;
  int v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  BOOL v25;
  _QWORD v26[3];
  int v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t v32[4];
  int64_t v33;
  _BYTE buf[24];
  CFMutableArrayRef Mutable;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = a1;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = a2;
      _os_log_impl(&dword_1ABB60000, v4, OS_LOG_TYPE_INFO, "Request to copy attachments to purge from disk that have been synced to CloudKit with bytes to free up: %lld starting offset: %d", buf, 0x12u);
    }
  }
  if (IMDIsRunningInDatabaseServerProcess())
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    Mutable = 0;
    Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v31 = 0;
    v26[0] = 0;
    v26[1] = v26;
    v26[2] = 0x2020000000;
    v27 = a2;
    v22 = 0;
    v23 = &v22;
    v24 = 0x2020000000;
    v25 = a1 < 1;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v13 = sub_1ABC42178;
    v14 = &unk_1E5ABFB80;
    v21 = a2;
    v15 = v26;
    v16 = &v22;
    v19 = CFSTR("SELECT ROWID, guid, created_date, start_date, filename, uti, mime_type, transfer_state, is_outgoing, user_info, transfer_name, total_bytes, is_sticker, sticker_user_info, attribution_info, hide_attachment, ck_sync_state, ck_server_change_token_blob, ck_record_id, original_guid, is_commsafety_sensitive, emoji_image_content_identifier, emoji_image_short_description FROM attachment WHERE ck_sync_state == 1 AND transfer_state == 5 AND ck_server_change_token_blob != '' AND ck_server_change_token_blob NOT NULL ORDER BY created_date ASC LIMIT ? OFFSET ?;");
    v20 = a1;
    v17 = &v28;
    v18 = buf;
    while (!*((_BYTE *)v23 + 24))
    {
      if (IMOSLoggingEnabled())
      {
        v5 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          v6 = a1 - v29[3];
          *(_DWORD *)v32 = 134217984;
          v33 = v6;
          _os_log_impl(&dword_1ABB60000, v5, OS_LOG_TYPE_INFO, "Going to try and free up disk space with remaining bytes to free up: %lld", v32, 0xCu);
        }
      }
      v13((uint64_t)v12);
    }
    if (IMOSLoggingEnabled())
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        Count = CFArrayGetCount(*(CFArrayRef *)(*(_QWORD *)&buf[8] + 24));
        *(_DWORD *)v32 = 67109120;
        LODWORD(v33) = Count;
        _os_log_impl(&dword_1ABB60000, v8, OS_LOG_TYPE_INFO, "returning results (%d) to delete ", v32, 8u);
      }
    }
    v7 = *(_QWORD *)(*(_QWORD *)&buf[8] + 24);
    _Block_object_dispose(&v22, 8);
    _Block_object_dispose(v26, 8);
    _Block_object_dispose(&v28, 8);
  }
  else
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    Mutable = 0;
    v11[0] = (void (*)(void))MEMORY[0x1E0C809B0];
    v11[1] = (void (*)(void))3221225472;
    v11[2] = (void (*)(void))sub_1ABC4245C;
    v11[3] = (void (*)(void))&unk_1E5AAF630;
    v11[4] = (void (*)(void))buf;
    __syncXPCIMDAttachmentRecordCopyAttachmentsToPurgeForDiskSpace_IPCAction(v11, a1, a2);
    v7 = *(_QWORD *)(*(_QWORD *)&buf[8] + 24);
  }
  _Block_object_dispose(buf, 8);
  return v7;
}

void sub_1ABC419B8(_Unwind_Exception *exc_buf, int a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  if (a2 == 1)
  {
    objc_begin_catch(exc_buf);
    objc_end_catch();
    JUMPOUT(0x1ABC41940);
  }
  _Block_object_dispose(&v4, 8);
  _Block_object_dispose(&v5, 8);
  _Block_object_dispose((const void *)(v2 - 176), 8);
  _Block_object_dispose((const void *)(v2 - 128), 8);
  _Unwind_Resume(exc_buf);
}

void sub_1ABC419D8()
{
  JUMPOUT(0x1ABC41A0CLL);
}

void sub_1ABC41A44(uint64_t a1, xpc_object_t xdict)
{
  xpc_object_t value;
  void *v4;
  size_t count;
  size_t v6;
  size_t v7;
  const CFArrayCallBacks *v8;
  xpc_object_t v9;
  const void *v10;

  value = xpc_dictionary_get_value(xdict, "array_result");
  if (value)
  {
    v4 = value;
    count = xpc_array_get_count(value);
    if (count)
    {
      v6 = count;
      v7 = 0;
      v8 = (const CFArrayCallBacks *)MEMORY[0x1E0C9B378];
      do
      {
        if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CFArrayCreateMutable(0, 0, v8);
        v9 = xpc_array_get_value(v4, v7);
        v10 = (const void *)_IMDCopyIMDAttachmentRecordFromXPCObjectClient(v9);
        CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), v10);
        if (v10)
          CFRelease(v10);
        ++v7;
      }
      while (v6 != v7);
    }
  }
}

__CFDictionary *IMDAttachmentRecordCopyMostRecentAttachmentsInMostRecentChatsTest(int64_t a1, int64_t a2)
{
  __CFDictionary *Mutable;
  unint64_t v5;
  uint64_t v6;
  const CFArrayCallBacks *v7;
  const void *v8;
  const __CFArray *v9;
  int Count;
  __CFArray *v11;
  CFIndex v12;
  uint64_t v13;
  int ID;
  const void *v15;
  const void *v16;
  uint64_t *v17;
  __CFArray *v18;
  void (*v20[6])(void);
  _QWORD v21[7];
  _QWORD v22[7];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  CFMutableDictionaryRef v32;

  if (IMDIsRunningInDatabaseServerProcess())
  {
    v29 = 0;
    v30 = &v29;
    v31 = 0x2020000000;
    v32 = 0;
    v23 = 0;
    v24 = &v23;
    v25 = 0x3052000000;
    v26 = sub_1ABC3F98C;
    v27 = sub_1ABC3F99C;
    v28 = 0;
    v28 = objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = sub_1ABC41ED4;
    v22[3] = &unk_1E5AB2B10;
    v22[4] = &v23;
    v22[5] = CFSTR("SELECT DISTINCT chat_id FROM (SELECT chat_id,message_date FROM chat_message_join ORDER BY message_date desc) ORDER BY message_date DESC LIMIT ?;");
    v22[6] = a1;
    IMDRunSqlOperation((uint64_t)v22);
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v5 = 0;
    v6 = *MEMORY[0x1E0C9AE00];
    v7 = (const CFArrayCallBacks *)MEMORY[0x1E0C9B378];
    while (v5 < objc_msgSend((id)v24[5], "count"))
    {
      v8 = (const void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), objc_msgSend((id)objc_msgSend((id)v24[5], "objectAtIndexedSubscript:", v5), "valueForKey:", CFSTR("chat_id")));
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = sub_1ABC41F54;
      v21[3] = &unk_1E5ABE1E8;
      v21[4] = v8;
      v21[5] = &v29;
      v21[6] = a2;
      _IMDPerformLockedStatementBlockWithQuery((uint64_t)CFSTR("SELECT a.ROWID, a.guid, a.is_sticker, a.transfer_name, a.filename FROM attachment a JOIN (SELECT ma.attachment_id as a_id, message_date as m_date FROM message_attachment_join ma JOIN (SELECT cm.message_id as message_id, cm.message_date as message_date FROM message m JOIN chat_message_join cm WHERE m.cache_has_attachments = 1 AND cm.chat_id AND cm.chat_id = ? AND m.rowid = cm.message_id) as tmp WHERE ma.message_id = tmp.message_id) as tmp2 WHERE a.rowid = tmp2.a_id ORDER BY tmp2.m_date DESC LIMIT ?"), (uint64_t)v21);
      v9 = (const __CFArray *)v30[3];
      if ((_DWORD)v9)
        Count = CFArrayGetCount(v9);
      else
        Count = 0;
      v11 = CFArrayCreateMutable(0, 0, v7);
      if (Count >= 1)
      {
        v12 = 0;
        if (Count <= 1uLL)
          v13 = 1;
        else
          v13 = Count;
        do
        {
          CFArrayGetValueAtIndex((CFArrayRef)v30[3], v12);
          ID = CSDBRecordGetID();
          v15 = IMDAttachmentRecordCreateFromRecordIDUnlocked(v6, ID);
          CFArrayAppendValue(v11, v15);
          if (v15)
            CFRelease(v15);
          ++v12;
        }
        while (v13 != v12);
      }
      CFDictionarySetValue(Mutable, v8, v11);
      if (v11)
        CFRelease(v11);
      v16 = (const void *)v30[3];
      if (v16)
      {
        CFRelease(v16);
        v30[3] = 0;
      }
      ++v5;
    }
    v18 = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
    CFArrayAppendValue(v18, Mutable);
    _Block_object_dispose(&v23, 8);
    v17 = &v29;
  }
  else
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x2020000000;
    v26 = 0;
    v29 = 0;
    v30 = &v29;
    v31 = 0x2020000000;
    v32 = 0;
    v32 = CFDictionaryCreateMutable(0, 0, 0, 0);
    v20[0] = (void (*)(void))MEMORY[0x1E0C809B0];
    v20[1] = (void (*)(void))3221225472;
    v20[2] = (void (*)(void))sub_1ABC41FC0;
    v20[3] = (void (*)(void))&unk_1E5AB21D8;
    v20[4] = (void (*)(void))&v23;
    v20[5] = (void (*)(void))&v29;
    __syncXPCIMDAttachmentRecordCopyMostRecentAttachmentsInMostRecentChats_IPCAction(v20, a1, a2);
    Mutable = (__CFDictionary *)v30[3];
    _Block_object_dispose(&v29, 8);
    v17 = &v23;
  }
  _Block_object_dispose(v17, 8);
  return Mutable;
}

void sub_1ABC41E68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  uint64_t v30;

  _Block_object_dispose((const void *)(v30 - 136), 8);
  _Block_object_dispose(&a30, 8);
  _Unwind_Resume(a1);
}

id sub_1ABC41ED4(_QWORD *a1, uint64_t a2)
{
  const __CFString *v4;
  uint64_t v5;
  id result;
  _QWORD v7[6];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1ABC41F48;
  v7[3] = &unk_1E5AB2248;
  v4 = (const __CFString *)a1[5];
  v5 = a1[6];
  v7[4] = a2;
  v7[5] = v5;
  result = _IMDSqlOperationGetRowsWithBindingBlock(a2, v4, (uint64_t)v7);
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40) = result;
  return result;
}

void sub_1ABC41F48(uint64_t a1)
{
  IMDSqlStatementBindInt64(*(_QWORD *)(a1 + 32) + 32, *(_QWORD *)(a1 + 40));
}

uint64_t sub_1ABC41F54(uint64_t a1)
{
  uint64_t result;

  CSDBSqliteBindTextFromCFString();
  CSDBSqliteBindInt64();
  result = CSDBRecordStoreProcessStatement();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

xpc_object_t sub_1ABC41FC0(uint64_t a1, xpc_object_t xdict)
{
  xpc_object_t result;
  _QWORD v4[4];
  __int128 v5;

  result = xpc_dictionary_get_value(xdict, "dictionary_result");
  if (result)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = sub_1ABC42038;
    v4[3] = &unk_1E5ABFB30;
    v5 = *(_OWORD *)(a1 + 32);
    return (xpc_object_t)xpc_dictionary_apply(result, v4);
  }
  return result;
}

uint64_t sub_1ABC42038(uint64_t a1, uint64_t a2, xpc_object_t xarray)
{
  size_t v6;
  const CFArrayCallBacks *v7;
  xpc_object_t value;
  const void *v9;
  id v10;
  const void *v11;
  const void *v12;

  if (xpc_array_get_count(xarray))
  {
    v6 = 0;
    v7 = (const CFArrayCallBacks *)MEMORY[0x1E0C9B378];
    do
    {
      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CFArrayCreateMutable(0, 0, v7);
      value = xpc_array_get_value(xarray, v6);
      v9 = (const void *)_IMDCopyIMDAttachmentRecordFromXPCObjectClient(value);
      v10 = IMDAttachmentRecordCopyFilename(0, (uint64_t)v9, 0);
      if (v10)
      {
        v11 = v10;
        CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), v10);
        CFRelease(v11);
      }
      if (v9)
        CFRelease(v9);
      ++v6;
    }
    while (xpc_array_get_count(xarray) > v6);
  }
  CFDictionaryAddValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", a2), *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  v12 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v12)
  {
    CFRelease(v12);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }
  return 1;
}

void sub_1ABC42178(uint64_t a1)
{
  uint64_t v2;
  const __CFArray *v3;
  int Count;
  int v5;
  CFIndex v6;
  uint64_t v7;
  int ID;
  const void *v9;
  id v10;
  const void *v11;
  int v12;
  uint64_t v13;
  int v14;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v2 = *(_QWORD *)(a1 + 64);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1ABC423E8;
  v16[3] = &unk_1E5ABFB58;
  v16[4] = *(_QWORD *)(a1 + 32);
  v16[5] = &v17;
  _IMDPerformLockedStatementBlockWithQuery(v2, (uint64_t)v16);
  v3 = (const __CFArray *)v18[3];
  if (!(_DWORD)v3)
  {
    v5 = 0;
    goto LABEL_7;
  }
  Count = CFArrayGetCount(v3);
  v5 = Count;
  if (!Count)
  {
LABEL_7:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
LABEL_8:
    if (v5 < 1)
      goto LABEL_19;
    goto LABEL_9;
  }
  if (Count <= 49)
  {
    if (*(_DWORD *)(a1 + 80))
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_9:
  v6 = 0;
  v7 = *MEMORY[0x1E0C9AE00];
  while (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) < *(_QWORD *)(a1 + 72))
  {
    CFArrayGetValueAtIndex((CFArrayRef)v18[3], v6);
    ID = CSDBRecordGetID();
    v9 = IMDAttachmentRecordCreateFromRecordIDUnlocked(v7, ID);
    v10 = IMDAttachmentRecordCopyFilename(0, (uint64_t)v9, 0);
    if (objc_msgSend(v10, "length")
      && objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", v10))
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += IMDAttachmentRecordGetTotalBytes((uint64_t)v9);
      CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), v9);
    }

    if (v9)
      CFRelease(v9);
    if (v5 == ++v6)
      goto LABEL_19;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
LABEL_19:
  v11 = (const void *)v18[3];
  if (v11)
    CFRelease(v11);
  v12 = *(_DWORD *)(a1 + 80);
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v14 = *(_DWORD *)(v13 + 24);
  if (v12 < 1)
    goto LABEL_30;
  if (v14 >= v12 || v14 + 50 < v12)
  {
    if (v5 <= 49 && v14 >= v12)
    {
      *(_DWORD *)(v13 + 24) = 0;
      goto LABEL_31;
    }
LABEL_30:
    *(_DWORD *)(v13 + 24) = v14 + v5;
    goto LABEL_31;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
LABEL_31:
  _Block_object_dispose(&v17, 8);
}

void sub_1ABC423B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1ABC423E8(uint64_t a1)
{
  uint64_t result;

  CSDBSqliteBindInt64();
  CSDBSqliteBindInt();
  result = CSDBRecordStoreProcessStatement();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void sub_1ABC4245C(uint64_t a1, xpc_object_t xdict)
{
  xpc_object_t value;
  void *v4;
  size_t count;
  size_t v6;
  size_t v7;
  const CFArrayCallBacks *v8;
  xpc_object_t v9;
  const void *v10;

  value = xpc_dictionary_get_value(xdict, "array_result");
  if (value)
  {
    v4 = value;
    count = xpc_array_get_count(value);
    if (count)
    {
      v6 = count;
      v7 = 0;
      v8 = (const CFArrayCallBacks *)MEMORY[0x1E0C9B378];
      do
      {
        if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CFArrayCreateMutable(0, 0, v8);
        v9 = xpc_array_get_value(v4, v7);
        v10 = (const void *)_IMDCopyIMDAttachmentRecordFromXPCObjectClient(v9);
        CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), v10);
        if (v10)
          CFRelease(v10);
        ++v7;
      }
      while (v6 != v7);
    }
  }
}

const __CFString *sub_1ABC42528(uint64_t a1, int a2)
{
  const __CFString *v4;
  const __CFString *v5;
  NSObject *v7;
  const __CFString *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a1 == 2)
  {
    v4 = CFSTR("SELECT * FROM attachment a WHERE a.ck_sync_state == 1 AND a.transfer_state == 0 ORDER BY a.ROWID LIMIT ? ");
    v5 = CFSTR("SELECT * FROM attachment a WHERE a.ck_sync_state == 1 AND a.transfer_state == 0 AND a.ROWID > ? ORDER BY a.ROWID LIMIT ? ");
LABEL_5:
    if (a2)
      return v5;
    else
      return v4;
  }
  if (a1 == 1)
  {
    v4 = CFSTR("SELECT * FROM attachment a WHERE a.ck_sync_state == 0 ORDER BY a.ROWID LIMIT ? ");
    v5 = CFSTR("SELECT * FROM attachment a WHERE a.ck_sync_state == 0 and a.ROWID > ? ORDER BY a.ROWID LIMIT ? ");
    goto LABEL_5;
  }
  if (IMOSLoggingEnabled())
  {
    v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = CFSTR("NO");
      if (a2)
        v8 = CFSTR("YES");
      v9 = 134218242;
      v10 = a1;
      v11 = 2112;
      v12 = v8;
      _os_log_impl(&dword_1ABB60000, v7, OS_LOG_TYPE_INFO, "IMDAttachmentQueryStringForIMAttachmentsQuery unknown IMAttachmentsQuery type %lld, fromRow %@", (uint8_t *)&v9, 0x16u);
    }
  }
  return 0;
}

__CFArray *IMDAttachmentRecordCopyAttachmentsForQueryWithLimit(uint64_t a1, void *a2, int64_t a3)
{
  const __CFString *v6;
  const __CFArray *v7;
  CFIndex Count;
  CFIndex v9;
  __CFArray *Mutable;
  uint64_t v11;
  uint64_t v12;
  const CFArrayCallBacks *v13;
  int ID;
  const void *v15;
  const void *v16;
  void (*v18[5])(void);
  _QWORD v19[7];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  if (IMDIsRunningInDatabaseServerProcess())
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 0;
    v6 = sub_1ABC42528(a1, a2 != 0);
    if (v6)
    {
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = sub_1ABC4286C;
      v19[3] = &unk_1E5ABE1E8;
      v19[4] = a2;
      v19[5] = &v20;
      v19[6] = a3;
      _IMDPerformLockedStatementBlockWithQuery((uint64_t)v6, (uint64_t)v19);
      v7 = (const __CFArray *)v21[3];
      if ((_DWORD)v7 && (Count = CFArrayGetCount(v7), Count << 32 >= 1))
      {
        v9 = 0;
        Mutable = 0;
        v11 = (int)Count;
        v12 = *MEMORY[0x1E0C9AE00];
        v13 = (const CFArrayCallBacks *)MEMORY[0x1E0C9B378];
        do
        {
          CFArrayGetValueAtIndex((CFArrayRef)v21[3], v9);
          ID = CSDBRecordGetID();
          v15 = IMDAttachmentRecordCreateFromRecordIDUnlocked(v12, ID);
          if (!Mutable)
            Mutable = CFArrayCreateMutable(0, 0, v13);
          CFArrayAppendValue(Mutable, v15);
          if (v15)
            CFRelease(v15);
          ++v9;
        }
        while (v11 != v9);
      }
      else
      {
        Mutable = 0;
      }
      v16 = (const void *)v21[3];
      if (v16)
        CFRelease(v16);
    }
    else
    {
      Mutable = 0;
    }
  }
  else
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 0;
    v18[0] = (void (*)(void))MEMORY[0x1E0C809B0];
    v18[1] = (void (*)(void))3221225472;
    v18[2] = (void (*)(void))sub_1ABC428E4;
    v18[3] = (void (*)(void))&unk_1E5AAF630;
    v18[4] = (void (*)(void))&v20;
    __syncXPCIMDAttachmentRecordCopyAttachmentsForQueryWithLimit_IPCAction(v18, a1, a2, a3);
    Mutable = (__CFArray *)v21[3];
  }
  _Block_object_dispose(&v20, 8);
  return Mutable;
}

void sub_1ABC42840(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1ABC4286C(uint64_t a1)
{
  void *v2;
  uint64_t result;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "longLongValue");
    CSDBSqliteBindInt64();
  }
  CSDBSqliteBindInt64();
  result = CSDBRecordStoreProcessStatement();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void sub_1ABC428E4(uint64_t a1, xpc_object_t xdict)
{
  xpc_object_t value;
  void *v4;
  size_t count;
  size_t v6;
  size_t v7;
  const CFArrayCallBacks *v8;
  xpc_object_t v9;
  const void *v10;

  value = xpc_dictionary_get_value(xdict, "array_result");
  if (value)
  {
    v4 = value;
    count = xpc_array_get_count(value);
    if (count)
    {
      v6 = count;
      v7 = 0;
      v8 = (const CFArrayCallBacks *)MEMORY[0x1E0C9B378];
      do
      {
        if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CFArrayCreateMutable(0, 0, v8);
        v9 = xpc_array_get_value(v4, v7);
        v10 = (const void *)_IMDCopyIMDAttachmentRecordFromXPCObjectClient(v9);
        CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), v10);
        if (v10)
          CFRelease(v10);
        ++v7;
      }
      while (v6 != v7);
    }
  }
}

uint64_t _IMDAttachmentRecordGetGuidsAndTransferNamesFromQueryRows(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  void *v8;
  __CFString *StickerPathFromTransferName;
  int v10;
  int v12;
  void *v15;
  id v17;
  id v18;
  id v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[3];
  _QWORD v26[3];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v18 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v19 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v17 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = a1;
  v2 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v22 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v7 = objc_msgSend(v6, "valueForKey:", CFSTR("guid"));
        v8 = (void *)objc_msgSend(v6, "valueForKey:", CFSTR("transfer_name"));
        StickerPathFromTransferName = (__CFString *)objc_msgSend(v6, "valueForKey:", CFSTR("filename"));
        v10 = objc_msgSend((id)objc_msgSend(v6, "valueForKey:", CFSTR("is_sticker")), "intValue");
        if (v10 != 1 || v8 == 0)
        {
          v12 = v10;
          if (v10 != 1 && v7 != 0)
            objc_msgSend(v18, "addObject:", v7);
          if (v12 != 1 && StickerPathFromTransferName != 0)
          {
            v15 = v17;
LABEL_23:
            objc_msgSend(v15, "addObject:", StickerPathFromTransferName);
            continue;
          }
        }
        else
        {
          StickerPathFromTransferName = (__CFString *)_IMDAttachmentRecordGetStickerPathFromTransferName(v8);
          if (-[__CFString length](StickerPathFromTransferName, "length"))
          {
            v15 = v19;
            goto LABEL_23;
          }
        }
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v3);
  }
  v25[0] = CFSTR("guids");
  v25[1] = CFSTR("transfernames");
  v26[0] = v18;
  v26[1] = v19;
  v25[2] = CFSTR("filenames");
  v26[2] = v17;
  return objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
}

const __CFString *_IMDAttachmentRecordGetStickerPathFromTransferName(void *a1)
{
  void *v2;
  void *v3;

  if (!objc_msgSend(a1, "containsString:", CFSTR("sticker")))
    return &stru_1E5AC1D70;
  if (!objc_msgSend(a1, "containsString:", CFSTR("-")))
    return &stru_1E5AC1D70;
  v2 = (void *)objc_msgSend(a1, "componentsSeparatedByString:", CFSTR("-"));
  if (!objc_msgSend(v2, "count"))
    return &stru_1E5AC1D70;
  v3 = (void *)objc_msgSend(v2, "objectAtIndex:", 0);
  if (objc_msgSend(v3, "length"))
    return (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@-sticker"), v3, v3);
  return (const __CFString *)v3;
}

void IMDAttachmentRecordDeleteAttachmentPreviewsOlderThan(int64_t a1)
{
  id v2;
  void *GuidsAndTransferNamesFromQueryRows;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  if ((IMDIsRunningInDatabaseServerProcess() & 1) != 0)
  {
    v2 = IMDAttachmentRecordCopyMostRecentAttachmentsInMostRecentChats(50, 15);
    GuidsAndTransferNamesFromQueryRows = (void *)_IMDAttachmentRecordGetGuidsAndTransferNamesFromQueryRows(v2);

    v4 = (void *)objc_msgSend(GuidsAndTransferNamesFromQueryRows, "objectForKey:", CFSTR("guids"));
    v5 = objc_msgSend((id)IMCachesDirectoryURL(), "path");
    v6 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v5, CFSTR("Previews"), CFSTR("Attachments"), 0);
    v7 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v6);
    v10 = objc_alloc_init(MEMORY[0x1E0CB3620]);
    _IMDAttachmentRecordDeleteAttachmentsExceptPreviewsToKeep(v4, v7, v10, (void *)objc_msgSend(v10, "enumeratorAtPath:", v7));
    v8 = (void *)objc_msgSend(GuidsAndTransferNamesFromQueryRows, "objectForKey:", CFSTR("transfernames"));
    v9 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v5, CFSTR("com.apple.MobileSMS"), CFSTR("Previews"), CFSTR("StickerCache"), 0);
    _IMDAttachmentRecordDeleteStickersExceptPreviewsToKeep(v8, (void *)objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v9));

  }
  else
  {
    __syncXPCIMDAttachmentRecordDeleteAttachmentPreviewsOlderThan_IPCAction(0, a1);
  }
}

id IMDAttachmentRecordCopyMostRecentAttachmentsInMostRecentChats(uint64_t a1, uint64_t a2)
{
  unint64_t i;
  uint64_t v5;
  const void *v6;
  id v8;
  _QWORD v9[8];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  uint64_t v15;
  _QWORD v16[7];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  uint64_t v22;

  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = 0;
  v18 = &v17;
  v19 = 0x3052000000;
  v20 = sub_1ABC3F98C;
  v21 = sub_1ABC3F99C;
  v22 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1ABC46710;
  v16[3] = &unk_1E5AB2B10;
  v16[4] = &v17;
  v16[5] = CFSTR("SELECT DISTINCT chat_id FROM (SELECT chat_id,message_date FROM chat_message_join ORDER BY message_date desc) ORDER BY message_date DESC LIMIT ?;");
  v16[6] = a1;
  IMDRunSqlOperation((uint64_t)v16);
  for (i = 0; objc_msgSend((id)v18[5], "count") > i; ++i)
  {
    v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), objc_msgSend((id)objc_msgSend((id)v18[5], "objectAtIndexedSubscript:", i), "valueForKey:", CFSTR("chat_id")));
    v10 = 0;
    v11 = &v10;
    v12 = 0x3052000000;
    v13 = sub_1ABC3F98C;
    v14 = sub_1ABC3F99C;
    v15 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1ABC46790;
    v9[3] = &unk_1E5ABFC20;
    v9[4] = v5;
    v9[5] = &v10;
    v9[6] = CFSTR("SELECT a.ROWID, a.guid, a.is_sticker, a.transfer_name, a.filename FROM attachment a JOIN (SELECT ma.attachment_id as a_id, message_date as m_date FROM message_attachment_join ma JOIN (SELECT cm.message_id as message_id, cm.message_date as message_date FROM message m JOIN chat_message_join cm WHERE m.cache_has_attachments = 1 AND cm.chat_id AND cm.chat_id = ? AND m.rowid = cm.message_id) as tmp WHERE ma.message_id = tmp.message_id) as tmp2 WHERE a.rowid = tmp2.a_id ORDER BY tmp2.m_date DESC LIMIT ?");
    v9[7] = a2;
    IMDRunSqlOperation((uint64_t)v9);
    if (v11[5])
    {
      objc_msgSend(v8, "addObjectsFromArray:");

    }
    _Block_object_dispose(&v10, 8);
  }
  v6 = (const void *)v18[5];
  if (v6)
  {
    CFRelease(v6);
    v18[5] = 0;
  }
  _Block_object_dispose(&v17, 8);
  return v8;
}

void sub_1ABC42FC0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void _IMDAttachmentRecordDeleteAttachmentsExceptPreviewsToKeep(void *a1, void *a2, void *a3, void *a4)
{
  NSObject *v8;
  void *v9;
  __int128 v10;
  int v11;
  int v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  int v17;
  int v18;
  NSObject *v19;
  NSObject *v20;
  const char *v21;
  uint32_t v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  __int128 v26;
  _QWORD v27[8];
  uint64_t v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  _QWORD v32[4];

  *(_QWORD *)((char *)&v32[2] + 2) = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v30 = (uint64_t)a2;
      _os_log_impl(&dword_1ABB60000, v8, OS_LOG_TYPE_INFO, "Deleting previews at %@", buf, 0xCu);
    }
  }
  v9 = (void *)objc_msgSend(a4, "nextObject");
  if (v9)
  {
    v11 = 501;
    *(_QWORD *)&v10 = 138412290;
    v26 = v10;
    do
    {
      if (!--v11)
      {
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = sub_1ABC43A84;
        v27[3] = &unk_1E5AB7CB8;
        v27[4] = a1;
        v27[5] = a2;
        v27[6] = a3;
        v27[7] = a4;
        IMDPersistencePerformBlock(v27, 0);
        return;
      }
      v12 = objc_msgSend(a4, "level");
      if (v12 == 3)
      {
        if (objc_msgSend(a4, "level") != 3)
          goto LABEL_24;
        v13 = objc_msgSend(v9, "lastPathComponent");
        if (IMOSLoggingEnabled())
        {
          v14 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v30 = (uint64_t)v9;
            v31 = 2112;
            v32[0] = v13;
            _os_log_impl(&dword_1ABB60000, v14, OS_LOG_TYPE_INFO, "Examining '%@' as it looks like it contains a guid '%@'.", buf, 0x16u);
          }
        }
        if ((objc_msgSend(a1, "containsObject:", v13, v26) & 1) != 0)
          goto LABEL_24;
        v28 = 0;
        v15 = objc_msgSend(a2, "stringByAppendingPathComponent:", v9);
        if (IMOSLoggingEnabled())
        {
          v16 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v26;
            v30 = v15;
            _os_log_impl(&dword_1ABB60000, v16, OS_LOG_TYPE_INFO, "To Delete: %@", buf, 0xCu);
          }
        }
        v17 = objc_msgSend(a3, "removeItemAtPath:error:", v15, &v28);
        v18 = IMOSLoggingEnabled();
        if (v17)
        {
          if (!v18)
            goto LABEL_24;
          v19 = OSLogHandleForIMFoundationCategory();
          if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            goto LABEL_24;
          *(_DWORD *)buf = v26;
          v30 = v15;
          v20 = v19;
          v21 = "Cleaned up '%@'";
          v22 = 12;
        }
        else
        {
          if (!v18)
            goto LABEL_24;
          v24 = OSLogHandleForIMFoundationCategory();
          if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            goto LABEL_24;
          *(_DWORD *)buf = 138412546;
          v30 = v15;
          v31 = 2112;
          v32[0] = v28;
          v20 = v24;
          v21 = "Could ~not~ clean up '%@' due to error '%@'.";
          v22 = 22;
        }
      }
      else
      {
        if (!IMOSLoggingEnabled())
          goto LABEL_24;
        v23 = OSLogHandleForIMFoundationCategory();
        if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          goto LABEL_24;
        *(_DWORD *)buf = 138412802;
        v30 = (uint64_t)v9;
        v31 = 1024;
        LODWORD(v32[0]) = v12;
        WORD2(v32[0]) = 1024;
        *(_DWORD *)((char *)v32 + 6) = 3;
        v20 = v23;
        v21 = "Skipping '%@' as its level is %d and our target level is %d.";
        v22 = 24;
      }
      _os_log_impl(&dword_1ABB60000, v20, OS_LOG_TYPE_INFO, v21, buf, v22);
LABEL_24:
      v9 = (void *)objc_msgSend(a4, "nextObject", v26);
    }
    while (v9);
  }
  if (IMOSLoggingEnabled())
  {
    v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1ABB60000, v25, OS_LOG_TYPE_INFO, "_IMDAttachmentRecordDeleteAttachmentsExceptPreviewsToKeep File cleanse ended", buf, 2u);
    }
  }
}

void _IMDAttachmentRecordDeleteStickersExceptPreviewsToKeep(void *a1, void *a2)
{
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  BOOL v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  int v18;
  int v19;
  NSObject *v20;
  NSObject *v21;
  const char *v22;
  uint32_t v23;
  NSObject *v24;
  NSObject *v25;
  unsigned int v26;
  _QWORD v27[6];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v32 = 0;
  v4 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "contentsOfDirectoryAtPath:error:", a2, &v32);
  if (v32)
  {
    if (IMOSLoggingEnabled())
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v32;
        _os_log_impl(&dword_1ABB60000, v5, OS_LOG_TYPE_INFO, "Could ~not~ clean up sticker previews due to error '%@'.", buf, 0xCu);
      }
    }
    goto LABEL_30;
  }
  v6 = v4;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
  if (!v7)
  {
LABEL_30:
    if (IMOSLoggingEnabled())
    {
      v25 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1ABB60000, v25, OS_LOG_TYPE_INFO, "_IMDAttachmentRecordDeleteStickersExceptPreviewsToKeep File cleanse ended", buf, 2u);
      }
    }
    return;
  }
  v8 = 0;
  v9 = *(_QWORD *)v29;
LABEL_7:
  v10 = 0;
  v11 = v8;
  v12 = v8 <= 0x1F4;
  v13 = 500 - v8;
  v26 = v11 + v7;
  if (v12)
    v14 = v13;
  else
    v14 = 0;
  while (1)
  {
    if (*(_QWORD *)v29 != v9)
      objc_enumerationMutation(v6);
    v15 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v10);
    if (v14 == v10)
      break;
    if (_IMDAttachmentRecordShouldDeleteSticketPreviewWithFolderName(*(void **)(*((_QWORD *)&v28 + 1) + 8 * v10), a1))
    {
      v16 = objc_msgSend(a2, "stringByAppendingPathComponent:", v15);
      v32 = 0;
      if (IMOSLoggingEnabled())
      {
        v17 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v34 = v16;
          _os_log_impl(&dword_1ABB60000, v17, OS_LOG_TYPE_INFO, "Sticker Preview to Delete: %@", buf, 0xCu);
        }
      }
      v18 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "removeItemAtPath:error:", v16, &v32);
      v19 = IMOSLoggingEnabled();
      if (v18)
      {
        if (!v19)
          goto LABEL_25;
        v20 = OSLogHandleForIMFoundationCategory();
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          goto LABEL_25;
        *(_DWORD *)buf = 138412290;
        v34 = v16;
        v21 = v20;
        v22 = "Cleaned up sticker preview '%@'";
        v23 = 12;
      }
      else
      {
        if (!v19)
          goto LABEL_25;
        v24 = OSLogHandleForIMFoundationCategory();
        if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          goto LABEL_25;
        *(_DWORD *)buf = 138412546;
        v34 = v16;
        v35 = 2112;
        v36 = v32;
        v21 = v24;
        v22 = "Could ~not~ clean up sticker preview '%@' due to error '%@'.";
        v23 = 22;
      }
      _os_log_impl(&dword_1ABB60000, v21, OS_LOG_TYPE_INFO, v22, buf, v23);
    }
LABEL_25:
    if (v7 == ++v10)
    {
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
      v8 = v26;
      if (v7)
        goto LABEL_7;
      goto LABEL_30;
    }
  }
  if (!v15)
    goto LABEL_30;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = sub_1ABC439F4;
  v27[3] = &unk_1E5ABFBA8;
  v27[4] = a1;
  v27[5] = a2;
  IMDPersistencePerformBlock(v27, 0);
}

uint64_t _IMDAttachmentRecordShouldDeleteSticketPreviewWithFolderName(void *a1, void *a2)
{
  uint64_t v4;
  uint64_t result;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a1, "length");
  result = IMOSLoggingEnabled();
  if (v4)
  {
    if ((_DWORD)result)
    {
      v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v9 = 138412290;
        v10 = a1;
        _os_log_impl(&dword_1ABB60000, v6, OS_LOG_TYPE_INFO, "Examining pewview folder name'%@'.", (uint8_t *)&v9, 0xCu);
      }
    }
    if (objc_msgSend(a2, "containsObject:", a1))
    {
      result = IMOSLoggingEnabled();
      if ((_DWORD)result)
      {
        v7 = OSLogHandleForIMFoundationCategory();
        result = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
        if ((_DWORD)result)
        {
          v9 = 138412290;
          v10 = a1;
          v8 = "Sticker preview %@ is part of 200 last attachments, not deleting";
LABEL_12:
          _os_log_impl(&dword_1ABB60000, v7, OS_LOG_TYPE_INFO, v8, (uint8_t *)&v9, 0xCu);
          return 0;
        }
      }
    }
    else
    {
      return 1;
    }
  }
  else if ((_DWORD)result)
  {
    v7 = OSLogHandleForIMFoundationCategory();
    result = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
    if ((_DWORD)result)
    {
      v9 = 138412290;
      v10 = a1;
      v8 = "Skipping folder %@ as it does not have a valid transfername";
      goto LABEL_12;
    }
  }
  return result;
}

uint64_t sub_1ABC439F4(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1ABB60000, v2, OS_LOG_TYPE_INFO, "Beginning iteration of _IMDAttachmentRecordDeleteStickersExceptPreviewsToKeep attachments", v4, 2u);
    }
  }
  return _IMDAttachmentRecordDeleteStickersExceptPreviewsToKeep(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t sub_1ABC43A84(_QWORD *a1)
{
  NSObject *v2;
  uint8_t v4[16];

  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1ABB60000, v2, OS_LOG_TYPE_INFO, "Beginning iteration of _IMDAttachmentRecordDeleteAttachmentsExceptPreviewsToKeep attachments", v4, 2u);
    }
  }
  return _IMDAttachmentRecordDeleteAttachmentsExceptPreviewsToKeep(a1[4], a1[5], a1[6], a1[7]);
}

void IMDAttachmentRecordDeleteAttachmentsOlderThanDays(uint64_t a1)
{
  uint64_t v2;
  _QWORD v3[5];

  if ((IMDIsRunningInDatabaseServerProcess() & 1) != 0)
  {
    sub_1ABC43BA8(a1);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = sub_1ABC43C18;
    v3[3] = &unk_1E5AB2308;
    v3[4] = v2;
    _IMDPerformLockedStatementBlockWithQuery((uint64_t)CFSTR("DELETE FROM attachment WHERE created_date < ? AND transfer_name != 'GroupPhotoImage';"),
      (uint64_t)v3);
  }
  else
  {
    __syncXPCIMDAttachmentRecordDeleteAttachmentsOlderThanDays_IPCAction(0, a1);
  }
}

uint64_t sub_1ABC43BA8(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v2, "setDay:", -a1);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v4 = (void *)objc_msgSend(v3, "dateByAddingComponents:toDate:options:", v2, objc_msgSend(MEMORY[0x1E0C99D68], "date"), 0);

  return objc_msgSend(v4, "timeIntervalSinceReferenceDate");
}

uint64_t sub_1ABC43C18()
{
  CSDBSqliteBindInt64();
  CSDBSqliteStatementPerform();
  CSDBRecordSaveStore();
  return CSDBRecordStoreInvalidateCachesWithStore();
}

uint64_t IMDAttachmentRecordEstimateSpaceTakenByAttachmentsOlderThanDays(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[6];
  void (*v9[5])(void);
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v15 = a1;
      _os_log_impl(&dword_1ABB60000, v2, OS_LOG_TYPE_INFO, "Request to fetch estimate space taken by attachments older than days %llu", buf, 0xCu);
    }
  }
  if ((IMDIsRunningInDatabaseServerProcess() & 1) != 0)
  {
    sub_1ABC43BA8(a1);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1ABC43ED0;
    v8[3] = &unk_1E5AB2200;
    v8[5] = v3;
    v8[4] = &v10;
    _IMDPerformLockedStatementBlockWithQuery((uint64_t)CFSTR("SELECT filename FROM attachment WHERE created_date < ?;"),
      (uint64_t)v8);
    if (IMOSLoggingEnabled())
    {
      v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v5 = v11[3];
        *(_DWORD *)buf = 134218240;
        v15 = a1;
        v16 = 2048;
        v17 = v5;
        _os_log_impl(&dword_1ABB60000, v4, OS_LOG_TYPE_INFO, "Request to fetch estimate space taken by attachments older than days %llu returning %llu", buf, 0x16u);
      }
    }
  }
  else
  {
    v9[0] = (void (*)(void))MEMORY[0x1E0C809B0];
    v9[1] = (void (*)(void))3221225472;
    v9[2] = (void (*)(void))sub_1ABC43E94;
    v9[3] = (void (*)(void))&unk_1E5AAF630;
    v9[4] = (void (*)(void))&v10;
    __syncXPCIMDAttachmentRecordEstimateSpaceTakenByAttachmentsOlderThanDays_IPCAction(v9, a1);
  }
  v6 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v6;
}

uint64_t sub_1ABC43E94(uint64_t a1, xpc_object_t xdict)
{
  uint64_t result;

  result = xpc_dictionary_get_uint64(xdict, "bytes");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t sub_1ABC43ED0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  const __CFAllocator *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const unsigned __int8 *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD v19[6];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  CSDBSqliteBindInt64();
  CSDBSqliteStatementPerform();
  if (sqlite3_step(*(sqlite3_stmt **)(a4 + 8)) == 100)
  {
    v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v7 = *MEMORY[0x1E0D38090];
    do
    {
      v8 = (void *)MEMORY[0x1AF435474]();
      v9 = (void *)sqlite3_column_text(*(sqlite3_stmt **)(a4 + 8), 0);
      if (v9)
      {
        v10 = sqlite3_column_text(*(sqlite3_stmt **)(a4 + 8), 0);
        v9 = (void *)CFStringCreateWithCString(v6, (const char *)v10, 0x8000100u);
      }
      v11 = v9;
      if (v11)
      {
        v12 = v11;
        if (objc_msgSend(v11, "length"))
        {
          v13 = objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v20 = 0;
          v21 = &v20;
          v22 = 0x2020000000;
          v23 = 0;
          v14 = (void *)objc_msgSend(v12, "stringByResolvingAndStandardizingPath");
          if (v14)
          {
            v15 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v14);
            v16 = (void *)objc_msgSend(v14, "__im_filePathWithVariant:", v7);
            objc_msgSend(v15, "addObject:", v16);
            objc_msgSend(v15, "addObject:", objc_msgSend((id)objc_msgSend(v12, "stringByDeletingPathExtension"), "stringByAppendingPathExtension:", CFSTR("MOV")));
            objc_msgSend(v15, "addObject:", objc_msgSend((id)objc_msgSend(v16, "stringByDeletingPathExtension"), "stringByAppendingPathExtension:", CFSTR("MOV")));
            v19[0] = MEMORY[0x1E0C809B0];
            v19[1] = 3221225472;
            v19[2] = sub_1ABC4935C;
            v19[3] = &unk_1E5ABFFF8;
            v19[4] = v13;
            v19[5] = &v20;
            objc_msgSend(v15, "enumerateObjectsUsingBlock:", v19);
          }
          v17 = v21[3];
          _Block_object_dispose(&v20, 8);
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += v17;
        }
      }
      objc_autoreleasePoolPop(v8);
    }
    while (sqlite3_step(*(sqlite3_stmt **)(a4 + 8)) == 100);
  }
  return CSDBSqliteStatementReset();
}

void sub_1ABC440D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id IMDAttachmentFindLargestConversations(unint64_t a1)
{
  NSObject *v2;
  __CFString *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v9[5];
  uint8_t buf[8];
  uint8_t *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  void (*v16[5])(void);
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  uint64_t v22;
  uint8_t v23[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v17 = 0;
  v18 = &v17;
  v19 = 0x3052000000;
  v20 = sub_1ABC3F98C;
  v21 = sub_1ABC3F99C;
  v22 = 0;
  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1ABB60000, v2, OS_LOG_TYPE_INFO, "Request to fetch largest non synced conversations", buf, 2u);
    }
  }
  if ((IMDIsRunningInDatabaseServerProcess() & 1) != 0)
  {
    *(_QWORD *)buf = 0;
    v11 = buf;
    v12 = 0x3052000000;
    v13 = sub_1ABC3F98C;
    v14 = sub_1ABC3F99C;
    v15 = 0;
    v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (a1 >= 3)
      v3 = 0;
    else
      v3 = off_1E5AC0018[a1];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1ABC4440C;
    v9[3] = &unk_1E5AB2070;
    v9[4] = buf;
    _IMDPerformLockedStatementBlockWithQuery((uint64_t)v3, (uint64_t)v9);
    if (IMOSLoggingEnabled())
    {
      v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v5 = objc_msgSend(*((id *)v11 + 5), "count");
        *(_DWORD *)v23 = 134217984;
        v24 = v5;
        _os_log_impl(&dword_1ABB60000, v4, OS_LOG_TYPE_INFO, "Returning %lu conversations", v23, 0xCu);
      }
    }
    v6 = objc_msgSend(*((id *)v11 + 5), "copy");
    v18[5] = v6;

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v16[0] = (void (*)(void))MEMORY[0x1E0C809B0];
    v16[1] = (void (*)(void))3221225472;
    v16[2] = (void (*)(void))sub_1ABC443C8;
    v16[3] = (void (*)(void))&unk_1E5AAF630;
    v16[4] = (void (*)(void))&v17;
    __syncXPCIMDAttachmentRecordFindLargestConversations_IPCAction(v16, a1);
  }
  v7 = (id)v18[5];
  _Block_object_dispose(&v17, 8);
  return v7;
}

void sub_1ABC4435C(_Unwind_Exception *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  if (a2 == 1)
  {
    objc_begin_catch(exc_buf);
    objc_end_catch();
    JUMPOUT(0x1ABC442D8);
  }
  _Block_object_dispose(&a15, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(exc_buf);
}

uint64_t sub_1ABC443C8(uint64_t a1, xpc_object_t xdict)
{
  uint64_t result;

  result = (uint64_t)xpc_dictionary_get_value(xdict, "result");
  if (result)
  {
    result = _CFXPCCreateCFObjectFromXPCObject();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  }
  return result;
}

uint64_t sub_1ABC4440C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  const __CFAllocator *v6;
  void *v7;
  void *v8;
  const unsigned __int8 *v9;
  id v10;
  sqlite3_int64 v11;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  if (sqlite3_step(*(sqlite3_stmt **)(a4 + 8)) == 100)
  {
    v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    do
    {
      v7 = (void *)MEMORY[0x1AF435474]();
      v8 = (void *)sqlite3_column_text(*(sqlite3_stmt **)(a4 + 8), 0);
      if (v8)
      {
        v9 = sqlite3_column_text(*(sqlite3_stmt **)(a4 + 8), 0);
        v8 = (void *)CFStringCreateWithCString(v6, (const char *)v9, 0x8000100u);
      }
      v10 = v8;
      v11 = sqlite3_column_int64(*(sqlite3_stmt **)(a4 + 8), 1);
      if (v10)
      {
        v13[1] = CFSTR("size");
        v14[0] = v10;
        v13[0] = CFSTR("guid");
        v14[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v11);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2));
      }
      objc_autoreleasePoolPop(v7);
    }
    while (sqlite3_step(*(sqlite3_stmt **)(a4 + 8)) == 100);
  }
  return CSDBSqliteStatementReset();
}

id IMDAttachmentFindLargestNonSyncedAttachmentGUIDs()
{
  return IMDAttachmentFindLargestAttachmentGUIDsForAttachmentClassWithLimitAndOffset(0, 0, 100, 0);
}

id IMDAttachmentFindLargestAttachmentGUIDsForAttachmentClass(void *a1, unint64_t a2)
{
  return IMDAttachmentFindLargestAttachmentGUIDsForAttachmentClassWithLimitAndOffset(a1, a2, 100, 0);
}

id IMDAttachmentFindLargestAttachmentGUIDsForAttachmentClassWithLimitAndOffset(void *a1, unint64_t a2, int64_t a3, int64_t a4)
{
  NSObject *v8;
  const __CFString *v9;
  const __CFString *v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  _QWORD v19[8];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint8_t buf[8];
  uint8_t *v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  uint64_t v29;
  void (*v30[5])(void);
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  void (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  uint64_t v36;
  uint8_t v37[4];
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v31 = 0;
  v32 = &v31;
  v33 = 0x3052000000;
  v34 = sub_1ABC3F98C;
  v35 = sub_1ABC3F99C;
  v36 = 0;
  if (IMOSLoggingEnabled())
  {
    v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1ABB60000, v8, OS_LOG_TYPE_INFO, "Request to fetch non synced attachment guids for attachment class", buf, 2u);
    }
  }
  if ((IMDIsRunningInDatabaseServerProcess() & 1) != 0)
  {
    v9 = &stru_1E5AC1D70;
    if (a2 <= 2)
      v9 = off_1E5AC0030[a2];
    if ((objc_msgSend(a1, "isEqualToString:", IMAttachmentClassPhoto[0]) & 1) != 0)
    {
      v10 = CFSTR("AND is_sticker = 0 AND mime_type LIKE 'image/%' AND NOT mime_type = 'image/gif'");
    }
    else if ((objc_msgSend(a1, "isEqualToString:", IMAttachmentClassVideo) & 1) != 0)
    {
      v10 = CFSTR("AND mime_type LIKE 'video/%'");
    }
    else if ((objc_msgSend(a1, "isEqualToString:", IMAttachmentClassGIFOrSticker[0]) & 1) != 0)
    {
      v10 = CFSTR("AND (is_sticker = 1 OR mime_type = 'image/gif')");
    }
    else
    {
      v11 = objc_msgSend(a1, "isEqualToString:", IMAttachmentClassOther);
      v10 = CFSTR("AND NOT (mime_type LIKE 'image/%' OR mime_type LIKE 'video/%' OR is_sticker = 1 OR mime_type = 'image/gif')");
      if (!v11)
        v10 = &stru_1E5AC1D70;
    }
    v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v9, CFSTR("%@"), 0, v10);
    *(_QWORD *)buf = 0;
    v25 = buf;
    v26 = 0x3052000000;
    v27 = sub_1ABC3F98C;
    v28 = sub_1ABC3F99C;
    v29 = 0;
    v29 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 0;
    if (v12)
    {
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = sub_1ABC449B8;
      v19[3] = &unk_1E5ABFBD0;
      v19[6] = a3;
      v19[7] = a4;
      v19[4] = buf;
      v19[5] = &v20;
      _IMDPerformLockedStatementBlockWithQuery(v12, (uint64_t)v19);
    }
    if (IMOSLoggingEnabled())
    {
      v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = objc_msgSend(*((id *)v25 + 5), "count");
        v15 = v21[3];
        *(_DWORD *)v37 = 134218498;
        v38 = v14;
        v39 = 2048;
        v40 = v15;
        v41 = 2112;
        v42 = a1;
        _os_log_impl(&dword_1ABB60000, v13, OS_LOG_TYPE_INFO, "Returning %lu non synced attachments with total size %llu for attachmentClass %@", v37, 0x20u);
      }
    }
    v16 = objc_msgSend(*((id *)v25 + 5), "copy");
    v32[5] = v16;
    _Block_object_dispose(&v20, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    v30[0] = (void (*)(void))MEMORY[0x1E0C809B0];
    v30[1] = (void (*)(void))3221225472;
    v30[2] = (void (*)(void))sub_1ABC44974;
    v30[3] = (void (*)(void))&unk_1E5AAF630;
    v30[4] = (void (*)(void))&v31;
    __syncXPCIMDAttachmentRecordFindLargestAttachmentGUIDsWithLimitAndOffset_IPCAction(v30, a1, a2, a3, a4);
  }
  v17 = (id)v32[5];
  _Block_object_dispose(&v31, 8);
  return v17;
}

void sub_1ABC448F8(_Unwind_Exception *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
  uint64_t v23;

  if (a2 == 1)
  {
    objc_begin_catch(exc_buf);
    objc_end_catch();
    JUMPOUT(0x1ABC4486CLL);
  }
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose((const void *)(v23 - 192), 8);
  _Unwind_Resume(exc_buf);
}

uint64_t sub_1ABC44974(uint64_t a1, xpc_object_t xdict)
{
  uint64_t result;

  result = (uint64_t)xpc_dictionary_get_value(xdict, "result");
  if (result)
  {
    result = _CFXPCCreateCFObjectFromXPCObject();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  }
  return result;
}

uint64_t sub_1ABC449B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  const __CFAllocator *v7;
  void *v8;
  const unsigned __int8 *v9;
  id v10;
  sqlite3_int64 v11;
  void *v12;
  const unsigned __int8 *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  CSDBSqliteBindInt64();
  CSDBSqliteBindInt64();
  result = sqlite3_step(*(sqlite3_stmt **)(a4 + 8));
  if ((_DWORD)result == 100)
  {
    v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    do
    {
      v8 = (void *)sqlite3_column_text(*(sqlite3_stmt **)(a4 + 8), 0);
      if (v8)
      {
        v9 = sqlite3_column_text(*(sqlite3_stmt **)(a4 + 8), 0);
        v8 = (void *)CFStringCreateWithCString(v7, (const char *)v9, 0x8000100u);
      }
      v10 = v8;
      v11 = sqlite3_column_int64(*(sqlite3_stmt **)(a4 + 8), 1);
      v12 = (void *)sqlite3_column_text(*(sqlite3_stmt **)(a4 + 8), 2);
      if (v12)
      {
        v13 = sqlite3_column_text(*(sqlite3_stmt **)(a4 + 8), 2);
        v12 = (void *)CFStringCreateWithCString(v7, (const char *)v13, 0x8000100u);
      }
      v14 = v12;
      v15 = objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)sqlite3_column_int64(*(sqlite3_stmt **)(a4 + 8), 3));
      if (v10 && v14)
      {
        v16 = v15;
        if (v15)
        {
          v18[0] = v10;
          v17[0] = CFSTR("guid");
          v17[1] = CFSTR("size");
          v18[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v11);
          v18[2] = v14;
          v17[2] = CFSTR("filename");
          v17[3] = CFSTR("date");
          v18[3] = v16;
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4));
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += v11;
        }
      }
      result = sqlite3_step(*(sqlite3_stmt **)(a4 + 8));
    }
    while ((_DWORD)result == 100);
  }
  return result;
}

id IMDAttachmentSpaceTakenByAttachmentClass(int64_t a1)
{
  const __CFString *v2;
  const __CFString *v3;
  id v4;
  _QWORD v6[5];
  void (*v7[5])(void);
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = sub_1ABC3F98C;
  v12 = sub_1ABC3F99C;
  v13 = 0;
  if ((IMDIsRunningInDatabaseServerProcess() & 1) != 0)
  {
    v2 = CFSTR("SELECT mime_type, is_sticker, SUM(total_bytes) FROM attachment WHERE ck_sync_state != 1 AND hide_attachment=0 AND transfer_state = 5 GROUP BY mime_type, is_sticker ;");
    if (a1 == 1)
      v2 = CFSTR("SELECT mime_type, is_sticker, SUM(total_bytes) FROM attachment WHERE ck_sync_state != 0 AND hide_attachment=0 AND transfer_state = 5 GROUP BY mime_type, is_sticker ;");
    if (a1)
      v3 = v2;
    else
      v3 = CFSTR("SELECT mime_type, is_sticker, SUM(total_bytes) FROM attachment WHERE hide_attachment=0 AND transfer_state = 5 GROUP BY mime_type, is_sticker ;");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = sub_1ABC44D28;
    v6[3] = &unk_1E5AB2070;
    v6[4] = &v8;
    _IMDPerformLockedStatementBlockWithQuery((uint64_t)v3, (uint64_t)v6);
  }
  else
  {
    v7[0] = (void (*)(void))MEMORY[0x1E0C809B0];
    v7[1] = (void (*)(void))3221225472;
    v7[2] = (void (*)(void))sub_1ABC44CE4;
    v7[3] = (void (*)(void))&unk_1E5AAF630;
    v7[4] = (void (*)(void))&v8;
    __syncXPCIMDAttachmentRecordSpaceTakenByAttachmentClass_IPCAction(v7, a1);
  }
  v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);
  return v4;
}

void sub_1ABC44CC8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1ABC44CE4(uint64_t a1, xpc_object_t xdict)
{
  uint64_t result;

  result = (uint64_t)xpc_dictionary_get_value(xdict, "result");
  if (result)
  {
    result = _CFXPCCreateCFObjectFromXPCObject();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  }
  return result;
}

void sub_1ABC44D28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  const __CFAllocator *v5;
  void *v6;
  const unsigned __int8 *v7;
  id v8;
  int v9;
  sqlite3_int64 v10;
  uint64_t *v11;
  char v12;
  char v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;

  v20 = a1;
  v22 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 4);
  if (sqlite3_step(*(sqlite3_stmt **)(a4 + 8)) == 100)
  {
    v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    do
    {
      v6 = (void *)sqlite3_column_text(*(sqlite3_stmt **)(a4 + 8), 0);
      if (v6)
      {
        v7 = sqlite3_column_text(*(sqlite3_stmt **)(a4 + 8), 0);
        v6 = (void *)CFStringCreateWithCString(v5, (const char *)v7, 0x8000100u);
      }
      v8 = v6;
      v9 = sqlite3_column_int(*(sqlite3_stmt **)(a4 + 8), 1);
      v10 = sqlite3_column_int64(*(sqlite3_stmt **)(a4 + 8), 2);
      v11 = (uint64_t *)IMAttachmentClassGIFOrSticker;
      if (!v9)
      {
        v12 = objc_msgSend(v8, "isEqualToString:", CFSTR("image/gif"));
        v11 = (uint64_t *)IMAttachmentClassGIFOrSticker;
        if ((v12 & 1) == 0)
        {
          v13 = objc_msgSend(v8, "containsString:", CFSTR("image/"));
          v11 = (uint64_t *)IMAttachmentClassPhoto;
          if ((v13 & 1) == 0)
          {
            v15 = objc_msgSend(v8, "rangeOfString:", CFSTR("video/")) || v14 == 0;
            v11 = &IMAttachmentClassOther;
            if (!v15)
              v11 = &IMAttachmentClassVideo;
          }
        }
      }
      v16 = *v11;
      v17 = (void *)objc_msgSend(v22, "objectForKeyedSubscript:", *v11, v20);
      if (v17)
        v18 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v17, "unsignedLongLongValue") + v10);
      else
        v18 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v10);
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v18, v16);
    }
    while (sqlite3_step(*(sqlite3_stmt **)(a4 + 8)) == 100);
  }
  v19 = objc_msgSend(v22, "copy", v20);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v21 + 32) + 8) + 40) = v19;

}

BOOL _IMDAttachmentUpdateAttachmentWithRowidToFileSize(uint64_t a1, uint64_t a2)
{
  _BOOL8 v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  _QWORD v10[7];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void *v15;
  _OWORD v16[11];
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!IMDIsRunningInDatabaseServerProcess())
    return 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0xD010000000;
  v15 = &unk_1ABCCF005;
  memset(v16, 0, sizeof(v16));
  IMDSqlOperationInitWithSharedCSDBDatabase((uint64_t)v16);
  IMDSqlOperationBeginTransaction(v13 + 4);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1ABC4513C;
  v11[3] = &unk_1E5AB0C88;
  v11[4] = &v12;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1ABC45188;
  v10[3] = &unk_1E5ABFBF8;
  v10[4] = &v12;
  v10[5] = a2;
  v10[6] = a1;
  v4 = IMDSqlOperationExecuteQuery((uint64_t)(v13 + 4), CFSTR("UPDATE attachment set total_bytes = ? WHERE rowid = ?;"),
         (uint64_t)v10);
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a1);
      v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
      v8 = CFSTR("NO");
      *(_DWORD *)buf = 138412802;
      v18 = v6;
      v19 = 2112;
      if (v4)
        v8 = CFSTR("YES");
      v20 = v7;
      v21 = 2112;
      v22 = v8;
      _os_log_impl(&dword_1ABB60000, v5, OS_LOG_TYPE_INFO, "Updated attachment at rowID %@ to new filesize %@ with success %@", buf, 0x20u);
    }
  }
  sub_1ABC4513C((uint64_t)v11);
  _Block_object_dispose(&v12, 8);
  return v4;
}

void sub_1ABC450F4(_Unwind_Exception *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  if (a2 == 1)
  {
    objc_begin_catch(exc_buf);
    objc_end_catch();
    JUMPOUT(0x1ABC450A0);
  }
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(exc_buf);
}

BOOL sub_1ABC4513C(uint64_t a1)
{
  IMDSqlOperationFinishQuery(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32);
  IMDSqlOperationCommitOrRevertTransaction((_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32));
  return IMDSqlOperationRelease(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32, 0);
}

void sub_1ABC45188(_QWORD *a1)
{
  IMDSqlStatementBindInt64(*(_QWORD *)(a1[4] + 8) + 64, a1[5]);
  IMDSqlStatementBindInt64(*(_QWORD *)(a1[4] + 8) + 64, a1[6]);
}

BOOL _IMDAttachmentUpdateAttachmentWithRowidToTransferState(uint64_t a1, uint64_t a2)
{
  _BOOL8 v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  _QWORD v10[7];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void *v15;
  _OWORD v16[11];
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!IMDIsRunningInDatabaseServerProcess())
    return 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0xD010000000;
  v15 = &unk_1ABCCF005;
  memset(v16, 0, sizeof(v16));
  IMDSqlOperationInitWithSharedCSDBDatabase((uint64_t)v16);
  IMDSqlOperationBeginTransaction(v13 + 4);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1ABC45410;
  v11[3] = &unk_1E5AB0C88;
  v11[4] = &v12;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1ABC4545C;
  v10[3] = &unk_1E5ABFBF8;
  v10[4] = &v12;
  v10[5] = a2;
  v10[6] = a1;
  v4 = IMDSqlOperationExecuteQuery((uint64_t)(v13 + 4), CFSTR("UPDATE attachment set transfer_state = ? WHERE rowid = ?;"),
         (uint64_t)v10);
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a1);
      v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
      v8 = CFSTR("NO");
      *(_DWORD *)buf = 138412802;
      v18 = v6;
      v19 = 2112;
      if (v4)
        v8 = CFSTR("YES");
      v20 = v7;
      v21 = 2112;
      v22 = v8;
      _os_log_impl(&dword_1ABB60000, v5, OS_LOG_TYPE_INFO, "Updated attachment at rowID %@ to new transfer_state %@ with success %@", buf, 0x20u);
    }
  }
  sub_1ABC45410((uint64_t)v11);
  _Block_object_dispose(&v12, 8);
  return v4;
}

void sub_1ABC453C8(_Unwind_Exception *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  if (a2 == 1)
  {
    objc_begin_catch(exc_buf);
    objc_end_catch();
    JUMPOUT(0x1ABC45374);
  }
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(exc_buf);
}

BOOL sub_1ABC45410(uint64_t a1)
{
  IMDSqlOperationFinishQuery(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32);
  IMDSqlOperationCommitOrRevertTransaction((_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32));
  return IMDSqlOperationRelease(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32, 0);
}

void sub_1ABC4545C(_QWORD *a1)
{
  IMDSqlStatementBindInt64(*(_QWORD *)(a1[4] + 8) + 64, a1[5]);
  IMDSqlStatementBindInt64(*(_QWORD *)(a1[4] + 8) + 64, a1[6]);
}

uint64_t _IMDCopyAttachmentsNeedingFileSizeUpdatesForWatermark(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = -1;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = sub_1ABC3F98C;
  v11 = sub_1ABC3F99C;
  v12 = 0;
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1ABC455D4;
  v6[3] = &unk_1E5AB8048;
  v6[5] = &v7;
  v6[6] = a1;
  v6[4] = &v13;
  _IMDPerformLockedStatementBlockWithQuery((uint64_t)CFSTR("SELECT filename,rowid,total_bytes,ck_sync_state,is_sticker,hide_attachment,transfer_state,guid FROM attachment WHERE rowid > ? AND filename != '' ORDER BY rowid ASC LIMIT 20;"),
    (uint64_t)v6);
  *a2 = objc_msgSend((id)v8[5], "copy");

  v4 = v14[3];
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v13, 8);
  return v4;
}

void sub_1ABC455A8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1ABC455D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  const __CFAllocator *v7;
  void *v8;
  const unsigned __int8 *v9;
  id v10;
  sqlite3_int64 v11;
  sqlite3_int64 v12;
  sqlite3_int64 v13;
  sqlite3_int64 v14;
  sqlite3_int64 v15;
  void *v16;
  const unsigned __int8 *v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const __CFAllocator *v24;
  uint64_t v25;
  _QWORD v26[8];
  _QWORD v27[10];

  v27[8] = *MEMORY[0x1E0C80C00];
  CSDBSqliteBindInt64();
  result = sqlite3_step(*(sqlite3_stmt **)(a4 + 8));
  if ((_DWORD)result == 100)
  {
    v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v24 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v25 = a1;
    do
    {
      v8 = (void *)sqlite3_column_text(*(sqlite3_stmt **)(a4 + 8), 0);
      if (v8)
      {
        v9 = sqlite3_column_text(*(sqlite3_stmt **)(a4 + 8), 0);
        v8 = (void *)CFStringCreateWithCString(v7, (const char *)v9, 0x8000100u);
      }
      v10 = v8;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = sqlite3_column_int64(*(sqlite3_stmt **)(a4 + 8), 1);
      v11 = sqlite3_column_int64(*(sqlite3_stmt **)(a4 + 8), 2);
      v12 = sqlite3_column_int64(*(sqlite3_stmt **)(a4 + 8), 3);
      v13 = sqlite3_column_int64(*(sqlite3_stmt **)(a4 + 8), 4);
      v14 = sqlite3_column_int64(*(sqlite3_stmt **)(a4 + 8), 5);
      v15 = sqlite3_column_int64(*(sqlite3_stmt **)(a4 + 8), 6);
      v16 = (void *)sqlite3_column_text(*(sqlite3_stmt **)(a4 + 8), 7);
      if (v16)
      {
        v17 = sqlite3_column_text(*(sqlite3_stmt **)(a4 + 8), 7);
        v16 = (void *)CFStringCreateWithCString(v7, (const char *)v17, 0x8000100u);
      }
      v18 = v16;
      if (objc_msgSend(v10, "length"))
      {
        if (v18)
        {
          v19 = *(_QWORD *)(a1 + 32);
          v20 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
          v26[0] = CFSTR("rowID");
          v27[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(*(_QWORD *)(v19 + 8) + 24));
          v26[1] = CFSTR("bytes");
          v27[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v11);
          v27[2] = v10;
          v26[2] = CFSTR("filename");
          v26[3] = CFSTR("ck_sync_state");
          v27[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v12);
          v26[4] = CFSTR("is_sticker");
          v27[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v13);
          v26[5] = CFSTR("hide_attachment");
          v27[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v14);
          v26[6] = CFSTR("transfer_state");
          v21 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v15);
          v26[7] = CFSTR("guid");
          v27[6] = v21;
          v27[7] = v18;
          v22 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 8);
          v23 = v20;
          v7 = v24;
          a1 = v25;
          objc_msgSend(v23, "addObject:", v22);
        }
      }
      result = sqlite3_step(*(sqlite3_stmt **)(a4 + 8));
    }
    while ((_DWORD)result == 100);
  }
  return result;
}

BOOL _IMDUpdateAttachmentFileSizeIfNeeded(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a3 != a2)
  {
    if (IMOSLoggingEnabled())
    {
      v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v8 = 138412802;
        v9 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a1);
        v10 = 2112;
        v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
        v12 = 2112;
        v13 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
        _os_log_impl(&dword_1ABB60000, v6, OS_LOG_TYPE_INFO, "For rowID %@ bytes %@ is not equal to new byte count %@ for file.", (uint8_t *)&v8, 0x20u);
      }
    }
    _IMDAttachmentUpdateAttachmentWithRowidToFileSize(a1, a3);
  }
  return a3 != a2;
}

void *IMDAttachmentUpdateAttachmentFileSizeWithRowIDGreaterThanWatermark(int64_t a1)
{
  id v2;
  uint64_t v3;
  __int128 v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  NSObject *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  const char *v30;
  uint32_t v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  uint64_t v40;
  NSObject *v41;
  uint64_t v42;
  NSObject *v43;
  void *v44;
  __int128 v46;
  id obj;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  id v67;
  void (*v68[6])(void);
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  char v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  void (*v76)(uint64_t, uint64_t);
  void (*v77)(uint64_t);
  id v78;
  _BYTE v79[128];
  _QWORD v80[2];
  _QWORD v81[2];
  _QWORD v82[3];
  _QWORD v83[3];
  uint8_t buf[4];
  uint64_t v85;
  __int16 v86;
  void *v87;
  __int16 v88;
  uint64_t v89;
  __int16 v90;
  const __CFString *v91;
  __int16 v92;
  const __CFString *v93;
  __int16 v94;
  const __CFString *v95;
  _BYTE v96[128];
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v73 = 0;
  v74 = &v73;
  v75 = 0x3052000000;
  v76 = sub_1ABC3F98C;
  v77 = sub_1ABC3F99C;
  v78 = 0;
  v78 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v69 = 0;
  v70 = &v69;
  v71 = 0x2020000000;
  v72 = 0;
  if ((IMDIsRunningInDatabaseServerProcess() & 1) == 0)
  {
    v68[0] = (void (*)(void))MEMORY[0x1E0C809B0];
    v68[1] = (void (*)(void))3221225472;
    v68[2] = (void (*)(void))sub_1ABC46464;
    v68[3] = (void (*)(void))&unk_1E5AB21D8;
    v68[4] = (void (*)(void))&v69;
    v68[5] = (void (*)(void))&v73;
    __syncXPCIMDAttachmentUpdateAttachmentFileSizeWithRowIDGreaterThanWatermark_IPCAction(v68, a1);
    goto LABEL_72;
  }
  v67 = 0;
  _IMDCopyAttachmentsNeedingFileSizeUpdatesForWatermark(a1, &v67);
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v2 = v67;
  v3 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v63, v96, 16);
  if (!v3)
    goto LABEL_65;
  obj = v2;
  v48 = *MEMORY[0x1E0D37FB8];
  v49 = *(_QWORD *)v64;
  *(_QWORD *)&v4 = 134219266;
  v46 = v4;
  do
  {
    v56 = 0;
    v50 = v3;
    do
    {
      if (*(_QWORD *)v64 != v49)
        objc_enumerationMutation(obj);
      v5 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v56);
      v6 = objc_msgSend(v5, "objectForKey:", CFSTR("filename"), v46);
      v55 = objc_msgSend((id)objc_msgSend(v5, "objectForKey:", CFSTR("rowID")), "longLongValue");
      v51 = objc_msgSend((id)objc_msgSend(v5, "objectForKey:", CFSTR("bytes")), "longLongValue");
      v54 = objc_msgSend((id)objc_msgSend(v5, "objectForKey:", CFSTR("ck_sync_state")), "longLongValue");
      v57 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v6), "stringByExpandingTildeInPath");
      v7 = objc_msgSend((id)objc_msgSend(v5, "objectForKey:", CFSTR("is_sticker")), "longLongValue");
      v8 = objc_msgSend((id)objc_msgSend(v5, "objectForKey:", CFSTR("hide_attachment")), "longLongValue");
      v52 = objc_msgSend((id)objc_msgSend(v5, "objectForKey:", CFSTR("transfer_state")), "longLongValue");
      v9 = objc_msgSend((id)objc_msgSend(v57, "pathExtension"), "im_isAudioMessageExtension");
      v53 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", v57);
      v10 = objc_msgSend((id)objc_msgSend(v57, "lastPathComponent"), "containsString:", v48);
      v11 = objc_msgSend(MEMORY[0x1E0D39848], "canMarkPurgeableWithCKSyncState:transferState:isAudio:isSticker:isGroupPhoto:", v54, 5, v9, v7 != 0, v10);
      if (IMOSLoggingEnabled())
      {
        v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v46;
          v13 = CFSTR("NO");
          if (v7)
            v14 = CFSTR("YES");
          else
            v14 = CFSTR("NO");
          v85 = v55;
          if (v8)
            v15 = CFSTR("YES");
          else
            v15 = CFSTR("NO");
          v86 = 2112;
          if (v11)
            v13 = CFSTR("YES");
          v87 = v57;
          v88 = 2048;
          v89 = v54;
          v90 = 2112;
          v91 = v14;
          v92 = 2112;
          v93 = v15;
          v94 = 2112;
          v95 = v13;
          _os_log_impl(&dword_1ABB60000, v12, OS_LOG_TYPE_INFO, "Can mark rowID: %lld file: [%@], cloudKitSyncState: [%lld], is_sticker: [%@], hide_attachment: [%@], purgeable: [%@]", buf, 0x3Eu);
        }
      }
      if (v11)
      {
        if (v53)
        {
          v16 = (void *)v74[5];
          v82[0] = CFSTR("rowID");
          v83[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v55);
          v83[1] = v57;
          v82[1] = CFSTR("filename");
          v82[2] = CFSTR("guid");
          v83[2] = objc_msgSend(v5, "objectForKey:");
          objc_msgSend(v16, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v83, v82, 3));
          if (v52 != 5)
          {
            if (IMOSLoggingEnabled())
            {
              v17 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
              {
                v18 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v55);
                *(_DWORD *)buf = 138412546;
                v85 = v18;
                v86 = 2112;
                v87 = v57;
                _os_log_impl(&dword_1ABB60000, v17, OS_LOG_TYPE_INFO, "File on disk, but not in finished state: %@, filename: %@.", buf, 0x16u);
              }
            }
            _IMDAttachmentUpdateAttachmentWithRowidToTransferState(v55, 5);
          }
        }
      }
      else
      {
        v19 = (void *)v74[5];
        v80[0] = CFSTR("rowID");
        v20 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v55);
        v80[1] = CFSTR("filename");
        v81[0] = v20;
        v81[1] = &stru_1E5AC1D70;
        objc_msgSend(v19, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v81, v80, 2));
      }
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v57);
      v21 = (void *)objc_msgSend((id)IMAttachmentPreviewFileURL(), "path");
      v22 = (void *)objc_msgSend(v57, "im_livePhotoBundlePath");
      v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      if (objc_msgSend(v22, "length"))
        objc_msgSend(v23, "addObject:", v22);
      if (objc_msgSend(v21, "length")
        && objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", v21))
      {
        objc_msgSend(v23, "addObject:", v21);
      }
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v59, v79, 16);
      if (v24)
      {
        v25 = *(_QWORD *)v60;
        do
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v60 != v25)
              objc_enumerationMutation(v23);
            v27 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
            if (objc_msgSend(v27, "length"))
            {
              v58 = 0;
              if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "removeItemAtPath:error:", v27, &v58) & 1) != 0)
              {
                if (IMOSLoggingEnabled())
                {
                  v28 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    v85 = (uint64_t)v27;
                    v29 = v28;
                    v30 = "Live Photo bundle deleted: %@";
                    v31 = 12;
LABEL_44:
                    _os_log_impl(&dword_1ABB60000, v29, OS_LOG_TYPE_INFO, v30, buf, v31);
                    continue;
                  }
                }
              }
              else if (IMOSLoggingEnabled())
              {
                v32 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  v85 = (uint64_t)v27;
                  v86 = 2112;
                  v87 = v58;
                  v29 = v32;
                  v30 = "Live Photo bundle on disk, but failed to delete it: %@, error: %@";
                  v31 = 22;
                  goto LABEL_44;
                }
              }
            }
          }
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v59, v79, 16);
        }
        while (v24);
      }

      if (v53)
      {
        v33 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "attributesOfItemAtPath:error:", v57, 0);
        v34 = objc_msgSend(v33, "fileSize");
        v35 = (void *)objc_msgSend(v57, "im_livePhotoVideoPath");
        if (v33)
        {
          v36 = v35;
          if (!objc_msgSend(v35, "length"))
            goto LABEL_52;
          v37 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "attributesOfItemAtPath:error:", v36, 0);
          v38 = objc_msgSend(v37, "fileSize");
          if (v37)
          {
            v34 += v38;
LABEL_52:
            _IMDUpdateAttachmentFileSizeIfNeeded(v55, v51, v34);
            goto LABEL_62;
          }
        }
        if (IMOSLoggingEnabled())
        {
          v41 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            v42 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v55);
            *(_DWORD *)buf = 138412546;
            v85 = v42;
            v86 = 2112;
            v87 = v57;
            _os_log_impl(&dword_1ABB60000, v41, OS_LOG_TYPE_INFO, "Failed getting filesize at rowID %@ and path %@.", buf, 0x16u);
          }
        }
      }
      else if (v54 == 1 && v52 == 5)
      {
        if (IMOSLoggingEnabled())
        {
          v39 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            v40 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v55);
            *(_DWORD *)buf = 138412546;
            v85 = v40;
            v86 = 2112;
            v87 = v57;
            _os_log_impl(&dword_1ABB60000, v39, OS_LOG_TYPE_INFO, "File not on disk, lets switch it to tap to download rowID: %@, filename: %@.", buf, 0x16u);
          }
        }
        _IMDAttachmentUpdateAttachmentWithRowidToTransferState(v55, 0);
      }
LABEL_62:
      ++v56;
    }
    while (v56 != v50);
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v96, 16);
  }
  while (v3);
  v2 = v67;
LABEL_65:
  if (objc_msgSend(v2, "count"))
  {
    *((_BYTE *)v70 + 24) = 1;
  }
  else if (IMOSLoggingEnabled())
  {
    v43 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1ABB60000, v43, OS_LOG_TYPE_INFO, "No more attachments found to update", buf, 2u);
    }
  }

LABEL_72:
  v44 = (void *)v74[5];
  if (!*((_BYTE *)v70 + 24))
  {

    v44 = 0;
  }
  _Block_object_dispose(&v69, 8);
  _Block_object_dispose(&v73, 8);
  return v44;
}

xpc_object_t sub_1ABC46464(uint64_t a1, xpc_object_t xdict)
{
  xpc_object_t result;
  _QWORD applier[5];

  result = xpc_dictionary_get_value(xdict, "array_result");
  if (result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    applier[0] = MEMORY[0x1E0C809B0];
    applier[1] = 3221225472;
    applier[2] = sub_1ABC464EC;
    applier[3] = &unk_1E5AAF608;
    applier[4] = *(_QWORD *)(a1 + 40);
    return (xpc_object_t)xpc_array_apply(result, applier);
  }
  return result;
}

uint64_t sub_1ABC464EC(uint64_t a1)
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", IMGetXPCIntFromDictionary()), CFSTR("rowID"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", IMGetXPCStringFromDictionary(), CFSTR("filename"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", IMGetXPCStringFromDictionary(), CFSTR("guid"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v2);

  return 1;
}

void IMDAttachmentRecordCopyAttachmentGUIDsAndPathsForChatIdentifiersOnServicesQuery(void *a1, CFTypeRef *a2)
{
  unint64_t v3;
  __CFString *Mutable;
  unint64_t v5;
  CFStringRef v6;
  CFStringRef v7;
  NSObject *v8;
  uint8_t buf[4];
  CFStringRef v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(a1, "count");
  Mutable = CFStringCreateMutable(0, 0);
  CFStringAppend(Mutable, CFSTR("SELECT c.rowid FROM chat c WHERE (c.chat_identifier = ? AND c.service_name = ?)"));
  if (v3 >= 2)
  {
    v5 = v3 - 1;
    do
    {
      CFStringAppend(Mutable, CFSTR(" OR (c.chat_identifier = ? AND c.service_name = ?)"));
      --v5;
    }
    while (v5);
  }
  v6 = CFStringCreateWithFormat(0, 0, CFSTR("select a.filename, a.guid, a.is_sticker, a.created_date, a.transfer_state from attachment a join  (select ma.attachment_id as a_id, message_date as m_date from message_attachment_join ma join (select cm.message_id as message_id, cm.message_date as message_date from message m join chat_message_join cm where m.cache_has_attachments = 1 AND cm.chat_id AND cm.chat_id IN (%@) AND m.rowid = cm.message_id) as tmp where ma.message_id = tmp.message_id) as tmp2 where a.rowid = tmp2.a_id AND     a.hide_attachment == 0 ORDER BY tmp2.m_date ASC;"),
         Mutable);
  v7 = v6;
  if (a2)
  {
    *a2 = CFRetain(v6);
    if (IMOSLoggingEnabled())
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v10 = v7;
        _os_log_impl(&dword_1ABB60000, v8, OS_LOG_TYPE_INFO, "IMDAttachmentRecordCopyAttachmentGUIDsAndPathsForChatIdentifiersOnServicesQuery %@", buf, 0xCu);
      }
    }
  }
  CFRelease(v7);
  CFRelease(Mutable);
}

id sub_1ABC46710(_QWORD *a1, uint64_t a2)
{
  const __CFString *v4;
  uint64_t v5;
  id result;
  _QWORD v7[6];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1ABC46784;
  v7[3] = &unk_1E5AB2248;
  v4 = (const __CFString *)a1[5];
  v5 = a1[6];
  v7[4] = a2;
  v7[5] = v5;
  result = _IMDSqlOperationGetRowsWithBindingBlock(a2, v4, (uint64_t)v7);
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40) = result;
  return result;
}

void sub_1ABC46784(uint64_t a1)
{
  IMDSqlStatementBindInt64(*(_QWORD *)(a1 + 32) + 32, *(_QWORD *)(a1 + 40));
}

id sub_1ABC46790(_QWORD *a1, uint64_t a2)
{
  const __CFString *v4;
  id result;
  _QWORD v6[7];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1ABC4680C;
  v6[3] = &unk_1E5AB6100;
  v6[4] = a1[4];
  v6[5] = a2;
  v4 = (const __CFString *)a1[6];
  v6[6] = a1[7];
  result = _IMDSqlOperationGetRowsWithBindingBlock(a2, v4, (uint64_t)v6);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) = result;
  return result;
}

void sub_1ABC4680C(uint64_t *a1)
{
  IMDSqlStatementBindTextFromCFString(a1[5] + 32, a1[4]);
  IMDSqlStatementBindInt64(a1[5] + 32, a1[6]);
}

void IMDAttachmentRecordCopyPurgedAttachmentsForChatIdentifiersOnServicesQuery(void *a1, uint64_t a2, CFTypeRef *a3)
{
  unint64_t v5;
  __CFString *Mutable;
  unint64_t v7;
  CFStringRef v8;
  CFStringRef v9;
  NSObject *v10;
  uint8_t buf[4];
  CFStringRef v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a1, "count");
  Mutable = CFStringCreateMutable(0, 0);
  CFStringAppend(Mutable, CFSTR("SELECT c.rowid FROM chat c WHERE (c.chat_identifier = ? AND c.service_name = ?)"));
  if (v5 >= 2)
  {
    v7 = v5 - 1;
    do
    {
      CFStringAppend(Mutable, CFSTR(" OR (c.chat_identifier = ? AND c.service_name = ?)"));
      --v7;
    }
    while (v7);
  }
  v8 = CFStringCreateWithFormat(0, 0, CFSTR("SELECT * FROM attachment a INNER JOIN message_attachment_join ma ON   a.ROWID = ma.attachment_id INNER JOIN chat_message_join cm ON   ma.message_id = cm.message_id INNER JOIN message m ON   ma.message_id = m.ROWID WHERE   m.cache_has_attachments   AND m.expire_state != %d   AND cm.chat_id IN (%@)   AND a.hide_attachment == 0   AND a.ck_sync_state == 1   AND a.transfer_state == 0 ORDER BY m.date DESC limit %d"), 2, Mutable, a2);
  v9 = v8;
  if (a3)
  {
    *a3 = CFRetain(v8);
    if (IMOSLoggingEnabled())
    {
      v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v12 = v9;
        _os_log_impl(&dword_1ABB60000, v10, OS_LOG_TYPE_INFO, "IMDAttachmentRecordCopyAttachmentGUIDsAndPathsForChatIdentifiersOnServicesQuery %@", buf, 0xCu);
      }
    }
  }
  CFRelease(v9);
  CFRelease(Mutable);
}

void IMDAttachmentRecordCopyPurgedAttachmentsCountForChatIdentifiersOnServicesQuery(void *a1, CFTypeRef *a2)
{
  unint64_t v3;
  __CFString *Mutable;
  unint64_t v5;
  CFStringRef v6;
  CFStringRef v7;

  v3 = objc_msgSend(a1, "count");
  Mutable = CFStringCreateMutable(0, 0);
  CFStringAppend(Mutable, CFSTR("SELECT c.rowid FROM chat c INDEXED BY chat_idx_chat_identifier_service_name WHERE (c.chat_identifier = ? AND c.service_name = ?)"));
  if (v3 >= 2)
  {
    v5 = v3 - 1;
    do
    {
      CFStringAppend(Mutable, CFSTR(" OR (c.chat_identifier = ? AND c.service_name = ?)"));
      --v5;
    }
    while (v5);
  }
  v6 = CFStringCreateWithFormat(0, 0, CFSTR("select count(*) from attachment a INDEXED BY attachment_idx_purged_attachments_v2 join (select ma.attachment_id as a_id, message_date as m_date from message_attachment_join ma INDEXED BY message_attachment_join_idx_attachment_id join (select cm.message_id as message_id, cm.message_date as message_date from message m INDEXED BY message_idx_cache_has_attachments join chat_message_join cm where m.cache_has_attachments = 1 AND cm.chat_id AND cm.chat_id IN (%@) AND m.rowid = cm.message_id) as tmp where ma.message_id = tmp.message_id) as tmp2 where a.rowid = tmp2.a_id AND a.hide_attachment == 0 AND (a.ck_sync_state == 1 OR a.ck_sync_state == 4) AND a.transfer_state == 0 ORDER BY tmp2.m_date ASC;"),
         Mutable);
  v7 = v6;
  if (a2)
    *a2 = CFRetain(v6);
  CFRelease(v7);
  CFRelease(Mutable);
}

__CFArray *IMDAttachmentRecordCopyPurgedAttachmentsForChatIdentifiersOnServices(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  const __CFArray *v9;
  CFIndex Count;
  __CFArray *Mutable;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  CFIndex v15;
  uint64_t v16;
  uint64_t v17;
  const CFArrayCallBacks *v18;
  int ID;
  const void *v20;
  const void *v21;
  NSObject *v22;
  void (*v24[5])(void);
  _QWORD v25[8];
  uint64_t v26;
  uint8_t v27[4];
  uint64_t v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  uint64_t v32;
  _BYTE buf[24];
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(a1, "count");
  v7 = objc_msgSend(a2, "count");
  if (IMOSLoggingEnabled())
  {
    v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = a1;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = a2;
      *(_WORD *)&buf[22] = 2112;
      v34 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      _os_log_impl(&dword_1ABB60000, v8, OS_LOG_TYPE_INFO, "Copy purged attachments for chat %@ services %@ limit %@", buf, 0x20u);
    }
  }
  if (v6 && v7 && v6 == v7)
  {
    if (IMDIsRunningInDatabaseServerProcess())
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v34 = 0;
      v26 = 0;
      IMDAttachmentRecordCopyPurgedAttachmentsForChatIdentifiersOnServicesQuery(a1, a3, (CFTypeRef *)&v26);
      if (v26)
      {
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = sub_1ABC46E60;
        v25[3] = &unk_1E5ABDF50;
        v25[6] = a1;
        v25[7] = a2;
        v25[4] = buf;
        v25[5] = v6;
        _IMDPerformLockedStatementBlockWithQuery(v26, (uint64_t)v25);
        v9 = *(const __CFArray **)(*(_QWORD *)&buf[8] + 24);
        if ((_DWORD)v9)
          Count = CFArrayGetCount(v9);
        else
          Count = 0;
        if (IMOSLoggingEnabled())
        {
          v13 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            v14 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", Count);
            *(_DWORD *)v27 = 138412802;
            v28 = v14;
            v29 = 2112;
            v30 = a1;
            v31 = 2112;
            v32 = v26;
            _os_log_impl(&dword_1ABB60000, v13, OS_LOG_TYPE_INFO, "%@ assets that have been purged for chat %@ outQuery %@", v27, 0x20u);
          }
        }
        if ((int)Count < 1)
        {
          Mutable = 0;
        }
        else
        {
          v15 = 0;
          Mutable = 0;
          v16 = (int)Count;
          v17 = *MEMORY[0x1E0C9AE00];
          v18 = (const CFArrayCallBacks *)MEMORY[0x1E0C9B378];
          do
          {
            CFArrayGetValueAtIndex(*(CFArrayRef *)(*(_QWORD *)&buf[8] + 24), v15);
            ID = CSDBRecordGetID();
            v20 = IMDAttachmentRecordCreateFromRecordIDUnlocked(v17, ID);
            if (!Mutable)
              Mutable = CFArrayCreateMutable(0, 0, v18);
            CFArrayAppendValue(Mutable, v20);
            if (v20)
              CFRelease(v20);
            ++v15;
          }
          while (v16 != v15);
        }
        v21 = *(const void **)(*(_QWORD *)&buf[8] + 24);
        if (v21)
          CFRelease(v21);
      }
      else
      {
        v12 = IMLogHandleForCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          sub_1ABC64058();
        Mutable = 0;
      }
    }
    else
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v34 = 0;
      v24[0] = (void (*)(void))MEMORY[0x1E0C809B0];
      v24[1] = (void (*)(void))3221225472;
      v24[2] = (void (*)(void))sub_1ABC46F00;
      v24[3] = (void (*)(void))&unk_1E5AAF630;
      v24[4] = (void (*)(void))buf;
      __syncXPCIMDAttachmentRecordCopyPurgedAttachmentsForChatIdentifiersOnServices_IPCAction(v24, (uint64_t)a1, (uint64_t)a2);
      Mutable = *(__CFArray **)(*(_QWORD *)&buf[8] + 24);
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    v22 = IMLogHandleForCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_1ABC627D8();
    return 0;
  }
  return Mutable;
}

void sub_1ABC46E38()
{
  JUMPOUT(0x1ABC46E58);
}

void sub_1ABC46E48(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1ABC46E60(uint64_t a1)
{
  unint64_t v2;
  uint64_t result;

  if (*(_QWORD *)(a1 + 40))
  {
    v2 = 0;
    do
    {
      CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 48), v2);
      CSDBSqliteBindTextFromCFString();
      CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 56), v2);
      CSDBSqliteBindTextFromCFString();
      ++v2;
    }
    while (v2 < *(_QWORD *)(a1 + 40));
  }
  result = CSDBRecordStoreProcessStatement();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void sub_1ABC46F00(uint64_t a1, xpc_object_t xdict)
{
  xpc_object_t value;
  void *v4;
  size_t count;
  size_t v6;
  size_t v7;
  const CFArrayCallBacks *v8;
  xpc_object_t v9;
  const void *v10;

  value = xpc_dictionary_get_value(xdict, "array_result");
  if (value)
  {
    v4 = value;
    count = xpc_array_get_count(value);
    if (count)
    {
      v6 = count;
      v7 = 0;
      v8 = (const CFArrayCallBacks *)MEMORY[0x1E0C9B378];
      do
      {
        if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CFArrayCreateMutable(0, 0, v8);
        v9 = xpc_array_get_value(v4, v7);
        v10 = (const void *)_IMDCopyIMDAttachmentRecordFromXPCObjectClient(v9);
        CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), v10);
        if (v10)
          CFRelease(v10);
        ++v7;
      }
      while (v6 != v7);
    }
  }
}

__CFArray *IMDAttachmentRecordCopyPurgedAttachmentsCountForChatIdentifiersOnServices(void *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  const void *v7;
  NSObject *v8;
  __CFArray *Mutable;
  const void *v10;
  NSObject *v11;
  NSObject *v12;
  void (*v14[5])(void);
  _QWORD v15[8];
  CFTypeRef cf;
  uint8_t v17[4];
  const void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  CFTypeRef v22;
  _BYTE buf[24];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a1, "count");
  v5 = objc_msgSend(a2, "count");
  if (IMOSLoggingEnabled())
  {
    v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = a1;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = a2;
      _os_log_impl(&dword_1ABB60000, v6, OS_LOG_TYPE_INFO, "Copy purged attachments count for chat %@ services %@", buf, 0x16u);
    }
  }
  if (v4 && v5 && v4 == v5)
  {
    if (IMDIsRunningInDatabaseServerProcess())
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v24 = 0;
      cf = 0;
      IMDAttachmentRecordCopyPurgedAttachmentsCountForChatIdentifiersOnServicesQuery(a1, &cf);
      if (cf)
      {
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = sub_1ABC47340;
        v15[3] = &unk_1E5ABDF50;
        v15[6] = a1;
        v15[7] = a2;
        v15[4] = buf;
        v15[5] = v4;
        _IMDPerformLockedStatementBlockWithQuery((uint64_t)cf, (uint64_t)v15);
        CFArrayGetValueAtIndex(*(CFArrayRef *)(*(_QWORD *)&buf[8] + 24), 0);
        v7 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", CSDBRecordGetID());
        if (IMOSLoggingEnabled())
        {
          v8 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v17 = 138412802;
            v18 = v7;
            v19 = 2112;
            v20 = a1;
            v21 = 2112;
            v22 = cf;
            _os_log_impl(&dword_1ABB60000, v8, OS_LOG_TYPE_INFO, "%@ assets that have been purged for chat %@ outQuery %@", v17, 0x20u);
          }
        }
        Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
        CFArrayAppendValue(Mutable, v7);
        v10 = *(const void **)(*(_QWORD *)&buf[8] + 24);
        if (v10)
          CFRelease(v10);
        if (cf)
          CFRelease(cf);
      }
      else
      {
        v11 = IMLogHandleForCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          sub_1ABC64058();
        Mutable = 0;
      }
    }
    else
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v24 = 0;
      v14[0] = (void (*)(void))MEMORY[0x1E0C809B0];
      v14[1] = (void (*)(void))3221225472;
      v14[2] = (void (*)(void))sub_1ABC473E0;
      v14[3] = (void (*)(void))&unk_1E5AAF630;
      v14[4] = (void (*)(void))buf;
      __syncXPCIMDAttachmentRecordCopyPurgedAttachmentsCountForChatIdentifiersOnServices_IPCAction(v14, (uint64_t)a1, (uint64_t)a2);
      Mutable = *(__CFArray **)(*(_QWORD *)&buf[8] + 24);
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    v12 = IMLogHandleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1ABC627D8();
    return 0;
  }
  return Mutable;
}

uint64_t sub_1ABC47340(uint64_t a1)
{
  unint64_t v2;
  uint64_t result;

  if (*(_QWORD *)(a1 + 40))
  {
    v2 = 0;
    do
    {
      CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 48), v2);
      CSDBSqliteBindTextFromCFString();
      CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 56), v2);
      CSDBSqliteBindTextFromCFString();
      ++v2;
    }
    while (v2 < *(_QWORD *)(a1 + 40));
  }
  result = CSDBRecordStoreProcessStatement();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void sub_1ABC473E0(uint64_t a1, xpc_object_t xdict)
{
  xpc_object_t value;
  void *v4;
  xpc_object_t dictionary;
  int64_t int64;

  value = xpc_dictionary_get_value(xdict, "array_result");
  if (value)
  {
    v4 = value;
    if (xpc_array_get_count(value) == 1)
    {
      dictionary = xpc_array_get_dictionary(v4, 0);
      if (dictionary)
      {
        int64 = xpc_dictionary_get_int64(dictionary, "purgedCount");
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
        CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", int64));
      }
    }
  }
}

uint64_t IMDAttachmentRecordCopyAttachmentGUIDsAndPathsForChatIdentifiersOnServices(void *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void (*v9[5])(void);
  _QWORD v10[8];
  CFTypeRef v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = objc_msgSend(a1, "count");
  v5 = objc_msgSend(a2, "count");
  if (v4 && v5 && v4 == v5)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 0;
    if (IMDIsRunningInDatabaseServerProcess())
    {
      v11 = 0;
      IMDAttachmentRecordCopyAttachmentGUIDsAndPathsForChatIdentifiersOnServicesQuery(a1, &v11);
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = sub_1ABC47614;
      v10[3] = &unk_1E5ABDF50;
      v10[6] = a1;
      v10[7] = a2;
      v10[4] = &v12;
      v10[5] = v4;
      _IMDPerformLockedStatementBlockWithQuery((uint64_t)v11, (uint64_t)v10);
      if (v11)
        CFRelease(v11);
    }
    else
    {
      v9[0] = (void (*)(void))MEMORY[0x1E0C809B0];
      v9[1] = (void (*)(void))3221225472;
      v9[2] = (void (*)(void))sub_1ABC47954;
      v9[3] = (void (*)(void))&unk_1E5AAF630;
      v9[4] = (void (*)(void))&v12;
      __syncXPCIMDAttachmentRecordCopyAttachmentGUIDsAndPathsForChatIdentifiersOnServices_IPCAction(v9, (uint64_t)a1, (uint64_t)a2);
    }
    v7 = v13[3];
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v6 = IMLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1ABC627D8();
    return 0;
  }
  return v7;
}

void sub_1ABC475F8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1ABC47614(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v6;
  const __CFAllocator *v7;
  const unsigned __int8 *v8;
  __CFString *v9;
  const unsigned __int8 *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint8_t buf[4];
  __CFString *v21;
  __int16 v22;
  __CFString *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 40))
  {
    v6 = 0;
    do
    {
      CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 48), v6);
      CSDBSqliteBindTextFromCFString();
      CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 56), v6);
      CSDBSqliteBindTextFromCFString();
      ++v6;
    }
    while (v6 < *(_QWORD *)(a1 + 40));
  }
  if (sqlite3_step(*(sqlite3_stmt **)(a4 + 8)) == 100)
  {
    v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    do
    {
      if (sqlite3_column_text(*(sqlite3_stmt **)(a4 + 8), 0))
      {
        v8 = sqlite3_column_text(*(sqlite3_stmt **)(a4 + 8), 0);
        v9 = (__CFString *)CFStringCreateWithCString(v7, (const char *)v8, 0x8000100u);
      }
      else
      {
        v9 = 0;
      }
      if (sqlite3_column_text(*(sqlite3_stmt **)(a4 + 8), 1))
      {
        v10 = sqlite3_column_text(*(sqlite3_stmt **)(a4 + 8), 1);
        v11 = (__CFString *)CFStringCreateWithCString(v7, (const char *)v10, 0x8000100u);
      }
      else
      {
        v11 = 0;
      }
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", sqlite3_column_int(*(sqlite3_stmt **)(a4 + 8), 2) != 0);
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedLong:", sqlite3_column_int64(*(sqlite3_stmt **)(a4 + 8), 3));
      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedLong:", sqlite3_column_int64(*(sqlite3_stmt **)(a4 + 8), 4));
      v15 = (void *)v14;
      if (v11 && v12 && v13 && v14)
      {
        if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithObjectsAndKeys:", v11, CFSTR("guid"), v12, CFSTR("isSticker"), v13, CFSTR("createdDate"), v15, CFSTR("transferState"), 0);
        v17 = v16;
        if (v9)
          objc_msgSend(v16, "setObject:forKey:", v9, CFSTR("path"));
        CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), v17);

      }
      else
      {
        v18 = IMLogHandleForCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138413314;
          v21 = v9;
          v22 = 2112;
          v23 = v11;
          v24 = 2112;
          v25 = v12;
          v26 = 2112;
          v27 = v13;
          v28 = 2112;
          v29 = v15;
          _os_log_error_impl(&dword_1ABB60000, v18, OS_LOG_TYPE_ERROR, "Skipping an attachment because of incomplete data filename %@ guid %@ isSticker %@ createdDate %@ transferState %@", buf, 0x34u);
        }
      }

    }
    while (sqlite3_step(*(sqlite3_stmt **)(a4 + 8)) == 100);
  }
  return CSDBSqliteStatementReset();
}

void sub_1ABC47954(uint64_t a1, xpc_object_t xdict)
{
  size_t v3;
  xpc_object_t v4;
  const char *string;
  char *v6;
  _BOOL8 v7;
  int64_t int64;
  int64_t v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  size_t count;
  xpc_object_t value;

  value = xpc_dictionary_get_value(xdict, "array_result");
  if (value)
  {
    count = xpc_array_get_count(value);
    if (count)
    {
      v3 = 0;
      v17 = a1;
      do
      {
        if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
        v4 = xpc_array_get_value(value, v3);
        string = xpc_dictionary_get_string(v4, "guid");
        v6 = (char *)xpc_dictionary_get_string(v4, "path");
        v7 = xpc_dictionary_get_BOOL(v4, "isSticker");
        int64 = xpc_dictionary_get_int64(v4, "createdDate");
        v9 = xpc_dictionary_get_int64(v4, "transferState");
        if (string)
        {
          v10 = v9;
          v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", string);
          if (v6)
            v6 = (char *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v6);
          v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", v7);
          v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", (double)int64);
          v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", v10);
          v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithObjectsAndKeys:", v11, CFSTR("guid"), v6, CFSTR("path"), v12, CFSTR("isSticker"), v13, CFSTR("createdDate"), v14, CFSTR("transferState"), 0);
          v16 = v15;
          if (v6)
            objc_msgSend(v15, "setObject:forKey:", v6, CFSTR("path"));
          a1 = v17;
          if (v16)
            CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)(*(_QWORD *)(v17 + 32) + 8) + 24), v16);

        }
        ++v3;
      }
      while (count != v3);
    }
  }
}

void IMDAttachmentRecordDeleteAttachmentForGUID(CFStringRef theString)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[5];

  if (theString && CFStringGetLength(theString))
  {
    if ((IMDIsRunningInDatabaseServerProcess() & 1) != 0)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = sub_1ABC47C64;
      v9[3] = &unk_1E5AB2308;
      v9[4] = theString;
      _IMDPerformLockedStatementBlockWithQuery((uint64_t)CFSTR("DELETE FROM attachment WHERE guid = ?;"), (uint64_t)v9);
    }
    else
    {
      __syncXPCIMDAttachmentRecordDeleteAttachmentForGUID_IPCAction(0, (uint64_t)theString);
    }
  }
  else
  {
    v2 = IMLogHandleForCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      sub_1ABC64084((uint64_t)theString, v2, v3, v4, v5, v6, v7, v8);
  }
}

uint64_t sub_1ABC47C64()
{
  CSDBSqliteBindTextFromCFString();
  CSDBSqliteStatementPerform();
  CSDBRecordSaveStore();
  return CSDBRecordStoreInvalidateCachesWithStore();
}

uint64_t IMDAttachmentRecordAddAttachment(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[6];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = sub_1ABC47D48;
  v3[3] = &unk_1E5AB1FA8;
  v3[4] = &v4;
  v3[5] = a1;
  _IMDPerformLockedMessageStoreBlock((uint64_t)v3);
  v1 = *((unsigned __int8 *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1ABC47D30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1ABC47D48(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(result + 40))
  {
    v1 = result;
    CSDBRecordStoreAddRecord();
    result = CSDBRecordSaveStore();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 32) + 8) + 24) = result;
  }
  return result;
}

uint64_t IMDAttachmentRecordUpdateAttachmentGUIDWithGUID(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  id RowsForQueryWithBindingBlock;
  id v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  BOOL v14;
  NSObject *v15;
  const __CFString *v16;
  NSObject *v17;
  void (*v19[5])(void);
  _QWORD v20[7];
  _QWORD v21[5];
  uint64_t v22;
  _QWORD v23[2];
  BOOL (*v24)(uint64_t);
  void *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  void *v30;
  _BYTE v31[176];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  uint8_t buf[4];
  uint64_t v37;
  uint64_t v38;

  v2 = 0;
  v38 = *MEMORY[0x1E0C80C00];
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  if (a1 && a2)
  {
    if (IMDIsRunningInDatabaseServerProcess())
    {
      v27 = 0;
      v28 = &v27;
      v29 = 0xD010000000;
      v30 = &unk_1ABCCF005;
      memset(v31, 0, sizeof(v31));
      IMDSqlOperationInitWithSharedCSDBDatabase((uint64_t)v31);
      IMDSqlOperationBeginTransaction(v28 + 4);
      v5 = MEMORY[0x1E0C809B0];
      v22 = 0;
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v24 = sub_1ABC48204;
      v25 = &unk_1E5AB0C88;
      v26 = &v27;
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = sub_1ABC48250;
      v21[3] = &unk_1E5ABFB08;
      v21[4] = a1;
      RowsForQueryWithBindingBlock = _IMDSqlOperationGetRowsForQueryWithBindingBlock(CFSTR("SELECT ROWID FROM attachment WHERE guid = ? LIMIT 1;"),
                                       &v22,
                                       (uint64_t)v21);
      v7 = RowsForQueryWithBindingBlock;
      if (v22)
      {
        if (!IMOSLoggingEnabled())
          goto LABEL_25;
        v8 = OSLogHandleForIMFoundationCategory();
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
          goto LABEL_25;
        *(_DWORD *)buf = 138412290;
        v37 = v22;
        v9 = "IMDAttachmentRecordUpdateAttachmentGUIDWithGUID - kIMDAttachmentRecordGetAttachmentRowIDForGUID returned error %@";
        v10 = v8;
        v11 = 12;
LABEL_8:
        _os_log_impl(&dword_1ABB60000, v10, OS_LOG_TYPE_INFO, v9, buf, v11);
LABEL_25:
        v24((uint64_t)v23);
        v2 = *((unsigned __int8 *)v33 + 24);
        _Block_object_dispose(&v27, 8);
        goto LABEL_26;
      }
      if (!objc_msgSend(RowsForQueryWithBindingBlock, "count"))
      {
        if (!IMOSLoggingEnabled())
          goto LABEL_25;
        v17 = OSLogHandleForIMFoundationCategory();
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          goto LABEL_25;
        *(_WORD *)buf = 0;
        v9 = "IMDAttachmentRecordUpdateAttachmentGUIDWithGUID - kIMDAttachmentRecordGetAttachmentRowIDForGUID returned zero results";
        v10 = v17;
        v11 = 2;
        goto LABEL_8;
      }
      v12 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(RowsForQueryWithBindingBlock, "firstObject"), "objectForKey:", CFSTR("ROWID")), "integerValue");
      if (IMOSLoggingEnabled())
      {
        v13 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          v37 = v12;
          _os_log_impl(&dword_1ABB60000, v13, OS_LOG_TYPE_INFO, "Updating GUID for attachment at rowID %lld", buf, 0xCu);
        }
      }
      v20[0] = v5;
      v20[1] = 3221225472;
      v20[2] = sub_1ABC48260;
      v20[3] = &unk_1E5ABFBF8;
      v20[4] = &v27;
      v20[5] = a2;
      v20[6] = v12;
      v14 = IMDSqlOperationExecuteQuery((uint64_t)(v28 + 4), CFSTR("UPDATE attachment set guid = ? WHERE ROWID = ?;"),
              (uint64_t)v20);
      *((_BYTE *)v33 + 24) = v14;
      if (IMOSLoggingEnabled())
      {
        v15 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          if (*((_BYTE *)v33 + 24))
            v16 = CFSTR("YES");
          else
            v16 = CFSTR("NO");
          *(_DWORD *)buf = 138412290;
          v37 = (uint64_t)v16;
          _os_log_impl(&dword_1ABB60000, v15, OS_LOG_TYPE_INFO, "kIMDAttachmentRecordUpdateAttachmentGUIDWithGUID Success: %@", buf, 0xCu);
        }
      }
      v24((uint64_t)v23);
      _Block_object_dispose(&v27, 8);
    }
    else
    {
      v19[0] = (void (*)(void))MEMORY[0x1E0C809B0];
      v19[1] = (void (*)(void))3221225472;
      v19[2] = (void (*)(void))sub_1ABC4829C;
      v19[3] = (void (*)(void))&unk_1E5AAF630;
      v19[4] = (void (*)(void))&v32;
      __syncXPCIMDAttachmentRecordUpdateAttachmentGUIDWithGUID_IPCAction(v19, a1, a2);
    }
    v2 = *((unsigned __int8 *)v33 + 24);
  }
LABEL_26:
  _Block_object_dispose(&v32, 8);
  return v2;
}

void sub_1ABC481CC()
{
  JUMPOUT(0x1ABC481E4);
}

BOOL sub_1ABC48204(uint64_t a1)
{
  IMDSqlOperationFinishQuery(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32);
  IMDSqlOperationCommitOrRevertTransaction((_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32));
  return IMDSqlOperationRelease(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32, 0);
}

void sub_1ABC48250(uint64_t a1, uint64_t a2)
{
  IMDSqlStatementBindTextFromCFString(a2 + 32, *(_QWORD *)(a1 + 32));
}

void sub_1ABC48260(_QWORD *a1)
{
  IMDSqlStatementBindTextFromCFString(*(_QWORD *)(a1[4] + 8) + 64, a1[5]);
  IMDSqlStatementBindInt64(*(_QWORD *)(a1[4] + 8) + 64, a1[6]);
}

BOOL sub_1ABC4829C(uint64_t a1, xpc_object_t xdict)
{
  _BOOL8 result;

  result = xpc_dictionary_get_BOOL(xdict, "BOOL_result");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t IMDAttachmentCopyGUIDsAfterRowWithLimit(void *a1, sqlite3_int64 a2)
{
  NSObject *v4;
  const __CFString *v5;
  __CFDictionary *Row;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v19[5])(void);
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  _DWORD buf[8];
  _OWORD v28[9];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  v22 = &v21;
  v23 = 0x3052000000;
  v24 = sub_1ABC3F98C;
  v25 = sub_1ABC3F99C;
  v26 = 0;
  v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (IMDIsRunningInDatabaseServerProcess())
  {
    if (IMOSLoggingEnabled())
    {
      v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        buf[0] = 138412546;
        *(_QWORD *)&buf[1] = a1;
        LOWORD(buf[3]) = 2048;
        *(_QWORD *)((char *)&buf[3] + 2) = a2;
        _os_log_impl(&dword_1ABB60000, v4, OS_LOG_TYPE_INFO, "IMDAttachmentCopyGUIDsAfterRowWithLimit is in IMDP afterRow %@ with limit %lld", (uint8_t *)buf, 0x16u);
      }
    }
    memset(v28, 0, sizeof(v28));
    memset(buf, 0, sizeof(buf));
    IMDSqlOperationInitWithSharedCSDBDatabase((uint64_t)buf);
    if (a1)
      v5 = CFSTR(" select ROWID, guid, maj.rowid is null as is_orphaned from attachment left join message_attachment_join maj on attachment.ROWID=maj.attachment_id WHERE ROWID > ? ORDER BY ROWID limit ?;");
    else
      v5 = CFSTR(" select ROWID, guid, maj.rowid is null as is_orphaned from attachment left join message_attachment_join maj on attachment.ROWID=maj.attachment_id ORDER BY ROWID limit ?;");
    _IMDSqlOperationBeginQuery((uint64_t)buf, v5);
    if (a1)
      IMDSqlStatementBindInt64((uint64_t)v28, objc_msgSend(a1, "longLongValue"));
    IMDSqlStatementBindInt64((uint64_t)v28, a2);
    while (IMDSqlOperationHasRows((uint64_t)buf))
    {
      Row = IMDSqlStatementGetRow((sqlite3_stmt **)v28);
      if (Row)
        objc_msgSend((id)v22[5], "addObject:", Row);

    }
    IMDSqlOperationFinishQuery((uint64_t)buf);
    v20 = 0;
    IMDSqlOperationRelease((uint64_t)buf, &v20);
    if (v20)
    {
      v10 = IMLogHandleForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_1ABC640E8((uint64_t)&v20, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        buf[0] = 138412546;
        *(_QWORD *)&buf[1] = a1;
        LOWORD(buf[3]) = 2048;
        *(_QWORD *)((char *)&buf[3] + 2) = a2;
        _os_log_impl(&dword_1ABB60000, v7, OS_LOG_TYPE_INFO, "IMDAttachmentCopyGUIDsAfterRowWithLimit is in imagent afterRow %@ with limit %lld", (uint8_t *)buf, 0x16u);
      }
    }
    v19[0] = (void (*)(void))MEMORY[0x1E0C809B0];
    v19[1] = (void (*)(void))3221225472;
    v19[2] = (void (*)(void))sub_1ABC48688;
    v19[3] = (void (*)(void))&unk_1E5AAF630;
    v19[4] = (void (*)(void))&v21;
    __syncXPCIMDAttachmentRecordCopyAttachmentGUIDs_IPCAction(v19, a1, a2);
    if (IMOSLoggingEnabled())
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = objc_msgSend((id)v22[5], "count");
        buf[0] = 134217984;
        *(_QWORD *)&buf[1] = v9;
        _os_log_impl(&dword_1ABB60000, v8, OS_LOG_TYPE_INFO, "Returned from DB call after loading attachments to delete messages count %lu", (uint8_t *)buf, 0xCu);
      }
    }
  }
  v17 = v22[5];
  _Block_object_dispose(&v21, 8);
  return v17;
}

void sub_1ABC485FC(_Unwind_Exception *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  if (a2 == 1)
  {
    objc_begin_catch(exc_buf);
    objc_end_catch();
    JUMPOUT(0x1ABC485B4);
  }
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(exc_buf);
}

xpc_object_t sub_1ABC48688(uint64_t a1, xpc_object_t xdict)
{
  xpc_object_t result;
  _QWORD applier[5];

  result = xpc_dictionary_get_value(xdict, "array_result");
  if (result)
  {
    applier[0] = MEMORY[0x1E0C809B0];
    applier[1] = 3221225472;
    applier[2] = sub_1ABC48700;
    applier[3] = &unk_1E5AAF608;
    applier[4] = *(_QWORD *)(a1 + 32);
    return (xpc_object_t)xpc_array_apply(result, applier);
  }
  return result;
}

uint64_t sub_1ABC48700(uint64_t a1, int a2, xpc_object_t xdict)
{
  int64_t int64;
  uint64_t v6;
  _BOOL8 v7;
  void *v8;
  uint64_t v9;

  int64 = xpc_dictionary_get_int64(xdict, "ROWID");
  v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", xpc_dictionary_get_string(xdict, "guid"), 4);
  v7 = xpc_dictionary_get_BOOL(xdict, "is_orphaned");
  v8 = (void *)MEMORY[0x1E0C99D80];
  v9 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", int64);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", objc_msgSend(v8, "dictionaryWithObjectsAndKeys:", v6, CFSTR("guid"), v9, CFSTR("ROWID"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7), CFSTR("is_orphaned"), 0));
  return 1;
}

uint64_t IMDAttachmentCopyRecordIDsToDeleteAfterRowWithLimit(void *a1, sqlite3_int64 a2)
{
  NSObject *v4;
  const __CFString *v5;
  __CFDictionary *Row;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v19[5])(void);
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  _DWORD buf[8];
  _OWORD v28[9];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  v22 = &v21;
  v23 = 0x3052000000;
  v24 = sub_1ABC3F98C;
  v25 = sub_1ABC3F99C;
  v26 = 0;
  v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (IMDIsRunningInDatabaseServerProcess())
  {
    if (IMOSLoggingEnabled())
    {
      v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        buf[0] = 138412546;
        *(_QWORD *)&buf[1] = a1;
        LOWORD(buf[3]) = 2048;
        *(_QWORD *)((char *)&buf[3] + 2) = a2;
        _os_log_impl(&dword_1ABB60000, v4, OS_LOG_TYPE_INFO, "IMDAttachmentCopyRecordIDsToDeleteAfterRowWithLimit is in IMDP with afterRow %@ limit %lld", (uint8_t *)buf, 0x16u);
      }
    }
    memset(v28, 0, sizeof(v28));
    memset(buf, 0, sizeof(buf));
    IMDSqlOperationInitWithSharedCSDBDatabase((uint64_t)buf);
    if (a1)
      v5 = CFSTR(" select * from sync_deleted_attachments where LENGTH(TRIM(recordID)) > 0 AND ROWID > ? ORDER BY ROWID LIMIT ?;");
    else
      v5 = CFSTR(" select * from sync_deleted_attachments where LENGTH(TRIM(recordID)) > 0 ORDER BY ROWID LIMIT ?;");
    _IMDSqlOperationBeginQuery((uint64_t)buf, v5);
    if (a1)
      IMDSqlStatementBindInt64((uint64_t)v28, objc_msgSend(a1, "longLongValue"));
    IMDSqlStatementBindInt64((uint64_t)v28, a2);
    while (IMDSqlOperationHasRows((uint64_t)buf))
    {
      Row = IMDSqlStatementGetRow((sqlite3_stmt **)v28);
      if (Row)
        objc_msgSend((id)v22[5], "addObject:", Row);

    }
    IMDSqlOperationFinishQuery((uint64_t)buf);
    v20 = 0;
    IMDSqlOperationRelease((uint64_t)buf, &v20);
    if (v20)
    {
      v10 = IMLogHandleForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_1ABC64150((uint64_t)&v20, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        buf[0] = 138412546;
        *(_QWORD *)&buf[1] = a1;
        LOWORD(buf[3]) = 2048;
        *(_QWORD *)((char *)&buf[3] + 2) = a2;
        _os_log_impl(&dword_1ABB60000, v7, OS_LOG_TYPE_INFO, "IMDAttachmentCopyRecordIDsToDeleteAfterRowWithLimit is in imagent afterRow %@ with limit %lld", (uint8_t *)buf, 0x16u);
      }
    }
    v19[0] = (void (*)(void))MEMORY[0x1E0C809B0];
    v19[1] = (void (*)(void))3221225472;
    v19[2] = (void (*)(void))sub_1ABC48BAC;
    v19[3] = (void (*)(void))&unk_1E5AAF630;
    v19[4] = (void (*)(void))&v21;
    __syncXPCIMDAttachmentRecordCopyAttachmentsToDeleteFromCloudKit_IPCAction(v19, a1, a2);
    if (IMOSLoggingEnabled())
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = objc_msgSend((id)v22[5], "count");
        buf[0] = 134217984;
        *(_QWORD *)&buf[1] = v9;
        _os_log_impl(&dword_1ABB60000, v8, OS_LOG_TYPE_INFO, "Returned from DB call after loading attachments to delete messages count %lu", (uint8_t *)buf, 0xCu);
      }
    }
  }
  v17 = v22[5];
  _Block_object_dispose(&v21, 8);
  return v17;
}

void sub_1ABC48B20(_Unwind_Exception *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  if (a2 == 1)
  {
    objc_begin_catch(exc_buf);
    objc_end_catch();
    JUMPOUT(0x1ABC48AD8);
  }
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(exc_buf);
}

xpc_object_t sub_1ABC48BAC(uint64_t a1, xpc_object_t xdict)
{
  xpc_object_t result;
  _QWORD applier[5];

  result = xpc_dictionary_get_value(xdict, "array_result");
  if (result)
  {
    applier[0] = MEMORY[0x1E0C809B0];
    applier[1] = 3221225472;
    applier[2] = sub_1ABC48C24;
    applier[3] = &unk_1E5AAF608;
    applier[4] = *(_QWORD *)(a1 + 32);
    return (xpc_object_t)xpc_array_apply(result, applier);
  }
  return result;
}

uint64_t sub_1ABC48C24(uint64_t a1, int a2, xpc_object_t xdict)
{
  int64_t int64;
  uint64_t v6;

  int64 = xpc_dictionary_get_int64(xdict, "ROWID");
  v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", xpc_dictionary_get_string(xdict, "guid"), 4);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v6, CFSTR("guid"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", xpc_dictionary_get_string(xdict, "recordID"), 4), CFSTR("recordID"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", int64), CFSTR("ROWID"), 0));
  return 1;
}

__CFString *sub_1ABC48D24(uint64_t a1)
{
  __CFString *Mutable;
  uint64_t v3;

  if (a1 < 1)
    return 0;
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  CFStringAppend(Mutable, CFSTR("DELETE FROM sync_deleted_attachments WHERE (recordID = ?"));
  v3 = a1 - 1;
  if (a1 != 1)
  {
    do
    {
      CFStringAppend(Mutable, CFSTR(" OR recordID = ?"));
      --v3;
    }
    while (v3);
  }
  CFStringAppend(Mutable, CFSTR(")"));
  return Mutable;
}

void IMDAttachmentRecordDeleteTombStonedAttachmentsWithRecordIDs(const __CFArray *a1)
{
  CFIndex Count;
  __CFString *v3;
  NSObject *v4;
  const char *v5;
  _QWORD v6[6];
  uint8_t buf[16];

  if (a1 && CFArrayGetCount(a1))
  {
    if (IMDIsRunningInDatabaseServerProcess())
    {
      Count = CFArrayGetCount(a1);
      v3 = sub_1ABC48D24(Count);
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = sub_1ABC48EF8;
      v6[3] = &unk_1E5ABE408;
      v6[4] = v3;
      v6[5] = a1;
      IMDRunSqlOperation((uint64_t)v6);
      CFRelease(v3);
      return;
    }
    __syncXPCIMDAttachmentRecordDeleteTombStonedAttachmentsForRecordIDs_IPCAction(0, (uint64_t)a1);
    if (IMOSLoggingEnabled())
    {
      v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v5 = "Returned from DB call after deleting RecordIDs from Tombstone table";
        goto LABEL_11;
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v5 = "IMDAttachmentRecordDeleteTombStonedAttachmentsWithRecordIDs has no GUIDs to delete.";
LABEL_11:
      _os_log_impl(&dword_1ABB60000, v4, OS_LOG_TYPE_INFO, v5, buf, 2u);
    }
  }
}

BOOL sub_1ABC48EF8(uint64_t a1, uint64_t a2)
{
  const __CFString *v3;
  uint64_t v4;
  _QWORD v6[6];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1ABC48F5C;
  v6[3] = &unk_1E5AB2248;
  v3 = *(const __CFString **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6[4] = a2;
  v6[5] = v4;
  return _IMDSqlOperationRunQuery(a2, v3, (uint64_t)v6, 0);
}

void sub_1ABC48F5C(uint64_t a1)
{
  IMDSqlStatementBindTextFromArrayOfCFStrings(*(_QWORD *)(a1 + 32) + 32, *(CFArrayRef *)(a1 + 40));
}

void IMDAttachmentRecordClearDeleteTombStones()
{
  NSObject *v0;
  NSObject *v1;
  _OWORD v2[11];

  if (IMDIsRunningInDatabaseServerProcess())
  {
    if (IMOSLoggingEnabled())
    {
      v0 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
      {
        LOWORD(v2[0]) = 0;
        _os_log_impl(&dword_1ABB60000, v0, OS_LOG_TYPE_INFO, "IMDAttachmentRecordClearDeleteTombStones", (uint8_t *)v2, 2u);
      }
    }
    memset(v2, 0, sizeof(v2));
    IMDSqlOperationInitWithSharedCSDBDatabase((uint64_t)v2);
    IMDSqlOperationExecuteQuery((uint64_t)v2, CFSTR("delete from sync_deleted_attachments;"), (uint64_t)&unk_1E5ABFC40);
    IMDSqlOperationRelease((uint64_t)v2, 0);
  }
  else
  {
    __syncXPCMDAttachmentRecordDeleteTombStonedAttachmentsToDeleteFromCloudKit_IPCAction(0);
    if (IMOSLoggingEnabled())
    {
      v1 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
      {
        LOWORD(v2[0]) = 0;
        _os_log_impl(&dword_1ABB60000, v1, OS_LOG_TYPE_INFO, "Returned from DB call after clearing all tombstones", (uint8_t *)v2, 2u);
      }
    }
  }
}

void sub_1ABC490B0()
{
  NSObject *v0;
  uint8_t v1[16];

  if (IMOSLoggingEnabled())
  {
    v0 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v1 = 0;
      _os_log_impl(&dword_1ABB60000, v0, OS_LOG_TYPE_INFO, "IMDAttachmentRecordClearDeleteTombStones deleted pending sync table", v1, 2u);
    }
  }
}

void IMDAttachmentMarkAllFailedAttachmentsAsNeedingSync()
{
  NSObject *v0;
  NSObject *v1;
  uint64_t v2;
  uint8_t buf[16];
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t v14[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    v0 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1ABB60000, v0, OS_LOG_TYPE_INFO, "Request to markAllUnsuccessFullySyncedAttachmentsAsNeedingSync ", buf, 2u);
    }
  }
  if (IMDIsRunningInDatabaseServerProcess())
  {
    v12 = 0u;
    v13 = 0u;
    v11 = 0u;
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    v5 = 0u;
    v6 = 0u;
    *(_OWORD *)buf = 0u;
    v4 = 0u;
    IMDSqlOperationInitWithSharedCSDBDatabase((uint64_t)buf);
    IMDSqlOperationExecuteQuery((uint64_t)buf, CFSTR("UPDATE attachment SET ck_sync_state=0 where ck_sync_state in (2,3,5) OR (ck_sync_state==1 AND guid not like \"at_%\");"),
      (uint64_t)&unk_1E5ABFC60);
    v2 = 0;
    IMDSqlOperationRelease((uint64_t)buf, &v2);
    if (v2 && IMOSLoggingEnabled())
    {
      v1 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v14 = 138412290;
        v15 = v2;
        _os_log_impl(&dword_1ABB60000, v1, OS_LOG_TYPE_INFO, "Error executing markAllFailedAttachmentsAsNeedingSync %@ ", v14, 0xCu);
      }
    }
  }
  else
  {
    __syncXPCIMDAttachmentRecordMarkFailedAttachmentsAsNeedingSync_IPCAction(0);
  }
}

void sub_1ABC492D0()
{
  NSObject *v0;
  uint8_t v1[16];

  if (IMOSLoggingEnabled())
  {
    v0 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v1 = 0;
      _os_log_impl(&dword_1ABB60000, v0, OS_LOG_TYPE_INFO, "Executed query to mark all unsuccessfuly synced attachments as needing sync", v1, 2u);
    }
  }
}

uint64_t sub_1ABC4935C(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = objc_msgSend(*(id *)(a1 + 32), "fileExistsAtPath:", a2);
  if ((_DWORD)result)
  {
    v5 = 0;
    result = objc_msgSend(*(id *)(a1 + 32), "attributesOfItemAtPath:error:", a2, &v5);
    if (result)
    {
      result = objc_msgSend((id)result, "fileSize");
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += result;
    }
  }
  return result;
}

void _IMDSMSRecordStoreCustomFunctionBeforeDeleteAttachment(sqlite3_context *a1, int a2, sqlite3_value **a3)
{
  int v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  const unsigned __int8 *v16;
  _QWORD v17[5];
  int v18;

  v6 = dword_1EEC40698++;
  if (v6 >= 1)
  {
    v7 = IMLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1ABC641B8(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  if (a2 == 2)
  {
    v15 = sqlite3_value_int(*a3);
    v16 = sqlite3_value_text(a3[1]);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = sub_1ABC494CC;
    v17[3] = &unk_1E5ABDE48;
    v17[4] = v16;
    v18 = v15;
    IMDPersistencePerformBlock(v17, 1);
    sqlite3_result_int(a1, 0);
  }
  else
  {
    sqlite3_result_error(a1, "_IMDSMSRecordStoreCustomFunctionDeleteAttachment: wrong number of arguments", -1);
  }
  --dword_1EEC40698;
}

void sub_1ABC494CC(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  const void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  _QWORD v25[7];
  _QWORD v26[5];
  _QWORD v27[6];
  uint64_t v28;
  const void *v29;
  CFTypeRef v30;
  _QWORD v31[5];
  int v32;
  uint8_t v33[4];
  void *v34;
  uint8_t buf[8];
  uint8_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *(_QWORD *)(a1 + 32));
  if (objc_msgSend(v2, "length"))
  {
    v3 = IMLogHandleForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = *(_DWORD *)(a1 + 40);
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v4;
      _os_log_impl(&dword_1ABB60000, v3, OS_LOG_TYPE_INFO, "TRIGGER: Before deleting attachment, finding messageRowID for attachment rowID %d", buf, 8u);
    }
    *(_QWORD *)buf = 0;
    v36 = buf;
    v37 = 0x2020000000;
    v38 = 0;
    v5 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = sub_1ABC49AA8;
    v31[3] = &unk_1E5AC0050;
    v32 = *(_DWORD *)(a1 + 40);
    v31[4] = buf;
    _IMDPerformLockedStatementBlockWithQuery((uint64_t)CFSTR("SELECT message_id FROM message_attachment_join WHERE attachment_id = ? LIMIT 1"), (uint64_t)v31);
    v6 = IMLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (void *)*((_QWORD *)v36 + 3);
      *(_DWORD *)v33 = 134217984;
      v34 = v7;
      _os_log_impl(&dword_1ABB60000, v6, OS_LOG_TYPE_INFO, "TRIGGER: Before deleting attachment, message row id: %lli", v33, 0xCu);
    }
    v8 = IMDMessageRecordCopyMessageForRowID(*((_QWORD *)v36 + 3));
    v9 = (void *)v8;
    if (v8)
    {
      v29 = 0;
      v30 = 0;
      v28 = 0;
      IMDMessageRecordBulkCopy(v8, 0, 0, 0, &v29, 0, 0, 0, 0, 0, &v30, 0, 0, 0, 0, 0, 0, 0, 0,
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
        0,
        0,
        0,
        0,
        &v28,
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
        0,
        0,
        0,
        0,
        0);
      v10 = IMLogHandleForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v33 = 138412290;
        v34 = v9;
        _os_log_impl(&dword_1ABB60000, v10, OS_LOG_TYPE_INFO, "TRIGGER: Before deleting attachment, messageRecord: %@", v33, 0xCu);
      }
      v11 = v29;
      if (v30 && v29)
      {
        v12 = (void *)JWDecodeCodableObjectWithStandardAllowlist();
        v13 = IMLogHandleForCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v33 = 138412290;
          v34 = v2;
          _os_log_impl(&dword_1ABB60000, v13, OS_LOG_TYPE_INFO, "TRIGGER: Before deleting attachment, we found attachment guid: %@", v33, 0xCu);
        }
        v14 = (void *)objc_msgSend(v12, "mutableCopy");
        v15 = objc_msgSend(v14, "length");
        v16 = *MEMORY[0x1E0D366B8];
        v27[0] = v5;
        v27[1] = 3221225472;
        v27[2] = sub_1ABC49AF0;
        v27[3] = &unk_1E5AC0078;
        v27[4] = v14;
        v27[5] = v2;
        objc_msgSend(v14, "enumerateAttribute:inRange:options:usingBlock:", v16, 0, v15, 0, v27);
        v17 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithMessageSummaryInfoData:", v28);
        v18 = (void *)objc_msgSend(v17, "objectForKey:", *MEMORY[0x1E0D383A0]);
        if (objc_msgSend(v14, "length") || objc_msgSend(v18, "count"))
        {
          v19 = JWEncodeCodableObject();
          v20 = objc_msgSend(v14, "string");
          if (v19)
          {
            if (v20)
            {
              v25[0] = v5;
              v25[1] = 3221225472;
              v25[2] = sub_1ABC49CF8;
              v25[3] = &unk_1E5AC00C8;
              v25[4] = v20;
              v25[5] = v29;
              v25[6] = v19;
              _IMDPerformLockedStatementBlockWithQuery((uint64_t)CFSTR("UPDATE message set attributedBody = ?, text = ? where guid = ?"), (uint64_t)v25);
              v21 = IMLogHandleForCategory();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)v33 = 0;
                _os_log_impl(&dword_1ABB60000, v21, OS_LOG_TYPE_INFO, "TRIGGER: Before deleting attachment, updated attributedBody and text", v33, 2u);
              }
            }
          }
        }
        else
        {
          v23 = IMLogHandleForCategory();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v33 = 0;
            _os_log_impl(&dword_1ABB60000, v23, OS_LOG_TYPE_INFO, "TRIGGER: Before deleting attachment,deleted messages for guid", v33, 2u);
          }
          v26[0] = v5;
          v26[1] = 3221225472;
          v26[2] = sub_1ABC49C2C;
          v26[3] = &unk_1E5AC00A0;
          v26[4] = v29;
          IMDPersistencePerformBlock(v26, 0);
        }
        v11 = v29;
      }
      if (v11)
      {
        CFRelease(v11);
        v29 = 0;
      }
      if (v30)
      {
        CFRelease(v30);
        v30 = 0;
      }
      CFRelease(v9);
    }
    else
    {
      v22 = IMLogHandleForCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v33 = 0;
        _os_log_impl(&dword_1ABB60000, v22, OS_LOG_TYPE_INFO, "TRIGGER: Before deleting attachment, no message record found", v33, 2u);
      }
    }
    _Block_object_dispose(buf, 8);
  }
  v24 = IMLogHandleForCategory();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1ABB60000, v24, OS_LOG_TYPE_INFO, "TRIGGER: Before deleting attachment, all done!", buf, 2u);
  }
}

void sub_1ABC49A50(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1ABC49AA8(uint64_t a1)
{
  uint64_t result;

  CSDBSqliteBindInt();
  result = CSDBSqliteStatementInteger64Result();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = (int)result;
  return result;
}

void sub_1ABC49AF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend(*(id *)(a1 + 32), "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D36430], a3, 0);
  v8 = IMLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v10 = 138412290;
    v11 = v7;
    _os_log_impl(&dword_1ABB60000, v8, OS_LOG_TYPE_INFO, "TRIGGER: Before deleting attachment, guid in message part: %@", (uint8_t *)&v10, 0xCu);
  }
  if (objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(*(id *)(a1 + 32), "deleteCharactersInRange:", a3, a4);
    v9 = IMLogHandleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1ABB60000, v9, OS_LOG_TYPE_INFO, "TRIGGER: Before deleting attachment, was equal, deleting range", (uint8_t *)&v10, 2u);
    }
  }
}

void sub_1ABC49C2C(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  const __CFArray *v4;
  uint8_t buf[4];
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = IMLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1ABB60000, v2, OS_LOG_TYPE_INFO, "TRIGGER: deferred deletion of messageGUID: %@", buf, 0xCu);
  }
  v4 = (const __CFArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", *(_QWORD *)(a1 + 32), 0);
  IMDMessageRecordDeleteMessagesForGUIDs(v4, 0);

}

uint64_t sub_1ABC49CF8()
{
  CSDBSqliteBindBlobFromCFData();
  CSDBSqliteBindTextFromCFString();
  CSDBSqliteBindTextFromCFString();
  return CSDBSqliteStatementPerform();
}

void _IMDSMSRecordStoreCustomFunctionDeleteAttachment(sqlite3_context *a1, int a2, sqlite3_value **a3)
{
  const unsigned __int8 *v4;
  const unsigned __int8 *v5;
  void *v6;
  void *v7;
  id v8;
  int v9;
  NSObject *v10;
  const __CFString *v11;
  NSObject *v12;
  int v13;
  id v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  NSObject *v18;
  _BOOL4 v19;
  NSObject *v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  const __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (a2 == 1)
  {
    v4 = sqlite3_value_text(*a3);
    if (v4)
    {
      v5 = v4;
      v6 = (void *)MEMORY[0x1AF435474]();
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v5);
      v8 = (id)objc_msgSend(v7, "stringByResolvingAndStandardizingPath");
      v9 = IMSharedHelperPathIsInStickerCache();
      v10 = IMLogHandleForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = CFSTR("NO");
        if (v9)
          v11 = CFSTR("YES");
        v21 = 138412546;
        v22 = (uint64_t)v8;
        v23 = 2112;
        v24 = v11;
        _os_log_impl(&dword_1ABB60000, v10, OS_LOG_TYPE_INFO, "TRIGGER: Deleting attachment files based on path: %@, pathIsInStickerCache %@", (uint8_t *)&v21, 0x16u);
      }
      if (((objc_msgSend(v8, "isAbsolutePath") ^ 1 | v9) & 1) != 0)
      {
        v12 = IMLogHandleForCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          v21 = 138412290;
          v22 = (uint64_t)v8;
          _os_log_impl(&dword_1ABB60000, v12, OS_LOG_TYPE_INFO, "Did not delete attachment at path %@", (uint8_t *)&v21, 0xCu);
        }
        v13 = 0;
      }
      else
      {
        v14 = objc_alloc_init(MEMORY[0x1E0CB3620]);
        v15 = (void *)objc_msgSend(v8, "stringByDeletingLastPathComponent");
        if (v8)
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v8, 0);
        v16 = IMPreviewCachesDirectoryWithAttachmentURL();
        v17 = objc_msgSend((id)objc_msgSend(v15, "lastPathComponent"), "length");
        v18 = IMLogHandleForCategory();
        v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
        if (v17 < 0x24)
        {
          if (v19)
          {
            v21 = 138412290;
            v22 = (uint64_t)v8;
            _os_log_impl(&dword_1ABB60000, v18, OS_LOG_TYPE_INFO, "Just deleting the original path: %@", (uint8_t *)&v21, 0xCu);
          }
          v13 = objc_msgSend(v14, "removeItemAtPath:error:", v8, 0);
        }
        else
        {
          if (v19)
          {
            v21 = 138412290;
            v22 = (uint64_t)v15;
            _os_log_impl(&dword_1ABB60000, v18, OS_LOG_TYPE_INFO, "Deleting this guid directory too: %@", (uint8_t *)&v21, 0xCu);
          }
          v13 = objc_msgSend(v14, "removeItemAtPath:error:", v15, 0);
          if (v16)
          {
            objc_msgSend(v14, "removeItemAtURL:error:", v16, 0);
            v20 = IMLogHandleForCategory();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              v21 = 138412290;
              v22 = v16;
              _os_log_impl(&dword_1ABB60000, v20, OS_LOG_TYPE_INFO, "Deleting this caches guid directory too: %@", (uint8_t *)&v21, 0xCu);
            }
          }
        }

      }
      objc_autoreleasePoolPop(v6);
    }
    else
    {
      v13 = 0;
    }
    sqlite3_result_int(a1, v13);
  }
  else
  {
    sqlite3_result_error(a1, "_IMDSMSRecordStoreCustomFunctionDeleteAttachment: wrong number of arguments", -1);
  }
}

void _IMDSMSRecordStoreCustomFunctionAfterDeleteMessagePlugin(sqlite3_context *a1, int a2, uint64_t a3)
{
  __objc2_prot_list **p_prots;
  int v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const unsigned __int8 *v16;
  const unsigned __int8 *v17;
  uint64_t v18;
  id v19;
  uint64_t i;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  void *context;
  uint64_t v25;
  uint8_t buf[4];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  p_prots = &OBJC_PROTOCOL___IMDKeyValueQueries.prots;
  v7 = dword_1EEC4069C++;
  if (v7 >= 1)
  {
    v8 = IMLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1ABC641B8(v8, v9, v10, v11, v12, v13, v14, v15);
  }
  if (a2 == 2)
  {
    v16 = sqlite3_value_text(*(sqlite3_value **)(a3 + 8));
    if (v16)
    {
      v17 = v16;
      context = (void *)MEMORY[0x1AF435474]();
      v18 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v17);
      v19 = objc_alloc_init(MEMORY[0x1E0CB3620]);
      for (i = 0; i != 3; ++i)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%d"), v18, i);
        v21 = IMPluginSnapshotCachesFileURL();
        v22 = IMLogHandleForCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v27 = v21;
          _os_log_impl(&dword_1ABB60000, v22, OS_LOG_TYPE_INFO, "TRIGGER: Deleting plugin snapshot at path: %@", buf, 0xCu);
        }
        v25 = 0;
        if ((objc_msgSend(v19, "removeItemAtURL:error:", v21, &v25) & 1) == 0)
        {
          v23 = IMLogHandleForCategory();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v27 = v25;
            _os_log_impl(&dword_1ABB60000, v23, OS_LOG_TYPE_INFO, "Failure to delete file at path with error: %@", buf, 0xCu);
          }
        }
      }

      objc_autoreleasePoolPop(context);
      p_prots = (__objc2_prot_list **)(&OBJC_PROTOCOL___IMDKeyValueQueries + 16);
    }
  }
  else
  {
    sqlite3_result_error(a1, "_IMDSMSRecordStoreCustomFunctionAfterDeleteMessagePlugin: wrong number of arguments", -1);
  }
  --*((_DWORD *)p_prots + 423);
}

void _IMDSMSRecordStoreCustomFunctionTrim(sqlite3_context *a1, int a2, sqlite3_value **a3)
{
  const unsigned __int8 *v4;
  const unsigned __int8 *v5;
  void *v6;
  const char *v7;

  if (a2 == 1)
  {
    if (a3)
    {
      v4 = sqlite3_value_text(*a3);
      if (v4)
      {
        v5 = v4;
        v6 = (void *)MEMORY[0x1AF435474]();
        sqlite3_result_text(a1, (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5), "trimmedString"), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
        objc_autoreleasePoolPop(v6);
        return;
      }
      v7 = "_IMDSMSRecordStoreCustomFunctionTrim: SQLite text of value[0] was NULL.";
    }
    else
    {
      v7 = "_IMDSMSRecordStoreCustomFunctionTrim: sqlite3_value was NULL.";
    }
  }
  else
  {
    v7 = "_IMDSMSRecordStoreCustomFunctionTrim: wrong number of arguments";
  }
  sqlite3_result_error(a1, v7, -1);
}

uint64_t IMDPersistenceCheckNotDatabaseThread()
{
  NSObject *v0;
  NSObject *v1;
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v12[16];
  uint8_t v13[16];
  uint8_t buf[16];

  if (byte_1ED0D3AC0)
  {
    IMDSharedThreadedRecordStore();
    if (CSDBThreadedRecordStoreOwnsCurrentThread())
    {
      if (IMOSLoggingEnabled())
      {
        v0 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1ABB60000, v0, OS_LOG_TYPE_INFO, "**************************************************************************", buf, 2u);
        }
      }
      if (IMOSLoggingEnabled())
      {
        v1 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v13 = 0;
          _os_log_impl(&dword_1ABB60000, v1, OS_LOG_TYPE_INFO, "***** Non-database work on the database thread, please file a radar ******", v13, 2u);
        }
      }
      if (IMOSLoggingEnabled())
      {
        v2 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v12 = 0;
          _os_log_impl(&dword_1ABB60000, v2, OS_LOG_TYPE_INFO, "**************************************************************************", v12, 2u);
        }
      }
      if (qword_1EEC406A8 != -1)
        dispatch_once(&qword_1EEC406A8, &unk_1E5AAEA40);
      v3 = qword_1EEC406B0;
      if (os_log_type_enabled((os_log_t)qword_1EEC406B0, OS_LOG_TYPE_FAULT))
        sub_1ABC641EC(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  return 1;
}

uint64_t sub_1ABC4AAA8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t _IMDContactStore()
{
  if (qword_1ED0D3750 != -1)
    dispatch_once(&qword_1ED0D3750, &unk_1E5AAF3C8);
  return qword_1ED0D3758;
}

id sub_1ABC4AAF4()
{
  id result;

  result = objc_alloc_init(MEMORY[0x1E0C97298]);
  qword_1ED0D3758 = (uint64_t)result;
  return result;
}

void *IMDGenerateInClauseForCount(int a1)
{
  void *v2;
  int v3;
  const __CFString *v4;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("IN ("));
  if (a1 >= 1)
  {
    v3 = 0;
    do
    {
      if (v3 >= a1 - 1)
        v4 = CFSTR("?) ");
      else
        v4 = CFSTR("?, ");
      objc_msgSend(v2, "appendFormat:", v4);
      ++v3;
    }
    while (a1 != v3);
  }
  return v2;
}

uint64_t IMDPersistenceSubmitEvent(void *a1)
{
  uint64_t result;
  NSObject *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(a1, "length");
  if (result)
  {
    if (IMOSLoggingEnabled())
    {
      v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        v4 = 138412290;
        v5 = a1;
        _os_log_impl(&dword_1ABB60000, v3, OS_LOG_TYPE_INFO, "Submitting persistence event: %@", (uint8_t *)&v4, 0xCu);
      }
    }
    return IMSubmitSimpleAggegateMetric();
  }
  return result;
}

uint64_t IMDSetIsRunningInDatabaseServerProcess(uint64_t result)
{
  byte_1ED0D3AC0 = result;
  return result;
}

void *IMDDBRecordGetAllColumnNames(uint64_t *a1, int a2)
{
  uint64_t v2;
  void *v4;
  uint64_t v5;

  LODWORD(v2) = a2;
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a2 + 1);
  objc_msgSend(v4, "addObject:", CFSTR("ROWID"));
  if ((int)v2 >= 1)
  {
    v2 = v2;
    do
    {
      v5 = *a1;
      a1 += 5;
      objc_msgSend(v4, "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5));
      --v2;
    }
    while (v2);
  }
  return v4;
}

const __CFString *_IMDGetUserDefaultsDomainForSavedDeviceInfo()
{
  if (qword_1EEC406A0)
    return (const __CFString *)qword_1EEC406A0;
  else
    return CFSTR("com.apple.imdsmsrecordstore");
}

void _IMDSetUserDefaultsDomainForSavedDeviceInfo(void *a1)
{
  NSObject *v2;
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (qword_1EEC406A0)
  {

    qword_1EEC406A0 = 0;
  }
  if (a1)
    qword_1EEC406A0 = a1;
  v2 = IMLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = (const __CFString *)qword_1EEC406A0;
    if (!qword_1EEC406A0)
      v3 = CFSTR("com.apple.imdsmsrecordstore");
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_1ABB60000, v2, OS_LOG_TYPE_INFO, "Set device state test user defaults domain to: %@", (uint8_t *)&v4, 0xCu);
  }
}

void *_IMDGetSavedDeviceState()
{
  const __CFString *v0;
  void *v1;
  void *v2;
  id v3;

  if (qword_1EEC406A0)
    v0 = (const __CFString *)qword_1EEC406A0;
  else
    v0 = CFSTR("com.apple.imdsmsrecordstore");
  v1 = (void *)CFPreferencesCopyValue(CFSTR("IMDSavedDeviceState"), v0, CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
  v2 = v1;
  if (v1)
    v3 = v1;
  return v2;
}

id _IMDSetAllPropertiesOnDeviceStateIfNeeded(void *a1)
{
  id v1;

  v1 = (id)objc_msgSend(a1, "mutableCopy");
  if (!v1)
    v1 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  if (!objc_msgSend(v1, "objectForKey:", CFSTR("IMDSavedDeviceStateDidUpgradeKey")))
    objc_msgSend(v1, "setObject:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("IMDSavedDeviceStateDidUpgradeKey"));
  if (!objc_msgSend(v1, "objectForKey:", CFSTR("IMDSavedDeviceStateDidRestoreFromBackupKey")))
    objc_msgSend(v1, "setObject:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("IMDSavedDeviceStateDidRestoreFromBackupKey"));
  if (!objc_msgSend(v1, "objectForKey:", CFSTR("IMDSavedDeviceStateDidMigrateFromDifferentDeviceKey")))
    objc_msgSend(v1, "setObject:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("IMDSavedDeviceStateDidMigrateFromDifferentDeviceKey"));
  if (!objc_msgSend(v1, "objectForKey:", CFSTR("IMDSavedDeviceStateDidRestoreFromCloudBackupKey")))
    objc_msgSend(v1, "setObject:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("IMDSavedDeviceStateDidRestoreFromCloudBackupKey"));
  if (!objc_msgSend(v1, "objectForKey:", CFSTR("IMDSavedDeviceStateDidMigrateKey")))
    objc_msgSend(v1, "setObject:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("IMDSavedDeviceStateDidMigrateKey"));
  if (!objc_msgSend(v1, "objectForKey:", CFSTR("IMDSavedDeviceStateBuildVersionKey")))
    objc_msgSend(v1, "setObject:forKey:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "operatingSystemVersionString"), CFSTR("IMDSavedDeviceStateBuildVersionKey"));
  if (!objc_msgSend(v1, "objectForKey:", CFSTR("IMDSavedDeviceStateIsMigratingKey")))
    objc_msgSend(v1, "setObject:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("IMDSavedDeviceStateIsMigratingKey"));
  if (!objc_msgSend(v1, "objectForKey:", CFSTR("IMDSavedDeviceStateDateKey")))
    objc_msgSend(v1, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D68], "date"), CFSTR("IMDSavedDeviceStateDateKey"));
  return v1;
}

void _IMDSetSavedDeviceState(void *a1)
{
  id v1;
  const __CFString *v2;
  const __CFString *v3;
  const __CFString *v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a1)
    v1 = _IMDSetAllPropertiesOnDeviceStateIfNeeded(a1);
  else
    v1 = 0;
  if (qword_1EEC406A0)
    v2 = (const __CFString *)qword_1EEC406A0;
  else
    v2 = CFSTR("com.apple.imdsmsrecordstore");
  v3 = (const __CFString *)*MEMORY[0x1E0C9B230];
  CFPreferencesSetValue(CFSTR("IMDSavedDeviceState"), v1, v2, CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
  if (qword_1EEC406A0)
    v4 = (const __CFString *)qword_1EEC406A0;
  else
    v4 = CFSTR("com.apple.imdsmsrecordstore");
  CFPreferencesSynchronize(v4, CFSTR("mobile"), v3);
  v5 = IMLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 138412290;
    v7 = objc_msgSend(v1, "description");
    _os_log_impl(&dword_1ABB60000, v5, OS_LOG_TYPE_INFO, "Saved device state: %@", (uint8_t *)&v6, 0xCu);
  }
}

id IMDReadDeviceState()
{
  void *v0;
  id v1;
  NSObject *v2;
  _BOOL4 v3;
  const char *v4;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v0 = _IMDGetSavedDeviceState();
  v1 = _IMDSetAllPropertiesOnDeviceStateIfNeeded(v0);
  v2 = IMLogHandleForCategory();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_INFO);
  if (v0)
  {
    if (v3)
    {
      v6 = 138412290;
      v7 = objc_msgSend(v1, "description");
      v4 = "Read stored device state: %@";
LABEL_6:
      _os_log_impl(&dword_1ABB60000, v2, OS_LOG_TYPE_INFO, v4, (uint8_t *)&v6, 0xCu);
    }
  }
  else if (v3)
  {
    v6 = 138412290;
    v7 = objc_msgSend(v1, "description");
    v4 = "Device state not set, return default version: %@";
    goto LABEL_6;
  }
  return v1;
}

void IMSaveDeviceState(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD v11[6];
  _QWORD v12[7];

  v12[6] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("IMDSavedDeviceStateDidUpgradeKey");
  v12[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a1);
  v11[1] = CFSTR("IMDSavedDeviceStateDidRestoreFromBackupKey");
  v12[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
  v11[2] = CFSTR("IMDSavedDeviceStateDidMigrateFromDifferentDeviceKey");
  v12[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v11[3] = CFSTR("IMDSavedDeviceStateDidRestoreFromCloudBackupKey");
  v12[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a4);
  v11[4] = CFSTR("IMDSavedDeviceStateDidMigrateKey");
  v12[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a5);
  v11[5] = CFSTR("IMDSavedDeviceStateIsMigratingKey");
  v12[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a6);
  _IMDSetSavedDeviceState((void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 6));
}

os_log_t sub_1ABC4B34C()
{
  os_log_t result;

  result = os_log_create("com.apple.runtime-issues", "Messages");
  qword_1EEC406B0 = (uint64_t)result;
  return result;
}

dispatch_queue_t sub_1ABC4B378()
{
  NSObject *v0;
  dispatch_queue_t result;

  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  result = dispatch_queue_create("_IMDPersistenceClientQueue", v0);
  qword_1EEC406B8 = (uint64_t)result;
  return result;
}

void sub_1ABC4B3AC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void sub_1ABC4B4A0()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void (*v4)(void *);
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void (*v10)(void *);
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void (*v16)(void *);
  NSObject *v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (qword_1ED0D38A8 != -1)
    dispatch_once(&qword_1ED0D38A8, &unk_1E5AAF3E8);
  if (!qword_1ED0D38C0)
  {
    v0 = (void *)MEMORY[0x1E0CB3940];
    v1 = IMFileLocationTrimFileName();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "stringWithFormat:", CFSTR("Unexpected nil '%@' in %s at %s:%d. %@"), CFSTR("kIMContactsContactEmailAddressesKey"), "void _IMDContactsApiInit(void)", v1, 71, v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = (void (*)(void *))IMGetAssertionFailureHandler();
    if (v4)
    {
      v4(v3);
    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v3;
        _os_log_impl(&dword_1ABB60000, v5, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", buf, 0xCu);
      }

    }
  }
  if (!qword_1ED0D38D0)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = IMFileLocationTrimFileName();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("Unexpected nil '%@' in %s at %s:%d. %@"), CFSTR("kIMContactsContactPhoneNumbersKey"), "void _IMDContactsApiInit(void)", v7, 72, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void (*)(void *))IMGetAssertionFailureHandler();
    if (v10)
    {
      v10(v9);
    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v9;
        _os_log_impl(&dword_1ABB60000, v11, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", buf, 0xCu);
      }

    }
  }
  if (!qword_1ED0D38C8)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = IMFileLocationTrimFileName();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("Unexpected nil '%@' in %s at %s:%d. %@"), CFSTR("kIMContactsContactInstantMessageAddressesKey"), "void _IMDContactsApiInit(void)", v13, 73, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void (*)(void *))IMGetAssertionFailureHandler();
    if (v16)
    {
      v16(v15);
    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v15;
        _os_log_impl(&dword_1ABB60000, v17, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", buf, 0xCu);
      }

    }
  }
}

void sub_1ABC4C610(_Unwind_Exception *exc_buf, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(exc_buf);
    objc_end_catch();
    JUMPOUT(0x1ABC4C5FCLL);
  }
  objc_end_catch();
  _Unwind_Resume(exc_buf);
}

uint64_t sub_1ABC4C650(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1ABC4C660(uint64_t a1)
{

}

void sub_1ABC4C668(_QWORD *a1)
{
  void *v2;
  id v3;

  +[IMDContactCache sharedInstance](IMDContactCache, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cacheContactsFromFetchResults:forAliases:", a1[4], a1[5]);

  +[IMDContactCache sharedInstance](IMDContactCache, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCurrentHistoryToken:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));

}

uint64_t sub_1ABC4CF9C()
{
  void **v0;
  void *v1;
  void **v2;
  void *v3;
  void **v4;
  void *v5;
  uint64_t result;

  if (!qword_1ED0D38C0)
  {
    v0 = (void **)MEMORY[0x1AF435000]("CNContactEmailAddressesKey", CFSTR("Contacts"));
    if (v0)
      v1 = *v0;
    else
      v1 = 0;
    objc_storeStrong((id *)&qword_1ED0D38C0, v1);
  }
  if (!qword_1ED0D38D0)
  {
    v2 = (void **)MEMORY[0x1AF435000]("CNContactPhoneNumbersKey", CFSTR("Contacts"));
    if (v2)
      v3 = *v2;
    else
      v3 = 0;
    objc_storeStrong((id *)&qword_1ED0D38D0, v3);
  }
  if (!qword_1ED0D38C8)
  {
    v4 = (void **)MEMORY[0x1AF435000]("CNContactInstantMessageAddressesKey", CFSTR("Contacts"));
    if (v4)
      v5 = *v4;
    else
      v5 = 0;
    objc_storeStrong((id *)&qword_1ED0D38C8, v5);
  }
  qword_1ED0D3890 = MEMORY[0x1AF434FF4](CFSTR("CNContactStore"), CFSTR("Contacts"));
  qword_1ED0D3878 = MEMORY[0x1AF434FF4](CFSTR("CNContact"), CFSTR("Contacts"));
  qword_1ED0D38A0 = MEMORY[0x1AF434FF4](CFSTR("CNPhoneNumber"), CFSTR("Contacts"));
  qword_1ED0D3888 = MEMORY[0x1AF434FF4](CFSTR("CNContactFormatter"), CFSTR("Contacts"));
  qword_1ED0D3880 = MEMORY[0x1AF434FF4](CFSTR("CNContactFetchRequest"), CFSTR("Contacts"));
  qword_1ED0D3870 = MEMORY[0x1AF434FF4](CFSTR("CNChangeHistoryFetchRequest"), CFSTR("Contacts"));
  result = MEMORY[0x1AF434FF4](CFSTR("CNFavorites"), CFSTR("Contacts"));
  qword_1ED0D3898 = result;
  return result;
}

void sub_1ABC4D384(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1ABC4D3AC(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1ABC4D3BC(uint64_t a1)
{

}

void sub_1ABC4D3C4(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

const __CFString *sub_1ABC4D464(unint64_t a1)
{
  if (a1 > 0xF8)
    return CFSTR("Unknown");
  else
    return off_1E5AC0220[a1];
}

uint64_t sub_1ABC4D66C(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_msgSend(a1, sel_selectAllColumns);
  sub_1ABC64450();

  swift_bridgeObjectRetain();
  sub_1ABC64474();
  swift_bridgeObjectRelease();
  v2 = sub_1ABC64444();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_1ABC4D744(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t result;

  if (a3 < 0)
  {
    result = sub_1ABC645B8();
    __break(1u);
  }
  else
  {
    if (a3)
    {
      v6 = (_QWORD *)sub_1ABC644C8();
      v7 = v6;
      v6[2] = a3;
      v6[4] = a1;
      v6[5] = a2;
      if (a3 != 1)
      {
        v6[6] = a1;
        v6[7] = a2;
        v8 = a3 - 2;
        if (v8)
        {
          v9 = v6 + 9;
          do
          {
            *(v9 - 1) = a1;
            *v9 = a2;
            swift_bridgeObjectRetain();
            v9 += 2;
            --v8;
          }
          while (v8);
        }
        swift_bridgeObjectRetain();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      return MEMORY[0x1E0DEE9D8];
    }
    return (uint64_t)v7;
  }
  return result;
}

uint64_t sub_1ABC4D91C(uint64_t a1)
{
  id v2;
  uint64_t v3;

  v2 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_copyChatGUIDsWithUnreadMessagesQuery);
  v3 = sub_1ABC64450();

  if ((a1 & 0x8000000000000000) == 0)
  {
    sub_1ABC64474();
    sub_1ABC645E8();
    sub_1ABC64474();
    swift_bridgeObjectRelease();
  }
  return v3;
}

IMDChatQueryStrings __swiftcall IMDChatQueryStrings.init()()
{
  return (IMDChatQueryStrings)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

id IMDChatQueryStrings.init()()
{
  objc_super v1;

  v1.super_class = (Class)IMDChatQueryStrings;
  return objc_msgSendSuper2(&v1, sel_init);
}

unint64_t type metadata accessor for IMDChatQueryStrings()
{
  unint64_t result;

  result = qword_1EEC3FD48;
  if (!qword_1EEC3FD48)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EEC3FD48);
  }
  return result;
}

uint64_t sub_1ABC4DADC(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1AF435AF8]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_1ABC4DB1C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EEC3F868;
  if (!qword_1EEC3F868)
  {
    v1 = sub_1ABC4DB68(&qword_1EEC3F810);
    result = MEMORY[0x1AF435B10](MEMORY[0x1E0DEAF20], v1);
    atomic_store(result, (unint64_t *)&qword_1EEC3F868);
  }
  return result;
}

uint64_t sub_1ABC4DB68(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1AF435B04](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_1ABC4DBAC()
{
  uint64_t v0;

  v0 = sub_1ABC64378();
  sub_1ABC4E740(v0, qword_1EEC40110);
  sub_1ABC4E6D8(v0, (uint64_t)qword_1EEC40110);
  sub_1ABC64354();
  return sub_1ABC6436C();
}

void sub_1ABC4DC14()
{
  uint64_t v0;
  id v1;

  v1 = objc_msgSend((id)objc_opt_self(), sel_serviceListener);
  objc_msgSend(v1, sel_setDelegate_, v0);
  objc_msgSend(v1, sel_resume);

}

id MessagesPersistenceServiceListener.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id MessagesPersistenceServiceListener.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MessagesPersistenceServiceListener();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for MessagesPersistenceServiceListener()
{
  return objc_opt_self();
}

id MessagesPersistenceServiceListener.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MessagesPersistenceServiceListener();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

Swift::Bool __swiftcall MessagesPersistenceServiceListener.listener(_:shouldAcceptNewConnection:)(NSXPCListener _, NSXPCConnection shouldAcceptNewConnection)
{
  return sub_1ABC4E3F8(shouldAcceptNewConnection.super.isa);
}

uint64_t MessagesPersistenceServiceListener.unlockedProxyForConnection(_:)()
{
  id v0;
  void *v1;
  _QWORD aBlock[6];

  v0 = objc_allocWithZone(MEMORY[0x1E0D398B0]);
  aBlock[4] = sub_1ABC4DF08;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1ABC4E330;
  aBlock[3] = &unk_1E5AAF488;
  v1 = _Block_copy(aBlock);
  objc_msgSend(v0, sel_initWithProtocol_forwardingHandler_, &unk_1EEC4A8D0, v1);
  _Block_release(v1);
  swift_release();
  return swift_dynamicCastObjCProtocolUnconditional();
}

void sub_1ABC4DF08(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  NSString *v11;
  uint64_t v12;
  const char *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  void *v18;
  uint64_t v19;
  uint64_t aBlock[6];

  if (qword_1EEC3FCC0 != -1)
    swift_once();
  v6 = sub_1ABC64378();
  sub_1ABC4E6D8(v6, (uint64_t)qword_1EEC40110);
  v7 = sub_1ABC64360();
  v8 = sub_1ABC644EC();
  if (os_log_type_enabled(v7, v8))
  {
    v19 = a2;
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    aBlock[0] = v10;
    *(_DWORD *)v9 = 136315138;
    v11 = NSStringFromSelector(a1);
    v12 = sub_1ABC64450();
    v13 = a1;
    v15 = v14;

    v16 = v12;
    a2 = v19;
    sub_1ABC4F460(v16, v15, aBlock);
    sub_1ABC64558();
    a1 = v13;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1ABB60000, v7, v8, "Receiving message in persistence %s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AF435B7C](v10, -1, -1);
    MEMORY[0x1AF435B7C](v9, -1, -1);
  }

  v17 = (_QWORD *)swift_allocObject();
  v17[2] = a1;
  v17[3] = a2;
  v17[4] = a3;
  aBlock[4] = (uint64_t)sub_1ABC4E714;
  aBlock[5] = (uint64_t)v17;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_1ABC50A18;
  aBlock[3] = (uint64_t)&unk_1E5AC0B40;
  v18 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  IMDPersistencePerformBlock(v18, 1);
  _Block_release(v18);
}

uint64_t sub_1ABC4E144(const char *a1, void (*a2)(_QWORD))
{
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  NSString *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint8_t *v13;
  id v14;
  void (*v16)(_QWORD);
  uint64_t v17[4];

  if (qword_1EEC3FCC0 != -1)
    swift_once();
  v4 = sub_1ABC64378();
  sub_1ABC4E6D8(v4, (uint64_t)qword_1EEC40110);
  v5 = sub_1ABC64360();
  v6 = sub_1ABC644E0();
  if (os_log_type_enabled(v5, v6))
  {
    v16 = a2;
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v17[0] = v8;
    *(_DWORD *)v7 = 136315138;
    v9 = NSStringFromSelector(a1);
    v10 = sub_1ABC64450();
    v12 = v11;

    sub_1ABC4F460(v10, v12, v17);
    sub_1ABC64558();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1ABB60000, v5, v6, "Processing message for persistence %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AF435B7C](v8, -1, -1);
    v13 = v7;
    a2 = v16;
    MEMORY[0x1AF435B7C](v13, -1, -1);
  }

  v14 = objc_msgSend((id)objc_opt_self(), sel_synchronousDatabase);
  v17[3] = swift_getObjectType();
  v17[0] = (uint64_t)v14;
  a2(v17);
  return sub_1ABC4E720((uint64_t)v17);
}

uint64_t sub_1ABC4E330(uint64_t a1, uint64_t a2, void *aBlock)
{
  void (*v4)(uint64_t, uint64_t (*)(_QWORD *), uint64_t);
  void *v5;
  uint64_t v6;

  v4 = *(void (**)(uint64_t, uint64_t (*)(_QWORD *), uint64_t))(a1 + 32);
  v5 = _Block_copy(aBlock);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v5;
  swift_retain();
  v4(a2, sub_1ABC4E6AC, v6);
  swift_release();
  return swift_release();
}

uint64_t sub_1ABC4E3B0(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;

  sub_1ABC4E6B4(a1, a1[3]);
  v3 = sub_1ABC645F4();
  (*(void (**)(uint64_t, uint64_t))(a2 + 16))(a2, v3);
  return swift_unknownObjectRelease();
}

uint64_t sub_1ABC4E3F8(void *a1)
{
  uint64_t v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD aBlock[6];

  if (qword_1EEC3FCC0 != -1)
    swift_once();
  v2 = sub_1ABC64378();
  sub_1ABC4E6D8(v2, (uint64_t)qword_1EEC40110);
  v3 = a1;
  v4 = sub_1ABC64360();
  v5 = sub_1ABC644E0();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v6 = 67109120;
    LODWORD(aBlock[0]) = objc_msgSend(v3, sel_processIdentifier);
    sub_1ABC64558();

    _os_log_impl(&dword_1ABB60000, v4, v5, "Accepting connection from PID %d", v6, 8u);
    MEMORY[0x1AF435B7C](v6, -1, -1);

  }
  else
  {

  }
  v7 = objc_allocWithZone(MEMORY[0x1E0D398B0]);
  aBlock[4] = sub_1ABC4DF08;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1ABC4E330;
  aBlock[3] = &unk_1E5AAEBA0;
  v8 = _Block_copy(aBlock);
  v9 = objc_msgSend(v7, sel_initWithProtocol_forwardingHandler_, &unk_1EEC4A8D0, v8);
  _Block_release(v8);
  swift_release();
  objc_msgSend(v3, sel_setExportedObject_, swift_dynamicCastObjCProtocolUnconditional());

  v10 = objc_msgSend((id)objc_opt_self(), sel_interfaceWithProtocol_, &unk_1EEC4A8D0);
  objc_msgSend(v3, sel_setExportedInterface_, v10);

  objc_msgSend(v3, sel_resume);
  return 1;
}

uint64_t sub_1ABC4E648(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1ABC4E658()
{
  return swift_release();
}

uint64_t method lookup function for MessagesPersistenceServiceListener()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MessagesPersistenceServiceListener.resume()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x50))();
}

uint64_t sub_1ABC4E688()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_1ABC4E6AC(_QWORD *a1)
{
  uint64_t v1;

  return sub_1ABC4E3B0(a1, *(_QWORD *)(v1 + 16));
}

_QWORD *sub_1ABC4E6B4(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_1ABC4E6D8(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_1ABC4E6F0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1ABC4E714()
{
  uint64_t v0;

  return sub_1ABC4E144(*(const char **)(v0 + 16), *(void (**)(_QWORD))(v0 + 24));
}

uint64_t sub_1ABC4E720(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t *sub_1ABC4E740(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_1ABC4E790()
{
  uint64_t v0;

  v0 = sub_1ABC64378();
  sub_1ABC4E740(v0, qword_1EEC40190);
  sub_1ABC4E6D8(v0, (uint64_t)qword_1EEC40190);
  sub_1ABC64354();
  return sub_1ABC6436C();
}

id AskToParser.__allocating_init(url:)(uint64_t a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return AskToParser.init(url:)(a1);
}

id AskToParser.init(url:)(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  BOOL v18;
  objc_class *v19;
  uint8_t *v20;
  uint64_t (*v21)(uint64_t);
  id v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t ObjectType;
  uint64_t v28;
  objc_super v29;

  v2 = v1;
  ObjectType = swift_getObjectType();
  v4 = sub_1ABC64414();
  v25 = *(_QWORD *)(v4 - 8);
  v26 = v4;
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1ABC4DADC(&qword_1EEC401A8);
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1ABC642D0();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v24 - v12;
  v14 = v2;
  sub_1ABC64408();
  sub_1ABC4EDDC(a1, (uint64_t)&v14[OBJC_IVAR___IMDAskToParser_url]);
  sub_1ABC4EDDC(a1, (uint64_t)v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_1ABC4EE24((uint64_t)v8);
    if (qword_1EEC3FCC8 != -1)
      swift_once();
    v15 = sub_1ABC64378();
    sub_1ABC4E6D8(v15, (uint64_t)qword_1EEC40190);
    v16 = sub_1ABC64360();
    v17 = sub_1ABC644F8();
    v18 = os_log_type_enabled(v16, v17);
    v19 = (objc_class *)ObjectType;
    if (v18)
    {
      v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_1ABB60000, v16, v17, "Provided payload URL was nil", v20, 2u);
      MEMORY[0x1AF435B7C](v20, -1, -1);
    }

    *(_QWORD *)&v14[OBJC_IVAR___IMDAskToParser_payload] = 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v13, v8, v9);
    sub_1ABC64408();
    sub_1ABC6442C();
    v21 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CFE270];
    sub_1ABC4FAA0(&qword_1EEC401B8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CFE270], MEMORY[0x1E0CFE288]);
    sub_1ABC4FAA0(&qword_1EEC401C0, v21, MEMORY[0x1E0CFE280]);
    sub_1ABC643F0();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v6, v26);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
    *(_QWORD *)&v14[OBJC_IVAR___IMDAskToParser_payload] = v28;

    v19 = (objc_class *)ObjectType;
  }
  v29.receiver = v14;
  v29.super_class = v19;
  v22 = objc_msgSendSuper2(&v29, sel_init, v24);
  sub_1ABC4EE24(a1);
  return v22;
}

uint64_t sub_1ABC4EDDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1ABC4DADC(&qword_1EEC401A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1ABC4EE24(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1ABC4DADC(&qword_1EEC401A8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t AskToParser.isValid.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char v8;
  uint64_t v10;

  v1 = sub_1ABC4DADC(&qword_1EEC401A8);
  MEMORY[0x1E0C80A78](v1);
  v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1ABC642D0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1ABC4EDDC(v0 + OBJC_IVAR___IMDAskToParser_url, (uint64_t)v3);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_1ABC4EE24((uint64_t)v3);
    v8 = 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v3, v4);
    v8 = sub_1ABC643FC();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  return v8 & 1;
}

uint64_t AskToParser.notificationText.getter()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  if (!*(_QWORD *)(v0 + OBJC_IVAR___IMDAskToParser_payload))
    return 0;
  v1 = (void *)sub_1ABC64420();
  v2 = sub_1ABC64384();

  return v2;
}

uint64_t AskToParser.summary.getter()
{
  return sub_1ABC4F2F4(MEMORY[0x1E0CFE230]);
}

id sub_1ABC4F26C(char *a1, uint64_t a2, void (*a3)(void))
{
  char *v4;
  void *v5;
  void *v6;

  if (*(_QWORD *)&a1[OBJC_IVAR___IMDAskToParser_payload])
  {
    v4 = a1;
    v5 = (void *)sub_1ABC64420();
    a3();

    v6 = (void *)sub_1ABC64444();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

uint64_t AskToParser.questionIdentifier.getter()
{
  return sub_1ABC4F2F4(MEMORY[0x1E0CFE218]);
}

uint64_t sub_1ABC4F2F4(uint64_t (*a1)(void))
{
  uint64_t v1;
  void *v3;
  uint64_t v4;

  if (!*(_QWORD *)(v1 + OBJC_IVAR___IMDAskToParser_payload))
    return 0;
  v3 = (void *)sub_1ABC64420();
  v4 = a1();

  return v4;
}

id AskToParser.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void AskToParser.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id AskToParser.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1ABC4F460(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_1ABC4F530(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1ABC4FC1C((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x1E0DEC2B8];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_1ABC4FC1C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_1ABC4E720((uint64_t)v12);
  return v7;
}

uint64_t sub_1ABC4F530(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_1ABC64564();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_1ABC4F6E8(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = sub_1ABC645AC();
  if (!v8)
  {
    sub_1ABC645B8();
    __break(1u);
LABEL_17:
    result = sub_1ABC645DC();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_1ABC4F6E8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_1ABC4F77C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1ABC4F954(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_1ABC4F954(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1ABC4F77C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_1ABC4F8F0(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_1ABC64588();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_1ABC645B8();
      __break(1u);
LABEL_10:
      v2 = sub_1ABC64480();
      if (!v2)
        return MEMORY[0x1E0DEE9D8];
    }
    sub_1ABC645DC();
    __break(1u);
LABEL_14:
    result = sub_1ABC645B8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E0DEE9D8];
  }
  return result;
}

_QWORD *sub_1ABC4F8F0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  sub_1ABC4DADC(&qword_1EEC3F900);
  v4 = (_QWORD *)swift_allocObject();
  v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1ABC4F954(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    sub_1ABC4DADC(&qword_1EEC3F900);
    v10 = (char *)swift_allocObject();
    v11 = j__malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_1ABC645DC();
  __break(1u);
  return result;
}

uint64_t sub_1ABC4FAA0(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x1AF435B10](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1ABC4FAE0()
{
  return type metadata accessor for AskToParser();
}

uint64_t type metadata accessor for AskToParser()
{
  uint64_t result;

  result = qword_1EEC401D8;
  if (!qword_1EEC401D8)
    return swift_getSingletonMetadata();
  return result;
}

void sub_1ABC4FB24()
{
  unint64_t v0;
  unint64_t v1;

  sub_1ABC64414();
  if (v0 <= 0x3F)
  {
    sub_1ABC4FBC8();
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for AskToParser()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AskToParser.__allocating_init(url:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

void sub_1ABC4FBC8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EEC401E8)
  {
    sub_1ABC642D0();
    v0 = sub_1ABC6454C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EEC401E8);
  }
}

uint64_t sub_1ABC4FC1C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1ABC4FC5C()
{
  uint64_t v0;

  v0 = sub_1ABC64378();
  sub_1ABC4E740(v0, qword_1EEC401F0);
  sub_1ABC4E6D8(v0, (uint64_t)qword_1EEC401F0);
  sub_1ABC64354();
  return sub_1ABC6436C();
}

id sub_1ABC4FCC4()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for MessagesPersistenceServiceClient()), sel_init);
  qword_1EEC40208 = (uint64_t)result;
  return result;
}

id MessagesPersistenceServiceClient.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id static MessagesPersistenceServiceClient.shared.getter()
{
  if (qword_1EEC3FCD8 != -1)
    swift_once();
  swift_beginAccess();
  return (id)qword_1EEC40208;
}

void static MessagesPersistenceServiceClient.shared.setter(uint64_t a1)
{
  void *v2;

  if (qword_1EEC3FCD8 != -1)
    swift_once();
  swift_beginAccess();
  v2 = (void *)qword_1EEC40208;
  qword_1EEC40208 = a1;

}

uint64_t (*static MessagesPersistenceServiceClient.shared.modify())()
{
  if (qword_1EEC3FCD8 != -1)
    swift_once();
  swift_beginAccess();
  return j__swift_endAccess;
}

id MessagesPersistenceServiceClient.init()()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  objc_class *v8;
  _QWORD v10[2];
  uint64_t v11;
  objc_super v12;
  uint64_t v13;

  v1 = sub_1ABC6451C();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1ABC64504();
  MEMORY[0x1E0C80A78](v5);
  v6 = sub_1ABC643C0();
  MEMORY[0x1E0C80A78](v6);
  v11 = OBJC_IVAR___IMDPersistenceServiceClient_queue;
  v10[0] = sub_1ABC50114();
  v7 = v0;
  sub_1ABC643A8();
  v13 = MEMORY[0x1E0DEE9D8];
  sub_1ABC50150();
  sub_1ABC4DADC(&qword_1EEC3F8B8);
  sub_1ABC50198();
  sub_1ABC6457C();
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x1E0DEF8D0], v1);
  *(_QWORD *)(v10[1] + v11) = sub_1ABC64534();
  *(_QWORD *)&v7[OBJC_IVAR___IMDPersistenceServiceClient_unlockedConnection] = 0;

  v8 = (objc_class *)type metadata accessor for MessagesPersistenceServiceClient();
  v12.receiver = v7;
  v12.super_class = v8;
  return objc_msgSendSuper2(&v12, sel_init);
}

unint64_t sub_1ABC50114()
{
  unint64_t result;

  result = qword_1EEC3F8E8;
  if (!qword_1EEC3F8E8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EEC3F8E8);
  }
  return result;
}

unint64_t sub_1ABC50150()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EEC3F8E0;
  if (!qword_1EEC3F8E0)
  {
    v1 = sub_1ABC64504();
    result = MEMORY[0x1AF435B10](MEMORY[0x1E0DEF828], v1);
    atomic_store(result, (unint64_t *)&qword_1EEC3F8E0);
  }
  return result;
}

unint64_t sub_1ABC50198()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EEC3F8C0;
  if (!qword_1EEC3F8C0)
  {
    v1 = sub_1ABC4DB68(&qword_1EEC3F8B8);
    result = MEMORY[0x1AF435B10](MEMORY[0x1E0DEAF38], v1);
    atomic_store(result, (unint64_t *)&qword_1EEC3F8C0);
  }
  return result;
}

uint64_t type metadata accessor for MessagesPersistenceServiceClient()
{
  return objc_opt_self();
}

id MessagesPersistenceServiceClient.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MessagesPersistenceServiceClient();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_1ABC5028C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;

  v1 = OBJC_IVAR___IMDPersistenceServiceClient_unlockedConnection;
  if (!*(_QWORD *)(v0 + OBJC_IVAR___IMDPersistenceServiceClient_unlockedConnection))
  {
    v2 = v0;
    if (qword_1EEC3FCD0 != -1)
      swift_once();
    v3 = sub_1ABC64378();
    sub_1ABC4E6D8(v3, (uint64_t)qword_1EEC401F0);
    v4 = sub_1ABC64360();
    v5 = sub_1ABC644E0();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1ABB60000, v4, v5, "Connecting to persistence agent", v6, 2u);
      MEMORY[0x1AF435B7C](v6, -1, -1);
    }

    v7 = objc_allocWithZone(MEMORY[0x1E0CB3B38]);
    v8 = (void *)sub_1ABC64444();
    v9 = objc_msgSend(v7, sel_initWithServiceName_, v8);

    v10 = *(void **)(v2 + v1);
    *(_QWORD *)(v2 + v1) = v9;

    v11 = *(void **)(v2 + v1);
    if (v11)
    {
      v12 = (void *)objc_opt_self();
      v13 = v11;
      v14 = objc_msgSend(v12, sel_interfaceWithProtocol_, &unk_1EEC4A8D0);
      objc_msgSend(v13, sel_setRemoteObjectInterface_, v14);

      v15 = *(void **)(v2 + v1);
    }
    else
    {
      v15 = 0;
    }
    objc_msgSend(v15, sel_resume);
  }
}

uint64_t MessagesPersistenceServiceClient.remoteProxy.getter()
{
  return sub_1ABC505B8();
}

uint64_t sub_1ABC50470@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t result;
  id v5;

  sub_1ABC5028C();
  result = *(_QWORD *)(a1 + OBJC_IVAR___IMDPersistenceServiceClient_unlockedConnection);
  if (!result
    || (v5 = objc_msgSend((id)result, sel_remoteObjectProxy),
        sub_1ABC64570(),
        swift_unknownObjectRelease(),
        sub_1ABC4DADC(qword_1EEC40230),
        result = swift_dynamicCast(),
        (result & 1) == 0))
  {
    *a2 = 0;
  }
  return result;
}

uint64_t sub_1ABC50518@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  return sub_1ABC50470(*(_QWORD *)(v1 + 16), a1);
}

id sub_1ABC5053C(void *a1)
{
  id v1;
  id v3;

  v1 = a1;
  sub_1ABC4DADC((uint64_t *)&unk_1EEC40220);
  sub_1ABC64528();

  return v3;
}

uint64_t MessagesPersistenceServiceClient.synchronousRemoteProxy.getter()
{
  return sub_1ABC505B8();
}

uint64_t sub_1ABC505B8()
{
  uint64_t v1;

  sub_1ABC4DADC((uint64_t *)&unk_1EEC40220);
  sub_1ABC64528();
  return v1;
}

void sub_1ABC50620(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[6];

  sub_1ABC5028C();
  v4 = *(void **)(a1 + OBJC_IVAR___IMDPersistenceServiceClient_unlockedConnection);
  if (!v4)
    goto LABEL_3;
  v8[4] = sub_1ABC50754;
  v8[5] = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 1107296256;
  v8[2] = sub_1ABC5092C;
  v8[3] = &unk_1E5AAF4B0;
  v5 = _Block_copy(v8);
  v6 = v4;
  v7 = objc_msgSend(v6, sel_synchronousRemoteObjectProxyWithErrorHandler_, v5);
  _Block_release(v5);

  sub_1ABC64570();
  swift_unknownObjectRelease();
  sub_1ABC4DADC(qword_1EEC40230);
  if ((swift_dynamicCast() & 1) == 0)
LABEL_3:
    *a2 = 0;
}

void sub_1ABC50730(_QWORD *a1@<X8>)
{
  uint64_t v1;

  sub_1ABC50620(*(_QWORD *)(v1 + 16), a1);
}

uint64_t method lookup function for MessagesPersistenceServiceClient()
{
  return swift_lookUpClassMethod();
}

void sub_1ABC50754(void *a1)
{
  uint64_t v2;
  id v3;
  id v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  NSObject *oslog;
  uint64_t v11;

  if (qword_1EEC3FCD0 != -1)
    swift_once();
  v2 = sub_1ABC64378();
  sub_1ABC4E6D8(v2, (uint64_t)qword_1EEC401F0);
  v3 = a1;
  v4 = a1;
  oslog = sub_1ABC64360();
  v5 = sub_1ABC644F8();
  if (os_log_type_enabled(oslog, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    v7 = swift_slowAlloc();
    v11 = v7;
    *(_DWORD *)v6 = 136315138;
    swift_getErrorValue();
    v8 = sub_1ABC6460C();
    sub_1ABC4F460(v8, v9, &v11);
    sub_1ABC64558();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1ABB60000, oslog, v5, "Received error for synchronous proxy to persistence agent: %s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AF435B7C](v7, -1, -1);
    MEMORY[0x1AF435B7C](v6, -1, -1);

  }
  else
  {

  }
}

void sub_1ABC5092C(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t sub_1ABC5097C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1ABC5098C()
{
  return swift_release();
}

void sub_1ABC50994(_QWORD *a1@<X8>)
{
  sub_1ABC50730(a1);
}

uint64_t sub_1ABC509A8@<X0>(_QWORD *a1@<X8>)
{
  return sub_1ABC50518(a1);
}

void *IMDMessageRecord.makeIMItem(inputHandleString:useAttachmentCache:shouldLoadAttachments:)(uint64_t a1, uint64_t a2, char a3, char a4)
{
  const __CFArray **v4;
  void *v7;
  void *v8;

  if (a2)
    v7 = (void *)sub_1ABC64444();
  else
    v7 = 0;
  v8 = IMDCreateIMItemFromIMDMessageRecord(v4, v7, a3 & 1, a4 & 1);

  return v8;
}

uint64_t sub_1ABC50A1C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  uint64_t result;
  _QWORD v8[2];

  v0 = sub_1ABC6451C();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1ABC64504();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF810];
  MEMORY[0x1E0C80A78](v4);
  v6 = sub_1ABC643C0();
  MEMORY[0x1E0C80A78](v6);
  sub_1ABC55218(0, (unint64_t *)&qword_1EEC3F8E8);
  sub_1ABC643B4();
  v8[1] = MEMORY[0x1E0DEE9D8];
  sub_1ABC4FAA0((unint64_t *)&qword_1EEC3F8E0, v5, MEMORY[0x1E0DEF828]);
  sub_1ABC4DADC(&qword_1EEC3F8B8);
  sub_1ABC55250((unint64_t *)&qword_1EEC3F8C0, &qword_1EEC3F8B8, MEMORY[0x1E0DEAF38]);
  sub_1ABC6457C();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E0DEF8D0], v0);
  result = sub_1ABC64534();
  qword_1EEC3F880 = result;
  return result;
}

id SpotlightReindexer.__allocating_init(handles:batchDeferralTime:messageAge:index:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_class *v3;
  id v7;
  id v8;

  v7 = objc_allocWithZone(v3);
  v8 = sub_1ABC54880(a1, a2, a3);
  swift_unknownObjectRelease();
  return v8;
}

id SpotlightReindexer.init(handles:batchDeferralTime:messageAge:index:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3;

  v3 = sub_1ABC54880(a1, a2, a3);
  swift_unknownObjectRelease();
  return v3;
}

Swift::Void __swiftcall SpotlightReindexer.reindex()()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  _BOOL4 v20;
  uint8_t *v21;
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  void *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  Class isa;
  NSObject *v42;
  uint64_t v43;
  _QWORD aBlock[6];

  v1 = sub_1ABC6439C();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1ABC643C0();
  isa = v5[-1].isa;
  v42 = v5;
  MEMORY[0x1E0C80A78](v5);
  v39 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1ABC64390();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (uint64_t *)((char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v40 = sub_1ABC643D8();
  v11 = *(_QWORD *)(v40 - 8);
  v12 = MEMORY[0x1E0C80A78](v40);
  v14 = (char *)&v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12);
  v16 = (char *)&v34 - v15;
  if (!IMDIsRunningInDatabaseServerProcess())
  {
    __break(1u);
    goto LABEL_15;
  }
  if (*(_QWORD *)(*(_QWORD *)&v0[OBJC_IVAR___IMDCoreSpotlightReindexer_handles] + 16))
  {
    v35 = v0;
    v37 = v2;
    v38 = v1;
    if (qword_1EEC3F858 == -1)
    {
LABEL_4:
      v17 = sub_1ABC64378();
      sub_1ABC4E6D8(v17, (uint64_t)qword_1EEC406C8);
      v18 = sub_1ABC64360();
      v19 = sub_1ABC644E0();
      v20 = os_log_type_enabled(v18, v19);
      v36 = v4;
      if (v20)
      {
        v21 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v21 = 134217984;
        aBlock[0] = 10;
        sub_1ABC64558();
        _os_log_impl(&dword_1ABB60000, v18, v19, "Deferring reindexing for %ld seconds.", v21, 0xCu);
        MEMORY[0x1AF435B7C](v21, -1, -1);
      }

      if (qword_1EEC3F890 != -1)
        swift_once();
      v34 = qword_1EEC3F880;
      sub_1ABC643CC();
      *v10 = 10;
      (*(void (**)(_QWORD *, _QWORD, uint64_t))(v8 + 104))(v10, *MEMORY[0x1E0DEF4A0], v7);
      MEMORY[0x1AF434220](v14, v10);
      (*(void (**)(_QWORD *, uint64_t))(v8 + 8))(v10, v7);
      v22 = *(void (**)(char *, uint64_t))(v11 + 8);
      v23 = v40;
      v22(v14, v40);
      v24 = swift_allocObject();
      v25 = v35;
      *(_QWORD *)(v24 + 16) = v35;
      aBlock[4] = sub_1ABC54A44;
      aBlock[5] = v24;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1ABC50A18;
      aBlock[3] = &unk_1E5AAF4D8;
      v26 = _Block_copy(aBlock);
      v27 = v25;
      v28 = v39;
      sub_1ABC643A8();
      v43 = MEMORY[0x1E0DEE9D8];
      sub_1ABC4FAA0(&qword_1EEC3F8A0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
      sub_1ABC4DADC(&qword_1EEC3F8A8);
      sub_1ABC55250(&qword_1EEC3F8B0, &qword_1EEC3F8A8, MEMORY[0x1E0DEAF38]);
      v29 = v36;
      v30 = v38;
      sub_1ABC6457C();
      MEMORY[0x1AF43434C](v16, v28, v29, v26);
      _Block_release(v26);
      (*(void (**)(char *, uint64_t))(v37 + 8))(v29, v30);
      (*((void (**)(char *, NSObject *))isa + 1))(v28, v42);
      v22(v16, v23);
      swift_release();
      return;
    }
LABEL_15:
    swift_once();
    goto LABEL_4;
  }
  if (qword_1EEC3F858 != -1)
    swift_once();
  v31 = sub_1ABC64378();
  sub_1ABC4E6D8(v31, (uint64_t)qword_1EEC406C8);
  v42 = sub_1ABC64360();
  v32 = sub_1ABC644F8();
  if (os_log_type_enabled(v42, v32))
  {
    v33 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v33 = 0;
    _os_log_impl(&dword_1ABB60000, v42, v32, "No handles to update Core Spotlight indexes for", v33, 2u);
    MEMORY[0x1AF435B7C](v33, -1, -1);
  }

}

uint64_t sub_1ABC511E8(void *a1)
{
  uint64_t v2;
  char *v3;
  NSObject *v4;
  os_log_type_t v5;
  unint64_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  _QWORD *v24;
  void *v25;
  uint64_t v27[3];
  uint64_t v28;

  if (qword_1EEC3F858 != -1)
    swift_once();
  v2 = sub_1ABC64378();
  sub_1ABC4E6D8(v2, (uint64_t)qword_1EEC406C8);
  v3 = a1;
  v4 = sub_1ABC64360();
  v5 = sub_1ABC644E0();
  v6 = 0x1EEC3F000uLL;
  if (os_log_type_enabled(v4, v5))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    *(_DWORD *)v7 = 136315138;
    v27[0] = v8;
    v9 = swift_bridgeObjectRetain();
    v10 = MEMORY[0x1AF4342EC](v9, MEMORY[0x1E0DEA968]);
    v12 = v11;
    v6 = 0x1EEC3F000;
    swift_bridgeObjectRelease();
    v28 = sub_1ABC4F460(v10, v12, v27);
    sub_1ABC64558();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1ABB60000, v4, v5, "Finding chats to re-index with CoreSpotlight for handles: %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AF435B7C](v8, -1, -1);
    MEMORY[0x1AF435B7C](v7, -1, -1);

  }
  else
  {

  }
  v13 = MEMORY[0x1E0DEE9D8];
  v28 = MEMORY[0x1E0DEE9D8];
  v14 = *(_QWORD *)&v3[*(_QWORD *)(v6 + 2120)];
  v15 = *(_QWORD *)(v14 + 16);
  if (v15)
  {
    swift_bridgeObjectRetain();
    v16 = (unint64_t *)(v14 + 40);
    do
    {
      v17 = *(v16 - 1);
      v18 = *v16;
      swift_bridgeObjectRetain();
      v19 = sub_1ABC54BC0(v17, v18, 5459283, 0xE300000000000000);
      sub_1ABC51594(v19);
      v20 = sub_1ABC54BC0(v17, v18, 0x6567617373654D69, 0xE800000000000000);
      swift_bridgeObjectRelease();
      sub_1ABC51594(v20);
      v16 += 2;
      --v15;
    }
    while (v15);
    swift_bridgeObjectRelease();
    v13 = v28;
  }
  swift_bridgeObjectRetain();
  v21 = sub_1ABC64360();
  v22 = sub_1ABC644E0();
  if (os_log_type_enabled(v21, v22))
  {
    v23 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v23 = 134217984;
    v27[0] = *(_QWORD *)(v13 + 16);
    sub_1ABC64558();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1ABB60000, v21, v22, "Computed %ld chats to update CoreSpotlight indexes for.", v23, 0xCu);
    MEMORY[0x1AF435B7C](v23, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease();
  }
  swift_beginAccess();
  v24 = (_QWORD *)v28;
  if (*(_QWORD *)(v28 + 16))
  {
    swift_bridgeObjectRetain();
    v25 = (void *)sub_1ABC6448C();
    swift_bridgeObjectRelease();
    IMDCoreSpotlightAddChatGUIDs(v25, 1008);

    sub_1ABC518A0(v24, &v3[OBJC_IVAR___IMDCoreSpotlightReindexer_messageAge]);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_1ABC51594(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  _QWORD *v3;
  int64_t v4;
  int64_t v5;
  _QWORD *isUniquelyReferenced_nonNull_native;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  int64_t v15;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    v8 = *(_QWORD *)(a1 + 16);
    if (v8)
      goto LABEL_5;
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
  if (v4 <= v5)
    v15 = v4 + v2;
  else
    v15 = v4;
  v3 = sub_1ABC54144(isUniquelyReferenced_nonNull_native, v15, 1, v3);
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
    goto LABEL_18;
LABEL_5:
  v9 = v3[2];
  if ((v3[3] >> 1) - v9 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v10 = (unint64_t)&v3[2 * v9 + 4];
  if (a1 + 32 < v10 + 16 * v8 && v10 < a1 + 32 + 16 * v8)
    goto LABEL_24;
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v12 = v3[2];
  v13 = __OFADD__(v12, v8);
  v14 = v12 + v8;
  if (!v13)
  {
    v3[2] = v14;
LABEL_19:
    result = swift_bridgeObjectRelease();
    *(_QWORD *)v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_1ABC645DC();
  __break(1u);
  return result;
}

uint64_t sub_1ABC516E8(unint64_t a1)
{
  unint64_t *v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_1ABC645C4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_1ABC645C4();
    swift_bridgeObjectRelease();
    v6 = v5 + v3;
    if (!__OFADD__(v5, v3))
      goto LABEL_5;
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  v6 = v5 + v3;
  if (__OFADD__(v5, v3))
    goto LABEL_23;
LABEL_5:
  v4 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v1 = v4;
  v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_15;
    v5 = 1;
  }
  if (v4 >> 62)
    goto LABEL_25;
  v9 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6)
      v9 = v6;
    swift_bridgeObjectRetain();
    v4 = MEMORY[0x1AF4343DC](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = sub_1ABC5455C(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    v9 = sub_1ABC645C4();
    swift_bridgeObjectRelease();
  }
  if (v11 < 1)
    goto LABEL_19;
  v12 = *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v13 = __OFADD__(v12, v11);
  v14 = v12 + v11;
  if (!v13)
  {
    *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
LABEL_19:
    swift_bridgeObjectRelease();
    return sub_1ABC644BC();
  }
  __break(1u);
  return result;
}

void sub_1ABC518A0(_QWORD *a1, NSObject *a2)
{
  char *v2;
  char *v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  NSObject *v30;
  os_log_type_t v31;
  _BOOL4 v32;
  uint8_t *v33;
  id v34;
  void *v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  os_log_type_t v39;
  uint8_t *v40;
  char *v41;
  uint64_t v42;
  char *v43;
  char *v44;
  void *v45;
  char *v46;
  void (*v47)(char *, uint64_t);
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  char *v53;
  char *v54;
  char *v55;
  void *v56;
  char *v57;
  id v58;
  char *v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  void (*v65)(char *, NSObject *, uint64_t);
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  char *v70;
  char *v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  NSObject *v81;
  uint64_t v82;
  uint64_t aBlock[7];

  v3 = v2;
  v81 = a2;
  v77 = sub_1ABC6439C();
  v5 = *(_QWORD *)(v77 - 8);
  MEMORY[0x1E0C80A78](v77);
  v7 = (char *)&v62 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1ABC643C0();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v62 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v76 = sub_1ABC643D8();
  v74 = *(_QWORD *)(v76 - 8);
  v12 = MEMORY[0x1E0C80A78](v76);
  v73 = (char *)&v62 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12);
  v75 = (char *)&v62 - v14;
  v15 = sub_1ABC64378();
  v78 = *(_QWORD *)(v15 - 8);
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v62 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_1ABC4DADC((uint64_t *)&unk_1EEC3F818);
  v79 = *(_QWORD *)(v18 - 8);
  v80 = v18;
  MEMORY[0x1E0C80A78](v18);
  v72 = v19;
  v20 = (char *)&v62 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!IMDIsRunningInDatabaseServerProcess())
  {
    __break(1u);
LABEL_21:
    a1 = sub_1ABC5486C(a1);
LABEL_4:
    sub_1ABC55218(0, &qword_1EEC40250);
    v22 = a1[2];
    if (v22)
    {
      v67 = v8;
      v68 = v7;
      v69 = v5;
      v23 = v22 - 1;
      v24 = &a1[2 * v23];
      v25 = v24[4];
      v26 = v24[5];
      a1[2] = v23;
      v65 = *(void (**)(char *, NSObject *, uint64_t))(v79 + 16);
      v65(v20, v81, v80);
      v11 = (char *)sub_1ABC5201C(v25, v26, v20);
      if (qword_1EEC3F858 == -1)
      {
LABEL_6:
        v27 = sub_1ABC4E6D8(v15, (uint64_t)qword_1EEC406C8);
        v28 = v78;
        (*(void (**)(char *, uint64_t, uint64_t))(v78 + 16))(v17, v27, v15);
        v29 = v11;
        v30 = sub_1ABC64360();
        v31 = sub_1ABC644E0();
        v32 = os_log_type_enabled(v30, v31);
        v71 = v29;
        v66 = v9;
        if (v32)
        {
          v64 = v3;
          v33 = (uint8_t *)swift_slowAlloc();
          v63 = swift_slowAlloc();
          aBlock[0] = v63;
          *(_DWORD *)v33 = 136315138;
          v34 = objc_msgSend(v29, sel_associatedChatGUID);
          if (v34)
          {
            v35 = v34;
            v36 = sub_1ABC64450();
            v38 = v37;

          }
          else
          {
            v38 = 0xE300000000000000;
            v36 = 7104878;
          }
          v82 = sub_1ABC4F460(v36, v38, aBlock);
          sub_1ABC64558();
          v41 = v71;

          swift_bridgeObjectRelease();
          _os_log_impl(&dword_1ABB60000, v30, v31, "Queuing up first chat reindex: %s", v33, 0xCu);
          v42 = v63;
          swift_arrayDestroy();
          MEMORY[0x1AF435B7C](v42, -1, -1);
          MEMORY[0x1AF435B7C](v33, -1, -1);

          (*(void (**)(char *, uint64_t))(v78 + 8))(v17, v15);
          v3 = v64;
        }
        else
        {

          (*(void (**)(char *, uint64_t))(v28 + 8))(v17, v15);
        }
        if (qword_1EEC3F890 != -1)
          swift_once();
        v78 = qword_1EEC3F880;
        v43 = v73;
        sub_1ABC643CC();
        v44 = &v3[OBJC_IVAR___IMDCoreSpotlightReindexer_deferralTime];
        v45 = v3;
        v46 = v75;
        MEMORY[0x1AF434220](v43, v44);
        v47 = *(void (**)(char *, uint64_t))(v74 + 8);
        v48 = v43;
        v49 = v76;
        v47(v48, v76);
        v50 = v80;
        v65(v20, v81, v80);
        v51 = v79;
        v52 = (*(unsigned __int8 *)(v79 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v79 + 80);
        v53 = (char *)swift_allocObject();
        v54 = v20;
        v55 = v71;
        *((_QWORD *)v53 + 2) = v45;
        *((_QWORD *)v53 + 3) = v55;
        *((_QWORD *)v53 + 4) = a1;
        (*(void (**)(char *, char *, uint64_t))(v51 + 32))(&v53[v52], v54, v50);
        aBlock[4] = (uint64_t)sub_1ABC54EFC;
        aBlock[5] = (uint64_t)v53;
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 1107296256;
        aBlock[2] = (uint64_t)sub_1ABC50A18;
        aBlock[3] = (uint64_t)&unk_1E5AC0BB8;
        v56 = _Block_copy(aBlock);
        v57 = v55;
        v58 = v45;
        v59 = v70;
        sub_1ABC643A8();
        v82 = MEMORY[0x1E0DEE9D8];
        sub_1ABC4FAA0(&qword_1EEC3F8A0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
        sub_1ABC4DADC(&qword_1EEC3F8A8);
        sub_1ABC55250(&qword_1EEC3F8B0, &qword_1EEC3F8A8, MEMORY[0x1E0DEAF38]);
        v60 = v68;
        v61 = v77;
        sub_1ABC6457C();
        MEMORY[0x1AF43434C](v46, v59, v60, v56);
        _Block_release(v56);

        (*(void (**)(char *, uint64_t))(v69 + 8))(v60, v61);
        (*(void (**)(char *, uint64_t))(v66 + 8))(v59, v67);
        v47(v46, v49);
        swift_release();
        return;
      }
    }
    else
    {
      __break(1u);
    }
    swift_once();
    goto LABEL_6;
  }
  if (a1[2])
  {
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v70 = v11;
    if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      goto LABEL_4;
    goto LABEL_21;
  }
  if (qword_1EEC3F858 != -1)
    swift_once();
  sub_1ABC4E6D8(v15, (uint64_t)qword_1EEC406C8);
  v81 = sub_1ABC64360();
  v39 = sub_1ABC644F8();
  if (os_log_type_enabled(v81, v39))
  {
    v40 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v40 = 0;
    _os_log_impl(&dword_1ABB60000, v81, v39, "No chats to reindex recent messages", v40, 2u);
    MEMORY[0x1AF435B7C](v40, -1, -1);
  }

}

uint64_t sub_1ABC51FBC(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

id sub_1ABC5201C(uint64_t a1, uint64_t a2, char *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void (*v17)(char *, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  void *v24;
  uint64_t v26;
  char *v27;

  v27 = a3;
  v3 = sub_1ABC6430C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1ABC4DADC((uint64_t *)&unk_1EEC3F818);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v12 = (void *)sub_1ABC64444();
  swift_bridgeObjectRelease();
  v13 = objc_msgSend(v11, sel_initWithAssociatedChatGUID_, v12);

  v14 = (void *)objc_opt_self();
  v15 = v13;
  v16 = objc_msgSend(v14, sel_seconds);
  sub_1ABC642AC();

  sub_1ABC642A0();
  v17 = *(void (**)(char *, uint64_t))(v8 + 8);
  v17(v10, v7);
  sub_1ABC55218(0, &qword_1EEC40280);
  sub_1ABC4DADC(&qword_1EEC40288);
  v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_1ABC6A400;
  v19 = sub_1ABC64450();
  v21 = v20;
  *(_QWORD *)(v18 + 56) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v18 + 64) = sub_1ABC55040();
  *(_QWORD *)(v18 + 32) = v19;
  *(_QWORD *)(v18 + 40) = v21;
  v22 = v15;
  sub_1ABC642F4();
  v23 = sub_1ABC642E8();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  *(_QWORD *)(v18 + 96) = sub_1ABC55218(0, &qword_1EEC40298);
  *(_QWORD *)(v18 + 104) = sub_1ABC55084();
  *(_QWORD *)(v18 + 72) = v23;
  v24 = (void *)sub_1ABC644D4();
  objc_msgSend(v22, sel_setPredicate_, v24);

  objc_msgSend(v22, sel_setBatchSize_, 300);
  v17(v27, v7);
  return v22;
}

void sub_1ABC522CC(void *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, uint64_t);
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  id v28;
  NSObject *v29;
  os_log_type_t v30;
  _BOOL4 v31;
  uint8_t *v32;
  uint64_t v33;
  id v34;
  void *v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  void (*v39)(char *, uint64_t);
  unint64_t v40;
  id v41;
  id v42;
  char *v43;
  NSObject *v44;
  os_log_type_t v45;
  _BOOL4 v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  void *v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  id v59;
  char *v60;
  NSObject *v61;
  os_log_type_t v62;
  _BOOL4 v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  unint64_t v71;
  uint64_t v72;
  unint64_t v73;
  char *v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  unint64_t v80;
  char *v81;
  void *v82;
  void *v83;
  id v84;
  char *v85;
  char *v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  _QWORD *v90;
  char *v91;
  id v92;
  NSObject *v93;
  os_log_type_t v94;
  void (*v95)(char *, uint64_t);
  uint8_t *v96;
  uint64_t v97;
  id v98;
  void *v99;
  uint64_t v100;
  unint64_t v101;
  unint64_t v102;
  NSObject *v103;
  os_log_type_t v104;
  uint8_t *v105;
  uint64_t v106;
  void (*v107)(char *, uint64_t);
  uint64_t v108;
  _QWORD *v109;
  uint64_t v110;
  uint64_t v111;
  char *v112;
  id v113;
  char *v114;
  NSObject *v115;
  os_log_type_t v116;
  uint8_t *v117;
  uint64_t v118;
  id v119;
  void *v120;
  uint64_t v121;
  unint64_t v122;
  unint64_t v123;
  char *v124;
  void *v125;
  char *v126;
  uint64_t v127;
  char *v128;
  uint64_t v129;
  uint64_t v130;
  unint64_t v131;
  char *v132;
  void *v133;
  id v134;
  NSObject *v135;
  char *v136;
  char *v137;
  uint64_t v138;
  void (*v139)(char *, uint64_t);
  char *v140;
  uint64_t v141;
  uint64_t v142;
  char *v143;
  char *v144;
  char *v145;
  char *v146;
  char *v147;
  uint64_t v148;
  uint64_t v149;
  char *v150;
  uint64_t v151;
  char *v152;
  uint64_t v153;
  char *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  _QWORD *v164;
  void (*v165)(char *);
  void (*v166)(_QWORD, _QWORD);
  uint64_t v167;
  uint64_t aBlock;
  uint64_t v169;
  uint64_t (*v170)();
  void *v171;
  uint64_t (*v172)();
  char *v173;

  v159 = a3;
  v164 = a2;
  v157 = sub_1ABC6439C();
  v155 = *(_QWORD *)(v157 - 8);
  MEMORY[0x1E0C80A78](v157);
  v154 = (char *)&v139 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v156 = sub_1ABC643C0();
  v153 = *(_QWORD *)(v156 - 8);
  MEMORY[0x1E0C80A78](v156);
  v152 = (char *)&v139 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1ABC4DADC((uint64_t *)&unk_1EEC3F818);
  v161 = *(_QWORD *)(v6 - 8);
  v162 = v6;
  MEMORY[0x1E0C80A78](v6);
  v149 = v7;
  v160 = (char *)&v139 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v151 = sub_1ABC643D8();
  v148 = *(_QWORD *)(v151 - 8);
  v8 = MEMORY[0x1E0C80A78](v151);
  v147 = (char *)&v139 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v150 = (char *)&v139 - v10;
  v142 = sub_1ABC64390();
  v141 = *(_QWORD *)(v142 - 8);
  MEMORY[0x1E0C80A78](v142);
  v140 = (char *)&v139 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1ABC64378();
  v13 = *(void (**)(char *, uint64_t))(v12 - 8);
  v14 = MEMORY[0x1E0C80A78](v12);
  v16 = (char *)&v139 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x1E0C80A78](v14);
  v144 = (char *)&v139 - v18;
  v19 = MEMORY[0x1E0C80A78](v17);
  v21 = (char *)&v139 - v20;
  v22 = MEMORY[0x1E0C80A78](v19);
  v24 = (char *)&v139 - v23;
  MEMORY[0x1E0C80A78](v22);
  v26 = (char *)&v139 - v25;
  if (qword_1EEC3F858 != -1)
    swift_once();
  v27 = sub_1ABC4E6D8(v12, (uint64_t)qword_1EEC406C8);
  v165 = (void (*)(char *))*((_QWORD *)v13 + 2);
  v166 = (void (*)(_QWORD, _QWORD))v27;
  v165(v26);
  v28 = a1;
  v29 = sub_1ABC64360();
  v30 = sub_1ABC644E0();
  v31 = os_log_type_enabled(v29, v30);
  v143 = v16;
  v158 = v12;
  v163 = (uint64_t)v21;
  if (v31)
  {
    v139 = v13;
    v145 = v24;
    v32 = (uint8_t *)swift_slowAlloc();
    v33 = swift_slowAlloc();
    aBlock = v33;
    *(_DWORD *)v32 = 136315138;
    v34 = objc_msgSend(v28, sel_associatedChatGUID);
    if (v34)
    {
      v35 = v34;
      v36 = sub_1ABC64450();
      v38 = v37;

    }
    else
    {
      v38 = 0xE300000000000000;
      v36 = 7104878;
    }
    v167 = sub_1ABC4F460(v36, v38, &aBlock);
    sub_1ABC64558();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1ABB60000, v29, v30, "Fetching batch of messages to reindex for %s", v32, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AF435B7C](v33, -1, -1);
    MEMORY[0x1AF435B7C](v32, -1, -1);

    v39 = (void (*)(char *, uint64_t))*((_QWORD *)v139 + 1);
    v12 = v158;
    v39(v26, v158);
    v21 = (char *)v163;
    v24 = v145;
  }
  else
  {

    v39 = (void (*)(char *, uint64_t))*((_QWORD *)v13 + 1);
    v39(v26, v12);
  }
  v40 = (unint64_t)sub_1ABC534CC();
  if (v40 >> 62)
  {
    swift_bridgeObjectRetain();
    v89 = sub_1ABC645C4();
    swift_bridgeObjectRelease();
    if (v89)
      goto LABEL_11;
  }
  else if (*(_QWORD *)((v40 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_11:
    ((void (*)(char *, void (*)(_QWORD, _QWORD), uint64_t))v165)(v24, v166, v12);
    v41 = v28;
    swift_bridgeObjectRetain_n();
    v42 = v41;
    v43 = v24;
    v44 = sub_1ABC64360();
    v45 = sub_1ABC644E0();
    v46 = os_log_type_enabled(v44, v45);
    v139 = v39;
    if (v46)
    {
      v145 = v43;
      v47 = swift_slowAlloc();
      v48 = swift_slowAlloc();
      aBlock = v48;
      *(_DWORD *)v47 = 134218242;
      if (v40 >> 62)
      {
        swift_bridgeObjectRetain();
        v49 = sub_1ABC645C4();
        swift_bridgeObjectRelease();
      }
      else
      {
        v49 = *(_QWORD *)((v40 & 0xFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      v167 = v49;
      sub_1ABC64558();
      swift_bridgeObjectRelease();
      *(_WORD *)(v47 + 12) = 2080;
      v50 = objc_msgSend(v42, sel_associatedChatGUID);
      if (v50)
      {
        v51 = v50;
        v52 = sub_1ABC64450();
        v54 = v53;

      }
      else
      {
        v54 = 0xE300000000000000;
        v52 = 7104878;
      }
      v167 = sub_1ABC4F460(v52, v54, &aBlock);
      sub_1ABC64558();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1ABB60000, v44, v45, "Kicking off indexing of %ld searchable items for chat with GUID %s", (uint8_t *)v47, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1AF435B7C](v48, -1, -1);
      MEMORY[0x1AF435B7C](v47, -1, -1);

      v12 = v158;
      v39 = v139;
      v139(v145, v158);
      v21 = (char *)v163;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      v39(v43, v12);
    }
    sub_1ABC53740(v40);
    swift_bridgeObjectRelease();
    v55 = (void *)sub_1ABC6448C();
    swift_bridgeObjectRelease();
    v56 = v146;
    IMDCoreSpotlightIndexSearchableItemsAsync(v55, 1008, *(void **)&v146[OBJC_IVAR___IMDCoreSpotlightReindexer_index]);

    ((void (*)(char *, void (*)(_QWORD, _QWORD), uint64_t))v165)(v21, v166, v12);
    v57 = v42;
    v58 = v56;
    v59 = v57;
    v60 = (char *)v58;
    v61 = sub_1ABC64360();
    v62 = sub_1ABC644E0();
    v63 = os_log_type_enabled(v61, v62);
    v166 = (void (*)(_QWORD, _QWORD))v59;
    if (v63)
    {
      v64 = swift_slowAlloc();
      v65 = swift_slowAlloc();
      aBlock = v65;
      *(_DWORD *)v64 = 136315394;
      v66 = objc_msgSend(v59, sel_associatedChatGUID);
      if (v66)
      {
        v67 = v66;
        v68 = v12;
        v69 = sub_1ABC64450();
        v71 = v70;

      }
      else
      {
        v68 = v12;
        v71 = 0xE300000000000000;
        v69 = 7104878;
      }
      v167 = sub_1ABC4F460(v69, v71, &aBlock);
      sub_1ABC64558();

      swift_bridgeObjectRelease();
      *(_WORD *)(v64 + 12) = 2080;
      (*(void (**)(char *, char *, uint64_t))(v141 + 16))(v140, &v60[OBJC_IVAR___IMDCoreSpotlightReindexer_deferralTime], v142);
      v72 = sub_1ABC6445C();
      v167 = sub_1ABC4F460(v72, v73, &aBlock);
      sub_1ABC64558();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1ABB60000, v61, v62, "Scheduling fetching the next batch of messages for re-indexing in chat with GUID %s after %s seconds", (uint8_t *)v64, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1AF435B7C](v65, -1, -1);
      MEMORY[0x1AF435B7C](v64, -1, -1);

      v139((char *)v163, v68);
    }
    else
    {

      v39(v21, v12);
    }
    if (qword_1EEC3F890 != -1)
      swift_once();
    v163 = qword_1EEC3F880;
    v74 = v147;
    sub_1ABC643CC();
    v75 = v150;
    MEMORY[0x1AF434220](v74, &v60[OBJC_IVAR___IMDCoreSpotlightReindexer_deferralTime]);
    v165 = *(void (**)(char *))(v148 + 8);
    v76 = v151;
    ((void (*)(char *, uint64_t))v165)(v74, v151);
    v78 = v160;
    v77 = v161;
    v79 = v162;
    (*(void (**)(char *, uint64_t, uint64_t))(v161 + 16))(v160, v159, v162);
    v80 = (*(unsigned __int8 *)(v77 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v77 + 80);
    v81 = (char *)swift_allocObject();
    v82 = v166;
    *((_QWORD *)v81 + 2) = v60;
    *((_QWORD *)v81 + 3) = v82;
    *((_QWORD *)v81 + 4) = v164;
    (*(void (**)(char *, char *, uint64_t))(v77 + 32))(&v81[v80], v78, v79);
    v172 = sub_1ABC54EFC;
    v173 = v81;
    aBlock = MEMORY[0x1E0C809B0];
    v169 = 1107296256;
    v170 = sub_1ABC50A18;
    v171 = &unk_1E5AC0C08;
    v83 = _Block_copy(&aBlock);
    v84 = v82;
    v85 = v60;
    swift_bridgeObjectRetain();
    v86 = v152;
    sub_1ABC643A8();
    v167 = MEMORY[0x1E0DEE9D8];
    sub_1ABC4FAA0(&qword_1EEC3F8A0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
    sub_1ABC4DADC(&qword_1EEC3F8A8);
    sub_1ABC55250(&qword_1EEC3F8B0, &qword_1EEC3F8A8, MEMORY[0x1E0DEAF38]);
    v87 = v154;
    v88 = v157;
    sub_1ABC6457C();
    MEMORY[0x1AF43434C](v75, v86, v87, v83);
    _Block_release(v83);
    (*(void (**)(char *, uint64_t))(v155 + 8))(v87, v88);
    (*(void (**)(char *, uint64_t))(v153 + 8))(v86, v156);
    ((void (*)(char *, uint64_t))v165)(v75, v76);
    goto LABEL_51;
  }
  swift_bridgeObjectRelease();
  v90 = v164;
  if (v164[2])
  {
    v91 = v144;
    ((void (*)(char *, void (*)(_QWORD, _QWORD), uint64_t))v165)(v144, v166, v12);
    v92 = v28;
    v93 = sub_1ABC64360();
    v94 = sub_1ABC644E0();
    if (os_log_type_enabled(v93, v94))
    {
      v95 = v39;
      v96 = (uint8_t *)swift_slowAlloc();
      v97 = swift_slowAlloc();
      aBlock = v97;
      *(_DWORD *)v96 = 136315138;
      v98 = objc_msgSend(v92, sel_associatedChatGUID);
      if (v98)
      {
        v99 = v98;
        v100 = sub_1ABC64450();
        v102 = v101;

      }
      else
      {
        v102 = 0xE300000000000000;
        v100 = 7104878;
      }
      v167 = sub_1ABC4F460(v100, v102, &aBlock);
      sub_1ABC64558();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1ABB60000, v93, v94, "No more messages to reindex for %s", v96, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1AF435B7C](v97, -1, -1);
      MEMORY[0x1AF435B7C](v96, -1, -1);

      v39 = v95;
      v95(v144, v12);
      v90 = v164;
    }
    else
    {

      v39(v91, v12);
    }
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v90 = sub_1ABC5486C(v90);
    sub_1ABC55218(0, &qword_1EEC40250);
    v106 = v90[2];
    if (v106)
    {
      v107 = v39;
      v108 = v106 - 1;
      v109 = &v90[2 * v108];
      v110 = v109[4];
      v111 = v109[5];
      v90[2] = v108;
      v112 = v160;
      v39 = *(void (**)(char *, uint64_t))(v161 + 16);
      ((void (*)(char *, uint64_t, uint64_t))v39)(v160, v159, v162);
      v113 = sub_1ABC5201C(v110, v111, v112);
      v114 = v143;
      ((void (*)(char *, void (*)(_QWORD, _QWORD), uint64_t))v165)(v143, v166, v12);
      v93 = v113;
      v115 = sub_1ABC64360();
      v116 = sub_1ABC644E0();
      if (os_log_type_enabled(v115, v116))
      {
        v164 = v90;
        v117 = (uint8_t *)swift_slowAlloc();
        v118 = swift_slowAlloc();
        aBlock = v118;
        *(_DWORD *)v117 = 136315138;
        v119 = -[NSObject associatedChatGUID](v93, sel_associatedChatGUID);
        if (v119)
        {
          v120 = v119;
          v121 = sub_1ABC64450();
          v123 = v122;

        }
        else
        {
          v123 = 0xE300000000000000;
          v121 = 7104878;
        }
        v167 = sub_1ABC4F460(v121, v123, &aBlock);
        sub_1ABC64558();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1ABB60000, v115, v116, "Incrementing chat to reindex to %s", v117, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1AF435B7C](v118, -1, -1);
        MEMORY[0x1AF435B7C](v117, -1, -1);

        v107(v143, v158);
        v90 = v164;
      }
      else
      {

        v107(v114, v12);
      }
      if (qword_1EEC3F890 == -1)
        goto LABEL_50;
    }
    else
    {
      __break(1u);
    }
    swift_once();
LABEL_50:
    v165 = (void (*)(char *))qword_1EEC3F880;
    v124 = v147;
    sub_1ABC643CC();
    v125 = v146;
    v126 = v150;
    MEMORY[0x1AF434220](v124, &v146[OBJC_IVAR___IMDCoreSpotlightReindexer_deferralTime]);
    v166 = *(void (**)(_QWORD, _QWORD))(v148 + 8);
    v127 = v151;
    v166(v124, v151);
    v128 = v160;
    v129 = v162;
    ((void (*)(char *, uint64_t, uint64_t))v39)(v160, v159, v162);
    v130 = v161;
    v131 = (*(unsigned __int8 *)(v161 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v161 + 80);
    v132 = (char *)swift_allocObject();
    *((_QWORD *)v132 + 2) = v125;
    *((_QWORD *)v132 + 3) = v93;
    *((_QWORD *)v132 + 4) = v90;
    (*(void (**)(char *, char *, uint64_t))(v130 + 32))(&v132[v131], v128, v129);
    v172 = sub_1ABC54EFC;
    v173 = v132;
    aBlock = MEMORY[0x1E0C809B0];
    v169 = 1107296256;
    v170 = sub_1ABC50A18;
    v171 = &unk_1E5AAE9F8;
    v133 = _Block_copy(&aBlock);
    v134 = v125;
    v135 = v93;
    v136 = v152;
    sub_1ABC643A8();
    v167 = MEMORY[0x1E0DEE9D8];
    sub_1ABC4FAA0(&qword_1EEC3F8A0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
    sub_1ABC4DADC(&qword_1EEC3F8A8);
    sub_1ABC55250(&qword_1EEC3F8B0, &qword_1EEC3F8A8, MEMORY[0x1E0DEAF38]);
    v137 = v154;
    v138 = v157;
    sub_1ABC6457C();
    MEMORY[0x1AF43434C](v126, v136, v137, v133);
    _Block_release(v133);

    (*(void (**)(char *, uint64_t))(v155 + 8))(v137, v138);
    (*(void (**)(char *, uint64_t))(v153 + 8))(v136, v156);
    v166(v126, v127);
LABEL_51:
    swift_release();
    return;
  }
  v103 = sub_1ABC64360();
  v104 = sub_1ABC644E0();
  if (os_log_type_enabled(v103, v104))
  {
    v105 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v105 = 0;
    _os_log_impl(&dword_1ABB60000, v103, v104, "No more chats to reindex, stopping", v105, 2u);
    MEMORY[0x1AF435B7C](v105, -1, -1);
  }

}

id sub_1ABC534CC()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  id result;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD aBlock[6];

  v1 = swift_allocObject();
  v2 = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)(v1 + 16) = MEMORY[0x1E0DEE9D8];
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = v1;
  *(_QWORD *)(v3 + 24) = v0;
  aBlock[4] = sub_1ABC55038;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1ABC50A18;
  aBlock[3] = &unk_1E5AC0CA8;
  v4 = _Block_copy(aBlock);
  swift_retain();
  v5 = v0;
  swift_release();
  IMDPersistencePerformBlock(v4, 1);
  _Block_release(v4);
  swift_beginAccess();
  v6 = *(_QWORD *)(v1 + 16);
  v18 = v2;
  if (!(v6 >> 62))
  {
    v7 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n();
    if (v7)
      goto LABEL_3;
LABEL_16:
    swift_bridgeObjectRelease_n();
    v17 = MEMORY[0x1E0DEE9D8];
LABEL_17:
    swift_release();
    return (id)v17;
  }
LABEL_15:
  swift_bridgeObjectRetain_n();
  v7 = sub_1ABC645C4();
  if (!v7)
    goto LABEL_16;
LABEL_3:
  v8 = (void *)objc_opt_self();
  v9 = 4;
  while (1)
  {
    if ((v6 & 0xC000000000000001) != 0)
      v12 = (id)MEMORY[0x1AF4343D0](v9 - 4, v6);
    else
      v12 = *(id *)(v6 + 8 * v9);
    v11 = v12;
    v13 = v9 - 3;
    if (__OFADD__(v9 - 4, 1))
    {
      __break(1u);
      goto LABEL_15;
    }
    result = objc_msgSend(v8, sel_sharedInstance);
    if (!result)
      break;
    v15 = result;
    v16 = objc_msgSend(result, sel_newSearchableItemsForMessage_reindexing_, v11, 1);

    if (v16)
    {
      sub_1ABC55218(0, &qword_1EEC40258);
      v10 = sub_1ABC644A4();

      v11 = v16;
    }
    else
    {
      v10 = MEMORY[0x1E0DEE9D8];
    }

    sub_1ABC516E8(v10);
    ++v9;
    if (v13 == v7)
    {
      swift_bridgeObjectRelease_n();
      v17 = v18;
      goto LABEL_17;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1ABC53740(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t i;
  unint64_t v6;
  unint64_t v7;
  id *v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  _OWORD v12[2];
  uint64_t v13;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v2 = sub_1ABC645C4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v3 = MEMORY[0x1E0DEE9D8];
  if (!v2)
    return v3;
  v13 = MEMORY[0x1E0DEE9D8];
  result = sub_1ABC54250(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v2; ++i)
      {
        MEMORY[0x1AF4343D0](i, a1);
        sub_1ABC55218(0, &qword_1EEC40258);
        swift_dynamicCast();
        v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1ABC54250(0, *(_QWORD *)(v3 + 16) + 1, 1);
          v3 = v13;
        }
        v7 = *(_QWORD *)(v3 + 16);
        v6 = *(_QWORD *)(v3 + 24);
        if (v7 >= v6 >> 1)
        {
          sub_1ABC54250(v6 > 1, v7 + 1, 1);
          v3 = v13;
        }
        *(_QWORD *)(v3 + 16) = v7 + 1;
        sub_1ABC54FD8(v12, (_OWORD *)(v3 + 32 * v7 + 32));
      }
    }
    else
    {
      v8 = (id *)(a1 + 32);
      sub_1ABC55218(0, &qword_1EEC40258);
      do
      {
        v9 = *v8;
        swift_dynamicCast();
        v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1ABC54250(0, *(_QWORD *)(v3 + 16) + 1, 1);
          v3 = v13;
        }
        v11 = *(_QWORD *)(v3 + 16);
        v10 = *(_QWORD *)(v3 + 24);
        if (v11 >= v10 >> 1)
        {
          sub_1ABC54250(v10 > 1, v11 + 1, 1);
          v3 = v13;
        }
        *(_QWORD *)(v3 + 16) = v11 + 1;
        sub_1ABC54FD8(v12, (_OWORD *)(v3 + 32 * v11 + 32));
        ++v8;
        --v2;
      }
      while (v2);
    }
    return v3;
  }
  __break(1u);
  return result;
}

void sub_1ABC539A0()
{
  __CFString *v0;
  __CFString *v1;
  uint64_t v2;

  v0 = (__CFString *)sub_1ABC64444();
  v1 = (__CFString *)sub_1ABC64444();
  v2 = IMDChatRecordCopyChatsWithHandleOnService(v0, v1);

  if (v2)
  {
    sub_1ABC55218(0, (unint64_t *)&unk_1EEC3F8D0);
    sub_1ABC64498();
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_1ABC53D38(unint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  _QWORD **v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;

  if (!(a1 >> 62))
  {
    v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v4)
      goto LABEL_3;
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  result = sub_1ABC645C4();
  v4 = result;
  if (!result)
    return swift_bridgeObjectRelease();
LABEL_3:
  if (v4 >= 1)
  {
    v6 = 0;
    v7 = (_QWORD **)(a2 + 16);
    v19 = a1 & 0xC000000000000001;
    do
    {
      if (v19)
        v8 = (id)MEMORY[0x1AF4343D0](v6, a1);
      else
        v8 = *(id *)(a1 + 8 * v6 + 32);
      v9 = v8;
      v10 = objc_msgSend(v8, sel_guid, v19);
      v11 = sub_1ABC64450();
      v13 = v12;

      swift_beginAccess();
      v14 = *v7;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *v7 = v14;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        v14 = sub_1ABC54144(0, v14[2] + 1, 1, v14);
        *v7 = v14;
      }
      v17 = v14[2];
      v16 = v14[3];
      if (v17 >= v16 >> 1)
      {
        v14 = sub_1ABC54144((_QWORD *)(v16 > 1), v17 + 1, 1, v14);
        *v7 = v14;
      }
      ++v6;
      v14[2] = v17 + 1;
      v18 = &v14[2 * v17];
      v18[4] = v11;
      v18[5] = v13;
      swift_endAccess();

    }
    while (v4 != v6);
    return swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_1ABC53F04(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  sub_1ABC55218(0, (unint64_t *)&unk_1EEC3F8D0);
  v2 = sub_1ABC644A4();
  swift_retain();
  v1(v2);
  swift_release();
  return swift_bridgeObjectRelease();
}

id SpotlightReindexer.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void SpotlightReindexer.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id SpotlightReindexer.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1ABC540A8(uint64_t a1, id a2)
{
  id v3;
  uint64_t v4;

  v3 = objc_msgSend(a2, sel_nextBatch);
  sub_1ABC55218(0, &qword_1EEC40278);
  v4 = sub_1ABC644A4();

  swift_beginAccess();
  *(_QWORD *)(a1 + 16) = v4;
  return swift_bridgeObjectRelease();
}

_QWORD *sub_1ABC54144(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      sub_1ABC4DADC(&qword_1EEC3F8F8);
      v10 = (_QWORD *)swift_allocObject();
      v11 = j__malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 17;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      v13 = (_QWORD *)(MEMORY[0x1E0DEE9D8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_1ABC550DC(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1ABC54250(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_1ABC54288(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_1ABC5426C(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_1ABC543F4(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_1ABC54288(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    sub_1ABC4DADC(&qword_1EEC40260);
    v10 = (char *)swift_allocObject();
    v11 = j__malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8])
      memmove(v13, v14, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_1ABC645DC();
  __break(1u);
  return result;
}

uint64_t sub_1ABC543F4(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    sub_1ABC4DADC(&qword_1EEC3F8F8);
    v10 = (char *)swift_allocObject();
    v11 = j__malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_1ABC645DC();
  __break(1u);
  return result;
}

uint64_t sub_1ABC5455C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  void (*v12)(_QWORD *);
  id *v13;
  id v14;
  uint64_t result;
  void (*v16[4])(id *);

  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_1ABC645C4();
    swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_19;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    v10 = sub_1ABC645C4();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_1ABC55250(&qword_1EEC40270, &qword_1EEC40268, MEMORY[0x1E0DEAF50]);
        swift_bridgeObjectRetain();
        for (i = 0; i != v7; ++i)
        {
          sub_1ABC4DADC(&qword_1EEC40268);
          v12 = sub_1ABC54778(v16, i, a3);
          v14 = *v13;
          ((void (*)(void (**)(id *), _QWORD))v12)(v16, 0);
          *(_QWORD *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_1ABC55218(0, &qword_1EEC40258);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_1ABC645DC();
  __break(1u);
  return result;
}

void (*sub_1ABC54778(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_1ABC547F8(v6, a2, a3);
  return sub_1ABC547CC;
}

void sub_1ABC547CC(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_1ABC547F8(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x1AF4343D0](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(_QWORD *)v3 = v4;
    return sub_1ABC54864;
  }
  __break(1u);
  return result;
}

void sub_1ABC54864(id *a1)
{

}

_QWORD *sub_1ABC5486C(_QWORD *a1)
{
  return sub_1ABC54144(0, a1[2], 0, a1);
}

id sub_1ABC54880(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v4;
  objc_class *ObjectType;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  id result;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  objc_super v19;

  v4 = v3;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = sub_1ABC4DADC((uint64_t *)&unk_1EEC3F818);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = v4;
  result = (id)IMDIsRunningInDatabaseServerProcess();
  if ((_DWORD)result)
  {
    *(_QWORD *)&v13[OBJC_IVAR___IMDCoreSpotlightReindexer_handles] = a1;
    v15 = &v13[OBJC_IVAR___IMDCoreSpotlightReindexer_deferralTime];
    *(_QWORD *)&v13[OBJC_IVAR___IMDCoreSpotlightReindexer_deferralTime] = a2;
    v16 = *MEMORY[0x1E0DEF490];
    v17 = sub_1ABC64390();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 104))(v15, v16, v17);
    v18 = objc_msgSend((id)objc_opt_self(), sel_seconds);
    sub_1ABC55218(0, (unint64_t *)&unk_1EEC3F870);
    sub_1ABC64294();
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v13[OBJC_IVAR___IMDCoreSpotlightReindexer_messageAge], v12, v9);
    *(_QWORD *)&v13[OBJC_IVAR___IMDCoreSpotlightReindexer_index] = a3;
    swift_unknownObjectRetain();

    v19.receiver = v13;
    v19.super_class = ObjectType;
    return objc_msgSendSuper2(&v19, sel_init);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1ABC54A20()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1ABC54A44()
{
  uint64_t v0;

  return sub_1ABC511E8(*(void **)(v0 + 16));
}

uint64_t sub_1ABC54A4C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1ABC54A5C()
{
  return swift_release();
}

uint64_t sub_1ABC54A64()
{
  return type metadata accessor for SpotlightReindexer();
}

uint64_t type metadata accessor for SpotlightReindexer()
{
  uint64_t result;

  result = qword_1EEC3F7F8;
  if (!qword_1EEC3F7F8)
    return swift_getSingletonMetadata();
  return result;
}

void sub_1ABC54AA8()
{
  unint64_t v0;
  unint64_t v1;

  sub_1ABC64390();
  if (v0 <= 0x3F)
  {
    sub_1ABC54B5C();
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for SpotlightReindexer()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SpotlightReindexer.__allocating_init(handles:batchDeferralTime:messageAge:index:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

void sub_1ABC54B5C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EEC3F828)
  {
    sub_1ABC55218(255, (unint64_t *)&unk_1EEC3F870);
    v0 = sub_1ABC642B8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EEC3F828);
  }
}

uint64_t sub_1ABC54BC0(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t aBlock[6];

  if (!IMDIsRunningInDatabaseServerProcess())
  {
    __break(1u);
LABEL_16:
    swift_once();
    goto LABEL_10;
  }
  v8 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v8 = a1 & 0xFFFFFFFFFFFFLL;
  if (v8)
  {
    v9 = HIBYTE(a4) & 0xF;
    if ((a4 & 0x2000000000000000) == 0)
      v9 = a3 & 0xFFFFFFFFFFFFLL;
    if (v9)
    {
      v10 = swift_allocObject();
      *(_QWORD *)(v10 + 16) = MEMORY[0x1E0DEE9D8];
      v11 = (_QWORD *)swift_allocObject();
      v11[2] = a1;
      v11[3] = a2;
      v11[4] = a3;
      v11[5] = a4;
      v11[6] = v10;
      aBlock[4] = (uint64_t)sub_1ABC55200;
      aBlock[5] = (uint64_t)v11;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_1ABC50A18;
      aBlock[3] = (uint64_t)&unk_1E5AC0D20;
      v12 = _Block_copy(aBlock);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_retain();
      swift_release();
      IMDPersistencePerformBlock(v12, 1);
      _Block_release(v12);
      swift_beginAccess();
      v13 = *(_QWORD *)(v10 + 16);
      swift_bridgeObjectRetain();
      swift_release();
      return v13;
    }
  }
  if (qword_1EEC3F858 != -1)
    goto LABEL_16;
LABEL_10:
  v14 = sub_1ABC64378();
  sub_1ABC4E6D8(v14, (uint64_t)qword_1EEC406C8);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v15 = sub_1ABC64360();
  v16 = sub_1ABC644F8();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = swift_slowAlloc();
    v18 = swift_slowAlloc();
    aBlock[0] = v18;
    *(_DWORD *)v17 = 136315394;
    swift_bridgeObjectRetain();
    sub_1ABC4F460(a1, a2, aBlock);
    sub_1ABC64558();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v17 + 12) = 2080;
    swift_bridgeObjectRetain();
    sub_1ABC4F460(a3, a4, aBlock);
    sub_1ABC64558();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1ABB60000, v15, v16, "Handle (%s) or service (%s) is empty", (uint8_t *)v17, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1AF435B7C](v18, -1, -1);
    MEMORY[0x1AF435B7C](v17, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  return MEMORY[0x1E0DEE9D8];
}

uint64_t sub_1ABC54F08()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_1ABC4DADC((uint64_t *)&unk_1EEC3F818);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);

  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

void sub_1ABC54F90()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(sub_1ABC4DADC((uint64_t *)&unk_1EEC3F818) - 8) + 80);
  sub_1ABC522CC(*(void **)(v0 + 24), *(_QWORD **)(v0 + 32), v0 + ((v1 + 40) & ~v1));
}

_OWORD *sub_1ABC54FD8(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1ABC54FE8()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1ABC5500C()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_1ABC55038()
{
  uint64_t v0;

  return sub_1ABC540A8(*(_QWORD *)(v0 + 16), *(id *)(v0 + 24));
}

unint64_t sub_1ABC55040()
{
  unint64_t result;

  result = qword_1EEC40290;
  if (!qword_1EEC40290)
  {
    result = MEMORY[0x1AF435B10](MEMORY[0x1E0CB1A70], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1EEC40290);
  }
  return result;
}

unint64_t sub_1ABC55084()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EEC402A0;
  if (!qword_1EEC402A0)
  {
    v1 = sub_1ABC55218(255, &qword_1EEC40298);
    result = MEMORY[0x1AF435B10](MEMORY[0x1E0DEFD08], v1);
    atomic_store(result, (unint64_t *)&qword_1EEC402A0);
  }
  return result;
}

uint64_t sub_1ABC550DC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_1ABC645DC();
  __break(1u);
  return result;
}

uint64_t sub_1ABC551CC()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

void sub_1ABC55200()
{
  sub_1ABC539A0();
}

uint64_t sub_1ABC55210(unint64_t a1)
{
  uint64_t v1;

  return sub_1ABC53D38(a1, v1);
}

uint64_t sub_1ABC55218(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_1ABC55250(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_1ABC4DB68(a2);
    result = MEMORY[0x1AF435B10](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

void sub_1ABC552C4()
{
  if (MEMORY[0x1E0C91D50])
  {
    sub_1ABC642DC();
    sub_1ABC5561C(MEMORY[0x1E0DEE9D8]);
    sub_1ABC64540();
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_1ABC553F8(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  id v5;
  uint64_t v7;
  id v8;

  v8 = a1;
  v1 = sub_1ABC6430C();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1ABC64450();
  sub_1ABC64450();
  sub_1ABC64450();
  sub_1ABC64300();
  v5 = v8;
  sub_1ABC552C4();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

void sub_1ABC55518(void *a1)
{
  id v2;

  sub_1ABC64450();
  sub_1ABC64450();
  v2 = a1;
  if (MEMORY[0x1E0C91D50])
  {
    sub_1ABC5561C(MEMORY[0x1E0DEE9D8]);
    sub_1ABC64540();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

unint64_t sub_1ABC5561C(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  sub_1ABC4DADC(&qword_1EEC402A8);
  v2 = sub_1ABC645D0();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_1ABC557A8(v6, (uint64_t)&v15);
    v7 = v15;
    v8 = v16;
    result = sub_1ABC55744(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_1ABC54FD8(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_1ABC55744(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1ABC64618();
  sub_1ABC64468();
  v4 = sub_1ABC64624();
  return sub_1ABC557F0(a1, a2, v4);
}

uint64_t sub_1ABC557A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1ABC4DADC(&qword_1EEC402B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_1ABC557F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1ABC64600() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_1ABC64600() & 1) == 0);
    }
  }
  return v6;
}

id IMDPersistenceHelloWorldClass.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id IMDPersistenceHelloWorldClass.init()()
{
  char *v0;
  uint64_t v1;
  id v2;
  char *v3;
  objc_super v5;

  v1 = OBJC_IVAR___IMDPersistenceHelloWorldClass_Impl_inner;
  v2 = objc_allocWithZone((Class)sub_1ABC64348());
  v3 = v0;
  *(_QWORD *)&v0[v1] = objc_msgSend(v2, sel_init);

  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for IMDPersistenceHelloWorldClass();
  return objc_msgSendSuper2(&v5, sel_init);
}

uint64_t type metadata accessor for IMDPersistenceHelloWorldClass()
{
  return objc_opt_self();
}

uint64_t sub_1ABC55A0C()
{
  return sub_1ABC6433C();
}

id IMDPersistenceHelloWorldClass.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IMDPersistenceHelloWorldClass();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for IMDPersistenceHelloWorldClass()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of IMDPersistenceHelloWorldClass.printGreeting()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x58))();
}

uint64_t initializeBufferWithCopyOfBuffer for IMDPersistenceHelloWorld(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1ABC64330();
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t destroy for IMDPersistenceHelloWorld(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1ABC64330();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for IMDPersistenceHelloWorld(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1ABC64330();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for IMDPersistenceHelloWorld(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1ABC64330();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for IMDPersistenceHelloWorld(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1ABC64330();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for IMDPersistenceHelloWorld(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1ABC64330();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for IMDPersistenceHelloWorld()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1ABC55C6C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1ABC64330();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for IMDPersistenceHelloWorld()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1ABC55CB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1ABC64330();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t type metadata accessor for IMDPersistenceHelloWorld()
{
  uint64_t result;

  result = qword_1EEC402C0;
  if (!qword_1EEC402C0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1ABC55D30()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1ABC64330();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1ABC55D98()
{
  uint64_t v0;

  v0 = sub_1ABC64378();
  sub_1ABC4E740(v0, qword_1EEC406C8);
  sub_1ABC4E6D8(v0, (uint64_t)qword_1EEC406C8);
  sub_1ABC64354();
  return sub_1ABC6436C();
}

id static NSXPCInterface.messagesRemoteDatabase.getter()
{
  return objc_msgSend((id)objc_opt_self(), sel_interfaceWithProtocol_, &unk_1EEC4A8D0);
}

void sub_1ABC55E40(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1ABB60000, log, OS_LOG_TYPE_ERROR, "Nil or empty path parameter", v1, 2u);
}

void sub_1ABC55E80(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_1ABB60000, a3, OS_LOG_TYPE_ERROR, "Failed to get file size for item at path: %@, with error: %@", (uint8_t *)&v6, 0x16u);

}

void sub_1ABC55F30(uint64_t a1, void *a2, NSObject *a3)
{
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = 138412546;
  v5 = a1;
  v6 = 2112;
  v7 = objc_msgSend(a2, "localizedDescription");
  _os_log_error_impl(&dword_1ABB60000, a3, OS_LOG_TYPE_ERROR, "Downgraded database SQL query '%@' got error: '%@'", (uint8_t *)&v4, 0x16u);
}

void sub_1ABC55FCC(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  sub_1ABB6D4D8(&dword_1ABB60000, a3, (uint64_t)a3, "Failed to get total row count for table %{public}@: %@", (uint8_t *)&v3);
}

void sub_1ABC56048(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 136446466;
  v4 = "-[IMDDatabase(Database) fetchCountOfRecordType:completionHandler:]";
  v5 = 2048;
  v6 = a1;
  sub_1ABB6D4D8(&dword_1ABB60000, a2, a3, "%{public}s: Unknown record type %lld", (uint8_t *)&v3);
}

void sub_1ABC560C8(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1ABB60000, log, OS_LOG_TYPE_ERROR, "IMDContactCache: Error! being called in a process that is not in IMDPersistenceAgent!", v1, 2u);
}

void sub_1ABC56108(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a2, a3, "Unable to select rows from Message PTask Table: %@", a5, a6, a7, a8, 2u);
}

void sub_1ABC56174(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a2, a3, "Unable to delete completed task from Message PTask Table: %@", a5, a6, a7, a8, 2u);
}

void sub_1ABC561E0(_QWORD *a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  sub_1ABB73220();
  sub_1ABB731F0(&dword_1ABB60000, v1, v2, "Failed to save client state from previous manager %@: %@", (_QWORD)v3, DWORD2(v3));
  sub_1ABB7320C();
}

void sub_1ABC5624C(_QWORD *a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  sub_1ABB73220();
  sub_1ABB731F0(&dword_1ABB60000, v1, v2, "Failed to read client state from previous manager %@: %@", (_QWORD)v3, DWORD2(v3));
  sub_1ABB7320C();
}

void sub_1ABC562B8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1ABB73214();
  sub_1ABB731E0(&dword_1ABB60000, v0, v1, "Simulating error during fetch due to defaults", v2, v3, v4, v5, v6);
  sub_1ABB73204();
}

void sub_1ABC562E4(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  sub_1ABB73220();
  sub_1ABB731F0(&dword_1ABB60000, v1, v2, "Failed to parse client state. generating a new one! error %@ data %@", (_QWORD)v3, DWORD2(v3));
  sub_1ABB7320C();
}

void sub_1ABC5634C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1ABB73214();
  sub_1ABB731E0(&dword_1ABB60000, v0, v1, "Couldn't open Spotlight index to save client state", v2, v3, v4, v5, v6);
  sub_1ABB73204();
}

void sub_1ABC56378(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a2, a3, "Failed to serialize client state: %@", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC563DC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1ABB73214();
  sub_1ABB731E0(&dword_1ABB60000, v0, v1, "Simulating error during save due to defaults", v2, v3, v4, v5, v6);
  sub_1ABB73204();
}

void sub_1ABC56408(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a2, a3, "Failed to save client state: %@", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC56470()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC5650C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: Condition is unexpectedly true: %s in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC565A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: Condition is unexpectedly true: %s in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC56644()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC566E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: Condition is unexpectedly true: %s in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC5677C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: Condition is unexpectedly true: %s in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC56818()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: Condition is unexpectedly true: %s in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC568B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: Condition is unexpectedly true: %s in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC56950()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC569EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC56A88()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC56B24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC56BC0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC56C5C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC56CF8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC56D94()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC56E30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC56ECC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC56F68()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC57004()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: Condition is unexpectedly true: %s in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC570A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC5713C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: Condition is unexpectedly true: %s in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC571D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: Condition is unexpectedly true: %s in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC57274()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC57310()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC573AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: Condition is unexpectedly true: %s in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC57448()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: Condition is unexpectedly true: %s in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC574E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC57580()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC5761C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB871F0(&dword_1ABB60000, a2, a3, "This method should not be called %@ the notification queue because it may lead to long blocking of other requests.", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC57698()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1ABB871D8();
  sub_1ABB6FF10(&dword_1ABB60000, v0, v1, "Failed to create IMItem from IMMessageRecord: %@", v2, v3, v4, v5, v6);
  sub_1ABB7320C();
}

void sub_1ABC576F8()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  sub_1ABB871D8();
  sub_1ABB871E4(&dword_1ABB60000, v0, v1, "Not generating notification for participantChangeItem from myself: %@", v2);
  sub_1ABB7320C();
}

void sub_1ABC5775C(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "chatRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1ABB871D8();
  _os_log_error_impl(&dword_1ABB60000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch chat for chatRecord: %@", v4, 0xCu);

  sub_1ABB87200();
}

void sub_1ABC577E8(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  sub_1ABB871E4(&dword_1ABB60000, a3, (uint64_t)a3, "Not generating notification because chat %@ doesn't have scheduled messages in it", (uint8_t *)a2);

}

void sub_1ABC57834(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "changeType");
  sub_1ABB871D8();
  sub_1ABB871E4(&dword_1ABB60000, a2, v3, "Not generating notification for participantChangeItem with changeType: %lld", v4);
  sub_1ABB87200();
}

void sub_1ABC578A8(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  uint8_t v7[12];
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1ABB871D8();
  v8 = 2112;
  v9 = a2;
  sub_1ABB6D4D8(&dword_1ABB60000, a3, v6, "Error posting notification request %@. Error: %@", v7);

}

void sub_1ABC57950(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  sub_1ABB6D4D8(&dword_1ABB60000, a3, (uint64_t)a3, "Error updating edited message content for notification request %@. Error: %@", (uint8_t *)&v4);
  sub_1ABB7320C();
}

void sub_1ABC579CC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1ABB871D8();
  sub_1ABB6FF10(&dword_1ABB60000, v0, v1, "We don't have a chat identifier to set as the thread identifier for chat dictionary %@", v2, v3, v4, v5, v6);
  sub_1ABB7320C();
}

void sub_1ABC57A2C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1ABB871D8();
  sub_1ABB6FF10(&dword_1ABB60000, v0, v1, "We don't have a message guid for message dictionary %@", v2, v3, v4, v5, v6);
  sub_1ABB7320C();
}

void sub_1ABC57A8C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1ABB871D8();
  sub_1ABB6FF10(&dword_1ABB60000, v0, v1, "Not synthesizing notification content from intent, contentByUpdatingWithProvider returned error %@", v2, v3, v4, v5, v6);
  sub_1ABB7320C();
}

void sub_1ABC57AEC(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1ABB60000, log, OS_LOG_TYPE_ERROR, "Could not create emoji image text attachment for attachment record", buf, 2u);
}

void sub_1ABC57B28()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1ABB871D8();
  sub_1ABB871F0(&dword_1ABB60000, v0, v1, "Caught exception generating notification %@", v2, v3, v4, v5, v6);
  sub_1ABB7320C();
}

void sub_1ABC57B88()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1ABB73214();
  sub_1ABB731E0(&dword_1ABB60000, v0, v1, "Could not find transferGUID for sticker tapback", v2, v3, v4, v5, v6);
  sub_1ABB73204();
}

void sub_1ABC57BB4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1ABB73214();
  sub_1ABB731E0(&dword_1ABB60000, v0, v1, "Could not find attachmentRecord for sticker tapback", v2, v3, v4, v5, v6);
  sub_1ABB73204();
}

void sub_1ABC57BE0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1ABB73214();
  sub_1ABB731E0(&dword_1ABB60000, v0, v1, "Could not find transferGUID for removed sticker tapback", v2, v3, v4, v5, v6);
  sub_1ABB73204();
}

void sub_1ABC57C0C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1ABB73214();
  sub_1ABB731E0(&dword_1ABB60000, v0, v1, "Could not find associatedMessageEmoji for removed emoji tapback", v2, v3, v4, v5, v6);
  sub_1ABB73204();
}

void sub_1ABC57C38()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1ABB73214();
  sub_1ABB731E0(&dword_1ABB60000, v0, v1, "Could not find associatedMessageEmoji for emoji tapback", v2, v3, v4, v5, v6);
  sub_1ABB73204();
}

void sub_1ABC57C64(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *SOSLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("IMDNotificationsController.m"), 96, CFSTR("%s"), *a1);

  __break(1u);
}

void sub_1ABC57CE0()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getSOSUtilitiesClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("IMDNotificationsController.m"), 97, CFSTR("Unable to find class %s"), "SOSUtilities");

  __break(1u);
}

void sub_1ABC57D58(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *SafetyMonitorLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("IMDNotificationsController.m"), 83, CFSTR("%s"), *a1);

  __break(1u);
}

void sub_1ABC57DD4()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getSMMessageClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("IMDNotificationsController.m"), 84, CFSTR("Unable to find class %s"), "SMMessage");

  __break(1u);
}

void sub_1ABC57E4C(uint64_t a1, NSObject *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = IMDSqlOperationErrorDescription(a1);
  _os_log_error_impl(&dword_1ABB60000, a2, OS_LOG_TYPE_ERROR, "SQL ERROR: %@", (uint8_t *)&v3, 0xCu);
}

void sub_1ABC57ED4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC57F70()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC5800C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC580A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC58144(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB731E0(&dword_1ABB60000, a1, a3, "No handles or services specified. Or handleCount != serviceCount. No rows will be returned.", a5, a6, a7, a8, 0);
}

void sub_1ABC58178()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  sub_1ABB8EAA4();
  sub_1ABB8EA9C(v0);
  sub_1ABB8EA8C();
  sub_1ABB8EA7C();
  sub_1ABB8EA5C();
  sub_1ABB8EA48(&dword_1ABB60000, v1, v2, "ASSERTION FAILED: Condition is unexpectedly true: %s in \"%s\" at line %d [%@]", v3, v4, v5, v6, v7, v8, 2u);
  sub_1ABB8EA70();
}

void sub_1ABC58218()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  sub_1ABB8EAA4();
  sub_1ABB8EA9C(v0);
  sub_1ABB8EA8C();
  sub_1ABB8EA7C();
  sub_1ABB8EA5C();
  sub_1ABB8EA48(&dword_1ABB60000, v1, v2, "ASSERTION FAILED: Condition is unexpectedly true: %s in \"%s\" at line %d [%@]", v3, v4, v5, v6, v7, v8, 2u);
  sub_1ABB8EA70();
}

void sub_1ABC582B8()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  sub_1ABB8EAA4();
  sub_1ABB8EA9C(v0);
  sub_1ABB8EA8C();
  sub_1ABB8EA7C();
  sub_1ABB8EA5C();
  sub_1ABB8EA48(&dword_1ABB60000, v1, v2, "ASSERTION FAILED: Condition is unexpectedly true: %s in \"%s\" at line %d [%@]", v3, v4, v5, v6, v7, v8, 2u);
  sub_1ABB8EA70();
}

void sub_1ABC58358()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  sub_1ABB8EAA4();
  sub_1ABB8EA9C(v0);
  sub_1ABB8EA8C();
  sub_1ABB8EA7C();
  sub_1ABB8EA5C();
  sub_1ABB8EA48(&dword_1ABB60000, v1, v2, "ASSERTION FAILED: Condition is unexpectedly true: %s in \"%s\" at line %d [%@]", v3, v4, v5, v6, v7, v8, 2u);
  sub_1ABB8EA70();
}

void sub_1ABC583F8(int a1, NSObject *a2)
{
  _DWORD v2[2];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109376;
  v2[1] = a1;
  v3 = 1024;
  v4 = 18016;
  _os_log_error_impl(&dword_1ABB60000, a2, OS_LOG_TYPE_ERROR, "Database version is newer, but internal build allows this state (dbver %d, expected %d)", (uint8_t *)v2, 0xEu);
}

void sub_1ABC5847C(os_log_t log)
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 67109120;
  v1[1] = 18016;
  _os_log_error_impl(&dword_1ABB60000, log, OS_LOG_TYPE_ERROR, "Unable to perform database migration to %d - NO MIGRATOR FOUND", (uint8_t *)v1, 8u);
}

void sub_1ABC584F8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB731E0(&dword_1ABB60000, a1, a3, "No chatIdentifiers or lastAddressedLabelIDsCount provided. No rows will be returned.", a5, a6, a7, a8, 0);
}

void sub_1ABC5852C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1ABB96334(*MEMORY[0x1E0C80C00]);
  sub_1ABB96328();
  sub_1ABB6FF10(&dword_1ABB60000, v0, v1, "Unable to find last addressed lablID & date from chat identifiers: %@", v2, v3, v4, v5, v6);
  sub_1ABB7320C();
}

void sub_1ABC5858C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB731E0(&dword_1ABB60000, a1, a3, "No chatIdentifiers or lastAddressedHandles provided. No rows will be returned.", a5, a6, a7, a8, 0);
}

void sub_1ABC585C0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1ABB96334(*MEMORY[0x1E0C80C00]);
  sub_1ABB96328();
  sub_1ABB6FF10(&dword_1ABB60000, v0, v1, "Unable to find last addressed handles & date from chat identifiers: %@", v2, v3, v4, v5, v6);
  sub_1ABB7320C();
}

void sub_1ABC58620()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: Condition is unexpectedly true: %s in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC586C4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1ABB96334(*MEMORY[0x1E0C80C00]);
  sub_1ABB96328();
  sub_1ABB6FF10(&dword_1ABB60000, v0, v1, "Unable to select rows from Message Deleted Messages Table: %@", v2, v3, v4, v5, v6);
  sub_1ABB7320C();
}

void sub_1ABC58724()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1ABB96334(*MEMORY[0x1E0C80C00]);
  sub_1ABB96328();
  sub_1ABB6FF10(&dword_1ABB60000, v0, v1, "Unable to update messages to new error (%@)", v2, v3, v4, v5, v6);
  sub_1ABB7320C();
}

void sub_1ABC58784(NSObject *a1)
{
  __int16 v2;
  uint64_t v3;
  int v4[3];
  const char *v5;
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  v4[0] = 136316162;
  sub_1ABB743D0();
  v5 = "0";
  v6 = v2;
  v7 = "CFStringRef kIMDChatRemapMessagesWithErrorCodeToErrorCode(int)";
  v8 = 1024;
  v9 = 1562;
  v10 = 2112;
  v11 = v3;
  _os_log_error_impl(&dword_1ABB60000, a1, OS_LOG_TYPE_ERROR, "ASSERTION FAILED: Conditions are unexpectedly equal: %s == %s in \"%s\" at line %d [%@]", (uint8_t *)v4, 0x30u);
}

void sub_1ABC58860()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC58908(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_1ABB60000, a2, OS_LOG_TYPE_ERROR, "Too many items queued for donation, purging first %llu to make room", (uint8_t *)&v2, 0xCu);
}

void sub_1ABC5897C(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(*(id *)(a1 + 32), "count");
  v6 = 134218242;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_1ABB60000, a3, OS_LOG_TYPE_ERROR, "Failed to donate %llu interactions: %@", (uint8_t *)&v6, 0x16u);
}

void sub_1ABC58A18(NSObject *a1)
{
  int v2;
  const char *v3;
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = 136315906;
  v3 = "op == nil || op->connection == nil || op->database == nil";
  v4 = 2080;
  v5 = "void IMDSqlOperationWasInitialized(IMDSqlOperation *)";
  v6 = 1024;
  v7 = 77;
  v8 = 2112;
  v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  _os_log_error_impl(&dword_1ABB60000, a1, OS_LOG_TYPE_ERROR, "ASSERTION FAILED: Condition is unexpectedly true: %s in \"%s\" at line %d [%@]", (uint8_t *)&v2, 0x26u);
}

void sub_1ABC58AE8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  IMDSqlOperationErrorDescription(a2);
  sub_1ABB992C0();
  sub_1ABB992AC(&dword_1ABB60000, v2, v3, "Failed to create table %@ with error %@", v4, v5, v6, v7, v8);
  sub_1ABB87200();
}

void sub_1ABC58B60(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  IMDSqlOperationErrorDescription(a2);
  sub_1ABB992C0();
  sub_1ABB992AC(&dword_1ABB60000, v2, v3, "Failed to drop table %@ with error %@", v4, v5, v6, v7, v8);
  sub_1ABB87200();
}

void sub_1ABC58BD8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC58C74()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC58D10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC58DAC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC58E48()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC58EE4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC58F80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC5901C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC590B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC59154()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC591F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC5928C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC59328()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC593C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC59460()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC594FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC59598()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC59634()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC596D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC59770()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: Condition is unexpectedly true: %s in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC5980C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CSDBSqliteDatabaseConnectionForWriting returned a nil CSDBSqliteConnection"));
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC598AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("IMDSharedSqliteDatabase() should not be nil"));
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC59948(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "NULL message passed to %s", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC599B8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "NULL message passed to %s", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC59A28(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "NULL message passed to %s", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC59A98(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "NULL message passed to %s", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC59B08(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "NULL message passed to %s", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC59B78(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "NULL message passed to %s", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC59BE8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "NULL message passed to %s", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC59C58(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "NULL message passed when trying to get property: %ld", a5, a6, a7, a8, 0);
  sub_1ABB7320C();
}

void sub_1ABC59CC4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABBA3284(&dword_1ABB60000, a2, a3, "NULL message passed when trying to set property: %ld  (value:%d)", a5, a6, a7, a8, 0);
  sub_1ABB7320C();
}

void sub_1ABC59D3C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "NULL message passed to %s", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC59DAC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "NULL message passed to %s", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC59E1C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "NULL message passed to %s", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC59E8C(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1ABB60000, log, OS_LOG_TYPE_ERROR, "Remote set other handle not implemented", v1, 2u);
}

void sub_1ABC59ECC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABBA3284(&dword_1ABB60000, a2, a3, "Error adding attachment join: %d (%s)", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC59F44(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "NULL message passed to %s", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC59FB4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "NULL message passed to %s", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC5A024(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "NULL dictionary passed to %s", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC5A094(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "NULL record passed to %s", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC5A104(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "NULL handle passed to %s", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC5A174(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "NULL handle passed to %s", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC5A1E4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "NULL handle passed to %s", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC5A254(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "NULL handle passed to %s", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC5A2C4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "NULL handle passed to %s", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC5A334(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "NULL handle passed to %s", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC5A3A4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "NULL dictionary passed to %s", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC5A414(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "NULL record passed to %s", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC5A484()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  sub_1ABB871D8();
  sub_1ABBAC9AC(&dword_1ABB60000, v0, v1, "CloudSync.message | Update status Query success for: %@", v2);
  sub_1ABB7320C();
}

void sub_1ABC5A4E8(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1ABB871D8();
  sub_1ABBAC9AC(&dword_1ABB60000, a2, v4, "CloudSync.message | Query returned an error: %@", v5);

  sub_1ABB87200();
}

void sub_1ABC5A568(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a2, "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1ABBAC99C();
  sub_1ABB992AC(&dword_1ABB60000, v3, v4, "CloudSync.message | Failed to update ck_sync_state for recordIDs: %@ with error: %@", v5, v6, v7, v8, 2u);

  sub_1ABBAC9B8();
}

void sub_1ABC5A5F4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1ABB73214();
  sub_1ABB731E0(&dword_1ABB60000, v0, v1, "originalMessageItem was nil when attempting to update a message", v2, v3, v4, v5, v6);
  sub_1ABB73204();
}

void sub_1ABC5A620()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1ABB73214();
  sub_1ABB731E0(&dword_1ABB60000, v0, v1, "newMessageItem was nil when attempting to update a message", v2, v3, v4, v5, v6);
  sub_1ABB73204();
}

void sub_1ABC5A64C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1ABB73214();
  sub_1ABB731E0(&dword_1ABB60000, v0, v1, "newSyndicationRange was nil when attempting to update a message", v2, v3, v4, v5, v6);
  sub_1ABB73204();
}

void sub_1ABC5A678(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "-[IMDDatabase(Messages) updateAttachmentSyndicationRanges:shouldHideFromSyndication:]";
  sub_1ABBAC9AC(&dword_1ABB60000, a1, a3, "%s Tried to remove nil attachment GUID from syndication", (uint8_t *)&v3);
  sub_1ABB7320C();
}

void sub_1ABC5A6EC()
{
  NSObject *v0;
  uint64_t v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[IMDDatabase(Messages) updateAttachmentSyndicationRanges:shouldHideFromSyndication:]";
  sub_1ABBAC99C();
  sub_1ABB6D4D8(&dword_1ABB60000, v0, v1, "%s Could not derive message GUID from attachment GUID %@", (uint8_t *)&v2);
  sub_1ABB7320C();
}

void sub_1ABC5A760()
{
  NSObject *v0;
  uint64_t v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[IMDDatabase(Messages) updateAttachmentSyndicationRanges:shouldHideFromSyndication:]";
  sub_1ABBAC99C();
  sub_1ABB6D4D8(&dword_1ABB60000, v0, v1, "%s Could not derive message item from attachment GUID %@", (uint8_t *)&v2);
  sub_1ABB7320C();
}

void sub_1ABC5A7D4()
{
  NSObject *v0;
  int v1[10];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 136315650;
  sub_1ABBAC9D4();
  sub_1ABBAC9C8(&dword_1ABB60000, v0, (uint64_t)v0, "%s Message record was nil for attachment GUID %@, messageGUID %@", (uint8_t *)v1);
}

void sub_1ABC5A84C(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "fileTransferGUIDs");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1ABBAC99C();
  sub_1ABB992AC(&dword_1ABB60000, v2, v3, "%s messageItem.fileTransferGUIDs for failing messageItem: %@", v4, v5, v6, v7, 2u);

  sub_1ABB87200();
}

void sub_1ABC5A8D8()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int v5[5];
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  sub_1ABBACA04();
  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v1, "fileTransferGUIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "count");
  v5[0] = 136315650;
  sub_1ABBACA20();
  v6 = 2048;
  v7 = v3;
  sub_1ABBAC9C8(&dword_1ABB60000, v0, v4, "%s Could not derive actual attachment GUID from given attachment GUID %@, messageItem.fileTransferGUIDs.count: %lu", (uint8_t *)v5);

  sub_1ABBACA10();
}

void sub_1ABC5A980()
{
  NSObject *v0;
  int v1[10];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 136315650;
  sub_1ABBAC9D4();
  sub_1ABBAC9C8(&dword_1ABB60000, v0, (uint64_t)v0, "%s IMItem was not an IMMessageItem for attachment GUID %@, messageGUID %@", (uint8_t *)v1);
}

void sub_1ABC5A9F8(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "-[IMDDatabase(Messages) _updateMessageItemSyndicationRanges:messagePartDescriptor:shouldHideFromSyndication:]";
  sub_1ABBAC9AC(&dword_1ABB60000, a1, a3, "%s Tried to update syndicationRanges on nil messageItem", (uint8_t *)&v3);
  sub_1ABB7320C();
}

void sub_1ABC5AA6C(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "-[IMDDatabase(Messages) _updateMessageItemSyndicationRanges:messagePartDescriptor:shouldHideFromSyndication:]";
  sub_1ABBAC9AC(&dword_1ABB60000, a1, a3, "%s Tried to update syndicationRanges on nil messagePart", (uint8_t *)&v3);
  sub_1ABB7320C();
}

void sub_1ABC5AAE0(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "guid");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1ABBAC99C();
  sub_1ABB992AC(&dword_1ABB60000, v2, v3, "%s Tried to update syndication range for message GUID %@ with zeroed message range", v4, v5, v6, v7, 2u);

  sub_1ABB87200();
}

void sub_1ABC5AB6C(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "+[IMDDatabase(Messages) _newSyndicationRangeForCMMMessageItem:syndicationIdentifier:shouldHideFromSyndication:]";
  sub_1ABBAC9AC(&dword_1ABB60000, a1, a3, "%s Tried to update CMM syndicationRanges on nil messageItem", (uint8_t *)&v3);
  sub_1ABB7320C();
}

void sub_1ABC5ABE0(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "guid");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1ABBAC99C();
  sub_1ABB992AC(&dword_1ABB60000, v2, v3, "%s No file transfer guids when updating CMM syndicationRanges on message %@", v4, v5, v6, v7, 2u);

  sub_1ABB87200();
}

void sub_1ABC5AC6C()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  sub_1ABB871D8();
  v3 = 2048;
  v4 = v0;
  sub_1ABB6D4D8(&dword_1ABB60000, v1, (uint64_t)v1, "cmmAssetOffset %llu is greater than the number of file transfers %llu", v2);
  sub_1ABB7320C();
}

void sub_1ABC5ACE0(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "guid");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1ABBAC99C();
  sub_1ABB992AC(&dword_1ABB60000, v2, v3, "%s No valid CMM assets present for message %@", v4, v5, v6, v7, 2u);

  sub_1ABB87200();
}

void sub_1ABC5AD6C(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "guid");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1ABBAC99C();
  sub_1ABB992AC(&dword_1ABB60000, v2, v3, "%s No file transfer guids present for message %@", v4, v5, v6, v7, 2u);

  sub_1ABB87200();
}

void sub_1ABC5ADF8()
{
  NSObject *v0;
  id v1;
  void *v2;
  __int16 v3;
  uint64_t v4;
  uint64_t v5;
  int v6[5];
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  sub_1ABBACA04();
  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v1, "guid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = 136315650;
  sub_1ABBACA20();
  v7 = v3;
  v8 = v4;
  sub_1ABBAC9C8(&dword_1ABB60000, v0, v5, "%s Did not find a valid range for attachment GUID %@ and message %@", (uint8_t *)v6);

  sub_1ABBACA10();
}

void sub_1ABC5AE98(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "-[IMDDatabase(Messages) updateMessageSyndicationRanges:shouldHideFromSyndication:]";
  sub_1ABBAC9AC(&dword_1ABB60000, a1, a3, "%s Tried to syndication ranges for nil message GUID", (uint8_t *)&v3);
  sub_1ABB7320C();
}

void sub_1ABC5AF0C()
{
  NSObject *v0;
  uint64_t v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[IMDDatabase(Messages) updateMessageSyndicationRanges:shouldHideFromSyndication:]";
  sub_1ABBAC99C();
  sub_1ABB6D4D8(&dword_1ABB60000, v0, v1, "%s Message record was nil for messageGUID %@", (uint8_t *)&v2);
  sub_1ABB7320C();
}

void sub_1ABC5AF80()
{
  NSObject *v0;
  uint64_t v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[IMDDatabase(Messages) updateMessageSyndicationRanges:shouldHideFromSyndication:]";
  sub_1ABBAC99C();
  sub_1ABB6D4D8(&dword_1ABB60000, v0, v1, "%s Could not load message item for message GUID %@", (uint8_t *)&v2);
  sub_1ABB7320C();
}

void sub_1ABC5AFF4(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = 136315650;
  v7 = "-[IMDDatabase(Messages) updateMessageSyndicationRanges:shouldHideFromSyndication:]";
  v8 = 2048;
  v9 = objc_msgSend(a1, "partNumber");
  v10 = 2112;
  v11 = a2;
  sub_1ABBAC9C8(&dword_1ABB60000, a3, v5, "%s Could not load message part %ld for message GUID %@", (uint8_t *)&v6);
}

void sub_1ABC5B09C()
{
  NSObject *v0;
  uint64_t v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[IMDDatabase(Messages) updateMessageSyndicationRanges:shouldHideFromSyndication:]";
  sub_1ABBAC99C();
  sub_1ABB6D4D8(&dword_1ABB60000, v0, v1, "%s IMItem was not an IMMessageItem for messageGUID %@", (uint8_t *)&v2);
  sub_1ABB7320C();
}

void sub_1ABC5B110()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  sub_1ABB871D8();
  sub_1ABBAC9AC(&dword_1ABB60000, v0, v1, "CloudSync.message | Update synced syndication ranges Query success for: %@", v2);
  sub_1ABB7320C();
}

void sub_1ABC5B174(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1ABB871D8();
  sub_1ABBAC9AC(&dword_1ABB60000, a2, v4, "CloudSync.message | Update synced syndication ranges Query returned an error: %@", v5);

  sub_1ABB87200();
}

void sub_1ABC5B1F4(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a2, "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1ABBAC99C();
  sub_1ABB992AC(&dword_1ABB60000, v3, v4, "CloudSync.message | Failed to update synced syndication ranges for recordIDs: %@ with error: %@", v5, v6, v7, v8, 2u);

  sub_1ABBAC9B8();
}

void sub_1ABC5B280(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1ABB871D8();
  sub_1ABBAC9AC(&dword_1ABB60000, a2, v4, "Recently Deleted | Query returned an error: %@", v5);

  sub_1ABB87200();
}

void sub_1ABC5B304(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend((id)sub_1ABBACA34(a1, a2), "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *v3 = 138412290;
  *v2 = v4;
  sub_1ABBAC9F0(&dword_1ABB60000, v5, v6, "Recently Deleted | Failed to remove entries from chat_message_join: %@");

  sub_1ABBACA48();
}

void sub_1ABC5B354()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_1ABBACA04();
  objc_msgSend(v0, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1ABBAC99C();
  sub_1ABB992AC(&dword_1ABB60000, v2, v3, "Recently Deleted | Insert to recoverable message table failed for message guid %@: %@", v4, v5, v6, v7, 2u);

  sub_1ABBAC9B8();
}

void sub_1ABC5B3E0(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1ABB871D8();
  sub_1ABBAC9AC(&dword_1ABB60000, a2, v4, "Recently Deleted | Query returned an error: %@", v5);

  sub_1ABB87200();
}

void sub_1ABC5B464()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_1ABBACA04();
  objc_msgSend(v0, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1ABBAC99C();
  sub_1ABB992AC(&dword_1ABB60000, v2, v3, "Recently Deleted | Parts: Permanent recoverable message part deletion failed for chat guid %@: %@", v4, v5, v6, v7, 2u);

  sub_1ABBAC9B8();
}

void sub_1ABC5B4F0()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_1ABBACA04();
  objc_msgSend(v0, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1ABBAC99C();
  sub_1ABB992AC(&dword_1ABB60000, v2, v3, "Recently Deleted | Permanent recoverable message deletion failed for chat guid %@: %@", v4, v5, v6, v7, 2u);

  sub_1ABBAC9B8();
}

void sub_1ABC5B57C(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend((id)sub_1ABBACA34(a1, a2), "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *v3 = 138412290;
  *v2 = v4;
  sub_1ABBAC9F0(&dword_1ABB60000, v5, v6, "Recently Deleted | Failed to add chat entry to unsynced_removed_recoverable_messages: %@");

  sub_1ABBACA48();
}

void sub_1ABC5B5CC()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_1ABBACA04();
  objc_msgSend(v0, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1ABBAC99C();
  sub_1ABB992AC(&dword_1ABB60000, v2, v3, "Junk Messages | Permanent junk message deletion failed for chat guid %@: %@", v4, v5, v6, v7, 2u);

  sub_1ABBAC9B8();
}

void sub_1ABC5B658()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1ABB73214();
  sub_1ABB731E0(&dword_1ABB60000, v0, v1, "Recently Deleted | Bailing:storeRecoverableMessagePartWithBody could not find part attribute name", v2, v3, v4, v5, v6);
  sub_1ABB73204();
}

void sub_1ABC5B684()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1ABB73214();
  sub_1ABB731E0(&dword_1ABB60000, v0, v1, "Recently Deleted | Bailing:storeRecoverableMessagePartWithBody message part body data is nil.", v2, v3, v4, v5, v6);
  sub_1ABB73204();
}

void sub_1ABC5B6B0(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1ABB871D8();
  sub_1ABBAC9AC(&dword_1ABB60000, a2, v4, "Recently Deleted | Query returned an error: %@", v5);

  sub_1ABB87200();
}

void sub_1ABC5B734()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  sub_1ABB871D8();
  sub_1ABBAC9AC(&dword_1ABB60000, v0, v1, "Recently Deleted | Bailing:storeRecoverableMessagePartWithBody Failed to encode message part body with exception: %@", v2);
  sub_1ABB7320C();
}

void sub_1ABC5B798(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1ABB871D8();
  sub_1ABBAC9AC(&dword_1ABB60000, a2, v4, "Recently Deleted | Query returned an error: %@", v5);

  sub_1ABB87200();
}

void sub_1ABC5B818(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1ABB871D8();
  sub_1ABBAC9AC(&dword_1ABB60000, a2, v4, "Recently Deleted | Failed with error: %@ clearing out message tombstones", v5);

  sub_1ABB87200();
}

void sub_1ABC5B898(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "%s originalError was nil, returning nil", a5, a6, a7, a8, 2u);
}

void sub_1ABC5B90C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a2, a3, "uniqueIdentifier not set for item: %@", a5, a6, a7, a8, 2u);
}

void sub_1ABC5B974(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
}

void sub_1ABC5B9B4(void *a1)
{

  objc_end_catch();
}

void sub_1ABC5B9D4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB731E0(&dword_1ABB60000, a1, a3, "Not donating INInteraction, interaction generated is nil", a5, a6, a7, a8, 0);
}

void sub_1ABC5BA08(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1ABB60000, a2, OS_LOG_TYPE_ERROR, "Error donating intent interaction = %@", (uint8_t *)&v2, 0xCu);
}

void sub_1ABC5BA7C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB731E0(&dword_1ABB60000, a1, a3, "messageDate was distant past. Not setting contentCreationDate on metadataAttributes.", a5, a6, a7, a8, 0);
}

void sub_1ABC5BAB0(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *LinkPresentationLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("IMDCoreSpotlightIndexers.m"), 56, CFSTR("%s"), *a1);

  __break(1u);
}

void sub_1ABC5BB2C()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getLPMapMetadataClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("IMDCoreSpotlightIndexers.m"), 57, CFSTR("Unable to find class %s"), "LPMapMetadata");

  __break(1u);
}

void sub_1ABC5BBA4()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class get_CDInteractionRecorderClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("IMDCoreSpotlight_CoreDuetDonation.m"), 37, CFSTR("Unable to find class %s"), "_CDInteractionRecorder");

  __break(1u);
}

void sub_1ABC5BC1C(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *CoreDuetLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("IMDCoreSpotlight_CoreDuetDonation.m"), 33, CFSTR("%s"), *a1);

  __break(1u);
}

void sub_1ABC5BC98()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class get_CDInteractionClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("IMDCoreSpotlight_CoreDuetDonation.m"), 36, CFSTR("Unable to find class %s"), "_CDInteraction");

  __break(1u);
}

void sub_1ABC5BD10()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class get_CDContactClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("IMDCoreSpotlight_CoreDuetDonation.m"), 35, CFSTR("Unable to find class %s"), "_CDContact");

  __break(1u);
}

void sub_1ABC5BD88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const __CFString *v4;
  __int16 v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = CFSTR("knownSender");
  v5 = 2080;
  v6 = "itemDictionary";
  sub_1ABB6D4D8(&dword_1ABB60000, MEMORY[0x1E0C81028], a3, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", (uint8_t *)&v3);
}

void sub_1ABC5BE18(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  sub_1ABB6D4D8(&dword_1ABB60000, a3, (uint64_t)a3, "Error fetching suggested name for handle \"%@\" Error: %@", (uint8_t *)&v4);
}

void sub_1ABC5BE98(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1ABB60000, log, OS_LOG_TYPE_ERROR, "No cached business name, using placeholder business name, will call interaction update handler if business name fetch completes", v1, 2u);
}

void sub_1ABC5BED8(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *DataDetectorsCoreLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("IMDCoreSpotlightIndexHelpers.m"), 71, CFSTR("%s"), *a1);

  __break(1u);
}

void sub_1ABC5BF54(float *a1, _DWORD *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  sub_1ABBCEDD0(a1, a2, 1.5047e-36);
  sub_1ABBCEDB4(&dword_1ABB60000, v2, v3, "[Database] ORPHAN: Failed to insert message. SQLite error was: %d", v4);
}

void sub_1ABC5BF88(int a1, NSObject *a2, uint64_t a3)
{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109120;
  v3[1] = a1;
  sub_1ABBCEDC4(&dword_1ABB60000, a2, a3, "[Database] ERROR: **** Failed ingesting legacy message with row ID: %d", (uint8_t *)v3);
}

void sub_1ABC5BFF4(NSObject *a1, uint64_t a2, uint64_t a3)
{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109120;
  v3[1] = 1;
  sub_1ABBCEDC4(&dword_1ABB60000, a1, a3, "[Database] ERROR: Failed to create new message row. SQLite error: %d", (uint8_t *)v3);
}

void sub_1ABC5C068(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  sub_1ABBCEE2C(a1, a2);
  sub_1ABBCEE08(&dword_1ABB60000, v2, v3, "[Database] Bailing early on a problematic message.", v4);
}

void sub_1ABC5C090(float *a1, _DWORD *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  sub_1ABBCEDD0(a1, a2, 1.5047e-36);
  sub_1ABBCEDB4(&dword_1ABB60000, v2, v3, "[Database] ORPHAN: Failed to update message. SQLite error: %d", v4);
}

void sub_1ABC5C0C4(float *a1, _DWORD *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  sub_1ABBCEDD0(a1, a2, 1.5047e-36);
  sub_1ABBCEDB4(&dword_1ABB60000, v2, v3, "[Database] ORPHAN: Failed to create new attachment record. SQLite error: %d.", v4);
}

void sub_1ABC5C0F8(float *a1, _DWORD *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  sub_1ABBCEDD0(a1, a2, 1.5047e-36);
  sub_1ABBCEDB4(&dword_1ABB60000, v2, v3, "[Database] ERROR: Failed updating the filename on the new attachment record with SQLite result: %d", v4);
}

void sub_1ABC5C12C(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  sub_1ABBCEE2C(a1, a2);
  sub_1ABBCEE08(&dword_1ABB60000, v2, v3, "[Database] ERROR: Failed to write piece data to FS.", v4);
}

void sub_1ABC5C154(float *a1, _DWORD *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  sub_1ABBCEDD0(a1, a2, 1.5047e-36);
  sub_1ABBCEDB4(&dword_1ABB60000, v2, v3, "[Database] ERROR: Failed joining new attachment to message with SQLite result: %d", v4);
}

void sub_1ABC5C188(float *a1, _DWORD *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  sub_1ABBCEDD0(a1, a2, 1.5047e-36);
  sub_1ABBCEDB4(&dword_1ABB60000, v2, v3, "[Database] ERROR: Failed to create chat record. SQLite error: %d", v4);
}

void sub_1ABC5C1BC(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  sub_1ABBCEE2C(a1, a2);
  sub_1ABBCEE08(&dword_1ABB60000, v2, v3, "[Database] ERROR: * * * * * Holy Smokes, the group row id is bogus! * * * * * *", v4);
}

void sub_1ABC5C1E4(uint8_t *buf, _QWORD *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "Boolean __findOrCreateiMessageAttachmentsForLegacyGUID(CSDBSqliteConnection *, CFStringRef, int64_t)";
  _os_log_error_impl(&dword_1ABB60000, log, OS_LOG_TYPE_ERROR, "Invalid legacy guid provided in %s - this is bad but non-fatal.", buf, 0xCu);
}

void sub_1ABC5C230()
{
  uint64_t v0;
  os_log_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;

  sub_1ABBCEDE0();
  sub_1ABBCEE18(&dword_1ABB60000, v0, v1, "[Database] ERROR: Unable to bind chat id[%lld] to message id[%lld]: %d", v2, v3, v4);
}

void sub_1ABC5C294()
{
  uint64_t v0;
  os_log_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;

  sub_1ABBCEDE0();
  sub_1ABBCEE18(&dword_1ABB60000, v0, v1, "[Database] ERROR: Failed to join Handle [%lld] to Chat [%lld]. SQLite error: %d", v2, v3, v4);
}

void sub_1ABC5C2F8(uint64_t a1, int a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218240;
  v4 = a1;
  v5 = 1024;
  v6 = a2;
  _os_log_error_impl(&dword_1ABB60000, log, OS_LOG_TYPE_ERROR, "[Database] ERROR: Unable to set properties for chat[%lld]: %d", (uint8_t *)&v3, 0x12u);
}

void sub_1ABC5C37C(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218240;
  v4 = a1;
  v5 = 2048;
  v6 = a2;
  _os_log_error_impl(&dword_1ABB60000, log, OS_LOG_TYPE_ERROR, "[Database] ERROR: You tried to join chat [%lld] to group [%lld] with an invalid row id.", (uint8_t *)&v3, 0x16u);
}

void sub_1ABC5C400()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC5C49C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC5C538()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC5C5D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly NOT nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC5C670(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  IMDSqlOperationErrorDescription(a1);
  sub_1ABBCFE5C(&dword_1ABB60000, v1, v2, "Starting new query with pending error: : %@", v3, v4, v5, v6, 2u);
  sub_1ABB87200();
}

void sub_1ABC5C6E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC5C77C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly NOT nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC5C818()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC5C8B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC5C950()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC5C9EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC5CA88()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC5CB24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: Condition is unexpectedly true: %s in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC5CBC0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SQL operation results never read from statement"));
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: Condition is unexpectedly true: %s in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC5CC5C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC5CCF8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC5CD94()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC5CE30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("trying to commit transaction when we don't have one."));
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC5CECC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC5CF68()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC5D004()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Trying to revert transaction when we don't have one. This may mean we have a transaction open on this same sql_connection with another IMDSqlOperation"));
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC5D0A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC5D13C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC5D1D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC5D274(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1ABB60000, log, OS_LOG_TYPE_ERROR, "committing uncommitted transation", v1, 2u);
}

void sub_1ABC5D2B4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  IMDSqlOperationErrorDescription(a1);
  sub_1ABBCFE5C(&dword_1ABB60000, v1, v2, "reverting uncommitted transation with error: %@", v3, v4, v5, v6, 2u);
  sub_1ABB87200();
}

void sub_1ABC5D324()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC5D3C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC5D45C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC5D4F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC5D594()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC5D630(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "NULL chat passed to %s", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC5D6A0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "NULL chat passed to %s", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC5D710(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "NULL chat passed to %s", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC5D780(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "NULL chat passed to %s", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC5D7F0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "NULL chat passed to %s", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC5D860(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "NULL chat passed to %s", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC5D8D0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "%s can only be called from the server process", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC5D940(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "NULL chat passed to %s", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC5D9B0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "NULL chat passed to %s", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC5DA20(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "NULL chat passed to %s", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC5DA90(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "NULL chat passed to %s", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC5DB00()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC5DBAC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC5DC58(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "NULL chat passed to %s", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC5DCC8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "NULL chat passed to %s", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC5DD38(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "NULL dictionary passed to %s", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC5DDA8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "NULL record passed to %s", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC5DE18(void *a1, NSObject *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = objc_msgSend(a1, "localizedDescription");
  _os_log_error_impl(&dword_1ABB60000, a2, OS_LOG_TYPE_ERROR, "Sqlite3 Error: %@", (uint8_t *)&v3, 0xCu);
}

void sub_1ABC5DEA0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1ABB73214();
  sub_1ABB731E0(&dword_1ABB60000, v0, v1, "Can't start main timer, we're already profiling", v2, v3, v4, v5, v6);
  sub_1ABB73204();
}

void sub_1ABC5DECC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1ABB73214();
  sub_1ABB731E0(&dword_1ABB60000, v0, v1, "Unexpected nil key", v2, v3, v4, v5, v6);
  sub_1ABB73204();
}

void sub_1ABC5DEF8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1ABB871D8();
  sub_1ABB6FF10(&dword_1ABB60000, v0, v1, "Main timer not started, can't start timing: %@", v2, v3, v4, v5, v6);
  sub_1ABB7320C();
}

void sub_1ABC5DF58()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1ABB871D8();
  sub_1ABB6FF10(&dword_1ABB60000, v0, v1, "Trying to start a timing key that is already running: %@", v2, v3, v4, v5, v6);
  sub_1ABB7320C();
}

void sub_1ABC5DFB8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1ABB871D8();
  sub_1ABB6FF10(&dword_1ABB60000, v0, v1, "Main timer not started, can't stop timing: %@", v2, v3, v4, v5, v6);
  sub_1ABB7320C();
}

void sub_1ABC5E018()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1ABB871D8();
  sub_1ABB6FF10(&dword_1ABB60000, v0, v1, "Spotlight Indexer trying to stop an unknown timing key: %@", v2, v3, v4, v5, v6);
  sub_1ABB7320C();
}

void sub_1ABC5E078()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1ABB73214();
  sub_1ABB731E0(&dword_1ABB60000, v0, v1, "Bailing on profiling but we never started timing", v2, v3, v4, v5, v6);
  sub_1ABB73204();
}

void sub_1ABC5E0A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1ABB73214();
  sub_1ABB731E0(&dword_1ABB60000, v0, v1, "Already stopped profiling", v2, v3, v4, v5, v6);
  sub_1ABB73204();
}

void sub_1ABC5E0D0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1ABB73214();
  sub_1ABB731E0(&dword_1ABB60000, v0, v1, "ABORTED profiling after error", v2, v3, v4, v5, v6);
  sub_1ABB73204();
}

void sub_1ABC5E0FC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a2, a3, "failed to get a contact with handle %@ to save wallpaper", a5, a6, a7, a8, 2u);
}

void sub_1ABC5E164(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a2, a3, "error saving wallpaper to contact: %@", a5, a6, a7, a8, 2u);
}

void sub_1ABC5E1CC()
{
  os_log_t v0;
  uint8_t v1[16];

  sub_1ABB73214();
  _os_log_fault_impl(&dword_1ABB60000, v0, OS_LOG_TYPE_FAULT, "This method should be called on the spotlight queue because it may lead to long blocking of other requests or state corruption.", v1, 2u);
  sub_1ABB73204();
}

void sub_1ABC5E204()
{
  os_log_t v0;
  uint8_t v1[16];

  sub_1ABB73214();
  _os_log_debug_impl(&dword_1ABB60000, v0, OS_LOG_TYPE_DEBUG, "Skipping donation of message to SmartReplies due to nil text", v1, 2u);
  sub_1ABB73204();
}

void sub_1ABC5E23C()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  sub_1ABB73214();
  sub_1ABBE4888(&dword_1ABB60000, v0, v1, "No Core Spotlight index", v2);
  sub_1ABB73204();
}

void sub_1ABC5E26C()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  sub_1ABB73214();
  sub_1ABBE4888(&dword_1ABB60000, v0, v1, "No Collaboration metadata", v2);
  sub_1ABB73204();
}

void sub_1ABC5E29C(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = 0;
  v5 = 2112;
  v6 = a1;
  sub_1ABB6D4D8(&dword_1ABB60000, a2, a3, "Unable to archive collaboration Metadata %@, error %@", (uint8_t *)&v3);
  sub_1ABB7320C();
}

void sub_1ABC5E310(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "Invalid guid passed in. Skipping %s", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC5E380(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "Invalid guid passed in. Skipping %s", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC5E3F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1ABB871D8();
  sub_1ABB6FF10(&dword_1ABB60000, v0, v1, "Timed out indexing %@, likely have a hung thread, exiting!", v2, v3, v4, v5, v6);
  sub_1ABB7320C();
}

void sub_1ABC5E450()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  sub_1ABB73214();
  sub_1ABBE4888(&dword_1ABB60000, v0, v1, "Invalid ResolvedURL", v2);
  sub_1ABB73204();
}

void sub_1ABC5E480()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1ABB871D8();
  sub_1ABB6FF10(&dword_1ABB60000, v0, v1, "Invalid providerID: %@", v2, v3, v4, v5, v6);
  sub_1ABB7320C();
}

void sub_1ABC5E4E0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a2, a3, "Failed URL resolution with error %@", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC5E548(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(a2, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_1ABB60000, a4, OS_LOG_TYPE_ERROR, "Failed to unarchive Collaboration Metadata: %@. Not indexing this item.", a1, 0xCu);

}

void sub_1ABC5E5BC(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_1ABBCEE2C(a1, a2);
  sub_1ABBE4888(&dword_1ABB60000, v2, (uint64_t)v2, "Collaboration metadata has a nil collaboration identifier, which is needed for key diversification. Not indexing this item.", v3);
}

void sub_1ABC5E5E8(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_1ABBCEE2C(a1, a2);
  sub_1ABBE4888(&dword_1ABB60000, v2, (uint64_t)v2, "Unable to create handshakeController", v3);
}

void sub_1ABC5E614(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_1ABBCEE2C(a1, a2);
  sub_1ABBE4888(&dword_1ABB60000, v2, (uint64_t)v2, "Handshake controller did not respond to the expected selector to generate the identity proof (generateProofForIdentity:collaborationIdentifier:timeout:completion:)", v3);
}

void sub_1ABC5E640(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1ABB871D8();
  _os_log_error_impl(&dword_1ABB60000, a2, OS_LOG_TYPE_ERROR, "Failed to obtain local proof of inclusion: %@", v4, 0xCu);

}

void sub_1ABC5E6D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1ABB871D8();
  sub_1ABB6FF10(&dword_1ABB60000, v0, v1, "(1/2) Failed to generate searchable chat item with error %@", v2, v3, v4, v5, v6);
  sub_1ABB7320C();
}

void sub_1ABC5E734()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1ABB871D8();
  sub_1ABB6FF10(&dword_1ABB60000, v0, v1, "(1/2) Failed to generate searchable chat item for chat dictionary %@", v2, v3, v4, v5, v6);
  sub_1ABB7320C();
}

void sub_1ABC5E794()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1ABB871D8();
  sub_1ABB6FF10(&dword_1ABB60000, v0, v1, "(2/2) Failed to generate searchable chat item with error %@", v2, v3, v4, v5, v6);
  sub_1ABB7320C();
}

void sub_1ABC5E7F4()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  sub_1ABBE4894();
  sub_1ABB6D4D8(&dword_1ABB60000, v0, (uint64_t)v0, "(1/2) Failed to generate searchable chat item for chat GUID %@ dictionary %@", v1);
  sub_1ABB7320C();
}

void sub_1ABC5E85C()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  sub_1ABBE4894();
  _os_log_fault_impl(&dword_1ABB60000, v0, OS_LOG_TYPE_FAULT, "Failed to serialize client state with error %@ client state %@", v1, 0x16u);
  sub_1ABB7320C();
}

void sub_1ABC5E8CC()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  sub_1ABB871D8();
  _os_log_fault_impl(&dword_1ABB60000, v0, OS_LOG_TYPE_FAULT, "Failed to fetch client state: %@", v1, 0xCu);
  sub_1ABB7320C();
}

void sub_1ABC5E938()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1ABB871D8();
  sub_1ABB6FF10(&dword_1ABB60000, v0, v1, "failed to save client state with error %@", v2, v3, v4, v5, v6);
  sub_1ABB7320C();
}

void sub_1ABC5E998()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1ABB871D8();
  sub_1ABB6FF10(&dword_1ABB60000, v0, v1, "Suspending reindexing for 30 minutes due to error %@", v2, v3, v4, v5, v6);
  sub_1ABB7320C();
}

void sub_1ABC5E9F8()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getSROSmartRepliesManagerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("IMDCoreSpotlight.m"), 119, CFSTR("Unable to find class %s"), "SROSmartRepliesManager");

  __break(1u);
}

void sub_1ABC5EA70(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *SmartRepliesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("IMDCoreSpotlight.m"), 118, CFSTR("%s"), *a1);

  __break(1u);
}

void sub_1ABC5EAEC()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getSROSmartRepliesMessageClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("IMDCoreSpotlight.m"), 121, CFSTR("Unable to find class %s"), "SROSmartRepliesMessage");

  __break(1u);
}

void sub_1ABC5EB64()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getSROSmartRepliesSuggestionRequestClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("IMDCoreSpotlight.m"), 120, CFSTR("Unable to find class %s"), "SROSmartRepliesSuggestionRequest");

  __break(1u);
}

void sub_1ABC5EBDC(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = 138412802;
  v6 = v3;
  v7 = 2112;
  v8 = a2;
  v9 = 2112;
  v10 = v4;
  _os_log_error_impl(&dword_1ABB60000, log, OS_LOG_TYPE_ERROR, "IMDCoreSpotlightIndexSearchableItems: indexing transaction %@ failed with error %@. Using Index %@", (uint8_t *)&v5, 0x20u);
}

void sub_1ABC5EC6C(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1ABB60000, a2, OS_LOG_TYPE_ERROR, "Not setting syndication identifier because attachment index was not found in attributed body. attachmentGUID: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1ABC5ECE0(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 136315650;
  v4 = "+[IMDAttachmentSyndicationUtilities _attachmentGUIDIsSyndicatable:syndicationIdentifier:attachmentUTI:attributedB"
       "ody:encodedSyndicationRanges:isCMM:verbose:]";
  v5 = 2112;
  v6 = a1;
  v7 = 2112;
  v8 = a2;
  _os_log_error_impl(&dword_1ABB60000, log, OS_LOG_TYPE_ERROR, "%s Could not derive message part range from attachment GUID %@ (syndicationIdentifier %@)", (uint8_t *)&v3, 0x20u);
}

void sub_1ABC5ED74(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1ABB60000, log, OS_LOG_TYPE_ERROR, "Unable to create record for attachment.", v1, 2u);
}

void sub_1ABC5EDB4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "NULL attachment passed to %s", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC5EE24(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "NULL attachment passed to %s", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC5EE94(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "NULL attachment passed to %s", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC5EF04(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "NULL attachment passed to %s", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC5EF74(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "NULL attachment passed to %s", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC5EFE4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "NULL attachment passed to %s", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC5F054(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "NULL attachment passed to %s", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC5F0C4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "NULL attachment passed to %s", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC5F134(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "NULL attachment passed to %s", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC5F1A4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "NULL attachment passed to %s", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC5F214(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "NULL attachment passed to %s", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC5F284(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "NULL attachment passed to %s", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC5F2F4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "NULL attachment passed to %s", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC5F364(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "NULL attachment passed to %s", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC5F3D4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "NULL attachment passed to %s", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC5F444(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "NULL attachment passed to %s", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC5F4B4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "NULL attachment passed to %s", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC5F524(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "NULL attachment passed to %s", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC5F594(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "NULL attachment passed to %s", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC5F604(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "NULL dictionary passed to %s", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC5F674(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "NULL attachment passed to %s", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC5F6E4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "NULL attachment passed to %s", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC5F754(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  sub_1ABBAC9AC(&dword_1ABB60000, a2, a3, "CloudSync.message | Update status Query success for: %@", (uint8_t *)&v3);
}

void sub_1ABC5F7C0(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  sub_1ABBAC9AC(&dword_1ABB60000, a2, v4, "CloudSync.message | Query returned an error: %@", (uint8_t *)&v5);

}

void sub_1ABC5F84C(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_1ABB60000, a3, OS_LOG_TYPE_ERROR, "CloudSync.message | Failed to update ck_sync_state for recordIDs: %@ with error: %@", (uint8_t *)&v6, 0x16u);

}

void sub_1ABC5F8FC()
{
  int v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  sub_1ABB871D8();
  v3 = 1024;
  v4 = v0;
  _os_log_error_impl(&dword_1ABB60000, v1, OS_LOG_TYPE_ERROR, "Unable to perform query %@. Error %d", v2, 0x12u);
  sub_1ABB7320C();
}

void sub_1ABC5F978(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB731E0(&dword_1ABB60000, a1, a3, "MessageImport failed in ImportBegin", a5, a6, a7, a8, 0);
}

void sub_1ABC5F9AC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "%s called, but not during import, ignoring", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC5FA1C()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  sub_1ABB871D8();
  v3 = 2048;
  v4 = v0;
  sub_1ABB6D4D8(&dword_1ABB60000, v1, (uint64_t)v1, "Failed to add handle: %lld to chat: %lld", v2);
  sub_1ABB7320C();
}

void sub_1ABC5FA90()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1ABB871D8();
  sub_1ABB6FF10(&dword_1ABB60000, v0, v1, "Failed to create new chat for guid: %@", v2, v3, v4, v5, v6);
  sub_1ABB7320C();
}

void sub_1ABC5FAF0()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315394;
  sub_1ABBEE7A4();
  sub_1ABB6D4D8(&dword_1ABB60000, v0, v1, "%s called for chat: %@, but not during import, ignoring", (uint8_t *)v2);
  sub_1ABB7320C();
}

void sub_1ABC5FB60()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315394;
  sub_1ABBEE7A4();
  sub_1ABB6D4D8(&dword_1ABB60000, v0, v1, "%s called for chat: %@, but not during import, ignoring", (uint8_t *)v2);
  sub_1ABB7320C();
}

void sub_1ABC5FBD0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB731E0(&dword_1ABB60000, a1, a3, "MessageImport - IMDImportAttachmentWithPath - empty guid", a5, a6, a7, a8, 0);
}

void sub_1ABC5FC04()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1ABB871D8();
  sub_1ABB6FF10(&dword_1ABB60000, v0, v1, "Could not write attachmentData to path %@", v2, v3, v4, v5, v6);
  sub_1ABB7320C();
}

void sub_1ABC5FC64()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  sub_1ABBE4894();
  sub_1ABB6D4D8(&dword_1ABB60000, v0, (uint64_t)v0, "Unable to create directories for %@ when saving attachment %@", v1);
  sub_1ABB7320C();
}

void sub_1ABC5FCCC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "%s called, but not during import, ignoring", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC5FD3C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1ABB871D8();
  sub_1ABB6FF10(&dword_1ABB60000, v0, v1, "Failed to create message for guid: %@", v2, v3, v4, v5, v6);
  sub_1ABB7320C();
}

void sub_1ABC5FD9C()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  sub_1ABBE4894();
  sub_1ABB6D4D8(&dword_1ABB60000, v0, (uint64_t)v0, "No chat found for guid: %@   failing message import for GUID: %@", v1);
  sub_1ABB7320C();
}

void sub_1ABC5FE04(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a1, a3, "%s called, but not during import, ignoring", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC5FE74(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1ABB60000, log, OS_LOG_TYPE_ERROR, "Couldn't find request identifier or payload URL. This is going to cause responses from the notification to fail!", v1, 2u);
}

void sub_1ABC5FEB4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC5FF50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC5FFEC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Sqlite database path is nil"));
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC60088()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC60124(uint64_t a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136315906;
  *(_QWORD *)(buf + 4) = "_MessagesRecordStore";
  *((_WORD *)buf + 6) = 2080;
  *(_QWORD *)(buf + 14) = "CSDBThreadedRecordStoreRef IMDSharedThreadedRecordStore(void)";
  *((_WORD *)buf + 11) = 1024;
  *((_DWORD *)buf + 6) = 143;
  *((_WORD *)buf + 14) = 2112;
  *(_QWORD *)(buf + 30) = a1;
  _os_log_error_impl(&dword_1ABB60000, log, OS_LOG_TYPE_ERROR, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", buf, 0x26u);
}

void sub_1ABC601A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CSDBCreateThreadedRecordStore failed"));
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC6023C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC602D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC60374()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("recordStore is nil, will not initialize"));
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC60410()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC604AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC60548()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC605E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC60680()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1ABB73214();
  sub_1ABB731E0(&dword_1ABB60000, v0, v1, "No valid database handle, cannot perform a clean", v2, v3, v4, v5, v6);
  sub_1ABB73204();
}

void sub_1ABC606AC(uint64_t a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 134218242;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1ABB60000, log, OS_LOG_TYPE_ERROR, "Creating triggers for %p after db init failed: %@", buf, 0x16u);
}

void sub_1ABC60700()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC6079C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC60838(NSObject *a1, double a2)
{
  double v4;
  int v5;
  double v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v5 = 134217984;
  v6 = v4 - a2;
  _os_log_error_impl(&dword_1ABB60000, a1, OS_LOG_TYPE_ERROR, "Message's DB migration took %f seconds.", (uint8_t *)&v5, 0xCu);
}

void sub_1ABC608D8(int *a1, id *a2, os_log_t log)
{
  int v4;
  const __CFString *v5;
  _DWORD v6[2];
  __int16 v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = *a1;
  if (*a2)
    v5 = (const __CFString *)objc_msgSend(*a2, "localizedDescription");
  else
    v5 = &stru_1E5AC1D70;
  v6[0] = 67109378;
  v6[1] = v4;
  v7 = 2112;
  v8 = v5;
  _os_log_error_impl(&dword_1ABB60000, log, OS_LOG_TYPE_ERROR, "Migration failed, made it to version: %d: error: %@", (uint8_t *)v6, 0x12u);
}

void sub_1ABC60984()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1ABB73214();
  sub_1ABB731E0(&dword_1ABB60000, v0, v1, "Message database migration passed post migrate integrity check", v2, v3, v4, v5, v6);
  sub_1ABB73204();
}

void sub_1ABC609B0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1ABB73214();
  sub_1ABB731E0(&dword_1ABB60000, v0, v1, "Message database migration failed post migrate integrity check", v2, v3, v4, v5, v6);
  sub_1ABB73204();
}

void sub_1ABC609DC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1ABB73214();
  sub_1ABB731E0(&dword_1ABB60000, v0, v1, "Message database migration failed - Database integrity check failed", v2, v3, v4, v5, v6);
  sub_1ABB73204();
}

void sub_1ABC60A08(int a1, NSObject *a2)
{
  _DWORD v2[2];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109376;
  v2[1] = a1;
  v3 = 1024;
  v4 = 18016;
  _os_log_error_impl(&dword_1ABB60000, a2, OS_LOG_TYPE_ERROR, "Beginning migration.  The SMS db is currently at v%d, upgrading to v%d.", (uint8_t *)v2, 0xEu);
  sub_1ABB7320C();
}

void sub_1ABC60A90()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC60B2C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC60BC8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1ABB73214();
  sub_1ABB731E0(&dword_1ABB60000, v0, v1, "Database Post Vacuuming integrity checked failed failed", v2, v3, v4, v5, v6);
  sub_1ABB73204();
}

void sub_1ABC60BF4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABBF5DFC(&dword_1ABB60000, a2, a3, "Database Vacuuming failed with SQLite result: %d", a5, a6, a7, a8, 0);
  sub_1ABB73204();
}

void sub_1ABC60C58(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABBF5DFC(&dword_1ABB60000, a2, a3, "Database Reindexing the DB failed with SQLite result: %d", a5, a6, a7, a8, 0);
  sub_1ABB73204();
}

void sub_1ABC60CBC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC60D58()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC60DF4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC60E90()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC60F2C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC60FC8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC61064()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC61100()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC6119C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC61238()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC612D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC61370()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC6140C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC614A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC61544()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC615E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC6167C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC61718()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: Condition is unexpectedly true: %s in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC617B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC61850()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC618EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC61988(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  sub_1ABBE4888(&dword_1ABB60000, a1, a3, "__syncXPCIMDMessageStoreSendXPCMessage got a bogus message to send...bailing!", v3);
  sub_1ABB73204();
}

void sub_1ABC619BC(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  sub_1ABBE4888(&dword_1ABB60000, a1, a3, "__syncXPCIMDMessageStoreSendXPCMessage: You should not be hitting the database in a unit test. Please check your dependencies", v3);
  sub_1ABB73204();
}

void sub_1ABC619F0(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  sub_1ABBE4888(&dword_1ABB60000, a1, a3, "__syncXPCIMDMessageStoreSendXPCMessage failed too many times...bailing!", v3);
  sub_1ABB73204();
}

void sub_1ABC61A24(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_1ABBE4888(&dword_1ABB60000, a3, (uint64_t)a3, "__syncXPCIMDMessageStoreSendXPCMessage failed several consecutive times - sleeping for 1+ the launchd throttle time.", a1);
}

void sub_1ABC61A58(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_1ABBE4888(&dword_1ABB60000, a3, (uint64_t)a3, "__syncXPCIMDMessageStoreSendXPCMessage failed to copy the xpc_connection_t!", a1);
}

void sub_1ABC61A8C(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1ABB60000, a2, OS_LOG_TYPE_ERROR, "FAFetchFamilyCircleRequest failed %@", (uint8_t *)&v2, 0xCu);
}

void sub_1ABC61B00(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *FamilyCircleLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("IMDFamilyInviteNotificationContext.m"), 22, CFSTR("%s"), *a1);

  __break(1u);
}

void sub_1ABC61B7C()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getFAFetchFamilyCircleRequestClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("IMDFamilyInviteNotificationContext.m"), 23, CFSTR("Unable to find class %s"), "FAFetchFamilyCircleRequest");

  __break(1u);
}

void sub_1ABC61BF4(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1ABB871D8();
  sub_1ABBCFE5C(&dword_1ABB60000, v2, v3, "Recently Deleted | Query returned an error: %@", v4, v5, v6, v7, v8);

  sub_1ABB87200();
}

void sub_1ABC61C70(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1ABB871D8();
  sub_1ABBCFE5C(&dword_1ABB60000, v2, v3, "Recently Deleted | Failed to remove entries from chat_message_join: %@", v4, v5, v6, v7, v8);

  sub_1ABB87200();
}

void sub_1ABC61CEC(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1ABB871D8();
  sub_1ABBCFE5C(&dword_1ABB60000, v2, v3, "Recently Deleted | Insert to recoverable message table failed. Error : %@", v4, v5, v6, v7, v8);

  sub_1ABB87200();
}

void sub_1ABC61D68(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1ABB871D8();
  sub_1ABBCFE5C(&dword_1ABB60000, v2, v3, "Selecting the guid failed with error: %@", v4, v5, v6, v7, v8);

  sub_1ABB87200();
}

void sub_1ABC61DE4(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1ABB871D8();
  sub_1ABBCFE5C(&dword_1ABB60000, v2, v3, "Recently Deleted | Query returned an error: %@", v4, v5, v6, v7, v8);

  sub_1ABB87200();
}

void sub_1ABC61E60(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1ABB871D8();
  sub_1ABBCFE5C(&dword_1ABB60000, v2, v3, "Recently Deleted | Failed to remove entries from chat_recoverable_message_join: %@", v4, v5, v6, v7, v8);

  sub_1ABB87200();
}

void sub_1ABC61EDC(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(a2, "localizedDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_1ABB60000, a4, OS_LOG_TYPE_ERROR, "Recently Deleted | Failed to add chat entry to unsynced_removed_recoverable_messages: %@", a1, 0xCu);

}

void sub_1ABC61F50(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a2, "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1ABBAC99C();
  sub_1ABB992AC(&dword_1ABB60000, v3, v4, "Recently Deleted | Insert to chat message table failed for chat guid %@: %@", v5, v6, v7, v8, 2u);

  sub_1ABBAC9B8();
}

void sub_1ABC61FE0(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a2, "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1ABBAC99C();
  sub_1ABB992AC(&dword_1ABB60000, v3, v4, "Recently Deleted | Failed to finish query for messages to be restored in chat %@: %@", v5, v6, v7, v8, 2u);

  sub_1ABBAC9B8();
}

void sub_1ABC62070()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  sub_1ABB871D8();
  sub_1ABBAC9AC(&dword_1ABB60000, v0, v1, "Recently Deleted | Cannot recover: Could not find attributed body for messageGUID: %@", v2);
}

void sub_1ABC620D8(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a2, "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1ABBAC99C();
  sub_1ABB992AC(&dword_1ABB60000, v3, v4, "Recently Deleted | Failed to update attributedbody for messageGUID: %@ with error: %@", v5, v6, v7, v8, 2u);

  sub_1ABBAC9B8();
}

void sub_1ABC62164(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1ABB871D8();
  sub_1ABBCFE5C(&dword_1ABB60000, v2, v3, "Recently Deleted | Failed to remove entries from recoverable message part: %@", v4, v5, v6, v7, v8);

  sub_1ABB87200();
}

void sub_1ABC621DC(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1ABB871D8();
  sub_1ABBCFE5C(&dword_1ABB60000, v2, v3, "Recently Deleted | Failed to add entries into unsynced_removed_recoverable_messages: %@", v4, v5, v6, v7, v8);

  sub_1ABB87200();
}

void sub_1ABC62254(uint8_t *a1, uint64_t a2, _QWORD *a3, NSObject *a4)
{
  uint64_t v4;

  v4 = *(_QWORD *)(*(_QWORD *)a2 + 40);
  *(_DWORD *)a1 = 138412290;
  *a3 = v4;
  sub_1ABBAC9AC(&dword_1ABB60000, a4, (uint64_t)a3, "Recently Deleted | attributedBodyPart is nil for message guid %@", a1);
}

void sub_1ABC6229C(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1ABB871D8();
  sub_1ABBCFE5C(&dword_1ABB60000, v2, v3, "CloudSync.chat | Query returned an error: %@", v4, v5, v6, v7, v8);

  sub_1ABB87200();
}

void sub_1ABC62314(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a2, "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1ABBAC99C();
  sub_1ABB992AC(&dword_1ABB60000, v3, v4, "CloudSync.chat | Failed to update ck_sync_state for recordIDs: %@ with error: %@", v5, v6, v7, v8, 2u);

  sub_1ABBAC9B8();
}

void sub_1ABC623A0(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1ABB60000, log, OS_LOG_TYPE_ERROR, "No migration block to execute!", v1, 2u);
}

void sub_1ABC623E0(uint64_t a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 80);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_1ABB60000, a2, OS_LOG_TYPE_ERROR, "Migration failed, made it to version: %d", (uint8_t *)v3, 8u);
}

void sub_1ABC62458(int a1, NSObject *a2)
{
  _DWORD v2[2];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109376;
  v2[1] = a1;
  v3 = 1024;
  v4 = 18016;
  _os_log_error_impl(&dword_1ABB60000, a2, OS_LOG_TYPE_ERROR, "Migration unsupported.  The SMS db is currently at v%d, cannot upgrade to v%d.", (uint8_t *)v2, 0xEu);
}

void sub_1ABC624E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC62580()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC6261C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC626B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC62754()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1ABB73214();
  sub_1ABB731E0(&dword_1ABB60000, v0, v1, "No roomname or service specified. No rows will be returned.", v2, v3, v4, v5, v6);
  sub_1ABB73204();
}

void sub_1ABC62780(uint64_t a1, _DWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t *v6;

  *a2 = 136315906;
  sub_1ABC24198((uint64_t)a2, (uint64_t)"results");
  sub_1ABC24188(v2, (uint64_t)"CFArrayRef IMDMessageRecordCopyMessagesWithChatIdentifiersOnServicesUpToGUIDOrLimitWithOptionalThreadIdentifier(CFArrayRef, CFArrayRef, CFStringRef, CFStringRef, Boolean, Boolean, int64_t)");
  sub_1ABC24174(v3, v4, 1374);
  sub_1ABC24168(&dword_1ABB60000, v5, (uint64_t)v5, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v6);
}

void sub_1ABC627D8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1ABB73214();
  sub_1ABB731E0(&dword_1ABB60000, v0, v1, "No handles or services specified. Or handleCount != serviceCount. No rows will be returned.", v2, v3, v4, v5, v6);
  sub_1ABB73204();
}

void sub_1ABC62804()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC628A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("history query:"));
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC6293C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("history query: rowID should be > 0"));
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: Condition is unexpectedly true: %s in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC629D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC62A74()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1ABB73214();
  sub_1ABB731E0(&dword_1ABB60000, v0, v1, "IMDMessageRecordCopyMessagesWithChatIdentifiersOnServicesBeforeAndAfterGUID No handles or services specified for loading a limited number of messages up to guid. No rows will be returned", v2, v3, v4, v5, v6);
  sub_1ABB73204();
}

void sub_1ABC62AA0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC62B3C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  const char *v4;
  __int16 v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Paged history query with numberOfMessagesBefore: %lld numberOfMessagesAfter: %lld"), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v3 = 136315906;
  v4 = "firstLoadResults";
  v5 = 2080;
  v6 = "CFArrayRef IMDMessageRecordCopyMessagesWithChatIdentifiersOnServicesBeforeAndAfterGUIDWithOptionalThreadIdentifie"
       "r(CFArrayRef, CFArrayRef, CFStringRef, int64_t, int64_t, CFStringRef, Boolean *, Boolean *)_block_invoke_2";
  v7 = 1024;
  sub_1ABB8EA5C();
  sub_1ABC24158(&dword_1ABB60000, v1, v2, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", (uint8_t *)&v3);
  sub_1ABB8EA70();
}

void sub_1ABC62BF8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Paged history query: rowID should be > 0"));
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: Condition is unexpectedly true: %s in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC62C94()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC62D30(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  const char *v4;
  __int16 v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Paged history query with numberOfMessagesAfter: %lld for second load"), *(_QWORD *)(a1 + 40));
  v3 = 136315906;
  v4 = "secondLoadResults";
  v5 = 2080;
  v6 = "CFArrayRef IMDMessageRecordCopyMessagesWithChatIdentifiersOnServicesBeforeAndAfterGUIDWithOptionalThreadIdentifie"
       "r(CFArrayRef, CFArrayRef, CFStringRef, int64_t, int64_t, CFStringRef, Boolean *, Boolean *)_block_invoke_2";
  v7 = 1024;
  sub_1ABB8EA5C();
  sub_1ABC24158(&dword_1ABB60000, v1, v2, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", (uint8_t *)&v3);
  sub_1ABB8EA70();
}

void sub_1ABC62DEC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Paged history query: rowID should be > 0 for second load"));
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: Condition is unexpectedly true: %s in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC62E88()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC62F24()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1ABB73214();
  sub_1ABB731E0(&dword_1ABB60000, v0, v1, "No handles or services specified. Or handleCount != serviceCount. Or guidCount == 0. No rows will be returned.", v2, v3, v4, v5, v6);
  sub_1ABB73204();
}

void sub_1ABC62F50()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1ABB73214();
  sub_1ABB731E0(&dword_1ABB60000, v0, v1, "No handle or service specified. No rows will be returned.", v2, v3, v4, v5, v6);
  sub_1ABB73204();
}

void sub_1ABC62F7C(uint64_t a1, _DWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t *v6;

  *a2 = 136315906;
  sub_1ABC24198((uint64_t)a2, (uint64_t)"query");
  sub_1ABC24188(v2, (uint64_t)"IMDMessageRecordRef IMDMessageRecordCopyMessageMatchingBodyStringWithHandleSkippingServicesSkippingGUIDs(CFStringRef, CFStringRef, CFArrayRef, CFArrayRef, NSTimeInterval)");
  sub_1ABC24174(v3, v4, 2249);
  sub_1ABC24168(&dword_1ABB60000, v5, (uint64_t)v5, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v6);
}

void sub_1ABC62FD4(uint64_t a1, _DWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t *v6;

  *a2 = 136315906;
  sub_1ABC24198((uint64_t)a2, (uint64_t)"query");
  sub_1ABC24188(v2, (uint64_t)"IMDMessageRecordRef IMDMessageRecordCopyMessageMatchingBodyStringWithHandleMatchingServiceMatchingSOSSkippingGUID(CFStringRef, CFStringRef, CFStringRef, BOOL, CFStringRef, NSTimeInterval)");
  sub_1ABC24174(v3, v4, 2299);
  sub_1ABC24168(&dword_1ABB60000, v5, (uint64_t)v5, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v6);
}

void sub_1ABC6302C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1ABB73214();
  sub_1ABB731E0(&dword_1ABB60000, v0, v1, "Can't determine unread count when GUID is NULL or empty.", v2, v3, v4, v5, v6);
  sub_1ABB73204();
}

void sub_1ABC63058()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1ABB73214();
  sub_1ABB731E0(&dword_1ABB60000, v0, v1, "Can't determine unplayed audio messages GUID is NULL or empty.", v2, v3, v4, v5, v6);
  sub_1ABB73204();
}

void sub_1ABC63084()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1ABB73214();
  sub_1ABB731E0(&dword_1ABB60000, v0, v1, "No addresses to lookup, no results for you.", v2, v3, v4, v5, v6);
  sub_1ABB73204();
}

void sub_1ABC630B0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1ABB73214();
  sub_1ABB731E0(&dword_1ABB60000, v0, v1, "No addresses provided to IMDMessageRecordCopyMostRecentUseageOfAddresses().", v2, v3, v4, v5, v6);
  sub_1ABB73204();
}

void sub_1ABC630DC(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  sub_1ABBAC9AC(&dword_1ABB60000, a2, a3, "Unable to select rows from Message Deleted Messages Table: %@", (uint8_t *)&v4);
}

void sub_1ABC6314C(id *a1, NSObject *a2)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(*a1, "localizedDescription");
  v5 = 138412290;
  v6 = v3;
  sub_1ABBAC9AC(&dword_1ABB60000, a2, v4, "IMDMessageRecordCalculateLocalCloudKitStatistics failed with error: %@", (uint8_t *)&v5);
}

void sub_1ABC631D0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1ABB73214();
  sub_1ABB731E0(&dword_1ABB60000, v0, v1, "We don't have a guid to find messages with this reply to guid", v2, v3, v4, v5, v6);
  sub_1ABB73204();
}

void sub_1ABC631FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC63298()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1ABB73214();
  sub_1ABB731E0(&dword_1ABB60000, v0, v1, "Highlight Server Date is nil!", v2, v3, v4, v5, v6);
  sub_1ABB73204();
}

void sub_1ABC632C4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1ABB73214();
  sub_1ABB731E0(&dword_1ABB60000, v0, v1, "Unexpected nil attribute set", v2, v3, v4, v5, v6);
  sub_1ABB73204();
}

void sub_1ABC632F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1ABB73214();
  sub_1ABB731E0(&dword_1ABB60000, v0, v1, "messageDate was distant past. Not setting contentCreationDate on attributesToUpdate.", v2, v3, v4, v5, v6);
  sub_1ABB73204();
}

void sub_1ABC6331C(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 138412546;
  v3 = 0;
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_1ABB60000, a2, OS_LOG_TYPE_ERROR, "Unable to archive collaboration Metadata %@, error %@", (uint8_t *)&v2, 0x16u);
}

void sub_1ABC6339C(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1ABB60000, a2, OS_LOG_TYPE_ERROR, "No CKBundleIDs found for URL with messageGUID: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1ABC63410()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1ABB73214();
  sub_1ABB731E0(&dword_1ABB60000, v0, v1, "creationDate was distant past. Not setting contentCreationDate on attributesToUpdate.", v2, v3, v4, v5, v6);
  sub_1ABB73204();
}

void sub_1ABC6343C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1ABB73214();
  sub_1ABB731E0(&dword_1ABB60000, v0, v1, "Failed to get a collaboration identifier for URL hence setting message to be shared only in SWY", v2, v3, v4, v5, v6);
  sub_1ABB73204();
}

void sub_1ABC63468(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *LinkPresentationLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("IMDSharedWithYouMetadataManager.m"), 53, CFSTR("%s"), *a1);

  __break(1u);
}

void sub_1ABC634E4()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getLPLinkMetadataSharedWithYouTransformerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("IMDSharedWithYouMetadataManager.m"), 54, CFSTR("Unable to find class %s"), "LPLinkMetadataSharedWithYouTransformer");

  __break(1u);
}

void sub_1ABC6355C(os_log_t log)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = 136446466;
  v2 = "-[IMDDatabase(Spotlight) _validateSpotlightClientStateWithLastError:attempts:completion:]";
  v3 = 1024;
  v4 = 5;
  _os_log_fault_impl(&dword_1ABB60000, log, OS_LOG_TYPE_FAULT, "%{public}s Failed to inspect client state %d times - giving up", (uint8_t *)&v1, 0x12u);
}

void sub_1ABC635EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABC3E344();
  sub_1ABC3E334();
  sub_1ABC3E320();
  sub_1ABC3E30C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: Conditions are unexpectedly equal: %s == %s in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB8EA70();
}

void sub_1ABC63694()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC63730()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC637CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABC3E344();
  sub_1ABC3E334();
  sub_1ABC3E320();
  sub_1ABC3E30C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: Conditions are unexpectedly equal: %s == %s in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB8EA70();
}

void sub_1ABC63874()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC63910()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABC3E344();
  sub_1ABC3E334();
  sub_1ABC3E320();
  sub_1ABC3E30C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: Conditions are unexpectedly equal: %s == %s in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB8EA70();
}

void sub_1ABC639B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC63A54()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC63AF0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC63B8C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABC3E344();
  sub_1ABC3E334();
  sub_1ABC3E320();
  sub_1ABC3E30C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: Conditions are unexpectedly equal: %s == %s in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB8EA70();
}

void sub_1ABC63C34()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC63CD0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABC3E344();
  sub_1ABC3E334();
  sub_1ABC3E320();
  sub_1ABC3E30C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: Conditions are unexpectedly equal: %s == %s in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB8EA70();
}

void sub_1ABC63D78()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC63E14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC63EB0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABC3E344();
  sub_1ABC3E334();
  sub_1ABC3E320();
  sub_1ABC3E30C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: Conditions are unexpectedly equal: %s == %s in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB8EA70();
}

void sub_1ABC63F58()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E5AC1D70);
  sub_1ABB743D0();
  sub_1ABB743C0();
  sub_1ABB743A0();
  sub_1ABB7438C(&dword_1ABB60000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
  sub_1ABB743B4();
}

void sub_1ABC63FF4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a2, a3, "There appears to be more than one attachment with GUID [%@]", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC64058()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1ABB73214();
  sub_1ABB731E0(&dword_1ABB60000, v0, v1, "Could not initialize query.", v2, v3, v4, v5, v6);
  sub_1ABB73204();
}

void sub_1ABC64084(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a2, a3, "Not removing attachments, we got a NULL or 0 length GUID [%@]", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC640E8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a2, a3, "Unable to select rows from Attachment table: %@", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC64150(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB6FF10(&dword_1ABB60000, a2, a3, "Unable to select rows from Attachment Deleted Table: %@", a5, a6, a7, a8, 2u);
  sub_1ABB7320C();
}

void sub_1ABC641B8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABB731E0(&dword_1ABB60000, a1, a3, "TRIGGER: custom function is already executing -- this is not reentrant!", a5, a6, a7, a8, 0);
}

void sub_1ABC641EC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABC4B3AC(&dword_1ABB60000, a1, a3, "This method should not be called on the database thread because it may lead to egregiously long blocking of other requests.", a5, a6, a7, a8, 0);
}

void sub_1ABC64220(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1ABC4B3AC(&dword_1ABB60000, a1, a3, "This method should not be called off the database thread because it may lead to threading issues and database corruption.", a5, a6, a7, a8, 0);
}

void sub_1ABC64254(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1ABB60000, log, OS_LOG_TYPE_ERROR, "IMDCNPersonAliasResolver: Error! Contact Store failed to get initialized!", v1, 2u);
}

uint64_t sub_1ABC64294()
{
  return MEMORY[0x1E0CAE248]();
}

uint64_t sub_1ABC642A0()
{
  return MEMORY[0x1E0CAE250]();
}

uint64_t sub_1ABC642AC()
{
  return MEMORY[0x1E0CAE310]();
}

uint64_t sub_1ABC642B8()
{
  return MEMORY[0x1E0CAE328]();
}

uint64_t sub_1ABC642C4()
{
  return MEMORY[0x1E0CAFF00]();
}

uint64_t sub_1ABC642D0()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1ABC642DC()
{
  return MEMORY[0x1E0CB03C0]();
}

uint64_t sub_1ABC642E8()
{
  return MEMORY[0x1E0CB06B8]();
}

uint64_t sub_1ABC642F4()
{
  return MEMORY[0x1E0CB0700]();
}

uint64_t sub_1ABC64300()
{
  return MEMORY[0x1E0CB07E8]();
}

uint64_t sub_1ABC6430C()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t _s14IMDPersistence0A10HelloWorldV13printGreetingyyF_0()
{
  return MEMORY[0x1E0D370E8]();
}

uint64_t _s14IMDPersistence0A10HelloWorldVACycfC_0()
{
  return MEMORY[0x1E0D370F0]();
}

uint64_t sub_1ABC64330()
{
  return MEMORY[0x1E0D370F8]();
}

uint64_t sub_1ABC6433C()
{
  return MEMORY[0x1E0D37108]();
}

uint64_t sub_1ABC64348()
{
  return MEMORY[0x1E0D37110]();
}

uint64_t sub_1ABC64354()
{
  return MEMORY[0x1E0D372B8]();
}

uint64_t sub_1ABC64360()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1ABC6436C()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1ABC64378()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1ABC64384()
{
  return MEMORY[0x1E0CFE210]();
}

uint64_t sub_1ABC64390()
{
  return MEMORY[0x1E0DEF4A8]();
}

uint64_t sub_1ABC6439C()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1ABC643A8()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1ABC643B4()
{
  return MEMORY[0x1E0DEF598]();
}

uint64_t sub_1ABC643C0()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1ABC643CC()
{
  return MEMORY[0x1E0DEF698]();
}

uint64_t sub_1ABC643D8()
{
  return MEMORY[0x1E0DEF6B8]();
}

uint64_t sub_1ABC643E4()
{
  return MEMORY[0x1E0DEF750]();
}

uint64_t sub_1ABC643F0()
{
  return MEMORY[0x1E0CFE238]();
}

uint64_t sub_1ABC643FC()
{
  return MEMORY[0x1E0CFE240]();
}

uint64_t sub_1ABC64408()
{
  return MEMORY[0x1E0CFE248]();
}

uint64_t sub_1ABC64414()
{
  return MEMORY[0x1E0CFE250]();
}

uint64_t sub_1ABC64420()
{
  return MEMORY[0x1E0CFE268]();
}

uint64_t sub_1ABC6442C()
{
  return MEMORY[0x1E0CFE270]();
}

uint64_t sub_1ABC64438()
{
  return MEMORY[0x1E0DEA3B0]();
}

uint64_t sub_1ABC64444()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1ABC64450()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1ABC6445C()
{
  return MEMORY[0x1E0DEA618]();
}

uint64_t sub_1ABC64468()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1ABC64474()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1ABC64480()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1ABC6448C()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1ABC64498()
{
  return MEMORY[0x1E0CB1AD0]();
}

uint64_t sub_1ABC644A4()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1ABC644B0()
{
  return MEMORY[0x1E0DEADB0]();
}

uint64_t sub_1ABC644BC()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1ABC644C8()
{
  return MEMORY[0x1E0DEAE28]();
}

uint64_t sub_1ABC644D4()
{
  return MEMORY[0x1E0CB1C90]();
}

uint64_t sub_1ABC644E0()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t sub_1ABC644EC()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t sub_1ABC644F8()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1ABC64504()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t sub_1ABC64510()
{
  return MEMORY[0x1E0DEF840]();
}

uint64_t sub_1ABC6451C()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_1ABC64528()
{
  return MEMORY[0x1E0DEF8F8]();
}

uint64_t sub_1ABC64534()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t sub_1ABC64540()
{
  return MEMORY[0x1E0C91D50]();
}

uint64_t sub_1ABC6454C()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1ABC64558()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1ABC64564()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1ABC64570()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1ABC6457C()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1ABC64588()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1ABC64594()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1ABC645A0()
{
  return MEMORY[0x1E0DEC3E8]();
}

uint64_t sub_1ABC645AC()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1ABC645B8()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1ABC645C4()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1ABC645D0()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1ABC645DC()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1ABC645E8()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1ABC645F4()
{
  return MEMORY[0x1E0DED5F0]();
}

uint64_t sub_1ABC64600()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1ABC6460C()
{
  return MEMORY[0x1E0CB2650]();
}

uint64_t sub_1ABC64618()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1ABC64624()
{
  return MEMORY[0x1E0DEDF40]();
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80370](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80378](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80380](c, data, *(_QWORD *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1E0C97D20](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
  MEMORY[0x1E0C97DD0](theArray, idx, value);
}

void CFArraySortValues(CFMutableArrayRef theArray, CFRange range, CFComparatorFunction comparator, void *context)
{
  MEMORY[0x1E0C97DE0](theArray, range.location, range.length, comparator, context);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1E0C983A0](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98500](theDict, key, value);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98530](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1E0C98570](theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x1E0C98718](cf);
}

CFIndex CFGetRetainCount(CFTypeRef cf)
{
  return MEMORY[0x1E0C98720](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A78](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x1E0C98A90](key, value, applicationID, userName, hostName);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1E0C98A98](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x1E0C98D70](theSet, value);
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x1E0C98D80](theSet, value);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1E0C98D98](allocator, capacity, callBacks);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x1E0C98ED8](theString, appendedString);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F90](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F98](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1E0C99018](alloc, formatOptions, format);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3;
  CFIndex v4;
  CFRange result;

  v3 = MEMORY[0x1E0C99050](theString, stringToFind, compareOptions);
  result.length = v4;
  result.location = v3;
  return result;
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x1E0C990B0](theString, idx);
}

double CFStringGetDoubleValue(CFStringRef str)
{
  double result;

  MEMORY[0x1E0C990D0](str);
  return result;
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x1E0C990F0](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x1E0C99180](theString, prefix);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1E0CBC530](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC5C0](url, options);
}

CFStringRef CGImageSourceGetType(CGImageSourceRef isrc)
{
  return (CFStringRef)MEMORY[0x1E0CBC618](isrc);
}

uint64_t CPCopySharedResourcesPreferencesDomainForDomain()
{
  return MEMORY[0x1E0CFA250]();
}

uint64_t CSDBCreateDirectoriesToPath()
{
  return MEMORY[0x1E0D185F8]();
}

uint64_t CSDBCreateThreadedRecordStore()
{
  return MEMORY[0x1E0D18600]();
}

uint64_t CSDBCreateUTF8StringFromCFString()
{
  return MEMORY[0x1E0D18608]();
}

uint64_t CSDBDeregisterReconnectBlockWithIdentifier()
{
  return MEMORY[0x1E0D18618]();
}

uint64_t CSDBGetMobileUserGID()
{
  return MEMORY[0x1E0D18620]();
}

uint64_t CSDBGetMobileUserUID()
{
  return MEMORY[0x1E0D18628]();
}

uint64_t CSDBPerformBlock()
{
  return MEMORY[0x1E0D18638]();
}

uint64_t CSDBPerformBlockAfterDelay()
{
  return MEMORY[0x1E0D18640]();
}

uint64_t CSDBPerformLockedSectionForQueryForReading()
{
  return MEMORY[0x1E0D18648]();
}

uint64_t CSDBRecordCopyProperty()
{
  return MEMORY[0x1E0D18650]();
}

uint64_t CSDBRecordCreate()
{
  return MEMORY[0x1E0D18658]();
}

uint64_t CSDBRecordGetID()
{
  return MEMORY[0x1E0D18660]();
}

uint64_t CSDBRecordGetProperty()
{
  return MEMORY[0x1E0D18668]();
}

uint64_t CSDBRecordIndexOfPropertyNamed()
{
  return MEMORY[0x1E0D18670]();
}

uint64_t CSDBRecordInvalidateRecord()
{
  return MEMORY[0x1E0D18678]();
}

uint64_t CSDBRecordSaveStore()
{
  return MEMORY[0x1E0D18680]();
}

uint64_t CSDBRecordSetProperty()
{
  return MEMORY[0x1E0D18688]();
}

uint64_t CSDBRecordStoreAddRecord()
{
  return MEMORY[0x1E0D18690]();
}

uint64_t CSDBRecordStoreCopyInstanceOfClassWithUID()
{
  return MEMORY[0x1E0D18698]();
}

uint64_t CSDBRecordStoreCreateTablesForClass()
{
  return MEMORY[0x1E0D186A0]();
}

uint64_t CSDBRecordStoreGetDatabase()
{
  return MEMORY[0x1E0D186A8]();
}

uint64_t CSDBRecordStoreGetSequenceNumber()
{
  return MEMORY[0x1E0D186B0]();
}

uint64_t CSDBRecordStoreInvalidateCachesWithStore()
{
  return MEMORY[0x1E0D186B8]();
}

uint64_t CSDBRecordStoreProcessStatement()
{
  return MEMORY[0x1E0D186C0]();
}

uint64_t CSDBRecordStoreRefFromThreadedRecordStoreRef()
{
  return MEMORY[0x1E0D186C8]();
}

uint64_t CSDBRecordStoreRemoveRecord()
{
  return MEMORY[0x1E0D186D0]();
}

uint64_t CSDBRegisterReconnectBlockWithIdentifier()
{
  return MEMORY[0x1E0D186D8]();
}

uint64_t CSDBSetCorruptedDatabaseHandler()
{
  return MEMORY[0x1E0D186E8]();
}

uint64_t CSDBSqliteBackupDatabase()
{
  return MEMORY[0x1E0D186F0]();
}

uint64_t CSDBSqliteBindBlobFromCFData()
{
  return MEMORY[0x1E0D186F8]();
}

uint64_t CSDBSqliteBindInt()
{
  return MEMORY[0x1E0D18700]();
}

uint64_t CSDBSqliteBindInt64()
{
  return MEMORY[0x1E0D18708]();
}

uint64_t CSDBSqliteBindNull()
{
  return MEMORY[0x1E0D18710]();
}

uint64_t CSDBSqliteBindTextFromCFArrayOfCFStrings()
{
  return MEMORY[0x1E0D18718]();
}

uint64_t CSDBSqliteBindTextFromCFString()
{
  return MEMORY[0x1E0D18720]();
}

uint64_t CSDBSqliteConnectionBeginTransactionType()
{
  return MEMORY[0x1E0D18728]();
}

uint64_t CSDBSqliteConnectionCommit()
{
  return MEMORY[0x1E0D18730]();
}

uint64_t CSDBSqliteConnectionIntegerForProperty()
{
  return MEMORY[0x1E0D18738]();
}

uint64_t CSDBSqliteConnectionPerformSQL()
{
  return MEMORY[0x1E0D18740]();
}

uint64_t CSDBSqliteConnectionRowidOfLastInsert()
{
  return MEMORY[0x1E0D18748]();
}

uint64_t CSDBSqliteConnectionSetIntegerForProperty()
{
  return MEMORY[0x1E0D18750]();
}

uint64_t CSDBSqliteConnectionSetValueForProperty()
{
  return MEMORY[0x1E0D18758]();
}

uint64_t CSDBSqliteConnectionStatementForSQL()
{
  return MEMORY[0x1E0D18760]();
}

uint64_t CSDBSqliteDatabaseCheckIntegrity()
{
  return MEMORY[0x1E0D18768]();
}

uint64_t CSDBSqliteDatabaseConnectionForReading()
{
  return MEMORY[0x1E0D18770]();
}

uint64_t CSDBSqliteDatabaseConnectionForWriting()
{
  return MEMORY[0x1E0D18778]();
}

uint64_t CSDBSqliteDatabaseCopyValueForProperty()
{
  return MEMORY[0x1E0D18780]();
}

uint64_t CSDBSqliteDatabaseFromThreadedRecordStoreRef()
{
  return MEMORY[0x1E0D18788]();
}

uint64_t CSDBSqliteDatabasePath()
{
  return MEMORY[0x1E0D18790]();
}

uint64_t CSDBSqliteDatabaseRegisterFunctionForDB()
{
  return MEMORY[0x1E0D18798]();
}

uint64_t CSDBSqliteDatabaseReleaseSqliteConnection()
{
  return MEMORY[0x1E0D187A0]();
}

uint64_t CSDBSqliteDatabaseSetVersion()
{
  return MEMORY[0x1E0D187A8]();
}

uint64_t CSDBSqliteDatabaseStatementForReading()
{
  return MEMORY[0x1E0D187B0]();
}

uint64_t CSDBSqliteDatabaseStatementForWriting()
{
  return MEMORY[0x1E0D187B8]();
}

uint64_t CSDBSqliteDatabaseVacuum()
{
  return MEMORY[0x1E0D187C0]();
}

uint64_t CSDBSqliteDeleteDatabase()
{
  return MEMORY[0x1E0D187C8]();
}

uint64_t CSDBSqliteSetDefaultPageCacheSize()
{
  return MEMORY[0x1E0D187D0]();
}

uint64_t CSDBSqliteStatementCopyDataResult()
{
  return MEMORY[0x1E0D187D8]();
}

uint64_t CSDBSqliteStatementInteger64Result()
{
  return MEMORY[0x1E0D187E0]();
}

uint64_t CSDBSqliteStatementInteger64ResultColumn()
{
  return MEMORY[0x1E0D187E8]();
}

uint64_t CSDBSqliteStatementIntegerResult()
{
  return MEMORY[0x1E0D187F0]();
}

uint64_t CSDBSqliteStatementPerform()
{
  return MEMORY[0x1E0D187F8]();
}

uint64_t CSDBSqliteStatementReset()
{
  return MEMORY[0x1E0D18800]();
}

uint64_t CSDBSqliteStep()
{
  return MEMORY[0x1E0D18808]();
}

uint64_t CSDBSqliteStepWithConnection()
{
  return MEMORY[0x1E0D18810]();
}

uint64_t CSDBSqliteUtilitiesGetSchemaVersionAtPathWithProtection()
{
  return MEMORY[0x1E0D18818]();
}

uint64_t CSDBThreadedRecordStoreEnsureDatabaseSetupWithProtection()
{
  return MEMORY[0x1E0D18828]();
}

uint64_t CSDBThreadedRecordStoreOwnsCurrentThread()
{
  return MEMORY[0x1E0D18830]();
}

uint64_t CSDBThreadedRecordStoreRegisterClass()
{
  return MEMORY[0x1E0D18838]();
}

uint64_t CSDBThreadedRecordStoreTeardownDatabase()
{
  return MEMORY[0x1E0D18840]();
}

uint64_t IMAdditionalContactsLoggingEnabled()
{
  return MEMORY[0x1E0D373B8]();
}

uint64_t IMAllowMessagesIniCloud()
{
  return MEMORY[0x1E0D37410]();
}

uint64_t IMAttachmentEmojiImagePreviewFileURL()
{
  return MEMORY[0x1E0D37440]();
}

uint64_t IMAttachmentPreviewFileURL()
{
  return MEMORY[0x1E0D37450]();
}

uint64_t IMBalloonExtensionIDWithSuffix()
{
  return MEMORY[0x1E0D37510]();
}

uint64_t IMBrowserSnapshotCacheDirectoryURL()
{
  return MEMORY[0x1E0D37658]();
}

uint64_t IMCMMAssetIndexFromIMFileTransferGUID()
{
  return MEMORY[0x1E0D376A8]();
}

uint64_t IMCSIndexReasonFromIMIndexReason()
{
  return MEMORY[0x1E0D376E8]();
}

uint64_t IMCachesDirectoryURL()
{
  return MEMORY[0x1E0D376F0]();
}

uint64_t IMCanonicalizeFormattedString()
{
  return MEMORY[0x1E0D36348]();
}

uint64_t IMComponentsFromChatGUID()
{
  return MEMORY[0x1E0D36360]();
}

uint64_t IMCopyGUIDForChat()
{
  return MEMORY[0x1E0D36370]();
}

uint64_t IMCountryCodeForIncomingTextMessage()
{
  return MEMORY[0x1E0D36398]();
}

uint64_t IMCountryCodeForNumber()
{
  return MEMORY[0x1E0D363A0]();
}

uint64_t IMCreateDictionaryFromXPCObjectWithStandardAllowlist()
{
  return MEMORY[0x1E0D363A8]();
}

uint64_t IMCreateXPCObjectFromDictionary()
{
  return MEMORY[0x1E0D363C0]();
}

uint64_t IMDAuditTokenTaskCopyValuesForEntitlements()
{
  return MEMORY[0x1E0D363D0]();
}

uint64_t IMDDScanAttributedStringWithExtendedContext()
{
  return MEMORY[0x1E0D363E8]();
}

uint64_t IMDDatabaseTelemetryLogHandle()
{
  return MEMORY[0x1E0D37CE0]();
}

uint64_t IMDictionaryFromPayloadData()
{
  return MEMORY[0x1E0D37DB0]();
}

uint64_t IMDispatchForNotify()
{
  return MEMORY[0x1E0D36400]();
}

uint64_t IMFileLocationTrimFileName()
{
  return MEMORY[0x1E0D36428]();
}

uint64_t IMFileSizeForItemAtPath()
{
  return MEMORY[0x1E0D37EA8]();
}

uint64_t IMFileTransferGUIDForAttachmentMessagePartAtMessageGUIDAndMessagePartIndex()
{
  return MEMORY[0x1E0D37F90]();
}

uint64_t IMFileTransferGUIDIsTemporary()
{
  return MEMORY[0x1E0D37FB0]();
}

uint64_t IMFileURLIsActuallyAnimated()
{
  return MEMORY[0x1E0D37FE8]();
}

uint64_t IMFormattedDisplayStringForIDWithCountryCode()
{
  return MEMORY[0x1E0D36468]();
}

uint64_t IMFormattedDisplayStringForNumber()
{
  return MEMORY[0x1E0D36470]();
}

uint64_t IMGetAssertionFailureHandler()
{
  return MEMORY[0x1E0D364B0]();
}

uint64_t IMGetCachedDomainBoolForKey()
{
  return MEMORY[0x1E0D364B8]();
}

uint64_t IMGetCachedDomainBoolForKeyWithDefaultValue()
{
  return MEMORY[0x1E0D364C0]();
}

uint64_t IMGetCachedDomainIntForKeyWithDefaultValue()
{
  return MEMORY[0x1E0D364D0]();
}

uint64_t IMGetCachedDomainValueForKey()
{
  return MEMORY[0x1E0D364D8]();
}

uint64_t IMGetDomainBoolForKey()
{
  return MEMORY[0x1E0D364E8]();
}

uint64_t IMGetDomainBoolForKeyWithDefaultValue()
{
  return MEMORY[0x1E0D364F0]();
}

uint64_t IMGetDomainIntForKey()
{
  return MEMORY[0x1E0D364F8]();
}

uint64_t IMGetDomainValueForKey()
{
  return MEMORY[0x1E0D36500]();
}

uint64_t IMGetXPCArrayFromDictionary()
{
  return MEMORY[0x1E0D36540]();
}

uint64_t IMGetXPCBoolFromDictionary()
{
  return MEMORY[0x1E0D36548]();
}

uint64_t IMGetXPCCodableFromDictionaryWithStandardAllowlist()
{
  return MEMORY[0x1E0D36550]();
}

uint64_t IMGetXPCDataFromDictionary()
{
  return MEMORY[0x1E0D36558]();
}

uint64_t IMGetXPCDictionaryFromDictionary()
{
  return MEMORY[0x1E0D36560]();
}

uint64_t IMGetXPCIntFromDictionary()
{
  return MEMORY[0x1E0D36568]();
}

uint64_t IMGetXPCKeyedCodableFromDictionaryWithSecureCoding()
{
  return MEMORY[0x1E0D36570]();
}

uint64_t IMGetXPCStringFromDictionary()
{
  return MEMORY[0x1E0D36578]();
}

uint64_t IMInsertArraysToXPCDictionary()
{
  return MEMORY[0x1E0D36598]();
}

uint64_t IMInsertBoolsToXPCDictionary()
{
  return MEMORY[0x1E0D365A0]();
}

uint64_t IMInsertCodableObjectsToXPCDictionary()
{
  return MEMORY[0x1E0D365A8]();
}

uint64_t IMInsertDatasToXPCDictionary()
{
  return MEMORY[0x1E0D365B0]();
}

uint64_t IMInsertDictionariesToXPCDictionary()
{
  return MEMORY[0x1E0D365B8]();
}

uint64_t IMInsertIntsToXPCDictionary()
{
  return MEMORY[0x1E0D365C0]();
}

uint64_t IMInsertKeyedCodableObjectsToXPCDictionary()
{
  return MEMORY[0x1E0D365C8]();
}

uint64_t IMInsertNSStringsToXPCDictionary()
{
  return MEMORY[0x1E0D365D0]();
}

uint64_t IMInsertStringsToXPCDictionary()
{
  return MEMORY[0x1E0D365D8]();
}

uint64_t IMInternationalForPhoneNumberWithOptions()
{
  return MEMORY[0x1E0D365E0]();
}

uint64_t IMIsRunningInUnitTesting()
{
  return MEMORY[0x1E0D38150]();
}

uint64_t IMIsStringStewieEmergency()
{
  return MEMORY[0x1E0D38178]();
}

uint64_t IMIsStringStewieRoadside()
{
  return MEMORY[0x1E0D38180]();
}

uint64_t IMLogHandleForCategory()
{
  return MEMORY[0x1E0D381A8]();
}

uint64_t IMMentionContactKeysForMe()
{
  return MEMORY[0x1E0D381F8]();
}

uint64_t IMMentionMeTokensForContact()
{
  return MEMORY[0x1E0D38200]();
}

uint64_t IMMessageCreateAssociatedMessageGUIDFromThreadIdentifier()
{
  return MEMORY[0x1E0D38220]();
}

uint64_t IMMessageCreateThreadIdentifierWithComponents()
{
  return MEMORY[0x1E0D38228]();
}

uint64_t IMMessageGuidFromIMFileTransferGuid()
{
  return MEMORY[0x1E0D38250]();
}

uint64_t IMMessageThreadIdentifierGetComponents()
{
  return MEMORY[0x1E0D383E0]();
}

uint64_t IMNicknameUnarchivingClasses()
{
  return MEMORY[0x1E0D38B30]();
}

uint64_t IMNormalizeFormattedString()
{
  return MEMORY[0x1E0D366D8]();
}

uint64_t IMNormalizePhoneNumber()
{
  return MEMORY[0x1E0D38BC8]();
}

uint64_t IMOSLoggingEnabled()
{
  return MEMORY[0x1E0D366F0]();
}

uint64_t IMPluginSnapshotCachesFileURL()
{
  return MEMORY[0x1E0D38C68]();
}

uint64_t IMPreviewCachesDirectoryWithAttachmentURL()
{
  return MEMORY[0x1E0D38C78]();
}

uint64_t IMPreviewExtension()
{
  return MEMORY[0x1E0D38C98]();
}

uint64_t IMProcessGameCenterMessageWithPayloadData()
{
  return MEMORY[0x1E0D38CA8]();
}

uint64_t IMProcessNameForPid()
{
  return MEMORY[0x1E0D36768]();
}

uint64_t IMProcessPeerPaymentMessageWithPayloadData()
{
  return MEMORY[0x1E0D38CB0]();
}

uint64_t IMProcessPhotosExtensionMessageWithPayloadData()
{
  return MEMORY[0x1E0D38CB8]();
}

uint64_t IMProcessRichLinkMessageWithBody()
{
  return MEMORY[0x1E0D38CC0]();
}

uint64_t IMSHA1HashFromStrings()
{
  return MEMORY[0x1E0D38CE0]();
}

uint64_t IMSafeTemporaryDirectory()
{
  return MEMORY[0x1E0D38D20]();
}

uint64_t IMSanitizedAppNameForIMExtensionPayloadUserInfoKey()
{
  return MEMORY[0x1E0D38D38]();
}

uint64_t IMSanitizedCaptionForIMExtensionPayloadUserInfoKey()
{
  return MEMORY[0x1E0D38D40]();
}

uint64_t IMSanitizedURLForIMExtensionPayloadURLKey()
{
  return MEMORY[0x1E0D38D50]();
}

uint64_t IMSetDomainBoolForKey()
{
  return MEMORY[0x1E0D367F8]();
}

uint64_t IMSetDomainIntForKey()
{
  return MEMORY[0x1E0D36800]();
}

uint64_t IMSetDomainValueForKey()
{
  return MEMORY[0x1E0D36808]();
}

uint64_t IMSharedHelperCachePathForStickerWithProperties()
{
  return MEMORY[0x1E0D39130]();
}

uint64_t IMSharedHelperCatalystNotificationDisabled()
{
  return MEMORY[0x1E0D39138]();
}

uint64_t IMSharedHelperCombinedPluginPayloadDictionaryDataWithAttachmentURLs()
{
  return MEMORY[0x1E0D39148]();
}

uint64_t IMSharedHelperDeviceHasMultipleSubscriptions()
{
  return MEMORY[0x1E0D39160]();
}

uint64_t IMSharedHelperDeviceIsiPad()
{
  return MEMORY[0x1E0D39178]();
}

uint64_t IMSharedHelperExternalLocationForFile()
{
  return MEMORY[0x1E0D39190]();
}

uint64_t IMSharedHelperPathIsInStickerCache()
{
  return MEMORY[0x1E0D391F0]();
}

uint64_t IMSharedHelperPayloadFromCombinedPluginPayloadData()
{
  return MEMORY[0x1E0D391F8]();
}

uint64_t IMSharedHelperPersistMergeID()
{
  return MEMORY[0x1E0D39200]();
}

uint64_t IMSharedHelperSpotlightIndexingPreference()
{
  return MEMORY[0x1E0D39230]();
}

uint64_t IMSharedMessageSummaryCreateWithShortName()
{
  return MEMORY[0x1E0D39258]();
}

uint64_t IMSharedUtilitiesFrameworkBundle()
{
  return MEMORY[0x1E0D39260]();
}

uint64_t IMStickerCacheDirectoryURL()
{
  return MEMORY[0x1E0D392A0]();
}

uint64_t IMStringFromCKSyncState()
{
  return MEMORY[0x1E0D39340]();
}

uint64_t IMStringFromTransferState()
{
  return MEMORY[0x1E0D393A8]();
}

uint64_t IMStringIsBusinessID()
{
  return MEMORY[0x1E0D36860]();
}

uint64_t IMStringIsEmail()
{
  return MEMORY[0x1E0D36868]();
}

uint64_t IMStringIsEmpty()
{
  return MEMORY[0x1E0D36878]();
}

uint64_t IMStringIsPhoneNumber()
{
  return MEMORY[0x1E0D36890]();
}

uint64_t IMStringIsStewie()
{
  return MEMORY[0x1E0D368A0]();
}

uint64_t IMSubmitSimpleAggegateMetric()
{
  return MEMORY[0x1E0D368C0]();
}

uint64_t IMUTITypeForExtension()
{
  return MEMORY[0x1E0D394D0]();
}

uint64_t IMUTITypeForFilename()
{
  return MEMORY[0x1E0D394D8]();
}

uint64_t IMUTITypeIsFileAttachment()
{
  return MEMORY[0x1E0D394E8]();
}

uint64_t IMUTITypeIsSupportedByPhotos()
{
  return MEMORY[0x1E0D394F8]();
}

uint64_t IMUTTypeIsAudio()
{
  return MEMORY[0x1E0D39510]();
}

uint64_t IMUTTypeIsCalendar()
{
  return MEMORY[0x1E0D39518]();
}

uint64_t IMUTTypeIsImage()
{
  return MEMORY[0x1E0D39520]();
}

uint64_t IMUTTypeIsMap()
{
  return MEMORY[0x1E0D39528]();
}

uint64_t IMUTTypeIsMovie()
{
  return MEMORY[0x1E0D39530]();
}

uint64_t IMUTTypeIsPass()
{
  return MEMORY[0x1E0D39538]();
}

uint64_t IMUTTypeIsSupportedScreenshot()
{
  return MEMORY[0x1E0D39548]();
}

uint64_t IMUTTypeIsVCard()
{
  return MEMORY[0x1E0D39550]();
}

uint64_t IMWeakLinkClass()
{
  return MEMORY[0x1E0D36970]();
}

uint64_t IMWeakLinkSymbol()
{
  return MEMORY[0x1E0D36978]();
}

uint64_t IMXPCConfigureConnection()
{
  return MEMORY[0x1E0D36980]();
}

uint64_t IMXPCCreateConnectionForServiceWithQueue()
{
  return MEMORY[0x1E0D36988]();
}

uint64_t JWDecodeArray()
{
  return MEMORY[0x1E0D369D0]();
}

uint64_t JWDecodeCodableObjectWithStandardAllowlist()
{
  return MEMORY[0x1E0D369D8]();
}

uint64_t JWDecodeDictionary()
{
  return MEMORY[0x1E0D369E0]();
}

uint64_t JWEncodeCodableObject()
{
  return MEMORY[0x1E0D369E8]();
}

uint64_t JWEncodeDictionary()
{
  return MEMORY[0x1E0D369F0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

uint64_t NSStringFromIMCoreSpotlightIndexReason()
{
  return MEMORY[0x1E0D39630]();
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1E0CB3220](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

uint64_t OSLogHandleForIMEventCategory()
{
  return MEMORY[0x1E0D36B30]();
}

uint64_t OSLogHandleForIMFoundationCategory()
{
  return MEMORY[0x1E0D36B38]();
}

Boolean UTTypeConformsTo(CFStringRef inUTI, CFStringRef inConformsToUTI)
{
  return MEMORY[0x1E0CA5940](inUTI, inConformsToUTI);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x1E0C80940](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x1E0C9A0D0]();
}

uint64_t _CFIsDeallocating()
{
  return MEMORY[0x1E0C9A1D8]();
}

uint64_t _CFNonObjCEqual()
{
  return MEMORY[0x1E0C9A270]();
}

uint64_t _CFNonObjCHash()
{
  return MEMORY[0x1E0C9A278]();
}

uint64_t _CFNonObjCRelease()
{
  return MEMORY[0x1E0C9A280]();
}

uint64_t _CFNonObjCRetain()
{
  return MEMORY[0x1E0C9A288]();
}

uint64_t _CFRuntimeBridgeClasses()
{
  return MEMORY[0x1E0C9A490]();
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1E0C9A498]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1E0C9A4B0]();
}

uint64_t _CFTryRetain()
{
  return MEMORY[0x1E0C9A5A8]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x1E0C9A800]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x1E0C9A818]();
}

uint64_t _IMAlwaysLog()
{
  return MEMORY[0x1E0D36B60]();
}

uint64_t _IMStringStrippingControlCharacters()
{
  return MEMORY[0x1E0D39BB8]();
}

uint64_t _IMWarn()
{
  return MEMORY[0x1E0D36BA8]();
}

uint64_t _IMWillLog()
{
  return MEMORY[0x1E0D36BB0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1E0C80C70](*(_QWORD *)&a1);
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1E0C80C78](*(_QWORD *)&a1);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1E0DEEA28]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x1E0DE7A50](cls, name, imp, types);
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x1E0DE7AC8](cls);
}

objc_property_t class_getProperty(Class cls, const char *name)
{
  return (objc_property_t)MEMORY[0x1E0DE7AD0](cls, name);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C48](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x1E0C82D08](key);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
  MEMORY[0x1E0C82E80](queue, key, context, destructor);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C82E98](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
  MEMORY[0x1E0C82F08](object, queue);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x1E0DE7C98]();
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x1E0DE7D00](location);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F98](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

char *__cdecl property_copyAttributeValue(objc_property_t property, const char *attributeName)
{
  return (char *)MEMORY[0x1E0DE8060](property, attributeName);
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x1E0DE8070](property);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1E0C84E68](a1, a2);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84EA0](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84EB8](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84EC0](a1);
}

BOOL remove(const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return MEMORY[0x1E0C850B8](__p, __ec);
}

uint64_t sandbox_check_by_audit_token()
{
  return MEMORY[0x1E0C85180]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1E0C851A0]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1E0C851A8]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1E0C851F8]();
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1E0C85438](*(_QWORD *)&a1);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE8580](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x1E0DE8598](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x1E0DE85A0](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x1E0DE85A8](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x1E0DE85B0](a1, *(_QWORD *)&a2);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE85D8](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8650](a1);
}

int sqlite3_close_v2(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8658](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x1E0DE8660](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8668](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE8678](pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  double result;

  MEMORY[0x1E0DE8688](a1, *(_QWORD *)&iCol);
  return result;
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8690](a1, *(_QWORD *)&iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8698](a1, *(_QWORD *)&iCol);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return (const char *)MEMORY[0x1E0DE86A0](a1, *(_QWORD *)&N);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x1E0DE86B8](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE86C8](a1, *(_QWORD *)&iCol);
}

const char *__cdecl sqlite3_db_filename(sqlite3 *db, const char *zDbName)
{
  return (const char *)MEMORY[0x1E0DE8740](db, zDbName);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x1E0DE8788](a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1E0DE8798](a1, sql, callback, a4, errmsg);
}

int sqlite3_file_control(sqlite3 *a1, const char *zDbName, int op, void *a4)
{
  return MEMORY[0x1E0DE87C0](a1, zDbName, *(_QWORD *)&op, a4);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE87C8](pStmt);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x1E0DE8870](filename, ppDb, *(_QWORD *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1E0DE8880](db, zSql, *(_QWORD *)&nByte, ppStmt, pzTail);
}

void sqlite3_result_error(sqlite3_context *a1, const char *a2, int a3)
{
  MEMORY[0x1E0DE88D0](a1, a2, *(_QWORD *)&a3);
}

void sqlite3_result_int(sqlite3_context *a1, int a2)
{
  MEMORY[0x1E0DE88F0](a1, *(_QWORD *)&a2);
}

void sqlite3_result_text(sqlite3_context *a1, const char *a2, int a3, void (__cdecl *a4)(void *))
{
  MEMORY[0x1E0DE8910](a1, a2, *(_QWORD *)&a3, a4);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1E0DE89A8](a1);
}

int sqlite3_value_int(sqlite3_value *a1)
{
  return MEMORY[0x1E0DE8A48](a1);
}

const unsigned __int8 *__cdecl sqlite3_value_text(sqlite3_value *a1)
{
  return (const unsigned __int8 *)MEMORY[0x1E0DE8A60](a1);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1E0DEEB20]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastObjCProtocolUnconditional()
{
  return MEMORY[0x1E0DEEBC0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEC48]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1E0DEEC50]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1E0DEED40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1E0DEEDC8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1E0C859E0](*(_QWORD *)&a1);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
  MEMORY[0x1E0C85DE0](xarray, value);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1E0C85DF8](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C85E00](objects, count);
}

xpc_object_t xpc_array_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1E0C85E10]();
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1E0C85E30](xarray);
}

xpc_object_t xpc_array_get_dictionary(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1E0C85E50](xarray, index);
}

int64_t xpc_array_get_int64(xpc_object_t xarray, size_t index)
{
  return MEMORY[0x1E0C85E60](xarray, index);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return (const char *)MEMORY[0x1E0C85E70](xarray, index);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1E0C85E90](xarray, index);
}

void xpc_array_set_int64(xpc_object_t xarray, size_t index, int64_t value)
{
  MEMORY[0x1E0C85EC0](xarray, index, value);
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
  MEMORY[0x1E0C85ED0](xarray, index, string);
}

void xpc_array_set_value(xpc_object_t xarray, size_t index, xpc_object_t value)
{
  MEMORY[0x1E0C85EE8](xarray, index, value);
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return (xpc_object_t)MEMORY[0x1E0C85EF0](value);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x1E0C85F00](xBOOL);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F68](connection);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x1E0C85FD0]();
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x1E0C86008](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x1E0C86030](connection, message);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x1E0C86038](connection, message, replyq, handler);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1E0C86048](connection, message);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1E0C861F0](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1E0C86218]();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1E0C86228](original);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86260](xdict, key);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x1E0C86270](xdict);
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  double result;

  MEMORY[0x1E0C86298](xdict, key);
  return result;
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862A0](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862D0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

uint64_t xpc_dictionary_handoff_reply()
{
  return MEMORY[0x1E0C862F0]();
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x1E0C86330](xdict, key, bytes, length);
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
  MEMORY[0x1E0C86348](xdict, key, value);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86360](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x1E0C86398](xdict, key, value);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C863B8](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x1E0C86570](xint);
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x1E0C86658](object);
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1E0C86660](object);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1E0C86720](string);
}

