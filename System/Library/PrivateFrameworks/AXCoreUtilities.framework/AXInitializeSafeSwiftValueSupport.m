@implementation AXInitializeSafeSwiftValueSupport

void ___AXInitializeSafeSwiftValueSupport_block_invoke()
{
  objc_class *v0;
  uint64_t v1;
  Class v2;
  uint64_t v3;
  objc_class *v4;

  v0 = (objc_class *)objc_opt_class();
  v1 = objc_opt_class();
  _bulkAddMethodsFromClass(v0, v1);
  v2 = NSClassFromString(CFSTR("_TtCs12_SwiftObject"));
  if (v2)
  {
    v3 = (uint64_t)v2;
    v4 = (objc_class *)objc_opt_class();
    _bulkAddMethodsFromClass(v4, v3);
  }
}

@end
