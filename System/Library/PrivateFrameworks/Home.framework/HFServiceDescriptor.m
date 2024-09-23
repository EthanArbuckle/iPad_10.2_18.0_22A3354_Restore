@implementation HFServiceDescriptor

- (HFServiceDescriptor)initWithServiceType:(id)a3 serviceSubtype:(id)a4 parentServiceDescriptorGenerator:(id)a5
{
  id v9;
  id v10;
  id v11;
  HFServiceDescriptor *v12;
  HFServiceDescriptor *v13;
  uint64_t v14;
  id parentServiceDescriptorGenerator;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HFServiceDescriptor;
  v12 = -[HFServiceDescriptor init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_serviceType, a3);
    objc_storeStrong((id *)&v13->_serviceSubtype, a4);
    v14 = objc_msgSend(v11, "copy");
    parentServiceDescriptorGenerator = v13->_parentServiceDescriptorGenerator;
    v13->_parentServiceDescriptorGenerator = (id)v14;

  }
  return v13;
}

void __34__HFServiceDescriptor_na_identity__block_invoke_2()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D519C8], "builder");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_13_5);
  v2 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_14_4);
  v3 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_16_1);
  objc_msgSend(v0, "build");
  v4 = objc_claimAutoreleasedReturnValue();

  v5 = (void *)qword_1ED3790F0;
  qword_1ED3790F0 = v4;

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

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend((id)objc_opt_class(), "na_identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hashOfObject:", self);

  return v4;
}

+ (NAIdentity)na_identity
{
  if (_MergedGlobals_252 != -1)
    dispatch_once(&_MergedGlobals_252, &__block_literal_global_8_3);
  return (NAIdentity *)(id)qword_1ED3790F0;
}

- (HFServiceDescriptor)initWithServiceType:(id)a3 serviceSubtype:(id)a4 parentServiceDescriptor:(id)a5
{
  id v8;
  id v9;
  HFServiceDescriptor *v10;
  _QWORD v12[4];
  id v13;

  v8 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __82__HFServiceDescriptor_initWithServiceType_serviceSubtype_parentServiceDescriptor___block_invoke;
  v12[3] = &unk_1EA7328D8;
  v13 = v8;
  v9 = v8;
  v10 = -[HFServiceDescriptor initWithServiceType:serviceSubtype:parentServiceDescriptorGenerator:](self, "initWithServiceType:serviceSubtype:parentServiceDescriptorGenerator:", a3, a4, v12);

  return v10;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (NSString)serviceSubtype
{
  return self->_serviceSubtype;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_parentServiceDescriptorGenerator, 0);
  objc_storeStrong((id *)&self->_serviceSubtype, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_parentServiceDescriptor, 0);
}

uint64_t __34__HFServiceDescriptor_na_identity__block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "parentServiceDescriptor");
}

uint64_t __34__HFServiceDescriptor_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serviceSubtype");
}

uint64_t __34__HFServiceDescriptor_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serviceType");
}

- (HFServiceDescriptor)parentServiceDescriptor
{
  HFServiceDescriptor *parentServiceDescriptor;
  void (**v4)(void);
  HFServiceDescriptor *v5;
  HFServiceDescriptor *v6;

  parentServiceDescriptor = self->_parentServiceDescriptor;
  if (!parentServiceDescriptor)
  {
    -[HFServiceDescriptor parentServiceDescriptorGenerator](self, "parentServiceDescriptorGenerator");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();
    v5 = (HFServiceDescriptor *)objc_claimAutoreleasedReturnValue();
    v6 = self->_parentServiceDescriptor;
    self->_parentServiceDescriptor = v5;

    parentServiceDescriptor = self->_parentServiceDescriptor;
  }
  return parentServiceDescriptor;
}

- (id)parentServiceDescriptorGenerator
{
  return self->_parentServiceDescriptorGenerator;
}

- (HFServiceDescriptor)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithServiceType_serviceSubtype_parentServiceDescriptor_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFServiceDescriptor.m"), 20, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFServiceDescriptor init]",
    v5);

  return 0;
}

id __82__HFServiceDescriptor_initWithServiceType_serviceSubtype_parentServiceDescriptor___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

@end
