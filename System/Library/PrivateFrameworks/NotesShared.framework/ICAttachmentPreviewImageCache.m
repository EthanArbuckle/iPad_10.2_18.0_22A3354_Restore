@implementation ICAttachmentPreviewImageCache

- (ICAttachmentPreviewImageCache)init
{
  ICAttachmentPreviewImageCache *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICAttachmentPreviewImageCache;
  v2 = -[ICThumbnailDataCache init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_attachmentPreviewImagesDidUpdate_, CFSTR("ICAttachmentPreviewImagesDidUpdateNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel_attachmentPreviewImagesDidUpdate_, CFSTR("ICAttachmentDidLoadNotification"), 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("ICAttachmentPreviewImagesDidUpdateNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)ICAttachmentPreviewImageCache;
  -[ICAttachmentPreviewImageCache dealloc](&v4, sel_dealloc);
}

- (void)attachmentPreviewImagesDidUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  ICCheckedDynamicCast();
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v9;
  if (v9)
  {
    objc_msgSend(v9, "URIRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "absoluteString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICThumbnailDataCache removeThumbnailDataForKey:](self, "removeThumbnailDataForKey:", v8);

    v6 = v9;
  }

}

@end
