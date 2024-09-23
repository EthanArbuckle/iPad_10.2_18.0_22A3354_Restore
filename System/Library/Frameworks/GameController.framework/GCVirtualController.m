@implementation GCVirtualController

+ (GCVirtualController)virtualControllerWithConfiguration:(GCVirtualControllerConfiguration *)configuration
{
  GCVirtualControllerConfiguration *v3;
  GCVirtualController *v4;

  v3 = configuration;
  v4 = -[GCVirtualController initWithConfiguration:]([GCVirtualController alloc], "initWithConfiguration:", v3);

  return v4;
}

- (GCVirtualController)initWithConfiguration:(GCVirtualControllerConfiguration *)configuration
{
  GCVirtualControllerConfiguration *v4;
  GCVirtualController *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  uint64_t v9;
  void *impl;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSError *error;
  objc_super v17;
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[3];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x24BDAC8D0];
  v4 = configuration;
  v17.receiver = self;
  v17.super_class = (Class)GCVirtualController;
  v5 = -[GCVirtualController init](&v17, sel_init);
  VirtualControllerBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    v12 = *MEMORY[0x24BDD0FD8];
    v20[0] = *MEMORY[0x24BDD0FC8];
    v20[1] = v12;
    v21[0] = CFSTR("Virtual game controller initialization failed.");
    v21[1] = CFSTR("Failed to load the VirtualGameController helper bundle.");
    v20[2] = *MEMORY[0x24BDD0FF0];
    v21[2] = CFSTR("Check the system log for more information.");
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_254DEBCC0, "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
    impl = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 1;
LABEL_7:
    +[NSError gc_VirtualControllerError:userInfo:]((uint64_t)&off_254DF2E50, v13, impl);
    v15 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v15;

    goto LABEL_4;
  }
  v8 = (objc_class *)objc_msgSend(v6, "classNamed:", CFSTR("_GCVirtualControllerImpl"));
  if (!v8)
  {
    v14 = *MEMORY[0x24BDD0FD8];
    v18[0] = *MEMORY[0x24BDD0FC8];
    v18[1] = v14;
    v19[0] = CFSTR("Virtual game controller initialization failed.");
    v19[1] = CFSTR("Failed to load implementation from the VirtualGameController helper bundle.");
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_254DEBCC0, "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
    impl = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 2;
    goto LABEL_7;
  }
  v9 = objc_msgSend([v8 alloc], "initWithConfiguration:", v4);
  impl = v5->_impl;
  v5->_impl = (_GCVirtualControllerImpl *)v9;
LABEL_4:

  return v5;
}

- (void)connectWithReplyHandler:(void *)reply
{
  void (**v4)(_QWORD);
  void *v5;
  void (**v6)(_QWORD);

  v4 = reply;
  v6 = v4;
  if (self->_error)
  {
    v5 = v4;
    if (!v4)
      goto LABEL_4;
    v4[2](v4);
  }
  else
  {
    -[_GCVirtualControllerImpl connectWithReplyHandler:](self->_impl, "connectWithReplyHandler:", v4);
  }
  v5 = v6;
LABEL_4:

}

- (void)disconnect
{
  -[_GCVirtualControllerImpl disconnect](self->_impl, "disconnect");
}

- (GCController)controller
{
  return (GCController *)-[_GCVirtualControllerImpl controller](self->_impl, "controller");
}

- (void)updateConfigurationForElement:(NSString *)element configuration:(void *)config
{
  -[_GCVirtualControllerImpl updateConfigurationForElement:configuration:](self->_impl, "updateConfigurationForElement:configuration:", element, config);
}

- (void)setValue:(CGFloat)value forButtonElement:(NSString *)element
{
  -[_GCVirtualControllerImpl setValue:forButtonElement:](self->_impl, "setValue:forButtonElement:", element, value);
}

- (void)setPosition:(CGPoint)position forDirectionPadElement:(NSString *)element
{
  -[_GCVirtualControllerImpl setPosition:forDirectionPadElement:](self->_impl, "setPosition:forDirectionPadElement:", element, position.x, position.y);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_impl, 0);
}

@end
