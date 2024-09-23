@implementation CTStewieIMessageLiteMessageOutgoing

- (CTStewieIMessageLiteMessageOutgoing)initWithMyShortHandle:(id)a3 otherShortHandle:(id)a4 partNumber:(int64_t)a5 totalParts:(int64_t)a6 payload:(id)a7 error:(id *)p_isa
{
  _anonymous_namespace_ *v15;
  _anonymous_namespace_ *v16;
  id v17;
  NSNumber *v18;
  NSNumber *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  CTStewieIMessageLiteMessageOutgoing *v33;
  objc_super v34;
  uint64_t v35;
  const __CFString *v36;
  uint64_t v37;
  const __CFString *v38;
  uint64_t v39;
  const __CFString *v40;
  uint64_t v41;
  const __CFString *v42;
  uint64_t v43;
  const __CFString *v44;
  uint64_t v45;
  _QWORD v46[2];

  v46[1] = *MEMORY[0x1E0C80C00];
  v15 = (_anonymous_namespace_ *)a3;
  v16 = (_anonymous_namespace_ *)a4;
  v17 = a7;
  {
    {
      if ((unint64_t)(a5 - 1) >= 4)
      {
        if (p_isa)
        {
          v26 = (void *)MEMORY[0x1E0CB35C8];
          v41 = *MEMORY[0x1E0CB2D50];
          v42 = CFSTR("Invalid partNumber");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v27);
          *p_isa = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_19;
        }
      }
      else if ((unint64_t)(a6 - 1) >= 4)
      {
        if (p_isa)
        {
          v28 = (void *)MEMORY[0x1E0CB35C8];
          v39 = *MEMORY[0x1E0CB2D50];
          v40 = CFSTR("Invalid totalParts");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v29);
          *p_isa = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_19;
        }
      }
      else if (v17)
      {
        if ((unint64_t)objc_msgSend(v17, "length") < 0x94)
        {
          v34.receiver = self;
          v34.super_class = (Class)CTStewieIMessageLiteMessageOutgoing;
          v33 = -[CTStewieIMessageLiteMessageOutgoing init](&v34, sel_init);
          p_isa = (id *)&v33->super.isa;
          if (v33)
          {
            objc_storeStrong((id *)&v33->_myShortHandle, a3);
            objc_storeStrong(p_isa + 2, a4);
            p_isa[3] = (id)a5;
            p_isa[4] = (id)a6;
            objc_storeStrong(p_isa + 5, a7);
            self = p_isa;
            p_isa = (id *)&self->super.isa;
          }
          else
          {
            self = 0;
          }
        }
        else if (p_isa)
        {
          v20 = (void *)MEMORY[0x1E0CB35C8];
          v35 = *MEMORY[0x1E0CB2D50];
          v36 = CFSTR("Payload is too big");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v21);
          *p_isa = (id)objc_claimAutoreleasedReturnValue();

LABEL_19:
          p_isa = 0;
        }
      }
      else if (p_isa)
      {
        v30 = (void *)MEMORY[0x1E0CB35C8];
        v37 = *MEMORY[0x1E0CB2D50];
        v38 = CFSTR("Payload is missing");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v31);
        *p_isa = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_19;
      }
    }
    else if (p_isa)
    {
      v24 = (void *)MEMORY[0x1E0CB35C8];
      v43 = *MEMORY[0x1E0CB2D50];
      v44 = CFSTR("Invalid otherShortHandle");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v25);
      *p_isa = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_19;
    }
  }
  else if (p_isa)
  {
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v45 = *MEMORY[0x1E0CB2D50];
    v46[0] = CFSTR("Invalid myShortHandle");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, &v45, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v23);
    *p_isa = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_19;
  }

  return (CTStewieIMessageLiteMessageOutgoing *)p_isa;
}

+ (int64_t)maxNumberOfParts
{
  return 4;
}

+ (int64_t)maxLengthInBytesForPayload
{
  return 147;
}

+ (double)estimatedSendTimeForPayload:(id)a3
{
  id v3;
  void *v4;
  double EstimatedSendTimeOverStewieInSeconds;

  v3 = a3;
  v4 = v3;
  EstimatedSendTimeOverStewieInSeconds = 0.0;
  if (v3 && objc_msgSend(v3, "length"))
    EstimatedSendTimeOverStewieInSeconds = getEstimatedSendTimeOverStewieInSeconds(objc_msgSend(v4, "length") + 17);

  return EstimatedSendTimeOverStewieInSeconds;
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
  void *v10;
  void *v11;
  int64_t v12;
  int64_t v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v6 = a3;
  -[CTStewieIMessageLiteMessageOutgoing myShortHandle](self, "myShortHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "myShortHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 != v8)
  {
    -[CTStewieIMessageLiteMessageOutgoing myShortHandle](self, "myShortHandle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "myShortHandle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v20, "isEqual:"))
    {
      v9 = 0;
LABEL_15:

      goto LABEL_16;
    }
  }
  -[CTStewieIMessageLiteMessageOutgoing otherShortHandle](self, "otherShortHandle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "otherShortHandle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 != v11)
  {
    -[CTStewieIMessageLiteMessageOutgoing otherShortHandle](self, "otherShortHandle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "otherShortHandle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v3, "isEqual:", v4))
    {
      v9 = 0;
LABEL_13:

      goto LABEL_14;
    }
  }
  v12 = -[CTStewieIMessageLiteMessageOutgoing partNumber](self, "partNumber");
  if (v12 == objc_msgSend(v6, "partNumber")
    && (v13 = -[CTStewieIMessageLiteMessageOutgoing totalParts](self, "totalParts"),
        v13 == objc_msgSend(v6, "totalParts")))
  {
    -[CTStewieIMessageLiteMessageOutgoing payload](self, "payload");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "payload");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18 == v17)
    {

      v9 = 1;
    }
    else
    {
      -[CTStewieIMessageLiteMessageOutgoing payload](self, "payload");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "payload");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v16, "isEqual:", v14);

    }
  }
  else
  {
    v9 = 0;
  }
  if (v10 != v11)
    goto LABEL_13;
LABEL_14:

  if (v7 != v8)
    goto LABEL_15;
LABEL_16:

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  CTStewieIMessageLiteMessageOutgoing *v4;
  BOOL v5;

  v4 = (CTStewieIMessageLiteMessageOutgoing *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[CTStewieIMessageLiteMessageOutgoing isEqualToOther:](self, "isEqualToOther:", v4);
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

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CTStewieIMessageLiteMessageOutgoing myShortHandle](self, "myShortHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setMyShortHandle:", v7);

  -[CTStewieIMessageLiteMessageOutgoing otherShortHandle](self, "otherShortHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setOtherShortHandle:", v9);

  objc_msgSend(v5, "setPartNumber:", -[CTStewieIMessageLiteMessageOutgoing partNumber](self, "partNumber"));
  objc_msgSend(v5, "setTotalParts:", -[CTStewieIMessageLiteMessageOutgoing totalParts](self, "totalParts"));
  -[CTStewieIMessageLiteMessageOutgoing payload](self, "payload");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
  objc_msgSend(v5, "setPayload:", v11);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CTStewieIMessageLiteMessageOutgoing myShortHandle](self, "myShortHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("myShortHandle"));

  -[CTStewieIMessageLiteMessageOutgoing otherShortHandle](self, "otherShortHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("otherShortHandle"));

  objc_msgSend(v7, "encodeInteger:forKey:", -[CTStewieIMessageLiteMessageOutgoing partNumber](self, "partNumber"), CFSTR("partNumber"));
  objc_msgSend(v7, "encodeInteger:forKey:", -[CTStewieIMessageLiteMessageOutgoing totalParts](self, "totalParts"), CFSTR("totalParts"));
  -[CTStewieIMessageLiteMessageOutgoing payload](self, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("payload"));

}

- (CTStewieIMessageLiteMessageOutgoing)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  CTStewieIMessageLiteMessageOutgoing *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("myShortHandle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("otherShortHandle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("partNumber"));
  v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("totalParts"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("payload"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CTStewieIMessageLiteMessageOutgoing initWithMyShortHandle:otherShortHandle:partNumber:totalParts:payload:error:](self, "initWithMyShortHandle:otherShortHandle:partNumber:totalParts:payload:error:", v5, v6, v7, v8, v9, 0);

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
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
}

@end
