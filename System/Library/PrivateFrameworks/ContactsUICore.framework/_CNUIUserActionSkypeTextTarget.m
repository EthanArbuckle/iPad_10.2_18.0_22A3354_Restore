@implementation _CNUIUserActionSkypeTextTarget

- (_CNUIUserActionSkypeTextTarget)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_CNUIUserActionSkypeTextTarget;
  return -[CNUIUserActionTarget initWithName:bundleIdentifier:teamIdentifier:](&v3, sel_initWithName_bundleIdentifier_teamIdentifier_, CFSTR("Skype"), CFSTR("com.skype.skype"), 0);
}

- (id)actionsForEmailAddresses:(id)a3 contact:(id)a4 discoveringEnvironment:(id)a5
{
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  _CNUIUserActionSkypeTextTarget *v13;

  v7 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __90___CNUIUserActionSkypeTextTarget_actionsForEmailAddresses_contact_discoveringEnvironment___block_invoke;
  v11[3] = &unk_1EA603158;
  v12 = v7;
  v13 = self;
  v8 = v7;
  objc_msgSend(a3, "_cn_map:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)actionsForPhoneNumbers:(id)a3 contact:(id)a4 discoveringEnvironment:(id)a5
{
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  _CNUIUserActionSkypeTextTarget *v13;

  v7 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __88___CNUIUserActionSkypeTextTarget_actionsForPhoneNumbers_contact_discoveringEnvironment___block_invoke;
  v11[3] = &unk_1EA603158;
  v12 = v7;
  v13 = self;
  v8 = v7;
  objc_msgSend(a3, "_cn_map:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
