@implementation EKUIHorizontalScrollingVirtualConferenceCell

- (EKUIHorizontalScrollingVirtualConferenceCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  EKUIHorizontalScrollingVirtualConferenceCell *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  UICollectionView *items;
  void *v17;
  UICollectionView *v18;
  uint64_t v19;
  objc_class *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  objc_super v51;
  _QWORD v52[5];
  _QWORD v53[3];

  v53[1] = *MEMORY[0x1E0C80C00];
  v51.receiver = self;
  v51.super_class = (Class)EKUIHorizontalScrollingVirtualConferenceCell;
  v4 = -[EKUIHorizontalScrollingVirtualConferenceCell initWithStyle:reuseIdentifier:](&v51, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0DC3370];
    objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 0.5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3340], "fractionalHeightDimension:", 1.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sizeWithWidthDimension:heightDimension:", v6, v7);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3360], "itemWithLayoutSize:", v50);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0DC3370];
    objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 0.9);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3340], "fractionalHeightDimension:", 1.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sizeWithWidthDimension:heightDimension:", v9, v10);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0DC3350];
    v53[0] = v49;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "horizontalGroupWithLayoutSize:subitems:", v48, v12);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithGroup:", v47);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC35D0]), "initWithSection:", v46);
    v45 = objc_alloc_init(MEMORY[0x1E0DC35D8]);
    objc_msgSend(v45, "setScrollDirection:", 1);
    v44 = v13;
    objc_msgSend(v13, "setConfiguration:", v45);
    v14 = objc_alloc(MEMORY[0x1E0DC35B8]);
    v15 = objc_msgSend(v14, "initWithFrame:collectionViewLayout:", v13, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    items = v4->_items;
    v4->_items = (UICollectionView *)v15;

    -[UICollectionView setTranslatesAutoresizingMaskIntoConstraints:](v4->_items, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UICollectionView setDataSource:](v4->_items, "setDataSource:", v4);
    -[UICollectionView setDelegate:](v4->_items, "setDelegate:", v4);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView setBackgroundColor:](v4->_items, "setBackgroundColor:", v17);

    v18 = v4->_items;
    v19 = objc_opt_class();
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView registerClass:forCellWithReuseIdentifier:](v18, "registerClass:forCellWithReuseIdentifier:", v19, v21);

    -[EKUIHorizontalScrollingVirtualConferenceCell contentView](v4, "contentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addSubview:", v4->_items);

    v35 = (void *)MEMORY[0x1E0CB3718];
    -[UICollectionView leadingAnchor](v4->_items, "leadingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIHorizontalScrollingVirtualConferenceCell contentView](v4, "contentView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "leadingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v41);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = v40;
    -[UICollectionView topAnchor](v4->_items, "topAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIHorizontalScrollingVirtualConferenceCell contentView](v4, "contentView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "topAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v37);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v52[1] = v36;
    -[UICollectionView bottomAnchor](v4->_items, "bottomAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIHorizontalScrollingVirtualConferenceCell contentView](v4, "contentView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "bottomAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v52[2] = v24;
    -[UICollectionView trailingAnchor](v4->_items, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIHorizontalScrollingVirtualConferenceCell contentView](v4, "contentView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "trailingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v52[3] = v28;
    -[UICollectionView heightAnchor](v4->_items, "heightAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIHorizontalScrollingVirtualConferenceCell _heightOfCells](v4, "_heightOfCells");
    objc_msgSend(v29, "constraintEqualToConstant:");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v52[4] = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 5);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "activateConstraints:", v31);

  }
  return v4;
}

- (double)_heightOfCells
{
  double v2;
  double v3;
  void *v4;
  double v5;
  double v6;

  objc_msgSend(MEMORY[0x1E0CAA038], "conferenceImageSize");
  v3 = v2 + 14.0;
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_scaledValueForValue:", v3);
  v6 = v5 + 16.0;

  return v6;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return -[NSArray count](self->_roomTypes, "count", a3, a4);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  objc_class *v8;
  void *v9;
  void *v10;
  NSArray *roomTypes;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  _QWORD v27[4];
  id v28;
  void *v29;

  v6 = a4;
  v7 = a3;
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  roomTypes = self->_roomTypes;
  v12 = objc_msgSend(v6, "row");

  -[NSArray objectAtIndex:](roomTypes, "objectAtIndex:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCurrentRoomType:", v13);
  objc_msgSend(v10, "defaultContentConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "title");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v15);

  objc_msgSend(v14, "textProperties");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setNumberOfLines:", 2);

  objc_msgSend(v14, "setImageToTextPadding:", 10.0);
  objc_msgSend(MEMORY[0x1E0CAA038], "conferenceImageSize");
  v18 = v17;
  objc_msgSend(v14, "imageProperties");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setReservedLayoutSize:", v18, v18);

  objc_msgSend(v14, "imageProperties");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setMaximumSize:", v18, v18);

  objc_msgSend(v10, "setContentConfiguration:", v14);
  v21 = (void *)MEMORY[0x1E0D0CD38];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __86__EKUIHorizontalScrollingVirtualConferenceCell_collectionView_cellForItemAtIndexPath___block_invoke;
  v27[3] = &unk_1E601AF50;
  v22 = v10;
  v28 = v22;
  v29 = v14;
  v23 = v14;
  objc_msgSend(v21, "imageForRoomType:completionHandler:", v13, v27);
  v24 = v29;
  v25 = v22;

  return v25;
}

void __86__EKUIHorizontalScrollingVirtualConferenceCell_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __86__EKUIHorizontalScrollingVirtualConferenceCell_collectionView_cellForItemAtIndexPath___block_invoke_2;
  v9[3] = &unk_1E601A360;
  v10 = *(id *)(a1 + 32);
  v11 = v6;
  v12 = *(id *)(a1 + 40);
  v13 = v5;
  v7 = v5;
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

void __86__EKUIHorizontalScrollingVirtualConferenceCell_collectionView_cellForItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;

  objc_msgSend(*(id *)(a1 + 32), "currentRoomType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", *(_QWORD *)(a1 + 40));

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 48), "setImage:", *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 32), "setContentConfiguration:", *(_QWORD *)(a1 + 48));
  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;
  NSArray *roomTypes;
  uint64_t v7;
  void *v8;
  id v9;

  v5 = a4;
  -[EKUIHorizontalScrollingVirtualConferenceCell delegate](self, "delegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  roomTypes = self->_roomTypes;
  v7 = objc_msgSend(v5, "row");

  -[NSArray objectAtIndex:](roomTypes, "objectAtIndex:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "selectedRoomType:", v8);

}

- (VirtualConferenceRoomTypeSelectionDelegate)delegate
{
  return (VirtualConferenceRoomTypeSelectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)roomTypes
{
  return self->_roomTypes;
}

- (void)setRoomTypes:(id)a3
{
  objc_storeStrong((id *)&self->_roomTypes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roomTypes, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_items, 0);
}

@end
