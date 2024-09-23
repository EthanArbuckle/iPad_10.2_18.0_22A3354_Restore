@implementation CKReviewLargePhotoAttachmentsViewController

- (id)navigationBarTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("PHOTOS"), &stru_1E276D870, CFSTR("General"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)attachmentClass
{
  return (id)*MEMORY[0x1E0D35AD8];
}

@end
