@implementation EKConferenceInformationInlineEditItem

- (BOOL)shouldAppear
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;

  -[EKEventEditItem event](self, "event");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "virtualConference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[EKEventEditItem event](self, "event");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "virtualConference");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "joinMethods");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v7, "count") <= 1)
    {
      -[EKEventEditItem event](self, "event");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "virtualConference");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "conferenceDetails");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v11, "length") != 0;

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

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4
{
  double result;

  +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:shouldScaleForSmallerSizes:](EKUILargeTextUtilities, "contentSizeCategoryScaledValueForDefaultValue:shouldScaleForSmallerSizes:", 0, 183.0);
  return result;
}

- (void)reset
{
  CalendarNotesCell *cell;

  cell = self->_cell;
  self->_cell = 0;

}

- (BOOL)isInline
{
  return 1;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  CalendarNotesCell *cell;
  CalendarNotesCell *v5;
  CalendarNotesCell *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  cell = self->_cell;
  if (!cell)
  {
    v5 = -[CalendarNotesCell initWithStyle:reuseIdentifier:]([CalendarNotesCell alloc], "initWithStyle:reuseIdentifier:", 0, 0);
    v6 = self->_cell;
    self->_cell = v5;

    -[CalendarNotesCell textView](self->_cell, "textView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEditable:", 0);

    -[CalendarNotesCell textView](self->_cell, "textView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDataDetectorTypes:", -1);

    -[EKEventEditItem event](self, "event");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "virtualConferenceTextRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalendarNotesCell textView](self->_cell, "textView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setText:", v10);

    -[CalendarNotesCell textView](self->_cell, "textView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    CalDisableFocusRingForView();

    cell = self->_cell;
  }
  return cell;
}

- (BOOL)isSaveable
{
  return 0;
}

- (id)searchStringForEventAutocomplete
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cell, 0);
}

@end
