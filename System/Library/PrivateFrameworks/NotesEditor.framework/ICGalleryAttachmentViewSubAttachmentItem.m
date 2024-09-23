@implementation ICGalleryAttachmentViewSubAttachmentItem

- (ICGalleryAttachmentViewSubAttachmentItem)initWithAttachmentIdentifier:(id)a3 context:(id)a4
{
  id v7;
  id v8;
  ICGalleryAttachmentViewSubAttachmentItem *v9;
  ICGalleryAttachmentViewSubAttachmentItem *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICGalleryAttachmentViewSubAttachmentItem;
  v9 = -[ICGalleryAttachmentViewSubAttachmentItem init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_attachmentIdentifier, a3);
    objc_storeStrong((id *)&v10->_context, a4);
  }

  return v10;
}

- (ICAttachment)attachment
{
  ICAttachment *attachment;
  void *v4;
  void *v5;
  void *v6;
  ICAttachment *v7;
  ICAttachment *v8;

  attachment = self->_attachment;
  if (!attachment)
  {
    v4 = (void *)MEMORY[0x1E0D639F0];
    -[ICGalleryAttachmentViewSubAttachmentItem attachmentIdentifier](self, "attachmentIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICGalleryAttachmentViewSubAttachmentItem context](self, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "attachmentWithIdentifier:context:", v5, v6);
    v7 = (ICAttachment *)objc_claimAutoreleasedReturnValue();
    v8 = self->_attachment;
    self->_attachment = v7;

    attachment = self->_attachment;
  }
  return attachment;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ICGalleryAttachmentViewSubAttachmentItem attachmentIdentifier](self, "attachmentIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attachmentIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)invalidateSize
{
  -[ICGalleryAttachmentViewSubAttachmentItem setSize:](self, "setSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
}

- (BOOL)updateSize
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  _BOOL4 v9;

  -[ICGalleryAttachmentViewSubAttachmentItem attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeWidth");
  v5 = v4;
  -[ICGalleryAttachmentViewSubAttachmentItem attachment](self, "attachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sizeHeight");
  v8 = v7;

  v9 = v8 != self->_size.height || v5 != self->_size.width;
  if (v9)
  {
    self->_size.width = v5;
    self->_size.height = v8;
  }
  return v9;
}

- (CGSize)size
{
  double width;
  double height;
  void *v6;
  double v7;
  CGFloat v8;
  void *v9;
  CGFloat v10;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  if (width == *MEMORY[0x1E0C9D820] && height == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    -[ICGalleryAttachmentViewSubAttachmentItem attachment](self, "attachment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sizeWidth");
    v8 = v7;
    -[ICGalleryAttachmentViewSubAttachmentItem attachment](self, "attachment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sizeHeight");
    self->_size.width = v8;
    self->_size.height = v10;

    width = self->_size.width;
    height = self->_size.height;
  }
  result.height = height;
  result.width = width;
  return result;
}

- (void)setAttachment:(id)a3
{
  objc_storeStrong((id *)&self->_attachment, a3);
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (NSString)attachmentIdentifier
{
  return self->_attachmentIdentifier;
}

- (void)setAttachmentIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSManagedObjectContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_attachmentIdentifier, 0);
  objc_storeStrong((id *)&self->_attachment, 0);
}

@end
