@implementation PKPaletteShapesView

- (PKPaletteShapesView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  PKPaletteShapesView *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  UICollectionView *collectionView;
  void *v28;
  UICollectionView *v29;
  uint64_t v30;
  objc_class *v31;
  void *v32;
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
  objc_super v44;
  void *v45;
  _QWORD v46[6];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v46[4] = *MEMORY[0x1E0C80C00];
  v44.receiver = self;
  v44.super_class = (Class)PKPaletteShapesView;
  v7 = -[PKPaletteShapesView initWithFrame:](&v44, sel_initWithFrame_);
  if (v7)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0DC3CA8]);
    objc_msgSend(v8, "setAxis:", 1);
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PKPaletteShapesView addSubview:](v7, "addSubview:", v8);
    v35 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v8, "topAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteShapesView safeAreaLayoutGuide](v7, "safeAreaLayoutGuide");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "topAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v40);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v39;
    objc_msgSend(v8, "bottomAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteShapesView safeAreaLayoutGuide](v7, "safeAreaLayoutGuide");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "bottomAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v36);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v46[1] = v34;
    v41 = v8;
    objc_msgSend(v8, "leftAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteShapesView safeAreaLayoutGuide](v7, "safeAreaLayoutGuide");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "leftAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v46[2] = v12;
    objc_msgSend(v8, "rightAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteShapesView safeAreaLayoutGuide](v7, "safeAreaLayoutGuide");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "rightAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v46[3] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "activateConstraints:", v17);

    v18 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    _PencilKitBundle();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Shapes"), CFSTR("Shapes"), CFSTR("Localizable"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setText:", v20);

    objc_msgSend(v18, "setTextAlignment:", 1);
    objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v41, "addArrangedSubview:", v18);
    v21 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v18, "heightAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToConstant:", 40.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "activateConstraints:", v24);

    v25 = objc_alloc_init(MEMORY[0x1E0DC3610]);
    objc_msgSend(v25, "setItemSize:", 40.0, 40.0);
    objc_msgSend(v25, "setMinimumLineSpacing:", 8.0);
    objc_msgSend(v25, "setMinimumInteritemSpacing:", 8.0);
    objc_msgSend(v25, "setSectionInset:", 0.0, 8.0, 0.0, 8.0);
    v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC35B8]), "initWithFrame:collectionViewLayout:", v25, x, y, width, height);
    collectionView = v7->_collectionView;
    v7->_collectionView = (UICollectionView *)v26;

    -[UICollectionView setTranslatesAutoresizingMaskIntoConstraints:](v7->_collectionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView setBackgroundColor:](v7->_collectionView, "setBackgroundColor:", v28);

    v29 = v7->_collectionView;
    v30 = objc_opt_class();
    v31 = (objc_class *)objc_opt_class();
    NSStringFromClass(v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView registerClass:forCellWithReuseIdentifier:](v29, "registerClass:forCellWithReuseIdentifier:", v30, v32);

    objc_msgSend(v41, "addArrangedSubview:", v7->_collectionView);
  }
  return v7;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end
