@implementation _UIDocumentPickerCell

+ (CGSize)defaultSizeForCellStyle:(int64_t)a3 traitCollection:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGSize result;

  v6 = a4;
  +[_UIDocumentPickerCellFontManager sharedFontManager](_UIDocumentPickerCellFontManager, "sharedFontManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a3 == 1)
  {
    objc_msgSend(v7, "titleFontForGridLayout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "subtitleFontForGridLayout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_scaledValueForValue:", 16.0);
    v12 = v11;
    objc_msgSend(v10, "_scaledValueForValue:", 32.0);
    v14 = v12 + v13;
    objc_msgSend(a1, "thumbnailSizeForTraits:cellStyle:", v6, 1);
    v16 = v15;
    v18 = v14 + v17;

  }
  else
  {
    objc_msgSend(v7, "titleFontForTableLayout");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v19;
    if (a3 == 2)
    {
      objc_msgSend(v8, "subtitleFontForTableLayout");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_scaledValueForValue:", 28.0);
      v22 = v21;
      objc_msgSend(v20, "_scaledValueForValue:", 20.0);
      v24 = v22 + v23;
      objc_msgSend(v9, "_scaledValueForValue:", 16.0);
      v18 = v24 + v25;

    }
    else
    {
      objc_msgSend(v19, "_scaledValueForValue:", 28.0);
      v27 = v26;
      objc_msgSend(v9, "_scaledValueForValue:", 16.0);
      v18 = v27 + v28;
    }
    v16 = 0.0;
  }

  v29 = v16;
  v30 = v18;
  result.height = v30;
  result.width = v29;
  return result;
}

+ (id)_titleFontForTable:(BOOL)a3
{
  void *v3;
  _QWORD *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDF6A70];
  v4 = (_QWORD *)MEMORY[0x24BDF77C0];
  if (a3)
    v4 = (_QWORD *)MEMORY[0x24BDF77B0];
  objc_msgSend(MEMORY[0x24BDF6A78], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *v4, 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fontWithDescriptor:size:", v5, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_subtitleFontForTable:(BOOL)a3
{
  void *v3;
  _QWORD *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDF6A70];
  v4 = (_QWORD *)MEMORY[0x24BDF77C8];
  if (a3)
    v4 = (_QWORD *)MEMORY[0x24BDF77C0];
  objc_msgSend(MEMORY[0x24BDF6A78], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *v4, 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fontWithDescriptor:size:", v5, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (CGSize)thumbnailSizeForTraits:(id)a3 cellStyle:(int64_t)a4
{
  id v5;
  void *v6;
  double v7;
  void *v8;
  int v9;
  double v10;
  double v11;
  CGSize result;

  v5 = a3;
  v6 = v5;
  if (a4 == 3)
  {
    v7 = 20.0;
  }
  else if (a4 == 2)
  {
    v7 = 44.0;
  }
  else
  {
    objc_msgSend(v5, "_valueForTraitNamed:", CFSTR("CompactIcons"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");

    if (v9)
      v7 = 84.0;
    else
      v7 = 128.0;
  }

  v10 = v7;
  v11 = v7;
  result.height = v11;
  result.width = v10;
  return result;
}

- (_UIDocumentPickerCell)initWithFrame:(CGRect)a3
{
  _UIDocumentPickerCell *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  id v30;
  void *v31;
  id v32;
  double v33;
  double v34;
  id v35;
  void *v36;
  double v37;
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
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  double v65;
  void *v66;
  double v67;
  void *v68;
  double v69;
  void *v70;
  objc_super v72;

  v72.receiver = self;
  v72.super_class = (Class)_UIDocumentPickerCell;
  v3 = -[UICollectionViewTableCell initWithFrame:](&v72, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BA0]), "initWithTarget:action:", v3, sel__showPickableDiagnostic);
    -[_UIDocumentPickerCell setPickableDiagnosticGestureRecognizer:](v3, "setPickableDiagnosticGestureRecognizer:", v4);

    -[_UIDocumentPickerCell pickableDiagnosticGestureRecognizer](v3, "pickableDiagnosticGestureRecognizer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMinimumPressDuration:", 2.0);

    -[_UIDocumentPickerCell pickableDiagnosticGestureRecognizer](v3, "pickableDiagnosticGestureRecognizer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerCell addGestureRecognizer:](v3, "addGestureRecognizer:", v6);

    v7 = objc_alloc_init(MEMORY[0x24BDF6B68]);
    -[_UIDocumentPickerCell setTitleLabel:](v3, "setTitleLabel:", v7);

    -[_UIDocumentPickerCell titleLabel](v3, "titleLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTextAlignment:", 1);

    -[_UIDocumentPickerCell titleLabel](v3, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLineBreakMode:", 5);

    v10 = objc_alloc_init(MEMORY[0x24BDF6B68]);
    -[_UIDocumentPickerCell setSubtitleLabel:](v3, "setSubtitleLabel:", v10);

    objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerCell subtitleLabel](v3, "subtitleLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTextColor:", v11);

    -[_UIDocumentPickerCell subtitleLabel](v3, "subtitleLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTextAlignment:", 1);

    -[_UIDocumentPickerCell subtitleLabel](v3, "subtitleLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setLineBreakMode:", 5);

    v15 = objc_alloc_init(MEMORY[0x24BDF6B68]);
    -[_UIDocumentPickerCell setSubtitle2Label:](v3, "setSubtitle2Label:", v15);

    objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerCell subtitle2Label](v3, "subtitle2Label");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTextColor:", v16);

    -[_UIDocumentPickerCell subtitle2Label](v3, "subtitle2Label");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTextAlignment:", 1);

    -[_UIDocumentPickerCell subtitle2Label](v3, "subtitle2Label");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setLineBreakMode:", 5);

    v20 = objc_alloc_init(MEMORY[0x24BDF6B68]);
    -[_UIDocumentPickerCell setSubtitleJoiner:](v3, "setSubtitleJoiner:", v20);

    objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerCell subtitleJoiner](v3, "subtitleJoiner");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setTextColor:", v21);

    -[_UIDocumentPickerCell subtitleJoiner](v3, "subtitleJoiner");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setTextAlignment:", 1);

    v24 = objc_alloc_init(MEMORY[0x24BDF6F90]);
    -[_UIDocumentPickerCell setIndentationHelperView:](v3, "setIndentationHelperView:", v24);

    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("SUBTITLE_JOINER"), CFSTR("–"), CFSTR("Localizable"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerCell subtitleJoiner](v3, "subtitleJoiner");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setText:", v26);

    -[_UIDocumentPickerCell _updateFonts](v3, "_updateFonts");
    objc_msgSend((id)objc_opt_class(), "defaultSizeForCellStyle:traitCollection:", 1, 0);
    v29 = v28;
    v30 = objc_alloc(MEMORY[0x24BDF6AE8]);
    v31 = (void *)objc_msgSend(v30, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    -[_UIDocumentPickerCell setThumbnailView:](v3, "setThumbnailView:", v31);

    -[UIImageView setContentMode:](v3->_thumbnailView, "setContentMode:", 1);
    v32 = objc_alloc_init(MEMORY[0x24BDF6AE8]);
    -[_UIDocumentPickerCell setTagView:](v3, "setTagView:", v32);

    LODWORD(v33) = 1148829696;
    -[UIImageView setContentCompressionResistancePriority:forAxis:](v3->_tagView, "setContentCompressionResistancePriority:forAxis:", 0, v33);
    LODWORD(v34) = 1148829696;
    -[UIImageView setContentHuggingPriority:forAxis:](v3->_tagView, "setContentHuggingPriority:forAxis:", 0, v34);
    v35 = objc_alloc(MEMORY[0x24BDF6CF8]);
    -[_UIDocumentPickerCell thumbnailView](v3, "thumbnailView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "frame");
    v38 = (void *)objc_msgSend(v35, "initWithFrame:", 0.0, v37, v29, 0.0);
    -[_UIDocumentPickerCell setProgressView:](v3, "setProgressView:", v38);

    -[_UIDocumentPickerCell progressView](v3, "progressView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setHidden:", 1);

    -[_UIDocumentPickerCell titleLabel](v3, "titleLabel");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[_UIDocumentPickerCell subtitleLabel](v3, "subtitleLabel");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[_UIDocumentPickerCell thumbnailView](v3, "thumbnailView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[_UIDocumentPickerCell subtitleLabel](v3, "subtitleLabel");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[_UIDocumentPickerCell subtitle2Label](v3, "subtitle2Label");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[_UIDocumentPickerCell subtitleJoiner](v3, "subtitleJoiner");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[_UIDocumentPickerCell tagView](v3, "tagView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[_UIDocumentPickerCell indentationHelperView](v3, "indentationHelperView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[_UIDocumentPickerCell contentView](v3, "contentView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerCell thumbnailView](v3, "thumbnailView");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "addSubview:", v49);

    -[_UIDocumentPickerCell contentView](v3, "contentView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerCell progressView](v3, "progressView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "addSubview:", v51);

    -[_UIDocumentPickerCell contentView](v3, "contentView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerCell subtitleLabel](v3, "subtitleLabel");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "addSubview:", v53);

    -[_UIDocumentPickerCell contentView](v3, "contentView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerCell subtitle2Label](v3, "subtitle2Label");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "addSubview:", v55);

    -[_UIDocumentPickerCell contentView](v3, "contentView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerCell subtitleJoiner](v3, "subtitleJoiner");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "addSubview:", v57);

    -[_UIDocumentPickerCell contentView](v3, "contentView");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerCell titleLabel](v3, "titleLabel");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "addSubview:", v59);

    -[_UIDocumentPickerCell contentView](v3, "contentView");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerCell tagView](v3, "tagView");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "addSubview:", v61);

    -[_UIDocumentPickerCell contentView](v3, "contentView");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerCell indentationHelperView](v3, "indentationHelperView");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "addSubview:", v63);

    -[_UIDocumentPickerCell subtitleJoiner](v3, "subtitleJoiner");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v65) = 1148846080;
    objc_msgSend(v64, "setContentCompressionResistancePriority:forAxis:", 0, v65);

    -[_UIDocumentPickerCell subtitleLabel](v3, "subtitleLabel");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v67) = 1144750080;
    objc_msgSend(v66, "setContentCompressionResistancePriority:forAxis:", 0, v67);

    -[_UIDocumentPickerCell subtitle2Label](v3, "subtitle2Label");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v69) = 1132068864;
    objc_msgSend(v68, "setContentCompressionResistancePriority:forAxis:", 0, v69);

    -[UICollectionViewTableCell setIndentationWidth:](v3, "setIndentationWidth:", 25.0);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "addObserver:selector:name:object:", v3, sel__dynamicTypeSizeChanged_, *MEMORY[0x24BDF7670], 0);

  }
  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIDocumentPickerCell;
  -[_UIDocumentPickerCell traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[_UIDocumentPickerCell _updateIconSize](self, "_updateIconSize");
}

- (void)_dynamicTypeSizeChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)MEMORY[0x24BDD1628];
  -[_UIDocumentPickerCell gridConstraints](self, "gridConstraints", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deactivateConstraints:", v5);

  v6 = (void *)MEMORY[0x24BDD1628];
  -[_UIDocumentPickerCell tableConstraints](self, "tableConstraints");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deactivateConstraints:", v7);

  v8 = (void *)MEMORY[0x24BDD1628];
  -[_UIDocumentPickerCell indentedConstraints](self, "indentedConstraints");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deactivateConstraints:", v9);

  +[_UIDocumentPickerCellFontManager sharedFontManager](_UIDocumentPickerCellFontManager, "sharedFontManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cacheFonts");

  -[_UIDocumentPickerCell setGridConstraints:](self, "setGridConstraints:", 0);
  -[_UIDocumentPickerCell setTableConstraints:](self, "setTableConstraints:", 0);
  -[_UIDocumentPickerCell setIndentedConstraints:](self, "setIndentedConstraints:", 0);
  -[_UIDocumentPickerCell _updateConstraintsForCellStyle](self, "_updateConstraintsForCellStyle");
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIDocumentPickerCell;
  -[UICollectionViewTableCell prepareForReuse](&v9, sel_prepareForReuse);
  -[_UIDocumentPickerCell setAvailableActions:](self, "setAvailableActions:", 0);
  -[_UIDocumentPickerCell progressView](self, "progressView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  -[_UIDocumentPickerCell titleLabel](self, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", &stru_24E43B9D8);

  -[_UIDocumentPickerCell subtitleLabel](self, "subtitleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", &stru_24E43B9D8);

  -[_UIDocumentPickerCell subtitle2Label](self, "subtitle2Label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", &stru_24E43B9D8);

  -[_UIDocumentPickerCell thumbnailView](self, "thumbnailView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:", 0);

  -[_UIDocumentPickerCell tagView](self, "tagView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setImage:", 0);

  -[_UIDocumentPickerCell setCollectionView:](self, "setCollectionView:", 0);
  -[_UIDocumentPickerCell setItem:](self, "setItem:", 0);
}

- (void)willTransitionFromLayout:(id)a3 toLayout:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a4;
  v7 = a3;
  -[_UIDocumentPickerCell setTransitioningLayout:](self, "setTransitioningLayout:", 1);
  v8.receiver = self;
  v8.super_class = (Class)_UIDocumentPickerCell;
  -[UICollectionViewTableCell willTransitionFromLayout:toLayout:](&v8, sel_willTransitionFromLayout_toLayout_, v7, v6);

}

- (void)didTransitionFromLayout:(id)a3 toLayout:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIDocumentPickerCell;
  -[UICollectionViewTableCell didTransitionFromLayout:toLayout:](&v5, sel_didTransitionFromLayout_toLayout_, a3, a4);
  -[_UIDocumentPickerCell setTransitioningLayout:](self, "setTransitioningLayout:", 0);
}

- (void)dealloc
{
  objc_super v3;

  -[_UIDocumentPickerContainerItem decrementModelDisplayCount](self->_item, "decrementModelDisplayCount");
  v3.receiver = self;
  v3.super_class = (Class)_UIDocumentPickerCell;
  -[_UIDocumentPickerCell dealloc](&v3, sel_dealloc);
}

- (void)_updateIconSize
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  id v10;

  v3 = (void *)objc_opt_class();
  -[_UIDocumentPickerCell traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "thumbnailSizeForTraits:cellStyle:", v4, -[_UIDocumentPickerCell cellStyle](self, "cellStyle"));
  v6 = v5;
  v8 = v7;

  -[_UIDocumentPickerCell thumbnailCenterHeightConstraint](self, "thumbnailCenterHeightConstraint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setConstant:", v8);

  -[_UIDocumentPickerCell thumbnailCenterWidthConstraint](self, "thumbnailCenterWidthConstraint");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setConstant:", v6);

}

- (void)_updateSelectionState:(BOOL)a3
{
  _BOOL4 v3;
  int v5;
  int v6;
  UIImageView *selectionView;
  UIImageView *v8;
  UIImageView *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  NSMutableArray *v16;
  NSMutableArray *selectionViewConstraints;
  NSMutableArray *v18;
  void *v19;
  void *v20;
  void *v21;
  NSMutableArray *v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  _QWORD v35[5];
  _QWORD v36[5];
  _QWORD v37[5];
  _QWORD v38[6];

  v3 = a3;
  if (-[UICollectionViewTableCell isEditing](self, "isEditing"))
    v5 = !-[UICollectionViewTableCell isInTableLayout](self, "isInTableLayout");
  else
    v5 = 0;
  if (-[UICollectionViewTableCell isInTableLayout](self, "isInTableLayout"))
    v6 = !-[UICollectionViewTableCell isEditing](self, "isEditing");
  else
    v6 = 0;
  selectionView = self->_selectionView;
  if (!v5)
  {
    if (selectionView)
    {
      if (v3)
      {
        v36[4] = self;
        v37[0] = MEMORY[0x24BDAC760];
        v37[1] = 3221225472;
        v37[2] = __47___UIDocumentPickerCell__updateSelectionState___block_invoke_2;
        v37[3] = &unk_24E43A808;
        v37[4] = self;
        v36[0] = MEMORY[0x24BDAC760];
        v36[1] = 3221225472;
        v36[2] = __47___UIDocumentPickerCell__updateSelectionState___block_invoke_3;
        v36[3] = &unk_24E43A830;
        objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:completion:", v37, v36, 0.3);
      }
      else
      {
        -[UIImageView removeFromSuperview](selectionView, "removeFromSuperview");
      }
      objc_msgSend(MEMORY[0x24BDD1628], "deactivateConstraints:", self->_selectionViewConstraints);
    }
LABEL_34:
    if (v6)
      goto LABEL_35;
    goto LABEL_37;
  }
  if (selectionView)
  {
    if (!v3)
      goto LABEL_17;
  }
  else
  {
    v8 = (UIImageView *)objc_alloc_init(MEMORY[0x24BDF6AE8]);
    v9 = self->_selectionView;
    self->_selectionView = v8;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_selectionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    selectionView = self->_selectionView;
    if (!v3)
      goto LABEL_17;
  }
  -[UIImageView superview](selectionView, "superview");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerCell contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  selectionView = self->_selectionView;
  if (v10 != v11)
  {
    -[UIImageView setAlpha:](selectionView, "setAlpha:", 0.0);
    selectionView = self->_selectionView;
    v12 = 1;
    goto LABEL_18;
  }
LABEL_17:
  v12 = 0;
LABEL_18:
  -[UIImageView superview](selectionView, "superview");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerCell contentView](self, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13 != v14)
  {
    -[_UIDocumentPickerCell contentView](self, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", self->_selectionView);

  }
  if (!self->_selectionViewConstraints)
  {
    v16 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 2);
    selectionViewConstraints = self->_selectionViewConstraints;
    self->_selectionViewConstraints = v16;

  }
  if (self->_thumbnailView == (UIImageView *)self->_selectionViewsThumbnailView)
  {
    if (v13 == v14)
      goto LABEL_26;
  }
  else
  {
    -[NSMutableArray removeAllObjects](self->_selectionViewConstraints, "removeAllObjects");
    v18 = self->_selectionViewConstraints;
    -[UIImageView bottomAnchor](self->_selectionView, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView bottomAnchor](self->_thumbnailView, "bottomAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:constant:", v20, -3.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v18, "addObject:", v21);

    v22 = self->_selectionViewConstraints;
    -[UIImageView centerXAnchor](self->_selectionView, "centerXAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView centerXAnchor](self->_thumbnailView, "centerXAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v22, "addObject:", v25);

    -[_UIDocumentPickerCell setSelectionViewsThumbnailView:](self, "setSelectionViewsThumbnailView:", self->_thumbnailView);
  }
  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", self->_selectionViewConstraints);
LABEL_26:
  if (v12)
  {
    v38[0] = MEMORY[0x24BDAC760];
    v38[1] = 3221225472;
    v38[2] = __47___UIDocumentPickerCell__updateSelectionState___block_invoke;
    v38[3] = &unk_24E43A808;
    v38[4] = self;
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:completion:", v38, 0, 0.3);
  }
  if (!self->_selectionView)
    goto LABEL_34;
  v26 = -[UICollectionViewTableCell isSelected](self, "isSelected");
  v27 = (void *)MEMORY[0x24BDF6AC8];
  if (v26)
  {
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __47___UIDocumentPickerCell__updateSelectionState___block_invoke_4;
    v35[3] = &unk_24E43A880;
    v35[4] = self;
    objc_msgSend(MEMORY[0x24BDF6AC8], "_cachedImageForKey:fromBlock:", CFSTR("DocPickerCollectionCheck"), v35);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_selectionView, "setImage:", v28);

    if (!v6)
      goto LABEL_37;
LABEL_35:
    -[UICollectionViewTableCell setSelectedBackgroundView:](self, "setSelectedBackgroundView:", 0);
    return;
  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerCell traitCollection](self, "traitCollection");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("DocumentSelectionCheckmarkUnchecked"), v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](self->_selectionView, "setImage:", v31);

  if (v6)
    goto LABEL_35;
LABEL_37:
  -[_UIDocumentPickerCell cachedSelectedBackgroundView](self, "cachedSelectedBackgroundView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v32)
  {
    v33 = objc_alloc_init(MEMORY[0x24BDF6F90]);
    -[_UIDocumentPickerCell setCachedSelectedBackgroundView:](self, "setCachedSelectedBackgroundView:", v33);

  }
  -[_UIDocumentPickerCell cachedSelectedBackgroundView](self, "cachedSelectedBackgroundView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewTableCell setSelectedBackgroundView:](self, "setSelectedBackgroundView:", v34);

}

- (void)_updateFonts
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = -[UICollectionViewTableCell isInTableLayout](self, "isInTableLayout");
  +[_UIDocumentPickerCellFontManager sharedFontManager](_UIDocumentPickerCellFontManager, "sharedFontManager");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v10, "titleFontForTableLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "subtitleFontForTableLayout");
  }
  else
  {
    objc_msgSend(v10, "titleFontForGridLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "subtitleFontForGridLayout");
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerCell titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v4);

  -[_UIDocumentPickerCell subtitleLabel](self, "subtitleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v5);

  -[_UIDocumentPickerCell subtitle2Label](self, "subtitle2Label");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v5);

  -[_UIDocumentPickerCell subtitleJoiner](self, "subtitleJoiner");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v5);

}

- (void)_updateAccessoryType
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  if (!-[UICollectionViewTableCell isEditing](self, "isEditing")
    && -[_UIDocumentPickerCell cellStyle](self, "cellStyle") != 3)
  {
    -[_UIDocumentPickerCell item](self, "item");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "type") == 2)
    {

    }
    else
    {
      -[_UIDocumentPickerCell item](self, "item");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "type");

      if (v6 != 1)
      {
        -[_UIDocumentPickerCell collectionView](self, "collectionView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v7, "supportsActions") & 1) != 0)
        {
          -[_UIDocumentPickerCell collectionView](self, "collectionView");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "serviceViewController");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "shouldShowAction:", 2);

          if ((v10 & 1) != 0)
          {
            v3 = 4;
            goto LABEL_4;
          }
        }
        else
        {

        }
        goto LABEL_3;
      }
    }
    v3 = 1;
    goto LABEL_4;
  }
LABEL_3:
  v3 = 0;
LABEL_4:
  -[UICollectionViewTableCell setAccessoryType:](self, "setAccessoryType:", v3);
}

- (void)_updateSeparatorInset
{
  _BOOL4 v3;
  double v4;

  v3 = -[UICollectionViewTableCell isEditing](self, "isEditing");
  v4 = 24.0;
  if (v3)
    v4 = 60.0;
  -[UICollectionViewTableCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, v4, 0.0, 0.0);
}

- (void)setEditing:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[UICollectionViewTableCell isEditing](self, "isEditing") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)_UIDocumentPickerCell;
    -[UICollectionViewTableCell setEditing:](&v5, sel_setEditing_, v3);
    -[_UIDocumentPickerCell updateForEditingState:](self, "updateForEditingState:", 1);
  }
}

- (void)_updateConstraintsForCellStyle
{
  void *v3;
  void *v4;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
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
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  double v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  _QWORD v267[3];

  v267[2] = *MEMORY[0x24BDAC8D0];
  +[_UIDocumentPickerCellFontManager sharedFontManager](_UIDocumentPickerCellFontManager, "sharedFontManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_UIDocumentPickerCell cellStyle](self, "cellStyle") == 2)
  {
    -[_UIDocumentPickerCell tableConstraints](self, "tableConstraints");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 19);
      objc_msgSend(v3, "titleFontForTableLayout");
      v264 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "subtitleFontForTableLayout");
      v265 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentPickerCell thumbnailView](self, "thumbnailView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "heightAnchor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "constraintEqualToConstant:", 44.0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v8);

      -[_UIDocumentPickerCell thumbnailView](self, "thumbnailView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "widthAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "constraintEqualToConstant:", 44.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v11);

      -[_UIDocumentPickerCell thumbnailView](self, "thumbnailView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "centerYAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentPickerCell contentView](self, "contentView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "centerYAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "constraintEqualToAnchor:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v16);

      -[_UIDocumentPickerCell thumbnailView](self, "thumbnailView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "leadingAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentPickerCell contentView](self, "contentView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "leadingAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "constraintEqualToAnchor:constant:", v20, 24.0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v21);

      -[_UIDocumentPickerCell thumbnailView](self, "thumbnailView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "widthAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "constraintEqualToConstant:", 0.0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v266 = v24;
      LODWORD(v25) = 1111752704;
      objc_msgSend(v24, "setPriority:", v25);
      objc_msgSend(v5, "addObject:", v24);
      -[_UIDocumentPickerCell tagView](self, "tagView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "widthAnchor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "constraintEqualToConstant:", 0.0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      LODWORD(v29) = 1111752704;
      objc_msgSend(v28, "setPriority:", v29);
      objc_msgSend(v5, "addObject:", v28);
      -[_UIDocumentPickerCell tagView](self, "tagView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "leadingAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentPickerCell contentView](self, "contentView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "leadingAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "constraintEqualToAnchor:constant:", v33, 80.0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v34);

      -[_UIDocumentPickerCell titleLabel](self, "titleLabel");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "leadingAnchor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentPickerCell tagView](self, "tagView");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "trailingAnchor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "constraintEqualToAnchor:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v39);

      -[_UIDocumentPickerCell subtitleLabel](self, "subtitleLabel");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "leadingAnchor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentPickerCell contentView](self, "contentView");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "leadingAnchor");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "constraintEqualToAnchor:constant:", v43, 80.0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v44);

      -[_UIDocumentPickerCell subtitleJoiner](self, "subtitleJoiner");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "leadingAnchor");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentPickerCell subtitleLabel](self, "subtitleLabel");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "trailingAnchor");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "constraintEqualToAnchor:constant:", v48, 5.0);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v49);

      -[_UIDocumentPickerCell subtitle2Label](self, "subtitle2Label");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "leadingAnchor");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentPickerCell subtitleJoiner](self, "subtitleJoiner");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "trailingAnchor");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "constraintEqualToAnchor:constant:", v53, 5.0);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v54);

      -[_UIDocumentPickerCell titleLabel](self, "titleLabel");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "lastBaselineAnchor");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentPickerCell contentView](self, "contentView");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "topAnchor");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v264, "_scaledValueForValue:", 28.0);
      objc_msgSend(v56, "constraintEqualToAnchor:constant:", v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v59);

      -[_UIDocumentPickerCell tagView](self, "tagView");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "lastBaselineAnchor");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentPickerCell titleLabel](self, "titleLabel");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "lastBaselineAnchor");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "constraintEqualToAnchor:", v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v64);

      -[_UIDocumentPickerCell subtitleLabel](self, "subtitleLabel");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "lastBaselineAnchor");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentPickerCell titleLabel](self, "titleLabel");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "lastBaselineAnchor");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v265, "_scaledValueForValue:", 20.0);
      objc_msgSend(v66, "constraintEqualToAnchor:constant:", v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v69);

      -[_UIDocumentPickerCell subtitle2Label](self, "subtitle2Label");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "lastBaselineAnchor");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentPickerCell subtitleLabel](self, "subtitleLabel");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "lastBaselineAnchor");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "constraintEqualToAnchor:", v73);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v74);

      -[_UIDocumentPickerCell subtitleJoiner](self, "subtitleJoiner");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "lastBaselineAnchor");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentPickerCell subtitleLabel](self, "subtitleLabel");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "lastBaselineAnchor");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "constraintEqualToAnchor:", v78);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v79);

      -[_UIDocumentPickerCell contentView](self, "contentView");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "bottomAnchor");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel lastBaselineAnchor](self->_subtitleLabel, "lastBaselineAnchor");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v264, "_scaledValueForValue:", 16.0);
      objc_msgSend(v81, "constraintEqualToAnchor:constant:", v82);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v83);

      -[_UIDocumentPickerCell titleLabel](self, "titleLabel");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "trailingAnchor");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentPickerCell contentView](self, "contentView");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "trailingAnchor");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "constraintLessThanOrEqualToAnchor:", v87);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v88);

      -[_UIDocumentPickerCell subtitle2Label](self, "subtitle2Label");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "trailingAnchor");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentPickerCell contentView](self, "contentView");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "trailingAnchor");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "constraintLessThanOrEqualToAnchor:", v92);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v93);

      -[_UIDocumentPickerCell setTableConstraints:](self, "setTableConstraints:", v5);
    }
    -[_UIDocumentPickerCell tableConstraints](self, "tableConstraints");
    v94 = objc_claimAutoreleasedReturnValue();
  }
  else if (-[_UIDocumentPickerCell cellStyle](self, "cellStyle") == 3)
  {
    -[_UIDocumentPickerCell indentedConstraints](self, "indentedConstraints");
    v95 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v95)
    {
      v96 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 13);
      objc_msgSend(v3, "titleFontForTableLayout");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentPickerCell thumbnailView](self, "thumbnailView");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "heightAnchor");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "constraintEqualToConstant:", 20.0);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "addObject:", v100);

      -[_UIDocumentPickerCell thumbnailView](self, "thumbnailView");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "widthAnchor");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "constraintEqualToConstant:", 20.0);
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "addObject:", v103);

      -[_UIDocumentPickerCell thumbnailView](self, "thumbnailView");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "centerYAnchor");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentPickerCell contentView](self, "contentView");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "centerYAnchor");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "constraintEqualToAnchor:", v107);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "addObject:", v108);

      -[_UIDocumentPickerCell thumbnailView](self, "thumbnailView");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v109, "leadingAnchor");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentPickerCell indentationHelperView](self, "indentationHelperView");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v111, "trailingAnchor");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "constraintEqualToAnchor:constant:", v112, 15.0);
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "addObject:", v113);

      -[_UIDocumentPickerCell indentationHelperView](self, "indentationHelperView");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v114, "leadingAnchor");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentPickerCell contentView](self, "contentView");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v116, "leadingAnchor");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v115, "constraintEqualToAnchor:", v117);
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "addObject:", v118);

      -[_UIDocumentPickerCell indentationHelperView](self, "indentationHelperView");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v119, "widthAnchor");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v120, "constraintEqualToConstant:", 0.0);
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentPickerCell setIndentationConstraint:](self, "setIndentationConstraint:", v121);

      -[_UIDocumentPickerCell indentationConstraint](self, "indentationConstraint");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "addObject:", v122);

      -[_UIDocumentPickerCell tagView](self, "tagView");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v123, "lastBaselineAnchor");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentPickerCell titleLabel](self, "titleLabel");
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v125, "lastBaselineAnchor");
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v124, "constraintEqualToAnchor:", v126);
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "addObject:", v127);

      -[_UIDocumentPickerCell tagView](self, "tagView");
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v128, "leadingAnchor");
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentPickerCell thumbnailView](self, "thumbnailView");
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v130, "trailingAnchor");
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v129, "constraintEqualToAnchor:constant:", v131, 15.0);
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "addObject:", v132);

      -[_UIDocumentPickerCell titleLabel](self, "titleLabel");
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v133, "leadingAnchor");
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentPickerCell tagView](self, "tagView");
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v135, "trailingAnchor");
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v134, "constraintEqualToAnchor:", v136);
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "addObject:", v137);

      -[_UIDocumentPickerCell titleLabel](self, "titleLabel");
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v138, "trailingAnchor");
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentPickerCell contentView](self, "contentView");
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v140, "trailingAnchor");
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v139, "constraintLessThanOrEqualToAnchor:", v141);
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "addObject:", v142);

      -[UILabel lastBaselineAnchor](self->_titleLabel, "lastBaselineAnchor");
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentPickerCell contentView](self, "contentView");
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v144, "topAnchor");
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "_scaledValueForValue:", 28.0);
      objc_msgSend(v143, "constraintEqualToAnchor:constant:", v145);
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "addObject:", v146);

      -[_UIDocumentPickerCell contentView](self, "contentView");
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v147, "bottomAnchor");
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel lastBaselineAnchor](self->_titleLabel, "lastBaselineAnchor");
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "_scaledValueForValue:", 16.0);
      objc_msgSend(v148, "constraintEqualToAnchor:constant:", v149);
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "addObject:", v150);

      -[_UIDocumentPickerCell setIndentedConstraints:](self, "setIndentedConstraints:", v96);
    }
    -[_UIDocumentPickerCell indentedConstraints](self, "indentedConstraints");
    v94 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_UIDocumentPickerCell gridConstraints](self, "gridConstraints");
    v151 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v151)
    {
      v152 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 20);
      -[_UIDocumentPickerCell titleLabel](self, "titleLabel");
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v153, "lastBaselineAnchor");
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentPickerCell thumbnailView](self, "thumbnailView");
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v155, "bottomAnchor");
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentPickerCell titleLabel](self, "titleLabel");
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v157, "font");
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v158, "_scaledValueForValue:", 16.0);
      objc_msgSend(v154, "constraintEqualToAnchor:constant:", v156);
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v152, "addObject:", v159);

      -[_UIDocumentPickerCell subtitleLabel](self, "subtitleLabel");
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v160, "lastBaselineAnchor");
      v161 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentPickerCell titleLabel](self, "titleLabel");
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v162, "lastBaselineAnchor");
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentPickerCell subtitleLabel](self, "subtitleLabel");
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v164, "font");
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v165, "_scaledValueForValue:", 16.0);
      objc_msgSend(v161, "constraintEqualToAnchor:constant:", v163);
      v166 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v152, "addObject:", v166);

      -[_UIDocumentPickerCell subtitle2Label](self, "subtitle2Label");
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v167, "lastBaselineAnchor");
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentPickerCell subtitleLabel](self, "subtitleLabel");
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v169, "lastBaselineAnchor");
      v170 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentPickerCell subtitleLabel](self, "subtitleLabel");
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v171, "font");
      v172 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v172, "_scaledValueForValue:", 16.0);
      objc_msgSend(v168, "constraintEqualToAnchor:constant:", v170);
      v173 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v152, "addObject:", v173);

      -[_UIDocumentPickerCell subtitleJoiner](self, "subtitleJoiner");
      v174 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v174, "leadingAnchor");
      v175 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentPickerCell subtitleLabel](self, "subtitleLabel");
      v176 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v176, "trailingAnchor");
      v177 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v175, "constraintEqualToAnchor:constant:", v177, 5.0);
      v178 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v152, "addObject:", v178);

      -[_UIDocumentPickerCell subtitleJoiner](self, "subtitleJoiner");
      v179 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v179, "lastBaselineAnchor");
      v180 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentPickerCell subtitleLabel](self, "subtitleLabel");
      v181 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v181, "lastBaselineAnchor");
      v182 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v180, "constraintEqualToAnchor:", v182);
      v183 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v152, "addObject:", v183);

      -[_UIDocumentPickerCell tagView](self, "tagView");
      v184 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v184, "lastBaselineAnchor");
      v185 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentPickerCell titleLabel](self, "titleLabel");
      v186 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v186, "lastBaselineAnchor");
      v187 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v185, "constraintEqualToAnchor:", v187);
      v188 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v152, "addObject:", v188);

      -[_UIDocumentPickerCell tagView](self, "tagView");
      v189 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v189, "trailingAnchor");
      v190 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentPickerCell titleLabel](self, "titleLabel");
      v191 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v191, "leadingAnchor");
      v192 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v190, "constraintEqualToAnchor:", v192);
      v193 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v152, "addObject:", v193);

      -[_UIDocumentPickerCell tagView](self, "tagView");
      v194 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v194, "leadingAnchor");
      v195 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentPickerCell contentView](self, "contentView");
      v196 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v196, "leadingAnchor");
      v197 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v195, "constraintGreaterThanOrEqualToAnchor:constant:", v197, 5.0);
      v198 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v152, "addObject:", v198);

      -[_UIDocumentPickerCell titleLabel](self, "titleLabel");
      v199 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v199, "centerXAnchor");
      v200 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentPickerCell contentView](self, "contentView");
      v201 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v201, "centerXAnchor");
      v202 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v200, "constraintEqualToAnchor:", v202);
      v203 = (void *)objc_claimAutoreleasedReturnValue();

      LODWORD(v204) = 1144750080;
      objc_msgSend(v203, "setPriority:", v204);
      objc_msgSend(v152, "addObject:", v203);
      -[_UIDocumentPickerCell titleLabel](self, "titleLabel");
      v205 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v205, "trailingAnchor");
      v206 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentPickerCell contentView](self, "contentView");
      v207 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v207, "trailingAnchor");
      v208 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v206, "constraintLessThanOrEqualToAnchor:constant:", v208, -5.0);
      v209 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v152, "addObject:", v209);

      -[_UIDocumentPickerCell subtitleLabel](self, "subtitleLabel");
      v210 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v210, "centerXAnchor");
      v211 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentPickerCell contentView](self, "contentView");
      v212 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v212, "centerXAnchor");
      v213 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v211, "constraintEqualToAnchor:", v213);
      v214 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v152, "addObject:", v214);

      -[_UIDocumentPickerCell subtitleLabel](self, "subtitleLabel");
      v215 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v215, "leadingAnchor");
      v216 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentPickerCell contentView](self, "contentView");
      v217 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v217, "leadingAnchor");
      v218 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v216, "constraintGreaterThanOrEqualToAnchor:constant:", v218, 5.0);
      v219 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v152, "addObject:", v219);

      -[_UIDocumentPickerCell subtitleLabel](self, "subtitleLabel");
      v220 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v220, "trailingAnchor");
      v221 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentPickerCell contentView](self, "contentView");
      v222 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v222, "trailingAnchor");
      v223 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v221, "constraintLessThanOrEqualToAnchor:constant:", v223, -5.0);
      v224 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v152, "addObject:", v224);

      -[_UIDocumentPickerCell subtitle2Label](self, "subtitle2Label");
      v225 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v225, "centerXAnchor");
      v226 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentPickerCell contentView](self, "contentView");
      v227 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v227, "centerXAnchor");
      v228 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v226, "constraintEqualToAnchor:", v228);
      v229 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v152, "addObject:", v229);

      -[_UIDocumentPickerCell subtitle2Label](self, "subtitle2Label");
      v230 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v230, "leadingAnchor");
      v231 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentPickerCell contentView](self, "contentView");
      v232 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v232, "leadingAnchor");
      v233 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v231, "constraintGreaterThanOrEqualToAnchor:constant:", v233, 5.0);
      v234 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v152, "addObject:", v234);

      -[_UIDocumentPickerCell subtitle2Label](self, "subtitle2Label");
      v235 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v235, "trailingAnchor");
      v236 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentPickerCell contentView](self, "contentView");
      v237 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v237, "trailingAnchor");
      v238 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v236, "constraintLessThanOrEqualToAnchor:constant:", v238, -5.0);
      v239 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v152, "addObject:", v239);

      -[_UIDocumentPickerCell thumbnailView](self, "thumbnailView");
      v240 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v240, "heightAnchor");
      v241 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v241, "constraintEqualToConstant:", 0.0);
      v242 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentPickerCell setThumbnailCenterHeightConstraint:](self, "setThumbnailCenterHeightConstraint:", v242);

      -[_UIDocumentPickerCell thumbnailView](self, "thumbnailView");
      v243 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v243, "widthAnchor");
      v244 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v244, "constraintEqualToConstant:", 0.0);
      v245 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentPickerCell setThumbnailCenterWidthConstraint:](self, "setThumbnailCenterWidthConstraint:", v245);

      -[_UIDocumentPickerCell thumbnailCenterHeightConstraint](self, "thumbnailCenterHeightConstraint");
      v246 = (void *)objc_claimAutoreleasedReturnValue();
      v267[0] = v246;
      -[_UIDocumentPickerCell thumbnailCenterWidthConstraint](self, "thumbnailCenterWidthConstraint");
      v247 = (void *)objc_claimAutoreleasedReturnValue();
      v267[1] = v247;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v267, 2);
      v248 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v152, "addObjectsFromArray:", v248);

      -[_UIDocumentPickerCell thumbnailView](self, "thumbnailView");
      v249 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v249, "centerXAnchor");
      v250 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentPickerCell contentView](self, "contentView");
      v251 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v251, "centerXAnchor");
      v252 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v250, "constraintEqualToAnchor:", v252);
      v253 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v152, "addObject:", v253);

      -[_UIDocumentPickerCell thumbnailView](self, "thumbnailView");
      v254 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v254, "topAnchor");
      v255 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentPickerCell contentView](self, "contentView");
      v256 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v256, "topAnchor");
      v257 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v255, "constraintEqualToAnchor:", v257);
      v258 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v152, "addObject:", v258);

      -[_UIDocumentPickerCell setGridConstraints:](self, "setGridConstraints:", v152);
    }
    -[_UIDocumentPickerCell _updateIconSize](self, "_updateIconSize");
    -[_UIDocumentPickerCell gridConstraints](self, "gridConstraints");
    v94 = objc_claimAutoreleasedReturnValue();
  }
  v259 = (void *)v94;
  -[_UIDocumentPickerCell activeConstraints](self, "activeConstraints");
  v260 = (void *)objc_claimAutoreleasedReturnValue();

  if (v259 != v260)
  {
    -[_UIDocumentPickerCell activeConstraints](self, "activeConstraints");
    v261 = (void *)objc_claimAutoreleasedReturnValue();

    if (v261)
    {
      v262 = (void *)MEMORY[0x24BDD1628];
      -[_UIDocumentPickerCell activeConstraints](self, "activeConstraints");
      v263 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v262, "deactivateConstraints:", v263);

    }
    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v259);
    -[_UIDocumentPickerCell setActiveConstraints:](self, "setActiveConstraints:", v259);
  }

}

- (void)updateForEditingState:(BOOL)a3
{
  _BOOL4 v3;
  _QWORD v5[5];

  v3 = a3;
  -[_UIDocumentPickerCell _updateSelectionState:](self, "_updateSelectionState:");
  -[_UIDocumentPickerCell _updateAccessoryType](self, "_updateAccessoryType");
  -[_UIDocumentPickerCell updateActionGestureRecognizer](self, "updateActionGestureRecognizer");
  if (v3)
  {
    -[_UIDocumentPickerCell layoutIfNeeded](self, "layoutIfNeeded");
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __47___UIDocumentPickerCell_updateForEditingState___block_invoke;
    v5[3] = &unk_24E43A808;
    v5[4] = self;
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:", v5, 0.3);
  }
  else
  {
    -[_UIDocumentPickerCell _updateSeparatorInset](self, "_updateSeparatorInset");
  }
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  int64_t v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_UIDocumentPickerCell;
  -[UICollectionViewTableCell applyLayoutAttributes:](&v20, sel_applyLayoutAttributes_, v4);
  -[UICollectionViewTableCell currentLayout](self, "currentLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "cellStyle");

  if (v6 != -[_UIDocumentPickerCell cellStyle](self, "cellStyle"))
  {
    -[_UIDocumentPickerCell setCellStyle:](self, "setCellStyle:", v6);
    -[_UIDocumentPickerCell _udpateLabelAlpha](self, "_udpateLabelAlpha");
    -[_UIDocumentPickerCell _updateConstraintsForCellStyle](self, "_updateConstraintsForCellStyle");
    -[_UIDocumentPickerCell _updateSelectionState:](self, "_updateSelectionState:", 1);
    -[_UIDocumentPickerCell _updateFonts](self, "_updateFonts");
  }
  v7 = (double)-[UICollectionViewTableCell indentationLevel](self, "indentationLevel");
  -[UICollectionViewTableCell indentationWidth](self, "indentationWidth");
  v9 = v8 * v7;
  objc_msgSend(v4, "size");
  v11 = v10 * 0.5;
  if (v9 > v10 * 0.5)
  {
    -[UICollectionViewTableCell indentationWidth](self, "indentationWidth");
    v13 = v11 / v12;
    v14 = floor(v13);
    v15 = -[UICollectionViewTableCell indentationLevel](self, "indentationLevel") - vcvtmd_u64_f64(v13);
    -[UICollectionViewTableCell indentationWidth](self, "indentationWidth");
    v17 = (double)v15 * 5.0 + (double)(unint64_t)v14 * v16;
    objc_msgSend(v4, "size");
    v9 = fmin(v17, v18 * 0.8);
  }
  -[_UIDocumentPickerCell indentationConstraint](self, "indentationConstraint");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setConstant:", v9);

  if (-[_UIDocumentPickerCell isTransitioningLayout](self, "isTransitioningLayout"))
    -[_UIDocumentPickerCell layoutIfNeeded](self, "layoutIfNeeded");

}

- (void)_udpateLabelAlpha
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  -[_UIDocumentPickerCell item](self, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "pickable"))
    v4 = 1.0;
  else
    v4 = 0.5;
  -[_UIDocumentPickerCell titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", v4);

  if (-[_UIDocumentPickerCell cellStyle](self, "cellStyle") == 3)
  {
    -[_UIDocumentPickerCell subtitleLabel](self, "subtitleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAlpha:", 0.0);

    -[_UIDocumentPickerCell subtitle2Label](self, "subtitle2Label");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAlpha:", 0.0);

    -[_UIDocumentPickerCell subtitleJoiner](self, "subtitleJoiner");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0.0;
    v17 = v8;
  }
  else
  {
    -[_UIDocumentPickerCell item](self, "item");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "pickable"))
      v11 = 1.0;
    else
      v11 = 0.5;

    -[_UIDocumentPickerCell subtitleLabel](self, "subtitleLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAlpha:", v11);

    v13 = 0.0;
    if (-[_UIDocumentPickerCell cellStyle](self, "cellStyle") == 2)
    {
      -[_UIDocumentPickerCell subtitle2Label](self, "subtitle2Label");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "text");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "length"))
        v13 = v11;
      else
        v13 = 0.0;

    }
    -[_UIDocumentPickerCell subtitle2Label](self, "subtitle2Label");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAlpha:", v13);

    -[_UIDocumentPickerCell subtitleJoiner](self, "subtitleJoiner");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v8;
    v9 = v13;
  }
  objc_msgSend(v8, "setAlpha:", v9);

}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[UICollectionViewTableCell isSelected](self, "isSelected") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)_UIDocumentPickerCell;
    -[UICollectionViewTableCell setSelected:](&v5, sel_setSelected_, v3);
    -[_UIDocumentPickerCell _updateSelectionState:](self, "_updateSelectionState:", 0);
  }
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  if (-[UICollectionViewTableCell isHighlighted](self, "isHighlighted") != a3)
  {
    if (v3)
      v5 = 3;
    else
      v5 = 0;
    -[_UIDocumentPickerCell thumbnailView](self, "thumbnailView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDrawMode:", v5);

    v7.receiver = self;
    v7.super_class = (Class)_UIDocumentPickerCell;
    -[UICollectionViewTableCell setHighlighted:](&v7, sel_setHighlighted_, v3);
  }
}

- (void)setItem:(id)a3
{
  _UIDocumentPickerContainerItem *v5;
  _UIDocumentPickerContainerItem *item;
  NSArray *availableActions;
  _UIDocumentPickerContainerItem *v8;

  v5 = (_UIDocumentPickerContainerItem *)a3;
  item = self->_item;
  if (item != v5)
  {
    v8 = v5;
    -[_UIDocumentPickerContainerItem decrementModelDisplayCount](item, "decrementModelDisplayCount");
    objc_storeStrong((id *)&self->_item, a3);
    -[_UIDocumentPickerContainerItem incrementModelDisplayCount](self->_item, "incrementModelDisplayCount");
    availableActions = self->_availableActions;
    self->_availableActions = 0;

    -[_UIDocumentPickerCell reloadItem:](self, "reloadItem:", 0);
    -[_UIDocumentPickerCell updateActionGestureRecognizer](self, "updateActionGestureRecognizer");
    -[_UIDocumentPickerCell _udpateLabelAlpha](self, "_udpateLabelAlpha");
    v5 = v8;
  }

}

- (void)setCollectionView:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_collectionView, obj);
    -[_UIDocumentPickerCell updateActionGestureRecognizer](self, "updateActionGestureRecognizer");
    v5 = obj;
  }

}

- (NSArray)availableActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  NSArray *availableActions;
  void *v9;
  NSArray *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  void *v12;
  void *v13;
  NSArray *v14;
  NSArray *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t, uint64_t);
  void *v20;
  _UIDocumentPickerCell *v21;
  NSArray *v22;

  -[_UIDocumentPickerCell collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serviceViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    return (NSArray *)0;
  }
  -[_UIDocumentPickerCell collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serviceViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) == 0)
    return (NSArray *)0;
  availableActions = self->_availableActions;
  if (!availableActions)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 7);
    v17 = MEMORY[0x24BDAC760];
    v18 = 3221225472;
    v19 = __41___UIDocumentPickerCell_availableActions__block_invoke;
    v20 = &unk_24E43A8A8;
    v21 = self;
    v10 = v9;
    v22 = v10;
    v11 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x2207C9E60](&v17);
    v11[2](v11, 0, 0);
    v11[2](v11, 3, 1);
    v11[2](v11, 4, 2);
    v11[2](v11, 5, 3);
    v11[2](v11, 2, 4);
    v11[2](v11, 1, 5);
    -[_UIDocumentPickerCell actions](self, "actions", v17, v18, v19, v20, v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndex:", 6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v10, "addObject:", v13);

    v14 = self->_availableActions;
    self->_availableActions = v10;
    v15 = v10;

    availableActions = self->_availableActions;
  }
  return availableActions;
}

- (void)_deleteAction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[_UIDocumentPickerCell collectionView](self, "collectionView", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serviceViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerCell item](self, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerCell thumbnailView](self, "thumbnailView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performAction:item:view:completion:", 0, v5, v6, &__block_literal_global);

}

- (void)_infoAction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[_UIDocumentPickerCell collectionView](self, "collectionView", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serviceViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerCell item](self, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerCell thumbnailView](self, "thumbnailView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performAction:item:view:completion:", 2, v5, v6, &__block_literal_global_91);

}

- (void)_moreAction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[_UIDocumentPickerCell collectionView](self, "collectionView", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serviceViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerCell item](self, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerCell thumbnailView](self, "thumbnailView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performAction:item:view:completion:", 1, v5, v6, &__block_literal_global_92);

}

- (void)_renameAction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[_UIDocumentPickerCell collectionView](self, "collectionView", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serviceViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerCell item](self, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerCell thumbnailView](self, "thumbnailView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performAction:item:view:completion:", 3, v5, v6, &__block_literal_global_93);

}

- (void)_activityAction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[_UIDocumentPickerCell collectionView](self, "collectionView", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serviceViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerCell item](self, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerCell thumbnailView](self, "thumbnailView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performAction:item:view:completion:", 4, v5, v6, &__block_literal_global_94);

}

- (void)_moveAction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[_UIDocumentPickerCell collectionView](self, "collectionView", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serviceViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerCell item](self, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerCell thumbnailView](self, "thumbnailView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performAction:item:view:completion:", 5, v5, v6, &__block_literal_global_95);

}

- (void)updateActionGestureRecognizer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[_UIDocumentPickerCell actionGestureRecognizer](self, "actionGestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_UIDocumentPickerCell actionGestureRecognizer](self, "actionGestureRecognizer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerCell removeGestureRecognizer:](self, "removeGestureRecognizer:", v4);

  }
  if (!-[UICollectionViewTableCell isEditing](self, "isEditing"))
  {
    -[_UIDocumentPickerCell availableActions](self, "availableActions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[_UIDocumentPickerCell actionGestureRecognizer](self, "actionGestureRecognizer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BA0]), "initWithTarget:action:", self, sel__showActions_);
        -[_UIDocumentPickerCell setActionGestureRecognizer:](self, "setActionGestureRecognizer:", v7);

      }
      -[_UIDocumentPickerCell actionGestureRecognizer](self, "actionGestureRecognizer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentPickerCell addGestureRecognizer:](self, "addGestureRecognizer:", v8);

    }
  }
  -[_UIDocumentPickerCell actionGestureRecognizer](self, "actionGestureRecognizer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIDocumentPickerCell pickableDiagnosticGestureRecognizer](self, "pickableDiagnosticGestureRecognizer");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v9)
    -[_UIDocumentPickerCell removeGestureRecognizer:](self, "removeGestureRecognizer:", v10);
  else
    -[_UIDocumentPickerCell addGestureRecognizer:](self, "addGestureRecognizer:", v10);

}

- (void)_showActions:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  if (objc_msgSend(a3, "state") == 1)
  {
    -[_UIDocumentPickerCell becomeFirstResponder](self, "becomeFirstResponder");
    objc_msgSend(MEMORY[0x24BDF6BB0], "sharedMenuController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerCell availableActions](self, "availableActions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMenuItems:", v5);

    objc_msgSend(MEMORY[0x24BDF6BB0], "sharedMenuController");
    v6 = objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerCell bounds](self, "bounds");
    objc_msgSend((id)v6, "setTargetRect:inView:", self);

    objc_msgSend(MEMORY[0x24BDF6BB0], "sharedMenuController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v6) = objc_msgSend(v7, "isMenuVisible");

    if ((v6 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDF6BB0], "sharedMenuController");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setMenuVisible:animated:", 1, 1);

    }
  }
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  return objc_opt_respondsToSelector() & 1;
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  BOOL v11;
  _UIDocumentPickerCell *v12;
  void *v14;
  void *v15;

  v6 = a4;
  v11 = sel__deleteAction_ == a3
     || sel__moreAction_ == a3
     || sel__renameAction_ == a3
     || sel__activityAction_ == a3
     || sel__moveAction_ == a3
     || sel__infoAction_ == a3;
  if (v11
    || sel__showPickableDiagnostic == a3
    && CPIsInternalDevice()
    && (-[_UIDocumentPickerCell item](self, "item"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v14, "pickabilityReason"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v15,
        v14,
        v15))
  {
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (UILabel)subtitle2Label
{
  return self->_subtitle2Label;
}

- (void)setSubtitle2Label:(id)a3
{
  objc_storeStrong((id *)&self->_subtitle2Label, a3);
}

- (UILabel)subtitleJoiner
{
  return self->_subtitleJoiner;
}

- (void)setSubtitleJoiner:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleJoiner, a3);
}

- (UIImageView)tagView
{
  return self->_tagView;
}

- (void)setTagView:(id)a3
{
  objc_storeStrong((id *)&self->_tagView, a3);
}

- (UIImageView)thumbnailView
{
  return self->_thumbnailView;
}

- (void)setThumbnailView:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailView, a3);
}

- (UIProgressView)progressView
{
  return self->_progressView;
}

- (void)setProgressView:(id)a3
{
  objc_storeStrong((id *)&self->_progressView, a3);
}

- (int64_t)cellStyle
{
  return self->_cellStyle;
}

- (void)setCellStyle:(int64_t)a3
{
  self->_cellStyle = a3;
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
  objc_storeStrong((id *)&self->_actions, a3);
}

- (_UIDocumentPickerDocumentCollectionViewController)collectionView
{
  return (_UIDocumentPickerDocumentCollectionViewController *)objc_loadWeakRetained((id *)&self->_collectionView);
}

- (_UIDocumentPickerContainerItem)item
{
  return self->_item;
}

- (NSLayoutConstraint)thumbnailCenterWidthConstraint
{
  return self->_thumbnailCenterWidthConstraint;
}

- (void)setThumbnailCenterWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailCenterWidthConstraint, a3);
}

- (NSLayoutConstraint)thumbnailCenterHeightConstraint
{
  return self->_thumbnailCenterHeightConstraint;
}

- (void)setThumbnailCenterHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailCenterHeightConstraint, a3);
}

- (NSArray)gridConstraints
{
  return self->_gridConstraints;
}

- (void)setGridConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_gridConstraints, a3);
}

- (NSArray)tableConstraints
{
  return self->_tableConstraints;
}

- (void)setTableConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_tableConstraints, a3);
}

- (NSArray)indentedConstraints
{
  return self->_indentedConstraints;
}

- (void)setIndentedConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_indentedConstraints, a3);
}

- (NSArray)activeConstraints
{
  return self->_activeConstraints;
}

- (void)setActiveConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_activeConstraints, a3);
}

- (BOOL)isTransitioningLayout
{
  return self->_transitioningLayout;
}

- (void)setTransitioningLayout:(BOOL)a3
{
  self->_transitioningLayout = a3;
}

- (UIView)indentationHelperView
{
  return self->_indentationHelperView;
}

- (void)setIndentationHelperView:(id)a3
{
  objc_storeStrong((id *)&self->_indentationHelperView, a3);
}

- (NSLayoutConstraint)indentationConstraint
{
  return self->_indentationConstraint;
}

- (void)setIndentationConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_indentationConstraint, a3);
}

- (UIImageView)selectionView
{
  return self->_selectionView;
}

- (void)setSelectionView:(id)a3
{
  objc_storeStrong((id *)&self->_selectionView, a3);
}

- (UIView)selectionViewsThumbnailView
{
  return self->_selectionViewsThumbnailView;
}

- (void)setSelectionViewsThumbnailView:(id)a3
{
  objc_storeStrong((id *)&self->_selectionViewsThumbnailView, a3);
}

- (NSMutableArray)selectionViewConstraints
{
  return self->_selectionViewConstraints;
}

- (void)setSelectionViewConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_selectionViewConstraints, a3);
}

- (UILongPressGestureRecognizer)pickableDiagnosticGestureRecognizer
{
  return self->_pickableDiagnosticGestureRecognizer;
}

- (void)setPickableDiagnosticGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_pickableDiagnosticGestureRecognizer, a3);
}

- (UILongPressGestureRecognizer)actionGestureRecognizer
{
  return self->_actionGestureRecognizer;
}

- (void)setActionGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_actionGestureRecognizer, a3);
}

- (void)setAvailableActions:(id)a3
{
  objc_storeStrong((id *)&self->_availableActions, a3);
}

- (UIView)cachedSelectedBackgroundView
{
  return self->_cachedSelectedBackgroundView;
}

- (void)setCachedSelectedBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_cachedSelectedBackgroundView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedSelectedBackgroundView, 0);
  objc_storeStrong((id *)&self->_availableActions, 0);
  objc_storeStrong((id *)&self->_actionGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_pickableDiagnosticGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_selectionViewConstraints, 0);
  objc_storeStrong((id *)&self->_selectionViewsThumbnailView, 0);
  objc_storeStrong((id *)&self->_selectionView, 0);
  objc_storeStrong((id *)&self->_indentationConstraint, 0);
  objc_storeStrong((id *)&self->_indentationHelperView, 0);
  objc_storeStrong((id *)&self->_activeConstraints, 0);
  objc_storeStrong((id *)&self->_indentedConstraints, 0);
  objc_storeStrong((id *)&self->_tableConstraints, 0);
  objc_storeStrong((id *)&self->_gridConstraints, 0);
  objc_storeStrong((id *)&self->_thumbnailCenterHeightConstraint, 0);
  objc_storeStrong((id *)&self->_thumbnailCenterWidthConstraint, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_destroyWeak((id *)&self->_collectionView);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_thumbnailView, 0);
  objc_storeStrong((id *)&self->_tagView, 0);
  objc_storeStrong((id *)&self->_subtitleJoiner, 0);
  objc_storeStrong((id *)&self->_subtitle2Label, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
