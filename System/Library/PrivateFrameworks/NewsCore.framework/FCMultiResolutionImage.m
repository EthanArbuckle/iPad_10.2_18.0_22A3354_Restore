@implementation FCMultiResolutionImage

- (FCMultiResolutionImage)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCMultiResolutionImage init]";
    v9 = 2080;
    v10 = "FCMultiResolutionImage.m";
    v11 = 1024;
    v12 = 24;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCMultiResolutionImage init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCMultiResolutionImage)initWithConfigDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  FCMultiResolutionImage *v8;

  v4 = a3;
  FCAppConfigurationURLValue(v4, (uint64_t)CFSTR("image1x"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationURLValue(v4, (uint64_t)CFSTR("image2x"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationURLValue(v4, (uint64_t)CFSTR("image3x"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[FCMultiResolutionImage initWithImageURL1X:imageURL2X:imageURL3X:](self, "initWithImageURL1X:imageURL2X:imageURL3X:", v5, v6, v7);
  return v8;
}

- (FCMultiResolutionImage)initWithImageURL1X:(id)a3 imageURL2X:(id)a4 imageURL3X:(id)a5
{
  id v9;
  id v10;
  id v11;
  FCMultiResolutionImage *v12;
  FCMultiResolutionImage *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)FCMultiResolutionImage;
  v12 = -[FCMultiResolutionImage init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_imageURL1x, a3);
    objc_storeStrong((id *)&v13->_imageURL2x, a4);
    objc_storeStrong((id *)&v13->_imageURL3x, a5);
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;

  v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0DE7910];
    -[FCMultiResolutionImage imageURL1x](self, "imageURL1x");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageURL1x");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "nf_object:isEqualToObject:", v8, v9))
    {
      v10 = (void *)MEMORY[0x1E0DE7910];
      -[FCMultiResolutionImage imageURL2x](self, "imageURL2x");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "imageURL2x");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "nf_object:isEqualToObject:", v11, v12))
      {
        v13 = (void *)MEMORY[0x1E0DE7910];
        -[FCMultiResolutionImage imageURL3x](self, "imageURL3x");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "imageURL3x");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v13, "nf_object:isEqualToObject:", v14, v15);

      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[FCMultiResolutionImage imageURL1x](self, "imageURL1x");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[FCMultiResolutionImage imageURL2x](self, "imageURL2x");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[FCMultiResolutionImage imageURL3x](self, "imageURL3x");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (NSURL)imageURL1x
{
  return self->_imageURL1x;
}

- (void)setImageURL1x:(id)a3
{
  objc_storeStrong((id *)&self->_imageURL1x, a3);
}

- (NSURL)imageURL2x
{
  return self->_imageURL2x;
}

- (void)setImageURL2x:(id)a3
{
  objc_storeStrong((id *)&self->_imageURL2x, a3);
}

- (NSURL)imageURL3x
{
  return self->_imageURL3x;
}

- (void)setImageURL3x:(id)a3
{
  objc_storeStrong((id *)&self->_imageURL3x, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageURL3x, 0);
  objc_storeStrong((id *)&self->_imageURL2x, 0);
  objc_storeStrong((id *)&self->_imageURL1x, 0);
}

@end
