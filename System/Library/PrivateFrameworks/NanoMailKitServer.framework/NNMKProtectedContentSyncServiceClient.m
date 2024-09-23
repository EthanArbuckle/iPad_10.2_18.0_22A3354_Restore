@implementation NNMKProtectedContentSyncServiceClient

- (NNMKProtectedContentSyncServiceClient)initWithQueue:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NNMKProtectedContentSyncServiceClient;
  return -[NNMKSyncServiceEndpoint initWithIDSServiceName:queue:](&v4, sel_initWithIDSServiceName_queue_, CFSTR("com.apple.private.alloy.mail.sync.protected.content"), a3);
}

@end
