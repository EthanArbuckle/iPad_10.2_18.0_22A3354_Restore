@implementation HMSoftwareUpdateAssetCompletionsPair

- (HMSoftwareUpdateDocumentationAsset)asset
{
  return (HMSoftwareUpdateDocumentationAsset *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAsset:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMutableArray)completions
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCompletions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completions, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

@end
