@implementation IMSPIMessage

- (void)dealloc
{
  objc_super v3;

  -[IMSPIMessage setText:](self, "setText:", 0);
  -[IMSPIMessage setBody:](self, "setBody:", 0);
  -[IMSPIMessage setSummary:](self, "setSummary:", 0);
  -[IMSPIMessage setDate:](self, "setDate:", 0);
  -[IMSPIMessage setDateRead:](self, "setDateRead:", 0);
  -[IMSPIMessage setDateForLastReadMessageInChat:](self, "setDateForLastReadMessageInChat:", 0);
  -[IMSPIMessage setRecipients:](self, "setRecipients:", 0);
  -[IMSPIMessage setSender:](self, "setSender:", 0);
  -[IMSPIMessage setSubject:](self, "setSubject:", 0);
  -[IMSPIMessage setAttributedText:](self, "setAttributedText:", 0);
  -[IMSPIMessage setGuid:](self, "setGuid:", 0);
  -[IMSPIMessage setChatGuids:](self, "setChatGuids:", 0);
  -[IMSPIMessage setGroupID:](self, "setGroupID:", 0);
  -[IMSPIMessage setChatIdentifier:](self, "setChatIdentifier:", 0);
  -[IMSPIMessage setDisplayName:](self, "setDisplayName:", 0);
  -[IMSPIMessage setReferencedMessage:](self, "setReferencedMessage:", 0);
  -[IMSPIMessage setBundleId:](self, "setBundleId:", 0);
  -[IMSPIMessage setDisplayAppName:](self, "setDisplayAppName:", 0);
  -[IMSPIMessage setRichLinkMetadata:](self, "setRichLinkMetadata:", 0);
  -[IMSPIMessage setPeerPaymentAmount:](self, "setPeerPaymentAmount:", 0);
  v3.receiver = self;
  v3.super_class = (Class)IMSPIMessage;
  -[IMSPIMessage dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  if (-[IMSPIMessage isOutgoing](self, "isOutgoing"))
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  if (-[IMSPIMessage isRead](self, "isRead"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  if (-[IMSPIMessage isAudioMessage](self, "isAudioMessage"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  -[IMSPIMessage sender](self, "sender");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMSPIMessage recipients](self, "recipients");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMSPIMessage guid](self, "guid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMSPIMessage chatGuids](self, "chatGuids");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMSPIMessage attachments](self, "attachments");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("IMSPIMessage: %p [Outgoing: %@  Read: %@  IsAudio: %@  Sender: %@  Recipients: %@  GUID: %@ ChatGUIDs: %@ Attachments: %@]"), self, v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSURL)url
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("x-apple-sms:guid=%@"), self->_guid);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v4;
}

- (NSDate)lastReadDate
{
  return self->_dateForLastReadMessageInChat;
}

- (id)spiChatWithQOS:(unsigned int)a3
{
  void *v5;
  void *v6;
  dispatch_semaphore_t v7;
  NSObject *v8;
  dispatch_time_t v9;
  id v10;
  _QWORD v12[4];
  NSObject *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  sub_1A2153D6C((dispatch_qos_class_t)a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray firstObject](self->_chatGuids, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_1A200AF14;
  v19 = sub_1A200ACFC;
  v20 = 0;
  if (objc_msgSend(v6, "length"))
  {
    v7 = dispatch_semaphore_create(0);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = sub_1A2153F8C;
    v12[3] = &unk_1E47232A0;
    v14 = &v15;
    v8 = v7;
    v13 = v8;
    IMSPIQueryChatWithGuid(v6, (dispatch_qos_class_t)a3, v5, v12);
    v9 = dispatch_time(0, 5000000000);
    dispatch_semaphore_wait(v8, v9);

  }
  v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

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

- (int64_t)messageID
{
  return self->_messageID;
}

- (void)setMessageID:(int64_t)a3
{
  self->_messageID = a3;
}

- (NSAttributedString)attributedText
{
  return (NSAttributedString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAttributedText:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (BOOL)isRead
{
  return self->_isRead;
}

- (void)setIsRead:(BOOL)a3
{
  self->_isRead = a3;
}

- (BOOL)isOutgoing
{
  return self->_isOutgoing;
}

- (void)setIsOutgoing:(BOOL)a3
{
  self->_isOutgoing = a3;
}

- (NSString)text
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setText:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (IMSPIHandle)sender
{
  return (IMSPIHandle *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSender:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSArray)recipients
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRecipients:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSString)subject
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSubject:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSDate)date
{
  return (NSDate *)objc_getProperty(self, a2, 72, 1);
}

- (void)setDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (BOOL)isAudioMessage
{
  return self->_isAudioMessage;
}

- (void)setIsAudioMessage:(BOOL)a3
{
  self->_isAudioMessage = a3;
}

- (NSArray)chatGuids
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (void)setChatGuids:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSArray)attachments
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setAttachments:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (int64_t)itemType
{
  return self->_itemType;
}

- (void)setItemType:(int64_t)a3
{
  self->_itemType = a3;
}

- (NSString)groupID
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setGroupID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSString)chatIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setChatIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (BOOL)isGroupChat
{
  return self->_isGroupChat;
}

- (void)setIsGroupChat:(BOOL)a3
{
  self->_isGroupChat = a3;
}

- (NSString)body
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setBody:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSString)summary
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setSummary:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSString)effect
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setEffect:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSString)service
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (void)setService:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (NSDate)dateRead
{
  return (NSDate *)objc_getProperty(self, a2, 160, 1);
}

- (void)setDateRead:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (NSDate)dateForLastReadMessageInChat
{
  return (NSDate *)objc_getProperty(self, a2, 168, 1);
}

- (void)setDateForLastReadMessageInChat:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (NSURL)extensionPayloadURL
{
  return (NSURL *)objc_getProperty(self, a2, 176, 1);
}

- (void)setExtensionPayloadURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (IMSPIMessage)referencedMessage
{
  return (IMSPIMessage *)objc_getProperty(self, a2, 184, 1);
}

- (void)setReferencedMessage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (NSString)bundleId
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (void)setBundleId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (int64_t)messageType
{
  return self->_messageType;
}

- (void)setMessageType:(int64_t)a3
{
  self->_messageType = a3;
}

- (NSString)displayAppName
{
  return (NSString *)objc_getProperty(self, a2, 208, 1);
}

- (void)setDisplayAppName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (LPLinkMetadata)richLinkMetadata
{
  return (LPLinkMetadata *)objc_getProperty(self, a2, 216, 1);
}

- (void)setRichLinkMetadata:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (PKCurrencyAmount)peerPaymentAmount
{
  return (PKCurrencyAmount *)objc_getProperty(self, a2, 224, 1);
}

- (void)setPeerPaymentAmount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (BOOL)hasDataDetectedResults
{
  return self->_hasDataDetectedResults;
}

- (void)setHasDataDetectedResults:(BOOL)a3
{
  self->_hasDataDetectedResults = a3;
}

- (NSString)associatedMessageEmoji
{
  return (NSString *)objc_getProperty(self, a2, 232, 1);
}

- (void)setAssociatedMessageEmoji:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedMessageEmoji, 0);
  objc_storeStrong((id *)&self->_peerPaymentAmount, 0);
  objc_storeStrong((id *)&self->_richLinkMetadata, 0);
  objc_storeStrong((id *)&self->_displayAppName, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_referencedMessage, 0);
  objc_storeStrong((id *)&self->_extensionPayloadURL, 0);
  objc_storeStrong((id *)&self->_dateForLastReadMessageInChat, 0);
  objc_storeStrong((id *)&self->_dateRead, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_effect, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_chatIdentifier, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_chatGuids, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_attributedText, 0);
  objc_storeStrong((id *)&self->_guid, 0);
}

- (BOOL)allowedByScreenTime
{
  uint64_t v3;
  void (**v4)(_QWORD);
  BOOL v5;
  _QWORD block[4];
  void (**v8)(_QWORD);
  _QWORD aBlock[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  if (!+[IMDowntimeController isContactLimitsFeatureEnabled](IMDowntimeController, "isContactLimitsFeatureEnabled"))return 1;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1A21544D4;
  aBlock[3] = &unk_1E471F5D8;
  aBlock[4] = self;
  aBlock[5] = &v10;
  v4 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    v4[2](v4);
  }
  else
  {
    block[0] = v3;
    block[1] = 3221225472;
    block[2] = sub_1A215471C;
    block[3] = &unk_1E471E528;
    v8 = v4;
    dispatch_sync(MEMORY[0x1E0C80D38], block);

  }
  v5 = *((_BYTE *)v11 + 24) != 0;

  _Block_object_dispose(&v10, 8);
  return v5;
}

@end
