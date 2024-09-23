@implementation BMPathEnumerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
}

- (id)navigateDown
{
  NSUInteger length;
  NSUInteger v4;
  id v5;
  NSUInteger v6;
  uint64_t v7;
  void *v8;
  void *v9;

  length = self->_range.length;
  if (length)
  {
    v4 = length + self->_range.location + 1;
    if (v4 > -[NSString length](self->_path, "length"))
    {
      v5 = 0;
      return v5;
    }
  }
  else
  {
    -[NSString length](self->_path, "length");
    v4 = 0;
  }
  v6 = -[NSString length](self->_path, "length");
  v7 = -[NSString rangeOfString:options:range:](self->_path, "rangeOfString:options:range:", CFSTR("/"), 2, v4, v6 - v4);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    v6 = v7;
  -[NSString substringWithRange:](self->_path, "substringWithRange:", v4, v6 - v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  self->_range.location = 0;
  self->_range.length = v6;
  if (objc_msgSend(v8, "length"))
    v9 = v8;
  else
    v9 = 0;
  v5 = v9;

  return v5;
}

- (id)peekPath
{
  void *v2;

  if (self->_range.length)
  {
    -[NSString substringWithRange:](self->_path, "substringWithRange:", self->_range.location);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (BMPathEnumerator)initWithPath:(id)a3
{
  id v4;
  BMPathEnumerator *v5;
  uint64_t v6;
  BMPathEnumerator *v7;
  NSString *path;
  uint64_t v9;
  objc_super v11;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v11.receiver = self;
    v11.super_class = (Class)BMPathEnumerator;
    v5 = -[BMPathEnumerator init](&v11, sel_init);
    if (v5)
    {
      if (objc_msgSend(v4, "hasSuffix:", CFSTR("/")))
      {
        objc_msgSend(v4, "substringToIndex:", objc_msgSend(v4, "length") - 1);
        v6 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = objc_msgSend(v4, "copy");
      }
      path = v5->_path;
      v5->_path = (NSString *)v6;

      v9 = -[NSString length](v5->_path, "length");
      v5->_range.location = 0;
      v5->_range.length = v9;
    }
    self = v5;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)navigateUp
{
  _NSRange *p_range;
  NSUInteger v4;
  void *v5;
  void *v6;

  p_range = &self->_range;
  v4 = -[NSString rangeOfString:options:range:](self->_path, "rangeOfString:options:range:", CFSTR("/"), 6, self->_range.location, self->_range.length);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
    p_range->location = 0;
    p_range->length = 0;
  }
  else
  {
    self->_range.location = 0;
    self->_range.length = v4;
    -[NSString substringWithRange:](self->_path, "substringWithRange:", 0, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastPathComponent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

@end
