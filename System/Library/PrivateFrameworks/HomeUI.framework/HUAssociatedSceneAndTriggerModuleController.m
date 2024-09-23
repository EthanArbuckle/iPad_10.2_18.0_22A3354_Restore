@implementation HUAssociatedSceneAndTriggerModuleController

- (Class)cellClassForItem:(id)a3
{
  return (Class)objc_opt_class();
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = objc_opt_class();
  v10 = v4;
  if (!v10)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v10;
  else
    v6 = 0;
  v7 = v10;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v5, objc_opt_class());

LABEL_7:
    v7 = 0;
  }

  objc_msgSend(v7, "setHideIcon:", 1);
  objc_msgSend(v7, "setAccessoryType:", 1);

}

- (BOOL)canSelectItem:(id)a3
{
  return 1;
}

- (unint64_t)didSelectItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  HUAccessorySceneListViewController *v7;
  void *v8;
  void *v9;
  HUAccessorySceneListViewController *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  -[HUItemModuleController module](self, "module");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scenesItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    v7 = [HUAccessorySceneListViewController alloc];
    -[HUItemModuleController module](self, "module");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "serviceLikeItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HUAccessorySceneListViewController initWithServiceLikeItem:](v7, "initWithServiceLikeItem:", v9);

    +[HUViewControllerPresentationRequest requestWithViewController:](HUViewControllerPresentationRequest, "requestWithViewController:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPreferredPresentationType:", 1);
    -[HUItemModuleController host](self, "host");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v12, "moduleController:presentViewControllerForRequest:", self, v11);

  }
  return 0;
}

@end
