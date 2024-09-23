@implementation EKEventURLAndNotesInlineEditItem

- (EKEventURLAndNotesInlineEditItem)init
{
  EKEventURLAndNotesInlineEditItem *v2;
  EKEventURLInlineEditItem *v3;
  EKEventURLInlineEditItem *urlEditItem;
  EKEventNotesInlineEditItem *v5;
  EKEventNotesInlineEditItem *notesEditItem;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)EKEventURLAndNotesInlineEditItem;
  v2 = -[EKEventURLAndNotesInlineEditItem init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(EKEventURLInlineEditItem);
    urlEditItem = v2->_urlEditItem;
    v2->_urlEditItem = v3;

    v5 = objc_alloc_init(EKEventNotesInlineEditItem);
    notesEditItem = v2->_notesEditItem;
    v2->_notesEditItem = v5;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel__contentSizeCategoryChanged, *MEMORY[0x1E0DC48E8], 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC48E8], 0);

  v4.receiver = self;
  v4.super_class = (Class)EKEventURLAndNotesInlineEditItem;
  -[EKEventURLAndNotesInlineEditItem dealloc](&v4, sel_dealloc);
}

- (void)reset
{
  -[EKEventURLInlineEditItem reset](self->_urlEditItem, "reset");
  -[EKEventNotesInlineEditItem reset](self->_notesEditItem, "reset");
}

- (void)setCalendarItem:(id)a3 store:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)EKEventURLAndNotesInlineEditItem;
  v6 = a4;
  v7 = a3;
  -[EKEventEditItem setCalendarItem:store:](&v8, sel_setCalendarItem_store_, v7, v6);
  -[EKEventEditItem setCalendarItem:store:](self->_urlEditItem, "setCalendarItem:store:", v7, v6, v8.receiver, v8.super_class);
  -[EKEventEditItem setCalendarItem:store:](self->_notesEditItem, "setCalendarItem:store:", v7, v6);

}

- (void)setDelegate:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKEventURLAndNotesInlineEditItem;
  v4 = a3;
  -[EKCalendarItemEditItem setDelegate:](&v5, sel_setDelegate_, v4);
  -[EKCalendarItemEditItem setDelegate:](self->_urlEditItem, "setDelegate:", v4, v5.receiver, v5.super_class);
  -[EKCalendarItemEditItem setDelegate:](self->_notesEditItem, "setDelegate:", v4);

}

- (void)setSelectedResponder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKEventURLAndNotesInlineEditItem;
  v4 = a3;
  -[EKCalendarItemEditItem setSelectedResponder:](&v5, sel_setSelectedResponder_, v4);
  -[EKCalendarItemEditItem setSelectedResponder:](self->_urlEditItem, "setSelectedResponder:", v4, v5.receiver, v5.super_class);
  -[EKCalendarItemEditItem setSelectedResponder:](self->_notesEditItem, "setSelectedResponder:", v4);

}

- (unint64_t)numberOfSubitems
{
  unint64_t v3;

  v3 = -[EKCalendarItemEditItem numberOfSubitems](self->_urlEditItem, "numberOfSubitems");
  return -[EKCalendarItemEditItem numberOfSubitems](self->_notesEditItem, "numberOfSubitems") + v3;
}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4
{
  int *v4;
  double result;

  if (!a3)
  {
    v4 = &OBJC_IVAR___EKEventURLAndNotesInlineEditItem__urlEditItem;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    v4 = &OBJC_IVAR___EKEventURLAndNotesInlineEditItem__notesEditItem;
LABEL_5:
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v4), "defaultCellHeightForSubitemAtIndex:forWidth:", 0, a4);
    return result;
  }
  return 0.0;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  int *v5;

  if (a3)
  {
    if (a3 != 1)
      return 0;
    v5 = &OBJC_IVAR___EKEventURLAndNotesInlineEditItem__notesEditItem;
  }
  else
  {
    v5 = &OBJC_IVAR___EKEventURLAndNotesInlineEditItem__urlEditItem;
  }
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v5), "cellForSubitemAtIndex:", 0, v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isInline
{
  return 1;
}

- (BOOL)saveAndDismissWithForce:(BOOL)a3
{
  _BOOL8 v3;
  BOOL v5;

  v3 = a3;
  v5 = -[EKEventURLInlineEditItem saveAndDismissWithForce:](self->_urlEditItem, "saveAndDismissWithForce:");
  return v5 | -[EKEventNotesInlineEditItem saveAndDismissWithForce:](self->_notesEditItem, "saveAndDismissWithForce:", v3);
}

- (void)tableViewDidScroll
{
  -[EKEventNotesInlineEditItem tableViewDidScroll](self->_notesEditItem, "tableViewDidScroll");
}

- (BOOL)isSaveable
{
  return -[EKEventURLInlineEditItem isSaveable](self->_urlEditItem, "isSaveable")
      || -[EKEventNotesInlineEditItem isSaveable](self->_notesEditItem, "isSaveable");
}

- (id)searchStringForEventAutocomplete
{
  return 0;
}

- (void)refreshFromCalendarItemAndStore
{
  -[EKEventURLInlineEditItem refreshFromCalendarItemAndStore](self->_urlEditItem, "refreshFromCalendarItemAndStore");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notesEditItem, 0);
  objc_storeStrong((id *)&self->_urlEditItem, 0);
}

@end
