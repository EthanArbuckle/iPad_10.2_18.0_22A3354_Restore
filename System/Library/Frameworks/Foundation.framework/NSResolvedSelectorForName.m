@implementation NSResolvedSelectorForName

IMP __NSResolvedSelectorForName_block_invoke()
{
  objc_class *v0;
  objc_method *ClassMethod;
  objc_class *v2;
  objc_class *v3;
  IMP result;

  v0 = (objc_class *)objc_opt_class();
  ClassMethod = class_getClassMethod(v0, sel_resolveInstanceMethod_);
  qword_1ECD09DA8 = (uint64_t)method_getImplementation(ClassMethod);
  v2 = (objc_class *)objc_opt_class();
  qword_1ECD09DB8 = (uint64_t)class_getMethodImplementation(v2, sel_forwardingTargetForSelector_);
  v3 = (objc_class *)objc_opt_class();
  result = class_getMethodImplementation(v3, sel_forwardInvocation_);
  qword_1ECD09DB0 = (uint64_t)result;
  return result;
}

@end
