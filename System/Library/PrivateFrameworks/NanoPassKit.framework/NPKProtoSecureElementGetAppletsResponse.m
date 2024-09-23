@implementation NPKProtoSecureElementGetAppletsResponse

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)NPKProtoSecureElementGetAppletsResponse;
  -[NPKProtoSecureElementGetAppletsResponse dealloc](&v3, sel_dealloc);
}

- (void)setPending:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_pending = a3;
}

- (void)setHasPending:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPending
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)clearCardAIDs
{
  -[NSMutableArray removeAllObjects](self->_cardAIDs, "removeAllObjects");
}

- (void)addCardAIDs:(id)a3
{
  id v4;
  NSMutableArray *cardAIDs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  cardAIDs = self->_cardAIDs;
  v8 = v4;
  if (!cardAIDs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_cardAIDs;
    self->_cardAIDs = v6;

    v4 = v8;
    cardAIDs = self->_cardAIDs;
  }
  -[NSMutableArray addObject:](cardAIDs, "addObject:", v4);

}

- (unint64_t)cardAIDsCount
{
  return -[NSMutableArray count](self->_cardAIDs, "count");
}

- (id)cardAIDsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_cardAIDs, "objectAtIndex:", a3);
}

+ (Class)cardAIDsType
{
  return (Class)objc_opt_class();
}

- (unint64_t)lifecycleStatesCount
{
  return self->_lifecycleStates.count;
}

- (unsigned)lifecycleStates
{
  return self->_lifecycleStates.list;
}

- (void)clearLifecycleStates
{
  PBRepeatedUInt32Clear();
}

- (void)addLifecycleStates:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)lifecycleStatesAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_lifecycleStates;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_lifecycleStates = &self->_lifecycleStates;
  count = self->_lifecycleStates.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x24BDBCE88];
    v7 = *MEMORY[0x24BDBCB78];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_lifecycleStates->list[a3];
}

- (void)setLifecycleStates:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (unint64_t)activationStatesCount
{
  return self->_activationStates.count;
}

- (unsigned)activationStates
{
  return self->_activationStates.list;
}

- (void)clearActivationStates
{
  PBRepeatedUInt32Clear();
}

- (void)addActivationStates:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)activationStatesAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_activationStates;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_activationStates = &self->_activationStates;
  count = self->_activationStates.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x24BDBCE88];
    v7 = *MEMORY[0x24BDBCB78];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_activationStates->list[a3];
}

- (void)setActivationStates:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (void)clearAppletsBytes
{
  -[NSMutableArray removeAllObjects](self->_appletsBytes, "removeAllObjects");
}

- (void)addAppletsBytes:(id)a3
{
  id v4;
  NSMutableArray *appletsBytes;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  appletsBytes = self->_appletsBytes;
  v8 = v4;
  if (!appletsBytes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_appletsBytes;
    self->_appletsBytes = v6;

    v4 = v8;
    appletsBytes = self->_appletsBytes;
  }
  -[NSMutableArray addObject:](appletsBytes, "addObject:", v4);

}

- (unint64_t)appletsBytesCount
{
  return -[NSMutableArray count](self->_appletsBytes, "count");
}

- (id)appletsBytesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_appletsBytes, "objectAtIndex:", a3);
}

+ (Class)appletsBytesType
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)NPKProtoSecureElementGetAppletsResponse;
  -[NPKProtoSecureElementGetAppletsResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoSecureElementGetAppletsResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *cardAIDs;
  void *v6;
  void *v7;
  NSMutableArray *appletsBytes;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_pending);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("pending"));

  }
  cardAIDs = self->_cardAIDs;
  if (cardAIDs)
    objc_msgSend(v3, "setObject:forKey:", cardAIDs, CFSTR("cardAIDs"));
  PBRepeatedUInt32NSArray();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("lifecycleStates"));

  PBRepeatedUInt32NSArray();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("activationStates"));

  appletsBytes = self->_appletsBytes;
  if (appletsBytes)
    objc_msgSend(v3, "setObject:forKey:", appletsBytes, CFSTR("appletsBytes"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoSecureElementGetAppletsResponseReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = self->_cardAIDs;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v7);
  }

  if (self->_lifecycleStates.count)
  {
    v10 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v10;
    }
    while (v10 < self->_lifecycleStates.count);
  }
  if (self->_activationStates.count)
  {
    v11 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v11;
    }
    while (v11 < self->_activationStates.count);
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = self->_appletsBytes;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        PBDataWriterWriteDataField();
        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v14);
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  unint64_t v12;
  unint64_t v13;
  uint64_t k;
  unint64_t v15;
  unint64_t v16;
  uint64_t m;
  void *v18;
  id v19;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[72] = self->_pending;
    v4[76] |= 1u;
  }
  v19 = v4;
  if (-[NPKProtoSecureElementGetAppletsResponse cardAIDsCount](self, "cardAIDsCount"))
  {
    objc_msgSend(v19, "clearCardAIDs");
    v5 = -[NPKProtoSecureElementGetAppletsResponse cardAIDsCount](self, "cardAIDsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[NPKProtoSecureElementGetAppletsResponse cardAIDsAtIndex:](self, "cardAIDsAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addCardAIDs:", v8);

      }
    }
  }
  if (-[NPKProtoSecureElementGetAppletsResponse lifecycleStatesCount](self, "lifecycleStatesCount"))
  {
    objc_msgSend(v19, "clearLifecycleStates");
    v9 = -[NPKProtoSecureElementGetAppletsResponse lifecycleStatesCount](self, "lifecycleStatesCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
        objc_msgSend(v19, "addLifecycleStates:", -[NPKProtoSecureElementGetAppletsResponse lifecycleStatesAtIndex:](self, "lifecycleStatesAtIndex:", j));
    }
  }
  if (-[NPKProtoSecureElementGetAppletsResponse activationStatesCount](self, "activationStatesCount"))
  {
    objc_msgSend(v19, "clearActivationStates");
    v12 = -[NPKProtoSecureElementGetAppletsResponse activationStatesCount](self, "activationStatesCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
        objc_msgSend(v19, "addActivationStates:", -[NPKProtoSecureElementGetAppletsResponse activationStatesAtIndex:](self, "activationStatesAtIndex:", k));
    }
  }
  if (-[NPKProtoSecureElementGetAppletsResponse appletsBytesCount](self, "appletsBytesCount"))
  {
    objc_msgSend(v19, "clearAppletsBytes");
    v15 = -[NPKProtoSecureElementGetAppletsResponse appletsBytesCount](self, "appletsBytesCount");
    if (v15)
    {
      v16 = v15;
      for (m = 0; m != v16; ++m)
      {
        -[NPKProtoSecureElementGetAppletsResponse appletsBytesAtIndex:](self, "appletsBytesAtIndex:", m);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addAppletsBytes:", v18);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 72) = self->_pending;
    *(_BYTE *)(v5 + 76) |= 1u;
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = self->_cardAIDs;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v25;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v11), "copyWithZone:", a3);
        objc_msgSend(v6, "addCardAIDs:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v9);
  }

  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = self->_appletsBytes;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v17), "copyWithZone:", a3, (_QWORD)v20);
        objc_msgSend(v6, "addAppletsBytes:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v15);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *cardAIDs;
  NSMutableArray *appletsBytes;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 1) != 0)
    {
      if (self->_pending)
      {
        if (!*((_BYTE *)v4 + 72))
          goto LABEL_16;
        goto LABEL_10;
      }
      if (!*((_BYTE *)v4 + 72))
        goto LABEL_10;
    }
LABEL_16:
    v7 = 0;
    goto LABEL_17;
  }
  if ((*((_BYTE *)v4 + 76) & 1) != 0)
    goto LABEL_16;
LABEL_10:
  cardAIDs = self->_cardAIDs;
  if ((unint64_t)cardAIDs | *((_QWORD *)v4 + 8)
    && !-[NSMutableArray isEqual:](cardAIDs, "isEqual:")
    || !PBRepeatedUInt32IsEqual()
    || !PBRepeatedUInt32IsEqual())
  {
    goto LABEL_16;
  }
  appletsBytes = self->_appletsBytes;
  if ((unint64_t)appletsBytes | *((_QWORD *)v4 + 7))
    v7 = -[NSMutableArray isEqual:](appletsBytes, "isEqual:");
  else
    v7 = 1;
LABEL_17:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_pending;
  else
    v3 = 0;
  v4 = -[NSMutableArray hash](self->_cardAIDs, "hash");
  v5 = v3 ^ PBRepeatedUInt32Hash();
  v6 = v4 ^ v5 ^ PBRepeatedUInt32Hash();
  return v6 ^ -[NSMutableArray hash](self->_appletsBytes, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (id *)v4;
  if ((*((_BYTE *)v4 + 76) & 1) != 0)
  {
    self->_pending = *((_BYTE *)v4 + 72);
    *(_BYTE *)&self->_has |= 1u;
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v6 = *((id *)v4 + 8);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v27;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(v6);
        -[NPKProtoSecureElementGetAppletsResponse addCardAIDs:](self, "addCardAIDs:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v8);
  }

  v11 = objc_msgSend(v5, "lifecycleStatesCount");
  if (v11)
  {
    v12 = v11;
    for (i = 0; i != v12; ++i)
      -[NPKProtoSecureElementGetAppletsResponse addLifecycleStates:](self, "addLifecycleStates:", objc_msgSend(v5, "lifecycleStatesAtIndex:", i));
  }
  v14 = objc_msgSend(v5, "activationStatesCount");
  if (v14)
  {
    v15 = v14;
    for (j = 0; j != v15; ++j)
      -[NPKProtoSecureElementGetAppletsResponse addActivationStates:](self, "addActivationStates:", objc_msgSend(v5, "activationStatesAtIndex:", j));
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v17 = v5[7];
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v23;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v23 != v20)
          objc_enumerationMutation(v17);
        -[NPKProtoSecureElementGetAppletsResponse addAppletsBytes:](self, "addAppletsBytes:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v21++), (_QWORD)v22);
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v19);
  }

}

- (BOOL)pending
{
  return self->_pending;
}

- (NSMutableArray)cardAIDs
{
  return self->_cardAIDs;
}

- (void)setCardAIDs:(id)a3
{
  objc_storeStrong((id *)&self->_cardAIDs, a3);
}

- (NSMutableArray)appletsBytes
{
  return self->_appletsBytes;
}

- (void)setAppletsBytes:(id)a3
{
  objc_storeStrong((id *)&self->_appletsBytes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardAIDs, 0);
  objc_storeStrong((id *)&self->_appletsBytes, 0);
}

@end
