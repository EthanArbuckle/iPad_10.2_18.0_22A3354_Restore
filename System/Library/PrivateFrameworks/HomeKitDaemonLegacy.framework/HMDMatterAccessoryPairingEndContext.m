@implementation HMDMatterAccessoryPairingEndContext

- (HMDMatterAccessoryPairingEndContext)initWithStep:(id)a3 error:(id)a4 sourceErrorDomain:(id)a5 isCancelled:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  HMDMatterAccessoryPairingEndContext *v14;
  HMDMatterAccessoryPairingEndContext *v15;
  uint64_t v16;
  NSError *error;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HMDMatterAccessoryPairingEndContext;
  v14 = -[HMDMatterAccessoryPairingEndContext init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_step, a3);
    v16 = objc_msgSend(v12, "copy");
    error = v15->_error;
    v15->_error = (NSError *)v16;

    objc_storeStrong((id *)&v15->_sourceErrorDomain, a5);
    v15->_isCancelled = a6;
  }

  return v15;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDMatterAccessoryPairingEndContext step](self, "step");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HMDMatterAccessoryPairingStepAsString(objc_msgSend(v4, "unsignedIntValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Step"), v5);
  v18[0] = v6;
  v7 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDMatterAccessoryPairingEndContext error](self, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("Error"), v8);
  v18[1] = v9;
  v10 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDMatterAccessoryPairingEndContext sourceErrorDomain](self, "sourceErrorDomain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithName:value:", CFSTR("SourceErrorDomain"), v11);
  v18[2] = v12;
  v13 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDMatterAccessoryPairingEndContext isCancelled](self, "isCancelled");
  HMFBooleanToString();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithName:value:", CFSTR("IsCancelled"), v14);
  v18[3] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (NSNumber)step
{
  return self->_step;
}

- (NSError)error
{
  return self->_error;
}

- (NSString)sourceErrorDomain
{
  return self->_sourceErrorDomain;
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceErrorDomain, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_step, 0);
}

+ (id)contextFromMTRContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;
  HMDMatterAccessoryPairingEndContext *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  HMDMatterAccessoryPairingEndContext *v13;

  v3 = a3;
  objc_msgSend(v3, "step");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "step");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntValue");

  v7 = [HMDMatterAccessoryPairingEndContext alloc];
  objc_msgSend(v3, "step");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if ((unint64_t)v6 - 1 < 0x16)
      v9 = v6 + 1;
    else
      v9 = 0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v3, "error");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sourceErrorDomain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HMDMatterAccessoryPairingEndContext initWithStep:error:sourceErrorDomain:isCancelled:](v7, "initWithStep:error:sourceErrorDomain:isCancelled:", v10, v11, v12, v4 == 0);

  if (v8)
  return v13;
}

+ (id)pairingCompletedContext
{
  return -[HMDMatterAccessoryPairingEndContext initWithStep:error:sourceErrorDomain:isCancelled:]([HMDMatterAccessoryPairingEndContext alloc], "initWithStep:error:sourceErrorDomain:isCancelled:", &unk_1E8B33258, 0, 0, 0);
}

+ (id)hmContextWithCancelledError:(id)a3
{
  id v3;
  HMDMatterAccessoryPairingEndContext *v4;
  HMDMatterAccessoryPairingEndContext *v5;

  v3 = a3;
  v4 = [HMDMatterAccessoryPairingEndContext alloc];
  v5 = -[HMDMatterAccessoryPairingEndContext initWithStep:error:sourceErrorDomain:isCancelled:](v4, "initWithStep:error:sourceErrorDomain:isCancelled:", 0, v3, *MEMORY[0x1E0CB8C70], 1);

  return v5;
}

+ (id)hmdContextWithStep:(unint64_t)a3 error:(id)a4
{
  id v5;
  HMDMatterAccessoryPairingEndContext *v6;
  void *v7;
  HMDMatterAccessoryPairingEndContext *v8;

  v5 = a4;
  v6 = [HMDMatterAccessoryPairingEndContext alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMDMatterAccessoryPairingEndContext initWithStep:error:sourceErrorDomain:isCancelled:](v6, "initWithStep:error:sourceErrorDomain:isCancelled:", v7, v5, CFSTR("HMDErrorDomain"), 0);

  return v8;
}

+ (id)hmdContextWithCancelledError:(id)a3
{
  id v3;
  HMDMatterAccessoryPairingEndContext *v4;

  v3 = a3;
  v4 = -[HMDMatterAccessoryPairingEndContext initWithStep:error:sourceErrorDomain:isCancelled:]([HMDMatterAccessoryPairingEndContext alloc], "initWithStep:error:sourceErrorDomain:isCancelled:", 0, v3, CFSTR("HMDErrorDomain"), 1);

  return v4;
}

+ (id)hmmtrContextWithStep:(unint64_t)a3 error:(id)a4
{
  id v5;
  HMDMatterAccessoryPairingEndContext *v6;
  void *v7;
  HMDMatterAccessoryPairingEndContext *v8;

  v5 = a4;
  v6 = [HMDMatterAccessoryPairingEndContext alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMDMatterAccessoryPairingEndContext initWithStep:error:sourceErrorDomain:isCancelled:](v6, "initWithStep:error:sourceErrorDomain:isCancelled:", v7, v5, *MEMORY[0x1E0D331B0], 0);

  return v8;
}

@end
