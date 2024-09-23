@implementation PUPickerItemIdentifiersFilter

- (PUPickerItemIdentifiersFilter)initWithItemIdentifiers:(id)a3
{
  id v4;
  PUPickerItemIdentifiersFilter *v5;
  uint64_t v6;
  NSArray *itemIdentifiers;
  PUPickerItemIdentifiersFilter *v8;
  PUPickerItemIdentifiersFilter *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PUPickerItemIdentifiersFilter;
  v5 = -[PUPickerItemIdentifiersFilter init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    itemIdentifiers = v5->_itemIdentifiers;
    v5->_itemIdentifiers = (NSArray *)v6;

  }
  if (-[PUPickerItemIdentifiersFilter isValidFilter](v5, "isValidFilter"))
    v8 = v5;
  else
    v8 = 0;
  v9 = v8;

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  PUPickerItemIdentifiersFilter *v4;
  PUPickerItemIdentifiersFilter *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  char v9;
  objc_class *v11;
  objc_class *v12;
  PUPickerItemIdentifiersFilter *v13;
  SEL v14;

  v4 = (PUPickerItemIdentifiersFilter *)a3;
  if (self == v4)
  {
    v9 = 1;
LABEL_11:

    return v9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = 0;
    goto LABEL_11;
  }
  v5 = v4;
  v6 = (objc_class *)objc_opt_class();
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[PUPickerItemIdentifiersFilter itemIdentifiers](self, "itemIdentifiers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPickerItemIdentifiersFilter itemIdentifiers](v5, "itemIdentifiers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 == v8)
        v9 = 1;
      else
        v9 = objc_msgSend(v7, "isEqual:", v8);

      goto LABEL_11;
    }
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    objc_claimAutoreleasedReturnValue();
  }
  else
  {
    NSStringFromClass(v6);
    objc_claimAutoreleasedReturnValue();
  }
  v13 = (PUPickerItemIdentifiersFilter *)_PFAssertFailHandler();
  return -[PUPickerItemIdentifiersFilter hash](v13, v14);
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PUPickerItemIdentifiersFilter itemIdentifiers](self, "itemIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash") + 211;

  return v3;
}

- (BOOL)isValidFilter
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  -[PUPickerItemIdentifiersFilter itemIdentifiers](self, "itemIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");
  if (!v3)
  {
    PLPickerGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 134217984;
      v7 = objc_msgSend(v2, "count");
      _os_log_impl(&dword_20D1E2000, v4, OS_LOG_TYPE_ERROR, "PUPickerItemIdentifiersFilter: invalid asset identifier count: %ld", (uint8_t *)&v6, 0xCu);
    }

  }
  return v3 != 0;
}

- (BOOL)allowsSearchSuggestions
{
  return 0;
}

- (BOOL)allowsAlbums
{
  return 0;
}

- (id)generatedAssetPredicate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x24BDE35D0];
  v3 = (void *)MEMORY[0x24BDBCF20];
  -[PUPickerItemIdentifiersFilter itemIdentifiers](self, "itemIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuidsFromLocalIdentifiers:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("uuid"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)generatedPossibleAssetTypes
{
  return 131070;
}

- (unint64_t)generatedRequiredAssetTypes
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PUPickerItemIdentifiersFilter *v4;
  void *v5;
  PUPickerItemIdentifiersFilter *v6;

  v4 = [PUPickerItemIdentifiersFilter alloc];
  -[PUPickerItemIdentifiersFilter itemIdentifiers](self, "itemIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PUPickerItemIdentifiersFilter initWithItemIdentifiers:](v4, "initWithItemIdentifiers:", v5);

  return v6;
}

- (PUPickerItemIdentifiersFilter)initWithCoder:(id)a3
{
  id v4;
  PUPickerItemIdentifiersFilter *v5;
  uint64_t v6;
  NSArray *itemIdentifiers;
  PUPickerItemIdentifiersFilter *v8;
  PUPickerItemIdentifiersFilter *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PUPickerItemIdentifiersFilter;
  v5 = -[PUPickerItemIdentifiersFilter init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("PUPickerItemIdentifiersFilterDictionaryAssetIdentifiersKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    itemIdentifiers = v5->_itemIdentifiers;
    v5->_itemIdentifiers = (NSArray *)v6;

  }
  if (-[PUPickerItemIdentifiersFilter isValidFilter](v5, "isValidFilter"))
    v8 = v5;
  else
    v8 = 0;
  v9 = v8;

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PUPickerItemIdentifiersFilter itemIdentifiers](self, "itemIdentifiers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("PUPickerItemIdentifiersFilterDictionaryAssetIdentifiersKey"));

}

- (NSArray)itemIdentifiers
{
  return self->_itemIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemIdentifiers, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
