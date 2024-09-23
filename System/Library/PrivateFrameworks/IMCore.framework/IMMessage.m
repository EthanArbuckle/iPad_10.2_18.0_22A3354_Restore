@implementation IMMessage

- (void)setSortID:(unint64_t)a3
{
  self->_sortID = a3;
}

- (IMHandle)sender
{
  return self->_sender;
}

- (BOOL)isTypingMessage
{
  _BOOL4 v3;

  if (-[IMMessage wasDetonated](self, "wasDetonated"))
  {
    LOBYTE(v3) = 0;
  }
  else if (-[IMMessage isFinished](self, "isFinished"))
  {
    v3 = -[IMMessage isFinished](self, "isFinished");
    if (v3)
    {
      v3 = -[IMMessage isEmpty](self, "isEmpty");
      if (v3)
        LOBYTE(v3) = !-[IMMessage hasEditedParts](self, "hasEditedParts");
    }
  }
  else
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)isFinished
{
  return self->_flags & 1;
}

+ (id)messageFromIMMessageItem:(id)a3 sender:(id)a4 subject:(id)a5
{
  id v7;
  objc_class *v8;
  unsigned int v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *IMMessageFromIMItem;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;

  v7 = a3;
  v42 = a5;
  v41 = a4;
  v8 = +[IMChatRegistry messageClass](IMChatRegistry, "messageClass");
  v9 = objc_msgSend(v7, "errorCode");
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("__kIMMessageErrorDomain"), v9, 0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v50 = 0;
  }
  objc_msgSend(v7, "subject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(v7, "subject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = (void *)objc_msgSend(v11, "initWithString:", v12);

  }
  else
  {
    v49 = 0;
  }

  v40 = [v8 alloc];
  objc_msgSend(v7, "time");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeRead");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeDelivered");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timePlayed");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "plainBody");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "body");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fileTransferGUIDs");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v7, "flags");
  objc_msgSend(v7, "guid");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v7, "messageID");
  objc_msgSend(v7, "balloonBundleID");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "payloadData");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "expressiveSendStyleID");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeExpressiveSendPlayed");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "associatedMessageGUID");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v7, "associatedMessageType");
  v27 = objc_msgSend(v7, "associatedMessageRange");
  v14 = v13;
  objc_msgSend(v7, "associatedMessageEmoji");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "messageSummaryInfo");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "threadIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateEdited");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v40, "_initWithSender:time:timeRead:timeDelivered:timePlayed:plainText:text:messageSubject:fileTransferGUIDs:flags:error:guid:messageID:subject:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:associatedMessageGUID:associatedMessageType:associatedMessageRange:associatedMessageEmoji:messageSummaryInfo:threadIdentifier:dateEdited:scheduleType:scheduleState:", v41, v48, v47, v39, v38, v37, v46, v49, v45, v36, v50, v44, v35, v42,
                  v43,
                  v34,
                  v33,
                  v32,
                  v31,
                  v29,
                  v27,
                  v14,
                  v30,
                  v28,
                  v15,
                  v16,
                  objc_msgSend(v7, "scheduleType"),
                  objc_msgSend(v7, "scheduleState"));

  objc_msgSend(v17, "setSortID:", objc_msgSend(v7, "sortID"));
  objc_msgSend(v7, "account");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  _IMBestAccountForIMItem(v7, 0, v18, 0, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "threadOriginator");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  IMMessageFromIMItem = (void *)_CreateIMMessageFromIMItem(v20, v19, 1);

  objc_msgSend(v17, "setThreadOriginator:", IMMessageFromIMItem);
  v22 = objc_msgSend(v7, "flags");
  if (objc_msgSend(v17, "isEmote"))
    v22 |= 2uLL;
  if (objc_msgSend(v17, "isEmpty"))
    v22 |= 8uLL;
  if (objc_msgSend(v17, "hasMention"))
    v22 |= 0x20000000uLL;
  if (objc_msgSend(v17, "isAddressedToMe"))
    v23 = v22 | 0x800;
  else
    v23 = v22;
  objc_msgSend(v17, "_updateFlags:", v23);
  objc_msgSend(v7, "syndicationRanges");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_syndicationRanges:", v24);

  objc_msgSend(v7, "syncedSyndicationRanges");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_syncedSyndicationRanges:", v25);

  return v17;
}

- (IMTapback)tapback
{
  int64_t v3;
  void *v4;
  int64_t v6;
  id v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  _BOOL8 v12;

  v3 = -[IMMessage associatedMessageType](self, "associatedMessageType");
  if ((unint64_t)(v3 - 3000) >= 6 && (unint64_t)(v3 - 2000) > 5)
  {
    v6 = -[IMMessage associatedMessageType](self, "associatedMessageType");
    if (v6 == 3006 || v6 == 2006)
    {
      v7 = objc_alloc(MEMORY[0x1E0D39830]);
      -[IMMessage associatedMessageEmoji](self, "associatedMessageEmoji");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)objc_msgSend(v7, "initWithEmoji:isRemoved:", v8, (-[IMMessage associatedMessageType](self, "associatedMessageType") & 0xFFFFFFFFFFFFFFF8) == 3000);

    }
    else
    {
      v9 = -[IMMessage associatedMessageType](self, "associatedMessageType");
      if (v9 == 3007 || v9 == 2007)
      {
        -[IMMessage fileTransferGUIDs](self, "fileTransferGUIDs");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "firstObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          v12 = (-[IMMessage associatedMessageType](self, "associatedMessageType") & 0xFFFFFFFFFFFFFFF8) == 3000;
          v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D39B20]), "initWithTransferGUID:isRemoved:", v11, v12);
        }
        else
        {
          v4 = 0;
        }

      }
      else
      {
        v4 = 0;
      }
    }
  }
  else
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D39770]), "initWithAssociatedMessageType:", -[IMMessage associatedMessageType](self, "associatedMessageType"));
  }
  return (IMTapback *)v4;
}

- (BOOL)wasDetonated
{
  return (BYTE4(self->_flags) >> 4) & 1;
}

- (NSAttributedString)text
{
  return self->_text;
}

- (IMHandle)subject
{
  return self->_subject;
}

- (void)setThreadOriginator:(id)a3
{
  objc_storeStrong((id *)&self->_threadOriginator, a3);
}

- (NSIndexSet)retractedPartIndexes
{
  void *v2;
  void *v3;
  void *v4;

  -[IMMessage messageSummaryInfo](self, "messageSummaryInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0D383A0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    objc_msgSend(MEMORY[0x1E0CB36B8], "__im_indexSetFromNumberArray:", v3);
  else
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSIndexSet *)v4;
}

- (NSString)plainBody
{
  NSString *plainBody;
  NSString **p_plainBody;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  p_plainBody = &self->_plainBody;
  plainBody = self->_plainBody;
  if (!plainBody)
  {
    -[NSAttributedString string](self->_text, "string");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", *MEMORY[0x1E0D362F8], &stru_1E4725068);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", *MEMORY[0x1E0D36318], &stru_1E4725068);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", *MEMORY[0x1E0D37890], &stru_1E4725068);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "length"))
      objc_storeStrong((id *)p_plainBody, v8);

    plainBody = *p_plainBody;
  }
  return plainBody;
}

- (NSDictionary)messageSummaryInfo
{
  return self->_messageSummaryInfo;
}

- (BOOL)isFromMe
{
  return (LOBYTE(self->_flags) >> 2) & 1;
}

- (BOOL)isEmpty
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;

  if ((self->_flags & 8) == 0 || -[IMMessage hasInlineAttachments](self, "hasInlineAttachments"))
    return 0;
  -[IMMessage fileTransferGUIDs](self, "fileTransferGUIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v3 = 0;
  }
  else
  {
    -[IMMessage messageSubject](self, "messageSubject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
    {
      v3 = 0;
    }
    else
    {
      -[IMMessage payloadData](self, "payloadData");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v6, "length") == 0;

    }
  }

  return v3;
}

- (BOOL)isEmote
{
  return (LOBYTE(self->_flags) >> 1) & 1;
}

- (BOOL)isAddressedToMe
{
  return self->_isAddressedToMe;
}

- (BOOL)hasMention
{
  return (BYTE3(self->_flags) >> 5) & 1;
}

- (NSString)expressiveSendStyleID
{
  return self->_expressiveSendStyleID;
}

- (NSError)error
{
  return self->_error;
}

- (NSString)balloonBundleID
{
  return self->_balloonBundleID;
}

- (int64_t)associatedMessageType
{
  return self->_associatedMessageType;
}

- (void)_updateFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (void)_syndicationRanges:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (void)_syncedSyndicationRanges:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (id)tapbackSummaryForConversationListUsingIsAdaptiveImageGlyphProvider:(id)a3 adaptiveImageGlyphProvider:(id)a4 effectString:(id)a5
{
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  __CFString *v21;
  __CFString *v22;
  NSObject *v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[IMMessage associatedMessageType](self, "associatedMessageType") & 0xFFFFFFFFFFFFFFF8;
  if (v11 != 3000 && v11 != 2000)
  {
LABEL_15:
    v18 = 0;
    goto LABEL_16;
  }
  -[IMMessage sender](self, "sender");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[IMMessage isFromMe](self, "isFromMe");
  if (v13)
  {
    v14 = 0;
  }
  else
  {
    objc_msgSend(v12, "_displayNameWithAbbreviation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[IMMessage tapback](self, "tapback");
  v15 = objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    IMLogHandleForCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      sub_1A21961E4(v23);

    goto LABEL_15;
  }
  v16 = (void *)v15;
  -[IMMessage messageSummaryInfo](self, "messageSummaryInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "previewAttributedStringWithMessageSummaryInfo:isAdaptiveImageGlyphProvider:adaptiveImageGlyphProvider:senderDisplayName:isFromMe:effectString:", v17, v8, v9, v14, v13, v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    -[IMMessage plainBody](self, "plainBody");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    v21 = &stru_1E4725068;
    if (v19)
      v21 = (__CFString *)v19;
    v22 = v21;

    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v22);
  }

LABEL_16:
  return v18;
}

- (id)descriptionForPurpose:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[IMMessage guid](self, "guid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  +[IMChatRegistry sharedRegistry](IMChatRegistry, "sharedRegistry", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cachedChats");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v12, "messageForGUID:", v5);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          -[IMMessage descriptionForPurpose:inChat:](self, "descriptionForPurpose:inChat:", a3, v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
        continue;
      break;
    }
  }

  -[IMMessage descriptionForPurpose:inChat:](self, "descriptionForPurpose:inChat:", a3, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v14;
}

- (id)descriptionForPurpose:(int64_t)a3 inChat:(id)a4
{
  _BOOL8 v6;
  void *v7;
  void *v8;

  if (a4)
    v6 = objc_msgSend(a4, "chatStyle") != 45;
  else
    v6 = 0;
  -[IMMessage _imMessageItem](self, "_imMessageItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionForPurpose:isGroupMessage:messageDataSource:attachmentDataSource:", a3, v6, 0, &unk_1E471D618);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)descriptionForPurpose:(int64_t)a3 inChat:(id)a4 senderDisplayName:(id)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a5;
  if (a4)
    a4 = (id)(objc_msgSend(a4, "chatStyle") != 45);
  -[IMMessage _imMessageItem](self, "_imMessageItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "descriptionForPurpose:isGroupMessage:senderDisplayName:messageDataSource:attachmentDataSource:", a3, a4, v8, 0, &unk_1E471FD48);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)defaultInvitationMessageFromSender:(id)a3 flags:(unint64_t)a4
{
  id v5;
  objc_class *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = +[IMChatRegistry messageClass](IMChatRegistry, "messageClass");
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", &stru_1E4725068);
  v8 = [v6 alloc];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithSender:time:text:fileTransferGUIDs:flags:error:guid:subject:threadIdentifier:", v5, v9, v7, 0, a4 | 1, 0, 0, 0, 0);

  return v10;
}

+ (id)instantMessageWithText:(id)a3 flags:(unint64_t)a4 threadIdentifier:(id)a5
{
  return (id)MEMORY[0x1E0DE7D20](a1, sel_instantMessageWithText_messageSubject_flags_threadIdentifier_);
}

+ (id)instantMessageWithText:(id)a3 messageSubject:(id)a4 flags:(unint64_t)a5 threadIdentifier:(id)a6
{
  return (id)MEMORY[0x1E0DE7D20](a1, sel_instantMessageWithText_messageSubject_flags_expressiveSendStyleID_threadIdentifier_);
}

+ (id)instantMessageWithText:(id)a3 messageSubject:(id)a4 flags:(unint64_t)a5 expressiveSendStyleID:(id)a6
{
  return (id)MEMORY[0x1E0DE7D20](a1, sel_instantMessageWithText_messageSubject_flags_expressiveSendStyleID_threadIdentifier_);
}

+ (id)instantMessageWithText:(id)a3 messageSubject:(id)a4 flags:(unint64_t)a5 expressiveSendStyleID:(id)a6 threadIdentifier:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;

  v12 = a7;
  v13 = a6;
  v14 = a4;
  v15 = a3;
  v16 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v16, "_initWithSender:time:timeRead:timeDelivered:timePlayed:plainText:text:messageSubject:fileTransferGUIDs:flags:error:guid:messageID:subject:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:associatedMessageGUID:associatedMessageType:associatedMessageRange:associatedMessageEmoji:messageSummaryInfo:threadIdentifier:dateEdited:scheduleType:scheduleState:", 0, v17, 0, 0, 0, 0, v15, v14, 0, a5, 0, v18, 0, 0,
                  0,
                  0,
                  v13,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  v12,
                  0,
                  0,
                  0);

  return v19;
}

+ (id)instantMessageWithText:(id)a3 messageSubject:(id)a4 flags:(unint64_t)a5 threadIdentifier:(id)a6 associatedMessageGUID:(id)a7 scheduledDate:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;

  v13 = a8;
  v14 = a7;
  v15 = a6;
  v16 = a4;
  v17 = a3;
  v18 = objc_alloc((Class)a1);
  if (v13)
  {
    v19 = 2;
    v20 = v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v18, "_initWithSender:time:timeRead:timeDelivered:timePlayed:plainText:text:messageSubject:fileTransferGUIDs:flags:error:guid:messageID:subject:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:associatedMessageGUID:associatedMessageType:associatedMessageRange:associatedMessageEmoji:messageSummaryInfo:threadIdentifier:dateEdited:scheduleType:scheduleState:", 0, v20, 0, 0, 0, 0, v17, v16, 0, a5, 0, v21, 0, 0,
                  0,
                  0,
                  0,
                  0,
                  v14,
                  0,
                  0,
                  0,
                  0,
                  0,
                  v15,
                  0,
                  v19,
                  v13 != 0);

  if (!v13)
  return v22;
}

+ (id)instantMessageWithText:(id)a3 messageSubject:(id)a4 fileTransferGUIDs:(id)a5 flags:(unint64_t)a6 threadIdentifier:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  if (!v12)
    v12 = objc_alloc_init(MEMORY[0x1E0CB3498]);
  v16 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v16, "_initWithSender:time:timeRead:timeDelivered:timePlayed:plainText:text:messageSubject:fileTransferGUIDs:flags:error:guid:messageID:subject:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:associatedMessageGUID:associatedMessageType:associatedMessageRange:associatedMessageEmoji:messageSummaryInfo:threadIdentifier:dateEdited:scheduleType:scheduleState:", 0, v17, 0, 0, 0, 0, v12, v13, v14, a6, 0, v18, 0, 0,
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
                  v15,
                  0,
                  0,
                  0);

  return v19;
}

+ (id)instantMessageWithText:(id)a3 messageSubject:(id)a4 fileTransferGUIDs:(id)a5 flags:(unint64_t)a6 balloonBundleID:(id)a7 payloadData:(id)a8 expressiveSendStyleID:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  if (!v15)
    v15 = objc_alloc_init(MEMORY[0x1E0CB3498]);
  v21 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v21, "_initWithSender:time:timeRead:timeDelivered:timePlayed:plainText:text:messageSubject:fileTransferGUIDs:flags:error:guid:messageID:subject:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:associatedMessageGUID:associatedMessageType:associatedMessageRange:associatedMessageEmoji:messageSummaryInfo:threadIdentifier:dateEdited:scheduleType:scheduleState:", 0, v22, 0, 0, 0, 0, v15, v16, v17, a6, 0, v23, 0, 0,
                  v18,
                  v19,
                  v20,
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

  return v24;
}

+ (id)fromMeIMHandle:(id)a3 withText:(id)a4 fileTransferGUIDs:(id)a5 flags:(unint64_t)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("IMMessage.m"), 254, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("imHandle != nil"));

    if (v12)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (!v12)
LABEL_3:
    v12 = objc_alloc_init(MEMORY[0x1E0CB3498]);
LABEL_4:
  v14 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v14, "initWithSender:time:text:fileTransferGUIDs:flags:error:guid:subject:threadIdentifier:", v11, v15, v12, v13, a6, 0, v16, 0, 0);

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
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
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  unint64_t v37;
  void *v38;
  id v39;

  v39 = objc_alloc((Class)objc_opt_class());
  -[IMMessage sender](self, "sender");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMessage time](self, "time");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMessage text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMessage messageSubject](self, "messageSubject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMessage fileTransferGUIDs](self, "fileTransferGUIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = -[IMMessage flags](self, "flags");
  -[IMMessage error](self, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMessage guid](self, "guid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMessage subject](self, "subject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMessage threadIdentifier](self, "threadIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v39, "initWithSender:time:text:messageSubject:fileTransferGUIDs:flags:error:guid:subject:threadIdentifier:", v38, v4, v5, v6, v7, v37, v8, v9, v10, v11);

  -[IMMessage time](self, "time");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_updateTime:", v13);

  -[IMMessage timeRead](self, "timeRead");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_updateTimeRead:", v14);

  -[IMMessage timeDelivered](self, "timeDelivered");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_updateTimeDelivered:", v15);

  -[IMMessage timePlayed](self, "timePlayed");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_updateTimePlayed:", v16);

  objc_msgSend(v12, "_updateMessageID:", -[IMMessage messageID](self, "messageID"));
  -[IMMessage associatedMessageGUID](self, "associatedMessageGUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_associatedMessageGUID:", v17);

  objc_msgSend(v12, "_associatedMessageType:", -[IMMessage associatedMessageType](self, "associatedMessageType"));
  v18 = -[IMMessage associatedMessageRange](self, "associatedMessageRange");
  objc_msgSend(v12, "_associatedMessageRange:", v18, v19);
  -[IMMessage associatedMessageEmoji](self, "associatedMessageEmoji");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_associatedMessageEmoji:", v20);

  -[IMMessage messageSummaryInfo](self, "messageSummaryInfo");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_messageSummaryInfo:", v21);

  -[IMMessage balloonBundleID](self, "balloonBundleID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBalloonBundleID:", v22);

  -[IMMessage payloadData](self, "payloadData");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPayloadData:", v23);

  -[IMMessage expressiveSendStyleID](self, "expressiveSendStyleID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setExpressiveSendStyleID:", v24);

  -[IMMessage timeExpressiveSendPlayed](self, "timeExpressiveSendPlayed");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTimeExpressiveSendPlayed:", v25);

  -[IMMessage bizIntent](self, "bizIntent");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_updateBizIntent:", v26);

  -[IMMessage locale](self, "locale");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_updateLocale:", v27);

  objc_msgSend(v12, "setUseStandalone:", -[IMMessage useStandalone](self, "useStandalone"));
  objc_msgSend(v12, "setShouldNotifyOnSend:", -[IMMessage shouldNotifyOnSend](self, "shouldNotifyOnSend"));
  -[IMMessage messageSummaryInfo](self, "messageSummaryInfo");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectForKey:", *MEMORY[0x1E0D38328]);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAssociatedBalloonBundleID:", v29);

  -[IMMessage messageSummaryInfo](self, "messageSummaryInfo");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "objectForKey:", *MEMORY[0x1E0D383B0]);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSourceApplicationID:", v31);

  -[IMMessage syndicationRanges](self, "syndicationRanges");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_syndicationRanges:", v32);

  -[IMMessage syncedSyndicationRanges](self, "syncedSyndicationRanges");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_syncedSyndicationRanges:", v33);

  -[IMMessage dateEdited](self, "dateEdited");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_updatedDateEdited:", v34);

  -[IMMessage groupActivity](self, "groupActivity");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setGroupActivity:", v35);

  objc_msgSend(v12, "setScheduleType:", -[IMMessage scheduleType](self, "scheduleType"));
  objc_msgSend(v12, "setScheduleState:", -[IMMessage scheduleState](self, "scheduleState"));
  return v12;
}

- (id)_copyWithFlags:(unint64_t)a3
{
  void *v4;

  v4 = (void *)-[IMMessage copy](self, "copy");
  objc_msgSend(v4, "_updateFlags:", a3);
  return v4;
}

- (id)_initWithSender:(id)a3 time:(id)a4 timeRead:(id)a5 timeDelivered:(id)a6 timePlayed:(id)a7 plainText:(id)a8 text:(id)a9 messageSubject:(id)a10 fileTransferGUIDs:(id)a11 flags:(unint64_t)a12 error:(id)a13 guid:(id)a14 messageID:(int64_t)a15 subject:(id)a16 balloonBundleID:(id)a17 payloadData:(id)a18 expressiveSendStyleID:(id)a19 timeExpressiveSendPlayed:(id)a20 associatedMessageGUID:(id)a21 associatedMessageType:(int64_t)a22 associatedMessageRange:(_NSRange)a23 associatedMessageEmoji:(id)a24 messageSummaryInfo:(id)a25 threadIdentifier:(id)a26 dateEdited:(id)a27 scheduleType:(unint64_t)a28 scheduleState:(unint64_t)a29
{
  id v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  IMMessage *v38;
  IMMessage *v39;
  id *p_messageSubject;
  uint64_t v41;
  NSString *associatedBalloonBundleID;
  id v43;
  uint64_t v44;
  NSString *sourceApplicationID;
  NSString *v46;
  NSString *guid;
  id *p_fileTransferGUIDs;
  NSString *v49;
  NSString *plainBody;
  id v51;
  uint64_t v52;
  NSString *v53;
  uint64_t v54;
  NSString *v55;
  NSString *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t i;
  void *v62;
  void *v63;
  int v64;
  unint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  char v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  id v76;
  void *v77;
  void *v78;
  unint64_t v79;
  NSDictionary *replyCountsByPart;
  BOOL v82;
  id v83;
  id v85;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v105;
  id v106;
  _QWORD v107[4];
  IMMessage *v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  objc_super v113;
  _BYTE v114[128];
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  v106 = a3;
  v85 = a4;
  v101 = a4;
  v100 = a5;
  v99 = a6;
  v98 = a7;
  v33 = a8;
  v105 = a9;
  v97 = a10;
  v102 = a11;
  v96 = a13;
  v34 = a14;
  v35 = a16;
  v95 = a17;
  v36 = v106;
  v94 = a18;
  v93 = a19;
  v92 = a20;
  v91 = a21;
  v90 = a24;
  v37 = a25;
  v89 = a26;
  v88 = a27;
  v113.receiver = self;
  v113.super_class = (Class)IMMessage;
  v38 = -[IMMessage init](&v113, sel_init);
  v39 = v38;
  if (v38)
  {
    v83 = v35;
    v87 = v33;
    objc_storeStrong((id *)&v38->_sender, a3);
    objc_storeStrong((id *)&v39->_time, v85);
    p_messageSubject = (id *)&v39->_messageSubject;
    objc_storeStrong((id *)&v39->_messageSubject, a10);
    v39->_messageID = a15;
    v39->_flags = a12;
    objc_storeStrong((id *)&v39->_timeRead, a5);
    objc_storeStrong((id *)&v39->_timeDelivered, a6);
    objc_storeStrong((id *)&v39->_timePlayed, a7);
    objc_storeStrong((id *)&v39->_subject, a16);
    objc_storeStrong((id *)&v39->_balloonBundleID, a17);
    objc_storeStrong((id *)&v39->_payloadData, a18);
    objc_storeStrong((id *)&v39->_expressiveSendStyleID, a19);
    objc_storeStrong((id *)&v39->_timeExpressiveSendPlayed, a20);
    objc_storeStrong((id *)&v39->_associatedMessageGUID, a21);
    v39->_associatedMessageType = a22;
    v39->_associatedMessageRange = a23;
    objc_storeStrong((id *)&v39->_associatedMessageEmoji, a24);
    objc_storeStrong((id *)&v39->_messageSummaryInfo, a25);
    objc_msgSend(v37, "objectForKey:", *MEMORY[0x1E0D38328]);
    v41 = objc_claimAutoreleasedReturnValue();
    associatedBalloonBundleID = v39->_associatedBalloonBundleID;
    v39->_associatedBalloonBundleID = (NSString *)v41;

    v43 = v37;
    objc_msgSend(v37, "objectForKey:", *MEMORY[0x1E0D383B0]);
    v44 = objc_claimAutoreleasedReturnValue();
    sourceApplicationID = v39->_sourceApplicationID;
    v39->_sourceApplicationID = (NSString *)v44;

    objc_storeStrong((id *)&v39->_dateEdited, a27);
    v39->_scheduleType = a28;
    v39->_scheduleState = a29;
    if (v34)
    {
      v46 = (NSString *)v34;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
      v46 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    guid = v39->_guid;
    v39->_guid = v46;

    if (objc_msgSend(v106, "isLoginIMHandle"))
      v39->_flags |= 4uLL;
    if (v105)
      objc_storeStrong((id *)&v39->_text, a9);
    p_fileTransferGUIDs = (id *)&v39->_fileTransferGUIDs;
    objc_storeStrong((id *)&v39->_fileTransferGUIDs, a11);
    if (objc_msgSend(v33, "length"))
    {
      v49 = (NSString *)v33;
      plainBody = v39->_plainBody;
      v39->_plainBody = v49;
    }
    else
    {
      v51 = v34;
      v52 = objc_msgSend(v102, "count");
      -[NSAttributedString string](v39->_text, "string");
      v53 = (NSString *)objc_claimAutoreleasedReturnValue();
      plainBody = v53;
      if (v52)
      {
        -[NSString __stringByStrippingAttachmentAndControlCharacters](v53, "__stringByStrippingAttachmentAndControlCharacters");
        v54 = objc_claimAutoreleasedReturnValue();
        v55 = v39->_plainBody;
        v39->_plainBody = (NSString *)v54;

      }
      else
      {
        v56 = v39->_plainBody;
        v39->_plainBody = v53;
        plainBody = v56;
      }
      v34 = v51;
      p_messageSubject = (id *)&v39->_messageSubject;
    }

    if (-[NSString length](v39->_plainBody, "length")
      && -[NSString characterAtIndex:](v39->_plainBody, "characterAtIndex:", 0) == 47
      && !objc_msgSend(*p_fileTransferGUIDs, "count")
      && !objc_msgSend(*p_messageSubject, "length"))
    {
      v103 = v34;
      v111 = 0u;
      v112 = 0u;
      v109 = 0u;
      v110 = 0u;
      IMEmotePrefixes();
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v109, v114, 16);
      if (v58)
      {
        v59 = v58;
        v60 = *(_QWORD *)v110;
        while (2)
        {
          for (i = 0; i != v59; ++i)
          {
            if (*(_QWORD *)v110 != v60)
              objc_enumerationMutation(v57);
            v62 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * i);
            objc_msgSend(v62, "commonPrefixWithString:options:", v39->_plainBody, 1);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            v64 = objc_msgSend(v63, "isEqualToString:", v62);

            if (v64)
            {
              v65 = -[NSString length](v39->_plainBody, "length");
              if (v65 > objc_msgSend(v62, "length"))
              {
                v66 = -[NSString characterAtIndex:](v39->_plainBody, "characterAtIndex:", objc_msgSend(v62, "length"));
                objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet");
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                LOBYTE(v66) = objc_msgSend(v67, "characterIsMember:", v66);

                if ((v66 & 1) == 0)
                {
                  v39->_flags |= 2uLL;
                  goto LABEL_31;
                }
              }
            }
          }
          v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v109, v114, 16);
          if (v59)
            continue;
          break;
        }
      }
LABEL_31:

      v33 = v87;
      v34 = v103;
    }
    if ((v39->_flags & 0x20000000) == 0)
    {
      -[IMMessage subject](v39, "subject");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v68, "isBusiness") & 1) != 0)
      {
LABEL_36:

        goto LABEL_37;
      }
      -[IMMessage sender](v39, "sender");
      v69 = v34;
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = objc_msgSend(v70, "isBusiness");

      v34 = v69;
      if ((v71 & 1) == 0)
      {
        v72 = *MEMORY[0x1E0D381F0];
        v73 = objc_msgSend(v105, "length");
        v107[0] = MEMORY[0x1E0C809B0];
        v107[1] = 3221225472;
        v107[2] = sub_1A20DE884;
        v107[3] = &unk_1E47217C8;
        v108 = v39;
        v74 = v73;
        v34 = v69;
        objc_msgSend(v105, "enumerateAttribute:inRange:options:usingBlock:", v72, 0, v74, 0, v107);
        v68 = v108;
        goto LABEL_36;
      }
    }
LABEL_37:
    -[IMMessage plainBody](v39, "plainBody");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v75, "length") && !objc_msgSend(*p_fileTransferGUIDs, "count"))
    {
      v76 = v34;
      -[IMMessage messageSubject](v39, "messageSubject");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v77, "length"))
      {
        -[IMMessage payloadData](v39, "payloadData");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v78, "length"))
        {
          v82 = -[IMMessage wasDetonated](v39, "wasDetonated");

          v34 = v76;
          if (!v82)
          {
            v79 = v39->_flags | 8;
            goto LABEL_45;
          }
LABEL_44:
          v79 = v39->_flags & 0xFFFFFFFFFFFFFFF7;
LABEL_45:
          v35 = v83;
          v37 = v43;
          v39->_flags = v79;
          objc_storeStrong((id *)&v39->_error, a13);
          objc_storeStrong((id *)&v39->_threadIdentifier, a26);
          replyCountsByPart = v39->_replyCountsByPart;
          v39->_replyCountsByPart = 0;

          v36 = v106;
          goto LABEL_46;
        }

      }
      v34 = v76;
    }

    goto LABEL_44;
  }
LABEL_46:

  return v39;
}

- (IMMessage)initWithSender:(id)a3 time:(id)a4 text:(id)a5 messageSubject:(id)a6 fileTransferGUIDs:(id)a7 flags:(unint64_t)a8 error:(id)a9 guid:(id)a10 subject:(id)a11
{
  return (IMMessage *)-[IMMessage _initWithSender:time:timeRead:timeDelivered:timePlayed:plainText:text:messageSubject:fileTransferGUIDs:flags:error:guid:messageID:subject:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:associatedMessageGUID:associatedMessageType:associatedMessageRange:associatedMessageEmoji:messageSummaryInfo:threadIdentifier:dateEdited:scheduleType:scheduleState:](self, "_initWithSender:time:timeRead:timeDelivered:timePlayed:plainText:text:messageSubject:fileTransferGUIDs:flags:error:guid:messageID:subject:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:associatedMessageGUID:associatedMessageType:associatedMessageRange:associatedMessageEmoji:messageSummaryInfo:threadIdentifier:dateEdited:scheduleType:scheduleState:", a3, a4, 0, 0, 0, 0, a5, a6, a7, a8, a9, a10, 0, a11,
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
}

- (IMMessage)initWithSender:(id)a3 time:(id)a4 text:(id)a5 messageSubject:(id)a6 fileTransferGUIDs:(id)a7 flags:(unint64_t)a8 error:(id)a9 guid:(id)a10 subject:(id)a11 threadIdentifier:(id)a12
{
  return (IMMessage *)-[IMMessage _initWithSender:time:timeRead:timeDelivered:timePlayed:plainText:text:messageSubject:fileTransferGUIDs:flags:error:guid:messageID:subject:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:associatedMessageGUID:associatedMessageType:associatedMessageRange:associatedMessageEmoji:messageSummaryInfo:threadIdentifier:dateEdited:scheduleType:scheduleState:](self, "_initWithSender:time:timeRead:timeDelivered:timePlayed:plainText:text:messageSubject:fileTransferGUIDs:flags:error:guid:messageID:subject:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:associatedMessageGUID:associatedMessageType:associatedMessageRange:associatedMessageEmoji:messageSummaryInfo:threadIdentifier:dateEdited:scheduleType:scheduleState:", a3, a4, 0, 0, 0, 0, a5, a6, a7, a8, a9, a10, 0, a11,
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
                        a12,
                        0,
                        0,
                        0);
}

- (IMMessage)initWithSender:(id)a3 time:(id)a4 text:(id)a5 fileTransferGUIDs:(id)a6 flags:(unint64_t)a7 error:(id)a8 guid:(id)a9 subject:(id)a10
{
  return (IMMessage *)-[IMMessage _initWithSender:time:timeRead:timeDelivered:timePlayed:plainText:text:messageSubject:fileTransferGUIDs:flags:error:guid:messageID:subject:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:associatedMessageGUID:associatedMessageType:associatedMessageRange:associatedMessageEmoji:messageSummaryInfo:threadIdentifier:dateEdited:scheduleType:scheduleState:](self, "_initWithSender:time:timeRead:timeDelivered:timePlayed:plainText:text:messageSubject:fileTransferGUIDs:flags:error:guid:messageID:subject:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:associatedMessageGUID:associatedMessageType:associatedMessageRange:associatedMessageEmoji:messageSummaryInfo:threadIdentifier:dateEdited:scheduleType:scheduleState:", a3, a4, 0, 0, 0, 0, a5, 0, a6, a7, a8, a9, 0, a10,
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
}

- (IMMessage)initWithSender:(id)a3 time:(id)a4 text:(id)a5 fileTransferGUIDs:(id)a6 flags:(unint64_t)a7 error:(id)a8 guid:(id)a9 subject:(id)a10 threadIdentifier:(id)a11
{
  return (IMMessage *)-[IMMessage _initWithSender:time:timeRead:timeDelivered:timePlayed:plainText:text:messageSubject:fileTransferGUIDs:flags:error:guid:messageID:subject:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:associatedMessageGUID:associatedMessageType:associatedMessageRange:associatedMessageEmoji:messageSummaryInfo:threadIdentifier:dateEdited:scheduleType:scheduleState:](self, "_initWithSender:time:timeRead:timeDelivered:timePlayed:plainText:text:messageSubject:fileTransferGUIDs:flags:error:guid:messageID:subject:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:associatedMessageGUID:associatedMessageType:associatedMessageRange:associatedMessageEmoji:messageSummaryInfo:threadIdentifier:dateEdited:scheduleType:scheduleState:", a3, a4, 0, 0, 0, 0, a5, 0, a6, a7, a8, a9, 0, a10,
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
                        a11,
                        0,
                        0,
                        0);
}

- (IMMessage)initWithSender:(id)a3 time:(id)a4 text:(id)a5 messageSubject:(id)a6 fileTransferGUIDs:(id)a7 flags:(unint64_t)a8 error:(id)a9 guid:(id)a10 subject:(id)a11 balloonBundleID:(id)a12 payloadData:(id)a13 expressiveSendStyleID:(id)a14
{
  return (IMMessage *)-[IMMessage _initWithSender:time:timeRead:timeDelivered:timePlayed:plainText:text:messageSubject:fileTransferGUIDs:flags:error:guid:messageID:subject:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:associatedMessageGUID:associatedMessageType:associatedMessageRange:associatedMessageEmoji:messageSummaryInfo:threadIdentifier:dateEdited:scheduleType:scheduleState:](self, "_initWithSender:time:timeRead:timeDelivered:timePlayed:plainText:text:messageSubject:fileTransferGUIDs:flags:error:guid:messageID:subject:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:associatedMessageGUID:associatedMessageType:associatedMessageRange:associatedMessageEmoji:messageSummaryInfo:threadIdentifier:dateEdited:scheduleType:scheduleState:", a3, a4, 0, 0, 0, 0, a5, a6, a7, a8, a9, a10, 0, a11,
                        a12,
                        a13,
                        a14,
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
}

- (IMMessage)initWithSender:(id)a3 time:(id)a4 text:(id)a5 messageSubject:(id)a6 fileTransferGUIDs:(id)a7 flags:(unint64_t)a8 error:(id)a9 guid:(id)a10 subject:(id)a11 balloonBundleID:(id)a12 payloadData:(id)a13 expressiveSendStyleID:(id)a14 threadIdentifier:(id)a15
{
  return (IMMessage *)-[IMMessage _initWithSender:time:timeRead:timeDelivered:timePlayed:plainText:text:messageSubject:fileTransferGUIDs:flags:error:guid:messageID:subject:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:associatedMessageGUID:associatedMessageType:associatedMessageRange:associatedMessageEmoji:messageSummaryInfo:threadIdentifier:dateEdited:scheduleType:scheduleState:](self, "_initWithSender:time:timeRead:timeDelivered:timePlayed:plainText:text:messageSubject:fileTransferGUIDs:flags:error:guid:messageID:subject:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:associatedMessageGUID:associatedMessageType:associatedMessageRange:associatedMessageEmoji:messageSummaryInfo:threadIdentifier:dateEdited:scheduleType:scheduleState:", a3, a4, 0, 0, 0, 0, a5, a6, a7, a8, a9, a10, 0, a11,
                        a12,
                        a13,
                        a14,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        a15,
                        0,
                        0,
                        0);
}

- (IMMessage)initWithSender:(id)a3 time:(id)a4 text:(id)a5 messageSubject:(id)a6 fileTransferGUIDs:(id)a7 flags:(unint64_t)a8 error:(id)a9 guid:(id)a10 subject:(id)a11 balloonBundleID:(id)a12 payloadData:(id)a13 expressiveSendStyleID:(id)a14 threadIdentifier:(id)a15 scheduleType:(unint64_t)a16 scheduleState:(unint64_t)a17 messageSummaryInfo:(id)a18
{
  return (IMMessage *)-[IMMessage _initWithSender:time:timeRead:timeDelivered:timePlayed:plainText:text:messageSubject:fileTransferGUIDs:flags:error:guid:messageID:subject:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:associatedMessageGUID:associatedMessageType:associatedMessageRange:associatedMessageEmoji:messageSummaryInfo:threadIdentifier:dateEdited:scheduleType:scheduleState:](self, "_initWithSender:time:timeRead:timeDelivered:timePlayed:plainText:text:messageSubject:fileTransferGUIDs:flags:error:guid:messageID:subject:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:associatedMessageGUID:associatedMessageType:associatedMessageRange:associatedMessageEmoji:messageSummaryInfo:threadIdentifier:dateEdited:scheduleType:scheduleState:", a3, a4, 0, 0, 0, 0, a5, a6, a7, a8, a9, a10, 0, a11,
                        a12,
                        a13,
                        a14,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        a18,
                        a15,
                        0,
                        a16,
                        a17);
}

- (IMMessage)initWithSender:(id)a3 time:(id)a4 text:(id)a5 messageSubject:(id)a6 fileTransferGUIDs:(id)a7 flags:(unint64_t)a8 error:(id)a9 guid:(id)a10 subject:(id)a11 balloonBundleID:(id)a12 payloadData:(id)a13 expressiveSendStyleID:(id)a14 threadIdentifier:(id)a15 scheduleType:(unint64_t)a16 scheduleState:(unint64_t)a17
{
  return (IMMessage *)-[IMMessage _initWithSender:time:timeRead:timeDelivered:timePlayed:plainText:text:messageSubject:fileTransferGUIDs:flags:error:guid:messageID:subject:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:associatedMessageGUID:associatedMessageType:associatedMessageRange:associatedMessageEmoji:messageSummaryInfo:threadIdentifier:dateEdited:scheduleType:scheduleState:](self, "_initWithSender:time:timeRead:timeDelivered:timePlayed:plainText:text:messageSubject:fileTransferGUIDs:flags:error:guid:messageID:subject:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:associatedMessageGUID:associatedMessageType:associatedMessageRange:associatedMessageEmoji:messageSummaryInfo:threadIdentifier:dateEdited:scheduleType:scheduleState:", a3, a4, 0, 0, 0, 0, a5, a6, a7, a8, a9, a10, 0, a11,
                        a12,
                        a13,
                        a14,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        a15,
                        0,
                        a16,
                        a17);
}

- (IMMessage)initWithSender:(id)a3 time:(id)a4 text:(id)a5 messageSubject:(id)a6 fileTransferGUIDs:(id)a7 flags:(unint64_t)a8 error:(id)a9 guid:(id)a10 subject:(id)a11 associatedMessageGUID:(id)a12 associatedMessageType:(int64_t)a13 associatedMessageRange:(_NSRange)a14 messageSummaryInfo:(id)a15
{
  return (IMMessage *)-[IMMessage _initWithSender:time:timeRead:timeDelivered:timePlayed:plainText:text:messageSubject:fileTransferGUIDs:flags:error:guid:messageID:subject:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:associatedMessageGUID:associatedMessageType:associatedMessageRange:associatedMessageEmoji:messageSummaryInfo:threadIdentifier:dateEdited:scheduleType:scheduleState:](self, "_initWithSender:time:timeRead:timeDelivered:timePlayed:plainText:text:messageSubject:fileTransferGUIDs:flags:error:guid:messageID:subject:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:associatedMessageGUID:associatedMessageType:associatedMessageRange:associatedMessageEmoji:messageSummaryInfo:threadIdentifier:dateEdited:scheduleType:scheduleState:", a3, a4, 0, 0, 0, 0, a5, a6, a7, a8, a9, a10, 0, a11,
                        0,
                        0,
                        0,
                        0,
                        a12,
                        a13,
                        a14.location,
                        a14.length,
                        0,
                        a15,
                        0,
                        0,
                        0,
                        0);
}

- (IMMessage)initWithSender:(id)a3 time:(id)a4 text:(id)a5 messageSubject:(id)a6 fileTransferGUIDs:(id)a7 flags:(unint64_t)a8 error:(id)a9 guid:(id)a10 subject:(id)a11 associatedMessageGUID:(id)a12 associatedMessageType:(int64_t)a13 associatedMessageRange:(_NSRange)a14 messageSummaryInfo:(id)a15 threadIdentifier:(id)a16
{
  return (IMMessage *)-[IMMessage _initWithSender:time:timeRead:timeDelivered:timePlayed:plainText:text:messageSubject:fileTransferGUIDs:flags:error:guid:messageID:subject:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:associatedMessageGUID:associatedMessageType:associatedMessageRange:associatedMessageEmoji:messageSummaryInfo:threadIdentifier:dateEdited:scheduleType:scheduleState:](self, "_initWithSender:time:timeRead:timeDelivered:timePlayed:plainText:text:messageSubject:fileTransferGUIDs:flags:error:guid:messageID:subject:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:associatedMessageGUID:associatedMessageType:associatedMessageRange:associatedMessageEmoji:messageSummaryInfo:threadIdentifier:dateEdited:scheduleType:scheduleState:", a3, a4, 0, 0, 0, 0, a5, a6, a7, a8, a9, a10, 0, a11,
                        0,
                        0,
                        0,
                        0,
                        a12,
                        a13,
                        a14.location,
                        a14.length,
                        0,
                        a15,
                        a16,
                        0,
                        0,
                        0);
}

- (IMMessage)initWithSender:(id)a3 fileTransfer:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  IMMessage *v15;
  IMMessage *v16;

  v6 = a3;
  objc_msgSend(a4, "guid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0C99D80]);
  v9 = (void *)objc_msgSend(v8, "initWithObjectsAndKeys:", v7, *MEMORY[0x1E0D36430], 0);
  v10 = objc_alloc(MEMORY[0x1E0CB3498]);
  v11 = (void *)objc_msgSend(v10, "initWithString:attributes:", *MEMORY[0x1E0D362F8], v9);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v7, 0);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[IMMessage initWithSender:time:text:fileTransferGUIDs:flags:error:guid:subject:threadIdentifier:](self, "initWithSender:time:text:fileTransferGUIDs:flags:error:guid:subject:threadIdentifier:", v6, v13, v11, v12, 1, 0, v14, 0, 0);

  v16 = v15;
  return v16;
}

- (NSString)senderName
{
  return -[IMHandle name](self->_sender, "name");
}

- (NSString)summaryString
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[IMMessage plainBody](self, "plainBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  if (-[IMMessage isEmote](self, "isEmote"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    IMEmotePrefixes();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v10, "commonPrefixWithString:options:", v4, 1, (_QWORD)v16);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqualToString:", v10);

          if (v12)
          {
            v13 = objc_msgSend(v10, "length");
            -[IMMessage senderName](self, "senderName");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "replaceCharactersInRange:withString:", 0, v13, v14);

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

  }
  objc_msgSend(v4, "replaceNewlinesWithSpaces", (_QWORD)v16);

  return (NSString *)v4;
}

- (BOOL)hasDataDetectorResults
{
  return BYTE2(self->_flags) & 1;
}

- (BOOL)isLocatingMessage
{
  return BYTE2(self->_flags) >> 7;
}

- (BOOL)isSent
{
  return BYTE1(self->_flags) >> 7;
}

- (BOOL)hasInlineAttachments
{
  void *v3;
  BOOL v4;

  if (!-[NSAttributedString length](self->_text, "length"))
    return 0;
  -[NSAttributedString string](self->_text, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "rangeOfString:", *MEMORY[0x1E0D362F8]) != 0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

- (NSArray)inlineAttachmentAttributesArray
{
  void *v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NSAttributedString length](self->_text, "length");
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *MEMORY[0x1E0D36430];
    do
    {
      v11 = 0;
      v12 = 0;
      -[NSAttributedString attributesAtIndex:longestEffectiveRange:inRange:](self->_text, "attributesAtIndex:longestEffectiveRange:inRange:", v6, &v11, v6, v5 - v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        objc_msgSend(v3, "addObject:", v8);
      v6 = v12 + v11;

    }
    while (v6 < v5);
  }
  return (NSArray *)v3;
}

- (BOOL)isSenderUnknown
{
  BOOL v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint8_t v10[16];

  if (!-[IMMessage isFromMe](self, "isFromMe"))
  {
    -[IMMessage sender](self, "sender");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      if ((objc_msgSend(v4, "isContact") & 1) != 0 || (objc_msgSend(v5, "isBusiness") & 1) != 0)
        goto LABEL_6;
      objc_msgSend(v5, "service");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[IMService iMessageService](IMServiceImpl, "iMessageService");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7 == v8)
      {
        objc_msgSend(v5, "normalizedID");
        v6 = objc_claimAutoreleasedReturnValue();
        if (IMStringIsEmail()
          && ((-[NSObject hasSuffix:](v6, "hasSuffix:", CFSTR("@apple.com")) & 1) != 0
           || (-[NSObject hasSuffix:](v6, "hasSuffix:", CFSTR(".apple.com")) & 1) != 0))
        {

LABEL_6:
          v3 = 0;
LABEL_17:

          return v3;
        }
        goto LABEL_15;
      }
    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "Could not determine sender, returning unknown sender", v10, 2u);
      }
LABEL_15:

    }
    v3 = 1;
    goto LABEL_17;
  }
  return 0;
}

- (BOOL)isDelayed
{
  return (LOBYTE(self->_flags) >> 5) & 1;
}

- (BOOL)isAutoReply
{
  return (LOBYTE(self->_flags) >> 6) & 1;
}

- (BOOL)isDelivered
{
  return (BYTE1(self->_flags) >> 4) & 1;
}

- (BOOL)isRead
{
  return (BYTE1(self->_flags) >> 5) & 1;
}

- (BOOL)isAudioMessage
{
  return (BYTE2(self->_flags) >> 5) & 1;
}

- (BOOL)isPlayed
{
  return (BYTE2(self->_flags) >> 6) & 1;
}

- (BOOL)isSystemMessage
{
  void *v3;
  _BOOL4 v4;

  if ((self->_flags & 4) != 0)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    -[IMMessage sender](self, "sender");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      v4 = (BYTE1(self->_flags) >> 6) & 1;
    else
      LOBYTE(v4) = 1;

  }
  return v4;
}

- (BOOL)isAlert
{
  return (BYTE1(self->_flags) >> 1) & 1;
}

- (BOOL)wasDowngraded
{
  return (BYTE2(self->_flags) >> 3) & 1;
}

- (BOOL)wasDataDetected
{
  return (BYTE2(self->_flags) >> 4) & 1;
}

- (BOOL)wasDeliveredQuietly
{
  return (BYTE4(self->_flags) >> 2) & 1;
}

- (BOOL)didNotifyRecipient
{
  return (BYTE4(self->_flags) >> 3) & 1;
}

- (BOOL)isSOS
{
  return BYTE4(self->_flags) >> 7;
}

- (BOOL)isCritical
{
  return (BYTE4(self->_flags) >> 6) & 1;
}

- (BOOL)isSuggestedActionResponse
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  char v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isLazuliEnabled");

  if (!v4)
    return 0;
  -[IMMessage text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = *MEMORY[0x1E0D393B8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "__im_containsAttributedValue:", v6);

  return v7;
}

- (BOOL)isKeyTransparencyVerifiedMessage
{
  return (BYTE4(self->_flags) >> 5) & 1;
}

- (void)setIsKeyTransparencyVerifiedMessage:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000;
  if (!a3)
    v3 = 0;
  self->_flags = self->_flags & 0xFFFFFFDFFFFFFFFFLL | v3;
}

- (BOOL)isTapToRetry
{
  return BYTE5(self->_flags) & 1;
}

- (void)setIsTapToRetry:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000000;
  if (!a3)
    v3 = 0;
  self->_flags = self->_flags & 0xFFFFFEFFFFFFFFFFLL | v3;
}

- (BOOL)isPendingSatelliteSend
{
  void *v3;
  int v4;
  _BOOL4 v5;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCarrierPigeonEnabled");

  if (v4)
    return (BYTE5(self->_flags) >> 1) & 1;
  else
    LOBYTE(v5) = 0;
  return v5;
}

- (void)setPendingSatelliteSend:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  int v6;
  uint64_t v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isCarrierPigeonEnabled");

  if (v6)
  {
    v7 = 0x20000000000;
    if (!v3)
      v7 = 0;
    self->_flags = self->_flags & 0xFFFFFDFFFFFFFFFFLL | v7;
  }
}

- (BOOL)needsRelay
{
  void *v3;
  int v4;
  _BOOL4 v5;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCarrierPigeonEnabled");

  if (v4)
    return (BYTE5(self->_flags) >> 2) & 1;
  else
    LOBYTE(v5) = 0;
  return v5;
}

- (void)setNeedsRelay:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  int v6;
  uint64_t v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isCarrierPigeonEnabled");

  if (v6)
  {
    v7 = 0x40000000000;
    if (!v3)
      v7 = 0;
    self->_flags = self->_flags & 0xFFFFFBFFFFFFFFFFLL | v7;
  }
}

- (BOOL)sentOrReceivedOffGrid
{
  void *v3;
  int v4;
  _BOOL4 v5;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCarrierPigeonEnabled");

  if (v4)
    return (BYTE5(self->_flags) >> 3) & 1;
  else
    LOBYTE(v5) = 0;
  return v5;
}

- (void)setSentOrReceivedOffGrid:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  int v6;
  uint64_t v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isCarrierPigeonEnabled");

  if (v6)
  {
    v7 = 0x80000000000;
    if (!v3)
      v7 = 0;
    self->_flags = self->_flags & 0xFFFFF7FFFFFFFFFFLL | v7;
  }
}

- (NSIndexSet)editedPartIndexes
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[IMMessage messageSummaryInfo](self, "messageSummaryInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0D38370]);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = (void *)MEMORY[0x1E0C9AA60];
  if (v3)
    v5 = (void *)v3;
  v6 = v5;

  objc_msgSend(MEMORY[0x1E0CB36B8], "__im_indexSetFromNumberArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSIndexSet *)v7;
}

- (void)setEditedPartIndexes:(id)a3
{
  void *v4;
  void *v5;
  NSDictionary *v6;
  NSDictionary *messageSummaryInfo;
  id v8;

  objc_msgSend(a3, "__im_numberArray");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[IMMessage messageSummaryInfo](self, "messageSummaryInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    -[IMMessage messageSummaryInfo](self, "messageSummaryInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (NSDictionary *)objc_msgSend(v5, "mutableCopy");

  }
  else
  {
    v6 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  }

  -[NSDictionary setObject:forKey:](v6, "setObject:forKey:", v8, *MEMORY[0x1E0D38370]);
  messageSummaryInfo = self->_messageSummaryInfo;
  self->_messageSummaryInfo = v6;

}

- (void)addEditedPartIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  -[IMMessage editedPartIndexes](self, "editedPartIndexes");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(v5, "addIndex:", a3);
  v6 = (void *)objc_msgSend(v5, "copy");
  -[IMMessage setEditedPartIndexes:](self, "setEditedPartIndexes:", v6);

}

- (void)setRetractedPartIndexes:(id)a3
{
  void *v4;
  void *v5;
  NSDictionary *v6;
  NSDictionary *messageSummaryInfo;
  id v8;

  objc_msgSend(a3, "__im_numberArray");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[IMMessage messageSummaryInfo](self, "messageSummaryInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    -[IMMessage messageSummaryInfo](self, "messageSummaryInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (NSDictionary *)objc_msgSend(v5, "mutableCopy");

  }
  else
  {
    v6 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  }

  -[NSDictionary setObject:forKey:](v6, "setObject:forKey:", v8, *MEMORY[0x1E0D383A0]);
  messageSummaryInfo = self->_messageSummaryInfo;
  self->_messageSummaryInfo = v6;

}

- (void)addRetractedPartIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  -[IMMessage retractedPartIndexes](self, "retractedPartIndexes");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(v5, "addIndex:", a3);
  v6 = (void *)objc_msgSend(v5, "copy");
  -[IMMessage setRetractedPartIndexes:](self, "setRetractedPartIndexes:", v6);

}

- (BOOL)hasEditedParts
{
  void *v2;
  BOOL v3;

  -[IMMessage dateEdited](self, "dateEdited");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isDeviceActionMessage
{
  void *v2;
  void *v3;
  char v4;

  -[IMMessage messageSummaryInfo](self, "messageSummaryInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0D38358]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)setAssociatedBalloonBundleID:(id)a3
{
  NSString **p_associatedBalloonBundleID;
  NSDictionary *Mutable;
  NSDictionary *messageSummaryInfo;
  id v8;

  p_associatedBalloonBundleID = &self->_associatedBalloonBundleID;
  v8 = a3;
  if (!-[NSString isEqualToString:](*p_associatedBalloonBundleID, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_associatedBalloonBundleID, a3);
    Mutable = (NSDictionary *)-[NSDictionary mutableCopy](self->_messageSummaryInfo, "mutableCopy");
    if (!Mutable)
      Mutable = (NSDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    if (*p_associatedBalloonBundleID)
      -[NSDictionary setObject:forKey:](Mutable, "setObject:forKey:", *p_associatedBalloonBundleID, *MEMORY[0x1E0D38328]);
    messageSummaryInfo = self->_messageSummaryInfo;
    self->_messageSummaryInfo = Mutable;

  }
}

- (void)setSourceApplicationID:(id)a3
{
  NSString **p_sourceApplicationID;
  NSDictionary *Mutable;
  NSDictionary *messageSummaryInfo;
  id v8;

  p_sourceApplicationID = &self->_sourceApplicationID;
  v8 = a3;
  if (!-[NSString isEqualToString:](*p_sourceApplicationID, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_sourceApplicationID, a3);
    Mutable = (NSDictionary *)-[NSDictionary mutableCopy](self->_messageSummaryInfo, "mutableCopy");
    if (!Mutable)
      Mutable = (NSDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    if (*p_sourceApplicationID)
      -[NSDictionary setObject:forKey:](Mutable, "setObject:forKey:", *p_sourceApplicationID, *MEMORY[0x1E0D383B0]);
    messageSummaryInfo = self->_messageSummaryInfo;
    self->_messageSummaryInfo = Mutable;

  }
}

- (BOOL)isReply
{
  void *v2;
  BOOL v3;

  -[IMMessage threadIdentifier](self, "threadIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (int64_t)compare:(id)a3
{
  return IMMessageCompare(self, a3, 0);
}

- (int64_t)compare:(id)a3 comparisonType:(int64_t)a4
{
  return IMMessageCompare(self, a3, a4);
}

- (id)_account
{
  void *v3;
  void *v4;
  void *v5;

  -[IMMessage subject](self, "subject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[IMMessage sender](self, "sender");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "account");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (void)_updateSender:(id)a3
{
  objc_storeStrong((id *)&self->_sender, a3);
}

- (IMMessageItem)_imMessageItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  int64_t v71;
  int v72;
  int64_t v73;
  int64_t v74;
  unint64_t v75;
  unint64_t v76;
  id v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  void *v87;
  int v88;
  void *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;

  -[IMMessage _account](self, "_account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMessage text](self, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "__im_attributedStringByAssigningMessagePartNumbers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v90 = objc_msgSend(v5, "__im_countMessageParts");
  -[IMMessage sender](self, "sender");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0C99D80];
    -[IMMessage sender](self, "sender");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryWithObject:forKey:", v11, *MEMORY[0x1E0D36D90]);
    v12 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = MEMORY[0x1E0C9AA70];
  }
  -[IMMessage associatedMessageGUID](self, "associatedMessageGUID");
  v13 = objc_claimAutoreleasedReturnValue();
  v92 = v3;
  v109 = v5;
  v97 = (void *)v12;
  if (v13
    && (v14 = (void *)v13,
        -[IMMessage associatedMessageGUID](self, "associatedMessageGUID"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = objc_msgSend(v15, "length"),
        v15,
        v14,
        v16))
  {
    -[IMMessage balloonBundleID](self, "balloonBundleID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0D374C8]);

    if (v18)
    {
      -[IMMessage locale](self, "locale");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v108 = 0;
    }
    v78 = objc_alloc(MEMORY[0x1E0D396C8]);
    -[IMMessage time](self, "time");
    v86 = objc_claimAutoreleasedReturnValue();
    -[IMMessage messageSubject](self, "messageSubject");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "string");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessage fileTransferGUIDs](self, "fileTransferGUIDs");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = -[IMMessage flags](self, "flags");
    -[IMMessage guid](self, "guid");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = -[IMMessage messageID](self, "messageID");
    objc_msgSend(v3, "loginIMHandle");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "ID");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "uniqueID");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "internalName");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessage subject](self, "subject");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "ID");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessage subject](self, "subject");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "originalID");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessage subject](self, "subject");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "countryCode");
    v84 = objc_claimAutoreleasedReturnValue();
    -[IMMessage balloonBundleID](self, "balloonBundleID");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessage payloadData](self, "payloadData");
    v82 = objc_claimAutoreleasedReturnValue();
    -[IMMessage expressiveSendStyleID](self, "expressiveSendStyleID");
    v80 = objc_claimAutoreleasedReturnValue();
    -[IMMessage timeExpressiveSendPlayed](self, "timeExpressiveSendPlayed");
    v39 = objc_claimAutoreleasedReturnValue();
    -[IMMessage error](self, "error");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v89, "code");
    -[IMMessage associatedMessageGUID](self, "associatedMessageGUID");
    v40 = objc_claimAutoreleasedReturnValue();
    v71 = -[IMMessage associatedMessageType](self, "associatedMessageType");
    v41 = -[IMMessage associatedMessageRange](self, "associatedMessageRange");
    v43 = v42;
    -[IMMessage associatedMessageEmoji](self, "associatedMessageEmoji");
    v44 = objc_claimAutoreleasedReturnValue();
    -[IMMessage biaReferenceID](self, "biaReferenceID");
    v45 = objc_claimAutoreleasedReturnValue();
    -[IMMessage messageSummaryInfo](self, "messageSummaryInfo");
    v46 = objc_claimAutoreleasedReturnValue();
    -[IMMessage threadIdentifier](self, "threadIdentifier");
    v70 = v90;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)v46;
    v69 = v46;
    v91 = (void *)v45;
    v67 = v45;
    v87 = (void *)v44;
    v62 = v43;
    v64 = v44;
    v32 = (void *)v40;
    v59 = v40;
    LODWORD(v56) = v72;
    v33 = (void *)v39;
    v34 = (void *)v80;
    v55 = v39;
    v36 = (void *)v82;
    v38 = (void *)v86;
    v35 = (void *)v84;
    v37 = (void *)objc_msgSend(v78, "initWithSenderInfo:time:timeRead:timeDelivered:timePlayed:subject:body:bodyData:attributes:fileTransferGUIDs:flags:guid:messageID:account:accountID:service:handle:roomName:unformattedID:countryCode:expireState:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:errorType:associatedMessageGUID:associatedMessageType:associatedMessageRange:associatedMessageEmoji:bizIntent:locale:biaReferenceID:messageSummaryInfo:partCount:threadIdentifier:scheduleType:scheduleState:", v97, v86, 0, 0, 0, v105, v109, 0, 0, v107, v76, v96, v74,
                    v106,
                    v104,
                    v95,
                    v94,
                    0,
                    v93,
                    v84,
                    0,
                    v103,
                    v82,
                    v80,
                    v55,
                    v56,
                    v59,
                    v71,
                    v41,
                    v62,
                    v64,
                    0,
                    v108,
                    v67,
                    v69,
                    v70,
                    v30,
                    -[IMMessage scheduleType](self, "scheduleType"),
                    -[IMMessage scheduleState](self, "scheduleState"));
  }
  else
  {
    v77 = objc_alloc(MEMORY[0x1E0D39918]);
    -[IMMessage time](self, "time");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessage messageSubject](self, "messageSubject");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "string");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessage fileTransferGUIDs](self, "fileTransferGUIDs");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = -[IMMessage flags](self, "flags");
    -[IMMessage guid](self, "guid");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = -[IMMessage messageID](self, "messageID");
    objc_msgSend(v3, "loginIMHandle");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "ID");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "uniqueID");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "internalName");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessage subject](self, "subject");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "ID");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessage subject](self, "subject");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "originalID");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessage subject](self, "subject");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "countryCode");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessage balloonBundleID](self, "balloonBundleID");
    v83 = objc_claimAutoreleasedReturnValue();
    -[IMMessage payloadData](self, "payloadData");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessage expressiveSendStyleID](self, "expressiveSendStyleID");
    v81 = objc_claimAutoreleasedReturnValue();
    -[IMMessage timeExpressiveSendPlayed](self, "timeExpressiveSendPlayed");
    v79 = objc_claimAutoreleasedReturnValue();
    -[IMMessage bizIntent](self, "bizIntent");
    v19 = objc_claimAutoreleasedReturnValue();
    -[IMMessage locale](self, "locale");
    v20 = objc_claimAutoreleasedReturnValue();
    -[IMMessage biaReferenceID](self, "biaReferenceID");
    v21 = objc_claimAutoreleasedReturnValue();
    -[IMMessage error](self, "error");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = objc_msgSend(v87, "code");
    -[IMMessage threadIdentifier](self, "threadIdentifier");
    v22 = objc_claimAutoreleasedReturnValue();
    -[IMMessage syndicationRanges](self, "syndicationRanges");
    v23 = objc_claimAutoreleasedReturnValue();
    -[IMMessage syncedSyndicationRanges](self, "syncedSyndicationRanges");
    v24 = objc_claimAutoreleasedReturnValue();
    -[IMMessage dateEdited](self, "dateEdited");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v12;
    v27 = -[IMMessage scheduleType](self, "scheduleType");
    v28 = -[IMMessage scheduleState](self, "scheduleState");
    v68 = v27;
    v29 = v26;
    v65 = v24;
    v66 = v90;
    v30 = (void *)v24;
    v31 = (void *)v23;
    v63 = v23;
    v91 = (void *)v22;
    LODWORD(v61) = v88;
    v32 = (void *)v21;
    v60 = v21;
    v89 = (void *)v20;
    v57 = v19;
    v58 = v20;
    v33 = (void *)v19;
    v34 = (void *)v79;
    v35 = (void *)v83;
    v36 = (void *)v81;
    v37 = (void *)objc_msgSend(v77, "initWithSenderInfo:time:timeRead:timeDelivered:timePlayed:subject:body:bodyData:attributes:fileTransferGUIDs:flags:guid:messageID:account:accountID:service:handle:roomName:unformattedID:countryCode:expireState:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:bizIntent:locale:biaReferenceID:errorType:threadIdentifier:syndicationRanges:syncedSyndicationRanges:partCount:dateEdited:scheduleType:scheduleState:", v29, v108, 0, 0, 0, v102, v109, 0, 0, v105, v75, v107, v73,
                    v101,
                    v106,
                    v104,
                    v100,
                    0,
                    v99,
                    v98,
                    0,
                    v83,
                    v103,
                    v81,
                    v79,
                    v57,
                    v58,
                    v60,
                    v61,
                    v22,
                    v63,
                    v65,
                    v66,
                    v25,
                    v68,
                    v28);

    v38 = v85;
  }

  if (-[IMMessage isReply](self, "isReply"))
  {
    -[IMMessage threadOriginator](self, "threadOriginator");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "_imMessageItem");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setThreadOriginator:", v48);

  }
  -[IMMessage replyCountsByPart](self, "replyCountsByPart");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setReplyCountsByPart:", v49);

  -[IMMessage sender](self, "sender");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMessage subject](self, "subject");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "_updateContextWithSenderHandle:otherHandle:", v50, v51);

  objc_msgSend(v37, "_setInvitation:", -[IMMessage isInvitationMessage](self, "isInvitationMessage"));
  objc_msgSend(v37, "setUseStandalone:", -[IMMessage useStandalone](self, "useStandalone"));
  objc_msgSend(v37, "setShouldNotifyOnSend:", -[IMMessage shouldNotifyOnSend](self, "shouldNotifyOnSend"));
  -[IMMessage messageSummaryInfo](self, "messageSummaryInfo");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setMessageSummaryInfo:", v52);

  objc_msgSend(v37, "setSortID:", -[IMMessage sortID](self, "sortID"));
  -[IMMessage groupActivity](self, "groupActivity");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setGroupActivity:", v53);

  return (IMMessageItem *)v37;
}

+ (id)messageFromIMMessageItemDictionary:(id)a3 body:(id)a4 sender:(id)a5 subject:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  unsigned int v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  objc_class *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v77 = a6;
  v61 = +[IMChatRegistry messageClass](IMChatRegistry, "messageClass");
  objc_msgSend(v9, "objectForKey:", CFSTR("flags"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v12, "unsignedLongLongValue");

  objc_msgSend(v9, "objectForKey:", CFSTR("error"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "unsignedIntValue");

  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("__kIMMessageErrorDomain"), v14, 0);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v75 = 0;
  }
  objc_msgSend(v9, "objectForKey:", CFSTR("subject"));
  v15 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("plainBody"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("bodyData"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("balloonBundleID"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("payloadData"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("expressiveSendStyleID"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("associatedMessageGUID"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    v70 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v15);
  else
    v70 = 0;
  v57 = (void *)v15;
  if (!v10)
  {
    if (objc_msgSend(v78, "length"))
    {
      v17 = objc_alloc(MEMORY[0x1E0CB3498]);
      if (qword_1EE65F5D8 != -1)
        dispatch_once(&qword_1EE65F5D8, &unk_1E471BB40);
      v10 = (id)objc_msgSend(v17, "initWithString:attributes:", v78, qword_1EE65F5D0);
    }
    else if (objc_msgSend(v16, "length"))
    {
      v18 = (void *)MEMORY[0x1A8582D94]();
      JWDecodeCodableObjectWithStandardAllowlist();
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_autoreleasePoolPop(v18);
    }
    else
    {
      v10 = 0;
    }
  }
  v56 = v16;
  objc_msgSend(v9, "objectForKey:", CFSTR("time"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("timeDelivered"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("timeRead"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("timePlayed"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("timeExpressiveSendPlayed"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("associatedMessageRangeLocation"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v24, "integerValue");

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("associatedMessageRangeLength"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v25, "integerValue");

  objc_msgSend(v9, "objectForKey:", CFSTR("associatedMessageEmoji"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("threadIdentifier"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("dateEdited"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("scheduleType"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("scheduleState"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v26 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v23, "doubleValue");
    objc_msgSend(v26, "dateWithTimeIntervalSinceReferenceDate:");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v64 = 0;
  }
  if (v67)
  {
    v27 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v67, "doubleValue");
    objc_msgSend(v27, "dateWithTimeIntervalSinceReferenceDate:");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v63 = 0;
  }
  v49 = [v61 alloc];
  if (v19)
  {
    v28 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v19, "doubleValue");
    objc_msgSend(v28, "dateWithTimeIntervalSinceReferenceDate:");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
      goto LABEL_23;
LABEL_26:
    v60 = 0;
    if (v20)
      goto LABEL_24;
    goto LABEL_27;
  }
  v62 = 0;
  if (!v21)
    goto LABEL_26;
LABEL_23:
  v29 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v21, "doubleValue");
  objc_msgSend(v29, "dateWithTimeIntervalSinceReferenceDate:");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
LABEL_24:
    v30 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v20, "doubleValue");
    objc_msgSend(v30, "dateWithTimeIntervalSinceReferenceDate:");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
LABEL_27:
  v59 = 0;
LABEL_28:
  v58 = v11;
  v76 = v10;
  v54 = v20;
  v52 = v23;
  v53 = v21;
  v48 = v22;
  if (v22)
  {
    v31 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v22, "doubleValue");
    objc_msgSend(v31, "dateWithTimeIntervalSinceReferenceDate:");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v32 = 0;
  }
  objc_msgSend(v9, "objectForKey:", CFSTR("fileTransferGUIDs"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("guid"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("messageID"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "longLongValue");
  objc_msgSend(v9, "objectForKey:", CFSTR("associatedMessageType"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "longLongValue");
  objc_msgSend(v9, "objectForKey:", CFSTR("messageSummaryInfo"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)objc_msgSend(v49, "_initWithSender:time:timeRead:timeDelivered:timePlayed:plainText:text:messageSubject:fileTransferGUIDs:flags:error:guid:messageID:subject:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:associatedMessageGUID:associatedMessageType:associatedMessageRange:associatedMessageEmoji:messageSummaryInfo:threadIdentifier:dateEdited:scheduleType:scheduleState:", v58, v62, v60, v59, v32, v78, v76, v70, v33, v55, v75, v34, v36, v77,
                  v74,
                  v73,
                  v72,
                  v64,
                  v71,
                  v38,
                  v51,
                  v50,
                  v69,
                  v39,
                  v68,
                  v63,
                  objc_msgSend(v66, "unsignedIntegerValue"),
                  objc_msgSend(v65, "unsignedIntegerValue"));

  if (v48)
  if (v54)

  if (v53)
  if (v19)

  if (objc_msgSend(v40, "isEmote"))
    v41 = v55 | 2;
  else
    v41 = v55;
  if (objc_msgSend(v40, "isEmpty"))
    v41 |= 8uLL;
  if (objc_msgSend(v40, "hasMention"))
    v41 |= 0x20000000uLL;
  if (objc_msgSend(v40, "isAddressedToMe"))
    v42 = v41 | 0x800;
  else
    v42 = v41;
  objc_msgSend(v40, "_updateFlags:", v42);
  objc_msgSend(v9, "objectForKey:", CFSTR("threadOriginator"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMMessage messageFromIMMessageItemDictionary:body:sender:subject:](IMMessage, "messageFromIMMessageItemDictionary:body:sender:subject:", v43, 0, 0, 0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setThreadOriginator:", v44);
  objc_msgSend(v9, "objectForKey:", CFSTR("syndicationRanges"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "_syndicationRanges:", v45);

  objc_msgSend(v9, "objectForKey:", CFSTR("syncedSyndicationRanges"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "_syncedSyndicationRanges:", v46);

  return v40;
}

- (id)messagesBySeparatingRichLinks
{
  NSObject *v3;
  IMMessage *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  IMMessage *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  IMMessage *v26;
  void *v27;
  void *v28;
  void *v29;
  IMMessage *v31;
  void *v32;
  _QWORD v33[4];
  IMMessage *v34;
  uint64_t *v35;
  _QWORD *v36;
  _QWORD *v37;
  _QWORD *v38;
  uint64_t *v39;
  _BYTE *v40;
  _QWORD v41[5];
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  _QWORD v49[3];
  char v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  char v54;
  _QWORD v55[5];
  id v56;
  _BYTE buf[24];
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  _QWORD v61[4];

  v61[1] = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "Separate rich links", buf, 2u);
    }

  }
  v4 = self;
  -[IMMessage payloadData](v4, "payloadData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length") != 0;

  -[IMMessage fileTransferGUIDs](v4, "fileTransferGUIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count") != 0;

  if (v6 && v8)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        -[IMMessage payloadData](v4, "payloadData");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "length");
        -[IMMessage fileTransferGUIDs](v4, "fileTransferGUIDs");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "count");
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = v11;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v13;
        _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_INFO, "Not splitting message, payloadData.length: %lu, transfers.count: %lu", buf, 0x16u);

      }
    }
    v61[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 1);
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v58 = sub_1A200AE54;
    v59 = sub_1A200AC9C;
    v60 = 0;
    v55[0] = 0;
    v55[1] = v55;
    v55[2] = 0x3032000000;
    v55[3] = sub_1A200AE54;
    v55[4] = sub_1A200AC9C;
    v56 = 0;
    -[IMMessage guid](v4, "guid");
    v56 = (id)objc_claimAutoreleasedReturnValue();
    v51 = 0;
    v52 = &v51;
    v53 = 0x2020000000;
    v54 = 0;
    v49[0] = 0;
    v49[1] = v49;
    v49[2] = 0x2020000000;
    v50 = 1;
    v43 = 0;
    v44 = &v43;
    v45 = 0x3032000000;
    v46 = sub_1A200AE54;
    v47 = sub_1A200AC9C;
    v48 = 0;
    -[IMMessage text](v4, "text");
    v48 = (id)objc_claimAutoreleasedReturnValue();
    v41[0] = 0;
    v41[1] = v41;
    v41[2] = 0x3032000000;
    v41[3] = sub_1A200AE54;
    v41[4] = sub_1A200AC9C;
    v42 = 0;
    -[IMMessage text](v4, "text");
    v42 = (id)objc_claimAutoreleasedReturnValue();
    v15 = sub_1A2122334((void *)v44[5]);
    v16 = (void *)v44[5];
    v44[5] = (uint64_t)v15;

    v17 = (void *)v44[5];
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = sub_1A20E13EC;
    v33[3] = &unk_1E4721840;
    v35 = &v43;
    v36 = v41;
    v37 = v55;
    v18 = v4;
    v34 = v18;
    v38 = v49;
    v39 = &v51;
    v40 = buf;
    IMRichLinkUtilitiesEnumerateRichLinksInAttributedString(v17, 1, v33);
    if (*((_BYTE *)v52 + 24))
    {
      v31 = [IMMessage alloc];
      -[IMMessage sender](v18, "sender");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMMessage time](v18, "time");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMMessage messageSubject](v18, "messageSubject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[IMMessage flags](v18, "flags");
      -[IMMessage guid](v18, "guid");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMMessage subject](v18, "subject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMMessage expressiveSendStyleID](v18, "expressiveSendStyleID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMMessage threadIdentifier](v18, "threadIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[IMMessage initWithSender:time:text:messageSubject:fileTransferGUIDs:flags:error:guid:subject:balloonBundleID:payloadData:expressiveSendStyleID:threadIdentifier:scheduleType:scheduleState:](v31, "initWithSender:time:text:messageSubject:fileTransferGUIDs:flags:error:guid:subject:balloonBundleID:payloadData:expressiveSendStyleID:threadIdentifier:scheduleType:scheduleState:", v32, v19, v20, 0, 0, v21, 0, v22, v23, 0, 0, v24, v25, -[IMMessage scheduleType](v18, "scheduleType"), -[IMMessage scheduleState](v18, "scheduleState"));

      -[IMMessage associatedBalloonBundleID](v18, "associatedBalloonBundleID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMMessage setAssociatedBalloonBundleID:](v26, "setAssociatedBalloonBundleID:", v27);

      -[IMMessage sourceApplicationID](v18, "sourceApplicationID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMMessage setSourceApplicationID:](v26, "setSourceApplicationID:", v28);

      if (-[IMMessage isReply](v26, "isReply"))
      {
        -[IMMessage threadOriginator](v18, "threadOriginator");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMMessage setThreadOriginator:](v26, "setThreadOriginator:", v29);

      }
      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "insertObject:atIndex:", v26, 0);

    }
    v14 = *(id *)(*(_QWORD *)&buf[8] + 40);

    _Block_object_dispose(v41, 8);
    _Block_object_dispose(&v43, 8);

    _Block_object_dispose(v49, 8);
    _Block_object_dispose(&v51, 8);
    _Block_object_dispose(v55, 8);

    _Block_object_dispose(buf, 8);
  }

  return v14;
}

- (id)messagesSeparatedByByteLength:(int64_t)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  IMMessage *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  IMMessage *v19;
  NSObject *v20;
  void *v22;
  id obj;
  id v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  int64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v34 = a3;
      _os_log_impl(&dword_1A1FF4000, v4, OS_LOG_TYPE_INFO, "Separating message by byte length: %ld", buf, 0xCu);
    }

  }
  -[IMMessage text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "string");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "__im_separateStringByByteLength:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v6;
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v26)
  {
    v25 = *(_QWORD *)v29;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v29 != v25)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v7);
        objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringByTrimmingCharactersInSet:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v10, "length"))
        {
          v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v8);
          objc_msgSend(v11, "__im_attributedStringByAssigningMessagePartNumbers");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = [IMMessage alloc];
          -[IMMessage sender](self, "sender");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMMessage time](self, "time");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = -[IMMessage flags](self, "flags");
          StringGUID();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMMessage subject](self, "subject");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = -[IMMessage initWithSender:time:text:messageSubject:fileTransferGUIDs:flags:error:guid:subject:balloonBundleID:payloadData:expressiveSendStyleID:threadIdentifier:](v13, "initWithSender:time:text:messageSubject:fileTransferGUIDs:flags:error:guid:subject:balloonBundleID:payloadData:expressiveSendStyleID:threadIdentifier:", v14, v15, v12, 0, 0, v16, 0, v17, v18, 0, 0, 0, 0);

          objc_msgSend(v24, "addObject:", v19);
        }
        else if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A1FF4000, v20, OS_LOG_TYPE_INFO, "Dropping empty message", buf, 2u);
          }

        }
        ++v7;
      }
      while (v26 != v7);
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v26);
  }

  return v24;
}

- (NSArray)messageParts
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  -[IMMessage text](self, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if (-[NSString length](self->_plainBody, "length"))
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", self->_plainBody);
    else
      v3 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1A20E221C;
  v8[3] = &unk_1E4721868;
  v9 = v4;
  v5 = v4;
  objc_msgSend(v3, "__im_visitMessageParts:", v8);
  v6 = (void *)objc_msgSend(v5, "copy");

  return (NSArray *)v6;
}

- (id)messagePartMatchingPartIndex:(int64_t)a3
{
  void *v5;
  void *v6;

  -[IMMessage text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if (-[NSString length](self->_plainBody, "length"))
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", self->_plainBody);
    else
      v5 = 0;
  }
  objc_msgSend(v5, "__im_messagePartMatchingPartIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  IMMessage *v6;
  IMMessage *v7;
  unint64_t flags;
  int64_t messageID;
  NSString *guid;
  NSString *v11;
  NSString *v12;
  unsigned __int8 v13;
  IMHandle *sender;
  IMHandle *v15;
  IMHandle *subject;
  IMHandle *v17;
  NSDate *time;
  NSDate *v19;
  NSDate *timeRead;
  NSDate *v21;
  uint64_t v22;
  NSDate *v23;
  NSDate *v24;
  NSDate *timeDelivered;
  NSDate *v26;
  NSDate *timePlayed;
  NSDate *v28;
  uint64_t v29;
  NSDate *v30;
  void *v31;
  NSAttributedString *text;
  NSAttributedString *v33;
  void *v34;
  NSAttributedString *messageSubject;
  NSAttributedString *v36;
  NSDate *v37;
  NSDate *v38;
  NSArray *fileTransferGUIDs;
  NSArray *v40;
  NSArray *v41;
  void *v42;
  NSInteger v43;
  void *v44;
  NSAttributedString *v45;
  NSAttributedString *v46;
  void *v47;
  NSDate *v48;
  NSDate *v49;
  void *v51;
  void *v52;
  NSArray *v53;
  void *v54;
  void *v55;
  NSAttributedString *v56;
  NSAttributedString *v57;
  NSAttributedString *v58;
  NSAttributedString *v59;
  void *v60;
  NSDate *v61;
  NSDate *v62;
  NSDate *v63;
  NSDate *v64;
  void *v65;
  NSDate *v66;
  NSDate *v67;
  NSDate *v68;
  NSDate *v69;
  NSDate *v70;
  IMHandle *v71;
  objc_super v72;

  v6 = (IMMessage *)a3;
  if (v6 == self)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      flags = self->_flags;
      if (flags != -[IMMessage flags](v7, "flags")
        || (messageID = self->_messageID, messageID != -[IMMessage messageID](v7, "messageID")))
      {
        v13 = 0;
LABEL_94:

        goto LABEL_95;
      }
      guid = self->_guid;
      -[IMMessage guid](v7, "guid");
      v11 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (guid != v11)
      {
        v12 = self->_guid;
        -[IMMessage guid](v7, "guid");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[NSString isEqualToString:](v12, "isEqualToString:", v3))
        {
          v13 = 0;
          goto LABEL_92;
        }
      }
      sender = self->_sender;
      -[IMMessage sender](v7, "sender");
      v15 = (IMHandle *)objc_claimAutoreleasedReturnValue();
      if (sender != v15)
      {
        v13 = 0;
LABEL_13:

        goto LABEL_91;
      }
      subject = self->_subject;
      -[IMMessage subject](v7, "subject");
      v17 = (IMHandle *)objc_claimAutoreleasedReturnValue();
      if (subject != v17)
      {

LABEL_90:
        v13 = 0;
        goto LABEL_91;
      }
      v71 = subject;
      time = self->_time;
      -[IMMessage time](v7, "time");
      v69 = time;
      v70 = (NSDate *)objc_claimAutoreleasedReturnValue();
      if (time != v70)
      {
        v19 = self->_time;
        -[IMMessage time](v7, "time");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[NSDate isEqualToDate:](v19, "isEqualToDate:", v4))
        {

LABEL_89:
          goto LABEL_90;
        }
        v65 = v4;
      }
      timeRead = self->_timeRead;
      -[IMMessage timeRead](v7, "timeRead");
      v67 = timeRead;
      v68 = (NSDate *)objc_claimAutoreleasedReturnValue();
      if (timeRead != v68)
      {
        v21 = self->_timeRead;
        -[IMMessage timeRead](v7, "timeRead");
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = v21;
        timeRead = (NSDate *)v22;
        if (!-[NSDate isEqualToDate:](v23, "isEqualToDate:", v22))
        {

          v24 = v70;
          if (v69 != v70)

          goto LABEL_88;
        }
      }
      v63 = timeRead;
      timeDelivered = self->_timeDelivered;
      -[IMMessage timeDelivered](v7, "timeDelivered");
      v66 = (NSDate *)objc_claimAutoreleasedReturnValue();
      v64 = timeDelivered;
      if (timeDelivered != v66)
      {
        v26 = self->_timeDelivered;
        -[IMMessage timeDelivered](v7, "timeDelivered");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[NSDate isEqualToDate:](v26, "isEqualToDate:", v4))
        {

          v24 = v70;
          if (v67 == v68)
          {

          }
          else
          {

          }
          v42 = v65;
          if (v69 == v70)
            goto LABEL_88;
          goto LABEL_54;
        }
      }
      timePlayed = self->_timePlayed;
      -[IMMessage timePlayed](v7, "timePlayed");
      v61 = timePlayed;
      v62 = (NSDate *)objc_claimAutoreleasedReturnValue();
      v60 = v4;
      if (timePlayed != v62)
      {
        v28 = self->_timePlayed;
        -[IMMessage timePlayed](v7, "timePlayed");
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = v28;
        v31 = (void *)v29;
        if (!-[NSDate isEqualToDate:](v30, "isEqualToDate:", v29))
        {

          v24 = v70;
          if (v64 == v66)
          {

          }
          else
          {

          }
          v42 = v65;
          if (v67 != v68)

          if (v69 == v70)
            goto LABEL_88;
LABEL_54:

LABEL_88:
          goto LABEL_89;
        }
        v55 = v31;
      }
      text = self->_text;
      -[IMMessage text](v7, "text");
      v59 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
      v57 = text;
      if (text != v59)
      {
        v33 = self->_text;
        -[IMMessage text](v7, "text");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[NSAttributedString isEqualToAttributedString:](v33, "isEqualToAttributedString:", v34))
        {

          v24 = v70;
          if (v61 == v62)
          {

          }
          else
          {

          }
          v47 = v65;
          v48 = v69;
          if (v64 == v66)
          {

          }
          else
          {

            v47 = v65;
            v48 = v69;
          }
          if (v67 != v68)

          if (v48 != v70)
          goto LABEL_88;
        }
        v52 = v34;
      }
      messageSubject = self->_messageSubject;
      -[IMMessage messageSubject](v7, "messageSubject");
      v58 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
      v56 = messageSubject;
      if (messageSubject == v58
        || (v36 = self->_messageSubject,
            -[IMMessage messageSubject](v7, "messageSubject"),
            v54 = (void *)objc_claimAutoreleasedReturnValue(),
            -[NSAttributedString isEqualToAttributedString:](v36, "isEqualToAttributedString:")))
      {
        fileTransferGUIDs = self->_fileTransferGUIDs;
        -[IMMessage fileTransferGUIDs](v7, "fileTransferGUIDs");
        v40 = (NSArray *)objc_claimAutoreleasedReturnValue();
        v53 = fileTransferGUIDs;
        if (fileTransferGUIDs == v40
          || (v41 = self->_fileTransferGUIDs,
              -[IMMessage fileTransferGUIDs](v7, "fileTransferGUIDs"),
              v51 = (void *)objc_claimAutoreleasedReturnValue(),
              -[NSArray isEqualToArray:](v41, "isEqualToArray:")))
        {
          v43 = -[NSError code](self->_error, "code");
          -[IMMessage error](v7, "error");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v43 == objc_msgSend(v44, "code");

          if (v53 == v40)
          {

            if (v56 != v58)
            if (v57 != v59)

            if (v61 != v62)
            v49 = v66;
            if (v64 != v66)
            {

              v49 = v66;
            }

            if (v67 != v68)
            if (v69 != v70)

            goto LABEL_13;
          }
        }
        else
        {
          v13 = 0;
        }
        v37 = v70;

        v38 = v62;
        if (v56 == v58)
        {

          v46 = v57;
          v45 = v59;
          goto LABEL_56;
        }
      }
      else
      {
        v13 = 0;
        v37 = v70;
        v38 = v62;
      }
      v45 = v59;

      v46 = v57;
LABEL_56:
      if (v46 != v45)

      if (v61 != v38)
      if (v64 != v66)

      if (v67 != v68)
      if (v69 != v37)

LABEL_91:
      if (guid == v11)
      {
LABEL_93:

        goto LABEL_94;
      }
LABEL_92:

      goto LABEL_93;
    }
    v72.receiver = self;
    v72.super_class = (Class)IMMessage;
    v13 = -[IMMessage isEqual:](&v72, sel_isEqual_, v6);
  }
LABEL_95:

  return v13;
}

- (id)description
{
  objc_class *v3;
  void (*v4)(void);
  void (*v5)(void);
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  uint64_t v26;
  uint64_t v27;
  NSDictionary *replyCountsByPart;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  const __CFString *v36;
  void *v38;
  void *v39;
  int64_t v40;
  __int128 v41;
  __int128 v42;
  void *v43;
  const __CFString *v44;
  const __CFString *v45;
  void *v46;
  const __CFString *v47;
  void *v48;
  const __CFString *v49;
  void *v50;
  const __CFString *v51;
  const __CFString *v52;
  const __CFString *v53;
  const __CFString *v54;
  void *v55;
  const __CFString *v56;
  void *v57;
  const __CFString *v58;
  const __CFString *v59;
  NSString *guid;
  int64_t messageID;
  unint64_t flags;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;

  if (qword_1EE65F328 != -1)
    dispatch_once(&qword_1EE65F328, &unk_1E471D898);
  v65 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMHandle ID](self->_sender, "ID");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMHandle ID](self->_subject, "ID");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMHandle account](self->_sender, "account");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "uniqueID");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMHandle account](self->_sender, "account");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "service");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "internalName");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  flags = self->_flags;
  v4 = (void (*)(void))off_1EE65F320;
  -[NSAttributedString string](self->_messageSubject, "string");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v4();
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void (*)(void))off_1EE65F320;
  -[NSAttributedString string](self->_text, "string");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v5();
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  messageID = self->_messageID;
  guid = self->_guid;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[IMMessage _imMessageItem](self, "_imMessageItem");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v63, "sortID"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate timeIntervalSinceReferenceDate](self->_time, "timeIntervalSinceReferenceDate");
  v8 = v7;
  -[NSDate timeIntervalSinceReferenceDate](self->_timeDelivered, "timeIntervalSinceReferenceDate");
  v10 = v9;
  -[NSDate timeIntervalSinceReferenceDate](self->_timeRead, "timeIntervalSinceReferenceDate");
  v12 = v11;
  -[NSDate timeIntervalSinceReferenceDate](self->_timePlayed, "timeIntervalSinceReferenceDate");
  v14 = v13;
  if (-[IMMessage isEmpty](self, "isEmpty"))
    v15 = CFSTR("YES");
  else
    v15 = CFSTR("NO");
  v59 = v15;
  if (-[IMMessage isFinished](self, "isFinished"))
    v16 = CFSTR("YES");
  else
    v16 = CFSTR("NO");
  v58 = v16;
  if (-[IMMessage isSent](self, "isSent"))
    v17 = CFSTR("YES");
  else
    v17 = CFSTR("NO");
  v56 = v17;
  if (-[IMMessage isRead](self, "isRead"))
    v18 = CFSTR("YES");
  else
    v18 = CFSTR("NO");
  v54 = v18;
  if (-[IMMessage isDelivered](self, "isDelivered"))
    v19 = CFSTR("YES");
  else
    v19 = CFSTR("NO");
  v53 = v19;
  if (-[IMMessage isAudioMessage](self, "isAudioMessage"))
    v20 = CFSTR("YES");
  else
    v20 = CFSTR("NO");
  v52 = v20;
  if (-[IMMessage isPlayed](self, "isPlayed"))
    v21 = CFSTR("YES");
  else
    v21 = CFSTR("NO");
  v51 = v21;
  if (-[IMMessage isFromMe](self, "isFromMe"))
    v22 = CFSTR("YES");
  else
    v22 = CFSTR("NO");
  v44 = v22;
  if (-[IMMessage isEmote](self, "isEmote"))
    v23 = CFSTR("YES");
  else
    v23 = CFSTR("NO");
  v49 = v23;
  if (-[IMMessage hasDataDetectorResults](self, "hasDataDetectorResults"))
    v24 = CFSTR("YES");
  else
    v24 = CFSTR("NO");
  v47 = v24;
  if (-[IMMessage wasDataDetected](self, "wasDataDetected"))
    v25 = CFSTR("YES");
  else
    v25 = CFSTR("NO");
  v45 = v25;
  -[IMMessage error](self, "error");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMessage associatedMessageGUID](self, "associatedMessageGUID");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = -[IMMessage associatedMessageType](self, "associatedMessageType");
  -[IMMessage associatedMessageEmoji](self, "associatedMessageEmoji");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMessage balloonBundleID](self, "balloonBundleID");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMessage expressiveSendStyleID](self, "expressiveSendStyleID");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMessage timeExpressiveSendPlayed](self, "timeExpressiveSendPlayed");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "timeIntervalSinceReferenceDate");
  v27 = v26;
  v41 = *(_OWORD *)&self->_threadIdentifier;
  v42 = *(_OWORD *)&self->_bizIntent;
  replyCountsByPart = self->_replyCountsByPart;
  -[NSArray componentsJoinedByString:](self->_syndicationRanges, "componentsJoinedByString:", CFSTR(","));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray componentsJoinedByString:](self->_syncedSyndicationRanges, "componentsJoinedByString:", CFSTR(","));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate timeIntervalSinceReferenceDate](self->_dateEdited, "timeIntervalSinceReferenceDate");
  v32 = v31;
  if (-[IMMessage wasDetonated](self, "wasDetonated"))
    v33 = CFSTR("YES");
  else
    v33 = CFSTR("NO");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_scheduleType);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_scheduleState);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[IMMessage isPendingSatelliteSend](self, "isPendingSatelliteSend"))
    v36 = CFSTR("YES");
  else
    v36 = CFSTR("NO");
  objc_msgSend(v65, "stringWithFormat:", CFSTR("%@[from=%@; msg-subject=%@; account:%@; service=%@; flags=%x; subject='%@' text='%@' messageID: %lld GUID:'%@' sortID: %@ date:'%f' date-delivered:'%f' date-read:'%f' date-played:'%f' empty: %@ finished: %@ sent: %@ read: %@ delivered: %@ audio: %@ played: %@ from-me: %@ emote: %@ dd-results: %@ dd-scanned: %@ error: %@ associatedMessageGUID: %@ associatedMessageType: %lld associatedMessageEmoji: %@ balloonBundleID: %@ expressiveSendStyleID: %@ timeExpressiveSendStylePlayed: %f bizIntent:%@ locale:%@ threadIdentifier: %@, threadOriginator: %@, replyCountsByPart: %@, syndicationRanges: %@, syncedSyndicationRanges: %@, dateEdited:'%f', wasDetonated: %@, scheduleType: %@, scheduleState: %@, pendingSatelliteSend: %@]"),
    v76,
    v75,
    v74,
    v73,
    v72,
    flags,
    v71,
    v57,
    messageID,
    guid,
    v55,
    v8,
    v10,
    v12,
    v14,
    v59,
    v58,
    v56,
    v54,
    v53,
    v52,
    v51,
    v44,
    v49,
    v47,
    v45,
    v39,
    v48,
    v40,
    v46,
    v43,
    v38,
    v27,
    v42,
    v41,
    replyCountsByPart,
    v29,
    v30,
    v32,
    v33,
    v34,
    v35,
    v36);
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  return v66;
}

- (NSAttributedString)messageSubject
{
  return self->_messageSubject;
}

- (NSDate)time
{
  return self->_time;
}

- (void)_updateTime:(id)a3
{
  objc_storeStrong((id *)&self->_time, a3);
}

- (void)_updateText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
}

- (NSString)guid
{
  return self->_guid;
}

- (void)_updateGUID:(id)a3
{
  objc_storeStrong((id *)&self->_guid, a3);
}

- (int64_t)messageID
{
  return self->_messageID;
}

- (void)_updateMessageID:(int64_t)a3
{
  self->_messageID = a3;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)_updateError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (BOOL)isInvitationMessage
{
  return self->_isInvitationMessage;
}

- (void)setIsInvitationMessage:(BOOL)a3
{
  self->_isInvitationMessage = a3;
}

- (NSArray)fileTransferGUIDs
{
  return self->_fileTransferGUIDs;
}

- (void)_updateFileTransferGUIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSDate)timeDelivered
{
  return self->_timeDelivered;
}

- (void)_updateTimeDelivered:(id)a3
{
  objc_storeStrong((id *)&self->_timeDelivered, a3);
}

- (NSDate)timeRead
{
  return self->_timeRead;
}

- (void)_updateTimeRead:(id)a3
{
  objc_storeStrong((id *)&self->_timeRead, a3);
}

- (NSDate)timePlayed
{
  return self->_timePlayed;
}

- (void)_updateTimePlayed:(id)a3
{
  objc_storeStrong((id *)&self->_timePlayed, a3);
}

- (NSString)associatedMessageGUID
{
  return self->_associatedMessageGUID;
}

- (void)_associatedMessageGUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void)_associatedMessageType:(int64_t)a3
{
  self->_associatedMessageType = a3;
}

- (_NSRange)associatedMessageRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_associatedMessageRange.length;
  location = self->_associatedMessageRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)_associatedMessageRange:(_NSRange)a3
{
  self->_associatedMessageRange = a3;
}

- (NSString)associatedMessageEmoji
{
  return self->_associatedMessageEmoji;
}

- (void)_associatedMessageEmoji:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void)_messageSummaryInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSDictionary)bizIntent
{
  return self->_bizIntent;
}

- (void)_updateBizIntent:(id)a3
{
  objc_storeStrong((id *)&self->_bizIntent, a3);
}

- (NSString)locale
{
  return self->_locale;
}

- (void)_updateLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (NSString)threadIdentifier
{
  return self->_threadIdentifier;
}

- (void)setThreadIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (IMMessage)threadOriginator
{
  return self->_threadOriginator;
}

- (NSDictionary)replyCountsByPart
{
  return self->_replyCountsByPart;
}

- (void)setReplyCountsByPart:(id)a3
{
  objc_storeStrong((id *)&self->_replyCountsByPart, a3);
}

- (NSArray)syndicationRanges
{
  return self->_syndicationRanges;
}

- (NSArray)syncedSyndicationRanges
{
  return self->_syncedSyndicationRanges;
}

- (NSDate)dateEdited
{
  return self->_dateEdited;
}

- (void)_updatedDateEdited:(id)a3
{
  objc_storeStrong((id *)&self->_dateEdited, a3);
}

- (void)setPlainBody:(id)a3
{
  objc_storeStrong((id *)&self->_plainBody, a3);
}

- (void)setBalloonBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_balloonBundleID, a3);
}

- (NSData)payloadData
{
  return self->_payloadData;
}

- (void)setPayloadData:(id)a3
{
  objc_storeStrong((id *)&self->_payloadData, a3);
}

- (NSString)associatedBalloonBundleID
{
  return self->_associatedBalloonBundleID;
}

- (NSString)sourceApplicationID
{
  return self->_sourceApplicationID;
}

- (void)setExpressiveSendStyleID:(id)a3
{
  objc_storeStrong((id *)&self->_expressiveSendStyleID, a3);
}

- (NSDate)timeExpressiveSendPlayed
{
  return self->_timeExpressiveSendPlayed;
}

- (void)setTimeExpressiveSendPlayed:(id)a3
{
  objc_storeStrong((id *)&self->_timeExpressiveSendPlayed, a3);
}

- (void)setHasMention:(BOOL)a3
{
  self->_hasMention = a3;
}

- (NSData)customTypingIndicatorIcon
{
  return self->_customTypingIndicatorIcon;
}

- (void)setCustomTypingIndicatorIcon:(id)a3
{
  objc_storeStrong((id *)&self->_customTypingIndicatorIcon, a3);
}

- (NSString)notificationIDSTokenURI
{
  return self->_notificationIDSTokenURI;
}

- (void)setNotificationIDSTokenURI:(id)a3
{
  objc_storeStrong((id *)&self->_notificationIDSTokenURI, a3);
}

- (BOOL)useStandalone
{
  return self->_useStandalone;
}

- (void)setUseStandalone:(BOOL)a3
{
  self->_useStandalone = a3;
}

- (BOOL)shouldNotifyOnSend
{
  return self->_shouldNotifyOnSend;
}

- (void)setShouldNotifyOnSend:(BOOL)a3
{
  self->_shouldNotifyOnSend = a3;
}

- (unint64_t)scheduleType
{
  return self->_scheduleType;
}

- (void)setScheduleType:(unint64_t)a3
{
  self->_scheduleType = a3;
}

- (unint64_t)scheduleState
{
  return self->_scheduleState;
}

- (void)setScheduleState:(unint64_t)a3
{
  self->_scheduleState = a3;
}

- (NSString)biaReferenceID
{
  return self->_biaReferenceID;
}

- (TUConversationActivity)groupActivity
{
  return self->_groupActivity;
}

- (void)setGroupActivity:(id)a3
{
  objc_storeStrong((id *)&self->_groupActivity, a3);
}

- (unint64_t)sortID
{
  return self->_sortID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupActivity, 0);
  objc_storeStrong((id *)&self->_biaReferenceID, 0);
  objc_storeStrong((id *)&self->_notificationIDSTokenURI, 0);
  objc_storeStrong((id *)&self->_customTypingIndicatorIcon, 0);
  objc_storeStrong((id *)&self->_timeExpressiveSendPlayed, 0);
  objc_storeStrong((id *)&self->_expressiveSendStyleID, 0);
  objc_storeStrong((id *)&self->_sourceApplicationID, 0);
  objc_storeStrong((id *)&self->_associatedBalloonBundleID, 0);
  objc_storeStrong((id *)&self->_payloadData, 0);
  objc_storeStrong((id *)&self->_balloonBundleID, 0);
  objc_storeStrong((id *)&self->_plainBody, 0);
  objc_storeStrong((id *)&self->_dateEdited, 0);
  objc_storeStrong((id *)&self->_syncedSyndicationRanges, 0);
  objc_storeStrong((id *)&self->_syndicationRanges, 0);
  objc_storeStrong((id *)&self->_replyCountsByPart, 0);
  objc_storeStrong((id *)&self->_threadOriginator, 0);
  objc_storeStrong((id *)&self->_threadIdentifier, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_bizIntent, 0);
  objc_storeStrong((id *)&self->_messageSummaryInfo, 0);
  objc_storeStrong((id *)&self->_associatedMessageEmoji, 0);
  objc_storeStrong((id *)&self->_associatedMessageGUID, 0);
  objc_storeStrong((id *)&self->_timePlayed, 0);
  objc_storeStrong((id *)&self->_timeRead, 0);
  objc_storeStrong((id *)&self->_timeDelivered, 0);
  objc_storeStrong((id *)&self->_fileTransferGUIDs, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_guid, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_messageSubject, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_sender, 0);
}

- (BOOL)isRichLinkMessage
{
  void *v2;
  void *v3;
  char v4;

  -[IMMessage _imMessageItem](self, "_imMessageItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "balloonBundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPrefix:", *MEMORY[0x1E0D375F8]);

  return v4;
}

- (id)richLinkDataSourceWithChatContext:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint8_t v13[16];

  v4 = a3;
  -[IMMessage _imMessageItem](self, "_imMessageItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[IMMessagePartChatItem _newMessagePartsForMessageItem:chatContext:](IMMessagePartChatItem, "_newMessagePartsForMessageItem:chatContext:", v5, v4);
  -[IMMessage _transcriptPluginChatItemFromTypeErasedPartChatItems:](self, "_transcriptPluginChatItemFromTypeErasedPartChatItems:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "containsString:", *MEMORY[0x1E0D375F8]))
  {
    objc_msgSend(v7, "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "Attempting to access rich link metadata from non-rich link plugin payload. Returning nil.", v13, 2u);
      }

    }
    v10 = 0;
  }

  return v10;
}

- (id)_transcriptPluginChatItemFromTypeErasedPartChatItems:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v3;
      if (objc_msgSend(v5, "count") == 1
        && (objc_msgSend(v5, "firstObject"),
            v6 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_opt_class(),
            isKindOfClass = objc_opt_isKindOfClass(),
            v6,
            (isKindOfClass & 1) != 0))
      {
        objc_msgSend(v5, "firstObject");
        v4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v4 = 0;
      }

    }
    else
    {
      v4 = 0;
    }
  }

  return v4;
}

+ (id)_vCardDataWithCLLocation:(id)a3
{
  return (id)IMVCardDataFromLocation();
}

+ (IMMessage)messageWithLocation:(id)a3 flags:(unint64_t)a4 error:(id)a5 guid:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;

  v10 = a5;
  v11 = a6;
  objc_msgSend(a1, "_vCardDataWithCLLocation:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "im_randomTemporaryFileURLWithFileName:", CFSTR("CL.loc.vcf"));
    v14 = objc_claimAutoreleasedReturnValue();

    v29 = (void *)v14;
    objc_msgSend(v12, "writeToURL:atomically:", v14, 1);
    +[IMFileTransferCenter sharedInstance](IMFileTransferCenter, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "createNewOutgoingTransferWithLocalFileURL:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_alloc(MEMORY[0x1E0C99D80]);
    v28 = (void *)objc_msgSend(v17, "initWithObjectsAndKeys:", v16, *MEMORY[0x1E0D36430], 0);
    v18 = objc_alloc(MEMORY[0x1E0CB3498]);
    v19 = (void *)objc_msgSend(v18, "initWithString:attributes:", *MEMORY[0x1E0D362F8], v28);
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v16, 0);
    objc_msgSend(v19, "__im_attributedStringByAssigningMessagePartNumbers");
    v21 = v10;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_alloc((Class)a1);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v24 = v11;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v23, "_initWithSender:time:timeRead:timeDelivered:timePlayed:plainText:text:messageSubject:fileTransferGUIDs:flags:error:guid:messageID:subject:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:associatedMessageGUID:associatedMessageType:associatedMessageRange:associatedMessageEmoji:messageSummaryInfo:threadIdentifier:dateEdited:scheduleType:scheduleState:", 0, v25, 0, 0, 0, 0, v22, 0, v20, a4, v21, v24, 0, 0,
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

    v11 = v24;
    v10 = v21;

  }
  else
  {
    v26 = 0;
  }

  return (IMMessage *)v26;
}

+ (id)textMessageWithLocation:(id)a3 flags:(unint64_t)a4 error:(id)a5 guid:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;

  v9 = a5;
  v10 = a6;
  IMCurrentLocationURLFromLocation();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v11);
    objc_msgSend(v12, "__im_attributedStringByAssigningMessagePartNumbers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc((Class)a1);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "_initWithSender:time:timeRead:timeDelivered:timePlayed:plainText:text:messageSubject:fileTransferGUIDs:flags:error:guid:messageID:subject:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:associatedMessageGUID:associatedMessageType:associatedMessageRange:associatedMessageEmoji:messageSummaryInfo:threadIdentifier:dateEdited:scheduleType:scheduleState:", 0, v15, 0, 0, 0, 0, v13, 0, 0, a4, v9, v10, 0, 0,
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

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)locatingMessageWithGuid:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "_initWithSender:time:timeRead:timeDelivered:timePlayed:plainText:text:messageSubject:fileTransferGUIDs:flags:error:guid:messageID:subject:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:associatedMessageGUID:associatedMessageType:associatedMessageRange:associatedMessageEmoji:messageSummaryInfo:threadIdentifier:dateEdited:scheduleType:scheduleState:", 0, v9, 0, 0, 0, 0, 0, 0, 0, 8388620, v6, v7, 0, 0,
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

  return v10;
}

+ (id)instantMessageWithAssociatedMessageContent:(id)a3 associatedMessageGUID:(id)a4 associatedMessageType:(int64_t)a5 associatedMessageRange:(_NSRange)a6 associatedMessageEmoji:(id)a7 messageSummaryInfo:(id)a8 threadIdentifier:(id)a9
{
  NSUInteger length;
  NSUInteger location;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;

  length = a6.length;
  location = a6.location;
  v15 = a9;
  v16 = a8;
  v17 = a7;
  v18 = a4;
  v19 = a3;
  v20 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v20, "_initWithSender:time:timeRead:timeDelivered:timePlayed:plainText:text:messageSubject:fileTransferGUIDs:flags:error:guid:messageID:subject:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:associatedMessageGUID:associatedMessageType:associatedMessageRange:associatedMessageEmoji:messageSummaryInfo:threadIdentifier:dateEdited:scheduleType:scheduleState:", 0, v21, 0, 0, 0, 0, v19, 0, 0, 5, 0, v22, 0, 0,
                  0,
                  0,
                  0,
                  0,
                  v18,
                  a5,
                  location,
                  length,
                  v17,
                  v16,
                  v15,
                  0,
                  0,
                  0);

  return v23;
}

+ (id)breadcrumbMessageWithText:(id)a3 associatedMessageGUID:(id)a4 balloonBundleID:(id)a5 fileTransferGUIDs:(id)a6 payloadData:(id)a7 threadIdentifier:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v20, "_initWithSender:time:timeRead:timeDelivered:timePlayed:plainText:text:messageSubject:fileTransferGUIDs:flags:error:guid:messageID:subject:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:associatedMessageGUID:associatedMessageType:associatedMessageRange:associatedMessageEmoji:messageSummaryInfo:threadIdentifier:dateEdited:scheduleType:scheduleState:", 0, v21, 0, 0, 0, 0, v19, 0, v16, 5, 0, v22, 0, 0,
                  v17,
                  v15,
                  0,
                  0,
                  v18,
                  2,
                  0,
                  0x7FFFFFFFFFFFFFFFLL,
                  0,
                  0,
                  v14,
                  0,
                  0,
                  0);

  return v23;
}

- (BOOL)isAssociatedMessage
{
  void *v2;
  BOOL v3;

  -[IMMessage associatedMessageGUID](self, "associatedMessageGUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (IMMessage)initWithSender:(id)a3 time:(id)a4 text:(id)a5 messageSubject:(id)a6 fileTransferGUIDs:(id)a7 flags:(unint64_t)a8 error:(id)a9 guid:(id)a10 subject:(id)a11 associatedMessageGUID:(id)a12 associatedMessageType:(int64_t)a13 associatedMessageRange:(_NSRange)a14 associatedMessageInfo:(id)a15
{
  return -[IMMessage initWithSender:time:text:messageSubject:fileTransferGUIDs:flags:error:guid:subject:associatedMessageGUID:associatedMessageType:associatedMessageRange:messageSummaryInfo:threadIdentifier:](self, "initWithSender:time:text:messageSubject:fileTransferGUIDs:flags:error:guid:subject:associatedMessageGUID:associatedMessageType:associatedMessageRange:messageSummaryInfo:threadIdentifier:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14.location, a14.length, a15, 0);
}

- (BOOL)isIncomingTypingMessage
{
  uint64_t v2;

  v2 = MEMORY[0x1E0D39918];
  -[IMMessage flags](self, "flags");
  return MEMORY[0x1E0DE7D20](v2, sel_isIncomingTypingMessage_);
}

- (BOOL)isCancelTypingMessage
{
  uint64_t v3;

  v3 = MEMORY[0x1E0D39918];
  -[IMMessage flags](self, "flags");
  -[IMMessage hasEditedParts](self, "hasEditedParts");
  return MEMORY[0x1E0DE7D20](v3, sel_isCancelTypingMessage_isEditedMessage_);
}

- (BOOL)isTypingOrCancelTypingMessage
{
  uint64_t v3;

  v3 = MEMORY[0x1E0D39918];
  -[IMMessage flags](self, "flags");
  -[IMMessage hasEditedParts](self, "hasEditedParts");
  return MEMORY[0x1E0DE7D20](v3, sel_isTypingOrCancelTypingMessage_isEditedMessage_);
}

- (BOOL)isIncomingTypingOrCancelTypingMessage
{
  uint64_t v3;

  v3 = MEMORY[0x1E0D39918];
  -[IMMessage flags](self, "flags");
  -[IMMessage hasEditedParts](self, "hasEditedParts");
  return MEMORY[0x1E0DE7D20](v3, sel_isIncomingTypingOrCancelTypingMessage_isEditedMessage_);
}

@end
