@implementation HDOnboardingCompletionEntityEncoder

- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  HDCodableOnboardingCompletion *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = objc_alloc_init(HDCodableOnboardingCompletion);
  HDSQLiteColumnWithNameAsUUID();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hk_dataForUUIDBytes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableOnboardingCompletion setUuid:](v5, "setUuid:", v7);

  HDSQLiteColumnWithNameAsString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToString:", &stru_1E6D11BB8) & 1) == 0)
    -[HDCodableOnboardingCompletion setFeatureIdentifier:](v5, "setFeatureIdentifier:", v8);
  v9 = HDSQLiteColumnWithNameAsInt64();
  if (v9 >= 1)
    -[HDCodableOnboardingCompletion setVersion:](v5, "setVersion:", v9);
  HDSQLiteColumnWithNameAsDouble();
  -[HDCodableOnboardingCompletion setCompletionDate:](v5, "setCompletionDate:");
  HDSQLiteColumnWithNameAsString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableOnboardingCompletion setCountryCode:](v5, "setCountryCode:", v10);

  -[HDCodableOnboardingCompletion setCountryCodeProvenance:](v5, "setCountryCodeProvenance:", HDSQLiteColumnWithNameAsInt64());
  HDSQLiteColumnWithNameAsDouble();
  -[HDCodableOnboardingCompletion setModificationDate:](v5, "setModificationDate:");
  -[HDCodableOnboardingCompletion setDeleted:](v5, "setDeleted:", HDSQLiteColumnWithNameAsBoolean());

  return v5;
}

- (id)objectForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  return _OnboardingCompletionFromRow((uint64_t)a4, (uint64_t)a5);
}

@end
