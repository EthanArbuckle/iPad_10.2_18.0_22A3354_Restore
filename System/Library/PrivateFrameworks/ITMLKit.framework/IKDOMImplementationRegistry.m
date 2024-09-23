@implementation IKDOMImplementationRegistry

- (id)getDOMImplementation:(id)a3
{
  IKDOMImplementation *v4;
  void *v5;
  IKDOMImplementation *v6;

  v4 = [IKDOMImplementation alloc];
  -[IKJSObject appContext](self, "appContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[IKJSObject initWithAppContext:](v4, "initWithAppContext:", v5);

  return v6;
}

@end
