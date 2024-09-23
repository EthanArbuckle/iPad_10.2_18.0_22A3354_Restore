@implementation HSNowPlayingArtworkResponse

- (NSData)artworkData
{
  return self->_artworkData;
}

- (void)setArtworkData:(id)a3
{
  objc_storeStrong((id *)&self->_artworkData, a3);
}

- (NSString)artworkMIMEType
{
  return self->_artworkMIMEType;
}

- (void)setArtworkMIMEType:(id)a3
{
  objc_storeStrong((id *)&self->_artworkMIMEType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkMIMEType, 0);
  objc_storeStrong((id *)&self->_artworkData, 0);
}

@end
