@implementation ANEModel

void __44___ANEModel_procedureInfoForProcedureIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  int v13;
  id v14;

  v6 = a2;
  objc_opt_class();
  v14 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v14;
  else
    v7 = 0;
  v8 = v7;

  objc_msgSend(v8, "objectForKeyedSubscript:", kANEFModelProcedureIDKey[0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v10 = v9;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  if (v12)
  {
    v13 = *(_DWORD *)(a1 + 40);
    if (v13 == objc_msgSend(v12, "unsignedIntegerValue"))
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v7);
      *a4 = 1;
    }
  }

}

@end
