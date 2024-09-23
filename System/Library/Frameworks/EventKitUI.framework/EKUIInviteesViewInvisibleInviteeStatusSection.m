@implementation EKUIInviteesViewInvisibleInviteeStatusSection

- (id)debugTitle
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)headerTitle
{
  return 0;
}

- (BOOL)sectionShouldBeShown
{
  return -[EKUIInviteesViewInvisibleInviteeStatusSection numberOfRows](self, "numberOfRows") != 0;
}

- (unint64_t)numberOfRows
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[EKUIInviteesViewInvisibleInviteeStatusSection participants](self, "participants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[EKUIInviteesViewInvisibleInviteeStatusSection participants](self, "participants");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)cellForIndexPath:(id)a3 inTableView:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  EKUIInviteesViewInviteesCell *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "row");
  -[EKUIInviteesViewInvisibleInviteeStatusSection participants](self, "participants");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  if (-[EKUIInviteesViewInvisibleInviteeStatusSection _isValidRow:](self, "_isValidRow:", v8))
  {
    -[EKUIInviteesViewInvisibleInviteeStatusSection cachedCellReuseIdentifier](self, "cachedCellReuseIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v11, v6);
    v12 = (EKUIInviteesViewInviteesCell *)objc_claimAutoreleasedReturnValue();

    -[EKUIInviteesViewInviteesCell setHideStatus:](v12, "setHideStatus:", 1);
    objc_msgSend(v9, "objectAtIndex:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewInviteesCell updateWithParticipantForSorting:](v12, "updateWithParticipantForSorting:", v13);

  }
  else
  {
    v14 = (void *)kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
    {
      v15 = (void *)MEMORY[0x1E0CB37E8];
      v16 = v14;
      objc_msgSend(v15, "numberWithInteger:", v8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412546;
      v21 = v17;
      v22 = 2112;
      v23 = v18;
      _os_log_impl(&dword_1AF84D000, v16, OS_LOG_TYPE_ERROR, "A cell was requested for a nonexistent row.  Giving back a fresh cell.  Row: [%@].  Number of participants: [%@]", (uint8_t *)&v20, 0x16u);

    }
    v12 = objc_alloc_init(EKUIInviteesViewInviteesCell);
    -[EKUIInviteesViewInviteesCell setHideStatus:](v12, "setHideStatus:", 1);
  }

  return v12;
}

- (void)reloadAndRegisterReusableCellsWithTableView:(id)a3
{
  id v4;
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  v6 = objc_alloc(MEMORY[0x1E0CB3940]);
  NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[EKUIInviteesViewInvisibleInviteeStatusSection reuseIdentifierVersion](self, "reuseIdentifierVersion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("%@-%@"), v7, v8);
  -[EKUIInviteesViewInvisibleInviteeStatusSection setCachedCellReuseIdentifier:](self, "setCachedCellReuseIdentifier:", v9);

  -[EKUIInviteesViewInvisibleInviteeStatusSection cachedCellReuseIdentifier](self, "cachedCellReuseIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", v5, v10);

  -[EKUIInviteesViewInvisibleInviteeStatusSection setReuseIdentifierVersion:](self, "setReuseIdentifierVersion:", -[EKUIInviteesViewInvisibleInviteeStatusSection reuseIdentifierVersion](self, "reuseIdentifierVersion") + 1);
}

- (BOOL)canSelectRow:(id)a3
{
  return 1;
}

- (void)selectRow:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD);
  NSObject *v11;
  NSObject *v12;
  const char *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "row");
  if (-[EKUIInviteesViewInvisibleInviteeStatusSection _isValidRow:](self, "_isValidRow:", v5))
  {
    -[EKUIInviteesViewInvisibleInviteeStatusSection participants](self, "participants");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "participant");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[EKUIInviteesViewInvisibleInviteeStatusSection participantTapped](self, "participantTapped");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        -[EKUIInviteesViewInvisibleInviteeStatusSection participantTapped](self, "participantTapped");
        v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v10)[2](v10, v8);

LABEL_12:
        goto LABEL_13;
      }
      v12 = kEKUILogInviteesHandle;
      if (!os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
        goto LABEL_12;
      v14 = 138412290;
      v15 = v4;
      v13 = "No 'participant tapped' callback defined.  Will not select row.  Index path: [%@]";
    }
    else
    {
      v12 = kEKUILogInviteesHandle;
      if (!os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
        goto LABEL_12;
      v14 = 138412290;
      v15 = v4;
      v13 = "Cannot find participant.  Will not select row.  Index path: [%@]";
    }
    _os_log_impl(&dword_1AF84D000, v12, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v14, 0xCu);
    goto LABEL_12;
  }
  v11 = kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
  {
    v14 = 138412290;
    v15 = v4;
    _os_log_impl(&dword_1AF84D000, v11, OS_LOG_TYPE_ERROR, "Cannot find row to select.  Will not select row.  Index path: [%@]", (uint8_t *)&v14, 0xCu);
  }
LABEL_13:

}

- (BOOL)canEditRow:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (-[EKUIInviteesViewInvisibleInviteeStatusSection editable](self, "editable"))
    v5 = -[EKUIInviteesViewInvisibleInviteeStatusSection _isValidRow:](self, "_isValidRow:", objc_msgSend(v4, "row"));
  else
    v5 = 0;

  return v5;
}

- (int64_t)editingStyleForRow:(id)a3
{
  return 1;
}

- (id)titleForDeleteConfirmationButtonForRow:(id)a3
{
  void *v3;
  void *v4;

  EventKitUIBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Remove invitee - invisible invitee status section"), CFSTR("Remove"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)commitEditingStyle:(int64_t)a3 forRow:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD *v14;
  void (*v15)(_QWORD *, id, id, _QWORD *);
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  EKUIInviteesViewInvisibleInviteeStatusSection *v25;
  uint64_t v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = objc_msgSend(v6, "row");
  if (a3 == 1)
  {
    v8 = v7;
    if (-[EKUIInviteesViewInvisibleInviteeStatusSection _isValidRow:](self, "_isValidRow:", v7))
    {
      -[EKUIInviteesViewInvisibleInviteeStatusSection participantRemoved](self, "participantRemoved");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        -[EKUIInviteesViewInvisibleInviteeStatusSection participants](self, "participants");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndex:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "participant");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = kEKUILogInviteesHandle;
        if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v28 = v12;
          v29 = 2112;
          v30 = v6;
          _os_log_impl(&dword_1AF84D000, v13, OS_LOG_TYPE_DEBUG, "Invoking participant removed callback with participant [%@] and index path [%@]", buf, 0x16u);
        }
        -[EKUIInviteesViewInvisibleInviteeStatusSection participantRemoved](self, "participantRemoved");
        v14 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __75__EKUIInviteesViewInvisibleInviteeStatusSection_commitEditingStyle_forRow___block_invoke;
        v22[3] = &unk_1E6018918;
        v23 = v12;
        v24 = v6;
        v25 = self;
        v26 = v8;
        v15 = (void (*)(_QWORD *, id, id, _QWORD *))v14[2];
        v16 = v12;
        v15(v14, v16, v24, v22);

      }
    }
    else
    {
      v21 = kEKUILogInviteesHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v6;
        _os_log_impl(&dword_1AF84D000, v21, OS_LOG_TYPE_ERROR, "Received commit for nonexistent row: [%@]", buf, 0xCu);
      }
    }
  }
  else
  {
    v17 = (void *)kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
    {
      v18 = (void *)MEMORY[0x1E0CB37E8];
      v19 = v17;
      objc_msgSend(v18, "numberWithInteger:", a3);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v28 = v20;
      _os_log_impl(&dword_1AF84D000, v19, OS_LOG_TYPE_ERROR, "Received commit for unrecognized editing style: [%@]", buf, 0xCu);

    }
  }

}

void __75__EKUIInviteesViewInvisibleInviteeStatusSection_commitEditingStyle_forRow___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1AF84D000, v2, OS_LOG_TYPE_DEBUG, "Removing participant [%@] at index path [%@] from EKUIInviteesViewInvisibleInviteeStatusSection", (uint8_t *)&v6, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 48), "participants");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectAtIndex:", *(_QWORD *)(a1 + 56));

}

- (double)estimatedHeightForRow:(id)a3
{
  return 44.0;
}

- (id)actionsForRow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[EKUIInviteesViewSectionCommon deleteRowAction:forRow:](EKUIInviteesViewSectionCommon, "deleteRowAction:forRow:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIInviteesViewInvisibleInviteeStatusSection participants](self, "participants");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v4, "row"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[EKUIInviteesViewInvisibleInviteeStatusSection participantSetRole](self, "participantSetRole");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB36B8];
  v10 = objc_msgSend(v4, "section");

  objc_msgSend(v9, "indexSetWithIndex:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKUIInviteesViewSectionCommon setRoleRowActionWithParticipant:withSetRoleBlock:forSections:](EKUIInviteesViewSectionCommon, "setRoleRowActionWithParticipant:withSetRoleBlock:forSections:", v7, v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = v5;
  v15[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)supportsContextMenuForIndexPath:(id)a3
{
  return 1;
}

- (id)contextMenuDataForIndexPath:(id)a3 interaction:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  EKUIInviteeContextMenuData *v11;
  void *v12;
  EKUIInviteeContextMenuData *v13;

  v6 = a4;
  v7 = a3;
  -[EKUIInviteesViewInvisibleInviteeStatusSection participants](self, "participants");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "participant");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = [EKUIInviteeContextMenuData alloc];
  -[EKUIInviteesViewInvisibleInviteeStatusSection participantSetRole](self, "participantSetRole");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[EKUIInviteeContextMenuData initWithDefaultActionsForSection:indexPath:participant:interaction:participantSetRole:](v11, "initWithDefaultActionsForSection:indexPath:participant:interaction:participantSetRole:", self, v7, v10, v6, v12);

  return v13;
}

- (void)updateWithEvent:(id)a3 editable:(BOOL)a4 fromDetail:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v6;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  EKUIInviteesViewInvisibleInviteeStatusSection *v29;
  uint64_t v30;

  v5 = a5;
  v6 = a4;
  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  -[EKUIInviteesViewInvisibleInviteeStatusSection setEvent:](self, "setEvent:", v8);
  if (CanSeeAttendeeStatuses((uint64_t)v8))
  {
    v9 = kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v29 = self;
      _os_log_impl(&dword_1AF84D000, v9, OS_LOG_TYPE_DEBUG, "Can see attendee statuses.  Will not analyze attendees for section: [%@]", buf, 0xCu);
    }
    v10 = 0;
  }
  else
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v8, "organizer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewInvisibleInviteeStatusSection event](self, "event");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "isExternallyOrganizedInvitation") & 1) == 0
      && !-[EKUIInviteesViewInvisibleInviteeStatusSection editable](self, "editable"))
    {
      v5 = 0;
    }

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v22 = v8;
    objc_msgSend(v8, "attendees");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v24 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          if (objc_msgSend(v19, "participantType") != 2
            && (objc_msgSend(v19, "isEqualToParticipant:", v12) & 1) == 0
            && (!v5 || (objc_msgSend(v19, "isNew") & 1) == 0))
          {
            objc_msgSend(MEMORY[0x1E0CAA0E8], "participantForSortingWithEKParticipant:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "addObject:", v20);

          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v16);
    }

    objc_msgSend(v11, "sortedArrayUsingComparator:", &__block_literal_global_27);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v22;
    v6 = v6;
  }
  -[EKUIInviteesViewInvisibleInviteeStatusSection setEditable:](self, "setEditable:", v6);
  v21 = (void *)objc_msgSend(v10, "mutableCopy");
  -[EKUIInviteesViewInvisibleInviteeStatusSection setParticipants:](self, "setParticipants:", v21);

}

uint64_t __85__EKUIInviteesViewInvisibleInviteeStatusSection_updateWithEvent_editable_fromDetail___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (BOOL)_isValidRow:(int64_t)a3
{
  return (a3 & 0x8000000000000000) == 0
      && -[EKUIInviteesViewInvisibleInviteeStatusSection numberOfRows](self, "numberOfRows") > a3;
}

- (id)participantTapped
{
  return self->_participantTapped;
}

- (void)setParticipantTapped:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)participantRemoved
{
  return self->_participantRemoved;
}

- (void)setParticipantRemoved:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)participantSetRole
{
  return self->_participantSetRole;
}

- (void)setParticipantSetRole:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSMutableArray)participants
{
  return self->_participants;
}

- (void)setParticipants:(id)a3
{
  objc_storeStrong((id *)&self->_participants, a3);
}

- (EKEvent)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
  objc_storeStrong((id *)&self->_event, a3);
}

- (NSString)cachedCellReuseIdentifier
{
  return self->_cachedCellReuseIdentifier;
}

- (void)setCachedCellReuseIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_cachedCellReuseIdentifier, a3);
}

- (unint64_t)reuseIdentifierVersion
{
  return self->_reuseIdentifierVersion;
}

- (void)setReuseIdentifierVersion:(unint64_t)a3
{
  self->_reuseIdentifierVersion = a3;
}

- (id)tableViewCellHook
{
  return self->_tableViewCellHook;
}

- (void)setTableViewCellHook:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)editable
{
  return self->_editable;
}

- (void)setEditable:(BOOL)a3
{
  self->_editable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_tableViewCellHook, 0);
  objc_storeStrong((id *)&self->_cachedCellReuseIdentifier, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong(&self->_participantSetRole, 0);
  objc_storeStrong(&self->_participantRemoved, 0);
  objc_storeStrong(&self->_participantTapped, 0);
}

@end
