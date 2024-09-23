@implementation HMDBackgroundSystemTaskRequest

- (HMDBackgroundSystemTaskRequest)initWithIdentifier:(id)a3
{
  id v5;
  HMDBackgroundSystemTaskRequest *v6;
  HMDBackgroundSystemTaskRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDBackgroundSystemTaskRequest;
  v6 = -[HMDBackgroundSystemTaskRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_identifier, a3);

  return v7;
}

- (HMDBackgroundSystemTaskRequest)initWithTaskRequest:(id)a3
{
  id v4;
  void *v5;
  HMDBackgroundSystemTaskRequest *v6;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMDBackgroundSystemTaskRequest initWithIdentifier:](self, "initWithIdentifier:", v5);

  -[HMDBackgroundSystemTaskRequest setRequiresInexpensiveNetworkConnectivity:](v6, "setRequiresInexpensiveNetworkConnectivity:", objc_msgSend(v4, "requiresInexpensiveNetworkConnectivity"));
  -[HMDBackgroundSystemTaskRequest setRequiresSignificantUserInactivity:](v6, "setRequiresSignificantUserInactivity:", objc_msgSend(v4, "requiresSignificantUserInactivity"));
  objc_msgSend(v4, "interval");
  -[HMDBackgroundSystemTaskRequest setInterval:](v6, "setInterval:");
  objc_msgSend(v4, "minDurationBetweenInstances");
  v8 = v7;

  -[HMDBackgroundSystemTaskRequest setMinDurationBetweenInstances:](v6, "setMinDurationBetweenInstances:", v8);
  return v6;
}

- (BGRepeatingSystemTaskRequest)taskRequest
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BE0B718]);
  -[HMDBackgroundSystemTaskRequest identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithIdentifier:", v4);

  objc_msgSend(v5, "setRequiresInexpensiveNetworkConnectivity:", -[HMDBackgroundSystemTaskRequest requiresInexpensiveNetworkConnectivity](self, "requiresInexpensiveNetworkConnectivity"));
  objc_msgSend(v5, "setRequiresSignificantUserInactivity:", -[HMDBackgroundSystemTaskRequest requiresSignificantUserInactivity](self, "requiresSignificantUserInactivity"));
  -[HMDBackgroundSystemTaskRequest interval](self, "interval");
  objc_msgSend(v5, "setInterval:");
  -[HMDBackgroundSystemTaskRequest minDurationBetweenInstances](self, "minDurationBetweenInstances");
  objc_msgSend(v5, "setMinDurationBetweenInstances:");
  objc_msgSend(v5, "setPriority:", 1);
  return (BGRepeatingSystemTaskRequest *)v5;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDBackgroundSystemTaskRequest identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Identifier"), v4);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)requiresInexpensiveNetworkConnectivity
{
  return self->_requiresInexpensiveNetworkConnectivity;
}

- (void)setRequiresInexpensiveNetworkConnectivity:(BOOL)a3
{
  self->_requiresInexpensiveNetworkConnectivity = a3;
}

- (BOOL)requiresSignificantUserInactivity
{
  return self->_requiresSignificantUserInactivity;
}

- (void)setRequiresSignificantUserInactivity:(BOOL)a3
{
  self->_requiresSignificantUserInactivity = a3;
}

- (double)interval
{
  return self->_interval;
}

- (void)setInterval:(double)a3
{
  self->_interval = a3;
}

- (double)minDurationBetweenInstances
{
  return self->_minDurationBetweenInstances;
}

- (void)setMinDurationBetweenInstances:(double)a3
{
  self->_minDurationBetweenInstances = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
