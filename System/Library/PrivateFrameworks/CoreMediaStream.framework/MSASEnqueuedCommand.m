@implementation MSASEnqueuedCommand

- (MSASEnqueuedCommand)init
{
  return -[MSASEnqueuedCommand initWithCommand:variantParam:invariantParam:](self, "initWithCommand:variantParam:invariantParam:", 0, 0, 0);
}

- (MSASEnqueuedCommand)initWithCommand:(id)a3 variantParam:(id)a4 invariantParam:(id)a5
{
  id v9;
  id v10;
  id v11;
  MSASEnqueuedCommand *v12;
  MSASEnqueuedCommand *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MSASEnqueuedCommand;
  v12 = -[MSASEnqueuedCommand init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_command, a3);
    objc_storeStrong((id *)&v13->_variantParam, a4);
    objc_storeStrong((id *)&v13->_invariantParam, a5);
  }

  return v13;
}

- (BOOL)canBeGroupedWithCommand:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  -[MSASEnqueuedCommand command](self, "command");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "command");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (MSObjectsAreEquivalent(v5, v6))
  {
    -[MSASEnqueuedCommand invariantParam](self, "invariantParam");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invariantParam");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MSObjectsAreEquivalent(v7, v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *command;
  NSDictionary *variantParam;
  NSDictionary *invariantParam;
  id v8;

  v4 = a3;
  command = self->_command;
  v8 = v4;
  if (command)
  {
    objc_msgSend(v4, "encodeObject:forKey:", command, CFSTR("command"));
    v4 = v8;
  }
  variantParam = self->_variantParam;
  if (variantParam)
  {
    objc_msgSend(v8, "encodeObject:forKey:", variantParam, CFSTR("variant"));
    v4 = v8;
  }
  invariantParam = self->_invariantParam;
  if (invariantParam)
  {
    objc_msgSend(v8, "encodeObject:forKey:", invariantParam, CFSTR("invariant"));
    v4 = v8;
  }

}

- (MSASEnqueuedCommand)initWithCoder:(id)a3
{
  id v4;
  MSASEnqueuedCommand *v5;
  uint64_t v6;
  NSString *command;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSDictionary *variantParam;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSDictionary *invariantParam;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)MSASEnqueuedCommand;
  v5 = -[MSASEnqueuedCommand init](&v29, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("command"));
    v6 = objc_claimAutoreleasedReturnValue();
    command = v5->_command;
    v5->_command = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, v13, v14, v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("variant"));
    v17 = objc_claimAutoreleasedReturnValue();
    variantParam = v5->_variantParam;
    v5->_variantParam = (NSDictionary *)v17;

    v19 = (void *)MEMORY[0x1E0C99E60];
    v20 = objc_opt_class();
    v21 = objc_opt_class();
    v22 = objc_opt_class();
    v23 = objc_opt_class();
    v24 = objc_opt_class();
    objc_msgSend(v19, "setWithObjects:", v20, v21, v22, v23, v24, objc_opt_class(), 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("invariant"));
    v26 = objc_claimAutoreleasedReturnValue();
    invariantParam = v5->_invariantParam;
    v5->_invariantParam = (NSDictionary *)v26;

  }
  return v5;
}

- (NSString)command
{
  return self->_command;
}

- (void)setCommand:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDictionary)variantParam
{
  return self->_variantParam;
}

- (void)setVariantParam:(id)a3
{
  objc_storeStrong((id *)&self->_variantParam, a3);
}

- (NSDictionary)invariantParam
{
  return self->_invariantParam;
}

- (void)setInvariantParam:(id)a3
{
  objc_storeStrong((id *)&self->_invariantParam, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invariantParam, 0);
  objc_storeStrong((id *)&self->_variantParam, 0);
  objc_storeStrong((id *)&self->_command, 0);
}

+ (id)command
{
  return objc_alloc_init(MSASEnqueuedCommand);
}

+ (id)commandwithCommand:(id)a3 variantParam:(id)a4 invariantParam:(id)a5
{
  id v7;
  id v8;
  id v9;
  MSASEnqueuedCommand *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[MSASEnqueuedCommand initWithCommand:variantParam:invariantParam:]([MSASEnqueuedCommand alloc], "initWithCommand:variantParam:invariantParam:", v9, v8, v7);

  return v10;
}

@end
