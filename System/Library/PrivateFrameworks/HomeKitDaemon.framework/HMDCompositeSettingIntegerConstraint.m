@implementation HMDCompositeSettingIntegerConstraint

- (HMDCompositeSettingIntegerConstraint)initWithMaxValue:(int64_t)a3 minValue:(int64_t)a4 stepValue:(int64_t)a5
{
  HMDCompositeSettingIntegerConstraint *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HMDCompositeSettingIntegerConstraint;
  result = -[HMDCompositeSettingIntegerConstraint init](&v9, sel_init);
  if (result)
  {
    result->_min = a4;
    result->_max = a3;
    result->_step = a5;
  }
  return result;
}

- (BOOL)isValidValue:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  int64_t v14;
  int64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  int64_t v20;
  int64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;

  v6 = a3;
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_2557CA1E8))
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;
  v9 = v8;
  if (!v8)
  {
    v25 = 0;
    if (!a4)
      goto LABEL_22;
    goto LABEL_20;
  }
  objc_msgSend(v8, "numberValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");
  objc_msgSend(v9, "numberValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "integerValue");

  v14 = -[HMDCompositeSettingIntegerConstraint max](self, "max");
  if (v13 >= v14)
    v15 = v14;
  else
    v15 = v13;
  if (v11 == v15)
  {
    objc_msgSend(v9, "numberValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "integerValue");
    objc_msgSend(v9, "numberValue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "integerValue");

    v20 = -[HMDCompositeSettingIntegerConstraint min](self, "min");
    if (v19 <= v20)
      v21 = v20;
    else
      v21 = v19;
    if (v17 == v21)
    {
      objc_msgSend(v9, "numberValue");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "integerValue");
      v24 = v23 - -[HMDCompositeSettingIntegerConstraint min](self, "min");
      v25 = v24 % -[HMDCompositeSettingIntegerConstraint step](self, "step") == 0;

    }
    else
    {
      v25 = 0;
    }

  }
  else
  {
    v25 = 0;
  }

  if (a4)
  {
LABEL_20:
    if (!v25)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 5);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_22:

  return v25;
}

- (int64_t)min
{
  return self->_min;
}

- (int64_t)max
{
  return self->_max;
}

- (int64_t)step
{
  return self->_step;
}

@end
