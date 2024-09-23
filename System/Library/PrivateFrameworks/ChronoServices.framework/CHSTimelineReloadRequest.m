@implementation CHSTimelineReloadRequest

- (NSString)reason
{
  return self->_reason;
}

- (NSString)kind
{
  return self->_kind;
}

- (CHSTimelineReloadRequest)initWithKind:(id)a3 extensionBundleIdentifier:(id)a4 reason:(id)a5 allowCostOverride:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  CHSTimelineReloadRequest *v13;
  uint64_t v14;
  NSString *kind;
  uint64_t v16;
  NSString *extensionBundleIdentifier;
  uint64_t v18;
  NSString *reason;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)CHSTimelineReloadRequest;
  v13 = -[CHSTimelineReloadRequest init](&v21, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    kind = v13->_kind;
    v13->_kind = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    extensionBundleIdentifier = v13->_extensionBundleIdentifier;
    v13->_extensionBundleIdentifier = (NSString *)v16;

    v18 = objc_msgSend(v12, "copy");
    reason = v13->_reason;
    v13->_reason = (NSString *)v18;

    v13->_allowCostOverride = a6;
  }

  return v13;
}

- (CHSTimelineReloadRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  CHSTimelineReloadRequest *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_kind"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_extensionBundleIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_reason"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_allowCostOverride"));
  v9 = 0;
  if (v5 && v6 && v7)
  {
    self = -[CHSTimelineReloadRequest initWithKind:extensionBundleIdentifier:reason:allowCostOverride:](self, "initWithKind:extensionBundleIdentifier:reason:allowCostOverride:", v5, v6, v7, v8);
    v9 = self;
  }

  return v9;
}

- (NSString)extensionBundleIdentifier
{
  return self->_extensionBundleIdentifier;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_kind, CFSTR("_kind"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_extensionBundleIdentifier, CFSTR("_extensionBundleIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_reason, CFSTR("_reason"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_allowCostOverride, CFSTR("_allowCostOverride"));

}

- (BOOL)allowCostOverride
{
  return self->_allowCostOverride;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_extensionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_kind, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)new
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CHSTimelineReloadRequest.m"), 13, CFSTR("use initWithKind:extensionBundleIdentifier:allowCostOverride:"));

  return 0;
}

- (CHSTimelineReloadRequest)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CHSTimelineReloadRequest.m"), 18, CFSTR("use initWithKind:extensionBundleIdentifier:allowCostOverride:"));

  return 0;
}

@end
