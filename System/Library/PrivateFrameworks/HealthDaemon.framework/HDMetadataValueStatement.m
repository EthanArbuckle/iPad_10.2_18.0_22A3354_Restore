@implementation HDMetadataValueStatement

- (BOOL)enumerateResultsForObjectID:(int64_t)a3 error:(id *)a4 block:(id)a5
{
  id v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];

  v11 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __68__HDMetadataValueStatement_enumerateResultsForObjectID_error_block___block_invoke;
  v12[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v12[4] = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__HDMetadataValueStatement_enumerateResultsForObjectID_error_block___block_invoke_2;
  v10[3] = &unk_1E6CE82B0;
  v8 = v11;
  LOBYTE(a4) = -[HDSQLiteStatement enumerateStatementWithError:bindingHandler:block:](self, "enumerateStatementWithError:bindingHandler:block:", a4, v12, v10);

  return (char)a4;
}

uint64_t __68__HDMetadataValueStatement_enumerateResultsForObjectID_error_block___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  HDSQLiteColumnAsInt64();
  switch(HDSQLiteColumnAsInt64())
  {
    case 0:
      MEMORY[0x1BCCAB1D4](a2, 1);
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 1:
      MEMORY[0x1BCCAB1C8](a2, 2);
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 2:
      MEMORY[0x1BCCAB198](a2, 3);
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 3:
      v6 = MEMORY[0x1BCCAB1A4](a2, 2);
      MEMORY[0x1BCCAB1D4](a2, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0CB6A28];
      objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "quantityWithUnit:doubleValue:", v9, v6);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    case 4:
      MEMORY[0x1BCCAB18C](a2, 5);
      v4 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v5 = (void *)v4;
      break;
    default:
      v5 = 0;
      break;
  }
  v10 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  return v10;
}

+ (HDMetadataValueStatement)metadataValueStatementWithTransaction:(id)a3
{
  id v4;
  HDMetadataValueStatement *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id *v11;
  id *v12;
  objc_super v14;

  v4 = a3;
  v5 = [HDMetadataValueStatement alloc];
  v6 = v4;
  if (v5)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDMetadataValueEntity, "disambiguatedDatabaseTable");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("SELECT %@, %@, %@, %@, %@, %@ FROM %@ WHERE %@ = ?"), CFSTR("key_id"), CFSTR("string_value"), CFSTR("numerical_value"), CFSTR("date_value"), CFSTR("value_type"), CFSTR("data_value"), v8, CFSTR("object_id"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "databaseForEntityClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14.receiver = v5;
    v14.super_class = (Class)HDMetadataValueStatement;
    v11 = objc_msgSendSuper2(&v14, sel_initWithSQL_database_, v9, v10);

    if (v11)
      objc_storeStrong(v11 + 3, a3);
    v12 = v11;

  }
  else
  {
    v12 = 0;
  }

  return (HDMetadataValueStatement *)v12;
}

uint64_t __68__HDMetadataValueStatement_enumerateResultsForObjectID_error_block___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
}

- (HDDatabaseTransaction)transaction
{
  return self->_transaction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end
