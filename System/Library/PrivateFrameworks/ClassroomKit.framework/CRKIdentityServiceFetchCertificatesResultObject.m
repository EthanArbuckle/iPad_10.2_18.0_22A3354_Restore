@implementation CRKIdentityServiceFetchCertificatesResultObject

- (NSDictionary)certificatesByPersonLinkID
{
  return self->_certificatesByPersonLinkID;
}

- (void)setCertificatesByPersonLinkID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_certificatesByPersonLinkID, 0);
}

@end
