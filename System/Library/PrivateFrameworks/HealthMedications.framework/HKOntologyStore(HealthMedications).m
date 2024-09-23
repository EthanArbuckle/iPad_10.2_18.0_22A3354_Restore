@implementation HKOntologyStore(HealthMedications)

- (void)markMedicationShardsAsRequiredOnFirstLaunchWithCompletion:()HealthMedications
{
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0CB5718];
  v8[0] = *MEMORY[0x1E0CB56F0];
  v8[1] = v4;
  v5 = (void *)MEMORY[0x1E0C99D20];
  v6 = a3;
  objc_msgSend(v5, "arrayWithObjects:count:", v8, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "markShardsWithIdentifiers:options:completion:", v7, 3, v6);

}

- (void)markCoreMedsShardAsRequiredWithCompletion:()HealthMedications
{
  -[HKOntologyStore _markShardRequiredWithIdentifier:completion:](a1, (void *)*MEMORY[0x1E0CB56F0], a3);
}

- (void)markMedsScanningShardAsRequiredWithCompletion:()HealthMedications
{
  -[HKOntologyStore _markShardRequiredWithIdentifier:completion:](a1, (void *)*MEMORY[0x1E0CB5718], a3);
}

- (void)markInteractionsShardAsRequiredWithCompletion:()HealthMedications
{
  -[HKOntologyStore _markShardRequiredWithIdentifier:completion:](a1, (void *)*MEMORY[0x1E0CB56F8], a3);
}

- (void)markMedsEducationAsRequiredWithCompletion:()HealthMedications
{
  -[HKOntologyStore _markShardRequiredWithIdentifier:completion:](a1, (void *)*MEMORY[0x1E0CB5710], a3);
}

@end
