@implementation CTLazuliMessageRevokeResult

- (id)description
{
  void *v3;
  void *v4;
  int64_t v5;
  int64_t v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliMessageRevokeResult messageID](self, "messageID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", messageID = %@"), v4);

  v5 = -[CTLazuliMessageRevokeResult status](self, "status");
  v7 = -[CTLazuliMessageRevokeResult status](self, "status");
  objc_msgSend(v3, "appendFormat:", CFSTR(", status = [%ld - %s]"), v5, print_CTLazuliMessageRevokationStatusType(&v7));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliMessageRevokeResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  BOOL v8;

  v4 = a3;
  -[CTLazuliMessageRevokeResult messageID](self, "messageID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToCTLazuliMessageID:", v6))
  {
    v7 = -[CTLazuliMessageRevokeResult status](self, "status");
    v8 = v7 == objc_msgSend(v4, "status");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliMessageRevokeResult *v4;
  CTLazuliMessageRevokeResult *v5;
  BOOL v6;

  v4 = (CTLazuliMessageRevokeResult *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliMessageRevokeResult isEqualToCTLazuliMessageRevokeResult:](self, "isEqualToCTLazuliMessageRevokeResult:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliMessageRevokeResult *v4;

  v4 = +[CTLazuliMessageRevokeResult allocWithZone:](CTLazuliMessageRevokeResult, "allocWithZone:", a3);
  -[CTLazuliMessageRevokeResult setMessageID:](v4, "setMessageID:", self->_messageID);
  -[CTLazuliMessageRevokeResult setStatus:](v4, "setStatus:", self->_status);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", self->_messageID, CFSTR("kMessageIDKey"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", self->_status);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("kStatusKey"));

}

- (CTLazuliMessageRevokeResult)initWithCoder:(id)a3
{
  id v4;
  CTLazuliMessageRevokeResult *v5;
  uint64_t v6;
  CTLazuliMessageID *messageID;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CTLazuliMessageRevokeResult;
  v5 = -[CTLazuliMessageRevokeResult init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kMessageIDKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    messageID = v5->_messageID;
    v5->_messageID = (CTLazuliMessageID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kStatusKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_status = objc_msgSend(v8, "longValue");

  }
  return v5;
}

- (CTLazuliMessageRevokeResult)initWithReflection:(const void *)a3
{
  CTLazuliMessageRevokeResult *v4;
  CTLazuliMessageID *v5;
  CTLazuliMessageID *messageID;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CTLazuliMessageRevokeResult;
  v4 = -[CTLazuliMessageRevokeResult init](&v8, sel_init);
  if (v4)
  {
    v5 = -[CTLazuliMessageID initWithReflection:]([CTLazuliMessageID alloc], "initWithReflection:", a3);
    messageID = v4->_messageID;
    v4->_messageID = v5;

    v4->_status = encode_CTLazuliGroupChatParticipantRoleType((_DWORD *)a3 + 6);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTLazuliMessageID)messageID
{
  return self->_messageID;
}

- (void)setMessageID:(id)a3
{
  objc_storeStrong((id *)&self->_messageID, a3);
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageID, 0);
}

@end
