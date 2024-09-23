@implementation ICTextAttachmentViewProvider

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_opt_class();
  -[NSTextAttachmentViewProvider textAttachment](self, "textAttachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[NSTextAttachmentViewProvider layoutManager](self, "layoutManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewForLayoutManager:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSTextAttachmentViewProvider setView:](self, "setView:", v5);
}

- (BOOL)tracksTextAttachmentViewBounds
{
  return 0;
}

@end
