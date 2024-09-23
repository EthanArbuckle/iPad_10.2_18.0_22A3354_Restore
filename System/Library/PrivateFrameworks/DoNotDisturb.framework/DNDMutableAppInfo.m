@implementation DNDMutableAppInfo

- (void)setSource:(int64_t)a3
{
  self->super._source = a3;
}

- (void)setStoreIconURL:(id)a3
{
  NSURL *v4;
  NSURL *storeIconURL;

  v4 = (NSURL *)objc_msgSend(a3, "copy");
  storeIconURL = self->super._storeIconURL;
  self->super._storeIconURL = v4;

}

- (void)setCachedIconURL:(id)a3
{
  NSURL *v4;
  NSURL *cachedIconURL;

  v4 = (NSURL *)objc_msgSend(a3, "copy");
  cachedIconURL = self->super._cachedIconURL;
  self->super._cachedIconURL = v4;

}

- (void)setDisplayName:(id)a3
{
  NSString *v4;
  NSString *displayName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  displayName = self->super._displayName;
  self->super._displayName = v4;

}

- (void)setApplicationIdentifier:(id)a3
{
  DNDApplicationIdentifier *v4;
  DNDApplicationIdentifier *applicationIdentifier;

  v4 = (DNDApplicationIdentifier *)objc_msgSend(a3, "copy");
  applicationIdentifier = self->super._applicationIdentifier;
  self->super._applicationIdentifier = v4;

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[DNDAppInfo _initWithAppInfo:](+[DNDAppInfo allocWithZone:](DNDAppInfo, "allocWithZone:", a3), "_initWithAppInfo:", self);
}

@end
