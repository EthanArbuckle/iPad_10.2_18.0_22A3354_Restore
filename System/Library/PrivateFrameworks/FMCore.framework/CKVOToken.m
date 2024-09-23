@implementation CKVOToken

- (CKVOToken)initWithKeyPath:(id)a3 index:(int64_t)a4 block:(id)a5
{
  id v9;
  id v10;
  CKVOToken *v11;
  CKVOToken *v12;
  uint64_t v13;
  id block;
  objc_super v16;

  v9 = a3;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CKVOToken;
  v11 = -[CKVOToken init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_keypath, a3);
    v12->_index = a4;
    v13 = MEMORY[0x1CAA45B8C](v10);
    block = v12->_block;
    v12->_block = (id)v13;

  }
  return v12;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)CKVOToken;
  -[CKVOToken description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKVOToken keypath](self, "keypath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%@ #%ld)"), v4, v5, -[CKVOToken index](self, "index"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)keypath
{
  return self->_keypath;
}

- (int64_t)index
{
  return self->_index;
}

- (id)block
{
  return self->_block;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_keypath, 0);
}

@end
