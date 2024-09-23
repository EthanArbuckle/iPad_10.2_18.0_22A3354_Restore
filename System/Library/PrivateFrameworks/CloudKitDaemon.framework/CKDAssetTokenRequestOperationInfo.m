@implementation CKDAssetTokenRequestOperationInfo

- (CKDAssetTokenRequest)assetTokenRequest
{
  return self->_assetTokenRequest;
}

- (void)setAssetTokenRequest:(id)a3
{
  objc_storeStrong((id *)&self->_assetTokenRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetTokenRequest, 0);
}

@end
