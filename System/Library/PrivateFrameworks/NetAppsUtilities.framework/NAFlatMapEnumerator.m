@implementation NAFlatMapEnumerator

- (NAFlatMapEnumerator)initWithEnumerator:(id)a3 map:(id)a4
{
  id v7;
  id v8;
  NAFlatMapEnumerator *v9;
  NAFlatMapEnumerator *v10;
  uint64_t v11;
  id map;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NAFlatMapEnumerator;
  v9 = -[NAFlatMapEnumerator init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_enumerator, a3);
    v11 = objc_msgSend(v8, "copy");
    map = v10->_map;
    v10->_map = (id)v11;

  }
  return v10;
}

- (id)nextObject
{
  void (**v3)(_QWORD, _QWORD);
  void *v4;
  void *v5;
  void *v6;

  -[NAFlatMapEnumerator map](self, "map");
  v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[NAFlatMapEnumerator enumerator](self, "enumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nextObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v3)[2](v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)allObjects
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[NAFlatMapEnumerator enumerator](self, "enumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NAFlatMapEnumerator map](self, "map");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_map:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSEnumerator)enumerator
{
  return self->_enumerator;
}

- (id)map
{
  return self->_map;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_map, 0);
  objc_storeStrong((id *)&self->_enumerator, 0);
}

@end
