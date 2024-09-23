@implementation EKEventConferenceInformationDetailItem

- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;

  -[EKEvent virtualConference](self->super.super._event, "virtualConference", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[EKEvent virtualConference](self->super.super._event, "virtualConference");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "joinMethods");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v7, "count") <= 1)
    {
      -[EKEvent virtualConference](self->super.super._event, "virtualConference");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "conferenceDetails");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v10, "length") != 0;

    }
    else
    {
      v8 = 1;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)titleForExtendedViewController
{
  void *v2;
  void *v3;

  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Video Call Information"), &stru_1E601DFA8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)titleForCell
{
  void *v2;
  void *v3;

  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Video Call Information"), &stru_1E601DFA8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)textFromEventBlock
{
  return &__block_literal_global_35;
}

uint64_t __60__EKEventConferenceInformationDetailItem_textFromEventBlock__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "virtualConferenceTextRepresentation");
}

- (id)textForCopyAction
{
  EKEvent *event;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v9;
  id v10;

  event = self->super.super._event;
  v9 = 0;
  v10 = 0;
  -[EKEvent parsedConference:andNotes:](event, "parsedConference:andNotes:", &v10, &v9);
  v3 = v10;
  v4 = v9;
  v5 = objc_msgSend(v3, "range");
  objc_msgSend(v4, "substringWithRange:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)textForExtendedViewController
{
  return (id)-[EKEvent virtualConferenceTextRepresentation](self->super.super._event, "virtualConferenceTextRepresentation");
}

@end
