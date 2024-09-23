@implementation AVStringPair

- (AVStringPair)initWithString:(id)a3 separatedByString:(id)a4
{
  id v6;
  id v7;
  AVStringPair *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  AVStringPair *v12;
  uint64_t v13;
  NSString *first;
  uint64_t v15;
  NSString *second;
  uint64_t v17;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v19.receiver = self;
    v19.super_class = (Class)AVStringPair;
    v8 = -[AVStringPair init](&v19, sel_init);
    if (v8)
    {
      if (objc_msgSend(v7, "length"))
      {
        v9 = objc_msgSend(v6, "rangeOfString:", v7);
        v11 = v10;
      }
      else
      {
        v11 = 0;
        v9 = 0x7FFFFFFFFFFFFFFFLL;
      }
      if (v11)
      {
        objc_msgSend(v6, "substringToIndex:", v9);
        v13 = objc_claimAutoreleasedReturnValue();
        first = v8->_first;
        v8->_first = (NSString *)v13;

        objc_msgSend(v6, "substringFromIndex:", v9 + v11);
        v15 = objc_claimAutoreleasedReturnValue();
        second = v8->_second;
        v8->_second = (NSString *)v15;
      }
      else
      {
        v17 = objc_msgSend(v6, "copy");
        second = v8->_first;
        v8->_first = (NSString *)v17;
      }

    }
    self = v8;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (NSString)key
{
  return self->_first;
}

- (NSString)value
{
  return self->_second;
}

- (BOOL)keyEquals:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  -[AVStringPair key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[AVStringPair key](self, "key");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "caseInsensitiveCompare:", v6) == 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)first
{
  return self->_first;
}

- (NSString)second
{
  return self->_second;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_second, 0);
  objc_storeStrong((id *)&self->_first, 0);
}

@end
