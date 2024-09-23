@implementation FBANoConnectionViewController

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FBANoConnectionViewController;
  -[FBANoConnectionViewController viewWillAppear:](&v9, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = LocalizableGTStringKeyForKey(CFSTR("NO_WIFI_MESSAGE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1000EA660, 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBASimpleTextNoticeController subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v8, "setText:", v7);

}

@end
