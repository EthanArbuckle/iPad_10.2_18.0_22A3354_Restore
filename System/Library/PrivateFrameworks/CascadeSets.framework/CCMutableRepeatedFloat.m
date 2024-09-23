@implementation CCMutableRepeatedFloat

- (CCMutableRepeatedFloat)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CCMutableRepeatedFloat;
  return (CCMutableRepeatedFloat *)-[CCRepeatedFieldValue _init](&v3, sel__init);
}

+ (id)new
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___CCMutableRepeatedFloat;
  return objc_msgSendSuper2(&v3, sel__new);
}

- (void)appendFloatValue:(float)a3
{
  id v4;
  double v5;
  void *v6;
  id v7;

  -[CCRepeatedFieldValue values](self, "values");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BDD16E0]);
  *(float *)&v5 = a3;
  v6 = (void *)objc_msgSend(v4, "initWithFloat:", v5);
  objc_msgSend(v7, "addObject:", v6);

}

- (id)copyWithZone:(_NSZone *)a3
{
  CCRepeatedFloat *v5;
  void *v6;
  void *v7;
  CCRepeatedFloat *v8;

  v5 = +[CCRepeatedFloat allocWithZone:](CCRepeatedFloat, "allocWithZone:");
  -[CCRepeatedFieldValue values](self, "values");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopyWithZone:", a3);
  v8 = -[CCRepeatedFieldValue initWithMutableArray:](v5, "initWithMutableArray:", v7);

  return v8;
}

@end
