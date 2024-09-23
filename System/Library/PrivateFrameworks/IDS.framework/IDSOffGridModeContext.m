@implementation IDSOffGridModeContext

- (IDSOffGridModeContext)init
{
  IDSOffGridModeContext *v2;
  IDSOffGridModeContext *v3;
  NSError *error;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IDSOffGridModeContext;
  v2 = -[IDSOffGridModeContext init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    error = v2->_error;
    v2->_error = 0;

  }
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[IDSOffGridModeContext error](self, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<IDSOffGridModeContext %p>: error %@"), self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_error, CFSTR("error"));
}

- (IDSOffGridModeContext)initWithCoder:(id)a3
{
  id v4;
  IDSOffGridModeContext *v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc_init(IDSOffGridModeContext);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[IDSOffGridModeContext setError:](v5, "setError:", v6);
  return v5;
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
