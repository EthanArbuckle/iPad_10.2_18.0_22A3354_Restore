@implementation CUIKSaveOperation

+ (id)multipleEventsChangedActionName
{
  void *v2;
  void *v3;

  CUIKBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Action: Changes to Events"), CFSTR("Changes to Events"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)genericEventChangedActionName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  CUIKBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Action: Changes to “%@”"), CFSTR("Changes to “%@”"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "localizedStringWithFormat:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)changedTimeActionName:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    CUIKBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Action: Change Time of “%@”"), CFSTR("Change Time of “%@”"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v4, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "localizedStringWithFormat:", v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v9 = 0;
      goto LABEL_7;
    }
    CUIKBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Action: Completion Change"), CFSTR("Completion Change"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_7:
  return v9;
}

+ (id)changedTitleActionName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  CUIKBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Action: Rename %@ to “%@”"), CFSTR("Rename %@ to “%@”"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "actionStringsDisplayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionStringsDisplayTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)changedTimeZoneActionName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  CUIKBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Action: Change Time Zone of “%@”"), CFSTR("Change Time Zone of “%@”"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "localizedStringWithFormat:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)changedCalendarActionName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  CUIKBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Action: Change Calendar of “%@”"), CFSTR("Change Calendar of “%@”"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "localizedStringWithFormat:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)changedAvailablityActionName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  CUIKBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Action: Change Availability for “%@”"), CFSTR("Change Availability for “%@”"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "localizedStringWithFormat:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)changedPrivacyActionName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  CUIKBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Action: Change Privacy for “%@”"), CFSTR("Change Privacy for “%@”"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "localizedStringWithFormat:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)changedNotesActionName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  CUIKBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Action: Change Notes for “%@”"), CFSTR("Change Notes for “%@”"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "localizedStringWithFormat:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)changedURLActionName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  CUIKBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Action: Change URL for “%@”"), CFSTR("Change URL for “%@”"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "localizedStringWithFormat:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)changedParticipationStatusActionName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  CUIKBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Action: Change Participation Status for “%@”"), CFSTR("Change Participation Status for “%@”"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "localizedStringWithFormat:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)changedResponseCommentActionName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  CUIKBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Action: Response Comment for “%@”"), CFSTR("Change Response Comment for “%@”"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "localizedStringWithFormat:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)alarmsAddedActionName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  CUIKBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Action: Add Alert to “%@”"), CFSTR("Add Alert to “%@”"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "localizedStringWithFormat:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)alarmsRemovedActionName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  CUIKBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Action: Remove Alert from “%@”"), CFSTR("Remove Alert from “%@”"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "localizedStringWithFormat:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)alarmsModifiedActionName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  CUIKBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Action: Change Alert for “%@”"), CFSTR("Change Alert for “%@”"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "localizedStringWithFormat:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)attachmentsAddedActionName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  CUIKBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Action: Add Attachment to “%@”"), CFSTR("Add Attachment to “%@”"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "localizedStringWithFormat:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)attachmentsRemovedActionName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  CUIKBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Action: Remove Attachment from “%@”"), CFSTR("Remove Attachment from “%@”"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "localizedStringWithFormat:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)attachmentsModifiedActionName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  CUIKBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Action: Change Attachment for “%@”"), CFSTR("Change Attachment for “%@”"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "localizedStringWithFormat:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)attendeesAddedActionName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  CUIKBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Action: Add Attendee to “%@”"), CFSTR("Add Attendee to “%@”"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "localizedStringWithFormat:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)attendeesRemovedActionName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  CUIKBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Action: Remove Attendee from “%@”"), CFSTR("Remove Attendee from “%@”"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "localizedStringWithFormat:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)attendeesModifiedActionName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  CUIKBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Action: Change Attendee for “%@”"), CFSTR("Change Attendee for “%@”"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "localizedStringWithFormat:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)shareesAddedActionName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  CUIKBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Action: Add Sharee to “%@”"), CFSTR("Add Sharee to “%@”"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "localizedStringWithFormat:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)shareesRemovedActionName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  CUIKBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Action: Remove Sharee from “%@”"), CFSTR("Remove Sharee from “%@”"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "localizedStringWithFormat:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)shareesModifiedActionName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  CUIKBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Action: Change Sharee for “%@”"), CFSTR("Change Sharee for “%@”"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "localizedStringWithFormat:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)changedAllDayActionNameWithCurrentEvent:(id)a3 previousEvent:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  if ((objc_msgSend(a4, "isAllDay") & 1) != 0)
  {
    +[CUIKSaveOperation changedTimeActionName:](CUIKSaveOperation, "changedTimeActionName:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    CUIKBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Action: Make “%@” All-Day"), CFSTR("Make “%@” All-Day"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringWithFormat:", v8, v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

+ (id)changedCompletionActionName:(id)a3
{
  id v3;
  int v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  v4 = objc_msgSend(v3, "completed");
  CUIKBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    v7 = CFSTR("Action: Mark “%@” Complete");
    v8 = CFSTR("Mark “%@” Complete");
  }
  else
  {
    v7 = CFSTR("Action: Mark “%@” Incomplete");
    v8 = CFSTR("Mark “%@” Incomplete");
  }
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "localizedStringWithFormat:", v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)changedTravelTimeActionNameWithCurrentEvent:(id)a3 previousEvent:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;

  v5 = a3;
  v6 = a4;
  CUIKBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Action: Add Travel Time for “%@”"), CFSTR("Add Travel Time for “%@”"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  CUIKBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Action: Remove Travel Time for “%@”"), CFSTR("Remove Travel Time for “%@”"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  CUIKBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Action: Change Travel Time for “%@”"), CFSTR("Change Travel Time for “%@”"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "title");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "travelTime");
  if (v14 != 0.0 || (objc_msgSend(v5, "travelTime"), v15 = v8, v16 == 0.0))
  {
    objc_msgSend(v6, "travelTime");
    if (v17 == 0.0 || (objc_msgSend(v5, "travelTime"), v15 = v10, v18 != 0.0))
      v15 = v12;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v15, v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)changedRecurrenceRuleActionNameWithCurrentEvent:(id)a3 previousEvent:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;

  v5 = a3;
  v6 = a4;
  CUIKBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Action: Add Repeat for “%@”"), CFSTR("Add Repeat for “%@”"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  CUIKBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Action: Remove Repeat for “%@”"), CFSTR("Remove Repeat for “%@”"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  CUIKBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Action: Change Repeat for “%@”"), CFSTR("Change Repeat for “%@”"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "title");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recurrenceRules");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {

  }
  else
  {
    objc_msgSend(v5, "recurrenceRules");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = v8;
    if (v16)
      goto LABEL_7;
  }
  objc_msgSend(v6, "recurrenceRules", v15);
  v17 = objc_claimAutoreleasedReturnValue();
  if (!v17
    || (v18 = (void *)v17,
        objc_msgSend(v5, "recurrenceRules"),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        v19,
        v18,
        v15 = v10,
        v19))
  {
    v15 = v12;
  }
LABEL_7:
  objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v15, v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)changedLocationActionNameWithCurrentEvent:(id)a3 previousEvent:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;

  v5 = a3;
  v6 = a4;
  CUIKBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Action: Add Location to “%@”"), CFSTR("Add Location to “%@”"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  CUIKBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Action: Remove Location from “%@”"), CFSTR("Remove Location from “%@”"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  CUIKBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Action: Change Location of “%@”"), CFSTR("Change Location of “%@”"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "title");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "location");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {

  }
  else
  {
    objc_msgSend(v5, "location");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = v8;
    if (v16)
      goto LABEL_7;
  }
  objc_msgSend(v6, "location", v15);
  v17 = objc_claimAutoreleasedReturnValue();
  if (!v17
    || (v18 = (void *)v17,
        objc_msgSend(v5, "location"),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        v19,
        v18,
        v15 = v10,
        v19))
  {
    v15 = v12;
  }
LABEL_7:
  objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v15, v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)changedColorOfCalendar:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  CUIKBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Action: Change Calendar Color"), CFSTR("Change Color of “%@”"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "localizedStringWithFormat:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)changedTitleOfCalendar:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  if ((objc_msgSend(v3, "allowedEntityTypes") & 1) != 0)
  {
    CUIKBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Action: Rename Calendar to “%@”"), CFSTR("Rename Calendar to “%@”"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v6, v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
    goto LABEL_7;
  }
  if ((objc_msgSend(v3, "allowedEntityTypes") & 2) != 0)
  {
    CUIKBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Action: Rename List"), CFSTR("Rename List"), 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v4 = 0;
LABEL_7:

  return v4;
}

- (id)_actionName
{
  void *v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  int v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;

  -[CUIKUserOperation objects](self, "objects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 1)
  {
    -[CUIKUserOperation objects](self, "objects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[CUIKUserOperation objects](self, "objects");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "shallowCopyWithoutChanges");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CAA0B8], "diffSummaryBetweenObject:andObject:", v9, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v10, "allKeys");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setWithArray:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      +[CUIKLogSubsystem userActions](CUIKLogSubsystem, "userActions");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[CUIKSaveOperation _actionName].cold.1((uint64_t)v13, v14);

      if (objc_msgSend(v13, "containsObject:", *MEMORY[0x1E0CA9E88]))
      {
        +[CUIKSaveOperation changedAllDayActionNameWithCurrentEvent:previousEvent:](CUIKSaveOperation, "changedAllDayActionNameWithCurrentEvent:previousEvent:", v8, v9);
        v15 = objc_claimAutoreleasedReturnValue();
LABEL_12:
        v16 = (void *)v15;
        v18 = 1;
        goto LABEL_25;
      }
      if (objc_msgSend(v13, "containsObject:", *MEMORY[0x1E0CA9EC8]))
      {
        +[CUIKSaveOperation changedCalendarActionName:](CUIKSaveOperation, "changedCalendarActionName:", v8);
        v15 = objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CA9F40], *MEMORY[0x1E0CA9EE0], 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "isSubsetOfSet:", v19))
      {
        +[CUIKSaveOperation changedTimeActionName:](CUIKSaveOperation, "changedTimeActionName:", v8);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 1;
LABEL_24:

LABEL_25:
        if (v18)
          return v16;
        goto LABEL_8;
      }
      v20 = *MEMORY[0x1E0CA9E70];
      v21 = *MEMORY[0x1E0CA9E78];
      v22 = *MEMORY[0x1E0CA9E80];
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CA9E70], *MEMORY[0x1E0CA9E78], *MEMORY[0x1E0CA9E80], 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v10, "count") >= 2 && objc_msgSend(v13, "isSubsetOfSet:", v23))
        goto LABEL_17;
      if (objc_msgSend(v10, "count") != 1)
      {
        +[CUIKSaveOperation genericEventChangedActionName:](CUIKSaveOperation, "genericEventChangedActionName:", v8);
        v24 = objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
      objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0CA9F50]);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        +[CUIKSaveOperation changedTitleActionName:](CUIKSaveOperation, "changedTitleActionName:", v8);
        v24 = objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
      objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0CA9EF8]);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        +[CUIKSaveOperation changedLocationActionNameWithCurrentEvent:previousEvent:](CUIKSaveOperation, "changedLocationActionNameWithCurrentEvent:previousEvent:", v8, v9);
        v24 = objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
      objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0CA9F58]);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        +[CUIKSaveOperation changedTravelTimeActionNameWithCurrentEvent:previousEvent:](CUIKSaveOperation, "changedTravelTimeActionNameWithCurrentEvent:previousEvent:", v8, v9);
        v24 = objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
      objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0CA9F48]);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        +[CUIKSaveOperation changedTimeZoneActionName:](CUIKSaveOperation, "changedTimeZoneActionName:", v8);
        v24 = objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
      objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0CA9F18]);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        +[CUIKSaveOperation changedRecurrenceRuleActionNameWithCurrentEvent:previousEvent:](CUIKSaveOperation, "changedRecurrenceRuleActionNameWithCurrentEvent:previousEvent:", v8, v9);
        v24 = objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
      objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0CA9EC0]);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
      {
        +[CUIKSaveOperation changedAvailablityActionName:](CUIKSaveOperation, "changedAvailablityActionName:", v8);
        v24 = objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
      objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0CA9F10]);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v31)
      {
        +[CUIKSaveOperation changedPrivacyActionName:](CUIKSaveOperation, "changedPrivacyActionName:", v8);
        v24 = objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
      objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0CA9F00]);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32)
      {
        +[CUIKSaveOperation changedNotesActionName:](CUIKSaveOperation, "changedNotesActionName:", v8);
        v24 = objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
      objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0CA9F60]);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
      {
        +[CUIKSaveOperation changedURLActionName:](CUIKSaveOperation, "changedURLActionName:", v8);
        v24 = objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
      objc_msgSend(v10, "objectForKey:", v20);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        +[CUIKSaveOperation alarmsAddedActionName:](CUIKSaveOperation, "alarmsAddedActionName:", v8);
        v24 = objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
      objc_msgSend(v10, "objectForKey:", v21);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (v35)
      {
LABEL_17:
        +[CUIKSaveOperation alarmsModifiedActionName:](CUIKSaveOperation, "alarmsModifiedActionName:", v8);
        v24 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v10, "objectForKey:", v22);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (v36)
        {
          +[CUIKSaveOperation alarmsRemovedActionName:](CUIKSaveOperation, "alarmsRemovedActionName:", v8);
          v24 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0CA9E90]);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          if (v37)
          {
            +[CUIKSaveOperation attachmentsAddedActionName:](CUIKSaveOperation, "attachmentsAddedActionName:", v8);
            v24 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0CA9EA0]);
            v38 = (void *)objc_claimAutoreleasedReturnValue();

            if (v38)
            {
              +[CUIKSaveOperation attachmentsRemovedActionName:](CUIKSaveOperation, "attachmentsRemovedActionName:", v8);
              v24 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0CA9E98]);
              v39 = (void *)objc_claimAutoreleasedReturnValue();

              if (v39)
              {
                +[CUIKSaveOperation attachmentsModifiedActionName:](CUIKSaveOperation, "attachmentsModifiedActionName:", v8);
                v24 = objc_claimAutoreleasedReturnValue();
              }
              else
              {
                objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0CA9EA8]);
                v40 = (void *)objc_claimAutoreleasedReturnValue();

                if (v40)
                {
                  +[CUIKSaveOperation attendeesAddedActionName:](CUIKSaveOperation, "attendeesAddedActionName:", v8);
                  v24 = objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0CA9EB8]);
                  v41 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v41)
                  {
                    +[CUIKSaveOperation attendeesRemovedActionName:](CUIKSaveOperation, "attendeesRemovedActionName:", v8);
                    v24 = objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0CA9EB0]);
                    v42 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v42)
                    {
                      +[CUIKSaveOperation attendeesModifiedActionName:](CUIKSaveOperation, "attendeesModifiedActionName:", v8);
                      v24 = objc_claimAutoreleasedReturnValue();
                    }
                    else
                    {
                      objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0CA9F08]);
                      v43 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v43)
                      {
                        +[CUIKSaveOperation changedParticipationStatusActionName:](CUIKSaveOperation, "changedParticipationStatusActionName:", v8);
                        v24 = objc_claimAutoreleasedReturnValue();
                      }
                      else
                      {
                        objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0CA9F20]);
                        v44 = (void *)objc_claimAutoreleasedReturnValue();

                        if (v44)
                        {
                          +[CUIKSaveOperation changedResponseCommentActionName:](CUIKSaveOperation, "changedResponseCommentActionName:", v8);
                          v24 = objc_claimAutoreleasedReturnValue();
                        }
                        else
                        {
                          objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0CA9ED0]);
                          v45 = (void *)objc_claimAutoreleasedReturnValue();

                          if (v45)
                          {
                            +[CUIKSaveOperation changedColorOfCalendar:](CUIKSaveOperation, "changedColorOfCalendar:", v8);
                            v24 = objc_claimAutoreleasedReturnValue();
                          }
                          else
                          {
                            objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0CA9ED8]);
                            v46 = (void *)objc_claimAutoreleasedReturnValue();

                            if (v46)
                            {
                              +[CUIKSaveOperation changedTitleOfCalendar:](CUIKSaveOperation, "changedTitleOfCalendar:", v8);
                              v24 = objc_claimAutoreleasedReturnValue();
                            }
                            else
                            {
                              objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0CA9F28]);
                              v47 = (void *)objc_claimAutoreleasedReturnValue();

                              if (v47)
                              {
                                +[CUIKSaveOperation shareesAddedActionName:](CUIKSaveOperation, "shareesAddedActionName:", v8);
                                v24 = objc_claimAutoreleasedReturnValue();
                              }
                              else
                              {
                                objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0CA9F38]);
                                v48 = (void *)objc_claimAutoreleasedReturnValue();

                                if (v48)
                                {
                                  +[CUIKSaveOperation shareesRemovedActionName:](CUIKSaveOperation, "shareesRemovedActionName:", v8);
                                  v24 = objc_claimAutoreleasedReturnValue();
                                }
                                else
                                {
                                  objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0CA9F30]);
                                  v49 = (void *)objc_claimAutoreleasedReturnValue();

                                  if (v49)
                                  {
                                    +[CUIKSaveOperation shareesModifiedActionName:](CUIKSaveOperation, "shareesModifiedActionName:", v8);
                                    v24 = objc_claimAutoreleasedReturnValue();
                                  }
                                  else
                                  {
                                    objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0CA9EF0]);
                                    v16 = (void *)objc_claimAutoreleasedReturnValue();

                                    if (!v16)
                                    {
                                      v18 = 0;
                                      goto LABEL_23;
                                    }
                                    +[CUIKSaveOperation changedCompletionActionName:](CUIKSaveOperation, "changedCompletionActionName:", v8);
                                    v24 = objc_claimAutoreleasedReturnValue();
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
LABEL_22:
      v16 = (void *)v24;
      v18 = 1;
LABEL_23:

      goto LABEL_24;
    }
  }
  else
  {

  }
LABEL_8:
  +[CUIKSaveOperation multipleEventsChangedActionName](CUIKSaveOperation, "multipleEventsChangedActionName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  return v16;
}

- (int64_t)_spanForObject:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = -[CUIKUserOperation span](self, "span");
  -[CUIKSaveOperation objectsRequiringAlteredSpan](self, "objectsRequiringAlteredSpan");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CUIKSaveOperation objectsRequiringAlteredSpan](self, "objectsRequiringAlteredSpan");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v11, "integerValue");

  }
  return v5;
}

- (BOOL)_executeWithUndoDelegate:(id)a3 error:(id *)a4
{
  id v5;
  char v6;
  uint64_t i;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  char v13;
  int v14;
  char v15;
  id v16;
  void *v17;
  void *v18;
  char v19;
  id obj;
  uint64_t v22;
  CUIKSaveOperation *v23;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[CUIKUserOperation _precomputeActionName](self, "_precomputeActionName");
  -[CUIKSaveOperation _storePreviousState](self, "_storePreviousState");
  -[CUIKUserOperation _precomputeInverseOperation](self, "_precomputeInverseOperation");
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v23 = self;
  -[CUIKUserOperation objects](self, "objects");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v25)
  {
    v22 = *(_QWORD *)v27;
    v6 = 1;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v27 != v22)
          objc_enumerationMutation(obj);
        v8 = *(id *)(*((_QWORD *)&v26 + 1) + 8 * i);
        v9 = v8;
        if (v5)
        {
          objc_msgSend(v5, "objectToSaveForUndoingChangeToObject:", v8);
          v10 = (id)objc_claimAutoreleasedReturnValue();

          v9 = v8;
          if (v10 != v8)
          {
            objc_msgSend(v10, "addChangesFromObject:copyingBackingObjects:", v8, 0);
            v9 = v10;
          }
        }
        v11 = -[CUIKSaveOperation _spanForObject:](v23, "_spanForObject:", v9);
        objc_msgSend(v9, "specificIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v13 = objc_msgSend(v9, "isUndetached");
        else
          v13 = 0;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v14 = objc_msgSend(v9, "isDetached");
        else
          v14 = 0;
        v15 = objc_msgSend(v9, "CUIKEditingContext_saveWithSpan:error:", v11, a4);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && ((v14 | objc_msgSend(v9, "isDetached") ^ 1) & 1) == 0)
        {
          objc_msgSend(v5, "objectToSaveForRevertingChangeToObject:", v8);
          v16 = (id)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (v16 != v8)
            objc_msgSend(v16, "addChangesFromObject:copyingBackingObjects:", v8, 0);
          objc_msgSend(v5, "setRevertObject:forSpecificIdentifier:", v17, v12);

        }
        if ((v13 & 1) == 0)
        {
          objc_msgSend(v9, "specificIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "isEqualToString:", v12);

          if ((v19 & 1) == 0)
            objc_msgSend(v5, "setUndoObject:forSpecificIdentifier:", v9, v12);
        }
        v6 &= v15;

      }
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v25);
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (void)_storePreviousState
{
  -[CUIKSaveOperation _storePreviousObjects](self, "_storePreviousObjects");
  -[CUIKUserOperation _storeOriginalSliceDescriptions](self, "_storeOriginalSliceDescriptions");
}

- (void)_storePreviousObjects
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[CUIKUserOperation objects](self, "objects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[CUIKUserOperation objects](self, "objects", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10), "previouslySavedCopy");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  -[CUIKSaveOperation setPreviousObjects:](self, "setPreviousObjects:", v5);
}

- (Class)_inverseOperationClass
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  char v18;
  void *v19;
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
  if (-[CUIKUserOperation span](self, "span") == 4)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[CUIKUserOperation objects](self, "objects");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v26;
      while (2)
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v26 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v7);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v8, "detachedItems");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = objc_msgSend(v9, "count");

            if (v10)
            {

              goto LABEL_28;
            }
          }
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        if (v5)
          continue;
        break;
      }
    }

  }
  else if (-[CUIKUserOperation span](self, "span"))
  {
LABEL_28:
    v19 = 0;
    return (Class)v19;
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[CUIKUserOperation objects](self, "objects", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v22;
    while (2)
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v15);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v17 = v16;
          if ((objc_msgSend(v17, "hasRecurrenceRuleAdditionOrRemoval") & 1) != 0
            || (objc_msgSend(v17, "hasCalendarChangeThatRequiresDeleteAndAdd") & 1) != 0)
          {

LABEL_27:
            goto LABEL_28;
          }
          v18 = objc_msgSend(v17, "requiresDetach");

          if ((v18 & 1) != 0)
            goto LABEL_27;
        }
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      if (v13)
        continue;
      break;
    }
  }

  objc_opt_class();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  return (Class)v19;
}

- (id)_inverseOperation
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CUIKSaveOperation;
  -[CUIKUserOperation _inverseOperation](&v7, sel__inverseOperation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CUIKUserOperation span](self, "span"))
  {
    -[CUIKUserOperation actionName](self, "actionName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPrecomputedActionName:", v4);
  }
  else
  {
    objc_msgSend(v3, "objects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUIKSaveOperation _objectsRequiringAlteredSpan:](self, "_objectsRequiringAlteredSpan:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "setObjectsRequiringAlteredSpan:", v4);
  }

  return v3;
}

- (id)_objectsRequiringAlteredSpan:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && objc_msgSend(v10, "hasChangesRequiringSpanAll", (_QWORD)v13))
        {
          objc_msgSend(v10, "uniqueIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E6ED6D80, v11);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_objectsForInverse
{
  void *v4;
  void *v5;

  if (-[CUIKUserOperation span](self, "span") && -[CUIKUserOperation span](self, "span") != 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CUIKSaveOperation.m"), 593, CFSTR("Undo for slice operations isn't supported, and we never should have reached this point"));

    v4 = 0;
  }
  else
  {
    -[CUIKSaveOperation _invertedNonSliceObjects](self, "_invertedNonSliceObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)_invertedNonSliceObjects
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  char v23;
  int64_t v24;
  void *v25;
  unint64_t v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  id v34;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[CUIKUserOperation objects](self, "objects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CUIKUserOperation objects](self, "objects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (!v7)
  {
LABEL_16:
    v29 = v5;
    goto LABEL_19;
  }
  v8 = 0;
  v33 = *MEMORY[0x1E0D0B350];
  v31 = *MEMORY[0x1E0D0B270];
  v32 = v5;
  while (1)
  {
    -[CUIKUserOperation objects](self, "objects", v31);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[CUIKSaveOperation previousObjects](self, "previousObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = 0;
    objc_msgSend(v10, "inverseObjectWithObject:diff:", v12, &v34);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v34;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_10;
    v15 = v12;
    objc_msgSend(v14, "differentRelationshipMultiValueKeys");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "containsObject:", v33);

    if (v17)
      break;
LABEL_7:
    objc_msgSend(v14, "relationshipMultiValueAdds");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "allKeys");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "containsObject:", v31);

    if ((v23 & 1) != 0)
      goto LABEL_18;
    v24 = -[CUIKSaveOperation _spanForObject:](self, "_spanForObject:", v10);
    if ((objc_msgSend(v15, "isDetached") & 1) == 0
      && objc_msgSend(v15, "isOrWasPartOfRecurringSeries")
      && !v24
      && (objc_msgSend(v10, "isUndetached") & 1) == 0)
    {
      objc_msgSend(v15, "startDate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "endDateUnadjustedForLegacyClients");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "markAsUndetachedWithStartDate:endDate:", v27, v28);

    }
    v5 = v32;
LABEL_10:
    objc_msgSend(v5, "addObject:", v13);

    ++v8;
    -[CUIKUserOperation objects](self, "objects");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "count");

    if (v26 <= v8)
      goto LABEL_16;
  }
  objc_msgSend(v15, "attendees");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v18, "count"))
  {
    objc_msgSend(v15, "detachedItems");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "count");

    if (v20)
      goto LABEL_18;
    goto LABEL_7;
  }

LABEL_18:
  v29 = 0;
  v5 = v32;
LABEL_19:

  return v29;
}

- (NSArray)previousObjects
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (void)setPreviousObjects:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSArray)previousSliceInfo
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setPreviousSliceInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSDictionary)objectsRequiringAlteredSpan
{
  return (NSDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setObjectsRequiringAlteredSpan:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectsRequiringAlteredSpan, 0);
  objc_storeStrong((id *)&self->_previousSliceInfo, 0);
  objc_storeStrong((id *)&self->_previousObjects, 0);
}

- (void)_actionName
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1B8A6A000, a2, OS_LOG_TYPE_DEBUG, "Changes: %@", (uint8_t *)&v2, 0xCu);
}

@end
