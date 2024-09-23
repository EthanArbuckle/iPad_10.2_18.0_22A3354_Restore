@implementation CTStewieIMessageLiteMessageIncoming

- (CTStewieIMessageLiteMessageIncoming)initWithTimestamp:(id)a3 pendingTotalCount:(int64_t)a4 pendingCount:(int64_t)a5 myShortHandle:(id)a6 otherShortHandle:(id)a7 partNumber:(int64_t)a8 totalParts:(int64_t)a9 payload:(id)a10 error:(id *)a11
{
  _anonymous_namespace_ *v17;
  NSNumber *v18;
  NSNumber *v19;
  CTStewieIMessageLiteMessageIncoming *v20;
  CTStewieIMessageLiteMessageIncoming *v21;
  CTStewieIMessageLiteMessageIncoming *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v34;
  id v36;
  _anonymous_namespace_ *v37;
  objc_super v38;
  uint64_t v39;
  const __CFString *v40;
  uint64_t v41;
  const __CFString *v42;
  uint64_t v43;
  const __CFString *v44;
  uint64_t v45;
  const __CFString *v46;
  uint64_t v47;
  _QWORD v48[3];

  v48[1] = *MEMORY[0x1E0C80C00];
  v34 = a3;
  v17 = (_anonymous_namespace_ *)a6;
  v37 = (_anonymous_namespace_ *)a7;
  v36 = a10;
  {
    if (a11)
    {
      v23 = (void *)MEMORY[0x1E0CB35C8];
      v47 = *MEMORY[0x1E0CB2D50];
      v48[0] = CFSTR("Invalid myShortHandle");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, &v47, 1, v34);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v24);
      v21 = self;
      *a11 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_18;
    }
LABEL_19:
    v22 = 0;
    v21 = self;
    goto LABEL_20;
  }
  {
    if (a11)
    {
      v25 = (void *)MEMORY[0x1E0CB35C8];
      v45 = *MEMORY[0x1E0CB2D50];
      v46 = CFSTR("Invalid otherShortHandle");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1, v34);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v26);
      v21 = self;
      *a11 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_18;
    }
    goto LABEL_19;
  }
  if ((unint64_t)(a8 - 1) >= 4)
  {
    if (a11)
    {
      v27 = (void *)MEMORY[0x1E0CB35C8];
      v43 = *MEMORY[0x1E0CB2D50];
      v44 = CFSTR("Invalid partNumber");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1, v34);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v28);
      v21 = self;
      *a11 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_18;
    }
    goto LABEL_19;
  }
  if ((unint64_t)(a9 - 1) >= 4)
  {
    if (a11)
    {
      v29 = (void *)MEMORY[0x1E0CB35C8];
      v41 = *MEMORY[0x1E0CB2D50];
      v42 = CFSTR("Invalid totalParts");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1, v34);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v30);
      v21 = self;
      *a11 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_18;
    }
    goto LABEL_19;
  }
  if (!v36)
  {
    if (a11)
    {
      v31 = (void *)MEMORY[0x1E0CB35C8];
      v39 = *MEMORY[0x1E0CB2D50];
      v40 = CFSTR("Payload is missing");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1, v34);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v32);
      v21 = self;
      *a11 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_18;
    }
    goto LABEL_19;
  }
  v38.receiver = self;
  v38.super_class = (Class)CTStewieIMessageLiteMessageIncoming;
  v20 = -[CTStewieIMessageLiteMessageIncoming init](&v38, sel_init, v34, 0);
  v21 = v20;
  if (!v20)
  {
LABEL_18:
    v22 = 0;
    goto LABEL_20;
  }
  objc_storeStrong((id *)&v20->_timestamp, a3);
  v21->_pendingTotalCount = a4;
  v21->_pendingCount = a5;
  objc_storeStrong((id *)&v21->_myShortHandle, a6);
  objc_storeStrong((id *)&v21->_otherShortHandle, a7);
  v21->_partNumber = a8;
  v21->_totalParts = a9;
  objc_storeStrong((id *)&v21->_payload, a10);
  v21 = v21;
  v22 = v21;
LABEL_20:

  return v22;
}

- (NSString)description
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = self;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", pendingTotalCount=%ld"), objc_msgSend(v2, "pendingTotalCount"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", pendingCount=%ld"), objc_msgSend(v2, "pendingCount"));
  objc_msgSend(v2, "myShortHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", myShortHandle=%@"), v4);

  objc_msgSend(v2, "otherShortHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", otherShortHandle=%@"), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR(", partNumber=%ld"), objc_msgSend(v2, "partNumber"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", totalParts=%ld"), objc_msgSend(v2, "totalParts"));
  objc_msgSend(v2, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v2, "payload");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v2, "length");
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v3, "appendFormat:", CFSTR(", payload size=%lu"), v7);
  if (v6)

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return (NSString *)v3;
}

- (BOOL)isEqualToOther:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  void *v7;
  void *v8;
  char v9;
  int64_t v10;
  int64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int64_t v16;
  int64_t v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;

  v6 = a3;
  -[CTStewieIMessageLiteMessageIncoming timestamp](self, "timestamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timestamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 != v8)
  {
    -[CTStewieIMessageLiteMessageIncoming timestamp](self, "timestamp");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timestamp");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v3, "isEqual:", v4))
    {
      v9 = 0;
LABEL_24:

      goto LABEL_25;
    }
  }
  v10 = -[CTStewieIMessageLiteMessageIncoming pendingTotalCount](self, "pendingTotalCount");
  if (v10 != objc_msgSend(v6, "pendingTotalCount")
    || (v11 = -[CTStewieIMessageLiteMessageIncoming pendingCount](self, "pendingCount"),
        v11 != objc_msgSend(v6, "pendingCount")))
  {
    v9 = 0;
    goto LABEL_23;
  }
  -[CTStewieIMessageLiteMessageIncoming myShortHandle](self, "myShortHandle");
  v27 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "myShortHandle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((void *)v27 != v12)
  {
    -[CTStewieIMessageLiteMessageIncoming myShortHandle](self, "myShortHandle");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "myShortHandle");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v26, "isEqual:"))
    {
      v9 = 0;
      v13 = (void *)v27;
LABEL_21:

      goto LABEL_22;
    }
  }
  -[CTStewieIMessageLiteMessageIncoming otherShortHandle](self, "otherShortHandle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "otherShortHandle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14 != v15)
  {
    -[CTStewieIMessageLiteMessageIncoming otherShortHandle](self, "otherShortHandle");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "otherShortHandle");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v25, "isEqual:"))
    {
      v9 = 0;
LABEL_19:

      goto LABEL_20;
    }
  }
  v16 = -[CTStewieIMessageLiteMessageIncoming partNumber](self, "partNumber");
  if (v16 == objc_msgSend(v6, "partNumber")
    && (v17 = -[CTStewieIMessageLiteMessageIncoming totalParts](self, "totalParts"),
        v17 == objc_msgSend(v6, "totalParts")))
  {
    -[CTStewieIMessageLiteMessageIncoming payload](self, "payload");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "payload");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22 == v21)
    {

      v9 = 1;
    }
    else
    {
      -[CTStewieIMessageLiteMessageIncoming payload](self, "payload");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "payload");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v20, "isEqual:", v19);

    }
  }
  else
  {
    v9 = 0;
  }
  if (v14 != v15)
    goto LABEL_19;
LABEL_20:

  v13 = (void *)v27;
  if ((void *)v27 != v12)
    goto LABEL_21;
LABEL_22:

LABEL_23:
  if (v7 != v8)
    goto LABEL_24;
LABEL_25:

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  CTStewieIMessageLiteMessageIncoming *v4;
  BOOL v5;

  v4 = (CTStewieIMessageLiteMessageIncoming *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[CTStewieIMessageLiteMessageIncoming isEqualToOther:](self, "isEqualToOther:", v4);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CTStewieIMessageLiteMessageIncoming timestamp](self, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setTimestamp:", v7);

  objc_msgSend(v5, "setPendingTotalCount:", -[CTStewieIMessageLiteMessageIncoming pendingTotalCount](self, "pendingTotalCount"));
  objc_msgSend(v5, "setPendingCount:", -[CTStewieIMessageLiteMessageIncoming pendingCount](self, "pendingCount"));
  -[CTStewieIMessageLiteMessageIncoming myShortHandle](self, "myShortHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setMyShortHandle:", v9);

  -[CTStewieIMessageLiteMessageIncoming otherShortHandle](self, "otherShortHandle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
  objc_msgSend(v5, "setOtherShortHandle:", v11);

  objc_msgSend(v5, "setPartNumber:", -[CTStewieIMessageLiteMessageIncoming partNumber](self, "partNumber"));
  objc_msgSend(v5, "setTotalParts:", -[CTStewieIMessageLiteMessageIncoming totalParts](self, "totalParts"));
  -[CTStewieIMessageLiteMessageIncoming payload](self, "payload");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copyWithZone:", a3);
  objc_msgSend(v5, "setPayload:", v13);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[CTStewieIMessageLiteMessageIncoming timestamp](self, "timestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("timestamp"));

  objc_msgSend(v8, "encodeInteger:forKey:", -[CTStewieIMessageLiteMessageIncoming pendingTotalCount](self, "pendingTotalCount"), CFSTR("pendingTotalCount"));
  objc_msgSend(v8, "encodeInteger:forKey:", -[CTStewieIMessageLiteMessageIncoming pendingCount](self, "pendingCount"), CFSTR("pendingCount"));
  -[CTStewieIMessageLiteMessageIncoming myShortHandle](self, "myShortHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("myShortHandle"));

  -[CTStewieIMessageLiteMessageIncoming otherShortHandle](self, "otherShortHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("otherShortHandle"));

  objc_msgSend(v8, "encodeInteger:forKey:", -[CTStewieIMessageLiteMessageIncoming partNumber](self, "partNumber"), CFSTR("partNumber"));
  objc_msgSend(v8, "encodeInteger:forKey:", -[CTStewieIMessageLiteMessageIncoming totalParts](self, "totalParts"), CFSTR("totalParts"));
  -[CTStewieIMessageLiteMessageIncoming payload](self, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("payload"));

}

- (CTStewieIMessageLiteMessageIncoming)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  CTStewieIMessageLiteMessageIncoming *v13;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timestamp"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("pendingTotalCount"));
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("pendingCount"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("myShortHandle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("otherShortHandle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("partNumber"));
  v11 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("totalParts"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("payload"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[CTStewieIMessageLiteMessageIncoming initWithTimestamp:pendingTotalCount:pendingCount:myShortHandle:otherShortHandle:partNumber:totalParts:payload:error:](self, "initWithTimestamp:pendingTotalCount:pendingCount:myShortHandle:otherShortHandle:partNumber:totalParts:payload:error:", v5, v6, v7, v8, v9, v10, v11, v12, 0);

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_timestamp, a3);
}

- (int64_t)pendingTotalCount
{
  return self->_pendingTotalCount;
}

- (void)setPendingTotalCount:(int64_t)a3
{
  self->_pendingTotalCount = a3;
}

- (int64_t)pendingCount
{
  return self->_pendingCount;
}

- (void)setPendingCount:(int64_t)a3
{
  self->_pendingCount = a3;
}

- (NSNumber)myShortHandle
{
  return self->_myShortHandle;
}

- (void)setMyShortHandle:(id)a3
{
  objc_storeStrong((id *)&self->_myShortHandle, a3);
}

- (NSNumber)otherShortHandle
{
  return self->_otherShortHandle;
}

- (void)setOtherShortHandle:(id)a3
{
  objc_storeStrong((id *)&self->_otherShortHandle, a3);
}

- (int64_t)partNumber
{
  return self->_partNumber;
}

- (void)setPartNumber:(int64_t)a3
{
  self->_partNumber = a3;
}

- (int64_t)totalParts
{
  return self->_totalParts;
}

- (void)setTotalParts:(int64_t)a3
{
  self->_totalParts = a3;
}

- (NSData)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
  objc_storeStrong((id *)&self->_payload, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_otherShortHandle, 0);
  objc_storeStrong((id *)&self->_myShortHandle, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end
