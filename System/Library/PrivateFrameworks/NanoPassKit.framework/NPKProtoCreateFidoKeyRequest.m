@implementation NPKProtoCreateFidoKeyRequest

- (BOOL)hasRelyingParty
{
  return self->_relyingParty != 0;
}

- (BOOL)hasRelyingPartyAccountHash
{
  return self->_relyingPartyAccountHash != 0;
}

- (BOOL)hasChallenge
{
  return self->_challenge != 0;
}

- (BOOL)hasExternalizedAuth
{
  return self->_externalizedAuth != 0;
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
  v8.super_class = (Class)NPKProtoCreateFidoKeyRequest;
  -[NPKProtoCreateFidoKeyRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoCreateFidoKeyRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *relyingParty;
  NSString *relyingPartyAccountHash;
  NSData *challenge;
  NSData *externalizedAuth;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  relyingParty = self->_relyingParty;
  if (relyingParty)
    objc_msgSend(v3, "setObject:forKey:", relyingParty, CFSTR("relyingParty"));
  relyingPartyAccountHash = self->_relyingPartyAccountHash;
  if (relyingPartyAccountHash)
    objc_msgSend(v4, "setObject:forKey:", relyingPartyAccountHash, CFSTR("relyingPartyAccountHash"));
  challenge = self->_challenge;
  if (challenge)
    objc_msgSend(v4, "setObject:forKey:", challenge, CFSTR("challenge"));
  externalizedAuth = self->_externalizedAuth;
  if (externalizedAuth)
    objc_msgSend(v4, "setObject:forKey:", externalizedAuth, CFSTR("externalizedAuth"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoCreateFidoKeyRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_relyingParty)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_relyingPartyAccountHash)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_challenge)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_externalizedAuth)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_relyingParty)
  {
    objc_msgSend(v4, "setRelyingParty:");
    v4 = v5;
  }
  if (self->_relyingPartyAccountHash)
  {
    objc_msgSend(v5, "setRelyingPartyAccountHash:");
    v4 = v5;
  }
  if (self->_challenge)
  {
    objc_msgSend(v5, "setChallenge:");
    v4 = v5;
  }
  if (self->_externalizedAuth)
  {
    objc_msgSend(v5, "setExternalizedAuth:");
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
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_relyingParty, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[NSString copyWithZone:](self->_relyingPartyAccountHash, "copyWithZone:", a3);
  v9 = (void *)v5[4];
  v5[4] = v8;

  v10 = -[NSData copyWithZone:](self->_challenge, "copyWithZone:", a3);
  v11 = (void *)v5[1];
  v5[1] = v10;

  v12 = -[NSData copyWithZone:](self->_externalizedAuth, "copyWithZone:", a3);
  v13 = (void *)v5[2];
  v5[2] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *relyingParty;
  NSString *relyingPartyAccountHash;
  NSData *challenge;
  NSData *externalizedAuth;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((relyingParty = self->_relyingParty, !((unint64_t)relyingParty | v4[3]))
     || -[NSString isEqual:](relyingParty, "isEqual:"))
    && ((relyingPartyAccountHash = self->_relyingPartyAccountHash, !((unint64_t)relyingPartyAccountHash | v4[4]))
     || -[NSString isEqual:](relyingPartyAccountHash, "isEqual:"))
    && ((challenge = self->_challenge, !((unint64_t)challenge | v4[1]))
     || -[NSData isEqual:](challenge, "isEqual:")))
  {
    externalizedAuth = self->_externalizedAuth;
    if ((unint64_t)externalizedAuth | v4[2])
      v9 = -[NSData isEqual:](externalizedAuth, "isEqual:");
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_relyingParty, "hash");
  v4 = -[NSString hash](self->_relyingPartyAccountHash, "hash") ^ v3;
  v5 = -[NSData hash](self->_challenge, "hash");
  return v4 ^ v5 ^ -[NSData hash](self->_externalizedAuth, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[3])
    -[NPKProtoCreateFidoKeyRequest setRelyingParty:](self, "setRelyingParty:");
  if (v4[4])
    -[NPKProtoCreateFidoKeyRequest setRelyingPartyAccountHash:](self, "setRelyingPartyAccountHash:");
  if (v4[1])
    -[NPKProtoCreateFidoKeyRequest setChallenge:](self, "setChallenge:");
  if (v4[2])
    -[NPKProtoCreateFidoKeyRequest setExternalizedAuth:](self, "setExternalizedAuth:");

}

- (NSString)relyingParty
{
  return self->_relyingParty;
}

- (void)setRelyingParty:(id)a3
{
  objc_storeStrong((id *)&self->_relyingParty, a3);
}

- (NSString)relyingPartyAccountHash
{
  return self->_relyingPartyAccountHash;
}

- (void)setRelyingPartyAccountHash:(id)a3
{
  objc_storeStrong((id *)&self->_relyingPartyAccountHash, a3);
}

- (NSData)challenge
{
  return self->_challenge;
}

- (void)setChallenge:(id)a3
{
  objc_storeStrong((id *)&self->_challenge, a3);
}

- (NSData)externalizedAuth
{
  return self->_externalizedAuth;
}

- (void)setExternalizedAuth:(id)a3
{
  objc_storeStrong((id *)&self->_externalizedAuth, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relyingPartyAccountHash, 0);
  objc_storeStrong((id *)&self->_relyingParty, 0);
  objc_storeStrong((id *)&self->_externalizedAuth, 0);
  objc_storeStrong((id *)&self->_challenge, 0);
}

@end
