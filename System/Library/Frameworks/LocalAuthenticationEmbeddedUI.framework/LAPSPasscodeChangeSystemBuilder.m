@implementation LAPSPasscodeChangeSystemBuilder

+ (id)passcodeChangeSystem
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "_defaultSystemOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "passcodeChangeSystemWithOptions:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)passcodeChangeSystemWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(a1, "_useStubbedAdapter"))
  {
    objc_msgSend(a1, "_passcodeStubbedSystem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "_persistence");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "passcodeChangeSystemWithPersistence:options:", v6, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

+ (id)passcodeRecoverySystem
{
  void *v3;
  void *v4;

  if (objc_msgSend(a1, "_useStubbedAdapter"))
  {
    objc_msgSend(a1, "_passcodeStubbedSystem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "_persistence");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "passcodeRecoverySystemWithPersistence:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

+ (id)passcodeRemovalSystem
{
  void *v3;
  void *v4;

  if (objc_msgSend(a1, "_useStubbedAdapter"))
  {
    objc_msgSend(a1, "_passcodeStubbedSystem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "_persistence");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "passcodeRemovalSystemWithPersistence:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

+ (id)passcodeVerificationSystem
{
  void *v3;
  void *v4;

  if (objc_msgSend(a1, "_useStubbedAdapter"))
  {
    objc_msgSend(a1, "_passcodeStubbedSystem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "_persistence");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "passcodeVerificationSystemWithPersistence:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

+ (id)passcodeChangeSystemWithPersistence:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "_defaultSystemOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "passcodeChangeSystemWithPersistence:options:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)passcodeChangeSystemWithPersistence:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  LAPSPasscodeChangeSystemStandardAdapter *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = -[LAPSPasscodeChangeSystemStandardAdapter initWithPersistence:options:]([LAPSPasscodeChangeSystemStandardAdapter alloc], "initWithPersistence:options:", v7, v6);

  objc_msgSend(a1, "_decoratedSystem:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)passcodeRecoverySystemWithPersistence:(id)a3
{
  id v4;
  LAPSPasscodeChangeSystemRecoveryAdapter *v5;
  void *v6;

  v4 = a3;
  v5 = -[LAPSPasscodeChangeSystemRecoveryAdapter initWithPersistence:]([LAPSPasscodeChangeSystemRecoveryAdapter alloc], "initWithPersistence:", v4);

  objc_msgSend(a1, "_decoratedSystem:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)passcodeRemovalSystemWithPersistence:(id)a3
{
  id v4;
  LAPSPasscodeChangeSystemRemovalAdapter *v5;
  void *v6;

  v4 = a3;
  v5 = -[LAPSPasscodeChangeSystemRemovalAdapter initWithPersistence:]([LAPSPasscodeChangeSystemRemovalAdapter alloc], "initWithPersistence:", v4);

  objc_msgSend(a1, "_decoratedSystem:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)passcodeVerificationSystemWithPersistence:(id)a3
{
  id v4;
  LAPSPasscodeChangeSystemVerificationAdapter *v5;
  void *v6;

  v4 = a3;
  v5 = -[LAPSPasscodeChangeSystemVerificationAdapter initWithPersistence:]([LAPSPasscodeChangeSystemVerificationAdapter alloc], "initWithPersistence:", v4);

  objc_msgSend(a1, "_decoratedSystem:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)_useStubbedAdapter
{
  return 0;
}

+ (id)_passcodeStubbedSystem
{
  return objc_alloc_init(LAPSPasscodeChangeSystemStubbedAdapter);
}

+ (id)_persistence
{
  return objc_alloc_init(LAPSPasscodePersistenceAdapter);
}

+ (id)_decoratedSystem:(id)a3
{
  id v3;
  LAPSPasscodeChangeSystemDispatchDecorator *v4;

  v3 = a3;
  v4 = -[LAPSPasscodeChangeSystemDispatchDecorator initWithSystem:]([LAPSPasscodeChangeSystemDispatchDecorator alloc], "initWithSystem:", v3);

  return v4;
}

+ (id)_defaultSystemOptions
{
  return objc_alloc_init(LAPSPasscodeChangeSystemOptions);
}

@end
