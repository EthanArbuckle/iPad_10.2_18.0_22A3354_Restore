@implementation SharedWithYouSectionController

- (SharedWithYouSectionController)initWithConfiguration:(id)a3
{
  id v4;
  SharedWithYouSectionController *v5;
  CloudTabsLibraryItemController *v6;
  CloudTabsLibraryItemController *cloudTabsItemController;
  SharedWithYouLibraryItemController *v8;
  SharedWithYouLibraryItemController *friendsItemController;
  SharedWithYouSectionController *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SharedWithYouSectionController;
  v5 = -[LibrarySectionController initWithConfiguration:](&v12, sel_initWithConfiguration_, v4);
  if (v5)
  {
    v6 = -[LibraryItemController initWithConfiguration:sectionController:]([CloudTabsLibraryItemController alloc], "initWithConfiguration:sectionController:", v4, v5);
    cloudTabsItemController = v5->_cloudTabsItemController;
    v5->_cloudTabsItemController = v6;

    v8 = -[LibraryItemController initWithConfiguration:sectionController:]([SharedWithYouLibraryItemController alloc], "initWithConfiguration:sectionController:", v4, v5);
    friendsItemController = v5->_friendsItemController;
    v5->_friendsItemController = v8;

    v10 = v5;
  }

  return v5;
}

- (id)itemControllers
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_friendsItemController)
    objc_msgSend(v3, "addObject:");
  objc_msgSend(v4, "addObject:", self->_cloudTabsItemController);
  return v4;
}

- (id)title
{
  return &stru_1E9CFDBB0;
}

- (void)registerItemsWithRegistration:(id)a3
{
  CloudTabsLibraryItemController *cloudTabsItemController;
  id v5;

  cloudTabsItemController = self->_cloudTabsItemController;
  v5 = a3;
  objc_msgSend(v5, "registerItem:forCollectionType:", cloudTabsItemController, CFSTR("CloudTabsCollection"));
  objc_msgSend(v5, "registerItem:forCollectionType:", self->_friendsItemController, CFSTR("SharedWithYouCollection"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_friendsItemController, 0);
  objc_storeStrong((id *)&self->_cloudTabsItemController, 0);
}

@end
