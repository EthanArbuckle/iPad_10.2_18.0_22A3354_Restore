@implementation CNUICoreFamilyMemberSaveRequestFactory

+ (id)saveRequestToUpdateContactListByAddingContacts:(id)a3
{
  return (id)objc_msgSend(a1, "saveRequestToUpdateContactListByAddingContacts:toContainer:", a3, 0);
}

+ (id)saveRequestToUpdateContactListByAddingContacts:(id)a3 toContainer:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E0C973D0];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  objc_msgSend(v8, "setIgnoresGuardianRestrictions:", 1);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __101__CNUICoreFamilyMemberSaveRequestFactory_saveRequestToUpdateContactListByAddingContacts_toContainer___block_invoke;
  v14[3] = &unk_1EA6038C8;
  v9 = v8;
  v15 = v9;
  v16 = v5;
  v10 = v5;
  objc_msgSend(v7, "_cn_each:", v14);

  v11 = v16;
  v12 = v9;

  return v12;
}

void __101__CNUICoreFamilyMemberSaveRequestFactory_saveRequestToUpdateContactListByAddingContacts_toContainer___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v5 = (id)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addContact:toContainerWithIdentifier:", v5, v4);

}

+ (id)saveRequestToUpdateContactListByUpdatingContacts:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (objc_class *)MEMORY[0x1E0C973D0];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setIgnoresGuardianRestrictions:", 1);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __91__CNUICoreFamilyMemberSaveRequestFactory_saveRequestToUpdateContactListByUpdatingContacts___block_invoke;
  v8[3] = &unk_1EA6038F0;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "_cn_each:", v8);

  return v6;
}

void __91__CNUICoreFamilyMemberSaveRequestFactory_saveRequestToUpdateContactListByUpdatingContacts___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = (id)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(v2, "updateContact:", v3);

}

+ (id)saveRequestToUpdateContactListByRemovingContacts:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (objc_class *)MEMORY[0x1E0C973D0];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setIgnoresGuardianRestrictions:", 1);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __91__CNUICoreFamilyMemberSaveRequestFactory_saveRequestToUpdateContactListByRemovingContacts___block_invoke;
  v8[3] = &unk_1EA6038F0;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "_cn_each:", v8);

  return v6;
}

void __91__CNUICoreFamilyMemberSaveRequestFactory_saveRequestToUpdateContactListByRemovingContacts___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = (id)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(v2, "deleteContact:", v3);

}

+ (id)saveRequestToupdateContactWhitelistByAddingContacts:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (objc_class *)MEMORY[0x1E0C973D0];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setIgnoresGuardianRestrictions:", 1);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __94__CNUICoreFamilyMemberSaveRequestFactory_saveRequestToupdateContactWhitelistByAddingContacts___block_invoke;
  v8[3] = &unk_1EA6038F0;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "_cn_each:", v8);

  return v6;
}

void __94__CNUICoreFamilyMemberSaveRequestFactory_saveRequestToupdateContactWhitelistByAddingContacts___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = (id)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(v3, "setDowntimeWhitelist:", *MEMORY[0x1E0D13738]);
  objc_msgSend(*(id *)(a1 + 32), "updateContact:", v3);

}

+ (id)saveRequestToUpdateContactWhitelistByRemovingContacts:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (objc_class *)MEMORY[0x1E0C973D0];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setIgnoresGuardianRestrictions:", 1);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __96__CNUICoreFamilyMemberSaveRequestFactory_saveRequestToUpdateContactWhitelistByRemovingContacts___block_invoke;
  v8[3] = &unk_1EA6038F0;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "_cn_each:", v8);

  return v6;
}

void __96__CNUICoreFamilyMemberSaveRequestFactory_saveRequestToUpdateContactWhitelistByRemovingContacts___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = (id)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(v3, "setDowntimeWhitelist:", *MEMORY[0x1E0D13740]);
  objc_msgSend(*(id *)(a1 + 32), "updateContact:", v3);

}

+ (id)distinctCopiesOfContacts:(id)a3
{
  return (id)objc_msgSend(a3, "_cn_map:", &__block_literal_global_13);
}

id __67__CNUICoreFamilyMemberSaveRequestFactory_distinctCopiesOfContacts___block_invoke(uint64_t a1, void *a2)
{
  return (id)objc_msgSend(a2, "copyWithDistinctIdentifier");
}

@end
