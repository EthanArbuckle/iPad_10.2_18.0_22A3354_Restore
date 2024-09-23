@implementation GEOServer

- (GEODaemon)daemon
{
  return (GEODaemon *)objc_loadWeakRetained((id *)&self->_daemon);
}

+ (BOOL)wantsPerMessageSignposts
{
  return 1;
}

- (GEOServer)init
{
  GEOServer *result;

  result = (GEOServer *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOServer)initWithDaemon:(id)a3
{
  id v4;
  GEOServer *v5;
  GEOServer *v6;
  GEOServer *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOServer;
  v5 = -[GEOServer init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_daemon, v4);
    v7 = v6;
  }

  return v6;
}

+ (id)identifier
{
  return CFSTR("__invalid__");
}

+ (Class)peerClass
{
  return (Class)objc_opt_class();
}

+ (unint64_t)launchMode
{
  return 0;
}

+ (NSArray)possibleXPCActivityIdentifiers
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

+ (NSArray)possibleBackgroundTaskIdentifiers
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

+ (BOOL)messageSupportsOffline:(id)a3
{
  return 0;
}

- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6
{
  return 0;
}

+ (id)handledPairedDeviceMessageTypes
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (BOOL)handleIncomingPairedDeviceMessage:(id)a3
{
  return 0;
}

- (BOOL)handleIncomingPairedDeviceMessage:(id)a3 completionHandler:(id)a4
{
  return 0;
}

- (void)runXPCActivity:(id)a3
{
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    v4 = 138543362;
    v5 = a3;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: Asked to run unhandled XPC Activity: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)runBackgroundTask:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(v3, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v4;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: Asked to run unhandled BackgroundTask: %{public}@", (uint8_t *)&v5, 0xCu);

  }
  objc_msgSend(v3, "setTaskCompleted");

}

+ (BOOL)performsPairedDeviceSynchronization
{
  return 0;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p>"), objc_opt_class(), self);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_daemon);
}

@end
