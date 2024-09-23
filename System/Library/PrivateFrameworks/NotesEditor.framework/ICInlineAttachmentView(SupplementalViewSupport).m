@implementation ICInlineAttachmentView(SupplementalViewSupport)

- (id)viewIdentifier
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "textAttachment");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "viewIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
