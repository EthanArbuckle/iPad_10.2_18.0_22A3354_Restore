@implementation _EMRemoteInterfaceDistantObjectReattempt

+ (id)recordedAttemptWithOriginalInvocation:(id)a3 target:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithOriginalInvocation:target:error:", v8, v9, v10);

  return v11;
}

- (_EMRemoteInterfaceDistantObjectReattempt)initWithOriginalInvocation:(id)a3 target:(id)a4 error:(id)a5
{
  id v9;
  id v10;
  id v11;
  _EMRemoteInterfaceDistantObjectReattempt *v12;
  _EMRemoteInterfaceDistantObjectReattempt *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_EMRemoteInterfaceDistantObjectReattempt;
  v12 = -[_EMRemoteInterfaceDistantObjectReattempt init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_invocation, a3);
    -[NSInvocation setTarget:](v13->_invocation, "setTarget:", v10);
    -[NSInvocation retainArguments](v13->_invocation, "retainArguments");
    objc_storeStrong((id *)&v13->_error, a5);
  }

  return v13;
}

- (id)debugDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p> invocation: %@\noriginal error: %@"), objc_opt_class(), self, self->_invocation, self->_error);
}

- (void)perform
{
  NSObject *v3;
  NSInvocation *invocation;
  void *v5;
  void *v6;
  int v7;
  _EMRemoteInterfaceDistantObjectReattempt *v8;
  __int16 v9;
  NSInvocation *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  +[EMRemoteConnection log](EMRemoteConnection, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    invocation = self->_invocation;
    NSStringFromSelector(-[NSInvocation selector](invocation, "selector"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSInvocation target](self->_invocation, "target");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138544130;
    v8 = self;
    v9 = 2114;
    v10 = invocation;
    v11 = 2114;
    v12 = v5;
    v13 = 2048;
    v14 = v6;
    _os_log_impl(&dword_1B99BB000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: reattempting invocation: %{public}@, selector: %{public}@, target: %p", (uint8_t *)&v7, 0x2Au);

  }
  -[NSInvocation invoke](self->_invocation, "invoke");
}

- (NSInvocation)invocation
{
  return (NSInvocation *)objc_getProperty(self, a2, 8, 1);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_invocation, 0);
}

@end
