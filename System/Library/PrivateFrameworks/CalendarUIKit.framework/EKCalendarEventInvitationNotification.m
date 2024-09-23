@implementation EKCalendarEventInvitationNotification

void __103__EKCalendarEventInvitationNotification_CUIKDescription___attendeeReplyStringWithOptions_descriptions___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v5;
  int v7;
  _BOOL4 v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  unint64_t v14;
  void *v15;
  void *v16;
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
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;

  v5 = a2;
  v32 = a2;
  v7 = objc_msgSend(v32, "proposedStartDateDeclined");
  if (v7)
    LOBYTE(v7) = objc_msgSend(v32, "isCurrentUser");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v7;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a4 = 1;
  if (objc_msgSend(v32, "statusChanged"))
    v8 = objc_msgSend(v32, "participantStatus") == 3;
  else
    v8 = 0;
  if (objc_msgSend(v32, "proposedStartDateChanged"))
  {
    objc_msgSend(v32, "proposedStartDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 != 0;

  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v32, "comment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "CalStringByRemovingAutoComment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v32, "commentChanged"))
  {
    v13 = 0;
    if (!v8)
      goto LABEL_16;
    goto LABEL_15;
  }
  v13 = objc_msgSend(v12, "length") != 0;
  if (v8)
  {
LABEL_15:
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v5);
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  }
LABEL_16:
  v14 = 0x1E0CB3000uLL;
  if (v13)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("Comment"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = (void *)MEMORY[0x1E0CB3940];
    CUIKBundle();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v24)
    {
      objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("%@\n“%@”"), &stru_1E6EBAE30, 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("Comment"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localizedStringWithFormat:", v28, v29, v12);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v30, CFSTR("Comment"));

    }
    else
    {
      objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("“%@”"), &stru_1E6EBAE30, 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localizedStringWithFormat:", v28, v12);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v29, CFSTR("Comment"));
    }

    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    v14 = 0x1E0CB3000;
    if (v10)
      goto LABEL_18;
LABEL_25:
    if (!v8 && !v13)
      goto LABEL_29;
    goto LABEL_26;
  }
  if (!v10)
    goto LABEL_25;
LABEL_18:
  v15 = v5;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  +[CUIKDateDescriptionGenerator sharedGenerator](CUIKDateDescriptionGenerator, "sharedGenerator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "proposedStartDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dateStringForDate:allDay:standalone:shortFormat:", v17, 0, 1, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "length"))
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "appendString:", CFSTR("\n"));
  v19 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
  v20 = *(void **)(v14 + 2368);
  CUIKBundle();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Proposed Time: %@"), &stru_1E6EBAE30, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringWithFormat:", v22, v18);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "appendString:", v23);

  v5 = v15;
LABEL_26:
  v31 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
  if (*(_QWORD *)(v31 + 40))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = 1;
    v31 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
  }
  objc_storeStrong((id *)(v31 + 40), v5);
LABEL_29:

}

@end
