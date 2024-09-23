@implementation SharingItem

- (SharingItem)initWithData:(id)a3
{
  id v4;
  SharingItem *v5;
  SharingItem *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SharingItem;
  v5 = -[SharingItem init](&v8, "init");
  v6 = v5;
  if (v5)
    -[SharingItem setData:](v5, "setData:", v4);

  return v6;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = objc_alloc((Class)UIImage);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SharingItem data](self, "data"));
  v7 = objc_msgSend(v5, "initWithData:", v6);

  return v7;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = objc_alloc((Class)UIImage);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SharingItem data](self, "data"));
  v6 = objc_msgSend(v4, "initWithData:", v5);

  return v6;
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;

  v4 = objc_alloc_init((Class)LPLinkMetadata);
  v5 = objc_alloc_init((Class)LPFileMetadata);
  v6 = objc_alloc((Class)LPImage);
  v7 = objc_alloc((Class)UIImage);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SharingItem data](self, "data"));
  v9 = objc_msgSend(v7, "initWithData:", v8);
  v10 = objc_msgSend(v6, "initWithPlatformImage:", v9);
  objc_msgSend(v5, "setThumbnail:", v10);

  objc_msgSend(v5, "setName:", CFSTR("Apple TV Screenshot"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeImage, "identifier"));
  objc_msgSend(v5, "setType:", v11);

  objc_msgSend(v4, "setSpecialization:", v5);
  return v4;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
