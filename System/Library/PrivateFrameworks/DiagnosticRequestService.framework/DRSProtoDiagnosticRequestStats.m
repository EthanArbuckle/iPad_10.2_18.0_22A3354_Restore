@implementation DRSProtoDiagnosticRequestStats

- (BOOL)hasBuild
{
  return self->_build != 0;
}

- (BOOL)hasTeamId
{
  return self->_teamId != 0;
}

- (BOOL)hasIssueCategory
{
  return self->_issueCategory != 0;
}

- (BOOL)hasIssueDescription
{
  return self->_issueDescription != 0;
}

- (void)clearOutcomes
{
  -[NSMutableArray removeAllObjects](self->_outcomes, "removeAllObjects");
}

- (void)addOutcomes:(id)a3
{
  id v4;
  NSMutableArray *outcomes;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  outcomes = self->_outcomes;
  v8 = v4;
  if (!outcomes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_outcomes;
    self->_outcomes = v6;

    v4 = v8;
    outcomes = self->_outcomes;
  }
  -[NSMutableArray addObject:](outcomes, "addObject:", v4);

}

- (unint64_t)outcomesCount
{
  return -[NSMutableArray count](self->_outcomes, "count");
}

- (id)outcomesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_outcomes, "objectAtIndex:", a3);
}

+ (Class)outcomesType
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
  v8.super_class = (Class)DRSProtoDiagnosticRequestStats;
  -[DRSProtoDiagnosticRequestStats description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSProtoDiagnosticRequestStats dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *build;
  NSString *teamId;
  NSString *issueCategory;
  NSString *issueDescription;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
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
  v4 = v3;
  build = self->_build;
  if (build)
    objc_msgSend(v3, "setObject:forKey:", build, CFSTR("build"));
  teamId = self->_teamId;
  if (teamId)
    objc_msgSend(v4, "setObject:forKey:", teamId, CFSTR("team_id"));
  issueCategory = self->_issueCategory;
  if (issueCategory)
    objc_msgSend(v4, "setObject:forKey:", issueCategory, CFSTR("issue_category"));
  issueDescription = self->_issueDescription;
  if (issueDescription)
    objc_msgSend(v4, "setObject:forKey:", issueDescription, CFSTR("issue_description"));
  if (-[NSMutableArray count](self->_outcomes, "count"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_outcomes, "count"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v10 = self->_outcomes;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v17);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v15);

        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v12);
    }

    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("outcomes"));
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return DRSProtoDiagnosticRequestStatsReadFrom((char *)self, (uint64_t)a3);
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
  if (self->_build)
    PBDataWriterWriteStringField();
  if (self->_teamId)
    PBDataWriterWriteStringField();
  if (self->_issueCategory)
    PBDataWriterWriteStringField();
  if (self->_issueDescription)
    PBDataWriterWriteStringField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_outcomes;
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
  if (self->_build)
    objc_msgSend(v8, "setBuild:");
  if (self->_teamId)
    objc_msgSend(v8, "setTeamId:");
  if (self->_issueCategory)
    objc_msgSend(v8, "setIssueCategory:");
  if (self->_issueDescription)
    objc_msgSend(v8, "setIssueDescription:");
  if (-[DRSProtoDiagnosticRequestStats outcomesCount](self, "outcomesCount"))
  {
    objc_msgSend(v8, "clearOutcomes");
    v4 = -[DRSProtoDiagnosticRequestStats outcomesCount](self, "outcomesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[DRSProtoDiagnosticRequestStats outcomesAtIndex:](self, "outcomesAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addOutcomes:", v7);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
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
  uint64_t v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_build, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_teamId, "copyWithZone:", a3);
  v9 = (void *)v5[5];
  v5[5] = v8;

  v10 = -[NSString copyWithZone:](self->_issueCategory, "copyWithZone:", a3);
  v11 = (void *)v5[2];
  v5[2] = v10;

  v12 = -[NSString copyWithZone:](self->_issueDescription, "copyWithZone:", a3);
  v13 = (void *)v5[3];
  v5[3] = v12;

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v14 = self->_outcomes;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
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
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v18), "copyWithZone:", a3, (_QWORD)v21);
        objc_msgSend(v5, "addOutcomes:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v16);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *build;
  NSString *teamId;
  NSString *issueCategory;
  NSString *issueDescription;
  NSMutableArray *outcomes;
  char v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((build = self->_build, !((unint64_t)build | v4[1]))
     || -[NSString isEqual:](build, "isEqual:"))
    && ((teamId = self->_teamId, !((unint64_t)teamId | v4[5]))
     || -[NSString isEqual:](teamId, "isEqual:"))
    && ((issueCategory = self->_issueCategory, !((unint64_t)issueCategory | v4[2]))
     || -[NSString isEqual:](issueCategory, "isEqual:"))
    && ((issueDescription = self->_issueDescription, !((unint64_t)issueDescription | v4[3]))
     || -[NSString isEqual:](issueDescription, "isEqual:")))
  {
    outcomes = self->_outcomes;
    if ((unint64_t)outcomes | v4[4])
      v10 = -[NSMutableArray isEqual:](outcomes, "isEqual:");
    else
      v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;

  v3 = -[NSString hash](self->_build, "hash");
  v4 = -[NSString hash](self->_teamId, "hash") ^ v3;
  v5 = -[NSString hash](self->_issueCategory, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_issueDescription, "hash");
  return v6 ^ -[NSMutableArray hash](self->_outcomes, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 1))
    -[DRSProtoDiagnosticRequestStats setBuild:](self, "setBuild:");
  if (*((_QWORD *)v4 + 5))
    -[DRSProtoDiagnosticRequestStats setTeamId:](self, "setTeamId:");
  if (*((_QWORD *)v4 + 2))
    -[DRSProtoDiagnosticRequestStats setIssueCategory:](self, "setIssueCategory:");
  if (*((_QWORD *)v4 + 3))
    -[DRSProtoDiagnosticRequestStats setIssueDescription:](self, "setIssueDescription:");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = *((id *)v4 + 4);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[DRSProtoDiagnosticRequestStats addOutcomes:](self, "addOutcomes:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (NSString)build
{
  return self->_build;
}

- (void)setBuild:(id)a3
{
  objc_storeStrong((id *)&self->_build, a3);
}

- (NSString)teamId
{
  return self->_teamId;
}

- (void)setTeamId:(id)a3
{
  objc_storeStrong((id *)&self->_teamId, a3);
}

- (NSString)issueCategory
{
  return self->_issueCategory;
}

- (void)setIssueCategory:(id)a3
{
  objc_storeStrong((id *)&self->_issueCategory, a3);
}

- (NSString)issueDescription
{
  return self->_issueDescription;
}

- (void)setIssueDescription:(id)a3
{
  objc_storeStrong((id *)&self->_issueDescription, a3);
}

- (NSMutableArray)outcomes
{
  return self->_outcomes;
}

- (void)setOutcomes:(id)a3
{
  objc_storeStrong((id *)&self->_outcomes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_teamId, 0);
  objc_storeStrong((id *)&self->_outcomes, 0);
  objc_storeStrong((id *)&self->_issueDescription, 0);
  objc_storeStrong((id *)&self->_issueCategory, 0);
  objc_storeStrong((id *)&self->_build, 0);
}

@end
