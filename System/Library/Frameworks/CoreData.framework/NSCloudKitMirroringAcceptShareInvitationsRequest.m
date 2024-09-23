@implementation NSCloudKitMirroringAcceptShareInvitationsRequest

- (NSCloudKitMirroringAcceptShareInvitationsRequest)initWithOptions:(id)a3 completionBlock:(id)a4
{
  NSCloudKitMirroringAcceptShareInvitationsRequest *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NSCloudKitMirroringAcceptShareInvitationsRequest;
  v4 = -[NSCloudKitMirroringRequest initWithOptions:completionBlock:](&v6, sel_initWithOptions_completionBlock_, a3, a4);
  if (v4)
  {
    v4->_shareURLsToAccept = (NSArray *)(id)NSArray_EmptyArray;
    v4->_shareMetadatasToAccept = (NSArray *)(id)NSArray_EmptyArray;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSCloudKitMirroringAcceptShareInvitationsRequest;
  -[NSCloudKitMirroringRequest dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NSCloudKitMirroringAcceptShareInvitationsRequest;
  v3 = (void *)objc_msgSend(-[NSCloudKitMirroringRequest description](&v5, sel_description), "mutableCopy");
  objc_msgSend(v3, "appendFormat:", CFSTR("\nshareURLs: %@\nshareMetadatas: %@"), self->_shareURLsToAccept, self->_shareMetadatasToAccept);
  return v3;
}

@end
