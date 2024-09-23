@implementation MPMediaRemoteEntityTranslatorContext

- (MPMediaRemoteEntityArtworkGenerator)artworkGenerator
{
  return self->_artworkGenerator;
}

- (void)setArtworkGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_artworkGenerator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkGenerator, 0);
}

@end
