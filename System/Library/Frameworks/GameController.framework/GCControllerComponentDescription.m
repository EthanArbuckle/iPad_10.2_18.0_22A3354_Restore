@implementation GCControllerComponentDescription

void __51___GCControllerComponentDescription_initWithCoder___block_invoke()
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
  v5 = (void *)initWithCoder__BindingClasses;
  initWithCoder__BindingClasses = v4;

}

void ___GCControllerComponentDescription_Classes_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = objc_alloc((Class)&off_254DEBEC0);
  v0 = objc_opt_class();
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_msgSend(v12, "initWithObjects:", v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
  v11 = (void *)_GCControllerComponentDescription_Classes_Classes;
  _GCControllerComponentDescription_Classes_Classes = v10;

}

@end
