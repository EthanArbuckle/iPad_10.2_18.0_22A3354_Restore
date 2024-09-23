@implementation HMBMutableModelContainer

- (void)setTypeName:(id)a3 forModelClass:(Class)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  -[HMBModelContainer nameToClassTransform](self, "nameToClassTransform");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", a4, v6);

  -[HMBModelContainer classToNameTransform](self, "classToNameTransform");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v6, a4);

}

@end
