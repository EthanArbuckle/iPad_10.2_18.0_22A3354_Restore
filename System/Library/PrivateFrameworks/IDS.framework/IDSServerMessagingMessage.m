@implementation IDSServerMessagingMessage

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IDSServerMessagingMessage;
  v4 = -[IDSMessage copyWithZone:](&v9, sel_copyWithZone_, a3);
  -[IDSServerMessagingMessage expirationDate](self, "expirationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExpirationDate:", v5);

  -[IDSServerMessagingMessage messageID](self, "messageID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMessageID:", v6);

  -[IDSServerMessagingMessage messageData](self, "messageData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMessageData:", v7);

  return v4;
}

- (int64_t)command
{
  void *v3;
  void *v4;
  int64_t v5;

  -[IDSServerMessagingMessage userSpecifiedCommand](self, "userSpecifiedCommand");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 100;
  -[IDSServerMessagingMessage userSpecifiedCommand](self, "userSpecifiedCommand");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  return v5;
}

- (BOOL)wantsResponse
{
  return 1;
}

- (id)messageBody
{
  void *v3;
  __CFDictionary *v4;
  uint64_t v5;
  void *v6;
  id v7;
  const char *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v21;
  objc_super v22;
  uuid_t uu;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v22.receiver = self;
  v22.super_class = (Class)IDSServerMessagingMessage;
  -[IDSMessage messageBody](&v22, sel_messageBody);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (__CFDictionary *)objc_msgSend(v3, "mutableCopy");

  -[IDSServerMessagingMessage messageID](self, "messageID");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[IDSServerMessagingMessage messageID](self, "messageID");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = (const char *)objc_msgSend(v7, "UTF8String");

    if (v8)
    {
      memset(uu, 170, sizeof(uu));
      uuid_parse(v8, uu);
      v21 = 0;
      jw_uuid_to_data();
      v9 = 0;
      if (v9)
      {
        CFDictionarySetValue(v4, CFSTR("U"), v9);
      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        sub_1907FEB64();
      }

    }
  }
  -[IDSServerMessagingMessage messageData](self, "messageData", v21);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    CFDictionarySetValue(v4, CFSTR("P"), v10);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    sub_1907FEAE4();
  }

  -[IDSBaseMessage pushToken](self, "pushToken");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    CFDictionarySetValue(v4, CFSTR("t"), v11);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    sub_1907FEA64();
  }

  -[IDSServerMessagingMessage expirationDate](self, "expirationDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = (void *)MEMORY[0x1E0CB37E8];
    -[IDSServerMessagingMessage expirationDate](self, "expirationDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSince1970");
    objc_msgSend(v13, "numberWithUnsignedLong:", (unint64_t)v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
      CFDictionarySetValue(v4, (const void *)*MEMORY[0x1E0D346F8], v16);

  }
  -[IDSServerMessagingMessage userDefinedTopLevelFields](self, "userDefinedTopLevelFields");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (v18)
  {
    -[IDSServerMessagingMessage userDefinedTopLevelFields](self, "userDefinedTopLevelFields");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFDictionary addEntriesFromDictionary:](v4, "addEntriesFromDictionary:", v19);

  }
  return v4;
}

- (NSData)messageData
{
  return self->_messageData;
}

- (void)setMessageData:(id)a3
{
  objc_storeStrong((id *)&self->_messageData, a3);
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_storeStrong((id *)&self->_expirationDate, a3);
}

- (NSString)messageID
{
  return self->_messageID;
}

- (void)setMessageID:(id)a3
{
  objc_storeStrong((id *)&self->_messageID, a3);
}

- (NSNumber)userSpecifiedCommand
{
  return self->_userSpecifiedCommand;
}

- (void)setUserSpecifiedCommand:(id)a3
{
  objc_storeStrong((id *)&self->_userSpecifiedCommand, a3);
}

- (NSDictionary)userDefinedTopLevelFields
{
  return self->_userDefinedTopLevelFields;
}

- (void)setUserDefinedTopLevelFields:(id)a3
{
  objc_storeStrong((id *)&self->_userDefinedTopLevelFields, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefinedTopLevelFields, 0);
  objc_storeStrong((id *)&self->_userSpecifiedCommand, 0);
  objc_storeStrong((id *)&self->_messageID, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_messageData, 0);
}

@end
