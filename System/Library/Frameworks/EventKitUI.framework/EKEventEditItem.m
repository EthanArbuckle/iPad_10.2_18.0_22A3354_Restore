@implementation EKEventEditItem

- (void)setCalendarItem:(id)a3 store:(id)a4
{
  id v7;
  id v8;
  void *v9;
  objc_super v10;

  v7 = a3;
  v8 = a4;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EKEventEditItem.m"), 15, CFSTR("Tried to set %@ as an event on %@"), v7, self);

    }
  }
  v10.receiver = self;
  v10.super_class = (Class)EKEventEditItem;
  -[EKCalendarItemEditItem setCalendarItem:store:](&v10, sel_setCalendarItem_store_, v7, v8);

}

- (id)event
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EKEventEditItem;
  -[EKCalendarItemEditItem calendarItem](&v3, sel_calendarItem);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
