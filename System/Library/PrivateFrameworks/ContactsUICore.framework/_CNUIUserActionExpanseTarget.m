@implementation _CNUIUserActionExpanseTarget

- (_CNUIUserActionExpanseTarget)init
{
  uint64_t v2;
  objc_super v4;

  v2 = *MEMORY[0x1E0C965C0];
  v4.receiver = self;
  v4.super_class = (Class)_CNUIUserActionExpanseTarget;
  return -[CNUIUserActionTarget initWithName:bundleIdentifier:teamIdentifier:](&v4, sel_initWithName_bundleIdentifier_teamIdentifier_, CFSTR("Expanse"), v2, 0);
}

- (id)actionsForContact:(id)a3 discoveringEnvironment:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "idsContactPropertyResolver");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "highLatencySchedulerProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "resolveBestExpanseIDSPropertyForContact:schedulerProvider:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __73___CNUIUserActionExpanseTarget_actionsForContact_discoveringEnvironment___block_invoke;
  v14[3] = &unk_1EA603CD8;
  v14[4] = self;
  objc_msgSend(v10, "map:", v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "startWith:", &unk_1EA61C688);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
