@implementation PopulateHashedMedicationIdentifierColumn

const __CFString *___PopulateHashedMedicationIdentifierColumn_block_invoke()
{
  return CFSTR("UPDATE medication_dose_event_samples_new SET hashed_medication_identifier = ? WHERE medication_identifier = ?");
}

void ___PopulateHashedMedicationIdentifierColumn_block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB68B8]), "initWithSemanticIdentifierString:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v2, "underlyingIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  HDSQLiteBindFoundationValueToStatement();
}

@end
