@implementation EKiMIPReply

+ (BOOL)shouldSendEmailForEvent:(id)a3 withDiff:(id)a4
{
  id v5;
  BOOL v6;
  void *v7;
  void *v8;

  v5 = a4;
  if ((objc_msgSend(a3, "isSelfOrganized") & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v5, "summaryDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("selfAttendee.statusRaw"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v8 != 0;
  }

  return v6;
}

- (id)attendees
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[EKiMIPHandler event](self, "event");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "organizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)emailSubject
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[EKiMIPHandler event](self, "event");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "participationStatus");

  switch(v4)
  {
    case 4:
      EKBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("Event tentatively accepted: %@");
      break;
    case 3:
      EKBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("Event declined: %@");
      break;
    case 2:
      EKBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("Event accepted: %@");
      break;
    default:
LABEL_9:
      v12 = 0;
      return v12;
  }
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_1E4789A58, CFSTR("iTIP"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_9;
  v9 = (void *)MEMORY[0x1E0CB3940];
  -[EKiMIPHandler event](self, "event");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v8, CFSTR("%@"), 0, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)emailBody
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  const __CFString *v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  void *v23;
  int v24;
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
  int v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v46;

  v3 = (void *)MEMORY[0x1E0D0C2B0];
  -[EKiMIPHandler event](self, "event");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "requiresSingularLocalizationForDate:", v5);

  -[EKiMIPHandler event](self, "event");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "participationStatus");

  switch(v8)
  {
    case 4:
      -[EKiMIPHandler event](self, "event");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isAllDay");

      if (v15)
      {
        EKBundle();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        v13 = CFSTR("%@ has tentatively accepted your invitation to the event: %@, scheduled for %@.\n");
        goto LABEL_10;
      }
      -[EKiMIPHandler event](self, "event");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isFloating");

      EKBundle();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        if (v6)
          v13 = CFSTR("iTIP tentative acceptance floating event singular hour");
        else
          v13 = CFSTR("iTIP tentative acceptance floating event plural hour");
        v18 = CFSTR("%@ has tentatively accepted your invitation to the event: %@, scheduled for %@ at %@.\n");
      }
      else
      {
        if (v6)
          v13 = CFSTR("iTIP tentative acceptance timed event singular hour");
        else
          v13 = CFSTR("iTIP tentative acceptance timed event plural hour");
        v18 = CFSTR("%@ has tentatively accepted your invitation to the event: %@, scheduled for %@ at %@ (%@).\n");
      }
      break;
    case 3:
      -[EKiMIPHandler event](self, "event");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isAllDay");

      if (v17)
      {
        EKBundle();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        v13 = CFSTR("%@ has declined your invitation to the event: %@, scheduled for %@.\n");
        goto LABEL_10;
      }
      -[EKiMIPHandler event](self, "event");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isFloating");

      EKBundle();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        if (v6)
          v13 = CFSTR("iTIP decline floating event singular hour");
        else
          v13 = CFSTR("iTIP decline floating event plural hour");
        v18 = CFSTR("%@ has declined your invitation to the event: %@, scheduled for %@ at %@.\n");
      }
      else
      {
        if (v6)
          v13 = CFSTR("iTIP decline timed event singular hour");
        else
          v13 = CFSTR("iTIP decline timed event plural hour");
        v18 = CFSTR("%@ has declined your invitation to the event: %@, scheduled for %@ at %@ (%@).\n");
      }
      break;
    case 2:
      -[EKiMIPHandler event](self, "event");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isAllDay");

      if (v10)
      {
        EKBundle();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        v13 = CFSTR("%@ has accepted your invitation to the event: %@, scheduled for %@.\n");
LABEL_10:
        v18 = &stru_1E4789A58;
        goto LABEL_39;
      }
      -[EKiMIPHandler event](self, "event");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isFloating");

      EKBundle();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        if (v6)
          v13 = CFSTR("iTIP accept floating event singular hour");
        else
          v13 = CFSTR("iTIP accept floating event plural hour");
        v18 = CFSTR("%@ has accepted your invitation to the event: %@, scheduled for %@ at %@.\n");
      }
      else
      {
        if (v6)
          v13 = CFSTR("iTIP accept timed event singular hour");
        else
          v13 = CFSTR("iTIP accept timed event plural hour");
        v18 = CFSTR("%@ has accepted your invitation to the event: %@, scheduled for %@ at %@ (%@).\n");
      }
      break;
    default:
      goto LABEL_42;
  }
  v11 = v12;
LABEL_39:
  objc_msgSend(v11, "localizedStringForKey:value:table:", v13, v18, CFSTR("iTIP"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    objc_msgSend(MEMORY[0x1E0D0C298], "defaultProvider");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "myFullName");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    -[EKiMIPHandler event](self, "event");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "startDate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "localizedLongDate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    -[EKiMIPHandler event](self, "event");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "startDate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "localizedShortTime");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    -[EKiMIPHandler event](self, "event");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v32) = objc_msgSend(v34, "isAllDay");

    if ((_DWORD)v32)
    {
      v35 = (void *)MEMORY[0x1E0CB3940];
      -[EKiMIPHandler event](self, "event");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "title");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v25, CFSTR("%@%@%@"), 0, v27, v37, v30, v46);
    }
    else
    {
      -[EKiMIPHandler event](self, "event");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "isFloating");

      v41 = (void *)MEMORY[0x1E0CB3940];
      -[EKiMIPHandler event](self, "event");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "title");
      v42 = objc_claimAutoreleasedReturnValue();
      v37 = (void *)v42;
      if (!v40)
      {
        -[EKiMIPHandler event](self, "event");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "timeZone");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v25, CFSTR("%@%@%@%@%@"), 0, v27, v37, v30, v33, v44);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        v25 = v43;
        goto LABEL_47;
      }
      objc_msgSend(v41, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v25, CFSTR("%@%@%@%@"), 0, v27, v42, v30, v33);
    }
    v38 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_47:

    return v38;
  }
LABEL_42:
  v38 = 0;
  return v38;
}

- (id)emailAttachmentName
{
  return CFSTR("iCal-Reply.ics");
}

- (int)icsMethod
{
  return 3;
}

@end
