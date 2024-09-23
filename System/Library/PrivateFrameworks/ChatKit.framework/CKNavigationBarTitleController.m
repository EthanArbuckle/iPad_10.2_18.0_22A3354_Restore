@implementation CKNavigationBarTitleController

- (CKNavigationBarTitleController)initWithConversation:(id)a3
{
  id v5;
  CKNavigationBarTitleController *v6;
  CKNavigationBarTitleController *v7;
  CKAvatarPickerViewController *v8;
  CKAvatarPickerViewController *avatarPickerViewController;
  void *v10;
  void *v11;
  _UINavigationBarTitleView *v12;
  _UINavigationBarTitleView *titleView;
  _UINavigationBarTitleView *v14;
  void *v15;

  v5 = a3;
  v6 = -[CKNavigationBarTitleController init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_conversation, a3);
    v8 = -[CKAvatarPickerViewController initWithConversation:]([CKAvatarPickerViewController alloc], "initWithConversation:", v7->_conversation);
    avatarPickerViewController = v7->_avatarPickerViewController;
    v7->_avatarPickerViewController = v8;

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", v7, sel__pressedAvatarView);
    objc_msgSend(v10, "setNumberOfTapsRequired:", 1);
    -[CKAvatarPickerViewController view](v7->_avatarPickerViewController, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addGestureRecognizer:", v10);

    v12 = (_UINavigationBarTitleView *)objc_alloc_init(MEMORY[0x1E0CEAE10]);
    titleView = v7->_titleView;
    v7->_titleView = v12;

    -[_UINavigationBarTitleView setHeight:](v7->_titleView, "setHeight:", 64.0);
    v14 = v7->_titleView;
    -[CKAvatarPickerViewController view](v7->_avatarPickerViewController, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarTitleView addSubview:](v14, "addSubview:", v15);

    -[_UINavigationBarTitleView setPreferredContentAlignment:](v7->_titleView, "setPreferredContentAlignment:", 2);
  }

  return v7;
}

- (void)_pressedAvatarView
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "avatarViewPressed:", self);

}

- (void)_editCancelButtonPressed
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "cancelBarButtonItemPressed:", self);

}

- (NSArray)leftBarButtonItems
{
  id v3;
  void *v4;
  id v5;

  if (self->_editing)
  {
    v3 = objc_alloc(MEMORY[0x1E0C99D20]);
    -[CKNavigationBarTitleController deleteAllBarButtonItem](self, "deleteAllBarButtonItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v3, "initWithObjects:", v4, 0);

  }
  else
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99D20]);
  }
  return (NSArray *)v5;
}

- (NSArray)rightBarButtonItems
{
  id v3;
  void *v4;
  id v5;

  if (self->_editing)
  {
    v3 = objc_alloc(MEMORY[0x1E0C99D20]);
    -[CKNavigationBarTitleController cancelBarButtonItem](self, "cancelBarButtonItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v3, "initWithObjects:", v4, 0);

  }
  else
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99D20]);
  }
  return (NSArray *)v5;
}

- (UIBarButtonItem)cancelBarButtonItem
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CEA380]);
  CKFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E276D870, CFSTR("ChatKit"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithTitle:style:target:action:", v5, 0, self, sel__editCancelButtonPressed);

  return (UIBarButtonItem *)v6;
}

- (id)_conversationList
{
  return +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
}

- (CKConversation)conversation
{
  return self->_conversation;
}

- (CKAvatarPickerViewController)avatarPickerViewController
{
  return self->_avatarPickerViewController;
}

- (_UINavigationBarTitleView)titleView
{
  return self->_titleView;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (void)setEditing:(BOOL)a3
{
  self->_editing = a3;
}

- (UIBarButtonItem)deleteAllBarButtonItem
{
  return self->_deleteAllBarButtonItem;
}

- (CKNavigationBarTitleControllerDelegate)delegate
{
  return (CKNavigationBarTitleControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_deleteAllBarButtonItem, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_avatarPickerViewController, 0);
  objc_storeStrong((id *)&self->_conversation, 0);
}

@end
