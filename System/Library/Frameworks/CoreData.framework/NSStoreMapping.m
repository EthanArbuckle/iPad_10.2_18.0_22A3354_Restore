@implementation NSStoreMapping

- (unint64_t)hash
{
  return objc_msgSend(-[NSStoreMapping externalName](self, "externalName"), "hash");
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  id v7;

  v5 = objc_opt_class();
  if (v5 != objc_opt_class())
    return 0;
  v7 = -[NSStoreMapping externalName](self, "externalName");
  if (v7 == (id)objc_msgSend(a3, "externalName"))
    return 1;
  else
    return objc_msgSend(-[NSStoreMapping externalName](self, "externalName"), "isEqualToString:", objc_msgSend(a3, "externalName"));
}

- (void)dealloc
{
  NSString *externalName;
  objc_super v4;

  if (self)
  {
    externalName = self->_externalName;
    if (externalName)
    {

      self->_externalName = (NSString *)objc_msgSend(0, "copy");
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)NSStoreMapping;
  -[NSStoreMapping dealloc](&v4, sel_dealloc);
}

- (NSStoreMapping)initWithExternalName:(id)a3
{
  NSStoreMapping *v4;
  NSStoreMapping *v5;
  NSString *externalName;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NSStoreMapping;
  v4 = -[NSStoreMapping init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    externalName = v4->_externalName;
    if (externalName != a3)
    {

      v5->_externalName = (NSString *)objc_msgSend(a3, "copy");
    }
  }
  return v5;
}

- (id)externalName
{
  return self->_externalName;
}

- (void)copyValuesForReadOnlyFetch:(id)a3
{
  self->_externalName = (NSString *)objc_msgSend((id)objc_msgSend(a3, "externalName"), "copy");
}

@end
