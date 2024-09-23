@implementation HFRelativePercentValue

- (NSNumber)value
{
  return self->_value;
}

- (HFRelativePercentValue)initWithCharacteristicReadResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HFRelativePercentValue *v7;

  v4 = a3;
  objc_msgSend(v4, "valueWithExpectedClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "characteristic");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[HFRelativePercentValue initWithValue:forCharacteristic:](self, "initWithValue:forCharacteristic:", v5, v6);
  return v7;
}

- (HFRelativePercentValue)initWithValue:(id)a3 forCharacteristic:(id)a4
{
  id v7;
  id v8;
  HFRelativePercentValue *v9;
  id *p_isa;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  HFRelativePercentValue *v23;
  objc_super v25;

  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v25.receiver = self;
    v25.super_class = (Class)HFRelativePercentValue;
    v9 = -[HFRelativePercentValue init](&v25, sel_init);
    p_isa = (id *)&v9->super.isa;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_value, a3);
      objc_msgSend(v8, "metadata");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "minimumValue");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      if (v12)
        v14 = (void *)v12;
      else
        v14 = &unk_1EA7CD820;
      objc_storeStrong(p_isa + 2, v14);

      objc_msgSend(v8, "metadata");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "maximumValue");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v16;
      if (v16)
        v18 = (void *)v16;
      else
        v18 = &unk_1EA7CD830;
      objc_storeStrong(p_isa + 3, v18);

      objc_msgSend(v8, "metadata");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stepValue");
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v20;
      if (v20)
        v22 = (void *)v20;
      else
        v22 = &unk_1EA7CD840;
      objc_storeStrong(p_isa + 4, v22);

    }
    self = p_isa;
    v23 = self;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stepValue, 0);
  objc_storeStrong((id *)&self->_maximumValue, 0);
  objc_storeStrong((id *)&self->_minimumValue, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[HFRelativePercentValue value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:", v5);

  -[HFRelativePercentValue minimumValue](self, "minimumValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMinimumValue:", v6);

  -[HFRelativePercentValue maximumValue](self, "maximumValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaximumValue:", v7);

  -[HFRelativePercentValue stepValue](self, "stepValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStepValue:", v8);

  return v4;
}

+ (NAIdentity)na_identity
{
  if (_MergedGlobals_241 != -1)
    dispatch_once(&_MergedGlobals_241, &__block_literal_global_4_2);
  return (NAIdentity *)(id)qword_1ED378FD0;
}

void __37__HFRelativePercentValue_na_identity__block_invoke_2()
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
  v1 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_9_4);
  v2 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_10_3);
  v3 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_11_4);
  v4 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_12_2);
  objc_msgSend(v0, "build");
  v5 = objc_claimAutoreleasedReturnValue();

  v6 = (void *)qword_1ED378FD0;
  qword_1ED378FD0 = v5;

}

uint64_t __37__HFRelativePercentValue_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "value");
}

uint64_t __37__HFRelativePercentValue_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "minimumValue");
}

uint64_t __37__HFRelativePercentValue_na_identity__block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "maximumValue");
}

uint64_t __37__HFRelativePercentValue_na_identity__block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stepValue");
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

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFRelativePercentValue value](self, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("value"));

  -[HFRelativePercentValue minimumValue](self, "minimumValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v6, CFSTR("min"), 1);

  -[HFRelativePercentValue maximumValue](self, "maximumValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v8, CFSTR("max"), 1);

  -[HFRelativePercentValue stepValue](self, "stepValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v10, CFSTR("step"), 1);

  objc_msgSend(v3, "build");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (void)setValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)minimumValue
{
  return self->_minimumValue;
}

- (void)setMinimumValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)maximumValue
{
  return self->_maximumValue;
}

- (void)setMaximumValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)stepValue
{
  return self->_stepValue;
}

- (void)setStepValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

@end
