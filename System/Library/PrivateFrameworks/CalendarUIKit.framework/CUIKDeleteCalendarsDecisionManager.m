@implementation CUIKDeleteCalendarsDecisionManager

- (CUIKDeleteCalendarsDecisionManager)initWithCalendars:(id)a3
{
  id v5;
  CUIKDeleteCalendarsDecisionManager *v6;
  CUIKDeleteCalendarsDecisionManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CUIKDeleteCalendarsDecisionManager;
  v6 = -[CUIKDeleteCalendarsDecisionManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_calendars, a3);
    -[CUIKDeleteCalendarsDecisionManager _process](v7, "_process");
  }

  return v7;
}

- (BOOL)rejected
{
  return self->_rejectionReason != 0;
}

- (CUIKDeleteCalendarsConfirmationInfo)nextConfirmation
{
  return (CUIKDeleteCalendarsConfirmationInfo *)-[NSMutableArray firstObject](self->_confirmations, "firstObject");
}

- (BOOL)selectConfirmationOptionAtIndex:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[NSMutableArray firstObject](self->_confirmations, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_12;
  -[NSMutableArray removeObjectAtIndex:](self->_confirmations, "removeObjectAtIndex:", 0);
  v6 = objc_msgSend(v5, "type");
  if (!v6)
  {
    v7 = 1;
LABEL_8:
    self->_canceled = v7 == a3;
    goto LABEL_9;
  }
  if (v6 == 1)
  {
    if (a3 == 1)
      self->_reportSpam = 1;
    v7 = 2;
    goto LABEL_8;
  }
LABEL_9:
  -[CUIKDeleteCalendarsDecisionManager nextConfirmation](self, "nextConfirmation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 || self->_canceled)
  {

  }
  else if (self->_reportSpam)
  {
    v22 = v5;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v11 = self->_calendars;
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v24 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          if (objc_msgSend(v16, "isSubscribed") && (objc_msgSend(v16, "isHolidayCalendar") & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0D0C248], "defaultProvider");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "subcalAccountID");
            v18 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "accountWithIdentifier:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v19, "parentAccount");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v18) = objc_msgSend(v20, "calIsiCloudCalDAVAccount");

            if ((v18 & 1) == 0)
            {
              objc_msgSend(v16, "subcalURL");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              +[CUIKSubscribedCalendarUtilities reportLocalSubscribedCalendarAsJunkWithoutRemoval:](CUIKSubscribedCalendarUtilities, "reportLocalSubscribedCalendarAsJunkWithoutRemoval:", v21);

            }
            objc_msgSend(v16, "setIsSubscribedCalendarJunk:", 1);

          }
        }
        v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v13);
    }

    v5 = v22;
  }
LABEL_12:
  v9 = !self->_canceled;

  return v9;
}

- (void)perform
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_1B8A6A000, a2, OS_LOG_TYPE_ERROR, "Failed to delete calendars: %{public}@", (uint8_t *)&v4, 0xCu);

}

- (unint64_t)commitDecision
{
  unint64_t v2;
  void *v3;

  if (self->_canceled)
    return 4;
  -[CUIKDeleteCalendarsDecisionManager nextConfirmation](self, "nextConfirmation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v3 == 0;

  return v2;
}

- (void)_process
{
  NSUInteger v3;
  BOOL v4;
  id v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  int v11;
  char v12;
  BOOL v13;
  int v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  unint64_t v18;
  void *v19;
  CUIKDeleteCalendarsDecisionManager *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSString *v25;
  NSString *rejectionTitle;
  unint64_t v27;
  CUIKDeleteCalendarsDecisionManager *v28;
  void *v29;
  char v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = -[NSArray count](self->_calendars, "count");
  v35 = 0;
  v4 = -[CUIKDeleteCalendarsDecisionManager _validateDeletableWithError:](self, "_validateDeletableWithError:", &v35);
  v5 = v35;
  v6 = v5;
  if (!v4)
  {
    if (objc_msgSend(v5, "code") == 51)
    {
      -[CUIKDeleteCalendarsDecisionManager _rejectRemainingCalendarCannotBeDefaultSchedulingCalendarPlural:](self, "_rejectRemainingCalendarCannotBeDefaultSchedulingCalendarPlural:", v3 > 1);
      goto LABEL_32;
    }
    if (objc_msgSend(v6, "code") == 52)
    {
      -[CUIKDeleteCalendarsDecisionManager _rejectDeleteCalendarFromUnwriteableAccountPlural:](self, "_rejectDeleteCalendarFromUnwriteableAccountPlural:", v3 > 1);
      goto LABEL_32;
    }
    if (objc_msgSend(v6, "code") == 53)
    {
      self->_rejectionReason = 3;
      objc_msgSend((id)objc_opt_class(), "_thisCalendarCantBeDeletedPlural:", v3 > 1);
      v25 = (NSString *)objc_claimAutoreleasedReturnValue();
      rejectionTitle = self->_rejectionTitle;
      self->_rejectionTitle = v25;

      goto LABEL_32;
    }
  }
  v27 = v3;
  v28 = self;
  v29 = v6;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v7 = self->_calendars;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = 0;
    v30 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v32 != v15)
          objc_enumerationMutation(v7);
        v17 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        if (objc_msgSend(v17, "isSubscribed", v27))
        {
          v11 |= objc_msgSend(v17, "isHolidayCalendar") ^ 1;
          v10 = 1;
        }
        else
        {
          v18 = objc_msgSend(v17, "deletionWarningsMask");
          if ((v18 & 0x10) != 0)
          {
            v30 = 1;
          }
          else
          {
            v12 |= (v18 & 2) >> 1;
            if ((v18 & 2) != 0)
              v13 = (v18 & 8) != 0;
            v14 |= (v18 >> 2) & 1;
          }
        }
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
    LOBYTE(v11) = 0;
    v30 = 0;
    v12 = 0;
    v13 = 0;
    LOBYTE(v14) = 0;
  }

  if (v27 > 1)
  {
    v19 = 0;
    v20 = v28;
    if ((v10 & 1) == 0)
      goto LABEL_27;
    goto LABEL_26;
  }
  v20 = v28;
  -[NSArray firstObject](v28->_calendars, "firstObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "title");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v10 & 1) != 0)
  {
LABEL_26:
    objc_msgSend((id)objc_opt_class(), "_shouldDeleteSubscribedCalendarWithTitle:canBeJunk:", v19, v11 & 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUIKDeleteCalendarsDecisionManager _addConfirmation:](v20, "_addConfirmation:", v22);

  }
LABEL_27:
  if ((v30 & 1) != 0)
  {
    objc_msgSend((id)objc_opt_class(), "_shouldDeleteSharedToMeCalendarWithTitle:", v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUIKDeleteCalendarsDecisionManager _addConfirmation:](v20, "_addConfirmation:", v23);

  }
  v6 = v29;
  if ((v12 & 1) != 0)
  {
    objc_msgSend((id)objc_opt_class(), "_shouldDeleteCalendarContainingMeetingsWithTitle:isDualType:hasInvitations:", v19, v13, v14 & 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUIKDeleteCalendarsDecisionManager _addConfirmation:](v20, "_addConfirmation:", v24);

  }
LABEL_32:

}

- (void)_addConfirmation:(id)a3
{
  id v4;
  NSMutableArray *confirmations;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  confirmations = self->_confirmations;
  v8 = v4;
  if (!confirmations)
  {
    v6 = (NSMutableArray *)objc_opt_new();
    v7 = self->_confirmations;
    self->_confirmations = v6;

    v4 = v8;
    confirmations = self->_confirmations;
  }
  -[NSMutableArray addObject:](confirmations, "addObject:", v4);

}

- (BOOL)_validateDeletableWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  BOOL v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[NSArray firstObject](self->_calendars, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_allCalendars");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = self->_calendars;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v8, "removeObject:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i));
      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v11);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v14 = self->_calendars;
  v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
    while (2)
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v14);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * j), "_validateDeletableWithAllKnownCalendars:error:", v8, a3, (_QWORD)v21))
        {
          v19 = 0;
          goto LABEL_18;
        }
      }
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      if (v16)
        continue;
      break;
    }
  }
  v19 = 1;
LABEL_18:

  return v19;
}

+ (id)_cancelButtonText
{
  void *v2;
  void *v3;

  CUIKBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("CUIKDeleteCalendarsDecisionManager_Cancel"), CFSTR("Cancel"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_deleteButtonText
{
  void *v2;
  void *v3;

  CUIKBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("CUIKDeleteCalendarsDecisionManager_Delete"), CFSTR("Delete"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_removeButtonText
{
  void *v2;
  void *v3;

  CUIKBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("CUIKDeleteCalendarsDecisionManager_Remove"), CFSTR("Remove"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_deleteAndNotifyButtonText
{
  void *v2;
  void *v3;

  CUIKBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("CUIKDeleteCalendarsDecisionManager_DeleteAndNotify"), CFSTR("Delete and Notify"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_deleteAndDontNotifyButtonText
{
  void *v2;
  void *v3;

  CUIKBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("CUIKDeleteCalendarsDecisionManager_DeleteAndDontNotify"), CFSTR("Delete and Don’t Notify"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_unsubscribeButtonText
{
  void *v2;
  void *v3;

  CUIKBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("CUIKDeleteCalendarsDecisionManager_Unsubscribe"), CFSTR("Unsubscribe"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_unsubscribeAndReportJunkButtonText
{
  void *v2;
  void *v3;

  CUIKBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("CUIKDeleteCalendarsDecisionManager_UnsubscribeAndReportJunk"), CFSTR("Unsubscribe and Report Junk"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_thisCalendarCantBeDeletedPlural:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v3 = a3;
  CUIKBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = CFSTR("A selected calendar can't be deleted.");
  else
    v6 = CFSTR("This calendar can’t be deleted.");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E6EBAE30, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_rejectRemainingCalendarCannotBeDefaultSchedulingCalendarPlural:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSString *v6;
  NSString *v7;
  NSString *rejectionTitle;
  NSString *rejectionDetails;

  v3 = a3;
  CUIKBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("If you perform this deletion, then the only remaining calendar will become the default calendar from the server because it is used for incoming events, and the remaining calendar doesn’t support that. If you would like to delete this calendar, you must first make another calendar."), &stru_1E6EBAE30, 0);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();

  self->_rejectionReason = 1;
  objc_msgSend((id)objc_opt_class(), "_thisCalendarCantBeDeletedPlural:", v3);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  rejectionTitle = self->_rejectionTitle;
  self->_rejectionTitle = v7;

  rejectionDetails = self->_rejectionDetails;
  self->_rejectionDetails = v6;

}

- (void)_rejectDeleteCalendarFromUnwriteableAccountPlural:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSString *v6;
  NSString *v7;
  NSString *rejectionTitle;
  NSString *rejectionDetails;

  v3 = a3;
  CUIKBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("You can’t delete calendars from an account with read-only privileges."), &stru_1E6EBAE30, 0);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();

  self->_rejectionReason = 2;
  objc_msgSend((id)objc_opt_class(), "_thisCalendarCantBeDeletedPlural:", v3);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  rejectionTitle = self->_rejectionTitle;
  self->_rejectionTitle = v7;

  rejectionDetails = self->_rejectionDetails;
  self->_rejectionDetails = v6;

}

+ (id)_yesNoConfirmationWithPrompt:(id)a3 dialog:(id)a4 yesText:(id)a5
{
  id v8;
  id v9;
  id v10;
  CUIKDeleteCalendarsConfirmationInfo *v11;
  void *v12;
  void *v13;
  CUIKDeleteCalendarsConfirmationInfo *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = [CUIKDeleteCalendarsConfirmationInfo alloc];
  v16[0] = v8;
  objc_msgSend(a1, "_cancelButtonText");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[CUIKDeleteCalendarsConfirmationInfo initWithType:prompt:dialog:options:](v11, "initWithType:prompt:dialog:options:", 0, v10, v9, v13);
  return v14;
}

+ (id)_shouldDeleteSubscribedCalendarWithTitle:(id)a3 canBeJunk:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  CUIKDeleteCalendarsConfirmationInfo *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  CUIKDeleteCalendarsConfirmationInfo *v18;
  void *v19;
  _QWORD v21[4];

  v4 = a4;
  v21[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  CUIKBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Are you sure you want to unsubscribe from the calendar “%@”?"), &stru_1E6EBAE30, 0);
    v9 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v9, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)v9;
  }
  else
  {
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("You are unsubscribing from a subscribed calendar."), &stru_1E6EBAE30, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  CUIKBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("If you unsubscribe from this calendar, all events associated with the calendar will also be deleted."), &stru_1E6EBAE30, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v13 = [CUIKDeleteCalendarsConfirmationInfo alloc];
    objc_msgSend(a1, "_unsubscribeButtonText");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v14;
    objc_msgSend(a1, "_unsubscribeAndReportJunkButtonText");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v15;
    objc_msgSend(a1, "_cancelButtonText");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[CUIKDeleteCalendarsConfirmationInfo initWithType:prompt:dialog:options:](v13, "initWithType:prompt:dialog:options:", 1, v10, v12, v17);

  }
  else
  {
    objc_msgSend(a1, "_unsubscribeButtonText");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_yesNoConfirmationWithPrompt:dialog:yesText:", v10, v12, v19);
    v18 = (CUIKDeleteCalendarsConfirmationInfo *)objc_claimAutoreleasedReturnValue();

  }
  return v18;
}

+ (id)_shouldDeleteSharedToMeCalendarWithTitle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  CUIKBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Are you sure you want to remove the calendar “%@”?"), &stru_1E6EBAE30, 0);
    v7 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v7, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)v7;
  }
  else
  {
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("You are removing a shared calendar."), &stru_1E6EBAE30, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  CUIKBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("If you remove this calendar, your view of the calendar will be removed. Events associated with the calendar will not be deleted for other users."), &stru_1E6EBAE30, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_removeButtonText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_yesNoConfirmationWithPrompt:dialog:yesText:", v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)_shouldDeleteCalendarContainingMeetingsWithTitle:(id)a3 isDualType:(BOOL)a4 hasInvitations:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  CUIKBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (v8)
    {
      objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Are you sure you want to delete the calendar “%@” which contains invitations and meetings?"), &stru_1E6EBAE30, 0);
      v11 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v11, v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)v11;
    }
    else
    {
      objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("You are deleting a calendar that contains invitations and meetings."), &stru_1E6EBAE30, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }

    CUIKBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v15 = CFSTR("Deleting this calendar will delete all events on the calendar. All reminders in the calendar will persist in Reminders. Invitees of events you proposed will be notified that events have been canceled, and organizers of events you’ve accepted will be notified that you’ve declined the events. You can’t undo this action.");
    else
      v15 = CFSTR("Deleting this calendar will delete all events on the calendar. Invitees of events you proposed will be notified that events have been canceled, and organizers of events you’ve accepted will be notified that you’ve declined the events. You can’t undo this action.");
  }
  else
  {
    if (v8)
    {
      objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Are you sure you want to delete the calendar “%@”?"), &stru_1E6EBAE30, 0);
      v13 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v13, v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)v13;
    }
    else
    {
      objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("You are deleting a calendar that contains events."), &stru_1E6EBAE30, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }

    CUIKBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v15 = CFSTR("If you delete this calendar, all events associated with the calendar will also be deleted. All reminders in the calendar will persist in Reminders.");
    else
      v15 = CFSTR("If you delete this calendar, all events associated with the calendar will also be deleted.");
  }
  objc_msgSend(v14, "localizedStringForKey:value:table:", v15, &stru_1E6EBAE30, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_deleteButtonText");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_yesNoConfirmationWithPrompt:dialog:yesText:", v12, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (unint64_t)rejectionReason
{
  return self->_rejectionReason;
}

- (NSString)rejectionTitle
{
  return self->_rejectionTitle;
}

- (NSString)rejectionDetails
{
  return self->_rejectionDetails;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rejectionDetails, 0);
  objc_storeStrong((id *)&self->_rejectionTitle, 0);
  objc_storeStrong((id *)&self->_confirmations, 0);
  objc_storeStrong((id *)&self->_calendars, 0);
}

@end
