@implementation CCMutableRepeatedInt64

- (CCMutableRepeatedInt64)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CCMutableRepeatedInt64;
  return (CCMutableRepeatedInt64 *)-[CCRepeatedFieldValue _init](&v3, sel__init);
}

+ (id)new
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___CCMutableRepeatedInt64;
  return objc_msgSendSuper2(&v3, sel__new);
}

- (void)appendInt64Value:(int64_t)a3
{
  void *v4;
  id v5;

  -[CCRepeatedFieldValue values](self, "values");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithLongLong:", a3);
  objc_msgSend(v5, "addObject:", v4);

}

- (id)copyWithZone:(_NSZone *)a3
{
  CCRepeatedInt64 *v5;
  void *v6;
  void *v7;
  CCRepeatedInt64 *v8;

  v5 = +[CCRepeatedInt64 allocWithZone:](CCRepeatedInt64, "allocWithZone:");
  -[CCRepeatedFieldValue values](self, "values");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopyWithZone:", a3);
  v8 = -[CCRepeatedFieldValue initWithMutableArray:](v5, "initWithMutableArray:", v7);

  return v8;
}

@end
