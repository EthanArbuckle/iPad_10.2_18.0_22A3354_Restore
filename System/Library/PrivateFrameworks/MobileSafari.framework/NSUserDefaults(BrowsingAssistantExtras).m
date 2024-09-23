@implementation NSUserDefaults(BrowsingAssistantExtras)

- (id)browsingAssistant_favoritedMenuActions
{
  void *v2;
  id v3;

  objc_msgSend(a1, "objectForKey:", CFSTR("SFFavoritedMenuActions"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && !objc_msgSend(v2, "safari_containsObjectPassingTest:", &__block_literal_global_59))
  {
    v3 = v2;
  }
  else
  {
    objc_msgSend(a1, "setObject:forKey:", 0, CFSTR("SFFavoritedMenuActions"));
    v3 = (id)MEMORY[0x1E0C9AA60];
  }

  return v3;
}

- (uint64_t)browsingAssistant_setFavoritedMenuActions:()BrowsingAssistantExtras
{
  return objc_msgSend(a1, "setObject:forKey:", a3, CFSTR("SFFavoritedMenuActions"));
}

- (uint64_t)browsingAssistant_isMenuActionFavorited:()BrowsingAssistantExtras
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  if (SFIsMenuActionConfigurable(v4))
  {
    objc_msgSend(a1, "browsingAssistant_favoritedMenuActions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsObject:", v4);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)browsingAssistant_setMenuActionFavorited:()BrowsingAssistantExtras favorited:
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (SFIsMenuActionConfigurable(v8))
  {
    objc_msgSend(a1, "browsingAssistant_favoritedMenuActions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "containsObject:", v8) != a4)
    {
      if ((a4 & 1) != 0)
        objc_msgSend(v6, "arrayByAddingObject:", v8);
      else
        objc_msgSend(v6, "safari_arrayByRemovingObject:", v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "setObject:forKey:", v7, CFSTR("SFFavoritedMenuActions"));

    }
  }

}

@end
