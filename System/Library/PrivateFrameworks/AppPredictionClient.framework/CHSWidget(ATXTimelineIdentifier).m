@implementation CHSWidget(ATXTimelineIdentifier)

- (id)atxTimelineIdentifier
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v13;

  objc_msgSend(a1, "intentReference");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(a1, "extensionIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extensionBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "kind");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "family");
  NSStringFromWidgetFamily();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v3)
    v10 = objc_msgSend(v4, "initWithFormat:", CFSTR("%@.%@.%@.%lld"), v6, v7, v8, objc_msgSend(v3, "atx_indexingHash"));
  else
    v10 = objc_msgSend(v4, "initWithFormat:", CFSTR("%@.%@.%@"), v6, v7, v8, v13);
  v11 = (void *)v10;

  return v11;
}

@end
