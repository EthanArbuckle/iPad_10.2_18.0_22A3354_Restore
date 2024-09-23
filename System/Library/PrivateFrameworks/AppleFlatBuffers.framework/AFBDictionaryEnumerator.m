@implementation AFBDictionaryEnumerator

- (AFBDictionaryEnumerator)initWithDictionary:(id)a3
{
  id v5;
  AFBDictionaryEnumerator *v6;
  AFBDictionaryEnumerator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFBDictionaryEnumerator;
  v6 = -[AFBDictionaryEnumerator init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dict, a3);
    v7->_index = 0;
  }

  return v7;
}

- (id)nextObject
{
  unint64_t index;
  AFBDictionary *dict;
  void *v5;

  index = self->_index;
  if (index >= -[AFBDictionary count](self->_dict, "count"))
  {
    v5 = 0;
  }
  else
  {
    dict = self->_dict;
    ++self->_index;
    -[AFBDictionary keyAtIndex:](dict);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dict, 0);
}

@end
