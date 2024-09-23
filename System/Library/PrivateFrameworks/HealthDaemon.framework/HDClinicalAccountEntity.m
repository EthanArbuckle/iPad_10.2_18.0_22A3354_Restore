@implementation HDClinicalAccountEntity

+ (id)databaseTable
{
  return CFSTR("clinical_accounts");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 26;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_18;
}

+ (id)foreignKeys
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("credential_id");
  v2 = objc_alloc(MEMORY[0x1E0D29858]);
  v3 = objc_opt_class();
  v4 = *MEMORY[0x1E0D29618];
  v5 = (void *)objc_msgSend(v2, "initWithEntityClass:property:deletionAction:", v3, *MEMORY[0x1E0D29618], 3);
  v11[0] = v5;
  v10[1] = CFSTR("gateway_id");
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D29858]), "initWithEntityClass:property:deletionAction:", objc_opt_class(), v4, 3);
  v11[1] = v6;
  v10[2] = CFSTR("signed_clinical_data_issuer_rowid");
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D29858]), "initWithEntityClass:property:deletionAction:", objc_opt_class(), v4, 2);
  v11[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)checkConstraints
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D298A8], "checkConstraintWithSQL:", CFSTR("(gateway_id IS NOT NULL AND signed_clinical_data_issuer_rowid IS NULL) OR (gateway_id IS NULL AND signed_clinical_data_issuer_rowid IS NOT NULL)"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)propertyForSyncAnchor
{
  return CFSTR("sync_anchor");
}

+ (id)propertyForSyncProvenance
{
  return CFSTR("sync_provenance");
}

+ (id)propertyForSyncIdentity
{
  return CFSTR("sync_identity");
}

+ (id)joinClausesForProperty:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0C99E60]);
  v19[0] = CFSTR("gateway.external_id");
  v19[1] = CFSTR("gateway.last_reported_status");
  v19[2] = CFSTR("issuer.identifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithArray:", v6);

  if (objc_msgSend(v7, "containsObject:", v4))
  {
    v8 = (void *)MEMORY[0x1E0D29870];
    objc_msgSend(a1, "disambiguatedDatabaseTable");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_class();
    v11 = *MEMORY[0x1E0D29618];
    objc_msgSend(v8, "leftJoinClauseFromTable:toTargetEntity:as:localReference:targetKey:", v9, v10, CFSTR("gateway"), CFSTR("gateway_id"), *MEMORY[0x1E0D29618]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x1E0D29870];
    objc_msgSend(a1, "disambiguatedDatabaseTable");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "leftJoinClauseFromTable:toTargetEntity:as:localReference:targetKey:", v14, objc_opt_class(), CFSTR("issuer"), CFSTR("signed_clinical_data_issuer_rowid"), v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v12, v15, 0);
  }
  else
  {
    v18.receiver = a1;
    v18.super_class = (Class)&OBJC_METACLASS___HDClinicalAccountEntity;
    objc_msgSendSuper2(&v18, sel_joinClausesForProperty_, v4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

@end
