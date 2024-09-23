@implementation HUIconPickerViewController

+ (id)sceneIconDescriptors
{
  if (qword_1EF2269D0 != -1)
    dispatch_once(&qword_1EF2269D0, &__block_literal_global_46);
  return (id)_MergedGlobals_3_2;
}

void __50__HUIconPickerViewController_sceneIconDescriptors__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[13];

  v9[12] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D307E0];
  v9[0] = *MEMORY[0x1E0D307D8];
  v9[1] = v0;
  v1 = *MEMORY[0x1E0D307F0];
  v9[2] = *MEMORY[0x1E0D307E8];
  v9[3] = v1;
  v2 = *MEMORY[0x1E0D30800];
  v9[4] = *MEMORY[0x1E0D307F8];
  v9[5] = v2;
  v3 = *MEMORY[0x1E0D30810];
  v9[6] = *MEMORY[0x1E0D30808];
  v9[7] = v3;
  v4 = *MEMORY[0x1E0D30820];
  v9[8] = *MEMORY[0x1E0D30818];
  v9[9] = v4;
  v5 = *MEMORY[0x1E0D307B0];
  v9[10] = *MEMORY[0x1E0D30828];
  v9[11] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_map:", &__block_literal_global_2);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)_MergedGlobals_3_2;
  _MergedGlobals_3_2 = v7;

}

id __50__HUIconPickerViewController_sceneIconDescriptors__block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0D31460];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithImageIdentifier:", v3);

  return v4;
}

- (HUIconPickerViewController)initWithIconDescriptors:(id)a3 selectedIconDescriptor:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  HUIconPickerViewController *v13;
  HUIconPickerViewController *v14;
  void *v15;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v10 && (objc_msgSend(v9, "containsObject:", v10) & 1) == 0)
    NSLog(CFSTR("Selected icon descriptor (%@) is not in the set of all icon descriptors (%@)"), v10, v9);
  v12 = objc_alloc_init(MEMORY[0x1E0CEA450]);
  objc_msgSend(v12, "setItemSize:", 88.0, 88.0);
  objc_msgSend(v12, "setScrollDirection:", 0);
  objc_msgSend(v12, "setMinimumLineSpacing:", 0.0);
  objc_msgSend(v12, "setMinimumInteritemSpacing:", 0.0);
  v17.receiver = self;
  v17.super_class = (Class)HUIconPickerViewController;
  v13 = -[HUIconPickerViewController initWithCollectionViewLayout:](&v17, sel_initWithCollectionViewLayout_, v12);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_iconDescriptors, a3);
    objc_storeStrong((id *)&v14->_selectedIconDescriptor, a4);
    objc_storeWeak((id *)&v14->_delegate, v11);
    _HULocalizedStringWithDefaultValue(CFSTR("HUIconPickerTitle"), CFSTR("HUIconPickerTitle"), 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUIconPickerViewController setTitle:](v14, "setTitle:", v15);

  }
  return v14;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)HUIconPickerViewController;
  -[HUIconPickerViewController viewDidLoad](&v16, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUIconPickerViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[HUIconPickerViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", v6, v8);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancel_);
  -[HUIconPickerViewController navigationItem](self, "navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLeftBarButtonItem:", v9);

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__done_);
  -[HUIconPickerViewController navigationItem](self, "navigationItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setRightBarButtonItem:", v11);

  -[HUIconPickerViewController selectedIconDescriptor](self, "selectedIconDescriptor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUIconPickerViewController navigationItem](self, "navigationItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "rightBarButtonItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setEnabled:", v13 != 0);

}

- (void)viewDidLayoutSubviews
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HUIconPickerViewController;
  -[HUIconPickerViewController viewDidLayoutSubviews](&v13, sel_viewDidLayoutSubviews);
  -[HUIconPickerViewController selectedIconDescriptor](self, "selectedIconDescriptor");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[HUIconPickerViewController collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "indexPathsForSelectedItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (!v7)
    {
      -[HUIconPickerViewController iconDescriptors](self, "iconDescriptors");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUIconPickerViewController selectedIconDescriptor](self, "selectedIconDescriptor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "indexOfObject:", v9);

      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      {
        -[HUIconPickerViewController collectionView](self, "collectionView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v10, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "selectItemAtIndexPath:animated:scrollPosition:", v12, 0, 2);

      }
    }
  }
}

- (void)_cancel:(id)a3
{
  id v4;

  -[HUIconPickerViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iconPickerDidCancel:", self);

}

- (void)_done:(id)a3
{
  void *v4;
  id v5;

  -[HUIconPickerViewController delegate](self, "delegate", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HUIconPickerViewController selectedIconDescriptor](self, "selectedIconDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "iconPicker:didPickIconDescriptor:", self, v4);

}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[HUIconPickerViewController iconDescriptors](self, "iconDescriptors", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v6 = a4;
  v7 = a3;
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUIconPickerViewController iconDescriptors](self, "iconDescriptors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v6, "item");

  objc_msgSend(v11, "objectAtIndexedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setIconDescriptor:", v13);

  return v10;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a4;
  -[HUIconPickerViewController iconDescriptors](self, "iconDescriptors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "item");

  objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUIconPickerViewController setSelectedIconDescriptor:](self, "setSelectedIconDescriptor:", v8);

  -[HUIconPickerViewController navigationItem](self, "navigationItem");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rightBarButtonItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", 1);

}

- (NSArray)iconDescriptors
{
  return self->_iconDescriptors;
}

- (HFIconDescriptor)selectedIconDescriptor
{
  return self->_selectedIconDescriptor;
}

- (void)setSelectedIconDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_selectedIconDescriptor, a3);
}

- (HUIconPickerViewControllerDelegate)delegate
{
  return (HUIconPickerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedIconDescriptor, 0);
  objc_storeStrong((id *)&self->_iconDescriptors, 0);
}

@end
