@implementation MSVSQLConnection

void __45___MSVSQLConnection__cloneWithOptions_error___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id *v7;
  uint64_t v8;
  id *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id obj;

  v7 = *(id **)(a1 + 32);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v8 + 40);
  v9 = (id *)(v8 + 40);
  obj = v10;
  v11 = a3;
  v12 = a2;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ATTACH %@ AS %@"), v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "executeStatementString:error:", v13, &obj))
      objc_msgSend(v7[3], "setObject:forKeyedSubscript:", v11, v12);

  }
  objc_storeStrong(v9, obj);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    *a4 = 1;
}

BOOL __55___MSVSQLConnection_unregisterFunctionNamed_arguments___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  _QWORD *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  int v9;
  _BOOL8 v10;
  uint64_t v11;

  v3 = a2;
  v4 = v3;
  if (v3)
    v5 = (void *)v3[1];
  else
    v5 = 0;
  v6 = v5;
  v7 = *(id *)(a1 + 32);
  if (v6 == v7)
  {

  }
  else
  {
    v8 = v7;
    v9 = objc_msgSend(v6, "isEqual:", v7);

    if (!v9)
    {
      v10 = 0;
      goto LABEL_10;
    }
  }
  if (v4)
    v11 = v4[2];
  else
    v11 = 0;
  v10 = v11 == *(_QWORD *)(a1 + 40);
LABEL_10:

  return v10;
}

BOOL __55___MSVSQLConnection_unregisterFunctionNamed_arguments___block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD *v3;
  _QWORD *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  int v9;
  _BOOL8 v10;
  uint64_t v11;

  v3 = a2;
  v4 = v3;
  if (v3)
    v5 = (void *)v3[1];
  else
    v5 = 0;
  v6 = v5;
  v7 = *(id *)(a1 + 32);
  if (v6 == v7)
  {

  }
  else
  {
    v8 = v7;
    v9 = objc_msgSend(v6, "isEqual:", v7);

    if (!v9)
    {
      v10 = 0;
      goto LABEL_10;
    }
  }
  if (v4)
    v11 = v4[2];
  else
    v11 = 0;
  v10 = v11 == *(_QWORD *)(a1 + 40);
LABEL_10:

  return v10;
}

@end
