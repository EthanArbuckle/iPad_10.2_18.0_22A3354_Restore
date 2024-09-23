@implementation CloudFamilyAnalysisPETCloudFamilyAnalysisEvent

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)CloudFamilyAnalysisPETCloudFamilyAnalysisEvent;
  -[CloudFamilyAnalysisPETCloudFamilyAnalysisEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CloudFamilyAnalysisPETCloudFamilyAnalysisEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *collectionId;
  NSString *sessionId;
  void *v7;
  CloudFamilyAnalysisPETContactEvents *contactEvents;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  collectionId = self->_collectionId;
  if (collectionId)
    objc_msgSend(v3, "setObject:forKey:", collectionId, CFSTR("collectionId"));
  sessionId = self->_sessionId;
  if (sessionId)
    objc_msgSend(v4, "setObject:forKey:", sessionId, CFSTR("sessionId"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_batch);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("batch"));

  contactEvents = self->_contactEvents;
  if (contactEvents)
  {
    -[CloudFamilyAnalysisPETContactEvents dictionaryRepresentation](contactEvents, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("contactEvents"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return CloudFamilyAnalysisPETCloudFamilyAnalysisEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (!self->_collectionId)
    -[CloudFamilyAnalysisPETCloudFamilyAnalysisEvent writeTo:].cold.1();
  PBDataWriterWriteStringField();
  if (!self->_sessionId)
    -[CloudFamilyAnalysisPETCloudFamilyAnalysisEvent writeTo:].cold.2();
  PBDataWriterWriteStringField();
  PBDataWriterWriteInt32Field();
  if (!self->_contactEvents)
    -[CloudFamilyAnalysisPETCloudFamilyAnalysisEvent writeTo:].cold.3();
  PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  NSString *collectionId;
  _DWORD *v5;

  collectionId = self->_collectionId;
  v5 = a3;
  objc_msgSend(v5, "setCollectionId:", collectionId);
  objc_msgSend(v5, "setSessionId:", self->_sessionId);
  v5[2] = self->_batch;
  objc_msgSend(v5, "setContactEvents:", self->_contactEvents);

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_collectionId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSString copyWithZone:](self->_sessionId, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  *(_DWORD *)(v5 + 8) = self->_batch;
  v10 = -[CloudFamilyAnalysisPETContactEvents copyWithZone:](self->_contactEvents, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v10;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *collectionId;
  NSString *sessionId;
  CloudFamilyAnalysisPETContactEvents *contactEvents;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((collectionId = self->_collectionId, !((unint64_t)collectionId | v4[2]))
     || -[NSString isEqual:](collectionId, "isEqual:"))
    && ((sessionId = self->_sessionId, !((unint64_t)sessionId | v4[4]))
     || -[NSString isEqual:](sessionId, "isEqual:"))
    && self->_batch == *((_DWORD *)v4 + 2))
  {
    contactEvents = self->_contactEvents;
    if ((unint64_t)contactEvents | v4[3])
      v8 = -[CloudFamilyAnalysisPETContactEvents isEqual:](contactEvents, "isEqual:");
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
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_collectionId, "hash");
  v4 = -[NSString hash](self->_sessionId, "hash") ^ v3;
  v5 = 2654435761 * self->_batch;
  return v4 ^ -[CloudFamilyAnalysisPETContactEvents hash](self->_contactEvents, "hash") ^ v5;
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  CloudFamilyAnalysisPETContactEvents *contactEvents;
  uint64_t v6;
  int *v7;

  v4 = (int *)a3;
  v7 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[CloudFamilyAnalysisPETCloudFamilyAnalysisEvent setCollectionId:](self, "setCollectionId:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[CloudFamilyAnalysisPETCloudFamilyAnalysisEvent setSessionId:](self, "setSessionId:");
    v4 = v7;
  }
  self->_batch = v4[2];
  contactEvents = self->_contactEvents;
  v6 = *((_QWORD *)v4 + 3);
  if (contactEvents)
  {
    if (v6)
    {
      -[CloudFamilyAnalysisPETContactEvents mergeFrom:](contactEvents, "mergeFrom:");
LABEL_10:
      v4 = v7;
    }
  }
  else if (v6)
  {
    -[CloudFamilyAnalysisPETCloudFamilyAnalysisEvent setContactEvents:](self, "setContactEvents:");
    goto LABEL_10;
  }

}

- (NSString)collectionId
{
  return self->_collectionId;
}

- (void)setCollectionId:(id)a3
{
  objc_storeStrong((id *)&self->_collectionId, a3);
}

- (NSString)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(id)a3
{
  objc_storeStrong((id *)&self->_sessionId, a3);
}

- (int)batch
{
  return self->_batch;
}

- (void)setBatch:(int)a3
{
  self->_batch = a3;
}

- (CloudFamilyAnalysisPETContactEvents)contactEvents
{
  return self->_contactEvents;
}

- (void)setContactEvents:(id)a3
{
  objc_storeStrong((id *)&self->_contactEvents, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_contactEvents, 0);
  objc_storeStrong((id *)&self->_collectionId, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[CloudFamilyAnalysisPETCloudFamilyAnalysisEvent writeTo:]", "CloudFamilyAnalysisPETCloudFamilyAnalysisEvent.m", 115, "nil != self->_collectionId");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[CloudFamilyAnalysisPETCloudFamilyAnalysisEvent writeTo:]", "CloudFamilyAnalysisPETCloudFamilyAnalysisEvent.m", 120, "nil != self->_sessionId");
}

- (void)writeTo:.cold.3()
{
  __assert_rtn("-[CloudFamilyAnalysisPETCloudFamilyAnalysisEvent writeTo:]", "CloudFamilyAnalysisPETCloudFamilyAnalysisEvent.m", 129, "self->_contactEvents != nil");
}

@end
