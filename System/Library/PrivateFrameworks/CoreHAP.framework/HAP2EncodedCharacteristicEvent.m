@implementation HAP2EncodedCharacteristicEvent

- (HAP2EncodedCharacteristicEvent)init
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

- (HAP2EncodedCharacteristicEvent)initWithInstanceID:(id)a3 encodedValueData:(id)a4 encodedContextData:(id)a5
{
  id v9;
  id v10;
  id v11;
  HAP2EncodedCharacteristicEvent *v12;
  HAP2EncodedCharacteristicEvent *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HAP2EncodedCharacteristicEvent;
  v12 = -[HAP2EncodedCharacteristicEvent init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_instanceID, a3);
    objc_storeStrong((id *)&v13->_encodedValueData, a4);
    objc_storeStrong((id *)&v13->_encodedContextData, a5);
  }

  return v13;
}

- (NSNumber)instanceID
{
  return self->_instanceID;
}

- (HAP2AccessoryCharacteristicEncodedData)encodedValueData
{
  return self->_encodedValueData;
}

- (NSData)encodedContextData
{
  return self->_encodedContextData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encodedContextData, 0);
  objc_storeStrong((id *)&self->_encodedValueData, 0);
  objc_storeStrong((id *)&self->_instanceID, 0);
}

+ (id)new
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

@end
