@implementation HFServiceState

+ (Class)stateClassForServiceDescriptor:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  void *v13;

  v3 = a3;
  objc_msgSend(v3, "serviceSubtype");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4 || objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB9988]))
  {
    v6 = (void *)MEMORY[0x1E0CBA7E0];
    objc_msgSend(v3, "serviceType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hf_defaultServiceSubtypeForServiceType:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }
  objc_msgSend(v3, "serviceType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB9B08]);

  if (v10)
  {
    if (_MergedGlobals_15 != -1)
      dispatch_once(&_MergedGlobals_15, &__block_literal_global_7_11);
    v11 = (id)qword_1ED378738;
    objc_msgSend(v11, "objectForKeyedSubscript:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (qword_1ED378740 != -1)
      dispatch_once(&qword_1ED378740, &__block_literal_global_14_11);
    v11 = (id)qword_1ED378748;
    objc_msgSend(v3, "serviceType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (Class)v12;
}

- (BOOL)isTransitioning
{
  return 0;
}

+ (NSSet)optionalCharacteristicTypes
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

void __49__HFServiceState_stateClassForServiceDescriptor___block_invoke_2()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[4];
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v2[0] = *MEMORY[0x1E0CB9978];
  v3[0] = objc_opt_class();
  v2[1] = *MEMORY[0x1E0CB9980];
  v3[1] = objc_opt_class();
  v2[2] = *MEMORY[0x1E0CB9970];
  v3[2] = objc_opt_class();
  v2[3] = *MEMORY[0x1E0CB9990];
  v3[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED378738;
  qword_1ED378738 = v0;

}

void __49__HFServiceState_stateClassForServiceDescriptor___block_invoke_5()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[4];
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v2[0] = *MEMORY[0x1E0CB9A18];
  v3[0] = objc_opt_class();
  v2[1] = *MEMORY[0x1E0CB9A50];
  v3[1] = objc_opt_class();
  v2[2] = *MEMORY[0x1E0CB9B18];
  v3[2] = objc_opt_class();
  v2[3] = *MEMORY[0x1E0CB9B20];
  v3[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED378748;
  qword_1ED378748 = v0;

}

+ (NSString)stateClassIdentifier
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HFServiceState.m"), 21, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "+[HFServiceState stateClassIdentifier]", objc_opt_class());

  return 0;
}

+ (NSSet)requiredCharacteristicTypes
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (HFServiceState)initWithBatchReadResponse:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFServiceState.m"), 37, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HFServiceState initWithBatchReadResponse:]", objc_opt_class());

  return 0;
}

+ (id)stateForServiceDescriptor:(id)a3 withBatchReadResponse:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "stateClassForServiceDescriptor:", a3)), "initWithBatchReadResponse:", v6);

  return v7;
}

+ (NAIdentity)na_identity
{
  if (qword_1ED378750 != -1)
    dispatch_once(&qword_1ED378750, &__block_literal_global_19_7);
  return (NAIdentity *)(id)qword_1ED378758;
}

void __29__HFServiceState_na_identity__block_invoke_2()
{
  void *v0;
  id v1;
  id v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D519C8], "builder");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_24_5);
  v2 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_25_2);
  objc_msgSend(v0, "build");
  v3 = objc_claimAutoreleasedReturnValue();

  v4 = (void *)qword_1ED378758;
  qword_1ED378758 = v3;

}

uint64_t __29__HFServiceState_na_identity__block_invoke_4()
{
  return objc_msgSend((id)objc_opt_class(), "stateClassIdentifier");
}

uint64_t __29__HFServiceState_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stateTypeIdentifier");
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend((id)objc_opt_class(), "na_identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hashOfObject:", self);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "na_identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v5, "isObject:equalToObject:", self, v4);

  return (char)self;
}

@end
