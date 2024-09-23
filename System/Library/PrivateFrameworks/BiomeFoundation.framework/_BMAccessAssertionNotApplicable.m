@implementation _BMAccessAssertionNotApplicable

- (_BMAccessAssertionNotApplicable)initWithDescriptor:(id)a3
{
  id v5;
  _BMAccessAssertionNotApplicable *v6;
  _BMAccessAssertionNotApplicable *v7;
  void *v8;
  uint64_t v9;
  NSString *path;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_BMAccessAssertionNotApplicable;
  v6 = -[_BMAccessAssertionNotApplicable init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_descriptor, a3);
    objc_msgSend(v5, "resource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[BMPaths pathForResource:](BMPaths, "pathForResource:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    path = v7->_path;
    v7->_path = (NSString *)v9;

  }
  return v7;
}

- (BMAccessDescriptor)descriptor
{
  return self->_descriptor;
}

- (NSString)path
{
  return self->_path;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
}

@end
