@implementation HAP2EncodedCharacteristicRequestThread

- (HAP2EncodedCharacteristicRequestThread)initWithBTLERequests:(id)a3 requestType:(unint64_t)a4 enforcePDUBodyLength:(BOOL)a5
{
  id v9;
  HAP2EncodedCharacteristicRequestThread *v10;
  HAP2EncodedCharacteristicRequestThread *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HAP2EncodedCharacteristicRequestThread;
  v10 = -[HAP2EncodedCharacteristicRequestThread init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_internalCharacteristics, a3);
    v11->_requestType = a4;
    v11->_enforcePDUBodyLength = a5;
  }

  return v11;
}

- (NSArray)btleRequests
{
  if (self)
    self = (HAP2EncodedCharacteristicRequestThread *)self->_internalCharacteristics;
  return (NSArray *)self;
}

- (BOOL)isEncrypted
{
  void *v2;
  char v3;

  if (self)
    self = (HAP2EncodedCharacteristicRequestThread *)self->_internalCharacteristics;
  -[HAP2EncodedCharacteristicRequestThread firstObject](self, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEncrypted");

  return v3;
}

- (unint64_t)type
{
  if (self)
    return *(_QWORD *)(self + 24);
  return self;
}

- (NSArray)characteristics
{
  HAP2EncodedCharacteristicRequestThread *v2;
  void *v3;
  NSArray *internalCharacteristics;
  NSArray *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v2 = self;
  v3 = (void *)MEMORY[0x1E0C99DE8];
  if (self)
    internalCharacteristics = self->_internalCharacteristics;
  else
    internalCharacteristics = 0;
  v5 = internalCharacteristics;
  objc_msgSend(v3, "arrayWithCapacity:", -[NSArray count](v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    v2 = (HAP2EncodedCharacteristicRequestThread *)v2->_internalCharacteristics;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__HAP2EncodedCharacteristicRequestThread_characteristics__block_invoke;
  v10[3] = &unk_1E8949F68;
  v11 = v6;
  v7 = v6;
  -[HAP2EncodedCharacteristicRequestThread enumerateObjectsUsingBlock:](v2, "enumerateObjectsUsingBlock:", v10);
  v8 = (void *)objc_msgSend(v7, "copy");

  return (NSArray *)v8;
}

- (id)serialize
{
  void *v3;
  NSArray *internalCharacteristics;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;
  char v10;

  objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    internalCharacteristics = self->_internalCharacteristics;
  else
    internalCharacteristics = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__HAP2EncodedCharacteristicRequestThread_serialize__block_invoke;
  v8[3] = &unk_1E8949F90;
  v10 = 0;
  v8[4] = self;
  v9 = v3;
  v5 = v3;
  -[NSArray enumerateObjectsUsingBlock:](internalCharacteristics, "enumerateObjectsUsingBlock:", v8);
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalCharacteristics, 0);
}

void __51__HAP2EncodedCharacteristicRequestThread_serialize__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  __int16 v7;

  v3 = a2;
  objc_msgSend(v3, "serialize");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "replaceBytesInRange:withBytes:length:", 0, 0, a1 + 48, 1);
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    if (*(_BYTE *)(v5 + 8))
    {
      objc_msgSend(v3, "body");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        v7 = 0;
        objc_msgSend(v4, "appendBytes:length:", &v7, 2);
      }
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "appendData:", v4);

}

void __57__HAP2EncodedCharacteristicRequestThread_characteristics__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  HAPCharacteristicWriteRequestTuple *v6;

  v3 = a2;
  v6 = objc_alloc_init(HAPCharacteristicWriteRequestTuple);
  objc_msgSend(v3, "characteristic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPCharacteristicWriteRequestTuple setCharacteristic:](v6, "setCharacteristic:", v4);

  objc_msgSend(v3, "requestedValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HAPCharacteristicWriteRequestTuple setValue:](v6, "setValue:", v5);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

}

@end
