@implementation CATActiveIDSServiceConnectionContentSendData

- (CATActiveIDSServiceConnectionContentSendData)initWithSequenceNumber:(id)a3 dataNumber:(unint64_t)a4 dataSegment:(id)a5 segmentRange:(_NSRange)a6 segmentNumber:(unint64_t)a7 totalSegments:(unint64_t)a8
{
  NSUInteger length;
  NSUInteger location;
  id v15;
  id v16;
  CATActiveIDSServiceConnectionContentSendData *v17;
  CATActiveIDSServiceConnectionContentSendData *v18;
  uint64_t v19;
  NSData *mUnderlyingDataSegment;
  objc_super v22;

  length = a6.length;
  location = a6.location;
  v15 = a3;
  v16 = a5;
  v22.receiver = self;
  v22.super_class = (Class)CATActiveIDSServiceConnectionContentSendData;
  v17 = -[CATActiveIDSServiceConnectionContentSendData init](&v22, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_sequenceNumber, a3);
    v18->_dataNumber = a4;
    v19 = objc_msgSend(v16, "copy");
    mUnderlyingDataSegment = v18->mUnderlyingDataSegment;
    v18->mUnderlyingDataSegment = (NSData *)v19;

    v18->_segmentNumber = a7;
    v18->_totalSegments = a8;
    v18->mSegmentRange.location = location;
    v18->mSegmentRange.length = length;
  }

  return v18;
}

- (NSData)dataSegment
{
  return -[NSData subdataWithRange:](self->mUnderlyingDataSegment, "subdataWithRange:", self->mSegmentRange.location, self->mSegmentRange.length);
}

- (int64_t)contentType
{
  return 1;
}

- (NSDictionary)dictionaryValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[CATActiveIDSServiceConnectionContentSendData dataNumber](self, "dataNumber"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("DataNumber"));

  -[CATActiveIDSServiceConnectionContentSendData dataSegment](self, "dataSegment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("DataSegment"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[CATActiveIDSServiceConnectionContentSendData segmentNumber](self, "segmentNumber"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("SegmentNumber"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[CATActiveIDSServiceConnectionContentSendData totalSegments](self, "totalSegments"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("TotalSegments"));

  -[CATActiveIDSServiceConnectionContentSendData sequenceNumber](self, "sequenceNumber");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("SequenceNumber"));

  v10 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v10;
}

+ (id)instanceWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DataNumber"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DataSegment"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SegmentNumber"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TotalSegments"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = v14;
  else
    v15 = 0;
  v16 = v15;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SequenceNumber"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v18 = v17;
  else
    v18 = 0;
  v19 = v18;

  v20 = 0;
  if (v7 && v10 && v13 && v16)
    v20 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSequenceNumber:dataNumber:dataSegment:segmentRange:segmentNumber:totalSegments:", v19, objc_msgSend(v7, "unsignedIntegerValue"), v10, 0, objc_msgSend(v10, "length"), objc_msgSend(v13, "unsignedIntegerValue"), objc_msgSend(v16, "unsignedIntegerValue"));

  return v20;
}

- (NSNumber)sequenceNumber
{
  return self->_sequenceNumber;
}

- (unint64_t)dataNumber
{
  return self->_dataNumber;
}

- (unint64_t)segmentNumber
{
  return self->_segmentNumber;
}

- (unint64_t)totalSegments
{
  return self->_totalSegments;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sequenceNumber, 0);
  objc_storeStrong((id *)&self->mUnderlyingDataSegment, 0);
}

@end
