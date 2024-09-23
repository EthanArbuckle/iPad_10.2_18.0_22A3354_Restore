@implementation HFPowerStateTargetValueTuple

void __43__HFPowerStateTargetValueTuple_na_identity__block_invoke_2()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D519C8], "builder");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_13);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "appendCharacteristic:", &__block_literal_global_15_0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "appendCharacteristic:", &__block_literal_global_16);

  objc_msgSend(v0, "build");
  v4 = objc_claimAutoreleasedReturnValue();

  v5 = (void *)qword_1F03ED248;
  qword_1F03ED248 = v4;

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
  if (_MergedGlobals_6_0 != -1)
    dispatch_once(&_MergedGlobals_6_0, &__block_literal_global_8);
  return (NAIdentity *)(id)qword_1F03ED248;
}

- (NSString)characteristicType
{
  return self->_characteristicType;
}

- (int64_t)primaryStateForTargetValue:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int64_t v7;

  v4 = a3;
  -[HFPowerStateTargetValueTuple onTargetValue](self, "onTargetValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
    v7 = 2;
  else
    v7 = 1;

  return v7;
}

- (NSNumber)onTargetValue
{
  return self->_onTargetValue;
}

uint64_t __43__HFPowerStateTargetValueTuple_na_identity__block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "offTargetValue");
}

uint64_t __43__HFPowerStateTargetValueTuple_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "onTargetValue");
}

uint64_t __43__HFPowerStateTargetValueTuple_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "characteristicType");
}

- (NSNumber)offTargetValue
{
  return self->_offTargetValue;
}

- (HFPowerStateTargetValueTuple)initWithCharacteristicType:(id)a3 onTargetValue:(id)a4 offTargetValue:(id)a5
{
  id v9;
  id v10;
  id v11;
  HFPowerStateTargetValueTuple *v12;
  HFPowerStateTargetValueTuple *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HFPowerStateTargetValueTuple;
  v12 = -[HFPowerStateTargetValueTuple init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_characteristicType, a3);
    objc_storeStrong((id *)&v13->_onTargetValue, a4);
    objc_storeStrong((id *)&v13->_offTargetValue, a5);
  }

  return v13;
}

+ (id)fanStateTargetValueTuple
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCharacteristicType:onTargetValue:offTargetValue:", *MEMORY[0x1E0CB8AB0], &unk_1EA7CB818, 0);
}

- (HFPowerStateTargetValueTuple)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithCharacteristicType_onTargetValue_offTargetValue_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFPowerStateControlItem.m"), 34, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFPowerStateTargetValueTuple init]",
    v5);

  return 0;
}

- (id)targetValueForPrimaryState:(int64_t)a3
{
  if (a3 == 2)
    -[HFPowerStateTargetValueTuple onTargetValue](self, "onTargetValue");
  else
    -[HFPowerStateTargetValueTuple offTargetValue](self, "offTargetValue");
  return (id)objc_claimAutoreleasedReturnValue();
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offTargetValue, 0);
  objc_storeStrong((id *)&self->_onTargetValue, 0);
  objc_storeStrong((id *)&self->_characteristicType, 0);
}

@end
