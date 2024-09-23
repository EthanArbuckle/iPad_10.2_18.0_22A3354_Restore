@implementation EKUIInviteesViewAlternativeTimeSection

- (EKUIInviteesViewAlternativeTimeSection)init
{
  EKUIInviteesViewAlternativeTimeSection *v2;
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKUIInviteesViewAlternativeTimeSection;
  v2 = -[EKUIInviteesViewAlternativeTimeSection init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    -[EKUIInviteesViewAlternativeTimeSection setRowsShowingAllParticipants:](v2, "setRowsShowingAllParticipants:", v3);

  }
  return v2;
}

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
  return -[EKUIInviteesViewAlternativeTimeSection numberOfRows](self, "numberOfRows") != 0;
}

- (unint64_t)numberOfRows
{
  unint64_t v3;
  _BOOL4 v5;
  unint64_t v6;

  v3 = -[EKUIInviteesViewAlternativeTimeSection _numberOfTimeSlotsShown](self, "_numberOfTimeSlotsShown");
  if (-[EKUIInviteesViewAlternativeTimeSection initialSearchInProgress](self, "initialSearchInProgress"))
    return v3 + 1;
  v5 = -[EKUIInviteesViewAlternativeTimeSection searchExhausted](self, "searchExhausted");
  if (v3)
    v6 = v3 + 1;
  else
    v6 = 0;
  if (v5)
    return v3 + 1;
  else
    return v6;
}

- (id)cellForIndexPath:(id)a3 inTableView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _BOOL8 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v28[4];
  id v29[2];
  _QWORD v30[4];
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(v6, "row");
  if (-[EKUIInviteesViewAlternativeTimeSection _isValidRow:](self, "_isValidRow:", v8))
  {
    if (-[EKUIInviteesViewAlternativeTimeSection _isConflictSearchRow:](self, "_isConflictSearchRow:", v8))
    {
      -[EKUIInviteesViewAlternativeTimeSection cachedConflictSearchCellReuseIdentifier](self, "cachedConflictSearchCellReuseIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v9, v6);
      v10 = (id)objc_claimAutoreleasedReturnValue();

      if (-[EKUIInviteesViewAlternativeTimeSection initialSearchInProgress](self, "initialSearchInProgress"))
      {
        objc_msgSend(v10, "setInitialSearchInProgressState");
      }
      else if (-[EKUIInviteesViewAlternativeTimeSection searchExhausted](self, "searchExhausted"))
      {
        objc_msgSend(v10, "setNoAvailableTimesStateWithNumberOfExistingTimes:hasError:", -[EKUIInviteesViewAlternativeTimeSection _numberOfTimeSlotsShown](self, "_numberOfTimeSlotsShown"), -[EKUIInviteesViewAlternativeTimeSection searcherHasError](self, "searcherHasError"));
      }
      else if (-[EKUIInviteesViewAlternativeTimeSection availabilityRequestInProgress](self, "availabilityRequestInProgress"))
      {
        objc_msgSend(v10, "setAvailabilityRequestInProgressState");
      }
      else
      {
        objc_msgSend(v10, "setShowMoreState");
      }
    }
    else
    {
      -[EKUIInviteesViewAlternativeTimeSection cachedTimeCellReuseIdentifier](self, "cachedTimeCellReuseIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v16, v6);
      v10 = (id)objc_claimAutoreleasedReturnValue();

      objc_initWeak((id *)buf, self);
      v17 = MEMORY[0x1E0C809B0];
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __71__EKUIInviteesViewAlternativeTimeSection_cellForIndexPath_inTableView___block_invoke;
      v30[3] = &unk_1E601AEB0;
      objc_copyWeak(&v31, (id *)buf);
      objc_msgSend(v10, "setShowPreviewOfEventAtTime:", v30);
      v28[1] = 3221225472;
      v28[2] = __71__EKUIInviteesViewAlternativeTimeSection_cellForIndexPath_inTableView___block_invoke_2;
      v28[3] = &unk_1E6018A20;
      v28[0] = v17;
      objc_copyWeak(v29, (id *)buf);
      v29[1] = v8;
      objc_msgSend(v10, "setShowAllConflictedParticipantsTapped:", v28);
      -[EKUIInviteesViewAlternativeTimeSection rowsShowingAllParticipants](self, "rowsShowingAllParticipants");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "containsObject:", v19);

      if (-[EKUIInviteesViewAlternativeTimeSection hasCheckedRow](self, "hasCheckedRow"))
        v21 = v8 == (void *)-[EKUIInviteesViewAlternativeTimeSection lastCheckedRow](self, "lastCheckedRow");
      else
        v21 = 0;
      -[EKUIInviteesViewAlternativeTimeSection _alternativeTimeAtIndex:](self, "_alternativeTimeAtIndex:", v8);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "startDate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "endDate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKUIInviteesViewAlternativeTimeSection timeZone](self, "timeZone");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "conflictedParticipants");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "updateWithStartDate:endDate:timeZone:busyParticipants:showAllParticipants:checked:", v23, v24, v25, v26, v20, v21);

      objc_destroyWeak(v29);
      objc_destroyWeak(&v31);
      objc_destroyWeak((id *)buf);
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
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[EKUIInviteesViewAlternativeTimeSection numberOfRows](self, "numberOfRows"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v33 = v14;
      v34 = 2112;
      v35 = v15;
      _os_log_impl(&dword_1AF84D000, v13, OS_LOG_TYPE_ERROR, "A cell was requested for a nonexistent row.  Giving back a fresh cell.  Row: [%@].  Number of rows: [%@]", buf, 0x16u);

    }
    v10 = objc_alloc_init(-[EKUIInviteesViewAlternativeTimeSection customTimeCellClass](self, "customTimeCellClass"));
  }

  return v10;
}

void __71__EKUIInviteesViewAlternativeTimeSection_cellForIndexPath_inTableView___block_invoke(uint64_t a1, void *a2, void *a3)
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

void __71__EKUIInviteesViewAlternativeTimeSection_cellForIndexPath_inTableView___block_invoke_2(uint64_t a1)
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
  objc_class *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  v5 = -[EKUIInviteesViewAlternativeTimeSection customTimeCellClass](self, "customTimeCellClass");
  v6 = objc_alloc(MEMORY[0x1E0CB3940]);
  NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[EKUIInviteesViewAlternativeTimeSection reuseIdentifierVersion](self, "reuseIdentifierVersion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("%@-%@"), v7, v8);
  -[EKUIInviteesViewAlternativeTimeSection setCachedTimeCellReuseIdentifier:](self, "setCachedTimeCellReuseIdentifier:", v9);

  -[EKUIInviteesViewAlternativeTimeSection cachedTimeCellReuseIdentifier](self, "cachedTimeCellReuseIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", v5, v10);

  v11 = (objc_class *)objc_opt_class();
  v12 = objc_alloc(MEMORY[0x1E0CB3940]);
  NSStringFromClass(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[EKUIInviteesViewAlternativeTimeSection reuseIdentifierVersion](self, "reuseIdentifierVersion"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v12, "initWithFormat:", CFSTR("%@-%@"), v13, v14);
  -[EKUIInviteesViewAlternativeTimeSection setCachedConflictSearchCellReuseIdentifier:](self, "setCachedConflictSearchCellReuseIdentifier:", v15);

  -[EKUIInviteesViewAlternativeTimeSection cachedConflictSearchCellReuseIdentifier](self, "cachedConflictSearchCellReuseIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", v11, v16);

  -[EKUIInviteesViewAlternativeTimeSection setReuseIdentifierVersion:](self, "setReuseIdentifierVersion:", -[EKUIInviteesViewAlternativeTimeSection reuseIdentifierVersion](self, "reuseIdentifierVersion") + 1);
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
  if (!-[EKUIInviteesViewAlternativeTimeSection _isValidRow:](self, "_isValidRow:", v4))
  {
    v6 = (void *)kEKUILogInviteesHandle;
    v5 = os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR);
    if (!v5)
      return v5;
    v7 = (void *)MEMORY[0x1E0CB37E8];
    v8 = v6;
    objc_msgSend(v7, "numberWithInteger:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v9;
    _os_log_impl(&dword_1AF84D000, v8, OS_LOG_TYPE_ERROR, "There is no row with index [%@].  Will not determine if row can be selected.", (uint8_t *)&v11, 0xCu);

LABEL_8:
    LOBYTE(v5) = 0;
    return v5;
  }
  if (!-[EKUIInviteesViewAlternativeTimeSection _isConflictSearchRow:](self, "_isConflictSearchRow:", v4))
  {
    LOBYTE(v5) = 1;
    return v5;
  }
  if (-[EKUIInviteesViewAlternativeTimeSection availabilityRequestInProgress](self, "availabilityRequestInProgress")
    || -[EKUIInviteesViewAlternativeTimeSection searchExhausted](self, "searchExhausted"))
  {
    goto LABEL_8;
  }
  LOBYTE(v5) = !-[EKUIInviteesViewAlternativeTimeSection initialSearchInProgress](self, "initialSearchInProgress");
  return v5;
}

- (void)selectRow:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD);
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  void (**v22)(_QWORD, _QWORD);
  int v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "row");
  if (-[EKUIInviteesViewAlternativeTimeSection _isValidRow:](self, "_isValidRow:", objc_msgSend(v4, "row")))
  {
    if (-[EKUIInviteesViewAlternativeTimeSection _isConflictSearchRow:](self, "_isConflictSearchRow:", v5))
    {
      -[EKUIInviteesViewAlternativeTimeSection alternativeTimes](self, "alternativeTimes");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");

      v8 = -[EKUIInviteesViewAlternativeTimeSection maximumNumberOfTimeSlotsToShow](self, "maximumNumberOfTimeSlotsToShow");
      v9 = v8 + 10;
      -[EKUIInviteesViewAlternativeTimeSection setMaximumNumberOfTimeSlotsToShow:](self, "setMaximumNumberOfTimeSlotsToShow:", v8 + 10);
      if (v7 < v8 + 10)
      {
        -[EKUIInviteesViewAlternativeTimeSection setAvailabilityRequestInProgress:](self, "setAvailabilityRequestInProgress:", 1);
        -[EKUIInviteesViewAlternativeTimeSection searchForMoreTimes](self, "searchForMoreTimes");
      }
      -[EKUIInviteesViewAlternativeTimeSection tableViewCellHook](self, "tableViewCellHook");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        -[EKUIInviteesViewAlternativeTimeSection tableViewCellHook](self, "tableViewCellHook");
        v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v11[2](v11, v5);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7 < v9)
          objc_msgSend(v12, "setAvailabilityRequestInProgressState");

      }
      else
      {
        v17 = kEKUILogInviteesHandle;
        if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v23) = 0;
          _os_log_impl(&dword_1AF84D000, v17, OS_LOG_TYPE_ERROR, " No 'tableViewCellHook' callback found.  Will not invoke.", (uint8_t *)&v23, 2u);
        }
      }
      -[EKUIInviteesViewAlternativeTimeSection showMoreAlternativeTimesTapped](self, "showMoreAlternativeTimesTapped");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        if (v7 < v9)
          v9 = v7;
        if (v9 <= v8)
        {
          v19 = 0;
        }
        else
        {
          v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          if ((uint64_t)v8 < (uint64_t)v9)
          {
            do
            {
              v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", v8);
              objc_msgSend(v19, "addObject:", v20);

              ++v8;
            }
            while (v9 != v8);
          }
        }
        -[EKUIInviteesViewAlternativeTimeSection showMoreAlternativeTimesTapped](self, "showMoreAlternativeTimesTapped");
        v22 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, id))v22)[2](v22, v19);

      }
      else
      {
        v21 = kEKUILogInviteesHandle;
        if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v23) = 0;
          _os_log_impl(&dword_1AF84D000, v21, OS_LOG_TYPE_ERROR, " No 'showMoreAlternativeTimesTapped' callback found.  Will not invoke.", (uint8_t *)&v23, 2u);
        }
      }
    }
    else
    {
      -[EKUIInviteesViewAlternativeTimeSection setHasCheckedRow:](self, "setHasCheckedRow:", 1);
      -[EKUIInviteesViewAlternativeTimeSection setLastCheckedRow:](self, "setLastCheckedRow:", v5);
    }
  }
  else
  {
    v13 = (void *)kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
    {
      v14 = (void *)MEMORY[0x1E0CB37E8];
      v15 = v13;
      objc_msgSend(v14, "numberWithInteger:", v5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138412290;
      v24 = v16;
      _os_log_impl(&dword_1AF84D000, v15, OS_LOG_TYPE_ERROR, "There is no row with index [%@].  Will not select a row.", (uint8_t *)&v23, 0xCu);

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
  -[EKUIInviteesViewAlternativeTimeSection setHasCheckedRow:](self, "setHasCheckedRow:", 0);
  -[EKUIInviteesViewAlternativeTimeSection setLastCheckedRow:](self, "setLastCheckedRow:", 0);
}

- (BOOL)injectNewRowsBeforeLastExistingRow
{
  return 1;
}

- (void)availabilitySearcherChangedState:(int64_t)a3
{
  void *v4;
  unint64_t v5;
  void (**v6)(_QWORD, _QWORD);
  NSObject *v7;
  const char *v8;
  unint64_t v9;
  void (**v10)(_QWORD, _QWORD);
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  void (**v17)(_QWORD, _QWORD);
  void *v18;
  id v19;
  uint8_t buf[4];
  EKUIInviteesViewAlternativeTimeSection *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 0:
      -[EKUIInviteesViewAlternativeTimeSection setAlternativeTimes:](self, "setAlternativeTimes:", 0);
      -[EKUIInviteesViewAlternativeTimeSection setHasCheckedRow:](self, "setHasCheckedRow:", 0);
      -[EKUIInviteesViewAlternativeTimeSection setLastCheckedRow:](self, "setLastCheckedRow:", 0);
      -[EKUIInviteesViewAlternativeTimeSection rowsShowingAllParticipants](self, "rowsShowingAllParticipants");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "removeAllObjects");

      -[EKUIInviteesViewAlternativeTimeSection setAvailabilityRequestInProgress:](self, "setAvailabilityRequestInProgress:", 0);
      -[EKUIInviteesViewAlternativeTimeSection setMaximumNumberOfTimeSlotsToShow:](self, "setMaximumNumberOfTimeSlotsToShow:", 0);
      -[EKUIInviteesViewAlternativeTimeSection setSearchExhausted:](self, "setSearchExhausted:", 0);
      -[EKUIInviteesViewAlternativeTimeSection setInitialSearchInProgress:](self, "setInitialSearchInProgress:", 0);
      -[EKUIInviteesViewAlternativeTimeSection setSearcherHasError:](self, "setSearcherHasError:", 0);
      return;
    case 1:
      -[EKUIInviteesViewAlternativeTimeSection setSearcherHasError:](self, "setSearcherHasError:", 0);
      -[EKUIInviteesViewAlternativeTimeSection setMaximumNumberOfTimeSlotsToShow:](self, "setMaximumNumberOfTimeSlotsToShow:", -[EKUIInviteesViewAlternativeTimeSection initialNumberOfTimeSlotsToShow](self, "initialNumberOfTimeSlotsToShow"));
      -[EKUIInviteesViewAlternativeTimeSection setInitialSearchInProgress:](self, "setInitialSearchInProgress:", 1);
      v5 = -[EKUIInviteesViewAlternativeTimeSection numberOfRows](self, "numberOfRows") - 1;
      -[EKUIInviteesViewAlternativeTimeSection tableViewCellHook](self, "tableViewCellHook");
      v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v6[2](v6, v5);
      v19 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "setInitialSearchInProgressState");
      goto LABEL_8;
    case 2:
      -[EKUIInviteesViewAlternativeTimeSection setSearcherHasError:](self, "setSearcherHasError:", 0);
      if (-[EKUIInviteesViewAlternativeTimeSection searchExhausted](self, "searchExhausted"))
      {
        v7 = kEKUILogInviteesHandle;
        if (!os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
          return;
        *(_DWORD *)buf = 138412290;
        v21 = self;
        v8 = "Search has been exhausted.  Will not update [%@]";
LABEL_12:
        _os_log_impl(&dword_1AF84D000, v7, OS_LOG_TYPE_DEBUG, v8, buf, 0xCu);
        return;
      }
      if (-[EKUIInviteesViewAlternativeTimeSection searchingForMoreTimes](self, "searchingForMoreTimes"))
      {
        v7 = kEKUILogInviteesHandle;
        if (!os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
          return;
        *(_DWORD *)buf = 138412290;
        v21 = self;
        v8 = "Still searching for more times.  Will not update [%@]";
        goto LABEL_12;
      }
      if (-[EKUIInviteesViewAlternativeTimeSection availabilityRequestInProgress](self, "availabilityRequestInProgress")|| -[EKUIInviteesViewAlternativeTimeSection initialSearchInProgress](self, "initialSearchInProgress"))
      {
        -[EKUIInviteesViewAlternativeTimeSection setInitialSearchInProgress:](self, "setInitialSearchInProgress:", 0);
        -[EKUIInviteesViewAlternativeTimeSection setAvailabilityRequestInProgress:](self, "setAvailabilityRequestInProgress:", 0);
        -[EKUIInviteesViewAlternativeTimeSection alternativeTimes](self, "alternativeTimes");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v11;
        if (v11)
          v12 = objc_msgSend(v11, "count");
        else
          v12 = 0;
        -[EKUIInviteesViewAlternativeTimeSection searcherTimeSlots](self, "searcherTimeSlots");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
          v15 = objc_msgSend(v13, "count");
        else
          v15 = 0;
        -[EKUIInviteesViewAlternativeTimeSection setAlternativeTimes:](self, "setAlternativeTimes:", v14);
        v16 = -[EKUIInviteesViewAlternativeTimeSection numberOfRows](self, "numberOfRows") - 1;
        -[EKUIInviteesViewAlternativeTimeSection tableViewCellHook](self, "tableViewCellHook");
        v17 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v17[2](v17, v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12 == v15)
        {
          -[EKUIInviteesViewAlternativeTimeSection setSearchExhausted:](self, "setSearchExhausted:", 1);
          objc_msgSend(v18, "setNoAvailableTimesStateWithNumberOfExistingTimes:hasError:", v12, 0);
        }
        else
        {
          objc_msgSend(v18, "setShowMoreState");
        }

LABEL_8:
      }
      return;
    case 3:
      -[EKUIInviteesViewAlternativeTimeSection setSearcherHasError:](self, "setSearcherHasError:", 1);
      -[EKUIInviteesViewAlternativeTimeSection setInitialSearchInProgress:](self, "setInitialSearchInProgress:", 0);
      -[EKUIInviteesViewAlternativeTimeSection setAvailabilityRequestInProgress:](self, "setAvailabilityRequestInProgress:", 0);
      -[EKUIInviteesViewAlternativeTimeSection setSearchExhausted:](self, "setSearchExhausted:", 1);
      v9 = -[EKUIInviteesViewAlternativeTimeSection numberOfRows](self, "numberOfRows") - 1;
      -[EKUIInviteesViewAlternativeTimeSection tableViewCellHook](self, "tableViewCellHook");
      v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v10[2](v10, v9);
      v19 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "setNoAvailableTimesStateWithNumberOfExistingTimes:hasError:", 0, 1);
      goto LABEL_8;
    default:
      return;
  }
}

- (void)refreshCellsAfterStateChange
{
  unint64_t v3;
  void (**v4)(_QWORD, _QWORD);
  id v5;

  v3 = -[EKUIInviteesViewAlternativeTimeSection numberOfRows](self, "numberOfRows") - 1;
  -[EKUIInviteesViewAlternativeTimeSection tableViewCellHook](self, "tableViewCellHook");
  v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v4[2](v4, v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (-[EKUIInviteesViewAlternativeTimeSection initialSearchInProgress](self, "initialSearchInProgress"))
  {
    objc_msgSend(v5, "setInitialSearchInProgressState");
  }
  else if (-[EKUIInviteesViewAlternativeTimeSection searchExhausted](self, "searchExhausted"))
  {
    objc_msgSend(v5, "setNoAvailableTimesStateWithNumberOfExistingTimes:hasError:", -[EKUIInviteesViewAlternativeTimeSection _numberOfTimeSlotsShown](self, "_numberOfTimeSlotsShown"), -[EKUIInviteesViewAlternativeTimeSection searcherHasError](self, "searcherHasError"));
  }
  else if (-[EKUIInviteesViewAlternativeTimeSection availabilityRequestInProgress](self, "availabilityRequestInProgress"))
  {
    objc_msgSend(v5, "setAvailabilityRequestInProgressState");
  }
  else
  {
    objc_msgSend(v5, "setShowMoreState");
  }

}

- (unint64_t)initialNumberOfTimeSlotsToShow
{
  NSObject *v3;
  int v5;
  const char *v6;
  __int16 v7;
  EKUIInviteesViewAlternativeTimeSection *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
  {
    v5 = 136315394;
    v6 = "-[EKUIInviteesViewAlternativeTimeSection initialNumberOfTimeSlotsToShow]";
    v7 = 2112;
    v8 = self;
    _os_log_impl(&dword_1AF84D000, v3, OS_LOG_TYPE_ERROR, "A subclass has not overridden this method, which must be overridden: [%s].  Subclass instance: [%@]", (uint8_t *)&v5, 0x16u);
  }
  return 0;
}

- (NSArray)searcherTimeSlots
{
  NSObject *v3;
  int v5;
  const char *v6;
  __int16 v7;
  EKUIInviteesViewAlternativeTimeSection *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
  {
    v5 = 136315394;
    v6 = "-[EKUIInviteesViewAlternativeTimeSection searcherTimeSlots]";
    v7 = 2112;
    v8 = self;
    _os_log_impl(&dword_1AF84D000, v3, OS_LOG_TYPE_ERROR, "A subclass has not overridden this method, which must be overridden: [%s].  Subclass instance: [%@]", (uint8_t *)&v5, 0x16u);
  }
  return 0;
}

- (Class)customTimeCellClass
{
  NSObject *v3;
  int v5;
  const char *v6;
  __int16 v7;
  EKUIInviteesViewAlternativeTimeSection *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
  {
    v5 = 136315394;
    v6 = "-[EKUIInviteesViewAlternativeTimeSection customTimeCellClass]";
    v7 = 2112;
    v8 = self;
    _os_log_impl(&dword_1AF84D000, v3, OS_LOG_TYPE_ERROR, "A subclass has not overridden this method, which must be overridden: [%s].  Subclass instance: [%@]", (uint8_t *)&v5, 0x16u);
  }
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)searchingForMoreTimes
{
  NSObject *v3;
  int v5;
  const char *v6;
  __int16 v7;
  EKUIInviteesViewAlternativeTimeSection *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
  {
    v5 = 136315394;
    v6 = "-[EKUIInviteesViewAlternativeTimeSection searchingForMoreTimes]";
    v7 = 2112;
    v8 = self;
    _os_log_impl(&dword_1AF84D000, v3, OS_LOG_TYPE_ERROR, "A subclass has not overridden this method, which must be overridden: [%s].  Subclass instance: [%@]", (uint8_t *)&v5, 0x16u);
  }
  return 0;
}

- (void)searchForMoreTimes
{
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  EKUIInviteesViewAlternativeTimeSection *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[EKUIInviteesViewAlternativeTimeSection searchForMoreTimes]";
    v6 = 2112;
    v7 = self;
    _os_log_impl(&dword_1AF84D000, v3, OS_LOG_TYPE_ERROR, "A subclass has not overridden this method, which must be overridden: [%s].  Subclass instance: [%@]", (uint8_t *)&v4, 0x16u);
  }
}

- (void)setHasCheckedRow:(BOOL)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void (**v12)(_QWORD, _QWORD);
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  EKUIInviteesViewAlternativeTimeSection *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (void *)kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    v6 = v5;
    CalBooleanAsString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412546;
    v15 = v7;
    v16 = 2112;
    v17 = self;
    _os_log_impl(&dword_1AF84D000, v6, OS_LOG_TYPE_DEBUG, "Setting 'hasCheckedRow' to [%@] in section [%@]", (uint8_t *)&v14, 0x16u);

  }
  self->_hasCheckedRow = a3;
  if (!a3)
  {
    -[EKUIInviteesViewAlternativeTimeSection tableViewCellHook](self, "tableViewCellHook");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = -[EKUIInviteesViewAlternativeTimeSection _numberOfTimeSlotsShown](self, "_numberOfTimeSlotsShown");
      if (v9 >= 1)
      {
        v10 = v9;
        for (i = 0; i != v10; ++i)
        {
          -[EKUIInviteesViewAlternativeTimeSection tableViewCellHook](self, "tableViewCellHook");
          v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          v12[2](v12, i);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "setChecked:", 0);
        }
      }
    }
  }
}

- (void)setLastCheckedRow:(int64_t)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int64_t lastCheckedRow;
  void *v10;
  void (**v11)(_QWORD, _QWORD);
  void *v12;
  void (**v13)(_QWORD, _QWORD);
  void *v14;
  void *v15;
  void *v16;
  void (**v17)(_QWORD, _QWORD, _QWORD);
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  EKUIInviteesViewAlternativeTimeSection *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = (void *)kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    v7 = v5;
    objc_msgSend(v6, "numberWithInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138412546;
    v25 = v8;
    v26 = 2112;
    v27 = self;
    _os_log_impl(&dword_1AF84D000, v7, OS_LOG_TYPE_DEBUG, "Setting last checked row to [%@] in section [%@]", (uint8_t *)&v24, 0x16u);

  }
  lastCheckedRow = self->_lastCheckedRow;
  self->_lastCheckedRow = a3;
  if (-[EKUIInviteesViewAlternativeTimeSection hasCheckedRow](self, "hasCheckedRow"))
  {
    if (-[EKUIInviteesViewAlternativeTimeSection _isValidRow:](self, "_isValidRow:", a3))
    {
      -[EKUIInviteesViewAlternativeTimeSection tableViewCellHook](self, "tableViewCellHook");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        -[EKUIInviteesViewAlternativeTimeSection tableViewCellHook](self, "tableViewCellHook");
        v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v11[2](v11, lastCheckedRow);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "setChecked:", 0);
        -[EKUIInviteesViewAlternativeTimeSection tableViewCellHook](self, "tableViewCellHook");
        v13 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v13[2](v13, a3);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "setChecked:", 1);
        objc_msgSend(v14, "setSelected:animated:", 0, 1);

      }
      -[EKUIInviteesViewAlternativeTimeSection newTimeChosen](self, "newTimeChosen");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        -[EKUIInviteesViewAlternativeTimeSection _alternativeTimeAtIndex:](self, "_alternativeTimeAtIndex:", a3);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          -[EKUIInviteesViewAlternativeTimeSection newTimeChosen](self, "newTimeChosen");
          v17 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "startDate");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "endDate");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *, void *))v17)[2](v17, v18, v19);

        }
      }
    }
    else
    {
      v20 = (void *)kEKUILogInviteesHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
      {
        v21 = (void *)MEMORY[0x1E0CB37E8];
        v22 = v20;
        objc_msgSend(v21, "numberWithInteger:", a3);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138412290;
        v25 = v23;
        _os_log_impl(&dword_1AF84D000, v22, OS_LOG_TYPE_ERROR, "There is no row with index [%@].  Will not 'set last checked row' to its row value.", (uint8_t *)&v24, 0xCu);

      }
    }
  }
}

- (BOOL)_isValidRow:(int64_t)a3
{
  return (a3 & 0x8000000000000000) == 0
      && -[EKUIInviteesViewAlternativeTimeSection numberOfRows](self, "numberOfRows") > a3;
}

- (BOOL)_isConflictSearchRow:(int64_t)a3
{
  return -[EKUIInviteesViewAlternativeTimeSection numberOfRows](self, "numberOfRows") - 1 == a3;
}

- (unint64_t)_numberOfTimeSlotsShown
{
  void *v3;
  void *v4;
  unint64_t v5;
  unint64_t result;

  -[EKUIInviteesViewAlternativeTimeSection alternativeTimes](self, "alternativeTimes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[EKUIInviteesViewAlternativeTimeSection alternativeTimes](self, "alternativeTimes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

  }
  else
  {
    v5 = 0;
  }

  result = -[EKUIInviteesViewAlternativeTimeSection maximumNumberOfTimeSlotsToShow](self, "maximumNumberOfTimeSlotsToShow");
  if (v5 < result)
    return v5;
  return result;
}

- (id)_alternativeTimeAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;

  if (-[EKUIInviteesViewAlternativeTimeSection _numberOfTimeSlotsShown](self, "_numberOfTimeSlotsShown") <= a3)
  {
    v6 = 0;
  }
  else
  {
    -[EKUIInviteesViewAlternativeTimeSection alternativeTimes](self, "alternativeTimes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)showMoreAlternativeTimesTapped
{
  return self->_showMoreAlternativeTimesTapped;
}

- (void)setShowMoreAlternativeTimesTapped:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
  objc_storeStrong((id *)&self->_timeZone, a3);
}

- (NSString)cachedTimeCellReuseIdentifier
{
  return self->_cachedTimeCellReuseIdentifier;
}

- (void)setCachedTimeCellReuseIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_cachedTimeCellReuseIdentifier, a3);
}

- (NSString)cachedConflictSearchCellReuseIdentifier
{
  return self->_cachedConflictSearchCellReuseIdentifier;
}

- (void)setCachedConflictSearchCellReuseIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_cachedConflictSearchCellReuseIdentifier, a3);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)newTimeChosen
{
  return self->_newTimeChosen;
}

- (void)setNewTimeChosen:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)showPreviewOfEventAtTime
{
  return self->_showPreviewOfEventAtTime;
}

- (void)setShowPreviewOfEventAtTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSMutableSet)rowsShowingAllParticipants
{
  return self->_rowsShowingAllParticipants;
}

- (void)setRowsShowingAllParticipants:(id)a3
{
  objc_storeStrong((id *)&self->_rowsShowingAllParticipants, a3);
}

- (NSArray)alternativeTimes
{
  return self->_alternativeTimes;
}

- (void)setAlternativeTimes:(id)a3
{
  objc_storeStrong((id *)&self->_alternativeTimes, a3);
}

- (int64_t)lastCheckedRow
{
  return self->_lastCheckedRow;
}

- (BOOL)hasCheckedRow
{
  return self->_hasCheckedRow;
}

- (BOOL)availabilityRequestInProgress
{
  return self->_availabilityRequestInProgress;
}

- (void)setAvailabilityRequestInProgress:(BOOL)a3
{
  self->_availabilityRequestInProgress = a3;
}

- (unint64_t)maximumNumberOfTimeSlotsToShow
{
  return self->_maximumNumberOfTimeSlotsToShow;
}

- (void)setMaximumNumberOfTimeSlotsToShow:(unint64_t)a3
{
  self->_maximumNumberOfTimeSlotsToShow = a3;
}

- (EKInviteeAlternativeTimeSearcher)availabilitySearcher
{
  return self->_availabilitySearcher;
}

- (void)setAvailabilitySearcher:(id)a3
{
  objc_storeStrong((id *)&self->_availabilitySearcher, a3);
}

- (BOOL)initialSearchInProgress
{
  return self->_initialSearchInProgress;
}

- (void)setInitialSearchInProgress:(BOOL)a3
{
  self->_initialSearchInProgress = a3;
}

- (BOOL)searchExhausted
{
  return self->_searchExhausted;
}

- (void)setSearchExhausted:(BOOL)a3
{
  self->_searchExhausted = a3;
}

- (BOOL)searcherHasError
{
  return self->_searcherHasError;
}

- (void)setSearcherHasError:(BOOL)a3
{
  self->_searcherHasError = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availabilitySearcher, 0);
  objc_storeStrong((id *)&self->_alternativeTimes, 0);
  objc_storeStrong((id *)&self->_rowsShowingAllParticipants, 0);
  objc_storeStrong(&self->_showPreviewOfEventAtTime, 0);
  objc_storeStrong(&self->_newTimeChosen, 0);
  objc_storeStrong(&self->_tableViewCellHook, 0);
  objc_storeStrong((id *)&self->_cachedConflictSearchCellReuseIdentifier, 0);
  objc_storeStrong((id *)&self->_cachedTimeCellReuseIdentifier, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong(&self->_showMoreAlternativeTimesTapped, 0);
}

@end
