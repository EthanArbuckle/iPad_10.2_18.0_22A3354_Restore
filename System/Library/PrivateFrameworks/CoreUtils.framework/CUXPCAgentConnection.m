@implementation CUXPCAgentConnection

- (void)connectionInvalidated
{
  LogCategory *ucat;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  ucat = self->_agent->_ucat;
  if (ucat->var0 <= 20)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      v4 = -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier");
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUXPCAgentConnection connectionInvalidated]", 0x14u, (uint64_t)"XPC connection ended from %#{pid}\n", v5, v6, v7, v8, v4);
      return;
    }
    if (_LogCategory_Initialize((uint64_t)self->_agent->_ucat, 0x14u))
    {
      ucat = self->_agent->_ucat;
      goto LABEL_3;
    }
  }
}

- (id)remoteObjectProxy
{
  return -[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy");
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  return -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_xpcCnx, "remoteObjectProxyWithErrorHandler:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_agent, 0);
}

@end
