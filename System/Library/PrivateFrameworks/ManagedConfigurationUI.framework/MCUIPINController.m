@implementation MCUIPINController

- (MCUIPINController)init
{
  MCUIPINController *v2;
  MCUIPINController *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  MCUIPINPane *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MCUIPINController;
  v2 = -[DevicePINController init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = (int)*MEMORY[0x1E0D80540];
    *(_DWORD *)((char *)&v2->super.super.super.super.super.super.isa + v4) = 3;
    objc_msgSend(MEMORY[0x1E0D804B8], "appearance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTextColor:", v6);

    v7 = objc_alloc_init(MCUIPINPane);
    -[MCUIPINPane setAutoresizingMask:](v7, "setAutoresizingMask:", 18);
    -[PSEditingPane setDelegate:](v7, "setDelegate:", v3);
    objc_msgSend(MEMORY[0x1E0D804E8], "emptyGroupSpecifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)((char *)&v3->super.super.super.super.super.super.isa + v4));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setProperty:forKey:", v9, CFSTR("mode"));

    -[DevicePINController setSpecifier:](v3, "setSpecifier:", v8);
    -[DevicePINController setPane:](v3, "setPane:", v7);

  }
  return v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MCUIPINController;
  -[DevicePINController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[MCUIPINController _updateStyle](self, "_updateStyle");
  -[MCUIPINController setModalInPresentation:](self, "setModalInPresentation:", -[MCUIPINController style](self, "style") != 1);
}

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
  DevicePINControllerDelegate **p_delegate;
  id WeakRetained;
  id v5;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v5, "didCancelEnteringPIN");

  }
}

- (void)_updateStyle
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
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
  __CFString *v23;

  v3 = -[MCUIPINController style](self, "style");
  -[PSDetailController pane](self, "pane");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStyle:", v3);

  v5 = -[MCUIPINController style](self, "style");
  if (v5 == 1)
  {
    -[MCUIPINController navigationItem](self, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHidesBackButton:", 0);

    if (-[DevicePINController simplePIN](self, "simplePIN"))
    {
      -[MCUIPINController navigationItem](self, "navigationItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setRightBarButtonItem:", 0);

    }
    v12 = (void *)MEMORY[0x1E0CEA638];
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "MCUIImageWithColor:", v13);
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();

    -[MCUIPINController navigationController](self, "navigationController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "navigationBar");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBackgroundImage:forBarMetrics:", v23, 0);

    -[MCUIPINController navigationController](self, "navigationController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "navigationBar");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_opt_new();
    objc_msgSend(v17, "setShadowImage:", v18);

    -[MCUIPINController navigationController](self, "navigationController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "navigationBar");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setTranslucent:", 1);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCUIPINController view](self, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setBackgroundColor:", v21);

    -[MCUIPINController navigationItem](self, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = &stru_1EA2B7FD8;
  }
  else
  {
    if (v5)
      return;
    -[MCUIPINController navigationItem](self, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidesBackButton:", 1);

    MCUILocalizedString(CFSTR("PIN_TITLE"));
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[MCUIPINController navigationItem](self, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = v23;
  }
  objc_msgSend(v7, "setTitle:", v9);

}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    objc_msgSend(MEMORY[0x1E0D804E8], "emptyGroupSpecifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "setProperty:forKey:", v7, *MEMORY[0x1E0D809C8]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80540]));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setProperty:forKey:", v8, CFSTR("mode"));

    -[DevicePINController setSpecifier:](self, "setSpecifier:", v6);
    v5 = obj;
  }

}

- (id)pinInstructionsPrompt
{
  if (MCUIForPairedDevice())
    return MCUILocalizedString(CFSTR("PIN_MESSAGE_BRIDGE"));
  else
    return MCUILocalizedString(CFSTR("PIN_MESSAGE"));
}

- (DevicePINControllerDelegate)delegate
{
  return (DevicePINControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
