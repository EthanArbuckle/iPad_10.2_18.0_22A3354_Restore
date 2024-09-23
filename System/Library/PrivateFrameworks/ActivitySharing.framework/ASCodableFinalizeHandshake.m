@implementation ASCodableFinalizeHandshake

- (BOOL)hasHandshakeToken
{
  return self->_handshakeToken != 0;
}

- (BOOL)hasInviterShareLocations
{
  return self->_inviterShareLocations != 0;
}

- (BOOL)hasActivityDataPreview
{
  return self->_activityDataPreview != 0;
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
  v8.super_class = (Class)ASCodableFinalizeHandshake;
  -[ASCodableFinalizeHandshake description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCodableFinalizeHandshake dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *handshakeToken;
  ASCodableShareLocations *inviterShareLocations;
  void *v7;
  ASCodableActivityDataPreview *activityDataPreview;
  void *v9;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  handshakeToken = self->_handshakeToken;
  if (handshakeToken)
    objc_msgSend(v3, "setObject:forKey:", handshakeToken, CFSTR("handshakeToken"));
  inviterShareLocations = self->_inviterShareLocations;
  if (inviterShareLocations)
  {
    -[ASCodableShareLocations dictionaryRepresentation](inviterShareLocations, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("inviterShareLocations"));

  }
  activityDataPreview = self->_activityDataPreview;
  if (activityDataPreview)
  {
    -[ASCodableActivityDataPreview dictionaryRepresentation](activityDataPreview, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("activityDataPreview"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ASCodableFinalizeHandshakeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_handshakeToken)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_inviterShareLocations)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_activityDataPreview)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_handshakeToken)
  {
    objc_msgSend(v4, "setHandshakeToken:");
    v4 = v5;
  }
  if (self->_inviterShareLocations)
  {
    objc_msgSend(v5, "setInviterShareLocations:");
    v4 = v5;
  }
  if (self->_activityDataPreview)
  {
    objc_msgSend(v5, "setActivityDataPreview:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_handshakeToken, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[ASCodableShareLocations copyWithZone:](self->_inviterShareLocations, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[ASCodableActivityDataPreview copyWithZone:](self->_activityDataPreview, "copyWithZone:", a3);
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *handshakeToken;
  ASCodableShareLocations *inviterShareLocations;
  ASCodableActivityDataPreview *activityDataPreview;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((handshakeToken = self->_handshakeToken, !((unint64_t)handshakeToken | v4[2]))
     || -[NSString isEqual:](handshakeToken, "isEqual:"))
    && ((inviterShareLocations = self->_inviterShareLocations, !((unint64_t)inviterShareLocations | v4[3]))
     || -[ASCodableShareLocations isEqual:](inviterShareLocations, "isEqual:")))
  {
    activityDataPreview = self->_activityDataPreview;
    if ((unint64_t)activityDataPreview | v4[1])
      v8 = -[ASCodableActivityDataPreview isEqual:](activityDataPreview, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;

  v3 = -[NSString hash](self->_handshakeToken, "hash");
  v4 = -[ASCodableShareLocations hash](self->_inviterShareLocations, "hash") ^ v3;
  return v4 ^ -[ASCodableActivityDataPreview hash](self->_activityDataPreview, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  ASCodableShareLocations *inviterShareLocations;
  uint64_t v6;
  ASCodableActivityDataPreview *activityDataPreview;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  v9 = v4;
  if (v4[2])
  {
    -[ASCodableFinalizeHandshake setHandshakeToken:](self, "setHandshakeToken:");
    v4 = v9;
  }
  inviterShareLocations = self->_inviterShareLocations;
  v6 = v4[3];
  if (inviterShareLocations)
  {
    if (!v6)
      goto LABEL_9;
    -[ASCodableShareLocations mergeFrom:](inviterShareLocations, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_9;
    -[ASCodableFinalizeHandshake setInviterShareLocations:](self, "setInviterShareLocations:");
  }
  v4 = v9;
LABEL_9:
  activityDataPreview = self->_activityDataPreview;
  v8 = v4[1];
  if (activityDataPreview)
  {
    if (v8)
    {
      -[ASCodableActivityDataPreview mergeFrom:](activityDataPreview, "mergeFrom:");
LABEL_14:
      v4 = v9;
    }
  }
  else if (v8)
  {
    -[ASCodableFinalizeHandshake setActivityDataPreview:](self, "setActivityDataPreview:");
    goto LABEL_14;
  }

}

- (NSString)handshakeToken
{
  return self->_handshakeToken;
}

- (void)setHandshakeToken:(id)a3
{
  objc_storeStrong((id *)&self->_handshakeToken, a3);
}

- (ASCodableShareLocations)inviterShareLocations
{
  return self->_inviterShareLocations;
}

- (void)setInviterShareLocations:(id)a3
{
  objc_storeStrong((id *)&self->_inviterShareLocations, a3);
}

- (ASCodableActivityDataPreview)activityDataPreview
{
  return self->_activityDataPreview;
}

- (void)setActivityDataPreview:(id)a3
{
  objc_storeStrong((id *)&self->_activityDataPreview, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inviterShareLocations, 0);
  objc_storeStrong((id *)&self->_handshakeToken, 0);
  objc_storeStrong((id *)&self->_activityDataPreview, 0);
}

@end
