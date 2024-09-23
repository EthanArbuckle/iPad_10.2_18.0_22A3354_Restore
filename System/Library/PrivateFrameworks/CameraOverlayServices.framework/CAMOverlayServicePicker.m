@implementation CAMOverlayServicePicker

- (CAMOverlayServicePicker)initWithIdentifier:(id)a3 title:(id)a4 imageName:(id)a5 valueTitles:(id)a6
{
  id v10;
  CAMOverlayServicePicker *v11;
  CAMOverlayServicePicker *v12;
  NSArray *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSArray *valueTitles;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v10 = a6;
  v28.receiver = self;
  v28.super_class = (Class)CAMOverlayServicePicker;
  v11 = -[CAMAbstractOverlayServiceControl _initWithIdentifier:title:imageName:](&v28, sel__initWithIdentifier_title_imageName_, a3, a4, a5);
  v12 = v11;
  if (v11)
  {
    v11->_pickerType = 0;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
    v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v14 = v10;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v25;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v25 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v18);
          objc_msgSend((id)objc_opt_class(), "_preferredLocale", (_QWORD)v24);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "uppercaseStringWithLocale:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray addObject:](v13, "addObject:", v21);

          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v16);
    }

    valueTitles = v12->_valueTitles;
    v12->_valueTitles = v13;

  }
  return v12;
}

- (CAMOverlayServicePicker)initWithIdentifier:(id)a3 pickerType:(int64_t)a4 captureUniqueID:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  objc_super v13;

  v8 = a3;
  v9 = a5;
  if (a4)
  {
    if (a4 == 1)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", NSClassFromString(CFSTR("CAMOverlayService")));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("PICKER_STYLE"), &stru_2508F9068, CFSTR("CameraOverlayServices"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13.receiver = self;
      v13.super_class = (Class)CAMOverlayServicePicker;
      self = -[CAMAbstractOverlayServiceControl _initWithIdentifier:title:imageName:](&v13, sel__initWithIdentifier_title_imageName_, v8, v11, CFSTR("dot.dot.grid.app"));

      objc_storeStrong((id *)&self->_captureSessionUniqueID, a5);
      self->_pickerType = 1;
    }
  }
  else
  {

    self = 0;
  }

  return self;
}

- (int64_t)controlType
{
  return 1;
}

- (BOOL)isEnabled
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMOverlayServicePicker;
  v3 = -[CAMAbstractOverlayServiceControl isEnabled](&v5, sel_isEnabled);
  if (v3)
    LOBYTE(v3) = -[NSArray count](self->_valueTitles, "count") != 0;
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
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
  int64_t v15;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CAMOverlayServicePicker;
  v4 = a3;
  -[CAMAbstractOverlayServiceControl encodeWithCoder:](&v20, sel_encodeWithCoder_, v4);
  -[CAMOverlayServicePicker valueTitles](self, "valueTitles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@.%@"), v8, CFSTR("valueTitles"), v20.receiver, v20.super_class);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v9);

  -[CAMOverlayServicePicker captureSessionUniqueID](self, "captureSessionUniqueID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BDD17C8];
  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@.%@"), v13, CFSTR("captureSessionUniqueID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, v14);

  v15 = -[CAMOverlayServicePicker pickerType](self, "pickerType");
  v16 = (void *)MEMORY[0x24BDD17C8];
  v17 = (objc_class *)objc_opt_class();
  NSStringFromClass(v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("%@.%@"), v18, CFSTR("pickerType"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v15, v19);

}

- (CAMOverlayServicePicker)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  objc_class *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  CAMOverlayServicePicker *v41;
  void *v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = a3;
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("pickerType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v5, "decodeIntegerForKey:", v8);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDD17C8];
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@.%@"), v12, CFSTR("identifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v9, v13);
  v44 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x24BDD17C8];
  v16 = (objc_class *)objc_opt_class();
  NSStringFromClass(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("%@.%@"), v17, CFSTR("title"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v14, v18);
  v45 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x24BDD17C8];
  v21 = (objc_class *)objc_opt_class();
  NSStringFromClass(v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", CFSTR("%@.%@"), v22, CFSTR("imageName"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v19, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)MEMORY[0x24BDD17C8];
  v27 = (objc_class *)objc_opt_class();
  NSStringFromClass(v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "stringWithFormat:", CFSTR("%@.%@"), v28, CFSTR("captureSessionUniqueID"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v25, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = (void *)MEMORY[0x24BDBCF20];
  v32 = objc_opt_class();
  objc_msgSend(v31, "setWithObjects:", v32, objc_opt_class(), 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)MEMORY[0x24BDD17C8];
  v35 = (objc_class *)objc_opt_class();
  NSStringFromClass(v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "stringWithFormat:", CFSTR("%@.%@"), v36, CFSTR("valueTitles"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v33, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46 == 1)
  {
    v39 = (void *)v44;
    if (v44)
    {
      v40 = (void *)v45;
      if (!v30)
        goto LABEL_14;
      v41 = -[CAMOverlayServicePicker initWithIdentifier:pickerType:captureUniqueID:](self, "initWithIdentifier:pickerType:captureUniqueID:", v44, 1, v30);
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  v39 = (void *)v44;
  if (v46)
  {
LABEL_13:
    v40 = (void *)v45;
    goto LABEL_14;
  }
  v40 = (void *)v45;
  if (v44 && v45 && v24 && v38 && !v30)
  {
    v41 = -[CAMOverlayServicePicker initWithIdentifier:title:imageName:valueTitles:](self, "initWithIdentifier:title:imageName:valueTitles:", v44, v45, v24, v38);
LABEL_12:
    self = v41;
  }
LABEL_14:
  -[CAMAbstractOverlayServiceControl identifier](self, "identifier");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v42)
  {

    self = 0;
  }

  return self;
}

- (int64_t)pickerType
{
  return self->_pickerType;
}

- (NSString)captureSessionUniqueID
{
  return self->_captureSessionUniqueID;
}

- (NSArray)valueTitles
{
  return self->_valueTitles;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueTitles, 0);
  objc_storeStrong((id *)&self->_captureSessionUniqueID, 0);
}

- (id)updateWithStyleDictionary:(id)a3
{
  id v4;
  CAMOverlayServiceControlUpdate *v5;
  void *v6;
  id v7;

  v4 = a3;
  if (-[CAMOverlayServicePicker pickerType](self, "pickerType") == 1)
  {
    v5 = [CAMOverlayServiceControlUpdate alloc];
    -[CAMAbstractOverlayServiceControl identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[CAMOverlayServiceControlUpdate _initWithControlIdentifier:styleDictionary:](v5, "_initWithControlIdentifier:styleDictionary:", v6, v4);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)updateWithIndexValue:(int64_t)a3
{
  CAMOverlayServiceControlUpdate *v5;
  void *v6;
  id v7;

  v5 = [CAMOverlayServiceControlUpdate alloc];
  -[CAMAbstractOverlayServiceControl identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CAMOverlayServiceControlUpdate _initWithControlIdentifier:indexValue:](v5, "_initWithControlIdentifier:indexValue:", v6, a3);

  return v7;
}

@end
