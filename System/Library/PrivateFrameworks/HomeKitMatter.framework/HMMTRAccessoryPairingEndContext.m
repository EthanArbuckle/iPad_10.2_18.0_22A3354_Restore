@implementation HMMTRAccessoryPairingEndContext

- (HMMTRAccessoryPairingEndContext)initWithStep:(id)a3 error:(id)a4 sourceErrorDomain:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMMTRAccessoryPairingEndContext *v12;
  HMMTRAccessoryPairingEndContext *v13;
  uint64_t v14;
  NSError *error;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HMMTRAccessoryPairingEndContext;
  v12 = -[HMMTRAccessoryPairingEndContext init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_step, a3);
    v14 = objc_msgSend(v10, "copy");
    error = v13->_error;
    v13->_error = (NSError *)v14;

    objc_storeStrong((id *)&v13->_sourceErrorDomain, a5);
  }

  return v13;
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
  void *v13;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMMTRAccessoryPairingEndContext step](self, "step");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HMMTRAccessoryPairingStepAsString(objc_msgSend(v4, "unsignedIntValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Step"), v5);
  v7 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMMTRAccessoryPairingEndContext error](self, "error", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("Error"), v8);
  v15[1] = v9;
  v10 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMMTRAccessoryPairingEndContext sourceErrorDomain](self, "sourceErrorDomain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithName:value:", CFSTR("SourceErrorDomain"), v11);
  v15[2] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceErrorDomain, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_step, 0);
}

+ (id)hapContextWithStep:(unint64_t)a3 error:(id)a4
{
  id v5;
  HMMTRAccessoryPairingEndContext *v6;
  void *v7;
  HMMTRAccessoryPairingEndContext *v8;

  v5 = a4;
  v6 = [HMMTRAccessoryPairingEndContext alloc];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMMTRAccessoryPairingEndContext initWithStep:error:sourceErrorDomain:](v6, "initWithStep:error:sourceErrorDomain:", v7, v5, *MEMORY[0x24BE1B690]);

  return v8;
}

+ (id)hmmtrContextWithStep:(unint64_t)a3 error:(id)a4
{
  id v5;
  HMMTRAccessoryPairingEndContext *v6;
  void *v7;
  HMMTRAccessoryPairingEndContext *v8;

  v5 = a4;
  v6 = [HMMTRAccessoryPairingEndContext alloc];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMMTRAccessoryPairingEndContext initWithStep:error:sourceErrorDomain:](v6, "initWithStep:error:sourceErrorDomain:", v7, v5, CFSTR("HMMTRErrorDomain"));

  return v8;
}

+ (id)mtrContextWithStep:(unint64_t)a3 error:(id)a4
{
  id v5;
  HMMTRAccessoryPairingEndContext *v6;
  void *v7;
  HMMTRAccessoryPairingEndContext *v8;

  v5 = a4;
  v6 = [HMMTRAccessoryPairingEndContext alloc];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMMTRAccessoryPairingEndContext initWithStep:error:sourceErrorDomain:](v6, "initWithStep:error:sourceErrorDomain:", v7, v5, *MEMORY[0x24BDDB490]);

  return v8;
}

+ (id)hmmtrContextWithCancelledError:(id)a3
{
  id v3;
  HMMTRAccessoryPairingEndContext *v4;

  v3 = a3;
  v4 = -[HMMTRAccessoryPairingEndContext initWithStep:error:sourceErrorDomain:]([HMMTRAccessoryPairingEndContext alloc], "initWithStep:error:sourceErrorDomain:", 0, v3, CFSTR("HMMTRErrorDomain"));

  return v4;
}

+ (id)otherContextWithStep:(unint64_t)a3 error:(id)a4
{
  id v5;
  HMMTRAccessoryPairingEndContext *v6;
  void *v7;
  void *v8;
  HMMTRAccessoryPairingEndContext *v9;

  v5 = a4;
  v6 = [HMMTRAccessoryPairingEndContext alloc];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMMTRAccessoryPairingEndContext initWithStep:error:sourceErrorDomain:](v6, "initWithStep:error:sourceErrorDomain:", v7, v5, v8);

  return v9;
}

@end
