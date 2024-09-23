@implementation CNPhotoPickerListCollectionViewCell

- (void)reloadData
{
  id v2;

  -[CNPhotoPickerListCollectionViewCell tableView](self, "tableView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

}

- (CNPhotoPickerListCollectionViewCell)initWithFrame:(CGRect)a3
{
  CNPhotoPickerListCollectionViewCell *v3;
  id v4;
  uint64_t v5;
  UITableView *tableView;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CNPhotoPickerListCollectionViewCell;
  v3 = -[CNPhotoPickerListCollectionViewCell initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3D48]);
    -[CNPhotoPickerListCollectionViewCell bounds](v3, "bounds");
    v5 = objc_msgSend(v4, "initWithFrame:style:", 2);
    tableView = v3->_tableView;
    v3->_tableView = (UITableView *)v5;

    -[UITableView setTranslatesAutoresizingMaskIntoConstraints:](v3->_tableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UITableView setScrollEnabled:](v3->_tableView, "setScrollEnabled:", 0);
    -[UITableView setDelegate:](v3->_tableView, "setDelegate:", v3);
    -[UITableView setDataSource:](v3->_tableView, "setDataSource:", v3);
    -[UITableView registerClass:forCellReuseIdentifier:](v3->_tableView, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("Cell"));
    -[CNPhotoPickerListCollectionViewCell contentView](v3, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v3->_tableView);

  }
  return v3;
}

- (void)updateConstraints
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;
  _QWORD v24[5];

  v24[4] = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)CNPhotoPickerListCollectionViewCell;
  -[CNPhotoPickerListCollectionViewCell updateConstraints](&v23, sel_updateConstraints);
  -[CNPhotoPickerListCollectionViewCell tableView](self, "tableView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerListCollectionViewCell topAnchor](self, "topAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerListCollectionViewCell contentInset](self, "contentInset");
  objc_msgSend(v21, "constraintEqualToAnchor:constant:", v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v19;
  -[CNPhotoPickerListCollectionViewCell tableView](self, "tableView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerListCollectionViewCell leadingAnchor](self, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerListCollectionViewCell contentInset](self, "contentInset");
  objc_msgSend(v17, "constraintEqualToAnchor:constant:", v16, v3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v15;
  -[CNPhotoPickerListCollectionViewCell tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bottomAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerListCollectionViewCell bottomAnchor](self, "bottomAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerListCollectionViewCell contentInset](self, "contentInset");
  objc_msgSend(v5, "constraintEqualToAnchor:constant:", v6, -v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v8;
  -[CNPhotoPickerListCollectionViewCell tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerListCollectionViewCell trailingAnchor](self, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerListCollectionViewCell contentInset](self, "contentInset");
  objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, -v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerListCollectionViewCell addConstraints:](self, "addConstraints:", v14);

}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  double v4;

  +[CNPhotoPickerListDataSource getAddItemsSectionHeight](CNPhotoPickerListDataSource, "getAddItemsSectionHeight", a3, a4);
  return v4 / 3.0;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 3;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  v8 = a3;
  -[CNPhotoPickerListCollectionViewCell selectionDelegate](self, "selectionDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didSelectItemFromListCollectionViewCell:", v6);

  objc_msgSend(v8, "deselectRowAtIndexPath:animated:", v6, 1);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("Cell"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "defaultContentConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "row");

  switch(v8)
  {
    case 2:
      CNContactsUIBundle();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = CFSTR("PHOTO_EDIT_LIST_MONOGRAM");
      goto LABEL_7;
    case 1:
      CNContactsUIBundle();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = CFSTR("PHOTO_EDIT_LIST_EMOJI");
      goto LABEL_7;
    case 0:
      CNContactsUIBundle();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = CFSTR("PHOTO_EDIT_LIST_LIBRARY");
LABEL_7:
      objc_msgSend(v9, "localizedStringForKey:value:table:", v11, &stru_1E20507A8, CFSTR("Localized"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setText:", v12);

      break;
  }
  +[CNPhotoPickerListDataSource symbolImageNameForAddItemType:](CNPhotoPickerListDataSource, "symbolImageNameForAddItemType:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:", v14);

  objc_msgSend(v7, "setImageToTextPadding:", 16.0);
  objc_msgSend(v7, "imageProperties");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTintColor:", v16);

  objc_msgSend(v6, "setContentConfiguration:", v7);
  return v6;
}

- (CNPhotoPickerListCollectionViewCellDelegate)selectionDelegate
{
  return self->_selectionDelegate;
}

- (void)setSelectionDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_selectionDelegate, a3);
}

- (UIEdgeInsets)contentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInset.top;
  left = self->_contentInset.left;
  bottom = self->_contentInset.bottom;
  right = self->_contentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->_contentInset = a3;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_selectionDelegate, 0);
}

+ (id)cellIdentifier
{
  return CFSTR("CNPhotoPickerListCellIdentifier");
}

@end
