@implementation CCMutableRepeatedInt32

- (CCMutableRepeatedInt32)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CCMutableRepeatedInt32;
  return (CCMutableRepeatedInt32 *)-[CCRepeatedFieldValue _init](&v3, sel__init);
}

+ (id)new
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___CCMutableRepeatedInt32;
  return objc_msgSendSuper2(&v3, sel__new);
}

- (void)appendInt32Value:(int)a3
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)&a3;
  -[CCRepeatedFieldValue values](self, "values");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", v3);
  objc_msgSend(v5, "addObject:", v4);

}

- (id)copyWithZone:(_NSZone *)a3
{
  CCRepeatedInt32 *v5;
  void *v6;
  void *v7;
  CCRepeatedInt32 *v8;

  v5 = +[CCRepeatedInt32 allocWithZone:](CCRepeatedInt32, "allocWithZone:");
  -[CCRepeatedFieldValue values](self, "values");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopyWithZone:", a3);
  v8 = -[CCRepeatedFieldValue initWithMutableArray:](v5, "initWithMutableArray:", v7);

  return v8;
}

@end
