@implementation MUPlaceMapItemActivityProvider

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "data", a3);
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D96DC0]) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D96D88]) & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0CB36F8];
    -[MUPlaceActivityProvider mapItem](self, "mapItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)objc_msgSend(v9, "copy");
  }

  return v6;
}

- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4
{
  return (id)*MEMORY[0x1E0CC15F0];
}

@end
