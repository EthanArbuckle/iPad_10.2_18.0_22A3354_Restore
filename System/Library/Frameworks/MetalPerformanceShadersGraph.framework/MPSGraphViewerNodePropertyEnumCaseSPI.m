@implementation MPSGraphViewerNodePropertyEnumCaseSPI

- (MPSGraphViewerNodePropertyEnumCaseSPI)initWithName:(id)a3 value:(unint64_t)a4
{
  id v7;
  MPSGraphViewerNodePropertyEnumCaseSPI *v8;
  MPSGraphViewerNodePropertyEnumCaseSPI *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MPSGraphViewerNodePropertyEnumCaseSPI;
  v8 = -[MPSGraphViewerNodePropertyEnumCaseSPI init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_name, a3);
    v9->_value = a4;
  }

  return v9;
}

- (MPSGraphViewerNodePropertyEnumCaseSPI)initWithJSONDictionary:(id)a3
{
  id v4;
  MPSGraphViewerNodePropertyEnumCaseSPI *v5;
  uint64_t v6;
  NSString *name;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MPSGraphViewerNodePropertyEnumCaseSPI;
  v5 = -[MPSGraphViewerNodePropertyEnumCaseSPI init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "objectForKey:", CFSTR("value"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_value = objc_msgSend(v8, "unsignedIntValue");

  }
  return v5;
}

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraphViewerNodePropertyEnumCaseSPI name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MPSGraphViewerNodePropertyEnumCaseSPI name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("name"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MPSGraphViewerNodePropertyEnumCaseSPI value](self, "value"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("value"));

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
