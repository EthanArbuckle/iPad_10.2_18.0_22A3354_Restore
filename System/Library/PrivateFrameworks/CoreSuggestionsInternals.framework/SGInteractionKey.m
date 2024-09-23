@implementation SGInteractionKey

- (SGInteractionKey)initWithBundleId:(id)a3 personHandle:(id)a4
{
  id v7;
  id v8;
  void *v9;
  SGInteractionKey *v10;
  void *v12;
  void *v13;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGInteractionKey.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleId"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGInteractionKey.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("personHandle"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v14.receiver = self;
  v14.super_class = (Class)SGInteractionKey;
  v10 = -[SGMessageKey initWithSource:uniqueIdentifier:](&v14, sel_initWithSource_uniqueIdentifier_, v7, v9);

  return v10;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SGInteractionKey bundleId](self, "bundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGInteractionKey personHandle](self, "personHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<SGInteractionKey bundleId:%@ personHandle:%@>"), v4, v5);

  return v6;
}

+ (BOOL)isSupportedEntityType:(int64_t)a3
{
  return a3 == 16;
}

@end
