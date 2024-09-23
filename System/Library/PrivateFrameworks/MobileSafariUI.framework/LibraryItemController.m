@implementation LibraryItemController

- (LibraryItemController)initWithConfiguration:(id)a3 sectionController:(id)a4
{
  id v7;
  id v8;
  LibraryItemController *v9;
  LibraryItemController *v10;
  LibraryItemController *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)LibraryItemController;
  v9 = -[LibraryItemController init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_configuration, a3);
    objc_storeWeak((id *)&v10->_sectionController, v8);
    v11 = v10;
  }

  return v10;
}

- (void)contentDidChange
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_sectionController);
  objc_msgSend(WeakRetained, "contentDidChange");

}

- (UIViewController)viewController
{
  return 0;
}

- (BOOL)shouldPersistSelection
{
  return 0;
}

- (BOOL)selectionFollowsFocus
{
  return 1;
}

- (NSArray)accessories
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (BOOL)hasSubitems
{
  return 0;
}

- (NSArray)subitems
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (BOOL)isExpanded
{
  return 0;
}

- (NSArray)dragItems
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (BOOL)isSpringLoaded
{
  return 0;
}

- (unint64_t)dropOperationForSession:(id)a3
{
  return 0;
}

- (int64_t)dropIntentForSession:(id)a3
{
  return 0;
}

- (LibrarySectionController)sectionController
{
  return (LibrarySectionController *)objc_loadWeakRetained((id *)&self->_sectionController);
}

- (LibraryConfiguration)configuration
{
  return self->_configuration;
}

- (BOOL)isSelected
{
  return self->_isSelected;
}

- (BOOL)isHidden
{
  return self->_isHidden;
}

- (UISwipeActionsConfiguration)swipeActionsConfiguration
{
  return self->_swipeActionsConfiguration;
}

- (void)setSwipeActionsConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_swipeActionsConfiguration, a3);
}

- (NSString)accessibilityIdentifier
{
  return self->_accessibilityIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityIdentifier, 0);
  objc_storeStrong((id *)&self->_swipeActionsConfiguration, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_sectionController);
}

@end
