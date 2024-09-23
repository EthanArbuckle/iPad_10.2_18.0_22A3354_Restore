@implementation HDInsertECGSymptomsAndCreateAssociationWithECGSamples

uint64_t ___HDInsertECGSymptomsAndCreateAssociationWithECGSamples_block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 1;
}

uint64_t ___HDInsertECGSymptomsAndCreateAssociationWithECGSamples_block_invoke_2()
{
  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t ___HDInsertECGSymptomsAndCreateAssociationWithECGSamples_block_invoke_3(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int64(a2, 2, *(_QWORD *)(a1 + 40));
  return sqlite3_bind_double(a2, 3, *(double *)(a1 + 48));
}

uint64_t ___HDInsertECGSymptomsAndCreateAssociationWithECGSamples_block_invoke_4(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, (int)objc_msgSend(*(id *)(a1 + 32), "intValue"));
  sqlite3_bind_double(a2, 2, *(double *)(a1 + 48));
  sqlite3_bind_double(a2, 3, *(double *)(a1 + 56));
  return sqlite3_bind_int64(a2, 4, (int)objc_msgSend(*(id *)(a1 + 40), "intValue"));
}

void ___HDInsertECGSymptomsAndCreateAssociationWithECGSamples_block_invoke_5(uint64_t a1, sqlite3_stmt *a2)
{
  id v4;

  sqlite3_bind_int64(a2, 1, (int)objc_msgSend(*(id *)(a1 + 32), "intValue"));
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  sqlite3_bind_int64(a2, 2, (int)objc_msgSend(v4, "intValue"));

}

uint64_t ___HDInsertECGSymptomsAndCreateAssociationWithECGSamples_block_invoke_6(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 40));
  sqlite3_bind_int64(a2, 2, (int)objc_msgSend(*(id *)(a1 + 32), "intValue"));
  return sqlite3_bind_int64(a2, 3, *(_QWORD *)(a1 + 48));
}

@end
