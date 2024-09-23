@implementation SFPerSiteSettingsEntity

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
  objc_storeStrong((id *)&self->_domain, a3);
}

- (BOOL)contentBlockersEnabled
{
  return self->_contentBlockersEnabled;
}

- (void)setContentBlockersEnabled:(BOOL)a3
{
  self->_contentBlockersEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
