@implementation ICTodoButton(SupplementalViewSupport)

- (id)viewIdentifier
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "trackedParagraph");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "paragraph");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "todoTrackingUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
