@implementation NAFilterEnumerator

- (NAFilterEnumerator)initWithEnumerator:(id)a3 filter:(id)a4
{
  id v7;
  id v8;
  NAFilterEnumerator *v9;
  NAFilterEnumerator *v10;
  uint64_t v11;
  id filter;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NAFilterEnumerator;
  v9 = -[NAFilterEnumerator init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_enumerator, a3);
    v11 = objc_msgSend(v8, "copy");
    filter = v10->_filter;
    v10->_filter = (id)v11;

  }
  return v10;
}

- (id)nextObject
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t (**v6)(_QWORD, _QWORD);
  int v7;
  id v8;

  v3 = 0;
  while (1)
  {
    v4 = v3;
    -[NAFilterEnumerator enumerator](self, "enumerator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "nextObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
      break;
    -[NAFilterEnumerator filter](self, "filter");
    v6 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v7 = ((uint64_t (**)(_QWORD, void *))v6)[2](v6, v3);

    if (v7)
    {
      v8 = v3;
      break;
    }
  }

  return v3;
}

- (id)allObjects
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[NAFilterEnumerator enumerator](self, "enumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NAFilterEnumerator filter](self, "filter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_filter:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSEnumerator)enumerator
{
  return self->_enumerator;
}

- (id)filter
{
  return self->_filter;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_filter, 0);
  objc_storeStrong((id *)&self->_enumerator, 0);
}

@end
