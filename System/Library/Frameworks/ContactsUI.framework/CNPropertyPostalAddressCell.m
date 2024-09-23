@implementation CNPropertyPostalAddressCell

- (id)variableConstraints
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  objc_super v44;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v44.receiver = self;
  v44.super_class = (Class)CNPropertyPostalAddressCell;
  -[CNPropertySimpleTransportCell variableConstraints](&v44, sel_variableConstraints);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory");
  -[CNPropertyPostalAddressCell mapImageView](self, "mapImageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB3718];
    -[CNPropertyPostalAddressCell mapImageView](self, "mapImageView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPropertyPostalAddressCell contentView](self, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 1.0;
    if (v6)
    {
      objc_msgSend(v9, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v10, 4, 0, v11, 16, 1.0, 0.0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v13);

      v14 = (void *)MEMORY[0x1E0CB3718];
      -[CNPropertySimpleCell valueLabel](self, "valueLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNPropertyPostalAddressCell mapImageView](self, "mapImageView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 1.0;
      v15 = -16.0;
      v16 = v14;
      v17 = v10;
      v18 = 4;
    }
    else
    {
      v15 = 13.0;
      v16 = v9;
      v17 = v10;
      v18 = 3;
    }
    objc_msgSend(v16, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v17, v18, 0, v11, 3, v12, v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v19);

    v20 = (void *)MEMORY[0x1E0CB3718];
    -[CNPropertyPostalAddressCell mapImageView](self, "mapImageView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v21, 8, 0, 0, 0, 1.0, 91.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v22);

    v23 = (void *)MEMORY[0x1E0CB3718];
    -[CNPropertyPostalAddressCell contentView](self, "contentView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v24, 8, 1, 0, 0, 1.0, 117.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v26) = 1148846080;
    objc_msgSend(v25, "setPriority:", v26);
    objc_msgSend(v5, "addObject:", v25);
    v27 = (void *)MEMORY[0x1E0CB3718];
    -[CNPropertyPostalAddressCell mapImageView](self, "mapImageView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPropertyPostalAddressCell contentView](self, "contentView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 1.0;
    v31 = 0.0;
    v32 = v27;
    v33 = v28;
    if (v6)
    {
      v34 = 5;
      v35 = v29;
      v36 = 17;
    }
    else
    {
      objc_msgSend(v27, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v28, 6, 0, v29, 18, 1.0, 0.0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v37);

      v38 = (void *)MEMORY[0x1E0CB3718];
      -[CNPropertySimpleCell valueLabel](self, "valueLabel");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNPropertyPostalAddressCell mapImageView](self, "mapImageView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 1.0;
      v31 = -16.0;
      v32 = v38;
      v33 = v28;
      v34 = 6;
      v35 = v29;
      v36 = 5;
    }
    objc_msgSend(v32, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v33, v34, 0, v35, v36, v30, v31);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v39);

    v40 = (void *)MEMORY[0x1E0CB3718];
    -[CNPropertyPostalAddressCell mapImageView](self, "mapImageView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v41, 7, 0, 0, 0, 1.0, 91.0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v42);

  }
  return v5;
}

- (void)setMapImage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
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
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  id v27;

  v4 = a3;
  -[CNPropertyPostalAddressCell mapImageView](self, "mapImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0DC3F10];
    -[CNPropertyPostalAddressCell mapImageView](self, "mapImageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __43__CNPropertyPostalAddressCell_setMapImage___block_invoke;
    v26[3] = &unk_1E2050400;
    v26[4] = self;
    v27 = v4;
    objc_msgSend(v6, "transitionWithView:duration:options:animations:completion:", v7, 5242880, v26, 0, 0.2);

  }
  else
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v4);
    -[CNPropertyPostalAddressCell setMapImageView:](self, "setMapImageView:", v8);

    -[CNPropertyPostalAddressCell mapImageView](self, "mapImageView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[CNPropertyPostalAddressCell mapImageView](self, "mapImageView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setClipsToBounds:", 1);

    -[CNPropertyPostalAddressCell mapImageView](self, "mapImageView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setUserInteractionEnabled:", 1);

    -[CNPropertyPostalAddressCell mapImageView](self, "mapImageView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setExclusiveTouch:", 1);

    -[CNPropertyPostalAddressCell mapImageView](self, "mapImageView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCornerRadius:", 3.0);

    -[CNPropertyPostalAddressCell mapImageView](self, "mapImageView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setBorderWidth:", 1.0);

    +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "transportBorderColor");
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v19 = objc_msgSend(v18, "CGColor");
    -[CNPropertyPostalAddressCell mapImageView](self, "mapImageView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setBorderColor:", v19);

    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_tapGesture_);
    objc_msgSend(v22, "setCancelsTouchesInView:", 1);
    -[CNPropertyPostalAddressCell mapImageView](self, "mapImageView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addGestureRecognizer:", v22);

    -[CNPropertyPostalAddressCell contentView](self, "contentView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPropertyPostalAddressCell mapImageView](self, "mapImageView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addSubview:", v25);

    -[CNPropertyPostalAddressCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }

}

- (UIImageView)mapImageView
{
  return self->_mapImageView;
}

- (void)setMapImageView:(id)a3
{
  objc_storeStrong((id *)&self->_mapImageView, a3);
}

- (CNPropertyPostalAddressCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CNPropertyPostalAddressCell *v4;
  CNPropertyPostalAddressCell *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CNPropertyPostalAddressCell;
  v4 = -[CNPropertySimpleTransportCell initWithStyle:reuseIdentifier:](&v8, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[CNPropertySimpleCell valueLabel](v4, "valueLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNumberOfLines:", 0);

  }
  return v5;
}

- (BOOL)supportsTintColorValue
{
  return 0;
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNPropertyPostalAddressCell;
  -[CNPropertySimpleTransportCell prepareForReuse](&v4, sel_prepareForReuse);
  -[CNPropertyPostalAddressCell tileGeneratorToken](self, "tileGeneratorToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[CNPropertyPostalAddressCell setTileGeneratorToken:](self, "setTileGeneratorToken:", 0);
  -[CNPropertyPostalAddressCell setShouldUseMapTiles:](self, "setShouldUseMapTiles:", 0);
}

- (void)setShouldUseMapTiles:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (self->_shouldUseMapTiles != a3)
  {
    if (a3)
    {
      -[CNPropertyPostalAddressCell generateAndSetMapTile](self, "generateAndSetMapTile");
    }
    else
    {
      -[CNPropertyPostalAddressCell mapImageView](self, "mapImageView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        -[CNPropertyPostalAddressCell tileGeneratorToken](self, "tileGeneratorToken");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "cancel");

        -[CNPropertyPostalAddressCell setTileGeneratorToken:](self, "setTileGeneratorToken:", 0);
        -[CNPropertyPostalAddressCell mapImageView](self, "mapImageView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "removeFromSuperview");

        -[CNPropertyPostalAddressCell setMapImageView:](self, "setMapImageView:", 0);
        -[CNPropertyPostalAddressCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
      }
    }
    -[CNPropertyCell delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "propertyCellDidChangeLayout:", self);

  }
  self->_shouldUseMapTiles = a3;
}

- (void)generateAndSetMapTile
{
  void *v3;
  void *v4;
  void *v5;
  CNUIMapTileGenerator *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id location;

  -[CNPropertyCell propertyItem](self, "propertyItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "labeledValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc_init(CNUIMapTileGenerator);
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0D13B68], "mainThreadScheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIMapTileGenerator tilesForAddress:](v6, "tilesForAddress:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "observeOn:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0D13AF0];
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __52__CNPropertyPostalAddressCell_generateAndSetMapTile__block_invoke;
  v16 = &unk_1E204CFE0;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v10, "observerWithResultBlock:", &v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "subscribe:", v11, v13, v14, v15, v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertyPostalAddressCell setTileGeneratorToken:](self, "setTileGeneratorToken:", v12);

  -[CNPropertyPostalAddressCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  objc_destroyWeak(&v17);

  objc_destroyWeak(&location);
}

- (void)setTileGeneratorToken:(id)a3
{
  objc_storeStrong((id *)&self->_tileGeneratorToken, a3);
}

- (CNCancelable)tileGeneratorToken
{
  return self->_tileGeneratorToken;
}

void __52__CNPropertyPostalAddressCell_generateAndSetMapTile__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  (*(void (**)(void))(*MEMORY[0x1E0D13880] + 16))();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "setMapImage:", v4);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CNPropertyPostalAddressCell;
  v4 = a3;
  -[CNPropertyPostalAddressCell traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  v5 = objc_msgSend(v4, "userInterfaceStyle", v8.receiver, v8.super_class);

  -[CNPropertyPostalAddressCell traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceStyle");

  if (v5 != v7)
  {
    if (-[CNPropertyPostalAddressCell shouldUseMapTiles](self, "shouldUseMapTiles"))
      -[CNPropertyPostalAddressCell generateAndSetMapTile](self, "generateAndSetMapTile");
  }
}

- (void)setProperty:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CNPropertyPostalAddressCell;
  v4 = a3;
  -[CNPropertyCell setProperty:](&v9, sel_setProperty_, v4);
  v5 = (void *)MEMORY[0x1E0C973B0];
  objc_msgSend(v4, "value", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringFromPostalAddress:style:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertySimpleCell valueView](self, "valueView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAb_text:", v7);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[CNPropertyPostalAddressCell setMapImageView:](self, "setMapImageView:", 0);
  -[CNPropertyPostalAddressCell tileGeneratorToken](self, "tileGeneratorToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  v4.receiver = self;
  v4.super_class = (Class)CNPropertyPostalAddressCell;
  -[CNPropertySimpleTransportCell dealloc](&v4, sel_dealloc);
}

- (BOOL)shouldUseMapTiles
{
  return self->_shouldUseMapTiles;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tileGeneratorToken, 0);
  objc_storeStrong((id *)&self->_mapImageView, 0);
}

void __43__CNPropertyPostalAddressCell_setMapImage___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "mapImageView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setImage:", v1);

}

@end
