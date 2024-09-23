@implementation INCar

- (id)_intents_cacheableObjects
{
  return 0;
}

- (INCar)initWithCarIdentifier:(NSString *)carIdentifier displayName:(NSString *)displayName year:(NSString *)year make:(NSString *)make model:(NSString *)model color:(CGColorRef)color headUnit:(INCarHeadUnit *)headUnit supportedChargingConnectors:(NSArray *)supportedChargingConnectors
{
  NSString *v16;
  NSString *v17;
  NSString *v18;
  NSString *v19;
  NSString *v20;
  INCarHeadUnit *v21;
  NSArray *v22;
  INCar *v23;
  uint64_t v24;
  NSString *v25;
  uint64_t v26;
  NSString *v27;
  uint64_t v28;
  NSString *v29;
  uint64_t v30;
  NSString *v31;
  uint64_t v32;
  NSString *v33;
  uint64_t v34;
  INCarHeadUnit *v35;
  uint64_t v36;
  NSArray *v37;
  objc_super v39;

  v16 = carIdentifier;
  v17 = displayName;
  v18 = year;
  v19 = make;
  v20 = model;
  v21 = headUnit;
  v22 = supportedChargingConnectors;
  v39.receiver = self;
  v39.super_class = (Class)INCar;
  v23 = -[INCar init](&v39, sel_init);
  if (v23)
  {
    v24 = -[NSString copy](v16, "copy");
    v25 = v23->_carIdentifier;
    v23->_carIdentifier = (NSString *)v24;

    v26 = -[NSString copy](v17, "copy");
    v27 = v23->_displayName;
    v23->_displayName = (NSString *)v26;

    v28 = -[NSString copy](v18, "copy");
    v29 = v23->_year;
    v23->_year = (NSString *)v28;

    v30 = -[NSString copy](v19, "copy");
    v31 = v23->_make;
    v23->_make = (NSString *)v30;

    v32 = -[NSString copy](v20, "copy");
    v33 = v23->_model;
    v23->_model = (NSString *)v32;

    v23->_color = CGColorRetain(color);
    v34 = -[INCarHeadUnit copy](v21, "copy");
    v35 = v23->_headUnit;
    v23->_headUnit = (INCarHeadUnit *)v34;

    v36 = -[NSArray copy](v22, "copy");
    v37 = v23->_supportedChargingConnectors;
    v23->_supportedChargingConnectors = (NSArray *)v36;

  }
  return v23;
}

- (INCar)initWithCarIdentifier:(id)a3 displayName:(id)a4 year:(id)a5 make:(id)a6 model:(id)a7 color:(CGColor *)a8 headUnit:(id)a9 supportedChargingConnectors:(id)a10 powerPerConnectors:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  INCar *v25;
  uint64_t v26;
  NSString *carIdentifier;
  uint64_t v28;
  NSString *displayName;
  uint64_t v30;
  NSString *year;
  uint64_t v32;
  NSString *make;
  uint64_t v34;
  NSString *model;
  uint64_t v36;
  INCarHeadUnit *headUnit;
  uint64_t v38;
  NSArray *supportedChargingConnectors;
  uint64_t v40;
  NSArray *powerPerConnectors;
  objc_super v43;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a9;
  v23 = a10;
  v24 = a11;
  v43.receiver = self;
  v43.super_class = (Class)INCar;
  v25 = -[INCar init](&v43, sel_init);
  if (v25)
  {
    v26 = objc_msgSend(v17, "copy");
    carIdentifier = v25->_carIdentifier;
    v25->_carIdentifier = (NSString *)v26;

    v28 = objc_msgSend(v18, "copy");
    displayName = v25->_displayName;
    v25->_displayName = (NSString *)v28;

    v30 = objc_msgSend(v19, "copy");
    year = v25->_year;
    v25->_year = (NSString *)v30;

    v32 = objc_msgSend(v20, "copy");
    make = v25->_make;
    v25->_make = (NSString *)v32;

    v34 = objc_msgSend(v21, "copy");
    model = v25->_model;
    v25->_model = (NSString *)v34;

    v25->_color = CGColorRetain(a8);
    v36 = objc_msgSend(v22, "copy");
    headUnit = v25->_headUnit;
    v25->_headUnit = (INCarHeadUnit *)v36;

    v38 = objc_msgSend(v23, "copy");
    supportedChargingConnectors = v25->_supportedChargingConnectors;
    v25->_supportedChargingConnectors = (NSArray *)v38;

    v40 = objc_msgSend(v24, "copy");
    powerPerConnectors = v25->_powerPerConnectors;
    v25->_powerPerConnectors = (NSArray *)v40;

  }
  return v25;
}

- (void)dealloc
{
  objc_super v3;

  CGColorRelease(self->_color);
  v3.receiver = self;
  v3.super_class = (Class)INCar;
  -[INCar dealloc](&v3, sel_dealloc);
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;

  v3 = -[NSString hash](self->_carIdentifier, "hash");
  v4 = -[NSString hash](self->_displayName, "hash") ^ v3;
  v5 = -[NSString hash](self->_year, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_make, "hash");
  v7 = -[NSString hash](self->_model, "hash");
  -[INCar _colorDictionaryRepresentation](self, "_colorDictionaryRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ objc_msgSend(v8, "hash");
  v10 = v6 ^ v9 ^ -[INCarHeadUnit hash](self->_headUnit, "hash");
  v11 = -[NSArray hash](self->_supportedChargingConnectors, "hash");
  v12 = v10 ^ v11 ^ -[NSArray hash](self->_powerPerConnectors, "hash");

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  INCar *v4;
  INCar *v5;
  NSString *carIdentifier;
  NSString *displayName;
  NSString *year;
  NSString *make;
  NSString *model;
  BOOL v11;
  INCarHeadUnit *headUnit;
  NSArray *supportedChargingConnectors;
  NSArray *powerPerConnectors;

  v4 = (INCar *)a3;
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
      carIdentifier = self->_carIdentifier;
      v11 = 0;
      if (carIdentifier == v5->_carIdentifier || -[NSString isEqual:](carIdentifier, "isEqual:"))
      {
        displayName = self->_displayName;
        if (displayName == v5->_displayName || -[NSString isEqual:](displayName, "isEqual:"))
        {
          year = self->_year;
          if (year == v5->_year || -[NSString isEqual:](year, "isEqual:"))
          {
            make = self->_make;
            if (make == v5->_make || -[NSString isEqual:](make, "isEqual:"))
            {
              model = self->_model;
              if ((model == v5->_model || -[NSString isEqual:](model, "isEqual:"))
                && self->_color == v5->_color)
              {
                headUnit = self->_headUnit;
                if (headUnit == v5->_headUnit || -[INCarHeadUnit isEqual:](headUnit, "isEqual:"))
                {
                  supportedChargingConnectors = self->_supportedChargingConnectors;
                  if (supportedChargingConnectors == v5->_supportedChargingConnectors
                    || -[NSArray isEqual:](supportedChargingConnectors, "isEqual:"))
                  {
                    powerPerConnectors = self->_powerPerConnectors;
                    if (powerPerConnectors == v5->_powerPerConnectors
                      || -[NSArray isEqual:](powerPerConnectors, "isEqual:"))
                    {
                      v11 = 1;
                    }
                  }
                }
              }
            }
          }
        }
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (INCar)initWithCoder:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  INCar *v44;
  uint64_t SRGB;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD v52[2];
  _QWORD v53[5];

  v53[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("carIdentifier"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("displayName"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("year"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0C99E60];
  v14 = objc_opt_class();
  objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("make"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0C99E60];
  v17 = objc_opt_class();
  objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("model"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x1E0C99E60];
  v21 = objc_opt_class();
  objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("color"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "doubleValue");
  v26 = v25;
  objc_msgSend(v23, "objectAtIndexedSubscript:", 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "doubleValue");
  v29 = v28;
  objc_msgSend(v23, "objectAtIndexedSubscript:", 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "doubleValue");
  v32 = v31;
  objc_msgSend(v23, "objectAtIndexedSubscript:", 3);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "doubleValue");
  SRGB = soft_CGColorCreateSRGB(v26, v29, v32, v34);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("headUnit"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)MEMORY[0x1E0C99E60];
  v53[0] = objc_opt_class();
  v53[1] = objc_opt_class();
  v53[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 3);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setWithArray:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v38, CFSTR("supportedChargingConnectors"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = (void *)MEMORY[0x1E0C99E60];
  v52[0] = objc_opt_class();
  v52[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 2);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setWithArray:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v42, CFSTR("powerPerConnectors"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = -[INCar initWithCarIdentifier:displayName:year:make:model:color:headUnit:supportedChargingConnectors:powerPerConnectors:](self, "initWithCarIdentifier:displayName:year:make:model:color:headUnit:supportedChargingConnectors:powerPerConnectors:", v50, v49, v48, v47, v19, SRGB, v35, v39, v43);
  return v44;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *carIdentifier;
  void *v5;
  id v6;

  carIdentifier = self->_carIdentifier;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", carIdentifier, CFSTR("carIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_displayName, CFSTR("displayName"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_year, CFSTR("year"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_make, CFSTR("make"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_model, CFSTR("model"));
  -[INCar _colorDictionaryRepresentation](self, "_colorDictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("color"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_headUnit, CFSTR("headUnit"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_supportedChargingConnectors, CFSTR("supportedChargingConnectors"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_powerPerConnectors, CFSTR("powerPerConnectors"));

}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:", self->_carIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, CFSTR("carIdentifier"));

  objc_msgSend(v6, "encodeObject:", self->_displayName);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, CFSTR("displayName"));

  objc_msgSend(v6, "encodeObject:", self->_year);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, CFSTR("year"));

  objc_msgSend(v6, "encodeObject:", self->_make);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, CFSTR("make"));

  objc_msgSend(v6, "encodeObject:", self->_model);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, CFSTR("model"));

  -[INCar _colorDictionaryRepresentation](self, "_colorDictionaryRepresentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v14, CFSTR("color"));

  objc_msgSend(v6, "encodeObject:", self->_headUnit);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v15, CFSTR("headUnit"));

  objc_msgSend(v6, "encodeObject:", self->_supportedChargingConnectors);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v16, CFSTR("supportedChargingConnectors"));

  objc_msgSend(v6, "encodeObject:", self->_powerPerConnectors);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v17, CFSTR("powerPerConnectors"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INCar descriptionAtIndent:](self, "descriptionAtIndent:", 0);
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)INCar;
  -[INCar description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCar _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  uint64_t carIdentifier;
  uint64_t displayName;
  uint64_t year;
  NSString *make;
  uint64_t v7;
  NSString *model;
  uint64_t v9;
  void *v10;
  INCarHeadUnit *headUnit;
  void *v12;
  NSArray *supportedChargingConnectors;
  void *v14;
  NSArray *powerPerConnectors;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[9];
  _QWORD v28[11];

  v28[9] = *MEMORY[0x1E0C80C00];
  carIdentifier = (uint64_t)self->_carIdentifier;
  v26 = carIdentifier;
  v27[0] = CFSTR("carIdentifier");
  if (!carIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    carIdentifier = objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)carIdentifier;
  v28[0] = carIdentifier;
  v27[1] = CFSTR("displayName");
  displayName = (uint64_t)self->_displayName;
  v25 = displayName;
  if (!displayName)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    displayName = objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)displayName;
  v28[1] = displayName;
  v27[2] = CFSTR("year");
  year = (uint64_t)self->_year;
  v24 = year;
  if (!year)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    year = objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)year;
  v28[2] = year;
  v27[3] = CFSTR("make");
  make = self->_make;
  v7 = (uint64_t)make;
  if (!make)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v7;
  v28[3] = v7;
  v27[4] = CFSTR("model");
  model = self->_model;
  v9 = (uint64_t)model;
  if (!model)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v28[4] = v9;
  v27[5] = CFSTR("color");
  -[INCar _colorDictionaryRepresentation](self, "_colorDictionaryRepresentation", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v28[5] = v10;
  v27[6] = CFSTR("headUnit");
  headUnit = self->_headUnit;
  v12 = headUnit;
  if (!headUnit)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[6] = v12;
  v27[7] = CFSTR("supportedChargingConnectors");
  supportedChargingConnectors = self->_supportedChargingConnectors;
  v14 = supportedChargingConnectors;
  if (!supportedChargingConnectors)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[7] = v14;
  v27[8] = CFSTR("powerPerConnectors");
  powerPerConnectors = self->_powerPerConnectors;
  v16 = powerPerConnectors;
  if (!powerPerConnectors)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[8] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (powerPerConnectors)
  {
    if (supportedChargingConnectors)
      goto LABEL_19;
LABEL_30:

    if (headUnit)
      goto LABEL_20;
    goto LABEL_31;
  }

  if (!supportedChargingConnectors)
    goto LABEL_30;
LABEL_19:
  if (headUnit)
    goto LABEL_20;
LABEL_31:

LABEL_20:
  if (model)
  {
    if (make)
      goto LABEL_22;
  }
  else
  {

    if (make)
      goto LABEL_22;
  }

LABEL_22:
  if (!v24)

  if (!v25)
  if (!v26)

  return v17;
}

- (void)setMaximumPower:(NSMeasurement *)power forChargingConnectorType:(INCarChargingConnectorType)chargingConnectorType
{
  NSMeasurement *v6;
  NSString *v7;
  INCarChargingConnectorPower *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = power;
  v7 = chargingConnectorType;
  v8 = -[INCarChargingConnectorPower initWithChargingConnector:maximumPower:]([INCarChargingConnectorPower alloc], "initWithChargingConnector:maximumPower:", v7, v6);
  -[INCar mutableArrayValueForKey:](self, "mutableArrayValueForKey:", CFSTR("powerPerConnectors"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v14, "chargingConnector", (_QWORD)v17);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", v7);

        if (v16)
        {
          objc_msgSend(v9, "removeObject:", v14);
          goto LABEL_11;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_11:

  objc_msgSend(v9, "addObject:", v8);
}

- (NSMeasurement)maximumPowerForChargingConnectorType:(INCarChargingConnectorType)chargingConnectorType
{
  NSString *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = chargingConnectorType;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[INCar powerPerConnectors](self, "powerPerConnectors", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "chargingConnector");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          objc_msgSend(v9, "maximumPower");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return (NSMeasurement *)v6;
}

- (id)_colorDictionaryRepresentation
{
  CGColor *color;
  void *v3;
  void *v4;
  double *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _Unwind_Exception *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void *v16;

  color = self->_color;
  if (color)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v3 = getCGColorGetComponentsSymbolLoc_ptr_125371;
    v16 = getCGColorGetComponentsSymbolLoc_ptr_125371;
    if (!getCGColorGetComponentsSymbolLoc_ptr_125371)
    {
      v4 = (void *)CoreGraphicsLibrary_125372();
      v3 = dlsym(v4, "CGColorGetComponents");
      v14[3] = (uint64_t)v3;
      getCGColorGetComponentsSymbolLoc_ptr_125371 = v3;
    }
    _Block_object_dispose(&v13, 8);
    if (!v3)
    {
      dlerror();
      v12 = (_Unwind_Exception *)abort_report_np();
      _Block_object_dispose(&v13, 8);
      _Unwind_Resume(v12);
    }
    v5 = (double *)((uint64_t (*)(CGColor *))v3)(color);
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5[1]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v8);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5[2]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v9);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5[3]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v10);

  }
  else
  {
    v6 = (id)MEMORY[0x1E0C9AA60];
  }
  return v6;
}

- (NSString)carIdentifier
{
  return self->_carIdentifier;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)year
{
  return self->_year;
}

- (NSString)make
{
  return self->_make;
}

- (NSString)model
{
  return self->_model;
}

- (CGColorRef)color
{
  return self->_color;
}

- (INCarHeadUnit)headUnit
{
  return self->_headUnit;
}

- (NSArray)supportedChargingConnectors
{
  return self->_supportedChargingConnectors;
}

- (NSArray)powerPerConnectors
{
  return self->_powerPerConnectors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerPerConnectors, 0);
  objc_storeStrong((id *)&self->_supportedChargingConnectors, 0);
  objc_storeStrong((id *)&self->_headUnit, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_make, 0);
  objc_storeStrong((id *)&self->_year, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_carIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  uint64_t SRGB;
  void *v32;
  void *v33;
  void *v34;
  void *v35;

  v7 = a3;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("carIdentifier"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("displayName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("year"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("make"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("model"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("color"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    v12 = v11;
    objc_msgSend(v32, "objectAtIndexedSubscript:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValue");
    v15 = v14;
    objc_msgSend(v32, "objectAtIndexedSubscript:", 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValue");
    v18 = v17;
    objc_msgSend(v32, "objectAtIndexedSubscript:", 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "doubleValue");
    SRGB = soft_CGColorCreateSRGB(v12, v15, v18, v20);

    v21 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("headUnit"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("supportedChargingConnectors"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("powerPerConnectors"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectsOfClass:from:", v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCarIdentifier:displayName:year:make:model:color:headUnit:supportedChargingConnectors:powerPerConnectors:", v30, v9, v35, v34, v33, SRGB, v23, v24, v27);
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

@end
