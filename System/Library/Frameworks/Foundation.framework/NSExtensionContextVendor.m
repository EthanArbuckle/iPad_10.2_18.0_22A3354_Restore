@implementation NSExtensionContextVendor

id __58___NSExtensionContextVendor__sharedExtensionContextVendor__block_invoke()
{
  id result;

  if (qword_1ECD09D48 != -1)
    dispatch_once(&qword_1ECD09D48, &__block_literal_global_22);
  result = objc_alloc_init((Class)_MergedGlobals_105);
  qword_1ECD09D60 = (uint64_t)result;
  return result;
}

@end
