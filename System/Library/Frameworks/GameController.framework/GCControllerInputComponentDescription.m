@implementation GCControllerInputComponentDescription

void __56___GCControllerInputComponentDescription_initWithCoder___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  +[NSMutableSet set](&off_254DEBF30, "set");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  _GCGamepadEventSourceDescription_Classes();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v0);

  objc_msgSend(v3, "addObject:", objc_opt_class());
  v1 = objc_msgSend(v3, "copy");
  v2 = (void *)initWithCoder__BindingClasses_0;
  initWithCoder__BindingClasses_0 = v1;

}

id __60___GCControllerInputComponentDescription_createWithContext___block_invoke(uint64_t a1, void *a2)
{
  return (id)objc_msgSend(a2, "makeParameters");
}

@end
