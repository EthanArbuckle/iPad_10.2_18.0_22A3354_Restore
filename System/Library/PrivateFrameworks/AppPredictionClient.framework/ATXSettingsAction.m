@implementation ATXSettingsAction

- (ATXSettingsAction)initWithProactiveSuggestion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  Class v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  Class v12;
  id v13;
  void *v14;
  ATXSettingsAction *v15;
  id v16;
  void *v17;

  v4 = a3;
  objc_msgSend(v4, "executableSpecification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "executableObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = NSClassFromString(CFSTR("ATXAction"));
  v8 = v6;
  if (v7)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;

  if (v10)
  {
    objc_msgSend(v10, "intent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = NSClassFromString(CFSTR("INAppIntent"));
    v13 = v11;
    if (v12)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v14 = v13;
      else
        v14 = 0;
    }
    else
    {
      v14 = 0;
    }
    v16 = v14;

    if (v16)
    {
      objc_msgSend(v16, "linkAction");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        self = -[ATXSettingsAction initWithProactiveSuggestion:action:date:](self, "initWithProactiveSuggestion:action:date:", v4, v17, 0);
        v15 = self;
      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (ATXSettingsAction)initWithAction:(id)a3
{
  return -[ATXSettingsAction initWithProactiveSuggestion:action:date:](self, "initWithProactiveSuggestion:action:date:", 0, a3, 0);
}

- (ATXSettingsAction)initWithAction:(id)a3 date:(id)a4
{
  return -[ATXSettingsAction initWithProactiveSuggestion:action:date:](self, "initWithProactiveSuggestion:action:date:", 0, a3, a4);
}

- (ATXSettingsAction)initWithProactiveSuggestion:(id)a3 action:(id)a4 date:(id)a5
{
  id v10;
  id v11;
  id v12;
  ATXSettingsAction *v13;
  ATXSettingsAction *v14;
  void *v16;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXSettingsAction.m"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("action != nil"));

  }
  v17.receiver = self;
  v17.super_class = (Class)ATXSettingsAction;
  v13 = -[ATXSettingsAction init](&v17, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_proactiveSuggestion, a3);
    objc_storeStrong((id *)&v14->_linkAction, a4);
    objc_storeStrong((id *)&v14->_date, a5);
  }

  return v14;
}

- (id)description
{
  id v3;
  void *v4;
  NSDate *date;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[LNAction description](self->_linkAction, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  date = self->_date;
  -[ATXProactiveSuggestion scoreSpecification](self->_proactiveSuggestion, "scoreSpecification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rawScore");
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("Action: %@; Date: %@; Score: %f"), v4, date, v7);

  return v8;
}

- (id)_navigationLink
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  Class v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  Class v26;
  id v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;

  -[LNAction parameters](self->_linkAction, "parameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_pas_filteredArrayWithTest:", &__block_literal_global_51);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = NSClassFromString(CFSTR("LNEntity"));
    v9 = v7;
    if (v8)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 = v9;
      else
        v10 = 0;
    }
    else
    {
      v10 = 0;
    }
    v11 = v10;

    if (v11)
    {
      -[NSObject properties](v11, "properties");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "_pas_filteredArrayWithTest:", &__block_literal_global_32_0);
      v21 = objc_claimAutoreleasedReturnValue();

      -[NSObject firstObject](v21, "firstObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v22)
      {
        objc_msgSend(v22, "value");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "value");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = NSClassFromString(CFSTR("NSURL"));
        v27 = v25;
        if (v26)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v28 = v27;
          else
            v28 = 0;
        }
        else
        {
          v28 = 0;
        }
        v29 = v28;

        if (v29)
        {
          v29 = v29;
          v19 = v29;
        }
        else
        {
          __atxlog_handle_settings_actions();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
            -[ATXSettingsAction _navigationLink].cold.4(v23);

          v19 = 0;
        }
      }
      else
      {
        __atxlog_handle_settings_actions();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
          -[ATXSettingsAction _navigationLink].cold.3(v29, v30, v31, v32, v33, v34, v35, v36);
        v19 = 0;
      }

    }
    else
    {
      __atxlog_handle_settings_actions();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        -[ATXSettingsAction _navigationLink].cold.2(v5);
      v19 = 0;
    }

  }
  else
  {
    __atxlog_handle_settings_actions();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[ATXSettingsAction _navigationLink].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);
    v19 = 0;
  }

  return v19;
}

uint64_t __36__ATXSettingsAction__navigationLink__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("target"));

  return v3;
}

uint64_t __36__ATXSettingsAction__navigationLink__block_invoke_31(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("navigationLink"));

  return v3;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[ATXSettingsAction _navigationLink](self, "_navigationLink");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  ATXSettingsAction *v4;
  ATXSettingsAction *v5;
  BOOL v6;

  v4 = (ATXSettingsAction *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXSettingsAction isEqualToATXSettingsAction:](self, "isEqualToATXSettingsAction:", v5);

  return v6;
}

- (BOOL)isEqualToATXSettingsAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ATXSettingsAction _navigationLink](self, "_navigationLink");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_navigationLink");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqual:", v6);
  return (char)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  ATXProactiveSuggestion *proactiveSuggestion;
  id v5;

  proactiveSuggestion = self->_proactiveSuggestion;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", proactiveSuggestion, CFSTR("proactiveSuggestion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_linkAction, CFSTR("action"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_date, CFSTR("date"));

}

- (ATXSettingsAction)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  ATXSettingsAction *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("action"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("proactiveSuggestion"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[ATXSettingsAction initWithProactiveSuggestion:action:date:](self, "initWithProactiveSuggestion:action:date:", v6, v5, v7);

    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)isActionEligibleForSettingsSuggestions:(id)a3
{
  id v4;
  void *v5;
  Class v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  char v12;

  v4 = a3;
  objc_msgSend(v4, "intent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = NSClassFromString(CFSTR("INAppIntent"));
  v7 = v5;
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  if (v9)
  {
    objc_msgSend(v4, "bundleId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appIntentIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(a1, "isActionEligibleForSettingsSuggestionsWithBundleIdentifier:actionIdentifier:", v10, v11);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (BOOL)isActionEligibleForSettingsSuggestionsWithBundleIdentifier:(id)a3 actionIdentifier:(id)a4
{
  id v5;
  id v6;
  char v7;
  char v8;
  char v9;
  char v10;
  Boolean keyExistsAndHasValidFormat;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "hasPrefix:", CFSTR("com.apple.")))
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("SettingsNavigationEventDonationIntent"));
  else
    v7 = 0;
  v8 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.DEC.PredictionAnalyzer"));
  if (objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild"))
  {
    keyExistsAndHasValidFormat = 0;
    if (CFPreferencesGetAppBooleanValue(CFSTR("usePredictionsAppForTestingSettingsActions"), (CFStringRef)*MEMORY[0x1E0CF9510], &keyExistsAndHasValidFormat))
    {
      v9 = v8;
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }
  v10 = v7 | v9;

  return v10;
}

- (LNAction)linkAction
{
  return self->_linkAction;
}

- (ATXProactiveSuggestion)proactiveSuggestion
{
  return self->_proactiveSuggestion;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_proactiveSuggestion, 0);
  objc_storeStrong((id *)&self->_linkAction, 0);
}

- (void)_navigationLink
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  objc_msgSend(a1, "value");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_class();
  v4 = OUTLINED_FUNCTION_2_7(v3);
  OUTLINED_FUNCTION_0_3(&dword_1A49EF000, v5, v6, "Settings action does not have a navigation link containing a URL anymore; actual: %@",
    v7,
    v8,
    v9,
    v10,
    v11);

  OUTLINED_FUNCTION_5_0();
}

@end
