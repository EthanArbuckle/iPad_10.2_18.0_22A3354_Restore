@implementation SGMicrodataItemProp

- (SGMicrodataItemProp)initWithName:(id)a3 value:(id)a4
{
  id v7;
  id v8;
  SGMicrodataItemProp *v9;
  SGMicrodataItemProp *v10;
  char isKindOfClass;
  uint64_t v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SGMicrodataItemProp;
  v9 = -[SGMicrodataItemProp init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_propertyName, a3);
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v12 = 24;
    if ((isKindOfClass & 1) != 0)
      v12 = 16;
    objc_storeStrong((id *)((char *)&v10->super.isa + v12), a4);
  }

  return v10;
}

- (NSString)propertyName
{
  return self->_propertyName;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (SGMicrodataItem)itemValue
{
  return self->_itemValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemValue, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_propertyName, 0);
}

@end
