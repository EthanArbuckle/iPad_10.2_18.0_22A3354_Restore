@implementation SPProtoAudioFilePlayerAsset

- (id)sockPuppetMessage
{
  return +[SPProtoSockPuppetMessage sockPuppetMessageWithSubMessage:setterSelector:](SPProtoSockPuppetMessage, "sockPuppetMessageWithSubMessage:setterSelector:", self, sel_setAsset_);
}

- (BOOL)hasUpsertWithMetaData
{
  return self->_upsertWithMetaData != 0;
}

- (BOOL)hasDestroy
{
  return self->_destroy != 0;
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
  v8.super_class = (Class)SPProtoAudioFilePlayerAsset;
  -[SPProtoAudioFilePlayerAsset description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPProtoAudioFilePlayerAsset dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  SPProtoAudioFilePlayerAssetUpdateMetaData *upsertWithMetaData;
  void *v5;
  SPProtoObjectMessage *destroy;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  upsertWithMetaData = self->_upsertWithMetaData;
  if (upsertWithMetaData)
  {
    -[SPProtoAudioFilePlayerAssetUpdateMetaData dictionaryRepresentation](upsertWithMetaData, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("upsertWithMetaData"));

  }
  destroy = self->_destroy;
  if (destroy)
  {
    -[SPProtoObjectMessage dictionaryRepresentation](destroy, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("destroy"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SPProtoAudioFilePlayerAssetReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_upsertWithMetaData)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_destroy)
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
  if (self->_upsertWithMetaData)
  {
    objc_msgSend(v4, "setUpsertWithMetaData:");
    v4 = v5;
  }
  if (self->_destroy)
  {
    objc_msgSend(v5, "setDestroy:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[SPProtoAudioFilePlayerAssetUpdateMetaData copyWithZone:](self->_upsertWithMetaData, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[SPProtoObjectMessage copyWithZone:](self->_destroy, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  SPProtoAudioFilePlayerAssetUpdateMetaData *upsertWithMetaData;
  SPProtoObjectMessage *destroy;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((upsertWithMetaData = self->_upsertWithMetaData, !((unint64_t)upsertWithMetaData | v4[2]))
     || -[SPProtoAudioFilePlayerAssetUpdateMetaData isEqual:](upsertWithMetaData, "isEqual:")))
  {
    destroy = self->_destroy;
    if ((unint64_t)destroy | v4[1])
      v7 = -[SPProtoObjectMessage isEqual:](destroy, "isEqual:");
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
  unint64_t v3;

  v3 = -[SPProtoAudioFilePlayerAssetUpdateMetaData hash](self->_upsertWithMetaData, "hash");
  return -[SPProtoObjectMessage hash](self->_destroy, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  SPProtoAudioFilePlayerAssetUpdateMetaData *upsertWithMetaData;
  uint64_t v6;
  SPProtoObjectMessage *destroy;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  upsertWithMetaData = self->_upsertWithMetaData;
  v6 = v4[2];
  v9 = v4;
  if (upsertWithMetaData)
  {
    if (!v6)
      goto LABEL_7;
    -[SPProtoAudioFilePlayerAssetUpdateMetaData mergeFrom:](upsertWithMetaData, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[SPProtoAudioFilePlayerAsset setUpsertWithMetaData:](self, "setUpsertWithMetaData:");
  }
  v4 = v9;
LABEL_7:
  destroy = self->_destroy;
  v8 = v4[1];
  if (destroy)
  {
    if (v8)
    {
      -[SPProtoObjectMessage mergeFrom:](destroy, "mergeFrom:");
LABEL_12:
      v4 = v9;
    }
  }
  else if (v8)
  {
    -[SPProtoAudioFilePlayerAsset setDestroy:](self, "setDestroy:");
    goto LABEL_12;
  }

}

- (SPProtoAudioFilePlayerAssetUpdateMetaData)upsertWithMetaData
{
  return self->_upsertWithMetaData;
}

- (void)setUpsertWithMetaData:(id)a3
{
  objc_storeStrong((id *)&self->_upsertWithMetaData, a3);
}

- (SPProtoObjectMessage)destroy
{
  return self->_destroy;
}

- (void)setDestroy:(id)a3
{
  objc_storeStrong((id *)&self->_destroy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upsertWithMetaData, 0);
  objc_storeStrong((id *)&self->_destroy, 0);
}

@end
