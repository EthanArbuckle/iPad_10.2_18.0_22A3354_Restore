@implementation SFViewSharedAccountsGroupInvitationButtonItem

- (SFViewSharedAccountsGroupInvitationButtonItem)initWithGroup:(id)a3
{
  id v5;
  SFViewSharedAccountsGroupInvitationButtonItem *v6;
  SFViewSharedAccountsGroupInvitationButtonItem *v7;
  SFViewSharedAccountsGroupInvitationButtonItem *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFViewSharedAccountsGroupInvitationButtonItem;
  v6 = -[SFViewSharedAccountsGroupInvitationButtonItem init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_group, a3);
    v8 = v7;
  }

  return v7;
}

- (KCSharingGroup)group
{
  return self->_group;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);
}

@end
