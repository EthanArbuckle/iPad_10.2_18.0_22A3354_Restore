@implementation AAUITrustedContactDetailsViewController

- (AAUITrustedContactDetailsViewController)initWithContact:(id)a3 viewModel:(id)a4 actionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  AAUITrustedContactDetailsViewController *v12;
  AAUITrustedContactDetailsViewController *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AAUITrustedContactDetailsViewController;
  v12 = -[AAUITrustedContactDetailsViewController init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_contact, a3);
    objc_storeStrong((id *)&v13->_viewModel, a4);
    objc_storeStrong((id *)&v13->_actionHandler, a5);
  }

  return v13;
}

- (id)specifiers
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  int v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = (int)*MEMORY[0x1E0D80590];
  if (!*(Class *)((char *)&self->super.super.super.super.super.isa + v3))
  {
    _AAUILogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_1DB4ED000, v4, OS_LOG_TYPE_DEFAULT, "Loading Trusted Contact details specifiers.", (uint8_t *)&v20, 2u);
    }

    v5 = (void *)objc_opt_new();
    -[AAUITrustedContactDetailsViewController _bigContactSpecifier](self, "_bigContactSpecifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

    -[AAUITrustedContactDetailsViewController _optionsGroupSpecifier](self, "_optionsGroupSpecifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v7);

    -[AAUITrustedContactDetailsViewController _detailsRowSpecifier](self, "_detailsRowSpecifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v8);

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[AATrustedContactDetailsViewModel primaryActionText](self->_viewModel, "primaryActionText");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "length");

      if (v10)
      {
        -[AAUITrustedContactDetailsViewController _primaryActionRowSpecifier](self, "_primaryActionRowSpecifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

      }
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[AATrustedContactDetailsViewModel secondaryActionText](self->_viewModel, "secondaryActionText");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "length");

      if (v13)
      {
        -[AAUITrustedContactDetailsViewController _secondaryActionRowSpecifier](self, "_secondaryActionRowSpecifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v14);

      }
    }
    -[AAUITrustedContactDetailsViewController _destructiveActionRowSpecifier](self, "_destructiveActionRowSpecifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v15);

    v16 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

  }
  _AAUILogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa + v3);
    v20 = 138412290;
    v21 = v18;
    _os_log_impl(&dword_1DB4ED000, v17, OS_LOG_TYPE_DEFAULT, "AAUITrustedContactDetailsViewController specifiers: returning %@", (uint8_t *)&v20, 0xCu);
  }

  return *(id *)((char *)&self->super.super.super.super.super.isa + v3);
}

- (id)_bigContactSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0D804E8];
  -[AALocalContactInfo displayName](self->_contact, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v4, self, 0, 0, 0, -1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x1E0D80780]);
  -[AALocalContactInfo displayName](self->_contact, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProperty:forKey:", v6, *MEMORY[0x1E0D80978]);

  -[AALocalContactInfo handle](self->_contact, "handle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProperty:forKey:", v7, *MEMORY[0x1E0D80950]);

  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "profilePictureForLocalContact:", self->_contact);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProperty:forKey:", v9, *MEMORY[0x1E0D80870]);
  objc_msgSend(v5, "setProperty:forKey:", &unk_1EA31E9E0, *MEMORY[0x1E0D80938]);

  return v5;
}

- (id)_optionsGroupSpecifier
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D804E8];
  -[AATrustedContactDetailsViewModel title](self->_viewModel, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "groupSpecifierWithID:name:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_detailsRowSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_new();
  -[AATrustedContactDetailsViewModel detailsLabel](self->_viewModel, "detailsLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AATrustedContactDetailsViewModel detailsLabel](self->_viewModel, "detailsLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AATrustedContactDetailsViewModel detailsSubtitle](self->_viewModel, "detailsSubtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "createSubtitleTableCellWithName:title:subtitle:image:", v4, v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_primaryActionRowSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0D804E8];
  -[AATrustedContactDetailsViewModel primaryActionText](self->_viewModel, "primaryActionText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v4, self, 0, 0, 0, 13, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[AATrustedContactDetailsViewModel primaryActionText](self->_viewModel, "primaryActionText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdentifier:", v6);

  objc_msgSend(v5, "setButtonAction:", sel__doPrimaryAction_);
  return v5;
}

- (id)_secondaryActionRowSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0D804E8];
  -[AATrustedContactDetailsViewModel secondaryActionText](self->_viewModel, "secondaryActionText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v4, self, 0, 0, 0, 13, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[AATrustedContactDetailsViewModel secondaryActionText](self->_viewModel, "secondaryActionText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdentifier:", v6);

  objc_msgSend(v5, "setButtonAction:", sel__doSecondaryAction_);
  return v5;
}

- (id)_destructiveActionRowSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0D804E8];
  -[AATrustedContactDetailsViewModel destructiveActionText](self->_viewModel, "destructiveActionText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deleteButtonSpecifierWithName:target:action:", v4, self, sel__showDestructiveAlert_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[AATrustedContactDetailsViewModel destructiveActionText](self->_viewModel, "destructiveActionText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdentifier:", v6);

  objc_msgSend(v5, "setProperty:forKey:", &unk_1EA31E818, *MEMORY[0x1E0D806F8]);
  return v5;
}

- (void)_doPrimaryAction:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[AAUITrustedContactDetailsActionHandler doPrimaryAction:specifier:](self->_actionHandler, "doPrimaryAction:specifier:", self, v4);

}

- (void)_doSecondaryAction:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[AAUITrustedContactDetailsActionHandler doSecondaryAction:specifier:](self->_actionHandler, "doSecondaryAction:specifier:", self, v4);

}

- (void)_showDestructiveAlert:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x1E0DC3450];
  -[AATrustedContactDetailsViewModel destructiveActionSheetDetails](self->_viewModel, "destructiveActionSheetDetails");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alertWithTitle:message:", 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0DC3448];
  -[AATrustedContactDetailsViewModel destructiveActionText](self->_viewModel, "destructiveActionText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __65__AAUITrustedContactDetailsViewController__showDestructiveAlert___block_invoke;
  v15[3] = &unk_1EA2DCFA8;
  objc_copyWeak(&v17, &location);
  v10 = v4;
  v16 = v10;
  objc_msgSend(v8, "actionWithTitle:style:handler:", v9, 2, v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v11);

  v12 = (void *)MEMORY[0x1E0DC3448];
  -[AATrustedContactDetailsViewModel destructiveActionSheetCancelText](self->_viewModel, "destructiveActionSheetCancelText");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 1, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v14);

  -[AAUITrustedContactDetailsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
  objc_destroyWeak(&v17);

  objc_destroyWeak(&location);
}

void __65__AAUITrustedContactDetailsViewController__showDestructiveAlert___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;

  _AALogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __65__AAUITrustedContactDetailsViewController__showDestructiveAlert___block_invoke_cold_1(v2);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_doDestructiveAction:", *(_QWORD *)(a1 + 32));

}

- (void)_doDestructiveAction:(id)a3
{
  -[AAUITrustedContactDetailsActionHandler doDestructiveAction:specifier:](self->_actionHandler, "doDestructiveAction:specifier:", self, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_actionHandler, 0);
}

void __65__AAUITrustedContactDetailsViewController__showDestructiveAlert___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1DB4ED000, log, OS_LOG_TYPE_DEBUG, "Confirmed destructive action.", v1, 2u);
}

@end
