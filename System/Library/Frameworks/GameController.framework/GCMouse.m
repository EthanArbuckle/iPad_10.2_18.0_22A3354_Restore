@implementation GCMouse

+ (GCMouse)current
{
  void *v2;
  void *v3;

  if (current_onceToken_0 != -1)
    dispatch_once(&current_onceToken_0, &__block_literal_global_46);
  +[_GCControllerManager sharedInstance](_GCControllerManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentMouse");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GCMouse *)v3;
}

uint64_t __18__GCMouse_current__block_invoke()
{
  return +[GCFrameworkInitialization enableMouseSupportWithReason:](GCFrameworkInitialization, "enableMouseSupportWithReason:", 3);
}

+ (NSArray)mice
{
  void *v2;
  void *v3;

  if (mice_onceToken != -1)
    dispatch_once(&mice_onceToken, &__block_literal_global_73);
  +[_GCControllerManager sharedInstance](_GCControllerManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

uint64_t __15__GCMouse_mice__block_invoke()
{
  return +[GCFrameworkInitialization enableMouseSupportWithReason:](GCFrameworkInitialization, "enableMouseSupportWithReason:", 2);
}

- (GCMouse)initWithName:(id)a3 additionalButtons:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  GCMouse *v7;
  GCMouse *v8;
  uint64_t v9;
  NSString *vendorName;
  GCMouseInput *v11;
  void *v12;
  uint64_t v13;
  GCMouseInput *mouseInput;
  objc_super v16;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)GCMouse;
  v7 = -[GCMouse init](&v16, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_handlerQueue, MEMORY[0x24BDAC9B8]);
    v9 = objc_msgSend(v6, "copy");
    vendorName = v8->_vendorName;
    v8->_vendorName = (NSString *)v9;

    v11 = [GCMouseInput alloc];
    +[NSUUID UUID](&off_254DEEE48, "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[GCMouseInput initWithIdentifier:additionalButtons:](v11, "initWithIdentifier:additionalButtons:", v12, v4);
    mouseInput = v8->_mouseInput;
    v8->_mouseInput = (GCMouseInput *)v13;

    -[GCPhysicalInputProfile setDevice:](v8->_mouseInput, "setDevice:", v8);
  }

  return v8;
}

- (GCMouse)init
{
  return -[GCMouse initWithName:additionalButtons:](self, "initWithName:additionalButtons:", CFSTR("Generic Mouse"), 0);
}

- (NSString)vendorName
{
  return self->_vendorName;
}

- (NSString)productCategory
{
  return (NSString *)CFSTR("Mouse");
}

- (GCMouseInput)mouseInput
{
  return self->_mouseInput;
}

- (GCMouseLiveInput)liveInput
{
  id *v2;
  void *v3;

  -[GCMouse mouseInput](self, "mouseInput");
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  -[GCMouseInput liveInputFacade](v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GCMouseLiveInput *)v3;
}

- (NSString)description
{
  return (NSString *)CFSTR("Mouse");
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mouseInput, 0);
  objc_storeStrong((id *)&self->_handlerQueue, 0);
  objc_storeStrong((id *)&self->_vendorName, 0);
}

@end
