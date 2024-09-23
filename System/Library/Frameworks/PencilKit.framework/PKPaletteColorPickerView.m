@implementation PKPaletteColorPickerView

+ (id)collectionViewFlowLayoutWithItemSize:(CGSize)a3 minimumLineSpacing:(double)a4 minimumInterItemSpacing:(double)a5
{
  double height;
  double width;
  id v9;

  height = a3.height;
  width = a3.width;
  v9 = objc_alloc_init(MEMORY[0x1E0DC3610]);
  objc_msgSend(v9, "setItemSize:", width, height);
  objc_msgSend(v9, "setMinimumLineSpacing:", a4);
  objc_msgSend(v9, "setMinimumInteritemSpacing:", a5);
  return v9;
}

- (PKPaletteColorPickerView)initWithFrame:(CGRect)a3
{
  PKPaletteColorPickerView *v3;
  PKPaletteColorPickerView *v4;
  void *v5;
  id v6;
  uint64_t v7;
  UICollectionView *collectionView;
  void *v9;
  UICollectionView *v10;
  uint64_t v11;
  objc_class *v12;
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
  void *v23;
  UILongPressGestureRecognizer *v24;
  UILongPressGestureRecognizer *longPressGestureRecognizer;
  UILongPressGestureRecognizer *v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  objc_super v36;
  _QWORD v37[5];

  v37[4] = *MEMORY[0x1E0C80C00];
  v36.receiver = self;
  v36.super_class = (Class)PKPaletteColorPickerView;
  v3 = -[PKPaletteColorPickerView initWithFrame:](&v36, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_scalingFactor = 1.0;
    v5 = (void *)objc_opt_class();
    -[PKPaletteColorPickerView swatchSize](v4, "swatchSize");
    objc_msgSend(v5, "collectionViewFlowLayoutWithItemSize:minimumLineSpacing:minimumInterItemSpacing:");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc(MEMORY[0x1E0DC35B8]);
    v7 = objc_msgSend(v6, "initWithFrame:collectionViewLayout:", v35, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    collectionView = v4->_collectionView;
    v4->_collectionView = (UICollectionView *)v7;

    -[UICollectionView setTranslatesAutoresizingMaskIntoConstraints:](v4->_collectionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView setBackgroundColor:](v4->_collectionView, "setBackgroundColor:", v9);

    -[UICollectionView setContentInsetAdjustmentBehavior:](v4->_collectionView, "setContentInsetAdjustmentBehavior:", 2);
    -[UICollectionView setShowsVerticalScrollIndicator:](v4->_collectionView, "setShowsVerticalScrollIndicator:", 0);
    -[UICollectionView setShowsHorizontalScrollIndicator:](v4->_collectionView, "setShowsHorizontalScrollIndicator:", 0);
    v10 = v4->_collectionView;
    v11 = objc_opt_class();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView registerClass:forCellWithReuseIdentifier:](v10, "registerClass:forCellWithReuseIdentifier:", v11, v13);

    -[UICollectionView setDataSource:](v4->_collectionView, "setDataSource:", v4);
    -[UICollectionView setDelegate:](v4->_collectionView, "setDelegate:", v4);
    -[UICollectionView setClipsToBounds:](v4->_collectionView, "setClipsToBounds:", 0);
    -[UICollectionView setScrollEnabled:](v4->_collectionView, "setScrollEnabled:", 0);
    -[UICollectionView setDelaysContentTouches:](v4->_collectionView, "setDelaysContentTouches:", 0);
    -[PKPaletteColorPickerView addSubview:](v4, "addSubview:", v4->_collectionView);
    v29 = (void *)MEMORY[0x1E0CB3718];
    -[UICollectionView topAnchor](v4->_collectionView, "topAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteColorPickerView topAnchor](v4, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v33);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v32;
    -[UICollectionView bottomAnchor](v4->_collectionView, "bottomAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteColorPickerView bottomAnchor](v4, "bottomAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v30);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = v14;
    -[UICollectionView leadingAnchor](v4->_collectionView, "leadingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteColorPickerView leadingAnchor](v4, "leadingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v37[2] = v17;
    -[UICollectionView trailingAnchor](v4->_collectionView, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteColorPickerView trailingAnchor](v4, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v37[3] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "activateConstraints:", v21);

    -[PKPaletteColorPickerView traitCollection](v4, "traitCollection");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteColorPickerView _swatchColorsForTraitCollection:](v4, "_swatchColorsForTraitCollection:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteColorPickerView setSwatchColors:](v4, "setSwatchColors:", v23);

    v24 = (UILongPressGestureRecognizer *)objc_alloc_init(MEMORY[0x1E0DC39C8]);
    -[UILongPressGestureRecognizer addTarget:action:](v24, "addTarget:action:", v4, sel__swatchLongPressHandler_);
    -[UILongPressGestureRecognizer setDelegate:](v24, "setDelegate:", v4);
    -[UICollectionView addGestureRecognizer:](v4->_collectionView, "addGestureRecognizer:", v24);
    longPressGestureRecognizer = v4->_longPressGestureRecognizer;
    v4->_longPressGestureRecognizer = v24;
    v26 = v24;

    -[PKPaletteColorPickerView _enableOrDisableLongPressGesture](v4, "_enableOrDisableLongPressGesture");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObserver:selector:name:object:", v4, sel_didChangePreferredContentSize_, *MEMORY[0x1E0DC48E8], 0);

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC48E8], 0);

  v4.receiver = self;
  v4.super_class = (Class)PKPaletteColorPickerView;
  -[PKPaletteColorPickerView dealloc](&v4, sel_dealloc);
}

- (void)_enableOrDisableLongPressGesture
{
  void *v3;
  id v4;
  UILongPressGestureRecognizer *longPressGestureRecognizer;
  void *v6;
  NSString *category;

  objc_msgSend(MEMORY[0x1E0DC3688], "system");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  category = (NSString *)objc_claimAutoreleasedReturnValue();

  if (UIContentSizeCategoryIsAccessibilityCategory(category))
  {
    v4 = objc_alloc_init(MEMORY[0x1E0DC3998]);
    -[PKPaletteColorPickerView addInteraction:](self, "addInteraction:", v4);
    longPressGestureRecognizer = self->_longPressGestureRecognizer;
    objc_msgSend(v4, "gestureRecognizerForExclusionRelationship");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILongPressGestureRecognizer requireGestureRecognizerToFail:](longPressGestureRecognizer, "requireGestureRecognizerToFail:", v6);

  }
}

- (id)_swatchColorsForTraitCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  uint64_t *v8;
  unint64_t v9;
  BOOL v10;
  uint64_t v11;
  id v12;

  v4 = a3;
  if (qword_1EF5604F0 != -1)
    dispatch_once(&qword_1EF5604F0, &__block_literal_global_64);
  -[PKPaletteColorPickerView window](self, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = PKUseCompactSize(v4, v6);

  v8 = _MergedGlobals_19;
  if (!v7)
  {
    v9 = -[PKPaletteColorPickerView edgeLocation](self, "edgeLocation");
    v10 = v9 == 2 || v9 == 8;
    v11 = 1;
    if (v10)
      v11 = 2;
    v8 = &_MergedGlobals_19[v11];
  }
  v12 = (id)*v8;

  return v12;
}

void __60__PKPaletteColorPickerView__swatchColorsForTraitCollection___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  _QWORD v25[6];

  v25[5] = *MEMORY[0x1E0C80C00];
  if (!_MergedGlobals_19[0])
    _MergedGlobals_19[0] = MEMORY[0x1E0C9AA60];
  if (!qword_1EF5604E0)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKSwatchColor swatchColor:identifier:]((uint64_t)PKSwatchColor, v22, CFSTR("black"));
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v0;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0823529412, 0.494117647, 0.984313725, 1.0);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKSwatchColor swatchColor:identifier:]((uint64_t)PKSwatchColor, v1, CFSTR("blue"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v2;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.325490196, 0.843137255, 0.411764706, 1.0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKSwatchColor swatchColor:identifier:]((uint64_t)PKSwatchColor, v3, CFSTR("green"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v25[2] = v4;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.996078431, 0.815686275, 0.188235294, 1.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKSwatchColor swatchColor:identifier:]((uint64_t)PKSwatchColor, v5, CFSTR("yellow"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v25[3] = v6;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.988235294, 0.192156863, 0.258823529, 1.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKSwatchColor swatchColor:identifier:]((uint64_t)PKSwatchColor, v7, CFSTR("red"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v25[4] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 5);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)qword_1EF5604E0;
    qword_1EF5604E0 = v9;

  }
  if (!qword_1EF5604E8)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.996078431, 0.815686275, 0.188235294, 1.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKSwatchColor swatchColor:identifier:]((uint64_t)PKSwatchColor, v23, CFSTR("yellow"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v11;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKSwatchColor swatchColor:identifier:]((uint64_t)PKSwatchColor, v12, CFSTR("black"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v13;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.988235294, 0.192156863, 0.258823529, 1.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKSwatchColor swatchColor:identifier:]((uint64_t)PKSwatchColor, v14, CFSTR("red"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24[2] = v15;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0823529412, 0.494117647, 0.984313725, 1.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKSwatchColor swatchColor:identifier:]((uint64_t)PKSwatchColor, v16, CFSTR("blue"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24[3] = v17;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.325490196, 0.843137255, 0.411764706, 1.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKSwatchColor swatchColor:identifier:]((uint64_t)PKSwatchColor, v18, CFSTR("green"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v24[4] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 5);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)qword_1EF5604E8;
    qword_1EF5604E8 = v20;

  }
}

- (void)setSwatchColors:(id)a3
{
  NSArray *v4;
  NSArray *swatchColors;

  if (self->_swatchColors != a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    swatchColors = self->_swatchColors;
    self->_swatchColors = v4;

    -[PKPaletteColorPickerView _rebuildSwatches](self, "_rebuildSwatches");
  }
}

- (void)_rebuildSwatches
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  PKPaletteColorSwatch *v10;
  PKPaletteMulticolorSwatch *v11;
  uint64_t v12;
  _QWORD *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[PKPaletteColorPickerView swatchColors](self, "swatchColors", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v8);
        v10 = objc_alloc_init(PKPaletteColorSwatch);
        -[PKPaletteColorSwatch setSwatchColor:](v10, "setSwatchColor:", v9);
        -[PKPaletteColorSwatch setColorUserInterfaceStyle:](v10, -[PKPaletteColorPickerView colorUserInterfaceStyle](self, "colorUserInterfaceStyle"));
        objc_msgSend(v3, "addObject:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  v11 = objc_alloc_init(PKPaletteMulticolorSwatch);
  -[PKPaletteColorPickerView setMulticolorSwatch:](self, "setMulticolorSwatch:", v11);

  v12 = -[PKPaletteColorPickerView colorUserInterfaceStyle](self, "colorUserInterfaceStyle");
  -[PKPaletteColorPickerView multicolorSwatch](self, "multicolorSwatch");
  v13 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteColorSwatch setColorUserInterfaceStyle:](v13, v12);

  -[PKPaletteColorPickerView multicolorSwatch](self, "multicolorSwatch");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v14);

  -[PKPaletteColorPickerView setSwatches:](self, "setSwatches:", v3);
  -[PKPaletteColorPickerView _updateUI](self, "_updateUI");

}

- (void)_updateUI
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  id v19;

  -[PKPaletteColorPickerView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteColorPickerView window](self, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = PKUseCompactSize(v3, v5);

  if (!v6)
  {
    -[PKPaletteColorPickerView swatches](self, "swatches");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteColorPickerView multicolorSwatch](self, "multicolorSwatch");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "indexOfObject:", v8);

    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = -[PKPaletteColorPickerView _multicolorSwatchIndexForEdge:](self, "_multicolorSwatchIndexForEdge:", -[PKPaletteColorPickerView edgeLocation](self, "edgeLocation"));
      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v11 = v10;
        if (v9 != v10)
        {
          -[PKPaletteColorPickerView swatches](self, "swatches");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (void *)objc_msgSend(v12, "mutableCopy");

          objc_msgSend(v13, "removeObjectAtIndex:", v9);
          -[PKPaletteColorPickerView multicolorSwatch](self, "multicolorSwatch");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "insertObject:atIndex:", v14, v11);

          -[PKPaletteColorPickerView setSwatches:](self, "setSwatches:", v13);
        }
      }
    }
  }
  -[PKPaletteColorPickerView collectionView](self, "collectionView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "collectionViewLayout");
  v19 = (id)objc_claimAutoreleasedReturnValue();

  -[PKPaletteColorPickerView swatchSize](self, "swatchSize");
  objc_msgSend(v19, "setItemSize:");
  -[PKPaletteColorPickerView scalingFactor](self, "scalingFactor");
  objc_msgSend(v19, "setMinimumLineSpacing:", v16 * 12.0);
  -[PKPaletteColorPickerView scalingFactor](self, "scalingFactor");
  objc_msgSend(v19, "setMinimumInteritemSpacing:", v17 * 12.0);
  -[PKPaletteColorPickerView collectionView](self, "collectionView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "reloadData");

}

- (unint64_t)_multicolorSwatchIndexForEdge:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  -[PKPaletteColorPickerView swatches](self, "swatches");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 < 2)
    return 0x7FFFFFFFFFFFFFFFLL;
  -[PKPaletteColorPickerView swatches](self, "swatches");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (a3 != 2)
    return v9 - 1;
  -[PKPaletteColorPickerView swatches](self, "swatches");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v10, "count") - 2;

  return v7;
}

- (void)setScalingFactor:(double)a3
{
  double scalingFactor;

  scalingFactor = self->_scalingFactor;
  if (scalingFactor != a3 && vabdd_f64(scalingFactor, a3) >= fabs(a3 * 0.000000999999997))
  {
    self->_scalingFactor = a3;
    -[PKPaletteColorPickerView _updateUI](self, "_updateUI");
    -[PKPaletteColorPickerView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (CGSize)swatchSize
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  -[PKPaletteColorPickerView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteColorPickerView window](self, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = PKUseCompactSize(v3, v5);

  if (v6)
  {
    v7 = PKPaletteColorSwatchSize(1);
  }
  else
  {
    v9 = PKPaletteColorSwatchSize(0);
    v11 = v10;
    -[PKPaletteColorPickerView scalingFactor](self, "scalingFactor");
    v13 = v11 * v12;
    v7 = floor(v9 * v12);
    v8 = floor(v13);
  }
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)_swatchLongPressHandler:(id)a3
{
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  id v29;

  v29 = a3;
  v4 = objc_msgSend(v29, "state");
  switch(v4)
  {
    case 3:
      -[PKPaletteColorPickerView colorPickerController](self, "colorPickerController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "viewController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "dismissViewControllerAnimated:completion:", 1, 0);

      +[PKStatisticsManager sharedStatisticsManager]();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaletteColorPickerView analyticsColorChangeCount](self, "analyticsColorChangeCount");
      -[PKStatisticsManager recordColorsChangedBeforeChosen:]((uint64_t)v19);

      +[PKStatisticsManager sharedStatisticsManager]();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKStatisticsManager recordColorPanelInvoked:]((uint64_t)v20, CFSTR("tapAndHold"));
LABEL_8:

      break;
    case 2:
      -[PKPaletteColorPickerView colorPickerController](self, "colorPickerController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "viewController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "view");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "locationInView:", v23);
      v25 = v24;
      v27 = v26;

      -[PKPaletteColorPickerView colorPickerController](self, "colorPickerController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "colorPicker");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setSelectedColorForPoint:", v25, v27);

      goto LABEL_8;
    case 1:
      -[PKPaletteColorPickerView collectionView](self, "collectionView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "locationInView:", v5);
      v7 = v6;
      v9 = v8;

      -[PKPaletteColorPickerView collectionView](self, "collectionView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaletteColorPickerView multicolorSwatch](self, "multicolorSwatch");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "convertPoint:toView:", v11, v7, v9);
      v13 = v12;
      v15 = v14;

      -[PKPaletteColorPickerView multicolorSwatch](self, "multicolorSwatch");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v11) = objc_msgSend(v16, "pointInside:withEvent:", 0, v13, v15);

      if ((_DWORD)v11)
        -[PKPaletteColorPickerView _showExtendedColorPicker](self, "_showExtendedColorPicker");
      break;
  }

}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  void *v5;

  objc_msgSend(a4, "view", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v5, "isDescendantOfView:", self);

  return (char)self;
}

- (void)setEdgeLocation:(unint64_t)a3
{
  void *v4;

  if (self->_edgeLocation != a3)
  {
    self->_edgeLocation = a3;
    -[PKPaletteColorPickerView traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteColorPickerView _reloadSwatchColorsForTraitCollection:](self, "_reloadSwatchColorsForTraitCollection:", v4);

    -[PKPaletteColorPickerView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[PKPaletteColorPickerView _updateUI](self, "_updateUI");
  }
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  int64_t v7;
  double v8;
  double v9;
  double v10;
  unint64_t v11;
  _BOOL4 v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  CGSize result;

  -[PKPaletteColorPickerView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteColorPickerView window](self, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = PKUseCompactSize(v3, v5);

  if (v6)
  {
    v7 = -[PKPaletteColorPickerView colorPickerMode](self, "colorPickerMode");
    if (v7 != 2)
    {
      if (v7 == 1)
      {
        v19 = PKPaletteColorSwatchSize(1);
        v10 = v20;
        -[PKPaletteColorPickerView swatches](self, "swatches");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v19 * (double)(unint64_t)objc_msgSend(v21, "count");

        -[PKPaletteColorPickerView swatches](self, "swatches");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (double)(unint64_t)(objc_msgSend(v23, "count") - 1) * 12.0;

        v8 = v22 + v24;
        goto LABEL_15;
      }
      if (v7)
      {
        v8 = *MEMORY[0x1E0C9D820];
        v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);
        goto LABEL_15;
      }
    }
    v8 = PKPaletteColorSwatchSize(1);
    v10 = v9;
  }
  else
  {
    v11 = -[PKPaletteColorPickerView edgeLocation](self, "edgeLocation");
    v13 = v11 == 2 || v11 == 8;
    v14 = PKPaletteColorSwatchesSize(v13);
    v16 = v15;
    -[PKPaletteColorPickerView scalingFactor](self, "scalingFactor");
    v18 = v17;
    v8 = v14 * v17;
    v10 = v16 * v18;
  }
LABEL_15:
  v25 = v10;
  result.height = v25;
  result.width = v8;
  return result;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[PKPaletteColorPickerView swatches](self, "swatches", a3, a4);
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
  void *v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[4];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v6;
  objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "subviews");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "makeObjectsPerformSelector:", sel_removeFromSuperview);

  -[PKPaletteColorPickerView swatches](self, "swatches");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v7;
  objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
  v14 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v14, "setUserInteractionEnabled:", 0);
  objc_msgSend(v10, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addSubview:", v14);

  objc_msgSend(v14, "hitTestInsets");
  objc_msgSend(v10, "setHitTestInsets:");
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  objc_msgSend(v10, "interactions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v51;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v51 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * v20);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v10, "removeInteraction:", v21);
        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    }
    while (v18);
  }

  if (v14)
    v22 = (void *)v14[55];
  else
    v22 = 0;
  v23 = v22;
  objc_msgSend(v10, "addInteraction:", v23);

  v24 = (void *)MEMORY[0x1E0DC3F10];
  objc_msgSend(v14, "swatchColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "color");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "pk_hoverAttributedStringForColor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contentView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "pk_setHoverLabelAttributedString:", v27);

  v40 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v14, "widthAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contentView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "widthAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:", v45);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = v44;
  objc_msgSend(v14, "heightAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contentView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "heightAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v41);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v54[1] = v39;
  objc_msgSend(v14, "centerXAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contentView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "centerXAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v54[2] = v31;
  objc_msgSend(v14, "centerYAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contentView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "centerYAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v54[3] = v35;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 4);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "activateConstraints:", v36);

  return v10;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v5 = a4;
  -[PKPaletteColorPickerView swatches](self, "swatches");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "row");

  objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
  v20 = (id)objc_claimAutoreleasedReturnValue();

  -[PKPaletteColorPickerView multicolorSwatch](self, "multicolorSwatch");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (!-[PKPaletteColorPickerView _shouldDisplayExtendedColorPickerPopoverFromColorSwatch:](self, "_shouldDisplayExtendedColorPickerPopoverFromColorSwatch:", v20))
  {
    -[PKPaletteColorPickerView multicolorSwatch](self, "multicolorSwatch");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isSelected");

    v15 = v20;
    if (v8 != v20 || (v14 & 1) != 0)
    {
      if (v14)
      {
        -[PKPaletteColorPickerView multicolorSwatch](self, "multicolorSwatch");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setSelected:", 0);

        v15 = v20;
      }
      objc_msgSend(v15, "swatchColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "color");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaletteColorPickerView setSelectedColor:](self, "setSelectedColor:", v19);

    }
    else
    {
      -[PKPaletteColorPickerView _selectedSwatch](self, "_selectedSwatch");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setSelected:", 0);

      -[PKPaletteColorPickerView multicolorSwatch](self, "multicolorSwatch");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setSelected:", 1);
    }

    -[PKPaletteColorPickerView delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "colorPickerDidChangeSelectedColor:isFromExtendedColorPicker:isContinuousColorSelection:", self, 0, 0);
    goto LABEL_11;
  }
  -[PKPaletteColorPickerView _showExtendedColorPicker](self, "_showExtendedColorPicker");
  -[PKPaletteColorPickerView colorPickerController](self, "colorPickerController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isBeingDismissed");

  if ((v11 & 1) == 0)
  {
    +[PKStatisticsManager sharedStatisticsManager]();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKStatisticsManager recordColorPanelInvoked:]((uint64_t)v12, CFSTR("tap"));
LABEL_11:

  }
}

- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _BYTE *v9;

  v5 = a4;
  -[PKPaletteColorPickerView swatches](self, "swatches");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "row");

  objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
  v9 = (_BYTE *)objc_claimAutoreleasedReturnValue();

  v8 = v9;
  if (v9 && !v9[417])
  {
    v9[417] = 1;
    -[PKPaletteColorSwatch _updateSelectionHighlight](v9);
    v8 = v9;
  }

}

- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _BYTE *v9;

  v5 = a4;
  -[PKPaletteColorPickerView swatches](self, "swatches");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "row");

  objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
  v9 = (_BYTE *)objc_claimAutoreleasedReturnValue();

  v8 = v9;
  if (v9 && v9[417])
  {
    v9[417] = 0;
    -[PKPaletteColorSwatch _updateSelectionHighlight](v9);
    v8 = v9;
  }

}

- (BOOL)_shouldDisplayExtendedColorPickerPopoverFromColorSwatch:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  BOOL v11;

  v4 = a3;
  -[PKPaletteColorPickerView multicolorSwatch](self, "multicolorSwatch");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[PKPaletteColorPickerView multicolorSwatch](self, "multicolorSwatch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "swatchColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaletteColorPickerView multicolorSwatch](self, "multicolorSwatch");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isSelected");

  v10 = v9 | !-[PKPaletteColorPickerView _colorPickerAllowsColorSelection](self, "_colorPickerAllowsColorSelection");
  if (v7)
    v11 = v10;
  else
    v11 = 1;
  return v5 == v4 && v11;
}

- (BOOL)_colorPickerAllowsColorSelection
{
  void *v3;
  char v4;
  void *v5;
  char v6;

  -[PKPaletteColorPickerView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 1;
  -[PKPaletteColorPickerView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "colorPickerShouldDisplayColorSelection:", self);

  return v6;
}

- (UIColor)selectedColor
{
  void *v2;
  void *v3;
  void *v4;

  -[PKPaletteColorPickerView _selectedSwatch](self, "_selectedSwatch");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "swatchColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "color");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v4;
}

- (void)setSelectedColor:(id)a3
{
  id v4;
  void *v5;
  id v6;
  BOOL IsEqualToColorIgnoringOpacity;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;

  v17 = a3;
  -[PKPaletteColorPickerView selectedColor](self, "selectedColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 == v17)
  {

  }
  else
  {
    -[PKPaletteColorPickerView selectedColor](self, "selectedColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17 && v5)
    {
      -[PKPaletteColorPickerView selectedColor](self, "selectedColor");
      v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      IsEqualToColorIgnoringOpacity = DKUColorIsEqualToColorIgnoringOpacity((CGColor *)objc_msgSend(v6, "CGColor"), (CGColor *)objc_msgSend(objc_retainAutorelease(v17), "CGColor"), 0);

      v8 = v17;
      if (IsEqualToColorIgnoringOpacity)
        goto LABEL_18;
    }
    else
    {

    }
    -[PKPaletteColorPickerView _selectedSwatch](self, "_selectedSwatch");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSelected:", 0);

    if (v17)
    {
      objc_msgSend(v17, "colorWithAlphaComponent:", 1.0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaletteColorPickerView swatchWithColor:](self, "swatchWithColor:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        -[PKPaletteColorPickerView multicolorSwatch](self, "multicolorSwatch");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11 == v12)
        {
          -[PKPaletteColorPickerView _setMulticolorSwatchColor:](self, "_setMulticolorSwatchColor:", v17);
          -[PKPaletteColorPickerView multicolorSwatch](self, "multicolorSwatch");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setSelected:", 1);

        }
      }
      else
      {
        -[PKPaletteColorPickerView _setMulticolorSwatchColor:](self, "_setMulticolorSwatchColor:", v17);
        -[PKPaletteColorPickerView multicolorSwatch](self, "multicolorSwatch");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setSelected:", 1);

        -[PKPaletteColorPickerView multicolorSwatch](self, "multicolorSwatch");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v11, "setSelected:", 1);
      -[PKPaletteColorPickerView multicolorSwatch](self, "multicolorSwatch");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isSelected");

      if ((v16 & 1) == 0)
        -[PKPaletteColorPickerView _setMulticolorSwatchColor:](self, "_setMulticolorSwatchColor:", 0);

    }
    else
    {
      -[PKPaletteColorPickerView _setMulticolorSwatchColor:](self, "_setMulticolorSwatchColor:", 0);
    }
  }
  v8 = v17;
LABEL_18:

}

- (void)setSupportsAlpha:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  self->_supportsAlpha = a3;
  -[PKPaletteColorPickerView colorPickerController](self, "colorPickerController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "colorPicker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSupportsAlpha:", v3);

}

- (id)_selectedSwatch
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[PKPaletteColorPickerView swatches](self, "swatches");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "indexOfObjectPassingTest:", &__block_literal_global_37);

  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    -[PKPaletteColorPickerView swatches](self, "swatches");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

uint64_t __43__PKPaletteColorPickerView__selectedSwatch__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSelected");
}

- (id)swatchWithColor:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  if (v4)
  {
    -[PKPaletteColorPickerView swatches](self, "swatches");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __44__PKPaletteColorPickerView_swatchWithColor___block_invoke;
    v10[3] = &unk_1E777BE70;
    v11 = v4;
    v6 = objc_msgSend(v5, "indexOfObjectPassingTest:", v10);

    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = 0;
    }
    else
    {
      -[PKPaletteColorPickerView swatches](self, "swatches");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

BOOL __44__PKPaletteColorPickerView_swatchWithColor___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  CGColor *ConvertedToSRGB;
  id v9;
  uint64_t v10;
  CGColor *v11;
  _BOOL8 IsEqualToColorIgnoringOpacity;

  objc_msgSend(a2, "swatchColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "color");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  v6 = objc_retainAutorelease(v4);
  v7 = v5;
  ConvertedToSRGB = DKUCGColorCreateConvertedToSRGB(objc_msgSend(v6, "CGColor"));
  v9 = objc_retainAutorelease(v7);
  v10 = objc_msgSend(v9, "CGColor");

  v11 = DKUCGColorCreateConvertedToSRGB(v10);
  IsEqualToColorIgnoringOpacity = DKUColorIsEqualToColorIgnoringOpacity(ConvertedToSRGB, v11, 0);
  CGColorRelease(ConvertedToSRGB);
  CGColorRelease(v11);

  return IsEqualToColorIgnoringOpacity;
}

- (id)swatchWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  if (v4)
  {
    -[PKPaletteColorPickerView swatches](self, "swatches");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __49__PKPaletteColorPickerView_swatchWithIdentifier___block_invoke;
    v10[3] = &unk_1E777BE70;
    v11 = v4;
    v6 = objc_msgSend(v5, "indexOfObjectPassingTest:", v10);

    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = 0;
    }
    else
    {
      -[PKPaletteColorPickerView swatches](self, "swatches");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __49__PKPaletteColorPickerView_swatchWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "swatchColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v5;
}

- (id)colorAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  y = a3.y;
  x = a3.x;
  -[PKPaletteColorPickerView collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteColorPickerView convertPoint:toView:](self, "convertPoint:toView:", v6, x, y);
  v8 = v7;
  v10 = v9;

  -[PKPaletteColorPickerView collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "indexPathForItemAtPoint:", v8, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[PKPaletteColorPickerView swatches](self, "swatches");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v12, "row"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "swatchColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "color");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  if (objc_msgSend(a4, "userInterfaceIdiom", a3))
    return -1;
  else
    return 1;
}

- (void)_showExtendedColorPicker
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
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
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  int v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  NSObject *v64;
  _QWORD v65[5];
  uint8_t buf[16];

  -[PKPaletteColorPickerView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "palettePopoverPresentingController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PKPaletteColorPickerView colorPickerController](self, "colorPickerController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {

      goto LABEL_7;
    }
    v7 = v6;
    if (objc_msgSend(v6, "isBeingPresented"))
    {

      goto LABEL_12;
    }
    v8 = objc_msgSend(v7, "isBeingDismissed");

    if ((v8 & 1) == 0)
    {
LABEL_7:
      -[PKPaletteColorPickerView _popoverPresentingSourceView](self, "_popoverPresentingSourceView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v5)
      {
        v64 = os_log_create("com.apple.pencilkit", "PKPalette");
        if (os_log_type_enabled(v64, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1BE213000, v64, OS_LOG_TYPE_FAULT, "sourceView shouldn't be nil when presenting a popover", buf, 2u);
        }

        goto LABEL_16;
      }
      +[PKPaletteColorPickerControllerFactory makeColorPickerController](PKPaletteColorPickerControllerFactory, "makeColorPickerController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaletteColorPickerView setColorPickerController:](self, "setColorPickerController:", v9);

      v10 = -[PKPaletteColorPickerView colorUserInterfaceStyle](self, "colorUserInterfaceStyle");
      -[PKPaletteColorPickerView colorPickerController](self, "colorPickerController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "colorPicker");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setColorUserInterfaceStyle:", v10);

      v13 = -[PKPaletteColorPickerView supportsAlpha](self, "supportsAlpha");
      -[PKPaletteColorPickerView colorPickerController](self, "colorPickerController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "colorPicker");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setSupportsAlpha:", v13);

      -[PKPaletteColorPickerView colorPickerController](self, "colorPickerController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "viewController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setModalPresentationStyle:", 7);

      -[PKPaletteColorPickerView colorPickerController](self, "colorPickerController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "viewController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "presentationController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setDelegate:", self);

      -[PKPaletteColorPickerView delegate](self, "delegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "palettePopoverPermittedArrowDirections");
      -[PKPaletteColorPickerView colorPickerController](self, "colorPickerController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "viewController");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "popoverPresentationController");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setPermittedArrowDirections:", v22);

      -[PKPaletteColorPickerView _popoverPresentingSourceRect](self, "_popoverPresentingSourceRect");
      v27 = v26;
      v29 = v28;
      v31 = v30;
      v33 = v32;
      -[PKPaletteColorPickerView colorPickerController](self, "colorPickerController");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "viewController");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "popoverPresentationController");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setSourceRect:", v27, v29, v31, v33);

      -[PKPaletteColorPickerView colorPickerController](self, "colorPickerController");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "viewController");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "popoverPresentationController");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setSourceView:", v5);

      -[PKPaletteColorPickerView colorPickerController](self, "colorPickerController");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "viewController");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "popoverPresentationController");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "_setShouldDisableInteractionDuringTransitions:", 0);

      -[PKPaletteColorPickerView delegate](self, "delegate");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "palettePopoverPassthroughViews");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaletteColorPickerView colorPickerController](self, "colorPickerController");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "viewController");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "popoverPresentationController");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setPassthroughViews:", v44);

      -[PKPaletteColorPickerView colorPickerController](self, "colorPickerController");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "viewController");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "popoverPresentationController");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "_setIgnoresKeyboardNotifications:", 1);

      -[PKPaletteColorPickerView updatePopoverUI](self, "updatePopoverUI");
      -[PKPaletteColorPickerView multicolorSwatch](self, "multicolorSwatch");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v49) = objc_msgSend(v51, "isSelected");

      if ((_DWORD)v49)
      {
        -[PKPaletteColorPickerView multicolorSwatch](self, "multicolorSwatch");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "swatchColor");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "color");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaletteColorPickerView colorPickerController](self, "colorPickerController");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "colorPicker");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "setSelectedColor:", v54);

      }
      -[PKPaletteColorPickerView delegate](self, "delegate");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend(v57, "shouldPalettePresentPopover");

      if (!v58)
      {
LABEL_16:

        goto LABEL_17;
      }
      +[PKStatisticsManager sharedStatisticsManager]();
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKStatisticsManager recordColorPanelInvoked:]((uint64_t)v59, CFSTR("open"));

      -[PKPaletteColorPickerView setAnalyticsColorChangeCount:](self, "setAnalyticsColorChangeCount:", 0);
      -[PKPaletteColorPickerView colorPickerController](self, "colorPickerController");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "colorPicker");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "selectedColor");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaletteColorPickerView setAnalyticsInitialColor:](self, "setAnalyticsInitialColor:", v62);

      -[PKPaletteColorPickerView colorPickerController](self, "colorPickerController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "viewController");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v65[0] = MEMORY[0x1E0C809B0];
      v65[1] = 3221225472;
      v65[2] = __52__PKPaletteColorPickerView__showExtendedColorPicker__block_invoke;
      v65[3] = &unk_1E7778020;
      v65[4] = self;
      objc_msgSend(v4, "presentViewController:animated:completion:", v63, 1, v65);

LABEL_12:
      goto LABEL_16;
    }
  }
LABEL_17:

}

void __52__PKPaletteColorPickerView__showExtendedColorPicker__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "colorPickerController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDelegate:", v1);

}

- (BOOL)_isExtendedColorPickerVisible
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  -[PKPaletteColorPickerView colorPickerController](self, "colorPickerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[PKPaletteColorPickerView delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "palettePopoverPresentingController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "presentedViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "presentedViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteColorPickerView colorPickerController](self, "colorPickerController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "viewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v7 == v9;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (CGRect)_popoverPresentingSourceRect
{
  void *v3;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect v22;
  CGRect v23;
  CGRect result;

  -[PKPaletteColorPickerView multicolorSwatch](self, "multicolorSwatch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v23 = CGRectInset(v22, -5.0, -5.0);
  x = v23.origin.x;
  y = v23.origin.y;
  width = v23.size.width;
  height = v23.size.height;

  -[PKPaletteColorPickerView delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_5:

    goto LABEL_6;
  }
  -[PKPaletteColorPickerView delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[PKPaletteColorPickerView delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "wantsCustomPalettePopoverPresentationSource"))
    {
      -[PKPaletteColorPickerView delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaletteColorPickerView colorPickerController](self, "colorPickerController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "viewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "palettePopoverSourceRectToPresentViewController:", v13);
      x = v14;
      y = v15;
      width = v16;
      height = v17;

    }
    goto LABEL_5;
  }
LABEL_6:
  v18 = x;
  v19 = y;
  v20 = width;
  v21 = height;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (id)_popoverPresentingSourceView
{
  void *v3;
  id v4;
  void *v5;
  char v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;

  -[PKPaletteColorPickerView multicolorSwatch](self, "multicolorSwatch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteColorPickerView delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_7;
  -[PKPaletteColorPickerView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[PKPaletteColorPickerView delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "wantsCustomPalettePopoverPresentationSource");

    if (v8)
    {
      -[PKPaletteColorPickerView delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "palettePopoverSourceView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v4 = v10;

        v3 = v4;
      }
      else
      {
        v4 = 0;
      }
LABEL_7:

    }
  }
  return v3;
}

- (void)updatePopoverUI
{
  void *v3;
  void *v4;
  id v5;

  -[PKPaletteColorPickerView delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaletteColorPickerView colorPickerController](self, "colorPickerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updatePalettePopover:", v4);

}

- (void)colorPickerControllerDidChangeSelectedColor:(id)a3 isContinuousColorSelection:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a4;
  objc_msgSend(a3, "colorPicker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectedColor");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[PKPaletteColorPickerView _selectedSwatch](self, "_selectedSwatch");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSelected:", 0);

  -[PKPaletteColorPickerView multicolorSwatch](self, "multicolorSwatch");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSelected:", 1);

  -[PKPaletteColorPickerView _setMulticolorSwatchColor:](self, "_setMulticolorSwatchColor:", v10);
  -[PKPaletteColorPickerView delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "colorPickerDidChangeSelectedColor:isFromExtendedColorPicker:isContinuousColorSelection:", self, 1, v4);

  -[PKPaletteColorPickerView setAnalyticsColorChangeCount:](self, "setAnalyticsColorChangeCount:", -[PKPaletteColorPickerView analyticsColorChangeCount](self, "analyticsColorChangeCount") + 1);
}

- (void)_setMulticolorSwatchColor:(id)a3
{
  void *v4;
  id v5;

  if (a3)
  {
    +[PKSwatchColor swatchColor:identifier:]((uint64_t)PKSwatchColor, a3, CFSTR("multi"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[PKPaletteColorPickerView multicolorSwatch](self, "multicolorSwatch");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSwatchColor:", v5);

  }
  else
  {
    -[PKPaletteColorPickerView multicolorSwatch](self, "multicolorSwatch");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSwatchColor:", 0);
  }

}

- (void)dismissPalettePopoverWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  -[PKPaletteColorPickerView colorPickerController](self, "colorPickerController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PKPaletteColorPickerView colorPickerController](self, "colorPickerController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = v6;
      if (objc_msgSend(v6, "isBeingPresented"))
      {

LABEL_11:
        goto LABEL_12;
      }
      v9 = objc_msgSend(v7, "isBeingDismissed");

      if ((v9 & 1) != 0)
      {
LABEL_12:
        -[PKPaletteColorPickerView colorPickerController](self, "colorPickerController");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "viewController");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "dismissViewControllerAnimated:completion:", 1, v18);

        goto LABEL_13;
      }
    }
    else
    {

    }
    +[PKStatisticsManager sharedStatisticsManager]();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteColorPickerView analyticsColorChangeCount](self, "analyticsColorChangeCount");
    -[PKStatisticsManager recordColorsChangedBeforeChosen:]((uint64_t)v10);

    -[PKPaletteColorPickerView analyticsInitialColor](self, "analyticsInitialColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteColorPickerView colorPickerController](self, "colorPickerController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "colorPicker");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "selectedColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v11, "isEqual:", v14);

    if (v15)
    {
      +[PKStatisticsManager sharedStatisticsManager]();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKStatisticsManager recordInkPickerNoOp:]((uint64_t)v5, CFSTR("colorPopover"));
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  v8 = v18;
  if (v18)
  {
    (*((void (**)(id))v18 + 2))(v18);
LABEL_13:
    v8 = v18;
  }

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKPaletteColorPickerView;
  -[PKPaletteColorPickerView traitCollectionDidChange:](&v12, sel_traitCollectionDidChange_, v4);
  if (v4)
  {
    -[PKPaletteColorPickerView traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "verticalSizeClass");
    if (v6 == objc_msgSend(v4, "verticalSizeClass"))
    {
      -[PKPaletteColorPickerView traitCollection](self, "traitCollection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "horizontalSizeClass");
      if (v8 == objc_msgSend(v4, "horizontalSizeClass"))
      {
        -[PKPaletteColorPickerView traitCollection](self, "traitCollection");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "userInterfaceStyle");
        v11 = objc_msgSend(v4, "userInterfaceStyle");

        if (v10 == v11)
          goto LABEL_9;
        goto LABEL_8;
      }

    }
LABEL_8:
    -[PKPaletteColorPickerView updatePopoverUI](self, "updatePopoverUI");
    -[PKPaletteColorPickerView reloadColorsForCurrentColorPickerMode](self, "reloadColorsForCurrentColorPickerMode");
    -[PKPaletteColorPickerView _updateUI](self, "_updateUI");
    -[PKPaletteColorPickerView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
LABEL_9:

}

- (void)setColorUserInterfaceStyle:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_colorUserInterfaceStyle != a3)
  {
    self->_colorUserInterfaceStyle = a3;
    -[PKPaletteColorPickerView colorPickerController](self, "colorPickerController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "colorPicker");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setColorUserInterfaceStyle:", a3);

    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[PKPaletteColorPickerView swatches](self, "swatches", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          -[PKPaletteColorSwatch setColorUserInterfaceStyle:](*(_QWORD **)(*((_QWORD *)&v12 + 1) + 8 * i), a3);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

- (void)_reloadSwatchColorsForTraitCollection:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[PKPaletteColorPickerView selectedColor](self, "selectedColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteColorPickerView swatchWithColor:](self, "swatchWithColor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "swatchColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "isEqualToString:", CFSTR("multi")))
  {

    v7 = 0;
  }
  -[PKPaletteColorPickerView _swatchColorsForTraitCollection:](self, "_swatchColorsForTraitCollection:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteColorPickerView setSwatchColors:](self, "setSwatchColors:", v8);

  -[PKPaletteColorPickerView _rebuildSwatches](self, "_rebuildSwatches");
  -[PKPaletteColorPickerView swatchWithIdentifier:](self, "swatchWithIdentifier:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    objc_msgSend(v9, "setSelected:", 1);
  else
    -[PKPaletteColorPickerView setSelectedColor:](self, "setSelectedColor:", v4);

}

- (void)toggleColorSelectionPopover
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PKPaletteColorPickerView colorPickerController](self, "colorPickerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isBeingPresented"))
  {

LABEL_4:
    -[PKPaletteColorPickerView dismissPalettePopoverWithCompletion:](self, "dismissPalettePopoverWithCompletion:", 0);
    return;
  }
  -[PKPaletteColorPickerView colorPickerController](self, "colorPickerController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentingViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    goto LABEL_4;
  -[PKPaletteColorPickerView _showExtendedColorPicker](self, "_showExtendedColorPicker");
}

- (void)setColorPickerMode:(int64_t)a3
{
  if (self->_colorPickerMode != a3)
  {
    self->_colorPickerMode = a3;
    -[PKPaletteColorPickerView reloadColorsForCurrentColorPickerMode](self, "reloadColorsForCurrentColorPickerMode");
    -[PKPaletteColorPickerView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (void)reloadColorsForCurrentColorPickerMode
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  if (-[PKPaletteColorPickerView colorPickerMode](self, "colorPickerMode") == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithHorizontalSizeClass:", 2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x1E0DC3E88];
    v12[0] = v3;
    -[PKPaletteColorPickerView traitCollectionWithCurrentInterfaceStyle](self, "traitCollectionWithCurrentInterfaceStyle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v5;
    v6 = (void *)MEMORY[0x1E0C99D20];
    v7 = v12;
LABEL_5:
    objc_msgSend(v6, "arrayWithObjects:count:", v7, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "traitCollectionWithTraitsFromCollections:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKPaletteColorPickerView _reloadSwatchColorsForTraitCollection:](self, "_reloadSwatchColorsForTraitCollection:", v9);
    return;
  }
  if (-[PKPaletteColorPickerView colorPickerMode](self, "colorPickerMode") == 2)
  {
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithHorizontalSizeClass:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x1E0DC3E88];
    v11[0] = v3;
    -[PKPaletteColorPickerView traitCollectionWithCurrentInterfaceStyle](self, "traitCollectionWithCurrentInterfaceStyle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v5;
    v6 = (void *)MEMORY[0x1E0C99D20];
    v7 = v11;
    goto LABEL_5;
  }
  -[PKPaletteColorPickerView traitCollection](self, "traitCollection");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaletteColorPickerView _reloadSwatchColorsForTraitCollection:](self, "_reloadSwatchColorsForTraitCollection:");

}

- (id)traitCollectionWithCurrentInterfaceStyle
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0DC3E88];
  -[PKPaletteColorPickerView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollectionWithUserInterfaceStyle:", objc_msgSend(v3, "userInterfaceStyle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)edgeLocation
{
  return self->_edgeLocation;
}

- (unint64_t)cornerLocation
{
  return self->_cornerLocation;
}

- (void)setCornerLocation:(unint64_t)a3
{
  self->_cornerLocation = a3;
}

- (double)scalingFactor
{
  return self->_scalingFactor;
}

- (BOOL)supportsAlpha
{
  return self->_supportsAlpha;
}

- (PKPalettePopoverPresenting)delegate
{
  return (PKPalettePopoverPresenting *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)colorUserInterfaceStyle
{
  return self->_colorUserInterfaceStyle;
}

- (PKPaletteMulticolorSwatch)multicolorSwatch
{
  return self->_multicolorSwatch;
}

- (void)setMulticolorSwatch:(id)a3
{
  objc_storeStrong((id *)&self->_multicolorSwatch, a3);
}

- (int64_t)colorPickerMode
{
  return self->_colorPickerMode;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (NSArray)swatches
{
  return self->_swatches;
}

- (void)setSwatches:(id)a3
{
  objc_storeStrong((id *)&self->_swatches, a3);
}

- (NSArray)swatchColors
{
  return self->_swatchColors;
}

- (UILongPressGestureRecognizer)longPressGestureRecognizer
{
  return self->_longPressGestureRecognizer;
}

- (void)setLongPressGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, a3);
}

- (PKPaletteColorPickerController)colorPickerController
{
  return self->_colorPickerController;
}

- (void)setColorPickerController:(id)a3
{
  objc_storeStrong((id *)&self->_colorPickerController, a3);
}

- (UIColor)analyticsInitialColor
{
  return self->_analyticsInitialColor;
}

- (void)setAnalyticsInitialColor:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsInitialColor, a3);
}

- (int64_t)analyticsColorChangeCount
{
  return self->_analyticsColorChangeCount;
}

- (void)setAnalyticsColorChangeCount:(int64_t)a3
{
  self->_analyticsColorChangeCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsInitialColor, 0);
  objc_storeStrong((id *)&self->_colorPickerController, 0);
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_swatchColors, 0);
  objc_storeStrong((id *)&self->_swatches, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_multicolorSwatch, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
