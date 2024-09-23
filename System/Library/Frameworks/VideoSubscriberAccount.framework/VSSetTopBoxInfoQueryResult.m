@implementation VSSetTopBoxInfoQueryResult

- (VSIdentityProvider)setTopBoxProvider
{
  return self->_setTopBoxProvider;
}

- (void)setSetTopBoxProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (VSSetTopBoxProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_setTopBoxProvider, 0);
}

@end
