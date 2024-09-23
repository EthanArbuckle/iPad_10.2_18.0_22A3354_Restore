@implementation CNWrappedDictionary

- (CNWrappedDictionary)initWithDictionary:(id)a3
{
  id v4;
  CNWrappedDictionary *v5;
  uint64_t v6;
  NSDictionary *underlyingDictionary;
  CNWrappedDictionary *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNWrappedDictionary;
  v5 = -[CNWrappedDictionary init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    underlyingDictionary = v5->_underlyingDictionary;
    v5->_underlyingDictionary = (NSDictionary *)v6;

    v8 = v5;
  }

  return v5;
}

- (unint64_t)count
{
  return -[NSDictionary count](self->_underlyingDictionary, "count");
}

- (id)objectForKey:(id)a3
{
  return -[NSDictionary objectForKey:](self->_underlyingDictionary, "objectForKey:", a3);
}

- (id)keyEnumerator
{
  return -[NSDictionary keyEnumerator](self->_underlyingDictionary, "keyEnumerator");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingDictionary, 0);
}

@end
