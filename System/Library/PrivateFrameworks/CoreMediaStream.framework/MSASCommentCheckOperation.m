@implementation MSASCommentCheckOperation

- (NSString)albumGUID
{
  return self->_albumGUID;
}

- (void)setAlbumGUID:(id)a3
{
  objc_storeStrong((id *)&self->_albumGUID, a3);
}

- (NSString)assetCollectionGUID
{
  return self->_assetCollectionGUID;
}

- (void)setAssetCollectionGUID:(id)a3
{
  objc_storeStrong((id *)&self->_assetCollectionGUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetCollectionGUID, 0);
  objc_storeStrong((id *)&self->_albumGUID, 0);
}

@end
