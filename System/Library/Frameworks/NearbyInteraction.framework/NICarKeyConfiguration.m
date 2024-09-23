@implementation NICarKeyConfiguration

- (NICarKeyConfiguration)initWithVehicleIdentifier:(id)a3
{
  id v6;
  id *v7;
  NICarKeyConfiguration *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NICarKeyConfiguration.mm"), 17, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("vehicleIdentifier"));

  }
  v11.receiver = self;
  v11.super_class = (Class)NICarKeyConfiguration;
  v7 = -[NIConfiguration initInternal](&v11, sel_initInternal);
  v8 = (NICarKeyConfiguration *)v7;
  if (v7)
  {
    objc_storeStrong(v7 + 5, a3);
    v8->_configurationTypeInternal = 1;
  }

  return v8;
}

- (id)initVehicleSimConfiguration:(id)a3
{
  id v6;
  _QWORD *v7;
  id *v8;
  void *v9;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NICarKeyConfiguration.mm"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("debugOptions"));

  }
  v12.receiver = self;
  v12.super_class = (Class)NICarKeyConfiguration;
  v7 = -[NIConfiguration initInternal](&v12, sel_initInternal);
  v8 = (id *)v7;
  if (v7)
  {
    v9 = (void *)v7[5];
    v7[5] = CFSTR("VEHICLE SIMULATION CONFIGURATION");

    objc_storeStrong(v8 + 6, a3);
    v8[4] = (id)2;
  }

  return v8;
}

- (id)initLabTestModeConfiguration:(id)a3
{
  id v6;
  _QWORD *v7;
  id *v8;
  void *v9;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NICarKeyConfiguration.mm"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("debugOptions"));

  }
  v12.receiver = self;
  v12.super_class = (Class)NICarKeyConfiguration;
  v7 = -[NIConfiguration initInternal](&v12, sel_initInternal);
  v8 = (id *)v7;
  if (v7)
  {
    v9 = (void *)v7[5];
    v7[5] = CFSTR("TEST MODE CONFIGURATION");

    objc_storeStrong(v8 + 6, a3);
    v8[4] = (id)3;
  }

  return v8;
}

+ (id)_vehicleSimConfigurationWithOptions:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[NICarKeyConfiguration initVehicleSimConfiguration:]([NICarKeyConfiguration alloc], "initVehicleSimConfiguration:", v3);

  return v4;
}

+ (id)_labTestModeConfigurationWithOptions:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[NICarKeyConfiguration initLabTestModeConfiguration:]([NICarKeyConfiguration alloc], "initLabTestModeConfiguration:", v3);

  return v4;
}

- (NICarKeyConfiguration)initWithConfiguration:(id)a3
{
  id v5;
  NICarKeyConfiguration *v6;
  uint64_t v7;
  NSString *vehicleIdentifier;
  uint64_t v9;
  NSDictionary *debugOptions;
  void *v12;
  objc_super v13;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NICarKeyConfiguration.mm"), 57, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration"));

  }
  v13.receiver = self;
  v13.super_class = (Class)NICarKeyConfiguration;
  v6 = -[NIConfiguration initInternal](&v13, sel_initInternal);
  if (v6)
  {
    objc_msgSend(v5, "vehicleIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    vehicleIdentifier = v6->_vehicleIdentifier;
    v6->_vehicleIdentifier = (NSString *)v7;

    objc_msgSend(v5, "debugOptions");
    v9 = objc_claimAutoreleasedReturnValue();
    debugOptions = v6->_debugOptions;
    v6->_debugOptions = (NSDictionary *)v9;

    v6->_configurationTypeInternal = objc_msgSend(v5, "configurationType");
  }

  return v6;
}

- (int64_t)configurationType
{
  return self->_configurationTypeInternal;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NICarKeyConfiguration;
  v5 = -[NIConfiguration copyWithZone:](&v9, sel_copyWithZone_);
  objc_msgSend(v5, "setVehicleIdentifier:", self->_vehicleIdentifier);
  v5[4] = self->_configurationTypeInternal;
  if (self->_debugOptions)
  {
    v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D80], "allocWithZone:", a3), "initWithDictionary:copyItems:", self->_debugOptions, 1);
    v7 = (void *)v5[6];
    v5[6] = v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_vehicleIdentifier, CFSTR("vehicleIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_debugOptions, CFSTR("debugOptions"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_configurationTypeInternal, CFSTR("configurationType"));

}

- (NICarKeyConfiguration)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NICarKeyConfiguration *v14;
  NICarKeyConfiguration *v15;
  _QWORD v17[3];
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("vehicleIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v18[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0C99E60];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    v17[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeDictionaryWithKeysOfClasses:objectsOfClasses:forKey:", v8, v11, CFSTR("debugOptions"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("configurationType"));
    if (v13 == 1)
    {
      v15 = -[NICarKeyConfiguration initWithVehicleIdentifier:]([NICarKeyConfiguration alloc], "initWithVehicleIdentifier:", v5);
      -[NICarKeyConfiguration setDebugOptions:](v15, "setDebugOptions:", v12);
    }
    else
    {
      if (v13 == 2)
      {
        v14 = -[NICarKeyConfiguration initVehicleSimConfiguration:]([NICarKeyConfiguration alloc], "initVehicleSimConfiguration:", v12);
      }
      else
      {
        if (v13 != 3)
        {
          v15 = 0;
          goto LABEL_11;
        }
        v14 = -[NICarKeyConfiguration initLabTestModeConfiguration:]([NICarKeyConfiguration alloc], "initLabTestModeConfiguration:", v12);
      }
      v15 = v14;
    }
LABEL_11:

    goto LABEL_12;
  }
  v15 = 0;
LABEL_12:

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NICarKeyConfiguration *v5;
  NICarKeyConfiguration *v6;
  NSString *vehicleIdentifier;
  void *v8;
  BOOL v9;
  NSDictionary *debugOptions;
  BOOL v11;
  char v12;
  void *v13;
  void *v14;
  BOOL v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (NICarKeyConfiguration *)v4;
    v6 = v5;
    if (v5 == self)
    {
      v12 = 1;
    }
    else
    {
      vehicleIdentifier = self->_vehicleIdentifier;
      -[NICarKeyConfiguration vehicleIdentifier](v5, "vehicleIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[NSString isEqualToString:](vehicleIdentifier, "isEqualToString:", v8);

      debugOptions = self->_debugOptions;
      if (debugOptions)
      {
        v11 = 0;
      }
      else
      {
        -[NICarKeyConfiguration debugOptions](v6, "debugOptions");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v13 == 0;

        debugOptions = self->_debugOptions;
      }
      -[NICarKeyConfiguration debugOptions](v6, "debugOptions");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[NSDictionary isEqualToDictionary:](debugOptions, "isEqualToDictionary:", v14);

      v12 = v9 && (v15 || v11);
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_vehicleIdentifier, "hash");
  return -[NSDictionary hash](self->_debugOptions, "hash") ^ v3 ^ self->_configurationTypeInternal;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NICarKeyConfiguration descriptionInternal](self, "descriptionInternal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %@>"), v5, v6);

  return v7;
}

- (id)descriptionInternal
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<vehicle identifier: %@, debug options: <%@>>"), self->_vehicleIdentifier, self->_debugOptions);
}

- (NSString)vehicleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setVehicleIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSDictionary)debugOptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDebugOptions:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugOptions, 0);
  objc_storeStrong((id *)&self->_vehicleIdentifier, 0);
}

@end
