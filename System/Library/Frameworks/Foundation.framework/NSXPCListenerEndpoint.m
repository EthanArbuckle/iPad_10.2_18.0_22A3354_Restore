@implementation NSXPCListenerEndpoint

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  OS_xpc_object *endpoint;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  endpoint = self->_endpoint;
  if (endpoint)
    xpc_release(endpoint);
  v4.receiver = self;
  v4.super_class = (Class)NSXPCListenerEndpoint;
  -[NSXPCListenerEndpoint dealloc](&v4, sel_dealloc);
}

- (NSXPCListenerEndpoint)initWithCoder:(id)a3
{
  NSXPCListenerEndpoint *v6;
  OS_xpc_object *v7;
  void *v9;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: This class may only be decoded by an NSXPCCoder."), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v9);
  }
  v10.receiver = self;
  v10.super_class = (Class)NSXPCListenerEndpoint;
  v6 = -[NSXPCListenerEndpoint init](&v10, sel_init);
  v7 = (OS_xpc_object *)objc_msgSend(a3, "decodeXPCObjectOfType:forKey:", MEMORY[0x1E0C81308], CFSTR("ep"));
  v6->_endpoint = v7;
  v6->_lock._os_unfair_lock_opaque = 0;
  if (v7)
    xpc_retain(v7);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  void *v6;

  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: This class may only be encoded by an NSXPCCoder."), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v6);
  }
  objc_msgSend(a3, "encodeXPCObject:forKey:", -[NSXPCListenerEndpoint _endpoint](self, "_endpoint"), CFSTR("ep"));
}

- (id)_endpoint
{
  os_unfair_lock_s *p_lock;
  OS_xpc_object *endpoint;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  endpoint = self->_endpoint;
  if (endpoint)
    xpc_retain(endpoint);
  os_unfair_lock_unlock(p_lock);
  return endpoint;
}

- (id)_initWithConnection:(id)a3
{
  NSXPCListenerEndpoint *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)NSXPCListenerEndpoint;
  v4 = -[NSXPCListenerEndpoint init](&v6, sel_init);
  v4->_endpoint = xpc_endpoint_create((xpc_connection_t)a3);
  v4->_lock._os_unfair_lock_opaque = 0;
  return v4;
}

- (NSXPCListenerEndpoint)init
{
  NSXPCListenerEndpoint *result;
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)NSXPCListenerEndpoint;
  result = -[NSXPCListenerEndpoint init](&v3, sel_init);
  result->_lock._os_unfair_lock_opaque = 0;
  return result;
}

- (void)_setEndpoint:(id)a3
{
  os_unfair_lock_s *p_lock;
  OS_xpc_object *endpoint;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  endpoint = self->_endpoint;
  self->_endpoint = (OS_xpc_object *)xpc_retain(a3);
  if (endpoint)
    xpc_release(endpoint);
  os_unfair_lock_unlock(p_lock);
}

@end
