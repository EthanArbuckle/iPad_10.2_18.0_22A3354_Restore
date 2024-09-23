@implementation NPKProtoInsertBridgeNotificationRequest

- (BOOL)hasActionURLString
{
  return self->_actionURLString != 0;
}

- (BOOL)hasPassUniqueID
{
  return self->_passUniqueID != 0;
}

- (void)setPlaySound:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_playSound = a3;
}

- (void)setHasPlaySound:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPlaySound
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasNotificationIdentifier
{
  return self->_notificationIdentifier != 0;
}

- (BOOL)hasExpirationDateData
{
  return self->_expirationDateData != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoInsertBridgeNotificationRequest;
  -[NPKProtoInsertBridgeNotificationRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoInsertBridgeNotificationRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *title;
  NSString *message;
  NSString *actionURLString;
  NSString *passUniqueID;
  void *v9;
  NSString *notificationIdentifier;
  NSData *expirationDateData;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  title = self->_title;
  if (title)
    objc_msgSend(v3, "setObject:forKey:", title, CFSTR("title"));
  message = self->_message;
  if (message)
    objc_msgSend(v4, "setObject:forKey:", message, CFSTR("message"));
  actionURLString = self->_actionURLString;
  if (actionURLString)
    objc_msgSend(v4, "setObject:forKey:", actionURLString, CFSTR("actionURLString"));
  passUniqueID = self->_passUniqueID;
  if (passUniqueID)
    objc_msgSend(v4, "setObject:forKey:", passUniqueID, CFSTR("passUniqueID"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_playSound);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("playSound"));

  }
  notificationIdentifier = self->_notificationIdentifier;
  if (notificationIdentifier)
    objc_msgSend(v4, "setObject:forKey:", notificationIdentifier, CFSTR("notificationIdentifier"));
  expirationDateData = self->_expirationDateData;
  if (expirationDateData)
    objc_msgSend(v4, "setObject:forKey:", expirationDateData, CFSTR("expirationDateData"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoInsertBridgeNotificationRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (!self->_title)
    -[NPKProtoInsertBridgeNotificationRequest writeTo:].cold.1();
  v6 = v4;
  PBDataWriterWriteStringField();
  if (!self->_message)
    -[NPKProtoInsertBridgeNotificationRequest writeTo:].cold.2();
  PBDataWriterWriteStringField();
  if (self->_actionURLString)
    PBDataWriterWriteStringField();
  if (self->_passUniqueID)
    PBDataWriterWriteStringField();
  v5 = v6;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v5 = v6;
  }
  if (self->_notificationIdentifier)
  {
    PBDataWriterWriteStringField();
    v5 = v6;
  }
  if (self->_expirationDateData)
  {
    PBDataWriterWriteDataField();
    v5 = v6;
  }

}

- (void)copyTo:(id)a3
{
  void *v4;
  _BYTE *v5;

  v5 = a3;
  objc_msgSend(v5, "setTitle:", self->_title);
  objc_msgSend(v5, "setMessage:", self->_message);
  if (self->_actionURLString)
    objc_msgSend(v5, "setActionURLString:");
  if (self->_passUniqueID)
    objc_msgSend(v5, "setPassUniqueID:");
  v4 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5[56] = self->_playSound;
    v5[60] |= 1u;
  }
  if (self->_notificationIdentifier)
  {
    objc_msgSend(v5, "setNotificationIdentifier:");
    v4 = v5;
  }
  if (self->_expirationDateData)
  {
    objc_msgSend(v5, "setExpirationDateData:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v6;

  v8 = -[NSString copyWithZone:](self->_message, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v10 = -[NSString copyWithZone:](self->_actionURLString, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v10;

  v12 = -[NSString copyWithZone:](self->_passUniqueID, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v12;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 56) = self->_playSound;
    *(_BYTE *)(v5 + 60) |= 1u;
  }
  v14 = -[NSString copyWithZone:](self->_notificationIdentifier, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v14;

  v16 = -[NSData copyWithZone:](self->_expirationDateData, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v16;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *title;
  NSString *message;
  NSString *actionURLString;
  NSString *passUniqueID;
  NSString *notificationIdentifier;
  NSData *expirationDateData;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  title = self->_title;
  if ((unint64_t)title | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](title, "isEqual:"))
      goto LABEL_22;
  }
  message = self->_message;
  if ((unint64_t)message | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](message, "isEqual:"))
      goto LABEL_22;
  }
  actionURLString = self->_actionURLString;
  if ((unint64_t)actionURLString | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](actionURLString, "isEqual:"))
      goto LABEL_22;
  }
  passUniqueID = self->_passUniqueID;
  if ((unint64_t)passUniqueID | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](passUniqueID, "isEqual:"))
      goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) != 0)
    {
      if (self->_playSound)
      {
        if (!*((_BYTE *)v4 + 56))
          goto LABEL_22;
        goto LABEL_18;
      }
      if (!*((_BYTE *)v4 + 56))
        goto LABEL_18;
    }
LABEL_22:
    v11 = 0;
    goto LABEL_23;
  }
  if ((*((_BYTE *)v4 + 60) & 1) != 0)
    goto LABEL_22;
LABEL_18:
  notificationIdentifier = self->_notificationIdentifier;
  if ((unint64_t)notificationIdentifier | *((_QWORD *)v4 + 4)
    && !-[NSString isEqual:](notificationIdentifier, "isEqual:"))
  {
    goto LABEL_22;
  }
  expirationDateData = self->_expirationDateData;
  if ((unint64_t)expirationDateData | *((_QWORD *)v4 + 2))
    v11 = -[NSData isEqual:](expirationDateData, "isEqual:");
  else
    v11 = 1;
LABEL_23:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;

  v3 = -[NSString hash](self->_title, "hash");
  v4 = -[NSString hash](self->_message, "hash");
  v5 = -[NSString hash](self->_actionURLString, "hash");
  v6 = -[NSString hash](self->_passUniqueID, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v7 = 2654435761 * self->_playSound;
  else
    v7 = 0;
  v8 = v4 ^ v3 ^ v5 ^ v6;
  v9 = v7 ^ -[NSString hash](self->_notificationIdentifier, "hash");
  return v8 ^ v9 ^ -[NSData hash](self->_expirationDateData, "hash");
}

- (void)mergeFrom:(id)a3
{
  BOOL *v4;
  BOOL *v5;

  v4 = (BOOL *)a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 6))
  {
    -[NPKProtoInsertBridgeNotificationRequest setTitle:](self, "setTitle:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[NPKProtoInsertBridgeNotificationRequest setMessage:](self, "setMessage:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[NPKProtoInsertBridgeNotificationRequest setActionURLString:](self, "setActionURLString:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[NPKProtoInsertBridgeNotificationRequest setPassUniqueID:](self, "setPassUniqueID:");
    v4 = v5;
  }
  if (v4[60])
  {
    self->_playSound = v4[56];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[NPKProtoInsertBridgeNotificationRequest setNotificationIdentifier:](self, "setNotificationIdentifier:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[NPKProtoInsertBridgeNotificationRequest setExpirationDateData:](self, "setExpirationDateData:");
    v4 = v5;
  }

}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (NSString)actionURLString
{
  return self->_actionURLString;
}

- (void)setActionURLString:(id)a3
{
  objc_storeStrong((id *)&self->_actionURLString, a3);
}

- (NSString)passUniqueID
{
  return self->_passUniqueID;
}

- (void)setPassUniqueID:(id)a3
{
  objc_storeStrong((id *)&self->_passUniqueID, a3);
}

- (BOOL)playSound
{
  return self->_playSound;
}

- (NSString)notificationIdentifier
{
  return self->_notificationIdentifier;
}

- (void)setNotificationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_notificationIdentifier, a3);
}

- (NSData)expirationDateData
{
  return self->_expirationDateData;
}

- (void)setExpirationDateData:(id)a3
{
  objc_storeStrong((id *)&self->_expirationDateData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_passUniqueID, 0);
  objc_storeStrong((id *)&self->_notificationIdentifier, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_expirationDateData, 0);
  objc_storeStrong((id *)&self->_actionURLString, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoInsertBridgeNotificationRequest writeTo:]", "NPKProtoInsertBridgeNotificationRequest.m", 167, "nil != self->_title");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[NPKProtoInsertBridgeNotificationRequest writeTo:]", "NPKProtoInsertBridgeNotificationRequest.m", 172, "nil != self->_message");
}

@end
