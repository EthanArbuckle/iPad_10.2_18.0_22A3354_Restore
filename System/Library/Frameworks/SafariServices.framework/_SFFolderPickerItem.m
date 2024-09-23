@implementation _SFFolderPickerItem

- (id)_initWithBookmark:(id)a3 syntheticFolder:(id)a4 depth:(unint64_t)a5
{
  id v9;
  id v10;
  _SFFolderPickerItem *v11;
  _SFFolderPickerItem *v12;
  _SFFolderPickerItem *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_SFFolderPickerItem;
  v11 = -[_SFFolderPickerItem init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_bookmark, a3);
    objc_storeStrong((id *)&v12->_syntheticFolder, a4);
    v12->_depth = a5;
    v13 = v12;
  }

  return v12;
}

- (NSString)title
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[SFSyntheticBookmarkFolder title](self->_syntheticFolder, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[WebBookmark localizedTitle](self->_bookmark, "localizedTitle");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSString *)v6;
}

- (WebBookmark)bookmark
{
  return self->_bookmark;
}

- (SFSyntheticBookmarkFolder)syntheticFolder
{
  return self->_syntheticFolder;
}

- (unint64_t)depth
{
  return self->_depth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syntheticFolder, 0);
  objc_storeStrong((id *)&self->_bookmark, 0);
}

@end
