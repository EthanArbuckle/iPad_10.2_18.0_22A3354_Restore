@implementation BSObjCProperty

- (unint64_t)hash
{
  return -[NSString hash](self->_name, "hash");
}

- (BSObjCMethod)getter
{
  return self->_getter;
}

- (BSObjCValue)value
{
  return self->_value;
}

- (BSObjCMethod)setter
{
  return self->_setter;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)isRequired
{
  return self->_required;
}

- (BOOL)isReadOnly
{
  return self->_readonly;
}

- (BOOL)isReadWrite
{
  return !-[BSObjCProperty isReadOnly](self, "isReadOnly");
}

- (BOOL)isAssign
{
  if (-[BSObjCProperty isCopy](self, "isCopy") || -[BSObjCProperty isStrong](self, "isStrong"))
    return 0;
  else
    return !-[BSObjCProperty isWeak](self, "isWeak");
}

- (BOOL)isCopy
{
  return self->_copy;
}

- (BOOL)isWeak
{
  return self->_weak;
}

- (BOOL)isStrong
{
  return self->_strong;
}

- (BOOL)isEqual:(id)a3
{
  BSObjCProperty *v4;
  uint64_t v5;
  BOOL v6;
  NSString *name;
  NSString *v9;
  BSObjCValue *value;
  BSObjCValue *v11;
  NSString *customGetter;
  NSString *v13;
  NSString *customSetter;
  NSString *v15;

  v4 = (BSObjCProperty *)a3;
  if (self == v4)
  {
    v6 = 1;
    goto LABEL_5;
  }
  v5 = objc_opt_class();
  if (v5 != objc_opt_class())
    goto LABEL_3;
  name = self->_name;
  v9 = v4->_name;
  if (name != v9)
  {
    v6 = 0;
    if (!name || !v9)
      goto LABEL_5;
    if (!-[NSString isEqualToString:](name, "isEqualToString:"))
      goto LABEL_3;
  }
  value = self->_value;
  v11 = v4->_value;
  if (value != v11)
  {
    v6 = 0;
    if (!value || !v11)
      goto LABEL_5;
    if (!-[BSObjCValue isEqual:](value, "isEqual:"))
      goto LABEL_3;
  }
  customGetter = self->_customGetter;
  v13 = v4->_customGetter;
  if (customGetter != v13)
  {
    v6 = 0;
    if (!customGetter || !v13)
      goto LABEL_5;
    if (!-[NSString isEqual:](customGetter, "isEqual:"))
      goto LABEL_3;
  }
  customSetter = self->_customSetter;
  v15 = v4->_customSetter;
  if (customSetter == v15)
  {
LABEL_22:
    if (!self->_nonatomic != v4->_nonatomic && !self->_weak != v4->_weak && !self->_strong != v4->_strong)
    {
      v6 = !self->_copy ^ v4->_copy;
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  v6 = 0;
  if (customSetter && v15)
  {
    if (-[NSString isEqual:](customSetter, "isEqual:"))
      goto LABEL_22;
LABEL_3:
    v6 = 0;
  }
LABEL_5:

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_customAttributes, 0);
  objc_storeStrong((id *)&self->_customSetter, 0);
  objc_storeStrong((id *)&self->_customGetter, 0);
  objc_storeStrong((id *)&self->_setter, 0);
  objc_storeStrong((id *)&self->_getter, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

+ (id)propertyWithName:(void *)a3 value:(void *)a4 attributes:
{
  id v7;
  id v8;
  id v9;
  objc_class *v10;
  id *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  NSObject *v26;
  void *v28;
  id *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  id *v33;
  objc_class *v34;
  void *v35;
  void *v36;
  id *v37;
  objc_class *v38;
  void *v39;
  _QWORD v40[13];
  uint8_t buf[4];
  id *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  objc_class *v46;
  __int16 v47;
  const __CFString *v48;
  __int16 v49;
  int v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (objc_class *)objc_opt_self();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("name"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_propertyWithName_value_attributes_);
      v29 = (id *)(id)objc_claimAutoreleasedReturnValue();
      v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v42 = v29;
      v43 = 2114;
      v44 = v31;
      v45 = 2048;
      v46 = v10;
      v47 = 2114;
      v48 = CFSTR("BSObjCRuntime.m");
      v49 = 1024;
      v50 = 603;
      v51 = 2114;
      v52 = v28;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v28), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1DE7ACLL);
  }
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("value"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_propertyWithName_value_attributes_);
      v33 = (id *)(id)objc_claimAutoreleasedReturnValue();
      v34 = (objc_class *)objc_opt_class();
      NSStringFromClass(v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v42 = v33;
      v43 = 2114;
      v44 = v35;
      v45 = 2048;
      v46 = v10;
      v47 = 2114;
      v48 = CFSTR("BSObjCRuntime.m");
      v49 = 1024;
      v50 = 604;
      v51 = 2114;
      v52 = v32;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v32), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1DE8B0);
  }
  if (!objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[attributes count]"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_propertyWithName_value_attributes_);
      v37 = (id *)(id)objc_claimAutoreleasedReturnValue();
      v38 = (objc_class *)objc_opt_class();
      NSStringFromClass(v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v42 = v37;
      v43 = 2114;
      v44 = v39;
      v45 = 2048;
      v46 = v10;
      v47 = 2114;
      v48 = CFSTR("BSObjCRuntime.m");
      v49 = 1024;
      v50 = 605;
      v51 = 2114;
      v52 = v36;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v36), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1DE9B4);
  }
  v11 = (id *)objc_alloc_init(v10);
  objc_storeStrong(v11 + 1, a3);
  objc_storeStrong(v11 + 9, a2);
  objc_msgSend(v9, "objectForKey:", CFSTR("?"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *((_BYTE *)v11 + 32) = v12 == 0;

  objc_msgSend(v9, "objectForKey:", CFSTR("N"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  *((_BYTE *)v11 + 64) = v13 != 0;

  objc_msgSend(v9, "objectForKey:", CFSTR("R"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  *((_BYTE *)v11 + 65) = v14 != 0;

  objc_msgSend(v9, "objectForKey:", CFSTR("C"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  *((_BYTE *)v11 + 66) = v15 != 0;

  objc_msgSend(v9, "objectForKey:", CFSTR("&"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  *((_BYTE *)v11 + 67) = v16 != 0;

  objc_msgSend(v9, "objectForKey:", CFSTR("W"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  *((_BYTE *)v11 + 68) = v17 != 0;

  objc_msgSend(v9, "objectForKey:", CFSTR("G"));
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v11[5];
  v11[5] = (id)v18;

  objc_msgSend(v9, "objectForKey:", CFSTR("S"));
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v11[6];
  v11[6] = (id)v20;

  v22 = (void *)objc_msgSend(v9, "mutableCopy");
  v40[0] = CFSTR("T");
  v40[1] = CFSTR("N");
  v40[2] = CFSTR("R");
  v40[3] = CFSTR("C");
  v40[4] = CFSTR("&");
  v40[5] = CFSTR("W");
  v40[6] = CFSTR("G");
  v40[7] = CFSTR("S");
  v40[8] = CFSTR("?");
  v40[9] = CFSTR("V");
  v40[10] = CFSTR("D");
  v40[11] = CFSTR("P");
  v40[12] = CFSTR("t");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 13);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "removeObjectsForKeys:", v23);

  if (objc_msgSend(v22, "count"))
  {
    v24 = objc_msgSend(v22, "copy");
    v25 = v11[7];
    v11[7] = (id)v24;

  }
  if (objc_msgSend(v11[1], "isObject")
    && objc_msgSend(v11, "isReadOnly")
    && objc_msgSend(v11, "isAssign"))
  {
    *((_BYTE *)v11 + 67) = 1;
    BSLogCommon();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v42 = v11;
      _os_log_debug_impl(&dword_18A184000, v26, OS_LOG_TYPE_DEBUG, "[rdar://101271642] Making probably-incorrect object property 'strong' instead of 'assign': %@", buf, 0xCu);
    }

  }
  return v11;
}

- (BOOL)isAtomic
{
  return !-[BSObjCProperty isNonAtomic](self, "isNonAtomic");
}

- (BOOL)isNonAtomic
{
  return self->_nonatomic;
}

- (id)customAttributeForKey:(id)a3
{
  -[NSDictionary objectForKey:](self->_customAttributes, "objectForKey:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (SEL)_getSelector
{
  void *v1;
  NSString *v2;
  SEL v3;
  NSString *v4;
  NSObject *v5;
  int v7;
  NSString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v1 = *(void **)(a1 + 40);
  if (!v1)
    v1 = *(void **)(a1 + 72);
  v2 = v1;
  v3 = NSSelectorFromString(v2);
  if (!v3)
  {
    v4 = objc_retainAutorelease(v2);
    v3 = sel_registerName(-[NSString UTF8String](v4, "UTF8String"));
    BSLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v7 = 138412290;
      v8 = v4;
      _os_log_debug_impl(&dword_18A184000, v5, OS_LOG_TYPE_DEBUG, "BSObjCProperty registering selector \"%@\", (uint8_t *)&v7, 0xCu);
    }

  }
  return v3;
}

- (SEL)_setSelector
{
  SEL v2;
  NSString *v3;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSObject *v8;
  uint8_t buf[4];
  NSString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!a1 || (objc_msgSend(a1, "isReadOnly") & 1) != 0)
    return 0;
  v3 = (NSString *)a1[6];
  if (!v3)
  {
    objc_msgSend(a1[9], "substringToIndex:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "capitalizedString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1[9], "substringFromIndex:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("set%@%@:"), v5, v6);
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  v2 = NSSelectorFromString(v3);
  if (!v2)
  {
    v7 = objc_retainAutorelease(v3);
    v2 = sel_registerName(-[NSString UTF8String](v7, "UTF8String"));
    BSLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v7;
      _os_log_debug_impl(&dword_18A184000, v8, OS_LOG_TYPE_DEBUG, "BSObjCProperty registering selector \"%@\", buf, 0xCu);
    }

  }
  return v2;
}

- (void)_reifySelectors
{
  void *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;

  if (a1)
  {
    if (!*(_QWORD *)(a1 + 16))
    {
      v2 = *(void **)(a1 + 8);
      v3 = -[BSObjCProperty _getSelector](a1);
      +[BSObjCMethod _propertyGetterForValue:withSelector:]((uint64_t)BSObjCMethod, v2, v3);
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = v4;

    }
    if (!*(_QWORD *)(a1 + 24) && !*(_BYTE *)(a1 + 65))
    {
      v6 = *(void **)(a1 + 8);
      v7 = -[BSObjCProperty _setSelector]((id *)a1);
      +[BSObjCMethod _propertySetterForValue:withSelector:]((uint64_t)BSObjCMethod, v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = v8;

    }
  }
}

- (id)copyAsReadWrite
{
  BSObjCProperty *v3;
  BSObjCValue *value;
  const char *v5;
  uint64_t v6;
  BSObjCMethod *setter;

  if (-[BSObjCProperty isReadWrite](self, "isReadWrite"))
    return self;
  v3 = objc_alloc_init(BSObjCProperty);
  objc_storeStrong((id *)&v3->_value, self->_value);
  objc_storeStrong((id *)&v3->_name, self->_name);
  v3->_required = self->_required;
  v3->_nonatomic = self->_nonatomic;
  v3->_readonly = 0;
  v3->_copy = self->_copy;
  v3->_strong = self->_strong;
  v3->_weak = self->_weak;
  objc_storeStrong((id *)&v3->_customGetter, self->_customGetter);
  objc_storeStrong((id *)&v3->_getter, self->_getter);
  value = self->_value;
  v5 = -[BSObjCProperty _setSelector]((id *)&v3->super.isa);
  +[BSObjCMethod _propertySetterForValue:withSelector:]((uint64_t)BSObjCMethod, value, v5);
  v6 = objc_claimAutoreleasedReturnValue();
  setter = v3->_setter;
  v3->_setter = (BSObjCMethod *)v6;

  objc_storeStrong((id *)&v3->_customAttributes, self->_customAttributes);
  return v3;
}

- (id)copyAddingCustomAttributes:(id)a3
{
  id v4;
  BSObjCProperty *v5;
  NSDictionary *customAttributes;
  uint64_t v7;
  NSDictionary *v8;

  v4 = a3;
  v5 = objc_alloc_init(BSObjCProperty);
  objc_storeStrong((id *)&v5->_value, self->_value);
  objc_storeStrong((id *)&v5->_name, self->_name);
  v5->_required = self->_required;
  v5->_nonatomic = self->_nonatomic;
  v5->_readonly = self->_readonly;
  v5->_copy = self->_copy;
  v5->_strong = self->_strong;
  v5->_weak = self->_weak;
  objc_storeStrong((id *)&v5->_customGetter, self->_customGetter);
  objc_storeStrong((id *)&v5->_customSetter, self->_customSetter);
  objc_storeStrong((id *)&v5->_getter, self->_getter);
  objc_storeStrong((id *)&v5->_setter, self->_setter);
  customAttributes = self->_customAttributes;
  if (customAttributes)
  {
    -[NSDictionary bs_dictionaryByAddingEntriesFromDictionary:](customAttributes, "bs_dictionaryByAddingEntriesFromDictionary:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_msgSend(v4, "copy");
  }
  v8 = v5->_customAttributes;
  v5->_customAttributes = (NSDictionary *)v7;

  return v5;
}

- (NSString)description
{
  return (NSString *)-[BSObjCProperty descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[BSObjCProperty succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  id v10;
  id v11;

  +[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("("));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BSObjCProperty isNonAtomic](self, "isNonAtomic"))
    v5 = CFSTR("nonatomic");
  else
    v5 = CFSTR("atomic");
  objc_msgSend(v4, "appendString:", v5);
  if (-[BSObjCProperty isReadWrite](self, "isReadWrite"))
    v6 = CFSTR(", readwrite");
  else
    v6 = CFSTR(", readonly");
  objc_msgSend(v4, "appendString:", v6);
  if (-[BSObjCProperty isCopy](self, "isCopy"))
  {
    v7 = CFSTR(", copy");
  }
  else if (-[BSObjCProperty isStrong](self, "isStrong"))
  {
    v7 = CFSTR(", strong");
  }
  else if (-[BSObjCProperty isWeak](self, "isWeak"))
  {
    v7 = CFSTR(", weak");
  }
  else
  {
    v7 = CFSTR(", assign");
  }
  objc_msgSend(v4, "appendString:", v7);
  if (self->_customGetter)
    objc_msgSend(v4, "appendFormat:", CFSTR(", getter=%@"), self->_customGetter);
  if (self->_customSetter)
    objc_msgSend(v4, "appendFormat:", CFSTR(", setter=%@"), self->_customSetter);
  objc_msgSend(v4, "appendString:", CFSTR(") "));
  -[BSObjCValue _prettyTypeString](self->_value);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "hasSuffix:", CFSTR("*")))
    v9 = CFSTR("%@%@");
  else
    v9 = CFSTR("%@ %@");
  objc_msgSend(v4, "appendFormat:", v9, v8, self->_name);
  if (!self->_required)
    v10 = (id)objc_msgSend(v3, "appendObject:withName:", CFSTR("optional"), 0);
  v11 = (id)objc_msgSend(v3, "appendObject:withName:", v4, 0);

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[BSObjCProperty descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  -[BSObjCProperty succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)propertyWithProperty:(objc_property *)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
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
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), a4, CFSTR("property"));
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
      v25 = 1826;
      v26 = 2114;
      v27 = v12;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1E1D90);
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "bs_stringWithUTF8String:", property_getName(a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D80], "bsobjc_attributesForProperty:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "propertyWithName:attributes:error:", v7, v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)propertyWithBuilder:(id)a3
{
  objc_msgSend(a1, "propertyWithBuilder:error:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)propertyWithBuilder:(id)a3 error:(id *)a4
{
  void (**v5)(id, void *);
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = (void (**)(id, void *))a3;
  v6 = (void *)objc_opt_new();
  v5[2](v5, v6);
  objc_msgSend(v6, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = objc_msgSend(v6, "associationPolicy");
      if (!v9)
        v9 = objc_msgSend(v7, "isObject");
      v10 = (void *)objc_opt_new();
      objc_msgSend(v10, "setObject:forKey:", &stru_1E1EC08D0, CFSTR("N"));
      if (objc_msgSend(v6, "optional"))
        objc_msgSend(v10, "setObject:forKey:", &stru_1E1EC08D0, CFSTR("?"));
      if ((unint64_t)(v9 - 1) <= 2)
        objc_msgSend(v10, "setObject:forKey:", &stru_1E1EC08D0, off_1E1EBF0D8[v9 - 1]);
      objc_msgSend(v6, "getterName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v6, "getterName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKey:", v12, CFSTR("G"));

      }
      objc_msgSend(v6, "setterName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(v6, "setterName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKey:", v14, CFSTR("S"));

      }
      +[BSObjCProperty propertyWithName:value:attributes:]((uint64_t)BSObjCProperty, v8, v7, v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[BSObjCProperty _reifySelectors]((uint64_t)v15);

    }
    else if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "bs_errorWithDomain:code:configuration:", CFSTR("BSObjCRuntime"), 1, &__block_literal_global_636);
      v15 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }

  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "bs_errorWithDomain:code:configuration:", CFSTR("BSObjCRuntime"), 1, &__block_literal_global_633);
    v15 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

uint64_t __62__BSObjCProperty_ExternalCreation__propertyWithBuilder_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setFailureDescription:", CFSTR("Property builder contains no value"));
}

uint64_t __62__BSObjCProperty_ExternalCreation__propertyWithBuilder_error___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setFailureDescription:", CFSTR("Property builder contains no name"));
}

+ (id)propertyWithName:(id)a3 attributes:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  id v17;
  objc_class *v18;
  void *v19;
  void *v20;
  id v21;
  objc_class *v22;
  void *v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("name"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v25 = v17;
      v26 = 2114;
      v27 = v19;
      v28 = 2048;
      v29 = a1;
      v30 = 2114;
      v31 = CFSTR("BSObjCRuntime.m");
      v32 = 1024;
      v33 = 1895;
      v34 = 2114;
      v35 = v16;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1E22C0);
  }
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("attributes"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v25 = v21;
      v26 = 2114;
      v27 = v23;
      v28 = 2048;
      v29 = a1;
      v30 = 2114;
      v31 = CFSTR("BSObjCRuntime.m");
      v32 = 1024;
      v33 = 1896;
      v34 = 2114;
      v35 = v20;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1E23C4);
  }
  objc_msgSend(v10, "objectForKey:", CFSTR("T"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[BSObjCValue valueWithEncoding:error:](BSObjCValue, "valueWithEncoding:error:", v12, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    +[BSObjCProperty propertyWithName:value:attributes:]((uint64_t)BSObjCProperty, v9, v13, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSObjCProperty _reifySelectors]((uint64_t)v14);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end
