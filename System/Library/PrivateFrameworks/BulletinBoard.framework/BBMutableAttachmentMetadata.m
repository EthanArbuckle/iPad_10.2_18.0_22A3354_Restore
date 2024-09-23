@implementation BBMutableAttachmentMetadata

- (void)setType:(int64_t)a3
{
  self->super._type = a3;
}

- (void)setURL:(id)a3
{
  NSURL *v4;
  NSURL *URL;

  v4 = (NSURL *)objc_msgSend(a3, "copy");
  URL = self->super._URL;
  self->super._URL = v4;

}

- (void)setIdentifier:(id)a3
{
  NSString *v4;
  NSString *identifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  identifier = self->super._identifier;
  self->super._identifier = v4;

}

- (void)setUniformType:(id)a3
{
  NSString *v4;
  NSString *uniformType;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  uniformType = self->super._uniformType;
  self->super._uniformType = v4;

}

- (void)setThumbnailGeneratorUserInfo:(id)a3
{
  NSDictionary *v4;
  NSDictionary *thumbnailGeneratorUserInfo;

  v4 = (NSDictionary *)objc_msgSend(a3, "copy");
  thumbnailGeneratorUserInfo = self->super._thumbnailGeneratorUserInfo;
  self->super._thumbnailGeneratorUserInfo = v4;

}

- (void)setThumbnailHidden:(BOOL)a3
{
  self->super._thumbnailHidden = a3;
}

- (void)setHiddenFromDefaultExpandedView:(BOOL)a3
{
  self->super._hiddenFromDefaultExpandedView = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BBAttachmentMetadata *v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  id v11;
  uint64_t v13;

  v4 = +[BBAttachmentMetadata allocWithZone:](BBAttachmentMetadata, "allocWithZone:", a3);
  v5 = -[BBAttachmentMetadata type](self, "type");
  -[BBAttachmentMetadata URL](self, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBAttachmentMetadata identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBAttachmentMetadata uniformType](self, "uniformType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBAttachmentMetadata thumbnailGeneratorUserInfo](self, "thumbnailGeneratorUserInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[BBAttachmentMetadata thumbnailHidden](self, "thumbnailHidden");
  LOBYTE(v13) = -[BBAttachmentMetadata hiddenFromDefaultExpandedView](self, "hiddenFromDefaultExpandedView");
  v11 = -[BBAttachmentMetadata _initWithType:URL:identifier:uniformType:thumbnailGeneratorUserInfo:thumbnailHidden:hiddenFromDefaultExpandedView:](v4, "_initWithType:URL:identifier:uniformType:thumbnailGeneratorUserInfo:thumbnailHidden:hiddenFromDefaultExpandedView:", v5, v6, v7, v8, v9, v10, v13);

  return v11;
}

@end
