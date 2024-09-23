@implementation SUUIGiftActivity

- (SUUIGiftActivity)initWithItem:(id)a3 clientContext:(id)a4
{
  id v7;
  id v8;
  SUUIGiftActivity *v9;
  SUUIGiftActivity *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SUUIGiftActivity;
  v9 = -[UIActivity init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clientContext, a4);
    objc_storeStrong((id *)&v10->_item, a3);
  }

  return v10;
}

- (id)activityImage
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:inBundle:", CFSTR("ShareSheetGift"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)activityTitle
{
  SUUIClientContext *clientContext;

  clientContext = self->_clientContext;
  if (clientContext)
    -[SUUIClientContext localizedStringForKey:](clientContext, "localizedStringForKey:", CFSTR("SHARE_SHEET_GIFT_TITLE"));
  else
    +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("SHARE_SHEET_GIFT_TITLE"), 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)activityType
{
  return CFSTR("SUUIActivityTypeGift");
}

- (id)activityViewController
{
  SUUIGift *v3;
  SUUIGiftViewController *v4;

  v3 = -[SUUIGift initWithItem:]([SUUIGift alloc], "initWithItem:", self->_item);
  v4 = -[SUUIGiftViewController initWithGift:]([SUUIGiftViewController alloc], "initWithGift:", v3);
  -[SUUIGiftViewController setClientContext:](v4, "setClientContext:", self->_clientContext);
  -[SUUIGiftViewController setGiftDelegate:](v4, "setGiftDelegate:", self);

  return v4;
}

- (id)_beforeActivity
{
  return (id)*MEMORY[0x24BDF7480];
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (void)giftViewController:(id)a3 didFinishWithResult:(BOOL)a4
{
  -[UIActivity activityDidFinish:](self, "activityDidFinish:", a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end
