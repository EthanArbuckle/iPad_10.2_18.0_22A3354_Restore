@implementation ASCPlaceholderOfferMetadata

- (ASCPlaceholderOfferMetadata)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ASCPlaceholderOfferMetadata;
  return (ASCPlaceholderOfferMetadata *)-[ASCOfferMetadata _init](&v3, sel__init);
}

- (ASCPlaceholderOfferMetadata)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ASCPlaceholderOfferMetadata;
  return -[ASCOfferMetadata initWithCoder:](&v4, sel_initWithCoder_, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  return 1361;
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  char isKindOfClass;

  if (a3)
  {
    v3 = a3;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  else
  {
    isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (BOOL)isPlaceholder
{
  return 1;
}

@end
