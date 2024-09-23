@implementation HDClinicalAuthorizationSessionEntity

+ (id)databaseTable
{
  return CFSTR("clinical_authorization_sessions");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 9;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_37;
}

+ (id)foreignKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("gateway_id");
  +[HDHealthEntity defaultForeignKey](HDClinicalGatewayEntity, "defaultForeignKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("account_id");
  v7[0] = v2;
  +[HDHealthEntity defaultForeignKey](HDClinicalAccountEntity, "defaultForeignKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)checkConstraints
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D298A8], "checkConstraintWithSQL:", CFSTR("(account_id IS NULL AND gateway_id IS NOT NULL) OR (account_id IS NOT NULL AND gateway_id IS NULL)"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v2, 0);

  return v3;
}

+ (id)joinClausesForProperty:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  objc_super v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v6 = v4;
  v7 = (void *)objc_opt_self();
  v8 = objc_alloc(MEMORY[0x1E0C99E60]);
  v29[0] = CFSTR("account.identifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithArray:", v9);

  LOBYTE(v9) = objc_msgSend(v10, "containsObject:", v6);
  v11 = (_QWORD *)MEMORY[0x1E0D29618];
  if ((v9 & 1) != 0)
  {
    v12 = (void *)MEMORY[0x1E0D29870];
    objc_msgSend(v7, "disambiguatedDatabaseTable");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "innerJoinClauseFromTable:toTargetEntity:as:localReference:targetKey:", v13, objc_opt_class(), CFSTR("account"), CFSTR("account_id"), *v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v14, 0);
  }
  else
  {
    v15 = objc_alloc_init(MEMORY[0x1E0C99E60]);
  }

  objc_msgSend(v5, "unionSet:", v15);
  v16 = v6;
  v17 = (void *)objc_opt_self();
  v18 = objc_alloc(MEMORY[0x1E0C99E60]);
  v29[0] = CFSTR("gateway.external_id");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithArray:", v19);

  LOBYTE(v19) = objc_msgSend(v20, "containsObject:", v16);
  if ((v19 & 1) != 0)
  {
    v21 = (void *)MEMORY[0x1E0D29870];
    objc_msgSend(v17, "disambiguatedDatabaseTable");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "innerJoinClauseFromTable:toTargetEntity:as:localReference:targetKey:", v22, objc_opt_class(), CFSTR("gateway"), CFSTR("gateway_id"), *v11);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v23, 0);
  }
  else
  {
    v24 = objc_alloc_init(MEMORY[0x1E0C99E60]);
  }

  objc_msgSend(v5, "unionSet:", v24);
  if (objc_msgSend(v5, "count"))
  {
    v25 = v5;
  }
  else
  {
    v28.receiver = a1;
    v28.super_class = (Class)&OBJC_METACLASS___HDClinicalAuthorizationSessionEntity;
    objc_msgSendSuper2(&v28, sel_joinClausesForProperty_, v16);
    v25 = (id)objc_claimAutoreleasedReturnValue();
  }
  v26 = v25;

  return v26;
}

@end
