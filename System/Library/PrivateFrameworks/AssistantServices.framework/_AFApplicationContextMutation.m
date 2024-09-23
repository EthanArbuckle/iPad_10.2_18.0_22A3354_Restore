@implementation _AFApplicationContextMutation

- (_AFApplicationContextMutation)initWithBase:(id)a3
{
  id v5;
  _AFApplicationContextMutation *v6;
  _AFApplicationContextMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFApplicationContextMutation;
  v6 = -[_AFApplicationContextMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_BYTE *)&self->_mutationFlags & 1;
}

- (id)getAssociatedBundleIdentifier
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_associatedBundleIdentifier;
  }
  else
  {
    -[AFApplicationContext associatedBundleIdentifier](self->_base, "associatedBundleIdentifier");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setAssociatedBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_associatedBundleIdentifier, a3);
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (id)getBulletin
{
  AFBulletin *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_bulletin;
  }
  else
  {
    -[AFApplicationContext bulletin](self->_base, "bulletin");
    v2 = (AFBulletin *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setBulletin:(id)a3
{
  objc_storeStrong((id *)&self->_bulletin, a3);
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (id)getAceContext
{
  AceObject *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_aceContext;
  }
  else
  {
    -[AFApplicationContext aceContext](self->_base, "aceContext");
    v2 = (AceObject *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setAceContext:(id)a3
{
  objc_storeStrong((id *)&self->_aceContext, a3);
  *(_BYTE *)&self->_mutationFlags |= 9u;
}

- (id)getContextDictionary
{
  NSDictionary *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 0x10) != 0)
  {
    v2 = self->_contextDictionary;
  }
  else
  {
    -[AFApplicationContext contextDictionary](self->_base, "contextDictionary");
    v2 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setContextDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_contextDictionary, a3);
  *(_BYTE *)&self->_mutationFlags |= 0x11u;
}

- (id)getAceContexts
{
  NSArray *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 0x20) != 0)
  {
    v2 = self->_aceContexts;
  }
  else
  {
    -[AFApplicationContext aceContexts](self->_base, "aceContexts");
    v2 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setAceContexts:(id)a3
{
  objc_storeStrong((id *)&self->_aceContexts, a3);
  *(_BYTE *)&self->_mutationFlags |= 0x21u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aceContexts, 0);
  objc_storeStrong((id *)&self->_contextDictionary, 0);
  objc_storeStrong((id *)&self->_aceContext, 0);
  objc_storeStrong((id *)&self->_bulletin, 0);
  objc_storeStrong((id *)&self->_associatedBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
