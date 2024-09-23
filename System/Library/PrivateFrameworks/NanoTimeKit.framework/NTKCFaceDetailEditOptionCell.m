@implementation NTKCFaceDetailEditOptionCell

+ (id)reuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NTKCFaceDetailEditOptionCell)initWithCollection:(id)a3 forFaceView:(id)a4 face:(id)a5
{
  id v8;
  id v9;
  id v10;
  NTKCFaceDetailEditOptionCell *v11;
  NTKCFaceDetailEditOptionCell *v12;
  void *v13;
  id v14;
  void *v15;
  UICollectionView *collectionView;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)NTKCFaceDetailEditOptionCell;
  v11 = -[NTKCDetailTableViewCell init](&v22, sel_init);
  v12 = v11;
  if (v11)
  {
    -[NTKCFaceDetailEditOptionCell setCollection:](v11, "setCollection:", v8);
    -[NTKCFaceDetailEditOptionCell setFaceView:](v12, "setFaceView:", v9);
    objc_msgSend(v10, "prepareEditOptions");
    -[NTKCFaceDetailEditOptionCell setFace:](v12, "setFace:", v10);
    v12->_editOptionVerticalBottomBuffer = 50.0;
    v13 = (void *)objc_opt_new();
    -[NTKCFaceDetailEditOptionCell setLayout:](v12, "setLayout:", v13);

    -[UICollectionViewFlowLayout _setWantsRightToLeftHorizontalMirroringIfNeeded:](v12->_layout, "_setWantsRightToLeftHorizontalMirroringIfNeeded:", 1);
    -[UICollectionViewFlowLayout setScrollDirection:](v12->_layout, "setScrollDirection:", 1);
    v14 = objc_alloc(MEMORY[0x1E0DC35B8]);
    v15 = (void *)objc_msgSend(v14, "initWithFrame:collectionViewLayout:", v12->_layout, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[NTKCFaceDetailEditOptionCell setCollectionView:](v12, "setCollectionView:", v15);

    -[UICollectionView setBackgroundColor:](v12->_collectionView, "setBackgroundColor:", 0);
    -[UICollectionView setAlwaysBounceHorizontal:](v12->_collectionView, "setAlwaysBounceHorizontal:", 1);
    -[UICollectionView setShowsHorizontalScrollIndicator:](v12->_collectionView, "setShowsHorizontalScrollIndicator:", 0);
    -[UICollectionView setDelegate:](v12->_collectionView, "setDelegate:", v12);
    -[UICollectionView setDataSource:](v12->_collectionView, "setDataSource:", v12);
    collectionView = v12->_collectionView;
    v17 = objc_opt_class();
    +[_NTKCFaceDetailCollectionCell reuseIdentifier](_NTKCFaceDetailCollectionCell, "reuseIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView registerClass:forCellWithReuseIdentifier:](collectionView, "registerClass:forCellWithReuseIdentifier:", v17, v18);

    -[NTKCFaceDetailEditOptionCell contentView](v12, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSubview:", v12->_collectionView);

    -[NTKCFaceDetailEditOptionCell _setVerticalBottomBuffer](v12, "_setVerticalBottomBuffer");
    -[NTKCFaceDetailEditOptionCell _setupFromCollection](v12, "_setupFromCollection");
    -[NTKEditOptionCollection optionsDescription](v12->_collection, "optionsDescription");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKCFaceDetailEditOptionCell setOptionsText:](v12, "setOptionsText:", v20);
    v12->_selectedIndex = 0x7FFFFFFFFFFFFFFFLL;
    -[NTKCFaceDetailEditOptionCell _fontSizeDidChange](v12, "_fontSizeDidChange");

  }
  return v12;
}

- (void)_setVerticalBottomBuffer
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  self->_editOptionVerticalBottomBuffer = 50.0;
  -[NTKEditOptionCollection options](self->_collection, "options");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 >= 1)
  {
    v5 = 0;
    while (1)
    {
      -[NTKCFaceDetailEditOptionCell _indexPathForEditOptionIndex:](self, "_indexPathForEditOptionIndex:", v5);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[NTKCFaceDetailEditOptionCell collectionView:cellForItemAtIndexPath:](self, "collectionView:cellForItemAtIndexPath:", self->_collectionView);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "is3Lines"))
        break;

      if (v4 == ++v5)
        return;
    }
    self->_editOptionVerticalBottomBuffer = 58.0;

  }
}

- (void)setOptionsText:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *optionsDescription;
  id v8;

  v8 = a3;
  if (v8)
  {
    -[NTKCFaceDetailEditOptionCell optionsDescription](self, "optionsDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

    v5 = (void *)objc_opt_new();
    -[NTKCFaceDetailEditOptionCell setOptionsDescription:](self, "setOptionsDescription:", v5);

    BPSDetailTextColor();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_optionsDescription, "setTextColor:", v6);

    -[UILabel setNumberOfLines:](self->_optionsDescription, "setNumberOfLines:", 0);
    -[UILabel setText:](self->_optionsDescription, "setText:", v8);
    -[UILabel setLineBreakMode:](self->_optionsDescription, "setLineBreakMode:", 0);
    -[NTKCFaceDetailEditOptionCell contentView](self, "contentView");
    optionsDescription = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(optionsDescription, "addSubview:", self->_optionsDescription);
  }
  else
  {
    -[UILabel removeFromSuperview](self->_optionsDescription, "removeFromSuperview");
    optionsDescription = self->_optionsDescription;
    self->_optionsDescription = 0;
  }

  -[NTKCFaceDetailEditOptionCell setNeedsLayout](self, "setNeedsLayout");
  -[NTKCFaceDetailEditOptionCell setNeedsDisplay](self, "setNeedsDisplay");

}

- (int64_t)_editOptionIndexForIndexPath:(id)a3
{
  return objc_msgSend(a3, "item");
}

- (id)_indexPathForEditOptionIndex:(int64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a3, 0);
}

- (void)_setupFromCollection
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id WeakRetained;
  uint64_t v11;
  double v12;
  unint64_t v13;
  double outlinePadding;
  double v15;

  +[NTKEditOption sizeForSwatchStyle:](NTKEditOption, "sizeForSwatchStyle:", -[NTKEditOptionCollection swatchStyle](self->_collection, "swatchStyle"));
  v4 = v3;
  v6 = v5;
  +[_NTKCFaceDetailCollectionCell outlineLineWidth](_NTKCFaceDetailCollectionCell, "outlineLineWidth");
  v8 = v7;
  v9 = 4.0;
  if (-[NTKEditOptionCollection mode](self->_collection, "mode") == 11)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_faceView);
    v11 = objc_msgSend(WeakRetained, "faceStyle");

    if (v11 == 1)
      v9 = (114.0 - v4 + v8 * -2.0) * 0.5;
  }
  self->_outlineOutset = v9;
  self->_outlinePadding = v8 + v9 + v8 + v9;
  -[NTKCFaceDetailEditOptionCell _spacing](self, "_spacing");
  -[UICollectionViewFlowLayout setMinimumLineSpacing:](self->_layout, "setMinimumLineSpacing:");
  v12 = self->_outlinePadding * -0.5 + 23.0;
  v13 = -[NTKEditOptionCollection collectionType](self->_collection, "collectionType");
  outlinePadding = self->_outlinePadding;
  v15 = v12;
  if (v13 != 1)
    v15 = self->_editOptionVerticalBottomBuffer + outlinePadding * -0.5;
  -[UICollectionViewFlowLayout setItemSize:](self->_layout, "setItemSize:", v4 + outlinePadding, v15 + v6 + v12 + outlinePadding);
  self->_swatchFrame.origin.x = self->_outlinePadding * 0.5;
  self->_swatchFrame.origin.y = 23.0;
  self->_swatchFrame.size.width = v4;
  self->_swatchFrame.size.height = v6;
}

- (BOOL)_isReloadCollectionRequired:(id)a3 selectedOptions:(id)a4
{
  return 0;
}

- (double)rowHeight
{
  double v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect v16;

  -[UICollectionViewFlowLayout itemSize](self->_layout, "itemSize");
  v4 = v3;
  if (self->_optionsDescription)
  {
    v5 = v3 - self->_editOptionVerticalBottomBuffer;
    -[NTKCFaceDetailEditOptionCell layoutIfNeeded](self, "layoutIfNeeded");
    -[UILabel font](self->_optionsDescription, "font");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_scaledValueForValue:", 60.0);
    v8 = v5 + v7;
    -[UILabel _firstLineBaselineOffsetFromBoundsTop](self->_optionsDescription, "_firstLineBaselineOffsetFromBoundsTop");
    v10 = v8 - v9;
    -[UILabel bounds](self->_optionsDescription, "bounds");
    v11 = v10 + CGRectGetHeight(v16);
    objc_msgSend(v6, "_scaledValueForValue:", 25.0);
    v13 = v12;
    -[UILabel _baselineOffsetFromBottom](self->_optionsDescription, "_baselineOffsetFromBottom");
    v4 = v11 + v13 - v14;

  }
  return v4;
}

- (void)reloadVisibleCells
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id obj;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[NTKCFaceDetailEditOptionCell _indexPathForEditOptionIndex:](self, "_indexPathForEditOptionIndex:", self->_selectedIndex);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v11, "row");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[UICollectionView visibleCells](self->_collectionView, "visibleCells");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        -[UICollectionView indexPathForCell:](self->_collectionView, "indexPathForCell:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NTKCFaceDetailEditOptionCell _imageForIndexPath:](self, "_imageForIndexPath:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setImage:", v10);

        objc_msgSend(v8, "setActive:", objc_msgSend(v9, "row") == v3);
        objc_msgSend(v8, "setSwatchImageContentMode:", -[NTKCFaceDetailEditOptionCell _swatchImageContentMode](self, "_swatchImageContentMode"));
        objc_msgSend(v8, "setDisabled:", self->_disabled);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

}

- (void)setSelectedOptions:(id)a3
{
  id v5;
  void *v6;
  _BOOL4 v7;
  id WeakRetained;
  char v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  int64_t v14;
  void *v15;
  int64_t v16;
  void *v17;
  id v18;
  void *v19;
  int64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  void *v35;
  NSDictionary *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  uint64_t v41;
  void *v42;
  void *v43;
  NSDictionary *selectedSlotOptions;
  NSDictionary **p_selectedOptions;
  NSDictionary *selectedOptions;
  void *v47;
  void *v48;
  id v49;
  int64_t v50;
  void *v51;
  void *v52;
  id v53;
  NSDictionary *v54;
  void *v55;
  NSDictionary *v56;
  void *v57;
  NTKFace **p_face;
  id v59;
  char v60;
  id v61;
  id v62;
  int64_t v63;
  void *v64;
  uint64_t v65;
  int v66;
  int64_t v67;
  int v68;
  id v69;
  void *v70;
  int64_t v71;
  void *v72;
  int v73;
  int disabled;
  int v75;
  id v76;
  int v77;
  void *v78;
  void *v79;
  id v80;
  id *location;
  void *v82;
  id obj;
  id *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  void *v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _BYTE v99[128];
  _BYTE v100[128];
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[NTKCFaceDetailEditOptionCell collection](self, "collection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NTKCFaceDetailEditOptionCell _isReloadCollectionRequired:selectedOptions:](self, "_isReloadCollectionRequired:selectedOptions:", v6, v5);

  if (v7)
  {
    objc_storeStrong((id *)&self->_selectedOptions, a3);
    -[NTKCFaceDetailEditOptionCell _setupFromCollection](self, "_setupFromCollection");
    -[UICollectionView reloadData](self->_collectionView, "reloadData");
    WeakRetained = objc_loadWeakRetained((id *)&self->_face);
    v9 = objc_msgSend(WeakRetained, "editOptionsPrepared");

    if ((v9 & 1) == 0)
    {
      v10 = objc_loadWeakRetained((id *)&self->_face);
      objc_msgSend(v10, "prepareEditOptions");

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[NTKEditOptionCollection mode](self->_collection, "mode"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_loadWeakRetained((id *)&self->_face);
    v14 = -[NTKEditOptionCollection mode](self->_collection, "mode");
    -[NTKEditOptionCollection slot](self->_collection, "slot");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v13, "indexOfOption:forCustomEditMode:slot:", v12, v14, v15);

    if (v16 != self->_selectedIndex)
    {
      if (v16 == 0x7FFFFFFFFFFFFFFFLL)
        v16 = 0;
      self->_selectedIndex = v16;
    }
    -[NTKCFaceDetailEditOptionCell _indexPathForEditOptionIndex:](self, "_indexPathForEditOptionIndex:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
      -[NTKCFaceDetailEditOptionCell _ensureIndexPathVisible:animated:](self, "_ensureIndexPathVisible:animated:", v17, 0);
    -[NTKCFaceDetailEditOptionCell reloadVisibleCells](self, "reloadVisibleCells");

  }
  else
  {
    v80 = a3;
    v18 = objc_loadWeakRetained((id *)&self->_faceView);
    v19 = (void *)objc_opt_class();
    v20 = -[NTKEditOptionCollection mode](self->_collection, "mode");
    location = (id *)&self->_faceView;
    v21 = objc_loadWeakRetained((id *)&self->_faceView);
    objc_msgSend(v21, "device");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "swatchForEditModeDependsOnOptions:forDevice:", v20, v22);
    v82 = v5;
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v86 = (void *)objc_opt_new();
    v85 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = 0u;
    v96 = 0u;
    v97 = 0u;
    v98 = 0u;
    v26 = v82;
    obj = v23;
    v87 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v100, 16);
    if (v87)
    {
      v84 = *(id **)v96;
      do
      {
        v27 = 0;
        do
        {
          if (*(id **)v96 != v84)
            objc_enumerationMutation(obj);
          v89 = v27;
          v28 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * v27);
          -[NSDictionary objectForKeyedSubscript:](self->_selectedOptions, "objectForKeyedSubscript:", v28, v80, location);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "setObject:forKeyedSubscript:", v29, v28);

          objc_msgSend(v26, "objectForKeyedSubscript:", v28);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "setObject:forKeyedSubscript:", v30, v28);

          v31 = objc_loadWeakRetained((id *)&self->_face);
          v32 = objc_msgSend(v31, "dynamicEditMode");
          v33 = objc_msgSend(v28, "integerValue");

          if (v32 == v33)
          {
            v34 = objc_loadWeakRetained((id *)&self->_face);
            objc_msgSend(v34, "selectedSlotOptionsForCustomEditMode:", objc_msgSend(v34, "dynamicEditMode"));
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            v93 = 0u;
            v94 = 0u;
            v91 = 0u;
            v92 = 0u;
            v36 = v35;
            v37 = -[NSDictionary countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v91, v99, 16);
            if (v37)
            {
              v38 = v37;
              v39 = *(_QWORD *)v92;
              do
              {
                for (i = 0; i != v38; ++i)
                {
                  if (*(_QWORD *)v92 != v39)
                    objc_enumerationMutation(v36);
                  v41 = *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * i);
                  -[NSDictionary objectForKeyedSubscript:](self->_selectedSlotOptions, "objectForKeyedSubscript:", v41);
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "setObject:forKeyedSubscript:", v42, v41);

                  -[NSDictionary objectForKeyedSubscript:](v36, "objectForKeyedSubscript:", v41);
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v25, "setObject:forKeyedSubscript:", v43, v41);

                }
                v38 = -[NSDictionary countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v91, v99, 16);
              }
              while (v38);
            }

            selectedSlotOptions = self->_selectedSlotOptions;
            self->_selectedSlotOptions = v36;

            v26 = v82;
          }
          v27 = v89 + 1;
        }
        while (v89 + 1 != v87);
        v87 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v100, 16);
      }
      while (v87);
    }

    p_selectedOptions = &self->_selectedOptions;
    selectedOptions = self->_selectedOptions;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[NTKEditOptionCollection mode](self->_collection, "mode"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](selectedOptions, "objectForKeyedSubscript:", v47);
    v90 = (void *)objc_claimAutoreleasedReturnValue();

    -[NTKEditOptionCollection slot](self->_collection, "slot");
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (v48)
    {
      v49 = objc_loadWeakRetained((id *)&self->_face);
      v50 = -[NTKEditOptionCollection mode](self->_collection, "mode");
      -[NTKEditOptionCollection slot](self->_collection, "slot");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "selectedOptionForCustomEditMode:slot:", v50, v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      v53 = v52;
      v54 = (NSDictionary *)objc_msgSend(v82, "mutableCopy");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[NTKEditOptionCollection mode](self->_collection, "mode"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary setObject:forKey:](v54, "setObject:forKey:", v53, v55);
      v88 = v53;

      v56 = *p_selectedOptions;
      *p_selectedOptions = v54;

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[NTKEditOptionCollection mode](self->_collection, "mode"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectForKeyedSubscript:", v57);
      v88 = (void *)objc_claimAutoreleasedReturnValue();

      objc_storeStrong((id *)&self->_selectedOptions, v80);
    }
    p_face = &self->_face;
    v59 = objc_loadWeakRetained((id *)&self->_face);
    v60 = objc_msgSend(v59, "editOptionsPrepared");

    if ((v60 & 1) == 0)
    {
      v61 = objc_loadWeakRetained((id *)p_face);
      objc_msgSend(v61, "prepareEditOptions");

    }
    v62 = objc_loadWeakRetained((id *)p_face);
    v63 = -[NTKEditOptionCollection mode](self->_collection, "mode");
    -[NTKEditOptionCollection slot](self->_collection, "slot");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend(v62, "indexOfOption:forCustomEditMode:slot:", v88, v63, v64);

    if (objc_msgSend(v88, "isEqual:", v90) && v65 == self->_selectedIndex)
    {
      v66 = 0;
    }
    else
    {
      if (v65 == 0x7FFFFFFFFFFFFFFFLL)
        v67 = 0;
      else
        v67 = v65;
      self->_selectedIndex = v67;
      v66 = 1;
    }
    if (objc_msgSend(obj, "count", v80))
    {
      if (objc_msgSend(v85, "isEqualToDictionary:", v86))
        v68 = objc_msgSend(v25, "isEqualToDictionary:", v24) ^ 1;
      else
        v68 = 1;
    }
    else
    {
      v68 = 0;
    }
    v69 = objc_loadWeakRetained(location);
    objc_msgSend(v69, "_editModesDisabledByCurrentConfiguration");
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    v71 = -[NTKEditOptionCollection mode](self->_collection, "mode");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = objc_msgSend(v70, "containsObject:", v72);

    disabled = self->_disabled;
    v75 = disabled;
    if (disabled != v73)
    {
      self->_disabled = v73;
      v75 = v73;
    }
    if (v75)
    {
      v76 = objc_loadWeakRetained((id *)&self->_face);
      objc_msgSend(v76, "localizedExplanationMessageForDisabledEditMode:", v71);
      v77 = v66;
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKCFaceDetailEditOptionCell setOptionsText:](self, "setOptionsText:", v78);

      v66 = v77;
      -[UICollectionView setScrollEnabled:](self->_collectionView, "setScrollEnabled:", 0);
    }
    else
    {
      -[NTKEditOptionCollection optionsDescription](self->_collection, "optionsDescription");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKCFaceDetailEditOptionCell setOptionsText:](self, "setOptionsText:", v79);
      -[UICollectionView setScrollEnabled:](self->_collectionView, "setScrollEnabled:", 1);

    }
    if (((v66 | v68) & 1) != 0 || disabled != v73)
      -[NTKCFaceDetailEditOptionCell reloadVisibleCells](self, "reloadVisibleCells");

    v5 = v82;
  }

}

- (BOOL)collectionChanged:(id)a3 withSelectedOptions:(id)a4
{
  id v6;

  v6 = a4;
  -[NTKCFaceDetailEditOptionCell setCollection:](self, "setCollection:", a3);
  -[NTKCFaceDetailEditOptionCell setSelectedOptions:](self, "setSelectedOptions:", v6);

  -[NTKCFaceDetailEditOptionCell _setupFromCollection](self, "_setupFromCollection");
  -[UICollectionView reloadData](self->_collectionView, "reloadData");
  return 0;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  char v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double MaxY;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  CGFloat v44;
  CGFloat v45;
  double v46;
  double Width;
  objc_super v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  v48.receiver = self;
  v48.super_class = (Class)NTKCFaceDetailEditOptionCell;
  -[NTKCDetailTableViewCell layoutSubviews](&v48, sel_layoutSubviews);
  -[NTKCFaceDetailEditOptionCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v49.origin.x = v5;
  v49.origin.y = v7;
  v49.size.width = v9;
  v49.size.height = v11;
  Width = CGRectGetWidth(v49);
  -[NTKCFaceDetailEditOptionCell separatorInset](self, "separatorInset");
  v46 = v12;
  -[UICollectionView frame](self->_collectionView, "frame");
  v44 = v14;
  v45 = v13;
  v16 = v15;
  v18 = v17;
  v19 = *MEMORY[0x1E0C9D538];
  v20 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v50.origin.x = v5;
  v50.origin.y = v7;
  v50.size.width = v9;
  v50.size.height = v11;
  v21 = CGRectGetWidth(v50);
  -[UICollectionViewFlowLayout itemSize](self->_layout, "itemSize");
  -[UICollectionView setFrame:](self->_collectionView, "setFrame:", v19, v20, v21, v22);
  -[UICollectionView contentInset](self->_collectionView, "contentInset");
  v24 = v23;
  v26 = v25;
  -[NTKCFaceDetailEditOptionCell separatorInset](self, "separatorInset");
  -[UICollectionView setContentInset:](self->_collectionView, "setContentInset:", v24, v27 + self->_outlinePadding * -0.5, v26, v27 + self->_outlinePadding * -0.5);
  if (self->_selectedIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NTKCFaceDetailEditOptionCell _indexPathForEditOptionIndex:](self, "_indexPathForEditOptionIndex:");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v51.origin.y = v44;
    v51.origin.x = v45;
    v51.size.width = v16;
    v51.size.height = v18;
    if (CGRectIsEmpty(v51)
      || (-[UICollectionView indexPathsForVisibleItems](self->_collectionView, "indexPathsForVisibleItems"),
          v29 = (void *)objc_claimAutoreleasedReturnValue(),
          v30 = objc_msgSend(v29, "containsObject:", v28),
          v29,
          (v30 & 1) == 0))
    {
      -[UICollectionView scrollToItemAtIndexPath:atScrollPosition:animated:](self->_collectionView, "scrollToItemAtIndexPath:atScrollPosition:animated:", v28, 16, 0, *(_QWORD *)&v44, *(_QWORD *)&v45);
    }

  }
  v31 = Width + v46 * -2.0;
  -[UILabel frame](self->_optionsDescription, "frame", *(_QWORD *)&v44, *(_QWORD *)&v45);
  v33 = v32;
  -[UILabel sizeThatFits:](self->_optionsDescription, "sizeThatFits:", v31, 1.79769313e308);
  v35 = v34;
  -[NTKCFaceDetailEditOptionCell separatorInset](self, "separatorInset");
  v37 = v36;
  -[UILabel setFrame:](self->_optionsDescription, "setFrame:", v36, v33, v31, v35);
  MaxY = CGRectGetMaxY(self->_swatchFrame);
  -[UILabel font](self->_optionsDescription, "font");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "_scaledValueForValue:", 60.0);
  v41 = MaxY + v40;
  -[UILabel _firstLineBaselineOffsetFromBoundsTop](self->_optionsDescription, "_firstLineBaselineOffsetFromBoundsTop");
  v43 = v41 - v42;

  -[UILabel setFrame:](self->_optionsDescription, "setFrame:", v37, v43, v31, v35);
}

- (double)_spacing
{
  double v3;

  objc_msgSend((id)objc_opt_class(), "insetSpacingForStyle:", -[NTKEditOptionCollection swatchStyle](self->_collection, "swatchStyle"));
  return v3 - self->_outlinePadding;
}

+ (double)insetSpacingForStyle:(int64_t)a3
{
  uint64_t v4;
  double result;

  v4 = NTKCScreenStyle();
  result = 20.0;
  if (v4 != 1)
  {
    result = 0.0;
    if ((unint64_t)a3 <= 4)
      return dbl_1B755D8B0[a3];
  }
  return result;
}

- (id)_dequeueCellForIndexPath:(id)a3
{
  UICollectionView *collectionView;
  id v5;
  void *v6;
  void *v7;

  collectionView = self->_collectionView;
  v5 = a3;
  +[_NTKCFaceDetailCollectionCell reuseIdentifier](_NTKCFaceDetailCollectionCell, "reuseIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView dequeueReusableCellWithReuseIdentifier:forIndexPath:](collectionView, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NTKCFaceDetailEditOptionCell _setupCell:](self, "_setupCell:", v7);
  return v7;
}

- (void)_setupCell:(id)a3
{
  double x;
  double y;
  double width;
  double height;
  id v8;

  x = self->_swatchFrame.origin.x;
  y = self->_swatchFrame.origin.y;
  width = self->_swatchFrame.size.width;
  height = self->_swatchFrame.size.height;
  v8 = a3;
  objc_msgSend(v8, "setSwatchFrame:", x, y, width, height);
  objc_msgSend(v8, "setOutlineOutset:", self->_outlineOutset);

}

- (id)_imageForIndexPath:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  id WeakRetained;
  void *v9;
  void *v10;
  int64_t v11;
  NSDictionary *selectedOptions;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;

  v4 = a3;
  v5 = -[NTKCFaceDetailEditOptionCell _editOptionIndexForIndexPath:](self, "_editOptionIndexForIndexPath:", v4);
  -[NTKEditOptionCollection options](self->_collection, "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v5 >= v7)
  {
    v13 = 0;
  }
  else
  {
    objc_initWeak(&location, self);
    WeakRetained = objc_loadWeakRetained((id *)&self->_faceView);
    -[NTKEditOptionCollection options](self->_collection, "options");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NTKEditOptionCollection mode](self->_collection, "mode");
    selectedOptions = self->_selectedOptions;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __51__NTKCFaceDetailEditOptionCell__imageForIndexPath___block_invoke;
    v15[3] = &unk_1E6BCF6D8;
    objc_copyWeak(&v17, &location);
    v16 = v4;
    objc_msgSend(WeakRetained, "swatchImageForEditOption:mode:withSelectedOptions:refreshHandler:", v10, v11, selectedOptions, v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v13;
}

void __51__NTKCFaceDetailEditOptionCell__imageForIndexPath___block_invoke(uint64_t a1)
{
  void (**v2)(_QWORD);
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t);
  void *v6;
  id v7;
  id v8;

  v3 = MEMORY[0x1E0C809B0];
  v4 = 3221225472;
  v5 = __51__NTKCFaceDetailEditOptionCell__imageForIndexPath___block_invoke_2;
  v6 = &unk_1E6BCF6D8;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v7 = *(id *)(a1 + 32);
  v2 = (void (**)(_QWORD))_Block_copy(&v3);
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", v3, v4, v5, v6))
    v2[2](v2);
  else
    dispatch_async(MEMORY[0x1E0C80D38], v2);

  objc_destroyWeak(&v8);
}

void __51__NTKCFaceDetailEditOptionCell__imageForIndexPath___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (void *)*((_QWORD *)WeakRetained + 141);
    v6[0] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reloadItemsAtIndexPaths:", v5);

  }
}

- (int64_t)_swatchImageContentMode
{
  id WeakRetained;
  int64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_faceView);
  v3 = objc_msgSend(WeakRetained, "swatchImageContentMode");

  return v3;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[NTKEditOptionCollection options](self->_collection, "options", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a4;
  -[NTKCFaceDetailEditOptionCell _dequeueCellForIndexPath:](self, "_dequeueCellForIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NTKCFaceDetailEditOptionCell _editOptionIndexForIndexPath:](self, "_editOptionIndexForIndexPath:", v5);

  -[NTKEditOptionCollection options](self->_collection, "options");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[NTKEditOptionCollection collectionType](self->_collection, "collectionType") != 1)
  {
    objc_msgSend(v9, "localizedName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedUppercaseString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v11);

  }
  objc_msgSend(v6, "setStyle:", objc_msgSend(v9, "swatchStyle"));

  return v6;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7;
  void *v8;
  id v9;

  v7 = a5;
  v9 = a4;
  objc_msgSend(v9, "setActive:animated:", self->_selectedIndex == -[NTKCFaceDetailEditOptionCell _editOptionIndexForIndexPath:](self, "_editOptionIndexForIndexPath:", v7), 0);
  objc_msgSend(v9, "setDisabled:", self->_disabled);
  -[NTKCFaceDetailEditOptionCell _imageForIndexPath:](self, "_imageForIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setImage:", v8);
  objc_msgSend(v9, "setSwatchImageContentMode:", -[NTKCFaceDetailEditOptionCell _swatchImageContentMode](self, "_swatchImageContentMode"));

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;
  int64_t v6;
  int64_t v7;
  void *v8;
  id v9;

  v5 = a4;
  if (!self->_disabled)
  {
    v9 = v5;
    v6 = -[NTKCFaceDetailEditOptionCell _editOptionIndexForIndexPath:](self, "_editOptionIndexForIndexPath:", v5);
    v5 = v9;
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = v6;
      -[NTKCFaceDetailEditOptionCell delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "editOptionCell:didSelectOptionAtIndex:", self, v7);

      -[NTKCFaceDetailEditOptionCell _ensureIndexPathVisible:animated:](self, "_ensureIndexPathVisible:animated:", v9, 1);
      v5 = v9;
    }
  }

}

- (void)_fontSizeDidChange
{
  void *v3;
  void *v4;
  void *v5;

  if (self->_optionsDescription)
  {
    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4B08]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fontDescriptorWithSymbolicTraits:", 0x8000);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v4, 0.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_optionsDescription, "setFont:", v5);

  }
  -[NTKCFaceDetailEditOptionCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)scrollToIndex:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  UICollectionView *collectionView;
  id v6;

  v4 = a4;
  collectionView = self->_collectionView;
  -[NTKCFaceDetailEditOptionCell _indexPathForEditOptionIndex:](self, "_indexPathForEditOptionIndex:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[UICollectionView scrollToItemAtIndexPath:atScrollPosition:animated:](collectionView, "scrollToItemAtIndexPath:atScrollPosition:animated:", v6, 16, v4);

}

- (void)scrollToSelectedOption:(BOOL)a3
{
  -[NTKCFaceDetailEditOptionCell scrollToIndex:animated:](self, "scrollToIndex:animated:", self->_selectedIndex, a3);
}

- (void)_ensureIndexPathVisible:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double MaxX;
  double v34;
  double v35;
  double v36;
  double v37;
  double MinX;
  double v39;
  double v40;
  double v41;
  double v42;
  CGFloat rect;
  CGFloat rect_8;
  id rect_16;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;

  v4 = a4;
  rect_16 = a3;
  -[UICollectionView layoutAttributesForItemAtIndexPath:](self->_collectionView, "layoutAttributesForItemAtIndexPath:", rect_16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = objc_msgSend(rect_16, "item");
  if (v15
    && v15 != -[UICollectionView numberOfItemsInSection:](self->_collectionView, "numberOfItemsInSection:", objc_msgSend(rect_16, "section"))- 1)
  {
    -[UICollectionView bounds](self->_collectionView, "bounds");
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    -[UICollectionView contentInset](self->_collectionView, "contentInset");
    v24 = v10;
    v26 = v17 + v25;
    v28 = v19 + v27;
    v30 = v21 - (v25 + v29);
    v32 = v23 - (v27 + v31);
    v46.origin.x = v8;
    rect_8 = v24;
    v46.origin.y = v24;
    v46.size.width = v12;
    v46.size.height = v14;
    MaxX = CGRectGetMaxX(v46);
    rect = v26;
    v47.origin.x = v26;
    v47.origin.y = v28;
    v47.size.width = v30;
    v47.size.height = v32;
    if (MaxX <= CGRectGetMaxX(v47))
    {
      v48.origin.x = v8;
      v10 = rect_8;
      v48.origin.y = rect_8;
      v48.size.width = v12;
      v48.size.height = v14;
      MinX = CGRectGetMinX(v48);
      v49.origin.x = rect;
      v49.origin.y = v28;
      v49.size.width = v30;
      v49.size.height = v32;
      if (MinX < CGRectGetMinX(v49))
      {
        -[UICollectionView contentInset](self->_collectionView, "contentInset");
        v40 = v39;
        v41 = self->_outlinePadding * 0.5;
        -[NTKCFaceDetailEditOptionCell _spacing](self, "_spacing");
        v8 = v8 + v40 - (v41 + v42);
      }
    }
    else
    {
      -[UICollectionView contentInset](self->_collectionView, "contentInset");
      v35 = v34;
      v36 = self->_outlinePadding * 0.5;
      -[NTKCFaceDetailEditOptionCell _spacing](self, "_spacing");
      v8 = v8 - (v35 - (v36 + v37));
      v10 = rect_8;
    }
  }
  -[UICollectionView scrollRectToVisible:animated:](self->_collectionView, "scrollRectToVisible:animated:", v4, v8, v10, v12, v14);

}

- (void)ensureIndexVisible:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[NTKCFaceDetailEditOptionCell _indexPathForEditOptionIndex:](self, "_indexPathForEditOptionIndex:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[NTKCFaceDetailEditOptionCell _ensureIndexPathVisible:animated:](self, "_ensureIndexPathVisible:animated:", v6, v4);

}

- (void)ensureSelectedOptionVisible:(BOOL)a3
{
  -[NTKCFaceDetailEditOptionCell ensureIndexVisible:animated:](self, "ensureIndexVisible:animated:", self->_selectedIndex, a3);
}

- (NTKEditOptionCollection)collection
{
  return self->_collection;
}

- (void)setCollection:(id)a3
{
  objc_storeStrong((id *)&self->_collection, a3);
}

- (NTKFaceView)faceView
{
  return (NTKFaceView *)objc_loadWeakRetained((id *)&self->_faceView);
}

- (void)setFaceView:(id)a3
{
  objc_storeWeak((id *)&self->_faceView, a3);
}

- (NTKFace)face
{
  return (NTKFace *)objc_loadWeakRetained((id *)&self->_face);
}

- (void)setFace:(id)a3
{
  objc_storeWeak((id *)&self->_face, a3);
}

- (NSDictionary)selectedOptions
{
  return self->_selectedOptions;
}

- (NSDictionary)selectedSlotOptions
{
  return self->_selectedSlotOptions;
}

- (void)setSelectedSlotOptions:(id)a3
{
  objc_storeStrong((id *)&self->_selectedSlotOptions, a3);
}

- (NTKCFaceDetailEditOptionCellDelegate)delegate
{
  return (NTKCFaceDetailEditOptionCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)disabled
{
  return self->_disabled;
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (UICollectionViewFlowLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
  objc_storeStrong((id *)&self->_layout, a3);
}

- (UILabel)optionsDescription
{
  return self->_optionsDescription;
}

- (void)setOptionsDescription:(id)a3
{
  objc_storeStrong((id *)&self->_optionsDescription, a3);
}

- (CGRect)swatchFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_swatchFrame.origin.x;
  y = self->_swatchFrame.origin.y;
  width = self->_swatchFrame.size.width;
  height = self->_swatchFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionsDescription, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedSlotOptions, 0);
  objc_storeStrong((id *)&self->_selectedOptions, 0);
  objc_destroyWeak((id *)&self->_face);
  objc_destroyWeak((id *)&self->_faceView);
  objc_storeStrong((id *)&self->_collection, 0);
}

@end
