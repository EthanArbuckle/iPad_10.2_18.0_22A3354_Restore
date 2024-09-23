@implementation MPNowPlayingInfoCenterArtworkContext

- (NSString)artworkIdentifier
{
  return self->_artworkIdentifier;
}

- (void)setArtworkIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (MPMediaItemArtwork)artwork
{
  return self->_artwork;
}

- (void)setArtwork:(id)a3
{
  objc_storeStrong((id *)&self->_artwork, a3);
}

- (NSData)artworkData
{
  return self->_artworkData;
}

- (void)setArtworkData:(id)a3
{
  objc_storeStrong((id *)&self->_artworkData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkData, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_artworkIdentifier, 0);
}

@end
