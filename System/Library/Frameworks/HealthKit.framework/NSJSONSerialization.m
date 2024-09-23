@implementation NSJSONSerialization

void __66__NSJSONSerialization_HealthKit__hk_JSONObjectSecureCodingClasses__block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  Class v5;
  uint64_t v6;
  void *v7;
  id v8;

  v0 = objc_alloc(MEMORY[0x1E0C99E20]);
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v8 = (id)objc_msgSend(v0, "initWithObjects:", v1, v2, v3, v4, objc_opt_class(), 0);
  v5 = NSClassFromString(CFSTR("_NSJSONRoundTrippingNumber"));
  if (v5)
    objc_msgSend(v8, "addObject:", v5);
  v6 = objc_msgSend(v8, "copy");
  v7 = (void *)hk_JSONObjectSecureCodingClasses_classes;
  hk_JSONObjectSecureCodingClasses_classes = v6;

}

@end
