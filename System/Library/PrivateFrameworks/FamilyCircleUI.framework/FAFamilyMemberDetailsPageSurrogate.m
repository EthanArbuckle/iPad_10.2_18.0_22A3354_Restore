@implementation FAFamilyMemberDetailsPageSurrogate

- (FAFamilyMemberDetailsPageSurrogate)initWithPage:(id)a3 forPerson:(id)a4 account:(id)a5 store:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  FAFamilyMemberDetailsPageSurrogate *v14;
  uint64_t v15;
  AAUIProfilePictureStore *pictureStore;
  void *v17;
  uint64_t v18;
  UITableView *remoteTableView;
  uint64_t v20;
  UITableViewDelegate *remoteTableViewController;
  objc_super v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v23.receiver = self;
  v23.super_class = (Class)FAFamilyMemberDetailsPageSurrogate;
  v14 = -[FAFamilyMemberDetailsPageSurrogate init](&v23, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(objc_alloc(MEMORY[0x24BE04D48]), "initWithAppleAccount:store:", v12, v13);
    pictureStore = v14->_pictureStore;
    v14->_pictureStore = (AAUIProfilePictureStore *)v15;

    objc_storeStrong((id *)&v14->_familyMember, a4);
    objc_msgSend(v10, "tableViewOM");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "tableView");
    v18 = objc_claimAutoreleasedReturnValue();
    remoteTableView = v14->_remoteTableView;
    v14->_remoteTableView = (UITableView *)v18;

    objc_msgSend(v10, "tableViewOM");
    v20 = objc_claimAutoreleasedReturnValue();
    remoteTableViewController = v14->_remoteTableViewController;
    v14->_remoteTableViewController = (UITableViewDelegate *)v20;

    -[UITableView setDelegate:](v14->_remoteTableView, "setDelegate:", v14);
  }

  return v14;
}

- (void)dealloc
{
  UITableView *remoteTableView;
  objc_super v4;

  remoteTableView = self->_remoteTableView;
  if (remoteTableView)
    -[UITableView setDelegate:](remoteTableView, "setDelegate:", 0);
  v4.receiver = self;
  v4.super_class = (Class)FAFamilyMemberDetailsPageSurrogate;
  -[FAFamilyMemberDetailsPageSurrogate dealloc](&v4, sel_dealloc);
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  objc_msgSend(v4, "selector");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "invokeWithTarget:", self->_remoteTableViewController);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)FAFamilyMemberDetailsPageSurrogate;
    -[FAFamilyMemberDetailsPageSurrogate forwardInvocation:](&v5, sel_forwardInvocation_, v4);
  }

}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FAFamilyMemberDetailsPageSurrogate;
  -[FAFamilyMemberDetailsPageSurrogate methodSignatureForSelector:](&v7, sel_methodSignatureForSelector_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[UITableViewDelegate methodSignatureForSelector:](self->_remoteTableViewController, "methodSignatureForSelector:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  objc_super v6;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)FAFamilyMemberDetailsPageSurrogate;
  return -[FAFamilyMemberDetailsPageSurrogate respondsToSelector:](&v6, sel_respondsToSelector_, a3);
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  UITableView *v6;
  void *v7;
  int v8;
  AAUIProfilePictureStore *pictureStore;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;

  v6 = (UITableView *)a3;
  if (self->_remoteTableView == v6)
  {
    if (a4)
    {
      -[UITableViewDelegate tableView:viewForHeaderInSection:](self->_remoteTableViewController, "tableView:viewForHeaderInSection:", v6, a4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = -[FAFamilyMember isMe](self->_familyMember, "isMe");
      pictureStore = self->_pictureStore;
      if (v8)
        -[AAUIProfilePictureStore profilePictureForAccountOwner](pictureStore, "profilePictureForAccountOwner");
      else
        -[AAUIProfilePictureStore fa_profilePictureForFamilyMember:](pictureStore, "fa_profilePictureForFamilyMember:", self->_familyMember);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[FAFamilyMember fullName](self->_familyMember, "fullName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[FAFamilyMember appleID](self->_familyMember, "appleID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
      {
        v14 = v12;
      }
      else
      {
        -[FAFamilyMember inviteEmail](self->_familyMember, "inviteEmail");
        v14 = (id)objc_claimAutoreleasedReturnValue();
      }
      v15 = v14;

      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE04D50]), "initWithName:email:image:", v11, v15, v10);
      objc_msgSend(v7, "setTopPadding:", 8.0);

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  UITableView *v6;
  double v7;
  double v8;
  double v9;

  v6 = (UITableView *)a3;
  v7 = 0.0;
  if (self->_remoteTableView == v6)
  {
    if (a4)
    {
      -[UITableViewDelegate tableView:heightForHeaderInSection:](self->_remoteTableViewController, "tableView:heightForHeaderInSection:", v6, a4);
      v7 = v8;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE04D50], "desiredHeight");
      v7 = v9 + 8.0;
    }
  }

  return v7;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  UITableView *v6;
  double v7;
  double v8;
  void *v9;

  v6 = (UITableView *)a3;
  v7 = 0.0;
  if (self->_remoteTableView == v6)
  {
    if (a4)
    {
      -[UITableViewDelegate tableView:heightForFooterInSection:](self->_remoteTableViewController, "tableView:heightForFooterInSection:", v6, a4);
    }
    else
    {
      -[FAFamilyMemberDetailsPageSurrogate tableView:titleForFooterInSection:](self, "tableView:titleForFooterInSection:", v6, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v7 = *MEMORY[0x24BEBE770];
        goto LABEL_7;
      }
      UIRoundToViewScale();
    }
    v7 = v8;
  }
LABEL_7:

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pictureStore, 0);
  objc_storeStrong((id *)&self->_familyMember, 0);
  objc_storeStrong((id *)&self->_remoteTableView, 0);
  objc_storeStrong((id *)&self->_remoteTableViewController, 0);
}

@end
