@implementation ATXShortcutsAction

- (id)contextualActionGetDirections
{
  void *v3;
  char isKindOfClass;
  void *v5;

  -[ATXShortcutsAction contextualAction](self, "contextualAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[ATXShortcutsAction contextualAction](self, "contextualAction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (ATXShortcutsAction)initWithContextualAction:(id)a3 criteria:(id)a4
{
  id v7;
  id v8;
  ATXShortcutsAction *v9;
  ATXShortcutsAction *v10;
  ATXActionCriteria *v11;
  ATXActionCriteria *criteria;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ATXShortcutsAction;
  v9 = -[ATXShortcutsAction init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contextualAction, a3);
    if (v8)
      v11 = (ATXActionCriteria *)v8;
    else
      v11 = (ATXActionCriteria *)objc_opt_new();
    criteria = v10->_criteria;
    v10->_criteria = v11;

  }
  return v10;
}

- (ATXActionCriteria)criteria
{
  ATXActionCriteria *criteria;

  criteria = self->_criteria;
  if (criteria)
    return criteria;
  else
    return (ATXActionCriteria *)(id)objc_opt_new();
}

- (CSSearchableItem)searchableItem
{
  void *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v3 = 0;
  }
  else
  {
    -[WFContextualAction spotlightItem](self->_contextualAction, "spotlightItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (CSSearchableItem *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!a3)
  {
    objc_msgSend(v12, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v14 = 1;
      goto LABEL_7;
    }
    if ((objc_msgSend(v12, "containsValueForKey:", v11) & 1) == 0)
    {
      v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v21 = *MEMORY[0x1E0CB2D50];
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode key %@"), v11, v21);
      v22[0] = v17;
      v14 = 1;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v16, "initWithDomain:code:userInfo:", v13, a7, v18);

      objc_msgSend(v12, "failWithError:", v19);
      goto LABEL_7;
    }
  }
  v14 = 0;
LABEL_7:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  WFContextualAction *contextualAction;
  id v5;

  contextualAction = self->_contextualAction;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", contextualAction, CFSTR("KEY_CONTEXTUALACTION"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_criteria, CFSTR("KEY_ACTION_CRITERIA"));

}

- (ATXShortcutsAction)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  ATXShortcutsAction *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D81610];
  v6 = objc_opt_class();
  __atxlog_handle_default();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v6, CFSTR("KEY_CONTEXTUALACTION"), v4, 1, CFSTR("com.apple.duetexpertd.ATXShortcutsAction"), -1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  if (!v9 && v8)
  {
    v11 = (void *)MEMORY[0x1E0D81610];
    v12 = objc_opt_class();
    __atxlog_handle_default();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v12, CFSTR("KEY_ACTION_CRITERIA"), v4, 0, CFSTR("com.apple.duetexpertd.ATXShortcutsAction"), -1, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v10 = 0;
    }
    else
    {
      self = -[ATXShortcutsAction initWithContextualAction:criteria:](self, "initWithContextualAction:criteria:", v8, v14);
      v10 = self;
    }

  }
  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[WFContextualAction displayString](self->_contextualAction, "displayString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[WFContextualAction uniqueIdentifier](self->_contextualAction, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") - v4 + 32 * v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  ATXShortcutsAction *v4;
  ATXShortcutsAction *v5;
  BOOL v6;

  v4 = (ATXShortcutsAction *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXShortcutsAction isEqualToAction:](self, "isEqualToAction:", v5);

  return v6;
}

- (BOOL)isEqualToAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = a3;
  -[WFContextualAction displayString](self->_contextualAction, "displayString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contextualAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqual:", v7);

  if (v8)
  {
    -[WFContextualAction uniqueIdentifier](self->_contextualAction, "uniqueIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contextualAction");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uniqueIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "isEqual:", v11);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (WFContextualAction)contextualAction
{
  return self->_contextualAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextualAction, 0);
  objc_storeStrong((id *)&self->_criteria, 0);
}

@end
