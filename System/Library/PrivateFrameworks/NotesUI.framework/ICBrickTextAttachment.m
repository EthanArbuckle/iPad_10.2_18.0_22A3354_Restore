@implementation ICBrickTextAttachment

- (id)supportedPresentationSizes
{
  void *v2;
  unsigned int v3;
  id v5;

  -[ICAbstractTextAttachment attachment](self, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "attachmentType");

  if (v3 > 6 || ((1 << v3) & 0x54) == 0)
  {
    if (supportedPresentationSizes_onceToken_0 != -1)
      dispatch_once(&supportedPresentationSizes_onceToken_0, &__block_literal_global_8);
    v5 = (id)supportedPresentationSizes_supportedSizes_0;
  }
  else
  {
    v5 = (id)MEMORY[0x1E0C9AA60];
  }
  return v5;
}

void __51__ICBrickTextAttachment_supportedPresentationSizes__block_invoke()
{
  void *v0;

  v0 = (void *)supportedPresentationSizes_supportedSizes_0;
  supportedPresentationSizes_supportedSizes_0 = (uint64_t)&unk_1E5C71A00;

}

- (double)viewCornerRadius
{
  return 16.0;
}

@end
