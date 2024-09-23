@implementation _INPBSendAnnouncementIntent

- (void)setAnnouncement:(id)a3
{
  objc_storeStrong((id *)&self->_announcement, a3);
}

- (BOOL)hasAnnouncement
{
  return self->_announcement != 0;
}

- (void)setIntentMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_intentMetadata, a3);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIsReply:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isReply = a3;
}

- (BOOL)hasIsReply
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasIsReply:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
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

- (void)addRecipients:(id)a3
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

- (id)recipientsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_recipients, "objectAtIndexedSubscript:", a3);
}

- (void)setSharedUserID:(id)a3
{
  NSString *v4;
  NSString *sharedUserID;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  sharedUserID = self->_sharedUserID;
  self->_sharedUserID = v4;

}

- (BOOL)hasSharedUserID
{
  return self->_sharedUserID != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSendAnnouncementIntentReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_INPBSendAnnouncementIntent announcement](self, "announcement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_INPBSendAnnouncementIntent announcement](self, "announcement");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBSendAnnouncementIntent intentMetadata](self, "intentMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_INPBSendAnnouncementIntent intentMetadata](self, "intentMetadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBSendAnnouncementIntent hasIsReply](self, "hasIsReply"))
    PBDataWriterWriteBOOLField();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = self->_recipients;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        PBDataWriterWriteSubmessage();
        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

  -[_INPBSendAnnouncementIntent sharedUserID](self, "sharedUserID", v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    PBDataWriterWriteStringField();

}

- (_INPBSendAnnouncementIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBSendAnnouncementIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBSendAnnouncementIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBSendAnnouncementIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBSendAnnouncementIntent initWithData:](self, "initWithData:", v6);

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
  -[_INPBSendAnnouncementIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBSendAnnouncementIntent *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = -[_INPBSendAnnouncementIntent init](+[_INPBSendAnnouncementIntent allocWithZone:](_INPBSendAnnouncementIntent, "allocWithZone:"), "init");
  v6 = -[_INPBAnnouncement copyWithZone:](self->_announcement, "copyWithZone:", a3);
  -[_INPBSendAnnouncementIntent setAnnouncement:](v5, "setAnnouncement:", v6);

  v7 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBSendAnnouncementIntent setIntentMetadata:](v5, "setIntentMetadata:", v7);

  if (-[_INPBSendAnnouncementIntent hasIsReply](self, "hasIsReply"))
    -[_INPBSendAnnouncementIntent setIsReply:](v5, "setIsReply:", -[_INPBSendAnnouncementIntent isReply](self, "isReply"));
  v8 = (void *)-[NSArray copyWithZone:](self->_recipients, "copyWithZone:", a3);
  -[_INPBSendAnnouncementIntent setRecipients:](v5, "setRecipients:", v8);

  v9 = (void *)-[NSString copyWithZone:](self->_sharedUserID, "copyWithZone:", a3);
  -[_INPBSendAnnouncementIntent setSharedUserID:](v5, "setSharedUserID:", v9);

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
  int v17;
  int isReply;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  BOOL v29;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_26;
  -[_INPBSendAnnouncementIntent announcement](self, "announcement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "announcement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_25;
  -[_INPBSendAnnouncementIntent announcement](self, "announcement");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBSendAnnouncementIntent announcement](self, "announcement");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "announcement");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_26;
  }
  else
  {

  }
  -[_INPBSendAnnouncementIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_25;
  -[_INPBSendAnnouncementIntent intentMetadata](self, "intentMetadata");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBSendAnnouncementIntent intentMetadata](self, "intentMetadata");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_26;
  }
  else
  {

  }
  v17 = -[_INPBSendAnnouncementIntent hasIsReply](self, "hasIsReply");
  if (v17 != objc_msgSend(v4, "hasIsReply"))
    goto LABEL_26;
  if (-[_INPBSendAnnouncementIntent hasIsReply](self, "hasIsReply"))
  {
    if (objc_msgSend(v4, "hasIsReply"))
    {
      isReply = self->_isReply;
      if (isReply != objc_msgSend(v4, "isReply"))
        goto LABEL_26;
    }
  }
  -[_INPBSendAnnouncementIntent recipients](self, "recipients");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recipients");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_25;
  -[_INPBSendAnnouncementIntent recipients](self, "recipients");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    -[_INPBSendAnnouncementIntent recipients](self, "recipients");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recipients");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    if (!v23)
      goto LABEL_26;
  }
  else
  {

  }
  -[_INPBSendAnnouncementIntent sharedUserID](self, "sharedUserID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sharedUserID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBSendAnnouncementIntent sharedUserID](self, "sharedUserID");
    v24 = objc_claimAutoreleasedReturnValue();
    if (!v24)
    {

LABEL_29:
      v29 = 1;
      goto LABEL_27;
    }
    v25 = (void *)v24;
    -[_INPBSendAnnouncementIntent sharedUserID](self, "sharedUserID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sharedUserID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "isEqual:", v27);

    if ((v28 & 1) != 0)
      goto LABEL_29;
  }
  else
  {
LABEL_25:

  }
LABEL_26:
  v29 = 0;
LABEL_27:

  return v29;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[_INPBAnnouncement hash](self->_announcement, "hash");
  v4 = -[_INPBIntentMetadata hash](self->_intentMetadata, "hash");
  if (-[_INPBSendAnnouncementIntent hasIsReply](self, "hasIsReply"))
    v5 = 2654435761 * self->_isReply;
  else
    v5 = 0;
  v6 = v4 ^ v3 ^ v5 ^ -[NSArray hash](self->_recipients, "hash");
  return v6 ^ -[NSString hash](self->_sharedUserID, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBSendAnnouncementIntent announcement](self, "announcement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("announcement"));

  -[_INPBSendAnnouncementIntent intentMetadata](self, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("intentMetadata"));

  if (-[_INPBSendAnnouncementIntent hasIsReply](self, "hasIsReply"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBSendAnnouncementIntent isReply](self, "isReply"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("isReply"));

  }
  if (-[NSArray count](self->_recipients, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v10 = self->_recipients;
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v20;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v14), "dictionaryRepresentation", (_QWORD)v19);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v15);

          ++v14;
        }
        while (v12 != v14);
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v12);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("recipients"));
  }
  if (self->_sharedUserID)
  {
    -[_INPBSendAnnouncementIntent sharedUserID](self, "sharedUserID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("sharedUserID"));

  }
  return v3;
}

- (_INPBAnnouncement)announcement
{
  return self->_announcement;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (BOOL)isReply
{
  return self->_isReply;
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (NSString)sharedUserID
{
  return self->_sharedUserID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedUserID, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_announcement, 0);
}

+ (Class)recipientsType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
