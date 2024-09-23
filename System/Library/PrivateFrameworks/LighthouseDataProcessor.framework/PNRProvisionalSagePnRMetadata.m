@implementation PNRProvisionalSagePnRMetadata

- (BOOL)hasSessionId
{
  return self->_SessionId != 0;
}

- (void)deleteSessionId
{
  -[PNRProvisionalSagePnRMetadata setSessionId:](self, "setSessionId:", 0);
}

- (BOOL)hasClientId
{
  return self->_clientId != 0;
}

- (void)deleteClientId
{
  -[PNRProvisionalSagePnRMetadata setClientId:](self, "setClientId:", 0);
}

- (BOOL)hasClientRequestId
{
  return self->_clientRequestId != 0;
}

- (void)deleteClientRequestId
{
  -[PNRProvisionalSagePnRMetadata setClientRequestId:](self, "setClientRequestId:", 0);
}

- (BOOL)hasClientSessionId
{
  return self->_clientSessionId != 0;
}

- (void)deleteClientSessionId
{
  -[PNRProvisionalSagePnRMetadata setClientSessionId:](self, "setClientSessionId:", 0);
}

- (void)clearPlanId
{
  -[NSArray removeAllObjects](self->_planIds, "removeAllObjects");
}

- (void)addPlanId:(id)a3
{
  id v4;
  NSArray *planIds;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  planIds = self->_planIds;
  v8 = v4;
  if (!planIds)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_planIds;
    self->_planIds = v6;

    v4 = v8;
    planIds = self->_planIds;
  }
  -[NSArray addObject:](planIds, "addObject:", v4);

}

- (unint64_t)planIdCount
{
  return -[NSArray count](self->_planIds, "count");
}

- (id)planIdAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_planIds, "objectAtIndexedSubscript:", a3);
}

- (void)clearActionId
{
  -[NSArray removeAllObjects](self->_actionIds, "removeAllObjects");
}

- (void)addActionId:(id)a3
{
  id v4;
  NSArray *actionIds;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  actionIds = self->_actionIds;
  v8 = v4;
  if (!actionIds)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_actionIds;
    self->_actionIds = v6;

    v4 = v8;
    actionIds = self->_actionIds;
  }
  -[NSArray addObject:](actionIds, "addObject:", v4);

}

- (unint64_t)actionIdCount
{
  return -[NSArray count](self->_actionIds, "count");
}

- (id)actionIdAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_actionIds, "objectAtIndexedSubscript:", a3);
}

- (BOOL)hasRequestStatus
{
  return self->_requestStatus != 0;
}

- (void)deleteRequestStatus
{
  -[PNRProvisionalSagePnRMetadata setRequestStatus:](self, "setRequestStatus:", 0);
}

- (BOOL)hasRawSessionId
{
  return self->_rawSessionId != 0;
}

- (void)deleteRawSessionId
{
  -[PNRProvisionalSagePnRMetadata setRawSessionId:](self, "setRawSessionId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return PNRProvisionalSagePnRMetadataReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PNRProvisionalSagePnRMetadata SessionId](self, "SessionId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[PNRProvisionalSagePnRMetadata clientId](self, "clientId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  -[PNRProvisionalSagePnRMetadata clientRequestId](self, "clientRequestId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    PBDataWriterWriteStringField();
  -[PNRProvisionalSagePnRMetadata clientSessionId](self, "clientSessionId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    PBDataWriterWriteStringField();
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = self->_planIds;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v26;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v9);
        PBDataWriterWriteStringField();
        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v11);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v14 = self->_actionIds;
  v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v14);
        PBDataWriterWriteStringField();
        ++v18;
      }
      while (v16 != v18);
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v16);
  }

  -[PNRProvisionalSagePnRMetadata requestStatus](self, "requestStatus", v21);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    PBDataWriterWriteStringField();
  -[PNRProvisionalSagePnRMetadata rawSessionId](self, "rawSessionId");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
    PBDataWriterWriteStringField();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  char v46;
  BOOL v47;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_42;
  -[PNRProvisionalSagePnRMetadata SessionId](self, "SessionId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "SessionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_41;
  -[PNRProvisionalSagePnRMetadata SessionId](self, "SessionId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PNRProvisionalSagePnRMetadata SessionId](self, "SessionId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "SessionId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_42;
  }
  else
  {

  }
  -[PNRProvisionalSagePnRMetadata clientId](self, "clientId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_41;
  -[PNRProvisionalSagePnRMetadata clientId](self, "clientId");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[PNRProvisionalSagePnRMetadata clientId](self, "clientId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clientId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_42;
  }
  else
  {

  }
  -[PNRProvisionalSagePnRMetadata clientRequestId](self, "clientRequestId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientRequestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_41;
  -[PNRProvisionalSagePnRMetadata clientRequestId](self, "clientRequestId");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[PNRProvisionalSagePnRMetadata clientRequestId](self, "clientRequestId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clientRequestId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_42;
  }
  else
  {

  }
  -[PNRProvisionalSagePnRMetadata clientSessionId](self, "clientSessionId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientSessionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_41;
  -[PNRProvisionalSagePnRMetadata clientSessionId](self, "clientSessionId");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[PNRProvisionalSagePnRMetadata clientSessionId](self, "clientSessionId");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clientSessionId");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_42;
  }
  else
  {

  }
  -[PNRProvisionalSagePnRMetadata planIds](self, "planIds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "planIds");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_41;
  -[PNRProvisionalSagePnRMetadata planIds](self, "planIds");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[PNRProvisionalSagePnRMetadata planIds](self, "planIds");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "planIds");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_42;
  }
  else
  {

  }
  -[PNRProvisionalSagePnRMetadata actionIds](self, "actionIds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionIds");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_41;
  -[PNRProvisionalSagePnRMetadata actionIds](self, "actionIds");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[PNRProvisionalSagePnRMetadata actionIds](self, "actionIds");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actionIds");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if (!v36)
      goto LABEL_42;
  }
  else
  {

  }
  -[PNRProvisionalSagePnRMetadata requestStatus](self, "requestStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_41;
  -[PNRProvisionalSagePnRMetadata requestStatus](self, "requestStatus");
  v37 = objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    v38 = (void *)v37;
    -[PNRProvisionalSagePnRMetadata requestStatus](self, "requestStatus");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requestStatus");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v39, "isEqual:", v40);

    if (!v41)
      goto LABEL_42;
  }
  else
  {

  }
  -[PNRProvisionalSagePnRMetadata rawSessionId](self, "rawSessionId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rawSessionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[PNRProvisionalSagePnRMetadata rawSessionId](self, "rawSessionId");
    v42 = objc_claimAutoreleasedReturnValue();
    if (!v42)
    {

LABEL_45:
      v47 = 1;
      goto LABEL_43;
    }
    v43 = (void *)v42;
    -[PNRProvisionalSagePnRMetadata rawSessionId](self, "rawSessionId");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rawSessionId");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v44, "isEqual:", v45);

    if ((v46 & 1) != 0)
      goto LABEL_45;
  }
  else
  {
LABEL_41:

  }
LABEL_42:
  v47 = 0;
LABEL_43:

  return v47;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9;

  v3 = -[NSString hash](self->_SessionId, "hash");
  v4 = -[NSString hash](self->_clientId, "hash") ^ v3;
  v5 = -[NSString hash](self->_clientRequestId, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_clientSessionId, "hash");
  v7 = -[NSArray hash](self->_planIds, "hash");
  v8 = v7 ^ -[NSArray hash](self->_actionIds, "hash");
  v9 = v6 ^ v8 ^ -[NSString hash](self->_requestStatus, "hash");
  return v9 ^ -[NSString hash](self->_rawSessionId, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_SessionId)
  {
    -[PNRProvisionalSagePnRMetadata SessionId](self, "SessionId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("SessionId"));

  }
  if (self->_actionIds)
  {
    -[PNRProvisionalSagePnRMetadata actionIds](self, "actionIds");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("actionId"));

  }
  if (self->_clientId)
  {
    -[PNRProvisionalSagePnRMetadata clientId](self, "clientId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("clientId"));

  }
  if (self->_clientRequestId)
  {
    -[PNRProvisionalSagePnRMetadata clientRequestId](self, "clientRequestId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("clientRequestId"));

  }
  if (self->_clientSessionId)
  {
    -[PNRProvisionalSagePnRMetadata clientSessionId](self, "clientSessionId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("clientSessionId"));

  }
  if (self->_planIds)
  {
    -[PNRProvisionalSagePnRMetadata planIds](self, "planIds");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("planId"));

  }
  if (self->_rawSessionId)
  {
    -[PNRProvisionalSagePnRMetadata rawSessionId](self, "rawSessionId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("rawSessionId"));

  }
  if (self->_requestStatus)
  {
    -[PNRProvisionalSagePnRMetadata requestStatus](self, "requestStatus");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("requestStatus"));

  }
  -[PNRProvisionalSagePnRMetadata willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PNRProvisionalSagePnRMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (PNRProvisionalSagePnRMetadata)initWithJSON:(id)a3
{
  void *v4;
  PNRProvisionalSagePnRMetadata *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[PNRProvisionalSagePnRMetadata initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PNRProvisionalSagePnRMetadata)initWithDictionary:(id)a3
{
  id v4;
  PNRProvisionalSagePnRMetadata *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  PNRProvisionalSagePnRMetadata *v34;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  objc_super v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)PNRProvisionalSagePnRMetadata;
  v5 = -[PNRProvisionalSagePnRMetadata init](&v49, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SessionId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[PNRProvisionalSagePnRMetadata setSessionId:](v5, "setSessionId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("clientId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[PNRProvisionalSagePnRMetadata setClientId:](v5, "setClientId:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("clientRequestId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[PNRProvisionalSagePnRMetadata setClientRequestId:](v5, "setClientRequestId:", v11);

    }
    v39 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("clientSessionId"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = (void *)objc_msgSend(v12, "copy");
      -[PNRProvisionalSagePnRMetadata setClientSessionId:](v5, "setClientSessionId:", v13);

    }
    v37 = v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("planId"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v40 = v14;
    v38 = v10;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v36 = v6;
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v15 = v14;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v46;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v46 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v21 = (void *)objc_msgSend(v20, "copy");
              -[PNRProvisionalSagePnRMetadata addPlanId:](v5, "addPlanId:", v21);

            }
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
        }
        while (v17);
      }

      v6 = v36;
      v10 = v38;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actionId"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v23 = v22;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v42;
        do
        {
          for (j = 0; j != v25; ++j)
          {
            if (*(_QWORD *)v42 != v26)
              objc_enumerationMutation(v23);
            v28 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v29 = (void *)objc_msgSend(v28, "copy");
              -[PNRProvisionalSagePnRMetadata addActionId:](v5, "addActionId:", v29);

            }
          }
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
        }
        while (v25);
      }

      v10 = v38;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestStatus"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = (void *)objc_msgSend(v30, "copy");
      -[PNRProvisionalSagePnRMetadata setRequestStatus:](v5, "setRequestStatus:", v31);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rawSessionId"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v33 = (void *)objc_msgSend(v32, "copy");
      -[PNRProvisionalSagePnRMetadata setRawSessionId:](v5, "setRawSessionId:", v33);

    }
    v34 = v5;

  }
  return v5;
}

- (NSString)SessionId
{
  return self->_SessionId;
}

- (void)setSessionId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)clientId
{
  return self->_clientId;
}

- (void)setClientId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)clientRequestId
{
  return self->_clientRequestId;
}

- (void)setClientRequestId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)clientSessionId
{
  return self->_clientSessionId;
}

- (void)setClientSessionId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)planIds
{
  return self->_planIds;
}

- (void)setPlanIds:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)actionIds
{
  return self->_actionIds;
}

- (void)setActionIds:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)requestStatus
{
  return self->_requestStatus;
}

- (void)setRequestStatus:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)rawSessionId
{
  return self->_rawSessionId;
}

- (void)setRawSessionId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setHasSessionId:(BOOL)a3
{
  self->_hasSessionId = a3;
}

- (void)setHasClientId:(BOOL)a3
{
  self->_hasClientId = a3;
}

- (void)setHasClientRequestId:(BOOL)a3
{
  self->_hasClientRequestId = a3;
}

- (void)setHasClientSessionId:(BOOL)a3
{
  self->_hasClientSessionId = a3;
}

- (void)setHasRequestStatus:(BOOL)a3
{
  self->_hasRequestStatus = a3;
}

- (void)setHasRawSessionId:(BOOL)a3
{
  self->_hasRawSessionId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawSessionId, 0);
  objc_storeStrong((id *)&self->_requestStatus, 0);
  objc_storeStrong((id *)&self->_actionIds, 0);
  objc_storeStrong((id *)&self->_planIds, 0);
  objc_storeStrong((id *)&self->_clientSessionId, 0);
  objc_storeStrong((id *)&self->_clientRequestId, 0);
  objc_storeStrong((id *)&self->_clientId, 0);
  objc_storeStrong((id *)&self->_SessionId, 0);
}

@end
