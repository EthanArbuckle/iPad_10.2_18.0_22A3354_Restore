@implementation _AFTestRequestOptionsMutation

- (_AFTestRequestOptionsMutation)initWithBase:(id)a3
{
  id v5;
  _AFTestRequestOptionsMutation *v6;
  _AFTestRequestOptionsMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFTestRequestOptionsMutation;
  v6 = -[_AFTestRequestOptionsMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_BYTE *)&self->_mutationFlags & 1;
}

- (int64_t)getRequestPath
{
  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
    return self->_requestPath;
  else
    return -[AFTestRequestOptions requestPath](self->_base, "requestPath");
}

- (void)setRequestPath:(int64_t)a3
{
  self->_requestPath = a3;
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (id)getInputOrigin
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_inputOrigin;
  }
  else
  {
    -[AFTestRequestOptions inputOrigin](self->_base, "inputOrigin");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setInputOrigin:(id)a3
{
  objc_storeStrong((id *)&self->_inputOrigin, a3);
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (id)getIsEyesFree
{
  NSNumber *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_isEyesFree;
  }
  else
  {
    -[AFTestRequestOptions isEyesFree](self->_base, "isEyesFree");
    v2 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setIsEyesFree:(id)a3
{
  objc_storeStrong((id *)&self->_isEyesFree, a3);
  *(_BYTE *)&self->_mutationFlags |= 9u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isEyesFree, 0);
  objc_storeStrong((id *)&self->_inputOrigin, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
