@implementation HFOutgoingHomeInvitationItem

- (HFOutgoingHomeInvitationItem)initWithOutgoingInvitation:(id)a3
{
  id v5;
  HFOutgoingHomeInvitationItem *v6;
  HFOutgoingHomeInvitationItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFOutgoingHomeInvitationItem;
  v6 = -[HFOutgoingHomeInvitationItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_outgoingInvitation, a3);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HFOutgoingHomeInvitationItem *v4;
  void *v5;
  HFOutgoingHomeInvitationItem *v6;

  v4 = [HFOutgoingHomeInvitationItem alloc];
  -[HFOutgoingHomeInvitationItem outgoingInvitation](self, "outgoingInvitation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HFOutgoingHomeInvitationItem initWithOutgoingInvitation:](v4, "initWithOutgoingInvitation:", v5);

  return v6;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  HFMutableItemUpdateOutcome *v4;
  void *v5;
  void *v6;
  void *v7;
  HFUserHandle *v8;
  void *v9;
  void *v10;
  void *v11;
  HFUserHandle *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = objc_alloc_init(HFMutableItemUpdateOutcome);
  -[HFOutgoingHomeInvitationItem outgoingInvitation](self, "outgoingInvitation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invitee");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v7, CFSTR("title"));

  v8 = [HFUserHandle alloc];
  -[HFOutgoingHomeInvitationItem outgoingInvitation](self, "outgoingInvitation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "invitee");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "userID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HFUserHandle initWithType:userID:](v8, "initWithType:userID:", 1, v11);
  -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v12, CFSTR("userID"));

  v13 = (void *)MEMORY[0x1E0CB37E8];
  -[HFOutgoingHomeInvitationItem outgoingInvitation](self, "outgoingInvitation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "numberWithInteger:", objc_msgSend(v14, "invitationState"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v15, CFSTR("invitationState"));

  -[HFOutgoingHomeInvitationItem outgoingInvitation](self, "outgoingInvitation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  HFLocalizedStringFromHMHomeInvitationState(objc_msgSend(v16, "invitationState"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v17, CFSTR("description"));

  -[HFOutgoingHomeInvitationItem outgoingInvitation](self, "outgoingInvitation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  HFLocalizedStringFromHMHomeInvitationState(objc_msgSend(v18, "invitationState"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v19, CFSTR("userAccessDescription"));

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (HMOutgoingHomeInvitation)outgoingInvitation
{
  return self->_outgoingInvitation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outgoingInvitation, 0);
}

@end
