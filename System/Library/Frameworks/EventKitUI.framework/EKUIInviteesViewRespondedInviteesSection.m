@implementation EKUIInviteesViewRespondedInviteesSection

- (EKUIInviteesViewRespondedInviteesSection)initWithResponseType:(int)a3
{
  EKUIInviteesViewRespondedInviteesSection *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKUIInviteesViewRespondedInviteesSection;
  result = -[EKUIInviteesViewRespondedInviteesSection init](&v5, sel_init);
  if (result)
    result->_responseType = a3;
  return result;
}

- (id)debugTitle
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)headerTitle
{
  int v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;

  v2 = -[EKUIInviteesViewRespondedInviteesSection responseType](self, "responseType");
  if (v2 == 2)
  {
    EventKitUIBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("Header_Maybe");
    v6 = CFSTR("Maybe");
  }
  else if (v2 == 1)
  {
    EventKitUIBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("Header_Declined");
    v6 = CFSTR("Declined");
  }
  else if (v2)
  {
    EventKitUIBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("Header_Responded");
    v6 = CFSTR("Responded");
  }
  else
  {
    EventKitUIBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("Header_Accepted");
    v6 = CFSTR("Accepted");
  }
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)sectionShouldBeShown
{
  return -[EKUIInviteesViewRespondedInviteesSection numberOfRows](self, "numberOfRows") != 0;
}

- (unint64_t)numberOfRows
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[EKUIInviteesViewRespondedInviteesSection participants](self, "participants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[EKUIInviteesViewRespondedInviteesSection participants](self, "participants");
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
  EKUIInviteesViewInviteesCell *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "row");
  if (-[EKUIInviteesViewRespondedInviteesSection _isValidRow:](self, "_isValidRow:", v8))
  {
    -[EKUIInviteesViewRespondedInviteesSection cachedCellReuseIdentifier](self, "cachedCellReuseIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v9, v6);
    v10 = (EKUIInviteesViewInviteesCell *)objc_claimAutoreleasedReturnValue();

    -[EKUIInviteesViewInviteesCell setHideStatus:](v10, "setHideStatus:", 0);
    -[EKUIInviteesViewRespondedInviteesSection participants](self, "participants");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndex:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[EKUIInviteesViewInviteesCell updateWithParticipantForSorting:](v10, "updateWithParticipantForSorting:", v12);
  }
  else
  {
    v13 = (void *)kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
    {
      v14 = (void *)MEMORY[0x1E0CB37E8];
      v15 = v13;
      objc_msgSend(v14, "numberWithInteger:", v8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[EKUIInviteesViewRespondedInviteesSection numberOfRows](self, "numberOfRows"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412546;
      v20 = v16;
      v21 = 2112;
      v22 = v17;
      _os_log_impl(&dword_1AF84D000, v15, OS_LOG_TYPE_ERROR, "A cell was requested for a nonexistent row.  Giving back a fresh cell.  Row: [%@].  Number of rows: [%@]", (uint8_t *)&v19, 0x16u);

    }
    v10 = objc_alloc_init(EKUIInviteesViewInviteesCell);
  }

  return v10;
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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[EKUIInviteesViewRespondedInviteesSection reuseIdentifierVersion](self, "reuseIdentifierVersion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("%@-%@"), v7, v8);
  -[EKUIInviteesViewRespondedInviteesSection setCachedCellReuseIdentifier:](self, "setCachedCellReuseIdentifier:", v9);

  -[EKUIInviteesViewRespondedInviteesSection cachedCellReuseIdentifier](self, "cachedCellReuseIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", v5, v10);

  -[EKUIInviteesViewRespondedInviteesSection setReuseIdentifierVersion:](self, "setReuseIdentifierVersion:", -[EKUIInviteesViewRespondedInviteesSection reuseIdentifierVersion](self, "reuseIdentifierVersion") + 1);
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
  uint64_t v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v16;
  int v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "row");
  if (-[EKUIInviteesViewRespondedInviteesSection _isValidRow:](self, "_isValidRow:", v5))
  {
    -[EKUIInviteesViewRespondedInviteesSection participants](self, "participants");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "participant");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[EKUIInviteesViewRespondedInviteesSection participantTapped](self, "participantTapped");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        -[EKUIInviteesViewRespondedInviteesSection participantTapped](self, "participantTapped");
        v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v10)[2](v10, v8);

LABEL_12:
        goto LABEL_13;
      }
      v16 = kEKUILogInviteesHandle;
      if (!os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
        goto LABEL_12;
      v17 = 138412290;
      v18 = v4;
      v13 = "No 'participant tapped' callback defined.  Will not select row.  Index path: [%@]";
      v14 = v16;
      v15 = 12;
    }
    else
    {
      v12 = kEKUILogInviteesHandle;
      if (!os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
        goto LABEL_12;
      v17 = 138412546;
      v18 = v4;
      v19 = 2112;
      v20 = v7;
      v13 = "Cannot find participant.  Index path: [%@]  Participant for sorting: [%@]";
      v14 = v12;
      v15 = 22;
    }
    _os_log_impl(&dword_1AF84D000, v14, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v17, v15);
    goto LABEL_12;
  }
  v11 = kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
  {
    v17 = 138412290;
    v18 = v4;
    _os_log_impl(&dword_1AF84D000, v11, OS_LOG_TYPE_ERROR, "Cannot find row to select.  Index path: [%@]", (uint8_t *)&v17, 0xCu);
  }
LABEL_13:

}

- (BOOL)canEditRow:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (-[EKUIInviteesViewRespondedInviteesSection editable](self, "editable"))
    v5 = -[EKUIInviteesViewRespondedInviteesSection _isValidRow:](self, "_isValidRow:", objc_msgSend(v4, "row"));
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
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Remove invitee - responded invitees section"), CFSTR("Remove"), 0);
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
  const char *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  EKUIInviteesViewRespondedInviteesSection *v26;
  uint64_t v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = objc_msgSend(v6, "row");
  if (a3 == 1)
  {
    v8 = v7;
    if (-[EKUIInviteesViewRespondedInviteesSection _isValidRow:](self, "_isValidRow:", v7))
    {
      -[EKUIInviteesViewRespondedInviteesSection participantRemoved](self, "participantRemoved");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        -[EKUIInviteesViewRespondedInviteesSection participants](self, "participants");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndex:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "participant");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = kEKUILogInviteesHandle;
        if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v29 = v12;
          v30 = 2112;
          v31 = v6;
          _os_log_impl(&dword_1AF84D000, v13, OS_LOG_TYPE_DEBUG, "Invoking participant removed callback with participant [%@] and index path [%@]", buf, 0x16u);
        }
        -[EKUIInviteesViewRespondedInviteesSection participantRemoved](self, "participantRemoved");
        v14 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __70__EKUIInviteesViewRespondedInviteesSection_commitEditingStyle_forRow___block_invoke;
        v23[3] = &unk_1E6018918;
        v24 = v12;
        v25 = v6;
        v26 = self;
        v27 = v8;
        v15 = (void (*)(_QWORD *, id, id, _QWORD *))v14[2];
        v16 = v12;
        v15(v14, v16, v25, v23);

        goto LABEL_14;
      }
      v21 = kEKUILogInviteesHandle;
      if (!os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
        goto LABEL_14;
      *(_DWORD *)buf = 138412290;
      v29 = v6;
      v22 = "No 'participant removed' callback defined.  Will not remove participant.  Index path: [%@]";
    }
    else
    {
      v21 = kEKUILogInviteesHandle;
      if (!os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
        goto LABEL_14;
      *(_DWORD *)buf = 138412290;
      v29 = v6;
      v22 = "Received commit for nonexistent row: [%@]";
    }
    _os_log_impl(&dword_1AF84D000, v21, OS_LOG_TYPE_ERROR, v22, buf, 0xCu);
    goto LABEL_14;
  }
  v17 = (void *)kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
  {
    v18 = (void *)MEMORY[0x1E0CB37E8];
    v19 = v17;
    objc_msgSend(v18, "numberWithInteger:", a3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v29 = v20;
    _os_log_impl(&dword_1AF84D000, v19, OS_LOG_TYPE_ERROR, "Received commit for unrecognized editing style: [%@]", buf, 0xCu);

  }
LABEL_14:

}

void __70__EKUIInviteesViewRespondedInviteesSection_commitEditingStyle_forRow___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_1AF84D000, v2, OS_LOG_TYPE_DEBUG, "Removing participant [%@] at index path [%@] from EKUIInviteesViewRespondedInviteesSection", (uint8_t *)&v6, 0x16u);
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
  -[EKUIInviteesViewRespondedInviteesSection participants](self, "participants");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v4, "row"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[EKUIInviteesViewRespondedInviteesSection participantSetRole](self, "participantSetRole");
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
  -[EKUIInviteesViewRespondedInviteesSection participants](self, "participants");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "participant");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = [EKUIInviteeContextMenuData alloc];
  -[EKUIInviteesViewRespondedInviteesSection participantSetRole](self, "participantSetRole");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[EKUIInviteeContextMenuData initWithDefaultActionsForSection:indexPath:participant:interaction:participantSetRole:](v11, "initWithDefaultActionsForSection:indexPath:participant:interaction:participantSetRole:", self, v7, v10, v6, v12);

  return v13;
}

- (void)updateWithEvent:(id)a3 editable:(BOOL)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  unsigned int v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[128];
  uint8_t buf[4];
  EKUIInviteesViewRespondedInviteesSection *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v4 = a4;
  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[EKUIInviteesViewRespondedInviteesSection setEvent:](self, "setEvent:", v6);
  if ((CanSeeAttendeeStatuses((uint64_t)v6) & 1) == 0)
  {
    v11 = kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v38 = self;
      _os_log_impl(&dword_1AF84D000, v11, OS_LOG_TYPE_DEBUG, "Cannot see attendee statuses.  Will not analyze attendees for section: [%@]", buf, 0xCu);
    }
    goto LABEL_8;
  }
  if ((objc_msgSend(v6, "isStartDateDirty") & 1) != 0 || objc_msgSend(v6, "isEndDateDirty"))
  {
    v7 = (void *)kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
    {
      v8 = v7;
      objc_msgSend(v6, "isStartDateDirty");
      CalBooleanAsString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "isEndDateDirty");
      CalBooleanAsString();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v38 = self;
      v39 = 2112;
      v40 = v9;
      v41 = 2112;
      v42 = v10;
      _os_log_impl(&dword_1AF84D000, v8, OS_LOG_TYPE_DEBUG, "This event has a dirty date, thus invitee responses are invalid for this time.  Will not show section: [%@].  Start date is dirty: [%@].  End date is dirty: [%@]", buf, 0x20u);

    }
LABEL_8:
    v12 = 0;
    goto LABEL_9;
  }
  v29 = v4;
  v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v6, "organizer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0CAA0B0];
  objc_msgSend(v6, "attendees");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "eventStore");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectsIDsExistingInStoreFromObjects:eventStore:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = v6;
  objc_msgSend(v6, "attendees");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v33 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        if (objc_msgSend(v24, "participantType") != 2 && (objc_msgSend(v24, "isEqualToParticipant:", v14) & 1) == 0)
        {
          if (EKUIAttendeeUtils_AttendeeHasResponded(v24))
          {
            objc_msgSend(v24, "CADObjectID");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v18, "containsObject:", v25);

            if (v26)
            {
              v27 = objc_msgSend(v24, "participantStatus");
              if ((-[EKUIInviteesViewRespondedInviteesSection responseType](self, "responseType") || v27 == 2)
                && (-[EKUIInviteesViewRespondedInviteesSection responseType](self, "responseType") != 1 || v27 == 3)
                && (-[EKUIInviteesViewRespondedInviteesSection responseType](self, "responseType") != 2
                 || (v27 & 0xFFFFFFFFFFFFFFFELL) != 2))
              {
                objc_msgSend(MEMORY[0x1E0CAA0E8], "participantForSortingWithEKParticipant:", v24);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "addObject:", v28);

              }
            }
          }
        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v21);
  }

  objc_msgSend(v31, "sortedArrayUsingComparator:", &__block_literal_global_3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v30;
  v4 = v29;
LABEL_9:
  -[EKUIInviteesViewRespondedInviteesSection setEditable:](self, "setEditable:", v4);
  v13 = (void *)objc_msgSend(v12, "mutableCopy");
  -[EKUIInviteesViewRespondedInviteesSection setParticipants:](self, "setParticipants:", v13);

}

uint64_t __69__EKUIInviteesViewRespondedInviteesSection_updateWithEvent_editable___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (BOOL)_isValidRow:(int64_t)a3
{
  return (a3 & 0x8000000000000000) == 0
      && -[EKUIInviteesViewRespondedInviteesSection numberOfRows](self, "numberOfRows") > a3;
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

- (int)responseType
{
  return self->_responseType;
}

- (void)setResponseType:(int)a3
{
  self->_responseType = a3;
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
