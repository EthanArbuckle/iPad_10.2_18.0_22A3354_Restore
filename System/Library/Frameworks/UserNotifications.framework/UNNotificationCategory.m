@implementation UNNotificationCategory

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  -[UNNotificationCategory actions](self, "actions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v4, CFSTR("actions"));

  -[UNNotificationCategory identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[UNNotificationCategory intentIdentifiers](self, "intentIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v6, CFSTR("intentIdentifiers"));

  objc_msgSend(v15, "encodeInteger:forKey:", -[UNNotificationCategory options](self, "options"), CFSTR("options"));
  -[UNNotificationCategory minimalActions](self, "minimalActions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v7, CFSTR("minimalActions"));

  -[UNNotificationCategory alternateAction](self, "alternateAction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v8, CFSTR("alternateAction"));

  -[UNNotificationCategory hiddenPreviewsBodyPlaceholder](self, "hiddenPreviewsBodyPlaceholder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "un_stringWithMaxLength:", 1000);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v10, CFSTR("hiddenPreviewsBodyPlaceholder"));

  -[UNNotificationCategory categorySummaryFormat](self, "categorySummaryFormat");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "un_stringWithMaxLength:", 1000);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v12, CFSTR("categorySummaryFormat"));

  -[UNNotificationCategory actionsMenuTitle](self, "actionsMenuTitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "un_stringWithMaxLength:", 1000);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v14, CFSTR("actionsMenuTitle"));

  objc_msgSend(v15, "encodeInteger:forKey:", -[UNNotificationCategory backgroundStyle](self, "backgroundStyle"), CFSTR("backgroundStyle"));
  objc_msgSend(v15, "encodeInteger:forKey:", -[UNNotificationCategory listPriority](self, "listPriority"), CFSTR("listPriority"));

}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  UNNotificationCategoryOptions v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  void *v22;

  -[UNNotificationCategory actions](self, "actions");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v22, "hash");
  -[UNNotificationCategory minimalActions](self, "minimalActions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  -[UNNotificationCategory intentIdentifiers](self, "intentIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  -[UNNotificationCategory alternateAction](self, "alternateAction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5 ^ v7 ^ objc_msgSend(v8, "hash");
  -[UNNotificationCategory identifier](self, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  v12 = v11 ^ -[UNNotificationCategory options](self, "options");
  -[UNNotificationCategory hiddenPreviewsBodyPlaceholder](self, "hiddenPreviewsBodyPlaceholder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v9 ^ v12 ^ objc_msgSend(v13, "hash");
  -[UNNotificationCategory categorySummaryFormat](self, "categorySummaryFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "hash");
  -[UNNotificationCategory actionsMenuTitle](self, "actionsMenuTitle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v16 ^ objc_msgSend(v17, "hash");
  v19 = v18 ^ -[UNNotificationCategory backgroundStyle](self, "backgroundStyle");
  v20 = v14 ^ v19 ^ -[UNNotificationCategory listPriority](self, "listPriority");

  return v20;
}

- (UNNotificationCategoryOptions)options
{
  return self->_options;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSArray)minimalActions
{
  return self->_minimalActions;
}

- (NSArray)intentIdentifiers
{
  return self->_intentIdentifiers;
}

- (UNNotificationAction)alternateAction
{
  return self->_alternateAction;
}

- (unint64_t)listPriority
{
  return self->_listPriority;
}

- (NSString)hiddenPreviewsBodyPlaceholder
{
  return self->_hiddenPreviewsBodyPlaceholder;
}

- (NSString)categorySummaryFormat
{
  return self->_categorySummaryFormat;
}

- (unint64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (NSString)actionsMenuTitle
{
  return self->_actionsMenuTitle;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UNNotificationCategoryOptions v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  BOOL v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UNNotificationCategory actions](self, "actions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!UNEqualObjects(v5, v6))
    {
      v20 = 0;
LABEL_31:

      goto LABEL_32;
    }
    -[UNNotificationCategory minimalActions](self, "minimalActions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "minimalActions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!UNEqualObjects(v7, v8))
    {
      v20 = 0;
LABEL_30:

      goto LABEL_31;
    }
    -[UNNotificationCategory intentIdentifiers](self, "intentIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentIdentifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!UNEqualObjects(v9, v10))
    {
      v20 = 0;
LABEL_29:

      goto LABEL_30;
    }
    -[UNNotificationCategory alternateAction](self, "alternateAction");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alternateAction");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!UNEqualObjects(v11, v12))
    {
      v20 = 0;
LABEL_28:

      goto LABEL_29;
    }
    v29 = v12;
    -[UNNotificationCategory identifier](self, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v13;
    if (UNEqualStrings(v13, v30))
    {
      v28 = v11;
      v14 = -[UNNotificationCategory options](self, "options");
      if (v14 == objc_msgSend(v4, "options"))
      {
        -[UNNotificationCategory hiddenPreviewsBodyPlaceholder](self, "hiddenPreviewsBodyPlaceholder");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "hiddenPreviewsBodyPlaceholder");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v15;
        if (UNEqualStrings(v15, v26))
        {
          -[UNNotificationCategory categorySummaryFormat](self, "categorySummaryFormat");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "categorySummaryFormat");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v16;
          if (UNEqualStrings(v16, v24))
          {
            -[UNNotificationCategory actionsMenuTitle](self, "actionsMenuTitle");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "actionsMenuTitle");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v17;
            if (UNEqualStrings(v17, v22)
              && (v18 = -[UNNotificationCategory backgroundStyle](self, "backgroundStyle", v22, v17, v24, v25, v26, v27),
                  v18 == objc_msgSend(v4, "backgroundStyle")))
            {
              v19 = -[UNNotificationCategory listPriority](self, "listPriority");
              v20 = v19 == objc_msgSend(v4, "listPriority");
            }
            else
            {
              v20 = 0;
            }
            v11 = v28;
            v12 = v29;

          }
          else
          {
            v20 = 0;
            v11 = v28;
            v12 = v29;
          }

        }
        else
        {
          v20 = 0;
          v11 = v28;
          v12 = v29;
        }

        goto LABEL_27;
      }
      v20 = 0;
      v11 = v28;
    }
    else
    {
      v20 = 0;
    }
    v12 = v29;
LABEL_27:

    goto LABEL_28;
  }
  v20 = 0;
LABEL_32:

  return v20;
}

- (NSArray)actions
{
  return self->_actions;
}

- (UNNotificationCategory)initWithCoder:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  UNNotificationCategory *v35;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v41[2];
  _QWORD v42[2];
  _QWORD v43[3];

  v43[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = a3;
  v43[0] = objc_opt_class();
  v43[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("actions"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)objc_msgSend(v7, "copy");

  v8 = (void *)MEMORY[0x1E0C99E60];
  v42[0] = objc_opt_class();
  v42[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("minimalActions"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_msgSend(v11, "copy");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("alternateAction"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend(v12, "copy");

  v13 = (void *)MEMORY[0x1E0C99E60];
  v41[0] = objc_opt_class();
  v41[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("intentIdentifiers"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "copy");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "copy");

  v20 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("options"));
  v21 = (void *)MEMORY[0x1E0C99E60];
  v22 = objc_opt_class();
  objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("hiddenPreviewsBodyPlaceholder"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = (void *)MEMORY[0x1E0C99E60];
  v26 = objc_opt_class();
  objc_msgSend(v25, "setWithObjects:", v26, objc_opt_class(), 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v27, CFSTR("categorySummaryFormat"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = (void *)MEMORY[0x1E0C99E60];
  v30 = objc_opt_class();
  objc_msgSend(v29, "setWithObjects:", v30, objc_opt_class(), 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v31, CFSTR("actionsMenuTitle"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("backgroundStyle"));
  v34 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("listPriority"));

  v35 = -[UNNotificationCategory _initWithIdentifier:actions:minimalActions:alternateAction:intentIdentifiers:hiddenPreviewsBodyPlaceholder:categorySummaryFormat:actionsMenuTitle:options:backgroundStyle:listPriority:](self, "_initWithIdentifier:actions:minimalActions:alternateAction:intentIdentifiers:hiddenPreviewsBodyPlaceholder:categorySummaryFormat:actionsMenuTitle:options:backgroundStyle:listPriority:", v19, v39, v38, v37, v17, v24, v28, v32, v20, v33, v34);
  return v35;
}

- (id)_initWithIdentifier:(id)a3 actions:(id)a4 minimalActions:(id)a5 alternateAction:(id)a6 intentIdentifiers:(id)a7 hiddenPreviewsBodyPlaceholder:(id)a8 categorySummaryFormat:(id)a9 actionsMenuTitle:(id)a10 options:(unint64_t)a11 backgroundStyle:(unint64_t)a12 listPriority:(unint64_t)a13
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  UNNotificationCategory *v26;
  uint64_t v27;
  NSArray *actions;
  uint64_t v29;
  NSArray *minimalActions;
  uint64_t v31;
  UNNotificationAction *alternateAction;
  uint64_t v33;
  NSArray *intentIdentifiers;
  uint64_t v35;
  NSString *identifier;
  uint64_t v37;
  NSString *hiddenPreviewsBodyPlaceholder;
  uint64_t v39;
  NSString *categorySummaryFormat;
  id v42;
  objc_super v43;

  v42 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v23 = a8;
  v24 = a9;
  v25 = a10;
  v43.receiver = self;
  v43.super_class = (Class)UNNotificationCategory;
  v26 = -[UNNotificationCategory init](&v43, sel_init);
  if (v26)
  {
    v27 = objc_msgSend(v19, "copy");
    actions = v26->_actions;
    v26->_actions = (NSArray *)v27;

    v29 = objc_msgSend(v20, "copy");
    minimalActions = v26->_minimalActions;
    v26->_minimalActions = (NSArray *)v29;

    v31 = objc_msgSend(v21, "copy");
    alternateAction = v26->_alternateAction;
    v26->_alternateAction = (UNNotificationAction *)v31;

    v33 = objc_msgSend(v22, "copy");
    intentIdentifiers = v26->_intentIdentifiers;
    v26->_intentIdentifiers = (NSArray *)v33;

    v35 = objc_msgSend(v42, "copy");
    identifier = v26->_identifier;
    v26->_identifier = (NSString *)v35;

    v37 = objc_msgSend(v23, "copy");
    hiddenPreviewsBodyPlaceholder = v26->_hiddenPreviewsBodyPlaceholder;
    v26->_hiddenPreviewsBodyPlaceholder = (NSString *)v37;

    v26->_options = a11;
    v39 = objc_msgSend(v24, "copy");
    categorySummaryFormat = v26->_categorySummaryFormat;
    v26->_categorySummaryFormat = (NSString *)v39;

    objc_storeStrong((id *)&v26->_actionsMenuTitle, a10);
    v26->_backgroundStyle = a12;
    v26->_listPriority = a13;
  }

  return v26;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateAction, 0);
  objc_storeStrong((id *)&self->_actionsMenuTitle, 0);
  objc_storeStrong((id *)&self->_categorySummaryFormat, 0);
  objc_storeStrong((id *)&self->_hiddenPreviewsBodyPlaceholder, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_intentIdentifiers, 0);
  objc_storeStrong((id *)&self->_minimalActions, 0);
  objc_storeStrong((id *)&self->_actions, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (UNNotificationCategory)categoryWithIdentifier:(NSString *)identifier actions:(NSArray *)actions intentIdentifiers:(NSArray *)intentIdentifiers options:(UNNotificationCategoryOptions)options
{
  NSArray *v10;
  NSArray *v11;
  NSString *v12;
  id v13;
  void *v14;

  v10 = intentIdentifiers;
  v11 = actions;
  v12 = identifier;
  v13 = objc_alloc((Class)a1);
  v14 = (void *)objc_msgSend(v13, "_initWithIdentifier:actions:minimalActions:alternateAction:intentIdentifiers:hiddenPreviewsBodyPlaceholder:categorySummaryFormat:actionsMenuTitle:options:backgroundStyle:listPriority:", v12, v11, MEMORY[0x1E0C9AA60], 0, v10, &stru_1E57F06A0, &stru_1E57F06A0, options, 0, 0);

  return (UNNotificationCategory *)v14;
}

+ (UNNotificationCategory)categoryWithIdentifier:(id)a3 actions:(id)a4 minimalActions:(id)a5 intentIdentifiers:(id)a6 options:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;

  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithIdentifier:actions:minimalActions:alternateAction:intentIdentifiers:hiddenPreviewsBodyPlaceholder:categorySummaryFormat:actionsMenuTitle:options:backgroundStyle:listPriority:", v15, v14, v13, 0, v12, &stru_1E57F06A0, &stru_1E57F06A0, a7, 0, 0);

  return (UNNotificationCategory *)v16;
}

+ (UNNotificationCategory)categoryWithIdentifier:(NSString *)identifier actions:(NSArray *)actions intentIdentifiers:(NSArray *)intentIdentifiers hiddenPreviewsBodyPlaceholder:(NSString *)hiddenPreviewsBodyPlaceholder options:(UNNotificationCategoryOptions)options
{
  NSString *v12;
  NSArray *v13;
  NSArray *v14;
  NSString *v15;
  id v16;
  void *v17;

  v12 = hiddenPreviewsBodyPlaceholder;
  v13 = intentIdentifiers;
  v14 = actions;
  v15 = identifier;
  v16 = objc_alloc((Class)a1);
  v17 = (void *)objc_msgSend(v16, "_initWithIdentifier:actions:minimalActions:alternateAction:intentIdentifiers:hiddenPreviewsBodyPlaceholder:categorySummaryFormat:actionsMenuTitle:options:backgroundStyle:listPriority:", v15, v14, MEMORY[0x1E0C9AA60], 0, v13, v12, &stru_1E57F06A0, &stru_1E57F06A0, options, 0, 0);

  return (UNNotificationCategory *)v17;
}

+ (UNNotificationCategory)categoryWithIdentifier:(id)a3 actions:(id)a4 minimalActions:(id)a5 intentIdentifiers:(id)a6 hiddenPreviewsBodyPlaceholder:(id)a7 options:(unint64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;

  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithIdentifier:actions:minimalActions:alternateAction:intentIdentifiers:hiddenPreviewsBodyPlaceholder:categorySummaryFormat:actionsMenuTitle:options:backgroundStyle:listPriority:", v18, v17, v16, 0, v15, v14, &stru_1E57F06A0, &stru_1E57F06A0, a8, 0, 0);

  return (UNNotificationCategory *)v19;
}

+ (UNNotificationCategory)categoryWithIdentifier:(NSString *)identifier actions:(NSArray *)actions intentIdentifiers:(NSArray *)intentIdentifiers hiddenPreviewsBodyPlaceholder:(NSString *)hiddenPreviewsBodyPlaceholder categorySummaryFormat:(NSString *)categorySummaryFormat options:(UNNotificationCategoryOptions)options
{
  NSString *v14;
  NSString *v15;
  NSArray *v16;
  NSArray *v17;
  NSString *v18;
  id v19;
  void *v20;

  v14 = categorySummaryFormat;
  v15 = hiddenPreviewsBodyPlaceholder;
  v16 = intentIdentifiers;
  v17 = actions;
  v18 = identifier;
  v19 = objc_alloc((Class)a1);
  v20 = (void *)objc_msgSend(v19, "_initWithIdentifier:actions:minimalActions:alternateAction:intentIdentifiers:hiddenPreviewsBodyPlaceholder:categorySummaryFormat:actionsMenuTitle:options:backgroundStyle:listPriority:", v18, v17, MEMORY[0x1E0C9AA60], 0, v16, v15, v14, &stru_1E57F06A0, options, 0, 0);

  return (UNNotificationCategory *)v20;
}

+ (UNNotificationCategory)categoryWithIdentifier:(id)a3 actions:(id)a4 minimalActions:(id)a5 intentIdentifiers:(id)a6 hiddenPreviewsBodyPlaceholder:(id)a7 categorySummaryFormat:(id)a8 options:(unint64_t)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;

  v15 = a8;
  v16 = a7;
  v17 = a6;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  v21 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithIdentifier:actions:minimalActions:alternateAction:intentIdentifiers:hiddenPreviewsBodyPlaceholder:categorySummaryFormat:actionsMenuTitle:options:backgroundStyle:listPriority:", v20, v19, v18, 0, v17, v16, v15, &stru_1E57F06A0, a9, 0, 0);

  return (UNNotificationCategory *)v21;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[UNNotificationCategory identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationCategory actions](self, "actions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationCategory minimalActions](self, "minimalActions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationCategory intentIdentifiers](self, "intentIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationCategory options](self, "options");
  NSStringFromBOOL();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationCategory options](self, "options");
  NSStringFromBOOL();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationCategory hiddenPreviewsBodyPlaceholder](self, "hiddenPreviewsBodyPlaceholder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; identifier: %@, actions: %@, minimalAction: %@, intentIdentifiers: %@, custom dismiss: %@, CarPlay: %@, private body: %@>"),
    v4,
    self,
    v5,
    v6,
    v7,
    v8,
    v9,
    v10,
    v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v13;
  UNMutableNotificationCategory *v14;

  v14 = +[UNMutableNotificationCategory allocWithZone:](UNMutableNotificationCategory, "allocWithZone:", a3);
  -[UNNotificationCategory identifier](self, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationCategory actions](self, "actions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationCategory minimalActions](self, "minimalActions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationCategory alternateAction](self, "alternateAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationCategory intentIdentifiers](self, "intentIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationCategory hiddenPreviewsBodyPlaceholder](self, "hiddenPreviewsBodyPlaceholder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationCategory categorySummaryFormat](self, "categorySummaryFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationCategory actionsMenuTitle](self, "actionsMenuTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[UNNotificationCategory _initWithIdentifier:actions:minimalActions:alternateAction:intentIdentifiers:hiddenPreviewsBodyPlaceholder:categorySummaryFormat:actionsMenuTitle:options:backgroundStyle:listPriority:](v14, "_initWithIdentifier:actions:minimalActions:alternateAction:intentIdentifiers:hiddenPreviewsBodyPlaceholder:categorySummaryFormat:actionsMenuTitle:options:backgroundStyle:listPriority:", v13, v4, v5, v6, v7, v8, v9, v10, -[UNNotificationCategory options](self, "options"), -[UNNotificationCategory backgroundStyle](self, "backgroundStyle"), -[UNNotificationCategory listPriority](self, "listPriority"));

  return v11;
}

@end
