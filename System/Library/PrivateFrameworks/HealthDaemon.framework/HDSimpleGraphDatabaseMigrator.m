@implementation HDSimpleGraphDatabaseMigrator

+ (id)migrationStepsWithBehavior:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v13[5];

  v13[4] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_opt_self();
  +[HDSimpleGraphDatabaseMigrationStep migrationToVersion:function:](HDSimpleGraphDatabaseMigrationStep, "migrationToVersion:function:", 5, _removeUserDataAndAdHocConcepts);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  +[HDSimpleGraphDatabaseMigrationStep migrationToVersion:function:](HDSimpleGraphDatabaseMigrationStep, "migrationToVersion:function:", 6, _improveOntologyDatabaseSchema);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v5;
  +[HDSimpleGraphDatabaseMigrationStep migrationToVersion:function:](HDSimpleGraphDatabaseMigrationStep, "migrationToVersion:function:", 7, _shardedOntologySupport);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v6;
  +[HDSimpleGraphDatabaseMigrationStep migrationToVersion:function:](HDSimpleGraphDatabaseMigrationStep, "migrationToVersion:function:", 8, _removeOrphanedSydneyContent);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v3, "supportsOntologyDatabaseFutureMigrations");
  if ((_DWORD)v4)
  {
    objc_opt_self();
    +[HDSimpleGraphDatabaseMigrationStep migrationToVersion:function:](HDSimpleGraphDatabaseMigrationStep, "migrationToVersion:function:", 10001, _noOpSuccess);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v11;
  }
  return v8;
}

@end
