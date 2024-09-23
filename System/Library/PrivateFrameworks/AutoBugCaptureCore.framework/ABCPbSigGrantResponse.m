@implementation ABCPbSigGrantResponse

- (int)globalDecision
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_globalDecision;
  else
    return 0;
}

- (void)setGlobalDecision:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_globalDecision = a3;
}

- (void)setHasGlobalDecision:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasGlobalDecision
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)globalDecisionAsString:(int)a3
{
  if (a3 < 3)
    return off_1EA3B6DB8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsGlobalDecision:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ALL_FALSE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ALL_TRUE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("FOLLOW_SIG_RESPONSE")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasStatus
{
  return self->_status != 0;
}

- (void)clearSigResponses
{
  -[NSMutableArray removeAllObjects](self->_sigResponses, "removeAllObjects");
}

- (void)addSigResponse:(id)a3
{
  id v4;
  NSMutableArray *sigResponses;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  sigResponses = self->_sigResponses;
  v8 = v4;
  if (!sigResponses)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_sigResponses;
    self->_sigResponses = v6;

    v4 = v8;
    sigResponses = self->_sigResponses;
  }
  -[NSMutableArray addObject:](sigResponses, "addObject:", v4);

}

- (unint64_t)sigResponsesCount
{
  return -[NSMutableArray count](self->_sigResponses, "count");
}

- (id)sigResponseAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_sigResponses, "objectAtIndex:", a3);
}

+ (Class)sigResponseType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasSigConfigWhitelist
{
  return self->_sigConfigWhitelist != 0;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)ABCPbSigGrantResponse;
  -[ABCPbSigGrantResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ABCPbSigGrantResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t globalDecision;
  __CFString *v5;
  NSString *status;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  ABCPbSigConfigWhitelist *sigConfigWhitelist;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    globalDecision = self->_globalDecision;
    if (globalDecision >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_globalDecision);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1EA3B6DB8[globalDecision];
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("global_decision"));

  }
  status = self->_status;
  if (status)
    objc_msgSend(v3, "setObject:forKey:", status, CFSTR("status"));
  if (-[NSMutableArray count](self->_sigResponses, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_sigResponses, "count"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = self->_sigResponses;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "dictionaryRepresentation");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v10);
    }

    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("sig_response"));
  }
  sigConfigWhitelist = self->_sigConfigWhitelist;
  if (sigConfigWhitelist)
  {
    -[ABCPbSigConfigWhitelist dictionaryRepresentation](sigConfigWhitelist, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("sig_config_whitelist"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ABCPbSigGrantResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_status)
    PBDataWriterWriteStringField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_sigResponses;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (self->_sigConfigWhitelist)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  id v9;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[2] = self->_globalDecision;
    *((_BYTE *)v4 + 40) |= 1u;
  }
  v9 = v4;
  if (self->_status)
    objc_msgSend(v4, "setStatus:");
  if (-[ABCPbSigGrantResponse sigResponsesCount](self, "sigResponsesCount"))
  {
    objc_msgSend(v9, "clearSigResponses");
    v5 = -[ABCPbSigGrantResponse sigResponsesCount](self, "sigResponsesCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[ABCPbSigGrantResponse sigResponseAtIndex:](self, "sigResponseAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addSigResponse:", v8);

      }
    }
  }
  if (self->_sigConfigWhitelist)
    objc_msgSend(v9, "setSigConfigWhitelist:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_globalDecision;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_status, "copyWithZone:", a3);
  v8 = (void *)v6[4];
  v6[4] = v7;

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = self->_sigResponses;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v13), "copyWithZone:", a3, (_QWORD)v18);
        objc_msgSend(v6, "addSigResponse:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  v15 = -[ABCPbSigConfigWhitelist copyWithZone:](self->_sigConfigWhitelist, "copyWithZone:", a3);
  v16 = (void *)v6[2];
  v6[2] = v15;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *status;
  NSMutableArray *sigResponses;
  ABCPbSigConfigWhitelist *sigConfigWhitelist;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_globalDecision != *((_DWORD *)v4 + 2))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  status = self->_status;
  if ((unint64_t)status | *((_QWORD *)v4 + 4) && !-[NSString isEqual:](status, "isEqual:"))
    goto LABEL_13;
  sigResponses = self->_sigResponses;
  if ((unint64_t)sigResponses | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](sigResponses, "isEqual:"))
      goto LABEL_13;
  }
  sigConfigWhitelist = self->_sigConfigWhitelist;
  if ((unint64_t)sigConfigWhitelist | *((_QWORD *)v4 + 2))
    v8 = -[ABCPbSigConfigWhitelist isEqual:](sigConfigWhitelist, "isEqual:");
  else
    v8 = 1;
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_globalDecision;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_status, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_sigResponses, "hash");
  return v4 ^ v5 ^ -[ABCPbSigConfigWhitelist hash](self->_sigConfigWhitelist, "hash");
}

- (void)mergeFrom:(id)a3
{
  id *v4;
  id *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  ABCPbSigConfigWhitelist *sigConfigWhitelist;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  v5 = v4;
  if (((_BYTE)v4[5] & 1) != 0)
  {
    self->_globalDecision = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (v4[4])
    -[ABCPbSigGrantResponse setStatus:](self, "setStatus:");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v5[3];
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        -[ABCPbSigGrantResponse addSigResponse:](self, "addSigResponse:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  sigConfigWhitelist = self->_sigConfigWhitelist;
  v12 = v5[2];
  if (sigConfigWhitelist)
  {
    if (v12)
      -[ABCPbSigConfigWhitelist mergeFrom:](sigConfigWhitelist, "mergeFrom:");
  }
  else if (v12)
  {
    -[ABCPbSigGrantResponse setSigConfigWhitelist:](self, "setSigConfigWhitelist:");
  }

}

- (NSString)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
  objc_storeStrong((id *)&self->_status, a3);
}

- (NSMutableArray)sigResponses
{
  return self->_sigResponses;
}

- (void)setSigResponses:(id)a3
{
  objc_storeStrong((id *)&self->_sigResponses, a3);
}

- (ABCPbSigConfigWhitelist)sigConfigWhitelist
{
  return self->_sigConfigWhitelist;
}

- (void)setSigConfigWhitelist:(id)a3
{
  objc_storeStrong((id *)&self->_sigConfigWhitelist, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_sigResponses, 0);
  objc_storeStrong((id *)&self->_sigConfigWhitelist, 0);
}

@end
