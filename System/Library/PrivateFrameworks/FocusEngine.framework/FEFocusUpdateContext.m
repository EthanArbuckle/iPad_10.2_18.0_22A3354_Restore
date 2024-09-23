@implementation FEFocusUpdateContext

BOOL __34___FEFocusUpdateContext__validate__block_invoke(uint64_t a1)
{
  return *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) || *(_QWORD *)(a1 + 32) != 0;
}

void __34___FEFocusUpdateContext__validate__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  objc_class *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  BOOL v21;
  id v23;

  _FEFocusEnvironmentFirstCommonAncestor(*(void **)(a1 + 32), *(void **)(a1 + 40));
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = v2;
    do
    {
      v4 = v3;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = _FEFocusEnvironmentShouldUpdateFocus(v3, *(void **)(a1 + 48));
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) && *(_QWORD *)(a1 + 56))
      {
        v5 = (void *)MEMORY[0x24BDD17C8];
        v6 = v3;
        v7 = (objc_class *)objc_opt_class();
        NSStringFromClass(v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p>"), v8, v6);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        +[_FEDebugIssue issueWithDescription:](_FEDebugIssue, "issueWithDescription:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "setPrefix:", &stru_250D3AA90);
        objc_msgSend(*(id *)(a1 + 56), "addIssue:", v10);

      }
      v3 = (id)objc_msgSend(v4, "_parentFocusEnvironment");

      if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 72) + 16))())
        v11 = v3 == 0;
      else
        v11 = 1;
    }
    while (!v11);

  }
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 72) + 16))())
  {
    v12 = *(void **)(a1 + 40);
    if (v12 != *(void **)(a1 + 32))
    {
      v13 = v12;
      do
      {
        v14 = v13;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = _FEFocusEnvironmentShouldUpdateFocus(v13, *(void **)(a1 + 48));
        if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) && *(_QWORD *)(a1 + 64))
        {
          v15 = v13;
          if (v15)
          {
            v16 = (void *)MEMORY[0x24BDD17C8];
            v17 = (objc_class *)objc_opt_class();
            NSStringFromClass(v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "stringWithFormat:", CFSTR("<%@: %p>"), v18, v15);
            v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v19 = CFSTR("(nil)");
          }

          +[_FEDebugIssue issueWithDescription:](_FEDebugIssue, "issueWithDescription:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v20, "setPrefix:", &stru_250D3AA90);
          objc_msgSend(*(id *)(a1 + 64), "addIssue:", v20);

        }
        v13 = (id)objc_msgSend(v14, "_parentFocusEnvironment");

        if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 72) + 16))())
          v21 = v13 == 0;
        else
          v21 = 1;
      }
      while (!v21 && v13 != v23);

    }
  }

}

@end
