@implementation CCMutableRepeatedUInt32

- (CCMutableRepeatedUInt32)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CCMutableRepeatedUInt32;
  return (CCMutableRepeatedUInt32 *)-[CCRepeatedFieldValue _init](&v3, sel__init);
}

+ (id)new
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___CCMutableRepeatedUInt32;
  return objc_msgSendSuper2(&v3, sel__new);
}

- (void)appendUInt32Value:(unsigned int)a3
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)&a3;
  -[CCRepeatedFieldValue values](self, "values");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", v3);
  objc_msgSend(v5, "addObject:", v4);

}

- (id)copyWithZone:(_NSZone *)a3
{
  CCRepeatedUInt32 *v5;
  void *v6;
  void *v7;
  CCRepeatedUInt32 *v8;

  v5 = +[CCRepeatedUInt32 allocWithZone:](CCRepeatedUInt32, "allocWithZone:");
  -[CCRepeatedFieldValue values](self, "values");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopyWithZone:", a3);
  v8 = -[CCRepeatedFieldValue initWithMutableArray:](v5, "initWithMutableArray:", v7);

  return v8;
}

@end
