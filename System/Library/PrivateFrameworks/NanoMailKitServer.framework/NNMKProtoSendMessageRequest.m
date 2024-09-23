@implementation NNMKProtoSendMessageRequest

- (void)clearTos
{
  -[NSMutableArray removeAllObjects](self->_tos, "removeAllObjects");
}

- (void)addTo:(id)a3
{
  id v4;
  NSMutableArray *tos;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  tos = self->_tos;
  v8 = v4;
  if (!tos)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_tos;
    self->_tos = v6;

    v4 = v8;
    tos = self->_tos;
  }
  -[NSMutableArray addObject:](tos, "addObject:", v4);

}

- (unint64_t)tosCount
{
  return -[NSMutableArray count](self->_tos, "count");
}

- (id)toAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_tos, "objectAtIndex:", a3);
}

+ (Class)toType
{
  return (Class)objc_opt_class();
}

- (void)clearCcs
{
  -[NSMutableArray removeAllObjects](self->_ccs, "removeAllObjects");
}

- (void)addCc:(id)a3
{
  id v4;
  NSMutableArray *ccs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  ccs = self->_ccs;
  v8 = v4;
  if (!ccs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_ccs;
    self->_ccs = v6;

    v4 = v8;
    ccs = self->_ccs;
  }
  -[NSMutableArray addObject:](ccs, "addObject:", v4);

}

- (unint64_t)ccsCount
{
  return -[NSMutableArray count](self->_ccs, "count");
}

- (id)ccAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_ccs, "objectAtIndex:", a3);
}

+ (Class)ccType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasSubject
{
  return self->_subject != 0;
}

- (BOOL)hasBody
{
  return self->_body != 0;
}

- (BOOL)hasComposedMessageId
{
  return self->_composedMessageId != 0;
}

- (void)setSendingType:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_sendingType = a3;
}

- (void)setHasSendingType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSendingType
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasReferenceMessageId
{
  return self->_referenceMessageId != 0;
}

- (void)setIncludeAttachments:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_includeAttachments = a3;
}

- (void)setHasIncludeAttachments:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIncludeAttachments
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasAccountId
{
  return self->_accountId != 0;
}

- (BOOL)hasFrom
{
  return self->_from != 0;
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
  v8.super_class = (Class)NNMKProtoSendMessageRequest;
  -[NNMKProtoSendMessageRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKProtoSendMessageRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *tos;
  NSMutableArray *ccs;
  NSString *subject;
  NSString *body;
  NSString *composedMessageId;
  void *v10;
  NSString *referenceMessageId;
  void *v12;
  NSString *accountId;
  NSString *from;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  tos = self->_tos;
  if (tos)
    objc_msgSend(v3, "setObject:forKey:", tos, CFSTR("to"));
  ccs = self->_ccs;
  if (ccs)
    objc_msgSend(v4, "setObject:forKey:", ccs, CFSTR("cc"));
  subject = self->_subject;
  if (subject)
    objc_msgSend(v4, "setObject:forKey:", subject, CFSTR("subject"));
  body = self->_body;
  if (body)
    objc_msgSend(v4, "setObject:forKey:", body, CFSTR("body"));
  composedMessageId = self->_composedMessageId;
  if (composedMessageId)
    objc_msgSend(v4, "setObject:forKey:", composedMessageId, CFSTR("composedMessageId"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_sendingType);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("sendingType"));

  }
  referenceMessageId = self->_referenceMessageId;
  if (referenceMessageId)
    objc_msgSend(v4, "setObject:forKey:", referenceMessageId, CFSTR("referenceMessageId"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_includeAttachments);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("includeAttachments"));

  }
  accountId = self->_accountId;
  if (accountId)
    objc_msgSend(v4, "setObject:forKey:", accountId, CFSTR("accountId"));
  from = self->_from;
  if (from)
    objc_msgSend(v4, "setObject:forKey:", from, CFSTR("from"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NNMKProtoSendMessageRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = self->_tos;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_ccs;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

  if (self->_subject)
    PBDataWriterWriteStringField();
  if (self->_body)
    PBDataWriterWriteStringField();
  if (self->_composedMessageId)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_referenceMessageId)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_accountId)
    PBDataWriterWriteStringField();
  if (self->_from)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  _DWORD *v12;
  id v13;

  v13 = a3;
  if (-[NNMKProtoSendMessageRequest tosCount](self, "tosCount"))
  {
    objc_msgSend(v13, "clearTos");
    v4 = -[NNMKProtoSendMessageRequest tosCount](self, "tosCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[NNMKProtoSendMessageRequest toAtIndex:](self, "toAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addTo:", v7);

      }
    }
  }
  if (-[NNMKProtoSendMessageRequest ccsCount](self, "ccsCount"))
  {
    objc_msgSend(v13, "clearCcs");
    v8 = -[NNMKProtoSendMessageRequest ccsCount](self, "ccsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[NNMKProtoSendMessageRequest ccAtIndex:](self, "ccAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addCc:", v11);

      }
    }
  }
  if (self->_subject)
    objc_msgSend(v13, "setSubject:");
  v12 = v13;
  if (self->_body)
  {
    objc_msgSend(v13, "setBody:");
    v12 = v13;
  }
  if (self->_composedMessageId)
  {
    objc_msgSend(v13, "setComposedMessageId:");
    v12 = v13;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v12[14] = self->_sendingType;
    *((_BYTE *)v12 + 84) |= 1u;
  }
  if (self->_referenceMessageId)
  {
    objc_msgSend(v13, "setReferenceMessageId:");
    v12 = v13;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_BYTE *)v12 + 80) = self->_includeAttachments;
    *((_BYTE *)v12 + 84) |= 2u;
  }
  if (self->_accountId)
  {
    objc_msgSend(v13, "setAccountId:");
    v12 = v13;
  }
  if (self->_from)
  {
    objc_msgSend(v13, "setFrom:");
    v12 = v13;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v6 = self->_tos;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v36;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v36 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v10), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addTo:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v8);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v12 = self->_ccs;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v32;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v32 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v16), "copyWithZone:", a3, (_QWORD)v31);
        objc_msgSend((id)v5, "addCc:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v14);
  }

  v18 = -[NSString copyWithZone:](self->_subject, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v18;

  v20 = -[NSString copyWithZone:](self->_body, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v20;

  v22 = -[NSString copyWithZone:](self->_composedMessageId, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v22;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_sendingType;
    *(_BYTE *)(v5 + 84) |= 1u;
  }
  v24 = -[NSString copyWithZone:](self->_referenceMessageId, "copyWithZone:", a3, (_QWORD)v31);
  v25 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v24;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_BYTE *)(v5 + 80) = self->_includeAttachments;
    *(_BYTE *)(v5 + 84) |= 2u;
  }
  v26 = -[NSString copyWithZone:](self->_accountId, "copyWithZone:", a3);
  v27 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v26;

  v28 = -[NSString copyWithZone:](self->_from, "copyWithZone:", a3);
  v29 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v28;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *tos;
  NSMutableArray *ccs;
  NSString *subject;
  NSString *body;
  NSString *composedMessageId;
  char has;
  NSString *referenceMessageId;
  NSString *accountId;
  NSString *from;
  char v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_32;
  tos = self->_tos;
  if ((unint64_t)tos | *((_QWORD *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](tos, "isEqual:"))
      goto LABEL_32;
  }
  ccs = self->_ccs;
  if ((unint64_t)ccs | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](ccs, "isEqual:"))
      goto LABEL_32;
  }
  subject = self->_subject;
  if ((unint64_t)subject | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](subject, "isEqual:"))
      goto LABEL_32;
  }
  body = self->_body;
  if ((unint64_t)body | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](body, "isEqual:"))
      goto LABEL_32;
  }
  composedMessageId = self->_composedMessageId;
  if ((unint64_t)composedMessageId | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](composedMessageId, "isEqual:"))
      goto LABEL_32;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 84) & 1) == 0 || self->_sendingType != *((_DWORD *)v4 + 14))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)v4 + 84) & 1) != 0)
  {
    goto LABEL_32;
  }
  referenceMessageId = self->_referenceMessageId;
  if ((unint64_t)referenceMessageId | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](referenceMessageId, "isEqual:"))
      goto LABEL_32;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 84) & 2) != 0)
    {
      if (self->_includeAttachments)
      {
        if (!*((_BYTE *)v4 + 80))
          goto LABEL_32;
        goto LABEL_28;
      }
      if (!*((_BYTE *)v4 + 80))
        goto LABEL_28;
    }
LABEL_32:
    v14 = 0;
    goto LABEL_33;
  }
  if ((*((_BYTE *)v4 + 84) & 2) != 0)
    goto LABEL_32;
LABEL_28:
  accountId = self->_accountId;
  if ((unint64_t)accountId | *((_QWORD *)v4 + 1) && !-[NSString isEqual:](accountId, "isEqual:"))
    goto LABEL_32;
  from = self->_from;
  if ((unint64_t)from | *((_QWORD *)v4 + 5))
    v14 = -[NSString isEqual:](from, "isEqual:");
  else
    v14 = 1;
LABEL_33:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;
  NSUInteger v9;
  uint64_t v10;
  NSUInteger v11;
  NSUInteger v12;

  v3 = -[NSMutableArray hash](self->_tos, "hash");
  v4 = -[NSMutableArray hash](self->_ccs, "hash");
  v5 = -[NSString hash](self->_subject, "hash");
  v6 = -[NSString hash](self->_body, "hash");
  v7 = -[NSString hash](self->_composedMessageId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v8 = 2654435761 * self->_sendingType;
  else
    v8 = 0;
  v9 = -[NSString hash](self->_referenceMessageId, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v10 = 2654435761 * self->_includeAttachments;
  else
    v10 = 0;
  v11 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  v12 = v10 ^ -[NSString hash](self->_accountId, "hash");
  return v11 ^ v12 ^ -[NSString hash](self->_from, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = *((id *)v4 + 9);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        -[NNMKProtoSendMessageRequest addTo:](self, "addTo:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = *((id *)v4 + 3);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        -[NNMKProtoSendMessageRequest addCc:](self, "addCc:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * j), (_QWORD)v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

  if (*((_QWORD *)v4 + 8))
    -[NNMKProtoSendMessageRequest setSubject:](self, "setSubject:");
  if (*((_QWORD *)v4 + 2))
    -[NNMKProtoSendMessageRequest setBody:](self, "setBody:");
  if (*((_QWORD *)v4 + 4))
    -[NNMKProtoSendMessageRequest setComposedMessageId:](self, "setComposedMessageId:");
  if ((*((_BYTE *)v4 + 84) & 1) != 0)
  {
    self->_sendingType = *((_DWORD *)v4 + 14);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 6))
    -[NNMKProtoSendMessageRequest setReferenceMessageId:](self, "setReferenceMessageId:");
  if ((*((_BYTE *)v4 + 84) & 2) != 0)
  {
    self->_includeAttachments = *((_BYTE *)v4 + 80);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 1))
    -[NNMKProtoSendMessageRequest setAccountId:](self, "setAccountId:");
  if (*((_QWORD *)v4 + 5))
    -[NNMKProtoSendMessageRequest setFrom:](self, "setFrom:");

}

- (NSMutableArray)tos
{
  return self->_tos;
}

- (void)setTos:(id)a3
{
  objc_storeStrong((id *)&self->_tos, a3);
}

- (NSMutableArray)ccs
{
  return self->_ccs;
}

- (void)setCcs:(id)a3
{
  objc_storeStrong((id *)&self->_ccs, a3);
}

- (NSString)subject
{
  return self->_subject;
}

- (void)setSubject:(id)a3
{
  objc_storeStrong((id *)&self->_subject, a3);
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
  objc_storeStrong((id *)&self->_body, a3);
}

- (NSString)composedMessageId
{
  return self->_composedMessageId;
}

- (void)setComposedMessageId:(id)a3
{
  objc_storeStrong((id *)&self->_composedMessageId, a3);
}

- (unsigned)sendingType
{
  return self->_sendingType;
}

- (NSString)referenceMessageId
{
  return self->_referenceMessageId;
}

- (void)setReferenceMessageId:(id)a3
{
  objc_storeStrong((id *)&self->_referenceMessageId, a3);
}

- (BOOL)includeAttachments
{
  return self->_includeAttachments;
}

- (NSString)accountId
{
  return self->_accountId;
}

- (void)setAccountId:(id)a3
{
  objc_storeStrong((id *)&self->_accountId, a3);
}

- (NSString)from
{
  return self->_from;
}

- (void)setFrom:(id)a3
{
  objc_storeStrong((id *)&self->_from, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tos, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_referenceMessageId, 0);
  objc_storeStrong((id *)&self->_from, 0);
  objc_storeStrong((id *)&self->_composedMessageId, 0);
  objc_storeStrong((id *)&self->_ccs, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_accountId, 0);
}

@end
