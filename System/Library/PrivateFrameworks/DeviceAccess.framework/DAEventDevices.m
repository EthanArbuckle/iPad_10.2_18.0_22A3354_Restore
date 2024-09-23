@implementation DAEventDevices

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DAEventDevices)initWithCoder:(id)a3
{
  id v3;
  DAEventDevices *v4;
  DAEventDevices *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)DAEventDevices;
  v3 = a3;
  v4 = -[DAEvent initWithCoder:](&v15, sel_initWithCoder_, v3);
  if (v4)
  {
    objc_opt_class();
    NSDecodeNSArrayOfClassIfPresent();

    v5 = v4;
  }
  else
  {
    v7 = objc_opt_class();
    DAErrorF(350001, (uint64_t)"%@ init failed", v8, v9, v10, v11, v12, v13, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "failWithError:", v14);

  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSArray *devices;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)DAEventDevices;
  -[DAEvent encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  devices = self->_devices;
  if (devices)
    objc_msgSend(v4, "encodeObject:forKey:", devices, CFSTR("devi"));

}

- (DAEventDevices)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6;
  DAEventDevices *v7;
  DAEventDevices *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DAEventDevices;
  v7 = -[DAEvent initWithXPCObject:error:](&v10, sel_initWithXPCObject_error_, v6, a4);
  if (v7 && (objc_opt_class(), CUXPCDecodeNSArrayOfClass()))
    v8 = v7;
  else
    v8 = 0;

  return v8;
}

- (void)encodeWithXPCObject:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DAEventDevices;
  v3 = a3;
  -[DAEvent encodeWithXPCObject:](&v4, sel_encodeWithXPCObject_, v3);
  CUXPCEncodeNSArrayOfObjects();

}

- (DAEventDevices)initWithEventType:(int64_t)a3 devices:(id)a4
{
  id v7;
  DAEventDevices *v8;
  DAEventDevices *v9;
  DAEventDevices *v10;

  v7 = a4;
  v8 = -[DAEvent initWithEventType:](self, "initWithEventType:", a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_devices, a4);
    v10 = v9;
  }

  return v9;
}

- (DAEventDevices)initWithEventType:(int64_t)a3 devices:(id)a4 error:(id)a5
{
  id v9;
  DAEventDevices *v10;
  DAEventDevices *v11;
  DAEventDevices *v12;
  objc_super v14;

  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DAEventDevices;
  v10 = -[DAEvent initWithEventType:error:](&v14, sel_initWithEventType_error_, a3, a5);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_devices, a4);
    v12 = v11;
  }

  return v11;
}

- (id)descriptionWithLevel:(int)a3
{
  int v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  NSArray *devices;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  NSArray *v14;
  objc_super v15;
  int v16;

  if ((a3 & 0x8000000) != 0)
    v5 = 8;
  else
    v5 = 12;
  v16 = v5;
  v15.receiver = self;
  v15.super_class = (Class)DAEventDevices;
  -[DAEvent descriptionWithLevel:](&v15, sel_descriptionWithLevel_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (__CFString *)objc_msgSend(v6, "mutableCopy");

  if ((a3 & 0x8000000) == 0)
  {
    objc_opt_class();
    CUAppendF();
    v8 = v7;

    v7 = v8;
  }
  devices = self->_devices;
  if (devices)
  {
    v14 = devices;
    CUAppendF();
    v10 = v7;

    v7 = v10;
  }
  v11 = &stru_24D169BB8;
  if (v7)
    v11 = v7;
  v12 = v11;

  return v12;
}

- (NSArray)devices
{
  return self->_devices;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devices, 0);
}

@end
