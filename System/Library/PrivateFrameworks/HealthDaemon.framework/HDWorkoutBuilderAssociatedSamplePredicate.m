@implementation HDWorkoutBuilderAssociatedSamplePredicate

- (id)SQLForEntityClass:(Class)a3
{
  return CFSTR("(1=1)");
}

- (id)SQLJoinClausesForEntityClass:(Class)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[objc_class joinClausesForProperty:](a3, "joinClausesForProperty:", CFSTR("uuid"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D29870];
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDDataEntity, "disambiguatedDatabaseTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "innerJoinClauseFromTable:toTargetEntity:as:localReference:targetKey:", v5, objc_opt_class(), 0, CFSTR("uuid"), CFSTR("uuid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setByAddingObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
