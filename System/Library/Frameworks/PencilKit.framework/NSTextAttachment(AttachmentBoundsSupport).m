@implementation NSTextAttachment(AttachmentBoundsSupport)

- (BOOL)pkAttachmentBoundsMightBeInvalid
{
  void *v1;
  _BOOL8 v2;

  objc_getAssociatedObject(a1, &attachmentBoundsKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (void)setPkAttachmentBoundsMightBeInvalid:()AttachmentBoundsSupport
{
  void *v3;

  if (a3)
    v3 = (void *)MEMORY[0x1E0C9AAB0];
  else
    v3 = 0;
  objc_setAssociatedObject(a1, &attachmentBoundsKey, v3, (void *)0x301);
}

- (void)setPkInserting:()AttachmentBoundsSupport
{
  void *v3;

  if (a3)
    v3 = (void *)MEMORY[0x1E0C9AAB0];
  else
    v3 = 0;
  objc_setAssociatedObject(a1, &insertingKey, v3, (void *)0x301);
}

- (BOOL)pkInserting
{
  void *v1;
  _BOOL8 v2;

  objc_getAssociatedObject(a1, &insertingKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

@end
