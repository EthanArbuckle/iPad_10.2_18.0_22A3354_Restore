@implementation BMTombstoneEvent

- (BMTombstoneEvent)initWithSegmentName:(id)a3 offset:(unint64_t)a4 length:(unint64_t)a5 eventTimestamp:(double)a6 reason:(unint64_t)a7 policyID:(id)a8
{
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  BMTombstoneEvent *v19;

  v14 = (void *)MEMORY[0x1E0CB3898];
  v15 = a8;
  v16 = a3;
  objc_msgSend(v14, "processInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "processName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = -[BMTombstoneEvent _initWithSegmentName:offset:length:eventTimestamp:reason:policyID:processName:](self, "_initWithSegmentName:offset:length:eventTimestamp:reason:policyID:processName:", v16, a4, a5, a7, v15, v18, a6);
  return v19;
}

- (id)_initWithSegmentName:(id)a3 offset:(unint64_t)a4 length:(unint64_t)a5 eventTimestamp:(double)a6 reason:(unint64_t)a7 policyID:(id)a8 processName:(id)a9
{
  id v16;
  id v17;
  id v18;
  BMTombstoneEvent *v19;
  uint64_t v20;
  NSString *segmentName;
  uint64_t v22;
  NSString *policyID;
  uint64_t v24;
  NSString *processName;
  objc_super v27;

  v16 = a3;
  v17 = a8;
  v18 = a9;
  v27.receiver = self;
  v27.super_class = (Class)BMTombstoneEvent;
  v19 = -[BMTombstoneEvent init](&v27, sel_init);
  if (v19)
  {
    v19->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    v20 = objc_msgSend(v16, "copy");
    segmentName = v19->_segmentName;
    v19->_segmentName = (NSString *)v20;

    v19->_offset = a4;
    v19->_length = a5;
    v19->_eventTimestamp = a6;
    v19->_deletionReason = a7;
    v22 = objc_msgSend(v17, "copy");
    policyID = v19->_policyID;
    v19->_policyID = (NSString *)v22;

    v24 = objc_msgSend(v18, "copy");
    processName = v19->_processName;
    v19->_processName = (NSString *)v24;

  }
  return v19;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: segmentName=%@, offset=%lu, timestamp=%.6f, deletionReason=%lu policyID=%@ process=%@>"), objc_opt_class(), self->_segmentName, self->_offset, *(_QWORD *)&self->_eventTimestamp, self->_deletionReason, self->_policyID, self->_processName);
}

- (unint64_t)hash
{
  NSUInteger v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSUInteger v12;
  NSUInteger v13;

  v3 = -[NSString hash](self->_segmentName, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", self->_offset);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", self->_length);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_eventTimestamp);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5 ^ v7 ^ objc_msgSend(v8, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_deletionReason);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  v12 = v11 ^ -[NSString hash](self->_policyID, "hash");
  v13 = v9 ^ v12 ^ -[NSString hash](self->_processName, "hash");

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  double *v5;
  NSString *segmentName;
  NSString *policyID;
  NSString *processName;
  char v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (double *)v4;
    segmentName = self->_segmentName;
    if ((!((unint64_t)segmentName | *((_QWORD *)v5 + 2))
       || -[NSString isEqual:](segmentName, "isEqual:"))
      && self->_offset == *((_QWORD *)v5 + 3)
      && self->_length == *((_QWORD *)v5 + 4)
      && self->_eventTimestamp == v5[7]
      && self->_deletionReason == *((_QWORD *)v5 + 5)
      && ((policyID = self->_policyID, !((unint64_t)policyID | *((_QWORD *)v5 + 6)))
       || -[NSString isEqual:](policyID, "isEqual:")))
    {
      processName = self->_processName;
      if ((unint64_t)processName | *((_QWORD *)v5 + 8))
        v9 = -[NSString isEqual:](processName, "isEqual:");
      else
        v9 = 1;
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (unsigned)latestDataVersion
{
  return 2;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;

  v6 = a3;
  if (a4 == 2)
  {
    v7 = objc_msgSend(objc_alloc((Class)a1), "initWithProtoData:", v6);
    v8 = (void *)v7;
    if (v7)
      *(_DWORD *)(v7 + 8) = 2;
  }
  else
  {
    __biome_log_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[BMTombstoneEvent eventWithData:dataVersion:].cold.1(a4, v9);

    v8 = 0;
  }

  return v8;
}

- (id)jsonDictionary
{
  NSString *segmentName;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t deletionReason;
  NSString *policyID;
  __CFString *v10;
  void *v11;
  void *v12;
  NSString *processName;
  void *v14;
  void *v15;
  void *v17;
  _QWORD v18[7];
  _QWORD v19[8];

  v19[7] = *MEMORY[0x1E0C80C00];
  v18[0] = CFSTR("segmentName");
  segmentName = self->_segmentName;
  v4 = (uint64_t)segmentName;
  if (!segmentName)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v19[0] = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", self->_offset, v4, v18[0], CFSTR("offset"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v5;
  v18[2] = CFSTR("length");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", self->_length);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  deletionReason = self->_deletionReason;
  policyID = self->_policyID;
  if (deletionReason != 2)
    deletionReason = deletionReason == 1;
  v10 = off_1E5565DF8[deletionReason];
  v19[2] = v6;
  v19[3] = v10;
  v18[3] = CFSTR("deletionReason");
  v18[4] = CFSTR("policyID");
  v11 = policyID;
  if (!policyID)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19[4] = v11;
  v18[5] = CFSTR("eventTimestamp");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_eventTimestamp);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[5] = v12;
  v18[6] = CFSTR("processName");
  processName = self->_processName;
  v14 = processName;
  if (!processName)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19[6] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!processName)

  if (!policyID)
  if (!segmentName)

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[BMTombstoneEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMTombstoneEvent)initWithProto:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  BMTombstoneEvent *v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMPBTombstoneEvent segmentName]((uint64_t)v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[BMPBTombstoneEvent offset]((uint64_t)v5);
    v8 = -[BMPBTombstoneEvent length]((uint64_t)v5);
    v9 = -[BMPBTombstoneEvent eventTimestamp]((uint64_t)v5);
    v10 = -[BMPBTombstoneEvent reason]((uint64_t)v5);
    if (v10 == 2)
      v11 = 2;
    else
      v11 = v10 == 1;
    -[BMPBTombstoneEvent policyID]((uint64_t)v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[BMPBTombstoneEvent processName]((uint64_t)v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    self = (BMTombstoneEvent *)-[BMTombstoneEvent _initWithSegmentName:offset:length:eventTimestamp:reason:policyID:processName:](self, "_initWithSegmentName:offset:length:eventTimestamp:reason:policyID:processName:", v6, v7, v8, v11, v12, v13, v9);
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BMTombstoneEvent)initWithProtoData:(id)a3
{
  id v4;
  BMPBTombstoneEvent *v5;
  BMTombstoneEvent *v6;

  v4 = a3;
  v5 = -[BMPBTombstoneEvent initWithData:]([BMPBTombstoneEvent alloc], "initWithData:", v4);

  if (v5)
  {
    self = -[BMTombstoneEvent initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)proto
{
  void *v3;
  unint64_t deletionReason;
  int v5;

  v3 = (void *)objc_opt_new();
  -[BMPBTombstoneEvent setSegmentName:]((uint64_t)v3, self->_segmentName);
  -[BMPBTombstoneEvent setOffset:]((uint64_t)v3, self->_offset);
  -[BMPBTombstoneEvent setLength:]((uint64_t)v3, self->_length);
  -[BMPBTombstoneEvent setEventTimestamp:]((uint64_t)v3, self->_eventTimestamp);
  deletionReason = self->_deletionReason;
  if (deletionReason == 2)
    v5 = 2;
  else
    v5 = deletionReason == 1;
  -[BMPBTombstoneEvent setReason:]((uint64_t)v3, v5);
  -[BMPBTombstoneEvent setPolicyID:]((uint64_t)v3, self->_policyID);
  -[BMPBTombstoneEvent setProcessName:]((uint64_t)v3, self->_processName);
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BMTombstoneEvent encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("data"));
  objc_msgSend(v4, "encodeInt64:forKey:", objc_msgSend((id)objc_opt_class(), "latestDataVersion"), CFSTR("dver"));

}

- (BMTombstoneEvent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  BMTombstoneEvent *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5 || (v6 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("dver")), HIDWORD(v6)))
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "eventWithData:dataVersion:", v5, v6);
    v7 = (BMTombstoneEvent *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (NSString)segmentName
{
  return self->_segmentName;
}

- (unint64_t)offset
{
  return self->_offset;
}

- (unint64_t)length
{
  return self->_length;
}

- (unint64_t)deletionReason
{
  return self->_deletionReason;
}

- (NSString)policyID
{
  return self->_policyID;
}

- (double)eventTimestamp
{
  return self->_eventTimestamp;
}

- (NSString)processName
{
  return self->_processName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_policyID, 0);
  objc_storeStrong((id *)&self->_segmentName, 0);
}

+ (void)eventWithData:(int)a1 dataVersion:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A95BD000, a2, OS_LOG_TYPE_ERROR, "Unable to decode BMTombstoneEvent with dataVersion %u", (uint8_t *)v2, 8u);
}

@end
