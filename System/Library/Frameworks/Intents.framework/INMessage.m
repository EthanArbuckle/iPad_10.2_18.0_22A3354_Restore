@implementation INMessage

- (id)_intents_cacheableObjects
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[INMessage sender](self, "sender");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "_intents_cacheableObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
      objc_msgSend(v3, "unionSet:", v6);

  }
  -[INMessage recipients](self, "recipients");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v12), "_intents_cacheableObjects", (_QWORD)v17);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "count"))
            objc_msgSend(v3, "unionSet:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v10);
    }

  }
  if (objc_msgSend(v3, "count", (_QWORD)v17))
    v14 = v3;
  else
    v14 = 0;
  v15 = v14;

  return v15;
}

- (void)_intents_updateContainerWithCache:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[INMessage sender](self, "sender");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_intents_updateContainerWithCache:", v4);

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[INMessage recipients](self, "recipients", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "_intents_updateContainerWithCache:", v4);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (INMessage)initWithIdentifier:(id)a3 conversationIdentifier:(id)a4 content:(id)a5 dateSent:(id)a6 sender:(id)a7 recipients:(id)a8 groupName:(id)a9 dateMessageWasLastRead:(id)a10 numberOfAttachments:(id)a11 messageType:(int64_t)a12 messageEffectType:(int64_t)a13 referencedMessage:(id)a14 serviceName:(id)a15 attachmentFiles:(id)a16 location:(id)a17 linkMetadata:(id)a18 reaction:(id)a19 sticker:(id)a20
{
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  INMessage *v33;
  uint64_t v34;
  NSString *identifier;
  uint64_t v36;
  NSString *conversationIdentifier;
  uint64_t v38;
  NSString *content;
  uint64_t v40;
  NSDate *dateSent;
  uint64_t v42;
  INPerson *sender;
  uint64_t v44;
  NSArray *recipients;
  uint64_t v46;
  INSpeakableString *groupName;
  uint64_t v48;
  NSDate *dateMessageWasLastRead;
  uint64_t v50;
  NSNumber *numberOfAttachments;
  uint64_t v52;
  INMessage *referencedMessage;
  uint64_t v54;
  NSString *serviceName;
  uint64_t v56;
  NSArray *attachmentFiles;
  uint64_t v58;
  CLPlacemark *location;
  uint64_t v60;
  INMessageLinkMetadata *linkMetadata;
  uint64_t v62;
  INMessageReaction *reaction;
  uint64_t v64;
  INSticker *sticker;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  objc_super v76;

  v67 = a3;
  v75 = a4;
  v74 = a5;
  v73 = a6;
  v72 = a7;
  v71 = a8;
  v70 = a9;
  v69 = a10;
  v68 = a11;
  v26 = a14;
  v27 = a15;
  v28 = a16;
  v29 = a17;
  v30 = a18;
  v31 = a19;
  v32 = a20;
  v76.receiver = self;
  v76.super_class = (Class)INMessage;
  v33 = -[INMessage init](&v76, sel_init);
  if (v33)
  {
    v34 = objc_msgSend(v67, "copy");
    identifier = v33->_identifier;
    v33->_identifier = (NSString *)v34;

    v36 = objc_msgSend(v75, "copy");
    conversationIdentifier = v33->_conversationIdentifier;
    v33->_conversationIdentifier = (NSString *)v36;

    v38 = objc_msgSend(v74, "copy");
    content = v33->_content;
    v33->_content = (NSString *)v38;

    v40 = objc_msgSend(v73, "copy");
    dateSent = v33->_dateSent;
    v33->_dateSent = (NSDate *)v40;

    v42 = objc_msgSend(v72, "copy");
    sender = v33->_sender;
    v33->_sender = (INPerson *)v42;

    v44 = objc_msgSend(v71, "copy");
    recipients = v33->_recipients;
    v33->_recipients = (NSArray *)v44;

    v46 = objc_msgSend(v70, "copy");
    groupName = v33->_groupName;
    v33->_groupName = (INSpeakableString *)v46;

    v48 = objc_msgSend(v69, "copy");
    dateMessageWasLastRead = v33->_dateMessageWasLastRead;
    v33->_dateMessageWasLastRead = (NSDate *)v48;

    v50 = objc_msgSend(v68, "copy");
    numberOfAttachments = v33->_numberOfAttachments;
    v33->_numberOfAttachments = (NSNumber *)v50;

    v33->_messageType = a12;
    v33->_messageEffectType = a13;
    v52 = objc_msgSend(v26, "copy");
    referencedMessage = v33->_referencedMessage;
    v33->_referencedMessage = (INMessage *)v52;

    v54 = objc_msgSend(v27, "copy");
    serviceName = v33->_serviceName;
    v33->_serviceName = (NSString *)v54;

    v56 = objc_msgSend(v28, "copy");
    attachmentFiles = v33->_attachmentFiles;
    v33->_attachmentFiles = (NSArray *)v56;

    v58 = objc_msgSend(v29, "copy");
    location = v33->_location;
    v33->_location = (CLPlacemark *)v58;

    v60 = objc_msgSend(v30, "copy");
    linkMetadata = v33->_linkMetadata;
    v33->_linkMetadata = (INMessageLinkMetadata *)v60;

    v62 = objc_msgSend(v31, "copy");
    reaction = v33->_reaction;
    v33->_reaction = (INMessageReaction *)v62;

    v64 = objc_msgSend(v32, "copy");
    sticker = v33->_sticker;
    v33->_sticker = (INSticker *)v64;

  }
  return v33;
}

- (INMessage)initWithIdentifier:(id)a3 conversationIdentifier:(id)a4 content:(id)a5 dateSent:(id)a6 sender:(id)a7 recipients:(id)a8 groupName:(id)a9 dateMessageWasLastRead:(id)a10 numberOfAttachments:(id)a11 messageType:(int64_t)a12 messageEffectType:(int64_t)a13 referencedMessage:(id)a14 serviceName:(id)a15 reaction:(id)a16 attachmentFiles:(id)a17 location:(id)a18 linkMetadata:(id)a19
{
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  INMessage *v31;
  uint64_t v32;
  NSString *identifier;
  uint64_t v34;
  NSString *conversationIdentifier;
  uint64_t v36;
  NSString *content;
  uint64_t v38;
  NSDate *dateSent;
  uint64_t v40;
  INPerson *sender;
  uint64_t v42;
  NSArray *recipients;
  uint64_t v44;
  INSpeakableString *groupName;
  uint64_t v46;
  NSDate *dateMessageWasLastRead;
  uint64_t v48;
  NSNumber *numberOfAttachments;
  uint64_t v50;
  INMessage *referencedMessage;
  uint64_t v52;
  NSString *serviceName;
  uint64_t v54;
  INMessageReaction *reaction;
  uint64_t v56;
  NSArray *attachmentFiles;
  uint64_t v58;
  CLPlacemark *location;
  uint64_t v60;
  INMessageLinkMetadata *linkMetadata;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  objc_super v72;

  v24 = a3;
  v64 = a4;
  v71 = a5;
  v70 = a6;
  v69 = a7;
  v68 = a8;
  v67 = a9;
  v66 = a10;
  v65 = a11;
  v25 = a14;
  v26 = a15;
  v27 = a16;
  v28 = a17;
  v29 = a18;
  v30 = a19;
  v72.receiver = self;
  v72.super_class = (Class)INMessage;
  v31 = -[INMessage init](&v72, sel_init);
  if (v31)
  {
    v32 = objc_msgSend(v24, "copy");
    identifier = v31->_identifier;
    v31->_identifier = (NSString *)v32;

    v34 = objc_msgSend(v64, "copy");
    conversationIdentifier = v31->_conversationIdentifier;
    v31->_conversationIdentifier = (NSString *)v34;

    v36 = objc_msgSend(v71, "copy");
    content = v31->_content;
    v31->_content = (NSString *)v36;

    v38 = objc_msgSend(v70, "copy");
    dateSent = v31->_dateSent;
    v31->_dateSent = (NSDate *)v38;

    v40 = objc_msgSend(v69, "copy");
    sender = v31->_sender;
    v31->_sender = (INPerson *)v40;

    v42 = objc_msgSend(v68, "copy");
    recipients = v31->_recipients;
    v31->_recipients = (NSArray *)v42;

    v44 = objc_msgSend(v67, "copy");
    groupName = v31->_groupName;
    v31->_groupName = (INSpeakableString *)v44;

    v46 = objc_msgSend(v66, "copy");
    dateMessageWasLastRead = v31->_dateMessageWasLastRead;
    v31->_dateMessageWasLastRead = (NSDate *)v46;

    v48 = objc_msgSend(v65, "copy");
    numberOfAttachments = v31->_numberOfAttachments;
    v31->_numberOfAttachments = (NSNumber *)v48;

    v31->_messageType = a12;
    v31->_messageEffectType = a13;
    v50 = objc_msgSend(v25, "copy");
    referencedMessage = v31->_referencedMessage;
    v31->_referencedMessage = (INMessage *)v50;

    v52 = objc_msgSend(v26, "copy");
    serviceName = v31->_serviceName;
    v31->_serviceName = (NSString *)v52;

    v54 = objc_msgSend(v27, "copy");
    reaction = v31->_reaction;
    v31->_reaction = (INMessageReaction *)v54;

    v56 = objc_msgSend(v28, "copy");
    attachmentFiles = v31->_attachmentFiles;
    v31->_attachmentFiles = (NSArray *)v56;

    v58 = objc_msgSend(v29, "copy");
    location = v31->_location;
    v31->_location = (CLPlacemark *)v58;

    v60 = objc_msgSend(v30, "copy");
    linkMetadata = v31->_linkMetadata;
    v31->_linkMetadata = (INMessageLinkMetadata *)v60;

  }
  return v31;
}

- (INMessage)initWithIdentifier:(id)a3 conversationIdentifier:(id)a4 content:(id)a5 dateSent:(id)a6 sender:(id)a7 recipients:(id)a8 groupName:(id)a9 dateMessageWasLastRead:(id)a10 numberOfAttachments:(id)a11 messageType:(int64_t)a12 messageEffectType:(int64_t)a13 referencedMessage:(id)a14 serviceName:(id)a15 audioMessageFile:(id)a16
{
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  INMessage *v30;
  uint64_t v31;
  NSString *identifier;
  uint64_t v33;
  NSString *conversationIdentifier;
  uint64_t v35;
  NSString *content;
  uint64_t v37;
  NSDate *dateSent;
  uint64_t v39;
  INPerson *sender;
  uint64_t v41;
  NSArray *recipients;
  uint64_t v43;
  INSpeakableString *groupName;
  uint64_t v45;
  NSDate *dateMessageWasLastRead;
  uint64_t v47;
  NSNumber *numberOfAttachments;
  uint64_t v49;
  INMessage *referencedMessage;
  uint64_t v51;
  NSString *serviceName;
  void *v53;
  NSArray *v54;
  uint64_t v55;
  NSArray *attachmentFiles;
  id v58;
  id v59;
  id v61;
  id v62;
  id v63;
  objc_super v64;

  v63 = a3;
  v62 = a4;
  v61 = a5;
  v21 = a6;
  v22 = a7;
  v23 = a8;
  v24 = a9;
  v25 = a10;
  v26 = a11;
  v27 = a14;
  v28 = a15;
  v29 = a16;
  v64.receiver = self;
  v64.super_class = (Class)INMessage;
  v30 = -[INMessage init](&v64, sel_init);
  if (v30)
  {
    v31 = objc_msgSend(v63, "copy");
    identifier = v30->_identifier;
    v30->_identifier = (NSString *)v31;

    v33 = objc_msgSend(v62, "copy");
    conversationIdentifier = v30->_conversationIdentifier;
    v30->_conversationIdentifier = (NSString *)v33;

    v35 = objc_msgSend(v61, "copy");
    content = v30->_content;
    v30->_content = (NSString *)v35;

    v37 = objc_msgSend(v21, "copy");
    dateSent = v30->_dateSent;
    v30->_dateSent = (NSDate *)v37;

    v39 = objc_msgSend(v22, "copy");
    sender = v30->_sender;
    v30->_sender = (INPerson *)v39;

    v59 = v23;
    v41 = objc_msgSend(v23, "copy");
    recipients = v30->_recipients;
    v30->_recipients = (NSArray *)v41;

    v43 = objc_msgSend(v24, "copy");
    groupName = v30->_groupName;
    v30->_groupName = (INSpeakableString *)v43;

    v58 = v25;
    v45 = objc_msgSend(v25, "copy");
    dateMessageWasLastRead = v30->_dateMessageWasLastRead;
    v30->_dateMessageWasLastRead = (NSDate *)v45;

    v47 = objc_msgSend(v26, "copy");
    numberOfAttachments = v30->_numberOfAttachments;
    v30->_numberOfAttachments = (NSNumber *)v47;

    v30->_messageType = a12;
    v30->_messageEffectType = a13;
    v49 = objc_msgSend(v27, "copy");
    referencedMessage = v30->_referencedMessage;
    v30->_referencedMessage = (INMessage *)v49;

    v51 = objc_msgSend(v28, "copy");
    serviceName = v30->_serviceName;
    v30->_serviceName = (NSString *)v51;

    if (v29)
    {
      v53 = (void *)MEMORY[0x1E0C99D20];
      v54 = (NSArray *)objc_msgSend(v29, "copy");
      objc_msgSend(v53, "arrayWithObject:", v54);
      v55 = objc_claimAutoreleasedReturnValue();
      attachmentFiles = v30->_attachmentFiles;
      v30->_attachmentFiles = (NSArray *)v55;

    }
    else
    {
      v54 = v30->_attachmentFiles;
      v30->_attachmentFiles = 0;
    }

    v23 = v59;
    v25 = v58;
  }

  return v30;
}

- (INMessage)initWithIdentifier:(id)a3 conversationIdentifier:(id)a4 content:(id)a5 dateSent:(id)a6 sender:(id)a7 recipients:(id)a8 groupName:(id)a9 dateMessageWasLastRead:(id)a10 numberOfAttachments:(id)a11 messageType:(int64_t)a12 messageEffectType:(int64_t)a13 referencedMessage:(id)a14 serviceName:(id)a15
{
  return -[INMessage initWithIdentifier:conversationIdentifier:content:dateSent:sender:recipients:groupName:dateMessageWasLastRead:numberOfAttachments:messageType:messageEffectType:referencedMessage:serviceName:audioMessageFile:](self, "initWithIdentifier:conversationIdentifier:content:dateSent:sender:recipients:groupName:dateMessageWasLastRead:numberOfAttachments:messageType:messageEffectType:referencedMessage:serviceName:audioMessageFile:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, 0);
}

- (INMessage)initWithIdentifier:(id)a3 conversationIdentifier:(id)a4 content:(id)a5 dateSent:(id)a6 sender:(id)a7 recipients:(id)a8 groupName:(id)a9 dateMessageWasLastRead:(id)a10 numberOfAttachments:(id)a11 messageType:(int64_t)a12 messageEffectType:(int64_t)a13 referencedMessage:(id)a14
{
  return -[INMessage initWithIdentifier:conversationIdentifier:content:dateSent:sender:recipients:groupName:dateMessageWasLastRead:numberOfAttachments:messageType:messageEffectType:referencedMessage:serviceName:](self, "initWithIdentifier:conversationIdentifier:content:dateSent:sender:recipients:groupName:dateMessageWasLastRead:numberOfAttachments:messageType:messageEffectType:referencedMessage:serviceName:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, 0);
}

- (INMessage)initWithIdentifier:(id)a3 conversationIdentifier:(id)a4 content:(id)a5 dateSent:(id)a6 sender:(id)a7 recipients:(id)a8 groupName:(id)a9 dateMessageWasLastRead:(id)a10 numberOfAttachments:(id)a11 messageType:(int64_t)a12 messageEffectType:(int64_t)a13
{
  return -[INMessage initWithIdentifier:conversationIdentifier:content:dateSent:sender:recipients:groupName:dateMessageWasLastRead:numberOfAttachments:messageType:messageEffectType:referencedMessage:](self, "initWithIdentifier:conversationIdentifier:content:dateSent:sender:recipients:groupName:dateMessageWasLastRead:numberOfAttachments:messageType:messageEffectType:referencedMessage:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, 0);
}

- (INMessage)initWithIdentifier:(NSString *)identifier conversationIdentifier:(NSString *)conversationIdentifier content:(NSString *)content dateSent:(NSDate *)dateSent sender:(INPerson *)sender recipients:(NSArray *)recipients groupName:(INSpeakableString *)groupName messageType:(INMessageType)messageType
{
  NSString *v16;
  NSString *v17;
  NSString *v18;
  NSDate *v19;
  INPerson *v20;
  NSArray *v21;
  INSpeakableString *v22;
  INMessage *v23;
  uint64_t v24;
  NSString *v25;
  uint64_t v26;
  NSString *v27;
  uint64_t v28;
  NSString *v29;
  uint64_t v30;
  NSDate *v31;
  uint64_t v32;
  INPerson *v33;
  uint64_t v34;
  NSArray *v35;
  uint64_t v36;
  INSpeakableString *v37;
  objc_super v39;

  v16 = identifier;
  v17 = conversationIdentifier;
  v18 = content;
  v19 = dateSent;
  v20 = sender;
  v21 = recipients;
  v22 = groupName;
  v39.receiver = self;
  v39.super_class = (Class)INMessage;
  v23 = -[INMessage init](&v39, sel_init);
  if (v23)
  {
    v24 = -[NSString copy](v16, "copy");
    v25 = v23->_identifier;
    v23->_identifier = (NSString *)v24;

    v26 = -[NSString copy](v17, "copy");
    v27 = v23->_conversationIdentifier;
    v23->_conversationIdentifier = (NSString *)v26;

    v28 = -[NSString copy](v18, "copy");
    v29 = v23->_content;
    v23->_content = (NSString *)v28;

    v30 = -[NSDate copy](v19, "copy");
    v31 = v23->_dateSent;
    v23->_dateSent = (NSDate *)v30;

    v32 = -[INPerson copy](v20, "copy");
    v33 = v23->_sender;
    v23->_sender = (INPerson *)v32;

    v34 = -[NSArray copy](v21, "copy");
    v35 = v23->_recipients;
    v23->_recipients = (NSArray *)v34;

    v36 = -[INSpeakableString copy](v22, "copy");
    v37 = v23->_groupName;
    v23->_groupName = (INSpeakableString *)v36;

    v23->_messageType = messageType;
    v23->_messageEffectType = 0;
  }

  return v23;
}

- (INMessage)initWithIdentifier:(NSString *)identifier conversationIdentifier:(NSString *)conversationIdentifier content:(NSString *)content dateSent:(NSDate *)dateSent sender:(INPerson *)sender recipients:(NSArray *)recipients groupName:(INSpeakableString *)groupName messageType:(INMessageType)messageType serviceName:(NSString *)serviceName
{
  NSString *v17;
  NSString *v18;
  NSString *v19;
  NSDate *v20;
  INPerson *v21;
  NSArray *v22;
  INSpeakableString *v23;
  NSString *v24;
  INMessage *v25;
  uint64_t v26;
  NSString *v27;
  uint64_t v28;
  NSString *v29;
  uint64_t v30;
  NSString *v31;
  uint64_t v32;
  NSDate *v33;
  uint64_t v34;
  INPerson *v35;
  uint64_t v36;
  NSArray *v37;
  uint64_t v38;
  INSpeakableString *v39;
  uint64_t v40;
  NSString *v41;
  objc_super v43;

  v17 = identifier;
  v18 = conversationIdentifier;
  v19 = content;
  v20 = dateSent;
  v21 = sender;
  v22 = recipients;
  v23 = groupName;
  v24 = serviceName;
  v43.receiver = self;
  v43.super_class = (Class)INMessage;
  v25 = -[INMessage init](&v43, sel_init);
  if (v25)
  {
    v26 = -[NSString copy](v17, "copy");
    v27 = v25->_identifier;
    v25->_identifier = (NSString *)v26;

    v28 = -[NSString copy](v18, "copy");
    v29 = v25->_conversationIdentifier;
    v25->_conversationIdentifier = (NSString *)v28;

    v30 = -[NSString copy](v19, "copy");
    v31 = v25->_content;
    v25->_content = (NSString *)v30;

    v32 = -[NSDate copy](v20, "copy");
    v33 = v25->_dateSent;
    v25->_dateSent = (NSDate *)v32;

    v34 = -[INPerson copy](v21, "copy");
    v35 = v25->_sender;
    v25->_sender = (INPerson *)v34;

    v36 = -[NSArray copy](v22, "copy");
    v37 = v25->_recipients;
    v25->_recipients = (NSArray *)v36;

    v38 = -[INSpeakableString copy](v23, "copy");
    v39 = v25->_groupName;
    v25->_groupName = (INSpeakableString *)v38;

    v25->_messageType = messageType;
    v25->_messageEffectType = 0;
    v40 = -[NSString copy](v24, "copy");
    v41 = v25->_serviceName;
    v25->_serviceName = (NSString *)v40;

  }
  return v25;
}

- (INMessage)initWithIdentifier:(NSString *)identifier conversationIdentifier:(NSString *)conversationIdentifier content:(NSString *)content dateSent:(NSDate *)dateSent sender:(INPerson *)sender recipients:(NSArray *)recipients groupName:(INSpeakableString *)groupName messageType:(INMessageType)messageType serviceName:(NSString *)serviceName audioMessageFile:(INFile *)audioMessageFile
{
  NSString *v18;
  NSString *v19;
  NSString *v20;
  NSString *v21;
  NSString *v22;
  NSString *v23;
  NSString *v24;
  NSDate *v25;
  NSString *v26;
  NSDate *v27;
  INPerson *v28;
  NSDate *v29;
  INPerson *v30;
  NSArray *v31;
  INSpeakableString *v32;
  NSString *v33;
  INFile *v34;
  INMessage *v35;
  uint64_t v36;
  NSString *v37;
  uint64_t v38;
  NSString *v39;
  uint64_t v40;
  NSString *v41;
  uint64_t v42;
  NSDate *v43;
  uint64_t v44;
  INPerson *v45;
  uint64_t v46;
  NSArray *v47;
  uint64_t v48;
  INSpeakableString *v49;
  uint64_t v50;
  NSString *v51;
  INPerson *v52;
  NSDate *v53;
  NSString *v54;
  NSString *v55;
  NSString *v56;
  void *v57;
  NSArray *v58;
  void *v59;
  uint64_t v60;
  NSArray *attachmentFiles;
  NSArray *v63;
  INSpeakableString *v64;
  objc_super v65;

  v18 = identifier;
  v19 = conversationIdentifier;
  v20 = v18;
  v21 = v19;
  v22 = content;
  v23 = v21;
  v24 = v22;
  v25 = dateSent;
  v26 = v24;
  v27 = v25;
  v28 = sender;
  v29 = v27;
  v30 = v28;
  v31 = recipients;
  v32 = groupName;
  v33 = serviceName;
  v34 = audioMessageFile;
  v65.receiver = self;
  v65.super_class = (Class)INMessage;
  v35 = -[INMessage init](&v65, sel_init);
  if (v35)
  {
    v64 = v32;
    v36 = -[NSString copy](v20, "copy");
    v37 = v35->_identifier;
    v35->_identifier = (NSString *)v36;

    v38 = -[NSString copy](v23, "copy");
    v39 = v35->_conversationIdentifier;
    v35->_conversationIdentifier = (NSString *)v38;

    v40 = -[NSString copy](v26, "copy");
    v41 = v35->_content;
    v35->_content = (NSString *)v40;

    v42 = -[NSDate copy](v29, "copy");
    v43 = v35->_dateSent;
    v35->_dateSent = (NSDate *)v42;

    v44 = -[INPerson copy](v30, "copy");
    v45 = v35->_sender;
    v35->_sender = (INPerson *)v44;

    v63 = v31;
    v46 = -[NSArray copy](v31, "copy");
    v47 = v35->_recipients;
    v35->_recipients = (NSArray *)v46;

    v48 = -[INSpeakableString copy](v32, "copy");
    v49 = v35->_groupName;
    v35->_groupName = (INSpeakableString *)v48;

    v35->_messageType = messageType;
    v35->_messageEffectType = 0;
    v50 = -[NSString copy](v33, "copy");
    v51 = v35->_serviceName;
    v35->_serviceName = (NSString *)v50;

    if (v34)
    {
      v52 = v30;
      v53 = v29;
      v54 = v26;
      v55 = v23;
      v56 = v20;
      v57 = (void *)MEMORY[0x1E0C99D20];
      v58 = (NSArray *)-[INFile copy](v34, "copy");
      v59 = v57;
      v20 = v56;
      v23 = v55;
      v26 = v54;
      v29 = v53;
      v30 = v52;
      v32 = v64;
      objc_msgSend(v59, "arrayWithObject:", v58);
      v60 = objc_claimAutoreleasedReturnValue();
      attachmentFiles = v35->_attachmentFiles;
      v35->_attachmentFiles = (NSArray *)v60;

    }
    else
    {
      v58 = v35->_attachmentFiles;
      v35->_attachmentFiles = 0;
    }

    v31 = v63;
  }

  return v35;
}

- (INMessage)initWithIdentifier:(id)a3 conversationIdentifier:(id)a4 content:(id)a5 dateSent:(id)a6 sender:(id)a7 recipients:(id)a8 dateMessageWasLastRead:(id)a9 numberOfAttachments:(id)a10 messageType:(int64_t)a11 messageEffectType:(int64_t)a12
{
  return -[INMessage initWithIdentifier:conversationIdentifier:content:dateSent:sender:recipients:groupName:dateMessageWasLastRead:numberOfAttachments:messageType:messageEffectType:](self, "initWithIdentifier:conversationIdentifier:content:dateSent:sender:recipients:groupName:dateMessageWasLastRead:numberOfAttachments:messageType:messageEffectType:", a3, a4, a5, a6, a7, a8, 0, a9, a10, a11, a12);
}

- (INMessage)initWithIdentifier:(NSString *)identifier conversationIdentifier:(NSString *)conversationIdentifier content:(NSString *)content dateSent:(NSDate *)dateSent sender:(INPerson *)sender recipients:(NSArray *)recipients messageType:(INMessageType)messageType
{
  return -[INMessage initWithIdentifier:conversationIdentifier:content:dateSent:sender:recipients:groupName:messageType:](self, "initWithIdentifier:conversationIdentifier:content:dateSent:sender:recipients:groupName:messageType:", identifier, conversationIdentifier, content, dateSent, sender, recipients, 0, messageType);
}

- (INMessage)initWithIdentifier:(NSString *)identifier content:(NSString *)content dateSent:(NSDate *)dateSent sender:(INPerson *)sender recipients:(NSArray *)recipients
{
  return -[INMessage initWithIdentifier:conversationIdentifier:content:dateSent:sender:recipients:messageType:](self, "initWithIdentifier:conversationIdentifier:content:dateSent:sender:recipients:messageType:", identifier, 0, content, dateSent, sender, recipients, 0);
}

- (INMessage)initWithIdentifier:(id)a3 conversationIdentifier:(id)a4 content:(id)a5 dateSent:(id)a6 sender:(id)a7 recipients:(id)a8 groupName:(id)a9 dateMessageWasLastRead:(id)a10 messageType:(int64_t)a11 referencedMessage:(id)a12 serviceName:(id)a13 reaction:(id)a14
{
  return -[INMessage initWithIdentifier:conversationIdentifier:content:dateSent:sender:recipients:groupName:dateMessageWasLastRead:numberOfAttachments:messageType:messageEffectType:referencedMessage:serviceName:reaction:attachmentFiles:location:linkMetadata:](self, "initWithIdentifier:conversationIdentifier:content:dateSent:sender:recipients:groupName:dateMessageWasLastRead:numberOfAttachments:messageType:messageEffectType:referencedMessage:serviceName:reaction:attachmentFiles:location:linkMetadata:", a3, a4, a5, a6, a7, a8, a9, a10, 0, a11, 0, a12, a13, a14, 0,
           0,
           0);
}

- (INMessage)initWithIdentifier:(NSString *)identifier conversationIdentifier:(NSString *)conversationIdentifier content:(NSString *)content dateSent:(NSDate *)dateSent sender:(INPerson *)sender recipients:(NSArray *)recipients groupName:(INSpeakableString *)groupName messageType:(INMessageType)messageType serviceName:(NSString *)serviceName attachmentFiles:(NSArray *)attachmentFiles
{
  NSArray *v18;
  NSString *v19;
  INSpeakableString *v20;
  NSArray *v21;
  INPerson *v22;
  NSDate *v23;
  NSString *v24;
  NSString *v25;
  NSString *v26;
  void *v27;
  void *v29;
  INMessage *v31;

  v29 = (void *)MEMORY[0x1E0CB37E8];
  v18 = attachmentFiles;
  v19 = serviceName;
  v20 = groupName;
  v21 = recipients;
  v22 = sender;
  v23 = dateSent;
  v24 = content;
  v25 = conversationIdentifier;
  v26 = identifier;
  objc_msgSend(v29, "numberWithUnsignedLong:", -[NSArray count](v18, "count"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[INMessage initWithIdentifier:conversationIdentifier:content:dateSent:sender:recipients:groupName:dateMessageWasLastRead:numberOfAttachments:messageType:messageEffectType:referencedMessage:serviceName:reaction:attachmentFiles:location:linkMetadata:](self, "initWithIdentifier:conversationIdentifier:content:dateSent:sender:recipients:groupName:dateMessageWasLastRead:numberOfAttachments:messageType:messageEffectType:referencedMessage:serviceName:reaction:attachmentFiles:location:linkMetadata:", v26, v25, v24, v23, v22, v21, v20, 0, v27, messageType, 0, 0, v19, 0, v18,
          0,
          0);

  return v31;
}

- (INMessage)initWithIdentifier:(id)a3 conversationIdentifier:(id)a4 content:(id)a5 dateSent:(id)a6 sender:(id)a7 recipients:(id)a8 groupName:(id)a9 serviceName:(id)a10 location:(id)a11
{
  return -[INMessage initWithIdentifier:conversationIdentifier:content:dateSent:sender:recipients:groupName:dateMessageWasLastRead:numberOfAttachments:messageType:messageEffectType:referencedMessage:serviceName:reaction:attachmentFiles:location:linkMetadata:](self, "initWithIdentifier:conversationIdentifier:content:dateSent:sender:recipients:groupName:dateMessageWasLastRead:numberOfAttachments:messageType:messageEffectType:referencedMessage:serviceName:reaction:attachmentFiles:location:linkMetadata:", a3, a4, a5, a6, a7, a8, a9, 0, 0, 13, 0, 0, a10, 0, 0,
           a11,
           0);
}

- (INMessage)initWithIdentifier:(NSString *)identifier conversationIdentifier:(NSString *)conversationIdentifier content:(NSString *)content dateSent:(NSDate *)dateSent sender:(INPerson *)sender recipients:(NSArray *)recipients groupName:(INSpeakableString *)groupName serviceName:(NSString *)serviceName linkMetadata:(INMessageLinkMetadata *)linkMetadata
{
  return -[INMessage initWithIdentifier:conversationIdentifier:content:dateSent:sender:recipients:groupName:dateMessageWasLastRead:numberOfAttachments:messageType:messageEffectType:referencedMessage:serviceName:reaction:attachmentFiles:location:linkMetadata:](self, "initWithIdentifier:conversationIdentifier:content:dateSent:sender:recipients:groupName:dateMessageWasLastRead:numberOfAttachments:messageType:messageEffectType:referencedMessage:serviceName:reaction:attachmentFiles:location:linkMetadata:", identifier, conversationIdentifier, content, dateSent, sender, recipients, groupName, 0, 0, 25, 0, 0, serviceName, 0, 0,
           0,
           linkMetadata);
}

- (INMessage)initWithIdentifier:(NSString *)identifier conversationIdentifier:(NSString *)conversationIdentifier content:(NSString *)content dateSent:(NSDate *)dateSent sender:(INPerson *)sender recipients:(NSArray *)recipients groupName:(INSpeakableString *)groupName serviceName:(NSString *)serviceName messageType:(INMessageType)messageType numberOfAttachments:(NSNumber *)numberOfAttachments
{
  return -[INMessage initWithIdentifier:conversationIdentifier:content:dateSent:sender:recipients:groupName:dateMessageWasLastRead:numberOfAttachments:messageType:messageEffectType:referencedMessage:serviceName:reaction:attachmentFiles:location:linkMetadata:](self, "initWithIdentifier:conversationIdentifier:content:dateSent:sender:recipients:groupName:dateMessageWasLastRead:numberOfAttachments:messageType:messageEffectType:referencedMessage:serviceName:reaction:attachmentFiles:location:linkMetadata:", identifier, conversationIdentifier, content, dateSent, sender, recipients, groupName, 0, numberOfAttachments, messageType, 0, 0, serviceName, 0, 0,
           0,
           0);
}

- (INMessage)initWithIdentifier:(id)a3 conversationIdentifier:(id)a4 content:(id)a5 dateSent:(id)a6 sender:(id)a7 recipients:(id)a8 groupName:(id)a9 serviceName:(id)a10 messageType:(int64_t)a11 referencedMessage:(id)a12 reaction:(id)a13
{
  return -[INMessage initWithIdentifier:conversationIdentifier:content:dateSent:sender:recipients:groupName:dateMessageWasLastRead:numberOfAttachments:messageType:messageEffectType:referencedMessage:serviceName:attachmentFiles:location:linkMetadata:reaction:sticker:](self, "initWithIdentifier:conversationIdentifier:content:dateSent:sender:recipients:groupName:dateMessageWasLastRead:numberOfAttachments:messageType:messageEffectType:referencedMessage:serviceName:attachmentFiles:location:linkMetadata:reaction:sticker:", a3, a4, a5, a6, a7, a8, a9, 0, 0, a11, 0, a12, a10, 0, 0,
           0,
           a13,
           0);
}

- (INMessage)initWithIdentifier:(id)a3 conversationIdentifier:(id)a4 content:(id)a5 dateSent:(id)a6 sender:(id)a7 recipients:(id)a8 groupName:(id)a9 serviceName:(id)a10 messageType:(int64_t)a11 referencedMessage:(id)a12 sticker:(id)a13 reaction:(id)a14
{
  return -[INMessage initWithIdentifier:conversationIdentifier:content:dateSent:sender:recipients:groupName:dateMessageWasLastRead:numberOfAttachments:messageType:messageEffectType:referencedMessage:serviceName:attachmentFiles:location:linkMetadata:reaction:sticker:](self, "initWithIdentifier:conversationIdentifier:content:dateSent:sender:recipients:groupName:dateMessageWasLastRead:numberOfAttachments:messageType:messageEffectType:referencedMessage:serviceName:attachmentFiles:location:linkMetadata:reaction:sticker:", a3, a4, a5, a6, a7, a8, a9, 0, 0, a11, 0, a12, a10, 0, 0,
           0,
           a14,
           a13);
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  NSUInteger v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;

  v3 = -[NSString hash](self->_identifier, "hash");
  v4 = -[NSString hash](self->_conversationIdentifier, "hash") ^ v3;
  v5 = -[NSString hash](self->_content, "hash");
  v6 = v4 ^ v5 ^ -[NSDate hash](self->_dateSent, "hash");
  v7 = -[INPerson hash](self->_sender, "hash");
  v8 = v7 ^ -[NSArray hash](self->_recipients, "hash");
  v9 = v6 ^ v8 ^ -[INSpeakableString hash](self->_groupName, "hash");
  v10 = -[NSDate hash](self->_dateMessageWasLastRead, "hash");
  v11 = v10 ^ -[NSNumber hash](self->_numberOfAttachments, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_messageType);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v9 ^ v11 ^ objc_msgSend(v12, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_messageEffectType);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hash");
  v16 = v15 ^ -[INMessage hash](self->_referencedMessage, "hash");
  v17 = v13 ^ v16 ^ -[NSString hash](self->_serviceName, "hash");
  v18 = -[NSArray hash](self->_attachmentFiles, "hash");
  v19 = v18 ^ -[INMessageReaction hash](self->_reaction, "hash");
  v20 = v19 ^ -[CLPlacemark hash](self->_location, "hash");
  v21 = v17 ^ v20 ^ -[INMessageLinkMetadata hash](self->_linkMetadata, "hash");

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  INMessage *v4;
  INMessage *v5;
  NSString *identifier;
  NSString *conversationIdentifier;
  NSString *content;
  NSDate *dateSent;
  INPerson *sender;
  NSArray *recipients;
  INSpeakableString *groupName;
  NSDate *dateMessageWasLastRead;
  NSNumber *numberOfAttachments;
  INMessage *referencedMessage;
  NSString *serviceName;
  INMessageReaction *reaction;
  NSArray *attachmentFiles;
  CLPlacemark *location;
  INMessageLinkMetadata *linkMetadata;
  BOOL v21;

  v4 = (INMessage *)a3;
  if (v4 == self)
  {
    v21 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      identifier = self->_identifier;
      if (identifier != v5->_identifier && !-[NSString isEqual:](identifier, "isEqual:"))
        goto LABEL_38;
      conversationIdentifier = self->_conversationIdentifier;
      if (conversationIdentifier != v5->_conversationIdentifier
        && !-[NSString isEqual:](conversationIdentifier, "isEqual:"))
      {
        goto LABEL_38;
      }
      content = self->_content;
      if (content != v5->_content && !-[NSString isEqual:](content, "isEqual:"))
        goto LABEL_38;
      dateSent = self->_dateSent;
      if (dateSent != v5->_dateSent && !-[NSDate isEqual:](dateSent, "isEqual:"))
        goto LABEL_38;
      sender = self->_sender;
      if (sender != v5->_sender && !-[INPerson isEqual:](sender, "isEqual:"))
        goto LABEL_38;
      recipients = self->_recipients;
      if (recipients != v5->_recipients && !-[NSArray isEqual:](recipients, "isEqual:"))
        goto LABEL_38;
      groupName = self->_groupName;
      if (groupName != v5->_groupName && !-[INSpeakableString isEqual:](groupName, "isEqual:"))
        goto LABEL_38;
      dateMessageWasLastRead = self->_dateMessageWasLastRead;
      if (dateMessageWasLastRead != v5->_dateMessageWasLastRead
        && !-[NSDate isEqual:](dateMessageWasLastRead, "isEqual:"))
      {
        goto LABEL_38;
      }
      if (((numberOfAttachments = self->_numberOfAttachments, numberOfAttachments == v5->_numberOfAttachments)
         || -[NSNumber isEqual:](numberOfAttachments, "isEqual:"))
        && self->_messageType == v5->_messageType
        && self->_messageEffectType == v5->_messageEffectType
        && ((referencedMessage = self->_referencedMessage, referencedMessage == v5->_referencedMessage)
         || -[INMessage isEqual:](referencedMessage, "isEqual:"))
        && ((serviceName = self->_serviceName, serviceName == v5->_serviceName)
         || -[NSString isEqual:](serviceName, "isEqual:"))
        && ((reaction = self->_reaction, reaction == v5->_reaction)
         || -[INMessageReaction isEqual:](reaction, "isEqual:"))
        && ((attachmentFiles = self->_attachmentFiles, attachmentFiles == v5->_attachmentFiles)
         || -[NSArray isEqual:](attachmentFiles, "isEqual:"))
        && ((location = self->_location, location == v5->_location)
         || -[CLPlacemark isEqual:](location, "isEqual:"))
        && ((linkMetadata = self->_linkMetadata, linkMetadata == v5->_linkMetadata)
         || -[INMessageLinkMetadata isEqual:](linkMetadata, "isEqual:")))
      {
        v21 = 1;
      }
      else
      {
LABEL_38:
        v21 = 0;
      }

    }
    else
    {
      v21 = 0;
    }
  }

  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_conversationIdentifier, CFSTR("conversationIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_content, CFSTR("content"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateSent, CFSTR("dateSent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sender, CFSTR("sender"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recipients, CFSTR("recipients"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_groupName, CFSTR("groupName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateMessageWasLastRead, CFSTR("dateMessageWasLastRead"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_numberOfAttachments, CFSTR("numberOfAttachments"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_messageType, CFSTR("messageType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_messageEffectType, CFSTR("messageEffectType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_referencedMessage, CFSTR("referencedMessage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serviceName, CFSTR("serviceName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_reaction, CFSTR("reaction"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_attachmentFiles, CFSTR("attachmentFiles"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_location, CFSTR("location"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_linkMetadata, CFSTR("linkMetadata"));

}

- (INMessage)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  INMessage *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];

  v32[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v23 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("conversationIdentifier"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("content"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateSent"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sender"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E60];
  v32[0] = objc_opt_class();
  v32[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v6, CFSTR("recipients"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("groupName"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateMessageWasLastRead"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("numberOfAttachments"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("messageType"));
  v8 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("messageEffectType"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("referencedMessage"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serviceName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("audioMessageFile"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("attachmentFiles"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reaction"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("location"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("linkMetadata"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v8;
    v17 = (void *)v23;
    v18 = objc_retain(-[INMessage initWithIdentifier:conversationIdentifier:content:dateSent:sender:recipients:groupName:dateMessageWasLastRead:numberOfAttachments:messageType:messageEffectType:referencedMessage:serviceName:reaction:attachmentFiles:location:linkMetadata:](self, "initWithIdentifier:conversationIdentifier:content:dateSent:sender:recipients:groupName:dateMessageWasLastRead:numberOfAttachments:messageType:messageEffectType:referencedMessage:serviceName:reaction:attachmentFiles:location:linkMetadata:", v23, v31, v30, v29, v28, v27, v26, v25, v24, v7, v20, v9, v10, v13,
              v16,
              v14,
              v15));

  }
  else
  {
    v21 = v8;
    v17 = (void *)v23;
    v18 = objc_retain(-[INMessage initWithIdentifier:conversationIdentifier:content:dateSent:sender:recipients:groupName:dateMessageWasLastRead:numberOfAttachments:messageType:messageEffectType:referencedMessage:serviceName:reaction:attachmentFiles:location:linkMetadata:](self, "initWithIdentifier:conversationIdentifier:content:dateSent:sender:recipients:groupName:dateMessageWasLastRead:numberOfAttachments:messageType:messageEffectType:referencedMessage:serviceName:reaction:attachmentFiles:location:linkMetadata:", v23, v31, v30, v29, v28, v27, v26, v25, v24, v7, v21, v9, v10, v13,
              v12,
              v14,
              v15));
  }

  return v18;
}

- (NSString)description
{
  return (NSString *)-[INMessage descriptionAtIndent:](self, "descriptionAtIndent:", 0);
}

- (id)_redactedDictionaryRepresentation
{
  void *v2;
  void *v3;

  -[INMessage _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "setObject:forKey:", CFSTR("<redacted>"), CFSTR("content"));
  return v3;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)INMessage;
  -[INMessage description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INMessage _redactedDictionaryRepresentation](self, "_redactedDictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  uint64_t v3;
  uint64_t conversationIdentifier;
  NSString *content;
  uint64_t v6;
  NSDate *dateSent;
  uint64_t v8;
  INPerson *sender;
  uint64_t v10;
  NSArray *recipients;
  void *v12;
  INSpeakableString *groupName;
  void *v14;
  INMessageLinkMetadata *linkMetadata;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSString *identifier;
  _QWORD v26[8];
  _QWORD v27[10];

  v27[8] = *MEMORY[0x1E0C80C00];
  identifier = self->_identifier;
  v3 = (uint64_t)identifier;
  v26[0] = CFSTR("identifier");
  if (!identifier)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v27[0] = v3;
  v26[1] = CFSTR("conversationIdentifier");
  conversationIdentifier = (uint64_t)self->_conversationIdentifier;
  v23 = conversationIdentifier;
  if (!conversationIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    conversationIdentifier = objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)conversationIdentifier;
  v27[1] = conversationIdentifier;
  v26[2] = CFSTR("content");
  content = self->_content;
  v6 = (uint64_t)content;
  if (!content)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v6;
  v27[2] = v6;
  v26[3] = CFSTR("dateSent");
  dateSent = self->_dateSent;
  v8 = (uint64_t)dateSent;
  if (!dateSent)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v24 = (void *)v3;
  v20 = (void *)v8;
  v27[3] = v8;
  v26[4] = CFSTR("sender");
  sender = self->_sender;
  v10 = (uint64_t)sender;
  if (!sender)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v10;
  v27[4] = v10;
  v26[5] = CFSTR("recipients");
  recipients = self->_recipients;
  v12 = recipients;
  if (!recipients)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27[5] = v12;
  v26[6] = CFSTR("groupName");
  groupName = self->_groupName;
  v14 = groupName;
  if (!groupName)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27[6] = v14;
  v26[7] = CFSTR("linkMetadata");
  linkMetadata = self->_linkMetadata;
  v16 = linkMetadata;
  if (!linkMetadata)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27[7] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (linkMetadata)
  {
    if (groupName)
      goto LABEL_19;
  }
  else
  {

    if (groupName)
    {
LABEL_19:
      if (recipients)
        goto LABEL_20;
LABEL_30:

      if (sender)
        goto LABEL_21;
      goto LABEL_31;
    }
  }

  if (!recipients)
    goto LABEL_30;
LABEL_20:
  if (sender)
    goto LABEL_21;
LABEL_31:

LABEL_21:
  if (dateSent)
  {
    if (content)
      goto LABEL_23;
  }
  else
  {

    if (content)
      goto LABEL_23;
  }

LABEL_23:
  if (!v23)

  if (!identifier)
  return v17;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)conversationIdentifier
{
  return self->_conversationIdentifier;
}

- (NSString)content
{
  return self->_content;
}

- (NSDate)dateSent
{
  return self->_dateSent;
}

- (INPerson)sender
{
  return self->_sender;
}

- (void)setSender:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (void)setRecipients:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (INSpeakableString)groupName
{
  return self->_groupName;
}

- (INMessageType)messageType
{
  return self->_messageType;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (NSArray)attachmentFiles
{
  return self->_attachmentFiles;
}

- (NSNumber)numberOfAttachments
{
  return self->_numberOfAttachments;
}

- (INFile)audioMessageFile
{
  return self->_audioMessageFile;
}

- (INMessageLinkMetadata)linkMetadata
{
  return self->_linkMetadata;
}

- (void)setLinkMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (INSticker)sticker
{
  return self->_sticker;
}

- (void)setSticker:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (INMessageReaction)reaction
{
  return self->_reaction;
}

- (void)setReaction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSDate)dateMessageWasLastRead
{
  return self->_dateMessageWasLastRead;
}

- (int64_t)messageEffectType
{
  return self->_messageEffectType;
}

- (INMessage)referencedMessage
{
  return self->_referencedMessage;
}

- (INCurrencyAmount)paymentAmount
{
  return self->_paymentAmount;
}

- (void)setPaymentAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSString)locationName
{
  return self->_locationName;
}

- (void)setLocationName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSString)fileExtension
{
  return self->_fileExtension;
}

- (void)setFileExtension:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (CLPlacemark)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_fileExtension, 0);
  objc_storeStrong((id *)&self->_locationName, 0);
  objc_storeStrong((id *)&self->_paymentAmount, 0);
  objc_storeStrong((id *)&self->_referencedMessage, 0);
  objc_storeStrong((id *)&self->_dateMessageWasLastRead, 0);
  objc_storeStrong((id *)&self->_reaction, 0);
  objc_storeStrong((id *)&self->_sticker, 0);
  objc_storeStrong((id *)&self->_linkMetadata, 0);
  objc_storeStrong((id *)&self->_audioMessageFile, 0);
  objc_storeStrong((id *)&self->_numberOfAttachments, 0);
  objc_storeStrong((id *)&self->_attachmentFiles, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_dateSent, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_conversationIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_injectProxiesForImages:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  INImageProxyInjectionOperation *v15;
  void *v16;
  INImageProxyInjectionOperation *v17;
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[5];
  id v21;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = (void *)-[INMessage copy](self, "copy");
    v9 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    INImageProxyInjectionQueue();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setUnderlyingQueue:", v10);

    objc_msgSend(v9, "setMaxConcurrentOperationCount:", 1);
    objc_msgSend(v9, "setSuspended:", 1);
    v11 = (void *)MEMORY[0x1E0CB34C8];
    v12 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __71__INMessage_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke;
    v20[3] = &unk_1E2293BE8;
    v20[4] = v8;
    v21 = v7;
    objc_msgSend(v11, "blockOperationWithBlock:", v20);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[INMessage recipients](self, "recipients");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = objc_alloc_init(INImageProxyInjectionOperation);
      -[INImageProxyInjectionOperation setInjector:](v15, "setInjector:", v14);
      -[INImageProxyInjectionOperation setImageProxyRequestBlock:](v15, "setImageProxyRequestBlock:", v6);
      v19[0] = v12;
      v19[1] = 3221225472;
      v19[2] = __71__INMessage_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke_2;
      v19[3] = &unk_1E22924C0;
      v19[4] = v8;
      -[INImageProxyInjectionOperation setCopyReturnBlock:](v15, "setCopyReturnBlock:", v19);
      objc_msgSend(v13, "addDependency:", v15);
      objc_msgSend(v9, "addOperation:", v15);

    }
    -[INMessage sender](self, "sender");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = objc_alloc_init(INImageProxyInjectionOperation);
      -[INImageProxyInjectionOperation setInjector:](v17, "setInjector:", v16);
      -[INImageProxyInjectionOperation setImageProxyRequestBlock:](v17, "setImageProxyRequestBlock:", v6);
      v18[0] = v12;
      v18[1] = 3221225472;
      v18[2] = __71__INMessage_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke_3;
      v18[3] = &unk_1E22924C0;
      v18[4] = v8;
      -[INImageProxyInjectionOperation setCopyReturnBlock:](v17, "setCopyReturnBlock:", v18);
      objc_msgSend(v13, "addDependency:", v17);
      objc_msgSend(v9, "addOperation:", v17);

    }
    objc_msgSend(v9, "addOperation:", v13);
    objc_msgSend(v9, "setSuspended:", 0);

  }
}

uint64_t __71__INMessage_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __71__INMessage_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "setRecipients:", a2);
  return result;
}

uint64_t __71__INMessage_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke_3(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "setSender:", a2);
  return result;
}

- (INImage)_keyImage
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[INMessage recipients](self, "recipients");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[INMessage recipients](self, "recipients");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v5);

    -[INMessage recipients](self, "recipients");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v6);

  }
  INKeyImageUtilitiesKeyImageBySubProducerComparison(self, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (INImage *)v7;
}

- (int64_t)_compareSubProducerOne:(id)a3 subProducerTwo:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  uint64_t (**v9)(_QWORD, _QWORD);
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v15[5];

  v6 = a4;
  v7 = a3;
  v8 = INKeyImageUtilitiesDefaultCompareSubProducers(v7, v6);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __72__INMessage_INKeyImageProducing___compareSubProducerOne_subProducerTwo___block_invoke;
  v15[3] = &unk_1E228F9B8;
  v15[4] = self;
  v9 = (uint64_t (**)(_QWORD, _QWORD))MEMORY[0x18D7812C4](v15);
  v10 = ((uint64_t (**)(_QWORD, id))v9)[2](v9, v7);

  v11 = ((uint64_t (**)(_QWORD, id))v9)[2](v9, v6);
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v12, "compare:", v13);

  }
  return v8;
}

uint64_t __72__INMessage_INKeyImageProducing___compareSubProducerOne_subProducerTwo___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  uint64_t v6;
  void *v7;
  char v8;
  void *v9;
  unsigned int v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "recipients");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  if ((v5 & 1) != 0)
  {
    v6 = 3;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_msgSend(*(id *)(a1 + 32), "recipients"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v7, "containsObject:", v3),
          v7,
          (v8 & 1) != 0))
    {
      v6 = 2;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "sender");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v3, "isEqual:", v9);

      v6 = v10;
    }
  }

  return v6;
}

- (BOOL)_intents_enumerateObjectsOfClass:(Class)a3 withBlock:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  BOOL v11;
  objc_super v13;

  v6 = a4;
  -[INMessage audioMessageFile](self, "audioMessageFile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_intents_enumerateObjectsOfClass:withBlock:", a3, v6);

  if ((v8 & 1) != 0
    || (-[INMessage attachmentFiles](self, "attachmentFiles"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "_intents_enumerateObjectsOfClass:withBlock:", a3, v6),
        v9,
        (v10 & 1) != 0))
  {
    v11 = 1;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)INMessage;
    v11 = -[NSObject _intents_enumerateObjectsOfClass:withBlock:](&v13, sel__intents_enumerateObjectsOfClass_withBlock_, a3, v6);
  }

  return v11;
}

@end
