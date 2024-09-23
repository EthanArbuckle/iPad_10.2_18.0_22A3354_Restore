@implementation NSKeyValueContainerClass

- (NSKeyValueContainerClass)initWithOriginalClass:(Class)a3
{
  NSKeyValueContainerClass *v4;
  NSKeyValueContainerClass *v5;
  const char *v6;
  objc_class *originalClass;
  const char *v8;
  objc_method *InstanceMethod;
  objc_super v11;
  char dst;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)NSKeyValueContainerClass;
  v4 = -[NSKeyValueContainerClass init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_originalClass = a3;
    v6 = sel_registerName("observationInfo");
    v5->_cachedObservationInfoImplementation = class_getMethodImplementation(a3, v6);
    originalClass = v5->_originalClass;
    v8 = sel_registerName("setObservationInfo:");
    InstanceMethod = class_getInstanceMethod(originalClass, v8);
    v5->_cachedSetObservationInfoImplementation = method_getImplementation(InstanceMethod);
    method_getArgumentType(InstanceMethod, 2u, &dst, 1uLL);
    if (dst == 64)
      v5->_cachedSetObservationInfoTakesAnObject = 1;
  }
  return v5;
}

- (id)description
{
  uint64_t v3;
  Class originalClass;
  $69C5E68810D1BA7372CDA9EAC2E73BA6 *notifyingInfo;
  uint64_t var1;

  v3 = objc_opt_class();
  originalClass = self->_originalClass;
  notifyingInfo = self->_notifyingInfo;
  if (notifyingInfo)
    var1 = (uint64_t)notifyingInfo->var1;
  else
    var1 = objc_opt_class();
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: Original class: %@, Notifying class: %@>"), v3, originalClass, var1);
}

@end
