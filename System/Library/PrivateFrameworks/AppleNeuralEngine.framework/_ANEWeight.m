@implementation _ANEWeight

+ (id)weightWithSymbolAndURL:(id)a3 weightURL:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithWeightSymbolAndURL:weightURL:", v7, v6);

  return v8;
}

+ (id)weightWithSymbolAndURLSHA:(id)a3 weightURL:(id)a4 SHACode:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithWeightSymbolAndURLSHA:weightURL:SHACode:sandboxExtension:", v10, v9, v8, 0);

  return v11;
}

+ (id)new
{
  return 0;
}

- (_ANEWeight)init
{

  return 0;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ANEWeight weightSymbol](self, "weightSymbol");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ANEWeight weightURL](self, "weightURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ANEWeight SHACode](self, "SHACode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ANEWeight sandboxExtension](self, "sandboxExtension");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { weightSymbol=%@ : weightURL=%@ : SHACode=%@ : sandboxExtension=%@} "), v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (_ANEWeight)initWithWeightSymbolAndURL:(id)a3 weightURL:(id)a4
{
  id v7;
  id v8;
  _ANEWeight *v9;
  _ANEWeight *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_ANEWeight;
  v9 = -[_ANEWeight init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_weightURL, a4);
    objc_storeStrong((id *)&v10->_weightSymbol, a3);
  }

  return v10;
}

- (_ANEWeight)initWithWeightSymbolAndURLSHA:(id)a3 weightURL:(id)a4 SHACode:(id)a5 sandboxExtension:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  _ANEWeight *v15;
  _ANEWeight *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)_ANEWeight;
  v15 = -[_ANEWeight init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_weightURL, a4);
    objc_storeStrong((id *)&v16->_weightSymbol, a3);
    objc_storeStrong((id *)&v16->_SHACode, a5);
    objc_storeStrong((id *)&v16->_sandboxExtension, a6);
  }

  return v16;
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
  void *v7;
  id v8;

  v4 = a3;
  -[_ANEWeight weightURL](self, "weightURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("url"));

  -[_ANEWeight weightSymbol](self, "weightSymbol");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("weightSymbol"));

  -[_ANEWeight SHACode](self, "SHACode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("SHACode"));

  -[_ANEWeight sandboxExtension](self, "sandboxExtension");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("sandboxExtension"));

}

- (_ANEWeight)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _ANEWeight *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("weightSymbol"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SHACode"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sandboxExtension"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[_ANEWeight initWithWeightSymbolAndURLSHA:weightURL:SHACode:sandboxExtension:](self, "initWithWeightSymbolAndURLSHA:weightURL:SHACode:sandboxExtension:", v6, v5, v7, v8);
  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSObject *v4;

  +[_ANELog common](_ANELog, "common", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[_ANEProcedureData copyWithZone:].cold.1(a2, v4);

  return 0;
}

- (NSString)weightSymbol
{
  return self->_weightSymbol;
}

- (NSURL)weightURL
{
  return self->_weightURL;
}

- (NSData)SHACode
{
  return self->_SHACode;
}

- (NSString)sandboxExtension
{
  return self->_sandboxExtension;
}

- (void)setSandboxExtension:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sandboxExtension, 0);
  objc_storeStrong((id *)&self->_SHACode, 0);
  objc_storeStrong((id *)&self->_weightURL, 0);
  objc_storeStrong((id *)&self->_weightSymbol, 0);
}

@end
