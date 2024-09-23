@implementation _UIDocumentPickerDocumentCell

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIDocumentPickerDocumentCell;
  -[_UIDocumentPickerCell prepareForReuse](&v3, sel_prepareForReuse);
  -[_UIDocumentPickerCell setItem:](self, "setItem:", 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIDocumentPickerDocumentCell;
  -[_UIDocumentPickerCell traitCollectionDidChange:](&v5, sel_traitCollectionDidChange_, a3);
  -[_UIDocumentPickerDocumentCell window](self, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[_UIDocumentPickerDocumentCell updateContents](self, "updateContents");
}

- (void)reloadItem:(BOOL)a3
{
  if (a3)
    -[_UIDocumentPickerDocumentCell updateThumbnail](self, "updateThumbnail");
  else
    -[_UIDocumentPickerDocumentCell updateContents](self, "updateContents");
}

- (void)updateContents
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
  double v14;
  void *v15;
  void *v16;
  id v17;

  -[_UIDocumentPickerCell item](self, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerCell titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  -[_UIDocumentPickerCell item](self, "item");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subtitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerCell subtitleLabel](self, "subtitleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v7);

  -[_UIDocumentPickerCell item](self, "item");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "subtitle2");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerCell subtitle2Label](self, "subtitle2Label");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v10);

  -[_UIDocumentPickerCell item](self, "item");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerDocumentCell traitCollection](self, "traitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "displayScale");
  objc_msgSend(v12, "tagBlipsWithHeight:scale:", 12.0, v14);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v17, "imageWithAlignmentRectInsets:", 0.0, 0.0, 1.5, -4.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerCell tagView](self, "tagView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setImage:", v15);

  }
  -[_UIDocumentPickerDocumentCell updateThumbnail](self, "updateThumbnail");

}

- (void)updateThumbnail
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  id v19;

  -[_UIDocumentPickerDocumentCell traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayScale");
  v5 = v4;

  if (v5 != 0.0)
  {
    v6 = (void *)objc_opt_class();
    -[_UIDocumentPickerDocumentCell traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "thumbnailSizeForTraits:cellStyle:", v7, -[_UIDocumentPickerCell cellStyle](self, "cellStyle"));
    v9 = v8;
    v11 = v10;

    -[_UIDocumentPickerCell item](self, "item");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerDocumentCell traitCollection](self, "traitCollection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "displayScale");
    objc_msgSend(v12, "thumbnailWithSize:scale:", v9, v11, v14);
    v19 = (id)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      -[_UIDocumentPickerCell thumbnailView](self, "thumbnailView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setImage:", v19);

    }
    -[_UIDocumentPickerCell item](self, "item");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "pickable"))
      v17 = 1.0;
    else
      v17 = 0.5;
    -[_UIDocumentPickerCell thumbnailView](self, "thumbnailView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAlpha:", v17);

  }
}

- (void)_showPickableDiagnostic
{
  uint64_t v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  -[_UIDocumentPickerCell item](self, "item");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "pickabilityReason");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = CPIsInternalDevice();

    if (!v5)
      return;
    v6 = (void *)MEMORY[0x24BDF67F0];
    -[_UIDocumentPickerCell item](self, "item");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "pickable"))
      v8 = CFSTR("Internal diagnostic: Item is pickable");
    else
      v8 = CFSTR("Internal diagnostic: Item is not pickable");
    -[_UIDocumentPickerCell item](self, "item");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pickabilityReason");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:", v8, v10, 1);
    v17 = (id)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x24BDF67E8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Bummer"), CFSTR("Bummer"), CFSTR("Localizable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "actionWithTitle:style:handler:", v13, 0, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addAction:", v14);

    -[_UIDocumentPickerDocumentCell window](self, "window");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "rootViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "presentViewController:animated:completion:", v17, 1, 0);

  }
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

@end
