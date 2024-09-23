@implementation SPProtoAudioFilePlayerUpdateContainedIdentifier

- (BOOL)hasContainedIdentifier
{
  return self->_containedIdentifier != 0;
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
  v8.super_class = (Class)SPProtoAudioFilePlayerUpdateContainedIdentifier;
  -[SPProtoAudioFilePlayerUpdateContainedIdentifier description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPProtoAudioFilePlayerUpdateContainedIdentifier dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *identifier;
  NSString *containedIdentifier;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  containedIdentifier = self->_containedIdentifier;
  if (containedIdentifier)
    objc_msgSend(v4, "setObject:forKey:", containedIdentifier, CFSTR("containedIdentifier"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SPProtoAudioFilePlayerUpdateContainedIdentifierReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  PBDataWriterWriteStringField();
  if (self->_containedIdentifier)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setIdentifier:", self->_identifier);
  if (self->_containedIdentifier)
    objc_msgSend(v4, "setContainedIdentifier:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSString copyWithZone:](self->_containedIdentifier, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *identifier;
  NSString *containedIdentifier;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((identifier = self->_identifier, !((unint64_t)identifier | v4[2]))
     || -[NSString isEqual:](identifier, "isEqual:")))
  {
    containedIdentifier = self->_containedIdentifier;
    if ((unint64_t)containedIdentifier | v4[1])
      v7 = -[NSString isEqual:](containedIdentifier, "isEqual:");
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

  v3 = -[NSString hash](self->_identifier, "hash");
  return -[NSString hash](self->_containedIdentifier, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  v5 = v4;
  if (v4[2])
  {
    -[SPProtoAudioFilePlayerUpdateContainedIdentifier setIdentifier:](self, "setIdentifier:");
    v4 = v5;
  }
  if (v4[1])
  {
    -[SPProtoAudioFilePlayerUpdateContainedIdentifier setContainedIdentifier:](self, "setContainedIdentifier:");
    v4 = v5;
  }

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)containedIdentifier
{
  return self->_containedIdentifier;
}

- (void)setContainedIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_containedIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_containedIdentifier, 0);
}

- (id)sockPuppetMessageForPlayerItemUpsertWithAsset
{
  SPProtoAudioFilePlayerItem *v3;
  void *v4;

  v3 = objc_alloc_init(SPProtoAudioFilePlayerItem);
  -[SPProtoAudioFilePlayerItem setUpsertWithAsset:](v3, "setUpsertWithAsset:", self);
  -[SPProtoAudioFilePlayerItem sockPuppetMessage](v3, "sockPuppetMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)sockPuppetMessageForQueuePlayerReplaceCurrentItem
{
  SPProtoAudioFileQueuePlayer *v3;
  void *v4;

  v3 = objc_alloc_init(SPProtoAudioFileQueuePlayer);
  -[SPProtoAudioFileQueuePlayer setReplaceCurrentItem:](v3, "setReplaceCurrentItem:", self);
  -[SPProtoAudioFileQueuePlayer sockPuppetMessage](v3, "sockPuppetMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)sockPuppetMessageForQueuePlayerAppendItem
{
  SPProtoAudioFileQueuePlayer *v3;
  void *v4;

  v3 = objc_alloc_init(SPProtoAudioFileQueuePlayer);
  -[SPProtoAudioFileQueuePlayer setAppendItem:](v3, "setAppendItem:", self);
  -[SPProtoAudioFileQueuePlayer sockPuppetMessage](v3, "sockPuppetMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)sockPuppetMessageForQueuePlayerRemoveItem
{
  SPProtoAudioFileQueuePlayer *v3;
  void *v4;

  v3 = objc_alloc_init(SPProtoAudioFileQueuePlayer);
  -[SPProtoAudioFileQueuePlayer setRemoveItem:](v3, "setRemoveItem:", self);
  -[SPProtoAudioFileQueuePlayer sockPuppetMessage](v3, "sockPuppetMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)sockPuppetMessageForQueuePlayerSetCurrentItem
{
  SPProtoAudioFileQueuePlayer *v3;
  void *v4;

  v3 = objc_alloc_init(SPProtoAudioFileQueuePlayer);
  -[SPProtoAudioFileQueuePlayer setSetCurrentItem:](v3, "setSetCurrentItem:", self);
  -[SPProtoAudioFileQueuePlayer sockPuppetMessage](v3, "sockPuppetMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
