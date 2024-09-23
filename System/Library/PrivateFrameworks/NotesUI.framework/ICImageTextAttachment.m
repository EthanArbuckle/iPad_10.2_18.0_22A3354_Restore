@implementation ICImageTextAttachment

- (id)supportedPresentationSizes
{
  if (supportedPresentationSizes_onceToken_2 != -1)
    dispatch_once(&supportedPresentationSizes_onceToken_2, &__block_literal_global_23);
  return (id)supportedPresentationSizes_supportedSizes_2;
}

void __51__ICImageTextAttachment_supportedPresentationSizes__block_invoke()
{
  void *v0;

  v0 = (void *)supportedPresentationSizes_supportedSizes_2;
  supportedPresentationSizes_supportedSizes_2 = (uint64_t)&unk_1E5C71A90;

}

- (BOOL)supportsMultipleThumbnailsOnSameLine
{
  return 1;
}

- (BOOL)requiresSpaceAfterAttachmentForPrinting
{
  return 1;
}

@end
