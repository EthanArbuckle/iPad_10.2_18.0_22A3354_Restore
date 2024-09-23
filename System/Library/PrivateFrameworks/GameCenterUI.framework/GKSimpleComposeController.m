@implementation GKSimpleComposeController

- (void)loadView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKSimpleComposeController;
  -[GKBaseComposeController loadView](&v3, sel_loadView);
  -[GKSimpleComposeController setupSendButton](self, "setupSendButton");
}

- (void)setupSendButton
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[GKSimpleComposeController navigationItem](self, "navigationItem");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0DC34F0]);
  GKGameCenterUIFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithTitle:style:target:action:", v5, 2, self, sel_donePressed);

  objc_msgSend(v7, "setRightBarButtonItem:", v6);
}

- (void)setPlayers:(id)a3
{
  NSArray *v5;
  NSArray *v6;

  v5 = (NSArray *)a3;
  if (self->_players != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_players, a3);
    v5 = v6;
  }

}

- (void)pushOntoNavigationController:(id)a3 withDoneHandler:(id)a4
{
  id v6;

  v6 = a3;
  -[GKSimpleComposeController setDoneHandler:](self, "setDoneHandler:", a4);
  objc_msgSend(v6, "pushViewController:animated:", self, 1);

}

- (void)donePressed
{
  void *v3;
  void *v4;
  void (**v5)(id, void *, _QWORD);

  -[GKSimpleComposeController doneHandler](self, "doneHandler");
  v5 = (void (**)(id, void *, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[GKBaseComposeController messageField](self, "messageField");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "text");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v4, 0);

    -[GKSimpleComposeController setDoneHandler:](self, "setDoneHandler:", 0);
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v3 = a3;
  -[NSArray _gkMapWithBlock:](self->_players, "_gkMapWithBlock:", &__block_literal_global_6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKComposeHeaderWithStaticRecipients setRecipientNameStrings:](self->_toField, "setRecipientNameStrings:", v5);

  v10.receiver = self;
  v10.super_class = (Class)GKSimpleComposeController;
  -[GKBaseComposeController viewWillAppear:](&v10, sel_viewWillAppear_, v3);
  objc_msgSend(MEMORY[0x1E0D25330], "localPlayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v6, "isUnderage");

  -[GKBaseComposeController messageField](self, "messageField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((_DWORD)v5)
  {
    objc_msgSend(v7, "setEditable:", 0);

    -[GKBaseComposeController setMessageFieldText:](self, "setMessageFieldText:", CFSTR(" "));
    -[GKBaseComposeController messageField](self, "messageField");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPlaceholderText:", 0);
  }
  else
  {
    objc_msgSend(v7, "setEditable:", 1);

    -[GKSimpleComposeController defaultMessage](self, "defaultMessage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKBaseComposeController setMessageFieldText:](self, "setMessageFieldText:", v9);
  }

}

uint64_t __44__GKSimpleComposeController_viewWillAppear___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "displayNameWithOptions:", 0);
}

- (GKComposeHeaderWithStaticRecipients)toField
{
  return self->_toField;
}

- (void)setToField:(id)a3
{
  objc_storeStrong((id *)&self->_toField, a3);
}

- (NSString)defaultMessage
{
  return self->_defaultMessage;
}

- (void)setDefaultMessage:(id)a3
{
  objc_storeStrong((id *)&self->_defaultMessage, a3);
}

- (NSArray)players
{
  return self->_players;
}

- (id)doneHandler
{
  return self->_doneHandler;
}

- (void)setDoneHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1168);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_doneHandler, 0);
  objc_storeStrong((id *)&self->_players, 0);
  objc_storeStrong((id *)&self->_defaultMessage, 0);
  objc_storeStrong((id *)&self->_toField, 0);
}

@end
