@implementation CERecommendation

- (CERecommendation)initWithIdentifier:(id)a3 title:(id)a4 message:(id)a5 bundleID:(id)a6 storageRecoverable:(id)a7 category:(id)a8 actions:(id)a9
{
  id v16;
  id v17;
  CERecommendation *v18;
  CERecommendation *v19;
  NSString *subTitle;
  NSString *status;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  objc_super v28;

  v27 = a3;
  v26 = a4;
  v25 = a5;
  v24 = a6;
  v23 = a7;
  v16 = a8;
  v17 = a9;
  v28.receiver = self;
  v28.super_class = (Class)CERecommendation;
  v18 = -[CERecommendation init](&v28, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_identifier, a3);
    objc_storeStrong((id *)&v19->_title, a4);
    subTitle = v19->_subTitle;
    v19->_subTitle = (NSString *)&stru_2509E1860;

    objc_storeStrong((id *)&v19->_message, a5);
    objc_storeStrong((id *)&v19->_bundleID, a6);
    objc_storeStrong((id *)&v19->_storageRecoverable, a7);
    objc_storeStrong((id *)&v19->_category, a8);
    objc_storeStrong((id *)&v19->_actions, a9);
    v19->_completed = 0;
    status = v19->_status;
    v19->_status = 0;

  }
  return v19;
}

- (CERecommendation)initWithIdentifier:(id)a3 title:(id)a4 subtitle:(id)a5 message:(id)a6 bundleID:(id)a7 storageRecoverable:(id)a8 category:(id)a9 actions:(id)a10
{
  id v17;
  CERecommendation *v18;
  CERecommendation *v19;
  NSString *status;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  objc_super v29;

  v28 = a3;
  v27 = a4;
  v26 = a5;
  v25 = a6;
  v24 = a7;
  v23 = a8;
  v22 = a9;
  v17 = a10;
  v29.receiver = self;
  v29.super_class = (Class)CERecommendation;
  v18 = -[CERecommendation init](&v29, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_identifier, a3);
    objc_storeStrong((id *)&v19->_title, a4);
    objc_storeStrong((id *)&v19->_subTitle, a5);
    objc_storeStrong((id *)&v19->_message, a6);
    objc_storeStrong((id *)&v19->_bundleID, a7);
    objc_storeStrong((id *)&v19->_storageRecoverable, a8);
    objc_storeStrong((id *)&v19->_category, a9);
    objc_storeStrong((id *)&v19->_actions, a10);
    v19->_completed = 0;
    status = v19->_status;
    v19->_status = 0;

  }
  return v19;
}

- (CERecommendation)initWithDictionary:(id)a3
{
  id v4;
  CERecommendation *v5;
  CERecommendation *v6;
  void *v7;
  NSString *v8;
  NSObject *identifier;
  void *v10;
  NSString *v11;
  NSObject *title;
  void *v13;
  NSString *v14;
  NSObject *subTitle;
  void *v16;
  NSString *v17;
  NSObject *message;
  void *v19;
  NSString *v20;
  NSObject *bundleID;
  void *v22;
  NSNumber *v23;
  NSObject *p_super;
  void *v25;
  NSString *v26;
  NSObject *category;
  void *v28;
  NSObject *v29;
  void *v30;
  NSString *v31;
  NSObject *status;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  int v39;
  CEImageIcon *v40;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  objc_super v47;

  v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)CERecommendation;
  v5 = -[CERecommendation init](&v47, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_completed = 0;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("id"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v7;
      identifier = v6->_identifier;
      v6->_identifier = v8;
    }
    else
    {
      _CELogSystem();
      identifier = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(identifier, OS_LOG_TYPE_DEBUG))
        -[CERecommendation initWithDictionary:].cold.10();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = v10;
      title = v6->_title;
      v6->_title = v11;
    }
    else
    {
      _CELogSystem();
      title = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(title, OS_LOG_TYPE_DEBUG))
        -[CERecommendation initWithDictionary:].cold.9();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subtitle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = v13;
      subTitle = v6->_subTitle;
      v6->_subTitle = v14;
    }
    else
    {
      _CELogSystem();
      subTitle = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(subTitle, OS_LOG_TYPE_DEBUG))
        -[CERecommendation initWithDictionary:].cold.8();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("message"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = v16;
      message = v6->_message;
      v6->_message = v17;
    }
    else
    {
      _CELogSystem();
      message = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(message, OS_LOG_TYPE_DEBUG))
        -[CERecommendation initWithDictionary:].cold.7();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bundleID"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v46 = v19;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = v19;
      bundleID = v6->_bundleID;
      v6->_bundleID = v20;
    }
    else
    {
      _CELogSystem();
      bundleID = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(bundleID, OS_LOG_TYPE_DEBUG))
        -[CERecommendation initWithDictionary:].cold.6();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("storageRecoverable"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v45 = v22;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = v22;
      p_super = &v6->_storageRecoverable->super.super;
      v6->_storageRecoverable = v23;
    }
    else
    {
      _CELogSystem();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
        -[CERecommendation initWithDictionary:].cold.5();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("category"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v44 = v25;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v26 = v25;
      category = v6->_category;
      v6->_category = v26;
    }
    else
    {
      _CELogSystem();
      category = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(category, OS_LOG_TYPE_DEBUG))
        -[CERecommendation initWithDictionary:].cold.4();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actions"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CERecommendation parseActions:](v6, "parseActions:", v28);
    }
    else
    {
      _CELogSystem();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        -[CERecommendation initWithDictionary:].cold.3();

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("status"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = v30;
      status = v6->_status;
      v6->_status = v31;
    }
    else
    {
      _CELogSystem();
      status = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(status, OS_LOG_TYPE_DEBUG))
        -[CERecommendation initWithDictionary:].cold.2();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("icon"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v42 = v16;
      v43 = v13;
      v34 = v10;
      v35 = v7;
      objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("type"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "isEqualToString:", CFSTR("IMAGE"));

      objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("type"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "isEqualToString:", CFSTR("SF_SYMBOL"));

      if (v37)
      {
        v40 = -[CEImageIcon initWithDictionary:]([CEImageIcon alloc], "initWithDictionary:", v33);
        if (v40)
          objc_storeStrong((id *)&v6->_icon, v40);
        v7 = v35;
        v10 = v34;
        v16 = v42;
        v13 = v43;
      }
      else
      {
        v7 = v35;
        v10 = v34;
        v16 = v42;
        v13 = v43;
        if (!v39)
          goto LABEL_47;
        v40 = -[CESymbolIcon initWithDictionary:]([CESymbolIcon alloc], "initWithDictionary:", v33);
        if (v40)
          objc_storeStrong((id *)&v6->_icon, v40);
      }
    }
    else
    {
      _CELogSystem();
      v40 = (CEImageIcon *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v40->super.super, OS_LOG_TYPE_ERROR))
        -[CERecommendation initWithDictionary:].cold.1();
    }

LABEL_47:
  }

  return v6;
}

- (void)parseActions:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  NSArray *v7;
  NSArray *actions;
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = (objc_class *)MEMORY[0x24BDBCEB8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __33__CERecommendation_parseActions___block_invoke;
  v10[3] = &unk_2509E06B0;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);

  v7 = (NSArray *)objc_msgSend(v9, "copy");
  actions = self->_actions;
  self->_actions = v7;

}

void __33__CERecommendation_parseActions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  char v6;
  char v7;
  char v8;
  int v9;
  int v10;
  int v11;
  __objc2_class *v12;
  void *v13;
  NSObject *v14;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    -[NSObject objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("actionType"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("Deeplink"));
      v7 = objc_msgSend(v5, "isEqualToString:", CFSTR("LiftUIUrl"));
      v8 = objc_msgSend(v5, "isEqualToString:", CFSTR("RemoteUIUrl"));
      v9 = objc_msgSend(v5, "isEqualToString:", CFSTR("WebUrl"));
      v10 = objc_msgSend(v5, "isEqualToString:", CFSTR("EnableDataclass"));
      v11 = objc_msgSend(v5, "isEqualToString:", CFSTR("AppInstall"));
      if ((v6 & 1) != 0 || (v7 & 1) != 0 || (v8 & 1) != 0 || v9)
      {
        v12 = CEURLRecommendationAction;
      }
      else if (v10)
      {
        v12 = CEDataclassRecommendationAction;
      }
      else
      {
        if (!v11)
        {
          _CELogSystem();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            __33__CERecommendation_parseActions___block_invoke_cold_1(v14);

          goto LABEL_17;
        }
        v12 = CEAppInstallRecommendationAction;
      }
      v13 = (void *)objc_msgSend([v12 alloc], "initWithDictionary:", v4);
      if (v13)
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v13);

    }
LABEL_17:

    goto LABEL_18;
  }
  _CELogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __33__CERecommendation_parseActions___block_invoke_cold_2();
LABEL_18:

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subTitle, CFSTR("subtitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_message, CFSTR("message"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleID, CFSTR("bundleID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_storageRecoverable, CFSTR("storageRecoverable"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_category, CFSTR("category"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_actions, CFSTR("actions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_icon, CFSTR("icon"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_completed, CFSTR("completed"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_status, CFSTR("status"));

}

- (CERecommendation)initWithCoder:(id)a3
{
  id v4;
  CERecommendation *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *title;
  uint64_t v10;
  NSString *subTitle;
  uint64_t v12;
  NSString *message;
  uint64_t v14;
  NSString *bundleID;
  uint64_t v16;
  NSNumber *storageRecoverable;
  uint64_t v18;
  NSString *category;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSArray *actions;
  uint64_t v25;
  CEIcon *icon;
  uint64_t v27;
  NSString *status;
  objc_super v30;
  _QWORD v31[3];

  v31[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)CERecommendation;
  v5 = -[CERecommendation init](&v30, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v8 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subtitle"));
    v10 = objc_claimAutoreleasedReturnValue();
    subTitle = v5->_subTitle;
    v5->_subTitle = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("message"));
    v12 = objc_claimAutoreleasedReturnValue();
    message = v5->_message;
    v5->_message = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleID"));
    v14 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("storageRecoverable"));
    v16 = objc_claimAutoreleasedReturnValue();
    storageRecoverable = v5->_storageRecoverable;
    v5->_storageRecoverable = (NSNumber *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("category"));
    v18 = objc_claimAutoreleasedReturnValue();
    category = v5->_category;
    v5->_category = (NSString *)v18;

    v20 = (void *)MEMORY[0x24BDBCF20];
    v31[0] = objc_opt_class();
    v31[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setWithArray:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("actions"));
    v23 = objc_claimAutoreleasedReturnValue();
    actions = v5->_actions;
    v5->_actions = (NSArray *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("icon"));
    v25 = objc_claimAutoreleasedReturnValue();
    icon = v5->_icon;
    v5->_icon = (CEIcon *)v25;

    v5->_completed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("completed"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("status"));
    v27 = objc_claimAutoreleasedReturnValue();
    status = v5->_status;
    v5->_status = (NSString *)v27;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CERecommendation *v4;

  v4 = -[CERecommendation initWithIdentifier:title:message:bundleID:storageRecoverable:category:actions:](+[CERecommendation allocWithZone:](CERecommendation, "allocWithZone:", a3), "initWithIdentifier:title:message:bundleID:storageRecoverable:category:actions:", self->_identifier, self->_title, self->_message, self->_bundleID, self->_storageRecoverable, self->_category, self->_actions);
  -[CERecommendation setSubTitle:](v4, "setSubTitle:", self->_subTitle);
  -[CERecommendation setIcon:](v4, "setIcon:", self->_icon);
  -[CERecommendation setCompleted:](v4, "setCompleted:", self->_completed);
  -[CERecommendation setStatus:](v4, "setStatus:", self->_status);
  return v4;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Recommendation with id: %@, title: %@, subtitle: %@, message: %@, bundleID: %@, storageRecoverable: %@, category: %@, actions: %@, icon: %@ completed: %d status: %@"), self->_identifier, self->_title, self->_subTitle, self->_message, self->_bundleID, self->_storageRecoverable, self->_category, self->_actions, self->_icon, self->_completed, self->_status);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)subTitle
{
  return self->_subTitle;
}

- (void)setSubTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)storageRecoverable
{
  return self->_storageRecoverable;
}

- (void)setStorageRecoverable:(id)a3
{
  objc_storeStrong((id *)&self->_storageRecoverable, a3);
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
  objc_storeStrong((id *)&self->_actions, a3);
}

- (CEIcon)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_storageRecoverable, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_subTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)initWithDictionary:.cold.1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)OUTLINED_FUNCTION_3();
  v1 = OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_4(&dword_2380DF000, v2, v3, "%@ Unable to parse icon for recommendation.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)initWithDictionary:.cold.2()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)OUTLINED_FUNCTION_3();
  v1 = OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_0(&dword_2380DF000, v2, v3, "%@ Status string not present for recommendation.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)initWithDictionary:.cold.3()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)OUTLINED_FUNCTION_3();
  v1 = OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_0(&dword_2380DF000, v2, v3, "%@ Unable to parse actions for recommendation.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)initWithDictionary:.cold.4()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)OUTLINED_FUNCTION_3();
  v1 = OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_0(&dword_2380DF000, v2, v3, "%@ Unable to parse category for recommendation.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)initWithDictionary:.cold.5()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)OUTLINED_FUNCTION_3();
  v1 = OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_0(&dword_2380DF000, v2, v3, "%@ Unable to parse storageRecoverable for recommendation.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)initWithDictionary:.cold.6()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)OUTLINED_FUNCTION_3();
  v1 = OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_0(&dword_2380DF000, v2, v3, "%@ Unable to parse bundleID for recommendation.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)initWithDictionary:.cold.7()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)OUTLINED_FUNCTION_3();
  v1 = OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_0(&dword_2380DF000, v2, v3, "%@ Unable to parse message for recommendation.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)initWithDictionary:.cold.8()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)OUTLINED_FUNCTION_3();
  v1 = OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_0(&dword_2380DF000, v2, v3, "%@ Unable to parse subtitle for recommendation.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)initWithDictionary:.cold.9()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)OUTLINED_FUNCTION_3();
  v1 = OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_0(&dword_2380DF000, v2, v3, "%@ Unable to parse title for recommendation.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)initWithDictionary:.cold.10()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)OUTLINED_FUNCTION_3();
  v1 = OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_0(&dword_2380DF000, v2, v3, "%@ Unable to parse identifier for recommendation.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __33__CERecommendation_parseActions___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2380DF000, log, OS_LOG_TYPE_DEBUG, "Action type provided is invalid or unsupported.", v1, 2u);
}

void __33__CERecommendation_parseActions___block_invoke_cold_2()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)OUTLINED_FUNCTION_3();
  v1 = OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_4(&dword_2380DF000, v2, v3, "Expected action object to be a dictionary, instead found a %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

@end
