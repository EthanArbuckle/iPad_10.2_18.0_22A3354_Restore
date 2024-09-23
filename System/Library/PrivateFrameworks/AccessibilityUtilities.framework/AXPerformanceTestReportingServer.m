@implementation AXPerformanceTestReportingServer

+ (id)server
{
  if (server_onceToken != -1)
    dispatch_once(&server_onceToken, &__block_literal_global);
  return (id)server_Server;
}

void __42__AXPerformanceTestReportingServer_server__block_invoke()
{
  AXPerformanceTestReportingServer *v0;
  void *v1;

  if (AXIsInternalInstall())
  {
    v0 = objc_alloc_init(AXPerformanceTestReportingServer);
    v1 = (void *)server_Server;
    server_Server = (uint64_t)v0;

  }
}

- (id)_serviceName
{
  return CFSTR("AXPerformanceTestReportingServer");
}

- (void)voiceOverTouchDidLaunch
{
  AXIPCMessage *v3;

  -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
  v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 8000, 0);
  -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:", v3);

}

- (void)assistiveTouchDidLaunch
{
  AXIPCMessage *v3;

  -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
  v3 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", 8001, 0);
  -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:", v3);

}

- (void)voiceOverDidSpeak:(id)a3
{
  id v4;
  AXIPCMessage *v5;
  void *v6;
  AXIPCMessage *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AXServer _connectIfNecessary](self, "_connectIfNecessary");
  v5 = [AXIPCMessage alloc];
  v8 = CFSTR("string");
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[AXIPCMessage initWithKey:payload:](v5, "initWithKey:payload:", 8002, v6);
  -[AXServer sendSimpleMessage:](self, "sendSimpleMessage:", v7);

}

@end
