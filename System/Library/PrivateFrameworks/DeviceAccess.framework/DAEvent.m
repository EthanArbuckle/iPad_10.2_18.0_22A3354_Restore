@implementation DAEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)allocInitWithXPCObject:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = a3;
  if (CUXPCDecodeSInt64RangedEx() != 5 && a4)
  {
    DAErrorF(350001, (uint64_t)"DAEvent init bad type: %d", v6, v7, v8, v9, v10, v11, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0;
}

- (DAEvent)initWithCoder:(id)a3
{
  id v4;
  DAEvent *v5;
  id v6;
  id v7;
  DAEvent *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)DAEvent;
  v5 = -[DAEvent init](&v18, sel_init);
  if (v5)
  {
    v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v7 = v6;
    if (objc_msgSend(v7, "containsValueForKey:", CFSTR("evTy")))
      v5->_eventType = objc_msgSend(v7, "decodeIntegerForKey:", CFSTR("evTy"));

    v8 = v5;
  }
  else
  {
    v10 = objc_opt_class();
    DAErrorF(350001, (uint64_t)"%@ init failed", v11, v12, v13, v14, v15, v16, v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v17);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSError *error;
  int64_t eventType;
  id v7;

  v4 = a3;
  error = self->_error;
  v7 = v4;
  if (error)
  {
    objc_msgSend(v4, "encodeObject:forKey:", error, CFSTR("errr"));
    v4 = v7;
  }
  eventType = self->_eventType;
  if (eventType)
  {
    objc_msgSend(v7, "encodeInteger:forKey:", eventType, CFSTR("evTy"));
    v4 = v7;
  }

}

- (DAEvent)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6;
  DAEvent *v7;
  int v8;
  DAEvent *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  objc_super v18;
  int64_t v19;

  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)DAEvent;
  v7 = -[DAEvent init](&v18, sel_init);
  if (!v7)
  {
    if (a4)
    {
      v11 = objc_opt_class();
      DAErrorF(350001, (uint64_t)"%@ super init failed", v12, v13, v14, v15, v16, v17, v11);
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    goto LABEL_10;
  }
  if (!CUXPCDecodeNSError())
    goto LABEL_10;
  v19 = 0;
  v8 = CUXPCDecodeSInt64RangedEx();
  if (v8 != 6)
  {
    if (v8 != 5)
      goto LABEL_6;
LABEL_10:
    v9 = 0;
    goto LABEL_7;
  }
  v7->_eventType = v19;
LABEL_6:
  v9 = v7;
LABEL_7:

  return v9;
}

- (void)encodeWithXPCObject:(id)a3
{
  int64_t eventType;
  xpc_object_t xdict;

  xdict = a3;
  CUXPCEncodeNSError();
  eventType = self->_eventType;
  if (eventType)
    xpc_dictionary_set_int64(xdict, "evTy", eventType);

}

- (DAEvent)initWithEventType:(int64_t)a3
{
  DAEvent *v4;
  DAEvent *v5;
  DAEvent *v6;

  v4 = -[DAEvent init](self, "init");
  v5 = v4;
  if (v4)
  {
    v4->_eventType = a3;
    v6 = v4;
  }

  return v5;
}

- (DAEvent)initWithEventType:(int64_t)a3 error:(id)a4
{
  id v7;
  DAEvent *v8;
  DAEvent *v9;
  DAEvent *v10;

  v7 = a4;
  v8 = -[DAEvent init](self, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_error, a4);
    v9->_eventType = a3;
    v10 = v9;
  }

  return v9;
}

- (id)description
{
  return -[DAEvent descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  __CFString *v4;
  int64_t eventType;
  __CFString *v6;
  NSError *error;
  NSError *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  void *v13;
  void *v14;

  if ((a3 & 0x8000000) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_opt_class();
    CUAppendF();
    v4 = (__CFString *)0;
  }
  eventType = self->_eventType;
  if (eventType)
  {
    DAEventTypeToString(eventType);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v6 = v4;

    v4 = v6;
  }
  error = self->_error;
  if (error)
  {
    v8 = error;
    CUPrintNSError();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v9 = v4;

    v4 = v9;
  }
  v10 = &stru_24D169BB8;
  if (v4)
    v10 = v4;
  v11 = v10;

  return v11;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

@end
