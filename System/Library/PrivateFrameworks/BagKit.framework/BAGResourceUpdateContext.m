@implementation BAGResourceUpdateContext

- (BAGResourceUpdateContext)initWithLoadState:(unint64_t)a3 error:(id)a4
{
  id v8;
  BAGResourceUpdateContext *v9;
  BAGResourceUpdateContext *v10;
  void *v12;
  objc_super v13;

  v8 = a4;
  if (!BAGIsValidLoadState(a3))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BAGResourceUpdateContext.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("BAGIsValidLoadState(loadState)"));

  }
  v13.receiver = self;
  v13.super_class = (Class)BAGResourceUpdateContext;
  v9 = -[BAGResourceUpdateContext init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_loadState = a3;
    objc_storeStrong((id *)&v9->_error, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BAGResourceUpdateContext)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  BAGResourceUpdateContext *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("loadState"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[BAGResourceUpdateContext initWithLoadState:error:](self, "initWithLoadState:error:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[BAGResourceUpdateContext loadState](self, "loadState"), CFSTR("loadState"));
  -[BAGResourceUpdateContext error](self, "error");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("error"));

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  BAGResourceLoadStateToString(-[BAGResourceUpdateContext loadState](self, "loadState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BAGResourceUpdateContext error](self, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ : %p loadState: %@, error: %@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)loadState
{
  return self->_loadState;
}

- (void)setLoadState:(unint64_t)a3
{
  self->_loadState = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

@end
