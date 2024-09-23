@implementation SPProtoAudioFilePlayerItem

- (id)sockPuppetMessage
{
  return +[SPProtoSockPuppetMessage sockPuppetMessageWithSubMessage:setterSelector:](SPProtoSockPuppetMessage, "sockPuppetMessageWithSubMessage:setterSelector:", self, sel_setPlayerItem_);
}

- (BOOL)hasUpsertWithAsset
{
  return self->_upsertWithAsset != 0;
}

- (BOOL)hasDestroy
{
  return self->_destroy != 0;
}

- (BOOL)hasSetStatus
{
  return self->_setStatus != 0;
}

- (BOOL)hasGetCurrentTime
{
  return self->_getCurrentTime != 0;
}

- (BOOL)hasNotifyTimeJumped
{
  return self->_notifyTimeJumped != 0;
}

- (BOOL)hasNotifyDidPlayToEndTime
{
  return self->_notifyDidPlayToEndTime != 0;
}

- (BOOL)hasNotifyFailedToPlayToEndTime
{
  return self->_notifyFailedToPlayToEndTime != 0;
}

- (BOOL)hasSetItemCurrentTime
{
  return self->_setItemCurrentTime != 0;
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
  v8.super_class = (Class)SPProtoAudioFilePlayerItem;
  -[SPProtoAudioFilePlayerItem description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPProtoAudioFilePlayerItem dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  SPProtoAudioFilePlayerUpdateContainedIdentifier *upsertWithAsset;
  void *v5;
  SPProtoObjectMessage *destroy;
  void *v7;
  SPProtoAudioFilePlayerStatus *setStatus;
  void *v9;
  SPProtoObjectMessage *getCurrentTime;
  void *v11;
  SPProtoObjectMessage *notifyTimeJumped;
  void *v13;
  SPProtoObjectMessage *notifyDidPlayToEndTime;
  void *v15;
  SPProtoObjectMessage *notifyFailedToPlayToEndTime;
  void *v17;
  SPProtoAudioFilePlayerItemSetCurrentTime *setItemCurrentTime;
  void *v19;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  upsertWithAsset = self->_upsertWithAsset;
  if (upsertWithAsset)
  {
    -[SPProtoAudioFilePlayerUpdateContainedIdentifier dictionaryRepresentation](upsertWithAsset, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("upsertWithAsset"));

  }
  destroy = self->_destroy;
  if (destroy)
  {
    -[SPProtoObjectMessage dictionaryRepresentation](destroy, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("destroy"));

  }
  setStatus = self->_setStatus;
  if (setStatus)
  {
    -[SPProtoAudioFilePlayerStatus dictionaryRepresentation](setStatus, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("setStatus"));

  }
  getCurrentTime = self->_getCurrentTime;
  if (getCurrentTime)
  {
    -[SPProtoObjectMessage dictionaryRepresentation](getCurrentTime, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("getCurrentTime"));

  }
  notifyTimeJumped = self->_notifyTimeJumped;
  if (notifyTimeJumped)
  {
    -[SPProtoObjectMessage dictionaryRepresentation](notifyTimeJumped, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("notifyTimeJumped"));

  }
  notifyDidPlayToEndTime = self->_notifyDidPlayToEndTime;
  if (notifyDidPlayToEndTime)
  {
    -[SPProtoObjectMessage dictionaryRepresentation](notifyDidPlayToEndTime, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("notifyDidPlayToEndTime"));

  }
  notifyFailedToPlayToEndTime = self->_notifyFailedToPlayToEndTime;
  if (notifyFailedToPlayToEndTime)
  {
    -[SPProtoObjectMessage dictionaryRepresentation](notifyFailedToPlayToEndTime, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("notifyFailedToPlayToEndTime"));

  }
  setItemCurrentTime = self->_setItemCurrentTime;
  if (setItemCurrentTime)
  {
    -[SPProtoAudioFilePlayerItemSetCurrentTime dictionaryRepresentation](setItemCurrentTime, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("setItemCurrentTime"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SPProtoAudioFilePlayerItemReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_upsertWithAsset)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_destroy)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_setStatus)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_getCurrentTime)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_notifyTimeJumped)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_notifyDidPlayToEndTime)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_notifyFailedToPlayToEndTime)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_setItemCurrentTime)
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
  if (self->_upsertWithAsset)
  {
    objc_msgSend(v4, "setUpsertWithAsset:");
    v4 = v5;
  }
  if (self->_destroy)
  {
    objc_msgSend(v5, "setDestroy:");
    v4 = v5;
  }
  if (self->_setStatus)
  {
    objc_msgSend(v5, "setSetStatus:");
    v4 = v5;
  }
  if (self->_getCurrentTime)
  {
    objc_msgSend(v5, "setGetCurrentTime:");
    v4 = v5;
  }
  if (self->_notifyTimeJumped)
  {
    objc_msgSend(v5, "setNotifyTimeJumped:");
    v4 = v5;
  }
  if (self->_notifyDidPlayToEndTime)
  {
    objc_msgSend(v5, "setNotifyDidPlayToEndTime:");
    v4 = v5;
  }
  if (self->_notifyFailedToPlayToEndTime)
  {
    objc_msgSend(v5, "setNotifyFailedToPlayToEndTime:");
    v4 = v5;
  }
  if (self->_setItemCurrentTime)
  {
    objc_msgSend(v5, "setSetItemCurrentTime:");
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
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[SPProtoAudioFilePlayerUpdateContainedIdentifier copyWithZone:](self->_upsertWithAsset, "copyWithZone:", a3);
  v7 = (void *)v5[8];
  v5[8] = v6;

  v8 = -[SPProtoObjectMessage copyWithZone:](self->_destroy, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  v10 = -[SPProtoAudioFilePlayerStatus copyWithZone:](self->_setStatus, "copyWithZone:", a3);
  v11 = (void *)v5[7];
  v5[7] = v10;

  v12 = -[SPProtoObjectMessage copyWithZone:](self->_getCurrentTime, "copyWithZone:", a3);
  v13 = (void *)v5[2];
  v5[2] = v12;

  v14 = -[SPProtoObjectMessage copyWithZone:](self->_notifyTimeJumped, "copyWithZone:", a3);
  v15 = (void *)v5[5];
  v5[5] = v14;

  v16 = -[SPProtoObjectMessage copyWithZone:](self->_notifyDidPlayToEndTime, "copyWithZone:", a3);
  v17 = (void *)v5[3];
  v5[3] = v16;

  v18 = -[SPProtoObjectMessage copyWithZone:](self->_notifyFailedToPlayToEndTime, "copyWithZone:", a3);
  v19 = (void *)v5[4];
  v5[4] = v18;

  v20 = -[SPProtoAudioFilePlayerItemSetCurrentTime copyWithZone:](self->_setItemCurrentTime, "copyWithZone:", a3);
  v21 = (void *)v5[6];
  v5[6] = v20;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  SPProtoAudioFilePlayerUpdateContainedIdentifier *upsertWithAsset;
  SPProtoObjectMessage *destroy;
  SPProtoAudioFilePlayerStatus *setStatus;
  SPProtoObjectMessage *getCurrentTime;
  SPProtoObjectMessage *notifyTimeJumped;
  SPProtoObjectMessage *notifyDidPlayToEndTime;
  SPProtoObjectMessage *notifyFailedToPlayToEndTime;
  SPProtoAudioFilePlayerItemSetCurrentTime *setItemCurrentTime;
  char v13;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((upsertWithAsset = self->_upsertWithAsset, !((unint64_t)upsertWithAsset | v4[8]))
     || -[SPProtoAudioFilePlayerUpdateContainedIdentifier isEqual:](upsertWithAsset, "isEqual:"))
    && ((destroy = self->_destroy, !((unint64_t)destroy | v4[1]))
     || -[SPProtoObjectMessage isEqual:](destroy, "isEqual:"))
    && ((setStatus = self->_setStatus, !((unint64_t)setStatus | v4[7]))
     || -[SPProtoAudioFilePlayerStatus isEqual:](setStatus, "isEqual:"))
    && ((getCurrentTime = self->_getCurrentTime, !((unint64_t)getCurrentTime | v4[2]))
     || -[SPProtoObjectMessage isEqual:](getCurrentTime, "isEqual:"))
    && ((notifyTimeJumped = self->_notifyTimeJumped, !((unint64_t)notifyTimeJumped | v4[5]))
     || -[SPProtoObjectMessage isEqual:](notifyTimeJumped, "isEqual:"))
    && ((notifyDidPlayToEndTime = self->_notifyDidPlayToEndTime, !((unint64_t)notifyDidPlayToEndTime | v4[3]))
     || -[SPProtoObjectMessage isEqual:](notifyDidPlayToEndTime, "isEqual:"))
    && ((notifyFailedToPlayToEndTime = self->_notifyFailedToPlayToEndTime,
         !((unint64_t)notifyFailedToPlayToEndTime | v4[4]))
     || -[SPProtoObjectMessage isEqual:](notifyFailedToPlayToEndTime, "isEqual:")))
  {
    setItemCurrentTime = self->_setItemCurrentTime;
    if ((unint64_t)setItemCurrentTime | v4[6])
      v13 = -[SPProtoAudioFilePlayerItemSetCurrentTime isEqual:](setItemCurrentTime, "isEqual:");
    else
      v13 = 1;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v3 = -[SPProtoAudioFilePlayerUpdateContainedIdentifier hash](self->_upsertWithAsset, "hash");
  v4 = -[SPProtoObjectMessage hash](self->_destroy, "hash") ^ v3;
  v5 = -[SPProtoAudioFilePlayerStatus hash](self->_setStatus, "hash");
  v6 = v4 ^ v5 ^ -[SPProtoObjectMessage hash](self->_getCurrentTime, "hash");
  v7 = -[SPProtoObjectMessage hash](self->_notifyTimeJumped, "hash");
  v8 = v7 ^ -[SPProtoObjectMessage hash](self->_notifyDidPlayToEndTime, "hash");
  v9 = v6 ^ v8 ^ -[SPProtoObjectMessage hash](self->_notifyFailedToPlayToEndTime, "hash");
  return v9 ^ -[SPProtoAudioFilePlayerItemSetCurrentTime hash](self->_setItemCurrentTime, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  SPProtoAudioFilePlayerUpdateContainedIdentifier *upsertWithAsset;
  uint64_t v6;
  SPProtoObjectMessage *destroy;
  uint64_t v8;
  SPProtoAudioFilePlayerStatus *setStatus;
  uint64_t v10;
  SPProtoObjectMessage *getCurrentTime;
  uint64_t v12;
  SPProtoObjectMessage *notifyTimeJumped;
  uint64_t v14;
  SPProtoObjectMessage *notifyDidPlayToEndTime;
  uint64_t v16;
  SPProtoObjectMessage *notifyFailedToPlayToEndTime;
  uint64_t v18;
  SPProtoAudioFilePlayerItemSetCurrentTime *setItemCurrentTime;
  uint64_t v20;
  _QWORD *v21;

  v4 = a3;
  upsertWithAsset = self->_upsertWithAsset;
  v21 = v4;
  v6 = v4[8];
  if (upsertWithAsset)
  {
    if (v6)
      -[SPProtoAudioFilePlayerUpdateContainedIdentifier mergeFrom:](upsertWithAsset, "mergeFrom:");
  }
  else if (v6)
  {
    -[SPProtoAudioFilePlayerItem setUpsertWithAsset:](self, "setUpsertWithAsset:");
  }
  destroy = self->_destroy;
  v8 = v21[1];
  if (destroy)
  {
    if (v8)
      -[SPProtoObjectMessage mergeFrom:](destroy, "mergeFrom:");
  }
  else if (v8)
  {
    -[SPProtoAudioFilePlayerItem setDestroy:](self, "setDestroy:");
  }
  setStatus = self->_setStatus;
  v10 = v21[7];
  if (setStatus)
  {
    if (v10)
      -[SPProtoAudioFilePlayerStatus mergeFrom:](setStatus, "mergeFrom:");
  }
  else if (v10)
  {
    -[SPProtoAudioFilePlayerItem setSetStatus:](self, "setSetStatus:");
  }
  getCurrentTime = self->_getCurrentTime;
  v12 = v21[2];
  if (getCurrentTime)
  {
    if (v12)
      -[SPProtoObjectMessage mergeFrom:](getCurrentTime, "mergeFrom:");
  }
  else if (v12)
  {
    -[SPProtoAudioFilePlayerItem setGetCurrentTime:](self, "setGetCurrentTime:");
  }
  notifyTimeJumped = self->_notifyTimeJumped;
  v14 = v21[5];
  if (notifyTimeJumped)
  {
    if (v14)
      -[SPProtoObjectMessage mergeFrom:](notifyTimeJumped, "mergeFrom:");
  }
  else if (v14)
  {
    -[SPProtoAudioFilePlayerItem setNotifyTimeJumped:](self, "setNotifyTimeJumped:");
  }
  notifyDidPlayToEndTime = self->_notifyDidPlayToEndTime;
  v16 = v21[3];
  if (notifyDidPlayToEndTime)
  {
    if (v16)
      -[SPProtoObjectMessage mergeFrom:](notifyDidPlayToEndTime, "mergeFrom:");
  }
  else if (v16)
  {
    -[SPProtoAudioFilePlayerItem setNotifyDidPlayToEndTime:](self, "setNotifyDidPlayToEndTime:");
  }
  notifyFailedToPlayToEndTime = self->_notifyFailedToPlayToEndTime;
  v18 = v21[4];
  if (notifyFailedToPlayToEndTime)
  {
    if (v18)
      -[SPProtoObjectMessage mergeFrom:](notifyFailedToPlayToEndTime, "mergeFrom:");
  }
  else if (v18)
  {
    -[SPProtoAudioFilePlayerItem setNotifyFailedToPlayToEndTime:](self, "setNotifyFailedToPlayToEndTime:");
  }
  setItemCurrentTime = self->_setItemCurrentTime;
  v20 = v21[6];
  if (setItemCurrentTime)
  {
    if (v20)
      -[SPProtoAudioFilePlayerItemSetCurrentTime mergeFrom:](setItemCurrentTime, "mergeFrom:");
  }
  else if (v20)
  {
    -[SPProtoAudioFilePlayerItem setSetItemCurrentTime:](self, "setSetItemCurrentTime:");
  }

}

- (SPProtoAudioFilePlayerUpdateContainedIdentifier)upsertWithAsset
{
  return self->_upsertWithAsset;
}

- (void)setUpsertWithAsset:(id)a3
{
  objc_storeStrong((id *)&self->_upsertWithAsset, a3);
}

- (SPProtoObjectMessage)destroy
{
  return self->_destroy;
}

- (void)setDestroy:(id)a3
{
  objc_storeStrong((id *)&self->_destroy, a3);
}

- (SPProtoAudioFilePlayerStatus)setStatus
{
  return self->_setStatus;
}

- (void)setSetStatus:(id)a3
{
  objc_storeStrong((id *)&self->_setStatus, a3);
}

- (SPProtoObjectMessage)getCurrentTime
{
  return self->_getCurrentTime;
}

- (void)setGetCurrentTime:(id)a3
{
  objc_storeStrong((id *)&self->_getCurrentTime, a3);
}

- (SPProtoObjectMessage)notifyTimeJumped
{
  return self->_notifyTimeJumped;
}

- (void)setNotifyTimeJumped:(id)a3
{
  objc_storeStrong((id *)&self->_notifyTimeJumped, a3);
}

- (SPProtoObjectMessage)notifyDidPlayToEndTime
{
  return self->_notifyDidPlayToEndTime;
}

- (void)setNotifyDidPlayToEndTime:(id)a3
{
  objc_storeStrong((id *)&self->_notifyDidPlayToEndTime, a3);
}

- (SPProtoObjectMessage)notifyFailedToPlayToEndTime
{
  return self->_notifyFailedToPlayToEndTime;
}

- (void)setNotifyFailedToPlayToEndTime:(id)a3
{
  objc_storeStrong((id *)&self->_notifyFailedToPlayToEndTime, a3);
}

- (SPProtoAudioFilePlayerItemSetCurrentTime)setItemCurrentTime
{
  return self->_setItemCurrentTime;
}

- (void)setSetItemCurrentTime:(id)a3
{
  objc_storeStrong((id *)&self->_setItemCurrentTime, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upsertWithAsset, 0);
  objc_storeStrong((id *)&self->_setStatus, 0);
  objc_storeStrong((id *)&self->_setItemCurrentTime, 0);
  objc_storeStrong((id *)&self->_notifyTimeJumped, 0);
  objc_storeStrong((id *)&self->_notifyFailedToPlayToEndTime, 0);
  objc_storeStrong((id *)&self->_notifyDidPlayToEndTime, 0);
  objc_storeStrong((id *)&self->_getCurrentTime, 0);
  objc_storeStrong((id *)&self->_destroy, 0);
}

@end
