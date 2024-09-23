@implementation CTLazuliMessageDispositionStatus

- (id)description
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v9;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CTLazuliMessageDispositionStatus deliveryType](self, "deliveryType");
  v9 = -[CTLazuliMessageDispositionStatus deliveryType](self, "deliveryType");
  objc_msgSend(v3, "appendFormat:", CFSTR(", deliveryType = [%ld - %s]"), v4, print_CTLazuliMessageDispositionNotificationType(&v9));
  -[CTLazuliMessageDispositionStatus forMessageID](self, "forMessageID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", forMessageID = %@"), v5);

  -[CTLazuliMessageDispositionStatus from](self, "from");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", from = %@"), v6);

  -[CTLazuliMessageDispositionStatus forGroupChat](self, "forGroupChat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", forGroupChat = %@"), v7);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliMessageDispositionStatus:(id)a3
{
  uint64_t v3;
  id v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;

  v5 = a3;
  v6 = -[CTLazuliMessageDispositionStatus deliveryType](self, "deliveryType");
  if (v6 == objc_msgSend(v5, "deliveryType"))
  {
    -[CTLazuliMessageDispositionStatus forMessageID](self, "forMessageID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "forMessageID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "isEqualToCTLazuliMessageID:", v8))
    {
      v14 = 0;
LABEL_15:

      goto LABEL_16;
    }
    -[CTLazuliMessageDispositionStatus from](self, "from");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "from");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v9, "isEqualToCTLazuliDestination:", v10))
    {
      v14 = 0;
LABEL_14:

      goto LABEL_15;
    }
    -[CTLazuliMessageDispositionStatus forGroupChat](self, "forGroupChat");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 || (objc_msgSend(v5, "forGroupChat"), (v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[CTLazuliMessageDispositionStatus forGroupChat](self, "forGroupChat");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "forGroupChat");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqualToCTLazuliGroupChatUri:", v13);

      if (v11)
      {
LABEL_13:

        goto LABEL_14;
      }
    }
    else
    {
      v14 = 1;
    }
    v11 = (void *)v3;
    goto LABEL_13;
  }
  v14 = 0;
LABEL_16:

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliMessageDispositionStatus *v4;
  CTLazuliMessageDispositionStatus *v5;
  BOOL v6;

  v4 = (CTLazuliMessageDispositionStatus *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliMessageDispositionStatus isEqualToCTLazuliMessageDispositionStatus:](self, "isEqualToCTLazuliMessageDispositionStatus:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliMessageDispositionStatus *v4;

  v4 = +[CTLazuliMessageDispositionStatus allocWithZone:](CTLazuliMessageDispositionStatus, "allocWithZone:", a3);
  -[CTLazuliMessageDispositionStatus setDeliveryType:](v4, "setDeliveryType:", self->_deliveryType);
  -[CTLazuliMessageDispositionStatus setForMessageID:](v4, "setForMessageID:", self->_forMessageID);
  -[CTLazuliMessageDispositionStatus setFrom:](v4, "setFrom:", self->_from);
  -[CTLazuliMessageDispositionStatus setForGroupChat:](v4, "setForGroupChat:", self->_forGroupChat);
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

  objc_msgSend(v5, "encodeObject:forKey:", self->_forMessageID, CFSTR("kForMessageIDKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_from, CFSTR("kFromKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_forGroupChat, CFSTR("kForGroupChatKey"));

}

- (CTLazuliMessageDispositionStatus)initWithCoder:(id)a3
{
  id v4;
  CTLazuliMessageDispositionStatus *v5;
  void *v6;
  uint64_t v7;
  CTLazuliMessageID *forMessageID;
  uint64_t v9;
  CTLazuliDestination *from;
  uint64_t v11;
  CTLazuliGroupChatUri *forGroupChat;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CTLazuliMessageDispositionStatus;
  v5 = -[CTLazuliMessageDispositionStatus init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kDeliveryTypeKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_deliveryType = objc_msgSend(v6, "longValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kForMessageIDKey"));
    v7 = objc_claimAutoreleasedReturnValue();
    forMessageID = v5->_forMessageID;
    v5->_forMessageID = (CTLazuliMessageID *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kFromKey"));
    v9 = objc_claimAutoreleasedReturnValue();
    from = v5->_from;
    v5->_from = (CTLazuliDestination *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kForGroupChatKey"));
    v11 = objc_claimAutoreleasedReturnValue();
    forGroupChat = v5->_forGroupChat;
    v5->_forGroupChat = (CTLazuliGroupChatUri *)v11;

  }
  return v5;
}

- (CTLazuliMessageDispositionStatus)initWithReflection:(const void *)a3
{
  CTLazuliMessageDispositionStatus *v4;
  CTLazuliMessageID *v5;
  CTLazuliMessageID *forMessageID;
  CTLazuliDestination *v7;
  CTLazuliDestination *from;
  CTLazuliGroupChatUri *v9;
  uint64_t v10;
  CTLazuliGroupChatUri *forGroupChat;
  CTLazuliMessageDispositionStatus *result;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CTLazuliMessageDispositionStatus;
  v4 = -[CTLazuliMessageDispositionStatus init](&v13, sel_init);
  if (!v4)
    return v4;
  v4->_deliveryType = encode_CTLazuliMessageDispositionNotificationType((unsigned int *)a3);
  v5 = -[CTLazuliMessageID initWithReflection:]([CTLazuliMessageID alloc], "initWithReflection:", (char *)a3 + 8);
  forMessageID = v4->_forMessageID;
  v4->_forMessageID = v5;

  v7 = -[CTLazuliDestination initWithReflection:]([CTLazuliDestination alloc], "initWithReflection:", (char *)a3 + 32);
  from = v4->_from;
  v4->_from = v7;

  if (!*((_BYTE *)a3 + 216))
  {
    forGroupChat = v4->_forGroupChat;
    v4->_forGroupChat = 0;
    goto LABEL_6;
  }
  v9 = [CTLazuliGroupChatUri alloc];
  if (*((_BYTE *)a3 + 216))
  {
    v10 = -[CTLazuliGroupChatUri initWithReflection:](v9, "initWithReflection:", (char *)a3 + 144);
    forGroupChat = v4->_forGroupChat;
    v4->_forGroupChat = (CTLazuliGroupChatUri *)v10;
LABEL_6:

    return v4;
  }
  result = (CTLazuliMessageDispositionStatus *)std::__throw_bad_optional_access[abi:nn180100]();
  __break(1u);
  return result;
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

- (CTLazuliMessageID)forMessageID
{
  return self->_forMessageID;
}

- (void)setForMessageID:(id)a3
{
  objc_storeStrong((id *)&self->_forMessageID, a3);
}

- (CTLazuliDestination)from
{
  return self->_from;
}

- (void)setFrom:(id)a3
{
  objc_storeStrong((id *)&self->_from, a3);
}

- (CTLazuliGroupChatUri)forGroupChat
{
  return self->_forGroupChat;
}

- (void)setForGroupChat:(id)a3
{
  objc_storeStrong((id *)&self->_forGroupChat, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forGroupChat, 0);
  objc_storeStrong((id *)&self->_from, 0);
  objc_storeStrong((id *)&self->_forMessageID, 0);
}

@end
