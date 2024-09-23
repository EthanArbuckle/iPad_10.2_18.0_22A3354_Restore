@implementation _CNUIUserActionUserActivityItem

- (_CNUIUserActionUserActivityItem)initWithType:(id)a3 contactProperty:(id)a4 bundleIdentifier:(id)a5 userActivity:(id)a6 group:(int64_t)a7 options:(unint64_t)a8
{
  id v15;
  _CNUIUserActionUserActivityItem *v16;
  _CNUIUserActionUserActivityItem *v17;
  _CNUIUserActionUserActivityItem *v18;
  objc_super v20;

  v15 = a6;
  v20.receiver = self;
  v20.super_class = (Class)_CNUIUserActionUserActivityItem;
  v16 = -[CNUIUserActionItem initWithType:contactProperty:bundleIdentifier:group:options:](&v20, sel_initWithType_contactProperty_bundleIdentifier_group_options_, a3, a4, a5, a7, a8);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_userActivity, a6);
    v18 = v17;
  }

  return v17;
}

- (id)performActionWithContext:(id)a3
{
  id v4;
  _CNUIUserActionUserActivityItem *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  _CNUIUserActionUserActivityItem *v16;

  v4 = a3;
  v5 = self;
  -[_CNUIUserActionUserActivityItem userActivity](v5, "userActivity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIUserActionItem bundleIdentifier](v5, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CNUIUserActionItem shouldCurateIfPerformed](v5, "shouldCurateIfPerformed"))
  {
    objc_msgSend(v4, "actionCurator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "curateUserAction:", v5);
    v9 = objc_claimAutoreleasedReturnValue();

    v5 = (_CNUIUserActionUserActivityItem *)v9;
  }
  objc_msgSend(v4, "userActivityOpener");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D13B68], "globalAsyncScheduler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "openUserActivity:usingBundleIdentifier:withScheduler:", v6, v7, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __60___CNUIUserActionUserActivityItem_performActionWithContext___block_invoke;
    v14[3] = &unk_1EA6037E8;
    v15 = v4;
    v16 = v5;
    objc_msgSend(v12, "addSuccessBlock:", v14);

  }
  return v12;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIUserActionItem type](self, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("type"));

  -[CNUIUserActionItem label](self, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("label"));

  -[CNUIUserActionItem targetHandle](self, "targetHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendObject:withName:", v8, CFSTR("targetHandle"));

  -[CNUIUserActionItem bundleIdentifier](self, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v3, "appendObject:withName:", v10, CFSTR("bundleIdentifier"));

  -[_CNUIUserActionUserActivityItem userActivity](self, "userActivity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v3, "appendObject:withName:", v12, CFSTR("userActivity"));

  v14 = (id)objc_msgSend(v3, "appendName:integerValue:", CFSTR("group"), -[CNUIUserActionItem group](self, "group"));
  v15 = (id)objc_msgSend(v3, "appendName:unsignedInteger:", CFSTR("options"), -[CNUIUserActionItem options](self, "options"));
  objc_msgSend(v3, "build");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  id v26;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D13A40];
  v6 = objc_opt_class();
  v7 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __43___CNUIUserActionUserActivityItem_isEqual___block_invoke;
  v25[3] = &unk_1EA603108;
  v25[4] = self;
  v26 = v4;
  v23[0] = v7;
  v23[1] = 3221225472;
  v23[2] = __43___CNUIUserActionUserActivityItem_isEqual___block_invoke_2;
  v23[3] = &unk_1EA603108;
  v23[4] = self;
  v8 = v26;
  v24 = v8;
  v9 = (void *)MEMORY[0x1DF0D6388](v23);
  v21[0] = v7;
  v21[1] = 3221225472;
  v21[2] = __43___CNUIUserActionUserActivityItem_isEqual___block_invoke_3;
  v21[3] = &unk_1EA603108;
  v21[4] = self;
  v10 = v8;
  v22 = v10;
  v11 = (void *)MEMORY[0x1DF0D6388](v21);
  v19[0] = v7;
  v19[1] = 3221225472;
  v19[2] = __43___CNUIUserActionUserActivityItem_isEqual___block_invoke_4;
  v19[3] = &unk_1EA603108;
  v19[4] = self;
  v12 = v10;
  v20 = v12;
  v13 = (void *)MEMORY[0x1DF0D6388](v19);
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = __43___CNUIUserActionUserActivityItem_isEqual___block_invoke_5;
  v17[3] = &unk_1EA603108;
  v17[4] = self;
  v18 = v12;
  v14 = v12;
  v15 = (void *)MEMORY[0x1DF0D6388](v17);
  LOBYTE(self) = objc_msgSend(v5, "isObject:kindOfClass:andEqualToObject:withBlocks:", v14, v6, self, v25, v9, v11, v13, v15, 0);

  return (char)self;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];

  v3 = (void *)MEMORY[0x1E0D13A78];
  v4 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __39___CNUIUserActionUserActivityItem_hash__block_invoke;
  v15[3] = &unk_1EA603130;
  v15[4] = self;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __39___CNUIUserActionUserActivityItem_hash__block_invoke_2;
  v14[3] = &unk_1EA603130;
  v14[4] = self;
  v5 = (void *)MEMORY[0x1DF0D6388](v14, a2);
  v13[0] = v4;
  v13[1] = 3221225472;
  v13[2] = __39___CNUIUserActionUserActivityItem_hash__block_invoke_3;
  v13[3] = &unk_1EA603130;
  v13[4] = self;
  v6 = (void *)MEMORY[0x1DF0D6388](v13);
  v12[0] = v4;
  v12[1] = 3221225472;
  v12[2] = __39___CNUIUserActionUserActivityItem_hash__block_invoke_4;
  v12[3] = &unk_1EA603130;
  v12[4] = self;
  v7 = (void *)MEMORY[0x1DF0D6388](v12);
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __39___CNUIUserActionUserActivityItem_hash__block_invoke_5;
  v11[3] = &unk_1EA603130;
  v11[4] = self;
  v8 = (void *)MEMORY[0x1DF0D6388](v11);
  v9 = objc_msgSend(v3, "hashWithBlocks:", v15, v5, v6, v7, v8, 0);

  return v9;
}

- (BOOL)_isIntent:(id)a3 equalToOther:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  char v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[_CNUIUserActionUserActivityItem _personFromIntent:](self, "_personFromIntent:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CNUIUserActionUserActivityItem _personFromIntent:](self, "_personFromIntent:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0D13A40];
    v11 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __58___CNUIUserActionUserActivityItem__isIntent_equalToOther___block_invoke;
    v23[3] = &unk_1EA603108;
    v24 = v8;
    v25 = v9;
    v17 = v11;
    v18 = 3221225472;
    v19 = __58___CNUIUserActionUserActivityItem__isIntent_equalToOther___block_invoke_2;
    v20 = &unk_1EA603108;
    v21 = v24;
    v22 = v25;
    v12 = v25;
    v13 = v24;
    v14 = (void *)MEMORY[0x1DF0D6388](&v17);
    v15 = objc_msgSend(v10, "isObject:equalToOther:withBlocks:", v13, v12, v23, v14, 0, v17, v18, v19, v20);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (unint64_t)_hashForIntent:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  unint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  -[_CNUIUserActionUserActivityItem _personFromIntent:](self, "_personFromIntent:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D13A78];
  v5 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __50___CNUIUserActionUserActivityItem__hashForIntent___block_invoke;
  v15[3] = &unk_1EA603130;
  v16 = v3;
  v10 = v5;
  v11 = 3221225472;
  v12 = __50___CNUIUserActionUserActivityItem__hashForIntent___block_invoke_2;
  v13 = &unk_1EA603130;
  v14 = v16;
  v6 = v16;
  v7 = (void *)MEMORY[0x1DF0D6388](&v10);
  v8 = objc_msgSend(v4, "hashWithBlocks:", v15, v7, 0, v10, v11, v12, v13);

  return v8;
}

- (id)_personFromIntent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v3, "contacts");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = 0;
      goto LABEL_6;
    }
    objc_msgSend(v3, "recipients");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  objc_msgSend(v4, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v6;
}

- (NSUserActivity)userActivity
{
  return self->_userActivity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userActivity, 0);
}

@end
