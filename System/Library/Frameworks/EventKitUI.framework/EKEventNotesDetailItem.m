@implementation EKEventNotesDetailItem

- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4
{
  void *v5;
  void *v6;
  char v7;

  -[EKEvent displayNotes](self->super.super._event, "displayNotes", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    -[EKEvent displayNotes](self->super.super._event, "displayNotes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CUIKShouldDisplayNotes();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)titleForExtendedViewController
{
  void *v2;
  void *v3;

  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Notes"), &stru_1E601DFA8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)titleForCell
{
  void *v2;
  void *v3;

  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Notes"), &stru_1E601DFA8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)textFromEventBlock
{
  return &__block_literal_global_52;
}

id __44__EKEventNotesDetailItem_textFromEventBlock__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v2 = a2;
  objc_msgSend(v2, "displayNotes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "calendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "type");

  if (v5 == 2)
  {
    objc_msgSend(v2, "displayNotes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    CUIKStripInlineExchangeAttachmentsFromNotes();
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
  }

  return v3;
}

- (id)textForCopyAction
{
  return (id)-[EKEvent displayNotes](self->super.super._event, "displayNotes");
}

- (id)textForExtendedViewController
{
  return (id)-[EKEvent displayNotes](self->super.super._event, "displayNotes");
}

@end
