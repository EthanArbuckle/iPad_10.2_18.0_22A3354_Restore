@implementation HDInsertSerializedUDCLinkDataForConceptWithIdentifier

const __CFString *___HDInsertSerializedUDCLinkDataForConceptWithIdentifier_block_invoke()
{
  return CFSTR("SELECT target_uuid, link_type FROM user_domain_concept_links WHERE udc_id = ? ORDER BY ROWID");
}

uint64_t ___HDInsertSerializedUDCLinkDataForConceptWithIdentifier_block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
}

uint64_t ___HDInsertSerializedUDCLinkDataForConceptWithIdentifier_block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc(MEMORY[0x1E0CB6CF8]);
  MEMORY[0x1BCCAB1E0](a2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithTarget:type:", v5, HDSQLiteColumnAsInt64());

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
  return 1;
}

const __CFString *___HDInsertSerializedUDCLinkDataForConceptWithIdentifier_block_invoke_4()
{
  return CFSTR("UPDATE user_domain_concepts SET link_collection_data = ? WHERE udc_id = ?");
}

uint64_t ___HDInsertSerializedUDCLinkDataForConceptWithIdentifier_block_invoke_5(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  return sqlite3_bind_int64(a2, 2, *(_QWORD *)(a1 + 40));
}

@end
