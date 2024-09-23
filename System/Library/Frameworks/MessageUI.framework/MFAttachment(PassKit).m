@implementation MFAttachment(PassKit)

- (id)passWithError:()PassKit
{
  void *v5;
  void *v6;

  objc_msgSend(a1, "metadataValueForKey:", CFSTR("_MFAttachmentPassKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(a1, "fetchDataSynchronously:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc((Class)getPKPassClass[0]()), "initWithData:error:", v6, a3);

  }
  return v5;
}

@end
