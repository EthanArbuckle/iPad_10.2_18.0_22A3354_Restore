@implementation CNUIMeContactComparisonStrategyUnified

- (void)meContactChangedInStore:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0C96768];
  v17[0] = *MEMORY[0x1E0C966E8];
  v17[1] = v4;
  v5 = (void *)MEMORY[0x1E0C99D20];
  v6 = a3;
  objc_msgSend(v5, "arrayWithObjects:count:", v17, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v6, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", v7, &v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v16;

  v15 = v9;
  objc_msgSend(v6, "meContactIdentifiers:", &v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v15;
  -[CNUIMeContactComparisonStrategyUnified identifierAndLinkIdentifierAndLinkedContactIdentifiersFromContact:](self, "identifierAndLinkIdentifierAndLinkedContactIdentifiersFromContact:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) == 0)
    objc_msgSend(v13, "addObjectsFromArray:", v10);
  v14 = (void *)objc_msgSend(v13, "copy");
  -[CNUIMeContactComparisonStrategyUnified setMeContactIdentifiersFound:](self, "setMeContactIdentifiersFound:", v14);

}

- (void)setMeContactIdentifiersFound:(id)a3
{
  objc_storeStrong((id *)&self->_meContactIdentifiersFound, a3);
}

- (BOOL)isMeContact:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  -[CNUIMeContactComparisonStrategyUnified identifierAndLinkIdentifierAndLinkedContactIdentifiersFromContact:](self, "identifierAndLinkIdentifierAndLinkedContactIdentifiersFromContact:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIMeContactComparisonStrategyUnified meContactIdentifiersFound](self, "meContactIdentifiersFound");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "intersectsSet:", v5);

  return v6;
}

- (id)identifierAndLinkIdentifierAndLinkedContactIdentifiersFromContact:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0D13848];
  objc_msgSend(v3, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(v3, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v8);

  }
  if (!objc_msgSend(v3, "isUnified"))
  {
    +[CNUIMeContactMonitor log](CNUIMeContactMonitor, "log");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412290;
      v19 = v3;
      _os_log_impl(&dword_1DD140000, v15, OS_LOG_TYPE_DEFAULT, "*** WARNING *** contact is not unified %@", (uint8_t *)&v18, 0xCu);
    }
    goto LABEL_10;
  }
  objc_msgSend(v3, "linkIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v9);

  if ((v10 & 1) == 0)
  {
    objc_msgSend(v3, "linkIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v11);

  }
  v12 = *MEMORY[0x1E0D137F8];
  objc_msgSend(v3, "linkedContacts");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_cn_map:", &__block_literal_global_129);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v12) = (*(uint64_t (**)(uint64_t, void *))(v12 + 16))(v12, v14);

  if ((v12 & 1) == 0)
  {
    objc_msgSend(v3, "linkedContacts");
    v15 = objc_claimAutoreleasedReturnValue();
    -[NSObject _cn_map:](v15, "_cn_map:", &__block_literal_global_129);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v16);

LABEL_10:
  }

  return v4;
}

- (NSSet)meContactIdentifiersFound
{
  return self->_meContactIdentifiersFound;
}

- (id)meContactIdentifiers
{
  void *v2;
  void *v3;

  -[CNUIMeContactComparisonStrategyUnified meContactIdentifiersFound](self, "meContactIdentifiersFound");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meContactIdentifiersFound, 0);
}

@end
