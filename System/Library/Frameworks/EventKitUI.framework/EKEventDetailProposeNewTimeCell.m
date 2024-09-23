@implementation EKEventDetailProposeNewTimeCell

- (EKEventDetailProposeNewTimeCell)initWithEvent:(id)a3 editable:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKEventDetailProposeNewTimeCell;
  return -[EKEventDetailCell initWithEvent:editable:style:](&v5, sel_initWithEvent_editable_style_, a3, a4, 1);
}

- (BOOL)hasCustomLayout
{
  void *v2;
  double v3;
  BOOL v4;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pointSize");
  v4 = v3 >= 18.5;

  return v4;
}

- (BOOL)shouldDisplayForEvent
{
  return -[EKEvent isExternallyOrganizedInvitation](self->super._event, "isExternallyOrganizedInvitation");
}

- (BOOL)update
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
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
  void *v24;

  v3 = -[EKEventDetailProposeNewTimeCell shouldDisplayForEvent](self, "shouldDisplayForEvent");
  if (!v3)
    return v3;
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEvent proposedStartDate](self->super._event, "proposedStartDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    EventKitUIBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v11 = CFSTR("Propose New Time");
LABEL_7:
    objc_msgSend(v8, "localizedStringForKey:value:table:", v11, &stru_1E601DFA8, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  -[EKEvent selfAttendee](self->super._event, "selfAttendee");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "proposedStartDateStatus");

  EventKitUIBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 != 3)
  {
    v11 = CFSTR("Proposed Time");
    goto LABEL_7;
  }
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Proposed Time Declined"), &stru_1E601DFA8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
  v9 = v4;
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  -[EKEventDetailProposeNewTimeCell textLabel](self, "textLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v10);

  -[EKEventDetailProposeNewTimeCell textLabel](self, "textLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTextColor:", v4);

  -[EKEventDetailProposeNewTimeCell textLabel](self, "textLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setNumberOfLines:", 0);

  -[EKEvent proposedStartDate](self->super._event, "proposedStartDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    EventKitUIBundle();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Date Time format"), CFSTR("%@, %@"), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v15, "localizedRelativeDateStringShortened:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeStringAlwaysIncludeMinutes:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringWithFormat:", v17, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[EKEventDetailProposeNewTimeCell detailTextLabel](self, "detailTextLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setText:", v21);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventDetailProposeNewTimeCell detailTextLabel](self, "detailTextLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setTextColor:", v23);

  }
  -[EKEventDetailProposeNewTimeCell setAccessoryType:](self, "setAccessoryType:", 1);

  return v3;
}

@end
