@implementation NBURLHasher

- (NBURLHasher)init
{
  NBURLHasher *v2;
  NBObjCURLHasher *v3;
  NBObjCURLHasher *hasher;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NBURLHasher;
  v2 = -[NBURLHasher init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(NBObjCURLHasher);
    hasher = v2->_hasher;
    v2->_hasher = v3;

  }
  return v2;
}

- (id)hashForURL:(id)a3 maxLength:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[NBURLHasher hasher](self, "hasher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hashForURL:maxLength:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NBObjCURLHasher)hasher
{
  return self->_hasher;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hasher, 0);
}

@end
