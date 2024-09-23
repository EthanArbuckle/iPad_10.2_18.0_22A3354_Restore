@implementation _CNUIUserActionMessagesTextTarget

- (id)actionsForPhoneNumbers:(id)a3 contact:(id)a4 discoveringEnvironment:(id)a5
{
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  _CNUIUserActionMessagesTextTarget *v13;

  v7 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __91___CNUIUserActionMessagesTextTarget_actionsForPhoneNumbers_contact_discoveringEnvironment___block_invoke;
  v11[3] = &unk_1EA603158;
  v12 = v7;
  v13 = self;
  v8 = v7;
  objc_msgSend(a3, "_cn_map:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)actionsForEmailAddresses:(id)a3 contact:(id)a4 discoveringEnvironment:(id)a5
{
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  _CNUIUserActionMessagesTextTarget *v13;

  v7 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __93___CNUIUserActionMessagesTextTarget_actionsForEmailAddresses_contact_discoveringEnvironment___block_invoke;
  v11[3] = &unk_1EA603158;
  v12 = v7;
  v13 = self;
  v8 = v7;
  objc_msgSend(a3, "_cn_map:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (_CNUIUserActionMessagesTextTarget)init
{
  uint64_t v2;
  objc_super v4;

  v2 = *MEMORY[0x1E0C965E0];
  v4.receiver = self;
  v4.super_class = (Class)_CNUIUserActionMessagesTextTarget;
  return -[CNUIUserActionTarget initWithName:bundleIdentifier:teamIdentifier:](&v4, sel_initWithName_bundleIdentifier_teamIdentifier_, CFSTR("Messages"), v2, 0);
}

@end
