@implementation ButtonSwitchInputs

- (BOOL)validateAndInitializePredicates:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  NSSet *v10;
  void *v11;
  unsigned int v12;
  __CFString **v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  void *v17;
  BOOL v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;

  v4 = a3;
  v27 = 0;
  -[ButtonSwitchInputs setPredicates:](self, "setPredicates:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("Button"), CFSTR("TouchButton"), CFSTR("Switch"), 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_stringFromRequiredKey:inSet:failed:", CFSTR("type"), v5, &v27));
  -[ButtonSwitchInputs setType:](self, "setType:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputs type](self, "type"));
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("Button"));

  if (v9)
  {
    v10 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("Home"), CFSTR("Sleep"), CFSTR("VolumeIncrement"), CFSTR("VolumeDecrement"), CFSTR("DigitalCrown"), CFSTR("Side"), CFSTR("App"), CFSTR("RingerButton"), 0);
LABEL_8:
    v16 = objc_claimAutoreleasedReturnValue(v10);

    v7 = (void *)v16;
    goto LABEL_9;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputs type](self, "type"));
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("TouchButton"));

  if (v12)
  {
    v13 = DAIdentifierCamera;
LABEL_7:
    v10 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", *v13, 0, v20, v21, v22, v23, v24, v25, v26);
    goto LABEL_8;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputs type](self, "type"));
  v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("Switch"));

  if (v15)
  {
    v13 = DAIdentifierRingerSwitch;
    goto LABEL_7;
  }
LABEL_9:
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_stringFromRequiredKey:inSet:failed:", CFSTR("identifier"), v7, &v27));
  -[ButtonSwitchInputs setIdentifier:](self, "setIdentifier:", v17);

  v18 = v27 == 0;
  return v18;
}

- (BOOL)validateAndInitializeSpecifications:(id)a3
{
  id v4;
  DAButtonSwitchSpecification *v5;
  void *v6;

  v4 = a3;
  -[ButtonSwitchInputs setSpecifications:](self, "setSpecifications:", v4);
  v5 = -[DAButtonSwitchSpecification initWithDictionary:]([DAButtonSwitchSpecification alloc], "initWithDictionary:", v4);

  -[ButtonSwitchInputs setButtonSwitchSpecification:](self, "setButtonSwitchSpecification:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputs buttonSwitchSpecification](self, "buttonSwitchSpecification"));
  LOBYTE(self) = v6 != 0;

  return (char)self;
}

- (BOOL)validateAndInitializeParameters:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  DAButtonParameters *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  DATouchButtonParameters *v11;
  void *v12;
  unsigned int v13;
  DASwitchParameters *v14;
  BOOL v15;

  v4 = a3;
  -[ButtonSwitchInputs setParameters:](self, "setParameters:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputs type](self, "type"));
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("Button"));

  if (v6)
  {
    v7 = -[DAButtonParameters initWithDictionary:]([DAButtonParameters alloc], "initWithDictionary:", v4);
    -[ButtonSwitchInputs setButtonParameters:](self, "setButtonParameters:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputs buttonParameters](self, "buttonParameters"));
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputs type](self, "type"));
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("TouchButton"));

    if (v10)
    {
      v11 = -[DATouchButtonParameters initWithDictionary:]([DATouchButtonParameters alloc], "initWithDictionary:", v4);
      -[ButtonSwitchInputs setTouchButtonParameters:](self, "setTouchButtonParameters:", v11);

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputs touchButtonParameters](self, "touchButtonParameters"));
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputs type](self, "type"));
      v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("Switch"));

      if (!v13)
      {
        v15 = 1;
        goto LABEL_8;
      }
      v14 = -[DASwitchParameters initWithDictionary:]([DASwitchParameters alloc], "initWithDictionary:", v4);
      -[ButtonSwitchInputs setSwitchParameters:](self, "setSwitchParameters:", v14);

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputs switchParameters](self, "switchParameters"));
    }
  }
  v15 = v8 != 0;

LABEL_8:
  return v15;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_storeStrong((id *)&self->_type, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (DAButtonParameters)buttonParameters
{
  return self->_buttonParameters;
}

- (void)setButtonParameters:(id)a3
{
  objc_storeStrong((id *)&self->_buttonParameters, a3);
}

- (DATouchButtonParameters)touchButtonParameters
{
  return self->_touchButtonParameters;
}

- (void)setTouchButtonParameters:(id)a3
{
  objc_storeStrong((id *)&self->_touchButtonParameters, a3);
}

- (DASwitchParameters)switchParameters
{
  return self->_switchParameters;
}

- (void)setSwitchParameters:(id)a3
{
  objc_storeStrong((id *)&self->_switchParameters, a3);
}

- (DAButtonSwitchSpecification)buttonSwitchSpecification
{
  return self->_buttonSwitchSpecification;
}

- (void)setButtonSwitchSpecification:(id)a3
{
  objc_storeStrong((id *)&self->_buttonSwitchSpecification, a3);
}

- (NSDictionary)predicates
{
  return self->_predicates;
}

- (void)setPredicates:(id)a3
{
  objc_storeStrong((id *)&self->_predicates, a3);
}

- (NSDictionary)specifications
{
  return self->_specifications;
}

- (void)setSpecifications:(id)a3
{
  objc_storeStrong((id *)&self->_specifications, a3);
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
  objc_storeStrong((id *)&self->_parameters, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_specifications, 0);
  objc_storeStrong((id *)&self->_predicates, 0);
  objc_storeStrong((id *)&self->_buttonSwitchSpecification, 0);
  objc_storeStrong((id *)&self->_switchParameters, 0);
  objc_storeStrong((id *)&self->_touchButtonParameters, 0);
  objc_storeStrong((id *)&self->_buttonParameters, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
