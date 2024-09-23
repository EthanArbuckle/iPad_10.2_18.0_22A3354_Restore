@implementation SFImage(IntentsUI)

- (INUISearchFoundationImageAdapter)downcastToIntentsUIVariantIfApplicable
{
  INUISearchFoundationImageAdapter *v1;
  INUISearchFoundationImageAdapter *v2;

  v1 = -[INUISearchFoundationImageAdapter initWithPayloadImage:]([INUISearchFoundationImageAdapter alloc], "initWithPayloadImage:", a1);
  -[INUISearchFoundationImageAdapter intentsImage](v1, "intentsImage");
  v2 = (INUISearchFoundationImageAdapter *)objc_claimAutoreleasedReturnValue();

  if (v2)
    v2 = v1;

  return v2;
}

@end
