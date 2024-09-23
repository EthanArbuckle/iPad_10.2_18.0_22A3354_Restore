@implementation NSArray

IMP __36__NSArray_NSArray__encodeWithCoder___block_invoke(uint64_t a1)
{
  IMP result;

  _MergedGlobals_90 = (uint64_t)class_getMethodImplementation((Class)NSKeyedArchiver, *(SEL *)(a1 + 32));
  result = class_getMethodImplementation((Class)NSXPCEncoder, *(SEL *)(a1 + 32));
  qword_1ECD09B00 = (uint64_t)result;
  return result;
}

@end
