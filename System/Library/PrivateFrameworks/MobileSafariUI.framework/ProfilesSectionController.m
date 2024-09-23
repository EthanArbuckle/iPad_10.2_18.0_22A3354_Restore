@implementation ProfilesSectionController

- (ProfilesSectionController)initWithConfiguration:(id)a3
{
  id v4;
  ProfilesSectionController *v5;
  ProfilesLibraryItemController *v6;
  ProfilesLibraryItemController *profilesItemController;
  ProfilesSectionController *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ProfilesSectionController;
  v5 = -[LibrarySectionController initWithConfiguration:](&v10, sel_initWithConfiguration_, v4);
  if (v5)
  {
    v6 = -[LibraryItemController initWithConfiguration:sectionController:]([ProfilesLibraryItemController alloc], "initWithConfiguration:sectionController:", v4, v5);
    profilesItemController = v5->_profilesItemController;
    v5->_profilesItemController = v6;

    v8 = v5;
  }

  return v5;
}

- (id)itemControllers
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self->_profilesItemController;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profilesItemController, 0);
}

@end
