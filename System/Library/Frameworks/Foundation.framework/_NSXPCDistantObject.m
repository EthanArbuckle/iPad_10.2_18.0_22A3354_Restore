@implementation _NSXPCDistantObject

- (BOOL)conformsToProtocol:(id)a3
{
  const char *v5;
  id Property;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)_NSXPCDistantObject;
  if (-[_NSXPCDistantObject conformsToProtocol:](&v8, sel_conformsToProtocol_))
    return 1;
  if (self)
    Property = objc_getProperty(self, v5, 16, 1);
  else
    Property = 0;
  return protocol_conformsToProtocol((Protocol *)objc_msgSend(Property, "protocol"), (Protocol *)a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_forwardStackInvocation:(id)a3
{
  NSXPCConnection *connection;

  connection = self->_connection;
  if (connection)
    -[NSXPCConnection _sendInvocation:orArguments:count:methodSignature:selector:withProxy:](connection, "_sendInvocation:orArguments:count:methodSignature:selector:withProxy:", a3, 0, 0, objc_msgSend(a3, "methodSignature", self->_proxyNumber), objc_msgSend(a3, "selector"), self);
}

- (NSDictionary)_userInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (id)_initWithConnection:(id)a3 exportedObject:(id)a4 interface:(id)a5
{
  _NSXPCDistantObject *v8;
  NSXPCConnection *v9;

  v8 = -[_NSXPCDistantObject init](self, "init");
  if (v8)
  {
    v9 = (NSXPCConnection *)a3;
    v8->_connection = v9;
    if (v9)
      v9 = (NSXPCConnection *)v9->_exportInfo;
    v8->_proxyNumber = -[_NSXPCConnectionExportedObjectTable proxyNumberForExportedObject:interface:]((uint64_t)v9, a4, a5);
    v8->_flags = 1;
  }
  return v8;
}

- (void)dealloc
{
  id errorBlock;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if ((self->_flags & 1) == 0)
    -[NSXPCConnection _removeImportedProxy:]((uint64_t)self->_connection, (uint64_t)self);

  errorBlock = self->_errorBlock;
  if (errorBlock)
    _Block_release(errorBlock);

  v4.receiver = self;
  v4.super_class = (Class)_NSXPCDistantObject;
  -[_NSXPCDistantObject dealloc](&v4, sel_dealloc);
}

- (id)remoteObjectProxyWithUserInfo:(id)a3 errorHandler:(id)a4
{
  id v5;

  v5 = (id)objc_msgSend(objc_alloc(-[NSXPCInterface _customSubclass](self->_remoteInterface, "_customSubclass")), "_initWithConnection:proxyNumber:generationCount:interface:options:error:", self->_connection, self->_proxyNumber, self->_generationCount, self->_remoteInterface, 0, a4);
  objc_msgSend(v5, "set_userInfo:", a3);
  return v5;
}

- (void)set_userInfo:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (id)methodSignatureForSelector:(SEL)a3
{
  id result;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  result = -[NSXPCInterface _methodSignatureForRemoteSelector:](self->_remoteInterface, "_methodSignatureForRemoteSelector:");
  if (!result)
  {
    v6.receiver = self;
    v6.super_class = (Class)_NSXPCDistantObject;
    return -[_NSXPCDistantObject methodSignatureForSelector:](&v6, sel_methodSignatureForSelector_, a3);
  }
  return result;
}

- (id)remoteObjectProxy
{
  return (id)objc_msgSend(objc_alloc(-[NSXPCInterface _customSubclass](self->_remoteInterface, "_customSubclass")), "_initWithConnection:proxyNumber:generationCount:interface:options:error:", self->_connection, self->_proxyNumber, self->_generationCount, self->_remoteInterface, 0, 0);
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  return (id)objc_msgSend(objc_alloc(-[NSXPCInterface _customSubclass](self->_remoteInterface, "_customSubclass")), "_initWithConnection:proxyNumber:generationCount:interface:options:error:", self->_connection, self->_proxyNumber, self->_generationCount, self->_remoteInterface, 4, a3);
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  return (id)objc_msgSend(objc_alloc(-[NSXPCInterface _customSubclass](self->_remoteInterface, "_customSubclass")), "_initWithConnection:proxyNumber:generationCount:interface:options:error:", self->_connection, self->_proxyNumber, self->_generationCount, self->_remoteInterface, 0, a3);
}

- (id)_initWithConnection:(id)a3 proxyNumber:(unint64_t)a4 generationCount:(unint64_t)a5 interface:(id)a6 options:(unint64_t)a7 error:(id)a8
{
  _NSXPCDistantObject *v14;
  NSXPCConnection *connection;

  v14 = -[_NSXPCDistantObject init](self, "init");
  if (v14)
  {
    v14->_connection = (NSXPCConnection *)a3;
    v14->_proxyNumber = a4;
    v14->_generationCount = a5;
    v14->_remoteInterface = (NSXPCInterface *)a6;
    v14->_flags = a7;
    if (a8)
      v14->_errorBlock = _Block_copy(a8);
    connection = v14->_connection;
    if (connection && v14->_proxyNumber != 1)
      -[_NSXPCConnectionImportInfo addProxy:]((uint64_t)connection->_importInfo, (uint64_t)v14);
  }
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  NSXPCConnection *connection;
  NSString *v7;

  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: This class may only be encoded by an NSXPCCoder."), _NSMethodExceptionProem((objc_class *)self, a2));
    goto LABEL_6;
  }
  connection = self->_connection;
  if (connection != (NSXPCConnection *)objc_msgSend(a3, "connection"))
  {
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: This proxy object may only be sent over the connection on which it was received."), _NSMethodExceptionProem((objc_class *)self, a2));
LABEL_6:
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v7, 0));
  }
  objc_msgSend(a3, "encodeInt64:forKey:", self->_proxyNumber, CFSTR("pn"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_flags & 1, CFSTR("ex"));
}

- (_NSXPCDistantObject)initWithCoder:(id)a3
{
  _NSXPCDistantObject *v5;
  char v6;
  id v7;
  uint64_t v8;
  os_unfair_lock_s *v9;
  void *v11;
  os_unfair_lock_s *v12;

  v5 = -[_NSXPCDistantObject init](self, "init");
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: This class may only be decoded by an NSXPCCoder."), _NSMethodExceptionProem((objc_class *)v5, a2)), 0);
      objc_exception_throw(v11);
    }
    v5->_proxyNumber = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("pn"));
    v6 = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("ex"));
    v7 = (id)objc_msgSend(a3, "connection");
    v5->_connection = (NSXPCConnection *)v7;
    if ((v6 & 1) != 0)
    {
      if (v7)
      {
        v5->_generationCount = *(_QWORD *)(*((_QWORD *)v7 + 9) + 8);
        if (v5->_proxyNumber != 1)
          -[_NSXPCConnectionImportInfo addProxy:](*((_QWORD *)v7 + 9), (uint64_t)v5);
      }
      else
      {
        v5->_generationCount = 0;
      }
    }
    else
    {
      v5->_flags |= 1uLL;
      v8 = objc_msgSend(a3, "connection");
      if (v8)
        v8 = *(_QWORD *)(v8 + 56);
      v9 = -[_NSXPCConnectionExportedObjectTable exportedObjectForProxyNumber:]((os_unfair_lock_s *)v8, (const void *)v5->_proxyNumber);
      if (v9)
      {
        v12 = v9;

        return (_NSXPCDistantObject *)v12;
      }
    }
  }
  return v5;
}

- (id)_unboostingRemoteObjectProxy
{
  return (id)objc_msgSend(objc_alloc(-[NSXPCInterface _customSubclass](self->_remoteInterface, "_customSubclass")), "_initWithConnection:proxyNumber:generationCount:interface:options:error:", self->_connection, self->_proxyNumber, self->_generationCount, self->_remoteInterface, 2, 0);
}

- (BOOL)respondsToSelector:(SEL)a3
{
  unint64_t v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v5 = -[NSXPCInterface _respondsToRemoteSelector:](self->_remoteInterface, "_respondsToRemoteSelector:");
  if (v5 == 2)
    return 0;
  if (v5 != 1)
    return 1;
  v7.receiver = self;
  v7.super_class = (Class)_NSXPCDistantObject;
  return -[_NSXPCDistantObject respondsToSelector:](&v7, sel_respondsToSelector_, a3);
}

- (void)forwardInvocation:(id)a3
{
  NSXPCConnection *connection;

  connection = self->_connection;
  if (connection)
    -[NSXPCConnection _sendInvocation:orArguments:count:methodSignature:selector:withProxy:](connection, "_sendInvocation:orArguments:count:methodSignature:selector:withProxy:", a3, 0, 0, objc_msgSend(a3, "methodSignature", self->_proxyNumber), objc_msgSend(a3, "selector"), self);
}

- (id)remoteObjectProxyWithTimeout:(double)a3 errorHandler:(id)a4
{
  id result;

  result = (id)objc_msgSend(objc_alloc(-[NSXPCInterface _customSubclass](self->_remoteInterface, "_customSubclass")), "_initWithConnection:proxyNumber:generationCount:interface:options:error:", self->_connection, self->_proxyNumber, self->_generationCount, self->_remoteInterface, 0, a4);
  if (result)
    *((double *)result + 8) = a3;
  return result;
}

- (NSXPCConnection)_connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

@end
