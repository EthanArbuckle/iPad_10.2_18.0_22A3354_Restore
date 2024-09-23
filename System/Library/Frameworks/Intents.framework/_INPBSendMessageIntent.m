@implementation _INPBSendMessageIntent

- (void)setAlternativeConversationIdentifier:(id)a3
{
  NSString *v4;
  NSString *alternativeConversationIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  alternativeConversationIdentifier = self->_alternativeConversationIdentifier;
  self->_alternativeConversationIdentifier = v4;

}

- (BOOL)hasAlternativeConversationIdentifier
{
  return self->_alternativeConversationIdentifier != 0;
}

- (void)setAttachments:(id)a3
{
  NSArray *v4;
  NSArray *attachments;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  attachments = self->_attachments;
  self->_attachments = v4;

}

- (void)clearAttachments
{
  -[NSArray removeAllObjects](self->_attachments, "removeAllObjects");
}

- (void)addAttachments:(id)a3
{
  id v4;
  NSArray *attachments;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  attachments = self->_attachments;
  v8 = v4;
  if (!attachments)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_attachments;
    self->_attachments = v6;

    v4 = v8;
    attachments = self->_attachments;
  }
  -[NSArray addObject:](attachments, "addObject:", v4);

}

- (unint64_t)attachmentsCount
{
  return -[NSArray count](self->_attachments, "count");
}

- (id)attachmentsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_attachments, "objectAtIndexedSubscript:", a3);
}

- (void)setContent:(id)a3
{
  objc_storeStrong((id *)&self->_content, a3);
}

- (BOOL)hasContent
{
  return self->_content != 0;
}

- (void)setConversationIdentifier:(id)a3
{
  NSString *v4;
  NSString *conversationIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  conversationIdentifier = self->_conversationIdentifier;
  self->_conversationIdentifier = v4;

}

- (BOOL)hasConversationIdentifier
{
  return self->_conversationIdentifier != 0;
}

- (void)setEffect:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xFE;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 1;
    self->_effect = a3;
  }
}

- (BOOL)hasEffect
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasEffect:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)effectAsString:(int)a3
{
  if ((a3 - 1) < 0xD)
    return off_1E228DBE8[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsEffect:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAPPY_BIRTHDAY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONFETTI")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LASERS")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FIREWORKS")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHOOTING_STAR")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INVISBLE_INK")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GENTLE")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOUD")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IMPACT")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPARKLES")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HEART")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ECHO")) & 1) != 0)
  {
    v4 = 12;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SPOTLIGHT")))
  {
    v4 = 13;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setGroupName:(id)a3
{
  objc_storeStrong((id *)&self->_groupName, a3);
}

- (BOOL)hasGroupName
{
  return self->_groupName != 0;
}

- (void)setIntentMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_intentMetadata, a3);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setNotificationThreadIdentifier:(id)a3
{
  NSString *v4;
  NSString *notificationThreadIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  notificationThreadIdentifier = self->_notificationThreadIdentifier;
  self->_notificationThreadIdentifier = v4;

}

- (BOOL)hasNotificationThreadIdentifier
{
  return self->_notificationThreadIdentifier != 0;
}

- (void)setOutgoingMessageType:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xFD;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 2;
    self->_outgoingMessageType = a3;
  }
}

- (BOOL)hasOutgoingMessageType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasOutgoingMessageType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (id)outgoingMessageTypeAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("OUTGOING_MESSAGE_TEXT");
  if (a3 == 2)
  {
    v3 = CFSTR("OUTGOING_MESSAGE_AUDIO");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsOutgoingMessageType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = 1;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OUTGOING_MESSAGE_TEXT")) & 1) == 0)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("OUTGOING_MESSAGE_AUDIO")))
      v4 = 2;
    else
      v4 = 1;
  }

  return v4;
}

- (void)setRecipients:(id)a3
{
  NSArray *v4;
  NSArray *recipients;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  recipients = self->_recipients;
  self->_recipients = v4;

}

- (void)clearRecipients
{
  -[NSArray removeAllObjects](self->_recipients, "removeAllObjects");
}

- (void)addRecipient:(id)a3
{
  id v4;
  NSArray *recipients;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  recipients = self->_recipients;
  v8 = v4;
  if (!recipients)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_recipients;
    self->_recipients = v6;

    v4 = v8;
    recipients = self->_recipients;
  }
  -[NSArray addObject:](recipients, "addObject:", v4);

}

- (unint64_t)recipientsCount
{
  return -[NSArray count](self->_recipients, "count");
}

- (id)recipientAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_recipients, "objectAtIndexedSubscript:", a3);
}

- (void)setSender:(id)a3
{
  objc_storeStrong((id *)&self->_sender, a3);
}

- (BOOL)hasSender
{
  return self->_sender != 0;
}

- (void)setServiceName:(id)a3
{
  NSString *v4;
  NSString *serviceName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  serviceName = self->_serviceName;
  self->_serviceName = v4;

}

- (BOOL)hasServiceName
{
  return self->_serviceName != 0;
}

- (void)setSpeakableGroupName:(id)a3
{
  objc_storeStrong((id *)&self->_speakableGroupName, a3);
}

- (BOOL)hasSpeakableGroupName
{
  return self->_speakableGroupName != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSendMessageIntentReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_INPBSendMessageIntent alternativeConversationIdentifier](self, "alternativeConversationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v6 = self->_attachments;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v34;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v34 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v8);
  }

  -[_INPBSendMessageIntent content](self, "content");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[_INPBSendMessageIntent content](self, "content");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBSendMessageIntent conversationIdentifier](self, "conversationIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    PBDataWriterWriteStringField();
  if (-[_INPBSendMessageIntent hasEffect](self, "hasEffect"))
    PBDataWriterWriteInt32Field();
  -[_INPBSendMessageIntent groupName](self, "groupName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[_INPBSendMessageIntent groupName](self, "groupName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBSendMessageIntent intentMetadata](self, "intentMetadata");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[_INPBSendMessageIntent intentMetadata](self, "intentMetadata");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBSendMessageIntent notificationThreadIdentifier](self, "notificationThreadIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
    PBDataWriterWriteStringField();
  if (-[_INPBSendMessageIntent hasOutgoingMessageType](self, "hasOutgoingMessageType"))
    PBDataWriterWriteInt32Field();
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v19 = self->_recipients;
  v20 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v30;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v30 != v22)
          objc_enumerationMutation(v19);
        PBDataWriterWriteSubmessage();
        ++v23;
      }
      while (v21 != v23);
      v21 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v21);
  }

  -[_INPBSendMessageIntent sender](self, "sender", v29);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[_INPBSendMessageIntent sender](self, "sender");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBSendMessageIntent serviceName](self, "serviceName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
    PBDataWriterWriteStringField();
  -[_INPBSendMessageIntent speakableGroupName](self, "speakableGroupName");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    -[_INPBSendMessageIntent speakableGroupName](self, "speakableGroupName");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (_INPBSendMessageIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBSendMessageIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBSendMessageIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBSendMessageIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBSendMessageIntent initWithData:](self, "initWithData:", v6);

    v6 = self;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_INPBSendMessageIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBSendMessageIntent *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;

  v5 = -[_INPBSendMessageIntent init](+[_INPBSendMessageIntent allocWithZone:](_INPBSendMessageIntent, "allocWithZone:"), "init");
  v6 = (void *)-[NSString copyWithZone:](self->_alternativeConversationIdentifier, "copyWithZone:", a3);
  -[_INPBSendMessageIntent setAlternativeConversationIdentifier:](v5, "setAlternativeConversationIdentifier:", v6);

  v7 = (void *)-[NSArray copyWithZone:](self->_attachments, "copyWithZone:", a3);
  -[_INPBSendMessageIntent setAttachments:](v5, "setAttachments:", v7);

  v8 = -[_INPBString copyWithZone:](self->_content, "copyWithZone:", a3);
  -[_INPBSendMessageIntent setContent:](v5, "setContent:", v8);

  v9 = (void *)-[NSString copyWithZone:](self->_conversationIdentifier, "copyWithZone:", a3);
  -[_INPBSendMessageIntent setConversationIdentifier:](v5, "setConversationIdentifier:", v9);

  if (-[_INPBSendMessageIntent hasEffect](self, "hasEffect"))
    -[_INPBSendMessageIntent setEffect:](v5, "setEffect:", -[_INPBSendMessageIntent effect](self, "effect"));
  v10 = -[_INPBString copyWithZone:](self->_groupName, "copyWithZone:", a3);
  -[_INPBSendMessageIntent setGroupName:](v5, "setGroupName:", v10);

  v11 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBSendMessageIntent setIntentMetadata:](v5, "setIntentMetadata:", v11);

  v12 = (void *)-[NSString copyWithZone:](self->_notificationThreadIdentifier, "copyWithZone:", a3);
  -[_INPBSendMessageIntent setNotificationThreadIdentifier:](v5, "setNotificationThreadIdentifier:", v12);

  if (-[_INPBSendMessageIntent hasOutgoingMessageType](self, "hasOutgoingMessageType"))
    -[_INPBSendMessageIntent setOutgoingMessageType:](v5, "setOutgoingMessageType:", -[_INPBSendMessageIntent outgoingMessageType](self, "outgoingMessageType"));
  v13 = (void *)-[NSArray copyWithZone:](self->_recipients, "copyWithZone:", a3);
  -[_INPBSendMessageIntent setRecipients:](v5, "setRecipients:", v13);

  v14 = -[_INPBContact copyWithZone:](self->_sender, "copyWithZone:", a3);
  -[_INPBSendMessageIntent setSender:](v5, "setSender:", v14);

  v15 = (void *)-[NSString copyWithZone:](self->_serviceName, "copyWithZone:", a3);
  -[_INPBSendMessageIntent setServiceName:](v5, "setServiceName:", v15);

  v16 = -[_INPBDataString copyWithZone:](self->_speakableGroupName, "copyWithZone:", a3);
  -[_INPBSendMessageIntent setSpeakableGroupName:](v5, "setSpeakableGroupName:", v16);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  int v27;
  int effect;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  int v44;
  int outgoingMessageType;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  int v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  char v65;
  BOOL v66;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_65;
  -[_INPBSendMessageIntent alternativeConversationIdentifier](self, "alternativeConversationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alternativeConversationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_64;
  -[_INPBSendMessageIntent alternativeConversationIdentifier](self, "alternativeConversationIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBSendMessageIntent alternativeConversationIdentifier](self, "alternativeConversationIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alternativeConversationIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_65;
  }
  else
  {

  }
  -[_INPBSendMessageIntent attachments](self, "attachments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attachments");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_64;
  -[_INPBSendMessageIntent attachments](self, "attachments");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBSendMessageIntent attachments](self, "attachments");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "attachments");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_65;
  }
  else
  {

  }
  -[_INPBSendMessageIntent content](self, "content");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "content");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_64;
  -[_INPBSendMessageIntent content](self, "content");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBSendMessageIntent content](self, "content");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "content");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_65;
  }
  else
  {

  }
  -[_INPBSendMessageIntent conversationIdentifier](self, "conversationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "conversationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_64;
  -[_INPBSendMessageIntent conversationIdentifier](self, "conversationIdentifier");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_INPBSendMessageIntent conversationIdentifier](self, "conversationIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "conversationIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_65;
  }
  else
  {

  }
  v27 = -[_INPBSendMessageIntent hasEffect](self, "hasEffect");
  if (v27 != objc_msgSend(v4, "hasEffect"))
    goto LABEL_65;
  if (-[_INPBSendMessageIntent hasEffect](self, "hasEffect"))
  {
    if (objc_msgSend(v4, "hasEffect"))
    {
      effect = self->_effect;
      if (effect != objc_msgSend(v4, "effect"))
        goto LABEL_65;
    }
  }
  -[_INPBSendMessageIntent groupName](self, "groupName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groupName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_64;
  -[_INPBSendMessageIntent groupName](self, "groupName");
  v29 = objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    v30 = (void *)v29;
    -[_INPBSendMessageIntent groupName](self, "groupName");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "groupName");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v31, "isEqual:", v32);

    if (!v33)
      goto LABEL_65;
  }
  else
  {

  }
  -[_INPBSendMessageIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_64;
  -[_INPBSendMessageIntent intentMetadata](self, "intentMetadata");
  v34 = objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    v35 = (void *)v34;
    -[_INPBSendMessageIntent intentMetadata](self, "intentMetadata");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v36, "isEqual:", v37);

    if (!v38)
      goto LABEL_65;
  }
  else
  {

  }
  -[_INPBSendMessageIntent notificationThreadIdentifier](self, "notificationThreadIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationThreadIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_64;
  -[_INPBSendMessageIntent notificationThreadIdentifier](self, "notificationThreadIdentifier");
  v39 = objc_claimAutoreleasedReturnValue();
  if (v39)
  {
    v40 = (void *)v39;
    -[_INPBSendMessageIntent notificationThreadIdentifier](self, "notificationThreadIdentifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "notificationThreadIdentifier");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v41, "isEqual:", v42);

    if (!v43)
      goto LABEL_65;
  }
  else
  {

  }
  v44 = -[_INPBSendMessageIntent hasOutgoingMessageType](self, "hasOutgoingMessageType");
  if (v44 != objc_msgSend(v4, "hasOutgoingMessageType"))
    goto LABEL_65;
  if (-[_INPBSendMessageIntent hasOutgoingMessageType](self, "hasOutgoingMessageType"))
  {
    if (objc_msgSend(v4, "hasOutgoingMessageType"))
    {
      outgoingMessageType = self->_outgoingMessageType;
      if (outgoingMessageType != objc_msgSend(v4, "outgoingMessageType"))
        goto LABEL_65;
    }
  }
  -[_INPBSendMessageIntent recipients](self, "recipients");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recipients");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_64;
  -[_INPBSendMessageIntent recipients](self, "recipients");
  v46 = objc_claimAutoreleasedReturnValue();
  if (v46)
  {
    v47 = (void *)v46;
    -[_INPBSendMessageIntent recipients](self, "recipients");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recipients");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v48, "isEqual:", v49);

    if (!v50)
      goto LABEL_65;
  }
  else
  {

  }
  -[_INPBSendMessageIntent sender](self, "sender");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sender");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_64;
  -[_INPBSendMessageIntent sender](self, "sender");
  v51 = objc_claimAutoreleasedReturnValue();
  if (v51)
  {
    v52 = (void *)v51;
    -[_INPBSendMessageIntent sender](self, "sender");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sender");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v53, "isEqual:", v54);

    if (!v55)
      goto LABEL_65;
  }
  else
  {

  }
  -[_INPBSendMessageIntent serviceName](self, "serviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serviceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_64;
  -[_INPBSendMessageIntent serviceName](self, "serviceName");
  v56 = objc_claimAutoreleasedReturnValue();
  if (v56)
  {
    v57 = (void *)v56;
    -[_INPBSendMessageIntent serviceName](self, "serviceName");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "serviceName");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v58, "isEqual:", v59);

    if (!v60)
      goto LABEL_65;
  }
  else
  {

  }
  -[_INPBSendMessageIntent speakableGroupName](self, "speakableGroupName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "speakableGroupName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBSendMessageIntent speakableGroupName](self, "speakableGroupName");
    v61 = objc_claimAutoreleasedReturnValue();
    if (!v61)
    {

LABEL_68:
      v66 = 1;
      goto LABEL_66;
    }
    v62 = (void *)v61;
    -[_INPBSendMessageIntent speakableGroupName](self, "speakableGroupName");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "speakableGroupName");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend(v63, "isEqual:", v64);

    if ((v65 & 1) != 0)
      goto LABEL_68;
  }
  else
  {
LABEL_64:

  }
LABEL_65:
  v66 = 0;
LABEL_66:

  return v66;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  unint64_t v5;
  NSUInteger v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  NSUInteger v10;
  uint64_t v11;
  NSUInteger v12;
  uint64_t v13;
  unint64_t v14;
  NSUInteger v15;

  v3 = -[NSString hash](self->_alternativeConversationIdentifier, "hash");
  v4 = -[NSArray hash](self->_attachments, "hash");
  v5 = -[_INPBString hash](self->_content, "hash");
  v6 = -[NSString hash](self->_conversationIdentifier, "hash");
  if (-[_INPBSendMessageIntent hasEffect](self, "hasEffect"))
    v7 = 2654435761 * self->_effect;
  else
    v7 = 0;
  v8 = -[_INPBString hash](self->_groupName, "hash");
  v9 = -[_INPBIntentMetadata hash](self->_intentMetadata, "hash");
  v10 = -[NSString hash](self->_notificationThreadIdentifier, "hash");
  if (-[_INPBSendMessageIntent hasOutgoingMessageType](self, "hasOutgoingMessageType"))
    v11 = 2654435761 * self->_outgoingMessageType;
  else
    v11 = 0;
  v12 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  v13 = v10 ^ v11 ^ -[NSArray hash](self->_recipients, "hash");
  v14 = v12 ^ v13 ^ -[_INPBContact hash](self->_sender, "hash");
  v15 = -[NSString hash](self->_serviceName, "hash");
  return v14 ^ v15 ^ -[_INPBDataString hash](self->_speakableGroupName, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  __CFString *v26;
  void *v27;
  NSArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_alternativeConversationIdentifier)
  {
    -[_INPBSendMessageIntent alternativeConversationIdentifier](self, "alternativeConversationIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("alternativeConversationIdentifier"));

  }
  if (-[NSArray count](self->_attachments, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v7 = self->_attachments;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v46 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("attachments"));
  }
  -[_INPBSendMessageIntent content](self, "content");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dictionaryRepresentation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("content"));

  if (self->_conversationIdentifier)
  {
    -[_INPBSendMessageIntent conversationIdentifier](self, "conversationIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("conversationIdentifier"));

  }
  if (-[_INPBSendMessageIntent hasEffect](self, "hasEffect"))
  {
    v17 = -[_INPBSendMessageIntent effect](self, "effect");
    if ((v17 - 1) >= 0xD)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v17);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = off_1E228DBE8[(v17 - 1)];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("effect"));

  }
  -[_INPBSendMessageIntent groupName](self, "groupName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "dictionaryRepresentation");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("groupName"));

  -[_INPBSendMessageIntent intentMetadata](self, "intentMetadata");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "dictionaryRepresentation");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("intentMetadata"));

  if (self->_notificationThreadIdentifier)
  {
    -[_INPBSendMessageIntent notificationThreadIdentifier](self, "notificationThreadIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v23, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("notificationThreadIdentifier"));

  }
  if (-[_INPBSendMessageIntent hasOutgoingMessageType](self, "hasOutgoingMessageType"))
  {
    v25 = -[_INPBSendMessageIntent outgoingMessageType](self, "outgoingMessageType");
    if ((_DWORD)v25 == 1)
    {
      v26 = CFSTR("OUTGOING_MESSAGE_TEXT");
    }
    else if ((_DWORD)v25 == 2)
    {
      v26 = CFSTR("OUTGOING_MESSAGE_AUDIO");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v25);
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("outgoingMessageType"));

  }
  if (-[NSArray count](self->_recipients, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v28 = self->_recipients;
    v29 = -[NSArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v42;
      do
      {
        for (j = 0; j != v30; ++j)
        {
          if (*(_QWORD *)v42 != v31)
            objc_enumerationMutation(v28);
          objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * j), "dictionaryRepresentation");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "addObject:", v33);

        }
        v30 = -[NSArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
      }
      while (v30);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("recipient"));
  }
  -[_INPBSendMessageIntent sender](self, "sender");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "dictionaryRepresentation");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("sender"));

  if (self->_serviceName)
  {
    -[_INPBSendMessageIntent serviceName](self, "serviceName");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)objc_msgSend(v36, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("serviceName"));

  }
  -[_INPBSendMessageIntent speakableGroupName](self, "speakableGroupName");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "dictionaryRepresentation");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("speakableGroupName"));

  return v3;
}

- (NSString)alternativeConversationIdentifier
{
  return self->_alternativeConversationIdentifier;
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (_INPBString)content
{
  return self->_content;
}

- (NSString)conversationIdentifier
{
  return self->_conversationIdentifier;
}

- (int)effect
{
  return self->_effect;
}

- (_INPBString)groupName
{
  return self->_groupName;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (NSString)notificationThreadIdentifier
{
  return self->_notificationThreadIdentifier;
}

- (int)outgoingMessageType
{
  return self->_outgoingMessageType;
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (_INPBContact)sender
{
  return self->_sender;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (_INPBDataString)speakableGroupName
{
  return self->_speakableGroupName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speakableGroupName, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_notificationThreadIdentifier, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_conversationIdentifier, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_alternativeConversationIdentifier, 0);
}

+ (Class)attachmentsType
{
  return (Class)objc_opt_class();
}

+ (Class)recipientType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
