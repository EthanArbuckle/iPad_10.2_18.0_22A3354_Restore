@implementation CKContactsSearchManager

- (void)dealloc
{
  void *v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "Finished new compose contacts search.", buf, 2u);
    }

  }
  objc_storeWeak((id *)&self->_delegate, 0);
  v5.receiver = self;
  v5.super_class = (Class)CKContactsSearchManager;
  -[CKContactsSearchManager dealloc](&v5, sel_dealloc);
}

- (CKContactsSearchManager)init
{
  CKContactsSearchManager *v2;
  NSObject *v3;
  uint64_t v4;
  CNAutocompleteSearchManager *searchManager;
  char *v6;
  char v7;
  CNAutocompleteSearchManager *v8;
  uint8_t v10[16];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CKContactsSearchManager;
  v2 = -[CKContactsSearchManager init](&v11, sel_init);
  if (v2)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "Starting new compose contacts search.", v10, 2u);
      }

    }
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0D13660]), "initWithAutocompleteSearchType:", 1);
    searchManager = v2->_searchManager;
    v2->_searchManager = (CNAutocompleteSearchManager *)v4;

    v6 = sel_setFetchDelegate_;
    v7 = objc_opt_respondsToSelector();
    v8 = v2->_searchManager;
    if ((v7 & 1) == 0)
    {
      v6 = sel_setSupplementalGroupResultsDelegate_;
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
LABEL_10:
        -[CNAutocompleteSearchManager setImplicitGroupCreationThreshold:](v2->_searchManager, "setImplicitGroupCreationThreshold:", 1);
        -[CNAutocompleteSearchManager setShouldIncludeGroupResults:](v2->_searchManager, "setShouldIncludeGroupResults:", 1);
        return v2;
      }
      v8 = v2->_searchManager;
    }
    -[CNAutocompleteSearchManager performSelector:withObject:](v8, "performSelector:withObject:", v6, v2);
    goto LABEL_10;
  }
  return v2;
}

- (void)searchWithText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSMutableArray *v7;
  NSMutableArray *searchResults;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_class *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  CKContactsSearchManager *v35;
  void *v36;
  id obj;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CKContactsSearchManager cancelSearch](self, "cancelSearch");
  objc_msgSend(MEMORY[0x1E0D36AE8], "globalTimingCollectionForKey:", CFSTR("CKAutocompleteTimingKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startTimingForKey:", CFSTR("Total"));

  objc_msgSend(MEMORY[0x1E0D36AE8], "globalTimingCollectionForKey:", CFSTR("CKAutocompleteTimingKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startTimingForKey:", CFSTR("ContactSearchAutocomplete"));

  v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  searchResults = self->_searchResults;
  self->_searchResults = v7;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v9, "stewieEnabled");

  if ((_DWORD)v5)
    v10 = 55;
  else
    v10 = 23;
  v36 = v4;
  -[CKContactsSearchManager setSearchText:](self, "setSearchText:", v4);
  -[CKContactsSearchManager searchManager](self, "searchManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSearchTypes:", v10);

  v12 = (objc_class *)MEMORY[0x193FF3C18](CFSTR("CNAutocompleteFetchContext"), CFSTR("Contacts"));
  if (v12)
    v34 = objc_alloc_init(v12);
  else
    v34 = 0;
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v35 = self;
  -[CKContactsSearchManager enteredRecipients](self, "enteredRecipients");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v43 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_msgSend(v18, "address", v34);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          objc_msgSend(v18, "address");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v20);

        }
        if (objc_msgSend(v18, "isGroup"))
        {
          objc_msgSend(v18, "children");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21)
          {
            v40 = 0u;
            v41 = 0u;
            v38 = 0u;
            v39 = 0u;
            objc_msgSend(v18, "children");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
            if (v23)
            {
              v24 = v23;
              v25 = *(_QWORD *)v39;
              do
              {
                for (j = 0; j != v24; ++j)
                {
                  if (*(_QWORD *)v39 != v25)
                    objc_enumerationMutation(v22);
                  v27 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
                  objc_msgSend(v27, "address");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v28)
                  {
                    objc_msgSend(v27, "address");
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v13, "addObject:", v29);

                  }
                }
                v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
              }
              while (v24);
            }

          }
        }
      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    }
    while (v15);
  }

  v30 = v34;
  objc_msgSend(v34, "setOtherAddressesAlreadyChosen:", v13);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v34, "setPredictsBasedOnOutgoingInteraction:", -[CKContactsSearchManager biasForOutgoingInteraction](v35, "biasForOutgoingInteraction"));
  objc_msgSend(MEMORY[0x1E0D36AE8], "globalTimingCollectionForKey:", CFSTR("CKAutocompleteTimingKey"), v34);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "startTimingForKey:", CFSTR("RemoteSearch"));

  -[CKContactsSearchManager searchManager](v35, "searchManager");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "searchForText:withAutocompleteFetchContext:consumer:", v36, v30, v35);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKContactsSearchManager setCurrentSearchTaskID:](v35, "setCurrentSearchTaskID:", v33);

}

- (void)cancelSearch
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D36AE8], "invalidateGlobalTimingCollectionForKey:", CFSTR("CKAutocompleteTimingKey"));
  -[CKContactsSearchManager currentSearchTaskID](self, "currentSearchTaskID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CKContactsSearchManager searchManager](self, "searchManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKContactsSearchManager currentSearchTaskID](self, "currentSearchTaskID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancelTaskWithID:", v5);

    -[CKContactsSearchManager setCurrentSearchTaskID:](self, "setCurrentSearchTaskID:", 0);
    objc_msgSend((id)*MEMORY[0x1E0CEB258], "setNetworkActivityIndicatorVisible:", 0);
  }
  -[CKContactsSearchManager setSearchText:](self, "setSearchText:", 0);
}

- (void)didSelectRecipient:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[CKContactsSearchManager searchManager](self, "searchManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didSelectRecipient:atIndex:", v6, a4);

}

- (void)removeRecipient:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKContactsSearchManager searchManager](self, "searchManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeRecipientResult:", v4);

}

- (id)_sortSearchResultsWithCoreRecentsResults:(id)a3 displayNameMatches:(id)a4 participantNameMatches:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  char v17;
  char v18;
  uint64_t v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v31 = a4;
  v30 = a5;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v33;
    do
    {
      v14 = 0;
      v15 = v12 + v11;
      do
      {
        if (*(_QWORD *)v33 != v13)
          objc_enumerationMutation(v9);
        v16 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v14);
        v17 = objc_msgSend(v16, "sourceType", v30);
        v18 = objc_msgSend(v16, "sourceType");
        v19 = objc_msgSend(v16, "sourceType");
        if ((v18 & 1) == 0 && (v17 & 0x10) == 0 && v19 != 0)
        {
          v15 = v12 + v14;
          goto LABEL_16;
        }
        ++v14;
      }
      while (v11 != v14);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      v12 = v15;
    }
    while (v11);
  }
  else
  {
    v15 = 0;
  }
LABEL_16:

  -[CKContactsSearchManager _cullOldResults:](self, "_cullOldResults:", v31);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v30;
  -[CKContactsSearchManager _cullOldResults:](self, "_cullOldResults:", v30);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKContactsSearchManager _sortResultsByDate:](self, "_sortResultsByDate:", v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKContactsSearchManager _sortResultsByDate:](self, "_sortResultsByDate:", v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addObjectsFromArray:", v25);

  if ((unint64_t)objc_msgSend(v24, "count") >= 9)
  {
    objc_msgSend(v24, "subarrayWithRange:", 0, 8);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "mutableCopy");

    v24 = (void *)v27;
  }
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v15, objc_msgSend(v24, "count", v30));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "insertObjects:atIndexes:", v24, v28);

  return v9;
}

- (id)_sortResultsByDate:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_133);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  return v4;
}

uint64_t __46__CKContactsSearchManager__sortResultsByDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a2;
  objc_msgSend(a3, "lastMessageDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastMessageDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (id)_cullOldResults:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v9, "lastMessageDate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "lastMessageDate");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "components:fromDate:toDate:options:", 24, v12, v13, 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if ((unint64_t)objc_msgSend(v14, "month") <= 2)
            objc_msgSend(v16, "addObject:", v9);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

  return v16;
}

- (id)_filterGroupResults:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__CKContactsSearchManager__filterGroupResults___block_invoke;
  v4[3] = &unk_1E2755F80;
  v4[4] = self;
  objc_msgSend(a3, "__imArrayByFilteringWithBlock:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __47__CKContactsSearchManager__filterGroupResults___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  __int16 v4;
  uint64_t v5;
  char v6;
  unsigned int v7;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isMAIDGroupsEnabled")
    && (v4 = objc_msgSend(v3, "sourceType"), objc_msgSend(v3, "isGroup"))
    && (v4 & 0x100) != 0)
  {
    v5 = 1;
  }
  else
  {
    v6 = objc_msgSend(v3, "sourceType");
    v7 = objc_msgSend(v3, "isGroup") ^ 1;
    if ((v6 & 1) != 0)
      v5 = v7;
    else
      v5 = 1;
  }

  return v5;
}

- (NSCharacterSet)emojiCharacterSet
{
  NSCharacterSet *emojiCharacterSet;
  NSCharacterSet *v4;
  NSCharacterSet *v5;

  emojiCharacterSet = self->_emojiCharacterSet;
  if (!emojiCharacterSet)
  {
    v4 = (NSCharacterSet *)CEMCreateEmojiCharacterSet();
    v5 = self->_emojiCharacterSet;
    self->_emojiCharacterSet = v4;

    emojiCharacterSet = self->_emojiCharacterSet;
  }
  return emojiCharacterSet;
}

- (void)consumeAutocompleteSearchResults:(id)a3 taskID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D36AE8], "globalTimingCollectionForKey:", CFSTR("CKAutocompleteTimingKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stopTimingForKey:", CFSTR("RemoteSearch"));

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0D36AE8], "globalTimingCollectionForKey:", CFSTR("CKAutocompleteTimingKey"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v10;
      _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "Finished remote group search in %@", (uint8_t *)&v13, 0xCu);

    }
  }
  -[CKContactsSearchManager _filterGroupResults:](self, "_filterGroupResults:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKContactsSearchManager searchResults](self, "searchResults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObjectsFromArray:", v11);

}

- (void)finishedSearchingForAutocompleteResults
{
  void *v2;
  CKContactsSearchManager *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t i;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id obj;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  _QWORD block[5];
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  void *v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  -[CKContactsSearchManager searchResults](self, "searchResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = self;
  if (-[CKContactsSearchManager suppressGroupSuggestions](self, "suppressGroupSuggestions"))
  {
    -[CKContactsSearchManager searchResults](self, "searchResults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "__imArrayByApplyingBlock:", &__block_literal_global_84_2);
    v5 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v5;
    v3 = self;
  }
  else
  {
    v6 = v2;
  }
  v27 = v6;
  v25 = (void *)objc_msgSend(v6, "mutableCopy");
  -[CKContactsSearchManager enteredRecipients](v3, "enteredRecipients");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v8;
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
  if (v28)
  {
    v26 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v36 != v26)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v11 = v27;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
        if (v12)
        {
          v13 = *(_QWORD *)v32;
          while (2)
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v32 != v13)
                objc_enumerationMutation(v11);
              v15 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
              if ((objc_msgSend(v15, "isGroup") & 1) == 0)
              {
                objc_msgSend(v15, "IDSCanonicalAddress");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v10, "IDSCanonicalAddress");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = objc_msgSend(v16, "isEqualToIgnoringCase:", v17);

                if (v18)
                {
                  objc_msgSend(v25, "removeObject:", v15);
                  goto LABEL_20;
                }
              }
            }
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
            if (v12)
              continue;
            break;
          }
        }
LABEL_20:

      }
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
    }
    while (v28);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__CKContactsSearchManager_finishedSearchingForAutocompleteResults__block_invoke_2;
  block[3] = &unk_1E274A108;
  block[4] = self;
  v19 = v25;
  v30 = v19;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_msgSend(MEMORY[0x1E0D36AE8], "globalTimingCollectionForKey:", CFSTR("CKAutocompleteTimingKey"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stopTimingForKey:", CFSTR("ContactSearchAutocomplete"));

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0D36AE8], "globalTimingCollectionForKey:", CFSTR("CKAutocompleteTimingKey"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v40 = v22;
      _os_log_impl(&dword_18DFCD000, v21, OS_LOG_TYPE_INFO, "Finished searching in %@", buf, 0xCu);

    }
  }

}

id __66__CKContactsSearchManager_finishedSearchingForAutocompleteResults__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  if ((objc_msgSend(v2, "isGroup") & 1) != 0)
    v3 = 0;
  else
    v3 = v2;

  return v3;
}

void __66__CKContactsSearchManager_finishedSearchingForAutocompleteResults__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(v4, "contactsSearchManager:finishedSearchingWithResults:", v2, v3);

}

- (_NSRange)_rangeForSearchTerm:(id)a3 inTarget:(id)a4 tokenizedByCharacterSet:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSUInteger v24;
  NSUInteger v25;
  NSUInteger v26;
  NSUInteger v27;
  id v28;
  NSUInteger v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;
  _NSRange result;

  v36 = *MEMORY[0x1E0C80C00];
  v30 = a3;
  v7 = a4;
  objc_msgSend(v7, "componentsSeparatedByCharactersInSet:", a5);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  v10 = 0x7FFFFFFFFFFFFFFFLL;
  if (v9)
  {
    v11 = v9;
    v28 = v8;
    v29 = 0;
    v12 = *(_QWORD *)v32;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v32 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringByTrimmingCharactersInSet:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = objc_msgSend(v7, "rangeOfString:", v16);
        if (v17 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v19 = v17;
          if (v17 + v18 <= (unint64_t)objc_msgSend(v7, "length"))
          {
            objc_msgSend(v7, "substringWithRange:", v19, objc_msgSend(v7, "length") - v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "stringByTrimmingCharactersInSet:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "rangeOfString:options:", v30, 393);
            v29 = v24;

            if (v23 != 0x7FFFFFFFFFFFFFFFLL)
            {

              v10 = v23;
              v8 = v28;
              goto LABEL_14;
            }
            v8 = v28;
          }
        }

      }
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (v11)
        continue;
      break;
    }
    v10 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_14:
    v25 = v29;
  }
  else
  {
    v25 = 0;
  }

  v26 = v10;
  v27 = v25;
  result.length = v27;
  result.location = v26;
  return result;
}

- (void)beganNetworkActivity
{
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "setNetworkActivityIndicatorVisible:", 1);
}

- (void)endedNetworkActivity
{
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "setNetworkActivityIndicatorVisible:", 0);
}

- (id)nameGroupSearchResults
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t i;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  id v38;
  void *v39;
  id obj;
  uint64_t v41;
  uint64_t v42;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  id v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D36AE8], "globalTimingCollectionForKey:", CFSTR("CKAutocompleteTimingKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startTimingForKey:", CFSTR("ContactSearchAutocomplete - Group Name Search"));

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v38 = (id)objc_claimAutoreleasedReturnValue();
  -[CKContactsSearchManager searchText](self, "searchText");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKContactsSearchManager delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "conversationCacheForContactsSearchManager:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = v4;
  v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
  if (v42)
  {
    v41 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v42; ++i)
      {
        if (*(_QWORD *)v46 != v41)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKey:", CFSTR("CKConversationDisplayNameKey"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
          v8 = v44 != 0;
        else
          v8 = 0;
        if (v8)
        {
          objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = -[CKContactsSearchManager _rangeForSearchTerm:inTarget:tokenizedByCharacterSet:](self, "_rangeForSearchTerm:inTarget:tokenizedByCharacterSet:", v44, v7, v9);

          if (v10 != 0x7FFFFFFFFFFFFFFFLL)
            goto LABEL_14;
          objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = (void *)objc_msgSend(v11, "mutableCopy");

          -[CKContactsSearchManager emojiCharacterSet](self, "emojiCharacterSet");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "formUnionWithCharacterSet:", v13);

          v14 = -[CKContactsSearchManager _rangeForSearchTerm:inTarget:tokenizedByCharacterSet:](self, "_rangeForSearchTerm:inTarget:tokenizedByCharacterSet:", v44, v7, v12);
          if (v14 != 0x7FFFFFFFFFFFFFFFLL)
            goto LABEL_14;
          objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "stringByTrimmingCharactersInSet:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[CKContactsSearchManager emojiCharacterSet](self, "emojiCharacterSet");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v16, "__ck_containsOnlyCharactersFromSet:", v17);

          if (v18)
          {
            if (objc_msgSend(v7, "rangeOfString:options:", v44, 385) != 0x7FFFFFFFFFFFFFFFLL)
            {
LABEL_14:
              objc_msgSend(v6, "objectForKey:", CFSTR("CKConversationGUIDKey"));
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              -[CKContactsSearchManager matchingConversationWithGuid:](self, "matchingConversationWithGuid:", v19);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = v20;
              if (v20)
              {
                objc_msgSend(v20, "chat");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "lastFinishedMessageDate");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v24 = -[CKContactsSearchManager shouldIncludeGroupInResults:](self, "shouldIncludeGroupInResults:", v23);

                if (v24)
                {
                  v25 = objc_alloc(MEMORY[0x1E0D13668]);
                  objc_msgSend(v21, "chat");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v39, "guid");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "displayName");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "chat");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v28, "participants");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  -[CKContactsSearchManager createAutocompelteGroupMembersFromParticipants:](self, "createAutocompelteGroupMembersFromParticipants:", v29);
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  v31 = (void *)objc_msgSend(v25, "initWithIdentifier:title:members:", v26, v27, v30);

                  objc_msgSend(v38, "addObject:", v31);
                }
              }

            }
          }
        }

      }
      v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
    }
    while (v42);
  }

  objc_msgSend(MEMORY[0x1E0D36AE8], "globalTimingCollectionForKey:", CFSTR("CKAutocompleteTimingKey"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "stopTimingForKey:", CFSTR("ContactSearchAutocomplete - Group Name Search"));

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0D36AE8], "globalTimingCollectionForKey:", CFSTR("CKAutocompleteTimingKey"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v50 = v34;
      _os_log_impl(&dword_18DFCD000, v33, OS_LOG_TYPE_INFO, "Finished group name search in %@", buf, 0xCu);

    }
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      v36 = objc_msgSend(v38, "count");
      *(_DWORD *)buf = 138412802;
      v50 = v44;
      v51 = 2048;
      v52 = v36;
      v53 = 2112;
      v54 = v38;
      _os_log_impl(&dword_18DFCD000, v35, OS_LOG_TYPE_INFO, "Group name search for text: %@ found %ld results. Results: %@", buf, 0x20u);
    }

  }
  return v38;
}

- (id)zkwGroupSuggestions
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  id v28;
  id obj;
  uint64_t v30;
  uint64_t v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D36AE8], "globalTimingCollectionForKey:", CFSTR("CKAutocompleteTimingKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startTimingForKey:", CFSTR("ContactSearchAutocomplete - ZKW Group Search"));

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  if (-[CKContactsSearchManager zkwGroupSuggestionsEnabled](self, "zkwGroupSuggestionsEnabled"))
  {
    -[CKContactsSearchManager searchText](self, "searchText");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", &stru_1E276D870);

    if (v4)
    {
      -[CKContactsSearchManager delegate](self, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "conversationCacheForContactsSearchManager:", self);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      obj = v6;
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      if (v31)
      {
        v30 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v31; ++i)
          {
            if (*(_QWORD *)v34 != v30)
              objc_enumerationMutation(obj);
            objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "objectForKey:", CFSTR("CKConversationGUIDKey"));
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            -[CKContactsSearchManager matchingConversationWithGuid:](self, "matchingConversationWithGuid:", v8);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = v9;
            if (v9)
            {
              objc_msgSend(v9, "chat");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "lastFinishedMessageDate");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = -[CKContactsSearchManager shouldIncludeGroupInResults:](self, "shouldIncludeGroupInResults:", v12);

              if (v13)
              {
                v14 = objc_alloc(MEMORY[0x1E0D13668]);
                objc_msgSend(v10, "chat");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "guid");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v10, "displayName");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v10, "chat");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "participants");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                -[CKContactsSearchManager createAutocompelteGroupMembersFromParticipants:](self, "createAutocompelteGroupMembersFromParticipants:", v19);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = (void *)objc_msgSend(v14, "initWithIdentifier:title:members:", v16, v17, v20);

                objc_msgSend(v28, "addObject:", v21);
              }
            }

          }
          v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        }
        while (v31);
      }

    }
  }
  objc_msgSend(MEMORY[0x1E0D36AE8], "globalTimingCollectionForKey:", CFSTR("CKAutocompleteTimingKey"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stopTimingForKey:", CFSTR("ContactSearchAutocomplete - ZKW Group Search"));

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0D36AE8], "globalTimingCollectionForKey:", CFSTR("CKAutocompleteTimingKey"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v38 = (uint64_t)v24;
      _os_log_impl(&dword_18DFCD000, v23, OS_LOG_TYPE_INFO, "Finished ZKW group search in %@", buf, 0xCu);

    }
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v26 = objc_msgSend(v28, "count");
      *(_DWORD *)buf = 134218242;
      v38 = v26;
      v39 = 2112;
      v40 = v28;
      _os_log_impl(&dword_18DFCD000, v25, OS_LOG_TYPE_INFO, "Group ZKW search for found %ld results. Results: %@", buf, 0x16u);
    }

  }
  return v28;
}

- (id)matchingConversationWithGuid:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "conversationForExistingChatWithGUID:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)shouldIncludeGroupInResults:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0C99D48];
  v4 = a3;
  objc_msgSend(v3, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:toDate:options:", 24, v4, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = (unint64_t)objc_msgSend(v7, "month") < 3;
  return (char)v4;
}

- (id)participantMatchGroupResults
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D36AE8], "globalTimingCollectionForKey:", CFSTR("CKAutocompleteTimingKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startTimingForKey:", CFSTR("ContactSearchAutocomplete - Group Participant Match Group Search"));

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKContactsSearchManager searchText](self, "searchText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[CKContactsSearchManager participantMatchResultsForSearchTerm:](self, "participantMatchResultsForSearchTerm:", v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  objc_msgSend(MEMORY[0x1E0D36AE8], "globalTimingCollectionForKey:", CFSTR("CKAutocompleteTimingKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stopTimingForKey:", CFSTR("ContactSearchAutocomplete - Group Participant Match Group  Search"));

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0D36AE8], "globalTimingCollectionForKey:", CFSTR("CKAutocompleteTimingKey"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v9;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Finished group participant match search in %@", (uint8_t *)&v13, 0xCu);

    }
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = objc_msgSend(v4, "count");
      v13 = 138412802;
      v14 = v5;
      v15 = 2048;
      v16 = v11;
      v17 = 2112;
      v18 = v4;
      _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Participant Match for search text: %@ found %ld results. Results: %@", (uint8_t *)&v13, 0x20u);
    }

  }
  return v4;
}

- (id)participantMatchResultsForSearchTerm:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id obj;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  CKContactsSearchManager *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v29 = (id)objc_claimAutoreleasedReturnValue();
  -[CKContactsSearchManager delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = self;
  objc_msgSend(v5, "conversationCacheForContactsSearchManager:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v6;
  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v31)
  {
    v30 = *(_QWORD *)v40;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v40 != v30)
          objc_enumerationMutation(obj);
        v32 = v7;
        v8 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v7);
        objc_msgSend(v8, "objectForKey:", CFSTR("CKConversationEntityNamesKey"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v34 = v9;
        v10 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v36;
          while (2)
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v36 != v12)
                objc_enumerationMutation(v34);
              if (objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "rangeOfString:options:", v4, 393) != 0x7FFFFFFFFFFFFFFFLL)
              {
                objc_msgSend(v8, "objectForKey:", CFSTR("CKConversationGUIDKey"));
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                -[CKContactsSearchManager matchingConversationWithGuid:](v33, "matchingConversationWithGuid:", v14);
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "chat");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "lastFinishedMessageDate");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = -[CKContactsSearchManager shouldIncludeGroupInResults:](v33, "shouldIncludeGroupInResults:", v17);

                if (v18)
                {
                  v19 = objc_alloc(MEMORY[0x1E0D13668]);
                  objc_msgSend(v15, "chat");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v20, "guid");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "displayName");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "chat");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v23, "participants");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  -[CKContactsSearchManager createAutocompelteGroupMembersFromParticipants:](v33, "createAutocompelteGroupMembersFromParticipants:", v24);
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  v26 = (void *)objc_msgSend(v19, "initWithIdentifier:title:members:", v21, v22, v25);

                  objc_msgSend(v29, "addObject:", v26);
                  goto LABEL_18;
                }

              }
            }
            v11 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
            if (v11)
              continue;
            break;
          }
        }
LABEL_18:

        v7 = v32 + 1;
      }
      while (v32 + 1 != v31);
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v31);
  }

  return v29;
}

- (id)createAutocompelteGroupMembersFromParticipants:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  void *v14;
  int IsEmail;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v10, "ID", (_QWORD)v24);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = MEMORY[0x193FF3B1C]();

        if ((v12 & 1) != 0)
        {
          v13 = 2;
        }
        else
        {
          objc_msgSend(v10, "ID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          IsEmail = IMStringIsEmail();

          if (IsEmail)
            v13 = 1;
          else
            v13 = 3;
        }
        v16 = (void *)objc_opt_new();
        objc_msgSend(v10, "firstName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setGivenName:", v17);

        objc_msgSend(v10, "lastName");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setFamilyName:", v18);

        objc_msgSend(v10, "nickname");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setNickname:", v19);

        v20 = objc_alloc(MEMORY[0x1E0D13670]);
        objc_msgSend(v10, "ID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)objc_msgSend(v20, "initWithNameComponents:address:addressType:", v16, v21, v13);

        objc_msgSend(v4, "addObject:", v22);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v7);
  }

  return v4;
}

- (BOOL)getSupplementalGroupsForSearchQuery:(id)a3 completionHandler:(id)a4
{
  return 0;
}

- (CKContactsSearchManagerDelegate)delegate
{
  return (CKContactsSearchManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)enteredRecipients
{
  return self->_enteredRecipients;
}

- (void)setEnteredRecipients:(id)a3
{
  objc_storeStrong((id *)&self->_enteredRecipients, a3);
}

- (BOOL)suppressGroupSuggestions
{
  return self->_suppressGroupSuggestions;
}

- (void)setSuppressGroupSuggestions:(BOOL)a3
{
  self->_suppressGroupSuggestions = a3;
}

- (BOOL)biasForOutgoingInteraction
{
  return self->_biasForOutgoingInteraction;
}

- (void)setBiasForOutgoingInteraction:(BOOL)a3
{
  self->_biasForOutgoingInteraction = a3;
}

- (BOOL)zkwGroupSuggestionsEnabled
{
  return self->_zkwGroupSuggestionsEnabled;
}

- (void)setZkwGroupSuggestionsEnabled:(BOOL)a3
{
  self->_zkwGroupSuggestionsEnabled = a3;
}

- (CNAutocompleteSearchManager)searchManager
{
  return self->_searchManager;
}

- (void)setSearchManager:(id)a3
{
  objc_storeStrong((id *)&self->_searchManager, a3);
}

- (void)setEmojiCharacterSet:(id)a3
{
  objc_storeStrong((id *)&self->_emojiCharacterSet, a3);
}

- (NSMutableArray)searchResults
{
  return self->_searchResults;
}

- (void)setSearchResults:(id)a3
{
  objc_storeStrong((id *)&self->_searchResults, a3);
}

- (NSNumber)currentSearchTaskID
{
  return self->_currentSearchTaskID;
}

- (void)setCurrentSearchTaskID:(id)a3
{
  objc_storeStrong((id *)&self->_currentSearchTaskID, a3);
}

- (NSString)searchText
{
  return self->_searchText;
}

- (void)setSearchText:(id)a3
{
  objc_storeStrong((id *)&self->_searchText, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchText, 0);
  objc_storeStrong((id *)&self->_currentSearchTaskID, 0);
  objc_storeStrong((id *)&self->_searchResults, 0);
  objc_storeStrong((id *)&self->_emojiCharacterSet, 0);
  objc_storeStrong((id *)&self->_searchManager, 0);
  objc_storeStrong((id *)&self->_enteredRecipients, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
