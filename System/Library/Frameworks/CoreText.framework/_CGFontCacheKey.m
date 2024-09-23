@implementation _CGFontCacheKey

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_CGFontCacheKey;
  -[_CGFontCacheKey dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v13;
  unint64_t hash;
  NSURL *url;
  int v16;
  double opticalSize;
  double v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if (self == a3)
  {
    LOBYTE(v16) = 1;
  }
  else
  {
    v20 = v9;
    v21 = v5;
    v22 = v4;
    v23 = v3;
    if (a3
      && (v13 = objc_opt_class(), v13 == objc_opt_class())
      && (hash = self->_hash, hash == objc_msgSend(a3, "hash")))
    {
      url = self->_url;
      if (url == (NSURL *)objc_msgSend(a3, "url")
        || (v16 = -[NSURL isEqual:](self->_url, "isEqual:", objc_msgSend(a3, "url"))) != 0)
      {
        opticalSize = self->_opticalSize;
        objc_msgSend(a3, "opticalSize", v10, v20, v6, v21, v22, v23, v7, v8);
        LOBYTE(v16) = opticalSize == v18;
      }
    }
    else
    {
      LOBYTE(v16) = 0;
    }
  }
  return v16;
}

- (unint64_t)hash
{
  return self->_hash;
}

- (NSURL)url
{
  return self->_url;
}

- (double)opticalSize
{
  return self->_opticalSize;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%g"), self->_url, *(_QWORD *)&self->_opticalSize);
}

@end
