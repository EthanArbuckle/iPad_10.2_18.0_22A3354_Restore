@implementation CTLazuliMessageRevokeData

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliMessageRevokeData destination](self, "destination");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", destination = %@"), v4);

  -[CTLazuliMessageRevokeData messageID](self, "messageID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", messageID = %@"), v5);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliMessageRevokeData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[CTLazuliMessageRevokeData destination](self, "destination");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "destination");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToCTLazuliDestination:", v6))
  {
    -[CTLazuliMessageRevokeData messageID](self, "messageID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messageID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToCTLazuliMessageID:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliMessageRevokeData *v4;
  CTLazuliMessageRevokeData *v5;
  BOOL v6;

  v4 = (CTLazuliMessageRevokeData *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliMessageRevokeData isEqualToCTLazuliMessageRevokeData:](self, "isEqualToCTLazuliMessageRevokeData:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliMessageRevokeData *v4;

  v4 = +[CTLazuliMessageRevokeData allocWithZone:](CTLazuliMessageRevokeData, "allocWithZone:", a3);
  -[CTLazuliMessageRevokeData setDestination:](v4, "setDestination:", self->_destination);
  -[CTLazuliMessageRevokeData setMessageID:](v4, "setMessageID:", self->_messageID);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_destination, CFSTR("kDestinationKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_messageID, CFSTR("kMessageIDKey"));

}

- (CTLazuliMessageRevokeData)initWithCoder:(id)a3
{
  id v4;
  CTLazuliMessageRevokeData *v5;
  uint64_t v6;
  CTLazuliDestination *destination;
  uint64_t v8;
  CTLazuliMessageID *messageID;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTLazuliMessageRevokeData;
  v5 = -[CTLazuliMessageRevokeData init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kDestinationKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    destination = v5->_destination;
    v5->_destination = (CTLazuliDestination *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kMessageIDKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    messageID = v5->_messageID;
    v5->_messageID = (CTLazuliMessageID *)v8;

  }
  return v5;
}

- (CTLazuliMessageRevokeData)initWithReflection:(const void *)a3
{
  CTLazuliMessageRevokeData *v4;
  CTLazuliDestination *v5;
  CTLazuliDestination *destination;
  CTLazuliMessageID *v7;
  CTLazuliMessageID *messageID;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CTLazuliMessageRevokeData;
  v4 = -[CTLazuliMessageRevokeData init](&v10, sel_init);
  if (v4)
  {
    v5 = -[CTLazuliDestination initWithReflection:]([CTLazuliDestination alloc], "initWithReflection:", a3);
    destination = v4->_destination;
    v4->_destination = v5;

    v7 = -[CTLazuliMessageID initWithReflection:]([CTLazuliMessageID alloc], "initWithReflection:", (char *)a3 + 112);
    messageID = v4->_messageID;
    v4->_messageID = v7;

  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTLazuliDestination)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
  objc_storeStrong((id *)&self->_destination, a3);
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
  objc_storeStrong((id *)&self->_destination, 0);
}

@end
