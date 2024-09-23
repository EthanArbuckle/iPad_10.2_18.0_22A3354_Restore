@implementation MainLibrarySectionController

- (MainLibrarySectionController)initWithConfiguration:(id)a3
{
  id v4;
  MainLibrarySectionController *v5;
  HistoryLibraryItemController *v6;
  HistoryLibraryItemController *historyController;
  ReadingListLibraryItemController *v8;
  ReadingListLibraryItemController *readingListController;
  void *v10;
  void *v11;
  id v12;
  dispatch_queue_t v13;
  BookmarkFolderLibraryItemController *v14;
  void *v15;
  uint64_t v16;
  BookmarkFolderLibraryItemController *bookmarksItemController;
  void *v18;
  void *v19;
  void *v20;
  MainLibrarySectionController *v21;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MainLibrarySectionController;
  v5 = -[LibrarySectionController initWithConfiguration:](&v23, sel_initWithConfiguration_, v4);
  if (v5)
  {
    v6 = -[LibraryItemController initWithConfiguration:sectionController:]([HistoryLibraryItemController alloc], "initWithConfiguration:sectionController:", v4, v5);
    historyController = v5->_historyController;
    v5->_historyController = v6;

    v8 = -[LibraryItemController initWithConfiguration:sectionController:]([ReadingListLibraryItemController alloc], "initWithConfiguration:sectionController:", v4, v5);
    readingListController = v5->_readingListController;
    v5->_readingListController = v8;

    objc_msgSend(MEMORY[0x1E0DCCBA0], "safariBookmarkCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DCCBA8]), "initReadonlySafariBookmarkCollection");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.mobilesafari.%@.%p"), objc_opt_class(), v5);
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = dispatch_queue_create((const char *)objc_msgSend(v12, "UTF8String"), 0);

    v14 = [BookmarkFolderLibraryItemController alloc];
    objc_msgSend(v10, "rootBookmark");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[BookmarkFolderLibraryItemController initWithConfiguration:sectionController:folder:](v14, "initWithConfiguration:sectionController:folder:", v4, v5, v15);
    bookmarksItemController = v5->_bookmarksItemController;
    v5->_bookmarksItemController = (BookmarkFolderLibraryItemController *)v16;

    -[BookmarkFolderLibraryItemController setCollection:](v5->_bookmarksItemController, "setCollection:", v10);
    -[BookmarkFolderLibraryItemController setBookmarkProvider:](v5->_bookmarksItemController, "setBookmarkProvider:", v11);
    -[BookmarkFolderLibraryItemController setBookmarkProviderQueue:](v5->_bookmarksItemController, "setBookmarkProviderQueue:", v13);
    objc_msgSend(v4, "linkPreviewProvider");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[BookmarkFolderLibraryItemController setLinkPreviewProvider:](v5->_bookmarksItemController, "setLinkPreviewProvider:", v18);

    objc_msgSend(v4, "navigationIntentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[BookmarkFolderLibraryItemController setNavigationIntentHandler:](v5->_bookmarksItemController, "setNavigationIntentHandler:", v19);

    objc_msgSend(v4, "tabGroupProvider");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[BookmarkFolderLibraryItemController setTabGroupProvider:](v5->_bookmarksItemController, "setTabGroupProvider:", v20);

    v21 = v5;
  }

  return v5;
}

- (id)itemControllers
{
  ReadingListLibraryItemController *readingListController;
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  readingListController = self->_readingListController;
  v4[0] = self->_bookmarksItemController;
  v4[1] = readingListController;
  v4[2] = self->_historyController;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)title
{
  return &stru_1E9CFDBB0;
}

- (void)registerItemsWithRegistration:(id)a3
{
  HistoryLibraryItemController *historyController;
  id v5;

  historyController = self->_historyController;
  v5 = a3;
  objc_msgSend(v5, "registerItem:forCollectionType:", historyController, CFSTR("HistoryCollection"));
  objc_msgSend(v5, "registerItem:forCollectionType:", self->_readingListController, CFSTR("ReadingListCollection"));
  objc_msgSend(v5, "registerItem:forCollectionType:", self->_bookmarksItemController, CFSTR("BookmarksCollection"));

}

- (void)updateToolbarIfNeeded
{
  -[BookmarkFolderLibraryItemController updateToolbarIfNeeded](self->_bookmarksItemController, "updateToolbarIfNeeded");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookmarksItemController, 0);
  objc_storeStrong((id *)&self->_readingListController, 0);
  objc_storeStrong((id *)&self->_historyController, 0);
}

@end
