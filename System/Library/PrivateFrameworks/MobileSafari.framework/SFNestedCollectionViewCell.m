@implementation SFNestedCollectionViewCell

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  void *v4;
  UICollectionView *collectionView;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  double v13;
  void *v14;
  double v15;
  objc_super v17;
  CGRect v18;

  v17.receiver = self;
  v17.super_class = (Class)SFNestedCollectionViewCell;
  -[SFNestedCollectionViewCell preferredLayoutAttributesFittingAttributes:](&v17, sel_preferredLayoutAttributesFittingAttributes_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  collectionView = self->_collectionView;
  if (collectionView)
  {
    -[UICollectionView superview](collectionView, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6
      || (-[SFNestedCollectionViewCell contentView](self, "contentView"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v7,
          v6 == v7))
    {
      -[SFNestedCollectionViewCell _setUpCollectionViewIfNeeded](self, "_setUpCollectionViewIfNeeded");
      objc_msgSend(v4, "size");
      v9 = v8;
      v11 = v10;
      v12 = 11;
      do
      {
        v13 = v11;
        -[SFNestedCollectionViewCell contentView](self, "contentView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "bounds");
        -[UICollectionView setFrame:](self->_collectionView, "setFrame:", 0.0, 0.0, CGRectGetWidth(v18), v11);

        -[UICollectionView layoutIfNeeded](self->_collectionView, "layoutIfNeeded");
        -[UICollectionView contentSize](self->_collectionView, "contentSize");
        v11 = fmax(v15, 60.0);
        if (_SFEqualWithEpsilon(v11, v13, 0.01))
          break;
        v13 = v11;
        --v12;
      }
      while (v12);
      objc_msgSend(v4, "setSize:", v9, v13);
    }

  }
  return v4;
}

- (void)_setUpCollectionViewIfNeeded
{
  void *v3;
  UICollectionView *collectionView;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[SFNestedCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  collectionView = self->_collectionView;
  if (collectionView)
  {
    v9 = v3;
    -[UICollectionView superview](collectionView, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = v9;
    if (v5 != v9)
    {
      -[UICollectionView superview](self->_collectionView, "superview");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
        -[UICollectionView removeFromSuperview](self->_collectionView, "removeFromSuperview");
      -[UICollectionView setAutoresizingMask:](self->_collectionView, "setAutoresizingMask:", 0);
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UICollectionView setBackgroundColor:](self->_collectionView, "setBackgroundColor:", v7);

      objc_msgSend(v9, "bounds");
      -[UICollectionView setFrame:](self->_collectionView, "setFrame:");
      -[UICollectionView setScrollEnabled:](self->_collectionView, "setScrollEnabled:", 0);
      -[UICollectionView setScrollsToTop:](self->_collectionView, "setScrollsToTop:", 0);
      objc_msgSend(v9, "addSubview:", self->_collectionView);
      objc_msgSend(MEMORY[0x1E0DC34D8], "_listInsetGroupedCellConfiguration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFNestedCollectionViewCell setBackgroundConfiguration:](self, "setBackgroundConfiguration:", v8);

      v3 = v9;
    }
  }

}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end
