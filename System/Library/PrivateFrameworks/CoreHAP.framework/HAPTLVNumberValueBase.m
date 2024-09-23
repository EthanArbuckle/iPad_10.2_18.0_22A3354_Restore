@implementation HAPTLVNumberValueBase

- (HAPTLVNumberValueBase)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HAPTLVNumberValueBase;
  return -[HAPTLVNumberValueBase init](&v3, sel_init);
}

- (HAPTLVNumberValueBase)initWithValue:(id)a3
{
  id v5;
  HAPTLVNumberValueBase *v6;
  HAPTLVNumberValueBase *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HAPTLVNumberValueBase;
  v6 = -[HAPTLVNumberValueBase init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_value, a3);

  return v7;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  unsigned int v11;

  v6 = a3;
  if (objc_msgSend(v6, "length"))
  {
    v11 = 0;
    v7 = objc_retainAutorelease(v6);
    -[HAPTLVNumberValueBase _parseFromData:length:status:](self, "_parseFromData:length:status:", objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"), &v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v11 == 0;
    if (v11)
    {
      if (a4)
      {
        HMErrorFromOSStatus(v11);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      -[HAPTLVNumberValueBase setValue:](self, "setValue:", v8);
    }

  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 3);
    v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_parseFromData:(const char *)a3 length:(unint64_t)a4 status:(int *)a5
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ is unavailable"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (id)serializeWithError:(id *)a3
{
  void *v5;
  void *v6;
  id v7;

  if (a3
    && (-[HAPTLVNumberValueBase value](self, "value"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        !v5))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 8);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v6 = 0;
    *a3 = v7;
  }
  else
  {
    -[HAPTLVNumberValueBase _serialize](self, "_serialize");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)_serialize
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (id)copyWithZone:(_NSZone *)a3
{
  HAPTLVNumberValueBase *v4;
  void *v5;
  HAPTLVNumberValueBase *v6;

  v4 = +[HAPTLVNumberValueBase allocWithZone:](HAPTLVNumberValueBase, "allocWithZone:", a3);
  -[HAPTLVNumberValueBase value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HAPTLVNumberValueBase initWithValue:](v4, "initWithValue:", v5);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  HAPTLVNumberValueBase *v4;
  HAPTLVNumberValueBase *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (HAPTLVNumberValueBase *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[HAPTLVNumberValueBase value](self, "value");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPTLVNumberValueBase value](v5, "value");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqualToNumber:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (NSNumber)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

@end
