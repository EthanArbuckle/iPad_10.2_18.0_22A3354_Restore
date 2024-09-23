@implementation PHASEMixerInformation

- (NSString)uid
{
  return self->_identifier;
}

- (void)setUid:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (int64_t)mixerType
{
  return self->_mixerType;
}

- (void)setMixerType:(int64_t)a3
{
  self->_mixerType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
