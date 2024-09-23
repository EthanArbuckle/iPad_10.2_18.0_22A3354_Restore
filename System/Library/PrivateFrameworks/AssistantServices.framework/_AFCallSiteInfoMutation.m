@implementation _AFCallSiteInfoMutation

- (void)setSymbolName:(id)a3
{
  objc_storeStrong((id *)&self->_symbolName, a3);
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (void)setImagePath:(id)a3
{
  objc_storeStrong((id *)&self->_imagePath, a3);
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (BOOL)isDirty
{
  return *(_BYTE *)&self->_mutationFlags & 1;
}

- (_AFCallSiteInfoMutation)initWithBase:(id)a3
{
  id v5;
  _AFCallSiteInfoMutation *v6;
  _AFCallSiteInfoMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFCallSiteInfoMutation;
  v6 = -[_AFCallSiteInfoMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (id)getSymbolName
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_symbolName;
  }
  else
  {
    -[AFCallSiteInfo symbolName](self->_base, "symbolName");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)getImagePath
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_imagePath;
  }
  else
  {
    -[AFCallSiteInfo imagePath](self->_base, "imagePath");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_imagePath, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
