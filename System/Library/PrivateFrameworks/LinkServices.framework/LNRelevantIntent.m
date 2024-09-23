@implementation LNRelevantIntent

- (LNRelevantIntent)initWithBundleIdentifier:(id)a3 action:(id)a4 widgetKind:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  LNRelevantIntent *v14;
  uint64_t v15;
  NSString *bundleIdentifier;
  uint64_t v17;
  LNAction *action;
  uint64_t v19;
  NSString *widgetKind;
  uint64_t v21;
  LNRelevantContext *context;
  LNRelevantIntent *v23;
  objc_super v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)LNRelevantIntent;
  v14 = -[LNRelevantIntent init](&v25, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    bundleIdentifier = v14->_bundleIdentifier;
    v14->_bundleIdentifier = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    action = v14->_action;
    v14->_action = (LNAction *)v17;

    v19 = objc_msgSend(v12, "copy");
    widgetKind = v14->_widgetKind;
    v14->_widgetKind = (NSString *)v19;

    v21 = objc_msgSend(v13, "copy");
    context = v14->_context;
    v14->_context = (LNRelevantContext *)v21;

    v23 = v14;
  }

  return v14;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[LNRelevantIntent bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNRelevantIntent action](self, "action");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNRelevantIntent context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{%@:%@, %@}"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (LNRelevantIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  LNRelevantIntent *v11;
  LNRelevantIntent *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("action"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("widgetKind"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("context"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v9 = v6 == 0;
  else
    v9 = 1;
  if (v9 || v8 == 0)
  {
    v11 = 0;
  }
  else
  {
    self = -[LNRelevantIntent initWithBundleIdentifier:action:widgetKind:context:](self, "initWithBundleIdentifier:action:widgetKind:context:", v5, v6, v7, v8);
    v11 = self;
  }
  v12 = v11;

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[LNRelevantIntent bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("bundleIdentifier"));

  -[LNRelevantIntent action](self, "action");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("action"));

  -[LNRelevantIntent widgetKind](self, "widgetKind");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("widgetKind"));

  -[LNRelevantIntent context](self, "context");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("context"));

}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (LNAction)action
{
  return self->_action;
}

- (NSString)widgetKind
{
  return self->_widgetKind;
}

- (LNRelevantContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_widgetKind, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
