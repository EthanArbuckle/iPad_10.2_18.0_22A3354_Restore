@implementation EKUIInviteesViewOriginalConflictSection

- (EKUIInviteesViewOriginalConflictSection)init
{
  EKUIInviteesViewOriginalConflictSection *v2;
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EKUIInviteesViewOriginalConflictSection;
  v2 = -[EKUIInviteesViewOriginalConflictSection init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    -[EKUIInviteesViewOriginalConflictSection setRowsShowingAllParticipants:](v2, "setRowsShowingAllParticipants:", v3);

    EventKitUIBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Scheduling Conflict"), &stru_1E601DFA8, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewOriginalConflictSection setTitle:](v2, "setTitle:", v5);

  }
  return v2;
}

- (id)debugTitle
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (BOOL)sectionShouldBeShown
{
  return -[EKUIInviteesViewOriginalConflictSection numberOfRows](self, "numberOfRows") != 0;
}

- (unint64_t)numberOfRows
{
  void *v3;
  void *v4;
  unint64_t v5;

  if (!-[EKUIInviteesViewOriginalConflictSection conflictFound](self, "conflictFound"))
    return 0;
  -[EKUIInviteesViewOriginalConflictSection startDate](self, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[EKUIInviteesViewOriginalConflictSection endDate](self, "endDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)cellForIndexPath:(id)a3 inTableView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  EKUIInviteesViewOriginalConflictCell *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  _QWORD v26[4];
  id v27[2];
  _QWORD v28[4];
  id v29;
  _BYTE location[12];
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(v6, "row");
  if (-[EKUIInviteesViewOriginalConflictSection _isValidRow:](self, "_isValidRow:", v8))
  {
    -[EKUIInviteesViewOriginalConflictSection cachedCellReuseIdentifier](self, "cachedCellReuseIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v9, v6);
    v10 = (EKUIInviteesViewOriginalConflictCell *)objc_claimAutoreleasedReturnValue();

    objc_initWeak((id *)location, self);
    v11 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __72__EKUIInviteesViewOriginalConflictSection_cellForIndexPath_inTableView___block_invoke;
    v28[3] = &unk_1E601AEB0;
    objc_copyWeak(&v29, (id *)location);
    -[EKUIInviteesViewTimeSlotCell setShowPreviewOfEventAtTime:](v10, "setShowPreviewOfEventAtTime:", v28);
    v26[0] = v11;
    v26[1] = 3221225472;
    v26[2] = __72__EKUIInviteesViewOriginalConflictSection_cellForIndexPath_inTableView___block_invoke_2;
    v26[3] = &unk_1E6018A20;
    objc_copyWeak(v27, (id *)location);
    v27[1] = v8;
    -[EKUIInviteesViewTimeSlotCell setShowAllConflictedParticipantsTapped:](v10, "setShowAllConflictedParticipantsTapped:", v26);
    -[EKUIInviteesViewOriginalConflictSection rowsShowingAllParticipants](self, "rowsShowingAllParticipants");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "containsObject:", v13);

    -[EKUIInviteesViewOriginalConflictSection busyParticipants](self, "busyParticipants");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewOriginalConflictCell setConflict:](v10, "setConflict:", objc_msgSend(v15, "count") != 0);

    -[EKUIInviteesViewOriginalConflictSection startDate](self, "startDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewOriginalConflictSection endDate](self, "endDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewOriginalConflictSection timeZone](self, "timeZone");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewOriginalConflictSection busyParticipants](self, "busyParticipants");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewTimeSlotCell updateWithStartDate:endDate:timeZone:busyParticipants:showAllParticipants:checked:](v10, "updateWithStartDate:endDate:timeZone:busyParticipants:showAllParticipants:checked:", v16, v17, v18, v19, v14, -[EKUIInviteesViewOriginalConflictSection checked](self, "checked"));

    objc_destroyWeak(v27);
    objc_destroyWeak(&v29);
    objc_destroyWeak((id *)location);
  }
  else
  {
    v20 = (void *)kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
    {
      v21 = (void *)MEMORY[0x1E0CB37E8];
      v22 = v20;
      objc_msgSend(v21, "numberWithInteger:", v8);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[EKUIInviteesViewOriginalConflictSection numberOfRows](self, "numberOfRows"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138412546;
      *(_QWORD *)&location[4] = v23;
      v31 = 2112;
      v32 = v24;
      _os_log_impl(&dword_1AF84D000, v22, OS_LOG_TYPE_ERROR, "A cell was requested for a nonexistent row.  Giving back a fresh cell.  Row: [%@].  Number of rows: [%@]", location, 0x16u);

    }
    v10 = objc_alloc_init(EKUIInviteesViewOriginalConflictCell);
  }

  return v10;
}

void __72__EKUIInviteesViewOriginalConflictSection_cellForIndexPath_inTableView___block_invoke(uint64_t a1, void *a2, void *a3)
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

void __72__EKUIInviteesViewOriginalConflictSection_cellForIndexPath_inTableView___block_invoke_2(uint64_t a1)
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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[EKUIInviteesViewOriginalConflictSection reuseIdentifierVersion](self, "reuseIdentifierVersion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("%@-%@"), v7, v8);
  -[EKUIInviteesViewOriginalConflictSection setCachedCellReuseIdentifier:](self, "setCachedCellReuseIdentifier:", v9);

  -[EKUIInviteesViewOriginalConflictSection cachedCellReuseIdentifier](self, "cachedCellReuseIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", v5, v10);

  -[EKUIInviteesViewOriginalConflictSection setReuseIdentifierVersion:](self, "setReuseIdentifierVersion:", -[EKUIInviteesViewOriginalConflictSection reuseIdentifierVersion](self, "reuseIdentifierVersion") + 1);
}

- (BOOL)canSelectRow:(id)a3
{
  uint64_t v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a3, "row");
  if (-[EKUIInviteesViewOriginalConflictSection _isValidRow:](self, "_isValidRow:", v4))
  {
    LOBYTE(v5) = !-[EKUIInviteesViewOriginalConflictSection checked](self, "checked");
  }
  else
  {
    v6 = (void *)kEKUILogInviteesHandle;
    v5 = os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR);
    if (v5)
    {
      v7 = (void *)MEMORY[0x1E0CB37E8];
      v8 = v6;
      objc_msgSend(v7, "numberWithInteger:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v9;
      _os_log_impl(&dword_1AF84D000, v8, OS_LOG_TYPE_ERROR, "There is no row with index [%@].  Will not determine if row can be selected.", (uint8_t *)&v11, 0xCu);

      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (void)selectRow:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a3, "row");
  if (-[EKUIInviteesViewOriginalConflictSection _isValidRow:](self, "_isValidRow:", v4))
  {
    -[EKUIInviteesViewOriginalConflictSection setChecked:](self, "setChecked:", 1);
  }
  else
  {
    v5 = (void *)kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
    {
      v6 = (void *)MEMORY[0x1E0CB37E8];
      v7 = v5;
      objc_msgSend(v6, "numberWithInteger:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_1AF84D000, v7, OS_LOG_TYPE_ERROR, "There is no row with index [%@].  Will not select a row.", (uint8_t *)&v9, 0xCu);

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
  -[EKUIInviteesViewOriginalConflictSection setChecked:](self, "setChecked:", 0);
}

- (BOOL)injectNewRowsBeforeLastExistingRow
{
  return 0;
}

- (void)availabilitySearcherChangedState:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  if (a3 == 1)
  {
    -[EKUIInviteesViewOriginalConflictSection availabilitySearcher](self, "availabilitySearcher");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "originalStartDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewOriginalConflictSection setStartDate:](self, "setStartDate:", v6);

    -[EKUIInviteesViewOriginalConflictSection availabilitySearcher](self, "availabilitySearcher");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "originalEndDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIInviteesViewOriginalConflictSection setEndDate:](self, "setEndDate:", v8);

    v9 = (void *)MEMORY[0x1E0CAA0E8];
    -[EKUIInviteesViewOriginalConflictSection availabilitySearcher](self, "availabilitySearcher");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "originalConflictedParticipants");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "participantsForSortingWithEKParticipants:", v11);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    -[EKUIInviteesViewOriginalConflictSection setBusyParticipants:](self, "setBusyParticipants:", v12);
    -[EKUIInviteesViewOriginalConflictSection setConflictFound:](self, "setConflictFound:", 1);

  }
  else if (!a3)
  {
    -[EKUIInviteesViewOriginalConflictSection setStartDate:](self, "setStartDate:");
    -[EKUIInviteesViewOriginalConflictSection setEndDate:](self, "setEndDate:", 0);
    -[EKUIInviteesViewOriginalConflictSection setChecked:](self, "setChecked:", 1);
    -[EKUIInviteesViewOriginalConflictSection setBusyParticipants:](self, "setBusyParticipants:", 0);
    -[EKUIInviteesViewOriginalConflictSection rowsShowingAllParticipants](self, "rowsShowingAllParticipants");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeAllObjects");

    -[EKUIInviteesViewOriginalConflictSection setConflictFound:](self, "setConflictFound:", 0);
  }
}

- (void)setChecked:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  id v11;

  v3 = a3;
  self->_checked = a3;
  -[EKUIInviteesViewOriginalConflictSection tableViewCellHook](self, "tableViewCellHook");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[EKUIInviteesViewOriginalConflictSection tableViewCellHook](self, "tableViewCellHook");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setChecked:", v3);
    objc_msgSend(v7, "setSelected:", 0);

  }
  if (v3)
  {
    -[EKUIInviteesViewOriginalConflictSection newTimeChosen](self, "newTimeChosen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[EKUIInviteesViewOriginalConflictSection startDate](self, "startDate");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      -[EKUIInviteesViewOriginalConflictSection endDate](self, "endDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        if (v9)
        {
          -[EKUIInviteesViewOriginalConflictSection newTimeChosen](self, "newTimeChosen");
          v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, id, void *))v10)[2](v10, v11, v9);

        }
      }

    }
  }
}

- (BOOL)_isValidRow:(int64_t)a3
{
  return (a3 & 0x8000000000000000) == 0
      && -[EKUIInviteesViewOriginalConflictSection numberOfRows](self, "numberOfRows") > a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
  objc_storeStrong((id *)&self->_timeZone, a3);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
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

- (BOOL)checked
{
  return self->_checked;
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)newTimeChosen
{
  return self->_newTimeChosen;
}

- (void)setNewTimeChosen:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (id)showPreviewOfEventAtTime
{
  return self->_showPreviewOfEventAtTime;
}

- (void)setShowPreviewOfEventAtTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (EKInviteeAlternativeTimeSearcher)availabilitySearcher
{
  return self->_availabilitySearcher;
}

- (void)setAvailabilitySearcher:(id)a3
{
  objc_storeStrong((id *)&self->_availabilitySearcher, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availabilitySearcher, 0);
  objc_storeStrong(&self->_showPreviewOfEventAtTime, 0);
  objc_storeStrong(&self->_newTimeChosen, 0);
  objc_storeStrong(&self->_tableViewCellHook, 0);
  objc_storeStrong((id *)&self->_cachedCellReuseIdentifier, 0);
  objc_storeStrong((id *)&self->_rowsShowingAllParticipants, 0);
  objc_storeStrong((id *)&self->_busyParticipants, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
