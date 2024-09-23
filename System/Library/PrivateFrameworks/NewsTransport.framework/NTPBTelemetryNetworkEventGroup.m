@implementation NTPBTelemetryNetworkEventGroup

- (int)eventType
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_eventType;
  else
    return 0;
}

- (void)setEventType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_eventType = a3;
}

- (void)setHasEventType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEventType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setWifiReachabilityStatus:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_wifiReachabilityStatus = a3;
}

- (void)setHasWifiReachabilityStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasWifiReachabilityStatus
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (int)cellularRadioAccessTechnology
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_cellularRadioAccessTechnology;
  else
    return 0;
}

- (void)setCellularRadioAccessTechnology:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_cellularRadioAccessTechnology = a3;
}

- (void)setHasCellularRadioAccessTechnology:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCellularRadioAccessTechnology
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)cellularRadioAccessTechnologyAsString:(int)a3
{
  if (a3 < 0xE)
    return off_24CD4E818[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsCellularRadioAccessTechnology:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_CELLULAR_RADIO_ACCESS_TECHNOLOGY")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GPRS_CELLULAR_RADIO_ACCESS_TECHNOLOGY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EDGE_CELLULAR_RADIO_ACCESS_TECHNOLOGY")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WCDMA_CELLULAR_RADIO_ACCESS_TECHNOLOGY")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HSDPA_CELLULAR_RADIO_ACCESS_TECHNOLOGY")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HSUPA_CELLULAR_RADIO_ACCESS_TECHNOLOGY")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CDMA1x_CELLULAR_RADIO_ACCESS_TECHNOLOGY")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CDMAEVDORev0_CELLULAR_RADIO_ACCESS_TECHNOLOGY")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CDMAEVDORevA_CELLULAR_RADIO_ACCESS_TECHNOLOGY")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CDMAEVDORevB_CELLULAR_RADIO_ACCESS_TECHNOLOGY")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("eHRPD_CELLULAR_RADIO_ACCESS_TECHNOLOGY")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_CELLULAR_RADIO_ACCESS_TECHNOLOGY")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NRNSA_CELLULAR_RADIO_ACCESS_TECHNOLOGY")) & 1) != 0)
  {
    v4 = 12;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("NR_CELLULAR_RADIO_ACCESS_TECHNOLOGY")))
  {
    v4 = 13;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasRespondingPop
{
  return self->_respondingPop != 0;
}

- (void)clearSuccesses
{
  -[NSMutableArray removeAllObjects](self->_successes, "removeAllObjects");
}

- (void)addSuccesses:(id)a3
{
  id v4;
  NSMutableArray *successes;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  successes = self->_successes;
  v8 = v4;
  if (!successes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_successes;
    self->_successes = v6;

    v4 = v8;
    successes = self->_successes;
  }
  -[NSMutableArray addObject:](successes, "addObject:", v4);

}

- (unint64_t)successesCount
{
  return -[NSMutableArray count](self->_successes, "count");
}

- (id)successesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_successes, "objectAtIndex:", a3);
}

+ (Class)successesType
{
  return (Class)objc_opt_class();
}

- (void)clearFailures
{
  -[NSMutableArray removeAllObjects](self->_failures, "removeAllObjects");
}

- (void)addFailures:(id)a3
{
  id v4;
  NSMutableArray *failures;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  failures = self->_failures;
  v8 = v4;
  if (!failures)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_failures;
    self->_failures = v6;

    v4 = v8;
    failures = self->_failures;
  }
  -[NSMutableArray addObject:](failures, "addObject:", v4);

}

- (unint64_t)failuresCount
{
  return -[NSMutableArray count](self->_failures, "count");
}

- (id)failuresAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_failures, "objectAtIndex:", a3);
}

+ (Class)failuresType
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
  v8.super_class = (Class)NTPBTelemetryNetworkEventGroup;
  -[NTPBTelemetryNetworkEventGroup description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBTelemetryNetworkEventGroup dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  uint64_t cellularRadioAccessTechnology;
  __CFString *v8;
  NSString *respondingPop;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_eventType);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("event_type"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_11;
      goto LABEL_7;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_wifiReachabilityStatus);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("wifi_reachability_status"));

  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_11;
LABEL_7:
  cellularRadioAccessTechnology = self->_cellularRadioAccessTechnology;
  if (cellularRadioAccessTechnology >= 0xE)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_cellularRadioAccessTechnology);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = off_24CD4E818[cellularRadioAccessTechnology];
  }
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("cellular_radio_access_technology"));

LABEL_11:
  respondingPop = self->_respondingPop;
  if (respondingPop)
    objc_msgSend(v3, "setObject:forKey:", respondingPop, CFSTR("responding_pop"));
  if (-[NSMutableArray count](self->_successes, "count"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_successes, "count"));
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v11 = self->_successes;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v30 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "dictionaryRepresentation");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v16);

        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v13);
    }

    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("successes"));
  }
  if (-[NSMutableArray count](self->_failures, "count"))
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_failures, "count"));
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v18 = self->_failures;
    v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v26;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v26 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * j), "dictionaryRepresentation");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v23);

        }
        v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      }
      while (v20);
    }

    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("failures"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBTelemetryNetworkEventGroupReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
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
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
LABEL_4:
    PBDataWriterWriteInt32Field();
LABEL_5:
  if (self->_respondingPop)
    PBDataWriterWriteStringField();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = self->_successes;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v8);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = self->_failures;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteSubmessage();
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v13);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  char has;
  uint64_t v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 12) = self->_eventType;
    *(_BYTE *)(v5 + 44) |= 2u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(_BYTE *)(v5 + 40) = self->_wifiReachabilityStatus;
  *(_BYTE *)(v5 + 44) |= 4u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 8) = self->_cellularRadioAccessTechnology;
    *(_BYTE *)(v5 + 44) |= 1u;
  }
LABEL_5:
  v8 = -[NSString copyWithZone:](self->_respondingPop, "copyWithZone:", a3);
  v9 = (void *)v6[3];
  v6[3] = v8;

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v10 = self->_successes;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v28 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend(v6, "addSuccesses:", v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v12);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v16 = self->_failures;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(v16);
        v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v23);
        objc_msgSend(v6, "addFailures:", v21);

      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v18);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *respondingPop;
  NSMutableArray *successes;
  NSMutableArray *failures;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_26;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) == 0 || self->_eventType != *((_DWORD *)v4 + 3))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 44) & 2) != 0)
  {
    goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 4) != 0)
    {
      if (self->_wifiReachabilityStatus)
      {
        if (!*((_BYTE *)v4 + 40))
          goto LABEL_26;
        goto LABEL_15;
      }
      if (!*((_BYTE *)v4 + 40))
        goto LABEL_15;
    }
LABEL_26:
    v8 = 0;
    goto LABEL_27;
  }
  if ((*((_BYTE *)v4 + 44) & 4) != 0)
    goto LABEL_26;
LABEL_15:
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_cellularRadioAccessTechnology != *((_DWORD *)v4 + 2))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    goto LABEL_26;
  }
  respondingPop = self->_respondingPop;
  if ((unint64_t)respondingPop | *((_QWORD *)v4 + 3)
    && !-[NSString isEqual:](respondingPop, "isEqual:"))
  {
    goto LABEL_26;
  }
  successes = self->_successes;
  if ((unint64_t)successes | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](successes, "isEqual:"))
      goto LABEL_26;
  }
  failures = self->_failures;
  if ((unint64_t)failures | *((_QWORD *)v4 + 2))
    v8 = -[NSMutableArray isEqual:](failures, "isEqual:");
  else
    v8 = 1;
LABEL_27:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  uint64_t v7;

  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
LABEL_6:
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_4;
LABEL_7:
    v5 = 0;
    goto LABEL_8;
  }
  v3 = 2654435761 * self->_eventType;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_6;
LABEL_3:
  v4 = 2654435761 * self->_wifiReachabilityStatus;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_7;
LABEL_4:
  v5 = 2654435761 * self->_cellularRadioAccessTechnology;
LABEL_8:
  v6 = v4 ^ v3 ^ v5 ^ -[NSString hash](self->_respondingPop, "hash");
  v7 = -[NSMutableArray hash](self->_successes, "hash");
  return v6 ^ v7 ^ -[NSMutableArray hash](self->_failures, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id *v5;
  char v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
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
  v5 = (id *)v4;
  v6 = *((_BYTE *)v4 + 44);
  if ((v6 & 2) != 0)
  {
    self->_eventType = *((_DWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 2u;
    v6 = *((_BYTE *)v4 + 44);
    if ((v6 & 4) == 0)
    {
LABEL_3:
      if ((v6 & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)v4 + 44) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_wifiReachabilityStatus = *((_BYTE *)v4 + 40);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
LABEL_4:
    self->_cellularRadioAccessTechnology = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_5:
  if (*((_QWORD *)v4 + 3))
    -[NTPBTelemetryNetworkEventGroup setRespondingPop:](self, "setRespondingPop:");
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = v5[4];
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        -[NTPBTelemetryNetworkEventGroup addSuccesses:](self, "addSuccesses:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v9);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = v5[2];
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        -[NTPBTelemetryNetworkEventGroup addFailures:](self, "addFailures:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * j), (_QWORD)v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v14);
  }

}

- (BOOL)wifiReachabilityStatus
{
  return self->_wifiReachabilityStatus;
}

- (NSString)respondingPop
{
  return self->_respondingPop;
}

- (void)setRespondingPop:(id)a3
{
  objc_storeStrong((id *)&self->_respondingPop, a3);
}

- (NSMutableArray)successes
{
  return self->_successes;
}

- (void)setSuccesses:(id)a3
{
  objc_storeStrong((id *)&self->_successes, a3);
}

- (NSMutableArray)failures
{
  return self->_failures;
}

- (void)setFailures:(id)a3
{
  objc_storeStrong((id *)&self->_failures, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_successes, 0);
  objc_storeStrong((id *)&self->_respondingPop, 0);
  objc_storeStrong((id *)&self->_failures, 0);
}

@end
