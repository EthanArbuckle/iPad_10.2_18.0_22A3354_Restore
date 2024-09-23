@implementation LPApplePhotosSharedLibraryInvitationPresentationSpecialization

+ (LPCaptionButtonPresentationProperties)captionButtonProperties
{
  LPCaptionButtonPresentationProperties *v2;
  void *v3;

  v2 = objc_alloc_init(LPCaptionButtonPresentationProperties);
  LPLocalizedString(CFSTR("View"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPCaptionButtonPresentationProperties setText:](v2, "setText:", v3);

  -[LPCaptionButtonPresentationProperties setType:](v2, "setType:", 1);
  return v2;
}

@end
