@implementation MFSMIMEControl

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v4 = (void *)MEMORY[0x1E0DC36B8];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__MFSMIMEControl_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
  v7[3] = &unk_1E5A699E8;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v4, "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  return v5;
}

id __72__MFSMIMEControl_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "smimeStatusOptionsForControl:", WeakRetained);

  objc_msgSend(WeakRetained, "menuWithOptions:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)menuWithOptions:(unint64_t)a3
{
  char v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  _QWORD v26[4];
  _QWORD v27[2];
  _QWORD v28[4];
  _QWORD v29[2];

  if (a3 == 1)
    return 0;
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFSMIMEControl delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0DC3428];
  if ((v4 & 2) != 0)
  {
    _EFLocalizedString();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("lock.slash.fill"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __34__MFSMIMEControl_menuWithOptions___block_invoke;
    v28[3] = &unk_1E5A66980;
    v17 = v7;
    v29[0] = v17;
    v29[1] = self;
    objc_msgSend(v8, "actionWithTitle:image:identifier:handler:", v15, v16, 0, v28);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "addObject:", v12);
    v13 = (id *)v29;
    if ((v4 & 4) != 0)
    {
      if ((v4 & 0x10) == 0 || (v4 & 0x20) != 0)
      {
        _EFLocalizedString();
        v24 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        EFLocalizedStringWithValue();
        v24 = objc_claimAutoreleasedReturnValue();
      }
      v18 = (void *)v24;
      -[MFSMIMEControl _goToSettingsAction](self, "_goToSettingsAction");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v19);
      goto LABEL_23;
    }
    if ((v4 & 0x10) == 0)
    {
      _EFLocalizedString();
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    if ((v4 & 0x20) != 0)
    {
      _EFLocalizedString();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFSMIMEControl _goToSettingsAction](self, "_goToSettingsAction");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v19);
      goto LABEL_23;
    }
    objc_msgSend(v17, "sendingAddressForControl:", self);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x1E0CB3940];
    _EFLocalizedString();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringWithFormat:", v21, v19);
    v22 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  _EFLocalizedString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("lock.fill"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __34__MFSMIMEControl_menuWithOptions___block_invoke_2;
  v26[3] = &unk_1E5A66980;
  v11 = v7;
  v27[0] = v11;
  v27[1] = self;
  objc_msgSend(v8, "actionWithTitle:image:identifier:handler:", v9, v10, 0, v26);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addObject:", v12);
  v13 = (id *)v27;
  if ((v4 & 0x10) != 0)
  {
    if ((v4 & 0x20) != 0)
    {
      _EFLocalizedString();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFSMIMEControl _goToSettingsAction](self, "_goToSettingsAction");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v19);
      goto LABEL_23;
    }
    objc_msgSend(v11, "sendingAddressForControl:", self);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1E0CB3940];
    _EFLocalizedString();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", v21, v19);
    v22 = objc_claimAutoreleasedReturnValue();
LABEL_16:
    v18 = (void *)v22;

LABEL_23:
    goto LABEL_24;
  }
  _EFLocalizedString();
  v14 = objc_claimAutoreleasedReturnValue();
LABEL_9:
  v18 = (void *)v14;
LABEL_24:

  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:children:", v18, v6);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

uint64_t __34__MFSMIMEControl_menuWithOptions___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "toggleEncryptionForControl:", *(_QWORD *)(a1 + 40));
}

uint64_t __34__MFSMIMEControl_menuWithOptions___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "toggleEncryptionForControl:", *(_QWORD *)(a1 + 40));
}

- (CGPoint)menuAttachmentPointForConfiguration:(id)a3
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat MidX;
  double MaxY;
  double v9;
  CGPoint result;
  CGRect v11;
  CGRect v12;

  -[MFSMIMEControl bounds](self, "bounds", a3);
  x = v11.origin.x;
  y = v11.origin.y;
  width = v11.size.width;
  height = v11.size.height;
  MidX = CGRectGetMidX(v11);
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  MaxY = CGRectGetMaxY(v12);
  v9 = MidX;
  result.y = MaxY;
  result.x = v9;
  return result;
}

- (id)_goToSettingsAction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v3 = (void *)MEMORY[0x1E0DC3428];
  _EFLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("gearshape"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __37__MFSMIMEControl__goToSettingsAction__block_invoke;
  v8[3] = &unk_1E5A67948;
  v8[4] = self;
  objc_msgSend(v3, "actionWithTitle:image:identifier:handler:", v4, v5, 0, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __37__MFSMIMEControl__goToSettingsAction__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "goToSettingsForControl:", *(_QWORD *)(a1 + 32));

}

- (MFSMIMEControlDelegate)delegate
{
  return (MFSMIMEControlDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)canPresentMenu
{
  return self->_canPresentMenu;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
