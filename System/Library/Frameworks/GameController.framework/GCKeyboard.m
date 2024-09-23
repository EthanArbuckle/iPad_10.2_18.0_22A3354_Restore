@implementation GCKeyboard

+ (GCKeyboard)coalescedKeyboard
{
  void *v2;
  void *v3;

  if (coalescedKeyboard_onceToken != -1)
    dispatch_once(&coalescedKeyboard_onceToken, &__block_literal_global_7);
  +[_GCControllerManager sharedInstance](_GCControllerManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "coalescedKeyboard");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GCKeyboard *)v3;
}

uint64_t __31__GCKeyboard_coalescedKeyboard__block_invoke()
{
  return +[GCFrameworkInitialization enableKeyboardSupportWithReason:](GCFrameworkInitialization, "enableKeyboardSupportWithReason:", 3);
}

- (GCKeyboard)init
{
  GCKeyboard *v2;
  GCKeyboard *v3;
  GCKeyboardInput *v4;
  GCKeyboardInput *keyboardInput;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GCKeyboard;
  v2 = -[GCKeyboard init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_handlerQueue, MEMORY[0x24BDAC9B8]);
    v4 = objc_alloc_init(GCKeyboardInput);
    keyboardInput = v3->_keyboardInput;
    v3->_keyboardInput = v4;

    -[GCPhysicalInputProfile setDevice:](v3->_keyboardInput, "setDevice:", v3);
  }
  return v3;
}

- (NSString)vendorName
{
  return (NSString *)CFSTR("Generic Keyboard");
}

- (NSString)productCategory
{
  return (NSString *)CFSTR("Keyboard");
}

- (NSString)description
{
  return (NSString *)CFSTR("Keyboard");
}

- (NSString)debugDescription
{
  objc_class *v3;
  void *v4;
  void *v5;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<%@ %p>"), v4, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (OS_dispatch_queue)handlerQueue
{
  return self->_handlerQueue;
}

- (void)setHandlerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_handlerQueue, a3);
}

- (GCKeyboardInput)keyboardInput
{
  return self->_keyboardInput;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardInput, 0);
  objc_storeStrong((id *)&self->_handlerQueue, 0);
}

@end
