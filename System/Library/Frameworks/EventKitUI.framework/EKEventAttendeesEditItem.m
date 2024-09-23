@implementation EKEventAttendeesEditItem

- (EKEventAttendeesEditItem)init
{
  EKEventAttendeesEditItem *v2;
  NSOperationQueue *v3;
  NSOperationQueue *availabilityQueue;
  objc_class *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)EKEventAttendeesEditItem;
  v2 = -[EKEventAttendeesEditItem init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    availabilityQueue = v2->_availabilityQueue;
    v2->_availabilityQueue = v3;

    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSOperationQueue setName:](v2->_availabilityQueue, "setName:", v6);

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[NSOperationQueue cancelAllOperations](self->_availabilityQueue, "cancelAllOperations");
  v3.receiver = self;
  v3.super_class = (Class)EKEventAttendeesEditItem;
  -[EKEventAttendeesEditItem dealloc](&v3, sel_dealloc);
}

- (BOOL)canBeConfiguredForCalendarConstraints:(id)a3
{
  void *v3;
  char v4;

  -[EKEventEditItem event](self, "event", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "allowsAttendeesModifications");

  return v4;
}

- (BOOL)configureForCalendarConstraints:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *searchAccountID;

  v4 = a3;
  objc_msgSend(v4, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "externalID");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  searchAccountID = self->_searchAccountID;
  self->_searchAccountID = v6;

  LOBYTE(self) = -[EKEventAttendeesEditItem canBeConfiguredForCalendarConstraints:](self, "canBeConfiguredForCalendarConstraints:", v4);
  return (char)self;
}

- (unint64_t)onSaveEditorReloadBehavior
{
  return 1;
}

- (BOOL)shouldAppear
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  char v9;
  NSObject *v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  char v48;
  uint8_t buf[4];
  uint64_t v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  -[EKEventEditItem event](self, "event");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "calendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "prohibitsPrivateEventsWithAttendees");

  if (v7 && objc_msgSend(v3, "privacyLevel"))
  {
    v8 = (void *)kEKUILogHandle;
    v9 = 0;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v8;
      *(_DWORD *)buf = 134217984;
      v50 = objc_msgSend(v3, "privacyLevel");
      _os_log_impl(&dword_1AF84D000, v10, OS_LOG_TYPE_DEFAULT, "MissingAttendees: Event is non-standard privacy level %ld", buf, 0xCu);

      v9 = 0;
    }
  }
  else
  {
    v9 = 1;
  }
  objc_msgSend(v3, "calendar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[EKEventAttendeesEditItem canBeConfiguredForCalendarConstraints:](self, "canBeConfiguredForCalendarConstraints:", v11);

  if (!v12)
  {
    v48 = v9;
    objc_msgSend(v3, "calendar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "source");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v15;
      objc_msgSend(v13, "title");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "calendarIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "title");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "sourceIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v50 = (uint64_t)v17;
      v51 = 2114;
      v52 = v18;
      v53 = 2112;
      v54 = v19;
      v55 = 2114;
      v56 = v20;
      _os_log_impl(&dword_1AF84D000, v16, OS_LOG_TYPE_DEFAULT, "MissingAttendees: Event calendar (%@ %{public}@) does not allow attendees (source %@ %{public}@)", buf, 0x2Au);

    }
    v21 = (void *)kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEFAULT))
    {
      v22 = (void *)MEMORY[0x1E0CB37E8];
      v23 = v21;
      objc_msgSend(v22, "numberWithInt:", objc_msgSend(v3, "status") == 3);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v50 = (uint64_t)v24;
      _os_log_impl(&dword_1AF84D000, v23, OS_LOG_TYPE_DEFAULT, "MissingAttendees: Cancelled %@", buf, 0xCu);

    }
    v25 = (void *)kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEFAULT))
    {
      v26 = (void *)MEMORY[0x1E0CB37E8];
      v27 = v25;
      objc_msgSend(v26, "numberWithBool:", objc_msgSend(v3, "isSelfOrganized"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v50 = (uint64_t)v28;
      _os_log_impl(&dword_1AF84D000, v27, OS_LOG_TYPE_DEFAULT, "MissingAttendees: Self Organized %@", buf, 0xCu);

    }
    v29 = (void *)kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEFAULT))
    {
      v30 = (void *)MEMORY[0x1E0CB37E8];
      v31 = v29;
      objc_msgSend(v30, "numberWithBool:", objc_msgSend(v13, "allowsScheduling"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v50 = (uint64_t)v32;
      _os_log_impl(&dword_1AF84D000, v31, OS_LOG_TYPE_DEFAULT, "MissingAttendees: Calendar Allows Scheduling %@", buf, 0xCu);

    }
    v33 = (void *)kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEFAULT))
    {
      v34 = (void *)MEMORY[0x1E0CB37E8];
      v35 = v33;
      objc_msgSend(v14, "constraints");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "numberWithBool:", objc_msgSend(v36, "supportsOutgoingInvitations"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v50 = (uint64_t)v37;
      _os_log_impl(&dword_1AF84D000, v35, OS_LOG_TYPE_DEFAULT, "MissingAttendees: Source Supports Outgoing Invitations %@", buf, 0xCu);

    }
    v38 = (void *)kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEFAULT))
    {
      v39 = (void *)MEMORY[0x1E0CB37E8];
      v40 = v38;
      objc_msgSend(v14, "constraints");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "numberWithBool:", objc_msgSend(v41, "requiresOutgoingInvitationsInDefaultCalendar"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v50 = (uint64_t)v42;
      _os_log_impl(&dword_1AF84D000, v40, OS_LOG_TYPE_DEFAULT, "MissingAttendees: Source Requires Default Outgoing Invitations %@", buf, 0xCu);

    }
    v43 = (void *)kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEFAULT))
    {
      v44 = (void *)MEMORY[0x1E0CB37E8];
      v45 = v43;
      objc_msgSend(v44, "numberWithBool:", objc_msgSend(v13, "isDefaultSchedulingCalendar"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v50 = (uint64_t)v46;
      _os_log_impl(&dword_1AF84D000, v45, OS_LOG_TYPE_DEFAULT, "MissingAttendees: Calendar is Default %@", buf, 0xCu);

    }
    v9 = v48;
  }

  return v9 & v12;
}

- (void)refreshFromCalendarItemAndStore
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  char v8;
  NSObject *v9;
  const char *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v42;
  char *v43;
  id v44;
  _QWORD v45[6];
  id v46[2];
  id location;
  _QWORD aBlock[5];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[8];
  uint8_t *v54;
  uint64_t v55;
  uint64_t v56;
  objc_super v57;
  uint8_t v58[4];
  id v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v57.receiver = self;
  v57.super_class = (Class)EKEventAttendeesEditItem;
  -[EKCalendarItemEditItem refreshFromCalendarItemAndStore](&v57, sel_refreshFromCalendarItemAndStore);
  -[NSOperationQueue cancelAllOperations](self->_availabilityQueue, "cancelAllOperations");
  -[EKEventEditItem event](self, "event");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "calendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "source");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v40, "constraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsAvailabilityRequests");

  objc_msgSend(v42, "attendees");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v5;
  if (!v5)
  {
    if ((v4 & 1) != 0)
    {
LABEL_9:
      v9 = kEKUILogHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        v10 = "There are no attendees associated with this event.  Will not attempt to detect conflicts.";
LABEL_13:
        _os_log_impl(&dword_1AF84D000, v9, OS_LOG_TYPE_DEBUG, v10, buf, 2u);
        goto LABEL_14;
      }
      goto LABEL_14;
    }
LABEL_11:
    v9 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      v10 = "This event's source does not support availability requests.  Will not attempt to detect conflicts.";
      goto LABEL_13;
    }
LABEL_14:
    self->_numberOfConflicts = 0;
    goto LABEL_15;
  }
  v6 = objc_msgSend(v5, "count");
  if ((v4 & 1) == 0)
    goto LABEL_11;
  if (!v6)
    goto LABEL_9;
  v7 = kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF84D000, v7, OS_LOG_TYPE_DEBUG, "Attempting to detect conflicts.", buf, 2u);
  }
  *(_QWORD *)buf = 0;
  v54 = buf;
  v55 = 0x2020000000;
  v56 = 0;
  v44 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if ((objc_msgSend(v42, "isStartDateDirty") & 1) != 0)
    v8 = 1;
  else
    v8 = objc_msgSend(v42, "isEndDateDirty");
  objc_msgSend(v42, "organizer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  objc_msgSend(v42, "attendees");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v49, v60, 16);
  if (!v13)
  {
    v43 = 0;
    goto LABEL_50;
  }
  v43 = 0;
  v14 = *(_QWORD *)v50;
  do
  {
    v15 = 0;
    do
    {
      if (*(_QWORD *)v50 != v14)
        objc_enumerationMutation(v12);
      v16 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v15);
      if (!EKUIAttendeeUtils_ShouldConsiderAttendeeForConflictChecking(v16))
      {
        v17 = (id)kEKUILogHandle;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v16, "URL");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v58 = 138412290;
          v59 = v19;
          _os_log_impl(&dword_1AF84D000, v17, OS_LOG_TYPE_DEBUG, "Attendee will not be considered for conflict checking: [%@]", v58, 0xCu);

        }
        goto LABEL_46;
      }
      if (v11 && objc_msgSend(v11, "isEqualToParticipant:", v16))
      {
        v17 = (id)kEKUILogHandle;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v16, "URL");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v58 = 138412290;
          v59 = v18;
          _os_log_impl(&dword_1AF84D000, v17, OS_LOG_TYPE_DEBUG, "Organizer will not be considered for conflict checking: [%@]", v58, 0xCu);

        }
LABEL_46:

        goto LABEL_42;
      }
      if ((v8 & 1) != 0 || (EKUIAttendeeUtils_AttendeeHasResponded(v16) & 1) == 0)
      {
        objc_msgSend(v16, "URL");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "absoluteString");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = kEKUILogHandle;
        if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v58 = 138412290;
          v59 = v24;
          _os_log_impl(&dword_1AF84D000, v25, OS_LOG_TYPE_DEBUG, "Attendee's conflict status is unknown.  Will issue availability request to determine if there is a conflict.  Attendee's address: [%@]", v58, 0xCu);
        }
        if (v24)
          objc_msgSend(v44, "addObject:", v24);

      }
      else
      {
        v20 = objc_msgSend(v16, "participantStatus");
        v17 = (id)kEKUILogHandle;
        v21 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
        if (v20 != 3)
        {
          if (v21)
          {
            objc_msgSend(v16, "URL");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v58 = 138412290;
            v59 = v26;
            _os_log_impl(&dword_1AF84D000, v17, OS_LOG_TYPE_DEBUG, "Attendee has no conflict.  Attendee's address: [%@]", v58, 0xCu);

          }
          goto LABEL_46;
        }
        if (v21)
        {
          objc_msgSend(v16, "URL");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v58 = 138412290;
          v59 = v22;
          _os_log_impl(&dword_1AF84D000, v17, OS_LOG_TYPE_DEBUG, "Attendee was detected as conflicted.  Attendee's address: [%@]", v58, 0xCu);

        }
        ++v43;
      }
LABEL_42:
      ++v15;
    }
    while (v13 != v15);
    v27 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v49, v60, 16);
    v13 = v27;
  }
  while (v27);
LABEL_50:

  v28 = objc_msgSend(v44, "count");
  v29 = kEKUILogHandle;
  if (v28)
  {
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v58 = 138412290;
      v59 = v44;
      _os_log_impl(&dword_1AF84D000, v29, OS_LOG_TYPE_DEBUG, "Creating an availability request to look up availability for attendees: [%@]", v58, 0xCu);
    }
    v30 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __59__EKEventAttendeesEditItem_refreshFromCalendarItemAndStore__block_invoke;
    aBlock[3] = &unk_1E601AB98;
    aBlock[4] = buf;
    v31 = _Block_copy(aBlock);
    v32 = objc_alloc(MEMORY[0x1E0CAA130]);
    objc_msgSend(v42, "startDate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "endDateUnadjustedForLegacyClients");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)objc_msgSend(v32, "initWithSource:startDate:endDate:ignoredEvent:addresses:resultsBlock:", v40, v33, v34, v42, v44, v31);

    objc_initWeak(&location, v35);
    v45[0] = v30;
    v45[1] = 3221225472;
    v45[2] = __59__EKEventAttendeesEditItem_refreshFromCalendarItemAndStore__block_invoke_16;
    v45[3] = &unk_1E601ABE8;
    objc_copyWeak(v46, &location);
    v46[1] = v43;
    v45[5] = buf;
    v45[4] = self;
    objc_msgSend(v35, "setCompletionBlock:", v45);
    v36 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v58 = 138412290;
      v59 = v35;
      _os_log_impl(&dword_1AF84D000, v36, OS_LOG_TYPE_DEBUG, "Adding availability operation: [%@]", v58, 0xCu);
    }
    -[NSOperationQueue addOperation:](self->_availabilityQueue, "addOperation:", v35);
    objc_destroyWeak(v46);
    objc_destroyWeak(&location);

  }
  else
  {
    v37 = (id)kEKUILogHandle;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v43);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v58 = 138412290;
      v59 = v38;
      _os_log_impl(&dword_1AF84D000, v37, OS_LOG_TYPE_DEBUG, "There are no attendees that have an unknown conflict status.  Will not send an availability request.  Setting number of conflicts to [%@].", v58, 0xCu);

    }
    self->_numberOfConflicts = (int64_t)v43;
  }

  _Block_object_dispose(buf, 8);
LABEL_15:

}

void __59__EKEventAttendeesEditItem_refreshFromCalendarItemAndStore__block_invoke(uint64_t a1, void *a2)
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
  v6[2] = __59__EKEventAttendeesEditItem_refreshFromCalendarItemAndStore__block_invoke_2;
  v6[3] = &unk_1E601A950;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __59__EKEventAttendeesEditItem_refreshFromCalendarItemAndStore__block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __59__EKEventAttendeesEditItem_refreshFromCalendarItemAndStore__block_invoke_3;
  v3[3] = &unk_1E601AB70;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "enumerateKeysAndObjectsUsingBlock:", v3);
}

void __59__EKEventAttendeesEditItem_refreshFromCalendarItemAndStore__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = objc_msgSend(MEMORY[0x1E0CA9FE8], "spansIncludeBusyPeriod:", a3);
  v7 = kEKUILogHandle;
  v8 = os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v8)
    {
      v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_1AF84D000, v7, OS_LOG_TYPE_DEBUG, "Attendee was detected as conflicted after finding out its availability.  Attendee's address: [%@]", (uint8_t *)&v9, 0xCu);
    }
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else if (v8)
  {
    v9 = 138412290;
    v10 = v5;
    _os_log_impl(&dword_1AF84D000, v7, OS_LOG_TYPE_DEBUG, "Attendee was detected as not being conflicted after finding out its availability.  Attendee's address: [%@]", (uint8_t *)&v9, 0xCu);
  }

}

void __59__EKEventAttendeesEditItem_refreshFromCalendarItemAndStore__block_invoke_16(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  char v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  __int128 v11;
  uint64_t v12;
  char v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = kEKUILogHandle;
  v4 = os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG);
  if (WeakRetained)
  {
    if (v4)
    {
      *(_DWORD *)buf = 138412290;
      v15 = WeakRetained;
      _os_log_impl(&dword_1AF84D000, v3, OS_LOG_TYPE_DEBUG, "Availability operation completed: [%@]", buf, 0xCu);
    }
    objc_msgSend(WeakRetained, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(WeakRetained, "isCancelled");
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __59__EKEventAttendeesEditItem_refreshFromCalendarItemAndStore__block_invoke_17;
    v8[3] = &unk_1E601ABC0;
    v9 = v5;
    v13 = v6;
    v10 = WeakRetained;
    v12 = *(_QWORD *)(a1 + 56);
    v11 = *(_OWORD *)(a1 + 32);
    v7 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], v8);

  }
  else if (v4)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF84D000, v3, OS_LOG_TYPE_DEBUG, "The availability operation has gone away.  Returning early.", buf, 2u);
  }

}

void __59__EKEventAttendeesEditItem_refreshFromCalendarItemAndStore__block_invoke_17(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _BYTE v18[22];
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = kEKUILogHandle;
    if (!os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
      goto LABEL_8;
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)v18 = 138412290;
    *(_QWORD *)&v18[4] = v3;
    v4 = "Error encountered during availability request: [%@]";
    goto LABEL_7;
  }
  if (*(_BYTE *)(a1 + 72))
  {
    v2 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      v5 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)v18 = 138412290;
      *(_QWORD *)&v18[4] = v5;
      v4 = "An availability operation was cancelled: [%@]";
LABEL_7:
      _os_log_impl(&dword_1AF84D000, v2, OS_LOG_TYPE_DEBUG, v4, v18, 0xCu);
    }
  }
LABEL_8:
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) + *(_QWORD *)(a1 + 64);
  v7 = (void *)kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    v9 = *(_QWORD *)(a1 + 64);
    v10 = v7;
    objc_msgSend(v8, "numberWithUnsignedInteger:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v18 = 138412802;
    *(_QWORD *)&v18[4] = v11;
    *(_WORD *)&v18[12] = 2112;
    *(_QWORD *)&v18[14] = v12;
    v19 = 2112;
    v20 = v13;
    _os_log_impl(&dword_1AF84D000, v10, OS_LOG_TYPE_DEBUG, "Number of conflicted participants with a response: [%@].  Number of conflicted participants without a response: [%@].  Total: [%@].", v18, 0x20u);

  }
  *(_QWORD *)(*(_QWORD *)(a1 + 48) + 72) = v6;
  objc_msgSend(*(id *)(a1 + 48), "delegate", *(_OWORD *)v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "rowNumberForEditItem:", *(_QWORD *)(a1 + 48));

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "editItem:wantsRowReload:", *(_QWORD *)(a1 + 48), v16);

}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  EKUITableViewCell *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  int64_t numberOfConflicts;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;

  v4 = -[EKUITableViewCell initWithStyle:reuseIdentifier:]([EKUITableViewCell alloc], "initWithStyle:reuseIdentifier:", 1, 0);
  -[EKEventEditItem event](self, "event");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attendees");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (!v7)
    goto LABEL_5;
  if (objc_msgSend(MEMORY[0x1E0CA9FE8], "availabilityPanelVisibilityForEvent:", v5) || self->_numberOfConflicts < 1)
  {
    -[EKEventAttendeesEditItem attendeesWithoutSelfOrganizerAndLocations](self, "attendeesWithoutSelfOrganizerAndLocations");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
    {
      CUIKLocalizedStringForInteger();
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v11 = (void *)v10;
      goto LABEL_7;
    }
LABEL_5:
    objc_msgSend((id)objc_opt_class(), "_noneInviteesLocalizedString");
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  CUIKLocalizedStringForInteger();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  numberOfConflicts = self->_numberOfConflicts;
  v19 = (void *)MEMORY[0x1E0CB3940];
  EventKitUIBundle();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (numberOfConflicts == 1)
    v22 = CFSTR("%@ Conflict");
  else
    v22 = CFSTR("%@ Conflicts");
  objc_msgSend(v20, "localizedStringForKey:value:table:", v22, &stru_1E601DFA8, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringWithFormat:", v23, v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUITableViewCell detailTextLabel](v4, "detailTextLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setTextColor:", v24);

LABEL_7:
  -[EKUITableViewCell setAccessoryType:](v4, "setAccessoryType:", 1);
  EventKitUIBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Invitees"), &stru_1E601DFA8, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUITableViewCell textLabel](v4, "textLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v13);

  -[EKUITableViewCell detailTextLabel](v4, "detailTextLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setText:", v11);

  return v4;
}

+ (id)_noneInviteesLocalizedString
{
  void *v2;
  void *v3;

  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("None invitees"), CFSTR("None"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)attendeesWithoutSelfOrganizerAndLocations
{
  id *p_selfOrganizer;
  EKParticipant *selfOrganizer;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  char v20;
  uint64_t i;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  p_selfOrganizer = (id *)&self->_selfOrganizer;
  selfOrganizer = self->_selfOrganizer;
  self->_selfOrganizer = 0;

  -[EKEventEditItem event](self, "event");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "organizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[EKEventEditItem event](self, "event");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "calendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "sharingStatus");

  -[EKEventEditItem event](self, "event");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "calendar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "sharingStatus");

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[EKEventEditItem event](self, "event", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "attendees");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v25;
    if (v9)
      v19 = v12 == 2;
    else
      v19 = 0;
    v20 = !v19;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(v15);
        v22 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if (objc_msgSend(v22, "participantType") != 2)
        {
          if (*p_selfOrganizer
            || !objc_msgSend(v22, "isEqualToParticipant:", v6)
            || !objc_msgSend(v6, "isCurrentUser")
            || (objc_storeStrong(p_selfOrganizer, v22), (v20 & 1) == 0))
          {
            objc_msgSend(v13, "addObject:", v22);
          }
        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v17);
  }

  return v13;
}

- (id)detailViewControllerWithFrame:(CGRect)a3 forSubitemAtIndex:(unint64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
  void *v10;
  EKUIEventInviteesEditViewController *v11;
  void *v12;
  EKUIEventInviteesEditViewController *v13;
  EKEventAttendeesEditViewController *v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[EKEventEditItem event](self, "event", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventAttendeesEditItem attendeesWithoutSelfOrganizerAndLocations](self, "attendeesWithoutSelfOrganizerAndLocations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    v11 = [EKUIEventInviteesEditViewController alloc];
    -[EKEventEditItem event](self, "event");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[EKUIEventInviteesEditViewController initWithEvent:](v11, "initWithEvent:", v12);

  }
  else
  {
    v14 = -[EKEventAttendeesEditViewController initWithFrame:event:overriddenEventStartDate:overriddenEventEndDate:]([EKEventAttendeesEditViewController alloc], "initWithFrame:event:overriddenEventStartDate:overriddenEventEndDate:", v9, 0, 0, x, y, width, height);
    v13 = (EKUIEventInviteesEditViewController *)v14;
    if (self->_searchAccountID)
      -[EKEventAttendeesEditViewController setSearchAccountID:](v14, "setSearchAccountID:");
  }

  return v13;
}

- (id)injectableViewControllerWithFrame:(CGRect)a3 forSubitemAtIndex:(unint64_t)a4
{
  EKUIEventInviteesEditViewController *v5;
  void *v6;
  EKUIEventInviteesEditViewController *v7;

  v5 = [EKUIEventInviteesEditViewController alloc];
  -[EKEventEditItem event](self, "event");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[EKUIEventInviteesEditViewController initWithEvent:](v5, "initWithEvent:", v6);

  return v7;
}

- (unint64_t)onSaveEditItemsToRefresh
{
  return 3;
}

- (void)editor:(id)a3 didSelectSubitem:(unint64_t)a4
{
  id v6;
  objc_super v7;

  v6 = a3;
  objc_msgSend(v6, "setHasModifiedAttendeesFromSuggestion:", 0);
  v7.receiver = self;
  v7.super_class = (Class)EKEventAttendeesEditItem;
  -[EKCalendarItemEditItem editor:didSelectSubitem:](&v7, sel_editor_didSelectSubitem_, v6, a4);

}

- (BOOL)editItemViewControllerSave:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  int v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[EKEventEditItem event](self, "event");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "calendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "attendees");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventEditItem event](self, "event");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "attendees");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = (void *)MEMORY[0x1E0C9AA60];
    if (v9)
      v11 = (void *)v9;
    v12 = v11;

    v13 = objc_msgSend(v7, "count");
    if ((objc_msgSend(v6, "sharingStatus") != 2
       || (-[EKEventEditItem event](self, "event"),
           v14 = (void *)objc_claimAutoreleasedReturnValue(),
           objc_msgSend(v14, "organizer"),
           v15 = (void *)objc_claimAutoreleasedReturnValue(),
           v15,
           v14,
           v15))
      && self->_selfOrganizer
      && v13)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", self->_selfOrganizer);
      objc_msgSend(v16, "addObjectsFromArray:", v7);
    }
    else
    {
      objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[EKEventEditItem event](self, "event");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setAttendees:", v16);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = v4;
      objc_msgSend(v17, "selectedStartDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "selectedEndDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      -[EKEventEditItem event](self, "event");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setStartDate:", v18);
      objc_msgSend(v20, "setEndDateUnadjustedForLegacyClients:", v19);

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v22 = kEKUILogHandle;
        if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
        {
          v24 = 138412290;
          v25 = v4;
          _os_log_impl(&dword_1AF84D000, v22, OS_LOG_TYPE_ERROR, "Unrecognized controller saved: [%@]", (uint8_t *)&v24, 0xCu);
        }
      }
    }
  }
  -[EKCalendarItemEditItem notifySubitemDidSave:](self, "notifySubitemDidSave:", 0);

  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availabilityQueue, 0);
  objc_storeStrong((id *)&self->_searchAccountID, 0);
  objc_storeStrong((id *)&self->_selfOrganizer, 0);
}

@end
