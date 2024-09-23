@implementation EKCalendarColorEditItem

- (void)reset
{
  NSMutableArray *cells;

  cells = self->_cells;
  self->_cells = 0;

}

- (BOOL)configureWithCalendar:(id)a3
{
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EKCalendarColorEditItem;
  v3 = a3;
  -[EKCalendarEditItem configureWithCalendar:](&v6, sel_configureWithCalendar_, v3);
  objc_msgSend(v3, "source", v6.receiver, v6.super_class);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v3) = objc_msgSend(v4, "isFacebookSource") ^ 1;
  return (char)v3;
}

- (void)setLayoutInline:(BOOL)a3
{
  NSMutableArray *cells;

  self->_layoutInline = a3;
  cells = self->_cells;
  self->_cells = 0;

}

- (id)_cellWithText:(id)a3
{
  id v3;
  EKUITableViewCell *v4;
  void *v5;

  v3 = a3;
  v4 = -[EKUITableViewCell initWithStyle:reuseIdentifier:]([EKUITableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, 0);
  -[EKUITableViewCell textLabel](v4, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v3);

  -[EKUITableViewCell setSelectionStyle:](v4, "setSelectionStyle:", 1);
  -[EKUITableViewCell setAccessoryType:](v4, "setAccessoryType:", 0);
  return v4;
}

- (id)_checkmarkCellForCustomColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  EventKitUIBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Custom…"), &stru_1E601DFA8, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[EKCalendarColorEditItem _cellWithText:](self, "_cellWithText:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "font");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  ScaledCalendarColorChooserDotImageForColor((uint64_t)v4, (uint64_t)v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "imageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setImage:", v10);

  return v7;
}

- (id)_cellForSymbolicColor:(id)a3
{
  EKEventStore *store;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  store = self->super._store;
  v5 = a3;
  -[EKEventStore localizedStringForSymbolicColorName:](store, "localizedStringForSymbolicColorName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarColorEditItem _cellWithText:](self, "_cellWithText:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CA9FF0], "displayColorForSymbolicName:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "font");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ScaledCalendarColorChooserDotImageForColor((uint64_t)v8, (uint64_t)v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setImage:", v11);

  return v7;
}

- (id)cells
{
  _BOOL4 layoutInline;
  id v4;
  NSMutableArray *v5;
  NSMutableArray *cells;
  EKEventStore *store;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  NSMutableArray *v16;
  NSMutableArray *v17;
  EKEventStore *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  UIColorPickerViewController *v23;
  UIColorPickerViewController *customColorPicker;
  void *v25;
  void *v26;

  if (!self->_cells)
  {
    layoutInline = self->_layoutInline;
    v4 = objc_alloc(MEMORY[0x1E0C99DE8]);
    if (layoutInline)
    {
      v5 = (NSMutableArray *)objc_msgSend(v4, "initWithCapacity:", 8);
      cells = self->_cells;
      self->_cells = v5;

      store = self->super._store;
      if (store)
      {
        -[EKEventStore colorForCalendar:](store, "colorForCalendar:", self->super._calendar);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          -[EKCalendarColorEditItem _setInitialColorOnCalendar](self, "_setInitialColorOnCalendar");
          -[EKEventStore colorForCalendar:](self->super._store, "colorForCalendar:", self->super._calendar);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
        }
        -[EKEventStore colorNamesInRainbowOrder](self->super._store, "colorNamesInRainbowOrder");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKEventStore defaultCalendarColorsInRainbowOrder](self->super._store, "defaultCalendarColorsInRainbowOrder");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "count"))
        {
          v11 = 0;
          v12 = 0;
          do
          {
            objc_msgSend(v10, "objectAtIndex:", v11);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "objectAtIndex:", v11);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[EKCalendarColorEditItem _cellForSymbolicColor:](self, "_cellForSymbolicColor:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v13, "isEqual:", v8))
            {
              self->_checkedRow = v11;
              objc_msgSend(v15, "setAccessoryType:", 3);
              v12 = 1;
            }
            -[NSMutableArray addObject:](self->_cells, "addObject:", v15);

            ++v11;
          }
          while (objc_msgSend(v9, "count") > v11);
        }
        else
        {
          v12 = 0;
        }
        if (!self->_customColorPicker)
        {
          v23 = (UIColorPickerViewController *)objc_alloc_init(MEMORY[0x1E0DC3668]);
          -[UIColorPickerViewController setSupportsAlpha:](v23, "setSupportsAlpha:", 0);
          -[UIColorPickerViewController setDelegate:](v23, "setDelegate:", self);
          -[UIColorPickerViewController setSelectedColor:](v23, "setSelectedColor:", v8);
          customColorPicker = self->_customColorPicker;
          self->_customColorPicker = v23;

        }
        -[UIColorPickerViewController selectedColor](self->_customColorPicker, "selectedColor");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKCalendarColorEditItem _checkmarkCellForCustomColor:](self, "_checkmarkCellForCustomColor:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if ((v12 & 1) != 0)
        {
          -[NSMutableArray addObject:](self->_cells, "addObject:", v26);
        }
        else
        {
          objc_msgSend(v26, "setAccessoryType:", 3);
          -[NSMutableArray addObject:](self->_cells, "addObject:", v26);
          self->_checkedRow = -[NSMutableArray count](self->_cells, "count") - 1;
        }

LABEL_23:
      }
    }
    else
    {
      v16 = (NSMutableArray *)objc_msgSend(v4, "initWithCapacity:", 1);
      v17 = self->_cells;
      self->_cells = v16;

      v18 = self->super._store;
      if (v18)
      {
        -[EKEventStore colorForCalendar:](v18, "colorForCalendar:", self->super._calendar);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          -[EKCalendarColorEditItem _setInitialColorOnCalendar](self, "_setInitialColorOnCalendar");
          -[EKEventStore colorForCalendar:](self->super._store, "colorForCalendar:", self->super._calendar);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
        }
        -[EKEventStore stringForColor:](self->super._store, "stringForColor:", v8);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKCalendarColorEditItem _cellWithText:](self, "_cellWithText:", v19);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        ScaledCalendarColorChooserDotImageForColor((uint64_t)v8, (uint64_t)v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "imageView");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setImage:", v21);

        objc_msgSend(v9, "setAccessoryType:", 1);
        -[NSMutableArray addObject:](self->_cells, "addObject:", v9);
        goto LABEL_23;
      }
    }
  }
  return self->_cells;
}

- (void)_setInitialColorOnCalendar
{
  const void *v3;
  void *v4;
  id v5;

  v3 = (const void *)-[EKEventStore copyCGColorForNewCalendar](self->super._store, "copyCGColorForNewCalendar");
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithCGColor:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
    CFRelease(v3);
  -[EKEventStore symbolicNameForColor:](self->super._store, "symbolicNameForColor:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[EKCalendar setSymbolicColorName:](self->super._calendar, "setSymbolicColorName:", v4);

}

- (void)setCalendar:(id)a3 store:(id)a4
{
  NSMutableArray *cells;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EKCalendarColorEditItem;
  -[EKCalendarEditItem setCalendar:store:](&v6, sel_setCalendar_store_, a3, a4);
  cells = self->_cells;
  self->_cells = 0;

}

- (unint64_t)numberOfSubitems
{
  void *v2;
  unint64_t v3;

  -[EKCalendarColorEditItem cells](self, "cells");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (unint64_t)lastSubitemIndex
{
  return -[EKCalendarColorEditItem numberOfSubitems](self, "numberOfSubitems") - 1;
}

- (id)headerTitle
{
  void *v2;
  void *v3;

  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Color"), &stru_1E601DFA8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[EKCalendarColorEditItem cells](self, "cells");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)calendarEditor:(id)a3 didSelectSubitem:(unint64_t)a4
{
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
  EKCalendarColorEditItem *v18;
  void *v19;
  EKCalendarColorViewController *v20;
  EKCalendarColorViewController *layoutInlineViewController;
  id v22;

  v22 = a3;
  if (self->_layoutInline)
  {
    -[EKCalendarColorEditItem cells](self, "cells");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", self->_checkedRow);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setAccessoryType:", 0);
    -[EKCalendarColorEditItem cells](self, "cells");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setAccessoryType:", 3);
    self->_checkedRow = a4;
    if (-[EKCalendarColorEditItem lastSubitemIndex](self, "lastSubitemIndex") == a4)
    {
      -[EKCalendarEditItem delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "owningNavigationController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "presentedViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
LABEL_10:
        -[EKCalendarColorEditItem saveStateToCalendar:](self, "saveStateToCalendar:", self->super._calendar);
        goto LABEL_11;
      }
      -[EKCalendarColorEditItem colorEditItemDelegate](self, "colorEditItemDelegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIColorPickerViewController selectedColor](self->_customColorPicker, "selectedColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "editItemSelectedColor:symbolicName:", v14, 0);

      -[UIColorPickerViewController setModalPresentationStyle:](self->_customColorPicker, "setModalPresentationStyle:", 7);
      -[UIColorPickerViewController popoverPresentationController](self->_customColorPicker, "popoverPresentationController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setSourceView:", v9);
      objc_msgSend(v15, "setPermittedArrowDirections:", 12);
      -[EKCalendarEditItem delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "owningNavigationController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "presentViewController:animated:completion:", self->_customColorPicker, 1, 0);
    }
    else
    {
      -[EKEventStore colorNamesInRainbowOrder](self->super._store, "colorNamesInRainbowOrder");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndexedSubscript:", self->_checkedRow);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKCalendarColorEditItem colorEditItemDelegate](self, "colorEditItemDelegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "editItemSelectedColor:symbolicName:", 0, v16);
    }

    goto LABEL_10;
  }
  if (!self->_layoutInlineViewController)
  {
    v18 = objc_alloc_init(EKCalendarColorEditItem);
    -[EKCalendarColorEditItem setLayoutInline:](v18, "setLayoutInline:", 1);
    -[EKCalendarColorEditItem setCalendar:store:](v18, "setCalendar:store:", self->super._calendar, self->super._store);
    -[EKCalendarEditItem delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarEditItem setDelegate:](v18, "setDelegate:", v19);

    -[EKCalendarColorEditItem setColorEditItemDelegate:](v18, "setColorEditItemDelegate:", self);
    v20 = objc_alloc_init(EKCalendarColorViewController);
    layoutInlineViewController = self->_layoutInlineViewController;
    self->_layoutInlineViewController = v20;

    -[EKCalendarColorViewController setEditItem:](self->_layoutInlineViewController, "setEditItem:", v18);
  }
  -[EKCalendarEditItem delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "owningNavigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pushViewController:animated:", self->_layoutInlineViewController, 1);
LABEL_11:

}

- (BOOL)saveStateToCalendar:(id)a3
{
  id v4;
  void *v5;
  unint64_t checkedRow;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  id v12;
  CGColor *v13;

  v4 = a3;
  if (self->_layoutInline)
  {
    -[EKEventStore colorNamesInRainbowOrder](self->super._store, "colorNamesInRainbowOrder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    checkedRow = self->_checkedRow;
    if (checkedRow < objc_msgSend(v5, "count"))
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", self->_checkedRow);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "symbolicColorName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToString:", v7);

      if ((v9 & 1) == 0)
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", self->_checkedRow);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setSymbolicColorName:", v10);

        -[EKCalendarEditItem delegate](self, "delegate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "calendarItemStartedEditing:", self);

      }
      goto LABEL_8;
    }
    -[UIColorPickerViewController selectedColor](self->_customColorPicker, "selectedColor");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = (CGColor *)objc_msgSend(v12, "CGColor");

    if (!CGColorEqualToColor((CGColorRef)objc_msgSend(v4, "CGColor"), v13))
    {
      objc_msgSend(v4, "setCGColor:", v13);
      -[EKCalendarEditItem delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "calendarItemStartedEditing:", self);
LABEL_8:

    }
  }
  else
  {
    -[EKCalendarColorViewController editItem](self->_layoutInlineViewController, "editItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "saveStateToCalendar:", v4);
  }

  return 1;
}

- (void)colorPickerViewController:(id)a3 didSelectColor:(id)a4 continuously:(BOOL)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  -[EKCalendarColorEditItem cellForSubitemAtIndex:](self, "cellForSubitemAtIndex:", -[EKCalendarColorEditItem lastSubitemIndex](self, "lastSubitemIndex"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "font");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ScaledCalendarColorChooserDotImageForColor((uint64_t)v6, (uint64_t)v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "imageView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setImage:", v9);

  -[EKCalendarColorEditItem colorEditItemDelegate](self, "colorEditItemDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "editItemSelectedColor:symbolicName:", v6, 0);

}

- (void)editItemSelectedColor:(id)a3 symbolicName:(id)a4
{
  id v6;
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
  id v18;

  v18 = a3;
  v6 = a4;
  if (!self->_layoutInline)
  {
    -[EKCalendarColorEditItem cells](self, "cells");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[EKEventStore localizedStringForSymbolicColorName:](self->super._store, "localizedStringForSymbolicColorName:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "textLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setText:", v9);

      objc_msgSend(MEMORY[0x1E0CA9FF0], "displayColorForSymbolicName:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "textLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "font");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      ScaledCalendarColorChooserDotImageForColor((uint64_t)v11, (uint64_t)v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "imageView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setImage:", v14);

    }
    else
    {
      if (!v18)
      {
LABEL_7:

        goto LABEL_8;
      }
      -[EKEventStore stringForColor:](self->super._store, "stringForColor:", v18);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "textLabel");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setText:", v16);

      objc_msgSend(v8, "textLabel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "font");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      ScaledCalendarColorChooserDotImageForColor((uint64_t)v18, (uint64_t)v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "imageView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setImage:", v13);
    }

    goto LABEL_7;
  }
LABEL_8:
  -[EKCalendarColorEditItem saveStateToCalendar:](self, "saveStateToCalendar:", self->super._calendar);

}

- (BOOL)layoutInline
{
  return self->_layoutInline;
}

- (EKCalendarColorEditItemDelegate)colorEditItemDelegate
{
  return (EKCalendarColorEditItemDelegate *)objc_loadWeakRetained((id *)&self->_colorEditItemDelegate);
}

- (void)setColorEditItemDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_colorEditItemDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_colorEditItemDelegate);
  objc_storeStrong((id *)&self->_layoutInlineViewController, 0);
  objc_storeStrong((id *)&self->_cells, 0);
  objc_storeStrong((id *)&self->_customColorPicker, 0);
}

@end
