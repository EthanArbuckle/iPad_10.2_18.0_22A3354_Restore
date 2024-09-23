@implementation MKHTTPContentRange

- (MKHTTPContentRange)initWithHeaderValue:(id)a3
{
  id v4;
  MKHTTPContentRange *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MKHTTPContentRange;
  v5 = -[MKHTTPContentRange init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("bytes"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count") == 2)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "componentsSeparatedByString:", CFSTR("/"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v8, "count") == 2)
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "integerValue");

        objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "componentsSeparatedByString:", CFSTR("-"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v6, "count") == 2)
        {
          objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "integerValue");

          objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "integerValue");

          v16 = v15 - v13 + 1;
        }
        else
        {
          v13 = 0;
          v16 = 0;
        }
      }
      else
      {
        v13 = 0;
        v16 = 0;
        v10 = 0;
        v6 = v8;
      }
    }
    else
    {
      v13 = 0;
      v16 = 0;
      v10 = 0;
    }

    -[MKHTTPContentRange setOffset:](v5, "setOffset:", v13);
    -[MKHTTPContentRange setLength:](v5, "setLength:", v16);
    -[MKHTTPContentRange setTotal:](v5, "setTotal:", v10);
  }

  return v5;
}

- (int64_t)offset
{
  return self->_offset;
}

- (void)setOffset:(int64_t)a3
{
  self->_offset = a3;
}

- (int64_t)length
{
  return self->_length;
}

- (void)setLength:(int64_t)a3
{
  self->_length = a3;
}

- (int64_t)total
{
  return self->_total;
}

- (void)setTotal:(int64_t)a3
{
  self->_total = a3;
}

@end
