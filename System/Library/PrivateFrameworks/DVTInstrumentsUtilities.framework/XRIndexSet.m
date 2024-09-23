@implementation XRIndexSet

- (XRIndexSet)initWithIndex:(unint64_t)a3
{
  XRIndexSet *v4;
  XRIndexSet *v5;
  objc_super v7;
  __int128 v8;

  v7.receiver = self;
  v7.super_class = (Class)XRIndexSet;
  v4 = -[XRIndexSet init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    *(_QWORD *)&v8 = a3;
    *((_QWORD *)&v8 + 1) = a3;
    sub_2263547C0((uint64_t)&v4->_impl, &v8);
    v5->_impl._cacheIsValid = 0;
    sub_22635398C((uint64_t)&v5->_impl);
  }
  return v5;
}

- (XRIndexSet)initWithIndexes:(_XRIndexRange)a3
{
  unint64_t var1;
  unint64_t var0;
  XRIndexSet *v5;
  XRIndexSet *v6;
  uint64_t p_impl;
  objc_super v9;
  __int128 v10;

  var1 = a3.var1;
  var0 = a3.var0;
  v9.receiver = self;
  v9.super_class = (Class)XRIndexSet;
  v5 = -[XRIndexSet init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    p_impl = (uint64_t)&v5->_impl;
    if (var1)
    {
      *(_QWORD *)&v10 = var0;
      *((_QWORD *)&v10 + 1) = var0 + var1 - 1;
      sub_2263547C0((uint64_t)&v5->_impl, &v10);
      v6->_impl._cacheIsValid = 0;
    }
    sub_22635398C(p_impl);
  }
  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  XRMutableIndexSet *v4;
  id v5;

  v4 = objc_alloc_init(XRMutableIndexSet);
  v5 = sub_226353B00(v4, self);
  return v4;
}

+ (id)indexSetWithIndex:(unint64_t)a3
{
  XRIndexSet *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = [XRIndexSet alloc];
  return (id)objc_msgSend_initWithIndex_(v4, v5, a3, v6, v7);
}

+ (id)indexSetWithIndexesInRange:(_XRIndexRange)a3
{
  unint64_t var1;
  unint64_t var0;
  XRIndexSet *v5;
  const char *v6;
  uint64_t v7;

  var1 = a3.var1;
  var0 = a3.var0;
  v5 = [XRIndexSet alloc];
  return (id)objc_msgSend_initWithIndexes_(v5, v6, var0, var1, v7);
}

- (BOOL)isEmpty
{
  return self->_impl._ranges.__tree_.__pair3_.__value_ == 0;
}

- (unint64_t)count
{
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<xray::internal::RangeImp<unsigned long long>, void *>>> *p_pair1;
  XRIndexSet *begin_node;
  unint64_t result;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<xray::internal::RangeImp<unsigned long long>, void *>>> *left;
  XRIndexSet *v6;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<xray::internal::RangeImp<unsigned long long>, void *>>> *v7;
  BOOL v8;

  p_pair1 = &self->_impl._ranges.__tree_.__pair1_;
  begin_node = (XRIndexSet *)self->_impl._ranges.__tree_.__begin_node_;
  if (begin_node == (XRIndexSet *)&self->_impl._ranges.__tree_.__pair1_)
    return 0;
  result = 0;
  do
  {
    left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<xray::internal::RangeImp<unsigned long long>, void *>>> *)begin_node->_impl._ranges.__tree_.__begin_node_;
    v6 = begin_node;
    if (left)
    {
      do
      {
        v7 = left;
        left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<xray::internal::RangeImp<unsigned long long>, void *>>> *)left->__value_.__left_;
      }
      while (left);
    }
    else
    {
      do
      {
        v7 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<xray::internal::RangeImp<unsigned long long>, void *>>> *)v6->_impl._ranges.__tree_.__pair1_.__value_.__left_;
        v8 = v7->__value_.__left_ == v6;
        v6 = (XRIndexSet *)v7;
      }
      while (!v8);
    }
    result = result + begin_node->_impl._cache.__elems_[0].last - begin_node->_impl._cache.__elems_[0].first + 1;
    begin_node = (XRIndexSet *)v7;
  }
  while (v7 != p_pair1);
  return result;
}

- (BOOL)countEquals:(unint64_t)a3
{
  XRIndexSet *begin_node;
  unint64_t v4;
  BOOL v5;
  XRIndexSet *isa;
  XRIndexSet *left;
  BOOL v8;

  begin_node = (XRIndexSet *)self->_impl._ranges.__tree_.__begin_node_;
  if (begin_node == (XRIndexSet *)&self->_impl._ranges.__tree_.__pair1_)
  {
    v4 = 0;
    v5 = 1;
  }
  else
  {
    v4 = 0;
    do
    {
      v4 = v4 + begin_node->_impl._cache.__elems_[0].last - begin_node->_impl._cache.__elems_[0].first + 1;
      v5 = v4 <= a3;
      if (v4 > a3)
        break;
      isa = (XRIndexSet *)begin_node->_impl._ranges.__tree_.__begin_node_;
      if (isa)
      {
        do
        {
          left = isa;
          isa = (XRIndexSet *)isa->super.isa;
        }
        while (isa);
      }
      else
      {
        do
        {
          left = (XRIndexSet *)begin_node->_impl._ranges.__tree_.__pair1_.__value_.__left_;
          v8 = left->super.isa == (Class)begin_node;
          begin_node = left;
        }
        while (!v8);
      }
      begin_node = left;
    }
    while (left != (XRIndexSet *)&self->_impl._ranges.__tree_.__pair1_);
  }
  return v4 == a3 && v5;
}

- (unint64_t)firstIndex
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v8;
  const char *v9;

  if (!self->_impl._ranges.__tree_.__pair3_.__value_)
  {
    objc_msgSend_currentHandler(MEMORY[0x24BDD1448], a2, v2, v3, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v9, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("XRIndexSet.mm"), 91, CFSTR("firstIndex called on empty index set"));

  }
  return *((_QWORD *)self->_impl._ranges.__tree_.__begin_node_ + 4);
}

- (unint64_t)lastIndex
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v8;
  const char *v9;

  if (!self->_impl._ranges.__tree_.__pair3_.__value_)
  {
    objc_msgSend_currentHandler(MEMORY[0x24BDD1448], a2, v2, v3, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v9, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("XRIndexSet.mm"), 96, CFSTR("lastIndex called on empty index set"));

  }
  return sub_226353E00((uint64_t)&self->_impl);
}

- (BOOL)containsIndex:(unint64_t)a3
{
  return sub_226353EA0((uint64_t)&self->_impl, a3);
}

- (BOOL)intersectsIndexesInRange:(_XRIndexRange)a3
{
  return sub_226353F5C((uint64_t)&self->_impl, a3.var0, a3.var1);
}

- (void)enumerateIndexesUsingBlock:(id)a3
{
  void (**v4)(_QWORD);
  XRIndexSet *begin_node;
  unint64_t first;
  _QWORD v8[2];
  unint64_t v9;
  char v10;

  v4 = (void (**)(_QWORD))a3;
  v10 = 0;
  begin_node = (XRIndexSet *)self->_impl._ranges.__tree_.__begin_node_;
  v8[0] = begin_node;
  v8[1] = &self->_impl._ranges.__tree_.__pair1_;
  if (begin_node == (XRIndexSet *)&self->_impl._ranges.__tree_.__pair1_)
    first = 0;
  else
    first = begin_node->_impl._cache.__elems_[0].first;
  v9 = first;
  while ((__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<xray::internal::RangeImp<unsigned long long>, void *>>> *)v8[0] != &self->_impl._ranges.__tree_.__pair1_
       || v9 != 0)
  {
    v4[2](v4);
    if (v10)
      break;
    sub_226354064(v8);
  }

}

- (void)enumerateRangesUsingBlock:(id)a3
{
  void (**v4)(_QWORD);
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<xray::internal::RangeImp<unsigned long long>, void *>>> *p_pair1;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<xray::internal::RangeImp<unsigned long long>, void *>>> *begin_node;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<xray::internal::RangeImp<unsigned long long>, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<xray::internal::RangeImp<unsigned long long>, void *>>> *v8;
  BOOL v9;

  v4 = (void (**)(_QWORD))a3;
  p_pair1 = &self->_impl._ranges.__tree_.__pair1_;
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<xray::internal::RangeImp<unsigned long long>, void *>>> *)self->_impl._ranges.__tree_.__begin_node_;
  if (begin_node != p_pair1)
  {
    do
    {
      v4[2](v4);
      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<xray::internal::RangeImp<unsigned long long>, void *>>> *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          v8 = left;
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<xray::internal::RangeImp<unsigned long long>, void *>>> *)left->__value_.__left_;
        }
        while (left);
      }
      else
      {
        do
        {
          v8 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<xray::internal::RangeImp<unsigned long long>, void *>>> *)begin_node[2].__value_.__left_;
          v9 = v8->__value_.__left_ == begin_node;
          begin_node = v8;
        }
        while (!v9);
      }
      begin_node = v8;
    }
    while (v8 != p_pair1);
  }

}

- (void).cxx_destruct
{
  sub_2263546F0((uint64_t)&self->_impl, (_QWORD *)self->_impl._ranges.__tree_.__pair1_.__value_.__left_);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 1) = (char *)self + 16;
  *((_BYTE *)self + 96) = 0;
  return self;
}

@end
