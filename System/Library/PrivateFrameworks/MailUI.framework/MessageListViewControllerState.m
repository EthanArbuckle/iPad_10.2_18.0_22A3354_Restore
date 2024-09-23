@implementation MessageListViewControllerState

- (BOOL)isOutgoingMailbox
{
  return self->_isOutgoingMailbox;
}

- (BOOL)containsInbox
{
  return self->_containsInbox;
}

- (BOOL)shouldDisplayUnreadAndVIP
{
  return self->_shouldDisplayUnreadAndVIP;
}

- (BOOL)isSearch
{
  return self->_isSearch;
}

- (BOOL)containsFollowUpMailbox
{
  return self->_containsFollowUpMailbox;
}

- (BOOL)canShowReadLaterDate
{
  return self->_canShowReadLaterDate;
}

- (BOOL)isEditing
{
  return self->_isEditing;
}

- (BOOL)useSplitViewStyling
{
  return self->_useSplitViewStyling;
}

- (BOOL)isCompact
{
  return self->_isCompact;
}

- (void)updateWithMailboxes:(id)a3
{
  uint64_t v4;
  _BOOL8 v5;
  id v6;

  v6 = a3;
  -[MessageListViewControllerState setContainsInbox:](self, "setContainsInbox:", objc_msgSend(v6, "ef_any:", &__block_literal_global_9));
  -[MessageListViewControllerState setContainsSent:](self, "setContainsSent:", objc_msgSend(v6, "ef_any:", &__block_literal_global_3));
  if (-[MessageListViewControllerState containsInbox](self, "containsInbox"))
    v4 = 1;
  else
    v4 = objc_msgSend(v6, "ef_any:", &__block_literal_global_4);
  -[MessageListViewControllerState setContainsOnlyInboxScope:](self, "setContainsOnlyInboxScope:", v4);
  -[MessageListViewControllerState setContainsArchiveMailbox:](self, "setContainsArchiveMailbox:", objc_msgSend(v6, "ef_any:", &__block_literal_global_5));
  -[MessageListViewControllerState setContainsDraftsMailbox:](self, "setContainsDraftsMailbox:", objc_msgSend(v6, "ef_any:", &__block_literal_global_6));
  -[MessageListViewControllerState setContainsOutbox:](self, "setContainsOutbox:", objc_msgSend(v6, "ef_any:", &__block_literal_global_7));
  v5 = -[MessageListViewControllerState containsDraftsMailbox](self, "containsDraftsMailbox")
    || -[MessageListViewControllerState containsOutbox](self, "containsOutbox");
  -[MessageListViewControllerState setContainsDraftsOrOutbox:](self, "setContainsDraftsOrOutbox:", v5);
  -[MessageListViewControllerState setIsOutgoingMailbox:](self, "setIsOutgoingMailbox:", objc_msgSend(v6, "ef_all:", &__block_literal_global_8));
  -[MessageListViewControllerState setContainsTrashMailbox:](self, "setContainsTrashMailbox:", objc_msgSend(v6, "ef_any:", &__block_literal_global_9));
  -[MessageListViewControllerState setIsUnifiedMailbox:](self, "setIsUnifiedMailbox:", objc_msgSend(v6, "ef_all:", &__block_literal_global_10));
  -[MessageListViewControllerState setContainsSmartMailbox:](self, "setContainsSmartMailbox:", objc_msgSend(v6, "ef_any:", &__block_literal_global_11));
  -[MessageListViewControllerState setContainsReadLaterMailbox:](self, "setContainsReadLaterMailbox:", objc_msgSend(v6, "em_containsSmartMailboxType:", 9));
  -[MessageListViewControllerState setContainsSendLaterMailbox:](self, "setContainsSendLaterMailbox:", objc_msgSend(v6, "em_containsSmartMailboxType:", 11));
  -[MessageListViewControllerState setContainsFollowUpMailbox:](self, "setContainsFollowUpMailbox:", objc_msgSend(v6, "em_containsSmartMailboxType:", 10));

}

- (BOOL)containsDraftsMailbox
{
  return self->_containsDraftsMailbox;
}

- (BOOL)containsOutbox
{
  return self->_containsOutbox;
}

- (void)setIsUnifiedMailbox:(BOOL)a3
{
  self->_isUnifiedMailbox = a3;
}

- (void)setIsOutgoingMailbox:(BOOL)a3
{
  self->_isOutgoingMailbox = a3;
}

- (void)setContainsTrashMailbox:(BOOL)a3
{
  self->_containsTrashMailbox = a3;
}

- (void)setContainsSmartMailbox:(BOOL)a3
{
  self->_containsSmartMailbox = a3;
}

- (void)setContainsSent:(BOOL)a3
{
  self->_containsSent = a3;
}

- (void)setContainsSendLaterMailbox:(BOOL)a3
{
  self->_containsSendLaterMailbox = a3;
}

- (void)setContainsReadLaterMailbox:(BOOL)a3
{
  self->_containsReadLaterMailbox = a3;
}

- (void)setContainsOutbox:(BOOL)a3
{
  self->_containsOutbox = a3;
}

- (void)setContainsOnlyInboxScope:(BOOL)a3
{
  self->_containsOnlyInboxScope = a3;
}

- (void)setContainsInbox:(BOOL)a3
{
  self->_containsInbox = a3;
}

- (void)setContainsFollowUpMailbox:(BOOL)a3
{
  self->_containsFollowUpMailbox = a3;
}

- (void)setContainsDraftsOrOutbox:(BOOL)a3
{
  self->_containsDraftsOrOutbox = a3;
}

- (void)setContainsDraftsMailbox:(BOOL)a3
{
  self->_containsDraftsMailbox = a3;
}

- (void)setContainsArchiveMailbox:(BOOL)a3
{
  self->_containsArchiveMailbox = a3;
}

- (void)setCanShowReadLaterDate:(BOOL)a3
{
  self->_canShowReadLaterDate = a3;
}

- (BOOL)containsSmartMailbox
{
  return self->_containsSmartMailbox;
}

- (void)setIsSearch:(BOOL)a3
{
  self->_isSearch = a3;
}

- (void)setIsCompact:(BOOL)a3
{
  self->_isCompact = a3;
}

- (BOOL)containsSent
{
  return self->_containsSent;
}

uint64_t __54__MessageListViewControllerState_updateWithMailboxes___block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isOutgoingMailbox");
}

uint64_t __54__MessageListViewControllerState_updateWithMailboxes___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSentMailbox");
}

uint64_t __54__MessageListViewControllerState_updateWithMailboxes___block_invoke_10(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSmartMailbox");
}

- (void)setUseSplitViewStyling:(BOOL)a3
{
  self->_useSplitViewStyling = a3;
}

- (void)setShouldDisplayUnreadAndVIP:(BOOL)a3
{
  self->_shouldDisplayUnreadAndVIP = a3;
}

- (void)setDidRecordTailspin:(BOOL)a3
{
  self->_didRecordTailspin = a3;
}

- (void)setDidAlertOnBlankCell:(BOOL)a3
{
  self->_didAlertOnBlankCell = a3;
}

- (BOOL)isUnifiedMailbox
{
  return self->_isUnifiedMailbox;
}

- (BOOL)containsSendLaterMailbox
{
  return self->_containsSendLaterMailbox;
}

- (BOOL)containsReadLaterMailbox
{
  return self->_containsReadLaterMailbox;
}

- (BOOL)containsDraftsOrOutbox
{
  return self->_containsDraftsOrOutbox;
}

BOOL __54__MessageListViewControllerState_updateWithMailboxes___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 5;
}

BOOL __54__MessageListViewControllerState_updateWithMailboxes___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 7;
}

BOOL __54__MessageListViewControllerState_updateWithMailboxes___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 2;
}

BOOL __54__MessageListViewControllerState_updateWithMailboxes___block_invoke_8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 3;
}

BOOL __54__MessageListViewControllerState_updateWithMailboxes___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 6;
}

BOOL __54__MessageListViewControllerState_updateWithMailboxes___block_invoke_9(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "isSmartMailbox") && objc_msgSend(v2, "smartMailboxType") == 8;

  return v3;
}

- (NSArray)sortDescriptors
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  -[MessageListViewControllerState sortKeyPath](self, "sortKeyPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0D1E248], "sortDescriptorForKeyPath:ascending:", v3, -[MessageListViewControllerState isSortedAscending](self, "isSortedAscending"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[MessageListViewControllerState hasDateBasedSortOrder](self, "hasDateBasedSortOrder"))
    {
      -[MessageListViewControllerState _dateBasedSortDescriptor](self);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v6);

    }
  }
  else
  {
    -[MessageListViewControllerState _dateBasedSortDescriptor](self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSArray *)v5;
}

- (id)_dateBasedSortDescriptor
{
  id v1;
  id v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  id *v7;
  id *v8;
  id v9;

  v1 = a1;
  if (a1)
  {
    v2 = (id)*MEMORY[0x1E0D1DD68];
    v3 = objc_msgSend(v1, "containsReadLaterMailbox");
    v4 = objc_msgSend(v1, "containsSendLaterMailbox");
    v5 = objc_msgSend(v1, "containsSent");
    if ((v5 & 1) != 0 || (v4 & 1) != 0 || v3)
    {
      v7 = (id *)MEMORY[0x1E0D1DD60];
      v8 = (id *)MEMORY[0x1E0D1DE48];
      v6 = v5 ^ 1u;
      if (!v4)
        v8 = (id *)MEMORY[0x1E0D1DE28];
      if (!v5)
        v7 = v8;
      v9 = *v7;

      v2 = v9;
    }
    else
    {
      v6 = 0;
    }
    objc_msgSend(MEMORY[0x1E0D1E248], "sortDescriptorForKeyPath:ascending:", v2, v6);
    v1 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

uint64_t __54__MessageListViewControllerState_updateWithMailboxes___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  if (objc_msgSend(v2, "isSmartMailbox"))
  {
    objc_msgSend(v2, "mailboxScope");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  v4 = objc_msgSend(v3, "containsOnlyInboxType");

  return v4;
}

- (NSString)debugDescription
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  v21 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v20 = objc_opt_class();
  -[MessageListViewControllerState isCompact](self, "isCompact");
  NSStringFromBOOL();
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageListViewControllerState useSplitViewStyling](self, "useSplitViewStyling");
  NSStringFromBOOL();
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageListViewControllerState shouldDisplayUnreadAndVIP](self, "shouldDisplayUnreadAndVIP");
  NSStringFromBOOL();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageListViewControllerState canShowReadLaterDate](self, "canShowReadLaterDate");
  NSStringFromBOOL();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageListViewControllerState containsInbox](self, "containsInbox");
  NSStringFromBOOL();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageListViewControllerState containsSent](self, "containsSent");
  NSStringFromBOOL();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageListViewControllerState containsOnlyInboxScope](self, "containsOnlyInboxScope");
  NSStringFromBOOL();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageListViewControllerState containsArchiveMailbox](self, "containsArchiveMailbox");
  NSStringFromBOOL();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageListViewControllerState containsDraftsMailbox](self, "containsDraftsMailbox");
  NSStringFromBOOL();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageListViewControllerState containsOutbox](self, "containsOutbox");
  NSStringFromBOOL();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageListViewControllerState containsDraftsOrOutbox](self, "containsDraftsOrOutbox");
  NSStringFromBOOL();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageListViewControllerState isOutgoingMailbox](self, "isOutgoingMailbox");
  NSStringFromBOOL();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageListViewControllerState containsTrashMailbox](self, "containsTrashMailbox");
  NSStringFromBOOL();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageListViewControllerState isUnifiedMailbox](self, "isUnifiedMailbox");
  NSStringFromBOOL();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageListViewControllerState containsSmartMailbox](self, "containsSmartMailbox");
  NSStringFromBOOL();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageListViewControllerState containsReadLaterMailbox](self, "containsReadLaterMailbox");
  NSStringFromBOOL();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageListViewControllerState containsSendLaterMailbox](self, "containsSendLaterMailbox");
  NSStringFromBOOL();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageListViewControllerState containsFollowUpMailbox](self, "containsFollowUpMailbox");
  NSStringFromBOOL();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageListViewControllerState isEditing](self, "isEditing");
  NSStringFromBOOL();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageListViewControllerState didAlertOnBlankCell](self, "didAlertOnBlankCell");
  NSStringFromBOOL();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageListViewControllerState didRecordTailspin](self, "didRecordTailspin");
  NSStringFromBOOL();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageListViewControllerState isSearch](self, "isSearch");
  NSStringFromBOOL();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageListViewControllerState sortDescriptors](self, "sortDescriptors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "initWithFormat:", CFSTR("<%@: %p> isCompact=%@, useSplitViewStyling=%@, shouldDisplayUnreadAndVIP=%@, canShowReadLaterDate=%@, containsInbox=%@, containsSent=%@, containsOnlyInboxScope=%@, containsArchiveMailbox=%@, containsDraftsMailbox=%@, containsOutbox=%@, containsDraftsOrOutbox=%@, isOutgoingMailbox=%@, containsTrashMailbox=%@, isUnifiedMailbox=%@, containsSmartMailbox=%@, containsReadLaterMailbox=%@, containsSendLaterMailbox=%@, containsFollowUpMailbox=%@, isEditing=%@, didAlertOnBlankCell=%@, didRecordTailspin=%@, isSearch=%@, sortDescriptors=%@"), v20, self, v33, v32, v31, v30, v29, v27, v28, v19, v26, v25, v24, v23, v18, v16,
                  v17,
                  v15,
                  v14,
                  v3,
                  v4,
                  v5,
                  v6,
                  v7,
                  v8);

  -[MessageListViewControllerState sortKeyPath](self, "sortKeyPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageListViewControllerState isSortedAscending](self, "isSortedAscending");
  NSStringFromBOOL();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageListViewControllerState hasDateBasedSortOrder](self, "hasDateBasedSortOrder");
  NSStringFromBOOL();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "appendFormat:", CFSTR(", sortKeyPath=%@, isSortedAscending=%@, hasDateBasedSortOrder=%@"), v9, v10, v11);

  v12 = (void *)objc_msgSend(v22, "copy");
  return (NSString *)v12;
}

- (NSString)ef_publicDescription
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = objc_opt_class();
  -[MessageListViewControllerState isCompact](self, "isCompact");
  NSStringFromBOOL();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageListViewControllerState useSplitViewStyling](self, "useSplitViewStyling");
  NSStringFromBOOL();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageListViewControllerState isEditing](self, "isEditing");
  NSStringFromBOOL();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageListViewControllerState isSearch](self, "isSearch");
  NSStringFromBOOL();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p> isCompact=%@, useSplitViewStyling=%@, isEditing=%@, isSearch=%@"), v4, self, v5, v6, v7, v8);

  v10 = (void *)objc_msgSend(v9, "copy");
  return (NSString *)v10;
}

- (BOOL)containsOnlyInboxScope
{
  return self->_containsOnlyInboxScope;
}

- (BOOL)containsArchiveMailbox
{
  return self->_containsArchiveMailbox;
}

- (BOOL)containsTrashMailbox
{
  return self->_containsTrashMailbox;
}

- (void)setIsEditing:(BOOL)a3
{
  self->_isEditing = a3;
}

- (BOOL)didAlertOnBlankCell
{
  return self->_didAlertOnBlankCell;
}

- (BOOL)didRecordTailspin
{
  return self->_didRecordTailspin;
}

- (NSString)sortKeyPath
{
  return self->_sortKeyPath;
}

- (void)setSortKeyPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isSortedAscending
{
  return self->_isSortedAscending;
}

- (void)setIsSortedAscending:(BOOL)a3
{
  self->_isSortedAscending = a3;
}

- (BOOL)hasDateBasedSortOrder
{
  return self->_hasDateBasedSortOrder;
}

- (void)setHasDateBasedSortOrder:(BOOL)a3
{
  self->_hasDateBasedSortOrder = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortKeyPath, 0);
}

@end
