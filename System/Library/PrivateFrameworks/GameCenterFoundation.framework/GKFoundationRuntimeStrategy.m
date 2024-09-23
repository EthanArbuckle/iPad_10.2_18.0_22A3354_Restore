@implementation GKFoundationRuntimeStrategy

- (BOOL)shouldRefreshPreferencesAfterBackgrounding
{
  return 1;
}

- (GKFoundationRuntimeStrategy)initWithDaemonProxy:(id)a3
{
  id v5;
  GKFoundationRuntimeStrategy *v6;
  GKFoundationRuntimeStrategy *v7;
  GKMetricsReportingSessionDelegate *v8;
  void *v9;
  GKMetricsReportingSessionDelegate *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSURLSession *instrumentedURLSession;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)GKFoundationRuntimeStrategy;
  v6 = -[GKFoundationRuntimeStrategy init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_daemonProxy, a3);
    v8 = [GKMetricsReportingSessionDelegate alloc];
    +[GKAPIReporter reporter](GKAPIReporter, "reporter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[GKMetricsReportingSessionDelegate initWithReporter:](v8, "initWithReporter:", v9);

    v11 = (void *)MEMORY[0x1E0CB39F0];
    objc_msgSend(MEMORY[0x1E0CB39F8], "defaultSessionConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sessionWithConfiguration:delegate:delegateQueue:", v12, v10, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    instrumentedURLSession = v7->_instrumentedURLSession;
    v7->_instrumentedURLSession = (NSURLSession *)v13;

  }
  return v7;
}

- (GKGameSessionService)gameSessionService
{
  return -[GKServiceProxy gameSessionService](self->_daemonProxy, "gameSessionService");
}

- (GKUtilityService)utilityService
{
  return -[GKServiceProxy utilityService](self->_daemonProxy, "utilityService");
}

- (GKUtilityServicePrivate)utilityServicePrivate
{
  return -[GKServiceProxy utilityServicePrivate](self->_daemonProxy, "utilityServicePrivate");
}

- (id)localPlayer
{
  void *v2;
  void *v3;

  +[GKLocalPlayer local](GKLocalPlayer, "local");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "internal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)requestClientsRemoteImageDataForURL:(id)a3 queue:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a4;
  v8 = a5;
  v9 = a3;
  objc_msgSend(v9, "scheme");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "rangeOfString:", CFSTR("https"));

  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    -[GKDaemonProxy loadRemoteImageDataForClientForURL:reply:](self->_daemonProxy, "loadRemoteImageDataForClientForURL:reply:", v9, v8);
  else
    objc_msgSend(MEMORY[0x1E0C99D50], "_gkRequestClientsRemoteImageDataForURL:queue:reply:", v9, v12, v8);

}

- (NSURLSession)instrumentedURLSession
{
  return (NSURLSession *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instrumentedURLSession, 0);
  objc_storeStrong((id *)&self->_daemonProxy, 0);
}

@end
