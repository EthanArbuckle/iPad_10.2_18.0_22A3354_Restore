@implementation EKUIInviteesViewProposedTimeSection

- (EKUIInviteesViewProposedTimeSection)init
{
  EKUIInviteesViewProposedTimeSection *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSMutableOrderedSet *proposedTimes;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)EKUIInviteesViewProposedTimeSection;
  v2 = -[EKUIInviteesViewProposedTimeSection init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    -[EKUIInviteesViewProposedTimeSection setRowsShowingAllParticipants:](v2, "setRowsShowingAllParticipants:", v3);

    EventKitUIBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Proposed Times"), &stru_1E601DFA8, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewProposedTimeSection setTitle:](v2, "setTitle:", v5);

    v6 = objc_opt_new();
    proposedTimes = v2->_proposedTimes;
    v2->_proposedTimes = (NSMutableOrderedSet *)v6;

    v2->_checkedRow = -1;
  }
  return v2;
}

- (void)updateWithEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[EKUIInviteesViewProposedTimeSection setEvent:](self, "setEvent:", v4);
  -[EKUIInviteesViewProposedTimeSection proposedTimes](self, "proposedTimes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v4, "attendees", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v10), "proposedStartDateForEvent:", v4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          -[EKUIInviteesViewProposedTimeSection proposedTimes](self, "proposedTimes");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "containsObject:", v11);

          if ((v13 & 1) == 0)
          {
            -[EKUIInviteesViewProposedTimeSection proposedTimes](self, "proposedTimes");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "addObject:", v11);

          }
        }

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  -[EKUIInviteesViewProposedTimeSection proposedTimes](self, "proposedTimes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sortUsingComparator:", &__block_literal_global_37);

}

uint64_t __55__EKUIInviteesViewProposedTimeSection_updateWithEvent___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (id)debugTitle
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (BOOL)sectionShouldBeShown
{
  void *v3;
  BOOL v4;

  -[EKUIInviteesViewProposedTimeSection event](self, "event");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isSelfOrganized"))
    v4 = -[EKUIInviteesViewProposedTimeSection numberOfRows](self, "numberOfRows") != 0;
  else
    v4 = 0;

  return v4;
}

- (unint64_t)numberOfRows
{
  void *v2;
  unint64_t v3;

  -[EKUIInviteesViewProposedTimeSection proposedTimes](self, "proposedTimes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)cellForIndexPath:(id)a3 inTableView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  EKUIInviteesViewProposedTimeCell *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  unsigned int v33;
  _QWORD v34[4];
  id v35[2];
  _QWORD v36[4];
  id v37;
  _BYTE location[12];
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(v6, "row");
  if (-[EKUIInviteesViewProposedTimeSection _isValidRow:](self, "_isValidRow:", v8))
  {
    -[EKUIInviteesViewProposedTimeSection cachedCellReuseIdentifier](self, "cachedCellReuseIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v9, v6);
    v10 = (EKUIInviteesViewProposedTimeCell *)objc_claimAutoreleasedReturnValue();

    objc_initWeak((id *)location, self);
    v11 = MEMORY[0x1E0C809B0];
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __68__EKUIInviteesViewProposedTimeSection_cellForIndexPath_inTableView___block_invoke;
    v36[3] = &unk_1E601AEB0;
    objc_copyWeak(&v37, (id *)location);
    -[EKUIInviteesViewTimeSlotCell setShowPreviewOfEventAtTime:](v10, "setShowPreviewOfEventAtTime:", v36);
    v34[1] = 3221225472;
    v34[2] = __68__EKUIInviteesViewProposedTimeSection_cellForIndexPath_inTableView___block_invoke_2;
    v34[3] = &unk_1E6018A20;
    v34[0] = v11;
    objc_copyWeak(v35, (id *)location);
    v35[1] = v8;
    -[EKUIInviteesViewTimeSlotCell setShowAllConflictedParticipantsTapped:](v10, "setShowAllConflictedParticipantsTapped:", v34);
    -[EKUIInviteesViewProposedTimeSection rowsShowingAllParticipants](self, "rowsShowingAllParticipants");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v12, "containsObject:", v13);

    -[EKUIInviteesViewProposedTimeSection proposedTimes](self, "proposedTimes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndexedSubscript:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[EKUIInviteesViewProposedTimeSection event](self, "event");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "endDateUnadjustedForLegacyClients");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewProposedTimeSection event](self, "event");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "startDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "timeIntervalSinceDate:", v19);
    v21 = v20;

    objc_msgSend(v15, "dateByAddingTimeInterval:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewProposedTimeSection busyParticipantsForDate:](self, "busyParticipantsForDate:", v15);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewTimeSlotCell setSearchInProgress:](v10, "setSearchInProgress:", v23 != 0);
    -[EKUIInviteesViewProposedTimeSection namesForParticipantsProposingDate:](self, "namesForParticipantsProposingDate:", v15);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewTimeSlotCell setProposedBy:](v10, "setProposedBy:", v24);

    -[EKUIInviteesViewProposedTimeSection event](self, "event");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "startTimeZone");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewTimeSlotCell updateWithStartDate:endDate:timeZone:busyParticipants:showAllParticipants:checked:](v10, "updateWithStartDate:endDate:timeZone:busyParticipants:showAllParticipants:checked:", v15, v22, v26, v23, v33, -[EKUIInviteesViewProposedTimeSection isRowChecked:](self, "isRowChecked:", v8));

    objc_destroyWeak(v35);
    objc_destroyWeak(&v37);
    objc_destroyWeak((id *)location);
  }
  else
  {
    v27 = (void *)kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
    {
      v28 = (void *)MEMORY[0x1E0CB37E8];
      v29 = v27;
      objc_msgSend(v28, "numberWithInteger:", v8);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[EKUIInviteesViewProposedTimeSection numberOfRows](self, "numberOfRows"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138412546;
      *(_QWORD *)&location[4] = v30;
      v39 = 2112;
      v40 = v31;
      _os_log_impl(&dword_1AF84D000, v29, OS_LOG_TYPE_ERROR, "A cell was requested for a nonexistent row.  Giving back a fresh cell.  Row: [%@].  Number of rows: [%@]", location, 0x16u);

    }
    v10 = objc_alloc_init(EKUIInviteesViewProposedTimeCell);
  }

  return v10;
}

void __68__EKUIInviteesViewProposedTimeSection_cellForIndexPath_inTableView___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id *v6;
  id WeakRetained;
  void *v8;
  id v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "showPreviewOfEventAtTime");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_loadWeakRetained(v6);
    objc_msgSend(v9, "showPreviewOfEventAtTime");
    v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v10)[2](v10, v11, v5);

  }
}

void __68__EKUIInviteesViewProposedTimeSection_cellForIndexPath_inTableView___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "rowsShowingAllParticipants");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[EKUIInviteesViewProposedTimeSection reuseIdentifierVersion](self, "reuseIdentifierVersion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("%@-%@"), v7, v8);
  -[EKUIInviteesViewProposedTimeSection setCachedCellReuseIdentifier:](self, "setCachedCellReuseIdentifier:", v9);

  -[EKUIInviteesViewProposedTimeSection cachedCellReuseIdentifier](self, "cachedCellReuseIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", v5, v10);

  -[EKUIInviteesViewProposedTimeSection setReuseIdentifierVersion:](self, "setReuseIdentifierVersion:", -[EKUIInviteesViewProposedTimeSection reuseIdentifierVersion](self, "reuseIdentifierVersion") + 1);
}

- (BOOL)canSelectRow:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a3, "row");
  if (!-[EKUIInviteesViewProposedTimeSection _isValidRow:](self, "_isValidRow:", v4))
  {
    v5 = (void *)kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
    {
      v6 = (void *)MEMORY[0x1E0CB37E8];
      v7 = v5;
      objc_msgSend(v6, "numberWithInteger:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v8;
      _os_log_impl(&dword_1AF84D000, v7, OS_LOG_TYPE_ERROR, "There is no row with index [%@].  Will not determine if row can be selected.", (uint8_t *)&v10, 0xCu);

    }
  }
  return !-[EKUIInviteesViewProposedTimeSection isRowChecked:](self, "isRowChecked:", v4);
}

- (void)selectRow:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a3, "row");
  if (-[EKUIInviteesViewProposedTimeSection _isValidRow:](self, "_isValidRow:", v4))
  {
    -[EKUIInviteesViewProposedTimeSection proposedTimes](self, "proposedTimes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", v4);
    v18 = (id)objc_claimAutoreleasedReturnValue();

    -[EKUIInviteesViewProposedTimeSection event](self, "event");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endDateUnadjustedForLegacyClients");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewProposedTimeSection event](self, "event");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "startDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceDate:", v9);
    v11 = v10;

    objc_msgSend(v18, "dateByAddingTimeInterval:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewProposedTimeSection newTimeChosen](self, "newTimeChosen");
    v13 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, void *))v13)[2](v13, v18, v12);

    -[EKUIInviteesViewProposedTimeSection setChecked:](self, "setChecked:", v4);
  }
  else
  {
    v14 = (void *)kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
    {
      v15 = (void *)MEMORY[0x1E0CB37E8];
      v16 = v14;
      objc_msgSend(v15, "numberWithInteger:", v4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v20 = v17;
      _os_log_impl(&dword_1AF84D000, v16, OS_LOG_TYPE_ERROR, "There is no row with index [%@].  Will not select a row.", buf, 0xCu);

    }
  }
}

- (void)setChecked:(int64_t)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int64_t v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD);
  void *v12;
  void (**v13)(_QWORD, _QWORD);
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  EKUIInviteesViewProposedTimeSection *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = (void *)kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    v7 = v5;
    objc_msgSend(v6, "numberWithInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412546;
    v20 = v8;
    v21 = 2112;
    v22 = self;
    _os_log_impl(&dword_1AF84D000, v7, OS_LOG_TYPE_DEBUG, "Setting checked row to [%@] in section [%@]", (uint8_t *)&v19, 0x16u);

  }
  v9 = -[EKUIInviteesViewProposedTimeSection checkedRow](self, "checkedRow");
  -[EKUIInviteesViewProposedTimeSection setCheckedRow:](self, "setCheckedRow:", a3);
  if (-[EKUIInviteesViewProposedTimeSection _isValidRow:](self, "_isValidRow:", a3))
  {
    -[EKUIInviteesViewProposedTimeSection tableViewCellHook](self, "tableViewCellHook");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      if ((v9 & 0x8000000000000000) == 0)
      {
        -[EKUIInviteesViewProposedTimeSection tableViewCellHook](self, "tableViewCellHook");
        v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v11[2](v11, v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "setChecked:", 0);
      }
      -[EKUIInviteesViewProposedTimeSection tableViewCellHook](self, "tableViewCellHook");
      v13 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v13[2](v13, a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "setChecked:", 1);
      objc_msgSend(v14, "setSelected:animated:", 0, 1);

    }
  }
  else
  {
    v15 = (void *)kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
    {
      v16 = (void *)MEMORY[0x1E0CB37E8];
      v17 = v15;
      objc_msgSend(v16, "numberWithInteger:", a3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412290;
      v20 = v18;
      _os_log_impl(&dword_1AF84D000, v17, OS_LOG_TYPE_ERROR, "There is no row with index [%@].  Will not 'set checked row' to its row value.", (uint8_t *)&v19, 0xCu);

    }
  }
}

- (BOOL)canEditRow:(id)a3
{
  return 0;
}

- (int64_t)editingStyleForRow:(id)a3
{
  return 0;
}

- (id)titleForDeleteConfirmationButtonForRow:(id)a3
{
  return 0;
}

- (double)estimatedHeightForRow:(id)a3
{
  return 44.0;
}

- (id)actionsForRow:(id)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (BOOL)supportsContextMenuForIndexPath:(id)a3
{
  return 0;
}

- (id)contextMenuDataForIndexPath:(id)a3 interaction:(id)a4
{
  return 0;
}

- (void)clearCheckmark
{
  void (**v3)(_QWORD, _QWORD);
  id v4;

  -[EKUIInviteesViewProposedTimeSection tableViewCellHook](self, "tableViewCellHook");
  v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v3[2](v3, -[EKUIInviteesViewProposedTimeSection checkedRow](self, "checkedRow"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setChecked:", 0);
  -[EKUIInviteesViewProposedTimeSection setCheckedRow:](self, "setCheckedRow:", -1);

}

- (BOOL)injectNewRowsBeforeLastExistingRow
{
  return 0;
}

- (void)availabilitySearcherChangedState:(int64_t)a3
{
  void *v4;
  id v5;

  -[EKUIInviteesViewProposedTimeSection availabilitySearcher](self, "availabilitySearcher", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "proposedTimes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIInviteesViewProposedTimeSection setProposedTimeResults:](self, "setProposedTimeResults:", v4);

}

- (id)namesForParticipantsProposingDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21 = (id)objc_opt_new();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[EKUIInviteesViewProposedTimeSection event](self, "event");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attendees");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v6;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        -[EKUIInviteesViewProposedTimeSection event](self, "event");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "proposedStartDateForEvent:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v13, "isEqualToDate:", v4))
        {
          objc_msgSend(MEMORY[0x1E0CAA0E8], "participantForSortingWithEKParticipant:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "displayName");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          if (v15)
          {
            v17 = v15;
          }
          else
          {
            objc_msgSend(v14, "firstName");
            v17 = (id)objc_claimAutoreleasedReturnValue();
          }
          v18 = v17;

          if (!objc_msgSend(v18, "length"))
          {
            DisplayAddressForIdentity(v11);
            v19 = objc_claimAutoreleasedReturnValue();

            v18 = (void *)v19;
          }
          if (objc_msgSend(v18, "length"))
            objc_msgSend(v21, "addObject:", v18);

        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v8);
  }

  return v21;
}

- (id)busyParticipantsForDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  _OWORD v11[4];
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  memset(v11, 0, sizeof(v11));
  -[EKUIInviteesViewProposedTimeSection proposedTimeResults](self, "proposedTimeResults", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", v11, v12, 16))
  {
    v6 = (void *)**((_QWORD **)&v11[0] + 1);
    objc_msgSend(**((id **)&v11[0] + 1), "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqual:", v4);

    if (v8)
    {
      objc_msgSend(v6, "conflictedParticipants");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = (void *)MEMORY[0x1E0C9AA60];
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isRowChecked:(int64_t)a3
{
  _BOOL4 v5;

  v5 = -[EKUIInviteesViewProposedTimeSection _isValidRow:](self, "_isValidRow:");
  if (v5)
    LOBYTE(v5) = -[EKUIInviteesViewProposedTimeSection checkedRow](self, "checkedRow") == a3;
  return v5;
}

- (BOOL)_isValidRow:(int64_t)a3
{
  return (a3 & 0x8000000000000000) == 0
      && -[EKUIInviteesViewProposedTimeSection numberOfRows](self, "numberOfRows") > a3;
}

- (EKEvent)event
{
  return (EKEvent *)objc_loadWeakRetained((id *)&self->_event);
}

- (void)setEvent:(id)a3
{
  objc_storeWeak((id *)&self->_event, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSArray)busyParticipants
{
  return self->_busyParticipants;
}

- (void)setBusyParticipants:(id)a3
{
  objc_storeStrong((id *)&self->_busyParticipants, a3);
}

- (NSMutableSet)rowsShowingAllParticipants
{
  return self->_rowsShowingAllParticipants;
}

- (void)setRowsShowingAllParticipants:(id)a3
{
  objc_storeStrong((id *)&self->_rowsShowingAllParticipants, a3);
}

- (BOOL)conflictFound
{
  return self->_conflictFound;
}

- (void)setConflictFound:(BOOL)a3
{
  self->_conflictFound = a3;
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)newTimeChosen
{
  return self->_newTimeChosen;
}

- (void)setNewTimeChosen:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)showPreviewOfEventAtTime
{
  return self->_showPreviewOfEventAtTime;
}

- (void)setShowPreviewOfEventAtTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (EKInviteeAlternativeTimeSearcher)availabilitySearcher
{
  return self->_availabilitySearcher;
}

- (void)setAvailabilitySearcher:(id)a3
{
  objc_storeStrong((id *)&self->_availabilitySearcher, a3);
}

- (NSMutableOrderedSet)proposedTimes
{
  return self->_proposedTimes;
}

- (void)setProposedTimes:(id)a3
{
  objc_storeStrong((id *)&self->_proposedTimes, a3);
}

- (NSArray)proposedTimeResults
{
  return self->_proposedTimeResults;
}

- (void)setProposedTimeResults:(id)a3
{
  objc_storeStrong((id *)&self->_proposedTimeResults, a3);
}

- (int64_t)checkedRow
{
  return self->_checkedRow;
}

- (void)setCheckedRow:(int64_t)a3
{
  self->_checkedRow = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proposedTimeResults, 0);
  objc_storeStrong((id *)&self->_proposedTimes, 0);
  objc_storeStrong((id *)&self->_availabilitySearcher, 0);
  objc_storeStrong(&self->_showPreviewOfEventAtTime, 0);
  objc_storeStrong(&self->_newTimeChosen, 0);
  objc_storeStrong(&self->_tableViewCellHook, 0);
  objc_storeStrong((id *)&self->_cachedCellReuseIdentifier, 0);
  objc_storeStrong((id *)&self->_rowsShowingAllParticipants, 0);
  objc_storeStrong((id *)&self->_busyParticipants, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_destroyWeak((id *)&self->_event);
}

@end
