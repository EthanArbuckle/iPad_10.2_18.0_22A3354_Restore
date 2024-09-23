@implementation VSJSObject

- (VSJSObject)initWithContext:(id)a3
{
  id v5;
  VSJSObject *v6;
  VSJSObject *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VSJSObject;
  v6 = -[VSJSObject init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_context, a3);

  return v7;
}

- (VSJSObject)init
{
  void *v3;
  VSJSObject *v4;

  +[VSJSApp currentContext](VSJSApp, "currentContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  VSAssertWithMessage(v3 != 0, (uint64_t)CFSTR("Initializing VSJSObject on a non-JS thread."));
  v4 = -[VSJSObject initWithContext:](self, "initWithContext:", v3);

  return v4;
}

- (VSJSApp)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

@end
