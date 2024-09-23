@implementation MPPlaybackArchiveConfiguration

- (MPPlaybackArchiveConfiguration)initWithPreferredArtworkSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  MPPlaybackArchiveConfiguration *result;
  objc_super v6;

  height = a3.height;
  width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)MPPlaybackArchiveConfiguration;
  result = -[MPPlaybackArchiveConfiguration init](&v6, sel_init);
  if (result)
  {
    result->_preferredArtworkSize.width = width;
    result->_preferredArtworkSize.height = height;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeCGSize:forKey:", CFSTR("s"), self->_preferredArtworkSize.width, self->_preferredArtworkSize.height);
}

- (MPPlaybackArchiveConfiguration)initWithCoder:(id)a3
{
  objc_msgSend(a3, "decodeCGSizeForKey:", CFSTR("s"));
  return -[MPPlaybackArchiveConfiguration initWithPreferredArtworkSize:](self, "initWithPreferredArtworkSize:");
}

- (CGSize)preferredArtworkSize
{
  double width;
  double height;
  CGSize result;

  width = self->_preferredArtworkSize.width;
  height = self->_preferredArtworkSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPreferredArtworkSize:(CGSize)a3
{
  self->_preferredArtworkSize = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
