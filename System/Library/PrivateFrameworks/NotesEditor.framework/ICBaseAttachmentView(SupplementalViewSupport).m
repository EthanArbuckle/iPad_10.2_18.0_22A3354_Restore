@implementation ICBaseAttachmentView(SupplementalViewSupport)

- (id)viewIdentifier
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "textAttachment");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
