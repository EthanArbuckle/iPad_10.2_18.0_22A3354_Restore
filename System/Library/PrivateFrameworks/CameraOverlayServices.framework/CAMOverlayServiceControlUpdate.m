@implementation CAMOverlayServiceControlUpdate

- (id)_initWithControlIdentifier:(id)a3 floatValue:(float)a4
{
  id v7;
  CAMOverlayServiceControlUpdate *v8;
  CAMOverlayServiceControlUpdate *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CAMOverlayServiceControlUpdate;
  v8 = -[CAMOverlayServiceControlUpdate init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_controlIdentifier, a3);
    v9->_floatValue = a4;
    v9->_valueType = 0;
  }

  return v9;
}

- (id)_initWithControlIdentifier:(id)a3 indexValue:(int64_t)a4
{
  id v7;
  CAMOverlayServiceControlUpdate *v8;
  CAMOverlayServiceControlUpdate *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CAMOverlayServiceControlUpdate;
  v8 = -[CAMOverlayServiceControlUpdate init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_controlIdentifier, a3);
    v9->_valueType = 1;
    v9->_indexValue = a4;
  }

  return v9;
}

- (id)_initWithControlIdentifier:(id)a3 styleDictionary:(id)a4
{
  id v7;
  id v8;
  CAMOverlayServiceControlUpdate *v9;
  CAMOverlayServiceControlUpdate *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CAMOverlayServiceControlUpdate;
  v9 = -[CAMOverlayServiceControlUpdate init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_controlIdentifier, a3);
    objc_storeStrong((id *)&v10->_styleDictionary, a4);
    v10->_valueType = 2;
  }

  return v10;
}

- (id)_initWithControlIdentifier:(id)a3 BOOLeanValue:(BOOL)a4
{
  id v7;
  CAMOverlayServiceControlUpdate *v8;
  CAMOverlayServiceControlUpdate *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CAMOverlayServiceControlUpdate;
  v8 = -[CAMOverlayServiceControlUpdate init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_controlIdentifier, a3);
    v9->_BOOLeanValue = a4;
    v9->_valueType = 3;
  }

  return v9;
}

- (id)_initWithControlIdentifier:(id)a3 isRecording:(BOOL)a4
{
  id v7;
  CAMOverlayServiceControlUpdate *v8;
  CAMOverlayServiceControlUpdate *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CAMOverlayServiceControlUpdate;
  v8 = -[CAMOverlayServiceControlUpdate init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_controlIdentifier, a3);
    v9->_recording = a4;
    v9->_valueType = 4;
  }

  return v9;
}

- (id)_initWithControlIdentifier:(id)a3 isEnabled:(BOOL)a4
{
  id v7;
  CAMOverlayServiceControlUpdate *v8;
  CAMOverlayServiceControlUpdate *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CAMOverlayServiceControlUpdate;
  v8 = -[CAMOverlayServiceControlUpdate init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_controlIdentifier, a3);
    v9->_enabled = a4;
    v9->_valueType = 5;
  }

  return v9;
}

- (BOOL)isValueUpdate
{
  return (-[CAMOverlayServiceControlUpdate valueType](self, "valueType") & 0xFFFFFFFFFFFFFFFELL) != 4;
}

- (BOOL)isEqualToUpdate:(id)a3
{
  CAMOverlayServiceControlUpdate *v4;
  uint64_t v5;
  float v6;
  float v7;
  float v8;
  BOOL v9;
  char v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  BOOL v17;

  v4 = (CAMOverlayServiceControlUpdate *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_6;
  if (v4 == self)
  {
    v10 = 1;
    goto LABEL_20;
  }
  v5 = -[CAMOverlayServiceControlUpdate valueType](v4, "valueType");
  if (v5 == -[CAMOverlayServiceControlUpdate valueType](self, "valueType"))
  {
    switch(-[CAMOverlayServiceControlUpdate valueType](self, "valueType"))
    {
      case 0:
        -[CAMOverlayServiceControlUpdate floatValue](v4, "floatValue");
        v7 = v6;
        -[CAMOverlayServiceControlUpdate floatValue](self, "floatValue");
        v9 = v7 == v8;
        goto LABEL_9;
      case 1:
        v11 = -[CAMOverlayServiceControlUpdate indexValue](v4, "indexValue");
        v9 = v11 == -[CAMOverlayServiceControlUpdate indexValue](self, "indexValue");
LABEL_9:
        v10 = v9;
        break;
      case 2:
        -[CAMOverlayServiceControlUpdate styleDictionary](v4, "styleDictionary");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAMOverlayServiceControlUpdate styleDictionary](self, "styleDictionary");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12 == v13)
        {
          v10 = 1;
        }
        else
        {
          -[CAMOverlayServiceControlUpdate styleDictionary](v4, "styleDictionary");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[CAMOverlayServiceControlUpdate styleDictionary](self, "styleDictionary");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v14, "isEqualToDictionary:", v15);

        }
        break;
      case 3:
        v16 = -[CAMOverlayServiceControlUpdate BOOLeanValue](v4, "BOOLeanValue");
        v17 = -[CAMOverlayServiceControlUpdate BOOLeanValue](self, "BOOLeanValue");
        goto LABEL_17;
      case 4:
        v16 = -[CAMOverlayServiceControlUpdate isRecording](v4, "isRecording");
        v17 = -[CAMOverlayServiceControlUpdate isRecording](self, "isRecording");
        goto LABEL_17;
      case 5:
        v16 = -[CAMOverlayServiceControlUpdate isEnabled](v4, "isEnabled");
        v17 = -[CAMOverlayServiceControlUpdate isEnabled](self, "isEnabled");
LABEL_17:
        v10 = v16 ^ v17 ^ 1;
        break;
      default:
        goto LABEL_6;
    }
  }
  else
  {
LABEL_6:
    v10 = 0;
  }
LABEL_20:

  return v10;
}

- (id)_valueTypeString
{
  unint64_t v2;

  v2 = -[CAMOverlayServiceControlUpdate valueType](self, "valueType");
  if (v2 > 5)
    return CFSTR("invalid");
  else
    return off_2508F8F98[v2];
}

- (id)_valueString
{
  void *v3;
  float v4;
  id result;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  __CFString *v11;

  switch(-[CAMOverlayServiceControlUpdate valueType](self, "valueType"))
  {
    case 0:
      v3 = (void *)MEMORY[0x24BDD17C8];
      -[CAMOverlayServiceControlUpdate floatValue](self, "floatValue");
      objc_msgSend(v3, "stringWithFormat:", CFSTR("%f"), v4);
      goto LABEL_5;
    case 1:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), -[CAMOverlayServiceControlUpdate indexValue](self, "indexValue"));
LABEL_5:
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 2:
      v7 = (void *)MEMORY[0x24BDD17C8];
      -[CAMOverlayServiceControlUpdate styleDictionary](self, "styleDictionary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_14;
    case 3:
      v10 = -[CAMOverlayServiceControlUpdate BOOLeanValue](self, "BOOLeanValue");
      goto LABEL_10;
    case 4:
      v10 = -[CAMOverlayServiceControlUpdate isRecording](self, "isRecording");
      goto LABEL_10;
    case 5:
      v10 = -[CAMOverlayServiceControlUpdate isEnabled](self, "isEnabled");
LABEL_10:
      v11 = CFSTR("NO");
      if (v10)
        v11 = CFSTR("YES");
      v6 = v11;
LABEL_13:
      v9 = v6;
LABEL_14:
      result = v9;
      break;
    default:
      result = &stru_2508F9068;
      break;
  }
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMOverlayServiceControlUpdate _valueTypeString](self, "_valueTypeString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMOverlayServiceControlUpdate _valueString](self, "_valueString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p: %@ %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[CAMOverlayServiceControlUpdate _valueTypeString](self, "_valueTypeString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMOverlayServiceControlUpdate _valueString](self, "_valueString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(%@)"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  float v14;
  double v15;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  int64_t v20;
  void *v21;
  objc_class *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  _BOOL8 v26;
  void *v27;
  objc_class *v28;
  uint64_t v29;
  const __CFString *v30;
  objc_class *v31;
  objc_class *v32;
  id v33;

  v33 = a3;
  v4 = -[CAMOverlayServiceControlUpdate valueType](self, "valueType");
  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("valueType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "encodeInteger:forKey:", v4, v8);

  -[CAMOverlayServiceControlUpdate controlIdentifier](self, "controlIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDD17C8];
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@.%@"), v12, CFSTR("controlIdentifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "encodeObject:forKey:", v9, v13);

  switch(-[CAMOverlayServiceControlUpdate valueType](self, "valueType"))
  {
    case 0:
      -[CAMOverlayServiceControlUpdate floatValue](self, "floatValue");
      v15 = v14;
      v16 = (void *)MEMORY[0x24BDD17C8];
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR("%@.%@"), v18, CFSTR("floatValue"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "encodeDouble:forKey:", v19, v15);
      goto LABEL_9;
    case 1:
      v20 = -[CAMOverlayServiceControlUpdate indexValue](self, "indexValue");
      v21 = (void *)MEMORY[0x24BDD17C8];
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringWithFormat:", CFSTR("%@.%@"), v18, CFSTR("indexValue"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "encodeInteger:forKey:", v20, v19);
      goto LABEL_9;
    case 2:
      -[CAMOverlayServiceControlUpdate styleDictionary](self, "styleDictionary");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)MEMORY[0x24BDD17C8];
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", CFSTR("%@.%@"), v19, CFSTR("styleDictionary"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "encodeObject:forKey:", v18, v25);

      goto LABEL_9;
    case 3:
      v26 = -[CAMOverlayServiceControlUpdate BOOLeanValue](self, "BOOLeanValue");
      v27 = (void *)MEMORY[0x24BDD17C8];
      v28 = (objc_class *)objc_opt_class();
      NSStringFromClass(v28);
      v29 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v29;
      v30 = CFSTR("BOOLeanValue");
      goto LABEL_8;
    case 4:
      v26 = -[CAMOverlayServiceControlUpdate isRecording](self, "isRecording");
      v27 = (void *)MEMORY[0x24BDD17C8];
      v31 = (objc_class *)objc_opt_class();
      NSStringFromClass(v31);
      v29 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v29;
      v30 = CFSTR("recording");
      goto LABEL_8;
    case 5:
      v26 = -[CAMOverlayServiceControlUpdate isEnabled](self, "isEnabled");
      v27 = (void *)MEMORY[0x24BDD17C8];
      v32 = (objc_class *)objc_opt_class();
      NSStringFromClass(v32);
      v29 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v29;
      v30 = CFSTR("enabled");
LABEL_8:
      objc_msgSend(v27, "stringWithFormat:", CFSTR("%@.%@"), v29, v30);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "encodeBool:forKey:", v26, v19);
LABEL_9:

      break;
    default:
      break;
  }

}

- (CAMOverlayServiceControlUpdate)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  CAMOverlayServiceControlUpdate *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  double v21;
  void *v22;
  objc_class *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  objc_class *v29;
  void *v30;
  void *v31;
  NSDictionary *v32;
  NSDictionary *styleDictionary;
  void *v34;
  objc_class *v35;
  void *v36;
  objc_class *v37;
  void *v38;
  objc_class *v39;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("valueType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "decodeIntegerForKey:", v8);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BDD17C8];
  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@.%@"), v13, CFSTR("controlIdentifier"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  switch(v9)
  {
    case 0:
      LODWORD(v16) = 0;
      v17 = -[CAMOverlayServiceControlUpdate _initWithControlIdentifier:floatValue:](self, "_initWithControlIdentifier:floatValue:", v15, v16);
      v18 = (void *)MEMORY[0x24BDD17C8];
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      self = (CAMOverlayServiceControlUpdate *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", CFSTR("%@.%@"), self, CFSTR("floatValue"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeDoubleForKey:", v20);
      *(float *)&v21 = v21;
      v17->_floatValue = *(float *)&v21;
      goto LABEL_9;
    case 1:
      v17 = -[CAMOverlayServiceControlUpdate _initWithControlIdentifier:indexValue:](self, "_initWithControlIdentifier:indexValue:", v15, 0);
      v22 = (void *)MEMORY[0x24BDD17C8];
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      self = (CAMOverlayServiceControlUpdate *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringWithFormat:", CFSTR("%@.%@"), self, CFSTR("indexValue"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v17->_indexValue = objc_msgSend(v4, "decodeIntegerForKey:", v20);
      goto LABEL_9;
    case 2:
      self = -[CAMOverlayServiceControlUpdate _initWithControlIdentifier:styleDictionary:](self, "_initWithControlIdentifier:styleDictionary:", v15, 0);
      v24 = (void *)MEMORY[0x24BDBCF20];
      v25 = objc_opt_class();
      v26 = objc_opt_class();
      objc_msgSend(v24, "setWithObjects:", v25, v26, objc_opt_class(), 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)MEMORY[0x24BDD17C8];
      v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "stringWithFormat:", CFSTR("%@.%@"), v30, CFSTR("styleDictionary"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v27, v31);
      v32 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      styleDictionary = self->_styleDictionary;
      self->_styleDictionary = v32;

      if (self->_styleDictionary)
        break;
      v17 = 0;
      goto LABEL_10;
    case 3:
      v17 = -[CAMOverlayServiceControlUpdate _initWithControlIdentifier:BOOLeanValue:](self, "_initWithControlIdentifier:BOOLeanValue:", v15, 0);
      v34 = (void *)MEMORY[0x24BDD17C8];
      v35 = (objc_class *)objc_opt_class();
      NSStringFromClass(v35);
      self = (CAMOverlayServiceControlUpdate *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "stringWithFormat:", CFSTR("%@.%@"), self, CFSTR("BOOLeanValue"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v17->_BOOLeanValue = objc_msgSend(v4, "decodeBoolForKey:", v20);
      goto LABEL_9;
    case 4:
      v17 = -[CAMOverlayServiceControlUpdate _initWithControlIdentifier:isRecording:](self, "_initWithControlIdentifier:isRecording:", v15, 0);
      v36 = (void *)MEMORY[0x24BDD17C8];
      v37 = (objc_class *)objc_opt_class();
      NSStringFromClass(v37);
      self = (CAMOverlayServiceControlUpdate *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "stringWithFormat:", CFSTR("%@.%@"), self, CFSTR("recording"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v17->_recording = objc_msgSend(v4, "decodeBoolForKey:", v20);
      goto LABEL_9;
    case 5:
      v17 = -[CAMOverlayServiceControlUpdate _initWithControlIdentifier:isEnabled:](self, "_initWithControlIdentifier:isEnabled:", v15, 0);
      v38 = (void *)MEMORY[0x24BDD17C8];
      v39 = (objc_class *)objc_opt_class();
      NSStringFromClass(v39);
      self = (CAMOverlayServiceControlUpdate *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "stringWithFormat:", CFSTR("%@.%@"), self, CFSTR("enabled"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v17->_enabled = objc_msgSend(v4, "decodeBoolForKey:", v20);
LABEL_9:

LABEL_10:
      self = v17;
      break;
    default:
      break;
  }
  if (!self->_controlIdentifier)
  {

    self = 0;
  }

  return self;
}

- (NSString)controlIdentifier
{
  return self->_controlIdentifier;
}

- (int64_t)valueType
{
  return self->_valueType;
}

- (float)floatValue
{
  return self->_floatValue;
}

- (int64_t)indexValue
{
  return self->_indexValue;
}

- (NSDictionary)styleDictionary
{
  return self->_styleDictionary;
}

- (BOOL)BOOLeanValue
{
  return self->_BOOLeanValue;
}

- (BOOL)isRecording
{
  return self->_recording;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleDictionary, 0);
  objc_storeStrong((id *)&self->_controlIdentifier, 0);
}

@end
