@implementation ASCodableCloudKitRelationship

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (BOOL)hasIncomingHandshakeToken
{
  return self->_incomingHandshakeToken != 0;
}

- (BOOL)hasOutgoingHandshakeToken
{
  return self->_outgoingHandshakeToken != 0;
}

- (BOOL)hasCloudKitAddress
{
  return self->_cloudKitAddress != 0;
}

- (void)clearAddresses
{
  -[NSMutableArray removeAllObjects](self->_addresses, "removeAllObjects");
}

- (void)addAddresses:(id)a3
{
  id v4;
  NSMutableArray *addresses;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  addresses = self->_addresses;
  v8 = v4;
  if (!addresses)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_addresses;
    self->_addresses = v6;

    v4 = v8;
    addresses = self->_addresses;
  }
  -[NSMutableArray addObject:](addresses, "addObject:", v4);

}

- (unint64_t)addressesCount
{
  return -[NSMutableArray count](self->_addresses, "count");
}

- (id)addressesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_addresses, "objectAtIndex:", a3);
}

+ (Class)addressesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasPreferredReachableAddress
{
  return self->_preferredReachableAddress != 0;
}

- (BOOL)hasPreferredReachableService
{
  return self->_preferredReachableService != 0;
}

- (void)clearEvents
{
  -[NSMutableArray removeAllObjects](self->_events, "removeAllObjects");
}

- (void)addEvents:(id)a3
{
  id v4;
  NSMutableArray *events;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  events = self->_events;
  v8 = v4;
  if (!events)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_events;
    self->_events = v6;

    v4 = v8;
    events = self->_events;
  }
  -[NSMutableArray addObject:](events, "addObject:", v4);

}

- (unint64_t)eventsCount
{
  return -[NSMutableArray count](self->_events, "count");
}

- (id)eventsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_events, "objectAtIndex:", a3);
}

+ (Class)eventsType
{
  return (Class)objc_opt_class();
}

- (void)setEventCount:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_eventCount = a3;
}

- (void)setHasEventCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEventCount
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setSupportedPhoneFeatures:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_supportedPhoneFeatures = a3;
}

- (void)setHasSupportedPhoneFeatures:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSupportedPhoneFeatures
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setSupportedWatchFeatures:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_supportedWatchFeatures = a3;
}

- (void)setHasSupportedWatchFeatures:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSupportedWatchFeatures
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setCloudType:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_cloudType = a3;
}

- (void)setHasCloudType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCloudType
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasSecureCloudUpgradeToken
{
  return self->_secureCloudUpgradeToken != 0;
}

- (BOOL)hasSentInvitation
{
  return self->_sentInvitation != 0;
}

- (BOOL)hasReceivedInvitation
{
  return self->_receivedInvitation != 0;
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
  v8.super_class = (Class)ASCodableCloudKitRelationship;
  -[ASCodableCloudKitRelationship description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCodableCloudKitRelationship dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *uuid;
  NSString *incomingHandshakeToken;
  NSString *outgoingHandshakeToken;
  NSString *cloudKitAddress;
  NSMutableArray *addresses;
  NSString *preferredReachableAddress;
  NSString *preferredReachableService;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  char has;
  void *v20;
  NSString *secureCloudUpgradeToken;
  NSData *sentInvitation;
  NSData *receivedInvitation;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  uuid = self->_uuid;
  if (uuid)
    objc_msgSend(v3, "setObject:forKey:", uuid, CFSTR("uuid"));
  incomingHandshakeToken = self->_incomingHandshakeToken;
  if (incomingHandshakeToken)
    objc_msgSend(v4, "setObject:forKey:", incomingHandshakeToken, CFSTR("incomingHandshakeToken"));
  outgoingHandshakeToken = self->_outgoingHandshakeToken;
  if (outgoingHandshakeToken)
    objc_msgSend(v4, "setObject:forKey:", outgoingHandshakeToken, CFSTR("outgoingHandshakeToken"));
  cloudKitAddress = self->_cloudKitAddress;
  if (cloudKitAddress)
    objc_msgSend(v4, "setObject:forKey:", cloudKitAddress, CFSTR("cloudKitAddress"));
  addresses = self->_addresses;
  if (addresses)
    objc_msgSend(v4, "setObject:forKey:", addresses, CFSTR("addresses"));
  preferredReachableAddress = self->_preferredReachableAddress;
  if (preferredReachableAddress)
    objc_msgSend(v4, "setObject:forKey:", preferredReachableAddress, CFSTR("preferredReachableAddress"));
  preferredReachableService = self->_preferredReachableService;
  if (preferredReachableService)
    objc_msgSend(v4, "setObject:forKey:", preferredReachableService, CFSTR("preferredReachableService"));
  if (-[NSMutableArray count](self->_events, "count"))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_events, "count"));
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v13 = self->_events;
    v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v29 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v28);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v18);

        }
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v15);
    }

    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("events"));
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_eventCount);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("eventCount"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_26:
      if ((has & 8) == 0)
        goto LABEL_27;
      goto LABEL_38;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_26;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_supportedPhoneFeatures, (_QWORD)v28);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("supportedPhoneFeatures"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_27:
    if ((has & 1) == 0)
      goto LABEL_29;
    goto LABEL_28;
  }
LABEL_38:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_supportedWatchFeatures, (_QWORD)v28);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v27, CFSTR("supportedWatchFeatures"));

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_28:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_cloudType, (_QWORD)v28);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("cloudType"));

  }
LABEL_29:
  secureCloudUpgradeToken = self->_secureCloudUpgradeToken;
  if (secureCloudUpgradeToken)
    objc_msgSend(v4, "setObject:forKey:", secureCloudUpgradeToken, CFSTR("secureCloudUpgradeToken"));
  sentInvitation = self->_sentInvitation;
  if (sentInvitation)
    objc_msgSend(v4, "setObject:forKey:", sentInvitation, CFSTR("sentInvitation"));
  receivedInvitation = self->_receivedInvitation;
  if (receivedInvitation)
    objc_msgSend(v4, "setObject:forKey:", receivedInvitation, CFSTR("receivedInvitation"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ASCodableCloudKitRelationshipReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  char has;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_uuid)
    PBDataWriterWriteDataField();
  if (self->_incomingHandshakeToken)
    PBDataWriterWriteStringField();
  if (self->_outgoingHandshakeToken)
    PBDataWriterWriteStringField();
  if (self->_cloudKitAddress)
    PBDataWriterWriteStringField();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = self->_addresses;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v7);
  }

  if (self->_preferredReachableAddress)
    PBDataWriterWriteStringField();
  if (self->_preferredReachableService)
    PBDataWriterWriteStringField();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = self->_events;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v12);
  }

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_29:
      if ((has & 8) == 0)
        goto LABEL_30;
      goto LABEL_41;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_29;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_30:
    if ((has & 1) == 0)
      goto LABEL_32;
    goto LABEL_31;
  }
LABEL_41:
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 1) != 0)
LABEL_31:
    PBDataWriterWriteInt64Field();
LABEL_32:
  if (self->_secureCloudUpgradeToken)
    PBDataWriterWriteStringField();
  if (self->_sentInvitation)
    PBDataWriterWriteDataField();
  if (self->_receivedInvitation)
    PBDataWriterWriteDataField();

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
  char has;
  void *v13;
  id v14;

  v14 = a3;
  if (self->_uuid)
    objc_msgSend(v14, "setUuid:");
  if (self->_incomingHandshakeToken)
    objc_msgSend(v14, "setIncomingHandshakeToken:");
  if (self->_outgoingHandshakeToken)
    objc_msgSend(v14, "setOutgoingHandshakeToken:");
  if (self->_cloudKitAddress)
    objc_msgSend(v14, "setCloudKitAddress:");
  if (-[ASCodableCloudKitRelationship addressesCount](self, "addressesCount"))
  {
    objc_msgSend(v14, "clearAddresses");
    v4 = -[ASCodableCloudKitRelationship addressesCount](self, "addressesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[ASCodableCloudKitRelationship addressesAtIndex:](self, "addressesAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addAddresses:", v7);

      }
    }
  }
  if (self->_preferredReachableAddress)
    objc_msgSend(v14, "setPreferredReachableAddress:");
  if (self->_preferredReachableService)
    objc_msgSend(v14, "setPreferredReachableService:");
  if (-[ASCodableCloudKitRelationship eventsCount](self, "eventsCount"))
  {
    objc_msgSend(v14, "clearEvents");
    v8 = -[ASCodableCloudKitRelationship eventsCount](self, "eventsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[ASCodableCloudKitRelationship eventsAtIndex:](self, "eventsAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addEvents:", v11);

      }
    }
  }
  has = (char)self->_has;
  v13 = v14;
  if ((has & 2) != 0)
  {
    *((_QWORD *)v14 + 2) = self->_eventCount;
    *((_BYTE *)v14 + 120) |= 2u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_23:
      if ((has & 8) == 0)
        goto LABEL_24;
      goto LABEL_35;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_23;
  }
  *((_DWORD *)v14 + 26) = self->_supportedPhoneFeatures;
  *((_BYTE *)v14 + 120) |= 4u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_24:
    if ((has & 1) == 0)
      goto LABEL_26;
    goto LABEL_25;
  }
LABEL_35:
  *((_DWORD *)v14 + 27) = self->_supportedWatchFeatures;
  *((_BYTE *)v14 + 120) |= 8u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_25:
    *((_QWORD *)v14 + 1) = self->_cloudType;
    *((_BYTE *)v14 + 120) |= 1u;
  }
LABEL_26:
  if (self->_secureCloudUpgradeToken)
  {
    objc_msgSend(v14, "setSecureCloudUpgradeToken:");
    v13 = v14;
  }
  if (self->_sentInvitation)
  {
    objc_msgSend(v14, "setSentInvitation:");
    v13 = v14;
  }
  if (self->_receivedInvitation)
  {
    objc_msgSend(v14, "setReceivedInvitation:");
    v13 = v14;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  char has;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_uuid, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v6;

  v8 = -[NSString copyWithZone:](self->_incomingHandshakeToken, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v8;

  v10 = -[NSString copyWithZone:](self->_outgoingHandshakeToken, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v10;

  v12 = -[NSString copyWithZone:](self->_cloudKitAddress, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v12;

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v14 = self->_addresses;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v43 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addAddresses:", v19);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    }
    while (v16);
  }

  v20 = -[NSString copyWithZone:](self->_preferredReachableAddress, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v20;

  v22 = -[NSString copyWithZone:](self->_preferredReachableService, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v22;

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v24 = self->_events;
  v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v39;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v39 != v27)
          objc_enumerationMutation(v24);
        v29 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v38);
        objc_msgSend((id)v5, "addEvents:", v29);

      }
      v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v26);
  }

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_eventCount;
    *(_BYTE *)(v5 + 120) |= 2u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_17:
      if ((has & 8) == 0)
        goto LABEL_18;
LABEL_23:
      *(_DWORD *)(v5 + 108) = self->_supportedWatchFeatures;
      *(_BYTE *)(v5 + 120) |= 8u;
      if ((*(_BYTE *)&self->_has & 1) == 0)
        goto LABEL_20;
      goto LABEL_19;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_17;
  }
  *(_DWORD *)(v5 + 104) = self->_supportedPhoneFeatures;
  *(_BYTE *)(v5 + 120) |= 4u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_23;
LABEL_18:
  if ((has & 1) != 0)
  {
LABEL_19:
    *(_QWORD *)(v5 + 8) = self->_cloudType;
    *(_BYTE *)(v5 + 120) |= 1u;
  }
LABEL_20:
  v31 = -[NSString copyWithZone:](self->_secureCloudUpgradeToken, "copyWithZone:", a3, (_QWORD)v38);
  v32 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v31;

  v33 = -[NSData copyWithZone:](self->_sentInvitation, "copyWithZone:", a3);
  v34 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v33;

  v35 = -[NSData copyWithZone:](self->_receivedInvitation, "copyWithZone:", a3);
  v36 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v35;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *uuid;
  NSString *incomingHandshakeToken;
  NSString *outgoingHandshakeToken;
  NSString *cloudKitAddress;
  NSMutableArray *addresses;
  NSString *preferredReachableAddress;
  NSString *preferredReachableService;
  NSMutableArray *events;
  NSString *secureCloudUpgradeToken;
  NSData *sentInvitation;
  NSData *receivedInvitation;
  char v16;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_44;
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((_QWORD *)v4 + 14))
  {
    if (!-[NSData isEqual:](uuid, "isEqual:"))
      goto LABEL_44;
  }
  incomingHandshakeToken = self->_incomingHandshakeToken;
  if ((unint64_t)incomingHandshakeToken | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](incomingHandshakeToken, "isEqual:"))
      goto LABEL_44;
  }
  outgoingHandshakeToken = self->_outgoingHandshakeToken;
  if ((unint64_t)outgoingHandshakeToken | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](outgoingHandshakeToken, "isEqual:"))
      goto LABEL_44;
  }
  cloudKitAddress = self->_cloudKitAddress;
  if ((unint64_t)cloudKitAddress | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](cloudKitAddress, "isEqual:"))
      goto LABEL_44;
  }
  addresses = self->_addresses;
  if ((unint64_t)addresses | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](addresses, "isEqual:"))
      goto LABEL_44;
  }
  preferredReachableAddress = self->_preferredReachableAddress;
  if ((unint64_t)preferredReachableAddress | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](preferredReachableAddress, "isEqual:"))
      goto LABEL_44;
  }
  preferredReachableService = self->_preferredReachableService;
  if ((unint64_t)preferredReachableService | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](preferredReachableService, "isEqual:"))
      goto LABEL_44;
  }
  events = self->_events;
  if ((unint64_t)events | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](events, "isEqual:"))
      goto LABEL_44;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 120) & 2) == 0 || self->_eventCount != *((_QWORD *)v4 + 2))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)v4 + 120) & 2) != 0)
  {
LABEL_44:
    v16 = 0;
    goto LABEL_45;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 120) & 4) == 0 || self->_supportedPhoneFeatures != *((_DWORD *)v4 + 26))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)v4 + 120) & 4) != 0)
  {
    goto LABEL_44;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 120) & 8) == 0 || self->_supportedWatchFeatures != *((_DWORD *)v4 + 27))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)v4 + 120) & 8) != 0)
  {
    goto LABEL_44;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 120) & 1) == 0 || self->_cloudType != *((_QWORD *)v4 + 1))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)v4 + 120) & 1) != 0)
  {
    goto LABEL_44;
  }
  secureCloudUpgradeToken = self->_secureCloudUpgradeToken;
  if ((unint64_t)secureCloudUpgradeToken | *((_QWORD *)v4 + 11)
    && !-[NSString isEqual:](secureCloudUpgradeToken, "isEqual:"))
  {
    goto LABEL_44;
  }
  sentInvitation = self->_sentInvitation;
  if ((unint64_t)sentInvitation | *((_QWORD *)v4 + 12))
  {
    if (!-[NSData isEqual:](sentInvitation, "isEqual:"))
      goto LABEL_44;
  }
  receivedInvitation = self->_receivedInvitation;
  if ((unint64_t)receivedInvitation | *((_QWORD *)v4 + 10))
    v16 = -[NSData isEqual:](receivedInvitation, "isEqual:");
  else
    v16 = 1;
LABEL_45:

  return v16;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSUInteger v15;
  NSUInteger v16;
  uint64_t v17;

  v3 = -[NSData hash](self->_uuid, "hash");
  v4 = -[NSString hash](self->_incomingHandshakeToken, "hash");
  v5 = -[NSString hash](self->_outgoingHandshakeToken, "hash");
  v6 = -[NSString hash](self->_cloudKitAddress, "hash");
  v7 = -[NSMutableArray hash](self->_addresses, "hash");
  v8 = -[NSString hash](self->_preferredReachableAddress, "hash");
  v9 = -[NSString hash](self->_preferredReachableService, "hash");
  v10 = -[NSMutableArray hash](self->_events, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v11 = 2654435761 * self->_eventCount;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      v12 = 2654435761 * self->_supportedPhoneFeatures;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_4;
LABEL_8:
      v13 = 0;
      if ((*(_BYTE *)&self->_has & 1) != 0)
        goto LABEL_5;
LABEL_9:
      v14 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    v11 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
  }
  v12 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_8;
LABEL_4:
  v13 = 2654435761 * self->_supportedWatchFeatures;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_9;
LABEL_5:
  v14 = 2654435761 * self->_cloudType;
LABEL_10:
  v15 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
  v16 = v14 ^ -[NSString hash](self->_secureCloudUpgradeToken, "hash");
  v17 = v16 ^ -[NSData hash](self->_sentInvitation, "hash");
  return v15 ^ v17 ^ -[NSData hash](self->_receivedInvitation, "hash");
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
  char v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (*((_QWORD *)v4 + 14))
    -[ASCodableCloudKitRelationship setUuid:](self, "setUuid:");
  if (*((_QWORD *)v4 + 6))
    -[ASCodableCloudKitRelationship setIncomingHandshakeToken:](self, "setIncomingHandshakeToken:");
  if (*((_QWORD *)v4 + 7))
    -[ASCodableCloudKitRelationship setOutgoingHandshakeToken:](self, "setOutgoingHandshakeToken:");
  if (*((_QWORD *)v4 + 4))
    -[ASCodableCloudKitRelationship setCloudKitAddress:](self, "setCloudKitAddress:");
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = *((id *)v4 + 3);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        -[ASCodableCloudKitRelationship addAddresses:](self, "addAddresses:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v7);
  }

  if (*((_QWORD *)v4 + 8))
    -[ASCodableCloudKitRelationship setPreferredReachableAddress:](self, "setPreferredReachableAddress:");
  if (*((_QWORD *)v4 + 9))
    -[ASCodableCloudKitRelationship setPreferredReachableService:](self, "setPreferredReachableService:");
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = *((id *)v4 + 5);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        -[ASCodableCloudKitRelationship addEvents:](self, "addEvents:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * j), (_QWORD)v16);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v12);
  }

  v15 = *((_BYTE *)v4 + 120);
  if ((v15 & 2) != 0)
  {
    self->_eventCount = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v15 = *((_BYTE *)v4 + 120);
    if ((v15 & 4) == 0)
    {
LABEL_29:
      if ((v15 & 8) == 0)
        goto LABEL_30;
      goto LABEL_41;
    }
  }
  else if ((*((_BYTE *)v4 + 120) & 4) == 0)
  {
    goto LABEL_29;
  }
  self->_supportedPhoneFeatures = *((_DWORD *)v4 + 26);
  *(_BYTE *)&self->_has |= 4u;
  v15 = *((_BYTE *)v4 + 120);
  if ((v15 & 8) == 0)
  {
LABEL_30:
    if ((v15 & 1) == 0)
      goto LABEL_32;
    goto LABEL_31;
  }
LABEL_41:
  self->_supportedWatchFeatures = *((_DWORD *)v4 + 27);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)v4 + 120) & 1) != 0)
  {
LABEL_31:
    self->_cloudType = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_32:
  if (*((_QWORD *)v4 + 11))
    -[ASCodableCloudKitRelationship setSecureCloudUpgradeToken:](self, "setSecureCloudUpgradeToken:");
  if (*((_QWORD *)v4 + 12))
    -[ASCodableCloudKitRelationship setSentInvitation:](self, "setSentInvitation:");
  if (*((_QWORD *)v4 + 10))
    -[ASCodableCloudKitRelationship setReceivedInvitation:](self, "setReceivedInvitation:");

}

- (NSData)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (NSString)incomingHandshakeToken
{
  return self->_incomingHandshakeToken;
}

- (void)setIncomingHandshakeToken:(id)a3
{
  objc_storeStrong((id *)&self->_incomingHandshakeToken, a3);
}

- (NSString)outgoingHandshakeToken
{
  return self->_outgoingHandshakeToken;
}

- (void)setOutgoingHandshakeToken:(id)a3
{
  objc_storeStrong((id *)&self->_outgoingHandshakeToken, a3);
}

- (NSString)cloudKitAddress
{
  return self->_cloudKitAddress;
}

- (void)setCloudKitAddress:(id)a3
{
  objc_storeStrong((id *)&self->_cloudKitAddress, a3);
}

- (NSMutableArray)addresses
{
  return self->_addresses;
}

- (void)setAddresses:(id)a3
{
  objc_storeStrong((id *)&self->_addresses, a3);
}

- (NSString)preferredReachableAddress
{
  return self->_preferredReachableAddress;
}

- (void)setPreferredReachableAddress:(id)a3
{
  objc_storeStrong((id *)&self->_preferredReachableAddress, a3);
}

- (NSString)preferredReachableService
{
  return self->_preferredReachableService;
}

- (void)setPreferredReachableService:(id)a3
{
  objc_storeStrong((id *)&self->_preferredReachableService, a3);
}

- (NSMutableArray)events
{
  return self->_events;
}

- (void)setEvents:(id)a3
{
  objc_storeStrong((id *)&self->_events, a3);
}

- (int64_t)eventCount
{
  return self->_eventCount;
}

- (unsigned)supportedPhoneFeatures
{
  return self->_supportedPhoneFeatures;
}

- (unsigned)supportedWatchFeatures
{
  return self->_supportedWatchFeatures;
}

- (int64_t)cloudType
{
  return self->_cloudType;
}

- (NSString)secureCloudUpgradeToken
{
  return self->_secureCloudUpgradeToken;
}

- (void)setSecureCloudUpgradeToken:(id)a3
{
  objc_storeStrong((id *)&self->_secureCloudUpgradeToken, a3);
}

- (NSData)sentInvitation
{
  return self->_sentInvitation;
}

- (void)setSentInvitation:(id)a3
{
  objc_storeStrong((id *)&self->_sentInvitation, a3);
}

- (NSData)receivedInvitation
{
  return self->_receivedInvitation;
}

- (void)setReceivedInvitation:(id)a3
{
  objc_storeStrong((id *)&self->_receivedInvitation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_sentInvitation, 0);
  objc_storeStrong((id *)&self->_secureCloudUpgradeToken, 0);
  objc_storeStrong((id *)&self->_receivedInvitation, 0);
  objc_storeStrong((id *)&self->_preferredReachableService, 0);
  objc_storeStrong((id *)&self->_preferredReachableAddress, 0);
  objc_storeStrong((id *)&self->_outgoingHandshakeToken, 0);
  objc_storeStrong((id *)&self->_incomingHandshakeToken, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_cloudKitAddress, 0);
  objc_storeStrong((id *)&self->_addresses, 0);
}

@end
