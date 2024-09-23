@implementation _SFNavigationIntentBuilder

+ (void)registerBookmarkCollectionFactory:(id)a3
{
  void *v3;
  void *v4;

  v3 = _Block_copy(a3);
  v4 = (void *)bookmarkCollectionFactory;
  bookmarkCollectionFactory = (uint64_t)v3;

}

+ (id)builder
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sf_currentKeyboardModifierFlags");

  return +[_SFNavigationIntentBuilder builderWithModifierFlags:](_SFNavigationIntentBuilder, "builderWithModifierFlags:", v3);
}

+ (id)builderWithModifierFlags:(int64_t)a3
{
  return -[_SFNavigationIntentBuilder _initWithModifierFlags:]([_SFNavigationIntentBuilder alloc], "_initWithModifierFlags:", a3);
}

- (id)_initWithModifierFlags:(int64_t)a3
{
  char *v4;
  void *v5;
  char *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_SFNavigationIntentBuilder;
  v4 = -[_SFNavigationIntentBuilder init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    *((_QWORD *)v4 + 2) = a3;
    *(_OWORD *)(v4 + 24) = xmmword_18BAD4E60;
    v4[11] = 1;
    v6 = v4;
  }

  return v5;
}

- (id)_initializeNavigationIntentWithType:(unint64_t)a3 value:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = -[_SFNavigationIntent _initWithType:value:policy:]([_SFNavigationIntent alloc], "_initWithType:value:policy:", a3, v6, -[_SFNavigationIntentBuilder _navigationPolicy](self, "_navigationPolicy"));

  objc_msgSend(v7, "setShouldRelateToSourceTab:", self->_prefersRelationToSourceTab);
  return v7;
}

- (id)navigationIntentWithBookmark:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "isFolder") & 1) != 0)
  {
    if (bookmarkCollectionFactory)
    {
      (*(void (**)(void))(bookmarkCollectionFactory + 16))();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
    objc_msgSend(v5, "descendantsOfBookmarkFolder:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");
    if (v8)
    {
      if (self->_neverPromptWhenOpeningMultipleIntents)
      {
        if (v8 >= 0x64)
          v9 = 100;
        else
          v9 = v8;
        if (v8 <= 0x63)
          v10 = 0;
        else
          v10 = v8 - 100;
        objc_msgSend(v7, "subarrayWithRange:", v10, v9);
        v11 = objc_claimAutoreleasedReturnValue();

        v7 = (id)v11;
      }
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v7 = v7;
      v13 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v20 != v15)
              objc_enumerationMutation(v7);
            -[_SFNavigationIntentBuilder navigationIntentWithBookmark:](self, "navigationIntentWithBookmark:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i), (_QWORD)v19);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "addObject:", v17);

          }
          v14 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v14);
      }

      -[_SFNavigationIntentBuilder navigationIntentWithMultipleIntents:](self, "navigationIntentWithMultipleIntents:", v12);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setNeverPromptWhenOpeningMultipleIntents:", self->_neverPromptWhenOpeningMultipleIntents != 0);

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    -[_SFNavigationIntentBuilder _initializeNavigationIntentWithType:value:](self, "_initializeNavigationIntentWithType:value:", 0, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setProvenance:", 2);
  }

  return v6;
}

- (id)navigationIntentWithCloudTab:(id)a3
{
  self->_prefersRelationToSourceTab = 0;
  return -[_SFNavigationIntentBuilder _initializeNavigationIntentWithType:value:](self, "_initializeNavigationIntentWithType:value:", 1, a3);
}

- (id)navigationIntentWithRecentlyClosedTabStateData:(id)a3
{
  self->_prefersOpenInNewTab = 1;
  self->_preferredTabOrder = 1;
  self->_prefersRelationToSourceTab = 0;
  return -[_SFNavigationIntentBuilder _initializeNavigationIntentWithType:value:](self, "_initializeNavigationIntentWithType:value:", 3, a3);
}

- (id)navigationIntentWithHistoryURL:(id)a3
{
  return -[_SFNavigationIntentBuilder _initializeNavigationIntentWithType:value:](self, "_initializeNavigationIntentWithType:value:", 2, a3);
}

- (id)navigationIntentWithText:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "safari_stringByRemovingExcessWhitespace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFNavigationIntentBuilder _initializeNavigationIntentWithType:value:](self, "_initializeNavigationIntentWithType:value:", 4, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)navigationIntentWithSearchText:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "safari_stringByRemovingExcessWhitespace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFNavigationIntentBuilder _initializeNavigationIntentWithType:value:](self, "_initializeNavigationIntentWithType:value:", 5, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)navigationIntentWithURL:(id)a3
{
  return -[_SFNavigationIntentBuilder _initializeNavigationIntentWithType:value:](self, "_initializeNavigationIntentWithType:value:", 6, a3);
}

- (id)navigationIntentWithImageAttributionURL:(id)a3
{
  return -[_SFNavigationIntentBuilder _initializeNavigationIntentWithType:value:](self, "_initializeNavigationIntentWithType:value:", 8, a3);
}

- (id)navigationIntentWithHighlight:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  WBSURLForHighlight();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFNavigationIntentBuilder _initializeNavigationIntentWithType:value:](self, "_initializeNavigationIntentWithType:value:", 6, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setHighlight:", v4);
  return v6;
}

- (id)navigationIntentWithMultipleIntents:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "count") == 1)
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setIsChildIntent:", 1);
  }
  else
  {
    flattenedNavigationIntents(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[_SFNavigationIntentBuilder _initializeNavigationIntentWithType:value:](self, "_initializeNavigationIntentWithType:value:", 9, v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)navigationIntentWithOpenURLContexts:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  self->_prefersRelationToSourceTab = 0;
  self->_prefersOpenInNewTab = 1;
  v4 = MEMORY[0x1E0C809B0];
  self->_preferredTabOrder = 1;
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __66___SFNavigationIntentBuilder_navigationIntentWithOpenURLContexts___block_invoke;
  v8[3] = &unk_1E21E3860;
  v8[4] = self;
  objc_msgSend(a3, "safari_mapObjectsUsingBlock:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFNavigationIntentBuilder navigationIntentWithMultipleIntents:](self, "navigationIntentWithMultipleIntents:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)canCreateNavigationIntentForDropSession:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9 = *MEMORY[0x1E0CC15F0];
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a3;
  objc_msgSend(v3, "arrayWithObjects:count:", &v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  allowedClasses();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[_SFDropSession dropSession:containsItemsMatching:allowedTypeIdentifiers:allowedClasses:](_SFDropSession, "dropSession:containsItemsMatching:allowedTypeIdentifiers:allowedClasses:", v4, localObjectLoader, v5, v6, v9, v10);

  return v7;
}

- (void)buildNavigationIntentForDropSession:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __84___SFNavigationIntentBuilder_buildNavigationIntentForDropSession_completionHandler___block_invoke;
  v8[3] = &unk_1E21E3888;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  +[_SFDropSession dropSession:loadObjectsUsingLocalObjectLoader:objectLoader:completionHandler:](_SFDropSession, "dropSession:loadObjectsUsingLocalObjectLoader:objectLoader:completionHandler:", a3, localObjectLoader, objectLoader, v8);

}

- (void)buildNavigationIntentForItemProviders:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0CB36C8];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __86___SFNavigationIntentBuilder_buildNavigationIntentForItemProviders_completionHandler___block_invoke;
  v9[3] = &unk_1E21E3888;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "safari_loadObjectsFromItemProviders:usingLoader:completionHandler:", a3, objectLoader, v9);

}

- (id)_navigationIntentWithItems:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v7[5];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57___SFNavigationIntentBuilder__navigationIntentWithItems___block_invoke;
  v7[3] = &unk_1E21E38B0;
  v7[4] = self;
  objc_msgSend(a3, "safari_mapAndFilterObjectsUsingBlock:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    -[_SFNavigationIntentBuilder navigationIntentWithMultipleIntents:](self, "navigationIntentWithMultipleIntents:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_navigationIntentForMKMapItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if ((objc_msgSend(v4, "isCurrentLocation") & 1) == 0)
  {
    objc_msgSend(v4, "url");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "safari_originalDataAsString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v4, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        v5 = 0;
        goto LABEL_7;
      }
    }
    -[_SFNavigationIntentBuilder navigationIntentWithText:](self, "navigationIntentWithText:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

    goto LABEL_8;
  }
  v5 = 0;
LABEL_8:

  return v5;
}

+ (BOOL)shouldOpenBookmarkFolderAsTabs
{
  void *v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = ((unint64_t)objc_msgSend(v2, "sf_currentKeyboardModifierFlags") >> 20) & 1;

  return v3;
}

- (BOOL)_hasModifierFlag:(int64_t)a3
{
  return (self->_modifierFlags & a3) != 0;
}

- (BOOL)_modifiersEqualToModifierIgnoringCapsLock:(int64_t)a3
{
  return ((self->_modifierFlags ^ a3) & 0xFFFFFFFFFFFEFFFFLL) == 0;
}

- (BOOL)_shouldOrderToForeground
{
  int64_t preferredTabOrder;
  void *v3;
  int v4;

  preferredTabOrder = self->_preferredTabOrder;
  if (preferredTabOrder == 2)
  {
    LOBYTE(v4) = 0;
  }
  else if (preferredTabOrder)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("OpenLinksInBackground")) ^ 1;

  }
  return v4;
}

- (int64_t)_navigationPolicy
{
  int64_t result;

  if (self->_navigationType == -1)
  {
    result = -[_SFNavigationIntentBuilder _navigationPolicyForStandardEvent](self, "_navigationPolicyForStandardEvent");
    if (result)
      return result;
  }
  else
  {
    result = -[_SFNavigationIntentBuilder _navigationPolicyForNavigationEvent](self, "_navigationPolicyForNavigationEvent");
    if (result)
      return result;
  }
  if (self->_prefersOpenInNewTabReusingExistingBlankTabIfPossible)
    return 3;
  return result;
}

- (int64_t)_navigationPolicyForStandardEvent
{
  if (!self->_modifierFlags && !self->_prefersOpenInNewTab && !self->_prefersOpenInNewWindow)
    return 0;
  if (-[_SFNavigationIntentBuilder _hasModifierFlag:](self, "_hasModifierFlag:", 0x100000)
    || self->_prefersOpenInNewTab
    || self->_prefersOpenInNewWindow)
  {
    return -[_SFNavigationIntentBuilder _navigationPolicyForCreatingNewTabOrWindow](self, "_navigationPolicyForCreatingNewTabOrWindow");
  }
  if (-[_SFNavigationIntentBuilder _modifiersEqualToModifierIgnoringCapsLock:](self, "_modifiersEqualToModifierIgnoringCapsLock:", 0x20000))
  {
    return 5;
  }
  if (-[_SFNavigationIntentBuilder _modifiersEqualToModifierIgnoringCapsLock:](self, "_modifiersEqualToModifierIgnoringCapsLock:", 0x80000))
  {
    return 6;
  }
  return 0;
}

- (int64_t)_navigationPolicyForNavigationEvent
{
  int64_t navigationType;
  int64_t result;
  BOOL v5;

  navigationType = self->_navigationType;
  if ((navigationType & 0xFFFFFFFFFFFFFFFELL) == 2)
    return 0;
  if (-[_SFNavigationIntentBuilder _modifiersEqualToModifierIgnoringCapsLock:](self, "_modifiersEqualToModifierIgnoringCapsLock:", 0x20000))
  {
    v5 = navigationType == 1 || navigationType == 4;
    if (!v5 && !self->_prefersOpenInNewTab)
      return 5;
  }
  if (-[_SFNavigationIntentBuilder _hasModifierFlag:](self, "_hasModifierFlag:", 0x100000)
    || self->_prefersOpenInNewTab)
  {
    return -[_SFNavigationIntentBuilder _navigationPolicyForCreatingNewTabOrWindow](self, "_navigationPolicyForCreatingNewTabOrWindow");
  }
  if (!-[_SFNavigationIntentBuilder _hasModifierFlag:](self, "_hasModifierFlag:", 0x80000))
    return 0;
  result = 0;
  if (navigationType != 1 && navigationType != 4)
  {
    if (-[_SFNavigationIntentBuilder _modifiersEqualToModifierIgnoringCapsLock:](self, "_modifiersEqualToModifierIgnoringCapsLock:", 786432))
    {
      return 0;
    }
    else
    {
      return 6;
    }
  }
  return result;
}

- (int64_t)_navigationPolicyForCreatingNewTabOrWindow
{
  _BOOL4 v4;

  if (-[_SFNavigationIntentBuilder _hasModifierFlag:](self, "_hasModifierFlag:", 0x80000)
    || self->_prefersOpenInNewWindow)
  {
    return 4;
  }
  v4 = -[_SFNavigationIntentBuilder _shouldOrderToForeground](self, "_shouldOrderToForeground");
  if (v4 != -[_SFNavigationIntentBuilder _hasModifierFlag:](self, "_hasModifierFlag:", 0x20000))
    return 1;
  else
    return 2;
}

- (int64_t)modifierFlags
{
  return self->_modifierFlags;
}

- (int64_t)navigationType
{
  return self->_navigationType;
}

- (void)setNavigationType:(int64_t)a3
{
  self->_navigationType = a3;
}

- (int64_t)preferredTabOrder
{
  return self->_preferredTabOrder;
}

- (void)setPreferredTabOrder:(int64_t)a3
{
  self->_preferredTabOrder = a3;
}

- (BOOL)prefersOpenInNewTab
{
  return self->_prefersOpenInNewTab;
}

- (void)setPrefersOpenInNewTab:(BOOL)a3
{
  self->_prefersOpenInNewTab = a3;
}

- (BOOL)prefersOpenInNewTabReusingExistingBlankTabIfPossible
{
  return self->_prefersOpenInNewTabReusingExistingBlankTabIfPossible;
}

- (void)setPrefersOpenInNewTabReusingExistingBlankTabIfPossible:(BOOL)a3
{
  self->_prefersOpenInNewTabReusingExistingBlankTabIfPossible = a3;
}

- (BOOL)prefersOpenInNewWindow
{
  return self->_prefersOpenInNewWindow;
}

- (void)setPrefersOpenInNewWindow:(BOOL)a3
{
  self->_prefersOpenInNewWindow = a3;
}

- (BOOL)prefersRelationToSourceTab
{
  return self->_prefersRelationToSourceTab;
}

- (void)setPrefersRelationToSourceTab:(BOOL)a3
{
  self->_prefersRelationToSourceTab = a3;
}

- (unint64_t)neverPromptWhenOpeningMultipleIntents
{
  return self->_neverPromptWhenOpeningMultipleIntents;
}

- (void)setNeverPromptWhenOpeningMultipleIntents:(unint64_t)a3
{
  self->_neverPromptWhenOpeningMultipleIntents = a3;
}

@end
