@implementation AXUISettingsEditableViewController

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AXUISettingsEditableViewController;
  -[AXUISettingsEditableViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[AXUISettingsEditableViewController _configureEditButton](self, "_configureEditButton");
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  objc_class *v5;
  void *v6;

  v3 = (int)*MEMORY[0x1E0D80590];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    -[AXUISettingsEditableViewController makeSpecifiers](self, "makeSpecifiers");
    v5 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v6 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3) = v5;

    -[AXUISettingsEditableViewController _configureEditButton](self, "_configureEditButton");
    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4
{
  -[AXUISettingsBaseListController setEditing:animated:](self, "setEditing:animated:", 1, 1);
  -[AXUISettingsEditableViewController _configureEditButton](self, "_configureEditButton");
}

- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4
{
  -[AXUISettingsBaseListController setEditing:animated:](self, "setEditing:animated:", 0, 1);
  -[AXUISettingsEditableViewController _configureEditButton](self, "_configureEditButton");
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  void *v6;

  if (a4 == 1)
  {
    -[AXUISettingsEditableViewController specifierAtIndexPath:](self, "specifierAtIndexPath:", a5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsEditableViewController removeDataForSpecifier:](self, "removeDataForSpecifier:", v6);
    -[AXUISettingsEditableViewController removeSpecifier:animated:](self, "removeSpecifier:animated:", v6, 1);
    if (!-[AXUISettingsEditableViewController canEditTable](self, "canEditTable"))
      AXPerformBlockAsynchronouslyOnMainThread();

  }
}

uint64_t __85__AXUISettingsEditableViewController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_donePressed");
}

- (id)makeSpecifiers
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (BOOL)canEditTable
{
  return 0;
}

- (void)_addDoneButton
{
  void *v3;
  id v4;

  v4 = (id)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__donePressed);
  -[AXUISettingsEditableViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRightBarButtonItem:", v4);

}

- (void)_configureEditButton
{
  void *v3;
  id v4;

  if (-[AXUISettingsEditableViewController canEditTable](self, "canEditTable"))
  {
    if ((-[AXUISettingsEditableViewController isEditing](self, "isEditing") & 1) != 0)
    {
      -[AXUISettingsEditableViewController _addDoneButton](self, "_addDoneButton");
      return;
    }
    v4 = (id)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 2, self, sel__editPressed);
    -[AXUISettingsEditableViewController navigationItem](self, "navigationItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setRightBarButtonItem:", v4);

  }
  else
  {
    -[AXUISettingsEditableViewController navigationItem](self, "navigationItem");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRightBarButtonItem:", 0);
  }

}

- (void)_editPressed
{
  -[AXUISettingsBaseListController setEditing:animated:](self, "setEditing:animated:", 1, 1);
  -[AXUISettingsEditableViewController _addDoneButton](self, "_addDoneButton");
}

- (void)_donePressed
{
  void *v3;

  -[AXUISettingsBaseListController setEditing:animated:](self, "setEditing:animated:", 0, 1);
  -[AXUISettingsEditableViewController table](self, "table");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEditing:animated:", 0, 1);

  -[AXUISettingsEditableViewController _configureEditButton](self, "_configureEditButton");
}

@end
