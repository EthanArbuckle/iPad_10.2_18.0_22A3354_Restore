@implementation AXIPCServerClientRegistration

- (AXIPCServerClientRegistration)initWithPort:(unsigned int)a3 identifier:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  dispatch_source_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  _QWORD v16[4];
  unsigned int v17;
  _QWORD handler[4];
  id v19;
  id location;
  objc_super v21;

  v6 = a4;
  v21.receiver = self;
  v21.super_class = (Class)AXIPCServerClientRegistration;
  v7 = -[AXIPCServerClientRegistration init](&v21, sel_init);
  if (v7)
  {
    AXIncrefSendRight(a3);
    *((_DWORD *)v7 + 2) = a3;
    v8 = objc_msgSend(v6, "copy");
    v9 = (void *)*((_QWORD *)v7 + 2);
    *((_QWORD *)v7 + 2) = v8;

    v10 = dispatch_source_create(MEMORY[0x1E0C80DA0], a3, 1uLL, MEMORY[0x1E0C80D38]);
    v11 = (void *)*((_QWORD *)v7 + 3);
    *((_QWORD *)v7 + 3) = v10;

    objc_initWeak(&location, v7);
    v12 = *((_QWORD *)v7 + 3);
    v13 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __57__AXIPCServerClientRegistration_initWithPort_identifier___block_invoke;
    handler[3] = &unk_1E24C58C0;
    objc_copyWeak(&v19, &location);
    dispatch_source_set_event_handler(v12, handler);
    v14 = *((_QWORD *)v7 + 3);
    v16[0] = v13;
    v16[1] = 3221225472;
    v16[2] = __57__AXIPCServerClientRegistration_initWithPort_identifier___block_invoke_2;
    v16[3] = &__block_descriptor_36_e5_v8__0l;
    v17 = a3;
    dispatch_source_set_cancel_handler(v14, v16);
    dispatch_resume(*((dispatch_object_t *)v7 + 3));
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return (AXIPCServerClientRegistration *)v7;
}

void __57__AXIPCServerClientRegistration_initWithPort_identifier___block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  id v3;
  id WeakRetained;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v2, "serverClientRegistrationInvalidated:", v3);

}

uint64_t __57__AXIPCServerClientRegistration_initWithPort_identifier___block_invoke_2(uint64_t result)
{
  mach_port_name_t v1;

  v1 = *(_DWORD *)(result + 32);
  if (v1)
  {
    result = mach_port_deallocate(*MEMORY[0x1E0C83DA0], v1);
    if ((_DWORD)result)
      return _AXAssert();
  }
  return result;
}

- (void)dealloc
{
  NSObject *invalidationSource;
  OS_dispatch_source *v4;
  objc_super v5;

  invalidationSource = self->_invalidationSource;
  if (invalidationSource)
  {
    dispatch_source_cancel(invalidationSource);
    v4 = self->_invalidationSource;
    self->_invalidationSource = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)AXIPCServerClientRegistration;
  -[AXIPCServerClientRegistration dealloc](&v5, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unsigned int v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[AXIPCServerClientRegistration port](self, "port");
    v6 = v5 == objc_msgSend(v4, "port");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return -[AXIPCServerClientRegistration port](self, "port");
}

- (unsigned)port
{
  return self->_port;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (OS_dispatch_source)invalidationSource
{
  return self->_invalidationSource;
}

- (AXIPCServerClientRegistrationDelegate)delegate
{
  return (AXIPCServerClientRegistrationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_invalidationSource, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
