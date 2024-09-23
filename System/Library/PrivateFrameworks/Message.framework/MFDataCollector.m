@implementation MFDataCollector

BOOL __24___MFDataCollector_done__block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  id v4;
  sqlite3_stmt *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  int v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  NSObject *v21;
  _BOOL8 v22;
  NSObject *v24;
  unint64_t v25;
  uint8_t buf[24];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("SELECT 1 FROM messages WHERE ROWID = ?;"));
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (sqlite3_stmt *)objc_msgSend(v4, "compiled");

  sqlite3_bind_int64(v5, 1, a1[7]);
  LODWORD(v4) = sqlite3_step(v5);
  sqlite3_reset(v5);
  objc_msgSend(v3, "checkForConnectionErrorWithMessage:", CFSTR("testing for message existence"));
  if ((_DWORD)v4 == 100)
  {
    v25 = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(*(id *)(a1[4] + 8), "messageDataExistsInDatabaseForMessageLibraryID:part:length:", a1[7], *(_QWORD *)(a1[4] + 40), &v25);
    if (v25 == 0x7FFFFFFFFFFFFFFFLL || (v6 = objc_msgSend((id)a1[5], "length"), v6 > v25))
    {
      v7 = a1[4];
      v8 = *(void **)(v7 + 8);
      v9 = objc_msgSend(*(id *)(v7 + 16), "libraryID");
      objc_msgSend(*(id *)(a1[4] + 16), "globalMessageID");
      v10 = a1[4];
      v11 = a1[5];
      v12 = *(void **)(v10 + 40);
      v13 = *(unsigned __int8 *)(v10 + 48);
      v14 = *(unsigned __int8 *)(v10 + 49);
      objc_msgSend(*(id *)(v10 + 16), "account");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v8;
      v17 = v3;
      v18 = v12;
      v19 = v15;
      objc_msgSend(MEMORY[0x1E0D46088], "dataHolderWithData:", v11);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v9) = _writeDataHolderForMessageAndPart(v16, v17, v9, 0, v18, v20, v13 != 0, v14 != 0, v19);

      *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v9;
    }
    else
    {
      MFPersistenceLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        __24___MFDataCollector_done__block_invoke_cold_2();

    }
  }
  else
  {
    MFPersistenceLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4F90000, v21, OS_LOG_TYPE_DEFAULT, "not saving message data for non-existent message", buf, 2u);
    }

  }
  v22 = *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) != 0;

  return v22;
}

uint64_t __24___MFDataCollector_done__block_invoke_1918(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  const __CFString *v5;
  id v6;
  sqlite3_stmt *v7;
  void *v8;

  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40))
    v5 = CFSTR("DELETE FROM message_data WHERE message_id = ? AND part = ?");
  else
    v5 = CFSTR("DELETE FROM message_data WHERE message_id = ? AND part IS NULL");
  objc_msgSend(v3, "preparedStatementForQueryString:", v5);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = (sqlite3_stmt *)objc_msgSend(v6, "compiled");

  sqlite3_bind_int64(v7, 1, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "libraryID"));
  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  if (v8)
    sqlite3_bind_text(v7, 2, (const char *)objc_msgSend(v8, "UTF8String"), -1, 0);
  sqlite3_step(v7);
  sqlite3_reset(v7);
  objc_msgSend(v4, "checkForConnectionErrorWithMessage:", CFSTR("deleting message data"));

  return 1;
}

void __24___MFDataCollector_done__block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_13(a1, a2, a3, 3.8521e-34);
  OUTLINED_FUNCTION_4(&dword_1A4F90000, v5, v3, "Exception occurred while message with ID %lld: %@", v4);
}

void __24___MFDataCollector_done__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_16(&dword_1A4F90000, v0, v1, "writing out no data since existing data is equally long", v2);
  OUTLINED_FUNCTION_9();
}

@end
