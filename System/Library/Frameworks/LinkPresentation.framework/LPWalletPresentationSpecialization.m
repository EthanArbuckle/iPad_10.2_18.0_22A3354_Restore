@implementation LPWalletPresentationSpecialization

+ (id)captionButtonPropertiesForPasses
{
  LPCaptionButtonPresentationProperties *v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(LPCaptionButtonPresentationProperties);
  LPLocalizedString(CFSTR("Add"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPCaptionButtonPresentationProperties setText:](v2, "setText:", v3);

  +[LPImage _PNGImageNamed:](LPImage, "_PNGImageNamed:", CFSTR("Wallet"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPCaptionButtonPresentationProperties setIcon:](v2, "setIcon:", v4);

  -[LPCaptionButtonPresentationProperties setType:](v2, "setType:", 1);
  return v2;
}

+ (id)captionButtonPropertiesForOrders
{
  LPCaptionButtonPresentationProperties *v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(LPCaptionButtonPresentationProperties);
  LPLocalizedString(CFSTR("Track"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPCaptionButtonPresentationProperties setText:](v2, "setText:", v3);

  +[LPImage _PNGImageNamed:](LPImage, "_PNGImageNamed:", CFSTR("Wallet"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPCaptionButtonPresentationProperties setIcon:](v2, "setIcon:", v4);

  -[LPCaptionButtonPresentationProperties setType:](v2, "setType:", 1);
  return v2;
}

@end
