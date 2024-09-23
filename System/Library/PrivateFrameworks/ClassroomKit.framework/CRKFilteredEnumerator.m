@implementation CRKFilteredEnumerator

- (CRKFilteredEnumerator)initWithEnumerator:(id)a3 filterBlock:(id)a4
{
  id v7;
  id v8;
  CRKFilteredEnumerator *v9;
  CRKFilteredEnumerator *v10;
  uint64_t v11;
  id filterBlock;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CRKFilteredEnumerator;
  v9 = -[CRKFilteredEnumerator init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_enumerator, a3);
    v11 = MEMORY[0x219A226E8](v8);
    filterBlock = v10->_filterBlock;
    v10->_filterBlock = (id)v11;

  }
  return v10;
}

- (id)nextObject
{
  void *v3;
  void *v4;
  void *v5;

  v3 = 0;
  do
  {
    v4 = v3;
    -[CRKFilteredEnumerator enumerator](self, "enumerator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "nextObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  while (-[CRKFilteredEnumerator shouldRejectItem:](self, "shouldRejectItem:", v3));
  return v3;
}

- (BOOL)shouldRejectItem:(id)a3
{
  id v4;
  uint64_t (**v5)(_QWORD, _QWORD);
  char v6;

  if (!a3)
    return 0;
  v4 = a3;
  -[CRKFilteredEnumerator filterBlock](self, "filterBlock");
  v5 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = ((uint64_t (**)(_QWORD, id))v5)[2](v5, v4);

  v6 = self ^ 1;
  return v6;
}

- (NSEnumerator)enumerator
{
  return self->_enumerator;
}

- (id)filterBlock
{
  return self->_filterBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_filterBlock, 0);
  objc_storeStrong((id *)&self->_enumerator, 0);
}

@end
