@implementation CALNNotificationCategory

+ (id)categoryWithIdentifier:(id)a3 actions:(id)a4 hiddenPreviewsBodyPlaceholder:(id)a5 options:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:actions:hiddenPreviewsBodyPlaceholder:options:categorySummaryFormat:", v12, v11, v10, a6, 0);

  return v13;
}

+ (id)categoryWithIdentifier:(id)a3 actions:(id)a4 hiddenPreviewsBodyPlaceholder:(id)a5 options:(unint64_t)a6 categorySummaryFormat:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;

  v12 = a7;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:actions:hiddenPreviewsBodyPlaceholder:options:categorySummaryFormat:", v15, v14, v13, a6, v12);

  return v16;
}

- (CALNNotificationCategory)initWithIdentifier:(id)a3 actions:(id)a4 hiddenPreviewsBodyPlaceholder:(id)a5 options:(unint64_t)a6 categorySummaryFormat:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  CALNNotificationCategory *v16;
  uint64_t v17;
  NSString *identifier;
  uint64_t v19;
  NSArray *actions;
  uint64_t v21;
  NSString *hiddenPreviewsBodyPlaceholder;
  uint64_t v23;
  NSString *categorySummaryFormat;
  objc_super v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v26.receiver = self;
  v26.super_class = (Class)CALNNotificationCategory;
  v16 = -[CALNNotificationCategory init](&v26, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    identifier = v16->_identifier;
    v16->_identifier = (NSString *)v17;

    v19 = objc_msgSend(v13, "copy");
    actions = v16->_actions;
    v16->_actions = (NSArray *)v19;

    v21 = objc_msgSend(v14, "copy");
    hiddenPreviewsBodyPlaceholder = v16->_hiddenPreviewsBodyPlaceholder;
    v16->_hiddenPreviewsBodyPlaceholder = (NSString *)v21;

    v16->_options = a6;
    v23 = objc_msgSend(v15, "copy");
    categorySummaryFormat = v16->_categorySummaryFormat;
    v16->_categorySummaryFormat = (NSString *)v23;

  }
  return v16;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;

  -[CALNNotificationCategory actions](self, "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[CALNNotificationCategory identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  v7 = -[CALNNotificationCategory options](self, "options");
  -[CALNNotificationCategory hiddenPreviewsBodyPlaceholder](self, "hiddenPreviewsBodyPlaceholder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6 ^ v7 ^ objc_msgSend(v8, "hash");

  -[CALNNotificationCategory categorySummaryFormat](self, "categorySummaryFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 ^ objc_msgSend(v10, "hash");

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && -[CALNNotificationCategory isEqualToCategory:](self, "isEqualToCategory:", v4);

  return v5;
}

- (BOOL)isEqualToCategory:(id)a3
{
  CALNNotificationCategory *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  unint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  char v17;

  v4 = (CALNNotificationCategory *)a3;
  if (self == v4)
  {
    v17 = 1;
  }
  else
  {
    -[CALNNotificationCategory actions](self, "actions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALNNotificationCategory actions](v4, "actions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CalEqualObjects();

    if (!v7)
      goto LABEL_7;
    -[CALNNotificationCategory identifier](self, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALNNotificationCategory identifier](v4, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = CalEqualStrings();

    if (!v10)
      goto LABEL_7;
    v11 = -[CALNNotificationCategory options](self, "options");
    if (v11 != -[CALNNotificationCategory options](v4, "options"))
      goto LABEL_7;
    -[CALNNotificationCategory hiddenPreviewsBodyPlaceholder](self, "hiddenPreviewsBodyPlaceholder");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALNNotificationCategory hiddenPreviewsBodyPlaceholder](v4, "hiddenPreviewsBodyPlaceholder");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = CalEqualStrings();

    if (v14)
    {
      -[CALNNotificationCategory categorySummaryFormat](self, "categorySummaryFormat");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CALNNotificationCategory categorySummaryFormat](v4, "categorySummaryFormat");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = CalEqualStrings();

    }
    else
    {
LABEL_7:
      v17 = 0;
    }
  }

  return v17;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationCategory identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationCategory actions](self, "actions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  CALNStringFromNotificationCategoryOptions(-[CALNNotificationCategory options](self, "options"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationCategory hiddenPreviewsBodyPlaceholder](self, "hiddenPreviewsBodyPlaceholder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationCategory categorySummaryFormat](self, "categorySummaryFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>(identifier = %@, actions = %@, options = %@, hiddenPreviewsBodyPlaceholder = %@, categorySummaryFormat = %@)"), v5, self, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSArray)actions
{
  return self->_actions;
}

- (unint64_t)options
{
  return self->_options;
}

- (NSString)hiddenPreviewsBodyPlaceholder
{
  return self->_hiddenPreviewsBodyPlaceholder;
}

- (NSString)categorySummaryFormat
{
  return self->_categorySummaryFormat;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categorySummaryFormat, 0);
  objc_storeStrong((id *)&self->_hiddenPreviewsBodyPlaceholder, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
