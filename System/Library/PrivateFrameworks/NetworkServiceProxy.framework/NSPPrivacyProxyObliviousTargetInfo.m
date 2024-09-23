@implementation NSPPrivacyProxyObliviousTargetInfo

- (void)setProxyIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_proxyIndex = a3;
}

- (void)setHasProxyIndex:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasProxyIndex
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setWeight:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_weight = a3;
}

- (void)setHasWeight:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasWeight
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)clearProcesses
{
  -[NSMutableArray removeAllObjects](self->_processes, "removeAllObjects");
}

- (void)addProcesses:(id)a3
{
  id v4;
  NSMutableArray *processes;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  processes = self->_processes;
  v8 = v4;
  if (!processes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_processes;
    self->_processes = v6;

    v4 = v8;
    processes = self->_processes;
  }
  -[NSMutableArray addObject:](processes, "addObject:", v4);

}

- (unint64_t)processesCount
{
  return -[NSMutableArray count](self->_processes, "count");
}

- (id)processesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_processes, "objectAtIndex:", a3);
}

+ (Class)processesType
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)NSPPrivacyProxyObliviousTargetInfo;
  -[NSPPrivacyProxyObliviousTargetInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPPrivacyProxyObliviousTargetInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *targetHost;
  NSString *proxyURLPath;
  char has;
  void *v8;
  void *v9;
  NSMutableArray *processes;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  targetHost = self->_targetHost;
  if (targetHost)
    objc_msgSend(v3, "setObject:forKey:", targetHost, CFSTR("targetHost"));
  proxyURLPath = self->_proxyURLPath;
  if (proxyURLPath)
    objc_msgSend(v4, "setObject:forKey:", proxyURLPath, CFSTR("proxyURLPath"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_proxyIndex);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("proxyIndex"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_weight);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("weight"));

  }
  processes = self->_processes;
  if (processes)
    objc_msgSend(v4, "setObject:forKey:", processes, CFSTR("processes"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NSPPrivacyProxyObliviousTargetInfoReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  char has;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_targetHost)
    __assert_rtn("-[NSPPrivacyProxyObliviousTargetInfo writeTo:]", "NSPPrivacyProxyObliviousTargetInfo.m", 183, "nil != self->_targetHost");
  v5 = v4;
  PBDataWriterWriteStringField();
  if (!self->_proxyURLPath)
    __assert_rtn("-[NSPPrivacyProxyObliviousTargetInfo writeTo:]", "NSPPrivacyProxyObliviousTargetInfo.m", 188, "nil != self->_proxyURLPath");
  PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteUint32Field();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = self->_processes;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteStringField();
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)copyTo:(id)a3
{
  char has;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "setTargetHost:", self->_targetHost);
  objc_msgSend(v9, "setProxyURLPath:", self->_proxyURLPath);
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)v9 + 4) = self->_proxyIndex;
    *((_BYTE *)v9 + 44) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v9 + 10) = self->_weight;
    *((_BYTE *)v9 + 44) |= 2u;
  }
  if (-[NSPPrivacyProxyObliviousTargetInfo processesCount](self, "processesCount"))
  {
    objc_msgSend(v9, "clearProcesses");
    v5 = -[NSPPrivacyProxyObliviousTargetInfo processesCount](self, "processesCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[NSPPrivacyProxyObliviousTargetInfo processesAtIndex:](self, "processesAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addProcesses:", v8);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char has;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_targetHost, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  v8 = -[NSString copyWithZone:](self->_proxyURLPath, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_proxyIndex;
    *(_BYTE *)(v5 + 44) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_weight;
    *(_BYTE *)(v5 + 44) |= 2u;
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = self->_processes;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        v16 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v18);
        objc_msgSend((id)v5, "addProcesses:", v16);

      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *targetHost;
  NSString *proxyURLPath;
  NSMutableArray *processes;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  targetHost = self->_targetHost;
  if ((unint64_t)targetHost | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](targetHost, "isEqual:"))
      goto LABEL_18;
  }
  proxyURLPath = self->_proxyURLPath;
  if ((unint64_t)proxyURLPath | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](proxyURLPath, "isEqual:"))
      goto LABEL_18;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_proxyIndex != *((_DWORD *)v4 + 4))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
LABEL_18:
    v8 = 0;
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) == 0 || self->_weight != *((_DWORD *)v4 + 10))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 44) & 2) != 0)
  {
    goto LABEL_18;
  }
  processes = self->_processes;
  if ((unint64_t)processes | *((_QWORD *)v4 + 1))
    v8 = -[NSMutableArray isEqual:](processes, "isEqual:");
  else
    v8 = 1;
LABEL_19:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[NSString hash](self->_targetHost, "hash");
  v4 = -[NSString hash](self->_proxyURLPath, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5 = 2654435761 * self->_proxyIndex;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ -[NSMutableArray hash](self->_processes, "hash");
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v6 = 2654435761 * self->_weight;
  return v4 ^ v3 ^ v5 ^ v6 ^ -[NSMutableArray hash](self->_processes, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 4))
    -[NSPPrivacyProxyObliviousTargetInfo setTargetHost:](self, "setTargetHost:");
  if (*((_QWORD *)v4 + 3))
    -[NSPPrivacyProxyObliviousTargetInfo setProxyURLPath:](self, "setProxyURLPath:");
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 1) != 0)
  {
    self->_proxyIndex = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 44);
  }
  if ((v5 & 2) != 0)
  {
    self->_weight = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 2u;
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = *((id *)v4 + 1);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[NSPPrivacyProxyObliviousTargetInfo addProcesses:](self, "addProcesses:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (NSString)targetHost
{
  return self->_targetHost;
}

- (void)setTargetHost:(id)a3
{
  objc_storeStrong((id *)&self->_targetHost, a3);
}

- (NSString)proxyURLPath
{
  return self->_proxyURLPath;
}

- (void)setProxyURLPath:(id)a3
{
  objc_storeStrong((id *)&self->_proxyURLPath, a3);
}

- (unsigned)proxyIndex
{
  return self->_proxyIndex;
}

- (unsigned)weight
{
  return self->_weight;
}

- (NSMutableArray)processes
{
  return self->_processes;
}

- (void)setProcesses:(id)a3
{
  objc_storeStrong((id *)&self->_processes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetHost, 0);
  objc_storeStrong((id *)&self->_proxyURLPath, 0);
  objc_storeStrong((id *)&self->_processes, 0);
}

@end
