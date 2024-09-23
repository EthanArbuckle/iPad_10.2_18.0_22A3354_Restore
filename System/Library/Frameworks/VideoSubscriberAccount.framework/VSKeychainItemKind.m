@implementation VSKeychainItemKind

- (VSKeychainItemKind)init
{
  VSKeychainItemKind *v2;
  objc_class *v3;
  uint64_t v4;
  NSString *itemClassName;
  NSArray *properties;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VSKeychainItemKind;
  v2 = -[VSKeychainItemKind init](&v8, sel_init);
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = objc_claimAutoreleasedReturnValue();
    itemClassName = v2->_itemClassName;
    v2->_itemClassName = (NSString *)v4;

    properties = v2->_properties;
    v2->_properties = (NSArray *)MEMORY[0x1E0C9AA60];

  }
  return v2;
}

- (void)dealloc
{
  __CFString *secItemClass;
  objc_super v4;

  secItemClass = self->_secItemClass;
  if (secItemClass)
    CFRelease(secItemClass);
  v4.receiver = self;
  v4.super_class = (Class)VSKeychainItemKind;
  -[VSKeychainItemKind dealloc](&v4, sel_dealloc);
}

- (void)setItemClassName:(id)a3
{
  NSString *v4;
  objc_class *v5;
  NSString *v6;
  NSString *itemClassName;
  NSString *v8;

  v4 = (NSString *)a3;
  if (!v4)
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  if (v4 != self->_itemClassName)
  {
    v8 = v4;
    v6 = (NSString *)-[NSString copy](v4, "copy");
    itemClassName = self->_itemClassName;
    self->_itemClassName = v6;

    v4 = v8;
  }

}

- (void)setSecItemClass:(__CFString *)a3
{
  __CFString *secItemClass;

  secItemClass = self->_secItemClass;
  if (secItemClass != a3)
  {
    if (secItemClass)
      CFRelease(secItemClass);
    self->_secItemClass = (__CFString *)CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a3);
  }
}

- (NSDictionary)attributesByName
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[VSKeychainItemKind properties](self, "properties", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v9, "name");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKey:", v9, v10);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return (NSDictionary *)v3;
}

- (NSDictionary)attributesBySecItemAttributeKey
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[VSKeychainItemKind properties](self, "properties", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v9, "secItemAttributeKey"))
          objc_msgSend(v3, "setObject:forKey:", v9, objc_msgSend(v9, "secItemAttributeKey"));
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSDictionary *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  VSKeychainItemKind *v4;
  void *v5;
  void *v6;

  v4 = -[VSKeychainItemKind init](+[VSKeychainItemKind allocWithZone:](VSKeychainItemKind, "allocWithZone:", a3), "init");
  -[VSKeychainItemKind itemClassName](self, "itemClassName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSKeychainItemKind setItemClassName:](v4, "setItemClassName:", v5);

  -[VSKeychainItemKind setSecItemClass:](v4, "setSecItemClass:", -[VSKeychainItemKind secItemClass](self, "secItemClass"));
  -[VSKeychainItemKind properties](self, "properties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSKeychainItemKind setProperties:](v4, "setProperties:", v6);

  return v4;
}

- (NSString)itemClassName
{
  return self->_itemClassName;
}

- (__CFString)secItemClass
{
  return self->_secItemClass;
}

- (NSArray)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_itemClassName, 0);
}

@end
