@implementation FICompoundNodeIterator

- (id)next
{
  unint64_t fCurrentIterator;
  __end_ **begin;
  char v5;
  __end_ *v6;
  __end_ *v7;
  void *v8;

  fCurrentIterator = self->fCurrentIterator;
  begin = self->_subIterators.__begin_;
  if (fCurrentIterator >= self->_subIterators.var0 - begin)
  {
LABEL_8:
    v8 = 0;
  }
  else
  {
    v5 = 0;
    while (1)
    {
      v6 = begin[fCurrentIterator];
      v7 = v6;
      if ((v5 & 1) != 0)
        -[__end_ first](v6, "first");
      else
        -[__end_ next](v6, "next");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
        break;
      ++self->fCurrentIterator;

      fCurrentIterator = self->fCurrentIterator;
      begin = self->_subIterators.__begin_;
      v5 = 1;
      if (fCurrentIterator >= self->_subIterators.var0 - begin)
        goto LABEL_8;
    }

  }
  return v8;
}

- (BOOL)fullyPopulated
{
  __end_ **begin;
  __end_cap_ **var0;
  __end_cap_ **v4;
  int v5;
  BOOL v6;

  begin = self->_subIterators.__begin_;
  var0 = self->_subIterators.var0;
  if (begin == var0)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    v4 = begin + 1;
    do
    {
      v5 = -[__end_cap_ fullyPopulated](*(v4 - 1), "fullyPopulated");
      if (v5)
        v6 = v4 == var0;
      else
        v6 = 1;
      ++v4;
    }
    while (!v6);
  }
  return v5;
}

- (id)first
{
  __end_ **begin;
  __end_cap_ **var0;
  __end_ *v5;
  void *v6;

  self->fCurrentIterator = 0;
  begin = self->_subIterators.__begin_;
  var0 = self->_subIterators.var0;
  if (begin == var0)
  {
LABEL_4:
    v6 = 0;
  }
  else
  {
    while (1)
    {
      v5 = *begin;
      -[__end_ first](v5, "first");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
        break;
      ++self->fCurrentIterator;

      if (++begin == var0)
        goto LABEL_4;
    }

  }
  return v6;
}

- (void).cxx_destruct
{
  vector<NSObject<FINodeIterator> *, std::allocator<NSObject<FINodeIterator> *>> *p_subIterators;

  p_subIterators = &self->_subIterators;
  std::vector<TNodePtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_subIterators);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

- (FICompoundNodeIterator)initWithFINodes:(id)a3 options:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  char *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;
  _QWORD v13[17];
  id obj;
  _QWORD v15[8];
  _QWORD v16[5];
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  char **v21;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FICompoundNodeIterator;
  v7 = -[FICompoundNodeIterator init](&v12, sel_init);
  IDContainerIteratorAdaptor<NSArray<FINode *>>::NSForwardIterator<NSArray<FINode *>>::NSForwardIterator((uint64_t)&obj, v6);
  IDContainerIteratorAdaptor<NSArray<FINode *>>::IDContainerIteratorAdaptor((uint64_t)v13, -1, v6);
  v21 = (char **)(v7 + 8);
  while (obj != (id)v13[0] || v19 != v13[16])
  {
    v8 = *(id *)(v15[1] + 8 * v18);
    objc_msgSend(v8, "iteratorWithOptions:", v4);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    std::back_insert_iterator<std::vector<NSObject  {objcproto14FINodeIterator}* {__strong}>>::operator=[abi:ne180100](&v21, (uint64_t *)&v20);

    v9 = v18;
    if (v18 >= v17 - 1)
    {
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", v15, v16, 4);
      v9 = -1;
      v17 = v10;
      v18 = -1;
    }
    if (v16[4] != *(_QWORD *)v15[2])
    {
      objc_enumerationMutation(obj);
      v9 = v18;
    }
    v18 = v9 + 1;
    ++v19;
  }

  return (FICompoundNodeIterator *)v7;
}

- (unint64_t)estimatedSize
{
  __end_ **begin;
  __end_cap_ **var0;
  int v4;
  void *v5;

  begin = self->_subIterators.__begin_;
  var0 = self->_subIterators.var0;
  if (begin == var0)
    return 0;
  v4 = 0;
  do
  {
    v5 = *begin++;
    v4 += objc_msgSend(v5, "estimatedSize");
  }
  while (begin != var0);
  return v4;
}

@end
