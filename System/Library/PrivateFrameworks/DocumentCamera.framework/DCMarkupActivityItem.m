@implementation DCMarkupActivityItem

- (DCMarkupActivityItem)initWithDocumentInfo:(id)a3 imageCache:(id)a4
{
  id v6;
  id v7;
  DCMarkupActivityItem *v8;
  DCMarkupActivityItem *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)DCMarkupActivityItem;
  v8 = -[DCMarkupActivityItem init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[DCMarkupActivityItem setDocumentInfo:](v8, "setDocumentInfo:", v6);
    -[DCMarkupActivityItem setImageCache:](v9, "setImageCache:", v7);
  }

  return v9;
}

- (ICDocCamDocumentInfo)documentInfo
{
  return self->_documentInfo;
}

- (void)setDocumentInfo:(id)a3
{
  objc_storeStrong((id *)&self->_documentInfo, a3);
}

- (ICDocCamImageCache)imageCache
{
  return self->_imageCache;
}

- (void)setImageCache:(id)a3
{
  objc_storeStrong((id *)&self->_imageCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_documentInfo, 0);
}

@end
