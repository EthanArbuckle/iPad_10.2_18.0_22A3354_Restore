@implementation _AFBundleResourceMutation

- (_AFBundleResourceMutation)initWithBase:(id)a3
{
  id v5;
  _AFBundleResourceMutation *v6;
  _AFBundleResourceMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFBundleResourceMutation;
  v6 = -[_AFBundleResourceMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_BYTE *)&self->_mutationFlags & 1;
}

- (id)getName
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_name;
  }
  else
  {
    -[AFBundleResource name](self->_base, "name");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (id)getExtension
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_extension;
  }
  else
  {
    -[AFBundleResource extension](self->_base, "extension");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setExtension:(id)a3
{
  objc_storeStrong((id *)&self->_extension, a3);
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
