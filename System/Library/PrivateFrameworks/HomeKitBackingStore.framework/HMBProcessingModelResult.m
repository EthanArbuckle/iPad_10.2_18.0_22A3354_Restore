@implementation HMBProcessingModelResult

- (HMBProcessingModelResult)initWithModel:(id)a3 options:(id)a4 mirrorOutputFuture:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  HMBProcessingModelResult *v13;
  HMBProcessingModelResult *v14;
  HMBProcessingModelResult *v16;
  SEL v17;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  if (!v10)
  {
LABEL_7:
    v16 = (HMBProcessingModelResult *)_HMFPreconditionFailure();
    return (HMBProcessingModelResult *)-[HMBProcessingModelResult attributeDescriptions](v16, v17);
  }
  v12 = v11;
  v18.receiver = self;
  v18.super_class = (Class)HMBProcessingModelResult;
  v13 = -[HMBProcessingModelResult init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_model, a3);
    objc_storeStrong((id *)&v14->_options, a4);
    objc_storeStrong((id *)&v14->_mirrorOutputFuture, a5);
  }

  return v14;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMBProcessingModelResult model](self, "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Model"), v4);
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMBProcessingModelResult options](self, "options", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Options"), v7);
  v15[1] = v8;
  v9 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMBProcessingModelResult mirrorOutputFuture](self, "mirrorOutputFuture");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    v11 = CFSTR("<not nil>");
  else
    v11 = CFSTR("<nil>");
  v12 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("Mirror Output"), v11);
  v15[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (HMBModel)model
{
  return (HMBModel *)objc_getProperty(self, a2, 8, 1);
}

- (HMBProcessingOptions)options
{
  return (HMBProcessingOptions *)objc_getProperty(self, a2, 16, 1);
}

- (NAFuture)mirrorOutputFuture
{
  return (NAFuture *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mirrorOutputFuture, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

+ (id)alloc
{
  uint64_t v3;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  objc_super v9;

  v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99778];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot create a direct instance of %@. Use a subclass instead"), objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v8);
  }
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___HMBProcessingModelResult;
  return objc_msgSendSuper2(&v9, sel_alloc);
}

@end
