@implementation ASCEmptyOfferMetadata

- (ASCEmptyOfferMetadata)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ASCEmptyOfferMetadata;
  return (ASCEmptyOfferMetadata *)-[ASCOfferMetadata _init](&v3, sel__init);
}

- (ASCEmptyOfferMetadata)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ASCEmptyOfferMetadata;
  return -[ASCOfferMetadata initWithCoder:](&v4, sel_initWithCoder_, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  return 0;
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

- (BOOL)isEmpty
{
  return 1;
}

@end
