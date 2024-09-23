@implementation AVMediaDataStorage

- (AVMediaDataStorage)init
{
  return -[AVMediaDataStorage initWithURL:options:](self, "initWithURL:options:", 0, 0);
}

- (AVMediaDataStorage)initWithURL:(NSURL *)URL options:(NSDictionary *)options
{
  NSURL *v6;
  AVMediaDataStorage *v7;
  AVMediaDataStorageInternal *v8;
  AVMediaDataStorageInternal *mediaDataStorageInternal;
  AVMediaDataStorageInternal *v10;
  AVMediaDataStorage *v11;
  objc_super v13;

  v6 = URL;
  v13.receiver = self;
  v13.super_class = (Class)AVMediaDataStorage;
  v7 = -[AVMediaDataStorage init](&v13, sel_init);
  if (v7)
  {
    v8 = objc_alloc_init(AVMediaDataStorageInternal);
    mediaDataStorageInternal = v7->_mediaDataStorageInternal;
    v7->_mediaDataStorageInternal = v8;

    v10 = v7->_mediaDataStorageInternal;
    if (!v10)
    {
      v11 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v10->URL, URL);
  }
  v11 = v7;
LABEL_6:

  return v11;
}

- (NSURL)URL
{
  return self->_mediaDataStorageInternal->URL;
}

- (BOOL)isEqual:(id)a3
{
  AVMediaDataStorage *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (AVMediaDataStorage *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[AVMediaDataStorage URL](self, "URL");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVMediaDataStorage URL](v4, "URL");
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
  objc_super v3;

  if (self->_mediaDataStorageInternal->URL)
    return CFHash(self->_mediaDataStorageInternal->URL);
  v3.receiver = self;
  v3.super_class = (Class)AVMediaDataStorage;
  return -[AVMediaDataStorage hash](&v3, sel_hash);
}

- (id)description
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
  -[AVMediaDataStorage URL](self, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, URL = %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaDataStorageInternal, 0);
}

@end
