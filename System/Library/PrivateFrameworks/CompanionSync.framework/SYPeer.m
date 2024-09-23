@implementation SYPeer

- (SYPeer)initWithPeerID:(id)a3 generation:(id)a4
{
  id v6;
  id v7;
  SYPeer *v8;
  SYPeer *v9;
  SYPeer *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SYPeer;
  v8 = -[SYPeer init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    -[SYPeer setPeerID:](v8, "setPeerID:", v6);
    -[SYPeer setGenerationID:](v9, "setGenerationID:", v7);
    v10 = v9;
  }

  return v9;
}

- (BOOL)hasGenerationID
{
  return self->_generationID != 0;
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
  v8.super_class = (Class)SYPeer;
  -[SYPeer description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYPeer dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *peerID;
  NSString *generationID;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  peerID = self->_peerID;
  if (peerID)
    objc_msgSend(v3, "setObject:forKey:", peerID, CFSTR("peerID"));
  generationID = self->_generationID;
  if (generationID)
    objc_msgSend(v4, "setObject:forKey:", generationID, CFSTR("generationID"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SYPeerReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_peerID)
    -[SYPeer writeTo:].cold.1();
  v5 = v4;
  PBDataWriterWriteStringField();
  if (self->_generationID)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setPeerID:", self->_peerID);
  if (self->_generationID)
    objc_msgSend(v4, "setGenerationID:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_peerID, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSString copyWithZone:](self->_generationID, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *peerID;
  NSString *generationID;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((peerID = self->_peerID, !((unint64_t)peerID | v4[2]))
     || -[NSString isEqual:](peerID, "isEqual:")))
  {
    generationID = self->_generationID;
    if ((unint64_t)generationID | v4[1])
      v7 = -[NSString isEqual:](generationID, "isEqual:");
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

  v3 = -[NSString hash](self->_peerID, "hash");
  return -[NSString hash](self->_generationID, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  v5 = v4;
  if (v4[2])
  {
    -[SYPeer setPeerID:](self, "setPeerID:");
    v4 = v5;
  }
  if (v4[1])
  {
    -[SYPeer setGenerationID:](self, "setGenerationID:");
    v4 = v5;
  }

}

- (NSString)peerID
{
  return self->_peerID;
}

- (void)setPeerID:(id)a3
{
  objc_storeStrong((id *)&self->_peerID, a3);
}

- (NSString)generationID
{
  return self->_generationID;
}

- (void)setGenerationID:(id)a3
{
  objc_storeStrong((id *)&self->_generationID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerID, 0);
  objc_storeStrong((id *)&self->_generationID, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[SYPeer writeTo:]", "SYPeer.m", 87, "nil != self->_peerID");
}

@end
