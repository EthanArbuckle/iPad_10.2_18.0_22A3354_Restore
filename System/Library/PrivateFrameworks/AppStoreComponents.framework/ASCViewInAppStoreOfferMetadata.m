@implementation ASCViewInAppStoreOfferMetadata

- (ASCViewInAppStoreOfferMetadata)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ASCViewInAppStoreOfferMetadata;
  return (ASCViewInAppStoreOfferMetadata *)-[ASCOfferMetadata _init](&v3, sel__init);
}

- (ASCViewInAppStoreOfferMetadata)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ASCViewInAppStoreOfferMetadata;
  return -[ASCOfferMetadata initWithCoder:](&v4, sel_initWithCoder_, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 0;
}

- (unint64_t)hash
{
  ASCHasher *v3;
  void *v4;
  unint64_t v5;

  v3 = objc_alloc_init(ASCHasher);
  -[ASCViewInAppStoreOfferMetadata title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  v5 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v5;
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

- (id)description
{
  ASCDescriber *v3;
  void *v4;
  void *v5;

  v3 = -[ASCDescriber initWithObject:]([ASCDescriber alloc], "initWithObject:", self);
  -[ASCViewInAppStoreOfferMetadata title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, CFSTR("title"));

  -[ASCDescriber finalizeDescription](v3, "finalizeDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)title
{
  return (NSString *)ASCLocalizedString(CFSTR("OFFER_BUTTON_TITLE_VIEW_IN_APP_STORE"), a2);
}

- (BOOL)isViewInAppStore
{
  return 1;
}

@end
