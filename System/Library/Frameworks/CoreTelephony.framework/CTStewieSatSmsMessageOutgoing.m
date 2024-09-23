@implementation CTStewieSatSmsMessageOutgoing

- (CTStewieSatSmsMessageOutgoing)initWithContext:(id)a3 destinationPhoneNumber:(id)a4 codecID:(int64_t)a5 textPayload:(id)a6 notifyDowngrade:(BOOL)a7 error:(id *)p_isa
{
  id v15;
  _anonymous_namespace_ *v16;
  id v17;
  void *v18;
  void *v19;
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
  CTStewieSatSmsMessageOutgoing *v31;
  objc_super v32;
  uint64_t v33;
  const __CFString *v34;
  uint64_t v35;
  const __CFString *v36;
  uint64_t v37;
  const __CFString *v38;
  uint64_t v39;
  const __CFString *v40;
  uint64_t v41;
  const __CFString *v42;
  uint64_t v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = (_anonymous_namespace_ *)a4;
  v17 = a6;
  if (v15)
  {
    if (v16 && -[_anonymous_namespace_ length](v16, "length"))
    {
      {
        if ((unint64_t)a5 < 0x10)
        {
          if (v17 && objc_msgSend(v17, "length"))
          {
            if ((unint64_t)objc_msgSend(v17, "length") < 0x8F)
            {
              v32.receiver = self;
              v32.super_class = (Class)CTStewieSatSmsMessageOutgoing;
              v31 = -[CTStewieSatSmsMessageOutgoing init](&v32, sel_init);
              p_isa = (id *)&v31->super.isa;
              if (v31)
              {
                objc_storeStrong((id *)&v31->_context, a3);
                objc_storeStrong(p_isa + 3, a4);
                p_isa[4] = (id)a5;
                objc_storeStrong(p_isa + 5, a6);
                *((_BYTE *)p_isa + 8) = a7;
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
              v26 = (void *)MEMORY[0x1E0CB35C8];
              v33 = *MEMORY[0x1E0CB2D50];
              v34 = CFSTR("textPayload is too big");
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v27);
              *p_isa = (id)objc_claimAutoreleasedReturnValue();

              goto LABEL_21;
            }
          }
          else if (p_isa)
          {
            v28 = (void *)MEMORY[0x1E0CB35C8];
            v35 = *MEMORY[0x1E0CB2D50];
            v36 = CFSTR("textPayload is missing");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v29);
            *p_isa = (id)objc_claimAutoreleasedReturnValue();

            goto LABEL_21;
          }
        }
        else if (p_isa)
        {
          v18 = (void *)MEMORY[0x1E0CB35C8];
          v37 = *MEMORY[0x1E0CB2D50];
          v38 = CFSTR("Invalid codecID");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v19);
          *p_isa = (id)objc_claimAutoreleasedReturnValue();

LABEL_21:
          p_isa = 0;
        }
      }
      else if (p_isa)
      {
        v24 = (void *)MEMORY[0x1E0CB35C8];
        v39 = *MEMORY[0x1E0CB2D50];
        v40 = CFSTR("destinationPhoneNumber is invalid");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v25);
        *p_isa = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_21;
      }
    }
    else if (p_isa)
    {
      v20 = (void *)MEMORY[0x1E0CB35C8];
      v41 = *MEMORY[0x1E0CB2D50];
      v42 = CFSTR("destinationPhoneNumber is missing");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v21);
      *p_isa = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_21;
    }
  }
  else if (p_isa)
  {
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v43 = *MEMORY[0x1E0CB2D50];
    v44[0] = CFSTR("Context is missing");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v23);
    *p_isa = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_21;
  }

  return (CTStewieSatSmsMessageOutgoing *)p_isa;
}

- (CTStewieSatSmsMessageOutgoing)initWithContext:(id)a3 destinationPhoneNumber:(id)a4 codecID:(int64_t)a5 textPayload:(id)a6 error:(id *)a7
{
  return -[CTStewieSatSmsMessageOutgoing initWithContext:destinationPhoneNumber:codecID:textPayload:notifyDowngrade:error:](self, "initWithContext:destinationPhoneNumber:codecID:textPayload:notifyDowngrade:error:", a3, a4, a5, a6, 0, a7);
}

+ (int64_t)maxLengthInBytesForText
{
  return 142;
}

+ (double)estimatedSendTimeForTextPayload:(id)a3
{
  id v3;
  void *v4;
  double EstimatedSendTimeOverStewieInSeconds;
  uint64_t v6;

  v3 = a3;
  v4 = v3;
  EstimatedSendTimeOverStewieInSeconds = 0.0;
  if (v3)
  {
    v6 = objc_msgSend(v3, "lengthOfBytesUsingEncoding:", 4);
    if (v6)
      EstimatedSendTimeOverStewieInSeconds = getEstimatedSendTimeOverStewieInSeconds(v6 + 22);
  }

  return EstimatedSendTimeOverStewieInSeconds;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  const char *v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTStewieSatSmsMessageOutgoing context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", context=%@"), v4);

  -[CTStewieSatSmsMessageOutgoing destinationPhoneNumber](self, "destinationPhoneNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", destinationPhoneNumber=%@"), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR(", codecID=%ld"), -[CTStewieSatSmsMessageOutgoing codecID](self, "codecID"));
  -[CTStewieSatSmsMessageOutgoing textPayload](self, "textPayload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", textPayload size=%lu"), objc_msgSend(v6, "length"));

  v7 = -[CTStewieSatSmsMessageOutgoing notifyDowngrade](self, "notifyDowngrade");
  v8 = "no";
  if (v7)
    v8 = "yes";
  objc_msgSend(v3, "appendFormat:", CFSTR(", notifyDowngrade=%s"), v8);
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
  int v9;
  void *v10;
  void *v11;
  int64_t v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v6 = a3;
  -[CTStewieSatSmsMessageOutgoing context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 != v8)
  {
    -[CTStewieSatSmsMessageOutgoing context](self, "context");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "context");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v20, "isEqual:"))
    {
      LOBYTE(v9) = 0;
LABEL_19:

      goto LABEL_20;
    }
  }
  -[CTStewieSatSmsMessageOutgoing destinationPhoneNumber](self, "destinationPhoneNumber");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "destinationPhoneNumber");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 == v11
    || (-[CTStewieSatSmsMessageOutgoing destinationPhoneNumber](self, "destinationPhoneNumber"),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "destinationPhoneNumber"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v19, "isEqual:", v4)))
  {
    v12 = -[CTStewieSatSmsMessageOutgoing codecID](self, "codecID");
    if (v12 != objc_msgSend(v6, "codecID"))
    {
      LOBYTE(v9) = 0;
      goto LABEL_16;
    }
    -[CTStewieSatSmsMessageOutgoing textPayload](self, "textPayload");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textPayload");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 == v14
      || (-[CTStewieSatSmsMessageOutgoing textPayload](self, "textPayload"),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v6, "textPayload"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v17, "isEqual:", v3)))
    {
      v15 = -[CTStewieSatSmsMessageOutgoing notifyDowngrade](self, "notifyDowngrade");
      v9 = v15 ^ objc_msgSend(v6, "notifyDowngrade") ^ 1;
      if (v13 == v14)
      {

        goto LABEL_15;
      }
    }
    else
    {
      LOBYTE(v9) = 0;
    }

LABEL_15:
LABEL_16:
    if (v10 == v11)
      goto LABEL_18;
    goto LABEL_17;
  }
  LOBYTE(v9) = 0;
LABEL_17:

LABEL_18:
  if (v7 != v8)
    goto LABEL_19;
LABEL_20:

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  CTStewieSatSmsMessageOutgoing *v4;
  BOOL v5;

  v4 = (CTStewieSatSmsMessageOutgoing *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[CTStewieSatSmsMessageOutgoing isEqualToOther:](self, "isEqualToOther:", v4);
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
  -[CTStewieSatSmsMessageOutgoing context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setContext:", v7);

  -[CTStewieSatSmsMessageOutgoing destinationPhoneNumber](self, "destinationPhoneNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setDestinationPhoneNumber:", v9);

  objc_msgSend(v5, "setCodecID:", -[CTStewieSatSmsMessageOutgoing codecID](self, "codecID"));
  -[CTStewieSatSmsMessageOutgoing textPayload](self, "textPayload");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
  objc_msgSend(v5, "setTextPayload:", v11);

  objc_msgSend(v5, "setNotifyDowngrade:", -[CTStewieSatSmsMessageOutgoing notifyDowngrade](self, "notifyDowngrade"));
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CTStewieSatSmsMessageOutgoing context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("context"));

  -[CTStewieSatSmsMessageOutgoing destinationPhoneNumber](self, "destinationPhoneNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("phoneNumber"));

  objc_msgSend(v7, "encodeInteger:forKey:", -[CTStewieSatSmsMessageOutgoing codecID](self, "codecID"), CFSTR("codecID"));
  -[CTStewieSatSmsMessageOutgoing textPayload](self, "textPayload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("textPayload"));

  objc_msgSend(v7, "encodeBool:forKey:", -[CTStewieSatSmsMessageOutgoing notifyDowngrade](self, "notifyDowngrade"), CFSTR("notifyDowngrade"));
}

- (CTStewieSatSmsMessageOutgoing)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  CTStewieSatSmsMessageOutgoing *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("context"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phoneNumber"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("codecID"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("textPayload"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CTStewieSatSmsMessageOutgoing initWithContext:destinationPhoneNumber:codecID:textPayload:notifyDowngrade:error:](self, "initWithContext:destinationPhoneNumber:codecID:textPayload:notifyDowngrade:error:", v5, v6, v7, v8, objc_msgSend(v4, "decodeBoolForKey:", CFSTR("notifyDowngrade")), 0);

  return v9;
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

- (NSString)destinationPhoneNumber
{
  return self->_destinationPhoneNumber;
}

- (void)setDestinationPhoneNumber:(id)a3
{
  objc_storeStrong((id *)&self->_destinationPhoneNumber, a3);
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

- (BOOL)notifyDowngrade
{
  return self->_notifyDowngrade;
}

- (void)setNotifyDowngrade:(BOOL)a3
{
  self->_notifyDowngrade = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textPayload, 0);
  objc_storeStrong((id *)&self->_destinationPhoneNumber, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
