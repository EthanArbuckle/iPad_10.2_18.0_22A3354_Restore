@implementation _CNLazyArrayEnumeratorSource

- (_CNLazyArrayEnumeratorSource)initWithEnumerator:(id)a3
{
  id v5;
  _CNLazyArrayEnumeratorSource *v6;
  _CNLazyArrayEnumeratorSource *v7;
  _CNLazyArrayEnumeratorSource *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNLazyArrayEnumeratorSource;
  v6 = -[_CNLazyArrayEnumeratorSource init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_enumerator, a3);
    v8 = v7;
  }

  return v7;
}

- (id)nextObject
{
  return -[NSEnumerator nextObject](self->_enumerator, "nextObject");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enumerator, 0);
}

@end
