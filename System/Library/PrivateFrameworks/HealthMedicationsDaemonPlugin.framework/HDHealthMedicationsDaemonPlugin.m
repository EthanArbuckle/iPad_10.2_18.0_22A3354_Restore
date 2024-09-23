@implementation HDHealthMedicationsDaemonPlugin

- (NSString)pluginIdentifier
{
  return (NSString *)CFSTR("com.apple.health.MedicationsDaemonPlugin");
}

- (NSString)schemaName
{
  return (NSString *)(id)*MEMORY[0x1E0D2C228];
}

- (int64_t)currentSchemaVersionForProtectionClass:(int64_t)a3
{
  void *v3;
  int64_t v4;

  -[HDHealthMedicationsDaemonPlugin _databaseSchemaForProtectionClass:](self, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "currentSchemaVersion");

  return v4;
}

- (id)_databaseSchemaForProtectionClass:(id)a1
{
  __objc2_class **v2;

  if (a1)
  {
    if (a2 == 1)
    {
      v2 = off_1E6DFF5E0;
      goto LABEL_6;
    }
    if (a2 == 2)
    {
      v2 = off_1E6DFF5D8;
LABEL_6:
      a1 = objc_alloc_init(*v2);
    }
  }
  return a1;
}

- (id)extensionForProfile:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[HDHealthMedicationsDaemonPlugin createMedicationsProfileExtensionForProfile:](self, "createMedicationsProfileExtensionForProfile:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "start");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)createMedicationsDaemonExtensionForHealthDaemon:(id)a3
{
  id v3;
  HDHealthMedicationsDaemonExtension *v4;

  v3 = a3;
  v4 = -[HDHealthMedicationsDaemonExtension initWithHealthDaemon:]([HDHealthMedicationsDaemonExtension alloc], "initWithHealthDaemon:", v3);

  return v4;
}

- (id)createMedicationsProfileExtensionForProfile:(id)a3
{
  id v3;
  HDHealthMedicationsProfileExtension *v4;

  v3 = a3;
  v4 = -[HDHealthMedicationsProfileExtension initWithProfile:]([HDHealthMedicationsProfileExtension alloc], "initWithProfile:", v3);

  return v4;
}

- (id)taskServerClasses
{
  _QWORD v3[8];

  v3[7] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  v3[3] = objc_opt_class();
  v3[4] = objc_opt_class();
  v3[5] = objc_opt_class();
  v3[6] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)databaseEntitiesForProtectionClass:(int64_t)a3
{
  void *v3;
  void *v4;

  -[HDHealthMedicationsDaemonPlugin _databaseSchemaForProtectionClass:](self, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "databaseEntities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)registerMigrationStepsForProtectionClass:(int64_t)a3 migrator:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  -[HDHealthMedicationsDaemonPlugin _databaseSchemaForProtectionClass:](self, a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[HDHealthMedicationsDaemonPlugin schemaName](self, "schemaName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerMigrationStepsWithMigrator:schemaName:", v6, v7);

}

- (id)notificationInstructionCriteriaClasses
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)userDomainConceptEntityClasses
{
  void *v2;
  void *v3;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB6D48], "medicationUserDomainConceptTypeIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v2;
  v6[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)syncSchemaIdentifier
{
  return (NSString *)(id)*MEMORY[0x1E0D2C230];
}

- (id)orderedSyncEntities
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)ontologySchemaImporterClasses
{
  uint64_t v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CB5748];
  v4[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)ontologyFeatureEvaluatorsForDaemon:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "healthMedicationsDaemonExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ontologyFeatureEvaluators");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)demoDataGeneratorClasses
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)stateSyncEntityClasses
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
