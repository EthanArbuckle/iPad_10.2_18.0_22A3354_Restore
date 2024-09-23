@implementation NBURLCanonicalizer

- (NBURLCanonicalizer)init
{
  NBURLCanonicalizer *v2;
  NBObjCURLCanonicalizer *v3;
  NBObjCURLCanonicalizer *canonicalizer;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NBURLCanonicalizer;
  v2 = -[NBURLCanonicalizer init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(NBObjCURLCanonicalizer);
    canonicalizer = v2->_canonicalizer;
    v2->_canonicalizer = v3;

  }
  return v2;
}

- (id)canonicalizedURLForURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NBURLCanonicalizer canonicalizer](self, "canonicalizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "canonicalizedURLForURL:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NBObjCURLCanonicalizer)canonicalizer
{
  return self->_canonicalizer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_canonicalizer, 0);
}

@end
