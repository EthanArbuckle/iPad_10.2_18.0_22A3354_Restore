@implementation CTLazuliMessageDispositionNotification

- (id)description
{
  void *v3;
  int64_t v4;
  void *v5;
  int64_t v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CTLazuliMessageDispositionNotification deliveryType](self, "deliveryType");
  v7 = -[CTLazuliMessageDispositionNotification deliveryType](self, "deliveryType");
  objc_msgSend(v3, "appendFormat:", CFSTR(", deliveryType = [%ld - %s]"), v4, print_CTLazuliMessageDispositionNotificationType(&v7));
  -[CTLazuliMessageDispositionNotification messageID](self, "messageID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", messageID = %@"), v5);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliMessageDispositionNotification:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  v5 = -[CTLazuliMessageDispositionNotification deliveryType](self, "deliveryType");
  if (v5 == objc_msgSend(v4, "deliveryType"))
  {
    -[CTLazuliMessageDispositionNotification messageID](self, "messageID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messageID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToCTLazuliMessageID:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliMessageDispositionNotification *v4;
  CTLazuliMessageDispositionNotification *v5;
  BOOL v6;

  v4 = (CTLazuliMessageDispositionNotification *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliMessageDispositionNotification isEqualToCTLazuliMessageDispositionNotification:](self, "isEqualToCTLazuliMessageDispositionNotification:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliMessageDispositionNotification *v4;

  v4 = +[CTLazuliMessageDispositionNotification allocWithZone:](CTLazuliMessageDispositionNotification, "allocWithZone:", a3);
  -[CTLazuliMessageDispositionNotification setDeliveryType:](v4, "setDeliveryType:", self->_deliveryType);
  -[CTLazuliMessageDispositionNotification setMessageID:](v4, "setMessageID:", self->_messageID);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", self->_deliveryType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("kDeliveryTypeKey"));

  objc_msgSend(v5, "encodeObject:forKey:", self->_messageID, CFSTR("kMessageIDKey"));
}

- (CTLazuliMessageDispositionNotification)initWithCoder:(id)a3
{
  id v4;
  CTLazuliMessageDispositionNotification *v5;
  void *v6;
  uint64_t v7;
  CTLazuliMessageID *messageID;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CTLazuliMessageDispositionNotification;
  v5 = -[CTLazuliMessageDispositionNotification init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kDeliveryTypeKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_deliveryType = objc_msgSend(v6, "longValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kMessageIDKey"));
    v7 = objc_claimAutoreleasedReturnValue();
    messageID = v5->_messageID;
    v5->_messageID = (CTLazuliMessageID *)v7;

  }
  return v5;
}

- (CTLazuliMessageDispositionNotification)initWithReflection:(const void *)a3
{
  CTLazuliMessageDispositionNotification *v4;
  CTLazuliMessageID *v5;
  CTLazuliMessageID *messageID;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CTLazuliMessageDispositionNotification;
  v4 = -[CTLazuliMessageDispositionNotification init](&v8, sel_init);
  if (v4)
  {
    v4->_deliveryType = encode_CTLazuliMessageDispositionNotificationType((unsigned int *)a3);
    v5 = -[CTLazuliMessageID initWithReflection:]([CTLazuliMessageID alloc], "initWithReflection:", (char *)a3 + 8);
    messageID = v4->_messageID;
    v4->_messageID = v5;

  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
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
}

@end
