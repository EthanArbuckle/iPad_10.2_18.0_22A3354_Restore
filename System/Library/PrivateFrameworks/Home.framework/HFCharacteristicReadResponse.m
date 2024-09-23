@implementation HFCharacteristicReadResponse

uint64_t __43__HFCharacteristicReadResponse_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "characteristic");
}

uint64_t __43__HFCharacteristicReadResponse_na_identity__block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "error");
}

uint64_t __43__HFCharacteristicReadResponse_na_identity__block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "value");
}

uint64_t __43__HFCharacteristicReadResponse_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "readTraits");
}

- (id)valueWithExpectedClass:(Class)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  -[HFCharacteristicReadResponse value](self, "value");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[HFCharacteristicReadResponse value](self, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      -[HFCharacteristicReadResponse value](self, "value");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFCharacteristicReadResponse value](self, "value");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromClass(a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("Read value (%@) is of class %@, but the client expected a value of class %@"), v9, v12, v13);

    }
  }
  -[HFCharacteristicReadResponse value](self, "value");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[HFCharacteristicReadResponse value](self, "value");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)value
{
  return self->_value;
}

void __43__HFCharacteristicReadResponse_na_identity__block_invoke_2()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D519C8], "builder");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_7_12);
  v2 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_8_9);
  v3 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_9_12);
  v4 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_10_10);
  objc_msgSend(v0, "build");
  v5 = objc_claimAutoreleasedReturnValue();

  v6 = (void *)qword_1ED379958;
  qword_1ED379958 = v5;

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
  if (_MergedGlobals_292 != -1)
    dispatch_once(&_MergedGlobals_292, &__block_literal_global_3_12);
  return (NAIdentity *)(id)qword_1ED379958;
}

- (NSError)error
{
  return self->_error;
}

- (NSSet)readTraits
{
  return self->_readTraits;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_readTraits, 0);
  objc_storeStrong((id *)&self->_characteristic, 0);
}

- (HFCharacteristicReadResponse)initWithHomeKitResponse:(id)a3 value:(id)a4 readTraits:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  HFCharacteristicReadResponse *v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "request");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "characteristic");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "error");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[HFCharacteristicReadResponse initWithCharacteristic:readTraits:value:error:](self, "initWithCharacteristic:readTraits:value:error:", v12, v8, v9, v13);
  return v14;
}

- (HFCharacteristicReadResponse)initWithCharacteristic:(id)a3 readTraits:(id)a4 value:(id)a5 error:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HFCharacteristicReadResponse *v15;
  HFCharacteristicReadResponse *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HFCharacteristicReadResponse;
  v15 = -[HFCharacteristicReadResponse init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_characteristic, a3);
    objc_storeStrong((id *)&v16->_readTraits, a4);
    objc_storeStrong(&v16->_value, a5);
    objc_storeStrong((id *)&v16->_error, a6);
  }

  return v16;
}

- (HMCharacteristic)characteristic
{
  return self->_characteristic;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCharacteristicReadResponse characteristic](self, "characteristic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_prettyDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", v5, CFSTR("characteristic"));

  -[HFCharacteristicReadResponse readTraits](self, "readTraits");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    -[HFCharacteristicReadResponse readTraits](self, "readTraits");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sortedArrayUsingSelector:", sel_compare_);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "componentsJoinedByString:", CFSTR(", "));
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = CFSTR("(none)");
  }

  v12 = (id)objc_msgSend(v3, "appendObject:withName:", v11, CFSTR("readTraits"));
  -[HFCharacteristicReadResponse value](self, "value");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v13, CFSTR("value"), 1);

  -[HFCharacteristicReadResponse error](self, "error");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v15, CFSTR("error"), 1);

  objc_msgSend(v3, "build");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v17;
}

@end
