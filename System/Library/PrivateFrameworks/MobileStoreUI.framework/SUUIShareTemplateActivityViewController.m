@implementation SUUIShareTemplateActivityViewController

- (SUUIShareTemplateActivityViewController)initWithTemplateElement:(id)a3 clientContext:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  SUUIShareTemplateActivityViewController *v11;
  SUUIShareTemplateActivityViewController *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  objc_super v18;
  _QWORD v19[7];

  v19[6] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  -[SUUIShareTemplateActivityViewController _activityItemsWithTemplateElement:clientContext:](self, "_activityItemsWithTemplateElement:clientContext:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIShareTemplateActivityViewController _applicationActivitiesWithTemplateElement:clientContext:](self, "_applicationActivitiesWithTemplateElement:clientContext:", v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18.receiver = self;
  v18.super_class = (Class)SUUIShareTemplateActivityViewController;
  v11 = -[SUUIShareTemplateActivityViewController initWithActivityItems:applicationActivities:](&v18, sel_initWithActivityItems_applicationActivities_, v9, v10);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_clientContext, a4);
    objc_storeStrong((id *)&v12->_templateElement, a3);
    v13 = *MEMORY[0x24BDF7478];
    v19[0] = *MEMORY[0x24BDF7468];
    v19[1] = v13;
    v14 = *MEMORY[0x24BDF74C8];
    v19[2] = *MEMORY[0x24BDF74B0];
    v19[3] = v14;
    v15 = *MEMORY[0x24BDF74E0];
    v19[4] = *MEMORY[0x24BDF74D8];
    v19[5] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIShareTemplateActivityViewController setExcludedActivityTypes:](v12, "setExcludedActivityTypes:", v16);

  }
  return v12;
}

- (id)_titleForActivity:(id)a3
{
  id v4;
  void *v5;
  SUUIClientContext *clientContext;

  v4 = a3;
  if ((id)*MEMORY[0x24BDF7480] == v4)
  {
    clientContext = self->_clientContext;
    if (clientContext)
      -[SUUIClientContext localizedStringForKey:](clientContext, "localizedStringForKey:", CFSTR("ACTIVITY_COPY_LINK"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("ACTIVITY_COPY_LINK"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_activityItemsWithTemplateElement:(id)a3 clientContext:(id)a4
{
  id v5;
  id v6;
  SUUIShareTemplateImageItemProvider *v7;
  SUUIShareTemplateTextItemProvider *v8;
  SUUIShareTemplateURLItemProvider *v9;
  void *v10;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = a3;
  v7 = -[SUUIShareTemplateImageItemProvider initWithTemplateElement:]([SUUIShareTemplateImageItemProvider alloc], "initWithTemplateElement:", v6);
  v8 = -[SUUIShareTemplateTextItemProvider initWithTemplateElement:clientContext:]([SUUIShareTemplateTextItemProvider alloc], "initWithTemplateElement:clientContext:", v6, v5);

  v9 = -[SUUIShareTemplateURLItemProvider initWithTemplateElement:]([SUUIShareTemplateURLItemProvider alloc], "initWithTemplateElement:", v6);
  v12[0] = v8;
  v12[1] = v9;
  v12[2] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_applicationActivitiesWithTemplateElement:(id)a3 clientContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  __CFString *v8;
  uint64_t v9;
  char v10;
  char v11;
  void *v12;
  SUUIShareTemplateActivity *v13;
  uint64_t i;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = CFSTR("wishlist");
  v8 = CFSTR("gift");
  v9 = 0;
  v16[1] = v8;
  v10 = 1;
  do
  {
    v11 = v10;
    objc_msgSend(v5, "activityForShareSheetActivityType:", v16[v9]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = -[SUUIShareTemplateActivity initWithActivityViewElement:clientContext:]([SUUIShareTemplateActivity alloc], "initWithActivityViewElement:clientContext:", v12, v6);
      objc_msgSend(v7, "addObject:", v13);

    }
    v10 = 0;
    v9 = 1;
  }
  while ((v11 & 1) != 0);
  for (i = 1; i != -1; --i)

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateElement, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end
