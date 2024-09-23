@implementation HAP2ControllerReadRequest

- (HAP2ControllerReadRequest)initWithCharacteristics:(id)a3
{
  id v5;
  HAP2ControllerReadRequest *v6;
  HAP2ControllerReadRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HAP2ControllerReadRequest;
  v6 = -[HAP2ControllerReadRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_originalCharacteristics, a3);

  return v7;
}

- (BOOL)isEncrypted
{
  return 1;
}

- (unint64_t)type
{
  return 2;
}

- (id)serialize
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

- (NSArray)characteristics
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[HAP2ControllerReadRequest originalCharacteristics](self, "originalCharacteristics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HAP2ControllerReadRequest originalCharacteristics](self, "originalCharacteristics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __44__HAP2ControllerReadRequest_characteristics__block_invoke;
  v10[3] = &unk_1E894D098;
  v11 = v5;
  v7 = v5;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);

  v8 = (void *)objc_msgSend(v7, "copy");
  return (NSArray *)v8;
}

- (NSArray)originalCharacteristics
{
  return self->_originalCharacteristics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalCharacteristics, 0);
}

void __44__HAP2ControllerReadRequest_characteristics__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HAPCharacteristicWriteRequestTuple *v4;

  v3 = a2;
  v4 = objc_alloc_init(HAPCharacteristicWriteRequestTuple);
  -[HAPCharacteristicWriteRequestTuple setCharacteristic:](v4, "setCharacteristic:", v3);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
}

@end
