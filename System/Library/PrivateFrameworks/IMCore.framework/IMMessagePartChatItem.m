@implementation IMMessagePartChatItem

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;
  NSRange v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)IMMessagePartChatItem;
  -[IMTranscriptChatItem description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  IMLoggingStringForMessageData();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray description](self->_visibleAssociatedMessageChatItems, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11.location = -[IMMessagePartChatItem messagePartRange](self, "messagePartRange");
  NSStringFromRange(v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@ text:%@, visibleAssociatedMessageChatItems: %@, messagePartRange: %@]"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (int64_t)messagePartAttributeName
{
  void *v2;
  void *v3;
  int64_t v4;

  -[IMMessagePartChatItem text](self, "text");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D366B8], 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  NSAttributedString *text;
  int64_t index;
  _NSRange *p_messagePartRange;
  void *v9;
  void *v10;

  v4 = objc_alloc((Class)objc_opt_class());
  -[IMChatItem _item](self, "_item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  text = self->_text;
  index = self->_index;
  p_messagePartRange = &self->_messagePartRange;
  -[IMMessagePartChatItem visibleAssociatedMessageChatItems](self, "visibleAssociatedMessageChatItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v4, "_initWithItem:text:index:messagePartRange:visibleAssociatedMessageChatItems:", v5, text, index, p_messagePartRange->location, p_messagePartRange->length, v9);

  return v10;
}

- (BOOL)canDelete
{
  void *v3;
  unint64_t v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  int v11;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isScheduledMessagesCoreEnabled"))
  {
    v4 = -[IMMessagePartChatItem scheduleType](self, "scheduleType");

    if (v4 == 2)
      return MEMORY[0x1E0DE7D20](self, sel__canDeleteForCurrentScheduleState);
  }
  else
  {

  }
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isCarrierPigeonEnabled");

  if (v6)
  {
    -[IMChatItem _item](self, "_item");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "service");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D38F70]))
    {

    }
    else
    {
      objc_msgSend(v7, "service");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D38F60]);

      if (!v11)
        goto LABEL_12;
    }
    if (-[IMMessageChatItem isFromMe](self, "isFromMe") && (objc_msgSend(v7, "isSent") & 1) == 0)
    {
      v9 = objc_msgSend(v7, "errorCode") != 0;
      goto LABEL_14;
    }
LABEL_12:
    v9 = 1;
LABEL_14:

    return v9;
  }
  return 1;
}

- (BOOL)_canDeleteForCurrentScheduleState
{
  unint64_t v2;

  v2 = -[IMMessagePartChatItem scheduleState](self, "scheduleState");
  return (v2 < 6) & (0x39u >> v2);
}

- (void)setIsBusiness:(BOOL)a3
{
  self->_isBusiness = a3;
}

- (BOOL)isBusiness
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  if (self->_isBusiness)
    return 1;
  -[IMChatItem _item](self, "_item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "message");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isMapKitBusiness");

  return v6;
}

- (void)setSuggestedActionsList:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedActionsList, a3);
}

- (void)setChipListFromText:(id)a3
{
  id v3;

  v3 = -[IMMessagePartChatItem extractAndSetChipListFrom:](self, "extractAndSetChipListFrom:", a3);
}

- (void)setIsStewie:(BOOL)a3
{
  void *v4;
  int v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "stewieEnabled");

  if (v5)
  {
    -[IMChatItem _item](self, "_item");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setIsStewie:", 1);

  }
}

- (BOOL)isStewie
{
  void *v3;
  int v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "stewieEnabled");

  if (!v4)
    return 0;
  -[IMChatItem _item](self, "_item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isStewie") & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    -[IMChatItem _item](self, "_item");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "message");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "subject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v9, "isStewie");

  }
  return v6;
}

- (int64_t)stewieConversationID
{
  void *v2;
  int64_t v3;

  -[IMChatItem _item](self, "_item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "stewieConversationID");

  return v3;
}

- (BOOL)canRetract
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  BOOL v7;
  NSObject *v8;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[IMChatItem _item](self, "_item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "eligibilityForEditType:messagePartIndex:", 2, -[IMMessagePartChatItem index](self, "index"));
  v5 = v4;
  if ((unint64_t)(v4 - 1) >= 8)
  {
    if (!v4 && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v10 = 134217984;
        v11 = 0;
        _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "Message can be retracted, message edit eligibility is %ld", (uint8_t *)&v10, 0xCu);
      }

    }
    v7 = 1;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v10 = 134217984;
        v11 = v5;
        _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "Message cannot be retracted, message is not eligible to be edited. Edit Eligibility: %ld", (uint8_t *)&v10, 0xCu);
      }

    }
    v7 = 0;
  }

  return v7;
}

- (BOOL)hasSubject
{
  return 0;
}

- (BOOL)isCorrupt
{
  void *v2;
  char v3;

  -[IMChatItem _item](self, "_item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCorrupt");

  return v3;
}

+ (id)_guidForMessage:(id)a3 url:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a4;
  objc_msgSend(a3, "guid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@:%@"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_newMessagePartArrayForMessageItem:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(a1, "_newMessagePartsForMessageItem:", a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
  }
  else
  {
    v7[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

+ (id)_newMessagePartsForMessageItem:(id)a3
{
  return (id)objc_msgSend(a1, "_newMessagePartsForMessageItem:chatContext:", a3, 0);
}

+ (id)_defaultRichLinkAllowlist
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D36A98], "pairWithFirst:second:", CFSTR("icloud"), CFSTR("com"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0D36A98], "pairWithFirst:second:", CFSTR("appsto"), CFSTR("re"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_defaultRichLinkAllowListExceptions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D36A98];
  objc_msgSend(MEMORY[0x1E0D36A98], "pairWithFirst:second:", CFSTR("icloud"), CFSTR("com"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pairWithFirst:second:", v3, &unk_1E475EE98);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)_isPathExceptionToAllowlistedURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  BOOL v33;
  void *v35;
  id obj;
  char v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("richLink-whitelist-exceptions"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = v6;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v43 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          if (objc_msgSend(v13, "count") == 3)
          {
            v14 = (void *)MEMORY[0x1E0D36A98];
            objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "pairWithFirst:second:", v15, v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0D36A98], "pairWithFirst:second:", v17, v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v19);

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      }
      while (v10);
    }

    v6 = v35;
  }
  else
  {
    objc_msgSend(a1, "_defaultRichLinkAllowListExceptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v7;
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v39;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v39 != v22)
          objc_enumerationMutation(obj);
        v24 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
        objc_msgSend(v24, "first");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "first");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "first");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "second");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v4, "__im_conformsToDomain:domainExtension:", v26, v28))
        {
          objc_msgSend(v4, "pathComponents");
          v29 = v22;
          v30 = v4;
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "second");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v31, "isEqualToArray:", v32);

          v4 = v30;
          v22 = v29;

          if ((v37 & 1) != 0)
          {
            v33 = 1;
            goto LABEL_25;
          }
        }
        else
        {

        }
      }
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v21);
    v33 = 0;
LABEL_25:
    v6 = v35;
  }
  else
  {
    v33 = 0;
  }

  return v33;
}

+ (BOOL)_isAllowlistedURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  BOOL v26;
  id v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("richLink-whitelist"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    v28 = a1;
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v29 = v6;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v35 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          if (objc_msgSend(v13, "count", v28) == 2)
          {
            objc_msgSend(v13, "firstObject");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "lastObject");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0D36A98], "pairWithFirst:second:", v14, v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v16);

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v10);
    }

    a1 = v28;
    v6 = v29;
  }
  else
  {
    objc_msgSend(a1, "_defaultRichLinkAllowlist");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v17 = v7;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v31 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
        objc_msgSend(v22, "first", v28);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "second");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v4, "__im_conformsToDomain:domainExtension:", v23, v24))
        {
          v25 = objc_msgSend(a1, "_isPathExceptionToAllowlistedURL:", v4);

          if ((v25 & 1) == 0)
          {
            v26 = 1;
            goto LABEL_25;
          }
        }
        else
        {

        }
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v19);
  }
  v26 = 0;
LABEL_25:

  return v26;
}

+ (BOOL)_isAllowlistedRichLinkSender:(id)a3 isBusiness:(BOOL)a4
{
  int v4;
  id v5;
  void *v6;

  v4 = a4;
  v5 = a3;
  if ((objc_msgSend(v5, "hasPrefix:", CFSTR("urn:biz:")) & 1) != 0 || v4)
  {
    if (objc_msgSend(v5, "length"))
    {
      IMSharedHelperBusinessAllowlist();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v4) = objc_msgSend(v6, "containsObject:", v5);

    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }

  return v4;
}

+ (id)_additionalSupportedRichLinkSchemesForAllowlistedSender:(id)a3
{
  return &unk_1E475EEB0;
}

+ (id)_richLinkRangesForMessageText:(id)a3 sender:(id)a4 isAllowlistedRichLinkSender:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;

  v5 = a5;
  v8 = a3;
  if (v5)
  {
    objc_msgSend(a1, "_additionalSupportedRichLinkSchemesForAllowlistedSender:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  IMRichLinkUtilitiesDetermineRichLinksInMessage(v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (BOOL)_supportsRichLinkURL:(id)a3 forSender:(id)a4 isAllowlistedRichLinkSender:(BOOL)a5
{
  id v7;
  id v8;
  char v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;

  v7 = a3;
  v8 = a4;
  v9 = v7 != 0;
  if (v7 && !a5)
  {
    if (IMIsRunningInUnitTesting()
      && (objc_msgSend(v7, "absoluteString"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "containsString:", CFSTR("split")),
          v10,
          (v11 & 1) != 0))
    {
      v9 = 1;
    }
    else
    {
      +[IMBalloonPluginManager sharedInstance](IMBalloonPluginManager, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v12, "dataSourceClassForBundleID:", *MEMORY[0x1E0D375F8]);

      v9 = objc_msgSend(v13, "supportsURL:", v7);
    }
  }

  return v9;
}

+ (id)_newMessagePartsForMessageItem:(id)a3 chatContext:(id)a4
{
  return (id)objc_msgSend(a1, "_newMessagePartsForMessageItem:chatContext:photosPluginPayload:", a3, a4, 0);
}

+ (id)messageBodyStringForCMMMessage:(id)a3
{
  id v3;
  id v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  NSObject *v8;
  const void *v9;
  uint64_t v10;
  void *v11;
  __CFDictionary *v12;
  __CFDictionary *v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  unint64_t v19;
  __int16 v20;
  unint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  objc_msgSend(v3, "fileTransferGUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  v7 = objc_msgSend(v3, "getCMMAssetOffset");
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      v19 = v6;
      v20 = 2048;
      v21 = v7;
      _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "CMM has %lu transfers, ignoring %lu", buf, 0x16u);
    }

  }
  if (v7 < v6)
  {
    v9 = (const void *)*MEMORY[0x1E0D36430];
    v10 = *MEMORY[0x1E0D362F8];
    do
    {
      objc_msgSend(v5, "objectAtIndex:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v13 = v12;
      if (v11)
        CFDictionarySetValue(v12, v9, v11);
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v10, v13);
      objc_msgSend(v4, "appendAttributedString:", v14);

      ++v7;
    }
    while (v6 != v7);
  }
  objc_msgSend(v4, "__im_attributedStringByAssigningMessagePartNumbers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");

  return v16;
}

+ (id)_newDetonatedMessagePartsForMessageItem:(id)a3 chatContext:(id)a4 photosPluginPayload:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v7, "isCorrupt"))
  {
    v10 = objc_alloc(MEMORY[0x1E0CB3778]);
    IMCoreLocalizedString(CFSTR("CORRUPT_MESSAGE_FALLBACK_TEXT"), CFSTR("Tap to show message"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithString:attributes:", v11, 0);

    LOWORD(v26) = 0;
    v13 = -[IMTextMessagePartChatItem _initWithItem:text:index:messagePartRange:subject:shouldDisplayLink:isShowingEditHistory:]([IMTextMessagePartChatItem alloc], "_initWithItem:text:index:messagePartRange:subject:shouldDisplayLink:isShowingEditHistory:", v7, v12, 0, 0, objc_msgSend(v12, "length"), 0, v26);
  }
  else
  {
    objc_msgSend(v7, "body");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v14, "mutableCopy");

    objc_msgSend(v12, "mutableString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "replaceOccurrencesOfString:withString:options:range:", *MEMORY[0x1E0D36318], &stru_1E4725068, 0, 0, objc_msgSend(v12, "length"));

    v41 = 0;
    v42 = &v41;
    v43 = 0x3032000000;
    v44 = sub_1A200ADD4;
    v45 = sub_1A200AC5C;
    v46 = 0;
    v35 = 0;
    v36 = &v35;
    v37 = 0x3032000000;
    v38 = sub_1A200ADD4;
    v39 = sub_1A200AC5C;
    v40 = 0;
    v16 = objc_msgSend(v12, "length");
    objc_msgSend(v7, "subject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = objc_alloc(MEMORY[0x1E0CB3498]);
      objc_msgSend(v7, "subject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v18, "initWithString:", v19);

    }
    else
    {
      v20 = 0;
    }

    if (objc_msgSend(v12, "length"))
    {
      v21 = *MEMORY[0x1E0D366B8];
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = sub_1A20848E8;
      v27[3] = &unk_1E4720090;
      v33 = 0;
      v34 = v16;
      v28 = v12;
      v29 = v7;
      v30 = v20;
      v31 = &v41;
      v32 = &v35;
      objc_msgSend(v28, "enumerateAttribute:inRange:options:usingBlock:", v21, 0, v16, 0, v27);

      v22 = v28;
    }
    else
    {
      LOBYTE(v26) = 0;
      v23 = -[IMTextMessagePartChatItem _initWithItem:text:index:messagePartRange:subject:isShowingEditHistory:]([IMDetonatedMessagePartChatItem alloc], "_initWithItem:text:index:messagePartRange:subject:isShowingEditHistory:", v7, 0, 0, 0, 0, v20, v26);
      v22 = (id)v42[5];
      v42[5] = (uint64_t)v23;
    }

    v24 = (void *)v42[5];
    if (!v24)
      v24 = (void *)v36[5];
    v13 = v24;

    _Block_object_dispose(&v35, 8);
    _Block_object_dispose(&v41, 8);

  }
  return v13;
}

+ (id)_singleChatItemForDeviceActionMessage:(id)a3 context:(id)a4 pluginPayload:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  int v11;
  IMTranscriptPluginChatItem *v12;
  uint64_t v13;
  id v14;

  v7 = a3;
  v8 = a5;
  v9 = a4;
  v10 = objc_msgSend(v9, "serviceType");
  v11 = objc_msgSend(v9, "areSendersUnknown");

  v12 = [IMTranscriptPluginChatItem alloc];
  v13 = 1;
  if (v11 && v10 != 3)
    v13 = objc_msgSend(v7, "isFromMe");
  v14 = -[IMTranscriptPluginChatItem _initWithItem:initialPayload:index:messagePartRange:parentChatHasKnownParticipants:](v12, "_initWithItem:initialPayload:index:messagePartRange:parentChatHasKnownParticipants:", v7, v8, 0, 0, 0x7FFFFFFFFFFFFFFFLL, v13);

  return v14;
}

+ (id)_newMessagePartsForMessageItem:(id)a3 chatContext:(id)a4 photosPluginPayload:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  BOOL v12;
  char v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  unint64_t v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  char v29;
  char v30;
  NSObject *v31;
  id v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  id v36;
  id v37;
  void *v38;
  _BOOL4 v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  int v44;
  void *v45;
  uint64_t v46;
  void *v47;
  BOOL v48;
  void *v49;
  id v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  void *v75;
  IMTextMessagePartChatItem *v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  uint8_t *v81;
  id v82;
  id v83;
  void *v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  IMAggregateMessagePartChatItem *v93;
  uint64_t v94;
  void *v95;
  id v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t i;
  void *v100;
  id v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t j;
  void *v105;
  id v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t k;
  uint64_t v110;
  void *v111;
  uint64_t *v112;
  id v113;
  void *v114;
  void *v115;
  uint64_t v116;
  void *v117;
  void *v118;
  id v119;
  void *v120;
  uint64_t v122;
  char v123;
  char v124;
  id v125;
  char v126;
  id v127;
  char v128;
  id v129;
  BOOL v130;
  void *v131;
  unint64_t v132;
  id obj;
  id obja;
  id objb;
  void *v136;
  char v137;
  uint64_t v138;
  uint64_t v139;
  char v140;
  uint64_t v141;
  void *v142;
  void *v143;
  uint64_t v144;
  id v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  _QWORD v162[4];
  id v163;
  id v164;
  id v165;
  id v166;
  id v167;
  _BYTE *v168;
  uint8_t *v169;
  uint64_t *v170;
  uint64_t v171;
  unint64_t v172;
  id v173;
  unint64_t v174;
  id v175;
  char v176;
  char v177;
  char v178;
  BOOL v179;
  char v180;
  BOOL v181;
  char v182;
  _QWORD v183[4];
  id v184;
  _BYTE *v185;
  id v186;
  uint64_t v187;
  uint64_t *v188;
  uint64_t v189;
  uint64_t (*v190)(uint64_t, uint64_t);
  void (*v191)(uint64_t);
  id v192;
  uint8_t v193[8];
  uint8_t *v194;
  uint64_t v195;
  uint64_t (*v196)(uint64_t, uint64_t);
  void (*v197)(uint64_t);
  id v198;
  _BYTE v199[128];
  _BYTE v200[128];
  _BYTE v201[128];
  _BYTE v202[128];
  uint64_t v203;
  _BYTE buf[24];
  void *v205;
  uint64_t v206;

  v206 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!objc_msgSend(v8, "wasDetonated"))
  {
    v145 = v10;
    v144 = objc_msgSend(v9, "serviceType");
    v12 = v144 == 3;
    v140 = objc_msgSend(v9, "areSendersUnknown");
    if (!v9 || objc_msgSend(v9, "serviceType") == 1)
      goto LABEL_5;
    if (objc_msgSend(v9, "serviceType") == 5)
    {
      objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v33, "isTranscriptSharingEnabled");

      v12 = v144 == 3;
    }
    else
    {
      if ((objc_msgSend(v9, "hasResponded") & 1) != 0
        || !objc_msgSend(v9, "filterCategory")
        || !objc_msgSend(v8, "_isSenderUnknown"))
      {
LABEL_5:
        v13 = 1;
        goto LABEL_6;
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v193 = 0;
          _os_log_impl(&dword_1A1FF4000, v34, OS_LOG_TYPE_INFO, "Not displaying link, sender is unknown and there's no reply in chat", v193, 2u);
        }

      }
      v13 = 0;
    }
LABEL_6:
    *(_QWORD *)v193 = 0;
    v194 = v193;
    v195 = 0x3032000000;
    v196 = sub_1A200ADD4;
    v197 = sub_1A200AC5C;
    v198 = 0;
    v187 = 0;
    v188 = &v187;
    v189 = 0x3032000000;
    v190 = sub_1A200ADD4;
    v191 = sub_1A200AC5C;
    v192 = 0;
    if (objc_msgSend(v8, "isCorrupt"))
    {
      v14 = objc_alloc(MEMORY[0x1E0CB3778]);
      IMCoreLocalizedString(CFSTR("CORRUPT_MESSAGE_FALLBACK_TEXT"), CFSTR("Tap to show message"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v14, "initWithString:attributes:", v15, 0);

      LOWORD(v122) = 0;
      v17 = -[IMTextMessagePartChatItem _initWithItem:text:index:messagePartRange:subject:shouldDisplayLink:isShowingEditHistory:]([IMTextMessagePartChatItem alloc], "_initWithItem:text:index:messagePartRange:subject:shouldDisplayLink:isShowingEditHistory:", v8, v16, 0, 0, objc_msgSend(v16, "length"), 0, v122);
      v18 = (void *)*((_QWORD *)v194 + 5);
      *((_QWORD *)v194 + 5) = v17;

      v11 = *((id *)v194 + 5);
LABEL_142:

      _Block_object_dispose(&v187, 8);
      _Block_object_dispose(v193, 8);

      v10 = v145;
      goto LABEL_143;
    }
    v130 = v12;
    objc_msgSend(v8, "service");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMService iMessageService](IMServiceImpl, "iMessageService");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "internalName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v19, "isEqualToIgnoringCase:", v21);

    v23 = 2000;
    if (v22)
      v23 = 4000;
    obj = (id)v23;
    v24 = objc_msgSend(v8, "getCMMState");
    if (v24
      || (objc_msgSend(v8, "balloonBundleID"),
          v25 = (void *)objc_claimAutoreleasedReturnValue(),
          IMBalloonExtensionIDWithSuffix(),
          v26 = (void *)objc_claimAutoreleasedReturnValue(),
          v27 = objc_msgSend(v25, "isEqualToString:", v26),
          v26,
          v25,
          (v27 & 1) != 0))
    {
      +[IMCoreAccountsMonitor sharedInstance](IMCoreAccountsMonitor, "sharedInstance");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "isSignedIntoiCloud");

      if (v24 < 4)
        v30 = v29;
      else
        v30 = 0;
      v128 = v29 ^ 1;
      v126 = v30;
      if (v24)
      {
        objc_msgSend(a1, "messageBodyStringForCMMMessage:", v8);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v8, "guid");
            v32 = (id)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = v32;
            *(_WORD *)&buf[12] = 2048;
            *(_QWORD *)&buf[14] = v24;
            *(_WORD *)&buf[22] = 2112;
            v205 = v16;
            _os_log_impl(&dword_1A1FF4000, v31, OS_LOG_TYPE_INFO, "Using Dynamic body for CMM %@, state %lu: %@", buf, 0x20u);

          }
        }
        if (v16)
        {
          v137 = 1;
          if (objc_msgSend(v16, "length"))
            goto LABEL_43;
          goto LABEL_38;
        }
      }
      else
      {
        IMLogHandleForCategory();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          sub_1A219690C();

        v16 = 0;
      }
      v137 = 1;
    }
    else
    {
      v16 = 0;
      v128 = 0;
      v137 = 0;
      v126 = 0;
    }
LABEL_38:
    v36 = objc_alloc(MEMORY[0x1E0CB3778]);
    v37 = v8;
    if (objc_msgSend(v37, "hasDataDetectorResults")
      && (objc_msgSend(v37, "body"),
          v38 = (void *)objc_claimAutoreleasedReturnValue(),
          v39 = objc_msgSend(v38, "length") < (unint64_t)obj,
          v38,
          v39))
    {
      objc_msgSend(v37, "body");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = sub_1A2122334(v40);

    }
    else
    {
      objc_msgSend(v37, "body");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v42 = objc_msgSend(v36, "initWithAttributedString:", v41);
    v16 = (void *)v42;
LABEL_43:
    v203 = *MEMORY[0x1E0D365F0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v203, 1);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v16, "__im_containsAttributedValue:", v43);

    if (v44)
      IMRemoveTrackingInformationFromMutableAttributedString(v16);
    objc_msgSend(v8, "sender");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(a1, "_isAllowlistedRichLinkSender:isBusiness:", v45, v144 == 3);

    if (v24 || !objc_msgSend(v8, "hasDataDetectorResults"))
    {
      v143 = 0;
    }
    else
    {
      objc_msgSend(v8, "sender");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_richLinkRangesForMessageText:sender:isAllowlistedRichLinkSender:", v16, v47, v46);
      v143 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if ((v13 & 1) != 0)
    {
      v48 = 1;
    }
    else if (objc_msgSend(v143, "count"))
    {
      objc_msgSend(v16, "string");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      LOBYTE(v205) = 0;
      v183[0] = MEMORY[0x1E0C809B0];
      v183[1] = 3221225472;
      v183[2] = sub_1A2085D98;
      v183[3] = &unk_1E47200B8;
      v50 = v49;
      v186 = a1;
      v184 = v50;
      v185 = buf;
      objc_msgSend(v143, "enumerateObjectsUsingBlock:", v183);
      v48 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;

      _Block_object_dispose(buf, 8);
    }
    else
    {
      v48 = 0;
    }
    if ((v137 & 1) == 0)
    {
      objc_msgSend(v16, "mutableString");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v16, "length");
      objc_msgSend(v51, "replaceOccurrencesOfString:withString:options:range:", *MEMORY[0x1E0D36318], &stru_1E4725068, 0, 0, v52);

    }
    v132 = objc_msgSend(v16, "length");
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v205) = 0;
    objc_msgSend(v8, "retractedPartIndexes");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "richCardsChatItemsForMessageItem:text:", v8, v16);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v53;
    if (v53)
    {
      v11 = v53;
LABEL_141:

      _Block_object_dispose(buf, 8);
      goto LABEL_142;
    }
    objc_msgSend(a1, "standaloneChipListChatItemForMessageItem:text:", v8, v16);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v55;
    if (v55)
    {
      v11 = v55;
LABEL_140:

      v54 = 0;
      goto LABEL_141;
    }
    v124 = v140 ^ 1;
    v141 = *MEMORY[0x1E0D366B8];
    v162[0] = MEMORY[0x1E0C809B0];
    v162[1] = 3221225472;
    v162[2] = sub_1A2085E54;
    v162[3] = &unk_1E4720108;
    v171 = 0;
    v172 = v132;
    v163 = v16;
    v57 = v8;
    v164 = v57;
    v173 = a1;
    v176 = v126;
    v177 = v128;
    v125 = v136;
    v165 = v125;
    v168 = buf;
    v178 = v137;
    v129 = v9;
    v166 = v129;
    v169 = v193;
    v170 = &v187;
    v174 = v132;
    v175 = obj;
    v179 = v48;
    v180 = v46;
    v167 = v143;
    v181 = v130;
    v182 = v124;
    v127 = v163;
    objc_msgSend(v163, "enumerateAttribute:inRange:options:usingBlock:", v141, 0, v132, 0, v162);
    v142 = v57;
    objc_msgSend(v57, "subject");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v131)
    {
LABEL_79:
      if (v132 > (unint64_t)obj)
      {
        if (*((_QWORD *)v194 + 5))
        {
          v82 = objc_alloc(MEMORY[0x1E0C99D20]);
          obja = (id)objc_msgSend(v82, "initWithObjects:", *((_QWORD *)v194 + 5), 0);
          v83 = -[IMAggregateMessagePartChatItem _initWithItem:messagePartRange:subparts:]([IMAggregateMessagePartChatItem alloc], "_initWithItem:messagePartRange:subparts:", v142, 0, v132, obja);
          v84 = (void *)*((_QWORD *)v194 + 5);
          *((_QWORD *)v194 + 5) = v83;

          objc_msgSend(*((id *)v194 + 5), "setChipListFromText:", v127);
        }
        else
        {
          if (!v188[5])
            goto LABEL_83;
          v160 = 0u;
          v161 = 0u;
          v158 = 0u;
          v159 = 0u;
          obja = (id)v188[5];
          v86 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v158, v202, 16);
          if (!v86)
          {
LABEL_96:

            v93 = [IMAggregateMessagePartChatItem alloc];
            v94 = -[IMAggregateMessagePartChatItem _initWithItem:messagePartRange:subparts:](v93, "_initWithItem:messagePartRange:subparts:", v142, 0, v132, v188[5]);
            v95 = (void *)*((_QWORD *)v194 + 5);
            *((_QWORD *)v194 + 5) = v94;

            objc_msgSend(*((id *)v194 + 5), "setChipListFromText:", v127);
            objb = (id)v188[5];
            v188[5] = 0;

            goto LABEL_83;
          }
          v139 = *(_QWORD *)v159;
LABEL_89:
          v87 = 0;
          while (1)
          {
            if (*(_QWORD *)v159 != v139)
              objc_enumerationMutation(obja);
            v88 = *(void **)(*((_QWORD *)&v158 + 1) + 8 * v87);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v88, "transferGUID");
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              +[IMFileTransferCenter sharedInstance](IMFileTransferCenter, "sharedInstance");
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v90, "transferForGUID:", v89);
              v91 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v91, "type");
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v90) = objc_msgSend(a1, "_shouldAggregateForTransferType:", v92);

              if (!(_DWORD)v90)
                break;
            }
            if (v86 == ++v87)
            {
              v86 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v158, v202, 16);
              if (v86)
                goto LABEL_89;
              goto LABEL_96;
            }
          }
        }

      }
LABEL_83:
      if (v144 == 3)
      {
        v85 = (void *)*((_QWORD *)v194 + 5);
        if (v85)
        {
          objc_msgSend(v85, "setIsBusiness:", 1);
        }
        else if (v188[5])
        {
          v156 = 0u;
          v157 = 0u;
          v154 = 0u;
          v155 = 0u;
          v96 = (id)v188[5];
          v97 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v154, v201, 16);
          if (v97)
          {
            v98 = *(_QWORD *)v155;
            do
            {
              for (i = 0; i != v97; ++i)
              {
                if (*(_QWORD *)v155 != v98)
                  objc_enumerationMutation(v96);
                objc_msgSend(*(id *)(*((_QWORD *)&v154 + 1) + 8 * i), "setIsBusiness:", 1);
              }
              v97 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v154, v201, 16);
            }
            while (v97);
          }

        }
      }
      if (objc_msgSend(v129, "serviceType") == 4)
      {
        v100 = (void *)*((_QWORD *)v194 + 5);
        if (v100)
        {
          objc_msgSend(v100, "setIsStewie:", 1);
        }
        else if (v188[5])
        {
          v152 = 0u;
          v153 = 0u;
          v150 = 0u;
          v151 = 0u;
          v101 = (id)v188[5];
          v102 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v150, v200, 16);
          if (v102)
          {
            v103 = *(_QWORD *)v151;
            do
            {
              for (j = 0; j != v102; ++j)
              {
                if (*(_QWORD *)v151 != v103)
                  objc_enumerationMutation(v101);
                objc_msgSend(*(id *)(*((_QWORD *)&v150 + 1) + 8 * j), "setIsStewie:", 1);
              }
              v102 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v150, v200, 16);
            }
            while (v102);
          }

        }
      }
      if (objc_msgSend(v142, "isPendingSatelliteSend"))
      {
        v105 = (void *)*((_QWORD *)v194 + 5);
        if (v105)
        {
          objc_msgSend(v105, "setPendingSatelliteSend:", 1);
        }
        else if (v188[5])
        {
          v148 = 0u;
          v149 = 0u;
          v146 = 0u;
          v147 = 0u;
          v106 = (id)v188[5];
          v107 = objc_msgSend(v106, "countByEnumeratingWithState:objects:count:", &v146, v199, 16);
          if (v107)
          {
            v108 = *(_QWORD *)v147;
            do
            {
              for (k = 0; k != v107; ++k)
              {
                if (*(_QWORD *)v147 != v108)
                  objc_enumerationMutation(v106);
                objc_msgSend(*(id *)(*((_QWORD *)&v146 + 1) + 8 * k), "setPendingSatelliteSend:", 1);
              }
              v107 = objc_msgSend(v106, "countByEnumeratingWithState:objects:count:", &v146, v199, 16);
            }
            while (v107);
          }

        }
      }
      objc_msgSend(a1, "aggregatePartsForParts:forMessage:context:text:", v188[5], v142, v129, v127);
      v110 = objc_claimAutoreleasedReturnValue();
      v111 = (void *)v188[5];
      v188[5] = v110;

      if (objc_msgSend(v125, "count") && objc_msgSend(v142, "scheduleType") != 2)
      {
        v112 = v188;
        if (!v188[5])
        {
          v113 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v114 = (void *)v188[5];
          v188[5] = (uint64_t)v113;

          v112 = v188;
        }
        if (*((_QWORD *)v194 + 5))
        {
          objc_msgSend((id)v112[5], "addObject:");
          v115 = (void *)*((_QWORD *)v194 + 5);
          *((_QWORD *)v194 + 5) = 0;

          v112 = v188;
        }
        objc_msgSend(a1, "_retractedMessagePartsForMessage:parts:retractedPartIndexes:", v142, v112[5], v125);
        v116 = objc_claimAutoreleasedReturnValue();
        v117 = (void *)v188[5];
        v188[5] = v116;

      }
      v118 = (void *)*((_QWORD *)v194 + 5);
      if (!v118)
        v118 = (void *)v188[5];
      v119 = v118;
      objc_msgSend(a1, "_processChatItemsForRichActions:", v119);
      v120 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = v120;
      v56 = 0;
      goto LABEL_140;
    }
    v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v131);
    v59 = (void *)*((_QWORD *)v194 + 5);
    if (v59)
    {
      v60 = v59;
    }
    else
    {
      if (!objc_msgSend((id)v188[5], "count"))
      {
        v61 = 0;
        goto LABEL_66;
      }
      objc_msgSend((id)v188[5], "objectAtIndex:", 0);
      v60 = (id)objc_claimAutoreleasedReturnValue();
    }
    v61 = v60;
LABEL_66:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && !objc_msgSend(v61, "index"))
    {
      v72 = objc_msgSend(v61, "index");
      objc_msgSend(v142, "guid");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      +[IMMessagePartChatItem chatItemGUIDForMessageGUID:partIndex:](IMMessagePartChatItem, "chatItemGUIDForMessageGUID:partIndex:", v73, v72);
      v74 = objc_claimAutoreleasedReturnValue();
      v138 = v72;

      objc_msgSend(v129, "showingEditHistoryForChatItemGUIDs");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v123 = objc_msgSend(v75, "containsObject:", v74);

      v76 = [IMTextMessagePartChatItem alloc];
      objc_msgSend(v61, "_item");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "text");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v122) = v123;
      v79 = -[IMTextMessagePartChatItem _initWithItem:text:index:messagePartRange:subject:isShowingEditHistory:](v76, "_initWithItem:text:index:messagePartRange:subject:isShowingEditHistory:", v77, v78, v138, 0, v132, v58, v122);

      objc_msgSend(v79, "setChipListFromText:", v127);
      v80 = (void *)v74;
      v81 = v194;
      if (!*((_QWORD *)v194 + 5))
      {
        objc_msgSend((id)v188[5], "replaceObjectAtIndex:withObject:", 0, v79);
        v63 = v80;
        goto LABEL_78;
      }
      v61 = v79;
      v65 = (id)*((_QWORD *)v81 + 5);
      *((_QWORD *)v81 + 5) = v61;
      v63 = v80;
    }
    else
    {
      objc_msgSend(v142, "guid");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      +[IMMessagePartChatItem chatItemGUIDForMessageGUID:partIndex:](IMMessagePartChatItem, "chatItemGUIDForMessageGUID:partIndex:", v62, -1);
      v63 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v129, "showingEditHistoryForChatItemGUIDs");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v62) = objc_msgSend(v64, "containsObject:", v63);

      LOBYTE(v122) = (_BYTE)v62;
      v65 = -[IMTextMessagePartChatItem _initWithItem:text:index:messagePartRange:subject:isShowingEditHistory:]([IMTextMessagePartChatItem alloc], "_initWithItem:text:index:messagePartRange:subject:isShowingEditHistory:", v142, 0, -1, 0, v132, v58, v122);
      v66 = (void *)v188[5];
      if (*((_QWORD *)v194 + 5))
      {
        if (!v66)
        {
          v67 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v68 = (void *)v188[5];
          v188[5] = (uint64_t)v67;

          v66 = (void *)v188[5];
        }
        objc_msgSend(v66, "addObject:", v65);
        objc_msgSend((id)v188[5], "addObject:", *((_QWORD *)v194 + 5));
        v69 = (void *)*((_QWORD *)v194 + 5);
        *((_QWORD *)v194 + 5) = 0;

      }
      else
      {
        if (!v66)
        {
          v70 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v71 = (void *)v188[5];
          v188[5] = (uint64_t)v70;

          v66 = (void *)v188[5];
        }
        objc_msgSend(v66, "insertObject:atIndex:", v65, 0);
      }
    }

    v79 = v61;
LABEL_78:

    goto LABEL_79;
  }
  v11 = (id)objc_msgSend(a1, "_newDetonatedMessagePartsForMessageItem:chatContext:photosPluginPayload:", v8, v9, v10);
LABEL_143:

  return v11;
}

+ (id)_processChatItemsForRichActions:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, uint64_t);
  void *v18;
  id v19;
  id v20;
  id v21;
  _QWORD *v22;
  _QWORD v23[4];
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
LABEL_5:
    v5 = v4;
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (id)objc_msgSend(v3, "mutableCopy");
    goto LABEL_5;
  }
  if (!v3)
  {
    v12 = 0;
    goto LABEL_7;
  }
  v24[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v14, "mutableCopy");

LABEL_6:
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v23[3] = 0;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = sub_1A20875A4;
  v18 = &unk_1E4720130;
  v8 = v5;
  v19 = v8;
  v9 = v7;
  v20 = v9;
  v10 = v6;
  v21 = v10;
  v22 = v23;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", &v15);
  objc_msgSend(v8, "insertObjects:atIndexes:", v9, v10, v15, v16, v17, v18);
  v11 = v21;
  v12 = v8;

  _Block_object_dispose(v23, 8);
LABEL_7:

  return v12;
}

+ (id)richCardsChatItemsForMessageItem:(id)a3 text:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  IMRichLinkCardMessagePartChatItem *v19;
  id v20;
  void *v21;
  void *v22;
  unint64_t v23;
  IMRichActionCarouselCountChatItem *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  IMSuggestedRepliesMessagePartChatItem *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "length") == 1
    && (objc_msgSend(v6, "string"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "substringToIndex:", 1),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D38CD8]),
        v8,
        v7,
        v9))
  {
    objc_msgSend(v6, "attributesAtIndex:effectiveRange:", 0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_arrayForKey:", *MEMORY[0x1E0D38CD0]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc(MEMORY[0x1E0D399E0]);
    if (v11)
      v13 = v11;
    else
      v13 = (void *)MEMORY[0x1E0C9AA60];
    v14 = objc_msgSend(v12, "initWithCardArray:", v13);
    if (v14)
    {
      v15 = (void *)v14;
      v38 = v10;
      objc_msgSend(v10, "_dictionaryForKey:", *MEMORY[0x1E0D39580]);
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0D39B80]), "initWithUrlToTransferGuids:", v16);
        if (v17)
        {
          v18 = (void *)v17;
          objc_msgSend(v15, "updateUrlToTransferMap:", v17);

        }
      }
      v36 = v16;
      v19 = -[IMRichLinkCardMessagePartChatItem initWithItem:richCards:selectedIndex:]([IMRichLinkCardMessagePartChatItem alloc], "initWithItem:richCards:selectedIndex:", v5, v15, objc_msgSend(v5, "selectedRichCardIndex"));
      objc_msgSend(v15, "suggestedRepliesList");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = -[IMRichActionFooterChatItem _initWithItem:]([IMRichActionFooterChatItem alloc], "_initWithItem:", v5);
      v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      -[IMRichLinkCardMessagePartChatItem richCards](v19, "richCards");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "cards");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "count");

      if (v23 >= 2)
      {
        v24 = [IMRichActionCarouselCountChatItem alloc];
        v25 = objc_msgSend(v5, "selectedRichCardIndex");
        -[IMRichLinkCardMessagePartChatItem richCards](v19, "richCards");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "cards");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = -[IMRichActionCarouselCountChatItem _initWithItem:selectedIndex:totalCount:](v24, "_initWithItem:selectedIndex:totalCount:", v5, v25, objc_msgSend(v27, "count"));

        objc_msgSend(v20, "addObject:", v28);
      }
      if (objc_msgSend(v39, "count", v36))
      {
        v29 = -[IMSuggestedRepliesMessagePartChatItem initWithItem:suggestedRepliesList:selectedIndex:]([IMSuggestedRepliesMessagePartChatItem alloc], "initWithItem:suggestedRepliesList:selectedIndex:", v5, v39, objc_msgSend(v5, "selectedRichCardIndex"));
        objc_msgSend(v15, "suggestedActionsList");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "count");

        objc_msgSend(v20, "addObject:", v19);
        objc_msgSend(v20, "addObject:", v29);
        if (v31)
          objc_msgSend(v20, "addObject:", v40);

        v32 = v37;
        v10 = v38;
      }
      else
      {
        objc_msgSend(v15, "suggestedActionsList");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "count");

        objc_msgSend(v20, "addObject:", v19);
        v32 = v37;
        v10 = v38;
        if (v34)
          objc_msgSend(v20, "addObject:", v40);
      }

    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

+ (id)standaloneChipListChatItemForMessageItem:(id)a3 text:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  IMSuggestedReplyMessagePartChatItem *v14;
  void *v15;
  IMSuggestedReplyMessagePartChatItem *v16;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "length") == 1
    && (objc_msgSend(v7, "string"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "substringToIndex:", 1),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0D37890]),
        v9,
        v8,
        v10))
  {
    objc_msgSend(v7, "attributesAtIndex:effectiveRange:", 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isFromMe"))
    {
      objc_msgSend(v11, "_dictionaryForKey:", *MEMORY[0x1E0D393C0]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D39768]), "initWithDictionary:", v12);
      if (v13)
      {
        v14 = -[IMSuggestedReplyMessagePartChatItem initWithItem:suggestedReply:]([IMSuggestedReplyMessagePartChatItem alloc], "initWithItem:suggestedReply:", v6, v13);

      }
      else
      {

        v14 = 0;
      }
    }
    else
    {
      objc_msgSend(a1, "suggestedRepliesMessagePartChatItemForMessageItem:attributes:", v6, v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v15;
      if (v15)
      {
        v16 = v15;
        v12 = v16;
      }
      else
      {
        objc_msgSend(a1, "suggestedActionsMessagePartChatItemForMessageItem:attributes:", v6, v11);
        v16 = (IMSuggestedReplyMessagePartChatItem *)objc_claimAutoreleasedReturnValue();
      }
      v14 = v16;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (BOOL)isChatBotContentOnly:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  char v9;
  char v10;

  v3 = a3;
  if (objc_msgSend(v3, "length") == 1)
  {
    objc_msgSend(v3, "string");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "substringToIndex:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D37890]);

    objc_msgSend(v3, "string");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "substringToIndex:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D38CD8]);

    v10 = v9 | v6;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)suggestedRepliesMessagePartChatItemForMessageItem:(id)a3 attributes:(id)a4
{
  id v5;
  id v6;
  void *v7;
  IMSuggestedRepliesMessagePartChatItem *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "_numberForKey:", *MEMORY[0x1E0D37898]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "BOOLValue") & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v6, "_arrayForKey:", *MEMORY[0x1E0D37888]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D39760]), "initWithChipArray:", v9);
    objc_msgSend(v10, "suggestedReplies");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count"))
    {
      objc_msgSend(v10, "suggestedReplies");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = -[IMSuggestedRepliesMessagePartChatItem initWithItem:suggestedRepliesList:selectedIndex:]([IMSuggestedRepliesMessagePartChatItem alloc], "initWithItem:suggestedRepliesList:selectedIndex:", v5, v13, objc_msgSend(v5, "selectedRichCardIndex"));
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

+ (id)suggestedActionsMessagePartChatItemForMessageItem:(id)a3 attributes:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  IMSuggestedActionsMessagePartChatItem *v9;

  v5 = a3;
  objc_msgSend(a4, "_arrayForKey:", *MEMORY[0x1E0D37888]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D39760]), "initWithChipArray:", v6);
  objc_msgSend(v7, "suggestedActions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
    v9 = -[IMSuggestedActionsMessagePartChatItem initWithItem:suggestedActionsList:]([IMSuggestedActionsMessagePartChatItem alloc], "initWithItem:suggestedActionsList:", v5, v8);
  else
    v9 = 0;

  return v9;
}

+ (id)_newAudioMessagePartsForMessageItem:(id)a3 text:(id)a4 chatContext:(id)a5 retractedPartIndexes:(id)a6 singlePart:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = objc_msgSend(v13, "length");
  objc_msgSend(v12, "fileTransferGUIDs");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "firstObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19 && !objc_msgSend(v15, "count"))
  {
    v21 = -[IMAttachmentMessagePartChatItem _initWithItem:text:index:messagePartRange:transferGUID:chatContext:]([IMAudioMessageChatItem alloc], "_initWithItem:text:index:messagePartRange:transferGUID:chatContext:", v12, v13, 0, 0, v17, v19, v14);
    objc_msgSend(v21, "setIsBusiness:", objc_msgSend(v14, "serviceType") == 3);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v21);
    v22 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v23 = (void *)v22;

    goto LABEL_10;
  }
  if (objc_msgSend(v15, "count"))
  {
    v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v21 = v20;
    if (v16)
      objc_msgSend(v20, "addObject:", v16);
    objc_msgSend(a1, "_retractedMessagePartsForMessage:parts:retractedPartIndexes:", v12, v21, v15);
    v22 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v23 = 0;
LABEL_10:

  return v23;
}

+ (id)_retractedMessagePartsForMessage:(id)a3 parts:(id)a4 retractedPartIndexes:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_msgSend(v8, "mutableCopy");
  if (objc_msgSend(v9, "count"))
  {
    v23 = v10;
    objc_msgSend(v7, "failedRetractPartIndexes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "editUnsupportedByHandleIDs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v14 = v12;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v31;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v31 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(v7, "_imHandleWithID:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v18));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
            objc_msgSend(v13, "addObject:", v19);

          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v16);
    }

    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = sub_1A20882E8;
    v24[3] = &unk_1E4720180;
    v25 = v7;
    v26 = v11;
    v27 = v13;
    v28 = v8;
    v10 = v23;
    v29 = v23;
    v20 = v13;
    v21 = v11;
    objc_msgSend(v9, "enumerateIndexesUsingBlock:", v24);

  }
  return v10;
}

+ (int64_t)_attachmentStackAggregationThreshold
{
  void *v2;
  int v3;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "threeAttachmentStackEnabled");

  if (v3)
    return 2;
  else
    return 3;
}

+ (id)aggregatePartsForParts:(id)a3 forMessage:(id)a4 context:(id)a5 text:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void (**v21)(_QWORD);
  uint64_t v22;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  _QWORD *v32;
  _QWORD aBlock[4];
  id v34;
  id v35;
  id v36;
  _QWORD v37[5];
  id v38;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)objc_msgSend(v9, "mutableCopy");
  if (objc_msgSend(v13, "count"))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v13, "count"));
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x3032000000;
    v37[3] = sub_1A200ADD4;
    v37[4] = sub_1A200AC5C;
    v38 = 0;
    v15 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1A2088760;
    aBlock[3] = &unk_1E47201A8;
    v34 = v10;
    v35 = v11;
    v16 = v12;
    v36 = v16;
    v28[0] = v15;
    v28[1] = 3221225472;
    v28[2] = sub_1A2088960;
    v28[3] = &unk_1E47201D0;
    v32 = v37;
    v17 = _Block_copy(aBlock);
    v31 = v17;
    v18 = v14;
    v29 = v18;
    v30 = v16;
    v19 = _Block_copy(v28);
    v24[0] = v15;
    v24[1] = 3221225472;
    v24[2] = sub_1A2088B34;
    v24[3] = &unk_1E47201F8;
    v27 = v37;
    v20 = v18;
    v25 = v20;
    v21 = v19;
    v26 = v21;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v24);
    v21[2](v21);
    v22 = objc_msgSend(v20, "copy");

    _Block_object_dispose(v37, 8);
    v13 = (void *)v22;
  }

  return v13;
}

+ (id)messageBodyStringForAttachmentGUIDs:(id)a3
{
  id v3;
  id v4;
  __CFDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const void *v10;
  const void *v11;
  uint64_t v12;
  uint64_t v13;
  const void *v14;
  void *v15;
  void *v16;
  id obj;
  void *key;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  v5 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v3;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v21;
    key = (void *)*MEMORY[0x1E0D36430];
    v10 = (const void *)*MEMORY[0x1E0D36308];
    v11 = (const void *)*MEMORY[0x1E0D366B8];
    v12 = *MEMORY[0x1E0D362F8];
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(obj);
        v14 = *(const void **)(*((_QWORD *)&v20 + 1) + 8 * v13);
        if (v14)
          CFDictionarySetValue(v5, key, v14);
        CFDictionarySetValue(v5, v10, &unk_1E475EC70);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8 + v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          CFDictionarySetValue(v5, v11, v15);

        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v12, v5);
        objc_msgSend(v4, "appendAttributedString:", v16);

        ++v13;
      }
      while (v7 != v13);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      v8 = (v8 + v13);
    }
    while (v7);
  }

  return v4;
}

+ (BOOL)_shouldAggregateForTransferType:(id)a3
{
  id v3;
  void **v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  if (qword_1EE65F498 != -1)
    dispatch_once(&qword_1EE65F498, &unk_1E471D698);
  if (!qword_1EE65F4A0)
  {
    v4 = (void **)MEMORY[0x1A8582938]("kUTTypeImage", CFSTR("CoreServices"));
    if (v4)
      v5 = *v4;
    else
      v5 = 0;
    objc_storeStrong((id *)&qword_1EE65F4A0, v5);
  }
  v6 = off_1EE65F490(v3) != 0;

  return v6;
}

+ (id)_messageItemWithPartsDeleted:(id)a3 fromMessageItem:(id)a4 indexesOfItemsDeleted:(id *)a5 indexToRangeMapping:(id *)a6
{
  id v7;
  NSObject *v8;
  id v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v28;
  id v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  id v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v28 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v37 = v7;
      v38 = 2112;
      v39 = v28;
      _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "Message with parts deleted: %@ from message: %@", buf, 0x16u);
    }

  }
  v9 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v29 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v7;
  v10 = 0;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v32 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        v15 = objc_msgSend(v14, "messagePartAttributeName");
        if (v15 == -1)
        {
          v10 = 1;
        }
        else
        {
          objc_msgSend(v9, "addIndex:", v15);
          v16 = objc_msgSend(v14, "messagePartRange");
          v18 = v17;
          if (!v15)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v14, "subject");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v10 = objc_msgSend(v19, "length") != 0;

            }
          }
          if (v16 | v18)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "objectForKey:", v20);
            v21 = (id)objc_claimAutoreleasedReturnValue();

            if (!v21)
            {
              v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "setObject:forKey:", v21, v22);

            }
            objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v16, v18);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "addObject:", v23);

          }
        }
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v11);
  }

  if (a5)
    *a5 = objc_retainAutorelease(v9);
  if (a6)
    *a6 = objc_retainAutorelease(v29);
  objc_msgSend(MEMORY[0x1E0D39918], "_messageItemWithIndexesDeleted:subRangesToDeleteMapping:deleteSubject:deleteTransferCallback:createItemCallback:fromMessageItem:", v9, v29, v10, &unk_1E4720238, &unk_1E4720278, v28);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

+ (id)chatItemGUIDForMessageGUID:(id)a3 partIndex:(int64_t)a4
{
  objc_class *v5;
  id v6;
  void *v7;

  v5 = (objc_class *)MEMORY[0x1E0CB3940];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithFormat:", CFSTR("p:%ld/%@"), a4, v6);

  return v7;
}

- (id)_initWithItem:(id)a3 index:(int64_t)a4 messagePartRange:(_NSRange)a5
{
  return -[IMMessagePartChatItem _initWithItem:index:messagePartRange:syndicationBehavior:](self, "_initWithItem:index:messagePartRange:syndicationBehavior:", a3, a4, a5.location, a5.length, 0);
}

- (id)_initWithItem:(id)a3 index:(int64_t)a4 messagePartRange:(_NSRange)a5 syndicationBehavior:(int64_t)a6
{
  NSUInteger length;
  NSUInteger location;
  id v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  void *v17;
  IMMessagePartHighlightChatItem *v18;
  void *v19;
  uint64_t v20;
  void *v21;

  length = a5.length;
  location = a5.location;
  v11 = a3;
  v12 = -[IMChatItem _initWithItem:](self, "_initWithItem:", v11);
  v13 = v12;
  if (v12)
  {
    v12[9] = a4;
    v14 = v12 + 19;
    v12[19] = location;
    v12[20] = length;
    v12[18] = objc_msgSend(v11, "replyCountForPartIndex:", a4);
    v13[15] = a6;
    objc_msgSend(v11, "syndicationRanges");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0D39948], "messagePartSyndicationRangeForRange:inRangesArray:", *v14, v13[20], v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
      {
        v13[12] = objc_msgSend(v16, "syndicationType");
        v13[13] = objc_msgSend(v17, "syndicationStatus");
        if (objc_msgSend(v13, "isHighlighted"))
        {
          if (v13[15] == 1)
          {
            v18 = [IMMessagePartHighlightChatItem alloc];
            objc_msgSend(v11, "guid");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = -[IMMessagePartHighlightChatItem _initWithItem:highlightedMessagePartGUID:highlightedMessagePartIndex:highlightedMessagePartRange:](v18, "_initWithItem:highlightedMessagePartGUID:highlightedMessagePartIndex:highlightedMessagePartRange:", v11, v19, a4, location, length);
            v21 = (void *)v13[14];
            v13[14] = v20;

          }
        }
      }

    }
  }

  return v13;
}

- (id)_initWithItem:(id)a3 text:(id)a4 index:(int64_t)a5 messagePartRange:(_NSRange)a6 visibleAssociatedMessageChatItems:(id)a7
{
  NSUInteger length;
  NSUInteger location;
  id v13;
  id v14;
  id v15;
  void *v16;
  int v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;

  length = a6.length;
  location = a6.location;
  v13 = a3;
  v14 = a4;
  v15 = a7;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isSWYAttachmentsEnabled");

  if (v17)
    v18 = -[IMMessagePartChatItem _initWithItem:index:messagePartRange:syndicationBehavior:](self, "_initWithItem:index:messagePartRange:syndicationBehavior:", v13, a5, location, length, objc_msgSend(v13, "isFileAttachment"));
  else
    v18 = -[IMMessagePartChatItem _initWithItem:index:messagePartRange:](self, "_initWithItem:index:messagePartRange:", v13, a5, location, length);
  v19 = v18;
  if (v18)
  {
    objc_msgSend(v13, "guid");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMMessagePartChatItem chatItemGUIDForMessageGUID:partIndex:](IMMessagePartChatItem, "chatItemGUIDForMessageGUID:partIndex:", v20, a5);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_setGUID:", v21);
    objc_msgSend(v19, "extractAndSetChipListFrom:", v14);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)*((_QWORD *)v19 + 8);
    *((_QWORD *)v19 + 8) = v22;

    if (objc_msgSend(v13, "isCorrupt"))
    {
      objc_msgSend(v13, "body");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "copy");
      v26 = (void *)*((_QWORD *)v19 + 10);
      *((_QWORD *)v19 + 10) = v25;

    }
    v27 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(v19, "_setVisibleAssociatedMessageChatItems:", v27);

    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "isCarrierPigeonEnabled");

    if (v29)
      *((_BYTE *)v19 + 59) = objc_msgSend(v13, "isPendingSatelliteSend");

  }
  return v19;
}

- (id)extractAndSetChipListFrom:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[5];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "string");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "rangeOfString:", *MEMORY[0x1E0D37890]);
    v9 = v8;

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = sub_1A2089A58;
    v12[3] = &unk_1E47202A0;
    v12[4] = self;
    objc_msgSend(v5, "enumerateAttributesInRange:options:usingBlock:", v7, v9, 0, v12);
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = (void *)objc_msgSend(v5, "copy");
    }
    else
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithAttributedString:", v5);
      objc_msgSend(v10, "replaceCharactersInRange:withString:", v7, v9, &stru_1E4725068);
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_setVisibleAssociatedMessageChatItems:(id)a3
{
  NSArray *v5;
  NSArray *visibleAssociatedMessageChatItems;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = (NSArray *)a3;
  visibleAssociatedMessageChatItems = self->_visibleAssociatedMessageChatItems;
  if (visibleAssociatedMessageChatItems != v5
    && !-[NSArray isEqualToArray:](visibleAssociatedMessageChatItems, "isEqualToArray:", v5))
  {
    objc_storeStrong((id *)&self->_visibleAssociatedMessageChatItems, a3);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = self->_visibleAssociatedMessageChatItems;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "_setParentMessageIsFromMe:", -[IMMessageChatItem isFromMe](self, "isFromMe", (_QWORD)v12));
        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

- (id)_visibleAssociatedChatItemsByFlatteningAggregateChatItems
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[IMMessagePartChatItem visibleAssociatedMessageChatItems](self, "visibleAssociatedMessageChatItems");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v23;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v9 = v8;
          v18 = 0u;
          v19 = 0u;
          v20 = 0u;
          v21 = 0u;
          objc_msgSend(v9, "acknowledgments");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v19;
            do
            {
              v14 = 0;
              do
              {
                if (*(_QWORD *)v19 != v13)
                  objc_enumerationMutation(v10);
                objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v14++));
              }
              while (v12 != v14);
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
            }
            while (v12);
          }

        }
        else
        {
          objc_msgSend(v3, "addObject:", v8);
        }
        ++v7;
      }
      while (v7 != v5);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v5);
  }

  v15 = (void *)objc_msgSend(v3, "copy");
  return v15;
}

- (NSString)threadIdentifier
{
  void *v2;
  void *v3;

  -[IMChatItem _item](self, "_item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (IMMessageItem)threadOriginator
{
  void *v2;
  void *v3;

  -[IMChatItem _item](self, "_item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadOriginator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (IMMessageItem *)v3;
}

- (unint64_t)scheduleType
{
  void *v2;
  unint64_t v3;

  -[IMChatItem _item](self, "_item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "scheduleType");

  return v3;
}

- (unint64_t)scheduleState
{
  void *v2;
  unint64_t v3;

  -[IMChatItem _item](self, "_item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "scheduleState");

  return v3;
}

- (id)replyContextPreviewChatItemForReply:(id)a3 chatContext:(id)a4
{
  return 0;
}

- (_NSRange)originalMessagePartRange
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  _NSRange result;

  -[IMChatItem _item](self, "_item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[IMMessagePartChatItem messagePartAttributeName](self, "messagePartAttributeName");
  objc_msgSend(v3, "originalTextRangesByPartIndex");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = objc_msgSend(v7, "rangeValue");
  else
    v8 = -[IMMessagePartChatItem messagePartRange](self, "messagePartRange");
  v10 = v8;
  v11 = v9;

  v12 = v10;
  v13 = v11;
  result.length = v13;
  result.location = v12;
  return result;
}

- (BOOL)isEditedMessagePart
{
  void *v3;
  int64_t v4;
  void *v5;

  -[IMChatItem _item](self, "_item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[IMMessagePartChatItem messagePartAttributeName](self, "messagePartAttributeName");
  objc_msgSend(v3, "editedPartIndexes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v5, "containsIndex:", v4);

  return v4;
}

- (BOOL)isFailedEditMessagePart
{
  void *v3;
  int64_t v4;
  void *v5;

  -[IMChatItem _item](self, "_item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[IMMessagePartChatItem messagePartAttributeName](self, "messagePartAttributeName");
  objc_msgSend(v3, "failedEditPartIndexes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v5, "containsIndex:", v4);

  return v4;
}

- (BOOL)isRetractedMessagePart
{
  void *v3;
  int64_t v4;
  void *v5;

  -[IMChatItem _item](self, "_item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[IMMessagePartChatItem messagePartAttributeName](self, "messagePartAttributeName");
  objc_msgSend(v3, "retractedPartIndexes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v5, "containsIndex:", v4);

  return v4;
}

- (BOOL)isFailedRetractMessagePart
{
  void *v3;
  int64_t v4;
  void *v5;

  -[IMChatItem _item](self, "_item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[IMMessagePartChatItem messagePartAttributeName](self, "messagePartAttributeName");
  objc_msgSend(v3, "failedRetractPartIndexes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v5, "containsIndex:", v4);

  return v4;
}

- (BOOL)requiresSiriAttribution
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;

  if (-[IMMessageChatItem isFromMe](self, "isFromMe"))
    return 0;
  -[IMMessageChatItem message](self, "message");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sourceApplicationID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D39C38]);

  if (!v5)
    return 0;
  v6 = objc_opt_class();
  return MEMORY[0x1E0DE7D20](v6, sel_isSiriEnabled);
}

- (BOOL)requiresFaceTimeAttribution
{
  void *v2;
  void *v3;
  char v4;

  -[IMMessageChatItem message](self, "message");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sourceApplicationID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.FaceTime"));

  return v4;
}

+ (BOOL)isSiriEnabled
{
  if (qword_1EE65F4B0 != -1)
    dispatch_once(&qword_1EE65F4B0, &unk_1E47202C0);
  return byte_1EE65F4A8;
}

- (BOOL)isHighlighted
{
  return self->_syndicationType & 1;
}

- (int64_t)syndicationType
{
  return self->_syndicationType;
}

- (int64_t)syndicationStatus
{
  return self->_syndicationStatus;
}

- (IMMessagePartHighlightChatItem)messageHighlightChatItem
{
  return self->_messageHighlightChatItem;
}

- (int64_t)syndicationBehavior
{
  return self->_syndicationBehavior;
}

- (NSAttributedString)text
{
  return self->_text;
}

- (int64_t)index
{
  return self->_index;
}

- (void)_setIndex:(int64_t)a3
{
  self->_index = a3;
}

- (_NSRange)messagePartRange
{
  _NSRange *p_messagePartRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_messagePartRange = &self->_messagePartRange;
  location = self->_messagePartRange.location;
  length = p_messagePartRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setMessagePartRange:(_NSRange)a3
{
  self->_messagePartRange = a3;
}

- (NSAttributedString)fallbackCorruptText
{
  return self->_fallbackCorruptText;
}

- (NSArray)visibleAssociatedMessageChatItems
{
  return self->_visibleAssociatedMessageChatItems;
}

- (BOOL)chatInScrutinyMode
{
  return self->_chatInScrutinyMode;
}

- (void)setChatInScrutinyMode:(BOOL)a3
{
  self->_chatInScrutinyMode = a3;
}

- (BOOL)supportsSuggestedActionsMenu
{
  return self->_supportsSuggestedActionsMenu;
}

- (NSArray)suggestedActionsList
{
  return self->_suggestedActionsList;
}

- (BOOL)isPendingSatelliteSend
{
  return self->_pendingSatelliteSend;
}

- (void)setPendingSatelliteSend:(BOOL)a3
{
  self->_pendingSatelliteSend = a3;
}

- (BOOL)isAllowlistedRichLinkSender
{
  return self->_allowlistedRichLinkSender;
}

- (void)setAllowlistedRichLinkSender:(BOOL)a3
{
  self->_allowlistedRichLinkSender = a3;
}

- (void)setStewie:(BOOL)a3
{
  self->_stewie = a3;
}

- (void)setStewieConversationID:(int64_t)a3
{
  self->_stewieConversationID = a3;
}

- (unint64_t)replyCount
{
  return self->_replyCount;
}

- (void)setReplyCount:(unint64_t)a3
{
  self->_replyCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedActionsList, 0);
  objc_storeStrong((id *)&self->_messageHighlightChatItem, 0);
  objc_storeStrong((id *)&self->_visibleAssociatedMessageChatItems, 0);
  objc_storeStrong((id *)&self->_fallbackCorruptText, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

- (NSString)threadIdentifierForTapback
{
  id v3;
  _BOOL4 v4;
  id v5;
  void *v6;
  id v8;

  -[IMMessagePartChatItem threadIdentifier](self, "threadIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v8 = 0;
    v4 = -[IMChatItem itemIsThreadOriginatorWithThreadIdentifier:](self, "itemIsThreadOriginatorWithThreadIdentifier:", &v8);
    v5 = v8;
    v6 = v5;
    if (v4)
      v3 = v5;

  }
  return (NSString *)v3;
}

- (id)messageSummaryInfo
{
  NSObject *v2;

  IMLogHandleForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    sub_1A2197FD8();

  return (id)MEMORY[0x1E0C9AA70];
}

- (unsigned)contentType
{
  NSObject *v2;

  IMLogHandleForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    sub_1A2198004();

  return 0;
}

@end
