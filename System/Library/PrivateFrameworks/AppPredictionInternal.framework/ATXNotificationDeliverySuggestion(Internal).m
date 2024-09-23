@implementation ATXNotificationDeliverySuggestion(Internal)

- (id)feedbackKey
{
  uint64_t v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(a1, "subObject");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2
    && (v3 = (void *)v2,
        objc_msgSend(a1, "subObject"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "conformsToProtocol:", &unk_1EF9ED4E8),
        v4,
        v3,
        v5))
  {
    objc_msgSend(a1, "subObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "feedbackKeyComponent");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = &stru_1E82FDC98;
  }
  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "subtype");
  ATXSuggestionTypeToString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "entityIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "scope");
  ATXNotificationSuggestionScopeToString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("subtype:%@_entityIdentifier:%@_scope:%@"), v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("primary:%@__subobject:%@"), v12, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
