@implementation AUISWShareableContent

- (AUISWShareableContent)initWithContent:(id)a3
{
  id v5;
  AUISWShareableContent *v6;
  AUISWShareableContent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AUISWShareableContent;
  v6 = -[AUISWShareableContent init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_content, a3);

  return v7;
}

- (NSArray)itemProviders
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AUISWShareableContent content](self, "content"));
  v4 = objc_opt_respondsToSelector(v3, "itemProviders");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AUISWShareableContent content](self, "content"));
  v6 = v5;
  if ((v4 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "itemProviders"));
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "itemProvider"));
    v10 = v8;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));

  }
  return (NSArray *)v7;
}

- (LPLinkMetadata)metadata
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AUISWShareableContent content](self, "content"));
  v4 = objc_opt_respondsToSelector(v3, "metadata");

  if ((v4 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AUISWShareableContent content](self, "content"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "metadata"));

  }
  else
  {
    v6 = 0;
  }
  return (LPLinkMetadata *)v6;
}

- (SWShareableContent)content
{
  return self->_content;
}

- (UIImage)previewImage
{
  return self->_previewImage;
}

- (void)setPreviewImage:(id)a3
{
  objc_storeStrong((id *)&self->_previewImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewImage, 0);
  objc_storeStrong((id *)&self->_content, 0);
}

@end
