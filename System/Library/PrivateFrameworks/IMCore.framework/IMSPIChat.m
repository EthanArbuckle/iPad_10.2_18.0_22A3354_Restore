@implementation IMSPIChat

+ (void)enumerateAllChatsWithBlock:(id)a3
{
  void (**v3)(id, IMSPIChat *, _BYTE *);
  const __CFArray *v4;
  const __CFArray *v5;
  CFIndex v6;
  void *v7;
  IMSPIChat *v8;
  int v9;
  unsigned __int8 v10;

  v3 = (void (**)(id, IMSPIChat *, _BYTE *))a3;
  if (qword_1EE65F580 != -1)
    dispatch_once(&qword_1EE65F580, &unk_1E471D838);
  v4 = (const __CFArray *)off_1EE65F578();
  if (v4)
  {
    v5 = v4;
    v10 = 0;
    if (CFArrayGetCount(v4) >= 1)
    {
      v6 = 0;
      do
      {
        v7 = (void *)MEMORY[0x1A8582D94]();
        v8 = -[IMSPIChat initWithChatRecord:]([IMSPIChat alloc], "initWithChatRecord:", CFArrayGetValueAtIndex(v5, v6));
        if (v8)
          v3[2](v3, v8, &v10);
        v9 = v10;

        objc_autoreleasePoolPop(v7);
        if (v9)
          break;
        ++v6;
      }
      while (v6 < CFArrayGetCount(v5));
    }
    CFRelease(v5);
  }

}

- (void)enumerateAllAttachmentsWithBlock:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFArray *v8;
  const __CFArray *v9;
  CFIndex v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  IMSPIAttachment *v16;
  CFTypeRef v17;
  uint64_t v18;
  _BOOL8 v19;
  _BOOL8 v20;
  CFTypeRef v21;
  void *v22;
  IMSPIAttachment *v23;
  int v24;
  void *v25;
  void *v26;
  const __CFArray *v27;
  void (**v28)(id, void *, _BYTE *);
  const void *v29;
  void *v30;
  void *v31;
  CFTypeRef cf;
  CFTypeRef v33;
  __int16 v34;
  CFTypeRef v35;
  CFTypeRef v36;
  uint64_t v37;
  uint64_t v38;
  CFTypeRef v39;
  unsigned __int8 v40;
  void *v41;
  _QWORD v42[3];

  v42[1] = *MEMORY[0x1E0C80C00];
  v28 = (void (**)(id, void *, _BYTE *))a3;
  -[IMSPIChat chatIdentifier](self, "chatIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMSPIChat serviceName](self, "serviceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (qword_1EE65F590 != -1)
    dispatch_once(&qword_1EE65F590, &unk_1E4720B60);
  v8 = (const __CFArray *)off_1EE65F588(v5, v7);
  if (v8)
  {
    v9 = v8;
    v25 = v7;
    v26 = v5;
    v40 = 0;
    if (CFArrayGetCount(v8) >= 1)
    {
      v10 = 0;
      v27 = v9;
      while (1)
      {
        v11 = (void *)MEMORY[0x1A8582D94]();
        CFArrayGetValueAtIndex(v9, v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("guid"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "length"))
        {
          v14 = IMDAttachmentRecordCopyAttachmentForGUID();
          v38 = 0;
          v39 = 0;
          v36 = 0;
          v37 = 0;
          v35 = 0;
          v34 = 0;
          v33 = 0;
          v31 = v11;
          cf = 0;
          v30 = v12;
          if (qword_1EE65F5A0 != -1)
            dispatch_once(&qword_1EE65F5A0, &unk_1E4720B80);
          v29 = (const void *)v14;
          off_1EE65F598(v14, 0, &v38, 0, 0, &v39, &v36, 0, &v37, &v34, 0, 0, (char *)&v34 + 1, 0, &v35, 0, 0, 0, 0,
            0,
            0,
            &v33,
            &cf);
          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v39);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = [IMSPIAttachment alloc];
          v17 = v36;
          v18 = v37;
          v19 = HIBYTE(v34) != 0;
          v20 = (_BYTE)v34 != 0;
          v21 = v35;
          objc_msgSend(MEMORY[0x1E0C99D68], "__im_dateWithNanosecondTimeIntervalSinceReferenceDate:", (double)v38);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = -[IMSPIAttachment initWithGuid:fileUrl:transferState:uti:isSticker:isOutgoing:attributionInfo:creationDate:adaptiveImageGlyphContentIdentifier:adaptiveImageGlyphContentDescription:](v16, "initWithGuid:fileUrl:transferState:uti:isSticker:isOutgoing:attributionInfo:creationDate:adaptiveImageGlyphContentIdentifier:adaptiveImageGlyphContentDescription:", v13, v15, v18, v17, v19, v20, v21, v22, v33, cf);

          if (v33)
          {
            CFRelease(v33);
            v33 = 0;
          }
          if (cf)
          {
            CFRelease(cf);
            cf = 0;
          }
          v12 = v30;
          if (v39)
          {
            CFRelease(v39);
            v39 = 0;
          }
          if (v36)
          {
            CFRelease(v36);
            v36 = 0;
          }
          if (v35)
          {
            CFRelease(v35);
            v35 = 0;
          }
          CFRelease(v29);
          v28[2](v28, v23, &v40);
          v24 = v40;

          v9 = v27;
          v11 = v31;
          if (v24)
            break;
        }

        objc_autoreleasePoolPop(v11);
        if (++v10 >= CFArrayGetCount(v9))
          goto LABEL_23;
      }

      objc_autoreleasePoolPop(v31);
    }
LABEL_23:
    CFRelease(v9);
    v7 = v25;
    v5 = v26;
  }

}

- (void)enumerateAllMessagesWithBlock:(id)a3
{
  void (**v4)(id, void *, _BYTE *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  const __CFArray *v10;
  const __CFArray *v11;
  const void *ValueAtIndex;
  void *v13;
  void *v14;
  CFIndex Count;
  void *v16;
  const __CFArray *v17;
  const __CFArray *v18;
  CFIndex v19;
  void *v20;
  const void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  int v27;
  void *v28;
  const __CFArray *v29;
  void *v30;
  void *v31;
  unsigned __int8 v32;
  void *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, _BYTE *))a3;
  -[IMSPIChat chatIdentifier](self, "chatIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMSPIChat serviceName](self, "serviceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v10 = (const __CFArray *)IMDMessageRecordCopyMessagesWithChatIdentifiersOnServicesWithOnlyUnreadAndLimit();
  if (v10)
  {
    v11 = v10;
    if (CFArrayGetCount(v10) >= 1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v11, 0);
      _IMSPIMessageFromRecord((uint64_t)ValueAtIndex, 0, 0, v9, QOS_CLASS_DEFAULT);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v28 = v13;
        v29 = v11;
        objc_msgSend(v13, "guid");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        Count = 0;
        v32 = 0;
        v30 = v8;
        v31 = v6;
        while (1)
        {
          v16 = (void *)MEMORY[0x1A8582D94]();
          v17 = (const __CFArray *)IMDMessageRecordCopyMessagesWithChatIdentifiersOnServicesBeforeAndAfterGUIDWithOptionalThreadIdentifier();
          if (!v17)
            goto LABEL_19;
          v18 = v17;
          Count = CFArrayGetCount(v17);
          if (CFArrayGetCount(v18) < 1)
            goto LABEL_18;
          v19 = 0;
          while (1)
          {
            v20 = (void *)MEMORY[0x1A8582D94]();
            v21 = CFArrayGetValueAtIndex(v18, v19);
            _IMSPIMessageFromRecord((uint64_t)v21, 0, 0, v9, QOS_CLASS_DEFAULT);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v22;
            if (!v22)
              goto LABEL_13;
            objc_msgSend(v22, "text");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (v24)
              break;
            objc_msgSend(v23, "attributedText");
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            if (v25)
              goto LABEL_12;
LABEL_13:
            if (!v19)
            {
              objc_msgSend(v23, "guid");
              v26 = objc_claimAutoreleasedReturnValue();

              v14 = (void *)v26;
            }

            objc_autoreleasePoolPop(v20);
            if (++v19 >= CFArrayGetCount(v18))
              goto LABEL_18;
          }

LABEL_12:
          v4[2](v4, v23, &v32);
          if (!v32)
            goto LABEL_13;

          objc_autoreleasePoolPop(v20);
LABEL_18:
          CFRelease(v18);
          v8 = v30;
          v6 = v31;
LABEL_19:
          v27 = v32;
          objc_autoreleasePoolPop(v16);
          if (v27 || Count <= 999)
          {

            v11 = v29;
            break;
          }
        }
      }
    }
    CFRelease(v11);
  }

}

- (IMSPIChat)initWithChatRecord:(_IMDChatRecordStruct *)a3
{
  IMSPIChat *v4;
  NSString *serviceName;
  NSString *guid;
  NSString *chatIdentifier;
  NSString *displayName;
  void *v9;
  id v10;
  unint64_t v11;
  void *v12;
  IMSPIChat *v13;
  NSObject *v14;
  NSString *v15;
  NSString *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSString *v22;
  NSString *v23;
  NSString *v24;
  NSString *v25;
  objc_super v26;
  uint8_t buf[4];
  NSString *v28;
  __int16 v29;
  NSString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v26.receiver = self;
  v26.super_class = (Class)IMSPIChat;
  v4 = -[IMSPIChat init](&v26, sel_init);
  if (!v4)
  {
LABEL_14:
    v13 = v4;
    goto LABEL_20;
  }
  v24 = 0;
  v25 = 0;
  v22 = 0;
  v23 = 0;
  v20 = 0;
  v21 = 0;
  v18 = 0;
  v19 = 0;
  if (qword_1EE65F720 != -1)
    dispatch_once(&qword_1EE65F720, &unk_1E471DC38);
  off_1EE65F718(a3, &v21, 0, 0, 0, &v23, &v25, &v24, 0, &v22, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    &v20,
    0,
    0,
    &v19,
    &v18);
  serviceName = v4->_serviceName;
  v4->_serviceName = v25;

  guid = v4->_guid;
  v4->_guid = v24;

  chatIdentifier = v4->_chatIdentifier;
  v4->_chatIdentifier = v23;

  displayName = v4->_displayName;
  v4->_displayName = v22;

  v4->_isGroup = v21 != 45;
  v4->_isBlackholed = v20 != 0;
  if (v4->_guid && v4->_serviceName)
  {
    if (qword_1EE65F730 != -1)
      dispatch_once(&qword_1EE65F730, &unk_1E471C5D0);
    v9 = (void *)off_1EE65F728(a3);
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (objc_msgSend(v9, "count"))
    {
      v11 = 0;
      do
      {
        sub_1A2152E38((IMSPIHandle *)objc_msgSend(v9, "objectAtIndex:", v11));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v10, "addObject:", v12);

        ++v11;
      }
      while (v11 < objc_msgSend(v9, "count"));
    }
    -[IMSPIChat setHandles:](v4, "setHandles:", v10);

    goto LABEL_14;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = v4->_guid;
      v16 = v4->_serviceName;
      *(_DWORD *)buf = 138412546;
      v28 = v15;
      v29 = 2112;
      v30 = v16;
      _os_log_impl(&dword_1A1FF4000, v14, OS_LOG_TYPE_INFO, "Cannot initialize chat with record: guid: %@ service: %@.", buf, 0x16u);
    }

  }
  v13 = 0;
LABEL_20:

  return v13;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  const __CFString *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[IMSPIChat chatIdentifier](self, "chatIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMSPIChat guid](self, "guid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMSPIChat serviceName](self, "serviceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMSPIChat displayName](self, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[IMSPIChat isGroup](self, "isGroup");
  v9 = CFSTR("NO");
  if (v8)
    v9 = CFSTR("YES");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("IMSPIChat: %p [ChatIdentifier: %@  guid: %@, serviceName: %@, displayName: %@, isGroup: %@]"), self, v4, v5, v6, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)guid
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setGuid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)chatIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setChatIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)serviceName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setServiceName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (BOOL)isGroup
{
  return self->_isGroup;
}

- (void)setIsGroup:(BOOL)a3
{
  self->_isGroup = a3;
}

- (BOOL)isBlackholed
{
  return self->_isBlackholed;
}

- (NSArray)handles
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setHandles:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handles, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_chatIdentifier, 0);
  objc_storeStrong((id *)&self->_guid, 0);
}

@end
