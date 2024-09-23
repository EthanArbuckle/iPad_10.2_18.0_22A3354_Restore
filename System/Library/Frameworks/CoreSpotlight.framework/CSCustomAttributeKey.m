@implementation CSCustomAttributeKey

+ (BOOL)_keyNameIsValid:(id)a3
{
  id v3;
  void *v4;
  char v5;
  char v6;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  if ((v5 & 1) != 0)
    goto LABEL_6;
  if (_keyNameIsValid__onceToken != -1)
    dispatch_once(&_keyNameIsValid__onceToken, &__block_literal_global_1645);
  if (objc_msgSend(v3, "rangeOfCharacterFromSet:", _keyNameIsValid__illegalCharacters) != 0x7FFFFFFFFFFFFFFFLL)
LABEL_6:
    v6 = 0;
  else
    v6 = objc_msgSend(v3, "canBeConvertedToEncoding:", 1);

  return v6;
}

uint64_t __40__CSCustomAttributeKey__keyNameIsValid___block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = objc_opt_new();
  v1 = (void *)_keyNameIsValid__illegalCharacters;
  _keyNameIsValid__illegalCharacters = v0;

  v2 = (void *)_keyNameIsValid__illegalCharacters;
  objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "formUnionWithCharacterSet:", v3);

  return objc_msgSend((id)_keyNameIsValid__illegalCharacters, "removeCharactersInString:", CFSTR("_"));
}

- (CSCustomAttributeKey)init
{
  id v2;
  objc_class *v3;
  void *v4;
  uint64_t v5;
  id v6;

  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "initWithFormat:", CFSTR("You must call -[%@ initWithKeyName...]"), v4);

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (CSCustomAttributeKey)initWithKeyName:(NSString *)keyName
{
  return -[CSCustomAttributeKey initWithKeyName:searchable:searchableByDefault:unique:multiValued:](self, "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", keyName, 1, 0, 0, 0);
}

- (CSCustomAttributeKey)initWithKeyName:(NSString *)keyName searchable:(BOOL)searchable searchableByDefault:(BOOL)searchableByDefault unique:(BOOL)unique multiValued:(BOOL)multiValued
{
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  NSString *v12;
  CSCustomAttributeKey *v13;
  CSCustomAttributeKey *v14;
  CSCustomAttributeKey *v15;
  objc_super v17;

  v7 = multiValued;
  v8 = unique;
  v9 = searchableByDefault;
  v10 = searchable;
  v12 = keyName;
  if (objc_msgSend((id)objc_opt_class(), "_keyNameIsValid:", v12))
  {
    v17.receiver = self;
    v17.super_class = (Class)CSCustomAttributeKey;
    v13 = -[CSCustomAttributeKey init](&v17, sel_init);
    v14 = v13;
    if (v13)
    {
      -[CSCustomAttributeKey setKeyName:](v13, "setKeyName:", v12);
      -[CSCustomAttributeKey setSearchable:](v14, "setSearchable:", v10);
      -[CSCustomAttributeKey setSearchableByDefault:](v14, "setSearchableByDefault:", v9);
      -[CSCustomAttributeKey setUnique:](v14, "setUnique:", v8);
      -[CSCustomAttributeKey setMultiValued:](v14, "setMultiValued:", v7);
    }
    self = v14;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[CSCustomAttributeKey keyName](self, "keyName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("keyName"));

  objc_msgSend(v5, "encodeBool:forKey:", -[CSCustomAttributeKey isUnique](self, "isUnique"), CFSTR("isUnique"));
  objc_msgSend(v5, "encodeBool:forKey:", -[CSCustomAttributeKey isSearchable](self, "isSearchable"), CFSTR("isSearchable"));
  objc_msgSend(v5, "encodeBool:forKey:", -[CSCustomAttributeKey isSearchableByDefault](self, "isSearchableByDefault"), CFSTR("isSearchableByDefault"));
  objc_msgSend(v5, "encodeBool:forKey:", -[CSCustomAttributeKey isMultiValued](self, "isMultiValued"), CFSTR("isMultiValued"));

}

- (CSCustomAttributeKey)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CSCustomAttributeKey *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isUnique"));
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSearchable"));
  v8 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSearchableByDefault"));
  v9 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isMultiValued"));

  v10 = -[CSCustomAttributeKey initWithKeyName:searchable:searchableByDefault:unique:multiValued:](self, "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", v5, v7, v8, v6, v9);
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[CSCustomAttributeKey keyName](self, "keyName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithKeyName:", v5);

  objc_msgSend(v6, "setUnique:", -[CSCustomAttributeKey isUnique](self, "isUnique"));
  objc_msgSend(v6, "setSearchableByDefault:", -[CSCustomAttributeKey isSearchableByDefault](self, "isSearchableByDefault"));
  objc_msgSend(v6, "setSearchable:", -[CSCustomAttributeKey isSearchable](self, "isSearchable"));
  objc_msgSend(v6, "setMultiValued:", -[CSCustomAttributeKey isMultiValued](self, "isMultiValued"));
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[CSCustomAttributeKey keyName](self, "keyName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "keyName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqualToString:", v7);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = 0;
      goto LABEL_7;
    }
    -[CSCustomAttributeKey keyName](self, "keyName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v4);
  }

LABEL_7:
  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[CSCustomAttributeKey keyName](self, "keyName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[CSCustomAttributeKey keyName](self, "keyName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)keyName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setKeyName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BOOL)isSearchable
{
  return self->_searchable;
}

- (void)setSearchable:(BOOL)a3
{
  self->_searchable = a3;
}

- (BOOL)isSearchableByDefault
{
  return self->_searchableByDefault;
}

- (void)setSearchableByDefault:(BOOL)a3
{
  self->_searchableByDefault = a3;
}

- (BOOL)isUnique
{
  return self->_unique;
}

- (void)setUnique:(BOOL)a3
{
  self->_unique = a3;
}

- (BOOL)isMultiValued
{
  return self->_multiValued;
}

- (void)setMultiValued:(BOOL)a3
{
  self->_multiValued = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyName, 0);
}

@end
