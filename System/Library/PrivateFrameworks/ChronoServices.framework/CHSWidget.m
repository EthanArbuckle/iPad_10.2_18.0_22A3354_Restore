@implementation CHSWidget

uint64_t __21__CHSWidget_isEqual___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "activityIdentifier");
}

uint64_t __21__CHSWidget_isEqual___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "stableHash");
}

uint64_t __21__CHSWidget_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "family");
}

uint64_t __21__CHSWidget_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "kind");
}

uint64_t __21__CHSWidget_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "extensionIdentity");
}

- (NSString)kind
{
  return self->_kind;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  int64_t v17;
  id v18;
  id v19;
  int64_t v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  v7 = v4;
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  -[CHSWidget extensionIdentity](self, "extensionIdentity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __21__CHSWidget_isEqual___block_invoke;
  v35[3] = &unk_1E2A5A268;
  v12 = v9;
  v36 = v12;
  v13 = (id)objc_msgSend(v5, "appendObject:counterpart:", v10, v35);

  -[CHSWidget kind](self, "kind");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v11;
  v33[1] = 3221225472;
  v33[2] = __21__CHSWidget_isEqual___block_invoke_2;
  v33[3] = &unk_1E2A5A5A8;
  v15 = v12;
  v34 = v15;
  v16 = (id)objc_msgSend(v5, "appendString:counterpart:", v14, v33);

  v17 = -[CHSWidget family](self, "family");
  v31[0] = v11;
  v31[1] = 3221225472;
  v31[2] = __21__CHSWidget_isEqual___block_invoke_3;
  v31[3] = &unk_1E2A5A5D0;
  v18 = v15;
  v32 = v18;
  v19 = (id)objc_msgSend(v5, "appendInteger:counterpart:", v17, v31);
  v20 = -[CHSIntentReference stableHash](self->_intentReference, "stableHash");
  v29[0] = v11;
  v29[1] = 3221225472;
  v29[2] = __21__CHSWidget_isEqual___block_invoke_4;
  v29[3] = &unk_1E2A5A5D0;
  v21 = v18;
  v30 = v21;
  v22 = (id)objc_msgSend(v5, "appendInt64:counterpart:", v20, v29);
  -[CHSWidget activityIdentifier](self, "activityIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v11;
  v27[1] = 3221225472;
  v27[2] = __21__CHSWidget_isEqual___block_invoke_5;
  v27[3] = &unk_1E2A5A5A8;
  v24 = v21;
  v28 = v24;
  v25 = (id)objc_msgSend(v5, "appendString:counterpart:", v23, v27);

  LOBYTE(v23) = objc_msgSend(v5, "isEqual");
  return (char)v23;
}

- (id)intent
{
  return -[CHSIntentReference intent](self->_intentReference, "intent");
}

- (CHSWidget)initWithExtensionIdentity:(id)a3 kind:(id)a4 family:(int64_t)a5 intentReference:(id)a6 activityIdentifier:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  CHSWidget *v16;
  uint64_t v17;
  CHSExtensionIdentity *extensionIdentity;
  uint64_t v19;
  NSString *kind;
  uint64_t v21;
  NSString *activityIdentifier;
  void *v23;
  BOOL v24;
  NSObject *v25;
  void *v26;
  objc_super v28;
  uint8_t buf[24];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v28.receiver = self;
  v28.super_class = (Class)CHSWidget;
  v16 = -[CHSWidget init](&v28, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    extensionIdentity = v16->_extensionIdentity;
    v16->_extensionIdentity = (CHSExtensionIdentity *)v17;

    v19 = objc_msgSend(v13, "copy");
    kind = v16->_kind;
    v16->_kind = (NSString *)v19;

    v16->_family = a5;
    objc_storeStrong((id *)&v16->_intentReference, a6);
    v21 = objc_msgSend(v15, "copy");
    activityIdentifier = v16->_activityIdentifier;
    v16->_activityIdentifier = (NSString *)v21;

    -[CHSExtensionIdentity extensionBundleIdentifier](v16->_extensionIdentity, "extensionBundleIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "length"))
    {
      v24 = -[NSString length](v16->_kind, "length") == 0;

      if (!v24)
        goto LABEL_9;
    }
    else
    {

    }
    CHSLogChronoServices();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      -[CHSExtensionIdentity extensionBundleIdentifier](v16->_extensionIdentity, "extensionBundleIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[CHSWidget initWithExtensionIdentity:kind:family:intentReference:activityIdentifier:].cold.1(v26, (uint64_t *)&v16->_kind, buf, v25);
    }

  }
LABEL_9:

  return v16;
}

- (CHSWidget)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  CHSWidget *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extensionIdentity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kind"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("family"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("intent2"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activityIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  if (v5 && v6)
  {
    if (CHSWidgetFamilyIsValid(v8))
    {
      self = -[CHSWidget initWithExtensionIdentity:kind:family:intentReference:activityIdentifier:](self, "initWithExtensionIdentity:kind:family:intentReference:activityIdentifier:", v5, v6, v8, v9, v10);
      v11 = self;
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  unint64_t v12;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHSWidget extensionIdentity](self, "extensionIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:", v4);

  -[CHSWidget activityIdentifier](self, "activityIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendString:", v6);

  -[CHSWidget kind](self, "kind");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendString:", v8);

  v10 = (id)objc_msgSend(v3, "appendInteger:", -[CHSWidget family](self, "family"));
  v11 = (id)objc_msgSend(v3, "appendInt64:", -[CHSIntentReference stableHash](self->_intentReference, "stableHash"));
  v12 = objc_msgSend(v3, "hash");

  return v12;
}

- (int64_t)family
{
  return self->_family;
}

- (CHSExtensionIdentity)extensionIdentity
{
  return self->_extensionIdentity;
}

- (id)extensionBundleIdentifier
{
  return -[CHSExtensionIdentity extensionBundleIdentifier](self->_extensionIdentity, "extensionBundleIdentifier");
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", self->_extensionIdentity, CFSTR("extensionIdentity"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_kind, CFSTR("kind"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_family);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("family"));

  objc_msgSend(v5, "encodeObject:forKey:", self->_intentReference, CFSTR("intent2"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_activityIdentifier, CFSTR("activityIdentifier"));

}

- (NSString)activityIdentifier
{
  return self->_activityIdentifier;
}

- (id)_loggingIdentifierWithMetrics:(id)a3 prefix:(id)a4
{
  id v6;
  __CFString *v7;
  CHSIntentReference *intentReference;
  void *v9;
  __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  __CFString *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  NSString *kind;
  void *v22;
  void *v23;

  v6 = a3;
  v7 = (__CFString *)a4;
  intentReference = self->_intentReference;
  if (intentReference)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[CHSIntentReference stableHash](intentReference, "stableHash"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringValue");
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = &stru_1E2A5F050;
  }
  if (v6)
  {
    objc_msgSend(v6, "size");
    v12 = v11;
    v14 = v13;
    v15 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "cornerRadius");
    objc_msgSend(v15, "stringWithFormat:", CFSTR(":%.2f/%.2f/%.2f"), v12, v14, v16);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = &stru_1E2A5F050;
  }
  v18 = (void *)MEMORY[0x1E0CB3940];
  if (v7)
    v19 = v7;
  else
    v19 = &stru_1E2A5F050;
  -[CHSExtensionIdentity description](self->_extensionIdentity, "description");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  kind = self->_kind;
  CHSWidgetFamilyDescription(self->_family);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("%@[%@:%@:%@:%@%@:%@]"), v19, v20, kind, v22, v10, v17, self->_activityIdentifier);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)_loggingIdentifierWithMetrics:(id)a3
{
  -[CHSWidget _loggingIdentifierWithMetrics:prefix:](self, "_loggingIdentifierWithMetrics:prefix:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIdentifier, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_extensionIdentity, 0);
  objc_storeStrong((id *)&self->_intentReference, 0);
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (CHSWidget)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CHSWidget.m"), 36, CFSTR("Use initWithExtensionBundleIdentifier:kind:family:intent:"));

  return 0;
}

- (CHSWidget)initWithExtensionIdentity:(id)a3 kind:(id)a4 family:(int64_t)a5 intent:(id)a6 activityIdentifier:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  CHSIntentReference *v16;
  CHSWidget *v17;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  if (v14)
    v16 = -[CHSIntentReference initWithIntent:]([CHSIntentReference alloc], "initWithIntent:", v14);
  else
    v16 = 0;
  v17 = -[CHSWidget initWithExtensionIdentity:kind:family:intentReference:activityIdentifier:](self, "initWithExtensionIdentity:kind:family:intentReference:activityIdentifier:", v12, v13, a5, v16, v15);

  return v17;
}

- (CHSWidget)initWithWidgetIdentity:(id)a3 family:(int64_t)a4 intent:(id)a5 activityIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  CHSWidget *v15;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v10, "extensionIdentity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "kind");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[CHSWidget initWithExtensionIdentity:kind:family:intent:activityIdentifier:](self, "initWithExtensionIdentity:kind:family:intent:activityIdentifier:", v13, v14, a4, v11, v12);

  return v15;
}

- (id)widgetByReplacingIntent:(id)a3
{
  id v4;
  CHSWidget *v5;
  void *v6;
  void *v7;
  int64_t v8;
  void *v9;
  CHSWidget *v10;

  v4 = a3;
  v5 = [CHSWidget alloc];
  -[CHSWidget extensionIdentity](self, "extensionIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHSWidget kind](self, "kind");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CHSWidget family](self, "family");
  -[CHSWidget activityIdentifier](self, "activityIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CHSWidget initWithExtensionIdentity:kind:family:intent:activityIdentifier:](v5, "initWithExtensionIdentity:kind:family:intent:activityIdentifier:", v6, v7, v8, v4, v9);

  return v10;
}

- (BOOL)matches:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[CHSWidget extensionIdentity](self, "extensionIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extensionIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (BSEqualObjects())
  {
    -[CHSWidget kind](self, "kind");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "kind");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = BSEqualStrings();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)matchesPersonality:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  -[CHSWidget extensionIdentity](self, "extensionIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extensionBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extensionBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (BSEqualStrings())
  {
    -[CHSWidget kind](self, "kind");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "kind");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = BSEqualStrings();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[CHSWidget succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHSWidget extensionIdentity](self, "extensionIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("extensionIdentity"));

  -[CHSWidget kind](self, "kind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v6, CFSTR("kind"));

  CHSWidgetFamilyDescription(-[CHSWidget family](self, "family"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v7, CFSTR("family"));

  v8 = (id)objc_msgSend(v3, "appendInt64:withName:", -[CHSIntentReference stableHash](self->_intentReference, "stableHash"), CFSTR("intentHash"));
  -[CHSWidget activityIdentifier](self, "activityIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v9, CFSTR("activityIdentifier"));

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[CHSWidget descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  CHSWidget *v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__CHSWidget_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E2A5A290;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);
  v7 = v6;

  return v7;
}

void __51__CHSWidget_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "extensionIdentity");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "appendObject:withName:");

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "kind");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:");

  v5 = *(void **)(a1 + 32);
  CHSWidgetFamilyDescription(objc_msgSend(*(id *)(a1 + 40), "family"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:withName:");

  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("intent"));
  v7 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "activityIdentifier");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendString:withName:");

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_extensionIdentity, CFSTR("extensionIdentity"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_kind, CFSTR("kind"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_family, CFSTR("family"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_intentReference, CFSTR("intent2"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_activityIdentifier, CFSTR("activityIdentifier"));

}

- (CHSWidget)initWithCoder:(id)a3
{
  id v4;
  CHSExtensionIdentity *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  CHSExtensionIdentity *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  CHSWidget *v13;
  unint64_t v14;
  CHSIntentReference *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;

  v4 = a3;
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("extensionIdentity")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extensionIdentity"));
    v5 = (CHSExtensionIdentity *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extensionBundleIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("containerBundleIdentifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v5 = 0;
    if (v6 && v7)
    {
      v9 = [CHSExtensionIdentity alloc];
      getDeviceIDFromBundleID(v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[CHSExtensionIdentity initWithExtensionBundleIdentifier:containerBundleIdentifier:deviceIdentifier:](v9, "initWithExtensionBundleIdentifier:containerBundleIdentifier:deviceIdentifier:", v6, v8, v10);

    }
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kind"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("family"));
  v13 = 0;
  if (v5 && v11)
  {
    v14 = v12;
    if ((CHSWidgetFamilyIsValid(v12) & 1) != 0)
    {
      if (objc_msgSend(v4, "containsValueForKey:", CFSTR("intent2")))
      {
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("intent2"));
        v15 = (CHSIntentReference *)objc_claimAutoreleasedReturnValue();
LABEL_22:
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activityIdentifier"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        self = -[CHSWidget initWithExtensionIdentity:kind:family:intentReference:activityIdentifier:](self, "initWithExtensionIdentity:kind:family:intentReference:activityIdentifier:", v5, v11, v14, v15, v22);

        v13 = self;
        goto LABEL_23;
      }
      v16 = (void *)MEMORY[0x1E0C99E60];
      v17 = objc_opt_class();
      objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("intent"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v19, 0);
        v20 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v21 = 0;
          goto LABEL_20;
        }
        v20 = v19;
      }
      v21 = v20;
      if (v20)
      {
        v15 = -[CHSIntentReference initWithIntent:]([CHSIntentReference alloc], "initWithIntent:", v20);
LABEL_21:

        goto LABEL_22;
      }
LABEL_20:
      v15 = 0;
      goto LABEL_21;
    }
    v13 = 0;
  }
LABEL_23:

  return v13;
}

- (id)_loggingIdentifierWithoutMetrics
{
  return -[CHSWidget _loggingIdentifierWithMetrics:](self, "_loggingIdentifierWithMetrics:", 0);
}

- (CHSWidget)initWithExtensionBundleIdentifier:(id)a3 kind:(id)a4 family:(int64_t)a5 intent:(id)a6
{
  return -[CHSWidget initWithExtensionBundleIdentifier:containerBundleIdentifier:kind:family:intent:activityIdentifier:](self, "initWithExtensionBundleIdentifier:containerBundleIdentifier:kind:family:intent:activityIdentifier:", a3, 0, a4, a5, a6, 0);
}

- (CHSWidget)initWithExtensionBundleIdentifier:(id)a3 containerBundleIdentifier:(id)a4 kind:(id)a5 family:(int64_t)a6 intent:(id)a7
{
  return -[CHSWidget initWithExtensionBundleIdentifier:containerBundleIdentifier:kind:family:intent:activityIdentifier:](self, "initWithExtensionBundleIdentifier:containerBundleIdentifier:kind:family:intent:activityIdentifier:", a3, a4, a5, a6, a7, 0);
}

- (CHSWidget)initWithExtensionBundleIdentifier:(id)a3 containerBundleIdentifier:(id)a4 kind:(id)a5 family:(int64_t)a6 intent:(id)a7 activityIdentifier:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  CHSExtensionIdentity *v19;
  void *v20;
  CHSExtensionIdentity *v21;
  CHSWidget *v22;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  v19 = [CHSExtensionIdentity alloc];
  getDeviceIDFromBundleID(v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[CHSExtensionIdentity initWithExtensionBundleIdentifier:containerBundleIdentifier:deviceIdentifier:](v19, "initWithExtensionBundleIdentifier:containerBundleIdentifier:deviceIdentifier:", v14, v15, v20);
  v22 = -[CHSWidget initWithExtensionIdentity:kind:family:intent:activityIdentifier:](self, "initWithExtensionIdentity:kind:family:intent:activityIdentifier:", v21, v16, a6, v17, v18);

  return v22;
}

- (CHSWidget)initWithPersonality:(id)a3 family:(int64_t)a4 intent:(id)a5
{
  id v8;
  id v9;
  CHSExtensionIdentity *v10;
  void *v11;
  CHSExtensionIdentity *v12;
  void *v13;
  CHSWidget *v14;

  v8 = a3;
  v9 = a5;
  v10 = [CHSExtensionIdentity alloc];
  objc_msgSend(v8, "extensionBundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[CHSExtensionIdentity initWithExtensionBundleIdentifier:containerBundleIdentifier:deviceIdentifier:](v10, "initWithExtensionBundleIdentifier:containerBundleIdentifier:deviceIdentifier:", v11, 0, 0);

  objc_msgSend(v8, "kind");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[CHSWidget initWithExtensionIdentity:kind:family:intent:activityIdentifier:](self, "initWithExtensionIdentity:kind:family:intent:activityIdentifier:", v12, v13, a4, v9, 0);

  return v14;
}

- (id)containerBundleIdentifier
{
  return -[CHSExtensionIdentity containerBundleIdentifier](self->_extensionIdentity, "containerBundleIdentifier");
}

- (id)sourceDeviceIdentifier
{
  return -[CHSExtensionIdentity deviceIdentifier](self->_extensionIdentity, "deviceIdentifier");
}

- (CHSIntentReference)intentReference
{
  return self->_intentReference;
}

- (void)initWithExtensionIdentity:(uint8_t *)buf kind:(os_log_t)log family:intentReference:activityIdentifier:.cold.1(void *a1, uint64_t *a2, uint8_t *buf, os_log_t log)
{
  uint64_t v5;

  v5 = *a2;
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = v5;
  _os_log_fault_impl(&dword_18FB18000, log, OS_LOG_TYPE_FAULT, "CHSWidget initialized with bad bundle identifier (%@) or kind (%@)", buf, 0x16u);

}

@end
