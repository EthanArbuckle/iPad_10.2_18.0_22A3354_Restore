@implementation MUBrowseCategoryItem

- (MUBrowseCategoryItem)initWithCategory:(id)a3 nightMode:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  MUBrowseCategoryItem *v8;
  void *v9;
  uint64_t v10;
  NSString *title;
  uint64_t v12;
  UIImage *image;
  objc_super v15;

  v4 = a4;
  v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MUBrowseCategoryItem;
  v8 = -[MUBrowseCategoryItem init](&v15, sel_init);
  if (v8)
  {
    objc_msgSend(v7, "shortDisplayString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    title = v8->_title;
    v8->_title = (NSString *)v10;

    -[MUBrowseCategoryItem imageWithSearchCategory:nightMode:](v8, "imageWithSearchCategory:nightMode:", v7, v4);
    v12 = objc_claimAutoreleasedReturnValue();
    image = v8->_image;
    v8->_image = (UIImage *)v12;

    objc_storeStrong((id *)&v8->_searchCategory, a3);
  }

  return v8;
}

- (id)imageWithSearchCategory:(id)a3 nightMode:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;

  v5 = (void *)MEMORY[0x1E0CC17D0];
  objc_msgSend(a3, "styleAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "nativeScale");
  LOBYTE(v10) = a4;
  objc_msgSend(v5, "imageForStyle:size:forScale:format:transparent:transitMode:isCarplay:nightMode:", v6, 4, 1, 0, 0, 0, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)title
{
  return self->_title;
}

- (UIImage)image
{
  return self->_image;
}

- (GEOSearchCategory)searchCategory
{
  return self->_searchCategory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchCategory, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
