@implementation MSResetServer

- (MSResetServer)initWithPersonID:(id)a3 baseURL:(id)a4
{
  id v6;
  id v7;
  MSResetServer *v8;
  MSResetServerProtocol *v9;
  MSResetServerProtocol *protocol;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MSResetServer;
  v8 = -[MSResetServer init](&v12, sel_init);
  if (v8)
  {
    v9 = -[MSResetServerProtocol initWithPersonID:baseURL:]([MSResetServerProtocol alloc], "initWithPersonID:baseURL:", v6, v7);
    protocol = v8->_protocol;
    v8->_protocol = v9;

    -[MSResetServerProtocol setDelegate:](v8->_protocol, "setDelegate:", v8);
  }

  return v8;
}

- (void)resetServer
{
  uint8_t v3[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Resetting server state...", v3, 2u);
  }
  objc_storeStrong(&self->_selfReference, self);
  -[MSDaemon retainBusy](self->_daemon, "retainBusy");
  -[MSResetServerProtocol resetServerState](self->_protocol, "resetServerState");
}

- (void)resetServerProtocol:(id)a3 didFinishWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  MSMediaStreamDaemon *daemon;
  void *v10;
  id selfReference;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "MSVerboseDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v8;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Couldn't reset server. Error: %{public}@", (uint8_t *)&v12, 0xCu);

    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Successfully reset server state.", (uint8_t *)&v12, 2u);
    }
    daemon = self->_daemon;
    -[MSResetServer personID](self, "personID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSMediaStreamDaemon didReceiveAuthenticationSuccessForPersonID:](daemon, "didReceiveAuthenticationSuccessForPersonID:", v10);

  }
  -[MSDaemon releaseBusy](self->_daemon, "releaseBusy");
  selfReference = self->_selfReference;
  self->_selfReference = 0;

}

- (void)resetServerProtocol:(id)a3 didReceiveAuthenticationError:(id)a4
{
  MSMediaStreamDaemon *daemon;
  void *v7;
  id selfReference;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(a4, "MSVerboseDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v9;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Couldn't reset server. Received authentication error: %{public}@", (uint8_t *)&v10, 0xCu);

  }
  daemon = self->_daemon;
  -[MSStreamsProtocol personID](self->_protocol, "personID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSMediaStreamDaemon didReceiveAuthenticationFailureForPersonID:](daemon, "didReceiveAuthenticationFailureForPersonID:", v7);

  -[MSDaemon releaseBusy](self->_daemon, "releaseBusy");
  selfReference = self->_selfReference;
  self->_selfReference = 0;

}

- (NSString)personID
{
  return self->_personID;
}

- (MSMediaStreamDaemon)daemon
{
  return self->_daemon;
}

- (void)setDaemon:(id)a3
{
  self->_daemon = (MSMediaStreamDaemon *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_selfReference, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong((id *)&self->_personID, 0);
}

+ (id)resetServerObjectWithPersonID:(id)a3 baseURL:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPersonID:baseURL:", v7, v6);

  return v8;
}

@end
