@implementation HDInsertPrimaryActivityForRowAndMetadata

const __CFString *___HDInsertPrimaryActivityForRowAndMetadata_block_invoke()
{
  return CFSTR("SELECT key_id, numerical_value, string_value FROM metadata_values WHERE object_id = ? AND key_id IN (?, ?, ?)");
}

uint64_t ___HDInsertPrimaryActivityForRowAndMetadata_block_invoke_2(sqlite3_int64 *a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, a1[4]);
  sqlite3_bind_int64(a2, 2, a1[5]);
  sqlite3_bind_int64(a2, 3, a1[6]);
  return sqlite3_bind_int64(a2, 4, a1[7]);
}

uint64_t ___HDInsertPrimaryActivityForRowAndMetadata_block_invoke_3(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v4 = HDSQLiteColumnAsInt64();
  if (v4 == a1[7])
  {
    if (MEMORY[0x1BCCAB1A4](a2, 1) == 1.0)
      *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = 2;
  }
  else if (v4 == a1[8])
  {
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = (uint64_t)MEMORY[0x1BCCAB1A4](a2, 1);
  }
  else if (v4 == a1[9])
  {
    v5 = MEMORY[0x1BCCAB1A4](a2, 1);
    MEMORY[0x1BCCAB1D4](a2, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB6A28];
    objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "quantityWithUnit:doubleValue:", v8, v5);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1[6] + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
  return 1;
}

const __CFString *___HDInsertPrimaryActivityForRowAndMetadata_block_invoke_4()
{
  return CFSTR("INSERT INTO workout_activities (uuid, owner_id, is_primary_activity, activity_type, location_type, swimming_location_type, lap_length, start_date, end_date, duration) VALUES (?, ?, 1, ?, ?, ?, ?, ?, ?, ?)");
}

void ___HDInsertPrimaryActivityForRowAndMetadata_block_invoke_5(uint64_t a1, sqlite3_stmt *a2)
{
  id v4;

  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int64(a2, 2, *(_QWORD *)(a1 + 64));
  sqlite3_bind_int64(a2, 3, *(_QWORD *)(a1 + 72));
  sqlite3_bind_int64(a2, 4, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  sqlite3_bind_int64(a2, 5, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), 1, 0);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sqlite3_bind_blob64(a2, 6, (const void *)objc_msgSend(v4, "bytes"), objc_msgSend(v4, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  sqlite3_bind_double(a2, 7, *(double *)(a1 + 80));
  sqlite3_bind_double(a2, 8, *(double *)(a1 + 88));
  sqlite3_bind_double(a2, 9, *(double *)(a1 + 96));

}

@end
