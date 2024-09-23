@implementation HDAddHashedMedicationIdentifierToMedicationDoseEventTable

uint64_t ___HDAddHashedMedicationIdentifierToMedicationDoseEventTable_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;

  MEMORY[0x1BCCAB1D4](a2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = ___PopulateHashedMedicationIdentifierColumn_block_invoke_2;
  v10[3] = &unk_1E6CE9508;
  v11 = v5;
  v7 = v5;
  v8 = objc_msgSend(v6, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &_PopulateHashedMedicationIdentifierColumn_insertionKey, a3, &__block_literal_global_321, v10, 0);

  return v8;
}

@end
