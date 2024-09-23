@implementation NSKeyValueUndefinedGetter

- (NSKeyValueUndefinedGetter)initWithContainerClassID:(id)a3 key:(id)a4 containerIsa:(Class)a5
{
  objc_method *InstanceMethod;
  IMP Implementation;
  objc_super v11;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  InstanceMethod = class_getInstanceMethod(a5, sel_valueForUndefinedKey_);
  Implementation = method_getImplementation(InstanceMethod);
  v12[1] = 0;
  v12[2] = 0;
  v11.receiver = self;
  v11.super_class = (Class)NSKeyValueUndefinedGetter;
  v12[0] = a4;
  return -[NSKeyValueAccessor initWithContainerClassID:key:implementation:selector:extraArguments:count:](&v11, sel_initWithContainerClassID_key_implementation_selector_extraArguments_count_, a3, a4, Implementation, sel_valueForUndefinedKey_, v12, 1);
}

@end
