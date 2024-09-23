@implementation GCDevicePhysicalInputComponentDescription

void __60___GCDevicePhysicalInputComponentDescription_initWithCoder___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  +[NSMutableSet set](&off_254DEBF30, "set");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", objc_opt_class());
  _GCHIDEventSourceDescription_Classes();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unionSet:", v0);

  _GCGamepadEventSourceDescription_Classes();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unionSet:", v1);

  _GCKeyboardEventSourceDescription_Classes();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unionSet:", v2);

  _GCMotionEventSourceDescription_Classes();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unionSet:", v3);

  objc_msgSend(v6, "addObject:", objc_opt_class());
  v4 = objc_msgSend(v6, "copy");
  v5 = (void *)initWithCoder__BindingClasses_1;
  initWithCoder__BindingClasses_1 = v4;

}

@end
