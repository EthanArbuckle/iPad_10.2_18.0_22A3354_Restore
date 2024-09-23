@implementation AVTAvatarRecord(UIActivityItemSource)

- (id)activityViewController:()UIActivityItemSource subjectForActivityType:
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("avatar_%@.avt"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (const)activityViewController:()UIActivityItemSource dataTypeIdentifierForActivityType:
{
  return CFSTR("com.apple.private.avatar");
}

- (id)activityViewController:()UIActivityItemSource thumbnailImageForActivityType:suggestedSize:
{
  AVTAvatarRecordImageProvider *v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(AVTAvatarRecordImageProvider);
  +[AVTRenderingScope gridThumbnailScope](AVTRenderingScope, "gridThumbnailScope");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarRecordImageProvider imageForRecord:scope:](v2, "imageForRecord:scope:", a1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
