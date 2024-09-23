@implementation ICAttachmentImageModel(UI)

- (uint64_t)genericListThumbnailCreator
{
  return 0;
}

- (uint64_t)genericBrickThumbnailCreator
{
  return 0;
}

- (id)activityItems
{
  ICAttachmentImageActivityItemSource *v2;
  void *v3;
  ICAttachmentImageActivityItemSource *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = [ICAttachmentImageActivityItemSource alloc];
  objc_msgSend(a1, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ICAttachmentActivityItemSource initWithAttachment:](v2, "initWithAttachment:", v3);
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)drawPreviewInRect:()UI
{
  void *v9;
  id v10;

  objc_msgSend(a1, "attachment");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "image");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "drawInRect:", a2, a3, a4, a5);

}

@end
