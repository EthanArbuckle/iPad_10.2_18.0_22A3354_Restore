@implementation HUQuickControlViewControllerCollectionViewCell

+ (unint64_t)quickControlSizeForItemSize:(unint64_t)a3
{
  if (a3 - 1 >= 3)
    return 3;
  else
    return 3 - a3;
}

- (void)_updateContentViewControllerForActiveLayoutAttributes
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v3 = (void *)objc_opt_class();
  -[HUQuickControlViewControllerCollectionViewCell activeLayoutAttributes](self, "activeLayoutAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "quickControlSizeForItemSize:", objc_msgSend(v4, "itemSize"));
  -[HUViewControllerCollectionViewCell viewController](self, "viewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setControlSize:", v5);

  -[HUQuickControlViewControllerCollectionViewCell activeLayoutAttributes](self, "activeLayoutAttributes");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v10, "titlePosition");
  -[HUViewControllerCollectionViewCell viewController](self, "viewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitlePosition:", v8);

}

- (void)setActiveLayoutAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_activeLayoutAttributes, a3);
  -[HUQuickControlViewControllerCollectionViewCell _updateContentViewControllerForActiveLayoutAttributes](self, "_updateContentViewControllerForActiveLayoutAttributes");
}

- (void)setViewController:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUQuickControlViewControllerCollectionViewCell;
  -[HUViewControllerCollectionViewCell setViewController:](&v4, sel_setViewController_, a3);
  -[HUQuickControlViewControllerCollectionViewCell _updateContentViewControllerForActiveLayoutAttributes](self, "_updateContentViewControllerForActiveLayoutAttributes");
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HUQuickControlViewControllerCollectionViewCell;
  -[HUQuickControlViewControllerCollectionViewCell applyLayoutAttributes:](&v8, sel_applyLayoutAttributes_, v4);
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  -[HUQuickControlViewControllerCollectionViewCell setActiveLayoutAttributes:](self, "setActiveLayoutAttributes:", v7);
}

- (HUQuickControlCollectionViewLayoutAttributes)activeLayoutAttributes
{
  return self->_activeLayoutAttributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeLayoutAttributes, 0);
}

@end
