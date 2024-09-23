@implementation BPSBookmarkableArrayEnumerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_array, 0);
}

- (id)nextObject
{
  unint64_t index;
  void *v4;

  index = self->_index;
  if (index >= -[NSArray count](self->_array, "count"))
  {
    v4 = 0;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_array, "objectAtIndexedSubscript:", self->_index);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    ++self->_index;
  }
  return v4;
}

- (void)reset
{
  self->_index = 0;
}

- (id)bookmark
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_index);
}

- (BPSBookmarkableArrayEnumerator)initWithArray:(id)a3
{
  id v5;
  BPSBookmarkableArrayEnumerator *v6;
  BPSBookmarkableArrayEnumerator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BPSBookmarkableArrayEnumerator;
  v6 = -[BPSBookmarkableArrayEnumerator init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_array, a3);
    v7->_index = 0;
  }

  return v7;
}

- (id)validateBookmark:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3940]);
    v6 = objc_opt_class();
    v7 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("%@ expected bookmark of class %@, but received %@"), v6, objc_opt_class(), v3);
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v11 = *MEMORY[0x1E0CB2D50];
    v12[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("BiomePubSubError"), 2, v9);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (void)applyBookmark:(id)a3
{
  self->_index = objc_msgSend(a3, "unsignedIntegerValue");
}

@end
