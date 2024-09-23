@implementation _UIDocumentPickerContainerItemThumbnailKey

- (_UIDocumentPickerContainerItemThumbnailKey)initWithPrimaryKey:(id)a3 size:(CGSize)a4 scale:(double)a5
{
  CGFloat height;
  CGFloat width;
  id v10;
  _UIDocumentPickerContainerItemThumbnailKey *v11;
  _UIDocumentPickerContainerItemThumbnailKey *v12;
  objc_super v14;

  height = a4.height;
  width = a4.width;
  v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_UIDocumentPickerContainerItemThumbnailKey;
  v11 = -[_UIDocumentPickerContainerItemThumbnailKey init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_primaryKey, a3);
    v12->_size.width = width;
    v12->_size.height = height;
    v12->_scale = a5;
  }

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  double v5;
  unint64_t v6;
  double v7;
  unint64_t v8;
  double v9;

  -[_UIDocumentPickerContainerItemThumbnailKey primaryKey](self, "primaryKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[_UIDocumentPickerContainerItemThumbnailKey size](self, "size");
  v6 = (unint64_t)v5 - v4 + 32 * v4;
  -[_UIDocumentPickerContainerItemThumbnailKey size](self, "size");
  v8 = (unint64_t)v7 - v6 + 32 * v6;
  -[_UIDocumentPickerContainerItemThumbnailKey scale](self, "scale");
  return (unint64_t)v9 - v8 + 32 * v8 + 923521;
}

- (BOOL)isEqual:(id)a3
{
  _UIDocumentPickerContainerItemThumbnailKey *v4;
  _UIDocumentPickerContainerItemThumbnailKey *v5;
  _UIDocumentPickerContainerItemThumbnailKey *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  BOOL v14;
  double v15;
  double v16;
  double v17;
  double v18;

  v4 = (_UIDocumentPickerContainerItemThumbnailKey *)a3;
  v5 = v4;
  if (self == v4)
  {
    v14 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    -[_UIDocumentPickerContainerItemThumbnailKey primaryKey](self, "primaryKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerContainerItemThumbnailKey primaryKey](v6, "primaryKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      -[_UIDocumentPickerContainerItemThumbnailKey size](self, "size");
      v10 = v9;
      v12 = v11;
      -[_UIDocumentPickerContainerItemThumbnailKey size](v6, "size");
      v14 = 0;
      if (v10 == v15 && v12 == v13)
      {
        -[_UIDocumentPickerContainerItemThumbnailKey scale](self, "scale");
        v17 = v16;
        -[_UIDocumentPickerContainerItemThumbnailKey scale](v6, "scale");
        v14 = v17 == v18;
      }
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (NSObject)primaryKey
{
  return self->_primaryKey;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)scale
{
  return self->_scale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryKey, 0);
}

@end
