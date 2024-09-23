@implementation HPSConstrainedNumberSetting

- (HPSConstrainedNumberSetting)initWithKeyPath:(id)a3 numberValue:(id)a4 minimumValue:(id)a5 maximumValue:(id)a6 stepValue:(id)a7
{
  id v13;
  id v14;
  id v15;
  HPSConstrainedNumberSetting *v16;
  HPSConstrainedNumberSetting *v17;

  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = -[HPSNumberSetting initWithKeyPath:numberValue:](self, "initWithKeyPath:numberValue:", a3, a4);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_minimumValue, a5);
    objc_storeStrong((id *)&v17->_maximumValue, a6);
    objc_storeStrong((id *)&v17->_stepValue, a7);
  }

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HPSConstrainedNumberSetting;
  -[HPSSetting encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[HPSConstrainedNumberSetting minimumValue](self, "minimumValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("setting.minimum"));
  -[HPSConstrainedNumberSetting maximumValue](self, "maximumValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("setting.maximum"));
  -[HPSConstrainedNumberSetting stepValue](self, "stepValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("setting.step"));

}

- (HPSConstrainedNumberSetting)initWithCoder:(id)a3
{
  id v4;
  HPSConstrainedNumberSetting *v5;
  uint64_t v6;
  uint64_t v7;
  NSNumber *minimumValue;
  uint64_t v9;
  NSNumber *maximumValue;
  uint64_t v11;
  NSNumber *stepValue;
  HPSConstrainedNumberSetting *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HPSConstrainedNumberSetting;
  v5 = -[HPSSetting initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (!v5)
    goto LABEL_8;
  v6 = objc_opt_class();
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("setting.minimum")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("setting.minimum"));
    v7 = objc_claimAutoreleasedReturnValue();
    minimumValue = v5->_minimumValue;
    v5->_minimumValue = (NSNumber *)v7;

    if (!v5->_minimumValue)
      goto LABEL_9;
  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("setting.maximum")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("setting.maximum"));
    v9 = objc_claimAutoreleasedReturnValue();
    maximumValue = v5->_maximumValue;
    v5->_maximumValue = (NSNumber *)v9;

    if (!v5->_maximumValue)
      goto LABEL_9;
  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("setting.step"))
    && (objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("setting.step")),
        v11 = objc_claimAutoreleasedReturnValue(),
        stepValue = v5->_stepValue,
        v5->_stepValue = (NSNumber *)v11,
        stepValue,
        !v5->_stepValue))
  {
LABEL_9:
    v13 = 0;
  }
  else
  {
LABEL_8:
    v13 = v5;
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)minimumValue
{
  return self->_minimumValue;
}

- (NSNumber)maximumValue
{
  return self->_maximumValue;
}

- (NSNumber)stepValue
{
  return self->_stepValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stepValue, 0);
  objc_storeStrong((id *)&self->_maximumValue, 0);
  objc_storeStrong((id *)&self->_minimumValue, 0);
}

@end
