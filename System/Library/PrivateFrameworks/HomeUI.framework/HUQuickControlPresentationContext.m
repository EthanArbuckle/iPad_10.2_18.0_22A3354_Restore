@implementation HUQuickControlPresentationContext

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  HUQuickControlPresentationItemManager *v7;
  void *v8;
  void *v9;
  HUQuickControlPresentationItemManager *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setColorStyle:", -[HUQuickControlPresentationContext colorStyle](self, "colorStyle"));
  -[HUQuickControlPresentationContext item](self, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    goto LABEL_4;
  -[HUQuickControlPresentationContext itemManager](self, "itemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = [HUQuickControlPresentationItemManager alloc];
    -[HUQuickControlPresentationContext itemManager](self, "itemManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "homeKitObjectUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlPresentationContext itemManager](self, "itemManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HUQuickControlPresentationItemManager initWithHomeKitObjectUUID:type:](v7, "initWithHomeKitObjectUUID:type:", v8, objc_msgSend(v9, "presentationItemType"));
    objc_msgSend(v4, "setItemManager:", v10);

LABEL_4:
  }
  -[HUQuickControlPresentationContext item](self, "item");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setItem:", v11);

  -[HUQuickControlPresentationContext controlItems](self, "controlItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setControlItems:", v12);

  -[HUQuickControlPresentationContext home](self, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHome:", v13);

  -[HUQuickControlPresentationContext sourceRect](self, "sourceRect");
  objc_msgSend(v4, "setSourceRect:");
  -[HUQuickControlPresentationContext sourceViewController](self, "sourceViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSourceViewController:", v14);

  objc_msgSend(v4, "setDidAuthenticate:", -[HUQuickControlPresentationContext didAuthenticate](self, "didAuthenticate"));
  -[HUQuickControlPresentationContext tappedArea](self, "tappedArea");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTappedArea:", v15);

  objc_msgSend(v4, "setPrefersSystemTransitions:", -[HUQuickControlPresentationContext prefersSystemTransitions](self, "prefersSystemTransitions"));
  objc_msgSend(v4, "setShouldIncludeRoomNameInHeaderTitle:", -[HUQuickControlPresentationContext shouldIncludeRoomNameInHeaderTitle](self, "shouldIncludeRoomNameInHeaderTitle"));
  return v4;
}

- (unint64_t)colorStyle
{
  return self->_colorStyle;
}

- (void)setColorStyle:(unint64_t)a3
{
  self->_colorStyle = a3;
}

- (NSCopying)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (NSSet)controlItems
{
  return self->_controlItems;
}

- (void)setControlItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (HUQuickControlPresentationItemManager)itemManager
{
  return self->_itemManager;
}

- (void)setItemManager:(id)a3
{
  objc_storeStrong((id *)&self->_itemManager, a3);
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (HFHomeKitObject)parentViewHomeKitObject
{
  return self->_parentViewHomeKitObject;
}

- (void)setParentViewHomeKitObject:(id)a3
{
  objc_storeStrong((id *)&self->_parentViewHomeKitObject, a3);
}

- (CGRect)sourceRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_sourceRect.origin.x;
  y = self->_sourceRect.origin.y;
  width = self->_sourceRect.size.width;
  height = self->_sourceRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSourceRect:(CGRect)a3
{
  self->_sourceRect = a3;
}

- (UIViewController)sourceViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_sourceViewController);
}

- (void)setSourceViewController:(id)a3
{
  objc_storeWeak((id *)&self->_sourceViewController, a3);
}

- (NSString)tappedArea
{
  return self->_tappedArea;
}

- (void)setTappedArea:(id)a3
{
  objc_storeStrong((id *)&self->_tappedArea, a3);
}

- (BOOL)didAuthenticate
{
  return self->_didAuthenticate;
}

- (void)setDidAuthenticate:(BOOL)a3
{
  self->_didAuthenticate = a3;
}

- (BOOL)prefersSystemTransitions
{
  return self->_prefersSystemTransitions;
}

- (void)setPrefersSystemTransitions:(BOOL)a3
{
  self->_prefersSystemTransitions = a3;
}

- (BOOL)shouldIncludeRoomNameInHeaderTitle
{
  return self->_shouldIncludeRoomNameInHeaderTitle;
}

- (void)setShouldIncludeRoomNameInHeaderTitle:(BOOL)a3
{
  self->_shouldIncludeRoomNameInHeaderTitle = a3;
}

- (HUDetailsPresentationDelegateHost)detailsViewController
{
  return self->_detailsViewController;
}

- (void)setDetailsViewController:(id)a3
{
  objc_storeStrong((id *)&self->_detailsViewController, a3);
}

- (BOOL)isConfiguredForNonHomeUser
{
  return self->_isConfiguredForNonHomeUser;
}

- (void)setIsConfiguredForNonHomeUser:(BOOL)a3
{
  self->_isConfiguredForNonHomeUser = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailsViewController, 0);
  objc_storeStrong((id *)&self->_tappedArea, 0);
  objc_destroyWeak((id *)&self->_sourceViewController);
  objc_storeStrong((id *)&self->_parentViewHomeKitObject, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_itemManager, 0);
  objc_storeStrong((id *)&self->_controlItems, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end
