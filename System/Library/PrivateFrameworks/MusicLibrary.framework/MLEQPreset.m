@implementation MLEQPreset

- (MLEQPreset)initWithBuiltInPresetType:(int)a3
{
  MLEQPreset *v4;
  uint64_t v5;
  NSString *name;
  uint64_t v7;
  NSString *localizedName;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MLEQPreset;
  v4 = -[MLEQPreset init](&v10, sel_init);
  if (v4)
  {
    MLNSStringForBuiltInPreset(a3, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    name = v4->_name;
    v4->_name = (NSString *)v5;

    MLNSStringForBuiltInPreset(a3, 1);
    v7 = objc_claimAutoreleasedReturnValue();
    localizedName = v4->_localizedName;
    v4->_localizedName = (NSString *)v7;

    v4->_builtInPresetType = a3;
  }
  return v4;
}

- (id)name
{
  return self->_name;
}

- (id)localizedName
{
  return self->_localizedName;
}

- (int)builtInPresetType
{
  return self->_builtInPresetType;
}

- (int)typeForAVController
{
  int builtInPresetType;

  builtInPresetType = self->_builtInPresetType;
  if (builtInPresetType == 122)
    return 0;
  else
    return builtInPresetType - 99;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)eqPresetForName:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = a3;
  if (!v3)
    goto LABEL_11;
  if (!sPresetsByPresetName
    || (CFDictionaryGetValue((CFDictionaryRef)sPresetsByPresetName, v3),
        (v4 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v5 = 100;
    while (1)
    {
      MLNSStringForBuiltInPreset(v5, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isEqualToString:", v3);

      if ((v7 & 1) != 0)
        break;
      v5 = (v5 + 1);
      if ((_DWORD)v5 == 123)
        goto LABEL_9;
    }
    +[MLEQPreset eqPresetForBuiltInPresetType:](MLEQPreset, "eqPresetForBuiltInPresetType:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      goto LABEL_12;
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "intValue");

    if ((v10 - 100) <= 0x15)
    {
      +[MLEQPreset eqPresetForBuiltInPresetType:](MLEQPreset, "eqPresetForBuiltInPresetType:", v10);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
LABEL_11:
    v4 = 0;
  }
LABEL_12:

  return v4;
}

+ (id)eqPresetForBuiltInPresetType:(int)a3
{
  uint64_t v3;
  MLEQPreset *v4;
  MLEQPreset *v5;
  __CFDictionary *Mutable;
  __CFDictionary *v7;

  v3 = *(_QWORD *)&a3;
  if (!sPresetsByBuiltInType
    || (CFDictionaryGetValue((CFDictionaryRef)sPresetsByBuiltInType, (const void *)a3),
        (v4 = (MLEQPreset *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v5 = -[MLEQPreset initWithBuiltInPresetType:]([MLEQPreset alloc], "initWithBuiltInPresetType:", v3);
    Mutable = (__CFDictionary *)sPresetsByBuiltInType;
    if (!sPresetsByBuiltInType)
    {
      Mutable = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E0C9B3A0]);
      sPresetsByBuiltInType = (uint64_t)Mutable;
    }
    CFDictionarySetValue(Mutable, (const void *)-[MLEQPreset builtInPresetType](v5, "builtInPresetType"), v5);
    v4 = v5;
    v7 = (__CFDictionary *)sPresetsByPresetName;
    if (!sPresetsByPresetName)
    {
      v7 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      sPresetsByPresetName = (uint64_t)v7;
    }
    CFDictionarySetValue(v7, -[MLEQPreset name](v4, "name"), v4);

  }
  return v4;
}

@end
