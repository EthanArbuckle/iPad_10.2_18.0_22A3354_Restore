@implementation CAMOverlayServiceControl

- (CAMOverlayServiceControl)initWithIdentifier:(id)a3
{
  CAMOverlayServiceControl *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CAMOverlayServiceControl;
  result = -[CAMAbstractOverlayServiceControl _initWithIdentifier:title:imageName:](&v4, sel__initWithIdentifier_title_imageName_, a3, &stru_2508F9068, &stru_2508F9068);
  if (result)
  {
    result->_captureDeviceProperty = 0;
    result->_rangeScale = 0;
  }
  return result;
}

- (CAMOverlayServiceControl)init
{
  void *v3;
  void *v4;
  CAMOverlayServiceControl *v5;

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CAMOverlayServiceControl initWithIdentifier:](self, "initWithIdentifier:", v4);

  return v5;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->super._title, a3);
}

- (void)setImageName:(id)a3
{
  objc_storeStrong((id *)&self->super._imageName, a3);
}

- (id)copyWithZone:(_NSZone *)a3
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

  v4 = objc_alloc((Class)objc_opt_class());
  -[CAMAbstractOverlayServiceControl identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithIdentifier:", v5);

  -[CAMOverlayServiceControl valueRange](self, "valueRange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValueRange:", v7);

  -[CAMOverlayServiceControl valueFormat](self, "valueFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValueFormat:", v8);

  -[CAMOverlayServiceControl primaryValues](self, "primaryValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPrimaryValues:", v9);

  -[CAMAbstractOverlayServiceControl imageName](self, "imageName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImageName:", v10);

  -[CAMAbstractOverlayServiceControl title](self, "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v11);

  objc_msgSend(v6, "setRangeScale:", -[CAMOverlayServiceControl rangeScale](self, "rangeScale"));
  -[CAMOverlayServiceControl captureDeviceUniqueID](self, "captureDeviceUniqueID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCaptureDeviceUniqueID:", v12);

  objc_msgSend(v6, "setCaptureDeviceProperty:", -[CAMOverlayServiceControl captureDeviceProperty](self, "captureDeviceProperty"));
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CAMOverlayServiceControl)initWithCoder:(id)a3
{
  id v4;
  CAMOverlayServiceControl *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  CAMOverlayValueRange *valueRange;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSString *valueFormat;
  void *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  CAMOverlayDiscreteFloatRange *primaryValues;
  void *v30;
  objc_class *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_class *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  objc_class *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  NSString *captureDeviceUniqueID;
  objc_super v46;

  v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)CAMOverlayServiceControl;
  v5 = -[CAMAbstractOverlayServiceControl initWithCoder:](&v46, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x24BDD17C8];
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@.%@"), v12, CFSTR("valueRange"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    valueRange = v5->_valueRange;
    v5->_valueRange = (CAMOverlayValueRange *)v14;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x24BDD17C8];
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("%@.%@"), v19, CFSTR("valueFormat"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, v20);
    v21 = objc_claimAutoreleasedReturnValue();
    valueFormat = v5->_valueFormat;
    v5->_valueFormat = (NSString *)v21;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)MEMORY[0x24BDD17C8];
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringWithFormat:", CFSTR("%@.%@"), v26, CFSTR("primaryValues"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, v27);
    v28 = objc_claimAutoreleasedReturnValue();
    primaryValues = v5->_primaryValues;
    v5->_primaryValues = (CAMOverlayDiscreteFloatRange *)v28;

    v30 = (void *)MEMORY[0x24BDD17C8];
    v31 = (objc_class *)objc_opt_class();
    NSStringFromClass(v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringWithFormat:", CFSTR("%@.%@"), v32, CFSTR("rangeScale"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_rangeScale = objc_msgSend(v4, "decodeIntegerForKey:", v33);

    v34 = (void *)MEMORY[0x24BDD17C8];
    v35 = (objc_class *)objc_opt_class();
    NSStringFromClass(v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "stringWithFormat:", CFSTR("%@.%@"), v36, CFSTR("captureDeviceProperty"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_captureDeviceProperty = objc_msgSend(v4, "decodeIntegerForKey:", v37);

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)MEMORY[0x24BDD17C8];
    v40 = (objc_class *)objc_opt_class();
    NSStringFromClass(v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "stringWithFormat:", CFSTR("%@.%@"), v41, CFSTR("captureDeviceUniqueID"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v38, v42);
    v43 = objc_claimAutoreleasedReturnValue();
    captureDeviceUniqueID = v5->_captureDeviceUniqueID;
    v5->_captureDeviceUniqueID = (NSString *)v43;

  }
  return v5;
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
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  int64_t v20;
  void *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  int64_t v25;
  void *v26;
  objc_class *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_class *v32;
  void *v33;
  void *v34;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)CAMOverlayServiceControl;
  v4 = a3;
  -[CAMAbstractOverlayServiceControl encodeWithCoder:](&v35, sel_encodeWithCoder_, v4);
  -[CAMOverlayServiceControl valueRange](self, "valueRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@.%@"), v8, CFSTR("valueRange"), v35.receiver, v35.super_class);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v9);

  -[CAMOverlayServiceControl valueFormat](self, "valueFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BDD17C8];
  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@.%@"), v13, CFSTR("valueFormat"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, v14);

  -[CAMOverlayServiceControl primaryValues](self, "primaryValues");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x24BDD17C8];
  v17 = (objc_class *)objc_opt_class();
  NSStringFromClass(v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("%@.%@"), v18, CFSTR("primaryValues"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, v19);

  v20 = -[CAMOverlayServiceControl rangeScale](self, "rangeScale");
  v21 = (void *)MEMORY[0x24BDD17C8];
  v22 = (objc_class *)objc_opt_class();
  NSStringFromClass(v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringWithFormat:", CFSTR("%@.%@"), v23, CFSTR("rangeScale"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v20, v24);

  v25 = -[CAMOverlayServiceControl captureDeviceProperty](self, "captureDeviceProperty");
  v26 = (void *)MEMORY[0x24BDD17C8];
  v27 = (objc_class *)objc_opt_class();
  NSStringFromClass(v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "stringWithFormat:", CFSTR("%@.%@"), v28, CFSTR("captureDeviceProperty"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v25, v29);

  -[CAMOverlayServiceControl captureDeviceUniqueID](self, "captureDeviceUniqueID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)MEMORY[0x24BDD17C8];
  v32 = (objc_class *)objc_opt_class();
  NSStringFromClass(v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "stringWithFormat:", CFSTR("%@.%@"), v33, CFSTR("captureDeviceUniqueID"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v30, v34);

}

- (NSString)captureDeviceUniqueID
{
  return self->_captureDeviceUniqueID;
}

- (void)setCaptureDeviceUniqueID:(id)a3
{
  objc_storeStrong((id *)&self->_captureDeviceUniqueID, a3);
}

- (int64_t)captureDeviceProperty
{
  return self->_captureDeviceProperty;
}

- (void)setCaptureDeviceProperty:(int64_t)a3
{
  self->_captureDeviceProperty = a3;
}

- (CAMOverlayValueRange)valueRange
{
  return self->_valueRange;
}

- (void)setValueRange:(id)a3
{
  objc_storeStrong((id *)&self->_valueRange, a3);
}

- (NSString)valueFormat
{
  return self->_valueFormat;
}

- (void)setValueFormat:(id)a3
{
  objc_storeStrong((id *)&self->_valueFormat, a3);
}

- (CAMOverlayDiscreteFloatRange)primaryValues
{
  return self->_primaryValues;
}

- (void)setPrimaryValues:(id)a3
{
  objc_storeStrong((id *)&self->_primaryValues, a3);
}

- (int64_t)rangeScale
{
  return self->_rangeScale;
}

- (void)setRangeScale:(int64_t)a3
{
  self->_rangeScale = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryValues, 0);
  objc_storeStrong((id *)&self->_valueFormat, 0);
  objc_storeStrong((id *)&self->_valueRange, 0);
  objc_storeStrong((id *)&self->_captureDeviceUniqueID, 0);
}

@end
