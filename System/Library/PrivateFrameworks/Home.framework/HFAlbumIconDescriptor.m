@implementation HFAlbumIconDescriptor

- (HFAlbumIconDescriptor)initWithImageData:(id)a3
{
  id v5;
  HFAlbumIconDescriptor *v6;
  HFAlbumIconDescriptor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFAlbumIconDescriptor;
  v6 = -[HFAlbumIconDescriptor init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_imageData, a3);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  HFAlbumIconDescriptor *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (HFAlbumIconDescriptor *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[HFAlbumIconDescriptor imageData](v4, "imageData");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFAlbumIconDescriptor imageData](self, "imageData");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HFAlbumIconDescriptor imageData](self, "imageData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)identifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFAlbumIconDescriptor imageData](self, "imageData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, \"%@\">"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)iconDescriptorByMergingWithIconDescriptor:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  HFAlbumIconDescriptor *v11;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7
    && (objc_msgSend(v7, "imageData"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        -[HFAlbumIconDescriptor imageData](self, "imageData"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v8, "isEqual:", v9),
        v9,
        v8,
        v10))
  {
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (int64_t)compare:(id)a3
{
  return 0;
}

- (BOOL)shouldForceLTR
{
  return self->_shouldForceLTR;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageData, 0);
}

@end
