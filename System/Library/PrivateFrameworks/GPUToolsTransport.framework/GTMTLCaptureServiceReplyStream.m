@implementation GTMTLCaptureServiceReplyStream

- (GTMTLCaptureServiceReplyStream)initWithObserver:(id)a3
{
  id v5;
  void *v6;
  GTMTLCaptureServiceReplyStream *v7;
  objc_super v9;

  v5 = a3;
  +[GTServiceProperties protocolMethods:](GTServiceProperties, "protocolMethods:", &unk_255D63298);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)GTMTLCaptureServiceReplyStream;
  v7 = -[GTXPCDispatcher initWithProtocolMethods:](&v9, sel_initWithProtocolMethods_, v6);

  if (v7)
    objc_storeStrong((id *)&v7->_observer, a3);

  return v7;
}

- (void)notifyCaptureObjectsChanged_:(id)a3 replyConnection:(id)a4
{
  id v5;
  uint64_t v6;
  id nsobject;

  v5 = a3;
  v6 = objc_opt_class();
  nsobject = xpc_dictionary_get_nsobject(v5, "captureObjects", v6);

  -[GTMTLCaptureServiceObserver notifyCaptureObjectsChanged:](self->_observer, "notifyCaptureObjectsChanged:", nsobject);
}

- (void)notifyCaptureProgress_:(id)a3 replyConnection:(id)a4
{
  id v5;
  uint64_t v6;
  id nsobject;

  v5 = a3;
  v6 = objc_opt_class();
  nsobject = xpc_dictionary_get_nsobject(v5, "progress", v6);

  -[GTMTLCaptureServiceObserver notifyCaptureProgress:](self->_observer, "notifyCaptureProgress:", nsobject);
}

- (void)notifyUnsupportedFenum_:(id)a3 replyConnection:(id)a4
{
  id v5;
  uint64_t v6;
  id nsobject;

  v5 = a3;
  v6 = objc_opt_class();
  nsobject = xpc_dictionary_get_nsobject(v5, "info", v6);

  -[GTMTLCaptureServiceObserver notifyUnsupportedFenum:](self->_observer, "notifyUnsupportedFenum:", nsobject);
}

- (void)notifyCaptureRequest_:(id)a3 replyConnection:(id)a4
{
  id v5;
  uint64_t v6;
  id nsobject;

  v5 = a3;
  v6 = objc_opt_class();
  nsobject = xpc_dictionary_get_nsobject(v5, "descriptor", v6);

  -[GTMTLCaptureServiceObserver notifyCaptureRequest:](self->_observer, "notifyCaptureRequest:", nsobject);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observer, 0);
}

@end
