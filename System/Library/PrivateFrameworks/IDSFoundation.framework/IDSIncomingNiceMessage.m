@implementation IDSIncomingNiceMessage

- (IDSIncomingNiceMessage)initWithMessageDictionary:(id)a3 topic:(id)a4
{
  id v7;
  id v8;
  IDSIncomingNiceMessage *v9;
  IDSIncomingNiceMessage *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IDSIncomingNiceMessage;
  v9 = -[IDSIncomingNiceMessage init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_messageDictionary, a3);
    objc_storeStrong((id *)&v10->_topic, a4);
  }

  return v10;
}

- (id)description
{
  NSString *cachedDescription;
  void *v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  double v8;
  NSString *v9;
  NSString *v10;

  cachedDescription = self->_cachedDescription;
  if (!cachedDescription)
  {
    sub_19BA3F7F8(self->_messageDictionary, self->_topic);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = objc_opt_class();
    objc_msgSend_stringWithFormat_(v5, v7, (uint64_t)CFSTR("<%@:%p %@>"), v8, v6, self, v4);
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    v10 = self->_cachedDescription;
    self->_cachedDescription = v9;

    cachedDescription = self->_cachedDescription;
  }
  return cachedDescription;
}

- (BOOL)isEqual:(id)a3
{
  IDSIncomingNiceMessage *v4;
  IDSIncomingNiceMessage *v5;
  const char *v6;
  double v7;
  NSDictionary *messageDictionary;
  uint64_t v9;
  char isEqualToDictionary;

  v4 = (IDSIncomingNiceMessage *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_6;
  if (v4 == self)
  {
LABEL_7:
    isEqualToDictionary = 1;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_6:
    isEqualToDictionary = 0;
    goto LABEL_8;
  }
  messageDictionary = self->_messageDictionary;
  v9 = (uint64_t)v5->_messageDictionary;
  if (messageDictionary == (NSDictionary *)v9)
    goto LABEL_7;
  isEqualToDictionary = objc_msgSend_isEqualToDictionary_(messageDictionary, v6, v9, v7);
LABEL_8:

  return isEqualToDictionary;
}

- (NSDictionary)rawMessage
{
  return self->_messageDictionary;
}

- (NSString)pushUUID
{
  double v2;
  void *v4;
  const char *v5;
  double v6;
  void *v7;
  void *v8;
  const char *v9;
  double v10;
  uint64_t v11;
  const char *v12;
  double v13;
  void *v14;
  void *v15;

  objc_msgSend_objectForKey_(self->_messageDictionary, a2, (uint64_t)CFSTR("U"), v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (void *)MEMORY[0x1E0C99D50];
    objc_msgSend_objectForKey_(self->_messageDictionary, v5, (uint64_t)CFSTR("U"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__IDSDataFromBase64String_(v7, v9, (uint64_t)v8, v10);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_objectForKey_(self->_messageDictionary, v5, (uint64_t)CFSTR("U"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      JWUUIDPushObjectToString();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    objc_msgSend_objectForKey_(self->_messageDictionary, v12, (uint64_t)CFSTR("U"), v13);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v11;
  JWUUIDPushObjectToString();
  v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return (NSString *)v15;
}

- (NSNumber)expirationDate
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSNumber *)sub_19BA3FC44(v3, self->_messageDictionary, CFSTR("eX"));
}

- (NSNumber)command
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSNumber *)sub_19BA3FC44(v3, self->_messageDictionary, CFSTR("c"));
}

- (NSNumber)commandContext
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSNumber *)sub_19BA3FC44(v3, self->_messageDictionary, CFSTR("cc"));
}

- (IDSURI)toURI
{
  uint64_t v3;
  const char *v4;
  void *v5;
  double v6;
  void *v7;

  v3 = objc_opt_class();
  sub_19BA3FC44(v3, self->_messageDictionary, CFSTR("tP"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend_URIWithPrefixedURI_withServiceLoggingHint_(IDSURI, v4, (uint64_t)v5, v6, self->_topic);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return (IDSURI *)v7;
}

- (NSString)reportID
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSString *)sub_19BA3FC44(v3, self->_messageDictionary, CFSTR("hI"));
}

- (NSData)groupIDData
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSData *)sub_19BA3FC44(v3, self->_messageDictionary, CFSTR("gI"));
}

- (NSString)peerResponseIdentifier
{
  double v2;
  void *v4;
  const char *v5;
  double v6;
  void *v7;
  void *v8;
  const char *v9;
  double v10;
  uint64_t v11;
  const char *v12;
  double v13;
  void *v14;
  void *v15;

  objc_msgSend_objectForKey_(self->_messageDictionary, a2, (uint64_t)CFSTR("rI"), v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (void *)MEMORY[0x1E0C99D50];
    objc_msgSend_objectForKey_(self->_messageDictionary, v5, (uint64_t)CFSTR("rI"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__IDSDataFromBase64String_(v7, v9, (uint64_t)v8, v10);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_objectForKey_(self->_messageDictionary, v5, (uint64_t)CFSTR("rI"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      JWUUIDPushObjectToString();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    objc_msgSend_objectForKey_(self->_messageDictionary, v12, (uint64_t)CFSTR("rI"), v13);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v11;
  JWUUIDPushObjectToString();
  v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return (NSString *)v15;
}

- (NSNumber)wantsAppAck
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSNumber *)sub_19BA3FC44(v3, self->_messageDictionary, CFSTR("wA"));
}

- (NSNumber)expectsPeerResponse
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSNumber *)sub_19BA3FC44(v3, self->_messageDictionary, CFSTR("eR"));
}

- (NSNumber)certifiedDeliveryVersion
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSNumber *)sub_19BA3FC44(v3, self->_messageDictionary, CFSTR("cdv"));
}

- (NSData)updateHash
{
  double v2;
  void *v4;
  const char *v5;
  double v6;
  void *v7;
  void *v8;
  const char *v9;
  double v10;
  uint64_t v11;
  const char *v12;
  double v13;
  void *v14;

  objc_msgSend_objectForKey_(self->_messageDictionary, a2, (uint64_t)CFSTR("qH"), v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (void *)MEMORY[0x1E0C99D50];
    objc_msgSend_objectForKey_(self->_messageDictionary, v5, (uint64_t)CFSTR("qH"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__IDSDataFromBase64String_(v7, v9, (uint64_t)v8, v10);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_objectForKey_(self->_messageDictionary, v5, (uint64_t)CFSTR("qH"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v14 = 0;
      goto LABEL_7;
    }
    objc_msgSend_objectForKey_(self->_messageDictionary, v12, (uint64_t)CFSTR("qH"), v13);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v11;
LABEL_7:

  return (NSData *)v14;
}

- (NSData)encryptedPayload
{
  double v2;
  void *v4;
  const char *v5;
  double v6;
  void *v7;
  void *v8;
  const char *v9;
  double v10;
  uint64_t v11;
  const char *v12;
  double v13;
  void *v14;

  objc_msgSend_objectForKey_(self->_messageDictionary, a2, (uint64_t)CFSTR("P"), v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (void *)MEMORY[0x1E0C99D50];
    objc_msgSend_objectForKey_(self->_messageDictionary, v5, (uint64_t)CFSTR("P"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__IDSDataFromBase64String_(v7, v9, (uint64_t)v8, v10);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_objectForKey_(self->_messageDictionary, v5, (uint64_t)CFSTR("P"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v14 = 0;
      goto LABEL_7;
    }
    objc_msgSend_objectForKey_(self->_messageDictionary, v12, (uint64_t)CFSTR("P"), v13);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v11;
LABEL_7:

  return (NSData *)v14;
}

- (NSData)certifiedDeliveryRTS
{
  double v2;
  void *v4;
  const char *v5;
  double v6;
  void *v7;
  void *v8;
  const char *v9;
  double v10;
  uint64_t v11;
  const char *v12;
  double v13;
  void *v14;

  objc_msgSend_objectForKey_(self->_messageDictionary, a2, (uint64_t)CFSTR("cdr"), v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (void *)MEMORY[0x1E0C99D50];
    objc_msgSend_objectForKey_(self->_messageDictionary, v5, (uint64_t)CFSTR("cdr"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__IDSDataFromBase64String_(v7, v9, (uint64_t)v8, v10);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_objectForKey_(self->_messageDictionary, v5, (uint64_t)CFSTR("cdr"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v14 = 0;
      goto LABEL_7;
    }
    objc_msgSend_objectForKey_(self->_messageDictionary, v12, (uint64_t)CFSTR("cdr"), v13);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v11;
LABEL_7:

  return (NSData *)v14;
}

- (NSNumber)storageContext
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSNumber *)sub_19BA3FC44(v3, self->_messageDictionary, CFSTR("H"));
}

- (NSNumber)serverTimestamp
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSNumber *)sub_19BA3FC44(v3, self->_messageDictionary, CFSTR("e"));
}

- (NSData)rawBulkedData
{
  double v2;
  void *v4;
  const char *v5;
  double v6;
  void *v7;
  void *v8;
  const char *v9;
  double v10;
  uint64_t v11;
  const char *v12;
  double v13;
  void *v14;

  objc_msgSend_objectForKey_(self->_messageDictionary, a2, (uint64_t)CFSTR("N"), v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (void *)MEMORY[0x1E0C99D50];
    objc_msgSend_objectForKey_(self->_messageDictionary, v5, (uint64_t)CFSTR("N"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__IDSDataFromBase64String_(v7, v9, (uint64_t)v8, v10);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_objectForKey_(self->_messageDictionary, v5, (uint64_t)CFSTR("N"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v14 = 0;
      goto LABEL_7;
    }
    objc_msgSend_objectForKey_(self->_messageDictionary, v12, (uint64_t)CFSTR("N"), v13);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v11;
LABEL_7:

  return (NSData *)v14;
}

- (NSData)rawUnencryptedPayload
{
  double v2;
  void *v4;
  const char *v5;
  double v6;
  void *v7;
  void *v8;
  const char *v9;
  double v10;
  uint64_t v11;
  const char *v12;
  double v13;
  void *v14;

  objc_msgSend_objectForKey_(self->_messageDictionary, a2, (uint64_t)CFSTR("P"), v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (void *)MEMORY[0x1E0C99D50];
    objc_msgSend_objectForKey_(self->_messageDictionary, v5, (uint64_t)CFSTR("P"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__IDSDataFromBase64String_(v7, v9, (uint64_t)v8, v10);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_objectForKey_(self->_messageDictionary, v5, (uint64_t)CFSTR("P"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v14 = 0;
      goto LABEL_7;
    }
    objc_msgSend_objectForKey_(self->_messageDictionary, v12, (uint64_t)CFSTR("P"), v13);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v11;
LABEL_7:

  return (NSData *)v14;
}

- (NSNumber)isBulkedPayload
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSNumber *)sub_19BA3FC44(v3, self->_messageDictionary, CFSTR("iB"));
}

- (NSNumber)originalCommand
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSNumber *)sub_19BA3FC44(v3, self->_messageDictionary, CFSTR("oC"));
}

- (IDSPushToken)senderPushToken
{
  double v2;
  void *v4;
  const char *v5;
  double v6;
  void *v7;
  void *v8;
  const char *v9;
  double v10;
  uint64_t v11;
  const char *v12;
  double v13;
  void *v14;
  const char *v15;
  double v16;
  void *v17;

  objc_msgSend_objectForKey_(self->_messageDictionary, a2, (uint64_t)CFSTR("t"), v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (void *)MEMORY[0x1E0C99D50];
    objc_msgSend_objectForKey_(self->_messageDictionary, v5, (uint64_t)CFSTR("t"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__IDSDataFromBase64String_(v7, v9, (uint64_t)v8, v10);
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v14 = (void *)v11;
    goto LABEL_7;
  }
  objc_msgSend_objectForKey_(self->_messageDictionary, v5, (uint64_t)CFSTR("t"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_objectForKey_(self->_messageDictionary, v12, (uint64_t)CFSTR("t"), v13);
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v14 = 0;
LABEL_7:

  if (v14)
  {
    objc_msgSend_pushTokenWithData_withServiceLoggingHint_(IDSPushToken, v15, (uint64_t)v14, v16, self->_topic);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }

  return (IDSPushToken *)v17;
}

- (NSNumber)originalTimestamp
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSNumber *)sub_19BA3FC44(v3, self->_messageDictionary, CFSTR("oe"));
}

- (BOOL)isTrustedSender
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  double v9;
  char v10;

  v3 = objc_opt_class();
  sub_19BA3FC44(v3, self->_messageDictionary, CFSTR("htu"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  sub_19BA3FC44(v5, self->_messageDictionary, CFSTR("htu"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_BOOLValue(v6, v7, v8, v9);

  return v10;
}

- (NSData)payloadMetadataData
{
  double v2;
  void *v4;
  const char *v5;
  double v6;
  void *v7;
  void *v8;
  const char *v9;
  double v10;
  uint64_t v11;
  const char *v12;
  double v13;
  void *v14;

  objc_msgSend_objectForKey_(self->_messageDictionary, a2, (uint64_t)CFSTR("Pm"), v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (void *)MEMORY[0x1E0C99D50];
    objc_msgSend_objectForKey_(self->_messageDictionary, v5, (uint64_t)CFSTR("Pm"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__IDSDataFromBase64String_(v7, v9, (uint64_t)v8, v10);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_objectForKey_(self->_messageDictionary, v5, (uint64_t)CFSTR("Pm"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v14 = 0;
      goto LABEL_7;
    }
    objc_msgSend_objectForKey_(self->_messageDictionary, v12, (uint64_t)CFSTR("Pm"), v13);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v11;
LABEL_7:

  return (NSData *)v14;
}

- (NSString)encryptionTypeStr
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSString *)sub_19BA3FC44(v3, self->_messageDictionary, CFSTR("E"));
}

- (NSNumber)wantsCheckpointing
{
  double v2;

  return (NSNumber *)objc_msgSend__numberForKey_(self->_messageDictionary, a2, (uint64_t)CFSTR("mc"), v2);
}

- (NSNumber)failureReason
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSNumber *)sub_19BA3FC44(v3, self->_messageDictionary, CFSTR("fR"));
}

- (NSString)failureMessageID
{
  double v2;
  void *v4;
  const char *v5;
  double v6;
  void *v7;
  void *v8;
  const char *v9;
  double v10;
  uint64_t v11;
  const char *v12;
  double v13;
  void *v14;
  void *v15;

  objc_msgSend_objectForKey_(self->_messageDictionary, a2, (uint64_t)CFSTR("fU"), v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (void *)MEMORY[0x1E0C99D50];
    objc_msgSend_objectForKey_(self->_messageDictionary, v5, (uint64_t)CFSTR("fU"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__IDSDataFromBase64String_(v7, v9, (uint64_t)v8, v10);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_objectForKey_(self->_messageDictionary, v5, (uint64_t)CFSTR("fU"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      JWUUIDPushObjectToString();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    objc_msgSend_objectForKey_(self->_messageDictionary, v12, (uint64_t)CFSTR("fU"), v13);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v11;
  JWUUIDPushObjectToString();
  v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return (NSString *)v15;
}

- (NSString)failureReasonMessage
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSString *)sub_19BA3FC44(v3, self->_messageDictionary, CFSTR("fRM"));
}

- (NSNumber)storageFlags
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSNumber *)sub_19BA3FC44(v3, self->_messageDictionary, CFSTR("H"));
}

- (NSString)storageFetchUUID
{
  double v2;
  void *v4;
  const char *v5;
  double v6;
  void *v7;
  void *v8;
  const char *v9;
  double v10;
  uint64_t v11;
  const char *v12;
  double v13;
  void *v14;
  void *v15;

  objc_msgSend_objectForKey_(self->_messageDictionary, a2, (uint64_t)CFSTR("scU"), v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (void *)MEMORY[0x1E0C99D50];
    objc_msgSend_objectForKey_(self->_messageDictionary, v5, (uint64_t)CFSTR("scU"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__IDSDataFromBase64String_(v7, v9, (uint64_t)v8, v10);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_objectForKey_(self->_messageDictionary, v5, (uint64_t)CFSTR("scU"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      JWUUIDPushObjectToString();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    objc_msgSend_objectForKey_(self->_messageDictionary, v12, (uint64_t)CFSTR("scU"), v13);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v11;
  JWUUIDPushObjectToString();
  v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return (NSString *)v15;
}

- (NSNumber)retryCount
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSNumber *)sub_19BA3FC44(v3, self->_messageDictionary, CFSTR("rc"));
}

- (IDSURI)fromURI
{
  uint64_t v3;
  const char *v4;
  void *v5;
  double v6;
  void *v7;

  v3 = objc_opt_class();
  sub_19BA3FC44(v3, self->_messageDictionary, CFSTR("sP"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend_URIWithPrefixedURI_withServiceLoggingHint_(IDSURI, v4, (uint64_t)v5, v6, self->_topic);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return (IDSURI *)v7;
}

- (NSArray)messageList
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)sub_19BA3FC44(v3, self->_messageDictionary, CFSTR("mml"));
}

- (NSString)senderShortHandle
{
  double v2;
  void *v4;
  const char *v5;
  double v6;
  void *v7;
  void *v8;
  const char *v9;
  double v10;
  uint64_t v11;
  const char *v12;
  double v13;
  void *v14;
  const char *v15;
  double v16;
  void *v17;

  objc_msgSend_objectForKey_(self->_messageDictionary, a2, (uint64_t)CFSTR("sPs"), v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (void *)MEMORY[0x1E0C99D50];
    objc_msgSend_objectForKey_(self->_messageDictionary, v5, (uint64_t)CFSTR("sPs"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__IDSDataFromBase64String_(v7, v9, (uint64_t)v8, v10);
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v14 = (void *)v11;
    goto LABEL_7;
  }
  objc_msgSend_objectForKey_(self->_messageDictionary, v5, (uint64_t)CFSTR("sPs"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_objectForKey_(self->_messageDictionary, v12, (uint64_t)CFSTR("sPs"), v13);
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v14 = 0;
LABEL_7:

  if (v14)
  {
    objc_msgSend_base64EncodedStringWithOptions_(v14, v15, 0, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }

  return (NSString *)v17;
}

- (NSString)receiverShortHandle
{
  double v2;
  void *v4;
  const char *v5;
  double v6;
  void *v7;
  void *v8;
  const char *v9;
  double v10;
  uint64_t v11;
  const char *v12;
  double v13;
  void *v14;
  const char *v15;
  double v16;
  void *v17;

  objc_msgSend_objectForKey_(self->_messageDictionary, a2, (uint64_t)CFSTR("tPs"), v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (void *)MEMORY[0x1E0C99D50];
    objc_msgSend_objectForKey_(self->_messageDictionary, v5, (uint64_t)CFSTR("tPs"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__IDSDataFromBase64String_(v7, v9, (uint64_t)v8, v10);
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v14 = (void *)v11;
    goto LABEL_7;
  }
  objc_msgSend_objectForKey_(self->_messageDictionary, v5, (uint64_t)CFSTR("tPs"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_objectForKey_(self->_messageDictionary, v12, (uint64_t)CFSTR("tPs"), v13);
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v14 = 0;
LABEL_7:

  if (v14)
  {
    objc_msgSend_base64EncodedStringWithOptions_(v14, v15, 0, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }

  return (NSString *)v17;
}

- (NSNumber)messageChunkNumber
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSNumber *)sub_19BA3FC44(v3, self->_messageDictionary, CFSTR("mcn"));
}

- (NSNumber)totalChunkCount
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSNumber *)sub_19BA3FC44(v3, self->_messageDictionary, CFSTR("tcc"));
}

- (NSString)originalUUID
{
  double v2;
  void *v4;
  const char *v5;
  double v6;
  void *v7;
  void *v8;
  const char *v9;
  double v10;
  uint64_t v11;
  const char *v12;
  double v13;
  void *v14;
  void *v15;

  objc_msgSend_objectForKey_(self->_messageDictionary, a2, (uint64_t)CFSTR("oU"), v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (void *)MEMORY[0x1E0C99D50];
    objc_msgSend_objectForKey_(self->_messageDictionary, v5, (uint64_t)CFSTR("oU"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__IDSDataFromBase64String_(v7, v9, (uint64_t)v8, v10);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_objectForKey_(self->_messageDictionary, v5, (uint64_t)CFSTR("oU"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      JWUUIDPushObjectToString();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    objc_msgSend_objectForKey_(self->_messageDictionary, v12, (uint64_t)CFSTR("oU"), v13);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v11;
  JWUUIDPushObjectToString();
  v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return (NSString *)v15;
}

- (NSNumber)pendingMessageCount
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSNumber *)sub_19BA3FC44(v3, self->_messageDictionary, CFSTR("pmc"));
}

- (NSNumber)pendingMessagePerSenderCount
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSNumber *)sub_19BA3FC44(v3, self->_messageDictionary, CFSTR("pms"));
}

- (NSNumber)desiredProtocol
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSNumber *)sub_19BA3FC44(v3, self->_messageDictionary, CFSTR("dp"));
}

- (NSDictionary)messageDictionary
{
  return self->_messageDictionary;
}

- (void)setMessageDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_messageDictionary, a3);
}

- (NSString)topic
{
  return self->_topic;
}

- (void)setTopic:(id)a3
{
  objc_storeStrong((id *)&self->_topic, a3);
}

- (NSString)cachedDescription
{
  return self->_cachedDescription;
}

- (void)setCachedDescription:(id)a3
{
  objc_storeStrong((id *)&self->_cachedDescription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedDescription, 0);
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_messageDictionary, 0);
}

@end
