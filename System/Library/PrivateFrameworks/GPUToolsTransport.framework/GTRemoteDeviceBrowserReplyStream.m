@implementation GTRemoteDeviceBrowserReplyStream

- (GTRemoteDeviceBrowserReplyStream)initWithObserver:(id)a3
{
  id v5;
  void *v6;
  GTRemoteDeviceBrowserReplyStream *v7;
  objc_super v9;

  v5 = a3;
  +[GTServiceProperties protocolMethods:](GTServiceProperties, "protocolMethods:", &unk_255D69928);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)GTRemoteDeviceBrowserReplyStream;
  v7 = -[GTXPCDispatcher initWithProtocolMethods:](&v9, sel_initWithProtocolMethods_, v6);

  if (v7)
    objc_storeStrong((id *)&v7->_observer, a3);

  return v7;
}

- (void)notifyDeviceListChanged_:(id)a3 replyConnection:(id)a4
{
  id v5;
  uint64_t v6;
  id nsarray;

  v5 = a3;
  v6 = objc_opt_class();
  nsarray = (id)xpc_dictionary_get_nsarray(v5, "deviceList", v6);

  -[GTRemoteDeviceBrowserObserver notifyDeviceListChanged:](self->_observer, "notifyDeviceListChanged:", nsarray);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observer, 0);
}

@end
