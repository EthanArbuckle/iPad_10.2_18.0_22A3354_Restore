@implementation NUTrait

- (NUTrait)init
{
  return -[NUTrait initWithDefaultValue:](self, "initWithDefaultValue:", 0.0);
}

- (NUTrait)initWithDefaultValue:(double)a3
{
  NUTrait *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *traitBlocks;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NUTrait;
  v4 = -[NUTrait init](&v8, sel_init);
  if (v4)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    traitBlocks = v4->_traitBlocks;
    v4->_traitBlocks = v5;

    v4->_defaultValue = a3;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NUTrait *v5;
  NUTrait *v6;
  void *v7;
  uint64_t v8;
  NSMutableDictionary *traitBlocks;
  double v10;

  v5 = [NUTrait alloc];
  -[NUTrait defaultValue](self, "defaultValue");
  v6 = -[NUTrait initWithDefaultValue:](v5, "initWithDefaultValue:");
  -[NUTrait traitBlocks](self, "traitBlocks");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "copyWithZone:", a3);
  traitBlocks = v6->_traitBlocks;
  v6->_traitBlocks = (NSMutableDictionary *)v8;

  -[NUTrait defaultValue](self, "defaultValue");
  v6->_defaultValue = v10;
  return v6;
}

- (id)when:(unint64_t)a3 block:(id)a4
{
  char v4;
  id v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = a3;
  v6 = a4;
  if ((v4 & 1) != 0)
  {
    -[NUTrait traitBlocks](self, "traitBlocks");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x2199FC190](v6);
    objc_msgSend(v10, "setObject:forKey:", v11, &unk_24D5BAAD0);

    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((v4 & 2) == 0)
  {
    goto LABEL_3;
  }
  -[NUTrait traitBlocks](self, "traitBlocks");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x2199FC190](v6);
  objc_msgSend(v12, "setObject:forKey:", v13, &unk_24D5BAAE8);

  if ((v4 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 8) == 0)
      goto LABEL_5;
LABEL_11:
    -[NUTrait traitBlocks](self, "traitBlocks");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x2199FC190](v6);
    objc_msgSend(v16, "setObject:forKey:", v17, &unk_24D5BAB18);

    if ((v4 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  -[NUTrait traitBlocks](self, "traitBlocks");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x2199FC190](v6);
  objc_msgSend(v14, "setObject:forKey:", v15, &unk_24D5BAB00);

  if ((v4 & 8) != 0)
    goto LABEL_11;
LABEL_5:
  if ((v4 & 0x10) != 0)
  {
LABEL_6:
    -[NUTrait traitBlocks](self, "traitBlocks");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x2199FC190](v6);
    objc_msgSend(v7, "setObject:forKey:", v8, &unk_24D5BAB30);

  }
LABEL_7:

  return self;
}

- (double)valueForTraitCollection:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  double v9;
  double v10;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  NUDeviceTraitLookup();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUTrait valueForTraitCollection:size:deviceTrait:](self, "valueForTraitCollection:size:deviceTrait:", v7, v8, width, height);
  v10 = v9;

  return v10;
}

- (double)valueForTraitCollection:(id)a3 size:(CGSize)a4 deviceTrait:(id)a5
{
  double height;
  double width;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD, double, double);
  double v14;
  double v15;

  height = a4.height;
  width = a4.width;
  v9 = a5;
  v10 = NUTraitOptionFromUITraitCollection(a3);
  -[NUTrait traitBlocks](self, "traitBlocks");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v12);
  v13 = (void (**)(_QWORD, _QWORD, double, double))objc_claimAutoreleasedReturnValue();

  if (v13)
    ((void (**)(_QWORD, id, double, double))v13)[2](v13, v9, width, height);
  else
    -[NUTrait defaultValue](self, "defaultValue");
  v15 = v14;

  return v15;
}

- (double)defaultValue
{
  return self->_defaultValue;
}

- (NSMutableDictionary)traitBlocks
{
  return self->_traitBlocks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitBlocks, 0);
}

@end
