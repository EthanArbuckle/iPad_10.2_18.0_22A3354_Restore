@implementation ICAttachmentWebModel(UI)

- (void)genericListThumbnailCreator
{
  return &__block_literal_global_53;
}

- (void)genericBrickThumbnailCreator
{
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__ICAttachmentWebModel_UI__genericBrickThumbnailCreator__block_invoke;
  aBlock[3] = &unk_1E5C214B0;
  aBlock[4] = a1;
  return _Block_copy(aBlock);
}

- (void)genericBrickLargeThumbnailCreator
{
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__ICAttachmentWebModel_UI__genericBrickLargeThumbnailCreator__block_invoke;
  aBlock[3] = &unk_1E5C214B0;
  aBlock[4] = a1;
  return _Block_copy(aBlock);
}

+ (id)genericBrickThumbnailWithSize:()UI scale:
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.890196078, 0.894117647, 0.901960784, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "ic_imageNamed:withTint:size:", CFSTR("attachment_brick_weblink_generic_thumb"), v4, a1, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
