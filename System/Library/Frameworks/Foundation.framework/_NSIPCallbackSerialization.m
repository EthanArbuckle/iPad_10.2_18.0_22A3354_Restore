@implementation _NSIPCallbackSerialization

- (_NSIPCallbackSerialization)init
{
  _NSIPCallbackSerialization *v2;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)_NSIPCallbackSerialization;
  v2 = -[_NSIPCallbackSerialization init](&v4, sel_init);
  if (v2)
    v2->_UUID = objc_alloc_init(NSUUID);
  return v2;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)_NSIPCallbackSerialization;
  -[_NSIPCallbackSerialization dealloc](&v3, sel_dealloc);
}

@end
