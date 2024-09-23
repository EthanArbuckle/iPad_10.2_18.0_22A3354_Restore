@implementation CSAppearance

+ (CSAppearance)appearanceWithIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:", v4);

  return (CSAppearance *)v5;
}

+ (id)appearanceForProvider:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "appearanceIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "appearanceWithIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "components");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setComponents:", v7);

    objc_msgSend(v4, "legibilitySettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setLegibilitySettings:", v8);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (CSAppearance)initWithIdentifier:(id)a3
{
  id v5;
  CSAppearance *v6;
  NSMutableSet *v7;
  NSMutableSet *components;
  uint64_t v9;
  NSString *identifier;
  _UILegibilitySettings *legibilitySettings;
  void *v13;
  objc_super v14;

  v5 = a3;
  NSClassFromString(CFSTR("NSString"));
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[CSAppearance initWithIdentifier:].cold.1(a2);
LABEL_11:
    objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D042AEBCLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[CSAppearance initWithIdentifier:].cold.1(a2);
    goto LABEL_11;
  }

  v14.receiver = self;
  v14.super_class = (Class)CSAppearance;
  v6 = -[CSAppearance init](&v14, sel_init);
  if (v6)
  {
    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    components = v6->_components;
    v6->_components = v7;

    v9 = objc_msgSend(v5, "copy");
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v9;

    legibilitySettings = v6->_legibilitySettings;
    v6->_legibilitySettings = 0;

  }
  return v6;
}

- (void)reset
{
  _UILegibilitySettings *legibilitySettings;

  legibilitySettings = self->_legibilitySettings;
  self->_legibilitySettings = 0;

  -[NSMutableSet removeAllObjects](self->_components, "removeAllObjects");
}

- (void)unionAppearance:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "legibilitySettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_storeStrong((id *)&self->_legibilitySettings, v5);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(v4, "components", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[CSAppearance addComponent:](self, "addComponent:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (BOOL)isEqualToAppearance:(id)a3
{
  CSAppearance *v4;
  _BOOL4 transitional;
  void *v6;
  char v7;
  _UILegibilitySettings *legibilitySettings;
  _BOOL4 v9;
  BOOL v10;
  NSMutableSet *components;
  void *v12;

  v4 = (CSAppearance *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else if (-[CSAppearance isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class())
         && (transitional = self->_transitional, transitional == -[CSAppearance isTransitional](v4, "isTransitional")))
  {
    -[CSAppearance legibilitySettings](v4, "legibilitySettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    legibilitySettings = self->_legibilitySettings;
    if (v6)
      v9 = 1;
    else
      v9 = legibilitySettings == 0;
    if (legibilitySettings)
      v10 = 0;
    else
      v10 = v6 != 0;
    if (v9 && !v10)
    {
      if (legibilitySettings
        && !-[_UILegibilitySettings sb_isEqualToLegibilitySettings:](legibilitySettings, "sb_isEqualToLegibilitySettings:", v6))
      {
        v7 = 0;
      }
      else
      {
        components = self->_components;
        -[CSAppearance components](v4, "components");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = -[NSMutableSet isEqual:](components, "isEqual:", v12);

      }
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)componentForType:(int64_t)a3 identifier:(id)a4
{
  id v6;
  NSMutableSet *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = self->_components;
  v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v12, "type", (_QWORD)v17) == a3)
        {
          objc_msgSend(v12, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = BSEqualObjects();

          if (v14)
          {
            v15 = v12;
            goto LABEL_12;
          }
        }
      }
      v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_12:

  return v15;
}

- (id)componentForType:(int64_t)a3 property:(unint64_t)a4
{
  NSMutableSet *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = self->_components;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v12, "type", (_QWORD)v16) == a3 && (a4 & ~objc_msgSend(v12, "properties")) == 0)
        {
          if (!v9 || (v13 = objc_msgSend(v12, "priority"), v13 > objc_msgSend(v9, "priority")))
          {
            v14 = v12;

            v9 = v14;
          }
        }
      }
      v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (int64_t)flagForComponentType:(int64_t)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  -[CSAppearance componentForType:property:](self, "componentForType:property:", a3, 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "flag");
  else
    v5 = 0x7FFFFFFFFFFFFFFFLL;

  return v5;
}

- (void)addComponent:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  if (a3)
  {
    v6 = (id)objc_msgSend(a3, "copy");
    objc_msgSend(v6, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      -[CSAppearance identifier](self, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setIdentifier:", v5);

    }
    -[NSMutableSet addObject:](self->_components, "addObject:", v6);

  }
}

- (void)removeComponent:(id)a3
{
  if (a3)
    -[NSMutableSet removeObject:](self->_components, "removeObject:");
}

- (void)removeAllComponentsWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (void *)-[NSMutableSet copy](self->_components, "copy", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v10, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = BSEqualObjects();

        if (v12)
          -[NSMutableSet removeObject:](self->_components, "removeObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

- (void)setComponents:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableSet removeAllObjects](self->_components, "removeAllObjects");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[CSAppearance addComponent:](self, "addComponent:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (unint64_t)hash
{
  return 0;
}

- (NSString)description
{
  return (NSString *)-[CSAppearance descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  objc_msgSend((id)objc_opt_class(), "appearanceForProvider:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTransitional:", -[CSAppearance isTransitional](self, "isTransitional"));
  return v4;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[CSAppearance succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_identifier, CFSTR("ID"));
  v5 = (id)objc_msgSend(v3, "appendBool:withName:", self->_transitional, CFSTR("transitional"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[CSAppearance descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  CSAppearance *v11;

  v4 = a3;
  -[CSAppearance succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__CSAppearance_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E8E2DC00;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

void __54__CSAppearance_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "succinctDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:skipIfNil:", v3, CFSTR("legibilitySettings"), 1);

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("priority"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingDescriptors:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendArraySection:withName:skipIfEmpty:", v9, CFSTR("components"), 1);

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isTransitional
{
  return self->_transitional;
}

- (void)setTransitional:(BOOL)a3
{
  self->_transitional = a3;
}

- (NSSet)components
{
  return &self->_components->super;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (void)setLegibilitySettings:(id)a3
{
  objc_storeStrong((id *)&self->_legibilitySettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_components, 0);
}

- (void)initWithIdentifier:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_7();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3(&dword_1D0337000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_5();
}

@end
