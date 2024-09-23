@implementation SUUIAddToWishlistActivity

- (SUUIAddToWishlistActivity)initWithItem:(id)a3 clientContext:(id)a4
{
  id v7;
  id v8;
  SUUIAddToWishlistActivity *v9;
  SUUIAddToWishlistActivity *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SUUIAddToWishlistActivity;
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
  objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:inBundle:", CFSTR("ShareSheetWishList"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)activityTitle
{
  SUUIClientContext *clientContext;

  clientContext = self->_clientContext;
  if (clientContext)
    -[SUUIClientContext localizedStringForKey:](clientContext, "localizedStringForKey:", CFSTR("ADD_TO_WISHLIST"));
  else
    +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("ADD_TO_WISHLIST"), 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)activityType
{
  return CFSTR("SUUIActivityTypeAddToWishlist");
}

- (id)_beforeActivity
{
  return (id)*MEMORY[0x24BDF7480];
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (void)performActivity
{
  id v3;

  +[SUUIWishlist activeWishlist](SUUIWishlist, "activeWishlist");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addItem:", self->_item);
  objc_msgSend(v3, "postChangeNotification");
  -[UIActivity activityDidFinish:](self, "activityDidFinish:", 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end
