@implementation NSError(BaseBoard)

+ (id)bs_errorWithDomain:()BaseBoard code:configuration:
{
  id v9;
  void (**v10)(id, _QWORD *);
  _QWORD *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v18;
  id v19;
  objc_class *v20;
  void *v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("block != ((void *)0)"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v23 = v19;
      v24 = 2114;
      v25 = v21;
      v26 = 2048;
      v27 = a1;
      v28 = 2114;
      v29 = CFSTR("NSError+BaseBoard.m");
      v30 = 1024;
      v31 = 114;
      v32 = 2114;
      v33 = v18;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1B842CLL);
  }
  v11 = -[_BSErrorConfiguration initWithDomain:code:]([_BSErrorConfiguration alloc], v9, a4);
  v10[2](v10, v11);
  if (v11)
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = v11[1];
    v14 = v11[2];
    if (objc_msgSend((id)v11[3], "count"))
      v15 = v11[3];
    else
      v15 = 0;
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)succinctDescription
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "succinctDescriptionBuilder");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "build");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)succinctDescriptionBuilder
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  id v15;
  void *v16;
  void *v17;

  +[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("domain"));

  objc_msgSend(a1, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("BSErrorCodeDescription"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld (\"%@\")"), objc_msgSend(a1, "code"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v2, "appendObject:withName:", v7, CFSTR("code"));

  }
  else
  {
    v9 = (id)objc_msgSend(v2, "appendInteger:withName:", objc_msgSend(a1, "code"), CFSTR("code"));
  }
  objc_msgSend(a1, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0CB2D60]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "userInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0CB2D68]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 && v13)
  {
    if (objc_msgSend(v11, "hasSuffix:", CFSTR(".")))
      v14 = CFSTR("%@ %@");
    else
      v14 = CFSTR("%@. %@");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v14, v11, v13);
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v13)
      v16 = v13;
    else
      v16 = v11;
    v15 = v16;
  }
  v17 = v15;
  objc_msgSend(v2, "appendString:withName:skipIfEmpty:", v15, 0, 1);

  return v2;
}

- (id)descriptionWithMultilinePrefix:()BaseBoard
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "descriptionBuilderWithMultilinePrefix:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "build");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)descriptionBuilderWithMultilinePrefix:()BaseBoard
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;

  v4 = a3;
  if (qword_1ECD399C0 != -1)
    dispatch_once(&qword_1ECD399C0, &__block_literal_global_21);
  objc_msgSend(a1, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "removeObjectsInArray:", _MergedGlobals_23);
  objc_msgSend(v7, "sortUsingSelector:", sel_compare_);
  objc_msgSend(a1, "underlyingErrors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bs_orderedSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "succinctDescriptionBuilder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") || objc_msgSend(v9, "count"))
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __60__NSError_BaseBoard__descriptionBuilderWithMultilinePrefix___block_invoke_2;
    v12[3] = &unk_1E1EBF650;
    v13 = v7;
    v14 = v5;
    v15 = v10;
    v16 = v9;
    objc_msgSend(v15, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v12);

  }
  return v10;
}

@end
