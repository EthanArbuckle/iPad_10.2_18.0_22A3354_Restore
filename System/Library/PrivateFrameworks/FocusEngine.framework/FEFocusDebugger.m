@implementation FEFocusDebugger

void __24___FEFocusDebugger_help__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  void *v9;
  id v10;
  id v11;
  id v12;

  v9 = *(void **)(a1 + 32);
  v12 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v9, "appendFormat:", CFSTR("\n\n%@:"), a2);
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\n\tSwift: %@"), v11);

  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\n\tObjC:  %@"), v10);
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\n\n\tOverview:\n\t%@"), v12);

}

void __44___FEFocusDebugger__ancestryForEnvironment___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  id v10;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v10 = v3;
  if (v3)
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p>"), v7, v10);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = CFSTR("(nil)");
  }
  objc_msgSend(v4, "addMessage:", v8);

  v9 = v10;
  if (*(id *)(a1 + 40) == v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "incrementIndentLevel");
    v9 = v10;
  }

}

uint64_t __46___FEFocusDebugger_focusGroupsForEnvironment___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = a2;
  v6 = v5;
  if (a3
    || (objc_msgSend(v5, "parentGroup"), v10 = (void *)objc_claimAutoreleasedReturnValue(), v10, !v10))
  {
    objc_msgSend(v6, "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[_FEDebugLogMessage messageWithString:](_FEDebugLogNode, "messageWithString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "pushNode:", v8);
    v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

id *__46___FEFocusDebugger_focusGroupsForEnvironment___block_invoke_2(id *result, uint64_t a2, uint64_t a3, int a4)
{
  if (a4)
    return (id *)(id)objc_msgSend(result[4], "popNode");
  return result;
}

void __61___FEFocusDebugger_preferredFocusEnvironmentsForEnvironment___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  __CFString *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  if (objc_msgSend(v13, "isPreferredByItself"))
  {
    *a3 = 1;
  }
  else
  {
    objc_msgSend(v13, "environment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v5);
    _FEFocusItemSafeCast(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if ((v6 & 1) != 0)
    {
      v9 = CFSTR("Environment seen previously. Skipping.");
      v10 = CFSTR("!");
    }
    else
    {
      v10 = &stru_250D3AA90;
      if (v7)
      {
        if (_FEFocusItemIsFocusedOrFocusableInFocusSystem(v7, *(void **)(a1 + 40)))
        {
          v10 = CFSTR("*");
          v9 = CFSTR("Environment is focusable.");
        }
        else
        {
          v9 = 0;
        }
      }
      else
      {
        v9 = 0;
      }
    }
    if (-[__CFString length](v9, "length"))
    {
      +[_FEDebugLogMessage messageWithPrefix:string:](_FEDebugLogMessage, "messageWithPrefix:string:", v10, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "debugStack");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addMessage:", v11);

    }
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    *a3 = v6;

  }
}

@end
