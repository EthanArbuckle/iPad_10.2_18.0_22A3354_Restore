@implementation GKImageKey

+ (id)fileNameWithIdentifierInImageSource:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  __CFString *v10;
  __CFString *v11;
  double v12;
  void *v13;
  uint64_t v15;

  v3 = a3;
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageBrush");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "conformsToProtocol:", &unk_2550BFB20))
  {
    objc_msgSend(v5, "renderedImageIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingFormat:", CFSTR("-%@"), v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
  }
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceIdiom");

  v10 = CFSTR("~iphone");
  if (v9 == 1)
    v10 = CFSTR("~ipad");
  v11 = v10;
  objc_msgSend(v5, "scaleForInput:", 0);
  if (v12 >= 2.0)
    objc_msgSend(v4, "stringByAppendingFormat:", CFSTR("%@%@%@"), CFSTR("@2x"), v11, CFSTR(".gkpix"));
  else
    objc_msgSend(v4, "stringByAppendingFormat:", CFSTR("%@%@"), v11, CFSTR(".gkpix"), v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)keyForImageIdentifier:(id)a3 withImageSource:(id)a4
{
  id v6;
  id v7;
  GKImageKey *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(GKImageKey);
  objc_msgSend(a1, "fileNameWithIdentifierInImageSource:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKImageKey setBasename:](v8, "setBasename:", v9);
  -[GKImageKey setImageID:](v8, "setImageID:", v7);

  return v8;
}

- (NSString)filePath
{
  NSString *filePath;
  void *v4;
  NSString *v5;
  NSString *v6;

  filePath = self->_filePath;
  if (!filePath)
  {
    objc_msgSend((id)objc_opt_class(), "cacheDirectoryForImageID:", self->_imageID);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingPathComponent:", self->_basename);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_filePath;
    self->_filePath = v5;

    filePath = self->_filePath;
  }
  return filePath;
}

- (NSString)cacheKey
{
  NSString *cacheKey;
  NSString *v4;
  NSString *v5;

  cacheKey = self->_cacheKey;
  if (!cacheKey)
  {
    -[NSString stringByAppendingString:](self->_imageID, "stringByAppendingString:", self->_basename);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_cacheKey;
    self->_cacheKey = v4;

    cacheKey = self->_cacheKey;
  }
  return cacheKey;
}

- (NSString)basename
{
  return self->_basename;
}

- (void)setBasename:(id)a3
{
  objc_storeStrong((id *)&self->_basename, a3);
}

- (NSString)imageID
{
  return self->_imageID;
}

- (void)setImageID:(id)a3
{
  objc_storeStrong((id *)&self->_imageID, a3);
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

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageID, 0);
  objc_storeStrong((id *)&self->_basename, 0);
  objc_storeStrong((id *)&self->_cacheKey, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
}

@end
