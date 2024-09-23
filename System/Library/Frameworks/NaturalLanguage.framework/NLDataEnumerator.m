@implementation NLDataEnumerator

- (NLDataEnumerator)initWithDataProvider:(id)a3 numberGenerator:(id)a4
{
  id v7;
  id v8;
  NLDataEnumerator *v9;
  NLDataEnumerator *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NLDataEnumerator;
  v9 = -[NLDataEnumerator init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dataProvider, a3);
    v10->_idx = 0;
    objc_storeStrong((id *)&v10->_generator, a4);
  }

  return v10;
}

- (NLDataEnumerator)initWithDataProvider:(id)a3
{
  id v4;
  NLNumberGenerator *v5;
  NLDataEnumerator *v6;

  v4 = a3;
  v5 = objc_alloc_init(NLNumberGenerator);
  v6 = -[NLDataEnumerator initWithDataProvider:numberGenerator:](self, "initWithDataProvider:numberGenerator:", v4, v5);

  return v6;
}

- (id)nextInstance
{
  unint64_t idx;
  void *v4;

  idx = self->_idx;
  while (idx < -[NLDataProvider numberOfInstances](self->_dataProvider, "numberOfInstances"))
  {
    -[NLDataEnumerator instanceAtIndex:](self, "instanceAtIndex:", self->_idx);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    idx = self->_idx + 1;
    self->_idx = idx;
    if (v4)
      return v4;
  }
  v4 = 0;
  return v4;
}

- (id)instanceAtIndex:(unint64_t)a3
{
  unint64_t v3;
  NSMutableData *shuffleData;
  void *v6;
  void *v7;

  v3 = a3;
  shuffleData = self->_shuffleData;
  if (shuffleData)
    v3 = *(unsigned int *)(-[NSMutableData bytes](shuffleData, "bytes") + 4 * a3);
  -[NLDataEnumerator dataProvider](self, "dataProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "instanceAtIndex:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)rewind
{
  self->_idx = 0;
}

- (void)rewindAndShuffle:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  -[NLDataEnumerator rewind](self, "rewind");
  if (v3)
    -[NLDataEnumerator shuffle](self, "shuffle");
}

- (NLDataProvider)dataProvider
{
  return self->_dataProvider;
}

- (unint64_t)index
{
  return self->_idx;
}

- (void)shuffle
{
  void *v3;
  unint64_t v4;
  NSMutableData *shuffleData;
  NSMutableData *v6;
  NSMutableData *v7;
  _DWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int v15;

  -[NLDataEnumerator dataProvider](self, "dataProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfInstances");

  shuffleData = self->_shuffleData;
  if (shuffleData)
    goto LABEL_6;
  v6 = (NSMutableData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 4 * v4);
  v7 = self->_shuffleData;
  self->_shuffleData = v6;

  v8 = -[NSMutableData mutableBytes](self->_shuffleData, "mutableBytes");
  if (v4)
  {
    v9 = 0;
    do
    {
      v8[v9] = v9;
      ++v9;
    }
    while (v4 > v9);
  }
  shuffleData = self->_shuffleData;
  if (shuffleData)
  {
LABEL_6:
    v10 = -[NSMutableData mutableBytes](shuffleData, "mutableBytes");
    if (v4 >= 2)
    {
      v11 = v10;
      v12 = v10 - 4;
      do
      {
        v13 = v4 - 1;
        v14 = -[NLNumberGenerator numberInRange:](self->_generator, "numberInRange:", 0, v4);
        if (v4 - 1 != v14)
        {
          v15 = *(_DWORD *)(v12 + 4 * v4);
          *(_DWORD *)(v12 + 4 * v4) = *(_DWORD *)(v11 + 4 * v14);
          *(_DWORD *)(v11 + 4 * v14) = v15;
        }
        --v4;
      }
      while (v13 > 1);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shuffleData, 0);
  objc_storeStrong((id *)&self->_generator, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
}

@end
