@implementation NWPBPath

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)NWPBPath;
  -[NWPBPath description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWPBPath dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  NWPBEndpoint *endpoint;
  void *v5;
  NWPBParameters *parameters;
  void *v7;
  NSString *clientUUID;
  uint64_t status;
  __CFString *v10;
  NWPBInterface *directInterface;
  void *v12;
  NWPBInterface *delegateInterface;
  void *v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  char has;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  endpoint = self->_endpoint;
  if (endpoint)
  {
    -[NWPBEndpoint dictionaryRepresentation](endpoint, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("endpoint"));

  }
  parameters = self->_parameters;
  if (parameters)
  {
    -[NWPBParameters dictionaryRepresentation](parameters, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("parameters"));

  }
  clientUUID = self->_clientUUID;
  if (clientUUID)
    objc_msgSend(v3, "setObject:forKey:", clientUUID, CFSTR("clientUUID"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    status = self->_status;
    if (status >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_status);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E14A9378[status];
    }
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("status"));

  }
  directInterface = self->_directInterface;
  if (directInterface)
  {
    -[NWPBInterface dictionaryRepresentation](directInterface, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("directInterface"));

  }
  delegateInterface = self->_delegateInterface;
  if (delegateInterface)
  {
    -[NWPBInterface dictionaryRepresentation](delegateInterface, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("delegateInterface"));

  }
  if (-[NSMutableArray count](self->_agents, "count"))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_agents, "count"));
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v16 = self->_agents;
    v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v29 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "dictionaryRepresentation");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v21);

        }
        v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v18);
    }

    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("agents"));
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_ipv4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("ipv4"));

    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_27:
      if ((has & 0x10) == 0)
        goto LABEL_28;
LABEL_33:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_local);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("local"));

      if ((*(_BYTE *)&self->_has & 2) == 0)
        return v3;
      goto LABEL_29;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_27;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_ipv6);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("ipv6"));

  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_33;
LABEL_28:
  if ((has & 2) != 0)
  {
LABEL_29:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_direct);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("direct"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NWPBPathReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char has;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_endpoint)
    PBDataWriterWriteSubmessage();
  if (self->_parameters)
    PBDataWriterWriteSubmessage();
  if (self->_clientUUID)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_directInterface)
    PBDataWriterWriteSubmessage();
  if (self->_delegateInterface)
    PBDataWriterWriteSubmessage();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_agents;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_22:
      if ((has & 0x10) == 0)
        goto LABEL_23;
LABEL_28:
      PBDataWriterWriteBOOLField();
      if ((*(_BYTE *)&self->_has & 2) == 0)
        goto LABEL_25;
      goto LABEL_24;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_22;
  }
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_28;
LABEL_23:
  if ((has & 2) != 0)
LABEL_24:
    PBDataWriterWriteBOOLField();
LABEL_25:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  id v21;
  void *v22;
  id v23;
  void *v24;
  char has;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NWPBEndpoint copyWithZone:](self->_endpoint, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  v8 = -[NWPBParameters copyWithZone:](self->_parameters, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v8;

  v10 = -[NSString copyWithZone:](self->_clientUUID, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_status;
    *(_BYTE *)(v5 + 64) |= 1u;
  }
  v12 = -[NWPBInterface copyWithZone:](self->_directInterface, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v12;

  v14 = -[NWPBInterface copyWithZone:](self->_delegateInterface, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v14;

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v16 = self->_agents;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v28 != v19)
          objc_enumerationMutation(v16);
        v21 = (id)objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "copyWithZone:", a3);
        v22 = *(void **)(v5 + 8);
        if (!v22)
        {
          v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v24 = *(void **)(v5 + 8);
          *(_QWORD *)(v5 + 8) = v23;

          v22 = *(void **)(v5 + 8);
        }
        objc_msgSend(v22, "addObject:", v21);

      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v18);
  }

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_BYTE *)(v5 + 61) = self->_ipv4;
    *(_BYTE *)(v5 + 64) |= 4u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_14:
      if ((has & 0x10) == 0)
        goto LABEL_15;
LABEL_20:
      *(_BYTE *)(v5 + 63) = self->_local;
      *(_BYTE *)(v5 + 64) |= 0x10u;
      if ((*(_BYTE *)&self->_has & 2) == 0)
        return (id)v5;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_14;
  }
  *(_BYTE *)(v5 + 62) = self->_ipv6;
  *(_BYTE *)(v5 + 64) |= 8u;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_20;
LABEL_15:
  if ((has & 2) != 0)
  {
LABEL_16:
    *(_BYTE *)(v5 + 60) = self->_direct;
    *(_BYTE *)(v5 + 64) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NWPBEndpoint *endpoint;
  NWPBParameters *parameters;
  NSString *clientUUID;
  NWPBInterface *directInterface;
  NWPBInterface *delegateInterface;
  NSMutableArray *agents;
  BOOL v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_45;
  endpoint = self->_endpoint;
  if ((unint64_t)endpoint | *((_QWORD *)v4 + 5))
  {
    if (!-[NWPBEndpoint isEqual:](endpoint, "isEqual:"))
      goto LABEL_45;
  }
  parameters = self->_parameters;
  if ((unint64_t)parameters | *((_QWORD *)v4 + 6))
  {
    if (!-[NWPBParameters isEqual:](parameters, "isEqual:"))
      goto LABEL_45;
  }
  clientUUID = self->_clientUUID;
  if ((unint64_t)clientUUID | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](clientUUID, "isEqual:"))
      goto LABEL_45;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_status != *((_DWORD *)v4 + 14))
      goto LABEL_45;
  }
  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
    goto LABEL_45;
  }
  directInterface = self->_directInterface;
  if ((unint64_t)directInterface | *((_QWORD *)v4 + 4)
    && !-[NWPBInterface isEqual:](directInterface, "isEqual:"))
  {
    goto LABEL_45;
  }
  delegateInterface = self->_delegateInterface;
  if ((unint64_t)delegateInterface | *((_QWORD *)v4 + 3))
  {
    if (!-[NWPBInterface isEqual:](delegateInterface, "isEqual:"))
      goto LABEL_45;
  }
  agents = self->_agents;
  if ((unint64_t)agents | *((_QWORD *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](agents, "isEqual:"))
      goto LABEL_45;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 4) == 0)
      goto LABEL_45;
    if (self->_ipv4)
    {
      if (!*((_BYTE *)v4 + 61))
        goto LABEL_45;
    }
    else if (*((_BYTE *)v4 + 61))
    {
      goto LABEL_45;
    }
  }
  else if ((*((_BYTE *)v4 + 64) & 4) != 0)
  {
    goto LABEL_45;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 8) == 0)
      goto LABEL_45;
    if (self->_ipv6)
    {
      if (!*((_BYTE *)v4 + 62))
        goto LABEL_45;
    }
    else if (*((_BYTE *)v4 + 62))
    {
      goto LABEL_45;
    }
  }
  else if ((*((_BYTE *)v4 + 64) & 8) != 0)
  {
    goto LABEL_45;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 0x10) == 0)
      goto LABEL_45;
    if (self->_local)
    {
      if (!*((_BYTE *)v4 + 63))
        goto LABEL_45;
    }
    else if (*((_BYTE *)v4 + 63))
    {
      goto LABEL_45;
    }
  }
  else if ((*((_BYTE *)v4 + 64) & 0x10) != 0)
  {
    goto LABEL_45;
  }
  v11 = (*((_BYTE *)v4 + 64) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 2) != 0)
    {
      if (self->_direct)
      {
        if (!*((_BYTE *)v4 + 60))
          goto LABEL_45;
      }
      else if (*((_BYTE *)v4 + 60))
      {
        goto LABEL_45;
      }
      v11 = 1;
      goto LABEL_46;
    }
LABEL_45:
    v11 = 0;
  }
LABEL_46:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = -[NWPBEndpoint hash](self->_endpoint, "hash");
  v4 = -[NWPBParameters hash](self->_parameters, "hash");
  v5 = -[NSString hash](self->_clientUUID, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761 * self->_status;
  else
    v6 = 0;
  v7 = -[NWPBInterface hash](self->_directInterface, "hash");
  v8 = -[NWPBInterface hash](self->_delegateInterface, "hash");
  v9 = -[NSMutableArray hash](self->_agents, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v10 = 2654435761 * self->_ipv4;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_6:
      v11 = 2654435761 * self->_ipv6;
      if ((*(_BYTE *)&self->_has & 0x10) != 0)
        goto LABEL_7;
LABEL_11:
      v12 = 0;
      if ((*(_BYTE *)&self->_has & 2) != 0)
        goto LABEL_8;
LABEL_12:
      v13 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
    }
  }
  else
  {
    v10 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_6;
  }
  v11 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_11;
LABEL_7:
  v12 = 2654435761 * self->_local;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_12;
LABEL_8:
  v13 = 2654435761 * self->_direct;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_directInterface, 0);
  objc_storeStrong((id *)&self->_delegateInterface, 0);
  objc_storeStrong((id *)&self->_clientUUID, 0);
  objc_storeStrong((id *)&self->_agents, 0);
}

@end
