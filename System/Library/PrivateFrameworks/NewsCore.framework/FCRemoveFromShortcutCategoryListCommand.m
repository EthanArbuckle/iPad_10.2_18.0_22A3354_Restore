@implementation FCRemoveFromShortcutCategoryListCommand

- (FCRemoveFromShortcutCategoryListCommand)initWithShortcutCategories:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  FCRemoveFromShortcutCategoryListCommand *v13;
  _QWORD v15[4];
  id v16;

  v4 = (objc_class *)MEMORY[0x1E0C95098];
  v5 = a3;
  v6 = [v4 alloc];
  v7 = (void *)objc_msgSend(v6, "initWithZoneName:ownerName:", CFSTR("ShortcutCategories"), *MEMORY[0x1E0C94730]);
  objc_msgSend(v5, "fc_arrayByTransformingWithBlock:", &__block_literal_global_39);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __70__FCRemoveFromShortcutCategoryListCommand_initWithShortcutCategories___block_invoke_2;
  v15[3] = &unk_1E463C7F0;
  v16 = v7;
  v9 = v7;
  objc_msgSend(v8, "fc_arrayByTransformingWithBlock:", v15);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = v10;
  else
    v12 = MEMORY[0x1E0C9AA60];
  v13 = -[FCRemoveRecordsCommand initWithRecordIDs:](self, "initWithRecordIDs:", v12);

  return v13;
}

uint64_t __70__FCRemoveFromShortcutCategoryListCommand_initWithShortcutCategories___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

id __70__FCRemoveFromShortcutCategoryListCommand_initWithShortcutCategories___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0C95070];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithRecordName:zoneID:", v4, *(_QWORD *)(a1 + 32));

  return v5;
}

@end
