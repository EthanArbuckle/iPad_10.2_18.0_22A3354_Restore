@implementation _NTKLegacySidecarPhotosReader

- (_NTKLegacySidecarPhotosReader)initWithResourceDirectory:(id)a3
{
  id v4;
  _NTKLegacySidecarPhotosReader *v5;
  uint64_t v6;
  NSMutableArray *photos;
  NTKPhoto *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_NTKLegacySidecarPhotosReader;
  v5 = -[NTKPhotosReader initWithResourceDirectory:](&v10, sel_initWithResourceDirectory_, v4);
  if (v5)
  {
    v6 = objc_opt_new();
    photos = v5->_photos;
    v5->_photos = (NSMutableArray *)v6;

    if (v4)
    {
      v8 = -[NTKPhoto initWithLegacySidecar:]([NTKPhoto alloc], "initWithLegacySidecar:", v4);
      if (v8)
        -[NSMutableArray addObject:](v5->_photos, "addObject:", v8);

    }
  }

  return v5;
}

- (unint64_t)count
{
  return -[NSMutableArray count](self->_photos, "count");
}

- (id)objectAtIndex:(unint64_t)a3
{
  void *v5;

  if (-[NSMutableArray count](self->_photos, "count") <= a3)
  {
    v5 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_photos, "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photos, 0);
}

@end
