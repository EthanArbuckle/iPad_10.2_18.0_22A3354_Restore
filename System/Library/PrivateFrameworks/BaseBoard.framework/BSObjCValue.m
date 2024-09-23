@implementation BSObjCValue

- (char)type
{
  return self->_type;
}

- (Class)objectClass
{
  return self->_objectClass;
}

- (int64_t)argumentIndex
{
  return self->_argumentIndex;
}

- (BOOL)isPointer
{
  return self->_type == 94;
}

- (BOOL)isXPCObject
{
  int v3;

  if (qword_1ECD398B0 != -1)
    dispatch_once(&qword_1ECD398B0, &__block_literal_global_530);
  v3 = -[BSObjCValue isObject](self, "isObject");
  if (v3)
  {
    if (-[NSArray containsObject:](self->_objectProtocols, "containsObject:", qword_1ECD398A8))
      LOBYTE(v3) = 1;
    else
      LOBYTE(v3) = -[objc_class bs_isXPCObject](self->_objectClass, "bs_isXPCObject");
  }
  return v3;
}

- (BOOL)isObject
{
  return self->_type == 64;
}

- (id)objectContainedClasses
{
  return self->_objectContainedClasses;
}

- (unint64_t)size
{
  return self->_size;
}

- (id)blockArguments
{
  return self->_blockArguments;
}

- (BOOL)isStruct
{
  return self->_type == 123;
}

+ (_QWORD)valueForArgumentAtIndex:(void *)a3 inSignature:
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  unint64_t i;
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
  uint8_t buf[4];
  id v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  const __CFString *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_self();
  if (a2 < -1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("index >= -1"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_valueForArgumentAtIndex_inSignature_);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v29 = v21;
      v30 = 2114;
      v31 = v23;
      v32 = 2048;
      v33 = v5;
      v34 = 2114;
      v35 = CFSTR("BSObjCRuntime.m");
      v36 = 1024;
      v37 = 193;
      v38 = 2114;
      v39 = v20;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
    __break(0);
    JUMPOUT(0x18A18E874);
  }
  if (objc_msgSend(v4, "numberOfArguments") <= a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("index < (NSInteger)[signature numberOfArguments]"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_valueForArgumentAtIndex_inSignature_);
      v25 = (id)objc_claimAutoreleasedReturnValue();
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v29 = v25;
      v30 = 2114;
      v31 = v27;
      v32 = 2048;
      v33 = v5;
      v34 = 2114;
      v35 = CFSTR("BSObjCRuntime.m");
      v36 = 1024;
      v37 = 194;
      v38 = 2114;
      v39 = v24;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
    __break(0);
    JUMPOUT(0x18A18E978);
  }
  v6 = objc_retainAutorelease(v4);
  v7 = v6;
  if (a2 == -1)
    v8 = objc_msgSend(v6, "methodReturnType");
  else
    v8 = objc_msgSend(v6, "getArgumentTypeAtIndex:", a2);
  +[BSObjCValue valueWithCEncoding:](v5, v8);
  v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isBlock"))
  {
    objc_msgSend(v7, "_signatureForBlockAtArgumentIndex:", a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      for (i = 1; i < objc_msgSend(v10, "numberOfArguments"); ++i)
      {
        +[BSObjCValue valueForArgumentAtIndex:inSignature:](v5, i, v10);
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = (void *)v13;
        if (v13)
        {
          *(_QWORD *)(v13 + 48) = i - 1;
          objc_msgSend(v11, "addObject:", v13);
        }

      }
      v15 = objc_msgSend(v11, "copy");
      v16 = (void *)v9[10];
      v9[10] = v15;

      +[BSObjCValue valueForArgumentAtIndex:inSignature:](v5, -1, v10);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v9[9];
      v9[9] = v17;

    }
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encoding, 0);
  objc_storeStrong((id *)&self->_blockArguments, 0);
  objc_storeStrong((id *)&self->_blockReturnValue, 0);
  objc_storeStrong((id *)&self->_argumentName, 0);
  objc_storeStrong((id *)&self->_objectContainedClasses, 0);
  objc_storeStrong((id *)&self->_objectProtocols, 0);
  objc_storeStrong((id *)&self->_unqualifiedEncoding, 0);
}

- (BOOL)isFloatingPoint
{
  return (self->_type & 0xFD) == 100;
}

- (id)structFlattenedMembers
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  BSObjCValue *v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[BSObjCValue structMembers](self, "structMembers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v15;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v8), "structFlattenedMembers", (_QWORD)v14);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v9, "count"))
            objc_msgSend(v3, "addObjectsFromArray:", v9);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      }
      while (v6);
    }

    if (objc_msgSend(v3, "count"))
      v10 = v3;
    else
      v10 = 0;
    v11 = v10;
  }
  else
  {
    v18 = self;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  return v12;
}

- (id)structMembers
{
  void *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v23;
  _QWORD v25[5];
  id v26;
  SEL v27;

  if (self->_type != 123)
  {
    v21 = 0;
    return v21;
  }
  v3 = (void *)objc_opt_new();
  -[NSString substringWithRange:](self->_encoding, "substringWithRange:", 1, -[NSString length](self->_encoding, "length") - 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v3;
  do
  {
    v5 = objc_msgSend(v4, "rangeOfString:options:", CFSTR("{"), 0);
    v6 = objc_msgSend(v4, "rangeOfString:options:", CFSTR("="), 0);
    if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v6 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v8 = v4;
        v9 = 0;
      }
      else
      {
        objc_msgSend(v4, "substringFromIndex:", v6 + v7);
        v9 = 0;
        v8 = (id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_10;
    }
    if (v5 && v6 > v5)
    {
      objc_msgSend(v4, "substringToIndex:", v5);
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "substringFromIndex:", v5);
      v8 = (id)v10;
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_10:

      v11 = objc_msgSend(v8, "length");
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __43__BSObjCValue_StructSupport__structMembers__block_invoke;
      v25[3] = &unk_1E1EBF010;
      v27 = a2;
      v25[4] = self;
      v26 = v3;
      objc_msgSend(v8, "enumerateSubstringsInRange:options:usingBlock:", 0, v11, 2, v25);

      v4 = (void *)v9;
      goto LABEL_20;
    }
    v12 = v5;
    v13 = 1;
    do
    {
      v14 = v12 + 1;
      v15 = objc_msgSend(v4, "length") + ~v12;
      v16 = objc_msgSend(v4, "rangeOfString:options:range:", CFSTR("{"), 0, v14, v15);
      v17 = objc_msgSend(v4, "rangeOfString:options:range:", CFSTR("}"), 0, v14, v15);
      if (v16 < v17)
        ++v13;
      else
        --v13;
      if (v16 >= v17)
        v12 = v17;
      else
        v12 = v16;
    }
    while (v13);
    v3 = v23;
    objc_msgSend(v4, "substringWithRange:", v5, v12 - v5 + 1);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    +[BSObjCValue _valueWithEncoding:]((uint64_t)BSObjCValue, v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObject:", v18);

    objc_msgSend(v4, "substringFromIndex:", v12 + 1);
    v19 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v19;
LABEL_20:

  }
  while (objc_msgSend(v4, "length"));
  if (objc_msgSend(v3, "count"))
    v20 = v3;
  else
    v20 = 0;
  v21 = v20;

  return v21;
}

- (BOOL)isBlock
{
  return self->_block;
}

- (unint64_t)hash
{
  return self->_type;
}

- (BOOL)isVoid
{
  return self->_type == 118;
}

- (BOOL)isOneWay
{
  return (self->_typeQualifiers >> 6) & 1;
}

- (BOOL)isEqual:(id)a3
{
  return -[NSString isEqual:](self->_encoding, "isEqual:", *((_QWORD *)a3 + 12));
}

- (BOOL)isBoolean
{
  return self->_type == 66;
}

- (NSString)encoding
{
  return self->_encoding;
}

void __41__BSObjCValue_ObjectSupport__isXPCObject__block_invoke()
{
  objc_class *v0;
  uint64_t v1;
  void *v2;
  NSString *v3;

  v0 = (objc_class *)BSXPCObjectBaseClass();
  NSStringFromClass(v0);
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  NSProtocolFromString(v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_1ECD398A8;
  qword_1ECD398A8 = v1;

}

void __43__BSObjCValue_StructSupport__structMembers__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  unsigned int v4;
  void *v5;
  id v6;
  objc_class *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  objc_class *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  objc_class *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  objc_class *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  objc_class *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  objc_class *v34;
  void *v35;
  uint64_t v36;
  id v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  const __CFString *v45;
  __int16 v46;
  int v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v37 = a2;
  if (objc_msgSend(v37, "length"))
  {
    v3 = objc_retainAutorelease(v37);
    v4 = *(unsigned __int8 *)objc_msgSend(v3, "UTF8String");
    if (v4 <= 0x5A)
    {
      switch(v4)
      {
        case '(':
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("union members are not supported"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(*(SEL *)(a1 + 48));
            v18 = (id)objc_claimAutoreleasedReturnValue();
            v19 = (objc_class *)objc_opt_class();
            NSStringFromClass(v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = 138544642;
            v39 = v18;
            v40 = 2114;
            v41 = v20;
            v42 = 2048;
            v43 = v21;
            v44 = 2114;
            v45 = CFSTR("BSObjCRuntime.m");
            v46 = 1024;
            v47 = 1525;
            v48 = 2114;
            v49 = v17;
            _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

          }
          qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
          __break(0);
          JUMPOUT(0x18A1C1440);
        case '*':
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("char * members are not supported"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(*(SEL *)(a1 + 48));
            v28 = (id)objc_claimAutoreleasedReturnValue();
            v29 = (objc_class *)objc_opt_class();
            NSStringFromClass(v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = 138544642;
            v39 = v28;
            v40 = 2114;
            v41 = v30;
            v42 = 2048;
            v43 = v31;
            v44 = 2114;
            v45 = CFSTR("BSObjCRuntime.m");
            v46 = 1024;
            v47 = 1528;
            v48 = 2114;
            v49 = v27;
            _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

          }
          qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
          __break(0);
          JUMPOUT(0x18A1C1638);
        case '?':
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unknown members are not supported"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(*(SEL *)(a1 + 48));
            v33 = (id)objc_claimAutoreleasedReturnValue();
            v34 = (objc_class *)objc_opt_class();
            NSStringFromClass(v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = 138544642;
            v39 = v33;
            v40 = 2114;
            v41 = v35;
            v42 = 2048;
            v43 = v36;
            v44 = 2114;
            v45 = CFSTR("BSObjCRuntime.m");
            v46 = 1024;
            v47 = 1529;
            v48 = 2114;
            v49 = v32;
            _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

          }
          qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v32), "UTF8String");
          __break(0);
          JUMPOUT(0x18A1C1734);
      }
    }
    else
    {
      switch(v4)
      {
        case '^':
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("pointer members are not supported"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(*(SEL *)(a1 + 48));
            v13 = (id)objc_claimAutoreleasedReturnValue();
            v14 = (objc_class *)objc_opt_class();
            NSStringFromClass(v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = 138544642;
            v39 = v13;
            v40 = 2114;
            v41 = v15;
            v42 = 2048;
            v43 = v16;
            v44 = 2114;
            v45 = CFSTR("BSObjCRuntime.m");
            v46 = 1024;
            v47 = 1524;
            v48 = 2114;
            v49 = v12;
            _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

          }
          qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
          __break(0);
          JUMPOUT(0x18A1C1344);
        case 'b':
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bitfield members are not supported"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(*(SEL *)(a1 + 48));
            v23 = (id)objc_claimAutoreleasedReturnValue();
            v24 = (objc_class *)objc_opt_class();
            NSStringFromClass(v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = 138544642;
            v39 = v23;
            v40 = 2114;
            v41 = v25;
            v42 = 2048;
            v43 = v26;
            v44 = 2114;
            v45 = CFSTR("BSObjCRuntime.m");
            v46 = 1024;
            v47 = 1526;
            v48 = 2114;
            v49 = v22;
            _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

          }
          qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
          __break(0);
          JUMPOUT(0x18A1C153CLL);
        case '[':
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("array members are not supported"));
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(*(SEL *)(a1 + 48));
            v6 = (id)objc_claimAutoreleasedReturnValue();
            v7 = (objc_class *)objc_opt_class();
            NSStringFromClass(v7);
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            v9 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = 138544642;
            v39 = v6;
            v40 = 2114;
            v41 = v8;
            v42 = 2048;
            v43 = v9;
            v44 = 2114;
            v45 = CFSTR("BSObjCRuntime.m");
            v46 = 1024;
            v47 = 1527;
            v48 = 2114;
            v49 = v5;
            _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

          }
          qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
          __break(0);
          JUMPOUT(0x18A1C11D4);
      }
    }
    v10 = *(void **)(a1 + 40);
    +[BSObjCValue _valueWithEncoding:]((uint64_t)BSObjCValue, v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v11);

  }
}

+ (id)valueWithCEncoding:(uint64_t)a1
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;
  id v8;
  objc_class *v9;
  void *v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_self();
  if (!a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("encoding"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_valueWithCEncoding_);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v12 = v8;
      v13 = 2114;
      v14 = v10;
      v15 = 2048;
      v16 = v3;
      v17 = 2114;
      v18 = CFSTR("BSObjCRuntime.m");
      v19 = 1024;
      v20 = 150;
      v21 = 2114;
      v22 = v7;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1DC908);
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "bs_stringWithUTF8String:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueWithEncoding:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BSObjCValue)_valueWithEncoding:(uint64_t)a1
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  id v12;
  const char *v13;
  int v14;
  unint64_t i;
  int v16;
  int v17;
  int v18;
  uint64_t v19;
  NSString *encoding;
  char v21;
  int type;
  void *v23;
  void *v24;
  int v25;
  NSString *v26;
  void *v27;
  void *v28;
  int v29;
  char v30;
  int v31;
  id v32;
  void *v33;
  NSString *v34;
  int v35;
  void *v36;
  Class v37;
  void *v38;
  uint64_t v39;
  NSArray *objectContainedClasses;
  uint64_t v41;
  NSArray *objectProtocols;
  _BOOL4 v43;
  void *v45;
  id v46;
  objc_class *v47;
  void *v48;
  void *v49;
  id v50;
  objc_class *v51;
  void *v52;
  void *v53;
  id v54;
  objc_class *v55;
  void *v56;
  void *v57;
  id v58;
  objc_class *v59;
  void *v60;
  void *v61;
  int v62;
  id v63;
  id v64;
  BSObjCValue *v65;
  id v66;
  id v67;
  _BYTE sizep[12];
  __int16 v69;
  void *v70;
  __int16 v71;
  uint64_t v72;
  __int16 v73;
  const __CFString *v74;
  __int16 v75;
  int v76;
  __int16 v77;
  void *v78;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = objc_opt_self();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("encoding"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__valueWithEncoding_);
      v46 = (id)objc_claimAutoreleasedReturnValue();
      v47 = (objc_class *)objc_opt_class();
      NSStringFromClass(v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)sizep = 138544642;
      *(_QWORD *)&sizep[4] = v46;
      v69 = 2114;
      v70 = v48;
      v71 = 2048;
      v72 = v3;
      v73 = 2114;
      v74 = CFSTR("BSObjCRuntime.m");
      v75 = 1024;
      v76 = 155;
      v77 = 2114;
      v78 = v45;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", sizep, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v45), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1DD02CLL);
  }
  v63 = v2;
  +[NSString bsobjc_typeQualifiers]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v63, "rangeOfCharacterFromSet:options:", v4, 10);

  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = 0;
    v7 = v63;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v63);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSString bsobjc_typeQualifiers]();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)sizep = 0;
    v10 = objc_msgSend(v8, "scanCharactersFromSet:intoString:", v9, sizep);
    v11 = *(id *)sizep;

    if (v10)
    {
      objc_msgSend(v63, "substringFromIndex:", objc_msgSend(v11, "length"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = objc_retainAutorelease(v11);
    }
    else
    {
      v6 = 0;
      v7 = v63;
    }

  }
  v12 = v6;
  if (!objc_msgSend(v7, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[unqualifiedEncoding length] > 0"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__valueWithEncoding_);
      v50 = (id)objc_claimAutoreleasedReturnValue();
      v51 = (objc_class *)objc_opt_class();
      NSStringFromClass(v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)sizep = 138544642;
      *(_QWORD *)&sizep[4] = v50;
      v69 = 2114;
      v70 = v52;
      v71 = 2048;
      v72 = v3;
      v73 = 2114;
      v74 = CFSTR("BSObjCRuntime.m");
      v75 = 1024;
      v76 = 158;
      v77 = 2114;
      v78 = v49;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", sizep, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v49), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1DD130);
  }
  v64 = objc_retainAutorelease(v7);
  v13 = (const char *)objc_msgSend(v64, "UTF8String");
  v14 = 0;
  for (i = 0; i < objc_msgSend(v12, "length"); ++i)
  {
    v16 = objc_msgSend(v12, "characterAtIndex:", i);
    if (v16 > 109)
    {
      v17 = v14 | 8;
      v18 = v14 | 1;
      if (v16 != 114)
        v18 = v14;
      if (v16 != 111)
        v17 = v18;
      if (v16 == 110)
        v14 |= 2u;
      else
        v14 = v17;
    }
    else
    {
      switch(v16)
      {
        case 'N':
          v14 |= 4u;
          break;
        case 'O':
          v14 |= 0x10u;
          break;
        case 'R':
          v14 |= 0x20u;
          break;
        case 'V':
          v14 |= 0x40u;
          break;
        default:
          continue;
      }
    }
  }
  v65 = objc_alloc_init(BSObjCValue);
  v19 = objc_msgSend(v63, "copy");
  encoding = v65->_encoding;
  v65->_encoding = (NSString *)v19;

  objc_storeStrong((id *)&v65->_unqualifiedEncoding, v64);
  if (objc_msgSend(v12, "length"))
    v21 = *(_BYTE *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
  else
    v21 = 0;
  v65->_typeQualifier = v21;
  v65->_typeQualifiers = v14;
  v65->_type = *v13;
  *(_QWORD *)sizep = 0;
  NSGetSizeAndAlignment(v13, (NSUInteger *)sizep, 0);
  v65->_size = *(_QWORD *)sizep;
  v65->_argumentIndex = 0x7FFFFFFFFFFFFFFFLL;
  v65->_block = objc_msgSend(v64, "hasPrefix:", CFSTR("@?"));
  v65->_nullability = -1;
  type = v65->_type;
  if (type == 94 || type == 64)
  {
    objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v65->_unqualifiedEncoding);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "scanUpToString:intoString:", CFSTR("\"), 0);
    if ((objc_msgSend(v23, "scanString:intoString:", CFSTR("\"), 0) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("<\"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = 0;
      v25 = objc_msgSend(v23, "scanUpToCharactersFromSet:intoString:", v24, &v67);
      v26 = (NSString *)v67;

      if (v25)
        v65->_objectClass = NSClassFromString(v26);

    }
    v62 = 0;
    v27 = 0;
    v61 = 0;
    while (1)
    {
      v28 = (void *)MEMORY[0x18D769AE0]();
      objc_msgSend(v23, "scanUpToString:intoString:", CFSTR("<"), 0);
      v29 = objc_msgSend(v23, "scanString:intoString:", CFSTR("<"), 0);
      v30 = v29;
      if (v29)
        break;
LABEL_52:
      objc_autoreleasePoolPop(v28);
      if ((v30 & 1) == 0)
      {
        v39 = objc_msgSend(v61, "copy");
        objectContainedClasses = v65->_objectContainedClasses;
        v65->_objectContainedClasses = (NSArray *)v39;

        v41 = objc_msgSend(v27, "copy");
        objectProtocols = v65->_objectProtocols;
        v65->_objectProtocols = (NSArray *)v41;

        v65->_nullability = v62;
        v43 = -[BSObjCValue isXPCObject](v65, "isXPCObject");
        if (v43
          && (-[objc_class isSubclassOfClass:](v65->_objectClass, "isSubclassOfClass:", BSXPCObjectBaseClass()) & 1) == 0)
        {
          v65->_objectClass = (Class)BSXPCObjectBaseClass();
        }

        goto LABEL_62;
      }
    }
    v66 = 0;
    v31 = objc_msgSend(v23, "scanUpToString:intoString:", CFSTR(">"), &v66);
    v32 = v66;
    v33 = v32;
    if (!v31)
    {
LABEL_51:

      goto LABEL_52;
    }
    if (!objc_msgSend(v32, "hasPrefix:", CFSTR("__"))
      || !objc_msgSend(v33, "hasSuffix:", CFSTR("__")))
    {
      NSProtocolFromString((NSString *)v33);
      v34 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (v34)
      {
        v36 = v27;
        if (!v27)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v27 = v36;
        objc_msgSend(v36, "addObject:", v34);
      }
      goto LABEL_50;
    }
    objc_msgSend(v33, "substringWithRange:", 2, objc_msgSend(v33, "length") - 4);
    v34 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (-[NSString isEqualToString:](v34, "isEqualToString:", CFSTR("nullable")))
    {
      if (v62)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot declare nullability more than once"));
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel__populateClassesAndNullability);
          v54 = (id)objc_claimAutoreleasedReturnValue();
          v55 = (objc_class *)objc_opt_class();
          NSStringFromClass(v55);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)sizep = 138544642;
          *(_QWORD *)&sizep[4] = v54;
          v69 = 2114;
          v70 = v56;
          v71 = 2048;
          v72 = (uint64_t)v65;
          v73 = 2114;
          v74 = CFSTR("BSObjCRuntime.m");
          v75 = 1024;
          v76 = 265;
          v77 = 2114;
          v78 = v53;
          _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", sizep, 0x3Au);

        }
        qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v53), "UTF8String");
        __break(0);
        JUMPOUT(0x18A1DD22CLL);
      }
      v35 = 2;
    }
    else
    {
      if (!-[NSString isEqualToString:](v34, "isEqualToString:", CFSTR("nonnull")))
      {
        v37 = NSClassFromString(v34);
        if (v37)
        {
          v38 = v61;
          if (!v61)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v61 = v38;
          objc_msgSend(v38, "addObject:", v37);
        }
        goto LABEL_50;
      }
      if (v62)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot declare nullability more than once"));
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel__populateClassesAndNullability);
          v58 = (id)objc_claimAutoreleasedReturnValue();
          v59 = (objc_class *)objc_opt_class();
          NSStringFromClass(v59);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)sizep = 138544642;
          *(_QWORD *)&sizep[4] = v58;
          v69 = 2114;
          v70 = v60;
          v71 = 2048;
          v72 = (uint64_t)v65;
          v73 = 2114;
          v74 = CFSTR("BSObjCRuntime.m");
          v75 = 1024;
          v76 = 268;
          v77 = 2114;
          v78 = v57;
          _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", sizep, 0x3Au);

        }
        qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v57), "UTF8String");
        __break(0);
        JUMPOUT(0x18A1DD328);
      }
      v35 = 1;
    }
    v62 = v35;
LABEL_50:

    goto LABEL_51;
  }
LABEL_62:

  return v65;
}

- (BOOL)hasQualifier:(char)a3
{
  char v3;

  if (a3 <= 109)
  {
    switch(a3)
    {
      case 'N':
        v3 = 4;
        return (v3 & self->_typeQualifiers) != 0;
      case 'O':
        v3 = 16;
        return (v3 & self->_typeQualifiers) != 0;
      case 'R':
        v3 = 32;
        return (v3 & self->_typeQualifiers) != 0;
      case 'V':
        v3 = 64;
        return (v3 & self->_typeQualifiers) != 0;
      default:
        return self->_typeQualifiers == 0;
    }
  }
  switch(a3)
  {
    case 'r':
      v3 = 1;
      return (v3 & self->_typeQualifiers) != 0;
    case 'o':
      v3 = 8;
      return (v3 & self->_typeQualifiers) != 0;
    case 'n':
      v3 = 2;
      return (v3 & self->_typeQualifiers) != 0;
  }
  return self->_typeQualifiers == 0;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[BSObjCValue _prettyTypeString](self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<%@>"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_prettyTypeString
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t *v15;
  const __CFString *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  const __CFString *v20;
  void *v21;
  void *v23;
  int v24;
  uint64_t *v25;
  const __CFString *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  unsigned int v35;
  _QWORD *v36;
  uint64_t v37;
  uint8x8_t v38;
  int v39;
  unint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  _QWORD v48[2];
  void (*v49)(uint64_t, uint64_t);
  void *v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  _QWORD v58[5];
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  _QWORD v65[4];
  id v66;
  char v67;

  v1 = a1;
  if (!a1)
    return v1;
  if (!objc_msgSend(a1, "isBlock"))
  {
    v59 = 0;
    v60 = &v59;
    v61 = 0x3032000000;
    v62 = __Block_byref_object_copy__3;
    v63 = __Block_byref_object_dispose__3;
    v64 = 0;
    v8 = *((id *)v1 + 1);
    v9 = 0;
    while (objc_msgSend(v8, "rangeOfString:options:", CFSTR("^"), 10) != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v8, "substringFromIndex:", 1);
      v10 = objc_claimAutoreleasedReturnValue();
      ++v9;

      v8 = (id)v10;
    }
    v11 = objc_msgSend(v8, "hasPrefix:", CFSTR("@"));
    v12 = MEMORY[0x1E0C809B0];
    if (v11)
    {
      NSStringFromClass(*((Class *)v1 + 2));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      v15 = v60;
      if (v13)
        v16 = v13;
      else
        v16 = CFSTR("id");
      v27 = (void *)v15[5];
      v15[5] = (uint64_t)v16;

      if (objc_msgSend(*((id *)v1 + 4), "count"))
      {
        objc_msgSend((id)v60[5], "stringByAppendingString:", CFSTR("<"));
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = (void *)v60[5];
        v60[5] = v28;

        v30 = (void *)*((_QWORD *)v1 + 4);
        v58[0] = v12;
        v58[1] = 3221225472;
        v58[2] = __32__BSObjCValue__prettyTypeString__block_invoke_93;
        v58[3] = &unk_1E1EBEF78;
        v58[4] = &v59;
        objc_msgSend(v30, "enumerateObjectsUsingBlock:", v58);
        objc_msgSend((id)v60[5], "stringByAppendingString:", CFSTR(">"));
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = (void *)v60[5];
        v60[5] = v31;

      }
      if (v14)
      {
        objc_msgSend((id)v60[5], "stringByAppendingString:", CFSTR(" *"));
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = (void *)v60[5];
        v60[5] = v33;

      }
      goto LABEL_67;
    }
    if (objc_msgSend(v8, "hasPrefix:", CFSTR("{")))
    {
      -[NSString bsobjc_structName](v8);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v60[5];
      v60[5] = v17;

      if (!objc_msgSend((id)v60[5], "isEqualToString:", CFSTR("?")))
        goto LABEL_68;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("struct[%zu]"), *((_QWORD *)v1 + 13));
      v19 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v60[5];
      v60[5] = v19;
LABEL_67:

LABEL_68:
      v52 = 0;
      v53 = &v52;
      v54 = 0x3032000000;
      v55 = __Block_byref_object_copy__3;
      v56 = __Block_byref_object_dispose__3;
      v57 = 0;
      v35 = objc_msgSend(v1, "typeQualifiers");
      v48[0] = v12;
      v48[1] = 3221225472;
      v49 = __32__BSObjCValue__prettyTypeString__block_invoke_2;
      v50 = &unk_1E1EBEFA0;
      v51 = &v52;
      v36 = v48;
      if (v35)
      {
        v37 = v35;
        v67 = 0;
        v38 = (uint8x8_t)vcnt_s8((int8x8_t)v35);
        v38.i16[0] = vaddlv_u8(v38);
        v39 = v38.i32[0];
        if (v38.i32[0])
        {
          v40 = 0;
          do
          {
            if (((1 << v40) & v37) != 0)
            {
              ((void (*)(_QWORD *))v49)(v36);
              if (v67)
                break;
              --v39;
            }
            if (v40 > 0x3E)
              break;
            ++v40;
          }
          while (v39 > 0);
        }
      }

      v41 = (void *)v53[5];
      if (v41)
      {
        objc_msgSend(v41, "stringByAppendingFormat:", CFSTR(" %@"), v60[5]);
        v42 = objc_claimAutoreleasedReturnValue();
        v43 = (void *)v60[5];
        v60[5] = v42;

      }
      if (v9)
      {
        objc_msgSend((id)v60[5], "stringByAppendingString:", CFSTR(" "));
        v44 = objc_claimAutoreleasedReturnValue();
        v45 = (void *)v60[5];
        v60[5] = v44;

        do
        {
          objc_msgSend((id)v60[5], "stringByAppendingString:", CFSTR("*"));
          v46 = objc_claimAutoreleasedReturnValue();
          v47 = (void *)v60[5];
          v60[5] = v46;

          --v9;
        }
        while (v9);
      }
      v1 = (id)v60[5];
      _Block_object_dispose(&v52, 8);

      _Block_object_dispose(&v59, 8);
      return v1;
    }
    objc_msgSend(v8, "substringToIndex:", 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "characterAtIndex:", 0);

    if (v24 > 90)
    {
      switch(v24)
      {
        case '^':
          v25 = v60;
          v14 = (void *)v60[5];
          v26 = CFSTR("pointer");
          goto LABEL_66;
        case '_':
        case 'a':
        case 'e':
        case 'g':
        case 'h':
        case 'j':
        case 'k':
        case 'm':
        case 'n':
        case 'o':
        case 'p':
        case 'r':
        case 't':
        case 'u':
          goto LABEL_48;
        case 'b':
          v25 = v60;
          v14 = (void *)v60[5];
          v26 = CFSTR("bitfield");
          goto LABEL_66;
        case 'c':
          v25 = v60;
          v14 = (void *)v60[5];
          v26 = CFSTR("char");
          goto LABEL_66;
        case 'd':
          v25 = v60;
          v14 = (void *)v60[5];
          v26 = CFSTR("double");
          goto LABEL_66;
        case 'f':
          v25 = v60;
          v14 = (void *)v60[5];
          v26 = CFSTR("float");
          goto LABEL_66;
        case 'i':
          v25 = v60;
          v14 = (void *)v60[5];
          v26 = CFSTR("int");
          goto LABEL_66;
        case 'l':
          v25 = v60;
          v14 = (void *)v60[5];
          v26 = CFSTR("long");
          goto LABEL_66;
        case 'q':
          v25 = v60;
          v14 = (void *)v60[5];
          v26 = CFSTR("long long");
          goto LABEL_66;
        case 's':
          v25 = v60;
          v14 = (void *)v60[5];
          v26 = CFSTR("short");
          goto LABEL_66;
        case 'v':
          v25 = v60;
          v14 = (void *)v60[5];
          v26 = CFSTR("void");
          goto LABEL_66;
        default:
          if (v24 == 91)
          {
            v25 = v60;
            v14 = (void *)v60[5];
            v26 = CFSTR("array");
          }
          else
          {
            if (v24 != 123)
              goto LABEL_48;
            v25 = v60;
            v14 = (void *)v60[5];
            v26 = CFSTR("struct");
          }
          break;
      }
      goto LABEL_66;
    }
    if (v24 > 72)
    {
      if (v24 > 80)
      {
        if (v24 == 81)
        {
          v25 = v60;
          v14 = (void *)v60[5];
          v26 = CFSTR("unsigned long long");
          goto LABEL_66;
        }
        if (v24 == 83)
        {
          v25 = v60;
          v14 = (void *)v60[5];
          v26 = CFSTR("unsigned short");
          goto LABEL_66;
        }
      }
      else
      {
        if (v24 == 73)
        {
          v25 = v60;
          v14 = (void *)v60[5];
          v26 = CFSTR("unsigned int");
          goto LABEL_66;
        }
        if (v24 == 76)
        {
          v25 = v60;
          v14 = (void *)v60[5];
          v26 = CFSTR("unsigned long");
LABEL_66:
          v25[5] = (uint64_t)v26;
          goto LABEL_67;
        }
      }
    }
    else
    {
      if (v24 > 57)
      {
        switch(v24)
        {
          case ':':
            v25 = v60;
            v14 = (void *)v60[5];
            v26 = CFSTR("SEL");
            break;
          case '@':
            v25 = v60;
            v14 = (void *)v60[5];
            v26 = CFSTR("Object");
            break;
          case 'B':
            v25 = v60;
            v14 = (void *)v60[5];
            v26 = CFSTR("BOOL");
            break;
          case 'C':
            v25 = v60;
            v14 = (void *)v60[5];
            v26 = CFSTR("unsigned char");
            break;
          default:
            goto LABEL_48;
        }
        goto LABEL_66;
      }
      switch(v24)
      {
        case '#':
          v25 = v60;
          v14 = (void *)v60[5];
          v26 = CFSTR("Class");
          goto LABEL_66;
        case '(':
          v25 = v60;
          v14 = (void *)v60[5];
          v26 = CFSTR("union");
          goto LABEL_66;
        case '*':
          v25 = v60;
          v14 = (void *)v60[5];
          v26 = CFSTR("char *");
          goto LABEL_66;
      }
    }
LABEL_48:
    v25 = v60;
    v14 = (void *)v60[5];
    v26 = CFSTR("(unknown)");
    goto LABEL_66;
  }
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", &stru_1E1EC08D0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSObjCValue _prettyTypeString](*((_QWORD *)v1 + 9));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (const __CFString *)v3;
  else
    v5 = CFSTR("?");
  objc_msgSend(v2, "appendString:", v5);

  objc_msgSend(v2, "appendString:", CFSTR("(^)("));
  v6 = objc_msgSend(*((id *)v1 + 10), "count");
  v7 = (void *)*((_QWORD *)v1 + 10);
  if (v6)
  {
    v65[0] = MEMORY[0x1E0C809B0];
    v65[1] = 3221225472;
    v65[2] = __32__BSObjCValue__prettyTypeString__block_invoke;
    v65[3] = &unk_1E1EBEF50;
    v66 = v2;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v65);

  }
  else
  {
    if (v7)
      v20 = CFSTR("void");
    else
      v20 = CFSTR("?");
    objc_msgSend(v2, "appendString:", v20);
  }
  objc_msgSend(v2, "appendString:", CFSTR(")"));
  v21 = (void *)objc_msgSend(v2, "copy");

  return v21;
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSObjCValue _prettyTypeString](self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; %@ (%@)>"), v5, self, v6, self->_encoding);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)_isIndistinguishableFromValue:(uint64_t)a1
{
  unsigned __int8 *v3;
  unsigned __int8 *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  char v18;

  v3 = a2;
  v4 = v3;
  if (!a1)
    goto LABEL_35;
  if ((unsigned __int8 *)a1 == v3)
  {
    v8 = 1;
    goto LABEL_36;
  }
  v5 = objc_opt_class();
  if (v5 != objc_opt_class() || *(_QWORD *)(a1 + 48) != *((_QWORD *)v4 + 6))
    goto LABEL_35;
  v6 = *(void **)(a1 + 56);
  v7 = (void *)*((_QWORD *)v4 + 7);
  if (v6 != v7)
  {
    v8 = 0;
    if (!v6 || !v7)
      goto LABEL_36;
    if (!objc_msgSend(v6, "isEqualToString:"))
      goto LABEL_35;
  }
  v9 = *(void **)(a1 + 96);
  v10 = (void *)*((_QWORD *)v4 + 12);
  if (v9 != v10)
  {
    v8 = 0;
    if (!v9 || !v10)
      goto LABEL_36;
    if (!objc_msgSend(v9, "isEqualToString:"))
      goto LABEL_35;
  }
  v11 = *(void **)(a1 + 8);
  v12 = (void *)*((_QWORD *)v4 + 1);
  if (v11 != v12)
  {
    v8 = 0;
    if (!v11 || !v12)
      goto LABEL_36;
    if (!objc_msgSend(v11, "isEqualToString:"))
      goto LABEL_35;
  }
  if (*(unsigned __int8 *)(a1 + 88) != v4[88]
    || *(unsigned __int8 *)(a1 + 90) != v4[90]
    || *(_QWORD *)(a1 + 104) != *((_QWORD *)v4 + 13)
    || *(_QWORD *)(a1 + 16) != *((_QWORD *)v4 + 2)
    || !BSEqualArrays(*(CFArrayRef *)(a1 + 24), *((const __CFArray **)v4 + 3))
    || !BSEqualArrays(*(CFArrayRef *)(a1 + 32), *((const __CFArray **)v4 + 4))
    || *(unsigned __int8 *)(a1 + 64) != v4[64])
  {
    goto LABEL_35;
  }
  v13 = *((_QWORD *)v4 + 9);
  if (!*(_QWORD *)(a1 + 72))
  {
    if (!v13)
      goto LABEL_30;
LABEL_35:
    v8 = 0;
    goto LABEL_36;
  }
  if (!v13 || (((uint64_t (*)(void))-[BSObjCValue _isIndistinguishableFromValue:])() & 1) == 0)
    goto LABEL_35;
LABEL_30:
  if (!BSEqualArrays(*(CFArrayRef *)(a1 + 80), *((const __CFArray **)v4 + 10)))
    goto LABEL_35;
  v14 = 0;
  do
  {
    v15 = objc_msgSend(*(id *)(a1 + 80), "count");
    v8 = v14 >= v15;
    if (v14 >= v15)
      break;
    objc_msgSend(*(id *)(a1 + 80), "objectAtIndex:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)v4 + 10), "objectAtIndex:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[BSObjCValue _isIndistinguishableFromValue:](v16, v17);

    ++v14;
  }
  while ((v18 & 1) != 0);
LABEL_36:

  return v8;
}

void __32__BSObjCValue__prettyTypeString__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v8 = v5;
  -[BSObjCValue _prettyTypeString]();
  if (a3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR(", %@"), v7, v8);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendString:", v7);
  }

}

void __32__BSObjCValue__prettyTypeString__block_invoke_93(uint64_t a1, Class aClass, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  NSStringFromClass(aClass);
  v6 = objc_claimAutoreleasedReturnValue();
  if (a3)
    objc_msgSend(v5, "stringByAppendingFormat:", CFSTR(", %@ *"), v6, v6);
  else
    objc_msgSend(v5, "stringByAppendingFormat:", CFSTR("%@ *"), v6, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

void __32__BSObjCValue__prettyTypeString__block_invoke_2(uint64_t a1, uint64_t a2)
{
  const __CFString *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  if (a2 > 15)
  {
    switch(a2)
    {
      case 16:
        v3 = CFSTR("bycopy");
        break;
      case 32:
        v3 = CFSTR("byref");
        break;
      case 64:
        v3 = CFSTR("oneway");
        break;
      default:
        return;
    }
LABEL_12:
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    if (v5)
    {
      objc_msgSend(v5, "stringByAppendingFormat:", CFSTR(" %@"), v3);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

    }
    else
    {
      *(_QWORD *)(v4 + 40) = v3;

    }
  }
  else
  {
    v3 = CFSTR("const");
    switch(a2)
    {
      case 1:
        goto LABEL_12;
      case 2:
        v3 = CFSTR("in");
        goto LABEL_12;
      case 4:
        v3 = CFSTR("inout");
        goto LABEL_12;
      case 8:
        v3 = CFSTR("out");
        goto LABEL_12;
      default:
        return;
    }
  }
}

- (char)typeQualifier
{
  return self->_typeQualifier;
}

- (unsigned)typeQualifiers
{
  return self->_typeQualifiers;
}

- (id)structName
{
  void *v2;

  -[NSString bsobjc_structName](self->_encoding);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("?")))
  {

    v2 = 0;
  }
  return v2;
}

- (id)blockReturnValue
{
  return self->_blockReturnValue;
}

- (id)objectProtocols
{
  return self->_objectProtocols;
}

- (BOOL)isObjectNullabilitySpecified
{
  return self->_nullability > 0;
}

- (BOOL)isObjectNullable
{
  return self->_nullability == 2;
}

- (BOOL)isObjectNonnull
{
  return self->_nullability == 1;
}

- (id)argumentName
{
  return self->_argumentName;
}

- (id)pointerValue
{
  void *v3;
  void *v4;

  if (-[BSObjCValue type](self, "type") == 94)
  {
    if (-[NSString length](self->_unqualifiedEncoding, "length") < 2)
    {
      +[BSObjCValue _valueWithEncoding:]((uint64_t)BSObjCValue, CFSTR("?"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[NSString substringFromIndex:](self->_unqualifiedEncoding, "substringFromIndex:", 1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      +[BSObjCValue _valueWithEncoding:]((uint64_t)BSObjCValue, v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)isVoidPointer
{
  return -[NSString isEqualToString:](self->_unqualifiedEncoding, "isEqualToString:", CFSTR("^v"));
}

+ (id)voidValue
{
  return +[BSObjCValue valueWithCEncoding:]((uint64_t)a1, (uint64_t)"v");
}

+ (id)BOOLValue
{
  return +[BSObjCValue valueWithCEncoding:]((uint64_t)a1, (uint64_t)"B");
}

+ (id)doubleValue
{
  return +[BSObjCValue valueWithCEncoding:]((uint64_t)a1, (uint64_t)"d");
}

+ (id)integerValue
{
  return +[BSObjCValue valueWithCEncoding:]((uint64_t)a1, (uint64_t)"q");
}

+ (id)unsignedIntegerValue
{
  return +[BSObjCValue valueWithCEncoding:]((uint64_t)a1, (uint64_t)"Q");
}

+ (id)valueWithEncoding:(id)a3
{
  objc_msgSend(a1, "valueWithEncoding:error:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)valueWithEncoding:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  __CFString *v10;
  void *v11;
  _QWORD v13[4];
  __CFString *v14;
  id v15;

  v6 = a3;
  v7 = v6;
  if (v6 && objc_msgSend(v6, "rangeOfString:", CFSTR("(")) != 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = CFSTR("unions or types containing unions are not supported");
  }
  else
  {
    if (objc_msgSend(v7, "length"))
    {
      v8 = objc_retainAutorelease(v7);
      NSGetSizeAndAlignment((const char *)objc_msgSend(v8, "UTF8String"), 0, 0);
      +[BSObjCValue _valueWithEncoding:]((uint64_t)a1, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 0;
      goto LABEL_10;
    }
    v10 = CFSTR("type encoding is nil or empty");
  }
  v9 = 0;
  if (a4 && v10)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __57__BSObjCValue_ExternalCreation__valueWithEncoding_error___block_invoke;
    v13[3] = &unk_1E1EBF058;
    v10 = v10;
    v14 = v10;
    v15 = v7;
    objc_msgSend(v11, "bs_errorWithDomain:code:configuration:", CFSTR("BSObjCRuntime"), 1, v13);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    v9 = 0;
  }
LABEL_10:

  return v9;
}

void __57__BSObjCValue_ExternalCreation__valueWithEncoding_error___block_invoke(uint64_t a1, void *a2)
{
  const __CFString *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setFailureDescription:", CFSTR("Unable to create value from type encoding"));
  objc_msgSend(v4, "setFailureReason:", *(_QWORD *)(a1 + 32));
  if (*(_QWORD *)(a1 + 40))
    v3 = *(const __CFString **)(a1 + 40);
  else
    v3 = CFSTR("(nil)");
  objc_msgSend(v4, "setUserInfoValue:forKey:", v3, CFSTR("BSObjCEncoding"));

}

+ (id)valueWithBuilder:(id)a3
{
  void (**v4)(id, id *);
  id *v5;
  void *v6;
  void *v7;

  v4 = (void (**)(id, id *))a3;
  v5 = (id *)objc_opt_new();
  v4[2](v4, v5);
  -[BSCompoundAssertion _identifier](v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "valueWithEncoding:error:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)valueWithBuilder:(id)a3 error:(id *)a4
{
  void (**v6)(id, id *);
  id *v7;
  void *v8;
  void *v9;

  v6 = (void (**)(id, id *))a3;
  v7 = (id *)objc_opt_new();
  v6[2](v6, v7);
  -[BSCompoundAssertion _identifier](v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "valueWithEncoding:error:", v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
