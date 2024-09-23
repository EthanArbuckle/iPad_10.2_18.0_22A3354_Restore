@implementation BSObjCMethod

- (unint64_t)hash
{
  return -[NSString hash](self->_name, "hash");
}

- (NSArray)arguments
{
  return self->_arguments;
}

- (BSObjCValue)returnValue
{
  return self->_returnValue;
}

- (NSString)encoding
{
  return self->_encoding;
}

- (BSObjCValue)lastArgument
{
  return (BSObjCValue *)-[NSArray lastObject](self->_arguments, "lastObject");
}

+ (id)methodWithSelector:(uint64_t)a3 typeEncoding:
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  id v10;
  id v11;
  void *v12;
  unint64_t i;
  int v14;
  id v15;
  uint64_t v16;
  _QWORD *v17;
  id v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  id v22;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  unint64_t v33;
  void *v34;
  objc_class *v35;
  id obj;
  id v37;
  uint8_t buf[4];
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v35 = (objc_class *)objc_opt_self();
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", sel_methodWithSelector_typeEncoding_, v35, CFSTR("BSObjCRuntime.m"), 869, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("cEncoding != nil"));

  }
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "copy");

  obj = (id)v6;
  objc_msgSend(MEMORY[0x1E0CB3940], "bs_stringWithUTF8String:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DD8], "signatureWithObjCTypes:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_22;
  if (v7 && objc_msgSend(v7, "rangeOfString:", CFSTR("(")) != 0x7FFFFFFFFFFFFFFFLL)
  {
    BSLogCommon();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v29;
      _os_log_error_impl(&dword_18A184000, v21, OS_LOG_TYPE_ERROR, "Ignoring @selector(%{public}@) because it contains a union.", buf, 0xCu);

    }
    goto LABEL_21;
  }
  v9 = objc_msgSend(v8, "numberOfArguments");
  if (v9 < 2
    || (v10 = objc_retainAutorelease(v8), *(_BYTE *)objc_msgSend(v10, "getArgumentTypeAtIndex:", 0) != 64)
    || (v11 = objc_retainAutorelease(v10), *(_BYTE *)objc_msgSend(v11, "getArgumentTypeAtIndex:", 1) != 58))
  {
    BSLogCommon();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v30;
      _os_log_error_impl(&dword_18A184000, v21, OS_LOG_TYPE_ERROR, "Ignoring @selector(%{public}@) because the first two arguments are not 'self' and '_cmd'.", buf, 0xCu);

    }
LABEL_21:

    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v9;
  objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 2; i < objc_msgSend(v11, "numberOfArguments"); ++i)
  {
    v37 = 0;
    v14 = objc_msgSend(v12, "scanUpToString:intoString:", CFSTR(":"), &v37);
    v15 = v37;
    if (v14)
      objc_msgSend(v12, "scanString:intoString:", CFSTR(":"), 0);
    +[BSObjCValue valueForArgumentAtIndex:inSignature:]((uint64_t)BSObjCValue, i, v11);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (_QWORD *)v16;
    if (v16)
    {
      *(_QWORD *)(v16 + 48) = i - 2;
      v18 = v15;
      v19 = objc_msgSend(v18, "copy");
      v20 = (void *)v17[7];
      v17[7] = v19;

      objc_msgSend(v34, "addObject:", v17);
    }

  }
  if (v33 == objc_msgSend(v34, "count") + 2)
  {
    v22 = objc_alloc_init(v35);
    *((_QWORD *)v22 + 4) = a2;
    objc_storeStrong((id *)v22 + 2, obj);
    objc_storeStrong((id *)v22 + 3, v7);
    v24 = objc_msgSend(v34, "copy");
    v25 = (void *)*((_QWORD *)v22 + 5);
    *((_QWORD *)v22 + 5) = v24;

    +[BSObjCValue valueForArgumentAtIndex:inSignature:]((uint64_t)BSObjCValue, -1, v11);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)*((_QWORD *)v22 + 6);
    *((_QWORD *)v22 + 6) = v26;

    goto LABEL_23;
  }
  BSLogCommon();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v39 = v31;
    _os_log_error_impl(&dword_18A184000, v28, OS_LOG_TYPE_ERROR, "Ignoring @selector(%{public}@) because the argument count does not match the encoding.", buf, 0xCu);

  }
LABEL_22:
  v22 = 0;
LABEL_23:

  return v22;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_returnValue, 0);
  objc_storeStrong((id *)&self->_arguments, 0);
  objc_storeStrong((id *)&self->_encoding, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (BOOL)isEqual:(id)a3
{
  BSObjCMethod *v4;
  const char *v5;
  BOOL v6;

  v4 = (BSObjCMethod *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[BSObjCMethod selector](self, "selector");
      v6 = v5 == -[BSObjCMethod selector](v4, "selector");
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (SEL)selector
{
  return self->_selector;
}

- (id)copyAsOnewayVoid
{
  void *v4;
  const char *selector;
  id v6;
  void *v7;
  void *v8;
  id v9;
  objc_class *v10;
  void *v11;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  BSObjCMethod *v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (!-[BSObjCValue isVoid](self->_returnValue, "isVoid"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_returnValue isVoid]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v14 = v9;
      v15 = 2114;
      v16 = v11;
      v17 = 2048;
      v18 = self;
      v19 = 2114;
      v20 = CFSTR("BSObjCRuntime.m");
      v21 = 1024;
      v22 = 983;
      v23 = 2114;
      v24 = v8;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    __break(0);
    JUMPOUT(0x18A195F58);
  }
  if (-[BSObjCValue isOneWay](self->_returnValue, "isOneWay"))
    return self;
  objc_msgSend(CFSTR("V"), "stringByAppendingString:", self->_encoding);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  selector = self->_selector;
  v6 = objc_retainAutorelease(v4);
  +[BSObjCMethod methodWithSelector:typeEncoding:]((uint64_t)BSObjCMethod, selector, objc_msgSend(v6, "UTF8String"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)name
{
  return self->_name;
}

+ (_QWORD)_propertyGetterForValue:(const char *)a3 withSelector:
{
  id v4;
  objc_class *v5;
  objc_class *v6;
  _QWORD *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  id v19;
  objc_class *v20;
  void *v21;
  void *v22;
  id v23;
  objc_class *v24;
  void *v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  objc_class *v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = (objc_class *)objc_opt_self();
  v6 = v5;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("value"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__propertyGetterForValue_withSelector_);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v27 = v19;
      v28 = 2114;
      v29 = v21;
      v30 = 2048;
      v31 = v6;
      v32 = 2114;
      v33 = CFSTR("BSObjCRuntime.m");
      v34 = 1024;
      v35 = 935;
      v36 = 2114;
      v37 = v18;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1DF028);
  }
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("selector"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__propertyGetterForValue_withSelector_);
      v23 = (id)objc_claimAutoreleasedReturnValue();
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v27 = v23;
      v28 = 2114;
      v29 = v25;
      v30 = 2048;
      v31 = v6;
      v32 = 2114;
      v33 = CFSTR("BSObjCRuntime.m");
      v34 = 1024;
      v35 = 936;
      v36 = 2114;
      v37 = v22;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1DF12CLL);
  }
  v7 = objc_alloc_init(v5);
  v7[4] = a3;
  NSStringFromSelector(a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "copy");
  v10 = (void *)v7[2];
  v7[2] = v9;

  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "encoding");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@@:"), v12);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v7[3];
  v7[3] = v13;

  v15 = (void *)v7[5];
  v7[5] = MEMORY[0x1E0C9AA60];

  v16 = (void *)v7[6];
  v7[6] = v4;

  return v7;
}

+ (_QWORD)_propertySetterForValue:(const char *)a3 withSelector:
{
  id v4;
  objc_class *v5;
  objc_class *v6;
  _QWORD *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v20;
  id v21;
  objc_class *v22;
  void *v23;
  void *v24;
  id v25;
  objc_class *v26;
  void *v27;
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  objc_class *v34;
  __int16 v35;
  const __CFString *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = (objc_class *)objc_opt_self();
  v6 = v5;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("value"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__propertySetterForValue_withSelector_);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v30 = v21;
      v31 = 2114;
      v32 = v23;
      v33 = 2048;
      v34 = v6;
      v35 = 2114;
      v36 = CFSTR("BSObjCRuntime.m");
      v37 = 1024;
      v38 = 948;
      v39 = 2114;
      v40 = v20;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1DF3F4);
  }
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("selector"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__propertySetterForValue_withSelector_);
      v25 = (id)objc_claimAutoreleasedReturnValue();
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v30 = v25;
      v31 = 2114;
      v32 = v27;
      v33 = 2048;
      v34 = v6;
      v35 = 2114;
      v36 = CFSTR("BSObjCRuntime.m");
      v37 = 1024;
      v38 = 949;
      v39 = 2114;
      v40 = v24;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1DF4F8);
  }
  v7 = objc_alloc_init(v5);
  v7[4] = a3;
  NSStringFromSelector(a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "copy");
  v10 = (void *)v7[2];
  v7[2] = v9;

  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "encoding");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("v@:%@"), v12);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v7[3];
  v7[3] = v13;

  v28 = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v7[5];
  v7[5] = v15;

  +[BSObjCValue voidValue](BSObjCValue, "voidValue");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v7[6];
  v7[6] = v17;

  return v7;
}

- (BSObjCValue)firstArgument
{
  return (BSObjCValue *)-[NSArray firstObject](self->_arguments, "firstObject");
}

- (NSString)description
{
  return (NSString *)-[BSObjCMethod descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[BSObjCMethod succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return +[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[BSObjCMethod descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  NSArray *arguments;
  uint64_t v8;
  void *v9;
  BSObjCValue *returnValue;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  __CFString *v22;

  -[BSObjCMethod succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!self->_required)
    v6 = (id)objc_msgSend(v4, "appendObject:withName:", CFSTR("optional"), 0);
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__3;
  v21 = __Block_byref_object_dispose__3;
  v22 = &stru_1E1EC08D0;
  arguments = self->_arguments;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __54__BSObjCMethod_descriptionBuilderWithMultilinePrefix___block_invoke;
  v16[3] = &unk_1E1EBEFC8;
  v16[4] = &v17;
  -[NSArray enumerateObjectsUsingBlock:](arguments, "enumerateObjectsUsingBlock:", v16);
  v8 = objc_msgSend((id)v18[5], "length");
  v9 = (void *)MEMORY[0x1E0CB3940];
  returnValue = self->_returnValue;
  if (v8)
  {
    -[BSObjCValue _prettyTypeString](returnValue);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSObjCMethod name](self, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("-(%@)%@(%@)"), v11, v12, v18[5]);
  }
  else
  {
    -[BSObjCValue _prettyTypeString](returnValue);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSObjCMethod name](self, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("-(%@)%@"), v11, v12);
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (id)objc_msgSend(v5, "appendObject:withName:", v13, 0);
  _Block_object_dispose(&v17, 8);

  return v5;
}

void __54__BSObjCMethod_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v11 = v5;
  -[BSObjCValue _prettyTypeString](v5);
  if (a3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(", %@"), v7, v11);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingString:", v7);
  }
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

@end
