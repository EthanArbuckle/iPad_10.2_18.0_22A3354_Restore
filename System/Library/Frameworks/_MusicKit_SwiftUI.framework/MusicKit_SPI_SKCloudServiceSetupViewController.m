@implementation MusicKit_SPI_SKCloudServiceSetupViewController

- (MusicKit_SPI_SKCloudServiceSetupViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  MusicKit_SPI_SKCloudServiceSetupViewController *v4;
  MusicKit_SPI_SKCloudServiceSetupViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MusicKit_SPI_SKCloudServiceSetupViewController;
  v4 = -[SKCloudServiceSetupViewController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
    -[SKCloudServiceSetupViewController setDelegate:](v4, "setDelegate:", v4);
  return v5;
}

- (void)musicKit_loadWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[MusicKit_SPI_SKCloudServiceSetupViewController _musicKit_underlyingOptionsForOptions:](self, "_musicKit_underlyingOptionsForOptions:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SKCloudServiceSetupViewController loadWithOptions:completionHandler:](self, "loadWithOptions:completionHandler:", v7, v6);

}

- (id)_musicKit_underlyingOptionsForOptions:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *);
  void *v13;
  MusicKit_SPI_SKCloudServiceSetupViewController *v14;
  id v15;

  v4 = (objc_class *)MEMORY[0x24BDBCED8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __88__MusicKit_SPI_SKCloudServiceSetupViewController__musicKit_underlyingOptionsForOptions___block_invoke;
  v13 = &unk_24EF41708;
  v14 = self;
  v15 = v6;
  v7 = v6;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", &v10);

  v8 = (void *)objc_msgSend(v7, "copy", v10, v11, v12, v13, v14);
  return v8;
}

- (id)_musicKit_underlyingActionForAction:(id)a3
{
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("musicKit_subscribe")))
    return (id)*MEMORY[0x24BDEA708];
  else
    return 0;
}

- (id)_musicKit_underlyingMessageIdentifierForMessageIdentifier:(id)a3
{
  id v3;
  id *v4;
  id v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("musicKit_join")) & 1) != 0)
  {
    v4 = (id *)MEMORY[0x24BDEA720];
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("musicKit_connect")) & 1) != 0)
  {
    v4 = (id *)MEMORY[0x24BDEA718];
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("musicKit_addMusic")) & 1) != 0)
  {
    v4 = (id *)MEMORY[0x24BDEA710];
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("musicKit_playMusic")))
    {
      v5 = 0;
      goto LABEL_10;
    }
    v4 = (id *)MEMORY[0x24BDEA728];
  }
  v5 = *v4;
LABEL_10:

  return v5;
}

- (void)cloudServiceSetupViewControllerDidDismiss:(id)a3
{
  id v4;

  if (self == a3)
  {
    -[MusicKit_SPI_SKCloudServiceSetupViewController musicKit_delegate](self, "musicKit_delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "musicKit_cloudServiceSetupViewControllerDidDismiss:", self);

  }
}

- (MusicKit_SPI_SKCloudServiceSetupViewControllerDelegate)musicKit_delegate
{
  return (MusicKit_SPI_SKCloudServiceSetupViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_musicKit_delegate);
}

- (void)musicKit_setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_musicKit_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_musicKit_delegate);
}

@end
