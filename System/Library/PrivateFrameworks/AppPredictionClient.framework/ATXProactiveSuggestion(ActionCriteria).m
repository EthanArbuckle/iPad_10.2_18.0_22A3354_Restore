@implementation ATXProactiveSuggestion(ActionCriteria)

- (ATXActionCriteria)atxActionCriteria
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  ATXActionCriteria *v9;
  ATXActionCriteria *v10;

  objc_msgSend(a1, "atxActionExecutableObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "atxSpotlightActionExecutableObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "atxShortcutsActionExecutableObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "criteria");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = v2;
  }
  else
  {
    objc_msgSend(v3, "criteria");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v6 = v3;
    }
    else
    {
      objc_msgSend(v4, "criteria");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        v9 = objc_alloc_init(ATXActionCriteria);
        goto LABEL_8;
      }
      v6 = v4;
    }
  }
  objc_msgSend(v6, "criteria");
  v9 = (ATXActionCriteria *)objc_claimAutoreleasedReturnValue();
LABEL_8:
  v10 = v9;

  return v10;
}

@end
