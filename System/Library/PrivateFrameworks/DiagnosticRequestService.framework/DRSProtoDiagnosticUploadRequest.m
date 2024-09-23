@implementation DRSProtoDiagnosticUploadRequest

- (BOOL)hasRequestDescription
{
  return self->_requestDescription != 0;
}

- (BOOL)hasIssueDescription
{
  return self->_issueDescription != 0;
}

- (void)clearLogs
{
  -[NSMutableArray removeAllObjects](self->_logs, "removeAllObjects");
}

- (void)addLogs:(id)a3
{
  id v4;
  NSMutableArray *logs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  logs = self->_logs;
  v8 = v4;
  if (!logs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_logs;
    self->_logs = v6;

    v4 = v8;
    logs = self->_logs;
  }
  -[NSMutableArray addObject:](logs, "addObject:", v4);

}

- (unint64_t)logsCount
{
  return -[NSMutableArray count](self->_logs, "count");
}

- (id)logsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_logs, "objectAtIndex:", a3);
}

+ (Class)logsType
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
  v8.super_class = (Class)DRSProtoDiagnosticUploadRequest;
  -[DRSProtoDiagnosticUploadRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSProtoDiagnosticUploadRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  DRSProtoRequestDescription *requestDescription;
  void *v5;
  NSString *issueDescription;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  requestDescription = self->_requestDescription;
  if (requestDescription)
  {
    -[DRSProtoRequestDescription dictionaryRepresentation](requestDescription, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("request_description"));

  }
  issueDescription = self->_issueDescription;
  if (issueDescription)
    objc_msgSend(v3, "setObject:forKey:", issueDescription, CFSTR("issue_description"));
  if (-[NSMutableArray count](self->_logs, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_logs, "count"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = self->_logs;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v15);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("logs"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return DRSProtoDiagnosticUploadRequestReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_requestDescription)
    PBDataWriterWriteSubmessage();
  if (self->_issueDescription)
    PBDataWriterWriteStringField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_logs;
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

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id v8;

  v8 = a3;
  if (self->_requestDescription)
    objc_msgSend(v8, "setRequestDescription:");
  if (self->_issueDescription)
    objc_msgSend(v8, "setIssueDescription:");
  if (-[DRSProtoDiagnosticUploadRequest logsCount](self, "logsCount"))
  {
    objc_msgSend(v8, "clearLogs");
    v4 = -[DRSProtoDiagnosticUploadRequest logsCount](self, "logsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[DRSProtoDiagnosticUploadRequest logsAtIndex:](self, "logsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addLogs:", v7);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[DRSProtoRequestDescription copyWithZone:](self->_requestDescription, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[NSString copyWithZone:](self->_issueDescription, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = self->_logs;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14), "copyWithZone:", a3, (_QWORD)v17);
        objc_msgSend(v5, "addLogs:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  DRSProtoRequestDescription *requestDescription;
  NSString *issueDescription;
  NSMutableArray *logs;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((requestDescription = self->_requestDescription, !((unint64_t)requestDescription | v4[3]))
     || -[DRSProtoRequestDescription isEqual:](requestDescription, "isEqual:"))
    && ((issueDescription = self->_issueDescription, !((unint64_t)issueDescription | v4[1]))
     || -[NSString isEqual:](issueDescription, "isEqual:")))
  {
    logs = self->_logs;
    if ((unint64_t)logs | v4[2])
      v8 = -[NSMutableArray isEqual:](logs, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;

  v3 = -[DRSProtoRequestDescription hash](self->_requestDescription, "hash");
  v4 = -[NSString hash](self->_issueDescription, "hash") ^ v3;
  return v4 ^ -[NSMutableArray hash](self->_logs, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  DRSProtoRequestDescription *requestDescription;
  uint64_t v6;
  id v7;
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
  requestDescription = self->_requestDescription;
  v6 = *((_QWORD *)v4 + 3);
  if (requestDescription)
  {
    if (v6)
      -[DRSProtoRequestDescription mergeFrom:](requestDescription, "mergeFrom:");
  }
  else if (v6)
  {
    -[DRSProtoDiagnosticUploadRequest setRequestDescription:](self, "setRequestDescription:");
  }
  if (*((_QWORD *)v4 + 1))
    -[DRSProtoDiagnosticUploadRequest setIssueDescription:](self, "setIssueDescription:");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = *((id *)v4 + 2);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
        -[DRSProtoDiagnosticUploadRequest addLogs:](self, "addLogs:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (DRSProtoRequestDescription)requestDescription
{
  return self->_requestDescription;
}

- (void)setRequestDescription:(id)a3
{
  objc_storeStrong((id *)&self->_requestDescription, a3);
}

- (NSString)issueDescription
{
  return self->_issueDescription;
}

- (void)setIssueDescription:(id)a3
{
  objc_storeStrong((id *)&self->_issueDescription, a3);
}

- (NSMutableArray)logs
{
  return self->_logs;
}

- (void)setLogs:(id)a3
{
  objc_storeStrong((id *)&self->_logs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestDescription, 0);
  objc_storeStrong((id *)&self->_logs, 0);
  objc_storeStrong((id *)&self->_issueDescription, 0);
}

@end
