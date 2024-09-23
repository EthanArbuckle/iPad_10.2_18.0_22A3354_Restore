@implementation MFModernLabelledAtomList

- (void)dealloc
{
  void *v3;
  void *addressBook;
  objc_super v5;

  -[MFModernLabelledAtomList setAddressAtomTarget:action:](self, "setAddressAtomTarget:action:", 0, 0);
  -[NSMutableArray makeObjectsPerformSelector:withObject:](self->_addressAtoms, "makeObjectsPerformSelector:withObject:", sel_setDelegate_, 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  addressBook = self->_addressBook;
  if (addressBook)
    CFRelease(addressBook);
  v5.receiver = self;
  v5.super_class = (Class)MFModernLabelledAtomList;
  -[MFModernLabelledAtomList dealloc](&v5, sel_dealloc);
}

- (MFModernLabelledAtomList)initWithLabel:(id)a3 title:(id)a4 addressBook:(void *)a5
{
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  MFModernLabelledAtomList *v15;
  uint64_t v16;
  UIColor *labelTextColor;
  uint64_t v18;
  UILabel *label;
  UILabel *v20;
  void *v21;
  uint64_t v22;
  NSString *title;
  NSMutableArray *v24;
  NSMutableArray *addressAtoms;
  uint64_t v26;
  UILabel *lastBaselineDeceptionLabel;
  double v28;
  double v29;
  void *v30;
  void *v32;
  objc_super v33;

  v9 = a3;
  v10 = a4;
  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFModernLabelledAtomList.m"), 70, CFSTR("Current thread must be main"));

  }
  v33.receiver = self;
  v33.super_class = (Class)MFModernLabelledAtomList;
  v11 = *MEMORY[0x1E0C9D648];
  v12 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v13 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v14 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v15 = -[MFModernLabelledAtomList initWithFrame:](&v33, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v12, v13, v14);
  if (v15)
  {
    if (a5)
      v15->_addressBook = (void *)CFRetain(a5);
    -[MFModernLabelledAtomList setTranslatesAutoresizingMaskIntoConstraints:](v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MFModernLabelledAtomList setOpaque:](v15, "setOpaque:", 1);
    -[MFModernLabelledAtomList setAutoresizesSubviews:](v15, "setAutoresizesSubviews:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "mailModernLabelledAtomDefaultTextColor");
    v16 = objc_claimAutoreleasedReturnValue();
    labelTextColor = v15->_labelTextColor;
    v15->_labelTextColor = (UIColor *)v16;

    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v11, v12, v13, v14);
    label = v15->_label;
    v15->_label = (UILabel *)v18;

    -[UILabel setText:](v15->_label, "setText:", v9);
    -[UILabel setTextColor:](v15->_label, "setTextColor:", v15->_labelTextColor);
    -[MFModernLabelledAtomList addSubview:](v15, "addSubview:", v15->_label);
    v15->_labelVisible = 1;
    v20 = v15->_label;
    +[MFModernLabelledAtomList defaultLabelFont](MFModernLabelledAtomList, "defaultLabelFont");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v20, "setFont:", v21);

    -[UILabel setAdjustsFontForContentSizeCategory:](v15->_label, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel sizeToFit](v15->_label, "sizeToFit");
    v22 = objc_msgSend(v10, "copy");
    title = v15->_title;
    v15->_title = (NSString *)v22;

    v24 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    addressAtoms = v15->_addressAtoms;
    v15->_addressAtoms = v24;

    v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v11, v12, v13, v14);
    lastBaselineDeceptionLabel = v15->_lastBaselineDeceptionLabel;
    v15->_lastBaselineDeceptionLabel = (UILabel *)v26;

    -[UILabel setHidden:](v15->_lastBaselineDeceptionLabel, "setHidden:", 1);
    -[UILabel setText:](v15->_lastBaselineDeceptionLabel, "setText:", CFSTR(" "));
    -[UILabel sizeToFit](v15->_lastBaselineDeceptionLabel, "sizeToFit");
    -[MFModernLabelledAtomList addSubview:](v15, "addSubview:", v15->_lastBaselineDeceptionLabel);
    LODWORD(v28) = 1148846080;
    -[MFModernLabelledAtomList setContentHuggingPriority:forAxis:](v15, "setContentHuggingPriority:forAxis:", 1, v28);
    LODWORD(v29) = 1148846080;
    -[MFModernLabelledAtomList setContentCompressionResistancePriority:forAxis:](v15, "setContentCompressionResistancePriority:forAxis:", 1, v29);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObserver:selector:name:object:", v15, sel_contentSizeCategoryDidChangeNotification_, *MEMORY[0x1E0DC48E8], 0);

  }
  -[MFModernLabelledAtomList setAccessibilityIdentifier:](v15, "setAccessibilityIdentifier:", *MEMORY[0x1E0D46B50]);

  return v15;
}

- (void)_updateLastAddressAtomIfNecessary
{
  int v3;
  id v4;
  id v5;

  -[NSMutableArray lastObject](self->_addressAtoms, "lastObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "separatorStyle");

  if (!v3)
  {
    -[NSMutableArray lastObject](self->_addressAtoms, "lastObject");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSeparatorStyle:", 2);

  }
}

- (void)setAddresses:(id)a3 withCompletion:(id)a4
{
  void (**v6)(id, MFModernLabelledAtomList *);
  unint64_t v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  NSMutableArray *addressAtoms;
  id v13;
  void *addressBook;
  MFModernAddressAtom *v15;
  void *v16;
  MFModernAddressAtom *v17;
  _BOOL8 v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, uint64_t);
  void *v23;
  id v24;

  v19 = a3;
  v6 = (void (**)(id, MFModernLabelledAtomList *))a4;
  if (!-[NSArray isEqualToArray:](self->_addresses, "isEqualToArray:", v19))
  {
    -[MFModernLabelledAtomList setAddresses:](self, "setAddresses:", v19);
    v7 = objc_msgSend(v19, "count");
    -[MFModernLabelledAtomList addressAtoms](self, "addressAtoms");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9 > v7)
    {
      v10 = v9;
      do
      {
        -[NSMutableArray lastObject](self->_addressAtoms, "lastObject", v19);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removeFromSuperview");
        -[NSMutableArray removeObject:](self->_addressAtoms, "removeObject:", v11);

        --v10;
      }
      while (v10 > v7);
    }
    addressAtoms = self->_addressAtoms;
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __56__MFModernLabelledAtomList_setAddresses_withCompletion___block_invoke;
    v23 = &unk_1E5A69820;
    v13 = v19;
    v24 = v13;
    -[NSMutableArray enumerateObjectsUsingBlock:](addressAtoms, "enumerateObjectsUsingBlock:", &v20);
    if (v9 < v7)
    {
      if (v7 > 0x63)
        addressBook = 0;
      else
        addressBook = self->_addressBook;
      do
      {
        v15 = [MFModernAddressAtom alloc];
        objc_msgSend(v13, "objectAtIndexedSubscript:", v9);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[MFModernAddressAtom initWithAddress:presentationOptions:isPhoneNumber:maxWidth:addressBook:](v15, "initWithAddress:presentationOptions:isPhoneNumber:maxWidth:addressBook:", v16, 0, 0, addressBook, 0.0);

        if (-[MFModernLabelledAtomList isPrimary](self, "isPrimary"))
          v18 = -[MFModernLabelledAtomList isLabelVisible](self, "isLabelVisible");
        else
          v18 = 1;
        -[MFModernAddressAtom setEnabled:](v17, "setEnabled:", v18, v19, v20, v21, v22, v23);
        -[MFModernAddressAtom setDelegate:](v17, "setDelegate:", self);
        -[NSMutableArray addObject:](self->_addressAtoms, "addObject:", v17);
        -[MFModernLabelledAtomList addSubview:](self, "addSubview:", v17);

        ++v9;
      }
      while (v7 != v9);
      -[MFModernLabelledAtomList _updateLastAddressAtomIfNecessary](self, "_updateLastAddressAtomIfNecessary");
    }
    if (v6)
      v6[2](v6, self);
    -[MFModernLabelledAtomList _reflow](self, "_reflow", v19);

  }
}

void __56__MFModernLabelledAtomList_setAddresses_withCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAddress:", v5);

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[MFModernLabelledAtomList bounds](self, "bounds");
  v3 = v2;
  v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (void)addressBookDidChange:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_addressAtoms;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "addressBookDidChange:", v4, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

+ (id)defaultLabelFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
}

+ (id)primaryLabelFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
}

+ (double)atomLineHeight
{
  return 25.0;
}

+ (double)spaceBetweenColonAndFirstAtomNaturalEdge
{
  return 5.0;
}

- (void)layoutSubviews
{
  CGFloat Width;
  double v4;
  objc_super v5;
  CGRect v6;

  v5.receiver = self;
  v5.super_class = (Class)MFModernLabelledAtomList;
  -[MFModernLabelledAtomList layoutSubviews](&v5, sel_layoutSubviews);
  -[MFModernLabelledAtomList frame](self, "frame");
  Width = CGRectGetWidth(v6);
  v4 = Width - self->_previousWidth;
  if (v4 < 0.0)
    v4 = -v4;
  if (v4 > 0.00000011920929)
  {
    self->_previousWidth = Width;
    -[MFModernLabelledAtomList _setNeedsReflow](self, "_setNeedsReflow");
  }
  -[MFModernLabelledAtomList _reflowIfNeeded](self, "_reflowIfNeeded");
}

- (void)_reflowIfNeeded
{
  if ((*((_BYTE *)self + 441) & 1) != 0)
    -[MFModernLabelledAtomList _reflow](self, "_reflow");
}

- (void)setPrimary:(BOOL)a3
{
  void *v5;
  id v6;

  if (self->_primary != a3)
  {
    self->_primary = a3;
    v5 = (void *)objc_opt_class();
    if (a3)
      objc_msgSend(v5, "primaryLabelFont");
    else
      objc_msgSend(v5, "defaultLabelFont");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_label, "setFont:", v6);
    -[UILabel sizeToFit](self->_label, "sizeToFit");

  }
}

- (void)setLabelTextColor:(id)a3
{
  UIColor *v5;

  v5 = (UIColor *)a3;
  if (self->_labelTextColor != v5)
  {
    objc_storeStrong((id *)&self->_labelTextColor, a3);
    -[UILabel setTextColor:](self->_label, "setTextColor:", v5);
  }

}

- (void)setLineSpacing:(double)a3
{
  if (self->_lineSpacing != a3)
  {
    self->_lineSpacing = a3;
    -[MFModernLabelledAtomList _setNeedsReflow](self, "_setNeedsReflow");
  }
}

- (void)enumerateAddressAtomsUsingBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[MFModernLabelledAtomList addressAtoms](self, "addressAtoms");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__MFModernLabelledAtomList_enumerateAddressAtomsUsingBlock___block_invoke;
  v7[3] = &unk_1E5A69848;
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

uint64_t __60__MFModernLabelledAtomList_enumerateAddressAtomsUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_setNeedsReflow
{
  if ((*((_BYTE *)self + 441) & 1) == 0)
  {
    *((_BYTE *)self + 441) |= 1u;
    -[MFModernLabelledAtomList setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_reflow
{
  uint64_t v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  double v14;
  double v15;
  id *v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  void *v20;
  NSString *v21;
  _BOOL4 IsAccessibilityCategory;
  double v23;
  double MaxX;
  double MaxY;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  id WeakRetained;
  double v50;
  double v51;
  double v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD v55[2];
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;

  v55[1] = *MEMORY[0x1E0C80C00];
  *((_BYTE *)self + 441) &= ~1u;
  if (-[NSMutableArray count](self->_addressAtoms, "count"))
  {
    v3 = -[MFModernLabelledAtomList effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
    v4 = 0.0;
    v50 = 0.0;
    if (-[MFModernLabelledAtomList isLabelVisible](self, "isLabelVisible"))
    {
      -[UILabel text](self->_label, "text");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = *MEMORY[0x1E0DC1138];
      -[UILabel font](self->_label, "font");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v55[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, &v54, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "boundingRectWithSize:options:attributes:context:", 1, v7, 0, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
      v9 = v8;

      objc_msgSend((id)objc_opt_class(), "spaceBetweenColonAndFirstAtomNaturalEdge");
      v50 = v9 + v10;
    }
    if (v3 == 1)
    {
      -[MFModernLabelledAtomList bounds](self, "bounds");
      v4 = CGRectGetWidth(v56) - v50;
    }
    v53 = 0;
    v11 = -[NSMutableArray count](self->_addressAtoms, "count");
    if (v11)
    {
      v12 = 0;
      v13 = 0;
      v14 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v51 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v52 = *MEMORY[0x1E0C9D648];
      v15 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      v16 = (id *)MEMORY[0x1E0DC4730];
      v17 = 0.0;
      v18 = v50;
      v19 = 0.0;
      do
      {
        -[NSMutableArray objectAtIndex:](self->_addressAtoms, "objectAtIndex:", v13);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          objc_msgSend(*v16, "preferredContentSizeCategory");
          v21 = (NSString *)objc_claimAutoreleasedReturnValue();
          IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v21);

          v23 = 0.0;
          if (IsAccessibilityCategory)
          {
            v23 = v50;
            if (!self->_labelVisible)
              v23 = 0.0;
          }
          objc_msgSend(v20, "setFirstLineIndent:", v23);
        }
        objc_msgSend(v20, "layoutIfNeeded");
        if (v12)
        {
          ++v53;
          v19 = v51;
          v4 = v52;
          v18 = v14;
          v17 = v15;
        }
        v57.origin.x = v4;
        v57.origin.y = v19;
        v57.size.width = v18;
        v57.size.height = v17;
        MaxX = CGRectGetMaxX(v57);
        v58.origin.x = v4;
        v58.origin.y = v19;
        v58.size.width = v18;
        v58.size.height = v17;
        MaxY = CGRectGetMaxY(v58);
        if (v3 == 1)
        {
          v59.origin.x = v4;
          v59.origin.y = v19;
          v59.size.width = v18;
          v59.size.height = v17;
          MaxX = CGRectGetMinX(v59);
        }
        -[MFModernLabelledAtomList bounds](self, "bounds");
        if (CGRectGetWidth(v60) > 0.0)
        {
          -[MFModernLabelledAtomList _frameForAtomAtIndex:withStartingPoint:row:](self, "_frameForAtomAtIndex:withStartingPoint:row:", v13, &v53, MaxX, MaxY);
          objc_msgSend(v20, "setFrame:");
          v12 = objc_msgSend(v20, "numberOfLines") > 1;
          objc_msgSend(v20, "frame");
          v4 = v26;
          v19 = v27;
          v29 = v28;
          v17 = v30;
          objc_msgSend(v20, "edgeInsets");
          v18 = v29 + v31;
        }

        ++v13;
      }
      while (v11 != v13);
    }
    -[MFModernLabelledAtomList baselinePointForRow:](self, "baselinePointForRow:", v53);
    v33 = v32;
    self->_numberOfRows = v53 + 1;
    -[MFModernLabelledAtomList frame](self, "frame");
    if (v34 != v33)
    {
      -[MFModernLabelledAtomList setFrame:](self, "setFrame:");
      -[MFModernLabelledAtomList invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    }
    if (v3 == 1)
    {
      -[UILabel frame](self->_label, "frame");
      v36 = v35;
      v38 = v37;
      v40 = v39;
      -[MFModernLabelledAtomList bounds](self, "bounds");
      -[UILabel setFrame:](self->_label, "setFrame:", v41 - v38, v36, v38, v40);
    }
    -[UILabel frame](self->_lastBaselineDeceptionLabel, "frame");
    v43 = v42;
    v45 = v44;
    v47 = v46;
    -[UILabel _firstBaselineOffsetFromTop](self->_lastBaselineDeceptionLabel, "_firstBaselineOffsetFromTop");
    -[UILabel setFrame:](self->_lastBaselineDeceptionLabel, "setFrame:", v43, v33 - v48, v45, v47);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "displayStringsDidChangeForLabelledAtomList:", self);

}

- (CGRect)_frameForAtomAtIndex:(unint64_t)a3 withStartingPoint:(CGPoint)a4 row:(unint64_t *)a5
{
  double x;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  NSString *v13;
  _BOOL4 IsAccessibilityCategory;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double Width;
  uint64_t v22;
  double v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  uint64_t v32;
  double v33;
  uint64_t v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect result;

  x = a4.x;
  -[NSMutableArray objectAtIndex:](self->_addressAtoms, "objectAtIndex:", a4.x, a4.y);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MFModernLabelledAtomList effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  -[MFModernLabelledAtomList baselinePointForRow:](self, "baselinePointForRow:", *a5);
  v12 = v11;
  if (!a3)
  {
    objc_msgSend((id)*MEMORY[0x1E0DC4730], "preferredContentSizeCategory");
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v13);

    if (IsAccessibilityCategory && self->_labelVisible)
    {
      -[MFModernLabelledAtomList _remainingSpaceForRowAtPoint:](self, "_remainingSpaceForRowAtPoint:", x, v12);
      if (v15 >= 1.0)
      {
        -[UILabel origin](self->_label, "origin");
        x = v17;
        -[UILabel bounds](self->_label, "bounds");
        objc_msgSend(v9, "setFirstLineIndent:", v18);
      }
      else
      {
        objc_msgSend(v9, "setFirstLineIndent:", 0.0);
        ++*a5;
        -[MFModernLabelledAtomList baselinePointForRow:](self, "baselinePointForRow:");
        v12 = v16;
        x = 0.0;
      }
    }
  }
  -[MFModernLabelledAtomList _remainingSpaceForRowAtPoint:](self, "_remainingSpaceForRowAtPoint:", x, v12);
  v20 = v19;
  -[MFModernLabelledAtomList bounds](self, "bounds");
  Width = CGRectGetWidth(v44);
  if (!a3)
    Width = v20;
  objc_msgSend(v9, "setMaxWidth:", Width);
  objc_msgSend(v9, "layoutIfNeeded");
  objc_msgSend(v9, "frame");
  v26 = v24;
  v27 = v25;
  if (v10 == 1)
    CGRectGetWidth(*(CGRect *)&v22);
  objc_msgSend(v9, "edgeInsets");
  UIRoundToViewScale();
  v29 = v28;
  objc_msgSend(v9, "baselinePoint");
  UIRoundToViewScale();
  v31 = v30;
  v32 = objc_msgSend(v9, "numberOfLines");
  if (a3
    && (-[MFModernLabelledAtomList lineSpacing](self, "lineSpacing"), v33 > 0.0)
    && (v45.origin.x = v29, v45.origin.y = v31, v45.size.width = v26, v45.size.height = v27, CGRectGetWidth(v45) > v20))
  {
    ++*a5;
    v34 = MEMORY[0x1E0C9D538];
    if (v10 == 1)
    {
      -[MFModernLabelledAtomList bounds](self, "bounds");
      v35 = CGRectGetWidth(v46);
    }
    else
    {
      v35 = *MEMORY[0x1E0C9D538];
    }
    -[MFModernLabelledAtomList _frameForAtomAtIndex:withStartingPoint:row:](self, "_frameForAtomAtIndex:withStartingPoint:row:", a3, a5, v35, *(double *)(v34 + 8));
    v29 = v36;
    v31 = v37;
    v26 = v38;
    v27 = v39;
  }
  else if (v32 >= 2)
  {
    *a5 = objc_msgSend(v9, "numberOfLines") + *a5 - 1;
  }

  v40 = v29;
  v41 = v31;
  v42 = v26;
  v43 = v27;
  result.size.height = v43;
  result.size.width = v42;
  result.origin.y = v41;
  result.origin.x = v40;
  return result;
}

- (double)_remainingSpaceForRowAtPoint:(CGPoint)a3
{
  double y;
  double x;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat width;
  CGFloat height;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  double v43;
  double v45;
  double v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;

  y = a3.y;
  x = a3.x;
  v52 = *MEMORY[0x1E0C80C00];
  v6 = -[MFModernLabelledAtomList effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  -[MFModernLabelledAtomList bounds](self, "bounds");
  v7 = CGRectGetWidth(v53) - x;
  -[MFModernLabelledAtomList baselinePointForRow:](self, "baselinePointForRow:", 0);
  v9 = v8;
  if (v6 == 1)
    v10 = x;
  else
    v10 = v7;
  v46 = v10;
  if (v6 == 1)
  {
    v11 = 0.0;
    v7 = x;
  }
  else
  {
    -[MFModernLabelledAtomList bounds](self, "bounds");
    v11 = CGRectGetWidth(v54) - v7;
  }
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  -[MFModernLabelledAtomList viewsToDodge](self, "viewsToDodge", *(_QWORD *)&x);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  if (v13)
  {
    v14 = y - v9;
    v15 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v48 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        objc_msgSend(v17, "frame");
        v19 = v18;
        v21 = v20;
        v23 = v22;
        v25 = v24;
        objc_msgSend(v17, "superview");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[MFModernLabelledAtomList convertRect:fromView:](self, "convertRect:fromView:", v26, v19, v21, v23, v25);
        v28 = v27;
        v30 = v29;
        v32 = v31;
        v34 = v33;

        v55.origin.x = v28;
        v55.origin.y = v30;
        v55.size.width = v32;
        v55.size.height = v34;
        v57.origin.x = v11;
        v57.origin.y = v14;
        v57.size.width = v7;
        v57.size.height = v9;
        v56 = CGRectIntersection(v55, v57);
        v35 = v56.origin.x;
        v36 = v56.origin.y;
        width = v56.size.width;
        height = v56.size.height;
        if (!CGRectIsEmpty(v56))
        {
          v39 = v35;
          v40 = v36;
          v41 = width;
          v42 = height;
          if (v6 == 1)
            v43 = v45 - CGRectGetMaxX(*(CGRect *)&v39);
          else
            v43 = CGRectGetMinX(*(CGRect *)&v39) - v45;
          v46 = v43;
        }
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    }
    while (v13);
  }

  return v46;
}

- (void)setAddressAtomTarget:(id)a3 action:(SEL)a4
{
  id v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = self->_addressAtoms;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v11, "removeTarget:action:forControlEvents:", 0, 0, 0xFFFFFFFFLL, (_QWORD)v12);
        if (v6)
          objc_msgSend(v11, "addTarget:action:forControlEvents:", v6, a4, 64);
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)setAddressAtomScale:(double)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = self->_addressAtoms;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "setScale:", a3, (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)setAddressAtomSeparatorStyle:(int)a3
{
  uint64_t v3;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v3 = *(_QWORD *)&a3;
  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_addressAtoms;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setSeparatorStyle:", v3, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  -[MFModernLabelledAtomList _updateLastAddressAtomIfNecessary](self, "_updateLastAddressAtomIfNecessary");
  -[MFModernLabelledAtomList _setNeedsReflow](self, "_setNeedsReflow");
}

- (void)setAddressAtomsArePrimary:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_addressAtoms;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setIsPrimaryAddressAtom:", v3, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  -[MFModernLabelledAtomList _setNeedsReflow](self, "_setNeedsReflow");
}

- (id)labelText
{
  return -[UILabel text](self->_label, "text");
}

- (CGRect)labelFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  if (-[MFModernLabelledAtomList isLabelVisible](self, "isLabelVisible"))
  {
    -[UILabel frame](self->_label, "frame");
  }
  else
  {
    v3 = *MEMORY[0x1E0C9D648];
    v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (BOOL)isLabelVisible
{
  return self->_labelVisible;
}

- (void)setLabelVisible:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  id v6;

  if (self->_labelVisible != a3)
  {
    v3 = a3;
    self->_labelVisible = a3;
    v5 = 0.0;
    if (a3)
      v5 = 1.0;
    -[UILabel setAlpha:](self->_label, "setAlpha:", v5);
    -[NSMutableArray firstObject](self->_addressAtoms, "firstObject");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEnabled:", v3);
    -[MFModernLabelledAtomList _setNeedsReflow](self, "_setNeedsReflow");

  }
}

- (id)title
{
  return self->_title;
}

- (id)atomDisplayStrings
{
  NSMutableArray **p_addressAtoms;
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  p_addressAtoms = &self->_addressAtoms;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMutableArray count](self->_addressAtoms, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = *p_addressAtoms;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "displayString", (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return v3;
}

- (id)addressAtoms
{
  return (id)-[NSMutableArray copy](self->_addressAtoms, "copy");
}

- (void)setAtomAlpha:(double)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = self->_addressAtoms;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "setAlpha:", a3, (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)setOpaque:(BOOL)a3
{
  _BOOL4 v3;
  UILabel *label;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MFModernLabelledAtomList;
  -[MFModernLabelledAtomList setOpaque:](&v7, sel_setOpaque_);
  label = self->_label;
  if (v3)
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setBackgroundColor:](label, "setBackgroundColor:", v6);

}

- (id)passthroughViews
{
  return (id)-[NSMutableArray copy](self->_addressAtoms, "copy");
}

- (void)crossFadeLabelVisibility:(BOOL)a3 atomSeparatorStyle:(int)a4 withAnimationCoordinator:(id)a5
{
  id v8;
  void *v9;
  __int128 v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD v19[8];
  BOOL v20;
  _QWORD v21[4];
  id v22;
  MFModernLabelledAtomList *v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD *v27;
  int v28;
  BOOL v29;
  _QWORD v30[5];
  id v31;
  _QWORD v32[5];
  id v33;
  _QWORD v34[4];
  __int128 v35;
  __int128 v36;
  _QWORD v37[4];
  __int128 v38;
  __int128 v39;

  v8 = a5;
  if (-[NSMutableArray count](self->_addressAtoms, "count"))
  {
    -[NSMutableArray objectAtIndex:](self->_addressAtoms, "objectAtIndex:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x4010000000;
    v37[3] = "";
    *(_QWORD *)&v10 = -1;
    *((_QWORD *)&v10 + 1) = -1;
    v38 = v10;
    v39 = v10;
    v34[0] = 0;
    v34[1] = v34;
    v34[2] = 0x4010000000;
    v34[3] = "";
    v35 = v10;
    v36 = v10;
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x3032000000;
    v32[3] = __Block_byref_object_copy__8;
    v32[4] = __Block_byref_object_dispose__8;
    v33 = 0;
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x3032000000;
    v30[3] = __Block_byref_object_copy__8;
    v30[4] = __Block_byref_object_dispose__8;
    v31 = 0;
    v11 = MEMORY[0x1E0C809B0];
    v12 = (void *)MEMORY[0x1E0DC3F10];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __97__MFModernLabelledAtomList_crossFadeLabelVisibility_atomSeparatorStyle_withAnimationCoordinator___block_invoke;
    v21[3] = &unk_1E5A69870;
    v24 = v34;
    v13 = v9;
    v22 = v13;
    v23 = self;
    v29 = a3;
    v28 = a4;
    v25 = v32;
    v26 = v37;
    v27 = v30;
    objc_msgSend(v12, "performWithoutAnimation:", v21);
    v19[0] = v11;
    v19[1] = 3221225472;
    v19[2] = __97__MFModernLabelledAtomList_crossFadeLabelVisibility_atomSeparatorStyle_withAnimationCoordinator___block_invoke_2;
    v19[3] = &unk_1E5A69898;
    v20 = a3;
    v19[4] = self;
    v19[5] = v30;
    v19[6] = v32;
    v19[7] = v37;
    v15[0] = v11;
    v15[1] = 3221225472;
    v15[2] = __97__MFModernLabelledAtomList_crossFadeLabelVisibility_atomSeparatorStyle_withAnimationCoordinator___block_invoke_3;
    v15[3] = &unk_1E5A663B0;
    v14 = v13;
    v16 = v14;
    v17 = v32;
    v18 = v30;
    objc_msgSend(v8, "animateAlongsideAnimations:completion:", v19, v15);

    _Block_object_dispose(v30, 8);
    _Block_object_dispose(v32, 8);

    _Block_object_dispose(v34, 8);
    _Block_object_dispose(v37, 8);

  }
}

uint64_t __97__MFModernLabelledAtomList_crossFadeLabelVisibility_atomSeparatorStyle_withAnimationCoordinator___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  objc_msgSend(*(id *)(a1 + 32), "frame");
  v2 = *(_QWORD **)(*(_QWORD *)(a1 + 48) + 8);
  v2[4] = v3;
  v2[5] = v4;
  v2[6] = v5;
  v2[7] = v6;
  objc_msgSend(*(id *)(a1 + 32), "snapshotView");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAnchorPoint:", 0.0, 0.5);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setFrame:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 56));
  objc_msgSend(*(id *)(a1 + 40), "addSubview:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 32), "setEnabled:", *(unsigned __int8 *)(a1 + 84));
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 440) = *(_BYTE *)(a1 + 84);
  objc_msgSend(*(id *)(a1 + 40), "setAddressAtomSeparatorStyle:", *(unsigned int *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 32), "sizeToFit");
  objc_msgSend(*(id *)(a1 + 40), "_reflow");
  objc_msgSend(*(id *)(a1 + 32), "frame");
  v11 = *(_QWORD **)(*(_QWORD *)(a1 + 64) + 8);
  v11[4] = v12;
  v11[5] = v13;
  v11[6] = v14;
  v11[7] = v15;
  v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C88]), "initWithFrame:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 56));
  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v18 = *(void **)(v17 + 40);
  *(_QWORD *)(v17 + 40) = v16;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "captureSnapshotOfView:withSnapshotType:", *(_QWORD *)(a1 + 32), 0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(a1 + 40), "addSubview:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __97__MFModernLabelledAtomList_crossFadeLabelVisibility_atomSeparatorStyle_withAnimationCoordinator___block_invoke_2(uint64_t a1)
{
  double v2;

  v2 = 1.0;
  if (!*(_BYTE *)(a1 + 64))
    v2 = 0.0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "setAlpha:", v2);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setFrame:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 56));
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setFrame:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 56));
}

uint64_t __97__MFModernLabelledAtomList_crossFadeLabelVisibility_atomSeparatorStyle_withAnimationCoordinator___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "removeFromSuperview");
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "removeFromSuperview");
}

- (id)viewForFirstBaselineLayout
{
  return self->_label;
}

- (id)viewForLastBaselineLayout
{
  return self->_lastBaselineDeceptionLabel;
}

- (void)setOverrideFont:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v4, "pointSize");
  objc_msgSend(v5, "systemFontOfSize:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_label, "setFont:", v6);
  -[UILabel sizeToFit](self->_label, "sizeToFit");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__MFModernLabelledAtomList_setOverrideFont___block_invoke;
  v8[3] = &unk_1E5A698C0;
  v7 = v4;
  v9 = v7;
  -[MFModernLabelledAtomList enumerateAddressAtomsUsingBlock:](self, "enumerateAddressAtomsUsingBlock:", v8);
  -[MFModernLabelledAtomList _setNeedsReflow](self, "_setNeedsReflow");

}

uint64_t __44__MFModernLabelledAtomList_setOverrideFont___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setTitleFont:", *(_QWORD *)(a1 + 32));
}

- (void)setViewsToDodge:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[NSArray isEqual:](self->_viewsToDodge, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_viewsToDodge, a3);
    -[MFModernLabelledAtomList _setNeedsReflow](self, "_setNeedsReflow");
  }

}

- (CGPoint)baselinePointForRow:(unint64_t)a3
{
  double MaxY;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;
  CGRect v12;

  -[UILabel frame](self->_label, "frame");
  MaxY = CGRectGetMaxY(v12);
  -[UILabel _baselineOffsetFromBottom](self->_label, "_baselineOffsetFromBottom");
  v6 = MaxY - v5;
  v7 = *MEMORY[0x1E0C9D538];
  -[MFModernLabelledAtomList lineSpacing](self, "lineSpacing");
  UIRoundToViewScale();
  v9 = v6 + v8;
  v10 = v7;
  result.y = v9;
  result.x = v10;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  CGPoint v25;
  CGRect v26;

  y = a3.y;
  x = a3.x;
  -[MFModernLabelledAtomList frame](self, "frame", a4);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[MFModernLabelledAtomList superview](self, "superview");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "convertPoint:fromView:", self, x, y);
  v17 = v16;
  v19 = v18;

  if (-[NSMutableArray count](self->_addressAtoms, "count"))
  {
    -[NSMutableArray objectAtIndex:](self->_addressAtoms, "objectAtIndex:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "baselinePoint");
    v22 = v21;
    objc_msgSend(v20, "frame");
    v14 = v14 + (v23 - v22) * 2.0;
    v10 = v10 - (v23 - v22);

  }
  v26.origin.x = v8;
  v26.origin.y = v10;
  v26.size.width = v12;
  v26.size.height = v14;
  v25.x = v17;
  v25.y = v19;
  return CGRectContainsPoint(v26, v25);
}

- (UILabel)label
{
  return self->_label;
}

- (UIColor)labelTextColor
{
  return self->_labelTextColor;
}

- (BOOL)isPrimary
{
  return self->_primary;
}

- (double)lineSpacing
{
  return self->_lineSpacing;
}

- (unint64_t)numberOfRows
{
  return self->_numberOfRows;
}

- (NSArray)viewsToDodge
{
  return self->_viewsToDodge;
}

- (MFModernLabelledAtomListDelegate)delegate
{
  return (MFModernLabelledAtomListDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)addresses
{
  return self->_addresses;
}

- (void)setAddresses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 520);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addresses, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_viewsToDodge, 0);
  objc_storeStrong((id *)&self->_labelTextColor, 0);
  objc_storeStrong((id *)&self->_lastBaselineDeceptionLabel, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_addressAtoms, 0);
}

@end
