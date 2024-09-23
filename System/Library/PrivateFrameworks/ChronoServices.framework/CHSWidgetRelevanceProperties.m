@implementation CHSWidgetRelevanceProperties

- (CHSWidgetRelevanceProperties)initWithWidgetRelevanceKey:(id)a3 supportsBackgroundRefresh:(BOOL)a4 lastRelevanceUpdate:(double)a5 relevances:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  CHSWidgetRelevanceProperties *v15;
  _QWORD v17[4];
  id v18;

  v8 = a4;
  v10 = a3;
  v11 = a6;
  objc_msgSend(v10, "extensionIdentity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "kind");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __116__CHSWidgetRelevanceProperties_initWithWidgetRelevanceKey_supportsBackgroundRefresh_lastRelevanceUpdate_relevances___block_invoke;
  v17[3] = &unk_1E2A5A218;
  v14 = v11;
  v18 = v14;
  v15 = -[CHSWidgetRelevanceProperties initWithWidgetExtensionIdentity:kind:supportsBackgroundRefresh:lastRelevanceUpdate:relevanceFunction:](self, "initWithWidgetExtensionIdentity:kind:supportsBackgroundRefresh:lastRelevanceUpdate:relevanceFunction:", v12, v13, v8, v17, a5);

  return v15;
}

id __116__CHSWidgetRelevanceProperties_initWithWidgetRelevanceKey_supportsBackgroundRefresh_lastRelevanceUpdate_relevances___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (CHSWidgetRelevanceProperties)initWithWidgetExtensionIdentity:(id)a3 kind:(id)a4 supportsBackgroundRefresh:(BOOL)a5 lastRelevanceUpdate:(double)a6 relevances:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  CHSWidgetRelevanceProperties *v14;
  _QWORD v16[4];
  id v17;

  v8 = a5;
  v12 = a7;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __126__CHSWidgetRelevanceProperties_initWithWidgetExtensionIdentity_kind_supportsBackgroundRefresh_lastRelevanceUpdate_relevances___block_invoke;
  v16[3] = &unk_1E2A5A218;
  v17 = v12;
  v13 = v12;
  v14 = -[CHSWidgetRelevanceProperties initWithWidgetExtensionIdentity:kind:supportsBackgroundRefresh:lastRelevanceUpdate:relevanceFunction:](self, "initWithWidgetExtensionIdentity:kind:supportsBackgroundRefresh:lastRelevanceUpdate:relevanceFunction:", a3, a4, v8, v16, a6);

  return v14;
}

id __126__CHSWidgetRelevanceProperties_initWithWidgetExtensionIdentity_kind_supportsBackgroundRefresh_lastRelevanceUpdate_relevances___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (CHSWidgetRelevanceProperties)initWithSupportsBackgroundRefresh:(BOOL)a3 lastRelevanceUpdate:(double)a4 relevances:(id)a5
{
  id v8;
  CHSWidgetRelevanceProperties *v9;
  CHSWidgetRelevanceProperties *v10;
  CHSExtensionIdentity *extensionIdentity;
  NSString *kind;
  void *v13;
  id relevanceFunction;
  _QWORD aBlock[4];
  id v17;
  objc_super v18;

  v8 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CHSWidgetRelevanceProperties;
  v9 = -[CHSWidgetRelevanceProperties init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    extensionIdentity = v9->_extensionIdentity;
    v9->_extensionIdentity = 0;

    kind = v10->_kind;
    v10->_kind = 0;

    v10->_supportsBackgroundRefresh = a3;
    v10->_lastRelevanceUpdate = a4;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __97__CHSWidgetRelevanceProperties_initWithSupportsBackgroundRefresh_lastRelevanceUpdate_relevances___block_invoke;
    aBlock[3] = &unk_1E2A5A218;
    v17 = v8;
    v13 = _Block_copy(aBlock);
    relevanceFunction = v10->_relevanceFunction;
    v10->_relevanceFunction = v13;

  }
  return v10;
}

id __97__CHSWidgetRelevanceProperties_initWithSupportsBackgroundRefresh_lastRelevanceUpdate_relevances___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (CHSWidgetRelevanceProperties)initWithWidgetExtensionIdentity:(id)a3 kind:(id)a4 supportsBackgroundRefresh:(BOOL)a5 lastRelevanceUpdate:(double)a6 relevanceFunction:(id)a7
{
  id v13;
  id v14;
  id v15;
  CHSWidgetRelevanceProperties *v16;
  CHSWidgetRelevanceProperties *v17;
  void *v18;
  id relevanceFunction;
  objc_super v21;

  v13 = a3;
  v14 = a4;
  v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)CHSWidgetRelevanceProperties;
  v16 = -[CHSWidgetRelevanceProperties init](&v21, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_extensionIdentity, a3);
    objc_storeStrong((id *)&v17->_kind, a4);
    v17->_supportsBackgroundRefresh = a5;
    v17->_lastRelevanceUpdate = a6;
    v18 = _Block_copy(v15);
    relevanceFunction = v17->_relevanceFunction;
    v17->_relevanceFunction = v18;

  }
  return v17;
}

- (CHSWidgetRelevanceKey)key
{
  return -[CHSWidgetRelevanceKey initWithExtensionIdentity:kind:]([CHSWidgetRelevanceKey alloc], "initWithExtensionIdentity:kind:", self->_extensionIdentity, self->_kind);
}

- (NSArray)relevances
{
  return (NSArray *)(*((uint64_t (**)(void))self->_relevanceFunction + 2))();
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  unint64_t v10;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:", self->_extensionIdentity);
  v5 = (id)objc_msgSend(v3, "appendObject:", self->_kind);
  v6 = (id)objc_msgSend(v3, "appendBool:", self->_supportsBackgroundRefresh);
  v7 = (id)objc_msgSend(v3, "appendDouble:", self->_lastRelevanceUpdate);
  -[CHSWidgetRelevanceProperties relevances](self, "relevances");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendObject:", v8);

  v10 = objc_msgSend(v3, "hash");
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && BSEqualObjects()
    && BSEqualObjects()
    && BSEqualBools()
    && BSEqualDoubles())
  {
    -[CHSWidgetRelevanceProperties relevances](self, "relevances");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "relevances");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = BSEqualObjects();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)matches:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_msgSend(v4, "extensionIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", self->_extensionIdentity))
  {
    objc_msgSend(v4, "kind");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqual:", self->_kind);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", self->_extensionIdentity, CFSTR("extensionIdentity"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_kind, CFSTR("kind"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_supportsBackgroundRefresh, CFSTR("supportsBackgroundRefresh"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("lastRelevanceUpdate"), self->_lastRelevanceUpdate);
  -[CHSWidgetRelevanceProperties relevances](self, "relevances");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("relevances"));

}

- (CHSWidgetRelevanceProperties)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  CHSWidgetRelevanceProperties *v14;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extensionIdentity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kind"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsBackgroundRefresh"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("lastRelevanceUpdate"));
  v9 = v8;
  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("relevances"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[CHSWidgetRelevanceProperties initWithWidgetExtensionIdentity:kind:supportsBackgroundRefresh:lastRelevanceUpdate:relevances:](self, "initWithWidgetExtensionIdentity:kind:supportsBackgroundRefresh:lastRelevanceUpdate:relevances:", v5, v6, v7, v13, v9);

  return v14;
}

- (CHSExtensionIdentity)extensionIdentity
{
  return self->_extensionIdentity;
}

- (NSString)kind
{
  return self->_kind;
}

- (BOOL)supportsBackgroundRefresh
{
  return self->_supportsBackgroundRefresh;
}

- (double)lastRelevanceUpdate
{
  return self->_lastRelevanceUpdate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_extensionIdentity, 0);
  objc_storeStrong(&self->_relevanceFunction, 0);
}

@end
