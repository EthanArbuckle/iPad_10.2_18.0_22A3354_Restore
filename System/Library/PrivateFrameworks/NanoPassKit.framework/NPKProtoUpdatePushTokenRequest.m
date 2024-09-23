@implementation NPKProtoUpdatePushTokenRequest

- (BOOL)hasPushToken
{
  return self->_pushToken != 0;
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
  v8.super_class = (Class)NPKProtoUpdatePushTokenRequest;
  -[NPKProtoUpdatePushTokenRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoUpdatePushTokenRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *pushToken;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  pushToken = self->_pushToken;
  if (pushToken)
    objc_msgSend(v3, "setObject:forKey:", pushToken, CFSTR("pushToken"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoUpdatePushTokenRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_pushToken)
    PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  NSString *pushToken;

  pushToken = self->_pushToken;
  if (pushToken)
    objc_msgSend(a3, "setPushToken:", pushToken);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_pushToken, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *pushToken;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    pushToken = self->_pushToken;
    if ((unint64_t)pushToken | v4[1])
      v6 = -[NSString isEqual:](pushToken, "isEqual:");
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_pushToken, "hash");
}

- (void)mergeFrom:(id)a3
{
  if (*((_QWORD *)a3 + 1))
    -[NPKProtoUpdatePushTokenRequest setPushToken:](self, "setPushToken:");
}

- (NSString)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
  objc_storeStrong((id *)&self->_pushToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushToken, 0);
}

@end
