@implementation _ASWebsiteNameDictionary

- (id)websiteNameForDomain:(id)a3
{
  -[NSDictionary objectForKeyedSubscript:](self->_websiteNameDictionary, "objectForKeyedSubscript:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (_ASWebsiteNameDictionary)initWithSnapshotData:(id)a3 error:(id *)a4
{
  id v5;
  _ASWebsiteNameDictionary *v6;
  _ASWebsiteNameDictionary *v7;
  _ASWebsiteNameDictionary *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSDictionary *websiteNameDictionary;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_ASWebsiteNameDictionary;
  v6 = -[_ASWebsiteNameDictionary init](&v14, sel_init);
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    v9 = (void *)objc_opt_class();
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v5, 24, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sanitizedDataFromDeserializedData:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    websiteNameDictionary = v7->_websiteNameDictionary;
    v7->_websiteNameDictionary = (NSDictionary *)v11;

    if (v7->_websiteNameDictionary)
      v8 = v7;
    else
      v8 = 0;
  }

  return v8;
}

- (id)snapshotData
{
  return (id)objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", self->_websiteNameDictionary, 0, 0);
}

+ (id)sanitizedDataFromDeserializedData:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v12 = 1;
    v4 = v3;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __62___ASWebsiteNameDictionary_sanitizedDataFromDeserializedData___block_invoke;
    v8[3] = &unk_24C950248;
    v8[4] = &v9;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);
    if (*((_BYTE *)v10 + 24))
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;

    _Block_object_dispose(&v9, 8);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; count(websiteNameDictionary) = %ld>"),
    v5,
    self,
    -[NSDictionary count](self->_websiteNameDictionary, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_websiteNameDictionary, 0);
}

@end
