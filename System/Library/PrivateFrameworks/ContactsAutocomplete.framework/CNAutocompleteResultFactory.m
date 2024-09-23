@implementation CNAutocompleteResultFactory

+ (CNAutocompleteResultFactory)factoryWithPriorityDomain:(id)a3 sendingAddress:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPriorityDomain:sendingAddress:", v7, v6);

  return (CNAutocompleteResultFactory *)v8;
}

- (CNAutocompleteResultFactory)initWithPriorityDomain:(id)a3 sendingAddress:(id)a4
{
  id v6;
  id v7;
  CNAutocompleteResultFactory *v8;
  uint64_t v9;
  NSString *preferredDomain;
  uint64_t v11;
  NSString *sendingAddress;
  CNAutocompleteResultFactory *v13;

  v6 = a3;
  v7 = a4;
  v8 = -[CNAutocompleteResultFactory init](self, "init");
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    preferredDomain = v8->_preferredDomain;
    v8->_preferredDomain = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    sendingAddress = v8->_sendingAddress;
    v8->_sendingAddress = (NSString *)v11;

    v13 = v8;
  }

  return v8;
}

- (id)localContactResultWithDisplayName:(id)a3 value:(id)a4 nameComponents:(id)a5 contactIdentifier:(id)a6
{
  void *v7;

  +[CNAutocompleteResult contactResultWithDisplayName:value:nameComponents:identifier:](CNAutocompleteResult, "contactResultWithDisplayName:value:nameComponents:identifier:", a3, a4, a5, a6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteResultFactory applySearchContextToResult:](self, "applySearchContextToResult:", v7);
  objc_msgSend(v7, "setSourceType:", 2);
  return v7;
}

- (id)localGroupResultWithDisplayName:(id)a3 groupIdentifier:(id)a4
{
  void *v5;

  +[CNAutocompleteResult groupResultWithDisplayName:identifier:](CNAutocompleteResult, "groupResultWithDisplayName:identifier:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteResultFactory applySearchContextToResult:](self, "applySearchContextToResult:", v5);
  objc_msgSend(v5, "setSourceType:", 2);
  return v5;
}

- (id)localGroupResultWithDisplayName:(id)a3 groupIdentifier:(id)a4 membersProvider:(id)a5
{
  id v8;
  void *v9;

  v8 = a5;
  -[CNAutocompleteResultFactory localGroupResultWithDisplayName:groupIdentifier:](self, "localGroupResultWithDisplayName:groupIdentifier:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMembersProvider:", v8);

  return v9;
}

- (id)duetGroupResultWithDisplayName:(id)a3 groupIdentifier:(id)a4 membersProvider:(id)a5
{
  id v8;
  void *v9;

  v8 = a5;
  -[CNAutocompleteResultFactory localGroupResultWithDisplayName:groupIdentifier:](self, "localGroupResultWithDisplayName:groupIdentifier:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMembersProvider:", v8);

  objc_msgSend(v9, "setSourceType:", 16);
  return v9;
}

- (id)recentResultWithDisplayName:(id)a3 value:(id)a4 lastSendingAddress:(id)a5 dateCount:(unint64_t)a6 date:(id)a7 group:(BOOL)a8 completesChosenGroup:(BOOL)a9
{
  uint64_t v10;

  if (a6 < 5)
  {
    LOBYTE(v10) = a9;
    -[CNAutocompleteResultFactory infrequentRecentResultWithDisplayName:value:lastSendingAddress:dateCount:date:group:completesChosenGroup:](self, "infrequentRecentResultWithDisplayName:value:lastSendingAddress:dateCount:date:group:completesChosenGroup:", a3, a4, a5, v10);
  }
  else
  {
    -[CNAutocompleteResultFactory frequentRecentResultWithDisplayName:value:lastSendingAddress:date:group:completesChosenGroup:](self, "frequentRecentResultWithDisplayName:value:lastSendingAddress:date:group:completesChosenGroup:", a3, a4, a5, a7, a8, a9);
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)frequentRecentResultWithDisplayName:(id)a3 value:(id)a4 lastSendingAddress:(id)a5 date:(id)a6 group:(BOOL)a7 completesChosenGroup:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  if (a7)
  {
    +[CNAutocompleteRecentResult groupResultWithDisplayName:date:](CNAutocompleteFrequentRecentResult, "groupResultWithDisplayName:date:", v14, v17);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteResultFactory applySearchContextToResult:](self, "applySearchContextToResult:", v18);
    objc_msgSend(v18, "setSourceType:", 1);
  }
  else
  {
    +[CNAutocompleteRecentResult contactResultWithDisplayName:value:lastSendingAddress:date:](CNAutocompleteFrequentRecentResult, "contactResultWithDisplayName:value:lastSendingAddress:date:", v14, v15, v16, v17);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteResultFactory applySearchContextToResult:](self, "applySearchContextToResult:", v18);
    objc_msgSend(v18, "setSourceType:", 1);
    if (a8)
    {
      objc_opt_class();
      v18 = v18;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v19 = v18;
      else
        v19 = 0;
      v20 = v19;

      objc_msgSend(v20, "setCompletesChosenGroup:", 1);
    }
  }

  return v18;
}

- (id)infrequentRecentResultWithDisplayName:(id)a3 value:(id)a4 lastSendingAddress:(id)a5 dateCount:(unint64_t)a6 date:(id)a7 group:(BOOL)a8 completesChosenGroup:(BOOL)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  if (a8)
  {
    +[CNAutocompleteInfrequentRecentResult groupResultWithDisplayName:dateCount:date:](CNAutocompleteInfrequentRecentResult, "groupResultWithDisplayName:dateCount:date:", v15, a6, v18);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteResultFactory applySearchContextToResult:](self, "applySearchContextToResult:", v19);
    objc_msgSend(v19, "setSourceType:", 1);
  }
  else
  {
    +[CNAutocompleteInfrequentRecentResult contactResultWithDisplayName:value:lastSendingAddress:dateCount:date:](CNAutocompleteInfrequentRecentResult, "contactResultWithDisplayName:value:lastSendingAddress:dateCount:date:", v15, v16, v17, a6, v18);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteResultFactory applySearchContextToResult:](self, "applySearchContextToResult:", v19);
    objc_msgSend(v19, "setSourceType:", 1);
    if (a9)
    {
      objc_opt_class();
      v19 = v19;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v20 = v19;
      else
        v20 = 0;
      v21 = v20;

      objc_msgSend(v21, "setCompletesChosenGroup:", 1);
    }
  }

  return v19;
}

- (id)suggestedResultWithDisplayName:(id)a3 value:(id)a4 nameComponents:(id)a5
{
  void *v6;

  +[CNAutocompleteResult contactResultWithDisplayName:value:nameComponents:identifier:](CNAutocompleteSuggestedContactResult, "contactResultWithDisplayName:value:nameComponents:identifier:", a3, a4, a5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteResultFactory applySearchContextToResult:](self, "applySearchContextToResult:", v6);
  objc_msgSend(v6, "setSourceType:", 4);
  return v6;
}

- (id)MAIDResultWithDisplayName:(id)a3 value:(id)a4 nameComponents:(id)a5
{
  void *v6;

  +[CNAutocompleteResult contactResultWithDisplayName:value:nameComponents:identifier:](CNAutocompleteExtensionResult, "contactResultWithDisplayName:value:nameComponents:identifier:", a3, a4, a5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteResultFactory applySearchContextToResult:](self, "applySearchContextToResult:", v6);
  objc_msgSend(v6, "setSourceType:", 128);
  return v6;
}

- (id)MAIDGroupResultWithDisplayName:(id)a3 groupIdentifier:(id)a4 membersProvider:(id)a5
{
  id v8;
  void *v9;

  v8 = a5;
  +[CNAutocompleteResult groupResultWithDisplayName:identifier:](CNAutocompleteResult, "groupResultWithDisplayName:identifier:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteResultFactory applySearchContextToResult:](self, "applySearchContextToResult:", v9);
  objc_msgSend(v9, "setSourceType:", 128);
  objc_msgSend(v9, "setMembersProvider:", v8);

  return v9;
}

- (id)extensionResultWithDisplayName:(id)a3 value:(id)a4 nameComponents:(id)a5
{
  void *v6;

  +[CNAutocompleteResult contactResultWithDisplayName:value:nameComponents:identifier:](CNAutocompleteExtensionResult, "contactResultWithDisplayName:value:nameComponents:identifier:", a3, a4, a5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteResultFactory applySearchContextToResult:](self, "applySearchContextToResult:", v6);
  objc_msgSend(v6, "setSourceType:", 256);
  return v6;
}

- (id)extensionGroupResultWithDisplayName:(id)a3 groupIdentifier:(id)a4 membersProvider:(id)a5
{
  id v8;
  void *v9;

  v8 = a5;
  +[CNAutocompleteResult groupResultWithDisplayName:identifier:](CNAutocompleteResult, "groupResultWithDisplayName:identifier:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteResultFactory applySearchContextToResult:](self, "applySearchContextToResult:", v9);
  objc_msgSend(v9, "setSourceType:", 256);
  objc_msgSend(v9, "setMembersProvider:", v8);

  return v9;
}

- (id)directoryServerResultWithDisplayName:(id)a3 value:(id)a4 nameComponents:(id)a5
{
  void *v6;

  +[CNAutocompleteResult contactResultWithDisplayName:value:nameComponents:identifier:](CNAutocompleteDirectoryServerResult, "contactResultWithDisplayName:value:nameComponents:identifier:", a3, a4, a5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteResultFactory applySearchContextToResult:](self, "applySearchContextToResult:", v6);
  objc_msgSend(v6, "setSourceType:", 8);
  return v6;
}

- (id)calendarServerResultWithDisplayName:(id)a3 value:(id)a4 nameComponents:(id)a5 userInfo:(id)a6
{
  void *v7;

  +[CNAutocompleteCalendarServerResult contactResultWithDisplayName:value:nameComponents:identifier:userInfo:](CNAutocompleteCalendarServerResult, "contactResultWithDisplayName:value:nameComponents:identifier:userInfo:", a3, a4, a5, 0, a6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteResultFactory applySearchContextToResult:](self, "applySearchContextToResult:", v7);
  return v7;
}

- (id)duetResultWithDisplayName:(id)a3 value:(id)a4 contactIdentifier:(id)a5
{
  void *v6;

  +[CNAutocompleteResult contactResultWithDisplayName:value:nameComponents:identifier:](CNAutocompleteDuetContactResult, "contactResultWithDisplayName:value:nameComponents:identifier:", a3, a4, 0, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteResultFactory applySearchContextToResult:](self, "applySearchContextToResult:", v6);
  objc_msgSend(v6, "setSourceType:", 16);
  return v6;
}

- (void)applySearchContextToResult:(id)a3
{
  id v4;

  v4 = a3;
  -[CNAutocompleteResultFactory applyPreferredDomainBitToResult:](self, "applyPreferredDomainBitToResult:", v4);
  -[CNAutocompleteResultFactory applyLastSendingAddressBitToResult:](self, "applyLastSendingAddressBitToResult:", v4);

}

- (void)applyPreferredDomainBitToResult:(id)a3
{
  char v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))();
  v5 = v8;
  if ((v4 & 1) == 0)
  {
    objc_msgSend(v8, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "address");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "hasSuffix:", self->_preferredDomain))
      objc_msgSend(v8, "setHasPreferredDomain:", 1);

    v5 = v8;
  }

}

- (void)applyLastSendingAddressBitToResult:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSString *sendingAddress;
  void *v8;
  id v9;

  v9 = a3;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))() & 1) == 0)
  {
    objc_opt_class();
    v4 = v9;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;

    if (v6)
    {
      sendingAddress = self->_sendingAddress;
      objc_msgSend(v6, "lastSendingAddress");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(sendingAddress) = -[NSString _cn_caseInsensitiveIsEqual:](sendingAddress, "_cn_caseInsensitiveIsEqual:", v8);

      if ((_DWORD)sendingAddress)
        objc_msgSend(v6, "setMatchesSendingAddress:", 1);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendingAddress, 0);
  objc_storeStrong((id *)&self->_preferredDomain, 0);
}

@end
