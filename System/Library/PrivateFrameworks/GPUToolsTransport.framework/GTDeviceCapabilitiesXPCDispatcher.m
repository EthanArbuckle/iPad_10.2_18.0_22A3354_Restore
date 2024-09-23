@implementation GTDeviceCapabilitiesXPCDispatcher

- (GTDeviceCapabilitiesXPCDispatcher)initWithService:(id)a3 properties:(id)a4
{
  id v7;
  void *v8;
  GTDeviceCapabilitiesXPCDispatcher *v9;
  objc_super v11;

  v7 = a3;
  objc_msgSend(a4, "protocolMethods");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)GTDeviceCapabilitiesXPCDispatcher;
  v9 = -[GTXPCDispatcher initWithProtocolMethods:](&v11, sel_initWithProtocolMethods_, v8);

  if (v9)
    objc_storeStrong((id *)&v9->_service, a3);

  return v9;
}

- (void)daemonDeviceCapabilities:(id)a3 replyConnection:(id)a4
{
  GTDeviceCapabilities *service;
  id v6;
  id v7;
  void *v8;
  id v9;

  service = self->_service;
  v6 = a4;
  v7 = a3;
  -[GTDeviceCapabilities daemonDeviceCapabilities](service, "daemonDeviceCapabilities");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  gt_xpc_dictionary_create_reply(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  xpc_dictionary_set_nsobject(v8, "returnValue", (uint64_t)v9);
  objc_msgSend(v6, "sendMessage:", v8);

}

- (void)gpuToolsVersionQuery:(id)a3 replyConnection:(id)a4
{
  GTDeviceCapabilities *service;
  id v6;
  id v7;
  void *v8;
  id v9;

  service = self->_service;
  v6 = a4;
  v7 = a3;
  -[GTDeviceCapabilities gpuToolsVersionQuery](service, "gpuToolsVersionQuery");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  gt_xpc_dictionary_create_reply(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  xpc_dictionary_set_nsobject(v8, "returnValue", (uint64_t)v9);
  objc_msgSend(v6, "sendMessage:", v8);

}

- (void)inferiorEnvironment_:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id nsdictionary_any;

  v6 = a4;
  v7 = a3;
  nsdictionary_any = xpc_dictionary_get_nsdictionary_any(v7, "launchDictionary");
  -[GTDeviceCapabilities inferiorEnvironment:](self->_service, "inferiorEnvironment:", nsdictionary_any);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  gt_xpc_dictionary_create_reply(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  xpc_dictionary_set_nsobject(v9, "environment", (uint64_t)v8);
  objc_msgSend(v6, "sendMessage:", v9);

}

- (void)deviceCompatibilityCapabilitiesWithHeapDescriptors_:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id nsdictionary_any;

  v6 = a4;
  v7 = a3;
  nsdictionary_any = xpc_dictionary_get_nsdictionary_any(v7, "heapDescriptors");
  -[GTDeviceCapabilities deviceCompatibilityCapabilitiesWithHeapDescriptors:](self->_service, "deviceCompatibilityCapabilitiesWithHeapDescriptors:", nsdictionary_any);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  gt_xpc_dictionary_create_reply(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  xpc_dictionary_set_nsobject(v9, "returnValue", (uint64_t)v8);
  objc_msgSend(v6, "sendMessage:", v9);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
}

@end
