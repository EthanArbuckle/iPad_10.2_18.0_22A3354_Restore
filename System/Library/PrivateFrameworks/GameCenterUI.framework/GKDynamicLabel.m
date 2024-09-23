@implementation GKDynamicLabel

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)GKDynamicLabel;
  -[GKDynamicLabel dealloc](&v4, sel_dealloc);
}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[GKDynamicLabel window](self, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_contentSizeCategoryDidChangeNotification_, *MEMORY[0x1E0DC48E8], 0);

    -[GKDynamicLabel contentSizeCategoryDidChangeNotification:](self, "contentSizeCategoryDidChangeNotification:", 0);
  }
}

- (void)contentSizeCategoryDidChangeNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[GKDynamicLabel font](self, "font", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fontDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fontAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0DC13B8]);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v9;
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKDynamicLabel setFont:](self, "setFont:", v8);

    v7 = v9;
  }

}

@end
