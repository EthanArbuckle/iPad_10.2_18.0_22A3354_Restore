@implementation CAMVideoThumbnailOutputConfiguration

- (CAMVideoThumbnailOutputConfiguration)initWithThumbnailSize:(CGSize)a3 filters:(id)a4
{
  CGFloat height;
  CGFloat width;
  id v8;
  uint64_t v9;
  id v10;
  objc_super v12;

  height = a3.height;
  width = a3.width;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CAMVideoThumbnailOutputConfiguration;
  -[CAMVideoThumbnailOutputConfiguration self](&v12, sel_self);
  v9 = objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    *(CGFloat *)(v9 + 16) = width;
    *(CGFloat *)(v9 + 24) = height;
    objc_storeStrong((id *)(v9 + 8), a4);
    v10 = (id)v9;
  }

  return (CAMVideoThumbnailOutputConfiguration *)v9;
}

- (CGSize)thumbnailSize
{
  double width;
  double height;
  CGSize result;

  width = self->_thumbnailSize.width;
  height = self->_thumbnailSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (NSArray)filters
{
  return self->_filters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filters, 0);
}

@end
