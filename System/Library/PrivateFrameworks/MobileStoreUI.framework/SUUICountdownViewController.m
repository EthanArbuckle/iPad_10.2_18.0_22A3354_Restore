@implementation SUUICountdownViewController

- (SUUICountdownViewController)initWithCountdownComponent:(id)a3 artworkLoader:(id)a4
{
  id v7;
  id v8;
  SUUICountdownViewController *v9;
  SUUICountdownViewController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SUUICountdownViewController;
  v9 = -[SUUICountdownViewController initWithNibName:bundle:](&v12, sel_initWithNibName_bundle_, 0, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_countdownComponent, a3);
    objc_storeStrong((id *)&v10->_artworkLoader, a4);
  }

  return v10;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  SUUIArtworkRequest *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SUUICountdownViewController;
  -[SUUICountdownViewController viewWillAppear:](&v11, sel_viewWillAppear_, a3);
  -[SUUICountdownComponent countdown](self->_countdownComponent, "countdown");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "artworkProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc_init(SUUIArtworkRequest);
    -[SUUIArtworkRequest setDelegate:](v6, "setDelegate:", self);
    +[SSVURLDataConsumer consumer](SUUIImageDataConsumer, "consumer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIArtworkRequest setDataConsumer:](v6, "setDataConsumer:", v7);

    objc_msgSend(v5, "largestArtwork");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIArtworkRequest setURL:](v6, "setURL:", v9);

    -[SUUIResourceLoader loadResourceWithRequest:reason:](self->_artworkLoader, "loadResourceWithRequest:reason:", v6, 1);
  }
  -[SUUICountdownViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "start");

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUUICountdownViewController;
  -[SUUICountdownViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[SUUICountdownViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stop");

}

- (void)loadView
{
  SUUICountdownView *v3;
  void *v4;
  SUUICountdownView *v5;

  v3 = [SUUICountdownView alloc];
  -[SUUICountdownComponent countdown](self->_countdownComponent, "countdown");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SUUICountdownView initWithCountdown:clientContext:](v3, "initWithCountdown:clientContext:", v4, self->_clientContext);

  -[SUUICountdownViewController setView:](self, "setView:", v5);
}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[SUUICountdownViewController view](self, "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundImage:", v5);

}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
  objc_storeStrong((id *)&self->_clientContext, a3);
}

- (SUUIResourceLoader)artworkLoader
{
  return self->_artworkLoader;
}

- (SUUICountdownComponent)countdownComponent
{
  return self->_countdownComponent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_countdownComponent, 0);
  objc_storeStrong((id *)&self->_artworkLoader, 0);
}

@end
