@implementation NUArticleImageActivityItemSource

- (NUArticleImageActivityItemSource)initWithHeadline:(id)a3
{
  id v4;
  NUArticleImageActivityItemSource *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  UIImage *articleImage;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NUArticleImageActivityItemSource;
  v5 = -[NUArticleActivityItemSource initWithHeadline:](&v13, sel_initWithHeadline_, v4);
  if (v5)
  {
    FCThumbnailForHeadline();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x24BDF6AC8];
    objc_msgSend(v6, "thumbnailAssetHandle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "filePath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageWithContentsOfFile:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    articleImage = v5->_articleImage;
    v5->_articleImage = (UIImage *)v10;

  }
  return v5;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  void *v5;

  if (objc_msgSend(a4, "isEqualToString:", CFSTR("com.apple.mobilenotes.SharingExtension")))
  {
    -[NUArticleImageActivityItemSource articleImage](self, "articleImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (UIImage)articleImage
{
  return self->_articleImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_articleImage, 0);
}

@end
