@implementation NSKVONotifyingCreateInfoWithOriginalClass

os_log_t ___NSKVONotifyingCreateInfoWithOriginalClass_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.foundation.kvo", "general");
  qword_1ECD09C68 = (uint64_t)result;
  return result;
}

IMP ___NSKVONotifyingCreateInfoWithOriginalClass_block_invoke_13()
{
  objc_class *v0;
  objc_class *v1;
  IMP result;

  v0 = (objc_class *)objc_opt_class();
  qword_1ECD09C80 = (uint64_t)class_getMethodImplementation(v0, sel_willChangeValueForKey_);
  v1 = (objc_class *)objc_opt_class();
  result = class_getMethodImplementation(v1, sel_didChangeValueForKey_);
  qword_1ECD09C88 = (uint64_t)result;
  return result;
}

@end
