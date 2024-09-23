@implementation SPProtoAudioFilePlayerMessage

- (BOOL)hasAsset
{
  return self->_asset != 0;
}

- (BOOL)hasPlayerItem
{
  return self->_playerItem != 0;
}

- (BOOL)hasQueuePlayer
{
  return self->_queuePlayer != 0;
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
  v8.super_class = (Class)SPProtoAudioFilePlayerMessage;
  -[SPProtoAudioFilePlayerMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPProtoAudioFilePlayerMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  SPProtoAudioFilePlayerAsset *asset;
  void *v5;
  SPProtoAudioFilePlayerItem *playerItem;
  void *v7;
  SPProtoAudioFileQueuePlayer *queuePlayer;
  void *v9;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  asset = self->_asset;
  if (asset)
  {
    -[SPProtoAudioFilePlayerAsset dictionaryRepresentation](asset, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("asset"));

  }
  playerItem = self->_playerItem;
  if (playerItem)
  {
    -[SPProtoAudioFilePlayerItem dictionaryRepresentation](playerItem, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("playerItem"));

  }
  queuePlayer = self->_queuePlayer;
  if (queuePlayer)
  {
    -[SPProtoAudioFileQueuePlayer dictionaryRepresentation](queuePlayer, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("queuePlayer"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SPProtoAudioFilePlayerMessageReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_asset)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_playerItem)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_queuePlayer)
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
  if (self->_asset)
  {
    objc_msgSend(v4, "setAsset:");
    v4 = v5;
  }
  if (self->_playerItem)
  {
    objc_msgSend(v5, "setPlayerItem:");
    v4 = v5;
  }
  if (self->_queuePlayer)
  {
    objc_msgSend(v5, "setQueuePlayer:");
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
  id v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[SPProtoAudioFilePlayerAsset copyWithZone:](self->_asset, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[SPProtoAudioFilePlayerItem copyWithZone:](self->_playerItem, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[SPProtoAudioFileQueuePlayer copyWithZone:](self->_queuePlayer, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  SPProtoAudioFilePlayerAsset *asset;
  SPProtoAudioFilePlayerItem *playerItem;
  SPProtoAudioFileQueuePlayer *queuePlayer;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((asset = self->_asset, !((unint64_t)asset | v4[1]))
     || -[SPProtoAudioFilePlayerAsset isEqual:](asset, "isEqual:"))
    && ((playerItem = self->_playerItem, !((unint64_t)playerItem | v4[2]))
     || -[SPProtoAudioFilePlayerItem isEqual:](playerItem, "isEqual:")))
  {
    queuePlayer = self->_queuePlayer;
    if ((unint64_t)queuePlayer | v4[3])
      v8 = -[SPProtoAudioFileQueuePlayer isEqual:](queuePlayer, "isEqual:");
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
  unint64_t v3;
  unint64_t v4;

  v3 = -[SPProtoAudioFilePlayerAsset hash](self->_asset, "hash");
  v4 = -[SPProtoAudioFilePlayerItem hash](self->_playerItem, "hash") ^ v3;
  return v4 ^ -[SPProtoAudioFileQueuePlayer hash](self->_queuePlayer, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  SPProtoAudioFilePlayerAsset *asset;
  uint64_t v6;
  SPProtoAudioFilePlayerItem *playerItem;
  uint64_t v8;
  SPProtoAudioFileQueuePlayer *queuePlayer;
  uint64_t v10;
  _QWORD *v11;

  v4 = a3;
  asset = self->_asset;
  v6 = v4[1];
  v11 = v4;
  if (asset)
  {
    if (!v6)
      goto LABEL_7;
    -[SPProtoAudioFilePlayerAsset mergeFrom:](asset, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[SPProtoAudioFilePlayerMessage setAsset:](self, "setAsset:");
  }
  v4 = v11;
LABEL_7:
  playerItem = self->_playerItem;
  v8 = v4[2];
  if (playerItem)
  {
    if (!v8)
      goto LABEL_13;
    -[SPProtoAudioFilePlayerItem mergeFrom:](playerItem, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[SPProtoAudioFilePlayerMessage setPlayerItem:](self, "setPlayerItem:");
  }
  v4 = v11;
LABEL_13:
  queuePlayer = self->_queuePlayer;
  v10 = v4[3];
  if (queuePlayer)
  {
    if (v10)
    {
      -[SPProtoAudioFileQueuePlayer mergeFrom:](queuePlayer, "mergeFrom:");
LABEL_18:
      v4 = v11;
    }
  }
  else if (v10)
  {
    -[SPProtoAudioFilePlayerMessage setQueuePlayer:](self, "setQueuePlayer:");
    goto LABEL_18;
  }

}

- (SPProtoAudioFilePlayerAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (SPProtoAudioFilePlayerItem)playerItem
{
  return self->_playerItem;
}

- (void)setPlayerItem:(id)a3
{
  objc_storeStrong((id *)&self->_playerItem, a3);
}

- (SPProtoAudioFileQueuePlayer)queuePlayer
{
  return self->_queuePlayer;
}

- (void)setQueuePlayer:(id)a3
{
  objc_storeStrong((id *)&self->_queuePlayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queuePlayer, 0);
  objc_storeStrong((id *)&self->_playerItem, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

@end
