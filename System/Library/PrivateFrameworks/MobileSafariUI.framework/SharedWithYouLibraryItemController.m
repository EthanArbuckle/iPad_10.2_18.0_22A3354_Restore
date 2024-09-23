@implementation SharedWithYouLibraryItemController

- (void)updateListContentConfiguration:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0DC3870];
  v4 = a3;
  objc_msgSend(v3, "_systemImageNamed:", CFSTR("shared.with.you"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:", v5);

  startPageTitleForCollectionType(CFSTR("SharedWithYouCollection"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v6);

}

- (void)didSelectItem
{
  void *v2;
  void *v3;
  id v4;

  -[LibraryItemController configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "libraryItemOpenHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openLibrary:", CFSTR("SharedWithYouCollection"));

  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didUseSidebarAction:", 8);

}

- (BOOL)isSelected
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[LibraryItemController configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "libraryItemOpenHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeLibraryType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("SharedWithYouCollection"));

  return v5;
}

- (id)accessibilityIdentifier
{
  return CFSTR("SharedWithYouLibraryItem");
}

- (id)viewController
{
  return self->_viewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end
