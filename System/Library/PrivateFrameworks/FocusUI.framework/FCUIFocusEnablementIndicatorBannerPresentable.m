@implementation FCUIFocusEnablementIndicatorBannerPresentable

- (FCUIFocusEnablementIndicatorBannerPresentable)initWithActivityDescription:(id)a3 requesterIdentifier:(id)a4 enabled:(BOOL)a5 forPreviewing:(BOOL)a6
{
  id v10;
  id v11;
  FCUIFocusEnablementIndicatorBannerPresentable *v12;
  uint64_t v13;
  FCActivityDescribing *activityDescription;
  uint64_t v15;
  NSString *requesterIdentifier;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v18.receiver = self;
  v18.super_class = (Class)FCUIFocusEnablementIndicatorBannerPresentable;
  v12 = -[FCUIFocusEnablementIndicatorBannerPresentable init](&v18, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copyWithZone:", 0);
    activityDescription = v12->_activityDescription;
    v12->_activityDescription = (FCActivityDescribing *)v13;

    v15 = objc_msgSend(v11, "copy");
    requesterIdentifier = v12->_requesterIdentifier;
    v12->_requesterIdentifier = (NSString *)v15;

    v12->_activityEnabled = a5;
    v12->_forPreviewing = a6;
  }

  return v12;
}

- (NSString)requestIdentifier
{
  NSString *requestIdentifier;
  void *v4;
  NSString *v5;
  NSString *v6;

  requestIdentifier = self->_requestIdentifier;
  if (!requestIdentifier)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_requestIdentifier;
    self->_requestIdentifier = v5;

    requestIdentifier = self->_requestIdentifier;
  }
  return requestIdentifier;
}

- (int64_t)presentableBehavior
{
  return 1;
}

- (id)presentableDescription
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v6 = CFSTR("activityEnabled");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_activityEnabled);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BNPresentableDescription();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)providesTemplateContent
{
  return 1;
}

- (BNTemplateViewProviding)leadingTemplateViewProvider
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x24BEBD660], "configurationWithPointSize:", 21.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BEBD660];
  v5 = objc_alloc(MEMORY[0x24BDBCE30]);
  objc_msgSend(MEMORY[0x24BEBD4B8], "fcui_colorForActivity:", self->_activityDescription);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithObjects:", v6, 0);
  objc_msgSend(v4, "configurationWithPaletteColors:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configurationByApplyingConfiguration:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BEBD640];
  -[FCActivityDescribing activitySymbolImageName](self->_activityDescription, "activitySymbolImageName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_systemImageNamed:withConfiguration:", v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = objc_alloc(MEMORY[0x24BE0BA38]);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0BA28]), "initWithImage:", v12);
    v15 = (void *)objc_msgSend(v13, "initWithItem:", v14);

  }
  else
  {
    v15 = 0;
  }

  return (BNTemplateViewProviding *)v15;
}

- (BNTemplateViewProviding)trailingTemplateViewProvider
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BEBD438], "filledButtonConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCornerStyle:", 4);
  objc_msgSend(MEMORY[0x24BEBD660], "configurationWithPointSize:", 12.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BEBD660];
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configurationWithHierarchicalColor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configurationByApplyingConfiguration:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", CFSTR("xmark"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v9);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0BA38]), "initWithItem:", v3);
  objc_msgSend(v10, "setVisualStyleCategory:", 2);
  objc_msgSend(v10, "setVisualStyle:", 1);
  objc_msgSend(v10, "setHidden:", !self->_activityEnabled);
  objc_msgSend(v10, "setAccessibilityIdentifier:", CFSTR("disable-focus-mode"));

  return (BNTemplateViewProviding *)v10;
}

- (BNTemplateItemProviding)primaryTemplateItemProvider
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BE0BA38]);
  -[FCActivityDescribing activityDisplayName](self->_activityDescription, "activityDisplayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithItem:", v4);

  return (BNTemplateItemProviding *)v5;
}

- (BNTemplateItemProviding)secondaryTemplateItemProvider
{
  _BOOL4 activityEnabled;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;

  activityEnabled = self->_activityEnabled;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (activityEnabled)
    v5 = CFSTR("FLANKING_BANNER_ON");
  else
    v5 = CFSTR("FLANKING_BANNER_OFF");
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_24D20B520, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0BA38]), "initWithItem:", v6);
  return (BNTemplateItemProviding *)v7;
}

- (int64_t)userInterfaceStyleOverride
{
  return 2 * self->_forPreviewing;
}

- (BOOL)shouldAcquireWindowLevelAssertion
{
  return self->_forPreviewing;
}

- (void)handleTemplateContentEvent:(int64_t)a3
{
  id v4;

  if (a3 == 2 && self->_activityEnabled)
  {
    objc_msgSend(MEMORY[0x24BE37EB8], "sharedActivityManager");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setActivity:active:withLifetime:reason:", self->_activityDescription, 0, 0, CFSTR("banner deactivation button tapped"));

  }
}

- (NSString)presentableAccessibilityIdentifier
{
  return (NSString *)+[FCUIFocusEnablementIndicatorBannerPresentable accessibilityIdentifierForActivityDescription:](FCUIFocusEnablementIndicatorBannerPresentable, "accessibilityIdentifierForActivityDescription:", self->_activityDescription);
}

+ (id)accessibilityIdentifierForActivityDescription:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a3, "activityDisplayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("focus-mode-notice-%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)presentableWillAppearAsBanner:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __79__FCUIFocusEnablementIndicatorBannerPresentable_presentableWillAppearAsBanner___block_invoke;
  v6[3] = &unk_24D20AB68;
  v7 = v4;
  v5 = v4;
  -[FCUIFocusEnablementIndicatorBannerPresentable _enumerateObserversRespondingToSelector:usingBlock:](self, "_enumerateObserversRespondingToSelector:usingBlock:", sel_presentableWillAppearAsBanner_, v6);

}

uint64_t __79__FCUIFocusEnablementIndicatorBannerPresentable_presentableWillAppearAsBanner___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "presentableWillAppearAsBanner:", *(_QWORD *)(a1 + 32));
}

- (void)presentableDidAppearAsBanner:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __78__FCUIFocusEnablementIndicatorBannerPresentable_presentableDidAppearAsBanner___block_invoke;
  v6[3] = &unk_24D20AB68;
  v7 = v4;
  v5 = v4;
  -[FCUIFocusEnablementIndicatorBannerPresentable _enumerateObserversRespondingToSelector:usingBlock:](self, "_enumerateObserversRespondingToSelector:usingBlock:", sel_presentableDidAppearAsBanner_, v6);

}

uint64_t __78__FCUIFocusEnablementIndicatorBannerPresentable_presentableDidAppearAsBanner___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "presentableDidAppearAsBanner:", *(_QWORD *)(a1 + 32));
}

- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __93__FCUIFocusEnablementIndicatorBannerPresentable_presentableWillDisappearAsBanner_withReason___block_invoke;
  v10[3] = &unk_24D20AB90;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[FCUIFocusEnablementIndicatorBannerPresentable _enumerateObserversRespondingToSelector:usingBlock:](self, "_enumerateObserversRespondingToSelector:usingBlock:", sel_presentableWillDisappearAsBanner_withReason_, v10);

}

uint64_t __93__FCUIFocusEnablementIndicatorBannerPresentable_presentableWillDisappearAsBanner_withReason___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "presentableWillDisappearAsBanner:withReason:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __92__FCUIFocusEnablementIndicatorBannerPresentable_presentableDidDisappearAsBanner_withReason___block_invoke;
  v10[3] = &unk_24D20AB90;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[FCUIFocusEnablementIndicatorBannerPresentable _enumerateObserversRespondingToSelector:usingBlock:](self, "_enumerateObserversRespondingToSelector:usingBlock:", sel_presentableDidDisappearAsBanner_withReason_, v10);

}

uint64_t __92__FCUIFocusEnablementIndicatorBannerPresentable_presentableDidDisappearAsBanner_withReason___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "presentableDidDisappearAsBanner:withReason:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)userInteractionWillBeginForBannerForPresentable:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __97__FCUIFocusEnablementIndicatorBannerPresentable_userInteractionWillBeginForBannerForPresentable___block_invoke;
  v6[3] = &unk_24D20AB68;
  v7 = v4;
  v5 = v4;
  -[FCUIFocusEnablementIndicatorBannerPresentable _enumerateObserversRespondingToSelector:usingBlock:](self, "_enumerateObserversRespondingToSelector:usingBlock:", sel_userInteractionWillBeginForBannerForPresentable_, v6);

}

uint64_t __97__FCUIFocusEnablementIndicatorBannerPresentable_userInteractionWillBeginForBannerForPresentable___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "userInteractionWillBeginForBannerForPresentable:", *(_QWORD *)(a1 + 32));
}

- (void)userInteractionDidEndForBannerForPresentable:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __94__FCUIFocusEnablementIndicatorBannerPresentable_userInteractionDidEndForBannerForPresentable___block_invoke;
  v6[3] = &unk_24D20AB68;
  v7 = v4;
  v5 = v4;
  -[FCUIFocusEnablementIndicatorBannerPresentable _enumerateObserversRespondingToSelector:usingBlock:](self, "_enumerateObserversRespondingToSelector:usingBlock:", sel_userInteractionDidEndForBannerForPresentable_, v6);

}

uint64_t __94__FCUIFocusEnablementIndicatorBannerPresentable_userInteractionDidEndForBannerForPresentable___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "userInteractionDidEndForBannerForPresentable:", *(_QWORD *)(a1 + 32));
}

- (void)addPresentableObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    observers = self->_observers;
    v8 = v4;
    if (!observers)
    {
      objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 517);
      v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      v7 = self->_observers;
      self->_observers = v6;

      observers = self->_observers;
    }
    -[NSHashTable addObject:](observers, "addObject:", v8);
    v4 = v8;
  }

}

- (void)removePresentableObserver:(id)a3
{
  NSHashTable *observers;

  if (a3)
  {
    observers = self->_observers;
    if (observers)
      -[NSHashTable removeObject:](observers, "removeObject:");
  }
}

- (void)_enumerateObserversRespondingToSelector:(SEL)a3 usingBlock:(id)a4
{
  void (**v5)(id, _QWORD);
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = (void (**)(id, _QWORD))a4;
  if (v5 && -[NSHashTable count](self->_observers, "count"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v5[2](v5, v11);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
}

- (NSString)requesterIdentifier
{
  return self->_requesterIdentifier;
}

- (FCActivityDescribing)activityDescription
{
  return self->_activityDescription;
}

- (BOOL)isActivityEnabled
{
  return self->_activityEnabled;
}

- (BOOL)isForPreviewing
{
  return self->_forPreviewing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityDescription, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_requesterIdentifier, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
