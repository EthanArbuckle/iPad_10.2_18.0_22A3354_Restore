@implementation EDPETBatchedWrapper

- (BOOL)hasQuotaEvent
{
  return self->_quotaEvent != 0;
}

- (BOOL)hasSubmittedEvent
{
  return self->_submittedEvent != 0;
}

- (BOOL)hasRawData
{
  return self->_rawData != 0;
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
  v8.super_class = (Class)EDPETBatchedWrapper;
  -[EDPETBatchedWrapper description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDPETBatchedWrapper dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  EDPETQuotaReachedEvent *quotaEvent;
  void *v5;
  EDPETSubmittedEvent *submittedEvent;
  void *v7;
  NSData *rawData;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  quotaEvent = self->_quotaEvent;
  if (quotaEvent)
  {
    -[EDPETQuotaReachedEvent dictionaryRepresentation](quotaEvent, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("quota_event"));

  }
  submittedEvent = self->_submittedEvent;
  if (submittedEvent)
  {
    -[EDPETSubmittedEvent dictionaryRepresentation](submittedEvent, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("submitted_event"));

  }
  rawData = self->_rawData;
  if (rawData)
    objc_msgSend(v3, "setObject:forKey:", rawData, CFSTR("raw_data"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return EDPETBatchedWrapperReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_quotaEvent)
    PBDataWriterWriteSubmessage();
  if (self->_submittedEvent)
    PBDataWriterWriteSubmessage();
  if (self->_rawData)
    PBDataWriterWriteDataField();

}

- (void)copyTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_quotaEvent)
    objc_msgSend(v4, "setQuotaEvent:");
  if (self->_submittedEvent)
    objc_msgSend(v4, "setSubmittedEvent:");
  if (self->_rawData)
    objc_msgSend(v4, "setRawData:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[EDPETQuotaReachedEvent copyWithZone:](self->_quotaEvent, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[EDPETSubmittedEvent copyWithZone:](self->_submittedEvent, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[NSData copyWithZone:](self->_rawData, "copyWithZone:", a3);
  v11 = (void *)v5[2];
  v5[2] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  EDPETQuotaReachedEvent *quotaEvent;
  EDPETSubmittedEvent *submittedEvent;
  NSData *rawData;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((quotaEvent = self->_quotaEvent, !((unint64_t)quotaEvent | v4[1]))
     || -[EDPETQuotaReachedEvent isEqual:](quotaEvent, "isEqual:"))
    && ((submittedEvent = self->_submittedEvent, !((unint64_t)submittedEvent | v4[3]))
     || -[EDPETSubmittedEvent isEqual:](submittedEvent, "isEqual:")))
  {
    rawData = self->_rawData;
    if ((unint64_t)rawData | v4[2])
      v8 = -[NSData isEqual:](rawData, "isEqual:");
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
  unint64_t v4;

  v3 = -[EDPETQuotaReachedEvent hash](self->_quotaEvent, "hash");
  v4 = -[EDPETSubmittedEvent hash](self->_submittedEvent, "hash") ^ v3;
  return v4 ^ -[NSData hash](self->_rawData, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  EDPETQuotaReachedEvent *quotaEvent;
  uint64_t v6;
  EDPETSubmittedEvent *submittedEvent;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  quotaEvent = self->_quotaEvent;
  v9 = v4;
  v6 = v4[1];
  if (quotaEvent)
  {
    if (v6)
      -[EDPETQuotaReachedEvent mergeFrom:](quotaEvent, "mergeFrom:");
  }
  else if (v6)
  {
    -[EDPETBatchedWrapper setQuotaEvent:](self, "setQuotaEvent:");
  }
  submittedEvent = self->_submittedEvent;
  v8 = v9[3];
  if (submittedEvent)
  {
    if (v8)
      -[EDPETSubmittedEvent mergeFrom:](submittedEvent, "mergeFrom:");
  }
  else if (v8)
  {
    -[EDPETBatchedWrapper setSubmittedEvent:](self, "setSubmittedEvent:");
  }
  if (v9[2])
    -[EDPETBatchedWrapper setRawData:](self, "setRawData:");

}

- (EDPETQuotaReachedEvent)quotaEvent
{
  return self->_quotaEvent;
}

- (void)setQuotaEvent:(id)a3
{
  objc_storeStrong((id *)&self->_quotaEvent, a3);
}

- (EDPETSubmittedEvent)submittedEvent
{
  return self->_submittedEvent;
}

- (void)setSubmittedEvent:(id)a3
{
  objc_storeStrong((id *)&self->_submittedEvent, a3);
}

- (NSData)rawData
{
  return self->_rawData;
}

- (void)setRawData:(id)a3
{
  objc_storeStrong((id *)&self->_rawData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_submittedEvent, 0);
  objc_storeStrong((id *)&self->_rawData, 0);
  objc_storeStrong((id *)&self->_quotaEvent, 0);
}

@end
