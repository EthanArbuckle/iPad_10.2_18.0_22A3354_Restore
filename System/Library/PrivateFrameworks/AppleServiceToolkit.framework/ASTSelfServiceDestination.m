@implementation ASTSelfServiceDestination

- (ASTSelfServiceDestination)initWithEndpoint:(int64_t)a3 suites:(id)a4
{
  id v6;
  ASTSelfServiceDestination *v7;
  ASTSelfServiceDestination *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)ASTSelfServiceDestination;
  v7 = -[ASTSelfServiceDestination init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[ASTSelfServiceDestination setEndpoint:](v7, "setEndpoint:", a3);
    -[ASTSelfServiceDestination setSuites:](v8, "setSuites:", v6);
  }

  return v8;
}

- (int64_t)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(int64_t)a3
{
  self->_endpoint = a3;
}

- (NSArray)suites
{
  return self->_suites;
}

- (void)setSuites:(id)a3
{
  objc_storeStrong((id *)&self->_suites, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suites, 0);
}

@end
