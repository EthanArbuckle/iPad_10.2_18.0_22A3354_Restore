@implementation CNContactMenuDisplayingAction

- (CNContactMenuDisplayingAction)initWithTitle:(id)a3 menuProvider:(id)a4 destructive:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  CNContactMenuDisplayingAction *v9;
  void *v10;
  id menuProvider;
  CNContactMenuDisplayingAction *v12;
  objc_super v14;

  v5 = a5;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CNContactMenuDisplayingAction;
  v9 = -[CNContactAction initWithTitle:target:selector:destructive:](&v14, sel_initWithTitle_target_selector_destructive_, a3, 0, 0, v5);
  if (v9)
  {
    v10 = _Block_copy(v8);
    menuProvider = v9->_menuProvider;
    v9->_menuProvider = v10;

    v12 = v9;
  }

  return v9;
}

- (id)menuProvider
{
  return self->_menuProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_menuProvider, 0);
}

+ (id)contactActionWithTitle:(id)a3 menuProvider:(id)a4 destructive:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  CNContactMenuDisplayingAction *v9;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  v9 = -[CNContactMenuDisplayingAction initWithTitle:menuProvider:destructive:]([CNContactMenuDisplayingAction alloc], "initWithTitle:menuProvider:destructive:", v8, v7, v5);

  return v9;
}

@end
