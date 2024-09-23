@implementation CNUICoreContactScratchpad

+ (CNUICoreContactScratchpad)emptyScratchpad
{
  return objc_alloc_init(CNUICoreContactScratchpad);
}

- (CNUICoreContactScratchpad)init
{
  void *v3;
  CNUICoreContactScratchpad *v4;

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CNUICoreContactScratchpad initWithEdits:](self, "initWithEdits:", v3);

  return v4;
}

- (CNUICoreContactScratchpad)initWithEdits:(id)a3
{
  id v5;
  CNUICoreContactScratchpad *v6;
  CNUICoreContactScratchpad *v7;
  CNUICoreContactScratchpad *v8;
  objc_super v10;

  v5 = a3;
  if (!v5)
  {
    if (CNGuardOSLog_cn_once_token_0_4 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_4, &__block_literal_global_48);
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_4, OS_LOG_TYPE_FAULT))
      -[CNUICoreContactScratchpad initWithEdits:].cold.1();
  }
  v10.receiver = self;
  v10.super_class = (Class)CNUICoreContactScratchpad;
  v6 = -[CNUICoreContactScratchpad init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_edits, a3);
    v8 = v7;
  }

  return v7;
}

- (id)scratchpadByAddingContacts:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[5];

  v4 = a3;
  if (!v4)
  {
    if (CNGuardOSLog_cn_once_token_0_4 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_4, &__block_literal_global_48);
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_4, OS_LOG_TYPE_FAULT))
      -[CNUICoreContactScratchpad scratchpadByAddingContacts:].cold.1();
  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__CNUICoreContactScratchpad_scratchpadByAddingContacts___block_invoke;
  v7[3] = &unk_1EA603B80;
  v7[4] = self;
  objc_msgSend(v4, "_cn_reduce:initialValue:", v7, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __56__CNUICoreContactScratchpad_scratchpadByAddingContacts___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  int v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = a2;
  v6 = objc_msgSend(v5, "containsContact:", v4);
  v7 = (void *)objc_opt_class();
  if (v6)
    objc_msgSend(v7, "scratchpadBySettingModifiedContact:onExistingEditInScratchpad:", v4, v5);
  else
    objc_msgSend(v7, "scratchpadByAddingUneditedContact:toScratchpad:", v4, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)scratchpadByRemovingContacts:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[5];

  v4 = a3;
  if (!v4)
  {
    if (CNGuardOSLog_cn_once_token_0_4 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_4, &__block_literal_global_48);
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_4, OS_LOG_TYPE_FAULT))
      -[CNUICoreContactScratchpad scratchpadByRemovingContacts:].cold.1();
  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__CNUICoreContactScratchpad_scratchpadByRemovingContacts___block_invoke;
  v7[3] = &unk_1EA603B80;
  v7[4] = self;
  objc_msgSend(v4, "_cn_reduce:initialValue:", v7, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __58__CNUICoreContactScratchpad_scratchpadByRemovingContacts___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;

  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(v5, "containsContact:", v6) & 1) != 0)
  {
    objc_msgSend((id)objc_opt_class(), "scratchpadByRemovingModifiedContact:fromScratchpad:", v6, v5);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = *(id *)(a1 + 32);
  }
  v8 = v7;

  return v8;
}

- (id)scratchpadByKeepingContacts:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  if (!v4)
  {
    if (CNGuardOSLog_cn_once_token_0_4 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_4, &__block_literal_global_48);
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_4, OS_LOG_TYPE_FAULT))
      -[CNUICoreContactScratchpad scratchpadByKeepingContacts:].cold.1();
  }
  objc_msgSend(v4, "_cn_map:", &__block_literal_global_11_0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUICoreContactScratchpad allContacts](self, "allContacts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __57__CNUICoreContactScratchpad_scratchpadByKeepingContacts___block_invoke;
  v13[3] = &unk_1EA603568;
  v14 = v5;
  v8 = v5;
  objc_msgSend(v7, "_cn_filter:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNUICoreContactScratchpad scratchpadByRemovingContacts:](self, "scratchpadByRemovingContacts:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scratchpadByAddingContacts:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __57__CNUICoreContactScratchpad_scratchpadByKeepingContacts___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3) ^ 1;

  return v4;
}

- (id)modifiedContactForContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[CNUICoreContactScratchpad edits](self, "edits");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "editMatchingContact:inEdits:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && objc_msgSend(v7, "originalAndModifiedDiffer"))
  {
    objc_msgSend(v7, "modified");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)modifiedIfPresentOtherwiseOriginalContactForContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[CNUICoreContactScratchpad edits](self, "edits");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "editMatchingContact:inEdits:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "modified");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      objc_msgSend(v7, "modified");
    else
      objc_msgSend(v7, "original");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)containsContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[CNUICoreContactScratchpad edits](self, "edits");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "editMatchingContact:inEdits:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7 != 0;
}

- (NSSet)modifiedContacts
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[CNUICoreContactScratchpad edits](self, "edits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__CNUICoreContactScratchpad_modifiedContacts__block_invoke;
  v7[3] = &unk_1EA603BA8;
  v7[4] = self;
  objc_msgSend(v3, "_cn_map:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_cn_filter:", *MEMORY[0x1E0D13830]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v5;
}

id __45__CNUICoreContactScratchpad_modifiedContacts__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "original");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modifiedContactForContact:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSSet)allContacts
{
  void *v2;
  void *v3;

  -[CNUICoreContactScratchpad edits](self, "edits");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_cn_map:", &__block_literal_global_21);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

uint64_t __40__CNUICoreContactScratchpad_allContacts__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "modified");
}

- (BOOL)isEqual:(id)a3
{
  CNUICoreContactScratchpad *v4;
  unint64_t v5;
  unint64_t v6;
  BOOL v7;

  v4 = (CNUICoreContactScratchpad *)a3;
  v7 = 1;
  if (self != v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (v5 = (unint64_t)-[CNUICoreContactScratchpad edits](self, "edits"),
          v6 = (unint64_t)-[CNUICoreContactScratchpad edits](v4, "edits"),
          v5 | v6)
      && !objc_msgSend((id)v5, "isEqual:", v6))
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  void *v3;
  unint64_t v4;

  v2 = (void *)MEMORY[0x1E0D13A78];
  -[CNUICoreContactScratchpad edits](self, "edits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "setHash:", v3) + 527;

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUICoreContactScratchpad edits](self, "edits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("edits"));

  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)scratchpadByAddingUneditedContact:(id)a3 toScratchpad:(id)a4
{
  id v5;
  id v6;
  CNUICoreContactEdit *v7;
  void *v8;
  void *v9;
  CNUICoreContactScratchpad *v10;

  v5 = a4;
  v6 = a3;
  v7 = -[CNUICoreContactEdit initWithContact:]([CNUICoreContactEdit alloc], "initWithContact:", v6);

  objc_msgSend(v5, "edits");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setByAddingObject:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[CNUICoreContactScratchpad initWithEdits:]([CNUICoreContactScratchpad alloc], "initWithEdits:", v9);
  return v10;
}

+ (id)scratchpadBySettingModifiedContact:(id)a3 onExistingEditInScratchpad:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CNUICoreContactScratchpad *v14;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "edits");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "editMatchingContact:inEdits:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "editBySettingModifiedContact:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_opt_class();
  objc_msgSend(v6, "edits");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "editsByReplacingEdit:withUpdatedEdit:inEdits:", v9, v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[CNUICoreContactScratchpad initWithEdits:]([CNUICoreContactScratchpad alloc], "initWithEdits:", v13);
  return v14;
}

+ (id)editMatchingContact:(id)a3 inEdits:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__CNUICoreContactScratchpad_editMatchingContact_inEdits___block_invoke;
  v9[3] = &unk_1EA603BF0;
  v10 = v5;
  v6 = v5;
  objc_msgSend(a4, "_cn_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __57__CNUICoreContactScratchpad_editMatchingContact_inEdits___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "modifiesContact:", *(_QWORD *)(a1 + 32));
}

+ (id)editsByReplacingEdit:(id)a3 withUpdatedEdit:(id)a4 inEdits:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  id (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  id v19;

  v7 = a3;
  v8 = a4;
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __74__CNUICoreContactScratchpad_editsByReplacingEdit_withUpdatedEdit_inEdits___block_invoke;
  v17 = &unk_1EA603C18;
  v18 = v7;
  v19 = v8;
  v9 = v8;
  v10 = v7;
  objc_msgSend(a5, "_cn_map:", &v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_cn_filter:", *MEMORY[0x1E0D13830], v14, v15, v16, v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __74__CNUICoreContactScratchpad_editsByReplacingEdit_withUpdatedEdit_inEdits___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  int v5;
  void *v6;
  id v7;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  v5 = objc_msgSend(v4, "isEqual:", v3);
  v6 = v4;
  if (v5)
    v6 = *(void **)(a1 + 40);
  v7 = v6;

  return v7;
}

+ (id)scratchpadByRemovingModifiedContact:(id)a3 fromScratchpad:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CNUICoreContactScratchpad *v13;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "edits");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "editMatchingContact:inEdits:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_opt_class();
  objc_msgSend(v6, "edits");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "editsByReplacingEdit:withUpdatedEdit:inEdits:", v9, 0, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[CNUICoreContactScratchpad initWithEdits:]([CNUICoreContactScratchpad alloc], "initWithEdits:", v12);
  return v13;
}

- (NSSet)edits
{
  return self->_edits;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_edits, 0);
}

- (void)initWithEdits:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1DD140000, v0, v1, "parameter ‘edits’ must be nonnull", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)scratchpadByAddingContacts:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1DD140000, v0, v1, "parameter ‘contactsToAdd’ must be nonnull", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)scratchpadByRemovingContacts:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1DD140000, v0, v1, "parameter ‘contactsToRemove’ must be nonnull", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)scratchpadByKeepingContacts:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1DD140000, v0, v1, "parameter ‘contactsToKeep’ must be nonnull", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
