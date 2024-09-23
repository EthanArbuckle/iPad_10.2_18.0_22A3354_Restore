@implementation _CNUIUserActionDialRequestItem

- (_CNUIUserActionDialRequestItem)initWithType:(id)a3 contactProperty:(id)a4 bundleIdentifier:(id)a5 dialRequest:(id)a6 group:(int64_t)a7 options:(unint64_t)a8
{
  id v15;
  _CNUIUserActionDialRequestItem *v16;
  _CNUIUserActionDialRequestItem *v17;
  _CNUIUserActionDialRequestItem *v18;
  objc_super v20;

  v15 = a6;
  v20.receiver = self;
  v20.super_class = (Class)_CNUIUserActionDialRequestItem;
  v16 = -[CNUIUserActionItem initWithType:contactProperty:bundleIdentifier:group:options:](&v20, sel_initWithType_contactProperty_bundleIdentifier_group_options_, a3, a4, a5, a7, a8);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_dialRequest, a6);
    v18 = v17;
  }

  return v17;
}

- (id)performActionWithContext:(id)a3
{
  id v4;
  _CNUIUserActionDialRequestItem *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  _CNUIUserActionDialRequestItem *v20;

  v4 = a3;
  v5 = self;
  -[_CNUIUserActionDialRequestItem dialRequest](v5, "dialRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "provider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isTelephonyProvider"))
    {
      v8 = *MEMORY[0x1E0D13848];
      objc_msgSend(v4, "channelIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v8) = (*(uint64_t (**)(uint64_t, void *))(v8 + 16))(v8, v9);

      if ((v8 & 1) != 0)
        goto LABEL_6;
      v10 = objc_alloc(MEMORY[0x1E0CB3A28]);
      objc_msgSend(v4, "channelIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v10, "initWithUUIDString:", v7);
      objc_msgSend(v6, "setLocalSenderIdentityAccountUUID:", v11);

    }
  }
LABEL_6:
  if (-[CNUIUserActionItem shouldCurateIfPerformed](v5, "shouldCurateIfPerformed"))
  {
    objc_msgSend(v4, "actionCurator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "curateUserAction:", v5);
    v13 = objc_claimAutoreleasedReturnValue();

    v5 = (_CNUIUserActionDialRequestItem *)v13;
  }
  objc_msgSend(v4, "dialRequestOpener");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D13B68], "globalAsyncScheduler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "openDialRequest:withScheduler:", v6, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __59___CNUIUserActionDialRequestItem_performActionWithContext___block_invoke;
    v18[3] = &unk_1EA6037E8;
    v19 = v4;
    v20 = v5;
    objc_msgSend(v16, "addSuccessBlock:", v18);

  }
  return v16;
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

  -[_CNUIUserActionDialRequestItem dialRequest](self, "dialRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v3, "appendObject:withName:", v12, CFSTR("dialRequest"));

  v14 = (id)objc_msgSend(v3, "appendName:integerValue:", CFSTR("group"), -[CNUIUserActionItem group](self, "group"));
  v15 = (id)objc_msgSend(v3, "appendName:unsignedInteger:", CFSTR("options"), -[CNUIUserActionItem options](self, "options"));
  objc_msgSend(v3, "build");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[5];
  id v30;
  _QWORD v31[5];
  id v32;
  _QWORD v33[5];
  id v34;
  _QWORD v35[5];
  id v36;
  _QWORD v37[5];
  id v38;

  v4 = a3;
  v22 = (void *)MEMORY[0x1E0D13A40];
  v21 = objc_opt_class();
  v5 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __42___CNUIUserActionDialRequestItem_isEqual___block_invoke;
  v37[3] = &unk_1EA603108;
  v37[4] = self;
  v38 = v4;
  v35[0] = v5;
  v35[1] = 3221225472;
  v35[2] = __42___CNUIUserActionDialRequestItem_isEqual___block_invoke_2;
  v35[3] = &unk_1EA603108;
  v35[4] = self;
  v6 = v38;
  v36 = v6;
  v7 = (void *)MEMORY[0x1DF0D6388](v35);
  v33[0] = v5;
  v33[1] = 3221225472;
  v33[2] = __42___CNUIUserActionDialRequestItem_isEqual___block_invoke_3;
  v33[3] = &unk_1EA603108;
  v33[4] = self;
  v8 = v6;
  v34 = v8;
  v9 = (void *)MEMORY[0x1DF0D6388](v33);
  v31[0] = v5;
  v31[1] = 3221225472;
  v31[2] = __42___CNUIUserActionDialRequestItem_isEqual___block_invoke_4;
  v31[3] = &unk_1EA603108;
  v31[4] = self;
  v10 = v8;
  v32 = v10;
  v11 = (void *)MEMORY[0x1DF0D6388](v31);
  v29[0] = v5;
  v29[1] = 3221225472;
  v29[2] = __42___CNUIUserActionDialRequestItem_isEqual___block_invoke_5;
  v29[3] = &unk_1EA603108;
  v29[4] = self;
  v12 = v10;
  v30 = v12;
  v13 = (void *)MEMORY[0x1DF0D6388](v29);
  v27[0] = v5;
  v27[1] = 3221225472;
  v27[2] = __42___CNUIUserActionDialRequestItem_isEqual___block_invoke_6;
  v27[3] = &unk_1EA603108;
  v27[4] = self;
  v14 = v12;
  v28 = v14;
  v15 = (void *)MEMORY[0x1DF0D6388](v27);
  v25[0] = v5;
  v25[1] = 3221225472;
  v25[2] = __42___CNUIUserActionDialRequestItem_isEqual___block_invoke_7;
  v25[3] = &unk_1EA603108;
  v25[4] = self;
  v16 = v14;
  v26 = v16;
  v17 = (void *)MEMORY[0x1DF0D6388](v25);
  v23[0] = v5;
  v23[1] = 3221225472;
  v23[2] = __42___CNUIUserActionDialRequestItem_isEqual___block_invoke_8;
  v23[3] = &unk_1EA603108;
  v23[4] = self;
  v24 = v16;
  v18 = v16;
  v19 = (void *)MEMORY[0x1DF0D6388](v23);
  LOBYTE(self) = objc_msgSend(v22, "isObject:kindOfClass:andEqualToObject:withBlocks:", v18, v21, self, v37, v7, v9, v11, v13, v15, v17, v19, 0);

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
  void *v9;
  void *v10;
  unint64_t v11;
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];

  v3 = (void *)MEMORY[0x1E0D13A78];
  v4 = MEMORY[0x1E0C809B0];
  v18[4] = self;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __38___CNUIUserActionDialRequestItem_hash__block_invoke;
  v19[3] = &unk_1EA603130;
  v19[4] = self;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __38___CNUIUserActionDialRequestItem_hash__block_invoke_2;
  v18[3] = &unk_1EA603130;
  v5 = (void *)MEMORY[0x1DF0D6388](v18, a2);
  v17[0] = v4;
  v17[1] = 3221225472;
  v17[2] = __38___CNUIUserActionDialRequestItem_hash__block_invoke_3;
  v17[3] = &unk_1EA603130;
  v17[4] = self;
  v6 = (void *)MEMORY[0x1DF0D6388](v17);
  v16[0] = v4;
  v16[1] = 3221225472;
  v16[2] = __38___CNUIUserActionDialRequestItem_hash__block_invoke_4;
  v16[3] = &unk_1EA603130;
  v16[4] = self;
  v7 = (void *)MEMORY[0x1DF0D6388](v16);
  v15[0] = v4;
  v15[1] = 3221225472;
  v15[2] = __38___CNUIUserActionDialRequestItem_hash__block_invoke_5;
  v15[3] = &unk_1EA603130;
  v15[4] = self;
  v8 = (void *)MEMORY[0x1DF0D6388](v15);
  v14[0] = v4;
  v14[1] = 3221225472;
  v14[2] = __38___CNUIUserActionDialRequestItem_hash__block_invoke_6;
  v14[3] = &unk_1EA603130;
  v14[4] = self;
  v9 = (void *)MEMORY[0x1DF0D6388](v14);
  v13[0] = v4;
  v13[1] = 3221225472;
  v13[2] = __38___CNUIUserActionDialRequestItem_hash__block_invoke_7;
  v13[3] = &unk_1EA603130;
  v13[4] = self;
  v10 = (void *)MEMORY[0x1DF0D6388](v13);
  v11 = objc_msgSend(v3, "hashWithBlocks:", v19, v5, v6, v7, v8, v9, v10, 0);

  return v11;
}

- (CNTUDialRequest)dialRequest
{
  return self->_dialRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dialRequest, 0);
}

@end
