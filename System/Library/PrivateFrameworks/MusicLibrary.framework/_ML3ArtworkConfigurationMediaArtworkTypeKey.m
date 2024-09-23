@implementation _ML3ArtworkConfigurationMediaArtworkTypeKey

- (unint64_t)hash
{
  return self->_artworkType ^ self->_mediaType;
}

- (BOOL)isEqual:(id)a3
{
  _ML3ArtworkConfigurationMediaArtworkTypeKey *v4;
  BOOL v5;

  v4 = (_ML3ArtworkConfigurationMediaArtworkTypeKey *)a3;
  v5 = self == v4 || v4 && self->_mediaType == v4->_mediaType && self->_artworkType == v4->_artworkType;

  return v5;
}

+ (id)keyWithMediaType:(unsigned int)a3 artworkType:(int64_t)a4
{
  _DWORD *v6;

  v6 = objc_alloc_init((Class)a1);
  v6[2] = a3;
  *((_QWORD *)v6 + 2) = a4;
  return v6;
}

@end
