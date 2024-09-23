@implementation _INPBMessage

- (void)setAttachmentFiles:(id)a3
{
  NSArray *v4;
  NSArray *attachmentFiles;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  attachmentFiles = self->_attachmentFiles;
  self->_attachmentFiles = v4;

}

- (void)clearAttachmentFiles
{
  -[NSArray removeAllObjects](self->_attachmentFiles, "removeAllObjects");
}

- (void)addAttachmentFile:(id)a3
{
  id v4;
  NSArray *attachmentFiles;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  attachmentFiles = self->_attachmentFiles;
  v8 = v4;
  if (!attachmentFiles)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_attachmentFiles;
    self->_attachmentFiles = v6;

    v4 = v8;
    attachmentFiles = self->_attachmentFiles;
  }
  -[NSArray addObject:](attachmentFiles, "addObject:", v4);

}

- (unint64_t)attachmentFilesCount
{
  return -[NSArray count](self->_attachmentFiles, "count");
}

- (id)attachmentFileAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_attachmentFiles, "objectAtIndexedSubscript:", a3);
}

- (void)setAttributes:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (int)attributes
{
  return self->_attributes.list;
}

- (void)clearAttributes
{
  PBRepeatedInt32Clear();
}

- (void)addAttribute:(int)a3
{
  if (a3 != 0x7FFFFFFF)
    PBRepeatedInt32Add();
}

- (unint64_t)attributesCount
{
  return self->_attributes.count;
}

- (int)attributeAtIndex:(unint64_t)a3
{
  return self->_attributes.list[a3];
}

- (id)attributesAsString:(int)a3
{
  if ((a3 - 1) < 5)
    return *(&off_1E228A708 + (a3 - 1));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAttributes:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("READ")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNREAD")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FLAGGED")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNFLAGGED")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PLAYED")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setAudioMessageFile:(id)a3
{
  objc_storeStrong((id *)&self->_audioMessageFile, a3);
}

- (BOOL)hasAudioMessageFile
{
  return self->_audioMessageFile != 0;
}

- (void)setContent:(id)a3
{
  NSString *v4;
  NSString *content;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  content = self->_content;
  self->_content = v4;

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

- (void)setDateLastMessageRead:(id)a3
{
  objc_storeStrong((id *)&self->_dateLastMessageRead, a3);
}

- (BOOL)hasDateLastMessageRead
{
  return self->_dateLastMessageRead != 0;
}

- (void)setDateSent:(id)a3
{
  objc_storeStrong((id *)&self->_dateSent, a3);
}

- (BOOL)hasDateSent
{
  return self->_dateSent != 0;
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
    return *(&off_1E228A730 + (a3 - 1));
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

- (void)setFileExtension:(id)a3
{
  NSString *v4;
  NSString *fileExtension;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  fileExtension = self->_fileExtension;
  self->_fileExtension = v4;

}

- (BOOL)hasFileExtension
{
  return self->_fileExtension != 0;
}

- (void)setGroupName:(id)a3
{
  NSString *v4;
  NSString *groupName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  groupName = self->_groupName;
  self->_groupName = v4;

}

- (BOOL)hasGroupName
{
  return self->_groupName != 0;
}

- (void)setIdentifier:(id)a3
{
  NSString *v4;
  NSString *identifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  identifier = self->_identifier;
  self->_identifier = v4;

}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (void)setLinkMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_linkMetadata, a3);
}

- (BOOL)hasLinkMetadata
{
  return self->_linkMetadata != 0;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (BOOL)hasLocation
{
  return self->_location != 0;
}

- (void)setLocationName:(id)a3
{
  NSString *v4;
  NSString *locationName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  locationName = self->_locationName;
  self->_locationName = v4;

}

- (BOOL)hasLocationName
{
  return self->_locationName != 0;
}

- (void)setNumberOfAttachments:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfAttachments, a3);
}

- (BOOL)hasNumberOfAttachments
{
  return self->_numberOfAttachments != 0;
}

- (void)setPaymentAmount:(id)a3
{
  objc_storeStrong((id *)&self->_paymentAmount, a3);
}

- (BOOL)hasPaymentAmount
{
  return self->_paymentAmount != 0;
}

- (void)setReaction:(id)a3
{
  objc_storeStrong((id *)&self->_reaction, a3);
}

- (BOOL)hasReaction
{
  return self->_reaction != 0;
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

- (void)setReferencedMessage:(id)a3
{
  objc_storeStrong((id *)&self->_referencedMessage, a3);
}

- (BOOL)hasReferencedMessage
{
  return self->_referencedMessage != 0;
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

- (void)setSticker:(id)a3
{
  objc_storeStrong((id *)&self->_sticker, a3);
}

- (BOOL)hasSticker
{
  return self->_sticker != 0;
}

- (void)setType:(int)a3
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
    self->_type = a3;
  }
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (id)typeAsString:(int)a3
{
  if ((a3 - 1) < 0x22)
    return *(&off_1E228A798 + (a3 - 1));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TEXT")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUDIO")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DIGITAL_TOUCH")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HANDWRITING")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STICKER")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TAPBACK_LIKED")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TAPBACK_DISLIKED")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TAPBACK_EMPHASIZED")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TAPBACK_LOVED")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TAPBACK_QUESTIONED")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TAPBACK_LAUGHED")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MEDIA_TYPE_CALENDAR")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MEDIA_TYPE_LOCATION")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MEDIA_TYPE_ADDRESS_CARD")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MEDIA_TYPE_IMAGE")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MEDIA_TYPE_VIDEO")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MEDIA_TYPE_PASS")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MEDIA_TYPE_AUDIO")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PAYMENT_SENT")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PAYMENT_REQUEST")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PAYMENT_NOTE")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANIMOJI")) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ACTIVITY_SNIPPET")) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FILE")) & 1) != 0)
  {
    v4 = 24;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LINK")) & 1) != 0)
  {
    v4 = 25;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MESSAGE_REACTION")) & 1) != 0)
  {
    v4 = 26;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SAFETY_MONITOR")) & 1) != 0)
  {
    v4 = 27;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOCATION_REQUEST")) & 1) != 0)
  {
    v4 = 28;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHARED_LOCATION")) & 1) != 0)
  {
    v4 = 29;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FIND_MY")) & 1) != 0)
  {
    v4 = 30;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SCREEN_TIME_REQUEST")) & 1) != 0)
  {
    v4 = 31;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ASK_TO")) & 1) != 0)
  {
    v4 = 32;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MEDIA_TYPE_ANIMATED_IMAGE")) & 1) != 0)
  {
    v4 = 33;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("THIRD_PARTY_ATTACHMENT")))
  {
    v4 = 34;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBMessageReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSArray *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v5 = self->_attachmentFiles;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v52;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v52 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    }
    while (v7);
  }

  if (self->_attributes.count)
  {
    v10 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v10;
    }
    while (v10 < self->_attributes.count);
  }
  -[_INPBMessage audioMessageFile](self, "audioMessageFile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[_INPBMessage audioMessageFile](self, "audioMessageFile");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBMessage content](self, "content");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    PBDataWriterWriteStringField();
  -[_INPBMessage conversationIdentifier](self, "conversationIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    PBDataWriterWriteStringField();
  -[_INPBMessage dateLastMessageRead](self, "dateLastMessageRead");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[_INPBMessage dateLastMessageRead](self, "dateLastMessageRead");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBMessage dateSent](self, "dateSent");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[_INPBMessage dateSent](self, "dateSent");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBMessage hasEffect](self, "hasEffect"))
    PBDataWriterWriteInt32Field();
  -[_INPBMessage fileExtension](self, "fileExtension");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    PBDataWriterWriteStringField();
  -[_INPBMessage groupName](self, "groupName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
    PBDataWriterWriteStringField();
  -[_INPBMessage identifier](self, "identifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
    PBDataWriterWriteStringField();
  -[_INPBMessage linkMetadata](self, "linkMetadata");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[_INPBMessage linkMetadata](self, "linkMetadata");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBMessage location](self, "location");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[_INPBMessage location](self, "location");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBMessage locationName](self, "locationName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
    PBDataWriterWriteStringField();
  -[_INPBMessage numberOfAttachments](self, "numberOfAttachments");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    -[_INPBMessage numberOfAttachments](self, "numberOfAttachments");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBMessage paymentAmount](self, "paymentAmount");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    -[_INPBMessage paymentAmount](self, "paymentAmount");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBMessage reaction](self, "reaction");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    -[_INPBMessage reaction](self, "reaction");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v33 = self->_recipients;
  v34 = -[NSArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v48;
    do
    {
      v37 = 0;
      do
      {
        if (*(_QWORD *)v48 != v36)
          objc_enumerationMutation(v33);
        PBDataWriterWriteSubmessage();
        ++v37;
      }
      while (v35 != v37);
      v35 = -[NSArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    }
    while (v35);
  }

  -[_INPBMessage referencedMessage](self, "referencedMessage", v47);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    -[_INPBMessage referencedMessage](self, "referencedMessage");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBMessage sender](self, "sender");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    -[_INPBMessage sender](self, "sender");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBMessage serviceName](self, "serviceName");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
    PBDataWriterWriteStringField();
  -[_INPBMessage speakableGroupName](self, "speakableGroupName");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
  {
    -[_INPBMessage speakableGroupName](self, "speakableGroupName");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBMessage sticker](self, "sticker");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45)
  {
    -[_INPBMessage sticker](self, "sticker");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBMessage hasType](self, "hasType"))
    PBDataWriterWriteInt32Field();

}

- (void)dealloc
{
  objc_super v3;

  -[_INPBMessage clearAttributes](self, "clearAttributes");
  v3.receiver = self;
  v3.super_class = (Class)_INPBMessage;
  -[_INPBMessage dealloc](&v3, sel_dealloc);
}

- (_INPBMessage)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBMessage *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBMessage *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBMessage *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBMessage initWithData:](self, "initWithData:", v6);

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
  -[_INPBMessage data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBMessage *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;

  v5 = -[_INPBMessage init](+[_INPBMessage allocWithZone:](_INPBMessage, "allocWithZone:"), "init");
  v6 = (void *)-[NSArray copyWithZone:](self->_attachmentFiles, "copyWithZone:", a3);
  -[_INPBMessage setAttachmentFiles:](v5, "setAttachmentFiles:", v6);

  PBRepeatedInt32Copy();
  v7 = -[_INPBFile copyWithZone:](self->_audioMessageFile, "copyWithZone:", a3);
  -[_INPBMessage setAudioMessageFile:](v5, "setAudioMessageFile:", v7);

  v8 = (void *)-[NSString copyWithZone:](self->_content, "copyWithZone:", a3);
  -[_INPBMessage setContent:](v5, "setContent:", v8);

  v9 = (void *)-[NSString copyWithZone:](self->_conversationIdentifier, "copyWithZone:", a3);
  -[_INPBMessage setConversationIdentifier:](v5, "setConversationIdentifier:", v9);

  v10 = -[_INPBDateTime copyWithZone:](self->_dateLastMessageRead, "copyWithZone:", a3);
  -[_INPBMessage setDateLastMessageRead:](v5, "setDateLastMessageRead:", v10);

  v11 = -[_INPBDateTime copyWithZone:](self->_dateSent, "copyWithZone:", a3);
  -[_INPBMessage setDateSent:](v5, "setDateSent:", v11);

  if (-[_INPBMessage hasEffect](self, "hasEffect"))
    -[_INPBMessage setEffect:](v5, "setEffect:", -[_INPBMessage effect](self, "effect"));
  v12 = (void *)-[NSString copyWithZone:](self->_fileExtension, "copyWithZone:", a3);
  -[_INPBMessage setFileExtension:](v5, "setFileExtension:", v12);

  v13 = (void *)-[NSString copyWithZone:](self->_groupName, "copyWithZone:", a3);
  -[_INPBMessage setGroupName:](v5, "setGroupName:", v13);

  v14 = (void *)-[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  -[_INPBMessage setIdentifier:](v5, "setIdentifier:", v14);

  v15 = -[_INPBMessageLinkMetadata copyWithZone:](self->_linkMetadata, "copyWithZone:", a3);
  -[_INPBMessage setLinkMetadata:](v5, "setLinkMetadata:", v15);

  v16 = -[_INPBLocation copyWithZone:](self->_location, "copyWithZone:", a3);
  -[_INPBMessage setLocation:](v5, "setLocation:", v16);

  v17 = (void *)-[NSString copyWithZone:](self->_locationName, "copyWithZone:", a3);
  -[_INPBMessage setLocationName:](v5, "setLocationName:", v17);

  v18 = -[_INPBInteger copyWithZone:](self->_numberOfAttachments, "copyWithZone:", a3);
  -[_INPBMessage setNumberOfAttachments:](v5, "setNumberOfAttachments:", v18);

  v19 = -[_INPBCurrencyAmountValue copyWithZone:](self->_paymentAmount, "copyWithZone:", a3);
  -[_INPBMessage setPaymentAmount:](v5, "setPaymentAmount:", v19);

  v20 = -[_INPBMessageReaction copyWithZone:](self->_reaction, "copyWithZone:", a3);
  -[_INPBMessage setReaction:](v5, "setReaction:", v20);

  v21 = (void *)-[NSArray copyWithZone:](self->_recipients, "copyWithZone:", a3);
  -[_INPBMessage setRecipients:](v5, "setRecipients:", v21);

  v22 = -[_INPBMessage copyWithZone:](self->_referencedMessage, "copyWithZone:", a3);
  -[_INPBMessage setReferencedMessage:](v5, "setReferencedMessage:", v22);

  v23 = -[_INPBContact copyWithZone:](self->_sender, "copyWithZone:", a3);
  -[_INPBMessage setSender:](v5, "setSender:", v23);

  v24 = (void *)-[NSString copyWithZone:](self->_serviceName, "copyWithZone:", a3);
  -[_INPBMessage setServiceName:](v5, "setServiceName:", v24);

  v25 = -[_INPBDataString copyWithZone:](self->_speakableGroupName, "copyWithZone:", a3);
  -[_INPBMessage setSpeakableGroupName:](v5, "setSpeakableGroupName:", v25);

  v26 = -[_INPBSticker copyWithZone:](self->_sticker, "copyWithZone:", a3);
  -[_INPBMessage setSticker:](v5, "setSticker:", v26);

  if (-[_INPBMessage hasType](self, "hasType"))
    -[_INPBMessage setType:](v5, "setType:", -[_INPBMessage type](self, "type"));
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
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  int v37;
  int effect;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  int v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  int v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  int v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  int v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  int v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  int v88;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  int v93;
  uint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  int v98;
  uint64_t v99;
  void *v100;
  void *v101;
  void *v102;
  int v103;
  uint64_t v104;
  void *v105;
  void *v106;
  void *v107;
  int v108;
  uint64_t v109;
  void *v110;
  void *v111;
  void *v112;
  int v113;
  BOOL v114;
  int v116;
  int type;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_112;
  -[_INPBMessage attachmentFiles](self, "attachmentFiles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attachmentFiles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_111;
  -[_INPBMessage attachmentFiles](self, "attachmentFiles");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBMessage attachmentFiles](self, "attachmentFiles");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "attachmentFiles");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_112;
  }
  else
  {

  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_112;
  -[_INPBMessage audioMessageFile](self, "audioMessageFile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioMessageFile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_111;
  -[_INPBMessage audioMessageFile](self, "audioMessageFile");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBMessage audioMessageFile](self, "audioMessageFile");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioMessageFile");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_112;
  }
  else
  {

  }
  -[_INPBMessage content](self, "content");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "content");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_111;
  -[_INPBMessage content](self, "content");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBMessage content](self, "content");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "content");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_112;
  }
  else
  {

  }
  -[_INPBMessage conversationIdentifier](self, "conversationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "conversationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_111;
  -[_INPBMessage conversationIdentifier](self, "conversationIdentifier");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_INPBMessage conversationIdentifier](self, "conversationIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "conversationIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_112;
  }
  else
  {

  }
  -[_INPBMessage dateLastMessageRead](self, "dateLastMessageRead");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateLastMessageRead");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_111;
  -[_INPBMessage dateLastMessageRead](self, "dateLastMessageRead");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[_INPBMessage dateLastMessageRead](self, "dateLastMessageRead");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateLastMessageRead");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_112;
  }
  else
  {

  }
  -[_INPBMessage dateSent](self, "dateSent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateSent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_111;
  -[_INPBMessage dateSent](self, "dateSent");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[_INPBMessage dateSent](self, "dateSent");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateSent");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if (!v36)
      goto LABEL_112;
  }
  else
  {

  }
  v37 = -[_INPBMessage hasEffect](self, "hasEffect");
  if (v37 != objc_msgSend(v4, "hasEffect"))
    goto LABEL_112;
  if (-[_INPBMessage hasEffect](self, "hasEffect"))
  {
    if (objc_msgSend(v4, "hasEffect"))
    {
      effect = self->_effect;
      if (effect != objc_msgSend(v4, "effect"))
        goto LABEL_112;
    }
  }
  -[_INPBMessage fileExtension](self, "fileExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_111;
  -[_INPBMessage fileExtension](self, "fileExtension");
  v39 = objc_claimAutoreleasedReturnValue();
  if (v39)
  {
    v40 = (void *)v39;
    -[_INPBMessage fileExtension](self, "fileExtension");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fileExtension");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v41, "isEqual:", v42);

    if (!v43)
      goto LABEL_112;
  }
  else
  {

  }
  -[_INPBMessage groupName](self, "groupName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groupName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_111;
  -[_INPBMessage groupName](self, "groupName");
  v44 = objc_claimAutoreleasedReturnValue();
  if (v44)
  {
    v45 = (void *)v44;
    -[_INPBMessage groupName](self, "groupName");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "groupName");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v46, "isEqual:", v47);

    if (!v48)
      goto LABEL_112;
  }
  else
  {

  }
  -[_INPBMessage identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_111;
  -[_INPBMessage identifier](self, "identifier");
  v49 = objc_claimAutoreleasedReturnValue();
  if (v49)
  {
    v50 = (void *)v49;
    -[_INPBMessage identifier](self, "identifier");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v51, "isEqual:", v52);

    if (!v53)
      goto LABEL_112;
  }
  else
  {

  }
  -[_INPBMessage linkMetadata](self, "linkMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "linkMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_111;
  -[_INPBMessage linkMetadata](self, "linkMetadata");
  v54 = objc_claimAutoreleasedReturnValue();
  if (v54)
  {
    v55 = (void *)v54;
    -[_INPBMessage linkMetadata](self, "linkMetadata");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "linkMetadata");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v56, "isEqual:", v57);

    if (!v58)
      goto LABEL_112;
  }
  else
  {

  }
  -[_INPBMessage location](self, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_111;
  -[_INPBMessage location](self, "location");
  v59 = objc_claimAutoreleasedReturnValue();
  if (v59)
  {
    v60 = (void *)v59;
    -[_INPBMessage location](self, "location");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "location");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v61, "isEqual:", v62);

    if (!v63)
      goto LABEL_112;
  }
  else
  {

  }
  -[_INPBMessage locationName](self, "locationName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_111;
  -[_INPBMessage locationName](self, "locationName");
  v64 = objc_claimAutoreleasedReturnValue();
  if (v64)
  {
    v65 = (void *)v64;
    -[_INPBMessage locationName](self, "locationName");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locationName");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend(v66, "isEqual:", v67);

    if (!v68)
      goto LABEL_112;
  }
  else
  {

  }
  -[_INPBMessage numberOfAttachments](self, "numberOfAttachments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberOfAttachments");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_111;
  -[_INPBMessage numberOfAttachments](self, "numberOfAttachments");
  v69 = objc_claimAutoreleasedReturnValue();
  if (v69)
  {
    v70 = (void *)v69;
    -[_INPBMessage numberOfAttachments](self, "numberOfAttachments");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberOfAttachments");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = objc_msgSend(v71, "isEqual:", v72);

    if (!v73)
      goto LABEL_112;
  }
  else
  {

  }
  -[_INPBMessage paymentAmount](self, "paymentAmount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "paymentAmount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_111;
  -[_INPBMessage paymentAmount](self, "paymentAmount");
  v74 = objc_claimAutoreleasedReturnValue();
  if (v74)
  {
    v75 = (void *)v74;
    -[_INPBMessage paymentAmount](self, "paymentAmount");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "paymentAmount");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = objc_msgSend(v76, "isEqual:", v77);

    if (!v78)
      goto LABEL_112;
  }
  else
  {

  }
  -[_INPBMessage reaction](self, "reaction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reaction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_111;
  -[_INPBMessage reaction](self, "reaction");
  v79 = objc_claimAutoreleasedReturnValue();
  if (v79)
  {
    v80 = (void *)v79;
    -[_INPBMessage reaction](self, "reaction");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reaction");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = objc_msgSend(v81, "isEqual:", v82);

    if (!v83)
      goto LABEL_112;
  }
  else
  {

  }
  -[_INPBMessage recipients](self, "recipients");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recipients");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_111;
  -[_INPBMessage recipients](self, "recipients");
  v84 = objc_claimAutoreleasedReturnValue();
  if (v84)
  {
    v85 = (void *)v84;
    -[_INPBMessage recipients](self, "recipients");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recipients");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = objc_msgSend(v86, "isEqual:", v87);

    if (!v88)
      goto LABEL_112;
  }
  else
  {

  }
  -[_INPBMessage referencedMessage](self, "referencedMessage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "referencedMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_111;
  -[_INPBMessage referencedMessage](self, "referencedMessage");
  v89 = objc_claimAutoreleasedReturnValue();
  if (v89)
  {
    v90 = (void *)v89;
    -[_INPBMessage referencedMessage](self, "referencedMessage");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "referencedMessage");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = objc_msgSend(v91, "isEqual:", v92);

    if (!v93)
      goto LABEL_112;
  }
  else
  {

  }
  -[_INPBMessage sender](self, "sender");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sender");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_111;
  -[_INPBMessage sender](self, "sender");
  v94 = objc_claimAutoreleasedReturnValue();
  if (v94)
  {
    v95 = (void *)v94;
    -[_INPBMessage sender](self, "sender");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sender");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = objc_msgSend(v96, "isEqual:", v97);

    if (!v98)
      goto LABEL_112;
  }
  else
  {

  }
  -[_INPBMessage serviceName](self, "serviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serviceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_111;
  -[_INPBMessage serviceName](self, "serviceName");
  v99 = objc_claimAutoreleasedReturnValue();
  if (v99)
  {
    v100 = (void *)v99;
    -[_INPBMessage serviceName](self, "serviceName");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "serviceName");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = objc_msgSend(v101, "isEqual:", v102);

    if (!v103)
      goto LABEL_112;
  }
  else
  {

  }
  -[_INPBMessage speakableGroupName](self, "speakableGroupName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "speakableGroupName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_111;
  -[_INPBMessage speakableGroupName](self, "speakableGroupName");
  v104 = objc_claimAutoreleasedReturnValue();
  if (v104)
  {
    v105 = (void *)v104;
    -[_INPBMessage speakableGroupName](self, "speakableGroupName");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "speakableGroupName");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = objc_msgSend(v106, "isEqual:", v107);

    if (!v108)
      goto LABEL_112;
  }
  else
  {

  }
  -[_INPBMessage sticker](self, "sticker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sticker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_111:

    goto LABEL_112;
  }
  -[_INPBMessage sticker](self, "sticker");
  v109 = objc_claimAutoreleasedReturnValue();
  if (v109)
  {
    v110 = (void *)v109;
    -[_INPBMessage sticker](self, "sticker");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sticker");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v113 = objc_msgSend(v111, "isEqual:", v112);

    if (!v113)
      goto LABEL_112;
  }
  else
  {

  }
  v116 = -[_INPBMessage hasType](self, "hasType");
  if (v116 == objc_msgSend(v4, "hasType"))
  {
    if (!-[_INPBMessage hasType](self, "hasType")
      || !objc_msgSend(v4, "hasType")
      || (type = self->_type, type == objc_msgSend(v4, "type")))
    {
      v114 = 1;
      goto LABEL_113;
    }
  }
LABEL_112:
  v114 = 0;
LABEL_113:

  return v114;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  NSUInteger v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  NSUInteger v14;
  unint64_t v15;
  unint64_t v16;
  NSUInteger v17;
  NSUInteger v18;
  NSUInteger v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  NSUInteger v23;
  NSUInteger v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v27 = -[NSArray hash](self->_attachmentFiles, "hash");
  v26 = PBRepeatedInt32Hash();
  v25 = -[_INPBFile hash](self->_audioMessageFile, "hash");
  v24 = -[NSString hash](self->_content, "hash");
  v23 = -[NSString hash](self->_conversationIdentifier, "hash");
  v22 = -[_INPBDateTime hash](self->_dateLastMessageRead, "hash");
  v21 = -[_INPBDateTime hash](self->_dateSent, "hash");
  if (-[_INPBMessage hasEffect](self, "hasEffect"))
    v20 = 2654435761 * self->_effect;
  else
    v20 = 0;
  v19 = -[NSString hash](self->_fileExtension, "hash");
  v18 = -[NSString hash](self->_groupName, "hash");
  v17 = -[NSString hash](self->_identifier, "hash");
  v16 = -[_INPBMessageLinkMetadata hash](self->_linkMetadata, "hash");
  v15 = -[_INPBLocation hash](self->_location, "hash");
  v14 = -[NSString hash](self->_locationName, "hash");
  v3 = -[_INPBInteger hash](self->_numberOfAttachments, "hash");
  v4 = -[_INPBCurrencyAmountValue hash](self->_paymentAmount, "hash");
  v5 = -[_INPBMessageReaction hash](self->_reaction, "hash");
  v6 = -[NSArray hash](self->_recipients, "hash");
  v7 = -[_INPBMessage hash](self->_referencedMessage, "hash");
  v8 = -[_INPBContact hash](self->_sender, "hash");
  v9 = -[NSString hash](self->_serviceName, "hash");
  v10 = -[_INPBDataString hash](self->_speakableGroupName, "hash");
  v11 = -[_INPBSticker hash](self->_sticker, "hash");
  if (-[_INPBMessage hasType](self, "hasType"))
    v12 = 2654435761 * self->_type;
  else
    v12 = 0;
  return v26 ^ v27 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v14 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  unint64_t v12;
  unsigned int v13;
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
  uint64_t v25;
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
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSArray *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t j;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_attachmentFiles, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v5 = self->_attachmentFiles;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v70;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v70 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * i), "dictionaryRepresentation");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("attachmentFile"));
  }
  if (self->_attributes.count)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[_INPBMessage attributesCount](self, "attributesCount"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[_INPBMessage attributesCount](self, "attributesCount"))
    {
      v12 = 0;
      do
      {
        v13 = self->_attributes.list[v12] - 1;
        if (v13 >= 5)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_attributes.list[v12]);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v14 = *(&off_1E228A708 + v13);
        }
        objc_msgSend(v11, "addObject:", v14);

        ++v12;
      }
      while (v12 < -[_INPBMessage attributesCount](self, "attributesCount"));
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("attribute"));

  }
  -[_INPBMessage audioMessageFile](self, "audioMessageFile");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dictionaryRepresentation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("audioMessageFile"));

  if (self->_content)
  {
    -[_INPBMessage content](self, "content");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("content"));

  }
  if (self->_conversationIdentifier)
  {
    -[_INPBMessage conversationIdentifier](self, "conversationIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("conversationIdentifier"));

  }
  -[_INPBMessage dateLastMessageRead](self, "dateLastMessageRead");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "dictionaryRepresentation");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("dateLastMessageRead"));

  -[_INPBMessage dateSent](self, "dateSent");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "dictionaryRepresentation");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("dateSent"));

  if (-[_INPBMessage hasEffect](self, "hasEffect"))
  {
    v25 = -[_INPBMessage effect](self, "effect");
    if ((v25 - 1) >= 0xD)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = *(&off_1E228A730 + (v25 - 1));
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("effect"));

  }
  if (self->_fileExtension)
  {
    -[_INPBMessage fileExtension](self, "fileExtension");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v27, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("fileExtension"));

  }
  if (self->_groupName)
  {
    -[_INPBMessage groupName](self, "groupName");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v29, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("groupName"));

  }
  if (self->_identifier)
  {
    -[_INPBMessage identifier](self, "identifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)objc_msgSend(v31, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("identifier"));

  }
  -[_INPBMessage linkMetadata](self, "linkMetadata");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "dictionaryRepresentation");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("linkMetadata"));

  -[_INPBMessage location](self, "location");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "dictionaryRepresentation");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("location"));

  if (self->_locationName)
  {
    -[_INPBMessage locationName](self, "locationName");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)objc_msgSend(v37, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("locationName"));

  }
  -[_INPBMessage numberOfAttachments](self, "numberOfAttachments");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "dictionaryRepresentation");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v40, CFSTR("numberOfAttachments"));

  -[_INPBMessage paymentAmount](self, "paymentAmount");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "dictionaryRepresentation");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("paymentAmount"));

  -[_INPBMessage reaction](self, "reaction");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "dictionaryRepresentation");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("reaction"));

  if (-[NSArray count](self->_recipients, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v46 = self->_recipients;
    v47 = -[NSArray countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
    if (v47)
    {
      v48 = v47;
      v49 = *(_QWORD *)v66;
      do
      {
        for (j = 0; j != v48; ++j)
        {
          if (*(_QWORD *)v66 != v49)
            objc_enumerationMutation(v46);
          objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * j), "dictionaryRepresentation");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "addObject:", v51);

        }
        v48 = -[NSArray countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
      }
      while (v48);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v45, CFSTR("recipient"));
  }
  -[_INPBMessage referencedMessage](self, "referencedMessage");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "dictionaryRepresentation");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v53, CFSTR("referencedMessage"));

  -[_INPBMessage sender](self, "sender");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "dictionaryRepresentation");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v55, CFSTR("sender"));

  if (self->_serviceName)
  {
    -[_INPBMessage serviceName](self, "serviceName");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = (void *)objc_msgSend(v56, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v57, CFSTR("serviceName"));

  }
  -[_INPBMessage speakableGroupName](self, "speakableGroupName");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "dictionaryRepresentation");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v59, CFSTR("speakableGroupName"));

  -[_INPBMessage sticker](self, "sticker");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "dictionaryRepresentation");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v61, CFSTR("sticker"));

  if (-[_INPBMessage hasType](self, "hasType"))
  {
    v62 = -[_INPBMessage type](self, "type");
    if ((v62 - 1) >= 0x22)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v63 = *(&off_1E228A798 + (v62 - 1));
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v63, CFSTR("type"));

  }
  return v3;
}

- (NSArray)attachmentFiles
{
  return self->_attachmentFiles;
}

- (_INPBFile)audioMessageFile
{
  return self->_audioMessageFile;
}

- (NSString)content
{
  return self->_content;
}

- (NSString)conversationIdentifier
{
  return self->_conversationIdentifier;
}

- (_INPBDateTime)dateLastMessageRead
{
  return self->_dateLastMessageRead;
}

- (_INPBDateTime)dateSent
{
  return self->_dateSent;
}

- (int)effect
{
  return self->_effect;
}

- (NSString)fileExtension
{
  return self->_fileExtension;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (_INPBMessageLinkMetadata)linkMetadata
{
  return self->_linkMetadata;
}

- (_INPBLocation)location
{
  return self->_location;
}

- (NSString)locationName
{
  return self->_locationName;
}

- (_INPBInteger)numberOfAttachments
{
  return self->_numberOfAttachments;
}

- (_INPBCurrencyAmountValue)paymentAmount
{
  return self->_paymentAmount;
}

- (_INPBMessageReaction)reaction
{
  return self->_reaction;
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (_INPBMessage)referencedMessage
{
  return self->_referencedMessage;
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

- (_INPBSticker)sticker
{
  return self->_sticker;
}

- (int)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sticker, 0);
  objc_storeStrong((id *)&self->_speakableGroupName, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_referencedMessage, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_reaction, 0);
  objc_storeStrong((id *)&self->_paymentAmount, 0);
  objc_storeStrong((id *)&self->_numberOfAttachments, 0);
  objc_storeStrong((id *)&self->_locationName, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_linkMetadata, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_fileExtension, 0);
  objc_storeStrong((id *)&self->_dateSent, 0);
  objc_storeStrong((id *)&self->_dateLastMessageRead, 0);
  objc_storeStrong((id *)&self->_conversationIdentifier, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_audioMessageFile, 0);
  objc_storeStrong((id *)&self->_attachmentFiles, 0);
}

+ (Class)attachmentFileType
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
