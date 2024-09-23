@implementation DRSProtoRequestDescription

- (BOOL)hasTeamId
{
  return self->_teamId != 0;
}

- (BOOL)hasIssueCategory
{
  return self->_issueCategory != 0;
}

- (BOOL)hasContextDictionaryData
{
  return self->_contextDictionaryData != 0;
}

- (void)setRequestTime:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_requestTime = a3;
}

- (void)setHasRequestTime:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRequestTime
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasBuild
{
  return self->_build != 0;
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
  v8.super_class = (Class)DRSProtoRequestDescription;
  -[DRSProtoRequestDescription description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSProtoRequestDescription dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *teamId;
  NSString *issueCategory;
  NSData *contextDictionaryData;
  void *v8;
  NSString *build;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  teamId = self->_teamId;
  if (teamId)
    objc_msgSend(v3, "setObject:forKey:", teamId, CFSTR("team_id"));
  issueCategory = self->_issueCategory;
  if (issueCategory)
    objc_msgSend(v4, "setObject:forKey:", issueCategory, CFSTR("issue_category"));
  contextDictionaryData = self->_contextDictionaryData;
  if (contextDictionaryData)
    objc_msgSend(v4, "setObject:forKey:", contextDictionaryData, CFSTR("context_dictionary_data"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_requestTime);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("request_time"));

  }
  build = self->_build;
  if (build)
    objc_msgSend(v4, "setObject:forKey:", build, CFSTR("build"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return DRSProtoRequestDescriptionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_teamId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_issueCategory)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_contextDictionaryData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v5;
  }
  if (self->_build)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_teamId)
  {
    objc_msgSend(v4, "setTeamId:");
    v4 = v5;
  }
  if (self->_issueCategory)
  {
    objc_msgSend(v5, "setIssueCategory:");
    v4 = v5;
  }
  if (self->_contextDictionaryData)
  {
    objc_msgSend(v5, "setContextDictionaryData:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_requestTime;
    *((_BYTE *)v4 + 48) |= 1u;
  }
  if (self->_build)
  {
    objc_msgSend(v5, "setBuild:");
    v4 = v5;
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

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_teamId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  v8 = -[NSString copyWithZone:](self->_issueCategory, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  v10 = -[NSData copyWithZone:](self->_contextDictionaryData, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_requestTime;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
  v12 = -[NSString copyWithZone:](self->_build, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v12;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *teamId;
  NSString *issueCategory;
  NSData *contextDictionaryData;
  NSString *build;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  teamId = self->_teamId;
  if ((unint64_t)teamId | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](teamId, "isEqual:"))
      goto LABEL_15;
  }
  issueCategory = self->_issueCategory;
  if ((unint64_t)issueCategory | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](issueCategory, "isEqual:"))
      goto LABEL_15;
  }
  contextDictionaryData = self->_contextDictionaryData;
  if ((unint64_t)contextDictionaryData | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](contextDictionaryData, "isEqual:"))
      goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_requestTime != *((_QWORD *)v4 + 1))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
  build = self->_build;
  if ((unint64_t)build | *((_QWORD *)v4 + 2))
    v9 = -[NSString isEqual:](build, "isEqual:");
  else
    v9 = 1;
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  unint64_t v6;

  v3 = -[NSString hash](self->_teamId, "hash");
  v4 = -[NSString hash](self->_issueCategory, "hash");
  v5 = -[NSData hash](self->_contextDictionaryData, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761u * self->_requestTime;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ -[NSString hash](self->_build, "hash");
}

- (void)mergeFrom:(id)a3
{
  unint64_t *v4;
  unint64_t *v5;

  v4 = (unint64_t *)a3;
  v5 = v4;
  if (v4[5])
  {
    -[DRSProtoRequestDescription setTeamId:](self, "setTeamId:");
    v4 = v5;
  }
  if (v4[4])
  {
    -[DRSProtoRequestDescription setIssueCategory:](self, "setIssueCategory:");
    v4 = v5;
  }
  if (v4[3])
  {
    -[DRSProtoRequestDescription setContextDictionaryData:](self, "setContextDictionaryData:");
    v4 = v5;
  }
  if ((v4[6] & 1) != 0)
  {
    self->_requestTime = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (v4[2])
  {
    -[DRSProtoRequestDescription setBuild:](self, "setBuild:");
    v4 = v5;
  }

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

- (NSData)contextDictionaryData
{
  return self->_contextDictionaryData;
}

- (void)setContextDictionaryData:(id)a3
{
  objc_storeStrong((id *)&self->_contextDictionaryData, a3);
}

- (unint64_t)requestTime
{
  return self->_requestTime;
}

- (NSString)build
{
  return self->_build;
}

- (void)setBuild:(id)a3
{
  objc_storeStrong((id *)&self->_build, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_teamId, 0);
  objc_storeStrong((id *)&self->_issueCategory, 0);
  objc_storeStrong((id *)&self->_contextDictionaryData, 0);
  objc_storeStrong((id *)&self->_build, 0);
}

@end
