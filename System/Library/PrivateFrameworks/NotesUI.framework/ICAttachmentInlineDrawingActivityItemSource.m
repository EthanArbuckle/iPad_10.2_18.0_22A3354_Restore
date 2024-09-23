@implementation ICAttachmentInlineDrawingActivityItemSource

- (id)attachmentTypeUTI
{
  return (id)objc_msgSend((id)*MEMORY[0x1E0CEC580], "identifier");
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "data", a3);
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UIImage *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1AF445E78]();
  objc_opt_class();
  -[ICAttachmentActivityItemSource attachment](self, "attachment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "attachmentModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "imageForActivityItem");
  v12 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIImagePNGRepresentation(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v8);
  return v13;
}

@end
