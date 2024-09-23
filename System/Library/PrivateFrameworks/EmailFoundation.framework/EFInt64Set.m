@implementation EFInt64Set

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 1) = (char *)self + 16;
  return self;
}

- (EFInt64Set)init
{
  EFInt64Set *v2;
  _QWORD **v4;
  _QWORD *v5[2];

  v5[0] = 0;
  v5[1] = 0;
  v4 = v5;
  v2 = -[EFInt64Set _initWithUnderlyingSet:](self, "_initWithUnderlyingSet:", &v4);
  std::__tree<long long>::destroy((uint64_t)&v4, v5[0]);
  return v2;
}

- (id)_initWithUnderlyingSet:(const void *)a3
{
  EFInt64Set *v4;
  uint64_t **p_underlying;
  BOOL v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)EFInt64Set;
  v4 = -[EFInt64Set init](&v8, sel_init);
  p_underlying = (uint64_t **)&v4->_underlying;
  if (v4)
    v6 = p_underlying == a3;
  else
    v6 = 1;
  if (!v6)
    std::__tree<long long>::__assign_multi<std::__tree_const_iterator<long long,std::__tree_node<long long,void *> *,long>>(p_underlying, *(_QWORD **)a3, (_QWORD *)a3 + 1);
  return v4;
}

- (void).cxx_destruct
{
  std::__tree<long long>::destroy((uint64_t)&self->_underlying, (_QWORD *)self->_underlying.__tree_.__pair1_.__value_.__left_);
}

- (id)_initWithIndexesInRange:(_EFInt64Range)a3
{
  unint64_t var1;
  int64_t var0;
  EFInt64Set *v5;
  uint64_t v6;
  uint64_t i;

  var1 = a3.var1;
  var0 = a3.var0;
  v5 = -[EFInt64Set init](self, "init");
  if (v5)
  {
    v6 = var0 + var1;
    for (i = var0; i < v6; ++i)
      std::__tree<long long>::__emplace_unique_key_args<long long,long long const&>((uint64_t **)&v5->_underlying, &i, &i);
  }
  return v5;
}

+ (id)indexSet
{
  return objc_alloc_init((Class)a1);
}

+ (id)indexSetWithIndexesInRange:(_EFInt64Range)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "_initWithIndexesInRange:", a3.var0, a3.var1);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v3;
  uint64_t v5[3];

  memset(v5, 170, sizeof(v5));
  std::set<long long>::set[abi:ne180100](v5, (uint64_t)&self->_underlying);
  v3 = -[EFInt64Set _initWithUnderlyingSet:]([EFMutableInt64Set alloc], "_initWithUnderlyingSet:", v5);
  std::__tree<long long>::destroy((uint64_t)v5, (_QWORD *)v5[1]);
  return v3;
}

- (BOOL)containsIndex:(int64_t)a3
{
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *p_pair1;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *v4;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *v6;
  int64_t v7;
  BOOL v8;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > **v9;

  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *)self->_underlying.__tree_.__pair1_.__value_.__left_;
  p_pair1 = &self->_underlying.__tree_.__pair1_;
  v4 = left;
  if (!left)
    goto LABEL_11;
  v6 = p_pair1;
  do
  {
    v7 = (int64_t)v4[4].__value_.__left_;
    v8 = v7 < a3;
    if (v7 >= a3)
      v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > **)v4;
    else
      v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > **)&v4[1];
    if (!v8)
      v6 = v4;
    v4 = *v9;
  }
  while (*v9);
  if (v6 == p_pair1 || (uint64_t)v6[4].__value_.__left_ > a3)
LABEL_11:
    v6 = p_pair1;
  return v6 != p_pair1;
}

- (unint64_t)count
{
  return self->_underlying.__tree_.__pair3_.__value_;
}

- (int64_t)firstIndex
{
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *begin_node;

  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *)self->_underlying.__tree_.__begin_node_;
  if (begin_node == &self->_underlying.__tree_.__pair1_)
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return (int64_t)begin_node[4].__value_.__left_;
}

- (int64_t)lastIndex
{
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *p_pair1;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > **left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > **v4;
  BOOL v5;

  p_pair1 = &self->_underlying.__tree_.__pair1_;
  if (&self->_underlying.__tree_.__pair1_ == self->_underlying.__tree_.__begin_node_)
    return 0x7FFFFFFFFFFFFFFFLL;
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > **)p_pair1->__value_.__left_;
  if (p_pair1->__value_.__left_)
  {
    do
    {
      v4 = left;
      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > **)left[1];
    }
    while (left);
  }
  else
  {
    do
    {
      v4 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > **)p_pair1[2].__value_.__left_;
      v5 = *v4 == p_pair1;
      p_pair1 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *)v4;
    }
    while (v5);
  }
  return (int64_t)v4[4];
}

- (unint64_t)getIndexes:(int64_t *)a3 maxCount:(unint64_t)a4 inIndexRange:(_EFInt64Range *)a5
{
  unint64_t result;
  int64_t v8;
  unint64_t v9;
  _QWORD v10[5];

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __47__EFInt64Set_getIndexes_maxCount_inIndexRange___block_invoke;
  v10[3] = &__block_descriptor_40_e11_v24__0Q8q16l;
  v10[4] = a3;
  result = -[EFInt64Set _enumerateIndexesInRange:maxCount:withBlock:](self, "_enumerateIndexesInRange:maxCount:withBlock:", a5, a4, v10);
  if (a5)
  {
    if (result)
    {
      v8 = a3[result - 1];
      v9 = a5->var0 + a5->var1 + ~v8;
      a5->var0 = v8 + 1;
      a5->var1 = v9;
    }
  }
  return result;
}

uint64_t __47__EFInt64Set_getIndexes_maxCount_inIndexRange___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 8 * a2) = a3;
  return result;
}

- (id)indexesInRange:(_EFInt64Range)a3
{
  return -[EFInt64Set lowestIndexesInRange:maxCount:](self, "lowestIndexesInRange:maxCount:", a3.var0, a3.var1, -1);
}

- (id)lowestIndexesInRange:(_EFInt64Range)a3 maxCount:(unint64_t)a4
{
  unint64_t var1;
  int64_t var0;
  EFInt64Set *v9;
  id v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *(*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  void *v17;
  _QWORD **v18;
  _QWORD *v19[2];
  _EFInt64Range v20;

  var1 = a3.var1;
  var0 = a3.var0;
  v20 = a3;
  if (-[EFInt64Set count](self, "count") <= a4
    && var0 <= -[EFInt64Set firstIndex](self, "firstIndex")
    && (uint64_t)(var1 + var0) > -[EFInt64Set lastIndex](self, "lastIndex"))
  {
    return (id)-[EFInt64Set copy](self, "copy");
  }
  v12 = 0;
  v13 = &v12;
  v14 = 0x4812000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v19[0] = 0;
  v19[1] = 0;
  v17 = &unk_1B10E80F5;
  v18 = v19;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __44__EFInt64Set_lowestIndexesInRange_maxCount___block_invoke;
  v11[3] = &unk_1E62A60B0;
  v11[4] = &v12;
  -[EFInt64Set _enumerateIndexesInRange:maxCount:withBlock:](self, "_enumerateIndexesInRange:maxCount:withBlock:", &v20, a4, v11);
  v9 = [EFInt64Set alloc];
  v10 = -[EFInt64Set _initWithUnderlyingSet:](v9, "_initWithUnderlyingSet:", v13 + 6);
  _Block_object_dispose(&v12, 8);
  std::__tree<long long>::destroy((uint64_t)&v18, v19[0]);
  return v10;
}

uint64_t *__44__EFInt64Set_lowestIndexesInRange_maxCount___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  v4 = a3;
  return std::__tree<long long>::__emplace_unique_key_args<long long,long long const&>((uint64_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48), &v4, &v4);
}

- (unint64_t)_enumerateIndexesInRange:(_EFInt64Range *)a3 maxCount:(unint64_t)a4 withBlock:(id)a5
{
  void (**v8)(id, unint64_t, _QWORD);
  unint64_t var1;
  int64_t var0;
  int64_t v11;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *v12;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *p_pair1;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *v15;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *v16;
  int64_t v17;
  BOOL v18;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > **v19;
  int64_t v20;
  BOOL v21;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > **v22;
  BOOL v23;
  unint64_t v25;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *v26;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *v27;

  v8 = (void (**)(id, unint64_t, _QWORD))a5;
  if (a3)
  {
    var1 = a3->var1;
    if (!var1)
    {
LABEL_24:
      v25 = 0;
      goto LABEL_25;
    }
    var0 = a3->var0;
    v11 = a3->var0 + var1 - 1;
  }
  else
  {
    v11 = 0x7FFFFFFFFFFFFFFELL;
    var0 = 0x8000000000000000;
  }
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *)self->_underlying.__tree_.__pair1_.__value_.__left_;
  p_pair1 = &self->_underlying.__tree_.__pair1_;
  v12 = left;
  if (!left)
    goto LABEL_24;
  v15 = p_pair1;
  v16 = v12;
  do
  {
    v17 = (int64_t)v16[4].__value_.__left_;
    v18 = v17 < var0;
    if (v17 >= var0)
      v19 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > **)v16;
    else
      v19 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > **)&v16[1];
    if (!v18)
      v15 = v16;
    v16 = *v19;
  }
  while (*v19);
  do
  {
    v20 = (int64_t)v12[4].__value_.__left_;
    v21 = v11 < v20;
    if (v11 >= v20)
      v22 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > **)&v12[1];
    else
      v22 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > **)v12;
    if (v21)
      p_pair1 = v12;
    v12 = *v22;
  }
  while (*v22);
  v23 = v15 == p_pair1 || a4 == 0;
  if (v23)
    goto LABEL_24;
  v25 = 0;
  do
  {
    ((void (**)(id, unint64_t, void *))v8)[2](v8, v25, v15[4].__value_.__left_);
    v26 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *)v15[1].__value_.__left_;
    if (v26)
    {
      do
      {
        v27 = v26;
        v26 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *)v26->__value_.__left_;
      }
      while (v26);
    }
    else
    {
      do
      {
        v27 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *)v15[2].__value_.__left_;
        v23 = v27->__value_.__left_ == v15;
        v15 = v27;
      }
      while (!v23);
    }
    ++v25;
    if (v27 == p_pair1)
      break;
    v15 = v27;
  }
  while (v25 < a4);
LABEL_25:

  return v25;
}

- (int64_t)indexGreaterThanIndex:(int64_t)a3
{
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *p_pair1;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *v4;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *v6;
  int64_t v7;
  BOOL v8;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > **v9;
  int64_t v10;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *v11;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *v12;
  BOOL v13;

  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *)self->_underlying.__tree_.__pair1_.__value_.__left_;
  p_pair1 = &self->_underlying.__tree_.__pair1_;
  v4 = left;
  if (!left)
    return 0x7FFFFFFFFFFFFFFFLL;
  v6 = p_pair1;
  do
  {
    v7 = (int64_t)v4[4].__value_.__left_;
    v8 = v7 < a3;
    if (v7 >= a3)
      v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > **)v4;
    else
      v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > **)&v4[1];
    if (!v8)
      v6 = v4;
    v4 = *v9;
  }
  while (*v9);
  if (v6 == p_pair1)
    return 0x7FFFFFFFFFFFFFFFLL;
  while (1)
  {
    v10 = (int64_t)v6[4].__value_.__left_;
    if (v10 != a3)
      break;
    v11 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *)v6[1].__value_.__left_;
    if (v11)
    {
      do
      {
        v12 = v11;
        v11 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *)v11->__value_.__left_;
      }
      while (v11);
    }
    else
    {
      do
      {
        v12 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *)v6[2].__value_.__left_;
        v13 = v12->__value_.__left_ == v6;
        v6 = v12;
      }
      while (!v13);
    }
    v6 = v12;
    if (v12 == p_pair1)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v10;
}

- (void)enumerateIndexesUsingBlock:(id)a3
{
  void (**v5)(id, void *, _BYTE *);
  uint64_t v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *begin_node;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *p_pair1;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *v14;
  BOOL v15;
  char v16;

  v5 = (void (**)(id, void *, _BYTE *))a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/EmailFoundation/Containers/EFInt64Set.mm");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    v8 = CFSTR("<Unknown File>");
    if (v6)
      v8 = (__CFString *)v6;
    v9 = v8;

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v9, 152, CFSTR("Invalid parameter not satisfying: %s"), "block", 0, 0, 0, 0);

  }
  v16 = 0;
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *)self->_underlying.__tree_.__begin_node_;
  p_pair1 = &self->_underlying.__tree_.__pair1_;
  if (begin_node != p_pair1)
  {
    do
    {
      v5[2](v5, begin_node[4].__value_.__left_, &v16);
      if (v16)
        break;
      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          v14 = left;
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *)left->__value_.__left_;
        }
        while (left);
      }
      else
      {
        do
        {
          v14 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *)begin_node[2].__value_.__left_;
          v15 = v14->__value_.__left_ == begin_node;
          begin_node = v14;
        }
        while (!v15);
      }
      begin_node = v14;
    }
    while (v14 != p_pair1);
  }

}

- (NSString)description
{
  void *v3;
  EFInt64Set *begin_node;
  EFInt64Set *isa;
  EFInt64Set *left;
  BOOL v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p> ["), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  begin_node = (EFInt64Set *)self->_underlying.__tree_.__begin_node_;
  if (begin_node != (EFInt64Set *)&self->_underlying.__tree_.__pair1_)
  {
    do
    {
      objc_msgSend(v3, "appendFormat:", CFSTR("%lld,"), begin_node[1].super.isa);
      isa = (EFInt64Set *)begin_node->_underlying.__tree_.__begin_node_;
      if (isa)
      {
        do
        {
          left = isa;
          isa = (EFInt64Set *)isa->super.isa;
        }
        while (isa);
      }
      else
      {
        do
        {
          left = (EFInt64Set *)begin_node->_underlying.__tree_.__pair1_.__value_.__left_;
          v7 = left->super.isa == (Class)begin_node;
          begin_node = left;
        }
        while (!v7);
      }
      begin_node = left;
    }
    while (left != (EFInt64Set *)&self->_underlying.__tree_.__pair1_);
  }
  objc_msgSend(v3, "appendString:", CFSTR("]"));
  return (NSString *)v3;
}

- (NSString)commaSeparatedString
{
  EFInt64Set *begin_node;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *p_pair1;
  __CFString *v4;
  EFInt64Set *isa;
  EFInt64Set *left;
  BOOL v7;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *v8;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *v9;

  begin_node = (EFInt64Set *)self->_underlying.__tree_.__begin_node_;
  p_pair1 = &self->_underlying.__tree_.__pair1_;
  if (begin_node == (EFInt64Set *)&self->_underlying.__tree_.__pair1_)
  {
    v4 = &stru_1E62A84D8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%lld"), begin_node[1].super.isa);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    isa = (EFInt64Set *)begin_node->_underlying.__tree_.__begin_node_;
    if (isa)
    {
      do
      {
        left = isa;
        isa = (EFInt64Set *)isa->super.isa;
      }
      while (isa);
    }
    else
    {
      do
      {
        left = (EFInt64Set *)begin_node->_underlying.__tree_.__pair1_.__value_.__left_;
        v7 = left->super.isa == (Class)begin_node;
        begin_node = left;
      }
      while (!v7);
    }
    if (left != (EFInt64Set *)p_pair1)
    {
      do
      {
        -[__CFString appendFormat:](v4, "appendFormat:", CFSTR(",%lld"), left[1].super.isa);
        v8 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *)left->_underlying.__tree_.__begin_node_;
        if (v8)
        {
          do
          {
            v9 = v8;
            v8 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *)v8->__value_.__left_;
          }
          while (v8);
        }
        else
        {
          do
          {
            v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<long long, void *> > > *)left->_underlying.__tree_.__pair1_.__value_.__left_;
            v7 = v9->__value_.__left_ == left;
            left = (EFInt64Set *)v9;
          }
          while (!v7);
        }
        left = (EFInt64Set *)v9;
      }
      while (v9 != p_pair1);
    }
  }
  return (NSString *)v4;
}

- (NSString)ef_SQLExpression
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFInt64Set ef_renderSQLExpressionInto:](self, "ef_renderSQLExpressionInto:", v3);
  return (NSString *)v3;
}

- (void)ef_renderSQLExpressionInto:(id)a3 conjoiner:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD *v13;
  _QWORD v14[3];
  char v15;

  v6 = a3;
  v7 = a4;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v15 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__EFInt64Set_EFSQLExpressable__ef_renderSQLExpressionInto_conjoiner___block_invoke;
  v10[3] = &unk_1E62A7128;
  v12 = v7;
  v13 = v14;
  v11 = v6;
  v8 = v7;
  v9 = v6;
  -[EFInt64Set enumerateIndexesUsingBlock:](self, "enumerateIndexesUsingBlock:", v10);

  _Block_object_dispose(v14, 8);
}

uint64_t __69__EFInt64Set_EFSQLExpressable__ef_renderSQLExpressionInto_conjoiner___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v4 + 24))
    objc_msgSend(*(id *)(a1 + 32), "appendString:", *(_QWORD *)(a1 + 40));
  else
    *(_BYTE *)(v4 + 24) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%lld"), a2);
}

- (void)ef_renderSQLExpressionInto:(id)a3
{
  -[EFInt64Set ef_renderSQLExpressionInto:conjoiner:](self, "ef_renderSQLExpressionInto:conjoiner:", a3, CFSTR(", "));
}

- (id)ef_SQLIsolatedExpression
{
  return +[EFParenthesizedSQLExpression parenthesizedValueCollectionExpressable:](EFParenthesizedSQLExpression, "parenthesizedValueCollectionExpressable:", self);
}

@end
