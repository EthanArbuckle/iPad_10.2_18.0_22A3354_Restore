@implementation EKUIInviteesViewAvailabilitySection

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
  void *v3;
  void *v4;
  uint64_t v5;
  char v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CA9FE8];
  -[EKUIInviteesViewAvailabilitySection event](self, "event");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "availabilityPanelVisibilityForEvent:", v4);

  if (-[EKUIInviteesViewAvailabilitySection isForAttendeeProposedTime](self, "isForAttendeeProposedTime"))
  {
    v6 = 1;
  }
  else
  {
    -[EKUIInviteesViewAvailabilitySection event](self, "event");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "allowsAttendeesModifications");

  }
  if (v5)
    return 0;
  else
    return v6;
}

- (unint64_t)numberOfRows
{
  return 1;
}

- (id)cellForIndexPath:(id)a3 inTableView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[EKUIInviteesViewAvailabilitySection cachedAvailabilityCellReuseIdentifier](self, "cachedAvailabilityCellReuseIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (EKUICatalyst())
  {
    objc_msgSend(v6, "backgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v10);

  }
  return v9;
}

- (BOOL)canSelectRow:(id)a3
{
  return 1;
}

- (void)selectRow:(id)a3
{
  void (**v3)(void);

  -[EKUIInviteesViewAvailabilitySection viewAvailabilityTapped](self, "viewAvailabilityTapped", a3);
  v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v3[2]();

}

- (void)reloadAndRegisterReusableCellsWithTableView:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;

  v4 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = [v4 alloc];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[EKUIInviteesViewAvailabilitySection reuseIdentifierVersion](self, "reuseIdentifierVersion"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("%@-%@"), v8, v9);
  -[EKUIInviteesViewAvailabilitySection setCachedAvailabilityCellReuseIdentifier:](self, "setCachedAvailabilityCellReuseIdentifier:", v10);

  v11 = objc_opt_class();
  -[EKUIInviteesViewAvailabilitySection cachedAvailabilityCellReuseIdentifier](self, "cachedAvailabilityCellReuseIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerClass:forCellReuseIdentifier:", v11, v12);

  v13 = objc_alloc(MEMORY[0x1E0CB3940]);
  v14 = (objc_class *)objc_opt_class();
  NSStringFromClass(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[EKUIInviteesViewAvailabilitySection reuseIdentifierVersion](self, "reuseIdentifierVersion"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR("%@-%@"), v15, v16);
  -[EKUIInviteesViewAvailabilitySection setCachedConflictCellReuseIdentifier:](self, "setCachedConflictCellReuseIdentifier:", v17);

  v18 = objc_opt_class();
  -[EKUIInviteesViewAvailabilitySection cachedConflictCellReuseIdentifier](self, "cachedConflictCellReuseIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerClass:forCellReuseIdentifier:", v18, v19);

  -[EKUIInviteesViewAvailabilitySection setReuseIdentifierVersion:](self, "setReuseIdentifierVersion:", -[EKUIInviteesViewAvailabilitySection reuseIdentifierVersion](self, "reuseIdentifierVersion") + 1);
}

- (BOOL)canEditRow:(id)a3
{
  return 0;
}

- (int64_t)editingStyleForRow:(id)a3
{
  return 1;
}

- (id)titleForDeleteConfirmationButtonForRow:(id)a3
{
  return CFSTR("Not Implemented");
}

- (double)estimatedHeightForRow:(id)a3
{
  return 44.0;
}

- (id)actionsForRow:(id)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)contextMenuDataForIndexPath:(id)a3 interaction:(id)a4
{
  return 0;
}

- (BOOL)supportsContextMenuForIndexPath:(id)a3
{
  return 0;
}

- (BOOL)isForAttendeeProposedTime
{
  return self->_isForAttendeeProposedTime;
}

- (void)setIsForAttendeeProposedTime:(BOOL)a3
{
  self->_isForAttendeeProposedTime = a3;
}

- (id)viewAvailabilityTapped
{
  return self->_viewAvailabilityTapped;
}

- (void)setViewAvailabilityTapped:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (EKEvent)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
  objc_storeStrong((id *)&self->_event, a3);
}

- (BOOL)checked
{
  return self->_checked;
}

- (void)setChecked:(BOOL)a3
{
  self->_checked = a3;
}

- (NSString)cachedCellReuseIdentifier
{
  return self->_cachedCellReuseIdentifier;
}

- (void)setCachedCellReuseIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_cachedCellReuseIdentifier, a3);
}

- (id)tableViewCellHook
{
  return self->_tableViewCellHook;
}

- (void)setTableViewCellHook:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)cachedAvailabilityCellReuseIdentifier
{
  return self->_cachedAvailabilityCellReuseIdentifier;
}

- (void)setCachedAvailabilityCellReuseIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_cachedAvailabilityCellReuseIdentifier, a3);
}

- (NSString)cachedConflictCellReuseIdentifier
{
  return self->_cachedConflictCellReuseIdentifier;
}

- (void)setCachedConflictCellReuseIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_cachedConflictCellReuseIdentifier, a3);
}

- (unint64_t)reuseIdentifierVersion
{
  return self->_reuseIdentifierVersion;
}

- (void)setReuseIdentifierVersion:(unint64_t)a3
{
  self->_reuseIdentifierVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedConflictCellReuseIdentifier, 0);
  objc_storeStrong((id *)&self->_cachedAvailabilityCellReuseIdentifier, 0);
  objc_storeStrong(&self->_tableViewCellHook, 0);
  objc_storeStrong((id *)&self->_cachedCellReuseIdentifier, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong(&self->_viewAvailabilityTapped, 0);
}

@end
