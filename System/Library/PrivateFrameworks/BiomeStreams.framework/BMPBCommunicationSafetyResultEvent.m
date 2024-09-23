@implementation BMPBCommunicationSafetyResultEvent

- (BMPBCommunicationSafetyResultEvent)initWithData:(id)a3 skipImage:(BOOL)a4
{
  objc_super v5;

  self->_skipImage = a4;
  v5.receiver = self;
  v5.super_class = (Class)BMPBCommunicationSafetyResultEvent;
  return -[BMPBCommunicationSafetyResultEvent initWithData:](&v5, sel_initWithData_, a3);
}

- (void)setAbsoluteTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_absoluteTimestamp = a3;
}

- (void)setHasAbsoluteTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAbsoluteTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasChildId
{
  return self->_childId != 0;
}

- (BOOL)hasDeviceId
{
  return self->_deviceId != 0;
}

- (int)communicationSafetyResultEventDirection
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_communicationSafetyResultEventDirection;
  else
    return 0;
}

- (void)setCommunicationSafetyResultEventDirection:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_communicationSafetyResultEventDirection = a3;
}

- (void)setHasCommunicationSafetyResultEventDirection:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasCommunicationSafetyResultEventDirection
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)communicationSafetyResultEventDirectionAsString:(int)a3
{
  if (a3 < 3)
    return off_1E2649700[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsCommunicationSafetyResultEventDirection:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Sent")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Received")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("UnknownOrNotApplicable")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)communicationSafetyResultEventType
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_communicationSafetyResultEventType;
  else
    return 0;
}

- (void)setCommunicationSafetyResultEventType:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_communicationSafetyResultEventType = a3;
}

- (void)setHasCommunicationSafetyResultEventType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasCommunicationSafetyResultEventType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)communicationSafetyResultEventTypeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E2649718[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsCommunicationSafetyResultEventType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Sensitive")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NonSensitive")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Deleted")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ConversationDeleted")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)communicationSafetyResultContentType
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_communicationSafetyResultContentType;
  else
    return 0;
}

- (void)setCommunicationSafetyResultContentType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_communicationSafetyResultContentType = a3;
}

- (void)setHasCommunicationSafetyResultContentType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCommunicationSafetyResultContentType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)communicationSafetyResultContentTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E2649738[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsCommunicationSafetyResultContentType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Photo")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Message")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Conversation")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)clearContactHandles
{
  -[NSMutableArray removeAllObjects](self->_contactHandles, "removeAllObjects");
}

- (void)addContactHandles:(id)a3
{
  id v4;
  NSMutableArray *contactHandles;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  contactHandles = self->_contactHandles;
  v8 = v4;
  if (!contactHandles)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_contactHandles;
    self->_contactHandles = v6;

    v4 = v8;
    contactHandles = self->_contactHandles;
  }
  -[NSMutableArray addObject:](contactHandles, "addObject:", v4);

}

- (unint64_t)contactHandlesCount
{
  return -[NSMutableArray count](self->_contactHandles, "count");
}

- (id)contactHandlesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_contactHandles, "objectAtIndex:", a3);
}

+ (Class)contactHandlesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasContentId
{
  return self->_contentId != 0;
}

- (BOOL)hasConversationId
{
  return self->_conversationId != 0;
}

- (BOOL)hasImageData
{
  return self->_imageData != 0;
}

- (BOOL)hasSourceBundleId
{
  return self->_sourceBundleId != 0;
}

- (BOOL)hasSenderHandle
{
  return self->_senderHandle != 0;
}

- (BOOL)hasContentURL
{
  return self->_contentURL != 0;
}

- (BOOL)hasConversationURL
{
  return self->_conversationURL != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)BMPBCommunicationSafetyResultEvent;
  -[BMPBCommunicationSafetyResultEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPBCommunicationSafetyResultEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *childId;
  NSString *deviceId;
  char has;
  uint64_t communicationSafetyResultEventDirection;
  __CFString *v9;
  uint64_t communicationSafetyResultEventType;
  __CFString *v11;
  uint64_t communicationSafetyResultContentType;
  __CFString *v13;
  NSMutableArray *contactHandles;
  NSString *contentId;
  NSString *conversationId;
  NSData *imageData;
  NSString *sourceBundleId;
  NSString *senderHandle;
  NSString *contentURL;
  NSString *conversationURL;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_absoluteTimestamp);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("absoluteTimestamp"));

  }
  childId = self->_childId;
  if (childId)
    objc_msgSend(v3, "setObject:forKey:", childId, CFSTR("childId"));
  deviceId = self->_deviceId;
  if (deviceId)
    objc_msgSend(v3, "setObject:forKey:", deviceId, CFSTR("deviceId"));
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    communicationSafetyResultEventDirection = self->_communicationSafetyResultEventDirection;
    if (communicationSafetyResultEventDirection >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_communicationSafetyResultEventDirection);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E2649700[communicationSafetyResultEventDirection];
    }
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("communicationSafetyResultEventDirection"));

    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_9:
      if ((has & 2) == 0)
        goto LABEL_23;
      goto LABEL_19;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }
  communicationSafetyResultEventType = self->_communicationSafetyResultEventType;
  if (communicationSafetyResultEventType >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_communicationSafetyResultEventType);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = off_1E2649718[communicationSafetyResultEventType];
  }
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("communicationSafetyResultEventType"));

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_19:
    communicationSafetyResultContentType = self->_communicationSafetyResultContentType;
    if (communicationSafetyResultContentType >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_communicationSafetyResultContentType);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_1E2649738[communicationSafetyResultContentType];
    }
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("communicationSafetyResultContentType"));

  }
LABEL_23:
  contactHandles = self->_contactHandles;
  if (contactHandles)
    objc_msgSend(v3, "setObject:forKey:", contactHandles, CFSTR("contactHandles"));
  contentId = self->_contentId;
  if (contentId)
    objc_msgSend(v3, "setObject:forKey:", contentId, CFSTR("contentId"));
  conversationId = self->_conversationId;
  if (conversationId)
    objc_msgSend(v3, "setObject:forKey:", conversationId, CFSTR("conversationId"));
  imageData = self->_imageData;
  if (imageData)
    objc_msgSend(v3, "setObject:forKey:", imageData, CFSTR("imageData"));
  sourceBundleId = self->_sourceBundleId;
  if (sourceBundleId)
    objc_msgSend(v3, "setObject:forKey:", sourceBundleId, CFSTR("sourceBundleId"));
  senderHandle = self->_senderHandle;
  if (senderHandle)
    objc_msgSend(v3, "setObject:forKey:", senderHandle, CFSTR("senderHandle"));
  contentURL = self->_contentURL;
  if (contentURL)
    objc_msgSend(v3, "setObject:forKey:", contentURL, CFSTR("contentURL"));
  conversationURL = self->_conversationURL;
  if (conversationURL)
    objc_msgSend(v3, "setObject:forKey:", conversationURL, CFSTR("conversationURL"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBCommunicationSafetyResultEventReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_childId)
    PBDataWriterWriteStringField();
  if (self->_deviceId)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_9:
      if ((has & 2) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 2) != 0)
LABEL_10:
    PBDataWriterWriteInt32Field();
LABEL_11:
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_contactHandles;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteStringField();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  if (self->_contentId)
    PBDataWriterWriteStringField();
  if (self->_conversationId)
    PBDataWriterWriteStringField();
  if (self->_imageData)
    PBDataWriterWriteDataField();
  if (self->_sourceBundleId)
    PBDataWriterWriteStringField();
  if (self->_senderHandle)
    PBDataWriterWriteStringField();
  if (self->_contentURL)
    PBDataWriterWriteStringField();
  if (self->_conversationURL)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  _QWORD *v11;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = *(_QWORD *)&self->_absoluteTimestamp;
    *((_BYTE *)v4 + 112) |= 1u;
  }
  v11 = v4;
  if (self->_childId)
  {
    objc_msgSend(v4, "setChildId:");
    v4 = v11;
  }
  if (self->_deviceId)
  {
    objc_msgSend(v11, "setDeviceId:");
    v4 = v11;
  }
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_9;
LABEL_31:
    *((_DWORD *)v4 + 8) = self->_communicationSafetyResultEventType;
    *((_BYTE *)v4 + 112) |= 8u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  *((_DWORD *)v4 + 7) = self->_communicationSafetyResultEventDirection;
  *((_BYTE *)v4 + 112) |= 4u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_31;
LABEL_9:
  if ((has & 2) != 0)
  {
LABEL_10:
    *((_DWORD *)v4 + 6) = self->_communicationSafetyResultContentType;
    *((_BYTE *)v4 + 112) |= 2u;
  }
LABEL_11:
  if (-[BMPBCommunicationSafetyResultEvent contactHandlesCount](self, "contactHandlesCount"))
  {
    objc_msgSend(v11, "clearContactHandles");
    v6 = -[BMPBCommunicationSafetyResultEvent contactHandlesCount](self, "contactHandlesCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[BMPBCommunicationSafetyResultEvent contactHandlesAtIndex:](self, "contactHandlesAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addContactHandles:", v9);

      }
    }
  }
  if (self->_contentId)
    objc_msgSend(v11, "setContentId:");
  v10 = v11;
  if (self->_conversationId)
  {
    objc_msgSend(v11, "setConversationId:");
    v10 = v11;
  }
  if (self->_imageData)
  {
    objc_msgSend(v11, "setImageData:");
    v10 = v11;
  }
  if (self->_sourceBundleId)
  {
    objc_msgSend(v11, "setSourceBundleId:");
    v10 = v11;
  }
  if (self->_senderHandle)
  {
    objc_msgSend(v11, "setSenderHandle:");
    v10 = v11;
  }
  if (self->_contentURL)
  {
    objc_msgSend(v11, "setContentURL:");
    v10 = v11;
  }
  if (self->_conversationURL)
  {
    objc_msgSend(v11, "setConversationURL:");
    v10 = v11;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char has;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_absoluteTimestamp;
    *(_BYTE *)(v5 + 112) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_childId, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v7;

  v9 = -[NSString copyWithZone:](self->_deviceId, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 80);
  *(_QWORD *)(v6 + 80) = v9;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v6 + 28) = self->_communicationSafetyResultEventDirection;
    *(_BYTE *)(v6 + 112) |= 4u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_5:
      if ((has & 2) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_5;
  }
  *(_DWORD *)(v6 + 32) = self->_communicationSafetyResultEventType;
  *(_BYTE *)(v6 + 112) |= 8u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_6:
    *(_DWORD *)(v6 + 24) = self->_communicationSafetyResultContentType;
    *(_BYTE *)(v6 + 112) |= 2u;
  }
LABEL_7:
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v12 = self->_contactHandles;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v34 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v33);
        objc_msgSend((id)v6, "addContactHandles:", v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v14);
  }

  v18 = -[NSString copyWithZone:](self->_contentId, "copyWithZone:", a3);
  v19 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v18;

  v20 = -[NSString copyWithZone:](self->_conversationId, "copyWithZone:", a3);
  v21 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v20;

  v22 = -[NSData copyWithZone:](self->_imageData, "copyWithZone:", a3);
  v23 = *(void **)(v6 + 88);
  *(_QWORD *)(v6 + 88) = v22;

  v24 = -[NSString copyWithZone:](self->_sourceBundleId, "copyWithZone:", a3);
  v25 = *(void **)(v6 + 104);
  *(_QWORD *)(v6 + 104) = v24;

  v26 = -[NSString copyWithZone:](self->_senderHandle, "copyWithZone:", a3);
  v27 = *(void **)(v6 + 96);
  *(_QWORD *)(v6 + 96) = v26;

  v28 = -[NSString copyWithZone:](self->_contentURL, "copyWithZone:", a3);
  v29 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v28;

  v30 = -[NSString copyWithZone:](self->_conversationURL, "copyWithZone:", a3);
  v31 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v30;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *childId;
  NSString *deviceId;
  NSMutableArray *contactHandles;
  NSString *contentId;
  NSString *conversationId;
  NSData *imageData;
  NSString *sourceBundleId;
  NSString *senderHandle;
  NSString *contentURL;
  NSString *conversationURL;
  char v15;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_42;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 112) & 1) == 0 || self->_absoluteTimestamp != *((double *)v4 + 1))
      goto LABEL_42;
  }
  else if ((*((_BYTE *)v4 + 112) & 1) != 0)
  {
LABEL_42:
    v15 = 0;
    goto LABEL_43;
  }
  childId = self->_childId;
  if ((unint64_t)childId | *((_QWORD *)v4 + 2) && !-[NSString isEqual:](childId, "isEqual:"))
    goto LABEL_42;
  deviceId = self->_deviceId;
  if ((unint64_t)deviceId | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](deviceId, "isEqual:"))
      goto LABEL_42;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 112) & 4) == 0 || self->_communicationSafetyResultEventDirection != *((_DWORD *)v4 + 7))
      goto LABEL_42;
  }
  else if ((*((_BYTE *)v4 + 112) & 4) != 0)
  {
    goto LABEL_42;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 112) & 8) == 0 || self->_communicationSafetyResultEventType != *((_DWORD *)v4 + 8))
      goto LABEL_42;
  }
  else if ((*((_BYTE *)v4 + 112) & 8) != 0)
  {
    goto LABEL_42;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 112) & 2) == 0 || self->_communicationSafetyResultContentType != *((_DWORD *)v4 + 6))
      goto LABEL_42;
  }
  else if ((*((_BYTE *)v4 + 112) & 2) != 0)
  {
    goto LABEL_42;
  }
  contactHandles = self->_contactHandles;
  if ((unint64_t)contactHandles | *((_QWORD *)v4 + 5)
    && !-[NSMutableArray isEqual:](contactHandles, "isEqual:"))
  {
    goto LABEL_42;
  }
  contentId = self->_contentId;
  if ((unint64_t)contentId | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](contentId, "isEqual:"))
      goto LABEL_42;
  }
  conversationId = self->_conversationId;
  if ((unint64_t)conversationId | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](conversationId, "isEqual:"))
      goto LABEL_42;
  }
  imageData = self->_imageData;
  if ((unint64_t)imageData | *((_QWORD *)v4 + 11))
  {
    if (!-[NSData isEqual:](imageData, "isEqual:"))
      goto LABEL_42;
  }
  sourceBundleId = self->_sourceBundleId;
  if ((unint64_t)sourceBundleId | *((_QWORD *)v4 + 13))
  {
    if (!-[NSString isEqual:](sourceBundleId, "isEqual:"))
      goto LABEL_42;
  }
  senderHandle = self->_senderHandle;
  if ((unint64_t)senderHandle | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](senderHandle, "isEqual:"))
      goto LABEL_42;
  }
  contentURL = self->_contentURL;
  if ((unint64_t)contentURL | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](contentURL, "isEqual:"))
      goto LABEL_42;
  }
  conversationURL = self->_conversationURL;
  if ((unint64_t)conversationURL | *((_QWORD *)v4 + 9))
    v15 = -[NSString isEqual:](conversationURL, "isEqual:");
  else
    v15 = 1;
LABEL_43:

  return v15;
}

- (unint64_t)hash
{
  unint64_t v3;
  double absoluteTimestamp;
  double v5;
  long double v6;
  double v7;
  double v8;
  unint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSUInteger v15;
  uint64_t v16;
  NSUInteger v17;
  NSUInteger v18;
  uint64_t v19;
  NSUInteger v20;
  NSUInteger v21;
  NSUInteger v22;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    absoluteTimestamp = self->_absoluteTimestamp;
    v5 = -absoluteTimestamp;
    if (absoluteTimestamp >= 0.0)
      v5 = self->_absoluteTimestamp;
    v6 = floor(v5 + 0.5);
    v7 = (v5 - v6) * 1.84467441e19;
    v8 = fmod(v6, 1.84467441e19);
    v9 = 2654435761u * (unint64_t)v8;
    if (v7 >= 0.0)
    {
      if (v7 > 0.0)
        v3 = v9 + (unint64_t)v7;
      else
        v3 = 2654435761u * (unint64_t)v8;
    }
    else
    {
      v3 = v9 - (unint64_t)fabs(v7);
    }
  }
  else
  {
    v3 = 0;
  }
  v10 = -[NSString hash](self->_childId, "hash");
  v11 = -[NSString hash](self->_deviceId, "hash");
  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    v12 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_12;
LABEL_15:
    v13 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_13;
LABEL_16:
    v14 = 0;
    goto LABEL_17;
  }
  v12 = 2654435761 * self->_communicationSafetyResultEventDirection;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_15;
LABEL_12:
  v13 = 2654435761 * self->_communicationSafetyResultEventType;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_16;
LABEL_13:
  v14 = 2654435761 * self->_communicationSafetyResultContentType;
LABEL_17:
  v15 = v10 ^ v3 ^ v11 ^ v12;
  v16 = v13 ^ v14 ^ -[NSMutableArray hash](self->_contactHandles, "hash");
  v17 = v15 ^ v16 ^ -[NSString hash](self->_contentId, "hash");
  v18 = -[NSString hash](self->_conversationId, "hash");
  v19 = v18 ^ -[NSData hash](self->_imageData, "hash");
  v20 = v19 ^ -[NSString hash](self->_sourceBundleId, "hash");
  v21 = v17 ^ v20 ^ -[NSString hash](self->_senderHandle, "hash");
  v22 = -[NSString hash](self->_contentURL, "hash");
  return v21 ^ v22 ^ -[NSString hash](self->_conversationURL, "hash");
}

- (void)mergeFrom:(id)a3
{
  double *v4;
  double *v5;
  char v6;
  id v7;
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
  v4 = (double *)a3;
  v5 = v4;
  if (((_BYTE)v4[14] & 1) != 0)
  {
    self->_absoluteTimestamp = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 2))
    -[BMPBCommunicationSafetyResultEvent setChildId:](self, "setChildId:");
  if (*((_QWORD *)v5 + 10))
    -[BMPBCommunicationSafetyResultEvent setDeviceId:](self, "setDeviceId:");
  v6 = *((_BYTE *)v5 + 112);
  if ((v6 & 4) != 0)
  {
    self->_communicationSafetyResultEventDirection = *((_DWORD *)v5 + 7);
    *(_BYTE *)&self->_has |= 4u;
    v6 = *((_BYTE *)v5 + 112);
    if ((v6 & 8) == 0)
    {
LABEL_9:
      if ((v6 & 2) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if (((_BYTE)v5[14] & 8) == 0)
  {
    goto LABEL_9;
  }
  self->_communicationSafetyResultEventType = *((_DWORD *)v5 + 8);
  *(_BYTE *)&self->_has |= 8u;
  if (((_BYTE)v5[14] & 2) != 0)
  {
LABEL_10:
    self->_communicationSafetyResultContentType = *((_DWORD *)v5 + 6);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_11:
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = *((id *)v5 + 5);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
        -[BMPBCommunicationSafetyResultEvent addContactHandles:](self, "addContactHandles:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

  if (*((_QWORD *)v5 + 6))
    -[BMPBCommunicationSafetyResultEvent setContentId:](self, "setContentId:");
  if (*((_QWORD *)v5 + 8))
    -[BMPBCommunicationSafetyResultEvent setConversationId:](self, "setConversationId:");
  if (*((_QWORD *)v5 + 11))
    -[BMPBCommunicationSafetyResultEvent setImageData:](self, "setImageData:");
  if (*((_QWORD *)v5 + 13))
    -[BMPBCommunicationSafetyResultEvent setSourceBundleId:](self, "setSourceBundleId:");
  if (*((_QWORD *)v5 + 12))
    -[BMPBCommunicationSafetyResultEvent setSenderHandle:](self, "setSenderHandle:");
  if (*((_QWORD *)v5 + 7))
    -[BMPBCommunicationSafetyResultEvent setContentURL:](self, "setContentURL:");
  if (*((_QWORD *)v5 + 9))
    -[BMPBCommunicationSafetyResultEvent setConversationURL:](self, "setConversationURL:");

}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (NSString)childId
{
  return self->_childId;
}

- (void)setChildId:(id)a3
{
  objc_storeStrong((id *)&self->_childId, a3);
}

- (NSString)deviceId
{
  return self->_deviceId;
}

- (void)setDeviceId:(id)a3
{
  objc_storeStrong((id *)&self->_deviceId, a3);
}

- (NSMutableArray)contactHandles
{
  return self->_contactHandles;
}

- (void)setContactHandles:(id)a3
{
  objc_storeStrong((id *)&self->_contactHandles, a3);
}

- (NSString)contentId
{
  return self->_contentId;
}

- (void)setContentId:(id)a3
{
  objc_storeStrong((id *)&self->_contentId, a3);
}

- (NSString)conversationId
{
  return self->_conversationId;
}

- (void)setConversationId:(id)a3
{
  objc_storeStrong((id *)&self->_conversationId, a3);
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
  objc_storeStrong((id *)&self->_imageData, a3);
}

- (NSString)sourceBundleId
{
  return self->_sourceBundleId;
}

- (void)setSourceBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_sourceBundleId, a3);
}

- (NSString)senderHandle
{
  return self->_senderHandle;
}

- (void)setSenderHandle:(id)a3
{
  objc_storeStrong((id *)&self->_senderHandle, a3);
}

- (NSString)contentURL
{
  return self->_contentURL;
}

- (void)setContentURL:(id)a3
{
  objc_storeStrong((id *)&self->_contentURL, a3);
}

- (NSString)conversationURL
{
  return self->_conversationURL;
}

- (void)setConversationURL:(id)a3
{
  objc_storeStrong((id *)&self->_conversationURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceBundleId, 0);
  objc_storeStrong((id *)&self->_senderHandle, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_deviceId, 0);
  objc_storeStrong((id *)&self->_conversationURL, 0);
  objc_storeStrong((id *)&self->_conversationId, 0);
  objc_storeStrong((id *)&self->_contentURL, 0);
  objc_storeStrong((id *)&self->_contentId, 0);
  objc_storeStrong((id *)&self->_contactHandles, 0);
  objc_storeStrong((id *)&self->_childId, 0);
}

@end
