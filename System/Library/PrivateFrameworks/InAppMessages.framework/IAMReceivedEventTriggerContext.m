@implementation IAMReceivedEventTriggerContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (IAMReceivedEventTriggerContext)initWithEvent:(id)a3 bundleIdentifier:(id)a4
{
  id v7;
  id v8;
  IAMReceivedEventTriggerContext *v9;
  IAMReceivedEventTriggerContext *v10;
  uint64_t v11;
  NSString *bundleIdentifier;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IAMReceivedEventTriggerContext;
  v9 = -[IAMReceivedEventTriggerContext init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_event, a3);
    v11 = objc_msgSend(v8, "copy");
    bundleIdentifier = v10->_bundleIdentifier;
    v10->_bundleIdentifier = (NSString *)v11;

  }
  return v10;
}

- (IAMEventProtocol)event
{
  return self->_event;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (BOOL)satisfiesPresentationTrigger:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  IAMEventProtocol *event;
  void *v10;
  char v11;

  v4 = a3;
  if (objc_msgSend(v4, "hasKind") && objc_msgSend(v4, "kind"))
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
    event = self->_event;
    objc_msgSend(v4, "triggerName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[IAMEventProtocol matchesWithKey:](event, "matchesWithKey:", v10);

  }
  return v11;
}

@end
