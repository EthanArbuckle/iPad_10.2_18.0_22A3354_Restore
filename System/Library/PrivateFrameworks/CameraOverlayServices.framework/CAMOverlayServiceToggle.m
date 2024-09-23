@implementation CAMOverlayServiceToggle

- (CAMOverlayServiceToggle)initWithIdentifier:(id)a3 title:(id)a4 imageName:(id)a5 onImageName:(id)a6 offImageName:(id)a7
{
  id v13;
  id v14;
  id *v15;
  CAMOverlayServiceToggle *v16;
  void *v17;
  uint64_t v18;
  NSString *onTitle;
  void *v20;
  uint64_t v21;
  NSString *offTitle;
  objc_super v24;

  v13 = a6;
  v14 = a7;
  v24.receiver = self;
  v24.super_class = (Class)CAMOverlayServiceToggle;
  v15 = -[CAMAbstractOverlayServiceControl _initWithIdentifier:title:imageName:](&v24, sel__initWithIdentifier_title_imageName_, a3, a4, a5);
  v16 = (CAMOverlayServiceToggle *)v15;
  if (v15)
  {
    objc_storeStrong(v15 + 7, a6);
    objc_storeStrong((id *)&v16->_offImageName, a7);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", NSClassFromString(CFSTR("CAMOverlayService")));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("TOGGLE_ON"), &stru_2508F9068, CFSTR("CameraOverlayServices"));
    v18 = objc_claimAutoreleasedReturnValue();
    onTitle = v16->_onTitle;
    v16->_onTitle = (NSString *)v18;

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", NSClassFromString(CFSTR("CAMOverlayService")));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("TOGGLE_OFF"), &stru_2508F9068, CFSTR("CameraOverlayServices"));
    v21 = objc_claimAutoreleasedReturnValue();
    offTitle = v16->_offTitle;
    v16->_offTitle = (NSString *)v21;

    v16->_toggleType = 0;
  }

  return v16;
}

- (CAMOverlayServiceToggle)initWithIdentifier:(id)a3 toggleType:(int64_t)a4
{
  id v6;
  NSString *offImageName;
  NSString *onImageName;
  objc_super v10;

  v6 = a3;
  if (a4)
  {
    if (a4 == 1)
    {
      v10.receiver = self;
      v10.super_class = (Class)CAMOverlayServiceToggle;
      self = -[CAMAbstractOverlayServiceControl _initWithIdentifier:title:imageName:](&v10, sel__initWithIdentifier_title_imageName_, v6, &stru_2508F9068, &stru_2508F9068);
      offImageName = self->_offImageName;
      self->_offImageName = (NSString *)CFSTR("lock.open.fill");

      onImageName = self->_onImageName;
      self->_onImageName = (NSString *)CFSTR("lock.fill");

      self->_toggleType = 1;
    }
  }
  else
  {

    self = 0;
  }

  return self;
}

- (BOOL)persistentlyVisible
{
  return -[CAMOverlayServiceToggle toggleType](self, "toggleType") == 1;
}

- (int64_t)controlType
{
  return 2;
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
  void *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  int64_t v25;
  void *v26;
  objc_class *v27;
  void *v28;
  void *v29;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)CAMOverlayServiceToggle;
  v4 = a3;
  -[CAMAbstractOverlayServiceControl encodeWithCoder:](&v30, sel_encodeWithCoder_, v4);
  -[CAMOverlayServiceToggle onImageName](self, "onImageName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@.%@"), v8, CFSTR("onImageName"), v30.receiver, v30.super_class);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v9);

  -[CAMOverlayServiceToggle offImageName](self, "offImageName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BDD17C8];
  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@.%@"), v13, CFSTR("offImageName"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, v14);

  -[CAMOverlayServiceToggle onTitle](self, "onTitle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x24BDD17C8];
  v17 = (objc_class *)objc_opt_class();
  NSStringFromClass(v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("%@.%@"), v18, CFSTR("onTitle"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, v19);

  -[CAMOverlayServiceToggle offTitle](self, "offTitle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)MEMORY[0x24BDD17C8];
  v22 = (objc_class *)objc_opt_class();
  NSStringFromClass(v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringWithFormat:", CFSTR("%@.%@"), v23, CFSTR("offTitle"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v20, v24);

  v25 = -[CAMOverlayServiceToggle toggleType](self, "toggleType");
  v26 = (void *)MEMORY[0x24BDD17C8];
  v27 = (objc_class *)objc_opt_class();
  NSStringFromClass(v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "stringWithFormat:", CFSTR("%@.%@"), v28, CFSTR("toggleType"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v25, v29);

}

- (CAMOverlayServiceToggle)initWithCoder:(id)a3
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
  objc_class *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_class *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  objc_class *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  objc_class *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;

  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = a3;
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("toggleType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v5, "decodeIntegerForKey:", v8);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDD17C8];
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@.%@"), v12, CFSTR("identifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v9, v13);
  v56 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x24BDD17C8];
  v16 = (objc_class *)objc_opt_class();
  NSStringFromClass(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("%@.%@"), v17, CFSTR("title"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v14, v18);
  v55 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x24BDD17C8];
  v21 = (objc_class *)objc_opt_class();
  NSStringFromClass(v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", CFSTR("%@.%@"), v22, CFSTR("imageName"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v19, v23);
  v54 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)MEMORY[0x24BDD17C8];
  v26 = (objc_class *)objc_opt_class();
  NSStringFromClass(v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringWithFormat:", CFSTR("%@.%@"), v27, CFSTR("onImageName"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v24, v28);
  v53 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)MEMORY[0x24BDD17C8];
  v31 = (objc_class *)objc_opt_class();
  NSStringFromClass(v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "stringWithFormat:", CFSTR("%@.%@"), v32, CFSTR("offImageName"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v29, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)MEMORY[0x24BDD17C8];
  v37 = (objc_class *)objc_opt_class();
  NSStringFromClass(v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "stringWithFormat:", CFSTR("%@.%@"), v38, CFSTR("onTitle"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v35, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)MEMORY[0x24BDD17C8];
  v43 = (objc_class *)objc_opt_class();
  NSStringFromClass(v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "stringWithFormat:", CFSTR("%@.%@"), v44, CFSTR("offTitle"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v41, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v57 == 1)
  {
    v47 = (void *)v56;
    if (v56)
      self = -[CAMOverlayServiceToggle initWithIdentifier:toggleType:](self, "initWithIdentifier:toggleType:", v56, 1);
    goto LABEL_12;
  }
  if (v57)
  {
    v47 = (void *)v56;
    goto LABEL_12;
  }
  v47 = (void *)v56;
  if (!v56)
  {
LABEL_12:
    v49 = (void *)v54;
    v48 = (void *)v55;
    v50 = (void *)v53;
    goto LABEL_13;
  }
  v49 = (void *)v54;
  v48 = (void *)v55;
  v50 = (void *)v53;
  if (v55 && v54 && v53 && v34)
  {
    self = -[CAMOverlayServiceToggle initWithIdentifier:title:imageName:onImageName:offImageName:](self, "initWithIdentifier:title:imageName:onImageName:offImageName:", v56, v55, v54, v53, v34);
    objc_storeStrong((id *)&self->_onTitle, v40);
    objc_storeStrong((id *)&self->_offTitle, v46);
  }
LABEL_13:
  -[CAMAbstractOverlayServiceControl identifier](self, "identifier");
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v51)
  {

    self = 0;
  }

  return self;
}

- (int64_t)toggleType
{
  return self->_toggleType;
}

- (NSString)onImageName
{
  return self->_onImageName;
}

- (void)setOnImageName:(id)a3
{
  objc_storeStrong((id *)&self->_onImageName, a3);
}

- (NSString)offImageName
{
  return self->_offImageName;
}

- (void)setOffImageName:(id)a3
{
  objc_storeStrong((id *)&self->_offImageName, a3);
}

- (NSString)onTitle
{
  return self->_onTitle;
}

- (NSString)offTitle
{
  return self->_offTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offTitle, 0);
  objc_storeStrong((id *)&self->_onTitle, 0);
  objc_storeStrong((id *)&self->_offImageName, 0);
  objc_storeStrong((id *)&self->_onImageName, 0);
}

- (id)updateWithBooleanValue:(BOOL)a3
{
  _BOOL8 v3;
  CAMOverlayServiceControlUpdate *v5;
  void *v6;
  id v7;

  v3 = a3;
  v5 = [CAMOverlayServiceControlUpdate alloc];
  -[CAMAbstractOverlayServiceControl identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CAMOverlayServiceControlUpdate _initWithControlIdentifier:BOOLeanValue:](v5, "_initWithControlIdentifier:BOOLeanValue:", v6, v3);

  return v7;
}

@end
