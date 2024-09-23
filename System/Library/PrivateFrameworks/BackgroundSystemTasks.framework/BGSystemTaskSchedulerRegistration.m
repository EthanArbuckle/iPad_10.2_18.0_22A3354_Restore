@implementation BGSystemTaskSchedulerRegistration

- (BGSystemTaskSchedulerRegistration)initWithIdentifier:(id)a3 launchQueue:(id)a4 launchHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  BGSystemTaskSchedulerRegistration *v12;
  BGSystemTaskSchedulerRegistration *v13;
  uint64_t v14;
  id launchHandler;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)BGSystemTaskSchedulerRegistration;
  v12 = -[BGSystemTaskSchedulerRegistration init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeStrong((id *)&v13->_launchQueue, a4);
    v14 = MEMORY[0x1D17E72F4](v11);
    launchHandler = v13->_launchHandler;
    v13->_launchHandler = (id)v14;

  }
  return v13;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (OS_dispatch_queue)launchQueue
{
  return self->_launchQueue;
}

- (void)setLaunchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_launchQueue, a3);
}

- (id)launchHandler
{
  return self->_launchHandler;
}

- (void)setLaunchHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BGSystemTaskRequest)taskRequest
{
  return self->_taskRequest;
}

- (void)setTaskRequest:(id)a3
{
  objc_storeStrong((id *)&self->_taskRequest, a3);
}

- (OS_xpc_object)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_descriptor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_taskRequest, 0);
  objc_storeStrong(&self->_launchHandler, 0);
  objc_storeStrong((id *)&self->_launchQueue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
