@implementation _UIDocumentPickerCellFontManager

+ (id)sharedFontManager
{
  void *v2;
  _UIDocumentPickerCellFontManager *v3;
  void *v4;

  v2 = (void *)sharedFontManager_sharedInstance;
  if (!sharedFontManager_sharedInstance)
  {
    v3 = objc_alloc_init(_UIDocumentPickerCellFontManager);
    v4 = (void *)sharedFontManager_sharedInstance;
    sharedFontManager_sharedInstance = (uint64_t)v3;

    v2 = (void *)sharedFontManager_sharedInstance;
  }
  return v2;
}

- (_UIDocumentPickerCellFontManager)init
{
  _UIDocumentPickerCellFontManager *v2;
  _UIDocumentPickerCellFontManager *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIDocumentPickerCellFontManager;
  v2 = -[_UIDocumentPickerCellFontManager init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[_UIDocumentPickerCellFontManager cacheFonts](v2, "cacheFonts");
  return v3;
}

- (void)cacheFonts
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  +[_UIDocumentPickerCell _titleFontForTable:](_UIDocumentPickerCell, "_titleFontForTable:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerCellFontManager setTitleFontForTableLayout:](self, "setTitleFontForTableLayout:", v3);

  +[_UIDocumentPickerCell _subtitleFontForTable:](_UIDocumentPickerCell, "_subtitleFontForTable:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerCellFontManager setSubtitleFontForTableLayout:](self, "setSubtitleFontForTableLayout:", v4);

  +[_UIDocumentPickerCell _titleFontForTable:](_UIDocumentPickerCell, "_titleFontForTable:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerCellFontManager setTitleFontForGridLayout:](self, "setTitleFontForGridLayout:", v5);

  +[_UIDocumentPickerCell _subtitleFontForTable:](_UIDocumentPickerCell, "_subtitleFontForTable:", 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerCellFontManager setSubtitleFontForGridLayout:](self, "setSubtitleFontForGridLayout:", v6);

}

- (UIFont)titleFontForGridLayout
{
  return self->_titleFontForGridLayout;
}

- (void)setTitleFontForGridLayout:(id)a3
{
  objc_storeStrong((id *)&self->_titleFontForGridLayout, a3);
}

- (UIFont)subtitleFontForGridLayout
{
  return self->_subtitleFontForGridLayout;
}

- (void)setSubtitleFontForGridLayout:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleFontForGridLayout, a3);
}

- (UIFont)titleFontForTableLayout
{
  return self->_titleFontForTableLayout;
}

- (void)setTitleFontForTableLayout:(id)a3
{
  objc_storeStrong((id *)&self->_titleFontForTableLayout, a3);
}

- (UIFont)subtitleFontForTableLayout
{
  return self->_subtitleFontForTableLayout;
}

- (void)setSubtitleFontForTableLayout:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleFontForTableLayout, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleFontForTableLayout, 0);
  objc_storeStrong((id *)&self->_titleFontForTableLayout, 0);
  objc_storeStrong((id *)&self->_subtitleFontForGridLayout, 0);
  objc_storeStrong((id *)&self->_titleFontForGridLayout, 0);
}

@end
