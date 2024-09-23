@implementation _CNUIUserActionURLItem

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
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  _CNUIUserActionURLItem *v19;
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
  v25[2] = __34___CNUIUserActionURLItem_isEqual___block_invoke;
  v25[3] = &unk_1EA603108;
  v25[4] = self;
  v26 = v4;
  v23[0] = v7;
  v23[1] = 3221225472;
  v23[2] = __34___CNUIUserActionURLItem_isEqual___block_invoke_2;
  v23[3] = &unk_1EA603108;
  v23[4] = self;
  v8 = v26;
  v24 = v8;
  v9 = (void *)MEMORY[0x1DF0D6388](v23);
  v21[0] = v7;
  v21[1] = 3221225472;
  v21[2] = __34___CNUIUserActionURLItem_isEqual___block_invoke_3;
  v21[3] = &unk_1EA603108;
  v21[4] = self;
  v10 = v8;
  v22 = v10;
  v11 = (void *)MEMORY[0x1DF0D6388](v21);
  v15 = v7;
  v16 = 3221225472;
  v17 = __34___CNUIUserActionURLItem_isEqual___block_invoke_4;
  v18 = &unk_1EA603108;
  v19 = self;
  v20 = v10;
  v12 = v10;
  v13 = (void *)MEMORY[0x1DF0D6388](&v15);
  LOBYTE(self) = objc_msgSend(v5, "isObject:kindOfClass:andEqualToObject:withBlocks:", v12, v6, self, v25, v9, v11, v13, 0, v15, v16, v17, v18, v19);

  return (char)self;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];

  v3 = (void *)MEMORY[0x1E0D13A78];
  v4 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __30___CNUIUserActionURLItem_hash__block_invoke;
  v13[3] = &unk_1EA603130;
  v13[4] = self;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __30___CNUIUserActionURLItem_hash__block_invoke_2;
  v12[3] = &unk_1EA603130;
  v12[4] = self;
  v5 = (void *)MEMORY[0x1DF0D6388](v12, a2);
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __30___CNUIUserActionURLItem_hash__block_invoke_3;
  v11[3] = &unk_1EA603130;
  v11[4] = self;
  v6 = (void *)MEMORY[0x1DF0D6388](v11);
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __30___CNUIUserActionURLItem_hash__block_invoke_4;
  v10[3] = &unk_1EA603130;
  v10[4] = self;
  v7 = (void *)MEMORY[0x1DF0D6388](v10);
  v8 = objc_msgSend(v3, "hashWithBlocks:", v13, v5, v6, v7, 0);

  return v8;
}

- (_CNUIUserActionURLItem)initWithType:(id)a3 contactProperty:(id)a4 bundleIdentifier:(id)a5 url:(id)a6 group:(int64_t)a7 options:(unint64_t)a8
{
  return -[_CNUIUserActionURLItem initWithType:contactProperty:bundleIdentifier:url:isSensitive:group:options:](self, "initWithType:contactProperty:bundleIdentifier:url:isSensitive:group:options:", a3, a4, a5, a6, 0, a7, a8);
}

- (_CNUIUserActionURLItem)initWithType:(id)a3 contactProperty:(id)a4 bundleIdentifier:(id)a5 url:(id)a6 isSensitive:(BOOL)a7 group:(int64_t)a8 options:(unint64_t)a9
{
  id v16;
  _CNUIUserActionURLItem *v17;
  _CNUIUserActionURLItem *v18;
  _CNUIUserActionURLItem *v19;
  objc_super v21;

  v16 = a6;
  v21.receiver = self;
  v21.super_class = (Class)_CNUIUserActionURLItem;
  v17 = -[CNUIUserActionItem initWithType:contactProperty:bundleIdentifier:group:options:](&v21, sel_initWithType_contactProperty_bundleIdentifier_group_options_, a3, a4, a5, a8, a9);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_url, a6);
    v18->_isSensitive = a7;
    v19 = v18;
  }

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

- (id)performActionWithContext:(id)a3
{
  return -[_CNUIUserActionURLItem performActionWithContext:shouldCurateIfPerformed:](self, "performActionWithContext:shouldCurateIfPerformed:", a3, 1);
}

- (id)performActionWithContext:(id)a3 shouldCurateIfPerformed:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  _CNUIUserActionURLItem *v18;
  _QWORD v19[4];
  id v20;
  _CNUIUserActionURLItem *v21;

  v4 = a4;
  v6 = a3;
  -[_CNUIUserActionURLItem url](self, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0D13A68];
    +[CNContactsUIError errorWithCode:](CNContactsUIError, "errorWithCode:", 201);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "futureWithError:", v11);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  v12 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __75___CNUIUserActionURLItem_performActionWithContext_shouldCurateIfPerformed___block_invoke;
  v19[3] = &unk_1EA6037C0;
  v13 = v6;
  v20 = v13;
  v21 = self;
  objc_msgSend(v9, "flatMap:", v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v16[0] = v12;
    v16[1] = 3221225472;
    v16[2] = __75___CNUIUserActionURLItem_performActionWithContext_shouldCurateIfPerformed___block_invoke_3;
    v16[3] = &unk_1EA6037E8;
    v17 = v13;
    v18 = self;
    objc_msgSend(v14, "addSuccessBlock:", v16);

  }
  return v14;
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
  id v16;
  void *v17;

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

  -[_CNUIUserActionURLItem url](self, "url");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v3, "appendObject:withName:", v12, CFSTR("url"));

  v14 = (id)objc_msgSend(v3, "appendName:BOOLValue:", CFSTR("isSensitive"), -[_CNUIUserActionURLItem isSensitive](self, "isSensitive"));
  v15 = (id)objc_msgSend(v3, "appendName:integerValue:", CFSTR("group"), -[CNUIUserActionItem group](self, "group"));
  v16 = (id)objc_msgSend(v3, "appendName:unsignedInteger:", CFSTR("options"), -[CNUIUserActionItem options](self, "options"));
  objc_msgSend(v3, "build");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (CNFuture)url
{
  return self->_url;
}

- (BOOL)isSensitive
{
  return self->_isSensitive;
}

@end
