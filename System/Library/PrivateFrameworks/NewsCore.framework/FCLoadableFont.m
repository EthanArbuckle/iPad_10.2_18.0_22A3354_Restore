@implementation FCLoadableFont

+ (FCLoadableFont)loadableFontWithName:(id)a3 url:(id)a4
{
  FCLoadableFont *v4;
  id v5;
  FCLoadableFont *v6;

  v4 = (FCLoadableFont *)a3;
  if (a3)
  {
    v5 = a4;
    v6 = v4;
    v4 = objc_alloc_init(FCLoadableFont);
    -[FCLoadableFont setFontName:](v4, "setFontName:", v6);

    -[FCLoadableFont setFontURL:](v4, "setFontURL:", v5);
  }
  return v4;
}

- (void)setFontURL:(id)a3
{
  objc_storeStrong((id *)&self->_fontURL, a3);
}

- (void)setFontName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)description
{
  FCDescription *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = -[FCDescription initWithObject:]([FCDescription alloc], "initWithObject:", self);
  -[FCLoadableFont fontName](self, "fontName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCDescription addField:value:](v3, "addField:value:", CFSTR("fontName"), v4);

  -[FCLoadableFont fontURL](self, "fontURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCDescription addField:value:](v3, "addField:value:", CFSTR("fontURL"), v6);

  -[FCDescription descriptionString](v3, "descriptionString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
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
  char v12;

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

  -[FCLoadableFont fontName](self, "fontName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fontName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", v8))
  {
    v9 = (void *)MEMORY[0x1E0DE7910];
    -[FCLoadableFont fontURL](self, "fontURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fontURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "nf_object:isEqualToObject:", v10, v11);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[FCLoadableFont fontName](self, "fontName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[FCLoadableFont fontURL](self, "fontURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (NSString)fontName
{
  return self->_fontName;
}

- (NSURL)fontURL
{
  return self->_fontURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontURL, 0);
  objc_storeStrong((id *)&self->_fontName, 0);
}

@end
