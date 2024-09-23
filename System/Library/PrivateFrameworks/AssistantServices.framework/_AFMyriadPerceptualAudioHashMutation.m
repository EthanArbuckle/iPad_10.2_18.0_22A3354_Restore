@implementation _AFMyriadPerceptualAudioHashMutation

- (_AFMyriadPerceptualAudioHashMutation)initWithBase:(id)a3
{
  id v5;
  _AFMyriadPerceptualAudioHashMutation *v6;
  _AFMyriadPerceptualAudioHashMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFMyriadPerceptualAudioHashMutation;
  v6 = -[_AFMyriadPerceptualAudioHashMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_BYTE *)&self->_mutationFlags & 1;
}

- (id)getData
{
  NSData *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_data;
  }
  else
  {
    -[AFMyriadPerceptualAudioHash data](self->_base, "data");
    v2 = (NSData *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
