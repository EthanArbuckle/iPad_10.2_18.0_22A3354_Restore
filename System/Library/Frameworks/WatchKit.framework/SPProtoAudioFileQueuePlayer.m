@implementation SPProtoAudioFileQueuePlayer

- (BOOL)hasUpsertWithItems
{
  return self->_upsertWithItems != 0;
}

- (BOOL)hasDestroy
{
  return self->_destroy != 0;
}

- (BOOL)hasSetRate
{
  return self->_setRate != 0;
}

- (BOOL)hasReplaceCurrentItem
{
  return self->_replaceCurrentItem != 0;
}

- (BOOL)hasSetStatus
{
  return self->_setStatus != 0;
}

- (BOOL)hasAdvanceToNextItem
{
  return self->_advanceToNextItem != 0;
}

- (BOOL)hasAppendItem
{
  return self->_appendItem != 0;
}

- (BOOL)hasRemoveItem
{
  return self->_removeItem != 0;
}

- (BOOL)hasRemoveAllItems
{
  return self->_removeAllItems != 0;
}

- (BOOL)hasSetCurrentItem
{
  return self->_setCurrentItem != 0;
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
  v8.super_class = (Class)SPProtoAudioFileQueuePlayer;
  -[SPProtoAudioFileQueuePlayer description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPProtoAudioFileQueuePlayer dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  SPProtoAudioFileQueuePlayerSetItems *upsertWithItems;
  void *v5;
  SPProtoObjectMessage *destroy;
  void *v7;
  SPProtoAudioFileQueuePlayerSetRate *setRate;
  void *v9;
  SPProtoAudioFilePlayerUpdateContainedIdentifier *replaceCurrentItem;
  void *v11;
  SPProtoAudioFilePlayerStatus *setStatus;
  void *v13;
  SPProtoObjectMessage *advanceToNextItem;
  void *v15;
  SPProtoAudioFilePlayerUpdateContainedIdentifier *appendItem;
  void *v17;
  SPProtoAudioFilePlayerUpdateContainedIdentifier *removeItem;
  void *v19;
  SPProtoObjectMessage *removeAllItems;
  void *v21;
  SPProtoAudioFilePlayerUpdateContainedIdentifier *setCurrentItem;
  void *v23;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  upsertWithItems = self->_upsertWithItems;
  if (upsertWithItems)
  {
    -[SPProtoAudioFileQueuePlayerSetItems dictionaryRepresentation](upsertWithItems, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("upsertWithItems"));

  }
  destroy = self->_destroy;
  if (destroy)
  {
    -[SPProtoObjectMessage dictionaryRepresentation](destroy, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("destroy"));

  }
  setRate = self->_setRate;
  if (setRate)
  {
    -[SPProtoAudioFileQueuePlayerSetRate dictionaryRepresentation](setRate, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("setRate"));

  }
  replaceCurrentItem = self->_replaceCurrentItem;
  if (replaceCurrentItem)
  {
    -[SPProtoAudioFilePlayerUpdateContainedIdentifier dictionaryRepresentation](replaceCurrentItem, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("replaceCurrentItem"));

  }
  setStatus = self->_setStatus;
  if (setStatus)
  {
    -[SPProtoAudioFilePlayerStatus dictionaryRepresentation](setStatus, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("setStatus"));

  }
  advanceToNextItem = self->_advanceToNextItem;
  if (advanceToNextItem)
  {
    -[SPProtoObjectMessage dictionaryRepresentation](advanceToNextItem, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("advanceToNextItem"));

  }
  appendItem = self->_appendItem;
  if (appendItem)
  {
    -[SPProtoAudioFilePlayerUpdateContainedIdentifier dictionaryRepresentation](appendItem, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("appendItem"));

  }
  removeItem = self->_removeItem;
  if (removeItem)
  {
    -[SPProtoAudioFilePlayerUpdateContainedIdentifier dictionaryRepresentation](removeItem, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("removeItem"));

  }
  removeAllItems = self->_removeAllItems;
  if (removeAllItems)
  {
    -[SPProtoObjectMessage dictionaryRepresentation](removeAllItems, "dictionaryRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("removeAllItems"));

  }
  setCurrentItem = self->_setCurrentItem;
  if (setCurrentItem)
  {
    -[SPProtoAudioFilePlayerUpdateContainedIdentifier dictionaryRepresentation](setCurrentItem, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("setCurrentItem"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SPProtoAudioFileQueuePlayerReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_upsertWithItems)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_destroy)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_setRate)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_replaceCurrentItem)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_setStatus)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_advanceToNextItem)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_appendItem)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_removeItem)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_removeAllItems)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_setCurrentItem)
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
  if (self->_upsertWithItems)
  {
    objc_msgSend(v4, "setUpsertWithItems:");
    v4 = v5;
  }
  if (self->_destroy)
  {
    objc_msgSend(v5, "setDestroy:");
    v4 = v5;
  }
  if (self->_setRate)
  {
    objc_msgSend(v5, "setSetRate:");
    v4 = v5;
  }
  if (self->_replaceCurrentItem)
  {
    objc_msgSend(v5, "setReplaceCurrentItem:");
    v4 = v5;
  }
  if (self->_setStatus)
  {
    objc_msgSend(v5, "setSetStatus:");
    v4 = v5;
  }
  if (self->_advanceToNextItem)
  {
    objc_msgSend(v5, "setAdvanceToNextItem:");
    v4 = v5;
  }
  if (self->_appendItem)
  {
    objc_msgSend(v5, "setAppendItem:");
    v4 = v5;
  }
  if (self->_removeItem)
  {
    objc_msgSend(v5, "setRemoveItem:");
    v4 = v5;
  }
  if (self->_removeAllItems)
  {
    objc_msgSend(v5, "setRemoveAllItems:");
    v4 = v5;
  }
  if (self->_setCurrentItem)
  {
    objc_msgSend(v5, "setSetCurrentItem:");
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
  id v22;
  void *v23;
  id v24;
  void *v25;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[SPProtoAudioFileQueuePlayerSetItems copyWithZone:](self->_upsertWithItems, "copyWithZone:", a3);
  v7 = (void *)v5[10];
  v5[10] = v6;

  v8 = -[SPProtoObjectMessage copyWithZone:](self->_destroy, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[SPProtoAudioFileQueuePlayerSetRate copyWithZone:](self->_setRate, "copyWithZone:", a3);
  v11 = (void *)v5[8];
  v5[8] = v10;

  v12 = -[SPProtoAudioFilePlayerUpdateContainedIdentifier copyWithZone:](self->_replaceCurrentItem, "copyWithZone:", a3);
  v13 = (void *)v5[6];
  v5[6] = v12;

  v14 = -[SPProtoAudioFilePlayerStatus copyWithZone:](self->_setStatus, "copyWithZone:", a3);
  v15 = (void *)v5[9];
  v5[9] = v14;

  v16 = -[SPProtoObjectMessage copyWithZone:](self->_advanceToNextItem, "copyWithZone:", a3);
  v17 = (void *)v5[1];
  v5[1] = v16;

  v18 = -[SPProtoAudioFilePlayerUpdateContainedIdentifier copyWithZone:](self->_appendItem, "copyWithZone:", a3);
  v19 = (void *)v5[2];
  v5[2] = v18;

  v20 = -[SPProtoAudioFilePlayerUpdateContainedIdentifier copyWithZone:](self->_removeItem, "copyWithZone:", a3);
  v21 = (void *)v5[5];
  v5[5] = v20;

  v22 = -[SPProtoObjectMessage copyWithZone:](self->_removeAllItems, "copyWithZone:", a3);
  v23 = (void *)v5[4];
  v5[4] = v22;

  v24 = -[SPProtoAudioFilePlayerUpdateContainedIdentifier copyWithZone:](self->_setCurrentItem, "copyWithZone:", a3);
  v25 = (void *)v5[7];
  v5[7] = v24;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  SPProtoAudioFileQueuePlayerSetItems *upsertWithItems;
  SPProtoObjectMessage *destroy;
  SPProtoAudioFileQueuePlayerSetRate *setRate;
  SPProtoAudioFilePlayerUpdateContainedIdentifier *replaceCurrentItem;
  SPProtoAudioFilePlayerStatus *setStatus;
  SPProtoObjectMessage *advanceToNextItem;
  SPProtoAudioFilePlayerUpdateContainedIdentifier *appendItem;
  SPProtoAudioFilePlayerUpdateContainedIdentifier *removeItem;
  SPProtoObjectMessage *removeAllItems;
  SPProtoAudioFilePlayerUpdateContainedIdentifier *setCurrentItem;
  char v15;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  upsertWithItems = self->_upsertWithItems;
  if ((unint64_t)upsertWithItems | v4[10])
  {
    if (!-[SPProtoAudioFileQueuePlayerSetItems isEqual:](upsertWithItems, "isEqual:"))
      goto LABEL_22;
  }
  destroy = self->_destroy;
  if ((unint64_t)destroy | v4[3] && !-[SPProtoObjectMessage isEqual:](destroy, "isEqual:"))
    goto LABEL_22;
  if (((setRate = self->_setRate, !((unint64_t)setRate | v4[8]))
     || -[SPProtoAudioFileQueuePlayerSetRate isEqual:](setRate, "isEqual:"))
    && ((replaceCurrentItem = self->_replaceCurrentItem, !((unint64_t)replaceCurrentItem | v4[6]))
     || -[SPProtoAudioFilePlayerUpdateContainedIdentifier isEqual:](replaceCurrentItem, "isEqual:"))
    && ((setStatus = self->_setStatus, !((unint64_t)setStatus | v4[9]))
     || -[SPProtoAudioFilePlayerStatus isEqual:](setStatus, "isEqual:"))
    && ((advanceToNextItem = self->_advanceToNextItem, !((unint64_t)advanceToNextItem | v4[1]))
     || -[SPProtoObjectMessage isEqual:](advanceToNextItem, "isEqual:"))
    && ((appendItem = self->_appendItem, !((unint64_t)appendItem | v4[2]))
     || -[SPProtoAudioFilePlayerUpdateContainedIdentifier isEqual:](appendItem, "isEqual:"))
    && ((removeItem = self->_removeItem, !((unint64_t)removeItem | v4[5]))
     || -[SPProtoAudioFilePlayerUpdateContainedIdentifier isEqual:](removeItem, "isEqual:"))
    && ((removeAllItems = self->_removeAllItems, !((unint64_t)removeAllItems | v4[4]))
     || -[SPProtoObjectMessage isEqual:](removeAllItems, "isEqual:")))
  {
    setCurrentItem = self->_setCurrentItem;
    if ((unint64_t)setCurrentItem | v4[7])
      v15 = -[SPProtoAudioFilePlayerUpdateContainedIdentifier isEqual:](setCurrentItem, "isEqual:");
    else
      v15 = 1;
  }
  else
  {
LABEL_22:
    v15 = 0;
  }

  return v15;
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
  unint64_t v10;
  unint64_t v11;

  v3 = -[SPProtoAudioFileQueuePlayerSetItems hash](self->_upsertWithItems, "hash");
  v4 = -[SPProtoObjectMessage hash](self->_destroy, "hash") ^ v3;
  v5 = -[SPProtoAudioFileQueuePlayerSetRate hash](self->_setRate, "hash");
  v6 = v4 ^ v5 ^ -[SPProtoAudioFilePlayerUpdateContainedIdentifier hash](self->_replaceCurrentItem, "hash");
  v7 = -[SPProtoAudioFilePlayerStatus hash](self->_setStatus, "hash");
  v8 = v7 ^ -[SPProtoObjectMessage hash](self->_advanceToNextItem, "hash");
  v9 = v6 ^ v8 ^ -[SPProtoAudioFilePlayerUpdateContainedIdentifier hash](self->_appendItem, "hash");
  v10 = -[SPProtoAudioFilePlayerUpdateContainedIdentifier hash](self->_removeItem, "hash");
  v11 = v10 ^ -[SPProtoObjectMessage hash](self->_removeAllItems, "hash");
  return v9 ^ v11 ^ -[SPProtoAudioFilePlayerUpdateContainedIdentifier hash](self->_setCurrentItem, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  SPProtoAudioFileQueuePlayerSetItems *upsertWithItems;
  uint64_t v6;
  SPProtoObjectMessage *destroy;
  uint64_t v8;
  SPProtoAudioFileQueuePlayerSetRate *setRate;
  uint64_t v10;
  SPProtoAudioFilePlayerUpdateContainedIdentifier *replaceCurrentItem;
  uint64_t v12;
  SPProtoAudioFilePlayerStatus *setStatus;
  uint64_t v14;
  SPProtoObjectMessage *advanceToNextItem;
  uint64_t v16;
  SPProtoAudioFilePlayerUpdateContainedIdentifier *appendItem;
  uint64_t v18;
  SPProtoAudioFilePlayerUpdateContainedIdentifier *removeItem;
  uint64_t v20;
  SPProtoObjectMessage *removeAllItems;
  uint64_t v22;
  SPProtoAudioFilePlayerUpdateContainedIdentifier *setCurrentItem;
  uint64_t v24;
  _QWORD *v25;

  v4 = a3;
  upsertWithItems = self->_upsertWithItems;
  v25 = v4;
  v6 = v4[10];
  if (upsertWithItems)
  {
    if (v6)
      -[SPProtoAudioFileQueuePlayerSetItems mergeFrom:](upsertWithItems, "mergeFrom:");
  }
  else if (v6)
  {
    -[SPProtoAudioFileQueuePlayer setUpsertWithItems:](self, "setUpsertWithItems:");
  }
  destroy = self->_destroy;
  v8 = v25[3];
  if (destroy)
  {
    if (v8)
      -[SPProtoObjectMessage mergeFrom:](destroy, "mergeFrom:");
  }
  else if (v8)
  {
    -[SPProtoAudioFileQueuePlayer setDestroy:](self, "setDestroy:");
  }
  setRate = self->_setRate;
  v10 = v25[8];
  if (setRate)
  {
    if (v10)
      -[SPProtoAudioFileQueuePlayerSetRate mergeFrom:](setRate, "mergeFrom:");
  }
  else if (v10)
  {
    -[SPProtoAudioFileQueuePlayer setSetRate:](self, "setSetRate:");
  }
  replaceCurrentItem = self->_replaceCurrentItem;
  v12 = v25[6];
  if (replaceCurrentItem)
  {
    if (v12)
      -[SPProtoAudioFilePlayerUpdateContainedIdentifier mergeFrom:](replaceCurrentItem, "mergeFrom:");
  }
  else if (v12)
  {
    -[SPProtoAudioFileQueuePlayer setReplaceCurrentItem:](self, "setReplaceCurrentItem:");
  }
  setStatus = self->_setStatus;
  v14 = v25[9];
  if (setStatus)
  {
    if (v14)
      -[SPProtoAudioFilePlayerStatus mergeFrom:](setStatus, "mergeFrom:");
  }
  else if (v14)
  {
    -[SPProtoAudioFileQueuePlayer setSetStatus:](self, "setSetStatus:");
  }
  advanceToNextItem = self->_advanceToNextItem;
  v16 = v25[1];
  if (advanceToNextItem)
  {
    if (v16)
      -[SPProtoObjectMessage mergeFrom:](advanceToNextItem, "mergeFrom:");
  }
  else if (v16)
  {
    -[SPProtoAudioFileQueuePlayer setAdvanceToNextItem:](self, "setAdvanceToNextItem:");
  }
  appendItem = self->_appendItem;
  v18 = v25[2];
  if (appendItem)
  {
    if (v18)
      -[SPProtoAudioFilePlayerUpdateContainedIdentifier mergeFrom:](appendItem, "mergeFrom:");
  }
  else if (v18)
  {
    -[SPProtoAudioFileQueuePlayer setAppendItem:](self, "setAppendItem:");
  }
  removeItem = self->_removeItem;
  v20 = v25[5];
  if (removeItem)
  {
    if (v20)
      -[SPProtoAudioFilePlayerUpdateContainedIdentifier mergeFrom:](removeItem, "mergeFrom:");
  }
  else if (v20)
  {
    -[SPProtoAudioFileQueuePlayer setRemoveItem:](self, "setRemoveItem:");
  }
  removeAllItems = self->_removeAllItems;
  v22 = v25[4];
  if (removeAllItems)
  {
    if (v22)
      -[SPProtoObjectMessage mergeFrom:](removeAllItems, "mergeFrom:");
  }
  else if (v22)
  {
    -[SPProtoAudioFileQueuePlayer setRemoveAllItems:](self, "setRemoveAllItems:");
  }
  setCurrentItem = self->_setCurrentItem;
  v24 = v25[7];
  if (setCurrentItem)
  {
    if (v24)
      -[SPProtoAudioFilePlayerUpdateContainedIdentifier mergeFrom:](setCurrentItem, "mergeFrom:");
  }
  else if (v24)
  {
    -[SPProtoAudioFileQueuePlayer setSetCurrentItem:](self, "setSetCurrentItem:");
  }

}

- (SPProtoAudioFileQueuePlayerSetItems)upsertWithItems
{
  return self->_upsertWithItems;
}

- (void)setUpsertWithItems:(id)a3
{
  objc_storeStrong((id *)&self->_upsertWithItems, a3);
}

- (SPProtoObjectMessage)destroy
{
  return self->_destroy;
}

- (void)setDestroy:(id)a3
{
  objc_storeStrong((id *)&self->_destroy, a3);
}

- (SPProtoAudioFileQueuePlayerSetRate)setRate
{
  return self->_setRate;
}

- (void)setSetRate:(id)a3
{
  objc_storeStrong((id *)&self->_setRate, a3);
}

- (SPProtoAudioFilePlayerUpdateContainedIdentifier)replaceCurrentItem
{
  return self->_replaceCurrentItem;
}

- (void)setReplaceCurrentItem:(id)a3
{
  objc_storeStrong((id *)&self->_replaceCurrentItem, a3);
}

- (SPProtoAudioFilePlayerStatus)setStatus
{
  return self->_setStatus;
}

- (void)setSetStatus:(id)a3
{
  objc_storeStrong((id *)&self->_setStatus, a3);
}

- (SPProtoObjectMessage)advanceToNextItem
{
  return self->_advanceToNextItem;
}

- (void)setAdvanceToNextItem:(id)a3
{
  objc_storeStrong((id *)&self->_advanceToNextItem, a3);
}

- (SPProtoAudioFilePlayerUpdateContainedIdentifier)appendItem
{
  return self->_appendItem;
}

- (void)setAppendItem:(id)a3
{
  objc_storeStrong((id *)&self->_appendItem, a3);
}

- (SPProtoAudioFilePlayerUpdateContainedIdentifier)removeItem
{
  return self->_removeItem;
}

- (void)setRemoveItem:(id)a3
{
  objc_storeStrong((id *)&self->_removeItem, a3);
}

- (SPProtoObjectMessage)removeAllItems
{
  return self->_removeAllItems;
}

- (void)setRemoveAllItems:(id)a3
{
  objc_storeStrong((id *)&self->_removeAllItems, a3);
}

- (SPProtoAudioFilePlayerUpdateContainedIdentifier)setCurrentItem
{
  return self->_setCurrentItem;
}

- (void)setSetCurrentItem:(id)a3
{
  objc_storeStrong((id *)&self->_setCurrentItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upsertWithItems, 0);
  objc_storeStrong((id *)&self->_setStatus, 0);
  objc_storeStrong((id *)&self->_setRate, 0);
  objc_storeStrong((id *)&self->_setCurrentItem, 0);
  objc_storeStrong((id *)&self->_replaceCurrentItem, 0);
  objc_storeStrong((id *)&self->_removeItem, 0);
  objc_storeStrong((id *)&self->_removeAllItems, 0);
  objc_storeStrong((id *)&self->_destroy, 0);
  objc_storeStrong((id *)&self->_appendItem, 0);
  objc_storeStrong((id *)&self->_advanceToNextItem, 0);
}

- (id)sockPuppetMessage
{
  return +[SPProtoSockPuppetMessage sockPuppetMessageWithSubMessage:setterSelector:](SPProtoSockPuppetMessage, "sockPuppetMessageWithSubMessage:setterSelector:", self, sel_setQueuePlayer_);
}

@end
