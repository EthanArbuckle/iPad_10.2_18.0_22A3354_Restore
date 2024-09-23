@implementation GEOResourceManifestUpdateAssertion

- (GEOResourceManifestUpdateAssertion)init
{
  GEOResourceManifestUpdateAssertion *result;

  result = (GEOResourceManifestUpdateAssertion *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOResourceManifestUpdateAssertion)initWithReason:(id)a3
{
  id v4;
  GEOResourceManifestUpdateAssertion *v5;
  uint64_t v6;
  NSString *reason;
  uint64_t v8;
  GEOXPCConnection *connection;
  NSObject *global_queue;
  GEOResourceManifestUpdateAssertion *v11;
  NSObject *v12;
  _QWORD handler[4];
  id v15;
  id location[2];
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)GEOResourceManifestUpdateAssertion;
  v5 = -[GEOResourceManifestUpdateAssertion init](&v17, sel_init);
  if (!v5)
  {
LABEL_7:
    v11 = 0;
    goto LABEL_8;
  }
  if (!objc_msgSend(v4, "length"))
  {
    GEOGetResourceManifestLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_1885A9000, v12, OS_LOG_TYPE_FAULT, "Empty reason provided for update assertion", (uint8_t *)location, 2u);
    }

    goto LABEL_7;
  }
  v6 = objc_msgSend(v4, "copy");
  reason = v5->_reason;
  v5->_reason = (NSString *)v6;

  v5->_creationTimestamp = CFAbsoluteTimeGetCurrent();
  +[GEOXPCConnection createServerConnectionFor:debugIdentifier:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:eventHandler:", 12, CFSTR("ResourceManifestUpdate"), 0);
  v8 = objc_claimAutoreleasedReturnValue();
  connection = v5->_connection;
  v5->_connection = (GEOXPCConnection *)v8;

  objc_initWeak(location, v5);
  global_queue = geo_get_global_queue();
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __53__GEOResourceManifestUpdateAssertion_initWithReason___block_invoke;
  handler[3] = &unk_1E1C05280;
  objc_copyWeak(&v15, location);
  notify_register_dispatch("GEODaemonDidStartDarwinNotification", &v5->_notifyToken, global_queue, handler);

  -[GEOResourceManifestUpdateAssertion _connectToGeod](v5, "_connectToGeod");
  v11 = v5;
  objc_destroyWeak(&v15);
  objc_destroyWeak(location);
LABEL_8:

  return v11;
}

void __53__GEOResourceManifestUpdateAssertion_initWithReason___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_connectToGeod");

}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_notifyToken);
  v3.receiver = self;
  v3.super_class = (Class)GEOResourceManifestUpdateAssertion;
  -[GEOResourceManifestUpdateAssertion dealloc](&v3, sel_dealloc);
}

- (id)debugDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p> %@"), objc_opt_class(), self, self->_reason);
}

- (void)_connectToGeod
{
  GEOResourceManifestUpdateAssertionXPCCheckinRequest *v3;

  v3 = -[GEOXPCRequest initWithMessage:traits:auditToken:throttleToken:]([GEOResourceManifestUpdateAssertionXPCCheckinRequest alloc], "initWithMessage:traits:auditToken:throttleToken:", CFSTR("resourcemanifestupdateassertion.checkinForUpdateAssertion"), 0, 0, 0);
  -[GEOResourceManifestUpdateAssertionXPCCheckinRequest setReason:](v3, "setReason:", self->_reason);
  -[GEOResourceManifestUpdateAssertionXPCCheckinRequest setTimestamp:](v3, "setTimestamp:", self->_creationTimestamp);
  -[GEOXPCRequest send:](v3, "send:", self->_connection);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

@end
