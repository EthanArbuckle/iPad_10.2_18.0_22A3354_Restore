@implementation CalendarPublishingActivityViewController

- (BOOL)_shouldShowSystemActivityType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D96DD0]) & 1) != 0)
    LOBYTE(v4) = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D96DF8]) ^ 1;

  return v4;
}

- (void)_prepareActivity:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v24, "messageComposeViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalendarPublishingActivityViewController activityDelegate](self, "activityDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pubishURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBody:", v6);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_6;
    objc_msgSend(v24, "mailComposeViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB3940];
    EventKitUIBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Subscribe to my %@ Calendar"), &stru_1E601DFA8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalendarPublishingActivityViewController activityDelegate](self, "activityDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "calendarTitle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSubject:", v12);

    v13 = (void *)MEMORY[0x1E0CB3940];
    EventKitUIBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Subscribe to my %@ Calendar at: %@"), &stru_1E601DFA8, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalendarPublishingActivityViewController activityDelegate](self, "activityDelegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "calendarTitle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalendarPublishingActivityViewController activityDelegate](self, "activityDelegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "pubishURL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringWithFormat:", v15, v17, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMessageBody:isHTML:", v20, 0);

    objc_msgSend(v4, "setKeyboardVisible:", 1);
  }

LABEL_6:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v24, "pasteboard");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalendarPublishingActivityViewController activityDelegate](self, "activityDelegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "pubishURL");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setString:", v23);

  }
}

- (CalendarPublishingActivityDelegate)activityDelegate
{
  return (CalendarPublishingActivityDelegate *)objc_loadWeakRetained((id *)&self->_activityDelegate);
}

- (void)setActivityDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_activityDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_activityDelegate);
}

@end
