@implementation NSKeyValueAccessor

- (NSKeyValueAccessor)initWithContainerClassID:(id)a3 key:(id)a4 implementation:(void *)a5 selector:(SEL)a6 extraArguments:(void *)a7[3] count:(unint64_t)a8
{
  NSKeyValueAccessor *v14;
  NSKeyValueAccessor *v15;
  CFHashCode v16;
  void *key;
  NSString *v18;
  objc_super v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)NSKeyValueAccessor;
  v14 = -[NSKeyValueAccessor init](&v20, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_containerClassID = a3;
    v16 = objc_msgSend(a4, "copy");
    v15->_key = (NSString *)v16;
    v15->_implementation = a5;
    v15->_selector = a6;
    if (v16)
      v16 = CFHash((CFTypeRef)v16);
    v15->_hash = v16 ^ (unint64_t)a3;
    v15->_extraArgumentCount = a8;
    key = *a7;
    if (*a7 == a4)
      key = v15->_key;
    v15->_extraArgument1 = key;
    v18 = (NSString *)a7[1];
    if (v18 == a4)
      v18 = v15->_key;
    v15->_extraArgument2 = v18;
    v15->_extraArgument3 = a7[2];
  }
  return v15;
}

- (void)extraArgument2
{
  return self->_extraArgument2;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSKeyValueAccessor;
  -[NSKeyValueAccessor dealloc](&v3, sel_dealloc);
}

- (id)key
{
  return self->_key;
}

- (id)containerClassID
{
  return self->_containerClassID;
}

- (SEL)selector
{
  return self->_selector;
}

- (unint64_t)extraArgumentCount
{
  return self->_extraArgumentCount;
}

- (void)extraArgument1
{
  return self->_extraArgument1;
}

@end
