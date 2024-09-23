@implementation NWPBUpdateBrowse

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)NWPBUpdateBrowse;
  -[NWPBUpdateBrowse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWPBUpdateBrowse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *clientUUID;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  clientUUID = self->_clientUUID;
  if (clientUUID)
    objc_msgSend(v3, "setObject:forKey:", clientUUID, CFSTR("clientUUID"));
  if (-[NSMutableArray count](self->_discoveredEndpoints, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_discoveredEndpoints, "count"));
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = self->_discoveredEndpoints;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v14);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("discoveredEndpoints"));
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  int *v4;
  uint64_t v5;
  unint64_t v6;
  int *v7;
  unint64_t v8;
  int *v9;
  int *v11;
  NSString *v12;
  NWPBEndpoint *clientUUID;
  _BYTE *v14;
  char v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  int v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  int v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  int v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  int v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  int v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  int v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  int v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  int v52;
  int v53;
  BOOL v54;
  NSMutableArray *discoveredEndpoints;
  NSMutableArray *v56;
  NSMutableArray *v57;
  uint64_t v59;
  uint64_t v60;

  v4 = (int *)MEMORY[0x1E0D82BF0];
  v5 = (int)*MEMORY[0x1E0D82BF0];
  v6 = *(_QWORD *)((char *)a3 + v5);
  v7 = (int *)MEMORY[0x1E0D82BD8];
  v8 = *(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BD8]);
  v9 = (int *)MEMORY[0x1E0D82BC8];
  if (v6 < v8)
  {
    v11 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      v14 = (char *)a3 + *v9;
      if (*v14)
        return *((_BYTE *)a3 + *v9) == 0;
      if (v6 >= v8)
        break;
      v15 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v11) + v6);
      *(_QWORD *)((char *)a3 + (int)v5) = v6 + 1;
      v16 = v15 & 0x7F;
      if ((v15 & 0x80) == 0)
        goto LABEL_40;
      v17 = *v4;
      v18 = *(_QWORD *)((char *)a3 + v17);
      if (v18 == -1 || v18 >= *(_QWORD *)((char *)a3 + *v7))
        goto LABEL_38;
      v19 = v18 + 1;
      v20 = *(char *)(*(_QWORD *)((char *)a3 + *v11) + v18);
      *(_QWORD *)((char *)a3 + v17) = v19;
      v16 |= (unint64_t)(v20 & 0x7F) << 7;
      if ((v20 & 0x80000000) == 0)
        goto LABEL_40;
      v21 = *v4;
      v22 = *(_QWORD *)((char *)a3 + v21);
      if (v22 == -1 || v22 >= *(_QWORD *)((char *)a3 + *v7))
        goto LABEL_38;
      v23 = v22 + 1;
      v24 = *(char *)(*(_QWORD *)((char *)a3 + *v11) + v22);
      *(_QWORD *)((char *)a3 + v21) = v23;
      v16 |= (unint64_t)(v24 & 0x7F) << 14;
      if ((v24 & 0x80000000) == 0)
        goto LABEL_40;
      v25 = *v4;
      v26 = *(_QWORD *)((char *)a3 + v25);
      if (v26 == -1 || v26 >= *(_QWORD *)((char *)a3 + *v7))
        goto LABEL_38;
      v27 = v26 + 1;
      v28 = *(char *)(*(_QWORD *)((char *)a3 + *v11) + v26);
      *(_QWORD *)((char *)a3 + v25) = v27;
      v16 |= (unint64_t)(v28 & 0x7F) << 21;
      if ((v28 & 0x80000000) == 0)
        goto LABEL_40;
      v29 = *v4;
      v30 = *(_QWORD *)((char *)a3 + v29);
      if (v30 == -1 || v30 >= *(_QWORD *)((char *)a3 + *v7))
        goto LABEL_38;
      v31 = v30 + 1;
      v32 = *(char *)(*(_QWORD *)((char *)a3 + *v11) + v30);
      *(_QWORD *)((char *)a3 + v29) = v31;
      v16 |= (unint64_t)(v32 & 0x7F) << 28;
      if ((v32 & 0x80000000) == 0)
        goto LABEL_40;
      v33 = *v4;
      v34 = *(_QWORD *)((char *)a3 + v33);
      if (v34 == -1 || v34 >= *(_QWORD *)((char *)a3 + *v7))
        goto LABEL_38;
      v35 = v34 + 1;
      v36 = *(char *)(*(_QWORD *)((char *)a3 + *v11) + v34);
      *(_QWORD *)((char *)a3 + v33) = v35;
      if ((v36 & 0x80000000) == 0)
        goto LABEL_40;
      v37 = *v4;
      v38 = *(_QWORD *)((char *)a3 + v37);
      if (v38 == -1 || v38 >= *(_QWORD *)((char *)a3 + *v7))
        goto LABEL_38;
      v39 = v38 + 1;
      v40 = *(char *)(*(_QWORD *)((char *)a3 + *v11) + v38);
      *(_QWORD *)((char *)a3 + v37) = v39;
      if ((v40 & 0x80000000) == 0)
        goto LABEL_40;
      v41 = *v4;
      v42 = *(_QWORD *)((char *)a3 + v41);
      if (v42 == -1 || v42 >= *(_QWORD *)((char *)a3 + *v7))
        goto LABEL_38;
      v43 = v42 + 1;
      v44 = *(char *)(*(_QWORD *)((char *)a3 + *v11) + v42);
      *(_QWORD *)((char *)a3 + v41) = v43;
      if ((v44 & 0x80000000) == 0)
        goto LABEL_40;
      v45 = *v4;
      v46 = *(_QWORD *)((char *)a3 + v45);
      if (v46 == -1 || v46 >= *(_QWORD *)((char *)a3 + *v7))
        goto LABEL_38;
      v47 = v46 + 1;
      v48 = *(char *)(*(_QWORD *)((char *)a3 + *v11) + v46);
      *(_QWORD *)((char *)a3 + v45) = v47;
      if ((v48 & 0x80000000) == 0)
        goto LABEL_40;
      v49 = *v4;
      v50 = *(_QWORD *)((char *)a3 + v49);
      if (v50 == -1 || v50 >= *(_QWORD *)((char *)a3 + *v7))
      {
LABEL_38:
        v14 = (char *)a3 + *v9;
        goto LABEL_39;
      }
      v51 = v50 + 1;
      v52 = *(char *)(*(_QWORD *)((char *)a3 + *v11) + v50);
      *(_QWORD *)((char *)a3 + v49) = v51;
      if (v52 < 0)
      {
        v16 = 0;
        v53 = *((unsigned __int8 *)a3 + *v9);
        goto LABEL_42;
      }
LABEL_40:
      v53 = *((unsigned __int8 *)a3 + *v9);
      if (*((_BYTE *)a3 + *v9))
        v16 = 0;
LABEL_42:
      if (v53)
        v54 = 1;
      else
        v54 = (v16 & 7) == 4;
      if (v54)
        return *((_BYTE *)a3 + *v9) == 0;
      if ((v16 >> 3) == 2)
      {
        clientUUID = objc_alloc_init(NWPBEndpoint);
        if (self)
        {
          discoveredEndpoints = self->_discoveredEndpoints;
          if (!discoveredEndpoints)
          {
            v56 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v57 = self->_discoveredEndpoints;
            self->_discoveredEndpoints = v56;

            discoveredEndpoints = self->_discoveredEndpoints;
          }
          -[NSMutableArray addObject:](discoveredEndpoints, "addObject:", clientUUID, v59, v60);
        }

        v59 = 0;
        v60 = 0;
        if (!PBReaderPlaceMark() || !NWPBEndpointReadFrom((uint64_t)clientUUID, (uint64_t)a3))
        {

          return 0;
        }
        PBReaderRecallMark();
        goto LABEL_4;
      }
      if ((v16 >> 3) == 1)
      {
        PBReaderReadString();
        v12 = (NSString *)objc_claimAutoreleasedReturnValue();
        clientUUID = (NWPBEndpoint *)self->_clientUUID;
        self->_clientUUID = v12;
LABEL_4:

        goto LABEL_5;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_5:
      v5 = *v4;
      v6 = *(_QWORD *)((char *)a3 + v5);
      v8 = *(_QWORD *)((char *)a3 + *v7);
      if (v6 >= v8)
        return *((_BYTE *)a3 + *v9) == 0;
    }
    v16 = 0;
LABEL_39:
    *v14 = 1;
    goto LABEL_40;
  }
  return *((_BYTE *)a3 + *v9) == 0;
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
  if (self->_clientUUID)
    PBDataWriterWriteStringField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_discoveredEndpoints;
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

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
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
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_clientUUID, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = self->_discoveredEndpoints;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = (id)objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v12), "copyWithZone:", a3, (_QWORD)v18);
        v14 = (void *)v5[2];
        if (!v14)
        {
          v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v16 = (void *)v5[2];
          v5[2] = v15;

          v14 = (void *)v5[2];
        }
        objc_msgSend(v14, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *clientUUID;
  NSMutableArray *discoveredEndpoints;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((clientUUID = self->_clientUUID, !((unint64_t)clientUUID | v4[1]))
     || -[NSString isEqual:](clientUUID, "isEqual:")))
  {
    discoveredEndpoints = self->_discoveredEndpoints;
    if ((unint64_t)discoveredEndpoints | v4[2])
      v7 = -[NSMutableArray isEqual:](discoveredEndpoints, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_clientUUID, "hash");
  return -[NSMutableArray hash](self->_discoveredEndpoints, "hash") ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoveredEndpoints, 0);
  objc_storeStrong((id *)&self->_clientUUID, 0);
}

@end
