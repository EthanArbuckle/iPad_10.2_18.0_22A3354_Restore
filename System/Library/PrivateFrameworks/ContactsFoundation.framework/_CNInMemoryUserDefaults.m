@implementation _CNInMemoryUserDefaults

- (_CNInMemoryUserDefaults)init
{
  CNDictionaryPrimitiveUserDefaults *v3;
  _CNInMemoryUserDefaults *v4;
  objc_super v6;

  v3 = objc_alloc_init(CNDictionaryPrimitiveUserDefaults);
  v6.receiver = self;
  v6.super_class = (Class)_CNInMemoryUserDefaults;
  v4 = -[CNUserDefaults initWithPrimitiveDefaults:](&v6, sel_initWithPrimitiveDefaults_, v3);

  return v4;
}

- (unint64_t)synchronizeCount
{
  void *v2;
  unint64_t v3;

  -[CNUserDefaults primitiveDefaults](self, "primitiveDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "synchronizeCount");

  return v3;
}

@end
