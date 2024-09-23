@implementation NENexusFlow

- (void)dealloc
{
  objc_super v3;

  if (-[NENexusFlow protocol](self, "protocol"))
  {
    free(-[NENexusFlow protocol](self, "protocol"));
    -[NENexusFlow setProtocol:](self, "setProtocol:", 0);
  }
  v3.receiver = self;
  v3.super_class = (Class)NENexusFlow;
  -[NENexusFlow dealloc](&v3, sel_dealloc);
}

- (NWEndpoint)endpoint
{
  return 0;
}

- (NWParameters)parameters
{
  return 0;
}

- (NSUUID)clientIdentifier
{
  return 0;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (nw_protocol)protocol
{
  return self->_protocol;
}

- (void)setProtocol:(nw_protocol *)a3
{
  self->_protocol = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_manager);
  objc_storeStrong((id *)&self->_nexusInstance, 0);
}

- (void)setupFlowProtocolWithUUID:(void *)a1
{
  id v3;
  _QWORD *v4;
  _QWORD *v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = malloc_type_calloc(1uLL, 0x40uLL, 0x10A0040C9AB51B7uLL);
  if (v4)
  {
    v5 = v4;
    v4[2] = &NENexusFlowIdentifier;
    v4[3] = &NENexusFlowCallbacks;
    objc_msgSend(v3, "getUUIDBytes:", v4);
    v5[5] = a1;
    objc_msgSend(a1, "setProtocol:", v5);
  }
  else
  {
    ne_log_obj();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      v7 = 134217984;
      v8 = 64;
      _os_log_fault_impl(&dword_19BD16000, v6, OS_LOG_TYPE_FAULT, "calloc(%zu) failed", (uint8_t *)&v7, 0xCu);
    }

  }
}

@end
