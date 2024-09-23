@implementation EFMutableInt64Set

- (void)removeAllIndexes
{
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *p_pair1;

  p_pair1 = &self->super._underlying.__tree_.__pair1_;
  std::__tree<long long>::destroy((uint64_t)&self->super._underlying, (_QWORD *)self->super._underlying.__tree_.__pair1_.__value_.__left_);
  p_pair1[-1].__value_.__left_ = p_pair1;
  p_pair1->__value_.__left_ = 0;
  p_pair1[1].__value_.__left_ = 0;
}

- (void)addIndex:(int64_t)a3
{
  uint64_t v3;

  v3 = a3;
  std::__tree<long long>::__emplace_unique_key_args<long long,long long const&>((uint64_t **)&self->super._underlying, &v3, &v3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3;
  uint64_t v5[3];

  memset(v5, 170, sizeof(v5));
  std::set<long long>::set[abi:ne180100](v5, (uint64_t)&self->super._underlying);
  v3 = -[EFInt64Set _initWithUnderlyingSet:]([EFInt64Set alloc], "_initWithUnderlyingSet:", v5);
  std::__tree<long long>::destroy((uint64_t)v5, (_QWORD *)v5[1]);
  return v3;
}

- (void)addIndexes:(id)a3
{
  if (a3)
    std::set<long long>::insert[abi:ne180100]<std::__tree_const_iterator<long long,std::__tree_node<long long,void *> *,long>>((uint64_t *)&self->super._underlying, *((_QWORD **)a3 + 1), (_QWORD *)a3 + 2);
}

- (void)removeIndex:(int64_t)a3
{
  uint64_t v3;

  v3 = a3;
  std::__tree<long long>::__erase_unique<long long>((uint64_t)&self->super._underlying, &v3);
}

- (void)removeIndexes:(id)a3
{
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *begin_node;
  set<long long, std::less<long long>, std::allocator<long long> > *p_underlying;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *v7;
  BOOL v8;
  EFMutableInt64Set *v9;

  v9 = (EFMutableInt64Set *)a3;
  if (v9)
  {
    if (v9 == self)
    {
      std::__tree<long long>::destroy((uint64_t)&v9->super._underlying, (_QWORD *)v9->super._underlying.__tree_.__pair1_.__value_.__left_);
      v9->super._underlying.__tree_.__begin_node_ = &v9->super._underlying.__tree_.__pair1_;
      v9->super._underlying.__tree_.__pair1_.__value_.__left_ = 0;
      v9->super._underlying.__tree_.__pair3_.__value_ = 0;
    }
    else
    {
      begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *)v9->super._underlying.__tree_.__begin_node_;
      if (begin_node != &v9->super._underlying.__tree_.__pair1_)
      {
        p_underlying = &self->super._underlying;
        do
        {
          std::__tree<long long>::__erase_unique<long long>((uint64_t)p_underlying, (uint64_t *)&begin_node[4]);
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *)begin_node[1].__value_.__left_;
          if (left)
          {
            do
            {
              v7 = left;
              left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *)left->__value_.__left_;
            }
            while (left);
          }
          else
          {
            do
            {
              v7 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *)begin_node[2].__value_.__left_;
              v8 = v7->__value_.__left_ == begin_node;
              begin_node = v7;
            }
            while (!v8);
          }
          begin_node = v7;
        }
        while (v7 != &v9->super._underlying.__tree_.__pair1_);
      }
    }
  }

}

- (void)intersectIndexes:(id)a3
{
  id v4;
  void *v5;
  set<long long, std::less<long long>, std::allocator<long long> > *p_underlying;
  _QWORD *begin_node;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *p_pair1;
  _QWORD *left;
  _QWORD *v10;
  _QWORD *v11[2];
  _BYTE v12[32];

  v4 = a3;
  v5 = v4;
  if (v4 && *((_QWORD *)v4 + 3))
  {
    v11[0] = 0;
    v11[1] = 0;
    v10 = v11;
    begin_node = self->super._underlying.__tree_.__begin_node_;
    p_underlying = &self->super._underlying;
    std::__set_intersection[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void>,std::__tree_const_iterator<long long,std::__tree_node<long long,void *> *,long>,std::__tree_const_iterator<long long,std::__tree_node<long long,void *> *,long>,std::__tree_const_iterator<long long,std::__tree_node<long long,void *> *,long>,std::__tree_const_iterator<long long,std::__tree_node<long long,void *> *,long>,std::insert_iterator<std::set<long long>>>(begin_node, &p_underlying->__tree_.__pair1_.__value_.__left_, *((_QWORD **)v4 + 1), (_QWORD *)v4 + 2, (uint64_t)&v10, (uint64_t)v11, (uint64_t)v12);
    if (p_underlying != (set<long long, std::less<long long>, std::allocator<long long> > *)&v10)
      std::__tree<long long>::__assign_multi<std::__tree_const_iterator<long long,std::__tree_node<long long,void *> *,long>>((uint64_t **)p_underlying, v10, v11);
    std::__tree<long long>::destroy((uint64_t)&v10, v11[0]);
  }
  else
  {
    left = self->super._underlying.__tree_.__pair1_.__value_.__left_;
    p_pair1 = &self->super._underlying.__tree_.__pair1_;
    std::__tree<long long>::destroy((uint64_t)&p_pair1[-1], left);
    p_pair1[-1].__value_.__left_ = p_pair1;
    p_pair1->__value_.__left_ = 0;
    p_pair1[1].__value_.__left_ = 0;
  }

}

@end
