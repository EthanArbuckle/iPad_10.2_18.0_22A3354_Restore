@implementation NPKProtoCarKeyStartShareAcceptanceFlowRequest

- (BOOL)hasInvitationData
{
  return self->_invitationData != 0;
}

- (BOOL)hasTransportationIdentifier
{
  return self->_transportationIdentifier != 0;
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
  v8.super_class = (Class)NPKProtoCarKeyStartShareAcceptanceFlowRequest;
  -[NPKProtoCarKeyStartShareAcceptanceFlowRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoCarKeyStartShareAcceptanceFlowRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *invitationData;
  NSString *transportationIdentifier;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  invitationData = self->_invitationData;
  if (invitationData)
    objc_msgSend(v3, "setObject:forKey:", invitationData, CFSTR("invitationData"));
  transportationIdentifier = self->_transportationIdentifier;
  if (transportationIdentifier)
    objc_msgSend(v4, "setObject:forKey:", transportationIdentifier, CFSTR("transportationIdentifier"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoCarKeyStartShareAcceptanceFlowRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_invitationData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_transportationIdentifier)
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
  if (self->_invitationData)
  {
    objc_msgSend(v4, "setInvitationData:");
    v4 = v5;
  }
  if (self->_transportationIdentifier)
  {
    objc_msgSend(v5, "setTransportationIdentifier:");
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
  v6 = -[NSData copyWithZone:](self->_invitationData, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_transportationIdentifier, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *invitationData;
  NSString *transportationIdentifier;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((invitationData = self->_invitationData, !((unint64_t)invitationData | v4[1]))
     || -[NSData isEqual:](invitationData, "isEqual:")))
  {
    transportationIdentifier = self->_transportationIdentifier;
    if ((unint64_t)transportationIdentifier | v4[2])
      v7 = -[NSString isEqual:](transportationIdentifier, "isEqual:");
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

  v3 = -[NSData hash](self->_invitationData, "hash");
  return -[NSString hash](self->_transportationIdentifier, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  v5 = v4;
  if (v4[1])
  {
    -[NPKProtoCarKeyStartShareAcceptanceFlowRequest setInvitationData:](self, "setInvitationData:");
    v4 = v5;
  }
  if (v4[2])
  {
    -[NPKProtoCarKeyStartShareAcceptanceFlowRequest setTransportationIdentifier:](self, "setTransportationIdentifier:");
    v4 = v5;
  }

}

- (NSData)invitationData
{
  return self->_invitationData;
}

- (void)setInvitationData:(id)a3
{
  objc_storeStrong((id *)&self->_invitationData, a3);
}

- (NSString)transportationIdentifier
{
  return self->_transportationIdentifier;
}

- (void)setTransportationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_transportationIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportationIdentifier, 0);
  objc_storeStrong((id *)&self->_invitationData, 0);
}

@end
