@implementation NSFileReactorProxy

- (void)setEffectiveUserIdentifier:(unsigned int)a3
{
  self->_effectiveUserIdentifier = a3;
}

- (NSFileReactorProxy)initWithClient:(id)a3 reactorID:(id)a4
{
  NSFileReactorProxy *v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)NSFileReactorProxy;
  v6 = -[NSFileReactorProxy init](&v8, sel_init);
  if (v6)
  {
    v6->_client = (NSXPCConnection *)a3;
    v6->_reactorID = a4;
  }
  return v6;
}

- (id)reactorID
{
  return self->_reactorID;
}

- (id)client
{
  return self->_client;
}

+ (void)_enumerateParentDirectoriesStartingAtURL:(id)a3 usingBlock:(id)a4
{
  id v5;
  char v6;
  uint64_t v7;

  v5 = a3;
  v7 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  (*((void (**)(id, id, char *))a4 + 2))(a4, a3, &v6);
  if (v5 && !v6)
  {
    do
    {
      if ((objc_msgSend((id)objc_msgSend(v5, "path"), "isEqualToString:", CFSTR("/")) & 1) != 0)
        break;
      v5 = (id)objc_msgSend(v5, "URLByDeletingLastPathComponent");
      (*((void (**)(id, id, char *))a4 + 2))(a4, v5, &v6);
      if (!v5)
        break;
    }
    while (!v6);
  }
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSFileReactorProxy;
  -[NSFileReactorProxy dealloc](&v3, sel_dealloc);
}

- (unsigned)effectiveUserIdentifier
{
  return self->_effectiveUserIdentifier;
}

- (id)itemLocation
{
  return self->_itemLocation;
}

- (id)descriptionWithIndenting:(id)a3
{
  NSXPCConnection *client;
  uint64_t v6;
  int v7;
  NSString *v8;
  NSString *v9;
  uint64_t v10;
  id result;
  NSFileAccessNode *itemLocation;
  _BYTE buffer[256];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  client = self->_client;
  if (client)
  {
    v6 = -[NSXPCConnection processIdentifier](client, "processIdentifier");
    v7 = proc_name(v6, buffer, 0x100u);
    if (v7 < 1)
      v8 = 0;
    else
      v8 = -[NSString initWithBytes:length:encoding:]([NSString alloc], "initWithBytes:length:encoding:", buffer, v7, 4);
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (%i)"), v8, v6);
  }
  else
  {
    v9 = (NSString *)CFSTR("<?>");
  }
  v10 = objc_msgSend(a3, "stringByAppendingString:", CFSTR("    "));
  result = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%@ %p> client: %@, reactor ID: %@"), a3, objc_opt_class(), self, v9, self->_reactorID);
  itemLocation = self->_itemLocation;
  if (itemLocation)
    return (id)objc_msgSend(result, "stringByAppendingFormat:", CFSTR("\n%@location: %p"), v10, itemLocation);
  return result;
}

- (id)description
{
  return -[NSFileReactorProxy descriptionWithIndenting:](self, "descriptionWithIndenting:", &stru_1E0F56070);
}

- (BOOL)allowedForURL:(id)a3
{
  return 0;
}

- (id)_clientProxy
{
  return 0;
}

- (void)collectDebuggingInformationWithCompletionHandler:(id)a3
{
  id v4;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v4 = -[NSFileReactorProxy _clientProxy](self, "_clientProxy");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __71__NSFileReactorProxy_collectDebuggingInformationWithCompletionHandler___block_invoke;
  v5[3] = &unk_1E0F4E088;
  v5[4] = a3;
  objc_msgSend((id)objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v5), "collectDebuggingInformationWithCompletionHandler:", a3);
}

uint64_t __71__NSFileReactorProxy_collectDebuggingInformationWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  int v6;
  const __CFString *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = _NSFCLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = 138543618;
    v7 = CFSTR("collectDebuggingInformation");
    v8 = 2114;
    v9 = a2;
    _os_log_error_impl(&dword_1817D9000, v4, OS_LOG_TYPE_ERROR, "Sending of a '%{public}@' message was interrupted: %{public}@", (uint8_t *)&v6, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
