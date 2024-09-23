@implementation ABAddressBookCopyAllPeopleForBufferPredicate

void __ABAddressBookCopyAllPeopleForBufferPredicate_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[6];
  _QWORD v8[6];
  _QWORD v9[6];
  _QWORD v10[6];
  _QWORD v11[3];
  int v12;

  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v12 = 1;
  v4 = (void *)objc_opt_new();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __ABAddressBookCopyAllPeopleForBufferPredicate_block_invoke_2;
  v10[3] = &unk_1E3CA4588;
  v10[4] = v11;
  v10[5] = a2;
  objc_msgSend(v4, "setIntBinder:", v10);
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __ABAddressBookCopyAllPeopleForBufferPredicate_block_invoke_3;
  v9[3] = &unk_1E3CA45B0;
  v9[4] = v11;
  v9[5] = a2;
  objc_msgSend(v4, "setStringBinder:", v9);
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __ABAddressBookCopyAllPeopleForBufferPredicate_block_invoke_4;
  v8[3] = &unk_1E3CA45D8;
  v8[4] = v11;
  v8[5] = a2;
  objc_msgSend(v4, "setBlobBinder:", v8);
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __ABAddressBookCopyAllPeopleForBufferPredicate_block_invoke_5;
  v7[3] = &unk_1E3CA4600;
  v7[4] = v11;
  v7[5] = a2;
  objc_msgSend(v4, "setPointerBinder:", v7);
  v6 = objc_msgSend(*(id *)(a1 + 32), "bindBlock");
  (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v4);
  _Block_object_dispose(v11, 8);
}

uint64_t __ABAddressBookCopyAllPeopleForBufferPredicate_block_invoke_2(uint64_t a1, int a2)
{
  uint64_t result;

  result = sqlite3_bind_int(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 40) + 8), *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), a2);
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __ABAddressBookCopyAllPeopleForBufferPredicate_block_invoke_3(uint64_t a1, uint64_t a2)
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

uint64_t __ABAddressBookCopyAllPeopleForBufferPredicate_block_invoke_4(uint64_t a1, void *a2, int n)
{
  uint64_t result;

  result = sqlite3_bind_blob(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 40) + 8), *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), a2, n, 0);
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __ABAddressBookCopyAllPeopleForBufferPredicate_block_invoke_5(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;

  v4 = a2;
  result = sqlite3_bind_blob(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 40) + 8), *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), &v4, 8, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

@end
