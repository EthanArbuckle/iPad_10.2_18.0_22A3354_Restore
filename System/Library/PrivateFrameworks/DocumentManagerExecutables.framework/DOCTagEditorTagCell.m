@implementation DOCTagEditorTagCell

- (DOCTagEditorTagCell)initWithFrame:(CGRect)a3
{
  DOCTagEditorTagCell *v3;
  DOCLargeTagView *v4;
  DOCLargeTagView *tagView;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)DOCTagEditorTagCell;
  v3 = -[DOCTagEditorTagCell initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(DOCLargeTagView);
    tagView = v3->_tagView;
    v3->_tagView = v4;

    -[DOCLargeTagView setTranslatesAutoresizingMaskIntoConstraints:](v3->_tagView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[DOCLargeTagView setSelectionType:](v3->_tagView, "setSelectionType:", 2);
    +[DOCTagAppearance pickerList](DOCTagAppearance, "pickerList");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cellContentHoverStyle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCLargeTagView setHoverStyle:](v3->_tagView, "setHoverStyle:", v7);

    -[DOCTagEditorTagCell setHoverStyle:](v3, "setHoverStyle:", 0);
    -[DOCTagEditorTagCell contentView](v3, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCTagEditorTagCell tagView](v3, "tagView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v9);

    +[DOCTagAppearance pickerList](DOCTagAppearance, "pickerList");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cellExternalMargins");

    -[DOCTagEditorTagCell tagView](v3, "tagView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    DOCConstraintsToResizeWithSuperviewSafeArea();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    DOCConstraintsWithPriority();
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v13);
  }
  return v3;
}

- (void)setTagValue:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DOCTagEditorTagCell tagView](self, "tagView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTagValue:", v4);

}

- (DOCTag)tagValue
{
  void *v2;
  void *v3;

  -[DOCTagEditorTagCell tagView](self, "tagView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tagValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (DOCTag *)v3;
}

- (void)setSelected:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DOCTagEditorTagCell;
  -[DOCTagEditorTagCell setSelected:](&v4, sel_setSelected_, a3);
  -[DOCTagEditorTagCell updateStyle](self, "updateStyle");
}

- (void)setMixedSelection:(BOOL)a3
{
  if (self->_mixedSelection != a3)
  {
    self->_mixedSelection = a3;
    -[DOCTagEditorTagCell updateStyle](self, "updateStyle");
  }
}

- (void)updateStyle
{
  void *v3;
  uint64_t v4;
  _BOOL4 v5;
  id v6;

  if (-[DOCTagEditorTagCell isSelected](self, "isSelected"))
  {
    -[DOCTagEditorTagCell tagView](self, "tagView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v3;
    v4 = 0;
  }
  else
  {
    v5 = -[DOCTagEditorTagCell mixedSelection](self, "mixedSelection");
    -[DOCTagEditorTagCell tagView](self, "tagView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v3;
    if (v5)
      v4 = 1;
    else
      v4 = 2;
  }
  objc_msgSend(v3, "setSelectionType:", v4);

}

- (BOOL)mixedSelection
{
  return self->_mixedSelection;
}

- (DOCLargeTagView)tagView
{
  return self->_tagView;
}

- (void)setTagView:(id)a3
{
  objc_storeStrong((id *)&self->_tagView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagView, 0);
}

@end
