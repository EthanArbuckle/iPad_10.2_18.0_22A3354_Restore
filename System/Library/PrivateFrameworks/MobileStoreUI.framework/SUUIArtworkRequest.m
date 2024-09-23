@implementation SUUIArtworkRequest

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIArtworkRequest URL](self, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p; URL = %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)cachesInMemory
{
  return 1;
}

- (void)finishWithResource:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  UIImage *v10;
  void *v11;
  void *v12;
  UIImage *image;

  image = (UIImage *)a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "artworkRequest:didLoadImage:", self, image);
  }
  else
  {
    -[SUUIArtworkRequest URL](self, "URL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scheme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("x-apple-identity-image"));

    if ((v7 & 1) != 0)
    {
      v8 = (void *)MEMORY[0x24BEBD640];
      UIImagePNGRepresentation(image);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "imageWithData:", v9);
      v10 = (UIImage *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = image;
    }
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", v10, CFSTR("SUUIArtworkRequestImageKey"), 0);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "postNotificationName:object:userInfo:", CFSTR("SUUIArtworkRequestDidLoadImageNotification"), self, v11);

  }
}

- (id)newLoadOperation
{
  return -[SUUILoadArtworkResourceOperation initWithResourceRequest:]([SUUILoadArtworkResourceOperation alloc], "initWithResourceRequest:", self);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;
  id WeakRetained;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SUUIArtworkRequest;
  v5 = -[SUUIResourceRequest copyWithZone:](&v12, sel_copyWithZone_);
  objc_storeStrong(v5 + 3, self->_dataConsumer);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_storeWeak(v5 + 4, WeakRetained);

  v7 = -[NSString copyWithZone:](self->_imageName, "copyWithZone:", a3);
  v8 = v5[5];
  v5[5] = (id)v7;

  v9 = -[NSURL copyWithZone:](self->_url, "copyWithZone:", a3);
  v10 = v5[6];
  v5[6] = (id)v9;

  return v5;
}

- (SSVURLDataConsumer)dataConsumer
{
  return self->_dataConsumer;
}

- (void)setDataConsumer:(id)a3
{
  objc_storeStrong((id *)&self->_dataConsumer, a3);
}

- (SUUIArtworkRequestDelegate)delegate
{
  return (SUUIArtworkRequestDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)imageName
{
  return self->_imageName;
}

- (void)setImageName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSURL)URL
{
  return self->_url;
}

- (void)setURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dataConsumer, 0);
}

@end
