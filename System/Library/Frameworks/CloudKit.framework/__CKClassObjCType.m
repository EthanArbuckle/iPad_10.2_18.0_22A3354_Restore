@implementation __CKClassObjCType

- (__CKClassObjCType)initWithCode:(int64_t)a3 encoding:(id)a4 class:(Class)a5
{
  __CKClassObjCType *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)__CKClassObjCType;
  result = -[__CKDynamicObjCType initWithCode:encoding:](&v7, sel_initWithCode_encoding_, a3, a4);
  if (result)
    result->_class = a5;
  return result;
}

- (id)className
{
  return NSStringFromClass(self->_class);
}

- (id)name
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend_className(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingString_(v4, v5, (uint64_t)CFSTR("*"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
