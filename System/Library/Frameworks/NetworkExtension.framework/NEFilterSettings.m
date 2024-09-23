@implementation NEFilterSettings

- (NEFilterSettings)initWithRules:(NSArray *)rules defaultAction:(NEFilterAction)defaultAction
{
  NSArray *v6;
  NEFilterSettings *v7;
  uint64_t v8;
  NSArray *v9;
  objc_super v11;

  v6 = rules;
  v11.receiver = self;
  v11.super_class = (Class)NEFilterSettings;
  v7 = -[NEFilterSettings init](&v11, sel_init);
  if (v7)
  {
    v8 = -[NSArray copy](v6, "copy");
    v9 = v7->_rules;
    v7->_rules = (NSArray *)v8;

    v7->_defaultAction = defaultAction;
  }

  return v7;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4;
  int64_t defaultAction;
  NSUInteger v6;
  int v7;
  void *v8;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  defaultAction = self->_defaultAction;
  if ((unint64_t)(defaultAction - 1) > 1)
  {
    v7 = 1;
  }
  else
  {
    v6 = -[NSArray count](self->_rules, "count");
    v7 = v6 != 0;
    if (!v6)
    {
      NEResourcesCopyLocalizedNSString(CFSTR("FILTER_SETTINGS_ERROR_INVALID"), CFSTR("FILTER_SETTINGS_ERROR_INVALID"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v8);

    }
    defaultAction = self->_defaultAction;
  }
  if (defaultAction == 3 || defaultAction == 0)
  {
    NEResourcesCopyLocalizedNSString(CFSTR("FILTER_SETTINGS_ERROR_INVALID_ACTION"), CFSTR("FILTER_SETTINGS_ERROR_INVALID_ACTION"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v10);

    v7 = 0;
  }
  if (-[NSArray count](self->_rules, "count") >= 0x3E9)
  {
    v11 = objc_alloc(MEMORY[0x1E0CB3940]);
    NEResourcesCopyLocalizedNSString(CFSTR("FILTER_SETTINGS_ERROR_TOO_MANY_RULES"), CFSTR("FILTER_SETTINGS_ERROR_TOO_MANY_RULES"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithFormat:", v12, 1000);
    objc_msgSend(v4, "addObject:", v13);

    v7 = 0;
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v14 = self->_rules;
  v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v21 != v17)
          objc_enumerationMutation(v14);
        v7 &= objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "checkValidityAndCollectErrors:", v4);
      }
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v16);
  }

  return v7;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  void *v7;
  void *v8;
  void *v9;

  v5 = *(_QWORD *)&a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 0);
  -[NEFilterSettings rules](self, "rules");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v8, CFSTR("rules"), v5, a4);

  +[NEFilterProvider descriptionForAction:]((uint64_t)NEFilterProvider, self->_defaultAction);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v9, CFSTR("defaultAction"), v5, a4);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *rules;
  id v5;

  rules = self->_rules;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", rules, CFSTR("rules"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_defaultAction, CFSTR("defaultAction"));

}

- (NEFilterSettings)initWithCoder:(id)a3
{
  id v4;
  NEFilterSettings *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *rules;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NEFilterSettings;
  v5 = -[NEFilterSettings init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("rules"));
    v9 = objc_claimAutoreleasedReturnValue();
    rules = v5->_rules;
    v5->_rules = (NSArray *)v9;

    v5->_defaultAction = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("defaultAction"));
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[NEFilterSettings initWithRules:defaultAction:](+[NEFilterSettings allocWithZone:](NEFilterSettings, "allocWithZone:", a3), "initWithRules:defaultAction:", self->_rules, self->_defaultAction);
}

- (NSArray)rules
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (NEFilterAction)defaultAction
{
  return self->_defaultAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rules, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
