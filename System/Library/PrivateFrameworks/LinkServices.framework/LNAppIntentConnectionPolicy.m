@implementation LNAppIntentConnectionPolicy

- (id)actionWithParameters:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];

  v4 = (objc_class *)MEMORY[0x1E0D43B80];
  v5 = a3;
  v6 = [v4 alloc];
  -[LNAppIntentConnectionPolicy metadata](self, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAppIntentConnectionPolicy appIntentMangledTypeName](self, "appIntentMangledTypeName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52__LNAppIntentConnectionPolicy_actionWithParameters___block_invoke;
  v12[3] = &unk_1E45DC2C0;
  v12[4] = self;
  objc_msgSend(v5, "if_map:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v6, "initWithMetadata:mangledTypeName:parameters:", v7, v8, v9);
  return v10;
}

- (BOOL)openAppWhenRun
{
  return -[LNActionMetadata openAppWhenRun](self->_metadata, "openAppWhenRun");
}

- (NSString)appIntentIdentifier
{
  return (NSString *)-[LNActionMetadata identifier](self->_metadata, "identifier");
}

- (LNAppIntentConnectionPolicy)initWithAppIntentMetadata:(id)a3 effectiveBundleIdentifier:(id)a4 appBundleIdentifier:(id)a5
{
  id v10;
  id v11;
  id v12;
  LNAppIntentConnectionPolicy *v13;
  LNAppIntentConnectionPolicy *v14;
  uint64_t v15;
  LNEffectiveBundleIdentifier *effectiveBundleIdentifier;
  uint64_t v17;
  NSString *appBundleIdentifier;
  LNAppIntentConnectionPolicy *v19;
  void *v21;
  void *v22;
  objc_super v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNAppIntentConnectionPolicy.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("metadata"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNAppIntentConnectionPolicy.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("effectiveBundleIdentifier"));

LABEL_3:
  v23.receiver = self;
  v23.super_class = (Class)LNAppIntentConnectionPolicy;
  v13 = -[LNAppIntentConnectionPolicy init](&v23, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_metadata, a3);
    v15 = objc_msgSend(v11, "copy");
    effectiveBundleIdentifier = v14->_effectiveBundleIdentifier;
    v14->_effectiveBundleIdentifier = (LNEffectiveBundleIdentifier *)v15;

    v17 = objc_msgSend(v12, "copy");
    appBundleIdentifier = v14->_appBundleIdentifier;
    v14->_appBundleIdentifier = (NSString *)v17;

    v19 = v14;
  }

  return v14;
}

- (id)connectionWithError:(id *)a3
{
  return -[LNAppIntentConnectionPolicy connectionWithUserIdentity:error:](self, "connectionWithUserIdentity:error:", 0, a3);
}

- (NSString)appIntentMangledTypeName
{
  LNActionMetadata *metadata;
  void *v3;
  void *v4;
  void *v5;

  metadata = self->_metadata;
  -[LNAppIntentConnectionPolicy effectiveBundleIdentifier](self, "effectiveBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionMetadata mangledTypeNameForBundleIdentifier:](metadata, "mangledTypeNameForBundleIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (LNEffectiveBundleIdentifier)effectiveBundleIdentifier
{
  return self->_effectiveBundleIdentifier;
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_effectiveBundleIdentifier, 0);
}

- (BOOL)reuseConnectionIfPossible
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[LNAppIntentConnectionPolicy metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemProtocols");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D43E18], "cameraCaptureProtocol");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "containsObject:", v4);

  return v5 ^ 1;
}

- (id)connectionWithUserIdentity:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;

  v6 = a3;
  v7 = -[LNAppIntentConnectionPolicy reuseConnectionIfPossible](self, "reuseConnectionIfPossible");
  +[LNConnectionManager sharedInstance](LNConnectionManager, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAppIntentConnectionPolicy effectiveBundleIdentifier](self, "effectiveBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[LNAppIntentConnectionPolicy effectiveBundleIdentifier](self, "effectiveBundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "url");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0CB37E8];
    -[LNAppIntentConnectionPolicy effectiveBundleIdentifier](self, "effectiveBundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "numberWithInteger:", objc_msgSend(v14, "type"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNAppIntentConnectionPolicy appBundleIdentifier](self, "appBundleIdentifier");
    v22 = v9;
    v16 = v8;
    v17 = objc_claimAutoreleasedReturnValue();
    -[LNAppIntentConnectionPolicy appIntentMangledTypeName](self, "appIntentMangledTypeName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "connectionForBundleIdentifier:bundleURL:bundleType:appBundleIdentifier:mangledTypeName:userIdentity:error:", v10, v12, v15, v17, v18, v6, a4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (id)v17;
    v8 = v16;
    v9 = v22;
  }
  else
  {
    v20 = (void *)MEMORY[0x1E0CB37E8];
    -[LNAppIntentConnectionPolicy effectiveBundleIdentifier](self, "effectiveBundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "numberWithInteger:", objc_msgSend(v11, "type"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNAppIntentConnectionPolicy appBundleIdentifier](self, "appBundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNAppIntentConnectionPolicy appIntentMangledTypeName](self, "appIntentMangledTypeName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v8, "newConnectionForBundleIdentifier:bundleURL:bundleType:appBundleIdentifier:mangledTypeName:userIdentity:error:", v10, 0, v12, v14, v15, v6, a4);
  }

  return v19;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAppIntentConnectionPolicy appIntentIdentifier](self, "appIntentIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAppIntentConnectionPolicy appIntentMangledTypeName](self, "appIntentMangledTypeName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[LNAppIntentConnectionPolicy openAppWhenRun](self, "openAppWhenRun"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  -[LNAppIntentConnectionPolicy effectiveBundleIdentifier](self, "effectiveBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAppIntentConnectionPolicy appBundleIdentifier](self, "appBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, appIntentIdentifier: %@, appIntentMangledTypeName: %@, openAppWhenRun: %@, effectiveBundleIdentifier: %@, appBundleIdentifier: %@>"), v5, self, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;

  -[LNAppIntentConnectionPolicy appIntentIdentifier](self, "appIntentIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[LNAppIntentConnectionPolicy appIntentMangledTypeName](self, "appIntentMangledTypeName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = v6 ^ -[LNAppIntentConnectionPolicy openAppWhenRun](self, "openAppWhenRun");
  -[LNAppIntentConnectionPolicy effectiveBundleIdentifier](self, "effectiveBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");
  -[LNAppIntentConnectionPolicy appBundleIdentifier](self, "appBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v7 ^ v9 ^ objc_msgSend(v10, "hash");

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  LNAppIntentConnectionPolicy *v4;
  LNAppIntentConnectionPolicy *v5;
  LNAppIntentConnectionPolicy *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v27;

  v4 = (LNAppIntentConnectionPolicy *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_32:

      goto LABEL_33;
    }
    -[LNAppIntentConnectionPolicy appIntentIdentifier](self, "appIntentIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNAppIntentConnectionPolicy appIntentIdentifier](v6, "appIntentIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v13 = v10;
      v14 = v9;
      if (!v9 || !v10)
        goto LABEL_30;
      v15 = objc_msgSend(v9, "isEqualToString:", v10);

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_31:

        goto LABEL_32;
      }
    }
    -[LNAppIntentConnectionPolicy appIntentMangledTypeName](self, "appIntentMangledTypeName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNAppIntentConnectionPolicy appIntentMangledTypeName](v6, "appIntentMangledTypeName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v16;
    v18 = v17;
    v13 = v18;
    if (v14 == v18)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v19 = v18;
      v20 = v14;
      if (!v14 || !v18)
        goto LABEL_29;
      v12 = objc_msgSend(v14, "isEqualToString:", v18);

      if (!v12)
        goto LABEL_30;
    }
    v21 = -[LNAppIntentConnectionPolicy openAppWhenRun](self, "openAppWhenRun");
    if (v21 != -[LNAppIntentConnectionPolicy openAppWhenRun](v6, "openAppWhenRun"))
    {
      LOBYTE(v12) = 0;
LABEL_30:

      goto LABEL_31;
    }
    -[LNAppIntentConnectionPolicy effectiveBundleIdentifier](self, "effectiveBundleIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNAppIntentConnectionPolicy effectiveBundleIdentifier](v6, "effectiveBundleIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v22;
    v24 = v23;
    v19 = v24;
    if (v20 == v24)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      if (!v20)
      {
        v27 = 0;
        goto LABEL_28;
      }
      v27 = v20;
      if (!v24)
      {
LABEL_28:

LABEL_29:
        goto LABEL_30;
      }
      v12 = objc_msgSend(v20, "isEqual:", v24);

      if (!v12)
        goto LABEL_29;
    }
    -[LNAppIntentConnectionPolicy appBundleIdentifier](self, "appBundleIdentifier");
    v25 = objc_claimAutoreleasedReturnValue();
    -[LNAppIntentConnectionPolicy appBundleIdentifier](v6, "appBundleIdentifier");
    v24 = (id)objc_claimAutoreleasedReturnValue();
    v27 = (void *)v25;
    LOBYTE(v12) = v25 == (_QWORD)v24;
    goto LABEL_28;
  }
  LOBYTE(v12) = 1;
LABEL_33:

  return v12;
}

- (LNActionMetadata)metadata
{
  return self->_metadata;
}

id __52__LNAppIntentConnectionPolicy_actionWithParameters___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;

  v3 = a2;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;
  objc_msgSend(v5, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = objc_alloc_init(MEMORY[0x1E0D43D60]);
  v9 = v8;

  objc_msgSend(*(id *)(a1 + 32), "metadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "parameters");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __52__LNAppIntentConnectionPolicy_actionWithParameters___block_invoke_2;
  v19[3] = &unk_1E45DC298;
  v20 = v5;
  v12 = v5;
  objc_msgSend(v11, "if_firstObjectPassingTest:", v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setSecure:", ((unint64_t)objc_msgSend(v13, "capabilities") >> 4) & 1);
  v14 = objc_alloc(MEMORY[0x1E0D43D50]);
  objc_msgSend(v3, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v14, "initWithIdentifier:value:configuration:", v15, v16, v9);

  return v17;
}

uint64_t __52__LNAppIntentConnectionPolicy_actionWithParameters___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

- (int64_t)bundleMetadataVersion
{
  return -[LNActionMetadata bundleMetadataVersion](self->_metadata, "bundleMetadataVersion");
}

- (id)newConnectionForSpringBoardOnlyWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  +[LNConnectionManager sharedInstance](LNConnectionManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAppIntentConnectionPolicy effectiveBundleIdentifier](self, "effectiveBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[LNAppIntentConnectionPolicy effectiveBundleIdentifier](self, "effectiveBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v9, "type"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAppIntentConnectionPolicy appBundleIdentifier](self, "appBundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAppIntentConnectionPolicy appIntentMangledTypeName](self, "appIntentMangledTypeName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v5, "newConnectionForBundleIdentifier:bundleURL:bundleType:appBundleIdentifier:mangledTypeName:userIdentity:error:", v7, 0, v10, v11, v12, 0, a3);

  return v13;
}

@end
