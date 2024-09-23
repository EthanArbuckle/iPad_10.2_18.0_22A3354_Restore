@implementation CHSTimelineController

- (id)reloadTimelineWithReason:(id)a3
{
  id v4;
  CHSTimelineReloadRequest *v5;
  CHSChronoServicesConnection *connection;
  id v7;
  id v9;

  v4 = a3;
  v5 = -[CHSTimelineReloadRequest initWithKind:extensionBundleIdentifier:reason:allowCostOverride:]([CHSTimelineReloadRequest alloc], "initWithKind:extensionBundleIdentifier:reason:allowCostOverride:", self->_kind, self->_extensionBundleIdentifier, v4, 1);
  connection = self->_connection;
  v9 = 0;
  -[CHSChronoServicesConnection reloadTimeline:error:](connection, "reloadTimeline:error:", v5, &v9);
  v7 = v9;

  return v7;
}

- (NSString)extensionBundleIdentifier
{
  return self->_extensionBundleIdentifier;
}

- (CHSTimelineController)initWithExtensionBundleIdentifier:(id)a3 kind:(id)a4
{
  id v6;
  id v7;
  CHSTimelineController *v8;
  uint64_t v9;
  CHSChronoServicesConnection *connection;
  uint64_t v11;
  NSString *extensionBundleIdentifier;
  uint64_t v13;
  NSString *kind;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CHSTimelineController;
  v8 = -[CHSTimelineController init](&v16, sel_init);
  if (v8)
  {
    +[CHSChronoServicesConnection sharedInstance](CHSChronoServicesConnection, "sharedInstance");
    v9 = objc_claimAutoreleasedReturnValue();
    connection = v8->_connection;
    v8->_connection = (CHSChronoServicesConnection *)v9;

    v11 = objc_msgSend(v6, "copy");
    extensionBundleIdentifier = v8->_extensionBundleIdentifier;
    v8->_extensionBundleIdentifier = (NSString *)v11;

    v13 = objc_msgSend(v7, "copy");
    kind = v8->_kind;
    v8->_kind = (NSString *)v13;

  }
  return v8;
}

- (id)reloadTimelineBudgetedWithReason:(id)a3
{
  id v4;
  CHSTimelineReloadRequest *v5;
  CHSChronoServicesConnection *connection;
  id v7;
  id v9;

  v4 = a3;
  v5 = -[CHSTimelineReloadRequest initWithKind:extensionBundleIdentifier:reason:allowCostOverride:]([CHSTimelineReloadRequest alloc], "initWithKind:extensionBundleIdentifier:reason:allowCostOverride:", self->_kind, self->_extensionBundleIdentifier, v4, 0);
  connection = self->_connection;
  v9 = 0;
  -[CHSChronoServicesConnection reloadTimeline:error:](connection, "reloadTimeline:error:", v5, &v9);
  v7 = v9;

  return v7;
}

- (id)initForAvocadoIdentifier:(id)a3 inBundleIdentifier:(id)a4
{
  return -[CHSTimelineController initWithExtensionBundleIdentifier:kind:](self, "initWithExtensionBundleIdentifier:kind:", a4, a3);
}

- (NSString)avocadoIdentifier
{
  return self->_kind;
}

- (id)reloadTimeline
{
  return -[CHSTimelineController reloadTimelineWithReason:](self, "reloadTimelineWithReason:", CFSTR("unknown"));
}

- (id)reloadTimelineBudgeted
{
  return -[CHSTimelineController reloadTimelineBudgetedWithReason:](self, "reloadTimelineBudgetedWithReason:", CFSTR("unknown"));
}

- (NSString)kind
{
  return self->_kind;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_extensionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
