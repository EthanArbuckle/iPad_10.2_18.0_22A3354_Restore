@implementation UNMutableNotificationAttachmentOptions

- (void)setDisplayLocation:(unint64_t)a3
{
  self->super._displayLocation = a3;
}

- (void)setThumbnailGeneratorUserInfo:(id)a3
{
  NSDictionary *v4;
  NSDictionary *thumbnailGeneratorUserInfo;

  v4 = (NSDictionary *)objc_msgSend(a3, "copy");
  thumbnailGeneratorUserInfo = self->super._thumbnailGeneratorUserInfo;
  self->super._thumbnailGeneratorUserInfo = v4;

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[UNNotificationAttachmentOptions _initWithOptions:]([UNNotificationAttachmentOptions alloc], "_initWithOptions:", self);
}

@end
