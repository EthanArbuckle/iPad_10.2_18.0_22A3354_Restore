@implementation AKWalrusConfig

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<AKWalrusConfig: FeatureStatus: [%lu], StatusDescription: %@>"), self->_featureStatus, self->_localizedStatusDescription);
}

- (int64_t)featureStatus
{
  return self->_featureStatus;
}

- (void)setFeatureStatus:(int64_t)a3
{
  self->_featureStatus = a3;
}

- (NSString)localizedStatusDescription
{
  return self->_localizedStatusDescription;
}

- (void)setLocalizedStatusDescription:(id)a3
{
  objc_storeStrong((id *)&self->_localizedStatusDescription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedStatusDescription, 0);
}

@end
