@implementation PrettyPropertyDescription

- (PrettyPropertyDescription)initWithClassName:(id)a3 propertyName:(id)a4 andPropertyValue:(id)a5 andRecursiveDepth:(unint64_t)a6
{
  NSString *v9;
  id v10;
  __CFString *v11;
  PrettyPropertyDescription *v12;
  NSString *className;
  NSString *v14;
  __CFString *v15;
  id propertyValue;
  objc_super v18;

  v9 = (NSString *)a3;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)PrettyPropertyDescription;
  v11 = (__CFString *)a4;
  v12 = -[PrettyPropertyDescription init](&v18, "init");
  className = v12->_className;
  v12->_className = v9;
  v14 = v9;

  if (v11)
    v15 = v11;
  else
    v15 = &stru_1001EDF88;
  objc_storeStrong((id *)&v12->_propertyName, v15);
  propertyValue = v12->_propertyValue;
  v12->_propertyValue = v10;

  return v12;
}

+ (id)describingPropertyNamed:(id)a3 withClassName:(id)a4 andValue:(id)a5 andRecursiveDepth:(unint64_t)a6
{
  id v9;
  id v10;
  id v11;
  PrettyPropertyDescription *v12;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = -[PrettyPropertyDescription initWithClassName:propertyName:andPropertyValue:andRecursiveDepth:]([PrettyPropertyDescription alloc], "initWithClassName:propertyName:andPropertyValue:andRecursiveDepth:", v10, v11, v9, a6);

  return v12;
}

+ (id)describingPropertyNamed:(id)a3 withClassType:(Class)a4 andValue:(id)a5 andRecursiveDepth:(unint64_t)a6
{
  id v9;
  id v10;
  NSString *v11;
  void *v12;
  void *v13;

  v9 = a5;
  v10 = a3;
  v11 = NSStringFromClass(a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[PrettyPropertyDescription describingPropertyNamed:withClassName:andValue:andRecursiveDepth:](PrettyPropertyDescription, "describingPropertyNamed:withClassName:andValue:andRecursiveDepth:", v10, v12, v9, a6));

  return v13;
}

- (NSString)className
{
  return self->_className;
}

- (NSString)propertyName
{
  return self->_propertyName;
}

- (id)propertyValue
{
  return self->_propertyValue;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_propertyValue, 0);
  objc_storeStrong((id *)&self->_propertyName, 0);
  objc_storeStrong((id *)&self->_className, 0);
}

@end
