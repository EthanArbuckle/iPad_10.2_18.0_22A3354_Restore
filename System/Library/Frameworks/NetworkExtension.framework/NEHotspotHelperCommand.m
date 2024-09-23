@implementation NEHotspotHelperCommand

- (id)description
{
  if (self)
    self = (NEHotspotHelperCommand *)self->_command;
  return (id)(id)CFCopyDescription(self);
}

- (void)dealloc
{
  __CNPluginCommand *command;
  objc_super v4;

  if (self)
  {
    command = self->_command;
    if (command)
      CFRelease(command);
    self->_command = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)NEHotspotHelperCommand;
  -[NEHotspotHelperCommand dealloc](&v4, sel_dealloc);
}

- (NEHotspotHelperCommandType)commandType
{
  return (unint64_t)CNPluginCommandGetType();
}

- (NEHotspotNetwork)network
{
  const void *v2;
  const void *v3;
  id v4;

  if (self && self->_command && (v2 = (const void *)CNPluginCommandCopyCurrentNetwork()) != 0)
  {
    v3 = v2;
    v4 = -[NEHotspotNetwork initWithNetwork:]([NEHotspotNetwork alloc], v2);
    CFRelease(v3);
  }
  else
  {
    v4 = 0;
  }
  return (NEHotspotNetwork *)v4;
}

- (NSArray)networkList
{
  const __CFArray *v2;
  const __CFArray *v3;
  void *v4;

  if (self && self->_command && (v2 = (const __CFArray *)CNPluginCommandCopyNetworkList()) != 0)
  {
    v3 = v2;
    createHotspotNetworkArray(v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v3);
  }
  else
  {
    v4 = 0;
  }
  return (NSArray *)v4;
}

- (NEHotspotHelperResponse)createResponse:(NEHotspotHelperResult)result
{
  uint64_t v3;
  __CNPluginCommand *v4;
  NEHotspotHelperResponse *v5;
  NEHotspotHelperCommand *v6;
  __CNPluginCommand *command;
  objc_super v9;

  if (self && self->_command && (v3 = CNPluginResponseCreate()) != 0)
  {
    v4 = (__CNPluginCommand *)v3;
    v5 = [NEHotspotHelperResponse alloc];
    if (v5)
    {
      v9.receiver = v5;
      v9.super_class = (Class)NEHotspotHelperResponse;
      v6 = -[NEHotspotHelperCommand init](&v9, sel_init);
      if (v6)
      {
        CFRetain(v4);
        command = v6->_command;
        if (command)
          CFRelease(command);
        v6->_command = v4;
      }
    }
    else
    {
      v6 = 0;
    }
    CFRelease(v4);
  }
  else
  {
    v6 = 0;
  }
  return (NEHotspotHelperResponse *)v6;
}

- (OS_nw_interface)interface
{
  void *v2;
  void *v3;

  -[NEHotspotHelperCommand interfaceName](self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UTF8String");
  v3 = (void *)nw_interface_create_with_name();

  return (OS_nw_interface *)v3;
}

- (NWTCPConnection)createTCPConnection:(NWEndpoint *)endpoint
{
  objc_class *v4;
  NWEndpoint *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v4 = (objc_class *)MEMORY[0x1E0CCEC88];
  v5 = endpoint;
  v6 = [v4 alloc];
  -[NEHotspotHelperCommand interfaceName](self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithInterfaceName:", v7);

  v9 = objc_alloc_init(MEMORY[0x1E0CCECA0]);
  objc_msgSend(v9, "setRequiredInterface:", v8);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CCECD0]), "initWithEndpoint:parameters:", v5, v9);

  return (NWTCPConnection *)v10;
}

- (NWUDPSession)createUDPSession:(NWEndpoint *)endpoint
{
  objc_class *v4;
  NWEndpoint *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v4 = (objc_class *)MEMORY[0x1E0CCEC88];
  v5 = endpoint;
  v6 = [v4 alloc];
  -[NEHotspotHelperCommand interfaceName](self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithInterfaceName:", v7);

  v9 = objc_alloc_init(MEMORY[0x1E0CCECA0]);
  objc_msgSend(v9, "setRequiredInterface:", v8);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CCECD8]), "initWithEndpoint:parameters:", v5, v9);

  return (NWUDPSession *)v10;
}

- (id)interfaceName
{
  if (a1)
  {
    CNPluginCommandGetInterfaceName();
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

@end
