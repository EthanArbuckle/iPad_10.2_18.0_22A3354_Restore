@implementation ICAirDropNoteActivityItemSource

- (ICAirDropNoteActivityItemSource)initWithTitle:(id)a3 airDropDocumentCreator:(id)a4
{
  id v6;
  ICAirDropNoteActivityItemSource *v7;
  ICAirDropNoteActivityItemSource *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)ICAirDropNoteActivityItemSource;
  v7 = -[ICNoteBaseActivityItemSource initWithTitle:](&v10, sel_initWithTitle_, a3);
  v8 = v7;
  if (v7)
  {
    if (v6)
    {
      -[ICAirDropNoteActivityItemSource setAirDropDocumentCreator:](v7, "setAirDropDocumentCreator:", v6);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "airDropDocumentCreator", "-[ICAirDropNoteActivityItemSource initWithTitle:airDropDocumentCreator:]", 1, 0, CFSTR("airDropDocumentCreator is nil"));

      v8 = 0;
    }
  }

  return v8;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return objc_alloc_init(MEMORY[0x1E0C99E98]);
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  void *v5;

  if (objc_msgSend(a4, "isEqualToString:", *MEMORY[0x1E0CEB1B0]))
  {
    -[ICAirDropNoteActivityItemSource airDropActivityItem](self, "airDropActivityItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4
{
  id v4;

  if (objc_msgSend(a4, "isEqualToString:", *MEMORY[0x1E0CEB1C8]))
  {
    objc_msgSend((id)*MEMORY[0x1E0CEC4E0], "identifier");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (id)*MEMORY[0x1E0D63D68];
  }
  return v4;
}

- (id)airDropActivityItem
{
  id airDropActivityItem;
  void (**v4)(void);
  void *v5;
  void *v6;
  id v7;

  airDropActivityItem = self->_airDropActivityItem;
  if (!airDropActivityItem)
  {
    -[ICAirDropNoteActivityItemSource airDropDocumentCreator](self, "airDropDocumentCreator");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "activityItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = self->_airDropActivityItem;
    self->_airDropActivityItem = v6;

    airDropActivityItem = self->_airDropActivityItem;
  }
  return airDropActivityItem;
}

- (id)airDropDocumentCreator
{
  return self->_airDropDocumentCreator;
}

- (void)setAirDropDocumentCreator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setAirDropActivityItem:(id)a3
{
  objc_storeStrong(&self->_airDropActivityItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_airDropActivityItem, 0);
  objc_storeStrong(&self->_airDropDocumentCreator, 0);
}

@end
