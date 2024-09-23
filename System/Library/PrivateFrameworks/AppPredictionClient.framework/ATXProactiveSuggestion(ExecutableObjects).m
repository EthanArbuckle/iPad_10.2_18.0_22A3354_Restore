@implementation ATXProactiveSuggestion(ExecutableObjects)

- (id)bundleIdExecutableObject
{
  void *v1;
  void *v2;
  char isKindOfClass;
  void *v4;

  objc_msgSend(a1, "executableSpecification");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "executableType") == 1
    && (objc_msgSend(v1, "executableObject"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v2,
        (isKindOfClass & 1) != 0))
  {
    objc_msgSend(v1, "executableObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)heroDataExecutableObject
{
  void *v2;
  void *v3;
  char isKindOfClass;
  uint64_t v5;
  void *v6;

  objc_msgSend(a1, "executableSpecification");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "executableType") == 1
    && (objc_msgSend(v2, "executableObject"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v3,
        (isKindOfClass & 1) != 0))
  {
    objc_msgSend(v2, "executableObject");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "appClipHeroAppPredictionExecutableObject");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (id)appClipHeroAppPredictionExecutableObject
{
  void *v1;
  void *v2;
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;

  objc_msgSend(a1, "executableSpecification");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "executableType") != 5)
    goto LABEL_4;
  objc_msgSend(v1, "executableClassString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isEqualToString:", v4);

  if (v5)
  {
    objc_msgSend(v1, "executableObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_4:
    v6 = 0;
  }

  return v6;
}

- (id)atxActionExecutableObject
{
  void *v1;
  void *v2;
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;

  objc_msgSend(a1, "executableSpecification");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "executableType") != 2)
    goto LABEL_4;
  objc_msgSend(v1, "executableClassString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isEqualToString:", v4);

  if (v5)
  {
    objc_msgSend(v1, "executableObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_4:
    v6 = 0;
  }

  return v6;
}

- (id)atxInfoSuggestionExecutableObject
{
  void *v1;
  void *v2;
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;

  objc_msgSend(a1, "executableSpecification");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "executableType") != 3)
    goto LABEL_4;
  objc_msgSend(v1, "executableClassString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isEqualToString:", v4);

  if (v5)
  {
    objc_msgSend(v1, "executableObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_4:
    v6 = 0;
  }

  return v6;
}

- (id)atxSpotlightActionExecutableObject
{
  void *v1;
  void *v2;
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;

  objc_msgSend(a1, "executableSpecification");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "executableType") != 8)
    goto LABEL_4;
  objc_msgSend(v1, "executableClassString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isEqualToString:", v4);

  if (v5)
  {
    objc_msgSend(v1, "executableObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_4:
    v6 = 0;
  }

  return v6;
}

- (id)atxShortcutsActionExecutableObject
{
  void *v1;
  void *v2;
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;

  objc_msgSend(a1, "executableSpecification");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "executableType") != 9)
    goto LABEL_4;
  objc_msgSend(v1, "executableClassString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isEqualToString:", v4);

  if (v5)
  {
    objc_msgSend(v1, "executableObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_4:
    v6 = 0;
  }

  return v6;
}

- (id)linkActionExecutableObject
{
  void *v1;
  void *v2;
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;

  objc_msgSend(a1, "executableSpecification");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "executableType") != 10)
    goto LABEL_4;
  objc_msgSend(v1, "executableClassString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isEqualToString:", v4);

  if (v5)
  {
    objc_msgSend(v1, "executableObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_4:
    v6 = 0;
  }

  return v6;
}

- (id)genericStringForSuggestionExecutableObject
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "executableSpecification");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "executableObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "genericStringForExecutableObject:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (__CFString)genericStringForExecutableObject:()ExecutableObjects
{
  id v3;
  __CFString *v4;
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  objc_class *v13;
  id v14;
  id v15;
  void *v16;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "actionKey");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_10:
    v11 = v4;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (objc_class *)MEMORY[0x1E0CB3940];
    v6 = v3;
    v7 = [v5 alloc];
    objc_msgSend(v6, "appBundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "widgetBundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "widgetKind");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (__CFString *)objc_msgSend(v7, "initWithFormat:", CFSTR("%@:%@:%@"), v8, v9, v10);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "bundleId");
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = (__CFString *)v3;
      goto LABEL_10;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v11 = &stru_1E4D5DB30;
      goto LABEL_11;
    }
    v13 = (objc_class *)MEMORY[0x1E0CB3940];
    v14 = v3;
    v15 = [v13 alloc];
    objc_msgSend(v14, "bundleId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "action");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (__CFString *)objc_msgSend(v15, "initWithFormat:", CFSTR("%@:%@"), v8, v16);

  }
LABEL_11:

  return v11;
}

@end
