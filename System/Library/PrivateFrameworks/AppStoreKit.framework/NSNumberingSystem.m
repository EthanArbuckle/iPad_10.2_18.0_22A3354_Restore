@implementation NSNumberingSystem

+ (id)numberingSystemWithNumberingSystemName:(const char *)a3
{
  uint64_t v4;
  void *v6;
  int v7;
  int v8;
  void *v9;
  NSNumberingSystem *v10;
  _BYTE v11[512];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = unumsys_openByName();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", v11, (int)unumsys_getDescription());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1D82AACDC](v4);
  v8 = MEMORY[0x1D82AACD0](v4);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[NSNumberingSystem initWithIdentifier:isAlgorithmic:radix:descriptor:]([NSNumberingSystem alloc], "initWithIdentifier:isAlgorithmic:radix:descriptor:", v9, v7 != 0, v8, v6);
  unumsys_close();

  return v10;
}

- (NSNumberingSystem)initWithIdentifier:(id)a3 isAlgorithmic:(BOOL)a4 radix:(int64_t)a5 descriptor:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  NSNumberingSystem *v12;
  NSNumberingSystem *v13;
  NSNumberingSystem *v14;
  objc_super v16;

  v8 = a4;
  v10 = a3;
  v11 = a6;
  v16.receiver = self;
  v16.super_class = (Class)NSNumberingSystem;
  v12 = -[NSNumberingSystem init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    -[NSNumberingSystem setIdentifier:](v12, "setIdentifier:", v10);
    -[NSNumberingSystem setIsAlgorithmic:](v13, "setIsAlgorithmic:", v8);
    -[NSNumberingSystem setRadix:](v13, "setRadix:", a5);
    -[NSNumberingSystem setDescriptor:](v13, "setDescriptor:", v11);
    v14 = v13;
  }

  return v13;
}

- (NSNumberingSystem)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("init not implemented"), CFSTR("Subclasses must implement a valid init method"));
  return -[NSNumberingSystem initWithLocaleIdentifier:](self, "initWithLocaleIdentifier:", &stru_1E9DB4A20);
}

- (NSNumberingSystem)initWithLocaleIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSNumberingSystem *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "rangeOfString:options:", CFSTR("numbers=([a-z]+)"), 1024);
  if (v6)
  {
    objc_msgSend(v4, "substringWithRange:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DC8], "ICUNumberingSystems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v7);
    v9 = (NSNumberingSystem *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSNumberingSystem)initWithNumberingSystemIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSNumberingSystem *v6;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DC8], "ICUNumberingSystems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (NSNumberingSystem *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[NSNumberingSystem identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  NSNumberingSystem *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (NSNumberingSystem *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[NSNumberingSystem identifier](self, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSNumberingSystem identifier](v4, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (BOOL)isAlgorithmic
{
  return self->_isAlgorithmic;
}

- (void)setIsAlgorithmic:(BOOL)a3
{
  self->_isAlgorithmic = a3;
}

- (int64_t)radix
{
  return self->_radix;
}

- (void)setRadix:(int64_t)a3
{
  self->_radix = a3;
}

- (NSString)descriptor
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDescriptor:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
