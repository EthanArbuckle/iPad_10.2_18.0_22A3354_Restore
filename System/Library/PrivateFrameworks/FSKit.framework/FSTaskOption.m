@implementation FSTaskOption

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("This object may only be encoded by an NSXPCCoder."), 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v4);
  }
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasValue, CFSTR("FSTaskOption.hasValue"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_option, CFSTR("FSTaskOption.opt"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_optionValue, CFSTR("FSTaskOption.val"));

}

- (FSTaskOption)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  FSTaskOption *v7;
  id v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("This object may only be decoded by an NSXPCCoder."), 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v9);
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FSTaskOption.opt"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FSTaskOption.val"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[FSTaskOption initWithOption:value:hasValue:](self, "initWithOption:value:hasValue:", v5, v6, objc_msgSend(v4, "decodeBoolForKey:", CFSTR("FSTaskOption.hasValue")));

  return v7;
}

- (FSTaskOption)initWithOption:(id)a3 value:(id)a4 hasValue:(BOOL)a5
{
  id v9;
  id v10;
  FSTaskOption *v11;
  FSTaskOption *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FSTaskOption;
  v11 = -[FSTaskOption init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_hasValue = a5;
    objc_storeStrong((id *)&v11->_option, a3);
    objc_storeStrong((id *)&v12->_optionValue, a4);
  }

  return v12;
}

- (FSTaskOption)initWithOption:(id)a3 value:(id)a4
{
  return -[FSTaskOption initWithOption:value:hasValue:](self, "initWithOption:value:hasValue:", a3, a4, 1);
}

- (FSTaskOption)initWithOption:(id)a3
{
  return -[FSTaskOption initWithOption:value:hasValue:](self, "initWithOption:value:hasValue:", a3, &stru_250C33628, 0);
}

+ (id)option:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithOption:value:hasValue:", v7, v6, 1);

  return v8;
}

+ (id)optionWithoutValue:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithOption:value:hasValue:", v4, &stru_250C33628, 0);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  FSTaskOption *v4;
  FSTaskOption *v5;
  FSTaskOption *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  char v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;

  v4 = (FSTaskOption *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v11 = 1;
    goto LABEL_22;
  }
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v11 = 0;
    goto LABEL_22;
  }
  v6 = v5;
  -[FSTaskOption option](self, "option");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[FSTaskOption option](self, "option");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FSTaskOption option](v6, "option");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

  }
  else
  {
    v10 = 0;
  }

  -[FSTaskOption optionValue](self, "optionValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12
    && (-[FSTaskOption optionValue](v6, "optionValue"), (v13 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v14 = 1;
  }
  else
  {
    -[FSTaskOption optionValue](self, "optionValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v14 = 0;
    }
    else
    {
      -[FSTaskOption optionValue](v6, "optionValue");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v16 == 0;

    }
    if (!v12)
      goto LABEL_18;
    v13 = 0;
  }

LABEL_18:
  -[FSTaskOption optionValue](self, "optionValue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    -[FSTaskOption optionValue](self, "optionValue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[FSTaskOption optionValue](v6, "optionValue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "isEqual:", v19);

  }
  else
  {
    v20 = 1;
  }

  v11 = v10 & v14 & v20;
LABEL_22:

  return v11;
}

- (id)originalArgv
{
  __CFString *v3;
  uint64_t v4;
  void *v5;
  NSString *optionValue;
  void *v7;
  uint64_t *v8;
  uint64_t v9;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (!-[NSString length](self->_option, "length"))
    return MEMORY[0x24BDBD1A8];
  if (-[NSString length](self->_option, "length") <= 1)
    v3 = CFSTR("-");
  else
    v3 = CFSTR("--");
  -[__CFString stringByAppendingString:](v3, "stringByAppendingString:", self->_option);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (self->_hasValue)
  {
    optionValue = self->_optionValue;
    v13 = v4;
    v14 = optionValue;
    v7 = (void *)MEMORY[0x24BDBCE30];
    v8 = &v13;
    v9 = 2;
  }
  else
  {
    v12 = v4;
    v7 = (void *)MEMORY[0x24BDBCE30];
    v8 = &v12;
    v9 = 1;
  }
  objc_msgSend(v7, "arrayWithObjects:count:", v8, v9, v12, v13, v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)hasValue
{
  return self->_hasValue;
}

- (NSString)option
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)optionValue
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionValue, 0);
  objc_storeStrong((id *)&self->_option, 0);
}

@end
