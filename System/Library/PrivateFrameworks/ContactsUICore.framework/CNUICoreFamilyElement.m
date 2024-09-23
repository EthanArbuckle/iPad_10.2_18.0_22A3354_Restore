@implementation CNUICoreFamilyElement

- (CNUICoreFamilyElement)initWithFamilyMember:(id)a3 matchingContacts:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  CNUICoreFamilyElement *v25;
  CNUICoreFamilyElement *v26;
  CNUICoreFamilyElement *v27;
  objc_super v29;

  v7 = a3;
  v8 = a4;
  if (v7)
    goto LABEL_5;
  if (CNGuardOSLog_cn_once_token_0_15 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_15, &__block_literal_global_51);
  v9 = CNGuardOSLog_cn_once_object_0_15;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_15, OS_LOG_TYPE_FAULT))
  {
    -[CNUICoreFamilyElement initWithFamilyMember:matchingContacts:].cold.2(v9, v10, v11, v12, v13, v14, v15, v16);
    if (v8)
      goto LABEL_10;
  }
  else
  {
LABEL_5:
    if (v8)
      goto LABEL_10;
  }
  if (CNGuardOSLog_cn_once_token_0_15 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_15, &__block_literal_global_51);
  v17 = CNGuardOSLog_cn_once_object_0_15;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_15, OS_LOG_TYPE_FAULT))
    -[CNUICoreFamilyElement initWithFamilyMember:matchingContacts:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);
LABEL_10:
  v29.receiver = self;
  v29.super_class = (Class)CNUICoreFamilyElement;
  v25 = -[CNUICoreFamilyElement init](&v29, sel_init);
  v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_familyMember, a3);
    objc_storeStrong((id *)&v26->_matchingContacts, a4);
    v27 = v26;
  }

  return v26;
}

- (BOOL)hasMatchingContacts
{
  uint64_t v2;
  void *v3;

  v2 = *MEMORY[0x1E0D137F8];
  -[CNUICoreFamilyElement matchingContacts](self, "matchingContacts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = (*(uint64_t (**)(uint64_t, void *))(v2 + 16))(v2, v3) ^ 1;

  return v2;
}

- (BOOL)isParent
{
  void *v2;
  char v3;

  -[CNUICoreFamilyElement familyMember](self, "familyMember");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isParent");

  return v3;
}

- (BOOL)containsFamilyMember:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  -[CNUICoreFamilyElement familyMember](self, "familyMember");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_msgSend(v4, "dsid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUICoreFamilyElement familyMember](self, "familyMember");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dsid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqual:", v8) & 1) != 0)
    {
      v9 = 1;
    }
    else
    {
      objc_msgSend(v4, "altDSID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNUICoreFamilyElement familyMember](self, "familyMember");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "altDSID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v10, "isEqualToString:", v12);

    }
  }

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUICoreFamilyElement familyMember](self, "familyMember");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("familyMember"));

  -[CNUICoreFamilyElement matchingContacts](self, "matchingContacts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("matchingContacts"));

  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (FAFamilyMember)familyMember
{
  return self->_familyMember;
}

- (NSArray)matchingContacts
{
  return self->_matchingContacts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchingContacts, 0);
  objc_storeStrong((id *)&self->_familyMember, 0);
}

- (void)initWithFamilyMember:(uint64_t)a3 matchingContacts:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DD140000, a1, a3, "parameter ‘matchingContacts’ must be nonnull", a5, a6, a7, a8, 0);
}

- (void)initWithFamilyMember:(uint64_t)a3 matchingContacts:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DD140000, a1, a3, "parameter ‘familyMember’ must be nonnull", a5, a6, a7, a8, 0);
}

@end
