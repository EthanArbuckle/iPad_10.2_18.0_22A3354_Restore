@implementation _UIDocumentPickerContainerContainerItem

- (_UIDocumentPickerContainerContainerItem)initWithContainer:(id)a3
{
  id v5;
  _UIDocumentPickerContainerContainerItem *v6;
  _UIDocumentPickerContainerContainerItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIDocumentPickerContainerContainerItem;
  v6 = -[_UIDocumentPickerContainerItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_container, a3);

  return v7;
}

- (BRContainer)container
{
  return self->_container;
}

- (int64_t)type
{
  return 2;
}

- (id)title
{
  BRContainer *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v2 = self->_container;
  -[BRContainer localizedName](v2, "localizedName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[BRContainer localizedName](v2, "localizedName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[BRContainer identifier](v2, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "rangeOfString:options:", CFSTR("."), 4);
    v8 = v7;

    -[BRContainer identifier](v2, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v9;
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v9, "substringFromIndex:", v6 + v8);
      v10 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v10;
    }
  }

  return v4;
}

- (void)_modelChanged
{
  void *v3;
  void *v4;
  NSString *v5;
  NSString *cachedSubtitle;
  id v7;

  -[_UIDocumentPickerContainerItem model](self, "model");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "modelObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerContainerItem _formattedSubtitleForNumberOfItems:](self, "_formattedSubtitleForNumberOfItems:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (NSString *)objc_msgSend(v4, "copy");
  cachedSubtitle = self->_cachedSubtitle;
  self->_cachedSubtitle = v5;

}

- (id)subtitle
{
  return self->_cachedSubtitle;
}

- (id)url
{
  return (id)-[BRContainer documentsURL](self->_container, "documentsURL");
}

- (id)_blockingThumbnailWithSize:(CGSize)a3 scale:(double)a4 wantsBorder:(BOOL *)a5
{
  double height;
  double width;
  void *v9;
  void *v10;
  void *v11;

  height = a3.height;
  width = a3.width;
  if (a5)
    *a5 = 0;
  v9 = (void *)objc_opt_class();
  -[BRContainer documentsURL](self->_container, "documentsURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_blockingFolderIconForURL:container:size:scale:", v10, self->_container, width, height, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)modificationDate
{
  void *v2;
  void *v3;

  -[_UIDocumentPickerContainerContainerItem container](self, "container");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastServerUpdate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)sortPath
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x2207C9CBC](self, a2);
  -[_UIDocumentPickerContainerContainerItem title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingString:", CFSTR("/"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_cachedSubtitle, 0);
}

@end
