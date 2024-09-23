@implementation CTLazuliMessageGroupDispositionNotification

- (id)description
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  int64_t v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliMessageGroupDispositionNotification chatInformation](self, "chatInformation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", chatInformation = %@"), v4);

  v5 = -[CTLazuliMessageGroupDispositionNotification deliveryType](self, "deliveryType");
  v8 = -[CTLazuliMessageGroupDispositionNotification deliveryType](self, "deliveryType");
  objc_msgSend(v3, "appendFormat:", CFSTR(", deliveryType = [%ld - %s]"), v5, print_CTLazuliMessageDispositionNotificationType(&v8));
  -[CTLazuliMessageGroupDispositionNotification messageID](self, "messageID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", messageID = %@"), v6);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliMessageGroupDispositionNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  -[CTLazuliMessageGroupDispositionNotification chatInformation](self, "chatInformation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "chatInformation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToCTLazuliGroupChatInformation:", v6)
    && (v7 = -[CTLazuliMessageGroupDispositionNotification deliveryType](self, "deliveryType"),
        v7 == objc_msgSend(v4, "deliveryType")))
  {
    -[CTLazuliMessageGroupDispositionNotification messageID](self, "messageID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messageID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToCTLazuliMessageID:", v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliMessageGroupDispositionNotification *v4;
  CTLazuliMessageGroupDispositionNotification *v5;
  BOOL v6;

  v4 = (CTLazuliMessageGroupDispositionNotification *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliMessageGroupDispositionNotification isEqualToCTLazuliMessageGroupDispositionNotification:](self, "isEqualToCTLazuliMessageGroupDispositionNotification:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliMessageGroupDispositionNotification *v4;

  v4 = +[CTLazuliMessageGroupDispositionNotification allocWithZone:](CTLazuliMessageGroupDispositionNotification, "allocWithZone:", a3);
  -[CTLazuliMessageGroupDispositionNotification setChatInformation:](v4, "setChatInformation:", self->_chatInformation);
  -[CTLazuliMessageGroupDispositionNotification setDeliveryType:](v4, "setDeliveryType:", self->_deliveryType);
  -[CTLazuliMessageGroupDispositionNotification setMessageID:](v4, "setMessageID:", self->_messageID);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", self->_chatInformation, CFSTR("kChatInformationKey"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", self->_deliveryType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("kDeliveryTypeKey"));

  objc_msgSend(v5, "encodeObject:forKey:", self->_messageID, CFSTR("kMessageIDKey"));
}

- (CTLazuliMessageGroupDispositionNotification)initWithCoder:(id)a3
{
  id v4;
  CTLazuliMessageGroupDispositionNotification *v5;
  uint64_t v6;
  CTLazuliGroupChatInformation *chatInformation;
  void *v8;
  uint64_t v9;
  CTLazuliMessageID *messageID;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CTLazuliMessageGroupDispositionNotification;
  v5 = -[CTLazuliMessageGroupDispositionNotification init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kChatInformationKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    chatInformation = v5->_chatInformation;
    v5->_chatInformation = (CTLazuliGroupChatInformation *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kDeliveryTypeKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_deliveryType = objc_msgSend(v8, "longValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kMessageIDKey"));
    v9 = objc_claimAutoreleasedReturnValue();
    messageID = v5->_messageID;
    v5->_messageID = (CTLazuliMessageID *)v9;

  }
  return v5;
}

- (CTLazuliMessageGroupDispositionNotification)initWithReflection:(const void *)a3
{
  CTLazuliMessageGroupDispositionNotification *v4;
  CTLazuliGroupChatInformation *v5;
  CTLazuliGroupChatInformation *chatInformation;
  CTLazuliMessageID *v7;
  CTLazuliMessageID *messageID;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CTLazuliMessageGroupDispositionNotification;
  v4 = -[CTLazuliMessageGroupDispositionNotification init](&v10, sel_init);
  if (v4)
  {
    v5 = -[CTLazuliGroupChatInformation initWithReflection:]([CTLazuliGroupChatInformation alloc], "initWithReflection:", a3);
    chatInformation = v4->_chatInformation;
    v4->_chatInformation = v5;

    v4->_deliveryType = encode_CTLazuliMessageDispositionNotificationType((unsigned int *)a3 + 80);
    v7 = -[CTLazuliMessageID initWithReflection:]([CTLazuliMessageID alloc], "initWithReflection:", (char *)a3 + 328);
    messageID = v4->_messageID;
    v4->_messageID = v7;

  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTLazuliGroupChatInformation)chatInformation
{
  return self->_chatInformation;
}

- (void)setChatInformation:(id)a3
{
  objc_storeStrong((id *)&self->_chatInformation, a3);
}

- (int64_t)deliveryType
{
  return self->_deliveryType;
}

- (void)setDeliveryType:(int64_t)a3
{
  self->_deliveryType = a3;
}

- (CTLazuliMessageID)messageID
{
  return self->_messageID;
}

- (void)setMessageID:(id)a3
{
  objc_storeStrong((id *)&self->_messageID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageID, 0);
  objc_storeStrong((id *)&self->_chatInformation, 0);
}

@end
