@implementation HUEditOutgoingInvitationViewController

- (HUEditOutgoingInvitationViewController)initWithItem:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  HUEditOutgoingInvitationItemManager *v8;
  void *v9;
  HUEditOutgoingInvitationItemManager *v10;
  HUEditOutgoingInvitationViewController *v11;
  objc_super v13;

  v6 = a4;
  v7 = a3;
  v8 = [HUEditOutgoingInvitationItemManager alloc];
  v9 = (void *)objc_msgSend(v7, "copy");

  v10 = -[HUEditOutgoingInvitationItemManager initWithDelegate:sourceItem:home:](v8, "initWithDelegate:sourceItem:home:", self, v9, v6);
  v13.receiver = self;
  v13.super_class = (Class)HUEditOutgoingInvitationViewController;
  v11 = -[HUUserTableViewController initWithUserItemManager:home:](&v13, sel_initWithUserItemManager_home_, v10, v6);

  if (v11)
    objc_storeStrong((id *)&v11->_editOutgoingInvitationItemManager, v10);

  return v11;
}

- (id)user
{
  void *v2;
  void *v3;
  void *v4;

  -[HUEditOutgoingInvitationViewController editOutgoingInvitationItemManager](self, "editOutgoingInvitationItemManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outgoingInvitation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invitee");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)itemManager:(id)a3 didUpdateResultsForSourceItem:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUEditOutgoingInvitationViewController;
  -[HUItemTableViewController itemManager:didUpdateResultsForSourceItem:](&v8, sel_itemManager_didUpdateResultsForSourceItem_, a3, a4);
  -[HUEditOutgoingInvitationViewController editOutgoingInvitationItemManager](self, "editOutgoingInvitationItemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "outgoingInvitation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUEditOutgoingInvitationViewController _messageForInvitationState:](self, "_messageForInvitationState:", objc_msgSend(v6, "invitationState"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUUserTableViewController setHeaderMessage:](self, "setHeaderMessage:", v7);

}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  -[HUEditOutgoingInvitationViewController editOutgoingInvitationItemManager](self, "editOutgoingInvitationItemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "inviteAgainItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "isEqual:", v9);

  if (v10)
  {
    objc_opt_class();
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)HUEditOutgoingInvitationViewController;
    -[HUUserTableViewController cellClassForItem:indexPath:](&v14, sel_cellClassForItem_indexPath_, v6, v7);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v11;

  return (Class)v12;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  objc_super v14;

  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HUEditOutgoingInvitationViewController;
  v9 = a4;
  -[HUUserTableViewController setupCell:forItem:indexPath:](&v14, sel_setupCell_forItem_indexPath_, v8, v9, a5);
  -[HUEditOutgoingInvitationViewController editOutgoingInvitationItemManager](self, "editOutgoingInvitationItemManager", v14.receiver, v14.super_class);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "inviteAgainItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "isEqual:", v11);

  if (v12)
  {
    v13 = v8;
    objc_msgSend(v13, "setDestructive:", 0);
    objc_msgSend(v13, "setUseFullWidthSeparator:", 1);

  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  objc_super v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)HUEditOutgoingInvitationViewController;
  v6 = a4;
  v7 = a3;
  -[HUItemTableViewController tableView:didSelectRowAtIndexPath:](&v14, sel_tableView_didSelectRowAtIndexPath_, v7, v6);
  -[HUItemTableViewController itemManager](self, "itemManager", v14.receiver, v14.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayedItemAtIndexPath:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUEditOutgoingInvitationViewController editOutgoingInvitationItemManager](self, "editOutgoingInvitationItemManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "inviteAgainItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "isEqual:", v11);

  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1);
  -[HUEditOutgoingInvitationViewController _cancelOutgoingInvitation:](self, "_cancelOutgoingInvitation:", v12);
  HFLogForCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v16 = "-[HUEditOutgoingInvitationViewController tableView:didSelectRowAtIndexPath:]";
    v17 = 2112;
    v18 = v9;
    v19 = 1024;
    v20 = v12;
    _os_log_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_DEFAULT, "(%s) User tapped %@. resendInvitation = %{BOOL}d", buf, 0x1Cu);
  }

}

- (void)_cancelOutgoingInvitation:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;

  v3 = a3;
  -[HUEditOutgoingInvitationViewController editOutgoingInvitationItemManager](self, "editOutgoingInvitationItemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "outgoingInvitation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemTableViewController itemManager](self, "itemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUEditOutgoingInvitationViewController user](self, "user");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "userID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0D519C0];
  v12 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __68__HUEditOutgoingInvitationViewController__cancelOutgoingInvitation___block_invoke;
  v25[3] = &unk_1E6F4C5E8;
  v13 = v6;
  v26 = v13;
  objc_msgSend(v11, "futureWithErrorOnlyHandlerAdapterBlock:", v25);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v22[0] = v12;
    v22[1] = 3221225472;
    v22[2] = __68__HUEditOutgoingInvitationViewController__cancelOutgoingInvitation___block_invoke_2;
    v22[3] = &unk_1E6F55A28;
    v23 = v10;
    v24 = v8;
    objc_msgSend(v14, "flatMap:", v22);
    v15 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v15;
  }
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __68__HUEditOutgoingInvitationViewController__cancelOutgoingInvitation___block_invoke_4;
  v19[3] = &unk_1E6F4C820;
  v20 = v8;
  v21 = v13;
  v16 = v13;
  v17 = v8;
  v18 = (id)objc_msgSend(v14, "addCompletionBlock:", v19);
  -[HUUserTableViewController performRemovalAction:](self, "performRemovalAction:", v14);

}

uint64_t __68__HUEditOutgoingInvitationViewController__cancelOutgoingInvitation___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelInviteWithCompletionHandler:", a2);
}

id __68__HUEditOutgoingInvitationViewController__cancelOutgoingInvitation___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0D519C0];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__HUEditOutgoingInvitationViewController__cancelOutgoingInvitation___block_invoke_3;
  v5[3] = &unk_1E6F54590;
  v6 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v2, "futureWithCompletionHandlerAdapterBlock:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __68__HUEditOutgoingInvitationViewController__cancelOutgoingInvitation___block_invoke_3(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0CBA948];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithUser:administrator:remoteAccess:", *(_QWORD *)(a1 + 32), 0, 1);
  v6 = *(void **)(a1 + 40);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "inviteUsersWithInviteInformation:completionHandler:", v7, v4);

}

void __68__HUEditOutgoingInvitationViewController__cancelOutgoingInvitation___block_invoke_4(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __68__HUEditOutgoingInvitationViewController__cancelOutgoingInvitation___block_invoke_5;
  v3[3] = &unk_1E6F4F418;
  v4 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "dispatchHomeObserverMessage:sender:", v3, 0);

}

void __68__HUEditOutgoingInvitationViewController__cancelOutgoingInvitation___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v6[0] = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "home:didUpdateStateForOutgoingInvitations:", v4, v5);

  }
}

- (id)_messageForInvitationState:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v26;

  -[HUEditOutgoingInvitationViewController user](self, "user");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  switch(a3)
  {
    case 1:
    case 6:
      HULocalizedStringWithFormat(CFSTR("HUUserOutgoingInvitationFailedMessage"), CFSTR("%@"), v7, v8, v9, v10, v11, v12, (uint64_t)v6);
      goto LABEL_7;
    case 2:
    case 7:
      HULocalizedStringWithFormat(CFSTR("HUUserOutgoingInvitationPendingMessage"), CFSTR("%@"), v7, v8, v9, v10, v11, v12, (uint64_t)v6);
      goto LABEL_7;
    case 3:
    case 5:
      -[HUItemTableViewController itemManager](self, "itemManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "home");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "name");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      HULocalizedStringWithFormat(CFSTR("HUUserOutgoingInvitationAcceptedMessage"), CFSTR("%@%@"), v15, v16, v17, v18, v19, v20, (uint64_t)v6);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    case 4:
      HULocalizedStringWithFormat(CFSTR("HUUserOutgoingInvitationDeclinedMessage"), CFSTR("%@"), v7, v8, v9, v10, v11, v12, (uint64_t)v6);
LABEL_7:
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v21 = 0;
      break;
  }
  v22 = objc_alloc(MEMORY[0x1E0CB3498]);
  HUPriorityMessageDefaultAttributedStringAttributes();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v22, "initWithString:attributes:", v21, v23);

  return v24;
}

- (HUEditOutgoingInvitationItemManager)editOutgoingInvitationItemManager
{
  return self->_editOutgoingInvitationItemManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editOutgoingInvitationItemManager, 0);
}

@end
