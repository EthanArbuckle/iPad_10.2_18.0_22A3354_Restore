@implementation _LSDictionaryBackedPropertyList

- (BOOL)_getValue:(id *)a3 forPropertyListKey:(id)a4
{
  id v5;

  -[NSDictionary objectForKeyedSubscript:](self->_plist, "objectForKeyedSubscript:", a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *a3 = v5;
  return v5 != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plist, 0);
}

- (_LSDictionaryBackedPropertyList)initWithPropertyList:(id)a3
{
  id v4;
  _LSDictionaryBackedPropertyList *v5;
  uint64_t v6;
  NSDictionary *plist;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_LSDictionaryBackedPropertyList;
  v5 = -[_LSLazyPropertyList init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    plist = v5->_plist;
    v5->_plist = (NSDictionary *)v6;

  }
  return v5;
}

- (BOOL)_getPropertyList:(id *)a3
{
  NSDictionary *v4;

  v4 = objc_retainAutorelease(self->_plist);
  *a3 = v4;
  return v4 != 0;
}

- (_LSDictionaryBackedPropertyList)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _LSDictionaryBackedPropertyList *v8;

  v4 = a3;
  v5 = objc_opt_class();
  XNSGetPropertyListClasses();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ls_decodeDictionaryWithKeysOfClass:valuesOfClasses:forKey:", v5, v6, CFSTR("plist"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[_LSDictionaryBackedPropertyList initWithPropertyList:](self, "initWithPropertyList:", v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_plist, CFSTR("plist"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
