@implementation _CNUIUserActionFaceTimeVideoTarget

- (id)actionsForContact:(id)a3 discoveringEnvironment:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  id (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  _CNUIUserActionFaceTimeVideoTarget *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "idsContactPropertyResolver");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "highLatencySchedulerProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "resolveAllFaceTimeIDSPropertiesForContact:schedulerProvider:", v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __79___CNUIUserActionFaceTimeVideoTarget_actionsForContact_discoveringEnvironment___block_invoke;
  v21 = &unk_1EA604170;
  v22 = v6;
  v23 = self;
  v11 = v6;
  objc_msgSend(v10, "map:", &v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allObjects:", 0, v18, v19, v20, v21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0D13AE8];
  v24[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "observableWithResults:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (_CNUIUserActionFaceTimeVideoTarget)init
{
  uint64_t v2;
  objc_super v4;

  v2 = *MEMORY[0x1E0C965C0];
  v4.receiver = self;
  v4.super_class = (Class)_CNUIUserActionFaceTimeVideoTarget;
  return -[CNUIUserActionTarget initWithName:bundleIdentifier:teamIdentifier:](&v4, sel_initWithName_bundleIdentifier_teamIdentifier_, CFSTR("FaceTime"), v2, 0);
}

@end
