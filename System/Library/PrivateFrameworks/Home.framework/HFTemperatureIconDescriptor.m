@implementation HFTemperatureIconDescriptor

- (HFTemperatureIconDescriptor)initWithFormattedTemperature:(id)a3 heatingCoolingMode:(int64_t)a4 targetHeatingCoolingMode:(int64_t)a5
{
  id v9;
  HFTemperatureIconDescriptor *v10;
  HFTemperatureIconDescriptor *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HFTemperatureIconDescriptor;
  v10 = -[HFTemperatureIconDescriptor init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_formattedTemperature, a3);
    v11->_heatingCoolingMode = a4;
    v11->_targetHeatingCoolingMode = a5;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formattedTemperature, 0);
}

- (BOOL)isEqual:(id)a3
{
  HFTemperatureIconDescriptor *v4;
  HFTemperatureIconDescriptor *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  BOOL v11;
  uint64_t v12;

  v4 = (HFTemperatureIconDescriptor *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[HFTemperatureIconDescriptor formattedTemperature](v5, "formattedTemperature");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFTemperatureIconDescriptor formattedTemperature](self, "formattedTemperature");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {
        v10 = 1;
      }
      else
      {
        -[HFTemperatureIconDescriptor formattedTemperature](v5, "formattedTemperature");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFTemperatureIconDescriptor formattedTemperature](self, "formattedTemperature");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqualToString:", v9);

      }
      v12 = -[HFTemperatureIconDescriptor heatingCoolingMode](v5, "heatingCoolingMode");
      if (v12 == -[HFTemperatureIconDescriptor heatingCoolingMode](self, "heatingCoolingMode"))
        v11 = v10;
      else
        v11 = 0;

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (NSString)formattedTemperature
{
  return self->_formattedTemperature;
}

- (int64_t)heatingCoolingMode
{
  return self->_heatingCoolingMode;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HFTemperatureIconDescriptor formattedTemperature](self, "formattedTemperature");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)identifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (int64_t)compare:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HFTemperatureIconDescriptor heatingCoolingMode](self, "heatingCoolingMode"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "heatingCoolingMode"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "compare:", v9);

    if (!v10)
    {
      -[HFTemperatureIconDescriptor formattedTemperature](self, "formattedTemperature");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "formattedTemperature");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v11, "compare:", v12);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)shouldForceLTR
{
  return self->_shouldForceLTR;
}

- (int64_t)targetHeatingCoolingMode
{
  return self->_targetHeatingCoolingMode;
}

@end
