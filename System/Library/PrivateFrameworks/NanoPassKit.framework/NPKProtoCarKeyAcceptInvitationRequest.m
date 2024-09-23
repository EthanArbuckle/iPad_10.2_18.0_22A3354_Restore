@implementation NPKProtoCarKeyAcceptInvitationRequest

- (BOOL)hasInvitationIdentifier
{
  return self->_invitationIdentifier != 0;
}

- (BOOL)hasActivationCode
{
  return self->_activationCode != 0;
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
  v8.super_class = (Class)NPKProtoCarKeyAcceptInvitationRequest;
  -[NPKProtoCarKeyAcceptInvitationRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoCarKeyAcceptInvitationRequest dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *activationCode;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  invitationIdentifier = self->_invitationIdentifier;
  if (invitationIdentifier)
    objc_msgSend(v3, "setObject:forKey:", invitationIdentifier, CFSTR("invitationIdentifier"));
  activationCode = self->_activationCode;
  if (activationCode)
    objc_msgSend(v4, "setObject:forKey:", activationCode, CFSTR("activationCode"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoCarKeyAcceptInvitationRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_invitationIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_activationCode)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_invitationIdentifier)
  {
    objc_msgSend(v4, "setInvitationIdentifier:");
    v4 = v5;
  }
  if (self->_activationCode)
  {
    objc_msgSend(v5, "setActivationCode:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_invitationIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSString copyWithZone:](self->_activationCode, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *invitationIdentifier;
  NSString *activationCode;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((invitationIdentifier = self->_invitationIdentifier, !((unint64_t)invitationIdentifier | v4[2]))
     || -[NSString isEqual:](invitationIdentifier, "isEqual:")))
  {
    activationCode = self->_activationCode;
    if ((unint64_t)activationCode | v4[1])
      v7 = -[NSString isEqual:](activationCode, "isEqual:");
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
  NSUInteger v3;

  v3 = -[NSString hash](self->_invitationIdentifier, "hash");
  return -[NSString hash](self->_activationCode, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  v5 = v4;
  if (v4[2])
  {
    -[NPKProtoCarKeyAcceptInvitationRequest setInvitationIdentifier:](self, "setInvitationIdentifier:");
    v4 = v5;
  }
  if (v4[1])
  {
    -[NPKProtoCarKeyAcceptInvitationRequest setActivationCode:](self, "setActivationCode:");
    v4 = v5;
  }

}

- (NSString)invitationIdentifier
{
  return self->_invitationIdentifier;
}

- (void)setInvitationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_invitationIdentifier, a3);
}

- (NSString)activationCode
{
  return self->_activationCode;
}

- (void)setActivationCode:(id)a3
{
  objc_storeStrong((id *)&self->_activationCode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitationIdentifier, 0);
  objc_storeStrong((id *)&self->_activationCode, 0);
}

@end
