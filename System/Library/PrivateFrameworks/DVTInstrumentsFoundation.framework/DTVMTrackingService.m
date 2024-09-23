@implementation DTVMTrackingService

+ (void)registerCapabilities:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.server.services.vmtracking"), 1, a1);
  objc_msgSend(v4, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.server.services.vmtracking.immediate"), 1, a1);
  objc_msgSend(v4, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.server.services.vmtracking.deferred"), 1, a1);
  objc_msgSend(v4, "publishCapability:withVersion:forClass:", CFSTR("com.apple.dt.services.capabilities.vmtracking"), 1, a1);

}

- (void)messageReceived:(id)a3
{
  id v4;
  mach_port_name_t targetTask;
  id v6;

  v4 = a3;
  if ((id)*MEMORY[0x24BE2A988] == v4)
  {
    targetTask = self->_targetTask;
    if (targetTask + 1 >= 2)
    {
      v6 = v4;
      mach_port_deallocate(*MEMORY[0x24BDAEC58], targetTask);
      v4 = v6;
      self->_targetTask = 0;
    }
  }

}

- (id)configureLaunchEnvironment:(id)a3
{
  return a3;
}

- (void)setTargetPid:(id)a3 referenceDate:(id)a4
{
  unsigned int v5;
  id v6;

  v6 = a3;
  v5 = +[DTInstrumentServer taskForPid:](DTInstrumentServer, "taskForPid:", objc_msgSend(v6, "intValue"));
  self->_targetTask = v5;
  if (v5 + 1 >= 2)
    self->_targetPid = objc_msgSend(v6, "intValue");

}

- (id)requestVMSnapshot
{
  XRVMState **p_currentState;
  void *v3;

  p_currentState = &self->_currentState;
  +[XRVMState currentStateForTask:pid:previousState:dehydratedDiffVersion:](XRVMState, "currentStateForTask:pid:previousState:dehydratedDiffVersion:", self->_targetTask, self->_targetPid, self->_currentState, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)p_currentState, v3);
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentState, 0);
}

@end
