@implementation NPKProtoCreateShareForPartialShareInvitationRequest

- (BOOL)hasAuthorizationData
{
  return self->_authorizationData != 0;
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
  v8.super_class = (Class)NPKProtoCreateShareForPartialShareInvitationRequest;
  -[NPKProtoCreateShareForPartialShareInvitationRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoCreateShareForPartialShareInvitationRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *inviteData;
  NSData *authorizationData;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  inviteData = self->_inviteData;
  if (inviteData)
    objc_msgSend(v3, "setObject:forKey:", inviteData, CFSTR("inviteData"));
  authorizationData = self->_authorizationData;
  if (authorizationData)
    objc_msgSend(v4, "setObject:forKey:", authorizationData, CFSTR("authorizationData"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoCreateShareForPartialShareInvitationRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_inviteData)
    -[NPKProtoCreateShareForPartialShareInvitationRequest writeTo:].cold.1();
  v5 = v4;
  PBDataWriterWriteDataField();
  if (self->_authorizationData)
    PBDataWriterWriteDataField();

}

- (void)copyTo:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setInviteData:", self->_inviteData);
  if (self->_authorizationData)
    objc_msgSend(v4, "setAuthorizationData:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_inviteData, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSData copyWithZone:](self->_authorizationData, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *inviteData;
  NSData *authorizationData;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((inviteData = self->_inviteData, !((unint64_t)inviteData | v4[2]))
     || -[NSData isEqual:](inviteData, "isEqual:")))
  {
    authorizationData = self->_authorizationData;
    if ((unint64_t)authorizationData | v4[1])
      v7 = -[NSData isEqual:](authorizationData, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSData hash](self->_inviteData, "hash");
  return -[NSData hash](self->_authorizationData, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  v5 = v4;
  if (v4[2])
  {
    -[NPKProtoCreateShareForPartialShareInvitationRequest setInviteData:](self, "setInviteData:");
    v4 = v5;
  }
  if (v4[1])
  {
    -[NPKProtoCreateShareForPartialShareInvitationRequest setAuthorizationData:](self, "setAuthorizationData:");
    v4 = v5;
  }

}

- (NSData)inviteData
{
  return self->_inviteData;
}

- (void)setInviteData:(id)a3
{
  objc_storeStrong((id *)&self->_inviteData, a3);
}

- (NSData)authorizationData
{
  return self->_authorizationData;
}

- (void)setAuthorizationData:(id)a3
{
  objc_storeStrong((id *)&self->_authorizationData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inviteData, 0);
  objc_storeStrong((id *)&self->_authorizationData, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoCreateShareForPartialShareInvitationRequest writeTo:]", "NPKProtoCreateShareForPartialShareInvitationRequest.m", 87, "nil != self->_inviteData");
}

@end
