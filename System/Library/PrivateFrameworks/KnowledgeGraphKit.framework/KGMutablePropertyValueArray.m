@implementation KGMutablePropertyValueArray

- (KGMutablePropertyValueArray)init
{
  id v3;
  KGMutableElementIdentifierSet *v4;
  KGMutablePropertyValueArray *v5;
  objc_super v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = objc_alloc_init(KGMutableElementIdentifierSet);
  v7.receiver = self;
  v7.super_class = (Class)KGMutablePropertyValueArray;
  v5 = -[KGPropertyValueArray initWithValues:elementIdentifiers:](&v7, sel_initWithValues_elementIdentifiers_, v3, v4);

  return v5;
}

- (void)appendValue:(id)a3 forIdentifier:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  -[KGPropertyValueArray elementIdentifiers](self, "elementIdentifiers");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addIdentifier:", a4);
  -[KGPropertyValueArray values](self, "values");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v6);

}

@end
