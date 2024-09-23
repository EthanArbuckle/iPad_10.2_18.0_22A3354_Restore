@implementation HKOverlayContextSection

- (HKOverlayContextSection)initWithSectionTitle:(id)a3 overlayContextItems:(id)a4 accessoryButtonAction:(id)a5
{
  id v9;
  id v10;
  id v11;
  HKOverlayContextSection *v12;
  HKOverlayContextSection *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HKOverlayContextSection;
  v12 = -[HKOverlayContextSection init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_localizedSectionTitle, a3);
    objc_storeStrong((id *)&v13->_overlayContextItems, a4);
    objc_storeStrong((id *)&v13->_accessoryButtonAction, a5);
  }

  return v13;
}

- (HKOverlayContextSection)initWithSectionTitle:(id)a3 overlayContextItems:(id)a4
{
  id v7;
  id v8;
  HKOverlayContextSection *v9;
  HKOverlayContextSection *v10;
  UIAction *accessoryButtonAction;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HKOverlayContextSection;
  v9 = -[HKOverlayContextSection init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_localizedSectionTitle, a3);
    accessoryButtonAction = v10->_accessoryButtonAction;
    v10->_accessoryButtonAction = 0;

    objc_storeStrong((id *)&v10->_overlayContextItems, a4);
  }

  return v10;
}

- (NSArray)items
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[HKOverlayContextSection overlayContextItems](self, "overlayContextItems", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "contextItemForLastUpdate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKOverlayRoomViewController.m"), 3429, CFSTR("Context items should not be nil"));

        }
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return (NSArray *)v4;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->title, a3);
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->items, a3);
}

- (NSString)localizedSectionTitle
{
  return self->_localizedSectionTitle;
}

- (NSArray)overlayContextItems
{
  return self->_overlayContextItems;
}

- (UIAction)accessoryButtonAction
{
  return self->_accessoryButtonAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryButtonAction, 0);
  objc_storeStrong((id *)&self->_overlayContextItems, 0);
  objc_storeStrong((id *)&self->_localizedSectionTitle, 0);
  objc_storeStrong((id *)&self->items, 0);
  objc_storeStrong((id *)&self->title, 0);
}

@end
