@implementation IAMChangedContextPropertiesTriggerContext

- (IAMChangedContextPropertiesTriggerContext)initWithContextPropertyNames:(id)a3 bundleIdentifier:(id)a4
{
  id v6;
  id v7;
  IAMChangedContextPropertiesTriggerContext *v8;
  uint64_t v9;
  NSSet *contextPropertyNames;
  uint64_t v11;
  NSString *bundleIdentifier;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IAMChangedContextPropertiesTriggerContext;
  v8 = -[IAMChangedContextPropertiesTriggerContext init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    contextPropertyNames = v8->_contextPropertyNames;
    v8->_contextPropertyNames = (NSSet *)v9;

    v11 = objc_msgSend(v7, "copy");
    bundleIdentifier = v8->_bundleIdentifier;
    v8->_bundleIdentifier = (NSString *)v11;

  }
  return v8;
}

- (NSSet)contextPropertyNames
{
  return self->_contextPropertyNames;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextPropertyNames, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (BOOL)satisfiesPresentationTrigger:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  NSSet *contextPropertyNames;
  void *v10;
  BOOL v11;

  v4 = a3;
  if (objc_msgSend(v4, "hasKind") && objc_msgSend(v4, "kind") != 1)
    goto LABEL_6;
  objc_msgSend(v4, "bundleIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_5;
  v6 = (void *)v5;
  objc_msgSend(v4, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", self->_bundleIdentifier);

  if (!v8)
  {
LABEL_6:
    v11 = 0;
  }
  else
  {
LABEL_5:
    contextPropertyNames = self->_contextPropertyNames;
    objc_msgSend(v4, "triggerName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSSet containsObject:](contextPropertyNames, "containsObject:", v10);

  }
  return v11;
}

@end
