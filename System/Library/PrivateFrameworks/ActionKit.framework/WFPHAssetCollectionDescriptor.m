@implementation WFPHAssetCollectionDescriptor

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)JSONKeyPathsByPropertyKey
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "mtl_identityPropertyMapWithModel:", a1);
}

+ (unint64_t)storageBehaviorForPropertyWithKey:(id)a3
{
  id v4;
  unint64_t v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("localIdentifier")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___WFPHAssetCollectionDescriptor;
    v5 = (unint64_t)objc_msgSendSuper2(&v7, sel_storageBehaviorForPropertyWithKey_, v4);
  }

  return v5;
}

- (WFPHAssetCollectionDescriptor)initWithLocalIdentifier:(id)a3 localizedTitle:(id)a4
{
  id v6;
  id v7;
  WFPHAssetCollectionDescriptor *v8;
  uint64_t v9;
  NSString *localIdentifier;
  uint64_t v11;
  NSString *localizedTitle;
  WFPHAssetCollectionDescriptor *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WFPHAssetCollectionDescriptor;
  v8 = -[MTLModel init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    localIdentifier = v8->_localIdentifier;
    v8->_localIdentifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    localizedTitle = v8->_localizedTitle;
    v8->_localizedTitle = (NSString *)v11;

    v13 = v8;
  }

  return v8;
}

- (NSString)localIdentifier
{
  return self->_localIdentifier;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_localIdentifier, 0);
}

@end
