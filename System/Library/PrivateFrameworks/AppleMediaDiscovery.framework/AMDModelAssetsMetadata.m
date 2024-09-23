@implementation AMDModelAssetsMetadata

- (AMDModelAssetsMetadata)initWithDictionary:(id)a3
{
  AMDModelAssetsMetadata *v3;
  id v5;
  AMDModelAssetsMetadata *v6;
  objc_super v7;
  id location[2];
  AMDModelAssetsMetadata *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v9;
  v9 = 0;
  v7.receiver = v3;
  v7.super_class = (Class)AMDModelAssetsMetadata;
  v9 = -[AMDModelAssetsMetadata init](&v7, sel_init);
  objc_storeStrong((id *)&v9, v9);
  v5 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("dictionaries"));
  -[AMDModelAssetsMetadata setDictionaryIds:](v9, "setDictionaryIds:");

  v6 = v9;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v9, 0);
  return v6;
}

- (id)getDictionaryIds
{
  return -[AMDModelAssetsMetadata dictionaryIds](self, "dictionaryIds", a2, self);
}

- (BOOL)isValid
{
  return 1;
}

- (NSArray)dictionaryIds
{
  return self->_dictionaryIds;
}

- (void)setDictionaryIds:(id)a3
{
  objc_storeStrong((id *)&self->_dictionaryIds, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionaryIds, 0);
}

@end
