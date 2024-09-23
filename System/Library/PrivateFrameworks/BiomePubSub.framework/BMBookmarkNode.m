@implementation BMBookmarkNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_upstreams, 0);
}

- (BOOL)isEqual:(id)a3
{
  BMBookmarkNode *v4;
  BMBookmarkNode *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;

  v4 = (BMBookmarkNode *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[BMBookmarkNode name](self, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[BMBookmarkNode name](v5, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {
        v10 = 1;
      }
      else
      {
        -[BMBookmarkNode name](self, "name");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[BMBookmarkNode name](v5, "name");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqual:", v9);

      }
      -[BMBookmarkNode value](self, "value");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[BMBookmarkNode value](v5, "value");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12 == v13)
      {
        v16 = 1;
      }
      else
      {
        -[BMBookmarkNode value](self, "value");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[BMBookmarkNode value](v5, "value");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "isEqual:", v15);

      }
      -[BMBookmarkNode upstreams](self, "upstreams");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[BMBookmarkNode upstreams](v5, "upstreams");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17 == v18)
      {
        v21 = 1;
      }
      else
      {
        -[BMBookmarkNode upstreams](self, "upstreams");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[BMBookmarkNode upstreams](v5, "upstreams");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v19, "isEqual:", v20);

      }
      v11 = v10 & v16 & v21;

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (BMBookmarkNode)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BMBookmarkNode *v10;

  v4 = (void *)MEMORY[0x1E0CB3510];
  v5 = a3;
  objc_msgSend(v4, "bm_allowedClassesForSecureCodingBMBookmark");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v6, CFSTR("value"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v6, CFSTR("upstreams"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[BMBookmarkNode initWithValue:upstreams:name:](self, "initWithValue:upstreams:name:", v7, v8, v9);
  return v10;
}

- (BMBookmarkNode)initWithValue:(id)a3 upstreams:(id)a4 name:(id)a5
{
  id v9;
  id v10;
  id v11;
  BMBookmarkNode *v12;
  BMBookmarkNode *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BMBookmarkNode;
  v12 = -[BMBookmarkNode init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_name, a5);
    objc_storeStrong((id *)&v13->_value, a3);
    objc_storeStrong((id *)&v13->_upstreams, a4);
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[BMBookmarkNode value](self, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[BMBookmarkNode value](self, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "encodeObject:forKey:", v5, CFSTR("value"));

  }
  -[BMBookmarkNode upstreams](self, "upstreams");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[BMBookmarkNode upstreams](self, "upstreams");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "encodeObject:forKey:", v7, CFSTR("upstreams"));

  }
  -[BMBookmarkNode name](self, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[BMBookmarkNode name](self, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "encodeObject:forKey:", v9, CFSTR("name"));

  }
}

- (BMBookmark)value
{
  return self->_value;
}

- (NSArray)upstreams
{
  return self->_upstreams;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)description
{
  return (NSString *)-[BMBookmarkNode descriptionAtLevel:](self, "descriptionAtLevel:", 1);
}

- (id)descriptionAtLevel:(int64_t)a3
{
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;

  v5 = (void *)objc_msgSend(&stru_1E554E0D0, "mutableCopy");
  v6 = (void *)objc_msgSend(&stru_1E554E0D0, "mutableCopy");
  if (a3 >= 1)
  {
    v7 = a3;
    do
    {
      objc_msgSend(v6, "appendString:", CFSTR("  "));
      --v7;
    }
    while (v7);
  }
  -[BMBookmarkNode name](self, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("%@\n"), v8);

  -[BMBookmarkNode upstreams](self, "upstreams");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    v11 = 0;
    v12 = a3 + 1;
    do
    {
      -[BMBookmarkNode upstreams](self, "upstreams");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v14, "descriptionAtLevel:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendFormat:", CFSTR("%@%@\n"), v6, v15);

      }
      else
      {
        objc_msgSend(v5, "appendFormat:", CFSTR("%@%@\n"), v6, v14);
      }

      ++v11;
      -[BMBookmarkNode upstreams](self, "upstreams");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");

    }
    while (v11 < v17);
  }
  v18 = (void *)objc_msgSend(v5, "copy");

  return v18;
}

- (void)setUpstreams:(id)a3
{
  objc_storeStrong((id *)&self->_upstreams, a3);
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

@end
