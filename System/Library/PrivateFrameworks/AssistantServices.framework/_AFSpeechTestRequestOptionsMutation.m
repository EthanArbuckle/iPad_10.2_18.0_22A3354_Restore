@implementation _AFSpeechTestRequestOptionsMutation

- (_AFSpeechTestRequestOptionsMutation)initWithBase:(id)a3
{
  id v5;
  _AFSpeechTestRequestOptionsMutation *v6;
  _AFSpeechTestRequestOptionsMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFSpeechTestRequestOptionsMutation;
  v6 = -[_AFSpeechTestRequestOptionsMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_BYTE *)&self->_mutationFlags & 1;
}

- (id)getJitContext
{
  NSArray *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_jitContext;
  }
  else
  {
    -[AFSpeechTestRequestOptions jitContext](self->_base, "jitContext");
    v2 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setJitContext:(id)a3
{
  objc_storeStrong((id *)&self->_jitContext, a3);
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (id)getOverrideModelPath
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_overrideModelPath;
  }
  else
  {
    -[AFSpeechTestRequestOptions overrideModelPath](self->_base, "overrideModelPath");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setOverrideModelPath:(id)a3
{
  objc_storeStrong((id *)&self->_overrideModelPath, a3);
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideModelPath, 0);
  objc_storeStrong((id *)&self->_jitContext, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
