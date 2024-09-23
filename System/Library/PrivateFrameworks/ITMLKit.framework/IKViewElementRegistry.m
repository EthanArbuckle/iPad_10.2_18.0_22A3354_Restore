@implementation IKViewElementRegistry

- (IKViewElementRegistry)init
{
  IKViewElementRegistry *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *classMap;
  NSMutableDictionary *v5;
  NSMutableDictionary *typeMap;
  NSMutableDictionary *v7;
  NSMutableDictionary *dependentMap;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)IKViewElementRegistry;
  v2 = -[IKViewElementRegistry init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    classMap = v2->_classMap;
    v2->_classMap = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    typeMap = v2->_typeMap;
    v2->_typeMap = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    dependentMap = v2->_dependentMap;
    v2->_dependentMap = v7;

  }
  return v2;
}

- (void)registerClass:(Class)a3 forElementName:(id)a4 elementType:(unint64_t)a5
{
  -[IKViewElementRegistry registerClass:forElementName:elementType:dependent:](self, "registerClass:forElementName:elementType:dependent:", a3, a4, a5, 0);
}

- (void)registerClass:(Class)a3 forElementName:(id)a4 elementType:(unint64_t)a5 dependent:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSMutableDictionary *typeMap;
  void *v15;
  NSMutableDictionary *dependentMap;
  void *v17;
  void *v18;

  v6 = a6;
  v10 = a4;
  v11 = v10;
  if (a3)
  {
    v18 = v10;
    v12 = objc_msgSend(v10, "length");
    v11 = v18;
    if (v12)
    {
      objc_msgSend(v18, "ik_sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](self->_classMap, "setObject:forKey:", a3, v13);
      typeMap = self->_typeMap;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](typeMap, "setObject:forKey:", v15, v13);

      dependentMap = self->_dependentMap;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](dependentMap, "setObject:forKey:", v17, v13);

      v11 = v18;
    }
  }

}

- (Class)elementClassByTagName:(id)a3
{
  return (Class)-[NSMutableDictionary objectForKeyedSubscript:](self->_classMap, "objectForKeyedSubscript:", a3);
}

- (unint64_t)elementTypeByTagName:(id)a3
{
  void *v3;
  unint64_t v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_typeMap, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (BOOL)isDependentByTagName:(id)a3
{
  void *v3;
  char v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_dependentMap, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dependentMap, 0);
  objc_storeStrong((id *)&self->_typeMap, 0);
  objc_storeStrong((id *)&self->_classMap, 0);
}

@end
