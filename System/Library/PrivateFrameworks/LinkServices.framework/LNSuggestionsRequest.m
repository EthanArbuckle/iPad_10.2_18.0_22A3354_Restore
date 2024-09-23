@implementation LNSuggestionsRequest

- (LNSuggestionsRequest)initWithBundleIdentifier:(id)a3 onScreen:(BOOL)a4 explicitRequest:(BOOL)a5
{
  id v8;
  LNSuggestionsRequest *v9;
  uint64_t v10;
  NSString *bundleIdentifier;
  LNSuggestionsRequest *v12;
  objc_super v14;

  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)LNSuggestionsRequest;
  v9 = -[LNSuggestionsRequest init](&v14, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    bundleIdentifier = v9->_bundleIdentifier;
    v9->_bundleIdentifier = (NSString *)v10;

    v9->_onScreen = a4;
    v9->_explicitRequest = a5;
    v12 = v9;
  }

  return v9;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNSuggestionsRequest bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, bundleIdentifier: %@, onScreen: %d, explicitRequest: %d>"), v5, self, v6, -[LNSuggestionsRequest isOnScreen](self, "isOnScreen"), -[LNSuggestionsRequest isExplicitRequest](self, "isExplicitRequest"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (LNSuggestionsRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  LNSuggestionsRequest *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("onScreen"));
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("explicitRequest"));

  v8 = -[LNSuggestionsRequest initWithBundleIdentifier:onScreen:explicitRequest:](self, "initWithBundleIdentifier:onScreen:explicitRequest:", v5, v6, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[LNSuggestionsRequest bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("bundleIdentifier"));

  objc_msgSend(v5, "encodeBool:forKey:", -[LNSuggestionsRequest isOnScreen](self, "isOnScreen"), CFSTR("onScreen"));
  objc_msgSend(v5, "encodeBool:forKey:", -[LNSuggestionsRequest isExplicitRequest](self, "isExplicitRequest"), CFSTR("explicitRequest"));

}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (BOOL)isOnScreen
{
  return self->_onScreen;
}

- (BOOL)isExplicitRequest
{
  return self->_explicitRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
