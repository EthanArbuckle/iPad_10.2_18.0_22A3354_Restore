@implementation NPKProtoCarKeyGetPretrackRequest

- (BOOL)hasInvitationIdentifier
{
  return self->_invitationIdentifier != 0;
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
  v8.super_class = (Class)NPKProtoCarKeyGetPretrackRequest;
  -[NPKProtoCarKeyGetPretrackRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoCarKeyGetPretrackRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *invitationIdentifier;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  invitationIdentifier = self->_invitationIdentifier;
  if (invitationIdentifier)
    objc_msgSend(v3, "setObject:forKey:", invitationIdentifier, CFSTR("invitationIdentifier"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoCarKeyGetPretrackRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_invitationIdentifier)
    PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  NSString *invitationIdentifier;

  invitationIdentifier = self->_invitationIdentifier;
  if (invitationIdentifier)
    objc_msgSend(a3, "setInvitationIdentifier:", invitationIdentifier);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_invitationIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *invitationIdentifier;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    invitationIdentifier = self->_invitationIdentifier;
    if ((unint64_t)invitationIdentifier | v4[1])
      v6 = -[NSString isEqual:](invitationIdentifier, "isEqual:");
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
  return -[NSString hash](self->_invitationIdentifier, "hash");
}

- (void)mergeFrom:(id)a3
{
  if (*((_QWORD *)a3 + 1))
    -[NPKProtoCarKeyGetPretrackRequest setInvitationIdentifier:](self, "setInvitationIdentifier:");
}

- (NSString)invitationIdentifier
{
  return self->_invitationIdentifier;
}

- (void)setInvitationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_invitationIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitationIdentifier, 0);
}

@end
