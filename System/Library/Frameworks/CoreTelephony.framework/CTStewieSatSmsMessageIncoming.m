@implementation CTStewieSatSmsMessageIncoming

- (CTStewieSatSmsMessageIncoming)initWithContext:(id)a3 timestamp:(id)a4 pendingTotalCount:(int64_t)a5 pendingCount:(int64_t)a6 sourcePhoneNumber:(id)a7 codecID:(int64_t)a8 textPayload:(id)a9 uniqueID:(id)a10 error:(id *)a11
{
  id v16;
  id v17;
  CTStewieSatSmsMessageIncoming *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  CTStewieSatSmsMessageIncoming *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  CTStewieSatSmsMessageIncoming *v35;
  CTStewieSatSmsMessageIncoming *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v43;
  void *v44;
  id v45;
  id v47;
  id v48;
  objc_super v49;
  uint64_t v50;
  const __CFString *v51;
  uint64_t v52;
  const __CFString *v53;
  uint64_t v54;
  const __CFString *v55;
  uint64_t v56;
  const __CFString *v57;
  uint64_t v58;
  const __CFString *v59;
  uint64_t v60;
  const __CFString *v61;
  uint64_t v62;
  const __CFString *v63;
  uint64_t v64;
  const __CFString *v65;
  uint64_t v66;
  _QWORD v67[3];

  v67[1] = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v45 = a7;
  v48 = a9;
  v47 = a10;
  v43 = v16;
  v44 = v17;
  if (v16)
  {
    if (v17)
    {
      v18 = self;
      if (a6 < 0)
      {
        v19 = v45;
        if (a11)
        {
          v26 = (void *)MEMORY[0x1E0CB35C8];
          v62 = *MEMORY[0x1E0CB2D50];
          v63 = CFSTR("Invalid pendingCount");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v27);
          *a11 = (id)objc_claimAutoreleasedReturnValue();

        }
        goto LABEL_36;
      }
      v19 = v45;
      if (a5 < 0)
      {
        if (a11)
        {
          v31 = (void *)MEMORY[0x1E0CB35C8];
          v60 = *MEMORY[0x1E0CB2D50];
          v61 = CFSTR("Invalid pendingTotalCount");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v32);
          *a11 = (id)objc_claimAutoreleasedReturnValue();

        }
        goto LABEL_36;
      }
      if (!v45 || !objc_msgSend(v45, "length"))
      {
        if (a11)
        {
          v29 = (void *)MEMORY[0x1E0CB35C8];
          v58 = *MEMORY[0x1E0CB2D50];
          v59 = CFSTR("sourcePhoneNumber is missing");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v30);
          *a11 = (id)objc_claimAutoreleasedReturnValue();

        }
        goto LABEL_36;
      }
      {
        if (a11)
        {
          v33 = (void *)MEMORY[0x1E0CB35C8];
          v56 = *MEMORY[0x1E0CB2D50];
          v57 = CFSTR("sourcePhoneNumber is invalid");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v34);
          *a11 = (id)objc_claimAutoreleasedReturnValue();

        }
        goto LABEL_36;
      }
      if ((unint64_t)a8 >= 0x10)
      {
        if (a11)
        {
          v20 = (void *)MEMORY[0x1E0CB35C8];
          v54 = *MEMORY[0x1E0CB2D50];
          v55 = CFSTR("Invalid codecID");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v21);
          *a11 = (id)objc_claimAutoreleasedReturnValue();

        }
        goto LABEL_36;
      }
      if (!v48 || !objc_msgSend(v48, "length"))
      {
        if (a11)
        {
          v37 = (void *)MEMORY[0x1E0CB35C8];
          v52 = *MEMORY[0x1E0CB2D50];
          v53 = CFSTR("textPayload is missing");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v38);
          *a11 = (id)objc_claimAutoreleasedReturnValue();

        }
        goto LABEL_36;
      }
      if (!v47 || !objc_msgSend(v47, "length"))
      {
        if (a11)
        {
          v39 = (void *)MEMORY[0x1E0CB35C8];
          v50 = *MEMORY[0x1E0CB2D50];
          v51 = CFSTR("uniqueID is missing");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v40);
          *a11 = (id)objc_claimAutoreleasedReturnValue();

        }
        goto LABEL_36;
      }
      v49.receiver = self;
      v49.super_class = (Class)CTStewieSatSmsMessageIncoming;
      v35 = -[CTStewieSatSmsMessageIncoming init](&v49, sel_init);
      v36 = v35;
      if (v35)
      {
        objc_storeStrong((id *)&v35->_context, a3);
        objc_storeStrong((id *)&v36->_timestamp, a4);
        v36->_pendingTotalCount = a5;
        v36->_pendingCount = a6;
        objc_storeStrong((id *)&v36->_sourcePhoneNumber, a7);
        v36->_codecID = a8;
        objc_storeStrong((id *)&v36->_textPayload, a9);
        objc_storeStrong((id *)&v36->_uniqueID, a10);
        v18 = v36;
        v28 = v18;
        goto LABEL_37;
      }
      v18 = 0;
LABEL_36:
      v28 = 0;
      goto LABEL_37;
    }
    v18 = self;
    if (a11)
    {
      v24 = (void *)MEMORY[0x1E0CB35C8];
      v64 = *MEMORY[0x1E0CB2D50];
      v65 = CFSTR("timestamp is missing");
      v19 = v45;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v25);
      *a11 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_36;
    }
    v28 = 0;
    v19 = v45;
  }
  else
  {
    if (a11)
    {
      v22 = (void *)MEMORY[0x1E0CB35C8];
      v66 = *MEMORY[0x1E0CB2D50];
      v67[0] = CFSTR("Context is missing");
      v19 = v45;
      v18 = self;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v67, &v66, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v23);
      *a11 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_36;
    }
    v28 = 0;
    v19 = v45;
    v18 = self;
  }
LABEL_37:

  return v28;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTStewieSatSmsMessageIncoming context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", context=%@"), v4);

  -[CTStewieSatSmsMessageIncoming timestamp](self, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", timestamp=%@"), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR(", pendingTotalCount=%ld"), -[CTStewieSatSmsMessageIncoming pendingTotalCount](self, "pendingTotalCount"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", pendingCount=%ld"), -[CTStewieSatSmsMessageIncoming pendingCount](self, "pendingCount"));
  -[CTStewieSatSmsMessageIncoming sourcePhoneNumber](self, "sourcePhoneNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", sourcePhoneNumber=%@"), v6);

  objc_msgSend(v3, "appendFormat:", CFSTR(", codecID=%ld"), -[CTStewieSatSmsMessageIncoming codecID](self, "codecID"));
  -[CTStewieSatSmsMessageIncoming textPayload](self, "textPayload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", textPayload size=%lu"), objc_msgSend(v7, "length"));

  -[CTStewieSatSmsMessageIncoming uniqueID](self, "uniqueID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", uniqueID=%@"), v8);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return (NSString *)v3;
}

- (BOOL)isEqualToOther:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  int64_t v13;
  int64_t v14;
  void *v15;
  void *v16;
  int64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;

  v7 = a3;
  -[CTStewieSatSmsMessageIncoming context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 != v9)
  {
    -[CTStewieSatSmsMessageIncoming context](self, "context");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v3, "isEqual:", v4))
    {
      v10 = 0;
LABEL_15:

      goto LABEL_16;
    }
  }
  -[CTStewieSatSmsMessageIncoming timestamp](self, "timestamp");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timestamp");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 != v12)
  {
    -[CTStewieSatSmsMessageIncoming timestamp](self, "timestamp");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timestamp");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v33, "isEqual:", v5))
    {
      v10 = 0;
LABEL_13:

      goto LABEL_14;
    }
  }
  v13 = -[CTStewieSatSmsMessageIncoming pendingTotalCount](self, "pendingTotalCount");
  if (v13 != objc_msgSend(v7, "pendingTotalCount")
    || (v14 = -[CTStewieSatSmsMessageIncoming pendingCount](self, "pendingCount"),
        v14 != objc_msgSend(v7, "pendingCount")))
  {
    v10 = 0;
    if (v11 == v12)
      goto LABEL_14;
    goto LABEL_13;
  }
  -[CTStewieSatSmsMessageIncoming sourcePhoneNumber](self, "sourcePhoneNumber");
  v32 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sourcePhoneNumber");
  v30 = v5;
  v31 = objc_claimAutoreleasedReturnValue();
  if (v32 == v31
    || (-[CTStewieSatSmsMessageIncoming sourcePhoneNumber](self, "sourcePhoneNumber"),
        v29 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "sourcePhoneNumber"),
        v28 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v29, "isEqual:")))
  {
    v18 = -[CTStewieSatSmsMessageIncoming codecID](self, "codecID");
    if (v18 != objc_msgSend(v7, "codecID"))
    {
      v10 = 0;
      goto LABEL_28;
    }
    -[CTStewieSatSmsMessageIncoming textPayload](self, "textPayload");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textPayload");
    v27 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v27
      || (-[CTStewieSatSmsMessageIncoming textPayload](self, "textPayload"),
          v26 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v7, "textPayload"),
          v24 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v26, "isEqual:")))
    {
      -[CTStewieSatSmsMessageIncoming uniqueID](self, "uniqueID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "uniqueID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25 == v23)
      {

        v10 = 1;
      }
      else
      {
        -[CTStewieSatSmsMessageIncoming uniqueID](self, "uniqueID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "uniqueID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v22, "isEqual:", v21);

      }
      v20 = (void *)v27;
      if (v19 == (void *)v27)
        goto LABEL_27;
    }
    else
    {
      v10 = 0;
      v20 = (void *)v27;
    }

LABEL_27:
LABEL_28:
    v16 = (void *)v31;
    v15 = (void *)v32;
    if (v32 == v31)
      goto LABEL_30;
    goto LABEL_29;
  }
  v10 = 0;
  v16 = (void *)v31;
  v15 = (void *)v32;
LABEL_29:

LABEL_30:
  v5 = v30;
  if (v11 != v12)
    goto LABEL_13;
LABEL_14:

  if (v8 != v9)
    goto LABEL_15;
LABEL_16:

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  CTStewieSatSmsMessageIncoming *v4;
  BOOL v5;

  v4 = (CTStewieSatSmsMessageIncoming *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[CTStewieSatSmsMessageIncoming isEqualToOther:](self, "isEqualToOther:", v4);
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
  void *v14;
  void *v15;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CTStewieSatSmsMessageIncoming context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setContext:", v7);

  -[CTStewieSatSmsMessageIncoming timestamp](self, "timestamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setTimestamp:", v9);

  objc_msgSend(v5, "setPendingTotalCount:", -[CTStewieSatSmsMessageIncoming pendingTotalCount](self, "pendingTotalCount"));
  objc_msgSend(v5, "setPendingCount:", -[CTStewieSatSmsMessageIncoming pendingCount](self, "pendingCount"));
  -[CTStewieSatSmsMessageIncoming sourcePhoneNumber](self, "sourcePhoneNumber");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
  objc_msgSend(v5, "setSourcePhoneNumber:", v11);

  objc_msgSend(v5, "setCodecID:", -[CTStewieSatSmsMessageIncoming codecID](self, "codecID"));
  -[CTStewieSatSmsMessageIncoming textPayload](self, "textPayload");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copyWithZone:", a3);
  objc_msgSend(v5, "setTextPayload:", v13);

  -[CTStewieSatSmsMessageIncoming uniqueID](self, "uniqueID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copyWithZone:", a3);
  objc_msgSend(v5, "setUniqueID:", v15);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[CTStewieSatSmsMessageIncoming context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v4, CFSTR("context"));

  -[CTStewieSatSmsMessageIncoming timestamp](self, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("timestamp"));

  objc_msgSend(v9, "encodeInteger:forKey:", -[CTStewieSatSmsMessageIncoming pendingTotalCount](self, "pendingTotalCount"), CFSTR("pendingTotalCount"));
  objc_msgSend(v9, "encodeInteger:forKey:", -[CTStewieSatSmsMessageIncoming pendingCount](self, "pendingCount"), CFSTR("pendingCount"));
  -[CTStewieSatSmsMessageIncoming sourcePhoneNumber](self, "sourcePhoneNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("phoneNumber"));

  objc_msgSend(v9, "encodeInteger:forKey:", -[CTStewieSatSmsMessageIncoming codecID](self, "codecID"), CFSTR("codecID"));
  -[CTStewieSatSmsMessageIncoming textPayload](self, "textPayload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("textPayload"));

  -[CTStewieSatSmsMessageIncoming uniqueID](self, "uniqueID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("uniqueID"));

}

- (CTStewieSatSmsMessageIncoming)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  CTStewieSatSmsMessageIncoming *v13;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("context"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timestamp"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("pendingTotalCount"));
  v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("pendingCount"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phoneNumber"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("codecID"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("textPayload"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uniqueID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[CTStewieSatSmsMessageIncoming initWithContext:timestamp:pendingTotalCount:pendingCount:sourcePhoneNumber:codecID:textPayload:uniqueID:error:](self, "initWithContext:timestamp:pendingTotalCount:pendingCount:sourcePhoneNumber:codecID:textPayload:uniqueID:error:", v5, v6, v7, v8, v9, v10, v11, v12, 0);

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTXPCServiceSubscriptionContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
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

- (NSString)sourcePhoneNumber
{
  return self->_sourcePhoneNumber;
}

- (void)setSourcePhoneNumber:(id)a3
{
  objc_storeStrong((id *)&self->_sourcePhoneNumber, a3);
}

- (int64_t)codecID
{
  return self->_codecID;
}

- (void)setCodecID:(int64_t)a3
{
  self->_codecID = a3;
}

- (NSData)textPayload
{
  return self->_textPayload;
}

- (void)setTextPayload:(id)a3
{
  objc_storeStrong((id *)&self->_textPayload, a3);
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_textPayload, 0);
  objc_storeStrong((id *)&self->_sourcePhoneNumber, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
