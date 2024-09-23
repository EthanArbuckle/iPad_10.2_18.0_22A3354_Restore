@implementation BSServiceSpecification

- (BSServiceSpecification)init
{
  void *v4;
  id v5;
  objc_class *v6;
  void *v7;
  BSServiceSpecification *result;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BSServiceSpecification *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("init is not allowed on BSServiceSpecification"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = self;
    v15 = 2114;
    v16 = CFSTR("BSServiceSpecification.m");
    v17 = 1024;
    v18 = 22;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (BSServiceSpecification *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)optionForKey:(id)a3
{
  -[NSDictionary objectForKey:](self->_options, "objectForKey:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (_QWORD)_initWithIdentifier:(char)a3 hiddenAtLaunch:(char)a4 derived:(void *)a5 options:
{
  id v9;
  id v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v17;
  id v18;
  objc_class *v19;
  void *v20;
  objc_super v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a5;
  if (a1)
  {
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("identifier != ((void *)0)"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__initWithIdentifier_hiddenAtLaunch_derived_options_);
        v18 = (id)objc_claimAutoreleasedReturnValue();
        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v23 = v18;
        v24 = 2114;
        v25 = v20;
        v26 = 2048;
        v27 = a1;
        v28 = 2114;
        v29 = CFSTR("BSServiceSpecification.m");
        v30 = 1024;
        v31 = 39;
        v32 = 2114;
        v33 = v17;
        _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A7DC598);
    }
    v21.receiver = a1;
    v21.super_class = (Class)BSServiceSpecification;
    v11 = objc_msgSendSuper2(&v21, sel_init);
    if (v11)
    {
      v12 = objc_msgSend(v9, "copy");
      v13 = (void *)v11[3];
      v11[3] = v12;

      *((_BYTE *)v11 + 17) = a3;
      *((_BYTE *)v11 + 16) = a4;
      v14 = objc_msgSend(v10, "copy");
      v15 = (void *)v11[1];
      v11[1] = v14;

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_appendManagerDumpBodyToBuilder:(void *)a3 withMultilinePrefix:
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (a1)
    -[BSServiceSpecification _appendBodySectionIfNecessaryToBuilder:withName:multilinePrefix:includeDerived:](a1, v6, CFSTR("specification"), v5, 1);

}

- (void)_appendBodySectionIfNecessaryToBuilder:(void *)a3 withName:(void *)a4 multilinePrefix:(int)a5 includeDerived:
{
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  char v15;

  v11 = a2;
  v9 = a3;
  v10 = a4;
  if (a1
    && (a5 && *(_BYTE *)(a1 + 16)
     || (objc_msgSend((id)a1, "isHiddenAtLaunch", v11) & 1) != 0
     || objc_msgSend(*(id *)(a1 + 8), "count")))
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __105__BSServiceSpecification__appendBodySectionIfNecessaryToBuilder_withName_multilinePrefix_includeDerived___block_invoke;
    v12[3] = &unk_1E390D3C0;
    v15 = a5;
    v13 = v11;
    v14 = a1;
    objc_msgSend(v13, "appendBodySectionWithName:multilinePrefix:block:", v9, v10, v12);

  }
}

- (unint64_t)hash
{
  return -[NSString hash](self->_identifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  BSServiceSpecification *v4;
  uint64_t v5;
  char v6;

  v4 = (BSServiceSpecification *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class()
      && BSEqualStrings()
      && self->_hiddenAtLaunch == v4->_hiddenAtLaunch
      && self->_derived == v4->_derived)
    {
      v6 = BSEqualObjects();
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (NSString)description
{
  return (NSString *)-[BSServiceSpecification descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[BSServiceSpecification succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  _BOOL4 derived;
  void *identifier;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  derived = self->_derived;
  if (self->_derived)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@)"), self->_identifier);
    identifier = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    identifier = self->_identifier;
  }
  objc_msgSend(v3, "appendString:withName:", identifier, 0);
  if (derived)

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[BSServiceSpecification descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[BSServiceSpecification succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSServiceSpecification _appendBodySectionIfNecessaryToBuilder:withName:multilinePrefix:includeDerived:]((uint64_t)self, v5, 0, v4, 0);

  return v5;
}

uint64_t __105__BSServiceSpecification__appendBodySectionIfNecessaryToBuilder_withName_multilinePrefix_includeDerived___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  if (*(_BYTE *)(a1 + 48))
    v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("Derived"), 1);
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 40), "isHiddenAtLaunch"), CFSTR("HiddenAtLaunch"), 1);
  return objc_msgSend(*(id *)(a1 + 32), "appendDictionarySection:withName:skipIfEmpty:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("Options"), 1);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)isDerived
{
  return self->_derived;
}

- (BOOL)isHiddenAtLaunch
{
  return self->_hiddenAtLaunch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

@end
