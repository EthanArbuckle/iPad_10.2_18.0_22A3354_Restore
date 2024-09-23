@implementation GKDynamicButton

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)GKDynamicButton;
  -[GKDynamicButton dealloc](&v4, sel_dealloc);
}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[GKDynamicButton window](self, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_contentSizeCategoryDidChangeNotification_, *MEMORY[0x1E0DC48E8], 0);

    -[GKDynamicButton contentSizeCategoryDidChangeNotification:](self, "contentSizeCategoryDidChangeNotification:", 0);
  }
}

- (void)contentSizeCategoryDidChangeNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[GKDynamicButton titleLabel](self, "titleLabel", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "font");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fontDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fontAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0DC13B8]);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v11;
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKDynamicButton titleLabel](self, "titleLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFont:", v9);

    v8 = v11;
  }

}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKDynamicButton;
  -[GKDynamicButton layoutSubviews](&v5, sel_layoutSubviews);
  v3 = (void *)MEMORY[0x1E0DC37D8];
  -[GKDynamicButton bounds](self, "bounds");
  objc_msgSend(v3, "effectWithRoundedRect:cornerRadius:curve:", *MEMORY[0x1E0CD2A68]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPosition:", 2);
  -[GKDynamicButton setFocusEffect:](self, "setFocusEffect:", v4);

}

@end
