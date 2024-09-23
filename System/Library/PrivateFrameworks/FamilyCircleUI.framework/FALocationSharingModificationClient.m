@implementation FALocationSharingModificationClient

- (FALocationSharingModificationClient)init
{
  FALocationSharingModificationClient *v2;
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FALocationSharingModificationClient;
  v2 = -[FALocationSharingModificationClient init](&v6, sel_init);
  v3 = objc_alloc_init(MEMORY[0x24BE845D8]);
  v4 = (void *)_stLocationSharingModificationClient;
  _stLocationSharingModificationClient = (uint64_t)v3;

  return v2;
}

- (void)isLocationSharingModificationAllowedForUserID:(id)a3 completionHandler:(id)a4
{
  objc_msgSend((id)_stLocationSharingModificationClient, "isLocationSharingModificationAllowedForUserID:completionHandler:", a3, a4);
}

- (void)setLocationSharingModificationAllowed:(BOOL)a3 forUserID:(id)a4 completionHandler:(id)a5
{
  objc_msgSend((id)_stLocationSharingModificationClient, "setLocationSharingModificationAllowed:forUserID:completionHandler:", a3, a4, a5);
}

@end
