@implementation IDSCTPNRValidationMechanism

+ (id)SMSMechanismWithContext:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  double v7;
  void *v8;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  v8 = (void *)objc_msgSend_initWithType_context_(v5, v6, 1, v7, v4);

  return v8;
}

+ (id)SMSLessMechanism
{
  id v2;
  const char *v3;
  double v4;

  v2 = objc_alloc((Class)a1);
  return (id)objc_msgSend_initWithType_context_(v2, v3, 2, v4, 0);
}

+ (id)mechanismStringForMechanism:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("Unknown");
  if (a3 == 2)
    v3 = CFSTR("SMSLess");
  if (a3 == 1)
    return CFSTR("SMS");
  else
    return (id)v3;
}

- (IDSCTPNRValidationMechanism)initWithType:(int64_t)a3 context:(id)a4
{
  id v6;
  IDSCTPNRValidationMechanism *v7;
  const char *v8;
  uint64_t v9;
  double v10;
  IDSCTPNRValidationMechanism *v11;
  uint64_t v12;
  NSString *context;
  objc_super v15;

  v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)IDSCTPNRValidationMechanism;
  v7 = -[IDSCTPNRValidationMechanism init](&v15, sel_init);
  v11 = v7;
  if (v7)
  {
    v7->_type = a3;
    v12 = objc_msgSend_copy(v6, v8, v9, v10);
    context = v11->_context;
    v11->_context = (NSString *)v12;

  }
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  double v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  double v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  double v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  double v28;
  void *v29;
  const char *v30;
  double v31;
  char isEqual;
  BOOL v33;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v9 = objc_msgSend_type(self, v6, v7, v8);
    v13 = objc_msgSend_type(v5, v10, v11, v12);
    objc_msgSend_context(self, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_context(v5, v18, v19, v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17 == v23)
    {
      isEqual = 1;
    }
    else
    {
      objc_msgSend_context(self, v21, v22, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_context(v5, v26, v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      isEqual = objc_msgSend_isEqual_(v25, v30, (uint64_t)v29, v31);

    }
    if (v9 == v13)
      v33 = isEqual;
    else
      v33 = 0;

  }
  else
  {
    v33 = 0;
  }

  return v33;
}

- (unint64_t)hash
{
  uint64_t v2;
  double v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  double v12;
  unint64_t v13;

  objc_msgSend_context(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_hash(v5, v6, v7, v8);
  v13 = objc_msgSend_type(self, v10, v11, v12) ^ v9;

  return v13;
}

- (id)description
{
  uint64_t v2;
  double v3;
  unint64_t v5;
  const char *v6;
  uint64_t v7;
  double v8;
  __CFString *v9;
  void *v10;
  void *v11;
  const char *v12;
  double v13;
  void *v14;

  v5 = objc_msgSend_type(self, a2, v2, v3);
  if (v5 > 2)
    v9 = 0;
  else
    v9 = off_1E3C218C8[v5];
  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_context(self, v6, v7, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v10, v12, (uint64_t)CFSTR("IDSCTPRNValidationMechanism { Type: %@, Context: %@ }"), v13, v9, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

@end
