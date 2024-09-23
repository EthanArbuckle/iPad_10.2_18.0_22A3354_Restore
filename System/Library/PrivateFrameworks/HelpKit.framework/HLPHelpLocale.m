@implementation HLPHelpLocale

- (HLPHelpLocale)initWithDictionary:(id)a3
{
  id v4;
  HLPHelpLocale *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HLPHelpLocale;
  v5 = -[HLPHelpLocale init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("folder"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HLPHelpLocale setPath:](v5, "setPath:", v6);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isoCodes"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HLPHelpLocale setIsoCodes:](v5, "setIsoCodes:", v7);

  }
  return v5;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", &stru_24D32F538);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HLPHelpLocale path](self, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("path: %@\n"), v4);

  -[HLPHelpLocale isoCodes](self, "isoCodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("isoCodes: %@\n"), v5);

  return v3;
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)isoCodes
{
  return self->_isoCodes;
}

- (void)setIsoCodes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isoCodes, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end
