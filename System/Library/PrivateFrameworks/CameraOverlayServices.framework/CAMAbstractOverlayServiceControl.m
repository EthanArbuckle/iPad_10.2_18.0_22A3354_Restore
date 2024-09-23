@implementation CAMAbstractOverlayServiceControl

+ (id)_preferredLocale
{
  if (_preferredLocale_onceToken != -1)
    dispatch_once(&_preferredLocale_onceToken, &__block_literal_global_2);
  return (id)_preferredLocale_preferredLocale;
}

void __52__CAMAbstractOverlayServiceControl__preferredLocale__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "preferredLocalizations");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "firstObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", v4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_preferredLocale_preferredLocale;
  _preferredLocale_preferredLocale = v2;

}

- (id)_initWithIdentifier:(id)a3 title:(id)a4 imageName:(id)a5
{
  id v9;
  id v10;
  id v11;
  CAMAbstractOverlayServiceControl *v12;
  CAMAbstractOverlayServiceControl *v13;
  void *v14;
  uint64_t v15;
  NSString *title;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CAMAbstractOverlayServiceControl;
  v12 = -[CAMAbstractOverlayServiceControl init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_msgSend((id)objc_opt_class(), "_preferredLocale");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uppercaseStringWithLocale:", v14);
    v15 = objc_claimAutoreleasedReturnValue();
    title = v13->_title;
    v13->_title = (NSString *)v15;

    objc_storeStrong((id *)&v13->_imageName, a5);
    v13->_enabled = 1;
  }

  return v13;
}

- (id)description
{
  unint64_t v3;
  __CFString *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = -[CAMAbstractOverlayServiceControl controlType](self, "controlType");
  if (v3 > 2)
    v4 = 0;
  else
    v4 = off_2508F8F80[v3];
  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMAbstractOverlayServiceControl title](self, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMAbstractOverlayServiceControl identifier](self, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p; %@ titled %@ with ID %@>"), v7, self, v4, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CAMAbstractOverlayServiceControl)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  CAMAbstractOverlayServiceControl *v11;
  CAMAbstractOverlayServiceControl *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSString *imageName;
  void *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSString *title;
  CAMAbstractOverlayServiceControl *v27;
  objc_super v29;

  v4 = a3;
  v5 = objc_opt_class();
  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@.%@"), v8, CFSTR("identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v29.receiver = self;
    v29.super_class = (Class)CAMAbstractOverlayServiceControl;
    v11 = -[CAMAbstractOverlayServiceControl init](&v29, sel_init);
    v12 = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_identifier, v10);
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x24BDD17C8];
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("%@.%@"), v16, CFSTR("imageName"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, v17);
      v18 = objc_claimAutoreleasedReturnValue();
      imageName = v12->_imageName;
      v12->_imageName = (NSString *)v18;

      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)MEMORY[0x24BDD17C8];
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringWithFormat:", CFSTR("%@.%@"), v23, CFSTR("title"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, v24);
      v25 = objc_claimAutoreleasedReturnValue();
      title = v12->_title;
      v12->_title = (NSString *)v25;

    }
    self = v12;
    v27 = self;
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  id v19;

  v4 = a3;
  -[CAMAbstractOverlayServiceControl identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@.%@"), v8, CFSTR("identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v9);

  -[CAMAbstractOverlayServiceControl imageName](self, "imageName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BDD17C8];
  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@.%@"), v13, CFSTR("imageName"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, v14);

  -[CAMAbstractOverlayServiceControl title](self, "title");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x24BDD17C8];
  v16 = (objc_class *)objc_opt_class();
  NSStringFromClass(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("%@.%@"), v17, CFSTR("title"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v19, v18);

}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)controlType
{
  return self->_controlType;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)imageName
{
  return self->_imageName;
}

- (BOOL)persistentlyVisible
{
  return self->_persistentlyVisible;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (id)validateUpdate:(id)a3
{
  id v4;
  unint64_t v5;
  int64_t v6;
  void *v7;
  void *v8;
  char v9;
  CAMAbstractOverlayServiceControl *v10;
  unint64_t v11;
  float v12;
  float v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  void *v26;
  unint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "valueType");
  v6 = -[CAMAbstractOverlayServiceControl controlType](self, "controlType");
  objc_msgSend(v4, "controlIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMAbstractOverlayServiceControl identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if ((v9 & 1) == 0)
  {
    v19 = (void *)MEMORY[0x24BDD1540];
    v32 = *MEMORY[0x24BDD0BA0];
    v33[0] = CFSTR("InvalidIdentifier");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v19;
    v22 = -100;
    goto LABEL_10;
  }
  switch(v6)
  {
    case 2:
      v18 = 0;
      if (v5 > 4 || v5 == 3)
        goto LABEL_29;
      v23 = (void *)MEMORY[0x24BDD1540];
      v32 = *MEMORY[0x24BDD0BA0];
      v33[0] = CFSTR("InvalidValueType");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v23;
      v22 = -12;
LABEL_10:
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("CAMOverlayErrorDomain"), v22, v20);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_29;
    case 1:
      v10 = self;
      v24 = -[CAMAbstractOverlayServiceControl pickerType](v10, "pickerType");
      switch(v5)
      {
        case 0uLL:
        case 3uLL:
        case 4uLL:
LABEL_21:
          v29 = (void *)MEMORY[0x24BDD1540];
          v32 = *MEMORY[0x24BDD0BA0];
          v33[0] = CFSTR("InvalidValueType");
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "errorWithDomain:code:userInfo:", CFSTR("CAMOverlayErrorDomain"), -12, v30);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_28;
        case 1uLL:
          if ((objc_msgSend(v4, "indexValue") & 0x8000000000000000) == 0)
          {
            v25 = objc_msgSend(v4, "indexValue");
            -[CAMAbstractOverlayServiceControl valueTitles](v10, "valueTitles");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "count");

            if (v25 < v27)
              goto LABEL_23;
          }
          v28 = -13;
          goto LABEL_25;
        case 2uLL:
          if (v24)
            goto LABEL_23;
          v28 = -12;
LABEL_25:
          CAMOverlayErrorForCode(v28);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          break;
        default:
LABEL_23:
          v18 = 0;
          break;
      }
      goto LABEL_28;
    case 0:
      v10 = self;
      v11 = -[CAMAbstractOverlayServiceControl sliderType](v10, "sliderType");
      switch(v5)
      {
        case 0uLL:
          objc_msgSend(v4, "floatValue");
          v13 = v12;
          -[CAMAbstractOverlayServiceControl valueRange](v10, "valueRange");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v13;
          objc_msgSend(v14, "minimum");
          if (v16 + -0.0001 <= v15 && (objc_msgSend(v14, "maximum"), v17 + 0.0001 >= v15))
          {
            v18 = 0;
          }
          else
          {
            CAMOverlayErrorForCode(-13);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
          }

          break;
        case 1uLL:
        case 3uLL:
          goto LABEL_21;
        case 2uLL:
          v18 = 0;
          if (v11 <= 7 && ((1 << v11) & 0xE3) != 0)
            goto LABEL_21;
          break;
        default:
          goto LABEL_23;
      }
LABEL_28:

      goto LABEL_29;
  }
  v18 = 0;
LABEL_29:

  return v18;
}

- (id)updateWithEnabled:(BOOL)a3
{
  _BOOL8 v3;
  CAMOverlayServiceControlUpdate *v5;
  void *v6;
  id v7;

  v3 = a3;
  v5 = [CAMOverlayServiceControlUpdate alloc];
  -[CAMAbstractOverlayServiceControl identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CAMOverlayServiceControlUpdate _initWithControlIdentifier:isEnabled:](v5, "_initWithControlIdentifier:isEnabled:", v6, v3);

  return v7;
}

@end
