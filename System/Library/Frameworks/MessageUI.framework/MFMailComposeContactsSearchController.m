@implementation MFMailComposeContactsSearchController

- (MFMailComposeContactsSearchController)init
{
  MFMailComposeContactsSearchController *v2;
  uint64_t v3;
  CNAutocompleteSearchManager *manager;
  NSMutableArray *v5;
  NSMutableArray *autocompleteSearchResults;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MFMailComposeContactsSearchController;
  v2 = -[MFMailComposeContactsSearchController init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0D13660]), "initWithAutocompleteSearchType:", 0);
    manager = v2->_manager;
    v2->_manager = (CNAutocompleteSearchManager *)v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    autocompleteSearchResults = v2->_autocompleteSearchResults;
    v2->_autocompleteSearchResults = v5;

    -[CNAutocompleteSearchManager setImplicitGroupCreationThreshold:](v2->_manager, "setImplicitGroupCreationThreshold:", 2);
    -[CNAutocompleteSearchManager setIncludeUpcomingEventMembers:](v2->_manager, "setIncludeUpcomingEventMembers:", 1);
  }
  return v2;
}

- (void)_reset
{
  -[NSMutableArray removeAllObjects](self->_autocompleteSearchResults, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_corecipientSearchResults, "removeAllObjects");
}

- (void)searchWithString:(id)a3
{
  -[MFMailComposeContactsSearchController searchWithString:enteredRecipients:title:](self, "searchWithString:enteredRecipients:title:", a3, 0, 0);
}

- (void)searchWithString:(id)a3 enteredRecipients:(id)a4 title:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id WeakRetained;
  void *v12;
  CNAutocompleteSearchManager *manager;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v8 = a4;
  v9 = a5;
  -[MFMailComposeContactsSearchController _cancelSearchAndNotify:](self, "_cancelSearchAndNotify:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("MFMailComposeContactsSearchControllerWillBeginSearch"), self, 0);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "sendingAccountProxyForComposeContactsSearchController:", self);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  manager = self->_manager;
  objc_msgSend(v12, "uniqueID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteSearchManager setSendingAccountIdentifier:](manager, "setSendingAccountIdentifier:", v14);

  v15 = objc_msgSend(WeakRetained, "addressableGroupResultStyleForComposeContactsSearchController:", self);
  v16 = objc_alloc_init(MEMORY[0x1E0D13650]);
  objc_msgSend(v16, "setAddressableGroupResultStyle:", v15);
  -[CNAutocompleteSearchManager setSearchControllerOptions:](self->_manager, "setSearchControllerOptions:", v16);
  v17 = objc_alloc_init(MEMORY[0x1E0D135B0]);
  objc_msgSend(v8, "arrayByApplyingSelector:", sel_uncommentedAddress);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setOtherAddressesAlreadyChosen:", v18);

  objc_msgSend(v17, "setTitle:", v9);
  -[CNAutocompleteSearchManager searchForText:withAutocompleteFetchContext:consumer:](self->_manager, "searchForText:withAutocompleteFetchContext:consumer:", v20, v17, self);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailComposeContactsSearchController setTaskID:](self, "setTaskID:", v19);

}

- (void)cancelSearch
{
  -[MFMailComposeContactsSearchController _cancelSearchAndNotify:](self, "_cancelSearchAndNotify:", 1);
}

- (void)_cancelSearchAndNotify:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;

  v3 = a3;
  v5 = self->_waitingOnSearchResultsCount != 0;
  if (self->_taskID)
  {
    -[CNAutocompleteSearchManager cancelTaskWithID:](self->_manager, "cancelTaskWithID:");
    -[MFMailComposeContactsSearchController setTaskID:](self, "setTaskID:", 0);
    v5 = 1;
  }
  -[MFMailComposeContactsSearchController _reset](self, "_reset");
  self->_foundAnySearchResults = 0;
  if (v3 && v5)
    -[MFMailComposeContactsSearchController _finishSearch](self, "_finishSearch");
}

- (void)findCorecipientsWithRecipients:(id)a3
{
  NSNumber *corecipientSearchTaskID;
  id WeakRetained;
  void *v6;
  CNAutocompleteSearchManager *manager;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  NSNumber *v12;
  NSNumber *v13;
  id v14;

  v14 = a3;
  -[MFMailComposeContactsSearchController _reset](self, "_reset");
  if (self->_corecipientSearchTaskID)
  {
    -[CNAutocompleteSearchManager cancelTaskWithID:](self->_manager, "cancelTaskWithID:");
    corecipientSearchTaskID = self->_corecipientSearchTaskID;
    self->_corecipientSearchTaskID = 0;

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_msgSend(v14, "count"))
  {
    objc_msgSend(WeakRetained, "sendingAccountProxyForComposeContactsSearchController:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    manager = self->_manager;
    objc_msgSend(v6, "uniqueID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteSearchManager setSendingAccountIdentifier:](manager, "setSendingAccountIdentifier:", v8);

    v9 = objc_msgSend(WeakRetained, "addressableGroupResultStyleForComposeContactsSearchController:", self);
    v10 = objc_alloc_init(MEMORY[0x1E0D13650]);
    objc_msgSend(v10, "setAddressableGroupResultStyle:", v9);
    -[CNAutocompleteSearchManager setSearchControllerOptions:](self->_manager, "setSearchControllerOptions:", v10);
    v11 = objc_alloc_init(MEMORY[0x1E0D135B0]);
    objc_msgSend(v11, "setOtherAddressesAlreadyChosen:", v14);
    -[CNAutocompleteSearchManager searchForCorecipientsWithAutocompleteFetchContext:consumer:](self->_manager, "searchForCorecipientsWithAutocompleteFetchContext:consumer:", v11, self);
    v12 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v13 = self->_corecipientSearchTaskID;
    self->_corecipientSearchTaskID = v12;

  }
  else
  {
    objc_msgSend(WeakRetained, "composeContactsSearchController:didFindCorecipients:", self, 0);
  }

}

- (void)didSelectRecipient:(id)a3 atIndex:(unint64_t)a4
{
  -[CNAutocompleteSearchManager didSelectRecipient:atIndex:](self->_manager, "didSelectRecipient:atIndex:", a3, a4);
}

- (void)removeRecipient:(id)a3
{
  -[CNAutocompleteSearchManager removeRecipientResult:](self->_manager, "removeRecipientResult:", a3);
}

- (void)consumeAutocompleteSearchResults:(id)a3 taskID:(id)a4
{
  id WeakRetained;
  id v6;

  v6 = a3;
  -[NSMutableArray addObjectsFromArray:](self->_autocompleteSearchResults, "addObjectsFromArray:");
  self->_foundAnySearchResults |= -[NSMutableArray count](self->_autocompleteSearchResults, "count") != 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "composeContactsSearchController:didSortResults:", self, self->_autocompleteSearchResults);

}

- (void)finishedSearchingForAutocompleteResults
{
  id WeakRetained;

  self->_foundAnySearchResults |= -[NSMutableArray count](self->_autocompleteSearchResults, "count") != 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "composeContactsSearchController:didSortResults:", self, self->_autocompleteSearchResults);

  -[MFMailComposeContactsSearchController _finishSearch](self, "_finishSearch");
}

- (void)consumeCorecipientSearchResults:(id)a3 taskID:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSMutableArray *corecipientSearchResults;
  NSMutableArray *v10;
  NSMutableArray *v11;
  id WeakRetained;
  id v13;

  v13 = a3;
  v6 = a4;
  v7 = v13;
  v8 = v6;
  corecipientSearchResults = self->_corecipientSearchResults;
  if (!corecipientSearchResults)
  {
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v11 = self->_corecipientSearchResults;
    self->_corecipientSearchResults = v10;

    corecipientSearchResults = self->_corecipientSearchResults;
    v7 = v13;
  }
  -[NSMutableArray addObjectsFromArray:](corecipientSearchResults, "addObjectsFromArray:", v7);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "composeContactsSearchController:didFindCorecipients:", self, self->_corecipientSearchResults);

}

- (void)finishedSearchingForCorecipients
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "composeContactsSearchController:didFindCorecipients:", self, self->_corecipientSearchResults);

  -[MFMailComposeContactsSearchController _finishSearch](self, "_finishSearch");
}

- (void)finishedTaskWithID:(id)a3
{
  NSNumber *v4;
  NSNumber *v5;

  v5 = (NSNumber *)a3;
  -[MFMailComposeContactsSearchController taskID](self, "taskID");
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
  {
    -[MFMailComposeContactsSearchController setTaskID:](self, "setTaskID:", 0);
    -[MFMailComposeContactsSearchController _finishSearch](self, "_finishSearch");
  }
  else if (self->_corecipientSearchTaskID == v5)
  {
    self->_corecipientSearchTaskID = 0;

  }
}

- (void)_finishSearch
{
  void *v3;
  void *v4;
  _QWORD block[5];

  if (!self->_waitingOnSearchResultsCount)
  {
    -[MFMailComposeContactsSearchController taskID](self, "taskID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __54__MFMailComposeContactsSearchController__finishSearch__block_invoke;
      block[3] = &unk_1E5A65480;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("MFMailComposeContactsSearchControllerDidEndSearch"), self, 0);

    }
  }
}

void __54__MFMailComposeContactsSearchController__finishSearch__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
  objc_msgSend(WeakRetained, "composeContactsSearchController:finishedWithResults:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 40));

}

- (void)beganNetworkActivity
{
  id v2;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNetworkActivityIndicatorVisible:", 1);

}

- (void)endedNetworkActivity
{
  id v2;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNetworkActivityIndicatorVisible:", 0);

}

- (MFMailComposeContactsSearchControllerDelegate)delegate
{
  return (MFMailComposeContactsSearchControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSNumber)taskID
{
  return self->_taskID;
}

- (void)setTaskID:(id)a3
{
  objc_storeStrong((id *)&self->_taskID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_corecipientSearchTaskID, 0);
  objc_storeStrong((id *)&self->_corecipientSearchResults, 0);
  objc_storeStrong((id *)&self->_autocompleteSearchResults, 0);
  objc_storeStrong((id *)&self->_manager, 0);
}

@end
