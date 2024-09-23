@implementation CPLDefaultValueObjectNil

BOOL _CPLDefaultValueObjectNil_block_invoke_3(uint64_t a1, void *a2, const char *a3)
{
  id v4;
  objc_class *v5;
  IMP MethodImplementation;
  void *v7;

  v4 = a2;
  v5 = (objc_class *)objc_opt_class();
  MethodImplementation = class_getMethodImplementation(v5, a3);
  ((void (*)(id, const char *))MethodImplementation)(v4, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7 == 0;
}

@end
