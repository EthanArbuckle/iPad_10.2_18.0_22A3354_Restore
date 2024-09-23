@implementation EKEventNotesInlineEditItem

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4
{
  double result;

  +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:shouldScaleForSmallerSizes:](EKUILargeTextUtilities, "contentSizeCategoryScaledValueForDefaultValue:shouldScaleForSmallerSizes:", 0, 183.0);
  return result;
}

- (void)reset
{
  CalendarNotesCell *cell;
  id v4;

  cell = self->_cell;
  self->_cell = 0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4FE8], 0);
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4FE0], 0);

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
  int HasInlineExchangeAttachments;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  cell = self->_cell;
  if (!cell)
  {
    v5 = -[CalendarNotesCell initWithStyle:reuseIdentifier:]([CalendarNotesCell alloc], "initWithStyle:reuseIdentifier:", 0, 0);
    v6 = self->_cell;
    self->_cell = v5;

    EventKitUIBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Notes"), &stru_1E601DFA8, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalendarNotesCell setPlaceholder:](self->_cell, "setPlaceholder:", v8);

    -[EKEventEditItem event](self, "event");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "displayNotes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[EKEventEditItem event](self, "event");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "calendar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "type") == 2)
    {
      HasInlineExchangeAttachments = CUIKNotesFieldHasInlineExchangeAttachments();

      if (!HasInlineExchangeAttachments)
      {
LABEL_7:
        -[CalendarNotesCell textView](self->_cell, "textView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setText:", v10);

        -[CalendarNotesCell textView](self->_cell, "textView");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setDelegate:", self);

        -[CalendarNotesCell textView](self->_cell, "textView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        CalDisableFocusRingForView();

        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObserver:selector:name:object:", self, sel__keyboardWillShow_, *MEMORY[0x1E0DC4FE8], 0);
        objc_msgSend(v18, "addObserver:selector:name:object:", self, sel__keyboardWillHide_, *MEMORY[0x1E0DC4FE0], 0);

        cell = self->_cell;
        return cell;
      }
      -[CalendarNotesCell textView](self->_cell, "textView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setEditable:", 0);

      CUIKStripInlineExchangeAttachmentsFromNotes();
      v11 = v10;
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {

    }
    goto LABEL_7;
  }
  return cell;
}

- (void)_keyboardWillShow:(id)a3
{
  CGRect *p_keyboardRect;
  void *v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  id v9;

  p_keyboardRect = &self->_keyboardRect;
  objc_msgSend(a3, "userInfo");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0DC4E90]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "CGRectValue");
  p_keyboardRect->origin.x = v5;
  p_keyboardRect->origin.y = v6;
  p_keyboardRect->size.width = v7;
  p_keyboardRect->size.height = v8;

}

- (void)_keyboardWillHide:(id)a3
{
  CGSize v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  v4 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  self->_keyboardRect.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  self->_keyboardRect.size = v4;
  -[CalendarNotesCell textView](self->_cell, "textView", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentInset");
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[CalendarNotesCell textView](self->_cell, "textView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setContentInset:", v7, v9, 0.0, v11);

}

- (void)tableViewDidScroll
{
  void *v3;
  int v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  void *v25;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  double height;
  id v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  -[CalendarNotesCell textView](self->_cell, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEditing");

  if (v4)
  {
    -[CalendarNotesCell textView](self->_cell, "textView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentInset");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    -[CalendarNotesCell textView](self->_cell, "textView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "window");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalendarNotesCell textView](self->_cell, "textView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "convertRect:toView:", v16, self->_keyboardRect.origin.x, self->_keyboardRect.origin.y, self->_keyboardRect.size.width, self->_keyboardRect.size.height);
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;

    -[CalendarNotesCell textView](self->_cell, "textView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "bounds");
    v34.origin.x = v18;
    v34.origin.y = v20;
    v34.size.width = v22;
    v34.size.height = v24;
    v32 = CGRectIntersection(v31, v34);
    x = v32.origin.x;
    y = v32.origin.y;
    width = v32.size.width;
    height = v32.size.height;

    v33.origin.x = x;
    v33.origin.y = y;
    v33.size.width = width;
    v33.size.height = height;
    if (!CGRectIsEmpty(v33))
      v11 = height;
    -[CalendarNotesCell textView](self->_cell, "textView");
    v30 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setContentInset:", v7, v9, v11, v13);

  }
}

- (BOOL)saveAndDismissWithForce:(BOOL)a3
{
  CalendarNotesCell *cell;
  void *v5;
  void *v6;
  void *v7;

  cell = self->_cell;
  if (cell && self->_textViewDirty)
  {
    -[CalendarNotesCell textView](cell, "textView", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventEditItem event](self, "event");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDisplayNotes:", v6);

    self->_textViewDirty = 0;
  }
  -[EKCalendarItemEditItem notifySubitemDidSave:](self, "notifySubitemDidSave:", 0);
  return 1;
}

- (BOOL)isSaveable
{
  NSString *lastTextChange;
  void *v3;
  void *v4;

  lastTextChange = self->_lastTextChange;
  -[EKEventEditItem event](self, "event");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayNotes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(lastTextChange) = !-[NSString isEqualToString:](lastTextChange, "isEqualToString:", v4);

  return (char)lastTextChange;
}

- (id)searchStringForEventAutocomplete
{
  return 0;
}

- (void)textViewDidBeginEditing:(id)a3
{
  -[EKCalendarItemEditItem setSelectedResponder:](self, "setSelectedResponder:", a3);
  -[EKCalendarItemEditItem notifyDidStartEditing](self, "notifyDidStartEditing");
}

- (void)textViewDidEndEditing:(id)a3
{
  -[EKCalendarItemEditItem notifyDidEndEditing](self, "notifyDidEndEditing", a3);
  -[EKCalendarItemEditItem setSelectedResponder:](self, "setSelectedResponder:", 0);
}

- (void)textViewDidChange:(id)a3
{
  NSString *v4;
  NSString *lastTextChange;

  objc_msgSend(a3, "text");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  lastTextChange = self->_lastTextChange;
  self->_lastTextChange = v4;

  self->_textViewDirty = 1;
  -[EKCalendarItemEditItem notifyTextChanged](self, "notifyTextChanged");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastTextChange, 0);
  objc_storeStrong((id *)&self->_cell, 0);
}

@end
