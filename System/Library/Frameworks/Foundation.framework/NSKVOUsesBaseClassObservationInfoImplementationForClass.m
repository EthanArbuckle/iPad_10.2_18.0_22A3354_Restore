@implementation NSKVOUsesBaseClassObservationInfoImplementationForClass

IMP ___NSKVOUsesBaseClassObservationInfoImplementationForClass_block_invoke()
{
  objc_class *v0;
  objc_class *v1;
  IMP result;

  v0 = (objc_class *)objc_opt_class();
  _MergedGlobals_101 = (uint64_t)class_getMethodImplementation(v0, sel_observationInfo);
  v1 = (objc_class *)objc_opt_class();
  result = class_getMethodImplementation(v1, sel_setObservationInfo_);
  qword_1ECD09C58 = (uint64_t)result;
  return result;
}

@end
