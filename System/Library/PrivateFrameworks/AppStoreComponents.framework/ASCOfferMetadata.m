@implementation ASCOfferMetadata

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ASCOfferMetadata;
  return -[ASCOfferMetadata init](&v3, sel_init);
}

- (ASCOfferMetadata)init
{
  -[ASCOfferMetadata doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (ASCOfferMetadata)emptyMetadata
{
  return (ASCOfferMetadata *)objc_alloc_init(ASCEmptyOfferMetadata);
}

+ (id)textMetadataWithTitle:(id)a3 subtitle:(id)a4
{
  id v5;
  id v6;
  ASCTextOfferMetadata *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[ASCTextOfferMetadata initWithTitle:subtitle:]([ASCTextOfferMetadata alloc], "initWithTitle:subtitle:", v6, v5);

  return v7;
}

+ (id)iconMetadataWithImageName:(id)a3 animationName:(id)a4
{
  id v5;
  id v6;
  ASCIconOfferMetadata *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[ASCIconOfferMetadata initWithBaseImageName:animationName:]([ASCIconOfferMetadata alloc], "initWithBaseImageName:animationName:", v6, v5);

  return v7;
}

+ (ASCOfferMetadata)placeholderMetadata
{
  return (ASCOfferMetadata *)objc_alloc_init(ASCPlaceholderOfferMetadata);
}

+ (ASCOfferMetadata)redownloadMetadata
{
  return (ASCOfferMetadata *)objc_msgSend(a1, "iconMetadataWithImageName:animationName:", CFSTR("OfferRedownload"), CFSTR("none"));
}

+ (ASCOfferMetadata)indeterminateProgressMetadata
{
  return (ASCOfferMetadata *)-[ASCProgressOfferMetadata initIndeterminate]([ASCProgressOfferMetadata alloc], "initIndeterminate");
}

+ (id)progressMetadataWithValue:(double)a3
{
  return -[ASCProgressOfferMetadata initWithPercent:]([ASCProgressOfferMetadata alloc], "initWithPercent:", a3);
}

+ (ASCOfferMetadata)deeplinkMetadata
{
  return (ASCOfferMetadata *)objc_alloc_init(ASCDeeplinkOfferMetadata);
}

+ (ASCOfferMetadata)viewInAppStoreMetadata
{
  return (ASCOfferMetadata *)objc_alloc_init(ASCViewInAppStoreOfferMetadata);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCOfferMetadata)initWithCoder:(id)a3
{
  objc_super v5;

  +[ASCEligibility assertCurrentProcessEligibility]();
  v5.receiver = self;
  v5.super_class = (Class)ASCOfferMetadata;
  return -[ASCOfferMetadata init](&v5, sel_init);
}

- (BOOL)isEmpty
{
  return 0;
}

- (BOOL)isText
{
  return 0;
}

- (BOOL)isIcon
{
  return 0;
}

- (BOOL)isProgress
{
  return 0;
}

- (BOOL)isPlaceholder
{
  return 0;
}

- (BOOL)isDeeplink
{
  return 0;
}

- (BOOL)isViewInAppStore
{
  return 0;
}

@end
