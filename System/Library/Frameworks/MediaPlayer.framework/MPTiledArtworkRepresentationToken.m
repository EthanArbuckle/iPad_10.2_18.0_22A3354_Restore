@implementation MPTiledArtworkRepresentationToken

- (NSCopying)revisionIdentifier
{
  return self->_revisionIdentifier;
}

- (void)setRevisionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)tileArtworkVisualIdenticalityIdentifiers
{
  return self->_tileArtworkVisualIdenticalityIdentifiers;
}

- (void)setTileArtworkVisualIdenticalityIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tileArtworkVisualIdenticalityIdentifiers, 0);
  objc_storeStrong((id *)&self->_revisionIdentifier, 0);
}

@end
