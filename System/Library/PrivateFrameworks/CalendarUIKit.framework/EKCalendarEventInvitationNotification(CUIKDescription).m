@implementation EKCalendarEventInvitationNotification(CUIKDescription)

- (uint64_t)supportsDisplay
{
  uint64_t result;

  if (!objc_msgSend(a1, "type"))
    return 1;
  result = objc_msgSend(a1, "type");
  if (result == 1)
    return result;
  return objc_msgSend(a1, "type") == 2 || objc_msgSend(a1, "type") == 3;
}

- (void)_populateDescriptionStringsArray:()CUIKDescription dictionary:options:
{
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  id v25;
  id v26;

  v26 = a3;
  v8 = a4;
  if (!objc_msgSend(a1, "type") || objc_msgSend(a1, "type") == 1 || objc_msgSend(a1, "type") == 2)
  {
    if (objc_msgSend(a1, "type") == 2)
      objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("Cancelled"));
    objc_msgSend(a1, "_organizerString:", a5);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if ((a5 & 0x200) == 0 && v9)
    {
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("Person"));
      objc_msgSend(v26, "addObject:", v10);
    }
    if ((a5 & 4) != 0)
    {
      objc_msgSend(a1, "_attendeeString:", a5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("2ndPerson"));
        objc_msgSend(v26, "addObject:", v11);
      }

    }
    objc_msgSend(a1, "_dateString:", a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, CFSTR("Date"));
      objc_msgSend(v26, "addObject:", v12);
    }
    objc_msgSend(a1, "_locationString:", a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, CFSTR("Action"));
      objc_msgSend(v26, "addObject:", v13);
    }
    objc_msgSend(a1, "_recurrenceChangedString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, CFSTR("Action"));
      objc_msgSend(v26, "addObject:", v14);
    }

    goto LABEL_20;
  }
  if (objc_msgSend(a1, "type") == 3)
  {
    if (objc_msgSend(a1, "expanded") && objc_msgSend(a1, "isProposedNewTime"))
    {
      objc_msgSend(a1, "_identityStringWithOptions:", a5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "expandedProposedTimeAttendee");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "proposedStartDate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[CUIKAvailabilityDescriptionGenerator attendeeProposedANewTime:attendeeName:](CUIKAvailabilityDescriptionGenerator, "attendeeProposedANewTime:attendeeName:", v22, v10);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v23)
      {
LABEL_40:

LABEL_20:
        goto LABEL_21;
      }
      v24 = CFSTR("Action");
    }
    else
    {
      if (objc_msgSend(a1, "isLocationDecline"))
      {
        objc_msgSend(a1, "_locationString:", a5);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("Action"));
          objc_msgSend(v26, "addObject:", v10);
        }
        goto LABEL_20;
      }
      objc_msgSend(a1, "_attendeeReplyStringWithOptions:descriptions:", a5, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_msgSend(v26, "addObject:", v10);
        v25 = (id)objc_msgSend(a1, "_attendeeReplyStringWithOptions:descriptions:", a5, v8);
      }
      objc_msgSend(a1, "_dateString:", a5);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v23)
        goto LABEL_40;
      v24 = CFSTR("Date");
    }
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v23, v24);
    objc_msgSend(v26, "addObject:", v23);
    goto LABEL_40;
  }
LABEL_21:
  objc_msgSend(a1, "recurrenceRule");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)objc_opt_new();
    objc_msgSend(a1, "startDateForNextOccurrence");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v16, "naturalLanguageDescriptionForRecurrenceRule:withStartDate:", v15, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(a1, "startDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "naturalLanguageDescriptionForRecurrenceRule:withStartDate:", v15, v19);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v18, CFSTR("Recurrence"));

  }
  objc_msgSend(a1, "timeSensitiveDescriptionString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v20, CFSTR("TimeSensitive"));

}

- (id)descriptionStrings:()CUIKDescription
{
  void *v5;
  void *v6;

  v5 = (void *)objc_opt_new();
  objc_msgSend(a1, "_populateDescriptionStringsArray:dictionary:options:", 0, v5, a3);
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

- (id)allDescriptionStringsWithOptions:()CUIKDescription
{
  void *v5;
  void *v6;

  v5 = (void *)objc_opt_new();
  objc_msgSend(a1, "_populateDescriptionStringsArray:dictionary:options:", v5, 0, a3);
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

- (id)_identityStringWithOptions:()CUIKDescription
{
  void *v5;
  void *v6;

  if (objc_msgSend(a1, "isProposedNewTime"))
  {
    objc_msgSend(a1, "expandedProposedTimeAttendee");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_identityStringForIdentity:withOptions:", v5, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "_identityStringForIdentity:withOptions:", a1, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)_organizerString:()CUIKDescription
{
  void *v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;

  if (objc_msgSend(a1, "type") == 2)
  {
    CUIKBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("Canceled by %@");
  }
  else
  {
    CUIKBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if ((a3 & 0x80) != 0)
      v8 = CFSTR("From: %@");
    else
      v8 = CFSTR("Invitation from %@");
    if ((a3 & 4) != 0)
      v7 = v8;
    else
      v7 = CFSTR("%@");
  }
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_1E6EBAE30, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_identityStringWithOptions:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v9, CFSTR("%@"), 0, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (uint64_t)_attendeeString:()CUIKDescription
{
  return 0;
}

- (uint64_t)_attendeeReplyStringWithOptions:()CUIKDescription descriptions:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  BOOL v9;
  char v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t *v26;
  id v27;
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
  void *v49;
  void *v50;
  _QWORD v51[4];
  id v52;
  uint64_t *v53;
  uint64_t *v54;
  uint64_t *v55;
  uint64_t *v56;
  uint64_t *v57;
  uint64_t *v58;
  uint64_t *v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  void (*v71)(uint64_t);
  id v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t (*v76)(uint64_t, uint64_t);
  void (*v77)(uint64_t);
  id v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  char v82;
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  char v86;
  uint64_t v87;
  uint64_t *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t *v96;
  uint64_t v97;
  uint64_t v98;

  v5 = a4;
  v95 = 0;
  v96 = &v95;
  v97 = 0x2020000000;
  v98 = 0;
  v91 = 0;
  v92 = &v91;
  v93 = 0x2020000000;
  v94 = 0;
  v87 = 0;
  v88 = &v87;
  v89 = 0x2020000000;
  v90 = 0;
  v83 = 0;
  v84 = &v83;
  v85 = 0x2020000000;
  v86 = 0;
  v79 = 0;
  v80 = &v79;
  v81 = 0x2020000000;
  v82 = 0;
  v73 = 0;
  v74 = &v73;
  v75 = 0x3032000000;
  v76 = __Block_byref_object_copy__12;
  v77 = __Block_byref_object_dispose__12;
  v78 = 0;
  v67 = 0;
  v68 = &v67;
  v69 = 0x3032000000;
  v70 = __Block_byref_object_copy__12;
  v71 = __Block_byref_object_dispose__12;
  v72 = 0;
  v61 = 0;
  v62 = &v61;
  v63 = 0x3032000000;
  v64 = __Block_byref_object_copy__12;
  v65 = __Block_byref_object_dispose__12;
  v66 = (id)objc_opt_new();
  objc_msgSend(a1, "attendees");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __103__EKCalendarEventInvitationNotification_CUIKDescription___attendeeReplyStringWithOptions_descriptions___block_invoke;
  v51[3] = &unk_1E6EB7718;
  v53 = &v79;
  v54 = &v67;
  v55 = &v91;
  v7 = v5;
  v52 = v7;
  v56 = &v95;
  v57 = &v87;
  v58 = &v61;
  v59 = &v73;
  v60 = &v83;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v51);

  v8 = v92[3];
  v9 = v8 > 1 || v96[3] > 1 || v88[3] > 1;
  v10 = *((_BYTE *)v84 + 24) | v9;
  *((_BYTE *)v84 + 24) = v10;
  if (*((_BYTE *)v80 + 24))
  {
    objc_msgSend(a1, "owner");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    CalShortDisplayStringForNotificationIdentity(v11, 1, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "owner");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v74[5];
    v74[5] = v13;

    v15 = (void *)MEMORY[0x1E0CB3940];
    CUIKBundle();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("%@ declined to move the event to your proposed time"), &stru_1E6EBAE30, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringWithFormat:", v17, v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v18, CFSTR("Action"));

LABEL_7:
LABEL_27:

    goto LABEL_28;
  }
  if (v10)
  {
    v19 = (void *)v74[5];
    v74[5] = 0;

    v12 = (void *)objc_opt_new();
    v20 = v92[3];
    if (v20 == 1)
    {
      v21 = (void *)MEMORY[0x1E0CB3940];
      CUIKBundle();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("%@ declined"), &stru_1E6EBAE30, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      CalShortDisplayStringForNotificationIdentity((void *)v68[5], 1, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "localizedStringWithFormat:", v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "appendString:", v25);

      v26 = v74;
      v27 = (id)v68[5];
      v28 = (void *)v26[5];
      v26[5] = (uint64_t)v27;
    }
    else
    {
      if (v20 <= 1)
      {
LABEL_16:
        if (v96[3] >= 1)
        {
          if (objc_msgSend(v12, "length"))
            objc_msgSend(v12, "appendString:", CFSTR("\n"));
          v37 = (void *)MEMORY[0x1E0CB3940];
          CUIKBundle();
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("invitees_commented"), &stru_1E6EBAE30, 0);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "localizedStringWithFormat:", v39, v96[3]);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "appendString:", v40);

          if (v96[3] > 1)
            objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("MultipleComments"));
        }
        if (v88[3] >= 1)
        {
          if (objc_msgSend(v12, "length"))
            objc_msgSend(v12, "appendString:", CFSTR("\n"));
          v41 = (void *)MEMORY[0x1E0CB3940];
          CUIKBundle();
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "localizedStringForKey:value:table:", CFSTR("invitees_proposed_time"), &stru_1E6EBAE30, 0);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "localizedStringWithFormat:", v43, v88[3]);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "appendString:", v44);

          if (v88[3] >= 2)
            objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("TimeProposals"));
        }
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, CFSTR("Action"));
        goto LABEL_27;
      }
      v34 = (void *)MEMORY[0x1E0CB3940];
      CUIKBundle();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("invitees_declined_short"), &stru_1E6EBAE30, 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "localizedStringWithFormat:", v35, v92[3]);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "appendString:", v36);

    }
    goto LABEL_16;
  }
  if (v88[3] < 1)
  {
    if (v8 < 1)
    {
      v50 = (void *)MEMORY[0x1E0CB3940];
      if (v96[3] < 1)
      {
        CUIKBundle();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Message"), &stru_1E6EBAE30, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "localizedStringWithFormat:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, CFSTR("Action"));
        goto LABEL_7;
      }
      CUIKBundle();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("%@ commented"), &stru_1E6EBAE30, 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      CalShortDisplayStringForNotificationIdentity((void *)v74[5], 1, 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "localizedStringWithFormat:", v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v33, CFSTR("Action"));
    }
    else
    {
      v49 = (void *)MEMORY[0x1E0CB3940];
      CUIKBundle();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("%@ declined"), &stru_1E6EBAE30, 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      CalShortDisplayStringForNotificationIdentity((void *)v74[5], 1, 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "localizedStringWithFormat:", v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v33, CFSTR("Action"));
    }
  }
  else
  {
    v29 = (void *)MEMORY[0x1E0CB3940];
    CUIKBundle();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("%@ proposed a new time"), &stru_1E6EBAE30, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    CalShortDisplayStringForNotificationIdentity((void *)v74[5], 1, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "localizedStringWithFormat:", v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v33, CFSTR("Action"));
  }

  objc_msgSend(v7, "setObject:forKeyedSubscript:", v74[5], CFSTR("ImportantAttendee"));
LABEL_28:
  if (objc_msgSend((id)v62[5], "length"))
  {
    v45 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Action"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "stringWithFormat:", CFSTR("%@\n%@"), v46, v62[5]);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v47, CFSTR("Action"));

  }
  _Block_object_dispose(&v61, 8);

  _Block_object_dispose(&v67, 8);
  _Block_object_dispose(&v73, 8);

  _Block_object_dispose(&v79, 8);
  _Block_object_dispose(&v83, 8);
  _Block_object_dispose(&v87, 8);
  _Block_object_dispose(&v91, 8);
  _Block_object_dispose(&v95, 8);

  return 0;
}

- (id)_dateString:()CUIKDescription
{
  void *v5;
  void *v6;
  const __CFString *v7;
  __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  if (objc_msgSend(a1, "timeChanged"))
  {
    CUIKBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("Time changed to %@");
  }
  else
  {
    if (!objc_msgSend(a1, "dateChanged"))
    {
      if ((a3 & 0x100) == 0)
      {
        v8 = CFSTR("%@");
        v9 = 1;
        goto LABEL_9;
      }
LABEL_11:
      v14 = 0;
      return v14;
    }
    CUIKBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("Date changed to %@");
  }
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_1E6EBAE30, 0);
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_11;
  v9 = 0;
LABEL_9:
  v10 = objc_msgSend(a1, "isAllDay");
  objc_msgSend(a1, "startDateForNextOccurrence");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    +[CUIKDateDescriptionGenerator sharedGenerator](CUIKDateDescriptionGenerator, "sharedGenerator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dateStringForDate:allDay:standalone:shortFormat:", v11, v10, v9, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v8, CFSTR("%@"), 0, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_locationString:()CUIKDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  int v9;
  void *v10;
  const __CFString *v11;

  if (objc_msgSend(a1, "isLocationDecline"))
  {
    v2 = (void *)MEMORY[0x1E0CB3940];
    CUIKBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("%@ is unavailable"), &stru_1E6EBAE30, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "localizedStringWithFormat:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
  if (objc_msgSend(a1, "type") == 3)
    return 0;
  v7 = objc_msgSend(a1, "locationChanged");
  v8 = objc_msgSend(a1, "videoConferenceChanged");
  v9 = v8;
  if (v7)
  {
    CUIKBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v10;
    if (v9)
      v11 = CFSTR("Location changed and Video Call updated");
    else
      v11 = CFSTR("Location changed");
    goto LABEL_11;
  }
  if (!v8)
    return 0;
  CUIKBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v10;
  v11 = CFSTR("Video Call updated");
LABEL_11:
  objc_msgSend(v10, "localizedStringForKey:value:table:", v11, &stru_1E6EBAE30, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v6;
}

- (id)_recurrenceChangedString
{
  void *v1;
  void *v2;

  if (objc_msgSend(a1, "recurrenceChanged"))
  {
    CUIKBundle();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("Repeat frequency or end date changed"), &stru_1E6EBAE30, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

@end
