@implementation CNHeapObject

- (id)description
{
  void *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)CNHeapObject;
  -[CNHeapObject description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CNHeapObject count](self, "count");
  v6 = -[CNHeapObject bytes](self, "bytes");
  -[CNHeapObject className](self, "className");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNHeapObject binary](self, "binary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, %ld objects \t %ld bytes \t %@ \t %@"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)classAndBinaryKey
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  -[CNHeapObject className](self, "className");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[CNHeapObject binary](self, "binary"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    -[CNHeapObject className](self, "className");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNHeapObject binary](self, "binary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingString:", v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[CNHeapObject className](self, "className");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[CNHeapObject className](self, "className");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[CNHeapObject binary](self, "binary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        v8 = CFSTR("NoClassNameOrBinaryKey");
        return v8;
      }
      -[CNHeapObject binary](self, "binary");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (__CFString *)v10;
  }
  return v8;
}

- (NSString)className
{
  return self->_className;
}

- (void)setClassName:(id)a3
{
  objc_storeStrong((id *)&self->_className, a3);
}

- (NSString)binary
{
  return self->_binary;
}

- (void)setBinary:(id)a3
{
  objc_storeStrong((id *)&self->_binary, a3);
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (unint64_t)bytes
{
  return self->_bytes;
}

- (void)setBytes:(unint64_t)a3
{
  self->_bytes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_binary, 0);
  objc_storeStrong((id *)&self->_className, 0);
}

@end
