@implementation CNCardNamePickingGroup

- (id)displayItems
{
  CNCardNamePickingGroupActionItem *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(CNCardNamePickingGroupActionItem);
  v4 = (void *)MEMORY[0x1E0C97218];
  -[CNCardGroup contact](self, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromContact:style:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCardNamePickingGroupActionItem setDisplayName:](v3, "setDisplayName:", v6);

  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
