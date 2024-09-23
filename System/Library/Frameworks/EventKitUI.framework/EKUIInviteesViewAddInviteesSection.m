@implementation EKUIInviteesViewAddInviteesSection

- (EKUIInviteesViewAddInviteesSection)init
{
  EKUIInviteesViewAddInviteesSection *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  objc_super v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)EKUIInviteesViewAddInviteesSection;
  v2 = -[EKUIInviteesViewAddInviteesSection init](&v14, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[EKUIInviteesViewAddInviteesSection setParticipantAddressesToAvailabilityType:](v2, "setParticipantAddressesToAvailabilityType:", v3);

    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[EKUIInviteesViewAddInviteesSection setParticipantAddressesToParticipantIndex:](v2, "setParticipantAddressesToParticipantIndex:", v4);

    v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    -[EKUIInviteesViewAddInviteesSection setParticipantAddressesForInFlightAvailabilityOperations:](v2, "setParticipantAddressesForInFlightAvailabilityOperations:", v5);

    v6 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("com.apple.mobilecal.%@.availability"), v8);
    objc_msgSend(v6, "setName:", v9);

    -[EKUIInviteesViewAddInviteesSection setAvailabilityRequestsQueue:](v2, "setAvailabilityRequestsQueue:", v6);
    v10 = (void *)kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
    {
      v11 = v10;
      objc_msgSend(v6, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v16 = v12;
      _os_log_impl(&dword_1AF84D000, v11, OS_LOG_TYPE_DEBUG, "Created availability queue named [%@]", buf, 0xCu);

    }
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[EKUIInviteesViewAddInviteesSection availabilityRequestsQueue](self, "availabilityRequestsQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelAllOperations");

  v4.receiver = self;
  v4.super_class = (Class)EKUIInviteesViewAddInviteesSection;
  -[EKUIInviteesViewAddInviteesSection dealloc](&v4, sel_dealloc);
}

- (id)debugTitle
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)headerTitle
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  -[EKUIInviteesViewAddInviteesSection participants](self, "participants");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    EventKitUIBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Pending"), &stru_1E601DFA8, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)sectionShouldBeShown
{
  void *v2;
  char v3;

  -[EKUIInviteesViewAddInviteesSection event](self, "event");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowsAttendeesModifications");

  return v3;
}

- (unint64_t)numberOfRows
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[EKUIInviteesViewAddInviteesSection participants](self, "participants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return 1;
  -[EKUIInviteesViewAddInviteesSection participants](self, "participants");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") + 1;

  return v6;
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
  NSObject *v13;
  void *v14;
  void *v15;
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
  if (-[EKUIInviteesViewAddInviteesSection _isValidRow:](self, "_isValidRow:", v8))
  {
    if (-[EKUIInviteesViewAddInviteesSection _isAddInviteesRow:](self, "_isAddInviteesRow:", v8))
    {
      -[EKUIInviteesViewAddInviteesSection cachedAddInviteeCellReuseIdentifier](self, "cachedAddInviteeCellReuseIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v9, v6);
      v10 = (EKUIInviteesViewInviteesCell *)objc_claimAutoreleasedReturnValue();

      -[EKUIInviteesViewInviteesCell setSeparatorInset:](v10, "setSeparatorInset:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    }
    else
    {
      -[EKUIInviteesViewAddInviteesSection cachedInviteeCellReuseIdentifier](self, "cachedInviteeCellReuseIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v16, v6);
      v10 = (EKUIInviteesViewInviteesCell *)objc_claimAutoreleasedReturnValue();

      -[EKUIInviteesViewAddInviteesSection _updateCell:forParticipantAtIndex:animated:](self, "_updateCell:forParticipantAtIndex:animated:", v10, objc_msgSend(v6, "row"), 0);
    }
  }
  else
  {
    v11 = (void *)kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
    {
      v12 = (void *)MEMORY[0x1E0CB37E8];
      v13 = v11;
      objc_msgSend(v12, "numberWithInteger:", v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[EKUIInviteesViewAddInviteesSection numberOfRows](self, "numberOfRows"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412546;
      v20 = v14;
      v21 = 2112;
      v22 = v15;
      _os_log_impl(&dword_1AF84D000, v13, OS_LOG_TYPE_ERROR, "A cell was requested for a nonexistent row.  Giving back a fresh cell.  Row: [%@].  Number of rows: [%@]", (uint8_t *)&v19, 0x16u);

    }
    v10 = objc_alloc_init(EKUIInviteesViewInviteesCell);
  }
  if (EKUICatalyst())
  {
    objc_msgSend(v7, "backgroundColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewInviteesCell setBackgroundColor:](v10, "setBackgroundColor:", v17);

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
  objc_class *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  v6 = objc_alloc(MEMORY[0x1E0CB3940]);
  NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[EKUIInviteesViewAddInviteesSection reuseIdentifierVersion](self, "reuseIdentifierVersion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("%@-%@"), v7, v8);
  -[EKUIInviteesViewAddInviteesSection setCachedInviteeCellReuseIdentifier:](self, "setCachedInviteeCellReuseIdentifier:", v9);

  -[EKUIInviteesViewAddInviteesSection cachedInviteeCellReuseIdentifier](self, "cachedInviteeCellReuseIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", v5, v10);

  v11 = (objc_class *)objc_opt_class();
  v12 = objc_alloc(MEMORY[0x1E0CB3940]);
  NSStringFromClass(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[EKUIInviteesViewAddInviteesSection reuseIdentifierVersion](self, "reuseIdentifierVersion"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v12, "initWithFormat:", CFSTR("%@-%@"), v13, v14);
  -[EKUIInviteesViewAddInviteesSection setCachedAddInviteeCellReuseIdentifier:](self, "setCachedAddInviteeCellReuseIdentifier:", v15);

  -[EKUIInviteesViewAddInviteesSection cachedAddInviteeCellReuseIdentifier](self, "cachedAddInviteeCellReuseIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", v11, v16);

  -[EKUIInviteesViewAddInviteesSection setReuseIdentifierVersion:](self, "setReuseIdentifierVersion:", -[EKUIInviteesViewAddInviteesSection reuseIdentifierVersion](self, "reuseIdentifierVersion") + 1);
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
  void (**v7)(void);
  NSObject *v8;
  const char *v9;
  void *v10;
  void *v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD);
  uint64_t v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t v18;
  int v19;
  id v20;
  __int16 v21;
  void (**v22)(void);
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "row");
  if (-[EKUIInviteesViewAddInviteesSection _isValidRow:](self, "_isValidRow:", v5))
  {
    if (-[EKUIInviteesViewAddInviteesSection _isAddInviteesRow:](self, "_isAddInviteesRow:", v5))
    {
      -[EKUIInviteesViewAddInviteesSection addInviteesTapped](self, "addInviteesTapped");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        -[EKUIInviteesViewAddInviteesSection addInviteesTapped](self, "addInviteesTapped");
        v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v7[2]();
LABEL_19:

        goto LABEL_20;
      }
      v8 = kEKUILogInviteesHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
      {
        v19 = 138412290;
        v20 = v4;
        v9 = "No 'add invitees tapped' callback defined.  Will not select row.  Index path: [%@]";
        goto LABEL_7;
      }
      goto LABEL_20;
    }
    -[EKUIInviteesViewAddInviteesSection participants](self, "participants");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndex:", v5);
    v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "participant");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[EKUIInviteesViewAddInviteesSection participantTapped](self, "participantTapped");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        -[EKUIInviteesViewAddInviteesSection participantTapped](self, "participantTapped");
        v13 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v13)[2](v13, v11);

LABEL_18:
        goto LABEL_19;
      }
      v18 = kEKUILogInviteesHandle;
      if (!os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
        goto LABEL_18;
      v19 = 138412290;
      v20 = v4;
      v15 = "No 'participant tapped' callback defined.  Will not select row.  Index path: [%@]";
      v16 = v18;
      v17 = 12;
    }
    else
    {
      v14 = kEKUILogInviteesHandle;
      if (!os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
        goto LABEL_18;
      v19 = 138412546;
      v20 = v4;
      v21 = 2112;
      v22 = v7;
      v15 = "Cannot find participant.  Index path: [%@]  Participant for sorting: [%@]";
      v16 = v14;
      v17 = 22;
    }
    _os_log_impl(&dword_1AF84D000, v16, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v19, v17);
    goto LABEL_18;
  }
  v8 = kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
  {
    v19 = 138412290;
    v20 = v4;
    v9 = "Cannot find row to select.  Will not select row.  Index path: [%@]";
LABEL_7:
    _os_log_impl(&dword_1AF84D000, v8, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v19, 0xCu);
  }
LABEL_20:

}

- (BOOL)canEditRow:(id)a3
{
  id v4;
  uint64_t v5;
  _BOOL4 v6;

  v4 = a3;
  if (-[EKUIInviteesViewAddInviteesSection showPending](self, "showPending")
    && (v5 = objc_msgSend(v4, "row"), -[EKUIInviteesViewAddInviteesSection _isValidRow:](self, "_isValidRow:", v5)))
  {
    v6 = !-[EKUIInviteesViewAddInviteesSection _isAddInviteesRow:](self, "_isAddInviteesRow:", v5);
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
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
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Remove invitee - add invitees section"), CFSTR("Remove"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)commitEditingStyle:(int64_t)a3 forRow:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = objc_msgSend(v6, "row");
  if (a3 == 1)
  {
    if (-[EKUIInviteesViewAddInviteesSection _isValidRow:](self, "_isValidRow:", v7))
    {
      -[EKUIInviteesViewAddInviteesSection participantRemoved](self, "participantRemoved");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        -[EKUIInviteesViewAddInviteesSection _removeParticipantAtIndexPath:](self, "_removeParticipantAtIndexPath:", v6);
        goto LABEL_12;
      }
      v13 = kEKUILogInviteesHandle;
      if (!os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
        goto LABEL_12;
      v15 = 138412290;
      v16 = v6;
      v14 = "No 'participant removed' callback defined.  Will not remove participant.  Index path: [%@]";
    }
    else
    {
      v13 = kEKUILogInviteesHandle;
      if (!os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
        goto LABEL_12;
      v15 = 138412290;
      v16 = v6;
      v14 = "Received commit for nonexistent row: [%@]";
    }
    _os_log_impl(&dword_1AF84D000, v13, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v15, 0xCu);
    goto LABEL_12;
  }
  v9 = (void *)kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
  {
    v10 = (void *)MEMORY[0x1E0CB37E8];
    v11 = v9;
    objc_msgSend(v10, "numberWithInteger:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412290;
    v16 = v12;
    _os_log_impl(&dword_1AF84D000, v11, OS_LOG_TYPE_ERROR, "Received commit for unrecognized editing style: [%@]", (uint8_t *)&v15, 0xCu);

  }
LABEL_12:

}

- (double)estimatedHeightForRow:(id)a3
{
  return 44.0;
}

- (void)cancelOutstandingOperations
{
  id v2;

  -[EKUIInviteesViewAddInviteesSection availabilityRequestsQueue](self, "availabilityRequestsQueue");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelAllOperations");

}

- (id)actionsForRow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[EKUIInviteesViewAddInviteesSection _isAddInviteesRow:](self, "_isAddInviteesRow:", objc_msgSend(v4, "row")))
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    +[EKUIInviteesViewSectionCommon deleteRowAction:forRow:](EKUIInviteesViewSectionCommon, "deleteRowAction:forRow:", self, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewAddInviteesSection participants](self, "participants");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v4, "row"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[EKUIInviteesViewAddInviteesSection participantSetRole](self, "participantSetRole");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", objc_msgSend(v4, "section"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[EKUIInviteesViewSectionCommon setRoleRowActionWithParticipant:withSetRoleBlock:forSections:](EKUIInviteesViewSectionCommon, "setRoleRowActionWithParticipant:withSetRoleBlock:forSections:", v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v13[0] = v6;
    v13[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (BOOL)supportsContextMenuForIndexPath:(id)a3
{
  return !-[EKUIInviteesViewAddInviteesSection _isAddInviteesRow:](self, "_isAddInviteesRow:", objc_msgSend(a3, "row"));
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
  -[EKUIInviteesViewAddInviteesSection participants](self, "participants");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "participant");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = [EKUIInviteeContextMenuData alloc];
  -[EKUIInviteesViewAddInviteesSection participantSetRole](self, "participantSetRole");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[EKUIInviteeContextMenuData initWithDefaultActionsForSection:indexPath:participant:interaction:participantSetRole:](v11, "initWithDefaultActionsForSection:indexPath:participant:interaction:participantSetRole:", self, v7, v10, v6, v12);

  return v13;
}

- (void)updateWithEvent:(id)a3 showPending:(BOOL)a4
{
  _BOOL8 v4;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  void *v46;
  _QWORD v47[4];
  id v48;
  id v49;
  id location;
  _QWORD aBlock[5];
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t buf[4];
  void *v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v4 = a4;
  v64 = *MEMORY[0x1E0C80C00];
  v43 = a3;
  -[EKUIInviteesViewAddInviteesSection setEvent:](self, "setEvent:");
  v6 = kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF84D000, v6, OS_LOG_TYPE_DEBUG, "Cancelling existing availability operations.", buf, 2u);
  }
  -[EKUIInviteesViewAddInviteesSection availabilityRequestsQueue](self, "availabilityRequestsQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cancelAllOperations");

  -[EKUIInviteesViewAddInviteesSection participantAddressesToAvailabilityType](self, "participantAddressesToAvailabilityType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllObjects");

  -[EKUIInviteesViewAddInviteesSection participantAddressesToParticipantIndex](self, "participantAddressesToParticipantIndex");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeAllObjects");

  -[EKUIInviteesViewAddInviteesSection participantAddressesForInFlightAvailabilityOperations](self, "participantAddressesForInFlightAvailabilityOperations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeAllObjects");

  -[EKUIInviteesViewAddInviteesSection setCanSeeAttendeeStatuses:](self, "setCanSeeAttendeeStatuses:", CanSeeAttendeeStatuses((uint64_t)v43));
  -[EKUIInviteesViewAddInviteesSection setShowPending:](self, "setShowPending:", v4);
  if (v4)
  {
    objc_msgSend(v43, "organizer");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    objc_msgSend(v43, "attendees");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v57 != v13)
            objc_enumerationMutation(v11);
          v15 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
          if (objc_msgSend(v15, "participantType") != 2
            && objc_msgSend(v15, "isNew")
            && (objc_msgSend(v15, "isEqualToParticipant:", v46) & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CAA0E8], "participantForSortingWithEKParticipant:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "addObject:", v16);

          }
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
      }
      while (v12);
    }

    objc_msgSend(v44, "sortedArrayUsingComparator:", &__block_literal_global_34);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "calendar");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "source");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraints");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "supportsAvailabilityRequests");

    if ((v20 & 1) != 0)
    {
      if (objc_msgSend(v42, "count"))
      {
        v45 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v54 = 0u;
        v55 = 0u;
        v52 = 0u;
        v53 = 0u;
        v21 = v42;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
        if (v22)
        {
          v23 = 0;
          v24 = *(_QWORD *)v53;
          do
          {
            for (j = 0; j != v22; ++j)
            {
              if (*(_QWORD *)v53 != v24)
                objc_enumerationMutation(v21);
              objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * j), "participant");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend((id)objc_opt_class(), "_participantAddressForParticipant:", v26);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              if (v27)
              {
                objc_msgSend(v45, "addObject:", v27);
                v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", v23 + j);
                -[EKUIInviteesViewAddInviteesSection _setParticipantIndex:forParticipantAddress:](self, "_setParticipantIndex:forParticipantAddress:", v28, v27);
                -[EKUIInviteesViewAddInviteesSection _addAddressToSetOfAddressesToInflightOperations:](self, "_addAddressToSetOfAddressesToInflightOperations:", v27);

              }
              else
              {
                v29 = kEKUILogInviteesHandle;
                if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v61 = v26;
                  _os_log_impl(&dword_1AF84D000, v29, OS_LOG_TYPE_DEBUG, "Could not find address for participant: [%@].  Will not include this participant in final list of participants.", buf, 0xCu);
                }
              }

            }
            v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
            v23 += j;
          }
          while (v22);
        }

        v30 = MEMORY[0x1E0C809B0];
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __66__EKUIInviteesViewAddInviteesSection_updateWithEvent_showPending___block_invoke_32;
        aBlock[3] = &unk_1E601A650;
        aBlock[4] = self;
        v31 = _Block_copy(aBlock);
        objc_msgSend(v43, "calendar");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "source");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v43, "startDate");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "endDateUnadjustedForLegacyClients");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CAA130]), "initWithSource:startDate:endDate:ignoredEvent:addresses:resultsBlock:", v33, v34, v35, v43, v45, v31);
        objc_initWeak((id *)buf, self);
        objc_initWeak(&location, v36);
        v47[0] = v30;
        v47[1] = 3221225472;
        v47[2] = __66__EKUIInviteesViewAddInviteesSection_updateWithEvent_showPending___block_invoke_4;
        v47[3] = &unk_1E601AC28;
        objc_copyWeak(&v48, &location);
        objc_copyWeak(&v49, (id *)buf);
        objc_msgSend(v36, "setCompletionBlock:", v47);
        -[EKUIInviteesViewAddInviteesSection availabilityRequestsQueue](self, "availabilityRequestsQueue");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "addOperation:", v36);

        objc_destroyWeak(&v49);
        objc_destroyWeak(&v48);
        objc_destroyWeak(&location);
        objc_destroyWeak((id *)buf);

      }
    }
    else
    {
      v38 = kEKUILogInviteesHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AF84D000, v38, OS_LOG_TYPE_DEBUG, "The event's source does not support availability requests.  Will not issue any.", buf, 2u);
      }
    }
    v39 = (void *)objc_msgSend(v42, "mutableCopy");
    -[EKUIInviteesViewAddInviteesSection setParticipants:](self, "setParticipants:", v39);

    -[EKUIInviteesViewAddInviteesSection pendingParticipants](self, "pendingParticipants");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "valueForKey:", CFSTR("participant"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewAddInviteesSection setPendingParticipants:](self, "setPendingParticipants:", v41);

  }
  else
  {
    -[EKUIInviteesViewAddInviteesSection setParticipants:](self, "setParticipants:", 0);
    -[EKUIInviteesViewAddInviteesSection setPendingParticipants:](self, "setPendingParticipants:", 0);
  }

}

uint64_t __66__EKUIInviteesViewAddInviteesSection_updateWithEvent_showPending___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __66__EKUIInviteesViewAddInviteesSection_updateWithEvent_showPending___block_invoke_32(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__EKUIInviteesViewAddInviteesSection_updateWithEvent_showPending___block_invoke_2;
  v6[3] = &unk_1E6018EC0;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __66__EKUIInviteesViewAddInviteesSection_updateWithEvent_showPending___block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __66__EKUIInviteesViewAddInviteesSection_updateWithEvent_showPending___block_invoke_3;
  v3[3] = &unk_1E601A678;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "enumerateKeysAndObjectsUsingBlock:", v3);
}

void __66__EKUIInviteesViewAddInviteesSection_updateWithEvent_showPending___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "_setOfAddressesToInflightOperationsContainsAddress:", v8))
  {
    v6 = objc_msgSend(MEMORY[0x1E0CA9FE8], "summarizedAvailabilityTypeForSpans:", v5);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", v6);
    objc_msgSend(*(id *)(a1 + 32), "_setAvailabilityType:forParticipantAddress:", v7, v8);
    objc_msgSend(*(id *)(a1 + 32), "_removeAddressFromSetOfAddressesToInflightOperations:", v8);
    objc_msgSend(*(id *)(a1 + 32), "_updateCellForParticipantWithAddress:", v8);

  }
}

void __66__EKUIInviteesViewAddInviteesSection_updateWithEvent_showPending___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  id v3;
  NSObject *v4;
  const char *v5;
  _QWORD block[5];
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  if (!v3)
  {
    v4 = kEKUILogInviteesHandle;
    if (!os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
      goto LABEL_10;
    *(_WORD *)buf = 0;
    v5 = "self went away.  Will not proceed.";
LABEL_9:
    _os_log_impl(&dword_1AF84D000, v4, OS_LOG_TYPE_DEBUG, v5, buf, 2u);
    goto LABEL_10;
  }
  if (!WeakRetained)
  {
    v4 = kEKUILogInviteesHandle;
    if (!os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
      goto LABEL_10;
    *(_WORD *)buf = 0;
    v5 = "The availability operation went away.  Will not proceed.";
    goto LABEL_9;
  }
  if ((objc_msgSend(WeakRetained, "isCancelled") & 1) == 0)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__EKUIInviteesViewAddInviteesSection_updateWithEvent_showPending___block_invoke_38;
    block[3] = &unk_1E6018688;
    block[4] = v3;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
LABEL_10:

}

void __66__EKUIInviteesViewAddInviteesSection_updateWithEvent_showPending___block_invoke_38(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "participantAddressesForInFlightAvailabilityOperations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  objc_msgSend(*(id *)(a1 + 32), "participantAddressesForInFlightAvailabilityOperations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(a1 + 32), "_updateCellForParticipantWithAddress:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (id)_lookUpAvailabilityTypeForParticipantAddress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[EKUIInviteesViewAddInviteesSection participantAddressesToAvailabilityType](self, "participantAddressesToAvailabilityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    EKUtils_AdjustedAttendeeAddress();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewAddInviteesSection participantAddressesToAvailabilityType](self, "participantAddressesToAvailabilityType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (void)_setAvailabilityType:(id)a3 forParticipantAddress:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[EKUIInviteesViewAddInviteesSection participantAddressesToAvailabilityType](self, "participantAddressesToAvailabilityType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, v6);

  EKUtils_AdjustedAttendeeAddress();
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[EKUIInviteesViewAddInviteesSection participantAddressesToAvailabilityType](self, "participantAddressesToAvailabilityType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v7, v10);

}

- (void)_removeAddressFromDictionaryOfAddressesToAvailabilityType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[EKUIInviteesViewAddInviteesSection participantAddressesToAvailabilityType](self, "participantAddressesToAvailabilityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v4);

  EKUtils_AdjustedAttendeeAddress();
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[EKUIInviteesViewAddInviteesSection participantAddressesToAvailabilityType](self, "participantAddressesToAvailabilityType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", v7);

}

- (id)_lookUpParticipantIndexForParticipantAddress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[EKUIInviteesViewAddInviteesSection participantAddressesToParticipantIndex](self, "participantAddressesToParticipantIndex");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    EKUtils_AdjustedAttendeeAddress();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewAddInviteesSection participantAddressesToParticipantIndex](self, "participantAddressesToParticipantIndex");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (void)_removeAddressFromDictionaryOfAddressesToParticipantIndex:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[EKUIInviteesViewAddInviteesSection participantAddressesToParticipantIndex](self, "participantAddressesToParticipantIndex");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v4);

  EKUtils_AdjustedAttendeeAddress();
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[EKUIInviteesViewAddInviteesSection participantAddressesToParticipantIndex](self, "participantAddressesToParticipantIndex");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", v7);

}

- (void)_setParticipantIndex:(id)a3 forParticipantAddress:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[EKUIInviteesViewAddInviteesSection participantAddressesToParticipantIndex](self, "participantAddressesToParticipantIndex");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, v6);

  EKUtils_AdjustedAttendeeAddress();
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[EKUIInviteesViewAddInviteesSection participantAddressesToParticipantIndex](self, "participantAddressesToParticipantIndex");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v7, v10);

}

- (void)_removeAddressFromSetOfAddressesToInflightOperations:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[EKUIInviteesViewAddInviteesSection participantAddressesForInFlightAvailabilityOperations](self, "participantAddressesForInFlightAvailabilityOperations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

  EKUtils_AdjustedAttendeeAddress();
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[EKUIInviteesViewAddInviteesSection participantAddressesForInFlightAvailabilityOperations](self, "participantAddressesForInFlightAvailabilityOperations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v7);

}

- (void)_addAddressToSetOfAddressesToInflightOperations:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[EKUIInviteesViewAddInviteesSection participantAddressesForInFlightAvailabilityOperations](self, "participantAddressesForInFlightAvailabilityOperations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  EKUtils_AdjustedAttendeeAddress();
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[EKUIInviteesViewAddInviteesSection participantAddressesForInFlightAvailabilityOperations](self, "participantAddressesForInFlightAvailabilityOperations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

}

- (BOOL)_setOfAddressesToInflightOperationsContainsAddress:(id)a3
{
  id v4;
  void *v5;
  char v6;
  char v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[EKUIInviteesViewAddInviteesSection participantAddressesForInFlightAvailabilityOperations](self, "participantAddressesForInFlightAvailabilityOperations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if ((v6 & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    EKUtils_AdjustedAttendeeAddress();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewAddInviteesSection participantAddressesForInFlightAvailabilityOperations](self, "participantAddressesForInFlightAvailabilityOperations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v9, "containsObject:", v8);

  }
  return v7;
}

- (void)_removeParticipantAtIndexPath:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  _QWORD *v12;
  void (*v13)(_QWORD *, id, id, _QWORD *);
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  unint64_t v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "row");
  -[EKUIInviteesViewAddInviteesSection participants](self, "participants");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v5 < v7)
  {
    -[EKUIInviteesViewAddInviteesSection participants](self, "participants");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", v5);
    v9 = objc_claimAutoreleasedReturnValue();

    -[NSObject participant](v9, "participant");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v22 = v10;
      v23 = 2112;
      v24 = v4;
      _os_log_impl(&dword_1AF84D000, v11, OS_LOG_TYPE_DEBUG, "Invoking participant removed callback with participant [%@] and index path [%@]", buf, 0x16u);
    }
    -[EKUIInviteesViewAddInviteesSection participantRemoved](self, "participantRemoved");
    v12 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __68__EKUIInviteesViewAddInviteesSection__removeParticipantAtIndexPath___block_invoke;
    v17[3] = &unk_1E6018918;
    v17[4] = self;
    v18 = v10;
    v19 = v4;
    v20 = v5;
    v13 = (void (*)(_QWORD *, id, id, _QWORD *))v12[2];
    v14 = v10;
    v13(v12, v14, v19, v17);

    goto LABEL_7;
  }
  v15 = (void *)kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
  {
    v9 = v15;
    -[EKUIInviteesViewAddInviteesSection participants](self, "participants");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v22 = v4;
    v23 = 2112;
    v24 = v16;
    _os_log_impl(&dword_1AF84D000, v9, OS_LOG_TYPE_ERROR, "No participant was found at index path [%@] while trying to remove it. We will not remove anything from participants [%@].", buf, 0x16u);

LABEL_7:
  }

}

void __68__EKUIInviteesViewAddInviteesSection__removeParticipantAtIndexPath___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_participantAddressForParticipant:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v9 = 138412546;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1AF84D000, v3, OS_LOG_TYPE_DEBUG, "Removing participant [%@] at index path [%@] from EKUIInviteesViewAddInviteesSection", (uint8_t *)&v9, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 32), "participants");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectAtIndex:", *(_QWORD *)(a1 + 56));

  objc_msgSend(*(id *)(a1 + 32), "pendingParticipants");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForKey:", CFSTR("participant"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setPendingParticipants:", v8);

  objc_msgSend(*(id *)(a1 + 32), "_removeAddressFromDictionaryOfAddressesToAvailabilityType:", v2);
  objc_msgSend(*(id *)(a1 + 32), "_removeAddressFromDictionaryOfAddressesToParticipantIndex:", v2);
  objc_msgSend(*(id *)(a1 + 32), "_removeAddressFromSetOfAddressesToInflightOperations:", v2);

}

- (BOOL)hasPendingParticipants
{
  void *v2;
  BOOL v3;

  -[EKUIInviteesViewAddInviteesSection participants](self, "participants");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)_isValidRow:(int64_t)a3
{
  return (a3 & 0x8000000000000000) == 0
      && -[EKUIInviteesViewAddInviteesSection numberOfRows](self, "numberOfRows") > a3;
}

- (BOOL)_isAddInviteesRow:(int64_t)a3
{
  void *v4;

  -[EKUIInviteesViewAddInviteesSection participants](self, "participants");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "count") == a3;

  return a3;
}

+ (id)_participantAddressForParticipant:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t v9[16];

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "URL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "absoluteString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1AF84D000, v7, OS_LOG_TYPE_ERROR, "No participant given.  Will not return address.", v9, 2u);
    }
    v6 = 0;
  }

  return v6;
}

- (void)_updateCellForParticipantWithAddress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  NSObject *v10;
  const char *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[EKUIInviteesViewAddInviteesSection _lookUpParticipantIndexForParticipantAddress:](self, "_lookUpParticipantIndexForParticipantAddress:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v10 = kEKUILogInviteesHandle;
    if (!os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    v16 = 138412290;
    v17 = v4;
    v11 = "Could not find participant index.  Will not update cell for address: [%@].";
LABEL_9:
    _os_log_impl(&dword_1AF84D000, v10, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v16, 0xCu);
    goto LABEL_13;
  }
  -[EKUIInviteesViewAddInviteesSection tableViewCellHook](self, "tableViewCellHook");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v10 = kEKUILogInviteesHandle;
    if (!os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    v16 = 138412290;
    v17 = v4;
    v11 = "No 'table view cell hook' callback defined.  Will not update cell for address: [%@].";
    goto LABEL_9;
  }
  v7 = objc_msgSend(v5, "integerValue");
  -[EKUIInviteesViewAddInviteesSection tableViewCellHook](self, "tableViewCellHook");
  v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v8[2](v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[EKUIInviteesViewAddInviteesSection _updateCell:forParticipantAtIndex:animated:](self, "_updateCell:forParticipantAtIndex:animated:", v9, v7, 1);
  }
  else
  {
    v12 = (void *)kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
    {
      v13 = (void *)MEMORY[0x1E0CB37E8];
      v14 = v12;
      objc_msgSend(v13, "numberWithInteger:", v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412546;
      v17 = v15;
      v18 = 2112;
      v19 = v4;
      _os_log_impl(&dword_1AF84D000, v14, OS_LOG_TYPE_DEBUG, "Could not find cell for index: [%@].  It may be offscreen.  Will not update cell for address: [%@].", (uint8_t *)&v16, 0x16u);

    }
  }

LABEL_13:
}

- (void)_updateCell:(id)a3 forParticipantAtIndex:(int64_t)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v5 = a5;
  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  -[EKUIInviteesViewAddInviteesSection participants](self, "participants");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndex:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "participant");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_participantAddressForParticipant:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[EKUIInviteesViewAddInviteesSection _lookUpAvailabilityTypeForParticipantAddress:](self, "_lookUpAvailabilityTypeForParticipantAddress:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
      v15 = objc_msgSend(v13, "integerValue");
    else
      v15 = 0;

    v17 = (void *)MEMORY[0x1E0CA9FE8];
    -[EKUIInviteesViewAddInviteesSection event](self, "event");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "availabilityPanelVisibilityForEvent:", v18);

    if (v19)
      v15 = 3;
    objc_msgSend(v8, "updateWithParticipantForSorting:availabilityType:showSpinner:animated:", v10, v15, -[EKUIInviteesViewAddInviteesSection _setOfAddressesToInflightOperationsContainsAddress:](self, "_setOfAddressesToInflightOperationsContainsAddress:", v12), v5);
  }
  else
  {
    v16 = kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
    {
      v20 = 138412546;
      v21 = v11;
      v22 = 2112;
      v23 = v8;
      _os_log_impl(&dword_1AF84D000, v16, OS_LOG_TYPE_ERROR, "Could not find address for participant: [%@].  Will not update cell: [%@]", (uint8_t *)&v20, 0x16u);
    }
  }

}

- (NSArray)pendingParticipants
{
  return self->_pendingParticipants;
}

- (void)setPendingParticipants:(id)a3
{
  objc_storeStrong((id *)&self->_pendingParticipants, a3);
}

- (id)participantTapped
{
  return self->_participantTapped;
}

- (void)setParticipantTapped:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)participantRemoved
{
  return self->_participantRemoved;
}

- (void)setParticipantRemoved:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)addInviteesTapped
{
  return self->_addInviteesTapped;
}

- (void)setAddInviteesTapped:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)participantSetRole
{
  return self->_participantSetRole;
}

- (void)setParticipantSetRole:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
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

- (BOOL)canSeeAttendeeStatuses
{
  return self->_canSeeAttendeeStatuses;
}

- (void)setCanSeeAttendeeStatuses:(BOOL)a3
{
  self->_canSeeAttendeeStatuses = a3;
}

- (NSString)cachedInviteeCellReuseIdentifier
{
  return self->_cachedInviteeCellReuseIdentifier;
}

- (void)setCachedInviteeCellReuseIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_cachedInviteeCellReuseIdentifier, a3);
}

- (NSString)cachedAddInviteeCellReuseIdentifier
{
  return self->_cachedAddInviteeCellReuseIdentifier;
}

- (void)setCachedAddInviteeCellReuseIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_cachedAddInviteeCellReuseIdentifier, a3);
}

- (unint64_t)reuseIdentifierVersion
{
  return self->_reuseIdentifierVersion;
}

- (void)setReuseIdentifierVersion:(unint64_t)a3
{
  self->_reuseIdentifierVersion = a3;
}

- (BOOL)showPending
{
  return self->_showPending;
}

- (void)setShowPending:(BOOL)a3
{
  self->_showPending = a3;
}

- (NSOperationQueue)availabilityRequestsQueue
{
  return self->_availabilityRequestsQueue;
}

- (void)setAvailabilityRequestsQueue:(id)a3
{
  objc_storeStrong((id *)&self->_availabilityRequestsQueue, a3);
}

- (NSMutableDictionary)participantAddressesToAvailabilityType
{
  return self->_participantAddressesToAvailabilityType;
}

- (void)setParticipantAddressesToAvailabilityType:(id)a3
{
  objc_storeStrong((id *)&self->_participantAddressesToAvailabilityType, a3);
}

- (NSMutableDictionary)participantAddressesToParticipantIndex
{
  return self->_participantAddressesToParticipantIndex;
}

- (void)setParticipantAddressesToParticipantIndex:(id)a3
{
  objc_storeStrong((id *)&self->_participantAddressesToParticipantIndex, a3);
}

- (NSMutableSet)participantAddressesForInFlightAvailabilityOperations
{
  return self->_participantAddressesForInFlightAvailabilityOperations;
}

- (void)setParticipantAddressesForInFlightAvailabilityOperations:(id)a3
{
  objc_storeStrong((id *)&self->_participantAddressesForInFlightAvailabilityOperations, a3);
}

- (id)tableViewCellHook
{
  return self->_tableViewCellHook;
}

- (void)setTableViewCellHook:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_tableViewCellHook, 0);
  objc_storeStrong((id *)&self->_participantAddressesForInFlightAvailabilityOperations, 0);
  objc_storeStrong((id *)&self->_participantAddressesToParticipantIndex, 0);
  objc_storeStrong((id *)&self->_participantAddressesToAvailabilityType, 0);
  objc_storeStrong((id *)&self->_availabilityRequestsQueue, 0);
  objc_storeStrong((id *)&self->_cachedAddInviteeCellReuseIdentifier, 0);
  objc_storeStrong((id *)&self->_cachedInviteeCellReuseIdentifier, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong(&self->_participantSetRole, 0);
  objc_storeStrong(&self->_addInviteesTapped, 0);
  objc_storeStrong(&self->_participantRemoved, 0);
  objc_storeStrong(&self->_participantTapped, 0);
  objc_storeStrong((id *)&self->_pendingParticipants, 0);
}

@end
