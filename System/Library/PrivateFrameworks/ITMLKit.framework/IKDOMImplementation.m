@implementation IKDOMImplementation

- (id)createDocument:(id)a3 :(id)a4
{
  id v5;
  IKDOMDocument *v6;
  void *v7;
  IKDOMDocument *v8;

  v5 = a4;
  v6 = [IKDOMDocument alloc];
  -[IKJSObject appContext](self, "appContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[IKDOMDocument initWithAppContext:qualifiedName:](v6, "initWithAppContext:qualifiedName:", v7, v5);

  return v8;
}

- (id)createLSSerializer
{
  IKDOMLSSerializer *v3;
  void *v4;
  IKDOMLSSerializer *v5;

  v3 = [IKDOMLSSerializer alloc];
  -[IKJSObject appContext](self, "appContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[IKJSObject initWithAppContext:](v3, "initWithAppContext:", v4);

  return v5;
}

- (id)createLSParser:(int64_t)a3 :(id)a4
{
  IKDOMLSParser *v5;
  void *v6;
  IKDOMLSParser *v7;

  v5 = [IKDOMLSParser alloc];
  -[IKJSObject appContext](self, "appContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[IKJSObject initWithAppContext:](v5, "initWithAppContext:", v6);

  return v7;
}

- (id)createLSInput
{
  IKDOMLSInput *v3;
  void *v4;
  IKDOMLSInput *v5;

  v3 = [IKDOMLSInput alloc];
  -[IKJSObject appContext](self, "appContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[IKJSObject initWithAppContext:](v3, "initWithAppContext:", v4);

  return v5;
}

- (int64_t)synchronousMode
{
  return 1;
}

- (int64_t)asynchronousMode
{
  return 2;
}

@end
