@implementation MSASAssetInfoToReauthForDownload

- (MSAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (MSASAlbum)album
{
  return self->_album;
}

- (void)setAlbum:(id)a3
{
  objc_storeStrong((id *)&self->_album, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_album, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

@end
