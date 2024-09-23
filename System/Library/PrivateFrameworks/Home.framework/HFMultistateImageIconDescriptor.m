@implementation HFMultistateImageIconDescriptor

- (id)iconDescriptorForPrimaryState:(int64_t)a3
{
  void *v5;
  void *v6;
  HFSymbolIconConfiguration *v7;
  HFSymbolIconConfiguration *v8;
  void *v9;
  void *v10;
  HFSymbolIconConfiguration *v11;
  HFSymbolIconConfiguration *v12;
  HFImageIconDescriptor *v13;
  HFImageIconDescriptor *v14;
  HFSymbolIconConfiguration *v15;

  -[HFMultistateImageIconDescriptor dictionaryKeyedByPrimaryState](self, "dictionaryKeyedByPrimaryState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (HFSymbolIconConfiguration *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    if (-[HFImageIconDescriptor isSystemImage](self, "isSystemImage"))
    {
      v8 = [HFSymbolIconConfiguration alloc];
      -[HFImageIconDescriptor imageIdentifier](self, "imageIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFImageIconDescriptor imageSymbolConfiguration](self, "imageSymbolConfiguration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[HFSymbolIconConfiguration initWithSystemImageName:configuration:](v8, "initWithSystemImageName:configuration:", v9, v10);

    }
    else
    {
      -[HFImageIconDescriptor imageIdentifier](self, "imageIdentifier");
      v7 = (HFSymbolIconConfiguration *)objc_claimAutoreleasedReturnValue();
    }
  }
  if (!-[HFImageIconDescriptor isSystemImage](self, "isSystemImage"))
  {
    objc_opt_class();
    v11 = v7;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v11;
    else
      v15 = 0;
    v13 = v15;

    if (v13)
    {
      v14 = -[HFImageIconDescriptor initWithImageIdentifier:]([HFImageIconDescriptor alloc], "initWithImageIdentifier:", v13);
      goto LABEL_16;
    }
LABEL_17:
    v11 = 0;
    goto LABEL_18;
  }
  objc_opt_class();
  v11 = v7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  if (!v13)
    goto LABEL_17;
  v14 = -[HFImageIconDescriptor initWithSymbolIconConfiguration:]([HFImageIconDescriptor alloc], "initWithSymbolIconConfiguration:", v13);
LABEL_16:
  v13 = v14;
LABEL_18:

  return v13;
}

- (NSDictionary)dictionaryKeyedByPrimaryState
{
  return self->_dictionaryKeyedByPrimaryState;
}

- (HFMultistateImageIconDescriptor)initWithSymbolIconConfigurationsKeyedByPrimaryState:(id)a3 defaultSymbolIconConfiguration:(id)a4
{
  id v7;
  id v8;
  void *v9;
  HFMultistateImageIconDescriptor *v10;
  HFMultistateImageIconDescriptor *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "systemImageName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    NSLog(CFSTR("No default symbol icon name specified!"));
  v13.receiver = self;
  v13.super_class = (Class)HFMultistateImageIconDescriptor;
  v10 = -[HFImageIconDescriptor initWithSymbolIconConfiguration:](&v13, sel_initWithSymbolIconConfiguration_, v8);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_dictionaryKeyedByPrimaryState, a3);

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionaryKeyedByPrimaryState, 0);
}

- (HFMultistateImageIconDescriptor)initWithSymbolIconConfigurationsKeyedByPrimaryState:(id)a3 defaultPrimaryState:(int64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  HFMultistateImageIconDescriptor *v10;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[HFMultistateImageIconDescriptor initWithSymbolIconConfigurationsKeyedByPrimaryState:defaultSymbolIconConfiguration:](self, "initWithSymbolIconConfigurationsKeyedByPrimaryState:defaultSymbolIconConfiguration:", v7, v9);
  return v10;
}

- (HFMultistateImageIconDescriptor)initWithSymbolIconConfigurationsKeyedByPrimaryState:(id)a3
{
  return -[HFMultistateImageIconDescriptor initWithSymbolIconConfigurationsKeyedByPrimaryState:defaultPrimaryState:](self, "initWithSymbolIconConfigurationsKeyedByPrimaryState:defaultPrimaryState:", a3, 1);
}

- (HFMultistateImageIconDescriptor)initWithImageIdentifiersKeyedByPrimaryState:(id)a3
{
  id v4;
  void *v5;
  HFMultistateImageIconDescriptor *v6;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", &unk_1EA7CB668);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HFMultistateImageIconDescriptor initWithImageIdentifiersKeyedByPrimaryState:defaultImageIdentifier:](self, "initWithImageIdentifiersKeyedByPrimaryState:defaultImageIdentifier:", v4, v5);

  return v6;
}

- (HFMultistateImageIconDescriptor)initWithImageIdentifiersKeyedByPrimaryState:(id)a3 defaultImageIdentifier:(id)a4
{
  id v7;
  __CFString *v8;
  const __CFString *v9;
  HFMultistateImageIconDescriptor *v10;
  HFMultistateImageIconDescriptor *v11;
  objc_super v13;

  v7 = a3;
  v8 = (__CFString *)a4;
  if (v8)
  {
    v9 = v8;
  }
  else
  {
    NSLog(CFSTR("No default image identifier specified!"));
    v9 = CFSTR("HFImageIconIdentifierGeneric");
  }
  v13.receiver = self;
  v13.super_class = (Class)HFMultistateImageIconDescriptor;
  v10 = -[HFImageIconDescriptor initWithImageIdentifier:](&v13, sel_initWithImageIdentifier_, v9);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_dictionaryKeyedByPrimaryState, a3);

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  HFMultistateImageIconDescriptor *v4;
  HFMultistateImageIconDescriptor *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (HFMultistateImageIconDescriptor *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[HFMultistateImageIconDescriptor dictionaryKeyedByPrimaryState](v5, "dictionaryKeyedByPrimaryState");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFMultistateImageIconDescriptor dictionaryKeyedByPrimaryState](self, "dictionaryKeyedByPrimaryState");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {
        v10 = 1;
      }
      else
      {
        -[HFMultistateImageIconDescriptor dictionaryKeyedByPrimaryState](v5, "dictionaryKeyedByPrimaryState");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFMultistateImageIconDescriptor dictionaryKeyedByPrimaryState](self, "dictionaryKeyedByPrimaryState");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqualToDictionary:", v9);

      }
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HFMultistateImageIconDescriptor dictionaryKeyedByPrimaryState](self, "dictionaryKeyedByPrimaryState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (int64_t)compare:(id)a3
{
  return 0;
}

- (void)setDictionaryKeyedByPrimaryState:(id)a3
{
  objc_storeStrong((id *)&self->_dictionaryKeyedByPrimaryState, a3);
}

@end
