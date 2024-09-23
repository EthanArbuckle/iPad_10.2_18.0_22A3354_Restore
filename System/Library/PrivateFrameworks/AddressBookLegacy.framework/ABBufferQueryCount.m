@implementation ABBufferQueryCount

- (ABBufferQueryCount)initWithAddressBook:(void *)a3 predicate:(id)a4 includeLinkedContacts:(BOOL)a5 managedConfiguration:(id)a6
{
  _BOOL4 v7;
  ABBufferQueryCount *v10;
  const void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  _QWORD v20[6];
  _QWORD v21[6];
  _QWORD v22[6];
  _QWORD v23[6];
  _QWORD v24[3];
  int v25;
  objc_super v26;

  v7 = a5;
  v26.receiver = self;
  v26.super_class = (Class)ABBufferQueryCount;
  v10 = -[ABBufferQueryCount init](&v26, sel_init);
  if (v10)
  {
    if (a3 && (CPRecordStoreGetDatabase(), CPSqliteDatabaseConnectionForWriting()))
    {
      v10->super._managedConfiguration = (CNManagedConfiguration *)a6;
      v10->super._predicate = (ABSQLPredicate *)a4;
      if (v7)
        v10->super._fetchLinkedContacts = v7;
      v24[0] = 0;
      v24[1] = v24;
      v24[2] = 0x2020000000;
      v25 = 1;
      v10->super._sortOrder = -1;
      CFRetain(a3);
      v10->super._addressBook = a3;
      v11 = (const void *)objc_msgSend(CFSTR("SELECT count() FROM preferredmatched;"), "mutableCopy");
      -[ABBufferQuery prependWithClauseToQueryString:whereClause:](v10, "prependWithClauseToQueryString:whereClause:", v11, objc_msgSend(a4, "query"));
      v12 = CPSqliteConnectionStatementForSQL();
      v13 = v12;
      if (v12)
      {
        if (*(_QWORD *)(v12 + 8))
        {
          ABRegulatoryLogReadContactsData((uint64_t)a3);
          -[ABBufferQuery setStatement:](v10, "setStatement:", v13);
          v14 = (void *)objc_opt_new();
          v15 = MEMORY[0x1E0C809B0];
          v23[0] = MEMORY[0x1E0C809B0];
          v23[1] = 3221225472;
          v23[2] = __95__ABBufferQueryCount_initWithAddressBook_predicate_includeLinkedContacts_managedConfiguration___block_invoke;
          v23[3] = &unk_1E3CA4588;
          v23[4] = v24;
          v23[5] = v13;
          objc_msgSend(v14, "setIntBinder:", v23);
          v22[0] = v15;
          v22[1] = 3221225472;
          v22[2] = __95__ABBufferQueryCount_initWithAddressBook_predicate_includeLinkedContacts_managedConfiguration___block_invoke_2;
          v22[3] = &unk_1E3CA45B0;
          v22[4] = v24;
          v22[5] = v13;
          objc_msgSend(v14, "setStringBinder:", v22);
          v21[0] = v15;
          v21[1] = 3221225472;
          v21[2] = __95__ABBufferQueryCount_initWithAddressBook_predicate_includeLinkedContacts_managedConfiguration___block_invoke_3;
          v21[3] = &unk_1E3CA45D8;
          v21[4] = v24;
          v21[5] = v13;
          objc_msgSend(v14, "setBlobBinder:", v21);
          v20[0] = v15;
          v20[1] = 3221225472;
          v20[2] = __95__ABBufferQueryCount_initWithAddressBook_predicate_includeLinkedContacts_managedConfiguration___block_invoke_4;
          v20[3] = &unk_1E3CA4600;
          v20[4] = v24;
          v20[5] = v13;
          objc_msgSend(v14, "setPointerBinder:", v20);
          if (objc_msgSend(a4, "bindBlock"))
          {
            v16 = objc_msgSend(a4, "bindBlock");
            (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v14);
          }

        }
      }
      else
      {
        v17 = ABOSLogGeneral();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          -[ABBufferQuery initWithAddressBook:predicate:requestedProperties:includeLinkedContacts:sortOrder:managedConfiguration:identifierAuditStyle:authorizationContext:].cold.1((uint64_t)v11, v17, v18);
      }
      CFRelease(v11);
      _Block_object_dispose(v24, 8);
    }
    else
    {

      return 0;
    }
  }
  return v10;
}

uint64_t __95__ABBufferQueryCount_initWithAddressBook_predicate_includeLinkedContacts_managedConfiguration___block_invoke(uint64_t a1, int a2)
{
  uint64_t result;

  result = sqlite3_bind_int(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 40) + 8), *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), a2);
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __95__ABBufferQueryCount_initWithAddressBook_predicate_includeLinkedContacts_managedConfiguration___block_invoke_2(uint64_t a1, uint64_t a2)
{
  sqlite3_stmt *v3;
  uint64_t v4;
  int v5;
  const char *v6;
  uint64_t result;

  v3 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(_DWORD *)(v4 + 24);
  if (a2)
  {
    v6 = (const char *)_CPCreateUTF8StringFromCFString();
    result = sqlite3_bind_text(v3, v5, v6, -1, (void (__cdecl *)(void *))MEMORY[0x1E0C834A8]);
  }
  else
  {
    result = sqlite3_bind_null(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 40) + 8), *(_DWORD *)(v4 + 24));
  }
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __95__ABBufferQueryCount_initWithAddressBook_predicate_includeLinkedContacts_managedConfiguration___block_invoke_3(uint64_t a1, void *a2, int n)
{
  uint64_t result;

  result = sqlite3_bind_blob(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 40) + 8), *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), a2, n, 0);
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __95__ABBufferQueryCount_initWithAddressBook_predicate_includeLinkedContacts_managedConfiguration___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;

  v4 = a2;
  result = sqlite3_bind_blob(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 40) + 8), *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), &v4, 8, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

@end
