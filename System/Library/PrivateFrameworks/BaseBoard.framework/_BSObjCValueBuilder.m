@implementation _BSObjCValueBuilder

- (void)setEncoding:(id)a3
{
  id v5;
  NSString *v6;
  NSString *encoding;
  void *v8;
  id v9;
  objc_class *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  _BSObjCValueBuilder *v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v12 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("encoding != ((void *)0)"), 0);
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
      v22 = 1719;
      v23 = 2114;
      v24 = v8;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1E0F38);
  }
  v6 = (NSString *)objc_msgSend(v5, "copy");
  encoding = self->_encoding;
  self->_encoding = v6;

}

- (void)setCEncoding:(const char *)a3
{
  void *v5;
  id v6;
  objc_class *v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  _BSObjCValueBuilder *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("encoding != ((void *)0)"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v11 = v6;
      v12 = 2114;
      v13 = v8;
      v14 = 2048;
      v15 = self;
      v16 = 2114;
      v17 = CFSTR("BSObjCRuntime.m");
      v18 = 1024;
      v19 = 1724;
      v20 = 2114;
      v21 = v5;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1E10FCLL);
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "bs_stringWithUTF8String:");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[_BSObjCValueBuilder setEncoding:](self, "setEncoding:", v9);

}

- (void)setType:(char)a3
{
  void *v5;
  id v6;
  objc_class *v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  _BSObjCValueBuilder *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a3 == 63)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("type != BSObjCTypeUnknown"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v11 = v6;
      v12 = 2114;
      v13 = v8;
      v14 = 2048;
      v15 = self;
      v16 = 2114;
      v17 = CFSTR("BSObjCRuntime.m");
      v18 = 1024;
      v19 = 1729;
      v20 = 2114;
      v21 = v5;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1E12D8);
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%c"), a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[_BSObjCValueBuilder setEncoding:](self, "setEncoding:", v9);

}

- (void)setObjectType:(Class)a3
{
  void *v4;
  void *v5;
  void *v7;
  id v8;
  objc_class *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  _BSObjCValueBuilder *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB3940];
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("clazz"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v13 = v8;
      v14 = 2114;
      v15 = v10;
      v16 = 2048;
      v17 = self;
      v18 = 2114;
      v19 = CFSTR("BSObjCRuntime.m");
      v20 = 1024;
      v21 = 1734;
      v22 = 2114;
      v23 = v7;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1E14BCLL);
  }
  NSStringFromClass((Class)-[objc_class classForCoder](a3, "classForCoder"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("@\"%@\"), v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_BSObjCValueBuilder setEncoding:](self, "setEncoding:", v5);

}

- (void)setValueType:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  objc_class *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  _BSObjCValueBuilder *v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1E0CB3940];
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("value"));
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
      v22 = 1739;
      v23 = 2114;
      v24 = v8;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1E16B4);
  }
  v12 = objc_retainAutorelease(v5);
  objc_msgSend(v6, "bs_stringWithUTF8String:", objc_msgSend(v12, "objCType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_BSObjCValueBuilder setEncoding:](self, "setEncoding:", v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encoding, 0);
}

@end
