@implementation HDDeferredFeaturePropertiesWriting

void __50___HDDeferredFeaturePropertiesWriting_synchronize__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_opt_class();
  HKCreateSerialUtilityDispatchQueue();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_217;
  _MergedGlobals_217 = v0;

}

id __50___HDDeferredFeaturePropertiesWriting_synchronize__block_invoke_2(uint64_t a1)
{
  id v2;
  objc_super v4;

  v2 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "waitForActiveOrAltAccountDevice");
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)_HDDeferredFeaturePropertiesWriting;
  return objc_msgSendSuper2(&v4, sel_synchronize);
}

@end
