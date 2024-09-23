@implementation _AFOutputVoiceDescriptorMutation

- (_AFOutputVoiceDescriptorMutation)initWithBase:(id)a3
{
  id v5;
  _AFOutputVoiceDescriptorMutation *v6;
  _AFOutputVoiceDescriptorMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFOutputVoiceDescriptorMutation;
  v6 = -[_AFOutputVoiceDescriptorMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_BYTE *)&self->_mutationFlags & 1;
}

- (id)getLocalizedDisplay
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_localizedDisplay;
  }
  else
  {
    -[AFOutputVoiceDescriptor localizedDisplay](self->_base, "localizedDisplay");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setLocalizedDisplay:(id)a3
{
  objc_storeStrong((id *)&self->_localizedDisplay, a3);
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (id)getLocalizedDisplayWithRegion
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_localizedDisplayWithRegion;
  }
  else
  {
    -[AFOutputVoiceDescriptor localizedDisplayWithRegion](self->_base, "localizedDisplayWithRegion");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setLocalizedDisplayWithRegion:(id)a3
{
  objc_storeStrong((id *)&self->_localizedDisplayWithRegion, a3);
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDisplayWithRegion, 0);
  objc_storeStrong((id *)&self->_localizedDisplay, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
