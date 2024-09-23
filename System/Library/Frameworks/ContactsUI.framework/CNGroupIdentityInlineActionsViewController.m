@implementation CNGroupIdentityInlineActionsViewController

- (CNGroupIdentityInlineActionsViewController)initWithGroupIdentity:(id)a3 actionsViewConfiguration:(id)a4
{
  id v7;
  id v8;
  CNGroupIdentityInlineActionsViewController *v9;
  CNGroupIdentityInlineActionsViewController *v10;
  CNContactInlineActionsViewController *v11;
  CNContactInlineActionsViewController *inlineActionsViewController;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  CNGroupIdentityInlineActionsViewController *v24;
  CNGroupIdentityInlineActionsViewController *v25;
  _QWORD v27[4];
  CNGroupIdentityInlineActionsViewController *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  objc_super v32;

  v7 = a3;
  v8 = a4;
  v32.receiver = self;
  v32.super_class = (Class)CNGroupIdentityInlineActionsViewController;
  v9 = -[CNGroupIdentityInlineActionsViewController init](&v32, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_group, a3);
    objc_storeStrong((id *)&v10->_configuration, a4);
    v11 = objc_alloc_init(CNContactInlineActionsViewController);
    inlineActionsViewController = v10->_inlineActionsViewController;
    v10->_inlineActionsViewController = v11;

    -[CNContactInlineActionsViewController setViewStyle:](v10->_inlineActionsViewController, "setViewStyle:", objc_msgSend(v8, "actionViewStyle"));
    objc_msgSend(v8, "geminiChannelIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactInlineActionsViewController setGeminiChannelIdentifier:](v10->_inlineActionsViewController, "setGeminiChannelIdentifier:", v13);

    -[CNContactInlineActionsViewController setDelegate:](v10->_inlineActionsViewController, "setDelegate:", v10);
    objc_msgSend(MEMORY[0x1E0D13D88], "allActionTypes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D13D88], "allSupportedActionTypes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactInlineActionsViewController setDisplaysUnavailableActionTypes:](v10->_inlineActionsViewController, "setDisplaysUnavailableActionTypes:", objc_msgSend(v8, "displaysUnavailableActionTypes"));
    objc_msgSend(v8, "supportedActionTypes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __93__CNGroupIdentityInlineActionsViewController_initWithGroupIdentity_actionsViewConfiguration___block_invoke;
    v29[3] = &unk_1E204E358;
    v30 = v14;
    v31 = v15;
    v18 = v15;
    v19 = v14;
    objc_msgSend(v16, "_cn_filter:", v29);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNContactInlineActionsViewController setSupportedActionTypes:](v10->_inlineActionsViewController, "setSupportedActionTypes:", v20);
    -[CNContactInlineActionsViewController setObjectViewControllerDelegate:](v10->_inlineActionsViewController, "setObjectViewControllerDelegate:", v10);
    -[CNContactInlineActionsViewController setDisplaysTitles:](v10->_inlineActionsViewController, "setDisplaysTitles:", 1);
    objc_msgSend(v7, "contacts");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactInlineActionsViewController setContacts:](v10->_inlineActionsViewController, "setContacts:", v21);

    objc_msgSend(v8, "actionsPerType");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "allValues");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v17;
    v27[1] = 3221225472;
    v27[2] = __93__CNGroupIdentityInlineActionsViewController_initWithGroupIdentity_actionsViewConfiguration___block_invoke_2;
    v27[3] = &unk_1E204CA90;
    v24 = v10;
    v28 = v24;
    objc_msgSend(v23, "_cn_each:", v27);

    v25 = v24;
  }

  return v10;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNGroupIdentityInlineActionsViewController;
  -[CNGroupIdentityInlineActionsViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[CNGroupIdentityInlineActionsViewController setupActionsView](self, "setupActionsView");
}

- (void)setGroup:(id)a3
{
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[CNGroupIdentity contacts](self->_group, "contacts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contacts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "_cn_isIdenticalToArray:", v6);

  if ((v7 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_group, a3);
    objc_msgSend(v10, "contacts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNGroupIdentityInlineActionsViewController inlineActionsViewController](self, "inlineActionsViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setContacts:", v8);

  }
}

- (id)viewForActionAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;

  -[CNGroupIdentityInlineActionsViewController inlineActionsViewController](self, "inlineActionsViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionsView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "arrangedSubviews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 <= a3)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v6, "arrangedSubviews");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)actionsContainerView
{
  void *v2;
  void *v3;
  void *v4;

  -[CNGroupIdentityInlineActionsViewController inlineActionsViewController](self, "inlineActionsViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionsView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)actionsView
{
  void *v2;
  void *v3;

  -[CNGroupIdentityInlineActionsViewController inlineActionsViewController](self, "inlineActionsViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionsView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)updateActionsViewForUpdatedActionItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (-[CNGroupIdentityInlineActionsViewController shouldOverrideEnabledStateForActionItem:](self, "shouldOverrideEnabledStateForActionItem:"))
  {
    -[CNGroupIdentityInlineActionsViewController inlineActionsViewController](self, "inlineActionsViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "actionType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "existingActionItemForType:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v6, "setDisabled:", objc_msgSend(v8, "overrideEnabledState") ^ 1);
      -[CNGroupIdentityInlineActionsViewController actionsView](self, "actionsView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "updateActionItem:", v6);

    }
  }

}

- (BOOL)shouldOverrideEnabledStateForActionItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  char v10;
  char v11;

  v4 = a3;
  -[CNGroupIdentityInlineActionsViewController group](self, "group");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contacts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  objc_msgSend(MEMORY[0x1E0D13D88], "allActionTypes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "_cn_containsObject:", v9);

  if (v7 <= 1 && (v10 & 1) != 0)
    v11 = 0;
  else
    v11 = objc_msgSend(v4, "shouldOverrideEnabledState");

  return v11;
}

- (int64_t)style
{
  void *v2;
  int64_t v3;

  -[CNGroupIdentityInlineActionsViewController inlineActionsViewController](self, "inlineActionsViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "viewStyle");

  return v3;
}

- (void)setupActionsView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];

  v24[4] = *MEMORY[0x1E0C80C00];
  -[CNGroupIdentityInlineActionsViewController inlineActionsViewController](self, "inlineActionsViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CNGroupIdentityInlineActionsViewController inlineActionsViewController](self, "inlineActionsViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNGroupIdentityInlineActionsViewController addChildViewController:](self, "addChildViewController:", v5);

  -[CNGroupIdentityInlineActionsViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v4);

  objc_msgSend(v4, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNGroupIdentityInlineActionsViewController view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v20;
  objc_msgSend(v4, "leadingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNGroupIdentityInlineActionsViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v16;
  objc_msgSend(v4, "trailingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNGroupIdentityInlineActionsViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v10;
  objc_msgSend(v4, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNGroupIdentityInlineActionsViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v15);
}

- (double)actionsViewHeightThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  void *v6;
  double v7;
  double v8;

  height = a3.height;
  width = a3.width;
  -[CNGroupIdentityInlineActionsViewController inlineActionsViewController](self, "inlineActionsViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionsView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sizeThatFits:", width, height);
  v8 = v7;

  return v8;
}

- (void)contactInlineActionsViewController:(id)a3 didPerformActionOfType:(id)a4 fromDisambiguation:(BOOL)a5
{
  _BOOL8 v5;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v5 = a5;
  v10 = a4;
  -[CNGroupIdentityInlineActionsViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[CNGroupIdentityInlineActionsViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "groupIdentityInlineActionsViewController:didPerformActionOfType:fromDisambiguation:", self, v10, v5);

  }
}

- (void)contactInlineActionsViewController:(id)a3 willPresentDisambiguationUIForActionType:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a4;
  -[CNGroupIdentityInlineActionsViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CNGroupIdentityInlineActionsViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "groupIdentityInlineActionsViewController:willPresentDisambiguationUIForActionType:", self, v8);

  }
}

- (void)contactInlineActionsViewController:(id)a3 didSelectActionOfType:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  id v10;

  v10 = a4;
  -[CNGroupIdentityInlineActionsViewController configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionsPerType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "actionBlock");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v7, "actionBlock");
      v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id))v9)[2](v9, v10);

    }
  }

}

- (BOOL)contactInlineActionsViewController:(id)a3 canPerformGroupActionOfType:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v5 = a4;
  -[CNGroupIdentityInlineActionsViewController configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionsPerType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "actionBlock");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 != 0;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)contactInlineActionsViewController:(id)a3 shouldPresentDisambiguationUIForActionOfType:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  -[CNGroupIdentityInlineActionsViewController configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionsPerType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend(v8, "shouldPresentDisambiguationUI");
  return (char)v6;
}

- (id)contactInlineActionsViewController:(id)a3 overrideImageForActionOfType:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  -[CNGroupIdentityInlineActionsViewController configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionsPerType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "image");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)contactInlineActionsViewController:(id)a3 overrideTitleForActionOfType:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  -[CNGroupIdentityInlineActionsViewController configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionsPerType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)contactInlineActionsViewController:(id)a3 shouldOverrideEnabledStateForActionOfType:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  -[CNGroupIdentityInlineActionsViewController configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionsPerType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = -[CNGroupIdentityInlineActionsViewController shouldOverrideEnabledStateForActionItem:](self, "shouldOverrideEnabledStateForActionItem:", v8);
  return (char)self;
}

- (BOOL)contactInlineActionsViewController:(id)a3 overrideEnabledStateForActionOfType:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  -[CNGroupIdentityInlineActionsViewController configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionsPerType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend(v8, "overrideEnabledState");
  return (char)v6;
}

- (CNGroupIdentity)group
{
  return self->_group;
}

- (CNGroupIdentityInlineActionsViewControllerDelegate)delegate
{
  return (CNGroupIdentityInlineActionsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CNContactInlineActionsViewController)inlineActionsViewController
{
  return self->_inlineActionsViewController;
}

- (void)setInlineActionsViewController:(id)a3
{
  objc_storeStrong((id *)&self->_inlineActionsViewController, a3);
}

- (CNGroupIdentityInlineActionsViewConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_inlineActionsViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_group, 0);
}

uint64_t __93__CNGroupIdentityInlineActionsViewController_initWithGroupIdentity_actionsViewConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_cn_containsObject:", v3))
    v4 = objc_msgSend(*(id *)(a1 + 40), "_cn_containsObject:", v3);
  else
    v4 = 1;

  return v4;
}

uint64_t __93__CNGroupIdentityInlineActionsViewController_initWithGroupIdentity_actionsViewConfiguration___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDelegate:", *(_QWORD *)(a1 + 32));
}

+ (id)descriptorForRequiredKeys
{
  return +[CNContactInlineActionsViewController descriptorForRequiredKeys](CNContactInlineActionsViewController, "descriptorForRequiredKeys");
}

@end
