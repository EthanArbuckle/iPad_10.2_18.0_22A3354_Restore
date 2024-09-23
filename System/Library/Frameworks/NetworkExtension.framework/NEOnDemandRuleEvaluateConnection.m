@implementation NEOnDemandRuleEvaluateConnection

- (NEOnDemandRuleEvaluateConnection)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NEOnDemandRuleEvaluateConnection;
  return -[NEOnDemandRule initWithAction:](&v3, sel_initWithAction_, 3);
}

- (NEOnDemandRuleEvaluateConnection)initWithCoder:(id)a3
{
  id v4;
  NEOnDemandRuleEvaluateConnection *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *connectionRules;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NEOnDemandRuleEvaluateConnection;
  v5 = -[NEOnDemandRule initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("Rules"));
    v9 = objc_claimAutoreleasedReturnValue();
    connectionRules = v5->_connectionRules;
    v5->_connectionRules = (NSArray *)v9;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NEOnDemandRuleEvaluateConnection;
  if (-[NEOnDemandRule isEqual:](&v10, sel_isEqual_, v4))
  {
    v5 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[NEOnDemandRuleEvaluateConnection connectionRules](self, "connectionRules");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "connectionRules");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqualToArray:", v7);

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NEOnDemandRuleEvaluateConnection;
  v4 = a3;
  -[NEOnDemandRule encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[NEOnDemandRuleEvaluateConnection connectionRules](self, "connectionRules", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("Rules"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NEOnDemandRuleEvaluateConnection;
  v4 = -[NEOnDemandRule copyWithZone:](&v10, sel_copyWithZone_, a3);
  -[NEOnDemandRuleEvaluateConnection connectionRules](self, "connectionRules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0C99D20]);
    -[NEOnDemandRuleEvaluateConnection connectionRules](self, "connectionRules");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithArray:copyItems:", v7, 1);
    objc_msgSend(v4, "setConnectionRules:", v8);

  }
  return v4;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)NEOnDemandRuleEvaluateConnection;
  v5 = -[NEOnDemandRule checkValidityAndCollectErrors:](&v18, sel_checkValidityAndCollectErrors_, v4);
  -[NEOnDemandRuleEvaluateConnection connectionRules](self, "connectionRules");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[NEOnDemandRuleEvaluateConnection connectionRules](self, "connectionRules", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v5 = objc_msgSend(v12, "checkValidityAndCollectErrors:", v4);
          }
          else
          {
            +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Invalid connection rules"), v4);
            v5 = 0;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      }
      while (v9);
    }

  }
  else
  {
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Missing connection rules"), v4);
    v5 = 0;
  }

  return v5;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v5 = *(_QWORD *)&a3;
  v7 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v12.receiver = self;
  v12.super_class = (Class)NEOnDemandRuleEvaluateConnection;
  -[NEOnDemandRule descriptionWithIndent:options:](&v12, sel_descriptionWithIndent_options_, v5, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithString:", v8);

  -[NEOnDemandRuleEvaluateConnection connectionRules](self, "connectionRules");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendPrettyObject:withName:andIndent:options:", v10, CFSTR("connectionRules"), v5, a4);

  return v9;
}

- (id)copyLegacyDictionary
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)NEOnDemandRuleEvaluateConnection;
  v3 = -[NEOnDemandRule copyLegacyDictionary](&v17, sel_copyLegacyDictionary);
  -[NEOnDemandRuleEvaluateConnection connectionRules](self, "connectionRules");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[NEOnDemandRuleEvaluateConnection connectionRules](self, "connectionRules", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "copyLegacyDictionary");
          objc_msgSend(v5, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      }
      while (v8);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0CE9038]);
  }
  return v3;
}

- (id)initFromLegacyDictionary:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  void *v15;
  _QWORD *v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)NEOnDemandRuleEvaluateConnection;
  v5 = -[NEOnDemandRule initFromLegacyDictionary:](&v23, sel_initFromLegacyDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE9038]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (isa_nsarray(v6))
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      if (v8)
      {
        v9 = v8;
        v18 = v6;
        v10 = 0;
        v11 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v20 != v11)
              objc_enumerationMutation(v7);
            v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
            if (isa_nsdictionary(v13))
            {
              v14 = -[NEEvaluateConnectionRule initFromLegacyDictionary:]([NEEvaluateConnectionRule alloc], "initFromLegacyDictionary:", v13);
              if (!v10)
                v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              objc_msgSend(v10, "addObject:", v14);

            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        }
        while (v9);

        v6 = v18;
        if (!v10)
          goto LABEL_17;
        v15 = (void *)v5[7];
        v5[7] = v10;
        v7 = v10;

      }
    }
LABEL_17:
    v16 = v5;

  }
  return v5;
}

- (NSArray)connectionRules
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setConnectionRules:(NSArray *)connectionRules
{
  objc_setProperty_atomic_copy(self, a2, connectionRules, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionRules, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
