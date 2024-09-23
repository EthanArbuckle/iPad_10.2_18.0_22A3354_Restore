@implementation EKAttachmentQLItem

- (EKAttachmentQLItem)initWithURL:(id)a3 filename:(id)a4
{
  id v7;
  id v8;
  EKAttachmentQLItem *v9;
  EKAttachmentQLItem *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)EKAttachmentQLItem;
  v9 = -[EKAttachmentQLItem init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_url, a3);
    objc_storeStrong((id *)&v10->_filename, a4);
  }

  return v10;
}

- (NSURL)previewItemURL
{
  return self->_url;
}

- (NSString)previewItemTitle
{
  return self->_filename;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
