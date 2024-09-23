@implementation IMDRelayServiceReachabilityRequest

- (IMDRelayServiceReachabilityRequest)initWithHandles:(id)a3 serviceName:(id)a4 context:(id)a5
{
  id v9;
  id v10;
  id v11;
  IMDRelayServiceReachabilityRequest *v12;
  IMDRelayServiceReachabilityRequest *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)IMDRelayServiceReachabilityRequest;
  v12 = -[IMDRelayServiceReachabilityRequest init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_handles, a3);
    objc_storeStrong((id *)&v13->_serviceName, a4);
    objc_storeStrong((id *)&v13->_context, a5);
  }

  return v13;
}

+ (id)requestFromData:(id)a3 error:(id *)a4
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  IMDRelayServiceReachabilityRequest *v8;
  void *v9;
  void *v10;
  IMDRelayServiceReachabilityRequest *v11;

  +[IMBlastdoor sendRelayReachabilityRequest:error:](IMBlastdoor, "sendRelayReachabilityRequest:error:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0D39A30]);
    objc_msgSend(v4, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithBlastDoorContext:", v6);

    v8 = [IMDRelayServiceReachabilityRequest alloc];
    objc_msgSend(v4, "handles");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "serviceName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[IMDRelayServiceReachabilityRequest initWithHandles:serviceName:context:](v8, "initWithHandles:serviceName:context:", v9, v10, v7);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)createDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("h");
  -[IMDRelayServiceReachabilityRequest handles](self, "handles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v9[1] = CFSTR("s");
  -[IMDRelayServiceReachabilityRequest serviceName](self, "serviceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  v9[2] = CFSTR("c");
  -[IMDRelayServiceReachabilityRequest context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSArray)handles
{
  return self->_handles;
}

- (void)setHandles:(id)a3
{
  objc_storeStrong((id *)&self->_handles, a3);
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  objc_storeStrong((id *)&self->_serviceName, a3);
}

- (IMServiceReachabilityContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_handles, 0);
}

@end
