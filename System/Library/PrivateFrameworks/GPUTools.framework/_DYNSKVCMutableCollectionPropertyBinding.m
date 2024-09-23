@implementation _DYNSKVCMutableCollectionPropertyBinding

- (_DYNSKVCMutableCollectionPropertyBinding)initWithKey:(id)a3 underlyingIvarName:(id)a4
{
  _DYNSKVCMutableCollectionPropertyBinding *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_DYNSKVCMutableCollectionPropertyBinding;
  v6 = -[_DYNSKVCMutableCollectionPropertyBinding init](&v8, sel_init);
  if (v6)
  {
    v6->_key = (NSString *)objc_msgSend(a3, "copy");
    v6->_underlyingIvarName = (NSString *)objc_msgSend(a4, "copy");
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_DYNSKVCMutableCollectionPropertyBinding;
  -[_DYNSKVCMutableCollectionPropertyBinding dealloc](&v3, sel_dealloc);
}

- (id)underlyingIvarValueForObject:(id)a3
{
  void *outValue;

  outValue = 0;
  if (object_getInstanceVariable(a3, -[NSString UTF8String](self->_underlyingIvarName, "UTF8String"), &outValue))
    return outValue;
  else
    return 0;
}

- (NSString)key
{
  return self->_key;
}

- (NSString)underlyingIvarName
{
  return self->_underlyingIvarName;
}

@end
