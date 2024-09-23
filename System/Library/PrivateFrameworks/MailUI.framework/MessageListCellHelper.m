@implementation MessageListCellHelper

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (BOOL)isCompact
{
  return self->_compact;
}

- (EMMessageListItem)messageListItem
{
  return self->_messageListItem;
}

- (void)updateViewConfigurationForState:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MessageListCellHelper cellView](self, "cellView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConfigurationState:", v4);

}

void __83__MessageListCellHelper__cellViewModelForMessageListItem_style_hintsBySnippetZone___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  char v31;
  uint64_t v32;
  void *v33;
  int v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;

  v38 = a2;
  objc_msgSend(*(id *)(a1 + 32), "flags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setRead:", objc_msgSend(v3, "read"));
  objc_msgSend(v38, "setFlagged:", objc_msgSend(v3, "flagged"));
  objc_msgSend(*(id *)(a1 + 32), "flagColors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setFlagColors:", v4);

  objc_msgSend(v38, "setReplied:", objc_msgSend(v3, "replied"));
  objc_msgSend(v38, "setForwarded:", objc_msgSend(v3, "forwarded"));
  objc_msgSend(v38, "setRedirected:", objc_msgSend(v3, "redirected"));
  objc_msgSend(v38, "setJunk:", objc_msgSend(v3, "isJunk"));
  if ((objc_msgSend(*(id *)(a1 + 40), "canShowReadLaterDate") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "readLater");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setReadLaterDate:", v6);

  }
  else
  {
    objc_msgSend(v38, "setReadLaterDate:", 0);
  }
  objc_msgSend(*(id *)(a1 + 32), "sendLaterDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setSendLaterDate:", v7);

  objc_msgSend(*(id *)(a1 + 32), "followUp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setFollowUp:", v8);

  objc_msgSend(v38, "setHintsBySnippetZone:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setDate:", v9);

  objc_msgSend(*(id *)(a1 + 32), "displayDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setDisplayDate:", v10);

  objc_msgSend(v38, "setHideFollowUp:", objc_msgSend(*(id *)(a1 + 40), "shouldHideFollowUp"));
  v11 = (void *)MEMORY[0x1E0D1E7A8];
  objc_msgSend(*(id *)(a1 + 32), "subject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "subjectStringForDisplayForSubject:style:", v12, *(_QWORD *)(a1 + 56));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v38, "setSubjectIsPresent:", objc_msgSend(v13, "length") != 0);
  if ((objc_msgSend(v38, "subjectIsPresent") & 1) == 0)
  {
    +[MUILocalizedMessageListStrings noSubjectPlaceholder](MUILocalizedMessageListStrings, "noSubjectPlaceholder");
    v14 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v14;
  }
  v37 = v13;
  objc_msgSend(v38, "setSubject:", v13);
  if (objc_msgSend(*(id *)(a1 + 40), "isSearchResult"))
    v15 = objc_msgSend(*(id *)(a1 + 40), "isLocalMailboxSearchScope") ^ 1;
  else
    v15 = 1;
  if (objc_msgSend(*(id *)(a1 + 40), "isOutgoingMailbox")
    && !objc_msgSend(*(id *)(a1 + 40), "isSearchResult")
    || (objc_msgSend(*(id *)(a1 + 40), "isOutgoingMailbox") ^ 1 | v15) != 1)
  {
    goto LABEL_14;
  }
  objc_msgSend(*(id *)(a1 + 32), "followUp");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v16, "isActive") & 1) != 0)
  {
    v17 = objc_msgSend(*(id *)(a1 + 40), "isInbox");

    if ((v17 & 1) != 0)
    {
LABEL_14:
      objc_msgSend(*(id *)(a1 + 32), "toList");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 1;
      goto LABEL_17;
    }
  }
  else
  {

  }
  objc_msgSend(*(id *)(a1 + 32), "senderList");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
LABEL_17:
  objc_msgSend(*(id *)(a1 + 40), "applicationProxy");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addressListFormatter");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "stringFromEmailAddressList:preferFullDisplayName:", v18, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "ef_mapSelector:", sel_stringValue);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1E280], "authorHintsFromHintsBySnippetZone:", *(_QWORD *)(a1 + 48));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "count"))
  {
    objc_msgSend(v21, "attributedStringFromEmailAddressList:", v18);
    v25 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = 0;
  }
  if (objc_msgSend(v22, "length"))
  {
    objc_msgSend(v38, "setAddressIsPresent:", 1);
    objc_msgSend(v38, "setAddress:", v22);
    objc_msgSend(v38, "setAttributedAddress:", v25);
    objc_msgSend(v38, "setAddressList:", v18);
  }
  else
  {
    if ((v19 & 1) != 0)
      +[MUILocalizedMessageListStrings noRecipientsPlaceholder](MUILocalizedMessageListStrings, "noRecipientsPlaceholder");
    else
      +[MUILocalizedMessageListStrings noSenderPlaceholder](MUILocalizedMessageListStrings, "noSenderPlaceholder");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setAddress:", v26);

  }
  v36 = (void *)v25;
  if (objc_msgSend(v23, "count"))
    objc_msgSend(v38, "setEmailAddresses:", v23);
  objc_msgSend(v38, "setVIP:", objc_msgSend(*(id *)(a1 + 32), "isVIP"));
  objc_msgSend(v38, "setHasAttachments:", objc_msgSend(*(id *)(a1 + 32), "hasAttachments"));
  objc_msgSend(v38, "setRecipientType:", 0);
  objc_msgSend(*(id *)(a1 + 40), "applicationProxy");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "showToCCIndicators");

  if (v28)
  {
    objc_msgSend(v21, "userProfileProvider");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "toList");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isMyEmailAddressContainedInAddressList:", v30);

    if ((v31 & 1) != 0)
    {
      v32 = 1;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "ccList");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v29, "isMyEmailAddressContainedInAddressList:", v33);

      if (!v34)
      {
LABEL_34:

        goto LABEL_35;
      }
      v32 = 2;
    }
    objc_msgSend(v38, "setRecipientType:", v32);
    goto LABEL_34;
  }
LABEL_35:
  v35 = objc_msgSend(*(id *)(a1 + 32), "conversationNotificationLevel");
  objc_msgSend(v38, "setNotify:", v35 == 2);
  objc_msgSend(v38, "setMute:", v35 == 1);
  objc_msgSend(v38, "setStyle:", *(_QWORD *)(a1 + 64));
  objc_msgSend(v38, "setBlockedSender:", objc_msgSend(*(id *)(a1 + 32), "isBlocked"));
  objc_msgSend(v38, "setUnsubscribeType:", objc_msgSend(*(id *)(a1 + 32), "unsubscribeType"));

}

- (BOOL)isOutgoingMailbox
{
  return self->_outgoingMailbox;
}

- (BOOL)shouldHideFollowUp
{
  return self->_hideFollowUp;
}

- (void)setShowsAccessory:(BOOL)a3 showingDetail:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v4 = a4;
  v5 = a3;
  -[MessageListCellHelper cellView](self, "cellView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "chevronType");

  -[MessageListCellHelper cellView](self, "cellView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "style");

  v12 = 2;
  if (v11 != 1)
    v12 = !v4;
  if (!v5)
    v12 = 0;
  if (v11 == 2)
    v13 = 0;
  else
    v13 = v12;
  if (v8 != v13)
  {
    -[MessageListCellHelper cellView](self, "cellView");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setChevronType:", v13);

  }
}

- (id)configurationStateForCellConfigurationState:(id)a3
{
  id v4;
  int64_t v5;
  _BOOL8 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v4 = a3;
  v5 = -[MessageListCellHelper style](self, "style");
  v6 = v5 == 1 && -[MessageListCellHelper disclosureEnabled](self, "disclosureEnabled");
  if (v5 == 2)
    v7 = v6 ^ 1;
  else
    v7 = 0;
  v8 = (void *)MEMORY[0x1E0DC37E0];
  -[MessageListCellHelper cellView](self, "cellView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "focusSystemForEnvironment:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[MessageListCellHelper applicationProxy](self, "applicationProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "focusedItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isMessageListCellObject:", v12);

  objc_msgSend(v4, "setIsParent:", v6);
  objc_msgSend(v4, "setIsChild:", v7);
  objc_msgSend(v4, "setIsFocusSystemActive:", v10 != 0);
  objc_msgSend(v4, "setIsFocusingOnMessageListCell:", v13);

  return v4;
}

- (MessageListCellViewable)cellView
{
  return self->_cellView;
}

- (int64_t)style
{
  return self->_style;
}

- (MessageListCellHelperApplicationProxy)applicationProxy
{
  return self->_applicationProxy;
}

- (BOOL)disclosureEnabled
{
  return self->_disclosureEnabled;
}

- (void)setShouldDisplayUnreadAndVIP:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  if (self->_shouldDisplayUnreadAndVIP != a3)
    self->_shouldDisplayUnreadAndVIP = a3;
  -[MessageListCellHelper cellView](self, "cellView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDisplayUnreadDot:", v3);

  -[MessageListCellHelper cellView](self, "cellView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDisplayVIP:", v3);

}

- (void)setShouldAnnotateReplyOrForward:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_shouldAnnotateReplyOrForward != a3)
  {
    v3 = a3;
    self->_shouldAnnotateReplyOrForward = a3;
    -[MessageListCellHelper cellView](self, "cellView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setShouldAnnotateReplyOrForward:", v3);

  }
}

- (void)setSearchResult:(BOOL)a3
{
  self->_searchResult = a3;
}

- (void)setOutgoingMailbox:(BOOL)a3
{
  self->_outgoingMailbox = a3;
}

- (void)setMessageListItem:(id)a3 style:(int64_t)a4 hintsBySnippetZone:(id)a5
{
  id v9;
  id v10;

  objc_storeStrong((id *)&self->_messageListItem, a3);
  v9 = a3;
  v10 = a5;
  self->_style = a4;
  -[MessageListCellHelper _updateViewsToMatchMessageListItem:style:hintsBySnippetZone:](self, "_updateViewsToMatchMessageListItem:style:hintsBySnippetZone:", v9, a4, v10);

}

- (void)setLocalMailboxSearchScope:(BOOL)a3
{
  self->_localMailboxSearchScope = a3;
}

- (void)setInbox:(BOOL)a3
{
  self->_inbox = a3;
}

- (void)setHideFollowUp:(BOOL)a3
{
  self->_hideFollowUp = a3;
}

- (void)setExpanded:(BOOL)a3
{
  self->_expanded = a3;
}

- (void)setCompact:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  if (self->_compact != a3)
  {
    v3 = a3;
    self->_compact = a3;
    -[MessageListCellHelper cellView](self, "cellView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCompact:", v3);

    -[MessageListCellHelper parentView](self, "parentView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mui_setNeedsLayout");

  }
}

- (void)setCanShowReadLaterDate:(BOOL)a3
{
  self->_canShowReadLaterDate = a3;
}

- (BOOL)isSearchResult
{
  return self->_searchResult;
}

- (BOOL)canShowReadLaterDate
{
  return self->_canShowReadLaterDate;
}

- (void)updateViewContentConfiguration:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MessageListCellHelper cellView](self, "cellView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentConfiguration:", v4);

}

- (void)updateViewBackgroundConfiguration:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MessageListCellHelper cellView](self, "cellView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundConfiguration:", v4);

}

- (MessageListCellHelper)initWithParentView:(id)a3 contentView:(id)a4 cellView:(id)a5 applicationProxy:(id)a6
{
  id v10;
  MessageListCellViewable *v11;
  id v12;
  id v13;
  MessageListCellHelper *v14;
  MessageListCellHelper *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  EMNSUserDefaultsBoolObserver *automaticallySummarizeMessages;
  _QWORD v22[4];
  id v23;
  id location;
  objc_super v25;

  v10 = a3;
  v11 = (MessageListCellViewable *)a4;
  v12 = a5;
  v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)MessageListCellHelper;
  v14 = -[MessageListCellHelper init](&v25, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_parentView, v10);
    objc_storeWeak((id *)&v15->_contentView, v11);
    objc_msgSend(v10, "setMui_clipsToBounds:", 1);
    objc_msgSend(v10, "setAutoresizesSubviews:", 1);
    objc_storeStrong((id *)&v15->_cellView, a5);
    if (v15->_cellView != v11)
      -[MessageListCellViewable addSubview:](v11, "addSubview:");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v15, sel__significantTimeChange, *MEMORY[0x1E0DC4838], 0);
    objc_msgSend(v10, "setAccessibilityIdentifier:", *MEMORY[0x1E0D46B68]);
    objc_storeStrong((id *)&v15->_applicationProxy, a6);
    v15->_disclosureEnabled = 0;
    if (_os_feature_enabled_impl() && EMIsGreymatterSupportedWithOverride())
    {
      location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, v15);
      v17 = objc_alloc(MEMORY[0x1E0D1E2A0]);
      v18 = *MEMORY[0x1E0D1E018];
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __82__MessageListCellHelper_initWithParentView_contentView_cellView_applicationProxy___block_invoke;
      v22[3] = &unk_1E99E1230;
      objc_copyWeak(&v23, &location);
      v19 = objc_msgSend(v17, "initWithUserDefaultKey:keyRepresentsDisabled:handler:", v18, 1, v22);
      automaticallySummarizeMessages = v15->_automaticallySummarizeMessages;
      v15->_automaticallySummarizeMessages = (EMNSUserDefaultsBoolObserver *)v19;

      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);
    }

  }
  return v15;
}

- (id)contentConfigurationForState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[MessageListCellHelper cellView](self, "cellView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "useSidebarAppearance") & 1) != 0)
    objc_msgSend(MEMORY[0x1E0DC39A8], "cellConfiguration");
  else
    objc_msgSend(MEMORY[0x1E0DC39A8], "valueCellConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "updatedConfigurationForState:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)backgroundConfigurationForState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[MessageListCellHelper cellView](self, "cellView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "defaultBackgroundConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "backgroundColorForConfigurationState:backgroundConfiguration:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v7, "setBackgroundColor:", v8);
  objc_msgSend(v6, "backgroundCornerRadius");
  objc_msgSend(v7, "setCornerRadius:");

  return v7;
}

- (void)_updateViewsToMatchMessageListItem:(id)a3 style:(int64_t)a4 hintsBySnippetZone:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint8_t buf[4];
  MessageListCellHelper *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  -[MessageListCellHelper cellView](self, "cellView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageListCellHelper _cellViewModelForMessageListItem:style:hintsBySnippetZone:](self, "_cellViewModelForMessageListItem:style:hintsBySnippetZone:", v8, a4, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setViewModel:", v11);
  if (_os_feature_enabled_impl()
    && EMIsGreymatterAvailableWithOverride()
    && (-[MessageListCellHelper _generatedSummaryForUpdatingCellView:](self, "_generatedSummaryForUpdatingCellView:", v10), (v12 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v13 = (void *)v12;
    _ef_log_MessageListCellHelper();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "itemID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v27 = self;
      v28 = 2114;
      v29 = v15;
      _os_log_impl(&dword_1D5522000, v14, OS_LOG_TYPE_DEFAULT, "<%p>: Found generated summary for %{public}@, displaying generated one over classic summary", buf, 0x16u);

    }
    v16 = v13;
    v17 = 1;
    v18 = v16;
  }
  else
  {
    objc_msgSend(v8, "summary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v16 = 0;
    v19 = 0;
    if (!v18)
      goto LABEL_11;
  }
  if (objc_msgSend(v18, "length"))
  {
    v19 = v18;
  }
  else
  {
    +[MUILocalizedMessageListStrings noContentPlaceholder](MUILocalizedMessageListStrings, "noContentPlaceholder");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_11:
  if (objc_msgSend(MEMORY[0x1E0D1E1A8], "preferenceEnabled:", 7))
  {
    v20 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v8, "itemID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "displayMessageItemID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("%@/%@:%@"), v21, v22, v19);
    v23 = objc_claimAutoreleasedReturnValue();

    v19 = (void *)v23;
  }
  objc_msgSend(v10, "setSummary:", v19);
  objc_msgSend(v10, "setHasGeneratedSummary:", v17);
  objc_msgSend(v8, "flags");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAnnotatedRelationshipType:", -[MessageListCellHelper _cellViewRelationshipTypeForFlags:](self, "_cellViewRelationshipTypeForFlags:", v24));

  -[MessageListCellHelper parentView](self, "parentView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "mui_setNeedsLayout");

}

- (UIView)parentView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_parentView);
}

- (int64_t)_cellViewRelationshipTypeForFlags:(id)a3
{
  id v3;
  uint64_t v4;
  int64_t v5;
  int v6;

  v3 = a3;
  if (objc_msgSend(v3, "draft"))
    v4 = 2;
  else
    v4 = 0;
  if (objc_msgSend(v3, "forwarded"))
    v5 = 3;
  else
    v5 = v4;
  v6 = objc_msgSend(v3, "replied");

  if (v6)
    return 1;
  else
    return v5;
}

- (id)_cellViewModelForMessageListItem:(id)a3 style:(int64_t)a4 hintsBySnippetZone:(id)a5
{
  id v8;
  id v9;
  MessageListCellViewModel *v10;
  MessageListCellViewModel *v11;
  _QWORD v13[4];
  id v14;
  MessageListCellHelper *v15;
  id v16;
  _BOOL8 v17;
  int64_t v18;

  v8 = a3;
  v9 = a5;
  if (v8)
  {
    v10 = [MessageListCellViewModel alloc];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __83__MessageListCellHelper__cellViewModelForMessageListItem_style_hintsBySnippetZone___block_invoke;
    v13[3] = &unk_1E99E1280;
    v14 = v8;
    v15 = self;
    v16 = v9;
    v17 = a4 == 1;
    v18 = a4;
    v11 = -[MessageListCellViewModel initWithBuilder:](v10, "initWithBuilder:", v13);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void ___ef_log_MessageListCellHelper_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email", "MessageListCellHelper");
  v1 = (void *)_ef_log_MessageListCellHelper_log;
  _ef_log_MessageListCellHelper_log = (uint64_t)v0;

}

void __82__MessageListCellHelper_initWithParentView_contentView_cellView_applicationProxy___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v7 = WeakRetained;
    objc_msgSend(WeakRetained, "messageListItem");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v7, "style");
    objc_msgSend(v7, "cellView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hintsBySnippetZone");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_updateViewsToMatchMessageListItem:style:hintsBySnippetZone:", v2, v3, v6);

    WeakRetained = v7;
  }

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[MessageListCellHelper predictedMailbox](self, "predictedMailbox");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancel");

  v5.receiver = self;
  v5.super_class = (Class)MessageListCellHelper;
  -[MessageListCellHelper dealloc](&v5, sel_dealloc);
}

- (void)_significantTimeChange
{
  void *v2;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __47__MessageListCellHelper__significantTimeChange__block_invoke;
  v3[3] = &unk_1E99E1258;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performBlock:", v3);

}

void __47__MessageListCellHelper__significantTimeChange__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "cellView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "refreshForSignificantTimeChange");

  objc_msgSend(*(id *)(a1 + 32), "parentView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mui_setNeedsLayout");

}

- (void)setMessageListItem:(id)a3 style:(int64_t)a4
{
  -[MessageListCellHelper setMessageListItem:style:hintsBySnippetZone:](self, "setMessageListItem:style:hintsBySnippetZone:", a3, a4, 0);
}

- (id)_generatedSummaryString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[MessageListCellHelper automaticallySummarizeMessages](self, "automaticallySummarizeMessages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEnabled"))
  {
    -[MessageListCellHelper messageListItem](self, "messageListItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "generatedSummary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "topLine");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "string");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_generatedSummaryForUpdatingCellView:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;

  v4 = a3;
  -[MessageListCellHelper setUpdateSummaryCancelationToken:](self, "setUpdateSummaryCancelationToken:", 0);
  -[MessageListCellHelper _generatedSummaryString](self, "_generatedSummaryString");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(v4, "summary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
    {
      -[MessageListCellHelper messageListItem](self, "messageListItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "summary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", v7);

      if (v10)
      {
        if ((objc_msgSend(v4, "hasGeneratedSummary") & 1) == 0
          && (objc_msgSend(MEMORY[0x1E0D1E1A8], "preferenceEnabled:", 43) & 1) == 0
          && -[MessageListCellHelper isVisible](self, "isVisible"))
        {

          -[MessageListCellHelper _registerUpdateGeneratedSummaryObservation](self, "_registerUpdateGeneratedSummaryObservation");
          v6 = 0;
        }
      }
    }
    v11 = v6;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_registerUpdateGeneratedSummaryObservation
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  MessageListCellHelper *v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _BYTE buf[12];
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[MessageListCellHelper messageListItem](self, "messageListItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  _ef_log_MessageListCellHelper();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = self;
    v28 = 2114;
    v29 = v4;
    _os_log_impl(&dword_1D5522000, v5, OS_LOG_TYPE_DEFAULT, "<%p>: Have generated summary for %{public}@, deferring update until cell is not visible", buf, 0x16u);
  }

  v6 = objc_alloc_init(MEMORY[0x1E0D1EE78]);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __67__MessageListCellHelper__registerUpdateGeneratedSummaryObservation__block_invoke;
  v24[3] = &unk_1E99E12A8;
  objc_copyWeak(&v26, (id *)buf);
  v10 = *MEMORY[0x1E0DC5318];
  v11 = v4;
  v25 = v11;
  objc_msgSend(v7, "addObserverForName:object:queue:usingBlock:", v10, 0, v8, v24);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v9;
  v17 = 3221225472;
  v18 = __67__MessageListCellHelper__registerUpdateGeneratedSummaryObservation__block_invoke_52;
  v19 = &unk_1E99E12D0;
  v20 = self;
  v13 = v11;
  v21 = v13;
  v14 = v7;
  v22 = v14;
  v15 = v12;
  v23 = v15;
  objc_msgSend(v6, "addCancelationBlock:", &v16);
  -[MessageListCellHelper setUpdateSummaryCancelationToken:](self, "setUpdateSummaryCancelationToken:", v6, v16, v17, v18, v19, v20);

  objc_destroyWeak(&v26);
  objc_destroyWeak((id *)buf);

}

void __67__MessageListCellHelper__registerUpdateGeneratedSummaryObservation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  int v5;
  id v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    _ef_log_MessageListCellHelper();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = 134218242;
      v6 = WeakRetained;
      v7 = 2114;
      v8 = v4;
      _os_log_impl(&dword_1D5522000, v3, OS_LOG_TYPE_DEFAULT, "<%p>: Applying generated summary for %{public}@ due to scene backgrounding", (uint8_t *)&v5, 0x16u);
    }

    objc_msgSend(WeakRetained, "_updateGeneratedSummary");
    objc_msgSend(WeakRetained, "setUpdateSummaryCancelationToken:", 0);
  }

}

uint64_t __67__MessageListCellHelper__registerUpdateGeneratedSummaryObservation__block_invoke_52(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _ef_log_MessageListCellHelper();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 134218242;
    v7 = v3;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_1D5522000, v2, OS_LOG_TYPE_DEFAULT, "<%p>: Canceling generated summary update observation for %{public}@", (uint8_t *)&v6, 0x16u);
  }

  return objc_msgSend(*(id *)(a1 + 48), "removeObserver:", *(_QWORD *)(a1 + 56));
}

- (void)_updateGeneratedSummary
{
  void *v3;
  void *v4;
  id v5;

  -[MessageListCellHelper cellView](self, "cellView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MessageListCellHelper _generatedSummaryString](self, "_generatedSummaryString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "hasGeneratedSummary") & 1) == 0 && v3)
  {
    objc_msgSend(v5, "setSummary:", v3);
    objc_msgSend(v5, "setHasGeneratedSummary:", 1);
    -[MessageListCellHelper parentView](self, "parentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mui_setNeedsLayout");

  }
}

- (void)setDisclosureEnabled:(BOOL)a3
{
  -[MessageListCellHelper setDisclosureEnabled:animated:](self, "setDisclosureEnabled:animated:", a3, 0);
}

- (void)setDisclosureEnabled:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  id v8;

  if (self->_disclosureEnabled != a3)
  {
    v4 = a4;
    v5 = a3;
    self->_disclosureEnabled = a3;
    -[MessageListCellHelper cellView](self, "cellView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDisclosureEnabled:animated:", v5, v4);

    -[MessageListCellHelper parentView](self, "parentView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mui_setNeedsLayout");

  }
}

- (void)prepareForReuse
{
  EMMessageListItem *messageListItem;
  void *v4;
  void *v5;

  messageListItem = self->_messageListItem;
  self->_messageListItem = 0;

  self->_style = 0;
  -[MessageListCellHelper cellView](self, "cellView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "prepareForReuse");

  -[MessageListCellHelper predictedMailbox](self, "predictedMailbox");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancel");

  -[MessageListCellHelper setPredictedMailbox:](self, "setPredictedMailbox:", 0);
  -[MessageListCellHelper setDisclosureEnabled:](self, "setDisclosureEnabled:", 0);
  -[MessageListCellHelper setExpanded:](self, "setExpanded:", 0);
  -[MessageListCellHelper setCompact:](self, "setCompact:", 0);
  -[MessageListCellHelper setSearchResult:](self, "setSearchResult:", 0);
  -[MessageListCellHelper setLocalMailboxSearchScope:](self, "setLocalMailboxSearchScope:", 0);
  -[MessageListCellHelper setVisible:](self, "setVisible:", 0);
  -[MessageListCellHelper setUpdateSummaryCancelationToken:](self, "setUpdateSummaryCancelationToken:", 0);
}

- (void)setApplicationProxy:(id)a3
{
  objc_storeStrong((id *)&self->_applicationProxy, a3);
}

- (UIView)contentView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_contentView);
}

- (BOOL)shouldAnnotateReplyOrForward
{
  return self->_shouldAnnotateReplyOrForward;
}

- (BOOL)shouldDisplayUnreadAndVIP
{
  return self->_shouldDisplayUnreadAndVIP;
}

- (BOOL)isInbox
{
  return self->_inbox;
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (void)setHighlighted:(BOOL)a3
{
  self->_highlighted = a3;
}

- (BOOL)isLocalMailboxSearchScope
{
  return self->_localMailboxSearchScope;
}

- (EFFuture)predictedMailbox
{
  return self->_predictedMailbox;
}

- (void)setPredictedMailbox:(id)a3
{
  objc_storeStrong((id *)&self->_predictedMailbox, a3);
}

- (EMNSUserDefaultsBoolObserver)automaticallySummarizeMessages
{
  return self->_automaticallySummarizeMessages;
}

- (void)setAutomaticallySummarizeMessages:(id)a3
{
  objc_storeStrong((id *)&self->_automaticallySummarizeMessages, a3);
}

- (EFAutoCancelationToken)updateSummaryCancelationToken
{
  return self->_updateSummaryCancelationToken;
}

- (void)setUpdateSummaryCancelationToken:(id)a3
{
  objc_storeStrong((id *)&self->_updateSummaryCancelationToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateSummaryCancelationToken, 0);
  objc_storeStrong((id *)&self->_automaticallySummarizeMessages, 0);
  objc_storeStrong((id *)&self->_predictedMailbox, 0);
  objc_storeStrong((id *)&self->_messageListItem, 0);
  objc_storeStrong((id *)&self->_cellView, 0);
  objc_destroyWeak((id *)&self->_contentView);
  objc_destroyWeak((id *)&self->_parentView);
  objc_storeStrong((id *)&self->_applicationProxy, 0);
}

@end
