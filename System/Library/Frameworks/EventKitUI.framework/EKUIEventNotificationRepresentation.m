@implementation EKUIEventNotificationRepresentation

+ (id)defaultEventNotificationRepresentationWithTitle:(id)a3 message:(id)a4 notes:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init((Class)a1);
  objc_msgSend(v11, "setType:", 0);
  EventKitUIBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Unknown title"), CFSTR("Title"), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKUITextAndHeaderItem itemWithText:andHeader:](EKUITextAndHeaderItem, "itemWithText:andHeader:", v10, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setTitleItem:", v14);
  +[EKUITextAndHeaderItem itemWithText:andHeader:](EKUITextAndHeaderItem, "itemWithText:andHeader:", v9, &stru_1E601DFA8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setSubtitleItem:", v15);
  objc_msgSend((id)objc_opt_class(), "previewForNotes:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setNotes:", v16);
  return v11;
}

+ (id)upcomingEventNotificationRepresentationWithEvent:(id)a3 date:(id)a4 displayTimeZone:(id)a5
{
  id v8;
  id v9;
  id v10;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
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
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t i;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void (**v62)(void *, void *, void *);
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v71;
  id v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  id v81;
  void *v82;
  _QWORD aBlock[4];
  id v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v81 = a5;
  v10 = objc_alloc_init((Class)a1);
  objc_msgSend(v10, "setType:", 1);
  objc_msgSend(v10, "setAllDay:", objc_msgSend(v8, "isAllDay"));
  v80 = v9;
  objc_msgSend(v10, "setDate:", v9);
  v11 = (void *)objc_opt_class();
  objc_msgSend(v8, "notes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "previewForNotes:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNotes:", v13);

  objc_msgSend(v8, "title");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  EventKitUIBundle();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Title"), &stru_1E601DFA8, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKUITextAndHeaderItem itemWithText:andHeader:](EKUITextAndHeaderItem, "itemWithText:andHeader:", v14, v16);
  v17 = objc_claimAutoreleasedReturnValue();

  v79 = (void *)v17;
  objc_msgSend(v10, "setTitleItem:", v17);
  v18 = (void *)MEMORY[0x1E0D0CD88];
  objc_msgSend(v8, "location");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "locationWithoutPrediction");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferredLocation");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "locationStringForLocation:locationWithoutPrediction:preferredLocation:conferenceURL:conferenceURLIsBroadcast:options:", v19, v20, v21, 0, 0, 96);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "string");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v23, "length"))
  {
    objc_msgSend((id)objc_opt_class(), "_whereLocalizedString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[EKUITextAndHeaderItem itemWithText:andHeader:](EKUITextAndHeaderItem, "itemWithText:andHeader:", v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setSubtitleItem:", v25);
  }
  v78 = v23;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKStringFactory sharedInstance](EKStringFactory, "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startDate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endDateUnadjustedForLegacyClients");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "dateStringForEventInvitationWithStartDate:endDate:timeZone:allDay:", v28, v29, v81, objc_msgSend(v8, "isAllDay"));
  v30 = objc_claimAutoreleasedReturnValue();

  v31 = v26;
  objc_msgSend((id)objc_opt_class(), "_whenLocalizedString");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = (void *)v30;
  +[EKUITextAndHeaderItem itemWithText:andHeader:](EKUITextAndHeaderItem, "itemWithText:andHeader:", v30, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addObject:", v33);

  objc_msgSend(v8, "organizer");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if (v34 && (objc_msgSend(v34, "isCurrentUser") & 1) == 0)
  {
    CUIKDisplayStringForNotificationIdentity();
    v36 = v35;
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_fromLocalizedString");
    v38 = v31;
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    +[EKUITextAndHeaderItem itemWithText:andHeader:](EKUITextAndHeaderItem, "itemWithText:andHeader:", v37, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addObject:", v40);

    v31 = v38;
    v35 = v36;
  }
  objc_msgSend(v8, "attendees");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v41;
  v43 = v80;
  if (v41 && objc_msgSend(v41, "count"))
  {
    v73 = v42;
    v74 = v10;
    objc_msgSend(v8, "sortEKParticipantsIgnoringNonHumans:", v42);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (void *)objc_opt_new();
    v45 = v35;
    v46 = (void *)objc_opt_new();
    v82 = (void *)objc_opt_new();
    v76 = v45;
    if (v45 && objc_msgSend(v45, "isCurrentUser"))
    {
      v71 = v31;
      v72 = v8;
      v87 = 0u;
      v88 = 0u;
      v85 = 0u;
      v86 = 0u;
      v47 = v75;
      v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v85, v89, 16);
      if (v48)
      {
        v49 = v48;
        v50 = *(_QWORD *)v86;
        do
        {
          for (i = 0; i != v49; ++i)
          {
            if (*(_QWORD *)v86 != v50)
              objc_enumerationMutation(v47);
            v52 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * i);
            objc_msgSend(v52, "name");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = v53;
            if (v53)
            {
              v55 = v53;
            }
            else
            {
              objc_msgSend(v52, "URL");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v56, "resourceSpecifier");
              v55 = (id)objc_claimAutoreleasedReturnValue();

            }
            v57 = objc_msgSend(v52, "participantStatus");
            v58 = v44;
            if (v57 == 3
              || (v59 = objc_msgSend(v52, "participantStatus"), v58 = v46, v59 == 4)
              || (v60 = objc_msgSend(v52, "participantStatus"), v58 = v82, !v60)
              || (v61 = objc_msgSend(v52, "participantStatus"), v58 = v82, !v61))
            {
              objc_msgSend(v58, "addObject:", v55);
            }

          }
          v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v85, v89, 16);
        }
        while (v49);
      }

      v31 = v71;
      v8 = v72;
    }
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __109__EKUIEventNotificationRepresentation_upcomingEventNotificationRepresentationWithEvent_date_displayTimeZone___block_invoke;
    aBlock[3] = &unk_1E6018E20;
    v84 = v31;
    v62 = (void (**)(void *, void *, void *))_Block_copy(aBlock);
    EventKitUIBundle();
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "localizedStringForKey:value:table:", CFSTR("Declined"), &stru_1E601DFA8, 0);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v62[2](v62, v44, v64);

    EventKitUIBundle();
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "localizedStringForKey:value:table:", CFSTR("No Reply"), &stru_1E601DFA8, 0);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v62[2](v62, v82, v66);

    EventKitUIBundle();
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "localizedStringForKey:value:table:", CFSTR("Maybe"), &stru_1E601DFA8, 0);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v62[2](v62, v46, v68);

    v42 = v73;
    v10 = v74;
    v43 = v80;
    v35 = v76;
  }
  if (objc_msgSend(v31, "count"))
  {
    v69 = (void *)objc_msgSend(v31, "copy");
    objc_msgSend(v10, "setSupplementaryItems:", v69);

  }
  return v10;
}

void __109__EKUIEventNotificationRepresentation_upcomingEventNotificationRepresentationWithEvent_date_displayTimeZone___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v5 = a3;
  if ((unint64_t)objc_msgSend(v13, "count") >= 3)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    EventKitUIBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("%d invitees"), &stru_1E601DFA8, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringWithFormat:", v8, objc_msgSend(v13, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = *(void **)(a1 + 32);
    +[EKUITextAndHeaderItem itemWithText:andHeader:](EKUITextAndHeaderItem, "itemWithText:andHeader:", v9, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v10;
LABEL_5:
    objc_msgSend(v12, "addObject:", v11);

    goto LABEL_6;
  }
  if (objc_msgSend(v13, "count"))
  {
    objc_msgSend(v13, "componentsJoinedByString:", CFSTR("\n"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[EKUITextAndHeaderItem itemWithText:andHeader:](EKUITextAndHeaderItem, "itemWithText:andHeader:", v9, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLines:", objc_msgSend(v13, "count"));
    v12 = *(void **)(a1 + 32);
    goto LABEL_5;
  }
LABEL_6:

}

+ (id)invitationNotificationRepresentationWithNotification:(id)a3 event:(id)a4 date:(id)a5 endDate:(id)a6 timeZone:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  id v30;
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
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  char v57;
  void *v58;
  id v60;
  void *v61;
  id v62;
  id v63;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v62 = a6;
  v60 = a7;
  v15 = objc_alloc_init((Class)a1);
  v16 = v12;
  objc_msgSend(v15, "setType:", 2);
  v17 = (void *)objc_opt_new();
  objc_msgSend(v16, "title");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setText:", v18);

  v19 = (void *)objc_opt_new();
  if (objc_msgSend(v16, "type") == 2)
  {
    EventKitUIBundle();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("Canceled"), &stru_1E601DFA8, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setHeader:", v21);

    EventKitUIBundle();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("Canceled by"), &stru_1E601DFA8, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setHeader:", v23);

    CUIKDisplayStringForNotificationIdentity();
    v24 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v28 = (void *)v24;
    objc_msgSend(v19, "setText:", v24);

    goto LABEL_10;
  }
  v25 = objc_msgSend(v16, "type");
  v26 = (void *)objc_opt_class();
  if (v25 == 3)
  {
    objc_msgSend(v26, "_invitationUpdatedTitleLocalizedString");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setHeader:", v27);

    CUIKMessageStringForEventInvitationNotification();
    v24 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v63 = 0;
  v29 = objc_msgSend(v26, "_invitationNotificationHasResourceChanges:changesString:", v16, &v63);
  v30 = v63;
  if (v29)
  {
    objc_msgSend((id)objc_opt_class(), "_invitationUpdatedTitleLocalizedString");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setHeader:", v31);

    objc_msgSend(v19, "setText:", v30);
  }
  else
  {
    EventKitUIBundle();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("Invitation"), &stru_1E601DFA8, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setHeader:", v33);

    objc_msgSend((id)objc_opt_class(), "_fromLocalizedString");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setHeader:", v34);

    CUIKDisplayStringForNotificationIdentity();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setText:", v35);

  }
LABEL_10:
  objc_msgSend(v15, "setDate:", v14);
  if ((objc_msgSend(v13, "isAllDay") & 1) == 0)
  {
    objc_msgSend(v13, "endDateUnadjustedForLegacyClients");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      objc_msgSend(v15, "setEndDate:", v62);
      objc_msgSend(v13, "potentialConflictOccurrenceDatesInTimePeriod:", 0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setPotentialConflictDates:", v37);

      objc_msgSend(v13, "calendar");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "source");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "sourceIdentifier");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setSourceIdentifier:", v40);

      objc_msgSend(v13, "externalURL");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "absoluteString");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setExternalURLString:", v42);

    }
  }
  v61 = v13;
  objc_msgSend(v15, "setTitleItem:", v17);
  objc_msgSend(v15, "setSubtitleItem:", v19);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)objc_opt_new();
  objc_msgSend((id)objc_opt_class(), "_whenLocalizedString");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setHeader:", v45);

  +[EKStringFactory sharedInstance](EKStringFactory, "sharedInstance");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v14;
  objc_msgSend(v46, "dateStringForEventInvitationWithStartDate:endDate:timeZone:allDay:", v14, v62, v60, objc_msgSend(v16, "isAllDay"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v44, "setText:", v48);
  objc_msgSend(v43, "addObject:", v44);
  objc_msgSend(v16, "location");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "length");

  if (v50)
  {
    v51 = (void *)objc_opt_new();
    objc_msgSend((id)objc_opt_class(), "_whereLocalizedString");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setHeader:", v52);

    objc_msgSend(v16, "location");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setText:", v53);

    objc_msgSend(v43, "addObject:", v51);
  }
  v54 = (void *)objc_msgSend(v43, "copy");
  objc_msgSend(v15, "setSupplementaryItems:", v54);

  objc_msgSend(v16, "owner");
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  if (v55)
  {
    objc_msgSend(v16, "owner");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v56, "isCurrentUser");

    if ((v57 & 1) == 0)
    {
      objc_msgSend(v16, "owner");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_setOwnerForContactDictionary:", v58);

    }
  }

  return v15;
}

+ (id)_invitationUpdatedTitleLocalizedString
{
  void *v2;
  void *v3;

  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Updates"), &stru_1E601DFA8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_whenLocalizedString
{
  void *v2;
  void *v3;

  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("When"), &stru_1E601DFA8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_whereLocalizedString
{
  void *v2;
  void *v3;

  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Where"), &stru_1E601DFA8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_fromLocalizedString
{
  void *v2;
  void *v3;

  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("From"), &stru_1E601DFA8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)_invitationNotificationHasResourceChanges:(id)a3 changesString:(id *)a4
{
  id v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a3;
  if ((objc_msgSend(v5, "timeChanged") & 1) != 0 || (objc_msgSend(v5, "dateChanged") & 1) != 0)
  {
    v6 = 1;
    if (!a4)
      goto LABEL_20;
  }
  else
  {
    v6 = objc_msgSend(v5, "locationChanged");
    if (!a4)
      goto LABEL_20;
  }
  if (!v6)
    goto LABEL_20;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "timeChanged") & 1) != 0 || objc_msgSend(v5, "dateChanged"))
  {
    if (objc_msgSend(v5, "timeChanged"))
    {
      EventKitUIBundle();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = CFSTR("Time changed");
      goto LABEL_13;
    }
    if (objc_msgSend(v5, "dateChanged"))
    {
      EventKitUIBundle();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = CFSTR("Date changed");
LABEL_13:
      objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_1E601DFA8, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v7, "addObject:", v11);

      }
    }
  }
  if (objc_msgSend(v5, "locationChanged"))
  {
    if (objc_msgSend(v5, "locationChanged"))
    {
      EventKitUIBundle();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Location changed"), &stru_1E601DFA8, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(v7, "addObject:", v13);

      }
    }
  }
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR("\n"));
  *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_20:
  return v6;
}

+ (id)responseNotificationWithTitle:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init((Class)a1);
  objc_msgSend(v8, "setType:", 3);
  EventKitUIBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Shared Calendar"), &stru_1E601DFA8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKUITextAndHeaderItem itemWithText:andHeader:](EKUITextAndHeaderItem, "itemWithText:andHeader:", v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setTitleItem:", v11);
  +[EKUITextAndHeaderItem itemWithText:andHeader:](EKUITextAndHeaderItem, "itemWithText:andHeader:", v6, &stru_1E601DFA8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setSubtitleItem:", v12);
  return v8;
}

+ (id)resourceChangeNotificationWithNotification:(id)a3 message:(id)a4 date:(id)a5 endDate:(id)a6 timeZone:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v35;
  id v36;

  v12 = a3;
  v35 = a5;
  v13 = a6;
  v36 = a7;
  v14 = a4;
  v15 = objc_alloc_init((Class)a1);
  objc_msgSend(v15, "setType:", 4);
  v16 = v12;
  v17 = (void *)objc_opt_new();
  EventKitUIBundle();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Shared Event"), &stru_1E601DFA8, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setHeader:", v19);

  objc_msgSend(v16, "title");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setText:", v20);

  objc_msgSend(v15, "setTitleItem:", v17);
  v21 = v35;
  +[EKUITextAndHeaderItem itemWithText:andHeader:](EKUITextAndHeaderItem, "itemWithText:andHeader:", v14, &stru_1E601DFA8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setSubtitleItem:", v22);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "changeType") != 3)
  {
    v24 = (void *)objc_opt_new();
    objc_msgSend((id)objc_opt_class(), "_whenLocalizedString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setHeader:", v25);

    +[EKStringFactory sharedInstance](EKStringFactory, "sharedInstance");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "dateStringForEventInvitationWithStartDate:endDate:timeZone:allDay:", v35, v13, v36, objc_msgSend(v16, "allDay"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setText:", v27);

    objc_msgSend(v23, "addObject:", v24);
  }
  objc_msgSend(v16, "location", v35);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "length");

  if (v29)
  {
    v30 = (void *)objc_opt_new();
    objc_msgSend((id)objc_opt_class(), "_whereLocalizedString");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setHeader:", v31);

    objc_msgSend(v16, "location");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setText:", v32);

    objc_msgSend(v23, "addObject:", v30);
  }
  v33 = (void *)objc_msgSend(v23, "copy");
  objc_msgSend(v15, "setSupplementaryItems:", v33);

  objc_msgSend(v15, "setDate:", v21);
  objc_msgSend(v15, "setEndDate:", v13);

  return v15;
}

+ (id)timeToLeaveNotificationRepresentationWithHypothesisMessage:(id)a3 event:(id)a4 date:(id)a5 displayTimeZone:(id)a6
{
  id v10;
  void *v11;

  v10 = a3;
  objc_msgSend(a1, "upcomingEventNotificationRepresentationWithEvent:date:displayTimeZone:", a4, a5, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "updateUpcomingEventNotificationWithHypothesisMessage:", v10);

  return v11;
}

- (void)updateUpcomingEventNotificationWithHypothesisMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (a3)
  {
    v4 = a3;
    -[EKUIEventNotificationRepresentation setType:](self, "setType:", 5);
    +[EKUITextAndHeaderItem itemWithText:andHeader:](EKUITextAndHeaderItem, "itemWithText:andHeader:", v4, &stru_1E601DFA8);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    -[EKUIEventNotificationRepresentation setSubtitleItem:](self, "setSubtitleItem:", v8);
    -[EKUIEventNotificationRepresentation titleItem](self, "titleItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    EventKitUIBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Time to Leave Watch notification header"), CFSTR("Time to Leave"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHeader:", v7);

  }
}

- (EKUIEventNotificationRepresentation)initWithDictionary:(id)a3
{
  id v5;
  EKUIEventNotificationRepresentation *v6;
  void *v7;
  EKUITextAndHeaderItem *v8;
  void *v9;
  uint64_t v10;
  EKUITextAndHeaderItem *titleItem;
  EKUITextAndHeaderItem *v12;
  void *v13;
  uint64_t v14;
  EKUITextAndHeaderItem *subtitleItem;
  uint64_t v16;
  NSDictionary *userActivityUserInfo;
  uint64_t v18;
  NSDate *date;
  uint64_t v20;
  NSDate *endDate;
  void *v22;
  uint64_t v23;
  NSDictionary *organizerContactDictionary;
  uint64_t v25;
  NSString *sourceIdentifier;
  uint64_t v27;
  NSString *externalURLString;
  uint64_t v29;
  NSArray *potentialConflictDates;
  uint64_t v31;
  NSString *notes;
  NSArray *supplementaryItems;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  EKUITextAndHeaderItem *v42;
  uint64_t v43;
  NSArray *v44;
  void *v46;
  objc_class *v47;
  void *v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  objc_super v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v54.receiver = self;
  v54.super_class = (Class)EKUIEventNotificationRepresentation;
  v6 = -[EKUIEventNotificationRepresentation init](&v54, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = (objc_class *)objc_opt_class();
      NSStringFromClass(v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("EKUIEventNotificationRepresentation.m"), 340, CFSTR("%@ must have a EKUIEventNotificationRepresentationType"), v48);

    }
    v6->_type = objc_msgSend(v7, "integerValue");
    v8 = [EKUITextAndHeaderItem alloc];
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("title"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[EKUITextAndHeaderItem initWithDictionary:](v8, "initWithDictionary:", v9);
    titleItem = v6->_titleItem;
    v6->_titleItem = (EKUITextAndHeaderItem *)v10;

    v12 = [EKUITextAndHeaderItem alloc];
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("subtitle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[EKUITextAndHeaderItem initWithDictionary:](v12, "initWithDictionary:", v13);
    subtitleItem = v6->_subtitleItem;
    v6->_subtitleItem = (EKUITextAndHeaderItem *)v14;

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("userActivity"));
    v16 = objc_claimAutoreleasedReturnValue();
    userActivityUserInfo = v6->_userActivityUserInfo;
    v6->_userActivityUserInfo = (NSDictionary *)v16;

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("date"));
    v18 = objc_claimAutoreleasedReturnValue();
    date = v6->_date;
    v6->_date = (NSDate *)v18;

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("endDate"));
    v20 = objc_claimAutoreleasedReturnValue();
    endDate = v6->_endDate;
    v6->_endDate = (NSDate *)v20;

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("allDay"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_allDay = objc_msgSend(v22, "BOOLValue");

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("organizer"));
    v23 = objc_claimAutoreleasedReturnValue();
    organizerContactDictionary = v6->_organizerContactDictionary;
    v6->_organizerContactDictionary = (NSDictionary *)v23;

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sourceIdentifier"));
    v25 = objc_claimAutoreleasedReturnValue();
    sourceIdentifier = v6->_sourceIdentifier;
    v6->_sourceIdentifier = (NSString *)v25;

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("externalURL"));
    v27 = objc_claimAutoreleasedReturnValue();
    externalURLString = v6->_externalURLString;
    v6->_externalURLString = (NSString *)v27;

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("potentialConflictDates"));
    v29 = objc_claimAutoreleasedReturnValue();
    potentialConflictDates = v6->_potentialConflictDates;
    v6->_potentialConflictDates = (NSArray *)v29;

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("notes"));
    v31 = objc_claimAutoreleasedReturnValue();
    notes = v6->_notes;
    v6->_notes = (NSString *)v31;

    supplementaryItems = v6->_supplementaryItems;
    v6->_supplementaryItems = 0;

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("supplementary"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v34;
    if (v34)
    {
      v49 = v7;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v34, "count"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v37 = v35;
      v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
      if (v38)
      {
        v39 = v38;
        v40 = *(_QWORD *)v51;
        do
        {
          for (i = 0; i != v39; ++i)
          {
            if (*(_QWORD *)v51 != v40)
              objc_enumerationMutation(v37);
            v42 = -[EKUITextAndHeaderItem initWithDictionary:]([EKUITextAndHeaderItem alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i));
            objc_msgSend(v36, "addObject:", v42);

          }
          v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
        }
        while (v39);
      }

      v43 = objc_msgSend(v36, "copy");
      v44 = v6->_supplementaryItems;
      v6->_supplementaryItems = (NSArray *)v43;

      v7 = v49;
    }

  }
  return v6;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  EKUITextAndHeaderItem *titleItem;
  void *v6;
  EKUITextAndHeaderItem *subtitleItem;
  void *v8;
  void *v9;
  NSDictionary *userActivityUserInfo;
  NSDate *date;
  NSDate *endDate;
  NSDictionary *organizerContactDictionary;
  NSString *sourceIdentifier;
  NSString *externalURLString;
  NSArray *potentialConflictDates;
  void *v17;
  NSString *notes;
  void *v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("type"));

  titleItem = self->_titleItem;
  if (titleItem)
  {
    -[EKUITextAndHeaderItem dictionaryRepresentation](titleItem, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("title"));

  }
  subtitleItem = self->_subtitleItem;
  if (subtitleItem)
  {
    -[EKUITextAndHeaderItem dictionaryRepresentation](subtitleItem, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("subtitle"));

  }
  if (self->_supplementaryItems)
  {
    -[EKUIEventNotificationRepresentation dictionaryRepresentationsOfSupplementaryItems](self, "dictionaryRepresentationsOfSupplementaryItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("supplementary"));

  }
  userActivityUserInfo = self->_userActivityUserInfo;
  if (userActivityUserInfo)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", userActivityUserInfo, CFSTR("userActivity"));
  date = self->_date;
  if (date)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", date, CFSTR("date"));
  endDate = self->_endDate;
  if (endDate)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", endDate, CFSTR("endDate"));
  organizerContactDictionary = self->_organizerContactDictionary;
  if (organizerContactDictionary)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", organizerContactDictionary, CFSTR("organizer"));
  sourceIdentifier = self->_sourceIdentifier;
  if (sourceIdentifier)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", sourceIdentifier, CFSTR("sourceIdentifier"));
  externalURLString = self->_externalURLString;
  if (externalURLString)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", externalURLString, CFSTR("externalURL"));
  potentialConflictDates = self->_potentialConflictDates;
  if (potentialConflictDates)
  {
    v17 = (void *)-[NSArray copy](potentialConflictDates, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("potentialConflictDates"));

  }
  notes = self->_notes;
  if (notes)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", notes, CFSTR("notes"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_allDay);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("allDay"));

  v20 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v20;
}

- (id)dictionaryRepresentationsOfSupplementaryItems
{
  NSArray *supplementaryItems;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  supplementaryItems = self->_supplementaryItems;
  if (!supplementaryItems)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](supplementaryItems, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_supplementaryItems;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_msgSend(v4, "copy");
  return v11;
}

- (void)setOrganizerForContactDictionary:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSDictionary *v10;
  NSDictionary *organizerContactDictionary;
  id v12;

  v12 = a3;
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");

    if (v6)
    {
      objc_msgSend(v12, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("displayName"));

    }
    objc_msgSend(v12, "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "resourceSpecifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "length"))
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("rawAddress"));

  }
  else
  {
    v4 = 0;
  }
  v10 = (NSDictionary *)objc_msgSend(v4, "copy");
  organizerContactDictionary = self->_organizerContactDictionary;
  self->_organizerContactDictionary = v10;

}

- (void)_setOwnerForContactDictionary:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSDictionary *v10;
  NSDictionary *organizerContactDictionary;
  id v12;

  v12 = a3;
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");

    if (v6)
    {
      objc_msgSend(v12, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("displayName"));

    }
    objc_msgSend(v12, "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "resourceSpecifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "length"))
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("rawAddress"));

  }
  else
  {
    v4 = 0;
  }
  v10 = (NSDictionary *)objc_msgSend(v4, "copy");
  organizerContactDictionary = self->_organizerContactDictionary;
  self->_organizerContactDictionary = v10;

}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EKUIEventNotificationRepresentation;
  -[EKUIEventNotificationRepresentation description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("%@ title: %@ subtitle: %@ numSupplementaryItems %lu"), v3, self->_titleItem, self->_subtitleItem, -[NSArray count](self->_supplementaryItems, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)previewForNotes:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "length") <= 0x1F4)
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(v3, "substringToIndex:", 500);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (EKUITextAndHeaderItem)titleItem
{
  return self->_titleItem;
}

- (void)setTitleItem:(id)a3
{
  objc_storeStrong((id *)&self->_titleItem, a3);
}

- (EKUITextAndHeaderItem)subtitleItem
{
  return self->_subtitleItem;
}

- (void)setSubtitleItem:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleItem, a3);
}

- (NSArray)supplementaryItems
{
  return self->_supplementaryItems;
}

- (void)setSupplementaryItems:(id)a3
{
  objc_storeStrong((id *)&self->_supplementaryItems, a3);
}

- (NSDictionary)userActivityUserInfo
{
  return self->_userActivityUserInfo;
}

- (void)setUserActivityUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userActivityUserInfo, a3);
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (BOOL)isAllDay
{
  return self->_allDay;
}

- (void)setAllDay:(BOOL)a3
{
  self->_allDay = a3;
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (void)setSourceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sourceIdentifier, a3);
}

- (NSString)externalURLString
{
  return self->_externalURLString;
}

- (void)setExternalURLString:(id)a3
{
  objc_storeStrong((id *)&self->_externalURLString, a3);
}

- (NSArray)potentialConflictDates
{
  return self->_potentialConflictDates;
}

- (void)setPotentialConflictDates:(id)a3
{
  objc_storeStrong((id *)&self->_potentialConflictDates, a3);
}

- (NSString)notes
{
  return self->_notes;
}

- (void)setNotes:(id)a3
{
  objc_storeStrong((id *)&self->_notes, a3);
}

- (NSDictionary)organizerContactDictionary
{
  return self->_organizerContactDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_organizerContactDictionary, 0);
  objc_storeStrong((id *)&self->_notes, 0);
  objc_storeStrong((id *)&self->_potentialConflictDates, 0);
  objc_storeStrong((id *)&self->_externalURLString, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_userActivityUserInfo, 0);
  objc_storeStrong((id *)&self->_supplementaryItems, 0);
  objc_storeStrong((id *)&self->_subtitleItem, 0);
  objc_storeStrong((id *)&self->_titleItem, 0);
}

@end
