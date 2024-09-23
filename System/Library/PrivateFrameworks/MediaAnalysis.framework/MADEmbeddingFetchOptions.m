@implementation MADEmbeddingFetchOptions

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADEmbeddingFetchOptions)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MADEmbeddingFetchOptions;
  return -[MADEmbeddingFetchOptions init](&v4, sel_init, a3);
}

@end
