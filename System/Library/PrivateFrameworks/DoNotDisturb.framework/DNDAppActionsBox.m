@implementation DNDAppActionsBox

- (id)appConfigurationActionsForModeIdentifier
{
  void *v3;
  NSDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSDictionary count](self->_appActionsForModeIdentifier, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_appActionsForModeIdentifier;
  v5 = -[NSDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        -[NSDictionary objectForKeyedSubscript:](self->_appActionsForModeIdentifier, "objectForKeyedSubscript:", v9, (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "bs_compactMap:", &__block_literal_global_15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, v9);

      }
      v6 = -[NSDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3;
}

uint64_t __60__DNDAppActionsBox_appConfigurationActionsForModeIdentifier__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "action");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_appActionsForModeIdentifier, CFSTR("boxed"));
}

- (DNDAppActionsBox)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  DNDAppActionsBox *v11;

  v4 = a3;
  if (NSClassFromString(CFSTR("LNAction")))
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v5, "setWithObjects:", v6, v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("boxed"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_alloc_init(DNDAppActionsBox);
    -[DNDAppActionsBox setAppActionsForModeIdentifier:](v11, "setAppActionsForModeIdentifier:", v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSDictionary)appActionsForModeIdentifier
{
  return self->_appActionsForModeIdentifier;
}

- (void)setAppActionsForModeIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_appActionsForModeIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appActionsForModeIdentifier, 0);
}

@end
