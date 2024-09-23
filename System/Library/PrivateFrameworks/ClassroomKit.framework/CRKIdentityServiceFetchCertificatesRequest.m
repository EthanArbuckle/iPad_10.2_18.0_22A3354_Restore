@implementation CRKIdentityServiceFetchCertificatesRequest

- (NSArray)personLinkIDs
{
  return self->_personLinkIDs;
}

- (void)setPersonLinkIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personLinkIDs, 0);
}

@end
