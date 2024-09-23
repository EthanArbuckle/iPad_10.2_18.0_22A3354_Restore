@implementation INUIServiceViewController

uint64_t __106___INUIServiceViewController_configureForParameters_ofInteraction_interactiveBehavior_context_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD))(result + 16))(result, a2, a3, 0);
  return result;
}

uint64_t __106___INUIServiceViewController_configureForParameters_ofInteraction_interactiveBehavior_context_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD))(result + 16))(result, a2, a3, 0);
  return result;
}

void __106___INUIServiceViewController_configureForParameters_ofInteraction_interactiveBehavior_context_completion___block_invoke_3(uint64_t a1, double a2, double a3)
{
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  double v17;
  double v18;

  if (*(_QWORD *)(a1 + 48))
  {
    if (a2 == *MEMORY[0x1E0C9D820] && a3 == *(double *)(MEMORY[0x1E0C9D820] + 8))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("INUIRemoteViewControllerErrorDomain"), 2, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __106___INUIServiceViewController_configureForParameters_ofInteraction_interactiveBehavior_context_completion___block_invoke_4;
    v12[3] = &unk_1EA43A528;
    v8 = *(void **)(a1 + 32);
    v13 = *(id *)(a1 + 40);
    v9 = *(id *)(a1 + 48);
    v15 = v7;
    v16 = v9;
    v10 = *(_QWORD *)(a1 + 32);
    v17 = a2;
    v18 = a3;
    v14 = v10;
    v11 = v7;
    objc_msgSend(v8, "queryRepresentedPropertiesWithCompletion:", v12);

  }
}

void __106___INUIServiceViewController_configureForParameters_ofInteraction_interactiveBehavior_context_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;
  id obj;
  id v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v27 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v4)
  {
    v5 = v4;
    v28 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v30 != v28)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v8 = objc_msgSend(v7, "rangeOfString:", CFSTR("."));
        if (v8 == 0x7FFFFFFFFFFFFFFFLL && v9 == 0)
        {
          v16 = 0;
          v15 = 0;
        }
        else
        {
          v11 = v8;
          v12 = v9;
          v13 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v7, "substringToIndex:", v8);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "stringWithFormat:", CFSTR("IN%@"), v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v7, "substringFromIndex:", v11 + v12);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(*(id *)(a1 + 32), "intent");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (objc_class *)objc_opt_class();
        NSStringFromClass(v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "isEqualToString:", v19))
        {

        }
        else
        {
          objc_msgSend(*(id *)(a1 + 32), "intentResponse");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (objc_class *)objc_opt_class();
          NSStringFromClass(v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v15, "isEqualToString:", v22);

          if (!v23)
            goto LABEL_16;
        }
        objc_msgSend(MEMORY[0x1E0CBDA28], "parameterForClass:keyPath:", NSClassFromString((NSString *)v15), v16);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "addObject:", v24);

LABEL_16:
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v5);
  }

  v25 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 40), "_constrainedSizeForDesiredSize:", *(double *)(a1 + 64), *(double *)(a1 + 72));
  (*(void (**)(uint64_t, uint64_t, id, _QWORD))(v25 + 16))(v25, 1, v27, *(_QWORD *)(a1 + 48));

}

@end
