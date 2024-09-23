@implementation HUHomeHubSharedUserWarningTableViewController

- (void)loadView
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUHomeHubSharedUserWarningTableViewController;
  -[HUHomeHubSharedUserWarningTableViewController loadView](&v4, sel_loadView);
  -[HUHomeHubSharedUserWarningTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAllowsSelection:", 0);

}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  return (Class)objc_opt_class();
}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v24.receiver = self;
  v24.super_class = (Class)HUHomeHubSharedUserWarningTableViewController;
  -[HUItemTableViewController updateCell:forItem:indexPath:animated:](&v24, sel_updateCell_forItem_indexPath_animated_, v10, v11, a5, v6);
  objc_opt_class();
  v12 = v11;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  if (v14)
  {
    v15 = objc_opt_class();
    v16 = v10;
    if (v16)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v17 = v16;
      else
        v17 = 0;
      v18 = v16;
      if (v17)
        goto LABEL_12;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v15, objc_opt_class());

    }
    v18 = 0;
LABEL_12:

    objc_msgSend(v14, "home");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "user");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "hf_handleForUser:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setUserHandle:", v23);

  }
  objc_msgSend(v10, "setAccessoryType:", 0);

}

@end
