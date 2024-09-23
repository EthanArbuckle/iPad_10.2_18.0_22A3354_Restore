@implementation BSMutableObjCProtocol

+ (id)protocolWithName:(id)a3
{
  id v5;
  BSMutableObjCProtocol *v6;
  uint64_t v7;
  NSString *name;
  uint64_t v9;
  NSMutableArray *properties;
  void *v12;
  id v13;
  objc_class *v14;
  void *v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("name"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v17 = v13;
      v18 = 2114;
      v19 = v15;
      v20 = 2048;
      v21 = a1;
      v22 = 2114;
      v23 = CFSTR("BSObjCRuntime.m");
      v24 = 1024;
      v25 = 1450;
      v26 = 2114;
      v27 = v12;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1E07F0);
  }
  v6 = [BSMutableObjCProtocol alloc];
  v7 = objc_msgSend(v5, "copy");
  name = v6->_name;
  v6->_name = (NSString *)v7;

  v9 = objc_opt_new();
  properties = v6->_properties;
  v6->_properties = (NSMutableArray *)v9;

  return v6;
}

- (id)properties
{
  return self->_properties;
}

- (void)addProperty:(id)a3
{
  id v5;
  void *v6;
  id v7;
  objc_class *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  BSMutableObjCProtocol *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v10 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("property != ((void *)0)"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v12 = v7;
      v13 = 2114;
      v14 = v9;
      v15 = 2048;
      v16 = self;
      v17 = 2114;
      v18 = CFSTR("BSObjCRuntime.m");
      v19 = 1024;
      v20 = 1462;
      v21 = 2114;
      v22 = v6;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1E09C8);
  }
  -[NSMutableArray addObject:](self->_properties, "addObject:", v5);
  -[BSObjCProperty _reifySelectors]((uint64_t)v10);

}

- (void)removeProperty:(id)a3
{
  id v5;
  void *v6;
  id v7;
  objc_class *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  BSMutableObjCProtocol *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v10 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("property != ((void *)0)"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v12 = v7;
      v13 = 2114;
      v14 = v9;
      v15 = 2048;
      v16 = self;
      v17 = 2114;
      v18 = CFSTR("BSObjCRuntime.m");
      v19 = 1024;
      v20 = 1470;
      v21 = 2114;
      v22 = v6;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1E0B88);
  }
  -[NSMutableArray removeObject:](self->_properties, "removeObject:", v5);

}

- (id)copy
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BSMutableObjCProtocol;
  return -[BSMutableObjCProtocol copy](&v3, sel_copy);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[BSObjCProtocol _initWithName:protocol:inherited:methods:properties:virtual:]((id *)[BSObjCProtocol alloc], self->_name, 0, 0, 0, self->_properties, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
