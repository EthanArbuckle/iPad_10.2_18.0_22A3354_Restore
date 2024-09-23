@implementation AAiCloudTermsAgreeResponse

- (NSDictionary)acceptedTermsInfo
{
  NSDictionary *acceptedTermsInfo;
  void *v4;
  NSDictionary *v5;
  NSDictionary *v6;

  acceptedTermsInfo = self->_acceptedTermsInfo;
  if (!acceptedTermsInfo)
  {
    -[AAResponse httpResponse](self, "httpResponse");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ak_acceptedTermsInfo");
    v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v6 = self->_acceptedTermsInfo;
    self->_acceptedTermsInfo = v5;

    acceptedTermsInfo = self->_acceptedTermsInfo;
  }
  return acceptedTermsInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acceptedTermsInfo, 0);
}

@end
