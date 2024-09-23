@implementation SPProtoObjectMessage

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)SPProtoObjectMessage;
  -[SPProtoObjectMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPProtoObjectMessage dictionaryRepresentation](self, "dictionaryRepresentation");
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

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SPProtoObjectMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  objc_msgSend(a3, "setIdentifier:", self->_identifier);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *identifier;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    identifier = self->_identifier;
    if ((unint64_t)identifier | v4[1])
      v6 = -[NSString isEqual:](identifier, "isEqual:");
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
  return -[NSString hash](self->_identifier, "hash");
}

- (void)mergeFrom:(id)a3
{
  if (*((_QWORD *)a3 + 1))
    -[SPProtoObjectMessage setIdentifier:](self, "setIdentifier:");
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (id)sockPuppetMessageForAssetDestroy
{
  SPProtoAudioFilePlayerAsset *v3;
  void *v4;

  v3 = objc_alloc_init(SPProtoAudioFilePlayerAsset);
  -[SPProtoAudioFilePlayerAsset setDestroy:](v3, "setDestroy:", self);
  -[SPProtoAudioFilePlayerAsset sockPuppetMessage](v3, "sockPuppetMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)sockPuppetMessageForPlayerItemDestroy
{
  SPProtoAudioFilePlayerItem *v3;
  void *v4;

  v3 = objc_alloc_init(SPProtoAudioFilePlayerItem);
  -[SPProtoAudioFilePlayerItem setDestroy:](v3, "setDestroy:", self);
  -[SPProtoAudioFilePlayerItem sockPuppetMessage](v3, "sockPuppetMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)sockPuppetMessageForPlayerItemGetCurrentTime
{
  SPProtoAudioFilePlayerItem *v3;
  void *v4;

  v3 = objc_alloc_init(SPProtoAudioFilePlayerItem);
  -[SPProtoAudioFilePlayerItem setGetCurrentTime:](v3, "setGetCurrentTime:", self);
  -[SPProtoAudioFilePlayerItem sockPuppetMessage](v3, "sockPuppetMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)sockPuppetMessageForPlayerItemNotifyTimeJumped
{
  SPProtoAudioFilePlayerItem *v3;
  void *v4;

  v3 = objc_alloc_init(SPProtoAudioFilePlayerItem);
  -[SPProtoAudioFilePlayerItem setNotifyTimeJumped:](v3, "setNotifyTimeJumped:", self);
  -[SPProtoAudioFilePlayerItem sockPuppetMessage](v3, "sockPuppetMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)sockPuppetMessageForPlayerItemNotifyDidPlayToEndTime
{
  SPProtoAudioFilePlayerItem *v3;
  void *v4;

  v3 = objc_alloc_init(SPProtoAudioFilePlayerItem);
  -[SPProtoAudioFilePlayerItem setNotifyDidPlayToEndTime:](v3, "setNotifyDidPlayToEndTime:", self);
  -[SPProtoAudioFilePlayerItem sockPuppetMessage](v3, "sockPuppetMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)sockPuppetMessageForPlayerItemNotifyFailedToPlayToEndTime
{
  SPProtoAudioFilePlayerItem *v3;
  void *v4;

  v3 = objc_alloc_init(SPProtoAudioFilePlayerItem);
  -[SPProtoAudioFilePlayerItem setNotifyFailedToPlayToEndTime:](v3, "setNotifyFailedToPlayToEndTime:", self);
  -[SPProtoAudioFilePlayerItem sockPuppetMessage](v3, "sockPuppetMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)sockPuppetMessageForQueuePlayerDestroy
{
  SPProtoAudioFileQueuePlayer *v3;
  void *v4;

  v3 = objc_alloc_init(SPProtoAudioFileQueuePlayer);
  -[SPProtoAudioFileQueuePlayer setDestroy:](v3, "setDestroy:", self);
  -[SPProtoAudioFileQueuePlayer sockPuppetMessage](v3, "sockPuppetMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)sockPuppetMessageForQueuePlayerAdvanceToNextItem
{
  SPProtoAudioFileQueuePlayer *v3;
  void *v4;

  v3 = objc_alloc_init(SPProtoAudioFileQueuePlayer);
  -[SPProtoAudioFileQueuePlayer setAdvanceToNextItem:](v3, "setAdvanceToNextItem:", self);
  -[SPProtoAudioFileQueuePlayer sockPuppetMessage](v3, "sockPuppetMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)sockPuppetMessageForQueuePlayerRemoveAllItems
{
  SPProtoAudioFileQueuePlayer *v3;
  void *v4;

  v3 = objc_alloc_init(SPProtoAudioFileQueuePlayer);
  -[SPProtoAudioFileQueuePlayer setRemoveAllItems:](v3, "setRemoveAllItems:", self);
  -[SPProtoAudioFileQueuePlayer sockPuppetMessage](v3, "sockPuppetMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
